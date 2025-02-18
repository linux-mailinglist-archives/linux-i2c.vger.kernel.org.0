Return-Path: <linux-i2c+bounces-9474-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 109C4A393AF
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 08:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11A7C3ABFCD
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 07:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19701ACEB5;
	Tue, 18 Feb 2025 07:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oQgG9qi8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F39F1A5BA4
	for <linux-i2c@vger.kernel.org>; Tue, 18 Feb 2025 07:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739862583; cv=fail; b=X3z4k6MODhWheCvQJ15evGzs9qiR9FOo6mHTDnu3whJpKxYrysirSZusp+c89oBmxZ4InGQ4GfavJ75kyHxCwE6MCLoSZm5T2xFqk1z/AbmgySnWfUyHiRTERFtJlHnihnCkSjuYPxdl3E+B7hYSSALwI0z4EmFImLIQgF48Kqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739862583; c=relaxed/simple;
	bh=OPrSxAiMYOwrufbiu6zxZbyGCDhP1bj/9tU1sOOWzAM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m/VDgVCePuLHA1V5MDhKqY3WFfAOjRp7LiThvH1O1Z1UGOfVlQY7aerDeRBFMvyrE5pL2gZcbIdyLReOrphMgzrk2ZsyL4C2F3ygwIbEAeuJG8H6Hxmg9yf3cxZoL1IF7uE3pNyqoU5b25WbiUQDTJMLkzpVc7iBrZBtuKAzSo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oQgG9qi8; arc=fail smtp.client-ip=40.107.93.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9JgpVWjg6Lo2qVhLrbZ6o9sl3HzHBlJXG2pKUYh17tiRouHTqdDaMbZw5WX5D9LGq3pr8J0fxWECXnqq6OKXLTbUXeprtFeBAgJubMOu7VR3PXwSygpo9EYbTM+x9DIwBd1DwLBovNXuWs7Fz0zMGbGjr5S000OXg4p+1zsHdkjy6nmTlIs1cpLiSQIPGzvNBZ6tomGQkycu/XaxyhnIopWra8OCRushQuNQKMZi3/yh6ZEgBo3P6O/U5LGe9oKm4JnwoY7OmqEtjnPwuKXzMuXuc5jktAM+wwn+Pj1IMeVDdx2W34Gh/Qd8Ul2O0LoyqmF4o53vFb4Tp5gXGSkJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOguP7Nqb1oLyG5st5rh9Gjt0OMR8jeHIPzXK2kdQ8k=;
 b=gPysb8s55iSAhOSGXqAIGw15PdDVJ74htb3TFoJ0PuLMHKDnlVaXab3ePSS2YLwKs24DBHFfnpos9wrxrCTko9YUSnppk+lS8qzxLbx6W1RsoZk2qY8bP6Gqx4jBm+W+evaBGWoLNrhyN3jKcbkTgLzwCi2UbM7t3+C5qAX/pFs31RrJ+b7Sxf8tvBo5pX6uG39vygIfWpBeGXsMhHoARekotYg2jKdsb5WMslTRfMxl+BwEZKW2WyVxpdBnpvrlVd5Ux/+sTccOtUb5YEyr2Q+RlnciKPe8kooG3g0xz4RnmeHMaNJ2C/SYXqzGJHgh6SU98xomwnkQ+TXvCUY9jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOguP7Nqb1oLyG5st5rh9Gjt0OMR8jeHIPzXK2kdQ8k=;
 b=oQgG9qi8zEIMNLBp49tjoMimdq8jKKCSkU1QMm0gICdEfDdaHvLpSwQsN4Opp7HRuizEr/TEnSkxGBYUAg20fQyBAGronk29DRpaCGXdyWrYcFNm9Ma7/cDBp5ifzEZWJozIu1s9ORecCdnqrKaIu0nBL+wucFpAehp8EgUcn5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA1PR12MB8312.namprd12.prod.outlook.com (2603:10b6:208:3fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Tue, 18 Feb
 2025 07:09:40 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.8466.013; Tue, 18 Feb 2025
 07:09:40 +0000
Message-ID: <f37ef5bb-b8d1-425c-8a64-e20db672041b@amd.com>
Date: Tue, 18 Feb 2025 12:39:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: amd: Switch to guard(mutex)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket Goswami <Sanket.Goswami@amd.com>
References: <20250217124709.3121848-1-Shyam-sundar.S-k@amd.com>
 <Z7OZvxCCnil-nerR@smile.fi.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <Z7OZvxCCnil-nerR@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::27) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA1PR12MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d2cf57-6c62-4ee3-f574-08dd4feb3624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGlwSktnWTJsV3J3Q0N4ZkpoTWk4N1liUFZMbFczdzVHTGdDaGNSb3VNUmlF?=
 =?utf-8?B?R09uYnpCV0krcFdZTTNHa3BRTjdOU2tzOWRHWlJFS0R2Z3h1UzdndEQwamVD?=
 =?utf-8?B?cEIwQ3hMMVd1VWxyR3BMb0RpYTRTNGJ2REdFZDBlTWxtTW1jeTV5c2NaR1Q4?=
 =?utf-8?B?bElGZ3pxcjRsTzgxbEtnVVhkeTVacC9hbmF2WnN0aXdsOSttT1JwdnN3VzNp?=
 =?utf-8?B?YUZzeHdwaEREUmZaYXhib25ZV3hIVkRVVlVVc3ZLZXVURzdCWjZ2VHE4emgz?=
 =?utf-8?B?Y3dYV1BEdzhkMVNCeWpGSlFBSUs4MmdhRWhzY3hzcEpvdUlaYTFITjFPYnR6?=
 =?utf-8?B?a1I1ZEZGNnkreTNYWit1WWM4c29aS1ZqRWZkRmpWa0x3WEwwYS85RDFpTnVw?=
 =?utf-8?B?dlJsSGNadk9wNy9iWUVBQjh5WER2M2xFalN1cERVOEtqSlpiWWZYWWZTSlha?=
 =?utf-8?B?dGtwY0ZrNDdIaEErbHYvWFU1d1ZzK09ibEx3WUE0aFphOExHME8xS0JzMUdE?=
 =?utf-8?B?V3I5WlVkekJ4dGF1bXFORVZ4SjJVcW1zT29xcEI5WG82MUhlRWZkaHBYeVJ2?=
 =?utf-8?B?UjVHY3R6Vi8xYmEyeWl3ZzBwbHhnWFBtZEJTck05ZFpIN29OaHZmSE14TllX?=
 =?utf-8?B?YkhqU1E1TThBSTBVazN4S1hhT2J6dlVvY002QnZnZkF4enZLZmxJRGpSUW1k?=
 =?utf-8?B?Z2FIRms5RnpFM3EvRTVlK0NNZ3Uyak9WdmxJMVJWVlBtYnJ5V2sxVldSYmRC?=
 =?utf-8?B?M0g3UVBOZS8ySWlKRHNxdEt4U1ZWbG1TdkZjaTlXNjRPcjNhSzE1VzVZVzNQ?=
 =?utf-8?B?aWFwSit6UXRBWXM1VzdoUFIrM1dmVDFpS3pCT3I1YVAzUlhZRkJrcU05WTMy?=
 =?utf-8?B?dW01eE96QU01NVF0eFlLc2JremFWUHJGbENTcFB0Y0U0eWIzem43SHBvZzZF?=
 =?utf-8?B?Y25ueGNidEhwQVRITHcvb3ZuSk8wQVcrWHdhM2hVMUV6VWJObUpCdUN1bDgr?=
 =?utf-8?B?SGZURmZISjZZYm1tL2JxWjB2TEVHaEF4N0F1bHNueTgxbk44aFh1Y0RnOHp1?=
 =?utf-8?B?M3lWTE1vR3ZzZWJpK1Jtb2UyU2FsWTBjSHRVNUpkSnpxRmsveUsrQy9LZmhx?=
 =?utf-8?B?ZVlLLzdSTzk2V3V2WlZCczFuVmJYYVNYNDlVTlVQaVVhNE1Hd2dyVzNxSzNt?=
 =?utf-8?B?YlVMZ2xxUCt6QnNwRy9YVVNRMmpEM1ZRVnFSQjM2QzlaQ3lPU21OQ1R3SXdR?=
 =?utf-8?B?dE1vWDJVSmlGRllsSnRPRi9VeGNCWlE1NFlOUGVoRnpBQm1XZUpMUS9wdHlZ?=
 =?utf-8?B?U25rajJSeEQ0aldQblJ6SzlqZTU4WnZ3eHBIS0JIWHVkekxjRWNkN1p6TkFk?=
 =?utf-8?B?K0JtakhFLzlaU0RIVmhtcjRRR2JSQ1UvUHVaVnlWRVZGVmszSHBhVG9YZkNW?=
 =?utf-8?B?WjFseGNDMWR1OG9iTUVEL01PWktpZzFjUFpORHV5czFYYVZOKzBZRVZVSmpJ?=
 =?utf-8?B?K1A3QkV6WGUzTzg4KzBrRnFuUUUxa09lV2U2NVBFRjIyWVdsRm1XTWE5WHYx?=
 =?utf-8?B?UzRGK0NhaTRTcERkbGxvL3NVZTVhRWZyWGFqK001TW83Rk1xUmdCL0pwYzRr?=
 =?utf-8?B?MUNpWmVJK0k4cWJKNHlOWTdiOTlkRUMycXI1UkhNK0YvbEJDNDdzNU5Rdkhp?=
 =?utf-8?B?RG84cWlFT1JTR1RSbjQwR1luZnFIQ3lQSHc1Zm45WnVXRDNhcUlHZ3J1RmJ4?=
 =?utf-8?B?NC80R3NaLzVnS0ZtZEw1NldrQVhjZU9EYXhmYXc5ZkJibnhacXJoSnI3UXdU?=
 =?utf-8?B?M2hscWIwaXpycy9KeFRwWkVnVDA5eDZqTEVXOXcvazZSMStQRHg3di9PM1Q4?=
 =?utf-8?Q?f/8tNj2r9gSmZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm1LWE9lbGptN2hzRmJibGhRWDdtQ2JRWStQZTI5enh6dXdNbVVvM2RFcHBs?=
 =?utf-8?B?dWJPOUE2aVl0RE8zYytBNlA3S3BEVFdaMkZEZnRDUU5ZbUhwaENTbXNIbVBw?=
 =?utf-8?B?REQzS000R0pZUURld0kwMEQxSDNtVCt6V1NiV1J2V2pXVjJpd21KVnNTUSt3?=
 =?utf-8?B?aVBibGJtblZmaWJxSXVhNkZXUUxpV1NpeUwzSW5MSzViVFlVVTRzNkxjV0t6?=
 =?utf-8?B?c2RPS285L1lMSGJ6M2k0RVZVZllUbisxVGVjTWk5UGtwNHgwTFpsdWxLNCt5?=
 =?utf-8?B?SHhQL3FKU1lDN1J3L0pURFFBK0E1MlIxaXVaaUkzSUphSVZ5SGpoTUE3Tnhx?=
 =?utf-8?B?ejFFYXVmTUxDRlJTTUp6VTNReWtmOW5lNkFqaHNhQ3JaTk05d1l2NTloVHRQ?=
 =?utf-8?B?Q3JQRzdaY3k5Z2UzN2VUTFVrL0lTRUVjM1A0SlA0VlFhaUJDS3dCa1FPWkh6?=
 =?utf-8?B?N2xldm1sR3NJR29qNzB5NHlIOThVVVBYWFdaMzluMjE1cSt4bjFCOW9yMlp0?=
 =?utf-8?B?RUpqRnNiT0ZpZzdyQ2pVWU1rQTZiT0tXZlg1eGZRNHNwbloxalhwKzVOMGR2?=
 =?utf-8?B?N3lnRk9KMEtiaS90S0JPVUNHUzcrVHhIVksvWmRnY2d0aGJWRHZhL0liRnRm?=
 =?utf-8?B?cDR1MXBqRXJSNTFlbFFUTnNEdEcvVFlKMmJ3TFE3N2FjdE5yY3RGMUtYdS9X?=
 =?utf-8?B?b0NzaU8vOGdXU3dBS2tpd0lyNnJKcUx2QTQ4SWhtdE5IN1Y2WmJjamlsRSt5?=
 =?utf-8?B?R2llbWJzeVRnencvd3hwOEpaQ0g0RVhpbXBKaEQ4VXZrR2N2WHJFZE5lLyt6?=
 =?utf-8?B?bU12NDRsQ0RYeEFqTTRkYVBETWtBUy94MjVIeklBYWEzWm0wbFk3NFkzNS94?=
 =?utf-8?B?NTdudnlTZEI0QjZETEdmaDF4TDcyWlBocFBGT1lIR3hzakZ1YlI2THllZElK?=
 =?utf-8?B?YXRZcXVhR3JqVWdZeDNWV2dCZWYrQ01ycWZIYVRIUUU4cWVFd3NNV2xUVjFu?=
 =?utf-8?B?U3VYUUtsZjl3NVRGVHYwRG1mcXROOXNKYXVzVG0zRmwvdEJDaFZFY1lRU0dF?=
 =?utf-8?B?VFNyTnNycm43M0RvVE9DY29aOU1oc1BodmZHaVJ4VDErWkQwYWxJbysxZTlI?=
 =?utf-8?B?VEIxNzd5djh2eVBCTkhZbGovZHhUanNBWitkeUJ5WTMrVXpyY1ZDTW1yNlYx?=
 =?utf-8?B?MXc5MzUxTHFzTnFGbmxYb0tyUVR4UEJ5YlE1SWxpRjMvZkxTR1FYMURBV2Nj?=
 =?utf-8?B?aEs3c3R3SXlFYkJFQUQ2ZjRsV1NNeE5rc2JmZ1l5QTB4eFhZSlVLeEw3a1BT?=
 =?utf-8?B?dkRWaXJOQkRtYlNlUHo5VDB6c0xHdkVPNTlNTktHcHdsYlBlRW1YckMzQjlm?=
 =?utf-8?B?ZnovMVpvQ1NZR0NTV20xdmtEV1E4QndxSnhVdm5hNHhqQmpteTJKdjk1aGpw?=
 =?utf-8?B?SzBrdHNUc3lJR0Zid1BmVEhIbEl0Wll4TlJlajNUWHNDSmRsUTR1TjM0OHU1?=
 =?utf-8?B?MXdRNkZCdCt6em5zYlBKaVAwR2VZWUdoMldGd1RySHFmRTJWUGlwd1dxOU5s?=
 =?utf-8?B?RE5nanIvdXIrcVNoUW9meGdXK0FXTUxlUkYwdHZOeXRaeWpPYmRQWWFXeHlS?=
 =?utf-8?B?bWF3MkF6UWtOa0l1bHkyelhvNStOMDBjd0xtcnRqbEo5K21RSnBSYUxxOVBN?=
 =?utf-8?B?bmk2NFJyYXoxUVVQMG8yZkdJaEx0eWttSTF0emNFNGV5MDZmYktCNmY1OXV2?=
 =?utf-8?B?eWx0TWhGZGNVU00wUUNvL213Z3ozNzhQT25TUFRmNFJhL3YvUU5KWUhTTWtL?=
 =?utf-8?B?dEpWQSs3SXlKdXlkTmJXWmp1Yzl2aXJSTnNGVkVhVmY3ZzFsTjBCTVVyY24v?=
 =?utf-8?B?QkRhREhVSC9sN3FSdzREMTNaNVB0T2hFeWZ4U1JJT2VVckxLdFlmN1B2YWVH?=
 =?utf-8?B?SERkM0JHSlR3VXo0WEs0dGFaanpSRmVaZXFZUUxtVnFzN2RJUlVLM29ZWk1v?=
 =?utf-8?B?S1Y2WStkaVhNNUIwOXBKNE9velNsSnIwak15ZFdRUFliMk5JNmo5ZHlERXZH?=
 =?utf-8?B?R2xJaUhVWXVDZVA3NXlPeEp6Rk9uUWhmTWlLcVRZOVA0NkNkWmlrWW5tZ2NM?=
 =?utf-8?Q?UL05MMW4EHzllI8jvB4poQqot?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d2cf57-6c62-4ee3-f574-08dd4feb3624
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 07:09:40.1966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vZYjTS4HocXTtKoOcX1cecgcILe1IbUPnclFnxsm+Ocgt8Ny/CpPPoB9pUWT/WOQ0W7hFXtcI8XZepFNybz/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8312



On 2/18/2025 01:49, Andy Shevchenko wrote:
> On Mon, Feb 17, 2025 at 06:17:08PM +0530, Shyam Sundar S K wrote:
>> Instead of using the 'goto label; mutex_unlock()' pattern use
>> 'guard(mutex)' which will release the mutex when it goes out of scope.
> 
> Both LGTM,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> But next time either sent them separately (seems like they are independent),
> or add a cover letter explaining what the big picture behind all the patches
> as a whole.
> 

Thanks! and.. for sure next time..

Thanks,
Shyam

