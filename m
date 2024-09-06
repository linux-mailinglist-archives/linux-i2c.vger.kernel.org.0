Return-Path: <linux-i2c+bounces-6318-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1834B96F540
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 15:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C44F8285C55
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 13:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480E91CEAD1;
	Fri,  6 Sep 2024 13:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LP5EYtB7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD431CEAA2
	for <linux-i2c@vger.kernel.org>; Fri,  6 Sep 2024 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725628861; cv=fail; b=Vpo87rc+W6ONN+cvqjFXyWWmnIFxc3Cnpy0T8qhiu73YadvbZfma/kJMKsSlAP5bO8JvBCBqzncPIQyTSdRBkF491Gvb1sykbfUWyLgfFz4/JEivDPM3ENhJJp2EJsPSLPArPCdXYjC/S5pJMiFU1ZV1aaZFU1ORsJvbq9w5uso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725628861; c=relaxed/simple;
	bh=iktS6c19iPKXV1ou941OupNB0uj0L1TljR8TJvW0Wgk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RJr0Q8hoOGFo2VJ9QGCp2Jtmfw2VsQizC6YoOn0Vv+PeywekkIMbKjHgut7f34xtD7yo+Uo6ad8yjyofQ4M1pqym/Z9qC2hyuqQgc2PJOjkiq+zllctB5l8cTmCjP2nxMADPzLSfuAUkG44TKungczJgnlSYJqAAEFRlPVFaJlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LP5EYtB7; arc=fail smtp.client-ip=40.107.223.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJpTwRfjI4PZ8I2dTjLx9K5kwffMJQddWksY/Oi8Jr+GDgt97LkI2YUg3Qui1QA37xC2ewBqZGoV5KSiWi81UfKrtwHZX/rRbQZfm5L5KDtC97jmI0uU0Z5FIuJ2NtsFn9vaPSlaQdbmVj4eLgbDzpLOPeGjvB0aokRWz97Cig2RBDnLm+jz6V0HaDGQApY+ihkctH/znkYQtu30Oum5YVycmM2hg+5wm5KGTnke62/L+aO8nhZoR0A78KLvpxNkaLrf/TsZ+ddtSuuspOJ0qzLq3lltdXFGp2BgXJGxcVDja+m4+I1LFmFq6AHx/TxMGeUMKAB6l2lxT7lNh5mHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6nJHcmJEzpgWpJZE365+9QPX8B7UKlQ9oNd96L7KfA=;
 b=vWtDRINRf6PCu9gFOL+Gjww9tnGmKwcY5o9XRrTUffgxhHbt6rh6LEzMN9hzE8pt755jUoVIYTaAwN0HVZqH9hOnY4Qpi5EqKSKHYQ8bbD2oFdg3ztF/VrCazGC3h1+2hH7Tk/IVADd5WPaf2+Q+rXTnW7hJX6ubJplltyrH/296kpKisSaRW05pppSN0ljzbQN9MsIq5E8yfIMHnqGm3xGQi0ExEg0WtvMKcujw+BFjDiOvhyyS5nSCZ76k+LXMi9IhuYtJ2MrB//f7CrHsuAujlDCkJYaBCCAfZIuexAfZXFj13AoWwLFQd/1qUJLODp/cvzG7xveT3WhwqQdNvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6nJHcmJEzpgWpJZE365+9QPX8B7UKlQ9oNd96L7KfA=;
 b=LP5EYtB7lQ9b5aTRxXAkPxXizmd+2oDkX49kpg73fZPbBgkuIwrNjN2TbIArkP3MrV1FpAvBlEnPSrCQVPpohe5gI5J3ixwOxXBZZ4SER0cf9EtvXoeYfCKrPAjKR8+dM7JZkE37RxcRb2w9UfB/sUExgD9jSVkK+6jfmgQ6oKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DS0PR12MB7559.namprd12.prod.outlook.com (2603:10b6:8:134::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 13:20:55 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 13:20:55 +0000
Message-ID: <cdc294e7-a78d-4a3e-a2fd-2122a8ea9660@amd.com>
Date: Fri, 6 Sep 2024 18:50:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com
References: <20240906071201.2254354-1-Shyam-sundar.S-k@amd.com>
 <20240906071201.2254354-4-Shyam-sundar.S-k@amd.com>
 <Ztr0alsDWrBodtyv@smile.fi.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <Ztr0alsDWrBodtyv@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0219.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::13) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DS0PR12MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: 2701816e-a4d0-441f-079c-08dcce76bcc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0hDNFUwSTlpSU5xZ0QySUVzQ1BPR01TaUxweTZCdjgrNUhlVnhiRW5xMjdP?=
 =?utf-8?B?SUczVzVLVXBwdGJGUVhBUlRIanMrZ1dxTlplMXN6bzZpRitRTnlQUG5JUUdY?=
 =?utf-8?B?LzZobXdmQTQ4RC9JNEtPVU5PM2tlazFPVlgyZ0IwS0pNOFN2VkxZcWJJanVC?=
 =?utf-8?B?czhscDZuTmtObUFlbktwT2I4V2tteUNjVi9wc0hoY1Fldm04L0c0S21QVlRs?=
 =?utf-8?B?aEVlSU5YNi9TSmxpd1JodnhHS2RYMVZhbTkwL2Fya1lNamhJNlVkRysxaDFn?=
 =?utf-8?B?b3JMTmhBNE5oL2tqL3JDTTBBWmFvZXRnSUcwSDgyM0p6OHVUQWJoa1QzYURI?=
 =?utf-8?B?cGF5aG1LclpWd09RM3hKeTN3NDAwS3E4K3dPVm9LOHNMMUtWZU8zZE9zWS9F?=
 =?utf-8?B?UmNxTHJPbUtNelplSURLMEtuU0wyU0c1eFloS0ZmM1YwWmtVdTV0dEpMU1hG?=
 =?utf-8?B?ellRTkxrTXAyZEhscUJBZC9sYmFvOStxNjR1RVFsM3dpbVVOMDNsUXZoQ2xX?=
 =?utf-8?B?QVJqZ2JnUnBWMm1oajBaQWw2a2l1eCs2aUhObHU3VXEySWZLcFkwSmIvV2ZY?=
 =?utf-8?B?TVpWSFpOa0toREdleWJESHArTkc5dkpNTHJQTDJRZllZNFllZUhFMVU4dDZS?=
 =?utf-8?B?SGdrR3hiRzFuUTdTQ1Z3dUpkdS80L1ZnMURuWlQrYnd3V3VjVWJDeGlVdUhJ?=
 =?utf-8?B?eTJJV1o0RkMyTXhIWUdBUW5LTFZ6Mk53RGh6UXE0WTNZa3UzUCtUOFRrQ3ly?=
 =?utf-8?B?OEIyOXhiMVVoRXpyS2RremJwRFVDUTJsTDZ5Q3U5WWNORlVjaUdLWXRBdlc0?=
 =?utf-8?B?bWZTcHhiVEZ3WXBPRWNLOGVBUnZ4TG1hQmtUb2lCNjVMQi9IWUlPUGhEcGlq?=
 =?utf-8?B?UnpGQ3pvZFZsbGtnY21IK0xVSTZHNXM4Z2NGeDJUcUR1SnFxWW9SQ3lPK2Fu?=
 =?utf-8?B?RDlGN3NPY3FuQys4RTV4QUFuRW1OUWZZcEUyajBWZExIQTRQM1hWYUFNcm5B?=
 =?utf-8?B?d2dlTkNvZHdGR3VCUk1ueFl1V0JYSStIeDhHRVhFUzZSTjE3cmljS2xIY0Zi?=
 =?utf-8?B?SG5YbzRkY0RrckZwdlgzUFhFSlNVN2hBWUVwSExqNzNhYjlVemx0eDJUTTBJ?=
 =?utf-8?B?K3Q4N2pudHBydCtUd2VBc1owRll2SGZHZnpTUXhaOXdGMFBBMTMyWkNtRzVL?=
 =?utf-8?B?cnFSL1MzMlRmaEJxWC91WGhDd013eEFKODdJM21XR2gzV29LNmw2S1N0bmxU?=
 =?utf-8?B?dnpmMDNWd1RjYm1VcXNhT2RLdEFMbDE5aWxQVGVhUkhmTnltQ0lSZG01WDVE?=
 =?utf-8?B?VHlsQ0dHREs2a0hlcU5NODI2WTZyMkdlaHE3MGNONWNjeWpXb0gzTHlWUjZo?=
 =?utf-8?B?K1l3RkZ1TEtVRWxRUjRxZ1EydC9LS05BK09MQmV1Z1Bua1NlNjdBVmw4Y3RP?=
 =?utf-8?B?N3Ruck5FT3ZqdW81N3FFNmVrQVp4NHJmblFGdXhyWnI1MERCYkExU1dsYm9n?=
 =?utf-8?B?b1hDNUNoeUtMcXYzMEZnb1dHNTBJTE1uYWpxSnVMNEYvTEZSWEp2KzJrdjd4?=
 =?utf-8?B?VjBvQld4dEp2TVA5ZFZIUXg3Q3g1NE8wNWZXL3FEUjkxNkdDaVgvSjhzUllw?=
 =?utf-8?B?WGlNK1d4azJnUmluVDk4blNudzJld1MxdFMzT1FQalZwRXpicVlGWXQvMFNM?=
 =?utf-8?B?UzJVU3BTcWlyNHBlSnE5d0xkVWEwSmFVNElGREE4SXdONHhuTjZDZGN5ZjhU?=
 =?utf-8?B?OWZYQVRCRDFGajJSZm5pd2RIdTdiNjM1ZFhSalJkMm9FWWFIVHFwU2lCaDZ0?=
 =?utf-8?B?VlVDNGJBODBzVUZ6ZittQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjMvbk9oWTRNUEdxNDJjY2NJazhxZ2RScCsvUE9USTdyZlVLTUN4a3JvK0NS?=
 =?utf-8?B?NkFZdFArTlh0UGxKNWlxYUtKSnE2U2puY3BGdC9KaTUrZTQrU2Jtd1g0TExk?=
 =?utf-8?B?ZFZtenNDdi9tOURDOE1WcDl6Y0RiRHlTVlczTllIdFdzbWdVaHE0RXp4cDZR?=
 =?utf-8?B?dmxqM05XdlNNbzdnZ21lS1Qxd2hudStpbHJlVXBrODUxdUtlV3g2VXcyNnpM?=
 =?utf-8?B?bkVheG53R0xHQnVoVEFzODhybm03YkZ3cjlCRTlIS2dpSGhqSStTbkpUYlF6?=
 =?utf-8?B?OXZsZ0dadmVBdHUzUFpLS0VYOUpIS2k4YzdzUWVrS1FaUXBrVGhjSDN6WndL?=
 =?utf-8?B?aCswTlhzcWFzT2RQRjR4Wmo5d2VGdExKVEluS0doRlROcjV0OC8wQ3BkMnQx?=
 =?utf-8?B?NGRpVEJ1bmxqckc3Smg0MVJleDg0T1JXODEvN0wrdytZeWVWOGFkTGNkaEZQ?=
 =?utf-8?B?RUZzODJJYk9WU0dKNzdOdDhVL1IyZU5BR08yemFSZTNzNm1tMnpFWEplb1JV?=
 =?utf-8?B?RHRJakZHb214cTFxTkFYWTE2NGFKYTBKRzIzdTNIb1ZjK2VvWmE5b0hCZG1k?=
 =?utf-8?B?ZDFOd0FGbHUrbm5ZWis4R3lYR0tmUDBvc29xME0vcWxqUkhnUFlhTEFSNkFl?=
 =?utf-8?B?YndoNCtSVmhETWxjc3ZhZGVqZnJwY2w2QlM1OUprWEVUeDAyUnRSYXJLL0xp?=
 =?utf-8?B?bTVncTVza2JDQVV4bDZoRDhQV2tCMDZmZDQ2YXc2OHp2bit5NEZDNy9ZVGF6?=
 =?utf-8?B?MEUxTVU4RG9UVnZnV09hczhRTThUcjRmZXBvWmlublYzaEwrVStrWTdLb3lK?=
 =?utf-8?B?WU5JZkNla2dPMTltR2VnaUV6aGVneWJvSXd5N2wzS1dLOG5tRGNHdC9jRVNT?=
 =?utf-8?B?aVpQM3VVQm1GcmxDUW1rbzZTcjdhbUI0R2ladS93VTRiR21IVVpNSFJiOGR1?=
 =?utf-8?B?Y0tiUEVybkQxZmpJV1RDWVhBeXFDME4xS2VJVk90T1NGQmpad3pLdzNjOXBv?=
 =?utf-8?B?cGFEQTVqZEtWRis2L1dZUy80cURLM0NOaHpuYmdYUThuMVl1eUh5bmJISzRm?=
 =?utf-8?B?dTlYa0VvNVdyVnZBQnhvR3dzTEkzZnZ1T1JLL2xBM3kzYTJkNFo5dkd5SjMw?=
 =?utf-8?B?UW1rMiswak01SGRjWEtvcFhZaEE2d2JlU2ZoQVN0dkFZZG9sMW9TUlJkVFBh?=
 =?utf-8?B?K210UFptNDRjTjBLWHFyZjJIMTdlbk5nS1lQMUQ5ekN1UVI0M21vTjcvZGJP?=
 =?utf-8?B?d25kU3ByL3VVOGpaaDRCU0wwelZNVnp2YnRjT3JsbjZJbU1DUE5GRDhPMnBa?=
 =?utf-8?B?S3ZXMzVSUUtuL2lncTVBL3hvM0k4ZUduS1RnYlBRdlBRR2lyKzNFSU5tN0dG?=
 =?utf-8?B?OVpaY2syOGc3SWpHbXVpV2V6OEoxRUxmbUxTY21YQWoyZTVEUXdXRys0THRl?=
 =?utf-8?B?b21QUzRNY1N5UTVibUxxZW9FMTZ5bkpuM1poeWtEL1NuSDJFRWR2N3lJa2Vn?=
 =?utf-8?B?WWdhV21nWkE1cldZZmdTUlB1cC8rOUtLSi82QjVCNXBWYTN6TDBGTVErQ09E?=
 =?utf-8?B?QU5Wbk43L1JXcExxODJsajBCUmdqZEFLSFM1SVFBV2lZQUMxM2pmeStZZW9V?=
 =?utf-8?B?L08wS3ZOckl2VWZsMHdiLzZLYllLMmdBeUlXUlJ0NVNMaFN0bi90bWUxbHFE?=
 =?utf-8?B?UHRmQ3A3RzR1K1c2bEs0VkU4ZTh2MkJKKzBVSVJxeTZ4NzlYSy82d045N215?=
 =?utf-8?B?OS85SkdQOFl3NDUvd2s3S0VZVU9MclUvWDljdGdnV0d2QkdSOHpheWRJOXFW?=
 =?utf-8?B?czZPZEJZcURSMExEczUydFdNN0c4ZTJPTTdmUUM5aFJnSDhZTkVBT3NBeHZt?=
 =?utf-8?B?OFJYL0E0ZEF5blVsbWpKQ0Q5OVJLUkhGeUhxckYxajlMYSszYmhTTDkwNkw4?=
 =?utf-8?B?cmRnNkoycTJtaFdTa3Yzekw0bVBVbVhZcTdlcHZmKzRNWUhoaVQwK2RJMnQv?=
 =?utf-8?B?bVF0OTZ3a3FpK05iS0xXT3JNUU9aL053ZGFpcGM4Q3VtQmJXVTJleHNuNTVH?=
 =?utf-8?B?TzZNNlZicEVWYXNBWmpPdFdKVXZjOXkySXI1dWZRSEZleW9jNnUyd3BJNHlB?=
 =?utf-8?Q?3OdIdPnuTfeniTtrO34hkXCu8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2701816e-a4d0-441f-079c-08dcce76bcc9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 13:20:55.2830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrY7h3GmsZhEZ46UnhqhckV3DaR1lzw4pC5kTGR9DNiVsvUaHq5/6PYoMx9fgt0n2Z7NejYN5O2CrLQ9JzFovQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7559



