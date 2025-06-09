Return-Path: <linux-i2c+bounces-11288-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A22EAD1B48
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 12:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9D4D18867EF
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 10:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062A8252284;
	Mon,  9 Jun 2025 10:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RcvovFq8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F641C5496;
	Mon,  9 Jun 2025 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464020; cv=fail; b=tisOs39HO94lc2MhOJhRJvEjPWt48ZZjhrk46fgvG3oe5uAlc9md3sGCSa1U0KRz7m9P3ASbhyIjwrhx+X2XYQtVvQasvnKU6RPLU/Gszd3CmlrvQ3QpNJlpEukaXPWEGujeA8VwglqUbUCEJdCqTi0LvsNF9zfLcVphJzKXcuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464020; c=relaxed/simple;
	bh=shtcagE7A9rDfqrVIeM3949dyjayl/s6Ii3HmY7TdPQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZunSz6xjv3UiC0SKZIlgD0oYlZCrAydaCEySRuezh4y2nsLEpsO4mpkhn8iIFNnDRunIp5jsn8b1U2ZD91S3MFze9hyV9qzgKMeaAPKW4cEMnkfGbHoiA32M/WoCC03haKSSwsWjxo4hLhXBfnqU0jH/d1IMzn2gEJwPVxYtpy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RcvovFq8; arc=fail smtp.client-ip=40.107.94.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWKk3G/H9h/kYZyOfnm2+kLAoUirKdvczCUIcpdD+bbIwgh2QbQDG4PxXl0kZv0INBnxeOSJk94c4hZrhW9kMDkkTj70JsJq+GT/FwW2uc1UxcBW7EGhwrBH46Gq62eDYZgPzQ2OH0+lg7UAaM7HercFTt5l99u4QEP4pNLCBGvCkaI/q2Daq/sHyyx3yyXjlUvX7rZFMNsW9Qhnolim+Q0xyQWR/jhzRq2UbyZuICw9MzSWNmh2T/u+F+bj1wnofXODZuvaUOqAv3UEy1GIP+pSx9fmdH7Ff5S+BKeo7ftgw8WqSBM6XDWvtk06OCdHLjaH8hBvmWhxubPZmIPFBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeeF6xYmxAMwN4cJtrKjcSPFaO9h3dFdmMoG72xv2YU=;
 b=B7c2dL/0DSytJ0FnZIG4UjnUMYVLeKAx7LDoR0n1t1nAbwJT6tvJHoudOhxn3Li2SgSxVHpfANirmiFNy1O5ZOAmOQFrn2jV9PpGjmoF7xbcME/RyEjCCxiAOhB60N8ARnnhV3g2jYhjIZI/6b6YnydT4pO0LG3fCZEpkGvlz/djFTM+P7jmjp11Fdr5Q28ncv8xAOEySXy+iu6K/1y3FINLwmqGTFmKzpafJP6kgZ/9m6OPQyKFW8tta4ZzBVjzSWy1L3EbYdKBCfN+1j02hlfsQJkC0urYjH5zBpIfcuYg4GmNl+2zyy+wRZg/nlgTp/PmEaq7mtoNN/TzLqUpUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeeF6xYmxAMwN4cJtrKjcSPFaO9h3dFdmMoG72xv2YU=;
 b=RcvovFq8jOBSudz8aSa+kK9ITF387aqQ/lqPgKksyryPwIlJAoyK7eWqjP94lSqNLXydTYmk5vQW3j/R+p0PuYhiGkydZmVOAFlglYchBva75fVAs1AvRncQ3ih9g+/Ih7F9Z5i/0l5pQdo0ckg1MVXVVqmiPK8om82QvXuvWGgaf6xqoM15mp5jL9hAc/zD910QLAioIdQ0vo8IAFLKUAOazjxiSQxw2GJN3uClxm7yhEhSwcNdMRFRyxhbHOQtRgI4VrXQX6qN6lpC8Z0KSofN0lu2iHdYaumXI+YwPsnie7exMFCBl+9vp0ji25JFdiB4g5BTC+Ekan2rKXoXzg==
