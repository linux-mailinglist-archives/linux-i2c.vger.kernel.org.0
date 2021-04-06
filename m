Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97EE1355258
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343568AbhDFLex (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:34:53 -0400
Received: from mail-vi1eur05on2043.outbound.protection.outlook.com ([40.107.21.43]:5955
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245711AbhDFLeW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:34:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKTzt8Hc0RKPEw5N1wc1PAvvhudcqyMVOYU4Pz4BJNmPPM+/UXhWb56Gx6hLnCeHoH3dPzYHcyBDYsHSa0Y4XZYhAWqjj4Igt8RzeKyONImpULxqeQyG0wZfMqWtxZ2O/ZgK0zpB8txzlW+P4dcIwjTZ4FuacsOFXCyzm3pQLlcLg7TOORjOBrsiNtrp8nUWI0m2cgeRhTORLR1xsAjpeF51kcaLsQ1Onn2k+PYqwdKL1dt+1HvAX+pfB4MwR/WeE7ierBScbhXt41+oLIH+bQzmJ5NgyqaWRyrQJtvCzvFkt9+E7hz+OvYN4JKxfpqN1yN1KMfyDh5KD50L9d+PEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlJK7DMoI7Eg1jvOSgnomr6baokKxTNwS46RML/ZnV4=;
 b=Uj7KdrmWUECasRN5CzK75t4lcIpHpkIQM/oRhYn9IJxBw3IL5ktLLi8Hs9p4d1LdWdzq+CivsHp4v/GJf68qhoC418ZdsmPNW93jho/bG9dICKHbSO/3HUoN26ld3lE6EaTfpjTh4XB0c3mX/ihnfv6hZKoab9Bv5eFqcCk4igSR+micuhdt426IDlHO3cy9ycfPsezgauXblSDDM6Ssr5hNAKgoMUUGk3yKjmDspP7jUYaT4fQhQQmbv0QWA+18k8ybuR5d+RLTZz/AGuS6dqeiQMc5/lcgYuR18HOShWBdP7kfYSV5jgJbKtzQzONm0lPoOcBpmaYUmowpT/QWZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlJK7DMoI7Eg1jvOSgnomr6baokKxTNwS46RML/ZnV4=;
 b=FYUOQciPfZ39LFlnxJ2nku9LvWBmbaEXudnAfGDclFEHecAXs7rvJJnBn/wqWIfQMKE066o4fNB+yu/DnR+7PSWcWu3+P5M2Q4o7q3FVkhl1LMK2OIb6srVSh9Lv40jOtoPn+acIIyuIG15X2Alt6OqUkJx1E2Az8M+PSe9MMIk=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AS8PR04MB8359.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 11:33:59 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:33:58 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 17/18] ARM: dts: imx7ulp: add the missing status property of lpi2c5
Date:   Tue,  6 Apr 2021 19:33:05 +0800
Message-Id: <20210406113306.2633595-18-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:33:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e5631e6-544b-4cce-5274-08d8f8efde65
X-MS-TrafficTypeDiagnostic: AS8PR04MB8359:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB835967FDF117DFB68E5C88ABF3769@AS8PR04MB8359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CL1XgymghztlwpbkI1QDbjBa3kepNcRt7tBeDOC6mm+TTJeVAF4bEGcc2a2K88AUYMAmL5nDm/crGV4kVaxb4RahtqLSmZXdPO2bWpKwuAK/CgK9rivM+oC4wLUHaNNbaAYmqiIdWn4RIXJxryJc8zGbQ50nb9jH/j+ov4LKqgHbNpBzCYEoMS2xNxGMBjWqRSzP2GScCO+IeHk7Yc56oJcwfOtFNDErJrkH2+Okxptq2MQDP/lB4pxDiCOLUmNNA0sVLWQK2usEGW2y5sDTDbkBsjHVsz9RcY0+9rSOQ+QEZPZjozCcifSry3qlyVdC3BiR+lY6l7Qy8F8Usr4VLmVFIMGdxqLXssjo0FUSQP0w5Uz4ablVQORi80rUvY2NR++ka2QdrT7ttHMeUX9CeL0ARcFbIbD+CDan7LAlvvTWYQV51ySwqlAN6ndANZ+LxZ4kd+AU5g+v517uc6J87yCHA+kQ/QMuIX6s9E59ICQ6BnK9fl37FBovh9yQDTKmV8v3ZVVGxLTxrj3bmFL/Ag9dJ4f+HPgO8VfpY83XN/ayP13Bjjnd+JZ6Wu/uyOIxbiY42VM4NrpXH74bea2ozWRjMXb2TRa1/d2lbt+K6/ZwZ6ctRuOdNzfx3fv1yazoDkewMe4W6EGgfyncOkCHJkUyLGDfaGa321q1KxhHvL2xkFArh0vq5wAep85Jo00b8XX/1Ae6fJYplpUXbTvauw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(5660300002)(8676002)(16526019)(86362001)(4326008)(8936002)(6506007)(52116002)(26005)(38350700001)(69590400012)(6666004)(186003)(4744005)(83380400001)(2906002)(38100700001)(956004)(2616005)(36756003)(66476007)(6512007)(66946007)(66556008)(1076003)(498600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hca+kLa+vXnsPyEerfE4bkdFYKYN3bwCJpMiok7/PhlRQmlB7pSo5Knh/doU?=
 =?us-ascii?Q?2fM4ZUt4iJeXN9kulxR4tyBbA6s0YCXN3G9S8Q4zzoJGzQmUCv++WqzkbXEV?=
 =?us-ascii?Q?4FjEstYH2sMvEpSvvYhTZBISQB1lVCCzAoXQsBeOjL6XsnlBYircs5WlXnfj?=
 =?us-ascii?Q?YDAHVP2JlPtmoFL1kplLOSOekDQ8ZXTajDjHpeIyUVNhWtxrZyLDoiej4X/C?=
 =?us-ascii?Q?fVWY/R6aMyV8zt+kcFTPbJgZFqvJrgCXgxzqlE2kFFbNqG/51ssB3IGfc8W1?=
 =?us-ascii?Q?r3cdZzJVs3r7uCtGkjQxGLRPbVao8wssojj00MzDKlTxUlVT2LZ4H83hEylC?=
 =?us-ascii?Q?Eya7E2mQce7aS6t8ZUvz9BYnfZyk3/ipz+b7e34OQHM8iBY9SrPvLu0LWEA+?=
 =?us-ascii?Q?Vt/XX/uFf7DZyasESRwcpgFwN+c7sT8GcwmdSc+hIvkFP7mWSWA8sQ9zseA1?=
 =?us-ascii?Q?VBTW8fcQZA2qH59mX0NQOdJK/udkzl8TbgXb8I6RCkj1EYQ78oftLtm1Ap0s?=
 =?us-ascii?Q?EhipODcU3Vx6gcC5AR+4qeZLC/VgtT0VMaGVAHCX794xutyaDbpjXZtFVZZ3?=
 =?us-ascii?Q?iwov9mjVX0w40JQgYaacYtQBdEWhzGBuGOHL1Dq745lGrN4MWJVks4DAE5QE?=
 =?us-ascii?Q?bhhsJ7yia3QzibikKlqBunV5CzhHwNU//dySgK0d3wX4ErmrhsuH6TSIM4DF?=
 =?us-ascii?Q?sus6llWFytwAyDdgoWst+X/L+zGBVyIZ4T7s3xDXhW3LUG3CM2bXNYS458Uv?=
 =?us-ascii?Q?SATP9QRwUQrY1WKdF1zGiOfovNx978PBnLq1aZxi7FCmI/y6zmDtnO2cR3u4?=
 =?us-ascii?Q?xu4HKJgdPGs6tnUDtaz1Us+BwFX4z5NxXmkRXNcYAr7MO3M8GbJFuYUDnnRI?=
 =?us-ascii?Q?xp7z9eBL0vIawlhanqqnaJeHoVugiZ0D9ChcOv8O1PXVhTYgeknxBbw/Cpxk?=
 =?us-ascii?Q?YeuRVw5OgB1VpppxMrUsU79eremPgD3a8iIqT0HuNEzZPevQf667fjk4RycE?=
 =?us-ascii?Q?VJF8q4Y1ITZbmHGsVwmFT/3J/0s+w93QuN9HtYZchBAZbEryLZR5metCUi+M?=
 =?us-ascii?Q?xokrJ3nzieoXKuoBAIfDAS5/2aAWaoAWWj3XVRkw5sa60BgJHS3KbErjW53w?=
 =?us-ascii?Q?QyAXmPvO4D3Hot+uHdcN2ixe2zorE8x2fgYFr1LXjbXC/vyFnvO/NqA4RRYI?=
 =?us-ascii?Q?TDdEseTU4yeFGbtPtLXvvbu1fE7xgyAASKLqmtC8ae644bfaT/Pwcs7VWO07?=
 =?us-ascii?Q?CwrbGCoF1gX1ZJl0GWT4GAzkEuMs0TGslMEE9Fgo1QCwcfQS0pF5CRdvtyeR?=
 =?us-ascii?Q?U+4J0LXMhytDxOW+SB3x9r+6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5631e6-544b-4cce-5274-08d8f8efde65
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:33:58.8307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrBL/8F2RR03BL1i+P+PlbpQ9KXGwBpOKvwAfZRm82rfug5aF2SzYeKFDbMIej41gENkzyWMsyzHPKJft/R7GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8359
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the missing lpi2c5 status property.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
V2 changes:
 - New patch added in V2
---
 arch/arm/boot/dts/imx7ulp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
index a6681836ca05..b16441e18231 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -174,6 +174,7 @@ lpi2c5: lpi2c5@402c0000 {
 			assigned-clock-rates = <48000000>;
 			dmas = <&edma1 0 12>, <&edma1 0 11>;
 			dma-names = "tx","rx";
+			status = "disabled";
 		};
 
 		lpuart4: serial@402d0000 {
-- 
2.25.1

