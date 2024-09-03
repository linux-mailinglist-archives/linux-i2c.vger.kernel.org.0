Return-Path: <linux-i2c+bounces-6058-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAA496A76C
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 21:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7993E1C235BB
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 19:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13D618C33F;
	Tue,  3 Sep 2024 19:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vM83F4yM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A671D7E3C
	for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2024 19:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725392190; cv=fail; b=rsEZs8UTtAzVP9PltD0ZEm4nBWXPke2pcQHXS+IhunU/O+4QGfG5nQz1cKywtAsYz+6EL3NXBZ9CCLOplh8K3KVT7ExZ13XVitePbdsNCmSso2vTJp7YS4D2PRHcD+p850e/UcHTT8ylaepz3MdG3YNpAB35L3GqOosqHAeBNvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725392190; c=relaxed/simple;
	bh=P5e6umqUhsNCwv3j8dCVroQv7Yrv5vdvSkiDN1KvfgU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Crm4FnZclFTI7IoWOQ6qBi29/b16qwvLSVK1gY9wdlTdzM32ZPpFGlEHmmR2c34MkY/hllIE1TgNlCja3lJI8ZYmN252QXer0C+WfTOnIbOSMYOcx18vWCyWGNdLqRrrcyrEFe056L11YSGQkiNJP7MsETM2R4JE2oPjObv/y1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vM83F4yM; arc=fail smtp.client-ip=40.107.243.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lhca7oKqI5FoItrStnPDoT5JOY2Ms0I/L6J3ORWBGTn6DZxzisgofMCYtXv93QnnX8SUHFG36KB2OJ5FAmet1Yk/DoL0WMEPUuEK2P8vL6vJ+O9Z4RHfJbSr8n7vxF0vHUt7IFbswaUj5/T5NKQZ/8S86Bx9CST8szbuMN5y20bGMRcfzGeopbCAU2zfqeowRnmPLd2goMhcWI5wYYkzmZ/DrgYepvlyleBDXwqf2Zz+//zVG0QboRdHoks/8RXT/vWUo5ZJu9rhYeeGral0Jakd4b84J2j1XAOiHLFOGNki4dZPAwiTtgKZ+HUtXlTUNPPdK9cggeN7YVSAA153FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5O3j8mbbx2ePLip09db/C/MXgIwEL9fYYpzocieQAt8=;
 b=KHaVAh+e/DfqGhd2STg3ZgyciPRuHoMqy4eRx1w3Fxfue2KPhwysvuiUQF8GqOsLvwFw9IbEYWQwCL+D83KtzUxDjGbVctrBpIopXZccaHLyML8AKxPCxPh0EC5nZqeOo65GBjj1soNu8fTPzcnrmv/gQqD2C2funa0lq4bZCOqY9aCFcvQxOVtBH69qgpUW0BQCp4QF6wabFQEwGnsT9HRleQXn09A2y3jihDL+MmxZmHNB6he2cTCOaEkkCWEi86YpkUQ+ZNtgDmPhJndyxTEtPPqXUb3AcmaifYg6gWPHX/3D0nM6maZERhE4beetdD4Jw695XE0vvlCtvEVA6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5O3j8mbbx2ePLip09db/C/MXgIwEL9fYYpzocieQAt8=;
 b=vM83F4yMC9o/AlDw26hlizO7N14lJgOLRNvIDu2+Vt/j724k7BCbQRRzbloCoAiPFpe/UnQZ/18i7lSxNnJvEmRzthO1PYt5DFDoDLk/j0vDVmVuQ7/aFsU8am8orQErKnXgzJcS5O2SQArCDOxH0cvoMg3FKVT+DU+9kkDExAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN2PR12MB4240.namprd12.prod.outlook.com (2603:10b6:208:1d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Tue, 3 Sep
 2024 19:36:24 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 19:36:24 +0000
Message-ID: <34a01d4c-cf05-45e4-924c-e2453ff5f6a3@amd.com>
Date: Wed, 4 Sep 2024 01:06:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com
References: <20240822142200.686842-1-Shyam-sundar.S-k@amd.com>
 <20240822142200.686842-4-Shyam-sundar.S-k@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20240822142200.686842-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0235.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::13) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MN2PR12MB4240:EE_
