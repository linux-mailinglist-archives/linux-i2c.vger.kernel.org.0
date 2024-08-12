Return-Path: <linux-i2c+bounces-5303-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4DF94EC2D
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 13:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 542E11C21157
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 11:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DE91779BC;
	Mon, 12 Aug 2024 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="QmFSXSly"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2087.outbound.protection.outlook.com [40.107.21.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3DF27457;
	Mon, 12 Aug 2024 11:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723463947; cv=fail; b=lP0g2kODXimjtM4S66fxOwF7AK4h3bcG7hZnrVdOfedMW4/pKCcu33Koj22LC2+WoiFQPQoHCawBOy4bG3Xb8m067UM7+x//oqkhRJdYgyieQ7FPjt2KPKfBBKq5jXeMmKEOx2uFMUVP3m6e2a7cTA2y3APXMAT/+5vmkNOzZbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723463947; c=relaxed/simple;
	bh=wMJCpxWIqxbUZETTuPkaaiyfrzPksq/szS+bhb10Ifw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TGJoOLR8KHZaAIEFazNvvkwgv8mnRO/g987na0JTQmahtRbIoEN257rJPpciotdE7Sao9IrJdnGHdX+t1v5q3FjL/QsyCd3E5rfuqXfoLqylaKXKKPzYXUD+LsduGbb/DYrZ8CEz6UjQK7wPFAApIfdiJSXdSIKb78UMI8/cwJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=QmFSXSly; arc=fail smtp.client-ip=40.107.21.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dR694GvfR67+F43BQ3Y/SyItd/n74pcuhHhmHJCxybMa6VNAvnTo2Kk7DkjHXy4hvK0JqLmwQy6BKxVczxxwmrICeFqjcinR3oh31tbZsMMdGxMvyWVq0WvbWzqk2zK6MjBa+3zoqK416q4bp9D9M02vy5HG+GipgMGOY3+6QxWn5iU/7tz0GxxXzaK+8YSCWWHfo0MSLClSEzIFa18+rposguW0oT/znUgopDUjp08iLlcF2OcKpcJr80csBqpn++9Zf8rFM26Ol6V09St8thEZSPOUJNUXfFhECIyEDqXqrugNCuamFtIXbaPjS1Xg7tscAVobuhMSU+OMpT5McA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7f4Ho6HbpQQcJkNsw2k2eLsq40DaFsaqpotmTTGh0I=;
 b=xbdukn9x40CYpYrm5CRPNgvky2EQ7PxM5YhNchWRnR8HRyZSR6maHvPempJbMYQE+S/2Ki/zwAFK1/wQkRJFXeDhXlSJC6PeMN+30MCONDF5T6k6NFR6MGdBsncG4Ver84MZZK28PXGQcK06tPoQutQMs7QQRs+KoXDXGMdD1IijZoaRkxfJDfLS3jAb1cRRTRON6kMgzqafT5VItSGG6sd2T0dTkVc/ITP6Ndtg9FawQ04+QJmCOPAOvTvZO280NvhTIVBjclUrL5zarl96KKzma7yHpxmPBHZRFlm9qUWjIUH1NGRDeo8mVlyH5Uq9tkUzRipBjslb+NXADz12kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7f4Ho6HbpQQcJkNsw2k2eLsq40DaFsaqpotmTTGh0I=;
 b=QmFSXSly6vQRFTblis+6wJwnBfYXYeQ1VY6S/PY+iuK1tX8HtynlR4F+ZNDWLZJWAKcDQrojmEbkEmJMaeoRAh4wMamIkPXvQtv2urZ5sRECxxQdQ0WIRc4ogDpZ+SOMbV8sEeOsGeZxrda5bHGo/1Q9E7e9R3mmJ3YXHfPgctA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PAWPR04MB9805.eurprd04.prod.outlook.com (2603:10a6:102:37e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 11:59:01 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%3]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 11:59:01 +0000
Message-ID: <bd70a54a-ea41-44cc-a971-e9a764a4212c@cherry.de>
Date: Mon, 12 Aug 2024 13:58:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] hwmon: (amc6821) add support for tsd,mule
To: Krzysztof Kozlowski <krzk@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>, Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 Jean Delvare <jdelvare@suse.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
 <20240725-dev-mule-i2c-mux-v6-4-f9f6d7b60fb2@cherry.de>
 <5d5c44cd-6320-4fcd-9409-f3fc97bc5389@roeck-us.net>
 <40ff0c23-f037-454c-9d79-05dd72655052@kernel.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <40ff0c23-f037-454c-9d79-05dd72655052@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::24) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PAWPR04MB9805:EE_
