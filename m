Return-Path: <linux-i2c+bounces-14112-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D7445C6361A
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 10:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6514034559B
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 09:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6268D324B27;
	Mon, 17 Nov 2025 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fXeRjMhj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010058.outbound.protection.outlook.com [40.93.198.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C81C18A6CF;
	Mon, 17 Nov 2025 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763373128; cv=fail; b=CVPBRWKJerFGfrWKwvfXjHceKxoqcCcmHUT/ftx91IiU34zL8vOlw4Dw/YDZSB5iSBABH28YDM/VjORdSAVHbYswnoL9eivJ6TjAPskvSn6B4Lbsr2Pdth/dSSARlzo0fstCnORA/joI+ArSyGxTD9/4kwGj+F8q9e9ECNlVnus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763373128; c=relaxed/simple;
	bh=+v8DPjav81VzxuhhThF26lLQp39DZNdsqmbKtaCubak=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BGxExfywYGdRAalCo76uQ4EEJuzRedJCSs7OEBkhPLhAyGMroS8oYgWOUZ/6+4i33+xB+JeDeJKCQSC+bN3mCbLUUMasLDuewrbTV9YCXxi4Tr5nay6YcofnFNkrVZ1J/7nIESiavSSKTUIXeKUDB3J+z0tU/8WMcl1IcqT1mGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fXeRjMhj; arc=fail smtp.client-ip=40.93.198.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfpvh5/dtc1Yn5pkLNzp2FAbTA0NpdZorPjXKgZu8/8XlrKF1qRdP47EkHQ8QpSqzM9XHN89extBo8kVH6iaZ+mrGTZTpi2kNXtVDmIxzKixtN3nkKAdjQu9f6+0QTkPcLZ6NNLLk5gDpgVHW7TFbyxGNKFJ2ZWCFW2hlpMYZdGnwt0cinnnNKdTkccwfYDf2hpOsSnlrp9JnGbwL+jF7zloaFX6RWwQfrDPQbOjbSRqzVt0fAiqZ2zLTPsByc/c5OXiIMpXe01q14CJgl4m3VJycAIjaqR905DuNp21gHq7HjWTfRbZgm/BQt4qoOyc2a+2RB5MCEQ+/YPJ+Q/shA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwAEztolJugii23ZwV1u/ZOkwCdBeCZn+4egJwAqknA=;
 b=owO3+DofOEWJZNMDAS8SERNdEBYw4bffA16FD131oPNk4uUhaGz4Cyj+t3S0XgxTKcsUBrlxA2A+/0vT+CqazsSztq2arogwp9AnFoC2OxjSI7QeuAlls+CjOOo2RIP0fKXpEw2G7TVsCCGaWjZ+PhKJVIeSffrqwAyvRtQ9oJTAo+9JV4cwqheejTja3Jnlvfj6CPdSOlpBbvhKhMYRMsm1bXrD5Kyh1/GG6rtW1IUAqzfM/95WdPfotgjutprFuqeG8JtfJ3hLMvBUD27+jhZXYkHkGjdoJ4f99boeeqaZeutM6zfBAuIjfESh5DMLpe1b+Mbnzrery2izHExxKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwAEztolJugii23ZwV1u/ZOkwCdBeCZn+4egJwAqknA=;
 b=fXeRjMhjZgRbT6SM1MzxxQWSX0xKCoV+KKC1qDp/c+L0EhW+m90CA5k4EG3f0tY5i9SWeBtNEYUJ25qqpQ5YMMuaBQnlB9LZrC3WD+GnyYCJR3KJRBAwx6Eu1wDKC2/h3Swi68pLhVbvOcMpOmjItnWY67irlMINn5+1mTZkZWq/DOH46NhAY3t6dRTsBTQoqxS4maB4YsbHO3CnmHwsfRPQHrwrShT9BjciKcfdqAY0cy35yhAXqyWtdp/i5aFD9Zf8gIDi5Mv66LmwIWpKNoL54kdzGOnSr41Dx+d2kKmOTeq26ZZaBzvzhuPqva29V2nIHfywYOg8LK4uG0F3kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH3PR12MB8546.namprd12.prod.outlook.com (2603:10b6:610:15f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Mon, 17 Nov
 2025 09:52:02 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 09:52:01 +0000
Message-ID: <e901986b-572c-427d-9141-dafd14db4fad@nvidia.com>
Date: Mon, 17 Nov 2025 09:51:55 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/6] i2c: tegra: Use separate variables for fast and
 fastplus
To: Akhil R <akhilrajeev@nvidia.com>, andi.shyti@kernel.org,
 digetx@gmail.com, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 wsa+renesas@sang-engineering.com, wsa@kernel.org
Cc: kkartik@nvidia.com, ldewangan@nvidia.com, smangipudi@nvidia.com
References: <20251115042632.69708-1-akhilrajeev@nvidia.com>
 <20251115042632.69708-3-akhilrajeev@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251115042632.69708-3-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0191.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::35) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH3PR12MB8546:EE_
