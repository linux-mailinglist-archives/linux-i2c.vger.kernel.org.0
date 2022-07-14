Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A71C5745E1
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jul 2022 09:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbiGNHeR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 14 Jul 2022 03:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbiGNHeQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Jul 2022 03:34:16 -0400
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BB243BE0F
        for <linux-i2c@vger.kernel.org>; Thu, 14 Jul 2022 00:34:13 -0700 (PDT)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01lp2113.outbound.protection.outlook.com [104.47.22.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-VME7gc6gP1yw_O-aSFJV4A-2; Thu, 14 Jul 2022 09:34:11 +0200
X-MC-Unique: VME7gc6gP1yw_O-aSFJV4A-2
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR0P278MB0361.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:32::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.20; Thu, 14 Jul 2022 07:34:09 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95%8]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 07:34:09 +0000
Date:   Thu, 14 Jul 2022 09:34:08 +0200
From:   Francesco Dolcini <francesco.dolcini@toradex.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>
CC:     Francesco Dolcini <francesco.dolcini@toradex.com>,
        Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] i2c: imx: Retry transfer on transient failure
Message-ID: <20220714073408.GA542904@francesco-nb.int.toradex.com>
References: <20220712082415.319738-1-francesco.dolcini@toradex.com>
 <20220712090514.lt4r4dvlkn55jf2o@pengutronix.de>
 <20220712100504.GB319880@francesco-nb.int.toradex.com>
 <20220713115750.GA504159@francesco-nb.int.toradex.com>
 <20220713132437.GF24373@pengutronix.de>
 <20220713134329.GA495155@francesco-nb.int.toradex.com>
 <20220713155723.GG24373@pengutronix.de>
 <20220713202541.GA532546@francesco-nb.int.toradex.com>
 <20220714070705.GH24373@pengutronix.de>
