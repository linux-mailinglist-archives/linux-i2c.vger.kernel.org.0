Return-Path: <linux-i2c+bounces-135-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 205CF7EA261
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 18:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D43A3280E6A
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 17:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636BB224F0;
	Mon, 13 Nov 2023 17:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YFGbfB/+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0B120326
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 17:50:18 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE191702;
	Mon, 13 Nov 2023 09:50:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOLmyTI6D4xX9jPqMCT0vrR2t7/TALMHHv7k4ALVx7hslIZrDJ6Ah65NmxFxBZVl0kVjLuON4dtLXzQyvSi0O4l3tlkg6N66bLBoTMT79Kz6QWMdc96a1stDwnfRW/SRdlLjM74H45m2bbCgMUYo27hjYxcqRWPDLlrbhXku/XkJ0K1vn4Wl10KiCbz3LRxqF8iWyFx/43BAmd9as/w5IaZ1IkupLnVV07Z1OUw0+5vuTdSMWit2fUpJMt8VY4KSqRzJmVyJmHpVOPUU8edh5ELmU0pxSKJaXtlZ02fuZCQtOonYMqiJ3fPCfHoIpdcv2wLAHonyESqJOTvqU1ktGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FIFK1p5w59lqcFSpPuI2P+kMk+4Adz5i2Q/JR33PEk=;
 b=c8jye0Q549f7IC9C4vbWaVkvuUfrMlU+xLwS6pOfBwxcoTisCGCuTvjbnvbmMPVYuQ3bC5s0WKB97m1kIAA8Ahco0IhD0Tl5So6+t08/PqNfcJvDdxUISe68WAk6T21xzVh7xAAbXCOJlX/3RaA9gJw3ZMnNOr1Wj9fzJ2wQ0VLknJe52Lu28WIBbxm9dWg83lsWkqyAwC2ExMGDZqg86cnDHgDQTebypa3FAKSb/ORC26mF5gixaNPKZ4/WIfL9ytZ/ObghvSty08L523XuBw84UZXZ824qH1UNZXx4NQD4/0fDGDDJvMlBCLRVQAlKyA+JcXRVE7U/TvIQTvhKSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FIFK1p5w59lqcFSpPuI2P+kMk+4Adz5i2Q/JR33PEk=;
 b=YFGbfB/+V2yaZ0QXDHna9Ia+/jVEBA3OJHbnJLwo2ivuA7dohfMCX8PRdAul3WsoRCddEv/IV03MLhzubzwAM3ontWrN7N/JgVQbBdr/U3/w3HgvlVEKJpMug3qXH3jhFUst6N6VnTDBH7r5wg/rZ85rsbBxp/ghasehomNSnVM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 17:50:12 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%5]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 17:50:12 +0000