On 9/6/2024 17:54, Andy Shevchenko wrote:
> On Fri, Sep 06, 2024 at 12:41:59PM +0530, Shyam Sundar S K wrote:
>> The AMD ASF controller is presented to the operating system as an ACPI
>> device. The piix4 driver can obtain the ASF handle through ACPI to
>> retrieve information about the ASF controller's attributes, such as the
>> ASF address space and interrupt number, and to handle ASF interrupts.
> 
> Can you share an excerpt of DSDT to see how it looks like?

Device (ASFC)
{
	...
	
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (ASBB, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
            {
                0x00000014,
            }
            IO (Decode16,
                0x0B20,             // Range Minimum
                0x0B20,             // Range Maximum
                0x00,               // Alignment
                0x20,               // Length
                )
            Memory32Fixed (ReadWrite,
                0xFEC00040,         // Address Base
                0x00000100,         // Address Length
                )
        })
        Return (ASBB) /* \_SB_.ASFC._CRS.ASBB */
    }

	...
}

> 
>> Currently, the piix4 driver assumes that a specific port address is
>> designated for AUX operations. However, with the introduction of ASF, the
>> same port address may also be used by the ASF controller. Therefore, a
>> check needs to be added to ensure that if ASF is advertised and enabled in
>> ACPI, the AUX port is not set up.
> 
>> Additionally, include a 'depends on X86' Kconfig entry for
>> CONFIG_I2C_PIIX4, as the current patch utilizes acpi_dev_get_resources(),
>> which is compiled only when CONFIG_ACPI is enabled, and CONFIG_ACPI
>> depends on CONFIG_X86.
> 
> Yeah, please don't do that. If it requires ACPI, make it clear, there is
> no x86 compile-time dependency.

