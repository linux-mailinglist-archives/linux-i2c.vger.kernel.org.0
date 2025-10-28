Return-Path: <linux-i2c+bounces-13850-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C83C142E8
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 11:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4A039580A84
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 10:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731BD3112B2;
	Tue, 28 Oct 2025 10:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jnUe881B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013060.outbound.protection.outlook.com [40.93.196.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A538530F803;
	Tue, 28 Oct 2025 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761648126; cv=fail; b=vAl+prfZlZ4WJh3p2mZyNwcLknicuK9JDV8uwIKgqlEhzB2UBt1uy66bTRj+F4yLKgDQqw3oWs2QnywKuadtdt80znY22eVGFdfZwwKYK0CNgr3u/MXNDZ2tiv3lKWvdAe8+f4QKFIlQ4fHgA9hDFytncBfhUt+JRqm9ds/HESM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761648126; c=relaxed/simple;
	bh=8MCP9vtl56fswZGUWabt+8nbEWwmL0re57HfN+sUzSo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X8wSz8bMBoOODMRcNeeAjX4y0Fio+nJRz1FsnZG5TvJOggCKq268UjjFD8OLU/nnmzr2JmoLt3bohHxmgyx8eTeyztBr8awyip0x2LVpMxhFsntqfgy83cIq+Ppj9RS3E2wB0o5gOcg1RIHcuqiX/1aDzG0nrk3M7Az2F9BZhXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jnUe881B; arc=fail smtp.client-ip=40.93.196.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBVZF8wh3qcXkdb/wgPhLiM80+xKAv0Eq+xhU/ednu94/F15i9gGeWSQClGjP/Vxt3qTIVEQz25RbFXypwa8dkLFpo7MTIqwVjARp76sb+ZLetJVsQOXW7N2ku8ECfpIpHuHEpjOYOhXocE/j6dbBTcerl9cZEFN9NO5YIpXEwHvelZ2nZiV1NXnpnZJ/j7n4PBE7c9Fmqr8/FPeB1hQcKHveKw/hAPbBZ8zASQdZPj/43alToFSwxTAwbK1NMsTMPTcjCHIEGjwDTADR8qyhkO4i40XnxceXsveFf9cPRmrthxEnXm313iNnxae9n86gfqLkvnFGir+7VhtKXXnZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9IuGoPdESeUbSBRhjjwxYc0q8q01di5olXhab+vPKg=;
 b=FmSzuu7f0FkWTCrICA5U2TpVsBbeiUJgwvH7KKNVpUI/v7WKaSEZGHM5Yq7cP41XjZlnzG9J+0YX4co7XVyvMLCXDMPbNlYPhOwbRlVHRuRpxH6yIMQ1koTUxUWJqJMu8ZaW1C5+PCjNFcYGVQlch3gnyRXi0KBoE1B9CbHtAsZYaFnQLOoGLM55OiztyZt1dIzVO9U+xXsLLuLO2ekunibCcfj71ehoN9zyr4jAUq+cVKO8DkT1qDQ3doEcrSIZkGv8EEEfONVlKz3dtoK/RiwfAAnJ7Fpi0fiWTmNzT2USeOeqkU44Hw+P8su0LExoU2NvaPWEhXRkGOG1q+ATqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9IuGoPdESeUbSBRhjjwxYc0q8q01di5olXhab+vPKg=;
 b=jnUe881Bc4zh3nYH8Do4Uv88BCq1elTGjQGZ0VxgGOD/evHOOLxNUVc8v++14+SGiJpXPFZxJzij2VL1TDj5P8QszUeOpm9PclVbRYSHLbuG2ygPDR4Q2K4rJO9iRr61VJqkHhAGN8idTW6G7G4RY1+8gDUSZ/vJogpKUtBWTrIJnoLRzP0ZpaPc1uiDy3UHjY+rAaFvExb5LgIEtrCNZFImDnCz4mXIoiPUcpC9HZWoZbsg8z7jiZFuiCCwknihRxLn7F8oIQ7b/p4HXG3aVcfI9CghBwHXZA2SQ42zJLPDw56nCnf1aEu56C7nBgCpRcPEaXL8o+w77sTdixa7vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA0PR12MB4349.namprd12.prod.outlook.com (2603:10b6:806:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 28 Oct
 2025 10:42:00 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 10:42:00 +0000
Message-ID: <bf3672db-0013-4696-940d-87bd68e7518c@nvidia.com>
Date: Tue, 28 Oct 2025 10:41:54 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] i2c: tegra: Do not configure DMA if not supported
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 digetx@gmail.com, kkartik@nvidia.com, krzk+dt@kernel.org,
 ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, robh@kernel.org,
 thierry.reding@gmail.com
References: <fa389b08-7ca9-4c0e-b9fb-68d9a58ce79b@nvidia.com>
 <20251028100028.67388-1-akhilrajeev@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20251028100028.67388-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0393.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::20) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA0PR12MB4349:EE_
