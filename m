Return-Path: <linux-i2c+bounces-9325-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2484FA2A87D
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 13:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D65E1665CA
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 12:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EACB22DF88;
	Thu,  6 Feb 2025 12:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="25nDpYQc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944F82253F0;
	Thu,  6 Feb 2025 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844908; cv=fail; b=YgPUHlqlkfqXqPoYdSdelFuH8guR7Q4+ITOWQeloSqstVlYiK8fp5lF4ZmWGecwcbdfCLYOugPt8sHrYZ/k+HxqRPmpNtinccC0ZCHa+CDKaCnWq8J6Yxv19VCCBq9czlySj3YD7iCoqoTByV3pqE4qic7TE+KdIqfLbhKJ5u9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844908; c=relaxed/simple;
	bh=fxeCP20wk+Cb3JpakRc9dHOW5tomU/lrX6Uu/ysQKKs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=crh+HAkbvxf0o1h9U7SDgHVqvViO6nKNp+gRt7NIR7nWzU5SGh3/h75O6Fdhr4d9T7Z4A3gK/xSuTeZC5Q6uEBnDLwgpQa+wUj7bxIZl1xJ4dtShde05mzb7FNZjKlaeOObyniIgHO0iWClkUNMrDa2GDOTdtTyiyXJOeEfe+os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=25nDpYQc; arc=fail smtp.client-ip=40.107.236.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uk1ksVdT7v+7XFZMKnslbXEbTh6E4LI6nFpkMbH0xq8ZGkYSMGkQ2n5XFKJE5arNFv8Md56ZnmjA75zmpD7Ew9dbA3OtFx/ILh0fZkygMyEjQVXVyU87sjBrNgHULSXlGSJdm2++67VXZ9hsh0WNjQEou3f/H7lunKnzOUALkRFX8jneGejOGuHvd+hr63z/DJHASSZY0jBe9bI88fuxVs/t1V7RH7HFWXGFOOHH2rwrED2No5JcKAtfhe4l9u8OP8wDD/R2GVQZesFKXnFR3qcQDZzPERF06I+rOp16kDL4LxdDpdyEY1woOyrRq0dF9fBaAvStn7XCw7dJP/t2OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/mbW8Ldq+eQQDYQxHm3sG9tuNWdBC4+XYruDjFazHQ=;
 b=H2tMEpY4oxoyNvBM9F6/8vEikdaf5I+im24wyTTY67XW8T76/9Xt3NnO9AvP7aPt8fW+Ouy9zDa2/K4qp952I/sQWTjZ2cCii4MH/+yZ+KQ/i76O9kniSLmpiiXQdU0AA/xR0ubM4b+mKz6tKh6jjqMx02BNzCT8wV1KsZDvezVyYhdm1lpcuet9+Fwtwb9s2xwKGAkrgkKXekRexbTz1TQtfLIgJQWAexlBwchV4Ypa1nDWdjvcPmSVCs6/xqYoymzk3Bc/45w8NbbWd6WvylqMCXGkjNWYG+pQGwBTHw48TN0NCsqj+Y2halTPAiQkZEmxLDff06xGVNn1D4IjIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/mbW8Ldq+eQQDYQxHm3sG9tuNWdBC4+XYruDjFazHQ=;
 b=25nDpYQcqyzLIcDL4YFOCugNFLmlJCy+uP75eBefpOkP8sixDDee/+s5TLRbmbyB27/N/ODnK9Ui2lca+97oUUNvHAhscMpehtsGVvTg/BxM0IGbmt7j8V9pLVFt9IFFiB+wxsyHXbyfYv21irQuh/NEBdSmRxQkfT5m+BwPI3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by PH7PR12MB5781.namprd12.prod.outlook.com (2603:10b6:510:1d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 12:28:21 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%3]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 12:28:21 +0000
Message-ID: <5cf2d2d4-2c0f-4993-b9b8-0934c72f1c28@amd.com>
Date: Thu, 6 Feb 2025 13:28:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Simplify clock handling and fix probe error handling
 sequence
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>, git@amd.com,
 andi.shyti@kernel.org, p.zabel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com, srinivas.goud@amd.com,
 shubhrajyoti.datta@amd.com, manikantaguntupalli09@gmail.com
