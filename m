Return-Path: <linux-i2c+bounces-6003-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE78968C31
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 18:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAEFD283BA4
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 16:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB321C62CC;
	Mon,  2 Sep 2024 16:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="jcfNtLZJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666691AB6F6;
	Mon,  2 Sep 2024 16:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725295127; cv=fail; b=YVrRdf0l7OU2Xw5sXdazC0L5LEBECm70snucnoBNkXeFVzh14KvCWSp7P0KwRQjj3HJohbK/1+uVMRWauXLHB5IULZpZNo+Pi2bIeQfNh1QPHa0u4dbArOFr1Dqe8k5OyFAIojojudwdbWdRCRq6iIfbBSVpeb3lvt5xV7SgmhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725295127; c=relaxed/simple;
	bh=rwXSRqqFtdcgNACeDSgbnCfmrItiPQM6m/OWfHPeEf8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mI3dm7wJV+PoiAs+SCHJ78qS054Nk/CcqosyhbwHPx86EUQFilzUT0hLkgWEHud9LFGSnKCsYCrki7aE21+M91ix0DmvJaSN7AI0CVCzASK64s5Hy2Zm+FFMinXA02/IMy4xgnvYagM9D8sJ967dBaqJYrDiqsqOaNiCyj9nkTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=jcfNtLZJ; arc=fail smtp.client-ip=40.107.21.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZVTar+D4NUzQTYJ/k2d48jkBhDPzHhJPWO5/szrkw0BAyQQphEeVX+y8zNzks4tqoZvT7I6/Z6J64Ia/aFD0gQ7pNxFKsY9zcj9e5wjhbuUBcS5SEyWK6C4ImfMOWsbdEzqd1xZo24JxXMQMJsloG+Vghe3O2jHss1D0t3oGq49s/nXwesTK+FHJLntnSQIoRBdcQByFA76pIYcI5AMfdSSf9RwgY6MZCwkNXl7OQFppJlMMOOSjTLJRZkoXdr0QJA1c0qePm2oHtegpUosq/J9n1fxKvpxrrcB2VKqiXOY++04mVgjm9FBmheInbCaIvXBY66aio65MMrNPjO5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8mhuCI8xUg0KfJGj5vUAfFtFVTEWAm7Pr1592ZIMsI=;
 b=ZC9pm0/UlHOdgX6xctgp0uwrFczDYUlibdTzGqGUAHt9Hm60n8ubvTbK5iuQ4WB8HsXJ767f4mCMU9AF7mcWH80hfHrkAZVHs444UIigR+qx9JurcN6tcF2pAIAMYHor4NhpMGsqf5iGCKpuUH1bAhD82Ou71A+G0JCC+CiaLjlXZSdnZ83z/WrPE1oc2qvuS4AAo/PSdnpyusjjIUX1Ye0ykROpU4AEe5RZNwxxZhm79m0RsgzmUjiL7jV+nlgwYnOuYTpwGeuU6fiElXDc53FVvM6/k3JXxIAqJpJbfHGI6C0smUOQgNfj6hIaKWOIGAm4yPcIi8mDXR/BoxildQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8mhuCI8xUg0KfJGj5vUAfFtFVTEWAm7Pr1592ZIMsI=;
 b=jcfNtLZJgkx0TxQUO0ymUU4wmzRZnClt9At0069co5MWEcsfZ8tQ2K2QzVbOTMq7V2SHK1Siwr5HngSK2wlvS8xDt/zdn+1zi8uom6Fw2rBQw3XSJQpIpf3/s1GPdsQx6Vvnxf62TiAJuKZpY16Fk2QSpyEhkOuqNRPHi9wSsGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by DB9PR04MB9645.eurprd04.prod.outlook.com (2603:10a6:10:309::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 16:38:36 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 16:38:36 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 02 Sep 2024 18:38:17 +0200
Subject: [PATCH v7 4/8] hwmon: (amc6821) add support for tsd,mule
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-dev-mule-i2c-mux-v7-4-bf7b8f5385ed@cherry.de>
References: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
In-Reply-To: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15-dev-99b12
X-ClientProxiedBy: VI1PR0502CA0001.eurprd05.prod.outlook.com
 (2603:10a6:803:1::14) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|DB9PR04MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: ab050e9c-07b1-4cda-2c73-08dccb6db120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWpUUklwQUlCOGVrTEJ6NGc1ZmNidGhNcVBQaVJLdDJlMjNyVlFYNTUwdGpI?=
 =?utf-8?B?aXpZakxSa1BhL0RYLzBKdFZZRFdJQW00dzFWRE9rWmsvNzFLazVYTW9Fc0NK?=
 =?utf-8?B?c0l0cjQ1VGw3WVdOdklwUStOODBBbjhzT3VWWURQWnBnb0s0S2QxUis0bmM5?=
 =?utf-8?B?YVArVlBMWHd6dkVRYVQ1Z3RhdHdWMndKRGtPcE9GZ2J0Zmc5UXhLUkRwQjdx?=
 =?utf-8?B?ckl0bzAyZFFsYXoyUFJhN25lRWsvbTNlYmFpZjJxVnZEalROMitlRzRIZFo3?=
 =?utf-8?B?RFJqdU4xUkMrMWoyRXJVeUNFdnBubUVDTjVYdXNZbEtQUkJhamhyMUova25k?=
 =?utf-8?B?QmU4NEJCRDFNOWJTZUF4ejFxKytUT080VElOeFc4ak9VaTB6RFAvNHRHV2ph?=
 =?utf-8?B?cU1LQ0xydkM1aEZwTmFiOEdERTVJS2NwOVUrSXpRYjYvWlFuK20zbkdIWW9U?=
 =?utf-8?B?SW0zVDNhYmVWV1k0MmFjYVN5RzJMTEcyaVFRYnNtbXNITCtTbUdKcngwa2Qw?=
 =?utf-8?B?eWNLUy9PVXhicTBJVnEwRVBTYkJzQ1hIQTU1K0FGN29WU1Vmd3dNUmdPeUp5?=
 =?utf-8?B?UkdTbm5hSVRIdzR2ck1BREJxTHJKQXRxNlQrZGZ0RW5MRGMwNHdNWkpFdmM4?=
 =?utf-8?B?QkhndHlGNDJCRHlHNzJ0Y2V4SUhRTkNsZDZ5NnBMbmNucnp4b3BDOE5mSGd6?=
 =?utf-8?B?VEdjc1kwZExBcngxSFdVclJsamhiajZXTGdkMk44Ukt6OGFQMTlDcmhuYmNC?=
 =?utf-8?B?YlJLMWd2dWpSamdlNUh5VmJoSDE1WVljcnZ3ODlhNE1RVmZLV083cGY2SnBH?=
 =?utf-8?B?NDgvQ1ZDbkZ2Wk5kellBUFhCd3U0Z0IxeG5XMGFJV1EzcVhIbjhXVTBrZTNl?=
 =?utf-8?B?WVI5TzAwNTZDQ09LdTdNSkZUMTZRVGttaEpMUHVacGVlWkg5OUZCMVZjSVpy?=
 =?utf-8?B?V0JVSFdPam51Uk5oZmQ0cEhnSzE3RUVzWWFaSDVZS3FCYkoyZVlsdTdCcDA1?=
 =?utf-8?B?ZVMyT25MSjcyMDBzOFpYMVMzQjZhbldjOGpYY3JyRGNNdDhqdEY4Q0F4SXFS?=
 =?utf-8?B?S0xBU2JQdFlDVHEybW9FNk9CVlB5R2c0OCtNL3pibCt0VHM1TTEzeHVIcVhG?=
 =?utf-8?B?Mkl5Ri9vWFQ3cHJsaldpbkh0Wm1TQTk5a2IzaktrYXhPQ29RVDVlWnhUVllU?=
 =?utf-8?B?RE1NbEEvc2ZMaEJJN0RzcEw5eEVzYklCMk1mU2xzRVd1aUZOWGczejhXZXFZ?=
 =?utf-8?B?d280bTl1MGtyZi9UUEhXZFo2SzVrZGZOb3pyVCtTcTZRcHFNMTdaTDhOMTA1?=
 =?utf-8?B?KzNpcXg3NnRta3FlRzdCTEVIZWNYTzk1VVhtMENyaTVtaDkxZEUycGxSVkE5?=
 =?utf-8?B?M2ZVVkU3ZGNRUDByWHpZSnNEM3pjZ0l3QU5YeXoreDB6N0JWcUpWTTNrQ0pj?=
 =?utf-8?B?Tk9BUFAwZ2laYVA1RGNkUUcwOFVvbU9EOXM4ckErUko3ZWNBb0ZtVGRQM05n?=
 =?utf-8?B?Qm4zbVk3TXRjVllFaXM5SjN3VTJXQTduMS8xK0E0MndrNytMYkVhdzZDcW96?=
 =?utf-8?B?NjkyVHNSL1ExcHgvUXJrRk1YcC8vTUxjS1dVME1RMTZiU3IwQ2VBbGRDMEQv?=
 =?utf-8?B?UWtYUlN5NnJmY3VVaHdmNHFQeUJ6TFYra0pabC81c3NMb0ZqcGdIWjFSMWE1?=
 =?utf-8?B?SnlSbkU4N1F2QVBncld5cnJMRStuaWp6R1ZNYkN0dEFjcG8zbEMyY3h4Ykw0?=
 =?utf-8?B?NnRvd3J4R2RURE92aXk5RXFWQzVIdHYzQ3pySG1IaFR4ZDZ5Vzg3TktCMnhJ?=
 =?utf-8?B?ZkdwdzlCNzkvcjZrbVBXMUljUGVBVmF3NUEvcEVONFVmM21ETlA0U3NlZnJ4?=
 =?utf-8?B?Ymh5ay9LN20xQndYM2lxL1NuM0x2bU5ZM2wzYWorZHdmSnlUNmZuSjBkRHpZ?=
 =?utf-8?Q?fwH2JHKY9kM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z01TK3I3OENxcEhXWG56NXQxblRqVDdBT0piL3pOMW5Td1hLNzcwYXYxTGxy?=
 =?utf-8?B?R0gwQ1pNQ25CV0lUYWRIdURoUE54RHlWYmNqODVjelljdnQxclFNNk1iSUt2?=
 =?utf-8?B?TENSL3dlb2dacjZHZ2o2MldNZ0wxS1NBMmNDK0RqOUZJSk9nSWtpU0hkR0xG?=
 =?utf-8?B?WlF6eXZ6MHlXTG9WUTN5amxEQnE5cS8rY1JxNUpqeHNPMHc2cDBDZTVLTC9o?=
 =?utf-8?B?SFhDN0Y0Y0VacSsxKzZ3eGRzdVF0bGloZ0oySkE2MjRiN3E4WVNSRGJBRHFL?=
 =?utf-8?B?VnNVQUpOanlrd01GNDNlVnpmUWZaNHNTSTN3em1RMzY4VlF6Sjczcm9zNlQy?=
 =?utf-8?B?cURmNmJRMTJYR1docEY5RnBFRDRWaVR4aW1kSnhiRDZiU1FsWVorVTdaUENM?=
 =?utf-8?B?VFRTalhqc3JXR0JRZXpxdjVkL3gydjh0ODZTMHRTMlVOeXl4QzkvNVVhQzlj?=
 =?utf-8?B?UWlyU3J3Z1gvelFQVFVnMzg0SHNyYU5NcUN2Rm94UjVJb3B6Mlhub3RrYVo0?=
 =?utf-8?B?bzBOZzJMVXl5UC9LTnZSZURySG5qTkQ4cWRvWE9yYnh1ZElKNk0xekIrV2E5?=
 =?utf-8?B?Qkp2Sk5EbFZML3BJQTNMNFVYazhkQXBzTFhqdWtER0RMbHM1Zko1RHZJdmo5?=
 =?utf-8?B?SDh4NVNUVk5FK291SFFUZ2wzNTg5dHJFTHpJRW94T1ViNjR5OXFkT3JlaW5V?=
 =?utf-8?B?Nzlwa1RrSnA1Tkh3aGVTY1pKTmQxdEJVTW4xOHNtUG1kenU2RERRYVRJSmgy?=
 =?utf-8?B?U040TEFzN1M4TnZEY0hGdzQ5Q2ZVMjVsOUtrRzBONWFheDgvMUVQb0YvZXJP?=
 =?utf-8?B?RHJFUVJHYWF4VkxVNkp3eHhOVldpakVNdERhTjhLeDc5d2NLVm5oQnZZQm5C?=
 =?utf-8?B?eUl4blRJR2JoRFlRcjhsTDNCRW1jWUxHVFg2MXRGYlFUK29vYUk3UC9Eb2R0?=
 =?utf-8?B?QWZDL1RQTGdWZGltd1MrS1RxODBpeUxQR0MydDJjQ0dPQXB1MXV2TDBjZEgr?=
 =?utf-8?B?ZWR4UWROL2NOYVZhajhSNUFaYUUrcTUybXlCR3pwakpIbnNhUjdVQ3dweHFU?=
 =?utf-8?B?MmxtS2liaFg5aUZ2citxbzlYU040eUc1dU1wOVZsa1o4L0FNRmdMYkNCRzRx?=
 =?utf-8?B?RnJrd3ZNclBKUGFFb0RIWTJJRWdXbVRlaE1FN21oQlRyVHNQM2JXYlFFMWdQ?=
 =?utf-8?B?ck5YTjExbDg3TTdCTTgvOXhUOWNrRWxtUHJ3WEZsZWNrd256bkxWY1EvVHFz?=
 =?utf-8?B?RC93Y01va0lJU2tLU0VJZENYMlhGcXZCamowV1h4WmJNL3pucVU3SSs5VGND?=
 =?utf-8?B?OFBlOCtUUzVZMWM0R3cwanVSNzFWcm9EZWo2YTl2QUFQVkVSOEtKT2kyVzVv?=
 =?utf-8?B?L2FPWXRLSFhRT3RMeXhWVkpEQ1NPV251MWNrNkxrT1RDOE9OWmM4TVVEeXZ3?=
 =?utf-8?B?THJCZk91UXZSMlpCYmFLMnNKSktmUlY2RTRyTEgzd1hxSFdtcWFDWWNacUp2?=
 =?utf-8?B?SEQ1czRCNGJhSGVyY2dqQ1h6TmFnL2U2VjRkNkIxNzlhekVRL3MxREEvOWd0?=
 =?utf-8?B?WUpsV0Q5RTRxRXF5Y1NaT2lUMDREYkM4YWVqN2RGZ0RsS3p2eTkyUnBoc0o3?=
 =?utf-8?B?NGFSVERhdmQ1dkNSelNtMGlacDV0QzFiSTc5OHY3YXVHVVh0RjRRTS9NZVZ5?=
 =?utf-8?B?Qko0STdKd0NaRU9NR2NmWGNpNVlNWXdwU0RVSWxaMEpMT3BUYjFvZnR0OXVF?=
 =?utf-8?B?ZTYwQkNOcTR1Y2RQcVdsSVZGTlM2Q0NHSEQ0RjFMWldnTGVaNHJmajdOS3ZC?=
 =?utf-8?B?Y0JWTDBpZkxtOTEvWGVVd1FxNnhYU2VPKzREeVJzejNmN3BNVnZYL2IvUU9s?=
 =?utf-8?B?M1ZDZWMwRDBFWGc3RkdpMXNJb09xVmdSTjRQOE1FM3d5Y1hEY0FOZ3NzeDBp?=
 =?utf-8?B?MTJiN1pqOXIvL0tLOTdITk9sY0w4YmV1SXVMOUVWZVJHQWRLMVpGSWtJQnIr?=
 =?utf-8?B?RWxobzMrMXlTaEV2ejI4L1VXMFA1TDlLeU1MSS8rVjdOL05LKzZKa01aejZu?=
 =?utf-8?B?Vi9uUHBXUEh3MlIybTNZYjhjbUhxaHVadlUvQlVsUC90aklsc3QyNkwrNms4?=
 =?utf-8?B?THNFT3k5SVh3ZmE2eEZRR2VlM1RLeEFlNldvOUxFaWNpNnI2Q3cvS0NsOGg1?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ab050e9c-07b1-4cda-2c73-08dccb6db120
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 16:38:36.3944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcYBZydlnoyIqACE6P7x68QUuMSeajiJU9q4iXq7Q83ZNvzrGUaaMHzEHt6rO41iPcyWy8hLhSZSWyMQowtgHxlR6XT2y+QCJo5eCb97Gd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9645

Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
among which is an amc6821 and other devices that are reachable through
an I2C-mux.

The devices on the mux can be selected by writing the appropriate device
number to an I2C config register (amc6821: reg 0xff)

Implement "tsd,mule" compatible to instantiate the I2C-mux platform device
when probing the amc6821.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 drivers/hwmon/amc6821.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index ec94392fcb65..a3fdbcf01ecd 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -22,6 +22,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of_platform.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -897,7 +898,6 @@ static bool amc6821_volatile_reg(struct device *dev, unsigned int reg)
 static const struct regmap_config amc6821_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
-	.max_register = AMC6821_REG_CONF3,
 	.volatile_reg = amc6821_volatile_reg,
 	.cache_type = REGCACHE_MAPLE,
 };
@@ -924,6 +924,13 @@ static int amc6821_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
+	if (of_device_is_compatible(dev->of_node, "tsd,mule")) {
+		err = devm_of_platform_populate(dev);
+		if (err)
+			return dev_err_probe(dev, err,
+				     "Failed to create sub-devices\n");
+	}
+
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
 							 data, &amc6821_chip_info,
 							 amc6821_groups);
@@ -941,6 +948,9 @@ static const struct of_device_id __maybe_unused amc6821_of_match[] = {
 	{
 		.compatible = "ti,amc6821",
 	},
+	{
+		.compatible = "tsd,mule",
+	},
 	{ }
 };
 

-- 
2.34.1