X-MS-Office365-Filtering-Correlation-Id: b4b20a79-1f30-4856-b69b-08de160e9fcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2c3ekdxQzdjVXEzL1ZjQXFlRWMxQ1dWRDlyTTJ0SFowUkI2bXU1MEdIWE02?=
 =?utf-8?B?TWxvVHdQVm5kUXlJV1Uyd1JhTjhTMm1telV6c1NKMk1UZE9VZTBLN2s4ZXQ5?=
 =?utf-8?B?Sm15MzUzZWNnazdOSkgvaWM0ais0SVNHdkYyQnBFZTdrS25ZWU9xVXFhU1h3?=
 =?utf-8?B?YlBObEh2WU5YMjQ4ME1oaGRSVytmNnNBWUsxbE5qMjRKdGJTZjhjQTJ5WGJT?=
 =?utf-8?B?dUJzcStETUdnaHVZNU5YaWFZNmsrekRxSGM5T3k5bVBDQlJZYkY0UlVBVkcr?=
 =?utf-8?B?NkNCdzR5WUliRmN5YXREUVpUL3Q4aEk0Y2hyTFlYTU9ITmdzdkg4d0VxUE9F?=
 =?utf-8?B?NVduV2NDckgvRlUwOVYxbHRkbm9tV2pqdmtZM0duL3M5cThMeEZpZ3o0QUYw?=
 =?utf-8?B?dVVlSE8zN2U0MEtDQW5ZYS9LQytOZmZaeExBVTJVbUI4azIxQVNGeitVNmlG?=
 =?utf-8?B?RThMVUtxT3I5cDVjL2FRNGpLdnlzRGN5Y0VSczlyaDFjZG5uZm9SSno1L2xG?=
 =?utf-8?B?a0lWbVVHNzJPc1hmb0hCY2ZMbSt5d3B4OUphVjhRZ014REVudkxndlRIWG5k?=
 =?utf-8?B?YzBjamZ4blZJUjhRcEg2dU5kRDdOeTE1Nkt6NCs3VkVUOGFKWWlXUlZGKy8r?=
 =?utf-8?B?eHNkR1I0d3REYlhUbWxrUFlXTGtmaklJQUh1YmVLQkorVklnaUc3K1l1ZS9x?=
 =?utf-8?B?L3Y5amNjSUM3blZyRXRld3l0Q1l4NTc1dTkzYk14ZTFseG41UlFWNk9ocHpX?=
 =?utf-8?B?cmwvRnlhMk52SWJFdUZjbWlxTWhvdi9YSjQrTERqVWNSb1EvdVJFdTcraWpT?=
 =?utf-8?B?ZkhtOXh3TlByS3hzN2gwYktrN2dhU2JCSFV2aTJFNkQ1WHpiamJ5eVdMNEJz?=
 =?utf-8?B?d3BvYVl2T2ltVkZGVitaN0pRaTdtWUpmRzBYdVVmcHNMaVZkTVF0eTFKUG0w?=
 =?utf-8?B?TlB1WXFGRnNBT3c5dHlLblVCSlNuY0owdmZPeDRUSy9aU1BjNm0wc3NINCt2?=
 =?utf-8?B?OCt5VHpmUkJRTExvRkZnZ2NYWEJieE1ic0JidFhldzE4ZGEwY1U4MzVJU0Vk?=
 =?utf-8?B?d2Z5bk5FT0ZkSVNkMG1hWk5jOGJDMHNqMERXbVZHQXdqUit5c3J0YzRkMytB?=
 =?utf-8?B?aEljU0d4MDVCTUJHQ1dXMVpoTnNSUmxpbGxURjFaa0RjK3NzajdHY2RrdVhh?=
 =?utf-8?B?NnZIbG1kM29vb25WQWRNcVZnYmRPY3YxVXN5YUxGMnZBUWpCdXdBQVpiZXBP?=
 =?utf-8?B?azUrQjhyTnMySUlzWVVOVFQ0M0toWUxkUE1Jb1ZuRDk5THlhSzIzYVFYZ2FW?=
 =?utf-8?B?V0tsd3V2YUhzSWE5NWFBQmhvVTdUVFZXb0owaUpDdWpNaXFhYnRTc1ZqdE1s?=
 =?utf-8?B?S08xVk5tY1pmTFFUeUFESlhtSTlkNUkwMitwaHRaMndhdWNjU0V3TVlFeEZT?=
 =?utf-8?B?ZFVIWEQ5djRQN1dBQmVLUktGbXBNOHozT0QwTGlkUGxiTDREeG1xbzJuZFFi?=
 =?utf-8?B?ang3dlAxekdSRXVqVUR4VC9DcnFLV205N0hiVEpYNjhQNmtCTzFuL3Jpd1h3?=
 =?utf-8?B?eXVvWUFRYWFQQmJNOGVOQUl2Skhhc2RaZWlLM0dYMGh2ZVhKT2JqV1o2OUdZ?=
 =?utf-8?B?WFpsZmpsWnlIZXMvSGU4VC9vMlppY3dQQUI5U3JVdk9wLzR3OW5iYlV5U1Y2?=
 =?utf-8?B?NldReUFZSUhFc0x5QjQ5TzJhZWJ0WFVNYmkvT1RuaCtjcDhOMlpjd2hYS3VG?=
 =?utf-8?B?QUVKSWQ4dVpuNFNiY2FaS0J6dnRPOWx2WWpUMVNCTDJxYThRSGExODZNOFlP?=
 =?utf-8?B?NXA0VGtYem1yaVlPMGRady9ndXV4V0hJNVJXbHYvYkVmTjhPRXVtajJBTmlS?=
 =?utf-8?B?T3dvUTB5Q2F4U3BWdjM4RnVCQ1BlcnlXS0NCSUJPeXk4UFA1blpqdi9uQUww?=
 =?utf-8?Q?jiN9JaSuWLLuSDE6BcquelNb+waxt746?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0JmTHAzU01uNElVUFVyQ0dYSHBVSDV5cUxtdUx6UXozN2J2c1JTSG9JZkRv?=
 =?utf-8?B?ZlQ5RndnQ1FTaHQxSDVGUkRSSDBnZkdtWjVzSVZDZ3grUGwya1o0NXhWbERB?=
 =?utf-8?B?cWpWOWtoRDBjV1AvYUxSVEVrWEs1c0IzQzJKQzhuNXA2Z3VRRHdvL2Z3SG52?=
 =?utf-8?B?Wnp6ajhTb202R0ZoRUtkTHRnODBBd2gzYmY2NXZGVUhpMWp5QjNsSWhybmFj?=
 =?utf-8?B?SVZLYXFDTnVqVmhacmh5NVpEeitlSUpxT0FuWDhPT3djek1aY3RtQmRXRVZD?=
 =?utf-8?B?RzYxNHl4WHhUZzd4aGViOUZ1VXpsc0d1VVR4WVArcG90anVYczBKdEdLSkZ0?=
 =?utf-8?B?TS8xNUh0TzBWSUs4Z3RKeGZ2SjFvcHZiTDVobUZRRXRmM01zNVJITjVKeVc2?=
 =?utf-8?B?QjlidG1sRk1ydndrNFFyWmxuQ0l6YVVYVzMzMWJvbklzREd0Um5kVGIxSnhj?=
 =?utf-8?B?eGFwTC9Ia1k2SDFSelVFSSswcFlEMWVMVjFqK1hxRjVTeklLNVYyVnBSb01z?=
 =?utf-8?B?QzhQMU00Y1dXR3FTMFlwb3NLWmtOdy9tYmx1VVYxTW8xVmxYOHQzdHVYTGR3?=
 =?utf-8?B?bUdMbWVuVDFNU3hmYWhJVzJYQ2szQmFWZ2hMTXZzSFpQSTkxandUODFnVFox?=
 =?utf-8?B?QVdyS2RNdDZibmVoT2lBVjZpc1p6R3V2T3QwT2xkK1Bzbm9DMWZlb0xWejh4?=
 =?utf-8?B?RXMrU2hvUFBXMGVJU2w2Rk5Vb2Z2RC9TZkRPNmU0STBiMHF0dFpkQVJTK0Qz?=
 =?utf-8?B?d3R0SDJhQVhvYkZQVW9DdHZTWE5sSEhFOGlaK2ZMUlQ5Qmg1enhxNmlscUVF?=
 =?utf-8?B?bmd5dGVrVG9pTThoOU9yK25OQXhsTDRSZkkwd0o0L2lwa2xWaUp4cW1ob3lt?=
 =?utf-8?B?WjR0cENnbEhYNzhiTDhTb3Z5S0tSYzNLM3JTTEZFSXAwTDdLeXgrWWtjbVRa?=
 =?utf-8?B?MTJSZHlJZVdzQXNIeEl3TFpTaFFkdDNaZEt0ckpqdjEzZWdseWFxNmtCMFBt?=
 =?utf-8?B?QnpsL0k1Mk5SejIvK2tBSGd4amJldUNpM25FdjQvb01NQVAzSDIvTUJ4d09h?=
 =?utf-8?B?aVhuTFozSjlxU00vZzZYcnhidDJUVGl3ZmxCdlBDVHBZM1JoaUpTOFRDdVlW?=
 =?utf-8?B?dmtQRjNaTGZqKzEvYUZQRDYrS1pYcDVGZmVYZUdRVWFIaTZ4OXpaNUhNUjFr?=
 =?utf-8?B?OHc3Z0tVQVVjS3dtTVRMenI0SlFmMHE3eHRYYlRqQVBhRllMVms2d1ljU2Z0?=
 =?utf-8?B?SDlZSTRwNFJIVkxKTUNycVQvVW9WNDFYMVFDNFVrZkRDZWZKNjM5bHcra3VC?=
 =?utf-8?B?dnprdnplSndvbWhMODZySDY0WnhCb2RyL1VLZlpZSlBGN1llekp1L3R1V0Zt?=
 =?utf-8?B?bXdxa3p6TG8wdVFwcTdOdExqSDRyZ3I5c2VhOTRKM0Y4MldTMzBMZ21DeWdK?=
 =?utf-8?B?cTRVcTBva0Z0NllIZm5HbFdlUDNQMEJLYXZ2OXJqUjF0TmQ1RzVaeDM2TC9X?=
 =?utf-8?B?VEtOU1cvMWZKSWduc3JYeGJLT2VVN3NERUNMK0lWK29pNThLZFZFam9OMDhx?=
 =?utf-8?B?bGRCMnRaYkhja0hpSHlQWkZET3o1SS8rdmNIT2JyN1l6RkFDbGZ0dUZoWnFO?=
 =?utf-8?B?MTBiWFRaN2xKV2MydnJvZXNtRW4zTTduVW1OYnBrVFBEaENtOTVHUkJCSFRC?=
 =?utf-8?B?N3BPaVcrZlBJcWdZQS9lSFdkNkF6RGFidUFQSk1wS2Era0lDOHBHV3UzbkFB?=
 =?utf-8?B?ak5ReHNNRGZZSzhLKzJFbVd2Y3phWXp2RnZQcTRrTDE4MU5TV3B5SWZkMmhi?=
 =?utf-8?B?emMvblBsaVFHbi9EdGxBOGF6cmlsWlZ1ck1vM085WDMzTzJRWm05ZkpVWXNa?=
 =?utf-8?B?Q1J4bmFGTDE5QTFRZGRvK1NNODAwajZQZEFYelFGSlBLREYrbWY1MG1DRFZQ?=
 =?utf-8?B?aHBsd3pWcEJ1emNQSjVzM3N3UGZyTllOa205YkFrMC9HSnpSbmk4bVhDNStQ?=
 =?utf-8?B?SkhHa3hLWHJ5LzYydEo4VllmaEdwdW14TkE1RXYyTDNKOTA1TVBTU3M5MklE?=
 =?utf-8?B?Zm02ZUN1MWNWT25PblVHL09aVkJqSXRnVXhtTjVoNkdkbXdPS21qdVRhU25u?=
 =?utf-8?B?N0JpMnNhdDh1Q3Blby96V1pxS3RNTTRZRUpVbGZ4WTZTR1IyODhSWXBMZ1l3?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b20a79-1f30-4856-b69b-08de160e9fcf
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 10:42:00.0826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+duvpDzwMsXJaHeoF3IbgvVHmEMcmYsq6NUtC3FF4KW95IiR5WySyA+fAJQztcHkVutqxtCPNjNihyx1MtNhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4349


