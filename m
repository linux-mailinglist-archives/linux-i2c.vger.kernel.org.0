Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B341928F62
	for <lists+linux-i2c@lfdr.de>; Fri, 24 May 2019 05:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387408AbfEXDDk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 May 2019 23:03:40 -0400
Received: from mail-eopbgr30075.outbound.protection.outlook.com ([40.107.3.75]:59395
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387726AbfEXDDk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 May 2019 23:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+elwtMaVccSnErT5xEbk/E+DLbn0WmsZFdqXkpqZ1Mc=;
 b=VyWnnSeitFOtUU7HbMgccFJSATk+8ABSvEtViEEJe1iTxIQEj3c8B+UzmSnB/1jv6F8WtO73OHw7cHYPoRn65B8+n3eo3tcJC1y7g3SoTxQFZcLRuH14a0PVQpVl0BURjpajSwEP/t+ByEGI+MCt2YGfpTvK9klpaVaNkW/Pjwk=
Received: from VI1PR04MB3247.eurprd04.prod.outlook.com (10.170.232.160) by
 VI1PR04MB5872.eurprd04.prod.outlook.com (20.178.205.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Fri, 24 May 2019 03:03:37 +0000
Received: from VI1PR04MB3247.eurprd04.prod.outlook.com
 ([fe80::25fd:3f96:2ed5:867]) by VI1PR04MB3247.eurprd04.prod.outlook.com
 ([fe80::25fd:3f96:2ed5:867%4]) with mapi id 15.20.1922.018; Fri, 24 May 2019
 03:03:36 +0000
From:   Qiang Zhao <qiang.zhao@nxp.com>
To:     "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Qiang Zhao <qiang.zhao@nxp.com>
Subject: [PATCH] i2c: layerscape: use PIO when fail to request dma channel
Thread-Topic: [PATCH] i2c: layerscape: use PIO when fail to request dma
 channel
Thread-Index: AQHVEd1HeywaNDBGDEa3Wde5CXaE+g==
Date:   Fri, 24 May 2019 03:03:36 +0000
Message-ID: <20190524030514.14082-1-qiang.zhao@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:202:2e::14) To VI1PR04MB3247.eurprd04.prod.outlook.com
 (2603:10a6:802:11::32)
x-mailer: git-send-email 2.17.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=qiang.zhao@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73f7e26c-4dd5-4794-4f3e-08d6dff46a02
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5872;
x-ms-traffictypediagnostic: VI1PR04MB5872:
x-microsoft-antispam-prvs: <VI1PR04MB587252107BE79B329F64087891020@VI1PR04MB5872.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(346002)(136003)(39860400002)(376002)(189003)(199004)(186003)(36756003)(2351001)(52116002)(102836004)(2906002)(71190400001)(71200400001)(386003)(6506007)(6486002)(1076003)(53936002)(68736007)(14454004)(478600001)(66066001)(5660300002)(6512007)(316002)(99286004)(26005)(6436002)(6916009)(2501003)(476003)(2616005)(256004)(14444005)(54906003)(486006)(3846002)(66476007)(8676002)(66556008)(50226002)(1730700003)(4326008)(66946007)(6116002)(86362001)(25786009)(44832011)(64756008)(66446008)(5640700003)(7736002)(305945005)(73956011)(8936002)(81156014)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5872;H:VI1PR04MB3247.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N0bava5xkd4jv0CRlkWfcObRiQ2vDVcrYsFseAwN6eHI/kZr3iJGf6RYvqptyo7QeXDH7oVr1hA3LedOrDkoWFUX0W4EtXBZhGc6N5mh6xv3ZDTs7R288ij29UWAIU5L4x0ddgk2X5SJ3gMaeznsWMSVdnofeDVIeIfC2zJbcfg6Lxx1MmW/8fUTcn4VcF1AVZJe5u0mehZcHPKhWdmqaTSVUd6CXpgU/SLmz15aLAUuoTOC807tkDi5XMpGSYliH8jJ5qjd+LDahUmEgTWpzvcvLPvHJiwbPJ8cEq5zU8feKjzxOX97+0UQipAGNL7awUXFa1AXvpXGEfcj/ckd9S8bd64DtqQ2iP/ZbsXkH6Jj4unydqgpzWKlIzcQpSTRDesq6ku7PhI1Pz6NS3HaetrYbPbuBiQAY9lBgIQ93+g=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f7e26c-4dd5-4794-4f3e-08d6dff46a02
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 03:03:36.8691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qiang.zhao@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5872
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

V2hlbiBmYWlsIHRvIHJlcXVlc3QgRE1BIFRYL1JYIGNoYW5uZWwsIHVzZSBQSU8gaW5zdGVhZCBm
b3IgbGF5ZXJzY2FwZS4NCg0KU2lnbmVkLW9mZi1ieTogWmhhbyBRaWFuZyA8cWlhbmcuemhhb0Bu
eHAuY29tPg0KLS0tDQogZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYyB8IDExICsrKysrKysr
KysrDQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5j
DQppbmRleCA5OGIyNzg2MTNjZjIuLjM5YTVhYjRjZjMzMiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtaW14LmMNCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMN
CkBAIC0zNDcsOSArMzQ3LDEzIEBAIHN0YXRpYyBpbnQgaTJjX2lteF9kbWFfcmVxdWVzdChzdHJ1
Y3QgaW14X2kyY19zdHJ1Y3QgKmkyY19pbXgsDQogDQogCWRtYS0+Y2hhbl90eCA9IGRtYV9yZXF1
ZXN0X2NoYW4oZGV2LCAidHgiKTsNCiAJaWYgKElTX0VSUihkbWEtPmNoYW5fdHgpKSB7DQorI2lm
ZGVmIENPTkZJR19BUkNIX0xBWUVSU0NBUEUNCisJCWRldl9kYmcoZGV2LCAiY2FuJ3QgcmVxdWVz
dCBETUEgdHggY2hhbm5lbFxuIik7DQorI2Vsc2UNCiAJCXJldCA9IFBUUl9FUlIoZG1hLT5jaGFu
X3R4KTsNCiAJCWlmIChyZXQgIT0gLUVOT0RFViAmJiByZXQgIT0gLUVQUk9CRV9ERUZFUikNCiAJ
CQlkZXZfZXJyKGRldiwgImNhbid0IHJlcXVlc3QgRE1BIHR4IGNoYW5uZWwgKCVkKVxuIiwgcmV0
KTsNCisjZW5kaWYNCiAJCWdvdG8gZmFpbF9hbDsNCiAJfQ0KIA0KQEAgLTM2Niw5ICszNzAsMTMg
QEAgc3RhdGljIGludCBpMmNfaW14X2RtYV9yZXF1ZXN0KHN0cnVjdCBpbXhfaTJjX3N0cnVjdCAq
aTJjX2lteCwNCiANCiAJZG1hLT5jaGFuX3J4ID0gZG1hX3JlcXVlc3RfY2hhbihkZXYsICJyeCIp
Ow0KIAlpZiAoSVNfRVJSKGRtYS0+Y2hhbl9yeCkpIHsNCisjaWZkZWYgQ09ORklHX0FSQ0hfTEFZ
RVJTQ0FQRQ0KKwkJZGV2X2RiZyhkZXYsICJjYW4ndCByZXF1ZXN0IERNQSByeCBjaGFubmVsXG4i
KTsNCisjZWxzZQ0KIAkJcmV0ID0gUFRSX0VSUihkbWEtPmNoYW5fcngpOw0KIAkJaWYgKHJldCAh
PSAtRU5PREVWICYmIHJldCAhPSAtRVBST0JFX0RFRkVSKQ0KIAkJCWRldl9lcnIoZGV2LCAiY2Fu
J3QgcmVxdWVzdCBETUEgcnggY2hhbm5lbCAoJWQpXG4iLCByZXQpOw0KKyNlbmRpZg0KIAkJZ290
byBmYWlsX3R4Ow0KIAl9DQogDQpAQCAtMzk2LDYgKzQwNCw5IEBAIHN0YXRpYyBpbnQgaTJjX2lt
eF9kbWFfcmVxdWVzdChzdHJ1Y3QgaW14X2kyY19zdHJ1Y3QgKmkyY19pbXgsDQogCWRtYV9yZWxl
YXNlX2NoYW5uZWwoZG1hLT5jaGFuX3R4KTsNCiBmYWlsX2FsOg0KIAlkZXZtX2tmcmVlKGRldiwg
ZG1hKTsNCisjaWZkZWYgQ09ORklHX0FSQ0hfTEFZRVJTQ0FQRQ0KKwlkZXZfaW5mbyhkZXYsICJj
YW4ndCB1c2UgRE1BLCB1c2luZyBQSU8gaW5zdGVhZC5cbiIpOw0KKyNlbmRpZg0KIAkvKiByZXR1
cm4gc3VjY2Vzc2Z1bGx5IGlmIHRoZXJlIGlzIG5vIGRtYSBzdXBwb3J0ICovDQogCXJldHVybiBy
ZXQgPT0gLUVOT0RFViA/IDAgOiByZXQ7DQogfQ0KLS0gDQoyLjE3LjENCg0K
