Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C10B375D13
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 00:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbhEFWJi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 May 2021 18:09:38 -0400
Received: from mail-eopbgr70110.outbound.protection.outlook.com ([40.107.7.110]:33603
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230265AbhEFWJi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 6 May 2021 18:09:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUEz9FpbOp40DOeBEci+pHanGga2Mix5QK6leduj7XLoqpezRfyTZPVcGWf0OBlkWvRcfiNcg7ZPV7VoT/OFkaotcMO7QwpbeFsofbpsDwfSqMsClH1ATzmeIEvxiehY3Hgr9zkK333xxMwICvVJgKvvFSFo/DyUziDuwyFqJ6km+WJlyzpnpJ9JqBoMvrAZZa2dKNN+F8sdXWQGmnvpF8Kl37TW1pV+2Ztp7X8Cbt81IKkeOlCOFjE8YWxtLTqzp/Eem7mC9XEtz0M5Bf9J0biktBkWRlbQOFAPsYvp3P1zzxT/Lud9OAXRp2DH0GWCMR0hy22cET1lWwWET3IWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpjiEkM65R2Fc6IzPpadEcK9QHEWPzEc3vdEkYvRZik=;
 b=cBDL5sLIQ4haw8kg0T4foVvsB3P7ofakEZnuqqqrJjzzsY2qOo/5wrKgjqAXpZUmcaK04WKUr847GfmpV6txTwhqEP21u3l5aJtDzkIWq9/a2K9+RrWjW3wONbeOUjN+C15DZWXdeV8iXF4nOlxlGodfhd5Z8Mto3UU0NpF7HK9Iz4O4p4CRygmLWLDHrxMPhHAxYhrY2Dtx2PxG2Ep1OZ+wCnFh+tT3gclHvREjku7uHxJm3OMbB8dnxjyNTdyYYFrt65yiu4VhUWpOC/ZZ/4GvIOv98NiHr9iJcfIt/VQ8sOihNUNprsvg8f3b2P8ynU7SMrtQqGVwdPjMEAt46Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpjiEkM65R2Fc6IzPpadEcK9QHEWPzEc3vdEkYvRZik=;
 b=aFy+uatW8CqVxB0do92YeVRPXNLzR+1Zf9x3F76qpdUBQxMPW5jp1X+o1fUI5bm1Uav0vuZS5ginil5d5S7JX8os3huDeh9eU98IvMk9dx9UTCyUUW6jJDiJgtEabFdxRY1WnFAVn18x8j6ojcRh2HxS7jIU7ALc5S+tOMoJHWk=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB7PR02MB4602.eurprd02.prod.outlook.com (2603:10a6:10:66::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Thu, 6 May
 2021 22:08:35 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::d47d:ca8c:4fe6:3908]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::d47d:ca8c:4fe6:3908%3]) with mapi id 15.20.4108.027; Thu, 6 May 2021
 22:08:35 +0000
Subject: Re: [PATCH] i2c: mux: pca954x: Support multiple devices on a single
 reset line
