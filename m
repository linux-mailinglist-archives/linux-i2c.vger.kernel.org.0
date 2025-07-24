Return-Path: <linux-i2c+bounces-12024-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F1AB0FFF0
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 07:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BAD39645C3
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 05:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F257F1FBE9E;
	Thu, 24 Jul 2025 05:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wv7VWDOa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3498F4A;
	Thu, 24 Jul 2025 05:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753334943; cv=fail; b=qLi5Vlrv79FBgy/jy8j6StWYl+j0v+Hn4jtuou78vxsyZz4YpbTGw/9FgssuLE89ofMawhrq78q45VNAL/g/lsXZMR8zItcNv9WN3sWuzEMlpKs6wvmwy8Z7vhIfCR4ONjuhhiUPun4G8Lbn8LaT58TPnKwja6d8+pkrPfCvVyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753334943; c=relaxed/simple;
	bh=18T+IxD+Gmfaj7OZ/xSjcEqijBLhlB7UqseeCaZWfRc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fyvA8xwDnb6k+xnmI4+FX+6FXZdOCHhbIH6psU41HvNb66pbCx1JIjw9mfbQpMazyTfdlsirWDljP8S9e1GHQDRIv+cRowP4fFYl3YbIhbXPuRj5mw7wfIXpLfsFwqhihMTz1+hDA2ZWmpvJkP2RivxcSt2EGIM5lrPsxFl5JIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wv7VWDOa; arc=fail smtp.client-ip=40.107.93.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TN84xMRgZjeeCS6hYXuT18yFlLy+aDBNdIb/v/xhYBq+brSz7GID/bnX+FtCkS7N1tkiTPOQaGJBG08Y8JQm3BtRA2KCTXFnscSkAgy1w3XxAAxHPj/yaa4SqrWQ3THw72QwuM4A9/VBDBHJoRHKkJvj3QNtcd79KVJyUq4MSeZ6faxNOkmhe/o05NXCu/UiNsbs1wwx5gj8WSuOcVZzADd24anyAmb0D3SXY/IvO5WNJO4obyBcjy9U3kGwtQK2QqZnsKqb6xKaTaBDxHPCz0ZvZfZlX5R9g8MhspyEG70lBzf+TFRe+ICG6aTRxhQd3if572aZ6N8f2hkU80p9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ull8d2wSloR8apRu62bzFAp0koZwqWeeQc/numbr/Vc=;
 b=D/KJuqeGp9bmni8ESIWEna4jlpX2X8kBAvsQQfLaWctMVTpQA66lwUsz4I91c+1cXhIwnjZEXNxDHQXXAoOBHl8b2Rl34gOqNWr7z3Drl0cfGif1cRGyqtdAs32C+Z4jsNsEDxwtQSw0hQTjaZy8SrHxDUW0TKWzmRe49ydg5bdASIc+csbOunjqYXV8Q7BoCbMo2OzZojJWsc9XjzhxmDnAEUpqnSEdgg3a8pRhs6rLVoHkHmti6srD6Vvfgfp1FxQmWtL4LMU76l/bodUYa0os93qB2RNAqt9/Zv79PLGMG06+vCZMIOnAj9Tj9r4nqe+32/WiRn0uoyVX899KXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ull8d2wSloR8apRu62bzFAp0koZwqWeeQc/numbr/Vc=;
 b=wv7VWDOacFynb7FYciIkfegqkkLB2SdcFbiq9xmvXdJ2nGOMQsLdMJF/XHnnQomuPDHupXz48DJAk/aHa18Q3tXq6iPHoy69w5q7/sI/DZ42wnk+SEoG0VH6yRufA8bwGF7Fgcqv6KYYU2hMFXVw63tDylL+iJdsgpS5Jz7Qw24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SA0PR12MB4429.namprd12.prod.outlook.com (2603:10b6:806:73::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 05:28:58 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 05:28:58 +0000
Message-ID: <d1a0374f-562e-465f-8332-1dc1f66ab2d2@amd.com>
Date: Thu, 24 Jul 2025 07:28:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: cadence: Add shutdown handler
To: Ajay Neeli <ajay.neeli@amd.com>, git@amd.com, andi.shyti@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: srinivas.goud@amd.com, radhey.shyam.pandey@amd.com
References: <20250724051243.22051-1-ajay.neeli@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20250724051243.22051-1-ajay.neeli@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::34) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SA0PR12MB4429:EE_
X-MS-Office365-Filtering-Correlation-Id: 599e199a-1e51-484e-67fc-08ddca72fd48
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cU5SRzZ4ekJBSGxKZ043V3REcmZCTmFuOE9jS3FOK05pZEExMlF6UDRHVjcr?=
 =?utf-8?B?RGtqWnpqRnJKWmlNTVpubGhqSkd3b2UxNlFSVEhORENpNXQ0OHNzTEtmK2Fx?=
 =?utf-8?B?TDhVaUxYNzFYUml0SnBmdDdyVHNMck5aWTNVK2FGT0ovVlVOOUVwOUQ1RWN2?=
 =?utf-8?B?R1hsQmlnV3RGNnp4SEh2aldBbXJzSHpWRlJkaCtsWEJFbTA1N29lTEFTV1dC?=
 =?utf-8?B?blVpRiswUnRVbi9TTjRGQVM3Q0hvK3N4UExoMXFtYU8rcG5YK3lvM0VUampn?=
 =?utf-8?B?MGNyVVBJWnA2NC9McEpLUENsNENvRlMxMS9yT3h4RW1CaHRYTmd0ZU90VmRv?=
 =?utf-8?B?T0JVZ2VaVlNKckliUGpJVTMrVTVkcVR2TXVlWllHNC9PM3BrcHFRbmdGUitx?=
 =?utf-8?B?TlBxblhES1o0czhkNG9UUWQ0eURNb3RQNVRad0U3ZnFuUldKSXd2cThnSXg0?=
 =?utf-8?B?clhITUFma1IyQ3VSb3VmUERIbTlxY2tNSmRaMkRrS29HeU11N3lleTVVSVht?=
 =?utf-8?B?NWZqeHhjb01oc0FSSk9VYjdaY1pWaHJsWWc2M1BDV3pIMXozUVhINGI3M0dY?=
 =?utf-8?B?b1FndktSSHJmeTUybXZyRG9ZcUxJYVkyV3FDL043NjV4WkZoNm1BMnFIOTIw?=
 =?utf-8?B?bGUrQXd3eUhBdklJMS9rSVV6L09QdkduaStUdkQzN2pUZ1MwMEtQMG0waTZE?=
 =?utf-8?B?MUFGa1A2RGR3cUJoVXJZQUxnRGlFOWs1MEJJMmpNN1Vpc3JobzVmUW9QeWZt?=
 =?utf-8?B?TGQ4anRlTFR2TGhsOVJtK2VlbGkzYlVsMFJpTGE1b1JwdmZWMVM3ZVNuUW9w?=
 =?utf-8?B?NWdIaE5GYk1TL1Z2eVZrZ1lTdzJVS1FrTVA0ZmF4MWhtTFNPeTNyMXgwQUZU?=
 =?utf-8?B?V21BN2xudjc3TXFydHRjQXBubGhKNmhrek51MUJSSHlFclFUVDVRVGZ5eE9J?=
 =?utf-8?B?djRJaEdvb2EzU1V6UG9QWVJoMlVZZmtSWDZ4TWgvWlRBeFJMTWFGaDhZcWQ0?=
 =?utf-8?B?Qk4xSHhQNVFNUDk1UjdXejVPdmNyaDUxclhqOGgvRjNJTUJ6b1hha0RSSUV0?=
 =?utf-8?B?R2hoSE9nYXduc200Sml4dTUyRklNMWh5QXR5NUhVOFNrajVZUnZROFl1WTYz?=
 =?utf-8?B?eEo3K1dJV0tFdy9QeEY4Y1BmMHNFTlhreWwrcm9Ud3Y4VlpvdFo3bDJyYmFq?=
 =?utf-8?B?VkplTUFCdTNzVTluQlNmc04weU1RVFRMMTd3V1lxa3VnUWdDcmhudVV1Zlhi?=
 =?utf-8?B?REw0N2FTQlZRUGtjUE1oS3JTK1NrOWZoRVFoRmlCQThORVFHaUl4V00wOFRK?=
 =?utf-8?B?NGM3MW5IeUd0VndYb1ZFM1JubzE1c0RqQ1ZGcGN0Q01XbzRYV0M5Q2NLSU5J?=
 =?utf-8?B?MjdXZXRWd2Z0S05HZzh3aHlZYlc4bjkxa29mWVpHUVVXcW8vVjQ4bmVxazhX?=
 =?utf-8?B?UTlDbVlzVkVnOWRiejZzcHhuREplR0hUWlJnUXN4UWo1SCtHWFZUeE5yMmxL?=
 =?utf-8?B?eUUxdVVkNFB6ejAvK3hNejhFSEgxV21KRjJ2Z3lET3crNUpLQW5lY2hPS1dS?=
 =?utf-8?B?OElmalpSVU1mNEQzNEVJcXVrdTBNWHNaVVVrWE56SDliMWNxSjJmNUZVL0hp?=
 =?utf-8?B?SnEwNDAwOVdZZEtVelBRWG9EZGFrRFM5ZXRiVXNpU3FuUDhyY2F1aXlFZ0JS?=
 =?utf-8?B?Y3QraHdUTi9PSkVvWTBLcXBnL2U0OXhLOFJ2c0dJaFFiUU54aE1SNjBJK3RV?=
 =?utf-8?B?emQyMEVKWGFzSC9BK2huUVUxTEtqZDQxVmx1MllITlBDelp3dHpqRlZCUzVQ?=
 =?utf-8?B?QkFOc1dJSmxEcTZuSW9kN2xDV1Zkb0p0RXo1MDJSSE9uTTM1WHVWSEprL0FC?=
 =?utf-8?B?WkZCbHpjZnNQZis3UUc5MExxbFVhQzlKNU9KczdoZE9XRFJ6QUxHQmp4MnU4?=
 =?utf-8?Q?wv25xQncJiw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEN0cmpnd3BMYktpeGlZRmREdDJEUGZOVlB6bWhBVnRWeUNucTlaaUJDKzZW?=
 =?utf-8?B?S1dNRDh4eW5uT2dYWjhHVWZZeFF4dVZDN0p6akNvVXpSdFVTR09tUWhMaEpC?=
 =?utf-8?B?bThsK05wRGhaTWdHeHJCc2tFZlE4L3JzQ0h6dVVKU2d4Tkw3NnlCeHlZZWlp?=
 =?utf-8?B?RkhFR3ZXQTIxRzVGL2NRc3l0c3lrMUU5S2ttb1NlWDJuRjJoR0lJWld5bnZV?=
 =?utf-8?B?bFdFMjlWK2QxZGJLK2lZWVpnYWxiakZyN2xIam9rT1VSbjA5L3NyRFlQM2NB?=
 =?utf-8?B?a0p6N05DSEtPbGlFL1dKaCtjM3hkRW9hMVhtaTkxeFVrdnFITGlwR0lKM1pr?=
 =?utf-8?B?RThvalFMVDdvOVg5QlpsT01mRkN6VWxITm1kL2NCdllsZjVSQ2RKbVJiaEtV?=
 =?utf-8?B?bXNJN1NsSVJtMU9RUHRaRGJXRVZDQU9RNmlheEFZQWdnRGRJRTlXajEzdnhq?=
 =?utf-8?B?SHdSTTBKVHRNK0did2Z6ZDFIR1ppR2FGd3d4dnhHS3p6UUFBcUtPMUhRaUYx?=
 =?utf-8?B?Mjkzak5GV1dhTjBUV1RMbkxXd01odUFna2YrWlhVMzZ4NWJRNFo3RlZTRnA5?=
 =?utf-8?B?K3Z5NG0xUkxOS2xaZ2owaXM4eXBjdjJYRTdIMFE0SU9mT2J3RnlHQW1CUXJY?=
 =?utf-8?B?Zld3YUJTdG5TN0dpZ2kyb1FNdFJSOG9Ud1hHdDJMZnVZb2NJNS80ODg4UXEw?=
 =?utf-8?B?R3JHWDlDa0poU1Y5T1RSZEk3VEtKNUtrVERlcmJORzYweVZ4ZXZ3Mml0MkVO?=
 =?utf-8?B?YnVNQndBQlIxRWtFS0VtTVZoVDlPd3F2Znh1TzgrUWhXSkJ2SVZPZnY5NUpi?=
 =?utf-8?B?QUhlMzBGdlRSV3M0RlB0VGpNTmdoVXQyYkdZTnBocmc4a2toOEZxQ1R6YlBJ?=
 =?utf-8?B?YkRUc3R2S1dnOHRNcjJmYVN1Z1VTNmdVNDVkOC81cCt6UGZYQ2RieXV1RTMy?=
 =?utf-8?B?eEVJUFJzRmdKbW41Z0dCU3F2dWdFVFVscU42VG1tRXYvMS9oVUorSUFRUVRl?=
 =?utf-8?B?K0hJaWVrN09yWmdVbHVleWMzY1pHeGFRQ2RsUStZWFkvUkRaeEtxOVhZN3I5?=
 =?utf-8?B?dXk3bDBCU1ppbm1SVE9uazk5Z2Q2SDRCTkpRY2NjYjhLOVlpcWRqUkc4alcv?=
 =?utf-8?B?ZFBVS21XSnd1WnRkNTd6a2UvdkFWUzMyMGZWc1hRTTdyZW91VXBaNlpvYm9C?=
 =?utf-8?B?c0ZZUnBmVFVDRWkxdFdJanlxa2hNVkpvTnBDbEwxZk9vK1l5c2lZa2ZuYUJi?=
 =?utf-8?B?bTNMSzFSckpkMmRXQWMxb1Y5MHhXZ0l6bkt4amozTmpLRXQvTEcxbWg5blg0?=
 =?utf-8?B?YkZadktFZjhRVEs3emlGcWRFTHdrU0E4T2s2RzBwRTV4TlY5Tk1talpzMVcz?=
 =?utf-8?B?UjlhYytVWHZTV1h3aS9vWlNxVU9pOGlHZlhwWkUzNjVuTUhvMUZyMnczWlVw?=
 =?utf-8?B?S3o1M0FFV0JqUVlVZmR4cWNrMU1vQXF6SjN4R0hNblNTTjYxcitDTmpQSUw2?=
 =?utf-8?B?RUdCaFIvWmpHRlVCdlAzdEJZeWhycUhuS0Qvc1ZnS0xmVEFycXVSakZlWmdq?=
 =?utf-8?B?WlJDOWpWOW1vS0o4Yk9pc2xSMjRtMSsrdUFZRGVQQ1oyNWZMVDFNWFlFTUJE?=
 =?utf-8?B?QTg5aUwyYm9xdFdNMzZKMkNhaGllNXp4TUVnR2hHTUtSWmthZVphUUF5Y0ln?=
 =?utf-8?B?dlBRelp0MmlsclNGOVozOWNIN3NhWkZQaC9jQ2hxU2JrWUczSXZxVmpaajBn?=
 =?utf-8?B?cTJkTjZQbDdRamlIUEZRUEg1MFpydnJXczhKSFVyZU9PVnpncU9LYnowd05h?=
 =?utf-8?B?WDBJZDVGeUVGM1FTYmV2THE2S1pKS2oxU1FnZDZXZzlGZDhDUEtzN2pJNmYz?=
 =?utf-8?B?VDhhcG5ENHVQbEh4eDZ1NDhkUFh5bXp5RFV3NklvaENnTTU5VHNCaXJsTGVw?=
 =?utf-8?B?eTJOVno3bXpyU3ZXcnh0eXk2QTZkRHRCL2hlSlJIYjNqcko0VGU5bXNrejI3?=
 =?utf-8?B?TldvRER6TzdqVk1XOHJCbVhrUm9NMGtLSkNFMjZTRXhvVkt0WGVwMDBkNVF6?=
 =?utf-8?B?eStEVDIrYWNpaGdueEk2SWR4NHdyL2ZDRlNOMHVWSSt4emZDZFFlbHA1WWhu?=
 =?utf-8?Q?o/DV78b/uvnFzoQP0QAk+MmZB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 599e199a-1e51-484e-67fc-08ddca72fd48
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 05:28:58.2198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: al9HmTMzULRJNb+rbYV/AYkqCl964VuvbeHWYg7phxhCPkSj6FjyViwmPA6UXh25
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4429



