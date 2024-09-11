Return-Path: <linux-i2c+bounces-6557-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F6897514D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 13:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33A96B238A9
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 11:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736E7188019;
	Wed, 11 Sep 2024 11:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G9U73LSP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDBC185B4A
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 11:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055933; cv=fail; b=lLeLvoJvikmumPL5Mfk9iIuJz55uHKU5vpilN9KFzB43Venwnar590/MvP9RDpMfw3ZliRURjaZDPCGcUfatWIRPblW3tnaHYVHWBhRTB5C0gcWDvj+hYkPso1sIl9o2m4IYpZwepUStew33Yq4qnkD99v/SXsYydvoJ4PUjBtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055933; c=relaxed/simple;
	bh=3Y3XFbsb9eJj9xhasJ0wJQ6Ws+1D+5aV+qoubHMLV5s=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gz8Bl8pI1AOS5bXuhuOYWlA2HZDzQsgaFCxpm3vciEH8wyV3jhhfJ0xNv3f8jVGnlHTKRkVuGmaDdetEOGZ4c4b4kZWWCYGxzPA1xTvUG6OdtM2d3DA2LXonZst+58Fy9Hz7LszYEbjgwAXv2MGjO2JkEL7A7GZvwcVG4mnr8vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G9U73LSP; arc=fail smtp.client-ip=40.107.220.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dezrd797kFsA8XoUPYlxzznkZdFhRMtFQzCoxdXGC7pI3LhgLhuYuaGrkt0sqyGbbsgsEY31/SrIIgs9Muo36Au2YhfcVO1aOqsUjmuIK2LPiLwf6evjrBYyJMy0Ni2vkUiE2EOMl5sNUQL8lzXkOYhIz/+tVHT6xkIaykJqTZlWeQtrII4mFc0Md3mkrk5gcachFTrN4Y9YNmyqaJ15ZFwWpDjOmkni1knMA7HYRt6QzMU18OLcgqb/NASa5N3UyfQR89mshES6l4q/lC3w5XuwD6XS3LyAp6tp8SwRkPdZygh46OT3E1UjX4IaPARoOj7tc/uWpXeooyzQRFHNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HvCQ2WNLHpfHoVFtHfBcNukUZN4Vk3blFAWIhQ6CWw=;
 b=eEEf2phuXrLJzeHxBFRPq2U/5rvz3M4nVkGYc742P5A4/u2HccOXZwwnU17cWp/soV5lQtfU6ZT3WOVvCxtp//H/OlbjNS0IucE3BdOh2a/tprKo7Qrb/1c4jJLag38cJibUwEgdoptNibwuRoSb96drMBWu5klNXJ9XnukOBt8jGYuB7xw8yEXFJMHJFAcpeWY2oA1BED44tSbmF+Obf/hrGVY9W+RgoQlSoxjSSX4sAP1hkUWIv9gUBaho2fQZg8IUxIMKOlGWUp0L3nijajElB2k2hGrfgf0ikAm16vxhP/OdkVbuQJV+zZ+iVwrQQ+zaxQJvfKVO5mIQRyp/RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HvCQ2WNLHpfHoVFtHfBcNukUZN4Vk3blFAWIhQ6CWw=;
 b=G9U73LSPy5h7O2uRGot+pBcE/tGcXxseCviDvrnWDouNk1/DOtmci7/3i9s0HDorNaKL/c7j1yoeNE3VTVSHIxXoJ+i+iJ9Aj5wwXPSQgcH2ZelYl1010PrmklIGxoDYjthuaqfPlurNYIKtxG6KBhuA9YcYM1O3e9sdQgHDStA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM4PR12MB6278.namprd12.prod.outlook.com (2603:10b6:8:a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Wed, 11 Sep
 2024 11:58:48 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%7]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 11:58:48 +0000
Message-ID: <ae1fa5ab-37ae-41cb-957f-085be7eb8d78@amd.com>
Date: Wed, 11 Sep 2024 17:28:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com
References: <20240906071201.2254354-1-Shyam-sundar.S-k@amd.com>
 <20240906071201.2254354-4-Shyam-sundar.S-k@amd.com>
 <Ztr0alsDWrBodtyv@smile.fi.intel.com>
 <cdc294e7-a78d-4a3e-a2fd-2122a8ea9660@amd.com>
 <ZtsUZfxeE8Tqf1OD@smile.fi.intel.com>
 <a4525896-8eba-4927-bb18-fcba1432f0e0@amd.com>
 <Ztsn8ZqWjY1P3qws@smile.fi.intel.com>
 <6a671a3b-d3fc-4a96-acf0-4c12a813fd1e@amd.com>
