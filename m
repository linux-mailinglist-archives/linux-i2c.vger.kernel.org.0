Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58D8510220A
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2019 11:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfKSKYE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Nov 2019 05:24:04 -0500
Received: from mail-eopbgr150124.outbound.protection.outlook.com ([40.107.15.124]:64736
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726858AbfKSKYE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Nov 2019 05:24:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnKqHR4C68k6WdjPgODraJkSGFvc7nlvCDg7xTeq081SpUL8c7QRkEM7y3cfCP0BKgUn2TqXk5mFLoeeqooo/MV2wCr15UI42pyljk6gg+4D1GbHTQ+ky2iTFKnlUfWNnKSgzB+NWk8Y/IF2NhT3c44BILCzsk9yRNILUNHfH1WCFlpcR+GhdGiworw84ZCnxC8rjDoo1Q3v2/lBwmRFFEfxx6PunfB0naSnpgr8cJpfMYnUtdcXvQPsbDWUqjrdN70gkDc4KvYwwPYTH/Pj1cC4kDD0ieXzxysJ+jryF/2f+SpnUTMpnbT10IR/NrfbVY15Ku4X/XAv+wdXzb3dzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elawqTr5xI5rS09nko2ixzI2cpSxG0K1tRKLByyPJSQ=;
 b=DiDzB0bwSrUJBoWTScnccpkCnwV0jVubJX9LwzvGEB2Xr0vn0PBEmZ2N1cRi7zv7P+PKyz+Jjvn9cfeJcIrOi1rhLpbwXaitDNecLQyZ1drDD69Y5SLQsMQt8MBi/MV/Ssbwl/BN7xo82ipwC2UK3bgoeQjXWC94iYYiG0Sza7zmCrv0XUnj16n6hUtw6mG8SeXdwaDMCfGT6sNzh0hTD/k8dBFMtTez5PtAzqmDYkWS/3XQxCf4S2LI2rQguM3I7o1JtwsJ4RqPt7xzb/ZtNyLTKqV7VY+QhLHPTQ3AhB8xVNlHdhDDCVu57F6raGoIDfE1zuJNPBcTuaslLItV9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elawqTr5xI5rS09nko2ixzI2cpSxG0K1tRKLByyPJSQ=;
 b=ePCnXgAUZBGTDeG+oPiH9QF9x85r+jlSwWhpcXJPRyOmSaNRjTiMlvzfCiU1JmNLPHG6MpkjWVHOogSgnY/JUZ5StfVE0Vgft9HVhXJMWjZlmujwTQyPhcOoCo9SgWb7KvSTEzJ97ZHtNHP9Is23d+DTdae6Fjb1MTQQpsAdhwY=
Received: from AM6PR0202MB3432.eurprd02.prod.outlook.com (52.133.11.29) by
 AM6PR0202MB3368.eurprd02.prod.outlook.com (52.133.10.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.27; Tue, 19 Nov 2019 10:24:00 +0000
Received: from AM6PR0202MB3432.eurprd02.prod.outlook.com
 ([fe80::dc43:ed2c:945a:cd5]) by AM6PR0202MB3432.eurprd02.prod.outlook.com
 ([fe80::dc43:ed2c:945a:cd5%6]) with mapi id 15.20.2451.031; Tue, 19 Nov 2019
 10:24:00 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Lei YU <mine260309@gmail.com>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: i2c: Fix return value of i2c_smbus_xxx functions
Thread-Topic: [PATCH] docs: i2c: Fix return value of i2c_smbus_xxx functions
Thread-Index: AQHVnrdKJrKxiOciCEaViJqC+aa9maeSS/0A///yPYCAAAs+gA==
Date:   Tue, 19 Nov 2019 10:24:00 +0000
Message-ID: <c8aeb189-16da-0585-db6e-ec61a87eafba@axentia.se>
References: <1574153778-59977-1-git-send-email-mine260309@gmail.com>
 <a1444cbf-3a1d-6f17-97a9-77664a95d304@axentia.se>
 <CAARXrtmHh-7smvGi1_0J81zRfR9iiEG2+DJK2nDi_fThOKggmA@mail.gmail.com>
In-Reply-To: <CAARXrtmHh-7smvGi1_0J81zRfR9iiEG2+DJK2nDi_fThOKggmA@mail.gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR09CA0060.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::28) To AM6PR0202MB3432.eurprd02.prod.outlook.com
 (2603:10a6:209:26::29)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93699f84-4389-45c3-3fd4-08d76cda97da
x-ms-traffictypediagnostic: AM6PR0202MB3368:
x-microsoft-antispam-prvs: <AM6PR0202MB3368BDC01C150926018861C0BC4C0@AM6PR0202MB3368.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(39830400003)(346002)(136003)(396003)(366004)(189003)(199004)(186003)(4326008)(52116002)(6486002)(26005)(1411001)(8676002)(76176011)(71190400001)(71200400001)(386003)(6506007)(53546011)(8936002)(6246003)(229853002)(66476007)(36756003)(86362001)(6916009)(31696002)(6436002)(6512007)(102836004)(81156014)(66946007)(66556008)(64756008)(66446008)(4744005)(2906002)(7736002)(305945005)(14454004)(4001150100001)(508600001)(81166006)(54906003)(58126008)(99286004)(6116002)(3846002)(316002)(25786009)(31686004)(66066001)(65806001)(65956001)(446003)(476003)(11346002)(2616005)(486006)(256004)(14444005)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR0202MB3368;H:AM6PR0202MB3432.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sYWVv+a5XxbuHZBqwZlftjvLpYzWfDWOufRfdLjA73j0CbMGWBPqMVfoThYR0/iwopyI5++LBbbszwdCjec0P54IXWjN8MCgvKRgD9crQMCLgNlIBXm+0IVVAR3ND7FKXYuedOb7jIPnIBPU60ch1j3Jls4qokt0su4kuO2pqfHHB4rXISlfJaQ/Bk/yAa/UDI3a1MYRAejdfOtBwCr8yGnv+0icw5gjIvPJYF7FYVV864yYZKxDZeJu2ZuciXc9XMP13Do60uB0/xXu+yydJZ1bv/PjIyiywmjJcFZrr04dAgwGknIcPagOocksvTuQktpZJ5bxyPAPAlJ6mbqtyLjahwjfd6A9CCF7GjPwMyp1ojqtfs8SvfHcQnRrQJiehWIAkQdTh/KnR6mo9YRrJ+KtCESup4by3BUbRIBEA9aKMXPRz6SQ5+T4g6M1G9cH
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F5053F4363FAC45AD7B7374A1315585@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 93699f84-4389-45c3-3fd4-08d76cda97da
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 10:24:00.4056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GKZ3ww9Zqrgi1kNPv9t/OI4GTiYXOcUAM3JI8PEQ9HZJJQmvQ05wM75RtdO9RGgD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3368
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMS0xOSAxMDo0MywgTGVpIFlVIHdyb3RlOg0KPiBPbiBUdWUsIE5vdiAxOSwgMjAx
OSBhdCA1OjMzIFBNIFBldGVyIFJvc2luIDxwZWRhQGF4ZW50aWEuc2U+IHdyb3RlOg0KPj4gQW5k
IHRoZSBsaW5lIGlzIG5vdyB0b28gbG9uZyBjb21wYXJlZCB0byB0aGUgcmVzdCBvZiB0aGUgdGV4
dCwgc28geW91DQo+PiBuZWVkIHRvIHJld3JhcCB0aGUgcGFyYWdyYXBoLg0KPiANCj4gSW4gdGhp
cyBwYXRjaCBpdCdzIGF0IGNvbHVtbiA3OCwgdGhhdCBzaG91bGQgYmUgT0suDQoNCk5vLCB0aGF0
J3Mgbm90IG9rLiBJZiB0aGUgcmVzdA0Kb2YgdGhlIHBhcmFncmFwaCBpcyB3cmFwcGVkIGF0IDcy
IChvciBzb21ldGhpbmcgc3VjaCksIGEgc2luZ2xlIGxpbmUNCmJyZWFraW5nIHRoYXQgcGF0dGVy
biB3aWxsIGJlDQpkaXN0dXJiaW5nIHRvIHRoZSByZWFkZXIuIFRoZQ0KZmFjdCB0aGF0IHlvdSBk
b24ndCBnZXQgc29tZQ0KY2hlY2twYXRjaCB3YXJuaW5nIGhhcyBub3RoaW5nDQp0byBkbyB3aXRo
IHRoYXQuDQoNCkNoZWVycywNClBldGVyDQo=
