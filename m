Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68A5D4B17D4
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 22:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243840AbiBJVtQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 16:49:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240940AbiBJVtP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 16:49:15 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18890E6B;
        Thu, 10 Feb 2022 13:49:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K23MVWvuNhpnSIgGQ+eyiHLsbBNf1md1bUqpntuJwrYSj1dc7Xid2WQ9sHu+IX4GgOrTtrOikQhG4/xQoE6RjgPdUQBLqpkWOvtp6oXFc6KIiaUq5/J0ykq5SYSVAs1Ya6I49cI0c72wlYHyHWzHmiZh7GWhbh22CkL7LOW5WmdJsLyAyQmv4D9ANrP+mPwo+9339Wp029lw46YtA4cwORudAcFn7yiw9AdGW05dxKY4g9DItE8LhIU/6kP3rIw0exFc7Jl1iPKCniyhn2gu15KqeqQs5kVS4xPhujG1HV6wncoB5k9KBTGOBQSqPNOyDMF3OUuyzDInFjj7C2lKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQEHHaTX7I5SgolIYjQ0ynAKoPAUpZ5ydbdrsoKeVw4=;
 b=NPTtjJ4InK5Ybn0Aa0iBWgSiELMPyMEdxhidUxWudV4ir9abvDHOugoK6ISygQfCqz67l4YRxL7sRK5GYtupVjVNCpy57pUFS/OEXTVvApu/u/q3A/H0yH7jN/A2fWNxO3CMuyveo9w8MvSWg8u90q8QVLy+Cq8rWSH5P46PYMr6Z0Ry3qnStae/ceTAtRRwxXOSu5xOmqF9t4IXgFbIO9HKJOeJXXrAb+qrIBF1Zas+PPTPA0FJjfas2zaCjOWqEz2R8eYwy1v2ji300U7hggLCIFLpsklA3wn6Zd/1j7QUzsRq7TFGp6kVdDvxiVY10LUMpHOoOJDMCk3qpO1zuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQEHHaTX7I5SgolIYjQ0ynAKoPAUpZ5ydbdrsoKeVw4=;
 b=YG+8Bhmjdj+9qawGDighP2MAJ/tF79T2+rrzWLOvUbS0/HV6twRXgjgHPLm34x898/jz/tR1gKkJ2jp36ZyQnWDcZAtqL9heyUPC1GVTDEboXri8YpfwoGVtHHQrFUOoEOw5M+niyqP0kNnyf66lMwpSVc8qYIgG9XmZ8f1gF4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4679.eurprd04.prod.outlook.com (2603:10a6:20b:15::32)
 by DB7PR04MB4172.eurprd04.prod.outlook.com (2603:10a6:5:1d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 21:49:10 +0000
Received: from AM6PR04MB4679.eurprd04.prod.outlook.com
 ([fe80::28f3:36a7:fc3c:b9aa]) by AM6PR04MB4679.eurprd04.prod.outlook.com
 ([fe80::28f3:36a7:fc3c:b9aa%5]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 21:49:10 +0000
Date:   Thu, 10 Feb 2022 23:49:07 +0200
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
Subject: Re: [RESEND v4 02/10] arm64: dts: freescale: Add the top level dtsi
 support for imx8dxl
Message-ID: <YgWIU4JznR1twQCa@abelvesa>
References: <1639680494-23183-1-git-send-email-abel.vesa@nxp.com>
 <1639680494-23183-3-git-send-email-abel.vesa@nxp.com>
 <20220126122748.GP4686@dragon>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126122748.GP4686@dragon>
X-ClientProxiedBy: VI1PR02CA0055.eurprd02.prod.outlook.com
 (2603:10a6:802:14::26) To AM6PR04MB4679.eurprd04.prod.outlook.com
 (2603:10a6:20b:15::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a254c922-3192-4b8f-5fc9-08d9ecdf2b54
X-MS-TrafficTypeDiagnostic: DB7PR04MB4172:EE_
X-Microsoft-Antispam-PRVS: <DB7PR04MB4172793D799FDF8AD221A87EF62F9@DB7PR04MB4172.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YMXVm8huquwwer9EE+nEuZ52RO7ssYCRKjSBOKofoo7a1x5XOGz0MuiFmZA5AuOcQLK/y/No9jp/HPSBFFuTzV+BAvBUZebUvLhxOmv+GrTo6G9TOJX64VuUXUfKG/sLi5tvKx4heUJGDIoBA+Qm5EAt+zefkFtMPB0qlcAduiQwhAwPt+DDAk21Eg6ARmFW389MA+vOdAs5gaRelYeycjEDYHT6acgr9hONXaMCgM/7h+64d74UXtt3QqQVrTCLUTwVQ2dYRixIu/mEHOBkEZ5AsycGy1Cz0lZuX72CJiiz+oFb5/uDN8syQWvpktHGkfdU7YdL/Anw7M09YJpzDbyZ7ftAs49csMJcuJB3Z6Su2BAVPUjwLB6xbZNqNBhPussDUk0GUX6uOXO9iO6JwFAv9dYWx6KjcXKRoD6XSN/wfea4jc42mkhryy4MGqnz3TwLkaIBi+pIVmk+dYPbichlo4YlRvcmBGkJ2bEiVebW5ByLtduVNq2cpQJKOwncOBCBt/DpScGJoFks7vk2l4NXhFL0h3VWaf2LBeyJBA6nzoSvwTWiMz9xgrf2h7BVPGiyoVRIoaYJMBTPMch51i/0nnYVNkSJRJgqZuR7MRBV6xzKa1/SonXa5zCNV1/32FlrfBkLHSXV6LAEhVAurO6cy6aAJoWefm+6g5QGlYRxbFoAfA7zWFXXLJT7PCl5UKqqIhGUuJc/BCZkSKhETjL4RQV67ebPF1zRCtAbFJY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4679.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(33716001)(6916009)(54906003)(508600001)(9686003)(6486002)(6512007)(6666004)(6506007)(53546011)(52116002)(316002)(7416002)(38100700002)(26005)(186003)(8936002)(5660300002)(2906002)(66946007)(66476007)(4326008)(86362001)(66556008)(44832011)(8676002)(38350700002)(83380400001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e8eSHCKVV/67KFUw563JUHUw6jcuIGQKNcNE7I1rpf2eggBKKPCHHejVayqz?=
 =?us-ascii?Q?2gM5uh8Ub8ophZ7mu4/Uf7D0P3musFIV+VZVsmzb8hlLJFS0203XA0aVVxRW?=
 =?us-ascii?Q?P6atRv2OCCTaY1OjdJwWmwqQedgUMArs+4msNjgNfTFhGUoDGCRXcocILGsZ?=
 =?us-ascii?Q?Ac13F5nRpEgf5Q0q0LEkosrrPLUrzbV23s9Q0P/Chexsu4/i3dYlU4AqOSXL?=
 =?us-ascii?Q?AIuLJ/d3m0tgtwnpn1LtJkEXUlnP4t/MKyvk3ssgE+HKYgvhErASzl4Ibhq2?=
 =?us-ascii?Q?t3rw5RVQGITMlocJ3YB1iukeyOOYYwDu0iJ2H9qv7Of1+dnrX1zc2eVQBKgE?=
 =?us-ascii?Q?Vx/uAp160lc43DXZ/olCz0CIVP2iTil00twQ/12KGcCr0QyEZt6GhBrqqknw?=
 =?us-ascii?Q?WA1zKsxPJ3UAkaPehraE/NuQjELbC/yQQ1L0bYoDXvCFL03MMYXdfX306jcf?=
 =?us-ascii?Q?e+f6G/cUgBQGmeSNfaD7BGPLNL2KYIqXc9qFdkQBkFFPiT+tmO/3xbOM04zj?=
 =?us-ascii?Q?gCULj2xsH2dTyTUNS+mpcjYL50deeZPZSsTwSeDNi5QlB9elLxsweDN5GzEP?=
 =?us-ascii?Q?Xf1QbTUd0aFun8AgoNnjY2POp1G3CvN6Qo8OYYqZ+dZ1I/sqJyVuY+MFL1tI?=
 =?us-ascii?Q?8iDheNHxLPQsGRdmtqVud1TjN4gFH9+091ULzGkwSYQaYMqCpcY3okFD0Ilr?=
 =?us-ascii?Q?5LBBCSUdbh/j/8s1A9a/52eEUh0JYiZ/Estqqml3tBR+xiKVSPU9ftcGGn2t?=
 =?us-ascii?Q?cMeN6RyL4HD3y4c/WoAu1cbj+JQgG2yO5qw540obysP9nwA5VSDKB2lsWWaO?=
 =?us-ascii?Q?0DF/+frjDBhtpS3oZRe62GrxoXMjDq2zVsznMmaeDrXMMqzuid9R4TxTAFNQ?=
 =?us-ascii?Q?BerKlIeJGemSthUa6W2zhMfKgmqnzH8I4BMJk4I1XytD9VYjPBoAlnncaQh5?=
 =?us-ascii?Q?6j1fWXTbjN98txye7AMY48GW1KOA5OgFCyRqJYiqZlZMo7hvZPdNeJ3Wcu25?=
 =?us-ascii?Q?NK3lvM68fti+0SfZxdToCmA5IDyIihuPzodd+xDIFOjVHB/nJnq89ukLSUl8?=
 =?us-ascii?Q?525FyT3CqoO2gtXXT34lV1M+Hog7C/Zr8Vjk8x0YUSCNi5TcMqZZ16sMr2Cd?=
 =?us-ascii?Q?X6c73EmjhLq6zauqUypfs2ErdPyt0KWE8hCzQGWgmwPp9AuY64v/gXFK7UW1?=
 =?us-ascii?Q?TQdVyKJuJwqdWomloLIKOAhsuK7rG75/PT5Vwla535+Xxmu1Jz0rtnieeZEr?=
 =?us-ascii?Q?C1M6zHcQXDyD4sOgnjnhPV5FmK9dwQGgLDizIdYbQi06kCcoC9vCMweSDbw2?=
 =?us-ascii?Q?FawHSacX1Gx/faojdqYEeNPi8q41G9CdvTB5j4vW4Tm95ZoJJGqSbgngGOBD?=
 =?us-ascii?Q?Mwx1fQwCpoEp7Je3aeLeus/zuIf0vQfBGUunQEu1MXxsWuCduDFPW03JrBOr?=
 =?us-ascii?Q?W78mP4T7T5E4CSxEIlNHItMNsU4lQm1PwYGA34qu6fyU1VDtBi3UzYwC8Iz9?=
 =?us-ascii?Q?NdWCi64U2rlOec05dJ10HWoXXvkKWilfb0Xw6Ank7EeBQp9ugQEuzXC+U7OS?=
 =?us-ascii?Q?3PSk2QrZE0cR9ocswh1QAIXG73J79dgecizGgYDTQ66FW8oaPPXIClA5b7cU?=
 =?us-ascii?Q?wQIhg8p4wmqMqyhf6jSd1gc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a254c922-3192-4b8f-5fc9-08d9ecdf2b54
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4679.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 21:49:10.0635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UT5Bcq4n7STvj+GFlYo/PL4z2TY0fILvFTrgd7BSQzgioliMmE+xC4vQX/ZrLJLaIPompZPSA7MU7mVwQeWCzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4172
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22-01-26 20:27:49, Shawn Guo wrote:
> On Thu, Dec 16, 2021 at 08:48:06PM +0200, Abel Vesa wrote:
> > From: Jacky Bai <ping.bai@nxp.com>
> > 
> > The i.MX8DXL is a device targeting the automotive and industrial
> > market segments. The flexibility of the architecture allows for
> > use in a wide variety of general embedded applications. The chip
> > is designed to achieve both high performance and low power consumption.
> > The chip relies on the power efficient dual (2x) Cortex-A35 cluster.
> > 
> > Add the reserved memory node property for dsp reserved memory,
> > the wakeup-irq property for SCU node, the imx ion, the rpmsg and the
> 
> Not sure what "ion" is.
> 

Nevermind, the commit message was not updated after the imx ion was
dropped from NXP's internal tree. I'll update the commit message in the
next version.

> > cm4 rproc support.
> > 
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8dxl.dtsi | 245 +++++++++++++++++++++
> >  1 file changed, 245 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
> > new file mode 100644
> > index 000000000000..f16f88882c39
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
> > @@ -0,0 +1,245 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2019-2021 NXP
> > + */
> > +
> > +#include <dt-bindings/clock/imx8-clock.h>
> > +#include <dt-bindings/firmware/imx/rsrc.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/pinctrl/pads-imx8dxl.h>
> > +#include <dt-bindings/thermal/thermal.h>
> > +
> > +/ {
> > +	interrupt-parent = <&gic>;
> > +	#address-cells = <2>;
> > +	#size-cells = <2>;
> > +
> > +	aliases {
> > +		ethernet0 = &fec1;
> > +		ethernet1 = &eqos;
> > +		gpio0 = &lsio_gpio0;
> > +		gpio1 = &lsio_gpio1;
> > +		gpio2 = &lsio_gpio2;
> > +		gpio3 = &lsio_gpio3;
> > +		gpio4 = &lsio_gpio4;
> > +		gpio5 = &lsio_gpio5;
> > +		gpio6 = &lsio_gpio6;
> > +		gpio7 = &lsio_gpio7;
> > +		i2c2 = &i2c2;
> > +		i2c3 = &i2c3;
> > +		mmc0 = &usdhc1;
> > +		mmc1 = &usdhc2;
> > +		mu1 = &lsio_mu1;
> > +		serial0 = &lpuart0;
> > +		serial1 = &lpuart1;
> > +		serial2 = &lpuart2;
> > +		serial3 = &lpuart3;
> > +	};
> > +
> > +	cpus: cpus {
> > +		#address-cells = <2>;
> > +		#size-cells = <0>;
> > +
> > +		/* We have 1 clusters with 2 Cortex-A35 cores */
> 
> s/clusters/cluster
> 

Fixed in the next version.

> > +		A35_0: cpu@0 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a35";
> > +			reg = <0x0 0x0>;
> > +			enable-method = "psci";
> > +			next-level-cache = <&A35_L2>;
> > +			clocks = <&clk IMX_SC_R_A35 IMX_SC_PM_CLK_CPU>;
> > +			#cooling-cells = <2>;
> > +			operating-points-v2 = <&a35_opp_table>;
> > +		};
> > +
> > +		A35_1: cpu@1 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a35";
> > +			reg = <0x0 0x1>;
> > +			enable-method = "psci";
> > +			next-level-cache = <&A35_L2>;
> > +			clocks = <&clk IMX_SC_R_A35 IMX_SC_PM_CLK_CPU>;
> > +			#cooling-cells = <2>;
> > +			operating-points-v2 = <&a35_opp_table>;
> > +		};
> > +
> > +		A35_L2: l2-cache0 {
> > +			compatible = "cache";
> > +		};
> > +	};
> > +
> > +	a35_opp_table: opp-table {
> > +		compatible = "operating-points-v2";
> > +		opp-shared;
> > +
> > +		opp-900000000 {
> > +			opp-hz = /bits/ 64 <900000000>;
> > +			opp-microvolt = <1000000>;
> > +			clock-latency-ns = <150000>;
> > +		};
> > +
> > +		opp-1200000000 {
> > +			opp-hz = /bits/ 64 <1200000000>;
> > +			opp-microvolt = <1100000>;
> > +			clock-latency-ns = <150000>;
> > +			opp-suspend;
> > +		};
> > +	};
> > +
> > +	reserved-memory {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +
> > +		dsp_reserved: dsp@92400000 {
> > +			reg = <0 0x92400000 0 0x2000000>;
> > +			no-map;
> > +		};
> > +	};
> > +
> > +	gic: interrupt-controller@51a00000 {
> > +		compatible = "arm,gic-v3";
> > +		reg = <0x0 0x51a00000 0 0x10000>, /* GIC Dist */
> > +		      <0x0 0x51b00000 0 0xc0000>; /* GICR (RD_base + SGI_base) */
> > +		#interrupt-cells = <3>;
> > +		interrupt-controller;
> > +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +	};
> > +
> > +	pmu {
> > +		compatible = "arm,armv8-pmuv3";
> > +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > +	};
> > +
> > +	psci {
> > +		compatible = "arm,psci-1.0";
> > +		method = "smc";
> > +	};
> > +
> > +	scu {
> > +		compatible = "fsl,imx-scu";
> > +		mbox-names = "tx0",
> > +			     "rx0",
> > +			     "gip3";
> > +		mboxes = <&lsio_mu1 0 0
> > +			  &lsio_mu1 1 0
> > +			  &lsio_mu1 3 3>;
> > +
> > +		pd: imx8dxl-pd {
> > +			compatible = "fsl,imx8dxl-scu-pd", "fsl,scu-pd";
> > +			#power-domain-cells = <1>;
> > +		};
> > +
> > +		clk: clock-controller {
> > +			compatible = "fsl,imx8dxl-clk", "fsl,scu-clk";
> > +			#clock-cells = <2>;
> > +			clocks = <&xtal32k &xtal24m>;
> > +			clock-names = "xtal_32KHz", "xtal_24Mhz";
> > +		};
> > +
> > +		iomuxc: pinctrl {
> > +			compatible = "fsl,imx8dxl-iomuxc";
> > +		};
> > +
> > +		ocotp: imx8qx-ocotp {
> > +			compatible = "fsl,imx8dxl-scu-ocotp", "fsl,imx8qxp-scu-ocotp";
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +
> > +			fec_mac0: mac@2c4 {
> > +				reg = <0x2c4 6>;
> > +			};
> > +
> > +			fec_mac1: mac@2c6 {
> > +				reg = <0x2c6 6>;
> > +			};
> > +		};
> > +
> > +		watchdog {
> > +			compatible = "fsl,imx-sc-wdt";
> > +			timeout-sec = <60>;
> > +		};
> > +
> > +		tsens: thermal-sensor {
> > +			compatible = "fsl,imx-sc-thermal";
> > +			#thermal-sensor-cells = <1>;
> > +		};
> > +	};
> > +
> > +	timer {
> > +		compatible = "arm,armv8-timer";
> > +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* Physical Secure */
> > +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Physical Non-Secure */
> > +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virtual */
> > +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hypervisor */
> > +	};
> > +
> > +	thermal_zones: thermal-zones {
> > +		cpu-thermal0 {
> > +			polling-delay-passive = <250>;
> > +			polling-delay = <2000>;
> > +			thermal-sensors = <&tsens IMX_SC_R_SYSTEM>;
> > +
> > +			trips {
> > +				cpu_alert0: trip0 {
> > +					temperature = <107000>;
> > +					hysteresis = <2000>;
> > +					type = "passive";
> > +				};
> 
> Have a newline between nodes.
> 

Fixed in the next version.

> > +				cpu_crit0: trip1 {
> > +					temperature = <127000>;
> > +					hysteresis = <2000>;
> > +					type = "critical";
> > +				};
> > +			};
> > +			cooling-maps {
> > +				map0 {
> > +					trip = <&cpu_alert0>;
> > +					cooling-device =
> > +					<&A35_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +					<&A35_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +	clk_dummy: clock-dummy {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <0>;
> > +		clock-output-names = "clk_dummy";
> > +	};
> 
> Why do we need this?
> 


The following comment is found in imx8dxl-ss-conn.dtsi:

/*
 * usbotg1 and usbotg2 share one clcok
 * scfw disable clock access and keep it always on
 * in case other core (M4) use one of these.
 */

So I guess it is basically a hack to allow both usbotg instances
to have a shared clock, while the clock is handled by the
SCU.

Also, the venndor tree seems to be making use of this dummy clock
in a lot of dts nodes. Even on QXP and QM.

> Shawn
> 
> > +
> > +	xtal32k: clock-xtal32k {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <32768>;
> > +		clock-output-names = "xtal_32KHz";
> > +	};
> > +
> > +	xtal24m: clock-xtal24m {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <24000000>;
> > +		clock-output-names = "xtal_24MHz";
> > +	};
> > +
> > +	sc_pwrkey: sc-powerkey {
> > +		compatible = "fsl,imx8-pwrkey";
> > +		linux,keycode = <KEY_POWER>;
> > +		wakeup-source;
> > +	};
> > +
> > +	/* sorted in register address */
> > +	#include "imx8-ss-adma.dtsi"
> > +	#include "imx8-ss-conn.dtsi"
> > +	#include "imx8-ss-ddr.dtsi"
> > +	#include "imx8-ss-lsio.dtsi"
> > +};
> > +
> > +#include "imx8dxl-ss-adma.dtsi"
> > +#include "imx8dxl-ss-conn.dtsi"
> > +#include "imx8dxl-ss-lsio.dtsi"
> > +#include "imx8dxl-ss-ddr.dtsi"
> > -- 
> > 2.31.1
> >
