Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1382627B25
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 11:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235827AbiKNK5Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 05:57:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235758AbiKNK5Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 05:57:24 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7F9A186;
        Mon, 14 Nov 2022 02:57:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyepnMWJ1CWmJJXRQvZQVL3W9VL4dJGJAsnpi/yn4DcSaAIlh26kIQZo0yjjKWu02ht7ICH7kAqcLjfHH0b3113xCg44FQrPfDoF0DzVLyJsPtL5OziWn8pqkJ+P690RkDMBrBzLRlgxsUGiSn1RUFl4fYx0mpf3TeoU2BB9d6x50RFs+lLD6/BRZzH63dJJnUNTjDizR3eb9Ea51Wt8UThDXL1ZXrLg3MoVBC4fWGEr9YjDLKYjDMY33aASbtQrx/MmyxkkfGDbeM0CJ2zSZXr7rk8rUx5p7sPm3nSxBZ8LCzi5nEtvG3CN/72xnPdRmCoY9e7+R/lfpYO7Je2Bwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0PZ14BWt5dRhw8BPMvTsE2wcmZxonQ+cwi4WQzj8JY=;
 b=lx3leBq237c0IsgXIj2buLho2oDTIam7DPuR9ElNBf0uR7u9NF1wg5/S/rK6kYdsGltZu0SNvFixuYJUBCE2mnj7igeHIw6MXzrtFU8OWTMFNdrOIMLr+Hobf0A/6lm8qxL/hpI9GlhB5ObC0o7Dz4oHMdzCmatN189n4bn4NB/qWcWZRDADd5xJOs0S1LZNJQbEWl45fd1GLL8pjt6ZjmfeVpsHhQNj/NH/XA4kGYKNa+ZIWzbfCWECBTjYEzsDY8eLlPYyfRh7fa6utOzct1c1yVPmj2+wPUQBfBenW1iod3dk+iTq33BFFi2lIioTvn8alsXMCadW6+pOdvFPIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0PZ14BWt5dRhw8BPMvTsE2wcmZxonQ+cwi4WQzj8JY=;
 b=jHaaXjvOSeaNkzs//f1W7EJ4KodYTKoVd5nG4vaCUa56wXZkN/+woIyj6nn+eG6jKLTaSPAbKZjZHXSr6qik5xNYL4Tas2y13laGmCY+kJCTtm8ZtMvvioEV+NJ9luIWSH/LLjaw7zXa03hFfwTu/27uHQZxA44J9Xbh+Ib7wx88YK6E+OhZctw5/ur3kzJDDl6y9KW6BqU43N7vBx69nbm4c74CQUlSRAhF3Z55KEM6EBc+pc3Xw8+WaT4pFNN7Lwld8mpHPnXVeYNrPmxz1r8fpmtD4t5EXEMqQkObbbe5r6dDzbHh5K+S6Biz5nffZqKnLLSkOXf6hARI60fP8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BN9PR12MB5116.namprd12.prod.outlook.com (2603:10b6:408:119::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 10:57:21 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 10:57:21 +0000
Message-ID: <7db869ea-c355-01a3-1d09-541473e1e8b8@nvidia.com>
Date:   Mon, 14 Nov 2022 10:57:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 02/13] dt-bindings: usb: Add NVIDIA Tegra234 XUSB host
 controller binding
To:     Rob Herring <robh@kernel.org>
Cc:     Wayne Chang <waynec@nvidia.com>, mathias.nyman@intel.com,
        p.zabel@pengutronix.de, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-tegra@vger.kernel.org,
        singhanc@nvidia.com, balbi@kernel.org,
        linux-phy@lists.infradead.org, vkoul@kernel.org,
        thierry.reding@gmail.com, ajayg@nvidia.com,
        heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        treding@nvidia.com, jckuo@nvidia.com, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org
References: <20221111101509.999589-1-waynec@nvidia.com>
 <20221111101509.999589-3-waynec@nvidia.com>
 <166817308790.3060162.14990231448404857914.robh@kernel.org>
 <5782d31a-9a0c-33da-ff84-20cae29f977e@nvidia.com>
 <20221111173236.GA3561612-robh@kernel.org>
