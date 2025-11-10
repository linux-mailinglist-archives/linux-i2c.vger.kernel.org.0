Return-Path: <linux-i2c+bounces-14030-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AFEC46420
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 12:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9A67C4ED8D4
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 11:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB97030BF66;
	Mon, 10 Nov 2025 11:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JBv1U4tB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010021.outbound.protection.outlook.com [40.93.198.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD09022538F;
	Mon, 10 Nov 2025 11:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762773927; cv=fail; b=HS13g5hKYo9Y9fAPTjEwL55d92IIfL7ukycv/GjLE2DHAFb9G63MTzPBIXpDhmzClNDS5i2i5aimOt+V+Z5OLRanaBMDmpDyU/SN3TdU8P1VZEJGhau3cw8J4P90uTs8Vz+QaNLcXcQS4LkwmyTNgHka/qI343E6KRJ62zI8D90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762773927; c=relaxed/simple;
	bh=YyXb/jV3ZpL58kZb1aS+IuPydQdmLNKmmzsKwj8nhoA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eGb8a2FQji8fGcbvC7oG/3qFDy34tXG9eE4elpvxa74YXPQQgbg4fbxEs6Ryd9cMxrEjudHbOC4jmW23cI3mq5zU66eXvVSxiPaEVM7xJr1n4Vt2v0+ZMEATfJ6kPa7N+wT0mYERIiesdQgL8kMEUNMND+1ncP8IJkn6dFbgnLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JBv1U4tB; arc=fail smtp.client-ip=40.93.198.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4t3k96kTjiqac89JXOnqaz0sOEs6VqI+krhNRuexyY13HKtYC5M5JrTIO/J9Gi24/WhJ5b7un7jFNwnN6H0h7FX0pStgIyvwbEUtXTTRfrq1hVTEqvC+3EVwnGtyMJFA5boZ1m2CeycobHquyXT8fkIhmqtyDzb54Z9chc0op6/9O4Z0JZ8dxophXE+3XRgt/nUtjPYD5RKpp56IlL5H5Z4AhJ+IB6MR6NeshjpJbgh5NJt6m3cyAf31ygMMWU2e5lHhqEfC4b2WrxD5wJ9vUuQ8Nm8H6HLCbqGLkcz2CAR81L2vW3t9KXz/kzdSbSkCKoKzb+AYcYfOxOavAmFHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3590QK8biwBXIyW/uOTix7n9GxLb08AMJYK+H/sNk9c=;
 b=O5IpvHErfSTHmgq8B6ekKS9sFEGafGQ9kygqfMM+zuFYrf6J80SbBfwDAuuBmxFL9vXEy5PhPp+1Y4JkIqr16lXBRbxctlLcX64qHYCwSBSdDp8MVqtahXu5AMx31zdtNKW0HTdj0a/htweXifS5a0LiF0uUTE6saaJvn1g/WI3h2iPNcFCQ7Ac4gwjyaWfTY1SM0GoZgW3el1l3DvgpoCZBesK15oMmhPfN+CPWgDRv+dwcXY8BTsNU2YbDeT/bhHKf6XmpPUapFhS99Rspm698YQf45Plequgtg6b/s2piMEK4WF00ET9hivP4/XP1JJvBrKhxWVWO6Ssubuz8KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3590QK8biwBXIyW/uOTix7n9GxLb08AMJYK+H/sNk9c=;
 b=JBv1U4tBsyoVrhiREuyLpz/ihugswsJ/9VQIm1djK/fsiHnqMvpkfMIa1dzq5w6Yah1XJFsDBJpsIj6DWGrt7YZr+QH+vWKBRvlbfrN+K0RTZmP1VexmU4u6LH48V/G2y3RMCZ0pA20UG0rmjFOzSQ6jKuzpUHLxetReogQefs0kaInkViVfGEdpk5roPbrvrUmPbZW9DZRo6If8mS8sPz171bKMb0egt0a4B5liPttwpvUahGO4eJQruNG4nx223sq/pPOFt2M7lHWLIDcVmc90WVflE4q2aB4sNanUUizXulUe+hlAsxNR4oJEQGnPkRIxSsEJrLOwOQM9H+I48A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH0PR12MB8799.namprd12.prod.outlook.com (2603:10b6:510:28e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 11:25:20 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 11:25:19 +0000
Message-ID: <8c6c8c3e-b605-467f-9c6d-1e13e0e5e009@nvidia.com>
Date: Mon, 10 Nov 2025 11:25:13 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] i2c: tegra: Add HS mode support
To: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251110080502.865953-1-kkartik@nvidia.com>
 <20251110080502.865953-3-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251110080502.865953-3-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0196.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::21) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH0PR12MB8799:EE_
