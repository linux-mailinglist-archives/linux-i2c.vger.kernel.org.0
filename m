Return-Path: <linux-i2c+bounces-6935-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C34F97E80A
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 11:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CF1BB218CD
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 09:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB6F4AEDA;
	Mon, 23 Sep 2024 09:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1TKsliK0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2072.outbound.protection.outlook.com [40.107.101.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE761581E5
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 09:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727082117; cv=fail; b=nwFhtr0q0UsLDnsDoa19p5UhbERZhraVRvTeBC8bwzGrCfHjYGvks/IQ+iKni2Mh+FcMlK87O4uzrsGius+2rmR8MFOLbzIRbB01AYG2BXzXYU3gCU9Fcho5j3vLvLSWr676q/x7fNUJAqd3Y1iMzT7l+He1vc2GSamMEMT8kWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727082117; c=relaxed/simple;
	bh=/+AIJ2j5bJoQKEqZH0IqoBZNgpZ04DSud9WeIGMH7fk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VUTfqKyu4pn1pMHwObsWRB0g3FNU8hYc+XjO3/mXYLYMR+Q7iFQ3rI+VOsAsq/i9t7GRUBgQBjnIix62cR+cnQrkvijLxnK6fGFfpfkGxbRMeM185x+djhuW8zfHm9ZWYosaaB7SxjOEjbxhN+8KJaztzg1oNJAtsQTzbWXCA1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1TKsliK0; arc=fail smtp.client-ip=40.107.101.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cpx12APf92J95bXWgzvlIk7rcWI6OXuii8fqxv1VNseCy66zVh+6Ne1DoQ2+DcXaLnwtIDS9Y2GE2sV6KwLHR3Xx5otg2Dsd+JlRJQ1qDOAiO4Qg+qmLO7kpzePWGSGQELSF55XUIsZnM4Us0ye7JDhGOeqdq1vGmNEs0U0Ey1zEZ4lGzX+l113xPElZYRD3czDUwjJqE3N893QFwa8AicrZi0lZgfhwq9lFOfh/Cg+3m91pCJXFULEqXpvN0nzmbkt+t7A7JtwZiW5g437jHa7Rh9r0dg9ZN0379/2mytz2iv1ts1aQl4SPIVj2GXqAoN1ONAoiLhExP2uXS6hJKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/P1FRUrt5XlPkWObIPDPFHFI4eRIHlaO/b60Mk3uVI=;
 b=DtJX/NCD/CRJ/1p5vdqY5qnha2ttOpltY4yeu1rik7kWkFn8NCEqlCRm2a0WPeypEFER+AY/qHuRtAVSwYDGECZqDUcBst3aAs0729w4vRqUQl0/AkqhM4bi6KDuUQey8fnLwImsvY1054OVW3pfUUqY5neNQl9LqHe5+xuLkEBEHWLAzaf14rmGztxDQoiwjlMoJsx1i9zoX4Mw+2VoMKydP8nmaSi0rZAqGGoFuUR+8vdgHFqNeoMZsm01QDE7dliFkX30d7KW5HrqNnLpxNHQIrAYBhniiV8ssdP+1oaeOp4V+fa2gF4PyDzHMlt5z6kfCKiDcA1qhFe1dPqjwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/P1FRUrt5XlPkWObIPDPFHFI4eRIHlaO/b60Mk3uVI=;
 b=1TKsliK0Oetic5YEK77xRm859qo9qNNHoFlGdLAe8m/uAyPODHsRXE5Y2nmNoZHSDqsUWNbKJkxUo8CvYJObLIXzynx3kufGNZxgVDMOcis4o4JhBwB1hs39hPEslVUIkIh4IiupguFza7qMfZSV101RZsrq2X4hBjr6cKE9cj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH3PR12MB8851.namprd12.prod.outlook.com (2603:10b6:610:180::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 09:01:53 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 09:01:53 +0000
Message-ID: <8b175ba3-ceec-4ced-a1e0-620fb800752b@amd.com>
Date: Mon, 23 Sep 2024 14:31:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/8] i2c: amd-asf: Add ACPI support for AMD ASF
 Controller
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com, Patil.Reddy@amd.com
References: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
 <20240923080401.2167310-5-Shyam-sundar.S-k@amd.com>
 <ZvEqZF7Ijn7XUAQL@smile.fi.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ZvEqZF7Ijn7XUAQL@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0194.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::19) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH3PR12MB8851:EE_
