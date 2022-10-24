Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8754160B40D
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 19:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbiJXR0k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 13:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbiJXR0V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 13:26:21 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7310C1705D;
        Mon, 24 Oct 2022 09:01:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yucueie0vN6SNdc2AAmj35DjTvga0I5N7AjdwhuF+fG0j4XkPnLpWo+DPVK2EIl/07uxosDAejGCC6ym84Q2hMOkCCx5Kmt/6wpu9R2o+57NlCet5Cr/JvWGGF0FWC99Aq0THkjttP/DE8VtZ4R81MKoJesE+O5pdpnUFc50jbP4nZee2F3vpdD7wDorD82mR30W+yrPEIu28pygELUlgKnBWcgPDRbQgukEfrLlNTO4foV5OG1vmvUi9QsLyUemLwZrjV8mopA43TNMX0RKw5nhsqAh+JAoKjmgBoBlseAePbdfzCwfFDrRZiA3GZrujaLN1zC15U/DHIxi12WnVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQ63ML6frc3/urb5qYkjHFW+Lh84Dl7lkisFZX4xT3w=;
 b=eFnTCjSZVyN3dPgP6R4R96NF+Yc9Pwp3tY1bt6MA2d7+8DqBrFVs53lFBfsxVf8iYdtuAupo8K1b+TIHN3HrVwlGdU8hnGF7EXPs/Il2FWbEYqkTUJ9pz15gnsP0b7p9AXWANaANY7p5GaaDLJXDzfQZ4gLcSWVMPlmmB3lTOdkvDzkjphBWSxgGhjcPw7MX8fnMF+bHVOFIJBATDl7+KCLOOsVR1HwlYU2ZxWr2SVeY04rEan07j0lwPxQMSFStV0CXu80+aV6j6aV+aABU4g0s0gLKOZ7yFZZ0v2qPUtpFK5ZYRBjS/EU+IGuHAa13p50OtceFyAv4Zm3oBk4q9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQ63ML6frc3/urb5qYkjHFW+Lh84Dl7lkisFZX4xT3w=;
 b=TK3I7Gq0TW2mSH9oQPndPpUcDJ4SZRCdeLBrqd5u3tj6ymk9vN1XkD4rqXsiSC++AdHYjNlHFyqVqfl+OawiArigsYj2cYQ9kfjnJWo1MswT6Se4vanjDLAuPij7ORK8am0HS8CWniE2FvXzczUSyIEV7/pyOuJL3tPF4W8e1Il1J3z1F9SSq1kmLTE3rTkYkL0ds5ocrVsCrjPmJxjqRpoojkaGmZYz1LaqIhORpd2kHa14Hq10p4I5V3PaE3tr9f8kJqqodmzmTmjYJEmvRbz1X0Lqu0X16DXy82dIjUV+GKaDafuBJyO1hyiVK4grvnxuGeClB/yoEucfFrQtIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BY5PR12MB4323.namprd12.prod.outlook.com (2603:10b6:a03:211::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31; Mon, 24 Oct
 2022 15:59:01 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66%6]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 15:59:01 +0000
Message-ID: <c2112fcd-187a-73dd-22e4-631500a6b648@nvidia.com>
Date:   Mon, 24 Oct 2022 16:58:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 02/11] dt-bindings: usb: Add NVIDIA Tegra XUSB host
 controller binding
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Wayne Chang <waynec@nvidia.com>
Cc:     linux-phy@lists.infradead.org, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, kishon@ti.com, vkoul@kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        singhanc@nvidia.com, linux-i2c@vger.kernel.org,
        mathias.nyman@intel.com, heikki.krogerus@linux.intel.com,
        linux-usb@vger.kernel.org, thierry.reding@gmail.com,
        devicetree@vger.kernel.org, treding@nvidia.com,
        krzysztof.kozlowski+dt@linaro.org, balbi@kernel.org,
        ajayg@nvidia.com, jckuo@nvidia.com, p.zabel@pengutronix.de
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-3-waynec@nvidia.com>
 <166661789886.1678573.2345753570567106623.robh@kernel.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <166661789886.1678573.2345753570567106623.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0529.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::6) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BY5PR12MB4323:EE_
