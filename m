Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 084426C0E6F
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Mar 2023 11:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjCTKOS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Mar 2023 06:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjCTKOO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Mar 2023 06:14:14 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 917E3113E9;
        Mon, 20 Mar 2023 03:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsRlD2fCm7M6LwWjs70vxOg3sMuCeJxBv8usXMlx3QWm9tP0q0jDyXWaBn8jiKvj80Wp9J57gulY2lB7zuDMjwQDyuJJiRYk1GV+Aw5bROy6KU/0d5ids2EB5IVn3wuR0q8wHCmVLXady7n6iavgR7v5cHZiP37OG3s0f1GzJdeOYTrALzD3qD8a7Ch/tl+qYRAKkdwkzniVsvrZ6kHsoikuyqL8tNcqMWAAo0dkVN9yUytW9Einm1yfTiSbnDQHYleHLrTxTlcB+u1bc+loUFzuz8Wi4GlLzsIp1GTx6WvPEBnJ76gRU8GRcWQiVKWWybKoO9wBBvDUI5S3v96eJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93iLprizLRek1nIUtq8/PFwp69bPnJ+Ncd4kymMDxak=;
 b=k4GcxkFqMtRrbYcf6K4vd/REtcaQuBW7MvCTmZLk6whwOHmrBsQmAyGnR7pHtxSP6IY1sFp0Mlm0Hg0nLnGEvBAJunlFH8rUX0qYYmWdGxT7hLDmuJKlczu8Qx2OoJuI5uEgvCU7dhpPN9PNKiyxcgml9C75zGv0G8rp3vKSmR+25zCxvPUXe/CUAnTBvMC0CpjrSvgGQDboEczf7Ftay2uwcMxU9vSMirg5ehhOB0tr8reTM+61V8yhXS+/oHDL74v29cP4x3kmb2bV8Ocz58ZZkpW8X4tPEHE5eTUwD8HqwAdAU808wHvVt3L6SvJgAjWEBJlVX0l6KfNXrdu9HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93iLprizLRek1nIUtq8/PFwp69bPnJ+Ncd4kymMDxak=;
 b=WK77j/tcXLeRhFwUkaRoKdUTPP2xdENrhKQM50oZRUc5rfpGAXii9dwPek0x+LqvIc9zlh9DroSB28x2A0OF8660F1UVQ/NCsbiRqREa6RwDKiSDB/Fm5Bi4+T0QrDHxoblo25tXxJhaTS58Zpb6WTY4oLOrdc+vmWAGL7vzOYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by CH0PR12MB8530.namprd12.prod.outlook.com (2603:10b6:610:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 10:14:09 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603%6]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 10:14:09 +0000
