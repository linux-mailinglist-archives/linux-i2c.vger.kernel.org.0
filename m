Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB8A2C2BE
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 11:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbfE1JIZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 05:08:25 -0400
Received: from mail-eopbgr80137.outbound.protection.outlook.com ([40.107.8.137]:4251
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727316AbfE1JIZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 May 2019 05:08:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kN87VIoQZ9y099/DYTx7GMrop617DnqR9XvXArui6ec=;
 b=Ga4tTORZwC3yPJQHSKmAsmQV1y+OFlt5BUtnat0COUZBVCfqa3JVbPUDI65igqP4mz2eE8Cuj0TZFvGIpvk6FCtsAt4F3pB6YJs/o2M5QDtwvhqQq9sEiKDq/pAOCOTY1345DYh8ekfyt/diMXeUt7C7KlCX0XpyyAWw2rNmz3E=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB4250.eurprd07.prod.outlook.com (20.176.166.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.10; Tue, 28 May 2019 09:08:21 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::d9d:d6d7:1e49:a316]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::d9d:d6d7:1e49:a316%3]) with mapi id 15.20.1943.015; Tue, 28 May 2019
 09:08:21 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: [PATCH] hwmon: pmbus: protect read-modify-write with lock
Thread-Topic: [PATCH] hwmon: pmbus: protect read-modify-write with lock
Thread-Index: AQHVFTTlNgEhk1J/hUaHnYTTiQ8+FA==
Date:   Tue, 28 May 2019 09:08:21 +0000
Message-ID: <20190528090746.GA31184@localhost.localdomain>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0701CA0079.eurprd07.prod.outlook.com
 (2603:10a6:3:64::23) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.32.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f07689c8-a65b-4c00-e856-08d6e34c07d2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:HE1PR07MB4250;
x-ms-traffictypediagnostic: HE1PR07MB4250:
x-microsoft-antispam-prvs: <HE1PR07MB4250356454D24B27DED82005EF1E0@HE1PR07MB4250.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(346002)(396003)(366004)(136003)(189003)(199004)(14454004)(6436002)(68736007)(4326008)(508600001)(61506002)(6116002)(73956011)(6512007)(9686003)(66476007)(66556008)(64756008)(66446008)(25786009)(66946007)(33656002)(53936002)(3846002)(256004)(14444005)(71190400001)(71200400001)(66066001)(86362001)(2906002)(52116002)(7736002)(99286004)(1076003)(6916009)(186003)(26005)(102836004)(386003)(316002)(6486002)(305945005)(6506007)(8936002)(8676002)(81156014)(81166006)(5660300002)(54906003)(486006)(476003);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB4250;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rDC2uIWCk1dmLgwF9YFxDgKO0QktPlHOfHpKpiEQGCpgRQFnl8Vfw1MKpGfpthAgvwT87V1mqyk5x9CVHPS/yj6Ej9lOrkUG87x4ZLnx/asaHFE49nZ2/vB3x41freCEOf8nK44mUuZbQMskjNBVRdzZQ3t8xPToi+34tHBFsCOqhaVzPvO9qZ7DWCZtDt3UWHxL/SD2qYxmogmdBit58A94dwSCh+hWU0uMmLGWSdBMhQAgbYMLfLttFVXv51oANFIN58Xkd1h/qMnVmtVQ0uwKnLBcycMd1gRUoh2fbiV0ibI7iFI7VCfSVfkJxf+sv566HpnFhOj2z5OOLrzwZncZEpvh7xbRCU9OJ3PLpb2f4bwq4bS5wZzSNrqMEnDyJQ+QgrrpbVfDAnu7dj10UvCfcLwDXcN9cJnhu+51cck=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3E7B0680287AFA4E9AFE88ABE2A0BAC9@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f07689c8-a65b-4c00-e856-08d6e34c07d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 09:08:21.3182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krzysztof.adamski@nokia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB4250
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The operation done in the pmbus_update_fan() function is a
read-modify-write operation but it lacks any kind of lock protection
which may cause problems if run more than once simultaneously. This
patch uses an existing update_lock mutex to fix this problem.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_c=
ore.c
index ef7ee90ee785..94adbede7912 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -268,6 +268,7 @@ int pmbus_update_fan(struct i2c_client *client, int pag=
e, int id,
 	int rv;
 	u8 to;
=20
+	mutex_lock(&data->update_lock);
 	from =3D pmbus_read_byte_data(client, page,
 				    pmbus_fan_config_registers[id]);
 	if (from < 0)
@@ -278,11 +279,15 @@ int pmbus_update_fan(struct i2c_client *client, int p=
age, int id,
 		rv =3D pmbus_write_byte_data(client, page,
 					   pmbus_fan_config_registers[id], to);
 		if (rv < 0)
-			return rv;
+			goto out;
 	}
=20
-	return _pmbus_write_word_data(client, page,
-				      pmbus_fan_command_registers[id], command);
+	rv =3D _pmbus_write_word_data(client, page,
+				    pmbus_fan_command_registers[id], command);
+
+out:
+	mutex_lock(&data->update_lock);
+	return rv;
 }
 EXPORT_SYMBOL_GPL(pmbus_update_fan);
=20
--=20
2.20.1

