Return-Path: <linux-i2c+bounces-6454-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7059726F6
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 04:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E7D51C22C70
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 02:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B2F13CFAB;
	Tue, 10 Sep 2024 02:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="jMv19Taa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2054.outbound.protection.outlook.com [40.107.255.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300D02AE69;
	Tue, 10 Sep 2024 02:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725933995; cv=fail; b=V3I8O3Hn7O9wiiiqUonB8JPEPOAAIc5AE/aNnhWOAzD21wugxpRNsgFjMjwF7F0pWkOm9qE814SIvoP4hYE5TiaoGjn3sIHJHuMmnJ0HgAc4bdj6PuXs2PgAzOcR7F4u2jNoH8cgngqZ1i2gcueJcx1s+5AGnsW/obBHv4vKKx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725933995; c=relaxed/simple;
	bh=xnxGAMnEQELvJJTGtHOyYMEQ7tG8WuV5JdCOEnHy4qo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jB3bU0nbXfc5g8pLf0Ec+FHZ30xTiE4SzJTwJfqRDx2CoBZeVRX91qPy/iS66Ed/f3mXMlLCPdyNBvIAI48wdHAxh7kf8Jt/ud/PfCJkywmabXmwINJ7XR/0417HwCcB8iuIUQkSQZSPobAX9+ZeuHUkU+4tFrp8sg42CSjbK2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=jMv19Taa; arc=fail smtp.client-ip=40.107.255.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tniwbzx9gq1DQU7KyB65KpDYNFfY+B9ZrEo13MBeE/4Z9jJKpdwKM+UCRZusXedcn31JVgWtsJCc038+h2inyIDMWXnRk7AU2qPl1mfdxPARXgvMW5wY3TzPJIz4dVU7lZEjx44KIjNQGPItnLvaaQ3jw/pFeWgqinBiSpY7TbiCsqr1x3lPldOVcCP2QZRrgkqVYSW1bESRghQYsRzEXJQAB/lLuqYPR1LjIbUPIYfBtm3iigIbEdVIEtPTaR+4LU6hpzTOHaQpJziRyJciauNF4BGYDoHjWwAWxiIL/mPAU5bHMphDoPUpVQmgogqMDDcU0Cl5hy8vGCz8BrWtdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnxGAMnEQELvJJTGtHOyYMEQ7tG8WuV5JdCOEnHy4qo=;
 b=ByAXAaAi4X/yDW9I3Rc80wTotUvC0mxikQVmprea7nd1pj0DxaKGE0NWDRJmS72uaLshyXdNPjYyFPzr+wsvLrC0cJ+GS/Gu122uFPNMn0yB3vxjHiZ5rl/cDn+hYkNvJZ66L7YdfDPDImOPb43WWd9VQC6gVzfk509zZ3oCiMlp/T8u0S6umpZBrECAwowxgK4sfYxws+jfZlTZm1Bxgbv6ssMq8uYZoualAq1G5yNqzwCF8R3/Xjht8Qcl8g0v2d946yBMZv5LqINF1gr59Xgu7VP1v/5D32fMiBrRMD9ON1IP9Bcf4CQe2luIrscwyyz9lzQDdsDlFJV+VtBWZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnxGAMnEQELvJJTGtHOyYMEQ7tG8WuV5JdCOEnHy4qo=;
 b=jMv19TaavFIeRzzW7AAqdXtkwsNyuoGgdrCZLJXGjckJMkosSy8/4unaoSLkZEDtNs47RxUW2VVF5clpRP5MDbDjAUx8XR9ptS7RZrK28j8092RRG3DYCuKJ55ePchTuZjqCYmxPbcwaACdif4Rk0Ux8bc2P3WzN0HEoKS/HYu5XUmF8iRDiWCkrD6SX6PFoblSA2DmX7kduzLNlqGBgcm2vpGMgHIeQOLQBR5Szl1UwcclCdQYrqQoHdeq49iBmbDd01XnqCkaWG/uNAE0pA6QzsLNg3V1CXYK1U6vLnuO0xRzlzyeNm4svOL/VjHGwD8sQCwp3jAHSuejpLD9pHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TY0PR06MB5426.apcprd06.prod.outlook.com (2603:1096:400:217::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.23; Tue, 10 Sep 2024 02:06:21 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 02:06:20 +0000
Message-ID: <2557612f-5990-44ad-8a36-95a6f6a7f230@vivo.com>
Date: Tue, 10 Sep 2024 10:06:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] i2c: jz4780: Use dev_err_probe()
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
Cc: andriy.shevchenko@intel.com, biju.das.jz@bp.renesas.com,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, opensource.kernel@vivo.com,
 Rong Qianfeng <rongqianfeng@vivo.com>
