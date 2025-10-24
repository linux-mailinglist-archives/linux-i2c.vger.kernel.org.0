Return-Path: <linux-i2c+bounces-13798-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB76C0705C
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 17:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0E4B1C25897
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 15:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A2532B983;
	Fri, 24 Oct 2025 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gtmFVWKi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013070.outbound.protection.outlook.com [40.93.196.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2C632AACA;
	Fri, 24 Oct 2025 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761320538; cv=fail; b=HlocmNGHSo41c7bAYCPjgWJAvLpA2VmtE4arWp65KnXKc1wmmBBilgxqw1e8zhBiGYalgC2LOH6dr5vH9lUFi9wcn+GkONJDA4CvtlUBklIyPnWcY0nIJjIsMRhS9bfUuCv/hy+0EKAhoNiPRqDNUTJzOMrcw1eGVM1eEOXt/JA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761320538; c=relaxed/simple;
	bh=nnx3eytbMwgvv3mFWFrrkCA2engTsDF234C1eiNmd2I=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SbunbT6Z5At514xDeaxNR3+l9FgJJwvCTHeM8QqME/0k2xuAZa1LREl9p8OrZJhnJ5YAbkNsqWoXDrNMAYmWOTRTX+iXKoc26h39OJjslFHTLKnXRTRY/BWsgFhzB1eCeJ4kPf3CvPCZPFhNikiA3xMsgT37iydVLarbU+5lBUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gtmFVWKi; arc=fail smtp.client-ip=40.93.196.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAfUM9/N8h63JLFFbCYJQgFEdHsqfXDatpbgiQHdruAe4U6BHB4F4k/2WJauNfPVAFJGsuLfxyoDIGLqNwZvUuClVZaei1pAGRy0pyw7JhmdaHZ1SPZtiYpgQb+o2igL3d7ly3Zn7AWkpu4LigG+UO1yFeZejFMeaDdWfjdf4PQFE9agMSVxx9d9di4UytZCqFBxhrM0wOXXKrqjjXG9OBwDH3+1HITXVVWezarcOvOfsLz0ygzpxflGZtsaPVx8+6HaubiZmh3m62MuP/4sBfgWAibDerg6+2m2VprHiyGIvNXI4vnx+xbXIQfr/+IHOC/Ei5N5XUwsrMT3R200Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35FBROWpvjQmkNIs3qIvlBSieOAsux9U1cyGe97MsZg=;
 b=yZqZCKA1ERTOm7dApYfmmPjKXse8UiqaBv4zYLJft48O8H0y/RupbHKhhlbcy3OqO4CxR+YTGXWrlQ2JMT8auOjz7tUSI6idHNis4ej/15/U6cY3tJGYuW/H+SHOHANo0+5RfVO4QKYKIBTHlRNCxHc0PrKTIOELkFlK8OGsPsZlwwPqS4UqK1q7YAwGcda7X6S/glvaFkPHmVTpgC1qwt/EJPOJ/Xzvx2vPX44Nnq6fgMuKKAc4e2hbqHP9GoUBLN8R3ERATubJZD/4lO4Nzq5SRchWRXRdxCs+ptTEx3rUy7ZQ52PbX4NHp36WlRxN1CNuemgUF7B+G0JAqOPATw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35FBROWpvjQmkNIs3qIvlBSieOAsux9U1cyGe97MsZg=;
 b=gtmFVWKifmQe0XdqH0rMfW8BG8QUXwG6GKCcUK9jFwz3CbP6Y0AfvQJERTQY1VNLSsiRo46CAwYuPGEyz4mji+cU39x56MuARnv9fzEsjOuNhG+N6KVQD99RJ+wMFqnaouKW8V4OD7fmFSxeMV/4PREwNtbfJ+sf/rHxDfYen0iGdQ6mOelKR3Kic9xkpBsFDYe9G/OV/mgIYD6K1Fjkkbp2jhcv3zgcXGPi4Tbnqmfz+2tjDQodaVZG2XKh8sE3kGHMUIpuhbQmNN5Dd8LMjXQ8vogxDXftpJTcng/ROOzTavWHRqx8DP9MpK70uST77EohOVIzoI7Uza4v8gtdjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by LV3PR12MB9267.namprd12.prod.outlook.com (2603:10b6:408:211::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:42:12 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:42:12 +0000
Message-ID: <96e9898f-e306-4b73-9d06-5515916cd769@nvidia.com>
Date: Fri, 24 Oct 2025 16:42:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] i2c: tegra: Add support for SW mutex register
To: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251001064759.664630-1-kkartik@nvidia.com>
 <20251001064759.664630-4-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251001064759.664630-4-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0019.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::11) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|LV3PR12MB9267:EE_
