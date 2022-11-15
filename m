Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A20E4629889
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 13:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbiKOMT2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 07:19:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238066AbiKOMTE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 07:19:04 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2071.outbound.protection.outlook.com [40.107.212.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDAD23142;
        Tue, 15 Nov 2022 04:19:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGSMjTs8GZM0B3qJV29sCIhAMN4jdMPInoO0Dv3NHu4Dv3MuHx/FQCfoH4RKdgODjoyuHO9ZIAgORiHJa9aXCvOCmdjXJtuenNIChj4K5AveIH4MeY7pPnQVx0s3HCr9fqC4+Zm/8CJALJonC7edd0gWdA+C/AKe+zF4Y7svuhqlnb+/NJ605OTpUk1mnukbYuQ2gD0uZvY/p26vxLOfvGXP6WiiZbRv8U5GDw9l6Wnd9RCMOfeCG4RTYKmjIB1VWHWP/WuSCAAwM6oAHv2BPLArNa9zGIguAlLKCM06B2Eh6M4C5oNUHusWMUakCOqRNbBnM18E97dVC+7HV6TR5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkCe8W1UzQlLY2kU8hIcxF+rRRLN+3jMQ1sJ2mqoRZ8=;
 b=a9SRTL5xdrRy4r5TJ70eu2r3dZ1ltS3dBOX62mXdYtdw6U1LiPFnkwSeUyMQsyMYHy58S91z5hcs+xQdF6oNW/QFY/UU/Ig6rcHXQm8eaUGlAp3O4EUjrfoDfu980yOtozudngEh2AzPMM9FeiKkf9t/XBreDBHFbLrSQfHk/34rus1+lO1VfJJFePTIj/OgcVW9c5ppEwuB54GImheJZRjnnbWjhGufYRE/homgFO84M4Z9JmEHhojB5uLy0xFI+JIwVjPUaLbF64PlC7U0rJOfwravQ2RhAGimqq6miE+fHALbVKpNHC3frqyqMeGFcmRgKf6XpHzHiRCvzEX2Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkCe8W1UzQlLY2kU8hIcxF+rRRLN+3jMQ1sJ2mqoRZ8=;
 b=AoDQ0yIpVPYGgaGdXaAOGTuq3EJFpobODLpu+/0ghexjPwVb6LB6KksIBHTqaSuV0yGf/p4gSt56xi18beEUW2LOpBNpn7DMT7stTFDHBNF5CyjJ+rZxoGIRGkvw/glzgregNgs1Y7V9StubYmiGNztOvqKItyy/lZDAr5mYaB0wzJzmjOxfMjBj9hUJj9HaJRZ2wBFFIIJW4P5NX5c+26UWEXrV4LXGSIQtiDGIRGTWQ5egmmsDc/XR5VUgGqJZ7gwPWqAgppNj3PWGWghwap1CmaWiGfTcW5PZZ1qs82KPjnOV4F7qTMKTxFrDZoToYCBfXqlyA2/6lY55xk+aRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BN9PR12MB5036.namprd12.prod.outlook.com (2603:10b6:408:135::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.18; Tue, 15 Nov 2022 12:19:00 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 12:19:00 +0000
Message-ID: <7da6c4db-84cf-3532-3d16-ced2696e1ef1@nvidia.com>
Date:   Tue, 15 Nov 2022 12:18:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 07/13] i2c: nvidia-gpu: Add cypress,firmware-build as a
 well-known regex
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
 <20221114124053.1873316-8-waynec@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221114124053.1873316-8-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::33) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BN9PR12MB5036:EE_
