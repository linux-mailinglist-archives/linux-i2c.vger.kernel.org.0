Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A63525760C8
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Jul 2022 13:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiGOLpe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 15 Jul 2022 07:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiGOLpd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Jul 2022 07:45:33 -0400
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CD42B88F38
        for <linux-i2c@vger.kernel.org>; Fri, 15 Jul 2022 04:45:31 -0700 (PDT)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01lp2111.outbound.protection.outlook.com [104.47.22.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-RnRUtBgGMzevIAsbH8jhRA-2; Fri, 15 Jul 2022 13:45:25 +0200
X-MC-Unique: RnRUtBgGMzevIAsbH8jhRA-2
Received: from GV0P278MB0484.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:33::8) by
 ZR0P278MB0058.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:19::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.15; Fri, 15 Jul 2022 11:45:23 +0000
Received: from GV0P278MB0484.CHEP278.PROD.OUTLOOK.COM
 ([fe80::fcc9:9f39:5e:7976]) by GV0P278MB0484.CHEP278.PROD.OUTLOOK.COM
 ([fe80::fcc9:9f39:5e:7976%5]) with mapi id 15.20.5438.017; Fri, 15 Jul 2022
 11:45:23 +0000
Date:   Fri, 15 Jul 2022 13:45:22 +0200
From:   Francesco Dolcini <francesco.dolcini@toradex.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Francesco Dolcini <francesco.dolcini@toradex.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Wolfram Sang <wsa@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: imx: Retry transfer on transient failure
Message-ID: <20220715114522.GB562594@francesco-nb.int.toradex.com>
References: <20220713115750.GA504159@francesco-nb.int.toradex.com>
 <20220713132437.GF24373@pengutronix.de>
 <20220713134329.GA495155@francesco-nb.int.toradex.com>
 <20220713155723.GG24373@pengutronix.de>
 <20220713202541.GA532546@francesco-nb.int.toradex.com>
 <20220714070705.GH24373@pengutronix.de>
 <20220714073408.GA542904@francesco-nb.int.toradex.com>
 <20220715064931.dvbzcufa3l3ojug4@pengutronix.de>
 <20220715072432.GA562594@francesco-nb.int.toradex.com>
 <20220715083400.q226rrwxsgt4eomp@pengutronix.de>
