Return-Path: <linux-i2c+bounces-7387-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A0E99E7DD
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 13:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA93D2821CD
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 11:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEF21E764A;
	Tue, 15 Oct 2024 11:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ehYmhQAd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6401D8DEA;
	Tue, 15 Oct 2024 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728993536; cv=fail; b=by9aWuN42GzGbFvuDsbam0TbATypxt2f0aZ5UeOZXY0Nlev2CLEWXqJGCrDDBw2TyBXdaNrZaKITOnOHpGQDaCo4J7tyazLky7u1no2yRWBk070LqURXPqOXrCzRO5IWCb1G5lCK29k0ADBOc3arLZtMqa0q/ij2Tl1KqHjvBIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728993536; c=relaxed/simple;
	bh=qBNV1qZBR/qvUrNk5/6Yv9OYYN/VzSP0QO5nqFrCKVY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iU5cXn6ZQQaY/kKJGH/i2R9tUnzclFKo4/HGmPeD6/5gFizOf190RusBo8Z77LR3DyPEESh4sRLSUH1iB7FGbFm3HGP1oJYLRaL5ZBEW+KGN+tWULV65vQptWz0+GYihJ2j8To/DPI9wDgJz+McEUEdnBT4Ub1nqvAHP62MaATY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ehYmhQAd; arc=fail smtp.client-ip=40.107.92.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0EkxHrYhmthkvmhTSHDJ9gLASqSwS1fC50suObxq9al6Gunv5Y+c/r5xipl8T6Wet8t3Z/uj0HAJ/IamjzcpXrjxKRkuHrbNmimsZVreWC8x+dSUPWPY62LmUGuiSGE4MsK5f5oXQMmEjGLexdR/nPMGJVwPLiUApiVcLMbYYgjLJgFVrwysTQPuNOTaY3v/qFSJtRctFt5Y79X8+YBW6FRmHCIqqEtOvI2aEPDm05qjv6Tt29G+QPwd3L/hS/Luj/EiFUVLO1U0DrQCFKm20lEmzsjgfjrrKd/ZvKaDw0InEvdh137UzfOZfJypsaxqv4LlGG1VHkjAmNhOdiAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqVBjKv0foac99hQW/wYAxtYLiUA5c0/4L4dvqSWt84=;
 b=itcOfo1vjF0WqqiIf1u5JFj6084E5zodv4F/FYH1E8wNrbdKzQnBNM9vMvAGelyzPfslM74It+g7Tg926lKyIEupiJDavCNc2ABem3YRXcQTfIgr9HDzOebCsRJO0jBzU6pzKcJIJYXaIi4UygSaytBwOob/g9SoNgKDyyZESGtXio6KmRKoaThEFOO744Brh+yjiJlkqfgs89EmEwf0Qez6iOMhYWbmvfSd57SKOjarNHW6Dmaz/mIE434enIRe1O1FIEzcaswj0F5+HoLKd99X5LB2WM+ICUtj/WaWL0Bxdinm63hnmCM7nQ/gAT50TcbP27yCoF2Y6+V0LmX3aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqVBjKv0foac99hQW/wYAxtYLiUA5c0/4L4dvqSWt84=;
 b=ehYmhQAdtx7LaV/tiA5tuK3fMdO6mXYihx7nZANj4Tbv8VzMBddQK67aQO49eNRTrPx9k3QpXia9wBxEuqNMVxxirwFz8YRT2fOfkUH7Z8ehgMY8RAvjQRrsVRFN/YKfvRTbcr9pcqehcy3T9K0W0x5NqeLi3yvNQW7gpVUJiZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 11:58:51 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 11:58:51 +0000
Message-ID: <3d6f7f74-3214-4c03-b352-a2a0d27ea42b@amd.com>
Date: Tue, 15 Oct 2024 17:28:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: Wrong piix4_smbus address / slow trackpoint on Thinkpad P14s gen
 2 (AMD)
