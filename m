Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1028A573DC9
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jul 2022 22:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232043AbiGMUZt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 13 Jul 2022 16:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236756AbiGMUZs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Jul 2022 16:25:48 -0400
X-Greylist: delayed 129667 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 Jul 2022 13:25:47 PDT
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 94A9130F55
        for <linux-i2c@vger.kernel.org>; Wed, 13 Jul 2022 13:25:47 -0700 (PDT)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01lp2111.outbound.protection.outlook.com [104.47.22.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-D1oihngjP4SoiT_n2zlIdA-2; Wed, 13 Jul 2022 22:25:44 +0200
X-MC-Unique: D1oihngjP4SoiT_n2zlIdA-2
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR0P278MB0636.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3b::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.20; Wed, 13 Jul 2022 20:25:42 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95%7]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 20:25:42 +0000
Date:   Wed, 13 Jul 2022 22:25:41 +0200
From:   Francesco Dolcini <francesco.dolcini@toradex.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
CC:     Francesco Dolcini <francesco.dolcini@toradex.com>,
        Wolfram Sang <wsa@kernel.org>,
        Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] i2c: imx: Retry transfer on transient failure
Message-ID: <20220713202541.GA532546@francesco-nb.int.toradex.com>
References: <20220712082415.319738-1-francesco.dolcini@toradex.com>
 <20220712090514.lt4r4dvlkn55jf2o@pengutronix.de>
 <20220712100504.GB319880@francesco-nb.int.toradex.com>
 <20220713115750.GA504159@francesco-nb.int.toradex.com>
 <20220713132437.GF24373@pengutronix.de>
 <20220713134329.GA495155@francesco-nb.int.toradex.com>
 <20220713155723.GG24373@pengutronix.de>
