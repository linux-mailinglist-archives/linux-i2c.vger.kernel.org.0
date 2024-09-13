Return-Path: <linux-i2c+bounces-6663-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D48149778CB
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 08:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93F64285645
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 06:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589821AB6F7;
	Fri, 13 Sep 2024 06:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ivVazJUA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B391AB6CA
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 06:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726208708; cv=fail; b=K3uTAr5eMfQQF1hYXx+QUMn9N/qrsXKAsgLS31+7SJk/wdi2s1iNOatGQ3zENnap59EDn3tLW1z8H33mxQR/lMa4JbtQj2u89UstS+Bo2zLNtbjGgBqXyEkOarux07D2T5Js6yd7IREnyVdq3zotV27Yr8pusmGD5ZqQH7jC2GQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726208708; c=relaxed/simple;
	bh=E/+Boy2gDH8felyA0VQWR934Y+2hWAnne0pem+Jw8TQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BIIfZEIH1E+n/LThKTW1Xu7MotSHXbkqqpEVsl4aWTnjuwTDEfzqa24HiN4z4FB51CDzbND8UXNN09qa9+lwvuIQyysiPHH1sBMAtuGMsFCtDzjAjZVDuBdBwZ9h+keKKUyRHkWmjKzHLcEcYdKN7w9vBNe+sXOppIvONSXLWvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ivVazJUA; arc=fail smtp.client-ip=40.107.236.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZTFBxjBCedMplo0RJT0HQe+B1dAE5E0od/lwoxR+owXVDf/SwR9yeiQ6QpCM1qIVJnL91r5+GjKE0xVjFFhIBaajwIb9hztQOn5HR3HFZQXm+o+GLM5lyZ/gKUhxLEyvs1YnEp/3yRmltzVgR1e6XlgTAEXIHUVgEK8n4aSRsMOnLzJJVdJtih0jyu6MsrbTz1SE3uw6AK6xceseVYv/DiFwPH4w2MJvOO/f9C8ntZWB5z/I+fDLq1Fiz44OfZNsuLgwecxYD7V1Wf2LPLTAwaU7plkqdFrMH8rDJee0FLqDP3qgdrd313paQzXos9y4xqB1YfPpITg9M77eZwufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5CzI095M4BP3mWtp7GITXAD9C2HOQgRN1gv2U4fRzM=;
 b=uAdzed8J7CddYskGPaaw0/UrSmp1BDZGss40/fa3S5GAWj1gG4fWxc2DR5L034UCWGEPCGmCuUJ5leXEpPFk0TPuv5BVPC8osFwQdeJAUsfvh6MN0DEr0PKIGmRf96oeu5buZ5xDpP7jJVpAFytN3pUH0tWFuOwaiZwOeMFDe7mGbxRvEq3vH8Sb7V/gMwn7CRmghmCq7JDiS11nFj9RpaL2+AByFIBmq4JFmJVst4b2z9IOfAAaHcmRiX/c907vT9TqSmoDq8ZSczGuWH0m0gp44eQvGAhQSZ/SVnMN1rMnp1qWDapC2SGajLGQ/6iWbyQnio/QnrVmqSRxqfnlig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5CzI095M4BP3mWtp7GITXAD9C2HOQgRN1gv2U4fRzM=;
 b=ivVazJUALyF8hV47aXD+yLYLSwBy092wusqKFO8VtBH2gWK8rMwL1qmYWyONk4kYt2UZ0BSJOmd0Ftr71jUpNrQiTH8rB27/7O4X/Bkm8rcAsGXEXwJchGkY3LWnBynX+FtJFhhuG6TEq3OZdDgZ/r6cGfTGjgzAG3gTttPe7F8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by LV8PR12MB9083.namprd12.prod.outlook.com (2603:10b6:408:18c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Fri, 13 Sep
 2024 06:25:03 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%7]) with mapi id 15.20.7939.022; Fri, 13 Sep 2024
 06:25:03 +0000
Message-ID: <1830e424-c74d-44d4-8d36-2f2a86eba99b@amd.com>
Date: Fri, 13 Sep 2024 11:54:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] i2c: piix4: Export i2c_piix4 driver functions as
 library
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
 Sanket.Goswami@amd.com
