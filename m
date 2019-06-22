Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68EBA4F3F1
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2019 07:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfFVFvH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jun 2019 01:51:07 -0400
Received: from mail-eopbgr80101.outbound.protection.outlook.com ([40.107.8.101]:11424
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725932AbfFVFvH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Jun 2019 01:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+srSdDK0IXBTRSFEiJmKNXnPenhj+4/1kHxKePjBTts=;
 b=Auvs1SXkzj6OVno7MHZN2RcCCX9Rhh1R5++kIV5AqY1aZaCylS2mZBiNQz8hJBeEq7NxjIwrpO4x6vuSkxHciOt1uciUfQ/bRSbIsEuIUI6JmwQ0Ccmg3+jfRSkrSV0fOUPF8VoMNhNgbJ0xQChIObjk2rcSPA12dNKywGAy5GE=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3468.eurprd02.prod.outlook.com (52.134.66.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Sat, 22 Jun 2019 05:51:00 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf%5]) with mapi id 15.20.1987.014; Sat, 22 Jun 2019
 05:51:00 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux: add sysfs header
Thread-Topic: [PATCH] i2c: mux: add sysfs header
Thread-Index: AQHVJsDjZ5djla0nnEmUwhwNxXFTaKanL2qA
Date:   Sat, 22 Jun 2019 05:51:00 +0000
Message-ID: <a18d24a1-b36f-5a4c-e116-abfb8ecec17d@axentia.se>
References: <20190619170306.28432-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190619170306.28432-1-wsa+renesas@sang-engineering.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1P195CA0014.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::24)
 To DB3PR0202MB3434.eurprd02.prod.outlook.com (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f559f7c-e157-4d87-6027-08d6f6d59ab0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3468;
x-ms-traffictypediagnostic: DB3PR0202MB3468:
x-microsoft-antispam-prvs: <DB3PR0202MB3468619EA298952EFAB542E6BCE60@DB3PR0202MB3468.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0076F48C8A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(346002)(376002)(136003)(39830400003)(189003)(199004)(76176011)(446003)(74482002)(52116002)(476003)(2616005)(110136005)(11346002)(66446008)(66556008)(64756008)(6246003)(66476007)(66946007)(6436002)(73956011)(58126008)(86362001)(6486002)(26005)(64126003)(386003)(6512007)(6506007)(31686004)(53546011)(25786009)(14454004)(65956001)(2906002)(102836004)(186003)(508600001)(66066001)(65806001)(8676002)(558084003)(486006)(53936002)(229853002)(36756003)(65826007)(305945005)(316002)(31696002)(8936002)(68736007)(71190400001)(81166006)(81156014)(99286004)(256004)(7736002)(2501003)(5660300002)(71200400001)(3846002)(6116002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3468;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tF0R26QG0pi/jq/qTZEbqjrfyqp66SQPoeUPALLc6p/wWp67ZAxUA46UTd6Y/ULcZw7m1QmDSQkWQOiLVRq6p4MpmuJiTnS/WyZBUAHORv27eUINSwJG9tCSOMkF5wPUTqxn6+KNATgFRT7ZPnAzRcZc2oimZutr9wyTqizsNcIpM3gvLTMHarlDEeim9NRN8xVG4AIvzS+R/hk+QY3ikNjsaINtulnLdeK1eJRfHqKJ+JoXdSYGxegqX9J2I9EfQjruGihTxgu4TxQPmOxslp91WAdVWqBwQqs51fdWGdd3Wfm/PDTWCmKmFlWutx1OWerl6V8GHzdZAOGpu/IqgnuIneSfnGwrNVUfEqnqjr1W5a8k7REByLzKbW1QTR2+SQCKUUGmuOk57l9NRlIA1aQYkxQm7ZR6b1OSvlDYskw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D0120ACDC779647B70A6B45A454F016@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f559f7c-e157-4d87-6027-08d6f6d59ab0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2019 05:51:00.5239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peda@axentia.se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3468
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wNi0xOSAxOTowMywgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBXZSBhcmUgdXNpbmcg
c3lzZnMgZnVuY3Rpb25zIGRpcmVjdGx5LCBzbyB3ZSBzaG91bGQgaW5jbHVkZSB0aGUgaGVhZGVy
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVu
Z2luZWVyaW5nLmNvbT4NCg0KUGF0Y2ggYXBwbGllcyB0byBpMmMtbXV4L2Zvci1uZXh0LiBUaGFu
a3MhDQoNCkNoZWVycywNClBldGVyDQo=
