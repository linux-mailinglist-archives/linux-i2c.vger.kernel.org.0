Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0300762985E
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 13:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiKOMPm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 07:15:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238119AbiKOMP0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 07:15:26 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D7D22B25;
        Tue, 15 Nov 2022 04:15:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHBg9DtURnGQAkg/xnkbBQR8CXwCnohJZ1hQlHoS1tQkZ7G3LEWkbj+IqkIhH/VGmVA1QuGI6pV4i8BjReC9dDGjgqepTVXVe3FCXvBBiTGgKUC/cgad5aB/AZLjr7J8RHKugggcMAz3BlzCu2VjWD/Oeq62AfTW/EM7A454g4Js/fwf7t5i+nTA3L3OkpTa3D1mYQMbhwLXeqixyJh5ROcLYQnHF5kqE23FsNBpO1rx5E4Sz8r/JbRbS+w1s6dIYpLaGCvtzfAa6/sQOvHKTROQ1tsIAxmHs/v+nQSFqQM2YnBGfXgXPEjLcPy8k6UNRFDqx44UVL5WrKn1u4dPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPyvLJoUD2RjryAriVoGjLdEFDQa0oK2qT6jkuESDhY=;
 b=Lw+B88EYv2ostp4SFOEYLG4e8rvUP6dvtxfgQdwEI7Hv8Kv4c1kIWTb6WFL3QhoPpITSLdq1OTh0RC0DzrwbkukzEQgHbUSYXSz5WjqJT3TcXSY1eyT7H4JF/xnv03dq0NzHZTBJh3qNSMr9KFN0H/arsxfAeIjuPAPx8NcvIdxo4yFLP5jrpm3bXVjvXxadkysNZHZI5lS2xlG7YkHfD+w+CqFwXJh/cwgiy8A9HbuYOX2z7UFQK2ZUPdb/KZ49eLltQ2SbW6Hu8DsdSu6NWZZe9GeauZ8TIKMgtBnpa6NtiuQjQOa949VxN+lnNcJLm2lMUK6vwjaq7N/Th3IMMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPyvLJoUD2RjryAriVoGjLdEFDQa0oK2qT6jkuESDhY=;
 b=KdiOVKed6g9F7CguE9iG0GTTGDofWd+bYUxMC6E9C3FOobXFya5RuuvnZBs2fAVdr5sZX93llBr82VDUjg/qLjFvWjt0oVSu2WUocK52TvuAuL3q6n4LSv4vFDOnIC3dz3n97IKdc7AXgQ47FHqSovadnJzQdXgU9NL6b8VS4gYWHR5YH0opsx9+dWm99AAv1s0b202STeXoUUK8SmByAKl2SRVokt4yDJuyhiQvWfpYQu3/PIHyMnZxf6Rf5P+tVOfiGX+B9k6ZqZPh2CoyaDB8QkYidaFfWM9A0N/WsvLIZWCdxK/dFpX3UXjipjclO3bsOd7uV8it9qFD0MY13g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SJ0PR12MB7082.namprd12.prod.outlook.com (2603:10b6:a03:4ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 12:15:21 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 12:15:21 +0000
Message-ID: <6c1b733e-7926-098d-e852-f2220947979f@nvidia.com>
Date:   Tue, 15 Nov 2022 12:15:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 03/13] dt-bindings: usb: Add binding for Cypress
 cypd4226 I2C driver
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
 <20221114124053.1873316-4-waynec@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221114124053.1873316-4-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::8) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SJ0PR12MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b29302-16dc-4545-fbf1-08dac70310cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bq926l1LCuEWDMCdAJHP1E9t1JDXET+oLh/WJQuaqWJHThpGR6P1tYPnFyqlZ9UVZgQSYiIt7fE87K/M+x+C1X8XxCxB9zN/wdZw4kUsFcj+xpBz9JStVGHYoSwPezbix/UBURQfgfX5Wh2aTFKsPYOc4Q/HBei6w3vwjp0d08znwK4rn6APHWptezk5yp2iYnRzFBcgKGCb69YwN/mMzKSKbf5/V+KU8bFJ979NQHfMuC3UNRrYJ6YnUfs+0togdOm4mkj1zwkgFqXNn4qNYzkJ58ww/VZLejapQ4sNXxbEdRxPwm0odxuiohQPS9uD+avYCdVh9GDgF6yJBI5rm5JgSO5rqJHLLPFJadGTaV6OAIJPpMxqR97X1u9vAPH8ffl11h3omyxp72fLQ1+6XcecdnuMH36yqWtmT+lVlyEK0b3ZpyyA44HnNcf+8X0hJNPrTEWe6WyJQalaHAkCBDkuYiI3tv4+SMs6tEXn2ZM6Q3Ofo8eky8MwILL9atLi4s8ihW3qhfwn9ojRpk6t30zXglj0dmcdZKKJwF+npnQmsBkwQkx01xZ8jIDNYyM86dkorzov6VAi6FWmN6kPSQyKAYoJE7neABhTx0nldbhgsK/VwOLALxMaZFJEP9LMLSLA5wQ/BdfJNGvbkhikhWEaRC33Zt77Qmlz1xxHYy4OnAmaAFAxOCz5fiiNI3ESVg8B7EHLPOdfVr3DyAmx/7o6kDFr4gaColuO6C7OCasYUMV5cJEURUOk4ccBbbHX/Y/jQYM1c8JvkpIpx7C8HBBKP4YOTjrITM4i2ttLHtmYNC921uIXTtJWLB/l4bUrSkUuOuwQp23L50LCqhogh8/vIgjNe8HDMx2GMry7R0Fit48uMefSTl3X5gbsiS0oVTRsQ+PBZNcHhYOJxcl63ycOescRCpBPbOynfuIV0cMxKCKlS/POm6XLXIW1824G
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199015)(4326008)(26005)(66476007)(6512007)(66946007)(36756003)(41300700001)(5660300002)(7416002)(186003)(2616005)(8936002)(8676002)(66556008)(316002)(55236004)(31696002)(86362001)(38100700002)(53546011)(83380400001)(2906002)(921005)(6666004)(31686004)(6636002)(6506007)(966005)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2Z3L0dyWGZyc2NxOENLOHUxWktmaVBLRXd4NHVaL0huM0oxSEx2SWZCdU16?=
 =?utf-8?B?Zi9lbDdTNW1DVkdlcmdIcjJlK3h2bThXUjNyTFNwQ1BaOGt1OGs3bzJ4VGFs?=
 =?utf-8?B?eXFET1BUZ2UwZ1pOd0FIMzlYRWgweGRndFdUK0pLZ0tmM09XNm1xdXk2Tk1T?=
 =?utf-8?B?TnBNclJkOUJNUHZTang2QTJ3bVJYenpjQVluQlB2T0RCM3lmZE5ZcXc3NE1a?=
 =?utf-8?B?UjVyaU1nMEhSOHh1MXNJZnU3blI5dFA3YmJVa0JCWXYyL2Y1M2ZXU0dlSkhu?=
 =?utf-8?B?T2o1Nkdtc2VnZFhiMi9STTJTR3pzN1Y3YWZodWdhdjZDcFA4dm8rRjRZcHNr?=
 =?utf-8?B?UVBmdmkyZml4TWJPNXROQy91ZzVVa1ZnckVoMXJnNFdCeUVKb0ZZK29OTit6?=
 =?utf-8?B?VlQ4RjFpalI1c2VhMmJXdjZOQ295YW5rZmp3TnIvV0tHYWFpRGl6UlpSM3RE?=
 =?utf-8?B?c1lzNzlQdjRzQ1pja25oKzlJTHZGVzJMZXdmN2owTElZbkNNeTRDbmhranBZ?=
 =?utf-8?B?S25rdG16bDJvd3BBd0REN1A3dlBrS0JqK2k5T0RiNmJRRHQ4Zy9JTExWUGFy?=
 =?utf-8?B?Z0dXY1JHY1ZoRjE1ZHVRQkJJQTlzekR0amhDYWwrTUNvb1E1bWlQRkZ6VDYz?=
 =?utf-8?B?Y21QTmVYUDlndHlvcmZiQmNPVEdxa1ZybkM5cFFaaXh0Sm9ZSUc4SlZUUDNU?=
 =?utf-8?B?Y0VINyswUmlLZ25XV3FibTJGSDRFbnJYRUlPa2JNMzB5WllwbS93RG16bTha?=
 =?utf-8?B?MmJsdTNtUWw0Y1hlakJuQ3lZK1FOSE9sZ2F0QldpY0RyZUpkVjNVQmZmYW8w?=
 =?utf-8?B?YmhsbkVxMTNzL0lnLzJxUnRNR3Mwam9CVFUxRmJKTmpZQ3ptNjJDS2pLeFg0?=
 =?utf-8?B?ZVovalpJdElTT1ROWlBicGdpR01VRXNLZk5BUFlYL24xRFFXNGh1N1NnSVM5?=
 =?utf-8?B?NGp2Q1h2d0RxK2JEQXJuRW92eVE0ajBqSUNKRWlxM1BlZUdrVlFaSG5wdHNK?=
 =?utf-8?B?ZXNWUVpHOHJIVWc5LzVKTGd1WTczUTZUUDZHU0FodmQwQ1JTUCs0ajFzRFY1?=
 =?utf-8?B?OHd0VXBweGpjTTJCYTdzcnJncHpDaytLemQ3eHVVQjEyTlNkQUtjQkpZYnNw?=
 =?utf-8?B?UFA0VWRQZzlKemYySm03WmxkTGUrNjN4bDdYY1NnV3FEYldDNk04MEppNG90?=
 =?utf-8?B?ckluZ2pSYk1JWmFHK2VtVnFSRlBkU1c5RDVwK3VlcmQ1eGpwUWJzWHJtUDk5?=
 =?utf-8?B?cEIrbnBSUXlRTzN2cm5Zc3IrQ0x5VG1QM25YK0E0Qk5wbXhYQUQrYUFHNE1N?=
 =?utf-8?B?QW15SGRQZUpoTERuWVFINUtUZjRRelYwQ3pUVmpQanlESFpKcUFueW5Lb1Uv?=
 =?utf-8?B?TlVIZGpSY042eVNhSTlNOWhvQnFSTnNORFVCSmhCL1pWY2pxUUNwOGYyMVdG?=
 =?utf-8?B?cjQwMHNmY0RSdlFIdDd4dW5GZHhLVnhBS3BidzJGM1VPTUVPK0NpR041NGY1?=
 =?utf-8?B?NjhHQStsbUdZNkUzOUhuZE01OFVzc1RhZ0RzWVJuNHMwb2p5WTRwMW9BZEpr?=
 =?utf-8?B?RlRwYkh4djlQZUp1anRSaHRaVHN0dGtjRytxQVR6RWZKYzNFYkNtZG9VQmU0?=
 =?utf-8?B?V0dtOGlDN0xmV28xRTZKNTVzNUhJMDZsbStCR0pCQ3BXbTgreGZvVWY2VzJN?=
 =?utf-8?B?ZHpZT1BhcFNEYXNmZG9TWmJPUDN0dFdFN2dicGlsblZNYVg2QXRVbThYMVpD?=
 =?utf-8?B?T1FTVWdObDdPNTllSzlrN3hDM1lmRVZCMVlJd2NralFXRjJvb05oWWgzS1Fm?=
 =?utf-8?B?b2xMQkplTHR5MWtKUFBXZTlJMGtZME01ZUdXZ0U0bGNPNDF2eUU0WnM0Zk9y?=
 =?utf-8?B?dHU0TTErb0N3ZlpZbTlabHk3c2ZtWldBZ1FXa05iRmUyd1ZsSGd4MTlSeHlN?=
 =?utf-8?B?TUhIL3ZoNXJVVmxSd3Y1ditOYmE5WVhNQ3FyL0sxbldXbGtyS1MyU2pTeUJF?=
 =?utf-8?B?NDh0QjBKN1pjRjZuYkM3UnRpWlhWM25pS3FOOUU2RDZ2cTdwcyt5aFA5L3Fx?=
 =?utf-8?B?YVZ1MmVKSkh0aFFxN01nekQ5bHVLdnI5OEN5ZEdhKzdDbFk1ZFpSaER0NFBj?=
 =?utf-8?B?UWJiQlJGNU5UM2tGcm9SVTBucURabXBQSnYxRkhZNk1MODloY1NXK3R4QUVl?=
 =?utf-8?B?ZGc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b29302-16dc-4545-fbf1-08dac70310cb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 12:15:20.9791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Drh6gvTIdD/d//lLs9ae600jqvH7y9OB88VEa+vMFf/aeeA277zeGqpLLx59TZvA+qkge2DpOoqldRwpgX3mLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7082
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
> add device-tree binding documentation for Cypress cypd4226 type-C
> controller's I2C interface. It is a standard I2C slave with GPIO
> input as IRQ interface.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> V2 -> V3:fix additionalProperties warning on new schema
> V1 -> V2:based on the review comments. Fix some addressed issues on
> description, interrupts, cypress,firmware-build, connector, and
> additionalProperties properties. And also remove the status in the example.
>   .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
>   1 file changed, 86 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> new file mode 100644
> index 000000000000..854fe2f9181c
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
> +description:
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
> +    items:
> +      - description: cypd4226 I2C interrupt
> +
> +  cypress,firmware-build:
> +    enum:
> +      - nvidia,gpu
> +      - nvidia,jetson-agx-xavier
> +    description: |
> +      the name of the CCGx firmware built for product series.
> +      should be set one of following:
> +      - "nvidia,gpu" for the NVIDIA RTX product series
> +      - "nvidia,jetson-agx-xavier" for the NVIDIA Jetson product series
> +
> +patternProperties:
> +  '^connector@[0-1]+$':
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/tegra194-gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      #interrupt-cells = <2>;
> +
> +      ucsi-ccg@8 {
> +        compatible = "cypress,cypd4226";
> +        interrupt-parent = <&gpio_aon>;
> +        interrupts = <TEGRA194_AON_GPIO(BB, 2) IRQ_TYPE_LEVEL_LOW>;
> +        reg = <0x08>;
> +        cypress,firmware-build = "nvidia,jetson-agx-xavier";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        ccg_typec_con0: connector@0 {
> +          compatible = "usb-c-connector";
> +          reg = <0>;
> +          label = "USB-C";
> +          data-role = "dual";
> +          port {
> +            ucsi_ccg_p0: endpoint {
> +              remote-endpoint = <&usb_role_switch0>;
> +            };
> +          };
> +        };
> +      };
> +    };

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