References: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
 <20240911115407.1090046-4-Shyam-sundar.S-k@amd.com>
 <xog6iyhri64cml2p53ncja6lxpt256eqceru4jxi7ee4esnb2j@xrbmeheorofv>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <xog6iyhri64cml2p53ncja6lxpt256eqceru4jxi7ee4esnb2j@xrbmeheorofv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::24) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|LV8PR12MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: 483dd0b7-57c4-4b6f-bc36-08dcd3bccce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3psLzlPcDNVQlpPTFh4MXRJYVZTSlpXTVYzN0F5OVlXa3BJbjgrekJYMW9m?=
 =?utf-8?B?Wnd3UHpTeXB2Z0VNTVcvUmYzaEQzV0tiY1YycjduRFR4ai9ISzExLzY0NVhW?=
 =?utf-8?B?bnZJWWV2OHJvRXN4V1NCbGpMN2kwSUlZNm5uSXRuQzFUYVltOGtLTGFwMGdx?=
 =?utf-8?B?Y1BocnRQK1dzMzd0VURPelRwQm1GYnBsSTR6OHpRdTBIaFBoQ3Y3RUdONFMx?=
 =?utf-8?B?ZFp6R3pTVVJGdWIxRWs2dDNsZ0FaekRReklib3B6QmdMWUVCNzRrRFpSQ25N?=
 =?utf-8?B?UkRIU1R4eVI4SWJSZHdhSDl6UlRBU0FPUzQxbGFCSmlBNGVsUjMyZDNPdjcy?=
 =?utf-8?B?MStWRDE1M01kbW11NkpjQXhZbDIvVUVidWhhcjd1bWFpWlN2bEd0TDBDM1E1?=
 =?utf-8?B?N2Z5bThiMnJreDRNZUpWSkV6cVNlWHlKYUFqQnE2NUtGWUlGQXhHYzJJWGNG?=
 =?utf-8?B?RlYyZ0Zac01SMXRkZGpCelE1YUhubmRWWk1lWHovZXl1NlpRWkVDWlVVZG1z?=
 =?utf-8?B?NXJoUW5VT3JBL1BBZkREaW5aK1JUbEg3OHB2VlloZmVTc3NsOGJydWJ5ZXVP?=
 =?utf-8?B?dlZHYlc2WkVpQnpSSlRzUXZ2NFY4elBKekJPNm1wNTcwM1BGODlVMUl5cHN1?=
 =?utf-8?B?ekZURWxmZm1UQmVsOWpSa2ladlFPUG5STVJrQkNUVUxxcFIyTTRFU0dXb05s?=
 =?utf-8?B?Sk4xdjZBTVp1b0JEV1ZXV0cvOE1kdWxMT3I4a3ZjeDZ5eEh3WHcrRkZXcC9Q?=
 =?utf-8?B?bnZKSHF3V1EvY0RxVTRyS3dodlN0cEZkZytYYUdEM09lYUo2SUR1ZzEwc0NY?=
 =?utf-8?B?ZE1vaEIvakEzTFNoQVd2WDlNZFJFdmVUSTU2SkJLY1ZNbzFmMDF6SUNGaC9X?=
 =?utf-8?B?eXRiSnNodmkwb0hQcGl4WFhCOXZIQkEyRXNERTBpSWQ3cCs5ZjVVblg2U21k?=
 =?utf-8?B?Wm93WEpLengwMno3SzRoOHNIRnEvRlRoUXJvT3A2eHNPN09CZ3RHc056SnJq?=
 =?utf-8?B?cEh0K3NOSEVJUFlCKyt3WG9EVzRoMXRGaTNwN2ZPYTcrc1RJSDVMcmJsTUNB?=
 =?utf-8?B?V1VuYmFEMDhxNDlVaGw0Y3hBM1A5M1NDT2Y3ZUsxTlladzhEZzUxZ29UVE9N?=
 =?utf-8?B?eDZXQ3BwZXk5R3N5SmcxamRuWkpuTFRwL29nZXUybFdmTkpKcThScTRoblFC?=
 =?utf-8?B?dlRvZHM1MnAwVjg4ZWRCamVZczZ0akxWWGsvTzQ1OTVxWitkbVg3MUMzL3Qw?=
 =?utf-8?B?dVI3eTRvcUlOY0JTanQwNy9jYWQvT2JxQXJjaFBWbWYyUlI5ekZJc3c0WE1F?=
 =?utf-8?B?YUVqem1NaGxVK3I0dGE0OFFaMVU0aU9UdElrRmFOL1JGZnEzMjFmU0NINWJQ?=
 =?utf-8?B?SHlFZlVLcWZXNHppaGtha042ZlJkeFBEbHVqa0ZLWmtCdDFrVlF1cXZtdXN6?=
 =?utf-8?B?YW5teDZEb0MwSGRvb1R3cyswUUlma1lGT2dubXVHRUdVb1EwbXFxdThsc05t?=
 =?utf-8?B?c1FFalYzRmZ5SXJRaWQ1Y1FFREplaWowL1B3ZWl6NlNDUTZ1blE2VzZYMGpB?=
 =?utf-8?B?ZklZU3Q2NTcyRDJwaFZtMjNTRzc5NENrMHVaNlpoVUd2Q1lqR1B6elJodnRG?=
 =?utf-8?B?aW5tZmIvY29wMnRvM0VOOWM1VmZVQlZsUW5YNWZJcUtTZVdyam43Z3FrSUdI?=
 =?utf-8?B?R1Ava1YyVytOeS9ObU01UjUzdThsNU9MVmowdldIS3UrbWNRNW5BS3dLZkRW?=
 =?utf-8?B?ZlR0Vi9ad2RrNVhjSkJXdFd1UnFwajFnRy9JbTZsMXQvSkM1a09SbVNBQVkx?=
 =?utf-8?B?MFN6VmRubnJxdDRPb0VwZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDJhN2IwRTk1QVg0bU5GUC9ONWthVXgyMkR5SElRWVpkdnJSb1dXcmNYMzRB?=
 =?utf-8?B?cU4yRkM2bVJMOXhWZC8xUnpUTk5JenBsZ01WMlJuRWlNVFhGN29VQm9hM3NR?=
 =?utf-8?B?U0pjZWEyNTNSdk9kUEJtR0ZobDZDWkpRQktsSXlMV2pLYjhCV2lsS1RxNHRH?=
 =?utf-8?B?U203blVXcVh3OXpMUHNVNDdwM3pXNHNjQzFkRXpldmlDejJjMDgvaVRndlp2?=
 =?utf-8?B?OW5uM3VxOTRIcGJnM1BZdDh6cnl3S3N6alZJOGVpMWhQYlF3bDdIcXdleW51?=
 =?utf-8?B?ZlZJa29ZdmV5Q2RhbmtLL29uNlVPbHY5REltY2xZY2lpRE11UFg0MXQ2MW9j?=
 =?utf-8?B?UGdySDNxMCtUZ1lzd3JVeHk5emJLVEpEUUg3Y3doSHl4clBOTVBJWkpqcE9X?=
 =?utf-8?B?SS9uQXJTTjhVOWZGaEg3d1ZYVXB4U083KzhpNEU4U0JZaFM5MHpVdXdaZmR3?=
 =?utf-8?B?M3ppb2hJdmJZOGhKbXBPRGVLNVVwQ2NDTlFFVzlCMWlhMXRTRVRhSlJublBw?=
 =?utf-8?B?dkI0ckJtb0NrUjhocm9xN0NDelExbE8wMTVGM3N1K0VjYVR3ZnF4WHZIc21u?=
 =?utf-8?B?WkJzWUJmY0xuV1FxVTdHV0NwSXFsVG4wK3pmdUY4Rk1Xay9uVFpTZ3JIbytu?=
 =?utf-8?B?NzExQjF1K2t3Z2VHclE2MVlFMU5Ub292TnJZZGU4cTJHcDFBbkk3L0RaYnBI?=
 =?utf-8?B?S20rNTlyTm5EODZkTkZTY3dvRFJWRDVFRVVvbFdoVDNhNXB5aSt4b3BrRFRQ?=
 =?utf-8?B?alZPbmphY2t2SVhYOWplKytZSDYvTU1rOXl6eWMvMU9EeEZUQ29ZVi9xbk0x?=
 =?utf-8?B?VE0yZDFPQlVWVGJyQzA0RDc4QUVybEUvL1lBa3h1bzY2MUpKa2tuc2MyS0Ri?=
 =?utf-8?B?dVJVU1FZNitpenludlovYUJCcy80N3JNVlVxQjEyWm8zRjZTTmFxZ0pxYU95?=
 =?utf-8?B?SlBFdEw0b2lBc0kybFdRQktOWE81L0ZZallQd0JEWFg5cC9tODdYTHZPZzF0?=
 =?utf-8?B?dXZreU1mMGhaNlRFQnp1L3dYaUx4SWUyb2FRdXlFdk5mK2hmLzRDVGtmTVJ2?=
 =?utf-8?B?ZkxrU2xneUUxOXpVTXFNM2JzOStnUUppem5Ldkp6dkpZUFh1N3B3VE1tWVlK?=
 =?utf-8?B?WHY5cnVOQlRHMFJtRUpuOHkrVlRVbEptMElRRnhZSlZnYkptZmcweXJYdUQ5?=
 =?utf-8?B?a2REanpielpuclAvdUY2TFo5cGd1cGFSTnIwTXBBRjNpUW12MGhocytCUXp6?=
 =?utf-8?B?bExlWDNmUWN6UjlGWTRNRmt3TnpXTE1PVEFRQTZCeU1HTUluQzByU1ZtWHQ2?=
 =?utf-8?B?ajZlRGw3Ni83R0E3UTFybW1aZlhvelZlcno2blhOcjFnYXMxeTJpSElWK0Iw?=
 =?utf-8?B?WU1sUTZxdFV4WG15RUN6WXh4Ny92MytYUm42dE16eVNBV20xdmxPMjlrOXpL?=
 =?utf-8?B?RjdiaEQ5WjEyWFJuOUpGbDBlako0TVk5UkFCT2pQZW5KaWJ3Z0V2aEdueWFo?=
 =?utf-8?B?MDZWcTdidVVGbGIxYnJrZUlQdGc5UGVDR1RCOGJsRDRQUytLVHZVa3Q4dW5n?=
 =?utf-8?B?WE9CQkhFZENsc3R1NlR6bVZlUTM0dEpnRXpLb2Yxc0IrNEFPWEk3SGJRUGY0?=
 =?utf-8?B?U09WNmp6Q0JFUEFoMU5vVUwwTHdzSWlxSlk4ak40ZndBU3ZCMUgyTkpVdno5?=
 =?utf-8?B?YjVlSEtGb3ZNbTlPSFMxSW85d3hCVy9PTWpOcXMwd3QwMVY2dFNnN1BkdTJv?=
 =?utf-8?B?YkkvZFdZZmg5ZlpTbGVLZmo2cE1YQXlEamRqSjRJL1gwNmF5VEdrQXJRK3pK?=
 =?utf-8?B?ZXRkSzdFcElGKzdLcVAvb1BlT0NaK2RKenVTWDJjWFkrYUlwR1M4ZlFPeGxH?=
 =?utf-8?B?UStkK3B5MnZNMGZyWmRFUlBtTVc1ZmVrV05oUStSWWN2NEhDcWhybzdoL3lJ?=
 =?utf-8?B?aTg0SUFvK2pRT1pjSHQ2Sm04RG1Fc3o2RDBBUER3cEtmL3BxOS9UK2VXWVJp?=
 =?utf-8?B?ZDNrSDV2TnpXRlkweHVzb3RNTjlmMHVKc1V3NVo0b0dqaVJHdjdZTVI0cFU5?=
 =?utf-8?B?OGF3R01EcnlGSy9UYXhnaExpTVU4Tmt3R1NZaXY0N2xDaStqWU5YUm4wTUY2?=
 =?utf-8?Q?W03ufhaKKLkR0jr0YxmAAIgzs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 483dd0b7-57c4-4b6f-bc36-08dcd3bccce0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 06:25:02.9886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/Gv+N/AOemUXCTpwJkdIJ1xCquFIYVu+hIw6qsPX+7vBZWAFNG0VDAfjYoR4mI9/889vi+MOhBik3rpOUN0IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9083

