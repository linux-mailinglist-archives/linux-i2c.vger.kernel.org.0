Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8792338BFB3
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 08:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233467AbhEUGnJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 02:43:09 -0400
Received: from mail-eopbgr70053.outbound.protection.outlook.com ([40.107.7.53]:48032
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233795AbhEUGlI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 02:41:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9Du33QSs1i1xYQ7rKV/LR3H0/2gqaShiPmWK1lFKvdi2Gbv+ZSMJ6LL9LkOusP58GRGMadhCx2Ur5/MWEdyw5+JTQq+MLsdct7eLtbwUxQHlTnnOQ1p+NLNfpARhYGnyrYQjiGZwIQDq/vpi+xRcI0/GlgvKYMexcqmOg4mT/HV98Z2/I/3FXI4TMyV+xQPC7POP6diICAjvGXvE5QJnxNdI8F6vbnI9mDqXcR1Kp0lJFbrV0pwTZ3uHP3gyXxJ7NoZs+sIVbn4zokOXN81audu54QIgQK4gnPo5T95FQxISGi1vEbGZok2kWgTsHmWt4DXW7vQRwMfivwB4Ou0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHBNt/YkIvo0jGmkEM8V27v2ID/kaMQnLxV5fgjI5uk=;
 b=G5s2017r45CYQMWUCPRBg+kjcLyoyTgglb405yJl0+0VGkV0upoid2Ulr8hgzsw9roInITPEwd/GISnDrL7iURoCsG1oVr8HH71lfWgwi7Y5UHX5fjZKyEIztZNCwFpFHb2uyukOEY7OutQj8s6AHm9jkRYFuQPyvcLrPSKXkX/lFRQdfS9HGXvZbgI3f3cx5ol8ZTam0nG0z8LSjqsrZ9BVqyAdZz01GquMjSeM6GDYj7mUmoPRo2ThJS5wCN18IKg68bTAPhEwoLLSAWgYQTqpomB039Caz3Tat3cFcgtmsEJecFV1CfaJ60PWN6lEjMDOtkSETlJxgUf7LN7s1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHBNt/YkIvo0jGmkEM8V27v2ID/kaMQnLxV5fgjI5uk=;
 b=Xh5/0KC4zc7Ud5d6LuNsQgfPKD0oMBMjqYPMrT6ahqA9scbdkszBrobIG2T8W3sUudV0qRyZSsxU07aaB1QRur9TgYSnPVP1+xQPIrun6o2PNWS9eN2LpL0k3f4OrUKyFJ+uUAkpqjhghZrnQPdhdoOk9bX8XP+I+r92j8dXuNs=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB4279.eurprd04.prod.outlook.com (2603:10a6:209:4a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 21 May
 2021 06:38:51 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 06:38:51 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Clark Wang <xiaoning.wang@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V2 07/18] i2c: imx-lpi2c: manage irq resource
 request/release in runtime pm
Thread-Topic: [PATCH V2 07/18] i2c: imx-lpi2c: manage irq resource
 request/release in runtime pm
Thread-Index: AQHXKtinw+apF1/Em0yT/Q3VwnTl3artwHIg
Date:   Fri, 21 May 2021 06:38:51 +0000
Message-ID: <AM6PR04MB4966B89DE0BFD7C604035B9880299@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
 <20210406113306.2633595-8-xiaoning.wang@nxp.com>
In-Reply-To: <20210406113306.2633595-8-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f917b099-d36f-4bd3-e2fa-08d91c2318bc
x-ms-traffictypediagnostic: AM6PR04MB4279:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB427952C38D16D828F8C36CFD80299@AM6PR04MB4279.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MFbpBTmj03GAPq33t9ruG+UCihUrJ4hcBM8nDqtF7qMLjm8XtLizN04ArBVBOBtcGnUH5CckGVbLktUIRpLcDoyagBgTHjbNWEj44GLmy0szGbdO2jdQk6R1y56H96COntex3qXg6upPoFUag8jF1PwThG2CkHh3J5oBWAydpzQD7w+k36Fjn/EqS/iIM6VD0WaIb1YHwYpQMzjZe3LmZO7YPKhcJ2LarVRJI5wBASbXXhu0eC7crW/1yhFk7W12McWurCb11h6YqO4mjjCVt8ov9YIiML02lAnFoA5FgxbNn8k5AXwTFXkGnUhLiWiQtcwU/D6YO/jbzwKG3A7ciakTKTgy7c6IojP5Hfpw4gsgszSTCtJUQ5q4bkuj58GMIqfryPNtap5cS/k7cDIC9UPAZNRx6Hr9B50L4JV9W5BCvVvO1ze/ot91EpQWAKzdw9YJnIKA1iDjyeuth8tsOuRNZVrtulanYHqaHWVmmIV4hV3Qs6wzrmKatOXNTZojDU/2nYmySM3Iat9+K+3iIG5JjFlhph4NExXACnVVGH1/a57oHYEt99Svo3YAr/oWBcNhu4Q59Cy9ue7xeTNaRTkxhEXckhPOt9YcmqY30Rs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(55016002)(8676002)(9686003)(33656002)(44832011)(478600001)(6506007)(52536014)(66476007)(26005)(66946007)(86362001)(186003)(4326008)(66446008)(66556008)(76116006)(71200400001)(64756008)(83380400001)(316002)(122000001)(5660300002)(110136005)(7696005)(54906003)(8936002)(2906002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?OHRETXNBY1IvMnlFbTR2bEFrYTNDQVE3ZXlsV05BaU1lTDFmSkFvR0dwN2Z0?=
 =?utf-8?B?NnlSOGJDNGp5R0FaWFZnMWRjZGFlUitvMWpsRkgrSnVrQnM1dnQrV09yVUR1?=
 =?utf-8?B?MGRoTCtDVGZvR2xmWWo1Y2FWYU9YQXErdE1Jai9SUDNML21kQXFiZWFYZW9a?=
 =?utf-8?B?L2thOXRpWldKeDVDa0FqRVdPYWVJOEFqeUg0SlNQVVNGRjhMYnpyaG43akZo?=
 =?utf-8?B?WThnQURuUWc4bGVsZ1AvcTB1ZU5zdmxBVktHZ2xzR215N2psOEdEVUZHVnFV?=
 =?utf-8?B?a0lpUzc4OEZ2Z0tGOE9tdEhMSDFqaEZLZlNFcWhoSSs0WjJQM2Q2U1hqUjdq?=
 =?utf-8?B?MEZ3Tmc1NzNma01JeHMxd2RQY2l6RVIyZjJiR0RFZHlwUEt0WmFqbmVBSG51?=
 =?utf-8?B?Q0QrQlRqNTBuZG44NjExVVFtdkRrMThLUW1mb25CN2k4b2lUN3h5b3pmQlpi?=
 =?utf-8?B?MnRQMVVRcWNUK2h2Ry9uUmFvdlZkUDMwRnBHcFpiN1I1T2tpTjJPS1VlbTJl?=
 =?utf-8?B?Y0o5NFVPa2NJTzRTUEduSFFQb3YwY0pXWFNiWjQzVys5M2VVMlZ3UnBmNnBZ?=
 =?utf-8?B?OFMrVURXMm1CejNOK3BIN1JCRlhxMGFIbzRlUlJJeGIxSUNUWDlCc3F5NFUr?=
 =?utf-8?B?SWExeHozQUF3MS9zVm84MkIzbEJjc2dEbVRJVlpwaFBYdEU0dUl1dis5Sllh?=
 =?utf-8?B?dUtodE5hRnhEeDVwMmJKc2RWdTBOSGJBazhVZmUzVGNJL1lHRmw3aE0zWXdL?=
 =?utf-8?B?em5qb1VqOUNiRUV5MWovYVpBRkZYOWlRVldicUdSN3dPb3EwcGRyak5zQ3dJ?=
 =?utf-8?B?UHdJMlF4dUVJbWgrY0h6RTYvd1Q5K1VlNXl6clNOUmh0eXJ0cFFnZEhhTXRw?=
 =?utf-8?B?OTRuV2Q0bm9aSXFVM3VQZGxJeGhCZ0RoSy8xZzVROWIyTDZJaC80MnNlcHM1?=
 =?utf-8?B?L0F2RFY2S25SZFBnYmtSOVhpMW9LRHZlckZ3SjhaZmQrOTUwaGRYa1RMOHAv?=
 =?utf-8?B?REREZ29UUGgxUUhmanZCNVZlNjExT2ltRVFGZE8vTy9MSDU5dThnMUhBUGEy?=
 =?utf-8?B?K2psa1UvSkpDZVpsNFVkblJhRklzZzFSNkVSREY0d0NpcHRxaFZXUEhEWXVi?=
 =?utf-8?B?UGNlem9YQkFubUszMWZqMTd5M2NVVUlGNmh2QlN6cHdyQURVL0NTNEN5ZWFR?=
 =?utf-8?B?K3JDZVo3S1hYdkZ5VUk3bFF2cU9iMW1DMnRmak10UWtxRG1MeVVyQTBUMUs4?=
 =?utf-8?B?NU4vdmlSSWtCMC9UQVA1azIyZ1JEL0RVSE1WNmF6cEYyRm55dFRLZ1VJY1VG?=
 =?utf-8?B?cGVjU1BIU2FXUEpRV1YxK3kxUVIxYy93Q21rdVUxUGUyditpMVkyQy9FTEtj?=
 =?utf-8?B?ZFRiSitRbGVZUEFqZ2hPcUlQcFBwUi9VNWVJcU00R0haa3BxY2RTcFF1UTdN?=
 =?utf-8?B?dHpiVDNFYlVoK2dseS9XOHltaEJwTlRhMWRtQTA3VE9LOVJJRWJwWkY3elNp?=
 =?utf-8?B?TWJPV094bjFpdVgxSzZxbzFsM2lZQU1GWXVCWjQxR2Qrd2FtZW1sQUxmRmNE?=
 =?utf-8?B?S3JZd3h2NjhMYmZyUTFIeDdxUzlpdFRxVVkvYytoVkd1WUhsS0tIRWRNbE5W?=
 =?utf-8?B?Q1YzYW1odkR5eW5nQlRhUjRudGFXYXkvdHV5WE9ua0g1cUwrUkYvMkVJbzFO?=
 =?utf-8?B?RUlHMTJMVHltYnhzLzF6RS96UjU0eTdhaDlVSmlmNE1UeDhkc3F1QkttclNS?=
 =?utf-8?Q?zF1+qvdDCsr+xMiNq7PbxErnmg4S9XTFIhM79v0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f917b099-d36f-4bd3-e2fa-08d91c2318bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 06:38:51.3071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OnPnbk/YNSJVC2m5VuvgL/PJjjwlsV/vORMXkTf0HGGI+OOwnlSnABsqgynJtYTsVZuD26sTKtSnryN0QnnJJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4279
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIEFwcmlsIDYsIDIwMjEgNzozMyBQTQ0KPiANCj4gTWFuYWdlIGlycSByZXNvdXJjZSByZXF1
ZXN0L3JlbGVhc2UgaW4gcnVudGltZSBwbSB0byBzYXZlIGlycSBkb21haW4ncw0KPiBwb3dlci4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBGdWdhbmcgRHVhbiA8ZnVnYW5nLmR1YW5AbnhwLmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogQ2xhcmsgV2FuZyA8eGlhb25pbmcud2FuZ0BueHAuY29tPg0KPiBSZXZpZXdlZC1ieTog
RnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+DQoNClJldmlld2VkLWJ5OiBEb25nIEFpc2hlbmcg
PGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KDQpSZWdhcmRzDQpBaXNoZW5nDQoNCj4gLS0tDQo+IFYy
IGNoYW5nZXM6DQo+ICAtIENoYW5nZSB0byB1c2UgcmVxdWVzdF9pcnEvZnJlZV9pcnEuDQo+IC0t
LQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMuYyB8IDMwICsrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyks
IDEyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtaW14LWxwaTJjLmMNCj4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jDQo+
IGluZGV4IDg5YjdiMDc5NWY1MS4uMzMzMjA5YmE4MWMxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtaW14LWxwaTJjLmMNCj4gQEAgLTk0LDYgKzk0LDcgQEAgZW51bSBscGkyY19pbXhfcGluY2Zn
IHsNCj4gDQo+ICBzdHJ1Y3QgbHBpMmNfaW14X3N0cnVjdCB7DQo+ICAJc3RydWN0IGkyY19hZGFw
dGVyCWFkYXB0ZXI7DQo+ICsJaW50CQkJaXJxOw0KPiAgCXN0cnVjdCBjbGsJCSpjbGtfcGVyOw0K
PiAgCXN0cnVjdCBjbGsJCSpjbGtfaXBnOw0KPiAgCXZvaWQgX19pb21lbQkJKmJhc2U7DQo+IEBA
IC01NzEsNyArNTcyLDcgQEAgc3RhdGljIGludCBscGkyY19pbXhfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZQ0KPiAqcGRldikgIHsNCj4gIAlzdHJ1Y3QgbHBpMmNfaW14X3N0cnVjdCAqbHBp
MmNfaW14Ow0KPiAgCXVuc2lnbmVkIGludCB0ZW1wOw0KPiAtCWludCBpcnEsIHJldDsNCj4gKwlp
bnQgcmV0Ow0KPiANCj4gIAlscGkyY19pbXggPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6
ZW9mKCpscGkyY19pbXgpLCBHRlBfS0VSTkVMKTsNCj4gIAlpZiAoIWxwaTJjX2lteCkNCj4gQEAg
LTU4MSw5ICs1ODIsOSBAQCBzdGF0aWMgaW50IGxwaTJjX2lteF9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlDQo+ICpwZGV2KQ0KPiAgCWlmIChJU19FUlIobHBpMmNfaW14LT5iYXNlKSkNCj4g
IAkJcmV0dXJuIFBUUl9FUlIobHBpMmNfaW14LT5iYXNlKTsNCj4gDQo+IC0JaXJxID0gcGxhdGZv
cm1fZ2V0X2lycShwZGV2LCAwKTsNCj4gLQlpZiAoaXJxIDwgMCkNCj4gLQkJcmV0dXJuIGlycTsN
Cj4gKwlscGkyY19pbXgtPmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7DQo+ICsJaWYg
KGxwaTJjX2lteC0+aXJxIDwgMCkNCj4gKwkJcmV0dXJuIGxwaTJjX2lteC0+aXJxOw0KPiANCj4g
IAlscGkyY19pbXgtPmFkYXB0ZXIub3duZXIJPSBUSElTX01PRFVMRTsNCj4gIAlscGkyY19pbXgt
PmFkYXB0ZXIuYWxnbwkJPSAmbHBpMmNfaW14X2FsZ287DQo+IEBAIC02MDksMTMgKzYxMCw2IEBA
IHN0YXRpYyBpbnQgbHBpMmNfaW14X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBk
ZXYpDQo+ICAJaWYgKHJldCkNCj4gIAkJbHBpMmNfaW14LT5iaXRyYXRlID0gSTJDX01BWF9TVEFO
REFSRF9NT0RFX0ZSRVE7DQo+IA0KPiAtCXJldCA9IGRldm1fcmVxdWVzdF9pcnEoJnBkZXYtPmRl
diwgaXJxLCBscGkyY19pbXhfaXNyLCAwLA0KPiAtCQkJICAgICAgIHBkZXYtPm5hbWUsIGxwaTJj
X2lteCk7DQo+IC0JaWYgKHJldCkgew0KPiAtCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJjYW4ndCBj
bGFpbSBpcnEgJWRcbiIsIGlycSk7DQo+IC0JCXJldHVybiByZXQ7DQo+IC0JfQ0KPiAtDQo+ICAJ
aTJjX3NldF9hZGFwZGF0YSgmbHBpMmNfaW14LT5hZGFwdGVyLCBscGkyY19pbXgpOw0KPiAgCXBs
YXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGxwaTJjX2lteCk7DQo+IA0KPiBAQCAtNjY4LDYgKzY2
Miw3IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQNCj4gbHBpMmNfcnVudGltZV9zdXNwZW5k
KHN0cnVjdCBkZXZpY2UgKmRldikgIHsNCj4gIAlzdHJ1Y3QgbHBpMmNfaW14X3N0cnVjdCAqbHBp
MmNfaW14ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+IA0KPiArCWZyZWVfaXJxKGxwaTJjX2lt
eC0+aXJxLCBscGkyY19pbXgpOw0KPiAgCWxwaTJjX2lteF9jbG9ja3NfdW5wcmVwYXJlKGxwaTJj
X2lteCk7DQo+ICAJcGluY3RybF9wbV9zZWxlY3Rfc2xlZXBfc3RhdGUoZGV2KTsNCj4gDQo+IEBA
IC02NzcsMTAgKzY3MiwyMSBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkDQo+IGxwaTJjX3J1
bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpICBzdGF0aWMgaW50IF9fbWF5YmVfdW51
c2VkDQo+IGxwaTJjX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikgIHsNCj4gIAlz
dHJ1Y3QgbHBpMmNfaW14X3N0cnVjdCAqbHBpMmNfaW14ID0gZGV2X2dldF9kcnZkYXRhKGRldik7
DQo+ICsJaW50IHJldCA9IDA7DQo+IA0KPiAgCXBpbmN0cmxfcG1fc2VsZWN0X2RlZmF1bHRfc3Rh
dGUoZGV2KTsNCj4gKwlyZXQgPSBscGkyY19pbXhfY2xvY2tzX3ByZXBhcmUobHBpMmNfaW14KTsN
Cj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiANCj4gLQlyZXR1cm4gbHBpMmNfaW14
X2Nsb2Nrc19wcmVwYXJlKGxwaTJjX2lteCk7DQo+ICsJcmV0ID0gcmVxdWVzdF9pcnEobHBpMmNf
aW14LT5pcnEsIGxwaTJjX2lteF9pc3IsIDAsDQo+ICsJCQkgICAgICAgZGV2X25hbWUoZGV2KSwg
bHBpMmNfaW14KTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCWRldl9lcnIoZGV2LCAiY2FuJ3QgY2xh
aW0gaXJxICVkXG4iLCBscGkyY19pbXgtPmlycSk7DQo+ICsJCXJldHVybiByZXQ7DQo+ICsJfQ0K
PiArDQo+ICsJcmV0dXJuIHJldDsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRl
dl9wbV9vcHMgbHBpMmNfcG1fb3BzID0gew0KPiAtLQ0KPiAyLjI1LjENCg0K