X-MS-Office365-Filtering-Correlation-Id: 693191f4-c171-4192-3517-08dcdbae5dda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGRGaXJ5OFJRZ3JKdG0vUzlqRW1FNTJCN3hlajV2WlozaHAwZk1YSE9JazZD?=
 =?utf-8?B?dkJtelBtRUlyODJQbVFXSEcrdFdvdkVMQkszYmdoYmdlendURTVIODk5MWFQ?=
 =?utf-8?B?RlhjbUhDdk1mSVRjUVZnZ1R0bGwrZExTUDN5Rk1nVmk0WWJQaHM1UkJmZGVE?=
 =?utf-8?B?RmFTb1EyQWhxZCtzWjlQb1FvNXAyMU4xS1lROEdTVDZjR2pzT1JpUG9KSGti?=
 =?utf-8?B?cmtyNHhlRW02Q244bGxvb29nb3ZtYlJwS1Z6UDZCTnVRdzlZUHhVMzhycDB5?=
 =?utf-8?B?bldUcSsycVFrSXdSblFJMktTaExFVUtNUW1MZXpZOGo1cWpmRzFsaUJ2dzZH?=
 =?utf-8?B?eitHMEU0OG4zeWFSL3EzM0c3SnhPeFZUSlhVTEo2dVJXak1CUVJPSzdSRGo4?=
 =?utf-8?B?eE1MRTZJUTFNTHlyZHo3SnltUE9Oalg3aTdKOEpxc2FUelhLSFdPeFNsaVRw?=
 =?utf-8?B?WVgyR1JJWi94anh3MHJwS1pCblpyM255bVMxRk9sU2xxRStrbjFVNGVySlVz?=
 =?utf-8?B?b2hvM2pINlZ4UVNzaFYwQmpXbUpyb0MzTm91L2pZb1pPSjYzeVpRQlpPeStM?=
 =?utf-8?B?ZTA4UXdFcE9OaGxTa1dpbW1pRHE0NEE4YVNhbTJ6OWszM1dXWkpId2VWVTFo?=
 =?utf-8?B?Q3dPdGV0RjlBeHhRWWhVeFljaDhaYjJkcHJjdHRhRG4rUkpCTXYwaWV6RGsw?=
 =?utf-8?B?cS83Y1B3VXY2RFAzd2E5K2YvbjVlcGR2NFpzN0pLS2FMSFYzUDVTTkdCZG1U?=
 =?utf-8?B?K1R0K0ozUjRXT3FUbG5OUmErMTFTVFh1blYzVGhOdFNUZnVCM0hQMHlJTE9h?=
 =?utf-8?B?Tks0aEMvVUhobC9HNFFjemN2b3hGa3ZtSmJLNlhNRStoT1lyR0JXRXVTWUcw?=
 =?utf-8?B?OXNoZ0hsVXNmQ2lYanFvUmx1NlQxUE9OY1Y3RDR3cmFxakVrT0JwVEhCRngz?=
 =?utf-8?B?blZVcksvZ2wxeCs5MzhydmxUcm9hbXl6TjM0TkxDTlFpTFlXeW9wVWN0UnN5?=
 =?utf-8?B?cXlhYU1BVlJqV0I2L3J6RG1UU2lkS0hsTnBybW1ZSXNpUG1yWS82L3BISVhC?=
 =?utf-8?B?MVR5YytGbUVid2hOaUZSUGFMZVJWd1pOUTRIVkhSMkJ3V0c0blhIWk4xanpP?=
 =?utf-8?B?dWRxM2JPaXk5YjhFamRDeUVudmNWdVE4emliMUZROVJjcDRIWmNqZGppRkJs?=
 =?utf-8?B?eWJrcUozM20yWHcyZUlkaFJWZmZlcFJmNnRETEdmY2VVWE5SRjBqVndwWE5k?=
 =?utf-8?B?V2F0QjBDYWRZdUNIREdIOVQ4b1cyV1JsMkxwbm9MN1pXY1NJdFRwMDlFMHVO?=
 =?utf-8?B?VzY1SkhoN2lQQjB0VGlnRkhqNXU4STZZTUVDbUpiLzI4THUxSWFpTG9OYkhK?=
 =?utf-8?B?czFrYklibGVPNU5aSGwwVmgrVzVvRTAzZThqMlltd29WMFpXZ2YxV2VrbmRr?=
 =?utf-8?B?U0tqU21pTUtTbU5lVDJIRFVkTnNUYmZWb2xhaGlBNXNORWZjY3VSaHc3ZE43?=
 =?utf-8?B?YjlEV3pkTTA4dUZiTDdZNU1aZDVBMDgyTWtZZGVmbE9EZ3lKNXBqSldwS0Ra?=
 =?utf-8?B?Uk1tbS9KQUxhSjFqcVpoUGlISlpCVXNTM2xoZndLMVk5UjBoU2p1WndXZXYv?=
 =?utf-8?B?TG5jRXBmd3k5YUtkZzZ1WkFIeXFHOWxwWVIrcWRJdW5aaU55OWNFUDNtUnEw?=
 =?utf-8?B?dXZxSVBsVFRBOG9OcCtxUlhEeUVOTEpPWkdENytDVXB6akFER0hObC95RWFw?=
 =?utf-8?B?SE9CMnRveUlmMHhDZyt6djRlNm1BYmVYTGtGc1prVkhnVUdzSmlLV2RxVTlS?=
 =?utf-8?B?WUVFTjA3cFZtMG9UMVRFZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEo4bmNFYWJFQnlEK3g2djFHY2dGS1c2ZFVsVmxqV05udUxqZlhsTmFsQ1p2?=
 =?utf-8?B?V3hyaitHUVMwcmJjbjJ5N2RVdGN3U2RMbjZIMmhPK0FIL09RaC8yb0FwT3Jn?=
 =?utf-8?B?Q1FydG12RlFqM1VlUUJMRmd6K3ZreHROSVlobVJJRU43YTE1ZEc5OWVLdk8z?=
 =?utf-8?B?OVNrY3gzSDIydVVCejVYMnJlVDlWNXc3NzgxSC9xY2pKVFY5YXUwVGZaWHBK?=
 =?utf-8?B?TFphTkh4VGV3aVlkU1NkSlBpc05BRThsVG14WGQzVDJyVUJnNzdoUm9qSU41?=
 =?utf-8?B?RVBkbEh5VnNqQXNnODVmMFpsL1hrL2ZITUxrcFlCMnVIVjFMRUhtNDJPNFA2?=
 =?utf-8?B?TmMzK2ZjcnM0ODNVc0c5eTZmdy9vNzhvemlLQlJzWGUrTGdnUzI2VlRITGlp?=
 =?utf-8?B?YkZDRGsxZGZxcmFHdGR3YUVkM2EzaFl1QUppWlQ0YnlEbEZyekRFWU5yL3RP?=
 =?utf-8?B?YVIxbEdGZFVHaDRHZFJUU3Z2TXF0YURSRjhPV3U0RGpYRnhFSUdhWnEvdzEw?=
 =?utf-8?B?T1ovWkc5R2xmTTNnV2FJTTdPeXUwMVIzZVI4WS9GSnloTS8vQXVZUCtFd3Jw?=
 =?utf-8?B?YWZBSzdIRnZ2cUQ3ZFkzOExXWmE5YlJ2a1ZFOUl3RStDWkhZSnppcEJ3Nk5H?=
 =?utf-8?B?ZXVsMWNxR2s3M3U3Vmt1NWIwelYvakltRmEvSEZmTFZKZFcva0tSQlFpa3hZ?=
 =?utf-8?B?eHZtbHpkd0pnS0pCcjNJVzA3enpIeUk0OWxDTllnSUFqL1doWnFHWERzY0l5?=
 =?utf-8?B?OU5COUR3b1ZvQXdLYi9nWEpQbUZHSHNwbXhGbzFFSGVDRmJTbE0wdFlOcWEr?=
 =?utf-8?B?ZUNjQTNrcHh4MmxjY3F5NEVieVF5UmRNVU83UDZzdm5wN2I4SjJ5K0FtY1Y2?=
 =?utf-8?B?L0NaeHlFaTVuOFZDQ1E4SDJCdklpS2NJRmpDVXFmWGRtSGNVaEJSMmRvK1Bq?=
 =?utf-8?B?TTUrME9JeDJ0TEsrSXdWb0t6OUpKUUdyVnV2VEdZRHlMaWRabFVlbjA5MzVy?=
 =?utf-8?B?ZDZJTjNtaFFMMDIwb0VnWkNPMFk2UVVYaEdmNzZzRVd2SDRrL21RVWlFYlA0?=
 =?utf-8?B?NDY3ZGVVMzYrUmdrL3ZtTU0xM1dGRUZnZnFMS3JPU1BxU1hBUnBkQTk0bnlo?=
 =?utf-8?B?bXlZanlnanlOeGZTbUFYSkZOdXZ3S016cGtCckF6YksrTlUwcjFwZCtxKzJ0?=
 =?utf-8?B?eDlIY2VZRHl0d3JjeGdQMVNnUWFvN0RMS3c3Q3JuWVdnRFdSUWFaSXR1NjF4?=
 =?utf-8?B?TUE5WE0za2ZFTVF1UjFDMzNqN3Rmc052WVQrdkZlcUIrOGVzcmsvZ1pzRlp0?=
 =?utf-8?B?NU9RbUk2VXA0eWh2VXhkbGQ0SmZpS0YrQ0tKUkN3NlpiaG4yeVFnTUhWRnRV?=
 =?utf-8?B?TVJadFpFVGhmS3RGOUNzeFdvZW9HSHlMWmkzdEpQalJET2wxMU52T2Fvblcw?=
 =?utf-8?B?c0NjNTMwMWpGMzdRc1ZlRXlMSUVoVWNKVGhmUGpmOGJzWFU4dmJ3cGhDZExI?=
 =?utf-8?B?U3FpNDhZUjl3VFFwb0g3Ri9QaVU5NFcxWFNZUEdBV0l6eTlpNS8rMG9zdFZn?=
 =?utf-8?B?bUlBTEV1alUzNmdib3ovU1p6R1d3NnZYdDhlSm5yZFIzYkhQajlFSlZqZmdG?=
 =?utf-8?B?Unh5cUFxS042TGpKY2ZXVFFISk0rQTcweWJGaWwxbjFtTlVxNVRTSElkWHVz?=
 =?utf-8?B?akZaV29UeVRFd1Z1YzB0d3BZeWd0ejRpRzlGL3N6QzBrNVRSak9UVlQrTUtt?=
 =?utf-8?B?MmRmVHhTZm9GOU9vM0VwS2ZJbUxFOWhPcmlENllIeDFDRW9oeEo0TGRKQUto?=
 =?utf-8?B?c1h1dndxSVd3WUhLQlVyVkZzZFdVMHpNdmQ4MVR0ZVlJR3kxTXBIUWFIVG8z?=
 =?utf-8?B?ODB6dk1RZWNKNC9hZTV0WitKcFFJNUIyK2tmS3hib0ZDNFozZVF4TCszQ3pW?=
 =?utf-8?B?QzI0d1ZRWVFiOUtEU0FlaFFQcHM2eVBWUFZoSHdDTC81K2VSZHJQNW1jTUdU?=
 =?utf-8?B?aDlWN1VlTVd3VkRjemVDbVIzK2JzbEFFYzVLK0RvMUhzRGppMmxpQmdqYjNv?=
 =?utf-8?B?b0FyM0Q2a2hnOWR0c2ZTczVaT3B3YXE1aVByY3Y5YktxT2tqOGFPZnl4UG1l?=
 =?utf-8?Q?+K8n8uDw09rvzSyOyi9pBX5EE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 693191f4-c171-4192-3517-08dcdbae5dda
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 09:01:53.0724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4n2xPovwAg8nrjiD5oQlPoPDIxNLpd+ni2zDgwOP1y67dvz4+d+Jq4bbnwKDrDFQd2HUkx9Kem/iEQXWiRGfNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8851