Hi Andi,

On 9/12/2024 13:10, Andi Shyti wrote:
> Hi Shyam,
> 
> On Wed, Sep 11, 2024 at 05:24:02PM GMT, Shyam Sundar S K wrote:
>> Export the following i2c_piix4 driver functions as a library so that the
>> AMD ASF driver can utilize these core functionalities from the i2c_piix4
>> driver:
>>
>> - piix4_sb800_region_request(): Request access to a specific SMBus region
>> on the SB800 chipset.
>>
>> - piix4_sb800_region_release(): Release the previously requested SMBus
>> region on the SB800 chipset.
>>
>> - piix4_transaction(): Handle SMBus transactions between the SMBus
>> controller and connected devices.
>>
>> - piix4_sb800_port_sel(): Select the appropriate SMBus port on the SB800
>> chipset.
>>
>> By making these functions available as a library, enable the AMD ASF
>> driver to leverage the established mechanisms in the i2c_piix4 driver,
>> promoting code reuse and consistency across different drivers.
> 
> ...
> 
>> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
>> index 2c2a466e2f85..174cce254e96 100644
>> --- a/drivers/i2c/busses/i2c-piix4.c
>> +++ b/drivers/i2c/busses/i2c-piix4.c
>> @@ -153,8 +153,7 @@ struct i2c_piix4_adapdata {
>>  	struct sb800_mmio_cfg mmio_cfg;
>>  };
>>  
>> -static int piix4_sb800_region_request(struct device *dev,
>> -				      struct sb800_mmio_cfg *mmio_cfg)
>> +int piix4_sb800_region_request(struct device *dev, struct sb800_mmio_cfg *mmio_cfg)
> 
> I’m not entirely happy with this change, or the others above. If
> someone runs a git bisect, they would be confused by not seeing
> this change described in the commit log.

