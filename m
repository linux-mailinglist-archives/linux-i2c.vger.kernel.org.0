Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE01462F3FE
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 12:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241533AbiKRLsC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 06:48:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235182AbiKRLsB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 06:48:01 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2049.outbound.protection.outlook.com [40.107.96.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA769152C;
        Fri, 18 Nov 2022 03:47:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ir76cGlmdl4p2f8dkZydrO/zir82+yoQr0Nks2h7jGD24U3OTPtP4TbRaT2U531OoQKTZ/NVV4ihJzVeWMl3gdMdyAPrX1hGs+UoETVxpr6IoGlyvLnrgG0jQJZi/5M94/bVsr650f5KMn1j9/0KwNYUlog/KpbWaHYFBwCwRF9f0/lJ4ygVRzoDFL2ERaOAAYcGfjFZYsQPYjO3sF68j76rpGerEi1vEhgUVzxGSt99iBN2pqmcBI4jXtqR1ZdoHeM3juOUjeid0BTxUGCjN3ppFN81kj4PbsRxJt2LksyjNte09EhmDK1zLfDoafNGW/+Juy8pT67SKPvGWL3p/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHTkfp6EGeZ78V8Y1NuQVRv7AQEKl8xqeK0IC0ph/+w=;
 b=ak8I0y3Us7BpiXlnS+D3TU5R9KREXQaFMGPjWIIQrrvrqm0bp26l7yVfEA/o+JjWD4DHVNfwXySU9DOLGpHexi8nSVhpGSc1Ujph21klCEFgrcBMXs1Of6rdoSKUHaZM/euU7Sx/sg0Bx6fgV0Ra1F7blnH8ytn8ZTq8ztd/wGF3WUg3aNjC018sXXRNO3K/h14ueoxLVR3l/qST20QjkiiZJFeS6MmNlt3ATBp5y0tpPdyBbRat9IxxLo30zWOtx0YKYdEH1zSDVmifuP0Upz7R/WBEEeO5MZYQ36BxTSZTjD0b2jel0zl0io+XgWjfb9OEYuoS1KRsGhw4gDjh/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHTkfp6EGeZ78V8Y1NuQVRv7AQEKl8xqeK0IC0ph/+w=;
 b=GPt16+BkTM9Ofx0U0q5zFjdk0hRPFupaxaFAst9xbNyosQCf/uyuWrQ2iMU76Ys4SmrWn7jyW+tseo3w4RiPtG/7O8Mj3wOjvI58sPTwNzllfQCy9fFX/kvi+eZXJ+hNalEztzT75F3Qzfg5zOzLEZU+uqRea3Gq/0h6XqU5RrWeJ/RSxqeieQs7B7zFXFbCQ9O1FZHLqeWhcIqSI7LSd8TdBrnxWcDjQWnZ/VXTvKzXKKQfbaCdYDdSVDFctLE5raVlqT8bwszcDidsGX7/56sf0qKkkZBCPl9tB2MZSYC7q+UQETUlFX8RM2OXMNd1DpO8xkIpWn2EGzfq0O4elg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CH3PR12MB7594.namprd12.prod.outlook.com (2603:10b6:610:140::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 11:47:56 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 11:47:56 +0000
Message-ID: <ff85d925-cd5a-6f44-4a15-ae5368c7b833@nvidia.com>
Date:   Fri, 18 Nov 2022 11:47:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 02/13] dt-bindings: usb: Add NVIDIA Tegra234 XUSB host
 controller binding
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Wayne Chang <waynec@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, ajayg@nvidia.com,
        singhanc@nvidia.com, devicetree@vger.kernel.org,
        thierry.reding@gmail.com, treding@nvidia.com,
        linux-tegra@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, robh+dt@kernel.org, jckuo@nvidia.com,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        vkoul@kernel.org, balbi@kernel.org, p.zabel@pengutronix.de,
        mathias.nyman@intel.com
References: <20221114124053.1873316-1-waynec@nvidia.com>
 <20221114124053.1873316-3-waynec@nvidia.com>
 <166845336035.3185553.484885991952704522.robh@kernel.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <166845336035.3185553.484885991952704522.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0490.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::9) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CH3PR12MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c36597b-a0e5-44b6-f8ce-08dac95abbb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ynosvxfuNvwuszpMc59GIJtp05e4eGFPssY0aBJD74MNHFS1kQUSstcEmAoObWXy+oJus5/xzY9y+2mElYboefE8sEd2kZusePBXi4ugJCwY8XmKnxGJe+gXtO7/cgmdp7I92j/qV+z69JwYiBQHrRd1CAZazYkXKJGvV4lBZHM/CVR9p+BzWftA82RIg8AzAj5SqpHtcP6C3FYWrsOnT6PrHJH8zHhhE3jqVK2KVr/OxSStrICUfUb9xIOwyd8pFwhurFsytRW0qpMYPXRdUOvjpd8pdHX+IfxxFNwUoIhgB2ZWdALzhRbKsa+rSqNt95zqq4OSC0ex/vVSU26oQEvScYkdPmmI9EIMdpiATjwBE/L4Ni7NY0dW6GGheYtgthJ6NvN8aafNtUejro0DA0XIw8DVM/G5rSRgKI46rMUCsQuXDUQOtPvmjVj/C+p74bMuyNNrreSYO8zBBy5E4eN5jvGb9Vcqq4PLGqxtFfCHTCOATAVUBFaTCbrd2S5v2qYMipdIhOR9L7kWsNzFbjGO7EVAY4uScFCc91z2YCrHE4PetPLlCA5Zrzp2UqwsDsZBT+1Xomx9crDspFlG4Q9VQucdPHftQF0z7oOlqFsYLBcIrO1KTTubl2XREYGD2T/frW/ZNmHQw5fwi8lTqU8quygczyME9vwlSg0eYozxxmElq2xEL9GpaLOpuItI7h8AaRyDBW4f08I6inYs1blwyQ3WnsiFAAWEYSPK2OleuY4c+WSu3strsTASddYnvlY7ZoYvJymkrqKB34LzZMctSAUl5usa6zE45bn7X1eOGQYbpL8XQIfp7jlc/W+4PTjYNuV6Ee+j8V5ot12XPnbEjr/RkIivM1lJ4upV2jw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199015)(7416002)(8936002)(66946007)(66556008)(5660300002)(4326008)(8676002)(66476007)(41300700001)(31686004)(316002)(6636002)(478600001)(6506007)(2906002)(110136005)(36756003)(186003)(2616005)(53546011)(6666004)(966005)(6486002)(6512007)(38100700002)(83380400001)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGl5QlI2M1JMTEd1UzIwZDEwRUFSeEtJZTF0a3RxdjhFTnRLTFFyb0tlMGcv?=
 =?utf-8?B?RTk0cmt4cTBKQTVPUjNMamZTbjViWWhIb0E3M0JjOWowa3paSGRIQ2lQRkJm?=
 =?utf-8?B?NE0xS3lqalFyRDIxYS9halR4UWNSeWgrL0xNRE9aYjdCUkhCYllockEzSUE2?=
 =?utf-8?B?UXIvYUpkRHJZR1V1a1RWQjUzNWlhOUFCSmdVVDg1TFRqVklSaGZ6NDhlMFh4?=
 =?utf-8?B?Rk55NnhZZU8zc0szOWNkVUZ2aWJodjFRdkRUaDFnYVRGRUtaMXJxdjJmYkRQ?=
 =?utf-8?B?YlRBUVVhUmRndnlKdVdLSVdnLzdDQmdHWkxJc0xNdUwzYUYwa1ZaYis2S3R6?=
 =?utf-8?B?Yi93RFNJTXEzVkd3MFptck55bkMvVENMSU1pNVBZVmNza0pXWFVubGRTaFRT?=
 =?utf-8?B?RmQ3eGxtVU53KytEbCsydHlyK3luc2dZaVh6Y0Zaa1lnRG42ME9VUUJQWVpR?=
 =?utf-8?B?VHMrNGRoOUhLTEt2TEI5bGxJM0ZkN2tFUEtrbHhibWxBNnZxL0tqYjdKMS9F?=
 =?utf-8?B?aGpzNm9rVFN5ekFDTG0vL2lUMTdqRFV2YkMwbFdadGJRKzlJeHFQVkcxUnoz?=
 =?utf-8?B?K0xyRnlVcG1neWpWVnVMSExUeGtWb1VCTDh5eTRrTkJmTnNhUFgrSlA0YjJV?=
 =?utf-8?B?ODVrNWZrV3hBV00vYTA5R0JHSDd5SEJNMFExNS9ERGIxNU91SE1Tb2VGTWoz?=
 =?utf-8?B?VStMOW9XaVpEZUh3TFFkWlQvYkVsYTRPQ09wY0tKajR6SVhwU01DWXBnRi9O?=
 =?utf-8?B?cyt5S0dRbStxZUYvTmtHaHZIV2prV3lwSjJOeXdzc24ycGltazRwb3hUeVlI?=
 =?utf-8?B?dHVxYVNTTHNRR2FFeGVLRUd2emhWUkg3MlhUcE1xWDZFYkRueVFHYTc0c3BV?=
 =?utf-8?B?V1FzZGQ4Q3RiZmx5UUxvRnRqMVpYVHBOa3o3dHA5anh5cDdOS2RLSm8xSkRN?=
 =?utf-8?B?YUFpVnJoMkxtaC9POWN1ZlVjbDlEM1JyWEM3RS9lTXd6Yjlab25HRWJIQ1o0?=
 =?utf-8?B?UERJY0RReExJMCtPSmZndWhqUEVUL0JHV29zc1ZKa0JUNTdmRWFEd1RyS1ZZ?=
 =?utf-8?B?Y29YRXIvU1dQZkdRMk11YUtSemlZS3B6TnZJbnl6NjhyRzRacktVbW1wdmtw?=
 =?utf-8?B?b3NCRFpQZXZ3aE1MdkFtbFVnRTY3dnBib1pjcjJROUEvRk9vaXVYcnJwYSt0?=
 =?utf-8?B?MEdpOSs2MURuMTlnYVMzY08rRDAzSzkyVjBxei9CWS9yUDNIa2dsLzc2L1V6?=
 =?utf-8?B?c3JNUnQzODgwdHQ2SGdHWWZxbGMycHF4MllmWXRlbGpHdmx5TDg0OUMvTllB?=
 =?utf-8?B?Nlc1RXhuTElkMXRFL3BCbE1IUCtVdXE2YWQ1djNTakRPYUhicUNOWmVtZ1lq?=
 =?utf-8?B?QVdkUEZvanlJMWJScHFNWVJabUQ2bjFnT0twbUhtWlBZNFk3OVBGZWExNnpx?=
 =?utf-8?B?M3JQWklTbTRPMWNXS0hIUitaM0VBbjI3cytuMTlFVnlrc2J4OElvc1pCU0dG?=
 =?utf-8?B?SDZ6cFRCMkhJb0MzT0sreG1zd2tXQUpURVF3UXk2SHUrSE5oWEFySWJOOHZ5?=
 =?utf-8?B?T3I4Y205aXRXd0Yra2gyb1FlYW13QU1QWDl3QngwZGYwL2d5bGpnK1JlTW8z?=
 =?utf-8?B?NDFrSzZMRlZKUWd3OTZUdFRtVGozTzNkc3dyTUxZZWgvTE1RbWpkd0pTREsx?=
 =?utf-8?B?SDJYMzRiYjE4aXY4YTFleE8vZ1A2eG1pclBHRnNjTHVzeEQxSUloQkh1TzBi?=
 =?utf-8?B?OGthOVk3ZzZQNXhlaG5pVFZZL0pHcVpaQkZXUktHbEpDM1pTZ3hsTFM0YnNN?=
 =?utf-8?B?Qnd6c0w3SWx0d2pDNHRXbVUxWW1IWDFCcFpwMTFFQWhJRXhFbHlNZzVKN3ow?=
 =?utf-8?B?SjJwUDZDSk1ha295QzQvZENUdHNmRm56Qm5ZZnlEaGEwSHdXVHAzd1luaWd6?=
 =?utf-8?B?ZXhCa2ZaNkdhY3lRdEh3ZGFJMk9EOHcxbkxPOFY0b3N5T0t1bnlsTFowZ091?=
 =?utf-8?B?anByMTNyUk5TbWFNZWExTW04WWo3bWdPM1loUThweFdYd0NaSDZnYTg3cjFI?=
 =?utf-8?B?ZGcraDUvOERKd3ZkVkVTMno3azlJaE5CYWxjUVFzSDdnSDRqbjhiOHhyamRR?=
 =?utf-8?B?MGY3R2JvbEU4VmNJOGo4N2Fza1JwaVlHaCtTSFJab2FOMklCRGw4NklDdm4v?=
 =?utf-8?Q?6od5nIBeS9C7Hja1eRyII9N/WyjYEC82JW4Ur/w09f9M?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c36597b-a0e5-44b6-f8ce-08dac95abbb2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 11:47:56.2779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFvOowdmsD3FfG6/tt9JbZqymt5p6Q3xsKtK1eaUfAnJH8PZxrdLDJT/z23vLygwbPa71ewsj7nt1wLPwkpnkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7594
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

