Return-Path: <linux-i2c+bounces-13053-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC791B86388
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 19:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0F7356582F
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 17:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21C725A2DD;
	Thu, 18 Sep 2025 17:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GHwWPYt3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011039.outbound.protection.outlook.com [52.101.62.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECACC261B8D;
	Thu, 18 Sep 2025 17:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758216829; cv=fail; b=f8JdIZlRdc3V+DNDFBdSSpMkboGGy62bAFGbkiGBQCfEyvrlJgJrCv/czgP9NWRLmQNXFKtXzfhwjKpu6W4tfLfdEkJd6NHxnS+qW0/qyaEqrJ6WLnVcry3SfyB+0DE4C2BQGzknBnM3nk+ncCcQy5xe3nZrZN4zH9dszJrbyCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758216829; c=relaxed/simple;
	bh=wpkwwH9tn8tMXm1tJCi9eJCFHdFv564w/jY/zPPhZvk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EOpdfyo2tX3+vBBjBuB6Pd3s7l+q9OPihelmNzRyQtdsjja5P06cFREMtJy/ZhI01tTQMBZiBS1AxXGOR4N29tZt/r+vpKlkc+NCiARNaRWJA9R5LiH9sbDSNVjWa+dvXefand2Vb9QrN1Pqn0f9N3C55Blv+3BXYq3HAg/W9Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GHwWPYt3; arc=fail smtp.client-ip=52.101.62.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAnQ8urkze1dioAOukJwV6s/ce8TEyXz30IXSm8DzW61l1698XZReUh0xOIY0BuaSNaAIpuIg5YNXNh1RtCSqvQ7DM/n6nxOHnzE4xtFnG0MN5hO7zzm7kTAtpoRZfGSJ2b02Ttk/2IH/hAkzwGQgEef9vMCF1TBluuaHT/hbUhapI/qF6NblRAFWKdm0tN7d94gCjRiU3mxlf1M6l4mT79ia0ccB5BZ4CJWbFagT1X1EYCh8sr+Dep73SshJm78sJh4sadn+SAqDlOya9A+X6ToHKct9dACWH5VlR56TBkeJMuHbboXn5msMrWHldXS3X0AkT0Cdt7k6xSlZOok+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GWyYd3EJ3wFxkhMJX5+fS6O9SSSPamSWHBEERZ8NIc=;
 b=PcUD5uN+z8q6viJksPQZ0P/QODEOxeT2OVv/BLuZapRdhx2s2NO1PqBCJ1Xjb/TSTgnd3d1FgjRW8L/n/36ZwzL/bhQ9kGq7p6CJmAtOzGNvUOYb+IXgm3JS3IhAe0RZyDPv2xsSfP5LG43souWoGNRrO5bbOzhUyB52mcsfZQq8SXJm/NQuHFHtEw7z+8APLMQ46D/nzHqURuQlKRIKlgn41Ld9Vxu7182B3V3gPPfYupT1+IrEgd6bjltiF6wSurA54rR/XakH2vf+CxP2U3+v07QV7l1BNqXT68bnfFzrrHNcbEtVqGvjHuhLy0MFUcLLu0G9VyaZIBrQWtyxDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GWyYd3EJ3wFxkhMJX5+fS6O9SSSPamSWHBEERZ8NIc=;
 b=GHwWPYt31EDNpTicQ5KqAkrikoXXsNCTM04uo3Ik7K4IBomKw7ct3Sf/uq33o8sAU2laUPdeAtR07eB8+gwMLWhH9sd4Y5z7eLuB/MCsgtp2AO+Fei5YbheXsLlNdHbWpyM6BLlHAk/HSQwdh6vUtN0171wdRJdVzYUHGL/0E/zgNlFy3H9xqCns8nmJRx17z2henVc1iN/E2ZYLT1Z61mdhJ/g5yWd7GMUMIE4AlpD/CcEpx+sSUpzXg0TyVa+0UhPu7osR4INA447bOZFSArJyEAuHwf6tIQP9s5R8rB4KVW8P1IP3QD+9xBW/hrtf2xp5ypAHld41PesWeDqQ3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA0PR12MB8278.namprd12.prod.outlook.com (2603:10b6:208:3dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 17:33:43 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 17:33:43 +0000
Message-ID: <a85af39b-166a-4eff-a6c1-4721e7374c73@nvidia.com>
Date: Thu, 18 Sep 2025 18:33:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] i2c: tegra: Add HS mode support
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 digetx@gmail.com, kkartik@nvidia.com, krzk+dt@kernel.org,
 ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, robh@kernel.org,
 smangipudi@nvidia.com, thierry.reding@gmail.com
References: <e5c06b4e-3edc-4977-bbcc-2035cf11811e@nvidia.com>
 <20250918171247.72087-1-akhilrajeev@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250918171247.72087-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0098.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::15) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA0PR12MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: a7eea8cb-96c8-4bd1-0510-08ddf6d9834c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHY4akpvZ24za1hhV1JFTUhzbTBxeVYwQTlRZDVZVWRwTkNlbVdkdjRPOU5B?=
 =?utf-8?B?bVNDVVhCVmZyY2ZpRXZ4ZkRxV3N4Ry9Id0hCbEtFRUN2a1daNXhTUGxLOXEx?=
 =?utf-8?B?cExzbWlmQlZaVXU0SmY3aWhwTjloMy9iZjhBWjBrMDlaWlc1UjI3R3FENDNC?=
 =?utf-8?B?U21nczhzMGM0R1AvWlgwdEZlRk9aUlovL1lQRkJLazhzUjhnTmFtQXlSV2pE?=
 =?utf-8?B?VUN3WmtqQlNEcUFQbTcrRTlKdDBaWitVbWVOUitycHVjR2VIbTRFQUNaNm1V?=
 =?utf-8?B?czMrdFM1TFZBbzJaQTlBWXdYYTFodWg0R0RBVmZ4ckRrSTRLakNHcUZpdUpP?=
 =?utf-8?B?UmpMWjBrQStHdkhmZ0twTGhSYUJ6VXBUYmQ3WStvZTVsZVBYOUJiU0RvMTVN?=
 =?utf-8?B?T0dYbFpOc2NMWHRta2VseW5ITXlLQUVXQ214c1FHTVE5Ti9MYmtDREo2U3Js?=
 =?utf-8?B?TzJnZFdXVm9qam01NWZIS2YraWNGTXZKcFBRQjhOME1kM3gxa3ZnUE9JQml1?=
 =?utf-8?B?ZFRCTkcvdkd0SkM5aC9UWkRlRU9TU1dQdnVjVVJhOUJsZzZLbXFVbmNZTDVa?=
 =?utf-8?B?UUs1RXV2VERUNUFMeXliV2Z2dDdEWGFDeFcrNEJMYUpsTnZmWWl4OXYzWHdt?=
 =?utf-8?B?TG1seXhwZHc0RnVRTXd0alRLa0hhR29ybHpqZ0lCZ3YxMGdaTzBpSDdnWUJG?=
 =?utf-8?B?QTJKeFlka0RZV3M4ck11YmV0QmVQak1oRmhKZEdXR0xSalA1SUVJNDN1dzVJ?=
 =?utf-8?B?c3lObFZoZXRYSThTcWg2am1heU11Q3dhQlZXSisvZ3dETERYcG9Bc1NmUGcy?=
 =?utf-8?B?VkthR3k2NzdhTzhaMXlidTE5MGRxSS9CeEpuNzBLNU9EV01sYkkwVUV4b2Ey?=
 =?utf-8?B?Slc3QTlvS05yMGgvZkRWaWpWZWVLZ2xDeDBOU2JQbXJrR2NlTzIzVVZKODVS?=
 =?utf-8?B?ZDd2aUdIQWgvQ09UZFdYTFhMZlVTcTliRmxwaW9sODVPbGxiaU1ZZW5LaUdh?=
 =?utf-8?B?THFDUzB3OThaT1dJQmVSNkVCVFBIYWZqOGZWSVBZMTBWajU5ZVhmU3g5WkVV?=
 =?utf-8?B?NVBKSWJvVVN1cnZkWXhraXlJSWZlcUlCcFRQdTA1Q3EwamNYbjNIK1AzMld0?=
 =?utf-8?B?ODg0elc1NjV4aHJyeFBMOHp2T0NWdDErbmRDU3FMYlBZWHRnMHlNdEZSeWRm?=
 =?utf-8?B?Tlp3K1FvSlJKSUVrVFc4RU5DaE9jZjlwTW0rSTJTMnZUV1dlQzd0dHEwQ0Ri?=
 =?utf-8?B?MnZEVzg0QTZnZ1VJc1pjUEJ6SWtXRy9tOXl1UUcyNGtYVFQvM2J4VkNyc0dJ?=
 =?utf-8?B?RitpZUNXZWtaQm1NS2lrVWVPc3BSVFNjdmNMSFFEK2lKbm1jeGhVdHJtQng5?=
 =?utf-8?B?YnBqeVdMdVh0WHVqQVR4R3RqUlQrR2xFMjZSeGpKTlpTQWtMa2cxakNCdGo4?=
 =?utf-8?B?UTYwWFdZMENhUzN2ajlIVjN2WWY1WWtrcHZuVS9OTWdCaDAzb0Z1blRQM1h6?=
 =?utf-8?B?bU5EWWh5S0NzNHNOOVgvK25MbkRXQi9pMlpiTllmWEdiK1FQTWhKSEZFeU9x?=
 =?utf-8?B?akVaNWhHdHREbnI4TEdKc3YzbmFtRkpOSXhZTnlTbHFLekpHMXlsQWs1dE8x?=
 =?utf-8?B?MU41RU9QM3JYaDVBVFgrSXpxdkE3YWlUWS81TFRWalI2clkxQVlYcVZGREg4?=
 =?utf-8?B?SDcxR2pZbjhYaDdWcklqWmV2UHlUblNMR2hPSGtwN1Q2OGZRN2dqUWtKUHZQ?=
 =?utf-8?B?cGIwUVpOQ1R2anovU21XQ1RNMCtyUFcvVGJpZCttUTg4S3pjYmYyN1hXM2Nw?=
 =?utf-8?B?SU53cHFjTHhYTlZldkRGSXZiNWw1UTBoakVBbGpCRUxOcnhtZmJJSHh6Mmox?=
 =?utf-8?B?VVFZcWZTTE5tMXlyTFhveUIraXJGdmJKTkdYMTJ3cDZpSUFTUXBMZ2J2eGtu?=
 =?utf-8?Q?uLjNsvY7Zpk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUJIMlBiaTVxU3JZVS9IU203NDRNVWZ0MXRwbHFTVVcva0FQbjJCeEZ1SlFU?=
 =?utf-8?B?SmZVYWFLREdWUlFUUysyZmx4dm1TM3J0NEUyRDNTNHVFSTZJUXp3UHQ3cWdm?=
 =?utf-8?B?NG0wMXI3cEl4dHZGMEt3TjBDaVBTRVljK3FmLzBjaWZpaU42cmJCclE3b1Ny?=
 =?utf-8?B?UnNFeHlYT0xuQWwwM1dLNDM1SzJOdWI5NHJWSzhiWEVjc3MyZlF2V0kwR1RN?=
 =?utf-8?B?cVEyV3B6UnlDYkF4Y1JZdENORklabjUyMWg1ZE96Rmk3VFJ1YWRWMkxhK000?=
 =?utf-8?B?STROZ01JVm9LVWZBVUNWejQ5aENEbWZPZVcvTHJQN0x4ZE81RXRRQ0VycGFB?=
 =?utf-8?B?b29jMGZ0QmJMNnZkdFJFZXVlQUJUeG12UkdmSGpQbTBTTXNKeXJtSlhxYmF6?=
 =?utf-8?B?VlZQNkZYb3NQNEdVcTcwR2xRaHdCZDBiTWQ3cDVBVWd0MGNLQlhDZDNDVG50?=
 =?utf-8?B?QU5nRVlUY1V6WGVKemFrYWJxbnVERk1yYmpGK3ZLTGtDVU1kbnMyb2VVWWJ1?=
 =?utf-8?B?bE11WmZCQkhsZGxseTFPL29KbXA4RjBueS9ieGF0Y3lWL1prTDlXQkpUdjZh?=
 =?utf-8?B?MW9Oc2xEQ3B1UkFDV3k1WWZEV0krTStLTjlOVDlrK0xISU9ERWR0STJ5cHlr?=
 =?utf-8?B?TUowblhGS0dHeHUzLzgvdHh5cXZwdHUxVkZ4OWNlK2RUMXlMZmZOalpNaVpy?=
 =?utf-8?B?SUNFcDRIWHhvTWExTFE4akFOeW9UNVVKQi9nZDFYQ1NqMVNMNXdTQnI0bTBH?=
 =?utf-8?B?VkI4aitSVUtQQXBNUlM0anI0Wlc5T3IyYXlzdTllYUFBMGNqMWpxNTNGYWNI?=
 =?utf-8?B?cWcySHJSQWxFQ1JEdStGcXI2WXhEVnh2NlZEY2QyK1g5dHlTbDY3V0w2QlFI?=
 =?utf-8?B?bmZSR1E4eWtMOHVnTjdmVGpLM1RqQnA4cXZIVEtVUlBVY3NxMW1kSjJHempy?=
 =?utf-8?B?L0ZON01RK0VnUzBYWVNXSk9ZYzNyZ0U5VmhMYi9HZzhtZjRhRU5tSzBMMDVD?=
 =?utf-8?B?L3E3d0RUY2JHcjZBUDg4SitPZUNGamtTTzJkZUtHaWZwcWdEeGo2Q09OSnc5?=
 =?utf-8?B?dHovbFN1b1lGZjc0R2hWRXVjSUdjZDB4S1N0UmxjVVc4Nk81S2F1cW04Vmpm?=
 =?utf-8?B?dXcwMk5FRnZ3cHk1Wm0xQStuNHFZbkRSa2dYNHdoU2sveFhTckx5NW1ZMm9j?=
 =?utf-8?B?RTUydjY0YzNtVTBFWUgrdHZabnc1RWN4Vy9PcWc2d2FDMW84VGIvU3AvNTdo?=
 =?utf-8?B?UVNZWWxkUHQ1dHZvMzFMZ0xzaG5CMWRaRUgzclprNHVrL0dPblZpeHlWM3N6?=
 =?utf-8?B?L3ppSEhtbDRpb3pJQkxvWnRYZTVvaU1la0Rub3gvTTY1QWNGc1pCajAxV2Jt?=
 =?utf-8?B?TGo0QVdJSHdEVXpNUlFCSGZGZ2Q2T2sramVxb0Y1V2pSSHF0NmEzOUNUc2pp?=
 =?utf-8?B?RnE4Y1hweFpWQkl6YTd6aWJVYUowMTBGdEk5UFZ6NzhUcWNya2RNdTlWR0JP?=
 =?utf-8?B?a3Rsc255bWpVd1lqbTgzemRXbHBWY3BxVkZPd3hJbjBxa25xaHNSOFpGRHZw?=
 =?utf-8?B?VGN5eEx1SS9qcS84TC9DTHM4N1pPeGV2Sm01QUppUFN1YXVUL2dRWEpyc0Uz?=
 =?utf-8?B?aFFpcWpwRWRNOXBIKzd1WkFicUI3ZkVJTzBoZ3Noa2V0bjRYb0Y4SVdqeW9y?=
 =?utf-8?B?bTBGc1dCSHAxdFdOWGV6SFRQRHJDd2JQR1RPeENiL0hrUG1mc2lEcm5saDY0?=
 =?utf-8?B?QzRzQS8zajVHbFp1cTNkVGJrOSsxejI5a29XdEtjbTk0cHFmMGdYbVRMV3px?=
 =?utf-8?B?eGFJNGtqK1NWNE9vcUlHU2xVOE1WeStURXZMU1h4QmhXdTQ1emxDaW9sMmpx?=
 =?utf-8?B?RGJQQ3dDRGpaMTgvd3pXZHZEZHpzMnZhV0pvcms5UkZvTXZKK0Y0S1ZWREdq?=
 =?utf-8?B?dGdzbkNsRFNkOXlmbkV1dGN5Uk5MREoyaCt4TWVENWV2VUZRZG4vblY1U0Vk?=
 =?utf-8?B?N0RnQ1pjUk1iVUErNnJRZ0ZXZVYwclZieUJsalVIeXRKaFhDWUZReTNJS1VV?=
 =?utf-8?B?ZUFnRjBaNEJaRWxKaXNNNWUxbllBYkJZU2RnNUlPL0dGVzhvR25sWXpXUnVE?=
 =?utf-8?B?eFRUM0hueUZxdGdBc01qRk9ZMWJQa3ZmR1hKSUJpMzA1RitudTljd0RhWWhR?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7eea8cb-96c8-4bd1-0510-08ddf6d9834c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 17:33:43.2722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnN6AJRzirISbnlPuc1x+7rN7k+FUKQXv4vN4818R495sNNAB5D0K9wXt9SJ5+5PE7I9WQfCYBSnNaIt9sn/VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8278


On 18/09/2025 18:12, Akhil R wrote:

...

>> OK, I see now. So we need to program the normal timings first and then
>> we are re-using the variables to then program the HS timings. And
>> because of that we cannot setup the HS timing values in the existing
>> case statement?
>>
>>> So, I am not sure if moving this section to the switch block will add
>>> any benefit. We might end up making it more complicated that it is now.
>>
>> Yes that's true. It was really this else part that caught my eye ...
>>
>>    } else if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) {
>>     	t->bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
>>    }
>>
>> It feels like at least this part should be handled as part of the case
>> statement.
> 
> Yes. That makes sense. If you agree, we can remove the else part because
> we weren't doing this before when HS mode support was not there. It is not
> directly related to the HS mode support as well. We can add this at a later
> point in a separate patch if found required.

Hmmm ... I am not sure because then we could potentially program the 
packet header incorrectly later on. May be that will never happen? 
However, I think it would be better to not make any assumptions here and 
make the code as robust as possible.

Jon

-- 
nvpublic