X-MS-Office365-Filtering-Correlation-Id: 104b04be-3ab9-404f-8eea-08de25bef492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVRWSEZIN1FxbCtMTENjQTJ1eDRDOUp2UzY0MjNBKzRLc0ZTQUY5UVNrYSts?=
 =?utf-8?B?OFNrYjBGMVhQMHNnVzdSbDZmYlJYbUVXYkg0ajY5ci95RmZMajlLSmx0YlRx?=
 =?utf-8?B?YkhXY3RvaHBDbUdZVnVvYmVOVCtLN1Z1UDRMem5lRytsWjI0OTJzMlBVUFcr?=
 =?utf-8?B?dzhQL3JHR2tFN05GUVFORVI2clhIbXFFTzZEK2JINzg3K2xHcmxRSlE3dzJm?=
 =?utf-8?B?TDUrTzdoS2phZzF6NXE0M092bHFsV2lRWTZWdCt3VmhoemVJR01NdXZuMGRG?=
 =?utf-8?B?VDFYTlZNaDRjQVI1cWRmR1lJenRZRElCUEtUdWs4VkF2WkVNdW0yR0hOdVhG?=
 =?utf-8?B?T2ZmN0NITUJXM1lMZXRyekNMQjlSQlcrQngzdFZpK2RLQXdnaW1CSEQwWXVD?=
 =?utf-8?B?eFNYWnNoSUVySTdxdlRrSEV2YmJQVDBlTXZhSGRzQjgvMDNsMmJ6K05BSmQ4?=
 =?utf-8?B?TFR0RGVlLzcwdFRGbWVGRGR4MXc5RVlZN3A5SnliSlJsK3ZTMWt0UVBLSUNI?=
 =?utf-8?B?UmxmSEpYeXQvZGFuZUZ5NkVxZE5kU0Yrb2Zjd1RqNmdCbnp2eDJKRW54SGJZ?=
 =?utf-8?B?dE5BUHJWZDFFNHAzUGJtbklFcm9hZkIxZDJKRWVxb3dzM1lzVUxQUVVNTzk1?=
 =?utf-8?B?OWdnMDNYYm9uN2FtcTRqbVpUaGU1ZTlWRTE1Q2xrTVUrdlNXU2FnM3F4Vk5k?=
 =?utf-8?B?U3ZPcUtnMVZnSWdlQld2dVEweFNxT3JGaUhVWUlYZVFkRksxWWxKZXJ6N1VD?=
 =?utf-8?B?NVMrSEdEdXp4bFZESE1WaGwwY0N5ZTNLT0hoVGY3SVJRWWhnU0Uwenc1S25q?=
 =?utf-8?B?cExvaFRFYXNMNlNjN0JXWUhueWFLVmZHM1MyN25iYjNkcGhNc1VucGlhb3J5?=
 =?utf-8?B?cVNHenZZWDdrTE5NMElqYVBTd0pWWGNnMFJkWXo3N2JNMDhYWE9WR0E5QTk0?=
 =?utf-8?B?cTVTSkZVc2laM3hQM1krWnZ6Q2xiRGNhUElQMVVCWDdTdmk3ajNNYk05WVlK?=
 =?utf-8?B?SElxTFprSU04UXk1RWVNSFpVbzh1a2dQaGQ4Q0haNFQ0NDhhZWRCeUJCbE50?=
 =?utf-8?B?ZEVIaHhzSFluM3NncHRFN3dxRjlCK3NBZndqQUl6ajNhNmlQbzJWT01BUm5J?=
 =?utf-8?B?dmpUTXZBS1doQ05OYmNmeVhjdWhmRVpkS2FvbHltMy9IWHp5QXdtU3MzTG56?=
 =?utf-8?B?Rm9VZTdqVHlsWDdSVEdMaUVCVlM5Ymc0cGJrVVRoeW1yNnlKS0R0M2kybTds?=
 =?utf-8?B?Tll6RnhBdG9sRHpPTEQwYURBK2h3RVplN1VrVmxTb1RneS9VNW41OG9nNEE3?=
 =?utf-8?B?Nkx6d3RONmM5OFZBQmdVSGNBdHBtNGRyblJBUkdtM1NzbG84VUdCSDJINkI5?=
 =?utf-8?B?b243V25oRkF0OGYzSG5yNGdsMGxtZVFiUjRPR0VYL09GQVpyNENVNFJnR3pt?=
 =?utf-8?B?M05YRGY3WEZZZEdkTVRwenR1ekYxclprbDMvbXc4NGNiLzNKTEhVZGN6LzFX?=
 =?utf-8?B?MWM5MnpOS2JGZUpHdy9ZVnQ2YWx1VXFqWFlQd3orZ3VOeitvaytaZlZXQjRh?=
 =?utf-8?B?NXo3QnI2cTdtT1NIMy9FdFVJdWlnMjFncklTQS9IZEV4aEg3REFQNE1sTDRs?=
 =?utf-8?B?L01HbXV6YVEyMm9aTTJIYU9DV2hUNklObHlVYXB3b1hRbFozQVRnWG1rd1I3?=
 =?utf-8?B?Q2NZUXd5dUg4dGtiSlY1bDhxVXFGM2llRmJPVzFkNzdLRVZDRlRyTEtteUtt?=
 =?utf-8?B?bFFweVBud3BxdVJ3RXhtVDlsLzUraVBzTzFKOWYwdTF2VWg4M0R6bUZwc3Rv?=
 =?utf-8?B?Rlcza1UyNEFWK2hES3ZGUnFGSGpBaWZiUk5pOUV0T1pBaDFlRGZqWk9Oeisw?=
 =?utf-8?B?K2tVaE1DY0pDbEcrU3BZNE1CSS9LZmlrcTdHWWJjT29DMElvZlNVZkl1Y3pZ?=
 =?utf-8?Q?ed8Ft8vP7LYjOSolsqsdzoLFn3U2t5yR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFU0RmY2aW1YSE1EVFhQSnF5anc1TXVyRm9Vbk84bWtXcGtlOXE5Q2dUNVZr?=
 =?utf-8?B?ejVzRlhUUC9ydkJJNUZDY1Ivd01EVklXVGtRcUYwS2NUNjZNNU1TOU4xalc4?=
 =?utf-8?B?bTFRMkdpTGd6aWFGN2tWbmhZQUlocVdIeU1KaHlRY3NlM3AwNEh0dmhLTFM2?=
 =?utf-8?B?Rm5ldlFMd2V3Smd5UHpSckkzaHZIZ0JETC9RZC9lQ3ZzNzRocTUwMTdrZGpC?=
 =?utf-8?B?MnBpdHoxL1dJUVczZTJFRWVyWlo4elVzOXFLZ2toOXo1cHNoNlhkZndpOGZi?=
 =?utf-8?B?d3JxNHQzUHIxMU80eUlhejBXcWM2WEVHR3Y3TWZoTkt0Q1JmYlRsb1ZiSHc4?=
 =?utf-8?B?a3JyZU5lRkV4Z3NpdDc4UGQ0Wk9TZ1E4U25XK0d3MC9aQjBNSnJ2aE1sRlM1?=
 =?utf-8?B?SE4zcGdnOFZlOUJGUHdybXd0aHFYN1FCbGx6K2dMU1hwNDFwaXhlUDI3Tlg1?=
 =?utf-8?B?RjQ2Mnpoa1VvY091MnIwcU5xeEQ2ZzBPdWc0cW9UQ04rNlJvSUEyK2NOOHVK?=
 =?utf-8?B?RFdYVEdQbXRnKzdKN3BqSGxDYWdqcndHVTZ6eDA3bGlFbEFNWlVrK1krSUY1?=
 =?utf-8?B?bmRDdEZDTXNMVy9vdFNxbm8yS3JxWnFCa1MwVEI3ZW9xWU1tek53ejhURHAx?=
 =?utf-8?B?NXJ6NFFYREx5M3d1SEFFY3o5MUxkODZwZFNtQWxSYTFyVmM0SC9MMksyZkdk?=
 =?utf-8?B?YW1zcStyUTZSSWZQWDdDc2dSendpcUpIQThjbEdzNWFMKzBYb2xZcXZOanBL?=
 =?utf-8?B?UDRNMkxzb2lxWnNHcENPZEZoY1BhRjZ3STh5YUt1SUJvUllQRkV6Rnpva3BJ?=
 =?utf-8?B?Z3JldnZFVGV2dGVVYXJkdzB1Wkc1RVRrRkg3VFpoeFdrYmlpaVhZL0JuYjMr?=
 =?utf-8?B?ZTEyb2ZsYVhSem5abkc2MTh3ZEJYclVXQ3Q1enVjSnpZSjZOM09CcWpWcEJQ?=
 =?utf-8?B?SlRqSGpIRHRsUmI5MVBqNXR4RDdvVVdnbWNkeG91eFZqcjV3aUxadm11Mi85?=
 =?utf-8?B?RUx4VjU2ZTF2VmlhNDg5clZNSnJGOGp5NXJVZkxqcFVlS3JMeUlnWm1nM1Rq?=
 =?utf-8?B?aldQdHhNN2JIbXdsNGJZS2M0cU1aaG9SMXNzYjRmRkZxdVQ0TGgxaHNWWmRp?=
 =?utf-8?B?Z0NnVzY0SjJqc2l1Y3hJZzBWd0JjLy8vREgrNUZvZzFaT28vdi9SVlVCQjlh?=
 =?utf-8?B?SG90UVU1VzFzWlJkL1JMcWNPdHJsVmxiTzB3anBkUFZEc3lyN2VSVnJRRTJs?=
 =?utf-8?B?MFBtdTYrOWFEaEdyeXN5ZGVrUFlpRmJKMXpKWm5uTlk1SVNnUVk2TlZQelg3?=
 =?utf-8?B?ZmlrZHI2dVBqT0h0eFVxRHB1RTVHR0F1MHc2YjJiRUZtVkloeWNZVGZkVFht?=
 =?utf-8?B?WTFjMFphR01aUC9NN0JOUEp4UTdCZnZMTTM4WmEvbFFxZ0Q5WUdWVmZhcktS?=
 =?utf-8?B?MkVNRGUzTXV3a2xDRHBWTkZBeE5CTmJmQWk1blZwZ1cxL0s4QThDbFdwNWdI?=
 =?utf-8?B?ck1Sci95VGx6S2pJNG5uRXZtV0o1eVVCTFlxODJXMkFqSTQzUTJSZnZUcVlV?=
 =?utf-8?B?NFZNem8xS2dpZFI4QzZFQ0FBRm5zazFpUG5wTGdGbHlWRTVLZ1FNdWJzWmx6?=
 =?utf-8?B?UHdkKzhxY29GYTRrSWlVSUhoQ1pXTDAxM1JQUml4QkI4THQvSmZTVlpTNS9n?=
 =?utf-8?B?S1VYU1UyVHFkeW1qb21ESFhFYUVFT3dYdFdqb1ZvOXpFNDNDNEloTDQ3TkNP?=
 =?utf-8?B?TWpyS0NCYWN6TGVCZ1N0bWFSQkYrY0JYWXk3b3g3Y2svYjRaSk1HQW1LT3BB?=
 =?utf-8?B?TXBPWU5IMjVMM2hzdXZLVFh0N1BUNXA1TVE4MHJrMmhTZUtGcXZUVUM5MW04?=
 =?utf-8?B?WGhzaU9FSm16eExxU3JEendOVlNIbE14Z2xJbkFYa3QwN1JHc1R1T1dYeENh?=
 =?utf-8?B?YzBiSThRZzAyekk3cmkvSWZwaGxnWWFuQmhrRkY3UEFhdXZ4U294U09EYTc2?=
 =?utf-8?B?aXVKNDRsMDNnWTVCWGxwWmo3aG5NVlF0SUQ3Y0dhNDRRa2MvdFgrczBYdkM2?=
 =?utf-8?B?d2tDaTBTY0hJN0oyZmZoWTkwcHptbkduUVNCbVZ5UmV2SzBKS2gyYWRpUVcr?=
 =?utf-8?B?Wk5wZ2hnV2lVSUhlbnhIV3NCb1RjbTBpV2tEa0hySlg1ZDdtc3lUY0UrSVh4?=
 =?utf-8?Q?6t+TyBA0/RjLPXBhsfc/W+NIrY3DGttYsvLbnZp8tr9P?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 104b04be-3ab9-404f-8eea-08de25bef492
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 09:52:01.3688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rr52USbig3ueZve95Gdr4w1LpqEI90kNdbtfiyxxklTlvEA/TZdmeHLVAxBPzcUwJg31dmYooQ0yOUnCsVskEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8546



