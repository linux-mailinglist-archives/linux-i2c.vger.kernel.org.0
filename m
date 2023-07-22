Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEE5B75DBC6
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 12:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjGVKuq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 06:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbjGVKup (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 06:50:45 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2095.outbound.protection.outlook.com [40.107.104.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32ECAE67;
        Sat, 22 Jul 2023 03:50:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqYrXagEKn5ybaH9A/O+kKsNCZBIDwecazxs8l/dEShSkumuLwdlQPLO46G6iYgu9UI/Jd0ekzjX5StFP0IF1b2eVVVVH4nsfkMKKkxqWD/jf8MDMPmF04CtdaBBfsWX+tE4J4Hsc6H4DdiQbTKWABKHPSAs7/ZErdAZmGwclW2ef0/gQTN/BF5wvGVjP2y/knLd5KSkCXNOX9IoNeLniGWZ0IDJOewtlegzm+mngBcMJCH/VG6eIh6d5ElxBLfHwpBgS1W4RwaKYX7vtzI2XRum2gqrBbzBpt1yF5ftad4D/SRQLbH0awUPBZipF7SpkGRlHadoH93WR90KZIgF0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52wa1zRVtGIHYJ37Ubro5t6RIqw+jiaU4JdmNmlqL+M=;
 b=n9fhey0mHu/35BClrpUVmT+ihjW0owYtCP2uGCv9xhXBQxjHAgcezSJqjjK5kO1Rrfs22sN0XY+ZyK7aGFYYV0astLFKEeK9HyiG2mPKMp7zPMg69dtY4HTtlOysRPrv5UdUsD6Hn4Rf2Ck9/BZ0O2ZT16hMjqzv1qFPyO25AE9SqyQ+YSldyWDbYacyydgRaJbTyCbFAcD6fZrpu7iSlbnEL2/BcRaOMUls71j6eCC5PKAs5dkLlT3cmD/kyYGwDdJruGtZfV6kOvh7TP+XVCFJkeKetJDp6/zOBeTPj6DwIiNQbXwZFZ9KZ5LVif0K3ugP31CHpfqE9SJfPQn5fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52wa1zRVtGIHYJ37Ubro5t6RIqw+jiaU4JdmNmlqL+M=;
 b=R52lrEB0J0tPgRoSkOQ1IV0X4uaj6dxGSmmTNNw3xO89j9XqPpEZhnLAUezWn5HsUn3wUDSN3qle2v1xWrPectoD2sagzncRXy4DBju0huDDbrVjFCv9qy9MRHVO4YDB9WITZcfxF73mJ/9O+qbsm3xlOYd3i5X5E1G2SzRNgZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by GV1PR02MB8540.eurprd02.prod.outlook.com (2603:10a6:150:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.12; Sat, 22 Jul
 2023 10:50:34 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::2a6d:c845:6c5:2aad]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::2a6d:c845:6c5:2aad%4]) with mapi id 15.20.6631.017; Sat, 22 Jul 2023
 10:50:34 +0000
