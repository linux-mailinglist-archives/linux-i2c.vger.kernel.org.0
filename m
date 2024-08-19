Return-Path: <linux-i2c+bounces-5479-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D92EE9564CD
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 09:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08D7E1C21574
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 07:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2764915747D;
	Mon, 19 Aug 2024 07:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="DQskxwtf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2090.outbound.protection.outlook.com [40.107.21.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C2013BC1E
	for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 07:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724053157; cv=fail; b=O4sEBfwIdlLUmcPnDwUaG2pMzYNF9fY7snBgQeSaZWFuZZvvBHrio49AMyvExZU9IpK71OsBS0twR2DxX6qCQoJNYH0ObcPrRYcOLgIEMop8bGsrZQmBzoak50bh+mgAoDg8diTTcM9Nk2zQs15Hu8sBKxUoCNlrTH7FfipDb4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724053157; c=relaxed/simple;
	bh=Z21x3GHkfUZxh6+Qqm8gXrbt4xl0C3tgt2QWmNVrXQA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MkFyMzpxe9YS2bB5TZAOTGQlxwP6MtCtx8BGh+eoK9DigO5GnAdMLb4WuAPvfyrzVIBTZmaogkDCcMhe+u418RvJenG0JUbd3XnXjJFV7p1Y+o+vH6EaxM+4TyBZbwwDty+I9M9OciELuyu5XH02sNpQQ3PQGKtFkr0tJBEFsrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=DQskxwtf; arc=fail smtp.client-ip=40.107.21.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vEGwtWFBT111kaqbgSdkG0VD05KdMG07QQ+hA9EraDrVRkPXFgTp6gn9IvkNDpkgDFXbv7xDSYl3skFMi2LMmWGKOnjPtno0XdKVcEvV5ldWV0JqEM/5N899LHYFN6jnETPBp0LioRVed04uVS0YRMOmWmndv9Lw64EgNt/WqqPJsbPEWWNc1KYgx02UKxXKSuaxVfbGd6jrLKGquH9GFvv1XA/5uNXDkTed1/4RWxOAvdbUgt8+VKziYLxPDY8wEDRuBN7H/oFwFQQKcHMC+3cREhH/BmgqDksE+gMR7DIpM3SUXGxD7z1vyfA4+TLkNHQSA5INQ7p23oi7+Qb9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAyB2cqvs5IY9Wy3VCKXHEP5tlKRDV6ETNtiIOgrwGY=;
 b=sv1vhQ90a1H2mzWh04DovajeCRU2lThQm2wY/UXygZ3Limi9EzdHMs0zEqc4hHfzE8OenEJ1wa6+Z1dsVP/22y8461b2lDURANnklVl5IC+6jeYJzSuDG/quqg+nQYCV9vfZAavBPDxkc5EudGLqmJLC3jsF/s4Wzoi7nVrjNQB+SOytmoIkmW26hZuxypv69oBPOl8FMqnruHYYeJQfAzVJgobkRXbl9TGHdEM3VS8FBwARdwb47oggf8VAOQQQKlLQYDIs+Rtpt1/0Wh1flW6d7DOKokApNP9vodoD9o/wwTDML4HjVQNAL7NP14n+MersPEKv0tbVPyhhRhL4cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAyB2cqvs5IY9Wy3VCKXHEP5tlKRDV6ETNtiIOgrwGY=;
 b=DQskxwtfL4DzoK/U26mTJm67R095//6ZoqAUGP2JVDX2TNHp9F+1/x+8UzgC8oMs44zlKJpx8zOgUgGP2eAR6LwojbDN0jiq2AIzNnoF6Vf4h35PCkdk5iVVmZn1xpHbe63GuUAU+uSKWyX+2XYfMzCnQ+KFEHER6JJor2Aw8zg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by DB9PR02MB6811.eurprd02.prod.outlook.com (2603:10a6:10:21d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 07:39:08 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%2]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 07:39:08 +0000
