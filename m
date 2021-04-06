Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5381C355238
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242196AbhDFLdc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:33:32 -0400
Received: from mail-db8eur05on2047.outbound.protection.outlook.com ([40.107.20.47]:31407
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242215AbhDFLd3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:33:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGK6roFztnWpp3SP83e4ibnhSatJAFJxlD5aiULYRqA7rRWlzwc+koY98r6snZsWkNjRb/qihXMdxEszlr0NDjDexTie4y6kkhfo2X09QqCiSatrAQqiCGDPT+DhnrC3RrVMjm6zu+uzut8trvZeLoaNr27Ak1Qwn0Hrq9bxpOQvwP6UhEbHUFhosdjDrKm409zD05SLQPk+x1ptMNt9SlK8rGz/tZe3Dg32aXPuIL4aqj+kDTY00f67yg0GK4TjIuojIFndbspJAjROm6WVPfP3BcAXkXC7w3ywM2Gnh1V9JIMsFEeoGWiNZV9Zt89CIQ2fJellXIo/wNK2XiFoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSxOxmAX84FNDqMKmQa5ef21e3n7IdvoKnytZEo80co=;
 b=KMPREUUZ/Gqjw/6d6SD9W2pJrf0Qv2M8IULG0qmlUhjkVz+wxBXwZrnxZ43UPKmweiDWT526SE8PslXzC4CTN+qIpopX4ynTrKcWwyW/p6MJAU8pUnGSVVoHP/LlQC8lxFjFjU60jR+FXQ/lW20ceQ/8XLzblyoGyR+o4yL0H/FuPd3jtWbP6r2b7rST4rm/PWgFIiIykGF4ERW1um494Vo5o0j8s7jpPzLv/Wy68wIXQsSeED8+DKtmH4D29GQd/q57ro6ytoXeyA0Gh4LxOvIV6ey7iEnRmjuVtGYlaBFebmy+g8z42GgqP4Z4J6z2cE2xexjQ1M46Ng+w0O07IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSxOxmAX84FNDqMKmQa5ef21e3n7IdvoKnytZEo80co=;
 b=N9QhJvLUj2phxBXEB5yMnfJ5vf7v1uYyUKMo0X9OV7CnjIm4dZ/4uYVS8x9OnmZtyLSTPfeMxI6zWnHWkNFThkqaH+VgbqDCfoRmMJshb7F/DdOLOoowzlsqIMpymqyOsBFMkz4Bmg4Qu83YjiiEstv3UkzskWgEfXDl0VmdjB4=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM6PR0402MB3765.eurprd04.prod.outlook.com (2603:10a6:209:19::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 11:33:18 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:33:18 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 06/18] ARM64: dts: imx8: change i2c irq number to non-combined
Date:   Tue,  6 Apr 2021 19:32:54 +0800
Message-Id: <20210406113306.2633595-7-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:33:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b2e3d9a-0d92-4ee2-83fc-08d8f8efc670
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3765ED5B2F0CA7372DFACCC8F3769@AM6PR0402MB3765.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R2tffQ2gYiquciHYk3fQVkgu9ezHrAVxZ413nif40mByqzHsJyCuv3vzStwDst2gDjAFmLkMAltlKQoyLJUooalpPe9kiqlMPJsFrx9+nAKc6YcGOSTO8o7hHf/hxtyfju1CxXkCBl2DOgkYW5CftWdOeiSfaT/PkwI7uRD0zO7QrYbcSwrvlX9qXNY3i9HgEWDz6rMkm1MeJNftX+FmyxlbcY9+cgt1yTqBXQUDVMIPV5+tpPqqisNr3AQ9a+KY8nUfwYNmzD3I90om5nYaZPgNIwrc+sJIDn0ODVP7NGO4u4rkVw01CSRUEk7sVxBi5/zjFWyIlT9qko7MZcr2myzDlC7MYX99mvHmtnEiKine9fCNJOXkzWFlryEbd4PNklr93pD2mBZ9KgLMN3zriprwgdTfOXSsBTTDAknQ1Bk5NT8I18TczAlUhGKNxpz3ANCYlRNlisCHp5JZKhk2Z5+gTgs8VKNmvfJ2wzUZE0u5WlrOGi0gi/IQEMxg0XNpjzEAQkZz1RucofkA9XBt9W3EDe4mm0SckPQ+4RxAnbAMeljhu6faDufB+fhx5+/dF+6SUORYI7ouG+8A6mcY6cz2Bm/pV2nUN4tiTNwkn43zcop45E26Z4N+ZKKUsUn7EPqsnDVBk/1M42t6YDuaTZGLahfiYDgE8WZ6zTdG/TpbLudaIVeexqDHeqB41D+J3Jbytzn5TcksycQnkmnMPTGBHxUSAdkJoEE/yyIGNgY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(69590400012)(66946007)(36756003)(6666004)(38350700001)(66476007)(66556008)(498600001)(83380400001)(52116002)(1076003)(26005)(38100700001)(4326008)(956004)(16526019)(2616005)(186003)(86362001)(6506007)(6512007)(2906002)(6486002)(8936002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?X7m9M7769DKY9xYtquzEEqlR0WIcCRYq9ER8c+sE73ZZuKZX98Icz+5Wyn/G?=
 =?us-ascii?Q?HvcPBFLkQm08DXdCNRR8+oT6De1JxfszX4s/s/CKzqz4QGxE1VRggj0C4sMP?=
 =?us-ascii?Q?yAX35A5EX9jVMsfBhQjWJVXVMt0Q7auSr8OWpAlFwxWZi2uzcSsbBXGqMxh6?=
 =?us-ascii?Q?pOpU3dbnnuL2hz95FednLQLbRTaxkPFoLv8iJ9oOLLJ9pUM8O/rOdkmQnRoY?=
 =?us-ascii?Q?Qm2AtRwaGPfSb8cGTFAvtMfNRnVT6H5Ja6ufiNLf+Vkd4z+JHHm2M3j2KmJo?=
 =?us-ascii?Q?l60R45tds2YrN293/d+gwlFm3Sluuz9phcWWdAx6UpkPKyUAB2COw3+EJj3+?=
 =?us-ascii?Q?7Z/m7YKQPHqvmzrjOaxPNm71rCKxcuUq+Q8CmM/MxjWv36fDXl+i3xO3f4f8?=
 =?us-ascii?Q?By2XvjGnE3FAN0IqhMpCyaG1B/oWTVzGRlpnquMPxtSSZsq6bXcf4P/ITNuV?=
 =?us-ascii?Q?tmvYd8eClCiseaYRngBFkJxxG5T+NUPiGvBQGTdrCCLzH+5ia3E3cR0gJFf/?=
 =?us-ascii?Q?uy/sSKs8RzE0RZeumiDq1+RUNu6aeOVkIxiqlTXsBQWkX1fJRdN0GDWqVZJk?=
 =?us-ascii?Q?dIQub6N2hx+iE8yc33m3GsdeFvWxv9GZkZNwWyTcyV+AHsQcJmkUiU8+2IuR?=
 =?us-ascii?Q?Lc4Vt6vBSPPJJRpM1+PORBryS05t9tbYulgCP6y/DwtxaKhw0yIXKI3ty2dI?=
 =?us-ascii?Q?bkSPcQISmSc46x9ZguQn+9lwGZuiE09OChpNM5V2y9f+A/cNfEgBFjB5YSLF?=
 =?us-ascii?Q?Zux77PnNY6BJqscnxadNaxUtOPbQvWS2sGWLd920Ylt7mQNGpMY6ILaGi5r2?=
 =?us-ascii?Q?RxKVo/5jnYXkPKCY3rmhDmjYK7pr3uJUSBlhN0r2pUcOPD4iAgNJh4Lr2+cG?=
 =?us-ascii?Q?o3313B3BYHToxlP5fxy+gR7KTGvIUSVCF7+AuG93K2tmCHAsn64w5bngoTG0?=
 =?us-ascii?Q?cD3UMCLRNzDfQYZhYiTzdC9XWrP0dkM+FH+QLhIysofBt2zN4Z/rjSuANSy2?=
 =?us-ascii?Q?zz22tsboNq2YEW0C9e4rAN+EjZfsXnk/P93unthVHi95x2E3fhiJWir34saN?=
 =?us-ascii?Q?4+XHxrjmByHOPFTPdP7Q3N4aI6iZLCLjaBPuZJJ45MCWsGYiBTQ77BTpYqsM?=
 =?us-ascii?Q?fRcuTToAtgiXia8IQITI8yha5bXoydJ2H39cguTFtIg4lo6++AdmMrgwMbXF?=
 =?us-ascii?Q?CdJsM12lw3PTZ3qNyPEDAz0uvHrM/nizII02KPhpX5TnlYtg2Wrhy+yLmqQ5?=
 =?us-ascii?Q?90hGE7YWFAvmxvUUrZOxrJ+5+YgEIRELtAlX/SONQecI1tb3vbBftoPElAOR?=
 =?us-ascii?Q?ghS7KoRc8jb3jQGde5Xps/+W?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2e3d9a-0d92-4ee2-83fc-08d8f8efc670
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:33:18.4649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yc7NzKBFGi4kWC/uhEz6J3KtNx87Oj/eZQwckWB4XCHCXdpYwWupN6jwxJs+D4Xnz1tB6v8swOT0GgBdrPD1gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3765
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Combined interrupt number may cause unexcepted irq event when using DMA
and too many interrupts will be generated.
So change all i2c interrupts number to non-combined for
imx8qxp/8qm/8dxl.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
V2 changes:
 - New patch added in V2
---
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
index b5ed12a06538..9ba57f04859b 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
@@ -110,7 +110,7 @@ uart3_lpcg: clock-controller@5a490000 {
 
 	i2c0: i2c@5a800000 {
 		reg = <0x5a800000 0x4000>;
-		interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-parent = <&gic>;
 		clocks = <&i2c0_lpcg IMX_LPCG_CLK_0>,
 			 <&i2c0_lpcg IMX_LPCG_CLK_4>;
@@ -123,7 +123,7 @@ i2c0: i2c@5a800000 {
 
 	i2c1: i2c@5a810000 {
 		reg = <0x5a810000 0x4000>;
-		interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-parent = <&gic>;
 		clocks = <&i2c1_lpcg IMX_LPCG_CLK_0>,
 			 <&i2c1_lpcg IMX_LPCG_CLK_4>;
@@ -136,7 +136,7 @@ i2c1: i2c@5a810000 {
 
 	i2c2: i2c@5a820000 {
 		reg = <0x5a820000 0x4000>;
-		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-parent = <&gic>;
 		clocks = <&i2c2_lpcg IMX_LPCG_CLK_0>,
 			 <&i2c2_lpcg IMX_LPCG_CLK_4>;
@@ -149,7 +149,7 @@ i2c2: i2c@5a820000 {
 
 	i2c3: i2c@5a830000 {
 		reg = <0x5a830000 0x4000>;
-		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-parent = <&gic>;
 		clocks = <&i2c3_lpcg IMX_LPCG_CLK_0>,
 			 <&i2c3_lpcg IMX_LPCG_CLK_4>;
-- 
2.25.1

