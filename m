Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334BE48D5B0
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jan 2022 11:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbiAMK2m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jan 2022 05:28:42 -0500
Received: from mail-bn8nam11on2074.outbound.protection.outlook.com ([40.107.236.74]:12321
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229533AbiAMK2l (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Jan 2022 05:28:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3IKYcBG9ppoNtWhlz6im0gNvnpm+s+Np1PKJqIgtdtxRzACDnDvVWfAuKvFRSDvjgBvPKsftWGhK1ZmwCK7k9uBH/y0wXj4620nXRZbPfTDQ7TkWUZHKmtroiwLI8zunSU/7ihY1IF0CKkTltrirHz/DGrH3yokn20CHr6HiX2hnT54eZVwCqgquIXBjCn70JDtHdHqPe5qJKh0gDCAL8PYb5PzMFMkFQBf/aCkMIu7hjaopAeNy0hUBdWnS71DeNS9jP4ClYhatXSheA7S/kygVCo74NBqhYkRyo9520EbFTRVc8tnnkbfwl1gV0qrf54guCuPA2G6BsQZtpdnvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2WmcspReMlgZpg8ZldEOCzRhxYq+r2NO1hZPIKwSCk=;
 b=I478XNcpn+MdPpx/OUypV/nWfkrvxK2M6Dx+KXMca+jqxtAE9ReK7MCkAF8yN2/0OFWj8YvFmaMAIh5opmRVjXw/Q8zHUPGAt0kXHexoGDen7oTlspmXx2lLgRfoPMwYdl3fU0U3GDyLRT6XldbtnDV1tvreauyNJiqG9S83W4bJOuqViie1cEJX8TkwBYriU5UT/yQPZOZ75t9ysgxVdbSAjZ36Erc34rblxcahJPUF4jRI4k5pG7CCJ3lJ8l6cDxFlO+1Y+nzVvOoge0l3E6GflzrOXVRz+ENp0bf651yOcB9F/BG2TL2bWhpYctReg9c/PvWuHqLY3Tp6M8TgSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2WmcspReMlgZpg8ZldEOCzRhxYq+r2NO1hZPIKwSCk=;
 b=OWRq29DxHim2VDA2DtK51pmdKx29B3i+1tBENXxel4wVJD7aaEpDLEc6HvRBEhaEOYGe/NtljPI/FOTl61p94sUr5uQk6LAPDrfrzLavggibHS1NHWHarR+y6/Vt79uc8+q98ONOWybBtinqE4YjNYvIhHhpo3A7dt7I1L9M9gk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4188.namprd12.prod.outlook.com (2603:10b6:5:215::18)
 by MWHPR12MB1885.namprd12.prod.outlook.com (2603:10b6:300:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Thu, 13 Jan
 2022 10:28:36 +0000
Received: from DM6PR12MB4188.namprd12.prod.outlook.com
 ([fe80::80ea:7f8f:d21f:f277]) by DM6PR12MB4188.namprd12.prod.outlook.com
 ([fe80::80ea:7f8f:d21f:f277%4]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 10:28:36 +0000
Message-ID: <7a2e7c29-aa0a-ced4-7107-beba8268eca1@amd.com>
Date:   Thu, 13 Jan 2022 15:58:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] i2c: amd-mp2: Remove useless DMA-32 fallback
 configuration
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Elie Morisse <syniurge@gmail.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <80f5c9b0f496d769882d807008c21aad192139f9.1641731644.git.christophe.jaillet@wanadoo.fr>
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
In-Reply-To: <80f5c9b0f496d769882d807008c21aad192139f9.1641731644.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0095.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::11)
 To DM6PR12MB4188.namprd12.prod.outlook.com (2603:10b6:5:215::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45b6ddac-84c9-4ed9-306f-08d9d67f74b6
X-MS-TrafficTypeDiagnostic: MWHPR12MB1885:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB18858EA8B7CAEF0718F17C9FA0539@MWHPR12MB1885.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vkP1tu7yhWdbH4fuO8cOMY8uqipSt/ATL1u/tTnBSb0faWvOAT6wmC7Z8UMkr9cPPcpBSI8Fe7y6zhIOKROt9Mf0TlwOju5gvqNTv5O7q14AltwFc/Nsc4EDu7ZS+lIS/0A2Zs7uVla/XiZEANGm5oWabuYOVE3l4OdYHTy9itOenBDOnOU/fBRmaetafw3pMph+vFVvTYeLnwrKAdr8AIQsSx7lUg7qPeOkPT6dAXZ320vGRDSVBGmCJC9yj7LoU5ajxQloX2kWM7px+X0757FnI7A20O9uDKCDKmCpJ5SqLBB1Vmk4XBRNPrWMwvhFe0otpIDXTvIAs8+JX+d2kvOlqeKJvFexoGiU9/J3f2lGCJ/bAjmNjeGMi/CJlnJ5agEidZ0psdA6+vM8pREPHoAKpdaEuI5xiT1q3KPGX/11M0xnSiOlze3m5OYXeC5Yq1tpupsfa+PnPu7iIAioJJqQL1p+Ubj67gFM+ASBizkDR5J0sZlx9+JCbSuFhlK4GjvKBRfKWJdBzobZHKmS4C1lJMgoQxgV5dFBrk5GCFIbbdkkNyEu1ijw/AgdbGLOWYDEhTSSjHKhKj7HlJYQhkGIIuqEvt+QR98UUTu6f0BWgt0sXIAVVa5pSgmKjgN0v1OUhN+57i4mbLDjJ7QFm2ZB32yiSqCPgk5D+xcp5vtCKrK9jclL8DelUq6Vcn8RJrqqk+Rwm/Y9Dj8ajjw5EojHfVMGP3g05k18A//t09V8oJ111NPc2ORdmZjVq54H2dqmbMyxedVuZmkPW6Db7ww3sfWBSc2wCuUgv3a/Q306kvfYMh5EQhGX+g1bYC4o
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4188.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(6636002)(66946007)(2616005)(31696002)(5660300002)(38100700002)(31686004)(186003)(26005)(966005)(8936002)(110136005)(6512007)(53546011)(66476007)(83380400001)(316002)(36756003)(6506007)(86362001)(2906002)(508600001)(8676002)(6666004)(66556008)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlpDVlJDTkhZcnNUL0JzclhzL0xUOUFYRW41bUUxWUtUa3Y0UjBWV09PeXpy?=
 =?utf-8?B?L1VPM01FVko3QS9jeS9jTDJFVVFiUXZlRTVMU24wOGJWK2FrcDJ6S0I1RnUz?=
 =?utf-8?B?ak9QSk43cjNiVXdxYWxvVDVXQXlVS21UcGRlL3EyajMxS1k0T3NpN1JFUnJC?=
 =?utf-8?B?ZytCQW1ueC9maU9DUUVqVnFCTzdYY1F4NkNwUE9CNzJDeVRpd0hyYjN2eDY2?=
 =?utf-8?B?SEtHdkJwU0xaTnBzQUhnZDk0MzJNclkySS83VFU5Tk9VN2lyYWVyYnZFMnpD?=
 =?utf-8?B?YTJSK0FWdG1MYjlaL1htME8vMzhWZHdJT1dIUWxHTm1UeHhObkp2VC85bzJ4?=
 =?utf-8?B?R1FEaWlybjE5YmwvYllWcWk5b1JRMWIyaDl3d3Vqa1Y2Z25rcm5rTjZaVFdi?=
 =?utf-8?B?THpyU1dMZmxsZG91S3REWE9iYnNCM0FlYkIyMnJGQXZWSEEybE1Nb1lOVkhv?=
 =?utf-8?B?aW1zZHZDbW4vZWNFVm5IcG5xalVKbG1HaldnZnI4VFVvT3NoOGZkNFFvZURB?=
 =?utf-8?B?cjFyQ3NZL05Ra1dNK2Mzb1lyeEM2aTVrTGljVVVBTjAxZ3UwYi9mbDRlRDlP?=
 =?utf-8?B?MDR4VlJNeVBSU09rVmY5Ty8zWnllMWFzTHlMelh3NWRlWFdCMFlHVzJTTVR6?=
 =?utf-8?B?L2d3VDJTZ3pYK3pvbDBOWUJHY2tvY2djSzd4cXJyZUMyUGVBekV0SEhReWFs?=
 =?utf-8?B?YVc1TlNkRWZuelYxdUVldjhqNXpYVUVKclJpVjZaMGZWekNqcXdLYkhLMGk4?=
 =?utf-8?B?T2N1U2JBdmk5dDJYVVRidDFTd2dPTkdlVlBPb2dMMy8zRndyUVV2Z2xMaHFk?=
 =?utf-8?B?citvSVNxRHFmNGdJVm5XZ2xVZWV6NTZYd2RVZlZsV01mMExxOUk0UDJ5WU1L?=
 =?utf-8?B?bW56OE0yZlY0U3NLeXJBcmtTWE9IWUFBMGlRYWp1VDkra1ZPQ0pvdGFvUzBk?=
 =?utf-8?B?aTdMR2NFQloyUXh2N2p0cnExdFo4ZS8xNEhkRTV1Y21qd29BenpiNUh6d21J?=
 =?utf-8?B?Rm5pNThsS1lteXlBbXV0OEl2RW5aMGZiajJDVS95Nk0raFc4QTFUVDltUzJI?=
 =?utf-8?B?czVscExlbkd4ZEdBRWNqaUVvd01NdVNpc3pmZnM5VXlkLzltVEJLRFgwdUhz?=
 =?utf-8?B?Y3lORGdNR0FZcmNRZjdnaVNpTUlCQ0I1VW1VMVJsYitjQmZDakNoZ1NRWERy?=
 =?utf-8?B?eVNpYnJ5SEcydVQxajRpQ2dTTnowbjVmTTlYM0JNWVpWTVVXNStoQjRkeXJX?=
 =?utf-8?B?Y0w4ckxGUzNOYVpGNDg2dG4rK1UzVnJlVDVuOG9RTXJLcVpoUTdIdExyYjd1?=
 =?utf-8?B?L2VBTWRhalZJZDM2cFJjeUQ3MDMycTdBWE5xOFNUQWxzbGd3ekFCK1JyWUtm?=
 =?utf-8?B?RkV5T2wvZktGc3RVOW1wZlgzQjJ4V3RVcEpSd2FOTVpUdVlzWlN5MnowTzlj?=
 =?utf-8?B?MjY1MDZ4WGd0Q2lHOEVENUR3TVp3aHhTc09zcGJYSDFPUkp3QS9Ud3ZwZnRO?=
 =?utf-8?B?SXc0T0dlVUlDVVR3M3FldnpKVW5ZNFdNU0dnckUrWmpJZmV2djZOeXJ2dVJV?=
 =?utf-8?B?eXlYRkRIYU1WczBxMld6Z2JRS09OUWZ4UGNVdHoyUXVMYUxhdmhXZEk2N0Q3?=
 =?utf-8?B?SFRPSS9FTmYrUUJtU3lSMWtLZzJaN1NKVWdiQTViSFhIa24rRGtHWW52aFdk?=
 =?utf-8?B?djMvM2NVTTJtRWJyS24xemJ0SEJoZm0vcmhBM1FIZjZIL0x1cUFSZHNTQ0Fu?=
 =?utf-8?B?TWVRUXV4SFZtTjRZUXMwZmtjRzlKS3ZMV3FoS3d4NTJqUXo5eWM3TGE2ajZx?=
 =?utf-8?B?V1hmZHFkbWFTYWtRQmI5RFpIYWllN09rZ2RscGh6aVRzRUxsMEd4c2VvVzg4?=
 =?utf-8?B?aVlkT0IxUVlIWFQ4RWxtTjEyNXFzbkZVYWZBUHhrVU55LzBKL2o0aExNV3l2?=
 =?utf-8?B?cGViVkEvUUVaU00rU0UvbUYyOXV0MjkrUmwrU3Z1OStjQ213cVNlSkpyNHhx?=
 =?utf-8?B?TlhQMzRLSzcwRGxwRUFjZ28vOUpxbkVkbllHYUFnU2k1bWlTbjBQVE5nZzB2?=
 =?utf-8?B?RFZhbzB1MUFIWEtDcCs2WTBQOEVCaXE0MW5GdmJwTWVtMjE1bGNLM0Rmc0Vz?=
 =?utf-8?Q?YiI4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b6ddac-84c9-4ed9-306f-08d9d67f74b6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4188.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 10:28:36.1141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZkqnyX973vzJqJ0vlbW+aDdU5dW45vWVn95GMObIrx0I+dJsuDIWbTn47wAdjRC5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1885
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/9/2022 6:04 PM, Christophe JAILLET wrote:
> As stated in [1], dma_set_mask() with a 64-bit mask never fails if
> dev->dma_mask is non-NULL.
> So, if it fails, the 32 bits case will also fail for the same reason.
> 
> 
> Simplify code and remove some dead code accordingly.
> 
> [1]: https://lkml.org/lkml/2021/6/7/398
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/i2c/busses/i2c-amd-mp2-pci.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> index adf0e8c1ec01..f57077a7448d 100644
> --- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
> +++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> @@ -308,11 +308,8 @@ static int amd_mp2_pci_init(struct amd_mp2_dev *privdata,
>   	pci_set_master(pci_dev);
>   
>   	rc = dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(64));
> -	if (rc) {
> -		rc = dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(32));
> -		if (rc)
> -			goto err_dma_mask;
> -	}
> +	if (rc)
> +		goto err_dma_mask;
>   
>   	/* Set up intx irq */
>   	writel(0, privdata->mmio + AMD_P2C_MSG_INTEN);
> 
Acked-by: Nehal Bakulchandra Shah<Nehal-bakulchandra.Shah@amd.com>
