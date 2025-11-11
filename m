Return-Path: <linux-i2c+bounces-14052-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A765FC4D67C
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 12:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB4543ABF6A
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 11:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640313559C9;
	Tue, 11 Nov 2025 11:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uqfKkqv6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012000.outbound.protection.outlook.com [40.93.195.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BD12ECE93;
	Tue, 11 Nov 2025 11:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762860297; cv=fail; b=nGXSZZLdLA3lh9oELRxguJYuXfEgbs5VBKIiVuh65UMI7BHgiAHPh/VLP660J7/ctHwRVOBLy2zt2A8V9dNsEgYHw+ea8DhhXAnZ9uaMjm6XCNfXGCJsJk3mE1tSJlzCN+/pIIw++EtE6yKdXWHbH/AQvFWDs46W/R9Ylorna0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762860297; c=relaxed/simple;
	bh=jwpMLjTcaarmSaK6woOXyv0mGXSlKdsvuW5vFKyP75Y=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LFB/9HU4tmMCT16QHtcSoHO+run/HMMg7Gi4qNk20DgUmUkUwHdkOScpnFw8VnMEIEcqgIhNqwpEc6QlndwtRBURO0gGFWFqEzo5b9p8hJUEdH/PMmT0Fv9McORJ3M7OO1oK2anIRc4MoPXATKWCfXbq/QwI2QtZvH/pJo4P3lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uqfKkqv6; arc=fail smtp.client-ip=40.93.195.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcfTMIknLy+fpTBS0SmxZ2Ly5TK1/RAAvOKwBF7aZ0f9lAFF8A7/phpTX3TWhbi2JtV7G4wjbvvDwo+YB0ycPCbW5/NbbaDsilvTUBXnAFP39u+DJcfqzfFOhhitJhs8/tuTDgjwU/NGVgFVKeq1HJ0YjP87I0RhsJgOFyvGGWVO0ExOLVK7sV12Z7aNpNMlqa4RPDuWXIZlyfFQsAKZIUzfUyU4Axqr3gsZAIDIvOW3uVPV/3x04YtQaXjEoiFvv+AGDqeI2w8bW+yFzmJHlZmmCWg0n1TH3UAUg07rQREMEASbGm2SjV1OfCuCDj2a2FlCrJ2xQdXYjbpjq8avXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYRCBzNjx99Gx4YAWYBM8QReEbNi94jBE9/MGKFNvmg=;
 b=t3W0YzG8z2pJsD2OmYo9UBgqNrPkZ96+BsdZteQ/2GX4dLHIuLXwMm5C1YuLtHeV1AsHqZdeRcprrQtmKh3DS6dsCB921gev3EWZTFVEkQQbcixaDbW0REx6Ks02DApv4CJel0bmI/WdZswGXHDh+Ua//Zu8BPdG2Cv/uSyHtecRavUnwwVt5/kbFs3gb6/vgW3CP65glnoZtIRE/Q8mNC3XDqd8HYprgBOoJjAjusQh7onKYLuF7K7mqgobDpVeO9VKXOncRclIudFs/0z3ab+gmt1TihSsD4RSyh4d88OI1QQQr20MkYwHc1SKmtsiDm3YepnSORkrlplSUZYInw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYRCBzNjx99Gx4YAWYBM8QReEbNi94jBE9/MGKFNvmg=;
 b=uqfKkqv6SiCQjBLLz3aIf6Xfm4SC1yLEmrShbL5ncESlptHsBig3gU0X33KyTIOBeis7VufX3p/gHJ9iqqQPdhlVVPEOCyKZQKAXcTckM529vFNalr4hqRmryWUcptRNQ18+vgsW6GBwlllN6z4yZ+xXvGD6a5OvzQye/2zz/jInhxv+kYGl3OsXhx4nWEg4NdD7K86y1H8INlcQgBH3kbqpQabGslYVbala5w+UbSjPFbXpbZRB2qTnxGEsyXXJ997d3DGTlxKlnZQ3bx2d94g7nnjUHf8Mal4kHeKp+Nu/vDfRK/Z70nj/Z7pOgVuA6BHX4G6/6emJ4IJR8G5sLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS7PR12MB8372.namprd12.prod.outlook.com (2603:10b6:8:eb::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.15; Tue, 11 Nov 2025 11:24:52 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 11:24:52 +0000
Message-ID: <83b76f45-e08f-4fc7-811c-647bac2c3d36@nvidia.com>
Date: Tue, 11 Nov 2025 11:24:45 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/4] i2c: tegra: Add HS mode support
To: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251111091627.870613-1-kkartik@nvidia.com>
 <20251111091627.870613-3-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251111091627.870613-3-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0032.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::20)
 To SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS7PR12MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: 07cddfef-8134-4668-9f8e-08de2114ee5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?enlTRFJRbVpaYk5oc2RBN2ppS2RzcVdjbVQwMTV2aVFQblI2N1B2VWQrQmFD?=
 =?utf-8?B?U1ZhQU9VUzBOMUR3QzBIay9jcEZZczhUaXBKV0c3MHJCYUxTUGxoR0NkbThx?=
 =?utf-8?B?OVdtcHRVbnpad05DOWhpVWxWazZ1aGp3N21RaVV3R01Nak04M0RWOE1ubUtX?=
 =?utf-8?B?RGZ6cTUzenFZWEk3cDg0Wk81KzhKOEtvRkJyT1FWM3ZQTUI0U2VCRVFyYmFt?=
 =?utf-8?B?Q2NXZ3A5T0pqSjE4MitwcG9kTnRLS2wyWVBwYnVZeUJGM3Vta3FVa1dabzlQ?=
 =?utf-8?B?Rzluc0hZYjZYODZrcEw3Vk1IelhlN1d6VmJIR2U1NDdoQkFyNDdqSjBEMVd5?=
 =?utf-8?B?MzQ5NHpPUW5iYThOYmJnM2lveS9NN2N0bVQ5VTF2Rnc2RFpFWE9tZ0l2cEls?=
 =?utf-8?B?czFvVU1sVXBVUmE3MFRJOUErRk0zUzZobjBralhTVkh6UEx4emNGWS96Z0Rh?=
 =?utf-8?B?VkU4THY4ME1NbW5PSENRWWF1WUF4ZUpLWUNsQ1pDSmIzTTFrTm5VRGlLZUlY?=
 =?utf-8?B?R0dXN09HSDlmMGltTmZSM3R5b2ZjZUVDRitOb2Z0bzNRNGJpYWo3OEoyVlgz?=
 =?utf-8?B?SVdrZG40QmFZdVRYZVNFYTJVQUdCNlBqN3FPYWVyMFBrOTVYdjUrRkttNU5G?=
 =?utf-8?B?SStQSk9jNkxpanZMdVlBL1NFV0dsVTdMclFMbE1aanJnY3hhSHdLdUllc0ZQ?=
 =?utf-8?B?VUpUVWxEajUraEUwZVRETEx6NVNlVW9WTEJQNHJhVmdwYzVBQ0dsZG1DZG51?=
 =?utf-8?B?NzVCam5CWmdkMk40SmpSRFBPNlB3Zno5S3luQkRDREtGaFBzUHZlSUdyb25G?=
 =?utf-8?B?eSsyQ0xVazd0YnkzdjU3RjYyelJzbEJnTzlZNk5uVmxyWXkrTTdYV05TOU1k?=
 =?utf-8?B?ZGFPcVVKZExMajNDaGt1OTJqZ0tMdlN0c0I2N3p6M2doQU0xdlc0WmlDS25D?=
 =?utf-8?B?a1BkTWNrMFFsYW93bFMwUHFJajV1TFR5Yml5TkE4eS9CcWtiM0xvUFpHanRO?=
 =?utf-8?B?ZHE2UWFUM3g5cnlxK0RLSjhHTkpadU8vT0NRRDBzWjRlSGlTSGQ3eU0rVGVQ?=
 =?utf-8?B?R205bjNvZnNBUENXSXFxU1NnUnI3Nm5UdnhIem1HWFlHd3k1Q244R0dYMFdl?=
 =?utf-8?B?TjVVOGljYnpIamJsMnVLZ2hZZkVoS281ZGNuS2F6SHZYL3lYUS9MTlBLQkJq?=
 =?utf-8?B?cWdYSTVXK2x4YWNsQ0dIb0dPeEpNWFVFYzBhSHpoWm10SjgwbkpYRllUNUYv?=
 =?utf-8?B?Y1lKSFpuc3NqTi90bmtOU2kySHJsWVB1RE9UMmFkczd3VWNFeXc1OWM1bUxj?=
 =?utf-8?B?VVF5Tm56OWo2cStQajNFbHkyZWRncUw3ZkxJQU9ZL2hueXN4L0RkbW8wcU40?=
 =?utf-8?B?UDAvNGNRWWYrTGhqL2NhcXdLYUZENXBDSWQ4aHBNYmxuUXJsbk9wZWoySGhy?=
 =?utf-8?B?ZUxFUGZlaGp6UEZValNvdXJMS2VvZFlDcWhBTGY1SGFqZ1hyNTlDbDZhckRF?=
 =?utf-8?B?NHRmemJHL3JiVWZhRGtGTWd2RDZFQUxXMDQrRTRzWGhCcXFTN3dLdkE5N1l4?=
 =?utf-8?B?N1FBR0pabjNOU2xITnBabjBHVVlSMitJZjBlbEVjSjNuN05VempXOVlVOStS?=
 =?utf-8?B?eElDRExNRExVVkRXQVdROG9EcFM2bzQ4YWhWTHBwOEpKRE0xYWZ3WFJSWHBt?=
 =?utf-8?B?TWhRN1JDSk96a1dyUS9tRE1heEZzUXZmUHdwY0d4QXhjOTZoNWpiSFpLTkVZ?=
 =?utf-8?B?QTJIRXkvMWtwcHhNSjhSWldlZ1YrVnlnUUhkN1ZtK2ZGbWlzQTI0WCs0c2dS?=
 =?utf-8?B?VzJTdzhXZVhZNHFRbTRMcER2M0ZGemtFdTMxd3FIZWRLeXRnN3A2cExYQWFU?=
 =?utf-8?B?U3IzeHIwSFF3NGtrSXJnYWZYYXZISEw3aU5aT0JOWnJqWmtWV1RXdFg1MTdM?=
 =?utf-8?B?RDd1eXNhbGg1RlhiQXlEaGNCTzM5S2hWM1NzVmdNb05RdDBrblUvSmNDK29j?=
 =?utf-8?B?T3lHamdtT2Q2WkczTC9OUmhXTEdFY1N0aFFMdVRIejB5UWQ3Rmg2SXpNcS8r?=
 =?utf-8?Q?SZ/sgr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTcrVGZTMnRTNVNnRVI0YkpreWJvZWROL1Q2RmdIK1Q4ZmJKN2tYdzIwK0ZQ?=
 =?utf-8?B?NlhoSkN1enh1NVJWTnUwelVxbVMrQmJESHpIcUdvWGJZVUNTRzFxalZlbmdC?=
 =?utf-8?B?dlNCRFpZeDJmZENpUmplSm1TV2JQZk9ZOUdiT2JqaHBiMzN3ZHdvb2Y5OUUr?=
 =?utf-8?B?NzlBVTFJQUZIT00rTCsrcFNkVEtHVVJyRFUxeHpEWXRUUDRXeFc3aGVqMm5S?=
 =?utf-8?B?cnZjbXdVc3NJK05USW5NalNkTGVHaCswaFR2b09Yenp3a2syVVFDVS9icnZ1?=
 =?utf-8?B?OXpkdW41SnVtTlU2TStaMFJWb2hJSVo0TS9sYkY4TjJiN1RNV0RQV2doSmxV?=
 =?utf-8?B?N0drQTNuTEtYRk95c3JjY3pPUy9xMkhlV2t2TFltbHUwUGhvNnVlaDJEd20x?=
 =?utf-8?B?QW51NWxrYjlKUGNMUXVnZCs2TVV1RjFkSzhrajZBT1FwUzBCcE1jU1lmM1o2?=
 =?utf-8?B?VUJWdzR5SHY3dnRQTzdLcjRNL3dMbkhMNmppU1NTZkhLcnFlaHZudWlwaFdR?=
 =?utf-8?B?aGhGYk54MmNOOWpEc1lmYUw4MG03TmFYdEExU3VUTTFWS0ExQkoyZllHYTlk?=
 =?utf-8?B?WTcrYXc2S0dNQ3pDV1VLejBmMU03Qk5tTGIwSWxxMDY4OW02bFV6dTU5cmdB?=
 =?utf-8?B?dHQ2WS85SlV2ejFVODY5WC9aZmtPdFlyakpBdFRNWWZSdE44SitVa3pVZzdP?=
 =?utf-8?B?S0twZ0hLSWhUYjluTVRReWFVZVQ5MXF1K1FseTllSWUxVnhDd25vRGp0aDFK?=
 =?utf-8?B?bnliR2N1NzBxbzV5cFhsUzNOdzI0cDJmaWlQNG93ZWlGNVQ1NUNsaGxjRlA2?=
 =?utf-8?B?eWhSY1hZdWViZmxkUmozcFc3d2ZreTg1Tms3K3RuejFDTzVCYkl4TUVJTGpW?=
 =?utf-8?B?UXN5M3Q3MW9ETmZseGt6ZmpxZWE1QVZaN3JaZE1pdU94bUlrVEVXdzVNR0dn?=
 =?utf-8?B?UzE1T1FlUktxR1BhUlc4MXQxNm1TL3Y3RnRwRmhZVFpxb2RIRjVtL2llRGlN?=
 =?utf-8?B?MkxrUXlXUGdLeFFra1VLRnFKWmp5NkFRa2lMcUxvVFc2dzlOcHE3TlhlWW1Q?=
 =?utf-8?B?V0xwanRDNTJvODVFd3N4MG5XdlVmbTNkQ1ZzbXR0RVVURGxwYU1XUWpPSmhV?=
 =?utf-8?B?L3pKSXlBTkdzS0dIa2oxb3BGY3dJL2NCUlBWb0hZRnNpS3pOdVNySGRnSVFr?=
 =?utf-8?B?TE9MWmVBSmplK0NDbmZ4RkRTdldUUjZ6aHdrODR1T1hJeGNsMmE3U2hhUFZO?=
 =?utf-8?B?TVQ2UGd6cVZhenB3cjdlR2NUc1krcStSMUV5QmtmSC9nYkFVOEpFWnFXQnc3?=
 =?utf-8?B?SjcvdlJBQzVQR3IzWkZpY2VoK0JJbzE4cnRWSERXbit0TEFaWHh5aFc3RjNR?=
 =?utf-8?B?ZWxHTytpaUtpaWdzcTZUa1UvRmw2MEEzQU9OczNueWc5QTZkb20rdEdMQlVU?=
 =?utf-8?B?V01TMUVpQVMrM0p2L0JqMkNNczE4SUNLU0tjeGpRYUE5V1lHZFpmOFBMcWhK?=
 =?utf-8?B?cHk4WTN3VW9pTDErNFVIcVlhaDJFWFJzZ1I2aUpJdjM4Q0NXNENXbUpiL1hw?=
 =?utf-8?B?akIwd0xWaEYxemVveGlXekt5Wmt6Sm1ubU9BWXJzY1RIaWVrSWI1OUxTQkds?=
 =?utf-8?B?UUlVOEs4QnhJRWZMSDR4bnBxRzJXV09sQlI4YVJiTUU4WWgvYk53ZlE1NXJF?=
 =?utf-8?B?bWxySkZZNXYwMk5SN2QyenluWitkYkNwQTlmZGxaUWsrVmRzdmliSnNKZXVz?=
 =?utf-8?B?V1VlY0h5dThLTk9YK3ZqNXFVczhCZ0lYWTVmcWM0djZqSmQzTVZsUmFrMFBT?=
 =?utf-8?B?c3h0bGI4REkxVGxkVjZwWDVONDlPWUM1WUNlVWNoS2Uvd3ZPTmk0eDZ3ZXlw?=
 =?utf-8?B?MzB3ZkVSS2loYWVuSjY0bjRNZXRkWHN1N3Q0bnk1OW1ELytqVEFJb0VQdGhQ?=
 =?utf-8?B?YTZMU0FxUVNGK2hnR0ttZWV4cXRZT29lYmZnNmhpUWxXTk1COW9uWTdjYTdQ?=
 =?utf-8?B?SzNoU1ZVOUlaTFp1ellnWVI0VDExQ0pPMUVkM3U5eXluMlN3bkxaUGtobW52?=
 =?utf-8?B?Uy9jTHRGWEdaSXlPcVhXSUx3Wk9IdVNrVzVwVWZheGZXbU1USXNZU25YdnBZ?=
 =?utf-8?Q?rHcfj5WiQdiv7v+p4CP4+sQ3R?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07cddfef-8134-4668-9f8e-08de2114ee5a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 11:24:52.0983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3IdVBFHgeMKquzrWlP1RkVdKawa7OUfQQiygDYkMB1vXtbLumgheNIErB53IR6YOjTU81sQugwYYDTkV+Fnyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8372


