Return-Path: <linux-i2c+bounces-13444-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDF6BCE4AC
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 20:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6828419A109F
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 18:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA5B23D7D4;
	Fri, 10 Oct 2025 18:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lCesOIdM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B0D2FE563;
	Fri, 10 Oct 2025 18:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760122251; cv=fail; b=PGsugp1iELTvx1LpqmeMVkPani5zympZyxWL9qyl7g+YYKDO0j80+TTf936OKPJbPSuVsLLxqP+JE2BnlV3/Moaqz8wdejj7TLnJDt6ILKEiOPP0AeV12PnQgGdIJLkAZZK8RYqzEFLcb98lExtz8cUccMpdClh6SuHk05T46sQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760122251; c=relaxed/simple;
	bh=97TROAI4+Q7A2no3aS2wVU7R2oSLT+1nRPdUfyndVD0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=vBTz6l4V3UWFq2j7aj4tyrE53+iedzpJKPdwCh8OOslKX2+IAfX0asqN4Cvyi7LlhABN4PPRtMbTJN7X8YZec9E8tQoP02p/r8G06y4tazZZ+eOWc8AJA3Ium24mSw3YR4Nf7k4nR2Ki6/cjCJFOVSY0/lf0DOWSyKoCxZip2hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lCesOIdM; arc=fail smtp.client-ip=40.107.130.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsHT9gE8Udx8H+aENtTY2htktesFdWGmz8ZJyjlVtjxYMjOlV5nVIXtyE2gTgQ9tfF4z9M6qmOxGjY0XyNgzcZFdlwXWwdtSOoNx6M44uD3debzZpcZp4CN6BG4gXgdCwmwW3gVSmPpgTpxqRxDPhTlB3mIxX/+WWWbcZGbSw5q4nSiy8pArsP4KqzNxQLx7tDqt4cl+Mm2OH53tAK9j89pL9iUCj0NqJNdKrmTO4dtlYoL2Vz+o6ldMe1rRb8tORmGsqm9puJGUMugcwSFCHDZb/IhKLKI4uS7X9TA4mUAqJiSbik0egPd6luF3fp2YztCpJFR8MDPH+CNbPMyyiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJQkrpXtfVjG0poutPQt+MWcjWL0TX2b1t0W2NZhvwY=;
 b=YOXMPNVMmZppo6YqWWK1xZd0taV20mM9Rdilbf9+rNj8Hn1dHf0ppZIyW+IoBqWSKMsi/NLY/Psdm2o2ruw3Z3QQMZm8l1bKqedEbKDAZJ7hQDqU2PDkNuraR8TKX2rqB9gWESjCIBYhooy2WTEQj4MV1zbTVAqGD+1HLvJsrfdH/JWDhUeRKt6T0l3c6rdfOtloA5NpNaAwGMWuKUQkBVqSvx5B8+AmeUiG5SzMhROhFTCYY9RR54POZb8BHSTVI7s0Sfs5k0HTZ0zkaEkNLDuby2eABeaNdPMfPVGnnT1obwYjR/Pw2eIfYBKBIQbFjR8MTV4pGmuxcjQUqZDYYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJQkrpXtfVjG0poutPQt+MWcjWL0TX2b1t0W2NZhvwY=;
 b=lCesOIdM09eIJvHCyjkjELaOQ0tCW76uDmL701gryGU2ioIZFSgzbRLkJL3KsxW3GYMnENX/t0FXYLutKpkAQG1sndXBMXFlektUiGSWur0znYf70YC/1dsrnry6xzT3OJkkdV1A8d1zkSqFjvPDXN3ZaUaHvdU3csrDSE7s8/qPtS9zvkoPrOm9Po0aZ/xv0KHmTvi8sgrbrbYeQIUMAwEc4ZCaJQiifajAoQzyYAIqPoVIaDR7b5mjhGYW78b00vFrnxK+ANj5b9Lnh71KTmmTXHNzzW1UcuGY9vQ2r45V/A8aZwlt7BbRz1Pmdjs2W/HNPlHWC8cuQM89LywZMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DU0PR04MB9659.eurprd04.prod.outlook.com (2603:10a6:10:320::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 18:50:42 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 18:50:42 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 10 Oct 2025 14:50:24 -0400
Subject: [PATCH 1/3] cleanup: Add DEFINE_GUARD_ARGS_CLASS macro for
 resource alloc/free functions with multiple arguments
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251010-dmamap_cleanup-v1-1-ec5bc14e82c4@nxp.com>
References: <20251010-dmamap_cleanup-v1-0-ec5bc14e82c4@nxp.com>
In-Reply-To: <20251010-dmamap_cleanup-v1-0-ec5bc14e82c4@nxp.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760122235; l=6023;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=97TROAI4+Q7A2no3aS2wVU7R2oSLT+1nRPdUfyndVD0=;
 b=4kT17/sXf8GjrA+RUGgjXxzcnmjMILY2lRiJoZBQc0PJmzlwx+DVmRf9s/lH8Ky6PpS9VhH7J
 VYmDppBS6WkDb+ljt+Kjp0bUo/Es990GQSXaCQu6WzZN8Uo0LQJo3i9
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DU0PR04MB9659:EE_
X-MS-Office365-Filtering-Correlation-Id: e948ef39-a518-4eee-be22-08de082dea02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ti9wQmZEZ0hZeGxMQjhhNUJYUCtGVDdYc0grenB2Q2pPN21pSGZNeVFkTHdt?=
 =?utf-8?B?alExZ2RFeDRZZmVldjBvVnFRd3RzT1B4VlRsY0JIRitnOWdFYkl2WnhQWXZY?=
 =?utf-8?B?L2MvN0pVRnJjK0diZGF4RXp6cXBlWGE4ZUxwNjlHVHFUNTM0dTAwWVg2S0lm?=
 =?utf-8?B?eXBKK3lOM1M0TjBuR1BaL01OMXFoSThoc1lmb1o2ZzNVa25KT1FVQVVGOGtv?=
 =?utf-8?B?c3Z0Z3pIa29TUnZUMGlEKzlhYm9JQWUwRmF4MlRPZUJITVZDc2NWWUFUeEdy?=
 =?utf-8?B?QkgyUzVjZWI4MTNNNGlFUmdEVFlhYldZa1dXTi92MEJUV3FXRHMwcmVzVGh5?=
 =?utf-8?B?NlNTM21GUS95OE4rSXR1V1ZuWmlpNWZXZC8yMXhHWlpxYXFoaUZYcXFRcyti?=
 =?utf-8?B?RUJZRzQrcVoyUUd6K05XUVhLOG80U3ZIOVpmaTVzY2tZS0xESTdGdWM3WnNE?=
 =?utf-8?B?SlljaG5NWDlocWwyTWdZNnJFRVBzL1RHVW1zaHJGd2hhMFNQLzllYVhaV1ha?=
 =?utf-8?B?L2N0UENJYzN6bVoxdU9IN1Nrc1lIZ01DZUxzMWxPMUVjem1leUVycDQ4N1Y5?=
 =?utf-8?B?QldNeXdETnVCOUc5ZG9BcTNKZnVObEZDOGZjM2tWTFNCcTBGSTNWYzRXeTht?=
 =?utf-8?B?eERpNlpFVzNBZHpCNDVadEVOMS9PUmRuaVdpWTlGdW4vVnZxdmdvVXVITzJU?=
 =?utf-8?B?bGpvK2RFQWV3ZnRBbDI0WC9iL3JNNDIxeUhIMkRSekFBQzl3M29ITm9zSWFC?=
 =?utf-8?B?NTRveGN2eEs1LzFYZnNzRW1pYnk1SDRZWDJyS2Q0ZEFwWjg0cEVqS1JoMUdQ?=
 =?utf-8?B?REsxaXF0TnFJRVgzTG04Wit0TVNIWmZ6MHBzeTVGM1ovdW54ckFZYzQ3R00v?=
 =?utf-8?B?NVQ4NHdPZnZLcnl0bStBL2RQMEJGeU1KcVhCcEYwTGdIR0l6VVdRdjJ1YjVT?=
 =?utf-8?B?dUNzYTFNeXdrQzdIRndyUlA4enBSWDF2QnB1b0s5ZTMyK1JOU0ZGdEQ3Qm85?=
 =?utf-8?B?d0pYSk1vSVd4YTN5TTdDYVNqc3g4TUpPN0RtT0pwNW0zNjlMTkpQNStYdkRM?=
 =?utf-8?B?ckh3Y090QjlUSUwyMW1NYWZ5LyttUmV4TWduVlJtOExRdUJtWWRMWlBoUUJ6?=
 =?utf-8?B?MXd2bUczcEt3QjBpckQzNDdScjc4Ty9QOTAwSjVqU2dEV2VoWEoyelpRQ1Vr?=
 =?utf-8?B?TGJ6SkkvT0R2bHFqRE5FM1VzcENyL3M0c3ppZm1naXNGdUdsaXBRU21qQko2?=
 =?utf-8?B?VUNIK2wveFhuQ0h1MTM0RytCNkxnYlpsakhqVGx1bXVKdXpyZkkrQW80L1hs?=
 =?utf-8?B?blZaN3htdjJVYmRaaVVGVGxQTFZuVjJkR3FVNUh2RW5HMzlpWUNzV0I5L0ZR?=
 =?utf-8?B?S0pEWXc2YnkrU1c5M0NkSUxnRzY4ZWFwaVhPazRmQUFLOG5qaGx1TWhvTVNp?=
 =?utf-8?B?SGdhQlgycXBKZ0h3K0ZmVnlka2dDVWU5V3d3aUJNZU9SN3hMdG9MR2FScHlJ?=
 =?utf-8?B?WXp2S014YjBqcHFseklyd29WUCs0cW9YVGxrVFZ2b3FtdXRhMUhPVkxVbjJj?=
 =?utf-8?B?VEtDOWVyYk1ranZGRk9CdVdFKzBDL3RMRmJMMXpERFpPSTRsNGRWSlcwR2E0?=
 =?utf-8?B?OGpCNzhVY3lKTHgrdWVCSlpHMmlGYVp2UVJvSDhienQ2ZGo5SEFIUzQvdDdI?=
 =?utf-8?B?dTlraDYwOTJsV05lNmhQdmMwRndOR2QvRGhSWnpEK1pyditFdXc3dlNzc093?=
 =?utf-8?B?MmgrS0RGQ245eThnWWx6aFFkVE5aUFg3VEVIVkFkTnRnOGJBcUZ3dlFZYkgr?=
 =?utf-8?B?Y2Y5Y2ZZY1FKOFJrWFdFdTYvZGd2QmkvZHlFbExNS2lZNVJ1NkpRL0hyYm5v?=
 =?utf-8?B?Qy9nTFV5QXF5U2taSkRMVGwvMjJmbnpodEd1UjZweTY4eG94WE55QkFiYldW?=
 =?utf-8?B?WGNsdWRRNVlHREVhQWVDR2U1MDBUdllyNlgvZVZpZWtReGlmS1MvK0YvV25C?=
 =?utf-8?B?OFNrallUTUwrekRIK0xVYmJMQktiOWkrUWdQWmxyUnJTbG0vUmFxRXVKYVI3?=
 =?utf-8?Q?n+UDW8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmxmdkZwbHB4Q0Erd2RqK1JZRzlUYnJoMXZ5bDluRWMvSTNSaEJzOUVDVUNw?=
 =?utf-8?B?SGlTZzR5ODZmZHVEblRkTGxzNmduYzQ3ZXppSkYxUWttQU1jYnhEeitOUng4?=
 =?utf-8?B?RGhqQVFJeEcrcytpNHZRNFJ1UnFnQWJtYmJkNVltTTVJU29DWCtRK0s0ejUw?=
 =?utf-8?B?S2c0TzBPc3VFK0prWHdGWWhWZ3pHT210RlN5MWNVaWRKVUY2bnB6aFdWZGRY?=
 =?utf-8?B?czMwOXlJMEo3RHczVFN1bW5MWllJNVpZZWRNRDFobXFCR0pZdWV3YnQ1d0c1?=
 =?utf-8?B?dzlqOUhwS2hER0t0UUxtU1dnR213RHFnaDJiNWEyNHRVQ0E3TnJSc3djQm5D?=
 =?utf-8?B?RlNRUXFxbFhaUnpuTC9aeVNyUHpwMURHYjIvdFpQWjdqMEtpRGhxZzY5RTlJ?=
 =?utf-8?B?R2JWRmQvd0QxYk44bERpalRhSEMrR3JWZVZiMGJjZGJ2dUp1VDFJaTlFYmh4?=
 =?utf-8?B?cDBXQmp0VWp2VzVWWDZqdkdlT2RGTTVYanE5SXVOMzhWZ2phMTdDSmlVMWZM?=
 =?utf-8?B?WHRocHYzS1R2NlBsL0VZQUJ1eU9aNWovbWt1Z2FhS2l6L1JvLzVrUzlvVzQz?=
 =?utf-8?B?UHhQV09mZ3ZsbzUxWWVMZVc2c3BmNUFIRWZQeVJuQ1I4ZXJjeVJ5RTZUR0Zy?=
 =?utf-8?B?ZkNNOEJGYzQrTlpGVU9tWGd1dGZra0xCcGQxTW9BaldEVUFwdUpwYmc1Sm5l?=
 =?utf-8?B?Q0hncG1zdjhSSE45RWNxcEdaVXV0WXcyUzZrSkZJRXkza0hQODBxWkprN1Ur?=
 =?utf-8?B?OUFNcnM0Z3hERlFtTENrdHB5b2ZnT3FRWURIQktkMURaQTJqUFpRc2tXS3VL?=
 =?utf-8?B?MEhvbFArTVo3amlFeUtoVG5pUzRjYjEzaDZRNEN2cEFvbUlVdTBXSGg4akRN?=
 =?utf-8?B?YkRMZDRNTVpNUmRCR0hXR2J4YjFXOFJGTDVQZkFlV3d4TGZKUDVHK1FwUERk?=
 =?utf-8?B?Z1VDb2dMWVdtUTVPcEhYQlZFS2ZINS9oVTFJQlpkSVVOelpucTFHbzlha3B4?=
 =?utf-8?B?WUlONXRsMEhQWUNLR05xYmFsSWRuU01YZUNjS3VGY1JGYlZISmVuaVgwcyth?=
 =?utf-8?B?TlJaKy9qbU5zNm8ySDdmZ1VLL1lRd3hvajdJODJER05Ec2dvcmZsTE5UWUtv?=
 =?utf-8?B?TGMxS2VsZnRHMkgyVVkzUzFDTEsvYVIwNVA0TXYvNktyaWRDMVV1blZaRzU0?=
 =?utf-8?B?YWYyNzhmS0NvcWFTN2hLMXdWa3VKZXZrMndPUlpyVCtUL05aMkxWVHI2QW4w?=
 =?utf-8?B?Y2tFdkpZK05VQWw3Qy9aeDN6bThUMXBWeUFERkVPOExnVlBhcnYwcTNlVTNl?=
 =?utf-8?B?SjJlWUw1NlhlNTZYc2lrSXMyYjA3MEFRUUVZWjg0UjduWjRFdUEvVGdjTkw4?=
 =?utf-8?B?NElWUHhqNVdMeVg2a1RpUFZEN0Zxa0tCaG9MMFhCQUNUc2J0UWlmS3UvMTVt?=
 =?utf-8?B?VTBFd3BvKzJPZW5ONkdiOE5pZGNGZXphaDI0M1VEQUtYYm1Vcncyci9tdjdh?=
 =?utf-8?B?d1VYT0RtVzhQbXl0bS9vVHNXbFJlZ2YvT3ZxUENYbEFodTArWDZYMi9wSFg1?=
 =?utf-8?B?Y2dxZDd3TW5PYVZWNloySncwUlJPcnBvd2FCdzJDa3haaFkrSjNDbzFQbW9V?=
 =?utf-8?B?MHF5Y0E4dkd3Wm1MYUFSUXp5UTdYdDlSbUJVNERuRmlEenJMMGNRNUFRbFZa?=
 =?utf-8?B?UHNoY3BucEZ2MHlmaU4rYlIzblBrTG9VY3NXN04yVjhkRHUxNUxuV1N2ZDlW?=
 =?utf-8?B?TjhhOTcvNEp4cE14ZGl1YXlQMFVMRy9WL2VJckdoOGhsb2ZQNkQwSXByMW1o?=
 =?utf-8?B?Z2VweTcvbGZ4YzVSU1Fhd001QWFiNllndFJyZXN0cFhOVjMyTW9GdXhYTEZX?=
 =?utf-8?B?MThpb0lnUlR0OTkzejNhaG0zSk5ERnZwNDdoMlpjM1Q1ZmtIelZvU1R5b2g3?=
 =?utf-8?B?a1V4NG5idEhWU0RVdGJid0xhZ1p5N1V2cDlhU3ZwTExaTmlzb1VxcUY2NEV2?=
 =?utf-8?B?WTdGOFo0SmIxUTF2aGNJMU5ZZS9vNlJhYnJ4ZjdQR3BJd2dzUzNBQTczSjNY?=
 =?utf-8?B?dGJSUTdpNVJDczNuaUI3SUg3eTNlaVBrc3BFMndzZXJINHBuc3ViUHNvV2V5?=
 =?utf-8?Q?T/fwIwxvclD1nM8khwlkrKt5Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e948ef39-a518-4eee-be22-08de082dea02
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 18:50:42.7291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gv2quZz6xUyghA+lL9Nw8cgoATiWZO+7/PQ4XSBI+217/0pHecdNLtohrqd5Q9YhpDdqFvZeuPMiMKYwwy8nkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9659

Some resource alloc/free functions require passing more than one argument,
such as dma_map_single() and dma_unmap_single(). Add
DEFINE_GUARD_ARGS_CLASS() to support these cases by introducing a helper
structure to store all arguments for the resource cleanup function.

DEFINE_GUARD_ARGS_CLASS(..., _list_class_fields, _list_func_args, _list_args)

 @_list_class_fields: argument list with types, separated by ';'
        e.g. (struct device *dev; void *ptr; size_t size; enum dma_data_direction dir; int attr)
 @_list_func_args: argument list with types, separated by ','
        e.g. (struct device *dev, void *ptr, size_t size, enum dma_data_direction dir, int attr)
 @_list_args: argument list without types, separated by ','
        e.g. (dev, ptr, size, dir, attr)

Three lists are needed because C syntax differs between struct fields (';'),
function parameters (','), and variable arguments (no types).

Example usage for dma_map_single():

DEFINE_GUARD_ARGS_CLASS(dma_map_single, dma_addr_t,
                        dma_mapping_error(_T.args.dev, _T.dma_addr),
                        dma_unmap_single(_T->args.dev, _T->ret,
                                         _T->args.size, _T->args.dir),
                        dma_map_single,
                        (struct device *dev; void *ptr; size_t size; enum dma_data_direction dir),
                        (struct device *dev, void *ptr, size_t size, enum dma_data_direction dir),
                        (dev, ptr, size, dir))

Example:

    fun()
    {
        CLASS(dma_map_single, dma)(dev, ...);
        ...
        if (error)
                return -EIO; // dma_unmap_single() will be auto-called
    }

Add retain_and_empty() to keep resource when functions.

Example:
    fun()
    {
        CLASS(dma_map_single, dma)(dev, ...);
        ...
        if (error)
                return -EIO; // dma_unmap_single() will be auto-called

	retain_and_empty(dma); // dma_umap_single() will NOT called.

	return 0;
    }

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
There are some checkpatch.pl error, but these is correct and better
readablity.

ERROR: Macros with complex values should be enclosed in parentheses
+#define DEFINE_GUARD_ARGS_CLASS(_name, _return_type, _is_err, _exit, _init, _list_class_fields, _list_func_args, _list_args) \
+__DEFINE_GUARD_ARGS_CLASS(_name, _return_type, _list_class_fields)                   \
+__DEFINE_GUARD_ARGS_ENTRY(_name, _is_err, _init, _list_func_args, _list_args)        \
+__DEFINE_GUARD_ARGS_EXIT(_name, _exit)

ERROR: Macros with complex values should be enclosed in parentheses
+#define __REMOVE_PAREN(x) __REMOVE_PAREN_HELP x
---
 include/linux/cleanup.h | 73 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index 2573585b7f068abe992af1ac05f478fef7b34306..84b27dd374f2200382b6dc1c450320b79406fd87 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -518,4 +518,77 @@ __DEFINE_LOCK_GUARD_0(_name, _lock)
 
 #define DEFINE_LOCK_GUARD_1_COND(X...) CONCATENATE(DEFINE_LOCK_GUARD_1_COND_, COUNT_ARGS(X))(X)
 
+/*
+ * Many resource allocation/free function pairs require passing multiple
+ * arguments — for example, dma_map_single() and dma_unmap_single()
+ *
+ * DEFINE_GUARD_ARGS_CLASS(dma_map_single, dma_addr_t,
+ *			   dma_mapping_error(_T.args.dev, _T.ret),
+ *			   dma_unmap_single(_T->args.dev, _T->ret, _T->args.size, _T->args.dir),
+ *			   dma_map_single,
+ *			   (struct device *dev; void *ptr; size_t size; enum dma_data_direction dir),
+ *			   (struct device *dev, void *ptr, size_t size, enum dma_data_direction dir),
+ *			   (dev, ptr, size, dir))
+ * Example usage:
+ *
+ * int fun() {
+ *	CLASS(dma_map_single, dma)(dev, ptr, size, dir);
+ *	if (!dma.okay)
+ *		return -EIO
+ *	...
+ *	if (condition)
+ *		return -EIO // cleanup will auto unmap
+ *
+ *	req->dma_addr = retain_and_empty(dma); //keep mapping
+ *	return 0;
+ * }
+ */
+#define __REMOVE_PAREN_HELP(...) __VA_ARGS__
+#define __REMOVE_PAREN(x) __REMOVE_PAREN_HELP x
+
+#define __DEFINE_GUARD_ARGS_CLASS(_name, _return_type, _list_class_fields)	\
+typedef struct {								\
+	_return_type ret;							\
+	bool okay;								\
+	struct {								\
+		__REMOVE_PAREN(_list_class_fields);				\
+	} args;									\
+} class_##_name##_t;
+
+#define __DEFINE_GUARD_ARGS_EXIT(_name, _exit)					\
+static inline void class_##_name##_destructor(class_##_name##_t *_T)		\
+{       if (_T->okay) {  _exit; } }
+
+#define __DEFINE_GUARD_ARGS_ENTRY(_name, _is_err, _init, _list_func_args, _list__args)	\
+static inline class_##_name##_t class_##_name##_constructor(__REMOVE_PAREN(_list_func_args))	\
+{											\
+	class_##_name##_t _T = { .args = { __REMOVE_PAREN(_list__args) } };		\
+	_T.ret = _init _list__args;							\
+	_T.okay = !(_is_err);								\
+	return _T;									\
+}
+
+/**
+ * @_name: class name
+ * @_return_type: return data type
+ * @_is_err: macro to check init function return value
+ * @_exit: macro to do resource clean up
+ * @_init: macro/func name to alloc resource
+ * @_list_class_fields: (args list with type, use ; as split)
+ * @_list_func_args: (args list with type, use , as split)
+ * @_list_args: (args list without type, use , as split)
+ */
+#define DEFINE_GUARD_ARGS_CLASS(_name, _return_type, _is_err, _exit, _init, _list_class_fields, _list_func_args, _list_args) \
+__DEFINE_GUARD_ARGS_CLASS(_name, _return_type, _list_class_fields)                   \
+__DEFINE_GUARD_ARGS_ENTRY(_name, _is_err, _init, _list_func_args, _list_args)        \
+__DEFINE_GUARD_ARGS_EXIT(_name, _exit)
+
+#define retain_and_empty(t)							\
+	({									\
+		__auto_type __ptr = &(t); typeof(t) empty = {};			\
+		__auto_type __val = *__ptr;					\
+		*__ptr = empty;							\
+		__val.ret;							\
+	})
+
 #endif /* _LINUX_CLEANUP_H */

-- 
2.34.1


