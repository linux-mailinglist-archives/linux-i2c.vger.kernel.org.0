Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7481162DA33
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Nov 2022 13:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239957AbiKQMFz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Nov 2022 07:05:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239946AbiKQMFx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Nov 2022 07:05:53 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B16286F364;
        Thu, 17 Nov 2022 04:05:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDkUbjWozQadxuy4bU6hH7/AgHUyA7scbwi3B03eC8H/KDVqi6Sfdinqu5zGqrHpbHiZzHPRGKaZtFPRafk+kW7sbLO1T+7v6Eo6VVpGRHzauakCznLJ0PjltHaIa07opJZgwMn852vRQ1HjIls3Vb9nqNbj+FtC0X8PFQ1FID7aTpTfuiELhKmMx5eOgtti/+XrHfjRrpg+7X5c2T32oe7vOy1/rE90WK7FH2nayVbEYpnQy2vjO2ejtEybaZ0m5Q4uI+Y8tGe0quGTe9/Jgfzcvwnvf2XDMJ44T2GZEGQ5Z5TKWx/zWin+DEDinTtJZtDBx7NnMdlnYgIqEKhTuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwyxV/ywe6ZUVDEIZqBSL0IpA/xHtNTfken4mEitj1I=;
 b=IjYK7ZD7kg1AdBIo+vugvBtakPAAhAaWQ/YgRL7y2nkteHR+GDJf5RRTtt/PZNYEYdwbQD/R/lVbVsZmzTaeievAt8Y4Fy1xzPJJEIs56zRzmGkrVx5HL0Ep42qQcFMZMtpqmGjvATOx4S2GaO7qNDo1Q6ILEcxL695RQBXaYk/az5/SomL/LmNvfuTI2XTe6+VyHe/TZ3N0roZA6utQs9WDi5rgOZrncoc+BZEq64rKmBJ+pDVYMEyKjqbL2F+ZyQ6zq45qnl7pxuYPj6hQOXTk/TfBjbEmyXgdRuUDXWYDHsXzNYmP2kBloUR9xmmHK+RSRahXFg8ixiBvsOE1Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwyxV/ywe6ZUVDEIZqBSL0IpA/xHtNTfken4mEitj1I=;
 b=lCa++glLbzuuckxxReZlbYlwW3WrP0V4xK8JKCEHY9jlGRVwpz5anCn45xlneuvps1cb7+KWJrBAEO2cXnHS+vzV6LnLx82i31d33RwZDZyH+F9qCYPw6uxdWxsRu/e8UMy1XvoXQf1IdNaR/WEiXPu87invrYkIYdhn43gL2trST6643KMDSDwzd2ze01yo/HhuZ4Da/uWKHsVQXL7/szDBFFccxFo9iYmRITgab6+8PNnkZcw4hQWtwT5nOZ1fyO5tqOsuamIqKZ6XWUv/wJmYJQsx4xRG6b3hHj9j+FKHXr1k45flcUww8Fdcmqv+blDOReJbxYBXT9hyk565+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CH0PR12MB5204.namprd12.prod.outlook.com (2603:10b6:610:bb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Thu, 17 Nov 2022 12:05:45 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 12:05:45 +0000
Message-ID: <8d1d3ef9-2fee-12ab-3297-680ec9df5a40@nvidia.com>
Date:   Thu, 17 Nov 2022 12:05:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 01/13] dt-bindings: usb: tegra-xudc: Add Tegra234 XUSB
 controller support
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Wayne Chang <waynec@nvidia.com>
Cc:     gregkh@linuxfoundation.org, krzysztof.kozlowski+dt@linaro.org,
        treding@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
