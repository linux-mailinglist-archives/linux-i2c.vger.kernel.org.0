Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73EA66C4C13
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Mar 2023 14:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbjCVNmd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Mar 2023 09:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbjCVNmc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Mar 2023 09:42:32 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93885CEEB;
        Wed, 22 Mar 2023 06:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVO3p11PWjo6FBCXqRwWfbLPkwYO5WUk0lh7J17/yswabQOv9jbZg6ZaMkCloXYXQZ5lxor2yNoOKB04yrP+glvBaF7AIAyDWXD4ObUTTr51ySvL6OxWy16/+4eKyIr/xub0zkKc/Kv+RptIj8sWc67AjY9IqxS//4YQQOuNAwMn8ySdr4YhMF05dTYIlin4q3xVYDi9Zbn69iNGc7+D/ScLwCWBWS+N1Q+rooE6swx8PXEnmmC2Dxs9BVXFiXpm6UYgM+r2cxRNQA0Dt9ibwtL1Q35IXGh18ChuTgCJgwc3okl2EOmjNCglvZlrZvNao190aFEftkuHncERYSBoFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=velrROyiXlfNuIEr3MELi1EMJNAL03RnpCFMb/i4SUk=;
 b=B5X+HE8aQ3jWE5PPHHmVjiuF/2qgarWmMtqC0h+ktlzSJlQlbD6C6wNV1TzgGEWFNDnhx1hUaDgzOH2JWPSF9WlVnaHIpf1V1y7IYywwAOiUhHurN99PLTqjiLXLNpprlvGhmNW3Z8deTTKPumPULZiyno6eooEaO+x6h7oXcDmj7W2MuDZykQNOlgyQije84lLS0W6/AMivCsSu//U6pDP5DxCSxjnmADswOIyVRLyiM1OWM9hf1yU3IwHWIbA/lS8/TdHbGmsMqp6PNiy2pppt9x03cuL1XENS2/sxk9K3reZC3sfIQIeayn6T5EkeHjtXQc1qfdqxa5q65oxpLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=velrROyiXlfNuIEr3MELi1EMJNAL03RnpCFMb/i4SUk=;
 b=IVStetqoE9X7LEqMmnDS4L22Qv+P+LAsQ4uusjXjJ4vGfWHks4fUQHacnBPc4HzdqTHIk7QQstKW+EJpR0kV09gGL0PIIXxZSs6xP8uzBC2JV/IeIn8c+foSnV4BL2dW0W4o7z1YjrHT8q9Aak+PhqamWGS02qbDLAD4NTqXm3DHZ8Qkf8lHdwFpQ/lQAVyr8r9eQmHom9IY6OnmeWHNgplMHfwFFFC3NTZT7S/fEjmWidQndDJGcI39CBMv4HfXnUoIhC8Xqlr+R2XUF9K8t3HAu5YcpWNJQlHvEBqguhz7LvM7F2SwU1U/siuzdI/mQO+jU9FIiaAvH8KFe11P8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DS7PR12MB8418.namprd12.prod.outlook.com (2603:10b6:8:e9::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Wed, 22 Mar 2023 13:42:28 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 13:42:28 +0000
Message-ID: <b9235dfc-10dc-1ed0-1510-fd98902491e3@nvidia.com>
Date:   Wed, 22 Mar 2023 13:42:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] i2c: tegra: Share same DMA channel for RX and TX
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "digetx@gmail.com" <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "wsa@kernel.org" <wsa@kernel.org>
References: <20230322102413.52886-1-akhilrajeev@nvidia.com>
 <db870e74-9d97-740a-9829-5fafc0bb0559@nvidia.com>
 <SJ1PR12MB6339FC0B9BB57D1D2300D46CC0869@SJ1PR12MB6339.namprd12.prod.outlook.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <SJ1PR12MB6339FC0B9BB57D1D2300D46CC0869@SJ1PR12MB6339.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0493.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::18) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DS7PR12MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: c3263483-5c32-4d89-cfc4-08db2adb471f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i+Fm8nMlGnPVLL8DduGwjG7a/W32BeoO47vacnoRuzI2JgxWJnwelljmF4CLvrFxaKSRCdbXbMCglc8xMwyfHE1FldjJHMNlQwmMF4DiTlQ6gOZfPZAyrvqqkdZag8UphRUmjst0Bp1o1rwCmv9OrZ8D4Egq4HkWbH5nwCpwfatGNwVbuG238pRMI7i63BHlGBitDB0pClEYCdroLpsT4XseWG+LIgopIr2Ql4VKo9OYaTd1zc3v1fIS5c1D2zVxiEyfvPG+WzzhSk/x5ehmqQF6N5vjE467Ol9Jx8c1eNfOTW/KodkvbQ2H4qovwkv+e7chtKE81F+EiSO83X0aYS96P5QOVB9Tr1QIzc54qlqF5+0j2l2LdyI+mraePrfRAfmuwAMGe+6M5x4Sn/B+o/CfRJ2L9yuarb0I/UfnvO0Dj+04dNxL+48tV8IaXhuIpZOzEhtEIS03K+jP3kRvScZHhNXwK/uvgM53XQpdEA2x8keOHh6t9MPaDnc51xf+Oqi4ArhIayVQeJ7Op/hVlqtENv/MGiztFUfLvayKm3ZBlVm+pyjFQlwiVKuiV9zEAAxCLEv+KL52oY7pOR1gm8DoMVRj4QaCwjBt0ie59y9bcNj/3A49ei783QsvuM2PWDEoTyjRiARaueIa+htEJc82RvG3iB4H0cITC8MRN6j0Hi+zIcozjwyMccKfsVTw3DOj42OrqFKNcjX6qEhPgv/2oz5pg6+1JlCgjXcBT0P9DLn59E0vgUA60vlZjaL+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199018)(8676002)(31686004)(66556008)(6512007)(66476007)(66946007)(86362001)(2906002)(8936002)(5660300002)(36756003)(921005)(31696002)(38100700002)(6506007)(6666004)(316002)(478600001)(53546011)(110136005)(83380400001)(6486002)(41300700001)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0N6T3RNUjJvcDJmUDlUMW96N3lYUG9LUG10TU5XT09rb0kzamYxK3lYTkND?=
 =?utf-8?B?aXFPODF4Wm1jWml1a25EZnJNa2w2OFhYYnNqY3hhTWZnZnhVYTRFNnJGRUdu?=
 =?utf-8?B?Y3doS1pJYnhGaG9tQjRoZ283and6S1VUQzFXQWtkdVBEeWdYSGFlSWlmckJU?=
 =?utf-8?B?V1AvQjlsQTRZekx1VXhxTklWa3hzWWxHS3hJNmdEQXBUaW91MVo3TTRiVzcz?=
 =?utf-8?B?YzBLU0N5ZitQaGp2UmxNYTE5SEUvcGVkZ2dWOWN2T1hTMi9QZitGMzU4M2Fj?=
 =?utf-8?B?MWNuRmxzVHhjM0pIai9zQlluRFhheVJ1bGhmYm83eFFweGhQenY5ZkJwT3E4?=
 =?utf-8?B?SFdjNUEzazhYcDVDUm9zRUhzMkpFdmJQd2pKQ05BZEhVZ1ZoZ2tBTnhTdEpk?=
 =?utf-8?B?WENkdTlSVmE1dFU4OEV1a014YnBXNkl3emRLNWo4eVA3dGtoenlnc1FpQ0Rl?=
 =?utf-8?B?THhZK2VkcXZ2MGUrcG4wLy9DamllQzNJWER2U0JDa0RoVXVvRlhvdFFRek9m?=
 =?utf-8?B?YnJsQWFQMWdNZ0JBdi9jWHltdFZNUm9tbnJrRExONWNTMW96bjFySGZva0FG?=
 =?utf-8?B?eVVIQ3BEMGtEdHVzd1pVYzViMm9wMXd1VHpSbmVKQ1lxbmNZVTNTM3hTdGEz?=
 =?utf-8?B?SnNaODZIUGt4ZHdzdUJQbUJBMC8wWnIxcHZnZ0JqRzZha0NNNUNFK0RwT1lp?=
 =?utf-8?B?SzZPUGgrdnF4M3pGMnpMZmRzd2lTa3N5OURiVDZOYkVRcXQvVlBUUUVwNjBv?=
 =?utf-8?B?L2hvaGpkZzhCNUMxN0VEdUczM0srZHRKMXI1VUR3d00vaml4VTdWaDZab3Bs?=
 =?utf-8?B?TTYwN0RNNUptWlBrbFMxbVB4L2doQkl0MUJuNnJPN3NMK0ZWNlRNMW5yT29t?=
 =?utf-8?B?cFBSZkp1dnhXZ21JN1RQMzhQMjF4Z3lHTyswWVE0OXlmUjVJZ1luY3E3S05t?=
 =?utf-8?B?UnFhbmlRdkZudmMxaXl4Z1o0bE1yanVmQlpMVWZBeStRNTUydUJjYno1emZT?=
 =?utf-8?B?WGRMbTFhSTVrd1VxUW9ROFlRSFhFMTJVQ3dnbzZsaEJKMDZZc3hBVjhSYVJi?=
 =?utf-8?B?TEl0aEFXTW9xankyVTVQRzBIQk5mUUZjQlptcDFjUDVScUJtaU1YSUZYY1p6?=
 =?utf-8?B?Q3Q4ZGRiRnVQUmZrVzRscFRKNkVlYnVaZlhCL2xtU2hlZUU2TjdkNGZsbXZM?=
 =?utf-8?B?RkhvTW4vSCsvY1dvVlhoSU11K0drMXY3UW02a0t6bVc3SFpreURob2NiYkxy?=
 =?utf-8?B?U1REZGUvNmxubnpBc21lYS9tRGJ4d2JtZ0V2aHFvamFEL2pHTnAvK3pKQW9p?=
 =?utf-8?B?bnJKZnlHUDNyMjNGK3grQnErUnFWU1NDMGQzTmRDcTA4d0xOWXZScW9EeW5K?=
 =?utf-8?B?aGtTMDJFSlp3eXVXN1JTN3JlMXR0TWFlRStsYzNqY2lxK2FyUDRwWGovZE9v?=
 =?utf-8?B?KzdOSGwrQjNmRGxVblArc2RmalhsK0xXWEZ5SmhMOG1DcDBHUmw2K01QOWlh?=
 =?utf-8?B?OVBaQjNRdEVib2ZubGJHam9PZ05aUlU0RVRTclE5enloNy9ZTDlNUnpVRXF0?=
 =?utf-8?B?U25RQTlqN1k5UlJnMy9sbEkvK2c5MndxMGd0Qm9sZUpYUWZnMnBHdlo2VnYx?=
 =?utf-8?B?OTFHVVZKZ2RHVVB6Tk1Vam95Z3YxM2Q4T2tiVC9CVWFIaUNuV0I5TnUrM3VR?=
 =?utf-8?B?Z3MrSHRkckl0c0JqTGFBL0pRQTl1emhsam03ZFNUUHRQL0ZRem00TUxGaVhI?=
 =?utf-8?B?QmNXUGJEZWtENzVRUnNaS21mVkswMnhFK29pbFkyeWZ3czJKV1o2K28vS2w1?=
 =?utf-8?B?TTJ1cEUyVytYR2VreGVvRk8rYWtLbVB2Q1E4Mk8rbjNpL0lYZVhQYXFLRGYr?=
 =?utf-8?B?KzZBMDdBT1lYZmRKTEdpWmoxem9zdUd4TllwbVl5YnRud08rMmNIaVVFOHdN?=
 =?utf-8?B?cUhWV21vWDVoeHNIT3c5d2NlZTZuc2luSEFiYyt2a2V5NEd2dEVCdnhpUWZx?=
 =?utf-8?B?Vjk1Yk1KL2pPMExoc0xQWWVXZHd1REFYRDhPU3FQV1hkWlNOTWc0R05obWNO?=
 =?utf-8?B?eGNmdjBmOXlSb2NGcWFoK044WTJEdUxtTmxxbWRoWkNWQTVXTC96M0daK3Nt?=
 =?utf-8?B?Zzc0bnNseDNtSlBya2taK1pOYUMwbWUxbDlvR2Nqckxrc2loRVBxeUw5RnEy?=
 =?utf-8?B?OWFGR0dWeE5SWUEyVXYzbTQ2VEJWZTEwVlhxUDNUcFpoTDZYTk9RRGJrb0dt?=
 =?utf-8?B?a2RuRFJ6dzEvR0p4Yy9HRldXTG13PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3263483-5c32-4d89-cfc4-08db2adb471f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 13:42:28.5341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZSCr6Sl73HWfZ3sjHxqSZj7r/77Sd7r0zkFUFcjxKQ+6XoJeHfNAN9yHPrMyW9ToJN95a8h+BeP8w1u7xh/gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8418
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_PASS,
        SPF_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 22/03/2023 12:00, Akhil R wrote:
>> On 22/03/2023 10:24, Akhil R wrote:
>>> Allocate only one DMA channel for I2C and share it for both TX and RX
>>> instead of using two different DMA hardware channels with the same
>>> slave ID. Since I2C supports only half duplex, there is no impact on
>>> perf with this.
>>>
>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>
>> Just to confirm. This impacts all Tegra devices from Tegra20 to the
>> latest. Does this work for all Tegra and the different DMA controllers
>> that they have?
>>
> Yes, It should. I could see in the APB DMA driver that the same channel
> could be used for TX and RX and the direction is configured only during
> dma_prep_*() calls.
> I did not test it on a Tegra with APB DMA, but since it works very similar
> to GPC DMA there should not be any impact.


OK. BTW, this does not apply cleanly on top of -next. It appears that 
this is based on top "i2c: tegra: Fix PEC support for SMBUS block read" 
and that one needs to be applied first. This can be avoided if you send 
as a series.

Jon

-- 
nvpublic
