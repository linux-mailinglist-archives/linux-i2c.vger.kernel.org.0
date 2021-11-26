Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E1845E8C3
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 08:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359519AbhKZHru (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Nov 2021 02:47:50 -0500
Received: from mail-eopbgr80041.outbound.protection.outlook.com ([40.107.8.41]:42727
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1359342AbhKZHpu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Nov 2021 02:45:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8m+JVy6j5wKSUGYN0YOq1ujLXJgbR0lk8cdA7QcUQogSEICTKol6oBTPsrEw+xpauzxiQvhafpxXCXtLJp1NPTQD+23uMz5pKR7Qtug1ixSAyP6ghdlQ69hrEbW2aGLyK0aLA3wJIQodpRkTUtP9YNPpk21QWdS4tGTTebvs4t/pFGaZpv3ns08yhpFH6e7OcKAw3zrQX5jYJdsKh/zz9G8G7oOGaI//864OWkDI87UQ5eJxk6i8uBz+yAOwvSME6yyvc8V2Fkd3NY1KWbMO3UTgylKMd6OKJ83LB8S08aigL2vFfNfMNc1VGTdF/zUuOpIxaKpNCP/kd/gr5hwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7t3GB4e5tjirIVR/BwmSRxlP94wWc7H+Yj0PMmpMbvk=;
 b=XVhKrxM0SKCnxLnQ2RnvfcMpCMD0I1/Tyss7q9ieSmr+cLbRGfU97LACTAR9UMc0hTYIqS3YJ8NMPlNmwQu98c3ozCFSncCyqcwbPi3ZmN8Av3A+SRZ4r0JvV12UUAHMlSzX85hzNiPrYdjV6g6ihvfxRbfbCa/7rASrYaGn85ctGUUeMNdtN4uEHYAclXJ1j/1sKMqXOG7KM/oRlA+715JjyZti9lbbZthXy4mMYYgtM6FJF/M73IE3XaoqVSJYs9Nvyy4Nc4GyLJGNoJzentfhJy/OSDD49QJdO86Wl+hZdnmLhrIFBwncjwuJYp/oqAKzzD/FMG3xyU+Hlf4s6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7t3GB4e5tjirIVR/BwmSRxlP94wWc7H+Yj0PMmpMbvk=;
 b=M4srv6O0rbCCoJhgnR+0eylvZV8DlCDYNQcqJ7InwGuGXxe8KkZC3p3/r2yZJOeZPn+CXP0qK+n8hPn7ryHvO6o+rl7hWzUZT7z56dqGFpjvy2SeAi0oyM/FyaW7epVVWB2yC6/FP2gV5elXFDXjGmbdTKvX//m9JkV8Xi4xK4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 07:41:16 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4713.027; Fri, 26 Nov 2021
 07:41:16 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     robh+dt@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, ulf.hansson@linaro.org, broonie@kernel.org,
        linux@roeck-us.net, wim@linux-watchdog.org, linux@rempel-privat.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Jacky Bai <ping.bai@nxp.com>,
        Rob Herring <robh@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 3/7] dt-bindings: timer: tpm-timer: Add imx8ulp compatible string
Date:   Fri, 26 Nov 2021 15:39:58 +0800
Message-Id: <20211126074002.1535696-4-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
References: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0139.apcprd04.prod.outlook.com
 (2603:1096:3:16::23) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0139.apcprd04.prod.outlook.com (2603:1096:3:16::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend Transport; Fri, 26 Nov 2021 07:41:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b516d9b-9f66-4d4a-2899-08d9b0b02101
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8790B422DE8FCB547DE17336C9639@DU2PR04MB8790.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QtI99xUhcr8PM3nT+wbDNd1I7ZcgBwB/vPZjLY7VaGHj+e3tfROzbaZJGz1mwp3LCY5h2/g5bJC49qfdVExPuqigREiobw9xxawkEEMd9y5AjcaShAA1uEh5eDMQ0/eewIvOow9IrCddOTsUBRlRTHp1wUqB25+cU4KUBRbK4jb44BSDgqbreWN7A6sHbKShTB4aEJnfnmKRIPSZg5ZOb6mTkxnadz4jMz44eSPWhKtpBmdcl6QAW5sQMU6yc4VrOmhcjjESLuUkofOL8Xp2+qSUCJ6uc2ic4nlTYGW94ECPi8E/XOAkvf2FtiHv/RBlzS8NPUBZx/U/jwDYOOGE2vixHaCxhzDciVOtqeQUc+yFEOb9ws0VMtfzLbjDtRoMN30jz+Pps/zNT+m6jPBAuxallKwUNNXrabH8g+8cIJawC5XfNTyJZtCHSGv3j6rasjwYhBE4oQCeE3bbvrzu4TzOlL7ZvLrWkZGokNT7JFTg6VAyLhOtDklopPiEUNIhYQ1gKNIocZCX7GZ9ycDtQlPvF/mrkzSBFFBqH6ZqW9JjQIu33P3OhS0IRcCo1K+H/Mxn8kJAkv5LLwbtGm8ZdYHfnr9Wq1BS3GG8YSp/cmDI3m29/0D8LqGX+stNxrDON0OxlDQxl4J1j5gJIyez92cpXULL/uLjTMXdQENOEQMfqZjZdB3gPTvNanYCGGw52UfZqErNRAM1FiYd5qeqcz+vTiZIav1ee0nyebmP9aY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66556008)(83380400001)(6506007)(66476007)(6512007)(316002)(186003)(956004)(86362001)(66946007)(38100700002)(2906002)(1076003)(508600001)(4326008)(8936002)(6666004)(26005)(54906003)(8676002)(52116002)(5660300002)(2616005)(38350700002)(7416002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0+0ubXKeCNaOw9PzSFiT3/VOFc2Tv1dokNHX2Zv29oRrotU1f47C9x9Z71NH?=
 =?us-ascii?Q?QMXoJyaPZsGlOgXMCteaBmVzYqq3NuAd720o8VGQpw6h2LOSzvk66zreJRXR?=
 =?us-ascii?Q?6EB22Wch8tlV4qU6NhazhXMF0MInnM4tt1jOid7bhHb6ZYBWR7cyEPJrS+Ps?=
 =?us-ascii?Q?sYRQfvLw75pCGIPLiN3xPjLgoJ1XBPN/B4dKgj4DIbtVLLmIDN1t2iksqBeH?=
 =?us-ascii?Q?HmCa5r9cmIo6EoiOap3RKwtYUyoUMQbsdaGvuGdWKzFYmKqLIyDTlNK5SoaJ?=
 =?us-ascii?Q?bCZmxkwi/xII6ZYX0s4OQpynhXFW2gELmTS8g2PvtkB2f8EErEYxsBQA/xH/?=
 =?us-ascii?Q?S0jPpjIe4D3IGOZv1uUeiA1zLfvoMOthlVlQVYaBHLsHjosQpBzcU6UMF8UT?=
 =?us-ascii?Q?/UjgFU6DwdMEkduxDsCFCMJ+mmaMQZ/DuUrmxSKZCN2MTng5hnZoGL49cDmr?=
 =?us-ascii?Q?+CIAgNM+tzSpTW7olRpmGSZRhyiL0UV3+WkG6FppSd8eAskJMPJuRxwOlORt?=
 =?us-ascii?Q?6NbdnQOEiLyxtmdSRiXp0asKJ5EkTCQPb4cMUtjQT0wv3em0aJc1DpvdGD5C?=
 =?us-ascii?Q?tA+k6kIpyKAr6X/xorJCuxP2JCBbI7OxFqsJ0Pb/fR7TmPYmwpnrLralCtml?=
 =?us-ascii?Q?do1YJb/d2iQYI0vDKqsxVLQyXgIv4CIvBvCw6CkHTFqbQ2qU/uzNWLgRzAmd?=
 =?us-ascii?Q?gDh8sQRp0SAjYSPJY04pOhCdAvTQzBSfqvK7WzCA6PlhYrEDqRPH22E0gKtI?=
 =?us-ascii?Q?BpORtm2XSYuu6QDCI1PJKjhtDDce5xTQiJSt+wfB+nHqKywxCSNqRe/S5Q+x?=
 =?us-ascii?Q?9leXumCWp3eD5bGc/YVvxnw0PkIwIsN2/uYc3E/MwQzD83z1n0ILqbPDDA6l?=
 =?us-ascii?Q?s5nfK3CdBoKKdUVWJO73Vha13d5yn6hpIQ3oXSfbfsH4SQc3MSd32OM3QAuA?=
 =?us-ascii?Q?9NzewUmdWL5UHIpW9yrHHXPtP8CFSk1+HfWLL/ff99ctt00rpFTYMfAUIB7X?=
 =?us-ascii?Q?SHb8PMD+c6qXbH2wjj3qeXr7SbEKbpWZJUYZDw6EbLxp0UfLuSCxxXtmQ6ly?=
 =?us-ascii?Q?5xb7WADs9AY9CVjDBThtsF5x40KcmYH0hfbDPA4T41JzeT/kLkbeAm9+jf1X?=
 =?us-ascii?Q?Z96ZjXoN8ysE/P3FZEYxd/dY9NvAEAyqqeJ87dr39skEMCVJir3BealUHCKw?=
 =?us-ascii?Q?7MI11pqVTBebMEyhSN7rDxfbYjvQmzBSrKPfhB0f8e//b0rbPeBUcj2Kq/Bh?=
 =?us-ascii?Q?EeOlJaTu5jMVQItTArVFDP5OVzA3yEqXKm3eu1Pi94nKZWPhaAaatqTGL4CT?=
 =?us-ascii?Q?mrhnouO0KeAo58XHWHGN4rj8BKv2XMC1UD+Q30nhzatUwEALW6p1cYCu0+M6?=
 =?us-ascii?Q?Z6uD1tBIoFKK7fpar4Nzy7Y+2UJ8tt147qulZu10Epxds416dk1+mOyU36Bn?=
 =?us-ascii?Q?pClhXM2gg2yfRCJ42tR0WDb4ZxrykIJd6YgHTrMB/bSi6BMUZfgibqIYvNLl?=
 =?us-ascii?Q?3bMzCgO1cEav9R/7c/6cq6711Gv6vMqjPQ8hcGT6Ksn/4AbUG69LPWS4ee0y?=
 =?us-ascii?Q?a7s3KzZJroyNWIqUsMMWDlnlFLdDvs8Lh/BdbAu40bTeq07k9Ten8ZyQFEye?=
 =?us-ascii?Q?B03ZeonK3CJa2zLJ8ZKv1Pw=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b516d9b-9f66-4d4a-2899-08d9b0b02101
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 07:41:16.7766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yAolyHOveiKiwW2HPe+bOpPIpiTx+TNSnFEh5yBo5+C6n63gVmcpd0JuqVEISOJaFmqmIv53mMgXVTiOdkKAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8790
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

The tpm timer on i.MX8ULP is derived from i.MX7ULP, it use two
compatible strings, so update the compatible string for it.

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

 - v6 changes:
   rebase

 - v5 changes:
   no

 - v4 changes:
   no

 - v3 changes:
   no

 - v2 changes:
   refine the commit messages


 Documentation/devicetree/bindings/timer/nxp,tpm-timer.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/nxp,tpm-timer.yaml b/Documentation/devicetree/bindings/timer/nxp,tpm-timer.yaml
index edd9585f6726..f69773a8e4b9 100644
--- a/Documentation/devicetree/bindings/timer/nxp,tpm-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/nxp,tpm-timer.yaml
@@ -19,7 +19,11 @@ description: |
 
 properties:
   compatible:
-    const: fsl,imx7ulp-tpm
+    oneOf:
+      - const: fsl,imx7ulp-tpm
+      - items:
+          - const: fsl,imx8ulp-tpm
+          - const: fsl,imx7ulp-tpm
 
   reg:
     maxItems: 1
-- 
2.25.1

