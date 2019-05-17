Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 264DE2141C
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2019 09:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbfEQHRq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 May 2019 03:17:46 -0400
Received: from mail-eopbgr00096.outbound.protection.outlook.com ([40.107.0.96]:39809
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727871AbfEQHRq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 May 2019 03:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+Ev3aeldcYp3Ime/XU0oYRAe6YFo0HkPDvHyD63T70=;
 b=l0R2d8XW7dtziid+0Zf28Z4aTlPfZ8qWgUEXgzSfpZxQitopzqnLv5kZjOBPc5vhJH6422E700GXUDge/+c2P5iv0hrI+wYRiD+wu0lwZeOEt+oNFgDZayA8aJ9wUdzgCPTwA2PEEFfneu0gNo8oWT24o7CdMsfx+KSfEZf7v5U=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3289.eurprd02.prod.outlook.com (52.134.65.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 17 May 2019 07:17:33 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf%5]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 07:17:33 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH v8 3/3] mfd: da9063: occupy second I2C address, too
Thread-Topic: [PATCH v8 3/3] mfd: da9063: occupy second I2C address, too
Thread-Index: AQHVDCwzB+v1LblhiEqH3oWwq+tPbKZu6NOA
Date:   Fri, 17 May 2019 07:17:33 +0000
Message-ID: <bf407cdd-b266-0173-e9cc-6eac2985b159@axentia.se>
References: <20190516211310.22277-1-wsa+renesas@sang-engineering.com>
 <20190516211310.22277-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190516211310.22277-4-wsa+renesas@sang-engineering.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0902CA0029.eurprd09.prod.outlook.com
 (2603:10a6:7:15::18) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc920127-cd5c-4a1b-6fe0-08d6da97bb35
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:DB3PR0202MB3289;
x-ms-traffictypediagnostic: DB3PR0202MB3289:
x-microsoft-antispam-prvs: <DB3PR0202MB3289B7F6BF7F2F8E359B0978BC0B0@DB3PR0202MB3289.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(136003)(366004)(376002)(39830400003)(189003)(199004)(64756008)(68736007)(65826007)(6436002)(66556008)(66446008)(2501003)(66946007)(73956011)(11346002)(476003)(66476007)(6512007)(54906003)(486006)(316002)(7736002)(53546011)(8936002)(3846002)(6116002)(52116002)(26005)(386003)(8676002)(81156014)(81166006)(99286004)(446003)(76176011)(6486002)(229853002)(186003)(110136005)(305945005)(58126008)(2616005)(6506007)(2906002)(102836004)(65806001)(65956001)(66066001)(25786009)(4326008)(6246003)(86362001)(53936002)(71190400001)(64126003)(558084003)(31696002)(31686004)(71200400001)(256004)(508600001)(36756003)(74482002)(5660300002)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3289;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: b935KU9zgqJFGiUknsVx7gQY00YyANH56fTg2q+ezd/PCPSwJK9+aqtZgx/Uc6A5cRLXi6jpTL6xX8ZMCy2L2k7J1SayVd9P6eZXTE+mqsDg/NYOP4Jrb7KTqZWBNojaFhUFmutnUGnspXH4OwLBlbAvyIP26iKL8MRP9cHr36/UCQ9IEDLGiD7p1yUrJtedEaJL4X/NECGlTClcsdbUnhZGPYjZRLr+7y5BsEkAPD4I4nO7238whv4qo22ETAhR0zJO1QGHYAAr1VX06NSQ1TPQ2Xynx0rn+xvXp39rM0yhUmbzLrspxpJ8K5j1iF9veCHTQ0aQZDrRzU8hzGug3pL9njP4Pr6Jg6UXlqZ4JzaMXp22LKAxjjBlm+0wkuuPtWIKyY0axiHixxMz+fPViZdPBdNWV5ba3g02clrdUgs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9F1A3CD4ED8E440B10FD5D08A14BAD8@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: cc920127-cd5c-4a1b-6fe0-08d6da97bb35
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 07:17:33.7660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3289
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wNS0xNiAyMzoxMywgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBFdmVuIHRob3VnaCB3
ZSBkb24ndCB1c2UgaXQgeWV0LCB3ZSBzaG91bGQgbWFyayB0aGUgc2Vjb25kIEkyQyBhZGRyZXNz
DQo+IHRoaXMgZGV2aWNlIGlzIGxpc3RlbmluZyB0byBhcyB1c2VkLg0KPiANCj4gTm90IHlldCBm
b3IgdXBzdHJlYW0gdW50aWwgYWxsIGRlcGVuZGVuY2llcyBhcmUgbWVyZ2VkIQ0KPiANCj4gU2ln
bmVkLW9mZi1ieTogV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNv
bT4NCg0KUmV2aWV3ZWQtYnk6IFBldGVyIFJvc2luIDxwZWRhQGF4ZW50aWEuc2U+DQoNCkNoZWVy
cywNClBldGVyDQoNCg==
