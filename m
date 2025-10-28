Return-Path: <linux-i2c+bounces-13857-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9DCC15B92
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 17:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCCAA406803
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 16:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E84347BBA;
	Tue, 28 Oct 2025 16:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="URxTWn6V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010011.outbound.protection.outlook.com [52.101.85.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CFB343D76;
	Tue, 28 Oct 2025 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761667806; cv=fail; b=Zbi4lpHjvXGSkPhHPLAuECcK+XI13+oQFOXOo5S4B2c9ZLgN/YuZ4SaOVddnf2u+eXGUHov59H5EwrJHk38bnlFpH4hUyOtoiK9JkzvEo1fHOI9h2brEFx8mESQbqY5T/9uTVW+QRzJC3i6IjSK93dbvb1WSM3R3nPR3++9V/SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761667806; c=relaxed/simple;
	bh=H6UGdZSBEhIeC/0LZuivzlzJV29f6o0KdZUu6kM0a0g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OalZ/wvX916E2/dXvdxsQZuc2ksTO5rCPyd2EH6h2bPZThUDaX2CFryRrylQAA/y/CmIinBug/vrVJXXsF0lJ/JPc2zkgHyH/1WBggiR8Cy9a9LTwRxYP6WM+HP7PgsJNfJCEx66tLaH0J2QqfqsSW/etiqf63FtelLm8WEQMLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=URxTWn6V; arc=fail smtp.client-ip=52.101.85.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MU/nIplSEcFDJnhi0BimbcYzS+nvjyY9mqCmXT7G3jfxHIZeGe1WNNF5gsejWLJDvBn4eFhfurJjwi+vbv/s69yjZkUC2hMvpN0D7XFF6xxttsldiQpAdijZWZ6fuV5dPpCDQFoVl/G9rd9V58Bg1P5LN6c4CwqRXyfF7x1BVA8eAHx80MTA0WlBsz++XK/RiJvyQJn0/3F+xYtAoAuikXa0mnG0jICiB+Edh5TeYB2FQ6ySi0Kx28IJkm6MqKMITZN4S576suyPj3BXfBp9+op5LS6vitZf6TzsHjJvPXGlnzefkjZTDgTXEO58m4I4YteweqDQvRRszkHR69At0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKKztmpwvL5AwWJdaqMiYa8pIpmOhY5M2hUPM55YTaw=;
 b=pj/NU1wHot+uSVCGBiM7wmrsyd5BDzn21prZcBYY/Ma1ZQ5zXRIlcWX9hx1lHqbZuzM98creTPt7htsDc/xoFRr12R6OKvKI5mWA7SjaKEJewLItcNxRW9PozBkiL96FVYUEIO+ZZC3ReNXgqge8rJHtRvq+zp+2XWaCBaSD4k+7E0W97GgBY+K5l+1lihAi/mLrZG1q1TtTJSe9364YKHFe6ZEKr7ASKHAdbAqTI+A/lBjWtmMcsJcqA3L5c/2WjTjKM0gPYEtfZw8mMCrr7zEhTeFvgAo9y89gyN1P6m2hRJLqQIyuV3D+oCdanFo2c4FhEPiZ7GwZthgAAoqDJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKKztmpwvL5AwWJdaqMiYa8pIpmOhY5M2hUPM55YTaw=;
 b=URxTWn6VHd6Gt91MTuY8wyvghFblkEOKPe2I46NApCheHWKrnmwKTAIJdDbMPUKcoCAqBRasCbDSpUUQDgXuwYQ6IcTjcoRdWAjZejIw8TS/sRwCfeRu3AKGW5c4UgpoGw7t1RjnS9KFkFXENPxpIE2Ot3NYBjkJ6I6ktEPtc44qcXifu6mUxPhPnG+bWoh4x/5MfXr/cjhwUy8bclUgYQEZumQ0tRcTMOyS1D4SlSbQdWFa+hjcjXbpd4lV27QnmbBdfQgl+SFUAfGa0QfkgZRIvt89LMIbHj3bEdDKRhV3AWP//7dq60QuIW2U7Iu/unOFpw7MjWJzHQNyOlX8xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CY8PR12MB7753.namprd12.prod.outlook.com (2603:10b6:930:93::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 16:10:01 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 16:10:01 +0000
Message-ID: <562719dc-99f1-470e-935e-a19dbfcba92f@nvidia.com>
Date: Tue, 28 Oct 2025 16:09:55 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] i2c: tegra: Do not configure DMA if not supported
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 digetx@gmail.com, kkartik@nvidia.com, krzk+dt@kernel.org,
 ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, robh@kernel.org,
 thierry.reding@gmail.com
