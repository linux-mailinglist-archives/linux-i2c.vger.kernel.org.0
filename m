Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 925FF5BF0CD
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 01:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbiITXFn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Sep 2022 19:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbiITXFk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Sep 2022 19:05:40 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC19548E8D;
        Tue, 20 Sep 2022 16:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRMo+2HZhWnEpRcNAEhucoxgubyW0MSZskMuKstRoAf00J3A99YTejq6VVDenQgdKXkCtC6Hif44EQewc6630295TC9stMt+8vkSOiAqa2SFM/Fk5WI1QIKb2SPUHgnoRvsMZ+tBY2lDYEexQa7YDWCbXKME5DCbK3G29tQ5932Vfc2ClyP5qLCUiAdtfQwXr3oTnJKl9ASGWTsFQmRoMcjsw2Gk+MVKE4BLKqN56Z98YAiWkEXBUq3TnEKRWJOoGavPBa4U78nLP+EacQJdQEAWRi+ZhG3o9qcAHVRMJ8WWF8DTDA8B+yrDSYkP5Myb2dPQYFFx82Dx9C3QehhQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDnTbTAsbVxNxnNH1OzUAoHATga6blrpfIOz9TXGpr0=;
 b=mplanm1R40d7r9RL5wn7H5YWB2IK3E3rzejsZAg7DggAqVBHozB2N135uecm6ImlxljaWTILcwh0VU5xBokcpBgHpqo/hXO5QqNSLcRhPZI7FoiV+qnozaveXWdVRV8tVqTpd0oASMQ6OijUGm3aIQ8dFA5XJVvkTwd81A4HD7P79sNHDhWp1zDT6o4HhM/W8ktbeZRhBEryh3wOVauvBOclYXgIeOB59xO/JDwOoot1nR3aux3u6cdBS1js4yqzMKUujKcDHjyHme1F3uQPi279ByprhlFKvFY6PXJuIX3Yheczn7vmgLLgNU4kPPG98l21JlEjvBCbbMf8/pItWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDnTbTAsbVxNxnNH1OzUAoHATga6blrpfIOz9TXGpr0=;
 b=HMWXxS2OnKbFZXNEI2w9FDr45jWmY/y74u4s4xvsLq9Q6uJ9CSK+m+SJBE7jCktsw4JhKXZ1AYgGNqk2CgkjIumNzDqy5anps9TkSyHJzmaMNZBVX0zAasbOmJ8nrU8ymWIfxk4inzBhGs8chRJuulXgQH1SPbZqPW+CjX7VEAeieF9jU40O/NNt79dCdVjSscoQP93UMcs31fzTRC377fjMX5Rc+blr3AyUOg+Y9bdfAB0eokzdmV70q/R71xXhO+ZPR1g9bFwH8Yg2kj98Qfny2w4CJ6V+4bfy6Q/yPLfIhY5ecgbg3TAoAEbSR4U+mBMZmN981NQNoa8JBIiPOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by VI1PR03MB6496.eurprd03.prod.outlook.com (2603:10a6:800:191::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.15; Tue, 20 Sep
 2022 23:05:32 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5654.014; Tue, 20 Sep 2022
 23:05:32 +0000
From:   Sean Anderson <sean.anderson@seco.com>
Subject: Re: [BUG] ls1046a: eDMA does not transfer data from I2C
To:     Leo Li <leoyang.li@nxp.com>, Robin Murphy <robin.murphy@arm.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Vinod Koul <vkoul@kernel.org>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Joy Zou <joy.zou@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <38974aab-06d0-f5ff-d359-5eedd2f3bb3e@seco.com>
 <5ef51421-e6b0-edd5-6b6e-439b47b794a8@arm.com>
 <9b20569d-7855-0031-3552-090ff7880cec@seco.com>
 <afc8b784-25bc-5c52-7377-ea901a908ca8@seco.com>
 <50a63241-1ee3-e0c5-1faa-2f2734774874@seco.com>
 <DBBPR04MB629834F56595A84723E4031F8F4C9@DBBPR04MB6298.eurprd04.prod.outlook.com>
Message-ID: <c96c620d-a8a7-2aa6-452e-65e3e1fe79ab@seco.com>
Date:   Tue, 20 Sep 2022 19:05:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <DBBPR04MB629834F56595A84723E4031F8F4C9@DBBPR04MB6298.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR22CA0005.namprd22.prod.outlook.com
 (2603:10b6:208:238::10) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|VI1PR03MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a6093e-33e0-4017-7feb-08da9b5c9e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OFNvKll3PA8lX19tLyXvThZrORRrE8HPIJI07Peti0cDsm11BnZIGw3WQ3znsLosLVV50zEc4iDiT96Lo6joDYF8/s9q5b4fXf/2OpanN64SGoJudyTqe6Mk2XSCO6FNDwYtzxaYYqBEnuHj+U7SZJCZYyg2crWLDvajY7BcI2NwUxgZOvh6kZCsWYElsRtQmT54mAdC6wAZz22nT8cT9ZlXD1rSTi3rCXIiwZtZyUjt5LjxII1Rx3zQo1kGfNiwzv4lpk5s7E2vzZGNkZwnAXEqLfLkpEy34fIBOrYqiVhuYfOo/+RhHDJOK96kvc0cuFd4DLSVyQ66Ph8kjwC7RuwlxDjBbZW8Fv29whplsSoeaxTX7wtrKf1xyJZmpL1tSS+QkXPVbPXbeIuvMw9xXFHUlmTXIrjNuRsmsN54fOiyzrOgAiI2NimxEMVrh3FsZCPQrN5UU46I7Q6mKDEEqvVpnmhn14Y9DDLLlySrDf6/bkSgWhmVjv5OWR3y0gMMkQu3GVqTQNp8aSyLmWRIi1E+e1RieXXkDhE/LdbKRz6XaPnR+Ao3XKXZa6w9KLBvk2VBn/vP74OV55bt8CCoHzoqZ+TcgLl6LPx322mRzpFeDdNc6HfMwp3sJalINSuz4VjJcJH7zrozH9lh+xqMMQyQsxcGHzpxa5Te94um7CT1s7p0t2/8bg7werfH9yejHGV3+/m14/CNJi+GoO32EpmNBrRbHPyuz2Xk97+gkTbdEhPjkBPtoaN6leskGVazatz45aB8F0rYtmKMUrgMQ1/O3u4dQUG0FOTtWT/qnMnGAqyRzgHS1ajDoBGFoG7hrv8W3Ww36Bv/QscqZEWYWdjC9N9arZ3yIrtSQAQ2Hlb+xHtyG12+bKR72ftleHsI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(376002)(346002)(366004)(39840400004)(451199015)(38100700002)(38350700002)(110136005)(8676002)(4326008)(66476007)(66556008)(316002)(66946007)(2616005)(44832011)(5660300002)(7416002)(8936002)(41300700001)(66574015)(186003)(2906002)(6486002)(83380400001)(966005)(54906003)(478600001)(6512007)(26005)(53546011)(52116002)(6666004)(6506007)(86362001)(36756003)(31696002)(31686004)(43740500002)(45980500001)(505234007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkdCQzZJZ0R1cThoOVA0UTlHVWd5Ym5EY0w4cDRqWXpjZlFUQ29NVVgwUVlQ?=
 =?utf-8?B?VDlBOFArRnZxNlYreXBrMDd1ZGFOYVZscElEdzNJdUJCZ05jc1RPbzA1VHJu?=
 =?utf-8?B?OFJHVVNYaExxU2wyZzFLUUE0TEtSdm5rY0daWEpKdXA5V05HUVNqM1A0NFlm?=
 =?utf-8?B?eW9hbHhOS3g3MGZucmJud2kxaXZXYXc4dW9aNlR6djdTNVFHUjBCeGI3TmVF?=
 =?utf-8?B?U0Q0NGNNZmg5a1hVaWlUSXYyL0hPNVFyNU1wSkhTRjAvVzRDZ2tna0NWYlZO?=
 =?utf-8?B?THNEVkFlMWEyYXVxcHNtQ1ZrVWIyK21Zako2cWEyRlc3RCs2REtoQ08yWjIx?=
 =?utf-8?B?UmFFdXZ3SnJOVW9PVTZhZDgwOUIxVlZDbndHK2hxU1A1V1g4M3VjUmNMZm9y?=
 =?utf-8?B?bjNIOGowcnFOMVdiNHQxLzBjRytreThSTGNMaHE2K0JDYlhSTmxnUm5zVHkx?=
 =?utf-8?B?YlFTQTFNU0xDbjNvOTg2Rk5ObGpzdGJnU3ZDd3E3QlNYeFFxbEdJL3RXSWhF?=
 =?utf-8?B?VjloZDgvSmdJWTU5cytua29GdmtJaFpIT2syRW5oUmZpZndPUlVrajl5dU1W?=
 =?utf-8?B?cnczWkpQODBXOGFWK3V3SFZEUm55WWFia2tVTWpRS0FOeTUwd09LVVlvVmdl?=
 =?utf-8?B?N0ZFUFQrYXowSlc4ZHltYUFWenhFNEFvVXRjWWlvdng5VE13VDdoRDRsWGo1?=
 =?utf-8?B?M3dJR3l0TVJBZjNSWlJTZG5PNURkRlBSZkR6OU41a1VPM2lTbWl3dzBSN0tS?=
 =?utf-8?B?YVcyVE83THEvYlBxcDRXL0lob21JMjBKYXdMSkxmdjBIKzl1RVRpM0xDWklq?=
 =?utf-8?B?bUgxSCtSeERrdWFDNXYwU0pZZjlwSzJaZ000d3BBV2RJanprQzZtTVhROW9w?=
 =?utf-8?B?TTZoOHFDcFdKQitZaG4vZU15Z1FFZmlMK21iYlVoY1NxYTd3RjFjeWpXd1Z1?=
 =?utf-8?B?V1BDTW9iM0pQQ2RkRDNMRm1saEVaUWEwT01FWDN5NDdiOUJnN3k0RGE0a1U5?=
 =?utf-8?B?Vlh1QnpUK2g4bWUvZE90ZXFkQ2ljMXN0Vm8xdU9vdWdIcVlFWDhacWZqcDlz?=
 =?utf-8?B?aktHWjRxR1BRSmx6MWNCSmd4UVh6VmpuMzVpM1Q4MDFHcFh3NUxDd25PdVkz?=
 =?utf-8?B?VTFXNVdnTXl5L0ZXQzY4S1R6clc5NzRzTklrakFxdFN6MnQxeUNRQTZ1Tklu?=
 =?utf-8?B?TlVOTTJMMWk0R3pRUUV0cVI0OGtyR25zTlJhS0lQOGZqMlZYeWd0SElUUzJl?=
 =?utf-8?B?d2hFRzFneHQ1OEo2d3BlTWR1SWpIZkw5OWZXQ0I1SzZyVFRUbFNlUThQYzRq?=
 =?utf-8?B?S1Bwcm9QMENtZE5LVEhUUFpVYzNEc1dmaXFqZDFxNC9heW94T1NuQkMxOXNG?=
 =?utf-8?B?UnV1eWJubWhoeFE3TWQ0c3cybktBRGUvU0NKNWQ1TG1aY2xBclNXNlRUNEtn?=
 =?utf-8?B?V25CZmNacnRHQU5EZURnS041QmprSzhERGw5Mi85OVRRUitjdVJTeVR2dGtz?=
 =?utf-8?B?T0czTmx3WVNvN1hOd1p2V21NNTFBMzBLOVluTGhTcUJkL1pzNDdoc0I1RkMv?=
 =?utf-8?B?RVJvUFpOeFQyK3lSYysrK2h0Q01MeU5Fc3lld2lKbUl2YVlhZm1NSjVLSnBF?=
 =?utf-8?B?QjBLOWRWY3pHblVaNmxzR3M4NlA3UmJGSTAvdmF0M1NLN0pYQS8yaXNNaENX?=
 =?utf-8?B?bDB6MFp5VXNwUjlhc3B6SU1JcmR4aE84Y1JrSG9EVXBheDlxT3NaN3hHYnRB?=
 =?utf-8?B?QmdaQzlqYnRRWnhlQ1VtajNuT1JnRlo5L3pSWE1yZnFNRDg5U290RGdXbFNq?=
 =?utf-8?B?YXdBa0FycGRtNjAwSHBIdVoycHdCdVBYR0NYUzFsN08vWlU5dnFoRDFDTjVr?=
 =?utf-8?B?R2ZiWmg1M21NSnI0czNIcmJPeWpVa0toV3d2QS9TaXVISGdsUStiajAzNUlo?=
 =?utf-8?B?VnNOTmo0OUxOOWdwUFAwTkZ3Q0ZlVWpqa0hTbzFtLytneEFyWS94QUZxTUF5?=
 =?utf-8?B?OEZ1RU1PT3lLQmRMRkRVWnJiL1dQcG55VGpzc0UvL3dkbHdvR0F2L3NSaUZo?=
 =?utf-8?B?M1YybDdKWW5DN1hKeEtlSFdnbUhpU1E1VkJkdXg3U1pCc3RvNzFiTmwwVkdy?=
 =?utf-8?B?ZGVHa1RRM1R0cU9EUzhEK0Qzak4vbDRlc0loYVlnYUFNNk9Qd0JOZ04vTHhi?=
 =?utf-8?B?SHc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a6093e-33e0-4017-7feb-08da9b5c9e5b
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 23:05:32.4939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFbzz3BSUi98qYuk+r14xxiebjQnpKRenMwDMaK8apGhseYt+35+648XG04lZed1rSJx1jz7Ld89Q8vB1Xvvww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6496
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/20/22 6:49 PM, Leo Li wrote:
> 
> 
>> -----Original Message-----
>> From: Sean Anderson <sean.anderson@seco.com>
>> Sent: Tuesday, September 20, 2022 11:21 AM
>> To: Robin Murphy <robin.murphy@arm.com>; Oleksij Rempel
>> <linux@rempel-privat.de>; Pengutronix Kernel Team
>> <kernel@pengutronix.de>; linux-i2c@vger.kernel.org; linux-arm-kernel
>> <linux-arm-kernel@lists.infradead.org>; Vinod Koul <vkoul@kernel.org>;
>> dmaengine@vger.kernel.org; Leo Li <leoyang.li@nxp.com>; Laurentiu Tudor
>> <laurentiu.tudor@nxp.com>
>> Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; dri-
>> devel@lists.freedesktop.org; Christian König <christian.koenig@amd.com>;
>> linaro-mm-sig@lists.linaro.org; Shawn Guo <shawnguo@kernel.org>; Sumit
>> Semwal <sumit.semwal@linaro.org>; Joy Zou <joy.zou@nxp.com>; linux-
>> media@vger.kernel.org
>> Subject: Re: [BUG] ls1046a: eDMA does not transfer data from I2C
>> 
>> 
>> 
>> On 9/20/22 11:44 AM, Sean Anderson wrote:
>> >
>> >
>> > On 9/20/22 11:24 AM, Sean Anderson wrote:
>> >>
>> >>
>> >> On 9/20/22 6:07 AM, Robin Murphy wrote:
>> >>> On 2022-09-19 23:24, Sean Anderson wrote:
>> >>>> Hi all,
>> >>>>
>> >>>> I discovered a bug in either imx_i2c or fsl-edma on the LS1046A
>> >>>> where no data is read in i2c_imx_dma_read except for the last two
>> >>>> bytes (which are not read using DMA). This is perhaps best
>> >>>> illustrated with the following example:
>> >>>>
>> >>>> # hexdump -C /sys/bus/nvmem/devices/0-00540/nvmem
>> >>>> [  308.914884] i2c i2c-0: ffff000809380000 0x0000000889380000
>> 0x00000000f5401000 ffff000075401000
>> >>>> [  308.923529] src= 2180004 dst=f5401000 attr=   0 soff=   0 nbytes=1
>> slast=       0
>> >>>> [  308.923529] citer=  7e biter=  7e doff=   1 dlast_sga=       0
>> >>>> [  308.923529] major_int=1 disable_req=1 enable_sg=0 [  308.942113]
>> >>>> fsl-edma 2c00000.edma: vchan 000000001b4371fc: txd
>> >>>> 00000000d9dd26c5[4]: submitted [  308.974049] fsl-edma
>> >>>> 2c00000.edma: txd 00000000d9dd26c5[4]: marked complete [
>> >>>> 308.981339] i2c i2c-0: ffff000809380000 = [2e 2e 2f 2e 2e 2f 2e 2e
>> >>>> 2f 64 65 76 69 63 65 73 2f 70 6c 61 74 66 6f 72 6d 2f 73 6f 63 2f 32 31 38 30
>> 30 30 30 2e 69 32 63 2f 69 32 63 2d 30 2f 30 2d 30 30 35 34 2f 30 2d 30 30 35 34
>> 30 00 00] [  309.002226] i2c i2c-0: ffff000075401000 = [2e 2e 2f 2e 2e 2f 2e 2e 2f
>> 64 65 76 69 63 65 73 2f 70 6c 61 74 66 6f 72 6d 2f 73 6f 63 2f 32 31 38 30 30 30 30
>> 2e 69 32 63 2f 69 32 63 2d 30 2f 30 2d 30 30 35 34 2f 30 2d 30 30 35 34 30 00 00]
>> [  309.024649] i2c i2c-0: ffff000809380080 0x0000000889380080
>> 0x00000000f5401800 ffff000075401800
>> >>>> [  309.033270] src= 2180004 dst=f5401800 attr=   0 soff=   0 nbytes=1
>> slast=       0
>> >>>> [  309.033270] citer=  7e biter=  7e doff=   1 dlast_sga=       0
>> >>>> [  309.033270] major_int=1 disable_req=1 enable_sg=0 [  309.051633]
>> >>>> fsl-edma 2c00000.edma: vchan 000000001b4371fc: txd
>> >>>> 00000000d9dd26c5[5]: submitted [  309.083526] fsl-edma
>> >>>> 2c00000.edma: txd 00000000d9dd26c5[5]: marked complete [
>> >>>> 309.090807] i2c i2c-0: ffff000809380080 = [00 00 00 00 00 00 00 00
>> >>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> >>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> >>>> 00 00 00 00 00 00 00 00 00 00 00 00] [  309.111694] i2c i2c-0:
>> >>>> ffff000075401800 = [00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> >>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> >>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> >>>> 00 00 00 00]
>> >>>> 00000000  2e 2e 2f 2e 2e 2f 2e 2e  2f 64 65 76 69 63 65 73
>> >>>> |../../../devices|
>> >>>> 00000010  2f 70 6c 61 74 66 6f 72  6d 2f 73 6f 63 2f 32 31
>> >>>> |/platform/soc/21|
>> >>>> 00000020  38 30 30 30 30 2e 69 32  63 2f 69 32 63 2d 30 2f
>> >>>> |80000.i2c/i2c-0/|
>> >>>> 00000030  30 2d 30 30 35 34 2f 30  2d 30 30 35 34 30 00 00
>> >>>> |0-0054/0-00540..|
>> >>>> 00000040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
>> >>>> |................|
>> >>>> *
>> >>>> 00000070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 ff ff
>> >>>> |................|
>> >>>> 00000080  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
>> >>>> |................|
>> >>>> *
>> >>>> 000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 ff 5b
>> >>>> |...............[|
>> >>>> 00000100
>> >>>>
>> >>>> (patch with my debug prints appended below)
>> >>>>
>> >>>> Despite the DMA completing successfully, no data was copied into
>> >>>> the buffer, leaving the original (now junk) contents. I probed the
>> >>>> I2C bus with an oscilloscope, and I verified that the transfer did indeed
>> occur.
>> >>>> The timing between submission and completion seems reasonable for
>> >>>> the bus speed (50 kHz for whatever reason).
>> >>>>
>> >>>> I had a look over the I2C driver, and nothing looked obviously
>> >>>> incorrect. If anyone has ideas on what to try, I'm more than willing.
>> >>>
>> >>> Is the DMA controller cache-coherent? I see the mainline LS1046A DT
>> doesn't have a "dma-coherent" property for it, but the behaviour is entirely
>> consistent with that being wrong - dma_map_single() cleans the cache,
>> coherent DMA write hits the still-present cache lines, dma_unmap_single()
>> invalidates the cache, and boom, the data is gone and you read back the
>> previous content of the buffer that was cleaned out to DRAM beforehand.
>> >>
>> >> I've tried both with and without [1] applied. I also tried removing
>> >> the call to dma_unmap_single, but to no effect.
>> >
>> > Actually, I wasn't updating my device tree like I thought...
>> >
>> > Turns out I2C works only *without* this patch.
>> >
>> > So maybe the eDMA is not coherent?
>> 
>> It seems like this might be the case. From the reference manual:
>> 
>> > All transactions from eDMA are tagged as snoop configuration if the
>> > SCFG_SNPCNFGCR[eDMASNP] bit is set. Refer Snoop Configuration
>> Register
>> > (SCFG_SNPCNFGCR) for details.
>> 
>> But there is no such bit in this register on the LS1046A. On the LS1043A, this
>> bit does exist, but on the LS1046A it is reserved. I read the register, and
>> found the bit was 0. Perhaps eDMA was intended to be coherent, but there
>> was a hardware bug?
> 
> Thanks for the findings.  I don't know the reason why this bit is reserved on LS1046a either.  It should have a similar design as LS1043a.

Funnily enough, this bit is not set for the LS1043A either [1]. So maybe
this is a U-Boot bug? I'll test this tomorrow.

[1] https://source.denx.de/u-boot/u-boot/-/blob/master/arch/arm/cpu/armv8/fsl-layerscape/soc.c#L680

>> 
>> If this is the case, then I think dma-coherent should be left out of the top-
>> level /soc node. Instead, the qdma, sata, usb, and emmc nodes should have
>> dma-coherent added.
>> 
>> Li/Laurentiu, what are your thoughts?
> 
> Then looks like it is not correct to say all devices on the bus is coherent.  But as we have the new "dma-noncoherent" property now and most of the devices are actually coherent, we probably can keep the bus as dma-coherent and mark exceptions with dma-noncoherent?

Neat, I didn't know about that.

Yes, that sounds good. For the moment, only i2c0 uses DMA, so we will
only need it there. At some point, someone should send a patch enabling
it for the rest of the I2C devices, as well as the LPUARTs and SPIs.

--Sean
