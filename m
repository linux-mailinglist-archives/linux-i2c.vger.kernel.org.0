Return-Path: <linux-i2c+bounces-13445-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB46BCE4B2
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 20:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CD5364E0EEE
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 18:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4585301475;
	Fri, 10 Oct 2025 18:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BPn9bUGZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02FA301484;
	Fri, 10 Oct 2025 18:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760122253; cv=fail; b=ZeroLGjTMMXmg7A3rqeCt1q4zcSvoq8mq7fALrZ5eBZxZ6JU72DwlnOOFk/4qdgOVVflDNHTlR/MkZ5Hlb3OyIBs3hIpWozROaQHUW16uf7f3zGscNsxcr1iRmL5aSxM7RTz1WEcLj6BrMA+TtiVP9WqwO2zhl1B8NRLpQ/wjWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760122253; c=relaxed/simple;
	bh=jHKZf/LioT/nyxRAtWAnyzLs4MmcloX9JtdBH6fKM7A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lOlJ+2CoRIFlnQ1kKy8pe1kbFyTFTxChd1ATIPtYHlGHliUHn5/6ZV7kRjXA6h9bStyV7UUaFDFW0vPkafz21JRj0OdmITGxRKPhyEkncNSZC3+eWkBE1M+ir4dm08LMLGO690RinlMvrS0wNFC522X5AvwVtnNJxknSEl5UCXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BPn9bUGZ; arc=fail smtp.client-ip=40.107.130.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x88AmmQlzdKQlNGc/FrCr4qMT+UxyTqpaxH2LEQJm2wNJvnn3sPbprlwHTXtuHQ+I1bUor9LrLvfP8heQ2z+3guDWnTvPp8HOhBBZaIrW2/EN4ALJmz0F7ZaI6FG9V3Qqg65m0NORY87uDN+22pcGeGqzzZyj5Iel9LSgKYb7u9N7x4PHcba28K5y6TyeDr6jOL2RmjAGpoO6EGLKcY6Y+yQPPx+i/tpfj1S6eaOVHfWvgNRD7ICRcKKZS1fn4KLvWTc2fUXHl4Q0iYs03V5gV1v2iCz0xCPL4nG72MJU/CdOLlUZgGrISkoeKPzAy2FbRKDpNgHCo1YRAzWX+x2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L//tn9aZoNYnstekhgLIPM37LwcqzVJgZYutnTif93E=;
 b=bCEHn8BRnpQgdhkxzIO5gC9CjmNTqd7pKv4GJXgRBXVGtZvtYimpROiZHaQI3iaQA/E+gsSGEqaSne3sRZ3z80nlEQMrPOs1jBzfItgr3vr4a2fHq+Zzq7qCMLo6WIAKFBKdJ1EuCT4LHbvoo3callW9HGkQdkBhKXMToesuvbMmEW7Sx31zV9RkggePQquYE4XX3KG9aYqO7yInuy5VBZwfz7gomXjDyGUCR6HxUw+QVOfB018KH/x8OL76lrnYXgQJ+8CVEs8Q2+4JagA5CyKqi9R9srLbL0YVflEVddbNibP7VIapcTufC86b+WdyE1dQ7d7pOwrK8BTsHx4mPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L//tn9aZoNYnstekhgLIPM37LwcqzVJgZYutnTif93E=;
 b=BPn9bUGZm+uWf/cT00hTr+VpGp7//V5qnUq2uo5mZz/77m3L+Xsj+88UV5FHPZTgdCVNxNj1TYjvYEkAJzMH1odxtXAAV4ladm+d8MKWZdkrGivxRHlf0MO56xhjFpYoMfbGYvgJCdatVvxdi0IH2ifxu5fj+DIX+PsT4xrLuITTFry42AtsGE+tCd/t1t+S3FyUcbiL553KECDqnBxtNdFAHeJG09ulJ+bJJgw6TnEktHC5UouAtkQAsy3SjPJUzaqsHbhSUW5SgaZWkhd9aYeS5mf/kv4xvLTj+Cr8tFcPhT0NrqaYObUELtgIny2/apk6dplf5UDAxSSmcnCpkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DU0PR04MB9659.eurprd04.prod.outlook.com (2603:10a6:10:320::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 18:50:46 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 18:50:46 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 10 Oct 2025 14:50:25 -0400
