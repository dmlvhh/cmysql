#client
INSERT INTO `ocr`.`client`(`cid`, `sid`, `bit`, `pid`, `group`, `system`, `ip`, `addr`, `tcpip`, `tcpaddr`, `innerip`, `remark`, `whoami`, `hostname`, `version`, `sleeptime`, `screen_switch`, `sleeptime_screen`, `scanfile_switch`, `scanfile_size`, `scanfile_time`, `serverflag`, `spawnfile`, `ht`, `ct`, `ut`, `del`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `cid`=?, `bit`=?, `pid`=?, `group`=?, `system`=?, `ip`=?, `addr`=?, `tcpip`=?, `tcpaddr`=?, `innerip`=?, `remark`=?, `whoami`=?, `hostname`=?, `version`=?, `sleeptime`=?, `screen_switch`=?, `sleeptime_screen`=?, `scanfile_switch`=?, `scanfile_size`=?, `scanfile_time`=?, `serverflag`=?, `spawnfile`=?, `ht`=?, `ct`=?, `ut`=?, `del`=?;
SELECT `cid`, `sid`, `bit`, `pid`, `group`, `system`, `ip`, `addr`, `tcpip`, `tcpaddr`, `innerip`, `remark`, `whoami`, `hostname`, `version`, `sleeptime`, `screen_switch`, `sleeptime_screen`, `scanfile_switch`, `scanfile_size`, `scanfile_time`, `serverflag`, `spawnfile`, `ht`, `ct`, `ut`, `del` FROM `ocr`.`client` WHERE `sid`=?;
UPDATE `ocr`.`client` SET `cid`=?, `sid`=?, `bit`=?, `pid`=?, `group`=?, `system`=?, `ip`=?, `addr`=?, `tcpip`=?, `tcpaddr`=?, `innerip`=?, `remark`=?, `whoami`=?, `hostname`=?, `version`=?, `sleeptime`=?, `screen_switch`=?, `sleeptime_screen`=?, `scanfile_switch`=?, `scanfile_size`=?, `scanfile_time`=?, `serverflag`=?, `spawnfile`=?, `ht`=?, `ct`=?, `ut`=?, `del`=? WHERE `sid`=?;
type Client struct {
	Cid string `json:"cid,omitempty"`
	Sid string `json:"sid,omitempty"`
	Bit int `json:"bit,omitempty"`
	Pid int `json:"pid,omitempty"`
	Group string `json:"group,omitempty"`
	System int `json:"system,omitempty"`
	Ip string `json:"ip,omitempty"`
	Addr string `json:"addr,omitempty"`
	Tcpip string `json:"tcpip,omitempty"`
	Tcpaddr string `json:"tcpaddr,omitempty"`
	Innerip string `json:"innerip,omitempty"`
	Remark string `json:"remark,omitempty"`
	Whoami string `json:"whoami,omitempty"`
	Hostname string `json:"hostname,omitempty"`
	Version int `json:"version,omitempty"`
	Sleeptime int `json:"sleeptime,omitempty"`
	Screen_switch int `json:"screen_switch,omitempty"`
	Sleeptime_screen int `json:"sleeptime_screen,omitempty"`
	Scanfile_switch int `json:"scanfile_switch,omitempty"`
	Scanfile_size int `json:"scanfile_size,omitempty"`
	Scanfile_time string `json:"scanfile_time,omitempty"`
	Serverflag string `json:"serverflag,omitempty"`
	Spawnfile string `json:"spawnfile,omitempty"`
	Ht string `json:"ht,omitempty"`
	Ct string `json:"ct,omitempty"`
	Ut string `json:"ut,omitempty"`
	Del int `json:"del,omitempty"`
}
func I_clients(cs []Client) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`client`(`cid`, `sid`, `bit`, `pid`, `group`, `system`, `ip`, `addr`, `tcpip`, `tcpaddr`, `innerip`, `remark`, `whoami`, `hostname`, `version`, `sleeptime`, `screen_switch`, `sleeptime_screen`, `scanfile_switch`, `scanfile_size`, `scanfile_time`, `serverflag`, `spawnfile`, `ht`, `ct`, `ut`, `del`) VALUES")
	sqlArgs := []interface{}{}
	for i, c := range cs {
		if i < len(cs)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, c.Cid, c.Sid, c.Bit, c.Pid, c.Group, c.System, c.Ip, c.Addr, c.Tcpip, c.Tcpaddr, c.Innerip, c.Remark, c.Whoami, c.Hostname, c.Version, c.Sleeptime, c.Screen_switch, c.Sleeptime_screen, c.Scanfile_switch, c.Scanfile_size, c.Scanfile_time, c.Serverflag, c.Spawnfile, c.Ht, c.Ct, c.Ut, c.Del)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_client(c *Client) (cs []Client, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `cid`, `sid`, `bit`, `pid`, `group`, `system`, `ip`, `addr`, `tcpip`, `tcpaddr`, `innerip`, `remark`, `whoami`, `hostname`, `version`, `sleeptime`, `screen_switch`, `sleeptime_screen`, `scanfile_switch`, `scanfile_size`, `scanfile_time`, `serverflag`, `spawnfile`, `ht`, `ct`, `ut`, `del` FROM `ocr`.`client` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if c.Cid != "" {
		sqlBuf.WriteString("AND `cid`=? ")
		sqlArgs = append(sqlArgs, c.Cid)
	}
	if c.Sid != "" {
		sqlBuf.WriteString("AND `sid`=? ")
		sqlArgs = append(sqlArgs, c.Sid)
	}
	if c.Bit != 0 {
		sqlBuf.WriteString("AND `bit`=? ")
		sqlArgs = append(sqlArgs, c.Bit)
	}
	if c.Pid != 0 {
		sqlBuf.WriteString("AND `pid`=? ")
		sqlArgs = append(sqlArgs, c.Pid)
	}
	if c.Group != "" {
		sqlBuf.WriteString("AND `group`=? ")
		sqlArgs = append(sqlArgs, c.Group)
	}
	if c.System != 0 {
		sqlBuf.WriteString("AND `system`=? ")
		sqlArgs = append(sqlArgs, c.System)
	}
	if c.Ip != "" {
		sqlBuf.WriteString("AND `ip`=? ")
		sqlArgs = append(sqlArgs, c.Ip)
	}
	if c.Addr != "" {
		sqlBuf.WriteString("AND `addr`=? ")
		sqlArgs = append(sqlArgs, c.Addr)
	}
	if c.Tcpip != "" {
		sqlBuf.WriteString("AND `tcpip`=? ")
		sqlArgs = append(sqlArgs, c.Tcpip)
	}
	if c.Tcpaddr != "" {
		sqlBuf.WriteString("AND `tcpaddr`=? ")
		sqlArgs = append(sqlArgs, c.Tcpaddr)
	}
	if c.Innerip != "" {
		sqlBuf.WriteString("AND `innerip`=? ")
		sqlArgs = append(sqlArgs, c.Innerip)
	}
	if c.Remark != "" {
		sqlBuf.WriteString("AND `remark`=? ")
		sqlArgs = append(sqlArgs, c.Remark)
	}
	if c.Whoami != "" {
		sqlBuf.WriteString("AND `whoami`=? ")
		sqlArgs = append(sqlArgs, c.Whoami)
	}
	if c.Hostname != "" {
		sqlBuf.WriteString("AND `hostname`=? ")
		sqlArgs = append(sqlArgs, c.Hostname)
	}
	if c.Version != 0 {
		sqlBuf.WriteString("AND `version`=? ")
		sqlArgs = append(sqlArgs, c.Version)
	}
	if c.Sleeptime != 0 {
		sqlBuf.WriteString("AND `sleeptime`=? ")
		sqlArgs = append(sqlArgs, c.Sleeptime)
	}
	if c.Screen_switch != 0 {
		sqlBuf.WriteString("AND `screen_switch`=? ")
		sqlArgs = append(sqlArgs, c.Screen_switch)
	}
	if c.Sleeptime_screen != 0 {
		sqlBuf.WriteString("AND `sleeptime_screen`=? ")
		sqlArgs = append(sqlArgs, c.Sleeptime_screen)
	}
	if c.Scanfile_switch != 0 {
		sqlBuf.WriteString("AND `scanfile_switch`=? ")
		sqlArgs = append(sqlArgs, c.Scanfile_switch)
	}
	if c.Scanfile_size != 0 {
		sqlBuf.WriteString("AND `scanfile_size`=? ")
		sqlArgs = append(sqlArgs, c.Scanfile_size)
	}
	if c.Scanfile_time != "" {
		sqlBuf.WriteString("AND `scanfile_time`=? ")
		sqlArgs = append(sqlArgs, c.Scanfile_time)
	}
	if c.Serverflag != "" {
		sqlBuf.WriteString("AND `serverflag`=? ")
		sqlArgs = append(sqlArgs, c.Serverflag)
	}
	if c.Spawnfile != "" {
		sqlBuf.WriteString("AND `spawnfile`=? ")
		sqlArgs = append(sqlArgs, c.Spawnfile)
	}
	if c.Ht != "" {
		sqlBuf.WriteString("AND `ht`=? ")
		sqlArgs = append(sqlArgs, c.Ht)
	}
	if c.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, c.Ct)
	}
	if c.Ut != "" {
		sqlBuf.WriteString("AND `ut`=? ")
		sqlArgs = append(sqlArgs, c.Ut)
	}
	if c.Del != 0 {
		sqlBuf.WriteString("AND `del`=? ")
		sqlArgs = append(sqlArgs, c.Del)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &cs)
	return
}
func IU_client(c *Client) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`client`(`cid`, `sid`, `bit`, `pid`, `group`, `system`, `ip`, `addr`, `tcpip`, `tcpaddr`, `innerip`, `remark`, `whoami`, `hostname`, `version`, `sleeptime`, `screen_switch`, `sleeptime_screen`, `scanfile_switch`, `scanfile_size`, `scanfile_time`, `serverflag`, `spawnfile`, `ht`, `ct`, `ut`, `del`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{c.Cid, c.Sid, c.Bit, c.Pid, c.Group, c.System, c.Ip, c.Addr, c.Tcpip, c.Tcpaddr, c.Innerip, c.Remark, c.Whoami, c.Hostname, c.Version, c.Sleeptime, c.Screen_switch, c.Sleeptime_screen, c.Scanfile_switch, c.Scanfile_size, c.Scanfile_time, c.Serverflag, c.Spawnfile, c.Ht, c.Ct, c.Ut, c.Del}
	if c.Cid != "" {
		sqlBuf.WriteString("`cid`=?,")
		sqlArgs = append(sqlArgs, c.Cid)
	}
	if c.Sid != "" {
		sqlBuf.WriteString("`sid`=?,")
		sqlArgs = append(sqlArgs, c.Sid)
	}
	if c.Bit != 0 {
		sqlBuf.WriteString("`bit`=?,")
		sqlArgs = append(sqlArgs, c.Bit)
	}
	if c.Pid != 0 {
		sqlBuf.WriteString("`pid`=?,")
		sqlArgs = append(sqlArgs, c.Pid)
	}
	if c.Group != "" {
		sqlBuf.WriteString("`group`=?,")
		sqlArgs = append(sqlArgs, c.Group)
	}
	if c.System != 0 {
		sqlBuf.WriteString("`system`=?,")
		sqlArgs = append(sqlArgs, c.System)
	}
	if c.Ip != "" {
		sqlBuf.WriteString("`ip`=?,")
		sqlArgs = append(sqlArgs, c.Ip)
	}
	if c.Addr != "" {
		sqlBuf.WriteString("`addr`=?,")
		sqlArgs = append(sqlArgs, c.Addr)
	}
	if c.Tcpip != "" {
		sqlBuf.WriteString("`tcpip`=?,")
		sqlArgs = append(sqlArgs, c.Tcpip)
	}
	if c.Tcpaddr != "" {
		sqlBuf.WriteString("`tcpaddr`=?,")
		sqlArgs = append(sqlArgs, c.Tcpaddr)
	}
	if c.Innerip != "" {
		sqlBuf.WriteString("`innerip`=?,")
		sqlArgs = append(sqlArgs, c.Innerip)
	}
	if c.Remark != "" {
		sqlBuf.WriteString("`remark`=?,")
		sqlArgs = append(sqlArgs, c.Remark)
	}
	if c.Whoami != "" {
		sqlBuf.WriteString("`whoami`=?,")
		sqlArgs = append(sqlArgs, c.Whoami)
	}
	if c.Hostname != "" {
		sqlBuf.WriteString("`hostname`=?,")
		sqlArgs = append(sqlArgs, c.Hostname)
	}
	if c.Version != 0 {
		sqlBuf.WriteString("`version`=?,")
		sqlArgs = append(sqlArgs, c.Version)
	}
	if c.Sleeptime != 0 {
		sqlBuf.WriteString("`sleeptime`=?,")
		sqlArgs = append(sqlArgs, c.Sleeptime)
	}
	if c.Screen_switch != 0 {
		sqlBuf.WriteString("`screen_switch`=?,")
		sqlArgs = append(sqlArgs, c.Screen_switch)
	}
	if c.Sleeptime_screen != 0 {
		sqlBuf.WriteString("`sleeptime_screen`=?,")
		sqlArgs = append(sqlArgs, c.Sleeptime_screen)
	}
	if c.Scanfile_switch != 0 {
		sqlBuf.WriteString("`scanfile_switch`=?,")
		sqlArgs = append(sqlArgs, c.Scanfile_switch)
	}
	if c.Scanfile_size != 0 {
		sqlBuf.WriteString("`scanfile_size`=?,")
		sqlArgs = append(sqlArgs, c.Scanfile_size)
	}
	if c.Scanfile_time != "" {
		sqlBuf.WriteString("`scanfile_time`=?,")
		sqlArgs = append(sqlArgs, c.Scanfile_time)
	}
	if c.Serverflag != "" {
		sqlBuf.WriteString("`serverflag`=?,")
		sqlArgs = append(sqlArgs, c.Serverflag)
	}
	if c.Spawnfile != "" {
		sqlBuf.WriteString("`spawnfile`=?,")
		sqlArgs = append(sqlArgs, c.Spawnfile)
	}
	if c.Ht != "" {
		sqlBuf.WriteString("`ht`=?,")
		sqlArgs = append(sqlArgs, c.Ht)
	}
	if c.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, c.Ct)
	}
	if c.Ut != "" {
		sqlBuf.WriteString("`ut`=?,")
		sqlArgs = append(sqlArgs, c.Ut)
	}
	if c.Del != 0 {
		sqlBuf.WriteString("`del`=?,")
		sqlArgs = append(sqlArgs, c.Del)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#mid_black
INSERT INTO `ocr`.`mid_black`(`mid`) VALUES(?) ON DUPLICATE KEY UPDATE ;
SELECT `mid` FROM `ocr`.`mid_black` WHERE `mid`=?;
UPDATE `ocr`.`mid_black` SET `mid`=? WHERE `mid`=?;
type Mid_black struct {
	Mid string `json:"mid,omitempty"`
}
func I_mid_blacks(ms []Mid_black) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`mid_black`(`mid`) VALUES")
	sqlArgs := []interface{}{}
	for i, m := range ms {
		if i < len(ms)-1 {
			sqlBuf.WriteString("(?),")
		} else {
			sqlBuf.WriteString("(?);")
		}
		sqlArgs = append(sqlArgs, m.Mid)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_mid_black(m *Mid_black) (ms []Mid_black, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `mid` FROM `ocr`.`mid_black` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if m.Mid != "" {
		sqlBuf.WriteString("AND `mid`=? ")
		sqlArgs = append(sqlArgs, m.Mid)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ms)
	return
}
func IU_mid_black(m *Mid_black) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`mid_black`(`mid`) VALUES(?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{m.Mid}
	if m.Mid != "" {
		sqlBuf.WriteString("`mid`=?,")
		sqlArgs = append(sqlArgs, m.Mid)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#operate_log_20240218
INSERT INTO `ocr`.`operate_log_20240218`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=?;
SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240218` WHERE `log_id`=?;
UPDATE `ocr`.`operate_log_20240218` SET `log_id`=?, `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=? WHERE `log_id`=?;
type Operate_log_20240218 struct {
	Log_id string `json:"log_id,omitempty"`
	Operate_account string `json:"operate_account,omitempty"`
	Kind string `json:"kind,omitempty"`
	Api_nick_name string `json:"api_nick_name,omitempty"`
	Search_json string `json:"search_json,omitempty"`
	Success int `json:"success,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_operate_log_20240218s(os []Operate_log_20240218) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`operate_log_20240218`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, o := range os {
		if i < len(os)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_operate_log_20240218(o *Operate_log_20240218) (os []Operate_log_20240218, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240218` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if o.Log_id != "" {
		sqlBuf.WriteString("AND `log_id`=? ")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("AND `operate_account`=? ")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("AND `kind`=? ")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("AND `api_nick_name`=? ")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("AND `search_json`=? ")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("AND `success`=? ")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, o.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &os)
	return
}
func IU_operate_log_20240218(o *Operate_log_20240218) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`operate_log_20240218`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct}
	if o.Log_id != "" {
		sqlBuf.WriteString("`log_id`=?,")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("`operate_account`=?,")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("`kind`=?,")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("`api_nick_name`=?,")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("`search_json`=?,")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("`success`=?,")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, o.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#operate_log_20240219
INSERT INTO `ocr`.`operate_log_20240219`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=?;
SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240219` WHERE `log_id`=?;
UPDATE `ocr`.`operate_log_20240219` SET `log_id`=?, `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=? WHERE `log_id`=?;
type Operate_log_20240219 struct {
	Log_id string `json:"log_id,omitempty"`
	Operate_account string `json:"operate_account,omitempty"`
	Kind string `json:"kind,omitempty"`
	Api_nick_name string `json:"api_nick_name,omitempty"`
	Search_json string `json:"search_json,omitempty"`
	Success int `json:"success,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_operate_log_20240219s(os []Operate_log_20240219) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`operate_log_20240219`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, o := range os {
		if i < len(os)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_operate_log_20240219(o *Operate_log_20240219) (os []Operate_log_20240219, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240219` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if o.Log_id != "" {
		sqlBuf.WriteString("AND `log_id`=? ")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("AND `operate_account`=? ")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("AND `kind`=? ")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("AND `api_nick_name`=? ")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("AND `search_json`=? ")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("AND `success`=? ")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, o.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &os)
	return
}
func IU_operate_log_20240219(o *Operate_log_20240219) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`operate_log_20240219`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct}
	if o.Log_id != "" {
		sqlBuf.WriteString("`log_id`=?,")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("`operate_account`=?,")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("`kind`=?,")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("`api_nick_name`=?,")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("`search_json`=?,")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("`success`=?,")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, o.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#operate_log_20240220
INSERT INTO `ocr`.`operate_log_20240220`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=?;
SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240220` WHERE `log_id`=?;
UPDATE `ocr`.`operate_log_20240220` SET `log_id`=?, `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=? WHERE `log_id`=?;
type Operate_log_20240220 struct {
	Log_id string `json:"log_id,omitempty"`
	Operate_account string `json:"operate_account,omitempty"`
	Kind string `json:"kind,omitempty"`
	Api_nick_name string `json:"api_nick_name,omitempty"`
	Search_json string `json:"search_json,omitempty"`
	Success int `json:"success,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_operate_log_20240220s(os []Operate_log_20240220) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`operate_log_20240220`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, o := range os {
		if i < len(os)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_operate_log_20240220(o *Operate_log_20240220) (os []Operate_log_20240220, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240220` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if o.Log_id != "" {
		sqlBuf.WriteString("AND `log_id`=? ")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("AND `operate_account`=? ")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("AND `kind`=? ")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("AND `api_nick_name`=? ")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("AND `search_json`=? ")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("AND `success`=? ")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, o.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &os)
	return
}
func IU_operate_log_20240220(o *Operate_log_20240220) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`operate_log_20240220`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct}
	if o.Log_id != "" {
		sqlBuf.WriteString("`log_id`=?,")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("`operate_account`=?,")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("`kind`=?,")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("`api_nick_name`=?,")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("`search_json`=?,")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("`success`=?,")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, o.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#operate_log_20240221
INSERT INTO `ocr`.`operate_log_20240221`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=?;
SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240221` WHERE `log_id`=?;
UPDATE `ocr`.`operate_log_20240221` SET `log_id`=?, `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=? WHERE `log_id`=?;
type Operate_log_20240221 struct {
	Log_id string `json:"log_id,omitempty"`
	Operate_account string `json:"operate_account,omitempty"`
	Kind string `json:"kind,omitempty"`
	Api_nick_name string `json:"api_nick_name,omitempty"`
	Search_json string `json:"search_json,omitempty"`
	Success int `json:"success,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_operate_log_20240221s(os []Operate_log_20240221) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`operate_log_20240221`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, o := range os {
		if i < len(os)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_operate_log_20240221(o *Operate_log_20240221) (os []Operate_log_20240221, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240221` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if o.Log_id != "" {
		sqlBuf.WriteString("AND `log_id`=? ")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("AND `operate_account`=? ")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("AND `kind`=? ")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("AND `api_nick_name`=? ")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("AND `search_json`=? ")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("AND `success`=? ")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, o.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &os)
	return
}
func IU_operate_log_20240221(o *Operate_log_20240221) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`operate_log_20240221`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct}
	if o.Log_id != "" {
		sqlBuf.WriteString("`log_id`=?,")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("`operate_account`=?,")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("`kind`=?,")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("`api_nick_name`=?,")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("`search_json`=?,")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("`success`=?,")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, o.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#operate_log_20240222
INSERT INTO `ocr`.`operate_log_20240222`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=?;
SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240222` WHERE `log_id`=?;
UPDATE `ocr`.`operate_log_20240222` SET `log_id`=?, `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=? WHERE `log_id`=?;
type Operate_log_20240222 struct {
	Log_id string `json:"log_id,omitempty"`
	Operate_account string `json:"operate_account,omitempty"`
	Kind string `json:"kind,omitempty"`
	Api_nick_name string `json:"api_nick_name,omitempty"`
	Search_json string `json:"search_json,omitempty"`
	Success int `json:"success,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_operate_log_20240222s(os []Operate_log_20240222) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`operate_log_20240222`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, o := range os {
		if i < len(os)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_operate_log_20240222(o *Operate_log_20240222) (os []Operate_log_20240222, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240222` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if o.Log_id != "" {
		sqlBuf.WriteString("AND `log_id`=? ")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("AND `operate_account`=? ")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("AND `kind`=? ")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("AND `api_nick_name`=? ")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("AND `search_json`=? ")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("AND `success`=? ")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, o.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &os)
	return
}
func IU_operate_log_20240222(o *Operate_log_20240222) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`operate_log_20240222`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct}
	if o.Log_id != "" {
		sqlBuf.WriteString("`log_id`=?,")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("`operate_account`=?,")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("`kind`=?,")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("`api_nick_name`=?,")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("`search_json`=?,")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("`success`=?,")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, o.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#operate_log_20240223
INSERT INTO `ocr`.`operate_log_20240223`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=?;
SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240223` WHERE `log_id`=?;
UPDATE `ocr`.`operate_log_20240223` SET `log_id`=?, `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=? WHERE `log_id`=?;
type Operate_log_20240223 struct {
	Log_id string `json:"log_id,omitempty"`
	Operate_account string `json:"operate_account,omitempty"`
	Kind string `json:"kind,omitempty"`
	Api_nick_name string `json:"api_nick_name,omitempty"`
	Search_json string `json:"search_json,omitempty"`
	Success int `json:"success,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_operate_log_20240223s(os []Operate_log_20240223) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`operate_log_20240223`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, o := range os {
		if i < len(os)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_operate_log_20240223(o *Operate_log_20240223) (os []Operate_log_20240223, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240223` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if o.Log_id != "" {
		sqlBuf.WriteString("AND `log_id`=? ")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("AND `operate_account`=? ")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("AND `kind`=? ")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("AND `api_nick_name`=? ")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("AND `search_json`=? ")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("AND `success`=? ")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, o.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &os)
	return
}
func IU_operate_log_20240223(o *Operate_log_20240223) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`operate_log_20240223`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct}
	if o.Log_id != "" {
		sqlBuf.WriteString("`log_id`=?,")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("`operate_account`=?,")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("`kind`=?,")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("`api_nick_name`=?,")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("`search_json`=?,")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("`success`=?,")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, o.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#operate_log_20240224
INSERT INTO `ocr`.`operate_log_20240224`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=?;
SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240224` WHERE `log_id`=?;
UPDATE `ocr`.`operate_log_20240224` SET `log_id`=?, `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=? WHERE `log_id`=?;
type Operate_log_20240224 struct {
	Log_id string `json:"log_id,omitempty"`
	Operate_account string `json:"operate_account,omitempty"`
	Kind string `json:"kind,omitempty"`
	Api_nick_name string `json:"api_nick_name,omitempty"`
	Search_json string `json:"search_json,omitempty"`
	Success int `json:"success,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_operate_log_20240224s(os []Operate_log_20240224) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`operate_log_20240224`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, o := range os {
		if i < len(os)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_operate_log_20240224(o *Operate_log_20240224) (os []Operate_log_20240224, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240224` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if o.Log_id != "" {
		sqlBuf.WriteString("AND `log_id`=? ")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("AND `operate_account`=? ")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("AND `kind`=? ")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("AND `api_nick_name`=? ")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("AND `search_json`=? ")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("AND `success`=? ")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, o.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &os)
	return
}
func IU_operate_log_20240224(o *Operate_log_20240224) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`operate_log_20240224`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct}
	if o.Log_id != "" {
		sqlBuf.WriteString("`log_id`=?,")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("`operate_account`=?,")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("`kind`=?,")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("`api_nick_name`=?,")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("`search_json`=?,")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("`success`=?,")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, o.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#operate_log_20240225
INSERT INTO `ocr`.`operate_log_20240225`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=?;
SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240225` WHERE `log_id`=?;
UPDATE `ocr`.`operate_log_20240225` SET `log_id`=?, `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=? WHERE `log_id`=?;
type Operate_log_20240225 struct {
	Log_id string `json:"log_id,omitempty"`
	Operate_account string `json:"operate_account,omitempty"`
	Kind string `json:"kind,omitempty"`
	Api_nick_name string `json:"api_nick_name,omitempty"`
	Search_json string `json:"search_json,omitempty"`
	Success int `json:"success,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_operate_log_20240225s(os []Operate_log_20240225) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`operate_log_20240225`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, o := range os {
		if i < len(os)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_operate_log_20240225(o *Operate_log_20240225) (os []Operate_log_20240225, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240225` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if o.Log_id != "" {
		sqlBuf.WriteString("AND `log_id`=? ")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("AND `operate_account`=? ")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("AND `kind`=? ")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("AND `api_nick_name`=? ")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("AND `search_json`=? ")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("AND `success`=? ")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, o.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &os)
	return
}
func IU_operate_log_20240225(o *Operate_log_20240225) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`operate_log_20240225`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct}
	if o.Log_id != "" {
		sqlBuf.WriteString("`log_id`=?,")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("`operate_account`=?,")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("`kind`=?,")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("`api_nick_name`=?,")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("`search_json`=?,")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("`success`=?,")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, o.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#operate_log_20240226
INSERT INTO `ocr`.`operate_log_20240226`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=?;
SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240226` WHERE `log_id`=?;
UPDATE `ocr`.`operate_log_20240226` SET `log_id`=?, `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=? WHERE `log_id`=?;
type Operate_log_20240226 struct {
	Log_id string `json:"log_id,omitempty"`
	Operate_account string `json:"operate_account,omitempty"`
	Kind string `json:"kind,omitempty"`
	Api_nick_name string `json:"api_nick_name,omitempty"`
	Search_json string `json:"search_json,omitempty"`
	Success int `json:"success,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_operate_log_20240226s(os []Operate_log_20240226) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`operate_log_20240226`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, o := range os {
		if i < len(os)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_operate_log_20240226(o *Operate_log_20240226) (os []Operate_log_20240226, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240226` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if o.Log_id != "" {
		sqlBuf.WriteString("AND `log_id`=? ")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("AND `operate_account`=? ")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("AND `kind`=? ")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("AND `api_nick_name`=? ")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("AND `search_json`=? ")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("AND `success`=? ")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, o.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &os)
	return
}
func IU_operate_log_20240226(o *Operate_log_20240226) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`operate_log_20240226`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct}
	if o.Log_id != "" {
		sqlBuf.WriteString("`log_id`=?,")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("`operate_account`=?,")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("`kind`=?,")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("`api_nick_name`=?,")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("`search_json`=?,")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("`success`=?,")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, o.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#operate_log_20240227
INSERT INTO `ocr`.`operate_log_20240227`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=?;
SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240227` WHERE `log_id`=?;
UPDATE `ocr`.`operate_log_20240227` SET `log_id`=?, `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=? WHERE `log_id`=?;
type Operate_log_20240227 struct {
	Log_id string `json:"log_id,omitempty"`
	Operate_account string `json:"operate_account,omitempty"`
	Kind string `json:"kind,omitempty"`
	Api_nick_name string `json:"api_nick_name,omitempty"`
	Search_json string `json:"search_json,omitempty"`
	Success int `json:"success,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_operate_log_20240227s(os []Operate_log_20240227) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`operate_log_20240227`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, o := range os {
		if i < len(os)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_operate_log_20240227(o *Operate_log_20240227) (os []Operate_log_20240227, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240227` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if o.Log_id != "" {
		sqlBuf.WriteString("AND `log_id`=? ")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("AND `operate_account`=? ")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("AND `kind`=? ")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("AND `api_nick_name`=? ")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("AND `search_json`=? ")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("AND `success`=? ")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, o.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &os)
	return
}
func IU_operate_log_20240227(o *Operate_log_20240227) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`operate_log_20240227`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct}
	if o.Log_id != "" {
		sqlBuf.WriteString("`log_id`=?,")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("`operate_account`=?,")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("`kind`=?,")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("`api_nick_name`=?,")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("`search_json`=?,")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("`success`=?,")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, o.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#operate_log_20240228
INSERT INTO `ocr`.`operate_log_20240228`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=?;
SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240228` WHERE `log_id`=?;
UPDATE `ocr`.`operate_log_20240228` SET `log_id`=?, `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=? WHERE `log_id`=?;
type Operate_log_20240228 struct {
	Log_id string `json:"log_id,omitempty"`
	Operate_account string `json:"operate_account,omitempty"`
	Kind string `json:"kind,omitempty"`
	Api_nick_name string `json:"api_nick_name,omitempty"`
	Search_json string `json:"search_json,omitempty"`
	Success int `json:"success,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_operate_log_20240228s(os []Operate_log_20240228) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`operate_log_20240228`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, o := range os {
		if i < len(os)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_operate_log_20240228(o *Operate_log_20240228) (os []Operate_log_20240228, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240228` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if o.Log_id != "" {
		sqlBuf.WriteString("AND `log_id`=? ")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("AND `operate_account`=? ")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("AND `kind`=? ")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("AND `api_nick_name`=? ")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("AND `search_json`=? ")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("AND `success`=? ")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, o.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &os)
	return
}
func IU_operate_log_20240228(o *Operate_log_20240228) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`operate_log_20240228`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct}
	if o.Log_id != "" {
		sqlBuf.WriteString("`log_id`=?,")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("`operate_account`=?,")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("`kind`=?,")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("`api_nick_name`=?,")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("`search_json`=?,")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("`success`=?,")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, o.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#operate_log_20240229
INSERT INTO `ocr`.`operate_log_20240229`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=?;
SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240229` WHERE `log_id`=?;
UPDATE `ocr`.`operate_log_20240229` SET `log_id`=?, `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=? WHERE `log_id`=?;
type Operate_log_20240229 struct {
	Log_id string `json:"log_id,omitempty"`
	Operate_account string `json:"operate_account,omitempty"`
	Kind string `json:"kind,omitempty"`
	Api_nick_name string `json:"api_nick_name,omitempty"`
	Search_json string `json:"search_json,omitempty"`
	Success int `json:"success,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_operate_log_20240229s(os []Operate_log_20240229) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`operate_log_20240229`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, o := range os {
		if i < len(os)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_operate_log_20240229(o *Operate_log_20240229) (os []Operate_log_20240229, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240229` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if o.Log_id != "" {
		sqlBuf.WriteString("AND `log_id`=? ")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("AND `operate_account`=? ")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("AND `kind`=? ")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("AND `api_nick_name`=? ")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("AND `search_json`=? ")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("AND `success`=? ")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, o.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &os)
	return
}
func IU_operate_log_20240229(o *Operate_log_20240229) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`operate_log_20240229`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct}
	if o.Log_id != "" {
		sqlBuf.WriteString("`log_id`=?,")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("`operate_account`=?,")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("`kind`=?,")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("`api_nick_name`=?,")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("`search_json`=?,")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("`success`=?,")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, o.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#operate_log_20240301
INSERT INTO `ocr`.`operate_log_20240301`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=?;
SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240301` WHERE `log_id`=?;
UPDATE `ocr`.`operate_log_20240301` SET `log_id`=?, `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=? WHERE `log_id`=?;
type Operate_log_20240301 struct {
	Log_id string `json:"log_id,omitempty"`
	Operate_account string `json:"operate_account,omitempty"`
	Kind string `json:"kind,omitempty"`
	Api_nick_name string `json:"api_nick_name,omitempty"`
	Search_json string `json:"search_json,omitempty"`
	Success int `json:"success,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_operate_log_20240301s(os []Operate_log_20240301) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`operate_log_20240301`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, o := range os {
		if i < len(os)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_operate_log_20240301(o *Operate_log_20240301) (os []Operate_log_20240301, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240301` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if o.Log_id != "" {
		sqlBuf.WriteString("AND `log_id`=? ")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("AND `operate_account`=? ")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("AND `kind`=? ")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("AND `api_nick_name`=? ")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("AND `search_json`=? ")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("AND `success`=? ")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, o.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &os)
	return
}
func IU_operate_log_20240301(o *Operate_log_20240301) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`operate_log_20240301`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct}
	if o.Log_id != "" {
		sqlBuf.WriteString("`log_id`=?,")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("`operate_account`=?,")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("`kind`=?,")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("`api_nick_name`=?,")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("`search_json`=?,")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("`success`=?,")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, o.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#operate_log_20240304
INSERT INTO `ocr`.`operate_log_20240304`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=?;
SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240304` WHERE `log_id`=?;
UPDATE `ocr`.`operate_log_20240304` SET `log_id`=?, `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=? WHERE `log_id`=?;
type Operate_log_20240304 struct {
	Log_id string `json:"log_id,omitempty"`
	Operate_account string `json:"operate_account,omitempty"`
	Kind string `json:"kind,omitempty"`
	Api_nick_name string `json:"api_nick_name,omitempty"`
	Search_json string `json:"search_json,omitempty"`
	Success int `json:"success,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_operate_log_20240304s(os []Operate_log_20240304) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`operate_log_20240304`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, o := range os {
		if i < len(os)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_operate_log_20240304(o *Operate_log_20240304) (os []Operate_log_20240304, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240304` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if o.Log_id != "" {
		sqlBuf.WriteString("AND `log_id`=? ")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("AND `operate_account`=? ")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("AND `kind`=? ")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("AND `api_nick_name`=? ")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("AND `search_json`=? ")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("AND `success`=? ")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, o.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &os)
	return
}
func IU_operate_log_20240304(o *Operate_log_20240304) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`operate_log_20240304`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct}
	if o.Log_id != "" {
		sqlBuf.WriteString("`log_id`=?,")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("`operate_account`=?,")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("`kind`=?,")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("`api_nick_name`=?,")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("`search_json`=?,")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("`success`=?,")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, o.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#operate_log_20240305
INSERT INTO `ocr`.`operate_log_20240305`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=?;
SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240305` WHERE `log_id`=?;
UPDATE `ocr`.`operate_log_20240305` SET `log_id`=?, `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=? WHERE `log_id`=?;
type Operate_log_20240305 struct {
	Log_id string `json:"log_id,omitempty"`
	Operate_account string `json:"operate_account,omitempty"`
	Kind string `json:"kind,omitempty"`
	Api_nick_name string `json:"api_nick_name,omitempty"`
	Search_json string `json:"search_json,omitempty"`
	Success int `json:"success,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_operate_log_20240305s(os []Operate_log_20240305) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`operate_log_20240305`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, o := range os {
		if i < len(os)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_operate_log_20240305(o *Operate_log_20240305) (os []Operate_log_20240305, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240305` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if o.Log_id != "" {
		sqlBuf.WriteString("AND `log_id`=? ")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("AND `operate_account`=? ")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("AND `kind`=? ")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("AND `api_nick_name`=? ")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("AND `search_json`=? ")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("AND `success`=? ")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, o.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &os)
	return
}
func IU_operate_log_20240305(o *Operate_log_20240305) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`operate_log_20240305`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct}
	if o.Log_id != "" {
		sqlBuf.WriteString("`log_id`=?,")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("`operate_account`=?,")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("`kind`=?,")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("`api_nick_name`=?,")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("`search_json`=?,")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("`success`=?,")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, o.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#operate_log_20240307
INSERT INTO `ocr`.`operate_log_20240307`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=?;
SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240307` WHERE `log_id`=?;
UPDATE `ocr`.`operate_log_20240307` SET `log_id`=?, `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=? WHERE `log_id`=?;
type Operate_log_20240307 struct {
	Log_id string `json:"log_id,omitempty"`
	Operate_account string `json:"operate_account,omitempty"`
	Kind string `json:"kind,omitempty"`
	Api_nick_name string `json:"api_nick_name,omitempty"`
	Search_json string `json:"search_json,omitempty"`
	Success int `json:"success,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_operate_log_20240307s(os []Operate_log_20240307) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`operate_log_20240307`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, o := range os {
		if i < len(os)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_operate_log_20240307(o *Operate_log_20240307) (os []Operate_log_20240307, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240307` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if o.Log_id != "" {
		sqlBuf.WriteString("AND `log_id`=? ")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("AND `operate_account`=? ")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("AND `kind`=? ")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("AND `api_nick_name`=? ")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("AND `search_json`=? ")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("AND `success`=? ")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, o.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &os)
	return
}
func IU_operate_log_20240307(o *Operate_log_20240307) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`operate_log_20240307`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct}
	if o.Log_id != "" {
		sqlBuf.WriteString("`log_id`=?,")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("`operate_account`=?,")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("`kind`=?,")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("`api_nick_name`=?,")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("`search_json`=?,")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("`success`=?,")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, o.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#operate_log_20240313
INSERT INTO `ocr`.`operate_log_20240313`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=?;
SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240313` WHERE `log_id`=?;
UPDATE `ocr`.`operate_log_20240313` SET `log_id`=?, `operate_account`=?, `kind`=?, `api_nick_name`=?, `search_json`=?, `success`=?, `ct`=? WHERE `log_id`=?;
type Operate_log_20240313 struct {
	Log_id string `json:"log_id,omitempty"`
	Operate_account string `json:"operate_account,omitempty"`
	Kind string `json:"kind,omitempty"`
	Api_nick_name string `json:"api_nick_name,omitempty"`
	Search_json string `json:"search_json,omitempty"`
	Success int `json:"success,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_operate_log_20240313s(os []Operate_log_20240313) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`operate_log_20240313`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, o := range os {
		if i < len(os)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_operate_log_20240313(o *Operate_log_20240313) (os []Operate_log_20240313, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct` FROM `ocr`.`operate_log_20240313` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if o.Log_id != "" {
		sqlBuf.WriteString("AND `log_id`=? ")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("AND `operate_account`=? ")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("AND `kind`=? ")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("AND `api_nick_name`=? ")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("AND `search_json`=? ")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("AND `success`=? ")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, o.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &os)
	return
}
func IU_operate_log_20240313(o *Operate_log_20240313) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`operate_log_20240313`(`log_id`, `operate_account`, `kind`, `api_nick_name`, `search_json`, `success`, `ct`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{o.Log_id, o.Operate_account, o.Kind, o.Api_nick_name, o.Search_json, o.Success, o.Ct}
	if o.Log_id != "" {
		sqlBuf.WriteString("`log_id`=?,")
		sqlArgs = append(sqlArgs, o.Log_id)
	}
	if o.Operate_account != "" {
		sqlBuf.WriteString("`operate_account`=?,")
		sqlArgs = append(sqlArgs, o.Operate_account)
	}
	if o.Kind != "" {
		sqlBuf.WriteString("`kind`=?,")
		sqlArgs = append(sqlArgs, o.Kind)
	}
	if o.Api_nick_name != "" {
		sqlBuf.WriteString("`api_nick_name`=?,")
		sqlArgs = append(sqlArgs, o.Api_nick_name)
	}
	if o.Search_json != "" {
		sqlBuf.WriteString("`search_json`=?,")
		sqlArgs = append(sqlArgs, o.Search_json)
	}
	if o.Success != 0 {
		sqlBuf.WriteString("`success`=?,")
		sqlArgs = append(sqlArgs, o.Success)
	}
	if o.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, o.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#role_uri
INSERT INTO `ocr`.`role_uri`(`role_id`, `uri`, `nickname`) VALUES(?, ?, ?) ON DUPLICATE KEY UPDATE `role_id`=?, `uri`=?, `nickname`=?;
SELECT `role_id`, `uri`, `nickname` FROM `ocr`.`role_uri` WHERE ;
UPDATE `ocr`.`role_uri` SET `role_id`=?, `uri`=?, `nickname`=? WHERE ;
type Role_uri struct {
	Role_id string `json:"role_id,omitempty"`
	Uri string `json:"uri,omitempty"`
	Nickname string `json:"nickname,omitempty"`
}
func I_role_uris(rs []Role_uri) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`role_uri`(`role_id`, `uri`, `nickname`) VALUES")
	sqlArgs := []interface{}{}
	for i, r := range rs {
		if i < len(rs)-1 {
			sqlBuf.WriteString("(?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, r.Role_id, r.Uri, r.Nickname)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_role_uri(r *Role_uri) (rs []Role_uri, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `role_id`, `uri`, `nickname` FROM `ocr`.`role_uri` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if r.Role_id != "" {
		sqlBuf.WriteString("AND `role_id`=? ")
		sqlArgs = append(sqlArgs, r.Role_id)
	}
	if r.Uri != "" {
		sqlBuf.WriteString("AND `uri`=? ")
		sqlArgs = append(sqlArgs, r.Uri)
	}
	if r.Nickname != "" {
		sqlBuf.WriteString("AND `nickname`=? ")
		sqlArgs = append(sqlArgs, r.Nickname)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &rs)
	return
}
func IU_role_uri(r *Role_uri) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`role_uri`(`role_id`, `uri`, `nickname`) VALUES(?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{r.Role_id, r.Uri, r.Nickname}
	if r.Role_id != "" {
		sqlBuf.WriteString("`role_id`=?,")
		sqlArgs = append(sqlArgs, r.Role_id)
	}
	if r.Uri != "" {
		sqlBuf.WriteString("`uri`=?,")
		sqlArgs = append(sqlArgs, r.Uri)
	}
	if r.Nickname != "" {
		sqlBuf.WriteString("`nickname`=?,")
		sqlArgs = append(sqlArgs, r.Nickname)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#user
INSERT INTO `ocr`.`user`(`user_id`, `username`, `nickname`, `passwd`, `expire`, `status`, `ct`, `ut`, `pid`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `username`=?, `nickname`=?, `passwd`=?, `expire`=?, `status`=?, `ct`=?, `ut`=?, `pid`=?;
SELECT `user_id`, `username`, `nickname`, `passwd`, `expire`, `status`, `ct`, `ut`, `pid` FROM `ocr`.`user` WHERE `user_id`=?;
UPDATE `ocr`.`user` SET `user_id`=?, `username`=?, `nickname`=?, `passwd`=?, `expire`=?, `status`=?, `ct`=?, `ut`=?, `pid`=? WHERE `user_id`=?;
type User struct {
	User_id int `json:"user_id,omitempty"`
	Username string `json:"username,omitempty"`
	Nickname string `json:"nickname,omitempty"`
	Passwd string `json:"passwd,omitempty"`
	Expire string `json:"expire,omitempty"`
	Status string `json:"status,omitempty"`
	Ct string `json:"ct,omitempty"`
	Ut string `json:"ut,omitempty"`
	Pid int `json:"pid,omitempty"`
}
func I_users(us []User) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`user`(`user_id`, `username`, `nickname`, `passwd`, `expire`, `status`, `ct`, `ut`, `pid`) VALUES")
	sqlArgs := []interface{}{}
	for i, u := range us {
		if i < len(us)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, u.User_id, u.Username, u.Nickname, u.Passwd, u.Expire, u.Status, u.Ct, u.Ut, u.Pid)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_user(u *User) (us []User, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `user_id`, `username`, `nickname`, `passwd`, `expire`, `status`, `ct`, `ut`, `pid` FROM `ocr`.`user` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if u.User_id != 0 {
		sqlBuf.WriteString("AND `user_id`=? ")
		sqlArgs = append(sqlArgs, u.User_id)
	}
	if u.Username != "" {
		sqlBuf.WriteString("AND `username`=? ")
		sqlArgs = append(sqlArgs, u.Username)
	}
	if u.Nickname != "" {
		sqlBuf.WriteString("AND `nickname`=? ")
		sqlArgs = append(sqlArgs, u.Nickname)
	}
	if u.Passwd != "" {
		sqlBuf.WriteString("AND `passwd`=? ")
		sqlArgs = append(sqlArgs, u.Passwd)
	}
	if u.Expire != "" {
		sqlBuf.WriteString("AND `expire`=? ")
		sqlArgs = append(sqlArgs, u.Expire)
	}
	if u.Status != "" {
		sqlBuf.WriteString("AND `status`=? ")
		sqlArgs = append(sqlArgs, u.Status)
	}
	if u.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, u.Ct)
	}
	if u.Ut != "" {
		sqlBuf.WriteString("AND `ut`=? ")
		sqlArgs = append(sqlArgs, u.Ut)
	}
	if u.Pid != 0 {
		sqlBuf.WriteString("AND `pid`=? ")
		sqlArgs = append(sqlArgs, u.Pid)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &us)
	return
}
func IU_user(u *User) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`user`(`user_id`, `username`, `nickname`, `passwd`, `expire`, `status`, `ct`, `ut`, `pid`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{u.User_id, u.Username, u.Nickname, u.Passwd, u.Expire, u.Status, u.Ct, u.Ut, u.Pid}
	if u.User_id != 0 {
		sqlBuf.WriteString("`user_id`=?,")
		sqlArgs = append(sqlArgs, u.User_id)
	}
	if u.Username != "" {
		sqlBuf.WriteString("`username`=?,")
		sqlArgs = append(sqlArgs, u.Username)
	}
	if u.Nickname != "" {
		sqlBuf.WriteString("`nickname`=?,")
		sqlArgs = append(sqlArgs, u.Nickname)
	}
	if u.Passwd != "" {
		sqlBuf.WriteString("`passwd`=?,")
		sqlArgs = append(sqlArgs, u.Passwd)
	}
	if u.Expire != "" {
		sqlBuf.WriteString("`expire`=?,")
		sqlArgs = append(sqlArgs, u.Expire)
	}
	if u.Status != "" {
		sqlBuf.WriteString("`status`=?,")
		sqlArgs = append(sqlArgs, u.Status)
	}
	if u.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, u.Ct)
	}
	if u.Ut != "" {
		sqlBuf.WriteString("`ut`=?,")
		sqlArgs = append(sqlArgs, u.Ut)
	}
	if u.Pid != 0 {
		sqlBuf.WriteString("`pid`=?,")
		sqlArgs = append(sqlArgs, u.Pid)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#user_feature
INSERT INTO `ocr`.`user_feature`(`user_id`, `source`) VALUES(?, ?) ON DUPLICATE KEY UPDATE `source`=?;
SELECT `user_id`, `source` FROM `ocr`.`user_feature` WHERE `user_id`=?;
UPDATE `ocr`.`user_feature` SET `user_id`=?, `source`=? WHERE `user_id`=?;
type User_feature struct {
	User_id int `json:"user_id,omitempty"`
	Source string `json:"source,omitempty"`
}
func I_user_features(us []User_feature) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`user_feature`(`user_id`, `source`) VALUES")
	sqlArgs := []interface{}{}
	for i, u := range us {
		if i < len(us)-1 {
			sqlBuf.WriteString("(?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?);")
		}
		sqlArgs = append(sqlArgs, u.User_id, u.Source)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_user_feature(u *User_feature) (us []User_feature, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `user_id`, `source` FROM `ocr`.`user_feature` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if u.User_id != 0 {
		sqlBuf.WriteString("AND `user_id`=? ")
		sqlArgs = append(sqlArgs, u.User_id)
	}
	if u.Source != "" {
		sqlBuf.WriteString("AND `source`=? ")
		sqlArgs = append(sqlArgs, u.Source)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &us)
	return
}
func IU_user_feature(u *User_feature) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`user_feature`(`user_id`, `source`) VALUES(?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{u.User_id, u.Source}
	if u.User_id != 0 {
		sqlBuf.WriteString("`user_id`=?,")
		sqlArgs = append(sqlArgs, u.User_id)
	}
	if u.Source != "" {
		sqlBuf.WriteString("`source`=?,")
		sqlArgs = append(sqlArgs, u.Source)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#user_role
INSERT INTO `ocr`.`user_role`(`user_id`, `role_id`) VALUES(?, ?) ON DUPLICATE KEY UPDATE `user_id`=?, `role_id`=?;
SELECT `user_id`, `role_id` FROM `ocr`.`user_role` WHERE ;
UPDATE `ocr`.`user_role` SET `user_id`=?, `role_id`=? WHERE ;
type User_role struct {
	User_id string `json:"user_id,omitempty"`
	Role_id string `json:"role_id,omitempty"`
}
func I_user_roles(us []User_role) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `ocr`.`user_role`(`user_id`, `role_id`) VALUES")
	sqlArgs := []interface{}{}
	for i, u := range us {
		if i < len(us)-1 {
			sqlBuf.WriteString("(?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?);")
		}
		sqlArgs = append(sqlArgs, u.User_id, u.Role_id)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_user_role(u *User_role) (us []User_role, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `user_id`, `role_id` FROM `ocr`.`user_role` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if u.User_id != "" {
		sqlBuf.WriteString("AND `user_id`=? ")
		sqlArgs = append(sqlArgs, u.User_id)
	}
	if u.Role_id != "" {
		sqlBuf.WriteString("AND `role_id`=? ")
		sqlArgs = append(sqlArgs, u.Role_id)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &us)
	return
}
func IU_user_role(u *User_role) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `ocr`.`user_role`(`user_id`, `role_id`) VALUES(?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{u.User_id, u.Role_id}
	if u.User_id != "" {
		sqlBuf.WriteString("`user_id`=?,")
		sqlArgs = append(sqlArgs, u.User_id)
	}
	if u.Role_id != "" {
		sqlBuf.WriteString("`role_id`=?,")
		sqlArgs = append(sqlArgs, u.Role_id)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