On 7/24/25 07:12, Ajay Neeli wrote:
> Implement shutdown function for Cadence I2C driver to suspend the bus
> during system "reboot" or "shutdown".
> 
> Interrupts are disabled in the handler to avoid spurious events when the
> driver is in slave mode.
> 
> Signed-off-by: Ajay Neeli <ajay.neeli@amd.com>
> ---
> Changes in V2:
> Disable interrupts
> ---
>   drivers/i2c/busses/i2c-cadence.c | 32 ++++++++++++++++++++++++++------
>   1 file changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index 8df63aa..e0a56df 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -192,6 +192,7 @@ enum cdns_i2c_slave_state {
>    * @transfer_size:	The maximum number of bytes in one transfer
>    * @atomic:		Mode of transfer
>    * @err_status_atomic:	Error status in atomic mode
> + * @irq:		IRQ Number
>    */
>   struct cdns_i2c {
>   	struct device		*dev;
> @@ -224,6 +225,7 @@ struct cdns_i2c {
>   	unsigned int transfer_size;
>   	bool atomic;
>   	int err_status_atomic;
> +	int irq;
>   };
>   
>   struct cdns_platform_data {
> @@ -1495,7 +1497,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>   {
>   	struct resource *r_mem;
>   	struct cdns_i2c *id;
> -	int ret, irq;
> +	int ret;
>   	const struct of_device_id *match;
>   
>   	id = devm_kzalloc(&pdev->dev, sizeof(*id), GFP_KERNEL);
> @@ -1526,9 +1528,9 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>   	if (IS_ERR(id->membase))
>   		return PTR_ERR(id->membase);
>   
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> -		return irq;
> +	id->irq = platform_get_irq(pdev, 0);
> +	if (id->irq < 0)
> +		return id->irq;
>   
>   	id->adap.owner = THIS_MODULE;
>   	id->adap.dev.of_node = pdev->dev.of_node;
> @@ -1590,10 +1592,10 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>   		goto err_clk_notifier_unregister;
>   	}
>   
> -	ret = devm_request_irq(&pdev->dev, irq, cdns_i2c_isr, 0,
> +	ret = devm_request_irq(&pdev->dev, id->irq, cdns_i2c_isr, 0,
>   				 DRIVER_NAME, id);
>   	if (ret) {
> -		dev_err(&pdev->dev, "cannot get irq %d\n", irq);
> +		dev_err(&pdev->dev, "cannot get irq %d\n", id->irq);
>   		goto err_clk_notifier_unregister;
>   	}
>   	cdns_i2c_init(id);
> @@ -1636,6 +1638,23 @@ static void cdns_i2c_remove(struct platform_device *pdev)
>   	reset_control_assert(id->reset);
>   }
>   
> +/**
> + * cdns_i2c_shutdown - Shutdown the i2c device
> + * @pdev:	Handle to the platform device structure
> + *
> + * This function handles shutdown sequence
> + */
> +static void cdns_i2c_shutdown(struct platform_device *pdev)
> +{
> +	struct cdns_i2c *id = platform_get_drvdata(pdev);
> +
> +	/* Disable interrupts */
> +	disable_irq(id->irq);
> +
> +	/* Initiate failure of client i2c transfers */
> +	i2c_mark_adapter_suspended(&id->adap);
> +}
> +
>   static struct platform_driver cdns_i2c_drv = {
>   	.driver = {
>   		.name  = DRIVER_NAME,
> @@ -1644,6 +1663,7 @@ static void cdns_i2c_remove(struct platform_device *pdev)
>   	},
>   	.probe  = cdns_i2c_probe,
>   	.remove = cdns_i2c_remove,
> +	.shutdown = cdns_i2c_shutdown,
>   };
>   
>   module_platform_driver(cdns_i2c_drv);

Andi: I was checking other drivers and I can't see any other action which should 
be taken to have proper shutdown. Please let us know if driver should do 
something else too.

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal


