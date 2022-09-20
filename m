Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3822C5BEA76
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Sep 2022 17:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbiITPoW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Sep 2022 11:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbiITPoU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Sep 2022 11:44:20 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00073.outbound.protection.outlook.com [40.107.0.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2BA6172A;
        Tue, 20 Sep 2022 08:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaoD/Pnw+XJ3PfYmtynjC7QVa8fvJlpPm2QSXIFZ85n0gSukacAE6ggOW4lEY2F48BWw0ONxJPY5d55DMvpER9mMJ7n9r4jhATNr8hf5jsCauYNv58IhH90JIAqCkQoUKV40GyWaYSPvpCr+dQvUzntvwkA6NmyHzowEM/B0RhMgu/7aPOJDUrISgtJY/siyXbvgNS0N28OiHda/KFFXnEYIOBNGEZZT4HDoAK/JL6Q4MkiOXjJiuz8AjIK3xQjZ16Afq00XBG6khfX+SDhZ+0Wp2vJ2nid0PuHLmeZVd8X1A0ktFMDHbRctvRmv+ImQ0cwpImHPAwK8EmrYhjct6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceEclaef1uXtaiSSKVbHyB0ukVTlitF+F6FWX0VzwcA=;
 b=ghKImbKUhXGv9zpTsjXRUV1ZYlWq8PkV9gcmZB9PrgIU67CDANBqI0z0yP5/nV9fMNhTI3RnSHOmUdAgK+QF3W7nrSUT3vfOsHEPSwBvKZRDs68exRlSzcU/4VGweYgA3JXsXrd8ZH5isU5vOPLnI/mWasNK++UevzLSEB8aIn481OsleFdTon+qORCc0ZHRt8YES0ArkLBzIwzsFUDnOFRKGr0OX0pc2utQQyr2/PQUQnGakhvxtBnTv7+ntYZZ0RTN5fa4oQzMUaxyuVvs2f3Uhtl4N80tN+RAz7DInHY0bm/VZX9ZIZ9q2wbEiKqvyH7ugGukGDlGaufBLbZtqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceEclaef1uXtaiSSKVbHyB0ukVTlitF+F6FWX0VzwcA=;
 b=xrrPwGllu8hKTPv+kGWfQFj9385jjQJrx79rc8URmkjiWHyOd/wHVqlX8iQzRVxy3F2MYiWdQX1ls1bk74LLVlfrkpf1MIm4WfqfdWRZ3QkUb8SFlPKbxBDybWEbYWb5N322hDmmHrQacY6GuB6NPqpk3tBYDTHVy5RYMWgSXRIoiAXXQIWBccKHq5QEPi9jwhv81qHyRtAi9QcjRalbg7WtROworKCiaBthjH8zOmsq5GSSDefi8D+sLiXskZEiHwXSbpkqNH8FqG7FwidDl2mo90lfN1Qd7fziFSbW2K9AIkFswdOg6RZqAPMwp1l5vEC42HBwhsiQbz1ftaFJVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by PAXPR03MB8000.eurprd03.prod.outlook.com (2603:10a6:102:21f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 15:44:16 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5654.014; Tue, 20 Sep 2022
 15:44:16 +0000
Subject: Re: [BUG] ls1046a: eDMA does not transfer data from I2C
From:   Sean Anderson <sean.anderson@seco.com>
To:     Robin Murphy <robin.murphy@arm.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc:     Li Yang <leoyang.li@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, Shawn Guo <shawnguo@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Joy Zou <joy.zou@nxp.com>, linux-media@vger.kernel.org
References: <38974aab-06d0-f5ff-d359-5eedd2f3bb3e@seco.com>
 <5ef51421-e6b0-edd5-6b6e-439b47b794a8@arm.com>
 <9b20569d-7855-0031-3552-090ff7880cec@seco.com>
Message-ID: <afc8b784-25bc-5c52-7377-ea901a908ca8@seco.com>
Date:   Tue, 20 Sep 2022 11:44:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <9b20569d-7855-0031-3552-090ff7880cec@seco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0342.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::17) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|PAXPR03MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: a7373d80-b3d2-43fb-34f5-08da9b1ef946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PTUf5n803qPcaaYStp7Lb+ZmCWFOfFIZf6zqq0+FBU+asRfTwR0gQUNzG4611pLUf+5vpTxUVqUF11SVpesv7vWuNp766R8gzZUW+d9hCc4kOmwatMpu5oqfvjvHYSPQtJ7fOIg5OzQ5zkZfDYFN+dtPvKFArTPpY+bvcL4kuoRLlgos9ox4aSVzVfxQygwZimUGRhTn450rQgjtMjxMi/bK4qedCOhEINWy9mPC0yQuGo0+Ob51yqTQfFoDHYR2qQF2Sn6/oLDw3VFiUuzy/mE2i88dGerqfEclrlSARJN9aJeec3znLa6PbdFm/ENJKbDHq4nK/zNWzygm4iGQ7Wuqg0ZjgqQPq/K8kA71QMzF8x4mIdJc9Q1ceP9919UazF7i8ZjcS1Y8WuE8MUGmesiu/bBf2TQlHNF1JmzCQ/ormdd0pEOm32tdMYGbO5mwe9Cs8e8hcCtpcu6fq+FHZRLa10QTFr8eWv/5ZcqaarMangBNEHHsbcZbIwGFNrG3mMZm0l8gIS5ZCflUfQWGUgnblatjxNcpU9YQCF/e28+MHr9i3/j4Xrxa8Ayjzp782PuBetMnL9FLcnE1WYbxJ4uQXrkI8jetvZxVeqqSJN8uZsUX176rI3BD13XXXumPZM/7l26uKRUb1OnS2Wkfgt8Jdaq8W6NFF+e5tY4z6qelrSG0zt+6Uzbi3g6vTf7qy7EqvEvqb4LtTMkpMdyjKxoLrxXSt+jLYvlCU8mvWcmA61TfT/bOXcVLOT1YshwU6QdzRwYAJncTD9JIcepAOK2nhOUvQW25mLUgC8ncbtDHzXWuQ5QmDJ8R/hh1IAtJPxgVRnDG12NPavumRIgsAK0Sxmw73vA9K+6i1sP5/2Tu91Clubp7tnPFE4JhwMDB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(396003)(376002)(136003)(39850400004)(451199015)(44832011)(31686004)(36756003)(2906002)(6666004)(316002)(38350700002)(38100700002)(4326008)(8676002)(66556008)(5660300002)(7416002)(66946007)(66476007)(31696002)(54906003)(110136005)(86362001)(186003)(478600001)(2616005)(26005)(6512007)(53546011)(8936002)(83380400001)(966005)(6506007)(6486002)(41300700001)(52116002)(43740500002)(45980500001)(505234007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MExCcVdIbUlqWmUwVUpMdE9KbDhQelZ1c0tySnh3dkpuMU5ZOHNSUjBKb3hG?=
 =?utf-8?B?VkppL0ZpMWkyd1M4L2F5bXdnUlM2dzdpRzhQZnhySTRocDIxRlM1bHpQMzJB?=
 =?utf-8?B?NHR5VVRrd3h2bzFmR3Bta1QrNHp3RDNJUi8wb2YxOWtlOFdwUmJBQXhubEE5?=
 =?utf-8?B?MloyYXRlWngyZGN0UG1lSHp4dmVmRlFoSkNIRTF4aDh5Q2l3SHZwU1A2OEtP?=
 =?utf-8?B?MzZzYlZWKzdSOGRGUDFWREZMYzNoRjJ1MFpEWjFjRGdYdWZKaXpOUnBjcmNO?=
 =?utf-8?B?WjNMVWQ1ejlvd3kvbnpjdWVPMmpyYkZtVlI1akZIekxrZTE2dVJpZTJRakd5?=
 =?utf-8?B?ZzluVzBocEEvRnBkWWNZU2VNRTZFVzQ3aXI4UWlNTndTckd4ZlNjWkk5Nm85?=
 =?utf-8?B?RGx1ZzFRN3Y4TzA5eDlCRm56RHBuU1Uwc2lLS1dzQ2hTY1NyelYzczNTUUFu?=
 =?utf-8?B?T0tWUWxzV08xODMwY2xkNkRLRWtEVzNENWVoUENTUU9ZbkpwSGNXSlA5cVNz?=
 =?utf-8?B?dzhldUsxZ2djVHhKUVlOTnEyTnNpWm9UeUhoZGhrbkpJeThGTi9jZ1h0SEhW?=
 =?utf-8?B?dEw3R0EvRGhsbnhZUi9SdXpXZE0wVFZOUENpYk5XanByS1djQld5NVdzTThm?=
 =?utf-8?B?R2ZPelBKdFpuWHkzM2NzLzZNSzdFNHFBYkFZalB3ei9Ib0J1V2x5WTVBVWJI?=
 =?utf-8?B?b04vajlpVjVBQzhTUm8yZzlGd1o5aVpWeFl3K0xrNTQ3Ty9neldvcTlOVW5X?=
 =?utf-8?B?c0ZoamppSWIzVFIxbG5RQUF0R2hnOG5YNGlJNTd6UEZONlFZV1c4OGRVZ09o?=
 =?utf-8?B?aWVJcjZFUCs4bndSRm90ZjdIYnhwN1pQZFBtOFh5UnZOSTJwZnJndW5DMTNy?=
 =?utf-8?B?ZzcrVjZpUzk1TGlTUUkwQ2E5UlV3T3M5N3dhaldhdk1MWjJzWmRsZ21Ic3di?=
 =?utf-8?B?SnlsV0FuMStCL3ZRYnliWjFNbm9ZbHpCN1hjVUZqdXQyL2xlM0JhRk1vTXIz?=
 =?utf-8?B?WEZHK28vSWZIRm9nUWcxKzl3Q0xHMmVHdkFHUzNIdTNhcXlWVHEvRmM4ekFj?=
 =?utf-8?B?TGlqelBtdThVL2N3YXRIK1pwSWV6Z3FQejBuMDIxNXVpcmVTeVBOS2lMRHNP?=
 =?utf-8?B?MmhrUStJOERoeExVSEJGaFFoUUJ6S0JkL3hGa3V2VElFR05RQ2lXTmZGT2F5?=
 =?utf-8?B?d2dLQVNNV3EvNmNLNGV3MFkyWnZhRkl5aytXeTBMejhaYW5DS0l5RDYyZ05j?=
 =?utf-8?B?Y0s5Z01tR3d0bVQ1aW9md2hHamQ0NTFLMjlPYTNublQxeWtPQ1Y3Z3ZaRFhV?=
 =?utf-8?B?RklRdHdtc3Q0ZHlWcnRxL0dVMW1LWWlHbXBldVNhbm5GSWdNUldkYUhCZDRW?=
 =?utf-8?B?UjZRamlwYWI5dkk0djQ4OVUrN2UvekVoeUdVaks0M1kwdFlnZmxiZEdjcGIr?=
 =?utf-8?B?WWdvMDRBemFMU0xOTWNNUDJKMjA3ajU3NzlTajZydjlvOEFaTEJrUXFuMXdv?=
 =?utf-8?B?cjA4cG9pVWVrTkwzTEFJa3dsVFord3ludWxIUmVURDBLaFJLOG84YVpacUNn?=
 =?utf-8?B?YWhGRXN1ZEw0a01mL0IydEhudlVjL2RVTzRsRC9mdkJnamdtT2VSYllaMEdx?=
 =?utf-8?B?UGwxaHBzU0o4N0lrRyt3b2szQXNqY1U3cUpKdVNrVmFYekNiZXBlOFgwRVRv?=
 =?utf-8?B?ZlA4bFJyWWhtMW5hNlNRUHhoZkNwYW1DdzBxSXIvY1A0STJLNktkT2xkMHkz?=
 =?utf-8?B?Qm10ZjFtQTJ0R2plQjhPUWdMbTV5c041T3Ezam8wcEVKWTBEMU9BSmZSK2hB?=
 =?utf-8?B?Skt3U3dlbVFvMkpOYUs5QTRyODhFa1BTZDBlempEZDQ0UWNhTkIwV2Q0dXNq?=
 =?utf-8?B?djZGM041YWdpU0hTNEkya1RKTldzbFNUOVBvcnpNWXIrNXFBRUw5WlVnQVkx?=
 =?utf-8?B?Vkg5VmtadE83cGVqekVDZW4zMlRZLzJ4RWVtMi9aajlwMTNMckZiVnczWTJQ?=
 =?utf-8?B?aGVpOXlPbC9HV0RwY2RQYVN4Z3kvTUc1R05STzJibm9GakRYbkZLSHR0Qmdp?=
 =?utf-8?B?b3VobVZiMldKeVdiVSt6MU9BYjFGTW42Tk4rTDd0S1F2RnNCRzNMcGI3Nk1Y?=
 =?utf-8?B?NjJCdjlFUDRTSnZNVCtid0gydjhIRHlwZDUwNTl0aGgwbVprU0hPMFJCVG9v?=
 =?utf-8?B?VGc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7373d80-b3d2-43fb-34f5-08da9b1ef946
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 15:44:16.1204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWmPeJEK+o4X7HJyiNVi2enXyJ8RS+jSwL2RU+625EpMRoMZDFmn7z4gm/tkVKZ3ExjoNf3LWxlAgyfNtOFbRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8000
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/20/22 11:24 AM, Sean Anderson wrote:
> 
> 
> On 9/20/22 6:07 AM, Robin Murphy wrote:
>> On 2022-09-19 23:24, Sean Anderson wrote:
>>> Hi all,
>>>
>>> I discovered a bug in either imx_i2c or fsl-edma on the LS1046A where no
>>> data is read in i2c_imx_dma_read except for the last two bytes (which
>>> are not read using DMA). This is perhaps best illustrated with the
>>> following example:
>>>
>>> # hexdump -C /sys/bus/nvmem/devices/0-00540/nvmem
>>> [  308.914884] i2c i2c-0: ffff000809380000 0x0000000889380000 0x00000000f5401000 ffff000075401000
>>> [  308.923529] src= 2180004 dst=f5401000 attr=   0 soff=   0 nbytes=1 slast=       0
>>> [  308.923529] citer=  7e biter=  7e doff=   1 dlast_sga=       0
>>> [  308.923529] major_int=1 disable_req=1 enable_sg=0
>>> [  308.942113] fsl-edma 2c00000.edma: vchan 000000001b4371fc: txd 00000000d9dd26c5[4]: submitted
>>> [  308.974049] fsl-edma 2c00000.edma: txd 00000000d9dd26c5[4]: marked complete
>>> [  308.981339] i2c i2c-0: ffff000809380000 = [2e 2e 2f 2e 2e 2f 2e 2e 2f 64 65 76 69 63 65 73 2f 70 6c 61 74 66 6f 72 6d 2f 73 6f 63 2f 32 31 38 30 30 30 30 2e 69 32 63 2f 69 32 63 2d 30 2f 30 2d 30 30 35 34 2f 30 2d 30 30 35 34 30 00 00]
>>> [  309.002226] i2c i2c-0: ffff000075401000 = [2e 2e 2f 2e 2e 2f 2e 2e 2f 64 65 76 69 63 65 73 2f 70 6c 61 74 66 6f 72 6d 2f 73 6f 63 2f 32 31 38 30 30 30 30 2e 69 32 63 2f 69 32 63 2d 30 2f 30 2d 30 30 35 34 2f 30 2d 30 30 35 34 30 00 00]
>>> [  309.024649] i2c i2c-0: ffff000809380080 0x0000000889380080 0x00000000f5401800 ffff000075401800
>>> [  309.033270] src= 2180004 dst=f5401800 attr=   0 soff=   0 nbytes=1 slast=       0
>>> [  309.033270] citer=  7e biter=  7e doff=   1 dlast_sga=       0
>>> [  309.033270] major_int=1 disable_req=1 enable_sg=0
>>> [  309.051633] fsl-edma 2c00000.edma: vchan 000000001b4371fc: txd 00000000d9dd26c5[5]: submitted
>>> [  309.083526] fsl-edma 2c00000.edma: txd 00000000d9dd26c5[5]: marked complete
>>> [  309.090807] i2c i2c-0: ffff000809380080 = [00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
>>> [  309.111694] i2c i2c-0: ffff000075401800 = [00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
>>> 00000000  2e 2e 2f 2e 2e 2f 2e 2e  2f 64 65 76 69 63 65 73  |../../../devices|
>>> 00000010  2f 70 6c 61 74 66 6f 72  6d 2f 73 6f 63 2f 32 31  |/platform/soc/21|
>>> 00000020  38 30 30 30 30 2e 69 32  63 2f 69 32 63 2d 30 2f  |80000.i2c/i2c-0/|
>>> 00000030  30 2d 30 30 35 34 2f 30  2d 30 30 35 34 30 00 00  |0-0054/0-00540..|
>>> 00000040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
>>> *
>>> 00000070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 ff ff  |................|
>>> 00000080  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
>>> *
>>> 000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 ff 5b  |...............[|
>>> 00000100
>>>
>>> (patch with my debug prints appended below)
>>>
>>> Despite the DMA completing successfully, no data was copied into the
>>> buffer, leaving the original (now junk) contents. I probed the I2C bus
>>> with an oscilloscope, and I verified that the transfer did indeed occur.
>>> The timing between submission and completion seems reasonable for the
>>> bus speed (50 kHz for whatever reason).
>>>
>>> I had a look over the I2C driver, and nothing looked obviously
>>> incorrect. If anyone has ideas on what to try, I'm more than willing.
>> 
>> Is the DMA controller cache-coherent? I see the mainline LS1046A DT doesn't have a "dma-coherent" property for it, but the behaviour is entirely consistent with that being wrong - dma_map_single() cleans the cache, coherent DMA write hits the still-present cache lines, dma_unmap_single() invalidates the cache, and boom, the data is gone and you read back the previous content of the buffer that was cleaned out to DRAM beforehand.
> 
> I've tried both with and without [1] applied. I also tried removing the
> call to dma_unmap_single, but to no effect.

Actually, I wasn't updating my device tree like I thought...

Turns out I2C works only *without* this patch.

So maybe the eDMA is not coherent?

--Sean

> --Sean
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20220915233432.31660-6-leoyang.li@nxp.com/
> 
>>> --Sean
>>>
>>> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
>>> index 15896e2413c4..1d9d4a55d2af 100644
>>> --- a/drivers/dma/fsl-edma-common.c
>>> +++ b/drivers/dma/fsl-edma-common.c
>>> @@ -391,6 +391,12 @@ void fsl_edma_fill_tcd(struct fsl_edma_hw_tcd *tcd, u32 src, u32 dst,
>>>   {
>>>          u16 csr = 0;
>>>   +       pr_info("src=%8x dst=%8x attr=%4x soff=%4x nbytes=%u slast=%8x\n"
>>> +               "citer=%4x biter=%4x doff=%4x dlast_sga=%8x\n"
>>> +               "major_int=%d disable_req=%d enable_sg=%d\n",
>>> +               src, dst, attr, soff, nbytes, slast, citer, biter, doff,
>>> +               dlast_sga, major_int, disable_req, enable_sg);
>>> +
>>>          /*
>>>           * eDMA hardware SGs require the TCDs to be stored in little
>>>           * endian format irrespective of the register endian model.
>>> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
>>> index 3576b63a6c03..0217f0cb1331 100644
>>> --- a/drivers/i2c/busses/i2c-imx.c
>>> +++ b/drivers/i2c/busses/i2c-imx.c
>>> @@ -402,6 +402,9 @@ static int i2c_imx_dma_xfer(struct imx_i2c_struct *i2c_imx,
>>>                  dev_err(dev, "DMA mapping failed\n");
>>>                  goto err_map;
>>>          }
>>> +       phys_addr_t bufp = virt_to_phys(msgs->buf);
>>> +       dev_info(dev, "%px %pap %pad %px\n", msgs->buf, &bufp,
>>> +                &dma->dma_buf, phys_to_virt(dma->dma_buf));
>>>            txdesc = dmaengine_prep_slave_single(dma->chan_using, dma->dma_buf,
>>>                                          dma->dma_len, dma->dma_transfer_dir,
>>> @@ -965,6 +968,9 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
>>>                  }
>>>                  schedule();
>>>          }
>>> +       dev_info(dev, "%px = [%*ph]\n", msgs->buf, msgs->len, msgs->buf);
>>> +       dev_info(dev, "%px = [%*ph]\n", phys_to_virt(dma->dma_buf), msgs->len,
>>> +                phys_to_virt(dma->dma_buf));
>>>            temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>>>          temp &= ~I2CR_DMAEN;
> 
