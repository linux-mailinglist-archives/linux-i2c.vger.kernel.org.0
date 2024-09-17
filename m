Return-Path: <linux-i2c+bounces-6834-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 815A697B406
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 20:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9062A1C21BEA
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 18:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9883175D5D;
	Tue, 17 Sep 2024 18:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="swgPftMg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDDA762E0
	for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2024 18:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726597038; cv=fail; b=qEC2zUkHf/72x/7xQ3IFWU51xuldfOsaRMT4p1y6nRQSSPUAycZHDepWztXqK5GWpMHjpqj555ZE5Bph88VzIEXb/JuVsFATt0IV8KmFhm6YL9qDDOwIcmxYM08sp7rCCqnMQ3UpOVTbzKbTP0hhLv1elsLgKDuYI9Q+Rw1DAck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726597038; c=relaxed/simple;
	bh=lPlXw9vw5sIyCSOx5jpGrpcQKDyk+47FOoLV06mA37Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O+abZOZyFCZ8RGM+NbgOW1NqBedVtvfarrqfouMOf0TWifF+KhFs5Z39SNHADg8I21EEtE0w30rejf7XrmPMeKYSR820Q/0RSMKb8QORUD/hJ9+GCFQ1ADe76B0qzkI8ksPj7/2BRfQ+6QCbzJxQaS3yo9nFZGfce1znXi1GQek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=swgPftMg; arc=fail smtp.client-ip=40.107.237.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOVmhvqE/mS2BNUeKGi88Q7lJ1HclZogZqNyJRDyrMZ4lELE4YmCh5iE6Wxvyw/2rB7wqenaBXdWZBnEwATX6bQBSueTT4E9o+EO9UXMlQmYcGfwOniAg43Z84nEikO57ZjzpvQNduXdz4tWFJwZLAwdwI48K1Xg0YKSxZ7NDSDFx6qj+ihK9OQBpE1u2unJCzyoKeznSx0Rx/l63niaIPjnpeBXWIToGmS38WToC5BiIi1Xv3QT/rbeF2H0LvUglk+WFhZhUr/1CeamJv97laOFniEhakIcQGrAvmJ417kyfoEQ2dKIh4HSKNHbSmPJRyQVbWpGdpqmsfXjCwXK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pi7rUFA+ypqh9+6JqrpRulkZ2uxItVAESGFzUcznrk=;
 b=lEXVbzLlv1FCK5NOSA+R2XGcqOlpw+lnyw4sWMbBlOuQU/ULAx6FrYOdcK9p91F3FboVqc9fryhA0Xoo47jZaLBn4zxp35V4ydjlPnwdMJmSTeCY6g+ZPoI4scLhao3QyxsLhKZV2Y3SF60utJU4CdbROXG5RX9JLRfoFk991fi3iNCrwR4RTL6Le85HoDV3OWnyt2qpi2HK0mGoAnpCKDp2GIju71a0biHc4MXbHg/mpNKGfaGaR7rrWJO9JT7Sgl3ym9dUABS2qAWfecr72sSfO2l16dnD2aTnU8k2rpS3DV5Yy6GKRTRumeecIE7PoMoLU7DYHqucAGYgMt3NNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pi7rUFA+ypqh9+6JqrpRulkZ2uxItVAESGFzUcznrk=;
 b=swgPftMgfHU0cpJhgnMKidO9n2iKRf54aybyrz0Sb5wigqgal6A8eoI51uoryRN9sNmVcuXVLhBP0DvLOHoUsDAd86XwT8jfJyGqrNfNLl0PgFm7UVbnbIfbCXMowgv1yt1LWJFJoO9TouFHrjnwcDU/tFka9OIMPkZSgk6uHbk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DS7PR12MB5814.namprd12.prod.outlook.com (2603:10b6:8:76::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.24; Tue, 17 Sep 2024 18:17:13 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 18:17:13 +0000
Message-ID: <af4fbf35-e6cc-4a21-8fa1-0424357a373e@amd.com>
Date: Tue, 17 Sep 2024 23:47:00 +0530
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
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ZuSNkuVMnISqMtD9@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::30) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DS7PR12MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 2707b8c0-22eb-4c39-8c8a-08dcd744f426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGQ1eWduYVdNUmFJU042Mlc1VW91bkpnZUZMejZyS0sxai85akVrVG5mcm4z?=
 =?utf-8?B?eG03MkNwbDBIMVBSWThtMThYcVp4MGI1TEcwb0g3cWVBeWxqRTc0WlZSSm1z?=
 =?utf-8?B?RlQrd2lxUzBJVmF6S3RJZ3VjbVAvQVlIZ010RHF0N1Z1cjFXM1lBL3hIL1c1?=
 =?utf-8?B?bXNPNHlRd2hBUTNTc1IxdmtqeW5vRVJzd1Nkbmh2aXJPZHJJTGNNNXBURFBz?=
 =?utf-8?B?aEN4UEh3eEE5bVY4aExPZUtJaCtXazMrZGJMajNnbmh1Zk9wSzRvRHFDUHI5?=
 =?utf-8?B?U0NVVXNoWmp4blZBWkRaVWVXM3dSbFNrKzIyWlVvOEtFZ3RKYkdvZmNMVkxm?=
 =?utf-8?B?TlpTV1JSM0I1MEdVczMxdGdYS1JVL1BqaTNuMWZIaFZvam5Pbk9YNmFPQ3Jz?=
 =?utf-8?B?ZWM0RjUwRVVZWmdiWXc4bkxRV1RkSlZYRVhEd0dJNzhVb0pLZHhPMDcrUFhD?=
 =?utf-8?B?d3pHTEVERXAxeFJVc2hVd2FOMzZPVXExWWlXNm1kWDZGa0NDUTd2UkVRRkt1?=
 =?utf-8?B?WTBwQnBycW5xRUQwaURMRFRmby9DUmRKRGNuWWhwZkJvWWtIODhhVXhEQ1V1?=
 =?utf-8?B?UGtZSmF3TWphN2pTVG53NzdpRlBFdVMwcFNYYzFiM0pDTXQzeGZvamlzcHlq?=
 =?utf-8?B?Umkxdk5la3JsclBQS3JNM3FwOTVBcjV4UDZLV0tkSlJwWmY0Q0xWK0lpTFBK?=
 =?utf-8?B?SGpMN0kwUGEvY2RnYVZWakVsMXYyUThteTJhaTRmVE16Y0p5WTRpcEJRdmZh?=
 =?utf-8?B?QmFvK1M0TWE1cG80Y0pHWkd4UWZMZ1Q1dDY3Z3dBc0lXekdNeWhGMHJBWVRz?=
 =?utf-8?B?UFJUbGtLZ2lNY1ZLS3QvdGtVNDFrT0U0UXN0cVpRTkg2SlJibGFTcjgwME0y?=
 =?utf-8?B?ZkxMSXoxd0IyMWIwTWY3WE1zVE94anhJYTR3VHllRzdpZk1xblUyLzQwWnlM?=
 =?utf-8?B?VGZhNzFoeUFLRzdzMGd1cmNQeHdsMDVnOHRQZCt3RFRmMGVtTVRkSnliOWZo?=
 =?utf-8?B?TExETFdoRzU1ZDRUR2JGZVhtMnJVZy94QklBcjhkQ1ZMM0V4OTZOcjlXdDNC?=
 =?utf-8?B?b1NWVkNQU1I5S0ZzbUZsN2Y0ZWkyTCtBQXR0VVJUZnV1UDIxekJod3c4a2Z3?=
 =?utf-8?B?L0xNMFVxTnA3RzhGQ1hURVA4ejJWNENCMWdRSSttRVNyeGhqY1g1dU00KzBR?=
 =?utf-8?B?eDZvMitaeHFZVWEwK0kwUU16OStneVV0RjBQVFFMR0JJU2JsbExwRyttN1dk?=
 =?utf-8?B?cFF5Y2EvWXlEQVowb2k0d0Y4eHZCMXpWdURsQ0lMcWp6aVU4WGZ2WVZvOEo5?=
 =?utf-8?B?Wk8ybjlnM1pTOTZCdlhCRi9xcVBkYXYyZkJucG1yWGtHRllZV0JoUmJvNWFB?=
 =?utf-8?B?aEQxUWhmTEJOaU1rMEZXQmo1WStMbEtLUHNsRG14LzhBS1dHVTlTaW5wZ3Vv?=
 =?utf-8?B?WU83N2hqWm5oUkhibFUwaTJiMFFIamIwemZ5Tm1RRGsxZCtQRHNCaSt5S1dS?=
 =?utf-8?B?enJhaVh4d3loZjkvQ3MrcnFQOC9jUnlDRjdvT05DYWI4T1JZOVVpTWJVM085?=
 =?utf-8?B?MTZEejQzem41MS9hWGw1S291SVpUREZtM3NWWWRhOE55Y2ZkV0RxRXF1RWJ2?=
 =?utf-8?B?ZlQ1YXJQdXY3ZTEzOEpkK3FSZDVXcGNnc2RVVk11allmTWNmNFVRWFM0akp5?=
 =?utf-8?B?M245VGxHU3FUY01rQ29zVnF4Y1BYQW14c242ekZZejVTRzVQWlZQNEtaOG1B?=
 =?utf-8?B?ZlVJYnAzR3M1bVJUUGpzUmtvVEptU2Q0Si9OeHRVM0JQVVVpZm9RbDd2bHM0?=
 =?utf-8?B?MEtxQXE0OWVTUjJJUTJCdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkR6SHpmY091ZnlVZjBNa2F3T0I3UEdsd255L0hIWEo2dHpYSm1ta1pPUlV5?=
 =?utf-8?B?VVNEMkc0a2xqSVB5bDNkUHRhaWNzQWlaLzQ3VnlWTmUwRm9FWXNMR0VVQ3hQ?=
 =?utf-8?B?OXJmRlhOcEFmaGVHQ1VzUUs3Tmt4amFDY1o4ZDhiOTFSeEcxMzdmOWxlQUdm?=
 =?utf-8?B?dDBNYTFKZWFOelgyNTUwaVAzc2JJSWhkUjliVmY5d0wwTFdTZWlkVzdzWU9V?=
 =?utf-8?B?VjVyNWdVVXFNMEUybVBlRUpMS2c3SHZ0WUl2OWdYaEV2aGtRMFk0RitBRnFL?=
 =?utf-8?B?TTJKRTIvNXZSR213S01DK0ZpeTdQTkVoeEppZXlpNzRjVkxQRXNSYlRLQS9N?=
 =?utf-8?B?Vm1lU3hxR0UyL1N6RFdlTmNhUjNjRVNSNlk5a2hOcENrSXY2V1UydTRlakhH?=
 =?utf-8?B?RWg5MitJeXNiYXNrYysvT3NycE5kN1ltc1BmeEppSUh0VVQ0OWNGbm4vdWVX?=
 =?utf-8?B?WXlubzBDSFN6bzFrYUFUazJLaFNTZEFCU3FRNnZXSXZZanFrL21XQ1FoQmVG?=
 =?utf-8?B?V0plQUJ4Z0IyN0RUYkNlckRKTzZkd1JraE85Z3ZlMDdRMTR1aWdwMTIyS3Mv?=
 =?utf-8?B?WjdoVEhvMlQ4YStmeXpqMmhxaUtsc0syQW92YmVHUFpQQXdmWU9ENUIrZ2Q2?=
 =?utf-8?B?VmFZTFBIT3FPb3o4RTdFRklveWgxMFR1NTB0ajV4UTRqRG83NVZGZXJ1ZzN6?=
 =?utf-8?B?S0NyeGNBK0NubFFaQXE2WnNUWDUrOUt3QlVSOURIVkxhMjhKb2c1aWpGZlA0?=
 =?utf-8?B?N2kxTXdqeGZXWjNLV0ZNZitQZ2RPUUY0QUxnQnFVQllUdWpXV1E1ZUdwU1ZL?=
 =?utf-8?B?MkZwelQ2WkE3QU54V2pjWk9TeHRBNkN6T1RybkdxMFVHL01DRThraDVQYkdR?=
 =?utf-8?B?c0F5NnlUcXdRdUR6dFpTcWN6YzllU3lLbWNKV0czVmRqK28zNW5rL2NQOWd1?=
 =?utf-8?B?MnJTa3ZQbCtWUkxBSHptOXhYUWt4eEtDOWdCTFFGTjBDNnhPNGxIdkZMNkpx?=
 =?utf-8?B?TVZaVjFTQjNvL0JTbTlSZ3k4cmF3ZVZFVVZWaWF3eW5LTS9xVVRNK2NSRHFT?=
 =?utf-8?B?TWoyZVVuSnR2dGdoV0twYjNmbVBsQ0ZsV0VCNjNjZVg4UzRpR3BNbTFPNXYz?=
 =?utf-8?B?WDNKdHVha2R4dlVoVnVwNmFoVk92ZHlLcWVmTktYM0FrRVMyZ1NNSEkwSmVN?=
 =?utf-8?B?Wmp1cUo2RjBqNS9qa3V4TVI4NUhuQ1BCNmpjTTBCUGZ1U3BTdFFTazJDekND?=
 =?utf-8?B?dGRvcWJlN3ZUR1lNRDdiS1lMQ2xWTThjN1NXSGNkcDBBUThBZWRTdkh5SnRZ?=
 =?utf-8?B?c1ArOXBacitSNWFKY2hERGRpYU85WjRiTlN5Z0RxNkhnbjdUMG00cjFwbTNs?=
 =?utf-8?B?NTRSRE9hTGxsWTNBRk5EbzFIR3lsMlI5dnhnWHBlRmkwRzhxLzVYcFJnTWJ4?=
 =?utf-8?B?d2p1bC85TUtYM1BoR2JmUkNYdnNzMW1BWnhWd3YrTmNFcSszU3VoV045RVNF?=
 =?utf-8?B?S1prYitKWTFSZTVmU3haN2EvTWh4am5mVW03M0FBTWhFWmtld3hTRmYzTjFt?=
 =?utf-8?B?K2RTV3BQcSttNmZVUTJEWEEzQUpCVE9mNUxsSnpCUnorMTgweTd3QVVIN05P?=
 =?utf-8?B?OE5YcERTZE40cVZ0TTluTnRDWnRYcG5KaE9SeGc1NnR5UFlmR0JSUGVTMTdi?=
 =?utf-8?B?WXc5TUlKSjhjVFI2VXltdGNBY2VjbE1rTWVzb2UzZ2RkNTdsK21laWNsSGtS?=
 =?utf-8?B?NVgrVE8yMHBJVEN5UURrT2w5S2RQMXJldTJQNWRyWXUvTUFpS1BJQStpcEh0?=
 =?utf-8?B?WjdyRmtrSTRRYkZlYUZZdkVUSnlNdXM2WnRSNy9tc1k2NWtVSnhDQ3lnWElU?=
 =?utf-8?B?NEdNeXJOMU1zWkVyVEg1SnUxK2lVVTJhOUU4a0dHY3ppZ21nZWJNMWdiZnBo?=
 =?utf-8?B?ZWxiZXVIVG9LY1NEWHF1OGZabUpPSW5PUnJUV2FNRnVYRnZEb0M5Q2c3d2hR?=
 =?utf-8?B?L2ZjTnk5VVlickl1a0RxRWxSMUtvbG1CY1JZUldUWVdwMnBrZG1IdytiOCtl?=
 =?utf-8?B?RWN5RnpjaE5vYkdFMmIwb0tzS3htenlhUkxlL2R0eUZKaWRVY0pPeFBUYkNP?=
 =?utf-8?Q?2fcRVheCcqGClH5tmqZqHaW+U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2707b8c0-22eb-4c39-8c8a-08dcd744f426
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 18:17:13.7620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25NQG2AxcMKYoagA3iEAZt3SZhpA5hjP2d+NaHcdAuAucfbMWphumKAH+mm8BBh4ph7i1je8ROL3/A5AT1JYwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5814



