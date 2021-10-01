Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE18141E8E3
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Oct 2021 10:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhJAISw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Oct 2021 04:18:52 -0400
Received: from mail-vi1eur05on2084.outbound.protection.outlook.com ([40.107.21.84]:12770
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229829AbhJAISv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 1 Oct 2021 04:18:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ef+OZklC+oXVNoCUrQ4+N+gtL6bRE4aPLJdptOWv/IVN1gfl8qxOh+djErnBMIS6skxEUcL/Fc17PstKf7vEH5fw6d+mUEzWCo16NdNww6WQuktDZBdFQv/+M/DN06MexcluP/RfYfDBDqzJZDqxobpzeZoVNP6YUC2pF+BhFsOJLz+gs3vfaWcWiKdeqoH6ple0dYePIUOnjZ6GjGV76/MSsF45eZsgOSpBGN646utuIMYBPxjwI24YtA/30ss25N9YlynDggiMYmEmxFzCGV01Rk2rrgmnJOY2iD5duWRK2vaNwIYsVs/Cdlbp/O/APof6rguuFeJaVsbNe4UCsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sjqKEzYDdzQJAYlkwqtf3AeJ7ejazDXByhVx+1dDMM=;
 b=JlugHZgQkb12QqTmqVUCAeEK2LzUg3Z0SipAGIASIo1tod6tFj/dp7Gd+6fXxv+9Yp8iFw88C/CgkGuF7ow/o5LZ4RlHrVoBxIvLtb3wOkGav/SnkG/yK3BRoFg5go9NNPZojLI7RLYlKwdEj8RN9rUpu/FCW/BZXca0oO8YMaYZX+WxamVTNlISCS3V4plDViSTskGh5TlJK0PwNyI/VrX83LPIftxoVT+Sig6auhwoKPJtRQgZKQjxNepnCrC7UdBxZ826Ax9ZUMi3+VieAenfHD7Q25UQvmSRVneOvk8jORIR1KhotwUsGoB1nqH/QE2z9MdkX9wgdcBgUbyz8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sjqKEzYDdzQJAYlkwqtf3AeJ7ejazDXByhVx+1dDMM=;
 b=m0KDOXKkfb+xwcV3zVdp+y7a7Bmc0RxJLVOckjHoJ3IC/P818mg+llSyMkhCsdVJn/DhbCgSjRSa4R/j1gYTf2VcN42QgOFgL6LqIQc/m9Y58OIgIOptWKz9rH6689bkrBjsgy00LnrGbSHEiURedlKSLmlqd9k8YaQXPJ/O3ek=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR04MB6239.eurprd04.prod.outlook.com (2603:10a6:803:fd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 1 Oct
 2021 08:17:04 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb%10]) with mapi id 15.20.4544.022; Fri, 1 Oct 2021
 08:17:04 +0000
Date:   Fri, 1 Oct 2021 11:17:02 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 00/11] arm64: dts: Add i.MX8DXL initial support
Message-ID: <YVbD/kSR8lxqIC/Q@ryzen>
References: <1632831440-5880-1-git-send-email-abel.vesa@nxp.com>
 <CAL_JsqLQwdSZLLaL1A=MsHFA7A3iy0XvJbEzja+pdEyNrTboDA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLQwdSZLLaL1A=MsHFA7A3iy0XvJbEzja+pdEyNrTboDA@mail.gmail.com>
X-ClientProxiedBy: VI1PR0202CA0004.eurprd02.prod.outlook.com
 (2603:10a6:803:14::17) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