X-MS-Office365-Filtering-Correlation-Id: 581767da-1b01-4d6f-ba81-08de1313e61d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUl1UFc1NG5nMkxoVlVNQUVRV2kzT3hoVWJhYzhJeDJlK0xldVlMQVl0ZTNB?=
 =?utf-8?B?a0xqdW1EeURMTVVJSkJRbzZJcnRFWDZQUW1iQzZYQXFSam9UeTBIbmUxZjdW?=
 =?utf-8?B?b3JjMTc1R3lyWTVRQjZ5djFHZzk3a0k4YzhEeWlpZ0I5VllObGdGaTNwUExP?=
 =?utf-8?B?RmhuaGtuaGsvdUlNaWtWRE01L1RKbitkZjdSWVNpdHRtUys0V0R6dkdIYTBG?=
 =?utf-8?B?WVI4M0hXT2tlTjVjck5Edzhrc1Y1ZVFYM2VseVhVS1BQTUloQ3JwUk5acDZT?=
 =?utf-8?B?VklXY3ZKdk9wT3MxQXVCUlRKbGszSG9rNlBwQVByZzhQb1dBN2U5VWlCa0Nq?=
 =?utf-8?B?RmtpbGg4WVNZV0FhMmJVMDBhWFg0aUw0ZTNpQnNkNWRqWEVzejdyRnhmRVVT?=
 =?utf-8?B?YS90N0JyM0RURTFLZXBzSWZyMXFBMWQ2NFFmRk50VEd1a0I5UE85NVQ1ZCs2?=
 =?utf-8?B?SGQvVG1MZHVHMHYyOGFjbmI3OHZZcklVeXdWOG9jYm5HbSs5MzJRcFJzbldw?=
 =?utf-8?B?L0pCMm5sMm8va0JMMy9wdU8raHBYN1BYZlYxQnc4V3AyWHgwcmFnNzNRUDZH?=
 =?utf-8?B?Z0NhQ2t3cXovVWN5K1Z6REF3eUw0cFJ1dTAxTTB3VHVrS1BPelVXK1J0Y1hw?=
 =?utf-8?B?OW00SnE3UXBoR0tEOEFwcnhQaTFaTDhxM1lYUnd0eFQwTDdlNzNVc0dBZHZD?=
 =?utf-8?B?aFdDajVTN2RSTytscWtjRTJHU0R2UHcvRjVRY3hyZXdNUkNXU1BrMU8xeFJs?=
 =?utf-8?B?MXdScEZ2S2pZWTNmR0RCK1BvV2RuTzlyam5jbjkvYVNIdUFuUWMrQ2g5Rm5P?=
 =?utf-8?B?aFhsLytUQWZ1UG1aeEVDTXV6cTJscTRhVm5hNkd6VzRRYlpqSk1PcjhtSGZJ?=
 =?utf-8?B?Y01ORTVkV2FSYTZJSXFDdWxQbXNqMzlIRVA2cVJLeFhGYXJjbEVpSFlaQnpB?=
 =?utf-8?B?RkNEbytnaDdzRTlKeVNNUDlkcDZkaEZzSWhSTXF3VjhFY2tCYUhubmhNSHNW?=
 =?utf-8?B?SlZvTUFiZHgrRU9FcXNKVzQ1RjRPYVc1WXZ5dFNKTDdxb29sTkdxNXBDUXVr?=
 =?utf-8?B?bGNmelIyRmsyWWdEOUVzdjA4TVdFTmFzRmZrV0UzWlhYa09UWVl3UlBVcnVZ?=
 =?utf-8?B?TGQ0M1V0bGtKcW15R1k5aVNSbktEcFZXYnJBU2FldHBjRmM1aVlhN1dhTU0r?=
 =?utf-8?B?YWp5Q1ZkQVU5MmxzNjU1Umd4eSs4VS8rSVZRaGUxQUJVNFk2dXZWaittUjUw?=
 =?utf-8?B?dFF4d052d01ULytFZHdDUjFHUEYxQkNqL2VqT1hXdCtYRUlzb2lNRjZTd3NJ?=
 =?utf-8?B?Mk1CNTBOY2h2K1RHdmd2MFQrbWhRcSt3QUNEbDNyUWRXNzFjR0N4R0xyM3V5?=
 =?utf-8?B?d3RwWmd0Yml3R2RyUVJxcGZ5NVUxbCtLZWpmOTJkZVVpRjRqVW1iTjJoSXVQ?=
 =?utf-8?B?SGhhSzNoL25DZDJCNGdaaFVQMEp2SE52cjdGb2gwRG5JZnNSSVZxQ0YzR0p4?=
 =?utf-8?B?V3RHMFdTR2lWeVJ3SkFUd1VWWlRxVVZYNC9wZDZ1YnY2Q0czVkN5MVphVk5a?=
 =?utf-8?B?MzJIU0FiYmRnN2tma1FzblRzR2dpNE1wMkpEdm1GaW1HbGRjWFZBRzRicTQ1?=
 =?utf-8?B?QnVlRzdMN2RER0haZmdPL3d4SjhqRXJRbllMaDgrWkxkVVF4dzdhUmp1aVRN?=
 =?utf-8?B?K0ZTQkNEakdTdGFldnZkSTd4NWxta29kZnBYSytJNFoyZGhhNytiSDJSL2hJ?=
 =?utf-8?B?dWVILzZqd09MTEQrRlRLdWdzc2pLNVo0cXIzbGV6QmEvOE9EMUpQVzBVSTVJ?=
 =?utf-8?B?Q2g1ZXF0UFN3WEx2ek15VlNJRjNPNU13ZUxyVW9VQ1ZvNDhWRUZEdTcvOFd6?=
 =?utf-8?B?bU1LNTI3RitSZGl1SnUxVG04eDllUXBUd1M5OHlNMGxuQUhVZ3RzMXBkcGFu?=
 =?utf-8?B?bjQ2K1RNRW5wRUN2aDR3STdvdnlBZ1NCZzlXRkoyTG8xbjAvTEVKWFVxbkhn?=
 =?utf-8?Q?3ILNlFkiW0HuS1lO3wTTNkcoHOqnRU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDhlaGVzNWtYWGEzSndnQjhVVTZJKzY1Vm1DQ0h2VWppZ1ZKcHFUTjRuYklU?=
 =?utf-8?B?RHhWeHJHRkp0T3lSZGI4dkhWMVJMelYvOXhua0R0L2hIcnpJVnhDcDc4MWtC?=
 =?utf-8?B?QnpiNTFpalh0SzY4TS9aVjJJV0U3eVBMbUREZlNjQ0llQnl1Q2NTT0ptTnZ4?=
 =?utf-8?B?UmxCU0xCUWp3ZHNGTm5QY1YyeXQyTHNQVWdqcXJnQVRZd0tkSHp6YjNraGtR?=
 =?utf-8?B?UXFjeHJ3ai90aDkxOHMxSFBGTFlDL2JxUDBiVkJyclZ0TU1NWXp5Y216NGpR?=
 =?utf-8?B?d1M0TUpEcE9FbDFLbm9uU2ZjdDJrMmlZUmN3RWowd05KWkVGaW1hQU9LNVpI?=
 =?utf-8?B?ZmNST1V2Q28yOEJYZ1JPMldaSXZCT1RLYW9DRDcyZTdQbS9BZVFNYWpHQk1z?=
 =?utf-8?B?YlZiQWJmWXNpam5mQ2c3aC9zZCtlNmFmckY5ZEFuZHZ6Q1Nha3hnc2JwVENY?=
 =?utf-8?B?a1NSYkd0RVU4R0JuRTZPR2VtTm1zcE1ENDFyb3lxTnJZSmpwU1lZVlp0SzZy?=
 =?utf-8?B?K2JHVlhQMWhXanU1ZjYxTGUrazRYazhwU054djVkZHNlQWJmS0QxaXdLQmxW?=
 =?utf-8?B?Ni96cjdGVkM1UmhCUlpySVBSaWc4TjdJQi9nN3NhbDJJT3ZlTmZtQTRDZUVP?=
 =?utf-8?B?Q1c5UXMzRUIwck5temp2MWdlRzFoVWdFd0xISDN4Rzh5WXJDR1d3czBHYlRt?=
 =?utf-8?B?Wk5pb09rM01YNVkzaWM5cTdpc3RRVXMvUk9ZdC9JTUNqaDBTVy9vSVRqWEk0?=
 =?utf-8?B?YXFrN3lEL0ZNYnJPekxMQkt1aFBmV0hIbTVUSU9OSHkvbnNMaDUzYVREZlZ1?=
 =?utf-8?B?YlRISlBMdE0xUFNBT1k0QjJWeEo5THVjTStoYXlhUnl5WG96SUpXekE2L05p?=
 =?utf-8?B?V0VTTHFEQWVmK0ZOZGMzYmE4V1FQZnRrVG5LeWdobW5JZHpUVThhL29mVHE3?=
 =?utf-8?B?SmZqNGZEY0hPN2NJeldrbTNFcFVMa1R1TmFxbmNoWStncEtmSldUYTJWTnBR?=
 =?utf-8?B?cUVYZzRDTjIxaC9UQ3RuRVRDU1dMMUlmNmNnUjNyaU5SRU1mR3Q1KzQzam16?=
 =?utf-8?B?ajhySmJhOVA1b0ZZUTd5OXhVL1hNZzkvL2tZZWVDQzVmbnorR0VFTUJPZ2d3?=
 =?utf-8?B?UVlRcEdPUUdmWkFFdVVUZmFqQ0V0WUZUVWVGRjk2S2tkOXlmZnFUMndKM09s?=
 =?utf-8?B?aGlHakJ1V2FmWFIrZEQxWkFsSS9jelU0dFMrYmtGZmY3dmo3NkhuRzRSWksw?=
 =?utf-8?B?R2xsZkcxQmlaODlHQ0NJSTN6MHVOc0xweExtZkNWZmptbUNIaXFHcWpMY1Rx?=
 =?utf-8?B?blJsYVY0SE50OU4yQmgyQTNPU1hFM1B6ZjNaeG5RNmdtT1ZXWHUwZFppQXlU?=
 =?utf-8?B?QlpTdmhzdjBIVDkxUzFkeHRYRFdnS2R0cEpORVkrUnUraFBqTENTZzFCYTd3?=
 =?utf-8?B?a0FsOTJyWGx4MGVWWmZhWnVaYnVyMXFsNW5LQm1iYTZvRi90NnpDQmNsZWxH?=
 =?utf-8?B?Q0xia1lvcFRSZkJmVkhWc0xTSlErRlZVeFVPWGRhZGx5a2FiZGNJamVuK2hE?=
 =?utf-8?B?OERYWFBBZFUva0JVeTBpUkFycXRJSWthd0loYTBVVFVnYmFsaDE3RjBZcmtC?=
 =?utf-8?B?bmdvMVZKN1E4bXFiSkZGcUIzUUJ5bkIyd2JTTUNiNkR3ZFB5b1NDaUpaT3lF?=
 =?utf-8?B?eU50ZktOZExoSXhiMDdkcCthN1dBd0wxSnozZEZSWjArWS9LYlFTVjVZTXNB?=
 =?utf-8?B?Zk14T1MrMlhOdzMrbDI4STU0dnEwdVVQLzNXNG9oL1VSdm1vUnZ1dWM5S0JD?=
 =?utf-8?B?YWtLOGxqbVFHM25SdVM3YnAvSUVCbmgzU2d5eG9pcW1IWnBqNUV3R1NqQ3Vj?=
 =?utf-8?B?RlJ5UWdkZUtGVmF6MkZpRzZBTWVpN1pOVFRGSDZ5YS84VWcwYVZnM0ZldWxV?=
 =?utf-8?B?bmQ3bHoxTkJvSTUwZVNqdWdXUkNZUDFGSVUrdHkwU2hLa1Y5RnpPR01NdFRu?=
 =?utf-8?B?eVZGYmFHRzQwV25MOHRXRmRGdllEZEx4L2w4dmYvUmxwd2YwWVlDcTA4cFY1?=
 =?utf-8?B?UWIvUXVRY0tFU2svSU5Sa1ZFcVJETWdxRzNWMWJCZStCSDhWbCtQeEI2enJx?=
 =?utf-8?B?ZTdtNFdVTUpNWVNycktoaWw3TmlMbGpub1MrQ1Q2ZURWaGdUSEJMWjJ1WGRQ?=
 =?utf-8?B?L1NFZ2xDeTBvSWJJVHBZV1lISElMZTQxbTZWamtKRGdKT2NYSzhpaFJlbDgz?=
 =?utf-8?B?WUZlR0lsNURtYm9FUDhZeFZjSXBBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581767da-1b01-4d6f-ba81-08de1313e61d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:42:12.2263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dV2nH8pDqAIwLx5CJmZuBvfs7Fl7OxX/a69avOYI99WpyVajOy6vWGMKMNbEJvICl5HLu8x10P0Hu/r728KAYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9267



