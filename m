Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB5EF5735E4
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jul 2022 13:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234850AbiGML6C convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 13 Jul 2022 07:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbiGML57 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Jul 2022 07:57:59 -0400
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ADB6310400E
        for <linux-i2c@vger.kernel.org>; Wed, 13 Jul 2022 04:57:57 -0700 (PDT)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2046.outbound.protection.outlook.com [104.47.22.46]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-eQbbW67-NHqOrrFxCSbT3A-1; Wed, 13 Jul 2022 13:57:53 +0200
X-MC-Unique: eQbbW67-NHqOrrFxCSbT3A-1
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 GVAP278MB0422.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:36::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.17; Wed, 13 Jul 2022 11:57:51 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95%7]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 11:57:51 +0000
Date:   Wed, 13 Jul 2022 13:57:50 +0200
From:   Francesco Dolcini <francesco.dolcini@toradex.com>
To:     Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Wolfram Sang <wsa@kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>
CC:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] i2c: imx: Retry transfer on transient failure
Message-ID: <20220713115750.GA504159@francesco-nb.int.toradex.com>
References: <20220712082415.319738-1-francesco.dolcini@toradex.com>
 <20220712090514.lt4r4dvlkn55jf2o@pengutronix.de>
 <20220712100504.GB319880@francesco-nb.int.toradex.com>
