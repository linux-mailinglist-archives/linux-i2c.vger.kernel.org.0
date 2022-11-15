Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 054BD629891
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 13:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237946AbiKOMTb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 07:19:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbiKOMTX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 07:19:23 -0500
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E390FE62;
        Tue, 15 Nov 2022 04:19:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0mNsk0/+wCxq+87omD3zmgNqiTs+h9jxrCpYe9S/dq78+jHGPv1e4BTyODgn/d8V3uHeQlPz6SWoyw4j9efxVmjXNSgvh7WyJtxFksY0ZbgbqgIlOahKtGucWWBX9hV3SkVXIGmqmcT3PeRsVk5vPULyV0yNyjvEkNjCIH8Hbj9mW+q5moJPUQ0p75AOd7Y8CuZbwLSHTE54228Jcy9RoU9VNfVc0d00TmN/FJxY88Xt1w5z4MqiCIAZ4kocLSr9MvtGI1LQV3dOIj+a9n8b7NQRK/xVEoP9bLCP4e9DnHBftBSeMr+OgNg/qZFgckel6DEX5bOgzyn+4VfxN0ulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNZJr12SBpoYIDk6GasROvPr5i8+auk0BE4zNTWGbH4=;
 b=nZ1utojSIcz++S+mSPkWiq+yYtTxOn3eCXoHQeWrbqse25AioNywHurn7RgqUTkOBPiWuvDbsadnZiAYd524mDWXQp6daAvOScBeKkTI/yCxZrA4ZyvlFf+LcMDtMFaizFarc31eSQOxIoeYXdzXF7h6MybaZqWeJNMSEn+etHX/iNMg2FI14Rx6bs2eXAG5wDwRe2nwNK1DFtMYGs9X6U+OQLVJEosMoSdfZWajPJRyxi575e1s/GBFAFVaND8Nd7Fmo9HDULfxA6vWxafQtcUXxgggCDlgeQmjJhd+gMmz0cQFwHJTPM6jUz5FatGa0cmZoVrm7WWwSNqcKgWPwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNZJr12SBpoYIDk6GasROvPr5i8+auk0BE4zNTWGbH4=;
 b=Dd9FR4BGEbvc/QUYyH+Jba0K72ISWYKL0srgT46W50xbCzxk74IKewuVKlBZayCuihThAkcEwChXCMYkZg0jJhaTe+xQtf+klTxibbpZdbrwWl+L7t7gi5Zq2k+yWqELaLHh6rdIBKSncV8fjYgQBaWmTyFqc9bhaIiPcQSyPyvbLUgklQHJyYwSVlbChv+afoFduvRCQ6HftxqLXGi0TVrORQgg+1uEsOYIMdFBQ3VcB1n+daQMzHZr+z49PMDmrGCgDzD3M6wPhjTzcdFIqr8Ym/Q9Eom76pq5VEufm45bnYnYcdTzjKaVqbqPJdeKoe9cVTL6rSCHoHSr5FEXmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SA0PR12MB4525.namprd12.prod.outlook.com (2603:10b6:806:92::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Tue, 15 Nov 2022 12:19:20 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 12:19:20 +0000
Message-ID: <5476fb9f-9a45-d51f-7bb8-8895abbd5fe9@nvidia.com>
Date:   Tue, 15 Nov 2022 12:19:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 09/13] i2c: nvidia-gpu: Remove ccgx,firmware-build
 property
