Return-Path: <linux-i2c+bounces-14146-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE2AC69F0C
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 15:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9E92C3471ED
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 14:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763F33590BA;
	Tue, 18 Nov 2025 14:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="owUnRFL6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012048.outbound.protection.outlook.com [52.101.48.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625742EF64F;
	Tue, 18 Nov 2025 14:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475563; cv=fail; b=Ic8qSf+r/+UQqmmh9ddyR5+RsRTuqL30HWhOFZmSZfU81/nignGyFoSoYaY3kRzJK4C6A8GZste7+ChYFw4/LaPtCeGtxto5FXSuncFJD5q6pTKLVBJvzGYpI5CP15SajV37HVUcaa1QN+8gSkJAY0WCD6TyYEhUmlHebF8P0nI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475563; c=relaxed/simple;
	bh=t7aQEc6amhX7nxvljRyXSuu+CxFjY1iXhzrgo/7mHU4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g7bnyq6cKHU3nG+5Fy2KX6Dl9gyxcT0KGCres2a3YAu+tzA4MeD+k99MOt4GXnePxDvQ9PmqaB1j8n4GDm/0s4cunfk/vQ+VIpptgSQz+mWqKEv+y3TGQrWWbZzalRi9ua7fcq+7kmcKLSIIB7PLaRNKl/H58PXVAhTd8p1mskE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=owUnRFL6; arc=fail smtp.client-ip=52.101.48.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQy678AZ3GLpz2oQwKo20CIshTWpprHfiv0y8bi3GlFdrBY6i+kjUw2x777iP0HOI5uBjLd5j1621Y6vVW+7zgNbr6uC5MOtiCc9tXHTzGfvseixlkBg1Ta5rdCp5/+DRZtj3PG+iIG2E0yKs2fW6J6L+vKu6XO3DIQv/VQu0oSoccO5cy1LSxP7CvUTHn95+3od5r9UQTY2kBRNDzULTEygWQ1YWaDi4PWrSxAq14Ru4mV0HmMOsNNpIhC9oCZGT6L1LrEw+AIThBdogK4CcCBl5DjqZMjen2ZH4tR7c0WQY8+1CfA/41PmWHCXgniwLeMcjYKO1zSuKAGweaeTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMePAoUUg7S/+r8/1U1Wri+v/EC9wuEB///JKbnZ2dw=;
 b=gUf7kdhkYaHGA+MZ8LAxKa1EbWFlYTQCQxJ/UBLcnLx+BuY/ESE719Zbcd2anxmX50TNCHcdRwzjCy2dlIm2xsqmRSSf+cs8W/DRvLs9bI2Zmnc+3JE9CM8xY2Jsih15drniq1J/NSkWGbmc0NBYXp/KiLgrfscef7qQI3HYycKOjMSzXJ2aTai4s0b+07fclAPl2UgCBj6/KwYz/7oXSYnRRfrOO/S61alAKZX/G7fuQsc/H803X6RZOoHOK8wvwFX8bvzr9ACaoCm8vKD5zursWz62wxYlkIrgXg0TnehXQPxIcmFp4IfQ25msREDeS5YsBs9ek3RXUgBF19ctIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMePAoUUg7S/+r8/1U1Wri+v/EC9wuEB///JKbnZ2dw=;
 b=owUnRFL6ecxWKz9dMeAvTK7hzRm1k7vmPA0HSiC5gHlk1Y4H1BBObfEXvyoljNhMP8ME8Ii4x+nVZtolTAN9jMacUW30Sur1jk+MSZ9RcxAEAMzAUycq3l5SckrTlB4Sx6NfQUrAN3ZbYFXpriDpj708RpkNyBuuF73GCnrkDgFFZTi2UXvepI/TY1/fmL3d/YeWwG0mZRaLGH2gSj6nl1gB2H4Sz3mD1D40cuj+S+qqcZUmMzr/ZS9tq/R/oZW5+PxJS1keGI5LBVsOO/si45DEZQpKMpUaQt7TDO9/PulcK5qrpUCthAmdo3awTdXhu4/3QfQQnBeq8loAOjf2BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by BL4PR12MB9724.namprd12.prod.outlook.com (2603:10b6:208:4ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 14:19:18 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 14:19:18 +0000
Message-ID: <2293baeb-cadf-4948-83ed-ec332941a958@nvidia.com>
Date: Tue, 18 Nov 2025 14:19:12 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 4/6] i2c: tegra: Add HS mode support
To: Akhil R <akhilrajeev@nvidia.com>, andi.shyti@kernel.org,
 digetx@gmail.com, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 wsa+renesas@sang-engineering.com, wsa@kernel.org
