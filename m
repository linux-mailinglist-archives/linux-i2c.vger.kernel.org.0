Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDB6571685
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jul 2022 12:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbiGLKFV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 12 Jul 2022 06:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232351AbiGLKFU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jul 2022 06:05:20 -0400
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1F34BAAB15
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jul 2022 03:05:18 -0700 (PDT)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2044.outbound.protection.outlook.com [104.47.22.44]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-45-w1sGumuEPnayMx7-E4MR_A-2; Tue, 12 Jul 2022 12:05:13 +0200
X-MC-Unique: w1sGumuEPnayMx7-E4MR_A-2
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZRAP278MB0399.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1f::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16; Tue, 12 Jul 2022 10:05:11 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95%7]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 10:05:11 +0000
Date:   Tue, 12 Jul 2022 12:05:04 +0200
From:   Francesco Dolcini <francesco.dolcini@toradex.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Francesco Dolcini <francesco.dolcini@toradex.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] i2c: imx: Retry transfer on transient failure
Message-ID: <20220712100504.GB319880@francesco-nb.int.toradex.com>
References: <20220712082415.319738-1-francesco.dolcini@toradex.com>
 <20220712090514.lt4r4dvlkn55jf2o@pengutronix.de>
In-Reply-To: <20220712090514.lt4r4dvlkn55jf2o@pengutronix.de>
X-ClientProxiedBy: MR1P264CA0145.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::10) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e065a925-bfad-4f82-5bf0-08da63ee0223
X-MS-TrafficTypeDiagnostic: ZRAP278MB0399:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 1wznW6f02aXWG/5upAzOoAW8LB+nJse6TNozZS0sM8D3ccHMSmLN/p30czNL4KhqWeoGcAdC3VJWTEEHNSTwtBfQZ3uM2MFCnEqDX3nJIuSs401xg3kjM1d8S5HpF4g/okn5EaRo8tUc8vEl6YYRS5SEBdtJkoKEUuBxCXjfHdKkVP/qPULECdKUa4BE3DHKW/Xm9CTOoXyk4zJsqagGnkgjSBGxHhFy/UQeLQ37iuv4gwy9cY80kdUrmv+nOcta+TThzL1FzfU8Rxj/1rwMDIFPvnhNLEARyP86T082FZrdVn3DkhSKfEDEQRkiFtncQM81oKcXXp0WdCU/4MNfioKJpqhD5IV3kC6UofmAGQDeKvlQ1nMEep++Zcb5pA3p/9Xs67M3/jLkEkvk15+lLhgbh/AXx8aCx+GLXx+tMBhTsipF8zIulyxH7G3t05vuBThKJ/fdQNFr6DBjfjK/G445mJ7M0futhO0ZJXswC2Rq0QB0TfWH+pWD4Zx0ifLBNQ+VNnY5ZI2RVj5HP4DtzNS/4Ea+7/7zZth/DX6HAme6I6VeIoDoPOnjLAkR1cKPbVAJtUtAqlbNBX26CEye+3vw2KXxqWtLOJJp5FR4sczZDEhRdCBuXlATt/rjqQSnutyNBb3VQ/4nf0RY80IEn/8T5Dj8/K1RuVAEtIvHNtFoxYSw7tcLKHq4s3d1tq37Gctec3+F0jUwcnoXCxEo5L26p+413gxp+iHyfvVh+pC394bhqXoffR84FB8WgWOy3bz8hOfNWosq7veZVGVzInkQC2MMdSWL9rafwNZZovLWQhXXNns695hTwbDsYey4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(366004)(346002)(136003)(396003)(376002)(4744005)(44832011)(8936002)(5660300002)(41300700001)(2906002)(6666004)(6512007)(86362001)(1076003)(6506007)(38100700002)(6486002)(478600001)(6916009)(33656002)(66946007)(54906003)(4326008)(66476007)(186003)(52116002)(316002)(8676002)(66556008)(38350700002)(26005);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cb6R2sfvAuwKmnBWUxJPmdZeoPpXYBPOUI88Aeu/DQsDQRveP4xtIV+qC6+i?=
 =?us-ascii?Q?Dxa/ZcfyvxNVw+5z5+UmyjIIyzsU1SK1z56KrhnTlxo980zi3KPuHKjLkSzu?=
 =?us-ascii?Q?K1Iqbotb0h+kEKl6Id3TzLnd4eQFTJSEbvW7lScMRwJFDQtj3kZ7eoCMCI9W?=
 =?us-ascii?Q?ZFROZAY5yn4GCJ1njIO5toQmctnzZliF7ErC77RdRLFf2NjMyrqxGMZ+mige?=
 =?us-ascii?Q?bHT+Jkkm1wecvnb+W2D06E6U3cl1VU/L3YFKN35YDorUj2pgDoyafzONtJre?=
 =?us-ascii?Q?uyFyecEvmh/b+rCbrfqt1PMvcIG4qdNDiNVDwwSH7bGSsQfElYMgZcqvI3Ix?=
 =?us-ascii?Q?1FkErdXCrHGRioYg99ZVSp1CX2Umq0wIVMCJ0MVRdGVWCSvIiqJMUxOjl2RA?=
 =?us-ascii?Q?O5pBvaaBjPwADcix0sMcjk52KFZmVpXMG+C7tDuHIR6V7WYfriwmuGY4ISBG?=
 =?us-ascii?Q?bn8Odm/Jt0yffTRA0TZLTV9ddOtZafCLFR0mNQwS5pf1VCwh5MotuLPe/kBT?=
 =?us-ascii?Q?Ij/VCAmmthJTnDAWCBl1mM3cgOHn6XNzxFD1au3qAwdvIbCtw7unLqh4D1mg?=
 =?us-ascii?Q?k6mqf3u5nMIJD7YrU03jKdGFo4b+GGV9R5eFkJ1rYF425ZgvhLeKO31S/PMs?=
 =?us-ascii?Q?yZnzoDqdsybl6GA7vruedZLMZPGzoSCfq/TP+K6TB+bWahhfRnGTnTOv1RLM?=
 =?us-ascii?Q?lTaS6jfH9b1oJ0KML5+mCCQoEvsaC4jL5KKojqIiv+J47eyoIWf7AELKemzW?=
 =?us-ascii?Q?xPOWtfvvLJZmCGCRep7D5RTEtROj7mcQoVeKrCpb2hI+cTZs5Xxn7X7h9quf?=
 =?us-ascii?Q?TwrqtSd8WRJbqqsHBwyaWasI/hgAe4HZ6c7PSJhvQoyhJrVNOuWlZsrTGxHS?=
 =?us-ascii?Q?mpoOc+8vAX1as0YgY0tSlg8+OZt5kNwxyPajx46t0UP1Dp9qvhSezWC9T0ZD?=
 =?us-ascii?Q?54Nc8IoiPCK389xXVaqAnHJYUEVTiQgmvgsB7ObBt06hKoztLWBG6OCtYQ1S?=
 =?us-ascii?Q?YTvv7MOjdoCEc3L59Bo322CMICEc4oKEo6ZzMvBX0jr+cDWNzsTEdrOBEoz1?=
 =?us-ascii?Q?4kBFdxVFj3RKlmIYBxanaInr2XL2Kg4GnV7KNbivQZq8UsFaOwnqVzsBG9tx?=
 =?us-ascii?Q?X9OSK8TkOQbRTrEqvo160/aoJWV1LyBGP7Wquw7d9qLlInH/r8S5YnUbTvBv?=
 =?us-ascii?Q?qOBJSYk6y4Acn0KqIDDtLcPjTTl3oj8gKUpB4l8QbmoOjbzoIRS+d4MEPYln?=
 =?us-ascii?Q?GZGYZq5alGzV6ut5NnoT5s/pz7Bm3l3nAj3atLV6s56/UuP1h/kcuY3bxwrC?=
 =?us-ascii?Q?1rSC2P7yF0o6SAKCtrMjyj49w5ucf7P3YLR201/6lzKBBCYZnlxuGeOvcWUR?=
 =?us-ascii?Q?2d/DfKZYryJDXezcoUbynkISOXMh66YAwTHh72GSwePaqD13t1weQjtgikhR?=
 =?us-ascii?Q?h87royf2E0lmOuBmKOY7SxLH6S3qpxz6iYInXcFJvAl380Miqv09Jmm9Hhwo?=
 =?us-ascii?Q?tzlitgkY6pIBDxnR25c2lLNxri8P9aOARe9LyeyW4vdBKKapkX/Sxx7oNUOj?=
 =?us-ascii?Q?uUNDOIs8fNJfKDibo3ZVU14aV58kDuqNMJGA8Vd3Rq9XIWuaEfvleQ/E6EQu?=
 =?us-ascii?Q?/w=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e065a925-bfad-4f82-5bf0-08da63ee0223
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 10:05:11.6365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZHysr1N4Mdw6Wy5B84Gh51ezPPeueB77gSrtodR6d4q84sTErEqFY22JuJLNWQ2+3Yit9/tXGElG6lT2ydAE4RbMN/mn8v6tuMt8XggNRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0399
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

On Tue, Jul 12, 2022 at 11:05:14AM +0200, Uwe Kleine-König wrote:
>  - I wouldn't have added a define for the constant as IMHO
> 	i2c_imx->adapter.retries = 3;
>    is expressive enough. Thoughts?
Fine for me

>  - In which situations does this help? Please mention these in the
>    commit log.
I'll do

Francesco


