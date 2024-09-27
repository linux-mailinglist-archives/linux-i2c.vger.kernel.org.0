Return-Path: <linux-i2c+bounces-7062-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0039887B6
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 16:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D3FD1F228F2
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 14:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501501C1732;
	Fri, 27 Sep 2024 14:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="U/BHstmX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2065.outbound.protection.outlook.com [40.107.241.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D391C172A;
	Fri, 27 Sep 2024 14:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727449101; cv=fail; b=CmfxkoUeXGofe/9C3JVH3+ZM0iGzSq/ix88SBuK0J/FD2ciiyL0eNVzPyd1mFcm+Hnc5CbS9dhRu7a+DTCF8PvyFHndSw8iSXmecV7LEHgy02I8nIObRBdmHad26exdgXe38vz0qo++S6DVsJQw52W7kX4/7ykZ4lR6K9xq9TaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727449101; c=relaxed/simple;
	bh=1dRmZswAg6NoiKmyMrqMg9I/N2V5MyjviSOZoUY31zk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ixVVGels0hO1YFMDbX4GeoCAnWzcQdnDHpZTL44aGIosP2xAPv0ZZAbca9a658ot9fA5ldU8vPyioovTHEZoFL+/fE0Pad/cjbfzB2/Xbxu8E8QtuP/ThxFHkpdAZyVEP726M9lJe2J7j9xm2hi6wLnf6c/kQU4oF68rQPzBbSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=U/BHstmX; arc=fail smtp.client-ip=40.107.241.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v731WUWpl2ci552+qttFSjgax92zwJybgNzQCC+FPDE1lFF1ILCDoOLALApbPebxn8XZeb+LuHl3AZWT8lDgPAIP87Pn96ZXMXfyK+ZAHUg08wLE6rWahxNIn4PewVAQMxip5hBGeSGTprTXyfFF6lfbYyGdxS7atCp+gPbhE7MAV7fcHASWC8rAvt6j+O8ggL3hqKcu8PaJQ080dbdg8D5dyKJYzYPFAkznbCpdVVy/HkOZKPIc8hcv+Ryldfdy/+y2R5vKuBXFGZGJsSlmh7ztU2dGkzbwO6pFOl4gjXEp9cXuwpeBJXTCpafHuRNxJXQYJzxKerSZfOGakQbNYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdBhvxwRmJCjfv5jF8yAl2AC9ZuNdT/cokZimrMtSa0=;
 b=FphXzNWbRQedVb0J1ufH8lwRVuSRcYSteyFt7wsU/Py3ePdbi7If/Qk3GpRgQCJBttsRAces+8GqTq6GmdvGOSE+2YfNzfyKGsH6NTtp8r6s3RnTve6PY6bHLBpoN/ekL8WREi9nN8jA378M4qS9NRkSZoWVGr+8UGVkcHlg2HM7qohrfHxiNQnYFc3qglaTOrX4C1FQQZ50TjjOxkK5B7lRK+6Kza8HCONBRunNk0l+ulsfhw1OolD2eKMdxKGmJZrdEZ/ESKIMnaLd+GZasaJ1I20hbjBniXv5EDzb2IWZsw2WIPsk0ieaj1ehASyi/73jE+0rswR9r3/BpMP/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdBhvxwRmJCjfv5jF8yAl2AC9ZuNdT/cokZimrMtSa0=;
 b=U/BHstmXG0QAHjV2pRzUu8IH+NKqyhHah70gGat+Su1kGo5ddcmsMP2RyjMhRKDiiB+MBoBktIjM3HpVdOrIxapvo3Uqn0fLiQmWjtnJc16133fqmU1DJBD+dS2E8JrLLKFtb0bejqpysaiOAXI/UR4bDy1/EvhT6QIta7DrYxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by DBBPR04MB7692.eurprd04.prod.outlook.com (2603:10a6:10:1f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Fri, 27 Sep
 2024 14:58:13 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%7]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 14:58:12 +0000
Message-ID: <df6b9303-155e-4796-adb2-e05c7e76e289@cherry.de>
Date: Fri, 27 Sep 2024 16:58:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/8] dt-bindings: hwmon: add support for ti,amc6821
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Quentin Schulz <quentin.schulz@cherry.de>,
 Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
 <20240906-dev-mule-i2c-mux-v8-3-dbd28a150e41@cherry.de>
