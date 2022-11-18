Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 487A562F164
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 10:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241980AbiKRJjV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 04:39:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242006AbiKRJjL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 04:39:11 -0500
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2081.outbound.protection.outlook.com [40.107.101.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F03A93CEC;
        Fri, 18 Nov 2022 01:39:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbrqNzrMZ9YMShHnYHTQgglO7/NOnQayc283iJL9/fZ4nir+TfkAwUiBlNJASx+1e0t3Dgu3ozvC9f4QfyJixAVj2x6gg20LczVPm01Z1UlU08eD04pKxyY4iGyC5uTmNSYATccF40jR1R2CpynbSGIWfS6tR+LwtLFOd81+65HmzoFEzcNe1DU4SEs0GcYOirxz/Ixs3G+UQKNyeBULjf3BDsqSvO4MC6RSR3y1X0jehTKwdAqDQk3fH3NaAY7mIM6eorOuK7bD3oiFS1NBEY76CjRU1ntjlTbuvp1Nrh1SoIthhL0WsN2Fsu35f+0aJ+N6JrJXOzvr07K3ieMwjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFMH0/bVDUwMTcn2p9etan0qJ11yp+mYTZc45DczAmQ=;
 b=dMM7of7/TWPV6LtDwPyuAOL2tU4l9O7tNbPukEdwwrspkVt529AjEiKcrTlcd8NzpIAXAXc7F4J2GxicwttJjV59ykfvSVVgEzyVRkUcqxSHhKxjmxyy0jzRhn31i26yd4QD12SAwiyZW9gObUqnC/eEHtwgdkztwsK0SEMdeelsH3pUvA/IP+PADXFbSi9GezVtfQ16evSfmq7uqY4BmVGmuUL1/Ve+drDAlW7BN4TTxo9eY6jlDIGhvxXJ8So4ziBrwOTEj9H4NmvKyvqfKWgXCcqYm2GeAYeva2gWj0edLlFWEEoqyDMBD90XZz6/3TItzzCVf1BS6eficIgSQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFMH0/bVDUwMTcn2p9etan0qJ11yp+mYTZc45DczAmQ=;
 b=epehfCFOqEai6UvRKD+LaeszsdRqpY4D8cQYMnYBg8BT2ATUWAH+b7Ez8n6cZllr+8LWHgYqTkC5202IRxRNu2eXk91ccP6sHb8q5hAp6V2CeyutrUsdnzOY+qWgAaScpPLL6iZiJY4Z3V1aCp5bHkfQwygLo6MytB5oylnRWnJQkdGxAujC7dtzMAqtCL3QrsDZ4Zpa/3zX9JduG/D18hip7FaUQr7DLCatPI0eRBZWL9BtyYbM1aSPKLrKLdnhaKuW7YLY0vrp707n4bMFffd5pGJCqXK6mRD24SEVnF5ia28p9KgoEJ0ZTFQh5WcVlxRjLjasG3+enmBixeYr7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CY5PR12MB6297.namprd12.prod.outlook.com (2603:10b6:930:22::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.16; Fri, 18 Nov 2022 09:39:00 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 09:39:00 +0000
Message-ID: <29db0e24-4f7c-e3dc-91ce-2decf6a253a5@nvidia.com>
Date:   Fri, 18 Nov 2022 09:38:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] i2c: tegra: Set ACPI node as primary fwnode
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        digetx@gmail.com, ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sumit.semwal@linaro.org, thierry.reding@gmail.com, wsa@kernel.org
Cc:     Zubair Waheed <zwaheed@nvidia.com>
References: <20221117100415.20457-1-akhilrajeev@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221117100415.20457-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0047.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::16) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CY5PR12MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 2976eef2-0015-407d-06a3-08dac948b895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wuqdmB2YFenSSCV3TtQ6cPuL3ANnwOZbBFKSPHwAlbsly68o58NS8jAKkKqZ3tBzeLkCWSTM8H4htoPU3aj0uzUDZ0g4crt+HQCpvDHYa5AL5XYp/mOsUYRyeaK2Tzt7YzbUjHwRVlj3yQz9qwoN5sNqksLCbf28FjdVrqK3M699US1uxMibG4UFc86eENtdgsM3qxEI0C/AJmp+64zSrk1pRLs/5Ug4Vp97FkoUrm/iiJN059lJ7HMZa/EeV9Q408Ro5GRdSjX2dV8lUZZP772yi2MrS1X9OVRcpe7xjQp+nktgG/qAr4GfXevrHtJrN/t8OqMeOOfIeXVg7zq2NOlfqQzJ0T7+yjMo8l1uO1txTSH7oGNmpgsb0yajvsULXuRwjzK09P3qXUK1vGEVnX00YGVmQN/oFoauFf3oWEkXxDaQWH3Y/e+NSeRNdOi+agoIR0jZpKbKzkresJU2C0VKDIduMDLXPgeJ1rEXJGbLsrc4g2uQgJdn660z0P2YUrhFP65/c3cac5YfHCvVlaAfhtE70XPVxpeZ1cL1dF7ioTy3K/13DiSe8kzDjSxeIxft6Qv4cgamLalt8F9cuknn/bAVjEDoLuQ47JELnAYNss02jqQ0rUeYGDRDHyqxiVLP0MtWbrIgJp2zVi6np/geUOWjL6Jyqkz53zn+oz7PqKiEAEyKomrwqRAsAX2owbAomYhtUtGXB9O6NycksT4ngOmtO9juasDqtfVAzc/VQgW9d2YQN7j391+qBcni
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199015)(31696002)(6666004)(6512007)(2906002)(921005)(86362001)(6506007)(316002)(36756003)(38100700002)(2616005)(186003)(41300700001)(107886003)(6486002)(5660300002)(31686004)(66946007)(66476007)(4326008)(8936002)(66556008)(53546011)(8676002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2c1TG1BL0xCRFZtU2pkbk9YWU5rQzBkOVRDMnFoUXZFK04zMjIxcUVCOGFS?=
 =?utf-8?B?NFVxcUVGbjdXY1JsZ29vT2swT2hlNFg1TzVxNGdMaEE4Q2FEVGJVTlBmcHNB?=
 =?utf-8?B?OUZIN3hhUzFZampzdlNJTjZlWHhFMndYUDJlcUgxSWlZaWxKbE5oZzloUWJs?=
 =?utf-8?B?SXY3alVNSEFJWG1RaEtneEhrN2pwcGtNWWNjK1h2ZkxxZUFMMU5xemw4ZlRG?=
 =?utf-8?B?bVp4dWR4RCsvMWtXV3NDTGVIOTVaNkNtWWxpamV3OU03Vk93aE54Z0pwR1Y1?=
 =?utf-8?B?a3NFYVZGY0h2czR1b2wrMVZqNXdVQXUyOTR4MGs5WngwdU5tM0twOVFUUFcr?=
 =?utf-8?B?d3BtZElNOUVJMm1uK0NZYndxc3RqNTBvOEdXSS9PeUtjclpEOE9yQ2czQWlq?=
 =?utf-8?B?bC9MOTNSdGJHdkJ0SzErWjdLa1dsVWxpZHd5c01JZ2ZoaHM0MXk2STJDckVw?=
 =?utf-8?B?ZDdIbXlvNUNxNWdoZVB4WnJlaXdyK2NLWDE1N1hodXhNK3BoV3d3NWdKdERz?=
 =?utf-8?B?ZXF5OVBDNFZGN2IwdHJrcGs3RW51cVlCT0RWQXhSRXNqVWt1Z2N5dXNiajha?=
 =?utf-8?B?NmNqTmtPUmlsTUtXNXR0QURYMnExeHVUSG9yUW53aFA1cy80V0xReGxwa0Q5?=
 =?utf-8?B?WFBRVy9ocEd2dUZablZOUzJJMVlOR3dDTXZyZDZHZEJwV0prRG5jUmowNVpM?=
 =?utf-8?B?YWEvT1N6dmd6K1JlTkRkZzVhd0JuTVdhQyticEVuQzFLWDZaRWszWkZUY2pH?=
 =?utf-8?B?SVhad3NYeXIyQzBFUDZhQkxpSllkanR6YzBSRnBPRWxNQUV4ZGdPYkZJT3Zu?=
 =?utf-8?B?dTJyOGx6ZWlmMy9PcEZJa3dtWWJBZXhrT1pHQTl2ZkZTOUpSemlLekxRaUxE?=
 =?utf-8?B?WndwY2NscElaRHF0M2grMmJodnNxYS9TM20wNGdYZzhtR0hKc21ZQU1teWRv?=
 =?utf-8?B?UzBGTmlUanBoMFNWOE1nUm5QQkpXYmVRN2lHVHdLTXlNQ1VuM0NTSEJSdUxn?=
 =?utf-8?B?cThxL3E0ckxUN1YvWFAvdDI1cTV1WkprTlBFRHZhdFFkWFQrdTM0ODBVUFVt?=
 =?utf-8?B?K01lcW1QcFNRaUtwaXVGZ2JIbk1EM0FSYkp0TThkRnhNVG13TXJ5RUIyYU4y?=
 =?utf-8?B?MXdCL3U3MnZGclFPNmRtT3doKzBvV2s1SFo4SDRRZjk3TVhnTTVlSEZLcXQv?=
 =?utf-8?B?U1Q2cHU4ZW41bFJZOTRweEg0U2xqb3BOblpOdlVMTGVrM2prM2dQUXNZTk1v?=
 =?utf-8?B?ZFNRcmZ1aUFBS3VCeG44TzhvWkI1U3VFeGJkWkpqVnVrbDRZQWFCVERobmxH?=
 =?utf-8?B?NzFnUUxvT3YrUlJ4VkNJZThqcHQ3UytjQXdCT1h3eUpsRFUvM1RaQmFHalN4?=
 =?utf-8?B?a1dQVGtBcEdEK3FmRkdWQTZRUVcrVThONFRTYVZkUEJMRTQwRVpiTk13b1Ft?=
 =?utf-8?B?VUU1N1pjWHF6SlFkSEZMVmxnWkF6N0xxRjNTdVRKSGh6TUdMcDlCMkNDRHo4?=
 =?utf-8?B?M2t6QlZ1WHphZTBiMXB5MSt2anB2Y05Oa21uL2JkRlh1eVU2UVd6ejY4TGNK?=
 =?utf-8?B?NU1haFB2bllVQkFYcVF0aUxtUnhHaVNOSytBQkNoeG9CNU1vTCtUaDBvbENY?=
 =?utf-8?B?ekcrQURSaFlOSmVscXh2KzQ3eEM3VGxhT09SeUpBRmJNRnFqS3YyQkdiRVgz?=
 =?utf-8?B?em5NRkRsaW45c3ZLaEN0eFllZW53U0hlQkRONFJSbHlkRmNEREkzZEMzVGNj?=
 =?utf-8?B?K0xrN0wyLzRNZzNvZDZ2VllacGRsT2cveXFrZEhlWldXZ3czUzZ6T1dYM0lq?=
 =?utf-8?B?L0dmVnpkVzM2MGc0aXFwUTUvQmxuSDFhWko2c3ZxaU9pVWRpdm1UYW9UVXlV?=
 =?utf-8?B?a2ZsYXdDZVg3UEpZUmR3V1FxT1VqYllBNG01aUxRTFFvaU1jdTJ0WCtzUm5t?=
 =?utf-8?B?cERQVVF5MVBZcytpYjlwQ2FJRXZuNk50OG5RdFRTc01UNkNUNEFweEVKcGVu?=
 =?utf-8?B?MisrR2U1ZjgySkx5ODJ2bG90Q2g0TWhZRU9oNHhwdjdDNXdkMEFXR0ZRUXN4?=
 =?utf-8?B?TlJiNlg5eVF0Y2ptWmtDSGdsb2JwQlRmSDR3V0VmUEgyU1BuK09SSmJYOURX?=
 =?utf-8?B?c05NcjJ3K0VVK3VtSzdrRXlpbHl2WGFSWkppRUV5ZER5WVpWaWR2N2VUeEJz?=
 =?utf-8?B?WkJTcXhjMjJsOUFQY1NEUlNDQWxKWkZlUlNGdVZWNmQ5OWxhUUdCelI2aW9J?=
 =?utf-8?B?N1M3R2laL2w0elMxNHFMVHVZbEZ3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2976eef2-0015-407d-06a3-08dac948b895
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 09:39:00.0761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqx/MQ1AbyGPXx/cPhFv7ZP2XZ2ywcVTwMJtZk+Cjbg4b57Uyc0EHKilA2xa2ZaieARe29aDbvf/h+8RirzQYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6297
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,
        SPF_HELO_PASS,SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 17/11/2022 10:04, Akhil R wrote:
> Set ACPI node as the primary fwnode of I2C adapter to allow
> enumeration of child devices from the ACPI table
> 
> Signed-off-by: Zubair Waheed <zwaheed@nvidia.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>   drivers/i2c/busses/i2c-tegra.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 954022c04cc4..69c9ae161bbe 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1826,6 +1826,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>   	i2c_dev->adapter.class = I2C_CLASS_DEPRECATED;
>   	i2c_dev->adapter.algo = &tegra_i2c_algo;
>   	i2c_dev->adapter.nr = pdev->id;
> +	ACPI_COMPANION_SET(&i2c_dev->adapter.dev, ACPI_COMPANION(&pdev->dev));
>   
>   	if (i2c_dev->hw->supports_bus_clear)
>   		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;


Do we always want to set as the primary fwnode even when booting with 
device-tree? I some other drivers do, but I also see some others ...

  if (has_acpi_companion(dev))
         ACPI_COMPANION_SET(&i2c_dev->adapter.dev,
                            ACPI_COMPANION(&pdev->dev));

It would be nice to know why it is OK to always do this even for 
device-tree because it is not clear to me.

Jon

-- 
nvpublic
