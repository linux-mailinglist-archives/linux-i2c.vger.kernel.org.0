Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F03F6E0B53
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 12:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbjDMKUw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 06:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbjDMKUt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 06:20:49 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2044.outbound.protection.outlook.com [40.107.212.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90682E45;
        Thu, 13 Apr 2023 03:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcVPXYFhC9U6ccs5YrCgnKb1BiJct+S06NS7f61RDxUCT81rZHfNlBylP5/QuqIDXLSglR5IR08w3ngUL0asOpZad/odIxBEaHQwCm6zwsGCRaLIjaan4e/0aTWaulK2JTYl62k7YSdRNGgtmZKkwaWBkOIegN76WUX6G1Q8RY8No4yHkForVDdoaW1tTe4Ph0XV36bNBqCVCsk+/zNwBBpnOR1c+e+0wb75BDtuvlWc724LslA3HnT+TguMTgqP6v1eY70OD+v3HHSHVURdJ93BqflYSwkpVfGTeY79QxhrnsIOmQxIzWloc+g0uuOcv81QnBtdKQoTIZdf/94QzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgNbXnUomEz3grz9cjoI4NqmqTC9X9zcGlqpHVLamCE=;
 b=RPJHOw+0QS7u5IX57cnCp5XItCpd2n/6xYePTp39dPZdgxFdl/7uZw5sX3ZVJwhaJ/mnTiE1P5PXMfYcW0LO/BmdeDy/3F2C4k6WC3Q+YdylHyjlNZkOrn1h5ZbUHQ6NLLu2VclodWfiOr5E4VasVHRin2KLATw6dATaNouezAHhVFKW8GS39oXMFGmNzrHefmd/b5tiapvjxu0DdbiydKFXXSM0H95DbDQ01rBbeZFOACuTi9kAQqqqLeIHe/PifnQbNbs631KA+P7zxRbIQ9CCisd7vZ86K9WbI6MR/Z1kIrI/H1DZmK9eDmDw7pJqJMBasdk8mYsFhXpjMP10fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgNbXnUomEz3grz9cjoI4NqmqTC9X9zcGlqpHVLamCE=;
 b=1GFw7979rKOuFrQBEYNtMzQcKd4WmTJo159Oh+fmgcAttUU8aCXzwQjotlcgLlqAmYdFnqrQas4mGXudqqwVzv0A3PHVUNUP9UctutIC0ET9/77woo0r49tfwwoSaMpeLcGwYJ//RBvIs+U2oz3msQuMq/RlrADPuxKOwAC4hGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by BL1PR12MB5996.namprd12.prod.outlook.com (2603:10b6:208:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Thu, 13 Apr
 2023 10:20:43 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603%6]) with mapi id 15.20.6277.038; Thu, 13 Apr 2023
 10:20:43 +0000
