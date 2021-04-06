Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B1A355256
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245664AbhDFLeu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:34:50 -0400
Received: from mail-vi1eur05on2043.outbound.protection.outlook.com ([40.107.21.43]:5955
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245678AbhDFLeM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:34:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=baJT+MsGQd+eHq6VPgh8qXM/krMS6LlntswvlDDLjaCwzDKi9jW9HydH+vHmGHXDWmnuvtnQCdmEkrwHpnlsY2xprBsaxV5nJDXCq0tuNKwCJVYrNjuVb3iHH36b0VkYqCc2gDLwZ3/JMs9phhECRyqzQxzma/fRgff+KnEMtU65DMmF5tJi6ZiaY5iLkCbMIwZt/x0WD/pA1C6CHmqxmCFOHeHdv/3w6y7O83kx431epr4nw1Y/qZvb5E4NZG/rfqEI19kuEh8Pldj8iUf3Sw7cjFlunzRHGAbVTrW4OgNwCYGuh+DbVXiYKFqFZcQK8tCFR1VoKjjBFjLwdQNzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IhdC5K9KRswvsw0bEREtNYb2zNFz2R22TVQ/JhFVvQ=;
 b=LMhfZrHU2iLH6kEcYOtoaKgdsZed9lgNPFZaOdB85irxy/z2gb5y1kDzcjPj5rk2LwG0EbyJtucDWBZ84ZWhGBJ9oCg0eEB3j7nnGM488hPj/pX6B7KdWFYKN6gHSzT7I15H2PO2GeXDW9Bp4BIg0FdQ41fvzbDXSxei+FykhRo/vgLtj99djN3xBABIC6hEr/PmJnLzro3YT0juhibBRhsI8iQb/RUcx3f1nKlAFGuzEsgD6V7oKrQe5vpiXH2T+m6i9UvJKIFo5WqzoKaz7NXsyXYE5/rsl+gU67mGYrX7boQ/1K5q8jZ3ntVGDvAUy+0EfTqc/4jGgPeFJR+kEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IhdC5K9KRswvsw0bEREtNYb2zNFz2R22TVQ/JhFVvQ=;
 b=Qt70oEpvC8VWjY5CT3dHEu/0Agk5fqzypKVO3voyL3tI0cNxZugiXg9qnTE54s7tNvaDLrpVa1x2TulDl6KZaWNIApVp85iZ/d5WQeBOIm5xHgIVGj2luN0SR4ggWw9/OoTCu6Xu3kYORb/+29B7Y9U7rzuc0fIh1TVuNHH60ik=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AS8PR04MB8359.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 11:33:55 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:33:55 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 16/18] ARM: dts: imx7ulp: add dma configurations for lpi2c