In-Reply-To: <20220712100504.GB319880@francesco-nb.int.toradex.com>
X-ClientProxiedBy: MR1P264CA0100.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::24) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1b02298-4af0-4635-e82e-08da64c6e9f1
X-MS-TrafficTypeDiagnostic: GVAP278MB0422:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: czcahOpdf2fJaZ29Yhz3UtgRiVQpifS9dmQo1pe/y2jdTqzKLKrMFTEiMCuWmbzOFZpHRelOGsFw3ZDGeq9aWPn8tQUypKvfusJZMekrEEp7eNLO04dR7Mwman4+qAP4CNw2pQpwq35lPSPCuaKY6BLppFO8Ncor+20YTnZ0ueZJV81Nl2AUe1YDkN3nFzwpDid7GunHufKKIB80tQf3JbXr+ZLnO6pOmR4h0jpU0vNXRWpjukaf6gc1D5fRgc24Iehphci8qB/bSu3ISTHwxyUs38jvGn39cwOiOX2kpHg5j1FPdFGmVNO1+dFb/zlYR9DLdl/NGhbHIP8qBRrtFsVEXTaxfcipQTDl6OeanqAccqPrJp6+pKllPJVuhFjBaTIrxqxwA/XUBKxscTDuHBwH8dW9OVQb4cHkvvPqdPsxq5YRB2nMHDrFv7KvSURwtpUOEk4t7ovVxiKqWJfU9ivp9iWgc65Vw0AEkOjQeZJ9Ir5VruFdNmHOUBCo7x1oRXK8oGUOFosxRG5ydYWfdjnLQtz47SabDVWBU36fj9RjSfGBc5EzlQcQR5pp9A1o2Pk7x4dUjuI/qNpTdOtIxpYdtCPipKB79JFOVDt3w59p5swmrrDDYAKOy/3r1CkRoVW4LjtqrAIkekvmUBxs+9jGxVKwbjc/aRB1Vmi3628YhT/azmTyUpP0GWJ6a+OF9rLi0pbe05pRKiK4KS1NEU/aFE5CGnBtY6/hoAL9YDOCrp+5FEHXwRzDE/xpWP7ekkuSFtTcoO5jLpqy/KbSUN+0OIA049H8+DqCH2+x7X5jXAY7gbDDGbcuuL+U2dYV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(366004)(39850400004)(66556008)(41300700001)(478600001)(8676002)(54906003)(4326008)(2906002)(6486002)(110136005)(6512007)(66476007)(52116002)(6506007)(26005)(86362001)(186003)(316002)(8936002)(38350700002)(83380400001)(38100700002)(66946007)(5660300002)(44832011)(33656002)(7416002)(1076003);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oID/HT0rD15U+bnsTmKEyLBCPDRs0yUrNR8N0y2ZTs8Kayd73kWTRSVQcyCx?=
 =?us-ascii?Q?fVgrp/PiyKMLSXmJFVA2aSm72MZZRwJWTTg+y2yT2t9EBN+wnIMD3safxAWw?=
 =?us-ascii?Q?EMKLPv2TrmPFip5Qrl1UlVACw5KGCjY8nt+ZhbNkbsBzig1wbRW+WZqN1RMB?=
 =?us-ascii?Q?Dojy9webvDEuURjfBin4JgZkLB7yeYWRG5A9fg6nNhLSiHSDSA2+yb1lFlV6?=
 =?us-ascii?Q?k8ULHTGQQti+4+Y7vMbMThmHz2ZPPQRQZbxD1azgOu3v55Netu7E6Rg28iOt?=
 =?us-ascii?Q?IcZ97V4YmJfXZpAtrxCNOPX4rd9xKP6OVdx9Bjxpo/G9Two9arE4jnaX+mm1?=
 =?us-ascii?Q?IE+1sSXFtcXkTz1DX+OP2OaG65H0fgOiO1oXD6UcAzx9rTtO0HETv5fu//yb?=
 =?us-ascii?Q?emh59YFeAul6lj5lJP+cdZpPCxjMsGmNH+qPBt2nhEC9hiEEPLDGGAwxCOLZ?=
 =?us-ascii?Q?bYVeAo5o+3SLh0kGrvtDlDOwzXk0FZNXCfCZAOZdNHVdLXRO0kn7N5dH2piH?=
 =?us-ascii?Q?O42FLsLctqHYyuSd2o+MFPqu8oLmtAG02vIwyZEq/Trf1wIdsQ+1n2kDnrK0?=
 =?us-ascii?Q?TbkyohZy/me0O5WoGJrN+9pafizmXLwzdHxwfFoeab5zhFVm67rypp54jVuX?=
 =?us-ascii?Q?e+iRm+s4Sj5/nll8s++8aS7QEuyUcV/3RKaC0FyYHt6SzLSuTKdkoubMhMQ5?=
 =?us-ascii?Q?smA9TeBtKXx5dLwUrSv/z7tQjGMrq33F8PgSxQHq4wtwpMqGjMYG9/MQtTyS?=
 =?us-ascii?Q?NFXouYq5FlF9F0GdzYzQH4FhgXMR2HSXMDvNshwrIZ6MkkPOjLIzU7UYQgwn?=
 =?us-ascii?Q?r3f+71uZMbdgFMdlxg55OKTc6MVfEMw+L6LsMMi6r+hb5o/b91BoORMtdVMF?=
 =?us-ascii?Q?Y6Z8G3m8TqxrPowjKP+7tnzZpijMp7DOfULhGeomnkuX9plAD2j0ngCMUA+J?=
 =?us-ascii?Q?UsxiWdfQjHMyaA9aFVsylu13VjLpqpTY/fHs4pC6fJ/51DGqGVO6Mt3nCYhh?=
 =?us-ascii?Q?q7I1tLrQs61ULIwJ/uAfBk2az+i3eP/pH+Un7BphhylXk5wk9B+GbImLokjC?=
 =?us-ascii?Q?Zs4eOmGR3NL4PW9/mGACOXy+jjXztFLLoPDy2BzDK+qu5cnmNugJre2YH52Q?=
 =?us-ascii?Q?tDD4Tm4D4mvAr8ktmx26uQQh/ddqTRA3p6JoUTLI2PYpILeo6om5C6ueQNR4?=
 =?us-ascii?Q?bz4MAHTATnIKcgS5cXZ0tXagQdWHmT/scvFMC+ZvPvAb4afuexdIewQI8Tej?=
 =?us-ascii?Q?MMjLjqiVg61CDjR530EyIJylEQX7IkEWMOyVF0OgAROu/BBUqpJMO7dsdCQq?=
 =?us-ascii?Q?zdUCfRV+MEU0ZyJTRru9OnvoL7F9ZvT5KzvpnGikHJbgVwtHUMQ5ZR8KQyGm?=
 =?us-ascii?Q?lTe1WTiF5qC9J4lejIZGCg4n8rR8+MP9jPYAxH4FDcf3RBLcEzCkCleBCjh8?=
 =?us-ascii?Q?IM4cVuRfoL+qrEjWTOLrx9U3s+/ikUhZagFUOUquapTjy8YpKTcGolxpXe1Y?=
 =?us-ascii?Q?EPE5Y8iZ3Mz6NZPq2mMSeL2q9MxL0UcUoYcdmrZqJ8aI5tg21U6Bdq8y4v34?=
 =?us-ascii?Q?iz4FyNk8pP5O/jQ806RS4yU1LE3Dol4QXb3rzG0TmrwpPalH20gp2BNdgAa7?=
 =?us-ascii?Q?TQ=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b02298-4af0-4635-e82e-08da64c6e9f1
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 11:57:51.8530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzfoStCNFR2sXkX6cd/241jjVbyiBMT7BHpkGSLDKJXKyRhtBnWbpbUZI8OoZckodu1O5WrpkDtE24yfHOP3TFzI6yn7oZ06sM4bCnLR4BY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0422
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

+ oleksandr.suvorov@foundries.io

Hello all,

On Tue, Jul 12, 2022 at 12:05:04PM +0200, Francesco Dolcini wrote:
> On Tue, Jul 12, 2022 at 11:05:14AM +0200, Uwe Kleine-König wrote:
> > In which situations does this help? Please mention these in the
> > commit log.
> I'll do

I did some investigation on this, unfortunately we have this change
laying around since 1 year, it was written by Oleksandr, and in the
meantime he moved to a new company. I added him to this email thread, so
he can comment in case he remembers more.

We introduced this change while working on OV5640 camera sensor on an
apalis-imx6q evaluation board, without this change we had some sporadic
i2c communication issues. Unfortunately I do not have any better
details.

To me looks like having some (3? 5?) retry as a default is somehow
more reasonable than to never retry, not sure if this should be
implemented as a default for all the i2c adapters. From what I was able
to see that would not be a trivial change (the retry parameter is coming
from the i2c_imx driver, there is no obvious way to have a default in
the i2c core).

Would it work for you to keep the change as it is (just getting rid
of the useless define) and add a little bit more blurb to the commit
message to include the various comments collected so far?

Francesco

