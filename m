Return-Path: <linux-i2c+bounces-11924-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6852B0343C
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 03:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11EBA3A69A6
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 01:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFFF19AD90;
	Mon, 14 Jul 2025 01:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="F+3x0vCh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012041.outbound.protection.outlook.com [40.107.75.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8AD944F;
	Mon, 14 Jul 2025 01:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752457903; cv=fail; b=P3Zs438iJfqd2oUrMN2rr2/Kvx5jusN5VOCk3qoyPekHuQNcIxk7J5JNYDTV1iOiDzcJ8oTDFnEAyFC4LzV1BWzuMXQSLilCZNWBYG7A8nE15KHEZfq6q4u95r5eh7vvN2phzENuEtToE+uQjYiCV8E1PsAUfZGCVnkKds5EME8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752457903; c=relaxed/simple;
	bh=E85AaytN+6o/8mFB8Y9PeQxX3InHIrimToj5c4Zsxjg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tgHUF8RCOoTgvE3GQmtc4U8+waVYhF+8DcpQFeYHDv7BB54lVzzduHgmAI0qFgshTBfBybyd3OQjbjnOTo8BX/nJ2JC5lUiNq7IE4xTP2Wke66Ej1aVg21v2vowMLiCdJC2CR80y/mGY1ccbbTrPpvGqDVLmOQ31/paKb3E6WSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=F+3x0vCh; arc=fail smtp.client-ip=40.107.75.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QH6NjNN/kh+Uo8CkB4WpNhO5puOaNdrJLgNn5c8IQqfDCLm131pvCE4YcGVm6yV9ryYmMfUf4u8L0rVWp5HBj6liZIittlZLCujhyVPe/+k0sYHjWj+2TROJWogUC4JtzQ6zVMG9Jbv9rQJ7/MwW/aM0hFtv66vhs923NmhFlo1t7cECyHfeLLCYrXYbxDNamkOcjSzt5CCIvz35sBx4utypPaLqxSpjY1jStk7XVF9TpHqxh4EEE6scPYjyEy+qVEOmUCEVSuINU/MSRuAEGkR/dsql0Raqft0eElPlrPttzFwi9rsyKzhHZExxMeHsTG47SR4tjkyseWdUDQgl3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E85AaytN+6o/8mFB8Y9PeQxX3InHIrimToj5c4Zsxjg=;
 b=PSOyyUXwRWk61qbeX1RCK1Ut9ju7UiJOWPjTt2irQDyi7V4u6f8RXImgykcquEEkrEWPqIUunK9Dk8pSwm6hfaDPeHmkS7IzAwj8G+TeZ1qKl4xsVFS/uJp31YDdVCDqkvKKkxWUidv3WuNUDVGHqTOHL3vD4VtL7yn8beYLGMDOxEnsqBUKt6+Za0MpQFa3AW0y1OkljznHNBQNNcf9Yzr08pwT+i9kLUTv52dllXuKYYAO/Cw7hMLbUP8zyoeyZsSATmZdhUOiai6YIJ0AMtqkDYNEJ39P5Lobe+0Ga+dFzjYpxeILnrNdQXuUmOnqJRWo2J8JAyfIWY5N8Ybz8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E85AaytN+6o/8mFB8Y9PeQxX3InHIrimToj5c4Zsxjg=;
 b=F+3x0vChoU8lzrVnEtWo+vDi2+H0YtBZYi365Cv7R7NpHOFNVHV7236V12JfRtxKv9wtc11FI65i3wSkf46fSwpPgudVq+RuLPxpW0v0qavMmiLCdihFc1qN7cYPFSTReJAUAqdUCmoCleuy9py/O7EVzAxsg1rNZ0SVY1B3Bj+Og+fDhFvFVncyZ8SgVDxdNvljLUREELz2+7Bj4lyBMeteaMU3s/6Gnz+gMLq9R3WZVQai+/ihHC0ppfMF8wGu9ujPdEWQ/CJwZTfLGyGq+iJ/FLV55R0F6PsXttrE7LRMS8wqygPSWBfgVPUW+JI5Xw8vsVbfhVkJFTfp95cwUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SI2PR06MB5042.apcprd06.prod.outlook.com (2603:1096:4:1a5::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.35; Mon, 14 Jul 2025 01:51:36 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.8880.024; Mon, 14 Jul 2025
 01:51:36 +0000
Message-ID: <9e08342a-ac12-4a3f-aa81-39118d4e90bf@vivo.com>
Date: Mon, 14 Jul 2025 09:51:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] i2c: busses: Use min() to improve code
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
Cc: wsa+renesas@sang-engineering.com, Jonathan.Cameron@huawei.com,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250709042347.550993-1-rongqianfeng@vivo.com>
 <tinhpctintv5okjfdzljg4q6tnfmmcsohywy4oqxxaqzmti3r7@3otlpzbypemz>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <tinhpctintv5okjfdzljg4q6tnfmmcsohywy4oqxxaqzmti3r7@3otlpzbypemz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096::17) To
 SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SI2PR06MB5042:EE_
