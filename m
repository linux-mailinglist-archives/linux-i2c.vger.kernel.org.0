Return-Path: <linux-i2c+bounces-13025-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D24BB7FEFA
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 16:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3482F189F1A9
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 14:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0672E54B2;
	Wed, 17 Sep 2025 14:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GXyxELBt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010062.outbound.protection.outlook.com [52.101.85.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B702DCC1A;
	Wed, 17 Sep 2025 14:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758118104; cv=fail; b=T/hXYsgJPFPAUOYSwsh0+fFqjQJCiRA60tkwehku88KanglkV2uubJyU80LZvXWW5QCNJAUBzAB67/glXta57OLlA+o3VsHr0mm48K56mnMuAq/ECiNiT4FQMfuPDUm+05iPSW5W70f9+HuyS9cVZMnSIxfvy6Z9+sJgCPBmEQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758118104; c=relaxed/simple;
	bh=DeSr4Jy4vMAbvEHVKTBnHu8xrMAunS9HuptWBBawhBc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E67l9ut9K8T5SEquZMaef1gdzJYuT3Nl25N4Y7cG2QCUwSSlNHfEL6b0Z4J5shsWdSZSIwOFatwwk9eaPTtKboCgMi64TS5yscF/LGPn0+pfZDs8jrsgGjznuIuVjtgsQboayR+66x0RW4Op+jprxsx7A+AJaXV7LuyjiRxdQag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GXyxELBt; arc=fail smtp.client-ip=52.101.85.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIHebp367sTHr3eI8tSu2gH1548Eob3JSNFdwk498EoVX3APH6cIE3pXEDRmQn0iorlznofPp8+gIUjRAhweOZJe8E8MHtksu1wDVYKgCXJ8sNvIEbHHuEBa8v3FH/FvE9jsg2t6D0EzxTjE6m+c54LPvH9gmEfRUOr59A+m0XKYaVpFqn7Z63523KizqYtf88IAB1rSZQETU8rWRmDqhMW1V22AenoKjnK0lDtQDmjq/C8zWOcpFlBCjjyXuFxKovxNkXmMmz0UIoWDD/gwFCIFPCBF/7EMOhxyySfIkMjJJGe0AqFk8IM4ATDojykiN/g1F3Zm/OCOWlOj6gh76w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HVAmnWA8jz4nXXIo6adun9l2sqLj+rPbw4dajJDfAs=;
 b=f9gAHGxE6ASYOjJYt6L7lBKZroWZhpqRx8Rc/ggoUjArSv+bpCs+wtpM3AvLKIB1osEUHpLUVSIfithfuEnQFjNkTyeekIz7Vaw0na9f70+6v48Lrw9vwKEvBS2GKjoTLSnNyRXbL+WvGyhz8xe9Fu+8xsbdKkeqkDjUE3NAnqewvjKtwvAIJevHFRtSg83gR2iWDVq5Mu9A10ly3dTkorQVv+qe4g3YZ23rUEbihxMcuLSpupoiApDAOV/LyngdsNAPQvaPm5AtHbSE8JJunxX++bC0HiXuN8bwPsWogK4mFrEfE7XQAk5I0K5ErUyAkeeIzuIVPWbg1rJodxuIpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HVAmnWA8jz4nXXIo6adun9l2sqLj+rPbw4dajJDfAs=;
 b=GXyxELBtA7q924X+vT5Rf0mZkxlFWC4Hu/3T2ccfG6HuYCWv6MBj9Jmh0qAh/GvBdYru9K33+auQzrvA5rW6BsoG+ylnk2Xwtk/oIOmdJfn+uf5UgnmF4gLwWIf3zLsiIIg7TyP/VCc+rYLRaRRkTh0ydzcGCOkkCLRhG8/KKpyymIycRrEeG23iMQUOs9pYXmca9v4XMocJBzjGBJ66DiQZW20Ig5XS9L+GDCnaAJpMHg50wKqzYM/a6/1dR0aGiKgFaqb+Gsr1khV7hKnlOQPy1a2+wy+1/WDkjWFiSztvenoXrPlfQPUneKBIR41YzI9IsK1+wzvY2k2BKrk9hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS0PR12MB6560.namprd12.prod.outlook.com (2603:10b6:8:d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 14:08:09 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.9115.022; Wed, 17 Sep 2025
 14:08:09 +0000
Message-ID: <d336ce08-4e35-4c14-9f5d-e777f7d91cc3@nvidia.com>
Date: Wed, 17 Sep 2025 15:08:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] i2c: tegra: Do not configure DMA if not supported
To: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250917085650.594279-1-kkartik@nvidia.com>
 <20250917085650.594279-2-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250917085650.594279-2-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::10) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS0PR12MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ca639c-03ad-4efe-8f39-08ddf5f3a186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0lzUWhvMUJRWTl6Z09TVG9rMG5BV0NkZFlyd1NpZnR0SDNXeVBld0ZOczgx?=
 =?utf-8?B?b2dnRXRma20wWUpIM0FjZWhIR3FUQnhxVWw3UDVzRm5zanJzOTNnVHhGQnZm?=
 =?utf-8?B?UWw5Q29iQi9zYUZML1UwK1Vmd3paeXRKNWVTYUdHTGNsa1pMcU55V2NIY1pX?=
 =?utf-8?B?VXhPSVhUMjBQMy9qaWh3MGZnU2RBRzliY0RnMitOTmlrUnNvOEdDdkRXcjF1?=
 =?utf-8?B?NjFydkxueWhmQXVkWUo0cmdHUlN0Q096RTVlNTdiWlE0bGVQUTVTY2VDWFRh?=
 =?utf-8?B?ODNab05QL3k4VEozNm02T1ZkTzA0alppdTB0aDVaNGVnM1ZzSzlJaE9aZjRo?=
 =?utf-8?B?YlNKSk5rcEtQckRyZzNTaVFETDlBQXBNbjNUSmozMjFoc0pPRSswTTF3dzhu?=
 =?utf-8?B?eS9xMDdYOHRVWUU5enVBczlpUDJPUVVHN0xoQ3dSaDVqRjd5OCtyNEJpNzVn?=
 =?utf-8?B?Z1p0a09BM3hLcWRVczZWSUhWWVFlRmNXaXB5dEVuR1hFZ2dsTmFWK1JsNTlu?=
 =?utf-8?B?VHgyOWVXM3N5c2RxUGkzb1JZUE5KSi9yVGFrald1UzMxWDQ4Wkx4KzFUaFY0?=
 =?utf-8?B?WUMvRlNPT3hRZUgrK043amwzbVhxUU5NS2dKOWYvNDY0Vkdqc25KZDlqSkhR?=
 =?utf-8?B?d1IrUjZxY254TW5TQlYwMml5bEt5N0JidUxYRGNCeVhDQ01NL1pCUHdPSTlN?=
 =?utf-8?B?dkk0Yk1jN3JreDdFb0o3SjE0dk1GaEFYRTQyeFpSRW9kbVc0b2VsdERBSGVa?=
 =?utf-8?B?djRqVWdaQVFiamJZVDNScGN6TlAya2xNeXNUSkJTOFNJSEZJRVd0WFBXQVhl?=
 =?utf-8?B?aGdieU9tWnhLVkIxZVUvSUZ6TXBqekg3T0ZIZmpYNTRpbmZ3d1lLQUovRUoy?=
 =?utf-8?B?OEZkSklOUENzZ0RmdENadFM5NS93OENXZ3FXMlZ6QlNqenBRVEtmdzlNWXVk?=
 =?utf-8?B?WGlReXpETEF2MmlPUTRCd1E4S2RoaFRqWlM4b0s3Mjl6TDF1Tm1ka1FpQS9y?=
 =?utf-8?B?ZlA2eGNLbVFPVHdzazFWTTJIekk4WXUvSHk2cGgxMlhBQmJ2NFZMdFRxYkRh?=
 =?utf-8?B?V2F0aDBkNENBUDZBYU8yYUlncTFEdGVzMHUvUkZXZU5pcEVzUS9xK0EveWdY?=
 =?utf-8?B?VU55Y0pBcmRVemtKNkpTOGVGVEJtdnloNUMydS9vUWFxMDBBVk9pTjhFN3Fv?=
 =?utf-8?B?bGtpa2d6VGRPVmZhbFNJVWtRcGVkKzFENUloeWtpd2lsN3J3bUVmZkVPVWtt?=
 =?utf-8?B?TDZsZU9maXpmb1lzdmI0dDdjbFNtdUxuT21idnRDeGVTREtSRDVDazNySlpm?=
 =?utf-8?B?NGJYbkJQdWltaGZCb0VzbmdxM2UxaDFwMWdudlkvWnY0RmJyZHg2TXBVbjc5?=
 =?utf-8?B?akw4T2FxTWhRT25mQjVaajVxa0twdkZxQk5uYWhoZGtzc1ZqamxlQlZ0R25j?=
 =?utf-8?B?dkNITk9kWnJTMEdLNkEzaHVadWhGQkhhaHhLMVVNdnFqQ1ZXY3NEZ3RpbTBy?=
 =?utf-8?B?UXFrQmo5dmVIOHRodCtLaWU1ekpEMUdZSnlZdzBxdXBsamF2UzhlSkVQc005?=
 =?utf-8?B?MHRjanhwOEJDZEtYL0ZwUGpma3FjdVVaamtYQU41YjNSOHRFK1FoL1ZmdGZu?=
 =?utf-8?B?MkVTUldEWG1nMGhoeDV1UEMxT2MxYUVRalFIallmQVYzN2kya0ppeDMrcnFI?=
 =?utf-8?B?bDdJVEZYKzRKN3IybWwyTFhTUlJ3MVZDUlZ5QkpFT2tNMXJWd0RzUzBxZnJz?=
 =?utf-8?B?Wnh6bmFKbERSSTlnbHVMZFQySTBLdCtpRXZ0QWFmODJZMGd0cUxMOVpYNEcw?=
 =?utf-8?B?eVVKaTliK1h1dGQwVnlKZjQ1RWprS0pkQko5ajJTSWVLQmhYblNLeGMvWlFs?=
 =?utf-8?B?V0FERCtWMXhjSGhzRmlmOWlCb3FkMEtjVktNV3ZSU0hhRzdibmhQK0ZTZzBx?=
 =?utf-8?B?aXFySWFyUUgxYUlkVW9iOTN3N2Z2TjZ4eVRIRFkycGVqK24xY2pRd1hwK1JC?=
 =?utf-8?B?MDNKcGx3Z1BRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnZ0SkRmZSt5dWFtTUY2OXFTaTVtUDdIb3p0dzVCQWh5UmYyQUhITGtpanpl?=
 =?utf-8?B?bU9yd3pYZ3p1V0NKamZ0WEo2S3ZWSWRnVi96Q05Qa2IzeDdxVDZTY0VrVEVm?=
 =?utf-8?B?T3llczV6R2JGYnZaMEN3UGpqL002S1d4eGN5aWY5L0hrKzZ4YlJwdnVnRkQx?=
 =?utf-8?B?R0VqdE1JNlFLSXNlRHZRZW8rcE1DWjExTnVsR1dhUXhkam9lQlZRVVh3VnYw?=
 =?utf-8?B?ZG1nUkQ2UWV4R002VXN6QTdma3kvN3NGWllnakdscUd2ejN0ZXFjTnRCOUJs?=
 =?utf-8?B?RzhTSW1HL05ZNzBrSzZDOVhrbnB3OUhiQTZpMmgwdFQySHRCcnJVSmsxV1hX?=
 =?utf-8?B?dzBLQ25sZWV5V2ZqN3RtZFJQd29jaEpJcll1U253YXdHZFMzM3lBZTROQk1F?=
 =?utf-8?B?M0ErcXNIMUNaZFFxeHp5WU5DT01jMVVCcy9mbVgzTWYzSkhnelUxOEVOT0Vt?=
 =?utf-8?B?YnRYTW5sUkFETHFSZjBpUHhvcHZ3dG1FTFBIVytxWXhDNjVtcTF5eU5Ib2Yw?=
 =?utf-8?B?RzlXbVo5d0poaU43dG4xa0FWY1VIWWZmdTNNUDQwVVFnSzgvTVFDcGlmV3pD?=
 =?utf-8?B?clhpVDVwa21oaE5FZk9ETHR0YWJZQUR0ak5YNU9CYUc3cUN5OFdISE4vKzRw?=
 =?utf-8?B?RG9oaHdqMzBaNDZlaERnV3FHaXhKTTcrd09aVUp0Rm5GZkczeExTMDBPeXM1?=
 =?utf-8?B?cnVnNHRkbEdhMXN5bmVFUFNaeDZjRldjUXpPWVc1TThIV3k1dUt4bmJjUzZz?=
 =?utf-8?B?ZzFpK21acG9FZmQrenJuTXBCRG5leUtTMkxBRHpiMUVraVdxdlJLZFk5VllQ?=
 =?utf-8?B?WTRBdERQTS8reDZFNVRhbHBxbXptSVNLeGZyRGxNSmhCZFpNUW9UQTBqYTJQ?=
 =?utf-8?B?UllBelc2dzRIcjYyak4wYUlwRmtxK2dFU04raWRCWUhjSVJFVlkyM0JFeUUw?=
 =?utf-8?B?RmgwWGNMU3lyOWlJd1RFcXlOa3B6R21pQS9pMUQzK3FDa0xpa0lmQmlIaGlX?=
 =?utf-8?B?REVtSXlWSGt0cnFidVBhRkxiOXZWTjN2Y0g4dGd6SkZIQkwwUFlLeStUTStu?=
 =?utf-8?B?UGVqckhOU2F0eVltTEZkbHRlUUlNT1RlTzNnYTdYQkZMbXJuWnVNY3QwMkph?=
 =?utf-8?B?ZldQWEVQRnBxNGlVcE1SeFlUeE04OTJMd3ZGSitsSm82N2RvcWhqSFVjRnRs?=
 =?utf-8?B?c0JXdGp2eDBzL0djQU9Ud0lBNFhaK0JWTXdCUWZTdjVOYWR0TWt5a0dJWXhi?=
 =?utf-8?B?dU8rRUpPS0dTaUpuT1NHN2pvV29LRFpYay9RMGNSaWY1VGYzYzBBY3VtRzl1?=
 =?utf-8?B?YW02aGswelkzQk9SVHQzeEwwdlNGNXBHem95T1JJSUx4SFFHOHRtSEVsWlUv?=
 =?utf-8?B?K1RQMHc3UE56NjFjSHdhM0Y3SytFSVRGTTFPUWF0cXpCaVdGRUhPSU5MaGNr?=
 =?utf-8?B?bGlCenM2dlNFNVdWeDNaMUFQN0c0UXJhSXQwOTRHTEEwbUhUTGM3TXFBdnlF?=
 =?utf-8?B?TFI3WEozTG5ITmEwY1U1T3V6aUltekJRWXFpTGZUY2NEWWU3ekExVTJCLzE1?=
 =?utf-8?B?VjhtV255VG4yeHFmaWZUbkdRNVVOL0lwNUZ4amFrSGIxZ3pHUlJYclgwWnQr?=
 =?utf-8?B?WUFHREs2MVRVUXJrYjNaZnllZWh4Ny95R2Y1TVgxZ05VazVDd3VxSkpMNENV?=
 =?utf-8?B?c2Q3NHd3dmUvQUw3WDgrK1E0d1lRdWpHL0wyVExIQVBnMGNRU3U2VGNpQ2o0?=
 =?utf-8?B?N1F0ZjZzM3dzTktpV2tIdXFtbGVqY0Fxc25HQnZVa2h0bEFRdjdEaWZ1NU5r?=
 =?utf-8?B?MFdvY1dkNCt4U1loN1R2clZyOFhjTVFrK3I4Y09BOFdLcU04aXhTdEsxTkZk?=
 =?utf-8?B?aTNzdi9HUTU3WTNQUXpsckcyTlpBOS9TWnRQYXpnazhHd01YczhrcnRsRGJX?=
 =?utf-8?B?TTQ0ckt1d0JNYWxnVnIydGhBcHllVGVZcUdPeGZTcHRrUXMxOUozS2RCYVM1?=
 =?utf-8?B?TGRZMXlIckxsN3Y3V1haZjQ0azdQU2IrVEZGcWJFZ1hEYmg1OHZXQVBKc01W?=
 =?utf-8?B?djlnWkt6a01UdDNycVd2eFRjbDd3TGFYNjZieGVISEExSE1QUXllODRRWG9Y?=
 =?utf-8?B?M0h1cW9WcWtUTTB5VkNZd3V6TFJUMlFTMVNpRGdhNUlsNWp5OWk4cjY0RC8y?=
 =?utf-8?B?RnUwMGMyL3lDSi9OM2VrMFdEeFMvbVBmM1ppYStNU09yUU5UVG1LaS9FSmFU?=
 =?utf-8?B?eWRkenpMbnRzMUJValdkbXNvRll3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ca639c-03ad-4efe-8f39-08ddf5f3a186
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 14:08:09.5434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Btrpmx1IPiZbfOnvSUpHakvn1W9UKn2u9FMWh3Lb502NUesZAkAWKql9XGfml9EoSxVCgiQDV0p4KzC7k7KqRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6560


On 17/09/2025 09:56, Kartik Rajput wrote:
> On Tegra264, not all I2C controllers have the necessary interface to
> GPC DMA, this causes failures when function tegra_i2c_init_dma()
> is called.
> 
> Ensure that "dmas" device-tree property is present before initializing
> DMA in function tegra_i2c_init_dma().
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v2 -> v4:
> 	* Add debug print if DMA is not supported by the I2C controller.
> v1 -> v2:
> 	* Update commit message to clarify that some I2C controllers may
> 	  not have the necessary interface to GPC DMA.
> ---
>   drivers/i2c/busses/i2c-tegra.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index e533460bccc3..d908e5e3f0af 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -446,6 +446,11 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>   	u32 *dma_buf;
>   	int err;
>   
> +	if (!of_property_present(i2c_dev->dev->of_node, "dmas")) {
> +		dev_dbg(i2c_dev->dev, "DMA not available, falling back to PIO\n");
> +		return 0;
> +	}
> +
>   	if (IS_VI(i2c_dev))
>   		return 0;
>   

No issue with this change, but we have a few checks for DMA support in 
this function and so it would be nice to have them altogether.

Jon

-- 
nvpublic


