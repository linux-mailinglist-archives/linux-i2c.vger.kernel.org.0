Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA45C625D3B
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 15:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234646AbiKKOij (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 09:38:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233674AbiKKOic (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 09:38:32 -0500
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2068.outbound.protection.outlook.com [40.107.95.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D200D2718;
        Fri, 11 Nov 2022 06:38:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coZvPP76wX8RwXdemb6AkpP7UwcHA2tKuRWirFBSmKc8duELa4rOynI4Nz5+iQHO9cv7VPnc/CdIZ+vFpO/Rb+VcDckBdTEu6pXYLuHlNgkNjI/KvA/fkQQ4atMT7L+CcHIZitVyUHnwRkK7/+St5FwBEsXAEvngbpuy/Qd8iD1H7qz+bEFG/uGVMNfMov8VwGnM/k642NSF9BmR3haZUggyY1tC7eBJ21DUfp2O24CUTzspWbmnJwmPOcKijCJWgqpbmsbKu3lGbQVdQbf6WYsWH56ItjJpXrjMSqCBZDfA/MbeJTcUiXiYiWzSEwTSpbbTMQ/GdwqoLA9BVcjeng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQsccYkt5E05XY9NV/1Cc+A4rVr5jStFDsdLZfPhi8g=;
 b=D7FHqZ4Vm9vvHve8yuvZ52+TtmAdeJa7/3u/Laso3UYyH9yy58qaCEpfpjgVWUqnIcnq6KnvYtlMMGuJ5xhglsAzL24Br0ulMls6KThNLgsBSaCix+xiCWeTmesGv1AvqbtYumQeK1kgllnNvObvW7RjY9zf3HXCeTopwV6THxMzFV1fS3wWYdZ622C26+nUCd4yCbJr0lSs+AEQBfOd0FSuUtF/hV58wQZQOYN/Y04NbFbbbjoiWrkDoWpbIIx/x0pJ3JwYXVED7em8U7HAmOybGuiKvQImmM910pt0PcWnJFoq0qXBEZ2VXgu9geTPBKKVxgbx6uDhlJkFfebvXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQsccYkt5E05XY9NV/1Cc+A4rVr5jStFDsdLZfPhi8g=;
 b=O2FubX2BIgpnXhbtbV370ewhSYlQteqXbWWmMSq6D13K03MnmNIn6d+l2/cArHJHArMB4heP4FCfnl4uNeYIkDSmi5CK9yhGMN/mGrl0XWJxlCx5q67Pbosjwx2O/hBSyk6PfNfu/rSK3LYIsZI3pJo2pzGARGK0sJW6sR3G4BlufxyqpW7zSG6zo/m/YxkfacOmR+NqlJ/yOScR7rRQnqgLrcz2ZSSAJKq9OV7JDvGafn2ZrhZorGYfyLsAyBHz5YyRAofYqVIvbGwSj6Wq1ak7e8X0i/O6GT0RiXMF45JubHDY5/+XMbFoWBEM/+4At/dTJYhgdpYDMkQbyYZrCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SA1PR12MB7149.namprd12.prod.outlook.com (2603:10b6:806:29c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.27; Fri, 11 Nov 2022 14:38:29 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1912:a3a8:1a8d:a960]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1912:a3a8:1a8d:a960%4]) with mapi id 15.20.5791.030; Fri, 11 Nov 2022
 14:38:29 +0000
Message-ID: <5782d31a-9a0c-33da-ff84-20cae29f977e@nvidia.com>
Date:   Fri, 11 Nov 2022 14:38:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 02/13] dt-bindings: usb: Add NVIDIA Tegra234 XUSB host
 controller binding
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Wayne Chang <waynec@nvidia.com>
Cc:     mathias.nyman@intel.com, p.zabel@pengutronix.de,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, linux-tegra@vger.kernel.org,
        singhanc@nvidia.com, balbi@kernel.org,
        linux-phy@lists.infradead.org, vkoul@kernel.org,
        thierry.reding@gmail.com, ajayg@nvidia.com,
        heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        treding@nvidia.com, jckuo@nvidia.com, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org