Content-Language: en-US
To: =?UTF-8?Q?Miroslav_Bend=C3=ADk?= <miroslav.bendik@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mario Limonciello <mario.limonciello@amd.com>, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org
Cc: Andrew Duggan <aduggan@synaptics.com>,
 Benjamin Tissoires <btissoir@redhat.com>, Wolfram Sang <wsa@kernel.org>,
 Andrea Ippolito <andrea.ippo@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
 <5105b392-dee9-85fb-eeba-75c7c951d295@gmail.com>
 <3409c03e-35fb-428a-9784-0069b63a83bb@amd.com>
 <a77c83fb-45f2-4f77-846c-df441bc15436@gmail.com>
 <788ae95e-12d4-441e-a417-d04049cb8e2e@redhat.com>
 <e345c93e-224d-425e-9ebf-efe02d6b6718@amd.com>
 <2130afb8-8bf7-49da-b349-e99194042865@gmail.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <2130afb8-8bf7-49da-b349-e99194042865@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::20) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MN2PR12MB4343:EE_
X-MS-Office365-Filtering-Correlation-Id: 9905d335-d06e-4a10-6d87-08dced10bc42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEJ2K2xZMGRLRFg1Zi9wTjFuNjZJWnJON2NSQndJMkFIMkRSYW4xUEoxUkg3?=
 =?utf-8?B?SGd5NnV5OGNEV3BOai9TQ3VPWjFYMEtQbUQwOGdsaWJUYzFFbXg2WXBXMURG?=
 =?utf-8?B?Uy8ybEYydVpkYi96V3BJcFAwTEhPTHhGRzMwdjRnQi90WCtTWXREaTRiQlVn?=
 =?utf-8?B?RzJwdDdjTWNoQmRtNnZrQkdzU2NnS0JsVmFUeTkzUUhlb0dKeGJkVHdpdFlY?=
 =?utf-8?B?d1llbDdwQ3FYWTI5SlEyMllmTHliSFp6OU0zWWN6RDRxUm1GQ1dLN3QwL1RP?=
 =?utf-8?B?ZllqaEtiaHlrMHRwNGxZMVEyd2g3Qlc4bFk1ekRHRElaMVBiMlN0S3kwUjdw?=
 =?utf-8?B?bHpBMzhtaTYzMVZSMWxydHhuU0dCSkptK3hETEFMUzdzcWlrOHFlTXZiQzhh?=
 =?utf-8?B?aVk0RjRIQk1peDF1bHgyd3liYVk4ZnlndjluNnlnMTVCUlFJNXRnc3lqY2VT?=
 =?utf-8?B?TDFPaVN3bkwvVjVML3JIaG1lZ21mc0JEWFhJQXE1R3YzUnZVYjI4b0k2VDFp?=
 =?utf-8?B?cVJURm5BNHRIQTBjWlN3VnVTQnNBQkFaMmY2ZlM0TEZZV0xIY3dOczdSTExk?=
 =?utf-8?B?d0xqejkzNWVDakxyK3JlUFBOQVAwMWhoRUZ2TkY0TDFxZ2N0RkpkK21EOU9M?=
 =?utf-8?B?VEhkTFlWVlU5N1RHdzlTelV6WEpQdFMxeW1keGtiZHNJZlNWeTlod1ZCQjU0?=
 =?utf-8?B?R1hxdlBQa3YvV05DTnRLaFg2dXJCQ0xKZ0NNZG8zMXB2WGxabVR4RnBXdFlk?=
 =?utf-8?B?bXpwdkROMzBvcFAxV3ZLRjRTcFJZaGtHc0pyUnkxSldOTGY2YUJWVzZubnQx?=
 =?utf-8?B?UjEvcjBtaVMwamhUcDF4S25LNXpheS9CNjR3dVZzOGQ5MWFpNFFoZi9vWE4v?=
 =?utf-8?B?N3h1bFV2aHFud1JsZU1oUDVoWGJYZTlyOVVaZStNT0dObm5qQ2Vqb1pDWEw5?=
 =?utf-8?B?ckdoQ2VuSnYzeEQ3Z3RaeklYMnhObGtMV3VoM0JNd2xsYzdacERWQUxhc2pz?=
 =?utf-8?B?dHMrT3VTUVJrMVRzZzE5ZS9zcVdzRFJhVDVhTFJiR3RiNUplWXlzR0Z0Z1Va?=
 =?utf-8?B?VjBzR0dVNWhEWHd2MzJCVnJZSHFEa05YbFM2WXRXaHBEaGFHa0JyN3ludVRj?=
 =?utf-8?B?N1pCTi96YVhvNlZKTTdISXVyc3ZyQ0xXYlZKK080YnJzZzBBYTZhZlVYbVdG?=
 =?utf-8?B?QjNDMWMvdCtNTUpmWGx5RVR5aTNOUWIwWFRVZi95TGxDdytFRmYyUktlR1ZC?=
 =?utf-8?B?ZHJubjZQTFZwMDM5d3BSVjgzZnlYbUpKRllIVUdWenU3ZWFnb2ZpNWdaNWth?=
 =?utf-8?B?VHo5SWF2S1FZejBFN216c3ZhRnpjaXdvU0lBZ2ZWOUY5ZTE1RzBVYko4czA3?=
 =?utf-8?B?eEpycTZkcDhkSGVFVnBlQjBzenFFbm9CSGtUSUNRdzROcXJlU0FGbUNZcFRT?=
 =?utf-8?B?TVd2elVqZmRyRUFRdDZlWHJUbm1lcHRnMU1KdzhYSFR3dFNTb0VKdGprd2Q4?=
 =?utf-8?B?VGdXTGdiOHB6bnBuQ0U4WlZnRzBjQzFLbFRJTzRxYjNIZzZlWFU5V0Q4ajQ4?=
 =?utf-8?B?NllnMFdVVTBnTFFXbnZaRUxlK3pyaCtOMlF3TkEyRXd6M0M2Q2JBM0ZsQWRq?=
 =?utf-8?Q?5FBqU7rqDMrwStvH88RIHcl3MwhA4uyQYuA2J2bJF7MY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHF6Z2RWUDdlc3ZLNElnWmNJcjZad3RBbm85eGFuazB6TVVQamwrS2RXRGIw?=
 =?utf-8?B?djZDU25PZGpGbm8vRUhHWUUyR1F5cE4xSVMzYkZCRG8yVnRJOHhScVppWjRY?=
 =?utf-8?B?a2FDaHpGeWxISXVGVy9ZMC84emRXMTB0OGNiZHZueHV6TGsyQjQxMmVyalZG?=
 =?utf-8?B?REoreWc2UGtYTHM3dnN0WWlIL1F6M3BWblhGZCtVdENGckU4dE9ZYVZPNk00?=
 =?utf-8?B?amR4QjU0aVY5amJRT2EwUkhZaU9yaWQwa1U4UHJ1NmRhZWcrdFc4UmZBWGQ4?=
 =?utf-8?B?cWJOakcxOStzbnlvaDB1R2hCYnBvU3FqVi9XYzJNSDRJbEttdmVzVk53bHFZ?=
 =?utf-8?B?T0ErdUV2OGkwQjJIekdiQzBpMDIrNXZobUdlb2REMUJ5eTVxTElXTHBzbUJL?=
 =?utf-8?B?eUxDcmR5dnp4bWxESkYwY2xKVU9CN0xFYXFrUUdKUGRrUzJtSjZJT25obXpE?=
 =?utf-8?B?MFJiYzFhWFBuZE1XdFdSbXJLcEJ4WEMyOEpuUG5FMjE4algxc1RUMDcrT0xp?=
 =?utf-8?B?QysreE1Wd2pabDVGNzBCak8vcUVFUWZ5cmtlZTg3dnlTdFlHK1JEWVVSWVgx?=
 =?utf-8?B?b1hRVjI2c1BkcHRRRFJNQjE2SEFGNE9LVGZ0T25GNzVRVkpCc1FQYmpicXQ4?=
 =?utf-8?B?dVUvOUlkVG5aL2xHdWtNWEZpNHBNNm9LUmY2VFlveFF0cEM3WURGbC8rOTEz?=
 =?utf-8?B?c3RaWmliTkM2R0JwNjVhdUVXS1Z6UC9sZGhObXJiV2hONlRiWTJWMmFGaEtZ?=
 =?utf-8?B?Vis4bnVoMVRpc2pVYlBYNjd6Lzc4YkdoQm9mNktzaDZ5a0RNa1JBd1Z5ajlT?=
 =?utf-8?B?M2RCR0FMT3YzeDVtaEtFWTcvRmZ5RmR3NUE4NzczdkhwM1prdGNCU0p2UW1k?=
 =?utf-8?B?SHl3bGpnR1pXN1JwNkZPRXBxcVJ6azNHR05wRHJjZmtEc0UvcEFQbUxnZFhz?=
 =?utf-8?B?SlZHSTVkK3V0bUdNa1FMSmxsY1ZhTHpQN1ZrRjlYOUxlaVoxelhqT2s1azdB?=
 =?utf-8?B?QUpBVTNsUXFwSkFqeG02Z3Fyc1JjdWJ5RWM4YWdFdXIxZjdUYzlOVkl1Tnlu?=
 =?utf-8?B?cXQra3pvME1HRkVpTXZWSXpQNGFYcDBwUmpQVFppMXQvQm1rbzlrUXhDeDQz?=
 =?utf-8?B?dmNlbit2S3h6R1dZWFJ4aUZ5Uk1EZ0hBdWkrTGZCdVhNM0xtMmQ3SzRzYklw?=
 =?utf-8?B?dld4Um5NSHFJVFM2ZU5KT0Rub3B0UHQvUlNRdE45VGRDQUpmTU9CSUVkNkJx?=
 =?utf-8?B?MHN4M3ZsSjBGZjB1WjlUVTNTQ0tSbTF0SjZ2SktKQTVtL0hYa0Zwc3N6V216?=
 =?utf-8?B?V2svNW15ekxrb0NzcjRUcDVTK29pRll3Q0JyRGRwWWo3dmphYVBJZnc0aXhs?=
 =?utf-8?B?MS83dUFKTGEwTHRQTmRjREV6U3dFT1hPQjlmNE93MFpLVC93QjRCZlJ2aHg2?=
 =?utf-8?B?MkFxRGVFN1Uxb0ZpT1Y2UXFHREowa0tEMU1PNWswSG0zNm5HR1pRdGw5dkhs?=
 =?utf-8?B?YlNEbnBRV0tuUk5vRFlzMGxtcWxHYXlzVmhIK2dQb2JVS3Y4ME56aWowTng0?=
 =?utf-8?B?OW93VjgwMG5vWnJHdk1BcThEck9VbThJb2RYdmdyeDNSeFQ4WGRwYmhhWHlY?=
 =?utf-8?B?Ny9SVkNNcGl2alkrK055TEJGVzVBZGIrN283eW1hNGpvWFNRT3VseFVZL2Rj?=
 =?utf-8?B?YVBLcHVnc2t0dnA4T2Q2SU5RTGxCMlVsRmhoMXhSOUJ4Qi9nbkhNeGZ1M3FG?=
 =?utf-8?B?K3FjRU1uWXhYZUlkWnZEdm5OTTFaRSt1UU1TT0JYek5uSnczcGEwSUFwKzBB?=
 =?utf-8?B?eUltVk5OVWY3YmNSSmZiWGFWOUEyZ3hEUGRXTWhSbU9yZDR0Q3JzVTBiNng4?=
 =?utf-8?B?ZzFyWGh4UUZHeWcrVHZpd3B2TUQ2WCtKeWFERW9nb3dMR1BaRFVQeHFkWi9n?=
 =?utf-8?B?MjBwbWlaWUs4N3hBS1p3aGZERnhVSGRzMTE4cFVDbklidHdKTnlHQ0JHQXBQ?=
 =?utf-8?B?eE1Ic3dvS3NURDRoQ3ppOUI3Z0V5bWZ0dU9TeWF1cldmZ1o4LzRkYmhLbFpl?=
 =?utf-8?B?RWY4VXlSMnp2c3B3NnN0YUZ1QVZJZnVYZ2l5eElRb2VYS0k3Y1dldFRTQUQx?=
 =?utf-8?Q?CcBF7MdLXLY4Lryyq3q0A3Gff?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9905d335-d06e-4a10-6d87-08dced10bc42
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 11:58:51.6576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gbwfg5JY42mYjEXX0v4NR+uSujmyZrP1ahSvF9dqffcFeyWrQGrYvoFLS7xo0iEODeP/2QmRncIMxpwoxLwQ1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343



