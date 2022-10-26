Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA95F60DBE4
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Oct 2022 09:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233193AbiJZHOL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Oct 2022 03:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231937AbiJZHOK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Oct 2022 03:14:10 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C000BA905;
        Wed, 26 Oct 2022 00:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFPBgZvdSlvPs5mK8dHZkTf6iJV5BX5Lqueu3bk9eBQv4IRZh2UZ/W3oajJP3mIWbvJmVpKK3mH/OCpddJLDCZzM2gx6jsiHN0gypbiA1CkXaHZPGcoZCZTnbL+wyB3FoqGovWAX7pdEX+SII4ckxHZf/9ocf6I1fONwqLMI7p+V7y0eYXbtDHDaOW+MS9MuExTYGrdSQ+oDuRvoNEsd+bXAd68Zqx38rHXO3cPPAC9N7mJj0+sHq8jEQXd8M4K7VGnKFAQb0JSs4RthpetOf0cDyrJ7bvtgq7rG0R+Ly1qaiyFEXc+LddWwq8JOMUJRAjWsVscqbX4I0Nrt9D1MMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bsa0b4nmGbMAwx3eSieZ7+X92IHcXdetaIs3jsV1TM=;
 b=Em46svjgoZ+hPiqwnIFlzx/sO0Oup5J9D/MjYiqY9/buvqFANzpGWcQS5r9znxnC5yzxPhUNl5anq3UhuGfsliEE+vcMXyDHgBmqwkX3AMG2NVc/DpGSkRdzcss77AebfpG8OBCD9kSHBGoO89nKAogc5n2n79nMrWpPvgOYFCYzGClHiUoPo8MYW7mHr1SRIzYVYGe/gJc4PHibZXnDv7jfOaf2TgyE8JwQzJpj5qrWhu8a2EUZ/ZMvOu+nMiWv/H9RreiRbcEYuAw8mipn88RHBfS4CrgEiVGBzYKekOKnKZ2qS4EJjWWR6FlrVjX879hVYh6tgSVzCyDQ++rElg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bsa0b4nmGbMAwx3eSieZ7+X92IHcXdetaIs3jsV1TM=;
 b=JbpdlpCMHtU5yS/UbVLqLh0qDFqUza2kExwjodcg/jdCHU4uloWBkqyGlW3/5Cjv5rhrxKK6rFyGO6q/7n0UvQMW+eFgGrsoUxaQezQ4W0ljsE+1lo1vu2Ky+l1rvydw61gYbWKNZ6hEmKtE25rigsYCbqGotvnQWglE1SzgKEAqpnYMW3s4f2KZwFnngsr/X0byZ89h7KdcPuu3sty6xm43ZmwW6aCKPSBhEXllu+91mbUy+uVOwOmzbv1igtBWNr5cjcoN+X7SFMWqquZPgAcNbncdFLvhMagi/Pb2ednpXJcKXUgToHqhuBjcoRoBCEszy2fVI/4oGj1EScmgKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MW3PR12MB4393.namprd12.prod.outlook.com (2603:10b6:303:2c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.28; Wed, 26 Oct 2022 07:14:05 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66%6]) with mapi id 15.20.5746.023; Wed, 26 Oct 2022
 07:14:05 +0000
Message-ID: <f8eeeebc-e635-9c97-b97b-46df38f06002@nvidia.com>
Date:   Wed, 26 Oct 2022 08:13:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 03/11] dt-bindings: usb: Add binding for Cypress cypd4226
 I2C driver