References: <20250206115708.1085523-1-manikanta.guntupalli@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzSlNaWNoYWwgU2lt
 ZWsgKEFNRCkgPG1pY2hhbC5zaW1la0BhbWQuY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJkK9VOBQkWf4AXAAoJEDd8
 fyH+PR+ROzEP/1IFM7J4Y58SKuvdWDddIvc7JXcal5DpUtMdpuV+ZiHSOgBQRqvwH4CVBK7p
 ktDCWQAoWCg0KhdGyBjfyVVpm+Gw4DkZovcvMGUlvY5p5w8XxTE5Xx+cj/iDnj83+gy+0Oyz
 VFU9pew9rnT5YjSRFNOmL2dsorxoT1DWuasDUyitGy9iBegj7vtyAsvEObbGiFcKYSjvurkm
 MaJ/AwuJehZouKVfWPY/i4UNsDVbQP6iwO8jgPy3pwjt4ztZrl3qs1gV1F4Zrak1k6qoDP5h
 19Q5XBVtq4VSS4uLKjofVxrw0J+sHHeTNa3Qgk9nXJEvH2s2JpX82an7U6ccJSdNLYbogQAS
 BW60bxq6hWEY/afbT+tepEsXepa0y04NjFccFsbECQ4DA3cdA34sFGupUy5h5la/eEf3/8Kd
 BYcDd+aoxWliMVmL3DudM0Fuj9Hqt7JJAaA0Kt3pwJYwzecl/noK7kFhWiKcJULXEbi3Yf/Y
 pwCf691kBfrbbP9uDmgm4ZbWIT5WUptt3ziYOWx9SSvaZP5MExlXF4z+/KfZAeJBpZ95Gwm+
 FD8WKYjJChMtTfd1VjC4oyFLDUMTvYq77ABkPeKB/WmiAoqMbGx+xQWxW113wZikDy+6WoCS
 MPXfgMPWpkIUnvTIpF+m1Nyerqf71fiA1W8l0oFmtCF5oTMkzsFNBFFuvDEBEACXqiX5h4IA
 03fJOwh+82aQWeHVAEDpjDzK5hSSJZDE55KP8br1FZrgrjvQ9Ma7thSu1mbr+ydeIqoO1/iM
 fZA+DDPpvo6kscjep11bNhVa0JpHhwnMfHNTSHDMq9OXL9ZZpku/+OXtapISzIH336p4ZUUB
 5asad8Ux70g4gmI92eLWBzFFdlyR4g1Vis511Nn481lsDO9LZhKyWelbif7FKKv4p3FRPSbB
 vEgh71V3NDCPlJJoiHiYaS8IN3uasV/S1+cxVbwz2WcUEZCpeHcY2qsQAEqp4GM7PF2G6gtz
 IOBUMk7fjku1mzlx4zP7uj87LGJTOAxQUJ1HHlx3Li+xu2oF9Vv101/fsCmptAAUMo7KiJgP
 Lu8TsP1migoOoSbGUMR0jQpUcKF2L2jaNVS6updvNjbRmFojK2y6A/Bc6WAKhtdv8/e0/Zby
 iVA7/EN5phZ1GugMJxOLHJ1eqw7DQ5CHcSQ5bOx0Yjmhg4PT6pbW3mB1w+ClAnxhAbyMsfBn
 XxvvcjWIPnBVlB2Z0YH/gizMDdM0Sa/HIz+q7JR7XkGL4MYeAM15m6O7hkCJcoFV7LMzkNKk
 OiCZ3E0JYDsMXvmh3S4EVWAG+buA+9beElCmXDcXPI4PinMPqpwmLNcEhPVMQfvAYRqQp2fg
 1vTEyK58Ms+0a9L1k5MvvbFg9QARAQABwsF8BBgBCAAmAhsMFiEEZzUMm/XM7ptTZDVqN3x/
 If49H5EFAmQr1YsFCRZ/gFoACgkQN3x/If49H5H6BQ//TqDpfCh7Fa5v227mDISwU1VgOPFK
 eo/+4fF/KNtAtU/VYmBrwT/N6clBxjJYY1i60ekFfAEsCb+vAr1W9geYYpuA+lgR3/BOkHlJ
 eHf4Ez3D71GnqROIXsObFSFfZWGEgBtHBZ694hKwFmIVCg+lqeMV9nPQKlvfx2n+/lDkspGi
 epDwFUdfJLHOYxFZMQsFtKJX4fBiY85/U4X2xSp02DxQZj/N2lc9OFrKmFJHXJi9vQCkJdIj
 S6nuJlvWj/MZKud5QhlfZQsixT9wCeOa6Vgcd4vCzZuptx8gY9FDgb27RQxh/b1ZHalO1h3z
 kXyouA6Kf54Tv6ab7M/fhNqznnmSvWvQ4EWeh8gddpzHKk8ixw9INBWkGXzqSPOztlJbFiQ3
 YPi6o9Pw/IxdQJ9UZ8eCjvIMpXb4q9cZpRLT/BkD4ttpNxma1CUVljkF4DuGydxbQNvJFBK8
 ywyA0qgv+Mu+4r/Z2iQzoOgE1SymrNSDyC7u0RzmSnyqaQnZ3uj7OzRkq0fMmMbbrIvQYDS/
 y7RkYPOpmElF2pwWI/SXKOgMUgigedGCl1QRUio7iifBmXHkRrTgNT0PWQmeGsWTmfRit2+i
 l2dpB2lxha72cQ6MTEmL65HaoeANhtfO1se2R9dej57g+urO9V2v/UglZG1wsyaP/vOrgs+3
 3i3l5DA=