Date:   Tue,  6 Apr 2021 19:33:04 +0800
Message-Id: <20210406113306.2633595-17-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR0401CA0010.apcprd04.prod.outlook.com
 (2603:1096:202:2::20) To AM6PR04MB5623.eurprd04.prod.outlook.com
 (2603:10a6:20b:a9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:33:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f2eaab2-a24e-4ec9-67c9-08d8f8efdc3f
X-MS-TrafficTypeDiagnostic: AS8PR04MB8359:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB8359681F90FE253EAFFCB3B0F3769@AS8PR04MB8359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 54jdds3LhWW7caCOoJrQCtWDxC6JzoCGQKIYsVLtwOWCGd0RKZztOvSvjqJALKiHWA4C1vYSxyQwPHr5Th++ZMa7tQspemfjcynhtnle3raoI9oIxzJDK0Qer3CKotHI3BfghdGMvPT02Osh19yCMda5OiPt1p2RydDrcbSQSlQUdCLq3WuYfPRAMfuvvWoWF74K/2PZlTfMN9W6u3PM/VbbutmY9nUZxfVufkNDnRb5LvIKWgrN63x2Ui63k5kf1Gu/0/LdKTBcZML5zD1PFnr4Kh6b0lYBBP5kVh5/1JZZ9YnDKCJo6NaVI3wqEA2JYenQReny6dI9ggiwDNpnVVyivv/qV4U+LFMHyEsb/eynur5Lckqz17CaSo1nB1YVB1/SXolkxF97LNIi8v49ARFasGYFS6CTEPxX/3vkEwZrPTVNfXM8hv7XIIChUvIqCO3MqlTy2OCp6L7p71DO5aDJEQvLVRNICvXavcE1SA3aGenU7ES4cMkH22TgkdNzb2KawFKxqnxJ0lt/q0sTaFi9VbbeoYE3Ebqz2jjhWkzcozjedmC/j+tPig/5A0A5ek7IUkvC0iLe8tvY+p77W7vpPXOFAmnaY3Rdwd2j3aQAHAXKgXYXVaSD+jHnU5PSrvFr/WjoCBOB6x+9ZH9K8brq8Gywb9zWtZuSWgbc19YVvO032KkVwzCnNbWBS4Eytwth+SEOVnyWxSXha3BdNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(5660300002)(8676002)(16526019)(86362001)(4326008)(8936002)(6506007)(52116002)(26005)(38350700001)(69590400012)(6666004)(186003)(83380400001)(2906002)(38100700001)(956004)(2616005)(36756003)(66476007)(6512007)(66946007)(66556008)(1076003)(498600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hEvTdSNWDuceGA7B5hK0CHpr11eiVBSwJ+v7ZmZP9rW0xACMrZszEI11H8VT?=
 =?us-ascii?Q?12bCKOvyBByc4g0YV0+uRB4xeI+eP+QgFmukS4UAnbUu96mG4MXA037xoLUp?=
 =?us-ascii?Q?wUKCiZcZghBrfXGgkADwRQbK0kDdzr7s7KtQcXEzzfatWOFTWXk0A5z/c6Ef?=
 =?us-ascii?Q?+dQdJocMBzZ7Vfq4jNFORX+eMYkF0bBG8g5ZMvoqXYhivld1TN8dIwQcZUG1?=
 =?us-ascii?Q?o3gemtlSGGFNXGab0gSD00iogLc8GsSu7qPF0lfqeq9Q7ueg3sAokzWKTWJg?=
 =?us-ascii?Q?BfPWa+b4wCjCnwElUQznSuFF03GPEQ65qPMRzZBwtuJ+pnTrkiXdxoMFc9+a?=
 =?us-ascii?Q?IwZdLp8NXlqYCarw2RUCbkVj2SFXHDbBXA8nJAXNE8cDzGcb90gep111ct3d?=
 =?us-ascii?Q?x3E8fXpPFNYpg3a34gNUubUm9DBn87qIVQEta6hp0BylbNj35voBkYcD2l7P?=
 =?us-ascii?Q?7KSxmeB7H4AjcGizdfcnMTTqJ/jPEqej+Ye+4G5fCWLdCGXJMNG6AWF1nHbi?=
 =?us-ascii?Q?yWJCbX29ZnR+aocvDbor0N218fy1ahV7yaa06Aiuubi3uxzflMxvhj7ue6qo?=
 =?us-ascii?Q?pfMVHUID/+1BgSbPQ9goWNI5QbrWlburZdccGdR0J9n5gpXUx/qOROUGm4hX?=
 =?us-ascii?Q?NJoi0G/qEheXUF3KPM63Zqr631UXFEb934USNiyEMaPj1N8fKaR0nqchrg6s?=
 =?us-ascii?Q?r+lxUmcBBViPinhgGrax0AZAHAZSp5T0uRyVLTJMCUCjnj1+FW6RjAOf05JC?=
 =?us-ascii?Q?Yybnlx6vZ2HvuQhkQWSO4csGJw5TtoW+NgIuC6MbyOH+U/UrAZf/8zAXn2Wx?=
 =?us-ascii?Q?x1DbV6iSgGphghuvxdkI/dhrIsVZiC6xiNE0XYGLBl7DxeL/NWubZHYa+lJZ?=
 =?us-ascii?Q?OUwt1dWAij15+eV/SCTzYHB+FBadUI0Mh0JoYm+3vXknNdLYlOZGvQsh8t44?=
 =?us-ascii?Q?vAtC8+PXFXqnzNd8UKrzqle8HCpSSkvVpXHO5joYTLT3NhHRLIZpuLEUgdEE?=
 =?us-ascii?Q?ug9RgLYXXzfF0EsVxpkGI+vjdDcFLJp0tX2UA4bKU7wNImqqaPaM+eXGaBRH?=
 =?us-ascii?Q?x1Ik08UOqG5C+rIe5eJ5LX2GTZF6/aukJRxcz675x3w8dcwWmLJu4bKE3Q/s?=
 =?us-ascii?Q?JtYYbFM/wyjbFRFd3t4AYNS70UmsPrUNf3kR76F2/Xpr0aJ5d77Io+zMwIJs?=
 =?us-ascii?Q?AlXhWKlDXcs/PpBCG4jChcfwaKBlzuvRYw3bTLVwV+El9tpa2PLzITFNx8LV?=
 =?us-ascii?Q?BCAveFs2YSFOrGpgWXXnmsfd//QVQtJKWqmrQlU33Pc3ZkVrY2+BdvNY/Mc2?=
 =?us-ascii?Q?LTYmFn2y7e8SeChNisD2ruGh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2eaab2-a24e-4ec9-67c9-08d8f8efdc3f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:33:55.0799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+K3AUYmFYjAFRsDhrXwnxWhPJwDjPXEEScaF9tLoszufxJY8RUpqJ6StwBksvQHm5R72qmRcXmReQ80qUmNSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8359
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enable dma support for all lpi2c nodes.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
V2 changes:
 - New patch added in V2
---
 arch/arm/boot/dts/imx7ulp.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
index 0c51fa79c0bc..a6681836ca05 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -157,6 +157,8 @@ lpi2c4: lpi2c4@402b0000 {
 			assigned-clocks = <&pcc2 IMX7ULP_CLK_LPI2C4>;
 			assigned-clock-parents = <&scg1 IMX7ULP_CLK_FIRC>;
 			assigned-clock-rates = <48000000>;
+			dmas = <&edma1 0 10>, <&edma1 0 9>;
+			dma-names = "tx","rx";
 			status = "disabled";
 		};
 
@@ -170,6 +172,8 @@ lpi2c5: lpi2c5@402c0000 {
 			assigned-clocks = <&pcc2 IMX7ULP_CLK_LPI2C5>;
 			assigned-clock-parents = <&scg1 IMX7ULP_CLK_FIRC>;
 			assigned-clock-rates = <48000000>;
+			dmas = <&edma1 0 12>, <&edma1 0 11>;
+			dma-names = "tx","rx";
 		};
 
 		lpuart4: serial@402d0000 {
@@ -361,6 +365,8 @@ lpi2c6: i2c@40a40000 {
 			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPI2C6>;
 			assigned-clock-parents = <&scg1 IMX7ULP_CLK_FIRC>;
 			assigned-clock-rates = <48000000>;
+			dmas = <&edma1 0 14>, <&edma1 0 13>;
+			dma-names = "tx","rx";
 			status = "disabled";
 		};
 
@@ -374,6 +380,8 @@ lpi2c7: i2c@40a50000 {
 			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPI2C7>;
 			assigned-clock-parents = <&scg1 IMX7ULP_CLK_FIRC>;
 			assigned-clock-rates = <48000000>;
+			dmas = <&edma1 0 16>, <&edma1 0 15>;
+			dma-names = "tx","rx";
 			status = "disabled";
 		};
 
-- 
2.25.1

