Return-Path: <linux-i2c+bounces-11597-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C07AE907C
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 23:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F7667ACF76
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 21:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DE826D4C1;
	Wed, 25 Jun 2025 21:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tu7mgx+c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852D71E9B04;
	Wed, 25 Jun 2025 21:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750888269; cv=fail; b=K943iNbJ9UT97xk0fCzVzkr1Ix06Q+CGgq+Kh6nQks6PPHxrmKOBwhq/VMFIgknOC2T/kd5BXrnWxFvWPkDyUgatqvBy6fTrYVGkRyA/VLnfHYo0UHRzjUwWMGfkqs+gFr7mnaDrC7DE3K9vyr7TTWUOkxqCUuhmh/kKPlx/uuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750888269; c=relaxed/simple;
	bh=RkGHwzcmW0i1YeKonYhprYz3e74E8KEwDOb8rdBCl00=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ihcz6DWQaOJ/6cjoyolygVFROfZ3vyMGDfO+ZPy15TgqwYxcCDOgmmBoN7FMUeH4ZraIRMG7RIAlbWJFIRU2DiYfRd2vbRdCJUFAl24nBiBJZgsuE/bysU9ok00mPKW+hBRV+/8XrXHpTGvZPyiEiaSIDCEHogF9O2/BsFY8Hp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tu7mgx+c; arc=fail smtp.client-ip=40.107.92.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6qX/dJSOduFEr5LZ1lxfIHrDWVQCHIjtm4DFlGgZ07K2zjvJQ3X8ErLJUmQH9XUM93T2V8Me/Ns/9nXItSYn2sjnNOCs1+KwL8nkprRcZGQ3Gvx86jfh9lSmAZhgo06mdRpAt/hGuD4eTcZgBlPmhQFprm5u2tDgaE9uZ/4QwpGILR1PGXgKbvCyYI/kTBsFqqYQxA3XYzcYq6IGxGGm0sN1lsxCpJKwEXOGlsRZEBhbXkcM4If8xM3cqFWmhHB4ZMotglfRqHO7gyzx/KtlRY8jQjsKmjrUaPgr9XlLkr3DtLGPJJAUS1brWJuWpwhD7eadDFZt+zMJJVl6B30GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NZL3me6ISZVR1P1PmH3rPR+xwd+bGgmi1OYTA3u9ME=;
 b=fahtuV0vLfeRSZM7b2ZFB652z2T5LfarxlYw9uaTlEwfulqrDbZ1UPV6aY6o/nMWJs32ReKq5m7bHMhMFfT+wp2vaIo3ZPMBam15J2Pq9m0cuTI/5l9WWHLQ7tIjC1t/ohJxqYLNobk/7J2RgfybIW/5usnaDD8aHch/2ywldlmSJYhzGHQyhC4fyUbDty/A7fmcGPGTpQatKNgzYdk1s2hSlG/6A+8iwdNxxclY6pQjsMz/3uU7BWOX8rlbi+Yq/uegDiAPmJ3ChHVQ3tZkcuskJK4FLeutxNlsM++fT+utXJKYC0ZV1tB8IUHflWgDigGI6iI5qvVIJHR3rNNhAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NZL3me6ISZVR1P1PmH3rPR+xwd+bGgmi1OYTA3u9ME=;
 b=tu7mgx+c5jjniePiqRZgyRdfAWAczqVItRVP92xv7uch/zc5m2Bnqg5NEUem2fo04sVvSUTKwAieLPKHYgxqpZQtGqaLFjxOcrdZ/+33qAEamfuN8accGfHzgtslgLP12EHbF2523LKp+HaW5PHWFL6VY91Lqb43uHmCbMluzgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by SJ5PPF6375781D1.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::995) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 25 Jun
 2025 21:51:04 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 21:51:03 +0000
Message-ID: <bbd2d9c4-da3b-40d1-ae90-5a75fc11e4a5@amd.com>
Date: Wed, 25 Jun 2025 17:51:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Fix build issue when CONFIG_MODULES is not set
Content-Language: en-GB
To: Andi Shyti <andi.shyti@kernel.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: ilpo.jarvinen@linux.intel.com, rdunlap@infradead.org,
 hdegoede@redhat.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