Message-ID: <6699b20a-87ee-a180-5995-479572144b25@axentia.se>
Date:   Sat, 22 Jul 2023 12:50:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] dt-bindings: i2c: nxp,pca9541: convert to DT schema
Content-Language: sv-SE
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230722095710.17496-1-krzysztof.kozlowski@linaro.org>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230722095710.17496-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0095.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::13) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|GV1PR02MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: f330db29-aa1c-482a-422b-08db8aa179bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nWwzYr3s25qTDXq+BT0XOPpn924Pjj92E+LN1aZ5u4XsMehFOwg5poN31AnjrCAfOrbGW3cRcjHyO70OYc34Cri0kqG9v1v2VODbIsvaluLUz/lnZ4vHIVdDPtdOf/cUVwBNlhUpesflp0JT0U6rI99ruSBKgHgnebGk1pW6feDmj6qyqqzO1JXZwrptyTY07a3sKc23q5rbKsDskUsxlwbIJJUprJkgXECvfGb/JvBxN5ZRYk2PZaBHb/sZU9cO/ssZL/fjhqrC71arHsTaD20w6o/C9OUHV77PODBJaam6K6nYZGkWfI6BCh5SbsnXyrn61btadW9zGxdcI4BfdQm/3Wfc4TWw4VQVU3HPJQeyTPBCHUJNpA5IKcioze7LKYBcRSAUyhIIDLzRavmDEOxToDlKxSfXj6vjMauhXUMTk8XvlUwWIbgzrlCE0nh5wxQIfUEnB6afbaeubuXVKVuAC44vaz8rJHIj4ssRIWWd3umcmjaVfiM5NryUXl+FPlffIhEgNMlTPIQsixdGKueTkKhwquBkKtjKWdsJR3V8u2Q2JvYD1C7rQXeV3skvqQinLyySG7rF5lr8/A0ktCI6ie4DcWkKV21Kr9/rY5tN9F+51Z0MJznAINy2VadDQ87/DBuM4F/t/CCVY29x5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39830400003)(366004)(136003)(376002)(396003)(451199021)(6506007)(186003)(2616005)(26005)(966005)(6512007)(83380400001)(2906002)(66476007)(316002)(66556008)(66946007)(8936002)(5660300002)(8676002)(41300700001)(6666004)(478600001)(110136005)(6486002)(38100700002)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2swa0Y1ZkVMcHh3bzRjZk5IN2RTaDUyc08wMnh2eDZ0aHdSbCtVMjQ5bEtI?=
 =?utf-8?B?RUtxUVZMUDNrZW1YSDRSc0RDR21MT0I0d3B3OHo0VHN1czB0NkdJZmc1TlFa?=
 =?utf-8?B?UVdTazRma3ZaaytjTWtLQlZsb0YxVkZBME9UNU1nYTNlZ2dqQVlrdEN4K3JC?=
 =?utf-8?B?L3VGVi9nd3ZoTEtPQTFKWGVpZm1ENG1YMTJMTW9SZXhDanhOQmFCaDdHZDdP?=
 =?utf-8?B?M0JMWjMwdm9XZXlob1UzbXdULzkyRUJKTHhkVnRscHdQWUZXT1V5blhpWlR1?=
 =?utf-8?B?Z1dWcjBYNVlSYWtyNHRmcG9USUhidk9hakx6VFB5U1NoZ09TVUxMcDNQUDZP?=
 =?utf-8?B?RFRQeG5RNnptK0NnT2d6YXhsZGU5SmM3U2ZyTFpPRlo0WGNramUxL25ncTU1?=
 =?utf-8?B?aEtZV3hYQndGVnBudmMvSFhjQVR6dnA2b0RpWFBQenNaY2sxOXp6dDUveEli?=
 =?utf-8?B?RU44RS9iNG52MnkyNVJGaExERDNjRzJDS09MQ2JleXovTWttYjhuUWhYTi9C?=
 =?utf-8?B?ZzJ3b2l2L1dNWmFmd0FpZVFNUnZWdEh4Wmcwb25pKzdZc0YwVEZDV1pJOG1L?=
 =?utf-8?B?eVlzRitYSjgydWFvN0RHUnV0a0RDaVFvZEQxbnFjMlgyK1B2SjhTMDhmRm0w?=
 =?utf-8?B?SVZnOCsyRDFDVzE3b2lYeXEwK2NLZS9wUVhabk9aT1hSS1R6TzMvZVNGT3l3?=
 =?utf-8?B?WndtemRGeTQ2SUNGS2Qxa1NWUmF4b1Rjc3YxU2dpL0VzeGVLSnpZdlhwZzZu?=
 =?utf-8?B?dnorakhzWXlLTnZsS1ZlcXBUY0QrUG1sSTF2eHhZNUJ5Q1RNejZJZlRYc2d6?=
 =?utf-8?B?WGtPcGhMbFE2UnlsdjM1NlY1L2ovSWtIbjlYRDZmSytuNzBTK3JZdEtWbFRq?=
 =?utf-8?B?b2xSTjcwaHNXYU9pQkJTNkFGaXNXRlhmSjBPYmtab3E4VmlBNENpL3picVNR?=
 =?utf-8?B?aS9oN2hZZEFjajVSR2dMYmpoRnpPbDlWdTg5cGwzQmRPUEFWN0wxSGtHVzMx?=
 =?utf-8?B?YTZoOVRPZFFMRzd3YlF6dUZPWitJOGt6WGMzc01NSE0xNW9MVE9IUXRSMHl0?=
 =?utf-8?B?TTV3VFRya0xyZ1N0cnRRVnBOdS9UY0ZTYldGQVRtQ25QR3pUWjFnZzJjYTZk?=
 =?utf-8?B?YzBJU2JZTXpOZVp2ampOK2hpVGdCcGMzZWl6SVVMYzQ3UFpWTjllTDBKeXdv?=
 =?utf-8?B?MkNUSXZUZXRMYjB0MXE0NTd3REROWUFzaFRZOEdBbitWOUdIVWd4TU96ZVhC?=
 =?utf-8?B?VHVDU2Nqa3NWelJYQVRVMEtOTWtVbU5FamVKcExldjdWdUNIT0w4TUVYR3NY?=
 =?utf-8?B?ZDloUktCd1dxMHVBblpWVXF1WlR4OWdVSlVJSTJPeXR4RU1jTUNEcno2eGRz?=
 =?utf-8?B?MXF4eXZPR0pVNCtqUTZiL1JoNFlhbWxPOUNiOEV4ZFU4bHhCTTZjQjRKTEJK?=
 =?utf-8?B?Zmthcm1teUNIQzR6Wm9BR0p0UTRpS1lTVkQybTFhMXJXeVhweWt2TGlkbDd2?=
 =?utf-8?B?NGNJYUVackQyQXY3eUk1UEt2MW5tOSthM3pKUG1oTXNkMEJSaFFjeEg4bHB6?=
 =?utf-8?B?R0J0dWUvK2hCb0pTUDhTNldNZFJXK285Q2hlQktpS3J5RkRsSkFKaEdmL0RY?=
 =?utf-8?B?MjRaaTlCT0Z2R0M5VTgzTi9qRnFkdW9XWjV2bmo5T2t5cEh2cjlnb2JKbEN3?=
 =?utf-8?B?ekU0MXA1bzVzdHdldnBJRzhwcjVSR2F6QzdNUmdRVUhFdWltd3FVd2tHMlN5?=
 =?utf-8?B?MmRXK1BOWlJuK3Bucks4WEthTnRONjdkY1JTTjFOQjhLQS90cldDOTV2VUhI?=
 =?utf-8?B?NlJXSGlIeC9ZajR2emo4TWlqaDlJMW5qYzI0OGF1ckllcEJYcVlQK0o1eDlX?=
 =?utf-8?B?dW1wV2ptS0NSUTdJTTFNWFg2M1drc0dKVWdIbXVidngwYWtpZzJoQWlmTUxp?=
 =?utf-8?B?SElwSUk1dGZnb3ZjbFhSai80eGpFVzQ5THI5RjB0K2NRN2FsZmlUbDYwRVhz?=
 =?utf-8?B?VHFSMW9PMUc4MkZ1ZWlPSEFUdFdUZWF3N2dsZm93bXNBSTYvVHJPZDRmVVk2?=
 =?utf-8?B?d2toN3VHMEVZNHpYWUk1VXhUWUZaYnB0ZnhNSzRzOHJIVVBORU9WZXpYelFq?=
 =?utf-8?Q?JqSg8/7bJ2fd/T5ohwWEjDOiB?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: f330db29-aa1c-482a-422b-08db8aa179bd
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2023 10:50:34.0879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26e84k9PphABCyjJPormrbG4Kp36hAkoXN+HCGGE8JwnQhxZUfOntCbMPY+TdS9N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8540
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-07-22 at 11:57, Krzysztof Kozlowski wrote:
> Convert the bindings for NXP PCA9541 I2C bus master selector to DT
> schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for doing this conversion!

