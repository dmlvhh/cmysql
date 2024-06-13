#url_info
INSERT INTO `url`.`url_info`(`url`, `domain`, `main_domain`, `type`, `ct`) VALUES(?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `url`=?, `domain`=?, `main_domain`=?, `type`=?, `ct`=?;
SELECT `url`, `domain`, `main_domain`, `type`, `ct` FROM `url`.`url_info` WHERE ;
UPDATE `url`.`url_info` SET `url`=?, `domain`=?, `main_domain`=?, `type`=?, `ct`=? WHERE ;
type Url_info struct {
	Url string `json:"url,omitempty"`
	Domain string `json:"domain,omitempty"`
	Main_domain string `json:"main_domain,omitempty"`
	Type int `json:"type,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_url_infos(us []Url_info) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `url`.`url_info`(`url`, `domain`, `main_domain`, `type`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, u := range us {
		if i < len(us)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, u.Url, u.Domain, u.Main_domain, u.Type, u.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_url_info(u *Url_info) (us []Url_info, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `url`, `domain`, `main_domain`, `type`, `ct` FROM `url`.`url_info` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if u.Url != "" {
		sqlBuf.WriteString("AND `url`=? ")
		sqlArgs = append(sqlArgs, u.Url)
	}
	if u.Domain != "" {
		sqlBuf.WriteString("AND `domain`=? ")
		sqlArgs = append(sqlArgs, u.Domain)
	}
	if u.Main_domain != "" {
		sqlBuf.WriteString("AND `main_domain`=? ")
		sqlArgs = append(sqlArgs, u.Main_domain)
	}
	if u.Type != 0 {
		sqlBuf.WriteString("AND `type`=? ")
		sqlArgs = append(sqlArgs, u.Type)
	}
	if u.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, u.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &us)
	return
}
func IU_url_info(u *Url_info) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `url`.`url_info`(`url`, `domain`, `main_domain`, `type`, `ct`) VALUES(?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{u.Url, u.Domain, u.Main_domain, u.Type, u.Ct}
	if u.Url != "" {
		sqlBuf.WriteString("`url`=?,")
		sqlArgs = append(sqlArgs, u.Url)
	}
	if u.Domain != "" {
		sqlBuf.WriteString("`domain`=?,")
		sqlArgs = append(sqlArgs, u.Domain)
	}
	if u.Main_domain != "" {
		sqlBuf.WriteString("`main_domain`=?,")
		sqlArgs = append(sqlArgs, u.Main_domain)
	}
	if u.Type != 0 {
		sqlBuf.WriteString("`type`=?,")
		sqlArgs = append(sqlArgs, u.Type)
	}
	if u.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, u.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

