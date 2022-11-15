Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2DE629851
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 13:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237837AbiKOMOh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 07:14:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237700AbiKOMOg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 07:14:36 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCF61EAF0;
        Tue, 15 Nov 2022 04:14:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mz5UQoWFI9jYQo/HPdTmEiOyejT1Jcuvr8iKAjYyHWj+t/5U5cJM/638FPKXmXCevKfWDX+M4xpDcgYb3yrUM5dyDz/EYiO2U+akQ02ZsSK3uNHOXQsNHeaJONedKF6QCt+elU57mh2t7+VCISr+O1F5BbBZoe1L+wInVC110Bt6DKivCSnbTSClq6Nzlzir0UNNEqkQkRMc89LPZwWodS1M2mPoqWkcSk8RDgioKdQHfjzzXDNam1u0XQzJxo9Bwj4cyGz8IigOWrFIGxUQGMQu+ao5EBSreeE8P3S/GbprOOs28Yz9BMYQjH1qMV+Z3a31m57biZD71cSbk3WlQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7lju3MOafITt9bLR37vsQ/X/JuaXAliLKqCeAQLruA=;
 b=eGS2fQVGRlr1Gm7UEi0qZwXzho7VUAyuYBSMUG6a+Zf+d4rNSG/gpj21+Q/CozO3nl3SJROv15KfvPX9WJBjoagw/gTw5quz+fTzJOE6AKY8I4wNvYtTgcUdKSoHiGK46hJ4fj0U1EoWkKr6/2PnpoZshwm9C0iysZKUMyyrPzKHgZk9Mc5Gpcd8JE1u4ER4XYfO4ZjTnOp8ttPlsEB5abph0SFMMHs1kRH1I875T0LOc49GVpJbgqJST71EhcvUdf6vGqlxULK0a4KGAvr/+2o9BQVtXy/UfkpatZjtfRBb9ut09ZKtB2Nkcwr1wUtmCvLE+q4zeiVdevPncwTV6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7lju3MOafITt9bLR37vsQ/X/JuaXAliLKqCeAQLruA=;
 b=oapZ5a4gs4RuexsskgmA596ZboVxlW2ttWgzHbwiNATjre3qVvEhmtJIgnXp4h+6uPpG4LBISM0XKOb/0Y7iJlGX/mkZaVmYp+bIoQcCEzM3UGgTr4x4DrTk3F+7294eg1iMPGWGhvwkgNJudvnAbGPmjT72U4CPXsghzvbco3xSr+UcOG1aLgixTOcz3hMmKwNuRmgassMgzGHsg7WyiIgh3+GAiGSqY41iMkKu4DIsGVk1oyAGn0Jy2kjvnfOJDoSgRpjg4dN/PLKruxEY6QwZVYpKnUBGImSB+MRs/F0tKTgg5TD3fSl0y+aMZGuqzDPDZkYduP91A2DHsPlv0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SJ0PR12MB7082.namprd12.prod.outlook.com (2603:10b6:a03:4ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 12:14:29 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 12:14:29 +0000
Message-ID: <49345de8-319c-ce75-fd35-3d9cc673d988@nvidia.com>
Date:   Tue, 15 Nov 2022 12:14:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 01/13] dt-bindings: usb: tegra-xudc: Add Tegra234 XUSB
 controller support
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
 <20221114124053.1873316-2-waynec@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221114124053.1873316-2-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::10) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SJ0PR12MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: acb4fdd7-38e3-40e5-3c88-08dac702f214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: juDKQrJvNTVs1VH+eQyTI17530RM/uIpbGCXzhFdY2htyakkbcKcGi2UoWalw1WymN9jW1JO+nu4HIjXAP20A4ToXA20bPKU3x+PVmc1EXHyt4yBqVcJiYpW89E+hSW+cdZNT5bQMhk6KiWbSwtU2Qm9Szmpk/g2ngwe5/5LDiY2vFiLg7ABO4I1OrhBl2HpENp64uZ/NwHN4fHo1ff/qvSMb2eNclihguQDcgb9br4mm4PNk9GS/zDrzpWIcwSbBXvEp3bFhOmIEKSAeAKUBdzwCuQu4FRh1Mhn/cevo7Xo7tWoXgBUP6XVz+5WfMwUGIBrrWg0dDanSzXRj0wXo1UsUp1DCUV0n42DmGem+IQjn8XdnAoKRM+OxYLhRKNGvKHSyjWSfIgXVDL2UymBnwb1GXiqfN5VxIWwOvq3m8svUPP0zjURjhXMDgwukVxJYhkEGdIWQ9eMOCGJip8PU3Zce2Item3+n2NKLteLB2RmfNObpZKo73k+YBVd11JZhtQRn/DjOyo/JaumBMnnOeas2yy99QMoEbZAjP7lrj/jDC32ol29S6q+2rHIkvriuonJEHUsOhnn8EVrcBnvP5tW06+yrxECYHim35UOp/RSHYdwGsHRmiBfRFCNd1Qb1bYKKR4Kh/n7J868Wkrjw4NrZh4AXkToTUkJVXVPiDBwTnOvbEupw1lr5evjn0312eppERs7X3wdk4UQxEomvOdm4yV1g4ETi7XLNQMBqGi+wTVtcSlpdNIqgPvA582E9rWDUXGivgI20C0my7WQEX600cN5UwY1RF3QqVSMDnrywPGmy3VgfKfbbVPrMx10
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199015)(4326008)(26005)(66476007)(6512007)(66946007)(36756003)(41300700001)(5660300002)(7416002)(186003)(2616005)(8936002)(8676002)(66556008)(316002)(55236004)(31696002)(86362001)(38100700002)(53546011)(83380400001)(2906002)(921005)(6666004)(31686004)(6636002)(6506007)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVFteW5PaGVqa3NRUEJzdG1TRUx4SUczcG9JallCUUoyMFYxcGhENXMvZTIx?=
 =?utf-8?B?NkRFejBqL04xcS9YVi91SVdiQVhHQThxbGdwZmxCN093U3JVc2h0bW42S1VZ?=
 =?utf-8?B?MTNNM1lYVGVnOU1HK3lCaDR2eXUveWd2ZzJzcVVMTVlNaGo4d1pEbmR0bjhw?=
 =?utf-8?B?ZHNLTzM2SnVCTmxpZy9MOUJlM1EydGZ3Zis3YnRoTlBta3RDRGZXVngwNWtH?=
 =?utf-8?B?TUI0dmZ2VTg4d3dlUUs3dU5LYXcvanRvUHlKNjdLemZmbjB2QzVrN1UraWlw?=
 =?utf-8?B?b3U0OEhRK0V2Tm51U0ZhTzBsWmNJU0RKR0RoOXIwdVluT3J5dlovbTUvc2dT?=
 =?utf-8?B?Y1JNWnJPOEpyNmR3eWhISHI5SlZrUHI4Wi83VjFJbjB2aFhFUTZHdkhtZS8z?=
 =?utf-8?B?OW12TXhTYlVrcEswUy9FRnpmVUt0aVlpdm1zc200dHZ6S25mMk1ka095dXR6?=
 =?utf-8?B?TTh2QWNuMndJQlpqUnJwMGpGUVphTnB2dUJzamxqN2tUYTI5SHFqQklwOTRI?=
 =?utf-8?B?MFRZbWJoUHBmODEzeVlyWEl5TFAwR1VRSEhSRk5aN2hkT1hKeTZBek9OY3dE?=
 =?utf-8?B?VVl3N0h5ejMrUTkwdzdyUlZJRUdPQlBlaUwyOVNvNW5SVnk5Nys3c0xtbDlj?=
 =?utf-8?B?dE9BWlZWdm53RE8xTVNNa0plbWY3YVg0TjZkV0hlRnp2a2tYbjdMY1JEYVFh?=
 =?utf-8?B?OEg0aFV4b00vNG1PclB1UlFFYTkzc083UTBOUVFhMWJFV0ZsSlZvL2t6TmtW?=
 =?utf-8?B?dGw0aTgvR3dNbVBoc1dmdGluR05iY2RVMHFSSDlRZVJKQmdwRjNmaUx6M3BX?=
 =?utf-8?B?clA1aEZHdnk1emlCeUJEeXl5MmVYVWcxMkljSUdYS2RlaGdCOWlzL1VLVnI3?=
 =?utf-8?B?b04vb0dNU3lLQWtEMFpCVnlYUDRtWmRTUlZlblIzQSsrSVJ4enBSQ1hTZ1NT?=
 =?utf-8?B?ZVRhUG45NmNRVGFaS2JQRlVTRjhic2pqWi9VMWJGUnFVVDhoWmdDWHVJTzdY?=
 =?utf-8?B?aU1TQVZKU1JOblNPTHZoSHhIRk01bVhTNHM5cWs4OUhhMWNJMHBnZWluZE5w?=
 =?utf-8?B?MDhadkZESXFkNXNSd1pVNHMyQ2ZhSmw5RTdGakM2bUQ3NDc0bS95ZnRZU09l?=
 =?utf-8?B?SlNpQml6VXpMNFdwRGVFVTdmNlYxWkQvRFBvL2ZkUVVock1vV1pGckRpTmZm?=
 =?utf-8?B?c1BiM0crNXlQYXFGWCtEL0pKaS91VjAxY1lDRStZNHVIUzdiVDdCeUlWQVF1?=
 =?utf-8?B?bVNmTDFCMlIrdnJtWmlaUHNVbHFoSitISkYwMFpHeGxsRloza3cvT1NySmRP?=
 =?utf-8?B?SjFWdytyeEtkUmNuVjR6YkJxUnRjbjN2K2c5S2FxNXdvQ2lHd1EwVS80NHhG?=
 =?utf-8?B?UHdaV3FOb2M5MHNlaDZNNHFRMUlhV2RMdTZ3S1FjT1BjbGdKNE94VnpPMDNF?=
 =?utf-8?B?cnVzTnYrVXYzRlJjdnBsQlBCWnJMRktDeDRGZjJaWXNrRWhzVU54azZiY1NY?=
 =?utf-8?B?S0szTTVBek41Qm9uSzN4bCtlbVFZN1BzZXNYd3R2VmdwM3cxMUNpbWpMUWU1?=
 =?utf-8?B?MkNJUit3Vm9kWjhGclRnTlYzeUQ3WGZDUExxdGdFUEdsekJPVDBhRlFkZ0Nt?=
 =?utf-8?B?WUlZL2grZ0lyem1kWDJtQ3pzeFVpanIxalAzYmpQY0M4YmIvWVdRT3R2cjhu?=
 =?utf-8?B?ajBqd0xhZFpSMlJNMHdCK2h0M0FtaHpuZ2pTZ1I0YVR0Mk9UbjNBRlg3c2lt?=
 =?utf-8?B?WXpxK29LYXdlS0E2S1piL3VpaTNQZ3VRaVpBM0NZVnBtYW85elowU3daOURa?=
 =?utf-8?B?TTNKOFp1T3BRbFk5WkpwbGZmK1V2dlNFMUxZc1UzRFlsZGRlMThIeWExU3E4?=
 =?utf-8?B?VUt2NlI5c1lnbXlOTE5QYnRGZ1MyQm1HNEQweDNzWjk2U3JvWVNjU2tnendu?=
 =?utf-8?B?bzVqUVVLd2hTYVVRL1RXN2pDY3dEa3RtcnZmWUd6Q1pEb0hRdGxsRFllanNI?=
 =?utf-8?B?cWtabmFuaE95dFRRNVEycmx2YytOZHB6dE5rQ3ZucUdxWGRhbWVhUzlFb2Fm?=
 =?utf-8?B?ME9mUU00eVN6SmNoUUNhNzFSTGlESzBmRkQ1NjNtbkNEVkVDNlJ3bFBEbzYr?=
 =?utf-8?B?a3dlV091Y2ZSOVNoc0s1aWR3TWZmNzZ0NWNHd0JFMVVObks3R0lXT3BOOVBV?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb4fdd7-38e3-40e5-3c88-08dac702f214
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 12:14:29.4589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Vb1qADWLw3kfOrOkjg5TBOD7VVd6TMEGHEs6Y04YSc1Z9DkE316DCW0sBGjE0zOjn816d3kerGtw5m3AlQsgA==
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
> Extend the Tegra XUSB controller device tree binding with Tegra234
> support.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> V2 -> V3:nothing has changed
> V1 -> V2:address the issue on phy-names property
>   .../bindings/usb/nvidia,tegra-xudc.yaml       | 24 ++++++++++++-------
>   1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> index fd6e7c81426e..52488a731c4e 100644
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> @@ -22,6 +22,7 @@ properties:
>             - nvidia,tegra210-xudc # For Tegra210
>             - nvidia,tegra186-xudc # For Tegra186
>             - nvidia,tegra194-xudc # For Tegra194
> +          - nvidia,tegra234-xudc # For Tegra234
>   
>     reg:
>       minItems: 2
> @@ -90,21 +91,27 @@ properties:
>   
>     phys:
>       minItems: 1
> +    maxItems: 8
>       description:
>         Must contain an entry for each entry in phy-names.
>         See ../phy/phy-bindings.txt for details.
>   
>     phy-names:
>       minItems: 1
> +    maxItems: 8
>       items:
> -      - const: usb2-0
> -      - const: usb2-1
> -      - const: usb2-2
> -      - const: usb2-3
> -      - const: usb3-0
> -      - const: usb3-1
> -      - const: usb3-2
> -      - const: usb3-3
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
> +  dma-coherent:
> +    type: boolean
>   
>     avddio-usb-supply:
>       description: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
> @@ -153,6 +160,7 @@ allOf:
>               enum:
>                 - nvidia,tegra186-xudc
>                 - nvidia,tegra194-xudc
> +              - nvidia,tegra234-xudc
>       then:
>         properties:
>           reg:


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