In-Reply-To: <20250206115708.1085523-1-manikanta.guntupalli@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::33) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|PH7PR12MB5781:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aea46e8-a3ee-4d0a-6da1-08dd46a9bdf6
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmYwUkt1Z1dIUUFDRGs4Zk9qcWFDcHFtQmVzWGEyRjNkaFVEQk9WSE44d0Qx?=
 =?utf-8?B?TlhuUmYrMzFKZ3FkMDVEZmRBMSt5aTJUTzJCZGlQN0t0d2ozbklNUms2NFpV?=
 =?utf-8?B?YlQ1RUFFM0R6eGt2YTBNNmUyVHNyYU9WWk1FWHNaMzNhUWZJdnIyY3ZYNlNJ?=
 =?utf-8?B?RzNyVEdsbE84dXFtS1VSK2xIS0VFenhaRlZ0dkhPVkZlRHBlaTBtRmxwUUJZ?=
 =?utf-8?B?Sk04MUpMdkhEdWxnY1lteEp6Rm16bkUwYWY2WTBZUVlmTmtkb2REd25qelk0?=
 =?utf-8?B?WjA1anNxeVNPWXBYRXZjbXl5R29rUEx6RzhSZTFJRWV3dUhKeDdwelVJZnFs?=
 =?utf-8?B?U1hnT1l6alptU1VGeGVFVU9uUFQ3SE5mN0lQV09aK2szb0g1UHdkR0Zhb1lD?=
 =?utf-8?B?eGswU3drVUNReUw5YXBXcmYzd3crR1BWOG54MGRRdDR4eDFPSG43UWRjdVNL?=
 =?utf-8?B?UjQrb1JydU5HTENzN3ZhTWl3aStNL1R1dWdwdzU0SzVUL3BZVUZTWDUwb1pE?=
 =?utf-8?B?NWtCeVpxbjcvekhXaWU5VWQvU3kxUkNJR1RDZUVvam5wekJhMzlnUGZpTU5N?=
 =?utf-8?B?VXl0cVJlV1h4ejhFYndHaWpWSm8wdk8rNkJsRDdSdHgxM2ZDdDhwUmRBSzAx?=
 =?utf-8?B?Um4vRVJYN211VGxFMVd3K2FXNkNTMzFpallVRXZqQ0dHUG5hQ2I5cXlFWXJW?=
 =?utf-8?B?OFlkU2R3WVFTUStUUldKQkIwWkFONzkyWTJ2VVNKeUU3SmYvZ2gvVFdRRFQ1?=
 =?utf-8?B?NmRqcWNJdmhUK0orNVNuT0l3dEN6aUFrL1dYRjFwSEwyWTRXT1UwUnpKc09Y?=
 =?utf-8?B?a094YXk0VlZ6OXBoaDZUVVVGZ3E1ZjJ2ejVRd0xtaFY5TnN6N1QvY1MzcXZB?=
 =?utf-8?B?UGV5YkYySmZSVDVGSmFHZUQyMEFwd3c3MStpbEpSZjFuUTQwMUFtWWpJZmhT?=
 =?utf-8?B?V0VucXBySWZIR0RvMXEzcWZTaDhIYUlWRW0yZnJmUTh3ek5aa0plRHpObjl4?=
 =?utf-8?B?RTE0SEdpNFNBUG5ackQ2QXg5YlFNM0ErekcveTYyOEQwSS9meHpmblhFSGhl?=
 =?utf-8?B?UGNLdC9FNmJuMDlOSnBoQVhHV1FDOU1DMjB6M1JqeTN6RE15ei8zVGVTak84?=
 =?utf-8?B?YURreHkydTFhT2xsRS93WWUvN0w0WkoyVzRvTzNUaWg0Z2IyUVBBMGZNaHFF?=
 =?utf-8?B?N2JjODU2b3MrS2dBYlVySXlvTEFuNEhhRmI1U0ZrWXJDSHpHSllHcVhHUnFh?=
 =?utf-8?B?VnVXUWVoR0Y2ZXRLV0theDFaRXJGRlhaUllEL0ZPcEpQaDFRdTNENXdJUGZw?=
 =?utf-8?B?VEQ1WVhENDEzbzZzSjhVbk1MMUVDMFpUZ25QenlLaXpwSkZPbWc5dmhXYVov?=
 =?utf-8?B?Y3Z2eUhwNVZ6MEpPRDFvd1FtY3A1UXB4QTg2Tm9USzRwOVd6UDBhZ2VXck05?=
 =?utf-8?B?WXFiSGxSVEtjeHptV0FPY0tuUXRJbW0zMFhTVm1xZDdPb1lrYlB0WWhSK1Rp?=
 =?utf-8?B?aVhwU2lJanZKUlZLalA0QXN2QzlUbnJUSElmMm5tMjd5eWpOclBVaUtlZHVY?=
 =?utf-8?B?WXVtT29VOTI1RFZTb21TMSs2c3RNK3ZEZUh1SnVKMVBabTFhY1RaM01rc2gz?=
 =?utf-8?B?NTBteEkrTzJBRnFBcEQ0Z0FUdHNoRWdsMWxFZUlFODZlS0RBdGszMDJOMXVw?=
 =?utf-8?B?RndyQ1M0WjhVbHNTUXVSQWxkTktHQzNnODk2K0J2NE1Ic3RCczlTK0NBMzBW?=
 =?utf-8?B?RnNPUlpuRVNTaGlzOUJTTlBEMExlc2swcUVWYzhHQ25tYmJINFQzQS9KRXVm?=
 =?utf-8?B?TjN2SDMvSEk5TGtkT29lM3B0Y3pEM2JLWjREVE1KRkhZK0NpWU13by93Zm43?=
 =?utf-8?Q?lQt91fMyJ7p6j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXZuUlJqanVaZ0FiWVVTQll4Yll6a2xlK0M5cFFnN1RRUVovb1dScmo1bjJz?=
 =?utf-8?B?OTFIcGZ0ZkEyWlV4cldGQmdCMndDdGJHYmxGWWoyRkdFZHZqMVpEUVAyc3ZY?=
 =?utf-8?B?SmZkVXc2emN1TXdVOWlDSnpiYTRZZHc1OU56ZEljaFYveHA4bVNiWG1Fd3dh?=
 =?utf-8?B?d1pHdzIxVmQxRm1ydHZwcjBnVHFUdHNWQ01qbmwra05YY1RTTXdDQk11NFZQ?=
 =?utf-8?B?aFJLSkRvZnJ6TXhXUjhBaTFtcXRSSEFiMmNXMm0vNmR1MHNEeUFuVldNS1Y1?=
 =?utf-8?B?S2hIMnhpT3pJVUI0cFdvaWZiSzdXeDA0TGlIRXpiMkJhNVZ5WkZTeWRsZksy?=
 =?utf-8?B?N1A0RmpTNkZRWkhNdDNrcW9CYldQaTFydUhzNzYrQ2p0ZGIza2NrUEg4cU1E?=
 =?utf-8?B?N0FHek40L2hWQldWdHhhN2czNDFDR1ZncUV0YVNoVzQzT2xCMHh3L3RCZ0RI?=
 =?utf-8?B?Sy9ZNFRHUUpudDIxa2xqTDI5MTZFakRDSHJseDZCSnJORVp6RkJkd2lTSmhY?=
 =?utf-8?B?endEQkFEWlVQVDA4aGd0RitjSWYwbVZXTi9Zd3dKcWI1cW5EU2xNZEtGdkl2?=
 =?utf-8?B?dDdnbmxuSUxwL3A1Q2RoaU42RER1dUFGS2hXTHIzb0xDa1MrWXlxWm1yQTND?=
 =?utf-8?B?ejE2MTRET0hrSDR6dDBnUXBTQjl5YkdISzROSDZ1K1k3TVltL2k4d0JlYXov?=
 =?utf-8?B?cjJxVUdDNG9laWhrdGM3c0FYVUlFMm5mSGViRW9KbUVURkc2OU1CTzh2NEVR?=
 =?utf-8?B?QUxzNzUvVkoxNXBvSklYaGg4KytVS0tYR1dlQnZmdVJrNU1iUVY3YWpqcUUv?=
 =?utf-8?B?RGxKUHhnekUrOG5TVndyc3h1VXZqUHhIdWlMazlnSFRqNFIwT0M5WjFkNmZD?=
 =?utf-8?B?cXYxcVlNVG80UkZjSGFPUWZXaWFpTThDVThNVzFlMUZ6N3o3TzVEcGlaazFE?=
 =?utf-8?B?b2J3UFFwTjJISGQ5b3YzWEJGL2o2MU9GalJEdDBjL1pnSlJISEF6NjNFU24y?=
 =?utf-8?B?L2VYaXR3UnhDaUZtQm8wRnovM25vS20rVlBxcGRzK2dBcXMvNUZaR1dBb2dt?=
 =?utf-8?B?c3p0VStNUmNmNUZjU2hLcGFRVUlSbWpXTlFjT054aCt3MGZJcUZiRWZGcUVr?=
 =?utf-8?B?d0hFa2cxZmRvTjFCcWlwQXFFS3cvNVNJd044WFBhZnpuenJzcHJab2liaXg5?=
 =?utf-8?B?bEt0Nm9La2hwaGxpTG85NU1DS09rVDg1OERNdkQ3UkRjS1IwOEVmS1FwbkRs?=
 =?utf-8?B?MGMwd1Z2SWkxZms0MnRFajg3WUFlbTBhN1YwdVM3empKVDM2NUVmejk1SUpx?=
 =?utf-8?B?NlZTQ2JublBoYUJUNnpqdlJ4eUE5SjN4MlE4WTZkeExUZmZrL0R2Qnc1c0x2?=
 =?utf-8?B?UGt6Q1hTQTExTGJNRSsyclliWVZadE5iekxCSk00MXRzNUp6dTJuYmRsUFBp?=
 =?utf-8?B?NTBweHAwWVBraWZxTTUzbEQ0UnE4VFRvYUtHY0xIZHp0OXNRMEJxeS9YLzRL?=
 =?utf-8?B?M1cvUGpGN2tqR1E5K3FweEFtb3U2dVc2TVZ3L2pGbUM0dW16Y3gyb3ArQWx0?=
 =?utf-8?B?OGhDQVhJbGR0dEJMTVdTSTN3cnRlSkRNMWVCR3pnK201V2Z0MjJLd2JWUm9U?=
 =?utf-8?B?RnB5QjFIVWpHcE9ieVFpdFkvU2NnQkVGRlZKN0FCUVVrU3VVdE82UjEvZHo1?=
 =?utf-8?B?Y1dGZ0xjNVk0bWhHODhuMlhMRGJyRERnVnVmUy9ZQ1kyamg1K1E5aGFGRmFP?=
 =?utf-8?B?dkp5SDZrQmpVWHpiNWY0WmFtcHB4aVd5SDNPaXk4TVFvckZCaHV3NlJRQ3ly?=
 =?utf-8?B?UG15L3BrcldiVzZ5TEl5SGFMbUJ3Y0g0ZVdXTUNLNllBTzVaWlBMcVFkM2tj?=
 =?utf-8?B?MHFQY3IzMWsrSmhxeHZPYzBkdE1GMWpLYXhaQllRS1RMWi9DYytzY1dOU2Na?=
 =?utf-8?B?M2ZzMFo2L1lVTWNLVFdQTmZsTHVNRTJmMHFjMGpZQlgxSldJN3o0d2tNdzlM?=
 =?utf-8?B?WWNkOHVTT3JOd3h4MWFBd3JMZlNjTHBPY1BTcGhnMkNNQUc0ZURIejN4RTdl?=
 =?utf-8?B?ckpSb3ozeFVZU0VRZXNvK1dkaHdiaHFiRytNTUJsYll1alhTRmdySDRCV1FL?=
 =?utf-8?Q?Jw5YWSvF9CDool5FnB+4qpUjS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aea46e8-a3ee-4d0a-6da1-08dd46a9bdf6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 12:28:20.9542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxUQjY5CCO/kJlwIXMGJZOFkrdQcJSvxcXbyRusgr44KDgHeKMdtCNxnUZzEInlX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5781



On 2/6/25 12:57, Manikanta Guntupalli wrote:
> This series includes two patches that improve the Cadence I2C driver
> by simplifying clock handling and ensuring correct reset sequencing
> in the probe error path.
> 
> Manikanta Guntupalli (1):
>    i2c: cadence: Move reset_control_assert after pm_runtime_set_suspended
>      in probe error path
> 
> Michal Simek (1):
>    i2c: cadence: Simplify using devm_clk_get_enabled()
> 
>   drivers/i2c/busses/i2c-cadence.c | 19 +++++--------------
>   1 file changed, 5 insertions(+), 14 deletions(-)
> 

Looks good to me.

M