On 9/23/2024 14:14, Andy Shevchenko wrote:
> On Mon, Sep 23, 2024 at 01:33:57PM +0530, Shyam Sundar S K wrote:
>> The AMD ASF controller is presented to the operating system as an ACPI
>> device. The AMD ASF driver can use ACPI to obtain information about the
>> ASF controller's attributes, such as the ASF address space and interrupt
>> number, and to handle ASF interrupts.
>>
>> Currently, the piix4 driver assumes that a specific port address is
>> designated for AUX operations. However, with the introduction of ASF, the
>> same port address may also be used by the ASF controller. Therefore, a
>> check needs to be added to ensure that if ASF is advertised and enabled in
>> ACPI, the AUX port should not be configured.
> 
> ...
> 
>> +static int amd_asf_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct amd_asf_dev *asf_dev;
>> +
>> +	asf_dev = devm_kzalloc(dev, sizeof(*asf_dev), GFP_KERNEL);
>> +	if (!asf_dev)
>> +		return dev_err_probe(dev, -ENOMEM, "Failed to allocate memory\n");
>> +
>> +	asf_dev->mmio_cfg.use_mmio = true;
>> +	asf_dev->port_addr = platform_get_resource(pdev, IORESOURCE_IO, 0);
>> +	if (!asf_dev->port_addr)
>> +		return dev_err_probe(dev, -EINVAL, "missing IO resources\n");
>> +
>> +	asf_dev->adap.owner = THIS_MODULE;
> 
>> +	asf_dev->adap.dev.parent = &pdev->dev;
> 
> Now can also be
> 
> 	asf_dev->adap.dev.parent = dev;
> 
> (no need to resend for this only thing, perhaps Andi can amend whilst applying).
> 

OK. Thank you for all the valuable feedback and time in reviewing this
series.

Hi Andi,

Please let me if the series needs a respin if the amend fails for you.

Thanks,
Shyam

>> +	i2c_set_adapdata(&asf_dev->adap, asf_dev);
>> +	snprintf(asf_dev->adap.name, sizeof(asf_dev->adap.name), "AMD ASF adapter");
>> +
>> +	return devm_i2c_add_adapter(dev, &asf_dev->adap);
>> +}
> 

