Return-Path: <linux-i2c+bounces-3975-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E0F903B0B
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 13:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DB66288402
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 11:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B1817CA12;
	Tue, 11 Jun 2024 11:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="i9Iym5c3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2109.outbound.protection.outlook.com [40.107.22.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A37F17BB2A;
	Tue, 11 Jun 2024 11:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106281; cv=fail; b=QTdlk30JABWkBQyZ789ATfORpBHheNYtjnRMnbDbPLzG7pd2/Ed6yOEBsNlYFQDgdTROtLN6I/ZRcay3ZWWtGKKf7Wr/gRyYSXAvKLehUlHwy87QpSnaNksCB55YBLTcc2d7xDPIi36ydj32SeHIK6mWKQDKxp1SEnUy6lBq1iI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106281; c=relaxed/simple;
	bh=YJnDzYkWp6xamdl6WBWo3TjkQ/xXtTuf8Ga+2yf/MyE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ugGt7htlY1plcoldEkHvzyoCR3SSliDYinKCaJcRJCf4z1IwyfRWJVi3RQwXF2hUMq1uWcvsY+uGSX9zdxLx1rR1NivTfKHIKTvmQhxBMISu+dUiQn7HSbqgQQKsQqhQBTR5yiTTQ0naj1LKu4j7v7UKxbvCvCj/StqRukvtsRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=i9Iym5c3; arc=fail smtp.client-ip=40.107.22.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3X8r3FK/dRm+YsHJg+xS/RDFGH1BXjDDB2M1AByUXNZVXYKllKuTshZ1iQ+wgN3BTCWkBPdiK6ujjb2Te7sWDha6l/1TtuKuKqeyq9U6/YjcH0HJzUqUlUVZwb7gSE3lSjoDgZ5HdhWGGEAP9rwJ3JNbeHH0mUOTWSidmt9wgFZ9+vvddPA+1c77hLPS0hVPWKytudWyfRhDDkEDukyVkEreLDIobWSMDK/Ywpep1JhvdMnfZwI09tNAFFMBRiJ0SYtoZkNAPfUjaF3PQlfbdWk4WUN2ZciJzAJZ3INDDSbE16pbkZMFGjaIc6UdX+s1/r/bhRMmvfnuPxHxEm3eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoJOV7uyxx3z8OrFykyBkgyA9vpenxJYExyJWNS5Da8=;
 b=nXYvmhEhgdbOM5ViOP1ol/TMYDqLIWqB79ly1jscKL1xbw1liMzBnbDeavX8ZcZVBK/vm8vZuMTJR6LLocKiX6RAhZm0q+tb1P8c47nUc0bIKR8xBB9YPRjDGK56dxycaJ2OpsXS09uUKbNaGz1WyyUg0Ep9BY6W1GA9MID71NF+nhCdFRlKdCylPrgqVjowMC2yCnwYjVlL4Mm9zcvagYpec4HPpMERldNxrj8YB54ssY3BJlkR7r4Ka+R6ep0YY4dd4a7OpETUDOrNFL5VFJx6eHw5Gei4nNHZmw7aCvbNP5Agxr+wPBi7ucv97JJ+ozTnjzprTqlEBQYiSD3u4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoJOV7uyxx3z8OrFykyBkgyA9vpenxJYExyJWNS5Da8=;
 b=i9Iym5c3cSQFoVRm4Uf5L2HzNkQ9EXR4WVdanYXz4CV+jAt79s/bwzzUsctOcpSQAXDH/BFGpft/+XAbRYRttyhqXwCbh3FuVk9TOM+iBCmmwUEBGpOgMZg2olynpeG0+efIzIqPseEyG5FIr/m2yutgWebC+dBzZgyM1dUtVL4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by GVXPR04MB10301.eurprd04.prod.outlook.com (2603:10a6:150:1dd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 11:44:30 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 11:44:30 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Tue, 11 Jun 2024 13:43:54 +0200
Subject: [PATCH v3 3/7] i2c: muxes: add support for mule i2c multiplexer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-dev-mule-i2c-mux-v3-3-08d26a28e001@cherry.de>
References: <20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de>
In-Reply-To: <20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.13.0
X-ClientProxiedBy: VI1PR0902CA0050.eurprd09.prod.outlook.com
 (2603:10a6:802:1::39) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|GVXPR04MB10301:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae0d7fc-eb38-4066-dd6f-08dc8a0bda65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|1800799015|376005|7416005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cS9UWXg1aDEzZ290eTBwWlVabUpZaHJHRXBBY1R5UTNISWdwZVNjWWxiMDRu?=
 =?utf-8?B?Rm54c0EvVlBoZm9OcUJPbnVqVVFvKzB5WkJqanZwR3BQMWFQNFVIZlFndTc4?=
 =?utf-8?B?T2RETXpWNDRhTjQzTGk3Q2crbUR0RzFtSFRaVU4yak5VUWpwZVo4VXhISk5U?=
 =?utf-8?B?b2FVQU9RZHFDdnNPQnIzMXg3R1k3ZGl6bHA0WGtsYUMzRkdwWjBvdU5XaDBQ?=
 =?utf-8?B?WFhjTDhPRGt1VytBZWxsNmxYdmFUc0FoSkp3MVFaa2pOcEZ1QkpXVmRXSnFq?=
 =?utf-8?B?aGpiNm9jTmZDb3NmdzNERlk1UmVIeUx4dDFkNHRIQmZXWVdwZzRWRTF2a3Fk?=
 =?utf-8?B?UE9jdGRVaWRqbjNCd09VNkZGS21Eb0h6VmpWTGxFLzI3UzEyWHRWc1k2Z2Rk?=
 =?utf-8?B?K1ZaZXRyNFFwb3lzZklpczg5Y3p4NVcrdlV3YTBncWlVVTdPcUtjOE1oYkF4?=
 =?utf-8?B?SHR3ZHZBTUFReDNDSjFXRUp6QjFYN0YwU05kanRwWjFkdTN3TlFvYUFXV0ZE?=
 =?utf-8?B?b1M0N3hIQlc2aVp3aWttY01OcTM4eGwvWVFjczhWOUtQYlN1QTFOeWRhRFJu?=
 =?utf-8?B?OWY2VnhEKzY3R1J4UGZobzlwL0tKdWZnbjc1M3hPOGhVcUpuMktRSFB1NTdK?=
 =?utf-8?B?ZnphcTlQTEFSSFhad3RQNHVkcGZwc2pKRW1KRjFEWjQyVmdHaWFTNlJlWlV2?=
 =?utf-8?B?eVpUVTNXLzd4Ym1tK015NHFaZFJ2U2ZRZ0xVTThvWHhCY0cvQ1E2S29aTVBO?=
 =?utf-8?B?MkphUTAyckprTm9teklKazdLclRZNHZYYWFnZGpvejBGazc4ZmpkQkFwa1dm?=
 =?utf-8?B?Skc2S3dOalBJZjRZMjJoWUV3cnM0dnNPd1YrU3J2OHdyOWNBemhkaXlScmMv?=
 =?utf-8?B?amNHNjVjaHhHbTczQmxLVU9RSk10QTRFQ3lIeVhtdUowSFpGYkN2ZS9GVlo1?=
 =?utf-8?B?djQzc0VpeTYvNDl4bTE4L1ZJZXZSTzdBZzFpaHR0OGZzczYzVjBHczNpOTR6?=
 =?utf-8?B?UWFxK3BVK3EwVnFUVGxKV2ZlRU1RMmpWaEZEc3Z0NVJBQWlEc2JTZC8wRGNS?=
 =?utf-8?B?WUtpZmtScHNnbjNEV2Q4ZUVuRUphUkY1cGtsMU53ZzBncXd4cVZpQlBBZmlk?=
 =?utf-8?B?S0N4NXc4QW9QT21DRFJnRW1oZ2o4KzZ0RGR2YldwUjZjU1ZvV0dscmgwNDFt?=
 =?utf-8?B?V1hWNVpQNFB5dmpjQXpxT01IaENWdTBTNXlmYkhMSGNyYTlKdGx1NEU5Q1E1?=
 =?utf-8?B?Z2pjcVNFR2s5aGpnVHFJbHBkZjJidEZTc0oxMVpyS0RHc0UvUGN4MUNCejU2?=
 =?utf-8?B?TDdNckNsV2MzU1dVdlZ4c0lMYUtFMlpIblhUOE5VeGxNQitqMk9pMFRWditY?=
 =?utf-8?B?VlpyU1ZXblVaV1h3TmV6R201ckJMVFFSUjFSRXYwZk55QnZmKzVPeVljK1R4?=
 =?utf-8?B?ZmxzNndBaU81K2dIelFpYWxzdHlnVDFXdjM1enNFMGRTVTlZVWloTUNmY1ow?=
 =?utf-8?B?NjkvUTkwRDBEWmhBVzgyeGZGVm10MjVybWI2UjcrOU5zZXAzbEw1cURWRTdQ?=
 =?utf-8?B?TU5zYlQzL2ZIMEUzVm5QVGkwd0dSbW1henRtM3FJS2NGb1ZvQ0UxQXNrY05U?=
 =?utf-8?B?bFVvVjRVRHh1SFpOL0xTdllTN2c1NFBsR0RmZ3dNYWVhNUNhUHhVTFRQNGFD?=
 =?utf-8?B?Y0lMZUxmb0JFcnd2cmVKZWN5cUxaamdCVGFOQkhyUlVlQjdLQ1hBUStza0R2?=
 =?utf-8?B?d282Q2gzT1ZoeTJFNy80REZXOTN6VWgxTHZaakMzZUF3eWlycE5PZE1EWDVC?=
 =?utf-8?Q?TxT+7XTtmyQ5ftg1+2+yogfdcpvawFzyToJhY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(7416005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEVBSjdrOXBPdi8xbmQ2Ym5pYlE5bWxUaUxDcXViMFlhN1hGSXoycXVQUmZk?=
 =?utf-8?B?K0ZkbHVlbExuZ3hsZ2V3MWpsdjcxMkVnN25UMGVhQUxiTmcyalp2RnBtbTRN?=
 =?utf-8?B?TDVvWnJtTGl5QkZvL2lkanFudUlWcDhxT0FzNkFweXllL3RFZW82QXg2cVZs?=
 =?utf-8?B?aWpacmZWRXNHTGZLVnlpQ0JzZXFjbUNJWENsVEJzYW1GSWdWNitBSUJzVjZz?=
 =?utf-8?B?SnRhNVc0Ny9CMmNIZkNnNzQwa0NBWWwxVVByT2FXMkl6YjJiZ2pXRS9ZSmM5?=
 =?utf-8?B?eUZVRFMzNDg3bXRLNDVSc2xhUWZWeXpZbFdEc1diLzVVYVVMYUMxa1pHRzU2?=
 =?utf-8?B?c0FlT1poY2ZtRmlzZGh3RDBDTEVLcitoamdTMCtYN2x2enBIa1B5RXhQaU02?=
 =?utf-8?B?TjBVZjhVUHJ6TVNtdnByMVpteVBGaHMvWnZkcW9RMUwvMFBMVlhLM29uQldL?=
 =?utf-8?B?Q2xiZEdnWlZNMnppWmZrQk9ReVlTNFZHVTRMemV3Nk43OVFWWDNNVlpFSUlk?=
 =?utf-8?B?V2hhc3dXVjkrVVlNaXlTZWNtMExlNnN1b25yeE1rWTJvZTVzMUwydFBiN0pQ?=
 =?utf-8?B?YUo1Um1tQW9YWjNYdm82VnZpcG1JTWFzb21aNWE0M1NocnNWeGxpSXlXZ1JP?=
 =?utf-8?B?V2t3ay9mR2x2MkhHS0NsM1dBYkl5TTVYZ3dpU3dYV1o2cnlhTWNmSWg0V1RB?=
 =?utf-8?B?WDMzWkJVWUxxWVd5dGpjN25JOGJnQmRSNVFCNldaOFhjQ2JEOHFhci9aYzd2?=
 =?utf-8?B?a09VV2I4NU5YSE9lVHpYdXVCUDY4OENRejhJV01KK0RFR01aOW9qd1pMYlZN?=
 =?utf-8?B?eGVSazI1WHZ6bFBiL3A4bkplOHlOZGdCM0dQZ044ZVluY1RKYTJqVUVhQ3BP?=
 =?utf-8?B?OVl1ZXZFbmwyaUNyeFMzaFloRWg4Tlc0UjlsR0VMNXcwMzJLLzN1ZlR1UzJE?=
 =?utf-8?B?Rm9jcEtaSlJLTVNHVmpuRldQbzh3Q0hyVEwyTTJwNC9LOWIrb2Y1TGwxVGtD?=
 =?utf-8?B?aFRxV2NYNDhhbmRGU1JCUTgrTGh6cEZ3dG1jaUF4QXpEUzErcXl0WFQvUDEz?=
 =?utf-8?B?VnFLcVFPMTh2TkM3blNQaTFYWjRYczYxa0dXcjIzanlsMUlLK1BpS1FuVHdS?=
 =?utf-8?B?M0d6eDc2d1Z3L0xyNUtoY2JIeUcvVW41ZUdBMHk0ZHJuVml5SHUrOXIvQ0o1?=
 =?utf-8?B?M1hyVDZYVktxeSt3cyszc1BpZ3dlN2FQTmovMGpva21XUWlmeXpMRE1LaVFL?=
 =?utf-8?B?NGF2bS9RNFF0SlZKRnovbnRqbmJIVjlIVFhkVC9hd1RPRW5pbm13eDMyUlI0?=
 =?utf-8?B?RTE0U21XMXNIT1lFenFjMmtmY0szL1dla0NvcSswNXVNUXpPWVFPM09zd1ZR?=
 =?utf-8?B?Rm1LTGtaZStzSmxSVkMyd1J4QjFETldWV2RueWVoRzVWL290S0FBNTRYV0d5?=
 =?utf-8?B?UC9PeDk4NVI3L0RCd3F4cXVMVDZEd3J5YzJhWitwdFZieE83ZFV1MzBnV2Q0?=
 =?utf-8?B?Z1dnaVFrQjRSRFVNQ0EzUjl0OHpZNW1iWGlYRlVMN0Z6V2Z0WnlCYzQvUFl4?=
 =?utf-8?B?UVlxcUZNNmRlRGJWRmtXcTRHcWwzNDR0QkoyT2wwM0ZJZFU4eGtxaU9hVHJE?=
 =?utf-8?B?STUydlBIY1dPLzVwbWJQWGZ6YXNjTFdOYXdRS2JGcmFUWUJHZk1rY0c2WW00?=
 =?utf-8?B?d0MxQU9hbzJEQWdUS2RicHM5MjYzNUJlZ2Vyc2pHMkI4UWNuc2tMYTZnQ2Rk?=
 =?utf-8?B?dVl0Tkc2ekMxZlcyczF2eGsvcE5SR25kRm9ocGVZYVlmbUh3OXZEMjROZEtt?=
 =?utf-8?B?WDB0Sit3eDU4cUkyQTg3enlKU1hkUTkzcHNmV2dGNUlOclNrQnJTTlZuTlNk?=
 =?utf-8?B?RTdRNlBWb0xMbWRLaE43cW03aEg5U1dHb0hwbk1iNnREekF0anJsbW1tbisw?=
 =?utf-8?B?bFRxd1FTVDNMWjJpMFJZeGdvV0hqWlBHZnJtbEhxWW5BeHU2dXdadythL0FC?=
 =?utf-8?B?U2pDQWl5M0hkaG5xWCtYS2FRYnd6L1o5MzRhd1RBUC9XTXFMRWZRL29nTW1C?=
 =?utf-8?B?akN0QnhMeVFFVmpVM3R6NVVJWWY0T2FYd3orbWVVTE5LVzFsTWhmTURBWW1G?=
 =?utf-8?B?dTFvUml5QUVNRDFCZHZoUU1aYmtwazQxR3VzQmNEbktoM2JBbmdFRkFwTXMr?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae0d7fc-eb38-4066-dd6f-08dc8a0bda65
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 11:44:29.7217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ean+9eWTceK6NLpi++7Xezd5LC79ytJ4U5XLdeIGqI9dKucsvW54g7AqXobCJVbG+YJiDGhG7Je9RBxLEujyzD+5T7Yc7qRqAlJ3i/0DJs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10301

Mule is an MCU that emulates a set of I2C devices which are reachable
through an I2C-mux.

The emulated devices share a single I2C address with the mux itself
where the requested register is what determines which logic is executed
(mux logic or device logic):

1- The devices on the mux can be selected (mux function) by writing the
appropriate device number to an I2C config register (0xff) that is not
used by any device logic.

2- Any access to a register other than the config register will be
handled by the previously selected device.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 drivers/i2c/muxes/Kconfig        |  18 +++++
 drivers/i2c/muxes/Makefile       |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c | 157 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 176 insertions(+)

diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index db1b9057612a..70876259796d 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -119,4 +119,22 @@ config I2C_MUX_MLXCPLD
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-mux-mlxcpld.
 
+config I2C_MUX_MULE
+	tristate "Mule I2C device multiplexer"
+	depends on OF
+	help
+	  Mule is an MCU that emulates a set of I2C devices which are reachable
+	  through an I2C-mux.
+
+	  The emulated devices share a single I2C address with the mux itself
+	  where the requested register is what determines which logic is executed
+	  (mux logic or device logic).
+
+	  If you say yes to this option, support will be included for a
+	  Mule I2C device multiplexer. This driver provides access to
+	  I2C devices connected on the Mule I2C mux.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-mux-mule.
+
 endmenu
diff --git a/drivers/i2c/muxes/Makefile b/drivers/i2c/muxes/Makefile
index 6d9d865e8518..4b24f49515a7 100644
--- a/drivers/i2c/muxes/Makefile
+++ b/drivers/i2c/muxes/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_I2C_MUX_GPIO)	+= i2c-mux-gpio.o
 obj-$(CONFIG_I2C_MUX_GPMUX)	+= i2c-mux-gpmux.o
 obj-$(CONFIG_I2C_MUX_LTC4306)	+= i2c-mux-ltc4306.o
 obj-$(CONFIG_I2C_MUX_MLXCPLD)	+= i2c-mux-mlxcpld.o
+obj-$(CONFIG_I2C_MUX_MULE)	+= i2c-mux-mule.o
 obj-$(CONFIG_I2C_MUX_PCA9541)	+= i2c-mux-pca9541.o
 obj-$(CONFIG_I2C_MUX_PCA954x)	+= i2c-mux-pca954x.o
 obj-$(CONFIG_I2C_MUX_PINCTRL)	+= i2c-mux-pinctrl.o
diff --git a/drivers/i2c/muxes/i2c-mux-mule.c b/drivers/i2c/muxes/i2c-mux-mule.c
new file mode 100644
index 000000000000..db27fa560995
--- /dev/null
+++ b/drivers/i2c/muxes/i2c-mux-mule.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mule I2C device multiplexer
+ *
+ * Copyright (C) 2024 Theobroma Systems Design und Consulting GmbH
+ */
+
+#include <linux/i2c-mux.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MUX_CONFIG_REG  0xff
+#define MUX_DEFAULT_DEV 0x0
+
+struct mule_i2c_reg_mux {
+	struct regmap *regmap;
+};
+
+static const struct regmap_config mule_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static inline int __mux_select(struct regmap *regmap, u32 dev)
+{
+	return regmap_write(regmap, MUX_CONFIG_REG, dev);
+}
+
+static int mux_select(struct i2c_mux_core *muxc, u32 dev)
+{
+	struct mule_i2c_reg_mux *mux = muxc->priv;
+
+	return __mux_select(mux->regmap, dev);
+}
+
+static int mux_deselect(struct i2c_mux_core *muxc, u32 dev)
+{
+	return mux_select(muxc, MUX_DEFAULT_DEV);
+}
+
+static void mux_remove(void *data)
+{
+	struct i2c_mux_core *muxc = data;
+
+	i2c_mux_del_adapters(muxc);
+
+	mux_deselect(muxc, MUX_DEFAULT_DEV);
+}
+
+static int mule_i2c_mux_probe(struct i2c_client *client)
+{
+	struct i2c_adapter *adap = client->adapter;
+	struct mule_i2c_reg_mux *priv;
+	struct i2c_mux_core *muxc;
+	struct device_node *dev;
+	unsigned int readback;
+	int ndev, ret;
+	bool old_fw;
+
+	/* Count devices on the mux */
+	ndev = of_get_child_count(client->dev.of_node);
+	dev_dbg(&client->dev, "%u devices on the mux\n", ndev);
+
+	muxc = i2c_mux_alloc(adap, &client->dev,
+			     ndev, sizeof(*priv),
+			     I2C_MUX_LOCKED,
+			     mux_select, mux_deselect);
+	if (!muxc)
+		return -ENOMEM;
+
+	muxc->share_addr_with_children = 1;
+	priv = i2c_mux_priv(muxc);
+
+	priv->regmap = devm_regmap_init_i2c(client, &mule_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(priv->regmap),
+				     "Failed to allocate i2c register map\n");
+
+	i2c_set_clientdata(client, muxc);
+
+	/*
+	 * Mux 0 is guaranteed to exist on all old and new mule fw.
+	 * mule fw without mux support will accept write ops to the
+	 * config register, but readback returns 0xff (register not updated).
+	 */
+	ret = mux_select(muxc, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(priv->regmap, MUX_CONFIG_REG, &readback);
+	if (ret)
+		return ret;
+
+	old_fw = (readback != 0);
+
+	ret = devm_add_action_or_reset(&client->dev, mux_remove, muxc);
+	if (ret)
+		return ret;
+
+	/* Create device adapters */
+	for_each_child_of_node(client->dev.of_node, dev) {
+		u32 reg;
+
+		ret = of_property_read_u32(dev, "reg", &reg);
+		if (ret) {
+			dev_err(&client->dev, "No reg property found for %s: %d\n",
+				of_node_full_name(dev), ret);
+			return ret;
+		}
+
+		if (old_fw && reg != 0) {
+			dev_warn(&client->dev,
+				 "Mux %d not supported, please update Mule FW\n", reg);
+			continue;
+		}
+
+		ret = mux_select(muxc, reg);
+		if (ret) {
+			dev_warn(&client->dev,
+				 "Mux %d not supported, please update Mule FW\n", reg);
+			continue;
+		}
+
+		ret = i2c_mux_add_adapter(muxc, 0, reg, 0);
+		if (ret) {
+			dev_err(&client->dev, "Failed to add i2c mux adapter %d: %d\n", reg, ret);
+			return ret;
+		}
+	}
+
+	mux_deselect(muxc, MUX_DEFAULT_DEV);
+
+	return 0;
+}
+
+static const struct of_device_id mule_i2c_mux_of_match[] = {
+	{.compatible = "tsd,mule-i2c-mux",},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mule_i2c_mux_of_match);
+
+static struct i2c_driver mule_i2c_mux_driver = {
+	.driver		= {
+		.name	= "mule-i2c-mux",
+		.of_match_table = mule_i2c_mux_of_match,
+	},
+	.probe		= mule_i2c_mux_probe,
+};
+
+module_i2c_driver(mule_i2c_mux_driver);
+
+MODULE_AUTHOR("Farouk Bouabid <farouk.bouabid@cherry.de>");
+MODULE_DESCRIPTION("I2C mux driver for Mule");
+MODULE_LICENSE("GPL");

-- 
2.34.1