References: <20250609155601.1477055-1-pratap.nirujogi@amd.com>
 <a4aja2xsya3titlnalacf2pfioj5zrddan5a2wazgfl7l4eu46@oe4f27vdmrnf>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <a4aja2xsya3titlnalacf2pfioj5zrddan5a2wazgfl7l4eu46@oe4f27vdmrnf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::11) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|SJ5PPF6375781D1:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5bc139-9d02-40f4-062f-08ddb432616d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZE8ydlRvRHh6eHZUMHFEM01zZmZGZFQ0TS82VGdudHRqRkMydzU5d0FOcXNF?=
 =?utf-8?B?RVFlb09taDAxRFJiZmx2L3lxK09haHdMQjd3TU1QeXpFVGoyNU5Ya25hMU9Q?=
 =?utf-8?B?Y2xyVEpvLy8vcWtxS0MxcXVOOFFRZXlza0VFYkU4SG83WHhPclNGa0VIa2I4?=
 =?utf-8?B?YTlMVkpGYXJKUUp0eGlOdWFRZ2NkODhZVzVsTFIwU0xmeGZsaXhreHhvelFy?=
 =?utf-8?B?UCtZWUxjQ0xSZVUrbW9yYVI5MHhncVhHRGtiZVJoU2lWMWl4bWF3TlBZbzl2?=
 =?utf-8?B?VEtZWUpPc3FpbDgrdjJFMFlWVVkzOGtPbVduRzlWbXByWGxqUy9iTXdPYTVY?=
 =?utf-8?B?UHpJLzJtK0ZGMTl5SzErV1Q3ZTFaSm94UEZlZGN6WTdlR1BjQXN3cEdSaFl1?=
 =?utf-8?B?NXlWOFFSN0dselBRVWdwOENscE84MitYZUJXS2ZDTllJemJjMk9zZUpqeXdV?=
 =?utf-8?B?ZzNBaW9qTCtWVUdKRU4wSi80QnZVVW9PUHNzSStDd0wvUFROOXZ5V0FTaFBR?=
 =?utf-8?B?eHFJNzI3cWt0Vi9jT3p5T0pGWFBlMVJleVA0OEFqeFZpUSt5OTdkY2pRaldV?=
 =?utf-8?B?UnYzRUdSeU5HQ0cwOXlCYnM4dzhNR2FSWlFlMkhjZFNUNHNJOHNMU2l0aWFy?=
 =?utf-8?B?cEdTVEpad0ROSFN1TGprcWhyME9ZV05RMnFVUGJ1SWNCaWo2aUtqS0FaNUNs?=
 =?utf-8?B?VUNUbStKSjY4N2htUks3K1J3b2ZGQnZOSmI1U3RJYXBqaGVoYk45ZUxaemlM?=
 =?utf-8?B?d3hGMGI0WEpySW41bEFSVVJ3NkRvNm5qTEl2R05IajZFU3RNWU9tbDNTd3F6?=
 =?utf-8?B?Vy82NlZWRTRzY3ZIQjdrWnA3cjU3dGNiMDdkbzJEWVRnaDNWRUphMDlSOVNq?=
 =?utf-8?B?emJDWS9sVVgrMWhvSmNqQ2piV1JGVkVRS2FyQ2lYUDk1UjQ3SEpEOUhURVJs?=
 =?utf-8?B?aVltOVZaRlJLVC8vZ1F5QTFGbDdRcHczMEsybk1XeVo2eUZSaDV2WGwzYWpN?=
 =?utf-8?B?WVYwOG5YZXErak9ncmxiY0c0UC9Na1lsMUp5RiswV1FMd2dhRThKS3htMXp4?=
 =?utf-8?B?VTV6MTg2Mm9GeDR3MlpZcVVMaUoxcXFuMFNiK2N1c0tvMms2ekJsTkkwTUM1?=
 =?utf-8?B?cHdERG9pMnVzSFhOZVd4ekFPL1MvbHFVKzNoUGhuR3RSTk1Rbm4wZVVscWFB?=
 =?utf-8?B?aXJvV3JITGU1cm1SdkRJRVdvZnA2a3BDcUx1WDlmWFVmeDd6clpyTVdSKzhu?=
 =?utf-8?B?eGpYSlVsZjQ0dlIwY0l4ckMzemorTW5LWFBwcW0rMmZ3c3gzYVdHZzdVWGh3?=
 =?utf-8?B?TnU4VVgrb05USm1DQ01iNG5qQUhKV1N5OWxVMEV1SlhkZXozQ243bDRvS0NG?=
 =?utf-8?B?eUlZRDVPZlhZaGJaK2w1MmNmc2R1VktORGd5eUZhQ3lZV0d6TTlVUWxSYmZC?=
 =?utf-8?B?NzVFS3hsbVhmdXhTdkV1dGczYlllbWtwRUdObjVTWk9vVzBwbEdrL2dNUmlF?=
 =?utf-8?B?Qnd0MDNiQlliS0xpM0pGaE11WFM2dmV4ZDFiejN5ZWRJc0Zzc2ZCNTFRYnRR?=
 =?utf-8?B?YW1zTVY0dXhCQ2tmTUVjRDlsUnpBL1NxQWw4MHh3MjBDUkZJMS80L3Z0bkdB?=
 =?utf-8?B?TFE0SzlKSEIyMU8xeTZFUHlWNUMwVzdpMUR2TXgrWU44RVYyUzU4dkFwaStF?=
 =?utf-8?B?Y1FFYkt5S0YwTjJHSTdsRWdpOThTaVZGN09vYXh0Z2J2SFpQTXNPcHQvMkFC?=
 =?utf-8?B?Z1BLY0FnRmlKOTR4ckxOK21TTDNsZ2JWTzMzNEhDSHlaRTAweEY2SWdJbmxH?=
 =?utf-8?B?WFFXejhmRDd6QmxvWDRLcFF1SWo4b0dvL0NTYmpSTmZMdUo0S1Bvd3dwRUxm?=
 =?utf-8?B?NWRqU21iaXhEWFpNSlIxeUQwdzZtbDZhN250Q05OVFhRaVM4cXZ3OUNZRVR0?=
 =?utf-8?Q?Bxnp7ZaD2Nw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3IvL1ZsZTV3L0N1MjY1VWM1RUEvNkRXSnRWNm9PeURyM3JGYU02Ky81bGFN?=
 =?utf-8?B?YmhIV3RIdXhaZmQwd3ZISDNXKzhMMW9FVldPT1NSczJpalJKYmgxelp4dWFZ?=
 =?utf-8?B?dkFIR3RzVDZ3dWk2OWVnNTFZQnI5RkVQMnd4d0hUODhuOWhWdFpETEx0YStT?=
 =?utf-8?B?dE5GbE1NajBHU2FQdVlJNmYrTEtVYjhyK1ZvTmVXVmdkWFUwSW9lelNKU29k?=
 =?utf-8?B?UG9oR2d0VUdZK0ZXb2RsVWszREtuMWJyblFvaENYQUNWejNVWHo2eFNlbDBF?=
 =?utf-8?B?MTJtMzlxZzBBWk5nM1lJUlhwSXZYaWZ4YVdISGJlaEdZNEFoUThGVVg1NHRC?=
 =?utf-8?B?OURSUG16dnpkUmY0MkU3aDZlbnB1ZE1DT0JzVy9ydzZJMEZJdEpPRElmTDd1?=
 =?utf-8?B?L2N3OFhGUitqb3lGbTJoRm80RXdwcDgwWFR1TFoyb3hVV2lSWUlHdTAyTS9q?=
 =?utf-8?B?b05FM2s1ZGlielhwdHlIVnZGZ0dSaVI2U1BpYnBaYnYyd0hFa2pVQk9YZFV0?=
 =?utf-8?B?NjVUREF0YTVubDNuUWlvMzBINHE3RkJlUlprekwyNUduVFBWNE5NWTBsdHpI?=
 =?utf-8?B?TTR5RXdjNTh0UEVXbkZaUjdhMWpqRzU1QlpGSkJmWHczbEJManpaYkZPMFFG?=
 =?utf-8?B?OGFyZEMwUTlseFhvak9jS3ZxNktJd3hRdGd2RTVLZ0dYL3FWbllXUTZWdkV0?=
 =?utf-8?B?RmxzVi9KSkxLOE1LYUxERTR0TGRYVGMxbGd3NElUWkpxb3pyb0FndUVRSy9W?=
 =?utf-8?B?a1FOVnpoY3dtZEJ6Ulp1ZjhqR3lrMThabFplOXlWQUxDTWxUZ0ExRmhpd2xU?=
 =?utf-8?B?UUMzeTZ0K2J5WjRsK0lrODdzQm5uWnFkUyt2QmRLRFNJOHFqaGxnTlBiSlhM?=
 =?utf-8?B?c0tqYy9jRW0xZHNnamRrcm5MRlRmTXE0c1lYMHRRVkRQRTYyUXlrMVlwa3h4?=
 =?utf-8?B?TVQ1em1LV0N2OXc1aS9Bakg5amF2b2p6UzFSUzBBbmxKbW0ybTI4VWVWQWZQ?=
 =?utf-8?B?NkUxZ3krM01NaUlIV3I2aUhlTm1MY3RHci8yQnZYRHZoM3B4Qk5BYjNkTDdX?=
 =?utf-8?B?aElCZ2sycEpVL0hSVzJsVWRLNGRRN21VLzBRVkdENitFUnZMd2J3TXVUZmw4?=
 =?utf-8?B?Nmx2MjJ0ejlkWEF1bEtINXVFWHBmTkZZSm1vbUdiMDVCNW9NdUJWNEpOY2Rk?=
 =?utf-8?B?dDNkQXpiMWVhNWFCWVVCSFdvaWorbk1HOFoxcXVBSTdWei9QM1k1Y0VBb2pV?=
 =?utf-8?B?azEzV2x6TUhBakdlQzhrdzc5ZS9mNjNjekZlQURDTzFzVUJ1RVAwOTRUUTVB?=
 =?utf-8?B?eWtSM0JuNnBUem9uTmZTbEY1TllicmtWOE1wSVBZYXRPeXZUcno2eThPYmZp?=
 =?utf-8?B?cll6OFN1dnlhdFdnTXlSbFc2Rnp5WC9WTVVnOTdxNzNGbXJ5Z0NQVnpnL2dk?=
 =?utf-8?B?bVFSZmpUQjBKbng0MmhTRXNuYU0zM2lmS0dmMFFtTTJtTGVaM2k5R1ZaOUoy?=
 =?utf-8?B?UnVvWVpvSlo1SmVGQXV0dXlzbHRnSkp2YStNbUF0UGhuREhrU0V0bjZvNVNC?=
 =?utf-8?B?MmxwdWdBVXRrWWtJbjJSRHlYN0NZQllFTXliajJFb3VFVlhoQVE0aG1QUTFZ?=
 =?utf-8?B?TnhsUGhKNXk5WlJOQjcra28vSzVQMk9XeFJIejZxcjY3QTUyUG90R0NPZDlt?=
 =?utf-8?B?YzFwMWlvRSs0MjBMSDlUa3laZEFQZVRici9OblRnWUpZWHpPNG1wcWVreFNI?=
 =?utf-8?B?TENKSDNFOUpKVFVvWGcvVmZreXFCaXZZVmhvaU1oTnRPeTM1SWVvQ3hwWVBN?=
 =?utf-8?B?ZGgzTTF3YW1WRjNYTXRBVW4yaldYdlZXNkc4YnFRM0oweERSd3d2SGNQZFhV?=
 =?utf-8?B?RVdPQmFYcFdTOG5uZjBzbTQyNjZWdi9jZVRsQ3E0bnAzcG5LL0REMlFJL1la?=
 =?utf-8?B?NGg0UEEweXVsWUIxbGxjM1BsODg2b1N0NmgzenVPMnRCcFFXSGsxK1dTQWVp?=
 =?utf-8?B?c3UzRWplZStZNlVQMWlCeEtnTkRIRXJTZ2ZYaEVicXJXUW92d1h3MEVhM0l1?=
 =?utf-8?B?M2lsVFJzL0dUQ0NZMzlZYTVScFkzTzlxeG56SWNWSXJZVXQ4a1EvQ0VhU2E5?=
 =?utf-8?Q?nntkWvddUOoZqlR+1CAqOb9sN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5bc139-9d02-40f4-062f-08ddb432616d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 21:51:03.4259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5xjyvd01Td86IzPkzo+/HrzlJguMT5AieYNblwJU2eUusoblQJnBeDOwUsJfKiyOk63ZLyhZVubLw2MqwCRAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6375781D1

Thanks Andi. That's very helpful.

Thanks,
Pratap

On 6/25/2025 5:43 PM, Andi Shyti wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Pratap,
> 
>> Pratap Nirujogi (3):
>>    i2c: designware: Initialize adapter name only when not set
>>    i2c: amd-isp: Initialize unique adapter name
>>    platform/x86: Use i2c adapter name to fix build errors
> 
> I merged this entire series in i2c/i2c-host-fixes. For the last
> patch I added the "Requires:" tag in order to include non-Fixes
> patches in the fixes pull request.
> 
> Thanks,
> Andi


