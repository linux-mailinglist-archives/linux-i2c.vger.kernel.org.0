Return-Path: <linux-i2c+bounces-13799-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D3FC0709B
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 17:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D242E502837
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 15:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBA832AAAC;
	Fri, 24 Oct 2025 15:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="co6l7HiC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011042.outbound.protection.outlook.com [52.101.62.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA522DC787;
	Fri, 24 Oct 2025 15:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761320605; cv=fail; b=SU58+YGN+1QcNEsnJuFJWvaWjMEDF64sV26/SkoF/ErQnU22ryw5jr3YOmc5hGBNvjPEmim0Oyy0XGjHMR1xP9dF4TlQkv964+edNJ8LBC9YcHxI3IwAg/BdX7tiS5pxpYL0KQS+0EpgtlQrTnrn19O7yR8EIclCpSthzdMKneQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761320605; c=relaxed/simple;
	bh=vt07SDQILiNi+YA5eS96YozrjhKA6o88ekgKEKNbuLI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aV6O122HvXxdB+jI8ewUZWoc4OubTiPS57Mj8hzaBFeJ2K7XiXbpoJB6E7B2BXlFk5EJFc98nCkfy1gd0DP2dnG6BsCBL+LHQ+aSY15/NrB2vbmHzSBasi1sLBX6a9ate9sBUaGBOJfhfWWLtVuvBHGZklh4JKmIdv/UCTEqJWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=co6l7HiC; arc=fail smtp.client-ip=52.101.62.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxuE3BedC2Ytp/JrW+8/CgKhC4GCE/Ie7wWUM3wqNb727ejpOlr6sx1MkUMDwSOgeP2rF0Njk32/AttKI83+43YC/ALUk4q3ZN7datIiEtMBD+AItou/r2JAQt/f9gXc5Yf7uRJezU9Qr/OZtzfEr/U2mCP17TZbZ4dZFtN6bd2BfFxKyJfkkXJs7MAhk25wMUT6gcs3lD2LOidYROOmGVUCgkFKJLuJQPsrm7VdrmJupiRLjZk+5bobLR1rcmnZ5LA3uWSkcI4mda223yJg4v9GJbUHQaPe2RieRbGiUPVewrY5vsGSQ/wenna9SZ7F06OHlIB/AsP4D2GGf9cwmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14cZKzG7h1zFOCRmU4L83J6Cyuz5a9yUOXPFzhl4O4Y=;
 b=yL2f2rUkjdoUEbhdkbM+DJsaI9WogGoSukn9Dk4Zg9jQvNeI9bk89SY4k8sb8oDWUilLwcYx1GW6fj0l209Up0M2pooPDksVKkOLnnhhysq9X19LjG6DhcRa3OF9EJUTG4XliaOwmD5aIcABoWtMoaAFps2bXp1fH3AcZKn3gkrnZTCdkj8g30AAnYvC9s4OrgdzL7bRqFmKVVsfMlURTvERMm4YxpFrekxj/cLJns0yjbl+4tJZqkpVRxG7bbHrVEuL2lcODLKLuq9RSH+3Gco4aaZzwYXCl59W49jtPNsZZUf5yK++uRfcjdIWozpyLKTht2r1OIwJPKNt21lhhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14cZKzG7h1zFOCRmU4L83J6Cyuz5a9yUOXPFzhl4O4Y=;
 b=co6l7HiCXEzVegtmGlOpcGdbOamLquxJJilwDYQ5I4ssghOLYE/+GW/boRuAotvby61e8FZX3/3RK/rzBtBTIeD5OAYB5ZYxQR4Vl6581sGpH0kUOdBkYDB6nJo49RK8DL4eP9XyT65TvwiXQMf8faxTlwx4j4FIRNpHxEbaJfrqUZ2AabHahbp1d83u43gjziNLSHDWmC5VSK94XGsmJ5revRA5unkslne0dGKTqTwg3Sh8c++yH67MBg50t8iC1fFoeZUZgMhoa1X36Vb9l+2vqY9bA1mwvmYVmxKijEUK42Qv5eQiQyy/of14VI2daROT/zsMAlam20fXPjO8ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA5PPFB9BA66B77.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8df) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:43:19 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:43:19 +0000
