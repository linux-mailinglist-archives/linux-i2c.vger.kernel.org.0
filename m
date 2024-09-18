Return-Path: <linux-i2c+bounces-6851-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B3997BAC6
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 12:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBF4AB210C4
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 10:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC09178377;
	Wed, 18 Sep 2024 10:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vVj7WAb+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2F115D5A1
	for <linux-i2c@vger.kernel.org>; Wed, 18 Sep 2024 10:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726655073; cv=fail; b=EXMZVu9loDQKsoHlAJadSGE9Fn6ZcoR9pfu8DP0+kvj0lMIP7d7iLXbgfVBhNbEOovFe8uYy9l5Gqe+NjRXTLANN/Xc0R7gR2nrHQYl5ocNKZjmVTTBnMtGh1Mm017yTYneRr9KBBuyYJvzUQS+yRpYdD927aT1yr5XN17u3hTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726655073; c=relaxed/simple;
	bh=XaLcETzbz34NM5HE12nWccIDPazBzsSibx3OX1aRJ3s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=elEyWVCx64LQ4V/C3nzp66EJsL/TKE5hnQ+ZBAAgqx3zuZhYgRlrCqNDuCIIRQToSECoYQpi2dRYWMbBncnCLPOFIe7ju3oqLhOQvPxUJSHQNpmXoMcr5J3IToYDnnWk8G1zaRVCJP/Qiahsi5Y36HEcF2miEYbNGclWeawuB+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vVj7WAb+; arc=fail smtp.client-ip=40.107.223.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSlPqgkOJR1f+h+aZrzkh7BOxvW6eotl6aU7G/4TUzXXkQBg1Of60mTP+R8/rTh/AamJCnVmVF+34xvrbxTro5lBjREOee5MbxG6n4MwIaP8gmLEFIP/Vq4+Z5CAT4v+Gdyo5gL+mIm6wdW93xShJjrM0rPP/lJSkaalmNPqXEK4kDt8T2VxzlyGW8wpYQ5bCooKAmVtScNL0dYMKp/f8AaV9XAN7Rq3k3N8omMKW8vhALTV3ArhIIYPSbeTHYZOzEAcbQzwf8xtX2e/8sn+IU39rSCVwMMix2FaqOQ0P4T1loPlIEQgFfv8QQnoaUHDtp6H7cOpycXzPZH3bwkHhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asrHQYfIHrRYqmv8Vr7+pCC9+kzgVGO6OxbRAlCz90g=;
 b=qrSU3BqcUL7j5hnXlh06VW9qGW04qW8N9NLS7q9AEjci69lzSlOtOwoYG2XG4iejYttwHN/uvwGFc10NTZhFoJZl/7RNcaaJI4VlhDma+uJhGrjJB4IMJLAWA/n2TZ0rmruV+aIcHhPvP4aFXzhMFPekrgBUGpX2mVuUwhm9+eKrTtigNLwEHNRhM57oh1+YVn7h2jNIeE1oq/WPzwlgWIDlSnZX+sRLoEexkNZ+slY6zkVUIKkHk0/bgQgKEt2zTp0w/5ClYVUEFhBrDxzn99m45gUTRQEF5QE7GBx1eFZCLKb82mR53Y7qVI/4Uor0K5mBqJCB5pVhYkrnBlvnTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asrHQYfIHrRYqmv8Vr7+pCC9+kzgVGO6OxbRAlCz90g=;
 b=vVj7WAb+pvpI1t4e+KUAU4vm13JhktCMOn8eCGP83XdHQf/YxI4bMyLbpN5yW81bHtYbepnYA8+SbqFgVKE+JMbgGh+PKNXsi61E1Msn1zOPo/iZv1+ifr2VIo664O50/wBJ9vGp5BGch7t/mRbJh03NAKWRSZ4VInc5U64oruw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA1PR12MB8857.namprd12.prod.outlook.com (2603:10b6:806:38d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 10:24:26 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.7982.012; Wed, 18 Sep 2024
 10:24:26 +0000
Message-ID: <81b1d7a7-3d3c-4566-b787-c5ff7465b38e@amd.com>
Date: Wed, 18 Sep 2024 15:54:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] i2c: amd-asf: Add i2c_algorithm operations to
 support AMD ASF with SMBus
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com, Patil.Reddy@amd.com
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-6-Shyam-sundar.S-k@amd.com>
 <ZuSNkuVMnISqMtD9@smile.fi.intel.com>
 <af4fbf35-e6cc-4a21-8fa1-0424357a373e@amd.com>
 <ZuqkTPj-QVgTm8y4@smile.fi.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ZuqkTPj-QVgTm8y4@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::14)
 To BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA1PR12MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b63523-e29f-4d17-852f-08dcd7cc1265
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWp5d2dBd3dPMXVQQ0k1dUJ4eTkzQm5KYWFvT3RTenNaMGowQVZLUm8xNTVO?=
 =?utf-8?B?OURZc1ZvelY1MFlUNkMzQkNvaEJ4eHk3VTVGL0VaWmpsNWY2R09GWkpDdGlR?=
 =?utf-8?B?VTl4QjdvM3A2NStMdm5FcDJiemRDL1h3Zkc3dlNnMi9sdllueStTZy9VZlNl?=
 =?utf-8?B?QnVBYmdXNTFLUm9FSnlWazh4QmthSmlmTldFUVV1R3REeEZwb3NwbEF0S1Rw?=
 =?utf-8?B?VDBNNmpMeitzOGs3VDVHbDRyY3AvdS8zSG5uUEd0RGxOeFlaYnZRWFNvTWtB?=
 =?utf-8?B?amtQRlV4RjE4MnZLeHJzdG5veGFwL0V4TXJtUTF4WUEyTjNkdTJMQlZBOVBR?=
 =?utf-8?B?ZmJyVndoSHN4ZXh2SVN0d1FBb2toMmtaUXRtUU1kNjExQ2JXZFR5aFROL0x0?=
 =?utf-8?B?RjRFY0YxYlhMZklJaytXVFEwOGVJUEZBVDdYR1JiL3FiU2UyS01oSmZ0Uzc3?=
 =?utf-8?B?Qnk2eW9vejUwa2lkbVNSRUNQUCtrZkw4Y1JSRGNhWS8vd200OGlwYW5OaUI1?=
 =?utf-8?B?bVlRSlQxN2xsVVJEZVRmV0VIV3lJVE1SU1FaaEJrSWM1OXBYUThnRi9tYjB1?=
 =?utf-8?B?UFJITUJ6ZW8yVFBrVFoxUStiZUxhdTZ2c2IxRHJ2eHM4NFhuNkQ1eXJUcTUr?=
 =?utf-8?B?Y29XUHA2aWFML1JpbnR0UE9aY3djTDJuRHJWd05US0x0SjdHM2pndG5pR3B5?=
 =?utf-8?B?cmp2WkxqTzZ6OHBpZjNEeE9ER3R2RTFrVDNQdDJGYlVsR0JEUFJURE1BVnJt?=
 =?utf-8?B?bmdBL3dKZlpKVUEyZFBvc0EzVVB2ZTBPYUVzQUt2SXdZSXVmOU9mNWFNVld2?=
 =?utf-8?B?K21rYjQzTnREN25YUHZSUk5aQnNOQWhSRmpzQjNidjFROGhrbG90MVp3Rm1K?=
 =?utf-8?B?UklCRTFEQ0RSdG1qVTBVRHpkcHFnQjRvKzYwMGZXZkt4SlA3QUp1QnNDeTBL?=
 =?utf-8?B?aTYrYm9LRGM3ZXF2QnlGYjhtWG5pVXBwdktwMEE2MWw3eWhoQzNsalNHY24z?=
 =?utf-8?B?OXdQdm1Jb1VDWDRKR3hFdkROSE50ZnZKS3FWaVVlbGN6SXRjdVlmNko2UXRq?=
 =?utf-8?B?SnFnUDladk11NC9pV2tLQTBmSlcvMHNNSU1uSXlYZTJweVVMRnVkL2ZKT09U?=
 =?utf-8?B?L0JVNnVtc0h0dXhMZGE2REhuaFZ2WlYzZ2N4R2ZqbEtUTG5abXFrcm5vQTN5?=
 =?utf-8?B?TVF0Q0JMTTcxQUtQYXRyM0YxalNLTXY1dUtmOU5uTWNWbjVWSENKQ0RhRjAv?=
 =?utf-8?B?cG0yMkJ5SjAwTEtkcGxIaXQvOGpqc2FTaDlldDVObi8xM0VNOFM2V28rb3ZM?=
 =?utf-8?B?c3Z6c2IvdkxHRlFyKy9PZUZrZEN1UWxXODBjdUxxdlpKZHh0dVdVM09xM3Fp?=
 =?utf-8?B?ZUJJZnRBbHhJaGVZcFVqYXYrZXd1enA2S0hEK0d6NkZIanpRWVd1NHliaWRw?=
 =?utf-8?B?a0dGT3NmZVhqbnZiSFJFeENXelBwYU8zN2ZHdzUzcmNBeXlsWXdnbVVhNWRF?=
 =?utf-8?B?MCthRDFVdjRYbzlyakEvR1lBMXNwNERiOHlnUTV3MDhnUERRWVlyZW1MTERX?=
 =?utf-8?B?WFdlNEJhcHJSYXhFQjgyZ0ZQOEYydm9TRmYwMnhBM3hZT2daZU5BQVhVYUVk?=
 =?utf-8?B?enlPbElrWkxNS2d5bGpxWkN2aTlIWHd2dEI4TmNnc0hGdUI2VERCL3djeC9a?=
 =?utf-8?B?YkZ4TzJCSWxlNUQxK2FnTDl2VlBRZURoS1dqRVhGZUtVY0JZcFZwcVB1MW1h?=
 =?utf-8?B?c0xuTmQrYjNKYnRHcTR5N28vY3NWOUFHcHlFU3EwUjkvbUc5SG80SDFBV1hB?=
 =?utf-8?B?ZUhQbVlxem5pYnQ4dDNqZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHhCMmhHNkZsVkdocFBXV2pmOHZzdFM4dDNaR3pueFByZ3FtakV3Z1B6d1Fz?=
 =?utf-8?B?V3lIaTc4anlURW8rczlISEZYeStHbVUvT3l5NEdmYUVucVk4bmE1cElCSVBV?=
 =?utf-8?B?WDloSkNleWtIN3ZJTlRXdC9ObUw3S1R0ZWpmdTFEcDRxME0wN1UzR3BlOHpv?=
 =?utf-8?B?N0grWHZrNzdxYkFiWUl2dUdTQWlpUFRuanFqLzJBUmZVK3lFeVFqSUpvQ2cr?=
 =?utf-8?B?d0J6dmxZUysrcTJkejRnQVFtRmEranpOdnlBUlVQbTNCR2ljZUhqNHBaOEhk?=
 =?utf-8?B?YzdEMkowRHQ0VGsyQTg2Y0Ryc1IwY2NHSHY0aWltSU94VnVsSEEySkVyRHhR?=
 =?utf-8?B?d0g2UGc5c3g0V0V5dGM2cW1KbzhUNDNIeGNrZGtjWmlXV0lQRUJlMWxVMXAy?=
 =?utf-8?B?eDVhYU9SOWROOXhsN0FaclBBR2dLQTU5QytKUWJURis0T1N3TWUwMHIzVVIw?=
 =?utf-8?B?T0w2dFczTWZRS2sramF6OGczaXVKUUFPQ0U5VnpKZnpTNHpLb09rblBHVVcr?=
 =?utf-8?B?QUl4ZWdnNmVjb1VLWXFwTCt6bVJ6SU90WkQ1T0g4ME82Z2I4eElzSnN0S3Jx?=
 =?utf-8?B?UzdvbEU0K1JGVlJGSnJvcml4RTZsUmhZbit2TzNvMkpHemZBcjFSSTN6OFkw?=
 =?utf-8?B?MWt6TVhQMGlTTGNVUFo2UmVGRGFKNm01MzIwb1VOOThCVHdXc2xnRFR2MENN?=
 =?utf-8?B?SFgyVi9LRDRpZzNpa1FOTlpMdGlBOS9xZEdsQ0JsMVRWTUxMeDVTZ3JxVEVw?=
 =?utf-8?B?ZkY5MGtFaHIzTWZndGVDbWtlRGFjUVpXSDZrdVR1LzlHNHdja3ZiLzRrdm9y?=
 =?utf-8?B?SWdHREVLOHYrZTBMUDR0RDVkbE5HS3JsVnJTSnExbjlJeEtacC9PVm1DN0VS?=
 =?utf-8?B?UWpEdTZTdmZYTDQxcGNPMm1iV0M0dlV3Uk90UERsNTdkc1c1bWF4ODN5eVpr?=
 =?utf-8?B?ckdVb1BOOXdvVGIrR3hzQkhvYWFIa0Z6Qm9zNGZBYnFsTW9EaTduSUU3ZFN5?=
 =?utf-8?B?QVphT1I4MVliY0k1cDhacy9CNVU2ZlNPNzlXMklXOFEvYXhzWTlnQUdVdndk?=
 =?utf-8?B?NkhwYTdEbERDVEVnbDNOYU5paVdVUzJoTnFLbk4zY0xoNUNSN3JWNjFuV1l0?=
 =?utf-8?B?b1lpNjYrV0VNSUpWOGkyeURGT2Q4RE5NeXN6UFRBeWJRdjZYbERDcStBNU16?=
 =?utf-8?B?cTVIeTY5R3NoQm9RYVdKeHFOUkZCaHk5SUR4YUhlMmY5cVhSTFBTM1E4K1hL?=
 =?utf-8?B?T1djMU1Od2lnWVp4NG4wVzB1ZWJQdFI2Y25RN0R3ZEI2WEJoMGJidEZQQ08r?=
 =?utf-8?B?aVNsejNqNXRxeDFmc2p3SVZxS3FoOVpuK3owZTZjUDNCa0R3cVgrNXV3aU5w?=
 =?utf-8?B?MDJ4OTRRYXRWdWtYaDhreGtvdm42dkpXR0NsNEd3Zlk0aTZCUTNHWmtjeEsv?=
 =?utf-8?B?TUxJR252R0ltZDhVdk81aytqYWtud1ZDVUhjUm5GU2ZpcUlabkJ2b2VVOUJS?=
 =?utf-8?B?UzJkUm5ZaUhsL3ptaEdZU3J6anJZVUJ0QkNFS2pybE9WbVdUdm8vcDBCbEhE?=
 =?utf-8?B?YUFFUElWbHRlZEJabWdtNG51d2FLQUVlM1dZMlBYUCs0OXlXcTRuOHFvTFdu?=
 =?utf-8?B?Z2FTeG42UnZEWHlwUDdNTng2Z0hpWEFoS0lwZ2ZVOU8rVEhneHZydTRFV0Z4?=
 =?utf-8?B?RFF6aHZreVlrZ3VkaFJYcEdQZDkyYWJZVFF3ekV1YVZMNDhMZDBkbzNoNDdG?=
 =?utf-8?B?SnpFU2FGT0RSd2d4RE1uWXZTbWNUMVVXaFQvanR6bmZ4VmVsM3FPbTJrUGpC?=
 =?utf-8?B?T3d3M2RQeTl6TjU5RS9qYnhFM00vOTVHZlhTaEhrdi8xaTlMamVYTzhrVGU4?=
 =?utf-8?B?UGp1NXAwckJWalBJTFM5NjJSRGVCbk9NZzRPMmd0d0lUdGYrbk5QTk54Q1Ri?=
 =?utf-8?B?a3lFY2ltV2pKTHU3NlppTzBLV0hITTZ4aHhERzVhM2xEeG8veDNwQVY3YVJ2?=
 =?utf-8?B?dEVBWHJaNlpZaTY2bnNTU3k3OHRTNDJhREc2WGt4aUl1N2Naam80QWNiaVln?=
 =?utf-8?B?SVZ0RG10aDBLb0lzZnB3ZFZDQ1dzRUoxMEtjN0VYTXE1TkFpVnNHUSs3aEVW?=
 =?utf-8?Q?NRZjmoN91URAq8fy6iOvN69QR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b63523-e29f-4d17-852f-08dcd7cc1265
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 10:24:26.2541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zagD+suBM+8tTsoBMeNx7fCQ0Wz2cibzvPpieu8SXEE0NzFqhUSVwVpdBogyTI8PXghV9N+dPrrrLZW6ONX0YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8857