In-Reply-To: <6a671a3b-d3fc-4a96-acf0-4c12a813fd1e@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM4PR12MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7e0abe-dee1-458f-a4f1-08dcd25910da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NU1lS0prMHNOVWhsUXc0eHpYbWlBaDZxMHA0cDYwTTZhL080UUpOdFF3cjNm?=
 =?utf-8?B?U1o4T0ZTamRLdTM5MlpRN1M0VVNoL0pWaDEvRDN1MS81dUdlU25WMlQzSER4?=
 =?utf-8?B?eUtMUTNzRDhKVTUxdWN4NWlEYXAwZkxaNnRodEFvQXRHR29Ubzg2YVFENjlx?=
 =?utf-8?B?L0RIbFVib1NZODQwTnRBMitudWYzbWtvUWZ4T3B1Z0VaZjdLRktZM0hnQzVS?=
 =?utf-8?B?RncrVGxvQWdQalVYVlZOamZVblNpZEVyay9KQS9ualprQ3c0TXlzbTlqSlVS?=
 =?utf-8?B?L1lHTjFxSFJLOTllSHRPQm5ZVkV1S2FIbGtIb2NPQmd1bUY1VEJGSXRsTE5i?=
 =?utf-8?B?dkJwdGZXSlBLaWtOc1p0azRyMElqcWhEQWlJV0VNSWZFcmFFcy9sZ1JWRlBO?=
 =?utf-8?B?bGNhZnM1THVOUm41cElnMlpxNmdMTWF2NTgvSCtPaFJDNXdybHhsVVpGNXZB?=
 =?utf-8?B?aTRKK211VjREcmhmdHV6cTNBbVdBWmJobVpsOFYyS0c4aUdJQ29kVHlOek9E?=
 =?utf-8?B?WWFFQzhBakJ0Q0M4WFpWWE56MnlXdWRzUWFBWlBHUloxTWRaNXh3OTdqT2lC?=
 =?utf-8?B?TFhkdzZEVVprUjNtcjhKcHROZXFXRnBXWnc0KzkwTWJMMGtveVdVeDZPZS9X?=
 =?utf-8?B?bEFLWGdFVWR2UjVhWWs4MTFUN0I2bklWWW5tdTJUTWx5QzhoaE1wZG5YSFJQ?=
 =?utf-8?B?SVNoYXl4NzhBVlhHaGdQc2VoTlhYM3htaFUxMG0zcHgzeDhzQ1lQajU5bzdH?=
 =?utf-8?B?d0J4N3V6ak93cElFeGpXUTlyakJyWE1XUSsyWXZSTGk0UWdnbFNyTWZ3UlhJ?=
 =?utf-8?B?dEU4MlBKVVBoVGFwcWJ5ZGhYWFEzVkdaRHJPZ2NOcG43ZWc1TlJRc3BmL3Y3?=
 =?utf-8?B?dGRyZmtKSUhya0RBdjNoZkRlaTZkR0JUT0JhbnhoTGpVN0k5RkJ3anZ1UEJu?=
 =?utf-8?B?RmpPZTRidU1XcCt3R2ZSaDZuU1g2eTluYjRkUWQ3NmpOUllod0cvVC9vZEFw?=
 =?utf-8?B?SEN0Qkh6Znk2OC84czlIUmFFNG9XdExNYk5nRDZTR2lQSDVENFovaEZuYlFh?=
 =?utf-8?B?U3oxZXEzVDNYTnJFMkdDUmVBMWwwakpERWFuNjRCekhiNnZ3S2h2SVBDZmtY?=
 =?utf-8?B?dGlHRlRCMUR1VkZwN0JTUmNkOXhFSnE4Zk5wbWszbFRDZVNPSTFaRFo3dU9X?=
 =?utf-8?B?eFdtdUFWb0w4cm90NTVJb05iajllWi82bGxmZlpkVVcrR1VBcGF1UTdrQ0Q4?=
 =?utf-8?B?Ny9ITmJ2L3k5ZThhaVh0R2MyYWFTd1RKVU1HN0loWDFLRnVDelhGbXBzbkRX?=
 =?utf-8?B?R2g0K0VsbXdMSmRRemUwWjVuYjVnT0JBQkh0MXBXN2JxcldXNlpwaEc1b2l2?=
 =?utf-8?B?ZDEyVkQ1SlJYN00xTHFkWmV6YkVmS3hmc2NwZnJMQ2xSRGp1dW90WE03K3dT?=
 =?utf-8?B?MmR4ZStWTlZUVWcrTlFrR21KR2N3aUVhVHViR01aSFMzU2xHVUVscDVWSW9m?=
 =?utf-8?B?UzZaenJIR2NrSU1xVkwxMmRJK2R6K0lBQ0NId2dPaW9jTURBSDIxVDBWOVhE?=
 =?utf-8?B?OFZvalZDaG1qbXpGcFlKYWRTeUR6VGVzL3cramlQL3JSQjlpK0lFaGpoZEdw?=
 =?utf-8?B?Q0p4c255R3I4V0hrczJydENKUXJsQkVtZmp6MzFMQ0RDMTE1TWxXOXczT3Bx?=
 =?utf-8?B?NlRqQnpDbmlVVHF0aUZ4OEltMmk4Uk9kQ1FZd1JnWjU2eWVhR2R0UENsNFpS?=
 =?utf-8?B?K3FFalhzd2pBQy92QzI4ZllnYlZUUElVRFErWEVLWnhKYTllenR3MGl0bmJH?=
 =?utf-8?B?cXJ0ay9uUG9nYXZodWVPUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUFQMi81eThYakxtZmhZVmFITVp1SmxlUlhPdGhQeGVhWGVvUGVaMGZnMi9h?=
 =?utf-8?B?MUFhT2t0OVk3OXZqelNtOGhYUmVJRUdVM24zRVIzSkh0ZGVqSktFaHVtUFR6?=
 =?utf-8?B?UWFQdkxnTXVpWnhoVzhaeGtKaituc1BMcm14Y2xTZTVhUXRCTno2NmVqNXc1?=
 =?utf-8?B?N3hpcE9taE9jY28zbHNzU0Y5YWtISjNPcVlsa3BsRi9wdWZrdTdCdjFjM3p5?=
 =?utf-8?B?SnljdlV4azdWUHIvOThmaEFoME1oZGMvbFVUTVlJZnBrT1FMMVh6aUhsWmFt?=
 =?utf-8?B?VmxtV2Uvc1c4SVNGT3czSWRkOUhCeXpSMCtrYzkramJWVVh2ZXpTV0VON0VM?=
 =?utf-8?B?SkdtMmVmMDUxRTBpUllabGZPOENqUE5aWjNZZVZUS3pqWEJ1ODJWWTRxNWF5?=
 =?utf-8?B?N0ZOZ1NBR1ZSN0RzMGxKRW00RDhvRHRRTGtBaDRncW9DRVVaMXFmWGc2dUVj?=
 =?utf-8?B?Q0orRmpBUEtkc2UrZG54Rk41cms0ZUNqWEg3YTFFeDBKY083NWNMSmo5ZHdQ?=
 =?utf-8?B?a0JvZ3RkZnJHVXdYTzJNTFAyaTlrT0I1NURUb0Nwb3lKU3J2MW5pK0dSQmNY?=
 =?utf-8?B?MEZ3VmhHNFNSdFhFRDU3dWJCbUZXZnRteUNjMzJsQ3lZY0pwLzZ6OW5jSEt6?=
 =?utf-8?B?bHJGNnZJMzRYeE00WFIwYnpQVVptTkF2K0RaWVZxUlhnQXkwNklWVG9BRnZ5?=
 =?utf-8?B?YnNnQVJyemhhYjVXdjlublRmWnZIUWNkUktza0RpaVI1M3BWWEJ2N2VYZEtq?=
 =?utf-8?B?RHh6LzBaSFk5cjNtWDNIbHVsWmE2eE9ObkhNQnphWmgxV3JzVzQrRyswS2Qx?=
 =?utf-8?B?ano0Wkh1aUQzQzVYUlFNMEFPeHRzVXNCbWZYSzhsWXlJUTVrcGxJdkU5cjlI?=
 =?utf-8?B?QmJlOXdQdGtZQkdLdzR2bXE3ZGlxOHNwRDZHcWpaT2lTSkd3NTE3Vk0wemFI?=
 =?utf-8?B?cWZzbnJIV2l5MzhYOHc2Mk5uUzlxU2p2dWhDYTVOTCs5UTk1bFJCUXlZSjhw?=
 =?utf-8?B?TUFvZzNvdFlMNElmbmpoTk54dDE1WnE5QXZlOThuZjRRTVpHVDRQQVAxaGw3?=
 =?utf-8?B?Zm5TNFhoaktTVXF0VThQVGV1MENsOXRsYW40eDlkM09YNWlkTk5UTjRUaDg5?=
 =?utf-8?B?WHVpcGJPU1FRb2o4blIxRlU3UTJ4K1o4dVFlenFZUldiTWZvRU90Q0Zzdjd6?=
 =?utf-8?B?a2FBam9VTVFmZGtkNmZVZ2N0VG1XVVlSUENWb0Q3a3FrSDEybmw0SS9POUI4?=
 =?utf-8?B?WVZvTTYvM2RFcEFJaE9mV2JCSlNSeDc2V2d6SUZjWUNzYnBZU0NOTW5zSjRm?=
 =?utf-8?B?WXV0ZGVTS1p4NnpTSVliMU5jN0RlOEdtUTJveUFHQzNhZWdEQnliNGtwUGtp?=
 =?utf-8?B?dE9Zb1R5ZWd6RlNIdllQY0Q4R3hoSHVhNjFOYUlpMGNwb3lWWENpV2NwSE95?=
 =?utf-8?B?dStmSTVQRWRlSXpIcFlZMU4rbCtjWWRWbndrUndKVnhTNDBzSTUrUkZ5Tk5F?=
 =?utf-8?B?dVlJVjFncldNMEE2NHJzemxVZkdXZGh5MHB5VG9sczYzMC9RKzVSRTFPL2lB?=
 =?utf-8?B?Q09JODExL014STkrRDNIWWFEZExsc0FLNXk2aHU4RU10WU9BOHY5eFFKZGNy?=
 =?utf-8?B?ZjVhVlVKK0oyQjZXUzRia1dMUnJxRW8yZVpBMU5SUXZqUm5KUkNMRkZpd0VP?=
 =?utf-8?B?YUh0RG1GUnZQR1BHRTJTM01xQm5KOFdIaFVCR3IyY3N3OElBbkRCVEEzUDc3?=
 =?utf-8?B?R1d2NWp1MmdJTEtqRnpUMGdTRHBib1JRRCtobzkyTzBKTXZhNVhKUFB6cTJL?=
 =?utf-8?B?amZGc3FhbWs2bFMxZHVxQmhNMHJyeTV0anI1MmRKb0ZNYXRVMWhkZkxSWjBz?=
 =?utf-8?B?eUdQWFZpNGVpaFlPbVIyWkZsTyt2Qkt0MFVNcm9MTkhxOFZiWkFINHVwLzMr?=
 =?utf-8?B?dWlFWjMvZWdVUm1ZM1BobzVrcE5LZGFhZ2hqWTQ0M0ZFOURRQml5MG53WkdT?=
 =?utf-8?B?TXJoUFZ6OWNDa2dDK1hCbkptKy9LZmd5ZVhpQW5pUTNZeDVPeWI5Vm1veGEx?=
 =?utf-8?B?N1dOWUgxcHdVWk54eWQvQmY5aXZZYWlSTDI5bDBCUGpocVdTL1RnTzFFcjRv?=
 =?utf-8?Q?nNn367BgMxZazzpHJ3o2KLnxG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7e0abe-dee1-458f-a4f1-08dcd25910da
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 11:58:48.5272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMICwxo8JAHyYn1D7EJIdQrdBwVNGH7ORgtdaj5RS6GJ5XDSha3S10miXkaBmtXI/06RnmvbCq/Mfr3KfnPZOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6278



On 9/7/2024 00:21, Shyam Sundar S K wrote:
> 
> 
> On 9/6/2024 21:34, Andy Shevchenko wrote:
>> On Fri, Sep 06, 2024 at 08:41:19PM +0530, Shyam Sundar S K wrote:
>>> On 9/6/2024 20:10, Andy Shevchenko wrote:
>>>> On Fri, Sep 06, 2024 at 06:50:48PM +0530, Shyam Sundar S K wrote:
>>>>> On 9/6/2024 17:54, Andy Shevchenko wrote:
>>>>>> On Fri, Sep 06, 2024 at 12:41:59PM +0530, Shyam Sundar S K wrote:
>>
>> ...
>>
>>>>>>> The AMD ASF controller is presented to the operating system as an ACPI
>>>>>>> device. The piix4 driver can obtain the ASF handle through ACPI to
>>>>>>> retrieve information about the ASF controller's attributes, such as the
>>>>>>> ASF address space and interrupt number, and to handle ASF interrupts.
>>>>>>
>>>>>> Can you share an excerpt of DSDT to see how it looks like?
>>>>>
>>>>> Device (ASFC)
>>>>> {
>>>>> 	...
>>>>
>>>> Can you put the necessary bits for the enumeration (you may replace some IDs if
>>>> they are not public yet to something like XX..XX or xx..xx)?
>>>
>>> Name (_HID, "AMDIXXXX")  // _HID: Hardware ID
>>> Name (_UID, Zero)  // _UID: Unique ID
>>
>> Thank you!
>>
>> Now a question, why your case can't have a separate (platform) device driver?
> 
> I evaluated this approach before proposing the change, considering the
> option of creating a separate platform driver, which is relatively
> easier to implement.
> 
> However, there are a couple of important points to note:
> 
> - ASF is a subset of SMBus. If a system has 3 SMBus ports, this change
> would allow one of the ports to handle ASF operations.
> 
> - In the current i2c_piix4 driver, the assumption is that the port
> address 0xb20 is designated for auxiliary operations, but this same
> port can also be used for ASF. This could lead to a scenario of port
> collision. I tried to highlight this in the commit message, and you
> can see some dance in piix4_probe().
> 
> - As a result, users might encounter an error on platforms that
> support ASF: "SMBus region 0x%x already in use!"
> 
> This is why I believe it would be more meaningful to integrate the ASF
> changes into the SMBus driver.

Andy, I posted a new version. Can you please take a look. This has a
separate _HID driver for ASF now with piix4 as library.

Thanks,
Shyam

> 
> Thoughts..?
> 
> Thanks,
> Shyam
> 
>>
>>>>>     Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>>>>>     {
>>>>>         Name (ASBB, ResourceTemplate ()
>>>>>         {
>>>>>             Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
>>>>>             {
>>>>>                 0x00000014,
>>>>>             }
>>>>>             IO (Decode16,
>>>>>                 0x0B20,             // Range Minimum
>>>>>                 0x0B20,             // Range Maximum
>>>>
>>>> Typo in value? Shouldn't this be 0x0b3f?
>>>
>>> Its is 0xb20, that is meant for ASF.
>>
>> Yes, I mixed up IO() vs. Memory*() resource. The IO() has two values for
>> the start address and you fixed that to the above mentioned value.
>>
>> TL;DR: this looks okay.
>>
>>>>>                 0x00,               // Alignment
>>>>>                 0x20,               // Length
>>>>>                 )
>>>>>             Memory32Fixed (ReadWrite,
>>>>>                 0xFEC00040,         // Address Base
>>>>>                 0x00000100,         // Address Length
>>>>>                 )
>>>>>         })
>>>>>         Return (ASBB) /* \_SB_.ASFC._CRS.ASBB */
>>>>>     }
>>>>> 	...
>>>>> }
>>
>> ...
>>
>>>>>>> +	status = acpi_get_handle(NULL, SB800_ASF_ACPI_PATH, &handle);
>>>>>>> +	if (ACPI_FAILURE(status))
>>>>>>> +		return -ENODEV;
>>>>>>> +
>>>>>>> +	adev = acpi_fetch_acpi_dev(handle);
>>>>>>> +	if (!adev)
>>>>>>> +		return -ENODEV;
>>>>>>
>>>>>> This approach I don't like. I would like to see DSDT for that
>>>>>> as I mentioned above.
>>>>>
>>>>> I have posted the DSDT. Can you please elaborate your remarks?
>>>>
>>>> Not that parts that affect this...
>>>
>>> Alright, I have posted the _HID enumeration details above. Please let
>>> me know if using acpi_fetch_acpi_dev() is acceptable or if there's a
>>> better alternative.
>>
>>> I am open to making changes based on these clarifications.
>>
>> Since you have a proper Device object in ACPI, it seems to me that you should
>> do other way around, i.e. having a platform device driver for this ACPI device
>> (based on _HID) and use piix4 as a library for it.
>>

