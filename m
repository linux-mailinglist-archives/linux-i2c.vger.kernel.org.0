Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40A78116AD8
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2019 11:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbfLIKUF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Dec 2019 05:20:05 -0500
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:6607 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727323AbfLIKUF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Dec 2019 05:20:05 -0500
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: yhpV37COFhMrt3KK9xOEDDViX6AMx6r1MYQ+m6UpIdMgNREiI13bzPe0LhyU6uD6C/ieNbTfuB
 aPuKDfBo6zwgKYB/PD+9dHlWiohPARjGlmuCWkuEhVxmdOpJcjcbbKqPoZbOQbSWrUPO3RrLpI
 guOduqs0TmcDBjrN2H46a6hX9zXpmg/eQQRbibFTX/PVC33Vb+H6yl99ayXk7nCg3CQ/Z468/+
 nR6uAz4CBGNJkrcBzvOdwwQE4j7VTt25SnKb9HUofKpdRBxCzY/dpToowzxBmYabOwXPob39kv
 xL0=
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="59168076"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Dec 2019 03:20:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 9 Dec 2019 03:20:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 9 Dec 2019 03:20:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxRHAQOST+GHZvAkaYHbAZ+wgEBD5DfufkrMrai9FldjY05/IQ5kt9xoOdmE6UN0bU0W3valozbtRHNgoPhahPPROFPqg1J+yRq+2q6Hca0WXUVbRAGppqOZ4lNqb4HqptsEkTMuYAhxj/55CuHcHmB1sSobceynWU67FN6i5cwcqFUbpHsEm5HJVYPFisqDrEPHu69iBFja1snaL8FRbdHgqiEj2C4oNFkib5ZeafOJsHkZBXxNmeIX2fdBDTmq5WWfpa4PKywcz2AZa949ThI1RSzz3Cw5EWOkmlKXiCWuipy4dOTSPrMzCz9cVgstMu+K2DhjgCuQ4VtCsoxllw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtpFv3LhHPv4VihpWYxrp5LpBYUd8R8XogVd2F9+dQQ=;
 b=QFQpkeKpsmdpEVexs191jwPx5BxE2O2NsPejKQaCj7dnTN3Ydeh25KR+EdHaA5PezArSKSn7kCWJvukRQ+8Q2NBN/nA8i9yVP/4ud7bulDfheI1D85aebYVW4K2wETJSCrxIPUHtsYzfQiWxQNcmSga0JEXinOHABV82/nVlkI5onwxAiGzV0lqYFWEcZWw/I3FE4Kxa9Gm4d928IK3qy3wGITR+l18+Obv1gAW9uHQ1raVFheS8Y7+FSJGkxMZj7+XW7yiiadqLdZiebcSv5Lm6E7YXJDyKxUmOHkcy2oBMrVWIRqjN4kdyIEFCa/BgJAMypXeVxgmAk1nf59jlPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtpFv3LhHPv4VihpWYxrp5LpBYUd8R8XogVd2F9+dQQ=;
 b=Lw8kcgyF8m6L+wCJRtnN3HeGev4uwGkIZzr5Ig7Q4aDPFlnSFnPjkXHnA2tiOzF2xiLVxHp+wZDJ4NKlzUsBqDk5ZfUYZNb9J8ulJridIpVKlRu0XVGITiIUsf2AJY5QPn3M84TrLVc1LlTSyOWbEyq8WXlZMZgn8X63hyP7cJ0=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1884.namprd11.prod.outlook.com (10.175.91.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.17; Mon, 9 Dec 2019 10:20:02 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::9039:e0e8:9032:20c1]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::9039:e0e8:9032:20c1%12]) with mapi id 15.20.2516.018; Mon, 9 Dec 2019
 10:20:02 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh@kernel.org>, <Ludovic.Desroches@microchip.com>,
        <wsa@the-dreams.de>
CC:     <peda@axentia.se>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <Codrin.Ciubotariu@microchip.com>,
        <Eugen.Hristev@microchip.com>