On 11/11/2025 09:16, Kartik Rajput wrote:
> From: Akhil R <akhilrajeev@nvidia.com>
> 
> Add support for HS (High Speed) mode transfers, which is supported by
> Tegra194 onwards. Also adjust the bus frequency such that it uses the
> fast plus mode when HS mode is not supported.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v10 -> v11:
> 	* Update the if condition as per the comments received on:
> 	  https://lore.kernel.org/linux-tegra/20251110080502.865953-1-kkartik@nvidia.com/T/#t
> v9 -> v10:
>          * Change switch block to an if-else block.
> v5 -> v9:
>          * In the switch block, handle the case when hs mode is not
>            supported. Also update it to use Fast mode for master code
>            byte as per the I2C spec for HS mode.
> v3 -> v5:
>          * Set has_hs_mode_support to false for unsupported SoCs.
> v2 -> v3:
>          * Document tlow_hs_mode and thigh_hs_mode.
> v1 -> v2:
>          * Document has_hs_mode_support.
>          * Add a check to set the frequency to fastmode+ if the device
>            does not support HS mode but the requested frequency is more
>            than fastmode+.
> ---
>   drivers/i2c/busses/i2c-tegra.c | 62 ++++++++++++++++++++++++++--------
>   1 file changed, 48 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index bd26b232ffb3..2b18ceb837da 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -91,6 +91,7 @@
>   #define I2C_HEADER_IE_ENABLE			BIT(17)
>   #define I2C_HEADER_REPEAT_START			BIT(16)
>   #define I2C_HEADER_CONTINUE_XFER		BIT(15)
> +#define I2C_HEADER_HS_MODE			BIT(22)
>   #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
>   
>   #define I2C_BUS_CLEAR_CNFG			0x084
> @@ -198,6 +199,8 @@ enum msg_end_type {
>    * @thigh_std_mode: High period of the clock in standard mode.
>    * @tlow_fast_fastplus_mode: Low period of the clock in fast/fast-plus modes.
>    * @thigh_fast_fastplus_mode: High period of the clock in fast/fast-plus modes.
> + * @tlow_hs_mode: Low period of the clock in HS mode.
> + * @thigh_hs_mode: High period of the clock in HS mode.
>    * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
>    *		in standard mode.
>    * @setup_hold_time_fast_fast_plus_mode: Setup and hold time for start and stop
> @@ -206,6 +209,7 @@ enum msg_end_type {
>    *		in HS mode.
>    * @has_interface_timing_reg: Has interface timing register to program the tuned
>    *		timing settings.
> + * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
>    */
>   struct tegra_i2c_hw_feature {
>   	bool has_continue_xfer_support;
> @@ -226,10 +230,13 @@ struct tegra_i2c_hw_feature {
>   	u32 thigh_std_mode;
>   	u32 tlow_fast_fastplus_mode;
>   	u32 thigh_fast_fastplus_mode;
> +	u32 tlow_hs_mode;
> +	u32 thigh_hs_mode;
>   	u32 setup_hold_time_std_mode;
>   	u32 setup_hold_time_fast_fast_plus_mode;
>   	u32 setup_hold_time_hs_mode;
>   	bool has_interface_timing_reg;
> +	bool has_hs_mode_support;
>   };
>   
>   /**
> @@ -677,25 +684,28 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>   	if (IS_VI(i2c_dev))
>   		tegra_i2c_vi_init(i2c_dev);
>   
> -	switch (t->bus_freq_hz) {
> -	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
> -	default:
> +	if (t->bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
> +		tlow = i2c_dev->hw->tlow_std_mode;
> +		thigh = i2c_dev->hw->thigh_std_mode;
> +		tsu_thd = i2c_dev->hw->setup_hold_time_std_mode;
> +		non_hs_mode = i2c_dev->hw->clk_divisor_std_mode;
> +	} else {
>   		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
>   		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
>   		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
>   
> -		if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ)
> -			non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
> -		else
> +		/*
> +		 * When HS mode is supported, the non-hs timing registers will be used for the
> +		 * master code byte for transition to HS mode. As per the spec, the 8 bit master
> +		 * code should be sent at max 400kHz. Therefore, limit the bus speed to fast mode.
> +		 * Whereas when HS mode is not supported, allow the highest speed mode capable.
> +		 */
> +		if (t->bus_freq_hz < I2C_MAX_FAST_MODE_PLUS_FREQ ||
> +		    (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ &&
> +			i2c_dev->hw->has_hs_mode_support))
>   			non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;

I am still not sure this is correct. Before we had ...

  if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ)
      non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;

Now we have ...

  if (t->bus_freq_hz >= I2C_MAX_FAST_MODE_PLUS_FREQ)
      non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;

Don't we want ...

  if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ)
      non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
  else if (i2c_dev->hw->has_hs_mode_support)
      non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
  else
      non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;

Or

  if (!i2c_dev->hw->has_hs_mode_support && t->bus_freq_hz > 
I2C_MAX_FAST_MODE_FREQ)
      non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
  else
      non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;

Jon

-- 
nvpublic