X-MS-Office365-Filtering-Correlation-Id: 3941e217-2789-4cb5-9aec-08dac70393c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +U3MmA9H7l5toOogip1XBxDcpxi31okK7XsZzfVVBI514SDj680FrWXXQI5dD73J1qGWXUfU2Y24E3fYUBR0wxyVZczsNqttt5ZtWtDmdYWqMBP15nxxjj7oyUn8QzdjzbpBJj2zo2lSZm48Rsu8q7TiiKVW/vDx6TRrKpIFDOeQidqr3r2/c46OqOJCPhvTaxo4HQMbtHL3GSO8oHx1IbsjOhYYcFGZNPw7802hpDGJ8t4fWDL28XzX82jmRNw8nTCSEOfs3y7AUIUNwnjJ+a0Ab5cZddTTaO59nwzi41GsW6G1kNbfGPklBxTfmSmHQFEQbC5PnLXp5MehKwbyY/tjV1igCoBQ85kV/gkMroUJnmSdyUQaYyQd7eaLBSnel0VHpCl2J5i86WJOumpBncu7PeVqD5ZcuV03UmzDSfiSJCbcGtpg2tAzUk8DSbN1XukiUmCjiTMC+JOd8aMCwnxMlBgnvkqrNys3Wc7moSvWW2JeiBuZYqLAoASZrW9MpVJz/RP9h5fi63Qi/rOCr4PAtdJRreTE7we+W5Nop/Y58/geipoflbp+nl9fA9XC/DJtFP3oeemct6YF7Zg8YX7jaoub/oTN9lo7+U+umSWrZh76jN9V5rkuNwWT8S/M9BRl710lPDy9EKumoSOO4zoVIlS8nnT6Wf1TXJX9pUr/ZA3uhb/74x9a/jM09xArkcUD8Y2kBEchgKRo96rZwU2hyEZRFaHe9ZntyeFQrsggcJM2C5BVL73mmGuUFUuehTqBXjAbCTNmxhmmslrfy7mzg/Hjso2gXlWPDN3X1IidurupNczCOuch/oLv1Bal
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199015)(6666004)(31686004)(6486002)(478600001)(6636002)(316002)(66946007)(55236004)(66556008)(26005)(53546011)(6512007)(8676002)(66476007)(36756003)(4326008)(41300700001)(2616005)(8936002)(186003)(5660300002)(921005)(38100700002)(7416002)(6506007)(86362001)(31696002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ry9pckNLc051N3NNck9JZTcySThBWGJHVEVVZnY1ZGMxaStYWVZLaVVXcFhL?=
 =?utf-8?B?SXZMS0dlZS83OUlOSTlqV3MwdmFKR2gvdmRvOGVEeXk1eUMrVTdaeTA1Z0Q0?=
 =?utf-8?B?V3JxUGZNeURPQ21GSjdNMUM2ZXR5bFJpVitrTklsL3c2QWVIS04vN3J4Unhp?=
 =?utf-8?B?Ujhqd0F6dXAvZ2tMUVZtNXhoYkpZV1RqSTZNZFZTVWNFVEdHbVcrSCsxVUVv?=
 =?utf-8?B?VlUwbUNpbUpJNEJ3aDhzMzNDQzJPYy8zQ2NoVGV0bUxwakMwa2ovckUxcGpw?=
 =?utf-8?B?ek5BYVArS0lQZ09NTXN1emxiUnpzWkRGK2VUdlg4cnRGNUlGMlVVTHMyL29S?=
 =?utf-8?B?TTB4a2ZVQ05KVFh0b0VaTllqL2NBUmI0ZFBqUUVlRGwvaHF5SmFoZDVOWjZr?=
 =?utf-8?B?UkVPajIwcENpQU9IS2duOFZxTjdrSDB3N2xsSWN6cVNTMXY4ajBhMThCcnMw?=
 =?utf-8?B?T0ZWR09pK25LOWxVQTRQTDZzaHYvZ3kzcFJOOWEzOEVQQmwxWEUvVk02d3Ay?=
 =?utf-8?B?eSs0dGhlTjRhbHBUMWRiWHFFRDRFd3ozU2FnTk5kMkxheEFRRkpFOUJHWDlY?=
 =?utf-8?B?SSt2RmNxSHdIUXVjNFdNcGxxRE1jeTl2MEtyQlQ2V3ZoVXFDdS9yUVpxckg5?=
 =?utf-8?B?QXhDNFNDQTZYRmdvc3FkNXBmTmE2T0hhalFncWozWlFhYndXQVVldFpNd20y?=
 =?utf-8?B?WElRNzQvWFMrdHBCNFNxcmhkdEZNeGhPZUFtL01SRVZ4eTEyVG5qTFZOcmVF?=
 =?utf-8?B?WjBKOStBTmluMnNTVUcxL090emYrL2tETXJhK0NrOFY3S01VQ1oxbU92MXBM?=
 =?utf-8?B?Zm1RdWx4V3lLV0pZVXc3dy8ySjRpcTZSZGdUQy9ZQTB4TUVvTi9uSFQwa2Nr?=
 =?utf-8?B?QndzcU9kU0M4VHpYY0Z3SXppeWRIQytnOWk1VmxLV25scllGemNiOFBTYUU0?=
 =?utf-8?B?T29UUFNTUTZBKzU5MEh2bXNhWkNtZTA4SUpkNDlFRi83eEV4U0M0TGl4OGVy?=
 =?utf-8?B?dkVCV3Jya1JlV1NJUGY4TlFuZDBySjZZSCtaM3lIMmhrUFRZZVJCNW8vMDV3?=
 =?utf-8?B?Vi9mcTRqV3V6SEowSHd5dC9PekVlKzYxQVpqZjNqWVVQODhtWmJzNXFRVXNz?=
 =?utf-8?B?SGFSemNzVVVXOUhUamFua2FTZG1za3o0amJ0SEtMN2w5cHU5SkVqR2FEQStL?=
 =?utf-8?B?dVl5V3lqUTJGVkh1SEFSVG1oakI1VExnZ0NvQmpsOVFZNlZjTnRWRUJ6SVFK?=
 =?utf-8?B?RVVmTnBmL01DV3dXRHhDR2pQL2pLNUNzU2tsemtLbmwyazk1K29pSDU4enc2?=
 =?utf-8?B?MXM1bWJPd2RnbWtwcHFmMzdnaGJYQVJoNm8zQm9oNVFESzNqMmlNVzJUOHNm?=
 =?utf-8?B?RHNwRkphZHhvUllmYlRMZ2dOTU5HdEV3WkRHM0txYm96cXdsZUpoYjNWQk1W?=
 =?utf-8?B?U2VIdGd5NnRuUDlkWXR0a3phNC9sSTFJN0RKV0c4K2phdVdBU3ovTEpkcWZt?=
 =?utf-8?B?YTBHMTJoVXVVNGd6dmVlR2JETmcyYmcrQ24rcGMxaG9sTThhZTB6MnJGS01s?=
 =?utf-8?B?b05VT0xHRCtETnBIcmtXaGJoZE53QlI5MVZPb2p1eDYxR08wdlFRd29OVHZv?=
 =?utf-8?B?VGt5b0xObUFWUHJpOVZYeTZpSThzaTJ1QndBR2t1N0l3eHdGa1A1YndLK0JZ?=
 =?utf-8?B?RG9CcUgrN1lIKzhLZy92WnRDRWtLaVV6SHlMcXBQak1XQWpONXJEcmYrOUJw?=
 =?utf-8?B?anlCekFIUFlJT0NUQWQwSFNUZTFFQVRrWGhPQlZsdmhDdDNib2h2cWRDeHd0?=
 =?utf-8?B?TzFBcDhoRWhscFhMMHoxdjFLSmpSbnlHV3czQUQvdUUvUjhncGNSTzY3b3pG?=
 =?utf-8?B?ckVNbVhqeTJZTlE3dmRsRWJRZnduZ1RHVnQ3bnBZMDFxeEJtaG5vZHE2NlBT?=
 =?utf-8?B?L3Q0dzBXODIzVDdKZXZSRkN6WStmK1Rod0VYNW9rbE43V3pVb0xZZHlCYnVE?=
 =?utf-8?B?YVhBTWgvckgrUnJmSXFhKzFKZlg3N0NIVy9QNTd3VU5TWjRqdXhRaENQTUZx?=
 =?utf-8?B?UmdTM0JTbzZFRnh0Vi9MaHQrZk1ZS3B6REpCNk9SSEJEekxLQm8rMHgzT0lr?=
 =?utf-8?B?MTR0N1crS0NoS3pkTVY3bkV4WUdaSGIxRE1kNjEzc1FuTzBEd3huSm4vZ0R5?=
 =?utf-8?B?a2c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3941e217-2789-4cb5-9aec-08dac70393c3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 12:19:00.6901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKX+Rml27HvWYdHdZVLY+7oN+xN2Jl62pkwvFE1q9RZ3DWYK2pg3Imzn0p6AZkADZBrQ1jCcYyG2GXy3UYME1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5036
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
> ccgx is refer to the cypress cypd4226 typec controller.
> add cypress,firmware-build as a well-known regex.
> 
> 16-bit value is not sufficient for descriptiva names.
> Using string instead of u16 to make it more descriptive.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> V2 -> V3:nothing has changed
> V1 -> V2:New change for adding cypress,firmware-build
>   drivers/i2c/busses/i2c-nvidia-gpu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
> index 12e330cd7635..9b2e13bd44db 100644
> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> @@ -261,6 +261,7 @@ MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
>   static const struct property_entry ccgx_props[] = {
>   	/* Use FW built for NVIDIA (nv) only */
>   	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
> +	PROPERTY_ENTRY_STRING("cypress,firmware-build", "nvidia,gpu"),
>   	{ }
>   };
>   


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