X-MS-Office365-Filtering-Correlation-Id: 1587d65f-7a88-4da9-0745-08dccc4fb1a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnNQSkdjTTZ0L0VOOEpDK2IyNytDZk1FQWplRkFSZGhFeDVISHJBVnJrcFFZ?=
 =?utf-8?B?aGtoeFBDR3dTRUlHWnZocUJhTk8zMXEyS1VXWlNWRGdyQVg0QmF6dUxOV3RD?=
 =?utf-8?B?Z1lOYk9MSUs1QmU4SEM5bUt2a0hBdzVJUTlMaVB0NFlibE1NQUszYnZ5NGlM?=
 =?utf-8?B?SkZDUWhHVVU4MjZTaXU1cFg4YXZqSWRHWkVCQ01YcytXb3pTVDZYMHdIaFVa?=
 =?utf-8?B?TkFTRzFCbXhGaFJSSi9NVzBMU1ZMMCtvSHRIcHJlTjFnV25wZUFiU2hjcmIx?=
 =?utf-8?B?R0RKS2JuaGdjWm1aNTB3b0hGaHhTSkcyclFtc3ZHMDdaaWZnMDRFM1pCTTlG?=
 =?utf-8?B?NllZOVlSdlNLNTcxMkQyeDI1b2lIR2RiU2I5d1JPay8vSW95L2gvQU40Ym91?=
 =?utf-8?B?b2gwS0VJd0k0V1pwVDZkbGY4bmpPU2JYV0R2d3lZVTBQd2ZjYWVrand6MVJy?=
 =?utf-8?B?SktNcVR3M0g5dy8xOWRmcmxzeWxlYW03dDFTMWRyREN0d01rMmMyZjR5RjZu?=
 =?utf-8?B?d29XK2gvbEFGNmErMDZKa0ROWG5IcG94ZDFsY3pFZ3d6RmxUMGlUN2U2WWZl?=
 =?utf-8?B?MlcwZEhpVGR3UjRkU0JUS2lZUWtzL1IveXFldG54cVZMTFdtOXd5NVFOaEJN?=
 =?utf-8?B?Y2ttK1AvMFY1YjRFSzZtYXBxbXhBUTRkMVJiWngzT2hudzlMckVtaHJDWEx2?=
 =?utf-8?B?RVMvM1NESXhCbkZjWE5ud2p4K08xc2JpTStyOFNzcHcrelBUYVZKUnZMRzA5?=
 =?utf-8?B?OTdDNUI4bG1wUUJqY1BuaE1oaS9pUWZSY3NNY3VpRVQyb3NuWXhBcXY2OGpW?=
 =?utf-8?B?azErZm4xRlI0RjZqQjErYW9PQ1hIRnRQZ1V4YmRJaUx0Sncwek42VVZFcWZ3?=
 =?utf-8?B?bC9zZ1VNUk9sSk8wNWc2MUlQNDFycjBSdWhaUHpGSW5DdHV5RFkyUmdkODMz?=
 =?utf-8?B?ZTZJNDVHcGJITWh4RVUxYk9lc2VWUXMrT2NUN21JOWc3WkNjd1pMK0NSbDli?=
 =?utf-8?B?RnRZNGo0cnRnbHY4TTNwOTV1S0x3NkdTa3V0eWpDVjBaUVVkMjJPSmgrRk5y?=
 =?utf-8?B?dmdQVUcyT0JCUi9CVUhJMDhpb1dPZ1pDSC9wd0R6SG9PbDJxU2haazkzTGVi?=
 =?utf-8?B?ZlUvdTMxd3kveHNBRnUrdUZmQzB0OFgwNVprT1kwZ1VsbTA4cEgvZlFrVTUy?=
 =?utf-8?B?RXAyOERCbUhWOUVGQlF2NDNVOGNXMHNQa0VRakY2OXhhT0cwMVQ1d2VhcWVq?=
 =?utf-8?B?eWp4bGg3RTdUdFFudDBuaGt6eTJCSVJQNG96dnNPZTFyc0dpYVFZS05qNGpO?=
 =?utf-8?B?Tmx6eFZ5aGhIODZ1UTBGaExTN0ZXNmlxUlVsWnN1OUdHSFRUbUdxdy9XOUJx?=
 =?utf-8?B?M1RjZG1lN3ZYNnBMdTNHdCtaMWYrbjFCUi9qYmdZK2g3RmNXM2NUUlErbEpp?=
 =?utf-8?B?cWdpd1BEcWVlUk1JS3k4OG5ZbHZmVUpZS2RnRVRNRDlpU2dXcFZWWkhJTXFS?=
 =?utf-8?B?Sm92M3U4TTVUaFJNc1dRZE5OR29kUnJ4K25vOGlXMzR0dkxHQndtU293Nzlj?=
 =?utf-8?B?SkxwZ1kzYUdOVVFEQ0NtSDFvUk9HaE9xdURlQVY1dTg5OTJwMHQ5T093S21V?=
 =?utf-8?B?OGRFQkIxalhKT2tCVkovOEowUm1DTEVZQ1pKRDQvcElObEQxNXVTcVVYMHBN?=
 =?utf-8?B?QktnNTZLc1lKb2ZQWWhlcTMyaTduOFBjZ2l1Rm1zenpnNFhsRTBXTHFOS1Jm?=
 =?utf-8?B?M1RIakU4ZzFQNW1VbERxSmliNGZNVVVRSVgzRWptMk9CT1Q3ZTVKdkE4MnFR?=
 =?utf-8?B?cTI3dGFhUU5jaEtwU1RCQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGgwLzk1ZDh2NHJTRHBXbjZyaTZ1NXNJODVVN1h3WnRucTNkeElUTE5LWU8z?=
 =?utf-8?B?SGI5NG1DU0lyWE5sbDZpR3NMSWlYN2xXS1FITUo5YVBaWkluNVRxcVR4aHBY?=
 =?utf-8?B?ckJZcU9Oc0NxTlFYVEFvZTc5ZDVQd2c3dGJCUDkxZGpJTFIySld2ZHNobmFv?=
 =?utf-8?B?Z2QxeTJJNjd2RlJLWDZCdit3TXJyZEoxZzJzeDFJR0V1WG54MzgyOU5saGpY?=
 =?utf-8?B?UTA2aUtFVS8rUlEzL3VxZXdBVjZQQ0VNVThYNUd4TU84ck1nN1N4UE9IUDVx?=
 =?utf-8?B?RzdMZWpuNkR3K0puelRGV09QS3IrMUV5YU1ZMTJwcW5LV1lzemVWb3NSUGRQ?=
 =?utf-8?B?c2dlRDVzMUxVSzRmQUs3Zm9YdVhqemZnWmVBdk1NSXVIYm5iZ0JFMWFMSDUz?=
 =?utf-8?B?Tnk2VHlBOXAyWFlmSEdMc0RqWmFOSEdnUkYxMW9uby9BRlhMeVRSRWVXTURa?=
 =?utf-8?B?NEFuZ1JtYkV5c3IxNCtlSkszUnNneWFnUENycVNkVVU5Y2NwSTFQQTl0TC92?=
 =?utf-8?B?aEV0eHluZVZqaVFxaGF4bktOdkhXZDhIMVdMaExQVzFaa3NYNHlzOTZNSUgw?=
 =?utf-8?B?M2hzTzJhTStqR0xGU010Rnl2QmdSNWx0aE5TTFcrc0toQ3FJdWVwVDd5cXB1?=
 =?utf-8?B?R0txV0prWEF2UlgyNlFqdzJ5bUxRVUk1anBFRVdGeElsam1rby94T1hnT3ll?=
 =?utf-8?B?VENqdGdhbkwxemhCQzMyUEFpUndjdGtpSXh2THhIbzZUblR0Z0E0M3czNnh3?=
 =?utf-8?B?K1FaVjBXR0FWYXZTOFVDT0xtVXVsT09QKzFEV1NuY1NVVXVNVERFNEhGeDlV?=
 =?utf-8?B?VEJLKzVPZDhqb0thQnE0eVRkMkRoNUxFYThBc3hITklMTTNaT2J5anVLNFYv?=
 =?utf-8?B?ZUpqMkFTdjRSbmE1WHhYN3V5L2VNYmFSTFZMSVFZTnViT05yUjBnV0taU0hl?=
 =?utf-8?B?cndvUytZQTRGQWxWcDZ3SFpSbnZVckVUcjMranpxM0NFaXVNRyt2aGZIYmVD?=
 =?utf-8?B?OG9qd2FGV3Q2NEV0eEpQWWhNQVU5cUhIVUxxOFlqbFhIYU0xNHpQblFJWmNh?=
 =?utf-8?B?U3BuRWJZRVQwS2IzR2FtVml0TEVGRTMyU05HL3ZRMXFWazlsWE5IVXFSVW5K?=
 =?utf-8?B?elBsV3k0Y2JrTWYzWEVEaDl0WEJhanYrT0Y3b1k4NDhqZG9JVG5OOEFaMFRC?=
 =?utf-8?B?K0J6bUUvNWtiY2x0YUcxZWswTFZnUjhaYjN0YmtXem9RRnRVaDlYY0U5UUxz?=
 =?utf-8?B?dmFLTTlTeGxCOGxySGZwQkQ5REZGdkFUemp0Ym95d25XNmxaY0w3NTAzU2VK?=
 =?utf-8?B?Y2QrWnlSSVpJdTlKTktkcDBmWlpoclBBTjVuS09ScVJCSHJaVjVrcU55S2hZ?=
 =?utf-8?B?OGJsYmpSK05nNlNsdzh6TUx0S0xBb01CSG01cFZITnBEc0VqcjNxUzlZMktx?=
 =?utf-8?B?OWN4V2F2SE0wZ0lGV2tqSEUreGk0VUw3cEkyUVR6SFVONDNEQUFrbzZzbllv?=
 =?utf-8?B?TmpXcCszOVlEZUZITm9pQWNXMVdaUEEwNC9sUjRBdVY5UjE4NmcraG9HZWg5?=
 =?utf-8?B?cVRuakl3bHcrd2tmdld3WWVaSnZwa1FkOTc5dEZsTjJJeWFuajJCbFUwVlVF?=
 =?utf-8?B?ZjlrMTloWjRvUXRZOFN1eDFhZVFtZVJIVnVuQng5R2NHZ1hwNkk1ZTBwZVZJ?=
 =?utf-8?B?UDNIQzVwRFd1S0NZVm9taXRqd2VKQkdTNnJWUlJERUVsdEtVbCt6OGFOajF1?=
 =?utf-8?B?bmltNzBCRGd3TzhSOHhudW9paU9xMENWNFdKbmRJdjVVMEJSZk9ScXJRZTlT?=
 =?utf-8?B?dDRYSmVjUFUyZkFrSFJpZmlUOTJ2YnpqQVdiSmNIZVl3b29lZ3BpSGRTM0cz?=
 =?utf-8?B?MkRCWG1ob2VnL1lzaUdUM0oxdVRCYXpBTjVSaUdzdGYyTVlFK0Z1YlRpRFh1?=
 =?utf-8?B?ZUtoaEhYVHp0WUtybDcyV2lTM2RleXdCb0xxL0VWa3pjckEzSXhPVnMrTTZI?=
 =?utf-8?B?SU85ZEx3cDRJWTQ5L2RkWUlremxPWFlqMFJuMG5SamNMZE1mUEZQd09YYTZV?=
 =?utf-8?B?bWhOUHhWazRIdUVtcTR0OG5ibE1yMUhkbVc2UDBNRkdmMDltT25GLzU1MTJG?=
 =?utf-8?Q?EMCneJg2mx46Nd6DMLrP9PMeT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1587d65f-7a88-4da9-0745-08dccc4fb1a0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 19:36:23.9627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ybsTdayIFmXPf6FJ9F9qlog9t3CKXk0ZexDR0L51U0rw8oH5D0BP4vOBQieDbJWhL60Y2Bhr1Jw8zkeNaLtAoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4240

