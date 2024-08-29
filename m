Return-Path: <linux-i2c+bounces-5911-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA536964014
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 11:30:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E314285271
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A31B18E341;
	Thu, 29 Aug 2024 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Kr5RGD+A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010023.outbound.protection.outlook.com [52.101.69.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C735F18E05C;
	Thu, 29 Aug 2024 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923721; cv=fail; b=ZbuumyyHQYrgO8bRE7w4fQmV3/PyYZK3QY/nAPStMVt94dLnOksVFaDPidDgQtjijn82DhGt/syI5vfHb6B81OqLRi8DNLCJTGrIFCJNtaRNLIC6UWO4QwhT920/jfUjQJC7mP9iRBG4Gsd0Woxl/ZTu1Na8weyYhsLEAbBC0RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923721; c=relaxed/simple;
	bh=mhgQ5OmbHC6kPoFxwNzvH8P7CCMbvdoAf/q7al2TaUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DIafHb7dho++F467KsU5Wv9qrTVHziYWVkQ4L+2VtTrssCAhI9q7+k+96G2q5MkVAdzkIJ0DlIATu+IS2hvMIkXJDNvbU9StbTTAT84GbKISxMuRLs4v2V4IeE7rZs2iMtIFg1UN0346g08gY+U5B0h4geBuUOz/brr8ur3z9HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Kr5RGD+A; arc=fail smtp.client-ip=52.101.69.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgM9DXuBs9C+CjaVMNE3632rELAXy/R6sed+pzhiqnVyjMCrQTIwrg5kuDzhQD+JYtwb8cVZpiTkf/TpYnQ46FYgxKwyBrbhcKXZn3s2l1KE5+34FREJGkKHmUoxeB3pqh8+IQ6wG9DSxU6rMS04k3bBbALN80QNA2ojYpGHonR1r6SFgKcktYpLECJT6breq4HqMzzRP4/LoxD3RvZNT7p+iXQAfSRP5rFFd9E/REaNpWrZN7qqdrTtsz0d0WL/Bsu6joIYg+cPmu7AjCjvttTX3ib2co9O+DWLLOxxgd5IA38DTdYz2+P6UzFytajpX0K6ZjkA542ngT6HHKMhjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5FxjuNdReSAUurDwXC3fYfUz5iT8OSKubT84fjG1pI=;
 b=H8d+05bHz22vCFzv54BYR0tll9WJkCxb3+1lI7X8oejP+rfsoLZdTc1wWOOU3eC1tlLfcHU9Dj98ULPiM16xhw7JXYnPRR0y6Yx1qMH5B4S6j6zjr5vaoM8XwuvlfVLfvAnDFX3YobH7875egJ5D48sbzrrp2ZXP5fIpp0CpJR8luLw0lpkJB9JtuWIKtVNOCldlzq1bOvJYkDY5NcC7uGjUU2K0zFj/sJpPDjpQVemhfjVRTId4DTv0w8GR1d/cv64w37cUa9YB+lRG9LFZFfdUkQi53CP7D/Am6c3D+01UZtilNCJ6tORGuHTL8uyvGbU/7/ClC58gCskcBViOxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5FxjuNdReSAUurDwXC3fYfUz5iT8OSKubT84fjG1pI=;
 b=Kr5RGD+AH4R0nPtbvZ+FwplwmrqThbnm3AvmKyE/SBggg1aczczk25thuJesTbKEuO1WdLyyvM49O1zIeTomRoYLqgMREBO6xOYeeG+2mckdyi5z/p4j5JueRDQB9zQmuJqVANLdsDsWEJeCn1Ve+wkDOqWrC6sG8oI4nEVYXRWJguXmuzTr1DjRDE+XPkElzafvXAjVtCOOamUAd+1mB35MfaZgScnAbQ52nBecHRpELnwNXNzlxM5xgZWpOKh598cZ9ZjyH6eJggulIJ2DdvxL4UnylO5rDAnYBSDRQsa199XrE6KYeZs56GSEW6Zh/AYyVM8hPpijpwaSVBGcDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AM7PR04MB6902.eurprd04.prod.outlook.com (2603:10a6:20b:107::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 09:28:37 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb%4]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 09:28:35 +0000
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
Subject: [PATCH 3/5] i2c: imx-lpi2c: manage IRQ request/release in runtime pm
Date: Thu, 29 Aug 2024 17:37:20 +0800
Message-Id: <20240829093722.2714921-3-carlos.song@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1eee1842-8981-4bc0-954f-08dcc80cf49d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rxSe3Y8WZPP52qOj4K+yY39Kn4umjS5XDmABj+iri0E0cHXO/lZCqQxOk/uA?=
 =?us-ascii?Q?DoSGeuU+Ncn5ktJCKVjGp8IP7wXM1ogaMYuv+2UNepRu+xpzwrZBYyp3OZYN?=
 =?us-ascii?Q?bb7YXfWGEscftSWpLJHSyXaAPQNjFSq5FEY8KxJtYZqvkx4yMxmZLv0Pw31b?=
 =?us-ascii?Q?IiND3fCq3f4lvojwGfq9jQHTMN5HQPfeyz0baMbCQVct9YbTRo2Abjq4aZiX?=
 =?us-ascii?Q?TEjCaIKhHKdcEGKo04+o4/8TYxhl84VcuH7PCfsYi0zbbMufkjadVD3Up4PB?=
 =?us-ascii?Q?MOLf5IdhleLln2H3hkr3Z0nhYj3+sAoGARBoGDV2smyOKmcdQWYEQlACMoZ1?=
 =?us-ascii?Q?OuHCDhfoY41WFvc/5V5kzMCj1yZ00cmGGT9Yau0F0Z3tbsa14qdt7KfMS3A9?=
 =?us-ascii?Q?cabh/5muVa16CZzx1TlmgO2j3IfxPXfgFz2K7mlRTZfJAlwUvGhIXqDmKsOX?=
 =?us-ascii?Q?kBT4jpoSrs5NoI2+V7D3nlSiQLOiPUwz3C7OA+42DoLqF0dul2uyszbdI0CI?=
 =?us-ascii?Q?AEXMlWkmHOAZrvA/VqtR630zIP3/WWe1W6Z2gkcqZrSHdq/dq746aisdAeGh?=
 =?us-ascii?Q?zb7eoV/qGHulPOp8VcVk/nV1aeIVJ0Nn1CmVAsMRTue7tFaFpOvobs/GYZwP?=
 =?us-ascii?Q?r4f2bAczCF1bxQNcyb7oOmVOVfCBHiett4o3SYcpRPdx5ZJIVKP2/aelSaco?=
 =?us-ascii?Q?ptLAT/Mo9Pv+dPN1cq8ybqnwzX7D5aUNeGi9LrdYwrIwxYZVhjzjeb6/ZsPz?=
 =?us-ascii?Q?uoJVq+GvatsqCX4OE1cNLtJWMuip/DRg1UFbaYoNhI6uerMrdcUV0D+IEqkZ?=
 =?us-ascii?Q?9fQQItXckSc5JR97R/VY/sIjYC61MP0v9QyS1CbhsF0gCJ3XJRo+QgnAXSdY?=
 =?us-ascii?Q?7hMVyaSjvYH0qfkaT7AjQ5UA1yHntVHLLTlWNRDivOyWADGF0u+t4PdYfXbD?=
 =?us-ascii?Q?FFpvNDZUdkITpRBJA00oBxQhZd+2LLkT8WSfYKBe6MgjEwujURVuv1UFZx6q?=
 =?us-ascii?Q?cHqNwvOj9toltiFbVuywac88KT4+nr+9VfgDO5nHPet5JbNQqcJYCDGshBlq?=
 =?us-ascii?Q?boGiRwthHsvXFldeZRmajBWQ2MvdJul50Qz3rrEDccM1ZcvcpBin5HW9ViM2?=
 =?us-ascii?Q?je1RIl3pT2T5R4dKTmKBeCqP65XrAAopGoxlP1rdQJ0nnr7HETuM3/iiJ09W?=
 =?us-ascii?Q?mVVN3yfHUDMrWXMTrv3glNl+6QX6Ce1CntBwhS4UFjjlE/aEl/6VghzKwGwk?=
 =?us-ascii?Q?frqHHzAwj4ovGuHGg6gIqBhIxNHoLD5KIQ0iKGBQeAmUrEPatRVWtDi8vO7T?=
 =?us-ascii?Q?B4P8sVPD77GU9OCL14kCmZ8S5er/vaOnvxTOQ7Nsf0AIaQ36jkcXcSelx7TO?=
 =?us-ascii?Q?7S0wlC+HHB6v8Ud/J9DlY0STpdVf1grdXdjco+WT48egB3Dntw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x5lt/ebbq34h+K+lu1vpm5bJ3/bX9ynacLBQ/CLmS/p8q3rRf1zo7j3fLY20?=
 =?us-ascii?Q?U1iBm4dHeYKB4ZycaL/tBvS2aC+7vS3iEae/ZwkqpLErh/FH9TNEH4ujosky?=
 =?us-ascii?Q?DFfNEbcKgk6hWvjWJsmWQA0Qc+XtjfKLdKs5y6GIqxBB7JEcM/ws+IYFrsb3?=
 =?us-ascii?Q?0kGXEtPQ5vAwsfMCNnK4lXpG4qQoH2BmoUUYVMGGgLDyGX6xSXNp/3+jKQqp?=
 =?us-ascii?Q?PvkJDqgt2WqlcGkbcNCrmS0PG3SxviVZoP6tsf/cNlIhp8PaQuB9oTXygIY8?=
 =?us-ascii?Q?SBRzLFaHa0+WYl+VLN6BjiuQ1BTgPaOo2Mvh0cf0wZZPExsPUMutC/qrC4b2?=
 =?us-ascii?Q?M6JlRK+XTHzPU0cDziBQUG3AqQkRdnH1Hmb8u461VtCaYh7nt3f7q9jECtlb?=
 =?us-ascii?Q?9a0uTr5uUaI4GE9zzIemBsxykH7bGoBT365EG3VDhtEsxfUYRWtuBryVNwo3?=
 =?us-ascii?Q?FT17c+ycWfOwcZ1gPcU92onj31luZZNdybTWiB1hO7ZO71acCzkxGoLu6t2U?=
 =?us-ascii?Q?3m+yreZtzKhXhrMHc0xFr5OChexs5w9cwX8KRkGCbIw2Ezn1pZ0YjFSrgxHP?=
 =?us-ascii?Q?SpGh1OmNejnjVbLI5hSRQFESwsTg/phzM3OX3xyM7ONspjUWhRQ8igWc1h4R?=
 =?us-ascii?Q?CFJB/GR7iqsu7eEJEfY0pozkOhrbLfVmJswXMzjPKufNtp6wI95Q38+lbH00?=
 =?us-ascii?Q?gX030hmgKKv9KcikHF3fDu3l2IftnCb/DjNnLVLFh9BRtOXdjH996jOxW5RS?=
 =?us-ascii?Q?xmBnKnisr1jrM6bQVW40AMc9mUGBg7cf3TcnyFyxJY6Q2W2rBb/5tKViJhu5?=
 =?us-ascii?Q?94Oi7RP34FZ7K19lpadKZBz9X07SpAnzgjtXRe2cFAh42/1Sb0MrD+dzhGoU?=
 =?us-ascii?Q?+SOBpkm/aj4CXdHJspyC8k5Uf1DVu5DoBatoNesMXk5fmOFOX6mGXeeGQtbY?=
 =?us-ascii?Q?/pnG86D0darZ3pQmpsr7135Y1K/ggfr9mVNH6MwxzAfAZQEL7ETENnPI3naW?=
 =?us-ascii?Q?GqPRsGtDYJPCBaikW3rJEPmjl5ut7IvnHD4Aqh8esOzzXqEgUodn74yJ95vo?=
 =?us-ascii?Q?RNhEgYAUJclULkvy0an99Py7dG0Jmeq3QM8UJU3q9JBBZ/Nrxe4J+Se1rqpf?=
 =?us-ascii?Q?9/B/C7a7VgIhYmuk7K+yh2DoAtIjMRSKESMCmpXg6hDcvxI+tLhArB5uw+1c?=
 =?us-ascii?Q?vJkPV6iPtIO8K2gpexZxxNTv7W5nJS1NTDpS8Ue8yndsNUTcrhaYM34zYDCe?=
 =?us-ascii?Q?0X3wi/tZ3ocNU9cl+f5WLSqKAXexXK1Z3CuVdzwcGVFJw5xLbcCippPVV8kO?=
 =?us-ascii?Q?4lEucrLnqizf/cEq67WdVFjCDsdLloocGMX4XsibwJe4wl3fku8j8HrMXfat?=
 =?us-ascii?Q?p+DzxVQqe7CGRZrK14LkgF7GRs9XYnHKwHchlPd+gJeyQyMDpLHV3FoOlTGy?=
 =?us-ascii?Q?jI/O7DNlODlWVvAlTD0WexdvFE9U/W4JWmEEgUHoLldUVw++nb4evqVVQ8aW?=
 =?us-ascii?Q?Hp3HCS83SjNEC1EGR7+LLJH8W3nxX/xVAiSMC1xfZvJjHZhezcRZcsLZgTHO?=
 =?us-ascii?Q?U/4mPetPV6NckahU9c+udf+33ACZPDE9yIntszst?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eee1842-8981-4bc0-954f-08dcc80cf49d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 09:28:35.3736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVEEQhC+lMGSXQQ0BiEy5SUQG4mEjsQysNiKGwEvg8+23eer/BBsauLHAIopBu59rj5AlHQcxqbMW9Uh2ktw4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6902

From: Carlos Song <carlos.song@nxp.com>

Request the parent interrupt during runtime resume and release the
parent interrupt dunring runtime suspend for allowing the parent
interrupt controller to enter runtime suspend if there are no active
users.

No visible impact if the parent controller is the GIC, but it has
significant power savings for parent IRQ controllers like IRQSteer
inside a subsystem on i.MX8 SoCs. Releasing the parent IRQ provides
an opportunity for the subsystem to enter suspend states if there are
no active users.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 40 ++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 23f83f10d5f6..0159ade235ef 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -168,6 +168,7 @@ struct lpi2c_imx_struct {
 	struct i2c_adapter	adapter;
 	int			num_clks;
 	struct clk_bulk_data	*clks;
+	int			irq;
 	void __iomem		*base;
 	__u8			*rx_buf;
 	__u8			*tx_buf;
@@ -1252,6 +1253,27 @@ static int lpi2c_dma_init(struct device *dev, dma_addr_t phy_addr)
 	return ret;
 }
 
+static int lpi2c_manage_irq_handler(struct lpi2c_imx_struct *lpi2c_imx, bool enable)
+{
+	int ret;
+
+	if (enable) {
+		ret = devm_request_irq(lpi2c_imx->adapter.dev.parent, lpi2c_imx->irq,
+				   lpi2c_imx_isr, IRQF_NO_SUSPEND,
+				   dev_name(lpi2c_imx->adapter.dev.parent),
+				   lpi2c_imx);
+		if (ret) {
+			dev_err(lpi2c_imx->adapter.dev.parent, "can't claim irq %d\n",
+				   lpi2c_imx->irq);
+			return ret;
+		}
+	} else {
+		devm_free_irq(lpi2c_imx->adapter.dev.parent, lpi2c_imx->irq, lpi2c_imx);
+	}
+
+	return 0;
+}
+
 static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
@@ -1277,7 +1299,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	struct resource *res;
 	dma_addr_t phy_addr;
 	unsigned int temp;
-	int irq, ret;
+	int ret;
 
 	lpi2c_imx = devm_kzalloc(&pdev->dev, sizeof(*lpi2c_imx), GFP_KERNEL);
 	if (!lpi2c_imx)
@@ -1287,9 +1309,9 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (IS_ERR(lpi2c_imx->base))
 		return PTR_ERR(lpi2c_imx->base);
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	lpi2c_imx->irq = platform_get_irq(pdev, 0);
+	if (lpi2c_imx->irq < 0)
+		return lpi2c_imx->irq;
 
 	lpi2c_imx->adapter.owner	= THIS_MODULE;
 	lpi2c_imx->adapter.algo		= &lpi2c_imx_algo;
@@ -1309,10 +1331,9 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret)
 		lpi2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
 
-	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, IRQF_NO_SUSPEND,
-			       pdev->name, lpi2c_imx);
+	ret = lpi2c_manage_irq_handler(lpi2c_imx, true);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "can't claim irq %d\n", irq);
+		return ret;
 
 	i2c_set_adapdata(&lpi2c_imx->adapter, lpi2c_imx);
 	platform_set_drvdata(pdev, lpi2c_imx);
@@ -1392,6 +1413,7 @@ static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
 
+	lpi2c_manage_irq_handler(lpi2c_imx, false);
 	clk_bulk_disable(lpi2c_imx->num_clks, lpi2c_imx->clks);
 	pinctrl_pm_select_sleep_state(dev);
 
@@ -1410,6 +1432,10 @@ static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	ret = lpi2c_manage_irq_handler(lpi2c_imx, true);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-- 
2.34.1


