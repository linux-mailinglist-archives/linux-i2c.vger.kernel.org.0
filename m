Return-Path: <linux-i2c+bounces-13794-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E48C06EEE
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 17:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEA873BF924
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 15:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9A7326D4D;
	Fri, 24 Oct 2025 15:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GTYxKTsn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010035.outbound.protection.outlook.com [40.93.198.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4AA3093D3;
	Fri, 24 Oct 2025 15:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761319065; cv=fail; b=KEk1QWMX8so2Fe0s846vs/Iw9/vE96mnPhJ126a2pSg6BRqo3r5xkh9pZF07vz162JCigNIs8YJTWBf1Ps8g8F5DcTpHsS3G4qX09b7ncAXVkJ2LbUW3F4ly28mgUBXCb/bGHjrjK5GfWJ4PZUe3giYiOK8bGbuxcnXNnfU8Enw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761319065; c=relaxed/simple;
	bh=u6JhLJcazG/SfloWurXn7dnhbgtsTkyCjHdLDzYZXoY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EiKezDweXr0x/OIgQps39vJjrKnP7nZIjZ7csSjNmMnT6sF487sqhWtIRluNJoEn3Z9YqWPLqyx8V+zul3XU/9vr8DnEwNGrDqm71EMnHngE7JnEVxHt/X8nJgw0oe9psavnZrB5SzFBYCC9h/TmA1tW/rNncbx3gZJj4fv5P3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GTYxKTsn; arc=fail smtp.client-ip=40.93.198.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PaoxHILw/o2Yw8uEwMuVp38s4uux+67g/zEcyoWjUQnqY/gwt2G1tuCI7IxpwKPAmrSBhjBl0EMP6Qx+Ar7mArRgBwRMiW2Rzb2OZDdoE41Eyo1tLBFb52DaM2PO3gG4EuoLDfn5RV9yq9tGqzO10qkwy12UMq5DCYfa1AMZOh2fGc1eeJ6kT/RhRMm7MtNAkb0+0GxhXJx47P5IXwwtE1xytRUwMiinnY55B4MtM3OmtDlD6vwEh/GuXvb6mDDz1dHw2kufSJf32TObT1UJdT4GwOYmCcZ4znsoVermUyNVEv5vF03n0FDenX8cM1FlybecSkOCj3oAVrL2AhbXMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3evCU5uIiNL6xdNW5CS9CAJwqmes65Wbo38xd7+OxsE=;
 b=htEiqCZCwaq6qrX3uxpPWF61L70/aTWKcZqm6NE/dzh3bsb/Ou/O/uX8PkjvtSiso5Wy2FONJBNwxD0apPE03gw0cqYMNuYXhALPf4sy0M72KslVHTfJOJaWvUe3gqrEQIjxSfyXZjYLbFPv9hb4roEGDZ6extQpucVNnxbrjZuexXKDh5bF1H3Pq+XJp31TzwJ7otc6TCRrVP3+uuyM7DluJQX3Io0jsUV4etXcDXprIB6nqOdO+Ea7FEVsF96HAOjK0L5ndwqqieHug79jGWO751M+Kmw1c2vVvR42VquvlDNMVzPyw5xDKl0LxGNV0gFbAkCz2NzN/hNK9WRrug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3evCU5uIiNL6xdNW5CS9CAJwqmes65Wbo38xd7+OxsE=;
 b=GTYxKTsnXO+VDrycCA0JQbhVnYi3r18zjNcyxFHVXm2V2uMbu5EACKLBGmA6adDeYf37PDjqXMDh6FOADpOPq1FKgz3/UKVr7zmCalTHiiguKK2KWSkypaTJ8gy1cXDGgDFBIf+AeLqQA/8zd//CsDmL4PxPSOlcD8tHqFtK9gwmvRl++AtBA9eiGJt4ca/hXkSzjh0pmAEa+CJGx5ZfEgocP/pLQOwp0qODZz5vOtzG/ltJEjTVv+RDK0NVSoQSwXlwYAsxgKWsfAkuIYsYyVqnj5ITF7qt4/jqivr0oRbDH2V7u2zMLs5uEe2+ACvOdLykdIYDoGjTZssEVfD87Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM4PR12MB6064.namprd12.prod.outlook.com (2603:10b6:8:af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:17:40 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:17:40 +0000
Message-ID: <32cd495d-105d-4026-8fe2-8187bd345b8a@nvidia.com>
Date: Fri, 24 Oct 2025 16:17:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: tegra: Add support for Tegra410
To: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251001153648.667036-1-kkartik@nvidia.com>
 <20251001153648.667036-3-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251001153648.667036-3-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0156.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::18) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DM4PR12MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: f78901cc-336a-432b-b40f-08de131078f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjRnM1VjbWJsNW9yNEhFeGFmUEkwQ3hzYVNOb0ZKQlU1R3ljMlkramc4OXd1?=
 =?utf-8?B?U0IwdXlKNDYzb1hCOFM5NDB1N2kyQk05c2xsYncwY1JUb013N0k2YVp0ekd5?=
 =?utf-8?B?MXE2by9XNE9ubEVyTEQ0bjhLUU1PODR4RmVUTDhEaVNhSWlPYWpRUUlUVXV1?=
 =?utf-8?B?anRZaTRrY3VoMVk0WEJWMW4xdUQ5bExkQ01HalJKeWs5amVUN3RHOW9GVEtj?=
 =?utf-8?B?N0dvb0ppTEFkV2hIRGl5RVJkRTJCWC9mcW1yMEZycUZZZWtWNEVxaEQyckVK?=
 =?utf-8?B?bkhRd2hMbHV4S1ZybXRmYzkrUE94citBR09aU3JQczZVR2dUNzVrNEpydDVm?=
 =?utf-8?B?bVBOWHZ1VzZuK2RZM21GTENDd1pTYS9QMkhHelVrVFNucmY3T1piNWtaeXc0?=
 =?utf-8?B?TXA2VnprM3ZhTmN2RlllcUJ2dnR3VHB1NDRIejcxUFROSUhiYWJaRFFJUnRB?=
 =?utf-8?B?aVhFTzdBbmVmQ0cwUzlIbnFmd0p2S1hYanB4V05pQkFtdHpOVFBudzlqNDVy?=
 =?utf-8?B?ekpoYmlrTmhaRGFyWWZHOUZySjRhelgwczRUdTJWMWQ2VXhrU3FKbHhTeUNC?=
 =?utf-8?B?TU1wQlljbmh2R0RPd2s1ZVdFUnZyTHZpSlVNNzJ2Q01FZ1NkWm0wYmFoTjll?=
 =?utf-8?B?SEhJZ1VMWjdMSWZGRlV4cHdUV2ZXbVNQTGFJRlZBZy9IZVZxMFBkN0pSaDhL?=
 =?utf-8?B?QUtlMVI2WkZNTVl2cHFQS3YyUG1IeGRKVGZ4eXFRY0IvNU5vdXR1cWdjZExQ?=
 =?utf-8?B?ajJZY2JaQk9XZFVKeENRNkF3cUVvc0d5VXNyOVl4RHlPN1dUM2ZRa1BRSVJm?=
 =?utf-8?B?VjBIWkh2TTNqRTJXcXpYYVVRRWtkdmQvQWhSZEwydTJSck1NMkZCVlVKUkNV?=
 =?utf-8?B?VXFlYXQvY29Hc01XRWNVNE1VbDVRQzB2VHgzN3lIdHA4Tk1wdXR2bUpPZjZP?=
 =?utf-8?B?dTAwSXRyaGcyZzlyVE1hWGlvVWVMdjVpQWYvNUFTR0ptVWVZL1B4VFBFRjQr?=
 =?utf-8?B?ODNDb0V0ZDhONHlmTytobm9pWlBmTDZkZE0zcWQ2WlBJWitRU3FpWWkvb0lY?=
 =?utf-8?B?bEpIS0FaRC9RaXpIS3FPVHZpUllUejdwQ1dHZDF5S0E3ZGtXN0JFSUtFbFJT?=
 =?utf-8?B?SVpheGMxazBUTldUUXc2bjVoeElGaXo5U1g1Q29BVW5QODRzclRqTDltT0xy?=
 =?utf-8?B?Mm9xc1JmYURQcGF3TU5pNVRCc3VXWFdvcHRwUVZOMTdCSDdOS0lkMGtwT01i?=
 =?utf-8?B?WThYbmdQUTEwaW5wUnpVZHhQMGVvWlFOQm9RYi9lSjgvQTZuOElPekJIMXow?=
 =?utf-8?B?V3pPL2hZZUpDV2hxT1dnbDlnay9aZW82WDBYd1JwbTRBWXdBdnFkTXJxTHVR?=
 =?utf-8?B?YUtZbXhOdk1HWHlFYzJZQjRYZDJvTElwQjlZRjFkYUNyelZmeW1Jdng3V09u?=
 =?utf-8?B?WnJ2QmlLdmRZLzVDNVExN3NTY0NVOWpON2k2eTlMQjlucmZjNGRTblIyT2po?=
 =?utf-8?B?eWhRM3Q1YVhkWGxOR2pHM1BlNXplbzBmQWoxemU3NWtTaURPUVJxb20ySFpj?=
 =?utf-8?B?Rit0aUkyUFZia1JpMEpDSlJSamU3NGVadSs5YmlFYVpQbFdmVUttMVgwd0xw?=
 =?utf-8?B?WjhYZnZ5S1I2QTJyOWFqd1pIeitVTi9YbE1ndjNpNnpyWkk1KzE1eCtHNDNX?=
 =?utf-8?B?ZFQwcVJtUHNlUlVpZlpuOUMrNTUvSW9Qbll1ak16MXZVQ0srZE0vd3REZ3lx?=
 =?utf-8?B?NUlhZGkyZStBWnpSQit1ZEpWYzEyVEdxVER0V0lLTGdWQ3F6Q3AvcEFvVnJu?=
 =?utf-8?B?VHNTZTM2YnJOdVBEeGhOdGdYNUE0cThsT2w4bnZwL3lzLzRjalhhemxvNjBo?=
 =?utf-8?B?RUVNV1ptSWVhQTBmREkxYk9PMWxDOVNncy9jSjhhNEVvSlhCdk5OanRCQUI1?=
 =?utf-8?B?TmoxZ3BGY2JGM2tPeFd2bW40b1BaOXEwVEw1dEJIbVpzY2lCNTd3NFU4eUpa?=
 =?utf-8?Q?xFv5q9tBf/dkwOhIsvFkmBBm8ZUlFQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0QrZHgvMGlpV2FsYThtUktxcXowZldvL25uVnlXbzVOcElHVlpyd2tuZ1FO?=
 =?utf-8?B?YWtUdWVGTlJ1cmJWNHZuSFI1clk3dFZIT0tjeFNoUUFsU0hrWE92YTJZdUc1?=
 =?utf-8?B?VFNoQzFUeDFNdUdzc2VGaDk0VEVZN3pKNnlyVlJzNVBkdCtoam5nNEdDbURp?=
 =?utf-8?B?aXRpd1FiWU1oOHVnRjY2TnFnOEZUUVZHSmNtNjN2V0ZlQU5GcWFTZStkU1Vl?=
 =?utf-8?B?dXllNU1NWE9NR0xSb2V3bzUxWFZiUXNGRDhvdHcxdnB5YWtwT3hDNnU2UlFt?=
 =?utf-8?B?eU1WcHhxV0lhb2ZzNlNzdHVBNk5Ga2VqMFgxY3dSZWRpZlA1T3drUjM5V1pT?=
 =?utf-8?B?R3hXZjlTMnB4L3dyeDUxQ0VrYmtRNjVrMUVOT0Zvb3FobGxPLzBVTVdIYXNC?=
 =?utf-8?B?aWZ2MEREU3pjbGJQbTJBZ3d4Z1YxUWdHMXV5V2hqVXI4Z3BhYUVHQVI5R2U3?=
 =?utf-8?B?aitNdGhsYS9BUmpwRjBIUCtBSW1LNzBCanpveFF4WG5Kc2h4RnZjU0d5Ukho?=
 =?utf-8?B?Uk1vb0NwT1VNdVc3cFg2UFRBNUZ4Lzd0THFqeWJQWVkwMjg3dE4vNEtxbkFl?=
 =?utf-8?B?bXVIbEx1VkpRRUQvTXo2Zi9UclVvS0tBc3NQNmZwZFlhZVZ4YVBQbnZaQ3Rp?=
 =?utf-8?B?WE45VjVjZWI3aGUwTGtvaEZpTGxhaDRGZ01DQk5PVEJhbTNIQ2MvNG1HRUZD?=
 =?utf-8?B?SHZ5UTFkVm9oN2J1RnhML2c0dFBNQ1AvN0kxUnVNQzBGR1pvWXBhdXQrWC9Y?=
 =?utf-8?B?RHg0SU05QVliV2RyTmlkajZWeXhqUGVjb1U2bFhIY2d0TkZWRGFEbnRPeHNy?=
 =?utf-8?B?M0F2OVpzY3B3L1VNYlpaYlhxQU1BZlR6RmkrK0JIL1F2UjFHbVp5ZHlwOVI1?=
 =?utf-8?B?UEdUclppWi9qS2Z1V1BaemphZlJwajNNa3l0bmszU2V3RHpwNWhDR1hHR3RR?=
 =?utf-8?B?eHpqeDBYdVc2dEZvUTFXajVVYnI3bXJmY1Nyb0s2UXNYUHNEcU9nOGxNY0x4?=
 =?utf-8?B?Uk5LM0gzaUtZRXFleTRscmhFTXRIY1pOQzI1UDRQVURKbWdRYWhOcS9qM3Nl?=
 =?utf-8?B?UHhnNEliekFiSHVmTjZabTJ1dXVuVU4xdXZxTmE1Skw5eEZNdnV5dU1zV2tD?=
 =?utf-8?B?QWVxWjNsb1BJd3d5b2V3OWZnQ1lNemgxbDdpUEkrcGFpMURyNk0zclU3WTZ3?=
 =?utf-8?B?cEx3dm94VXdSVHdSYmI3TTNTODdoZWxZdC9jcHpiRkNzcDJBd1h3a2IxMm4r?=
 =?utf-8?B?cm14Kzd6Tys5dno4VXFrOFl6dmtSMEw1Mkorb25OdVN6cDBGckYxaGZDMXF4?=
 =?utf-8?B?UXRLQkFCT1YvMldYRndhUm9MVERQMHhrU2c0SjJSMjJ1eFVWa1BGMkJ2Rmx3?=
 =?utf-8?B?SzRwMFNESFZoajg0Z0F1eWg5dWM3aXNRSzBzVXhyYzNqS09xUzFIenYrY0NX?=
 =?utf-8?B?b2xqNWw1WHB2MWJoYjNwNzJZUXp4aU0veFVZaXpkdnF5ejlsVXJRWGhWbDF4?=
 =?utf-8?B?UmpMNFJJWkpaRC94eklKVzUwanppYllmUXpsQXN2VXE5OCtKS0k4SkUrQkJW?=
 =?utf-8?B?WE1iejloUDFRQVYxWm9RbXZYOFpxcVNIV0V4NmpsVkh0ZVJadHlDN0JpUXBy?=
 =?utf-8?B?UVBHQU1IaHgrTHpjM2pmMFA4cWs5eWU2NW8vZTdhdlEzcGgyS1pYeE1SYllx?=
 =?utf-8?B?NnBjWDRZSklSeFFocGtpT0dWNHZtSzFTK042Q3JhWUFhb1pGcnloZ0NWNGlV?=
 =?utf-8?B?TmtNd3hLNFFOU2w1OVk3bXEwcmJXM1FBQS9GQ1lpU1BmN0dOV2QrVUF4MDk2?=
 =?utf-8?B?dG5WeUJqWDc3UEgzcitFeGh5UE1CeitRZW1iWDdaOEJLWmd5ay9lazFNNnAx?=
 =?utf-8?B?MmJ3WUJIL0U0aUJlOHJlSFNDOStCMjRCeDFLMDdIQUIwUHh2OVVGbEpyU2h4?=
 =?utf-8?B?ckUrSGRFQitSeStXZ3dLeDFKbUJ3bE9iQnVOQ0x2N0xabWFWWHU4RVk2MFNj?=
 =?utf-8?B?YlVaMjlLRm50eVpTM3ZVN3ZUTWxFQzZaRXh3cXN4c1ZLUWU2My9Bcm5YbS9i?=
 =?utf-8?B?UWxWL0JuYnRiakQ1RkZ3cFlMdjRtOUM0L2RsR2hRSmM4bUNLYVJPdllpUzkx?=
 =?utf-8?B?STltWFV3VkVDdC9iMEhqNGp5ZlNIUG9EbmtlaU4zUkdCWEhwdzlVZEUzQmh5?=
 =?utf-8?B?dTFIMkNXV3B5WnRPRFMyMTNJcXZzS2tQKy94cE1ramxsSFhvcDB0NnBYb3hq?=
 =?utf-8?B?SjVlMUoydUkzTmFyQzBaQmJQMFlnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f78901cc-336a-432b-b40f-08de131078f7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:17:40.6189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xF3A/hZUPQLc25mon/WFi0/IOJ4tIqmjpprbWL4viZC47D+6AAGQqZ/uWiJbcC1cs+tLjpvYFf4Oz8rAB7BScw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6064