X-MS-Office365-Filtering-Correlation-Id: af1553be-135a-45f4-c14a-08dcbac6279e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGhZTkQwNDc0TlRCSXVFSDJvRzAvcHN1NWt2aHlqOEtudmFZOXlpT3pVN1ln?=
 =?utf-8?B?ZVEvN1lodGhBREl1MStrSlNGdk5jWWZ4OVJoVlcvaDhrdzRFUDRLU2Y4WHhj?=
 =?utf-8?B?REZSa2c1cXRVWGN3ZUVGRW9sT09hTXpjTm83aE5SN0tVaGNSazlldDRnbkV5?=
 =?utf-8?B?RmRSMnNwV01yWWMzRTdMVTZsTm9MOEY3bUU3eW53bEVBTkRlV282WmlDY3VT?=
 =?utf-8?B?OXVVUlVsRjNIMTFLRHNnd254WWVMQmhYTHQvWVN1RnR3d3BkL29KZ2VBYjIr?=
 =?utf-8?B?bmZZUWwwNjN1Q0N4a3UxVXdUc2dZbzNPOWxQbmtpS3UxNmxOQ1ZYekI3WnVB?=
 =?utf-8?B?ZjArdUtiNW5RcWtaamIxV2ROTktnVEhEL0hnWjJHV3pIUlJhVHpDYVhqNWpR?=
 =?utf-8?B?UzhqTTRyd1pueVZRWlVkZ09UT2VIbGo3clNaTHFEVmxMME1RRWpFcnMrNnR1?=
 =?utf-8?B?RDBJQjdGVng0ZWpLdk1DdFBML1c4dmlpYjFienFqL1pCMmZwek4rZVdBbVQ4?=
 =?utf-8?B?UUlJSUlTengwd3FJSFgvdy9TMGg5UUs4T3J5U2FzWFFxTXJ2SFB1TDhNWldu?=
 =?utf-8?B?dkVEQ0U0dG1UQWhhcXRCbzZNZVIvRjVnaG1aS2c4RmZDeU9tZmZkQkY0eWZY?=
 =?utf-8?B?Nk1sRDlDT3J2SlV3eWJkUUJrVnMzQ2QxUnpLWTZtNlZkOEJzUXkycW9TQW5X?=
 =?utf-8?B?MWkwVklHZUgxR3k1aExTYnVLMHZnNk8yWGNJTEtidVdzRjJ4ZjFCU29RME11?=
 =?utf-8?B?NUVtVUdad2t4ekVBSis5WjRYZXZYN1BkL2YvWDUvS1J2K3BCaEJzVnVVL05i?=
 =?utf-8?B?dWxlYVFCUU5HTTBvQStsR3ZCK2xQNWxWdnQwdFExWnVNZHVNRWdkNElkR2wy?=
 =?utf-8?B?R2doTUd2SmczbGpTVXo0SCt1b0poRUR2UTdnUjFoT3A3aDhPTno4WEJrUUEv?=
 =?utf-8?B?a0RTWklCTmsrUEx3eWhvTVQvR2NvZnhqM0JQMGtiQWFyVkVGWFBSaGU3a0dh?=
 =?utf-8?B?WmFBcENWRGtHcXRoR1Q3K3VzVXNOSjM3V2tiSnowcnNVOTh2RURNVVdzb01C?=
 =?utf-8?B?RlhYaWZTRDBiQ1NrcklhV3JUZDBwcmdpbStaUzYvdDE2L0JudE9RbzBmYkZX?=
 =?utf-8?B?bGpkR1dCWE42QkNkTE1xRTRpaEc5R015Tk9UWk02ZTF3eGdTRjV4eTNLSExo?=
 =?utf-8?B?S3JDZ3RqQnhpQWVjTXIyajdmbDhDUjdGcW5qQ011enRxOEpHSlF0bC8xVmFh?=
 =?utf-8?B?UnNXY1Z5T2FUcDgwNzdIY2dqKzU4MWJTaDNjLzc1emtJMmh5MnY4ZU53dmxG?=
 =?utf-8?B?eUI2Q2tqQ2JBc0c5ZEdKaGZnLyttSktaTjdWQWxqMUc0VW4rdmNwc2s5MGNX?=
 =?utf-8?B?RWk3a2FCeWxSUlNRVHM0N3NDVWVJMHlKY0h4NDB2TnhueFRWc0c3bmhtYkhh?=
 =?utf-8?B?S1RHSGlrM3N6RzlUR0d3akkyMXkxWE1YU1Fac3k4WnMycyt2QytNVDZPN21M?=
 =?utf-8?B?eEd5TVFZNnB1dFVVOVUxaUZCL0dPdnd2MkVBZXk2S3ozZnlCYXA0QlF6ZzNQ?=
 =?utf-8?B?SEZFS2p1RmhNbWJma0hjeXBkbFIxYnVSQjdZYzJxbXBreHQya2VtTGYwcGpt?=
 =?utf-8?B?RDVFNWh2ODh3RHErWk1RZFVFbEtQREJSVE5GeE9BZ2RlbTFNWUQrdFdQcG5R?=
 =?utf-8?B?N0JSV0ZZSUxmU2dXbGlzV0VXcHpNSXlUeWVzV0FXRklyZXVianJ6RTQwK2Jm?=
 =?utf-8?Q?RbNjIaq3Y5RjnRaIXU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkNPeEt2TjN3WGU4cWtKekFLNEt4blp5VjJJSER5QVQrR0s3VHh5T3R5VGR6?=
 =?utf-8?B?U21EcWRVNVpWbFl1TzRDNWszYlkzeHNBVkFuTEtiL2hJTVI5NmRZNEp3c0t1?=
 =?utf-8?B?bDk3RS9nMituY0ZPN3FxejhLdWNhalNrU2xqZ0xCUDlmTXVsM3pobnp2RlRH?=
 =?utf-8?B?cFVZSy90RkJvVFdLaHZMdXhvMkZYWVVZK2YybW1WbS85M0MzK0x1UlRlVzhs?=
 =?utf-8?B?STlpTjBubWNlRHBzdVRIQ2x5Rm5NeUgzVTI5WFFDMHpic1JuenBDdlVIRDYy?=
 =?utf-8?B?dUxEcXdhejRqQSs0ejc1WDd6bHhDVlhxZ2ZMdFRBcWFKNys5SlZHVGhoaFJM?=
 =?utf-8?B?ZzgvcVliMStlOThrckpuRFhEbnZaRFdSdW5kT3R4S3VCOTR3Y0htUTlTU3Vl?=
 =?utf-8?B?VS9YYldjVWlKUUhxellHNmlYbDNlRHp1aUZBd2dlanBDZHZRSU5wdjBsS0NH?=
 =?utf-8?B?SXNGMCt1UjZxUlhyZzdGVFB4NGZQOUhyUGY0MVU2YzNtaklRUFlIeFNsTU1V?=
 =?utf-8?B?T3RXUVZzcDkxa05pbm93MHBSNDR5ZXZQYmhDd254YW5PL2hxSUp6Q1F1YnJB?=
 =?utf-8?B?T2U3VVh1TzkxN0VPTWUrVVFlcytvaTFKbnhvNGl6Y3pFK3M1YmF3YkZqYjI2?=
 =?utf-8?B?UkpqelRZRU9Ib3c2QlgwWjJmYmpuTy90WFhYSzlpR0U0TmQ0OU95TFFxb0Nx?=
 =?utf-8?B?aWdodDJKZDEzc1Y4MzNsaXFSdEV4Y3FBZk53QXdtRGhWVkJwSG96ZW5YYm9u?=
 =?utf-8?B?Z0U2R0NWN2xrMzFCMkNReG5BcU9iTmU1dGdia2RDNjB5a2ovM29UMzRyNGNr?=
 =?utf-8?B?YkhwUzJMWVNMUEhmcldFbFg1UWY3MzF4eHRES0J6N0g2Ryt1WDc0T1NMOThN?=
 =?utf-8?B?anBsQTVsMzVNZ25lR1h1UnJNRWdNb1ozRHc1Vy9KWkhHaFo2N2pRRFVXMnFC?=
 =?utf-8?B?SHMxN2hlODZwSjY1d0xZa25raEM2Ykd2dGtGc3NML0RIbi9iZmJ6dFMzMmpG?=
 =?utf-8?B?TkNZaEMrNTBuSW56ZVBVZzc4UmFzaUlzMnllRFhpTHFuVUV5QWlXYTR6Q3NZ?=
 =?utf-8?B?WUhhNFIzUWhDTkppS2VGc3ZOVjhObm1Id2tvbGpkbisyWUpmWGxEQ2l5Q1pZ?=
 =?utf-8?B?WkozbWR1TjdsOHNibjhsSEtIbUxOZXNIcHhLY3VwRzI5ZUFUcm1UUGNIRmdS?=
 =?utf-8?B?VFMydWdTZW9Kb3NiNHJWVU5ZY2JlZUJYdmpva2hIVS82WVN2MnhHbHFrblpB?=
 =?utf-8?B?cDdqUDlrb2lJSmdQSWQrM1lESVF5ZzltSDAwODFSeHVqeWFmV1lqZGIrblRG?=
 =?utf-8?B?Ti9nSzlnVHNTV0lMeU9WNUx0RVZiaXZyNVdWajVxWU1BM2lsOEUwTVUvOG1u?=
 =?utf-8?B?ei9DUjFCdW5ZcmpLVHRVd2x6emd5cUpVSVMvUnZ1YTREckZFM0w1T1pkSXVs?=
 =?utf-8?B?U0dGMUZiejh3UWE2VFJWSDFBNlF2SExUMzIvQlV2NjNYVTE3TUdtQVNDaEh0?=
 =?utf-8?B?TElUZXNPdEd1Wm5DQnVZejh0K0hMdHQyYTVuRUVmVXZLMy9lZ2c3eUg4QmNq?=
 =?utf-8?B?VW1HRnB3bkhNYis2RFo0YitBSVg1SzJKZU9nQjlrckdYbVlaWk9pSUdxbTNa?=
 =?utf-8?B?VllsSVh1Q2YwcnMzdHZpeWNSMVdmOHJlVTZDU0NvSDkrSzJOeDd3T2VIdXNv?=
 =?utf-8?B?eUNIaG9GNDk5Tzg1R2RtL0ZLcU5Ic2dOYythZW1yNVcyZkRwdnphQ0d3L1pJ?=
 =?utf-8?B?WUhLaE1wa3EyMXArTktrcmdmU3RqRlUrcW1JWXZMYzYwUkRxZURkOU80T3g1?=
 =?utf-8?B?ckEzb2xSVVM1RmVzbjBNMWkvVlJMYnRHdE9IS3o5alR6eEF0VzhoVTZJSnZ1?=
 =?utf-8?B?WFIrdjg1Y3ZFYVdzMmdnbWVFU1VXVFZNZGVvUVloL0IxdG56UEpaRnc3MVh0?=
 =?utf-8?B?YWhFRldMUG9qbG04OXJ3bmFPY0czVVlNaHJHOXdaSzdJTXg2eFRHZis5OXJN?=
 =?utf-8?B?WHhreWdhWFhkNXNqak1qNS9pajV4cDBWUWt2dHplZmtleVBoeUk5L0RrTFBF?=
 =?utf-8?B?RWNEa20yOExqQWVzYVl5WWljcXUzdG15ZUVBNmlGUXl1ejVzNmZ4TXBzbGpj?=
 =?utf-8?B?Mzd3aE5HRDQ2WFR1MjBZRHRJOWMyUFhxK2FmRHhjNzZZT1BSbmxJaGN4ZXJw?=
 =?utf-8?B?UFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: af1553be-135a-45f4-c14a-08dcbac6279e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 11:59:01.1885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wtcf5J+tZrsmJ+MCVdKhDQQSju82ehg9Ckboa65UPMa0L2pBmNw1RzhZmfwvOdXiETPycKgN9zxKqpBD+oCGKw7l6SOjZGzfx0aXT4RoWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9805

