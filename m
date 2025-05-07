Return-Path: <linux-i2c+bounces-10862-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BF1AADC65
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 12:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D0EE4A69F7
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 10:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E37C20F09B;
	Wed,  7 May 2025 10:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZMrtiwCy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2079.outbound.protection.outlook.com [40.107.249.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2536F17E4
	for <linux-i2c@vger.kernel.org>; Wed,  7 May 2025 10:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613521; cv=fail; b=F0+4wJIFQk2ZuRa4rNEgWf87YNs7B+huZdbIX/WMFVLsgKHw7kDAlgwVOh98cKSH7+uPFCFe3aOePCdAPobVYdj8llexK59kkQtPFNMwEvOnKZmY4em2xAQXus6paSuJawSTzTyi1jrAjSJzZl53wK/CoF+3u7Q2fb28Jncsilk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613521; c=relaxed/simple;
	bh=ozEPgFogBnDWtLi0Eshh1wIkKfdFBzhGHREz9k9hq7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=O9Jt36aZBD+cTjYTHvBKNf/wUG5AHUUckDJrE/L2OyayaGGSCmWRg8TYxx0kqKoQJ/IIi2gLbpg0dFH2J57AuasbyWMeeKBXusuMqtW9rkP1iaONFoxGErZ92nCeFDjWL9eBSVdJKwix2X41hPuRYnlO4oRdM7Qo3/7c7qZv3A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZMrtiwCy; arc=fail smtp.client-ip=40.107.249.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agROxhKs/NybyQ0zAobvFKJ0fTYXBEgsZLEGf8CUgvBQpTX9fl30a+vbtkHB9oSHATS1EusFGCorcxJeQOmOaLKSgTf3cUpvPE7EtHVZupcPLMEnKiBwV52VHbs4swMJKSqt3Ysdooh557Nk731vZFNTp2NVBYWR7RiAQSKnrrKxxbnU+PwfmaG72cjDuNpnjHqP7EChvdwLMRg3USKtDtPY+l+Wiwvawfm8GGzJMecoqAtvgNGHCsWZwxc8358mDjwlqqRvEoZlUTO9N0gOMzLq2hmvhpSqRa6M+lY8nZHLUhne3OwprGL+iestYMGolHDDrrGyn9BAB8UeHpiKrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsB5WKeJy2Zcc2e8lFlQ93r6EIOrYvc+nS40g7lvJ8Q=;
 b=Ik6w68nAHvzSKkYhOLWD5UafOMV6x1pZYZvJCB7/Yq0cRQIlADoKc9H5z1VJ02mEZnSe7WJN629MLzF3uNdk+5x6sOXX+l8wK6JEKaWudWcsozkgBTKOvIl+NYCrs9NUKLBMN8B/CSCl4dK452HHoljmsgrEYGQq9/QWgGPFSbf5dqhkNXISdsf4KgtGt4iSdHjEyFvSaM/GSujzUqIV+1dO6YaGyd4gGPolEanpsGw6TmC5YIay6vYRfrY9UNuqK2qP9mC+ClMBP+KZLU8P1Oakumej099RQzBC11sAoA+Vs3e4gWhtPR3ALchuQjSoYt3fCEpoJFCxFaO/hignWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsB5WKeJy2Zcc2e8lFlQ93r6EIOrYvc+nS40g7lvJ8Q=;
 b=ZMrtiwCyPgkYEDo7OHcZs+b/+sORDWDc3FFLCeecPMVw2id7W6CCSXmTUoi8Z+TlzEa2HgG6k4unFqPfGuX34yEC+t7Nn0N5ufX3s7blAPqlQhMJcK5yKYZba/HSa1XahmVkpdheGdnEHypBL/cNg+3IUpo77SMqnHImLU2I6wr8Efokz9FkQc+6rrKnJ9foNFTL2epxbjI7nJCGiQkvXgRCo7wyJRQaTS4JuWvUmwJw0/B5OIbvOpbKBOAhF0hd5G3neqQhzGWsd5jGdatfcnBsFPE3XKHudxPZnwu3FRHwu1hNXc72yg+UVCQOe76vkwNWaOhyhPf2mMET5fczVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7817.eurprd04.prod.outlook.com (2603:10a6:10:1ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 10:25:16 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 10:25:16 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] i2c: core: add useful info when defer probe
Date: Wed,  7 May 2025 18:27:14 +0800
Message-Id: <20250507102714.3535412-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::16) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: 07651309-4b22-48ce-3119-08dd8d51757b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lwM/HEB1SXCkTffG2x5W542UglMSuTFWk6caVNgMvJpKu+KDp84BN/V/JS7J?=
 =?us-ascii?Q?nOzJNkkKIubJ3ZXHrqb/EClX9eVuWtA7x1WpCNuuh5GgkJaJiuTrY+ufxLQY?=
 =?us-ascii?Q?5lDgtgFip6GdyV1TxJf61YlB9nIH7JgUUU8s1nvkHkP5FxyzuwTAvV2otL0s?=
 =?us-ascii?Q?3+oCNBfqQx7d8mpZGwkSHxvOY0cZ6qvqDKuN+XLBjuzI1Y6VNgmk/g8Wdr71?=
 =?us-ascii?Q?bWTgr7jEc8UWfmEWVDG/+CnEEuXtrelZ+5qhjk5jxB89rnTZGB+rUchtytWE?=
 =?us-ascii?Q?s7wDufCAYiohvmMRnqWIgX49Ypy/5xUbbhXofjnOIuwRxCwr3vbxj2tGLgic?=
 =?us-ascii?Q?FtUZXPP7mqM45oiXTZKdvvGG4fHnswkY3gWZs5R1RTUUFmy8qf/oFXGHaUt+?=
 =?us-ascii?Q?Oe/T37OAB0WzKPjFOlxUl/dos2vrDyCPTKRwOnN5c/RiqU4X35AUVFKrQyPM?=
 =?us-ascii?Q?JoR5gMaehBJWZUuXbVZUlGzRayFkUyiZGkha4rpgYZJQylXI7yO3jskTupKZ?=
 =?us-ascii?Q?mXDXLdMHQ5RAtc2UMwdmi9uu3p04CgjNo9eI1pwjbKPdTpeRCD30dZ47ezNp?=
 =?us-ascii?Q?ldEYZ5Xocr8N09i9lam24WlzR5I+1xzdnZPNcSj/5hyv92Lf5SWO6AAnxif5?=
 =?us-ascii?Q?Lyr+pG85/ybMGz2RJiOcBg6mI/ghQHfFJkJ2ON4UJlrYSblV4kM7vn98IpIx?=
 =?us-ascii?Q?0dsjpej7/DJkznqcHNIgVdYhm85H63x2KEEcpIzOCz/HxpowNB6EFawfd/eC?=
 =?us-ascii?Q?iRs5CcFzdsn25Azp6LFzCC46JglcoC7ln337Y89mobB0srDDZaRhd9zSsNZq?=
 =?us-ascii?Q?sh/nSsGIqgV0JbNN/hk0qzHWUxGPzuYAi0e+DuDoK1rmqskFjPCWOGUZ3ODM?=
 =?us-ascii?Q?UTjFnGPTlT4pzVrPOOifDcgnBD8s0HDWIOR+9fcUTQg9UOB68qWD0p/d4izn?=
 =?us-ascii?Q?KKKeclrkh2Am11XsrSCL4ZGTNalvT8DHbq+c/XZo6S+tT0BwcwCn3ytW6DdR?=
 =?us-ascii?Q?i4aNTYJhURYPi/xlDE6CxdQ6UnMUXXJUoYJFTYW6oAfa6DmON47rNup8eg+W?=
 =?us-ascii?Q?nNEpXU1gOwTGRm0nPswNYY/lhI8nURMgA+YQoDPjU5dsZ5Kkwfjcjgj52Fvo?=
 =?us-ascii?Q?B74CAQ60rc4TybSd1EyfJAukW4VSLX1rcZdjjc7CKvRl3EehcPRsP5o3+ZMS?=
 =?us-ascii?Q?RS+XhSmtS0EqrdxYoCZh4RQ9s9zvmUEPjMZ2bEQBvwIxSMB6g5l0vo918oKI?=
 =?us-ascii?Q?CON+N9uKcx9QBSU9cXqbEeZ2hQpRz74MrGc5LuNz5bDRLOwKUTeAGjAkcFWM?=
 =?us-ascii?Q?YjIrn8+aeWjWqFS/HLX/PYHMFXxkZqq/Y+P3ekepGkU1VD7/BRdqnr180BxB?=
 =?us-ascii?Q?X3mD75PylsH6sp3JNUjnuuf+FhjLM95Z2U31hE3imLA/T5AqllDhmkIXC50+?=
 =?us-ascii?Q?PlsN68quvw2LmMxCj94H/fL41W5RtMLOCPD+/dQ98FIIYSabKnD/JA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NasnpTDAadX9LuaTrm2kLObMV0RLCUaRd8vGbqKCATshK0C223kBDJUrOV3p?=
 =?us-ascii?Q?KxEzYQusY5UbcLj9HYOTPfvCES/bqew/Y7hmAKS6fPDsQqLvYGTdTVanHXg9?=
 =?us-ascii?Q?BaeQVQoiv0mOZMcHwt+l7biFu6BuuHZPU27MMJtYQv+bCfJxnDVnZzhai8Bl?=
 =?us-ascii?Q?cCh5LL4zLDTD10SP851q6WbhTOJAdhK3AkuB0lb3pkNTxkZzZMbu03IcZYCR?=
 =?us-ascii?Q?cIcqQExfuBSVS9WLA3Eq4ucLXa5n3CrKsRG8wv8crlSSdD6Xz1omnMFy0V4G?=
 =?us-ascii?Q?OpcbeRmJHa2ypwYpcC7hEZPoDk5asUxBJjV8Y6sJpZz4Tnxd0rgzbXTKofWs?=
 =?us-ascii?Q?v4ZkX6LRowBgdHWRiMr4S07jwh3YL7HXOtSKwuphD3HblFBdB76i3QpQNgd2?=
 =?us-ascii?Q?rIBpnB2O92BafhP6GovFYDxqgijhn4eW9H7QxMEpfemOZ65rSvFEhiV2EFhv?=
 =?us-ascii?Q?1Mjl3OxgNzzQVC8/P00qUNQhoJBy+jKCEddTrHSqXS9WZOu7CqELIOCRScEM?=
 =?us-ascii?Q?thdVrbp4jyQGrunbu7jzTKHC0WFXYcdNgJRO3a+JPDcyaHdBol17orePYmRC?=
 =?us-ascii?Q?M2bfwm/UaLxd/Cg+c1W3joipLlcTWUw2dTs5mSUtNw03ywClOa9qfmrQGE8s?=
 =?us-ascii?Q?jBuAC7wyjc8q0ri9QR8UaIEOtruEkfiBwTylTw5ayNw0mYLGjeRAcAvmq2qJ?=
 =?us-ascii?Q?U3/jEgbgIPlvvelMQFCYAYI41IE0rhYtUg78+IOeisTBsardpQmJTtsVKr3I?=
 =?us-ascii?Q?HeoWI1eHVkPfw8npAJskQfBUPmqJ5wZmbn5wHbc9s5BS3T5XoE82MVTxACH7?=
 =?us-ascii?Q?0CgLsDJnekdCae4gVg5HvLyW6DEOiZu+Giw6nIAXXvbhfWC306Y7L4o49IzJ?=
 =?us-ascii?Q?b94N9ibf5IxW7CV06ugErCVMS8Co0J735EQGvmkeoBMWhbE3w4mTsaKvxIRu?=
 =?us-ascii?Q?2kn5ojJXZREDSmCsqUUevdsqT/XDtV70HLom2NNeTdVj3GvGufprvScTP7RF?=
 =?us-ascii?Q?WDVAeut0BxwjIwDawtd38XSNVFO6qgSWdL+YDGeuA7EVzlGAfohW4nxvauWE?=
 =?us-ascii?Q?ChvWHQ7gRQDpmSgIDlAE/b7fXvNopESFeVifONwfh2Oxxw3vjLJemGqFvV/o?=
 =?us-ascii?Q?4HS6POSM0a5Ctrq7ke/TlSES4j4cUbK9PYjCkeWkUQe1yIhWrjrqXXWC0KZe?=
 =?us-ascii?Q?3icasxK4vcT0dmHCjUFBVwHCZZM3vtWpyvkR46WxiMCdVI/WTTIQcJqlJZc7?=
 =?us-ascii?Q?s7cfT8Or05qRrf0XbjAdk7KyozBlEFcKtKaiydcjbqet7f2zJ8aHK9N27Ms6?=
 =?us-ascii?Q?RrPLtA+QNqIU5NYe4eCcCNSv+PDZFEfcqRm52kpcwWG3QZw1+uNbXuxD2/I5?=
 =?us-ascii?Q?4c7oudQEodpCz5lObaITA+1LG+ICbqrEcnhZa+Aruo158AJ0Rqs3bBIfxEIk?=
 =?us-ascii?Q?VBUZyqPeIbM/IAXlkO18J44uftXeHx6wPTvQQcLjUaAMMpPmG9yMQ5c+BAtF?=
 =?us-ascii?Q?ITpIHAzfCoceCGptN4HGZeo2YipuCS/LnIwvgHslC3mI1r1r63u5oBOYn6DE?=
 =?us-ascii?Q?tZkZ1NBzq+DP6N9pYoJxUTM2bCOHZFkxBWeVaf7N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07651309-4b22-48ce-3119-08dd8d51757b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 10:25:16.2722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+My6QZwM838Lg1lTb2ocCVUT293tTtP2SzKC5WgkiRYq2Xq6m3irbEkpRyET4P42LRynQpCWBhvACVCsqnDUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7817

Add an useful info when failed to get irq/wakeirq due to -EPROBE_DEFER.

Before:
[   15.737361] i2c 2-0050: deferred probe pending: (reason unknown)

After:
[   15.816295] i2c 2-0050: deferred probe pending: tcpci: can't get irq

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/i2c/i2c-core-base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index dc3c60a7d382..32ffd12bff9f 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -520,7 +520,7 @@ static int i2c_device_probe(struct device *dev)
 				client->flags |= I2C_CLIENT_WAKE;
 		}
 		if (irq == -EPROBE_DEFER) {
-			status = irq;
+			status = dev_err_probe(dev, irq, "can't get irq\n");
 			goto put_sync_adapter;
 		}
 
@@ -548,7 +548,7 @@ static int i2c_device_probe(struct device *dev)
 
 		wakeirq = fwnode_irq_get_byname(fwnode, "wakeup");
 		if (wakeirq == -EPROBE_DEFER) {
-			status = wakeirq;
+			status = dev_err_probe(dev, wakeirq, "can't get wakeirq\n");
 			goto put_sync_adapter;
 		}
 
-- 
2.34.1


