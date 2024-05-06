Return-Path: <linux-i2c+bounces-3433-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BE88BCDD8
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 14:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C897B1F25256
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 12:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D894B14532A;
	Mon,  6 May 2024 12:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="Mf016ZPk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2102.outbound.protection.outlook.com [40.107.13.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F821448EF;
	Mon,  6 May 2024 12:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.13.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714998272; cv=fail; b=oB4p3YVImLQ8zw/BCEx/rdkNh1FGdoRebaHeEJ7gF2Slf3kVl6KngWMTkaZHFrOpXQd8c4wVdKtBKT5XYejXlSfRXM6LZ2wVmfmxPrFtNuw+5rujFFd6qyURcZOOkbNMDtPbij+x4u7W1vgPHiZXflCPuQ7K3x64q/WWtwNuMnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714998272; c=relaxed/simple;
	bh=xqpzc7NXXqiL2JHQhHtVFr4vFonc04Qv4B57IIk6dIc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=S+up/grcZqBz/e40SZvhqo4Q+kwl7slWovlsIaQaIU+VAk0rgSQ38OeOAlP3He5X6TIRE5V12Ffz4lTz7olMLtiAmLIn8EZEO6sCzeHsIuErCjEOpHEIU+9wbCVbt5157DQ9h6kwXHs6/fWDBg4s3+qlGSAIl9rzgZFBGWY9jwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=Mf016ZPk; arc=fail smtp.client-ip=40.107.13.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPoBX3mjF7hUNfTc0Dlqj1KTsoF+sYKhYBGI7uohJC1r6KkC8rBTdNMm5rvntkb3+ZdJZ/K5m2Td9ciEoh8UluLJIjBUfmUMVWbwx9D6fWBvxYXaNefeV7djPj5ql4bHQhj9EjhJX4fJGZxGXhvGZKF/zwFnhnkceQxwQnfck1wEDtsB51C2bXIEKP8EhGgxv3Wppb9KZP9c8cpf+d2aIpXziSMSa9Vq2dw791rTYr6h9I37cqRECiDSK7BBMaZ+Gk+MzvJxNg5GfKZVRH2EwxGG2RqeAInY5rWT6kYSMmgNh6lZIrnsttPnqT0jCRjjiSVENQ4dM0S6VciqKal8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NR1k8eLeUhXOQnJCjLHpucEuwIQW6rlkR2Z0uoNpV9w=;
 b=Eg9Ww7e6RoiwalHEqDPzIe/LTUfQfTI6Da2GBHlEi1zIOr4FO6199pLrcJ9Si4CcZSMLI7WjGVDTu2XZdBUiGQ4xBIPdwF7LLMPY0eOD7iyP1BnGi102f5drMmQJ3aqKtz0/zkxIbwhKTdD9S90yofydOYDcQokEAsSqS21dskAWz5Ie5Z/hKGTtx89/nx+bUAaCVsVjsTb9yHYiBcdT9jB9XzJ4Vg00rAjd6OEJeleEsF83+ofG7GzqmZtKKJeCkPbmTgy76llpEWogcJRjxKEaVNIMf1U63HOtsC0J68K7kr5Yl4nnFKZHrFsHOdLCQmUav/y5W5bV2OudbkvKIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NR1k8eLeUhXOQnJCjLHpucEuwIQW6rlkR2Z0uoNpV9w=;
 b=Mf016ZPkk+YAa0f+IxUX1FH5NSPrbzrcJ25MVgXisUCQFq1mX5hcmkRL2jITPi18CAPj5eZGEh/kBJQACCjvgyzOi/TYnQFEBAag1E/foHb1g14fbkgFWOWXJS42m1lX/2TTwt/XuJrxxN0Lqy8Kmp3Qp0Km0317bpv6Y2Omlgc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by AS8PR04MB9512.eurprd04.prod.outlook.com (2603:10a6:20b:40f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 12:24:21 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7544.029; Mon, 6 May 2024
 12:24:21 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 06 May 2024 13:37:57 +0200
Subject: [PATCH v2 6/7] arm64: dts: rockchip: add mule i2c mux (0x18) on
 px30-ringneck
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-dev-mule-i2c-mux-v2-6-a91c954f65d7@cherry.de>
References: <20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de>
In-Reply-To: <20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Heiko Stuebner <heiko@sntech.de>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.13.0
X-ClientProxiedBy: VI1PR0102CA0103.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::44) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|AS8PR04MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: 1933d2b4-380b-4ab2-b53a-08dc6dc77269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|1800799015|52116005|376005|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXdmNjd2WUEvZk1HOTYzQm5NTVVobE5TNVBwQTVXVkJyVlh6c20yK1l5VTZI?=
 =?utf-8?B?emFZcVFGU1FmVEo0YUNKUnpTQkxqazZ4aC9MOVJ1Lzg0NkZXYXcxUmpoeHJB?=
 =?utf-8?B?ekE0cWpwamdPL3dSSyt5WUNSa0R1c1dGU2JFTDBqRElMbGtta0UrOFQ5MURF?=
 =?utf-8?B?UDVpMUEwUWZSQThlZndCbncxYWtxMEg4dWFBOW5ubXZQVTFIMlFneE9vNUwz?=
 =?utf-8?B?U25PdE9XaHBXSlJoY1BwU0ErMzVnMWtoS3BIamlSb0xhd0pYaFh4QUk0aHdz?=
 =?utf-8?B?RUNra2MxYlZvZ3dYT1FTQlFCRUVHMU5Lci9JT1dKeW54RFM0MmVXZERRSDlk?=
 =?utf-8?B?bnVncm9RbzlmdTZ0a3hlMDlWaGdTazR2SzlzYnlyUjUwRVRGT3V6UW9BRlM4?=
 =?utf-8?B?a1ZGN1FBQVVxbENTUTI0aEkzbkpqWlNXWE41S2RMOEZpSHRBc2tpT3R1RFpk?=
 =?utf-8?B?STFCSWFla0tpVUVobTdnVkdVNnluOXFkbDU3VDhHL3kvaDJjSXFVaGRrdk5F?=
 =?utf-8?B?UFMrWlBrRzlUUVRmb0J4d2JoMCsrOG4vQjN1VlFsbVhrbElkRGQ3eFROQUFu?=
 =?utf-8?B?WFJWNHRKZXl0cWgrYTlKbzNTK2c0UlNaZklLVGNxRG95ZEkvZFA4Skh5Z1FK?=
 =?utf-8?B?TXh3cFFTMWhseFNEQnE3SUxZeloydC9jL0o1cUszZGVBWEhIQmRqNW1wZVZ1?=
 =?utf-8?B?d043bitia3g4YURDNlc1UnZOMjhUK01sNVcxckJMSWFaMDVHa1lDRllDQ2xm?=
 =?utf-8?B?OXB2THB5dXRXS3pOZS9tZ3dQUGNNaW56MmhPR2RZQUQwM29IZ0FkcVJxQ1E0?=
 =?utf-8?B?d3IzdzE3RnJxT2ZPYWtBVnErd2E0U0JWWmREOWptQlQ4Y2dxZnZhSjYxSXdq?=
 =?utf-8?B?NXNsclNEbFRjSzgvRWNhTk5WVUtRK0s2RUYybUJITitqcXM5eGV2QnpqV3Z4?=
 =?utf-8?B?VWhhMTJmYk84WGEwTzRvUzJ3NVlMbkp3dzlpcVlYbjVVMGxsYXBNSFR4Yloz?=
 =?utf-8?B?aWJJMmgxTFdMUThKb1g1RHhIL21pQkJia3FTL0pjcW1uYVZnRUdtYU5xRk50?=
 =?utf-8?B?QUo5Vm5OMytzMWU3TDFIVEg3Ly9aS2IxendWZDk1dlVkN2svT1pWMFlQVUQ0?=
 =?utf-8?B?TUFtdW5IQVpVU2hrM1RZZUdyVnorZy9MTkNaUWprc2x0VW5RTXdSSlFpaTds?=
 =?utf-8?B?OFN3QnNDa1VTYlo4R0I3TGxwMm4zNVRSUHAzbXRYZ00zR1JxN1BkR0FJZThi?=
 =?utf-8?B?T2tlOVFNRkZ4ME55VGpaL0Q0VnVRQUVyQ1NkOTNZTEdEM1hoTDhWOStiL2Q1?=
 =?utf-8?B?ZFY5cVBucVpNOWYzTWU3cC9FZEVmZVJ2eEZNN3V5Uy96U2NOUWFBcE9xWGRD?=
 =?utf-8?B?ZU1yTHYrcENQcHlSenJxWmVvM0t4QjRjSEM4U0ZVS04xVEl6YzMxdWtNVWxI?=
 =?utf-8?B?VUJldHFTNVNKZTN5Y2VJWXJEMVBvMWVFbUswVmFRY1N5TExsb0JrdVNHNG9X?=
 =?utf-8?B?SXNUMk9UNzNzOVhQK0ZRbmdZTjdES3NWU1EzZTdvQXFLY0szYTUvUXEvajZ1?=
 =?utf-8?B?VklFOW1hcmpVVnNoTFlucGhtYWJWcFdwR2NicWp2Nk1XZVUzb0dlYkVlZVFZ?=
 =?utf-8?B?ZXExNkhFV1l1bTU3dWVXWEg2akRwQ2pvTGl3WlFxaWxyMVdFVkpsOWhQelRH?=
 =?utf-8?B?eld2eFpkbktlbExkN1ZFTjYwdVB4RGcveFJacW5FdmcwOFp3Uy9yZTEwdEMx?=
 =?utf-8?B?WGdWMGx1Sm9QRC80RkhZMXdKUEM1UkV3OWtXOWJ5K0JSMWVtYUlScGtaRmsx?=
 =?utf-8?Q?FXUmgIRAhwkS431Ec6i7QAkKlgtw1e8lx6jyw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(52116005)(376005)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUdObHM0NSs3aUNhZ0xvZUxFUmRjT1JGWWRZQ2M2YTZTclgrZk5vM25PVXpZ?=
 =?utf-8?B?bzJyN0s2WXRJeHJSakJuKzMxYUFNbDBiMTBWUFFjeUg4ZFVBd1YwdDlIZWcw?=
 =?utf-8?B?Z3k5MEtpa0FJRnFmbFBjZ2FZMjdmRGhYZlRVbmJzQ0lVVld4ZzBtd2tMTklQ?=
 =?utf-8?B?Qk13bmpITTlQbXhlYUxBZnFEdE54VFNpRUVsMkIwVUJuSUtsU1hOT0NMYTAx?=
 =?utf-8?B?RUlwTTY1TnBIcytvQ1c2Sm9zOW5kT3VyYmR0eTJnMUtpZFNQRWEvQldkMFlR?=
 =?utf-8?B?SDRlRS9nV21nNUJzNVRlNnFjbGMyZDhDWTB0bW55a0c4OWw2Y1VSK1NoRVVt?=
 =?utf-8?B?emtJWTg1aUwxVUFBSC9FcWpnUlBRaEJ5THgwMFFTTUtFU3JwVEMyeTRsNktC?=
 =?utf-8?B?MnV3Zjc1dnFPN091bFR6Yjg2dXBpV01RbWF0WTdUZHllTUZPZTFzMGw3cUlM?=
 =?utf-8?B?YUpKNDVRS2oyVTNremdxQjVjV0ZFZ2NReVNpbWxkUTNDQWprRGF6aDgxbXo2?=
 =?utf-8?B?b1BVUjllN1dXSkIya1AxQUExdUN1cnBHcDRQWHJqcVBPSUZDdytuVjZYdG1M?=
 =?utf-8?B?MHViSDNZRHBvVS9FcXoxS0Y1YndlRW5GWHBEMG9HTUFKVkFtdFBEQXRHNE5u?=
 =?utf-8?B?NHlZVU5EZEFhUGM0OE1kdTZreDRlSk1CMHh3eGRDUFlOSW9KQ0F1dUtZZ0hk?=
 =?utf-8?B?bnNJS290Q3Y2ei84Znl3TEd4alN1TVpRcW5mTUpXYnZ6LzNkOWUraE1KRElM?=
 =?utf-8?B?NlZZcGxEOGs4blMwbVlrbUo3ZENDblM5Tmk2VXVzZ2JDZFo5a0xHY0MwZWVr?=
 =?utf-8?B?UHRyMzlkRUg2ODEzd0Z0T0FZQWlxV3h5OTV5ZFdtb3UwU2pGZERRekJyY2Rh?=
 =?utf-8?B?L21wU0c3SjFuN3pPTkUvdDRRRTdzQzduV0xyNHZXMXFZZjZUa0RTbDFQSFRJ?=
 =?utf-8?B?RDFLbkNZa2FUUkVHelNKdUt1Vm16bE9PK0hRNFQzcGFHQTU0N2hDeGR1MSsr?=
 =?utf-8?B?b05NNjdFSXJnUnVIaklPb2o0UTF6dUhvN0plUjlYUEJ0V2U4K0xZbTRWMEQz?=
 =?utf-8?B?ZUd3Z3RITCtBQlJOWVRYUytEdWFVWG1nVGVsWUdkTW9hQ3hHWWtJcUNMSG14?=
 =?utf-8?B?SGU0N242K3c4TlZzWUlLK253RHFCWHFMczFIb2NGNkNuYlg4Tk1KemF6WWNS?=
 =?utf-8?B?aG5RZXR6T04xcjQra2VBZGsxUkpuT2RvK2hLenR1T2h4ZE1RREVrc1pUbjdJ?=
 =?utf-8?B?bEtEeVNrTjJJaUx6K3oxRGZDdHBYT3M3UjRDdHJZaVVYL1pLdDRMMDBnbHhv?=
 =?utf-8?B?bE1YL3FEakoxdW5tR3lpekFnV0JVOW5JdjRLQi9aWjlqRGcvSkJpMzlTak9T?=
 =?utf-8?B?Q3U1V3VjbjNGckdxdC9nTWQyQWEwTmttZ2dwZ1JiVHkrMEpMYXI3U2NYclIr?=
 =?utf-8?B?aG41c1RVYzBTZHc0WmxhWUlpMWtadDhkTFpwUUVkS0x0ZyswbitHVFdrOXcr?=
 =?utf-8?B?bktRZy9Ncmx2YWdUV0Qra2h2Si9TbW1uU0ZONTV4SGpjT0hxVEx5MmZPWVVE?=
 =?utf-8?B?TkpxYVJFR1kxZW9XVkRab01peFNNSWttQ3VhWEJXb1F6dlppblhLazB2Q1po?=
 =?utf-8?B?aUpjUFZGV0xJbE9WdDhSWUNlUll2dWtrMkEwemZnWVgrMC9TNGJFU25yd2VW?=
 =?utf-8?B?MVFzeGZQZm1HR1drSTdWdkQ4RGo2d2xVU1ZvTStxSXJkK1Vkb3MvS2JIMUhN?=
 =?utf-8?B?MHByWjhMb2xLbTVnRDBYdkkvQzBVL296WEdXYkx5Mzg0WDdnRVp4WGNod1RB?=
 =?utf-8?B?dXliWHhtUnFYN1dma0FxMmZFK1BZME0yemx0d1ozNStDRlJzZnAxaUVaZ0xi?=
 =?utf-8?B?ZGpiSlk3cnNTMGNaTGg1N0FzcDloYkNPODdFdWlQYzV5S0taUkt2dmpoUXd6?=
 =?utf-8?B?QTc0cUg4Z2pNa0lpZVhvUC9ERk9wMHd3RDlKZ3J5Y1F0OElUWFNaMnhsenlV?=
 =?utf-8?B?WVZOc3hnM2gweDRaV3l2RE42ZWd4OWhtU0RpNGFONi90RlpUY3NMRWdJVm9X?=
 =?utf-8?B?MHJnVTVlak1YOFphVFpsYlBHMFcyZXphby82M1V2WWc4VW9LaUxxM3Zsd0ZW?=
 =?utf-8?B?RmRqVHNNY2gzV0IyQktNS1R0NUlsRHFoRjBMMFVZeS9ON2d2ZHE0alp6Mk90?=
 =?utf-8?B?L2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1933d2b4-380b-4ab2-b53a-08dc6dc77269
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 12:24:16.6117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: anNosjluEfS1r/eggCwcFVG50B9Oi0PTDK8Fop25OkPdi83/k4WlIAgUKiwE9WLN40Bn7MTNT05aMoaYN/KXIUNfKJQozU9P1bHoi/bAEoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9512

Mule emulates an i2c mux (address 0x18). The amc6821 is exposed behind
this bus.

Add the mux node and amc6821 as a default device.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index bb1aea82e666..eea906379983 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -9,6 +9,7 @@
 
 / {
 	aliases {
+		i2c10 = &i2c10;
 		mmc0 = &emmc;
 		mmc1 = &sdio;
 		rtc0 = &rtc_twi;
@@ -291,10 +292,23 @@ &i2c1 {
 	/* SE05x is limited to Fast Mode */
 	clock-frequency = <400000>;
 
-	fan: fan@18 {
-		compatible = "ti,amc6821";
+	i2c-mux@18 {
+		compatible = "tsd,mule-i2c-mux";
 		reg = <0x18>;
-		#cooling-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c10: i2c@0 {
+			reg = <0x0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fan: fan@18 {
+				compatible = "ti,amc6821";
+				reg = <0x18>;
+				#cooling-cells = <2>;
+			};
+		};
 	};
 
 	rtc_twi: rtc@6f {

-- 
2.34.1


