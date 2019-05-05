Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49A0513CF9
	for <lists+linux-i2c@lfdr.de>; Sun,  5 May 2019 05:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727539AbfEEDcB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 May 2019 23:32:01 -0400
Received: from mail-eopbgr20067.outbound.protection.outlook.com ([40.107.2.67]:7394
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726524AbfEEDcB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 4 May 2019 23:32:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mRpMsbd2ECkI5XqAmmm/Zo5WsjadPqWFJytnNcIp+I=;
 b=ljiQ50tdcX5x2ByQp5VTXSOzuN6NZwgboS6NsCsiUoqKYgZ9qJvthsjQjahEOhVmVgyfuELWCV+m5LWaBSafRRPgxxYNuX4k4AteJf4REYoiI3xcbkjQm74tJwH7mbw5FvkvnrWHiSghj6FagbmdzmksGrpnramcZHM+QhA/faA=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3788.eurprd04.prod.outlook.com (52.134.72.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Sun, 5 May 2019 03:31:55 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170%3]) with mapi id 15.20.1856.012; Sun, 5 May 2019
 03:31:55 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "eha@deif.com" <eha@deif.com>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        "peda@axentia.se" <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: [PATCH] i2c: imx: Use __maybe_unused instead of #if CONFIG_PM
Thread-Topic: [PATCH] i2c: imx: Use __maybe_unused instead of #if CONFIG_PM
Thread-Index: AQHVAvMW5SvMlMIW0UqHU1fqWG2/GA==
Date:   Sun, 5 May 2019 03:31:55 +0000
Message-ID: <1557026820-29428-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR04CA0083.apcprd04.prod.outlook.com
 (2603:1096:202:15::27) To DB3PR0402MB3916.eurprd04.prod.outlook.com
 (2603:10a6:8:10::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9540aff-ad98-4d8d-db10-08d6d10a38a7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3788;
x-ms-traffictypediagnostic: DB3PR0402MB3788:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <DB3PR0402MB378857C27D412E423ABB9F15F5370@DB3PR0402MB3788.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 00286C0CA6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(366004)(136003)(376002)(346002)(39860400002)(199004)(189003)(53936002)(7736002)(6486002)(6506007)(386003)(2501003)(2616005)(26005)(316002)(7416002)(73956011)(66446008)(64756008)(66556008)(66476007)(66946007)(3846002)(6116002)(50226002)(186003)(8936002)(81166006)(81156014)(8676002)(68736007)(5660300002)(71190400001)(86362001)(71200400001)(110136005)(2201001)(4326008)(25786009)(6436002)(36756003)(2906002)(486006)(478600001)(99286004)(14454004)(476003)(6512007)(66066001)(14444005)(256004)(52116002)(102836004)(305945005)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3788;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HPBTnNEugpty74EITfg67+mf6/dreXESJNSkpDbEon4gPF1Ax6kLqNRsfpPqPTnF9s5pBRgiFYVDSc7IPSErh35hWTF+waF/UO9uMwe6PDUxYQLyUdnLSJlkRy7jYkmCZsgBeUW5MzZD7tWoV+xc0jO6o9ZuoZpx+slpB6rjoZGRUPTKnHJ9KnPgbZlVIGvTceFPcW04RYhRmpjZmsDOHrGugOW2szfnz5rMWmmkiDTkj7hAda30dA0GhyEV8CTUcvcdUqTopGXcCaRFFn6CdpH61qyIGnioRc8u/SH8cNW9Jy6n2GpLimNPFR6eGzbEfyYqGECeP+R+IPKoqpGr2wY6mKMIv2N7Ui519ZDIko+WlkzSHbj/WjE8X8sRWjDi1kAP+xYLPSmIbI3KvuZwq1sQ1zw3+CwS9boI7J6C/qE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9540aff-ad98-4d8d-db10-08d6d10a38a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2019 03:31:55.3479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3788
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VXNlIF9fbWF5YmVfdW51c2VkIGZvciBydW50aW1lIFBNIHJlbGF0ZWQgZnVuY3Rpb25zIGluc3Rl
YWQNCm9mICNpZiBDT05GSUdfUE0gdG8gc2ltcGx5IHRoZSBjb2RlLg0KDQpTaWduZWQtb2ZmLWJ5
OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCi0tLQ0KIGRyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtaW14LmMgfCAxMSArKystLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLWlteC5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYw0KaW5kZXggZmQ3MGIx
MS4uYjFiOGI5MyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMNCisr
KyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMNCkBAIC0xMjIwLDggKzEyMjAsNyBAQCBz
dGF0aWMgaW50IGkyY19pbXhfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQog
CXJldHVybiAwOw0KIH0NCiANCi0jaWZkZWYgQ09ORklHX1BNDQotc3RhdGljIGludCBpMmNfaW14
X3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQorc3RhdGljIGludCBfX21heWJl
X3VudXNlZCBpMmNfaW14X3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQogew0K
IAlzdHJ1Y3QgaW14X2kyY19zdHJ1Y3QgKmkyY19pbXggPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsN
CiANCkBAIC0xMjMwLDcgKzEyMjksNyBAQCBzdGF0aWMgaW50IGkyY19pbXhfcnVudGltZV9zdXNw
ZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCiAJcmV0dXJuIDA7DQogfQ0KIA0KLXN0YXRpYyBpbnQg
aTJjX2lteF9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQorc3RhdGljIGludCBf
X21heWJlX3VudXNlZCBpMmNfaW14X3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikN
CiB7DQogCXN0cnVjdCBpbXhfaTJjX3N0cnVjdCAqaTJjX2lteCA9IGRldl9nZXRfZHJ2ZGF0YShk
ZXYpOw0KIAlpbnQgcmV0Ow0KQEAgLTEyNDYsMTcgKzEyNDUsMTMgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkZXZfcG1fb3BzIGkyY19pbXhfcG1fb3BzID0gew0KIAlTRVRfUlVOVElNRV9QTV9PUFMo
aTJjX2lteF9ydW50aW1lX3N1c3BlbmQsDQogCQkJICAgaTJjX2lteF9ydW50aW1lX3Jlc3VtZSwg
TlVMTCkNCiB9Ow0KLSNkZWZpbmUgSTJDX0lNWF9QTV9PUFMgKCZpMmNfaW14X3BtX29wcykNCi0j
ZWxzZQ0KLSNkZWZpbmUgSTJDX0lNWF9QTV9PUFMgTlVMTA0KLSNlbmRpZiAvKiBDT05GSUdfUE0g
Ki8NCiANCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBpMmNfaW14X2RyaXZlciA9IHsN
CiAJLnByb2JlID0gaTJjX2lteF9wcm9iZSwNCiAJLnJlbW92ZSA9IGkyY19pbXhfcmVtb3ZlLA0K
IAkuZHJpdmVyID0gew0KIAkJLm5hbWUgPSBEUklWRVJfTkFNRSwNCi0JCS5wbSA9IEkyQ19JTVhf
UE1fT1BTLA0KKwkJLnBtID0gJmkyY19pbXhfcG1fb3BzLA0KIAkJLm9mX21hdGNoX3RhYmxlID0g
aTJjX2lteF9kdF9pZHMsDQogCX0sDQogCS5pZF90YWJsZSA9IGlteF9pMmNfZGV2dHlwZSwNCi0t
IA0KMi43LjQNCg0K
