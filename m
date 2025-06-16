Return-Path: <linux-i2c+bounces-11489-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD137ADAD5C
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 12:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A66F17A56A6
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 10:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D58F2820B6;
	Mon, 16 Jun 2025 10:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Pa8rSXIQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2089.outbound.protection.outlook.com [40.107.102.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29D7274659;
	Mon, 16 Jun 2025 10:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750069745; cv=fail; b=F/9fUgil1OBkf941tKjOKb4lQf9eo5GchcnIv1l4bmJvzM9qzQfldU0qA1WTQ19MXKH18ykqJUusg9j9pdPHH7wkru5xReESZ4RUbb9o6lfNrJsxaFuQlwHkeH/dVnecQH6f9w2Q11KnYiHZ/la6fsPXH56rT8Tok2chY60/Ezo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750069745; c=relaxed/simple;
	bh=S5WK5LFSlAra5auP0kVDOv3ivJsqe7vEpFssipmspvA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rgxVmMFsJndr+GZpovHjUzRHWrD6UUF48L8DQe0WS8SMDMcCLGFaRwnQ9XvFIhsj9eBcQhXWdCgh8+BUDoPPpP0RarOb8GOb2sZe3sdvbN68ZJ7D9ZPs6aFhOTyWjlKkXNF8XuYJZqzr+HYpq6h5u/+oscgyAYJdtD32cLyXOxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Pa8rSXIQ; arc=fail smtp.client-ip=40.107.102.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvbCYAVxW3R3M7i9iJBMi+xeYj5GjGb5Nkx9nFGqLZljHzX5TL7vbGkC+gj9uYe2GTHIXaUTm6QVmm05Qg6LkmuWkjmO1Hg8EWv5SML151bb062rXu+iOxyZ5x5Qh7EvTm6UWQA8SnMRi/53+V8OadG5A3+nbUrSAS340Ix+NgOT8uzRc4GAGsduzLHAcIKPCAGVqsG5YDuuOK7Fkklr0VlKROORuZyqEQv/pMIdqFKzxe3UTRZYWak3tFRdxpBVZCtI8oOu5tUfgjf2IWwduYUx2iQeLd5dIKMaRE6BJhxBVkWh6W0mfqdKobDGfvU8SfB0P22WKxnxGGO3ac5Dnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5WK5LFSlAra5auP0kVDOv3ivJsqe7vEpFssipmspvA=;
 b=n49Da8l86c03Sg2J0ihavfezzNw8vrYRixto4v6q9aeii/jN0LphKkKMIa/w2hMxwbqTlkv+FfHiw0Y5LNpUgUOdmzoynQ1cQXwvUyD4GjnJ5d9shrqURU0azfcBy/X8AuOVfik+ymrDiuWIqht91oCeHWbs64j0Y9yazDYYb9xHlVlE1ryrKINBEXpf9gwe7NP5rblbYRhYpScKj6jOedFCzer2uA0NnjLrjxtb4nNo0qyVURoIKjOF/P6II9O0lzyP6j4gtaJd/A9hlC7tQ4AzZyT3V4r+xiY+BL1bGnxa/uz0/k67ZyEsyI9SSjoiIS60e81q/OU1m8zf+lvstg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5WK5LFSlAra5auP0kVDOv3ivJsqe7vEpFssipmspvA=;
 b=Pa8rSXIQT0lSe6zP99tRsq946eQNbUZ0bibMTUH2IbGOSf+Ul/w62nmJE420lSlkzm+2pz6vUs8pjTv9/bzbx1XBJANfspOAkiHicJ8X5xsXs3otxzo0o5geXVowDLZXXhmqqyO2l1NmIAai+ZzK3w7GbyYtygn6qD7hrtYKge6ZMzL17hRBRT2lDTLqbfjzTfj4F4z8H53z7dRcbDHsx9Q0nhin2GqqbLdkR5LwQGk8Uw84e4rlFDn2iGxYcUedxe4rq4o0DtFXfqqVS66oJ+WYIOA99f4C4ZDn2jRo+iRFxDOllnTPo1LLDUFwJl5A3SL0JZpYZaPMo0z2WnSQ3A==
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by DM4PR12MB6206.namprd12.prod.outlook.com (2603:10b6:8:a7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Mon, 16 Jun 2025 10:29:01 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 10:29:00 +0000
From: Kartik Rajput <kkartik@nvidia.com>
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>
CC: Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
	Akhil R <akhilrajeev@nvidia.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "digetx@gmail.com"
	<digetx@gmail.com>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 5/5] i2c: tegra: Add Tegra264 support
Thread-Topic: [PATCH v3 5/5] i2c: tegra: Add Tegra264 support
Thread-Index: AQHb2dy+RBWeeLUrL0i9yHphi+bgX7QFnveA
Date: Mon, 16 Jun 2025 10:29:00 +0000
Message-ID: <ae060eeeacd6f1a46ada2d34dafcfc351968cc69.camel@nvidia.com>
References: <20250609093420.3050641-1-kkartik@nvidia.com>
	 <20250609093420.3050641-6-kkartik@nvidia.com>
	 <kbfl4ye72chc4avrpjzirh73belp6waue22sa4qypuljjaus44@hpxr5dkthezd>
In-Reply-To: <kbfl4ye72chc4avrpjzirh73belp6waue22sa4qypuljjaus44@hpxr5dkthezd>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5716:EE_|DM4PR12MB6206:EE_
x-ms-office365-filtering-correlation-id: 2819190d-bb22-49e0-46d9-08ddacc09c21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NnJOSkc4ellXR1ZibXBhTHV5NS9VNGlBNUN3YTRsSGtmQWV2OXFXZ0tWaUVS?=
 =?utf-8?B?YjJSczZJV3pESGpQWGxOaUUvNGI0dS8vZk4zUFVxc3cvWVVTM01ZdFJBVU0r?=
 =?utf-8?B?V3ZUMEZDVm9Mek41UU1GRkJvVGdxY0UyOThPRGMxVEhVSjV1ZXdhdzhrNnRE?=
 =?utf-8?B?Zkp2NEpuZlNaa284ejN0UGVkR2xCYktvM29qWWQ3QmovQThvSElLaFBrYnJi?=
 =?utf-8?B?dEpkN3pMZnUyaVQ1UDA1SHBIMkUrNWRZRkpQc2srT0hVQS9tQkVuVEpMNGhC?=
 =?utf-8?B?SlQyeFIwRVVPOG41ZTdaZ1c0cTM3NGJqbWhWVGpEN0l4bWthbXFoMEJObFJu?=
 =?utf-8?B?TUFMRTFnMlJBMEFVaWptemZ3bDFLMGlHdHRWN2JSQUcybG9Pc0I5eTUvRGh3?=
 =?utf-8?B?NnJ5dEt6QU44UTZnY3BEcWY0WjZZbURMQ0IrcG5rTHk0dTRqcjFnenpRYjZp?=
 =?utf-8?B?SXMxT0xlQTBUQXlmdllpb2kwWlpyRGdOTk1YYzhPc2N0bXVvK0g2MTZMTzgw?=
 =?utf-8?B?Z053ZDlKN1JUbWYrSWJ5d2JGZlBhcjhBNXNvbTQxQlQ5YTRvdEtRUWh2Z3pi?=
 =?utf-8?B?azd0bXE4ZjNybEJHaWxWdjdMVVBGeHdacEJRMW1PTDEzbGtvL1NZWVdjUFFo?=
 =?utf-8?B?NlNhbDMyaDdPUFNheDJEMTFnWTcyVHZtY092K3hYN0tmY1IvSlJmTnRwTWJj?=
 =?utf-8?B?eUFLeGVpM1hMMkl2Q01RRVBWQ0Z4cndsdFpRTGQ3ZWwyRUhSRytmSWlISWQ3?=
 =?utf-8?B?RlByb1dMTVpUTG5ieWY5SGM1NURVQmltVEQwUTQ4dFB4aEtCS0c0U2NXd1VE?=
 =?utf-8?B?eXVtL01jdXI0Y1JKRjYzWTJBQUMyTEZzK1orWmUzcWZ1NnRHRWwvTHN1bE51?=
 =?utf-8?B?b25oeDc3cGxOU2ptZExndUxYSDFqOXQwMFpNM2JVOFlEK2ZVckdEeU42SkEx?=
 =?utf-8?B?Qnh4RklwaWs0NUc1Y1NDRU8xNUI1KzV4aWNJZ1BuWjY2dUFXN2NUOVQ2eUNl?=
 =?utf-8?B?bWt6bU9tb1J2RzZmQ1YwS21tRE0rUG14ODVHYWZSNTlXa1FpTEFiUDdYTzY4?=
 =?utf-8?B?bFJWbTJkYlQ5d3JBTGtzT1Zod2Q5SXptd05uV05kV0V3WEJVbklMUi9YQjhC?=
 =?utf-8?B?VkIvZWpYcENEblV3OS9aSENrazU5dHhYaWhXUFByOW5sSXFuY3RWT1NZVlBF?=
 =?utf-8?B?dVZRZ1RkY3dybzNyYUlMc3BRVWN4dDFFNzEzUlJHZEZKMHdJTXFRcHU5b3Jm?=
 =?utf-8?B?TDNvREE5RGU0TEpDUkYwc0hML3hFQUVtZkFrMUhYSGJsY0ZadjBPUDl3b29E?=
 =?utf-8?B?MUdOSDhWS1BQdWl2Ry9SOVpGYytIRnJSVmgvVnFRVGVFNHlEN0lTamhCNXRG?=
 =?utf-8?B?aE1zcmR1SG53cWZ2S1pCU291aFdjenl5TzJ0c3oxNDM5dURiU244Vk9CTzNV?=
 =?utf-8?B?WERYZXlXcTY2MjdZenppNERBaW5Cci9QY3NBRDJpL1FLVVBUdVdsYW5ELzlj?=
 =?utf-8?B?SkpQTGFGT3cxbmwwSjNkQk91YllNQ0JMUXFiTGdYdGNxbFFrVjNEbkM4R3o3?=
 =?utf-8?B?Q2htUXhXVDFtVDBIWCs5eDc3aWNvTFJtVS9Zb3I2Mm9HY1o0NFdEcDludDE2?=
 =?utf-8?B?V1BOcE9ld2dPWnBUNkQxUVdrUk9mS25NdDdxSUJJam1YQlI0QkVDTko0Vk1O?=
 =?utf-8?B?YlF4bjFSTVAxNzA0YUhsUkRlTEVKUS9xTzdablVFK0tIQzVlNm54MmVLRjdl?=
 =?utf-8?B?MktHSU9RYkphRG9hSTZYT0tNckJvTEhGY1NCSGx2eTNRY3NxRUVURGxmdlk0?=
 =?utf-8?B?RmdqaTVYbkJzMkpEQnRWWUhTcXdlN09hcnRTQW5nQVg3aWd3eHBIQkVVKzdK?=
 =?utf-8?B?eDFVVVVpZlF0cFQzTndHSFJITW1lTXFCSEpKd0hQVm1VYk1wV1ZkblZ5d3Az?=
 =?utf-8?B?U0g1TkVPbEZLYU5YcnpiaWl6aCtNYnNpVmw0eUQxSHFsZWN0Q25pd2R5T0JM?=
 =?utf-8?B?cjZ6RGdjNU9RPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MGJKNVJ1RGZGS1h6VHhwbW43MUV5TTZMZ2U3aEo3M3lhOVZ0b2lyUTc3UUdw?=
 =?utf-8?B?cnJ2bk1tK0VOTlFuWi9LOVYxTVhaMDZHeVVEeE4wd3VkeWFyN2VrTU1mdUZE?=
 =?utf-8?B?UENvSUNCdXJ3d0hGQzBRc0lGTWdxNWF5d1ZHbTJQa0k3UUVhVWI5WTJPNWwy?=
 =?utf-8?B?N3pJajFibjlsUUo3TWU2Z3pjazZaQmMzRjd5V3ZCeVkzMnF1NzdBUW9scHBP?=
 =?utf-8?B?WGZxT3ZrOW5WYXpDTGFISlMxNXd4OHNCKzEyMUg2Z2JhUUFKeFhxZ3dUUlgv?=
 =?utf-8?B?TVdhODV1OVVERW5Ua1NiUlNZc2lOVmNLQURzU3UvdHoxMDZrdWdJR2RUR1BH?=
 =?utf-8?B?VEVtQ2k5Q1V2c0VrUktGV3hJZUxSZGZKSUlMbmM3eXhzOEg5YW0ycDJqL1hq?=
 =?utf-8?B?dFpIdFgwZUF1RmZiZmxHZjFEMXo5TVB0dWVGb21TNDg3WjBNbjZHMEt4Z1Fs?=
 =?utf-8?B?YlB5U3J1TVVtZzl6dTYrUGs5UllXZlRSaTJaMkdhQjA5SFlRdzdDUGJieHNt?=
 =?utf-8?B?bmxtb1dKQVoydlNramY2RkhWV2xNRTA3MFN5SEJBZGdicGpoSjZGVDVTTzlX?=
 =?utf-8?B?eDFQQUZmRnMzZFZwTno1eE9HZjlVUk5iN1VQYitHaVJVVUplSGJhS0kxRnNu?=
 =?utf-8?B?N1YzRU9Kc1BXM0s1VnJNSU1NQlVpNmZFYXlaZlNicFlpQ01XSWpkeVpLRVpU?=
 =?utf-8?B?M2hoQ2RWNXNUYjNIcCszMER2NWRpaXdGaWVZQmo2SFNQREZqUkduaUhBRUdH?=
 =?utf-8?B?VHhLa0VxUk43MjJxSnZjNi9EejdMb0FHZG9WcHVUTTlFT05qWkxyWFdSeCtG?=
 =?utf-8?B?U3dsY0prcmh4YlRsbDA0YkJzR0RHbnRHTU1BSHJCeTZtYXlNS1Rucmh6RHdu?=
 =?utf-8?B?eFpmWEVFTHpWcTFwSFArQk1nb0pzYldJdDh6cFI0WDJYTjlSTFFRSWJzNXNk?=
 =?utf-8?B?dmtSRkNRdTlFOUxqTzBpWWFuR2tVRDJtYjNRTm93bnVaUlltNkVKbm9OQmpu?=
 =?utf-8?B?anUvZjZwL3hrZjVpWCtGZlZOWEpzWUxUUmM1NHBFNkhSN0xXSkRjYVNXRExT?=
 =?utf-8?B?MGdRWlZ1MlNGVjA4NnlaQWhNOGRJL3dqSXNwVU9TQmNSN1ZDQVpZeUV2ZVcw?=
 =?utf-8?B?SkNleVFkVFpMSm8zMzdVS3VLLythZGcyVnM3UkNuTEtGTTVtTEFnVTBqRnhG?=
 =?utf-8?B?Tjh6ZjdDaWNhcExWNGxMV2RrUXE5UVluSitGeGxFVXhzanVlOTVOcEcyNVNW?=
 =?utf-8?B?YVVTNFNBOVA0QzJJcENBazliN0hJRDZPdkJqUTIrdVRYU0FheC9CYjAxdDl0?=
 =?utf-8?B?Y2JYRW8vQVlMdU92VjFSMkVsbXlCK1BXcGgyU1kvaU1zVXFKSkhvdWp3UUly?=
 =?utf-8?B?ZkN3SnRGTktKN0p6TjkrNk45Tm10YjRsYThCdG9OSWx2WjN2Z0VnSVhmWFRz?=
 =?utf-8?B?endJODFEcFZBZE04QVRXQS9Td3QzTmlxbnpBSnZCVUF0NkpGSzFhUEs1UUp1?=
 =?utf-8?B?UEd3dXl2ZVF0alE2T2N3U1U5a1doaFFrbXlHd0tsRjRsV2ZmSFV6WWpqSGNa?=
 =?utf-8?B?TzBjQ1kxOEpnK0JldUhXTEN6NTJpUTh1d01DQlVHMHl3RzdVUDBFZkpNUVpN?=
 =?utf-8?B?RnZpN1U2YWNVcGRsdDBpRnlJUXFsRFFhMDIxS0Z5eVdUU2d1Q0oyS09IZHBK?=
 =?utf-8?B?N1Y2V09xT0dnSnFEWlJyMGczRGJvWUNEa2REL05uV0tTM2V2c0hJcnJWVEhR?=
 =?utf-8?B?ODRjQkhJbDc1dUFMTDhJdVBCaW1TKzJwZDJqeWUwM0hhb29GdjVwSjdEc3JI?=
 =?utf-8?B?amJ2VVM2ZWc3NkdEMjFkRzR6bk9kVTJPanpEOS8wR0JJSXY1TVNINSt3Q1BU?=
 =?utf-8?B?Q2ZjNXQ5NHk1dGF5dUwvNEg5a0RuSUszTUVkMFRxTnFvUXpjczFWZUNiS09K?=
 =?utf-8?B?QUZyRDBBZkRJMWthYWFmN0x2U3FOblN4VmU4UXVMWHJPdFlpTm5GSkpRaWJj?=
 =?utf-8?B?d3E1V2hKUjdwMldKQkNXNldYSGhSY2VaVkVndkQ2aFlGQ2packNWSldhNlFM?=
 =?utf-8?B?d3ovQkNMWTdna002STJvUmFPeXRqeEhnY3pBakE5WUV2Ym5NSjZVeEpSTW5K?=
 =?utf-8?B?OC9vcXJQZjJlTDJjT0M5M1NGcDYrbTZBN01SNjg2L2VLQStPamhGNkZ3c0lX?=
 =?utf-8?B?dkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB10CD99F753284BB61BFA2B4CE9C5DC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2819190d-bb22-49e0-46d9-08ddacc09c21
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 10:29:00.9216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ml7pOWT3GdnnDQf8xZzfJB09nzWpuTNxuqSjitrvHNKxu2TqVp2dlRm4Af53w9mQSxYljz02hG+c6m1T6QV01Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6206

T24gVHVlLCAyMDI1LTA2LTEwIGF0IDA5OjUzICswMjAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToN
Cj4gT24gTW9uLCBKdW4gMDksIDIwMjUgYXQgMDM6MDQ6MjBQTSArMDUzMCwgS2FydGlrIFJhanB1
dCB3cm90ZToNCj4gPiBBZGQgc3VwcG9ydCBmb3IgVGVncmEyNjQgU29DIHdoaWNoIHN1cHBvcnRz
IDE3IGdlbmVyaWMgSTJDDQo+ID4gY29udHJvbGxlcnMsDQo+ID4gdHdvIG9mIHdoaWNoIGFyZSBp
biB0aGUgQU9OIChhbHdheXMtb24pIHBhcnRpdGlvbiBvZiB0aGUgU29DLg0KPiA+IFRlZ3JhMjY0
DQo+ID4gSTJDIHN1cHBvcnRzIGFsbCB0aGUgZmVhdHVyZXMgc3VwcG9ydGVkIGJ5IFRlZ3JhMTk0
IEkyQw0KPiA+IGNvbnRyb2xsZXJzLg0KPiANCj4gTWF5YmUgbWVudGlvbiBoZXJlIGFzIHdlbGwg
dGhhdCB0aGVyZSdzIGFuIGFkZGl0aW9uYWwgU1cgbXV0ZXgNCj4gZmVhdHVyZT8NCj4gSXQncyBu
b3QgdGhhdCBiaWcgYSBkZWFsLCBidXQgc2luY2UgeW91IGFscmVhZHkgbWVudGlvbiB0aGF0IGl0
J3MNCj4gc2ltaWxhciB0byBUZWdyYTE5NCwgbWlnaHQgYXMgd2VsbCBiZSBhcyBhY2N1cmF0ZSBh
cyBwb3NzaWJsZS4NCg0KQWNrLCBJIHdpbGwgdXBkYXRlIHRoZSBjb21taXQgZGVzY3JpcHRpb24g
aW4gdGhlIG5leHQgcmV2aXNpb24uDQoNCj4gDQo+IFRoaWVycnkNCg0KVGhhbmtzICYgUmVnYXJk
cywNCkthcnRpaw0KDQo=

