Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B719F625D2C
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 15:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234601AbiKKOhT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 09:37:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234628AbiKKOhO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 09:37:14 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 244725B5B2;
        Fri, 11 Nov 2022 06:37:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EY37Id22lG0nucVuKj/zvWdQkNpzNITxEGNlh92kbKlh8bMYTHIt6MF4umQ5c+h7U2OTFOqe8MT6nYQjiPjdq+gREbGtemRgkuXwZS0HZzm3ABK4qEpJK4Vh5vJBw7lzWg4uFj50tXD57iU/WGJKmLBggXulCPU992HwIgzKLqwyGMY0El80cehE5rQ/yGCOjrX/gHisvYl0cSNMQ034WyJm3ocK+07l5PVCfnRWUyPfLz6h+bfDiyIDOoc+eMsVhJX9EY6jkRmo2jC6nbq1+BFr8+SRMtwz5ZNpSYmQVjTpttWYFQnPcSnKJmFNp6wXFcd9v6pc369i+nC8Qie+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcYcJ2qdN24C8Brql6UPwDDLO61MczKWH5B4iOwLKBk=;
 b=YNX/0V5PEKtbRWabv3xhSmZ6S6+7Jy3Uj6AjMCgOGOEXbDVj3z1WqW6lLTzFRIXou4qAwBm947g+uPQabXBoy4sx3Hu1iRvuudz0E10onuU/9n0j2G6A6FYrxvi6yyyWKTWE0XO/VeQpJfa3faTqRi7AzQKzYFULx8Cech5pjUEOZBrzNDunvEfkaGbBY/86W8VmPsGjSuWX/7VeOJd2yQL7671FR+KYvYmQThtcN1gMi4rf5Gdw0tzIu7FFGJnh+IU8ioQiJVeJnfskKOOBUfSbMIKvDktweP5Ur/2kpo+PuF6na/kAn75fE3meikn0kReZXKr5yIZes2aSJxHx9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcYcJ2qdN24C8Brql6UPwDDLO61MczKWH5B4iOwLKBk=;
 b=HxY0SrE1ZBGDkuZ9CofxnQM9fZ2PmZT9BhhzQBuT0c8N2Wj/rMeYpMaO5jn2vWbc+mA7rnRMOSFbglsOrjPDGYZGdiaBJwwMLFMuzDcj5OKEHJfpD4kuJGs24NQ7G8aNvCvjfOVJRYpL3uxh/gAxdxGS8J/ht06yFNuivT7X7f18JG4WAMsgXcooBR7OsApTAGvOzcD41fB9qhoReDmmLRb/GT6OxCDdk2B6u9mtiPfOEI4SBkyqZWVEKnhFIlxPnrnFfYuIqmDrLRDf8HDbefOJZH/ai+hw4mszfgXcTlan0/dmJUGZptXbPzjvFN1y6lqCcx5ycyHlyh81z/7kKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CY8PR12MB7609.namprd12.prod.outlook.com (2603:10b6:930:99::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.13; Fri, 11 Nov 2022 14:37:08 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1912:a3a8:1a8d:a960]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1912:a3a8:1a8d:a960%4]) with mapi id 15.20.5791.030; Fri, 11 Nov 2022
 14:37:08 +0000
