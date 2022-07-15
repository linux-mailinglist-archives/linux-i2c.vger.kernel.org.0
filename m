Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F612575C47
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Jul 2022 09:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbiGOHYn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 15 Jul 2022 03:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbiGOHYm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Jul 2022 03:24:42 -0400
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 13CF4785B6
        for <linux-i2c@vger.kernel.org>; Fri, 15 Jul 2022 00:24:40 -0700 (PDT)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01lp2109.outbound.protection.outlook.com [104.47.22.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-JrHMild3PgKDyEQn4V9jWw-2; Fri, 15 Jul 2022 09:24:35 +0200
X-MC-Unique: JrHMild3PgKDyEQn4V9jWw-2
Received: from GV0P278MB0484.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:33::8) by
 ZRAP278MB0111.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:11::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.15; Fri, 15 Jul 2022 07:24:33 +0000
Received: from GV0P278MB0484.CHEP278.PROD.OUTLOOK.COM
 ([fe80::fcc9:9f39:5e:7976]) by GV0P278MB0484.CHEP278.PROD.OUTLOOK.COM
 ([fe80::fcc9:9f39:5e:7976%5]) with mapi id 15.20.5438.017; Fri, 15 Jul 2022
 07:24:33 +0000
Date:   Fri, 15 Jul 2022 09:24:32 +0200
From:   Francesco Dolcini <francesco.dolcini@toradex.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Francesco Dolcini <francesco.dolcini@toradex.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: imx: Retry transfer on transient failure
Message-ID: <20220715072432.GA562594@francesco-nb.int.toradex.com>
References: <20220712090514.lt4r4dvlkn55jf2o@pengutronix.de>
 <20220712100504.GB319880@francesco-nb.int.toradex.com>
 <20220713115750.GA504159@francesco-nb.int.toradex.com>
 <20220713132437.GF24373@pengutronix.de>
 <20220713134329.GA495155@francesco-nb.int.toradex.com>
 <20220713155723.GG24373@pengutronix.de>
 <20220713202541.GA532546@francesco-nb.int.toradex.com>
 <20220714070705.GH24373@pengutronix.de>
 <20220714073408.GA542904@francesco-nb.int.toradex.com>
 <20220715064931.dvbzcufa3l3ojug4@pengutronix.de>