Message-ID: <7c2ca9a7-c328-6d88-eb16-9c940114ceb0@axentia.se>
Date: Mon, 19 Aug 2024 09:39:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] pca954x: Reset if channel select fails
Content-Language: sv-SE, en-US
To: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
References: <DB6PR07MB35090E8350CC105E00E0462C9D812@DB6PR07MB3509.eurprd07.prod.outlook.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <DB6PR07MB35090E8350CC105E00E0462C9D812@DB6PR07MB3509.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF00002BB0.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:1e) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|DB9PR02MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c9abd07-f4a5-41f8-2cf5-08dcc0220289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUNnQWFkVmMzN1FDOGZVUzFzdlVrdndQYVVPNFNieGkvOTBNalYzeENjaEtM?=
 =?utf-8?B?andDZU5oWjZtTUpkamRmSHlBSXJENnROcUdjSFUyQkZFQ0t6N1AwK0MwZmhk?=
 =?utf-8?B?Y1NuNVF4akJKY2l5SVhSY3VXTWJJS0hvK1hvSHB2alZaamdEQXVLVnZ6c2ph?=
 =?utf-8?B?WWd3MzlVMlI5ZFQ2QytIZzl6Y2pEYUtOTW1pMkk3UXRjc09nSnVJRVl0c25Y?=
 =?utf-8?B?cGVQUnpyNkl0Z0t2RGZlQy9OK2srNlZkRGZhSjJvcFFGY2xyZVdWa2VWZm9q?=
 =?utf-8?B?V1BQZEV3MUdWc0djL1VtUHhsM3FyVEx4SkJxZDRTZVFVN2x1c0o5S3F5SE5t?=
 =?utf-8?B?REkveFA2TWtiZzZmcmZVOGVMQ2I5WGlTd3d3ZGZVR2ZtNEJzSDBvTkM1bEp4?=
 =?utf-8?B?bStSMi9ESTRZZno4eFdrS3lORUhwVXNGMnRrYU5WSHJJTDFSZkdnSjdvMUw4?=
 =?utf-8?B?blQ5Z0VkVlNYSjVPUWVUWERyR3JFczM1WjMvTy9DenVVcnRBdXpMOUpEMGll?=
 =?utf-8?B?US9mNXRzMGVnQklMWW9yZFVJdTdyZ1lPSmYzQTVSbi9vZkhGWWpkdTRyd1ht?=
 =?utf-8?B?aHErdnhvOUFlSXYvK3NzMm9UeDBaakJNeDFUQVZlS2IxZnZRY0VhZGpUdUZF?=
 =?utf-8?B?ZkhpNkdxWkU5L0ducFo0T05mLzY1NVZ1RjRIQUJscnowWEEzYy9JYkxGWTh3?=
 =?utf-8?B?WmNpUzRuYlNpR1Buc2FoblR0OFRKbVR6RSsxM0FVT1BxckplSHgrT2hmTVgz?=
 =?utf-8?B?N01UaFhhQU8rcjFJRW4zVGQxbW91TGNUZ1pjZHpSOTN4NGZYallVYlIreFJn?=
 =?utf-8?B?czJNNjVxRTlGcTV5b1hZYWRDV2xoa21yTWIwM0U4VklXRkwwLzk4YTNJdW4w?=
 =?utf-8?B?emVHcVlVY0tPOVQ4RXhpUGRJUmFCUXhORy9EMlpFdGdRSW1mOVJTemxzazd5?=
 =?utf-8?B?cWhybWhBKzIyRnYwcTBJZEdick9mUk4yV2dtT3RFZVBUQ2pYbjlpcnptYlRO?=
 =?utf-8?B?VnE3aFFQY3VHcjJXTENwQTgySExjZS9RbHkyNzh1WFFOZFB4RWRmNG41NE42?=
 =?utf-8?B?dXlvOEx1WHkyMjg0UmYzbklpVmxzUE9JZFVrMHJ1QXJDKzVBajU4U3dnZEdJ?=
 =?utf-8?B?bm9JM2tuajEzV0Z4NnVMdlVkQVBoM3ljMGhHanRyUWF0cUtaZjV1SmZKcmtr?=
 =?utf-8?B?d0Vady96eFN2RUE2K0ZWT05TZVhnaG14S1F5YnF5NXFHbGYxRUJWaW8rMDE1?=
 =?utf-8?B?VGlhVWxBZTFxWHNRdEZEZmwxQjNLRHZ1RnRUZEFwY2J0TnZHemNPZlFmcURF?=
 =?utf-8?B?akpBU3orbmdmdi9yTy83ZFU3UGM4KzZHcVJsVkMveU0wZmJ2N3NxeGRDMEtE?=
 =?utf-8?B?NHhnVi9uMll2VVpGUEprZWR6aVlCd1ZwOHpBa2JQRHR3MmVHVWRESllBeU9k?=
 =?utf-8?B?akZCS0tiWEt2RTBZajNmUDJ4MmpiOGd6N1J3a0pVYVcrSFNVRlRhSDNMdXQr?=
 =?utf-8?B?TjJsVjhYSHV5aVlYNFJKcmNtZGRPNTJrUWxwdG1XakxCY2VENHd6Q0szNEQz?=
 =?utf-8?B?blJSdk5YZnZ5dzN5bjNDdFN2THNtV1prZWp0LzVZZXg4OEM4MmdUbmh2TDh4?=
 =?utf-8?B?cEJJVGo4UCttSVRPTko1eVh0R250UTROcXZyZTBZQWpvOGFrbFRNbFE0TEtU?=
 =?utf-8?B?cnEzaE5Ybkp5VmsxTWovM1ozR1NhNURlY0NId1Zhb2JCWEMwUjY0eHR6eHhS?=
 =?utf-8?B?c0kzcUxreCt6R3RXV0pkZDNML1QvZ0t2cWJEM0J2N09TcUVQZzlYOWtkUzZy?=
 =?utf-8?B?VzBSTUxBSE4vYzI3M0daQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTVnc2pxeUUwaC8vT3FWMUxkNlZzc0FPakgxRzZIazJMaWFFMEhhbHpIKzVi?=
 =?utf-8?B?eE95ZzdzT25ZN2MxM1dRYWp5MmNJa0ZtcVR6Qjl6UWV0NDYrdFB4dG95VE5N?=
 =?utf-8?B?d0pHdzcwUFQ5L2NKdmxwTjE1OTN0U0ltOE9uWnprYVlMM3hXUHZKVGxmejhn?=
 =?utf-8?B?aWxmbVB3QUhsakd6VGZjdXFXakdoL09GSVVpSDZwc2t5QmE0ejFQZ0h2bXZL?=
 =?utf-8?B?MmtYc2RqRitoZU1vVzRScGwwblVLL3dtazVCdzFtczVSMXZzbEpxMXg1Tm1V?=
 =?utf-8?B?K3duSjE2WDRsNnNpT2dtNWVzTEZGa3JVcHhrY2VoZEZaVy9BTTJPZEdBM05C?=
 =?utf-8?B?TE8xbG8vNGExWDRMOVV0VDRubHRGaHNrajhGbzFFWkp1dGVqcFBGbGgvaWJ5?=
 =?utf-8?B?ZElOcXZTSk5sdzBoRDUzbVh6bGwzWTd4MzVYcEF3RVBVZkdETkVydGVsN3ND?=
 =?utf-8?B?Z0w2eTFpSTM4V21ZRWg2LzBOdFJYSit2R0tHSitrZ0tEUllJZStzRVFSYlZs?=
 =?utf-8?B?aUl2S3gwZHBqSUl4TlVIMm9RYko1d3RsM0FzNVZpY2Iwem4yYmh5Y0lMcUJG?=
 =?utf-8?B?eVNEbXoxU2ZNSFVQalB2V3FVNWkwZWlnb1hBNGt2OG1hRlUrTmdTT0NsMmY1?=
 =?utf-8?B?ZTE0QkFXZTdDbGM4OHVLMWRkdmE1alphdTJXSWE2R2tvVS90ckFnbXY5V01s?=
 =?utf-8?B?N3BXMEUyc0JiR2Zmbmp3OUNtYUVQQWxaOTkrdE1VQ0NHUlZTYVEwSTJQYkFJ?=
 =?utf-8?B?ZXNweG9mZnFJUlFnSHU3ZXhxRmpEc0ZpazZpREJNQSsxNUtSWnBzTWROTXNI?=
 =?utf-8?B?SEIzdVFIdEJkRHljbnV4aHhKemFPVjNFQ0dWYXlGQjdLTGFQYkdlVExNRnEy?=
 =?utf-8?B?NEVhNHZXRUZ4OGdveHFqV1JtL3dkSmRWODVURkRWTzdZMnNMejM5SHhKbzQ2?=
 =?utf-8?B?bDlDUmJhME85YTNnVFpYOUZrSW9DNi9jWnFFdDZyTXpZeWFkRlpXUzlzcHd1?=
 =?utf-8?B?L254dDQ2akNRNjlWZC93U1l6b25wRnA4Sk5oUmJwcVVrSnV0dG54UDdwKzB0?=
 =?utf-8?B?K3ZpUmowY0VBVU03bTY1NXBhc2FNd3VLMEVCczNjSWlxQWxyVTg0bXZjRlNG?=
 =?utf-8?B?VXVCUWJPUzluV2FUTytSb2kzcUY3dUdiOEZTUVV4WE13OEhLYjJwYlV4SUkv?=
 =?utf-8?B?NjVPTUZIYkZ4V2V1TC9kOFlMSlZYZ3JEbGJLME52dS9VTEtEdExrQTBiM1A0?=
 =?utf-8?B?YXJUekE5SUtQUCtuM2c5UFlSWTgrb2pNNitwUUVlcksyTlZ5R3YwMndES3Ny?=
 =?utf-8?B?eVFkcEd1VklXUURHOGd6U2tENVdVV3RubUFpdFdLR1owazRncXNCK3MyeHkw?=
 =?utf-8?B?OFNHYWMyNkd6UnhMVzE2bXdaVlVCQzJRZFo1Um1lMFUxNTZNU0xwRloxc0ZY?=
 =?utf-8?B?bTc0NlA4T1ZnaWM4Q3dFMi8yZUdiZzlpaHpOYmx4ZUpLQWpZQ3FDeDlTTGdx?=
 =?utf-8?B?Y0tzYVdWNG1VS2NtakxxTG02ZUpUQVBRTitIdHVRSStPM1Z2MTJmQzRDSVgx?=
 =?utf-8?B?UFRRSWdXZCtrZEJtbm8rbk5yYjdVUlFXTVBDU2tCV1ZzS1dYUzUrYlA2aU9v?=
 =?utf-8?B?MHNieUNIckhHWXQ2OHY2cE8vMlBvc2RmcUdqTUxGSDFBSlgxaStHeWhQSFRF?=
 =?utf-8?B?N2t0Ym9jU09FanRzYnVjZng5ZnVpeHJKY0NTbTU4WDlPSGdFRWhnRlgzOTd6?=
 =?utf-8?B?enFxYzJqT3QyNndQczNlTXUwcld3Y21Oc2h2RmJkTHZKRSs3THpRcGhmVzJk?=
 =?utf-8?B?QnNoZjhoUTV6OUtWZWNoZHJEcldmVXlWNDloRUlXU0krT2hPbDRUZTRCcFc2?=
 =?utf-8?B?N1pYMHdUcmFZaUJneTRXM1JSNnhzNXFsNHRPenNBUElqRStDOUZKQndlbTVJ?=
 =?utf-8?B?Z2VPLzFaZXN5L3l6MFFJNjZ3NStGT2JGYzFKVzhwNlFmS3YvVnkzMldvdUF0?=
 =?utf-8?B?ZzVYbmNRQk8zbmtRWm1TS2xyei9YdG9oTGlSWUJnVGQwZDVKTGxpcXN5Tkcz?=
 =?utf-8?B?d1A1aGlzRmdVU0ZHUVhqSkRjSG1GZVMraGpiVi9oalN1elFXWjNya05TVDVU?=
 =?utf-8?Q?6daHiXOoO+j1o/Jxwbl6SCtfF?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9abd07-f4a5-41f8-2cf5-08dcc0220289
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 07:39:08.4912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUsiN2z8wnZImJPu/e7LRoCcJaF1TYXTxRyoAEV/vxZgKNz/YYjd0ZMPEWJr+aWl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6811