Content-Language: en-US
To:     Wayne Chang <waynec@nvidia.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        treding@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com, kishon@ti.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-4-waynec@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221024074128.1113554-4-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0508.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::15) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MW3PR12MB4393:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f1ca8b0-8c19-49d2-f96e-08dab721aad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6xCnBtsYB51sACIlzwq7Oh1hsyVfuMuAdg971vKViVQdtdqf3EBa+vY7ETTXaFnsaoptoN3JaEs1/fwk23OIljhpVKKSezDHVeCAZ2rNNpLZnYxrWNCE5L8nrXy33BeJpLu4tHTF81A4Bg2YG8zLpK2MdDPjdwpOWp7u4NtTLK7moUbBFX6A9KT+dFAlC/Oyog920giDW5kDFRDXwnCMJc2afx2LOgNLasw6GGY50Z0Y+09ThL+VDO57ZKrSoiSx9mNgwURJoFbO2HU2fgo8gJyB8rnDv2hHS7yfus+ngGm5sLhbh1lWSDfNZ+iH/ngRYpMSbh7/qupx+FUGBARlD66vbyd33zhE2bZ5KW0XqEGWJEODSREdG8GEgh2IA0RUCLNWPLvi+gssrUcLGMDbH4Cc1jAKWkcyawkw/0PgAIA6tN/h0+gmIGSC9TqvQcO/5YY7a11EkTgW89h26SimlIdBzST+DHEf0M4b794/TvzMqRkLZW8NplpUXOWYXuPWyW+VWjpIioM1MkTM3V3AQRYqX1S9zCtyy/x48eV1ZK/ajS2ZsH0W3owC1ZDkmlVQq6z61ceJcIfV3EEXSCV03cX8XnzE8jisdrkovxXK61shxXcDENLGlkn3qwu2PFmVswZvAKN57ezgVx0X75DVKoYutVQxvGSheNZ2F9lgxaOHVyOAmk/MOOu32d3uiWrrlSLwfvPTMvHrZblAL+fF/+bcOMhEORHR95bbDYPkxYw6u5Zq/ILvMtqXXULLXSgso18c1DhXTXhe8jrplsG0/ZZq7gyE7j4pn4XQBQihqnigqNjC0/hWLHKaDop8VbdKvWHQ8kvpWAot6CcsLbmzah7XgQkZlnBhPE6SKO4HeIvuxprB2sGe0TsqiFB9TFmScvkht4eKIH3NejRkFl3kcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199015)(6666004)(478600001)(966005)(6512007)(53546011)(36756003)(38100700002)(6506007)(8676002)(316002)(6636002)(86362001)(921005)(31696002)(83380400001)(2616005)(186003)(6486002)(41300700001)(31686004)(8936002)(2906002)(66899015)(4326008)(5660300002)(66556008)(66476007)(66946007)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2VLNlBLWTE0d0JQSG5tbUpHQ05vVmpHYWNSUXA0aW5KZkpKVFVhOWhPaWpE?=
 =?utf-8?B?dDZvSEVHVERMM2RvY3hTdzI0cWFHaDhpTWdJdHY3SUNxOGpnVnBLZzhUak1J?=
 =?utf-8?B?a09jdTlFQmtEL3o1aGl1Yy9NT2s4TDFuNWcrMEJVenR5QzBlWlljTktEcllx?=
 =?utf-8?B?MitmbkhCZTRvenBXNHNqRlZGNksrSDM5bVFtMmJLc0xEYmkyOTFlSFVWQk5V?=
 =?utf-8?B?VnB2emkxRFRPZHJMYm5WWXg2NU5BWHBqV3dIVzhJTTljdS9oWG1QZzZPWkUx?=
 =?utf-8?B?RVkvbjdQRVJpWGlHaXFyMkVkbG04eXFTUzlGK1RNZlprZ2FkT2ZadVZSdVY4?=
 =?utf-8?B?WkxoVjNuV0hKSWc5aDYxTUNuV0Z0dVFnMk1aM2s3QWFRTXBZWnNJSGx3Z01S?=
 =?utf-8?B?RnNMdWF4eGVqb285L0F2TEVlRDMwd0RMWk10SExGb0l2NUhaRkM5YUtkQ0Za?=
 =?utf-8?B?OUVVZEJBVTNBazhOSTI2eEg0eFdER1RqWG1iY3psdmRVQWJvdzRZU3Z0b3RR?=
 =?utf-8?B?dytmNXNOL01qY3dMVjdwZWg2VmRyL3N3d2c4YnBBL3JTV1J6V1hhK0FWQThi?=
 =?utf-8?B?KzZJYWVKS2U0Sm10ekFKZS9aSXZvSmNSWVBEODdZOTVFQ1owL3ZNTGpLNDg5?=
 =?utf-8?B?RFo4aDBKTmYyMHVTdUpnZ2UvYXdLWFl4ajFWZzNOYkJ1YXBZRGtCT3lBZE51?=
 =?utf-8?B?SkNMYmVvaWdONUdVaGdaNVZCNWsxZFBrMXBKVUhSNEF5S2pxOEdrZG5TbGxk?=
 =?utf-8?B?YVFlNmFlaTlmS0o5WGRnZU8rTjBJdEN0RW1MeUxobjdvM0ovczRIQVcxRk1t?=
 =?utf-8?B?bFNYVk00eDFiQkRLL0dHeGlHajQrNkN1OGxzWkRHWC9KOXJzUWJjbGJwZ2M5?=
 =?utf-8?B?dUtzL09VZkRtRVd4T3c3dDlsYVNnSXQyMGlGekpUNmw0UTBwNHBsN2U3bkpK?=
 =?utf-8?B?TXVrUVpYeklrZTc0cXJsS09hSXE3NnhyYVZwQ09jRXBXUDU0Rm5wUVlKVzRI?=
 =?utf-8?B?Wmt1eDl1dWRHVFNKM0U3UEYrSTZDSk9aT0xEUVdnbmdaN2hzbm5YbGVjT1JH?=
 =?utf-8?B?dFlzRzFnMjFPVStWUFFkbWJ6WEUwUzZRTzFLdDhkUHlpbmFuZmlzejhmcnVS?=
 =?utf-8?B?b3FvT2ZldGx6aUdDSHUvM1JQNUxpNlVqM3U1aXBIeGxzN3UxZm93U2Nwam5q?=
 =?utf-8?B?bmk4ZFZ5VzNPQnJ4OFFLYVArSmZSalZJYVNtSXRYekZJZlB1ekMzU21sc1Fw?=
 =?utf-8?B?dkpsQzNmVTkvSGhDdTlzMDNicm1LdGJxVG50VkdSaEI5Y2JCVEFhbnpXT3d0?=
 =?utf-8?B?RjhxQkJ4SU1UR09uWUpiOGhnbndVSmRLNDlCNU9nWDRaaWVHbEkxTW5OcEo5?=
 =?utf-8?B?cWpJVEE0YlpzZEVDbCtGOXhEWmNad2RNWW1tanFibWJIaHFQTExibkszeVdj?=
 =?utf-8?B?d0NPM3BSVFZtMWVmdTlFMkJxYlJUMDhiWThwcS9wR1IvY2oyOXpWVDBmUnVB?=
 =?utf-8?B?L0daV1JINFBuSE1zRndCcm0wMzZTdU9KdklVd0gwdVhqMlplZjkvcEZlV1Y1?=
 =?utf-8?B?VWFtbEtEK0FscWYrb2V6dFR6QTVGcmxwZW54OFJZdU53c0dLcWphdEl3TU9v?=
 =?utf-8?B?S0U5VWowaVgvenpIaGk0dGxYN1NCdDlIOUhrcDVVL2w1Z3JxdTN4QitnQSt1?=
 =?utf-8?B?MG84bFMxOTZ5TVgwbVY0MlNpZ2xZcVFQaXVGK0FuSnZBL3ZTUWR2bC9QNjFR?=
 =?utf-8?B?cld6V3ViT3IxQlVVRkY0OFovK1JwN3lhUTUzWm9XNmptbnVQa0R3cGd6aXZ5?=
 =?utf-8?B?eHZ5dVlGZUlFK2tvaXIvRTFTb1lyMkF0SHF1Wi8ybkdKbzYwcUFtbzFnUjdK?=
 =?utf-8?B?NVJYMS9kUml3M29JLzBpd2VJcnozS0NHLzZBMzV4UDBGc1YvTXp1Q3RXVnAv?=
 =?utf-8?B?RzRLK29Nc1JjQTJJdU5WdjN1NzM0eWlZY1BkdXJXdHg2eEdSaWhqYWlsODgv?=
 =?utf-8?B?MHlNaENlRjNkaWtLUm5XclhNbktQVUlVYTEwSXNDZk1lZVM5clYvc1lKNlhy?=
 =?utf-8?B?Qkh6VlJDZ2pOM0YxQ3g3ZGZRR3VZWllFMlRFMGZpQmZaY2M1NENHVVF2Zkdi?=
 =?utf-8?B?N3RrVTFtdWVuYjZXRDhhamduczk4cWlBeWpKY0o0QmlIOHF5VTFUaWlkZHJR?=
 =?utf-8?Q?+6EE+7R6rHDv6QbiDBZS/6L5cp/q9v0pcvt8ldctrprM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1ca8b0-8c19-49d2-f96e-08dab721aad7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 07:14:05.7424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwbGT8N7Le+dP9x9z/LvodaE23WGvSbcUhvwVA7JzNPUdXZYgTteEEgSqqpTYHZQ54hlKuz+mD76/reKiOIwSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4393
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 24/10/2022 08:41, Wayne Chang wrote:
> add device-tree binding documentation for Cypress cypd4226 type-C
> controller's I2C interface. It is a standard i2c slave with GPIO
> input as IRQ interface.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
>   .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
>   1 file changed, 86 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> new file mode 100644
> index 000000000000..5ac28ab4e7a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/cypress,cypd4226.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cypress cypd4226 UCSI I2C Type-C Controller
> +
> +maintainers:
> +  - Wayne Chang <waynec@nvidia.com>
> +
> +description: |
> +  The Cypress cypd4226 UCSI I2C type-C controller is a I2C interface type-C
> +  controller.
> +
> +properties:
> +  compatible:
> +    const: cypress,cypd4226
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  reg:
> +    const: 0x08
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  cypress,firmware-build:
> +    enum:
> +      - nv
> +      - gn
> +    description: |
> +      the name of the CCGx firmware built for product series.
> +      should be set one of following:
> +      - "nv" for the RTX product series

Please add 'NVIDIA' so that it is 'for the NVIDIA RTX product series'

> +      - "gn" for the Jetson product series

Same here please add 'NVIDIA' so that it is 'for the NVIDIA Jetson 
product series'.

Rob, any concerns about this property in general? Unfortunately, ACPI 
choose a 16-bit type for this and used 'nv' for the RTX product. I don't 
find 'gn' for Jetson very descriptive but we need a way to differentiate 
from RTX.

This is needed in the Cypress CCGX driver for the following ...

https://lore.kernel.org/lkml/20220928150840.3804313-1-waynec@nvidia.com/

Ideally, this should have been included in this series but was sent 
before. We can always re-work/update the above patch even though it has 
been queued up now.

Jon

-- 
nvpublic