References: <bf3672db-0013-4696-940d-87bd68e7518c@nvidia.com>
 <20251028130820.52188-1-akhilrajeev@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251028130820.52188-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0298.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::8) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CY8PR12MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: 440103d5-eba9-471e-a03b-08de163c728a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3RwaE9ReGR6bXQrUzROcldiL1h1b0ZqVnNzOTRsZy94bDhMSWIvRlNRUXVp?=
 =?utf-8?B?OHFRTmFrNzExOTZWNTAwQ2xJTGllaTQ1cWlEcTU0cWU0V3o3d0pCZDA2SEtD?=
 =?utf-8?B?ajNZMm9HYlFCRHVQcXNTS09FVER2c092cFF4MkphRWJDMTZIWTRGL2NLdFBo?=
 =?utf-8?B?akxvdnlCVi93UmhxYlgzOTZQV1JqZXlrRFAyVWtNenRIVE40M2JVSk0zV3ZK?=
 =?utf-8?B?Uzl3UlNkb2ErdXNCVEtMZGZIaFMyaGVtWDhlSktJL0IrdVI0NlRjQnpGQk1n?=
 =?utf-8?B?cHl3ZzBMbHJ4WVk0RDE1R0RyV21LcERnbjdtN2ZrWks4R1c1VnRlL2swc1hn?=
 =?utf-8?B?MUc2LzhnV0hBZUNzcWM0TU1ndGNRSHdhWjc4b3lpSFBEbzFRN203VzJ3ZTd2?=
 =?utf-8?B?QnFFcVVSVWdmTW92a0tqTHA0Vm51ZCsxMm50SjBIcURSUXJtaXJySGRkYk1m?=
 =?utf-8?B?WkRmK1VNRVl5SjhIMVJ4V2FMTHMzVm56cmFoWUM1UXkwRk1pUnhGSlkrNkQ0?=
 =?utf-8?B?ck53REdvK0xiZkUxRHB1SVlhankxSk1SMkhEYndDajBlT2x2SHFjazlUZFpL?=
 =?utf-8?B?UE1jY3E0dnB1TVE4TGhDT3ZvZFptTThLcWtWemxyb1h3aFRQekhIOWY4M3RZ?=
 =?utf-8?B?ODJpWk82R3NJU2Q1Uy9NdTRGOS90Y1A5UzhSNmdNTjcyeU9mUkU0UjFBWE0w?=
 =?utf-8?B?NmlzdW9KUTcwRHJHSEN2N3hoajlXU3pvV0tCNER3ZjFCYTFrSlBqdVhnTDRF?=
 =?utf-8?B?U2sva3F5MnRrdjNQRTlDaUdBUVcvSExjcHhOUnJ6bERQVUxlb2NQYnh5eThm?=
 =?utf-8?B?NXdhWkVWQ0hjQS9vcTRhTUF4K24zSmphb3lNNWZzVDhyVk9kTDFuREdGTjJ6?=
 =?utf-8?B?Rm10WmZWUEduRDAwK25jb2FxcFBTaElEYjJMVUIwTWhHZEkwU0VSbkFoRWt6?=
 =?utf-8?B?TmVrZkFJSDlrV3VPZ0tJUVJISlFLR3V1UDdhb09XWW9aQUU5UHN5c2VRL1dH?=
 =?utf-8?B?b3VwcTZnaTA2VW9CdnFObU0wQVZjcjVzSlJpY3Z3cE9GbHNiZEwwSEszSEda?=
 =?utf-8?B?ZGlDdERYazZESi9BaldnTDFzLzZObTFIWnZ3cngzL3BFRjliSEdWek1EbDFO?=
 =?utf-8?B?YitZOXBacEl2UWpIZHVyL0c3TmlWQkcwaUJuc3dyb240R3JoM2dTRUJNR2JW?=
 =?utf-8?B?b21jU25zUU9NMUg0aU5jdm9CTU5YbWdDaHJ1LzcxaFBPQ0NPRXVWbWEzYnlu?=
 =?utf-8?B?MzJzLzZTY2hYWGlqMUtqelZCK3JSYSt0MUxLempNVFJ2UldlcVh6VzdNZUs2?=
 =?utf-8?B?c01WYXpKa3RtWUxTVDczWVFYR21LbXl0aXdQc0FzcEoxNkFLM1NDb0gwSGQ2?=
 =?utf-8?B?ZjFqejJRTWxYNDBIT2hVeS80VHB3Z1RhSWxteGJLRWFhNjhYMk1ibFg4QTJD?=
 =?utf-8?B?bjZNRm54dmxuc25ONTlBTzlpQ2RYNjJLMDlaL3JWdkw0RFNvcWt2Q2Z4UGRC?=
 =?utf-8?B?bk1NN3RaMjk0SFBPS01CcXBnQ0VUck9iN2V5TEFFNytVY0FpOWFrY0YwTkFR?=
 =?utf-8?B?V2s5MjZhMHVaeUdzUW9va0pTVkFPdzBacnE5dWxsZEowZkNtOHQyMVhvb29r?=
 =?utf-8?B?VUkwR0xuelFoa2FrUUpSY0lDSitXOVJTYmVRQStRSXRtUmw5SElpc3g0dERo?=
 =?utf-8?B?OFUrMlFTc1V0R1N5SzZ4TC8vVWhwQlVLODh3V3dDQ0Q4UzJBZGppUmgrbTRy?=
 =?utf-8?B?SmMyN0JGZzduTmtJbXg0a2ZINVprNnRrQlRrZlhwdjA5amJ2OHJpU3F4OGdz?=
 =?utf-8?B?dy83V3Zzb2pZaHFPeTlsWVhSSWtWVXFqSDIrb2hMZ3JOQzkxVXpSWEk4UXpF?=
 =?utf-8?B?K3pDVFZwd09xNGRVVXFQcjVqTnREVTFVeXpEaG9NNVhxUFc4S0FwS3Z5RnpK?=
 =?utf-8?Q?RmdZ99mpGzTt29N5S8Ptb+PwCSeqMIDY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eExpWDhyL21ySVkyeGl6TjRrbzVMeDNRQ3QydGJmcURSdHRmaklvTDU2OHZn?=
 =?utf-8?B?SlpEeUJjVUZWMitlMm8vbUVYOHZ0WGxjMnV1MFZZRzFHbkRIejJCVEhlV3RH?=
 =?utf-8?B?ai9IZm11cFhlTTNidU9WTmVaMEtjaXFwOHNsZFZuVk8zZmw5ZVZFUkZyQUUx?=
 =?utf-8?B?MjBnRjN5RGg1U3VGOFJ0U2NhQWx0bXFWdEZEOVlpM2J2QzYvTDE2bnNzMWtG?=
 =?utf-8?B?R2hqMUhwRE43K3hQWGZLQ3JSR3pBdzFiZjVLWUQxeVh2QXNPeEowWDNFcEJ3?=
 =?utf-8?B?ZUpxTmhDbmN5b3owMTZiQlY0ZEg3M3VWYUZIZmRselYxZnZFRGw5NHFNMWtx?=
 =?utf-8?B?MkVXWUswYnkrcXp2Si9SRGFYR3FTN25sY0RWWWpVOXhRT2lWbHJXdlpkVXBS?=
 =?utf-8?B?elpnZmhiUFV5Sy9IRlgwQTErb0dQdGFpSEc5SGVseG4xakJBWnBrZDVWbm1x?=
 =?utf-8?B?UXVIblVXc3JlM1Q1WjdxK1NOVDNGRG1FYkwzK3hSNVBFSnhjTWpqUmxTNUpU?=
 =?utf-8?B?LzVrQ0JadUhIRWthd0lMZFBrWlhZdDBNU2lKeVVqR0F4YmhJdklHYTFJUlhD?=
 =?utf-8?B?cUQ5dEl0K1Nvdy9KcGU4NkNENkdMVG8zNVhQTjk4enVFR0liclVWZUhycnRx?=
 =?utf-8?B?YkdOS1JiS09DY3NpdVhpM2RLSzJKbUFyV2FPRzdUR1R3Q056NEg0eDNDbmU4?=
 =?utf-8?B?UFFYQklPREt3MXE5bTAyZytxaVBZcWUzdFp3MFNLOE1nSUdQdWZiSWk4OHV3?=
 =?utf-8?B?Mmk3UlNURGRlaXVpc2RRUFNPeXdMNm9qbXBJNTJ0VjRQck9UdWhuVVYwanVF?=
 =?utf-8?B?RVNUUlZqMUZCaEdMQ2VtZzlRbjExc1RSazN5ZmhjOEFCS3VEbDdac0dpOEZB?=
 =?utf-8?B?NWEvenVYMTdnNnJaemtNZ0x3SS9GRGo1b2t0NEovQkVCTndJTG9MaUZXVEtB?=
 =?utf-8?B?VElJMTlBcllFZitMeGtaSVRmTFBFOGFhN0Q1MVVObmxIOTdUMzgvaWx0UG1R?=
 =?utf-8?B?dWpubWxrQ00yU0NFV1E3T0NqdXp3SFM0Z2d2VnBpaUVXM3U1LzMydVFDVDY2?=
 =?utf-8?B?NnhSd2RvWXh3Q3FmRklJUG9PUTZpRERkWXFFbjBCQnVtZ3R2enFvRFRrV0VW?=
 =?utf-8?B?MkdXYjh0T0d4ME04bjJJbVhObU5GN21USEZtSkNmYndHd3lXcGNieXJ6d2lS?=
 =?utf-8?B?N1h2ZzVYYVZ4MkNuWmVpbHVJRzNDZXJoWFRzZGtRMnZzaDJFamVDUndxdXhY?=
 =?utf-8?B?US9KaUNzRlpoRXB3MWJENDlpQjBhTkkzSzVVTm5VbXhtSkJGd29LOXBBWVpn?=
 =?utf-8?B?SklaWTlhMjErY2I1M3cxWkt5QUd4OTVxNGRvZGt1WlJCN3Z3dzdtTkNacXpy?=
 =?utf-8?B?SmtKbW5EL3ZpT2IrVE9LSVk3am5pSG4rWEpjUDlOM0RzbTNpZnQ0OHgzZUtE?=
 =?utf-8?B?NFJYQzliLzZyOGtRcklxcjVzR0tYRzJBQmdFL2VLbFpXQWhya2owSHRYOHc5?=
 =?utf-8?B?bEtWdzNkRlNFWVNMbzdDR3E1OFZlQlphQW8yeVZjRURjQ3pjQUJ6WFhJUDVQ?=
 =?utf-8?B?STJXSjRTb0pnTWhHYzAxNEhUdlF4REFBQnljekI3NzN1bGFwYUhKb200c1VM?=
 =?utf-8?B?S0FZRFZ5SmJYbW9WRGh2azZ0U3FiaytUY2U3OFNrWXp6TE4ya2VZZkRtVU9v?=
 =?utf-8?B?Z1Z0MVQxV0xOK1JJQVZQWUNQbXZVMjJKQWJYWjA4NE9adEdwQlkzR1FlaWVL?=
 =?utf-8?B?SVRTR01xbWRnaHltSGRETmFGWGlrMGI3QkQrdEdtdkxIbnhPSEZOdFNCYlNh?=
 =?utf-8?B?OW9TVmZqRk1BdWt5RWVYL1VVc2d5R1ErQk5DRHNaUlpEQ2hFT2RuTm9nNGNn?=
 =?utf-8?B?aktsRHpkUlZ4NW93cTVuZ1FDc1FvQ24wR0d6SkJXZWpobHY1WU1XMGkrVitU?=
 =?utf-8?B?Sk16YVVzWnpPTDVTNzR1b0R6L0gyclExOXRSMHBVNm5TM3dFQy9rM1FwTnpT?=
 =?utf-8?B?YW5ySm1hV2RKcnluQzZYbGtueHdEMk1EOFlZWlBoWnJuYUZuZXNLK3FyOTFs?=
 =?utf-8?B?Vlg1T0R3c2Vtc3ZhMWRKSFFUb0NvMXB3OXdNSk96QTZuK1pqYXEzSHNxRFo0?=
 =?utf-8?Q?jmUOv0dfAvSOgrAkDCxGZ5430?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 440103d5-eba9-471e-a03b-08de163c728a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 16:10:01.1240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcEjlq77n6kaJwNvtaV35Bur+8dVyPIZPCJJn9xwlw4AR5KCLmjV5djcnnsh7fx11StoKhnT9ziHiSLX6KiQnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7753


