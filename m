Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44D836298C6
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 13:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238316AbiKOMXf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 07:23:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238343AbiKOMXM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 07:23:12 -0500
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2042.outbound.protection.outlook.com [40.107.95.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C76792612B;
        Tue, 15 Nov 2022 04:23:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ioSTVlYHipOULG9ZlOxxgGsHZ7t4IXUgSVvBGSqx9DJJLb0Sn34so1jzp/ZaZ77Lhr5TbczO2pzZ1YkA2DU6BA2+hjgfd9PcsxdUDsRjYHPSNel9HctxhVByrQ5i3NKzHkjLV8PTUndxK7SMj2R/fCyiICzixp28rM7furQOBsjoWXfvhQKP94bK16kSoxwmdoRHefTf3uvd3Q6mNzEzl2my1uCuR7qNDSQc8z+AAPKLwkpLq0aBMiJUxpXMMxfrCGNRAyBjqDUgyWe+BoRHyRUBPzV60mJQqJ0cs+oC2NwNJ+H8bhaeUqPxSxkeVyGl3WyXnWrWXvLZiyZzMDev/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcNKykDMLLnW0mXvrwAWGItXVAtj37fDWGQ61MUS488=;
 b=GVc9ioatpYu8YTCoEx1gugQIWeLpq2+Mtigw5RgEEEGV6GICv3IiHckOmM0D9G69fIaWf9sc4KYFUuEO5zuJmxXDlVB8+8X8lhI6nq5l3N6uSFdlbmEDWH1M1j3mWjxct0961nCGqTbqP+UrRB14w6eCqTm+tuC5fdJXE/M3qx+UjAswNn5x1V3FJ/8nkfPpsX1P4BUahMtIT7nb8AYUzh05lsOaKXcNqKIt6mRihxPME69SXmG9BHDCQWzsHM8IMnFaEBFnAmVjecBZZs7um0ch02P7V7ZOz1fFmFAloE0HppVDumPgWlTDGmfwKcKzZUUTrzxf7jXAj8g67VsCNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcNKykDMLLnW0mXvrwAWGItXVAtj37fDWGQ61MUS488=;
 b=Aj4K6PVCqyEvP1CfbWxg5ajk3IOu2brRb6WF8nBSztVO/KZBNihfU3PhFO/61fFsZnASJOt8TTkjmsIbPS+nBgQoBnphomx09lWncxtVo3DZwOl+mKL4wwPjkz4Sy4zj2+hxJ5+mt2hdd2lFlaJ813a2lpoJJtdGk9To1hd+BCs0N0nr7Hl0HPW+j9Psz9B2FqEN6xnzu3QsjSRlLaalzNQzjUed9hjH9sSq3XqU5rJmU/d6XJeyWFPjm2yCiQfprny/xURscr+zQNyZCP1GgDY86Ilx+xvEtqyF3ANgV++JG2L4OAItqBLuF8Byf8aHPZ3h/N4e/P4SImvElfNJfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SA0PR12MB4525.namprd12.prod.outlook.com (2603:10b6:806:92::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Tue, 15 Nov 2022 12:23:08 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 12:23:08 +0000
Message-ID: <5202f499-bb5e-34b4-0887-41a632042543@nvidia.com>
Date:   Tue, 15 Nov 2022 12:23:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 12/13] usb: host: xhci-tegra: Add Tegra234 XHCI support
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
 <20221114124053.1873316-13-waynec@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221114124053.1873316-13-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0001.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::6) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SA0PR12MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: d28860f4-6d01-4eff-fe9a-08dac7042781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VrOuljCf77VhxuVj6wG8TchsRzFhTYrasazgyHLyAzTQ4AXXfBJ+xxu0VbN9O3DtRCohySBiQk5C1Q9Nj2SOLiHdEYpK8PAqiJ561BmNrkr9oMYhTK69o6OtWytXNt903utTfCgvWqxlR2Vl6ToPg0xR1t9W1wMx5dU2AmqQ1LnxC3IQRMh2GXWi2RgDYitUOIwJt/ZZnB/TGkwByg1CXT8Ou1kHz7kVRqCfFyOKTXWGQAxsH1D6SpxzoiFnY7ddcw5SE91NqNnDVwmjN9Tr1IxpaG27tgmeuEh5dqDnHIJtXvQILYnvp7e9Y5lbYudy4VCDfCWYLPyFbknXhFAcPTZmPJysydArJcJpp326WpSZJr3jH1+QFcSqVZPoNPBNGos2Zxfwf62FY6DI+M80e7tWXP2rxSgTOQ6WlMSeWgy/xdwIv+Di5poijPTnyO9Cl3lR7c/t96n00x7C4HCh8OW4OT+IeZ0aGZ0E78JIixVz87zXrB6Geco5RxzAYrYPnZBLZcBQFD2utkCtFLi+mQSWQKTXlK0bcvpzEgJx+F+Nqn9Y82KXrWK5Kv9tkJzsunoS5Yi5xo3+oHXbXVZDlY03GYFX1Rf4zaCdQh3Jym7g3bZ6hqKxI/i9yu+wbGyd/Nbk1ktlNxhvPUNaLoVdT2q+neAlst08kY1SBt3vLrPxgVOlBhV1zP6VP0kg2UVMNz2bXATCTU+2mne8yTOQHMZVbMjQB/jKlj9fVmPza6WbtV03o0JoYKasGjeoGbMyDr27mJmcoXPDwbu2ZIeMyV+xbQuU/q6QSlOiNDANCGunK21EZMCfkYFNtr2QlpJC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199015)(6636002)(316002)(66556008)(38100700002)(66476007)(5660300002)(7416002)(8936002)(66946007)(30864003)(83380400001)(6506007)(53546011)(8676002)(41300700001)(4326008)(55236004)(26005)(2616005)(6512007)(6486002)(186003)(478600001)(86362001)(31696002)(921005)(6666004)(31686004)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eld0d1pZS2JmSjY3VEw3VCtnMm1UNHBoWXZRbUEvTjQ1NkF6djZLTkNsOWpB?=
 =?utf-8?B?d1EzaHllMmsyeFFVS1g3ejRQTEtsNnc2UjVqYUp5OFI4MkFWVkNCNTZraTg3?=
 =?utf-8?B?MEFaQnJVWW1CWURVekdrMjNPQitGQzQ1dm01VXBPZklXWVJNcnExZnhURXNH?=
 =?utf-8?B?VS85VUJaZlpCWnYvRjhlQzJZRmhORUgrSE5wTkhGaUxVOGRqTDhSZzJzS2c1?=
 =?utf-8?B?UERUTXV4RlM1dmFFTlZQS1BSaFJzNHVqblVMY3kvdjB5cGlKNVRzTTdTWmtv?=
 =?utf-8?B?NlJBV05jcVQwMVJTVnhjWC9mUWRLMm4wcE9UbGxWK2JIeXRuSHJDZlROMmxF?=
 =?utf-8?B?blR3cDBhT3B6Nk1EL1ZIbHMzWU1qTElKTG5mMmd4NHJWa3dHQmJpR3Fsb25F?=
 =?utf-8?B?WW1FMzNNZmkyTDZaY0pGWjBDTkVjRE5oeEhWYjNvMTM2NDc3cWx3UWF3Mnhz?=
 =?utf-8?B?azZ0UTU3T25yQzVCY1o3aE9ldlMxUDNXSFR3WjRkM3BiSTlWcXVoZ2xGSFJT?=
 =?utf-8?B?c3doTURuODdBT3F2L3g2MXNBSHd3MUFnL3N6ODFTSDZSL0xTZnZCeTNlK0VW?=
 =?utf-8?B?RzMwMVAvSmFDYU01R1FXeFdKSU11V2lFTUNjZHAwTTNFWkRISDRCWXNFVE5N?=
 =?utf-8?B?YXp5TXdNdkhaUjZPNVNhRmFrUDFSaEM3MDVKUHRrYmVGV0ZzaVVORHV0eDkx?=
 =?utf-8?B?TDltYnRIZ2ZUWUlMdVZYSTBmSjNGcUIwWXZIT0gzdWd0elhpK0J4anVnRHow?=
 =?utf-8?B?RzlKam9ES1lFdHl3dmo1QkQvdXZNa2w5UkdPNWc5ME5odjR2OEdjakpXbUxI?=
 =?utf-8?B?Y3JlcVlQdnE2TkJRQmZKQ1lOeEU0QmJScnhBRm9Ec292NkVWMDlCaUxNc1Bx?=
 =?utf-8?B?QWVTRTA5dmZZRHN4Q0JrQWl0YmFHTkJwMnR6L05zSmZsQkVFbVRKdU5obHlh?=
 =?utf-8?B?VW1MWU42b1JrYzkya2tjeE50MEdPS1VSckt3bFlQMVJFbmszeFdyejlsQlh1?=
 =?utf-8?B?b1ViSnk1RVFRcGx3ZkVwS21RVTU3RldyREhhVDN3SkVid25wZjNyWFkxalQ5?=
 =?utf-8?B?ZXVQRGRpM1liT2dGMlhvenUzaVhFQWFVa25PbzQxQUFTK25NWGQ0dFljWUxD?=
 =?utf-8?B?MjNabnQ5emZqajRsMEtEWUZsUzBqT3N0ZklkSndTdEt5NDBTclhsRkRrY2dI?=
 =?utf-8?B?ZGRYb0ltWkJHckxtZ3E1cEFGbkRkWTZtUUd0eWpma1hPemlyL0RFZ1RPazJu?=
 =?utf-8?B?Z2NHQjdYTDQvTmtYNHQwQ2w0OWZJWGF3TGFPdDlWMU5MWERFdFhpQUozdXJ1?=
 =?utf-8?B?TUg1a0lxZjExa213MUpZczJXSzZlL0JTWWVKTUxRS1lMemtwVENpNW1CNFpU?=
 =?utf-8?B?dUtzZG1SLzhtYUF0eFk0WVp5TnlHRHV5MTZzdUxxUHpaRktxZm96bnhLY0l2?=
 =?utf-8?B?eE93NmE1ZUVpMXJIZUdRdktSN21lazY2eDJxcG1pNEpkdEl0SjZYRUszQWZR?=
 =?utf-8?B?aUV3OGZoYStmL2hRc25nWFo5Sy9KVmtKNG1NZEd5SWxxNkNTVFp3aEdlK3pO?=
 =?utf-8?B?aU9vZis2SXBCVC9Ed1pVMnVDT1l3MFAzSm42K2xwckNKL09GMVhyVDRZeGZ2?=
 =?utf-8?B?anYzbmx4Z1F2alVrMjJ3TTV6MnNCN1gvbERQSk14YTAwbWwwQ09DTmk0aDFn?=
 =?utf-8?B?U0ZpVzN3ZWc2ZkpOQWZBeGxWMVRlZGNYWUxhWHluckRhR2wxbG1aYmYrT1dD?=
 =?utf-8?B?QnM0YmxLRzZiVzdLc1loV3pnMzVHNTRSRDltTHVCL0FxazYzQjJ6djl0K0xv?=
 =?utf-8?B?K2NLcm1HUGZnZzV0ODNFRWc3STBmU2pGUWs0MzVleFI0R09DeERxNlN1UVBr?=
 =?utf-8?B?dHk5cGNIQWE0L3hydU10NkkrMzd0YWZuYWgxZjlKTHI5TFNaMDc3Ym5mQmdS?=
 =?utf-8?B?ai8yN1IwQTV5dXZPVmxEREFXaHdGNk5wbVFwdkhzQklrTmx1TFlRQmcyWUcy?=
 =?utf-8?B?YUgrTFVzdVN6RWxUV0lhVnZ3OWhaRG9FRG4vK1lnVjQrelZVaHFtM2RhWVhU?=
 =?utf-8?B?MjVvTjJnRlJqNEt4MHUveWpTdFVSeHRMbVRvcCt0c3dwcldaVGRWSWxYMVBj?=
 =?utf-8?B?NTJxZFY1NkJSOWdqL3RSdnlFeXJuYkdKdzZ1WENJc3hORS9tS25UVHYveENF?=
 =?utf-8?B?akE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d28860f4-6d01-4eff-fe9a-08dac7042781
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 12:23:08.4223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEGOdPpuK5L/EekO6kXoIUeh8k4ahjYE0fXjKOd1ZQPbbnRnQvJj82UtJUPAyZv8gW1Vooha25S0ENc9KAVbVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4525
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
> From: Sing-Han Chen <singhanc@nvidia.com>
> 
> This change adds Tegra234 XUSB host mode controller support.
> 
> In Tegra234, some of the registers have moved to bar2 space.
> The new soc variable has_bar2 indicates the chip with bar2
> area. This patch adds new reg helper to let the driver reuse
> the same code for those chips with bar2 support.
> 
> Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
> Co-developed-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> V2 -> V3:nothing has changed
> V1 -> V2:fix some issues on coding style
> extract tegra_xusb_load_firmware function
> refine has_bar2 and remove has_ifr/firmware on Tegra234
>   drivers/usb/host/xhci-tegra.c | 270 +++++++++++++++++++++++++++++-----
>   1 file changed, 232 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index bdb776553826..b2f07eae2c93 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -44,6 +44,9 @@
>   #define XUSB_CFG_4				0x010
>   #define  XUSB_BASE_ADDR_SHIFT			15
>   #define  XUSB_BASE_ADDR_MASK			0x1ffff
> +#define XUSB_CFG_7				0x01c
> +#define  XUSB_BASE2_ADDR_SHIFT			16
> +#define  XUSB_BASE2_ADDR_MASK			0xffff
>   #define XUSB_CFG_16				0x040
>   #define XUSB_CFG_24				0x060
>   #define XUSB_CFG_AXI_CFG			0x0f8
> @@ -75,6 +78,20 @@
>   #define  MBOX_SMI_INTR_FW_HANG			BIT(1)
>   #define  MBOX_SMI_INTR_EN			BIT(3)
>   
> +/* BAR2 registers */
> +#define XUSB_BAR2_ARU_MBOX_CMD			0x004
> +#define XUSB_BAR2_ARU_MBOX_DATA_IN		0x008
> +#define XUSB_BAR2_ARU_MBOX_DATA_OUT		0x00c
> +#define XUSB_BAR2_ARU_MBOX_OWNER		0x010
> +#define XUSB_BAR2_ARU_SMI_INTR			0x014
> +#define XUSB_BAR2_ARU_SMI_ARU_FW_SCRATCH_DATA0	0x01c
> +#define XUSB_BAR2_ARU_IFRDMA_CFG0		0x0e0
> +#define XUSB_BAR2_ARU_IFRDMA_CFG1		0x0e4
> +#define XUSB_BAR2_ARU_IFRDMA_STREAMID_FIELD	0x0e8
> +#define XUSB_BAR2_ARU_C11_CSBRANGE		0x9c
> +#define XUSB_BAR2_ARU_FW_SCRATCH		0x1000
> +#define XUSB_BAR2_CSB_BASE_ADDR			0x2000
> +
>   /* IPFS registers */
>   #define IPFS_XUSB_HOST_MSI_BAR_SZ_0		0x0c0
>   #define IPFS_XUSB_HOST_MSI_AXI_BAR_ST_0		0x0c4
> @@ -111,6 +128,9 @@
>   #define  IMFILLRNG1_TAG_HI_SHIFT		16
>   #define XUSB_FALC_IMFILLCTL			0x158
>   
> +/* CSB ARU registers */
> +#define XUSB_CSB_ARU_SCRATCH0			0x100100
> +
>   /* MP CSB registers */
>   #define XUSB_CSB_MP_ILOAD_ATTR			0x101a00
>   #define XUSB_CSB_MP_ILOAD_BASE_LO		0x101a04
> @@ -131,6 +151,9 @@
>   
>   #define IMEM_BLOCK_SIZE				256
>   
> +#define FW_IOCTL_TYPE_SHIFT			24
> +#define FW_IOCTL_CFGTBL_READ		17
> +
>   struct tegra_xusb_fw_header {
>   	__le32 boot_loadaddr_in_imem;
>   	__le32 boot_codedfi_offset;
> @@ -175,6 +198,7 @@ struct tegra_xusb_mbox_regs {
>   	u16 data_in;
>   	u16 data_out;
>   	u16 owner;
> +	u16 smi_intr;
>   };
>   
>   struct tegra_xusb_context_soc {
> @@ -189,6 +213,18 @@ struct tegra_xusb_context_soc {
>   	} fpci;
>   };
>   
> +struct tegra_xusb;
> +struct tegra_xusb_soc_ops {
> +	u32 (*mbox_reg_readl)(struct tegra_xusb *tegra,
> +			unsigned int offset);
> +	void (*mbox_reg_writel)(struct tegra_xusb *tegra,
> +			u32 value, unsigned int offset);
> +	u32 (*csb_reg_readl)(struct tegra_xusb *tegra,
> +			unsigned int offset);
> +	void (*csb_reg_writel)(struct tegra_xusb *tegra,
> +			u32 value, unsigned int offset);
> +};
> +
>   struct tegra_xusb_soc {
>   	const char *firmware;
>   	const char * const *supply_names;
> @@ -205,11 +241,14 @@ struct tegra_xusb_soc {
>   	} ports;
>   
>   	struct tegra_xusb_mbox_regs mbox;
> +	const struct tegra_xusb_soc_ops *ops;
>   
>   	bool scale_ss_clock;
>   	bool has_ipfs;
>   	bool lpm_support;
>   	bool otg_reset_sspi;
> +
> +	bool has_bar2;
>   };
>   
>   struct tegra_xusb_context {
> @@ -230,6 +269,8 @@ struct tegra_xusb {
>   
>   	void __iomem *ipfs_base;
>   	void __iomem *fpci_base;
> +	void __iomem *bar2_base;
> +	struct resource *bar2;
>   
>   	const struct tegra_xusb_soc *soc;
>   
> @@ -300,7 +341,33 @@ static inline void ipfs_writel(struct tegra_xusb *tegra, u32 value,
>   	writel(value, tegra->ipfs_base + offset);
>   }
>   
> +static inline u32 bar2_readl(struct tegra_xusb *tegra, unsigned int offset)
> +{
> +	return readl(tegra->bar2_base + offset);
> +}
> +
> +static inline void bar2_writel(struct tegra_xusb *tegra, u32 value,
> +			       unsigned int offset)
> +{
> +	writel(value, tegra->bar2_base + offset);
> +}
> +
>   static u32 csb_readl(struct tegra_xusb *tegra, unsigned int offset)
> +{
> +	const struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
> +
> +	return ops->csb_reg_readl(tegra, offset);
> +}
> +
> +static void csb_writel(struct tegra_xusb *tegra, u32 value,
> +		       unsigned int offset)
> +{
> +	const struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
> +
> +	ops->csb_reg_writel(tegra, value, offset);
> +}
> +
> +static u32 fpci_csb_readl(struct tegra_xusb *tegra, unsigned int offset)
>   {
>   	u32 page = CSB_PAGE_SELECT(offset);
>   	u32 ofs = CSB_PAGE_OFFSET(offset);
> @@ -310,7 +377,7 @@ static u32 csb_readl(struct tegra_xusb *tegra, unsigned int offset)
>   	return fpci_readl(tegra, XUSB_CFG_CSB_BASE_ADDR + ofs);
>   }
>   
> -static void csb_writel(struct tegra_xusb *tegra, u32 value,
> +static void fpci_csb_writel(struct tegra_xusb *tegra, u32 value,
>   		       unsigned int offset)
>   {
>   	u32 page = CSB_PAGE_SELECT(offset);
> @@ -320,6 +387,26 @@ static void csb_writel(struct tegra_xusb *tegra, u32 value,
>   	fpci_writel(tegra, value, XUSB_CFG_CSB_BASE_ADDR + ofs);
>   }
>   
> +static u32 bar2_csb_readl(struct tegra_xusb *tegra, unsigned int offset)
> +{
> +	u32 page = CSB_PAGE_SELECT(offset);
> +	u32 ofs = CSB_PAGE_OFFSET(offset);
> +
> +	bar2_writel(tegra, page, XUSB_BAR2_ARU_C11_CSBRANGE);
> +
> +	return bar2_readl(tegra, XUSB_BAR2_CSB_BASE_ADDR + ofs);
> +}
> +
> +static void bar2_csb_writel(struct tegra_xusb *tegra, u32 value,
> +		       unsigned int offset)
> +{
> +	u32 page = CSB_PAGE_SELECT(offset);
> +	u32 ofs = CSB_PAGE_OFFSET(offset);
> +
> +	bar2_writel(tegra, page, XUSB_BAR2_ARU_C11_CSBRANGE);
> +	bar2_writel(tegra, value, XUSB_BAR2_CSB_BASE_ADDR + ofs);
> +}
> +
>   static int tegra_xusb_set_ss_clk(struct tegra_xusb *tegra,
>   				 unsigned long rate)
>   {
> @@ -451,6 +538,7 @@ static bool tegra_xusb_mbox_cmd_requires_ack(enum tegra_xusb_mbox_cmd cmd)
>   static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
>   				const struct tegra_xusb_mbox_msg *msg)
>   {
> +	const struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
>   	bool wait_for_idle = false;
>   	u32 value;
>   
> @@ -459,15 +547,15 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
>   	 * ACK/NAK messages.
>   	 */
>   	if (!(msg->cmd == MBOX_CMD_ACK || msg->cmd == MBOX_CMD_NAK)) {
> -		value = fpci_readl(tegra, tegra->soc->mbox.owner);
> +		value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.owner);
>   		if (value != MBOX_OWNER_NONE) {
>   			dev_err(tegra->dev, "mailbox is busy\n");
>   			return -EBUSY;
>   		}
>   
> -		fpci_writel(tegra, MBOX_OWNER_SW, tegra->soc->mbox.owner);
> +		ops->mbox_reg_writel(tegra, MBOX_OWNER_SW, tegra->soc->mbox.owner);
>   
> -		value = fpci_readl(tegra, tegra->soc->mbox.owner);
> +		value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.owner);
>   		if (value != MBOX_OWNER_SW) {
>   			dev_err(tegra->dev, "failed to acquire mailbox\n");
>   			return -EBUSY;
> @@ -477,17 +565,17 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
>   	}
>   
>   	value = tegra_xusb_mbox_pack(msg);
> -	fpci_writel(tegra, value, tegra->soc->mbox.data_in);
> +	ops->mbox_reg_writel(tegra, value, tegra->soc->mbox.data_in);
>   
> -	value = fpci_readl(tegra, tegra->soc->mbox.cmd);
> +	value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.cmd);
>   	value |= MBOX_INT_EN | MBOX_DEST_FALC;
> -	fpci_writel(tegra, value, tegra->soc->mbox.cmd);
> +	ops->mbox_reg_writel(tegra, value, tegra->soc->mbox.cmd);
>   
>   	if (wait_for_idle) {
>   		unsigned long timeout = jiffies + msecs_to_jiffies(250);
>   
>   		while (time_before(jiffies, timeout)) {
> -			value = fpci_readl(tegra, tegra->soc->mbox.owner);
> +			value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.owner);
>   			if (value == MBOX_OWNER_NONE)
>   				break;
>   
> @@ -495,7 +583,7 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
>   		}
>   
>   		if (time_after(jiffies, timeout))
> -			value = fpci_readl(tegra, tegra->soc->mbox.owner);
> +			value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.owner);
>   
>   		if (value != MBOX_OWNER_NONE)
>   			return -ETIMEDOUT;
> @@ -507,11 +595,12 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
>   static irqreturn_t tegra_xusb_mbox_irq(int irq, void *data)
>   {
>   	struct tegra_xusb *tegra = data;
> +	const struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
>   	u32 value;
>   
>   	/* clear mailbox interrupts */
> -	value = fpci_readl(tegra, XUSB_CFG_ARU_SMI_INTR);
> -	fpci_writel(tegra, value, XUSB_CFG_ARU_SMI_INTR);
> +	value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.smi_intr);
> +	ops->mbox_reg_writel(tegra, value, tegra->soc->mbox.smi_intr);
>   
>   	if (value & MBOX_SMI_INTR_FW_HANG)
>   		dev_err(tegra->dev, "controller firmware hang\n");
> @@ -664,6 +753,7 @@ static void tegra_xusb_mbox_handle(struct tegra_xusb *tegra,
>   static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
>   {
>   	struct tegra_xusb *tegra = data;
> +	const struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
>   	struct tegra_xusb_mbox_msg msg;
>   	u32 value;
>   
> @@ -672,16 +762,16 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
>   	if (pm_runtime_suspended(tegra->dev) || tegra->suspended)
>   		goto out;
>   
> -	value = fpci_readl(tegra, tegra->soc->mbox.data_out);
> +	value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.data_out);
>   	tegra_xusb_mbox_unpack(&msg, value);
>   
> -	value = fpci_readl(tegra, tegra->soc->mbox.cmd);
> +	value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.cmd);
>   	value &= ~MBOX_DEST_SMI;
> -	fpci_writel(tegra, value, tegra->soc->mbox.cmd);
> +	ops->mbox_reg_writel(tegra, value, tegra->soc->mbox.cmd);
>   
>   	/* clear mailbox owner if no ACK/NAK is required */
>   	if (!tegra_xusb_mbox_cmd_requires_ack(msg.cmd))
> -		fpci_writel(tegra, MBOX_OWNER_NONE, tegra->soc->mbox.owner);
> +		ops->mbox_reg_writel(tegra, MBOX_OWNER_NONE, tegra->soc->mbox.owner);
>   
>   	tegra_xusb_mbox_handle(tegra, &msg);
>   
> @@ -709,6 +799,15 @@ static void tegra_xusb_config(struct tegra_xusb *tegra)
>   	value |= regs & (XUSB_BASE_ADDR_MASK << XUSB_BASE_ADDR_SHIFT);
>   	fpci_writel(tegra, value, XUSB_CFG_4);
>   
> +	/* Program BAR2 space */
> +	if (tegra->bar2) {
> +		value = fpci_readl(tegra, XUSB_CFG_7);
> +		value &= ~(XUSB_BASE2_ADDR_MASK << XUSB_BASE2_ADDR_SHIFT);
> +		value |= tegra->bar2->start &
> +			(XUSB_BASE2_ADDR_MASK << XUSB_BASE2_ADDR_SHIFT);
> +		fpci_writel(tegra, value, XUSB_CFG_7);
> +	}
> +
>   	usleep_range(100, 200);
>   
>   	/* Enable bus master */
> @@ -881,21 +980,36 @@ static int tegra_xusb_request_firmware(struct tegra_xusb *tegra)
>   	return 0;
>   }
>   
> -static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
> +static int tegra_xusb_wait_for_falcon(struct tegra_xusb *tegra)
> +{
> +	struct xhci_cap_regs __iomem *cap_regs;
> +	struct xhci_op_regs __iomem *op_regs;
> +	int ret;
> +	u32 value;
> +
> +	cap_regs = tegra->regs;
> +	op_regs = tegra->regs + HC_LENGTH(readl(&cap_regs->hc_capbase));
> +
> +	ret = readl_poll_timeout(&op_regs->status, value, !(value & STS_CNR), 1000, 200000);
> +
> +	if (ret)
> +		dev_err(tegra->dev, "XHCI Controller not ready. Falcon state: 0x%x\n",
> +			csb_readl(tegra, XUSB_FALC_CPUCTL));
> +
> +	return ret;
> +}
> +
> +static int tegra_xusb_load_firmware_rom(struct tegra_xusb *tegra)
>   {
>   	unsigned int code_tag_blocks, code_size_blocks, code_blocks;
> -	struct xhci_cap_regs __iomem *cap = tegra->regs;
>   	struct tegra_xusb_fw_header *header;
>   	struct device *dev = tegra->dev;
> -	struct xhci_op_regs __iomem *op;
> -	unsigned long timeout;
>   	time64_t timestamp;
>   	u64 address;
>   	u32 value;
>   	int err;
>   
>   	header = (struct tegra_xusb_fw_header *)tegra->fw.virt;
> -	op = tegra->regs + HC_LENGTH(readl(&cap->hc_capbase));
>   
>   	if (csb_readl(tegra, XUSB_CSB_MP_ILOAD_BASE_LO) != 0) {
>   		dev_info(dev, "Firmware already loaded, Falcon state %#x\n",
> @@ -968,30 +1082,55 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
>   	/* Boot Falcon CPU and wait for USBSTS_CNR to get cleared. */
>   	csb_writel(tegra, CPUCTL_STARTCPU, XUSB_FALC_CPUCTL);
>   
> -	timeout = jiffies + msecs_to_jiffies(200);
> +	if (tegra_xusb_wait_for_falcon(tegra))
> +		return -EIO;
> +
> +	timestamp = le32_to_cpu(header->fwimg_created_time);
>   
> -	do {
> -		value = readl(&op->status);
> -		if ((value & STS_CNR) == 0)
> -			break;
> +	dev_info(dev, "Firmware timestamp: %ptTs UTC\n", &timestamp);
> +
> +	return 0;
> +}
> +
> +static u32 tegra_xusb_read_firmware_header(struct tegra_xusb *tegra, u32 offset)
> +{
> +	/*
> +	 * We only accept reading the firmware config table
> +	 * The offset should not exceed the fw header structure
> +	 */
> +	if (offset >= sizeof(struct tegra_xusb_fw_header))
> +		return 0;
>   
> -		usleep_range(1000, 2000);
> -	} while (time_is_after_jiffies(timeout));
> +	bar2_writel(tegra, (FW_IOCTL_CFGTBL_READ << FW_IOCTL_TYPE_SHIFT) | offset,
> +			XUSB_BAR2_ARU_FW_SCRATCH);
> +	return bar2_readl(tegra, XUSB_BAR2_ARU_SMI_ARU_FW_SCRATCH_DATA0);
> +}
> +
> +static int tegra_xusb_init_ifr_firmware(struct tegra_xusb *tegra)
> +{
> +	time64_t timestamp;
>   
> -	value = readl(&op->status);
> -	if (value & STS_CNR) {
> -		value = csb_readl(tegra, XUSB_FALC_CPUCTL);
> -		dev_err(dev, "XHCI controller not read: %#010x\n", value);
> +	if (tegra_xusb_wait_for_falcon(tegra))
>   		return -EIO;
> -	}
>   
> -	timestamp = le32_to_cpu(header->fwimg_created_time);
> +#define offsetof_32(X, Y) ((u8)(offsetof(X, Y) / sizeof(__le32)))
> +	timestamp = tegra_xusb_read_firmware_header(tegra,
> +			offsetof_32(struct tegra_xusb_fw_header,
> +				fwimg_created_time) << 2);
>   
> -	dev_info(dev, "Firmware timestamp: %ptTs UTC\n", &timestamp);
> +	dev_info(tegra->dev, "Firmware timestamp: %ptTs UTC\n", &timestamp);
>   
>   	return 0;
>   }
>   
> +static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
> +{
> +	if (!tegra->soc->firmware)
> +		return tegra_xusb_init_ifr_firmware(tegra);
> +	else
> +		return tegra_xusb_load_firmware_rom(tegra);
> +}
> +
>   static void tegra_xusb_powerdomain_remove(struct device *dev,
>   					  struct tegra_xusb *tegra)
>   {
> @@ -1435,6 +1574,10 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>   		tegra->ipfs_base = devm_platform_ioremap_resource(pdev, 2);
>   		if (IS_ERR(tegra->ipfs_base))
>   			return PTR_ERR(tegra->ipfs_base);
> +	} else if (tegra->soc->has_bar2) {
> +		tegra->bar2_base = devm_platform_get_and_ioremap_resource(pdev, 2, &tegra->bar2);
> +		if (IS_ERR(tegra->bar2_base))
> +			return PTR_ERR(tegra->bar2_base);
>   	}
>   
>   	tegra->xhci_irq = platform_get_irq(pdev, 0);
> @@ -1651,10 +1794,13 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>   		goto disable_phy;
>   	}
>   
> -	err = tegra_xusb_request_firmware(tegra);
> -	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to request firmware: %d\n", err);
> -		goto disable_phy;
> +	if (tegra->soc->firmware) {
> +		err = tegra_xusb_request_firmware(tegra);
> +		if (err < 0) {
> +			dev_err(&pdev->dev,
> +				"failed to request firmware: %d\n", err);
> +			goto disable_phy;
> +		}
>   	}
>   
>   	err = tegra_xusb_unpowergate_partitions(tegra);
> @@ -2271,6 +2417,13 @@ static const struct tegra_xusb_context_soc tegra124_xusb_context = {
>   	},
>   };
>   
> +static const struct tegra_xusb_soc_ops tegra124_ops = {
> +	.mbox_reg_readl = &fpci_readl,
> +	.mbox_reg_writel = &fpci_writel,
> +	.csb_reg_readl = &fpci_csb_readl,
> +	.csb_reg_writel = &fpci_csb_writel,
> +};
> +
>   static const struct tegra_xusb_soc tegra124_soc = {
>   	.firmware = "nvidia/tegra124/xusb.bin",
>   	.supply_names = tegra124_supply_names,
> @@ -2286,11 +2439,13 @@ static const struct tegra_xusb_soc tegra124_soc = {
>   	.scale_ss_clock = true,
>   	.has_ipfs = true,
>   	.otg_reset_sspi = false,
> +	.ops = &tegra124_ops,
>   	.mbox = {
>   		.cmd = 0xe4,
>   		.data_in = 0xe8,
>   		.data_out = 0xec,
>   		.owner = 0xf0,
> +		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
>   	},
>   };
>   MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
> @@ -2322,11 +2477,13 @@ static const struct tegra_xusb_soc tegra210_soc = {
>   	.scale_ss_clock = false,
>   	.has_ipfs = true,
>   	.otg_reset_sspi = true,
> +	.ops = &tegra124_ops,
>   	.mbox = {
>   		.cmd = 0xe4,
>   		.data_in = 0xe8,
>   		.data_out = 0xec,
>   		.owner = 0xf0,
> +		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
>   	},
>   };
>   MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
> @@ -2363,11 +2520,13 @@ static const struct tegra_xusb_soc tegra186_soc = {
>   	.scale_ss_clock = false,
>   	.has_ipfs = false,
>   	.otg_reset_sspi = false,
> +	.ops = &tegra124_ops,
>   	.mbox = {
>   		.cmd = 0xe4,
>   		.data_in = 0xe8,
>   		.data_out = 0xec,
>   		.owner = 0xf0,
> +		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
>   	},
>   	.lpm_support = true,
>   };
> @@ -2394,21 +2553,56 @@ static const struct tegra_xusb_soc tegra194_soc = {
>   	.scale_ss_clock = false,
>   	.has_ipfs = false,
>   	.otg_reset_sspi = false,
> +	.ops = &tegra124_ops,
>   	.mbox = {
>   		.cmd = 0x68,
>   		.data_in = 0x6c,
>   		.data_out = 0x70,
>   		.owner = 0x74,
> +		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
>   	},
>   	.lpm_support = true,
>   };
>   MODULE_FIRMWARE("nvidia/tegra194/xusb.bin");
>   
> +static const struct tegra_xusb_soc_ops tegra234_ops = {
> +	.mbox_reg_readl = &bar2_readl,
> +	.mbox_reg_writel = &bar2_writel,
> +	.csb_reg_readl = &bar2_csb_readl,
> +	.csb_reg_writel = &bar2_csb_writel,
> +};
> +
> +static const struct tegra_xusb_soc tegra234_soc = {
> +	.supply_names = tegra194_supply_names,
> +	.num_supplies = ARRAY_SIZE(tegra194_supply_names),
> +	.phy_types = tegra194_phy_types,
> +	.num_types = ARRAY_SIZE(tegra194_phy_types),
> +	.context = &tegra186_xusb_context,
> +	.ports = {
> +		.usb3 = { .offset = 0, .count = 4, },
> +		.usb2 = { .offset = 4, .count = 4, },
> +	},
> +	.scale_ss_clock = false,
> +	.has_ipfs = false,
> +	.otg_reset_sspi = false,
> +	.ops = &tegra234_ops,
> +	.mbox = {
> +		.cmd = XUSB_BAR2_ARU_MBOX_CMD,
> +		.data_in = XUSB_BAR2_ARU_MBOX_DATA_IN,
> +		.data_out = XUSB_BAR2_ARU_MBOX_DATA_OUT,
> +		.owner = XUSB_BAR2_ARU_MBOX_OWNER,
> +		.smi_intr = XUSB_BAR2_ARU_SMI_INTR,
> +	},
> +	.lpm_support = true,
> +	.has_bar2 = true,
> +};
> +
>   static const struct of_device_id tegra_xusb_of_match[] = {
>   	{ .compatible = "nvidia,tegra124-xusb", .data = &tegra124_soc },
>   	{ .compatible = "nvidia,tegra210-xusb", .data = &tegra210_soc },
>   	{ .compatible = "nvidia,tegra186-xusb", .data = &tegra186_soc },
>   	{ .compatible = "nvidia,tegra194-xusb", .data = &tegra194_soc },
> +	{ .compatible = "nvidia,tegra234-xusb", .data = &tegra234_soc },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, tegra_xusb_of_match);


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
