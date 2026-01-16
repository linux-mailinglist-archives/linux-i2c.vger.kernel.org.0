Return-Path: <linux-i2c+bounces-15206-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1851D2D422
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 08:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F51B3088174
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 07:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C15224240;
	Fri, 16 Jan 2026 07:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mYPbWJua"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012043.outbound.protection.outlook.com [40.107.209.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1572B239594;
	Fri, 16 Jan 2026 07:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768548628; cv=fail; b=sfmsJzol9I7O+K1FoOjpC0tgOHdcrk+wyVan/RLXsAWJfas5POTiZLIfdlFTnTcPB2Am8zfNVy7GyNreS53jtgdjOu0WbX1+NZxPt9rk0zWkuYH4KtpyY8xCL7E2eDe6Zty0qofPduYnd4yOs+V+rZoarfU6TOEcm9wnXU8piEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768548628; c=relaxed/simple;
	bh=JCe6l8LOalkWjxyea/b/fYChI3nEPAPIqbJaxQwuYHY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z7VIOvywpENziuC8qm1Bi+j0b+yIJNBlNKiv9pmTM6qo8o+/ftTsOkgpIX8OwpECabn6M4z1hACkcD0BHBFtpgBYGc3muY/1/YTMSUV3tcrmEQ+EUOJAQonA/6nZL2IbZlokJEECBf277JaamsHnuS8jxgFIHyaJzG+cWAC8G8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mYPbWJua; arc=fail smtp.client-ip=40.107.209.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1oZPD62aER3888NK8te6uFl+AKmaexsB3bzUYEyLEIlavvmIMbFlHCEWnaQ6UBKltYTsSA2hwwsjoBvtX0Y9VybTWuA92ZalJ3eWZYFdcDA7xxjFGwsP2Y/Y7XZrldwXr44P0HbClr/7suttrnSoQnUuSq3SgoR+MJxgG/Q+FlIwOF1Ebz/4fNBpntmlPnE+AdDcwQn51xgafOQ9ualBh/8X9FKJ7KvxJboABZ7hM/M6WG24r8v4g7533Sh52x7QfHN8N9cEOOCWcKTvSem7tuJfQR3qq6q3zZ/oUGynXg8WfBHnJYBAE8zbkLF8/WdWWqvWLvcgIxVLq2Op9eafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9zya/ZkC/Rl1OkeQ/B3M4AzhBvACdOswz6wFUCBVNo=;
 b=ZWfvmz++nSC5P2UBzma+r00QTT3JEnliWHVxZRGsjNTb6bumMhAQxmJRXs7kUD6enmNP15CaLwDSZU+O3cb0dIonWGnOSakir46U6d1+UUMCoFM8WIgI5mkqi12uDKwXMLSFqqQWGgWIPZwMITT/9N5CU2XDyTBouhyG8FJoqMeENQqbT9T9UdvacSVUxrnG8nm5Vwz5UVjv/oSy1GRkTpubGdcmlgP6UVEwS+kmfgipSwDq4G5PCkp6xaXZVIca+cMZiiIxRGO2aY+OXrsCwXGmwnkCtoRXkMd/tNzvo93O2jyuGZEU9VZEWBsFIySTNwGb84XfbCGwKxSROFAMqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9zya/ZkC/Rl1OkeQ/B3M4AzhBvACdOswz6wFUCBVNo=;
 b=mYPbWJuaIzqF4o+ndSu0dRdeghZxRVtUFQd9H74KJ81v/NiltT9aUggZPnIDxliwMl6RrAKskd8HXVyB29ZzLLZymKdONiTNk+72LhgxOfRALFL8DNog2E+0EGc+4mS0DcOJum5VF2WrlY6xKuJxIWtSp8RDxMmb/CshvM9Bbxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by MW4PR12MB6950.namprd12.prod.outlook.com (2603:10b6:303:207::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 07:30:23 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 07:30:23 +0000
Message-ID: <4c3f28e1-69a2-410b-abe7-ed163e97eedd@amd.com>
Date: Fri, 16 Jan 2026 08:30:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: xiic: add ACPI support
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260115002846.25389-1-abdurrahman@nexthop.ai>
 <aWjlTKrM34lfDsfC@shikoro> <AAB5CE7A-9264-4CE1-8A49-2FD3043B0A80@nexthop.ai>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <AAB5CE7A-9264-4CE1-8A49-2FD3043B0A80@nexthop.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::12) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|MW4PR12MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb8070e-ba1e-4dcd-71fe-08de54d11c6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2RVVzFibm5rV1RSSGdzWVF0UWR4RzJLWXlPMFJOQ29QRW16by9VRjBvcWx2?=
 =?utf-8?B?UkJEa1RpTEdIajJnZ0lxVkh1SXdrckVNUGo5THR0ZkU2NWZHOUszd3Vyb05U?=
 =?utf-8?B?NWwwVzFUbHhYdFdia1BQczdjSlhVTSswNTNFWndhbmJUb015WW8rZVVRL1Vi?=
 =?utf-8?B?eFlGYmQ3ZXQ2T0VnQXNFSzRyMHJQbkhDMW5PY1A2dkk4Vkc4WWdnSXFDOUp2?=
 =?utf-8?B?TUFJU1luZjVlTHhIN0dCMWZibG9JdzFXbHY2dnR3VXdSdCtzemlzUzhkaG51?=
 =?utf-8?B?cC9wcFNCZnNqRXJQaWFDMTg1dFduMFZEQ29QY0RUN3NRUjZIbEpVeWpTZUg2?=
 =?utf-8?B?blZSNVZ5ZkZxTFpWeEloWGtHWXhEY0t2VmUyZGxDczJTY2Z4cTZvNnpORzlm?=
 =?utf-8?B?VmVEYWE4Y0pWYjlJaW0xdmNvVnZrSThGQ3BnemtNMHNDRnNTUVphSFBZQ1Mx?=
 =?utf-8?B?N2taa202bERTakZuUUVSRGtDR1g0YVIzaUpjQkxGekdlWFEvK3VpTjhlWlJx?=
 =?utf-8?B?VHFZZ1ZHSW5xQzZwOVBxSGYwTDhXR1pudTQvZmpJTmtjYWQxditvMjBMN24r?=
 =?utf-8?B?Y1poR3dOM1lJdHhTM3hrODNMWERibWplUDEydmV6cENQbU5JOGJ4WEtMb1hr?=
 =?utf-8?B?bGNMa2dDaVREdXRHaEpOelgzOWtzeHM3N1Q0RlVoQXRZKzhERUhhV3B3bTM0?=
 =?utf-8?B?RGxMd0ZrUCtuQ3BLdGYzd0pxWWo4WkFvOHhHWHNJdGcxN01kY2p4dU02Z25h?=
 =?utf-8?B?SFN3VnM2b1ZJbkZtUkZLVnNvdEVJZ3hCZ05kZGIvbWZsbThqeDdzYmtzZ3V6?=
 =?utf-8?B?YTludmxyYzhnYmVCQnlEZUtvUEVJNjNyZFRmUk5adHd6dm5STEtzb1pOTlRH?=
 =?utf-8?B?ODQwRGR2emc3UnVrOGFRVWl2Wk9odkZpMnhaR3JrVERDYUxManR5M21ObjN6?=
 =?utf-8?B?WGJLbldlbDQyZE1ZZ1pWSk1xaEErZEZ1Y3VwZ3NKTktUTXJGa2w0Y2Iwb1Va?=
 =?utf-8?B?K0VaNjR2RXNiWU1yVjNQRGF4aC9EYWsyK1RqME91S053YnNTR29NMzdqUzky?=
 =?utf-8?B?d2IyRDQ5dTI4MzZaOGpFVnBYb0RoSG02ZGJlSjhJa0o3QkZBWlgwRXpmLzlq?=
 =?utf-8?B?V1M0bDRtN3FERUpCUDhZTmE4Q0tSdjhvbkFhZlJrYU1Ib0FRV0U4REJ2TklJ?=
 =?utf-8?B?RElPRXRMeGdqVTFtVDZCdFdubHFodkhia0NhaXVnbDk0SVNSZzNjN0Q5aHdV?=
 =?utf-8?B?WkMwUkF2cFA3eUtkaGw0cnkvUU1MV1NOK3Z4QkhNODIrZ1NMQ0J6UG9tcVVx?=
 =?utf-8?B?U1Z6SHU0MUt1d1R3MTRwckRGZnpLaGFsT2NtM2FSV1UzelBMOHAxcjNSQVg5?=
 =?utf-8?B?OSs5VlowRVFNalFFeEprWW1PdVZucmFBSEtYTFl5VjJOTWZybVNRMmNwTmZ0?=
 =?utf-8?B?dGYvY0VnY3RzcmhxNENCSTBONnRNRG05aU5oQjd4ZjRmNjZyV2hPaFNYdEVG?=
 =?utf-8?B?c04zemVhNDNzbDViUFNSQkdLVHZpUXZvWTd3aW8xU1NvS041eE5hU1JVQnNR?=
 =?utf-8?B?eW00eFVBOFFpUnA0VGxSdFZ1U0lnVEgwc1BHWUQrUUE2cm5NMHJ1WkowSHIy?=
 =?utf-8?B?TmgraFYrcVB0bjZldVN1eWZoME83ZjVwajZ3TGhhRzZRZEp6TGtOMkw4V1k2?=
 =?utf-8?B?U3psbkFpRjFWbHhjZE9ITzJsY1J6TDk4SjBTMkYwT0c3anRnTzRaVzhMRk5T?=
 =?utf-8?B?OFhSZDg0SVdWSkpkTjRHYlNJeGkwWlcycFh1K2NEWHFiNGZvVGwrR01MVnow?=
 =?utf-8?B?U1lFL3pRd3IrRXJ5dmFTcks0QS9Xb21aU3V4NTNFQlBXVWQ1U1JBSmtLM3gr?=
 =?utf-8?B?RHV0L0hHYXlWdGRRK3o3VEF3YmJ2VVh1UDcxd2UwVFlIRlp1TEMyOTJLNTNC?=
 =?utf-8?B?dnRzd2Y5N3Rud3VjSnA0Ti9xTmhDNzh5d1dheFpYckl2VE9rcElnbWJ5dHZr?=
 =?utf-8?B?cUJhbWVjUWZEeXJ2U3YrdUNRZEk4VkFSYUZSSGUxcnJ6c1pEWllLUlJHZ2tM?=
 =?utf-8?B?d1l0TXp2cnNHME04Q0hud1hQU1l0MUpXNzRKZStCcHhFZlhLQk9IYVVWVWNI?=
 =?utf-8?Q?EzWs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVJDeUtVYjBnVlpwQjRRd1cyK04rT01qVTF5SllGakZKRkZnZkszZzhaR0Nx?=
 =?utf-8?B?VUpOSkt6VFZibmI1ay9ndTkvWmpUQkR4U2lyWS9SK1ZCdWFTVWxnRGY1Zmhs?=
 =?utf-8?B?dWxiOExLU1RpT2I5c2MyVTZxR0dzazRqTlNyZGxZb1NtS3pzN3k3TVRaZHM4?=
 =?utf-8?B?OUphWHRrcDh4Rk5TczJZQkJWMGo1N0FHandnRzZLY3N2eWJoYTVuMm9UdlJV?=
 =?utf-8?B?aUxWRHViVjQydkM0bDY3U1NkMFdyRmxJanM0eElGczc5d1R2RitFWnJkcE1J?=
 =?utf-8?B?VnIxRHRES1lGc21lS0VERW96eDZyS2lwVTZtVmRHSHQ0RnhJb2FpSURkUEpW?=
 =?utf-8?B?Rlk5bGpNMFh4aTcyQy9jd1VVY0l2T2VNNjZBN2FSNlRCaHR4WDZXNGdQSHFu?=
 =?utf-8?B?TytmQXhYNlZuckpnUzZNc2pDYkdIRFUxVWNQK1dJMVBoYlNnLzNqT0xiK1Vp?=
 =?utf-8?B?cDExZHNHL1ZSb1YvRllNM0pZcXBCbHdPa01uRGYyaUpUUnpQUEZqUVpRUTBK?=
 =?utf-8?B?L3U1cHplaXpwUlR2K1lyRHZzQ2VMUHYxSGNCb1VIMmVsM1B2dmpoQllVTkhw?=
 =?utf-8?B?ZnRnMm1LV3FVclJ1ek11WC9ONVlGbjVDblFOQmZzOE5QekV5RU1VSGpMNUpn?=
 =?utf-8?B?ZU9KdGw3RkRxYTJuRVVVQUdLZ05zOGdPK2dLZjM5Vm5Kbkh3dnJXRUFpNU9U?=
 =?utf-8?B?OFNqL1hLdG1yczRucU01ckYycHZWQjFqaDdlM1Y4ZkZoYWhJcjhpWDlmVHhh?=
 =?utf-8?B?SXRsZGhjaUF3ZU1ZMWcxOUpKc2tReXJyS3Q3MEJRZ2RBczl4NlE4Q2x6M1dz?=
 =?utf-8?B?OWVveVVOSTV5QmhqMUUwOTlRdXA2YzU1OU1ibGtOMkF3RmN2WnF0bXcvNkE2?=
 =?utf-8?B?OWwwdVZCb3pzSjI3U0lqRFo0QlJwUlQ0OGpGSGFXandsRUhkVTlOTy94ZUNO?=
 =?utf-8?B?Y0xJNGp4UWpzNnJyWWJNUW8wMlFKQklqdmxEUmpHU2ZNNDkyRXh2cEVXRmw5?=
 =?utf-8?B?ZkluanhETEljVWphZENlUUdKeDdHdXhzMFdkWThOWkwrYmZ6dUtsdk02cXRv?=
 =?utf-8?B?TGdSRUMrQmwzSGpuQ1hlMmY5cjZMb0k3ZzFLaU1IY09XcU5aeFNkdkxNVmZ6?=
 =?utf-8?B?SXk0MGI2NzZHZUE5Ti9oVDQ5M3BXK09PeTVETEt5ZnZVd2J4eEZmajJkL0w0?=
 =?utf-8?B?alNEa0R5SFRjS0hBdmdrbVBlR05Pa1ByS3A2T2Y1V3FnYXBxbXVIQm1Wd3Vw?=
 =?utf-8?B?OWpPUnBtWTcwNWZGQUg3UW0yREY2REszYzRBQldpWUtxR2YvVm1ldnhwemxJ?=
 =?utf-8?B?c0pTUFYwL2FpQ0M2cmZ2eXA2ODQ3cjBEVmJxbElZT0xQaERreEMvTDZOMGpj?=
 =?utf-8?B?MXFVRGlHaVhVKzM4b0tKUkJmTUw3cy8rTmxVNEVRa0Q3TE44VDRUUVRjcXBl?=
 =?utf-8?B?eHp4VU0vT2lpNXY5RHhvQWQ1bnpUV05QMVNZVWFxZWdiUzFpVmdMQmNlUDMr?=
 =?utf-8?B?dG13TktjOXkwV0VEM0VwekVpMy8yck9KVyttSHRMSUFiSWdZYVNpWTc4ODRi?=
 =?utf-8?B?VmJTbXFBd01tL2ZrYnlIOWgwTGZRNjdmdk5ERXpVSVpta01yZmNDbXlLdzFY?=
 =?utf-8?B?WkwyTVBTNkk4K2JocFdCemFFWjQ4TDlQOVdaMEhOU2J3d1d1eW9KNGxibDRB?=
 =?utf-8?B?N3d3NWIyVU1zbjJwNUhFcUd6QjQ1R29OalVpVCtjai9SL1RHa092blNzaWYw?=
 =?utf-8?B?dnF1Sk1rQVlmNG5oZkx1RDVQTDVkWkFWUHByL1ZGd0Jwb0JkbkR1aG1FNy9U?=
 =?utf-8?B?d2w0UUtCZVIyTzY4ZDdJSUkvWmlUYnV2bkt2bldZeDd2Ykh1MzRyY1lVS1RQ?=
 =?utf-8?B?L2pla2NSNjBuWWVHajVUOFNSQVZXT3VrZUdvT2NZZnAyOURMb093d0xVNmpH?=
 =?utf-8?B?L3duTW1xYm4wM0RwRVAzc0JEbHFzdmpEanp1VHFHbFRobnkyYUoxRUpJZlN0?=
 =?utf-8?B?Z1hSUDF5bW1xcWVHLzlmeHdaZTg3OVViM0llOU5EL2NLejM5dXh6Ni84Z1hL?=
 =?utf-8?B?L3p1MW9menluWXQvRDBaREhiY2hzQXpqemtHRUdYVlZXVVh6bjZubHRVS1E0?=
 =?utf-8?B?QW51V1dCVEI4RFJBUjZlRXpiRWlkQXBiQkhwb2UyNDFVQmsyMWJyRzVDNldY?=
 =?utf-8?B?elRUVlpMTmtzVkYxdHhFYTgveUZXbEFMQ1VTTE15Tk9IMG9rMGZPUkhDS0Rm?=
 =?utf-8?B?b0ZGMFZDeFZoWmxmUEF6VCtBdHh2WUE1S0g2VTJadU5CUnZoaUdERlQ5SmE4?=
 =?utf-8?B?dGFGUkdObi9CRFNnWnJ2bkF6eDRLOW5WVGdBUXNUVG5nREdzbTBJdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb8070e-ba1e-4dcd-71fe-08de54d11c6e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 07:30:23.6686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkKZ8kXySodmtUUXc78l2nqEsZv8Q740MOLG9yn2HUBym94xjKy7PZY+Yak+P6gM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6950



On 1/15/26 20:04, Abdurrahman Hussain wrote:
> 
> 
>> On Jan 15, 2026, at 5:02 AM, Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
>>
>> On Thu, Jan 15, 2026 at 12:28:46AM +0000, Abdurrahman Hussain wrote:
>>> Use generic device property accessors.
>>> Make the clock optional assuming it's managed by firmware.
>>>
>>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>
>> On which hardware has this been tested?
>>
> 
> This was tested on nexthop.ai data-center NH-4010 switch with Xilinx based FPGA.
> 
> The following ACPI ASL fragment was used to describe the device:
> 
>              Device (I2C2) {
>                  Name (_HID, "PRP0001")
>                  Name (_CRS, ResourceTemplate () {
>                      Memory32Fixed (ReadWrite, 0x80a40400, 0x00000200)
>                      GpioInt (Level, ActiveHigh, Exclusive, PullNone, 0,
>                          "\\_SB.PCI0.GPP5.FPGA") { 10 }
>                  })
>                  Name (_DSD, Package () {
>                      ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                      Package () {
>                         Package () { "compatible", "xlnx,axi-iic-2.1" },
>                         Package () { "single-master", 1 },
>                      }
>                  })
>              }

can you share more details about cpu and bootflow?

Thanks,
Michal


