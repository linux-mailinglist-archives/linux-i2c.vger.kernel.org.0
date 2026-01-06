Return-Path: <linux-i2c+bounces-14918-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B3CCF819F
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 12:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D04B630D611B
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 11:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC74328243;
	Tue,  6 Jan 2026 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s8kTIEar"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012010.outbound.protection.outlook.com [40.107.209.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F102325486;
	Tue,  6 Jan 2026 11:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767699309; cv=fail; b=mmOhAKVC90mrrxaDwokjSiV7H9XNMp51EwFNZuAOQ4mkn9GIQvoj41KLsPiTjP5WAma6oyGX+0xGLiCGhY3J1ufaAbxuqMFo2/qhgSF7TG0KFlBmFX9FS5plLWmtGNn3+Zg8uxuTRsS44Q/9Tm75UxgA3r2KahSvlvKgdcRT3G8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767699309; c=relaxed/simple;
	bh=L0nJwrTOp1OYoqqo0a3sC7cyr5GI8ouJ+tkAMv9SMTA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EJbCGyn7AwQIZ82OIrm71ZfXqu19iwbofmSk9UmzQLtblO7AGNhwC7vyCUK0X6UuaKEgbO52qGo8CBrCqa8HWbCikOGXPkZ+SvpqYTSTrB4H9msT1qR3Mlkox+CnRCwwZE+RWE9d0RikKOUXH7AJlL7ZR/VFWTPJecsVIljTnPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s8kTIEar; arc=fail smtp.client-ip=40.107.209.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqcdReHcLEGeyOtJwbEz5w8ezV0EO1e2dVPksMe1Pvx7srX2tMuvpnem1cstFyA+HLsntkJ2vnzLLbZiE1IkRN0wM0iVGnQQJfjHLlXIUMGvx55NXPBUzVDwS7JBMlcidD2VPyzw0CTI/1KjGD7XgnWqC71h+kG/Z2SYdiwYzelYEKluEKsPXDn0Us4LTQeeMQoN1Bk7ZeyxbLw6/OA3TBr/JjpbQMRQOQ0zBYcuyvpOsk1OGaIGNvqUMEeVmpJlvReYNUyV0PZP6TpeyTq2kxlZeLhKHxvvgttRLvQHaB2Cg4a5/H5gbkeuWsAifiAnY0S0MFWpAushmO58bB3kNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pre2FLo/xhiv3YpOJF2oH0y581tOzl0K7Z2KzHTy7lI=;
 b=sIJRKWf6TPOw6C6jI29NbpX+/4MAvU/Xb1NRZdkZ4bzm8ZRpOc3oDFjSB92fml9BSApAyk6Ew9VGmbGFvzSkDgR96TzXo8/8ykQakiBUDVviDzqgknZYgniY+pZcHn22xk53hDJ826JMDoq0SaeDLp5pLEgpB9UYPzvM8scHvJryd/QA5d8HeS53Z5EWsg571Kukx+0Z9RHIXoVKS0l8guHAcYx+uEkHE8/7mXc9wxQDGMdaqY02PSRsQ/ur/n4FXhfQaC/rcDpO2HOI6vJ62umgDGz5/CEQchSKkgWWbHGY51ztLBFyFfV1mauKK97iS4s/d74lIli2KnOLKVCZqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pre2FLo/xhiv3YpOJF2oH0y581tOzl0K7Z2KzHTy7lI=;
 b=s8kTIEarOORedNuGhDZgGJKgF00qkMX18TtrpdAZNOwTDsmkMsE2p6cUmVefhsNh6wPOwVzztOqZDN/FMB3jTePbhEJOAMrvOiLSUnAuvgIOClZDIYqydVdgqgf7oKG8qmaROQ1P8eBvkpntnYrCnPGZ8iJy3rthRhdY9Z/ufcqaTX0JK8SRpVxfwEgJoB9WFZRnuArYPd2Sq6xXTfoj6NKaiyOBKGBiXTDBh+nXyfxN9Z/9g/Sx9z/KFmuERwQw/OooTSxL6kdpzrX1yYp6RaDWmrQ8bPDq9CSfurIdNEZGGB434yfcm6lP9Lkjs17GBdoNoTrxYqk0Ow3WtfiwRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM4PR12MB6445.namprd12.prod.outlook.com (2603:10b6:8:bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 11:35:02 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 11:35:02 +0000
Message-ID: <e4be900b-207e-49b1-a7d4-5cf88e0caf2e@nvidia.com>
Date: Tue, 6 Jan 2026 11:34:58 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] i2c: tegra: Move variant to tegra_i2c_hw_feature
To: Kartik Rajput <kkartik@nvidia.com>, ldewangan@nvidia.com,
 digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260106111033.5556-1-kkartik@nvidia.com>
 <20260106111033.5556-3-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260106111033.5556-3-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0387.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::14) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DM4PR12MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: efd810d6-4f1d-4fcb-709a-08de4d17a19d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TktOOUJaQTlOODVCLzRyemJuRDdpSlIyRy9JT0pPd3BSNWk2Tm9DdGdsc2NW?=
 =?utf-8?B?ZFRvZGdpbk9LdHRwRVdmcTlvUU5EVnIveSticmNmdVhRNTVWYVpDRzBNSmRD?=
 =?utf-8?B?R1BEOHhhSEJSZ20vcEt3MENZNmJyOFNES2ZyZlNBTnpLdXoyd1d0dG5oeXJI?=
 =?utf-8?B?R3MrdWlNYnFpQ2ttcVVFQkFGV3ZEb09lZVJSSlJDSzBRY0xNbTRxN0NITm45?=
 =?utf-8?B?VldwRW1pNTlsWWxKZ0lqVUNuczd3M2wxWkhKbEZQM1IrRk03VGtOR2gveHpO?=
 =?utf-8?B?V0xwZnhORHZOQjlXQmtjeUpDWVVZdjRodWNRUk5VeTV0K09la2ZmVmZJTzBI?=
 =?utf-8?B?dkthbWVGbUY1NGpaUW52Vmt4aEpicmxpaHk1T2lRdzMwZmw0YXIrTjgyeWlZ?=
 =?utf-8?B?eVlWLzlldGU3SEJqbFJTTCtabk1aVUxvbXEwNHY5Z1hGWlROOUViKzNqdkNN?=
 =?utf-8?B?dDBUZ2pabXpZa2U2dm5naFIwazBPaEJZZ3BZRVU4TWxZWUJhVjQ0K2pydTNZ?=
 =?utf-8?B?WnBmNUN0MXJCT1BRWVUyL2VaWFNqNlBacGFEcUFLMmwwQ3NaZlE4dnhWNy9p?=
 =?utf-8?B?R1J2NXBuaGRWWFdIeVlSMUk0c3VPY09XVkJmR0JxVWphaXpNdFhKTm05am02?=
 =?utf-8?B?MmlncjdrZVJUa3pDdktkNGJ3NXlrRFp0dkJwZDRld1EyWEZmRVEzREpFWnk1?=
 =?utf-8?B?N3NieUpaa0JYS25NVmZsWU9CVXcrdU9UZnNqN0F3YmxNYlNlQzgrMUx6dmxx?=
 =?utf-8?B?UmhkZFR6YjlPS21qRjBmTzlpVGU0aXpFWVpnanN6ZVJQNlV3VXYvbVBIeDhu?=
 =?utf-8?B?SEtWM0JjTy9ZMkErZ0NUUTZWc200cTRKSHZZSGtFZUVDaWUrVTdTL0N1THQx?=
 =?utf-8?B?N3FvTjdLYnlEelI2Y29iK0JBZDZBWnpGY2ZWT0pPSEJIVHl3YTFuS0RNNENE?=
 =?utf-8?B?b0s0Ny9sOUtIbTdsejdmMkhrVHZ0bDZCbWw2V3drbUNhV0Vsa1dMM3djUXVp?=
 =?utf-8?B?Wlh3eFlLb3lITWI2cTU0MmwrU3kzRWtTbFdXU05SbUNhaDRheEF2TTRCbm5J?=
 =?utf-8?B?T2pXcjRpRWc0N05DL0JneVd5bG1Uamc4aW11MUlPWkNPb0xkL0RaNzErZlY0?=
 =?utf-8?B?QndUaDFENTBtSGFMaTk4MjhYbGhCV0YvYUh5Wi9vM0hoS2FkVzl5STVQQzVU?=
 =?utf-8?B?dVhvcmwzdm9sY2M5dldMSDFTcFZaOGRrSWp0eVRISmE4MTBGbXg5ckNiMUxY?=
 =?utf-8?B?cEZVSTQ5TXBMcjJ3d1MremRmQ3E1by9CTzEvV0ZXMUtzbWE0RWd2V1F4eHRo?=
 =?utf-8?B?S0k3WGdvUHFoQTg4N2cvak9MaEs1aVc2MTFnUHNXWElzM042WmhvRmU1ekh0?=
 =?utf-8?B?bDdvc1ovN0tKMzhkS3JSZnJueCt2dmtqMGVkVW1OL09pS2FYKzNMdHp4UUox?=
 =?utf-8?B?Tm8rblpMOEwwRFRISEUvMGNvRlNsSHhUelBpOXVNNitNZTl1S3NiMFQzU0xX?=
 =?utf-8?B?TlV3OXpjZ2RXUlQ5QzhaY0x4VmJVSmhZWXBYS0xzTEIyZHNQMEVXa2xNT08r?=
 =?utf-8?B?WWVMUExnOWlZRFZ6N3hkU2xWQnZsUXpaVE1icjRqcE9IU3A5aXpQMUFBaEw3?=
 =?utf-8?B?Nk56a0I1dkxXT0NRck5SUG80djV5YjUzUmhFbS9sYUpOS0Nyck9yVnMxd3hO?=
 =?utf-8?B?RktyaE5MVmMyVjNaOXU0OVdLRHlBYk9hN3d4RGtVSUlnRUVQblNSMzdYT2Ju?=
 =?utf-8?B?UkNoL1lsVXBxVE5VT0g5V1lGWE5QT1lPZlZDQUxhN1hrWFlBNU9MQzJ4ajc4?=
 =?utf-8?B?YjYyQ2t6VkNkbjJ6TENLV2ZSSHBNRitibUVpTzIzNUhvNEI4OUt0azF1ZHJt?=
 =?utf-8?B?Wmo4LzJoYmtaZFg4d1B1c3BNSUVCNStGVUpFTXg5WFZPaTY5cmJkcFlCTWcw?=
 =?utf-8?B?Vk83SzkvN09mSjloY3d4RituZHJKMEw2Y29Ea2Z1ejRzcVVzenhqNkQxejBE?=
 =?utf-8?Q?fkg0IlYqyPy6F4QZoaQLa5YLaeeq+o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N09nbmQ5VDlCM09WZisrYkNHVitKVDRybmxoV29RdDlpRDNsUlBRRlFOdzQy?=
 =?utf-8?B?YUtDbko3aUd5MEsycCtuOGtLUXFXN0VlNW81UGlicDRqUHhGa1VLbWVSQzcz?=
 =?utf-8?B?T1JDZ25IVnZ1RENoNXZ2b2NNT2R0aERLKy9HU1J1NTFXTzlGUVpQOTByRlQy?=
 =?utf-8?B?MENHTUdreHR2VlJaeVlKVEd4Yi9JNWwxYWxxWjNMeWw4aVlSR0xWZ3E2dUZl?=
 =?utf-8?B?RmlaZGRNUFJuK0tFYk9xWnJtRlB5SlBRNUlnNkV0WEtlMVFaVUE0QkZGejJa?=
 =?utf-8?B?YnZDd0ZBZWIxR1NmQW1UcjAzclhYdmRLN0t6bmhsSUdobmVlOEw2OFRJcVZz?=
 =?utf-8?B?TXpUZWNaOWtmbldUUHBZOXhpWlVjTEpYZ3dEUlZjNk9ZRE02ZWNsTlZJWHJZ?=
 =?utf-8?B?T04yMndETFFudFBZZitQdkpabGx3bnozS3ByTUFZaDdBU1oyUGowd095NHZX?=
 =?utf-8?B?MVhuUjRjNE1QUzh3bC9ySzJ4ZE9LUm5LUS9hRU9PWGthNW5qQkNPd0pHTG9a?=
 =?utf-8?B?cHlZQkN1dGdjUWpsOXhRS0ZiR1ZDN0RZUUlZWTY0UCtGaUtQTWVGR2VvMjA5?=
 =?utf-8?B?SDBmWXdtZzBiRE5CUUFISUpEYjJURG9QQWJiN09XYjA2RDRVb0FhN1RabUw4?=
 =?utf-8?B?Yy8wRS8rRktBT29YLy9rbzNHaEIyMWtxblFHZXZxdGIyTFp5MC9XR2tOUmlB?=
 =?utf-8?B?RGN3WHU3QjZzYmlEcGR3TFBlbmhmaCtZM2QxV2poYitVaEt6aExpS0xCY0Fn?=
 =?utf-8?B?SXlId3VZcW5iSitBR0E2Zm1nYkluV2R3K0lsZmlFZllNdXNRZDNpbzZTZDZw?=
 =?utf-8?B?NmtJaXNTblhtcFVuL1FkaThzMUUwNjVkcngvTXNrakFDbDhlNzMwYWkrc2dT?=
 =?utf-8?B?N2xmZFB6eHhHeFh5TlNxWU5XbjFnS0N0TjhzWXVQUlY1clB2SGx0amRqd2xl?=
 =?utf-8?B?VHlaSHVlWENaalJtVncwQ0dQODdtVnFUc2Y2MDVYeDdRQ01uYVlKRFM3SFlB?=
 =?utf-8?B?WWhjYktvU0l1VlVhWmVlWFJMWmZzZ25Obm5uL1M4NEFZNXJ0b2pubC9PTUtO?=
 =?utf-8?B?K1FuZm55RkNGK0psMTBUVzdEWEhzVWxNTGNlOCtmbG1zc2lCZ2dlcmg3LzJ4?=
 =?utf-8?B?Vm1UVmdFV09YaW5CK1RqUkV5NEI1eXZacmIwUmxDaFVHWmVrVFBMMmFjcFJn?=
 =?utf-8?B?Yk5SRGorb2VJSUwxSlRkS3FjNlVwRnBsS3hoUElJbGVWNUYwSkdOOWVaZzB3?=
 =?utf-8?B?ZlkxSXhONFZsNDUyZ2pFVnlGM1UyVjJzYmxJeXdGWk8wY0dEVjRsMk9uRFRE?=
 =?utf-8?B?eHVRRVhCOUtZRkZueVZwbUREdTdEZjV3eWdiTC9aSTdjbUx1cTVRTXFWQVls?=
 =?utf-8?B?VERER0svYVlaMEJFcytiaGtOQjdzcDhNcjBUdUNZd2J2TFcrbHY3VGU4YkI1?=
 =?utf-8?B?blhJME45TDV2Tzg4ZW9WQWJtSGVHbENwMGxxbDJFUlVBS0txbXVZYXVMNlA3?=
 =?utf-8?B?Q2ZVWlU1dnBTeUd5aisyNnJuWjExYjVtVkZnYlRLYWFtenpKZkJIaFFiS1oz?=
 =?utf-8?B?UHR1UzE3NmFRZ2YwU1RxR0NXbXZkT0h0d2Y3UkJ4cExnYkwwMTZacU5EUTRs?=
 =?utf-8?B?M3paNzZyL0p6a0NuanYxSVd6SXJVUU5mcWxMd294dTNZV3lPWUQ3WWI2M2N4?=
 =?utf-8?B?a1dZMmtyQ0RkOXM0RjROVUQ4TlpDUjFLNmVOQ1gycGhFNWRqWkg4L1dCclBL?=
 =?utf-8?B?WVdTZkhkdjFDT05DY1pQd2JRcGRDaGVWUFZrUUxnVmFSbXhRS1lYZHhMYlNR?=
 =?utf-8?B?eWc5YVhJV2NTOUQ3dTNnc3htUXN6T1JzTGlEWTVxZUlDRkpLbXJjbHZIaHRq?=
 =?utf-8?B?TFhDaWhNNTk3K2M2UVUrQ3FWcXNtZkhnbTIyd1NXaEJlbEh6SktDdEFodStV?=
 =?utf-8?B?MVlpcEhra2pHQVNwTTd5K1FLYmhMekk2UkRVQ1JXRFByWFYydm9FUGwrbFVt?=
 =?utf-8?B?TUlCWDhCTFF4RVhKT1M5bnliNjhPUXBzWmJOdUNoSWFDQThsTGQ1WSsxWXcz?=
 =?utf-8?B?ZFNHU3RsNllTVVZMQkMrOWxYem1yM3R2aGs4UXRiREJHKzZrNjNWck9uRk5z?=
 =?utf-8?B?ZGpJZVE4MGE0ZHJTaGNSdmlwYys0NUlzMUNOWkpIUXd0cWhHaEtoT2tsNkxU?=
 =?utf-8?B?OTVrenR6OHdSY29FREJyY1lqcWVlUTdmZEFRUFhER3VXSE5OVElRc0pyMWVQ?=
 =?utf-8?B?R0JsVWNwNGJOOE40SDM3dnN5aDF3QlJiaTFOT2NyeHhiOGxzZDZtUWIxZnN0?=
 =?utf-8?B?TUJ3c2dNTWdVYUs5cFhpR1FUbHhPMXlEREs3MU84NDMzRjVta0Fxdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efd810d6-4f1d-4fcb-709a-08de4d17a19d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:35:02.6401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +N2bOjTfH1uCOLmOvnoywo1n+Z+op0Mc1g5wtb7bD1OvpwMAKB7DHueI6yZr6sUU89Rtff9gSJJYs52ek0eBbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6445