In-Reply-To: <20220713155723.GG24373@pengutronix.de>
X-ClientProxiedBy: MR1P264CA0085.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::16) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fae011b-575e-4123-806a-08da650ddbd0
X-MS-TrafficTypeDiagnostic: ZR0P278MB0636:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: fR3n771Yd6W/5VD1+tQBCwU2BWThPgQDPEMgw1IGi51IdVpgvPCa0tUDLel5aa1DJSoyE5jc0nvrw5H9e4GaghLlyPcukEJ4UVViRI3p4XphBVliL1/sJHKYIgfz/Wf5J3gc+YQcI823zyZNA2XeJVooOAmyds72S/gc/zbKmQDsCtw5Sp7nrqNREbFh8oqf8TrDPgfeLUjdXTIwW5fyz4lDcO7dNoLimpvY70M9ZGAU2Vr6QJfgfzl+RDMisXsXLL9gfS60Bsa3WeDppPUPj9Tnjz2y3PhQY2SqLTgnPwzviYFOgbQ5qOos+1qJOfUqREmKM0T0FmG+fax4y8Q8z80mNJbft+W87LT7cdKG36AoCaTsgcz5BphJqR2ianP4mtlFa3KZqbqdOgtJ8zS4bR1HIVXEwj1EwD3EBJJGE31A6Q0U+YuvDSbDn5GS759uFV0Ywq4V0Ab2akVDRboOYGF1VKaX/EgKu4qeq+0HPO6YQpWaqx4O/O2ge4q1DbJBalXk0gFTLx+UJtQesXA4UUC9qws9pug6pBOBwDoH5jOqrsjc1l2RqcW5ZUUBVowJqhr/qQVvnLwyMHh/hGCHuORQK8t7XmJOFktEz0Km6Jn9V0EUdvSwR1AyP6PLPlERKe4fbqHsyi8avtVhPrZSzyNawKtIPcFtBmlbxgOhyL2PLzXPpiT+73lyniOgEpScmcdNi2vPWPlvYG6ac7Tf5+JMv9UqVPHhn34TcG2HGeyjNq7FXGUEQ8nMFkTfDxqwtiB4RG5ddz/29+i7aBPoNV5yvLdXRc3SkHz7J2kvsSgVrkcZ7ukElm8V6c4lzCyF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39840400004)(346002)(136003)(396003)(366004)(66556008)(44832011)(2906002)(41300700001)(26005)(478600001)(4326008)(66476007)(8676002)(33656002)(6486002)(6506007)(66946007)(52116002)(6512007)(316002)(1076003)(7416002)(38100700002)(86362001)(66574015)(54906003)(8936002)(186003)(5660300002)(38350700002)(83380400001)(6916009);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R2I3SjfValT7psZVkwaLmksO/sbtxovknj9xEK0CyUet6X/EfLVXQ20TJb4L?=
 =?us-ascii?Q?lSgPtyM8MlwoKX5i6xUEpKFuRUOeWgvXQ61v1JFn+1p9r5EHIKV4HTLAasId?=
 =?us-ascii?Q?tYZr54KOb/5dYbhBMSYPVUMJDod5KmD6JLo/DxpUbGUTAE8olzwvw5U/S7uV?=
 =?us-ascii?Q?HpovKp3nJ9l0lgIeQtEP9T7xj5gbyHftfA6pBcf3cfQe4MOS5P/yD/a1Cgfw?=
 =?us-ascii?Q?LAnhGu+Fn8TJFnpa1kM1IstsFvOnVeoyRuh77PB8oh0fPQKBccQJ/iGGlarJ?=
 =?us-ascii?Q?n9ZCgyQifHqeNFbLwgFBMLSCS1H2JWXrojebb01ysGl3cIuHIJjEOK04tVnu?=
 =?us-ascii?Q?X2BYdwQJkUbNdIdCrgEu/wiCSDjpvpzvo+18mDED6GqhBwjiCqJNJgiElYms?=
 =?us-ascii?Q?9PwwmIn7XtIp4k7SyF/mdBGtnhJ9AeT7MSyjdDlXKG5ZK/yMGlxluSvLi+gR?=
 =?us-ascii?Q?cJk6DsNdk66HTRqtb9FqbSuQNYNKThVn1HovNkF6arUEvKTgqEYCgxf15MKw?=
 =?us-ascii?Q?xClckydWdH3ISiSfTbCX/r8GLpTzfJwCBrq2DuPNw506NKG3c8CrGtYWOglx?=
 =?us-ascii?Q?gEu/HoXzndBOvGf9BaetOd4uuQaFP1tI1yQcuLvEKaLGT+3baKcvOu9Z2NbL?=
 =?us-ascii?Q?BD6D/Qr+HmSpFanuFrBmsaG31s+lF0JGRpPT4+HIVMyzr4FeIL4l1wCrViRR?=
 =?us-ascii?Q?j3lrbJs9foTprrmtriEUGij4kfxCVlBgql+kwphpbPAMmLcN1laC5hLs8LTU?=
 =?us-ascii?Q?44dbHMUFxY7WSYZmkH0vUUYmIxdRToMDwa7MaG4Jt80fYTdM3yCu3i8F2++w?=
 =?us-ascii?Q?rKsu7h3ExXnePGGcqxnuHxy8pAXtQVSWrYXfDUm9Pcw5TtJ3zlV9LB1BsgRe?=
 =?us-ascii?Q?rAxR5UMvwNQemWqj3oSuCWtTlXqSEQGRs14ty7sbrCqZgldaV2xMKosx8tlL?=
 =?us-ascii?Q?5A/Ta94rELtcX8oQi0ltufiG/PVNi0SuYrDZ7QZSKyT5WXTfGevyc3kYcwBo?=
 =?us-ascii?Q?B+BHJQDdqZs4s4QR0/Nw85/t+Fld183GtqzyKLS7i6fAX5zMd3bHc7iAllWj?=
 =?us-ascii?Q?nMnBkuBpxzuP6xkZUaINrEKgasyM1Z3tmUs1gzM74E4wXnL3ZZ6ShVlGEJNj?=
 =?us-ascii?Q?Do1SFLq88l/zdB01WYtBSPZ4Kyh7kx6ZWsEBEJMXhH+htCRBkSkyfx1CS5Aq?=
 =?us-ascii?Q?r3A6SMpseRqzhk11NKrxMlYJbp4/Ema2B+MLvcn5nT3yOHrR4/1busGw3Zz4?=
 =?us-ascii?Q?DAerMo4Weg5aPCex8A6GWOCbgPNc+t2qW9sGdfHSIAVBz8tzHTiCA9bpceoN?=
 =?us-ascii?Q?s6X5XyN+DivGtUYtpKyfs8KVM8PERBRt+UnkdAIDuXiwtZOobbovJIBKZ4Qh?=
 =?us-ascii?Q?RiuByvb2c6RwQjtWQNJv4xWJ2GORxHkKZMhztL5jqz2ezF6L60i2KVHz/owR?=
 =?us-ascii?Q?INDmAeexkw1k+h9hqqLzicrPXd44wO5rHAAvsOuaUwreGShJO9/Gs/ADm6RI?=
 =?us-ascii?Q?zOQmYvUeRXMI0imug1Q9jIVeU2tWTltsBEtL/MI0SY51g8ndeac6+/ovM4Q4?=
 =?us-ascii?Q?4wy4dFYBxtS/FYkM9HUIEfZ469foHvMHSUTQIjAIBFx6tf6RLU3T441ktZJC?=
 =?us-ascii?Q?eg=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fae011b-575e-4123-806a-08da650ddbd0
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 20:25:42.4139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfRI5SzH7tAyciuno2GS/XhLqoQtg1ck0c2jms87crN3zAdhN5gkEoBp4a/WtLk95PVfD5Jl2oj/Zv7qEnwsfeLMdRzM5cpt4Sk5ivs72rA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0636
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CDE13A77 smtp.mailfrom=francesco.dolcini@toradex.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
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