On 9/18/2024 15:28, Andy Shevchenko wrote:
> On Tue, Sep 17, 2024 at 11:47:00PM +0530, Shyam Sundar S K wrote:
>> On 9/14/2024 00:38, Andy Shevchenko wrote:
>>> On Fri, Sep 13, 2024 at 05:41:07PM +0530, Shyam Sundar S K wrote:
> 
> ...
> 
>>>> +static void amd_asf_update_bytes(struct amd_asf_dev *dev, u8 bit, bool set)
>>>
>>> I didn't get the naming, the above using IO port with _bits, and this is MMIO
>>> with _bytes. Are you sure the naming schema is correct?
>>
>> Thinking to merge both the functions into one, something like this:
>>
>> enum io_type {
>>     IO_PORT,
>>     MMIO
>> };
>>
>> static void amd_asf_update_target(struct amd_asf_dev *dev, enum
>> io_type type, u8 bit, bool set)
>> {
>>
>> ...
>>
>> }
> 
> I'm not talking about merging them (and merged variant seems less readable
> to me), but about naming. I.o.w. it's not obvious what the difference _bits vs.
> _bytes.

Alright. I will stop merging them. I'll rename them as follows:


/* updates target using memory-mapped I/O */
amd_asf_update_mmio_target(...)

/* updates target using I/O port access */
amd_asf_update_ioport_target(...)

Thanks,
Shyam

> 
>>>> +{
>>>> +	unsigned long reg;
>>>> +
>>>> +	reg = ioread32(dev->mmio_cfg.addr);
>>>> +	if (set)
>>>> +		set_bit(bit, &reg);
>>>> +	else
>>>> +		clear_bit(bit, &reg);
>>>> +	iowrite32(reg, dev->mmio_cfg.addr);
>>>
>>> Ditto (bitops and related things).
>>>
>>>> +}
> 