Content-Language: en-US
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221111173236.GA3561612-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::20) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BN9PR12MB5116:EE_
X-MS-Office365-Filtering-Correlation-Id: 633b34ef-1554-49bd-7288-08dac62f0076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uzmEdV1v3lrnVV/1YVfaSs+C/SF5c6URdUNYBy+eoDtlsjDvEE/NDQXBWa+ZNnDhAJ1+s8jtvxJ6PiuJ9vMyFB1gNJvRM8xQZXFB1OnlWMPsATxSfzAPuZdXu4NsklEfrCVeUPDWb6nORaYO3vwgAn+qlZIkJtu1neQYoVeSrS4P7ppqZeqOqxmxEtFa75pf+x68YACiBKF5pcgd9SqRcPvsF8VsF6AiUDvoYk/BUQ9AI08gI0CTo8LN0sstCJIOlrqYDMA22J7MUtXPm8ewcav8QHi2rEhqxrYKXcaYZc2FkDoiRhzONxmb8X30qqdMP2VwT33JqHOeap2WAz6QbOvDL7P5qFIH2JP/zBOswOSo+412/tQH7UU9oIGEIQbL2LKr7ayM6we4sZKE+aGayEgR8hZSHii/2i2BynbQYog8mW0oCRKDhjxDZ8vxy5SXS1NrP4Xr49ZfF1WzOoc/uOtbQVVWkVWJyAjes2J2CG2S4LTvUlRwHonryFEx5ZmAfOPyh649VjYxI28X1Iy8iNaqztK+C2MDtB5OWvkp7vRgQXqftLYpIc0yuSDWPiWd4bNXOHfRwNxXAfuEfyGpyFhfCmutUYBHOboUkY2pjGjWtbb0AQ1dkiB04dXXvW3pXVETHfy/fCMb4RoiIzO9teyvpR7jN80qMuMtcb3EYvr+yC0Xxb9NdHVurVXn6FzvBnufhCERjJX1nZDOPwj88XtQmT58yhATfimgtyq+CtRM6JL20U8OHCvwqPuKVfPnyq2HAtrShBFBJIxyUprP163iGLNrgE4Id4RjLCP1KKA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(451199015)(31686004)(316002)(6916009)(36756003)(478600001)(6666004)(86362001)(6512007)(31696002)(6506007)(53546011)(2906002)(66476007)(8676002)(2616005)(66556008)(186003)(7416002)(8936002)(83380400001)(66946007)(6486002)(41300700001)(38100700002)(5660300002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkliQmdOU2wzVUpXeStPZ1loeURDa2xzRkoxRlY3QkQ0YkdpTktLNHJpSjUr?=
 =?utf-8?B?RVhPbzk1bjJqNWU0clI1RFlpT1N6aXd0NlVhQk1MSFhrdFJNSjRpeitCcmYr?=
 =?utf-8?B?UkRFWlBmM1JvNkNKaENjMEFJTVZpQnhTTkpyUCtZV0tzbVE4bDNpbHNhTVVU?=
 =?utf-8?B?d0tEYUYwS2hoZENFZCtYTGNEbGJmUXVwOUVaODRWTGptZ0VtRFlpM1V4SlM5?=
 =?utf-8?B?anpubkt3SjQ4c3VZdW1ubGRXWTM1dVpSVzV6NHdHVVhadmIydStqQ21tdmJy?=
 =?utf-8?B?N0xqUFpiajR5RDgvZ2dRMGsySDRvV2lRckZrenBhUkpESGFEc1gwVkdzay9k?=
 =?utf-8?B?eXJvaWZ1bUVnN3haSGd0b1crd1M3VzFrUEVGNkZPL2Q4cFBmVjlhcDNCbFdz?=
 =?utf-8?B?VnJqNXlLZS9tM0NSekdES1pTSXhyWnJpUTNZV3JyWXZDcXZTY2xYVTgrQ0pX?=
 =?utf-8?B?eitMTFlaNDMxNWMwWXFkWkFvM2F6N1Q3YUJncUZTRnpGdWxhdUFTUVUyQWhF?=
 =?utf-8?B?eE4wdkUyeElWUW94L3NCT2tqRG5IOGxqRVpYYWxjc0l0dnpQQUF2NldSNHIz?=
 =?utf-8?B?ZUpENG8xU2VkOHBPZmx2MnVEOUVzSUdzWUhsUDAxR1ZlbmR2eDg3RXNBNk9o?=
 =?utf-8?B?KzhJS0U0cllVTGV3RFRFTXpLRFAxU2grUHNFN0lnUEhIQjg0OXlLc0VHVW8z?=
 =?utf-8?B?d2NnQlY4MzBuTnhvaXAzTEZYTEtIQnVmRWdmOEpvdFR1N2xtMTVWRFAraTZ5?=
 =?utf-8?B?UWdrMXI2Uk1lNElOamlDREl5a2ExTGdEaVRldXd0WjdLQ09zaWhFbFd5SFZz?=
 =?utf-8?B?eFo2YWVvYUJaUHJpMEtSRHJsNmhqeEdXY3FrTVUwSTNxYkQ5cTNZczlXSWw1?=
 =?utf-8?B?R0I1dGpBbDdWcXpPaXJUZ3JrUnJJZERid2tUU08xMUlJWXo2Z0xxYlhIcUkz?=
 =?utf-8?B?TGxBeERyVkcyVDhWOVVIRVloNG81YmsyaFdmb2UvNjZiUE5LVjRCY3d3Q0hv?=
 =?utf-8?B?WkdFQ3VtenMwcXR5NVhNY1J1WnhGSDN4M2szZ2N4cUVZME0zN2Y1TFdNbHJh?=
 =?utf-8?B?T2VsUlN2N2JXWXprSGhMTW1uWXEweWYwdjRiWDlROWVIOTVCTnN0OW5ha21M?=
 =?utf-8?B?L2xpNlRZc1NjeGxkdjlUcjNzV2IwNllPMUZwUHBndjhiN25LaUthazR0Lzdp?=
 =?utf-8?B?aGJJclJoVGV2OXlmSHlRRlpJd2xGOWh2ZmI4UWgydzdMSVVCT1ovQS9YSHgz?=
 =?utf-8?B?Q0pnQWx6bFFRaVNTSzNwZ1FEd090a2ptZXQ4dWdNSm8waXNlUGx1c1U5N0dC?=
 =?utf-8?B?NjVMVVVndXgzTURFM2hzU3JPTG5WVmxGV2IyR2xZaVU0bTNDbTl5cElqcVJu?=
 =?utf-8?B?WG02elZGYXJJaEJ4Nis2bi9SclRUR21tOExsZUYxRkZHTWVud3dkWHF1cHg5?=
 =?utf-8?B?dGpHRnFJeGc4Y3VQOUxwVTlLL0NhOC9ia2tOM2ZIOW1RZ2V4TTcvU1U3WXdO?=
 =?utf-8?B?aFBWOEJmcElWeFpLcEU5OHZ6d1J1NnFPb3gwZHM2UHJNT1E1bEJaUkRldjV1?=
 =?utf-8?B?ZEZwRTQ1cjVRa3o2dkg4aXBmZW5TSFluRkw2c3kySEc0SkU4bytwRnhUZ2Z2?=
 =?utf-8?B?bFAyL1RKY2t4dVVnNGZJS0pTb1JCeTJVSTVhdDZEd0ZldjljckVobzh5RGsv?=
 =?utf-8?B?ZENub2FEMGxNZmhWWkdFL0lmVHBGLzhLS3hlcWFKUTk5bElnd1NCazJ0YlBW?=
 =?utf-8?B?TDBKWkpRaVJudTM0ZnpOanRMTFN4UzVhNEg3L09ob0lhem1jeC9hVGpaSWNi?=
 =?utf-8?B?MVlWWGx3WTY4VlpFZU5TZWllU1psMVdYZHhBM0xWNk9aczJtdTZlTGpYaUFI?=
 =?utf-8?B?UzFFQmF1aTIyTEZFWFRING5oNHFPNGcyYXNyMHNHMU8xeUhpckFBSjlMeDk5?=
 =?utf-8?B?SndKUlBSd09TbGloTlhWWW91eEdMdEwxZmdCdlFRc0VXUlhUOFBKNVhYVEo4?=
 =?utf-8?B?bzBxL3hsS0YveWp6VGFaZDBMOFp2MWRXWUhqNmNTbWhyd00rME50RW9iMFFO?=
 =?utf-8?B?dkkzVzhQQ1VkSXJZMEFuektCd1dkclBRb3l0eVA0N3ptS2JERjN0UjZKV3lJ?=
 =?utf-8?B?N0NzWjNwRWQxOWdtVURFVjEvNXM4eDNVZk5xcHFDbnRwMkNSWEFXUTk3UXlv?=
 =?utf-8?Q?WdnXO2xRnhr3tiJUHIBYrhFTYccx95xh7y6pgWvolLkU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633b34ef-1554-49bd-7288-08dac62f0076
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 10:57:21.2693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTvYdRnprq0Jup6DhPdZLKv6dvxtzA0Zecj8a3b1bAMd0hyk/PAcjAQBYffojnfDygvZavxk1+0CD9sH1VR3oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5116
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 11/11/2022 17:32, Rob Herring wrote:
> On Fri, Nov 11, 2022 at 02:38:21PM +0000, Jon Hunter wrote:
>>
>> On 11/11/2022 13:30, Rob Herring wrote:
>>>
>>> On Fri, 11 Nov 2022 18:14:58 +0800, Wayne Chang wrote:
>>>> Add device-tree binding documentation for the XUSB host controller present
>>>> on Tegra234 SoC. This controller supports the USB 3.1 specification.
>>>>
>>>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>>>> ---
>>>> V1 -> V2: new change for adding nvidia,tegra234-xusb.yaml
>>>>    .../bindings/usb/nvidia,tegra234-xusb.yaml    | 159 ++++++++++++++++++
>>>>    1 file changed, 159 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
>>>>
>>>
>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>
>>> yamllint warnings/errors:
>>>
>>> dtschema/dtc warnings/errors:
>>> Error: Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.example.dts:36.27-28 syntax error
>>> FATAL ERROR: Unable to parse input tree
>>> make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.example.dtb] Error 1
>>> make[1]: *** Waiting for unfinished jobs....
>>> make: *** [Makefile:1492: dt_binding_check] Error 2
>>
>> This compiles fine on top of -next. We are just missing the change that
>> populates the required definitions.
> 
> Where exactly is that mentioned in the commit msg?

It is mentioned in the cover-letter.

> No maintainer can take patches which apply against linux-next, so not a
> good dependency to mention either.

Yes understand, I was just trying to indicate that there is a known 
dependency here that we need to handle.

Jon

-- 
nvpublic
