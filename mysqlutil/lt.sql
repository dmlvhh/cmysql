#batch_match
INSERT INTO `lt`.`batch_match`(`uid`, `f_name`, `content`, `url`, `match`, `ct`, `ut`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `uid`=?, `f_name`=?, `content`=?, `url`=?, `match`=?, `ct`=?, `ut`=?;
SELECT `uid`, `f_name`, `content`, `url`, `match`, `ct`, `ut` FROM `lt`.`batch_match` WHERE ;
UPDATE `lt`.`batch_match` SET `uid`=?, `f_name`=?, `content`=?, `url`=?, `match`=?, `ct`=?, `ut`=? WHERE ;
type Batch_match struct {
	Uid int `json:"uid,omitempty"`
	F_name string `json:"f_name,omitempty"`
	Content string `json:"content,omitempty"`
	Url string `json:"url,omitempty"`
	Match int `json:"match,omitempty"`
	Ct string `json:"ct,omitempty"`
	Ut string `json:"ut,omitempty"`
}
func I_batch_matchs(bs []Batch_match) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `lt`.`batch_match`(`uid`, `f_name`, `content`, `url`, `match`, `ct`, `ut`) VALUES")
	sqlArgs := []interface{}{}
	for i, b := range bs {
		if i < len(bs)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, b.Uid, b.F_name, b.Content, b.Url, b.Match, b.Ct, b.Ut)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_batch_match(b *Batch_match) (bs []Batch_match, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `uid`, `f_name`, `content`, `url`, `match`, `ct`, `ut` FROM `lt`.`batch_match` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if b.Uid != 0 {
		sqlBuf.WriteString("AND `uid`=? ")
		sqlArgs = append(sqlArgs, b.Uid)
	}
	if b.F_name != "" {
		sqlBuf.WriteString("AND `f_name`=? ")
		sqlArgs = append(sqlArgs, b.F_name)
	}
	if b.Content != "" {
		sqlBuf.WriteString("AND `content`=? ")
		sqlArgs = append(sqlArgs, b.Content)
	}
	if b.Url != "" {
		sqlBuf.WriteString("AND `url`=? ")
		sqlArgs = append(sqlArgs, b.Url)
	}
	if b.Match != 0 {
		sqlBuf.WriteString("AND `match`=? ")
		sqlArgs = append(sqlArgs, b.Match)
	}
	if b.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, b.Ct)
	}
	if b.Ut != "" {
		sqlBuf.WriteString("AND `ut`=? ")
		sqlArgs = append(sqlArgs, b.Ut)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &bs)
	return
}
func IU_batch_match(b *Batch_match) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `lt`.`batch_match`(`uid`, `f_name`, `content`, `url`, `match`, `ct`, `ut`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{b.Uid, b.F_name, b.Content, b.Url, b.Match, b.Ct, b.Ut}
	if b.Uid != 0 {
		sqlBuf.WriteString("`uid`=?,")
		sqlArgs = append(sqlArgs, b.Uid)
	}
	if b.F_name != "" {
		sqlBuf.WriteString("`f_name`=?,")
		sqlArgs = append(sqlArgs, b.F_name)
	}
	if b.Content != "" {
		sqlBuf.WriteString("`content`=?,")
		sqlArgs = append(sqlArgs, b.Content)
	}
	if b.Url != "" {
		sqlBuf.WriteString("`url`=?,")
		sqlArgs = append(sqlArgs, b.Url)
	}
	if b.Match != 0 {
		sqlBuf.WriteString("`match`=?,")
		sqlArgs = append(sqlArgs, b.Match)
	}
	if b.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, b.Ct)
	}
	if b.Ut != "" {
		sqlBuf.WriteString("`ut`=?,")
		sqlArgs = append(sqlArgs, b.Ut)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#bookmark
INSERT INTO `lt`.`bookmark`(`uid`, `mid`, `keyword`, `remark`, `book_star`, `ct`, `ut`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `keyword`=?, `remark`=?, `book_star`=?, `ct`=?, `ut`=?;
SELECT `uid`, `mid`, `keyword`, `remark`, `book_star`, `ct`, `ut` FROM `lt`.`bookmark` WHERE `uid`=? AND `mid`=?;
UPDATE `lt`.`bookmark` SET `uid`=?, `mid`=?, `keyword`=?, `remark`=?, `book_star`=?, `ct`=?, `ut`=? WHERE `uid`=? AND `mid`=?;
type Bookmark struct {
	Uid int `json:"uid,omitempty"`
	Mid string `json:"mid,omitempty"`
	Keyword string `json:"keyword,omitempty"`
	Remark string `json:"remark,omitempty"`
	Book_star string `json:"book_star,omitempty"`
	Ct string `json:"ct,omitempty"`
	Ut string `json:"ut,omitempty"`
}
func I_bookmarks(bs []Bookmark) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `lt`.`bookmark`(`uid`, `mid`, `keyword`, `remark`, `book_star`, `ct`, `ut`) VALUES")
	sqlArgs := []interface{}{}
	for i, b := range bs {
		if i < len(bs)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, b.Uid, b.Mid, b.Keyword, b.Remark, b.Book_star, b.Ct, b.Ut)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_bookmark(b *Bookmark) (bs []Bookmark, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `uid`, `mid`, `keyword`, `remark`, `book_star`, `ct`, `ut` FROM `lt`.`bookmark` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if b.Uid != 0 {
		sqlBuf.WriteString("AND `uid`=? ")
		sqlArgs = append(sqlArgs, b.Uid)
	}
	if b.Mid != "" {
		sqlBuf.WriteString("AND `mid`=? ")
		sqlArgs = append(sqlArgs, b.Mid)
	}
	if b.Keyword != "" {
		sqlBuf.WriteString("AND `keyword`=? ")
		sqlArgs = append(sqlArgs, b.Keyword)
	}
	if b.Remark != "" {
		sqlBuf.WriteString("AND `remark`=? ")
		sqlArgs = append(sqlArgs, b.Remark)
	}
	if b.Book_star != "" {
		sqlBuf.WriteString("AND `book_star`=? ")
		sqlArgs = append(sqlArgs, b.Book_star)
	}
	if b.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, b.Ct)
	}
	if b.Ut != "" {
		sqlBuf.WriteString("AND `ut`=? ")
		sqlArgs = append(sqlArgs, b.Ut)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &bs)
	return
}
func IU_bookmark(b *Bookmark) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `lt`.`bookmark`(`uid`, `mid`, `keyword`, `remark`, `book_star`, `ct`, `ut`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{b.Uid, b.Mid, b.Keyword, b.Remark, b.Book_star, b.Ct, b.Ut}
	if b.Uid != 0 {
		sqlBuf.WriteString("`uid`=?,")
		sqlArgs = append(sqlArgs, b.Uid)
	}
	if b.Mid != "" {
		sqlBuf.WriteString("`mid`=?,")
		sqlArgs = append(sqlArgs, b.Mid)
	}
	if b.Keyword != "" {
		sqlBuf.WriteString("`keyword`=?,")
		sqlArgs = append(sqlArgs, b.Keyword)
	}
	if b.Remark != "" {
		sqlBuf.WriteString("`remark`=?,")
		sqlArgs = append(sqlArgs, b.Remark)
	}
	if b.Book_star != "" {
		sqlBuf.WriteString("`book_star`=?,")
		sqlArgs = append(sqlArgs, b.Book_star)
	}
	if b.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, b.Ct)
	}
	if b.Ut != "" {
		sqlBuf.WriteString("`ut`=?,")
		sqlArgs = append(sqlArgs, b.Ut)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#client
INSERT INTO `lt`.`client`(`cid`, `sid`, `bit`, `pid`, `group`, `system`, `ip`, `addr`, `tcpip`, `tcpaddr`, `innerip`, `remark`, `whoami`, `hostname`, `version`, `sleeptime`, `screen_switch`, `sleeptime_screen`, `scanfile_switch`, `scanfile_size`, `scanfile_time`, `serverflag`, `spawnfile`, `ht`, `ct`, `ut`, `del`, `desktop_name`, `os_version`, `setup_time`, `start_time`, `ip_present`, `file_present`, `internet_account_present`, `wifi_present`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `cid`=?, `sid`=?, `bit`=?, `pid`=?, `group`=?, `system`=?, `ip`=?, `addr`=?, `tcpip`=?, `tcpaddr`=?, `innerip`=?, `remark`=?, `whoami`=?, `hostname`=?, `version`=?, `sleeptime`=?, `screen_switch`=?, `sleeptime_screen`=?, `scanfile_switch`=?, `scanfile_size`=?, `scanfile_time`=?, `serverflag`=?, `spawnfile`=?, `ht`=?, `ct`=?, `ut`=?, `del`=?, `desktop_name`=?, `os_version`=?, `setup_time`=?, `start_time`=?, `ip_present`=?, `file_present`=?, `internet_account_present`=?, `wifi_present`=?;
SELECT `cid`, `sid`, `bit`, `pid`, `group`, `system`, `ip`, `addr`, `tcpip`, `tcpaddr`, `innerip`, `remark`, `whoami`, `hostname`, `version`, `sleeptime`, `screen_switch`, `sleeptime_screen`, `scanfile_switch`, `scanfile_size`, `scanfile_time`, `serverflag`, `spawnfile`, `ht`, `ct`, `ut`, `del`, `desktop_name`, `os_version`, `setup_time`, `start_time`, `ip_present`, `file_present`, `internet_account_present`, `wifi_present` FROM `lt`.`client` WHERE ;
UPDATE `lt`.`client` SET `cid`=?, `sid`=?, `bit`=?, `pid`=?, `group`=?, `system`=?, `ip`=?, `addr`=?, `tcpip`=?, `tcpaddr`=?, `innerip`=?, `remark`=?, `whoami`=?, `hostname`=?, `version`=?, `sleeptime`=?, `screen_switch`=?, `sleeptime_screen`=?, `scanfile_switch`=?, `scanfile_size`=?, `scanfile_time`=?, `serverflag`=?, `spawnfile`=?, `ht`=?, `ct`=?, `ut`=?, `del`=?, `desktop_name`=?, `os_version`=?, `setup_time`=?, `start_time`=?, `ip_present`=?, `file_present`=?, `internet_account_present`=?, `wifi_present`=? WHERE ;
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
	Desktop_name string `json:"desktop_name,omitempty"`
	Os_version string `json:"os_version,omitempty"`
	Setup_time string `json:"setup_time,omitempty"`
	Start_time string `json:"start_time,omitempty"`
	Ip_present int `json:"ip_present,omitempty"`
	File_present int `json:"file_present,omitempty"`
	Internet_account_present int `json:"internet_account_present,omitempty"`
	Wifi_present int `json:"wifi_present,omitempty"`
}
func I_clients(cs []Client) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `lt`.`client`(`cid`, `sid`, `bit`, `pid`, `group`, `system`, `ip`, `addr`, `tcpip`, `tcpaddr`, `innerip`, `remark`, `whoami`, `hostname`, `version`, `sleeptime`, `screen_switch`, `sleeptime_screen`, `scanfile_switch`, `scanfile_size`, `scanfile_time`, `serverflag`, `spawnfile`, `ht`, `ct`, `ut`, `del`, `desktop_name`, `os_version`, `setup_time`, `start_time`, `ip_present`, `file_present`, `internet_account_present`, `wifi_present`) VALUES")
	sqlArgs := []interface{}{}
	for i, c := range cs {
		if i < len(cs)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, c.Cid, c.Sid, c.Bit, c.Pid, c.Group, c.System, c.Ip, c.Addr, c.Tcpip, c.Tcpaddr, c.Innerip, c.Remark, c.Whoami, c.Hostname, c.Version, c.Sleeptime, c.Screen_switch, c.Sleeptime_screen, c.Scanfile_switch, c.Scanfile_size, c.Scanfile_time, c.Serverflag, c.Spawnfile, c.Ht, c.Ct, c.Ut, c.Del, c.Desktop_name, c.Os_version, c.Setup_time, c.Start_time, c.Ip_present, c.File_present, c.Internet_account_present, c.Wifi_present)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_client(c *Client) (cs []Client, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `cid`, `sid`, `bit`, `pid`, `group`, `system`, `ip`, `addr`, `tcpip`, `tcpaddr`, `innerip`, `remark`, `whoami`, `hostname`, `version`, `sleeptime`, `screen_switch`, `sleeptime_screen`, `scanfile_switch`, `scanfile_size`, `scanfile_time`, `serverflag`, `spawnfile`, `ht`, `ct`, `ut`, `del`, `desktop_name`, `os_version`, `setup_time`, `start_time`, `ip_present`, `file_present`, `internet_account_present`, `wifi_present` FROM `lt`.`client` WHERE 1=1  ")
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
	if c.Desktop_name != "" {
		sqlBuf.WriteString("AND `desktop_name`=? ")
		sqlArgs = append(sqlArgs, c.Desktop_name)
	}
	if c.Os_version != "" {
		sqlBuf.WriteString("AND `os_version`=? ")
		sqlArgs = append(sqlArgs, c.Os_version)
	}
	if c.Setup_time != "" {
		sqlBuf.WriteString("AND `setup_time`=? ")
		sqlArgs = append(sqlArgs, c.Setup_time)
	}
	if c.Start_time != "" {
		sqlBuf.WriteString("AND `start_time`=? ")
		sqlArgs = append(sqlArgs, c.Start_time)
	}
	if c.Ip_present != 0 {
		sqlBuf.WriteString("AND `ip_present`=? ")
		sqlArgs = append(sqlArgs, c.Ip_present)
	}
	if c.File_present != 0 {
		sqlBuf.WriteString("AND `file_present`=? ")
		sqlArgs = append(sqlArgs, c.File_present)
	}
	if c.Internet_account_present != 0 {
		sqlBuf.WriteString("AND `internet_account_present`=? ")
		sqlArgs = append(sqlArgs, c.Internet_account_present)
	}
	if c.Wifi_present != 0 {
		sqlBuf.WriteString("AND `wifi_present`=? ")
		sqlArgs = append(sqlArgs, c.Wifi_present)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &cs)
	return
}
func IU_client(c *Client) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `lt`.`client`(`cid`, `sid`, `bit`, `pid`, `group`, `system`, `ip`, `addr`, `tcpip`, `tcpaddr`, `innerip`, `remark`, `whoami`, `hostname`, `version`, `sleeptime`, `screen_switch`, `sleeptime_screen`, `scanfile_switch`, `scanfile_size`, `scanfile_time`, `serverflag`, `spawnfile`, `ht`, `ct`, `ut`, `del`, `desktop_name`, `os_version`, `setup_time`, `start_time`, `ip_present`, `file_present`, `internet_account_present`, `wifi_present`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{c.Cid, c.Sid, c.Bit, c.Pid, c.Group, c.System, c.Ip, c.Addr, c.Tcpip, c.Tcpaddr, c.Innerip, c.Remark, c.Whoami, c.Hostname, c.Version, c.Sleeptime, c.Screen_switch, c.Sleeptime_screen, c.Scanfile_switch, c.Scanfile_size, c.Scanfile_time, c.Serverflag, c.Spawnfile, c.Ht, c.Ct, c.Ut, c.Del, c.Desktop_name, c.Os_version, c.Setup_time, c.Start_time, c.Ip_present, c.File_present, c.Internet_account_present, c.Wifi_present}
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
	if c.Desktop_name != "" {
		sqlBuf.WriteString("`desktop_name`=?,")
		sqlArgs = append(sqlArgs, c.Desktop_name)
	}
	if c.Os_version != "" {
		sqlBuf.WriteString("`os_version`=?,")
		sqlArgs = append(sqlArgs, c.Os_version)
	}
	if c.Setup_time != "" {
		sqlBuf.WriteString("`setup_time`=?,")
		sqlArgs = append(sqlArgs, c.Setup_time)
	}
	if c.Start_time != "" {
		sqlBuf.WriteString("`start_time`=?,")
		sqlArgs = append(sqlArgs, c.Start_time)
	}
	if c.Ip_present != 0 {
		sqlBuf.WriteString("`ip_present`=?,")
		sqlArgs = append(sqlArgs, c.Ip_present)
	}
	if c.File_present != 0 {
		sqlBuf.WriteString("`file_present`=?,")
		sqlArgs = append(sqlArgs, c.File_present)
	}
	if c.Internet_account_present != 0 {
		sqlBuf.WriteString("`internet_account_present`=?,")
		sqlArgs = append(sqlArgs, c.Internet_account_present)
	}
	if c.Wifi_present != 0 {
		sqlBuf.WriteString("`wifi_present`=?,")
		sqlArgs = append(sqlArgs, c.Wifi_present)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#internet_account
INSERT INTO `lt`.`internet_account`(`mid`, `content`, `t`, `ct`, `ut`) VALUES(?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `t`=?, `ct`=?, `ut`=?;
SELECT `mid`, `content`, `t`, `ct`, `ut` FROM `lt`.`internet_account` WHERE `mid`=? AND `content`=?;
UPDATE `lt`.`internet_account` SET `mid`=?, `content`=?, `t`=?, `ct`=?, `ut`=? WHERE `mid`=? AND `content`=?;
type Internet_account struct {
	Mid string `json:"mid,omitempty"`
	Content string `json:"content,omitempty"`
	T int `json:"t,omitempty"`
	Ct string `json:"ct,omitempty"`
	Ut string `json:"ut,omitempty"`
}
func I_internet_accounts(is []Internet_account) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `lt`.`internet_account`(`mid`, `content`, `t`, `ct`, `ut`) VALUES")
	sqlArgs := []interface{}{}
	for i, i := range is {
		if i < len(is)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, i.Mid, i.Content, i.T, i.Ct, i.Ut)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_internet_account(i *Internet_account) (is []Internet_account, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `mid`, `content`, `t`, `ct`, `ut` FROM `lt`.`internet_account` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if i.Mid != "" {
		sqlBuf.WriteString("AND `mid`=? ")
		sqlArgs = append(sqlArgs, i.Mid)
	}
	if i.Content != "" {
		sqlBuf.WriteString("AND `content`=? ")
		sqlArgs = append(sqlArgs, i.Content)
	}
	if i.T != 0 {
		sqlBuf.WriteString("AND `t`=? ")
		sqlArgs = append(sqlArgs, i.T)
	}
	if i.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, i.Ct)
	}
	if i.Ut != "" {
		sqlBuf.WriteString("AND `ut`=? ")
		sqlArgs = append(sqlArgs, i.Ut)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &is)
	return
}
func IU_internet_account(i *Internet_account) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `lt`.`internet_account`(`mid`, `content`, `t`, `ct`, `ut`) VALUES(?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{i.Mid, i.Content, i.T, i.Ct, i.Ut}
	if i.Mid != "" {
		sqlBuf.WriteString("`mid`=?,")
		sqlArgs = append(sqlArgs, i.Mid)
	}
	if i.Content != "" {
		sqlBuf.WriteString("`content`=?,")
		sqlArgs = append(sqlArgs, i.Content)
	}
	if i.T != 0 {
		sqlBuf.WriteString("`t`=?,")
		sqlArgs = append(sqlArgs, i.T)
	}
	if i.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, i.Ct)
	}
	if i.Ut != "" {
		sqlBuf.WriteString("`ut`=?,")
		sqlArgs = append(sqlArgs, i.Ut)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#login_log
INSERT INTO `lt`.`login_log`(`login_id`, `uid`, `uname`, `nickname`, `ip`, `expire`, `ct`, `ut`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `uid`=?, `uname`=?, `nickname`=?, `ip`=?, `expire`=?, `ct`=?, `ut`=?;
SELECT `login_id`, `uid`, `uname`, `nickname`, `ip`, `expire`, `ct`, `ut` FROM `lt`.`login_log` WHERE `login_id`=?;
UPDATE `lt`.`login_log` SET `login_id`=?, `uid`=?, `uname`=?, `nickname`=?, `ip`=?, `expire`=?, `ct`=?, `ut`=? WHERE `login_id`=?;
type Login_log struct {
	Login_id string `json:"login_id,omitempty"`
	Uid int `json:"uid,omitempty"`
	Uname string `json:"uname,omitempty"`
	Nickname string `json:"nickname,omitempty"`
	Ip string `json:"ip,omitempty"`
	Expire string `json:"expire,omitempty"`
	Ct string `json:"ct,omitempty"`
	Ut string `json:"ut,omitempty"`
}
func I_login_logs(ls []Login_log) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `lt`.`login_log`(`login_id`, `uid`, `uname`, `nickname`, `ip`, `expire`, `ct`, `ut`) VALUES")
	sqlArgs := []interface{}{}
	for i, l := range ls {
		if i < len(ls)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, l.Login_id, l.Uid, l.Uname, l.Nickname, l.Ip, l.Expire, l.Ct, l.Ut)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_login_log(l *Login_log) (ls []Login_log, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `login_id`, `uid`, `uname`, `nickname`, `ip`, `expire`, `ct`, `ut` FROM `lt`.`login_log` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if l.Login_id != "" {
		sqlBuf.WriteString("AND `login_id`=? ")
		sqlArgs = append(sqlArgs, l.Login_id)
	}
	if l.Uid != 0 {
		sqlBuf.WriteString("AND `uid`=? ")
		sqlArgs = append(sqlArgs, l.Uid)
	}
	if l.Uname != "" {
		sqlBuf.WriteString("AND `uname`=? ")
		sqlArgs = append(sqlArgs, l.Uname)
	}
	if l.Nickname != "" {
		sqlBuf.WriteString("AND `nickname`=? ")
		sqlArgs = append(sqlArgs, l.Nickname)
	}
	if l.Ip != "" {
		sqlBuf.WriteString("AND `ip`=? ")
		sqlArgs = append(sqlArgs, l.Ip)
	}
	if l.Expire != "" {
		sqlBuf.WriteString("AND `expire`=? ")
		sqlArgs = append(sqlArgs, l.Expire)
	}
	if l.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, l.Ct)
	}
	if l.Ut != "" {
		sqlBuf.WriteString("AND `ut`=? ")
		sqlArgs = append(sqlArgs, l.Ut)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ls)
	return
}
func IU_login_log(l *Login_log) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `lt`.`login_log`(`login_id`, `uid`, `uname`, `nickname`, `ip`, `expire`, `ct`, `ut`) VALUES(?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{l.Login_id, l.Uid, l.Uname, l.Nickname, l.Ip, l.Expire, l.Ct, l.Ut}
	if l.Login_id != "" {
		sqlBuf.WriteString("`login_id`=?,")
		sqlArgs = append(sqlArgs, l.Login_id)
	}
	if l.Uid != 0 {
		sqlBuf.WriteString("`uid`=?,")
		sqlArgs = append(sqlArgs, l.Uid)
	}
	if l.Uname != "" {
		sqlBuf.WriteString("`uname`=?,")
		sqlArgs = append(sqlArgs, l.Uname)
	}
	if l.Nickname != "" {
		sqlBuf.WriteString("`nickname`=?,")
		sqlArgs = append(sqlArgs, l.Nickname)
	}
	if l.Ip != "" {
		sqlBuf.WriteString("`ip`=?,")
		sqlArgs = append(sqlArgs, l.Ip)
	}
	if l.Expire != "" {
		sqlBuf.WriteString("`expire`=?,")
		sqlArgs = append(sqlArgs, l.Expire)
	}
	if l.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, l.Ct)
	}
	if l.Ut != "" {
		sqlBuf.WriteString("`ut`=?,")
		sqlArgs = append(sqlArgs, l.Ut)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#uri
INSERT INTO `lt`.`uri`(`uri`, `remark`) VALUES(?, ?) ON DUPLICATE KEY UPDATE `remark`=?;
SELECT `uri`, `remark` FROM `lt`.`uri` WHERE `uri`=?;
UPDATE `lt`.`uri` SET `uri`=?, `remark`=? WHERE `uri`=?;
type Uri struct {
	Uri string `json:"uri,omitempty"`
	Remark string `json:"remark,omitempty"`
}
func I_uris(us []Uri) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `lt`.`uri`(`uri`, `remark`) VALUES")
	sqlArgs := []interface{}{}
	for i, u := range us {
		if i < len(us)-1 {
			sqlBuf.WriteString("(?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?);")
		}
		sqlArgs = append(sqlArgs, u.Uri, u.Remark)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_uri(u *Uri) (us []Uri, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `uri`, `remark` FROM `lt`.`uri` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if u.Uri != "" {
		sqlBuf.WriteString("AND `uri`=? ")
		sqlArgs = append(sqlArgs, u.Uri)
	}
	if u.Remark != "" {
		sqlBuf.WriteString("AND `remark`=? ")
		sqlArgs = append(sqlArgs, u.Remark)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &us)
	return
}
func IU_uri(u *Uri) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `lt`.`uri`(`uri`, `remark`) VALUES(?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{u.Uri, u.Remark}
	if u.Uri != "" {
		sqlBuf.WriteString("`uri`=?,")
		sqlArgs = append(sqlArgs, u.Uri)
	}
	if u.Remark != "" {
		sqlBuf.WriteString("`remark`=?,")
		sqlArgs = append(sqlArgs, u.Remark)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#user
INSERT INTO `lt`.`user`(`uid`, `uname`, `nickname`, `passwd`, `expire`, `puid`, `title`, `ct`, `ut`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `uname`=?, `nickname`=?, `passwd`=?, `expire`=?, `puid`=?, `title`=?, `ct`=?, `ut`=?;
SELECT `uid`, `uname`, `nickname`, `passwd`, `expire`, `puid`, `title`, `ct`, `ut` FROM `lt`.`user` WHERE `uid`=?;
UPDATE `lt`.`user` SET `uid`=?, `uname`=?, `nickname`=?, `passwd`=?, `expire`=?, `puid`=?, `title`=?, `ct`=?, `ut`=? WHERE `uid`=?;
type User struct {
	Uid int `json:"uid,omitempty"`
	Uname string `json:"uname,omitempty"`
	Nickname string `json:"nickname,omitempty"`
	Passwd string `json:"passwd,omitempty"`
	Expire string `json:"expire,omitempty"`
	Puid int `json:"puid,omitempty"`
	Title string `json:"title,omitempty"`
	Ct string `json:"ct,omitempty"`
	Ut string `json:"ut,omitempty"`
}
func I_users(us []User) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `lt`.`user`(`uid`, `uname`, `nickname`, `passwd`, `expire`, `puid`, `title`, `ct`, `ut`) VALUES")
	sqlArgs := []interface{}{}
	for i, u := range us {
		if i < len(us)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, u.Uid, u.Uname, u.Nickname, u.Passwd, u.Expire, u.Puid, u.Title, u.Ct, u.Ut)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_user(u *User) (us []User, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `uid`, `uname`, `nickname`, `passwd`, `expire`, `puid`, `title`, `ct`, `ut` FROM `lt`.`user` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if u.Uid != 0 {
		sqlBuf.WriteString("AND `uid`=? ")
		sqlArgs = append(sqlArgs, u.Uid)
	}
	if u.Uname != "" {
		sqlBuf.WriteString("AND `uname`=? ")
		sqlArgs = append(sqlArgs, u.Uname)
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
	if u.Puid != 0 {
		sqlBuf.WriteString("AND `puid`=? ")
		sqlArgs = append(sqlArgs, u.Puid)
	}
	if u.Title != "" {
		sqlBuf.WriteString("AND `title`=? ")
		sqlArgs = append(sqlArgs, u.Title)
	}
	if u.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, u.Ct)
	}
	if u.Ut != "" {
		sqlBuf.WriteString("AND `ut`=? ")
		sqlArgs = append(sqlArgs, u.Ut)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &us)
	return
}
func IU_user(u *User) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `lt`.`user`(`uid`, `uname`, `nickname`, `passwd`, `expire`, `puid`, `title`, `ct`, `ut`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{u.Uid, u.Uname, u.Nickname, u.Passwd, u.Expire, u.Puid, u.Title, u.Ct, u.Ut}
	if u.Uid != 0 {
		sqlBuf.WriteString("`uid`=?,")
		sqlArgs = append(sqlArgs, u.Uid)
	}
	if u.Uname != "" {
		sqlBuf.WriteString("`uname`=?,")
		sqlArgs = append(sqlArgs, u.Uname)
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
	if u.Puid != 0 {
		sqlBuf.WriteString("`puid`=?,")
		sqlArgs = append(sqlArgs, u.Puid)
	}
	if u.Title != "" {
		sqlBuf.WriteString("`title`=?,")
		sqlArgs = append(sqlArgs, u.Title)
	}
	if u.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, u.Ct)
	}
	if u.Ut != "" {
		sqlBuf.WriteString("`ut`=?,")
		sqlArgs = append(sqlArgs, u.Ut)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#user_uri
INSERT INTO `lt`.`user_uri`(`uid`, `uri`, `ct`) VALUES(?, ?, ?) ON DUPLICATE KEY UPDATE `ct`=?;
SELECT `uid`, `uri`, `ct` FROM `lt`.`user_uri` WHERE `uid`=? AND `uri`=?;
UPDATE `lt`.`user_uri` SET `uid`=?, `uri`=?, `ct`=? WHERE `uid`=? AND `uri`=?;
type User_uri struct {
	Uid int `json:"uid,omitempty"`
	Uri string `json:"uri,omitempty"`
	Ct string `json:"ct,omitempty"`
}
func I_user_uris(us []User_uri) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `lt`.`user_uri`(`uid`, `uri`, `ct`) VALUES")
	sqlArgs := []interface{}{}
	for i, u := range us {
		if i < len(us)-1 {
			sqlBuf.WriteString("(?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, u.Uid, u.Uri, u.Ct)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_user_uri(u *User_uri) (us []User_uri, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `uid`, `uri`, `ct` FROM `lt`.`user_uri` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if u.Uid != 0 {
		sqlBuf.WriteString("AND `uid`=? ")
		sqlArgs = append(sqlArgs, u.Uid)
	}
	if u.Uri != "" {
		sqlBuf.WriteString("AND `uri`=? ")
		sqlArgs = append(sqlArgs, u.Uri)
	}
	if u.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, u.Ct)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &us)
	return
}
func IU_user_uri(u *User_uri) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `lt`.`user_uri`(`uid`, `uri`, `ct`) VALUES(?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{u.Uid, u.Uri, u.Ct}
	if u.Uid != 0 {
		sqlBuf.WriteString("`uid`=?,")
		sqlArgs = append(sqlArgs, u.Uid)
	}
	if u.Uri != "" {
		sqlBuf.WriteString("`uri`=?,")
		sqlArgs = append(sqlArgs, u.Uri)
	}
	if u.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, u.Ct)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

#wifi_info
INSERT INTO `lt`.`wifi_info`(`mid`, `bssid`, `wifi_name`, `signal_strength`, `ct`, `ut`, `type`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE `signal_strength`=?, `ct`=?, `ut`=?;
SELECT `mid`, `bssid`, `wifi_name`, `signal_strength`, `ct`, `ut`, `type` FROM `lt`.`wifi_info` WHERE `mid`=? AND `bssid`=? AND `wifi_name`=? AND `type`=?;
UPDATE `lt`.`wifi_info` SET `mid`=?, `bssid`=?, `wifi_name`=?, `signal_strength`=?, `ct`=?, `ut`=?, `type`=? WHERE `mid`=? AND `bssid`=? AND `wifi_name`=? AND `type`=?;
type Wifi_info struct {
	Mid int `json:"mid,omitempty"`
	Bssid string `json:"bssid,omitempty"`
	Wifi_name string `json:"wifi_name,omitempty"`
	Signal_strength string `json:"signal_strength,omitempty"`
	Ct string `json:"ct,omitempty"`
	Ut string `json:"ut,omitempty"`
	Type int `json:"type,omitempty"`
}
func I_wifi_infos(ws []Wifi_info) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT IGNORE INTO `lt`.`wifi_info`(`mid`, `bssid`, `wifi_name`, `signal_strength`, `ct`, `ut`, `type`) VALUES")
	sqlArgs := []interface{}{}
	for i, w := range ws {
		if i < len(ws)-1 {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?),")
		} else {
			sqlBuf.WriteString("(?, ?, ?, ?, ?, ?, ?);")
		}
		sqlArgs = append(sqlArgs, w.Mid, w.Bssid, w.Wifi_name, w.Signal_strength, w.Ct, w.Ut, w.Type)
	}
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}
func S_wifi_info(w *Wifi_info) (ws []Wifi_info, err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("SELECT `mid`, `bssid`, `wifi_name`, `signal_strength`, `ct`, `ut`, `type` FROM `lt`.`wifi_info` WHERE 1=1  ")
	sqlArgs := []interface{}{}
	if w.Mid != 0 {
		sqlBuf.WriteString("AND `mid`=? ")
		sqlArgs = append(sqlArgs, w.Mid)
	}
	if w.Bssid != "" {
		sqlBuf.WriteString("AND `bssid`=? ")
		sqlArgs = append(sqlArgs, w.Bssid)
	}
	if w.Wifi_name != "" {
		sqlBuf.WriteString("AND `wifi_name`=? ")
		sqlArgs = append(sqlArgs, w.Wifi_name)
	}
	if w.Signal_strength != "" {
		sqlBuf.WriteString("AND `signal_strength`=? ")
		sqlArgs = append(sqlArgs, w.Signal_strength)
	}
	if w.Ct != "" {
		sqlBuf.WriteString("AND `ct`=? ")
		sqlArgs = append(sqlArgs, w.Ct)
	}
	if w.Ut != "" {
		sqlBuf.WriteString("AND `ut`=? ")
		sqlArgs = append(sqlArgs, w.Ut)
	}
	if w.Type != 0 {
		sqlBuf.WriteString("AND `type`=? ")
		sqlArgs = append(sqlArgs, w.Type)
	}
	err = mysqlClient.SearchFormat(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs}, &ws)
	return
}
func IU_wifi_info(w *Wifi_info) (err error) {
	sqlBuf := bytes.Buffer{}
	sqlBuf.WriteString("INSERT INTO `lt`.`wifi_info`(`mid`, `bssid`, `wifi_name`, `signal_strength`, `ct`, `ut`, `type`) VALUES(?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE ")
	sqlArgs := []interface{}{w.Mid, w.Bssid, w.Wifi_name, w.Signal_strength, w.Ct, w.Ut, w.Type}
	if w.Mid != 0 {
		sqlBuf.WriteString("`mid`=?,")
		sqlArgs = append(sqlArgs, w.Mid)
	}
	if w.Bssid != "" {
		sqlBuf.WriteString("`bssid`=?,")
		sqlArgs = append(sqlArgs, w.Bssid)
	}
	if w.Wifi_name != "" {
		sqlBuf.WriteString("`wifi_name`=?,")
		sqlArgs = append(sqlArgs, w.Wifi_name)
	}
	if w.Signal_strength != "" {
		sqlBuf.WriteString("`signal_strength`=?,")
		sqlArgs = append(sqlArgs, w.Signal_strength)
	}
	if w.Ct != "" {
		sqlBuf.WriteString("`ct`=?,")
		sqlArgs = append(sqlArgs, w.Ct)
	}
	if w.Ut != "" {
		sqlBuf.WriteString("`ut`=?,")
		sqlArgs = append(sqlArgs, w.Ut)
	}
	if w.Type != 0 {
		sqlBuf.WriteString("`type`=?,")
		sqlArgs = append(sqlArgs, w.Type)
	}

请自行添加结束SQL,保证所有字段为空时不报错,例 sqlBuf.WriteString("`ut`=NOW();")
	return mysqlClient.Execute(&cmysql.Stmt{Sql: sqlBuf.String(), Args: sqlArgs})
}

