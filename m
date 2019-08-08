Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5212B86089
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2019 13:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731122AbfHHLCr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Aug 2019 07:02:47 -0400
Received: from mail-eopbgr30082.outbound.protection.outlook.com ([40.107.3.82]:2382
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730879AbfHHLCr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Aug 2019 07:02:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hb7df2BuiDJyYOERJ8UEJksC+cWbM7xbaoD+1ydnkNTCXvlJ/W8z1zb8bW7iN5w1wAPCy0/LHT0UsEJYUmSizIImwQs8TDb9JryTslGvtrda5y+pTTNu6vsExXVabbrg0KmOKIIV5r7H9W2Umtwu+yEYuMhRF3Kv1nC9enTu5vW+7slVrA4lb4gqKJv7y7WM2y4soZzpMIfVBnQFI0WOoGrwUbqxxWE/P/S8am1U9rfkyHx4c6jycDmDutdaP+3DS9VE9Ep52shVv+48BP0WgyzOPZ7OyCfp7USaF2LX3xcICE6HCC7901+FXkEkcfFRbGI2nYziZteKk5dBhbVbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWS/JDltsd9Hf0JyxAQ05mceiH3rXh3GYrJfs6Exi8o=;
 b=RLakkmnQSlN78EZjCo/rvizo/8e0E+J45CwTSi4lIOMSjlRE5VL8npIiNcUk74KTB+3UR+H2veGS0gSIoCsWQsu4Gwr/+3PHm2VJVlALg1uAfelZCo6lpEnT4V+rFNxVMplUXttKQPFo1SjT0BnElg6FT9SWpAN+v2smzIyrK7LUbwZlAINXIfL3Ww6wPNRDSQ1EZaOQ3ZRG39VGjcDDpVEnC42503Ex2se+jMupkb+8Ftl23/bWrYQvQSOWpOpbFAXh1/NVdkjWPNdyS+licTGMtutBO58yCwG+JiHWXEW1IkRSoGtCNl+7zc6d+RH7I9x6aX3SEU0nFKupSllKlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWS/JDltsd9Hf0JyxAQ05mceiH3rXh3GYrJfs6Exi8o=;
 b=gy2SiZtjV2ZlsWAMNmSiqEuXOMW9xc2A2kQgczV9sCpDF95cilYLFu2ashLOPww58+wpDIURsSCVhcCUUiP3FXhqa/sK7txFL11qjJLax/NdMpfTZ1am2QeVJ5ybfCFDBW79gBwogm/QXMO1tC2+IW5xO03qnvZivBnJmy8Md/Q=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB5540.eurprd04.prod.outlook.com (20.178.115.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Thu, 8 Aug 2019 11:02:40 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::5553:29b6:d66c:6afe]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::5553:29b6:d66c:6afe%5]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 11:02:40 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Fabio Estevam <festevam@gmail.com>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: RE: [PATCH] i2c: imx: Fix endlessly clk warnings
Thread-Topic: [PATCH] i2c: imx: Fix endlessly clk warnings
Thread-Index: AQHVTV8aaGjNmEUuIU+Ft0gRHAFys6bwK50AgAADgYCAANRhoA==
Date:   Thu, 8 Aug 2019 11:02:40 +0000
Message-ID: <AM0PR04MB421142CCB25E76ED53148E7480D70@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190807203153.11778-1-festevam@gmail.com>
 <CAOMZO5B_3d2DYMzpchJmM9CnRL0gN6-8zGeB_zorN-0cL8rbKA@mail.gmail.com>
 <20190807211317.GA5193@shell.armlinux.org.uk>
