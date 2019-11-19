Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 588831020B4
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2019 10:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfKSJf3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Nov 2019 04:35:29 -0500
Received: from mail-eopbgr50097.outbound.protection.outlook.com ([40.107.5.97]:32066
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725798AbfKSJf3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Nov 2019 04:35:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPGroJZbNwyAn8gx68Bu6ar3ibHcXAMjm6T6uvp6RHlzf+YHnN5p2mEKPO0aimM/wsiqm3x1bsKw6t7W4faFPW9vD6PdMtxcwv9b6UOuEFosUO9akpdSuoa3iPY7uhtGkZpJy3dBvp1DhUHUBLCJ/Lv2vpGSB8yNPhnHj8SmikcqRU2WfVEUnEJ+iIVKIpWvMTisUKnjIYOcDFK1o3AbyTSxoTawNBdiR5ljQeSBjFrpiKv3fx5m0MGuskxwL/HvwJt+j3aMwyfBVgrtM9VCTjp5nM8axibA7XyqawmlAcBA+uRs2PwtuqFccBSHVEVOLZeFZek8ja62Eo/KT4mhzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZXBWb+E+YSI2sfZpz0N0p1CigpaW7xUI/Ir01r9c88=;
 b=oANo6i5EO0Oa5DqUfrAGYyjksw8LUbFGtCboTbJUN4/RHxGLW/s2ig9fCEc2YZ+0hq+CATiUR5uklrWKWQjdoEUKJhNrOFQEejSM6/sa/ulBvo9iMWJ9SUwmG7Nb7YKxgz93mzNpoMNAUC2iIdbxhZxKfoKeJz6uMJh21jYj8h4hUL/0PV+6wwbmmDLVTTG3hzgCTsAqPYR73BV09ZvNsrCBt2in+EA5eyKoGacoLTt3tGRYhnhYJmAF8aZaTONJCw8BLdHnqqmmO6CyL7zKYuIu7m6VpekGhXB613EdwEH/QKviTeW2BKUBY17YSR9UVdpizrAulYrH+Qzs6FfBBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZXBWb+E+YSI2sfZpz0N0p1CigpaW7xUI/Ir01r9c88=;
 b=HVHnmRo67tTmqplcgavxr24tkSMyhcGMmVlkwbWtfqJsXE1ZJa3GPyIFNzaFveqrDAfLPgL3qtUF3oih4zkOxLb3kS5/tK0KS2C9eyIYgLJR8cG/6zUFpbLMsTP535cYJ7jYlQQznwhDwn00vxaDPl+ZiEGWZxXGPpFXhrrSS2g=
Received: from AM6PR0202MB3432.eurprd02.prod.outlook.com (52.133.11.29) by
 AM6PR0202MB3400.eurprd02.prod.outlook.com (52.133.8.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.29; Tue, 19 Nov 2019 09:35:25 +0000
Received: from AM6PR0202MB3432.eurprd02.prod.outlook.com
 ([fe80::dc43:ed2c:945a:cd5]) by AM6PR0202MB3432.eurprd02.prod.outlook.com
 ([fe80::dc43:ed2c:945a:cd5%6]) with mapi id 15.20.2451.031; Tue, 19 Nov 2019
 09:35:24 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Lei YU <mine260309@gmail.com>, Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: i2c: Fix return value of i2c_smbus_xxx functions
Thread-Topic: [PATCH] docs: i2c: Fix return value of i2c_smbus_xxx functions
Thread-Index: AQHVnrdKJrKxiOciCEaViJqC+aa9maeSS/0A///v6AA=
Date:   Tue, 19 Nov 2019 09:35:24 +0000
Message-ID: <8feed71f-19ba-444e-3e43-b9f28914bc6b@axentia.se>
References: <1574153778-59977-1-git-send-email-mine260309@gmail.com>
 <a1444cbf-3a1d-6f17-97a9-77664a95d304@axentia.se>
In-Reply-To: <a1444cbf-3a1d-6f17-97a9-77664a95d304@axentia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: AM4PR05CA0002.eurprd05.prod.outlook.com (2603:10a6:205::15)
 To AM6PR0202MB3432.eurprd02.prod.outlook.com (2603:10a6:209:26::29)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13b6bd65-6cdb-4a1f-3c05-08d76cd3cd96
x-ms-traffictypediagnostic: AM6PR0202MB3400:
x-microsoft-antispam-prvs: <AM6PR0202MB34008A34BA5BF75406D25DF1BC4C0@AM6PR0202MB3400.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(376002)(366004)(39830400003)(396003)(189003)(199004)(25786009)(186003)(476003)(11346002)(446003)(2616005)(102836004)(53546011)(386003)(58126008)(486006)(6506007)(316002)(6512007)(110136005)(4744005)(4001150100001)(26005)(2501003)(6486002)(31686004)(5660300002)(256004)(8936002)(229853002)(6246003)(8676002)(66946007)(76176011)(66446008)(6436002)(81156014)(71190400001)(71200400001)(81166006)(508600001)(2201001)(64756008)(66556008)(66476007)(6116002)(14454004)(305945005)(99286004)(66066001)(65806001)(86362001)(2906002)(52116002)(7736002)(36756003)(3846002)(65956001)(31696002);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR0202MB3400;H:AM6PR0202MB3432.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NJeO6RsK4jiBwNoKsBxjPSP754Nj/fsIvf5gh9mq1EErNnhHMdMX+t5Wnxt1qTWsPiKY6hmpGMHaCGRLhm4ztBrpXxKL3sjltWu+KhbeViEQU2CNKTtKp5opUjV+6GRUFF2dARViGgspTTJrkJQJtOXT/sRyAbry/AXW93zXzXqhYkjdjWGFA/0Jg5AGTn/EKJ4LL3VbGqvduEplGnTRj0kixWfQgvG0YHS/c64MBVxsrTV5bQlXwpenS+eFxX/GKbzDucMP20IGOULfB4sHoT7Jb6woUlVlEcjUPLlbU4zRMbQTSouSTuSFAziMrZekvXHF26CB4p3EbB8s8GC/7Gm8yc/Gg5PK04eoJEpmOALiVnQQltc0ajbv7UX8p+yo9qOC8Xw3WIGgPUsv5w5s+ERWOVixPkafTtS7cVqXE1864PrJoqn67y5jBdV+RXT2
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <950B4DFE6B10F44C89282E0BE8DA3189@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b6bd65-6cdb-4a1f-3c05-08d76cd3cd96
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 09:35:24.0378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YRCCxYJZ8G1LubZjQZyJihZpVvelSGbWisWWkmcF8FXSoScnNTFCstSRCR6GrQ3u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3400
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMS0xOSAxMDozMywgUGV0ZXIgUm9zaW4gd3JvdGU6DQo+PiAgJ3JlYWQnIHRyYW5z
YWN0aW9ucyByZXR1cm4gdGhlIHJlYWQgdmFsdWUsIGV4Y2VwdCBmb3IgcmVhZF9ibG9jaywgd2hp
Y2gNCj4+ICByZXR1cm5zIHRoZSBudW1iZXIgb2YgdmFsdWVzIHJlYWQuIFRoZSBibG9jayBidWZm
ZXJzIG5lZWQgbm90IGJlIGxvbmdlcg0KPj4gIHRoYW4gMzIgYnl0ZXMuDQo+Pg0KPiANCj4gSG1t
LCB1bnJlbGF0ZWQsIGJ1dCBzaG91bGQgdGhhdCBwZXJoYXBzIGJlICJtdXN0IG5vdCIgaW5zdGVh
ZCBvZiAibmVlZCBub3QiPw0KDQpBaGhoLCBoaXQgJ3NlbmQnIGFuZCBpdCBhbGwgYmVjb21lcyBj
cnlzdGFsIGNsZWFyLiBUaGUgKnJlYWQqIGJ1ZmZlcnMgbmVlZA0Kbm90IGJlIGxhcmdlciB0aGFu
IDMyIGJ5dGVzLiBEdWghDQoNCkNoZWVycywNClBldGVyDQo=
