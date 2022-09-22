Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA3C75E701A
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Sep 2022 01:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiIVXKP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 19:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiIVXKN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 19:10:13 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00070.outbound.protection.outlook.com [40.107.0.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3E65F20D;
        Thu, 22 Sep 2022 16:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjEySSiKbQ58HDFL8iCaxXLwFwRolndK/8OLk9JtyD9ffE3Z2aUWw287Qw2Hlm3+GXIITRzI71rZKMu8W5htVKPWlqGKtu0YTIK/TlhQFbytuqScAiGaAIef5jIPVvnnr0ULPaqt0GN43LnqIFiUhV79aePCnoPk7MduMxJbbhE8dKZfXwQYHqKticw/YsKGzMhYP5B83Q+jDf8L+CQxeoaechSaEmGL49FOfBpZ8QJMDbmAU+0hlfPM3majH9aJ2fpF19eRENVKJPtQGOYaMkDpAoU0Dwwk3hLZmiQGxKyqTpkVo+BvygOJtlU6ihPrKKxSNLMUnrRVO40e0c3FeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8ztYgJHHpEohfPsiNOFJc+dwZRhHcoJ4H0Rz8hT6B4=;
 b=PC1wumOfWZHJeMuiS99xHYThMrgWvymsHgdqgq5A0+hWagT1UJSx8FjQio2y1NvYS83T+rM1zlfK4JPpwdtKpnzOvQAobx5tZ5C3LQNRbT2E+Sgpv3VbDAGSbBzL9SVRxQLzd2PYRYFj3fKXoux7Vaeu3oH1gTgng/853A20avpuHlFLeLcSI0+aNAzwAF3Mry5GP1qNIfrr/bLxvRVjkrwFz2y6ll4XwQXGkEtOj6203no5ItkIVqTNAVTsrf8Nv/962y6bgKXMEEaQ1C9I8RmF/YPJ5Ac1jk3xxnwhJECkpI5mQ+0kP5Zcg9N9xXc1eq84mRom19KIQ2ZoSgaqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8ztYgJHHpEohfPsiNOFJc+dwZRhHcoJ4H0Rz8hT6B4=;
 b=wDSPjWROLNEbYXv9nW1dKTwfvO0C8vPfr6IVNUIAwwSA8/WSZvRvCj/EYvEmR8pojKvl3Tcl4mubqak3MIU6vS963PP9XsD7AWx7g8milR55ifjib7hUPrHlNqLzVvjEMCPgLZMiJ2GYH3+EkyOQ5soDy+0+paB3Wcqr+X7wVBSD1S+iBqduf0s+Pz8soYvIVv8jqsABHtQYELxw0u5qXuE3kfq3it0gD9+Mw/fZd3s7oU6qOL1a5DEjp/NH3B1V00Kg9oJyphZZDxdRTuy/XEG0specxaOFlpDH/J0A8y+imDZCHzRQLphl3ogqGwK+ENetzRYQVsJPASxAAwSK+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DB8PR03MB6252.eurprd03.prod.outlook.com (2603:10a6:10:131::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 23:10:09 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5654.014; Thu, 22 Sep 2022
 23:10:08 +0000
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
 <c96c620d-a8a7-2aa6-452e-65e3e1fe79ab@seco.com>
Message-ID: <29a09f45-24f9-68be-bdc2-8691af41b5db@seco.com>
Date:   Thu, 22 Sep 2022 19:10:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <c96c620d-a8a7-2aa6-452e-65e3e1fe79ab@seco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0220.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::15) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DB8PR03MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b83159-bae1-4d3b-9d7f-08da9cef97eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cSwWCVNWSa1I7aH1BKyG83Qk8RlXBRUzFGJNFwXxJJ59qVx5pvkqa+hohlcpEtJ4VjV9f/gRFUrvY0N0F6AzxaAy4G5RggIzMG1pL4//UipVbOgB4JG3wRHMd/AL4TBj2MMkxIqEpkQemcHStJz/CDRGFWfnYj8fEbc7y/LWzor5/rW5Oekcc2nn1cF/0I64ev6D0T2Igl6bcQblb5KGFCPQqRPrYpuMuQFryUCmBbd2fHI3qXKET1Jr+Ks9vkizCPVU7hVzb9VqIadaWtJ/2EzGHZ6A4JIq0fDFEkdfJ8LmxjvN5yrCKYFoeZzxuZ4RyNI6ohY5u2z2sTBe1bwYwAbh9xcJdFTAvzlCagF+6ZqxJ+aXZh01aYh4LzEwZuslawnQ0gD+IJZfyfyV5tueNiOvbHVBzz1rVvEgZX+5ffplYAs8Y2WOMEKoRe4xPw6Z4utuznSkLyjVXABCaOfX+FEBVCaX/lJgC1N71caijJVWY0lXQtjZctvg29bJDcsbLVMXYZgZgYTpiNSsVMFrf0h4Td1M1SFtuYwxsDoC18uMQdEhe5lZ3xuZMhUJP/xNrHcqS9O6g24eBnYXTbqL3M3wqrFc4o50Sukf1v+aUI9yPDZd8CLaYjvZ2DhbUIt8JizdWHbK8GDFnFp9C6SUf07DXLiIEdxkJ72pU3Ib9tFSeArybSPeg/EgQ347FT3TbsLvJKfYXJu2qi33bwYUtBD5PhidSko0vNsdWBeNz9lSqOioZIjv6YmX8EEeMnwEvBXGVZGEk8u9qsa7bCd0s0r/vKPkKWunevgrrBhxTEqcl5+aYNBriPe6IWE1if1hCxep5q5+/kCK8doN+BaRyNdjUwEQHNidJZQdadFrKFaR3skKUOwFVTYcJTuO2zRn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(376002)(39850400004)(136003)(346002)(451199015)(44832011)(38100700002)(5660300002)(38350700002)(7416002)(8936002)(83380400001)(54906003)(2906002)(186003)(4326008)(8676002)(6666004)(53546011)(52116002)(478600001)(2616005)(966005)(36756003)(6486002)(26005)(6512007)(110136005)(66574015)(66946007)(66476007)(66556008)(31686004)(41300700001)(86362001)(6506007)(316002)(31696002)(43740500002)(45980500001)(505234007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG5QWkpoWGlVUDJ2VGJlOXhNbGFucEFaeEQ5NmFlZ0pRMnFsYTlwbTdNVUJz?=
 =?utf-8?B?emJNYUxmclVuZVV6dXl4VmRpekx2QXNNUVFneFZmdWgrdWhlOWQyK0YyMWR6?=
 =?utf-8?B?UnQ5WUtRSHYwcmxEaTVVOExGcnJQbVlHNUZOUGlLQ3NWVjhGQk0wVWpkaW81?=
 =?utf-8?B?NThIaHQzV000b0xiT1REeGlNL0lLOUpES2dhMUZKTlh5Vy95d2xTeFYrejN0?=
 =?utf-8?B?NTVjNlI0RlJMRHU2ZGZsNlc4cnhSeWxQNGZpME91UzlyNTJqRUxFd2dUb1cw?=
 =?utf-8?B?Z2NUVjVZQkdnZExLcWkxRFp3aWpwNEM3eWxWcjVuSkxwWW1ndVpPdVZ4Qzcv?=
 =?utf-8?B?S2doVWZVUUtJbmpmZ2xBMHluTmVycm44anhaMHNMWE5XSVkxeCtKQzFuYy9Z?=
 =?utf-8?B?YXlFWWY3dmtDUHhROTJ4QjVNdzVOOUJ1MkZnMWhNbGJoWDhWSFBYb0dXbFA5?=
 =?utf-8?B?RlNUWE9rWkpWdzBZcFErTGt4cnJNVnNXU0Q5THpHLzBaTWQzVnlmTFZRRFI3?=
 =?utf-8?B?aWJEU2JZbWM2MkNDWVU3NDlVeTVwemZnNGhBT1oxdU1rVWw3aW52dmM5M3J6?=
 =?utf-8?B?aEUyM2FoOWJ3VTlqQk9Hd3VCeXRocHpYbnpseVJyWWQ1NElHU3NwQ2d5UWxu?=
 =?utf-8?B?c3hNVkc2bmpHK1o5WVYrWVRnWDh6RU8yT243S08wbWdSOGw4T2dvT2N3UXZ2?=
 =?utf-8?B?ZDMzcmVlUG9FNUFUQnp3WkpPQUFQdlJ4aDZrZkkyRFZsRlBJVkJYMjM4WlpB?=
 =?utf-8?B?bjFWbyt0bTlvU2YrM0dPcHZSR3drNndUWEdQT084NW9manIzMjBydlpTQ1Rm?=
 =?utf-8?B?aUxrdWluMXBzc0tkczJWZ0Zwc3NmRXRhOEtXSTNwL0hYZTdLTHZtMHRZK3I3?=
 =?utf-8?B?NzUyYWhRMWgrWWg5SWhnRW9Ld21YMncrSDQrL05Bb2VqSVpXSHNjSHVQSENk?=
 =?utf-8?B?Z0txZ3dLNnIvL25YRDE5clJmME4vU09KMnhFRW93ZXEvc1VkbmFYYStpenE4?=
 =?utf-8?B?TzJMV21QRzJQVm80d1pxenY3aXN5YWdNdi9ROGhteHhpZklPSHpMWTRTc3pT?=
 =?utf-8?B?RGpaTFh2YjQzMlR1Q1NNbUtxcEx6SzlyNjNMOGlLZmFXUzN2QUZaYUdDVlZZ?=
 =?utf-8?B?K0tUWHU3NHA4d2Jid1dYN2JkbHBHSG1hMzFRK3lNVnRxTER4QjhZakVkREkz?=
 =?utf-8?B?QjRjOVJqZDdEdnZBc2VvUEFpNC9EWWxiU1RCZEFvMVpCdloyZGpMVmFTR0xw?=
 =?utf-8?B?SUdPNk9aVTFpUmJOSHdmTE5aZitnZzV4QzNmazY1TXlucWxlR0JteG1JNXcw?=
 =?utf-8?B?bG85UzdlUmdhOG13TkxseHNNYVZmQ0FOSjZFcFpKcnllekJRTHl2dE4yWGtL?=
 =?utf-8?B?a1liek4rUWVJQUQ3dTNsZDZMZXVJMTBEbnhvaXBZeWJOenRSTTZIak11ZU1O?=
 =?utf-8?B?NVhvWExYcGZOay9PVzcyT2VldmZxRXRmWmxDNXlOYjhBTGhmWUliQTZtVW5D?=
 =?utf-8?B?aDBMNHI0M1ZlSG05UGN1bGtyc1RxZm9KZjF3cWlNcWYrT1M1V3BEbWh0MzZl?=
 =?utf-8?B?RDJhcjMvTGlMM0NFNFBUS005dzRzcm92eGZ4am9VaU1aOS9zUmN0Y1hFYm5F?=
 =?utf-8?B?UXN4ZlJHakxmREY0MDduZldhb0JFV3Q3VCswTzZoRjg5THJKbjB0ZjZzWkEr?=
 =?utf-8?B?N3p3dzFxNlJWSEJtT3hOb051dWxWdFlkMUhXOGpaWDVmcEp1dWVndHpITW44?=
 =?utf-8?B?bzQyZlUxc05uRWdZMDk4MW1LUDVBTWZ5MWJWSG5iTE5KU1NweVlKOEtYdm0x?=
 =?utf-8?B?bDViOU5hbUVMTHF3T0dwSm1wWGVmbXIrSU9XbGZZV1A4V0tVUjFPSkJvREdh?=
 =?utf-8?B?QmpoTUsvdXlNUjVDSGtXWTQrSUk2RCs5emc1VEdjT3pvcTlHbVUvaUdPRnNT?=
 =?utf-8?B?TDdxOS9vVVVsb0dXV1cyZGMvNTJTeWdDcVBCdHJyaEZJWXY0OUVtU1lYejZy?=
 =?utf-8?B?UGU5ZFlVdDJHeHVQaWtPWGdDamFKTGtzM29oMTJSY1hZTDY3bnpSMHlFeWpo?=
 =?utf-8?B?aW13U2g4T21GVEZzSFFMNFNFV3gxTUpKNTdtck1WZGJucXhLUVlTaStHZS9U?=
 =?utf-8?B?Qy9sQkJwRi9PejhJYjMvTDcycDVDTWFFTFRpQVNIbTVtMWpzOWs5bU9OcGlG?=
 =?utf-8?B?cEE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b83159-bae1-4d3b-9d7f-08da9cef97eb
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 23:10:08.7514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7JzW0AcLZDdv9pn/ha4FuimPgMNhwvgmw4fGahuIy/vBPtYW38TyxxY8BMnNSVdUEaO6c8PdvQpa1cn657tPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6252
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/20/22 7:05 PM, Sean Anderson wrote:
> 
> 
> On 9/20/22 6:49 PM, Leo Li wrote:
>> 
>> 
>>> -----Original Message-----
>>> From: Sean Anderson <sean.anderson@seco.com>
>>> Sent: Tuesday, September 20, 2022 11:21 AM
>>> To: Robin Murphy <robin.murphy@arm.com>; Oleksij Rempel
>>> <linux@rempel-privat.de>; Pengutronix Kernel Team
>>> <kernel@pengutronix.de>; linux-i2c@vger.kernel.org; linux-arm-kernel
>>> <linux-arm-kernel@lists.infradead.org>; Vinod Koul <vkoul@kernel.org>;
>>> dmaengine@vger.kernel.org; Leo Li <leoyang.li@nxp.com>; Laurentiu Tudor
>>> <laurentiu.tudor@nxp.com>
>>> Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; dri-
>>> devel@lists.freedesktop.org; Christian König <christian.koenig@amd.com>;
>>> linaro-mm-sig@lists.linaro.org; Shawn Guo <shawnguo@kernel.org>; Sumit
>>> Semwal <sumit.semwal@linaro.org>; Joy Zou <joy.zou@nxp.com>; linux-
>>> media@vger.kernel.org
>>> Subject: Re: [BUG] ls1046a: eDMA does not transfer data from I2C
>>> 
>>> 
>>> 
>>> On 9/20/22 11:44 AM, Sean Anderson wrote:
>>> >
>>> >
>>> > On 9/20/22 11:24 AM, Sean Anderson wrote:
>>> >>
>>> >>
>>> >> On 9/20/22 6:07 AM, Robin Murphy wrote:
>>> >>> On 2022-09-19 23:24, Sean Anderson wrote:
>>> >>>> Hi all,
>>> >>>>
>>> >>>> I discovered a bug in either imx_i2c or fsl-edma on the LS1046A
>>> >>>> where no data is read in i2c_imx_dma_read except for the last two
>>> >>>> bytes (which are not read using DMA). This is perhaps best
>>> >>>> illustrated with the following example:
>>> >>>>
>>> >>>> # hexdump -C /sys/bus/nvmem/devices/0-00540/nvmem
>>> >>>> [  308.914884] i2c i2c-0: ffff000809380000 0x0000000889380000
>>> 0x00000000f5401000 ffff000075401000
>>> >>>> [  308.923529] src= 2180004 dst=f5401000 attr=   0 soff=   0 nbytes=1
>>> slast=       0
>>> >>>> [  308.923529] citer=  7e biter=  7e doff=   1 dlast_sga=       0
>>> >>>> [  308.923529] major_int=1 disable_req=1 enable_sg=0 [  308.942113]
>>> >>>> fsl-edma 2c00000.edma: vchan 000000001b4371fc: txd
>>> >>>> 00000000d9dd26c5[4]: submitted [  308.974049] fsl-edma
>>> >>>> 2c00000.edma: txd 00000000d9dd26c5[4]: marked complete [
>>> >>>> 308.981339] i2c i2c-0: ffff000809380000 = [2e 2e 2f 2e 2e 2f 2e 2e
>>> >>>> 2f 64 65 76 69 63 65 73 2f 70 6c 61 74 66 6f 72 6d 2f 73 6f 63 2f 32 31 38 30
>>> 30 30 30 2e 69 32 63 2f 69 32 63 2d 30 2f 30 2d 30 30 35 34 2f 30 2d 30 30 35 34
>>> 30 00 00] [  309.002226] i2c i2c-0: ffff000075401000 = [2e 2e 2f 2e 2e 2f 2e 2e 2f
>>> 64 65 76 69 63 65 73 2f 70 6c 61 74 66 6f 72 6d 2f 73 6f 63 2f 32 31 38 30 30 30 30
>>> 2e 69 32 63 2f 69 32 63 2d 30 2f 30 2d 30 30 35 34 2f 30 2d 30 30 35 34 30 00 00]
>>> [  309.024649] i2c i2c-0: ffff000809380080 0x0000000889380080
>>> 0x00000000f5401800 ffff000075401800
>>> >>>> [  309.033270] src= 2180004 dst=f5401800 attr=   0 soff=   0 nbytes=1
>>> slast=       0
>>> >>>> [  309.033270] citer=  7e biter=  7e doff=   1 dlast_sga=       0
>>> >>>> [  309.033270] major_int=1 disable_req=1 enable_sg=0 [  309.051633]
>>> >>>> fsl-edma 2c00000.edma: vchan 000000001b4371fc: txd
>>> >>>> 00000000d9dd26c5[5]: submitted [  309.083526] fsl-edma
>>> >>>> 2c00000.edma: txd 00000000d9dd26c5[5]: marked complete [
>>> >>>> 309.090807] i2c i2c-0: ffff000809380080 = [00 00 00 00 00 00 00 00
>>> >>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> >>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> >>>> 00 00 00 00 00 00 00 00 00 00 00 00] [  309.111694] i2c i2c-0:
>>> >>>> ffff000075401800 = [00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> >>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> >>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> >>>> 00 00 00 00]
>>> >>>> 00000000  2e 2e 2f 2e 2e 2f 2e 2e  2f 64 65 76 69 63 65 73
>>> >>>> |../../../devices|
>>> >>>> 00000010  2f 70 6c 61 74 66 6f 72  6d 2f 73 6f 63 2f 32 31
>>> >>>> |/platform/soc/21|
>>> >>>> 00000020  38 30 30 30 30 2e 69 32  63 2f 69 32 63 2d 30 2f
>>> >>>> |80000.i2c/i2c-0/|
>>> >>>> 00000030  30 2d 30 30 35 34 2f 30  2d 30 30 35 34 30 00 00
>>> >>>> |0-0054/0-00540..|
>>> >>>> 00000040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
>>> >>>> |................|
>>> >>>> *
>>> >>>> 00000070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 ff ff
>>> >>>> |................|
>>> >>>> 00000080  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
>>> >>>> |................|
>>> >>>> *
>>> >>>> 000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 ff 5b
>>> >>>> |...............[|
>>> >>>> 00000100
>>> >>>>
>>> >>>> (patch with my debug prints appended below)
>>> >>>>
>>> >>>> Despite the DMA completing successfully, no data was copied into
>>> >>>> the buffer, leaving the original (now junk) contents. I probed the
>>> >>>> I2C bus with an oscilloscope, and I verified that the transfer did indeed
>>> occur.
>>> >>>> The timing between submission and completion seems reasonable for
>>> >>>> the bus speed (50 kHz for whatever reason).
>>> >>>>
>>> >>>> I had a look over the I2C driver, and nothing looked obviously
>>> >>>> incorrect. If anyone has ideas on what to try, I'm more than willing.
>>> >>>
>>> >>> Is the DMA controller cache-coherent? I see the mainline LS1046A DT
>>> doesn't have a "dma-coherent" property for it, but the behaviour is entirely
>>> consistent with that being wrong - dma_map_single() cleans the cache,
>>> coherent DMA write hits the still-present cache lines, dma_unmap_single()
>>> invalidates the cache, and boom, the data is gone and you read back the
>>> previous content of the buffer that was cleaned out to DRAM beforehand.
>>> >>
>>> >> I've tried both with and without [1] applied. I also tried removing
>>> >> the call to dma_unmap_single, but to no effect.
>>> >
>>> > Actually, I wasn't updating my device tree like I thought...
>>> >
>>> > Turns out I2C works only *without* this patch.
>>> >
>>> > So maybe the eDMA is not coherent?
>>> 
>>> It seems like this might be the case. From the reference manual:
>>> 
>>> > All transactions from eDMA are tagged as snoop configuration if the
>>> > SCFG_SNPCNFGCR[eDMASNP] bit is set. Refer Snoop Configuration
>>> Register
>>> > (SCFG_SNPCNFGCR) for details.
>>> 
>>> But there is no such bit in this register on the LS1046A. On the LS1043A, this
>>> bit does exist, but on the LS1046A it is reserved. I read the register, and
>>> found the bit was 0. Perhaps eDMA was intended to be coherent, but there
>>> was a hardware bug?
>> 
>> Thanks for the findings.  I don't know the reason why this bit is reserved on LS1046a either.  It should have a similar design as LS1043a.
> 
> Funnily enough, this bit is not set for the LS1043A either [1]. So maybe
> this is a U-Boot bug? I'll test this tomorrow.

OK, this looks like it fixes things. I'll submit a patch to U-Boot. But
this bit should really be documented in the LS1046A manual as well.

--Sean

> [1] https://source.denx.de/u-boot/u-boot/-/blob/master/arch/arm/cpu/armv8/fsl-layerscape/soc.c#L680
> 
>>> 
>>> If this is the case, then I think dma-coherent should be left out of the top-
>>> level /soc node. Instead, the qdma, sata, usb, and emmc nodes should have
>>> dma-coherent added.
>>> 
>>> Li/Laurentiu, what are your thoughts?
>> 
>> Then looks like it is not correct to say all devices on the bus is coherent.  But as we have the new "dma-noncoherent" property now and most of the devices are actually coherent, we probably can keep the bus as dma-coherent and mark exceptions with dma-noncoherent?
> 
> Neat, I didn't know about that.
> 
> Yes, that sounds good. For the moment, only i2c0 uses DMA, so we will
> only need it there. At some point, someone should send a patch enabling
> it for the rest of the I2C devices, as well as the LPUARTs and SPIs.