References: <20240827034841.4121-1-rongqianfeng@vivo.com>
 <20240827034841.4121-4-rongqianfeng@vivo.com>
 <aqigucchbgq2tblnu7gdkpiw35ezqbmgbl6a5ptzzezngnihsi@iny4xyzkjyz4>
 <2c666489-a39c-4963-a7bd-688dae666f56@vivo.com>
 <fr7km2zhizkjshvgsw2vjmk2boglrhvcfpc7iqxvilzdvxqemm@lka7dt3iu3y4>
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <fr7km2zhizkjshvgsw2vjmk2boglrhvcfpc7iqxvilzdvxqemm@lka7dt3iu3y4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::33)
 To SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TY0PR06MB5426:EE_
X-MS-Office365-Filtering-Correlation-Id: 76298ec1-0fb6-4f83-e988-08dcd13d29c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|81742002;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3BTZVk1WW1neUlhNWtLNjR6SEI5WngvYVdKTFR6Q2xKZHljVG1qTkVTMHRJ?=
 =?utf-8?B?TTdGRTJScTJqalRHUXFZM25CSEdvdUFjU09iNkVDNVhpMTVnOERSOFV4aTE3?=
 =?utf-8?B?VExjM3QzaTR4REwxcVZYcDRLOU5yVXM5aTNGejNhYmlSNGE5cmRFZVYyTG9s?=
 =?utf-8?B?QUZkWlc2K3FJSDh5Uk12ZXlnK0lvOE1iS1lBRDhBR3pPbUc5ei9ENWJWem4y?=
 =?utf-8?B?OEpMQjQ2blg2NHdRZitYWTlRckJGRS9DTXJTck9pUzh5b1ZvYkVVTGZ4NnB3?=
 =?utf-8?B?cUIwZjViY21ibXZzV2Fsd2cyMk0va1lJSHR2MDh3RUwxcUYrVHdYQzVoYzd6?=
 =?utf-8?B?Z0xDMXhKcnJONm03ZWY5QXorNkR6NWpFN0hWMDNLRDA0RFNBQ090NjVXeVVL?=
 =?utf-8?B?NTh0M3NqQ1hKYysxMko5MGxiQzhUQTFFSFNDV3FLSDRYbmRCNnoreGFLY0NY?=
 =?utf-8?B?N2JUelZmRXJvdzZlaDJxZE5hREpzZmQ3TmhOa0NBQk90UDZrOCtuVy91WTkr?=
 =?utf-8?B?elFXeWE4cDQ3dVBtejkwb2ZoaStWcDNGbWoyTWxCWTlqUnNXZHJ3MzJ5N0Iv?=
 =?utf-8?B?MkE1Ky8wR1dKYTNZd2Zydjd6WGpUN2FoQ2ptVG9JSzNzc2YvdEtWSi9xdTBz?=
 =?utf-8?B?Qys1citpbEpxQXJVOHVvNWZ3S1o5QmtSYkdBdU5Qd1JoOWYzcFMyMmFxWjlI?=
 =?utf-8?B?dDZYS216SHNXc3ZQT01MVFBkUThUc1RsZEVWcUZMb0NSQkVlajY4UVdFeHkz?=
 =?utf-8?B?ZkRmVncvOUlqQkZpQmxZR21FVksxejgwc0tQMEJHd1c3NVBuTjQweHRYV0wz?=
 =?utf-8?B?WkY0RTYrU0VscDdRTm9tbEhTREpNODR5Rk9JZnVQS2RuMkt5dHRuZEMxYVR5?=
 =?utf-8?B?R0NUT1dnZ0xkc3lEZmtWVDJPRWY0TTN4MVhNOXlvNVIrVVpONThQdnh5ak54?=
 =?utf-8?B?ekl6aU5MZVcyeUdkcTVhT3RlRW9Cd0FBUDUrclRsSmdzUUc2ZWhxY0o4aFNK?=
 =?utf-8?B?NE5aeFh0TFcwSlluaXVQL1Z2SmJtNGlSSHVIdS9jQkhPZDBGMXNHd2dhVHVa?=
 =?utf-8?B?ZDR6bGUzcHl0VnhxeHhweHB6b3IycGI1QWhGdWNUcHVFaENUcDJrV1UxRUox?=
 =?utf-8?B?N3FhRTJoTkZFOG5mMFNnWGVJVVdvcEVFUFF4dWhtVExaTE14dnV0bXBEZEJX?=
 =?utf-8?B?OVpKNWNDQ0ZIaEhISVIzTHFPd0dwNEcrUHlUYVMzdDRiMnljUDBhY0dQcDg5?=
 =?utf-8?B?c3g5ZEtodXFSTHR2SEZaYnl6NXBmcVBrc0ZueUx3K05FU0Jrb1VlYzVJcnR2?=
 =?utf-8?B?bTB5ZVcvUTAwMnhBMUIzdHFYNHN1bENtMlJ5M0hVSU9iMTBVWDZnWmkzSGNh?=
 =?utf-8?B?cUlIc2lxOGFITThjMmNkZEpTQkxoNFlsVTAzcVJYU2dPS2hqcTA0bGowQjhw?=
 =?utf-8?B?NTBMYUdzTUdrSDJvZnRUQ0szbGFjU0dqdFJoZDRiTlZiVzRpbXdQbUlBVmU5?=
 =?utf-8?B?enZoeTBRMEJHVGdQVzBKNlpsV3ovVzh3UmdFQk9EWFhiSjlvTkdvcndNcW45?=
 =?utf-8?B?VUhBMXlEdVBjaWJRa1lLNGxCT2o2V3gxbGpYdFQvQlI4UUlnNVNVc21ENzcw?=
 =?utf-8?B?WEpsamhXV0tselhNYmN1cUNZdmJLK01EQXp4RVV1QXFDZ1ZFVVc5eHd3VTZz?=
 =?utf-8?B?NDZZUGlCRmFrSjczcytDSDE4KzhqaC9GUWwrNDJUYWhyeUxiaDBsWjJJdDlK?=
 =?utf-8?B?RmMyR2hxWVNWZVc0NTc2RzQzdjBwOUlNZkNTUjZRY3ZIVjJ3ejd1Y3c3L3dE?=
 =?utf-8?B?NkE4dW93MzIxZ1dIaVVUd3F3OFN2ajFQMDFCZVc4dld0VDRlT0RHOUFZaStr?=
 =?utf-8?B?WXFCQ2hqZmhhTU1hS1YybjB3cU1IVS9ydHJraFVSV3IrUGtsNFQwUGd0MVcr?=
 =?utf-8?Q?j2PdJN7TDq0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(81742002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S21WazRLYTg0TStrQTlvbjRjandFWE9qN2dEYml2ZnBrRGJMaXFOWDBGbW10?=
 =?utf-8?B?d3RndTFQUW1ReU5kclBlY241MSs1NnZ4eklyVVlBc0I0eisxS1hSeTdMMkJh?=
 =?utf-8?B?OURqY3VmblRQN3JSbkEvcVFtQXlZbndOUEJWdEgrUWl2MDJVbkEwbW8vWFF0?=
 =?utf-8?B?U3RXQ1ZvaC9OVENaVS9hSVViYTZYSCtaWXREZlV5Z2x1bXNrc0tUb0NpRmtz?=
 =?utf-8?B?YnV1UnVsN3k1TU0wcE1FVnh5bnFPVU5xU1g3MU9Hd3loLzFacG50TVlWbG9M?=
 =?utf-8?B?K3MwUW9NN0FYZmhjc3U1aU50YVpUUUpSV0RGZXM2UTVBZFRocFVYZlBCZVda?=
 =?utf-8?B?OXdPdTZxbmdKa3hOY3RxNmJTSHcvZHRLRFdtaS8yKzNSL1VPNElEekxNbCtY?=
 =?utf-8?B?dXh3NXZCb0VLK21VVlRBc2s1dFdEVGJRL2NicGc4ellaVUVSOVBXU2krYUxQ?=
 =?utf-8?B?d0ZVSDZ0OFEweFpzQmZmb3RiS0lkQW9EWSs4d0lnMnJOeU5aK01kMTBTaURP?=
 =?utf-8?B?eU40UC9zWHR4YlQ0K010a3AzaXZFODNSTEMxYUpaVDA5ME42SWhSdTBrNkFM?=
 =?utf-8?B?UHhlL1QwSjIyOG5RTTRtUEZCb0t6TmN2K051cFhnWmhWVFo0R2lhMFJ1Vk52?=
 =?utf-8?B?M2x4dmNwcHk4U1NMSHFJN3MyTmttU09HbE9TeUUvSGYwYnE4Qm5mMi9hTm9T?=
 =?utf-8?B?dW1GZExaaU54dWtraXNxajNmTHFRWG5ROUJmY0xoUEROYWFwOUt6WGhKd2Nw?=
 =?utf-8?B?c3BFa01aYUoxeE0zajlwNkgwWTlMOU9MbFdKQ3JFbGdmN1ZTNGlWRzFacEVQ?=
 =?utf-8?B?TU1oaGMycnl5eU41WS9PMzg0NG5MZzMrUjVaOTF5MzdIZWh3QWVNcndsdW9H?=
 =?utf-8?B?MmhvRnNFd0xyYXR1UmZSclc3TXhhMkIzVjFhYjRpeW5MUDBxdC9kVmlpUFhX?=
 =?utf-8?B?WGQ4YlJVbVc1ejY1dXF0bWFFSDRXSDVhSFlQV08rbjhvS0R4VWFEZDYzR3ZS?=
 =?utf-8?B?T2tUeWNNck9BZW5YeEZSMVBiMU9BTElLTlFPaUxjemVhOUt3angvSVc0ZVZS?=
 =?utf-8?B?bC8xbDVSTjNnbjIydDBSdWhsejRIMXNmRmh1TTNQL2JzNnNkNFUrbzBVcmlC?=
 =?utf-8?B?NDEyRDhtZmlxR3RpWjU0ekJkMUpPMThXZGRxWEllY0NyRFI0d2xyenRBMGZJ?=
 =?utf-8?B?bisyK1JOcHJ5ZVZFZXg0WlhQaUpoK2Y0R2xJMDRNeDY2MFVwSWcwc08xV3Q0?=
 =?utf-8?B?QllNaTlmdWZQZ09EQ2dFZnB6aVJWSXVmL0tBeUdUSEsrM0h3eTU5RDFRUndC?=
 =?utf-8?B?bFhXc2VIRTA5SnJ4WDFhb0dveFBIRFZScGQ0VXBCODBFTkdjeDh0MGVyWVp3?=
 =?utf-8?B?MXJva0lzT2ZpQ3NyamdGU1lrNDBrTFByTXVpVmVIZWR0ZE41WTdRSFN6ZmU0?=
 =?utf-8?B?M1gyS2pFUFdaMFk4TXVxOXZJenVCR09oL1hpR3orQk9GYVVMVWNaWE9LNmp6?=
 =?utf-8?B?YlJwcjFYRkJvdUIyK1Z2cldOcFJqSDlRKzFlVWZrMmVyaCttZUlNaXBVeGhW?=
 =?utf-8?B?Q21IL0N4aG9Yc0VZeEVLUjl1b0tBb0FycWVpa01od09XQmh3L25zSkYvdjBK?=
 =?utf-8?B?OXlydThTSHg0bTg4U1Y1OU5FM2ptZTBVbmJtTitzRXdBWTE1UW5iamptb3hN?=
 =?utf-8?B?SFBSNGVHTDQvMC91ZlZhckFWQmR3SjUrZHNBZkgxR2tmS0FRSStWZE1HRDg4?=
 =?utf-8?B?eTc4LzRna0VIcW9aUFBQYkdtWE1weHZpakNiVlZzd2wvdHJVTnFVSHY1aDlk?=
 =?utf-8?B?Z3A1TzdIY09FRVpSU2ZLeGlsZHNiMkNFQmtISVhCM3R4ejBtNmdQZzVoZWQ1?=
 =?utf-8?B?bi9IekJKd1NIVjk1UW50Y1U1cHdSYVNnWkpPMGtXY1M5ZW5rOG02aFJyMEU2?=
 =?utf-8?B?cmVMaStlOUVCNjl5alBOam85MW54TFVIYXA4Mi9yNEZHYXpROXRrSjFBMUZi?=
 =?utf-8?B?NGFmc1g3QUY0RTdzOWErc2QrRjVhemNGSnB0YzdyOVN0UTUyZWJjbVllMEJh?=
 =?utf-8?B?UTE3TG9wV1UrK3NTK0MxZUpCQWlSWllFWEpYS2hzTzlGZkVzcklHMHcxTkFN?=
 =?utf-8?Q?cJs4Ox3F3JpbPgZKCfqbRAaGD?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76298ec1-0fb6-4f83-e988-08dcd13d29c9
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 02:06:20.7362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jd1XgCj3IOnGk1IpA41S9tbKkMurmuzmyoDiRDqRJ4/7ncM99YCXYdEML5QUXAfUl79ySdHxWpEcDXRjVvRqcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5426

Hi Andi,

在 2024/9/10 3:24, Andi Shyti 写道:
> On Mon, Sep 09, 2024 at 04:58:10PM GMT, Rong Qianfeng wrote:
>>> I'm not a big fan of this change. There is not much gain in
>>> polluting git bisect in order to shorten pdev->dev to a single
>>> dev.
>>>
>>> However, I like the /dev_err/dev_err_probe/.
>>>
>>> I will take the first two patches from this series, but I will
>>> leave this if anyone else has a stronger opinion. If you want,
>>> you can send just this one patch with just the dev_err_probe()
>>> change.
>> Thanks for taking the time to review my patch!
>> Please take the first two patches, I don't plan to submit another
>> patch that only modifies dev_err().
> Sorry, I forgot to write it, I merged the first two in
> i2c/i2c-host.
>
> If you want to send one to change dev_err with dev_err_probe
> separately I will take it.

ok, I got it, thanks.

Best Regards,
Qianfeng

