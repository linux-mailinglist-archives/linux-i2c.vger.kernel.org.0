Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7932845DB04
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 14:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355192AbhKYNZB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 08:25:01 -0500
Received: from mail-eopbgr00062.outbound.protection.outlook.com ([40.107.0.62]:22369
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1355256AbhKYNXA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Nov 2021 08:23:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmfCZmZsjfRKiqMxpOt8Xp4uC7OytBIbT7vq/0d3GGxPU9CVzEwDtlxVslQ4Q/IhJANzEt6VF6CdFa9SGqlPWRTU1n+6332zT7STTTSrqBA5p2a+B+YZ5ckiXjcU0yG7Upr9hVtwd1ijw65Vq6gL33cbXixWbaEIsEUrTgHW0Rw2NlcWxQvLwOcY+fYsw38qOsKblyr5FLnfMZ3ufvihRW0wxUD92wH001Yz718243IpCdfj6k/hqsBRXXkQvRFNERCk0OLFEoU0Sa2eI1AOiRnuaTpR+r+32S4diDdYDWjj3ZFppPnwi3hb9pSWRSF1Mev9NZgXoTryM+Ev4LBP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2Nt03oPuirufGITdbUmtK37f9GQsAFcXJ/oMsEne8o=;
 b=Ch0lKX+iCHSx8QeCXk+Ega4MWGlwVyciGh2z8yOrcraIfQkPzhiTD4VRWbCvnyyx+4z1YW4ElGdPhf+/HEbEDQckHAuFxkZXzDWCkwCwV+pYthiSvVEVrY1vKdY1uNo22Cy6qkDa2wMFTx0vXFO0u8iJhq+WCSVLDryttY8x/sJj6+8qpbiOMvgUGN+AQjdw59j+B79mjTwpu99/GOlDKbixUgnTcsUKVyAWXZk+F2tJkvhenzQkI2y86POhdc96ndSjCXpUzvXQXA0qoDBHLPimKFs8lcd59W4nMFfY+cIOFKdFESkQ4M929ln2TfmjdYX2iA2aWZ8T2LC7Gn6AKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2Nt03oPuirufGITdbUmtK37f9GQsAFcXJ/oMsEne8o=;
 b=Ivoenar0VsoaapeLVHnJRk93bh15drSitaZo0vBbKeOXSvtb+BAeunSVkhg6xpDOh9sDg0Cwr+p6fAJfaRDo/77SnFIa9xbbZucMCzxpp//MkHqbjYhs1Yle5MZeAHAmViXf/i6RLo0vBSU0Uy2e/tVlJycd+rMdBtV9t62in5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VI1PR0402MB2864.eurprd04.prod.outlook.com (2603:10a6:800:b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Thu, 25 Nov
 2021 13:19:46 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::d0eb:49aa:2a9:9fc4]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::d0eb:49aa:2a9:9fc4%4]) with mapi id 15.20.4713.027; Thu, 25 Nov 2021
 13:19:46 +0000
Date:   Thu, 25 Nov 2021 15:19:43 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Rob Herring <robh@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: (EXT) Re: (EXT) Re: [PATCH v4 12/12] dt-bindings: serial:
 fsl-lpuart: Add i.MX8DXL compatible
Message-ID: <YZ+Nb8vyH/8P5FoF@ryzen>
References: <1636566415-22750-1-git-send-email-abel.vesa@nxp.com>
 <1636566415-22750-13-git-send-email-abel.vesa@nxp.com>
 <YZb4BClv4fXU65yz@robh.at.kernel.org>
 <000f8f724ef9a8c2652e9cab0a5bb1f7768869c3.camel@ew.tq-group.com>
 <YZvJP2ISfc/zyK+4@ryzen>
 <c3fd087edb757a453bc2a2d745f813e834ccf08e.camel@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3fd087edb757a453bc2a2d745f813e834ccf08e.camel@ew.tq-group.com>