Message-ID: <0f0453e7-f717-9a86-5c2a-a15d41f0e2ac@amd.com>
Date:   Mon, 20 Mar 2023 11:13:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: cadence: Document `fifo-depth`
 property
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
Cc:     Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20230317145441.156880-1-lars@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230317145441.156880-1-lars@metafoo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0901CA0098.eurprd09.prod.outlook.com
 (2603:10a6:800:7e::24) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|CH0PR12MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d90b17-eb0f-4e72-5204-08db292bd842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nDH7FyE4TnmfaoLwsLwWpoStNPAlfn4NvoJji0u5iggpO7LWX44r1OoFSZBasC64r/mxyPLUDg85j/Ne6QbDNm4IqItyVJj6hgkRSWVp2dqx5qljk2sJF8RP9o51NM72923DO4WzcuXuxgkGwzR453Ccc/ketsRV0QdDiK1zGMeaors4umUHInd2WT2Qu6F5ff/KdTTG+TPGX5a9IkcPz/1jaqA9Mkrul0bMaHQHvlvfQeWn+F8WOFwEaVC7iVmAK1jFGhTFRpNmf7Kzw1h/NyswH/Ti757LcxUcvzxmdz7fx8xnSdZz1fCnEQ8PIz8X5I3SgCIiW5Ik11MtPsiaMe7jBfJGieCGtNxlIB8y6j/RPFF8en6PYsgCk5SkqV/TGmbaQRxywP6i8RGJi/5nUbwv1FL6TW+dpiCOqkHNhyW0IdiHXrfsbB3O9LlWmqEwDDdsNc2p6dsqBPgwv6mruXBYU1hWoKInBpXqvxmrpdTMQULiJR0kt0S3cKkKdgXsKGO9Ld1GGIb+BVz/e3RM0GfsfJs/9pJCsyXm6j5/hkTHtEmRgox8n/zbjVuW4CftdXtciXCe9sJxMaWburJctzoBosW632JstPEqDPiHaouLPOAsKsln79StBi4tBtyMhvt08oYqkDlxvzLiPtDurOHClvsod6utAlFtqEkTT/s3qPvbX8YRPyDMsbazL0oe/VrraK8RClXqkDp9GEVaD7paTjWi6qDKsF8oMe9+ATDuZNS5yOJomhaCvC5RgzLS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199018)(2616005)(186003)(6486002)(4326008)(53546011)(478600001)(83380400001)(6666004)(54906003)(316002)(110136005)(66946007)(66556008)(66476007)(6506007)(26005)(6512007)(31686004)(8676002)(41300700001)(8936002)(5660300002)(44832011)(38100700002)(2906002)(86362001)(36756003)(31696002)(81973001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1ZKQmZ0eTVsQ244dnQzT2h5aytPbTRCWTN4K3VPU05Cd2hpNk1ZMmpQbmRY?=
 =?utf-8?B?RzE3blZ0OGxleERESzd4cEtnZldBbWdpOHpzSTRySGlkVGIzcGZNUS94ZHZj?=
 =?utf-8?B?TTQ2aDdZdkErdmVSZWVtZlVJOWJBTTBhcHp4ZW5GQk1TNHRqclJZSmovU2pX?=
 =?utf-8?B?RHlUUWZqSWtpdWtYMHI5Y2ZtcVV6c0tvU0d3V3NlTkZLcjNuMlNQSjMzODdX?=
 =?utf-8?B?YWZWYnNwcjhCdkp5WFp1RkFyZVZaaXNaMkJvUnJPWVdoUjZPWFNTTVhFV0R5?=
 =?utf-8?B?cDB1KzJhK2xteEZqK29KTGFBRk1PTHN5bTZ1R0V1OHdkQytyVXFETGFOMnJj?=
 =?utf-8?B?ZWg1RkpJK1haalMxamV3TWs5L3lKdzNqWjZ4MGE3TFhJcElDYUtEbmI2U2Nq?=
 =?utf-8?B?dVhpK2kxdllwbFVZWk1EQzk5MHcvOWlyMUZpS2Z1b2dmeGt2WVd0ZGExOVRi?=
 =?utf-8?B?WXNJQTlETTZHTnFRMTduVWc3eTJrcE1xZGllNERCWENrOSt0MGVTcFlsOGt0?=
 =?utf-8?B?SGN1SXMwYUZkTUVkbnFDbHAzVTJwQ0RsOU1PdzRjN1YzYXZnbURLbklrZytD?=
 =?utf-8?B?cXZHc1pIcUpiL2pDYVFjY1VKSU0rM21kQVlwVit2U0FnKzRlQ204WWRUMVpp?=
 =?utf-8?B?dXU0TE1UUFBvdzZSWi92QWM1Z2dRMm5TcGJSNVljUFBER1duczgrU1U5Mmht?=
 =?utf-8?B?Ylp0eEE0Nlk4QjNBd3g5T0JISW1GQ3lnNWw0ZkpiaTZnRUxJOHd4N2VWQmRK?=
 =?utf-8?B?OVgwTlpVaUIva1pBL2J2KzNlaStzV05MeFU0SGhhZmJLUWJwUWJXc0xQMzE3?=
 =?utf-8?B?U1NMNkVGN0EwbjhYbVFKbHgzeXNFM3NsZ2dJNDF1eGl4a0lzUU8vVEt0TFFJ?=
 =?utf-8?B?S3gzZGZUWW4va3JsWStTRnVCcThudUNUdkJ3NFVXb3hnMFhOby93YlREakpG?=
 =?utf-8?B?Qk15T1oyYVRMeEQ2VTlZSmhOR2FSLzlZOVVZTjFxV3N4UHdhUzZUc1VSUWs1?=
 =?utf-8?B?NWI0WEVQMWt0MWxETTQwdVk2ZlBuSy9KNC8vb3I0bkt3NS8zMG5GRGFLMjlj?=
 =?utf-8?B?cGM2bFVFVXk5Ync4eHZndktSdUU4OTdraEZCdGI3eURNVythRkdjbnROa0Rm?=
 =?utf-8?B?OXJkSlJQRU5uWXYweHJSR294RXpDNmhONzdWYUNJY2RMU1B1WFYxSkluTnBE?=
 =?utf-8?B?dEJ4VWJyQW1wMHZacC9VZlpkcXlac0xLS3NCWTNaU3YvTnhDVXJUTGNPb0Fm?=
 =?utf-8?B?KzhLUGVvaEMrcHY5OStlcytjSklKNy8yb2VqYXNXZ1ExTzBIaU1mRkhLdUx5?=
 =?utf-8?B?VHd1RHVXQzBJNHdRekRXN1hJQUw1UzZYWmRPR0lER1p1VlBud2lWQjhKYlhr?=
 =?utf-8?B?U0x0T2s2MGZhRE5SVk1QUlRnSU1rODNEOURtQVFkalVZRGNwQTBXZTJCWU1h?=
 =?utf-8?B?NjhqbDcyWHM2UmNFbTlKbGhmUTRkOGhqWjlBaldoWHpRT0hzK2h5d0l4Z3I1?=
 =?utf-8?B?MjRoQ3BXR3h2TzBkY3BjS2EzdjE0SHdKT2lUT001VWJXbERlc3RPa0pjQko1?=
 =?utf-8?B?Zk5FYmNWVnlYY0FYM3czeWcxR1lOV3AySmNBbDBnSjE3dlNHM2FaVE9Fdmph?=
 =?utf-8?B?R2F1V3YrWm0rZmd2OW5ETkw2Vld1VmFoaGt6L2VvYjluV1VrTnhRakNGVlBH?=
 =?utf-8?B?RHNlY0NzVmU1UnpkZjc5Rnh1K1N4d2M0SE1RUjFlMWdkdGQ2Q3ZjMElLMGll?=
 =?utf-8?B?TWczdGZvVlROQmpBaXNWTTBibTRCUTF3MkZUMi9IbExON1J1bCtOaUpjR1dN?=
 =?utf-8?B?UXgxc0I4N2xBT3dVNzNsaWMwcXlwRXczbmhRQTAweEZjRW5rR1FhZGhoTDk0?=
 =?utf-8?B?VDgreEEvVXlLcVBESDZTSmZCbmlFK3BxNkZ6UzNuTXdUeThocHA5UGNsbjVO?=
 =?utf-8?B?dmFUZmptRTBseDNYODF6SUdjUGl1RHdJUFhJM0RzczhZc0o3N1Zac013SEtm?=
 =?utf-8?B?Y3E5VVYxMUxkNkNidjYrMGxaaFl1OEdyRWxZN2F0dWxVdVhwZVRhSU9ueCtZ?=
 =?utf-8?B?ZDEvRzFBakw2emdRbmZJRERWTEdHT0lCb3Y2alpuWW5ackxjVk9nWkVucU5j?=
 =?utf-8?Q?8jlnnZB9iM18Qwv6m84BCO8sS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d90b17-eb0f-4e72-5204-08db292bd842
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 10:14:09.2552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFQFCDCVhdU9aNCb6ihDQuusPja1B5AmV+IRoWV2qVpj4wrlUZxuHB7j1V0uwRM3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8530
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 3/17/23 15:54, Lars-Peter Clausen wrote:
> The depth of the FIFO of the Cadence I2C controller IP is a synthesis
> configuration parameter. Different instances of the IP can have different
> values. For correct operation software needs to be aware of the size of the
> FIFO.
> 
> Add the documentation for the devicetree property that describes the FIFO
> depth of the IP core.
> 
> The default value of 16 is for backwards compatibility reasons with
> existing hardware descriptions where this property is not specified and
> software has assumed that the FIFO depth is 16.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
> Changes since v1:
>   * Remove quotes around "/schemas/types.yaml#/definitions/uint32"
>   * Add `enum` describing valid values
>   * Use `fifo-depth` instead of `cdns,fifo-depth`
>   * Use `bytes` instead of `words` for the property unit
> ---
>   Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> index 2e95cda7262a..2401d1e19916 100644
> --- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> +++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> @@ -38,6 +38,13 @@ properties:
>       description: |
>         Input clock name.
>   
> +  fifo-depth:
> +    description:
> +      Size of the data FIFO in bytes.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 16
> +    enum: [2, 4, 8, 16, 32, 64, 128, 256]
> +
>   required:
>     - compatible
>     - reg
> @@ -57,4 +64,5 @@ examples:
>           clock-frequency = <400000>;
>           #address-cells = <1>;
>           #size-cells = <0>;
> +        fifo-depth = <8>;
>       };


Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