On 10/14/2024 22:13, Miroslav Bendík wrote:
> On 14. 10. 2024 18:01, Shyam Sundar S K wrote:
>>
>> On 10/13/2024 23:23, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 13-Oct-24 7:20 PM, Miroslav Bendík wrote:
>>>> On 10. 10. 2024 18:25, Mario Limonciello wrote:
>>>>> On 2/12/2022 11:42, Miroslav Bendík wrote:
>>>>>> Hello,
>>>>>> i think, that SMBus works now pretty good and last problem is
>>>>>> screaming interrupt from synaptics (1000 irq/s). I need little
>>>>>> help to solve this problem.
>>>>>>
>>>>>> Little summary first:
>>>>>>
>>>>>> On this thinkpad is synaptics trackpoint/touchpad connected to
>>>>>> PIIX4. To enable RMI4 mode, SMBus driver should support host
>>>>>> notify protocol. I have added support of host notify and
>>>>>> replaced active waiting transaction with completer + interrupt.
>>>>>> Driver is now pretty stable and works way better, than old
>>>>>> implementation. For example i2c-detect shows real devices
>>>>>> (previous transaction code showed all addresses from 0x1c as
>>>>>> active). Patch on following link is still hack, has hardcoded
>>>>>> IRQ and supports host notifications and interrupts only on
>>>>>> auxiliary port. I can implement other ports later.
>>>>>>
>>>>>> Patch: https://lore.kernel.org/all/c9b0b147-2907-
>>>>>> ff41-4f13-464b3b891c50@wisdomtech.sk/
>>>>>> This patch includes PM register access using MMIO: https://
>>>>>> lore.kernel.org/all/20210715221828.244536-1-Terry.Bowman@amd.com/
>>>>>>
>>>>>> Now i can load psmouse synaptics_intertouch=1 and everything
>>>>>> works great, but it uses 5% CPU and interrupt is called 1000/s.
>>>>>> I have changed interrupt from rising edge to active low (it's
>>>>>> PCIE, PCIE has active low) and i have many times checked if all
>>>>>> interrupt bits are cleared in interrupt request. Yes, they are
>>>>>> always cleared. Interrupts are generated only after first touch
>>>>>> if i have compiled only F12. If i compile F03, then interrupts
>>>>>> are generated immediately after load of psmouse. After unload,
>>>>>> interrupts are not generated (i2c-piix4 still loaded).
>>>>>>
>>>>>> On this machine I2C is accessible using GPIO 19(SCL), 20(SDA).
>>>>>> Using kernel thread with RT priority on isolated core i have
>>>>>> tried to record pin values on GPIO pins. Latency is too high to
>>>>>> record all transferred data. Some state changes are lost
>>>>>> (approximately 1/50 bits). Not too low to read reliably all
>>>>>> data, but good enough to see what happens at bus level. Here is
>>>>>> recorded file: https://mireq.linuxos.sk/kernel/
>>>>>> thinkpad_p14s/i2c_scl_sda.xz.
>>>>>>
>>>>>> Every byte is sample, first bit is SCL, second SDA. Sample rate
>>>>>> is cca 500 000 Hz, but often drops under 100 000 (lost bit).
>>>>>>
>>>>>> On this screenshot is typical activity on bus:
>>>>>> https://mireq.linuxos.sk/ kernel/thinkpad_p14s/i2c_1.png
>>>>>> (pulseview with imported raw file)
>>>>>>
>>>>>> Zoom to two packet is here: https://mireq.linuxos.sk/kernel/
>>>>>> thinkpad_p14s/i2c_2.png
>>>>>>
>>>>>> First packet is SMBus host notify. Address 0x08 is SMBus host
>>>>>> address and 0x58 is address of synaptics (0x2c << 1). Second
>>>>>> packet is reading of interrupt status registers. Data 02 is
>>>>>> length of interrupt status register (9 bits) and last 2 bytes
>>>>>> are zero (idle, when moving cursor, then interrupt status
>>>>>> register contains one bit set).
>>>>>>
>>>>>> Zoomed out: https://mireq.linuxos.sk/kernel/thinkpad_p14s/i2c_3.png
>>>>>>
>>>>>> Before transaction SMBus slave state machine is disabled and
>>>>>> after transaction enabled. If notification is received when
>>>>>> state machine is disabled, then device writes only address and
>>>>>> don't get response. If driver runs with always enabled slave
>>>>>> state machine, then output will contain only notify + read
>>>>>> interrupt status pairs and no separate addresses, but with this
>>>>>> mode bus collisions occur more often.
>>>>>>
>>>>>> Here is dmesg output: https://pastebin.com/RdDYHJn0
>>>>>>
>>>>>> Cursor is moved until 2862.8, then i have not touched trackpoint.
>>>>>>
>>>>>> Idle device don't produce bus collisions. Moving cursor produces
>>>>>> collisions, but sample rate is stable 100Hz, which is way
>>>>>> better, than <40 Hz with PS/2 mode. I don't know how to solve
>>>>>> collisions. Maybe they are related to not silenced host
>>>>>> notifications.
>>>>>>
>>>>>> If i were to be optimistic, then i would say that clearing
>>>>>> interrupt vector will solve all problems. According old RMI4
>>>>>> documentation, reading from interrupt status register should
>>>>>> clear interrupts (status register is cleared), but this don't
>>>>>> prevent device form sending host notifications. Maybe exists new
>>>>>> way to disable interrupts. I don't know, i have no access to
>>>>>> current documentation.
>>>>>>
>>>>>> My device has this signature:
>>>>>> Synaptics, product: TM3471-030, fw id: 3418235
>>>>>>
>>>>>> Any help welcome.
>>>>>>
>>>>> Sorry to bump such an old thread, but AFAIK you never came up
>>>>> with a good solution here.  I did want to point out that there
>>>>> was a very recent submission by Shyam (CC'ed) [1] that adds an
>>>>> ASF driver (which is an extension to PIIX4).  By default it's
>>>>> going to bind to an ACPI ID that isn't present on your system
>>>>> (present on newer systems only) but the hardware for ASF /should/
>>>>> be present even on yours.
>>>>>
>>>>> So I was going to suggest if you still are interested in this to
>>>>> play with that series and come up with a way to force using ASF
>>>>> (perhaps by a DMI match for your system) and see how that goes.
>>>>>
>>>>> [1]
>>>>> https://lore.kernel.org/all/20240923080401.2167310-1-Shyam-sundar.S-k@amd.com/
>>>> Hello.
>>>>
>>>> Thanks for the update. It looks good as a separate driver. I had
>>>> intended to split this driver, replace polling with interrupts,
>>>> and convert all I/O calls to MMIO, similar to how a Windows driver
>>>> operates. I paused the work because I needed documentation and
>>>> fixes from other companies, and I resolved my issue using a
>>>> different approach:
>>>>
>>>> - I have not received a response from Synaptics.
>>>> - I have not received a response from Lenovo.
>>>> - I have fixed the original issue -
>>>> https://patchwork.kernel.org/project/linux-input/patch/71d9dc66-9576-c26f-c9d9-129217f50255@gmail.com/#24848525
>>>> - Too many subsystems are affected, some of which are currently
>>>> hardly fixable.
>>>>
>>>> The biggest issue is interrupt support, which cannot be resolved
>>>> with quirks alone.
>> Do you mean the interrupt support from SMBus controller which happens
>> via the piix4 driver?
>>
>> Note that SMBus controller do not support interrupt and the same has
>> been documented in the datasheet:
>>
>> D14F0x03C [Interrupt Line] (FCH::SMBUSPCI::IntLine)
>>
>> 15:8 InterruptPin: Interrupt Pin. Read. Reset: Fixed,00h.
>>
>> ValidValues:
>>
>>
>> Value             Description
>> -------------        -------------
>> 00h             This module does not generate interrupts.
>> FFh-01h            Interrupt pin.
>>
>> Thanks,
>> Shyam
> 
> Hello,
> 
> i am using ASF documentation (48751 Rev 3.03 - February 19, 2015 BKDG
> for AMD Family 16h Models 00h-0Fh Processors -
> https://www.amd.com/en/search/documentation/hub.html#q=BKDG%2048751).

Hi,

You are referring the right document.
> 
> There is a ASFx0A ASFStatus with SlaveIntr bit. Pointing device on my
> machine triggers interrupt 7 and it can be cleared using ASF when i
> move cursor using touchpad or trackpoint. It's possible to implement
> and enable I2C_CLIENT_HOST_NOTIFY flag on this hardware.

if you want I2C_CLIENT_HOST_NOTIFY flag, then that has to come via a
software_node property and I don't think we have near future thoughts
about having this in BIOS.

> 
> Another interrupt bit Intr from ASFx00 HostStatus is 1 after transfer
> (interrupt 7 is triggered). Transfer can be implemented without timers
> and active waiting on HostBusy status (there is a loop in
> piix4_transaction).

Yeah, but this is what is being documented in the ASF databook and we
have to look at the SMBHSTSTS, based on that the further ASF packets
are processed.

Thanks,
Shyam

> 
> With regards
> Miroslav Bendík
> 
>>
>>>> My device has this DSDT ACPI entry:
>>>>
>>>>   Name (_HID, "SMB0001")  // _HID: Hardware ID
>>>>   Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>>>>   {
>>>>       IO (Decode16,
>>>>           0x0B20,             // Range Minimum
>>>>           0x0B20,             // Range Maximum
>>>>           0x20,               // Alignment
>>>>           0x20,               // Length
>>>>           )
>>>>       IRQ (Level, ActiveLow, Shared, )
>>>>           {7}
>>>>   })
>>>>
>>>> This entry defines the IRQ number, trigger, and polarity. However,
>>>> the kernel ignores this entry and only uses the "Interrupt Source
>>>> Override" from the MADT table.
>>> Note that we already have a quirk table for this because this hits
>>> more
>>> interrupts in the legacy ISA interrupt range, see:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/acpi/resource.c#n659
>>>
>>> note that the MADT table is already alway skipped on AMD systems,
>>> but currently only for IRQs 1/12 which are the PS/2 kbd + mouse
>>> IRQs.
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>

