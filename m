Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3F3457D71
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Nov 2021 12:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbhKTLjC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Nov 2021 06:39:02 -0500
Received: from mail-eopbgr60049.outbound.protection.outlook.com ([40.107.6.49]:17987
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229592AbhKTLjC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 20 Nov 2021 06:39:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIhbdmkxbFoJ3Sx2cqJft8mzqbXJKWXhmSIYD+WAHDiaflJGuhHRys3ZExSlq+VrNR98dDnUijI38pVwRSDZcsD96trrpesO3e/OWssWjsDGqbB2dmPdokayWrFWp2BaaflifI1pp4jGVVqtmlMqxBWy1xGNAbaA7HXr1CibmzJwH6JC9WDeRyT7iT5VFZSWJkXASk87g8zNPgjKHV5T45o2rauWoINQxtiPfQ8iJIcszC5bb3upPYJp2f0ESCmEdTz916lhlGhPrel8XNH1lgvTQO54Mpw+8jsXrm2/qW/DJQcMU+qUX3Rgcd+Eg8TVuhpKB/Q58aMMr7RE+cjbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TRxFGNnrLZTaSpqAZQlmac9XbhgeEikP+Kvlg/CJvc=;
 b=DkK7xCaBTfFG0tUbBRaKjkzxCus1X3i3S0WpqBxQee3ktmvMCpxoGUdS6gVHXRM/vv8ebx0BhDkeTu5Ze99itNOTJU4sSBLAfSX1sT1rwYfUziRJbatWUkIwVzegcmSVGJVRGQGVUKmz/6ejLxagshF8iRF3vnXqHr4Ul9p1GrjKuApbfAvNh3SYgHM6Pb+RpzkZfCtXehjVbpdz+SDUCUPBHbFjCIONMqU2kwEhV3Vjq4ztInAp1C/OsVJjDFeBYaBWV9CLr8pENNkohaQzzK43ZFnPM7noWKyR6rXuP4OXMBz5HwZw27S+0+hYbbN81/y+mB/9EQqGF2LEeSSMng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TRxFGNnrLZTaSpqAZQlmac9XbhgeEikP+Kvlg/CJvc=;
 b=KCLiOzLmEI5E+B5R925jFuHvFHPy+Dm5ZurYZToETJaggO9j9nVu5hn/T6PH2/SXwJAhR9RO6FSgj5P4A/2aq6iT4DAy6SZWJTZ36VJ5gSenFbQdhLyL4Cnlgs0n71Z39r2a8UPFWwrPbupyP5JA1+xA696IbU1dvVP67RhK5yA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB9308.eurprd04.prod.outlook.com (2603:10a6:10:36c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Sat, 20 Nov
 2021 11:35:56 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Sat, 20 Nov 2021
 11:35:56 +0000
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
Subject: [PATCH V5 1/8] dt-bindings: i2c: imx-lpi2c: Add imx8ulp compatible string
Date:   Sat, 20 Nov 2021 19:34:47 +0800
Message-Id: <20211120113454.785997-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211120113454.785997-1-peng.fan@oss.nxp.com>
References: <20211120113454.785997-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SI2PR01CA0029.apcprd01.prod.exchangelabs.com (2603:1096:4:192::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend Transport; Sat, 20 Nov 2021 11:35:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b703e96f-8a8d-4cce-75bc-08d9ac19ea67
X-MS-TrafficTypeDiagnostic: DB9PR04MB9308:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB93083961C1F2461F2F542EBBC99D9@DB9PR04MB9308.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yi/2ryKap3TsZ5ZMBKpmAyCSHJrcCf7Lq40m3zUzyNamKdYg9fPDHmnBWx4KHao+tFCH+7UN5w35FixgFPEliswnfqsmsKj9wFjO7bFwq/ZOKmeycK8kGtSyjOBDZS/o3l2vdRS0ZsXPaYgBMIr/MTRbMZ5A1m7ienTk/U89l+BWEnya8K1eNLHk8AlNWckSNQQU2jv77EA7EKkUfH4VZ6/SmRXKPui43pphn10cVkOc5ACCkC75K5dNQJ8F7uYPakb5HOlhE7ByDRCpfk92GkM11h8ILkaEhI4jztgD+qB8HLF/AtKSHXQfL+hNKhWwLwfohtXV9rxLAH4H/jzhdL9EKc0JVKASTmiw13SacH9BnDbdqPsyehXWPIl7TtnJvVBdbBMPDEHpfIx/yq7y8FpNqlgAOaF+DUUQNeqdSRANoHqUxuxcHQ4aZ/Pr/4iTmLW/OsdexaCJk2Wh4WjjlhX0lsLX7OSAvHFgGl2u+iFWgZIlFks/cyi0qskmWZ54I4GcetuVuOz3jSy38zSIQxfnhINlh1UL4XN2v+TV0Qw+j1k+4W5GkqZDqdS6v/rmncugNi3CoIH7qTMYlpqUiuZD2mWS+LFE7nuBLed4u9JjKkyXQZgRTnBkY1cV96Q/+zZWwxCJHo5r3Rh4q9Du6L7ODeBOljMRBvntIw6iqsl3uOPGQSUToPU08cD7qOCWjcq0mvIS3CHcYQ+uQZF3u/MuCC885wBUzS0bMTiYt+Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7416002)(26005)(6512007)(66556008)(2906002)(4744005)(956004)(86362001)(508600001)(6486002)(66476007)(1076003)(54906003)(38350700002)(38100700002)(52116002)(66946007)(2616005)(8676002)(8936002)(6506007)(4326008)(5660300002)(186003)(83380400001)(316002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ET9M7JCdFtl2cr4rwHSqIZS/68gfG+HEKH+Rwz4iaIzoAcBYKKOyw/gFJk3F?=
 =?us-ascii?Q?aGsdkP/xJt0Q4TGd0iOHc5DDgCwDX4SpWrD4QvC7haPdXcomVsLqSwyMDj5M?=
 =?us-ascii?Q?Sfw1Yr325aXEIH7ynCWIUUsf0piPPdZYS9pSCg/IXSwpWgYen5OCXMi8VdeH?=
 =?us-ascii?Q?2kgwTb3ugW2D0c7Npz6DeHAB5AJGkrPe2ioXduZOZTayEqVcVsomG8vb8f4v?=
 =?us-ascii?Q?Jg3PFDgGczM7mxfLU4b5A4QwcQLv73dmRhEAwIoygqhHjZuvopAtgUHTe8wf?=
 =?us-ascii?Q?F4sw4eaYqVRAveFAoNZr7Bzp2Rr43tlPwolJg9blgvbR7uzBlhYoOTrLpG4D?=
 =?us-ascii?Q?rNFq50C70TBEDG02aGr3DhLdJsnGCd8USnrjhW++ovXPwfH9YlbszomanDTE?=
 =?us-ascii?Q?6Bi9sKG35XRLnuMo2QLF3fkJ6NLg33fjbn3/mWtwpIoFhSEWnMiRrFOcgjtG?=
 =?us-ascii?Q?jezIUbJkxR8Uc/iAOftSiHs9Xm/mD40HrGlAnmhv64d+6oMspUcRgauWDA+B?=
 =?us-ascii?Q?gE2oZQwbxEpT79hFBYEw1sieoycX4+/szQWx46egQZ/7qX9IE+PqHVLiVSnO?=
 =?us-ascii?Q?ytxWiowkzBJRDsx2YFGaPsh5vtuOnBEMVR8Eev/0JX9L8lRgDzUR6PP6bLzN?=
 =?us-ascii?Q?psRsZ4nBmpyNdlWh8UB44X/8gSS6hz7QeCtcv/RjcB8qfXdjJ+2wofSE73zA?=
 =?us-ascii?Q?OvNew2a37HjkCuav+Z4Leg+Jb2qXCFJgAl5dr3UCv+CUCaDC4vOvtGLjwIVS?=
 =?us-ascii?Q?93iR4wl2TWBsvqoKylKzQtS9Aql4FIpDg2leUhlbnzhOhMoewqvgOGmqi521?=
 =?us-ascii?Q?fUGd2HQAdhci0Nszceh10kjQSO+IymEwuDnt8I2tGSH8Z3Bb7MMyppKNCyS1?=
 =?us-ascii?Q?U5zF2XbpI5gDcnJmFagDIxG84HwPQkjZ3soPu8tJdi0/74uGQ8FKLbOzrm2O?=
 =?us-ascii?Q?VctLOwT+kEKmVDAHu9JXKWsEDFMN/r+6Yn+arlsA2/fj/Fr67LoiAanLqE+d?=
 =?us-ascii?Q?v9fH1krceaLKQum1mDPasYk1XADUHzv0Fga/ZDAqHMb6dwJqlFYnFYLcuVlA?=
 =?us-ascii?Q?iNcL7XJc1U1QWF9h6IQh2G4rMOR2efEQsD2OJLKupHaXXkO5Nk1SeV+TZp9g?=
 =?us-ascii?Q?rYZO2rSQkm1Vwan80bBo18jMluX92XdhE9IcFpGFEXxv+BBPHnCN8B573wUs?=
 =?us-ascii?Q?nwqlBC6fGJMmJratUmXqjnnTYJhZV66y9bleHlan9tVMtWtyZ8LOT5m0tK/y?=
 =?us-ascii?Q?5d9aA6E32sCmdbjfTIG9vnil4m0Qm9S3NPKx9Ur9WD1nfdYFW9yIQ5oXpQ0r?=
 =?us-ascii?Q?al0f12kaytSLXV/HEFxB5Y19hxCHILruXy0c9vxVl4iJuRZDky2/pHGeM1pP?=
 =?us-ascii?Q?jDtNy/RE1dveH3ii49IkaV+Ik6RQwjwuT7UHftZHd8DYk5VMaBFP6OcdzXG4?=
 =?us-ascii?Q?0SPaWOOVLgkbjGYaFU7JoHj2JgyzKwrZagx+R70jw+z3SjEyMjQLDZyBcZFT?=
 =?us-ascii?Q?GFNCo27WZd8jeVDcc1rgjTqHbSk2fw1aL+MIkeQX4UVIKM4tt10CXBJVOueq?=
 =?us-ascii?Q?bSHO5N/JgXISye+YWAqHpJvAY+9qCpH1B0FBHkB/olKvx3BowkOl4e0HB4EP?=
 =?us-ascii?Q?5v4FtA+RzzYXzAnuZUpbPBA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b703e96f-8a8d-4cce-75bc-08d9ac19ea67
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2021 11:35:56.3165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: abu+RiPY3iFvTGchJg6yeZwnqJ3LdfoauyFU+vkqemghl1NZKEaWV/0itq4v3w3C4RAf3hAKmBWwEXg58X0nrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9308
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jacky Bai <ping.bai@nxp.com>

Add the compatible for i.MX8ULP.

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

 - v5 changes:
   no

 - v4 changes:
   no

 - v3 changes:
   no

 - v2 changes:
   no

 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index 29b9447f3b84..0875753c7d15 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -19,7 +19,9 @@ properties:
           - fsl,imx7ulp-lpi2c
           - fsl,imx8qm-lpi2c
       - items:
-          - const: fsl,imx8qxp-lpi2c
+          - enum:
+              - fsl,imx8qxp-lpi2c
+              - fsl,imx8ulp-lpi2c
           - const: fsl,imx7ulp-lpi2c
 
   reg:
-- 
2.25.1