Content-Language: en-US
From: Farouk Bouabid <farouk.bouabid@cherry.de>
In-Reply-To: <20240906-dev-mule-i2c-mux-v8-3-dbd28a150e41@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0266.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::39) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|DBBPR04MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e54c281-fa0b-492c-69b9-08dcdf04cf1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2xYeWhaQXd4elFKSEg5RXoxY1pYZ2FUOTFwYnpmTXlXV0pSMjVBWkRTTWVv?=
 =?utf-8?B?eVE2ZExBd200anVvc0x2dUdJYTNRWVg4QVJodm9uYTVzNE5EOFNvbHk5YUlx?=
 =?utf-8?B?dzUzOCtvR0ZxdjZRUXFKa1pRQ2Qvbk54eTNTSDlhTWFiSFc4WHE5VCtpVEZP?=
 =?utf-8?B?RjQ1aVJxcCt3Y1RJa1VsdG1laHU5TXJadnZHQlZFaCs2SmFTcEhpenFaY0pH?=
 =?utf-8?B?eDkzTWxGaS9xb2JpUlpJUVFjK3FsRVoreW5yWEpCUTZIdmw4b3QySDRpOWhD?=
 =?utf-8?B?QTJGby9rQ1pLMDRjZ053ZGtISzhnWWdlNDh5NWQ5NG9zbmVLSklpRERzMnpw?=
 =?utf-8?B?ZkRUbHJFZ2NBa0RvR2RWMDNzNWpQNW5KQ01Fd3kyY1lvaitjMGxjVDBJNDVJ?=
 =?utf-8?B?eVM2RGpFRXZ2MEJDeGhEUDZGR0ttMThLQ0gxaG1JT3FBSGJJWklwWUpCU0tR?=
 =?utf-8?B?ZzMxTjVXMmdCRWxKekxYMzdISlNNVUQ4akJUbzZOOG5NOFNZcjRJT0M1VWZh?=
 =?utf-8?B?MTVIZ0U4dE1sbXVzOTVqRTYwWXVnN3Mwbk9JWlVHTTFxMlZqcytaMmgycEtF?=
 =?utf-8?B?eW9HbGlUVTA2a2J4a0JkUVJHZjB0cXBDZ1o5WlFxcm1TUTg3S1d0VC91SmRu?=
 =?utf-8?B?VXV5N2diZ1lmVWUyWjJlcE1lTUtyQVBmT3l0THpCYXJsUWtmYWF1RXNDRk9Q?=
 =?utf-8?B?Z2JWQ1VLdCtGdDcvbmlDaWhhb1p3b3IyYUhNMUlKOUc0WDAxOTRvT282OS81?=
 =?utf-8?B?MFh6bGcyVmdUNUNjbE9kWitZOHR1MGZOWXdlR0tlQTZRT3hTSHY3dGs1QkFi?=
 =?utf-8?B?Ry83SDk0Kzc4SytrUjEvUUNCcUhzSlNGNFBVV0hWRTZ3TzVGc0lqVjYwS255?=
 =?utf-8?B?cDdWRzBIbE5TZUFKQkF1MmRGUUpEV2tlWTlJM0VndnE1eWFwcWRzK1Nzejdv?=
 =?utf-8?B?TndCMmdVUXFndGJnd2RhQUV0QktxUXdwTEJPeW52YnZET1BsNHhPNlpiYTRZ?=
 =?utf-8?B?OEUwRUYzSVRzK1NaNTNwVHRIbGN0MjlWeGVnK2ZRcU50cFF6NUg2NVF3dnZ6?=
 =?utf-8?B?dXB4ZUk5a0YzRzdTell6cU9SQk9BaVlmYXcwNkJiWTI2bHFScGFKS1pISWtG?=
 =?utf-8?B?Y05oTjVWSWZqV2JDdEJuaUwyRGZsd2psKzFHVDRSOVFHK1RoTDdOSWlCYWVO?=
 =?utf-8?B?cnpSTUlxSU41cTFiT2dNWlQ3YnRNc29BTTBEVE04OFRxVXNNMEgxKzZGcjda?=
 =?utf-8?B?QlJvbWxuYS9QVEdGelRUU1VzdGc2SDhIazhBUDdKMTBHUHZaeTZ2R2diL2No?=
 =?utf-8?B?bmdyZDNzUzFJcjIxV04vWlNyM2ZVNmZ3VXI1RXM1dmlFKzZBS21hNXY5OCt2?=
 =?utf-8?B?bE1Hd1ZVNnZQSkZDRnlTaHo5eHNmK2wyMGdINVlBenF5UzZpQVdVVUVLdUM3?=
 =?utf-8?B?b3ZtdHJuK0pHZzRtSXNJcVFYTUZHQTZreVNSOGRuY3VxRjVOejBXYVJGSkVM?=
 =?utf-8?B?YmM0L2FyQ3ZwQk9wT3BZU0JHY3hrUHpGRVZSVTNnam5ORnlYNzdSTCtDcW90?=
 =?utf-8?B?ZmhPcU9nOUo2NjdIaHhLMVBzT3ZST2hqTVNUZVJZbCtjanFhOXphaTlWcnpN?=
 =?utf-8?B?elBHanlnVitKbTl3SUh1ZTJyaWZCckI3byszalRHR0cxaVRzSzJWWFdRYnRF?=
 =?utf-8?B?ZkcydnV6NXRmbGI0Y1g2amlTVGIzUW81RTUrUFkydGUzZ201ZVhFTm5BPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWFLRVFVVWM0eG5tNUx4YjBCY2J2OFkxSUxraERnOFhXMDUwNGxjUzl3cVI1?=
 =?utf-8?B?c2pJbzQ3cEttK0tQSS9xUUYzSTY0VUtiSW1GMzhoWFFBS3VmR2ErSVBtTDRo?=
 =?utf-8?B?cU1WOFphbFBNMVpVZzdjSElZUTVnZFJCTGFhRS9oRkl1a09DRnRiWDNoZjRV?=
 =?utf-8?B?OVQxMmV0TGdod3VFQ1ZaR2ZRbVF3VHlLa3pIeGt4Y1Z0NlB4UHc0OXg1MEJP?=
 =?utf-8?B?WmJNZEVrM1dVYVIrdWUyM3J2Q0U3NzUvTzZSaG9sdjZXbVYwMml4cStMVTFa?=
 =?utf-8?B?b0taMzZ6WDNaUDcwZVhUR09yMytnUzQ0VjlpSFI5L2ZSN1l0KzlMS3BURDRC?=
 =?utf-8?B?aVJkOW5xU01rd2JabTRieVp5MEh2TVpxMTVqNjVwM2xUR25qU3IxRFlFMEsw?=
 =?utf-8?B?OVNRNlA3NUFGSFN5amNsaHM2OG1ON0x5WnNXNGNQV0FFZ29QM0dLZzJDcjdo?=
 =?utf-8?B?SmNRY2gvUHVJY0IxcHdUNEIzdC8yWWZMV0hFU3p1MkJ2dFRBdnNMMi9kR0xJ?=
 =?utf-8?B?VE9XMGFsKzEwK1hnanQycXNQZFAwQVRRTm9qc0VJN3hRaFFFM280eGdaUi9h?=
 =?utf-8?B?MC9HSFMwa1ZHeGRtWFNDL1VHUllKcFRXMURhaURSeUI3UGUyeGx2N1RaL1Yr?=
 =?utf-8?B?Q0VmRElSZ1p1c3dsK1F3ZkY3Q1VOUE5GVm9SYWZTZkkxTTlNeXVNd0YvY0dE?=
 =?utf-8?B?SExDQ2V0blJtVEZuaXN5cVZmcFJnYkg4aWhyUzl0NTRjci9BUTBYaWRJUzdx?=
 =?utf-8?B?U2hkTDZ1YnNjTTVEZzYzOTkxM0JIQVpiNjJ2Q2RJOHZYVmRIbVNWT3JrVCtM?=
 =?utf-8?B?WWo0Vlc4cERhZ1dBZDdxdkZuaU5kbjRFUlpLRnQxb09vVXZXNzJCcUxYOHZ3?=
 =?utf-8?B?b2RrSiszcG5sYW5sK1oxOWNkU0ZIUmN0REc0NmZWSWhNTGlod2VSMnR5K2Nj?=
 =?utf-8?B?VGdUMU92YVRYeGIwQTVsS1IxTkd1RDV5ZldqWEh0aDlJMnU3SW1aVGk3UmJi?=
 =?utf-8?B?TlZnQ3lTNHlGLy94aUtFTWtzVTJVdm5lSFM0U2NnSnRXRzZUTmZTdTB4eGRv?=
 =?utf-8?B?K2JVbkJqVS84YVQ4STlXb2x0YkxTTWk0by9SNGZzOFFabVNaUk13dmwrZk8x?=
 =?utf-8?B?QnhMbWtod0xQc0h5d0hBUUJmQ3ZWaWlsT2xRRzBhelN5NnY2SUpUWlRIWEJn?=
 =?utf-8?B?QjBVaVJ4VHpOTkVQUTZrQWQ5L21yYi9oMW8ydEpMaHJDQUd2MlJGai9VdE5E?=
 =?utf-8?B?c0ZEVnJTOENkd1Nlck5ETTFHaHBVTkp5MFdaVWhhdVBFTU5EQUVVajEyMkhW?=
 =?utf-8?B?c1B2b295K1pmajVEQmZVamhqTDlmMHpiYVkvanJ6a0p3ejZpTFpUYXdGbkIz?=
 =?utf-8?B?Ukw0OUdlb3ZZYXp2MEE3bzFiamYzSWRmR1doTjk4ZGwyOFNHeHFlYXYzQ3hP?=
 =?utf-8?B?b0huODU2cEI0OU5LZVdIVkVvTXF0THkvODY5WVpnZjJ4VWdaaHdGMzJOQWVK?=
 =?utf-8?B?UHdGOTVJNGF1RmZ2T3FQMis1SlpMNFdXS1RSNWRYcXdkcUZzSjNiNEJzSzlG?=
 =?utf-8?B?bmJTelExNWtnWGRNUGZoZUhDUGo2YUo0QnkxQUNPOXpmYmNFSnlJaXJsWXdO?=
 =?utf-8?B?Z3lNN2Z0b1F4RVJ5aC9ra2dOT2d3Y3p1VnZQZW1aUFkzRXJRdlorQ3BuanFE?=
 =?utf-8?B?THhxVU1TUFdnSzkxQ1JOTDE0V1pwNW9Nc2JrWUFwWHpJR3NYaGhvU2JzRHd1?=
 =?utf-8?B?OWlkcnZ4M0I3Qm5vOElNUFAxREdDQ0VTNlhUUTdEd2hzZnpwb1h1cXVIOVlK?=
 =?utf-8?B?RHpPSVdzb0RNVnkzYXM2T1NsY1hIdVEzNncxMWV5N1ZiNFAybkl5Qm1xMnVE?=
 =?utf-8?B?VWhnQk9hY21XRSt0THBPejUycnMwMjc3U09OMmJZclIwT1gvNmNzaXQyZkJk?=
 =?utf-8?B?V3NPWjRYYVFIWTRLT2ZuTHdmTTVkV1hDWnRYMmtqYkNtTzdkcEJCcnJyU2Z3?=
 =?utf-8?B?enRpVWNFQVVFaFlPOWVORjJGOHZValRhMUhqVngxSWo3NkF4ZkliUWhWcHk0?=
 =?utf-8?B?Qmxua1hlc1pTeEMrS1hINTE5elVaS1BCUXMvQ0RpZFNCMURYQmR0VnBlanNx?=
 =?utf-8?B?cUhHcVJFREtaV2RrS1dkdm1RZllOYUVXRDdaZkQ1dWtmS3k2Q3NkeE5Mak01?=
 =?utf-8?B?ZHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e54c281-fa0b-492c-69b9-08dcdf04cf1f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 14:58:12.9138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCTYsVsE5jgiKJVPVdKxGmyra4e20PEbYlR7YgORCCr14ixAuhn6H4Djfvm6CeMWAqagfMgnTfcC8inZoZe1lfs0v/oAnlgKAy1yKYt2dg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7692

Hi,

On 06.09.24 17:54, Farouk Bouabid wrote:
> Add dt-bindings for amc6821 intelligent temperature monitor and
> pulse-width modulation (PWM) fan controller.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> ---
>
> Notes:
>      Merge after patch 1

Patch 1 is merged in next-20240910 and it represents the dependency 
required for patches 3. I guess we should be ready to merge patches 3 
and 4 through the hwmon subsystem.

Thanks,

Farouk