On 9/14/2024 00:38, Andy Shevchenko wrote:
> On Fri, Sep 13, 2024 at 05:41:07PM +0530, Shyam Sundar S K wrote:
>> Implement the i2c_algorithm operations to enable support for AMD ASF
>> (Alert Standard Format) with SMBus. This enhancement includes:
>>
>> - Adding functionality to identify and select the supported ASF functions.
>> - Implementing mechanisms for registering and deregistering I2C slave
>>   devices.
>> - Providing support for data transfer operations over ASF.
>>
>> Additionally, include a 'select' Kconfig entry as the current patch
>> utilizes reg_slave and unreg_slave callbacks, which are controlled by
>> IS_ENABLED(CONFIG_I2C_SLAVE).
> 
> ...
> 
>> +/* ASF address offsets */
>> +#define ASFLISADDR	(9 + piix4_smba)
>> +#define ASFSTA		(0xA + piix4_smba)
>> +#define ASFSLVSTA	(0xD + piix4_smba)
>> +#define ASFDATABNKSEL	(0x13 + piix4_smba)
>> +#define ASFSLVEN	(0x15 + piix4_smba)
> 
> 0x09
> 0x0A
> 0x0D
> 
> ...
> 
>> +static void amd_asf_update_bits(unsigned short piix4_smba, u8 bit,
>> +				unsigned long offset, bool set)
>> +{
>> +	unsigned long reg;
>> +
>> +	reg = inb_p(offset);
>> +	if (set)
>> +		set_bit(bit, &reg);
>> +	else
>> +		clear_bit(bit, &reg);
> 
> + bitops.h
> 
> The above is home made assign_bit().
> Moreover, why atomic version? Wouldn't __assign_bit() suffice?
> 

thanks! __assign_bit() would suffice.

>> +	outb_p(reg, offset);
>> +}
> 
> ...
> 
>> +static void amd_asf_update_bytes(struct amd_asf_dev *dev, u8 bit, bool set)
> 
> I didn't get the naming, the above using IO port with _bits, and this is MMIO
> with _bytes. Are you sure the naming schema is correct?
> 

