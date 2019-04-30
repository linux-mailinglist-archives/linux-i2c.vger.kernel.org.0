Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C290FF0CE
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 09:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbfD3HAI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 03:00:08 -0400
Received: from mail-eopbgr80054.outbound.protection.outlook.com ([40.107.8.54]:49399
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725554AbfD3HAH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Apr 2019 03:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWodjOc56GxoRXJ7b11rcRr8UAVFM0lQ1Ry7eKPeeLM=;
 b=eZMoWDLFzYyks9u5PeskXeGo0vSL2+rM75BGqOh3YBE5DDUJOXP1tSk0zXESe6lRLH7WF/PTwtJXUj02U6IFoUTgyyfyLTLKCsxSQZanr0nrumi3dnRFXMhKzSE5JhmvPVKNp7YifKIVxUyRbqvDuGKP1Q7lLynNUNQLUl/zPIk=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3913.eurprd04.prod.outlook.com (52.134.65.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 30 Apr 2019 07:00:02 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170%3]) with mapi id 15.20.1856.008; Tue, 30 Apr 2019
 07:00:02 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: [PATCH] i2c: imx-lpi2c: Use __maybe_unused instead of #if
 CONFIG_PM_SLEEP
Thread-Topic: [PATCH] i2c: imx-lpi2c: Use __maybe_unused instead of #if
 CONFIG_PM_SLEEP
Thread-Index: AQHU/yJVTGic+X2v4ESo316NmJN4TA==
Date:   Tue, 30 Apr 2019 07:00:02 +0000
Message-ID: <1556607314-32401-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0049.apcprd03.prod.outlook.com
 (2603:1096:203:52::13) To DB3PR0402MB3916.eurprd04.prod.outlook.com
 (2603:10a6:8:10::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c36baed-b0ed-4d30-20f7-08d6cd39779b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3913;
x-ms-traffictypediagnostic: DB3PR0402MB3913:
x-microsoft-antispam-prvs: <DB3PR0402MB3913FCFB62D55930AB342259F53A0@DB3PR0402MB3913.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(346002)(376002)(136003)(39850400004)(366004)(189003)(199004)(81166006)(305945005)(25786009)(52116002)(14454004)(316002)(64756008)(110136005)(99286004)(14444005)(8676002)(256004)(66476007)(66556008)(66446008)(8936002)(73956011)(81156014)(66946007)(7736002)(50226002)(68736007)(97736004)(478600001)(53936002)(71200400001)(2201001)(86362001)(6436002)(4326008)(2616005)(476003)(486006)(6486002)(71190400001)(186003)(66066001)(2906002)(26005)(6512007)(6116002)(3846002)(5660300002)(386003)(2501003)(6506007)(36756003)(102836004);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3913;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cQZ/y2g4Ao7edhl43KTfUF/Z2+id2uSMNeSz3OYjNyfxvezUsFYIs7Fx0HGfg7iKoF5ClgIox2Fy4HvkGF/zSlCqDfAlhOKtyu4VYt3Z3whbuWJ+UzwhaKxR0nV3DqADyk4C6F6XYGHSQubKWMfacUugfEoxkbbM3ivBcC/F2HeUvikeZ+OOEKv877zV0EmFWrRC2L/N1z0tIlOttrWXMZyJ9FJtip3W6lwFr9dPeuGLWlT/EfhjmiaCFcF23wrgZDUa7Qce0O4yR3q/DrTdOy2Z7PinSX02GF0TCM73ECxfiB4F3XVInTFB2TOoAmR106oJVHvDDBduclfC6yutUr4WcHC4DWCcHxPtM7IkBoGRWs6FNA9uLch2UbZXU1/rCQroh+AjnfGVaPlw5dgvmuVY01v1cfy/tpONv/al6bw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c36baed-b0ed-4d30-20f7-08d6cd39779b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 07:00:02.7402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3913
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VXNlIF9fbWF5YmVfdW51c2VkIGZvciBwb3dlciBtYW5hZ2VtZW50IHJlbGF0ZWQgZnVuY3Rpb25z
DQppbnN0ZWFkIG9mICNpZiBDT05GSUdfUE1fU0xFRVAgdG8gc2ltcGx5IHRoZSBjb2RlLg0KDQpT
aWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCi0tLQ0KIGRy
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMgfCAxMSArKystLS0tLS0tLQ0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jIGIvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1pbXgtbHBpMmMuYw0KaW5kZXggMDZjNGM3Ni4uZGMwMGZhYiAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtaW14LWxwaTJjLmMNCkBAIC02MzksOCArNjM5LDcgQEAgc3RhdGljIGludCBscGkyY19p
bXhfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQogCXJldHVybiAwOw0KIH0N
CiANCi0jaWZkZWYgQ09ORklHX1BNX1NMRUVQDQotc3RhdGljIGludCBscGkyY19ydW50aW1lX3N1
c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgbHBp
MmNfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCiB7DQogCXN0cnVjdCBscGky
Y19pbXhfc3RydWN0ICpscGkyY19pbXggPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCiANCkBAIC02
NTAsNyArNjQ5LDcgQEAgc3RhdGljIGludCBscGkyY19ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRl
dmljZSAqZGV2KQ0KIAlyZXR1cm4gMDsNCiB9DQogDQotc3RhdGljIGludCBscGkyY19ydW50aW1l
X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQorc3RhdGljIGludCBfX21heWJlX3VudXNlZCBs
cGkyY19ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQogew0KIAlzdHJ1Y3QgbHBp
MmNfaW14X3N0cnVjdCAqbHBpMmNfaW14ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQogCWludCBy
ZXQ7DQpAQCAtNjcxLDEwICs2NzAsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMg
bHBpMmNfcG1fb3BzID0gew0KIAlTRVRfUlVOVElNRV9QTV9PUFMobHBpMmNfcnVudGltZV9zdXNw
ZW5kLA0KIAkJCSAgIGxwaTJjX3J1bnRpbWVfcmVzdW1lLCBOVUxMKQ0KIH07DQotI2RlZmluZSBJ
TVhfTFBJMkNfUE0gICAgICAoJmxwaTJjX3BtX29wcykNCi0jZWxzZQ0KLSNkZWZpbmUgSU1YX0xQ
STJDX1BNICAgICAgTlVMTA0KLSNlbmRpZg0KIA0KIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJp
dmVyIGxwaTJjX2lteF9kcml2ZXIgPSB7DQogCS5wcm9iZSA9IGxwaTJjX2lteF9wcm9iZSwNCkBA
IC02ODIsNyArNjc3LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbHBpMmNfaW14
X2RyaXZlciA9IHsNCiAJLmRyaXZlciA9IHsNCiAJCS5uYW1lID0gRFJJVkVSX05BTUUsDQogCQku
b2ZfbWF0Y2hfdGFibGUgPSBscGkyY19pbXhfb2ZfbWF0Y2gsDQotCQkucG0gPSBJTVhfTFBJMkNf
UE0sDQorCQkucG0gPSAmbHBpMmNfcG1fb3BzLA0KIAl9LA0KIH07DQogDQotLSANCjIuNy40DQoN
Cg==
