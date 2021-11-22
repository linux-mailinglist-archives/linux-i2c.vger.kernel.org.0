Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFBB2459350
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Nov 2021 17:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240355AbhKVQtF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Nov 2021 11:49:05 -0500
Received: from mail-eopbgr150087.outbound.protection.outlook.com ([40.107.15.87]:10990
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238465AbhKVQtD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Nov 2021 11:49:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGO9PXPKH5wR5SZKgEXyZCX/A5DLAnU+SsvwbaPnlGy5Q77s8RMjxLhKX+QgsT11uqn2IxKVh6ayFyfk/1nHH1NnbCj3eIZWMPrprCc6LZ/eJMnxrOBhJ08OzRI6cWf3cAGKIJx58SSIA9twRL//yek75p6224JpCl//ed2n0qDC34teORNF2A28m91hbyYSbmQzyy5Ml6Ji6i+NeeARbUa7I1SGUuvrQI7nbHekpqLvqJGxF3q6i3VlJG8LKsimvz7oGojJ0SZRXj8ZrAIWv47nW/IDvmdVSfootO/IIvrpvtJGD67NRccKGn/2dNcvSk4rXSEK8/2Ti5rs+drlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/lC1fR2uNKOYvXNE/PaO6x1eV6eIgNAfVhhRa4s5Rw=;
 b=KlyUpJDA8CPGj7kC7ENfVAuIht+OCPGpslY96Rdlu7ilH6uUcFC8hYPMiYPj88BX/qRxxDrTA+OQZQ54GCsORPh5VGnPoKOlWiAaAobCin09AeK9OFuNNPvfI/HTUzb4SaI0sALVCht+FU16RwtbR6qdQWsT5usvST3nw9WTvvdwe1+VP5br79j27eoGTYGpNR95A26KTvuDivaoYwM8Qr1MEoKSoQT7Ja5RU7N9E+sCGq/XLN4ci8DwkmXvcJnVQSpr071efB+3Zslwk8fK04alcH0vfYnZ7o9VcBLOl18HEfxYHSDe0gHNdd7uZrF5ibIZUYQ/trlRXn/pzeSaJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/lC1fR2uNKOYvXNE/PaO6x1eV6eIgNAfVhhRa4s5Rw=;
 b=mXJU0jCSqkACwFgGZG8w3Y4R/p36mpdNlKZ3dXtZ9hDbthuEMM55CyBiBsRjiqHC2iUE54Wq7MZqouZCMGxTBhw2Tivq4meQjeIkkr1e/HKQkJrNoTPr+U7s4hHMRBvZ8VH5lhM9JLuEzFHq2OX64AXV6bO7SGqA3pvSCzpIf2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VI1PR04MB5294.eurprd04.prod.outlook.com (2603:10a6:803:5a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Mon, 22 Nov
 2021 16:45:54 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::d0eb:49aa:2a9:9fc4]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::d0eb:49aa:2a9:9fc4%4]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 16:45:54 +0000
Date:   Mon, 22 Nov 2021 18:45:51 +0200
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
Subject: Re: (EXT) Re: [PATCH v4 12/12] dt-bindings: serial: fsl-lpuart: Add
 i.MX8DXL compatible
Message-ID: <YZvJP2ISfc/zyK+4@ryzen>
References: <1636566415-22750-1-git-send-email-abel.vesa@nxp.com>
 <1636566415-22750-13-git-send-email-abel.vesa@nxp.com>
 <YZb4BClv4fXU65yz@robh.at.kernel.org>
 <000f8f724ef9a8c2652e9cab0a5bb1f7768869c3.camel@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000f8f724ef9a8c2652e9cab0a5bb1f7768869c3.camel@ew.tq-group.com>
X-ClientProxiedBy: VI1PR08CA0203.eurprd08.prod.outlook.com
 (2603:10a6:800:d2::33) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