Message-ID: <cf862356-1ed4-48ca-9d43-7e008a86eef0@nvidia.com>
Date: Fri, 24 Oct 2025 16:43:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] i2c: tegra: Add Tegra264 support
To: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251001064759.664630-1-kkartik@nvidia.com>
 <20251001064759.664630-5-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251001064759.664630-5-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0023.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::15) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA5PPFB9BA66B77:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b13a8b5-4b33-4a47-c011-08de13140e24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkRuemFTNlRtS05idjhWQ1hBZkhqTnNYRzNSSUlaU3pWT3pSQVpFV1g5cEdL?=
 =?utf-8?B?bDFaVjRlaDNSWFlNdVVzM0xvL05lQ3NpdlBDTzVMYnRKVVZuZXd1Q05wSG5k?=
 =?utf-8?B?cWFLQlBWY3pTaSsyRGF0cEU0VlB1Tkk3N2FXeDRUK281K3Zxd2pqU0VQcnZp?=
 =?utf-8?B?bEU2QlNJRlVFOTErVWRueGpLOEthSzcxMk9ZTk9NNDY3OElMMnI3RGZad0tq?=
 =?utf-8?B?SktIeEljY3FaZTRuSVN2bG1HWEp6emN3czgvcVlRZ1BiaXUxR09MQWlOSVYw?=
 =?utf-8?B?RExoOEl0UXpFU0xLM24weCsxTnAvY21Qam91VnRSbjA4TjlrQ3FWYXN0WmVR?=
 =?utf-8?B?TStaYnkrQktPTDd1NnNweFNWVzArM2hvWEgzMFg5UUFXWTZwb0gvQ1kyZUYv?=
 =?utf-8?B?ZTgvRjlUeERLblVvbk5JYjVqT1FXLzd1ejRqZWJlekJTZVp1VTVlRThXQkhH?=
 =?utf-8?B?bHR1eXB1czRBR1ZtSGNyTVNtU1VJTnUzaGdBeThkSU1nTE0ycytDSkxDWXRB?=
 =?utf-8?B?ZG5SSndjenZQclMwMERGbXdjUWNnbjU4V1oyYlBpWlF3SFJUcUdsSWd3Yk4w?=
 =?utf-8?B?clp6YkxKN05ZemZKZDJ2NGpBeDEyREY5RUEwZlV3d2g2ekR6OTFKdXRZYTAv?=
 =?utf-8?B?RFNVZk5rRGo3bDZrYU4ySzArN3NhcldqN1lxYmh6RlZucldyVkxGMlRvcUc3?=
 =?utf-8?B?TWU5YlQ3cHBJUUxYMUVGV3dHVHNRUWdZT3B6UnhjN0I5Nkl2czd2UHdyQi9z?=
 =?utf-8?B?czVHK2FQTUo4Um56UzZlSEhPM0o5S3o4Z2x6aUxzY3ArdVd4UkNpOFFRSTk4?=
 =?utf-8?B?SjMzTW5mL1k2eWUzd0t1Vkt4bFVOVENNbFBmcFF0VW9kS2NBU1gwQmtVamNp?=
 =?utf-8?B?dmFVOSt6RGJEZlRKaU82cWxCT2o4eGhtU0x4UTVleWhQY2E2SmRiam9YTTFB?=
 =?utf-8?B?SGRoZ3U3OTErVStvZlRhSDRKSUFJTzRsWUFOR0ttcHJKM0tpQlN6b2gyd1k4?=
 =?utf-8?B?TExyMG15T0JYcDM2VTNYa2UrUUM0TlJNRU43Z21zU1czOWc1K2l2bFVQbnNU?=
 =?utf-8?B?NlRiYVROL2M1Z2JQeXRhUWczTmgxT2F4ZHpQa2NpbzRtbk0rVmpsOE5RbjhT?=
 =?utf-8?B?UXk3UTJCMHdQK2J1cks5RWVSVlZNUk9jaFp6WjF5eGxOUDM5RXkwOCtCKzVi?=
 =?utf-8?B?YXZjT0Iwd1ZNclRhTGNOWnNXSlRHaC94RHJ3RmZzZzRldnFXMHRLYTl0OVA2?=
 =?utf-8?B?d1E2Q1pyM3h3Z1RSb3d1cFZhSk9KWGNNTlAwTmFFdXZqQ3lXNm9wWGtkdFlR?=
 =?utf-8?B?WUZQdFB4b1FkdklqSUR0djkvVzZyRUZOQmQ4S0lDWHNJVkFoeVVydTQxZXVG?=
 =?utf-8?B?cWVFSXFIaE9hbVZHY2cyODBMYUh0UVNwb3ZRRmFydEhDRmdnSEN6RWd6RkxV?=
 =?utf-8?B?aE1Da3k1ZXRHVERQdklBL0VqOGNBcXhlZFhuUVVLUE01MjZrbVRlVmdCNWI5?=
 =?utf-8?B?cldja2dnOHFkRVVFQnE1ais5TnJiVStWalV6Y0dDS0NDTnBEMUorVTdCSVhD?=
 =?utf-8?B?V0JJenJzMC9xY0JIVXZBOU9zRnZOellGb1dZVmZRcDlMcVNjY3VIMERnWTBY?=
 =?utf-8?B?Ky93Q2kwZnlpNWF6V044K2Mrd1kxWVI4ZDEyMTVmNkpvQkZiWnFLUTAvOGpi?=
 =?utf-8?B?NzRkdy9iZnFZeVp2NVFuRGwvSHNnWnEyYTlRc0h6eHhNcEpSOXZiL2J3dVVv?=
 =?utf-8?B?dy84TjRaOVd6QkpwRnBLUURLM29IUWM1dGljdDY4bDBRbngrUWZrQ1cvZ3ZU?=
 =?utf-8?B?eXl3cHd5eFc5cktDNm9mNHZPa0sydXN5VEFUY0g4eUV6enY0aEVKTmVHU2l3?=
 =?utf-8?B?aVQ2Y2IzM3lHRWErdHlod21ldk1WbFdCUHB6SVpvNkNjem9OQnd5a0t6WlhT?=
 =?utf-8?B?MW01UmhTTmZVK25tdWoySGw2amowVW9xNDM5cndkd0lyVnU1OVcxNGwyVnlB?=
 =?utf-8?Q?il2cU9p54T0qC/QnQXGlttr93tFznM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzdrVEhQaXIvSno1d1BqcnZDUWc3WGJiYlluRENEOWx0SVF4TFNHVm1jRk9o?=
 =?utf-8?B?bEJ6T3Q4Y3ZERDh2d2dIUVhoMXFDN3ZwY3VsNUErLzZhci9pOE5mUE11ZjNU?=
 =?utf-8?B?U3hva3VDT0RreXpEbU9mZFhqT2hNck1ZcWZReW9HYk93dnMrbU1EVG9qOTdR?=
 =?utf-8?B?ZzFKOVdadEJaWU9MZmNDVE95Q1FORER1UHFoeE94WERzbmpLTS81NGV0d0pu?=
 =?utf-8?B?Q2lzUGZOUDFSNDIzSXVkOWd5Ti9HZUJ0OW9oQXloZkZRaFY0eFpHWUU0V0Nw?=
 =?utf-8?B?Z1J2OWJuNjRkb0ZSU1NvTGFvazBMUjdvWE5rZ0ppMHJrcmFacGdHcmx6TGt3?=
 =?utf-8?B?QWptUW5aZ0QzUUNlZjVIcnA2amMrT1R4VHdockt1c3lUZGdUOFMrcjgwRHBV?=
 =?utf-8?B?bktTWUMrbmVyd2ZoQkdlNC9CYWMrSHNuTzIvSS9zWm5YNVVWWm1pVDJBT3lW?=
 =?utf-8?B?SE9CREgzRHdMaGY0RENJRTc3MkNob1V1ZlVxOTJxbmt0aFZqTWhJa1BDaE9I?=
 =?utf-8?B?YlhocFpvSi9aaHBtSzlHRHdhU213RWh0ejFaRXRpZWhSMUxFakJ4WktkbVls?=
 =?utf-8?B?N0pDZXBYL1Nsclo4OXpGOUVOckMxbmtObjBFTkh6ZHFvL0p1SU5EVmtoTlZG?=
 =?utf-8?B?Nk5COXhjM0FsMnpzNko4eFM2clJzS2YrNGhuRk9WRjVVOUhka1UvSHF2Z3pP?=
 =?utf-8?B?eEs0TWlsOWE1YUVUTUptYzBuQ1pPVzdTZE9weUw0aHUxSUFkWGNITHFHd1lP?=
 =?utf-8?B?YkxydGo5NWRLc3FIRzVaRDBNRFVFOTJaSVZvdVp2QzlCS084VjMzUXNNMXFH?=
 =?utf-8?B?b2NLbjBiTEJlb3o1ZmxTNGJuOEk5Z2RNODZiS3cyUVMxUlZyL2U1Nm9RWDhH?=
 =?utf-8?B?VS9IcC9adFR2YTBoWG1YRHptajV3Q0RmTERYT0J2S2Y5T1Bqc0tkeElLUWg1?=
 =?utf-8?B?MHdDMjVXeWU2emhkN0RUMmwwLzFlR252dkRFMElkVEQwNE45U3g5akpERmhI?=
 =?utf-8?B?ZFJZMGxodlVIODV3N0c2WUptNldZNXMrUS9keS9yVGhFUlVZOTRKU2lvc3FM?=
 =?utf-8?B?S1lCazNIRG5JSnJ4QVVkcUEra3VHY1RtTDBYTkl3Q0NYUHpRblNFQUpwL0FL?=
 =?utf-8?B?dCs0TWhqRktZNkVmTndIZXRqNWNFK3JZYWtnNjNOUTd5K0ViNmhHcnJmRmZP?=
 =?utf-8?B?ZStyeUNDTVBuOXpFL0NjUG4rdU5PMlZ4cmpMWHljd1N3WHFYdUZhbzFuaE9Y?=
 =?utf-8?B?bDFXOUdQdk85Ni93UjRKUWJ4UncxQklpc2hYU1NoK0FMVmp6ZkJHeDhPbndX?=
 =?utf-8?B?WUhBUCs1MWpNc1hkVHhIOFJKemJQb3RnLzk5dUxWcXFDQUNEZ05RUlZQTU5v?=
 =?utf-8?B?bGNLTHF3aUZWTHlKT1ZIVVo5UXFnL3h4ZWdmdGdLU1psN3dpOEYvbHA5UzM4?=
 =?utf-8?B?Nmx6RUsrUXZLWUlHWmViZldYZFEvb3VQSmtMUnpsMWpmQUVSM0k2bFREQ3ln?=
 =?utf-8?B?eTQ4Z2Z2eEtQWms1Ull4QkJpazdBUFI5VWtzSlVFb0xnU3dZWThtbjNUZFFW?=
 =?utf-8?B?cTZEOExTaFdmMHZuMzRkaktHZG12ZXFHWHY0YlpxT01RcnpNcHhBeEE2eml3?=
 =?utf-8?B?MWZJTjZ3WWVia1NXYXp0N2IwREQra3RTdng2bW9YTUZVM0c2T0FoM1RPbnd3?=
 =?utf-8?B?YXRBV01BRmhxRTFzQ1k2L0hOTUlwdmVLQXczK1JNZXpxajl2YTlRWE9NYkVI?=
 =?utf-8?B?UWc1djAzUFlERmNiK0hmTFhTZy9BUmovZWhkSE9OSFYwTDk4dk9iTDl3VXI4?=
 =?utf-8?B?VzhRd0FhTlY1Q1JFSWw0RWMzOUVTTWF4YXpjUnB4Y2t6U0pYRmM0Mmh6RDY5?=
 =?utf-8?B?dDN3K2tyTlR0aUFPQU8xdUxtbFJMeUd1QlNIcDVtQ3doMVBUeFFJaW1BWGoz?=
 =?utf-8?B?NlFZaWF6SElycEEyQVFPb25FK0pqUjdTN0VmV2tCNzJCNUNsMWZHbm95eVYy?=
 =?utf-8?B?azRjbVF5azBBWTdlQ1d6ZDdOWVcyN0tFRjhFNmNZVGRhaS9nQWIxWmhndkt2?=
 =?utf-8?B?S3kzT3c1U3pQdit4c09hR3Y5bzJxZmVNUXdvN3JsMnZLeERYa3ZHODJYQVZs?=
 =?utf-8?B?NHMxTHdsQzBBVGZNTmlBUTF4UkJucWdsWmJMV3NPa0JtbVpkNXoyNEloOGlS?=
 =?utf-8?B?VndlRVk1V3FsdTZOOHYyV0dTVTlGR1Yzb2wrdCsyR2xtUlVieVVyOUoraFF0?=
 =?utf-8?B?cWcwbjByRVhEQ1lFOVBFSUprSUNRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b13a8b5-4b33-4a47-c011-08de13140e24
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:43:19.3529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYrFvNk4e9USSYtfLOqqCxRWupLGZ78hkKe4oB0gBmlpexY4DnWC9JPutPAnXMoWEP4Y1w5HyBexeWSo4YqWeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB9BA66B77