Hello Oleksij,

On Wed, Jul 13, 2022 at 05:57:23PM +0200, Oleksij Rempel wrote:
> On Wed, Jul 13, 2022 at 03:43:29PM +0200, Francesco Dolcini wrote:
> > On Wed, Jul 13, 2022 at 03:24:37PM +0200, Oleksij Rempel wrote:
> > > On Wed, Jul 13, 2022 at 01:57:50PM +0200, Francesco Dolcini wrote:
> > > > + oleksandr.suvorov@foundries.io
> > > > 
> > > > Hello all,
> > > > 
> > > > On Tue, Jul 12, 2022 at 12:05:04PM +0200, Francesco Dolcini wrote:
> > > > > On Tue, Jul 12, 2022 at 11:05:14AM +0200, Uwe Kleine-König wrote:
> > > > > > In which situations does this help? Please mention these in the
> > > > > > commit log.
> > > > > I'll do
> > > > 
> > > > I did some investigation on this, unfortunately we have this change
> > > > laying around since 1 year, it was written by Oleksandr, and in the
> > > > meantime he moved to a new company. I added him to this email thread, so
> > > > he can comment in case he remembers more.
> > > > 
> > > > We introduced this change while working on OV5640 camera sensor on an
> > > > apalis-imx6q evaluation board, without this change we had some sporadic
> > > > i2c communication issues. Unfortunately I do not have any better
> > > > details.
> > > > 
> > > > To me looks like having some (3? 5?) retry as a default is somehow
> > > > more reasonable than to never retry, not sure if this should be
> > > > implemented as a default for all the i2c adapters. From what I was able
> > > > to see that would not be a trivial change (the retry parameter is coming
> > > > from the i2c_imx driver, there is no obvious way to have a default in
> > > > the i2c core).
> > > > 
> > > > Would it work for you to keep the change as it is (just getting rid
> > > > of the useless define) and add a little bit more blurb to the commit
> > > > message to include the various comments collected so far?
> > > 
> > > I assume, it is related to reset time or other reason where the camera
> > > is not responding. In this case, amount of retries would depend on I2C
> > > CLK speed and host CPU speed.
> > > 
> > 
> > The retry on the I2C IMX driver would trigger only on tx arbitration
> > failure, that would be the SDA being tied low by the slave in an
> > unexpected moment, correct? 
> 
> If it is the case, it is better to understand why. Are there some
> special timing requirements?
> 
> > If the camera does not respond it will just
> > not ack the transaction and that would not be recovered by the retry
> > in this change.
> > 
> > Can this just a layout/cabling issue with some noise on the SDA line? We
> > are talking about somehow long board to board cables with various
> > signals on it. This is an issue that we had for sure in the past,
> > however I do have record of this only on a different camera.
> 
> If it is cabling issue, then I would take a look at pinmux
> configuration. If it is so noisy, that some errors are expected, then it would
> affect camera configuration as well. I mean, system is potentially
> writing trash to the config register.

I do not think that this is possible in the way you defined, if SDA is
low when the master is driving it high the master will just stop
transmitting and an arbitration lost interrupt is raised. I guess this
is just the same for any I2C controller, anyway is defined in
`35.7.4 I2C Status Register (I2Cx_I2SR)` in the i.MX6QDL reference manual.

I guess it would be still theoretically possible that the master read
garbage from the slave, I'm not aware of any mechanism to avoid it.

Said that I do not have more details, for some unfortunate reason this
change was laying in our downstream kernel since too long.

Anyway, let's look at this in a different way, from what I was able to
understand digging on this topic retrying on I2C arbitration lost is
just the normal thing to do and the I2C core provides support for this
since ever, the comment in i2c-core is
/* Retry automatically on arbitration loss */.

Setting retries to something like 3 or 5 is just very common, various
drivers have this value in the first commit or had it added later on (as
Uwe already commented)

To me it seems like the most sensible thing to do, is there any reason
why the i2c_imx driver should not do it?

Francesco

