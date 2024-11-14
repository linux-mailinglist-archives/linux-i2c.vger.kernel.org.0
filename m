Return-Path: <linux-i2c+bounces-7986-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC979C86B2
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 11:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3420B28D6E
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 09:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03F81F9429;
	Thu, 14 Nov 2024 09:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Gxu7FUh5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192541F942E;
	Thu, 14 Nov 2024 09:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731578076; cv=fail; b=TwsYCbxLMY0Xy32UKomJ1xJDNb+CdPWZfNWgW8sa12VmrS2TgycVWUA6lPHwPo+x7zWivEzowRFPlRc0SAtkatPNwJ+tZXKoSb44jUF9BdF4by4CeHcBSrj1fEZjcaL/0fiIk/s4yMT9Q6qFAagFisFA4TVcpnor5WUQ2t0tcxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731578076; c=relaxed/simple;
	bh=jwn/giZ6stu/4BIloHYJATGNUwuN4YNv8tBM9Fb7EG8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VsdYmHs0IML/8OImAyqKamsje/k7xDyZP14e74+I1eWhxMzS74yHwB9E68FssSoVmBPz2xdaHORXLKs4qi6igxwPy/mi6K2KL5/wSK/D3Eb+pQS8ohxTaWNfYN0OFGVdH0e6aIyEH+uiw4BN81rttw75HdXOIe8LMBwScfxEJOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Gxu7FUh5; arc=fail smtp.client-ip=40.107.223.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAV1xloQh4dFUYXD1vWSXl2/cVnFqREarstpy91BEpaokD8IMjTotQizRCOX4TsLR8m3yZHeBd3F5sjU1shKJ5wU96WNUaQgPCRMyrynTzL2C9/8Jg+5lUSQuvKNn0tdmr3WVweZildI5Hdae39ZoqFJrx2RK9FhU1sPBvs0Hxm1Rvt5ulg5pB951c+2aDqW1m2J0MDFA1RJuU860KVFq+NqkyTf9dRTamQb2dtizqTEEgqEz2UpunNF66Qe19yp49cgVDQv5i9Bw9bUZUU//5XtyurlPXMOGuxntJyVJ2MYOVJxvNM4eUbnythTjfVRfJq0NsnKVhJ7jqlwpY5RPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tX1qDQnGnRQQrOdbKD1g3OiNBNHHaFH9qapO4HiGA0U=;
 b=sHAC3EE7tKb6/QGXOLcxEBcZWOALi0/5eI6wCRsDSmi7juNyTD8mkzk3DSeNFF3MHMsMRJQWtkWwKrUV4icNDbvGlof6EOOmuoJLn/t48R4nVUQv2dB+2ruImZbXXdKd5JlS8ZMKcpMZgTwZw8DX/eKRDJTwh5id4AxBVUnhyUBxXgNwN1oVELutyTS7dCV8PzVPDQIIsMc1J/GjXyYk/cNhTMrs4WLHUuAejotF8C41HvxbmuxtlNZc36Jah1gLhzH2AUUctUx8AM54HUVEqm4BwXy1gfb5B5QBLEc8psOjCJhePkVXS8GQZ/Sqp9vdFmY+jKqrCz3YJ8f7P11IHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tX1qDQnGnRQQrOdbKD1g3OiNBNHHaFH9qapO4HiGA0U=;
 b=Gxu7FUh5ngKA5S6tOThL3XE0RS0rlb+oYIpeNZwGtUbAWdOvQpi/Mv6VE6LjVU13SKgqJJ6myCjNgLGW8/BY97XnuvVsApLmZHNxtm4KNRHUk/O9H+i14kdE0ygcgEk75YLSNhEghbasOwLrJ1/Eq36XrFGmXT7MWzu3ENqQQRQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by PH7PR12MB8426.namprd12.prod.outlook.com (2603:10b6:510:241::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 09:54:29 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%6]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 09:54:29 +0000
Message-ID: <175b5086-302f-47d5-8ecd-f1ccbf7718d7@amd.com>
Date: Thu, 14 Nov 2024 10:54:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add atomic transfer support to i2c-xiic
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>, git@amd.com,
 andi.shyti@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com, srinivas.goud@amd.com,
 shubhrajyoti.datta@amd.com, manion05gk@gmail.com