X-MS-Office365-Filtering-Correlation-Id: bde20f3e-d49a-40ab-99ef-08de204bd46d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHhjTVkwU0FXNWJheGlFbk1DcVZCOCtBaTZaRjN6dzdCOS9KVEYyc3lXaTNq?=
 =?utf-8?B?cFdtS0tqWm5DVTJZdnNVdm0vdmR0VWNZV0pGSWZKM0FhcDg4NkVWRUt0ZUFM?=
 =?utf-8?B?WjF0Q29pUnc4VlZGWVJoQXQxSkFaWWg0TCtmcFZBZzBCVEN6aFZ6QlpvVmhT?=
 =?utf-8?B?dUhBcW1WRVFiVUFKTE5NWktUOHd6bml5TDFNYS9tbEJybWdqTUJyZGF6Tk5O?=
 =?utf-8?B?OGJHa1QvL3B4UmlTOG8wUEpwdTB3MXZ0K3pHeU82TGNKbU5uLzlsajJkZ3pR?=
 =?utf-8?B?N0dMS2lpTkJWTnhVWXZhQVhHTytuQ0RqWUtqYjExMGVYQ0IveTQxKzNYSWZy?=
 =?utf-8?B?dVhtVFhWdEM3UzZVOFplTXJmdjZ6b1FzdzR0ZGRqY3JvTENEcndOV09OY3Rw?=
 =?utf-8?B?ek9HSi9yd2RZeStpTzRrbUxHTi8vRExSb2FJREdVUURtVnFOMzJCckY5eTlY?=
 =?utf-8?B?empmREIxOWJObDU5aVo5QkpOcTJvcmd3b2Z4dnZRU1VPald6L1lmU1hJZUM5?=
 =?utf-8?B?MElsdFdPMmtTTXdpUVpXbXFNN0x3QWJaTVZqMVhSS2RiVWw3cXNaZkcyb29n?=
 =?utf-8?B?djR3cEFTNnVmeG80bkdGeHNteW9NMjFBNjVkZndHQTNnQ0lEa1YvZ3hDRm1n?=
 =?utf-8?B?dEtVUmhyTE5QNmMvNjl5a2FYdUNCek5uRWVaczVIbXVRSlg1T1RCRDU1M1RG?=
 =?utf-8?B?eXF4cTl4QnZjcWJLcW9NbGtSOEdPS0czWHo0eTFkekxnT2hoZTU3SDI4NE96?=
 =?utf-8?B?YmQ3R3dnQmV6TS9ieHFrZzN6bHdmZmozbXVPU2ZXUFE4VkYvWisrV0ZXdVRN?=
 =?utf-8?B?aDViN1VEREhXeG9iSlNkNnZUQjc5NWxlYVpVS3NjMWNiUzYwUThHRHh0WjRH?=
 =?utf-8?B?cklOYWNjL0VUdWc1VmlBUldCNDdGSzBmRlRveDJtU3ZtbjJSOFYwbFNjdGlD?=
 =?utf-8?B?a2lSb3FXY2lMQTMwQnpYcjFNWWpHblFpcWZnR0ZhbnVEbDZQYm92QTA0Y2dm?=
 =?utf-8?B?UC9LWklmV3U1MTVON1lhSmxZVWVPMnhQV001UFB4RnA4S205R3NTYUxKeUZP?=
 =?utf-8?B?YXdLb0xUYWlxOWpqdUI3d2FkcDRnTXZ0OWJxSHlpMlpQeTJ3Z3F1bjNGRnZ3?=
 =?utf-8?B?bTVTQjd6dURsSE5Lc3YvY3c2VFIvNVBNNW44Y0RVQVRpb0xhTzNBanlLMWs1?=
 =?utf-8?B?RnJDckhXTkNKNEpjY0U2VnFVMVllUGtKNjBzaFpGZTc4RVJFZDJGQy9nTTJt?=
 =?utf-8?B?WlFjK1ZhSzMyV2tYMFZieWJqaEU3VE9ETExSWHV0TjJrZmc4L0xtSmZOaml5?=
 =?utf-8?B?cUxySXc4OFBtUEdSV2VobnpaRXVZRkxuUUpPWFU5d29DS2dsZFpqbHEzbjdu?=
 =?utf-8?B?UkI4ZzFDc1VGNlByd0l3SWUyRW1mRXE2MmhmUlh6c3VGZ29HSlZ1YTNRUGxI?=
 =?utf-8?B?WVhQa3JYNzhoQ0FiZUV5dFJrQXJ3YjY3dURDdi9qRkRyUTVCL0dkS0dNWXhD?=
 =?utf-8?B?dXVGc0xXbGZFVXNHS0xyZldJb3I3OFNRRzhiK1dFWWFySnFMaWFBcFRHd0RO?=
 =?utf-8?B?TVFYZzdXSkNJQkMxMWhsYXZ1QUo3S0dUOUgzWVZScmJEWU05SnFKSVdETGd1?=
 =?utf-8?B?bk5yeFdyeWQ5Mlc1TjczYXdwV3ZWR3RLblhQMVk5QW8rLzhmNWxMWXBTcU8y?=
 =?utf-8?B?bUN5WjNBUjFoekgzRUJ1MU1pNHFiYks4dEpBK0FEUkxXMHlBZE5oVURGNnlQ?=
 =?utf-8?B?NzZSTk80VUpsdXVRaU45Yi9Xbk90bElUVHhyM0pkL2NGUVBVM2llaUx1YVZv?=
 =?utf-8?B?RDdGNERXYzV3WmlNVEw3MTNweHk1eGFKckVDUTFqbERZaHFuaFpsUklmVit2?=
 =?utf-8?B?ejNVeCtJOVdhQ2RFclZqNDhXcXQyWHpRS0tIbVZLa0lyMnR3b0VDajhXRGtN?=
 =?utf-8?B?UjRZZjNmbUVFT0YxQ3lZODBaTS9Gc3pHOTJPS0QzODJneW5mMmVBS1BOY25M?=
 =?utf-8?Q?bOuYkWuLrvHbgZKqikoWNQZfGwv0jo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWl4cE5GMmx0Y1lUQXB4K2lNbkt4ektTZ0VwWCtRcXRRait6RWRtSWhoTkxC?=
 =?utf-8?B?VWVlNU1jakFRdHNkNmVIU05yNkY5c0MxRjM2NktNcTBvZkFaVGp6Yzhsd2pv?=
 =?utf-8?B?R2xtdjNWK1d3a296SkJMNkVSQzBuTkk0b2JFY0FPRUl1M0VBMHhmMXZTV01q?=
 =?utf-8?B?UEMxN1NCcDRnelIrN2VPMWFaYkhMdEh2c2JBM3ZSSE9xQmE3TkQ0NmdhbnpF?=
 =?utf-8?B?UG5xSGZLUU95SDhabkZHcWUyQ0xLdlk5cGVyS09JVE5KaHF5VHJQbTcxT1pN?=
 =?utf-8?B?RkhFSnNlR2V5YzFHTUJEQi9HSnlsU2J4NDl4T1JreEhGVnhqUG1ZWDNQRS9B?=
 =?utf-8?B?SllubjY0RC9ialVRZ1MvVVlxSHpJSC9HSFJ3Rm9LdG4xdzFKL2xBODV5Qzgr?=
 =?utf-8?B?cVdNSTZjTkx6QjZWQ3BLeW82YnpDWitXMkN3VFRrRlE2cVBvTW82eDgzT3FX?=
 =?utf-8?B?Ui9PQ2JuVVNsSnh0aG5LZ3VWRmh0M0hGSWl1RHArY05XNDVxVXlPQlcvLzI2?=
 =?utf-8?B?Y2taamt5ZTk4TnBEa1pJSEhjcVF0UUgzN0VhV0JCM05pVzY3dlBTUHU5YVVO?=
 =?utf-8?B?QnpGNzNBYS9GcjVPL3diUUhidEI4QWdjTXlXbU0zQWp0NkFFWHh2QmlOa3RB?=
 =?utf-8?B?WWZPdjBXTHdWU0N5ZW9vVERIUEU3MzFQQWZBUWZRUVJ4RnpveTNsTnV2NEZP?=
 =?utf-8?B?SFRpOStld2drbUpWYkVVQy9wcTVJdnQ3QlBmbG5QR2ZqTTQ3OGcrbXFESThF?=
 =?utf-8?B?azROa0FkNlJrV0o3b25DVU5YWW9wejZGR2duM0xKOGVXeGp3RWprS3E5amlC?=
 =?utf-8?B?eHZRdlhteFdiemp2ZmUvdFpSaXRncGxyNGtyTWg4N0xsU25FdmRvQWpqdVY0?=
 =?utf-8?B?NDdJUlNVdDZmVHRzL0Y4eHlCWjlxS3FBL1R5dUF2c0tEUmgwSWpGVUh4OGRv?=
 =?utf-8?B?WFp0WnRLOGtHTy9mSkY0cVlDYTJVMDd4ZjlOeVBveGN6YkZHeEd1a3UvSk56?=
 =?utf-8?B?VVNaRE1vQ1VGamxlaVdzNzdBeFg1d3NBU243NG1nd1NpVzduRFlRd2c2Z2JD?=
 =?utf-8?B?YnAvMnFPN3JSMFVWSDZjTG9pU3REeGJHVmRxK2lLTERkVXVCKzhOQ0JlZXZR?=
 =?utf-8?B?QktqN2JSbW52RW14dUJhTk5wL1pVNm41dTM5RTNBcjFlNFRnQzBxYWFYbUFy?=
 =?utf-8?B?c1l2SEt6ZlRXQVRMYUtzWmVYNU9hZ3RUcUt2bXBLaUtmM0w1blJ4UmYycWtR?=
 =?utf-8?B?S1p2cnFZRjBJVVdDUUFkMXZRZkhLTE54RVN5T2p3V2VwYVpZR3ViMk9yUVZp?=
 =?utf-8?B?Rm4zaEsvWlUrc3lvZ2JBdEFyUWNVd1doT0NhY2xLbHFkT2ZKb0xLV2RvYWZu?=
 =?utf-8?B?Uk0rWldTWDVIeU81bUJrMC9EamNJek9vM05vd0FtTFNsWElvNlBHVVpjR3JS?=
 =?utf-8?B?bUxhQTBGdURkeEhtZ3lDOGxQU3VKUVI2YXNmZFFWQTVBUFRVT29Vc1E1VzVG?=
 =?utf-8?B?ZWhndms2MEpWdjI5c05TcjlaSlB5V05yZXdrMHEvVDdPQjVqQ0lZNVB6UHVi?=
 =?utf-8?B?Y1NxcnlzMHdMVlRxZlZpVmtTTHZMeFE5MmxOQXJwWTBVS1JtdmFXTlNyeEpM?=
 =?utf-8?B?dHVsVWNjVHBlZ2U1VU9kN3hZZ3ZNcjcxbEhGVUJmZFZEMWNrVEVXM3ZLTDFm?=
 =?utf-8?B?RFBaRGpxR1dPOXFONDBTeEcyMy9jeFByUzllbUs5RDdNTEdjQVJjZUpUKzZV?=
 =?utf-8?B?Rm5tczlIVW9sdncwU0NYd05malcyRFlUcEVLdHU4Q0ZOeHFGYkVQTTRZTkda?=
 =?utf-8?B?TUthc0xrdUQzZm5KemxEYVZlRHNla0FXQlNrVzJmT2FWdlBHR3F0eDVPMmF3?=
 =?utf-8?B?ZHVOdTc1N2w0OTZFY0I5cG1LVzVad1FGNG9lMlA5cTQ1QTRUS1hBU3Y0aGh0?=
 =?utf-8?B?UWgzcnQreUdHaXhsOFlNcmsyT0F0RDg5dFBvVC9aOXdRcUFtaERycXdZbkhC?=
 =?utf-8?B?TEZGVUhQZExzTHk5Mi9oRDJ2QmRQR21rUWRHRGd3M3A1UERRV1IxeXFvZExj?=
 =?utf-8?B?bE1iWnMxQUtGRWJTUW9nakRHYTNOM1pGN2dQSVkxZGtkejQ0R2tlQnNLNHUz?=
 =?utf-8?B?SjNzK1NtaEpCZ1NSa1g1T1dQWWhLUkVRRlJhUGEwTEhsTHlHN2k1N2czVjd2?=
 =?utf-8?B?SUhSQzVHbE5iaU55UXFrSWtLY1NvSjE2Q1B2TmhveXJXdEo1NDczY0dDVHlr?=
 =?utf-8?B?VG84NUc0NGNwUDJhVUZuaVZYUUdnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bde20f3e-d49a-40ab-99ef-08de204bd46d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 11:25:19.4231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56IWAxD13BPn0EvAJ8FCjoIaPQCWkr5s9gP3h1pPbjIGa9vFyAZehPByGFxoiJbXggwMjBInvT7sAZ+o77z+Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8799



On 10/11/2025 08:05, Kartik Rajput wrote:
> From: Akhil R <akhilrajeev@nvidia.com>
> 
> Add support for HS (High Speed) mode transfers, which is supported by
> Tegra194 onwards. Also adjust the bus frequency such that it uses the
> fast plus mode when HS mode is not supported.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v9 -> v10:
> 	* Change switch block to an if-else block.
> v5 -> v9:
>          * In the switch block, handle the case when hs mode is not
>            supported. Also update it to use Fast mode for master code
>            byte as per the I2C spec for HS mode.
> v3 -> v5:
>          * Set has_hs_mode_support to false for unsupported SoCs.
> v2 -> v3:
>          * Document tlow_hs_mode and thigh_hs_mode.
> v1 -> v2:
>          * Document has_hs_mode_support.
>          * Add a check to set the frequency to fastmode+ if the device
>            does not support HS mode but the requested frequency is more
>            than fastmode+.
> ---
>   drivers/i2c/busses/i2c-tegra.c | 65 ++++++++++++++++++++++++++--------
>   1 file changed, 51 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index bd26b232ffb3..2038ab2d8095 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -91,6 +91,7 @@
>   #define I2C_HEADER_IE_ENABLE			BIT(17)
>   #define I2C_HEADER_REPEAT_START			BIT(16)
>   #define I2C_HEADER_CONTINUE_XFER		BIT(15)
> +#define I2C_HEADER_HS_MODE			BIT(22)
>   #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
>   
>   #define I2C_BUS_CLEAR_CNFG			0x084
> @@ -198,6 +199,8 @@ enum msg_end_type {
>    * @thigh_std_mode: High period of the clock in standard mode.
>    * @tlow_fast_fastplus_mode: Low period of the clock in fast/fast-plus modes.
>    * @thigh_fast_fastplus_mode: High period of the clock in fast/fast-plus modes.
> + * @tlow_hs_mode: Low period of the clock in HS mode.
> + * @thigh_hs_mode: High period of the clock in HS mode.
>    * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
>    *		in standard mode.
>    * @setup_hold_time_fast_fast_plus_mode: Setup and hold time for start and stop
> @@ -206,6 +209,7 @@ enum msg_end_type {
>    *		in HS mode.
>    * @has_interface_timing_reg: Has interface timing register to program the tuned
>    *		timing settings.
> + * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
>    */
>   struct tegra_i2c_hw_feature {
>   	bool has_continue_xfer_support;
> @@ -226,10 +230,13 @@ struct tegra_i2c_hw_feature {
>   	u32 thigh_std_mode;
>   	u32 tlow_fast_fastplus_mode;
>   	u32 thigh_fast_fastplus_mode;
> +	u32 tlow_hs_mode;
> +	u32 thigh_hs_mode;
>   	u32 setup_hold_time_std_mode;
>   	u32 setup_hold_time_fast_fast_plus_mode;
>   	u32 setup_hold_time_hs_mode;
>   	bool has_interface_timing_reg;
> +	bool has_hs_mode_support;
>   };
>   
>   /**
> @@ -677,25 +684,31 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>   	if (IS_VI(i2c_dev))
>   		tegra_i2c_vi_init(i2c_dev);
>   
> -	switch (t->bus_freq_hz) {
> -	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
> -	default:
> +	if (t->bus_freq_hz < I2C_MAX_STANDARD_MODE_FREQ) {

Is this correct? Before we had ...

  case 0 ... I2C_MAX_STANDARD_MODE_FREQ:

So shouldn't this be ...

  if (t->bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {

> +		tlow = i2c_dev->hw->tlow_std_mode;
> +		thigh = i2c_dev->hw->thigh_std_mode;
> +		tsu_thd = i2c_dev->hw->setup_hold_time_std_mode;
> +		non_hs_mode = i2c_dev->hw->clk_divisor_std_mode;
> +	} else if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_PLUS_FREQ) {
>   		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
>   		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
>   		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
> -
> -		if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ)
> -			non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
> -		else
> +		non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;

Do we need this else-if? It appears that tlow, thigh and tsu_thd are the 
same between the else-if and else? Therefore, why not just have an else 
and then handle 'non_hs_mode' accordingly?

> +	} else {
> +		/*
> +		 * When HS mode is supported, the non-hs timing registers will be used for the
> +		 * master code byte for transition to HS mode. As per the spec, the 8 bit master
> +		 * code should be sent at max 400kHz. Therefore, limit the bus speed to fast mode.
> +		 * Whereas when HS mode is not supported, allow the highest speed mode capable.
> +		 */
> +		if (i2c_dev->hw->has_hs_mode_support)
>   			non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
> -		break;
> +		else
> +			non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
>   
> -	case 0 ... I2C_MAX_STANDARD_MODE_FREQ:
> -		tlow = i2c_dev->hw->tlow_std_mode;
> -		thigh = i2c_dev->hw->thigh_std_mode;
> -		tsu_thd = i2c_dev->hw->setup_hold_time_std_mode;
> -		non_hs_mode = i2c_dev->hw->clk_divisor_std_mode;
> -		break;
> +		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
> +		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
> +		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
>   	}

Jon

-- 
nvpublic