Message-ID: <a65971a1-cd3e-e1ff-c642-c16ade567367@amd.com>
Date:   Thu, 13 Apr 2023 12:20:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: cadence: Document `resets`
 property
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
Cc:     Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230406154834.171577-1-lars@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230406154834.171577-1-lars@metafoo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0010.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::18) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|BL1PR12MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca40544-02f8-445d-28df-08db3c08bcf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3NBuFCdsOdyUg4ZixD6pH7XVYUxey0BB0s7B11cUz22iHAXChGMEuhE4yMBtPJGP9gGpdQ/E7n4x4oz1dbHebQBvvBwwVMiOkMhLyZMDLrncorisJKFkN7ljXuImu1iu2rkIqchUfkYS4pcMvrKH74cyePN++1RGTPbgPmfcMgCoXGnSjQbBVtXdgP5XRUDSxilALPuQWkbvb9NbWkAEmaBTdVTLrorgkeDUerELVK11nvOPFjLAtDsYeMRiw5F0B9bf2HrRzhXGyaFThtOxkcFSLj6F5ePAwJqwcTeMgLOADIBNGpHaeBP1RAlVYvLVnOwiht4ePOiRjWloZuJ2Ucn+IrQmUxY3y5QL30PhAoiSoGtYWUTqZ0tp2QEdWmnZ30GD77m6EynSeKl9R1iVfBlaSyZif1T47SwodPdeVUlEGqX/90BjYbvGd60HyMn0dOpkqu+S4QnMV6QEsbh/M8bBYMh7kvORa2qT82G10zVVK/CINaUbBNwcGkwJXg3GM8pNM6Vc+tjB6BJNe50z26fbogqPLgwna5q4to9BCEyFdo0UJhDxrogy5waXX1Dwed/6ANq04CKAXyulrwvrWMVas/a61g+bhAHfUhxJB9vmTYSLTj6kPNV2cl7UreDDgve8HsYXrELZsvxoLd5Eo5KJmh5C8qhKDxpy5uXIQ1I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199021)(316002)(8676002)(4326008)(66556008)(66476007)(66946007)(54906003)(478600001)(41300700001)(110136005)(31686004)(36756003)(31696002)(86362001)(2616005)(6512007)(6506007)(26005)(6666004)(6486002)(53546011)(83380400001)(44832011)(2906002)(5660300002)(8936002)(38100700002)(186003)(81973001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zmo3UUF1QWhsR2kzN0p0MXoxVUR4MFJhY2RKZGgyaUIwOGkrWTRpRjNWR054?=
 =?utf-8?B?OVFQbkw1d2FSRkZabmJPbkxQSzh6NHpvbkxWbXlvZkFxU2dQaUdlMlY2cEtK?=
 =?utf-8?B?Qit5ZHR2WUY1QVZYdmgyaCt6TEgxTGdoeFNaQU5yREdoL0FTQ3J0YWcwVGFY?=
 =?utf-8?B?Tm9TUGpKNmpkclpuS3g3NHppRjRoWGpub1AwVXlxV2RKMWRMSFVtNVpSTzgr?=
 =?utf-8?B?N3dJdXRON2t6am9aT1FNWG8wbXovckRpSjhVcHRJUEZHOFJGRHUxYjdyNjdC?=
 =?utf-8?B?UDc1K2tSN2RFUml2N2F6bTMyeVNDUCtWN1U1RnBQeElFVW10WGVGbS9HL3Vy?=
 =?utf-8?B?NFBpQ1FMMmRJbjlRRUkzZ2Y3WFN0L2hPOXZPdzVCTmhiUWtoaCtyOE1Hc0Jo?=
 =?utf-8?B?aXRsR093cTk1dDcxUlo0dGE5ZEhDY1ZQQkhLWGxpNW5YeXhuNWNOQ3E1dllY?=
 =?utf-8?B?YkVRY2pJdzZ0YnJhTHlLTVZvZUt3L095S2hWMVlYN0lYSnRkd25sZS9GUGtN?=
 =?utf-8?B?UnhsNDZ1U29UUzFSTjZkaWJtYkhqWmp6LzNPcE9HaFhtVktEVmNmZ0NFTm9F?=
 =?utf-8?B?cXduSFZrUHhaQ0VpbmordnV5b0c3dG5aNVd1RXZhQ2tQR1F2L01oWmdRK3A1?=
 =?utf-8?B?WVQ0d2h1Z1pRK1k5KytGbjNtUEVBRXQ4L3lFTDlURUU0ZWd6cGdDbmM3VEoy?=
 =?utf-8?B?cDlYTmVDamY4bTA3a2RhWUU1elZmWEpaeW1HTmh5ZjEzdzdLTjQ0ZStPcE52?=
 =?utf-8?B?c1JHR2dMMmkwZWtvNXErZEM5OXljYjY3TGdqR29NNzlodmpjQXJmV0JJQk5H?=
 =?utf-8?B?ckk1NUZYaEJvbDYxc25VcXlFR0NNNUxwbDFteng4Q2JJZ0dtRDlvZzZmR2ZW?=
 =?utf-8?B?T3I5ZHRoVldtSGtMeU9Fb25IUGVJWUdxUGFpTk9yZnEycHMrbnlOMjlNWWty?=
 =?utf-8?B?d3l5Uko2UkY3VTdGUXIraFkvQTltL05nZlBMUGQ4RE9MVUJ6TENkRG1COXM5?=
 =?utf-8?B?cTBSUHIrSTh1bS9SYWs4a2plWTZwYS9zTFVxYnI5Y0RBUExEK25RNEgrZmZt?=
 =?utf-8?B?OTI4SnN5d241MDRKVUc2czdsVUdHRlYraTVTcTdXWkRTN2tXeXhNRFZ2Mk01?=
 =?utf-8?B?VGIxaitqYS9lK0pjRGpDalY1RkpaV0FhczRYcW9kWFhlaWNDTmhsVER5Vm9q?=
 =?utf-8?B?RGxMNEdiL2NiY2YxTHcvZWQrTk9lYVdIMUtMbjgrT3M1dk1Xd2pkaWI1Wnpj?=
 =?utf-8?B?bjZzMVliV2MxbkVGbkVuajV4N3pNWmZBUktBQUxZTUpieTVQazlYNS9hZ2w2?=
 =?utf-8?B?d1h1UkxLZW1VYkNuVmM2OE5zQjhHQ3JBL3N2U1dJc3k1bGdZa0kyOVBoRHhm?=
 =?utf-8?B?YnR3UGo4UU5HNzFYeWRRZjlwUlhpN1FITWppUk96UVFMeDRvZkJJNE5KSzRt?=
 =?utf-8?B?eVdndGd3RzZPS2I2blU0SG9ibHg4MEo4SG0wNTlKLzJsYWFtQXBZRjRNVjVX?=
 =?utf-8?B?RHlpMkFRci91Zit1eG1yWksramtwb1NiTTJXMHM3c1ZxNWF2MUh4bmVYbW92?=
 =?utf-8?B?NG8rbEl4bWJXdGxYMkE3RlZ0czlmWWh0bnJncy9WWVdFUDQySHRzcG1lU1Q0?=
 =?utf-8?B?UU9mM3dKRWZyMnRZZmM3dGIzbGRPUUc5YmhreWwrcmNEMFJtbEhwUlNTdVh4?=
 =?utf-8?B?ZG5nRm83d0Jub2t6ckJLb081TWtnNTFEazBxLzMvRzU3VUMwenZkc2pTOFcv?=
 =?utf-8?B?d0ljN1NveXlZdEljSnY5d2ZWbU5lNFFrbkpNelNNTXhGQWl0Um94NlkvWE5U?=
 =?utf-8?B?SmRFc1ZMYjdKcUZzQnFnLzNWMmFubVgvRUlZUUg5NjlhcEs4TWJyMkYwbHZL?=
 =?utf-8?B?VldYYndZTEYwbWtyelBDL1QwclFscGNNdlhSZEZzb1k4MkpuTHJWeWV5TXFS?=
 =?utf-8?B?ZHVPWmpHS3g5aXJuMUZXR0RzckZOL3d3SEhGenZxczhCTlNwaExOb1NYQmdp?=
 =?utf-8?B?ZXpjQU9qWHkrS0xDREJnWmZob2dRam5XRDZ0ODNHVFh4aGkwSVAwc2ltdlpY?=
 =?utf-8?B?UVF3ZWlRMHcxY0pYcTYwckxSRmROUHIyWXVzNTl1YnRUQXJ0bmtSdnFZKy9o?=
 =?utf-8?Q?w8DTAnJLKmnzNl0gWott0ICx9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca40544-02f8-445d-28df-08db3c08bcf6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 10:20:43.3589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWFsOpf1oLNukSlW17ZUI2AEdvK0iSCwQYjNe+cQ6V2N0B30gmP96QHVNogEHCh5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5996
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 4/6/23 17:48, Lars-Peter Clausen wrote:
> The Cadence I2C controller has an external reset that needs to be
> de-asserted before the I2C controller can be accessed.
> 
> Document the `resets` devicetree property that can be used to describe how
> the reset signal is connected.
> 
> While the reset signal will always be present in hardware the devicetree
> property is kept optional for backwards compatibility with existing systems
> that do not specify the reset property and where the reset signal might not
> be controlled by operating system.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changes since v1:
> 	* Add `resets` property to example
> ---
>   Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> index 9187015d9702..cb24d7b3221c 100644
> --- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> +++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> @@ -24,6 +24,9 @@ properties:
>     clocks:
>       minItems: 1
>   
> +  resets:
> +    maxItems: 1
> +
>     interrupts:
>       maxItems: 1
>   
> @@ -59,6 +62,7 @@ examples:
>       i2c@e0004000 {
>           compatible = "cdns,i2c-r1p10";
>           clocks = <&clkc 38>;
> +        resets = <&rstc 288>;
>           interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>           reg = <0xe0004000 0x1000>;
>           clock-frequency = <400000>;

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