X-MS-Office365-Filtering-Correlation-Id: 9425d439-b43b-45da-2028-08ddc278f745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R042L25nLzBwQXIxZXZNUkFqMi9SK0ZFWHZ1ODF3c09KbnNXeDA2VmFYbnRO?=
 =?utf-8?B?THFpT0JrQldmVUI0YVVsZ1NjeFFqazZUQ0VQcUFsSENRUDdOanNUT21vdUVT?=
 =?utf-8?B?Wlg3UjJVMmZFT2dleVFOak9rVmtsOVpleGFEckVZelpqTDdLYjRIUzltaGFE?=
 =?utf-8?B?cUFRc0xNSlRZUTdQMWNpSC9YR2dybnZyYVFjM1BWOS9KVWdWZ01wMjVuclZr?=
 =?utf-8?B?NW0rMkNUeDhjUEx4QURBUjl1YnJZUUYybVpCb3pzb2RiSURjTW9nOEZreTJ4?=
 =?utf-8?B?OVZGVENzTlJ0a0FrYnpVQkJoS0xSL2E0dmVjdHlqRjN6b2FKWXZaNFZRN3Vy?=
 =?utf-8?B?R1VNbjA5OVhLcFhML01xU2hFTEVmTHcyQ1Z5TEhjY2ZuMmIwVlF5TWhQVXE2?=
 =?utf-8?B?ZVVUTUtEMVpvV2ozdEVFb2hCOUFGRWVCeDFtYXppVG5Ba0JkcEUwVHZGTSto?=
 =?utf-8?B?RGFsNkh0ejBNN3dueEJaU3I3VGZoUDc5VWxQUzI5TGJZaDJQdmR6OE9sVkZn?=
 =?utf-8?B?eWFLaS8yY2wyRm9ZTFBTbURSN1pvTWcyRTVwckpOVHF0Y0FOYlpLN3pMbzln?=
 =?utf-8?B?SWZKNG45Mk9HK2M0RlBNMXZWUEtNZ1g0WXhEaEpFK0hIbkFjZWh2Y05EKzhZ?=
 =?utf-8?B?QzZ0S2hyNk43bFBvUndKODBpd0VOYnl1aERlUjMyUkFtSDBRSTYxdlN6K2ZD?=
 =?utf-8?B?aXVRTmhCenp2UmMvQVdoZTYyT3lONnRHWTZiOHl5L002enIvejFBOUpaaElu?=
 =?utf-8?B?ay9XRVY4MldMOERQL2ZsNjFvSDlhK2dPbEovYWhlN3dmc2ZHbCt5T3Q1THY2?=
 =?utf-8?B?NXJ5SVkrdzFQV1NEWVVENSs5UnJDaDE3M3JvUTQyQnVEYnErQ0VnUGJiUDRn?=
 =?utf-8?B?ZHE1dHRSbWd0SHNNZXJKYmlIeitvNnpvdmxXbHlMTjlaNzJBZithN1FwWHVP?=
 =?utf-8?B?SkNZZ1JLRHhrRU5NNXNvazgxZGJIRE9TdGJBd3dUckI4bXE1NzREWUpSUTFO?=
 =?utf-8?B?cDZrcERSRzdqUUFzMER0VjdQb0NLZlpUZG5VL2JGVFkvemlmVnBNRHg1N3kv?=
 =?utf-8?B?YzB6TjJySEhUUzBjOHRsbmUzYWlQZndJYWR4bW5taWlERGpvbjgwaG9UcXpV?=
 =?utf-8?B?enNVRzNQRXRhZm1RdjZGZ2x4RGNYL1R2Q0NFcXNraUlITG5wK3pEVi9nMUhS?=
 =?utf-8?B?MVpqQXhHMCtnTHpGTE5Va3hVRmZSUjZ6OWppYnVXM3FkUGxRTXJuMCtWbGNV?=
 =?utf-8?B?bU5GM0RHNFpXMk5RQ1hEQnNwT3BYeFMvQ3RKVDBiZjdHZnpRVnZGVGp5ek1B?=
 =?utf-8?B?MzdsbU5ROXJQczBIa09nTUJrakFudGozWVBEY3hLTHRaUDBaL0FaV290MjZW?=
 =?utf-8?B?ZHNqam9tRlZuejc2cE05VEVTRjYyNjcxaWVxWWFFd3FMMjhhVzlLZUE5Z050?=
 =?utf-8?B?V1YyTnhEVUJpSy9qcEZKRWh2akNzckdWbTNmRi9wdzliYjE2aUM0dXhaSkRO?=
 =?utf-8?B?aGRuOGlsWU8rM2dvRUpMdVFTNGkzVVRMNDdydWQrVmdLMFJsZzdwdmdlSmYr?=
 =?utf-8?B?WFdDNFZ6RFJpcCtEQVFMTlVhRDRiUytXeUdSUDFjeExNT2syWjVVN2JaWHlm?=
 =?utf-8?B?Vm5KTTlqZW12UWxFNHpDRThYRFREdmptSkZPaXBiSUVlaTFBRXpHQ1pBRDdR?=
 =?utf-8?B?YzMvT2IyYUZ6NHF0YnhxN3h1anVqYzZsWFRaUEF2dVZkQUIvN3VKLzJQNkNT?=
 =?utf-8?B?Ui9MTnFtbUt1S3ByeFZDKzRYbWxsY2Zyc25xejhOWjdkcWNOYXA1SDUwT0FN?=
 =?utf-8?B?OU0vNHZpcUhSVHFGVlJ6V0NLWlRCOEtycjc0L0s4VlN6ZFZSU3VqeDZLMmtI?=
 =?utf-8?B?T2paaWlISTRsSk44amtQMVI0Y0x0aXkvcm9ZcjFwbTRxYW5BekQ3ckRLbGZL?=
 =?utf-8?Q?KSM+ylJbKMA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzNodnNIV2lJWmFkblgyNTRSTy9OYlNLaXZ4VmhybDJNTFhQYXhGZ1NCVlVL?=
 =?utf-8?B?YWhMZTRIRm5mdHlXQ3JpV3gyUjh2Ym1TVE44Rjlua2YxZ2R5azlhRjBjdU1G?=
 =?utf-8?B?VTFDSGMwT1o4Ly8zOXNEUER6cVNwYmFVY3RhMExXU2ZBdFFlemVsOEZsZEtU?=
 =?utf-8?B?MFA4Tm8zMWpUckNqcksxMDZJMEplUWQ4RiszNncrTjBmcVJteU1yNStaTU4y?=
 =?utf-8?B?MkZiZFNuNUtKK1RqYWYwU2wwdW8zYWNKNGpsbDY3STR2b3VXb1FGZTk5RW9p?=
 =?utf-8?B?Sm1Cd1A4VzhKMGx2a1cwNFJiWUcyNWNaNDJVRVVGRFBlTktSbVNoQ0VUTWlw?=
 =?utf-8?B?cHZnRlB2ZmhjaXlaK1dLUU14dHNxL3lVK082MEZPTlVBZHdjbW5MMWtLZnZo?=
 =?utf-8?B?a2NuQ0ttc05jSFVSRVhGbkhsY1UvSjc5OGNyQlcxS0VWamRubHJWbWRBai9i?=
 =?utf-8?B?d1FBNzZlbXlNR0RaZjRXc1JNZzJaRXlFamNmTXo1MlgxWFduU0puSGpCbkNv?=
 =?utf-8?B?VXZRYmJoMkVudDY1NWZqeGc4SlhkUFdVY0FOWmtQcmdlOFRiTkdTRWJJeXgw?=
 =?utf-8?B?dXFldEhaM2duS0N4SHVreGxMbjUwNHRuTWhiSmc3UHZKSjNNN3RTNWk2MmJq?=
 =?utf-8?B?azRZWGd1SitHc2VqQmpMdGc0L1NOcytrOEVqa2xrTTM4Wk5ZWmNQdWlPVWlj?=
 =?utf-8?B?OThnVlFkOTUrL3p1N2tMZGtVNGJnc1FuanRYd1dQUEFjVEtTUmtFTm5SZS9B?=
 =?utf-8?B?Sm85LzlkSElGbHdwWTdxQVVlbHEzakRRbG1JWVhxb2dpRm5VdEdUdDNrUlpU?=
 =?utf-8?B?MDlrWVNteWdpeFFZaDhSR1d1eU5vTHh5Z2l4bzd2ZnZ2SWUrZWRLbHVYVElu?=
 =?utf-8?B?TWovN05hZEZoeVlVUE9IQWVmc200OG9HbUJGRWNiZnlHMlVROVBueXZaZlNN?=
 =?utf-8?B?TmhqbGoxd0xtaStCSkovTG1jYnlQOEhkczNYbjBuQmM5dnhqNkNVUVhnUWFK?=
 =?utf-8?B?VFVYQWd2ZDJPcFBiREVJUlpMZzI0MUc4UzMrTlQ3ZEdhYWhrMXJ1cWxMNVNU?=
 =?utf-8?B?NWpGeUNzcW1ad1hHbG5OR2NsQ1Q3NFREam80cDdZb2hPd25CajE5cnE5enda?=
 =?utf-8?B?ZlJ1ek5Xcy9CQUFWSE1XZFBVMGxlelVOaDRreGxQNy84cWw4dWIvcWtuallz?=
 =?utf-8?B?ck42RUtremIvRks0S1h3enpoVWpIMnpFN05HZWNVRjZVWEtIalcvMjNLOU1V?=
 =?utf-8?B?V1NoOG4weHdKaDZ3YWlNMnRIeDVNczcySXc0NytZUEpETitVOWJFQmRjWWFE?=
 =?utf-8?B?ajM2LzJtVTUzeWNUeXgrcGV2ZGVVZ0pKSEpKRzRobnRsSzJoTVlPM00reVNj?=
 =?utf-8?B?bFNsUEZwWFBGZWVncWVTRllVVEpxNElzWW1jRnF2S2QzQ1lXYUIwaXpnN3Vm?=
 =?utf-8?B?eElJVkxCY0E2YmIzVEZPaUVMTnZBMnNrSEtaUGVrU0pqcWxnWmM2Yy9xVWpN?=
 =?utf-8?B?K1JZVktoVUtNRVIvVFlNNFkvNlVlN21Cang2UkFZRExMcVhTRnl6UmpQaFda?=
 =?utf-8?B?NmtxNEQ0dVZ2K3NLQ0pCMU82L1Q3M2RjKzhZMGpOYVNFME44V1YzYWNOeU1t?=
 =?utf-8?B?OG1ZTVlYSWMrT25PbitMakFWcHdxQVRRbittWFhwRTlyVXpFRlA0VWg2K2x6?=
 =?utf-8?B?VUtkWUFQUG1vMzB5eERWeGh2NzhIenVZdVY0SGJwQlB1eVBEa2NqY0FCVm9X?=
 =?utf-8?B?ZFppZ2ZaNEEvcEVpSUt3Tk1oVEwwUU82cUw2aTB2Tm5vOFQxS0VROVlTRUZw?=
 =?utf-8?B?UUhGa1dYd1J4S3N2VjV2bFM3cDVlemRiOUJGdlBoVFpub00vY1daYmU1UUZL?=
 =?utf-8?B?d1BUa0dtYVU5Ynl1MlJ2TFV4VXFuZ052SlpUcllGKzdzL3J1dGxyMXgwT1lZ?=
 =?utf-8?B?Vnc3bVV6RHRGQ1JQQXc3Tnd2UTlKekdOQzg0OHJnVXUwUm1uK0ptWGhCM1d2?=
 =?utf-8?B?RTJsclEyUU1Ld1Y4NTJrb3dWM20xb2s3eUg2UWh4RkxoY2Z4V0tTWWtWWk1z?=
 =?utf-8?B?MU5uWkQ2UWZJS1pnSUJBR1M3cS9kcEpJcCtwZUxiQmNBYVFoTFVOdmxIWi9D?=
 =?utf-8?Q?5SGdOYjOU1whNGVQbyFLzb4Am?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9425d439-b43b-45da-2028-08ddc278f745
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 01:51:35.9274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVRWsvuf4Iw+V8typMYTqPRWcCE79Aew65Em+KCocIfTJdJNMHO9jGrMtHO487EOFwv2y7hGJPssRoODzDF9ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5042

>> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> The 'Suggested-by' tag implies that the patch was suggested by
> Jonathan, which is not the case here. Jonathan reviewed the patch
> and proposed improvements, but the patch itself comes from you.
>
Thank you, Andi, for your patient explanation.

Best regards,
Qianfeng