Message-ID: <e4ee224f-8f18-4922-ac1c-4612b8e021d8@amd.com>
Date: Mon, 13 Nov 2023 12:50:07 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:
 remove I2C_CLASS_DDC support
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20231113112344.719-1-hkallweit1@gmail.com>
 <20231113112344.719-4-hkallweit1@gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231113112344.719-4-hkallweit1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0083.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cdadf2f-e9af-40b0-205b-08dbe470fc50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hZmhONiKyBCPbQWL1Yd8kWcouI/CKr8ZNF7TBQjKb91gGkRDKY7YeaNNxn2nHzNue9+/SN9JJ1zQfrPVeNOseopLjE/DFMH34l70ipaq1byp3tdHDJy7D3DYapXAJ/vY3mPOlLmbQa3eIHo8JBWhsVoBnnpWim9tW6QhEBqdiO9u0OGJf+LLfol/K6Axqy1N3Wt7nmdYa9XqVZK1HJUcRSmj6o3Zh0RwzrdZ/7yL7zGDoRWvgNTO/NmA6hTOstoUhFRTY7A2DTb2ams0Zt/BvPQLJfIwdohWaji45FryZw6XfAf08oyYPXI4g5a6l/XiTFfjdpk0rGibuPnLcUHwFNyFWodfYZTcqRRKF5KMtEp7KITELkx51+jkbWF7T7mjzVI60g/zlC8SflWEJnuOU1t6SHdWftwKr61O7+XzSab/uER+4n8+U7sEsavKWLBZsP6uUOm6M7iAsMpeuvRLpIULAQkbb2tcCgScbPntHjYu+NSAR5uSz7VORqHdY+t3lpYZKEaosRxqRtn7tOlLTHM9WhMmC2L9ktGemwh87z3ktsejpDqiOPcLQ4+ynfDzNaBh2m7tKtUSgK4T5RDrm+Ggz1WSMFsqzlV+lDcgWH3/fVIk5yAXGnYruKMjEWfm6HSCQb3UwLmJqNmfnosZyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5427.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(366004)(136003)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(31686004)(41300700001)(6666004)(8936002)(4001150100001)(26005)(2906002)(6506007)(53546011)(44832011)(6512007)(4326008)(8676002)(83380400001)(38100700002)(478600001)(66946007)(66556008)(66476007)(2616005)(5660300002)(54906003)(6486002)(86362001)(110136005)(36756003)(31696002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0x3Rld1dzFBSE51ajcwZ001TnVQWFc4ZmJNTFVocDlSZUhnNUFmN1RWOXpw?=
 =?utf-8?B?bmNxVk9WTVprVWVJb1o3ZFN6aUVheCtxdmFNTzhBdHN6bWRUWXdZUWprN3ZG?=
 =?utf-8?B?WHY1dGZ0SmhpU0xkK3R6V2dvZ3paWitMQXA5WHpRRXMvN2RZMFZ5UndtbnJ0?=
 =?utf-8?B?RGJ0V09PejB3MWtCNXVkQU4rVk1Ydjh3Z2szcHRuamFuZ2plc0s5VzBxWnBU?=
 =?utf-8?B?VkpEUUZKY1ZBYU8xL2tyMS82RTA1NU1vT3NYY2Mxamh1QlNYL2ZMYWRtMzQ5?=
 =?utf-8?B?cEpwVGRsSHZYYlR6d0JzOERBNnBSbTFnNEsyTHBkVWtNY00rTEdqNDBaNWo0?=
 =?utf-8?B?engzVTNwbVEzaHF2V2RiaDBUNkt4QUpHMVNLSDdPaXVTcGNzSmZTekZyTlBP?=
 =?utf-8?B?QzJRakNGTFo4WUZjQitIUHpwbFdYQThoMlR1S3oxS1VqcVVCOENMWHVYTzdx?=
 =?utf-8?B?SU1YRjJPU2F1RzFQUHc3aEVBMnBGWUVabHRrdnU0cE9reWh5MHJXUkl3OWUv?=
 =?utf-8?B?NjlFTWQ1SU9wUlJybi9aZyticllIdzVFTVFleU1mUllLWk5uNFYyeWQ2aXlO?=
 =?utf-8?B?ZmZJUWJCSUZZN3RYV0NDakh5RWYzMlFYTkMvdHdET2Z5Q0lrNHI3WGpNWlVV?=
 =?utf-8?B?STkzUHlsQXhZTG50NzNaUDVMaXhYN3BhR1o5b1dWSjRGOFV1K080SEc4NnQx?=
 =?utf-8?B?cDlhWmxaRzd4ejk2bSt6WUo5a3NxcnRhM3RXWStrV0E2UFlPdFk2UlFhU3Vw?=
 =?utf-8?B?TnB0Q0xUZTgrSjRWQkhESEV4OEx1R2k4RXJWK0EzYThzRVdEYXNsQVIzd01N?=
 =?utf-8?B?czZ6ZWprNHg4dnA4SW10MXVaY3NmMncwS2Q4WVNvSWhhWHZUbEY3SW1XZzcy?=
 =?utf-8?B?NzVINVV0c2tmQXJyMGtGYmlVWWJLaUxJQzdoaEl2dmd2bTZrcXBRRXNWRDVk?=
 =?utf-8?B?ZzZuS3JuR1JNVEdYN2JnZzVoM3lVM0tqMnBoRUp0a0Z4bUwrRnhkWUI4ZFM4?=
 =?utf-8?B?RXJIaE9jWGt2UC9talFDclJqU2RwbTdIL2luNVZ2VFNiN1JRcUZoWDBkaGdZ?=
 =?utf-8?B?My9NRzh4bzdoV05NazQvRTlYcDA4Y0ZzTGFuL3Boc3pXYW5XMmRJblRTVHRp?=
 =?utf-8?B?M09YVWFPZ3lnb2Vxc2lTMWh0SnRoWmM5QTNVNHdOQmdVVlhiMGVIaEJsOCt3?=
 =?utf-8?B?MmVKZDFkQUJkdmFSdlRjNjNoQS9ocStMYWdZNlBuOGdBM25hQ3F5dmxlL0J3?=
 =?utf-8?B?aCt1aGRISDg3anhIQXkvSFJCbnhLOTJYZjh3RG1aZ2pyQXJWeFZSN3drT2w4?=
 =?utf-8?B?bnoxRmVTenl0dWdodXdlWEdIUlNRYXJoTlk5L2hhK080SG5saUs0a3lVSWVm?=
 =?utf-8?B?NUQ1cjRzMjI0LzNoMnlqYWpwQjJQQ0c2U3FVMmxDeUxJeDhOTDdqTWYwM0ta?=
 =?utf-8?B?bCs1bXFmSUdsZUpJdFJoa3JYNmZWMDZwbDJZdjVHeSswZFdRKy9zSC9JMUtu?=
 =?utf-8?B?ZkM3MjcxUUNyRFR0eGdkZFEwcStuM2dsWHlnMXIrVzBwQ0xIMkF6cXdYQ2Fk?=
 =?utf-8?B?WGNRNzFqbUM3NU05VGIzbGFJT05WbU5lK1NkSklhNW9pWmZLSGpPbFVIOFhC?=
 =?utf-8?B?VHgrRU5qd3VlbGFPUVVFd1c4MW5Ncko2VW9iSzRyRGtsaEx5MXd1ejdzU0hV?=
 =?utf-8?B?SGRyeHJzOFpOTzNjdGFhSlRvL0twSk1lY3VoQjdENkxVRG1EZFRFYWYwSk9I?=
 =?utf-8?B?UExLUEFHclA5TTNYV2F5N2J2OHFVWlgzbXg4RlV3dW5pbVp1M0xTMFExQ05S?=
 =?utf-8?B?ckxlb0VIaFRqT1N2dW11bXdBZTBnc1BIdlI2OTZFbWxTaURSWUc5eVlVNXJr?=
 =?utf-8?B?c0Z2R3VQSUxXQlRVNE1tU3ExSTgrc1c2L3lOeDlxdnVVV25yeTR2WTJaa0Rq?=
 =?utf-8?B?dk5MbzhCanVkOFpEMTU5QmsrNVU3TXVXak1VdVZhR05RMWZ5K2tKOXdUMTlh?=
 =?utf-8?B?Rm5oV1lveDdsNWtLdXg4WGl6RTVWYU1IQlFSekxQSVVPTzhZV3VCMDZZdkJZ?=
 =?utf-8?B?amRvMW5WR1NzK21YSEhWZmxOZDNVbzduOWJlbW0vcWxDVEQvQzZzM1I0L2Er?=
 =?utf-8?Q?iDu2DMfH4BAoMsCjlkoSKio8q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cdadf2f-e9af-40b0-205b-08dbe470fc50
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 17:50:12.5637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmFv1OL0y15wGQ95B8iqd/dNYlbRuK5Nqi+XqTYc73yYMZXJRxbBrH6VAX5YMpEdMYQ4iVWkEkKlOsaxByK/Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754

Please just use "drm/amd/display:" as tag in the commit subject.

With that fixed, this is
Acked-by: Harry Wentland <harry.wentland@amd.com>

Harry

On 2023-11-13 06:23, Heiner Kallweit wrote:
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
> 
> Preferably this series should be applied via the i2c tree.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 6f99f6754..ae1edc6ab 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7529,7 +7529,6 @@ create_i2c(struct ddc_service *ddc_service,
>  	if (!i2c)
>  		return NULL;
>  	i2c->base.owner = THIS_MODULE;
> -	i2c->base.class = I2C_CLASS_DDC;
>  	i2c->base.dev.parent = &adev->pdev->dev;
>  	i2c->base.algo = &amdgpu_dm_i2c_algo;
>  	snprintf(i2c->base.name, sizeof(i2c->base.name), "AMDGPU DM i2c hw bus %d", link_index);
> 