On 15/11/2025 04:26, Akhil R wrote:
> The current implementation uses a single value of THIGH, TLOW and setup
> hold time for both fast and fastplus. But these values can be different
> for each speed mode and should be using separate variables. Split the
> variables used for fast and fast plus mode.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>   drivers/i2c/busses/i2c-tegra.c | 119 ++++++++++++++++++++-------------
>   1 file changed, 73 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index bd26b232ffb3..c0382c9a0430 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -196,12 +196,16 @@ enum msg_end_type {
>    * @has_apb_dma: Support of APBDMA on corresponding Tegra chip.
>    * @tlow_std_mode: Low period of the clock in standard mode.
>    * @thigh_std_mode: High period of the clock in standard mode.
> - * @tlow_fast_fastplus_mode: Low period of the clock in fast/fast-plus modes.
> - * @thigh_fast_fastplus_mode: High period of the clock in fast/fast-plus modes.
> + * @tlow_fast_mode: Low period of the clock in fast mode.
> + * @thigh_fast_mode: High period of the clock in fast mode.
> + * @tlow_fastplus_mode: Low period of the clock in fast-plus mode.
> + * @thigh_fastplus_mode: High period of the clock in fast-plus mode.
>    * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
>    *		in standard mode.
> - * @setup_hold_time_fast_fast_plus_mode: Setup and hold time for start and stop
> - *		conditions in fast/fast-plus modes.
> + * @setup_hold_time_fast_mode: Setup and hold time for start and stop
> + *		conditions in fast mode.
> + * @setup_hold_time_fastplus_mode: Setup and hold time for start and stop
> + *		conditions in fast-plus mode.
>    * @setup_hold_time_hs_mode: Setup and hold time for start and stop conditions
>    *		in HS mode.
>    * @has_interface_timing_reg: Has interface timing register to program the tuned
> @@ -224,10 +228,13 @@ struct tegra_i2c_hw_feature {
>   	bool has_apb_dma;
>   	u32 tlow_std_mode;
>   	u32 thigh_std_mode;
> -	u32 tlow_fast_fastplus_mode;
> -	u32 thigh_fast_fastplus_mode;
> +	u32 tlow_fast_mode;
> +	u32 thigh_fast_mode;
> +	u32 tlow_fastplus_mode;
> +	u32 thigh_fastplus_mode;
>   	u32 setup_hold_time_std_mode;
> -	u32 setup_hold_time_fast_fast_plus_mode;
> +	u32 setup_hold_time_fast_mode;
> +	u32 setup_hold_time_fastplus_mode;
>   	u32 setup_hold_time_hs_mode;
>   	bool has_interface_timing_reg;
>   };
> @@ -677,25 +684,21 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>   	if (IS_VI(i2c_dev))
>   		tegra_i2c_vi_init(i2c_dev);
>   
> -	switch (t->bus_freq_hz) {
> -	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
> -	default:
> -		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
> -		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
> -		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
> -
> -		if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ)
> -			non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
> -		else
> -			non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
> -		break;
> -
> -	case 0 ... I2C_MAX_STANDARD_MODE_FREQ:
> +	if (t->bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
>   		tlow = i2c_dev->hw->tlow_std_mode;
>   		thigh = i2c_dev->hw->thigh_std_mode;
>   		tsu_thd = i2c_dev->hw->setup_hold_time_std_mode;
>   		non_hs_mode = i2c_dev->hw->clk_divisor_std_mode;
> -		break;
> +	} else if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ) {
> +		tlow = i2c_dev->hw->tlow_fast_mode;
> +		thigh = i2c_dev->hw->thigh_fast_mode;
> +		tsu_thd = i2c_dev->hw->setup_hold_time_fast_mode;
> +		non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
> +	} else {
> +		tlow = i2c_dev->hw->tlow_fastplus_mode;
> +		thigh = i2c_dev->hw->thigh_fastplus_mode;
> +		tsu_thd = i2c_dev->hw->setup_hold_time_fastplus_mode;
> +		non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
>   	}
>   
>   	/* make sure clock divisor programmed correctly */
> @@ -1496,10 +1499,13 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
>   	.has_apb_dma = true,
>   	.tlow_std_mode = 0x4,
>   	.thigh_std_mode = 0x2,
> -	.tlow_fast_fastplus_mode = 0x4,
> -	.thigh_fast_fastplus_mode = 0x2,
> +	.tlow_fast_mode = 0x4,
> +	.thigh_fast_mode = 0x2,
> +	.tlow_fastplus_mode = 0x4,
> +	.thigh_fastplus_mode = 0x2,
>   	.setup_hold_time_std_mode = 0x0,
> -	.setup_hold_time_fast_fast_plus_mode = 0x0,
> +	.setup_hold_time_fast_mode = 0x0,
> +	.setup_hold_time_fastplus_mode = 0x0,
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = false,
>   };
> @@ -1521,10 +1527,13 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
>   	.has_apb_dma = true,
>   	.tlow_std_mode = 0x4,
>   	.thigh_std_mode = 0x2,
> -	.tlow_fast_fastplus_mode = 0x4,
> -	.thigh_fast_fastplus_mode = 0x2,
> +	.tlow_fast_mode = 0x4,
> +	.thigh_fast_mode = 0x2,
> +	.tlow_fastplus_mode = 0x4,
> +	.thigh_fastplus_mode = 0x2,
>   	.setup_hold_time_std_mode = 0x0,
> -	.setup_hold_time_fast_fast_plus_mode = 0x0,
> +	.setup_hold_time_fast_mode = 0x0,
> +	.setup_hold_time_fastplus_mode = 0x0,
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = false,
>   };
> @@ -1546,10 +1555,13 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
>   	.has_apb_dma = true,
>   	.tlow_std_mode = 0x4,
>   	.thigh_std_mode = 0x2,
> -	.tlow_fast_fastplus_mode = 0x4,
> -	.thigh_fast_fastplus_mode = 0x2,
> +	.tlow_fast_mode = 0x4,
> +	.thigh_fast_mode = 0x2,
> +	.tlow_fastplus_mode = 0x4,
> +	.thigh_fastplus_mode = 0x2,
>   	.setup_hold_time_std_mode = 0x0,
> -	.setup_hold_time_fast_fast_plus_mode = 0x0,
> +	.setup_hold_time_fast_mode = 0x0,
> +	.setup_hold_time_fastplus_mode = 0x0,
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = false,
>   };
> @@ -1571,10 +1583,13 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
>   	.has_apb_dma = true,
>   	.tlow_std_mode = 0x4,
>   	.thigh_std_mode = 0x2,
> -	.tlow_fast_fastplus_mode = 0x4,
> -	.thigh_fast_fastplus_mode = 0x2,
> +	.tlow_fast_mode = 0x4,
> +	.thigh_fast_mode = 0x2,
> +	.tlow_fastplus_mode = 0x4,
> +	.thigh_fastplus_mode = 0x2,
>   	.setup_hold_time_std_mode = 0x0,
> -	.setup_hold_time_fast_fast_plus_mode = 0x0,
> +	.setup_hold_time_fast_mode = 0x0,
> +	.setup_hold_time_fastplus_mode = 0x0,
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = true,
>   };
> @@ -1596,10 +1611,13 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
>   	.has_apb_dma = true,
>   	.tlow_std_mode = 0x4,
>   	.thigh_std_mode = 0x2,
> -	.tlow_fast_fastplus_mode = 0x4,
> -	.thigh_fast_fastplus_mode = 0x2,
> +	.tlow_fast_mode = 0x4,
> +	.thigh_fast_mode = 0x2,
> +	.tlow_fastplus_mode = 0x4,
> +	.thigh_fastplus_mode = 0x2,
>   	.setup_hold_time_std_mode = 0,
> -	.setup_hold_time_fast_fast_plus_mode = 0,
> +	.setup_hold_time_fast_mode = 0,
> +	.setup_hold_time_fastplus_mode = 0,
>   	.setup_hold_time_hs_mode = 0,
>   	.has_interface_timing_reg = true,
>   };
> @@ -1621,10 +1639,13 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
>   	.has_apb_dma = false,
>   	.tlow_std_mode = 0x4,
>   	.thigh_std_mode = 0x3,
> -	.tlow_fast_fastplus_mode = 0x4,
> -	.thigh_fast_fastplus_mode = 0x2,
> +	.tlow_fast_mode = 0x4,
> +	.thigh_fast_mode = 0x2,
> +	.tlow_fastplus_mode = 0x4,
> +	.thigh_fastplus_mode = 0x2,
>   	.setup_hold_time_std_mode = 0,
> -	.setup_hold_time_fast_fast_plus_mode = 0,
> +	.setup_hold_time_fast_mode = 0,
> +	.setup_hold_time_fastplus_mode = 0,
>   	.setup_hold_time_hs_mode = 0,
>   	.has_interface_timing_reg = true,
>   };
> @@ -1646,10 +1667,13 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
>   	.has_apb_dma = false,
>   	.tlow_std_mode = 0x8,
>   	.thigh_std_mode = 0x7,
> -	.tlow_fast_fastplus_mode = 0x2,
> -	.thigh_fast_fastplus_mode = 0x2,
> +	.tlow_fast_mode = 0x2,
> +	.thigh_fast_mode = 0x2,
> +	.tlow_fastplus_mode = 0x2,
> +	.thigh_fastplus_mode = 0x2,
>   	.setup_hold_time_std_mode = 0x08080808,
> -	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
> +	.setup_hold_time_fast_mode = 0x02020202,
> +	.setup_hold_time_fastplus_mode = 0x02020202,
>   	.setup_hold_time_hs_mode = 0x090909,
>   	.has_interface_timing_reg = true,
>   };
> @@ -1671,10 +1695,13 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
>   	.has_apb_dma = false,
>   	.tlow_std_mode = 0x8,
>   	.thigh_std_mode = 0x7,
> -	.tlow_fast_fastplus_mode = 0x3,
> -	.thigh_fast_fastplus_mode = 0x3,
> +	.tlow_fast_mode = 0x3,
> +	.thigh_fast_mode = 0x3,
> +	.tlow_fastplus_mode = 0x3,
> +	.thigh_fastplus_mode = 0x3,
>   	.setup_hold_time_std_mode = 0x08080808,
> -	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
> +	.setup_hold_time_fast_mode = 0x02020202,
> +	.setup_hold_time_fastplus_mode = 0x02020202,
>   	.setup_hold_time_hs_mode = 0x090909,
>   	.has_interface_timing_reg = true,
>   };


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic


