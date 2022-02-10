Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 548144B1787
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 22:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344573AbiBJV10 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 16:27:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243233AbiBJV1Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 16:27:25 -0500
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140084.outbound.protection.outlook.com [40.107.14.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DC626CD;
        Thu, 10 Feb 2022 13:27:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fchNVMknc1gm4LWGdbxVWU1zBf8pi+f1Ktkkky6C8hZmVxhaCUlWsIan9u9Cyc1zGgtrtxcqg1++VV0XvM0diukOcNsrkvdccq13GXizmJGiS8ZGrr3iLc9xzpmFLYsg6ET2iW9lh39GCfea6pXIgrfbdnymgdw5uexWRev3g0wlmog+cj6KYvPVHlq85WTYHJ0Vwx8OVb0tLFFbJ3vs12BC3Ec6x3U6Ffx60SWfpz7TUz/wJOyX+NcYmE3pfAfYmoBFcMbIfnBwsL/O0xSCbH/U7G//W9OwUe6u2yA7IuYqkKIfkU6zWoTslUjR59HEoBg9h+vS8dkNKKhRcRHoIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gv89HjljmZ7gXki4JKuZ7etbR6eDMXYakRjhn9H98HE=;
 b=BWMZM6kqrz6A/MPac9xQPgFEBGr3+UDRokWufs0wAUehRGBnuY5T9ZrQ4KxQneRuuCF9yFOn3IOLWeFnwyuSnDeibU3yk2Uq1a+ZF4qC+SKQmWBN9cHBDeYsklYokDwB93Fdnqfhglu7R+k//dtuKEbOBhPN+s9Rs9SqEmtH/7BCaDGHt22QYxWgPBMVSnFWqFppeR/wYG9UpT1rbBPdFSY2SWHr3iW9t3JoOp+OBNf5tC0xuTdcTLXvM84Cra4uO0R8kiGbGfvWrO4DJxgSYdnJhJzFD+bCDgmRGq0TKQkquFj6Wt9eoOWzZjkg4nhWKAxFmP773rFVQ5oJuApqOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gv89HjljmZ7gXki4JKuZ7etbR6eDMXYakRjhn9H98HE=;
 b=r8LSFi8lnBgn2whI/tO1UgUfks7SDJzk83G/EjdaYUn0VyRuKgq42VJE4a4eHi7wGkabHJMhmXe99jvYWOTlyt+p9oHBU+3o+sLtQpyN/jsPi8DL3kG+A1BXdkAFGgx8J6wu+nZ+aiKxgUSuGb4tOZb5kF/hg3pNlYaamxB80hA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4679.eurprd04.prod.outlook.com (2603:10a6:20b:15::32)
 by DBBPR04MB6075.eurprd04.prod.outlook.com (2603:10a6:10:c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 21:27:15 +0000
Received: from AM6PR04MB4679.eurprd04.prod.outlook.com
 ([fe80::28f3:36a7:fc3c:b9aa]) by AM6PR04MB4679.eurprd04.prod.outlook.com
 ([fe80::28f3:36a7:fc3c:b9aa%5]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 21:27:14 +0000
Date:   Thu, 10 Feb 2022 23:27:10 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Jacky Bai <ping.bai@nxp.com>
Subject: Re: [RESEND v4 08/10] arm64: dts: imx8dxl: Add i.MX8DXL evk board
 support
Message-ID: <YgWDLo/+bdoyqOAY@abelvesa>
References: <1639680494-23183-1-git-send-email-abel.vesa@nxp.com>
 <1639680494-23183-9-git-send-email-abel.vesa@nxp.com>
 <20220126125355.GS4686@dragon>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126125355.GS4686@dragon>
X-ClientProxiedBy: VE1PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:803:104::22) To AM6PR04MB4679.eurprd04.prod.outlook.com
 (2603:10a6:20b:15::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfd032de-c52a-41e9-ec7a-08d9ecdc1b4f
X-MS-TrafficTypeDiagnostic: DBBPR04MB6075:EE_
X-Microsoft-Antispam-PRVS: <DBBPR04MB607586558E63DD402D6DFADEF62F9@DBBPR04MB6075.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qyd9wBRA04k8+F/DGfDRRpX2uhVqMgRQzRYDZ9qZ2kKU3Mh5v8FvKpfmZMV/SzEaaTpzb5E2X1hYHoQKa0mld/iSTorEyeUSffdvfFBtXG9kudmBNW2R1nSpR088/6vmpYi9B4eIgylX+3MZZqGRMykflSZkWnFSLuCypxPkvz40zJ2WXcAPk49L5AsxIiCbTSivnag6Oo64qzsL7Qwdgw2jl+UV8oBm7N6VUtwOuFUKWFewACypyCh2t29jSpDCvXmaill8KWax0NlVJtYjFgERTL8F0zV6bnLq6zgxSXuhEmP3L8+FnzERtItcRqMLr/J8aht13vXDRaBtkfATCI0wduUaqupIKpRCq7LhwY7gK/pUpB1lCGI047vsbgnuQNfrrJTAFFJzWL/qNGkc9oXnWtSAE3Dxp8hQOcxeu4g7pkJunIvoIFgyYzmeOZjCmF5wETcgMr530rOIub5n0rKFnWXJoaHaGHDLpcXMnvE1DZBO9DrVMXSbQlGg1xvwD1aAYS+Zt1VDwxmwYaySiTmQ9GzYjKnrJaC13Ddapitf59VkJy1yPl68jAkFbk6FTe2ab2tFgdtYfKYdYY8UuDLKZCkzuUtsr6BKo23fQrFTZzVtSiksZ012Pr5fRm3iW7T8Xrl6IJLdAuY1bkouDitAaL3IfKKIZZci2th+04niCIH/jvhzLUkgdxl5LuwdkwdHkbCVWid4pKky+OV9ez6hYDhYoquOFGH3O6NYbXBw++Q7G462rYkFpWGXEC6i
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4679.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(316002)(26005)(8936002)(6916009)(54906003)(186003)(38350700002)(38100700002)(8676002)(86362001)(7416002)(5660300002)(44832011)(2906002)(66946007)(66556008)(66476007)(9686003)(6512007)(4326008)(6486002)(52116002)(6666004)(6506007)(53546011)(508600001)(33716001)(32563001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7m++7mO3vWMyNwSmxtIwOuqho1oCinYZHNR3GKKPrgdulSxulyLSjPHDcGxk?=
 =?us-ascii?Q?pBmiLdgT3gbKQr46HklQ0oxy6KXhggcYIFzGWNY9kXLwicFd0reAg8WWiV6A?=
 =?us-ascii?Q?CZ/eYS3+dqfahUoycJ4SjD17/uv+ZxQ5U5+YRoZCExlW/ldK3CQLTWwKfiwu?=
 =?us-ascii?Q?9aLwt0OHz1WDiOE6lAO6rcV/z6E6eJ46YItRgDTQmMJDr7K9jPFnTcisASCv?=
 =?us-ascii?Q?Z7yQzY76GIH2fU2SqOrTlYb27mlUbXWkDA41M2yRtJyVGKQSWUh1Mvphx0hw?=
 =?us-ascii?Q?Xyq9GGf3ZTY3o+959oRqYAgbXxwwImVCAHTksz6Iq1Hk7xempgFdotOrUWvQ?=
 =?us-ascii?Q?5sbQsdgvnz0MCnQPvBVflKUoEdqDgDOvspV/xjx0ijJf7ptXGhsMhRZzrH3W?=
 =?us-ascii?Q?Ykrt19dphWwAXg3G5AJGGCDsUHngUQIv+y3Y7mnb3/VRAocFUYEsHdd9Jm44?=
 =?us-ascii?Q?e021e05pHKm2/iYVmrquYLnRLKpXbXesf5LvMCJSo1GydVuv6EJhaBwbB1YC?=
 =?us-ascii?Q?DMz2BS4FtEmAHTec1B/8UF1L7sxz0hM+UcWEDT3L9Azz2Vx+lqvPDhjqA4I2?=
 =?us-ascii?Q?oCOb7n7Vnyshhsx4UNe5GSEUt4dJ0YKxXuViTdnKjY+/ZrwXJatXC8e4yAYN?=
 =?us-ascii?Q?ZSEX7g5OfU7kN3fdT7AxaX0Ddg6Dl6OOUzOYWpGDPvar1CuiOXDvmHDuJaM8?=
 =?us-ascii?Q?gvJPxSVJbuuW9ve3qAxKNpCqmDFVX1QymslLIRehZtagC8d+WKxAlvMNG7gq?=
 =?us-ascii?Q?DoqT5xevziYcYpxE9jTm9IQyYhqVsV4nptGaUDOrxszkU+H5/hzrOHLPJ7Bg?=
 =?us-ascii?Q?9gKT563o7YOr72uz0H86N0yXqoAveHVvYq1h2PfEq/6GCJTlidO48BjqAcRD?=
 =?us-ascii?Q?kmew+qJqFWDh0IhKXG1HYtsjDEEDALxXMGPcnERYmOcV3lKPMh4Y4vaEnNRy?=
 =?us-ascii?Q?S0MplzUHgRfBnyNd/vcpVDngNhVhIgyTS7MCY3xQOY2N8QldhgnY3V87wAB8?=
 =?us-ascii?Q?Ti6wpntrNBO+QdcCcoEGDhX07/+E6wiUVyUxbIVQUYPrWf+WfgvLamGNhCGW?=
 =?us-ascii?Q?KyN0dwp5X9vLDL+fr8GsYZYZIkn0qfzmqIbQQz5tmpB8Wwpe7yT8OMAaD+2o?=
 =?us-ascii?Q?0Sa2G1Ftyrx83ztR345QCUTliO/e3Zq6fwelW/CMgCv/Cg1UM5pdudacGNRE?=
 =?us-ascii?Q?g+z7XgcGIctrIMuUZZNyJtRB1FU1zGBHptA8Jq1Fa19WxsIdf5W4UnZtMsS7?=
 =?us-ascii?Q?nZiM+5RJbFQnfKi13pzFFhChdXsHXPuguDGFqp8HoCEe53Sb6gGObrVestiM?=
 =?us-ascii?Q?lEwYetbVeRGsdZzhAj8t22HfcsC0e842Fkb8dTXziI2WyhDvznsbg3QsMS7n?=
 =?us-ascii?Q?4NQ7BCX0e/tw9ioMBUYiv7w9hpqqcYJx/hy8QFJ6Y+XyMueKDrV+YV+s4du5?=
 =?us-ascii?Q?0IFOTRFdvyX6h8ThsFLRZfjXuPwuWbwzQYgfBs5QK10wh0eSsEZ8ON/JNzRv?=
 =?us-ascii?Q?JS0hODY6ApNIfRheFTOp6a1nPvUyexIAsE5zr7bkJuLq5POw4v4u+tJNHr3g?=
 =?us-ascii?Q?IoOvyouSeVIt1ioHIGQWxFnS+fWWfei+58APJGNXRiKen+/mg5+2dg6DNsO9?=
 =?us-ascii?Q?6YCMUP3TnMWTBU39TrVrbzI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd032de-c52a-41e9-ec7a-08d9ecdc1b4f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4679.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 21:27:14.7474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnmLK9ReYSE2bOFkUuFPu0Al/j+HUUH87YR6niB+oRS4jKtEUMNoqrAZlzyYRgIp383M1l/BWd+djPIZ1oHGKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6075
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22-01-26 20:53:55, Shawn Guo wrote:
> On Thu, Dec 16, 2021 at 08:48:12PM +0200, Abel Vesa wrote:
> > From: Jacky Bai <ping.bai@nxp.com>
> > 
> > Add i.MX8DXL EVK board support.
> > 
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 266 ++++++++++++++++++
> >  2 files changed, 267 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index 5018b8b1e5f2..f117d3e811ba 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -72,6 +72,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mq-pico-pi.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-thor96.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-rmb3.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
> > +dtb-$(CONFIG_ARCH_MXC) += imx8dxl-evk.dtb
> 
> Keep the list sorted.
> 
> >  dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-ai_ml.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3.dtb
> > diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> > new file mode 100644
> > index 000000000000..68dfe722af6d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> > @@ -0,0 +1,266 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2019-2021 NXP
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "imx8dxl.dtsi"
> > +
> > +/ {
> > +	model = "Freescale i.MX8DXL EVK";
> > +	compatible = "fsl,imx8dxl-evk", "fsl,imx8dxl";
> > +
> > +	chosen {
> > +		stdout-path = &lpuart0;
> > +	};
> > +
> > +	memory@80000000 {
> > +		device_type = "memory";
> > +		reg = <0x00000000 0x80000000 0 0x40000000>;
> > +	};

 ...

> > +	pinctrl_usdhc1: usdhc1grp {
> > +		fsl,pins = <
> > +			IMX8DXL_EMMC0_CLK_CONN_EMMC0_CLK	0x06000041
> > +			IMX8DXL_EMMC0_CMD_CONN_EMMC0_CMD	0x00000021
> > +			IMX8DXL_EMMC0_DATA0_CONN_EMMC0_DATA0	0x00000021
> > +			IMX8DXL_EMMC0_DATA1_CONN_EMMC0_DATA1	0x00000021
> > +			IMX8DXL_EMMC0_DATA2_CONN_EMMC0_DATA2	0x00000021
> > +			IMX8DXL_EMMC0_DATA3_CONN_EMMC0_DATA3	0x00000021
> > +			IMX8DXL_EMMC0_DATA4_CONN_EMMC0_DATA4	0x00000021
> > +			IMX8DXL_EMMC0_DATA5_CONN_EMMC0_DATA5	0x00000021
> > +			IMX8DXL_EMMC0_DATA6_CONN_EMMC0_DATA6	0x00000021
> > +			IMX8DXL_EMMC0_DATA7_CONN_EMMC0_DATA7	0x00000021
> > +			IMX8DXL_EMMC0_STROBE_CONN_EMMC0_STROBE	0x00000041
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc1_100mhz: usdhc1grp100mhz {
> 
> For sake of consistency, we probably should still end the node name with 'grp'.
> 

I think we should either leave as is or use usdhc1-100mhz-grp.

I, for one, would leave as is and then maybe we can do a replace for all imx
platforms as a separate patch at some point.

Let me know what you would prefer.

All other comments will be addressed in the next version of this
patchset.

> Shawn
> 
> > +		fsl,pins = <
> > +			IMX8DXL_EMMC0_CLK_CONN_EMMC0_CLK	0x06000041
> > +			IMX8DXL_EMMC0_CMD_CONN_EMMC0_CMD	0x00000021
> > +			IMX8DXL_EMMC0_DATA0_CONN_EMMC0_DATA0	0x00000021
> > +			IMX8DXL_EMMC0_DATA1_CONN_EMMC0_DATA1	0x00000021
> > +			IMX8DXL_EMMC0_DATA2_CONN_EMMC0_DATA2	0x00000021
> > +			IMX8DXL_EMMC0_DATA3_CONN_EMMC0_DATA3	0x00000021
> > +			IMX8DXL_EMMC0_DATA4_CONN_EMMC0_DATA4	0x00000021
> > +			IMX8DXL_EMMC0_DATA5_CONN_EMMC0_DATA5	0x00000021
> > +			IMX8DXL_EMMC0_DATA6_CONN_EMMC0_DATA6	0x00000021
> > +			IMX8DXL_EMMC0_DATA7_CONN_EMMC0_DATA7	0x00000021
> > +			IMX8DXL_EMMC0_STROBE_CONN_EMMC0_STROBE	0x00000041
> > +		>;
> > +	};
> > +

 ...

> > +	pinctrl_usdhc2_200mhz: usdhc2grp200mhz {
> > +		fsl,pins = <
> > +			IMX8DXL_ENET0_RGMII_RXC_CONN_USDHC1_CLK		0x06000041
> > +			IMX8DXL_ENET0_RGMII_RX_CTL_CONN_USDHC1_CMD	0x00000021
> > +			IMX8DXL_ENET0_RGMII_RXD0_CONN_USDHC1_DATA0	0x00000021
> > +			IMX8DXL_ENET0_RGMII_RXD1_CONN_USDHC1_DATA1	0x00000021
> > +			IMX8DXL_ENET0_RGMII_RXD2_CONN_USDHC1_DATA2	0x00000021
> > +			IMX8DXL_ENET0_RGMII_RXD3_CONN_USDHC1_DATA3	0x00000021
> > +			IMX8DXL_ENET0_RGMII_TXD0_CONN_USDHC1_VSELECT	0x00000021
> > +		>;
> > +	};
> > +};
> > -- 
> > 2.31.1
> >