You mean to say make the dependencies as:

depends on PCI && HAS_IOPORT && ACPI

instead of:

depends on PCI && HAS_IOPORT && X86

> 
> Second issue with this is that now you require entire ACPI machinery for
> the previous cases where it wasn't needed. Imagine an embedded system with
> limited amount of memory for which you require +1Mbyte just for nothing.
> 
> Look how the other do (hint: ifdeffery in the code with stubs).
> 
>> +#define SB800_ASF_ACPI_PATH			"\\_SB.ASFC"
> 
> ...
> 
>> +static void sb800_asf_process_slave(struct work_struct *work)
>> +{
>> +	struct i2c_piix4_adapdata *adapdata =
>> +		container_of(work, struct i2c_piix4_adapdata, work_buf.work);
>> +	unsigned short piix4_smba = adapdata->smba;
>> +	u8 data[SB800_ASF_BLOCK_MAX_BYTES];
> 
>> +	u8 bank, reg, cmd = 0;
> 
> Move cmd assignment into the respective branch of the conditional below, in
> that case it will be closer and more symmetrical.

meaning, make the cmd assignment only in the if() case. Not sure if I
understand your remark completely.

> 
>> +	u8 len, val = 0;
> 
>> +	int i;
> 
> Why signed?
> 
>> +	/* Read slave status register */
>> +	reg = inb_p(ASFSLVSTA);
>> +
>> +	/* Check if no error bits are set in slave status register */
>> +	if (reg & SB800_ASF_ERROR_STATUS) {
>> +		/* Set bank as full */
>> +		reg = reg | GENMASK(3, 2);
>> +		outb_p(reg, ASFDATABNKSEL);
>> +	} else {
>> +		/* Read data bank */
>> +		reg = inb_p(ASFDATABNKSEL);
> 
>> +		bank = (reg & BIT(3)) >> 3;
> 
> Try
> 		bank = (reg & BIT(3)) ? 1 : 0;
> 
> Probably it doesn't affect the code generation, but at least seems cleaner
> to read.
> 
>> +		/* Set read data bank */
>> +		if (bank) {
>> +			reg = reg | BIT(4);
>> +			reg = reg & ~BIT(3);
>> +		} else {
>> +			reg = reg & ~BIT(4);
>> +			reg = reg & ~BIT(2);
>> +		}
>> +
>> +		/* Read command register */
>> +		outb_p(reg, ASFDATABNKSEL);
>> +		cmd = inb_p(ASFINDEX);
>> +		len = inb_p(ASFDATARWPTR);
>> +		for (i = 0; i < len; i++)
>> +			data[i] = inb_p(ASFINDEX);
>> +
>> +		/* Clear data bank status */
>> +		if (bank) {
>> +			reg = reg | BIT(3);
>> +			outb_p(reg, ASFDATABNKSEL);
>> +		} else {
>> +			reg = reg | BIT(2);
>> +			outb_p(reg, ASFDATABNKSEL);
>> +		}
>> +	}
>> +
>> +	outb_p(0, ASFSETDATARDPTR);
>> +	if (cmd & BIT(0))
>> +		return;
>> +
>> +	i2c_slave_event(adapdata->slave, I2C_SLAVE_WRITE_REQUESTED, &val);
>> +	for (i = 0; i < len; i++) {
>> +		val = data[i];
>> +		i2c_slave_event(adapdata->slave, I2C_SLAVE_WRITE_RECEIVED, &val);
>> +	}
>> +	i2c_slave_event(adapdata->slave, I2C_SLAVE_STOP, &val);
>> +}
> 
> ...
> 
>> +static irqreturn_t sb800_asf_irq_handler(int irq, void *ptr)
>> +{
>> +	struct i2c_piix4_adapdata *adapdata = ptr;
>> +	unsigned short piix4_smba = adapdata->smba;
>> +	u8 slave_int = inb_p(ASFSTA);
>> +
>> +	if (slave_int & BIT(6)) {
>> +		/* Slave Interrupt */
>> +		outb_p(slave_int | BIT(6), ASFSTA);
>> +		schedule_delayed_work(&adapdata->work_buf, HZ);
>> +	} else {
>> +		/* Master Interrupt */
> 
> Please, start using inclusive non-offensive terms instead of old 'master/slave'
> terminology. Nowadays it's a part of the standard AFAIU.
> 

OK. I get it ( tried to retain the names as mentioned in the AMD ASF
databook).

Which one would you advise (instead of master/slave)?

Primary/secondary
Controller/Worker
Requester/Responder

> Note, I'm talking only about comments and messages, the APIs is another story
> that should be addressed separately.
> 
>> +		sb800_asf_update_bits(piix4_smba, SB800_ASF_SLV_INTR, SMBHSTSTS, true);
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
> 
> ...
> 
>> +static int sb800_asf_add_adap(struct pci_dev *dev)
>> +{
>> +	struct i2c_piix4_adapdata *adapdata;
>> +	struct resource_entry *rentry;
>> +	struct sb800_asf_data data;
> 
>> +	struct list_head res_list;
> 
> Why not LIST_HEAD(); as it was in the previous version?
> 
>> +	struct acpi_device *adev;
>> +	acpi_status status;
>> +	acpi_handle handle;
>> +	int ret;
> 
>> +	status = acpi_get_handle(NULL, SB800_ASF_ACPI_PATH, &handle);
>> +	if (ACPI_FAILURE(status))
>> +		return -ENODEV;
>> +
>> +	adev = acpi_fetch_acpi_dev(handle);
>> +	if (!adev)
>> +		return -ENODEV;
> 
> This approach I don't like. I would like to see DSDT for that
> as I mentioned above.

I have posted the DSDT. Can you please elaborate your remarks?

> 
>> +	INIT_LIST_HEAD(&res_list);
> 
> See above.
> 
>> +	ret = acpi_dev_get_resources(adev, &res_list, NULL, NULL);
>> +	if (ret < 0) {
> 
>> +		dev_err(&dev->dev, "Error getting ASF ACPI resource: %d\n", ret);
>> +		return ret;
> 
> 		return dev_err_probe(...);

I thought dev_err_probe(...); is called only from the .probe
functions. Is that not the case?

In the current proposed change, sb800_asf_add_adap() gets called from
*_probe().

Or you mean to say, no need for a error print and just do a error return?

if (ret < 0)
	return ret;

Likewise for below remarks on dev_err_probe(...);

Thanks,
Shyam

> 
>> +	}
>> +
>> +	list_for_each_entry(rentry, &res_list, node) {
>> +		switch (resource_type(rentry->res)) {
>> +		case IORESOURCE_IO:
>> +			data.addr = rentry->res->start;
>> +			break;
>> +		case IORESOURCE_IRQ:
>> +			data.irq = rentry->res->start;
>> +			break;
>> +		default:
>> +			dev_warn(&adev->dev, "Invalid ASF resource\n");
>> +			break;
>> +		}
>> +	}
>> +
>> +	acpi_dev_free_resource_list(&res_list);
>> +	ret = piix4_add_adapter(dev, data.addr, SMBUS_ASF, piix4_adapter_count, false, 0,
>> +				piix4_main_port_names_sb800[piix4_adapter_count],
>> +				&piix4_main_adapters[piix4_adapter_count]);
>> +	if (ret) {
>> +		dev_err(&dev->dev, "Failed to add ASF adapter: %d\n", ret);
>> +		return -ENODEV;
> 
> 		return dev_err_probe(...);
> 
>> +	}
>> +
>> +	adapdata = i2c_get_adapdata(piix4_main_adapters[piix4_adapter_count]);
>> +	ret = devm_request_irq(&dev->dev, data.irq, sb800_asf_irq_handler, IRQF_SHARED,
>> +			       "sb800_smbus_asf", adapdata);
>> +	if (ret) {
>> +		dev_err(&dev->dev, "Unable to request irq: %d for use\n", data.irq);
>> +		return ret;
> 
> 		return dev_err_probe(...);
> 
>> +	}
>> +
>> +	INIT_DELAYED_WORK(&adapdata->work_buf, sb800_asf_process_slave);
>> +	adapdata->is_asf = true;
>> +	/* Increment the adapter count by 1 as ASF is added to the list */
>> +	piix4_adapter_count++;
>> +	return 1;
>> +}
> 