Received: from ryzen (5.12.226.136) by VI1PR08CA0203.eurprd08.prod.outlook.com (2603:10a6:800:d2::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend Transport; Mon, 22 Nov 2021 16:45:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63929ca7-95da-42af-3a27-08d9add78c87
X-MS-TrafficTypeDiagnostic: VI1PR04MB5294:
X-Microsoft-Antispam-PRVS: <VI1PR04MB5294BBF779F49CFAE33168DBF69F9@VI1PR04MB5294.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VC1xHMaddZOUx1GW62H+jBeXHXIvZ37smZG2Z3ygPTEdBi0g5My8/jveCHHDbWB0SAJr95OLyRlanqw9mb/Kcm2MQNroq2iPp4ukcIxgQhPh7zqMqNy7lInoiYbk/TfOeacuW1ZNd8mI3aK/MKfeNXzmWvvIMlJuX99q+NndK9y6jWQ0QIcBdPllCUP32UnAPoyJLL0X/YJVgCdccPZ4T1z+OHMk1MGs20gyOQQ1tC4Fqkztx0NQtCl0HxHYiW2IRUtHZrjRUpcjBiYg7I0U8isaUZWnWKTSPvSW9BR0rfNq3TK9lpkUTpF2i5CzKSGywSlOtaJL4foBF5o6Ve6N8mGsqboTk2aP8Cel2DHGWQRbgfUvkKQBVuujD3xPpefsGtypPKjDMU3l6DpVZ/DT9C2yISSfVyPNVlIEmopPpyXndLsae/hxJq9wJXO4dnmLyo0OS+BRaN3XKdO0eJbwo8qdoH+n5avZNMkKGXLtgTs8y/f22xdm7vGy9131tJghd2YwW22MtjD1q6bxvxT8UcCmgJOuJHx0705zpipZuEmL16qThlwbJoSue8eD9yZ06QgnhP2sgjDoMHM0G26swXb74RjL36oA+9W1/NX8J/enG9C5LW14YTQakjGt96S3Llwyhi4KdP1SOI4kegaJtxB/F6Ca7U00b+72I3Se6r1AFmzhSgm0cfi+fbKE5IvsnMWdE70C5/0xGV140nUiircvuKB9UGshqfGWaSi2HdCnKl2O5z9HhcnpoMNr+qvRgH+fIrfDUxlNnHKJ3jmLDjRDbuFWTOoeXhRAGyf/1eUip+EGAQntGaRxm4dFLJ9bIRBpQ1BuLeSO6HbO1Xz8Xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(9576002)(6496006)(5660300002)(55016002)(6916009)(956004)(44832011)(186003)(33716001)(86362001)(54906003)(7416002)(2906002)(38350700002)(38100700002)(4326008)(8936002)(53546011)(8676002)(966005)(66556008)(66946007)(316002)(66476007)(83380400001)(9686003)(26005)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0+locVuYcSzdFud+NmTmkDhvpwNa8pAO26VnuhoT4dVdGDC3eP/HXtfSGyzz?=
 =?us-ascii?Q?dxMOmio9mDw1HCL72yMdajBStEF1x6fAgO0oLnXVM+auAhu05XaaWHVyFE76?=
 =?us-ascii?Q?LTRKOalspWM3h5TYdg+LMhHsAM1A1ZLbV9Ar5kF3MuoaxUpUsYUbf0MJ3V8e?=
 =?us-ascii?Q?SAzp/ytevWTu+FHrRisbj2gUBMvf1jjFcWxCO230zDJLHh+Bvg9lqfhrnCWp?=
 =?us-ascii?Q?aDuDq0NDTEqeuvFNorRr8Q0XrlgPKarXekvO8lreU4mL64htkf7ppW7kVukr?=
 =?us-ascii?Q?U0a2q8SresHU1GceW4z3bobBQqeruINAjHRjU1nPjgSXS9umh/EyHfDqp4BF?=
 =?us-ascii?Q?x8jDvxjhMqvfTLxzbo6E3ck0Xx2Ex1V948pJrUBps1zXDuIAcTDVJbaCNVbP?=
 =?us-ascii?Q?mBNSqQpw/gng7QRB24N0K5MvS+9ohxXJAwLZWsiyhfkhAruHhRwR6ZavKTuV?=
 =?us-ascii?Q?g3VuM6pQ3DvUsKmZTvLF9gzejbkiqvBxYRVPX5lBQohzsIcGS/T4QGPvN/CT?=
 =?us-ascii?Q?nYoqlHOmG+Pl5YCxZAO44vWctH2Oh41UU5WQhxEyP3SXUeSQ2YIer/lQEJLg?=
 =?us-ascii?Q?hJoWypY0NKWeELCwBY80lhnfd/MXXdZDk3sMGpzicFD0uCBaSdoUWlPc9i2F?=
 =?us-ascii?Q?l/eENftX/KKHMKugygDOYXJctdyjzVdFELBG65FK3gSvpKaCmNKsQATYSuG+?=
 =?us-ascii?Q?jJlEE0XpeSVKxRM2PNOIGNy9OyD6gd0rvP0anseavhYVRyqwF0EDxafWX54Q?=
 =?us-ascii?Q?W4PaBMiw0Cdd9u/teuKKBS6n3xtes9FQOM4CAe4q0VjzJJFj/e/i7ONJ4tGS?=
 =?us-ascii?Q?eg+ug/2+L2CcEP5SCxWo+FFAi0QFimRByJMIW2ZoWZaDGDOUgYeeScdKSp3x?=
 =?us-ascii?Q?i08STjH6BjwamYWyyIM8T42uZMlQIgiAGLTcQw0UmYpmEt36gulvmSpC20un?=
 =?us-ascii?Q?x3C3+M/P6bnw2d1eeL84AyTIJNhNIqfpXmSF/DkNdPgoHxUYjYkUQX6vE+dG?=
 =?us-ascii?Q?Hvr8YieaGHncN0Yke9EC/M5G3sykou8S/OAb1uMdJ7AsUdgLudqxRT+qvMpw?=
 =?us-ascii?Q?iJOnQGNq/cDVVJIbJCDCqTz4ZwfMcIHqKOgK1+rgmHLaUhsspZdlhPeiIi5v?=
 =?us-ascii?Q?vPtEGDT2hNse+tlU05klzIGjcv3WJeKeqhVGmrNb7rAfsGnNo7k20MV6GZy0?=
 =?us-ascii?Q?/Vg9D3k3vDhVD1pZAP6PL+aDUfG1Y8Tq0HBmY05sMcNA96hZmxYvLbs1lkKm?=
 =?us-ascii?Q?Q2ew9v80PwLr77Ej6P1K71tLJmYantT+BKj/S1L4LUBkeZvSkrUQWmqyWyf3?=
 =?us-ascii?Q?QrtzVE67tDQufbrVKxZDi//fPQ85tjfhBukdy5t6Q1fXY+7+xBre+cbYRvJM?=
 =?us-ascii?Q?C6SLWN+uilqOGwEI0yHR+hDalYnzgYiAqaLELcMJFWmvX5g5OvPr9NTRjqC4?=
 =?us-ascii?Q?kwaFIthExRpB6lUuUe3lPlGwYzA9LizcU4uodlVCRqhiv/8dZp10sAluYgAY?=
 =?us-ascii?Q?tvl73st9FWE54gX45gEjiJu5AhlFJ1wJ/6NlZxf4Qq6dM5udKXNMl/kz4fPd?=
 =?us-ascii?Q?AnE/eEqOXSvcs6TXwLgoIDWIEYKAHFi9YiDcU5U2WFtwG7EC40QlMUHvdRWg?=
 =?us-ascii?Q?UkWu46ojxv/dUyDRTd0HuqI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63929ca7-95da-42af-3a27-08d9add78c87
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 16:45:53.9600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ld66k29Y7bC+44wVTejRFTmPXfUHoEM4fst4Hi/Tt8JvcHDvnh2pp9x7W5GLcM4IZh0+eAsrAghZKCreeGMlWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5294
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21-11-19 08:17:11, Alexander Stein wrote:
> Am Donnerstag, dem 18.11.2021 um 19:04 -0600 schrieb Rob Herring:
> > On Wed, Nov 10, 2021 at 07:46:55PM +0200, Abel Vesa wrote:
> > > Add i.MX8DXL lpuart compatible to the bindings documentation.
> > > 
> > > Signed-off-by: Abel Vesa <
> > > abel.vesa@nxp.com
> > > >
> > > ---
> > >  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/serial/fsl-
> > > lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-
> > > lpuart.yaml
> > > index dc1f0e07cbd4..fa8a602ccb22 100644
> > > --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > > +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > > @@ -27,6 +27,10 @@ properties:
> > >        - items:
> > >            - const: fsl,imx8qm-lpuart
> > >            - const: fsl,imx8qxp-lpuart
> > > +      - items:
> > > +          - const: fsl,imx8dxl-lpuart
> > > +          - const: fsl,imx8qxp-lpuart
> > > +          - const: fsl,imx7ulp-lpuart
> > 
> > I'm confused why 8dxl is compatible with 7ulp, but 8qm is not? From
> > the 
> > driver, it looks like the difference is clocks.
> 
> There is a difference between 8qm and 7ulp regarding the clocks. Are
> they still considered compatible? Depending on the answer [1] might not
> be the correct solution for earlycon regression on 8qm.
> 

In NXP's tree, they are not compatible.

See here:

https://source.codeaurora.org/external/imx/linux-imx/tree/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi?h=lf-5.10.y#n9

> Best regards,
> Alexander
> 
> [1] 
> http://lists.infradead.org/pipermail/linux-arm-kernel/2021-November/696770.html
> 
>
