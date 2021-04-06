Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF41835522F
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241948AbhDFLdT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:33:19 -0400
Received: from mail-db8eur05on2046.outbound.protection.outlook.com ([40.107.20.46]:41728
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241914AbhDFLdS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:33:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmSeEbfNtrG+sIUy+khXO3HkfRZOAysmi7ITZm9Ie/PNZr+RUjpVJrw/l09EpfCoLKyjibOSDluHAqB53meFn83bdP2tSZzN6CD3rQQQ/N1ra19Qa/CTqq0Qr8MitfVbi4EJgCG7t6DNDZvBrDs4tdn9TkTuEAUMJ4FTeees/6Zbqqx1ZkOFD4XRhzbx5BItIUpldhwoVwbNic8Uf7zVbAK0/sbQ7jK7xQafLSJbL2gnwKg+Nrg1Bxgy6ropj3fTgjotM69lUe0LYXcWSRNVP7DG/AKyOIulvu59QQFkxVldb5wZ0X3t36oZPIkG/QAZa+W7gScNgVU/+rJo8KU9sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDmJd3VC7BBxTZE9F6tMXQfsFUUGe3M4vt/lcXUnHPQ=;
 b=MpmIFKEiQ7HcRYZsNasO1bHs4Bmg10cfDyRY8b64j7K44GzUw9uXni9L/UnbLhXIaYoL7Gzba003S3a6uLc+vS5LIUo/ye+gyEq7UGUKQnoLkm3//CU3QNoaDMpQb0MO7DYS1qqWFkJ1zXqWr25zAXadWj996KDmZEqNZvvSar2AtQIPYELXJtDaJ8lkyxF7JNmBaQ3def114EtA9H7gzzpdnWxkMfQwmN7ld5Ykjhc1ljjcuubIBpazcu+AnTCis5vanUme/jyRpVXGOhRrW2f1pA371fyP5GX/y2RMkVAVA2AiRnNprLdA0boyWm51668n7iLBP2VBmWB2oZeAfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDmJd3VC7BBxTZE9F6tMXQfsFUUGe3M4vt/lcXUnHPQ=;
 b=O4Wu23s+bkBnF+EfyWV+GvY820QYswYcb0C3BFjYvyzdTsRo1y3Ro/lLPf1JCCLmOnrx7cehD/amccDOXA8BQ7dk84uNXOLuQBXBDsCMuygAmfHAgUJxc4svOocDLJ8yEgpRgk+pAzSW7LRCRtwA2t70LVxxbDOztFI/Gc0VmUw=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM6PR0402MB3765.eurprd04.prod.outlook.com (2603:10a6:209:19::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 11:33:07 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:33:07 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 03/18] ARM: dts: imx7ulp: add the missing lpi2c ipg clock
Date:   Tue,  6 Apr 2021 19:32:51 +0800
Message-Id: <20210406113306.2633595-4-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:33:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c40b359-7833-4682-f9af-08d8f8efbfe6
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3765073748F95EB24A1035FDF3769@AM6PR0402MB3765.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F0oOfq7WxujtCwDAZZmU1zV4HGlYL7udb7IwouRKY0B08l1llwHyYKz3lb63v0AxX1LeEGh7i0Lbd5J+tkPn1J4LZevQH/lonqQiJmB8Pj8k99BKlzucBEcWWnFWjAhHaOGXR3ooUfF2MQHycQvdMZYaasZZYCum72J+O0Oz0OcnAEShYeXBne//cPLTxdFcY4mLw616FzLeSXYu1pWfIEYdPj6EScQOOud179tMWomV0q6BD0waKqWNjLc7kT8lZ2x0jElEqVXzLYkZTObbTDhTxAqpL5JqN94uYJnl7XALpykqY9sBcAmOh9DsTlz5gDxWcTTqaH5fa9sA8KLPkJYFZ/Z4FMeJcy1HDI3WBv8527ehzDL6ADCm+OH7hRMxncjTP1dXHZJia/SdL5RJ/zdWPj4xKbYswHpJMgksQViowvvBHgI69LI8C00N6RoQdh5U2lE7u6mqL4YjkWD79E4Ost+X1sgFQCMWnj7hfJLDss6FVCIYMqIdCdcfcV/yH+oMsOmD3Fg0uUKFJy/QefJJQSfC/+qqzaiy+YcHQeAclBJmsqPpdRkpf/gfVAzoiM4mfxPmILMc98sm1hqOS+S/ipX3tNcL3grwY6P6JGxmJzh87uGkAPs5dlgVzZB9m8x0rzA4wUzjic9UltskQ+FXmn12itGM7M2vgkpkt3QB0Ejfi+dGxDr/GGtRPVJjTjENrjUvs4YxslorG6Qw495YeFXmjZyYEspcmlCmIso=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(69590400012)(66946007)(36756003)(6666004)(38350700001)(66476007)(66556008)(498600001)(83380400001)(52116002)(1076003)(26005)(38100700001)(4326008)(956004)(16526019)(2616005)(186003)(86362001)(6506007)(6512007)(2906002)(6486002)(8936002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QKPlONszad3xmkr4zr3AzUrKCqJwcnCqp9Q1qZms0SSsF4tpwTRR8zrdd6Wh?=
 =?us-ascii?Q?aX5zaH4e11ldOjc9p6b72Dc+IzilBRjI5Thbuidrbfj+15EsIFmnZbrriDnU?=
 =?us-ascii?Q?2VQHlt9XfyptVfgLjvDC2Hxmxj4c9AxbDQxebipmUjGOl4VtpKCO2u1onJRN?=
 =?us-ascii?Q?8PxASjbW98MzaiswHGPaSfTH+3faxnLd/yS8OO05C9xXP1/rHcxmHMxpIJaP?=
 =?us-ascii?Q?C98AVq1Uk6g8qTlShMJYlE19tqZIstHFefNI5VKYbSlkfllYiWRNkweqWz07?=
 =?us-ascii?Q?qMDR6vnUtnTZyzALHPKcZtC17BwfHURFE1mVhOjMxWEz6nJ6E9MrnOKoccox?=
 =?us-ascii?Q?rfB+kqGui/0InwbHb7RTaeg+LDcEybLsXfW11/3YXwrKoNowl1XIezQecCHX?=
 =?us-ascii?Q?WfASTK7DTZro0scABCl4F9uFr6WkUkYUKoc6Bgz+SLqZms7Mfl1dZy8j0vHJ?=
 =?us-ascii?Q?23kskkrxl1aDBg4eLeD+ScPithyTQpeNnTK5yfwzZ17+W2bsh+AgTAdwnAv1?=
 =?us-ascii?Q?f1dJoPjhjqQ0CmG/C0aqV1r0Rc6yM5is7AEC2k+tmpeHB4HDffzdm+AsaqIn?=
 =?us-ascii?Q?qSBEqEq/GQ7tKgs7hIyQHp6DWUFkzPvozOoAC7ftF2nTzP2EAYUliqgD3Vz8?=
 =?us-ascii?Q?CW6PPtHWT9byVlf2l1F5aqTLdWaHXNWhcpNwC/bP61s2CuonBZZISiHFj6uS?=
 =?us-ascii?Q?YFGYT8irljrorVHCbSuEz8NKVJY7W2+vsoRr9lvXb4wiInd0EkCnMT4GO17x?=
 =?us-ascii?Q?a0EW7v/Gpj7fm1CqJ4WFTMD5eFHmaCmu7Oh/Gnl7/qAQjjqw95I7/REfnqEO?=
 =?us-ascii?Q?PK92aObxLzXDfDygHA7BDRjGAiu1YOMmQAHP8wVYAbQdpfhWUBY2p+VvNAOk?=
 =?us-ascii?Q?WbfAB4NsbJO0WR+OXZdB9io8/Y5iSA/yIg64zC7Dpav7xIzItNljCI6/R3NM?=
 =?us-ascii?Q?OPHSw2pZah/aJ4uQPB1gnnC+XYoQZZogKRV9x9FKVFnAScG4ll/+xRXVofCN?=
 =?us-ascii?Q?fPIqxiKJne9WsEvpycWf1OQrk5QM2Alsj7BzGHT/cDYsuBj90KwBa3Mn0ewW?=
 =?us-ascii?Q?S+TwXvxbVzj+suWKY2XvZtPau36scUtsAyGW2nT+BMzfwoLPwa6rRrFs2pYr?=
 =?us-ascii?Q?a2D4WxO/3Xvgwyzeo2fsEShETHeuPlF3ZX638Jq9Inm47WL3m6tcPehg80bt?=
 =?us-ascii?Q?QJB20MfwC3Z3j78NhXeBNj1nQnJE6xflVUw1ZcRpSOTrO/3myNHFVwJMNJcX?=
 =?us-ascii?Q?OZ56fvLMXRTan6aRDit0ArWplPMauqHUty6YSqFyA+7IeKb54SnndiDr45NS?=
 =?us-ascii?Q?GmH9HBVw+JjW23OWJKdOh8jP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c40b359-7833-4682-f9af-08d8f8efbfe6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:33:07.6281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fv/T1t/p9zYA4IRjxfe5f8Rgsy/TrYHNwZyy8XhuNWq/6MZG1H99xFbddvnQp/wy0OtHfq4V8iyVtSoFninWGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3765
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The lpi2c driver has add the missing ipg clock.
So add the ipg clock here for all lpi2c nodes.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
V2 changes:
 - New patch added in V2
---
 arch/arm/boot/dts/imx7ulp.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
index b7ea37ad4e55..eb0d4b8f624d 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -328,8 +328,9 @@ lpi2c6: i2c@40a40000 {
 			compatible = "fsl,imx7ulp-lpi2c";
 			reg = <0x40a40000 0x10000>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&pcc3 IMX7ULP_CLK_LPI2C6>;
-			clock-names = "ipg";
+			clocks = <&pcc3 IMX7ULP_CLK_LPI2C6>,
+				 <&scg1 IMX7ULP_CLK_NIC1_BUS_DIV>;
+			clock-names = "per", "ipg";
 			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPI2C6>;
 			assigned-clock-parents = <&scg1 IMX7ULP_CLK_FIRC>;
 			assigned-clock-rates = <48000000>;
@@ -340,8 +341,9 @@ lpi2c7: i2c@40a50000 {
 			compatible = "fsl,imx7ulp-lpi2c";
 			reg = <0x40a50000 0x10000>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&pcc3 IMX7ULP_CLK_LPI2C7>;
-			clock-names = "ipg";
+			clocks = <&pcc3 IMX7ULP_CLK_LPI2C7>,
+				 <&scg1 IMX7ULP_CLK_NIC1_BUS_DIV>;
+			clock-names = "per", "ipg";
 			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPI2C7>;
 			assigned-clock-parents = <&scg1 IMX7ULP_CLK_FIRC>;
 			assigned-clock-rates = <48000000>;
-- 
2.25.1