Acked-by: Peter Rosin <peda@axentia.se>

> 
> ---
> 
> Changes in v2:
> 1. New patch (Doug)
> ---
>  .../devicetree/bindings/i2c/nxp,pca9541.txt   | 29 ----------
>  .../devicetree/bindings/i2c/nxp,pca9541.yaml  | 56 +++++++++++++++++++
>  2 files changed, 56 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/nxp,pca9541.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/nxp,pca9541.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nxp,pca9541.txt b/Documentation/devicetree/bindings/i2c/nxp,pca9541.txt
> deleted file mode 100644
> index 42bfc09c8918..000000000000
> --- a/Documentation/devicetree/bindings/i2c/nxp,pca9541.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -* NXP PCA9541 I2C bus master selector
> -
> -Required Properties:
> -
> -  - compatible: Must be "nxp,pca9541"
> -
> -  - reg: The I2C address of the device.
> -
> -  The following required properties are defined externally:
> -
> -  - I2C arbitration bus node. See i2c-arb.txt in this directory.
> -
> -
> -Example:
> -
> -	i2c-arbitrator@74 {
> -		compatible = "nxp,pca9541";
> -		reg = <0x74>;
> -
> -		i2c-arb {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			eeprom@54 {
> -				compatible = "atmel,24c08";
> -				reg = <0x54>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/i2c/nxp,pca9541.yaml b/Documentation/devicetree/bindings/i2c/nxp,pca9541.yaml
> new file mode 100644
> index 000000000000..b65c25c1a435
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/nxp,pca9541.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/nxp,pca9541.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP PCA9541 I2C bus master selector
> +
> +maintainers:
> +  - Peter Rosin <peda@axentia.se>
> +
> +properties:
> +  compatible:
> +    const: nxp,pca9541
> +
> +  reg:
> +    maxItems: 1
> +
> +  i2c-arb:
> +    type: object
> +    $ref: /schemas/i2c/i2c-controller.yaml
> +    unevaluatedProperties: false
> +    description:
> +      I2C arbitration bus node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - i2c-arb
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        i2c-arbitrator@74 {
> +            compatible = "nxp,pca9541";
> +            reg = <0x74>;
> +
> +            i2c-arb {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                eeprom@54 {
> +                    compatible = "atmel,24c08";
> +                    reg = <0x54>;
> +                };
> +            };
> +        };
> +    };