In-Reply-To: <20220715083400.q226rrwxsgt4eomp@pengutronix.de>
X-ClientProxiedBy: MR1P264CA0033.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::20) To GV0P278MB0484.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:33::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ebd04f9-d48c-4716-33c1-08da665780c3
X-MS-TrafficTypeDiagnostic: ZR0P278MB0058:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: oKZaEVaJD6ybIKG7bRSHfwLnDow8S3Ez/6VAVtuqJeYnxjJXjCZ2z/mdorsNQH0M8ZB8w0OG86GpyzNGKNNLoFtp7B4OQWRxxgYbinMss383fRs2bbhjx+fdoJdXF21Q+E/rYPUTj4E15aZdtFp7AYB0iKLinWBf2lIS2DNt4oIdrLQVtwnknQ4IShplnPsv4eOBy9Nqz7xjbFofsFkEsEpNcgmag5TD95G7vBEzRQyg/7nRNxNdMmO2OzPH+1elPTmulIgqea1TW08EuTuEVveGQ2bT3SDxm5M3FzyE/mtZE4YcbrBhB3rLt9s2MDQo3quCbbpJSp2+mub4Ya/bIlK16gL0aUb8iCyfWmy86Ox8a3G+q165MwMy6l/bJ+MtqXiPhqUL6yNZn96mFzvgq71fCVLTS9vdIUfe5unCmuaABe50wNFMObIeop5/2ETksoM5sGgc3mFX5Il1L0qWF+mKrDAjt9l8jGwnqSoe85ZoyGJTcrGMDn8SILStjABhM0HxhlcjN2PG7r6jYg/iO3iIP7u2BmMi1JIkiIAEPUuIDm90UrIV6ZnSQLn32qB9E/lSkiejtiWU+RESLWEKuKObcaYvHZ2rkI1UQGZSme0fRpn9d97FNWl+cfe3d/xftq/6iCnHZO6dSqig7hgcWs6drYiVVWANi9s+UYQV8b9KPrmFGM3tum+rSPfvKWrbSJd9aDZ6G2iMvHGuc2lN6K8D6u6OKgJrLfn/zBhMB4gYh5MrfRC/NEJ5jbkHGHEcrMlAMZC26+wgE2bsG45tHECI19KcVSauPTZQ0A64mts9ySuZQXacJAq0PRLyHR6R
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0484.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39840400004)(366004)(396003)(346002)(136003)(6506007)(6486002)(52116002)(54906003)(6512007)(6916009)(26005)(316002)(478600001)(41300700001)(33656002)(8676002)(7416002)(66946007)(66476007)(38100700002)(38350700002)(83380400001)(66574015)(66556008)(44832011)(4326008)(5660300002)(186003)(8936002)(1076003)(2906002)(86362001);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B/E+Aq0YUcEoeAkoTM3vppUo+Rbgf4zevRFVkqNt9YXVGJ9bxxD6YPXsmv0q?=
 =?us-ascii?Q?9wd/FQtvyHrXyw0OwFkGIIKzZ/3C2iExdo11e4vEfEDHB4qLrPOS/OfzgLNX?=
 =?us-ascii?Q?oxrYZj4rJ36NiFqf3BKExWToVE37k6oraMpKZ/v6Sr3iIMWhQolwZePCOXlr?=
 =?us-ascii?Q?CyqPLdsI14HAwSuImHJKpKW73vI3//p3ZQ38ouyVDx+o1IrkWFF3qI6wMrwO?=
 =?us-ascii?Q?0xfTC2wTnRwmwBo4eL0LWqrpSMihxmhDjaiP4ArFvsJ3Ac6M9A7gsQQQH+mh?=
 =?us-ascii?Q?bwOS8+2aI1x8fk/cdw3dqP3DdI0k9Na3WpcmUbL3nqHgCwOvwu8WNBm/YZt5?=
 =?us-ascii?Q?PE7Mtn4sManr+2cnCkx5XnzJV1tO7DPWTLC06s9QhVpGQ9vciqgItZD41y4n?=
 =?us-ascii?Q?f2nLMf19flISo2whR1QmPN2tpd86iA7qIYT/BTIVhaj/FYpE893ptFnuOkdk?=
 =?us-ascii?Q?dPv/+0CksGGly1BSamY8GkTGRc9oaz32O2QZljTVps966F6xi+uni9eqlaJi?=
 =?us-ascii?Q?F2KpenNjWwYWi/s1As/EewevnqgwzKyVFKwZcSuRZPkzGq3nSLxnAVvcp2ZS?=
 =?us-ascii?Q?i16CdZsr6UMwcKQY7lLe9CH7Cf7k5YcuTk8qVOcBx4jAZxXHefFCRxm6Gqjw?=
 =?us-ascii?Q?wGuyRPcjkAdKT376QKM0f0xSWtxEsunuFldYVmlGL+u6QA23IaZqql4TmMTg?=
 =?us-ascii?Q?yrBI9x3XF4OfK3PoeCM+EREea2GiD9StFZhi2NNwoURd2C2rmy9mbnU04IRg?=
 =?us-ascii?Q?h6Wabme+6CpSE/Zm4LT5MtvRFMGAzRFtyktAdvDuTW2gQ5Y6GCne48xFFCz/?=
 =?us-ascii?Q?HmFMyG1fMSeO+CmIDVHFvsMIkttxMNo2+ipFYJFuWiGCsjg3myU8vZ9SkeNi?=
 =?us-ascii?Q?Y328OIozd8yTShiXZMn7cJRQdpY+HyPn8lGcPkWFTNbtZqf8gOvgOrh4GpBc?=
 =?us-ascii?Q?oHBz1xxT2e1YFXUIxLWpAzL9MWy8CKluKU9gENU1+JycDF/DDd3LrgveOnWN?=
 =?us-ascii?Q?iNSdtybnRhMBFPEXFIAaXYqiTcabzNBSSW17PjqrqRk6UrDAeoi8BXNA/gWw?=
 =?us-ascii?Q?2Neioi3SbbelU1G9BqZjwdXWHnOrV6FZjDMT6Eh5mF2P+3dRxQ/LMEGpSE91?=
 =?us-ascii?Q?1i4EXa00X+2+kYI5FWmkawI2/tmCiBz7glf4pbGqTkO+kOGz1us/xFYWSSfo?=
 =?us-ascii?Q?v+YpknvYcGaEWowevn/nPKVxxiOgVfBZFU33/RbBYDRE+WL7QB65vhPvAZCA?=
 =?us-ascii?Q?VPeO7AQca3oAOimi47GCowUXo4Q32hcFteG27PvG+SoHQKgz7DQaZ5zwiNms?=
 =?us-ascii?Q?iszOgPIbR+xpUZ9C2Mn9CbMhXe7GLW7AgaYNaKQAK2PqSS5LIMPZseFwXIbg?=
 =?us-ascii?Q?fcrDUgDwIIZm+uBFdivwhDy+518stWQIlc8wJs32cLAks10B4Pqpn67OVdIt?=
 =?us-ascii?Q?jnyyjYbf1pgHLwMvEnY8BV55WAW4WIN5G+TCwA2SeuAImn741En0pudAq4Fr?=
 =?us-ascii?Q?embzCrmb33a9i2qB4dYzYUa3rZoHU2dVwRf53NsPeY55hvmcFqnW+14BQh5k?=
 =?us-ascii?Q?kCVMiESIqpWW5qEoYusyL8VJBfGYBoKJ7U8KXNg7Ju4BPMWXLQf8qQIkJlqU?=
 =?us-ascii?Q?5g=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ebd04f9-d48c-4716-33c1-08da665780c3
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0484.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 11:45:23.5748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /u5mAmF6znQNRvCH/z/2pHHAMOjixMG3MYAfdTcT84zPt6pspQD2KZIJZ80PlOmYLtIMdYXYXjqjS5on2DiBiPYkXMhpdNRyuX8av7HkdTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0058
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CDE13A77 smtp.mailfrom=francesco.dolcini@toradex.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 15, 2022 at 10:34:00AM +0200, Uwe Kleine-König wrote:
> On Fri, Jul 15, 2022 at 09:24:32AM +0200, Francesco Dolcini wrote:
> > On Fri, Jul 15, 2022 at 08:49:31AM +0200, Uwe Kleine-König wrote:
> > > Unless you have a multi-controller setup an arbitration loss is a
> > > problem with the signal integrity. And increasing the retry count is
> > > only a work around.
> > Fair enough.
> > 
> > 2. We do have an I2C bus recovery mechanism implemented to recover from
> > a stuck bus, isn't this a workaround as retrying on arbitration lost in a
> > non-multimaster setup?
> 
> It depends, if you do it to recover after a transfer failure, it would
> indeed consider it a work around covering the real problem. But
> sometimes there is no practical way around such work arounds. I happens
> from time to time that the reason for problem is known, but fixing the
> hardware is no option, then you need such workrounds. (This applies to
> both, retrying the transfers and resetting the bus.)

And here I am back to square one, to the original reason we did this
change for :-) I feel like we do not want to merge this now because I
cannot prove/explain the exact details of the issue this is trying to
workaround. Not because _is_ a workaround :-).

Fair enough, thanks Oleksij and Uwe for the valuable discussion.

Francesco