Content-Language: en-US
To:     Wayne Chang <waynec@nvidia.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        treding@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
References: <20221114124053.1873316-1-waynec@nvidia.com>
 <20221114124053.1873316-10-waynec@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221114124053.1873316-10-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0081.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::21) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SA0PR12MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 01fb22b2-2e5b-444d-25fe-08dac7039f41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M6oMohid6afWbhSqv+HCVB8BIxYHGLwktxYDncqi6Wye5mj35WOacl78jKhp4DkwN9YIK9NDQjcOpS7+uoYOvuHr0i4SDSUnHttuPAiMltzy+t1l1q/VLNpc8qf5zoUYBup8sGK/tDGdwASsSx7/Tz8ASmZvJFgkRJBKZjkj4cEJHLAMbyXBj5RB+3AwTDb4BMtFyUEQ3neSjyYkD3IM/yUKJNc7MxDgN/Av+RWDBZ0FLw4t5tbl3vfnVcENaTY9/XwLDG0nLhYrQOx+2SbFhuZ9IyyGLqZNctqGoBlysKpb6fASKyJ/zA5OzDmgau68/r5/BzDUbW33mQyhotqpRbQO9lKYw84BWuLNtq1LS0uy45he2OmqVPc5LXECgfTiWFY0UQy+LQyj6tsP2RoGDJLFuc3TCKJ52MgJ1Oltk8rC0Mx4qiQnSmkjZwkZZMvFp/dSmZe63OljtOzt7AhPsCRzuhz7Id+4f0/Q6gV5qQpEDOxJtSA14canZ3tc4XiRaqNm6yoiUVnfHB762J7qDuukZzL6acgOfX2bp5UzOVA4UfFSrkb8nesRFa7Mm4ehICuFJG01ZDiHmBViip76nC6FNsRyc8z2j/yOBKO67NbWFrYuaTCf0NyM5rV/23bncLhHZI8czUvXK7HQ9ciOQC+UZ9poU7hu/J/cdXiqT7rpI/whA3YcaqbEADox64yJSLZ3S+rwkqlnQoU6guz5EA1mzytYnlmOJWhIZjr5L+uJiIsiKBpMamgwoPi4NfzEfkP/bhWdtcmmPhneYe+URll020XimAiVDuZZOGlDRsPH3X4KoSpIdZXgN1ixjIBl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199015)(6636002)(316002)(66556008)(38100700002)(66476007)(5660300002)(7416002)(8936002)(66946007)(83380400001)(6506007)(53546011)(8676002)(41300700001)(4326008)(55236004)(26005)(2616005)(6512007)(6486002)(186003)(478600001)(86362001)(31696002)(921005)(6666004)(31686004)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnIwZXVWT1VHN1d0dUo0T2l2ckZNVnpYLzlzMWNEckg2NGJESldzU29wRERn?=
 =?utf-8?B?Qm5RUGwzVU1oVEtCa09kQk5HSHIwKzlGTUIyL2hrcTRVUHlDdk9QUGVZZm1K?=
 =?utf-8?B?VTZIN2ZkYTBGWXpMQjFsSjJiTUpCbmlxMkJIMWk2em5ZNEQxUnZsR0lHc1ZT?=
 =?utf-8?B?NjVKd2V2TlFkcVlMOHFwY2kwNVFnZkNVWGVCOXhaTTRJMVlrSWp2ZVI3QlhF?=
 =?utf-8?B?dERkWWN3a2t4dG1pWk91V0o0SDJQeGVlT3JSOFQ1eUdnS0RVcmE4Ym16a2pz?=
 =?utf-8?B?MGcraUZjN2c2UjV0OWRObnlGQ0Z4bHVuL2VnYXd0dGkrYjNJMkd1R1lpLzNs?=
 =?utf-8?B?c1NHVGhrTU04VWVJSFFFWWQrRmlPcFNsUkpvSVZBSjN0KzVNbktuUHdKODJJ?=
 =?utf-8?B?K3R5RURiR0NuRTlEbm15ODdvM1ovNmw5Wm1SbDVZZ1RYeXd2RGp5dG5WdHRj?=
 =?utf-8?B?RE5abFMwR1A4WmxFYjRzV3hTd0gvTnRCY0lHdHAyZnNqWG9KbjFBenN0bjY2?=
 =?utf-8?B?Y1NCVE1WTG5RZ2pTcEhrek0yY1E3d1RSR0hYNENGY04weEdBWlF5R05tMXBv?=
 =?utf-8?B?WjVvRWlNNytGSms2SHJ5akEzc2cvMG1UWFl3SnR0Ymc2N2hLNU1ZVDQ3N1VI?=
 =?utf-8?B?dkl2TGFPVkQwSk9jSC9LZ1ZnZHpCbW5GMi9sTVhYNno1UVMveVZLbldVb2R3?=
 =?utf-8?B?NlN3UkNGM1U4K0lVWVc4UXFxN2JydUlPeDVCaVUzVzEwU3BHTFAvZzhEZlR5?=
 =?utf-8?B?c0xZYmk5bjdzaTgvT0ZJRis3N24wa2hxenlSemRnMzBQbUZjd1BqblRSR05E?=
 =?utf-8?B?bHpsV0Y4SjkyTU1DWHpxMkhYeWxJMHQ5MitkZkVPcFR1Y3o0Vm93YmlFeDFB?=
 =?utf-8?B?ejFheFplYnE0M3VvUjFNK3FRVmZOSXJPQ0h5NnpSRk43emticEtxZkI4Zndx?=
 =?utf-8?B?djVXVWZVMEs1Y0JXUjZHMDVLMHlLeDRRL1p1RC9qKy9ITmR6SnFBYTV3ZHJR?=
 =?utf-8?B?WVozNmxJbHhTSk1KOG1vbDkwVGtDdXZ2ZVRSL0JqUEhzd1ZXT2ttdElCRDNC?=
 =?utf-8?B?aVE2bUN2RVdxamFzRWN1bW1HWW5hTjdSY1I3dWsxVDYzamJ4SUpUSGV6dEFr?=
 =?utf-8?B?SVl2Zk5rTWpjWUhpd3FjUkpFVXdDaWZacHlaYWljVElPZVllTmxBUU9LVlhN?=
 =?utf-8?B?TnJQM1pFZ3NqTFphWTE2ZFZWWVdBK3JXVElrc0lLS216WTBlMTlnUFdGa242?=
 =?utf-8?B?OEVlSkpnK2VLL2l1TVJKbGdJRHBvb3BkUFBpOFBGeGpBMXJObzZjMVY1SmhM?=
 =?utf-8?B?b1FGUGtrR0Q1U05keHFuL3NZdytlQVRBSEprakRzYlpoR3lvYkh6OElEZHFN?=
 =?utf-8?B?RWFhUE9lZXJJVHJnU2N3a2xHV3MwTnRHNTFHVmN2VTJjSnFpbFBjazNIMzBh?=
 =?utf-8?B?aUhEaURoYUZ2RmlzSUhTemZERzdlQU9BSGY3UkZ3NTNxMWZSMkZsOFFrdUxD?=
 =?utf-8?B?algyT1c1Tm9hU2pENUpsaUo4VFpkRWdka3ZHQ2t3SE13bnNZSFdzKy9VbHFo?=
 =?utf-8?B?MHRyZUx1WXc3MElGV1Z4UUlrU3F1SWJhMjRtWFhvOVUxY0Uxci91cytqcTI2?=
 =?utf-8?B?Sm8rbmVlT3Z6Y3FwNVhHVzExdkZMcjA4L0tQUUxrUVBMSXNLODRGbkNkOWRt?=
 =?utf-8?B?dW9CMFV2RDgwSnBRa3VybEFGMEwvS05yTzkxV1RwcXBEckFvZk9JQUhMWEV4?=
 =?utf-8?B?bXc3RnlzS3VnY3pEWjlDakdML3VIWkdqZERlRXp2ZEZDNTNRSkxwanZpZUFq?=
 =?utf-8?B?bnVtekFScmZhRGNrQmc4ZnZMeFRuczh3Tlo5aEVXKytZNUc2eWp6QVNvWHZM?=
 =?utf-8?B?QWFBdDVIR2EzZzFtK2FQSWZmWFdMZ21ZeExaS1VRbWZlYUVWQWRKTm5GUnZC?=
 =?utf-8?B?SGxwUWtFVUlweWFZazZmcGdRcEZIL1B1YllWM29lTmM0Sm9WbEV6Wk8xK0dm?=
 =?utf-8?B?bll2VWE5QnNsSkJMTkhRMnBDVFovNk1RMUpaMng0WHBIdEg1SHNwMXljSGNq?=
 =?utf-8?B?Q3ZSbzFFNFIrL0JaZy9YelVMSmFuaGtrOHF5S0NQcDdQYjZsWUp2S3hPS1ZF?=
 =?utf-8?B?VmMyS1RPbEtaYUhiejFkU3RFOWRWUitLM3FCWlhFWnFDQUlUVmh5VXdJdk1m?=
 =?utf-8?B?NlE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01fb22b2-2e5b-444d-25fe-08dac7039f41
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 12:19:19.9835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5IjVkvpR862B/DT96uZ6qEyfP7Vc7pXT94s7UOjZfohaZq2Y8Kvh7gG78tR5nOTFOEU5UmDwx64QiMsDOeJ1WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4525
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 14/11/2022 12:40, Wayne Chang wrote:
> Remove the property ccgx,firmware-build as we have added well-known
> regex cypress,firmware-build.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> V2 -> V3:nothing has changed
> V1 -> V2:New added for bisectablility
>   drivers/i2c/busses/i2c-nvidia-gpu.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
> index 9b2e13bd44db..092d4d52098c 100644
> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> @@ -259,8 +259,7 @@ static const struct pci_device_id gpu_i2c_ids[] = {
>   MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
>   
>   static const struct property_entry ccgx_props[] = {
> -	/* Use FW built for NVIDIA (nv) only */
> -	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
> +	/* Use FW built for NVIDIA GPU only */
>   	PROPERTY_ENTRY_STRING("cypress,firmware-build", "nvidia,gpu"),
>   	{ }
>   };


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