In-Reply-To: <20220714070705.GH24373@pengutronix.de>
X-ClientProxiedBy: MR2P264CA0142.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::34) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: baba2bd6-d3dc-4a11-52fc-08da656b3d59
X-MS-TrafficTypeDiagnostic: ZR0P278MB0361:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: w3EqKbv8GUCnFKaPRCL/I6K3YDW6ZJ373ghy3LShrxUxGz1i6cUSE7ZlirjmuzyCv9uwEm63GJOVnHKU7e9+l3NlcCnpP7T3kEBTaEW4vi2GV76+DOSiKQbvLBes6HBvfOM7xLVlx4UsgAbCBtdT882vcFE2wDUGVJtH1DywEaSHhMS9XqC9CXlEsR++XUsillwtkcZcJZsnRTm3ezOt61jzKZol/yXcyFyz2VrimwdjYBQEX2QKb2eejO9ICrGHtJH90HLucAQ/A8AJiDZ2Z/vlhydfDCKwPgmu2uSEkkgclxNlaUYdkmXkcd8jUcRdcik7qWk6Mb3NM9rdPhe5FVXqBL16WUPe4rVM9729eq4C5S1mL7zZwZafbrYYM/vAnU6ftU/dG//4ACqRFd4Tgd5XjWl0jZ2wRB9nQL/SyvirHoK7UPobYziQTmUjagEhZpJ2pwz3kcXod1IWIplo5akEKIvGS/di9kmJsaXociZlOoGdH4Seu9gVZR3lusKdWQYuXEh9js7fCqgNq3A8/86gAQHH7Y7jdfpoI4yjjGa4+BbZwJffhCw/x5OY/iCyWC2Sfp8xV192ib4BiOMXl2G/aJGA4xlxDuHo0/KDm6L8C4fIa9bGkDzK4+S0eRliJEwAb0FEVptP+BuhX4vZsjnJbQKSqigLYbb/vdhPXBNAWUiGtvPL6s07m9BqazDlNOwRraExNG2e9+L2gEL+NyAN4Aon8GHnTnLT7kXIVXBMWM7eOtmroNnJnB2fWF0k/IcSXmOMuNLBnhDWY6pVYGzwWNwilMB654HyPO6hFsWZZ6ypT7R6JcvB64oP0byM2o96uwG4lYel/koZzogD3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39840400004)(366004)(346002)(396003)(38100700002)(66574015)(83380400001)(38350700002)(54906003)(44832011)(186003)(66556008)(4326008)(8676002)(66476007)(7416002)(66946007)(110136005)(966005)(86362001)(41300700001)(2906002)(6512007)(26005)(478600001)(8936002)(6506007)(316002)(52116002)(6486002)(5660300002)(33656002)(1076003);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tBslZLIMcMas7wq8GC9xPhZGP9Ey7M0bZPG2VlGW+dYiaUsg5DIEpfi0p06J?=
 =?us-ascii?Q?Jwamf26f8ksamHusblBbqAQaTAr2HgOjp4rSWLGLaqBKIkYOPxeR2KvpBZTK?=
 =?us-ascii?Q?6evH/GDpZQ5T6XUanlOqRrVkVqDCwr3CJpnGASjLVCS8Vn/Q1KEMrqEtHvCX?=
 =?us-ascii?Q?PBgON8mgyNiKU6j08EFkDOiWaqAFtdnq6hXecXWUK7bhTvluYbQpSkPmH/MF?=
 =?us-ascii?Q?M+XoDKBpGU3FUgy3DT38mAcx+Hhn5T0R0rS8BgZZMkhb1dcgKUb9/XG76Koa?=
 =?us-ascii?Q?+hxE072nW9EEwlgJMtsZ5cnbYLnXUaL+ymKxpJRz6OvrtgQ8MLEHQeFfvnj/?=
 =?us-ascii?Q?JwD1lafWapa8S1fRi9BpB6xxRHkwmRFUiZH3zNpb/F8nSV5Kh67GcKeRoXcX?=
 =?us-ascii?Q?6JiqAFTCPt/zmue6ze2y8t812tThHlJjTYZoIPKalv1JU1wgdF44SSljw3Yz?=
 =?us-ascii?Q?9t5I4gRasNlTDg6HvfrB80QVD/q4zESvykFaR/H9DjUX+u7NP0PQK5StIrNn?=
 =?us-ascii?Q?TZGqq6zAsgLqcvHmaVZx/860rm+wWOG+gtNDBAsggvu5qYSoBIrY7RMHmVtv?=
 =?us-ascii?Q?9Q/31vpQs6vbqEcYV0HyqdITeOJU3k369ETIS+phh/zIGW8kBfBAMCbtE4Ic?=
 =?us-ascii?Q?U5ISUdciQwXVvEzHo6JpTpJqscGv7b5Soho6ZRxo5L3CnnqLPTkUqMDzAUQh?=
 =?us-ascii?Q?a8OZSffprTLJJIjbOjOBYBwFYIPwX8F9H5/3N7qfMUzHAOnyKNzoy7XoWpJq?=
 =?us-ascii?Q?K5XylnF7c5ZpzM7lvyW4Ohrg7+uJ1SuzaefVJ0M0YMKo500TnFOTrKaF9ky9?=
 =?us-ascii?Q?Up+8aG9uov2AjQ2wJsVR1weHprFlbbJwneKL3FOuNEIeOdmSvJd9B6UiQAuZ?=
 =?us-ascii?Q?cUw8vv/wiXyECs5SeyVLtNtxBIvqk7bxaOY0umpCMTLRIaBzJVo6bRlkv56d?=
 =?us-ascii?Q?Q+vTss1y0rgJZavrEsXCd5u+7vG5MHqzwTbjBzLLqSG1hEeTTqroYrWl3LXK?=
 =?us-ascii?Q?21LG2RXxA9P/R7u5EpUpDx9ShOAwC76ngs1izSIcmB0gyaKrNEIANdFEr+7k?=
 =?us-ascii?Q?rj1tY4WabYBU2lUmj/mRkjV3jjeNAC4qop2cPT2dU+hiXTRcM4dpCeY0BzXf?=
 =?us-ascii?Q?Nswk+itkRpf+ztPAXf5Z3UwDoDJiaQFvjEFH3PpCg9Tv5+ccb0fM8RWxXIyL?=
 =?us-ascii?Q?XU5nuNCWUxOoWGXwzeE3OttE8EF7ruWNx6vNNTshADcSopCTO/rRQs/ZUeaG?=
 =?us-ascii?Q?lAqMCmvo4hs9TyqQokJKFZPtECc02cVKu6tq7bj78m60vUZ0pxgeDATZwe9g?=
 =?us-ascii?Q?GjZnAQwQroq8/YbDCGLQ2FEXGNvXwKVSHAe91dfV9+npKAv7VOMsq70fVo67?=
 =?us-ascii?Q?EC47TJRNHgo3NDsWoSlF8RkX+mHccVsdgpzWVgxSPhTXRLXiblyRFkuTqnjU?=
 =?us-ascii?Q?Nk5JKE3KmNP/bJBj0Y+o4yR0S5Ku2dXLIBaIJ0fdjEkRh3YNNNtCPjkYip/m?=
 =?us-ascii?Q?AW8MGQTPgUgG8dzjDtZJu3tdLN+yIVWvudZJShj1PFj6URqCDjfMlrXebnla?=
 =?us-ascii?Q?k2BZ8tk02SMTWAZanfA+3qaUnyNIY35KoyCKxK9BucZvi91yUbpHQAE6bWBG?=
 =?us-ascii?Q?tg=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baba2bd6-d3dc-4a11-52fc-08da656b3d59
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 07:34:09.2453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9g700wSYmBggMFhsudQhr8UBe5QbPZFEFmFrlZki3tk5rphoxnsH5wImOJsF1QxuTbP296o0WvSoxyR2vWj32Om42h8HkBd7jxJbXpNA7ZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0361
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CDE13A77 smtp.mailfrom=francesco.dolcini@toradex.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello all,