Message-ID: <f491fde0-5448-ddf2-d227-c42e30fd37d8@nvidia.com>
Date:   Fri, 11 Nov 2022 14:36:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 03/13] dt-bindings: usb: Add binding for Cypress
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
References: <20221111101509.999589-1-waynec@nvidia.com>
 <20221111101509.999589-4-waynec@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221111101509.999589-4-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0325.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::6) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CY8PR12MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 00fe2e83-dbca-4840-9a48-08dac3f235c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Q16FAI8NobsAnsWAa+rV4Hrmp+sLsQeNydbd27jgTpNWOFqbJe1F9+EhvIvfKl1t4R7eSKjccj7G7QKLY3+ksPw7/JBMYrF0KkmoX4zORcTsfBo63QvNRW8Fgo72zRBXVksH75934Wk3nPq4n79eI6pD7qk9Gm3fGlcKOhC6KetSV64gWbMkjNzDieT/FloUUdXKU3jB7hjPIM4kVUw32Ayt3iCzpzI7nXvddjpG80WaCz8zAp7B5AvkLIutk2WmtWesVd3E8PX2pIKvep95qDfrWTwnyIDkR1wupKNM0OVuIgzZeihW1NRVQ0lk86a4CCQdRBvNldsMzQLoQNq4yDKFjNM6J4+JAAk8UqM2kRsYVET228+sT+0OVXg4MgGUFGcel3ynbelWQ07HyXpbX/sCgO+vfrel2AXYmd/JswCmcUZZVbXKhyfeTf1BFEZLz4LSBgHnYFzbRGYDVgIRTfpH7EMMQmbqjh8rnHI9Uxi4a8DOXF448aaVMK7WVl0nYCm8O0R7TgnKKaUdBY+zefYE4h6vvUyDSqIBx7nV6o4EMaMBp3JcfWSu9rs0ZcaKsZLU/+HWwd42G2rnM+LJ2OEC7cMrpG31BTAANlCTaSvr3vA+iJPRUUjJOT66W9ZO105QWIZUsZvjSwszywHB6EwSNlIfnJd4FuxE3rU99T1Bz5D5oKktj/xs1vMe4yuplEMgqVBfgJm/EPMJ0hJDiUiMMXv8YacF/X4U2p9irBnyknSA96YhklXEZnYBuQnFxhhKhfG47uKfK7GiyV2I7a5Bl1BK/6gphm218XlUNFEwxwUeVmehJ0hO4JcN2TLVPucu+GRyBMzwrl2NHgLBQRtQevhHyIWWa+xw9eGNLCuZGXQ0s9mS0DbDlbjVRNnA+jJ7VuqIeu5A9dh3PjC1LFFYitk+ACONfrbB6A+vB18FuNFt9+56P9NfJzT0Upl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199015)(36756003)(31686004)(316002)(31696002)(921005)(2906002)(86362001)(38100700002)(8676002)(41300700001)(66556008)(66476007)(53546011)(4326008)(7416002)(66946007)(6506007)(6636002)(8936002)(5660300002)(83380400001)(2616005)(6486002)(186003)(478600001)(6512007)(6666004)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z09TRTRucmlUQlp6Rm1JOGpOaFJiWWJqdE1uRm83VGdrb1Z1b1Rvc3pJeDIv?=
 =?utf-8?B?U0xDbktUamZVNTNjOXNBVWlBR2tpVlBrVjB5VGI0bUlBOHpyenNPa1BDTDR0?=
 =?utf-8?B?MzIxV2dYVFFnQWh0TGxDdzlBWXcxQlBaZmwyRURWelFZT1RUK0gwbmJkbWpV?=
 =?utf-8?B?azVsTDBrQ1d3WVhsU1JOQlk3djkzbkZxei9maDZJamIxdUxYaFdQUUVLWTRt?=
 =?utf-8?B?cGxnZnlSU3QzOU00Q2JMRUdXaUtKOWtUUGZReW0zVllDakRCVFdwZ1ltMm1t?=
 =?utf-8?B?c0dSMUEwajRUdUgvRllnMlFtUm1YN2dBc2NMSnVWR056SndOdG0rNDl0NXd4?=
 =?utf-8?B?T0lhOWRJOWZBWWtFTkpUMnRTRXdOZkFiQTBqRTdnOTBRdkR5ZldQbmtjZzQz?=
 =?utf-8?B?aUN3WHNRWmxIYjAxbWlwWFdiWS9Xc1R3a1JkRmU5NzNGaUdlQXZ3eEo4V3p6?=
 =?utf-8?B?NTRyWnd4TUpHcTVvTDJSdEtIN2VlcXk4MEdKd3lpK08yT1R0cmM4UkUwSDdj?=
 =?utf-8?B?NHBnYWlQMG1UcEE2RG1FZjBNd3MxVHgrVDBxblIzbW5MYXFhTU85cFYvVlZB?=
 =?utf-8?B?aEFzZG9vMThxbzZsR05pRnJmM2UvMnZyWExsdDJVcXZkd211Qms2UHJMT1Fj?=
 =?utf-8?B?NGZqNGQyNVB4TSt3YXpSTjc0cGN3NnJHYjdjMDM0M0FPbFZhanI1WkFlRHNU?=
 =?utf-8?B?bjl3OThnQXk5Y0tjZnhubVV3VXF0d1JUMWRtS0VpVjRLMnVXVHdRa1VuaGN6?=
 =?utf-8?B?dXBKMEZUUVFTc2V5c2FXbVNFdE5KVkU5SUdVaUcvWU1IaDY1eVpzYTV0WlJZ?=
 =?utf-8?B?ZEY3OWNzR2VIVllKUkNBOHNoN1o1Q1RvRnlvNG9nK1pDei9GVVdZZWxIME43?=
 =?utf-8?B?SmViWU80WERNNkt3OHhueG5Bdzc5eEQrRmU4SVRnbDMydGlqQk5QUGdsSW9v?=
 =?utf-8?B?MVRCY0ZhUnhLNTlnNEJpOG5kd3J2bGlNZVY1OHYwTVJUUlpvcVN3bi9JNm12?=
 =?utf-8?B?Y2hZb1MwQ1kzTkt2QmczSFJQblRGaDI5dDNvSU5DZ2NSRWJITmh2Y1ZKYldz?=
 =?utf-8?B?S3g5OWZoY0N3SjBMU1VWUy9sWkdjSlRaTVVHWnN0MFhrN0c2YXUxemVHMnVF?=
 =?utf-8?B?S2l0Q2ZrYlIwdzduQUhBZnQrbGwzdUVsbVUvV1dqQUhuWTRQTHhTcDFjWjFM?=
 =?utf-8?B?VGdkZDc0eVp1Sk9MSENuZ3JMeUgzRmsvM0pIelFKc0pIQ0RPQ2JGUGl0T2dH?=
 =?utf-8?B?Tld4WTVBZEFwWmVOYXpabGR6UThOaTlFOUdOVzBscUN6azZQZzN6SDJMaEQy?=
 =?utf-8?B?NWJJaU1lSSszSnZPaWE1RWZVbi9URDhvajNYcm5keVBBZ0RYbzRvRzVuVFh4?=
 =?utf-8?B?L1NJNGZ4RXNBSDEwK1R4T2x4VEVmTDFmWXMvdklCdkg0ZG1wMCtqWUF6czNN?=
 =?utf-8?B?eDd6WnRRZitlNnRkeXlSYWI2TmVKNEFBSlIrUkFQOFhBVGorM0JQbUhNdUdo?=
 =?utf-8?B?S0o0SFVTWWFIdHYxY3V3eUg3elFKQ0xrVkthMmgrclVTbmh1aHdxRmk4Sis5?=
 =?utf-8?B?UURoZU93UkcwNDhjQWtiV1E5ZitKNDdrTHBTMUpjR28vSk9TVGcvTmRQUkJv?=
 =?utf-8?B?eFppY1cwTGxINURhVTY0YjBibnQzZDRHQThKYm9qcy8zL25kajFDdXRyT0FP?=
 =?utf-8?B?QTlOc3hvekdGOE1kNzBGNlJ3TTFtbm4vR1B2MlJVMURFL1ptbWJMNDRlUFVE?=
 =?utf-8?B?azVLL29lOEk5dHR3N2IxaXJhT2NIUzVMUzRIUGxYNXg1RjR4dDMvMElZeEMw?=
 =?utf-8?B?d1RTMDFESmNFSThLOXY3QUR5djB2ZUhZUTI2VVp0T0RGc09IMUsvK3dKSmJy?=
 =?utf-8?B?ZmM1dG5tVE1EUmhKcUppVVNjSG9XNEpWTDZJNGhRanhCT1lpQVZBa0xSTGEw?=
 =?utf-8?B?R2VIVnQyUVVTRnNDVXhvNjZNbkkzNkxBMjIzdnNQMVZwRjJDWUhqK1RVSGlC?=
 =?utf-8?B?aWowSERPdWhzbTFqMzhuQmRSWFp6WUNMK0hzUTEyeS9LV0kyblVaeEw3MUlS?=
 =?utf-8?B?MXgvMGVLSStwcW5GZnFZbFdjZWV0NkJwUm1oc21PVmNDWjhGTzF3OUxnM3hG?=
 =?utf-8?B?VUw1UEd5WmpSM3RZaElkRXhzU1JvdXBvMW1TWjhyMGVidWVoVHZsa1JuWXJK?=
 =?utf-8?B?UXNUcGVqUnhzZm5TQTFNc1dxR0N3enhSYzRLeDZPMXB5RTdNb1JpVjk2NHd5?=
 =?utf-8?B?SjhTVHY0VjV4ck54cXVSQUZQSVBRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fe2e83-dbca-4840-9a48-08dac3f235c3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 14:37:08.0672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNN4FpPM7jzXGCLSoeQkZ2mnM87YGwVedX3htu51aT+R59V1iFkwuAlX+LbKa0Thk1Rqn1pBs+wZPK5AeRWbsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7609
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 11/11/2022 10:14, Wayne Chang wrote:
> add device-tree binding documentation for Cypress cypd4226 type-C
> controller's I2C interface. It is a standard I2C slave with GPIO
> input as IRQ interface.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> V1 -> V2:Based on the review comments. Fix some addressed issues on
> description, interrupts, cypress,firmware-build, connector, and
> additionalProperties properties. And also remove the status in the example.
>   .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
>   1 file changed, 86 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> new file mode 100644
> index 000000000000..70db97e0ad31
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
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
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


I see warnings with this change ...

Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml: 
'additionalProperties' is a required property
	hint: A schema without a "$ref" to another schema must define all 
properties and use "additionalProperties"
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#


Looking at Rob's comments I believe we need ...

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml 
b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
index 70db97e0ad31..8feafbaf9e20 100644
--- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -43,17 +43,19 @@ properties:
  patternProperties:
    '^connector@[0-1]+$':
      $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
      properties:
        reg:
          maxItems: 1

-unevaluatedProperties: false

  required:
    - compatible
    - reg
    - interrupts

+additionalProperties: false
+

-- 
nvpublic