On 28/10/2025 10:00, Akhil R wrote:
> On Fri, 24 Oct 2025 16:20:09 +0100, Jon Hunter wrote:
>> On 01/10/2025 07:47, Kartik Rajput wrote:
>>>> On Tegra264, not all I2C controllers have the necessary interface to
>>> GPC DMA, this causes failures when function tegra_i2c_init_dma()
>>> is called.
>>>
>>> Ensure that "dmas" device-tree property is present before initializing
>>> DMA in function tegra_i2c_init_dma().
>>>
>>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>>> ---
>>> v4 -> v9: Moved the condition down to have all dma checks together.
>>> v2 -> v4:
>>>           * Add debug print if DMA is not supported by the I2C controller.
>>> v1 -> v2:
>>>           * Update commit message to clarify that some I2C controllers may
>>>             not have the necessary interface to GPC DMA.
>>> ---
>>>    drivers/i2c/busses/i2c-tegra.c | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>> index e533460bccc3..aa7c0d8c0941 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -449,6 +449,11 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>>>         if (IS_VI(i2c_dev))
>>>                 return 0;
>>>   
>>> +     if (!of_property_present(i2c_dev->dev->of_node, "dmas")) {
>>> +             dev_dbg(i2c_dev->dev, "DMA not available, falling back to PIO\n");
>>> +             return 0;
>>> +     }
>>> +
>>>         if (i2c_dev->hw->has_apb_dma) {
>>>                 if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
>>>                         dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");
>>
>> What about ACPI based devices?
> 
> The of_ function returns false if using ACPI. Since these DMA drivers does
> not support ACPI enumeration currently, we would not require to proceed
> further anyway. But if required we can add an additional check with
> acpi_dma_supported() or similar. Do you suggest adding a check for ACPI?

I was just wondering if it is better to use fwnode_property_present() 
instead.

Jon

-- 
nvpublic