Hi!

2024-08-17 at 17:06, Wojciech Siudy (Nokia) wrote:
> [You don't often get email from wojciech.siudy@nokia.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Wojciech Siudy <wojciech.siudy@nokia.com>
> 
> Channel selection that has timed out is a symptom of mux'es I2C
> subsystem failure. Without sending reset pulse the power-on-reset
> of entire device would be needed to restore the communication.
> 
> The datasheet mentions 4 ns as a minimal hold time of reset pulse,
> but due to paths capacity and mux having its own clock it is better
> to have it about 1 us.
> 
> Signed-off-by: Wojciech Siudy <wojciech.siudy@nokia.com>
> ---
> Changelog:
> v2:
>   * Removed mail header from the commit log
>   * Decreased reset pulse hold time from 10 to 1 us
> ---
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 30 +++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 6f8401825..e09d4d107 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -316,6 +316,22 @@ static u8 pca954x_regval(struct pca954x *data, u8 chan)
>                 return 1 << chan;
>  }
> 
> +static void pca954x_reset_deassert(struct pca954x *data)
> +{
> +       if (data->reset_cont)
> +               reset_control_deassert(data->reset_cont);
> +       else
> +               gpiod_set_value_cansleep(data->reset_gpio, 0);
> +}
> +
> +static void pca954x_reset_assert(struct pca954x *data)
> +{
> +       if (data->reset_cont)
> +               reset_control_assert(data->reset_cont);
> +       else
> +               gpiod_set_value_cansleep(data->reset_gpio, 1);
> +}
> +
>  static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
>  {
>         struct pca954x *data = i2c_mux_priv(muxc);
> @@ -329,6 +345,12 @@ static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
>                 ret = pca954x_reg_write(muxc->parent, client, regval);
>                 data->last_chan = ret < 0 ? 0 : regval;
>         }
> +       if (ret == -ETIMEDOUT && (data->reset_cont || data->reset_gpio)) {
> +               dev_warn(&client->dev, "channel select failed, resetting...\n");
> +               pca954x_reset_assert(data);
> +               udelay(1);
> +               pca954x_reset_deassert(data);
> +       }

For the case where you have a dedicated pin (i.e., !data->reset_cont) this
might be an ok thing to do? But when you have more things (likely sibling
pca954x chips?) connected to the same reset line an assert of the reset line
destroys the assumed state of the other drivers/chips.

During probe, the reset is followed by some init for max7357 chips. This is
completely ignored and a timeout/reset probably breaks those chips badly.

Also, if this timeout needs to be handled, it is likely needed if deselect
times out too. Depending on surrounding hardware, it might be really
important to successfully put the mux in the correct idle state when it is
not used.

So, I feel that this needs more work.

Cheers,
Peter

> 
>         return ret;
>  }
> @@ -543,14 +565,6 @@ static int pca954x_get_reset(struct device *dev, struct pca954x *data)
>         return 0;
>  }
> 
> -static void pca954x_reset_deassert(struct pca954x *data)
> -{
> -       if (data->reset_cont)
> -               reset_control_deassert(data->reset_cont);
> -       else
> -               gpiod_set_value_cansleep(data->reset_gpio, 0);
> -}
> -
>  /*
>   * I2C init/probing/exit functions
>   */
> --
> 2.34.1
> 