On 01/10/2025 07:47, Kartik Rajput wrote:
> From: Akhil R <akhilrajeev@nvidia.com>
> 
> Add support for Tegra264 SoC which supports 17 generic I2C controllers,
> two of which are in the AON (always-on) partition of the SoC. In
> addition to the features supported by Tegra194 it also supports a
> SW mutex register to allow sharing the same I2C instance across
> multiple firmware.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v1 -> v4:
>          * Update commit message to mention the SW mutex feature
>            available on Tegra264.
> ---
>   drivers/i2c/busses/i2c-tegra.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 1c8c24ae54ed..f324cf3b1f28 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1814,7 +1814,36 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
>   	.has_interface_timing_reg = true,
>   };
>   
> +static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
> +	.has_continue_xfer_support = true,
> +	.has_per_pkt_xfer_complete_irq = true,
> +	.clk_divisor_hs_mode = 1,
> +	.clk_divisor_std_mode = 0x1d,
> +	.clk_divisor_fast_mode = 0x15,
> +	.clk_divisor_fast_plus_mode = 0x8,
> +	.has_config_load_reg = true,
> +	.has_multi_master_mode = true,
> +	.has_slcg_override_reg = true,
> +	.has_mst_fifo = true,
> +	.quirks = &tegra194_i2c_quirks,
> +	.supports_bus_clear = true,
> +	.has_apb_dma = false,
> +	.tlow_std_mode = 0x8,
> +	.thigh_std_mode = 0x7,
> +	.tlow_fast_fastplus_mode = 0x2,
> +	.thigh_fast_fastplus_mode = 0x2,
> +	.tlow_hs_mode = 0x4,
> +	.thigh_hs_mode = 0x2,
> +	.setup_hold_time_std_mode = 0x08080808,
> +	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
> +	.setup_hold_time_hs_mode = 0x090909,
> +	.has_interface_timing_reg = true,
> +	.has_hs_mode_support = true,
> +	.has_mutex = true,
> +};
> +
>   static const struct of_device_id tegra_i2c_of_match[] = {
> +	{ .compatible = "nvidia,tegra264-i2c", .data = &tegra264_i2c_hw, },
>   	{ .compatible = "nvidia,tegra256-i2c", .data = &tegra256_i2c_hw, },
>   	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
>   	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic


