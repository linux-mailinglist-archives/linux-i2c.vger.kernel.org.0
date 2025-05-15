Return-Path: <linux-i2c+bounces-10992-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C00AB7A54
	for <lists+linux-i2c@lfdr.de>; Thu, 15 May 2025 02:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB76C7A37CC
	for <lists+linux-i2c@lfdr.de>; Thu, 15 May 2025 00:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF9033E7;
	Thu, 15 May 2025 00:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="baCfs1Tf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010009.outbound.protection.outlook.com [52.103.68.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647AA10E3;
	Thu, 15 May 2025 00:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747267418; cv=fail; b=TDAIw3iY7B1IDhgdHMW61Xadpp4GOvQ2iqS8+Xu9HKRHeRhdxIQ5U5M8U40NwI89mhdwh24AgMUxJZwdoX5l1Sumti0xM+E91MDzNs2Y9I/XIguuHQKbNdkDlM7aMz3Rlw6bqcHihQlGuwv/jUcpu0VmTqkIkMTlo9rR5UTg6iA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747267418; c=relaxed/simple;
	bh=75Ug1xlnmSAfi4u7MqBcZT3i04RGVCncoLtlw3bIdbI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TpN29361+nOpF6uC1eIltdHWCLoUuhn5tNxs3nkJrksZtbZ31p5KGj4r25d57pus+KfDvk6jeRhHZKOkWobytJf0SCrdxKVcugHsIq8663miCEvUAg297KZambOosxAKUcdd9aJ7V/1cjX4FBIaszRcxIbyGYArGiw/JnXkcOwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=baCfs1Tf; arc=fail smtp.client-ip=52.103.68.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAMlKBZ1KwVilGHAR9/XZGX6qLkE+y33RnTwACcozdWwNLYqRTPmIC+KY1VTO3L44FKqgGJABOvgmIG/A1pczxaCnjbVACKhU4O/8XgYr8o8MazGtuh03gDIVZoKzNuit09DZHwfCuwqKDCyXIYGuBVojsbfq5tjWUTM0/UqLc4PMJ/0/bLLUU3biu8HLZ+rmGZP3QX4ipi6OriyUujuKMPEk0K7MFuJe4cRaTminlAphSqD0RPIv9eXqJGtcBd6bVYxuBLWfj+uT9fvV2uNudoCeSAoAhjVQipCy7AjWaV0EYdbGlkGEMUww2eah6qjDNFnwb6G/BEPg1rH3VDSkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1kXJLed8108yXDUW+d0MIhE8HONk53CeM8yQyJ4dZc=;
 b=N8WxSpvXC6vLI0cKRFtQMGlPAFsJtJkqLugXw1DplA3mrN9ByOwCLreDsf+90S9PoXUJ5KngSTLa99ebQWHYybHF7b9Bnd0oQmlMyGFkPB0GnJ52t7xt++QisppTf7T+v/h+aIESGtbt1a2spdjCgpLgrU2l5kHp8nKrvSgp2sOgqm8VbB6gEb2i6Q4WjC9h4IQLeXzFCY418oFxTzSxoNIldiNo5+VlZzshoBkCnwrlVRODa/7fjMIb2Zgafdjes4D30V27j5/nelBdtvSQidhnfUjyWxM/kiSVvj6bdcb0ROuiHlNT4kH8VgW/DHTnWv6KhHuD5nrjnZJXX4CskQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1kXJLed8108yXDUW+d0MIhE8HONk53CeM8yQyJ4dZc=;
 b=baCfs1Tfh/ioDXobK1yH3QoROMysac59Mxcq/jRckOsXR4FtynVLhzLYrWeIYt6gsehrFAjnzuQCJwmGStcJVBjScC0zJ24DhkkzwY9YizEwSnlcSB27EwzP5plD37u6RsUHo9zTPjxFSteCsrBPhhHWE+9TlqJKvSlUwTQ0qPJW3Gu0T0nPEfECs7/lxmTmMx8TvBi6gNieKhQwUixKfY26wswjOIsTElmuotZw9BOFxhFgAIfZmwxoe3p2YpiTGcInYXMER47JtDdSDW9w/l3tPyLCg8Lw2plf1Dn7hQqI+SPnoQh4l0lqlBVUdfAfk2uWueR0ycfpYkB3C4lZuw==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN3P287MB2154.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 00:03:25 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 00:03:25 +0000
Message-ID:
 <MA0P287MB2262A447A98778BF4BC3DB2BFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 15 May 2025 08:03:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Inochi Amaoto <inochiama@gmail.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, ghost
 <2990955050@qq.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-2-inochiama@gmail.com>
 <aCSmNRTVXQ51xj0m@mai.linaro.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <aCSmNRTVXQ51xj0m@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <2f8587c7-ac55-46a3-b89f-a48dd6d23edd@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN3P287MB2154:EE_
X-MS-Office365-Filtering-Correlation-Id: 93aab453-f537-4a42-65f3-08dd9343e9cd
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799006|6090799003|8060799009|7092599006|461199028|15080799009|5072599009|1602099012|440099028|4302099013|3412199025|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXdRYzBMS0tYRkJmYXpBVGx6eTdEU0Rqd0h5MS82UTZqRUowUTQ2WVhlajRE?=
 =?utf-8?B?Ym0zbHFmYXg2WUp1QWp1VFVRQ1FQWDk5cXk3aXVEVENoMlArSzBkWm9pbzda?=
 =?utf-8?B?bmNQSWRjTE5pcEM3TE5TWW8ycEVDL0tPU2E4MlpWNEp1VW1yVE1sNXBsWUtv?=
 =?utf-8?B?dzBKWUo3c3hwZTRRb0NMZWhFSGxnd0JLT2xaNU10dHRBcnFLaFhaTGkwdDR2?=
 =?utf-8?B?SGEzN2ZVd00zc2lGK0ptV2R0ZEZPUTE5TS9TTkRPS0NTa3dkQW9PdmtxaSty?=
 =?utf-8?B?WU9JYVRuRU41dmpOSmlwYlhLQlR1cjdUV2JJZjU3Sks4cElrMy9NdWMvZ0dj?=
 =?utf-8?B?aEZxMDZvY3FDMU5mRFZtTEIxUElrdHRWKzdsTHZDYVRGTW5rVkJZRnl5aFlm?=
 =?utf-8?B?dFo3WnB4M3ozdGVHTnZoeGJKRXlnUmJSZXdUTmRFb3pxLy94enNCK0I4RGtz?=
 =?utf-8?B?bGV4WlBtZmxaN2V5enZNRXo4M1pYaFIzaTUwYVhqcmlHYnM2aWZpQS9NVXhk?=
 =?utf-8?B?VUUxTTFwRWhVSUlpQm96dkttVmM4TGJwcG9qNDF4OWd3OWE0blFiK3dNZjZ5?=
 =?utf-8?B?YzRxU0JGMDgzS1NRdTNOSXB1dDBuR3RncmlRd0xNTDJyaTRSMDdqRTFsOEdB?=
 =?utf-8?B?bkJtWFNjcFpjNzR0K1U2VEFDRTMxUzNVVkNBYkVPRzhvMTcvWjhHUlBwWHhT?=
 =?utf-8?B?S1VVamZBNm5hc3l1MXRVeSszU0cvaEtjdmlBam5nQ1JIcXMvd1dNU0lnWnlm?=
 =?utf-8?B?c21VMlFIcDB4ZWNVTXRPMGRTZ3lLbmppRk9FOVdLOXBwOXFpV2ZvbWhubEVE?=
 =?utf-8?B?L3BqOHdOWGZSOXcwZjB2TDRpTUd0TVhGcHJnYXU0UnJwRVgxNVVMVllhUXJa?=
 =?utf-8?B?VmhiY052cXowMXFEMmExclRmQlJydDhRVDE4MVRmc2ZIdS8rWGNyOEk1RXVn?=
 =?utf-8?B?R2NWbFBsbEJwZHVnaXFKZWtETHQ4R3V6MG96VUt6emM1SThkQ2hmQkxjWGJB?=
 =?utf-8?B?ZHp5SmVUM0taWHQxalpaN1JNSllpZkdqY1U5VU9Xb29jY0xZc0VzU3pwU09W?=
 =?utf-8?B?RnZFblF1bjBMaUxtbTV1NWtyZ2hnY296RWZQTUVSbmtHcnNhTU5wQy8zQzBD?=
 =?utf-8?B?REZPUTdZN0dUaHNxUWZuWVZxa3lnRU9WNUVhTzU5SDV5bGxhaXZoM3dmRFht?=
 =?utf-8?B?akxOVU56blk4TUp4TUd5UDVMcjFFNml6ZnBxcExyWnVmOXlsS3ozR2QxSnhI?=
 =?utf-8?B?b2U4MzNCMXBYMkpQVUNJcE9DK2hvWWdYOGY5NXU3QkJmU2ZUWmNubnI2bFFa?=
 =?utf-8?B?U2RVN3pHRWRhUm05aUJBSlhKdStTRTdPb2ZyYVRUKzY2T0l6d1VsMmxGZ1Zk?=
 =?utf-8?B?OC9JbWNkOFc5V2xlRlNDUWRtSDVzemJnVGhsYVRWTlAvYXFiR3NwR3Jtc2c2?=
 =?utf-8?B?bjZWS1ZKMGdmK3I5ZitEQTl5NmdFeTd1aGNRNFo3SFlpakoxOWZiQnhKbE9U?=
 =?utf-8?B?cDdZSEF2bHBxK1FqamdKNG51d3VSVjMvOGlyR0JOeUV4VXg2aGxpQm1NU05j?=
 =?utf-8?B?UjErem50elBpSjdUbU91NzlPc3Y4ZHRWQTlzV2RvSndPd0pqNS9tZ1JRWWxT?=
 =?utf-8?B?N2RweElETUJXZW9QeFhxN1ZheHpiK204cDZwSDJqL1lrclN1SCtBSy9Oc3ZS?=
 =?utf-8?B?K3NuWUpDSmZzUG0zNEhnMEl4RGZlTE12SGxIaDVjNnhNUmEybE93VjBnPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFRSaDd3OXRNS2JENFQwUnZNZXZMMW1xVWErZFZYVldYQXAvM09hQmN2TXBZ?=
 =?utf-8?B?V21Wbkh4a3FKcy91dEdVMjgzZzVyZGRTUnMzNVVTMWp2ai9DRG1JQkgzOFZL?=
 =?utf-8?B?Qk9udlhYWm45RW9VbGRnaXZlT04vMnBRTzM4TGdmMWlYVDdXMDltMEVxWFNX?=
 =?utf-8?B?WlI5ZnZVbkZRSW5UVEZqUkpyOExGcGY3T01heXp1SU96SWxXdnp4UDFiNkti?=
 =?utf-8?B?U0psSHJrMldnMHc5MGkrbG5NQ1lxdG16RGozRUxSbjhKcWc1VktKeG9uUG1p?=
 =?utf-8?B?R1pFVE5YNm5FdnVsNllTZFhXbzk2bTJidWVUUE1OUk9vQVlDSEtPVmhST0Yz?=
 =?utf-8?B?ZkNicmVENjArRHV3NnhIK0hEQ3B5a05lTm9JT1docWlaakNaQ1VmeU5ucncz?=
 =?utf-8?B?Y3NxbzlHMVRtdmJXYWxnd3Y0a3ZoZlIrcVJ0RzRoOTVOS3JRWklkZWNxUzVo?=
 =?utf-8?B?cTFISjhMdzdoamhBbTNPYVBTdHdQUWxaMndRTUVWWHVMNDZQT0o4SFV2c1Vo?=
 =?utf-8?B?YlBJQld2WmJhdVhpVityZUVEenpvMWlWWitLL3JaUXFVTTR3aCt4NTM2RUcx?=
 =?utf-8?B?YzNkYit3R3RNK0hNK1lXK3VaaVJKSEU1VlBYdlpTYVM1S2dhbVMyL0JoZVV3?=
 =?utf-8?B?Nk0rUmJqZWZHQ2JneE1FTWFZYzhMNFpqZnJTdUkvWXVBUHRoTjhJVm5yUzNk?=
 =?utf-8?B?M3lWRVNDTzBhcEd2Vmh3MzlMRVpBVHJ5dDJQTndPV2hlQWVqdGFGdmpERzhY?=
 =?utf-8?B?eXRiNVB5Ry9tdUFQeTgyekQ2enpXc0U5WVVMVFdWVE9aWnhhTzFDZDNkcmlE?=
 =?utf-8?B?L0JweUJRYnVzSnNJS0VNdmNNdW9hMEIwUmNEaG1oaDJ0V0IreU5IYjNkUEdQ?=
 =?utf-8?B?di9IRUcvcE1aYUtLWWdHbVdSOThFNnVhdTJ4SkVDSThVN2VKTTJGcEtUeXVr?=
 =?utf-8?B?dmVOQnQrZXpnbmtIZytlWmFIUGRrRitQVStDL1BBeHpyTlVyY3hqTTVaNlJh?=
 =?utf-8?B?TEtQTGllS1dEVjErbWhpSlpiOFVFYUFGQ285MzBUWC9LQnZMMFh0OEtvN0d2?=
 =?utf-8?B?R3czeVdNODJzRE92Z05IeWd0bGoxNURDSWh4SDBSWFBVeHNaelRMYmNMamdH?=
 =?utf-8?B?OWpnL0tGNm5USWFXQ2FOVXl0VTNUN0xQcTFuTjBTdDJRa0VZYjZKVkJCVW9D?=
 =?utf-8?B?UUNqWjc2Qmo4ZDFPREY4dS9GYW91V0hpSFMwWStFTGwzWU9Oc09FdTYvTVNn?=
 =?utf-8?B?WkJSSE9NcUgrRTgwUU9YcFBJWlRNK0ZyYml1ajQzaGU3OEVaUDVxNnRqMzhB?=
 =?utf-8?B?cjZqMWhUYWo3Tk1sZHFTU2dHaXF0YlExTHB6VTdnMFZCR1V3cndLWEkvbVFB?=
 =?utf-8?B?dlZBelVsdXROQys3NFJzM0ZXdzhneVJ2MDJ2cUhRUXhYejc2cTZlUCtZMzVn?=
 =?utf-8?B?Q1ZvOXM4QmVTcU9JNHZZS2ZibEVOYTA3YmN1RGpMVWtzTnVTU3d6cGYvc3Js?=
 =?utf-8?B?dGFwYzB2T1cyMmdTdXhzTEc3MFdsSkRJNWFSQzZkWUdSSHEyV25UU29HQkJ2?=
 =?utf-8?B?UnhzRjNVWDRFN2h4Ym5tYk1Hd3JOL0l1dFlBdGg3dTdBTlhKQmFyQW1ML2JP?=
 =?utf-8?B?bk5QeWRzdnEwbDlZM3FTWWNEZHlMR3JxTXNYUVE0OHB6S3lJYzNBeFdocFJ6?=
 =?utf-8?B?bTl4d3c5OHBoTEFISUc2T1hDdW9BK0pmd0h5NVFNWEdYU0dhQlZkUjFBR1ZX?=
 =?utf-8?Q?hq1yFoopU7WTXCmhX3CL+cBlQynKVIlWkG+cGz0?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93aab453-f537-4a42-65f3-08dd9343e9cd
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 00:03:25.4295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB2154

Hi, Daniel,

Just a kindly reminder. There is a v2 of this patcheset [1], and I see 
[1/9] of v2 has been picked by Andi [2].

Please double check if anything wrong or conflicted.

Thanks,

Chen

Link: 
https://lore.kernel.org/linux-riscv/20250413223507.46480-1-inochiama@gmail.com/ 
[1]

Link: 
https://lore.kernel.org/linux-riscv/egkwz23tyr3psl3eaqhzdhmvxlufem5vqdlwvl4y6henyeazuz@ch3oflv4ekw7/ 
[2]


On 2025/5/14 22:18, Daniel Lezcano wrote:
> On Mon, Apr 07, 2025 at 09:06:06AM +0800, Inochi Amaoto wrote:
>> Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
>> compatible string for SG2044 SoC.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
>> ---
> Applied, thanks
>