Received: from ryzen (86.121.85.242) by VI1PR0202CA0004.eurprd02.prod.outlook.com (2603:10a6:803:14::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend Transport; Fri, 1 Oct 2021 08:17:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37939aaf-44cd-4c57-4d20-08d984b3da24
X-MS-TrafficTypeDiagnostic: VI1PR04MB6239:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6239DD7EDBF14DC3F1F953E1F6AB9@VI1PR04MB6239.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:517;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UwmhrBG2/+cO2tWx67TymmBCirkZiTGQQEuZuPlGco7uH1w6DuRRylMt2DwcqzlwuqOySu9x+156NK/ovRjUAGO1QokTvOThe5AzlLp/XxoRdXurK5a5gjp4EkTazwlko2aFizGSJytzXG9ZPACNFs2bF4UYoSqwy29+3zGMJ6j+9MUipZpNeE9e8NmKgslmi8qyQ659jfcnuXkna2x7gljfMCOz6p4GILXpsylszXVNVNb96rpneuH/AHhNFIhYTYKSRqmU2AgKXMkx9mb8sHwS/SGIEzhWpTecFvlT6okxx8LhvaeZaCMS+wKGcOFZAj5bLUTxCM9pQmqQRon/JF5CD3mShX4LX6NuFNQceKzaKnSmhrq7u6LdPcUq1l3otX8F00kC4Ju/m/19DdP7qmfM2pm4LAROV4Uohwb9COWkrWMQlA4Q1ZtS8/BBE6T0ziyPGZnCEYV500EfB8Jz/vrI2VF72DkeAazjdtEYjAsJ+IUaM1vnufAHcgcklg9hUoIMBOBdc/cyn2ysSwXm4XFelAx2AgAVJGrFJbmojn5k9o1C9H21GbTwcBIpfVa58ntRgXr6qCqNHmjDiTOclDPuUBsqBvVP5CLIsOljEVhe8k0FGk2hnq3Xkj96wBQMG8I+YyZXFNyr4Pw0VAX8TyMgxOy0pw0Nki/ViqZoKH2Ucp04hxA2rV4gcCe52bkUHjP2vV17Qy/8BleoZJclCR5vGsZ9AMfdRnEVBOJV3jsT+9EO6f0Byq61lmDpCdvTl5FsFZczKdIOALZgxWYmmEF4TmBZjxJjkGt76+0jETM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(4326008)(7416002)(9576002)(52116002)(38100700002)(38350700002)(2906002)(8676002)(83380400001)(66946007)(8936002)(6496006)(86362001)(66556008)(66476007)(26005)(316002)(186003)(55016002)(5660300002)(966005)(508600001)(33716001)(44832011)(53546011)(54906003)(9686003)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jESwIiiPD6otVeycO0N1ULK8NzISuOwEsqF6B5cvtyi452onD02XVkB/aIXJ?=
 =?us-ascii?Q?9e+In6PYEzAq4loFQxIbq74EdzOb4dH/W0VthNS/dbIXDaLAoH+crSk59dlk?=
 =?us-ascii?Q?FEr03vkvwngQs89AsxcSyPMAWpjNaoiMEfi7zM25yITl7THTCvjXeVSB+zjX?=
 =?us-ascii?Q?IqQTvYPt1uoktTx2yD+8rjFn1nxkrLtjM9NeTHeXGDKSY9zqHqHgiV+3PFp+?=
 =?us-ascii?Q?bmTOndTWNmWRempc450KiDRI2NnZeyq8vxwtV63m8uRB/nQbsuAgiyNA5LKL?=
 =?us-ascii?Q?c6G1trKpvz2efNbUDfkCeundZ6VGq4KDmOgZtV2EdkR9jB19qmgKHwZ4vaOv?=
 =?us-ascii?Q?CrIQA40fqz4x3Yxas0hbQebFcgl2rFU9s22hkheEDa+3rhDiOAXgIMOL2Q/3?=
 =?us-ascii?Q?huvvfizCJM5jbq8psMrBl4j4exXd0y5LjuQHFj4c91N7zVyaOhJvYGAunE2M?=
 =?us-ascii?Q?g8FPcP7vVcunh41i26oriRtDsJAWxkGnfmrGj1yOmnwjAgAhkyojaW+4acKT?=
 =?us-ascii?Q?6UP1XQ8+CPHFP7hercawZbgHElWk+hOQ18zcTnMA3b6jafpouIPT2pX0F78P?=
 =?us-ascii?Q?Bqw24/R+tChka0yzEDzGfuM/dF2O+DINpWYUooDA2pV8NNTxi0yrnTIoL8Pu?=
 =?us-ascii?Q?M2K7xHD5OtynuGkAGA0inle5uECz/U8GTbXX0LzYiNFPzJxrJ7B7vg6QHvR4?=
 =?us-ascii?Q?ipF0LZwaMXVvqsSdX0iQZRyGRpAJcSFHj9EKxSUE0Rd0CU5xduhDt/nN548O?=
 =?us-ascii?Q?uFQGRFnLKAUG12WD0mWAFr9pU1QInFow8Yi/UFjy74ZBhg5K0UMmzJBgJmPl?=
 =?us-ascii?Q?sVA6FOR/u2yWYGYaDff9Ck2mNrqsyyDMCGL8gg813UzUJcug7jycad3N6VKP?=
 =?us-ascii?Q?Ul0wa4m84BManSjPwVlcnetEaqkJI0j+uNsggn08C6yQNA3dKmqqyq9+xcZJ?=
 =?us-ascii?Q?U4Noa68j1FK3ZESMQy8tqqBWOc5BjZPj1jAMxE86DQJG7+ueGro4QMC1l4pS?=
 =?us-ascii?Q?V8ZodpoMV7QhL8dop+g2aTpCZ5kBEzKD3EaUfDluM+yTcX+iKE3OpUfe3OMC?=
 =?us-ascii?Q?nJkuHzNr4DhbQd5srTh3t1MhkGGn1rsn1nFrlG9yk7w1X3KE1AtzA77imhJq?=
 =?us-ascii?Q?RNW38yHH/m04Z7Nd/rG4JsO8T/RQzpRIguNu2p1oE1myljInB7k2VmDHAgrf?=
 =?us-ascii?Q?ULCedh6gBO/GZDcpsh77jb8bQ1HDQwY/ha42sg868nzPzL0kGwcEIwk0KsWh?=
 =?us-ascii?Q?mi7/tLxw23uUBw7nI/On+PwGYNTSZThwufSKhq2bWLhfn03C3UmTDTwIes8E?=
 =?us-ascii?Q?farGviH4/H1SS6Hgp7P72hiE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37939aaf-44cd-4c57-4d20-08d984b3da24
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 08:17:04.4719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plx0/Vxfn1aVXhDr/2GPmq+kEuFJz4k1HW2n5nek6XjcFHXV2qQwMdh1q7gyZ4rIZHKz+ipi/pBWWfv1JM+AQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6239
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21-09-28 12:39:39, Rob Herring wrote:
> On Tue, Sep 28, 2021 at 7:17 AM Abel Vesa <abel.vesa@nxp.com> wrote:
> >
> > This allows i.MX8DXL EVK board to boot to prompt.
> >
> > Changes since v1:
> >  * added commit message for the 8th, 9th and 10th patches
> >
> > Abel Vesa (5):
> >   arm64: dts: imx8-ss-lsio: Add mu5a mailbox
> >   arm64: dts: freescale: Add adma subsystem dtsi for imx8dxl
> >   dt-bindings: fsl: scu: Add i.MX8DXL ocotp binding
> >   dt-bindings: i2c: imx-lpi2c: Add i.MX8DXL compatible match
> >   dt-bindings: serial: fsl-lpuart: Add i.MX8DXL compatible
> >
> > Jacky Bai (5):
> >   arm64: dts: freescale: Add the top level dtsi support for imx8dxl
> >   arm64: dts: freescale: Add the imx8dxl connectivity subsys dtsi
> >   arm64: dts: freescale: Add ddr subsys dtsi for imx8dxl
> >   arm64: dts: freescale: Add lsio subsys dtsi for imx8dxl
> >   arm64: dts: imx8dxl: Add i.MX8DXL evk board support
> >
> >  .../bindings/arm/freescale/fsl,scu.txt        |   3 +-
> >  .../bindings/i2c/i2c-imx-lpi2c.yaml           |   2 +
> >  .../bindings/serial/fsl-lpuart.yaml           |   1 +
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  .../boot/dts/freescale/imx8-ss-lsio.dtsi      |   7 +
> >  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 266 ++++++++++++++++++
> >  .../boot/dts/freescale/imx8dxl-ss-adma.dtsi   |  53 ++++
> >  .../boot/dts/freescale/imx8dxl-ss-conn.dtsi   | 137 +++++++++
> >  .../boot/dts/freescale/imx8dxl-ss-ddr.dtsi    |  36 +++
> >  .../boot/dts/freescale/imx8dxl-ss-lsio.dtsi   |  78 +++++
> >  arch/arm64/boot/dts/freescale/imx8dxl.dtsi    | 245 ++++++++++++++++
> >  11 files changed, 828 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-lsio.dtsi
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl.dtsi
> 
> Please resend to the DT list if you want the bindings checked and reviewed.
> 

Did resend. 

https://lore.kernel.org/lkml/1633075894-10214-1-git-send-email-abel.vesa@nxp.com/

> Rob
