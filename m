Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF25E629857
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 13:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238205AbiKOMOx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 07:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237997AbiKOMOs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 07:14:48 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9016C205D9;
        Tue, 15 Nov 2022 04:14:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqM3UkOPEubodxzBqEgwVoMs5dhQ4HmhaIqwoYAAre6pQXMZ3vDXriJf2S7CI0nb/UzRXsvutd+hEDOWA/jI3glVTlCygIOBQpQC+X7HmGj+T/p+Q0vGEUjHUDcEl6xSczDnHLIPn183je0Skmpa2AZMhQSHLJyU5uK2HUBvhDtCEMY81TSsISyAW37Qg28tXRzU5449TwlREj5ZDyynr0yWtw6y2nGjoePSJDj41xzFFQAPpVrRlY4d1m8qdefDYHqsiu6eXKCwKMgQ7LXst5VBgDx/cwfeXq+B6+uNbASypaEOASCQrySIywca7ROmGsYw/IMLQPikiENB6qC9fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6mU3ntSPMn6efZl1jtfA3UYfTEOIvnahRFmGDGydV8=;
 b=QAGMmaPSqrun/DyLUcc33YOqKGNyDr3HzvzENze7nPjn5alpig3J52x0UTZSCnOWKTck1ARF6CLWihXYoaQpyvLvxbvB994dSv3l6QSkyJNOGg4hfRpOAtw/X591hU/JwnmGmxMRc1JUmzjl9tkgYjzFJFnu27heScAmsyYle7m7nUW1oIcfQUP6dIiBafkncMbw6lRbGkq4llwylDW4RwkdfyJqqpPzhHUxvZsapERmR4jNK86rOT7tfs5pkkSqjLs1JzFzSqq9L8KHom8jyFGK1DKP79NeFQeK0i1wCIcfNFObpqQw/Nqj6kHoyhcGvo8vH5brUDcwDBQQrQpoiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6mU3ntSPMn6efZl1jtfA3UYfTEOIvnahRFmGDGydV8=;
 b=YG8QGlaupdnerVahPiBzqImLTGDZOGLYlTecqIT9KZ+ADUza2CA86R8slOS5W1Ts/q2Orb3/kmlN/Ya+fsidF4WUwnqsRi3ZYYFoZjQqdZZV7ApJrSyNUj8vhFvQWNIXqGy2IqJUVa5r8Sq0G0+YMRMMaKtQfvJu2xsa+Lb7+9jtI+Cr2jImFSEjVNHIgLsrmiwwyy6kM53kQm1IkPF3qFI933N+8NmWuUrOsDHLi6wgwfkWbFDae7Jx/MXX76NwX/tKFUA+gcgZghFtTNRc/BXQsJMAYtCbi2MRIDIIdUWY7wSsBXoFzeQaB+Ai/n1hRlvPKWHgxBWgPDSm0T9gRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SJ0PR12MB7082.namprd12.prod.outlook.com (2603:10b6:a03:4ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 12:14:44 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 12:14:44 +0000
Message-ID: <d483d5b2-4222-438f-63ec-1921c87b224a@nvidia.com>
Date:   Tue, 15 Nov 2022 12:14:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 02/13] dt-bindings: usb: Add NVIDIA Tegra234 XUSB host
 controller binding
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
 <20221114124053.1873316-3-waynec@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221114124053.1873316-3-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::14) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SJ0PR12MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 0496d4e1-b81b-4bf6-b102-08dac702faa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eN7uq1+znJSXPTOUEwIfEBWVANme6gKA7hOEQMTy+AFVCkedm69+3762MPVMAvNL725wtF0TaNe+Y8s0igk4TqFwwmbvZ5814XB/bexaVMDHOkq0Kg8lj8/YSdZISTMz5PI3PuV1Q8AihlmgrbH2cv9pdKPKZbXLJj0yymMt/eS6RyBYcRmtX7lEvAAKovYEGVf1rc3v/g4ls6rPXMFKWcsjX1FwWmp7jcthsFQQh1jKg0X6VOnN31eWap8iN+OnbeMQijh97GPH9BVI+by7LHT/2IfaobjQxiSVJ1MHZPKU4R10TZbpma2JEMJQnZikV8kvr6FbZ1EzjTrh8jH6mvIt75NRGr+IIvFfiDMwkFlLLbm1/2Uctaz81Lmi2gXFcztyzKwekQYh6LvxIaAqIdQoDOZX68qElktljBv647QkQ0sAki9SuDtizw/nyGuln+sN+hLbxiWMHk7uFPpuISInh1QOfXgJ5XevpOnsjCMpDTmtXr01odO8FguIrbRjGyKl2bkiQZ2uV8Zs0cNuowGOuq6mDdqeITg7N1Hmr+DIsu3eD3MJulU3Ao/4UNAUZItAHlsD8iz0FoHRb45kNclB/3qcI4vS7j8JR5vad+k+7aU9e9gY7iZvJrqIYTWWb+xeFpBNfpD1GNkbPqgphIk8VdP6nFaCvntKsIqCEJ8NJm70aVwJs097TD6VURANMzIRXwtGpQHoH6Dhxq2a1scwI4t9Bzyg9JxR7gS6g66OWPQJGWk+fbqIEoyIeOerG6rXthfi+d+T7NsKXnE9zq2AZYqlTan76zq5VqY1+GdCMs2WQr8Iaf4EqQPQtsypBnvbwNdR/+Jc071aItbPe6WAzKdOTv+6ykU+CAgh2jKmY23eW4Zlu9D5C1ys2itee18rh1dNf8gUXLNEIb4XQYZaHb7HySqRWgig6lp22A3eHq9eLGKf146WFmATulWH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199015)(4326008)(26005)(66476007)(6512007)(66946007)(36756003)(41300700001)(5660300002)(7416002)(186003)(2616005)(8936002)(8676002)(66556008)(316002)(55236004)(31696002)(86362001)(38100700002)(53546011)(83380400001)(2906002)(921005)(6666004)(31686004)(6636002)(6506007)(966005)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzRLMTVxRmd1WTBNbG9pRU5xSW0rVUtyWUNrdW92WjBHNVhXNm14Q0ptSFQx?=
 =?utf-8?B?MU1HdVBVQ21uTU1ZR2hFNXJVSG9ZTVJyS1R4UWgyZE5KVFkwNlIxaGlEdmZp?=
 =?utf-8?B?UHVJcndYTlYvazVRdzdwQ2tLY3E4YnlpSzRITW5sZXZ0OE9QeTRyRnFkTHVn?=
 =?utf-8?B?UmNoZnpoZWgwU1ZHTEpycVZPKzY5ckd5Z2g3QWVDeXFWMk5CczFYOXhYaWtI?=
 =?utf-8?B?QW5Ccmg4aG04MVU3VEFpM1NmMWFBRkt2MFNRWWhsSXJGejNxRG9NUnVSOGpQ?=
 =?utf-8?B?TEJIdW9qWkQ5VEZDS2lkMS9uYU1kN3IxMHNBOEhHalN6THRzVVQwWlQvMDJo?=
 =?utf-8?B?Mi9MeVp0Qkx1UVQ4eHZubXJCaUJqeDllL0NYdnViOXNneVJMN1NGL2pyRk1p?=
 =?utf-8?B?UnJWSVoydU04bG1LUzJxTFZKcEMzTnZ0YjVteWlYY0VwN1ZpSlQvM0VWTGhT?=
 =?utf-8?B?ZmVJS3R6VnVHVXZkNXRrM2hGMXBPVGhoU1hGQmpmaEtqS3FPaUZwTHhlOW1H?=
 =?utf-8?B?UWUwTjJQbUNmanNKcG4yb2pVU054YkdOd3ZMQWorYmlmY1ZXWXZTTmpySlFh?=
 =?utf-8?B?TEpPSzdkUnhrdTd2ZUNiVWdLZUhmUWRSWHRhMFlxUlNnKzZVMEdsajhyYjZY?=
 =?utf-8?B?MDJGZVkyQnpYRjAwaVluSExnNmxYdzYrdVNGb3BiSmsxT2Y2c3NoY25jZHlo?=
 =?utf-8?B?RmdKODNaMTh4b2RCaXQwV1dSZTZIYXM3TjdGWFdNN253MTFmL3VWclVpTEJJ?=
 =?utf-8?B?MmthT05NMTZWSjI1eE0rNU9GbWs0d0FpWGJCY2NiWCtBcU5YUUoycU5iN0VB?=
 =?utf-8?B?YmN4dlRJYllSSHkyV2djYVVuaGw4QjJrL1NOTFlZVzI0WG1WaEVBbWtlbU9h?=
 =?utf-8?B?RGdOUzVFdUMwOUZvMTZ4cmExNVAzY3NyN2VMQVdMYjBlWVJMSVlRTm12NXBI?=
 =?utf-8?B?STRZTC9ObUsxR2h5d2JxWDhpaTl5R0haTWNRNmhyVFQxZW9ZZ1N5Y3NjcEZR?=
 =?utf-8?B?dlJUbnlWK2huMTZ3UkNWNjhGZVAvcmU3SktPa2NmbXBqbjNyWDRtd0c4SXA2?=
 =?utf-8?B?eXVsbERBM3g4UU1TNlhCWHoySWt4c082N0tFVzg1VXJOMWJZcUZSdzFWb0R2?=
 =?utf-8?B?NXJWb2pIeFo0aGthK04vcXFhSVNSUE54dko2cDN6ajZWQXY2Z2VoeDMweVVQ?=
 =?utf-8?B?YTF3SzI3Q2hKOUlKWnFVZEpzWFlMVlY2cUFYcE0xRGFyL0JLV0hiek9Qd3NB?=
 =?utf-8?B?ZEUwSkN4eEx5V1p1NUIzeEF2YTVTQVlia1I2RUhHS3ZtNGVIZlFhb1p1ZEV3?=
 =?utf-8?B?czg1NER6VUY2SlFKWkpMY0lKZ3p3NkJWWkpTMU1EUTg4aTRQQnExUUZxZ3Qw?=
 =?utf-8?B?Y1MwWUtTMkI4Z0lBT2ZEbmFwNmVSSGhQaGdzTjFnWlNZemxPVE85QlR3Ulo2?=
 =?utf-8?B?ZlhrU1o2eHFqTmRIR1Q5dUExVE1wL1pOSXpSQWRqa2QwcWl5bG9KZ1prSEFO?=
 =?utf-8?B?eDJNY1ZPQU82b1pENmJacFdsSWR3TDkyRDZSVGp1SkJtMnk5aVp1YXFMSW4z?=
 =?utf-8?B?eWVsZDM0eTZGRnlEZWU2Ly9mcnYwWXdxaGdna2pBeTlIYTF4RnVBcVU0VWIv?=
 =?utf-8?B?VlFRK0xpeTBMQzhCUVg4T2NRbkVoRTBRbzJoZzg1bUFidWZCdmtPbkxPMzN4?=
 =?utf-8?B?dWEySHF4MEZVSnZMM1VwOFl5TW1FVk05dnI4Mjlna0YrZnFJOEFPVE93Y05q?=
 =?utf-8?B?NkdHcnlKWkI4TWlDb3BCOGZRM0FmRW5ZUGZCbmRmUjNCWDBvT3lJbEw0SXQx?=
 =?utf-8?B?OWt2aG1xT2krUjVsTTdnNW5FNjQ3QW9wRy9tajVndnFSSk5xOXFlWklrK29W?=
 =?utf-8?B?blNoUWJoUkhodk5XTXIrcUhaVllpaTlVZ0xtK1JXOXd1dWJub2lrQ0h2alpx?=
 =?utf-8?B?TzNwUXNta1V6K0U0L1hSU2JHaXZpS1ZiWXVpcnplQjFSc0tNcjBaSnFwRG5L?=
 =?utf-8?B?ekhKUlErUmovRHp0OXNkK056dmZ2SlEzTlF3K0dwSUI2SThQcTJVTUR0aUU3?=
 =?utf-8?B?OFA1aExZbHB0Q0lsZVhiTVpJL3lQZXdrYTBoYVBIaTVJWXgvZ3RlOGhsOUV3?=
 =?utf-8?B?d25mYmM5MjBudkhRSmFkWFcreTluNHU1UTNNSXhTY28xSGdyTDRMWGU4K3Bu?=
 =?utf-8?B?MkE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0496d4e1-b81b-4bf6-b102-08dac702faa8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 12:14:43.8223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKxQIvymvwlft5Le+OrixWitmT691DPQ6MAC4iAze8+fqg0qKMkxhr0towXc9hxa1DS/bwPdQHOxP0H/Uw9+Aw==
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
> Add device-tree binding documentation for the XUSB host controller present
> on Tegra234 SoC. This controller supports the USB 3.1 specification.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> depends on the following change
> https://lore.kernel.org/all/20221003125141.123759-1-jonathanh@nvidia.com/
> V2 -> V3:nothing has changed but added the dependency here
> V1 -> V2:new change for adding nvidia,tegra234-xusb.yaml
>   .../bindings/usb/nvidia,tegra234-xusb.yaml    | 159 ++++++++++++++++++
>   1 file changed, 159 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> new file mode 100644
> index 000000000000..d78ee88ed208
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> @@ -0,0 +1,159 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/nvidia,tegra234-xusb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra234 xHCI controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description: The Tegra xHCI controller supports both USB2 and USB3 interfaces
> +  exposed by the Tegra XUSB pad controller.
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra234-xusb
> +
> +  reg:
> +    items:
> +      - description: base and length of the xHCI host registers
> +      - description: base and length of the XUSB FPCI registers
> +      - description: base and length of the XUSB bar2 registers
> +
> +  reg-names:
> +    items:
> +      - const: hcd
> +      - const: fpci
> +      - const: bar2
> +
> +  interrupts:
> +    items:
> +      - description: xHCI host interrupt
> +      - description: mailbox interrupt
> +
> +  clocks:
> +    items:
> +      - description: XUSB host clock
> +      - description: XUSB Falcon source clock
> +      - description: XUSB SuperSpeed clock
> +      - description: XUSB SuperSpeed source clock
> +      - description: XUSB HighSpeed clock source
> +      - description: XUSB FullSpeed clock source
> +      - description: USB PLL
> +      - description: reference clock
> +      - description: I/O PLL
> +
> +  clock-names:
> +    items:
> +      - const: xusb_host
> +      - const: xusb_falcon_src
> +      - const: xusb_ss
> +      - const: xusb_ss_src
> +      - const: xusb_hs_src
> +      - const: xusb_fs_src
> +      - const: pll_u_480m
> +      - const: clk_m
> +      - const: pll_e
> +
> +  interconnects:
> +    items:
> +      - description: read client
> +      - description: write client
> +
> +  interconnect-names:
> +    items:
> +      - const: dma-mem # read
> +      - const: write
> +
> +  iommus:
> +    maxItems: 1
> +
> +  nvidia,xusb-padctl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the XUSB pad controller that is used to configure
> +      the USB pads used by the XHCI controller
> +
> +  phys:
> +    minItems: 1
> +    maxItems: 8
> +
> +  phy-names:
> +    minItems: 1
> +    maxItems: 8
> +    items:
> +      enum:
> +        - usb2-0
> +        - usb2-1
> +        - usb2-2
> +        - usb2-3
> +        - usb3-0
> +        - usb3-1
> +        - usb3-2
> +        - usb3-3
> +
> +  power-domains:
> +    items:
> +      - description: XUSBC power domain
> +      - description: XUSBA power domain
> +
> +  power-domain-names:
> +    items:
> +      - const: xusb_host
> +      - const: xusb_ss
> +
> +  dma-coherent:
> +    type: boolean
> +
> +allOf:
> +  - $ref: usb-xhci.yaml
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/tegra234-gpio.h>
> +    #include <dt-bindings/clock/tegra234-clock.h>
> +    #include <dt-bindings/memory/tegra234-mc.h>
> +    #include <dt-bindings/power/tegra234-powergate.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    usb@3610000 {
> +      compatible = "nvidia,tegra234-xusb";
> +      reg = <0x03610000 0x40000>,
> +            <0x03600000 0x10000>,
> +            <0x03650000 0x10000>;
> +      reg-names = "hcd", "fpci", "bar2";
> +
> +      interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +             <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      clocks = <&bpmp TEGRA234_CLK_XUSB_CORE_HOST>,
> +         <&bpmp TEGRA234_CLK_XUSB_FALCON>,
> +         <&bpmp TEGRA234_CLK_XUSB_CORE_SS>,
> +         <&bpmp TEGRA234_CLK_XUSB_SS>,
> +         <&bpmp TEGRA234_CLK_CLK_M>,
> +         <&bpmp TEGRA234_CLK_XUSB_FS>,
> +         <&bpmp TEGRA234_CLK_UTMIP_PLL>,
> +         <&bpmp TEGRA234_CLK_CLK_M>,
> +         <&bpmp TEGRA234_CLK_PLLE>;
> +      clock-names = "xusb_host", "xusb_falcon_src",
> +              "xusb_ss", "xusb_ss_src", "xusb_hs_src",
> +              "xusb_fs_src", "pll_u_480m", "clk_m",
> +              "pll_e";
> +      interconnects = <&mc TEGRA234_MEMORY_CLIENT_XUSB_HOSTR &emc>,
> +          <&mc TEGRA234_MEMORY_CLIENT_XUSB_HOSTW &emc>;
> +      interconnect-names = "dma-mem", "write";
> +      iommus = <&smmu_niso1 TEGRA234_SID_XUSB_HOST>;
> +
> +      power-domains = <&bpmp TEGRA234_POWER_DOMAIN_XUSBC>,
> +          <&bpmp TEGRA234_POWER_DOMAIN_XUSBA>;
> +      power-domain-names = "xusb_host", "xusb_ss";
> +
> +      nvidia,xusb-padctl = <&xusb_padctl>;
> +
> +      phys =  <&pad_lanes_usb2_0>;
> +      phy-names = "usb2-0";
> +
> +    };

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