In-Reply-To: <20190807211317.GA5193@shell.armlinux.org.uk>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e901369-4ca9-40fb-f1ee-08d71befee6e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB5540;
x-ms-traffictypediagnostic: AM0PR04MB5540:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB55403F512925649515B908E180D70@AM0PR04MB5540.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(189003)(199004)(54094003)(51234002)(53936002)(6436002)(86362001)(81166006)(8676002)(81156014)(4326008)(6246003)(74316002)(71190400001)(229853002)(7736002)(66476007)(305945005)(66446008)(66946007)(66556008)(64756008)(6506007)(102836004)(316002)(26005)(76116006)(33656002)(186003)(8936002)(53546011)(110136005)(76176011)(7696005)(476003)(11346002)(45080400002)(446003)(486006)(44832011)(71200400001)(54906003)(9686003)(14454004)(6306002)(55016002)(66066001)(5024004)(14444005)(966005)(2906002)(25786009)(256004)(99286004)(3846002)(478600001)(5660300002)(6116002)(52536014);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5540;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hZMn2e7kU1xGo2PWabECJRZl/byDgi5tWi6YQHm+28Jz8GTTrrD+JysKBLn17jS48G0Qd+4ZhDeUK2GMmGXDfFQzU5eXEStvrUQmXgHZiH8RAvKUv5ZdmEMR0LAubpm674biPgfIPd+muE0S69KmxgwCWu8a9DF+Z3Q6TzLQ79vuG12paaQKMZzcWoL7w9v58rArT736FWJT2/rh+nWEjAmcepabH//2BjUY8OPNVp9o2kh6h2gRCPfufqDznLdarNl4TokYAvmD7uDO/nx16sQzHN/ClQhPDxK4dlsbYdS7XcKvYnZMMciNaqFMRCNDKlLHi6Lu0gr5/iv4VSoohABdHJJZ8EhxKxv8MSJu2j33peMfAzmGlq7CkHJFcMMm+Z/QSxoLS7CfdnD9I4SQcBLmMyRODPFuHrdBiB2q5eI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e901369-4ca9-40fb-f1ee-08d71befee6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 11:02:40.6297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KaJVwM/pvzra7YOahiIIyWitk9NI1z6y8Mn5d8EoPpwTghmZ8jv4O9VRmjtjWQsE4AeFqn1o2V3YgOK5jnsU6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5540
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXggYWRtaW4gPGxpbnV4QGFybWxpbnV4Lm9y
Zy51az4NCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCA4LCAyMDE5IDU6MTMgQU0NCj4gDQo+IE9u
IFdlZCwgQXVnIDA3LCAyMDE5IGF0IDA2OjAwOjQ0UE0gLTAzMDAsIEZhYmlvIEVzdGV2YW0gd3Jv
dGU6DQo+ID4gT24gV2VkLCBBdWcgNywgMjAxOSBhdCA1OjMxIFBNIEZhYmlvIEVzdGV2YW0gPGZl
c3RldmFtQGdtYWlsLmNvbT4NCj4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gV2hlbiBib290aW5nIHdp
dGggdGhlIERNQSBkcml2ZXIgYXMgbW9kdWxlIChzdWNoIGFzDQo+ID4gPiBDT05GSUdfRlNMX0VE
TUE9bSkgdGhlIGZvbGxvd2luZyBlbmRsZXNzbHkgY2xrIHdhcm5pbmdzIGFyZSBzZWVuOg0KPiA+
ID4NCj4gPiA+IFsgIDE1My4wNzc4MzFdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0t
LS0tLSBbICAxNTMuMDgyNTI4XQ0KPiA+ID4gV0FSTklORzogQ1BVOiAwIFBJRDogMTUgYXQgZHJp
dmVycy9jbGsvY2xrLmM6OTI0DQo+ID4gPiBjbGtfY29yZV9kaXNhYmxlX2xvY2srMHgxOC8weDI0
IFsgIDE1My4wOTMwNzddIGkyYzAgYWxyZWFkeSBkaXNhYmxlZA0KPiA+ID4gWyAgMTUzLjA5NjQx
Nl0gTW9kdWxlcyBsaW5rZWQgaW46DQo+ID4gPiBbICAxNTMuMDk5NTIxXSBDUFU6IDAgUElEOiAx
NSBDb21tOiBrd29ya2VyLzA6MSBUYWludGVkOiBHICAgICAgICBXDQo+IDUuMi4wKyAjMzIxDQo+
ID4gPiBbICAxNTMuMTA3MjkwXSBIYXJkd2FyZSBuYW1lOiBGcmVlc2NhbGUgVnlicmlkIFZGNXh4
L1ZGNnh4IChEZXZpY2UNCj4gPiA+IFRyZWUpIFsgIDE1My4xMTM3NzJdIFdvcmtxdWV1ZTogZXZl
bnRzIGRlZmVycmVkX3Byb2JlX3dvcmtfZnVuYyBbDQo+ID4gPiAxNTMuMTE4OTc5XSBbPGMwMDE5
NTYwPl0gKHVud2luZF9iYWNrdHJhY2UpIGZyb20gWzxjMDAxNDczND5dDQo+ID4gPiAoc2hvd19z
dGFjaysweDEwLzB4MTQpIFsgIDE1My4xMjY3NzhdIFs8YzAwMTQ3MzQ+XSAoc2hvd19zdGFjaykg
ZnJvbQ0KPiA+ID4gWzxjMDgzZjhkYz5dIChkdW1wX3N0YWNrKzB4OWMvMHhkNCkgWyAgMTUzLjEz
NDA1MV0gWzxjMDgzZjhkYz5dDQo+ID4gPiAoZHVtcF9zdGFjaykgZnJvbSBbPGMwMDMxMTU0Pl0g
KF9fd2FybisweGY4LzB4MTI0KSBbICAxNTMuMTQxMDU2XQ0KPiA+ID4gWzxjMDAzMTE1ND5dIChf
X3dhcm4pIGZyb20gWzxjMDAzMTI0OD5dDQo+ID4gPiAod2Fybl9zbG93cGF0aF9mbXQrMHgzOC8w
eDQ4KSBbICAxNTMuMTQ4NTgwXSBbPGMwMDMxMjQ4Pl0NCj4gPiA+ICh3YXJuX3Nsb3dwYXRoX2Zt
dCkgZnJvbSBbPGMwNDBmZGUwPl0NCj4gPiA+IChjbGtfY29yZV9kaXNhYmxlX2xvY2srMHgxOC8w
eDI0KSBbICAxNTMuMTU3NDEzXSBbPGMwNDBmZGUwPl0NCj4gPiA+IChjbGtfY29yZV9kaXNhYmxl
X2xvY2spIGZyb20gWzxjMDU4ZjUyMD5dDQo+ID4gPiAoaTJjX2lteF9wcm9iZSsweDU1NC8weDZl
YykgWyAgMTUzLjE2NjA3Nl0gWzxjMDU4ZjUyMD5dDQo+ID4gPiAoaTJjX2lteF9wcm9iZSkgZnJv
bSBbPGMwNGI5MTc4Pl0gKHBsYXRmb3JtX2Rydl9wcm9iZSsweDQ4LzB4OTgpIFsNCj4gPiA+IDE1
My4xNzQyOTddIFs8YzA0YjkxNzg+XSAocGxhdGZvcm1fZHJ2X3Byb2JlKSBmcm9tIFs8YzA0Yjcy
OTg+XQ0KPiA+ID4gKHJlYWxseV9wcm9iZSsweDFkOC8weDJjMCkgWyAgMTUzLjE4MjYwNV0gWzxj
MDRiNzI5OD5dDQo+ID4gPiAocmVhbGx5X3Byb2JlKSBmcm9tIFs8YzA0Yjc1NTQ+XSAoZHJpdmVy
X3Byb2JlX2RldmljZSsweDVjLzB4MTc0KSBbDQo+ID4gPiAxNTMuMTkwOTA5XSBbPGMwNGI3NTU0
Pl0gKGRyaXZlcl9wcm9iZV9kZXZpY2UpIGZyb20gWzxjMDRiNThjOD5dDQo+ID4gPiAoYnVzX2Zv
cl9lYWNoX2RydisweDQ0LzB4OGMpIFsgIDE1My4xOTk0ODBdIFs8YzA0YjU4Yzg+XQ0KPiA+ID4g
KGJ1c19mb3JfZWFjaF9kcnYpIGZyb20gWzxjMDRiNzQ2Yz5dIChfX2RldmljZV9hdHRhY2grMHhh
MC8weDEwOCkgWw0KPiA+ID4gMTUzLjIwNzc4Ml0gWzxjMDRiNzQ2Yz5dIChfX2RldmljZV9hdHRh
Y2gpIGZyb20gWzxjMDRiNjVhND5dDQo+ID4gPiAoYnVzX3Byb2JlX2RldmljZSsweDg4LzB4OTAp
IFsgIDE1My4yMTU5OTldIFs8YzA0YjY1YTQ+XQ0KPiA+ID4gKGJ1c19wcm9iZV9kZXZpY2UpIGZy
b20gWzxjMDRiNmEwND5dDQo+ID4gPiAoZGVmZXJyZWRfcHJvYmVfd29ya19mdW5jKzB4NjAvMHg5
MCkNCj4gPiA+IFsgIDE1My4yMjUwMDNdIFs8YzA0YjZhMDQ+XSAoZGVmZXJyZWRfcHJvYmVfd29y
a19mdW5jKSBmcm9tDQo+ID4gPiBbPGMwMDRmMTkwPl0gKHByb2Nlc3Nfb25lX3dvcmsrMHgyMDQv
MHg2MzQpIFsgIDE1My4yMzQxNzhdDQo+ID4gPiBbPGMwMDRmMTkwPl0gKHByb2Nlc3Nfb25lX3dv
cmspIGZyb20gWzxjMDA0ZjYxOD5dDQo+ID4gPiAod29ya2VyX3RocmVhZCsweDIwLzB4NDg0KSBb
ICAxNTMuMjQyMzE1XSBbPGMwMDRmNjE4Pl0NCj4gPiA+ICh3b3JrZXJfdGhyZWFkKSBmcm9tIFs8
YzAwNTVjMmM+XSAoa3RocmVhZCsweDExOC8weDE1MCkgWyAgMTUzLjI0OTc1OF0NCj4gWzxjMDA1
NWMyYz5dIChrdGhyZWFkKSBmcm9tIFs8YzAwMDkwYjQ+XSAocmV0X2Zyb21fZm9yaysweDE0LzB4
MjApDQo+IFsgIDE1My4yNTcwMDZdIEV4Y2VwdGlvbiBzdGFjaygweGRkZTQzZmIwIHRvIDB4ZGRl
NDNmZjgpDQo+ID4gPiBbICAxNTMuMjYyMDk1XSAzZmEwOiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAwMDAwMDAwMA0KPiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMA0KPiA+
ID4gWyAgMTUzLjI3MDMwNl0gM2ZjMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAw
MDANCj4gMDAwMDAwMDANCj4gPiA+IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIFsgIDE1My4y
Nzg1MjBdIDNmZTA6IDAwMDAwMDAwDQo+IDAwMDAwMDAwDQo+ID4gPiAwMDAwMDAwMCAwMDAwMDAw
MCAwMDAwMDAxMyAwMDAwMDAwMCBbICAxNTMuMjg1MTU5XSBpcnEgZXZlbnQNCj4gc3RhbXA6DQo+
ID4gPiAzMzIzMDIyIFsgIDE1My4yODg3ODddIGhhcmRpcnFzIGxhc3QgIGVuYWJsZWQgYXQgKDMz
MjMwMjEpOg0KPiA+ID4gWzxjMDg2MWM0Yz5dIF9yYXdfc3Bpbl91bmxvY2tfaXJxKzB4MjQvMHgy
YyBbICAxNTMuMjk3MjYxXSBoYXJkaXJxcw0KPiA+ID4gbGFzdCBkaXNhYmxlZCBhdCAoMzMyMzAy
Mik6IFs8YzA0MGQ3YTA+XSBjbGtfZW5hYmxlX2xvY2srMHgxMC8weDEyNA0KPiA+ID4gWyAgMTUz
LjMwNTM5Ml0gc29mdGlycXMgbGFzdCAgZW5hYmxlZCBhdCAoMzMyMjA5Mik6IFs8YzAwMGE1MDQ+
XQ0KPiA+ID4gX19kb19zb2Z0aXJxKzB4MzQ0LzB4NTQwIFsgIDE1My4zMTMzNTJdIHNvZnRpcnFz
IGxhc3QgZGlzYWJsZWQgYXQNCj4gPiA+ICgzMzIyMDgxKTogWzxjMDAzODVjMD5dIGlycV9leGl0
KzB4MTBjLzB4MTI4IFsgIDE1My4zMjA5NDZdIC0tLVsgZW5kDQo+ID4gPiB0cmFjZSBhNTA2NzMx
Y2NkOWJkNzAzIF0tLS0NCj4gPiA+DQo+ID4gPiBXaGVuIHRoZSBETUEgZHJpdmVyIGlzIGJ1aWx0
IGFzIG1vZHVsZSB0aGVuIGRtYV9yZXF1ZXN0X2NoYW4oKQ0KPiA+ID4gcmV0dXJucyAtRVBST0JF
X0RFRkVSLCBzbyBsZXQncyB0cmVhdCB0aGlzIGNhc2UgaW4gdGhlIHNhbWUgd2F5IGFzDQo+ID4g
PiAidGhlcmUgaXMgbm8gRE1BIHN1cHBvcnQiIGFuZCBtYWtlIGkyY19pbXhfZG1hX3JlcXVlc3Qo
KSByZXR1cm4NCj4gc3VjY2Vzcy4NCj4gPiA+DQo+ID4gPiBSZXBvcnRlZC1ieTogUnVzc2VsbCBL
aW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+DQo+ID4gPiBGaXhlczogZTFhYjlhNDY4ZTNiICgi
aTJjOiBpbXg6IGltcHJvdmUgdGhlIGVycm9yIGhhbmRsaW5nIGluDQo+ID4gPiBpMmNfaW14X2Rt
YV9yZXF1ZXN0KCkiKQ0KPiA+ID4gU2lnbmVkLW9mZi1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2
YW1AZ21haWwuY29tPg0KPiA+DQo+ID4gSnVzdCBsZWFybmVkIHRoYXQgQW5kcmV5IGhhcyBhbHJl
YWR5IHN1Ym1pdHRlZCBhIGZpeCBmb3IgdGhpcyBzYW1lIHByb2JsZW06DQo+ID4NCj4gPiBJIHRo
aW5rIHdlIGNhbiBnbyB3aXRoIEFuZHJleSdzIHNvbHV0aW9uLg0KPiA+DQo+ID4gTWF5YmUgQW5k
cmV5IGNvdWxkIHJlc2VuZCBpdCB3aXRoIHRoZSBGaXhlcyB0YWcgc28gdGhhdCBpdCBjYW4gYmUN
Cj4gPiBiYWNrcG9ydGVkIHRvIHN0YWJsZS4NCj4gDQo+IFdlbGwsIHRoZSBxdWVzdGlvbiBpcyB3
aGF0IGJlaGF2aW91ciBkbyB3ZSB3YW50LiAgVGhlIGRyaXZlcidzIG9yaWdpbmFsDQo+IGJlaGF2
aW91ciBwcmlvciB0byBpdCBicmVha2luZyB3YXMgdG8gaWdub3JlIERNQSBpZiBpdCB3YXNuJ3Qg
Zm91bmQgKGUuZy4gd2hlbg0KPiB0aGUgRE1BIGRyaXZlciBpcyBhIG1vZHVsZS4pDQo+IA0KPiBZ
b3VyIHBhdGNoIHJlc3RvcmVzIHRoYXQgYmVoYXZpb3VyLCB3aGljaCBpcyB0aGUgc2FmZXN0IGFw
cHJvYWNoLg0KPiANCj4gQXVkcmV5J3MgcGF0Y2ggaGFzIHRoZSBlZmZlY3QgdGhhdCBub25lIG9m
IHRoZSBJMkMgYnVzZXMgd2lsbCBiZSByZWdpc3RlcmVkIGlmDQo+IHRoZSBETUEgZHJpdmVyIGlz
IGEgbW9kdWxlLCB1bnRpbCB0aGUgRE1BIGRyaXZlciBpcyBsb2FkZWQuICBTaW5jZSBhbiBJMkMg
YnVzDQo+IF9tYXlfIGhhdmUgdGhlIHN5c3RlbXMgUlRDIG9uIGl0LCBub3QgcHJvYmluZyB0aGUg
STJDIGJ1cyB3aWxsIGNhdXNlIHRoZSBSVEMNCj4gbm90IHRvIGJlIHJlYWQgYnkgdGhlIGtlcm5l
bCBhdCBib290LCBsZWFkaW5nIHRvIHRoZSBzeXN0ZW0gYm9vdGluZyB3aXRoIGENCj4gdW5peHRp
bWUgb2YgMC4NCj4gDQo+IEkgaGF2ZW4ndCBjaGVja2VkIHdoYXQgdGhlIHNpdHVhdGlvbiBpcyB3
cnQgUlRDcyBvbiB0aGUgWklJIGJvYXJkcywgd2hldGhlcg0KPiB0aGV5IGRvIGluZGVlZCBoYXZl
IGV4dGVybmFsIEkyQyBSVENzIG9uIHRoZW0uDQo+IA0KDQpJIHRoaW5rIHRoZSBwcm9ibGVtIG9m
IHRoaXMgcGF0Y2ggaXMgdGhhdCBpdCBicmVha3MgdGhlIGRlZmVyIHByb2JlIG9mIERNQSBlbmFi
bGVtZW50DQp3aGljaCBzZWVtcyBsaWtlIGEgbm9ybWFsIGNhc2UgaW4ga2VybmVsLiBlLmcuIERN
QSBkcml2ZXIgcHJvYmVkIGxhdGVyIHRoYW4gSTJDLg0KDQpJIHdvbmRlciBpZiB0aGVyZSdzIGEg
cmVhbCBjdXN0b21lciByZXF1aXJlbWVudCB0aGF0IHdhbnRpbmcgdGhlIEkyQyBzbGF2ZSBkZXZp
Y2VzIChlLmcuIFJUQykNCnRvIGJlIHByb2JlZCBlYXJseSBidXQgdXNpbmcgSTJDIHdpdGggRE1B
IGFuZCBidWlsZCBETUEgYXMgbW9kdWxlLg0KDQpJZiB0aGVyZSBpcyB0aGF0IHJlcXVpcmVtZW50
LCBtYXliZSB0aGUgY29ycmVjdCB3YXkgdG8gZml4IHRoaXMgaXNzdWUgdG8gZXhwbGljaXRseSBk
aXNhYmxlIEkyQyBETUENCmluIERUIHJhdGhlciB0aGFuIHNpbXBseSBmYWxsYmFjayB0byBwb2xs
aW5nIG1vZGUgZm9yIGFsbCB0aGUgY2FzZXMgaW5jbHVkaW5nIHRoZSByZWFzb25hYmxlIGRlZmVy
IHByb2JlLg0KDQpSZWdhcmRzDQpBaXNoZW5nDQoNCj4gLS0NCj4gUk1LJ3MgUGF0Y2ggc3lzdGVt
Og0KPiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9
aHR0cHMlM0ElMkYlMkZ3d3cuYXINCj4gbWxpbnV4Lm9yZy51ayUyRmRldmVsb3BlciUyRnBhdGNo
ZXMlMkYmYW1wO2RhdGE9MDIlN0MwMSU3Q2Fpc2hlbmcuDQo+IGRvbmclNDBueHAuY29tJTdDZDA1
MDg5ZWZmZDJhNGNkOTUxM2QwOGQ3MWI3YzE3NzklN0M2ODZlYTFkM2JjDQo+IDJiNGM2ZmE5MmNk
OTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNzAwODA5MjEwMTEwNDc3OSZhbXA7c2RhdGE9DQo+IGJj
MEJIJTJCbjZPMjBhJTJGaUloMTMyOG8xTSUyQmw5JTJCTk0xNlBWeGh1Vlh6SXNJYyUzRCZhbXA7
cmUNCj4gc2VydmVkPTANCj4gRlRUQyBicm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZSBpbiBzdWJ1
cmJpYTogc3luYyBhdCAxMi4xTWJwcyBkb3duIDYyMmticHMNCj4gdXAgQWNjb3JkaW5nIHRvIHNw
ZWVkdGVzdC5uZXQ6IDExLjlNYnBzIGRvd24gNTAwa2JwcyB1cA0K