+Andy (this has some ACPI handling that adds AMD ASF support to the
existing piix4 driver for SMBus)

On 8/22/2024 19:51, Shyam Sundar S K wrote:
> The AMD ASF controller is presented to the operating system as an ACPI
> device. The piix4 driver can obtain the ASF handle through ACPI to
> retrieve information about the ASF controller's attributes, such as the
> ASF address space and interrupt number, and to handle ASF interrupts.
> 
> Currently, the piix4 driver assumes that a specific port address is
> designated for AUX operations. However, with the introduction of ASF, the
> same port address may also be used by the ASF controller. Therefore, a
> check needs to be added to ensure that if ASF is advertised and enabled in
> ACPI, the AUX port is not set up.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/i2c/busses/i2c-piix4.c | 161 ++++++++++++++++++++++++++++++++-
>  1 file changed, 160 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index a44b53dd4dd7..00fc641e6277 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -121,6 +121,8 @@
>  #define SB800_PIIX4_FCH_PM_ADDR			0xFED80300
>  #define SB800_PIIX4_FCH_PM_SIZE			8
>  #define SB800_ASF_BLOCK_MAX_BYTES		72
> +#define SB800_ASF_ERROR_STATUS			0xE
> +#define SB800_ASF_ACPI_PATH			"\\_SB.ASFC"
>  
>  /* insmod parameters */
>  
> @@ -185,6 +187,11 @@ struct sb800_mmio_cfg {
>  	bool use_mmio;
>  };
>  
> +struct sb800_asf_data {
> +	unsigned short addr;
> +	int irq;
> +};
> +
>  enum piix4_algo {
>  	SMBUS_SB800,
>  	SMBUS_LEGACY,
> @@ -201,6 +208,8 @@ struct i2c_piix4_adapdata {
>  	struct sb800_mmio_cfg mmio_cfg;
>  	u8 algo_select;
>  	struct i2c_client *slave;
> +	bool is_asf;
> +	struct delayed_work work_buf;
>  };
>  
>  static int piix4_sb800_region_request(struct device *dev,
> @@ -909,6 +918,66 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
>  	return retval;
>  }
>  
> +static void sb800_asf_process_slave(struct work_struct *work)
> +{
> +	struct i2c_piix4_adapdata *adapdata = container_of(work, struct i2c_piix4_adapdata,
> +							   work_buf.work);
> +	unsigned short piix4_smba = adapdata->smba;
> +	u8 data[SB800_ASF_BLOCK_MAX_BYTES];
> +	u8 bank, reg, cmd;
> +	u8 len, val = 0;
> +	int i;
> +
> +	/* Read slave status register */
> +	reg = inb_p(ASFSLVSTA);
> +
> +	/* Check if no error bits are set in slave status register */
> +	if (!(reg & SB800_ASF_ERROR_STATUS)) {
> +		/* Read data bank */
> +		reg = inb_p(ASFDATABNKSEL);
> +		bank = (reg & BIT(3)) >> 3;
> +
> +		/* Set read data bank */
> +		if (bank) {
> +			reg = reg | BIT(4);
> +			reg = reg & (~BIT(3));
> +		} else {
> +			reg = reg & (~BIT(4));
> +			reg = reg & (~BIT(2));
> +		}
> +
> +		/* Read command register */
> +		outb_p(reg, ASFDATABNKSEL);
> +		cmd = inb_p(ASFINDEX);
> +		len = inb_p(ASFDATARWPTR);
> +		for (i = 0; i < len; i++)
> +			data[i] = inb_p(ASFINDEX);
> +
> +		/* Clear data bank status */
> +		if (bank) {
> +			reg = reg | BIT(3);
> +			outb_p(reg, ASFDATABNKSEL);
> +		} else {
> +			reg = reg | BIT(2);
> +			outb_p(reg, ASFDATABNKSEL);
> +		}
> +	} else {
> +		/* Set bank as full */
> +		reg = reg | (BIT(3) | BIT(2));
> +		outb_p(reg, ASFDATABNKSEL);
> +	}
> +
> +	outb_p(0, ASFSETDATARDPTR);
> +	if (!(cmd & BIT(0))) {
> +		i2c_slave_event(adapdata->slave, I2C_SLAVE_WRITE_REQUESTED, &val);
> +		for (i = 0; i < len; i++) {
> +			val = data[i];
> +			i2c_slave_event(adapdata->slave, I2C_SLAVE_WRITE_RECEIVED, &val);
> +		}
> +		i2c_slave_event(adapdata->slave, I2C_SLAVE_STOP, &val);
> +	}
> +}
> +
>  static void sb800_asf_update_bits(unsigned short piix4_smba, u8 bit, unsigned long offset, bool set)
>  {
>  	unsigned long reg;
> @@ -1195,6 +1264,86 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
>  	return 0;
>  }
>  
> +static irqreturn_t sb800_asf_irq_handler(int irq, void *ptr)
> +{
> +	struct i2c_piix4_adapdata *adapdata = (struct i2c_piix4_adapdata *)ptr;
> +	unsigned short piix4_smba = adapdata->smba;
> +	u8 slave_int = inb_p(ASFSTA);
> +
> +	if ((slave_int & BIT(6))) {
> +		/* Slave Interrupt */
> +		outb_p(slave_int | BIT(6), ASFSTA);
> +		schedule_delayed_work(&adapdata->work_buf, HZ);
> +	} else {
> +		/* Master Interrupt */
> +		sb800_asf_update_bits(piix4_smba, SB800_ASF_SLV_INTR, SMBHSTSTS, true);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static acpi_status sb800_asf_acpi_resource_cb(struct acpi_resource *resource, void *context)
> +{
> +	struct sb800_asf_data *data = context;
> +
> +	switch (resource->type) {
> +	case ACPI_RESOURCE_TYPE_EXTENDED_IRQ:
> +		data->irq = resource->data.extended_irq.interrupts[0];
> +		break;
> +	case ACPI_RESOURCE_TYPE_IO:
> +		data->addr = resource->data.io.minimum;
> +		break;
> +	}
> +
> +	return AE_OK;
> +}
> +
> +static int sb800_asf_add_adap(struct pci_dev *dev)
> +{
> +	struct i2c_piix4_adapdata *adapdata;
> +	struct sb800_asf_data *data;
> +	acpi_status status;
> +	acpi_handle handle;
> +	int ret;
> +
> +	status = acpi_get_handle(NULL, SB800_ASF_ACPI_PATH, &handle);
> +	if (ACPI_FAILURE(status))
> +		return -ENODEV;
> +
> +	data = devm_kzalloc(&dev->dev, sizeof(struct sb800_asf_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	status = acpi_walk_resources(handle, METHOD_NAME__CRS, sb800_asf_acpi_resource_cb, data);
> +	if (ACPI_FAILURE(status))
> +		return -EINVAL;
> +
> +	if (!data->addr)
> +		return -EINVAL;
> +
> +	ret = piix4_add_adapter(dev, data->addr, SMBUS_ASF, piix4_adapter_count, false, 0,
> +				piix4_main_port_names_sb800[piix4_adapter_count],
> +				&piix4_main_adapters[piix4_adapter_count]);
> +	if (ret) {
> +		dev_err(&dev->dev, "Failed to add ASF adapter: %d\n", ret);
> +		return -ENODEV;
> +	}
> +
> +	adapdata = i2c_get_adapdata(piix4_main_adapters[piix4_adapter_count]);
> +	ret = devm_request_irq(&dev->dev, data->irq, sb800_asf_irq_handler, IRQF_SHARED,
> +			       "sb800_smbus_asf", adapdata);
> +	if (ret) {
> +		dev_err(&dev->dev, "Unable to request irq: %d for use\n", data->irq);
> +		return ret;
> +	}
> +
> +	INIT_DELAYED_WORK(&adapdata->work_buf, sb800_asf_process_slave);
> +	adapdata->is_asf = true;
> +	/* Increment the adapter count by 1 as ASF is added to the list */
> +	piix4_adapter_count += 1;
> +	return 1;
> +}
> +
>  static int piix4_add_adapters_sb800(struct pci_dev *dev, unsigned short smba,
>  				    bool notify_imc)
>  {
> @@ -1243,6 +1392,7 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  {
>  	int retval;
>  	bool is_sb800 = false;
> +	bool is_asf = false;
>  
>  	if ((dev->vendor == PCI_VENDOR_ID_ATI &&
>  	     dev->device == PCI_DEVICE_ID_ATI_SBX00_SMBUS &&
> @@ -1279,6 +1429,10 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  		retval = piix4_add_adapters_sb800(dev, retval, notify_imc);
>  		if (retval < 0)
>  			return retval;
> +
> +		/* Check if ASF is enabled in SB800 */
> +		if (sb800_asf_add_adap(dev))
> +			is_asf = true;
>  	} else {
>  		retval = piix4_setup(dev, id);
>  		if (retval < 0)
> @@ -1308,7 +1462,9 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	if (dev->vendor == PCI_VENDOR_ID_AMD &&
>  	    (dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS ||
>  	     dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS)) {
> -		retval = piix4_setup_sb800(dev, id, 1);
> +		/* Do not setup AUX port if ASF is enabled */
> +		if (!is_asf)
> +			retval = piix4_setup_sb800(dev, id, 1);
>  	}
>  
>  	if (retval > 0) {
> @@ -1326,6 +1482,9 @@ static void piix4_adap_remove(struct i2c_adapter *adap)
>  {
>  	struct i2c_piix4_adapdata *adapdata = i2c_get_adapdata(adap);
>  
> +	if (adapdata->is_asf)
> +		cancel_delayed_work_sync(&adapdata->work_buf);
> +
>  	if (adapdata->smba) {
>  		i2c_del_adapter(adap);
>  		if (adapdata->port == (0 << piix4_port_shift_sb800))