Can you elaborate a bit more on the expectation? The commit message
has the details on the each of the functions that has to be exported.

Can you please take a look at it again?

> 
> While it's true that the accepted line length is now 100
> characters, the 80-character limit is still preferred (and
> personally, I prefer 80, though that’s just my opinion).
> 
> This change doesn’t seem necessary, so please amend it along with
> the others below in the next version.

Ok. I will move to 80 char length.

Thanks,
Shyam

> 
> Thanks,
> Andi
> 
>>  {
>>  	if (mmio_cfg->use_mmio) {
>>  		void __iomem *addr;
>> @@ -192,9 +191,9 @@ static int piix4_sb800_region_request(struct device *dev,
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(piix4_sb800_region_request);
>>  
>> -static void piix4_sb800_region_release(struct device *dev,
>> -				       struct sb800_mmio_cfg *mmio_cfg)
>> +void piix4_sb800_region_release(struct device *dev, struct sb800_mmio_cfg *mmio_cfg)
>>  {
>>  	if (mmio_cfg->use_mmio) {
>>  		iounmap(mmio_cfg->addr);
>> @@ -205,6 +204,7 @@ static void piix4_sb800_region_release(struct device *dev,
>>  
>>  	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
>>  }
>> +EXPORT_SYMBOL_GPL(piix4_sb800_region_release);
>>  
>>  static bool piix4_sb800_use_mmio(struct pci_dev *PIIX4_dev)
>>  {
>> @@ -514,7 +514,7 @@ static int piix4_setup_aux(struct pci_dev *PIIX4_dev,
>>  	return piix4_smba;
>>  }
>>  
>> -static int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
>> +int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
>>  {
>>  	int temp;
>>  	int result = 0;
>> @@ -587,6 +587,7 @@ static int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short p
>>  		inb_p(SMBHSTDAT1));
>>  	return result;
>>  }
>> +EXPORT_SYMBOL_GPL(piix4_transaction);
>>  
>>  /* Return negative errno on error. */
>>  static s32 piix4_access(struct i2c_adapter * adap, u16 addr,
>> @@ -740,7 +741,7 @@ static void piix4_imc_wakeup(void)
>>  	release_region(KERNCZ_IMC_IDX, 2);
>>  }
>>  
>> -static int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
>> +int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
>>  {
>>  	u8 smba_en_lo, val;
>>  
>> @@ -762,6 +763,7 @@ static int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
>>  
>>  	return (smba_en_lo & piix4_port_mask_sb800);
>>  }
>> +EXPORT_SYMBOL_GPL(piix4_sb800_port_sel);
>>  
>>  /*
>>   * Handles access to multiple SMBus ports on the SB800.
> 
> ...

