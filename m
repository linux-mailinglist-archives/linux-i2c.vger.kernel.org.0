Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12592459303
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Nov 2021 17:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240251AbhKVQca (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Nov 2021 11:32:30 -0500
Received: from mail-vi1eur05on2084.outbound.protection.outlook.com ([40.107.21.84]:37665
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239597AbhKVQc3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Nov 2021 11:32:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1DN9P70UuHxpKPfQbYndCrznoUDbLuQUoNBGeKjT6Xux6DXbnQUh1QKRDibbhbTHKqlqJcWWqwGR97jpbweW/MpCIFv2cEQZpjltLnsyorX+FIn+SbqXngh2IyIa0m75MeMXM7/IJwwP2eW7Y2TFLAjaUsQ6yBR79ZrsWg4OPyJv/CWCQJOi3PNN/wd1bf9NRhpv2RKmJ88n7mj8Ig85T5aelaaKpNNlZnXh4i6M1NM4/aw21+vzhQW46x21gk0u03xkTQ+0V501KZRSrgaQYrnWxIKMPsVIHPYpEydMQgSR9eUrLosW2UGy6BA1uhirEypyaRjZ/bazJqa7x9dKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoL3CQJWTOcfVexwhtBZVMLUIsslue+cd2XrKW/mdfg=;
 b=e8nBnFEm14qOfyF9Wq3GC/W/ya6nI5RWJrq2pEQ1hNzkLeF+7Fz6jdZ3qWYtZVP++rzgVV1XB0e/p1kWcUBlhzkctlpyPjSxshFFYRB4ogb4uqEjkBnX5PsTKK3A8K2NIZno38PnYDbWz6xmp5cY4F0K7kTl5tgIWVIFIsa27ItcQDgOauENv5AUbdDI8nMmXum0cg2xoEDlzKrJuTVL5t3GnA1D1KWRaIFxfmnHOrxlt6ZkdAqIRBKXuJ4c4NZWZbyQaudNxPDdAC0TT9BJw4t5Bjz5aCgELInvGcXcXv29Yk3oi25peHxKDBcL45FfPpIbGdnFtfEG+7Nzq8k21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoL3CQJWTOcfVexwhtBZVMLUIsslue+cd2XrKW/mdfg=;
 b=LS03lNDi9hcfl28yI0EPWgcEjxikAaDVvySQCYw1KHBI+RbYGwxupnI1TuMLQb7kqwjyvcFqVWtCNHm9IXu2tUqFBQyNQq1b9KMPbO9/D546PmStA5UjAnGow99xC1gYrLNT39WqNwWONWr691wd5umjCLic0vJe0sZcT0/eF2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VI1PR04MB4912.eurprd04.prod.outlook.com (2603:10a6:803:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 16:29:19 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::d0eb:49aa:2a9:9fc4]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::d0eb:49aa:2a9:9fc4%4]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 16:29:19 +0000
Date:   Mon, 22 Nov 2021 18:29:16 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 12/12] dt-bindings: serial: fsl-lpuart: Add i.MX8DXL
 compatible
Message-ID: <YZvFXBhZT68Nj6Uj@ryzen>
References: <1636566415-22750-1-git-send-email-abel.vesa@nxp.com>
 <1636566415-22750-13-git-send-email-abel.vesa@nxp.com>
 <YZb4BClv4fXU65yz@robh.at.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZb4BClv4fXU65yz@robh.at.kernel.org>
X-ClientProxiedBy: VI1PR04CA0108.eurprd04.prod.outlook.com
 (2603:10a6:803:64::43) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