Received: from BY5PR17CA0056.namprd17.prod.outlook.com (2603:10b6:a03:167::33)
 by DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 10:13:35 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:167:cafe::c0) by BY5PR17CA0056.outlook.office365.com
 (2603:10b6:a03:167::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Mon,
 9 Jun 2025 10:13:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 10:13:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Jun 2025
 03:13:20 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 9 Jun
 2025 03:13:19 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 9 Jun 2025 03:13:15 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <kkartik@nvidia.com>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<krzk+dt@kernel.org>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<robh@kernel.org>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C
Date: Mon, 9 Jun 2025 15:43:14 +0530
Message-ID: <20250609101314.5005-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609093420.3050641-2-kkartik@nvidia.com>
References: <20250609093420.3050641-2-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|DS7PR12MB9041:EE_
X-MS-Office365-Filtering-Correlation-Id: e53c93c5-3450-4564-0966-08dda73e4b1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THVSdXlFOXFnZWVibE9qR0s0ay9HUm1VR09sVFVPcFNXWWdGVFcvZUVMUlZh?=
 =?utf-8?B?UU9ZdTJKRGc4UEJxNjVPaGxiKzh3UE84d1F0WE1WcG1QaFJITGFDL1NtVWxt?=
 =?utf-8?B?YzZBb1FvUHhNTXIvUjJFa215NUdOMHdIOVBhMU4zWVBUS3JSR25qNmc4NktX?=
 =?utf-8?B?cUVpNGIvZFh2Z0NQRUo5QVliWEU3Q1cxNGhmcWNyQjB2bDRYaFVyNEw3M3Rt?=
 =?utf-8?B?TVY1MkR0dFVMU01iUDVNdEdhWHlKNk1xMnJKeUZUWnplRFBWNUp6bzJ5QjhD?=
 =?utf-8?B?c2lteVc1Ty9vdzVTenhDc2ZKSWQ5L2wvTTN1NDFjVGpNZU9tVjB5Mk5XRis2?=
 =?utf-8?B?TnZVNmNHalhhWkl6UE5nMjcvWnY1U0RzWC9Tb24xaHR3UGwvV04yeDhzaXFC?=
 =?utf-8?B?K1hua2c2OFh3cDJNb0t5RW11NDd6V0NnZWsrNEtmZ0ZXOGpYdFBZaEo2Y1Vm?=
 =?utf-8?B?MlU2K1VpSDZZaDJKTzllT3VCb09TUGJYVE1FSnhlOStGNm5lWkdGT21FbXlP?=
 =?utf-8?B?NHJlczhFNTFsZmNWOG5nU0JNY2NVaU0wOGpiQVBSVVRjdm53Y0J5SUkvbEN3?=
 =?utf-8?B?ZVBZWVN5QlFpRllUUFhoZzhkaVBDcWtjd0N5R1o1Wll5Z0htSUE4VTVZSkVy?=
 =?utf-8?B?di9hVXdVYklkZFJZcEVTL0cwc0IrVTBpVGNpWTJLMHhaMGxUNjlYNnV4M0Qw?=
 =?utf-8?B?K0xwNEVsUzRHMUplU21Pd0l4RDl6cEd2bG5vMm9DN3RZUExqcmJoVm9TYzZr?=
 =?utf-8?B?cU5oK21vZEdFbHlFZ2dNNHQ0dDdhdVJvY0lOZ2hwNFNwTGJoQmtXT2dVY1Bl?=
 =?utf-8?B?dTMrbSt0NWxrMUJBWXJhOTRkMGhnQVRzY0JsY0wxZnZ0dXFZV0Q3dE14ZDVj?=
 =?utf-8?B?eVd6SGJjYUw1K2lncW5lem0xb2k0cFJJUjFqaVkxSGRFTFFWUlVncjNQWjB4?=
 =?utf-8?B?czFDNHZma1pzVlF1ZUYzYllCTzZzUkJGRzhHWjF4c1ZocXc4UWx0aWROcnVx?=
 =?utf-8?B?K3VXSGV3S0ltUTdQZ0dnSE5LOVM1RWJlUFFNVVE1NkJld2VwZVJDOC9PVFY1?=
 =?utf-8?B?TERpM1FDUUZGVTY4UDVjSWcxSThWbk1YSEFzdDZ3dmFwNW0wOUtnTjVDT3J5?=
 =?utf-8?B?TEJjOVRwbkpUbDFKTGEzdkl2VjFRU3pOYXFNY0dkRFp2ZmtHRzF0SEJSOEVq?=
 =?utf-8?B?ZXcxUUJtOVdZT01NRzBuY3hnWUZRMzUrVmQ2TkZybVJ1d2l6OUY4eTNydkRv?=
 =?utf-8?B?empiSFFMcFhScXNKRGtDY2haRnNUS2E0elFXdkxRc1UzYzNTcDFkdCtLa3g1?=
 =?utf-8?B?cVdGUWRNN1ZqR0JsTEtleHVPeXAwMkxrNE5vMUxMMjkrOHFQUHhhdFVTcTNC?=
 =?utf-8?B?U2RLa1hJQ3VyNFRseFZYczlGZUpaY2JHRmx4SGNLOXdHK1hUUUZDcGVpdkhW?=
 =?utf-8?B?ZVFCeEVBaDduYlVPOTYvd2xBNDdTRFZ2eUZBSWJnbWFxYmt1V3NmaG53cnFK?=
 =?utf-8?B?SlRMMDlmZGJYV3E2NGxMdExZMGNaeEhCTXdVZjdGUHpFQUVCQnFXRHhHSTdk?=
 =?utf-8?B?U1RaMlNTdkJhUjRCalY3d0ZnR1IvOVJWZGNyMk1oOTNLdUNPMm9EZ2ticFBv?=
 =?utf-8?B?TGo0M3M2NlRDQWFRdzMreStXY0JyMUcweGd0K2RFSW45dm1hMUUxaVFROFpK?=
 =?utf-8?B?eWE2Um96N2VkS3lnREJMVmFDeDViL25QVzJESjBab0NjYjRQRXZPaDU2Yk8x?=
 =?utf-8?B?bUVNeWVYOUh1c0hqWmwvTGpXQjVncGpSNDRLM1llVmF2UWRBSkg2R2JNQW5h?=
 =?utf-8?B?WmFhZHFnVTkyK3VxYVRFQ2QvWEhobGdyM2hRVGpoL2JPSFZ4S2J2c0RTeDNT?=
 =?utf-8?B?Z2FtZVNHR2ozaGM4SjYxSTFLQ040TWU1aE11MGZoQWdpcDcyWUNVa0J2Ym8y?=
 =?utf-8?B?aEovd2dGenJWR3g2RHNIRWtzdGtaMGs3cS8yTUZibVBUY09aZ01TY0drcEh0?=
 =?utf-8?B?Rms5NEdHdndqNGJHOXZ3OWpET1Y2Yzh1Q2t0bHlRMCtQWklCb2NkbkZENCtK?=
 =?utf-8?Q?AZYocQ?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 10:13:34.5687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e53c93c5-3450-4564-0966-08dda73e4b1b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9041

On Mon, 9 Jun 2025 15:04:16 +0530, Kartik Rajput wrote:
> iTegra264 has 17 generic I2C controllers, two of which are in always-on

There is a typo here, it should be Tegra264 not iTegra264.

> partition of the SoC. In addition to the features supported by Tegra194
> it also supports a SW mutex register to allow sharing the same I2C
> instance across multiple firmware.
> 
> Document compatible string "nvidia,tegra264-i2c" for Tegra264 I2C.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>

Thanks,
Kartik

