Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30595479DDE
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Dec 2021 22:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232578AbhLRV6w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Dec 2021 16:58:52 -0500
Received: from mail-db8eur05on2077.outbound.protection.outlook.com ([40.107.20.77]:58913
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232339AbhLRV6w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 18 Dec 2021 16:58:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmec69ARiT0EtjDMSPrTF9/BSjy+cvNPqs9MCMDhR568Da1x4mIRatDj1jceL9cChguWux/l4I6nPgrKnSRfn6/czNig9D4VTyOFz6s2rVXIo1vjT/pI/okuSQ5bidJzY65xe8rTGsUyga1DGYY0Sh9uGY/vqf1fyJX/duyq3YYgteEvQP4fQQZtEU53QXSSpO1008U17HqiLNFhae1HTdQzdPl4pcNmxuWohyI4DtWoexeGPKOdNE2pQ9NbCyxq4SLJyb1Ypn9FAWmIWBYPYHxGsgANeQJk2+2SHrMO7KyJFe4ZZk9nC+mlIZeluPVLYWAGVeGNOxKEcnKDOy4ojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOm8pMpa5Bka66uDqL5sD0MCOA2EPyM+VaIroFW6VNc=;
 b=HLpCrmnNMbuekr60/0/0mVd92r412/8pTmIoO9V1KlAmS4QDezftT9iLMwgqfsGsmggPzzxYHVwFl3CTfZ4yvA+y8jJRAtZWY9SYybcOfii8Bp1lhQl4p9yOvrFoCw0DdS6ttpmqq72aDYryjEsYWYdgwZ3L4YKrSQVk2a+IheRRoEZrDTpXdM3CHEGv2j9ryY39bOx+YYtu8vWQdRPrZH3qZcs0C9Gq4puwQSRFxQffL11ATg8ln2I8JMPzX1EVhR9es3C/ZVglVNu83rpTWR1zJGcxV0R2Ey9TtuyQSRyKFYcwsufdx8QsGzZCYn894RQmPMo26N9JTZ1Gb5Tg0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOm8pMpa5Bka66uDqL5sD0MCOA2EPyM+VaIroFW6VNc=;
 b=Gh+TI8JeJ0TF+Xq/IFr+6IUdsaNtCC1fNE6rDr9Rc3stkQ7/ag8B/cw+489RxWVpxmkEMLakHU0Qaf6+z0jIXwkDn4RqEqLreaB1GWVzwSNME0OXVgDe5lZOat0nomIe2uUtMgOa/XxzvzTtS4iLVw4IvnUkk+4tSW10a97YnX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VI1PR04MB3198.eurprd04.prod.outlook.com (2603:10a6:802:9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Sat, 18 Dec
 2021 21:58:48 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::4c4c:f2b2:addb:841]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::4c4c:f2b2:addb:841%6]) with mapi id 15.20.4778.019; Sat, 18 Dec 2021
 21:58:48 +0000
Date:   Sat, 18 Dec 2021 23:58:46 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [RESEND v4 10/10] dt-bindings: serial: fsl-lpuart: Add i.MX8DXL
 compatible
Message-ID: <Yb5ZlnEm3EYCD9h8@ryzen>
References: <1639680494-23183-1-git-send-email-abel.vesa@nxp.com>
 <1639680494-23183-11-git-send-email-abel.vesa@nxp.com>
 <YbzB7mspRBonT9jJ@kroah.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YbzB7mspRBonT9jJ@kroah.com>
X-ClientProxiedBy: VI1PR08CA0176.eurprd08.prod.outlook.com
 (2603:10a6:800:d1::30) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f41ab1c2-e128-4fb4-7271-08d9c27191f3