In-Reply-To: <20220715064931.dvbzcufa3l3ojug4@pengutronix.de>
X-ClientProxiedBy: MR1P264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::14) To GV0P278MB0484.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:33::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95c8620e-edda-495f-a289-08da66331095
X-MS-TrafficTypeDiagnostic: ZRAP278MB0111:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: edz5GUZTUG9lh2X+Fpkm49B3ESsegtPG6fMv3OuviQqPd9XcJGT2ZDs0LUDTcQo5UNV0t4+RxlxQc+LwcB2W/kjujH2USBNgROTIufy7IaoJ0YV8kZQdA8ACsJqPBRBDtxZ7iGJQA1x/9WCiqYYUtM+qTSG90QjlMCRLtfF6ODsf/9vsQeqM2RwrXMi+ppBi/DgzVMeuRzBTd0Cqj3qsR0JmLeVWsfWJv89FcaIlgvdliFVbA6wRkghWkhB1Dx5hdYRDtw/HSYmzDIo4N58Hbjq1il01Rjy0/HeipllJd5RSNWRUXendd1o+wwNlJWHwE8/JuSvrA8DEufv9BY0mLzgY2OALI1ediXXa432xBoMcQAOYLxLV1S2y2Sqcet4TAmvTEz3sjtJyYasoC9CTPqkx7qRDSC/QmeNwm5bdmfpXcWDeDvPGrBDnRr5bHzP2tVIPB+2+9HNlU6ceACxhw2XHg3CtyhfG8VkjeGXhaediqP0d14tsvN4Fs6rt1M8ZP+ugVLwOGFbwuylCqmRrbUbFrsppVPW4wmrPht8RSw2WS70ymmzLXVRQ4bjuLaLhkedTIyHc2zl0LN7oOolzE4JuyUeFsiWjkCFdun147iBcgkSlPEkFcauV/+lHxOSOLLYAhr4YzYO1O05Yan1zFS02NssvEDEMV4i85FkJUkB9ZPpdQ/MxDL/UqsX4pFkUV+Vo9Dkb5VPSSApjLVd7EAs0v8SEYO5N+/XREhYaLhstf1JJ+BAE418wGHboYeiQhk76dIRaSEYcABhnfqC19KYH++DmKU18MZDrIyM7HguuYwquourUG5NSFZqB0zW1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0484.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(346002)(366004)(39850400004)(4744005)(83380400001)(7416002)(44832011)(8936002)(8676002)(54906003)(6916009)(4326008)(33656002)(316002)(66946007)(66476007)(66556008)(478600001)(86362001)(6486002)(52116002)(186003)(1076003)(38100700002)(38350700002)(2906002)(6506007)(6512007)(26005)(5660300002)(41300700001);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ds2ZxAq/4WJmfw4dP+1Ap8F89f2s3uT/ksX0qNyjyvXNxh5HKFU4+plwftNs?=
 =?us-ascii?Q?qIkdgMAGvfYQ2l9p71eqnR5FIvwtF0Aow0fRhDKYTGF02q0Rkrs4sj65f2Gp?=
 =?us-ascii?Q?WwY5sBDg6mMw6l/BrWkqWwormdUbpsZkSZlyfcyymhxNlHXk2LX2THCgL+Ym?=
 =?us-ascii?Q?FBcNo0AdJRYNHXZDcO3KCTkfHprJBtExrSYxRHTy1A5cOAWET1+XPTpbRlPB?=
 =?us-ascii?Q?dJWgsmacigkoh/AqZGWjR9cBx7b+odXBs4T0lEq1JX4rLfX7w7Dkq5Pd2+w/?=
 =?us-ascii?Q?6P7Wc43qy9Atk1u7+W8jhuI+rJmtUS5iPi12auLPiqn0rlZuOq1hO0E5Yp0J?=
 =?us-ascii?Q?VRoXMYiHxe5vMI4x0d9JZ7AdfnyS0Cj629I0q0mHJHHa4VjX00e5GWoNHG7b?=
 =?us-ascii?Q?CoO6OxycWSQ4IjEDx9pBYZgAy30Ypoi5Ay+vSAYRNZzqhjk4Bjo18utmroxh?=
 =?us-ascii?Q?QUIpnb18GbT7jfRRiaCSVrEOEIMOJEnJc1cR8UjI/H/3ZXES8pOF8FAawSAa?=
 =?us-ascii?Q?985LS6yAvPAVY2RQoetynWPtvR+JwkkDtwhR6J7UTGkAt1pVH5Gyoj9Tg+Ha?=
 =?us-ascii?Q?roj/lC2CA/dASCmrMq9ee1Mra2y3zGOjGjL8Nd7rbZZMCsU73GXuRxDDKSkk?=
 =?us-ascii?Q?kbPRISolbCP8j+iRlEtvhRhlH2O6iGMqgRcHGG2YKxzeoqhw7mCLKSz8lKAN?=
 =?us-ascii?Q?FDuvkytaCf8F5b2iz0sLu1I48NaIY7YKSLUOqD6NJupXLR8BfWomoWiYAnzV?=
 =?us-ascii?Q?uaIAcVQvEWVrkL+sNumwSas66wkhjOWt21nEAlvevLdZkC8QytPjVJrQCjLx?=
 =?us-ascii?Q?8FMPaivsrBJfiFsSyb9Hr7ttlLCuVj29bpaBgK59vjAunXKHSwGJ9zeUJ5fH?=
 =?us-ascii?Q?2r30zltSdzOLAwZf/CPSOSRw/0Lu1KfURoFnse/eeILVefRQNPDmCuXwoeMA?=
 =?us-ascii?Q?k+GLYTy41ht85jsHqad3M3x4h3qxdAeoYQTDEF3CQCjdlLdTvkcEuKiP9X30?=
 =?us-ascii?Q?+oCjix5Pps9Fq48HUM4ed7wjIx43U7oY1NjxKqYVTqwDXRac4wPDaFaaxXcU?=
 =?us-ascii?Q?K3A+w9xO7b5xw5K7eOQ7d0sqAvpX4liC51FixEuLo5WQ+sJT+4TylolHJSFx?=
 =?us-ascii?Q?mCnZpkSOTyCcyd7GyzqqTeJcdzkRMIVQ78fS4AlGrVeuIYp9eirx/pNB3kGI?=
 =?us-ascii?Q?mA13/5Lfvxf7a7ARbbsEIRp5GiJM0dQdpHY5io9qjRmwnS43mSpGgDhUdajN?=
 =?us-ascii?Q?w7jkPNHEaIXiQTWS8ANy8YFeGCNSK9ys2dOrFwTbEgP7k//xgk8aI56FSueU?=
 =?us-ascii?Q?te6wv7RQFKO+0TXEJAy2ewno4Gbt8U68HG3XlFTuPEGqxX4OgLntnh+7I4C/?=
 =?us-ascii?Q?DPZ076Cu+SzMMIIWsDqbkyIiM5NPxKaIjf2UNJP1YnIzwvpfFPGi/kWtyeYi?=
 =?us-ascii?Q?nUYYB4EkajSv+5i2yNGJU+E53uwGw4dH0KFTDUeau78eB25O05xBzYoP80Ih?=
 =?us-ascii?Q?21jhnpycMeAAgBY/ZgVFLtw++lqRpNPaORAZtVHR/r9fXK2z+xSQ7R6v83mg?=
 =?us-ascii?Q?DGDrafVfbqIlmyjc/LYqMBxh8HNqtsfLQswiXl7f7zo/6mH2Gq+X5exgyU5B?=
 =?us-ascii?Q?2Q=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c8620e-edda-495f-a289-08da66331095
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0484.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 07:24:33.5204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQHp8NRigjyl/zyi2fIKCyj1xOCbATyDSkn4d27CIChdg29odieJXbU2lg2LlDTGP12pivzTJygHzFvO9DjJqxAhRslvW1QoG3VNPaQy7Vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0111
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

On Fri, Jul 15, 2022 at 08:49:31AM +0200, Uwe Kleine-König wrote:
> Unless you have a multi-controller setup an arbitration loss is a
> problem with the signal integrity. And increasing the retry count is
> only a work around.
Fair enough.

Regarding your comment, I was wondering:

1. There is currently no easy way to enable the retry on arbitration
lost at system level in case the I2C bus is multimaster. Unless we
consider setting the retries value using I2C_RETRIES ioctl the way to
go. Not my specific problem, but I wonder if this situation is relevant
in practice.

2. We do have an I2C bus recovery mechanism implemented to recover from
a stuck bus, isn't this a workaround as retrying on arbitration lost in a
non-multimaster setup?

I guess this discussion is no longer about the original patch I sent,
but from my point of view still interesting, real-life I2C is not
perfect sometimes ... 

Francesco

