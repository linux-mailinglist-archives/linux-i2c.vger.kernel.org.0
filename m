Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF15C6F3D2D
	for <lists+linux-i2c@lfdr.de>; Tue,  2 May 2023 08:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjEBGED (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 May 2023 02:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjEBGEC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 May 2023 02:04:02 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2135.outbound.protection.outlook.com [40.107.7.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0DC273A;
        Mon,  1 May 2023 23:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jh/4H3B1wXOcRKTRSL21kFemOVvx2Zj8hNzbFkiu422VbtWShDJwC7l+BDnVeALIHtZRKJi91r6AaqkTMBuaUhRyJlGFamN5S4s4Pckil/SVsNWyBT6uDsej6eU7qKOeKcbSvL2o/cwWk0i1sU6k5iDNsfZpo2bJhl6sKrmUzG05rq+n1shqK7sacO+7VRFJnLNXpBShBqDlu3BA0VlYyzpDyux/HO8Zs2Ebs4mcWB3ihI6O9/nfhU2fMh5Aqj66Ps6LVnjB+p4qvkLmHq70p4qyV4bWOGV0Dsn49pASjiw6Fj8uLlXm+SMOlNmRdNSG5LiW7sSaIwIC/AE3skx0BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtaSRQje/61QFEo+OCF0czGhbjYKACZQ2Bz/+D04i+w=;
 b=GEB6pcS7dCxkGtvCRg+gLAHP1G5lyX0N9oqIK7rumoBveunZWWMGVOPBTVuxossiy1j+qsNuhaB29Y0UmMrD7fQ7mOqRwRPlaScF7lz5KJxRo5jkNObLxNd05jlZ1Eth9YRipMdMOMnUXgTuS0eXzCo6WxthmpbNY0CGUNqhLtUj3ck5OY0DENEdfhPGGrr2/RQZJcoIa+SeOp96P72Nkp8Ppm30pzzZ/kKfhwdjvGCnveigiL0e+y7wU7BnpaWnG1hElKEYMoEzZw5SwBpUi/FTgNoRfrKq7pqKG1T8TtsPlP0ByplbyArk5wqjyu3jazAjs9QrBWpa+5Fah+Y3IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtaSRQje/61QFEo+OCF0czGhbjYKACZQ2Bz/+D04i+w=;
 b=Do5Gpa9rb/84DdzHSxBRJ/voT6SoClJ3ATC3a/yKRxVo9s/MMGxT+gQN6CzhNfZLm+HqfnQbCJKmM7Hi0E4DF7gkcmiqBsp86yfmAwPwB/rd2wWnlxhp53ZvIxfd0zgBpWExyykr06tMbYIeCBHu0jYdGHpcvZKOWSFqf02NugY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by PAXPR02MB7326.eurprd02.prod.outlook.com (2603:10a6:102:1c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 06:03:53 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa%5]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 06:03:53 +0000
Message-ID: <fd20cad6-34f9-5f3c-abe7-cdf3a93d712c@axentia.se>
Date:   Tue, 2 May 2023 08:03:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v14 2/4] dt-bindings: i2c: Add Maxim MAX735x/MAX736x
 variants
Content-Language: sv-SE
To:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230501091552.847240-1-patrick.rudolph@9elements.com>
 <20230501091552.847240-3-patrick.rudolph@9elements.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230501091552.847240-3-patrick.rudolph@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0019.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::11) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|PAXPR02MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 3402a95b-17e0-4339-58d5-08db4ad301e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: THUhQP6sBIhUneR1kilYa2zkY5pMDNq+mXLui/kiqG50gNkllKiW3DNBlMiXsnEtaXYGr5SQevn3JENEcUB0loF0xSkACWSy9i/H8Xq0U5uCs37lWJWbtnkotloqWCyJ0dQIB2A7ZZzW83kklpyc/1YO/N1rXJiy9ghc3PbKm4XXsuoYbszvCSLL6ESn9VhrdRPBVjoG9xHBHhoHYTFriNpija38A/QEY/dRXX9AadlsJ/JdL+L3wbpxP9PpKhiIIuUc9jVq3CGMqtd33xYdMh3IpncZEAhj0GEOJRYLjL+mqytwr9ZCre4/B1B0Q3ssmJE4eUIB03f8mcPEM0NO2bbfUhrpRImyhHFZsS4FhhGCC8KqL22wgDuNQCFLU43t+/a39AfWCHaoHzcV0zNmWhpvBzd3V+bvDINbYbm2zNTqa7IhlJAfjUr4jg63fGwQr7l3dBHU5/i1D9q0M/6suQDFTLUr2tX+XmMWfabIC0QNKphrhApCu4TqhTqnRacR58B6zN9deLHx9GCa4oFk8F6l9zFKc5K5ef/X+shw9Bi2PjVVIYrEVkwq+C8yg07PLUyuZo8M6/mbs3WZXXLM6ULVz7AmwoJ/2KVXB9+ew/ZHHya7wqwlZJcrjPosyvlx+U91dbIvtmw7wUZN7CIX7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39830400003)(396003)(136003)(346002)(376002)(451199021)(2906002)(38100700002)(41300700001)(8676002)(8936002)(5660300002)(36756003)(86362001)(31696002)(6486002)(26005)(6506007)(6512007)(966005)(54906003)(478600001)(2616005)(83380400001)(186003)(31686004)(316002)(4326008)(66556008)(66476007)(110136005)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWxrZGxCTXRPeXdJY2J6MTlya1VlOXRWUEJCaVVHZGs1ejl4ak93Y21JalMx?=
 =?utf-8?B?SnRucGRGcy9ZT0ZVMm5za3VhbWEzd0RzZExKaVpMV0o1Rm9GYXpKUzFteHRs?=
 =?utf-8?B?cE0wVUhmejA5a28zWEx6aXJYTGhzZVFRNGp3NjFJMU91elBPam1tNjFHOXZC?=
 =?utf-8?B?VlF5djdPb3hVMDE5aGRTbmtIbHlvZ2p6aDRXWFRoQy9XVHc0cWFRVWJsM1V4?=
 =?utf-8?B?bmhoUEtaV3NiMndhVjducGlqMXQwNndkN0Y0RUlFUGNWRk9vTW1oWnozZ0Zj?=
 =?utf-8?B?NFFZUlNRUWlsd0g0dXJWWk8xblhBRUR4Q3hheXM4VmpZVklXbkZGdXg0NGxl?=
 =?utf-8?B?dEp3ek5EV255UTVlM1R4VTFpbHd6ekVuaUZqMUxKTXJSSWZENmthZWFTcVVk?=
 =?utf-8?B?OGJsWnNjeTE5WGgvYkg3clZ0Wjd4aXpmQ1hEL0JEZ2NSOE5VVUFtc21RVnNp?=
 =?utf-8?B?cXQybTNXMkhEdWhBdmk3ODQ1eCtmZUtlZTh3Mm00R2hJdG1KMGJkWjhCcEox?=
 =?utf-8?B?U2Y2OEZGQlV1OXFTbzJZVnoydjhaSUN0bTlwa3d6YlZ2KzlnMStVTXNyVWhL?=
 =?utf-8?B?MmZPdVA3MmNud2JpTG9KS3FCNVk2dTdaSlBkYkN2a1kvTGdDM2dLSVlwcEVm?=
 =?utf-8?B?QVl3K2ZxT3FGMzZWeG5SaGJnTm5OZW9ZeC9oR2VuSjlwRTVGNWo3cy9PZ29T?=
 =?utf-8?B?QmRVY1c0SFMrcSt1U1doRENTaTFabFQwemhWdHpVZXVveDJwemJxNDJvR1ht?=
 =?utf-8?B?QmZSbGpqMGk4aTJTNXp2UiszcEhGOFQyNjN6K2xMajl1RW1mblRIQjFBclVU?=
 =?utf-8?B?cU9tTlY5MHovR2F4YkxWTHpZYzdEZnkzR2tUL2orUmlGck9Bb002UHB0V2VI?=
 =?utf-8?B?cW5xSi93aUJLcFhaUHE1d29WaGhkemxLbVNxclFFbjMvT0FNT2d3aGhTdS8r?=
 =?utf-8?B?b1FRSjdBb2ZFWnVkMndPM0wrUG5DcSswZDlSaHJRTlp5YVZVVDM2Q2JTWVF4?=
 =?utf-8?B?Z1BrME5CRFYvK0kycGx5MnBMSGNxbGdZZlNlb2tBdlpFVlMwVHMrVnB1bHN4?=
 =?utf-8?B?cjhzYVVNaDdkSUNHK2I4QUpXQnNSRlJZRXp1a2g4bXpBSzNBd2dsZGxrSWho?=
 =?utf-8?B?VytLVmFySkhncnlFVi9ReFVCalR1SHRqWDg2K0srdFlEKzExQ0VyM0NYVjJh?=
 =?utf-8?B?OWtwei9NeHBTMVB2TUVFY3RrOEUwcmpSMFVnVWxCR05LR2dhWnlZbWFMVi83?=
 =?utf-8?B?QU1zdXdudGNvZFZpVlNoajlIeFdJVS9uZnhlekpCN1VvMEdDK1dqTjlRUE5O?=
 =?utf-8?B?eFhzcEtWTFYwcytzN0FZczJTd25zcHQ1SDM3RWZlVTRCQ2ZRYzV5MHFnWUNE?=
 =?utf-8?B?M01RU3lmRGxIc3NsTktQbzBFM2dJYjFwOFU5L1RNZ08zK0NnUkJtMDJXWlpT?=
 =?utf-8?B?aG5xOFhtWTJCakQ1VDh1YVR2Z294V3hYUm93cGV0M2tFblF1U2lZNEo3cWVV?=
 =?utf-8?B?bVVEVlA0QVdNR1dlOStMTHpUdk4wWVE4VGJPemZDOHpaWk5mVjJ0S3pveE9m?=
 =?utf-8?B?cHRHb0JpbGhEMVRYZnp5cmVrLzVmL0xlQzU3WmRSYWVkMkswVDROaU9lSHlS?=
 =?utf-8?B?WWRkdTJyZFUzdnEwMGtOcXZxelVGNlBuVnVJYUdWZmE2QUhtUWRDenZjVHNu?=
 =?utf-8?B?SkVHdVVIZVRrUDdpRHpvSTlaZkliQWJwa3dkRHFtYVBTOTFJNy82bkdHSlgx?=
 =?utf-8?B?L0Zva1pWTUtVcmRnbll0S285a1EyeGYwWWE2bW41ODFDWXU1eXVhUkxPZEUw?=
 =?utf-8?B?NlJEbXNDbGVMdkJFWVF0NlBaVDVIKzZZVjJCTjZUVnNvN2h5RlNPUURDWXpt?=
 =?utf-8?B?UGNRVmR6VEhLQ1lmdWd3ck14aW1nTUVvNkFyNVZzcG81Rng5eXJBNFJVWHV6?=
 =?utf-8?B?cUkzbTlIUU1CWW1qNmovbjVTZ1BTbTVITUk3MXlETjZHSG95UlNDbGZ3ZXdl?=
 =?utf-8?B?bmdhemF6T2JRMGVnZHVPUm9idlNVSlh0WmJJSXFXSytpcVRnQkluVS93MGc4?=
 =?utf-8?B?SEloZnQ4S2VxVkgrWEhLY2FTSXc0dWJ2QXI5V29CZnBkcktsb0VJNU5tZnpm?=
 =?utf-8?Q?YRknkPPq9nmVqVf61N/BzFvD7?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 3402a95b-17e0-4339-58d5-08db4ad301e9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 06:03:53.5262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEt1wUM6SsEc5FARFiGoXDf8obs4PIJwMoVnR+n8x60PtQrg6mP6W7OL7nlVg66J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7326
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-05-01 at 11:15, Patrick Rudolph wrote:
> Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
> chips. The functionality will be provided by the existing pca954x driver.
> 
> For chips that are powered off by default add a regulator called vdd-supply.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 22 +++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> index e5c1070903ef..6fed6eae9c9b 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> @@ -4,18 +4,29 @@
>  $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: NXP PCA954x I2C bus switch
> +title: NXP PCA954x I2C and compatible bus switches
>  
>  maintainers:
>    - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  
>  description:
> -  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
> +  The NXP PCA954x and compatible devices are I2C bus
> +  multiplexer/switches that share the same functionality
> +  and register layout.
> +  The devices usually have 4 or 8 child buses, which are
> +  attached to the parent bus by using the SMBus "Send Byte"
> +  command.
>  
>  properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - maxim,max7356
> +          - maxim,max7357
> +          - maxim,max7358
> +          - maxim,max7367
> +          - maxim,max7368
> +          - maxim,max7369
>            - nxp,pca9540
>            - nxp,pca9542
>            - nxp,pca9543
> @@ -56,6 +67,9 @@ properties:
>      description: if present, overrides i2c-mux-idle-disconnect
>      $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
>  
> +  vdd-supply:
> +    description: A voltage regulator supplying power to the chip.
> +

The pca9846-9 chips do not have one VDD, they have separate supplies for
"low level" (VDD1), and "core logic" (VDD2). I don't know how such a
situation is normally reflected in bindings, but could it not cause
headaches later if use of unqualified VDD is spreading for those chips?
Possibly with different semantics depending on if vdd-supply is tied to
VDD1, VDD2 or both?

Cheers,
Peter

>  required:
>    - compatible
>    - reg
> @@ -68,6 +82,8 @@ allOf:
>            compatible:
>              contains:
>                enum:
> +                - maxim,max7367
> +                - maxim,max7369
>                  - nxp,pca9542
>                  - nxp,pca9543
>                  - nxp,pca9544
> @@ -94,6 +110,8 @@ examples:
>              #size-cells = <0>;
>              reg = <0x74>;
>  
> +            vdd-supply = <&p3v3>;
> +
>              interrupt-parent = <&ipic>;
>              interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
>              interrupt-controller;