Received: from ryzen (5.12.226.136) by VI1PR04CA0108.eurprd04.prod.outlook.com (2603:10a6:803:64::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 16:29:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 498298c2-d2e0-4399-fc1d-08d9add53b5f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4912:
X-Microsoft-Antispam-PRVS: <VI1PR04MB4912D118A70962B2FD88A556F69F9@VI1PR04MB4912.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XYqUtOWjCwYyK/oQxegbEAIG+CSGpR208KkTqBL8UpUOOq1Aakt0M5GfMsp+K3KRVqhWhBwFPLvCA/Ge3xjpen7wLGZqhlOfOt7+RVQ86zx6TMe36Z4OzW1YTi7NRAlcyAfAmXbYLuHWK2mVJCqCnzBMsgfiQE1FfNX+HuCvbR8F5HS7DaQZATT2JelF1tJBGOrKhOiumMmfjwjjsPlJVkZlFylpTgGsMGqsDllL//GrDConBx+m3SNSOJEn1pXQtNv+jDNegSDbZ+KmTjYR0uUy7/HtswZnFghYUg5RqujsrGJxwprEDQo5OkX4vdVS8PAOiNS+l9gxBgPNSqiA6WClATdEXjJABfct5ccyeczvz0Q7VMbDsbJKJMhLwxXhboYWCerVjfciCMhgCTrh7bEfJF0UqRTSCWpdpyHXlSpd5IOWSeOdAFuZrA63O3cH1jSzcn4KtYDfJunQBX1NDirh+yAejY10nbEpLUYecQN+BYqLdZ9DsmaPs+aOU4zPp2TbryamgUQRY47hhx8lbJSVGeZoeSvNq+XE8HN9jaI8GCBofncTDd2yBZUZyCmFqwG2JOXqygMxlazOVrJjbZ5N7Fht/SzSvTv0KoUmVsmDPyySUNst6yywqglQej+IX/8Jsjys7Dlm2+bS41k6jW3ewVdI0/zdPWDsPjKCi/4vkkJy7J00JGAW725V8rgOvTM+B7TBQJ6sh30LLgqZtTZBYZ//x7UEc35kN5gGpM8hq9/7hJKjUxS8l7cKCbIKX3v0lCNL55fMd7XnOxNMCSyKoZkmF2Z5oLR++vx2eW4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(38100700002)(8676002)(66476007)(66556008)(33716001)(8936002)(5660300002)(966005)(54906003)(7416002)(53546011)(44832011)(66946007)(86362001)(6496006)(52116002)(956004)(26005)(83380400001)(9576002)(55016002)(186003)(316002)(4326008)(9686003)(38350700002)(6916009)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ah9GBOBL2UF41/01k1yo0+w5YNwp7EuIk0a5DCZchec7YD0pvEiJHxji/PHU?=
 =?us-ascii?Q?c1/sFHzWq1MJ9vSokHM8ODBWpVw4EucwjlhxpgaWc5yiF40Kz2qDUEJYcjkn?=
 =?us-ascii?Q?mAgL7c9bIGNfLEDeS/38v34sGy04j5EQk4AfPoJaLyRwfQiWRo4HXcTs4UJv?=
 =?us-ascii?Q?6u7ZV/XMCB3ZQAaWfdwNZ57Frv3X0V2QZCtLgK2rjZaXilb2xJ43cBMTlh7B?=
 =?us-ascii?Q?OE1jlIVM38fo8qGWG+N/n6DPmHD8UEZmzFiyEQUctqth8z8nt1Cnccb56ATl?=
 =?us-ascii?Q?fWzyAkCb9vOd8qmBSFuG+GUOTNS6OvVjU7sLvJ1Gv+iYFraF59CbZZLl5R77?=
 =?us-ascii?Q?KsfqxUxB7BVVPHfvbSVOUc5lf98AiVJG2atbc34xIPNI2QPGx8M8fy0HRICI?=
 =?us-ascii?Q?GuLnmtm+/KfLXPbSp0FJ6ShkOwe8Wc+XICBT6U/tMwi8e3ZyQqGuwJqznSNz?=
 =?us-ascii?Q?lY+dGKeM22EKcwckYVSkVWkcuBYEHgVYIYrakiSA2ni/nkKanJ1J1arU6tP5?=
 =?us-ascii?Q?ushSFtcxWzh2gtMqwVooBBdsgZG5Pp45MNyyKzzes6zECUxkwHiVRnaJaCDx?=
 =?us-ascii?Q?mdzYD7wp0dDLvJWRCYBqb0+VyzgYBq/jDl6C9C9X9XXDnth8gYE1l6HF6+FG?=
 =?us-ascii?Q?d+ilT4XRt+M4W2RYZu0BGxO5VCo1BSXOZdAz/tzRa1SghzS7R37Jw2LshmTd?=
 =?us-ascii?Q?onyndVn56QulI1CceDI6VajVu7PArHwuxuzN5Jy7kIJEfQ7sBz1xOA5gFJBv?=
 =?us-ascii?Q?KMYZcHndkP9WkHDccJGNMcx/bSoNirC2Hqarg1rfP5k5PrXh2TOprlg73VCm?=
 =?us-ascii?Q?/43SbmMp01NSGBAUq9llk+tH40/F42H7ugPSlyAPJE90MMV+a0TlWrWPZT14?=
 =?us-ascii?Q?vSKYVKCXfE72XsON/4IZYbp8my5V+GOClJ9njhgGltXiMZ0ec2Zit3+pTh8Q?=
 =?us-ascii?Q?Vc8tpblgj9vvPxlUy1CfLxl7qfN4CWU4pO5+yixAwdQGyiQiVYBl3Vk1S4fh?=
 =?us-ascii?Q?/J/EhcjRmLFFTryWt3gdkyXF44N9OI0rhw4oXIhr2cwM1FjaMySt0oPwX4m0?=
 =?us-ascii?Q?6wGnJ0Jnw4YipDrIFHRRl3SASHmi0qTo27Ke3JDWsL8vHy2TwEWAvyR15uH3?=
 =?us-ascii?Q?JwhPOKb20deESBigmR0is3ebss29OrTVIxBgzVr1mRI2SLwx71MewBI6QtTE?=
 =?us-ascii?Q?bMKtP/5VVcJQqVtp0Sp3pt1rvTOZ4xzwd5sQNkuYEHDSBWZ5K5W645t3g48t?=
 =?us-ascii?Q?WgVDTnWoYN8WtmC0bqEukbBoGaGYHhSec9oqu0mAu3TMf3af+VCVzoj6Uv/3?=
 =?us-ascii?Q?bweeNR/txzOdmuDglBT30ky6k0DOqfTPgiT28log8nziOE5MWWijlX3/NyRd?=
 =?us-ascii?Q?KWZJAOYJ2mwnE+/Dji0mhLkyEJVt4LxjPTyN5UoCmBFE2/SC12sQKXdP4PbU?=
 =?us-ascii?Q?dvchFU0nD4bBEPevptiT4IAPMIKxWqrmkzIvIqE0heSkXdwqQwD+HA8MGbR6?=
 =?us-ascii?Q?liwEb4UpMo09FP/DCLl+YvHrfrrAlOa1IIO5mXIb2wY5SW5PS2Lg75F8kwc9?=
 =?us-ascii?Q?Mnmojjl5nOYCG8Sva0nlR5oSTtstM6hEnyDS8r2TuUZv6n/2zJ2sd4tSP/e2?=
 =?us-ascii?Q?23kHOt3r19in4j49uiH3z+U=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 498298c2-d2e0-4399-fc1d-08d9add53b5f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 16:29:19.8044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TDGxiT3g4UrIP29JfAKvVrH1LDXgYAfoJiGzUWfNeToJ2nkJTnBDVZqW7iwsTyWlDlOGAHCPnmWZ9Pg9jHc9Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4912
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21-11-18 19:04:04, Rob Herring wrote:
> On Wed, Nov 10, 2021 at 07:46:55PM +0200, Abel Vesa wrote:
> > Add i.MX8DXL lpuart compatible to the bindings documentation.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > index dc1f0e07cbd4..fa8a602ccb22 100644
> > --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > @@ -27,6 +27,10 @@ properties:
> >        - items:
> >            - const: fsl,imx8qm-lpuart
> >            - const: fsl,imx8qxp-lpuart
> > +      - items:
> > +          - const: fsl,imx8dxl-lpuart
> > +          - const: fsl,imx8qxp-lpuart
> > +          - const: fsl,imx7ulp-lpuart
> 
> I'm confused why 8dxl is compatible with 7ulp, but 8qm is not? From the 
> driver, it looks like the difference is clocks.
> 

There are still things to be upstreamed for the fsl-lpuart driver.
Looking at the NXP's tree, 7ulp has some specific fixup that the
8qm doesn't need.

Have a look here:

https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/tty/serial/fsl_lpuart.c?h=lf-5.10.y#n3242

> >  
> >    reg:
> >      maxItems: 1
> > -- 
> > 2.31.1
> > 
> >