X-ClientProxiedBy: VI1P189CA0024.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::37) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
Received: from ryzen (5.12.226.136) by VI1P189CA0024.EURP189.PROD.OUTLOOK.COM (2603:10a6:802:2a::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend Transport; Thu, 25 Nov 2021 13:19:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90a387d7-678e-49ab-c7bc-08d9b0163ffe
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2864:
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2864AE1E7181ADB7849643DDF6629@VI1PR0402MB2864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:597;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JEJOCA4zowjyHI1lyj/Y/Wnpm9s6GloORT+XC5YRcoUK0ydRvelQxRfnDwHS96F76FkdGG+ZkXLm9ujxQmT8tY5kK9NK3LYAijymKFwQUhSy/Y5BE1sTDVjbTWFoIny0l9XairpNDkrUvxyVmyl2vm5pcBBkbv/RtFL+Vgo4u7ppcN1PO0qFkBxjlohicR1GfFo7gu9SqEelADu1AvTpr3riQbWmNGMKZ5FVrq0FpyB5GBXuGL/xv+3RNVzVl6/6CykYbGkZS01uA5Jf2OZMeC4qUMUFrayO3XLQMJnsEwVTkstsSims0HR6Yvq0QJdtXDqsGCRwN2nR6+qfHhJbgHDL2Q6Q9xsS6vmCJ4K62H0TF88lCk22gA61BU/GfDcvhFTjc+LM93Akk9hWVedfQpsxibv/pd4AGEVb09vJv0dWMlow1euUAy13vel6n/MPNTcFlpSvgpITEUPn+zym6jHVPhTBBK0hviaW/TBDfiSOVtPll3t2Jqbe/fxPCSm3cIRQHBTMpfsaWuGDtUPpiHiViVogsAGlQUe8qjGqW/y3lhR3F3xNr5VcqfwJwIj1IVNh57lCccsURArJLUoaKLgGl/VBlm0Ng3M706OswoHeM3TE0VFAQ4MOA8DmVdW9o524Zl6y87xSx0gO1W19r9lqesQoucsH9hBU/SeAKqqzB5qUilfgIaazjXTpTvQ/cGBjqFhrmD8fTWJ6Ubi9ZR+ghBMW5AeU+UY1ZR3yB7W3cnqcULZ2r6hoSzSo23pJMrcYI+9CfqtqaIKIeXM1RtJdy4V4BLXH2grgugvLwNKkvEJrEFYQ/AzZZz9npcZ2Cze2Mi4Oxa8a6DFavb7juw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6496006)(956004)(4326008)(52116002)(186003)(9686003)(33716001)(54906003)(8936002)(2906002)(44832011)(53546011)(38100700002)(66556008)(26005)(5660300002)(508600001)(316002)(7416002)(6916009)(66946007)(55016003)(8676002)(966005)(66476007)(86362001)(83380400001)(9576002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pbw55g2OlQH5Na83yv8Y4Hf/GJ5i6x+6p/WD8wRxf9EB7aggObCmt0OFdy/z?=
 =?us-ascii?Q?y0TUlNCL8S2cRuj+dIlA4ct4P8OcBqBHLF5N3lKiZ1+sknC5cUsXr1wqehAX?=
 =?us-ascii?Q?gCPQ/llu5uZ1lJ7/qthmqfouq4A9+m3hN+Gcu+iOdm3q5zjH39bzNOYN0zwD?=
 =?us-ascii?Q?sGfLkPb3vLGBpmp4ZfcEjuAFgGwj26ZsK5m5tVT97aOchDxe4mWr0OSX4nZc?=
 =?us-ascii?Q?DTqoZOzxsAGJvMEmfNRyTiidnLLr+ddFNb4KUKxPXXMlsNrUcUCHRS89Sly9?=
 =?us-ascii?Q?52+SnmgKX92nXxo0kn/t7cdQeQTrztQXakZTpSlRpJCMnJqUw4PPUSntME7o?=
 =?us-ascii?Q?WwTNW/NXwB4kbASOqObfLoUffiwPefjL5Y/+KU4dLykJyaOCyrh+TJqad0Zi?=
 =?us-ascii?Q?1HxWoKXO8HRv/AiTjoODKghM5b92IH9jEdvN0qZxPGTEwgepKCjxREO1j/54?=
 =?us-ascii?Q?xUPoTbDRjrUykC+ACrOI9N/CkCz+ERC0NhECRY5nACGHocM6/uk5VpAPwprK?=
 =?us-ascii?Q?iWKwHSDtDG8XR5MYJtJysc3wjFV1Egq3P2qqmvnUwqCH1aAWO3EUVu2TEtMo?=
 =?us-ascii?Q?bdhPxnJrJ03OtALm+vaZNkd7L0sBN8uAPpTTQag0fhY7wBB6lhxXp93L+qMM?=
 =?us-ascii?Q?k6uWLplqvjFoUb7HCJxYMMWpXp37aNb4+rkAzrFBmkFOg/Gt2p80O2pCoIHa?=
 =?us-ascii?Q?ZhMRMbofuArCeuWlemkOqQ1Kt7Pnzr3wNplxcUgAAuizmDKT+WMMqz6lrk8w?=
 =?us-ascii?Q?eOmWuXWya/qGgQAB+P+m0yn+zRWsgMGkP9f8eEZnV7JHjoorkWoeB0payErK?=
 =?us-ascii?Q?+M9UxnPFKr5vc8XB3pjkKrs1M3hVGHU3OwKaosrNTNCmYpgVsr03YS750mNQ?=
 =?us-ascii?Q?DGppeqwanf4IWoDAzvA0ru01to8r7Xknzf7Y1SYxsdfJiy5LPP1QOtW8CgSJ?=
 =?us-ascii?Q?MrjdY7MZbBVf0VEP0Vv2b5ax5qCYSesWLlMS3oLjcBv9hrJJ7fQjQK4aLJlE?=
 =?us-ascii?Q?/I/yYp+OHX3gwWBGJMsWk5q9tjVDzS43YKtpd0VRrZsBkg9L8Sanx5mm0yRI?=
 =?us-ascii?Q?kKR/qqkiTMozzxrzp0ztJH8tPPA2fhzLVPYWVHerdA2tZ5hOCEU7AygOoOFT?=
 =?us-ascii?Q?uPx5izLQdoxkK+S95uUHWQepOR78zELvgiHza2aq7TtITz2tJP7mCLRZ6g56?=
 =?us-ascii?Q?uAE8AxIpRSUofhfQttr7jLjvQWV3K6B1OVIMSxCQx2o+B+J5h7pr6NJgbKRs?=
 =?us-ascii?Q?E3LhBDWrqnDeBhXpoq0VcRnBDcYOofacXRjR010bxQSkaOJkfjhmltCDAwM2?=
 =?us-ascii?Q?znjsjxbW+EkTpNUVMR9F/3V4ff1Ro7psjIfCgOffE6R85ZTjG6cz+mH8T+wO?=
 =?us-ascii?Q?zTfhLXrYBCVtGuFCgaGuSmsq080tXXt1Ab/TBfLqBOQEJ2HSw3x2QX9czooJ?=
 =?us-ascii?Q?fIBcoKm9Dxyo0ek8Xt5txfcGqADoP3Uk5zRJ6AVyHnjxspvr3YYsdEeEMm7X?=
 =?us-ascii?Q?sBtbJANHOGz7CYpVlaJ/BYkBeW8WDFj+YYwKualvG7rG+GTFDxMlnzTDNSnG?=
 =?us-ascii?Q?pIfIBQZcLEQ1hFrrIPSoX3pUiTilymymx8lVgWCN6Dutn0Pjn9fLG4YfRK27?=
 =?us-ascii?Q?QO6XLa/6LZ3bCI1u9nRoQYs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a387d7-678e-49ab-c7bc-08d9b0163ffe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 13:19:46.1485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOs5D90naHBDb38+BsFQGjKierlyAZcE6qNb3IcUjSwvmb5gzxb3s3c7580Efh8C46SxC83Cqr0Q0IV5NPbsbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2864
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21-11-23 08:30:17, Alexander Stein wrote:
> Am Montag, dem 22.11.2021 um 18:45 +0200 schrieb Abel Vesa:
> > On 21-11-19 08:17:11, Alexander Stein wrote:
> > > Am Donnerstag, dem 18.11.2021 um 19:04 -0600 schrieb Rob Herring:
> > > > On Wed, Nov 10, 2021 at 07:46:55PM +0200, Abel Vesa wrote:
> > > > > Add i.MX8DXL lpuart compatible to the bindings documentation.
> > > > > 
> > > > > Signed-off-by: Abel Vesa <
> > > > > abel.vesa@nxp.com
> > > > > 
> > > > > 
> > > > > ---
> > > > >  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 4
> > > > > ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/serial/fsl-
> > > > > lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-
> > > > > lpuart.yaml
> > > > > index dc1f0e07cbd4..fa8a602ccb22 100644
> > > > > --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > > > > +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > > > > @@ -27,6 +27,10 @@ properties:
> > > > >        - items:
> > > > >            - const: fsl,imx8qm-lpuart
> > > > >            - const: fsl,imx8qxp-lpuart
> > > > > +      - items:
> > > > > +          - const: fsl,imx8dxl-lpuart
> > > > > +          - const: fsl,imx8qxp-lpuart
> > > > > +          - const: fsl,imx7ulp-lpuart
> > > > 
> > > > I'm confused why 8dxl is compatible with 7ulp, but 8qm is not?
> > > > From
> > > > the 
> > > > driver, it looks like the difference is clocks.
> > > 
> > > There is a difference between 8qm and 7ulp regarding the clocks.
> > > Are
> > > they still considered compatible? Depending on the answer [1] might
> > > not
> > > be the correct solution for earlycon regression on 8qm.
> > > 
> > 
> > In NXP's tree, they are not compatible.
> > 
> > See here:
> > 
> > https://source.codeaurora.org/external/imx/linux-imx/tree/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi?h=lf-5.10.y#n9
> 
> Well, commit 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b4b844930f27bf7019c0bbd8cc575dde32e00ecc
>  says otherwise.
> This might be true for earlycon only, because clocks should be setup
> already.
> 
> Together with your other mail regarding the imx7ulp fixup,
> commit b4b844930f27bf7019c0bbd8cc575dde32e00ecc should just be reverted
> in order to get earlycon running again on imx8qm and imx8qxp, IMHO.
> 

I think you're right, the commit b4b844930f27bf7019c should be reverted.

You can send the revert yourself, if you want. If not, let me know.

> Best regards,
> Alexander
> 
>