X-MS-TrafficTypeDiagnostic: VI1PR04MB3198:EE_
X-Microsoft-Antispam-PRVS: <VI1PR04MB31981D622FC57DB3483F7FE8F6799@VI1PR04MB3198.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P3oG00hJU5FwDIg5oCQrfmf9rFvf0yipE1fxPQNxedmdZFFy1U/A+eG7t6RifGv/1mxluxZjY2ojKqVW+gTmEbcAa0Fa4XuYOmaaxop6vVcWAhw80UyhFk7gDM2b+Qmie/uK8IbEIkBKFi0mk/mAhx1kCbGREaTKpTeEllvme6iIU6u0ARReXEp5x4YE9hqMO+blGENZUpZoy7W2YKNBJKL3JadSMDdG7OzNjNjSoP57YGb46cuz/6Sv/KzReHW0QRBtsQBgD6u5rjtk6j7Sl7v2DZeNOWugPAFGFhcVfrtOIUKTrNcPK2XeBCjVNFQL9cEp+OR3HtvB87x2nSIjuHzZZimyl5r8ZcgI7QebKzahggH1e+QJheYlgK/dKcPQa/7nbh+cRQG5BEGKXEOHQVcDslbqbGzK/wRuo/kiDV6pw9vBuMUcF8o34u+xfzX6GuRMWNTRRoiUqXTbeQ4Gog64qf41Fq1M7TVQfYsdYvh8Sy3+5teEiyNTewVnWWDYO0OyyPVA3nlbBK2IMXzJNxO/otnlAC4H3Yn2NmtbHpi49YWmZM1hFIUtNNDwcqSGQshehXUAP9UPc953MOntJAwrvMYG1tdzDHta5KQEvknXYtw4IjiGZ9tz5bPUz5r9nCsUfO3212gp0qLEKQ+I+EDGx6OycN9BtKT3tKJMyna1wLxAHFPfW/9RcAiXaeytXH1pz66jwe0PLZhxjIefEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(38100700002)(4326008)(38350700002)(8676002)(2906002)(5660300002)(186003)(7416002)(44832011)(8936002)(52116002)(316002)(53546011)(54906003)(6506007)(86362001)(9686003)(6512007)(6916009)(26005)(66476007)(33716001)(66556008)(508600001)(83380400001)(66946007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s/HlxPNNLdkKvE5853DMGv/tlhDmv1iBHdl2ppI63CsfO5/UBrlThvGhlNBc?=
 =?us-ascii?Q?ECnadbWkHo66Ip11pBualYzcEJwwnOKkUmwVWRnA9gq78wBGH/rPDqBaY6nn?=
 =?us-ascii?Q?H7xS+P5f8eExtWznJfk0hIbf5waG+3rarDeyGJJGysqzIQe5G0A3fvTj0qwY?=
 =?us-ascii?Q?MK4IREzVe45IHoKpyNrd/9QooP1uKUxNC75xEg7VGpTv3krBQBAH2MKrU6G7?=
 =?us-ascii?Q?JinSp/1BjGcjBKutsQNCR5De5vewrcM5CEqQOMNzgWtqwekSDW088S3rb/uj?=
 =?us-ascii?Q?3R3jYrVr0K7UmSKwM9MJW/XnM/NFe0vad19mpSW0vJ/QaF6SU7wZIliXBL5e?=
 =?us-ascii?Q?8MeYb2syXPmOAalO6OJNbsPMDP4e/LDCHmV93WmggxuNrYkWdf0TO1moPRkM?=
 =?us-ascii?Q?qyTE2VkFb4JUeBYK3DfoAAFq3bdPEEWR7+Ijy7LuwZ6qei6dSaKHZDQsD3mI?=
 =?us-ascii?Q?9+oKSKKzVJxmilNUkY+2An3lecry+EC3YQWckbZrl4r8BjphZctGvcaqSttB?=
 =?us-ascii?Q?u97fEpuzn2NnMQ98oRj7PuSldENAH5HyWGnMbOyTapX++MWvdkIjmFqhW6em?=
 =?us-ascii?Q?QrsP3/i6dpwiOS/9jAo4EvKI883Bxf/Q6Z9DudCRZsT7FzmyDL1XFwRfTS03?=
 =?us-ascii?Q?gjQdAL/S1LvyBPoZ2YfOx3GNF8FfB8Yyw1yLFFPVbWUdkSAzUEPK6EVewJuK?=
 =?us-ascii?Q?r6r5EWmmcqD2c1fmIC/HlGSyzNDbmS5IsglkRNDLcvNpPhAKEspaBj3AlYKN?=
 =?us-ascii?Q?X3lJEMWSpS1ZNhOzMnJr8WxIiFoEeioHVAbl4tFddnr0CsE6QkHZB30PhvZ2?=
 =?us-ascii?Q?xEfuYqNv3nq/C3lVsvls1L54lg6zBekAP2IHKBXFStRq/VVXJauVPCdMwDDn?=
 =?us-ascii?Q?UmghefkdTznDVVwqwQeVJWHZh/aTUYyTZxpR8ul3+ybTrfyvFruWxWNBAKFy?=
 =?us-ascii?Q?Akdm7xKzh8gJzmX7PJVRtUDP16t+ACiRM9/APp1UOvBg1Kb4LnOve7YnpjJR?=
 =?us-ascii?Q?bvP8L5zi2+A82pgmg0e7IUJUGOVBjwU3bHRk+G0s3fJwQufICgvt+3/doOXX?=
 =?us-ascii?Q?2118NLlcVUtUgCs5kEzEPNOdbYu4tc7sG479t1m8Fz1qyfWQrrWCZ9qZ32kg?=
 =?us-ascii?Q?0ZcAn8LTGqDNb6S69p9IrcL8OLWxy/3ICfNzVyXU5jySdtCRCcQ0kR/a3QAL?=
 =?us-ascii?Q?yRpJfRnwbwub3/ps0dpMHbziC1rv3lEpMmUfdgpneRiKa5Fc1GZIr0yKs73j?=
 =?us-ascii?Q?74IRNfMuGR7HC0iSekZHTjWwPv5uD5GqcaabQjMvouGnkgXvE/OS8KVqQczc?=
 =?us-ascii?Q?wtUVx1xa7+iIKNtdVHfACYYaUb3WCjhhPgUnUuHJVRiNqT6J3o0UHGDIg0ZN?=
 =?us-ascii?Q?+pU/8i/hWyim64LJEA9Mps1Hapk1jabaVp+0ORl/7RcKtXqoNa4vu5DxPh7e?=
 =?us-ascii?Q?r8w5muHKAPFtpPe0HLMekfoUMxPe0PZBBwQdnuqYttANk8RpNV3ssiI0pwYp?=
 =?us-ascii?Q?/c8qYXQ1ZvVbymsPkTJlfwiUU3kpsWFoVedcbJdyaeoEdz5swpCXnxLbkI4i?=
 =?us-ascii?Q?0zApHL9TRt9v2qp3+EoEenRWauRLh/xaB/RMyUqHjeSK6ezgbce8AscGl09x?=
 =?us-ascii?Q?PvZTJtyLb4xpdvhO+iJ7DWU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f41ab1c2-e128-4fb4-7271-08d9c27191f3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2021 21:58:48.6848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PvJ5K5euzLHiXNFhB1Ewq4cJ8FHyprbjfyIKbXToTh2x9NI7uqCKUMKSTH4MrKMUJG/z8fI0SyjhxNPaj7KTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3198
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21-12-17 17:59:26, Greg Kroah-Hartman wrote:
> On Thu, Dec 16, 2021 at 08:48:14PM +0200, Abel Vesa wrote:
> > Add i.MX8DXL lpuart compatible to the bindings documentation.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > index fa23c60a01d0..ee37aa125c86 100644
> > --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > @@ -29,6 +29,10 @@ properties:
> >        - items:
> >            - const: fsl,imx8qm-lpuart
> >            - const: fsl,imx8qxp-lpuart
> > +      - items:
> > +          - const: fsl,imx8dxl-lpuart
> > +          - const: fsl,imx8qxp-lpuart
> > +          - const: fsl,imx7ulp-lpuart
> 
> Why is "- items:" listed twice here?

There are actually 3 "- items:" and there is a "oneOf:" 
that encloses all of these.

Unfortunately, there are special cases within the driver
that forces the devicetree nodes to have a different list of
compatibles for almost each SoC.

> 
> thanks,
> 
> greg k-h