On 01/10/2025 07:47, Kartik Rajput wrote:
> Add support for SW mutex register introduced in Tegra264 to provide
> an option to share the interface between multiple firmwares and/or
> VMs. This involves following steps:
> 
>   - A firmware/OS writes its unique ID to the mutex REQUEST field.
>   - Ownership is established when reading the GRANT field returns the
>     same ID.
>   - If GRANT shows a different non-zero ID, the firmware/OS retries
>     until timeout.
>   - After completing access, it releases the mutex by writing 0.
> 
> However, the hardware does not ensure any protection based on the
> values. The driver/firmware should honor the peer who already holds
> the mutex.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
> v7 -> v8:
>          * Use `bool` instead of `int` for `locked` variable in
>            tegra_i2c_mutex_lock() function.
> v6 -> v7:
>          * Return bool from tegra_i2c_mutex_acquired() and
>            tegra_i2c_mutex_trylock() functions.
>          * Move `has_mutex` check inside tegra_i2c_mutex_lock/unlock
>            functions.
>          * Remove redundant empty line added in tegra_i2c_xfer() in v6.
>          * Fix pm_runtime_put() not getting called if mutex unlock fails.
>          * In tegra_i2c_mutex_lock() simplify the logic to check if the
>            mutex is acquired or not by checking the value of `ret`
>            variable.
>          * Update commit message to describe the functioning of SW mutex
>            feature.
> v4 -> v6:
>          * Guard tegra_i2c_mutex_lock() and tegra_i2c_mutex_unlock() to
>            ensure that they are called on platforms which support SW
>            mutex.
> v3 -> v4:
>          * Update timeout logic of tegra_i2c_mutex_lock() to use
>            read_poll_timeout APIs for improving timeout logic.
>          * Add tegra_i2c_mutex_acquired() to check if mutex is acquired
>            or not.
>          * Rename I2C_SW_MUTEX_ID as I2C_SW_MUTEX_ID_CCPLEX.
>          * Function tegra_i2c_poll_register() was moved unnecessarily, it
>            has now been moved to its original location.
>          * Use tegra_i2c_mutex_lock/unlock APIs in the tegra_i2c_xfer()
>            function. This ensures proper propagation of error in case
>            mutex lock fails.
>            Please note that as the function tegra_i2c_xfer() is
>            already guarded by the bus lock operation there is no need of
>            additional lock for the tegra_i2c_mutex_lock/unlock APIs.
> v2 -> v3:
>          * Update tegra_i2c_mutex_trylock and tegra_i2c_mutex_unlock to
>            use readl and writel APIs instead of i2c_readl and i2c_writel
>            which use relaxed APIs.
>          * Use dev_warn instead of WARN_ON if mutex lock/unlock fails.
> v1 -> v2:
>          * Fixed typos.
>          * Fix tegra_i2c_mutex_lock() logic.
>          * Add a timeout in tegra_i2c_mutex_lock() instead of polling for
>            mutex indefinitely.
> ---
>   drivers/i2c/busses/i2c-tegra.c | 92 ++++++++++++++++++++++++++++++++++
>   1 file changed, 92 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index cc75340f6cb5..1c8c24ae54ed 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -137,6 +137,14 @@
>   
>   #define I2C_MASTER_RESET_CNTRL			0x0a8
>   
> +#define I2C_SW_MUTEX				0x0ec
> +#define I2C_SW_MUTEX_REQUEST			GENMASK(3, 0)
> +#define I2C_SW_MUTEX_GRANT			GENMASK(7, 4)
> +#define I2C_SW_MUTEX_ID_CCPLEX			9
> +
> +/* SW mutex acquire timeout value in microseconds. */
> +#define I2C_SW_MUTEX_TIMEOUT_US			(25 * USEC_PER_MSEC)
> +
>   /* configuration load timeout in microseconds */
>   #define I2C_CONFIG_LOAD_TIMEOUT			1000000
>   
> @@ -210,6 +218,7 @@ enum msg_end_type {
>    * @has_interface_timing_reg: Has interface timing register to program the tuned
>    *		timing settings.
>    * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
> + * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
>    */
>   struct tegra_i2c_hw_feature {
>   	bool has_continue_xfer_support;
> @@ -237,6 +246,7 @@ struct tegra_i2c_hw_feature {
>   	u32 setup_hold_time_hs_mode;
>   	bool has_interface_timing_reg;
>   	bool has_hs_mode_support;
> +	bool has_mutex;
>   };
>   
>   /**
> @@ -381,6 +391,76 @@ static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
>   	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
>   }
>   
> +static bool tegra_i2c_mutex_acquired(struct tegra_i2c_dev *i2c_dev)
> +{
> +	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
> +	u32 val, id;
> +
> +	val = readl(i2c_dev->base + reg);
> +	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
> +
> +	return id == I2C_SW_MUTEX_ID_CCPLEX;
> +}
> +
> +static bool tegra_i2c_mutex_trylock(struct tegra_i2c_dev *i2c_dev)
> +{
> +	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
> +	u32 val, id;
> +
> +	val = readl(i2c_dev->base + reg);
> +	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
> +	if (id != 0 && id != I2C_SW_MUTEX_ID_CCPLEX)
> +		return false;
> +
> +	val = FIELD_PREP(I2C_SW_MUTEX_REQUEST, I2C_SW_MUTEX_ID_CCPLEX);
> +	writel(val, i2c_dev->base + reg);
> +
> +	return tegra_i2c_mutex_acquired(i2c_dev);
> +}
> +
> +static int tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
> +{
> +	bool locked;
> +	int ret;
> +
> +	if (!i2c_dev->hw->has_mutex)
> +		return 0;
> +
> +	if (i2c_dev->atomic_mode)
> +		ret = read_poll_timeout_atomic(tegra_i2c_mutex_trylock, locked, locked,
> +					       USEC_PER_MSEC, I2C_SW_MUTEX_TIMEOUT_US,
> +					       false, i2c_dev);
> +	else
> +		ret = read_poll_timeout(tegra_i2c_mutex_trylock, locked, locked, USEC_PER_MSEC,
> +					I2C_SW_MUTEX_TIMEOUT_US, false, i2c_dev);
> +
> +	if (ret)
> +		dev_warn(i2c_dev->dev, "failed to acquire mutex\n");
> +
> +	return ret;
> +}
> +
> +static int tegra_i2c_mutex_unlock(struct tegra_i2c_dev *i2c_dev)
> +{
> +	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
> +	u32 val, id;
> +
> +	if (!i2c_dev->hw->has_mutex)
> +		return 0;
> +
> +	val = readl(i2c_dev->base + reg);
> +
> +	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
> +	if (id && id != I2C_SW_MUTEX_ID_CCPLEX) {
> +		dev_warn(i2c_dev->dev, "unable to unlock mutex, mutex is owned by: %u\n", id);
> +		return -EPERM;
> +	}
> +
> +	writel(0, i2c_dev->base + reg);
> +
> +	return 0;
> +}
> +
>   static void tegra_i2c_mask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
>   {
>   	u32 int_mask;
> @@ -1432,6 +1512,10 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>   		return ret;
>   	}
>   
> +	ret = tegra_i2c_mutex_lock(i2c_dev);
> +	if (ret)
> +		return ret;
> +

I wonder if it would be better to have a wrapper function around 
tegra_i2c_xfer() called tegra264_i2c_xfer() that is only used for 
Tegra264 platforms and invokes these sw-mutex functions?

Jon

-- 
nvpublic