Subject: [PATCH 2/3] dma-mapping: Add auto cleanup support dma_map_single()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-dmamap_cleanup-v1-2-ec5bc14e82c4@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760122235; l=1171;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=jHKZf/LioT/nyxRAtWAnyzLs4MmcloX9JtdBH6fKM7A=;
 b=xaFnQaPFegj4Ww11tzbSWoDGInUmAPBoFg5ORTvizH6Nwidg24iXjrCx+/KembJOCLm63RxIY
 nrC3PdRUTSCC7oBZReL4Yh+zMIk9HDGc8DREIDYfju/dE/yqdhoosr9
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
X-MS-Office365-Filtering-Correlation-Id: 92d90574-8602-4a91-d206-08de082dec2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWh2Tlc0WlMyMm9mV0pnMGFTckJsUklVTjY2ckw2RFh5L29GUjloMEtReDJV?=
 =?utf-8?B?ZjNYNUJYM2pDU04rSjFuTXkvb2FTK0RTUElwamdtVHlKWTA4YythejJieVdl?=
 =?utf-8?B?SDZTdFgvSXowQ3FJOVJ5aE1jd2JQVGJLT3kwNVpyaXZYV1dZdG82QUFtKzgr?=
 =?utf-8?B?ZmNoVVNRbWpBanVXWmp2SC95eTlFVzVFdHkxdWVSTUh0dUlKSHpuMksvOVFl?=
 =?utf-8?B?WU5VMTdPQkpqeVlVSy9KbGI4N1h4OGJEUDBSSVNBbW45ZFkya3hMRmFvRHNk?=
 =?utf-8?B?RlZ1c1NnVUNSQU11UTlIazM3anZDMDlqQXVSQnN2cE0wNnZlUTlPZDYveEp4?=
 =?utf-8?B?WisrM1BLLzdnWXhXTW1GT0NMZ0JTMUFkbkNLVzcxNStUQS9IQ3BjbGJ0aGE0?=
 =?utf-8?B?eTVjaWZnKzZMZExlSHpxT3NBWnRXNnNPQy9nSzZkUUhwZDVZK3BMbUc0N3hW?=
 =?utf-8?B?MEtwY1JvNVdyNzJhQmY0c1FNUm5SakxOT2o1U0U3K3NRUTNGR2xlQmFXaUFG?=
 =?utf-8?B?b0hoNFFHZ01YWXRuMTUyMHB4VHBBUHJSZCt0M2NROGlRSXExK1UycFVJaWZD?=
 =?utf-8?B?LzBHMmJnM0s1dEY3M0lIQ2dyWWZxd2h1OE9lRXR6Z2hNM1ppRU9USWV2cjFN?=
 =?utf-8?B?TFg4Yi9KUUhLVExRVVFhVktBaEdMRG9sc3RGUmVtTzV2WTl4bG5tMTFpZlF6?=
 =?utf-8?B?NjROTDRMMGowVDFKZTFPRjJ0YkZoeG9aS0hTaFBpSkpibEcyQTluaTRFZ1N0?=
 =?utf-8?B?WU9tcVFhdExSb3BTTWptWFo5Q3k1REx1d2IzQmoza21Ybkx3TUdFa3NSbDVY?=
 =?utf-8?B?cjF5Qnk5Q1RBaVVwVmswZkRIOEt1ekY2ZlRuM2hQbU1KalBFenZ1bFFRK3I1?=
 =?utf-8?B?Q0U3dXFCRlppVUVJb0RkaVZQd1FySTRsbHo2RkcrWDdaR3g5WU8vQ3ZHZjFn?=
 =?utf-8?B?Znhyb0xoaGE0WGJBSUIwR3ozQStGUkxyM1YyM2RqK0RGeGwzSXNiS0J3eHNs?=
 =?utf-8?B?UHE5M0ZDaXkwMVRva0JiMHc5OTJTc2p6MUFNVnNSRnhSdEJjVFFhUndJUGdW?=
 =?utf-8?B?SzB4VGxqWTVtajlOcm1XVWFlNy93dVVWY3RrT2p4MW0rSTkyUis3UVl3L1VI?=
 =?utf-8?B?ZW82STdGWnYyQWRqbEdVdlVpaWhlS1ZMY0tzT0djYWFheEFRalZSbnNaOFN3?=
 =?utf-8?B?dnEzQWtMeE9YQ1JDNC90R3lLcW9YazMyTzhXdmdHQytCWmZXbkM1YmhYNDZs?=
 =?utf-8?B?NXpkY1ZZTE1xWEtKODlFVXFCczJFMXZYN3hha1BHaDVPK2tGK0NkWG51d3RB?=
 =?utf-8?B?c0YvSlozMjZJam1UVDBzYkdHVGJyRXczdFl6WGxncldnR21tQ2NvZUs3aGVh?=
 =?utf-8?B?Rm5Sd3VHTkREY213TURRcVRhdEM3am9zZlpKemNxV1BJd2tTN3ZsM0hQVEVz?=
 =?utf-8?B?VjFlN1U1d29hWE4yNVhBYlhWZTcwZU95OUVSSUlpQ2NVSzVvMVlHQzAyZ2pr?=
 =?utf-8?B?UDRSQ2kvdG51cDEvOEprMjlGZnArSUtMNzhPQ1IzWWFUS2krNFpYRlZvWGp6?=
 =?utf-8?B?RDVVcCtSMU5ma29DeUs1RjNrZXpka3hxdlRyS2JVNkRSWStyb2lKdHBmcjUv?=
 =?utf-8?B?MnFzT0VXZGR4dXp2QW1rMFlLWUYwN000MzRsaEt4bktoc1lCWWJYdDhmQnp6?=
 =?utf-8?B?QitISmpCQmpteVNBQ0EyUUhENkxPV1E2S2hLa3IyVndwNFJJZDRlaUZDbUZQ?=
 =?utf-8?B?dndzWVpnallVS1hlYUFwWUJ3QnUxZkFzTWIxd2JGTGFiTEZzbHlvazNEd2R1?=
 =?utf-8?B?eHJlTVNRNFNVZVJIMUlhM3RwUWhaOWhkMnAwTVdkbkkzRWtRSHNvV0hQSi9m?=
 =?utf-8?B?RVQ4VlhMa1JRY0NKck9kSHFNbGhWRG9IYzlTN0NVcFNWUUwxdGlGbHJ4VjJn?=
 =?utf-8?B?ekN2MGU5L3l1cW9Fam1meDB4ZzdVc0d3MWQrejdoUldoYXhwM0tXaHhGelE5?=
 =?utf-8?B?V0hicVFLZ1lmcDdIenlYUU84QjJ3eDRQZHN3aWhEcEU3dGlLR2ZiRW9rYnpX?=
 =?utf-8?Q?Wp5Fbe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0QrZFZOOEhOT0xDTzB1MndrYVJkbk50NGJNZkZpSzVJbWNmYmFvRmNFUzFh?=
 =?utf-8?B?RGJMMTl6c1VEUkxlelpVajNVK25uNmZPUGV0WWlkaU9IQkVyN1YyOGJFQ2tt?=
 =?utf-8?B?c2xtT1VweXpiNjRaemFWWnY1cStGRzlIVjF1dWNNeXhDdDN2ZnU0a3VqckFw?=
 =?utf-8?B?a3YzUTg5citsNVJjb3J5QTY2cHdZaXh5NEF4cDZTNERrSlBqbnQ1WnMvek5K?=
 =?utf-8?B?a1czUWtUQ2ZMamdvZS94UldaSXcybFdrZEQ1ZzhYWnhuQk5jOGI4eGN3a0pF?=
 =?utf-8?B?K0N0M0xPcy81OHJSM0FIdGNVTnk1ZXBaandOZXlQUlF6ZlI3MkFwV1FkYkIx?=
 =?utf-8?B?T0F1WjFUblpENTkxYk5VNDMvNG1vNFRWayt0OGJsaWtsRGdRaVJmdUk3aVJi?=
 =?utf-8?B?Nm5XMTRZaFE3V3dlN1NsNHdpZ0pyMFZYNzA0UmJCVDdhcmh0cWVPaEFyRDl2?=
 =?utf-8?B?cjg5TXhIaEs4OUdtM1k1VTBxL1YrK2h0WEhMTTJNdmNrQktsb2lJeFFjcVZ6?=
 =?utf-8?B?YWsrR2VhZHp1cDc5M0JJV3NxVXhKZ1E4cUN1bnhOQnpPTkJvN1dGenRzWEpI?=
 =?utf-8?B?dWh1YWNpd3c2QzF4QUxtT2xRdGUzVXRqYmQzV0FiYUlZbHhsNkJ4aW1JNEtT?=
 =?utf-8?B?cWQyZU1LTzZGMmU4QThwTVRPbG1uZFRCYkNsRnc3eFJNd2IrWUxKOFk0bnBi?=
 =?utf-8?B?d0FvV0JFK1NmKzJ4bExxd1lCakRCM3RHRkF2Q0FmK2wrNVpBZUUvWXVGR3di?=
 =?utf-8?B?MTVaNkIvWXZwM0JxUzFPUG9tMkQ2ejBXWVRZdXJyUUVhdGFOWG4ydGx5Zm52?=
 =?utf-8?B?L25ucEFjV1gzTFlHUXI2My9ET1lrR3l0Q2FIVHNOaGNNK213NE9sOUxjbG93?=
 =?utf-8?B?cGlGZVFpODFQQ2dGZ3daTm1aU1UvbHVkWUp6RmRSTnhzUEVVVzM5NTdRQ3Jq?=
 =?utf-8?B?TmNQWVZyeUlxRGlrNkJKOFRiM2wrNFc2WE1oZ25mRFc0YTFrOTdFRXNsWC83?=
 =?utf-8?B?MEQxVVRJbmhubEhUWnF3MmFySzdTd2pta1JlM1ZLeHNXTTNmZEdPUkNyQkhi?=
 =?utf-8?B?UmgwSVp4QktobzdtamErdVVJTU1ZT1N1WXJUS1ZzKzl1cStibFI3c3BFbFUv?=
 =?utf-8?B?YTlOdHFZR1gva3R4YnVodXQ4TXI2T1h5R3k3cXc5YXIyTjZpTmpTRWVKVytD?=
 =?utf-8?B?dXJKRlozUE1KY0hRZ3RBNXRDd3E5Z0NWYVpRcXR6bFVRd2htWWhYSGVEa0Rp?=
 =?utf-8?B?RFpSSW9XcVFJenJ0by93SjY3L2Z6V0djWTFUblNDeW0vM1hHdjVySlVmWGp6?=
 =?utf-8?B?WTg1TDI5NnFzY29IY214MXlsY0l5dDRzZFpBVUh4emtsMzlpdnplTUlaeSs3?=
 =?utf-8?B?WGxDc0p0TkU3Z2haZFFwOXEzbWtMQlQ4UUhyMitadTJXWllFMmJ2Y2FLNlFE?=
 =?utf-8?B?cmpMNXVNUG5BL0lmY0ZYUndvM0dlRjQ0R2NSdE1qWHkyczhueDZGelh5bkFD?=
 =?utf-8?B?cERzVmNSV1pJOVljWEYvNWNLSXZTQUdxT1loNUgwQWlMc3NLZmdpTlowMkVv?=
 =?utf-8?B?aVAxR01SMS9sYUJsMjV5emRibzg0VEV0eGF4K2IxSW9zUGRTMXMzUGFqSG5B?=
 =?utf-8?B?dW9hWWNsMnBxYThmaFVzR1crSHQveEFnaEY3U2ljZG15d0JhTjBROG1HVm1P?=
 =?utf-8?B?ODloOUNLMW41SHNIb21pcE9FeDJzK1JFeWFVaUJHcTVidlhvNTVpTXp3YkYr?=
 =?utf-8?B?bzhrbWdGL2FLOHQwOE1EL05vWm8zTkFWSjNhaHdUQ290U2trMXBrODlTeml5?=
 =?utf-8?B?SFByVWVRY2RWaERxbUtkVHBRUHIxZklmMEk5MGl6M0V3eVZESUxwUWdxK3h1?=
 =?utf-8?B?YmV6RG83ZExxQVY1RlpneUY5TVhsTmhmWURPUnlxQUtoZkRWaUdKeWpaZFFG?=
 =?utf-8?B?TWl2V3NoTkpvbGFhU2ZvMklIeUo4K1BRTEtVbkRJdndWUmoycVNmWGd3SURh?=
 =?utf-8?B?UStIYnVHYVR0U3JYUXhRSjZyQUVieWhMR1RkTUJlYk80cUd3ZlpSdUo2Sy9k?=
 =?utf-8?B?K0s3NHZ2WFE0cW1sVCtGMEY1SUR6Y1pJUkNwZ3h3UVVESytwcVp2THM0Y3dR?=
 =?utf-8?Q?cI19rX+FsRHoBQ4+oagT73vpx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d90574-8602-4a91-d206-08de082dec2a
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 18:50:46.3225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PVU/uxYJqxI0YRBSbWUDQDAFxpER8prTvBpiJjum4YwEzcCA6UtFHwGBtVYhduRAe0nFt7EphoptstWaAKjFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9659

Add auto cleanup support for dma_map_single().

    fun()
    {
        CLASS(dma_map_single, dma)(dev, ...);
        ...
        if (error)
            return -EIO; // dma_unmap_single() will be auto-called
    }

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 include/linux/dma-mapping.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 8248ff9363eed2ae5dc18e9eedb711b299201bea..89fc80e7cd85ba5a4068c61f58f3a578ab0a7a01 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -757,4 +757,12 @@ static inline int dma_mmap_wc(struct device *dev,
 	do { typeof(PTR) __p __maybe_unused = PTR; } while (0)
 #endif
 
+DEFINE_GUARD_ARGS_CLASS(dma_map_single, dma_addr_t,
+			dma_mapping_error(_T.args.dev, _T.ret),
+			dma_unmap_single(_T->args.dev, _T->ret, _T->args.size, _T->args.dir),
+			dma_map_single,
+			(struct device *dev; void *ptr; size_t size; enum dma_data_direction dir),
+			(struct device *dev, void *ptr, size_t size, enum dma_data_direction dir),
+			(dev, ptr, size, dir))
+
 #endif /* _LINUX_DMA_MAPPING_H */

-- 
2.34.1