Subject: [PATCH v3 2/4] i2c: at91: fix clk_offset for sam9x60
Thread-Topic: [PATCH v3 2/4] i2c: at91: fix clk_offset for sam9x60
Thread-Index: AQHVrno3b8eARagF1kiSyPsN52C7IA==
Date:   Mon, 9 Dec 2019 10:20:02 +0000
Message-ID: <1575886763-19089-2-git-send-email-eugen.hristev@microchip.com>
References: <1575886763-19089-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1575886763-19089-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0039.eurprd02.prod.outlook.com
 (2603:10a6:208:d2::16) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb203426-4e0c-45b7-e939-08d77c915a30
x-ms-traffictypediagnostic: DM5PR11MB1884:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1884907812F7AE3BE0745E82E8580@DM5PR11MB1884.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:494;
x-forefront-prvs: 02462830BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(396003)(366004)(39860400002)(136003)(189003)(199004)(54906003)(110136005)(36756003)(186003)(2616005)(26005)(2906002)(316002)(6506007)(478600001)(6512007)(107886003)(64756008)(66556008)(66946007)(8676002)(81166006)(81156014)(71190400001)(5660300002)(71200400001)(8936002)(4326008)(6486002)(66446008)(52116002)(305945005)(66476007)(86362001)(138113003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1884;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t81O5k58HymEh2N6VZxlMir0HzHQK0AXYNCRes42E/Us39COLWQE1SJVhsC5Lmw5Bp9ZkJhhGx092jPSlG0Y3ZTjcpCh7PYtNmlVm2pZAm1k8GTJTpqQBTe44FB2trjWq2bK8vRjGO07Z4CMBuSqbJFKrQP5z98Rp0BNXfzvI9ul5XGOfOPV1afkwOW4WfPu/5gS0Hz5nL0slbLgf3Z9Rnc7cRWjMkOE7gdIY6CauA+pSQQNBoF7g7G6prAaB6w01gO7gOffYpfY7B9drUpWFVUAlWYuhd/6kL5ThxwN5mFnlEHDh+bQij2NXqsjF6hBlMTMd1o99cLSNZYHn7zPdA3CUjhRpiWgk8yT9mN+4bmX5VPsgVUj/QUeR9cdDiAC2lCvEwoYLuGCzNlae0Xxn5LU0QyQX91l7Iad2ikXObxkm/qzvfco/dIducn41MoMWXmW+yaNOqYrljgJK2kRgxApoxWVVG3ScZH6A6eJnsKHirEy3n3BNoYGOyR7rP2t
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fb203426-4e0c-45b7-e939-08d77c915a30
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2019 10:20:02.4769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wb803SjrBRjPbatgu9+iwhecEjW7UETJGmM9sDAEJnHxQJ2MhCKEK9GrrDgFKPZNfSsv245Dbma2S78TG8yM44loCtowPhm3IkR/z1mUpCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1884
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

In SAM9X60 datasheet, FLEX_TWI_CWGR register description mentions clock
offset of 3 cycles (compared to 4 in eg. SAMA5D3).
This is the same offset as in SAMA5D2.

Fixes: b00277923743 ("i2c: at91: add new platform support for sam9x60")
Suggested-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
Changes in v3:
- fixed typo in commit description

Changes in v2:
- Sorry, wrong subject line. Modified to SAM9X60 .


 drivers/i2c/busses/i2c-at91-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at=
91-core.c
index e13af48..5137e62 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -174,7 +174,7 @@ static struct at91_twi_pdata sama5d2_config =3D {
=20
 static struct at91_twi_pdata sam9x60_config =3D {
 	.clk_max_div =3D 7,
-	.clk_offset =3D 4,
+	.clk_offset =3D 3,
 	.has_unre_flag =3D true,
 	.has_alt_cmd =3D true,
 	.has_hold_field =3D true,
--=20
2.7.4