References: <20241011104131.733736-1-manikanta.guntupalli@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20241011104131.733736-1-manikanta.guntupalli@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0216.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::37) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|PH7PR12MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 91664fef-e690-4686-69f0-08dd049254d1
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGFvVHI3QTdRM1NZZjRiS2xRdXZjSlRIOHN2VHNWYXhGTnphbkNGZW9yRmE5?=
 =?utf-8?B?dWxKS3VkbHBsaFkwMzVhS0JQalJKbXl6SUx5V3luei9TSExFYlQzMzZGdEVP?=
 =?utf-8?B?RitPU3NoQk5NTzZaanIrQmkxZ0N1L0R3RlVjV2RlZXRSUnN0djlCKzBEZ0xo?=
 =?utf-8?B?Znc3cjVTY1FacGNSNTdHT2VGYUw4UytKK0Fmc2V5a1E5Vk1kSXZ1WEtJS2hj?=
 =?utf-8?B?dGJYLzVDcktCZ3RyYVNnMVBaRWNyNWw0WnFSb3I0VGl5dHJnV3pWY3BXbTNq?=
 =?utf-8?B?Mk5ieUU1Yk43eWdBVnU0WjlpZHF0MDFGaDRwRWNUVjVDcEE3NHJnZVBYNWpy?=
 =?utf-8?B?VWtuTHVWb3BKcWlXK0F4RCsvWWxUUVI2Ri9MYTBHaExiRW1JTFN1UUY5amdw?=
 =?utf-8?B?c25vMjNIOWh4RXRoZ29GNjViOC9FTHZSOU80QW1ESVBQMG1IQmZ0TWRGamdT?=
 =?utf-8?B?K21yYUFxS1N1QUVUNnkvdDMwc01EL2pTUkJDeW1Sd0huZFVMZVFkR0FLK0Vh?=
 =?utf-8?B?c0VXelVhKzNCTzg5a1Qva1BtQ3ExZXJ2eHp5ai94cTk3Y2pZOHQrNGE0QkNU?=
 =?utf-8?B?am5pV2cyRjU1RnZnVng4eEpEVmJLSWZ3aEtoVjdOSFEyMWZQcllKY0JhRHdM?=
 =?utf-8?B?ZjJBeHB1MDM4Z3JyQlhKbkVZY3ZqZUlBU3JyaDNxc2Vld0c1a3ovV2hkUThw?=
 =?utf-8?B?dUcydWN6T3Zrc1ZBMkMrbWt3YmJNWDY5QWNqaWJBWW1MYUhyRG9PWWYyMzZ3?=
 =?utf-8?B?Wnl6NVN5R2ZuWmJ3WFZ4TXNtUjdsM0xqU2Iwd0ZPNkxhY0tvZDlVU0FrZk9p?=
 =?utf-8?B?dis1R2IvYUN5K0gzOUZPUlcvaUdWQUYvVzg1VGpFTzQ5UEJLNG8xWjc2aktC?=
 =?utf-8?B?ZHN4OUNzT2ZYY29QdXo2bVRJSjNyZ3ZOM0tTWkNjNjNsaUh4b0dTTDd5YUdj?=
 =?utf-8?B?MTBFSW84QXVHT3d1MzRjQ0twVEFPR1hvNWFYczZCdUo5WUs4M0lPOCt6STFT?=
 =?utf-8?B?b3dJUUd0MTFBNmVQaHI3VnN1YVFmYzkwRDY5blQ5YnR6SUcyK2NrUjNZOUhP?=
 =?utf-8?B?NlFhRkhYeWhpTkZDZXhFUWZ1VzdpNzhNUDYzZnhWaDNjaXIrWFV3YmtlcXJT?=
 =?utf-8?B?RGhqenFPakRJNFh0eG9VVlB6SjFITE1nb0pHNnJxbnNxN2J3Q29jRFNoSzJk?=
 =?utf-8?B?WGRGc3ZsOFNvMkw1YVZTUGxIcU5vdlljUUFUUXZaRTdwY3FScE5KekV0OE93?=
 =?utf-8?B?bm1vYlBNQnMrdTBoZ3VjS3BWaTBIc1Z2M0NmUWh5L2h5c0d6WU14ZkVhZDdz?=
 =?utf-8?B?dENXQmVwcjFrWkNTTm0vWWVEcTVjazlPdGVwajZEcDJkUkQxWWR6U0xCSTB2?=
 =?utf-8?B?enUrK0pqNmFEakw2MWxMQTdkN2lYMXRiUnRSMm5RblJDWlYwcVBJT0p1R3V0?=
 =?utf-8?B?R1BkMmhiVHE2OG04SEJmY0w1emlyRXVOcXViVzRrKzVBbFZveThIbTdzYVdT?=
 =?utf-8?B?UXRRbHVpMElmZjNOcFBhVXhxdFRKWHc2ZUc1Y0NOK0s3VU9vRyszakY2eGVW?=
 =?utf-8?B?QzhrSUxMUEYzTVYzd2piNm10MWoyZEk4UG81Vk0zWUkzUDN0Yy9nb01Wem9x?=
 =?utf-8?B?N1cvdWdWZFNKcUtjUkpaTGYzQ1RFTWQrMCswOEdSZUZQVmdIWGtLSDZhZWlD?=
 =?utf-8?B?NDdrWFpHSWZ1NkhpU3g2RHM5UGVOWjZEaS80VEovbUtoZ3dFdTBVS3hOcTNX?=
 =?utf-8?Q?Vz+x03rhwTY5I3auUJ6bil1nVi113jbabSWfo2J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjlJWlpUT0o1NmNFT01YVkM4TzN3ejhMa0gxd3ltR2hpRVN6QmdtbXRiVjl3?=
 =?utf-8?B?Y0QwamJsTjVHeDRWMmZjMW5qcFJRSUsxVU9oOUk1dnM2eE0xWkVDM3NWRWxm?=
 =?utf-8?B?UzhEU0RYQkd2TWdKd085Ym9MdGY4dlB3ZTd0WStscEs3UVY4a3JqVm5OU0ll?=
 =?utf-8?B?TzJHWTFCRHhLSllaU0IxVkticnNZMVY3TzVLOGZCeS9jZDk1eTNZbGtweGdD?=
 =?utf-8?B?bXZDMTJ1WXZaa0VNS29Md3Y5QkZYNFNqN0pTYXVlWmgwWld1anZjSGxSczhi?=
 =?utf-8?B?QkZTN2QwN0hNZDBoTlVGMCtYRDlCaXRCckhUd3R5UVJibzZYUGZWVFZ4aWNL?=
 =?utf-8?B?cE5lS3U0aEtIaWNkNkViSGMrbVJZc0g0WGhnMnZWY3VuTTRUWEpBRTl5b3Qx?=
 =?utf-8?B?eFlaWjI5Z29CekJ2cjdrSmlZZVFCK0JpUXJPRXhvWElhTjQ2RTdWcThCcDEy?=
 =?utf-8?B?Z3BhUVdaM0pMNVUzQks0QWp6Z2tNS0VxclBmMnhJRStEQ3VRb2hBeGhOY0Ni?=
 =?utf-8?B?eStSKzg4NHpKUnE5bHFmV015MUIzYjhnZUFlcFJNMythd1lvVEo0UVh2U1Aw?=
 =?utf-8?B?TzZIVnlqRTBBNWNRSDc3RHphQ2t0YUpaaDNwcVh0ZGduZTgxVXZXYThsdnpO?=
 =?utf-8?B?NHhZYmFqdDE2ZnRneHpUdzZRTEtZVHMxb2daSVlhb0ZON0VjSUV2YzhmSUsz?=
 =?utf-8?B?RUJZcGIyOS96bzNBOCtjNmxlSVF1YjNFenI1anNJSlo2S2RxZVQrYU9uUWtw?=
 =?utf-8?B?Zmx4TE54ZFdyem11dFdhbEl1eHY1eUZxM0FjSVlpRU9GQlhlMjBJakh5MGxT?=
 =?utf-8?B?M2pWbldpRHdOVGFhUFRIK29HUXY0MnprRzhVcGRWRWZLeUtDdnVVc0pmMXZr?=
 =?utf-8?B?SXhpeXRFdXU4UnIrUmxaTXVoWm9rczZVRmRkL1g0cXJIVkxxM2lwWURiZk9I?=
 =?utf-8?B?SGhvZzdoS3BneE12OGZaSG1KKzJRRTRpaFRsT1RZQU9PZFd3THVCb283UHZ0?=
 =?utf-8?B?citFRGgveDFodnFRK3h2MVlDK0Njc1JEdXhhMTVQZVZTMDlMZkxPWUkxNHAr?=
 =?utf-8?B?VVYvd3lVeTVuQmNxMHp1Z1JCdHMrVWpRWWc3MFBLL0hyVmhtSkhWQXJsT1g1?=
 =?utf-8?B?dk5VMWhYN0p2ODJrVTBoM2ZQS3BPRHlabkpJbi9oMFZER2hVT09sUWdrcEJj?=
 =?utf-8?B?ZlFTUFVINDVvQzdKaTAwNGR0OU54a0dCWkFyYlhWSjFPVUZJL2dKZk9jLzRC?=
 =?utf-8?B?aWRHNFl4YW5vaHNiN2dyU3h0bUxzTEtIVm5lL2hsOGZzQWlmR0xXa0RHK2tj?=
 =?utf-8?B?ZWw4NjB6dm1UL2JuTTJuUGxJK2lQcDlNbHpjSDZVV25wVi9YRU9GcEF2MDBa?=
 =?utf-8?B?Sk9YWS84UnlidEpCYzZwbXNYV21ZUWlZK1N2S3l1NlVSUUsybHBWY3MwTFlP?=
 =?utf-8?B?eXZUTy8zMm0zck9HcnJlVG9RRUl4RnB2NUg2VUQwbldESDg4bjNzN1JiTk0x?=
 =?utf-8?B?Znk1eGZzbWlQZkpLS2czaWpOOEg0UlE3aHVKb0lNcEZRWUtLdW01SEp2MjQy?=
 =?utf-8?B?ZWlzdjlTYWRVS29jRU15K2VYampIb3M4Zzl1M1E0ci9iSk9KejZHNzZDSk5Z?=
 =?utf-8?B?UUNEeHNtcU9mSzFhUjZFUlorak9BUU9YS0ZQZlhoWkw0blMxbzBOMFAzOWti?=
 =?utf-8?B?Ri9WZFlST2hDUlM2dUlQanJYZ3FJQ3p2SVUxT3UxWGxTcXQxVW9KUFZnTmZj?=
 =?utf-8?B?clBDV0hhVXBNL3dURnZGT1dHckF2aDZxWldsV2s2ZlhKWnFZa1FNVGtmZi9O?=
 =?utf-8?B?ejU0aE4zQ0lOb0s4MC9YTmtITFlRS0tpNmJ0d3I3SkZubi9YZkJYaHZFSTNm?=
 =?utf-8?B?RDhQMmxyVVZvL21UYjNUTmJGZkNoRFBWd1VtajlGYzg4b3lrL0NEUGNaUFM3?=
 =?utf-8?B?TGRsQXkzWDdmalFkNXdVTXRoSnd6cWhzL3QrdnBRM3RZbjZGVmIvZWRpMUVW?=
 =?utf-8?B?TkpYazZDSHd6UlU2ZVF1MndTYy9oYW5XYk82eHpJUWJmZG5kamdKejZtUFM4?=
 =?utf-8?B?M1ArNWQ0QmZSeHFVd29FQWRqYzY0N3FKcTY1eHFIRjhCYmZERmxybTl2bjNI?=
 =?utf-8?Q?SvhcFPVKK37O+rkatoKoMgx0X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91664fef-e690-4686-69f0-08dd049254d1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 09:54:29.4202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZTx/nUy4CTXJsY8MxoU0jwLV0tsuRP8lo89YF3Woj0insNlEZE8zVn3+rskhIDe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8426



On 10/11/24 12:41, Manikanta Guntupalli wrote:
> This patch series adds atomic transfer support to the i2c-xiic
> controller.
> 
> Manikanta Guntupalli (2):
>    i2c: xiic: Relocate xiic_i2c_runtime_suspend and
>      xiic_i2c_runtime_resume to facilitate atomic mode
>    i2c: xiic: Add atomic transfer support
> 
>   drivers/i2c/busses/i2c-xiic.c | 287 +++++++++++++++++++++++++++-------
>   1 file changed, 233 insertions(+), 54 deletions(-)
> 

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