Cc: kkartik@nvidia.com, ldewangan@nvidia.com, smangipudi@nvidia.com
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
 <20251118140620.549-5-akhilrajeev@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251118140620.549-5-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0307.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::31) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|BL4PR12MB9724:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e4089d1-a348-4e6a-7ef0-08de26ad75ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXNtamZjUldtVitNTWNaUTVXekxIc0FiN2U1M0lDTU5EbTFQRXRiRDVKQjg3?=
 =?utf-8?B?VTdJTHFRZVFNam0vNXpVa09oUC84S1lXd2IzU0tTMlFpRW83R2luRlZ1cUdQ?=
 =?utf-8?B?Tm56c0pucGhEdjVDMjY5UEZhZ05mb29rc2lmTFNqcnFPeVJLQ0ZRRWtLekUz?=
 =?utf-8?B?MWE0NjFQcC9XeHRCSzdFaERSWTBVbTYwbjZ3OEo3MWZUaVMyMm00WFA3YU00?=
 =?utf-8?B?cTA3NHgvcCtmKzVvczNHbUdONExUaGFwRjc1ZTRmU1VZL1JUZCtxM29MMmpW?=
 =?utf-8?B?aHYwZCthdGxXU3V4MHVLc3pQMy9MMlorL1dUeURyY0xPdnVDMGJZUG5UMUtp?=
 =?utf-8?B?aUtCOUhXeGpTOEVhRjh6dmd5S21rRkpBZklNZDlNaWVMSlRSc1hmNzE0QVRL?=
 =?utf-8?B?d3BzWmFXQXliTktiSnRwYmkxQnoxakNVaEhvZGtWd1luVGNMZWM4MFpnYSt1?=
 =?utf-8?B?TW5COERBa0ttNkFXaW9mOWVGWGVCZ1dEcGRXRnQ1TnhuU20xbDV5c2dUN0VV?=
 =?utf-8?B?c1Rqc3dGZjU1N1BWSjNCSGNlc1g3cHd1amhYUnAwV0ZUYmJDeGlJazZ5WVZN?=
 =?utf-8?B?eW5tN1JtZVBWTldmSWlhSHk3NTNTM2dQaTlES2ZwMWJVS0lWeFhNcGtGYitx?=
 =?utf-8?B?TGlmT2ZFa1ppdGdMMzlhUkdvSTl2WkJtWmFhWmdWakdxdWI5MTJJUy9OWFd6?=
 =?utf-8?B?eG5zNE93OEx1VnZjUmhDa0I5KytpaTZaV2c3dGthcENTYkxMcE1BZkhvUjZV?=
 =?utf-8?B?SUtGb3J1T3J0SW5sYWZlUFpxdE0rUVVyc3dqOW84Y0xJT1JjYU1DUllhWXI3?=
 =?utf-8?B?VTB2Z2t1V29yYjhvV1l2OXRLd2NibXg1d29MRVQvWVlWV3FnbnRGNlVqZm9q?=
 =?utf-8?B?TlFPVzZRR2JCQ3pna1JhdlhwaTZuV3JCM1ZFRmgxaGxDMXhiQnRMTjl1TzF0?=
 =?utf-8?B?M1VlbllDK3Zaem0wcVgxWWQwVktJdVZPSmZBWmovRlJVREQ5WGwxbVBRRFN3?=
 =?utf-8?B?UEZoaXd6ckRueUw3UGFDbkNDOEF1clFQSjJ2SGF3UEZtQmk5dGlyc0FrblZW?=
 =?utf-8?B?d0pJZ3R1eDRjbkJaYlhuSmp2dVdlbGpHbWIyUnRvWG9qclQ1a0k2TmVnSldQ?=
 =?utf-8?B?NVMzNkVYWm9zbEJjRFFXK1kvb1MzWi9EeFVRRnJoK1hBUS9FYUVabTZweFVt?=
 =?utf-8?B?N01ZRTdLbUNGSHowSkZJNC84cDV0MXBRTVl2Z2sveFRpMlZtUE4xY3R3alVP?=
 =?utf-8?B?NEZMMmpMWWErcGxnZ3YvZWFkTkxneng0aFhZbmVPYTBCdklXeU5HM1RQTDhS?=
 =?utf-8?B?UHp1MVMreTd0Z2xpRytUTFRidnp0STFFN2I4RGpZRG82TnIwaDFhaFQ5dFFW?=
 =?utf-8?B?Q0VJSGxQa2NNQkl6OXovV1ZzWEtTL24xeWQrNEs2eFlkODdQNllGMmNKQmVS?=
 =?utf-8?B?T29PYStYSkk3ckt3QzRKcTNHa043c0FHbXJxWnNoV21BSVprc1NMUzVVU0JC?=
 =?utf-8?B?YjBYOWtIL0NSaTZ1bE1pb2t1b2dvS1hpQ09BK2Nzc09CL3JBbGk4R3RrSzVI?=
 =?utf-8?B?a1B4THVhMGpIbjVzUmwrblM4b3VVd1dmNys4Y1VKY2tXN3M0TWhyWHloSFZQ?=
 =?utf-8?B?c0hPcnJhaFZKUFBuUVg3MDdmY1NXZHBUbk8ybFlIVTRSbFd6ZElDSVlYdi9K?=
 =?utf-8?B?bXpoTlBuS3JQMnRrZktXbXA2MDNuRGhXdjY1aG1QWmMzY3RuVU5aenlDK1I4?=
 =?utf-8?B?SFFscy82TEQvUWZub1lURWl2M3h6WmE1RnNKcjZWdHVEeFYxRFM1YnVUMGRO?=
 =?utf-8?B?d2t5Vi9RVjMxZVlINENXN2FWTWVGeW5ReEVhOWlSSHVTeS9lcXE5Ym5kRkY3?=
 =?utf-8?B?cVhPcTMxazZrRWtUS1cybzgrZ2dMWmJMWnlGNncyREJuOS9hY0x2TDJNeTJG?=
 =?utf-8?B?ZWhWMm5SMmRoaHg1cUpsenpiT2xjR3p0b0lsZ3V5VTNzaWxkalVOMDhFaXg0?=
 =?utf-8?B?SnJDUXpsOFFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2ZRdTlwK2Vmblh6eWs3SnEvbXMrUUFtY2NLQ001UjdXQlMrL3pKNUYrN2hH?=
 =?utf-8?B?ekxOeE5VTFdIVDZ1S0xqQk02VzVTVm4zUGQ0eUhiRlhCZzhucmFpdmp6WUp5?=
 =?utf-8?B?TVRqdldQeUU4ZTNXbVNSdUpOZWxJZEttd2hnY1ZQZS85REZMR2RHaVIxUU50?=
 =?utf-8?B?T29XTmIxRngzWTZtTkxkWkxlVGt3bzdRd1Z6QTIvMjVUcXZTNTFQdXVxcDlP?=
 =?utf-8?B?M1JLTUhxTnFrN2ZlUmdyY0tjNTF4NzhOUFo0V0w0OU5KWEtLL3RkMVVvSlVR?=
 =?utf-8?B?OHVIbWZad0ZGSit0aU84T0lzZi8zRk5lVCtTOG1FVEZQWHlyc0dBR05QaTJW?=
 =?utf-8?B?eWdSOEZtSVpJaDRXVEtXdEJjOUVGdzBKWExNcG9aeHFwa3FITTJEckpsV0FD?=
 =?utf-8?B?SFQ2d0N3dmowbjRDR09EVmNMZHUrdWFoN1ZLSm8xSzZza1lOS1Z4cXZnUFlZ?=
 =?utf-8?B?aTgycEg1a1JOcmZLQ0x3RDI2SlVVSWxVOW1qZ0cxWmwxY0xBaXBoanRqeWw2?=
 =?utf-8?B?WGtUNmcvRTdQclo0SmRST25DTXpHc0dZd2RVb2tTRGlQOHEwUG9ueVZrc1kw?=
 =?utf-8?B?SkdLSERNTGQrNXVoRDRkSlhHK2hTTXlZTjNnQXV3VEl6QXd6c1M4NDFERXpy?=
 =?utf-8?B?emxzSGU4a1k0S2ZKNjMzQUFkUkpvV2NmVjhCUHQ3SWZXRGpnUFZSSllmeTZH?=
 =?utf-8?B?VTlLMHltenRrOGFsQldpWURTbTdjdlc3RTFqVGgwTnFsV2s1aXNkd0VvbEhV?=
 =?utf-8?B?UERaVVdad1ExQXppVXZ5VHd6bEIwUTM3QWtNYjcvRHIzeEVManFwWStGOTht?=
 =?utf-8?B?blVOZHNPK1YwUVQvSVU4cWhlTlNzMTlRcjhWRDdKdWQ4enlhSTNocGFRczlT?=
 =?utf-8?B?OXFLbjdta3VmZlYxNlgvSzR6S0FqdU55ZnUvRjNBSWZxOStPeHNpZXh6NGJR?=
 =?utf-8?B?Q09vSHRWNXJOc3laQnc4VkNjZDZlSFdxSFJyWms0WE1md0VhZTBkelRWL1Nv?=
 =?utf-8?B?TkQ2L2FrNkNTOCtOL0twNUhVejRJcmkzRTN5a1JBQmc0UmxUcjVRdURTdDNB?=
 =?utf-8?B?aFNZdFNJdzhTUEF6MDN4cks5bzdYUjhYRE0zV04vWTI0bnQwTEx3dWZZb3Vp?=
 =?utf-8?B?V0VJaW45UWhDK3R6Q25GVU5WaURqM0p5NjVqMkw0dFN5K0dIcTNmdm5kTFJT?=
 =?utf-8?B?UDdYMmdBeWpOcElmOGVQeXRKd0hOUi9jY0RzNFRXR2FTRTd2Znh3aGEwbGRP?=
 =?utf-8?B?a2dydTVzeHo5SCt6MnJDZXNmZStJeVIraXhOQVlwRXhseFZ4Rm1EUnhnLzBi?=
 =?utf-8?B?R05oL0tOSXQ3YXNOV1czQUdDU21tQVIwU0owUnJ1NkJoV3lsRlFBL3A4Sk1l?=
 =?utf-8?B?TGxmalBXeGNISnBHSGVtVlNuTE5ELzY2UnVta1pzdXBWalVTK0lYaHdnL0dH?=
 =?utf-8?B?dXF0K3FoWUwrZ1FUT1kzUmFPYkxuYXZzUGdNbm01YjJsYUtmNzFpbDdMZHIy?=
 =?utf-8?B?TitzejJCQ2cwQXdkQnFBdktiTlpBZW4vUDd3bG9CZjhLQThXRG9uVk5IcFFw?=
 =?utf-8?B?M0huYXJUVGVDYWlxaFVsQTg1T2dZR0ZKNUN5YWRWeStHN0RpSVRrRk5CSlJD?=
 =?utf-8?B?NzlpTXJTSWhSOXlMTGxqU01ueFBmY2NxdmNXb2Y5bk5WNnlwMnY1bEhzRU16?=
 =?utf-8?B?VDlpTnNUS2xCcEhHc3FONVAvV2hPZ2N4NEVSWU0rR09pb2FHN0EwTDFwS0pC?=
 =?utf-8?B?TUpoYlc0cDI1RkwvSmJrTlZDQnk5ZGdxb0ExcHppRWEvb2puRWRkZGxHMUVl?=
 =?utf-8?B?WnozRHJmLzgxUWtqL1QxMVdlbEE3QXdxdGk5dUlwaXdhb1krakRQUkdIN0Nw?=
 =?utf-8?B?WkRkV0FnOHREWjQ4ODJ2ZEphQ0RjQ3VkYVdXTkRVYWxRR0Y5bTNXWkZHcFN2?=
 =?utf-8?B?ZUFKcGxmcFVESVp0SFN6SS82Yk54TVROSjVWakh6aEQ1Uk5VT2lTS2dEc0gw?=
 =?utf-8?B?TU9zb2kzVmthKytmOFZiSWVCMDFTYzZwcE9OMUR5dC80WWtoSEJlVlVkRGNm?=
 =?utf-8?B?TGh2UkxOMnFnMlVXNnZVWEw4YWQ4Ynl0aUJtbTlVeXNXdGk5ZXljditEWTBE?=
 =?utf-8?Q?SouGhh8+yn3uFX34t3O0Pxap6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4089d1-a348-4e6a-7ef0-08de26ad75ac
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 14:19:18.2358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8suulokoliC31OdHoUyp3oMT/0jmnXcpY+YaOMKMbjjRZmNyebkaoQlspjN6UAk+9awZuUjqd4OmizHhi6AoVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9724