Hi Krzysztof,

On 8/12/24 1:38 PM, Krzysztof Kozlowski wrote:
> [Some people who received this message don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 31/07/2024 17:12, Guenter Roeck wrote:
>> On Thu, Jul 25, 2024 at 03:27:50PM +0200, Farouk Bouabid wrote:
>>> Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
>>> among which is an amc6821 and other devices that are reachable through
>>> an I2C-mux.
>>>
>>> The devices on the mux can be selected by writing the appropriate device
>>> number to an I2C config register (amc6821: reg 0xff)
>>>
>>> Implement "tsd,mule" compatible to instantiate the I2C-mux platform device
>>> when probing the amc6821.
>>>
>>> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Applied.
> 
> Eh, there is undocumented dependency on I2C here. Next has warning
> because of this.
> 

I think you meant to comment this on 
https://lore.kernel.org/linux-i2c/20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de/T/#mdb7976f1dc16fce0b7db9abee6fd0b1fd0a2e2ba 
(patch 3 and not 4 of the series). This patch (4) is fine on its own I 
believe, no dependency on anything else. (well, except if we expect 
bindings to be absolutely merged before the drivers? I think what 
matters is the Device Tree changes making use of the new binding be 
merged after dt-binding changes?).

I agree that there's a somewhat non-obvious dependency between patch 1 
and 3 (the dt-bindings) and 5-8 with everything before, we could have 
made this more explicit.

> Farouk, please *always mention* the dependencies between patches.
> 

I wasn't aware of that rule, my apologies for not catching this before 
upstream submission.

For anyone wondering the rule is made explicit here:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#separate-your-changes

"If one patch depends on another patch in order for a change to be 
complete, that is OK. Simply note “this patch depends on patch X” in 
your patch description."

Question about b4 workflow though. I encourage using b4 to avoid as many 
mistakes as possible and make the workflow as painless as possible. I 
believe b4 doesn't allow you to have per-patch notes, only in the 
cover-letter.
a) is this dependency list in cover-letter acceptable, or
b) need to add it to the patch note (below the ---), or
c) can add it to the patch commit log

I've seen subsystem keep vX changelogs in commit logs, and some who do 
not want it, so maybe there's no one rule here?

Cheers,
Quentin

