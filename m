Return-Path: <linux-i2c+bounces-5912-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7D8964016
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 11:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96B4F2857A9
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1530218E357;
	Thu, 29 Aug 2024 09:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XxO+z55c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010023.outbound.protection.outlook.com [52.101.69.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CE718E34D;
	Thu, 29 Aug 2024 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923723; cv=fail; b=bwvSfm2LOWuUlUB16Y4EVw/0M3FLy7P9vgm7iG8ep99qFDQErohlpQIDTkJnBwPmWhFUaHnDH6RFHPMHjkWaMV7ZaZO3KzTE5aMkZufPy2EiaFjwCKxCMzT7wewTkuBEPObl29CT8Bdp22wJrGk+G2Nze2aEbgbndeRu/F0CWSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923723; c=relaxed/simple;
	bh=BkhTk65pCQkTQFdWubyi1rY65faJtRr2eA3HFLYkpb0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b4tSkuyJEJ5/fM2/RPIa4l+Qclu3f4hOTsWEn7/lK96rQPTfeyJKeoGv92U/OtwFW0QPixb2cItwn8uv0VoOqF6w9M9+JAbe6GV22A3+3mOKzmGcG9yp0iOs+oujiV9TGLBmLTu/+tmj9Uin2XONleUzpb0h9Bq1mF9csSd0QAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XxO+z55c; arc=fail smtp.client-ip=52.101.69.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUC6/i6NhHWiiuDxZXQRzMsuCBjzIsJLLf3KHdTdfzgvN8Stfl9+cUekiPX85fqlQJjh6w1rU5v7cxMfLGvhC5ctoyC/4hgas9ctgmR/wwZgABrMtLwnAMbJ2/9xN8VnvdC4DV/TWa+Jwu8Tz8RnecfPSDpMeOfhkl0DOTeZIyDHWLzbSCyO3tvPn19s54d3fEjLGOb+TS3+nlJsM73dH/uEd5EaQTZQRIac6LgnTiwDJj3IZIZaYeVwCXehtvci30ovpQsYyKmtnf3vZY+CIp+62i839rP6853DGGc/KoLF9BW+ID9wY+yC2UQGVD1yIFUC2NDoVzYqd5TzkaEq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gp4GgA7Mm7Oj0qc0hxDX/KF5Sbz3oN80xvpa7T0203s=;
 b=sdWbneVsHWBX76rG4jp7m4YEz1C3DRueubPHjsqoe5gVGM5hRcYaNZComD6O1WLA+sbJqe0io1DLgem6S11uO8+Az6DOkleFgP+NyNmWZI2f0k1szQMKUDXeS5BpOnDIM/dvXpjX9d8/LZj6FtPL4K1NTv/Sb4JYwKg7SK2lDW4uIEenVL0d7GZ02gT9C1YD4VZSSNA33ttnHj7Clm7yacc+kUxlvvXq5M32YWPiXLNPfmKf3O/q/hVYe2bAVPU3mi7KYZWMhe1hLgXM5vSUMxlMcnarw2Ttk11Bmw/heQF4utobdM8r4D9RcbNWZ1uFjIRjUu+slvuTHAQhwK2qfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gp4GgA7Mm7Oj0qc0hxDX/KF5Sbz3oN80xvpa7T0203s=;
 b=XxO+z55cUdAvgrmGvfgAMgzWFfSSHnOqE5UacrWaf4ymWJ/K6aqEGGr1znDq0cOhgToo65PspqxlVkyqvMM2JRgwWnCyKWg6H9oJDeRCnvtJosHoqMk6/JU3+Fx9yBEFrnaR38jMUNP4QgsAqFuOi+hWrX0MlO4OFN+Ls0aS9urSTIkdGLWSW314aGPZkTvatdeHYT4i5kTkOt1wl9FChOjJMWOGtvXnfJkYrq6QzJRNZPsg6Uel85SA87jq6pvs1pKQpKA259RaNzcE5e6RUqDjK1s9QaDsJUXmDiFJlc9O+uORhQtae4cyzHyQGRzGCeXb+h0L0bVW25gCAYiGyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AM7PR04MB6902.eurprd04.prod.outlook.com (2603:10a6:20b:107::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 09:28:39 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb%4]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 09:28:39 +0000
From: carlos.song@nxp.com
To: aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] i2c: imx-lpi2c: improve i2c driver probe priority
Date: Thu, 29 Aug 2024 17:37:21 +0800
Message-Id: <20240829093722.2714921-4-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829093722.2714921-1-carlos.song@nxp.com>
References: <20240829093722.2714921-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR10CA0023.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::15) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|AM7PR04MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c61b6fa-469b-4ed6-3f47-08dcc80cf73d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UIXbePhVHwPYyczxYKOZmS6Y4naa5BFNn6ZJ4JKi0veuql/jXdawnLUkOLVf?=
 =?us-ascii?Q?VwHMOhO8jN/v2c8OAhGyPQM5qSepjEbRwLrTf/KnmRtG7ECC/TQwouA6lxwy?=
 =?us-ascii?Q?1UDoFGJVAhxxDKwINQoR+KECrC7mTJb4+zSP6Y3+uy3ReP60l3i6qp6y2V3M?=
 =?us-ascii?Q?JaunZuDPvX4uJg/Dnek/a9sLgMkQQdW1boZ7FurfNVczX5mpjo1XYpwFXTFE?=
 =?us-ascii?Q?PBwahCNq37uujkU5dI3L2CU1QZlqHgBM0D0tjWj2nTrDYeNpGMV8yHeFcmK6?=
 =?us-ascii?Q?deqGMnz3soavqPDT6SLGlRzdk1k103mTR9LE+4IgEZbDz1Ma/eEynAD67+ij?=
 =?us-ascii?Q?MHG7V+F+4lrm/tqeDHrElBKvUulpA61qoh2Qr3DgKE+FGUpbRJ5rEDILHGPK?=
 =?us-ascii?Q?oJR7RA9OcVAv6nUDtRPbq+UlUFRwagBAFar1VdN7Ca7zgPw5b4Wy6ZtNQ9rw?=
 =?us-ascii?Q?apTI2/Co/ubBytbrOwKUAsFUiFam48gSst9hFFQSBqAVErIOz50+LAjgxCD8?=
 =?us-ascii?Q?o7eQqW4tLumJhUjucH6W2uaEcoIINW0lWZRm4FJKpN7Ydat4IxbPoSCo+q0v?=
 =?us-ascii?Q?rPAfBYfzMQlCH0uWO6dhOKGfKxJXylr6A/Iq8hB4sOQU+FRTGotxXdfCtF9d?=
 =?us-ascii?Q?3c5qxaVOjaNFBvVXNv9cHe0mhz0bSSkBjXSq7QsW58pmpLBiV7GW0Xypirco?=
 =?us-ascii?Q?euUEcmS/z9voeh5mZKyWgTzdlu4LPx6ghxB1ocX6bG8QN6ZiFPf5xP8jBqJO?=
 =?us-ascii?Q?9MqhKvNeLYrYmDFrzclQDQGItKkjCMkvn7wDDD4AUASdXTocSxmw2aYbHzhi?=
 =?us-ascii?Q?HXhymH0IOLUKT0kBNEej5oU/OS2UfCKFvjUmcMotkr44SLvmnxr6EG8H3OpQ?=
 =?us-ascii?Q?o4jd21fkeBXm5K4/KU76F34q0C/nQlgodaNq+x8Y1yh84Ebwlf4rFZi1Ue0U?=
 =?us-ascii?Q?CJFhkNYcaN+AIfGujbwb+F2unyPt20374lce54It1kis19By0B/IvwONMcAN?=
 =?us-ascii?Q?nPMufUazDVh0XqVBiGXCUT+3iSUs2zh6F5LyGsQN2TwhEZpQiiOcw3ql6+uo?=
 =?us-ascii?Q?H/+pUVWa02QkRLwgTOHXCj119viq1YX2iwRfz9Ovi2jaCga9wvrCwchjjM0T?=
 =?us-ascii?Q?xCT3TSJMkcQDS/sPhcQr6hVq/Dn0srKX/Tqgrcz2oyE562EmTftzSYsJXqN1?=
 =?us-ascii?Q?3VglMJG2grbd6oIOVUhNPrhYTJ3TDEd4ytDl8+W6DyJkiFj03vLOpnn06vq7?=
 =?us-ascii?Q?jgmESq5oyc6/S/XnpkP/LHDj6MOHM7WtqxfuptVwML6ze8cLM6DxwtlgBu9r?=
 =?us-ascii?Q?52yRqAPSnrZ6vVZK3mRMj7s9r1oUuH6CEKqmYI8zgV4ss37bfW/l71rwZjie?=
 =?us-ascii?Q?g8AJUEt2mfxMcMvSzcF/UDUbigUyJ+pU70sZwmEvl0pTfztL4w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JcLkTcNB/VNLNUd18jCjAz4kT4QPjGAnIXt/HdNmlR1yabbA6r3FVul47bXa?=
 =?us-ascii?Q?DnPNpiQmxw0I6HuwjwYbcJ6Ii54Y4CiUr9xDDzDhhr9Uw/7sxR1aJ4EDEsn7?=
 =?us-ascii?Q?xQfw1hw/Pw3WnL+/b1K2Dt5m7BQzIez2ljHAHCeBFyT01ndifHU8TpxaYT6s?=
 =?us-ascii?Q?VwRZ7pgRpOeek3HQKYdduipfMwdeSejdajI12QF3jFVLL7bJK6v3hvFtJvzD?=
 =?us-ascii?Q?IUmOI0Hw/lxLqxr7exKZA9joYv3ZhFiOpTV9NlTNkDKBisprvAyE3nBZASnR?=
 =?us-ascii?Q?KGs1WpaoRmmQV3cmUbEb3WHMUk0F9S+GlRoYAud8IxZsWDjqI7/daxFCjzPW?=
 =?us-ascii?Q?tmyKvOEhbNGw/ZSJUcW6Fx4bU2sMH5pWAGGwtGIPwXwQzqSSb6+alO55K2Ff?=
 =?us-ascii?Q?RzEjWqSyK8t8R0UJUoSvoG/nglIW329V7qnw2cMSivc1sg+DvnE/KkW9n8Ur?=
 =?us-ascii?Q?5ihu5TQqSDyCY/ddoyRdW9iZVSTKks+Y/3BLqJy8VWeUv9wuAjzSC1ZWujRB?=
 =?us-ascii?Q?yu0T9zlriqluQ5Y8VDJo4Qjp9s1E25BvZyhT7FX97u2Za0dTSQQluzJbxtr/?=
 =?us-ascii?Q?7mv4QzTV5oAOwPR/Z0r6Gh0F2h+vwcnotTSl4PBOVxYCjwHN8eA7NcsprL4N?=
 =?us-ascii?Q?W4cUFakYRZo/i0ttnhUe+7d+WYvaXa2C6Qicj2322gZmC/SWs3rNEvg2tt9z?=
 =?us-ascii?Q?JMZJQrbjDNBXD8jbB7Zw5SP3TYYAV8rKDFKhT6i0JVAzJRawAXrW9Z49nlI5?=
 =?us-ascii?Q?3YidqJwz3Mlix3GTtEKZeMPuGuM1Ind6MoC1JSXOTdBvktxu1B4Wq9+gsbz3?=
 =?us-ascii?Q?G3mER0Yl/yHaRrM92f0171KQD3tqi4CV6aWojRZ7gEiSUHTbQ5zYWVI6GYAv?=
 =?us-ascii?Q?OqciCcNjqK4RUfnLOP6O1Iwoe99lAI3Cr+zXObCy7B21TU085ronjNKYiFwu?=
 =?us-ascii?Q?qupw4PHX1GbiIeh91XaYXJJeuOkdtTOUgPI32cyTJFdEpXO8/4xtl5RVaWZ4?=
 =?us-ascii?Q?DDRkZwj62HONIZ30F+OufWIyGe18QZRtMkjrppTCYCBHmV2aha5LEkRl4whP?=
 =?us-ascii?Q?hTWvvEMbghw5PHW0qha/uDPcYjz2shE9z+JqLxDx2rjhDKKtqn8DRDE+1gyn?=
 =?us-ascii?Q?fECcEQks2CIAhIX8hW415F1S2VxI7PQKsS7mquR1VteLQ6KLWDtEuNzyZZpS?=
 =?us-ascii?Q?7qYyqNWuhkGQ/FcsJnsuY/37E6VsLQ7EDsJhrQiknMHmj0okjYArZrXQlQBj?=
 =?us-ascii?Q?ktQA0SPxYJfVjV0EOBsNrjKXjYWsJCh2aEIr31Yu2dSOpmdyZPF6y2CkltmE?=
 =?us-ascii?Q?R1ewhaxKAWPjQRZQwSE+W0SSOgKDHtKuflv7Vg0hzWcumyoIAOq5uoflNPdA?=
 =?us-ascii?Q?5hzEPvGpxdWhI4X1h5T3CMG6wOdxWodC+Ar+tw0a4BlNQKWnHRvM85LO3m0V?=
 =?us-ascii?Q?48lOIlabMOwx8W3WzOiVTG7HTzZnKsBdLU7g9WTCAdImforpRC5ZVT4T9BPt?=
 =?us-ascii?Q?Gs5JbrlKLszTJV6DgHBv8rUrn+sWG/hc8Kd1pW986BMriSDaOnnc4Fe1SUgy?=
 =?us-ascii?Q?d27DHocZGART9Wta1wmTV91P7StVzRcD3FAi9HXn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c61b6fa-469b-4ed6-3f47-08dcc80cf73d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 09:28:39.6759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7uNAV4SlP84LoQqvLlinpJnTTeqlplqQJMOpF5lvGEdubVNDAI5Ci4JSEl2OEEKEuMKG0g4VgqQRGP1zBPUdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6902

From: Carlos Song <carlos.song@nxp.com>

Some i2c devices such as PMICs need i2c bus available early.
Use subsys_initcall to improve i2c driver probe priority.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 0159ade235ef..210d505db76d 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -1487,7 +1487,17 @@ static struct platform_driver lpi2c_imx_driver = {
 	},
 };
 
-module_platform_driver(lpi2c_imx_driver);
+static int __init lpi2c_imx_init(void)
+{
+	return platform_driver_register(&lpi2c_imx_driver);
+}
+subsys_initcall(lpi2c_imx_init);
+
+static void __exit lpi2c_imx_exit(void)
+{
+	platform_driver_unregister(&lpi2c_imx_driver);
+}
+module_exit(lpi2c_imx_exit);
 
 MODULE_AUTHOR("Gao Pan <pandy.gao@nxp.com>");
 MODULE_DESCRIPTION("I2C adapter driver for LPI2C bus");
-- 
2.34.1