On 06/01/2026 11:10, Kartik Rajput wrote:
> Move the variant field into tegra_i2c_hw_feature and populate it for all
> SoCs. Add dedicated SoC data for "nvidia,tegra20-i2c-dvc" and
> "nvidia,tegra210-i2c-vi" compatibles. Drop the compatible-string checks
> from tegra_i2c_parse_dt to initialize the Tegra I2C variant. Also remove
> the redundant config checks from IS_VI and IS_DVC macros.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>   drivers/i2c/busses/i2c-tegra.c | 100 ++++++++++++++++++++++++++-------
>   1 file changed, 81 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 9a09079dcc9c..4ab991a22350 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -235,6 +235,7 @@ enum tegra_i2c_variant {
>    *		timing settings.
>    * @enable_hs_mode_support: Enable support for high speed (HS) mode transfers.
>    * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
> + * @variant: This represents the I2C controller variant.
>    */
>   struct tegra_i2c_hw_feature {
>   	bool has_continue_xfer_support;
> @@ -266,6 +267,7 @@ struct tegra_i2c_hw_feature {
>   	bool has_interface_timing_reg;
>   	bool enable_hs_mode_support;
>   	bool has_mutex;
> +	enum tegra_i2c_variant variant;
>   };
>   
>   /**
> @@ -281,7 +283,6 @@ struct tegra_i2c_hw_feature {
>    * @base_phys: physical base address of the I2C controller
>    * @cont_id: I2C controller ID, used for packet header
>    * @irq: IRQ number of transfer complete interrupt
> - * @variant: This represents the I2C controller variant.
>    * @msg_complete: transfer completion notifier
>    * @msg_buf_remaining: size of unsent data in the message buffer
>    * @msg_len: length of message in current transfer
> @@ -334,13 +335,10 @@ struct tegra_i2c_dev {
>   	bool atomic_mode;
>   	bool dma_mode;
>   	bool msg_read;
> -	enum tegra_i2c_variant variant;
>   };
>   
> -#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && \
> -		     (dev)->variant == TEGRA_I2C_VARIANT_DVC)
> -#define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && \
> -		     (dev)->variant == TEGRA_I2C_VARIANT_VI)
> +#define IS_DVC(dev) ((dev)->hw->variant == TEGRA_I2C_VARIANT_DVC)
> +#define IS_VI(dev)  ((dev)->hw->variant == TEGRA_I2C_VARIANT_VI)

I was thinking about this and actually, I am wondering if we should 
leave these checks present because if these are not enabled, then the 
compiler should be enable to drop all the associated code at compile 
time. So there could be some value to keeping this as is.

Jon

-- 
nvpublic