References: <20221114124053.1873316-1-waynec@nvidia.com>
 <20221114124053.1873316-2-waynec@nvidia.com>
 <20221116210501.GA877429-robh@kernel.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221116210501.GA877429-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0325.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::6) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CH0PR12MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c23000-a318-4495-9e65-08dac8940e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: McnUyBlRlW6k9Z7aDVT6vbCOn6aMiKrbWKCOpJtl3ditRIcOgxL/fByVrbPsblh2At0ncu8Jzzxgrtv0Gd4yKe5+Zl+e27r4yvkJcnAwUIDl0MlG00X/Up/z/DNmfk+kmoZgiA9kVw5HlEfgXfAe3Q5ttyOaJRORBAM33y7bw4DDt2uf8ZxwH/CRn+DFwPFOYa2cwZuN90umfTXTVZKHFcXc1cYZD3FYjh9MSKnL/sMZXtJszK8xSWdZr/x5hhApOc8q5Ki/HAmeuF59AMuMqycoKvZZ7j+hXljuiATnn8ZUijHWHa77p1RpsrB9fjgvGOC67RKyJqFiGGZp6FY6gqstMbTQlB3Ss7BFs0jEBTAPJh+SrtXval8uGt5RFA+vyQ6DIM/Ssj8mNvlJ8/5zzSu/p0J6fncuzJXDopiWYhALFGiZPK9YQCxynp8JLtcOsu2QGtbI7yGnjICUuKnGmAzP3VbDp6eoh6ktFzLE2biSGQ2VR/HrISdao7RFRt0yk2EXjwl8fGIA6kZRT5z3CQWVvSe6/Asmb7EeMU++xkARRnJwONDeuNqwflnJ9R6qhkVpqr2MxbLeM7aXB55FR11sgPxb746WjmUmrod4xo03VRTOWv1lNaDJVFhI4zMez3pG6bju6Nc6N9bkiv5j9mwQcxLN+SJcMLtSbk9F/ltMUqDZoDRc2U1VsibIPqPIA01xdM+rTsmRMUk5cgGbcxDjhtjfsWc3RCHj2yKjKTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(451199015)(26005)(31686004)(6636002)(478600001)(53546011)(6512007)(6666004)(55236004)(6506007)(6486002)(86362001)(31696002)(2616005)(316002)(110136005)(186003)(8936002)(7416002)(2906002)(66556008)(66946007)(66476007)(36756003)(38100700002)(5660300002)(83380400001)(41300700001)(66899015)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGVGQXRxVXZRT0RwVDlzRWlENjhuS1hEN3dGLytwZVhBQ25xV052YkVOaDJp?=
 =?utf-8?B?dTc0S1dMMWlYblJKL3hZdHBWcnAyZkdFcUpXYlJwWDJHS2xhQ2ViaEY5c05R?=
 =?utf-8?B?UlpqQWNVRnZaWThLUlRjVERIOTRjRlRwMG1UUW1mOTE3eHpJT1lHMXFRd2hW?=
 =?utf-8?B?c2kzN2ZzYVp2M2VZSGJzMU4yZ3NndEpwYk5KRStxYjA0bi84bkdVOGFKa0px?=
 =?utf-8?B?d3BGOWJHK0tSRlc1QUJvenRPdkZNNEJlTnpmVFZxYzlzaTJYazh6UVY1NWtR?=
 =?utf-8?B?YlZjT1gxekNXMExNRFJvd2w0Um4wMWF6eHlCYVBYU3lyY3lLcWpkY0FsZXFL?=
 =?utf-8?B?TTJNZFJXQVhGOTZXZDhTQWFQRTlDN2huSncvZWhEaWhSNUlNN1dTNkhjYWk4?=
 =?utf-8?B?aHd3QjVEWVg1QnBvMnNPZXhTSVk2K0VSYVVMY041anNzTkd2SlVGaENma2Fs?=
 =?utf-8?B?SGJIbm5vNm1hTklXeE41VEFQR1hsNnYwcDY4Wm1FeS9jb1JoR2w3UzdpSEgy?=
 =?utf-8?B?OTVLWFdFWVdUYWNCZWRLTFJBMUx1NURCeWE0MjhYM1RKaE1SV2VoS3RCL1FC?=
 =?utf-8?B?RHJtZXNIK0laQzMxTDFIS2xna3FUOUREQU5nL09nOFkrdlJPZ25PRmpVdGQr?=
 =?utf-8?B?V3BzMytHcmlnZ2JnQThZd3JyWC9KNEErR2xTdE95UUlHeHJ6Y2FTM0JkdDFP?=
 =?utf-8?B?cWJVRUFpbkt0UEFlZ0lIVVJmY1daR3NGUXdGQ2xMa3V0RkxXMGh6ZkhTNjdt?=
 =?utf-8?B?dEVYMnNtcW5KVmt3SCs4OVYrZS83VVBpRTJtaUFsZ0k4VXdmbHpweHJlSHZO?=
 =?utf-8?B?S00rNFBpM3kyUlpaUzhTOVZibnVLM1FIZzVTQlhvSTNMc2M3OE5LNmtsOWVV?=
 =?utf-8?B?NWxmcCtCOXNrOUlEdno1SldLR3IrYUk1emx6LzRlOXkzbWZ2N1c1R2dON3Ay?=
 =?utf-8?B?WjNKbDlFbzZzSlVCa1ZQd0tmWmRiT0J3cTZYSEVyL1B5YmtBOUhyMDBGcFNx?=
 =?utf-8?B?ZzNIa1NHOVRjam4wdk91SWMxMENqL3MrbUtnWHlUcXNyMnYzeVNMWkdLSlU2?=
 =?utf-8?B?YWFDd3pCQkV3RlNhTThzUXRReWVyeUZuWmoxUVoxWnY2ME1PMGJRVWRCa1pW?=
 =?utf-8?B?TS9ncHNQQUdaaW94ZU9ZV3NVZWgwMkt6NEhFaXRYdFlSYis3d1ROK1AyVFBs?=
 =?utf-8?B?eWxmN01ZQk0wNUVSMWVtZ2ZtQ3h0My9VeGEvUXRlWlZKZEM0b3djOEFRNHR3?=
 =?utf-8?B?WmM1RWc3ZzNLZTJUSy9nbk9ZeDU1VUhUZkhUenpyVHNyOWc3ZnpmbC91THB0?=
 =?utf-8?B?Mjg2Q0w1eTNqUUlTeFArZWhaM2hTNlZUNDg0Ym5Qb2FGaWczc3FlYVRuMlBX?=
 =?utf-8?B?Z0FycWlFdk5wZFVEcUdzdUNHMnN1MFVLdlliVFcrVTEwRDBvU2hSRHl0RDlX?=
 =?utf-8?B?SnhoWnhSZWJJL1YwSnhidDBxempQRlNINTJyeldwNkVQbWYwRTVFZ1BPc0Rh?=
 =?utf-8?B?Ny8xN2xpZWpWQWNwclJwcWhDSk9LUEZJTWQwdmVUd2dUOEF1SGlOWmZuTWFw?=
 =?utf-8?B?d1U3RnJnOUxQK29WWVNMUlhEb3owT09XRm1aNG9LQ1BaTkF5TG5rQitrR1Vz?=
 =?utf-8?B?N3RkM1NTbUNWcU01SGIyVFhNVUs3a3YybGxDUk5UNFFZOXkwd3BjcHVPQU42?=
 =?utf-8?B?Q0s5bENVRWZaNjNoRzNuRDU3K3pBU3VWVGJkcGh1QUtjSjl4aEU1Snh2Q1Vq?=
 =?utf-8?B?V0c3QXZCZWNXUU85cFQ5c3JUWGh2VWlSR0tEaWRrNzdHMDNoWHBDTHdhZ2Jq?=
 =?utf-8?B?VzE2Rm5ZV1JNNkIrSElrRXhvUWVpRHQ0S0wrcFJXQldBNStLMDk0d1pzbCtN?=
 =?utf-8?B?bWRwUWRESWJycGFIR1JOV1QyandZT3owVExvOGI1Z3FDdjNoQXVqL21TM01S?=
 =?utf-8?B?eVV4cCs3N25GUWduLzlJUE9PR0tQNjJOdzFpL3NlWTJrZFpTTkNmN0I3UHUv?=
 =?utf-8?B?dDM5cE5NRG9IZmx5eFJoOWJhNlhJWlQ2V2wzNXRpdloyMEN3T1FxaEFkNWVu?=
 =?utf-8?B?MXd2emFwQzJYTXZTYlZHKzhxUWNRa2NDWC9zUlorMFdPN0haRlIyekxRUDZx?=
 =?utf-8?B?cTVyN29TTkpvL0NxaGMrNk1TTHlnem9HNVNMZ283MDkzemxzSUxzZGJ3Yk14?=
 =?utf-8?B?eGc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c23000-a318-4495-9e65-08dac8940e84
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 12:05:45.3289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DTey3FcYExDRsH+D8drZykpMGqjQwdtW1W1nIWF07wrsM9uJZ14B4zWK0564G1a5hx6bfByrAqY7YD/aQuRMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5204
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 16/11/2022 21:05, Rob Herring wrote:
> On Mon, Nov 14, 2022 at 08:40:41PM +0800, Wayne Chang wrote:
>> Extend the Tegra XUSB controller device tree binding with Tegra234
>> support.
> 
> Why do you need any order and number of phys? Please explain in the
> commit msg.

I have been having a quick look at this and for the devices that
this binding is applicable to, they only support one port for USB2
and one port for USB3. So I don't think that we should have all
these ports defined in this binding doc. So ideally, we should have
...

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
index 52488a731c4e..031796b68bbb 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
@@ -98,17 +98,9 @@ properties:
  
    phy-names:
      minItems: 1
-    maxItems: 8
      items:
-      enum:
-        - usb2-0
-        - usb2-1
-        - usb2-2
-        - usb2-3
-        - usb3-0
-        - usb3-1
-        - usb3-2
-        - usb3-3
+      - const: usb2
+      - const: usb3
  
    dma-coherent:
      type: boolean
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 0556bc64287d..349a98119608 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2128,7 +2128,7 @@ usb@3550000 {
  
                         phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
                                 <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>;
-                       phy-names = "usb2-0", "usb3-1";
+                       phy-names = "usb2", "usb3";
                 };
  
                 usb@3610000 {

Jon

-- 
nvpublic