On 14/11/2022 19:16, Rob Herring wrote:
> 
> On Mon, 14 Nov 2022 20:40:42 +0800, Wayne Chang wrote:
>> Add device-tree binding documentation for the XUSB host controller present
>> on Tegra234 SoC. This controller supports the USB 3.1 specification.
>>
>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>> ---
>> depends on the following change
>> https://lore.kernel.org/all/20221003125141.123759-1-jonathanh@nvidia.com/
>> V2 -> V3:nothing has changed but added the dependency here
>> V1 -> V2:new change for adding nvidia,tegra234-xusb.yaml
>>   .../bindings/usb/nvidia,tegra234-xusb.yaml    | 159 ++++++++++++++++++
>>   1 file changed, 159 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.example.dts:36.27-28 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1492: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.


I am very much responsible for this because of my patch [0] to get all 
the necessary headers for Tegra234. I was hoping this would be a good 
thing, but now I see this is a bit of a headache for maintainers.

So I am not sure what is a good way to handle this. We would like to get 
this merged for v6.2, and so please let me know if this is OK with you? 
Please note that this is similar to the other Tegra USB bindings you 
have reviewed for v6.2.

Thanks
Jon

[0] 
https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git/commit/?h=for-6.2/dt-bindings&id=ea4777f6715016168cb72a1edc835dad480c8cfb
[1] 
https://lore.kernel.org/linux-tegra/20221103144200.1479640-1-thierry.reding@gmail.com/

-- 
nvpublic