On 28/10/2025 13:08, Akhil R wrote:
> On Tue, 28 Oct 2025 10:41:54 +0000 Jon Hunter wrote:
>> On 28/10/2025 10:00, Akhil R wrote:
>>> On Fri, 24 Oct 2025 16:20:09 +0100, Jon Hunter wrote:
>>>> On 01/10/2025 07:47, Kartik Rajput wrote:
> 
> ...
> 
>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>>>> index e533460bccc3..aa7c0d8c0941 100644
>>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>>> @@ -449,6 +449,11 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>>>>>          if (IS_VI(i2c_dev))
>>>>>                  return 0;
>>>>>   
>>>>> +     if (!of_property_present(i2c_dev->dev->of_node, "dmas")) {
>>>>> +             dev_dbg(i2c_dev->dev, "DMA not available, falling back to PIO\n");
>>>>> +             return 0;
>>>>> +     }
>>>>> +
>>>>>          if (i2c_dev->hw->has_apb_dma) {
>>>>>                  if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
>>>>>                          dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");
>>>>
>>>> What about ACPI based devices?
>>>
>>> The of_ function returns false if using ACPI. Since these DMA drivers does
>>> not support ACPI enumeration currently, we would not require to proceed
>>> further anyway. But if required we can add an additional check with
>>> acpi_dma_supported() or similar. Do you suggest adding a check for ACPI?
>>
>> I was just wondering if it is better to use fwnode_property_present()
>> instead.
> 
> I think ACPI does not use 'dmas' property to connect a DMA resource.
> It uses FixedDMA or something similar. It may not be helpful to use
> fwnode_*() or device_*() check here in that case.

OK. Then fine to leave this as-is.

Jon

-- 
nvpublic