On Thu, Jul 14, 2022 at 09:07:05AM +0200, Oleksij Rempel wrote:
> Hello Francesco,
> 
> On Wed, Jul 13, 2022 at 10:25:41PM +0200, Francesco Dolcini wrote:
> > Hello Oleksij,
> > 
> > On Wed, Jul 13, 2022 at 05:57:23PM +0200, Oleksij Rempel wrote:
> > > On Wed, Jul 13, 2022 at 03:43:29PM +0200, Francesco Dolcini wrote:
> > > > On Wed, Jul 13, 2022 at 03:24:37PM +0200, Oleksij Rempel wrote:
> > > > > On Wed, Jul 13, 2022 at 01:57:50PM +0200, Francesco Dolcini wrote:
> > > > > > + oleksandr.suvorov@foundries.io
> > > > > > 
> > > > > > Hello all,
> > > > > > 
> > > > > > On Tue, Jul 12, 2022 at 12:05:04PM +0200, Francesco Dolcini wrote:
> > > > > > > On Tue, Jul 12, 2022 at 11:05:14AM +0200, Uwe Kleine-König wrote:
> > > > > > > > In which situations does this help? Please mention these in the
> > > > > > > > commit log.
> > > > > > > I'll do
> > > > > > 
> > > > > > I did some investigation on this, unfortunately we have this change
> > > > > > laying around since 1 year, it was written by Oleksandr, and in the
> > > > > > meantime he moved to a new company. I added him to this email thread, so
> > > > > > he can comment in case he remembers more.
> > > > > > 
> > > > > > We introduced this change while working on OV5640 camera sensor on an
> > > > > > apalis-imx6q evaluation board, without this change we had some sporadic
> > > > > > i2c communication issues. Unfortunately I do not have any better
> > > > > > details.
> > > > > > 
> > > > > > To me looks like having some (3? 5?) retry as a default is somehow
> > > > > > more reasonable than to never retry, not sure if this should be
> > > > > > implemented as a default for all the i2c adapters. From what I was able
> > > > > > to see that would not be a trivial change (the retry parameter is coming
> > > > > > from the i2c_imx driver, there is no obvious way to have a default in
> > > > > > the i2c core).
> > > > > > 
> > > > > > Would it work for you to keep the change as it is (just getting rid
> > > > > > of the useless define) and add a little bit more blurb to the commit
> > > > > > message to include the various comments collected so far?
> > > > > 
> > > > > I assume, it is related to reset time or other reason where the camera
> > > > > is not responding. In this case, amount of retries would depend on I2C
> > > > > CLK speed and host CPU speed.
> > > > > 
> > > > 
> > > > The retry on the I2C IMX driver would trigger only on tx arbitration
> > > > failure, that would be the SDA being tied low by the slave in an
> > > > unexpected moment, correct? 
> > > 
> > > If it is the case, it is better to understand why. Are there some
> > > special timing requirements?
> > > 
> > > > If the camera does not respond it will just
> > > > not ack the transaction and that would not be recovered by the retry
> > > > in this change.
> > > > 
> > > > Can this just a layout/cabling issue with some noise on the SDA line? We
> > > > are talking about somehow long board to board cables with various
> > > > signals on it. This is an issue that we had for sure in the past,
> > > > however I do have record of this only on a different camera.
> > > 
> > > If it is cabling issue, then I would take a look at pinmux
> > > configuration. If it is so noisy, that some errors are expected, then it would
> > > affect camera configuration as well. I mean, system is potentially
> > > writing trash to the config register.
> > 
> > I do not think that this is possible in the way you defined, if SDA is
> > low when the master is driving it high the master will just stop
> > transmitting and an arbitration lost interrupt is raised. I guess this
> > is just the same for any I2C controller, anyway is defined in
> > `35.7.4 I2C Status Register (I2Cx_I2SR)` in the i.MX6QDL reference manual.
> > 
> > I guess it would be still theoretically possible that the master read
> > garbage from the slave, I'm not aware of any mechanism to avoid it.
> > 
> > Said that I do not have more details, for some unfortunate reason this
> > change was laying in our downstream kernel since too long.
> > 
> > Anyway, let's look at this in a different way, from what I was able to
> > understand digging on this topic retrying on I2C arbitration lost is
> > just the normal thing to do and the I2C core provides support for this
> > since ever, the comment in i2c-core is
> > /* Retry automatically on arbitration loss */.
> > 
> > Setting retries to something like 3 or 5 is just very common, various
> > drivers have this value in the first commit or had it added later on (as
> > Uwe already commented)
> > 
> > To me it seems like the most sensible thing to do, is there any reason
> > why the i2c_imx driver should not do it?
> 
> Here we go:
> https://www.i2c-bus.org/i2c-primer/analysing-obscure-problems/master-reports-arbitration-lost/
> "Possible reasons are the same as the ones described in “No Acknowledge
> From I2C Slave”"
> 
> So, lets see what it can be:
> https://www.i2c-bus.org/i2c-primer/analysing-obscure-problems/no-acknowledge-from-i2c-slave/
> "Possible reasons are:
> 
> - The I2C slave could not correctly interpret the data on SDA because the SDA
>   high or low-level voltages do not reach its appropriate input
>   thresholds.
> - The I2C slave missed an SCL cycle because the SCL high or low-level voltages
>   do not reach its appropriate input thresholds.
> - The I2C slave accidently interpreted a spike etc. as an SCL cycle.
> 
> With adequate serial resistors between master and slave, an analog shot
> of the signals at the slave’s SDA and SCL pins provides a clue whether
> the slave acknowledges and to which SCL clock pulse. The different SDA
> low levels due to the serial resistor make it possible to distinguish
> acknowledges from the slave from data bits from the master. "
> 
> I interpret it, that setting retry count on any non zero value is an
> workaround for brocken circuit. It means, on HW development phase we
> won't be able to detect HW issue, if retry count will be not 0.
> 
> IMHO, it board specific configuration and should not be set by driver.

Got your point, and in contrast to what you wrote, according to the I2C
spec, a master is required ("must") to restart the transaction in case
the arbitration is lost.

From I2C-bus specification and user manual [1], 3.1.8 Arbitration:

```
No information is lost during the arbitration process. A controller that loses the arbitration
can generate clock pulses until the end of the byte in which it loses the arbitration and
must restart its transaction when the bus is free.
```

In case there is a different view from the one Oleksij expressed here,
let me know and I can improve the commit message, otherwise I guess
we can just drop this change.

[1] https://www.nxp.com/docs/en/user-guide/UM10204.pdf

Francesco