Thinking to merge both the functions into one, something like this:

enum io_type {
    IO_PORT,
    MMIO
};

static void amd_asf_update_target(struct amd_asf_dev *dev, enum
io_type type, u8 bit, bool set)
{

...

}

>> +{
>> +	unsigned long reg;
>> +
>> +	reg = ioread32(dev->mmio_cfg.addr);
>> +	if (set)
>> +		set_bit(bit, &reg);
>> +	else
>> +		clear_bit(bit, &reg);
>> +	iowrite32(reg, dev->mmio_cfg.addr);
> 
> Ditto (bitops and related things).
> 
>> +}
> 
> ...
> 
>> +static int amd_asf_reg_target(struct i2c_client *target)
>> +{
>> +	struct amd_asf_dev *dev = i2c_get_adapdata(target->adapter);
>> +	unsigned short piix4_smba = dev->port_addr->start;
>> +	int ret;
>> +	u8 reg;
>> +
>> +	if (dev->target)
>> +		return -EBUSY;
>> +
>> +	ret = piix4_sb800_region_request(&target->dev, &dev->mmio_cfg);
>> +	if (ret)
>> +		return ret;
>> +
>> +	reg = (target->addr << 1) | BIT(0);
> 
> Is BIT(0) == I2C_M_RD in this case? If so, use the latter defined constant.
> 
>> +	outb_p(reg, ASFLISADDR);
>> +
>> +	amd_asf_setup_target(dev);
>> +	dev->target = target;
>> +	amd_asf_update_bits(piix4_smba, ASF_DATA_EN, ASFDATABNKSEL, false);
>> +	piix4_sb800_region_release(&target->dev, &dev->mmio_cfg);
>> +
>> +	return 0;
>> +}
> 