X-MS-Office365-Filtering-Correlation-Id: 06dd5b24-97a2-4488-ebbd-08dab5d8aaad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M2bU8ONuN4mDgP7CsXSDmE7JrckMKxCDPP5bSfuqXPui532xbeKsJ+yXtSDJdDY+sXSqukq5iKup0Hzjvb0UMpW4thfzrPjqp4HcL/vewZuzjW4DhjIc9qvfu0ai2C4+lzPvL4DlsyuXO0KxCztav9gdEY65uyL9LwmbP87r2TC/K9ZNR5Q5cbFbBGdajr/PqIZCoD/vuP4ZHlMZZbTdyEYflz87DB+7nEWUPU81LTjY/gTt2mu/TWCQQsldvOKy/XRsXm7eMQvh0g3kitXGPbiKZ6vc64P4qKrD8JTvcDOX5Xh/uHpxICytQqLh5gkwOyenAx4iesHLSwkv1fHoBDEpRXxl414Mjyv6YNvfg95Jv7GsMuAs/XslJmY4ilrLWxgAdfkiT745Le8s2cxTMI5LlH0fLcbYKyfPCeyE2I677wosLhtHkVvvsF/pBCepvKyri5PPpD1/+ndIufHa9Ks9ng+gqOOSQKdDa7PmqOePefsjKpV46f+A6em5kMrcT0IvBOOx6Uynv/K3tmGg4WJV7tRbUDB3lyKPDK0B4t/qYxyqvh0+gq3PJ9dbv8IgoXJjPHuM+yt8A0d33TAI8bUPR/qvHDiGwPplRNBRgzFHi9DzhR0V57rw5kZM8R2KzKybYO3oMx6AuCtc0A5hklhFqNxezi7cJ/Stuuxpk/deLqtc02emzu+q+tKLp+h/Cf4e0DEJNuDgiIbGPxITf/X7n76P43f1rYe4qanCf8o3JycqzRwha08hXxs2FuiNfIFUjIs0JWBIWfE7cbZqM2st++1nPtoKwrdLme7FAjCUgFavrAVvbfyBQ2sV2io8TPmIYWk+EV1J+2eg008PO2A/Sq2EPkZ5RZb6jg5vlRpo64lYezGwx7+lZXUBQ2l2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199015)(31686004)(966005)(38100700002)(6486002)(478600001)(53546011)(6636002)(8676002)(316002)(66556008)(2616005)(6666004)(7416002)(186003)(66476007)(66946007)(110136005)(6512007)(83380400001)(5660300002)(2906002)(41300700001)(8936002)(36756003)(86362001)(31696002)(4326008)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzFyWnpRdHVSanR0ZStxZlBBQXRVaTNJOWoxelduWWczYmY1VFExaE1YS3Ns?=
 =?utf-8?B?MXN6VTdjSWYzVjNCZ3c2U2pUZ1YzRVpKbkFEQTF6bmozV09WZUFvWmlJTDZO?=
 =?utf-8?B?clhJWG5RSmxreDd4UUJQYUZ4VFcrOExnZURmTjYwc2ErV1JrRW9Yd0l1anhJ?=
 =?utf-8?B?bzd1Sjc5WG1uRFNNTnpqWklkTXFxSTNSbHZrSWkvS3Yxb3NnazJNZFc4S250?=
 =?utf-8?B?NHgzVytiVDJlQXVEQ3kzZ2U4cW5SbGZYL3E5UG5IbEVwTlJDQjNsclRtbjZp?=
 =?utf-8?B?djVDTS9vazlmaGd1cXJrVGZhTFo3aW1kc0YwRUt4UjlWckhqUTd3Z1NFa1dJ?=
 =?utf-8?B?UEJQNEFYOVcxQjROUzFQU0xLTTFnbWNweTh0bkhZNEdWWENTR0x4eE9yVnBR?=
 =?utf-8?B?aHluRGxRZUdaVk1LTFZvQmd4R3ZleWZ1UXM3RStObXp3bHlacEF1TFF0RHls?=
 =?utf-8?B?bkR6VVVmY2FudSt5RHpvSjh0WHRLK1RwSHdzNjhTWGJUUkorQzgxTDRISDV6?=
 =?utf-8?B?MUdWV24rbXU1N3dyeTJtUWZxTjBqcGlSOWRsNUxxRDR3R0E1V0UwcENiQVZF?=
 =?utf-8?B?d1BGU2Z6Tkdyem8wOGNwMURBSGVFZGUwM2grd09KQlFwZ2lKYnlvMmpnSmNq?=
 =?utf-8?B?VEpCUWh0Mjg3WUlmcmRSc3NIekJDR0ZQOTRqR0phSndLa1JSRVZGbHovdWhw?=
 =?utf-8?B?Rk5QWVNTVjhnem5mUjBhcDNFWlNwemlNakVzVkw2djBaMXNVL0hMd2hWVlkv?=
 =?utf-8?B?QkZmdk1OQkpQVkdWMkQ0SDlqMUNYa2Y2UXprUHFKTGJXOE9lVFZVMWx0VEFw?=
 =?utf-8?B?NHUyQlNZRWsvMmJRZVVtcFJUQXV5VW5MZjJSbGhRMjBrMHcra1lMVnFpLyt1?=
 =?utf-8?B?QkRQbDYvOUkzNGo0TUhpUGZ2MVd3aDZQNHg5NTlITVlhQ3ZxTDZ3eE9HZG1z?=
 =?utf-8?B?NmhjM3Y0OEsxcGVYWHdtVjloTmlqT2xaSnJ5bmQvT09IbVpRdTdkVkhXeWg2?=
 =?utf-8?B?UTV4MU1ZSEJ3T1NhbFlmcVJMbHBnRXZqVW94WHBHampPWFpkZVpseVFZR3JE?=
 =?utf-8?B?NXBBYU8xWEpCL21yMHJDdkliYnNqK1lyQVBlSkJaalBMMGd2RVdXcHY3em16?=
 =?utf-8?B?MXRoOHJMYW1SN1NYVFA3U1RlcXlCQmNIWUl1TUt0QlgyL09Hai84ZkttMGlN?=
 =?utf-8?B?MDF2c1FvWU1ibytDOGFiUUxlb3NRTHk2WjJzb25NZ052UlpKb0dBRk0rQTRk?=
 =?utf-8?B?K21DUE54NWt0L2grclM2SU1icjk5VWo2RGpsd0JQdVBTVE5teUw3UXA2L01G?=
 =?utf-8?B?enA0MDk0djlZVUVjb0UzWDR4RXlpQ1RRWExadW1hWGF4bWQwazltMkNGQ3dI?=
 =?utf-8?B?TmprZzlwN05lODc2dERXNUowVEFpZGtYQW1MMFpaR3d0RXRqbkhoSkJZVkIw?=
 =?utf-8?B?dCtubzJkNHg1WVVUdzc0QkVnNzVNdHZXZmozRm5XTFRvbjYwdy9JbzdkRWpG?=
 =?utf-8?B?cHVjTGt4SzBzR1M5d1RDVDdFN1NERjNWOFN2VEZzVXY3UHhFMURVWHlHdzJS?=
 =?utf-8?B?a0h3Wi9QeTJoY0dYcGgvY1E0K2d0NjNxRjZGZmxSZ1lYUTJIQ2w0cHB0Ujhj?=
 =?utf-8?B?OTFmellNRnZjV3V6OHZNYjZQTnVpcnNQVFl6K0lXdi9oNzBzaGNGMFlyaCs4?=
 =?utf-8?B?eVo5bDdkdkJmV2tOZVgwVkJWV1BVVkFvSXRKZWRCaUczWkY3RlFJZHQyeWdh?=
 =?utf-8?B?M2JobUxWVTFxOUZIZy9SQnovNm95TENIZXFMTXA3WjFxNlNyR3lwVjRIVWcy?=
 =?utf-8?B?NEFkMVRhZDFaWGlQVzFnN3cxR2t0eWFTY3hPZFRqdUU4MUVFUmRDeHJPZnRZ?=
 =?utf-8?B?ZFN0eVkzOTRFaGVWdjU1WElDdUFkSUpyZ09ldnZENlgrZ25yVVZoSSt2MzVY?=
 =?utf-8?B?TE4wY0pyTDh2RGxvYy9mNWlpY09WS0JRRnRDejQ1SjhuTUZBdDZXcGpRSzlk?=
 =?utf-8?B?SFVjTDJVQTZxVFRUeEEvUUUrNzhKc1ZXYjZ1U0x3bUlrSnRoSFRKRlI0L2tD?=
 =?utf-8?B?UUZXbHptc2d6bXN5SWpNSkZkajA2ZnJCMHQ0KzhncHpGZDhFeGFEQ29CeCsy?=
 =?utf-8?B?ZFZhZmRJOWJab2Z0VE1WWUpBTStQb2lyMklrZ05LaVBVNkR6TDVyWW9pMmFl?=
 =?utf-8?B?a0FDZEI4TmpsQ2t0aENoRUZHOTNMMVBNNWk3amJoSGhxYnc0QlYzdy93TTBr?=
 =?utf-8?B?R0Fub3lmWVE0MTJYaEVnMDBtNnlnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06dd5b24-97a2-4488-ebbd-08dab5d8aaad
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 15:59:01.0883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBMGav6l7zisExDnJQMbxZNYMLv/OP+yQHxlEBP7usCiUwAUa6lafhZVMbt4RpVbiZO/wQbk9UMa38kZ0zaTOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4323
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,SPF_HELO_PASS,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 24/10/2022 14:30, Rob Herring wrote:
> On Mon, 24 Oct 2022 15:41:19 +0800, Wayne Chang wrote:
>> Add device-tree binding documentation for the XUSB host controller present
>> on Tegra194 and Tegra234 SoC. This controller supports the USB 3.1
>> specification.
>>
>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>> ---
>>   .../bindings/usb/nvidia,tegra-xhci.yaml       | 213 ++++++++++++++++++
>>   1 file changed, 213 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xhci.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/usb/nvidia,tegra-xhci.example.dts:36.27-28 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/usb/nvidia,tegra-xhci.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1492: dt_binding_check] Error 2


I believe that this is because another DT patch [0] is missing (see 
patch 0/11). Thierry has just picked this up for -next and so hopefully 
will resolve this.

Cheers
Jon

[0] 
https://lore.kernel.org/all/20221003125141.123759-1-jonathanh@nvidia.com/

-- 
nvpublic