On 01/10/2025 16:36, Kartik Rajput wrote:
> Add support for the Tegra410 SoC, which has 4 I2C controllers. The
> controllers are feature-equivalent to Tegra264; only the register
> offsets differ.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>   drivers/i2c/busses/i2c-tegra.c | 64 ++++++++++++++++++++++++++++++++++
>   1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 1e26d67cbd30..bc9f60b69020 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -262,6 +262,38 @@ static const struct tegra_i2c_regs tegra20_i2c_regs_vi = {
>   	.dvc_status = 0x00c,
>   };
>   
> +static const struct tegra_i2c_regs tegra410_i2c_regs = {
> +	.cnfg = 0x000,
> +	.status = 0x01c,
> +	.sl_cnfg = 0x020,
> +	.sl_addr1 = 0x02c,
> +	.sl_addr2 = 0x030,
> +	.tlow_sext = 0x034,
> +	.tx_fifo = 0x054,
> +	.rx_fifo = 0x058,
> +	.packet_transfer_status = 0x05c,
> +	.fifo_control = 0x060,
> +	.fifo_status = 0x064,
> +	.int_mask = 0x068,
> +	.int_status = 0x06c,
> +	.clk_divisor = 0x070,
> +	.bus_clear_cnfg = 0x088,
> +	.bus_clear_status = 0x08c,
> +	.config_load = 0x090,
> +	.clken_override = 0x094,
> +	.interface_timing_0 = 0x098,
> +	.interface_timing_1 = 0x09c,
> +	.hs_interface_timing_0 = 0x0a0,
> +	.hs_interface_timing_1 = 0x0a4,
> +	.master_reset_cntrl = 0x0ac,
> +	.mst_fifo_control = 0x0b8,
> +	.mst_fifo_status = 0x0bc,
> +	.sw_mutex = 0x0f0,
> +	.dvc_ctrl_reg1 = 0x000,
> +	.dvc_ctrl_reg3 = 0x008,
> +	.dvc_status = 0x00c,

We define dvc regs here but ...

> +};
> +
>   /*
>    * msg_end_type: The bus control which needs to be sent at end of transfer.
>    * @MSG_END_STOP: Send stop pulse.
> @@ -2020,6 +2052,37 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
>   	.regs = &tegra20_i2c_regs,
>   };
>   
> +static const struct tegra_i2c_hw_feature tegra410_i2c_hw = {
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
> +	.is_dvc = false,

dvc is not supported.

> +	.is_vi = false,
> +	.regs = &tegra410_i2c_regs,
> +};
> +
>   static const struct of_device_id tegra_i2c_of_match[] = {
>   	{ .compatible = "nvidia,tegra264-i2c", .data = &tegra264_i2c_hw, },
>   	{ .compatible = "nvidia,tegra256-i2c", .data = &tegra256_i2c_hw, },
> @@ -2330,6 +2393,7 @@ static const struct acpi_device_id tegra_i2c_acpi_match[] = {
>   	{.id = "NVDA0101", .driver_data = (kernel_ulong_t)&tegra210_i2c_hw},
>   	{.id = "NVDA0201", .driver_data = (kernel_ulong_t)&tegra186_i2c_hw},
>   	{.id = "NVDA0301", .driver_data = (kernel_ulong_t)&tegra194_i2c_hw},
> +	{.id = "NVDA2017", .driver_data = (kernel_ulong_t)&tegra410_i2c_hw},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(acpi, tegra_i2c_acpi_match);

-- 
nvpublic