On 18/11/2025 14:06, Akhil R wrote:
> Add support for High Speed (HS) mode transfers for Tegra194 and later
> chips. While HS mode has been documented in the technical reference
> manuals since Tegra20, the hardware implementation appears to be broken
> on all chips prior to Tegra194.
> 
> When HS mode is not supported, set the frequency to FM+ instead.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v12 ->v13:
> 	* Update has_hs_mode_support to enable_hs_mode_support
> 	* Update the commit description
> v11 -> v12:
>          * Update bus_freq_hz to max supported freq and updates to
>            accomodate the changes from Patch 2/6.
> v10 -> v11:
>          * Update the if condition as per the comments received on:
>            https://lore.kernel.org/linux-tegra/20251110080502.865953-1-kkartik@nvidia.com/T/#t
> v9 -> v10:
>          * Change switch block to an if-else block.
> v5 -> v9:
>          * In the switch block, handle the case when hs mode is not
>            supported. Also update it to use Fast mode for master code
>            byte as per the I2C spec for HS mode.
> v3 -> v5:
>          * Set has_hs_mode_support to false for unsupported SoCs.
> v2 -> v3:
>          * Document tlow_hs_mode and thigh_hs_mode.
> v1 -> v2:
>          * Document has_hs_mode_support.
>          * Add a check to set the frequency to fastmode+ if the device
>            does not support HS mode but the requested frequency is more
>            than fastmode+.
> ---
>   drivers/i2c/busses/i2c-tegra.c | 59 ++++++++++++++++++++++++++++++++--
>   1 file changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 470d0d32d571..b2fe8add895b 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -85,6 +85,7 @@
>   #define PACKET_HEADER0_PROTOCOL			GENMASK(7, 4)
>   #define PACKET_HEADER0_PROTOCOL_I2C		1
>   
> +#define I2C_HEADER_HS_MODE			BIT(22)
>   #define I2C_HEADER_CONT_ON_NAK			BIT(21)
>   #define I2C_HEADER_READ				BIT(19)
>   #define I2C_HEADER_10BIT_ADDR			BIT(18)
> @@ -200,6 +201,8 @@ enum msg_end_type {
>    * @thigh_fast_mode: High period of the clock in fast mode.
>    * @tlow_fastplus_mode: Low period of the clock in fast-plus mode.
>    * @thigh_fastplus_mode: High period of the clock in fast-plus mode.
> + * @tlow_hs_mode: Low period of the clock in HS mode.
> + * @thigh_hs_mode: High period of the clock in HS mode.
>    * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
>    *		in standard mode.
>    * @setup_hold_time_fast_mode: Setup and hold time for start and stop
> @@ -210,6 +213,7 @@ enum msg_end_type {
>    *		in HS mode.
>    * @has_interface_timing_reg: Has interface timing register to program the tuned
>    *		timing settings.
> + * @enable_hs_mode_support: Enable support for high speed (HS) mode transfers.
>    */
>   struct tegra_i2c_hw_feature {
>   	bool has_continue_xfer_support;
> @@ -232,11 +236,14 @@ struct tegra_i2c_hw_feature {
>   	u32 thigh_fast_mode;
>   	u32 tlow_fastplus_mode;
>   	u32 thigh_fastplus_mode;
> +	u32 tlow_hs_mode;
> +	u32 thigh_hs_mode;
>   	u32 setup_hold_time_std_mode;
>   	u32 setup_hold_time_fast_mode;
>   	u32 setup_hold_time_fastplus_mode;
>   	u32 setup_hold_time_hs_mode;
>   	bool has_interface_timing_reg;
> +	bool enable_hs_mode_support;
>   };
>   
>   /**
> @@ -646,6 +653,7 @@ static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
>   static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>   {
>   	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
> +	u32 max_bus_freq_hz;
>   	struct i2c_timings *t = &i2c_dev->timings;
>   	int err;
>   
> @@ -684,6 +692,14 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>   	if (IS_VI(i2c_dev))
>   		tegra_i2c_vi_init(i2c_dev);
>   
> +	if (i2c_dev->hw->enable_hs_mode_support)
> +		max_bus_freq_hz = I2C_MAX_HIGH_SPEED_MODE_FREQ;
> +	else
> +		max_bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
> +
> +	if (WARN_ON(t->bus_freq_hz > max_bus_freq_hz))
> +		t->bus_freq_hz = max_bus_freq_hz;
> +
>   	if (t->bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
>   		tlow = i2c_dev->hw->tlow_std_mode;
>   		thigh = i2c_dev->hw->thigh_std_mode;
> @@ -694,11 +710,22 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>   		thigh = i2c_dev->hw->thigh_fast_mode;
>   		tsu_thd = i2c_dev->hw->setup_hold_time_fast_mode;
>   		non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
> -	} else {
> +	} else if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_PLUS_FREQ) {
>   		tlow = i2c_dev->hw->tlow_fastplus_mode;
>   		thigh = i2c_dev->hw->thigh_fastplus_mode;
>   		tsu_thd = i2c_dev->hw->setup_hold_time_fastplus_mode;
>   		non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
> +	} else {
> +		/*
> +		 * When using HS mode, i.e. when the bus frequency is greater than fast plus mode,
> +		 * the non-hs timing registers will be used for sending the master code byte for
> +		 * transition to HS mode. Configure the non-hs timing registers for Fast Mode to
> +		 * send the master code byte at 400kHz.
> +		 */
> +		tlow = i2c_dev->hw->tlow_fast_mode;
> +		thigh = i2c_dev->hw->thigh_fast_mode;
> +		tsu_thd = i2c_dev->hw->setup_hold_time_fast_mode;
> +		non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
>   	}
>   
>   	/* make sure clock divisor programmed correctly */
> @@ -720,6 +747,18 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>   	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
>   		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
>   
> +	/* Write HS mode registers. These will get used only for HS mode*/
> +	if (i2c_dev->hw->enable_hs_mode_support) {
> +		tlow = i2c_dev->hw->tlow_hs_mode;
> +		thigh = i2c_dev->hw->thigh_hs_mode;
> +		tsu_thd = i2c_dev->hw->setup_hold_time_hs_mode;
> +
> +		val = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, thigh) |
> +			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
> +		i2c_writel(i2c_dev, val, I2C_HS_INTERFACE_TIMING_0);
> +		i2c_writel(i2c_dev, tsu_thd, I2C_HS_INTERFACE_TIMING_1);
> +	}
> +
>   	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
>   
>   	err = clk_set_rate(i2c_dev->div_clk,
> @@ -1217,6 +1256,9 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
>   	if (msg->flags & I2C_M_RD)
>   		packet_header |= I2C_HEADER_READ;
>   
> +	if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
> +		packet_header |= I2C_HEADER_HS_MODE;
> +
>   	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
>   		*dma_buf++ = packet_header;
>   	else
> @@ -1508,6 +1550,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
>   	.setup_hold_time_fastplus_mode = 0x0,
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = false,
> +	.enable_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
> @@ -1536,6 +1579,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
>   	.setup_hold_time_fastplus_mode = 0x0,
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = false,
> +	.enable_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
> @@ -1564,6 +1608,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
>   	.setup_hold_time_fastplus_mode = 0x0,
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = false,
> +	.enable_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
> @@ -1592,6 +1637,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
>   	.setup_hold_time_fastplus_mode = 0x0,
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = true,
> +	.enable_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
> @@ -1620,6 +1666,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
>   	.setup_hold_time_fastplus_mode = 0,
>   	.setup_hold_time_hs_mode = 0,
>   	.has_interface_timing_reg = true,
> +	.enable_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
> @@ -1648,6 +1695,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
>   	.setup_hold_time_fastplus_mode = 0,
>   	.setup_hold_time_hs_mode = 0,
>   	.has_interface_timing_reg = true,
> +	.enable_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
> @@ -1671,17 +1719,20 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
>   	.thigh_fast_mode = 0x2,
>   	.tlow_fastplus_mode = 0x2,
>   	.thigh_fastplus_mode = 0x2,
> +	.tlow_hs_mode = 0x8,
> +	.thigh_hs_mode = 0x3,
>   	.setup_hold_time_std_mode = 0x08080808,
>   	.setup_hold_time_fast_mode = 0x02020202,
>   	.setup_hold_time_fastplus_mode = 0x02020202,
>   	.setup_hold_time_hs_mode = 0x090909,
>   	.has_interface_timing_reg = true,
> +	.enable_hs_mode_support = true,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
>   	.has_continue_xfer_support = true,
>   	.has_per_pkt_xfer_complete_irq = true,
> -	.clk_divisor_hs_mode = 7,
> +	.clk_divisor_hs_mode = 9,
>   	.clk_divisor_std_mode = 0x7a,
>   	.clk_divisor_fast_mode = 0x40,
>   	.clk_divisor_fast_plus_mode = 0x14,
> @@ -1699,10 +1750,14 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
>   	.thigh_fast_mode = 0x2,
>   	.tlow_fastplus_mode = 0x4,
>   	.thigh_fastplus_mode = 0x4,
> +	.tlow_hs_mode = 0x3,
> +	.thigh_hs_mode = 0x2,
>   	.setup_hold_time_std_mode = 0x08080808,
>   	.setup_hold_time_fast_mode = 0x04010101,
>   	.setup_hold_time_fastplus_mode = 0x04020202,
> +	.setup_hold_time_hs_mode = 0x030303,
>   	.has_interface_timing_reg = true,
> +	.enable_hs_mode_support = true,
>   };
>   
>   static const struct of_device_id tegra_i2c_of_match[] = {


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic


