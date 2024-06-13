#casbin_rule
INSERT INTO `gva`.`casbin_rule`(`id`, `ptype`, `v0`, `v1`, `v2`, `v3`, `v4`, `v5`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `ptype`=?, `v0`=?, `v1`=?, `v2`=?, `v3`=?, `v4`=?, `v5`=?;
SELECT `id`, `ptype`, `v0`, `v1`, `v2`, `v3`, `v4`, `v5` FROM `gva`.`casbin_rule` WHERE `id`=?;
UPDATE `gva`.`casbin_rule` SET `id`=?, `ptype`=?, `v0`=?, `v1`=?, `v2`=?, `v3`=?, `v4`=?, `v5`=? WHERE `id`=?;
type Casbin_rule struct {
	Id int `json:"id,omitempty"`
	Ptype string `json:"ptype,omitempty"`
	V0 string `json:"v0,omitempty"`
	V1 string `json:"v1,omitempty"`
	V2 string `json:"v2,omitempty"`
	V3 string `json:"v3,omitempty"`
	V4 string `json:"v4,omitempty"`
	V5 string `json:"v5,omitempty"`
}
func I_casbin_rules(cs []Casbin_rule) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`casbin_rule`(`id`, `ptype`, `v0`, `v1`, `v2`, `v3`, `v4`, `v5`) VALUES")
	sqlArgs := []interface{}{}
	for i, c := range cs {
		if i < len(cs)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, c.Id, c.Ptype, c.V0, c.V1, c.V2, c.V3, c.V4, c.V5)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_casbin_rule(c *Casbin_rule) (cs []Casbin_rule, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `ptype`, `v0`, `v1`, `v2`, `v3`, `v4`, `v5` FROM `gva`.`casbin_rule` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if c.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, c.Id)
	}
	if c.Ptype != "" {
		sqlBuf.WriteString("AND `ptype`=? ")
		sqlArgs = append(sqlArgs, c.Ptype)
	}
	if c.V0 != "" {
		sqlBuf.WriteString("AND `v0`=? ")
		sqlArgs = append(sqlArgs, c.V0)
	}
	if c.V1 != "" {
		sqlBuf.WriteString("AND `v1`=? ")
		sqlArgs = append(sqlArgs, c.V1)
	}
	if c.V2 != "" {
		sqlBuf.WriteString("AND `v2`=? ")
		sqlArgs = append(sqlArgs, c.V2)
	}
	if c.V3 != "" {
		sqlBuf.WriteString("AND `v3`=? ")
		sqlArgs = append(sqlArgs, c.V3)
	}
	if c.V4 != "" {
		sqlBuf.WriteString("AND `v4`=? ")
		sqlArgs = append(sqlArgs, c.V4)
	}
	if c.V5 != "" {
		sqlBuf.WriteString("AND `v5`=? ")
		sqlArgs = append(sqlArgs, c.V5)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &cs)
	return
}
func IU_casbin_rule(c *Casbin_rule) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`casbin_rule`(`id`, `ptype`, `v0`, `v1`, `v2`, `v3`, `v4`, `v5`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{c.Id, c.Ptype, c.V0, c.V1, c.V2, c.V3, c.V4, c.V5}
	if c.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, c.Id)
	}
	if c.Ptype != "" {
		sqlBuf.WriteString("`ptype`=?,")
		sqlArgs = append(sqlArgs, c.Ptype)
	}
	if c.V0 != "" {
		sqlBuf.WriteString("`v0`=?,")
		sqlArgs = append(sqlArgs, c.V0)
	}
	if c.V1 != "" {
		sqlBuf.WriteString("`v1`=?,")
		sqlArgs = append(sqlArgs, c.V1)
	}
	if c.V2 != "" {
		sqlBuf.WriteString("`v2`=?,")
		sqlArgs = append(sqlArgs, c.V2)
	}
	if c.V3 != "" {
		sqlBuf.WriteString("`v3`=?,")
		sqlArgs = append(sqlArgs, c.V3)
	}
	if c.V4 != "" {
		sqlBuf.WriteString("`v4`=?,")
		sqlArgs = append(sqlArgs, c.V4)
	}
	if c.V5 != "" {
		sqlBuf.WriteString("`v5`=?,")
		sqlArgs = append(sqlArgs, c.V5)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#exa_customers
INSERT INTO `gva`.`exa_customers`(`id`, `created_at`, `updated_at`, `deleted_at`, `customer_name`, `customer_phone_data`, `sys_user_id`, `sys_user_authority_id`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `customer_name`=?, `customer_phone_data`=?, `sys_user_id`=?, `sys_user_authority_id`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `customer_name`, `customer_phone_data`, `sys_user_id`, `sys_user_authority_id` FROM `gva`.`exa_customers` WHERE `id`=?;
UPDATE `gva`.`exa_customers` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `customer_name`=?, `customer_phone_data`=?, `sys_user_id`=?, `sys_user_authority_id`=? WHERE `id`=?;
type Exa_customers struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Customer_name string `json:"customer_name,omitempty"`
	Customer_phone_data string `json:"customer_phone_data,omitempty"`
	Sys_user_id int `json:"sys_user_id,omitempty"`
	Sys_user_authority_id int `json:"sys_user_authority_id,omitempty"`
}
func I_exa_customerss(es []Exa_customers) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`exa_customers`(`id`, `created_at`, `updated_at`, `deleted_at`, `customer_name`, `customer_phone_data`, `sys_user_id`, `sys_user_authority_id`) VALUES")
	sqlArgs := []interface{}{}
	for i, e := range es {
		if i < len(es)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, e.Id, e.Created_at, e.Updated_at, e.Deleted_at, e.Customer_name, e.Customer_phone_data, e.Sys_user_id, e.Sys_user_authority_id)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_exa_customers(e *Exa_customers) (es []Exa_customers, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `customer_name`, `customer_phone_data`, `sys_user_id`, `sys_user_authority_id` FROM `gva`.`exa_customers` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if e.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, e.Id)
	}
	if e.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, e.Created_at)
	}
	if e.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, e.Updated_at)
	}
	if e.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, e.Deleted_at)
	}
	if e.Customer_name != "" {
		sqlBuf.WriteString("AND `customer_name`=? ")
		sqlArgs = append(sqlArgs, e.Customer_name)
	}
	if e.Customer_phone_data != "" {
		sqlBuf.WriteString("AND `customer_phone_data`=? ")
		sqlArgs = append(sqlArgs, e.Customer_phone_data)
	}
	if e.Sys_user_id != 0 {
		sqlBuf.WriteString("AND `sys_user_id`=? ")
		sqlArgs = append(sqlArgs, e.Sys_user_id)
	}
	if e.Sys_user_authority_id != 0 {
		sqlBuf.WriteString("AND `sys_user_authority_id`=? ")
		sqlArgs = append(sqlArgs, e.Sys_user_authority_id)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &es)
	return
}
func IU_exa_customers(e *Exa_customers) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`exa_customers`(`id`, `created_at`, `updated_at`, `deleted_at`, `customer_name`, `customer_phone_data`, `sys_user_id`, `sys_user_authority_id`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{e.Id, e.Created_at, e.Updated_at, e.Deleted_at, e.Customer_name, e.Customer_phone_data, e.Sys_user_id, e.Sys_user_authority_id}
	if e.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, e.Id)
	}
	if e.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, e.Created_at)
	}
	if e.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, e.Updated_at)
	}
	if e.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, e.Deleted_at)
	}
	if e.Customer_name != "" {
		sqlBuf.WriteString("`customer_name`=?,")
		sqlArgs = append(sqlArgs, e.Customer_name)
	}
	if e.Customer_phone_data != "" {
		sqlBuf.WriteString("`customer_phone_data`=?,")
		sqlArgs = append(sqlArgs, e.Customer_phone_data)
	}
	if e.Sys_user_id != 0 {
		sqlBuf.WriteString("`sys_user_id`=?,")
		sqlArgs = append(sqlArgs, e.Sys_user_id)
	}
	if e.Sys_user_authority_id != 0 {
		sqlBuf.WriteString("`sys_user_authority_id`=?,")
		sqlArgs = append(sqlArgs, e.Sys_user_authority_id)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#exa_file_chunks
INSERT INTO `gva`.`exa_file_chunks`(`id`, `created_at`, `updated_at`, `deleted_at`, `exa_file_id`, `file_chunk_number`, `file_chunk_path`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `exa_file_id`=?, `file_chunk_number`=?, `file_chunk_path`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `exa_file_id`, `file_chunk_number`, `file_chunk_path` FROM `gva`.`exa_file_chunks` WHERE `id`=?;
UPDATE `gva`.`exa_file_chunks` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `exa_file_id`=?, `file_chunk_number`=?, `file_chunk_path`=? WHERE `id`=?;
type Exa_file_chunks struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Exa_file_id int `json:"exa_file_id,omitempty"`
	File_chunk_number int `json:"file_chunk_number,omitempty"`
	File_chunk_path string `json:"file_chunk_path,omitempty"`
}
func I_exa_file_chunkss(es []Exa_file_chunks) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`exa_file_chunks`(`id`, `created_at`, `updated_at`, `deleted_at`, `exa_file_id`, `file_chunk_number`, `file_chunk_path`) VALUES")
	sqlArgs := []interface{}{}
	for i, e := range es {
		if i < len(es)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, e.Id, e.Created_at, e.Updated_at, e.Deleted_at, e.Exa_file_id, e.File_chunk_number, e.File_chunk_path)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_exa_file_chunks(e *Exa_file_chunks) (es []Exa_file_chunks, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `exa_file_id`, `file_chunk_number`, `file_chunk_path` FROM `gva`.`exa_file_chunks` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if e.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, e.Id)
	}
	if e.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, e.Created_at)
	}
	if e.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, e.Updated_at)
	}
	if e.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, e.Deleted_at)
	}
	if e.Exa_file_id != 0 {
		sqlBuf.WriteString("AND `exa_file_id`=? ")
		sqlArgs = append(sqlArgs, e.Exa_file_id)
	}
	if e.File_chunk_number != 0 {
		sqlBuf.WriteString("AND `file_chunk_number`=? ")
		sqlArgs = append(sqlArgs, e.File_chunk_number)
	}
	if e.File_chunk_path != "" {
		sqlBuf.WriteString("AND `file_chunk_path`=? ")
		sqlArgs = append(sqlArgs, e.File_chunk_path)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &es)
	return
}
func IU_exa_file_chunks(e *Exa_file_chunks) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`exa_file_chunks`(`id`, `created_at`, `updated_at`, `deleted_at`, `exa_file_id`, `file_chunk_number`, `file_chunk_path`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{e.Id, e.Created_at, e.Updated_at, e.Deleted_at, e.Exa_file_id, e.File_chunk_number, e.File_chunk_path}
	if e.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, e.Id)
	}
	if e.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, e.Created_at)
	}
	if e.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, e.Updated_at)
	}
	if e.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, e.Deleted_at)
	}
	if e.Exa_file_id != 0 {
		sqlBuf.WriteString("`exa_file_id`=?,")
		sqlArgs = append(sqlArgs, e.Exa_file_id)
	}
	if e.File_chunk_number != 0 {
		sqlBuf.WriteString("`file_chunk_number`=?,")
		sqlArgs = append(sqlArgs, e.File_chunk_number)
	}
	if e.File_chunk_path != "" {
		sqlBuf.WriteString("`file_chunk_path`=?,")
		sqlArgs = append(sqlArgs, e.File_chunk_path)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#exa_file_upload_and_downloads
INSERT INTO `gva`.`exa_file_upload_and_downloads`(`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `name`=?, `url`=?, `tag`=?, `key`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key` FROM `gva`.`exa_file_upload_and_downloads` WHERE `id`=?;
UPDATE `gva`.`exa_file_upload_and_downloads` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `name`=?, `url`=?, `tag`=?, `key`=? WHERE `id`=?;
type Exa_file_upload_and_downloads struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Name string `json:"name,omitempty"`
	Url string `json:"url,omitempty"`
	Tag string `json:"tag,omitempty"`
	Key string `json:"key,omitempty"`
}
func I_exa_file_upload_and_downloadss(es []Exa_file_upload_and_downloads) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`exa_file_upload_and_downloads`(`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES")
	sqlArgs := []interface{}{}
	for i, e := range es {
		if i < len(es)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, e.Id, e.Created_at, e.Updated_at, e.Deleted_at, e.Name, e.Url, e.Tag, e.Key)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_exa_file_upload_and_downloads(e *Exa_file_upload_and_downloads) (es []Exa_file_upload_and_downloads, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key` FROM `gva`.`exa_file_upload_and_downloads` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if e.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, e.Id)
	}
	if e.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, e.Created_at)
	}
	if e.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, e.Updated_at)
	}
	if e.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, e.Deleted_at)
	}
	if e.Name != "" {
		sqlBuf.WriteString("AND `name`=? ")
		sqlArgs = append(sqlArgs, e.Name)
	}
	if e.Url != "" {
		sqlBuf.WriteString("AND `url`=? ")
		sqlArgs = append(sqlArgs, e.Url)
	}
	if e.Tag != "" {
		sqlBuf.WriteString("AND `tag`=? ")
		sqlArgs = append(sqlArgs, e.Tag)
	}
	if e.Key != "" {
		sqlBuf.WriteString("AND `key`=? ")
		sqlArgs = append(sqlArgs, e.Key)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &es)
	return
}
func IU_exa_file_upload_and_downloads(e *Exa_file_upload_and_downloads) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`exa_file_upload_and_downloads`(`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{e.Id, e.Created_at, e.Updated_at, e.Deleted_at, e.Name, e.Url, e.Tag, e.Key}
	if e.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, e.Id)
	}
	if e.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, e.Created_at)
	}
	if e.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, e.Updated_at)
	}
	if e.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, e.Deleted_at)
	}
	if e.Name != "" {
		sqlBuf.WriteString("`name`=?,")
		sqlArgs = append(sqlArgs, e.Name)
	}
	if e.Url != "" {
		sqlBuf.WriteString("`url`=?,")
		sqlArgs = append(sqlArgs, e.Url)
	}
	if e.Tag != "" {
		sqlBuf.WriteString("`tag`=?,")
		sqlArgs = append(sqlArgs, e.Tag)
	}
	if e.Key != "" {
		sqlBuf.WriteString("`key`=?,")
		sqlArgs = append(sqlArgs, e.Key)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#exa_files
INSERT INTO `gva`.`exa_files`(`id`, `created_at`, `updated_at`, `deleted_at`, `file_name`, `file_md5`, `file_path`, `chunk_total`, `is_finish`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `file_name`=?, `file_md5`=?, `file_path`=?, `chunk_total`=?, `is_finish`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `file_name`, `file_md5`, `file_path`, `chunk_total`, `is_finish` FROM `gva`.`exa_files` WHERE `id`=?;
UPDATE `gva`.`exa_files` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `file_name`=?, `file_md5`=?, `file_path`=?, `chunk_total`=?, `is_finish`=? WHERE `id`=?;
type Exa_files struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	File_name string `json:"file_name,omitempty"`
	File_md5 string `json:"file_md5,omitempty"`
	File_path string `json:"file_path,omitempty"`
	Chunk_total int `json:"chunk_total,omitempty"`
	Is_finish int `json:"is_finish,omitempty"`
}
func I_exa_filess(es []Exa_files) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`exa_files`(`id`, `created_at`, `updated_at`, `deleted_at`, `file_name`, `file_md5`, `file_path`, `chunk_total`, `is_finish`) VALUES")
	sqlArgs := []interface{}{}
	for i, e := range es {
		if i < len(es)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, e.Id, e.Created_at, e.Updated_at, e.Deleted_at, e.File_name, e.File_md5, e.File_path, e.Chunk_total, e.Is_finish)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_exa_files(e *Exa_files) (es []Exa_files, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `file_name`, `file_md5`, `file_path`, `chunk_total`, `is_finish` FROM `gva`.`exa_files` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if e.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, e.Id)
	}
	if e.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, e.Created_at)
	}
	if e.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, e.Updated_at)
	}
	if e.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, e.Deleted_at)
	}
	if e.File_name != "" {
		sqlBuf.WriteString("AND `file_name`=? ")
		sqlArgs = append(sqlArgs, e.File_name)
	}
	if e.File_md5 != "" {
		sqlBuf.WriteString("AND `file_md5`=? ")
		sqlArgs = append(sqlArgs, e.File_md5)
	}
	if e.File_path != "" {
		sqlBuf.WriteString("AND `file_path`=? ")
		sqlArgs = append(sqlArgs, e.File_path)
	}
	if e.Chunk_total != 0 {
		sqlBuf.WriteString("AND `chunk_total`=? ")
		sqlArgs = append(sqlArgs, e.Chunk_total)
	}
	if e.Is_finish != 0 {
		sqlBuf.WriteString("AND `is_finish`=? ")
		sqlArgs = append(sqlArgs, e.Is_finish)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &es)
	return
}
func IU_exa_files(e *Exa_files) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`exa_files`(`id`, `created_at`, `updated_at`, `deleted_at`, `file_name`, `file_md5`, `file_path`, `chunk_total`, `is_finish`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{e.Id, e.Created_at, e.Updated_at, e.Deleted_at, e.File_name, e.File_md5, e.File_path, e.Chunk_total, e.Is_finish}
	if e.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, e.Id)
	}
	if e.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, e.Created_at)
	}
	if e.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, e.Updated_at)
	}
	if e.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, e.Deleted_at)
	}
	if e.File_name != "" {
		sqlBuf.WriteString("`file_name`=?,")
		sqlArgs = append(sqlArgs, e.File_name)
	}
	if e.File_md5 != "" {
		sqlBuf.WriteString("`file_md5`=?,")
		sqlArgs = append(sqlArgs, e.File_md5)
	}
	if e.File_path != "" {
		sqlBuf.WriteString("`file_path`=?,")
		sqlArgs = append(sqlArgs, e.File_path)
	}
	if e.Chunk_total != 0 {
		sqlBuf.WriteString("`chunk_total`=?,")
		sqlArgs = append(sqlArgs, e.Chunk_total)
	}
	if e.Is_finish != 0 {
		sqlBuf.WriteString("`is_finish`=?,")
		sqlArgs = append(sqlArgs, e.Is_finish)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#jwt_blacklists
INSERT INTO `gva`.`jwt_blacklists`(`id`, `created_at`, `updated_at`, `deleted_at`, `jwt`) VALUES(?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `jwt`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `jwt` FROM `gva`.`jwt_blacklists` WHERE `id`=?;
UPDATE `gva`.`jwt_blacklists` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `jwt`=? WHERE `id`=?;
type Jwt_blacklists struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Jwt string `json:"jwt,omitempty"`
}
func I_jwt_blacklistss(js []Jwt_blacklists) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`jwt_blacklists`(`id`, `created_at`, `updated_at`, `deleted_at`, `jwt`) VALUES")
	sqlArgs := []interface{}{}
	for i, j := range js {
		if i < len(js)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, j.Id, j.Created_at, j.Updated_at, j.Deleted_at, j.Jwt)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_jwt_blacklists(j *Jwt_blacklists) (js []Jwt_blacklists, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `jwt` FROM `gva`.`jwt_blacklists` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if j.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, j.Id)
	}
	if j.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, j.Created_at)
	}
	if j.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, j.Updated_at)
	}
	if j.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, j.Deleted_at)
	}
	if j.Jwt != "" {
		sqlBuf.WriteString("AND `jwt`=? ")
		sqlArgs = append(sqlArgs, j.Jwt)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &js)
	return
}
func IU_jwt_blacklists(j *Jwt_blacklists) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`jwt_blacklists`(`id`, `created_at`, `updated_at`, `deleted_at`, `jwt`) VALUES(?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{j.Id, j.Created_at, j.Updated_at, j.Deleted_at, j.Jwt}
	if j.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, j.Id)
	}
	if j.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, j.Created_at)
	}
	if j.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, j.Updated_at)
	}
	if j.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, j.Deleted_at)
	}
	if j.Jwt != "" {
		sqlBuf.WriteString("`jwt`=?,")
		sqlArgs = append(sqlArgs, j.Jwt)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_apis
INSERT INTO `gva`.`sys_apis`(`id`, `created_at`, `updated_at`, `deleted_at`, `path`, `description`, `api_group`, `method`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `path`=?, `description`=?, `api_group`=?, `method`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `path`, `description`, `api_group`, `method` FROM `gva`.`sys_apis` WHERE `id`=?;
UPDATE `gva`.`sys_apis` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `path`=?, `description`=?, `api_group`=?, `method`=? WHERE `id`=?;
type Sys_apis struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Path string `json:"path,omitempty"`
	Description string `json:"description,omitempty"`
	Api_group string `json:"api_group,omitempty"`
	Method string `json:"method,omitempty"`
}
func I_sys_apiss(ss []Sys_apis) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_apis`(`id`, `created_at`, `updated_at`, `deleted_at`, `path`, `description`, `api_group`, `method`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Path, s.Description, s.Api_group, s.Method)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_apis(s *Sys_apis) (ss []Sys_apis, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `path`, `description`, `api_group`, `method` FROM `gva`.`sys_apis` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Path != "" {
		sqlBuf.WriteString("AND `path`=? ")
		sqlArgs = append(sqlArgs, s.Path)
	}
	if s.Description != "" {
		sqlBuf.WriteString("AND `description`=? ")
		sqlArgs = append(sqlArgs, s.Description)
	}
	if s.Api_group != "" {
		sqlBuf.WriteString("AND `api_group`=? ")
		sqlArgs = append(sqlArgs, s.Api_group)
	}
	if s.Method != "" {
		sqlBuf.WriteString("AND `method`=? ")
		sqlArgs = append(sqlArgs, s.Method)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_apis(s *Sys_apis) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_apis`(`id`, `created_at`, `updated_at`, `deleted_at`, `path`, `description`, `api_group`, `method`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Path, s.Description, s.Api_group, s.Method}
	if s.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Path != "" {
		sqlBuf.WriteString("`path`=?,")
		sqlArgs = append(sqlArgs, s.Path)
	}
	if s.Description != "" {
		sqlBuf.WriteString("`description`=?,")
		sqlArgs = append(sqlArgs, s.Description)
	}
	if s.Api_group != "" {
		sqlBuf.WriteString("`api_group`=?,")
		sqlArgs = append(sqlArgs, s.Api_group)
	}
	if s.Method != "" {
		sqlBuf.WriteString("`method`=?,")
		sqlArgs = append(sqlArgs, s.Method)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_authorities
INSERT INTO `gva`.`sys_authorities`(`created_at`, `updated_at`, `deleted_at`, `authority_id`, `authority_name`, `parent_id`, `default_router`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `authority_name`=?, `parent_id`=?, `default_router`=?;
SELECT `created_at`, `updated_at`, `deleted_at`, `authority_id`, `authority_name`, `parent_id`, `default_router` FROM `gva`.`sys_authorities` WHERE `authority_id`=?;
UPDATE `gva`.`sys_authorities` SET `created_at`=?, `updated_at`=?, `deleted_at`=?, `authority_id`=?, `authority_name`=?, `parent_id`=?, `default_router`=? WHERE `authority_id`=?;
type Sys_authorities struct {
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Authority_id int `json:"authority_id,omitempty"`
	Authority_name string `json:"authority_name,omitempty"`
	Parent_id int `json:"parent_id,omitempty"`
	Default_router string `json:"default_router,omitempty"`
}
func I_sys_authoritiess(ss []Sys_authorities) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_authorities`(`created_at`, `updated_at`, `deleted_at`, `authority_id`, `authority_name`, `parent_id`, `default_router`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Created_at, s.Updated_at, s.Deleted_at, s.Authority_id, s.Authority_name, s.Parent_id, s.Default_router)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_authorities(s *Sys_authorities) (ss []Sys_authorities, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `created_at`, `updated_at`, `deleted_at`, `authority_id`, `authority_name`, `parent_id`, `default_router` FROM `gva`.`sys_authorities` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Authority_id != 0 {
		sqlBuf.WriteString("AND `authority_id`=? ")
		sqlArgs = append(sqlArgs, s.Authority_id)
	}
	if s.Authority_name != "" {
		sqlBuf.WriteString("AND `authority_name`=? ")
		sqlArgs = append(sqlArgs, s.Authority_name)
	}
	if s.Parent_id != 0 {
		sqlBuf.WriteString("AND `parent_id`=? ")
		sqlArgs = append(sqlArgs, s.Parent_id)
	}
	if s.Default_router != "" {
		sqlBuf.WriteString("AND `default_router`=? ")
		sqlArgs = append(sqlArgs, s.Default_router)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_authorities(s *Sys_authorities) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_authorities`(`created_at`, `updated_at`, `deleted_at`, `authority_id`, `authority_name`, `parent_id`, `default_router`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Created_at, s.Updated_at, s.Deleted_at, s.Authority_id, s.Authority_name, s.Parent_id, s.Default_router}
	if s.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Authority_id != 0 {
		sqlBuf.WriteString("`authority_id`=?,")
		sqlArgs = append(sqlArgs, s.Authority_id)
	}
	if s.Authority_name != "" {
		sqlBuf.WriteString("`authority_name`=?,")
		sqlArgs = append(sqlArgs, s.Authority_name)
	}
	if s.Parent_id != 0 {
		sqlBuf.WriteString("`parent_id`=?,")
		sqlArgs = append(sqlArgs, s.Parent_id)
	}
	if s.Default_router != "" {
		sqlBuf.WriteString("`default_router`=?,")
		sqlArgs = append(sqlArgs, s.Default_router)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_authority_btns
INSERT INTO `gva`.`sys_authority_btns`(`authority_id`, `sys_menu_id`, `sys_base_menu_btn_id`) VALUES(?, ?, ?) ON DUPLICATE KEY UPDATE `authority_id`=?, `sys_menu_id`=?, `sys_base_menu_btn_id`=?;
SELECT `authority_id`, `sys_menu_id`, `sys_base_menu_btn_id` FROM `gva`.`sys_authority_btns` WHERE ;
UPDATE `gva`.`sys_authority_btns` SET `authority_id`=?, `sys_menu_id`=?, `sys_base_menu_btn_id`=? WHERE ;
type Sys_authority_btns struct {
	Authority_id int `json:"authority_id,omitempty"`
	Sys_menu_id int `json:"sys_menu_id,omitempty"`
	Sys_base_menu_btn_id int `json:"sys_base_menu_btn_id,omitempty"`
}
func I_sys_authority_btnss(ss []Sys_authority_btns) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_authority_btns`(`authority_id`, `sys_menu_id`, `sys_base_menu_btn_id`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Authority_id, s.Sys_menu_id, s.Sys_base_menu_btn_id)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_authority_btns(s *Sys_authority_btns) (ss []Sys_authority_btns, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `authority_id`, `sys_menu_id`, `sys_base_menu_btn_id` FROM `gva`.`sys_authority_btns` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Authority_id != 0 {
		sqlBuf.WriteString("AND `authority_id`=? ")
		sqlArgs = append(sqlArgs, s.Authority_id)
	}
	if s.Sys_menu_id != 0 {
		sqlBuf.WriteString("AND `sys_menu_id`=? ")
		sqlArgs = append(sqlArgs, s.Sys_menu_id)
	}
	if s.Sys_base_menu_btn_id != 0 {
		sqlBuf.WriteString("AND `sys_base_menu_btn_id`=? ")
		sqlArgs = append(sqlArgs, s.Sys_base_menu_btn_id)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_authority_btns(s *Sys_authority_btns) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_authority_btns`(`authority_id`, `sys_menu_id`, `sys_base_menu_btn_id`) VALUES(?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Authority_id, s.Sys_menu_id, s.Sys_base_menu_btn_id}
	if s.Authority_id != 0 {
		sqlBuf.WriteString("`authority_id`=?,")
		sqlArgs = append(sqlArgs, s.Authority_id)
	}
	if s.Sys_menu_id != 0 {
		sqlBuf.WriteString("`sys_menu_id`=?,")
		sqlArgs = append(sqlArgs, s.Sys_menu_id)
	}
	if s.Sys_base_menu_btn_id != 0 {
		sqlBuf.WriteString("`sys_base_menu_btn_id`=?,")
		sqlArgs = append(sqlArgs, s.Sys_base_menu_btn_id)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_authority_menus
INSERT INTO `gva`.`sys_authority_menus`(`sys_base_menu_id`, `sys_authority_authority_id`) VALUES(?, ?) ON DUPLICATE KEY UPDATE ;
SELECT `sys_base_menu_id`, `sys_authority_authority_id` FROM `gva`.`sys_authority_menus` WHERE `sys_base_menu_id`=? AND `sys_authority_authority_id`=?;
UPDATE `gva`.`sys_authority_menus` SET `sys_base_menu_id`=?, `sys_authority_authority_id`=? WHERE `sys_base_menu_id`=? AND `sys_authority_authority_id`=?;
type Sys_authority_menus struct {
	Sys_base_menu_id int `json:"sys_base_menu_id,omitempty"`
	Sys_authority_authority_id int `json:"sys_authority_authority_id,omitempty"`
}
func I_sys_authority_menuss(ss []Sys_authority_menus) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_authority_menus`(`sys_base_menu_id`, `sys_authority_authority_id`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Sys_base_menu_id, s.Sys_authority_authority_id)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_authority_menus(s *Sys_authority_menus) (ss []Sys_authority_menus, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `sys_base_menu_id`, `sys_authority_authority_id` FROM `gva`.`sys_authority_menus` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Sys_base_menu_id != 0 {
		sqlBuf.WriteString("AND `sys_base_menu_id`=? ")
		sqlArgs = append(sqlArgs, s.Sys_base_menu_id)
	}
	if s.Sys_authority_authority_id != 0 {
		sqlBuf.WriteString("AND `sys_authority_authority_id`=? ")
		sqlArgs = append(sqlArgs, s.Sys_authority_authority_id)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_authority_menus(s *Sys_authority_menus) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_authority_menus`(`sys_base_menu_id`, `sys_authority_authority_id`) VALUES(?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Sys_base_menu_id, s.Sys_authority_authority_id}
	if s.Sys_base_menu_id != 0 {
		sqlBuf.WriteString("`sys_base_menu_id`=?,")
		sqlArgs = append(sqlArgs, s.Sys_base_menu_id)
	}
	if s.Sys_authority_authority_id != 0 {
		sqlBuf.WriteString("`sys_authority_authority_id`=?,")
		sqlArgs = append(sqlArgs, s.Sys_authority_authority_id)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_auto_code_histories
INSERT INTO `gva`.`sys_auto_code_histories`(`id`, `created_at`, `updated_at`, `deleted_at`, `package`, `business_db`, `table_name`, `menu_id`, `request_meta`, `auto_code_path`, `injection_meta`, `struct_name`, `struct_cn_name`, `api_ids`, `flag`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `package`=?, `business_db`=?, `table_name`=?, `menu_id`=?, `request_meta`=?, `auto_code_path`=?, `injection_meta`=?, `struct_name`=?, `struct_cn_name`=?, `api_ids`=?, `flag`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `package`, `business_db`, `table_name`, `menu_id`, `request_meta`, `auto_code_path`, `injection_meta`, `struct_name`, `struct_cn_name`, `api_ids`, `flag` FROM `gva`.`sys_auto_code_histories` WHERE `id`=?;
UPDATE `gva`.`sys_auto_code_histories` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `package`=?, `business_db`=?, `table_name`=?, `menu_id`=?, `request_meta`=?, `auto_code_path`=?, `injection_meta`=?, `struct_name`=?, `struct_cn_name`=?, `api_ids`=?, `flag`=? WHERE `id`=?;
type Sys_auto_code_histories struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Package string `json:"package,omitempty"`
	Business_db string `json:"business_db,omitempty"`
	Table_name string `json:"table_name,omitempty"`
	Menu_id int `json:"menu_id,omitempty"`
	Request_meta string `json:"request_meta,omitempty"`
	Auto_code_path string `json:"auto_code_path,omitempty"`
	Injection_meta string `json:"injection_meta,omitempty"`
	Struct_name string `json:"struct_name,omitempty"`
	Struct_cn_name string `json:"struct_cn_name,omitempty"`
	Api_ids string `json:"api_ids,omitempty"`
	Flag int `json:"flag,omitempty"`
}
func I_sys_auto_code_historiess(ss []Sys_auto_code_histories) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_auto_code_histories`(`id`, `created_at`, `updated_at`, `deleted_at`, `package`, `business_db`, `table_name`, `menu_id`, `request_meta`, `auto_code_path`, `injection_meta`, `struct_name`, `struct_cn_name`, `api_ids`, `flag`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Package, s.Business_db, s.Table_name, s.Menu_id, s.Request_meta, s.Auto_code_path, s.Injection_meta, s.Struct_name, s.Struct_cn_name, s.Api_ids, s.Flag)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_auto_code_histories(s *Sys_auto_code_histories) (ss []Sys_auto_code_histories, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `package`, `business_db`, `table_name`, `menu_id`, `request_meta`, `auto_code_path`, `injection_meta`, `struct_name`, `struct_cn_name`, `api_ids`, `flag` FROM `gva`.`sys_auto_code_histories` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Package != "" {
		sqlBuf.WriteString("AND `package`=? ")
		sqlArgs = append(sqlArgs, s.Package)
	}
	if s.Business_db != "" {
		sqlBuf.WriteString("AND `business_db`=? ")
		sqlArgs = append(sqlArgs, s.Business_db)
	}
	if s.Table_name != "" {
		sqlBuf.WriteString("AND `table_name`=? ")
		sqlArgs = append(sqlArgs, s.Table_name)
	}
	if s.Menu_id != 0 {
		sqlBuf.WriteString("AND `menu_id`=? ")
		sqlArgs = append(sqlArgs, s.Menu_id)
	}
	if s.Request_meta != "" {
		sqlBuf.WriteString("AND `request_meta`=? ")
		sqlArgs = append(sqlArgs, s.Request_meta)
	}
	if s.Auto_code_path != "" {
		sqlBuf.WriteString("AND `auto_code_path`=? ")
		sqlArgs = append(sqlArgs, s.Auto_code_path)
	}
	if s.Injection_meta != "" {
		sqlBuf.WriteString("AND `injection_meta`=? ")
		sqlArgs = append(sqlArgs, s.Injection_meta)
	}
	if s.Struct_name != "" {
		sqlBuf.WriteString("AND `struct_name`=? ")
		sqlArgs = append(sqlArgs, s.Struct_name)
	}
	if s.Struct_cn_name != "" {
		sqlBuf.WriteString("AND `struct_cn_name`=? ")
		sqlArgs = append(sqlArgs, s.Struct_cn_name)
	}
	if s.Api_ids != "" {
		sqlBuf.WriteString("AND `api_ids`=? ")
		sqlArgs = append(sqlArgs, s.Api_ids)
	}
	if s.Flag != 0 {
		sqlBuf.WriteString("AND `flag`=? ")
		sqlArgs = append(sqlArgs, s.Flag)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_auto_code_histories(s *Sys_auto_code_histories) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_auto_code_histories`(`id`, `created_at`, `updated_at`, `deleted_at`, `package`, `business_db`, `table_name`, `menu_id`, `request_meta`, `auto_code_path`, `injection_meta`, `struct_name`, `struct_cn_name`, `api_ids`, `flag`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Package, s.Business_db, s.Table_name, s.Menu_id, s.Request_meta, s.Auto_code_path, s.Injection_meta, s.Struct_name, s.Struct_cn_name, s.Api_ids, s.Flag}
	if s.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Package != "" {
		sqlBuf.WriteString("`package`=?,")
		sqlArgs = append(sqlArgs, s.Package)
	}
	if s.Business_db != "" {
		sqlBuf.WriteString("`business_db`=?,")
		sqlArgs = append(sqlArgs, s.Business_db)
	}
	if s.Table_name != "" {
		sqlBuf.WriteString("`table_name`=?,")
		sqlArgs = append(sqlArgs, s.Table_name)
	}
	if s.Menu_id != 0 {
		sqlBuf.WriteString("`menu_id`=?,")
		sqlArgs = append(sqlArgs, s.Menu_id)
	}
	if s.Request_meta != "" {
		sqlBuf.WriteString("`request_meta`=?,")
		sqlArgs = append(sqlArgs, s.Request_meta)
	}
	if s.Auto_code_path != "" {
		sqlBuf.WriteString("`auto_code_path`=?,")
		sqlArgs = append(sqlArgs, s.Auto_code_path)
	}
	if s.Injection_meta != "" {
		sqlBuf.WriteString("`injection_meta`=?,")
		sqlArgs = append(sqlArgs, s.Injection_meta)
	}
	if s.Struct_name != "" {
		sqlBuf.WriteString("`struct_name`=?,")
		sqlArgs = append(sqlArgs, s.Struct_name)
	}
	if s.Struct_cn_name != "" {
		sqlBuf.WriteString("`struct_cn_name`=?,")
		sqlArgs = append(sqlArgs, s.Struct_cn_name)
	}
	if s.Api_ids != "" {
		sqlBuf.WriteString("`api_ids`=?,")
		sqlArgs = append(sqlArgs, s.Api_ids)
	}
	if s.Flag != 0 {
		sqlBuf.WriteString("`flag`=?,")
		sqlArgs = append(sqlArgs, s.Flag)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_auto_codes
INSERT INTO `gva`.`sys_auto_codes`(`id`, `created_at`, `updated_at`, `deleted_at`, `package_name`, `label`, `desc`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `package_name`=?, `label`=?, `desc`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `package_name`, `label`, `desc` FROM `gva`.`sys_auto_codes` WHERE `id`=?;
UPDATE `gva`.`sys_auto_codes` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `package_name`=?, `label`=?, `desc`=? WHERE `id`=?;
type Sys_auto_codes struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Package_name string `json:"package_name,omitempty"`
	Label string `json:"label,omitempty"`
	Desc string `json:"desc,omitempty"`
}
func I_sys_auto_codess(ss []Sys_auto_codes) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_auto_codes`(`id`, `created_at`, `updated_at`, `deleted_at`, `package_name`, `label`, `desc`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Package_name, s.Label, s.Desc)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_auto_codes(s *Sys_auto_codes) (ss []Sys_auto_codes, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `package_name`, `label`, `desc` FROM `gva`.`sys_auto_codes` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Package_name != "" {
		sqlBuf.WriteString("AND `package_name`=? ")
		sqlArgs = append(sqlArgs, s.Package_name)
	}
	if s.Label != "" {
		sqlBuf.WriteString("AND `label`=? ")
		sqlArgs = append(sqlArgs, s.Label)
	}
	if s.Desc != "" {
		sqlBuf.WriteString("AND `desc`=? ")
		sqlArgs = append(sqlArgs, s.Desc)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_auto_codes(s *Sys_auto_codes) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_auto_codes`(`id`, `created_at`, `updated_at`, `deleted_at`, `package_name`, `label`, `desc`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Package_name, s.Label, s.Desc}
	if s.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Package_name != "" {
		sqlBuf.WriteString("`package_name`=?,")
		sqlArgs = append(sqlArgs, s.Package_name)
	}
	if s.Label != "" {
		sqlBuf.WriteString("`label`=?,")
		sqlArgs = append(sqlArgs, s.Label)
	}
	if s.Desc != "" {
		sqlBuf.WriteString("`desc`=?,")
		sqlArgs = append(sqlArgs, s.Desc)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_base_menu_btns
INSERT INTO `gva`.`sys_base_menu_btns`(`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `desc`, `sys_base_menu_id`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `name`=?, `desc`=?, `sys_base_menu_id`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `name`, `desc`, `sys_base_menu_id` FROM `gva`.`sys_base_menu_btns` WHERE `id`=?;
UPDATE `gva`.`sys_base_menu_btns` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `name`=?, `desc`=?, `sys_base_menu_id`=? WHERE `id`=?;
type Sys_base_menu_btns struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Name string `json:"name,omitempty"`
	Desc string `json:"desc,omitempty"`
	Sys_base_menu_id int `json:"sys_base_menu_id,omitempty"`
}
func I_sys_base_menu_btnss(ss []Sys_base_menu_btns) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_base_menu_btns`(`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `desc`, `sys_base_menu_id`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Name, s.Desc, s.Sys_base_menu_id)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_base_menu_btns(s *Sys_base_menu_btns) (ss []Sys_base_menu_btns, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `name`, `desc`, `sys_base_menu_id` FROM `gva`.`sys_base_menu_btns` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Name != "" {
		sqlBuf.WriteString("AND `name`=? ")
		sqlArgs = append(sqlArgs, s.Name)
	}
	if s.Desc != "" {
		sqlBuf.WriteString("AND `desc`=? ")
		sqlArgs = append(sqlArgs, s.Desc)
	}
	if s.Sys_base_menu_id != 0 {
		sqlBuf.WriteString("AND `sys_base_menu_id`=? ")
		sqlArgs = append(sqlArgs, s.Sys_base_menu_id)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_base_menu_btns(s *Sys_base_menu_btns) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_base_menu_btns`(`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `desc`, `sys_base_menu_id`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Name, s.Desc, s.Sys_base_menu_id}
	if s.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Name != "" {
		sqlBuf.WriteString("`name`=?,")
		sqlArgs = append(sqlArgs, s.Name)
	}
	if s.Desc != "" {
		sqlBuf.WriteString("`desc`=?,")
		sqlArgs = append(sqlArgs, s.Desc)
	}
	if s.Sys_base_menu_id != 0 {
		sqlBuf.WriteString("`sys_base_menu_id`=?,")
		sqlArgs = append(sqlArgs, s.Sys_base_menu_id)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_base_menu_parameters
INSERT INTO `gva`.`sys_base_menu_parameters`(`id`, `created_at`, `updated_at`, `deleted_at`, `sys_base_menu_id`, `type`, `key`, `value`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `sys_base_menu_id`=?, `type`=?, `key`=?, `value`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `sys_base_menu_id`, `type`, `key`, `value` FROM `gva`.`sys_base_menu_parameters` WHERE `id`=?;
UPDATE `gva`.`sys_base_menu_parameters` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `sys_base_menu_id`=?, `type`=?, `key`=?, `value`=? WHERE `id`=?;
type Sys_base_menu_parameters struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Sys_base_menu_id int `json:"sys_base_menu_id,omitempty"`
	Type string `json:"type,omitempty"`
	Key string `json:"key,omitempty"`
	Value string `json:"value,omitempty"`
}
func I_sys_base_menu_parameterss(ss []Sys_base_menu_parameters) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_base_menu_parameters`(`id`, `created_at`, `updated_at`, `deleted_at`, `sys_base_menu_id`, `type`, `key`, `value`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Sys_base_menu_id, s.Type, s.Key, s.Value)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_base_menu_parameters(s *Sys_base_menu_parameters) (ss []Sys_base_menu_parameters, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `sys_base_menu_id`, `type`, `key`, `value` FROM `gva`.`sys_base_menu_parameters` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Sys_base_menu_id != 0 {
		sqlBuf.WriteString("AND `sys_base_menu_id`=? ")
		sqlArgs = append(sqlArgs, s.Sys_base_menu_id)
	}
	if s.Type != "" {
		sqlBuf.WriteString("AND `type`=? ")
		sqlArgs = append(sqlArgs, s.Type)
	}
	if s.Key != "" {
		sqlBuf.WriteString("AND `key`=? ")
		sqlArgs = append(sqlArgs, s.Key)
	}
	if s.Value != "" {
		sqlBuf.WriteString("AND `value`=? ")
		sqlArgs = append(sqlArgs, s.Value)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_base_menu_parameters(s *Sys_base_menu_parameters) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_base_menu_parameters`(`id`, `created_at`, `updated_at`, `deleted_at`, `sys_base_menu_id`, `type`, `key`, `value`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Sys_base_menu_id, s.Type, s.Key, s.Value}
	if s.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Sys_base_menu_id != 0 {
		sqlBuf.WriteString("`sys_base_menu_id`=?,")
		sqlArgs = append(sqlArgs, s.Sys_base_menu_id)
	}
	if s.Type != "" {
		sqlBuf.WriteString("`type`=?,")
		sqlArgs = append(sqlArgs, s.Type)
	}
	if s.Key != "" {
		sqlBuf.WriteString("`key`=?,")
		sqlArgs = append(sqlArgs, s.Key)
	}
	if s.Value != "" {
		sqlBuf.WriteString("`value`=?,")
		sqlArgs = append(sqlArgs, s.Value)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_base_menus
INSERT INTO `gva`.`sys_base_menus`(`id`, `created_at`, `updated_at`, `deleted_at`, `menu_level`, `parent_id`, `path`, `name`, `hidden`, `component`, `sort`, `active_name`, `keep_alive`, `default_menu`, `title`, `icon`, `close_tab`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `menu_level`=?, `parent_id`=?, `path`=?, `name`=?, `hidden`=?, `component`=?, `sort`=?, `active_name`=?, `keep_alive`=?, `default_menu`=?, `title`=?, `icon`=?, `close_tab`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `menu_level`, `parent_id`, `path`, `name`, `hidden`, `component`, `sort`, `active_name`, `keep_alive`, `default_menu`, `title`, `icon`, `close_tab` FROM `gva`.`sys_base_menus` WHERE `id`=?;
UPDATE `gva`.`sys_base_menus` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `menu_level`=?, `parent_id`=?, `path`=?, `name`=?, `hidden`=?, `component`=?, `sort`=?, `active_name`=?, `keep_alive`=?, `default_menu`=?, `title`=?, `icon`=?, `close_tab`=? WHERE `id`=?;
type Sys_base_menus struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Menu_level int `json:"menu_level,omitempty"`
	Parent_id int `json:"parent_id,omitempty"`
	Path string `json:"path,omitempty"`
	Name string `json:"name,omitempty"`
	Hidden int `json:"hidden,omitempty"`
	Component string `json:"component,omitempty"`
	Sort int `json:"sort,omitempty"`
	Active_name string `json:"active_name,omitempty"`
	Keep_alive int `json:"keep_alive,omitempty"`
	Default_menu int `json:"default_menu,omitempty"`
	Title string `json:"title,omitempty"`
	Icon string `json:"icon,omitempty"`
	Close_tab int `json:"close_tab,omitempty"`
}
func I_sys_base_menuss(ss []Sys_base_menus) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_base_menus`(`id`, `created_at`, `updated_at`, `deleted_at`, `menu_level`, `parent_id`, `path`, `name`, `hidden`, `component`, `sort`, `active_name`, `keep_alive`, `default_menu`, `title`, `icon`, `close_tab`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Menu_level, s.Parent_id, s.Path, s.Name, s.Hidden, s.Component, s.Sort, s.Active_name, s.Keep_alive, s.Default_menu, s.Title, s.Icon, s.Close_tab)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_base_menus(s *Sys_base_menus) (ss []Sys_base_menus, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `menu_level`, `parent_id`, `path`, `name`, `hidden`, `component`, `sort`, `active_name`, `keep_alive`, `default_menu`, `title`, `icon`, `close_tab` FROM `gva`.`sys_base_menus` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Menu_level != 0 {
		sqlBuf.WriteString("AND `menu_level`=? ")
		sqlArgs = append(sqlArgs, s.Menu_level)
	}
	if s.Parent_id != 0 {
		sqlBuf.WriteString("AND `parent_id`=? ")
		sqlArgs = append(sqlArgs, s.Parent_id)
	}
	if s.Path != "" {
		sqlBuf.WriteString("AND `path`=? ")
		sqlArgs = append(sqlArgs, s.Path)
	}
	if s.Name != "" {
		sqlBuf.WriteString("AND `name`=? ")
		sqlArgs = append(sqlArgs, s.Name)
	}
	if s.Hidden != 0 {
		sqlBuf.WriteString("AND `hidden`=? ")
		sqlArgs = append(sqlArgs, s.Hidden)
	}
	if s.Component != "" {
		sqlBuf.WriteString("AND `component`=? ")
		sqlArgs = append(sqlArgs, s.Component)
	}
	if s.Sort != 0 {
		sqlBuf.WriteString("AND `sort`=? ")
		sqlArgs = append(sqlArgs, s.Sort)
	}
	if s.Active_name != "" {
		sqlBuf.WriteString("AND `active_name`=? ")
		sqlArgs = append(sqlArgs, s.Active_name)
	}
	if s.Keep_alive != 0 {
		sqlBuf.WriteString("AND `keep_alive`=? ")
		sqlArgs = append(sqlArgs, s.Keep_alive)
	}
	if s.Default_menu != 0 {
		sqlBuf.WriteString("AND `default_menu`=? ")
		sqlArgs = append(sqlArgs, s.Default_menu)
	}
	if s.Title != "" {
		sqlBuf.WriteString("AND `title`=? ")
		sqlArgs = append(sqlArgs, s.Title)
	}
	if s.Icon != "" {
		sqlBuf.WriteString("AND `icon`=? ")
		sqlArgs = append(sqlArgs, s.Icon)
	}
	if s.Close_tab != 0 {
		sqlBuf.WriteString("AND `close_tab`=? ")
		sqlArgs = append(sqlArgs, s.Close_tab)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_base_menus(s *Sys_base_menus) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_base_menus`(`id`, `created_at`, `updated_at`, `deleted_at`, `menu_level`, `parent_id`, `path`, `name`, `hidden`, `component`, `sort`, `active_name`, `keep_alive`, `default_menu`, `title`, `icon`, `close_tab`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Menu_level, s.Parent_id, s.Path, s.Name, s.Hidden, s.Component, s.Sort, s.Active_name, s.Keep_alive, s.Default_menu, s.Title, s.Icon, s.Close_tab}
	if s.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Menu_level != 0 {
		sqlBuf.WriteString("`menu_level`=?,")
		sqlArgs = append(sqlArgs, s.Menu_level)
	}
	if s.Parent_id != 0 {
		sqlBuf.WriteString("`parent_id`=?,")
		sqlArgs = append(sqlArgs, s.Parent_id)
	}
	if s.Path != "" {
		sqlBuf.WriteString("`path`=?,")
		sqlArgs = append(sqlArgs, s.Path)
	}
	if s.Name != "" {
		sqlBuf.WriteString("`name`=?,")
		sqlArgs = append(sqlArgs, s.Name)
	}
	if s.Hidden != 0 {
		sqlBuf.WriteString("`hidden`=?,")
		sqlArgs = append(sqlArgs, s.Hidden)
	}
	if s.Component != "" {
		sqlBuf.WriteString("`component`=?,")
		sqlArgs = append(sqlArgs, s.Component)
	}
	if s.Sort != 0 {
		sqlBuf.WriteString("`sort`=?,")
		sqlArgs = append(sqlArgs, s.Sort)
	}
	if s.Active_name != "" {
		sqlBuf.WriteString("`active_name`=?,")
		sqlArgs = append(sqlArgs, s.Active_name)
	}
	if s.Keep_alive != 0 {
		sqlBuf.WriteString("`keep_alive`=?,")
		sqlArgs = append(sqlArgs, s.Keep_alive)
	}
	if s.Default_menu != 0 {
		sqlBuf.WriteString("`default_menu`=?,")
		sqlArgs = append(sqlArgs, s.Default_menu)
	}
	if s.Title != "" {
		sqlBuf.WriteString("`title`=?,")
		sqlArgs = append(sqlArgs, s.Title)
	}
	if s.Icon != "" {
		sqlBuf.WriteString("`icon`=?,")
		sqlArgs = append(sqlArgs, s.Icon)
	}
	if s.Close_tab != 0 {
		sqlBuf.WriteString("`close_tab`=?,")
		sqlArgs = append(sqlArgs, s.Close_tab)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_data_authority_id
INSERT INTO `gva`.`sys_data_authority_id`(`sys_authority_authority_id`, `data_authority_id_authority_id`) VALUES(?, ?) ON DUPLICATE KEY UPDATE ;
SELECT `sys_authority_authority_id`, `data_authority_id_authority_id` FROM `gva`.`sys_data_authority_id` WHERE `sys_authority_authority_id`=? AND `data_authority_id_authority_id`=?;
UPDATE `gva`.`sys_data_authority_id` SET `sys_authority_authority_id`=?, `data_authority_id_authority_id`=? WHERE `sys_authority_authority_id`=? AND `data_authority_id_authority_id`=?;
type Sys_data_authority_id struct {
	Sys_authority_authority_id int `json:"sys_authority_authority_id,omitempty"`
	Data_authority_id_authority_id int `json:"data_authority_id_authority_id,omitempty"`
}
func I_sys_data_authority_ids(ss []Sys_data_authority_id) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_data_authority_id`(`sys_authority_authority_id`, `data_authority_id_authority_id`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Sys_authority_authority_id, s.Data_authority_id_authority_id)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_data_authority_id(s *Sys_data_authority_id) (ss []Sys_data_authority_id, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `sys_authority_authority_id`, `data_authority_id_authority_id` FROM `gva`.`sys_data_authority_id` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Sys_authority_authority_id != 0 {
		sqlBuf.WriteString("AND `sys_authority_authority_id`=? ")
		sqlArgs = append(sqlArgs, s.Sys_authority_authority_id)
	}
	if s.Data_authority_id_authority_id != 0 {
		sqlBuf.WriteString("AND `data_authority_id_authority_id`=? ")
		sqlArgs = append(sqlArgs, s.Data_authority_id_authority_id)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_data_authority_id(s *Sys_data_authority_id) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_data_authority_id`(`sys_authority_authority_id`, `data_authority_id_authority_id`) VALUES(?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Sys_authority_authority_id, s.Data_authority_id_authority_id}
	if s.Sys_authority_authority_id != 0 {
		sqlBuf.WriteString("`sys_authority_authority_id`=?,")
		sqlArgs = append(sqlArgs, s.Sys_authority_authority_id)
	}
	if s.Data_authority_id_authority_id != 0 {
		sqlBuf.WriteString("`data_authority_id_authority_id`=?,")
		sqlArgs = append(sqlArgs, s.Data_authority_id_authority_id)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_dictionaries
INSERT INTO `gva`.`sys_dictionaries`(`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `type`, `status`, `desc`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `name`=?, `type`=?, `status`=?, `desc`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `name`, `type`, `status`, `desc` FROM `gva`.`sys_dictionaries` WHERE `id`=?;
UPDATE `gva`.`sys_dictionaries` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `name`=?, `type`=?, `status`=?, `desc`=? WHERE `id`=?;
type Sys_dictionaries struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Name string `json:"name,omitempty"`
	Type string `json:"type,omitempty"`
	Status int `json:"status,omitempty"`
	Desc string `json:"desc,omitempty"`
}
func I_sys_dictionariess(ss []Sys_dictionaries) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_dictionaries`(`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `type`, `status`, `desc`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Name, s.Type, s.Status, s.Desc)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_dictionaries(s *Sys_dictionaries) (ss []Sys_dictionaries, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `name`, `type`, `status`, `desc` FROM `gva`.`sys_dictionaries` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Name != "" {
		sqlBuf.WriteString("AND `name`=? ")
		sqlArgs = append(sqlArgs, s.Name)
	}
	if s.Type != "" {
		sqlBuf.WriteString("AND `type`=? ")
		sqlArgs = append(sqlArgs, s.Type)
	}
	if s.Status != 0 {
		sqlBuf.WriteString("AND `status`=? ")
		sqlArgs = append(sqlArgs, s.Status)
	}
	if s.Desc != "" {
		sqlBuf.WriteString("AND `desc`=? ")
		sqlArgs = append(sqlArgs, s.Desc)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_dictionaries(s *Sys_dictionaries) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_dictionaries`(`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `type`, `status`, `desc`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Name, s.Type, s.Status, s.Desc}
	if s.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Name != "" {
		sqlBuf.WriteString("`name`=?,")
		sqlArgs = append(sqlArgs, s.Name)
	}
	if s.Type != "" {
		sqlBuf.WriteString("`type`=?,")
		sqlArgs = append(sqlArgs, s.Type)
	}
	if s.Status != 0 {
		sqlBuf.WriteString("`status`=?,")
		sqlArgs = append(sqlArgs, s.Status)
	}
	if s.Desc != "" {
		sqlBuf.WriteString("`desc`=?,")
		sqlArgs = append(sqlArgs, s.Desc)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_dictionary_details
INSERT INTO `gva`.`sys_dictionary_details`(`id`, `created_at`, `updated_at`, `deleted_at`, `label`, `value`, `extend`, `status`, `sort`, `sys_dictionary_id`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `label`=?, `value`=?, `extend`=?, `status`=?, `sort`=?, `sys_dictionary_id`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `label`, `value`, `extend`, `status`, `sort`, `sys_dictionary_id` FROM `gva`.`sys_dictionary_details` WHERE `id`=?;
UPDATE `gva`.`sys_dictionary_details` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `label`=?, `value`=?, `extend`=?, `status`=?, `sort`=?, `sys_dictionary_id`=? WHERE `id`=?;
type Sys_dictionary_details struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Label string `json:"label,omitempty"`
	Value string `json:"value,omitempty"`
	Extend string `json:"extend,omitempty"`
	Status int `json:"status,omitempty"`
	Sort int `json:"sort,omitempty"`
	Sys_dictionary_id int `json:"sys_dictionary_id,omitempty"`
}
func I_sys_dictionary_detailss(ss []Sys_dictionary_details) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_dictionary_details`(`id`, `created_at`, `updated_at`, `deleted_at`, `label`, `value`, `extend`, `status`, `sort`, `sys_dictionary_id`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Label, s.Value, s.Extend, s.Status, s.Sort, s.Sys_dictionary_id)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_dictionary_details(s *Sys_dictionary_details) (ss []Sys_dictionary_details, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `label`, `value`, `extend`, `status`, `sort`, `sys_dictionary_id` FROM `gva`.`sys_dictionary_details` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Label != "" {
		sqlBuf.WriteString("AND `label`=? ")
		sqlArgs = append(sqlArgs, s.Label)
	}
	if s.Value != "" {
		sqlBuf.WriteString("AND `value`=? ")
		sqlArgs = append(sqlArgs, s.Value)
	}
	if s.Extend != "" {
		sqlBuf.WriteString("AND `extend`=? ")
		sqlArgs = append(sqlArgs, s.Extend)
	}
	if s.Status != 0 {
		sqlBuf.WriteString("AND `status`=? ")
		sqlArgs = append(sqlArgs, s.Status)
	}
	if s.Sort != 0 {
		sqlBuf.WriteString("AND `sort`=? ")
		sqlArgs = append(sqlArgs, s.Sort)
	}
	if s.Sys_dictionary_id != 0 {
		sqlBuf.WriteString("AND `sys_dictionary_id`=? ")
		sqlArgs = append(sqlArgs, s.Sys_dictionary_id)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_dictionary_details(s *Sys_dictionary_details) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_dictionary_details`(`id`, `created_at`, `updated_at`, `deleted_at`, `label`, `value`, `extend`, `status`, `sort`, `sys_dictionary_id`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Label, s.Value, s.Extend, s.Status, s.Sort, s.Sys_dictionary_id}
	if s.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Label != "" {
		sqlBuf.WriteString("`label`=?,")
		sqlArgs = append(sqlArgs, s.Label)
	}
	if s.Value != "" {
		sqlBuf.WriteString("`value`=?,")
		sqlArgs = append(sqlArgs, s.Value)
	}
	if s.Extend != "" {
		sqlBuf.WriteString("`extend`=?,")
		sqlArgs = append(sqlArgs, s.Extend)
	}
	if s.Status != 0 {
		sqlBuf.WriteString("`status`=?,")
		sqlArgs = append(sqlArgs, s.Status)
	}
	if s.Sort != 0 {
		sqlBuf.WriteString("`sort`=?,")
		sqlArgs = append(sqlArgs, s.Sort)
	}
	if s.Sys_dictionary_id != 0 {
		sqlBuf.WriteString("`sys_dictionary_id`=?,")
		sqlArgs = append(sqlArgs, s.Sys_dictionary_id)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_export_template_condition
INSERT INTO `gva`.`sys_export_template_condition`(`id`, `created_at`, `updated_at`, `deleted_at`, `template_id`, `from`, `column`, `operator`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `template_id`=?, `from`=?, `column`=?, `operator`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `template_id`, `from`, `column`, `operator` FROM `gva`.`sys_export_template_condition` WHERE `id`=?;
UPDATE `gva`.`sys_export_template_condition` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `template_id`=?, `from`=?, `column`=?, `operator`=? WHERE `id`=?;
type Sys_export_template_condition struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Template_id string `json:"template_id,omitempty"`
	From string `json:"from,omitempty"`
	Column string `json:"column,omitempty"`
	Operator string `json:"operator,omitempty"`
}
func I_sys_export_template_conditions(ss []Sys_export_template_condition) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_export_template_condition`(`id`, `created_at`, `updated_at`, `deleted_at`, `template_id`, `from`, `column`, `operator`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Template_id, s.From, s.Column, s.Operator)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_export_template_condition(s *Sys_export_template_condition) (ss []Sys_export_template_condition, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `template_id`, `from`, `column`, `operator` FROM `gva`.`sys_export_template_condition` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Template_id != "" {
		sqlBuf.WriteString("AND `template_id`=? ")
		sqlArgs = append(sqlArgs, s.Template_id)
	}
	if s.From != "" {
		sqlBuf.WriteString("AND `from`=? ")
		sqlArgs = append(sqlArgs, s.From)
	}
	if s.Column != "" {
		sqlBuf.WriteString("AND `column`=? ")
		sqlArgs = append(sqlArgs, s.Column)
	}
	if s.Operator != "" {
		sqlBuf.WriteString("AND `operator`=? ")
		sqlArgs = append(sqlArgs, s.Operator)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_export_template_condition(s *Sys_export_template_condition) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_export_template_condition`(`id`, `created_at`, `updated_at`, `deleted_at`, `template_id`, `from`, `column`, `operator`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Template_id, s.From, s.Column, s.Operator}
	if s.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Template_id != "" {
		sqlBuf.WriteString("`template_id`=?,")
		sqlArgs = append(sqlArgs, s.Template_id)
	}
	if s.From != "" {
		sqlBuf.WriteString("`from`=?,")
		sqlArgs = append(sqlArgs, s.From)
	}
	if s.Column != "" {
		sqlBuf.WriteString("`column`=?,")
		sqlArgs = append(sqlArgs, s.Column)
	}
	if s.Operator != "" {
		sqlBuf.WriteString("`operator`=?,")
		sqlArgs = append(sqlArgs, s.Operator)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_export_template_join
INSERT INTO `gva`.`sys_export_template_join`(`id`, `created_at`, `updated_at`, `deleted_at`, `template_id`, `joins`, `table`, `on`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `template_id`=?, `joins`=?, `table`=?, `on`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `template_id`, `joins`, `table`, `on` FROM `gva`.`sys_export_template_join` WHERE `id`=?;
UPDATE `gva`.`sys_export_template_join` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `template_id`=?, `joins`=?, `table`=?, `on`=? WHERE `id`=?;
type Sys_export_template_join struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Template_id string `json:"template_id,omitempty"`
	Joins string `json:"joins,omitempty"`
	Table string `json:"table,omitempty"`
	On string `json:"on,omitempty"`
}
func I_sys_export_template_joins(ss []Sys_export_template_join) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_export_template_join`(`id`, `created_at`, `updated_at`, `deleted_at`, `template_id`, `joins`, `table`, `on`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Template_id, s.Joins, s.Table, s.On)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_export_template_join(s *Sys_export_template_join) (ss []Sys_export_template_join, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `template_id`, `joins`, `table`, `on` FROM `gva`.`sys_export_template_join` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Template_id != "" {
		sqlBuf.WriteString("AND `template_id`=? ")
		sqlArgs = append(sqlArgs, s.Template_id)
	}
	if s.Joins != "" {
		sqlBuf.WriteString("AND `joins`=? ")
		sqlArgs = append(sqlArgs, s.Joins)
	}
	if s.Table != "" {
		sqlBuf.WriteString("AND `table`=? ")
		sqlArgs = append(sqlArgs, s.Table)
	}
	if s.On != "" {
		sqlBuf.WriteString("AND `on`=? ")
		sqlArgs = append(sqlArgs, s.On)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_export_template_join(s *Sys_export_template_join) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_export_template_join`(`id`, `created_at`, `updated_at`, `deleted_at`, `template_id`, `joins`, `table`, `on`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Template_id, s.Joins, s.Table, s.On}
	if s.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Template_id != "" {
		sqlBuf.WriteString("`template_id`=?,")
		sqlArgs = append(sqlArgs, s.Template_id)
	}
	if s.Joins != "" {
		sqlBuf.WriteString("`joins`=?,")
		sqlArgs = append(sqlArgs, s.Joins)
	}
	if s.Table != "" {
		sqlBuf.WriteString("`table`=?,")
		sqlArgs = append(sqlArgs, s.Table)
	}
	if s.On != "" {
		sqlBuf.WriteString("`on`=?,")
		sqlArgs = append(sqlArgs, s.On)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_export_templates
INSERT INTO `gva`.`sys_export_templates`(`id`, `created_at`, `updated_at`, `deleted_at`, `db_name`, `name`, `table_name`, `template_id`, `template_info`, `limit`, `order`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `db_name`=?, `name`=?, `table_name`=?, `template_id`=?, `template_info`=?, `limit`=?, `order`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `db_name`, `name`, `table_name`, `template_id`, `template_info`, `limit`, `order` FROM `gva`.`sys_export_templates` WHERE `id`=?;
UPDATE `gva`.`sys_export_templates` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `db_name`=?, `name`=?, `table_name`=?, `template_id`=?, `template_info`=?, `limit`=?, `order`=? WHERE `id`=?;
type Sys_export_templates struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Db_name string `json:"db_name,omitempty"`
	Name string `json:"name,omitempty"`
	Table_name string `json:"table_name,omitempty"`
	Template_id string `json:"template_id,omitempty"`
	Template_info string `json:"template_info,omitempty"`
	Limit int `json:"limit,omitempty"`
	Order string `json:"order,omitempty"`
}
func I_sys_export_templatess(ss []Sys_export_templates) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_export_templates`(`id`, `created_at`, `updated_at`, `deleted_at`, `db_name`, `name`, `table_name`, `template_id`, `template_info`, `limit`, `order`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Db_name, s.Name, s.Table_name, s.Template_id, s.Template_info, s.Limit, s.Order)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_export_templates(s *Sys_export_templates) (ss []Sys_export_templates, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `db_name`, `name`, `table_name`, `template_id`, `template_info`, `limit`, `order` FROM `gva`.`sys_export_templates` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Db_name != "" {
		sqlBuf.WriteString("AND `db_name`=? ")
		sqlArgs = append(sqlArgs, s.Db_name)
	}
	if s.Name != "" {
		sqlBuf.WriteString("AND `name`=? ")
		sqlArgs = append(sqlArgs, s.Name)
	}
	if s.Table_name != "" {
		sqlBuf.WriteString("AND `table_name`=? ")
		sqlArgs = append(sqlArgs, s.Table_name)
	}
	if s.Template_id != "" {
		sqlBuf.WriteString("AND `template_id`=? ")
		sqlArgs = append(sqlArgs, s.Template_id)
	}
	if s.Template_info != "" {
		sqlBuf.WriteString("AND `template_info`=? ")
		sqlArgs = append(sqlArgs, s.Template_info)
	}
	if s.Limit != 0 {
		sqlBuf.WriteString("AND `limit`=? ")
		sqlArgs = append(sqlArgs, s.Limit)
	}
	if s.Order != "" {
		sqlBuf.WriteString("AND `order`=? ")
		sqlArgs = append(sqlArgs, s.Order)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_export_templates(s *Sys_export_templates) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_export_templates`(`id`, `created_at`, `updated_at`, `deleted_at`, `db_name`, `name`, `table_name`, `template_id`, `template_info`, `limit`, `order`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Db_name, s.Name, s.Table_name, s.Template_id, s.Template_info, s.Limit, s.Order}
	if s.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Db_name != "" {
		sqlBuf.WriteString("`db_name`=?,")
		sqlArgs = append(sqlArgs, s.Db_name)
	}
	if s.Name != "" {
		sqlBuf.WriteString("`name`=?,")
		sqlArgs = append(sqlArgs, s.Name)
	}
	if s.Table_name != "" {
		sqlBuf.WriteString("`table_name`=?,")
		sqlArgs = append(sqlArgs, s.Table_name)
	}
	if s.Template_id != "" {
		sqlBuf.WriteString("`template_id`=?,")
		sqlArgs = append(sqlArgs, s.Template_id)
	}
	if s.Template_info != "" {
		sqlBuf.WriteString("`template_info`=?,")
		sqlArgs = append(sqlArgs, s.Template_info)
	}
	if s.Limit != 0 {
		sqlBuf.WriteString("`limit`=?,")
		sqlArgs = append(sqlArgs, s.Limit)
	}
	if s.Order != "" {
		sqlBuf.WriteString("`order`=?,")
		sqlArgs = append(sqlArgs, s.Order)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_operation_records
INSERT INTO `gva`.`sys_operation_records`(`id`, `created_at`, `updated_at`, `deleted_at`, `ip`, `method`, `path`, `status`, `latency`, `agent`, `error_message`, `body`, `resp`, `user_id`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `ip`=?, `method`=?, `path`=?, `status`=?, `latency`=?, `agent`=?, `error_message`=?, `body`=?, `resp`=?, `user_id`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `ip`, `method`, `path`, `status`, `latency`, `agent`, `error_message`, `body`, `resp`, `user_id` FROM `gva`.`sys_operation_records` WHERE `id`=?;
UPDATE `gva`.`sys_operation_records` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `ip`=?, `method`=?, `path`=?, `status`=?, `latency`=?, `agent`=?, `error_message`=?, `body`=?, `resp`=?, `user_id`=? WHERE `id`=?;
type Sys_operation_records struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Ip string `json:"ip,omitempty"`
	Method string `json:"method,omitempty"`
	Path string `json:"path,omitempty"`
	Status int `json:"status,omitempty"`
	Latency int `json:"latency,omitempty"`
	Agent string `json:"agent,omitempty"`
	Error_message string `json:"error_message,omitempty"`
	Body string `json:"body,omitempty"`
	Resp string `json:"resp,omitempty"`
	User_id int `json:"user_id,omitempty"`
}
func I_sys_operation_recordss(ss []Sys_operation_records) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_operation_records`(`id`, `created_at`, `updated_at`, `deleted_at`, `ip`, `method`, `path`, `status`, `latency`, `agent`, `error_message`, `body`, `resp`, `user_id`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Ip, s.Method, s.Path, s.Status, s.Latency, s.Agent, s.Error_message, s.Body, s.Resp, s.User_id)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_operation_records(s *Sys_operation_records) (ss []Sys_operation_records, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `ip`, `method`, `path`, `status`, `latency`, `agent`, `error_message`, `body`, `resp`, `user_id` FROM `gva`.`sys_operation_records` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Ip != "" {
		sqlBuf.WriteString("AND `ip`=? ")
		sqlArgs = append(sqlArgs, s.Ip)
	}
	if s.Method != "" {
		sqlBuf.WriteString("AND `method`=? ")
		sqlArgs = append(sqlArgs, s.Method)
	}
	if s.Path != "" {
		sqlBuf.WriteString("AND `path`=? ")
		sqlArgs = append(sqlArgs, s.Path)
	}
	if s.Status != 0 {
		sqlBuf.WriteString("AND `status`=? ")
		sqlArgs = append(sqlArgs, s.Status)
	}
	if s.Latency != 0 {
		sqlBuf.WriteString("AND `latency`=? ")
		sqlArgs = append(sqlArgs, s.Latency)
	}
	if s.Agent != "" {
		sqlBuf.WriteString("AND `agent`=? ")
		sqlArgs = append(sqlArgs, s.Agent)
	}
	if s.Error_message != "" {
		sqlBuf.WriteString("AND `error_message`=? ")
		sqlArgs = append(sqlArgs, s.Error_message)
	}
	if s.Body != "" {
		sqlBuf.WriteString("AND `body`=? ")
		sqlArgs = append(sqlArgs, s.Body)
	}
	if s.Resp != "" {
		sqlBuf.WriteString("AND `resp`=? ")
		sqlArgs = append(sqlArgs, s.Resp)
	}
	if s.User_id != 0 {
		sqlBuf.WriteString("AND `user_id`=? ")
		sqlArgs = append(sqlArgs, s.User_id)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_operation_records(s *Sys_operation_records) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_operation_records`(`id`, `created_at`, `updated_at`, `deleted_at`, `ip`, `method`, `path`, `status`, `latency`, `agent`, `error_message`, `body`, `resp`, `user_id`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Ip, s.Method, s.Path, s.Status, s.Latency, s.Agent, s.Error_message, s.Body, s.Resp, s.User_id}
	if s.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Ip != "" {
		sqlBuf.WriteString("`ip`=?,")
		sqlArgs = append(sqlArgs, s.Ip)
	}
	if s.Method != "" {
		sqlBuf.WriteString("`method`=?,")
		sqlArgs = append(sqlArgs, s.Method)
	}
	if s.Path != "" {
		sqlBuf.WriteString("`path`=?,")
		sqlArgs = append(sqlArgs, s.Path)
	}
	if s.Status != 0 {
		sqlBuf.WriteString("`status`=?,")
		sqlArgs = append(sqlArgs, s.Status)
	}
	if s.Latency != 0 {
		sqlBuf.WriteString("`latency`=?,")
		sqlArgs = append(sqlArgs, s.Latency)
	}
	if s.Agent != "" {
		sqlBuf.WriteString("`agent`=?,")
		sqlArgs = append(sqlArgs, s.Agent)
	}
	if s.Error_message != "" {
		sqlBuf.WriteString("`error_message`=?,")
		sqlArgs = append(sqlArgs, s.Error_message)
	}
	if s.Body != "" {
		sqlBuf.WriteString("`body`=?,")
		sqlArgs = append(sqlArgs, s.Body)
	}
	if s.Resp != "" {
		sqlBuf.WriteString("`resp`=?,")
		sqlArgs = append(sqlArgs, s.Resp)
	}
	if s.User_id != 0 {
		sqlBuf.WriteString("`user_id`=?,")
		sqlArgs = append(sqlArgs, s.User_id)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_user_authority
INSERT INTO `gva`.`sys_user_authority`(`sys_user_id`, `sys_authority_authority_id`) VALUES(?, ?) ON DUPLICATE KEY UPDATE ;
SELECT `sys_user_id`, `sys_authority_authority_id` FROM `gva`.`sys_user_authority` WHERE `sys_user_id`=? AND `sys_authority_authority_id`=?;
UPDATE `gva`.`sys_user_authority` SET `sys_user_id`=?, `sys_authority_authority_id`=? WHERE `sys_user_id`=? AND `sys_authority_authority_id`=?;
type Sys_user_authority struct {
	Sys_user_id int `json:"sys_user_id,omitempty"`
	Sys_authority_authority_id int `json:"sys_authority_authority_id,omitempty"`
}
func I_sys_user_authoritys(ss []Sys_user_authority) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_user_authority`(`sys_user_id`, `sys_authority_authority_id`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Sys_user_id, s.Sys_authority_authority_id)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_user_authority(s *Sys_user_authority) (ss []Sys_user_authority, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `sys_user_id`, `sys_authority_authority_id` FROM `gva`.`sys_user_authority` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Sys_user_id != 0 {
		sqlBuf.WriteString("AND `sys_user_id`=? ")
		sqlArgs = append(sqlArgs, s.Sys_user_id)
	}
	if s.Sys_authority_authority_id != 0 {
		sqlBuf.WriteString("AND `sys_authority_authority_id`=? ")
		sqlArgs = append(sqlArgs, s.Sys_authority_authority_id)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_user_authority(s *Sys_user_authority) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_user_authority`(`sys_user_id`, `sys_authority_authority_id`) VALUES(?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Sys_user_id, s.Sys_authority_authority_id}
	if s.Sys_user_id != 0 {
		sqlBuf.WriteString("`sys_user_id`=?,")
		sqlArgs = append(sqlArgs, s.Sys_user_id)
	}
	if s.Sys_authority_authority_id != 0 {
		sqlBuf.WriteString("`sys_authority_authority_id`=?,")
		sqlArgs = append(sqlArgs, s.Sys_authority_authority_id)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#sys_users
INSERT INTO `gva`.`sys_users`(`id`, `created_at`, `updated_at`, `deleted_at`, `uuid`, `username`, `password`, `nick_name`, `side_mode`, `header_img`, `base_color`, `authority_id`, `phone`, `email`, `enable`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `created_at`=?, `updated_at`=?, `deleted_at`=?, `uuid`=?, `username`=?, `password`=?, `nick_name`=?, `side_mode`=?, `header_img`=?, `base_color`=?, `authority_id`=?, `phone`=?, `email`=?, `enable`=?;
SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `uuid`, `username`, `password`, `nick_name`, `side_mode`, `header_img`, `base_color`, `authority_id`, `phone`, `email`, `enable` FROM `gva`.`sys_users` WHERE `id`=?;
UPDATE `gva`.`sys_users` SET `id`=?, `created_at`=?, `updated_at`=?, `deleted_at`=?, `uuid`=?, `username`=?, `password`=?, `nick_name`=?, `side_mode`=?, `header_img`=?, `base_color`=?, `authority_id`=?, `phone`=?, `email`=?, `enable`=? WHERE `id`=?;
type Sys_users struct {
	Id int `json:"id,omitempty"`
	Created_at string `json:"created_at,omitempty"`
	Updated_at string `json:"updated_at,omitempty"`
	Deleted_at string `json:"deleted_at,omitempty"`
	Uuid string `json:"uuid,omitempty"`
	Username string `json:"username,omitempty"`
	Password string `json:"password,omitempty"`
	Nick_name string `json:"nick_name,omitempty"`
	Side_mode string `json:"side_mode,omitempty"`
	Header_img string `json:"header_img,omitempty"`
	Base_color string `json:"base_color,omitempty"`
	Authority_id int `json:"authority_id,omitempty"`
	Phone string `json:"phone,omitempty"`
	Email string `json:"email,omitempty"`
	Enable int `json:"enable,omitempty"`
}
func I_sys_userss(ss []Sys_users) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `gva`.`sys_users`(`id`, `created_at`, `updated_at`, `deleted_at`, `uuid`, `username`, `password`, `nick_name`, `side_mode`, `header_img`, `base_color`, `authority_id`, `phone`, `email`, `enable`) VALUES")
	sqlArgs := []interface{}{}
	for i, s := range ss {
		if i < len(ss)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Uuid, s.Username, s.Password, s.Nick_name, s.Side_mode, s.Header_img, s.Base_color, s.Authority_id, s.Phone, s.Email, s.Enable)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_sys_users(s *Sys_users) (ss []Sys_users, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `id`, `created_at`, `updated_at`, `deleted_at`, `uuid`, `username`, `password`, `nick_name`, `side_mode`, `header_img`, `base_color`, `authority_id`, `phone`, `email`, `enable` FROM `gva`.`sys_users` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if s.Id != 0 {
		sqlBuf.WriteString("AND `id`=? ")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("AND `created_at`=? ")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("AND `updated_at`=? ")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("AND `deleted_at`=? ")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Uuid != "" {
		sqlBuf.WriteString("AND `uuid`=? ")
		sqlArgs = append(sqlArgs, s.Uuid)
	}
	if s.Username != "" {
		sqlBuf.WriteString("AND `username`=? ")
		sqlArgs = append(sqlArgs, s.Username)
	}
	if s.Password != "" {
		sqlBuf.WriteString("AND `password`=? ")
		sqlArgs = append(sqlArgs, s.Password)
	}
	if s.Nick_name != "" {
		sqlBuf.WriteString("AND `nick_name`=? ")
		sqlArgs = append(sqlArgs, s.Nick_name)
	}
	if s.Side_mode != "" {
		sqlBuf.WriteString("AND `side_mode`=? ")
		sqlArgs = append(sqlArgs, s.Side_mode)
	}
	if s.Header_img != "" {
		sqlBuf.WriteString("AND `header_img`=? ")
		sqlArgs = append(sqlArgs, s.Header_img)
	}
	if s.Base_color != "" {
		sqlBuf.WriteString("AND `base_color`=? ")
		sqlArgs = append(sqlArgs, s.Base_color)
	}
	if s.Authority_id != 0 {
		sqlBuf.WriteString("AND `authority_id`=? ")
		sqlArgs = append(sqlArgs, s.Authority_id)
	}
	if s.Phone != "" {
		sqlBuf.WriteString("AND `phone`=? ")
		sqlArgs = append(sqlArgs, s.Phone)
	}
	if s.Email != "" {
		sqlBuf.WriteString("AND `email`=? ")
		sqlArgs = append(sqlArgs, s.Email)
	}
	if s.Enable != 0 {
		sqlBuf.WriteString("AND `enable`=? ")
		sqlArgs = append(sqlArgs, s.Enable)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ss)
	return
}
func IU_sys_users(s *Sys_users) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `gva`.`sys_users`(`id`, `created_at`, `updated_at`, `deleted_at`, `uuid`, `username`, `password`, `nick_name`, `side_mode`, `header_img`, `base_color`, `authority_id`, `phone`, `email`, `enable`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{s.Id, s.Created_at, s.Updated_at, s.Deleted_at, s.Uuid, s.Username, s.Password, s.Nick_name, s.Side_mode, s.Header_img, s.Base_color, s.Authority_id, s.Phone, s.Email, s.Enable}
	if s.Id != 0 {
		sqlBuf.WriteString("`id`=?,")
		sqlArgs = append(sqlArgs, s.Id)
	}
	if s.Created_at != "" {
		sqlBuf.WriteString("`created_at`=?,")
		sqlArgs = append(sqlArgs, s.Created_at)
	}
	if s.Updated_at != "" {
		sqlBuf.WriteString("`updated_at`=?,")
		sqlArgs = append(sqlArgs, s.Updated_at)
	}
	if s.Deleted_at != "" {
		sqlBuf.WriteString("`deleted_at`=?,")
		sqlArgs = append(sqlArgs, s.Deleted_at)
	}
	if s.Uuid != "" {
		sqlBuf.WriteString("`uuid`=?,")
		sqlArgs = append(sqlArgs, s.Uuid)
	}
	if s.Username != "" {
		sqlBuf.WriteString("`username`=?,")
		sqlArgs = append(sqlArgs, s.Username)
	}
	if s.Password != "" {
		sqlBuf.WriteString("`password`=?,")
		sqlArgs = append(sqlArgs, s.Password)
	}
	if s.Nick_name != "" {
		sqlBuf.WriteString("`nick_name`=?,")
		sqlArgs = append(sqlArgs, s.Nick_name)
	}
	if s.Side_mode != "" {
		sqlBuf.WriteString("`side_mode`=?,")
		sqlArgs = append(sqlArgs, s.Side_mode)
	}
	if s.Header_img != "" {
		sqlBuf.WriteString("`header_img`=?,")
		sqlArgs = append(sqlArgs, s.Header_img)
	}
	if s.Base_color != "" {
		sqlBuf.WriteString("`base_color`=?,")
		sqlArgs = append(sqlArgs, s.Base_color)
	}
	if s.Authority_id != 0 {
		sqlBuf.WriteString("`authority_id`=?,")
		sqlArgs = append(sqlArgs, s.Authority_id)
	}
	if s.Phone != "" {
		sqlBuf.WriteString("`phone`=?,")
		sqlArgs = append(sqlArgs, s.Phone)
	}
	if s.Email != "" {
		sqlBuf.WriteString("`email`=?,")
		sqlArgs = append(sqlArgs, s.Email)
	}
	if s.Enable != 0 {
		sqlBuf.WriteString("`enable`=?,")
		sqlArgs = append(sqlArgs, s.Enable)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