References: <20221111101509.999589-1-waynec@nvidia.com>
 <20221111101509.999589-3-waynec@nvidia.com>
 <166817308790.3060162.14990231448404857914.robh@kernel.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <166817308790.3060162.14990231448404857914.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0342.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::23) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SA1PR12MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c7d33e8-a310-4faa-d5f3-08dac3f2664e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l52ncsZcV9dg/Y0FxNcCwadECNW4muaygFWoQefODHMVxlzEpadQMFKj+aQsswEbymxZ2pFRkUAMRGx0/7WjrbFp6znL7SCr2pARXY7lEugyUGHOeOz820Wv2PCjbg/ufI00hPyomqCJKEZy23rkt6w3/2yiMswSjCZQREaT0VO9nYTgOKdxh1AyzmKslpF98VrW/uD/6u6lOMpZRdH1H+GVL+mIzZ/Z88CExXAvXW3k9fpyuduSHE2Pz1fYoafJ1yB16YciGXalVvQZ0ySxUCdCacxj68lNjWtaMQiUz6E/JYHavAZcz86rWdIfIbb/74F2GSVQgBNbgUg+R40sqo5phn2/86TFubIfDCWwZkDHH+XBjE3vCvq+6JRdSYr1LrVdrf0olYYTxEVlzI6stIg9kSyP34yxHbhxLUE+TWrP687g90fVKmweJX9/eZ8/92TtgIWVa5VtmyEk4FmmmKn5kuoxzVTWbUbUhamLPsqsW+yxqDzHwIAMpo51gZMD5TDhLDn7BetBYe5dT3u5lHqpEUpcvu9VtkHSdwyJloqLbicEa95HBs4klNN2hefJI0+DvGVScNn2vdiRSSiPhP5bAJJvAdBToSbC1iMbt7Epv6k1amhd67PrDt0nbwa2JAmx/UbNFZ99gt1yiUsyQHk8EGOsK6hkso4C5LwlbZdLvBMgLkgvj1TT1kNz8d/397D07cTczt58tNmRZT3Xb3T5Oo/jFB8gJxWK+T1hXNNTkYpJjp4r9DgE3ZMhwm68Pu/ocvCxO/5qpTGQdKt9pTzOD3pap8Q1JijiClF7fK8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199015)(83380400001)(66556008)(6636002)(8936002)(5660300002)(66476007)(66946007)(36756003)(31696002)(86362001)(41300700001)(6486002)(7416002)(186003)(2906002)(6506007)(38100700002)(53546011)(2616005)(6512007)(110136005)(6666004)(316002)(478600001)(8676002)(4326008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEFhNWdPTS9zOVJBcS9hWkR5UXRNWXNQZkQzMHlwQ21ieG9vdTNrREc1YWdJ?=
 =?utf-8?B?V2czRTQwdHR1STQ0THRXUVJFRGRlQkFCQ3NtQXFHZCtzdklQTGV5M2ptZ2ZT?=
 =?utf-8?B?MXNmVWl5NU15YktDaEVVbzNhRDEyV2hDZ20vRm03U1hpMXFrMlUzeXJJdlNm?=
 =?utf-8?B?d3FhU3UweEx3K3ZuWC8vUDg1QTZmU1BFS3cvT3hoMFU4NXJZWTBwNlRwVWJj?=
 =?utf-8?B?RjJxeW4zY3RkMnhBWUNWMzVVMkZzVi94QXBKeUlPR1E2TWRmV2NVUG1FRGNx?=
 =?utf-8?B?bTFrcEo2Z0R3eUdabnZwNzdMbXNGbHE5d0J4ckFHTnJSalcxcm83UmlQM3hs?=
 =?utf-8?B?Wk1TL2RWS2plL0MyYUJQZUNqSFVLdTEveHE2ZEE4bmtzQ0dMeDJrelpMRG1C?=
 =?utf-8?B?KzI5OUpGZnROa2VtRnEwRWlKQlJYTjlJOURmT3B6NVlqcXVMQVZldTdVL25L?=
 =?utf-8?B?RkphbVNIZ3ZuZE9BdHV4b0FRdGJiRmFISXkvMG1iYmtPbkJZSWkvaWZieEhs?=
 =?utf-8?B?SDdWL1ZXKzhJYlVFVnhoMUpKNHRDRHpJcGo0VVptSjBraGdJMyt5a3plTTMx?=
 =?utf-8?B?NzE2L0JKNFNFWGI0VHhUOHhNdHF3Yy8rUDFuL1JrQ2hta1JFcUU2S2xqd1J1?=
 =?utf-8?B?NnlKbXczdnhwK0RXZjVwSERYL084RDdPc29NdjdlR0p3VlJUMUVMVFZqSytz?=
 =?utf-8?B?Z1Q3TkR1NkJSN3h4UDE1V3BpK05lb3d2UmdFYk1acmo0SVpJdFVndk53UTlM?=
 =?utf-8?B?ZG8xcXNqaWp0MFZ2RnFkK2QzQTRpZUwwb2hxRGZnbnRvWWN1bTZYSk15OEll?=
 =?utf-8?B?TlliYWN3UzlBblErZE1OQXN6VzdKcWdrbklybHV4TDhldXhmRFUxMHBCUVBQ?=
 =?utf-8?B?MlhOcXRoSDd3QkxXd3U3d3VvTjN3SzFEZ1Uzdm0yZ1ArK05zcmlNRGM0cWhO?=
 =?utf-8?B?RGZzMzRXUXVjTFVUU0I3akR6Vm1vWXhaMldMMXR1UllrUnlaeEU1Y0VVUlRn?=
 =?utf-8?B?YTlUcFlaVjN0Um5CWUs0TUdmMndScHl5Q2JVeU1KNVZGYmUrQTQ3QVNVeVlI?=
 =?utf-8?B?Q04yM3l5VUJJY0lvU1p2QkVUd0E3Q2Y4R2dqVk02dkRuYmJndkp6UDAyUFc1?=
 =?utf-8?B?UTdvMldRMTd5U0pqVWE0am9vK0pxcGtpU3FiSlkzeWhmQno3LzU2MTNYeERp?=
 =?utf-8?B?aVdDMllnWjl4U2hqNXBXZmI3MnNLaVBpNTMxaExMd1Q5b2I1NjNCRXE3TnNn?=
 =?utf-8?B?Q1c4RDR2TEZUU3kyaWNBSEpreEcvQ2lZTFYwWE9uZkRkZjRKWmdZZ1M3NlhG?=
 =?utf-8?B?TlBVQmNMTVA0TU9IcjNraktNMVlKbkl5aEZZb3QyR21mbVc1bno5NDNERDdr?=
 =?utf-8?B?TE9XSktTbmpVMlUzMkhiRDk1a3gxVk1sMC81MzluOVVFcVR0SlVvSDIrczZJ?=
 =?utf-8?B?UWNzNE5vT2lQZ0ZyRFZlZVhnbUMvdmpUUlZkVUx1NTk0UEN4TDdLT3RRZ3VV?=
 =?utf-8?B?U2F6YnJrdkZFTncvRUhTUUJ3aXpLK2FzbGk2blJYMFA2Qm1XZjhEMkpITDlP?=
 =?utf-8?B?aUxPSWwxQXVjNzdNYk5SajR4WDZVbTZCSjBsbUlLQWNsVkl6QUZWY1YxMUM4?=
 =?utf-8?B?akhFSjdCL0k1K0hOMXMxWjVTcFRQNkhFRGFTVnZ1RHkyYVA0UkdOYUNqakIy?=
 =?utf-8?B?SVJoU0VCcEdQSWFGZFNzMnR0RlJ0M053LzVkdzF3YlVMOVNEYmVLMjR0WFRK?=
 =?utf-8?B?MWlWSjJlWWxOd1VlYW94UTdmYWRldGVWdDI2YlVUVHo4U0ZOVzEyWC83c2ZT?=
 =?utf-8?B?ZE9uV3FUVnY3NWRWeW9xL0dTam82Z0U2V3ZLZCtpRGo1UTF6RGVsTzkvY2Rh?=
 =?utf-8?B?UWlZU0N1Q1NtZ0VWdnJNWHJlTlgrdmZ6d3NoTk9TYzQzVEFBZ2ZJN0dGeDlr?=
 =?utf-8?B?cWFYb0d1VWhwa3ltMEQvMHdOeE50MUxFeXczMWRsWWdSbGRNTHViU2FsaEo1?=
 =?utf-8?B?ajNWVWpiRU52d0M1Qm03WUZBN3ZYM2p6eDE0a0hLOHRYZ2hpS1JJOWF3NUFD?=
 =?utf-8?B?NXNGQXYzaWpKalI4QzJHZjVlRnU1NFo4L1p0b2NKQTNPK3dOODZlc3Vsd3pL?=
 =?utf-8?B?VWIrQVFpMDI4Uk9GRjJFWmw1VDBLejRTRHRtWVN5QUkyRjgrTFRlOERic2Fr?=
 =?utf-8?B?N244VmZlc0twUDZrb3d2WDhHUXFEL1pTKytRNm9KbDRlVkxOSWJDSUtDd3hn?=
 =?utf-8?B?cjltYjE3cnBUVmpIZTF3ZEE3ZHVBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7d33e8-a310-4faa-d5f3-08dac3f2664e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 14:38:29.5571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFKDSKV40xIg8/yi98cqA3iBoJdC7fwgPYdPsBQTYZGmFa7lJGLnX0EZA1weSGHuc2YYFwKy0b45zjwz1S4/ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7149
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 11/11/2022 13:30, Rob Herring wrote:
> 
> On Fri, 11 Nov 2022 18:14:58 +0800, Wayne Chang wrote:
>> Add device-tree binding documentation for the XUSB host controller present
>> on Tegra234 SoC. This controller supports the USB 3.1 specification.
>>
>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>> ---
>> V1 -> V2: new change for adding nvidia,tegra234-xusb.yaml
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

This compiles fine on top of -next. We are just missing the change that 
populates the required definitions.

Jon

-- 
nvpublic