To:     Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, joel@jms.id.au
References: <20210505215918.45720-1-eajames@linux.ibm.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <997d20b4-457c-17ba-e9bf-193132768afa@axentia.se>
Date:   Fri, 7 May 2021 00:08:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210505215918.45720-1-eajames@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR06CA0130.eurprd06.prod.outlook.com
 (2603:10a6:7:16::17) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR06CA0130.eurprd06.prod.outlook.com (2603:10a6:7:16::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 22:08:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7149f2fc-5095-46b9-98f6-08d910db7e62
X-MS-TrafficTypeDiagnostic: DB7PR02MB4602:
X-Microsoft-Antispam-PRVS: <DB7PR02MB46029DA972A3E521EB3FBEC5BC589@DB7PR02MB4602.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RPjhSSbarMN7kQQ/1btiNn3+BbzHSAgPvxwjJueR3De0Y2Q3eBUp9RiRogIkxAc8mMOjxIPKmvHYeunKtd5g0H3gZFjscZ038mkBwsoTygpQ+Tsa7jDIQQNHL2lVUm4jkTz0yCi4ez6hGnAc8lVVB+38A36VYQf+07MvwTrAK+PEq62UTzoipNNP9alIYr5tgTMvYGvmWcVdofb+f/syiawIPKahtt69BGaG6GR17BbeNyyndurNIQCZFqlAyz2RZhFnzz+u/Due9GBeC7uYkaLNgArc1KP3jC+6GTnr2JsZd+KlwVo6y+Ta2oB852N8EMHpdI+abF1X/ChYiMXC9D0iCpayyKdKg7T2bRSpKC9uNPszk9vxwkPbx6oGui4nELQrNNw6w11fyHHJ1t0YunTBYaxqlt8gaf+jj4uSKTWwOV1t6No5yVq5KsbzM8SZclYlOH8WnHsWWD9RnJtq0j72f+HXbNzYcFblthDKJBMyeTzlUneAygWJXg7o/23/eJ/6GC+PdDTHjIADnqaizptaAnyJZXoikeDeCsoEdc+6gtz3GhjWm+7FDDJf3elXCwx5IkFp4+n1uv5iPKu2VgjvCZUMf6s0WcIA49QUa9xfEGjusdtCNY1LeBU4HdptYlVFPUUUWFI4BxptBGbUoFvZ9TDlyBR5uhh4RrPUBH5fz1dsbOAE2S59Yry02Lfh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(366004)(39830400003)(346002)(6666004)(26005)(5660300002)(31696002)(83380400001)(2906002)(38100700002)(53546011)(36756003)(86362001)(31686004)(16576012)(316002)(66476007)(8676002)(66556008)(4326008)(956004)(186003)(66946007)(2616005)(36916002)(6486002)(478600001)(8936002)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QStPVWppLzhnTHdacGNLMGt3WWlQYWs4a21vMmRsbTFHY0FxWWpjcVBJbTJD?=
 =?utf-8?B?UmZ4eXdHb2p4Nkk2Z1ZTMkhjZm5rWi9BajR3VFIzVnZDNFZQTHMza05MTmg0?=
 =?utf-8?B?NWw4L0M0RmJ2WjNyblljNWMyMXJXWEtvbkc4YUVaZWRqcWpqN3FtbnVqb004?=
 =?utf-8?B?aFRGbzlicVlnR2NTTWFXay9nMEpwdFNoSU04VFFMTjl1NDZna1UxMGlLWVc1?=
 =?utf-8?B?UDIxVFVMdkxuQ096R2VKbG5JSjdLT1NLQ3dld3E3R2w0L212OWxOckxMck9v?=
 =?utf-8?B?NUl0WFZrTFBYVEdzUGFPRnRpUVhEMndJcWl3UDdvYXlVRjdGUnI4NFpQaFpD?=
 =?utf-8?B?aGRhdWlNKzVMNXMyYUdmVDBXZEZEeUJhTWlxT0hFaVMwZzlmQ2QzRlFoQ1Ft?=
 =?utf-8?B?SGlPeEQvWkZ0dERKV1FvYXkrOHhtZTd5OTR4dzArWStCVEpFWjBNRkc1bXUy?=
 =?utf-8?B?N3BUcDc0L2tnSElyVmZYRmRuRWE2U29Lb0ZRSFRYQmgzcCtDYTl1eC83Vkdy?=
 =?utf-8?B?Q054R2FmdFZPU2NSeWU3K1dwVWt3NG1kR3l5enRUeWU1ZW1SL0lVaGRTMVNI?=
 =?utf-8?B?dVM0SVhIcWMxWklGaGlLMGd4TzV3SVNkNFNxc0I3L1lsNkRmR1B1VVgySDBC?=
 =?utf-8?B?UVh5RlFnenhuTGZUWWx4RVBLWjBMNmZONUNEUkNTVzdrQlBydHNGTCtCMDB6?=
 =?utf-8?B?NU4xdDRCalZidFZLSm1GZW1GZDhBSVA0VmFlVE9kWFBCSEVUYnhrOFcydHNq?=
 =?utf-8?B?aGRpT01xeWU3VWZFWDJ3MThVNjFiUWY1b1ZybzBBbG5EQUYzV3M5SEFEanVi?=
 =?utf-8?B?QXFsS1l0MCtYMGtIUk9RbHdjS3g1NVlIZGVpMFd1R3VGY28xSG1BV0ZTS212?=
 =?utf-8?B?N3F2TkpEMHF4S1R4ZlFJSUpNL2VXZXBlK2FKVlRtaHNyMFdBQm1NZ1JIU3h1?=
 =?utf-8?B?a0hYNDBYdzZRYTZHMjRYUzRMNmhNaXRHTm4vcFVTeURqMHZpTkhlY3gxaThX?=
 =?utf-8?B?QzRtU1RGQkNRYWphNFVxSjhtM3ZtRWlUcTkxTEgvL1czODJHR2dITVp0ZG5j?=
 =?utf-8?B?YWxtelF2R0E0a2gzcEdPbUlxT0xvTGRoeDdlSWdjcFFXU05CWWVUQk92NFlH?=
 =?utf-8?B?QVJvNU1BeXBXRHFSNHFZUHZKWFh1ZjJkNERjSjdrWmdZTXZlSzNuTlJlQkpL?=
 =?utf-8?B?c0dCTitYMTB5K0U4MVFQc0ErMWZybjFJZ3FGN2lTWFpySERpQWFuS0o4OU1w?=
 =?utf-8?B?YW94TzlQMTk3ZjNKSnpjeUZ0eFJoUGdpTU14VE9lUzB0b24zNitjZ3NJZGpo?=
 =?utf-8?B?K2ErNjhWWlRPekRTUGQ0MmN1QWRheklXUEZiWHBpbFlJc1psMVh6Q3djNVFm?=
 =?utf-8?B?MU5XNEtxcDhNY3ZveWtPR1VnbWczYks3UFFpd2VYVDAxSHR0ekE2Zk11THhB?=
 =?utf-8?B?NzloLy9lOFliN0NUVGxGMHExWnd0NnJvMk8wMm1SaHJSOUJvR0MzQWtpbUZO?=
 =?utf-8?B?YWpWeXJkWWJnRDNCdSsreHdsRzl6RnJDYjVKZXpjUkk4Y1hIZU1RWXoxWm1L?=
 =?utf-8?B?N3hwMERMOG5RWUlPZlNNV0lpbDdoV3dpaG9rRlhncFUxTjR4SmpqU1M2ODNZ?=
 =?utf-8?B?SGptbjl3QVBpaDJsS205U1d1RlNaT2VSNmYvKzBCRG8xbjVuM0wrVVZwY20w?=
 =?utf-8?B?a1B1Ry9zS00xbnlEYS9Za3I2TzEvVldvWmlUbDdwSGQ3dkxyOHdVbkFWMFVZ?=
 =?utf-8?Q?jucBL3iZn425onD4wB7clmhmkk0Aime6HCMlYIU?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 7149f2fc-5095-46b9-98f6-08d910db7e62
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 22:08:35.5098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpL7k0FlaffxjS2KTISRs4/bktqEbij7BLec2/cRF8wwG+CTku4MNRE1AOUSN7/G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB4602
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

On 2021-05-05 23:59, Eddie James wrote:
> Some systems connect several PCA954x devices to a single reset GPIO. For
> these devices to get out of reset and probe successfully, only the first
> device probed should change the GPIO. Add this functionality by checking
> for EBUSY when getting the GPIO fails. Then, retry getting the GPIO with
> the non-exclusive flag and wait for the reset line to drop. This prevents
> the later probes from proceding while the device is still reset.

(nit: proceeding)

The patch assumes that all muxes with interconnected resets are only
ever reset "in symphony". But there is no guarantee anywhere that this
actually holds.

So, I don't see how this can be safe. Sure, it may very well work in the
majority of cases, but it seems very dangerous. If one instance resets
muxes controlled by other instances, any cached value is destroyed in
those instances and anything can happen. Sure, if you have HW like this,
then you have what you have. But I don't see any good way to handle
this case in an elegant way. If this scheme is allowed the dangers of
relying on it at minimum needs to be documented.

And what if the second instance reads the gpio just a few ns after the
reset is released? The first instance waits for 1us before proceeding
to give the chip some time to recover from the reset, but that respite
may be lost to other instances.

What if the first instance does the reset but then fails the probe later,
possibly because the chip isn't there, but then other instances manages
to time their probe just so that the gpio is busy at the right point,
and then proceeds without holding a reference to the gpio. Then the first
instance also lets go of the gpio and you end up with a bunch of instances
relying on a pin that noone holds a reference to. Or, yet another instance
enters the picture and finds the gpio free and pulls a reset behind the
back of the intermediate instances which have already proceeded.

Or am I reading something wrong?

Cheers,
Peter

