Return-Path: <linux-i2c+bounces-3432-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 364F68BCDD6
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 14:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFA5E287996
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 12:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2A7144D29;
	Mon,  6 May 2024 12:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="UGsT0bPA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2134.outbound.protection.outlook.com [40.107.22.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5138F1448CB;
	Mon,  6 May 2024 12:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714998272; cv=fail; b=sFuvX3VBvP/HfW+nQc5/uEyt+6TiKiNX6EDIy47zSaX52rJro527hkSTHodh71QSonmobsb+WfqkBe3vXfSNtC/+Vo2uBws3A5dYYmVpF/yMF66ogQmbJZBM6+UXOQeRo8lUyyOqTgB0MQA1aHKFl8ibsmycCG+ecPmFa9vZ07o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714998272; c=relaxed/simple;
	bh=NfTfHJ18239p1sYsdBArc7Weo8iLOFNVO4S7pDS4fAA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=J12b0RKtPgKSX399JmnOxeZRWlhSyN4ebLUbRaA21Ss3hF3jIrwhYMR0tMwjacVCNbmjjjuWgpDvUb9HKoIzZIpf2lFrU6mmu4uaYBImSnWbxYmWozGZPIUP7CLfIjmbDN3W69/QrHfg3gbHgFQ8PkvkrPeKeHZX/rmQuXKeAyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=UGsT0bPA; arc=fail smtp.client-ip=40.107.22.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbBr9b9g4JOueMtQ9uEqL8DFAR1aIAve7Tuj9hkRfbQqRrqa2wydKKIDWzsJBfBepWMJETPIbNTXrsyPks6EMyEYQFviD2aKPAupXZjYhCzppFMH2Vd43Mv3EchzVO6cQKtkCQzLAI6+e4BFbhZwM+UElY5pT+ZvAfn2d2kPd6+cYifWclU0oUtK96tKCAgJwVHYFlFEOj9XWadK+hyzFpMc1EUt0E431uTQiNI1iqB3ZQdRHZIMC+CiEgDQS6g8XFA7sLCTe/F41iwOeQNlHZgwHyc9G3yrRDnmwCeOKddC6pmq1wWRHellPib9XbZ4a84kgmPAufVewdEfYtKttg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1/V+lbRp3WelWm1b5wkE6w2cGaJdeer/dAdKepK58E=;
 b=EEVipjEqJeyb+Y3eQSr1gDZOrL7fv559cYsHVIQDUo0VdoFgfY+vE8767Ups+QaNzblxPwksSlWZpgg2pH49ZLsC+ppPWS/XPp43lxervuBIS5qiwWHxl5nM7ypGYottDOzDUr7DggVAekki1WYdAaEwuS2W9H0pwG0EXRo8ES+QUuFS1pof2fC002LKNoSbYYg8mvovoTd6xtVRD2rNF3a5O/FU3djoFd+Iew7s982kyo8JUfD6BaXoVrq0EIFJT8kZF+qwImYA6SGuIEQsSNRTTALcARuwtyWUdV5IN/5elY0ZGDlSwQd7zCVsTYApwj6rmFSilKgbqDwCx2eOLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1/V+lbRp3WelWm1b5wkE6w2cGaJdeer/dAdKepK58E=;
 b=UGsT0bPAB9oOsL0BbekZtSMqUshU7vA7+fzS8p0al4WWHukFm+PMd4RpYAiquHjK91zrK27u2HZ3ffk/clqQFnM0HGLEFLV8ihRMQJNHEWFp8S/pOmhUumBUxFeLMXbrjuEOIXPbXtSkI8eVazYDk526XJMYLvKt53L9h3ddzbY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by AS8PR04MB9512.eurprd04.prod.outlook.com (2603:10a6:20b:40f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 12:24:20 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7544.029; Mon, 6 May 2024
 12:24:20 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 06 May 2024 13:37:56 +0200
Subject: [PATCH v2 5/7] arm64: dts: rockchip: add mule i2c mux (0x18) on
 rk3588-tiger
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-dev-mule-i2c-mux-v2-5-a91c954f65d7@cherry.de>
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
X-MS-Office365-Filtering-Correlation-Id: 18ecc76e-d411-4665-45f3-08dc6dc7724a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|1800799015|52116005|376005|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnlQRTBSWmRGVGlvRGNZVmV5bmgzT0VyZDZuY05kbmxXWFA2RFhlRmpsTXZx?=
 =?utf-8?B?cWxZMDR1Njl3ZlFHbW42YmpBZG1NRjVURlkvVDlnSUw0SXpnVy8xNDBkYmlT?=
 =?utf-8?B?eXAyR2ZyNTVGRC8rRGVVUk45SmZ1eFZXZUdBT2paeSsvQy95UW5rY1QrMGQ4?=
 =?utf-8?B?UU83WTdyUzNHV0JyOC9UNlF2aGVPVDlEcGNHSWVNTGxWaXN5U3BWYUwwdWdt?=
 =?utf-8?B?UVZ0VW1oVHdSVGpadG9jdGwwTWp3T1lpTzFCT3YvYVM4UU8rbEwyZ2VaTVVQ?=
 =?utf-8?B?eFlyVmt0NTF6QVpxemx6MHRncWduVGc5WlpxSHI4NmJlSW9oeENtbmtNbzBs?=
 =?utf-8?B?QjRVOE1FSGRBOTJTeE5wbnRCcVFRQ2dsYTdNTEJSUU9TbzB6VElPaVQvbEJC?=
 =?utf-8?B?ODBpb2NNT0dwb0JWRzNISXlQc2lBaTRwaUUrZFF0T2tpR0ZBR1o0Szc0b3lQ?=
 =?utf-8?B?R0JxelM3TXJTQStldUgwVmd5Nk0rblp5UUo3YmEyM2xvaWN2MGg4MkJjVG5r?=
 =?utf-8?B?UnU3b1UydVFRVlhWL2h1a0hBWkZHc2hQSmdIcGdPSXVnVXkzS2kzQlp6cVFi?=
 =?utf-8?B?ZDJBTFZJa1gxbXVXcVByQ1JPRzlQcVhhZ2F6NWwyQUVTZmNYUHVNZ0dPbUc5?=
 =?utf-8?B?M0hUYkNaNTdrTFFsUDFxUC9lN09yYTZuNElWaTNJU2dLQUs1RlV1dGRTQjNU?=
 =?utf-8?B?aCtuSktwdU5MSlBGaDRoNkVLMTJrTGgxZTR5bWRaRFdzRm5WZW4xTC9CWk02?=
 =?utf-8?B?WnFaaExOcWh2dG9vdWVDSkljTkVCTklEWW53dWtlS0FrV2o0czJ2Slg3ZTRm?=
 =?utf-8?B?VlFoK01QK2kwSE5rMlhxUWFNc0o4eDFNRkVSeUtjYlhLbkQxUUF3RWRqT0Q2?=
 =?utf-8?B?VVcybU9mV1FESGF6anVFUnNNTDJrL0VMaXdtdmxaQ3UwcVVyNXFWWkF5VUg4?=
 =?utf-8?B?bnE2dmdmM0hJUU84SU14L0l0TTZld1BFT3NIL1RaeDZVMlR6aHhKcFVxb3c4?=
 =?utf-8?B?Q281eDN0ZFJMM2NaRjQxTGxIN2lJMWcyZTZvWDk4TXBBMm5SQXZxTnhBWENI?=
 =?utf-8?B?U28zeGhVTGlOSVlBUkpVNndqYU9YaGZtUUk0Vnd1eDlGVS9jNGZZeWdBYk9F?=
 =?utf-8?B?Z2Irc3RNWnp4aUhRL2l3K2hFLzUzOFNHb3c5OHJIc0ZLazd1N3NIZVhESm1P?=
 =?utf-8?B?SStIU3NmcDZ4dVkrdnlndDBCcExVM01mNnNqN2J6V1Bzd3A1a090dTF5MGhH?=
 =?utf-8?B?NGVuZTZ3TittR0dtS3hvMHJmcmppNzl6ZTBKMzlRTHNUK3U3eUlYNXp0QzlQ?=
 =?utf-8?B?REJ5R0hqWU1OZHFRVjFpeWxyRnJhVEJUMEc1Tlpta09hekZFYkI0c1JMN0NY?=
 =?utf-8?B?MHJWQkZQVHNQS1FFWG5UTmhoZ29PTHlOVXRUc3NaSDNJc1JtWlhWUDAwQ0Nu?=
 =?utf-8?B?Rk16UVA2QnNWL2t5UmdZaTd5ZGc3WUsxMXVKYUFMdnRodVVXamF1aWhGUXVq?=
 =?utf-8?B?SmwzYnZPUEdHSlcvRjhINjFHMFRoZVczMEZlMXZSTldZU2R4MmpBdTRGTVE4?=
 =?utf-8?B?ZzdCa1l5ZUMrVHlQWUxNT0t5Zk53dzJ2U2N0YjJpUGxEbVRwOE1wVTZhUHNi?=
 =?utf-8?B?aGNkQkhaTnNoemdMUVdNWXE3NXNjNWZiSnNPbUl6bWRtUkgwUWFFeWlCWEcy?=
 =?utf-8?B?Y3poU3Z1aHBEa2l5MnNIQU1Fd2hNTmtneXVhb3RVc2dxUTNtQjVuTmVqTEt5?=
 =?utf-8?B?cHRkWEthNk5BZ25URVBuRGdqTU5WRmVwZTRvTVpzdTNPZm5wb0htK0pzN2tO?=
 =?utf-8?Q?BaQbV9ZU2/VhxWCML+XQf5ySDNJ87v2U6yJlQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(52116005)(376005)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0E5OXF4QkxOcllZZUtqaTFlUkdEMElPeTNKakh6Z1loUGhZeUNsYlNzRWQv?=
 =?utf-8?B?aWRTcHJGdnI3VzkwNGQ4S3hjV1B2QXVZVUFoS3RJcG5XNjNSSzR5TlF3YlUy?=
 =?utf-8?B?OWsrd1BEWFBOeTRMZ2VyaitPNU5lb08weEVkaXRINk1ZNkthNlhCZUNHVEU1?=
 =?utf-8?B?clZJTnA0UnMveDlYaVgwUnlvSk9pUmFXRkxnZXBMR0ZYdjhvVmlwSHNNUGFX?=
 =?utf-8?B?NE1Xa01DeS94VnM3OXRXbEJrZGVEZ1FnWXJwT0gvMW5XM0ViMzdOY21weXFl?=
 =?utf-8?B?LytlRUhqNjdzTlRpbXY4ZnBLTU9FOUtoOHdURFgwYXlQTm1XM0IrSUI0a0NF?=
 =?utf-8?B?dnQ3KzZyTEtYYkVvU0ZQWG5SWFlpYlV0Tk13Zng4NzZWd0w3bGZWZ2NoWStN?=
 =?utf-8?B?bjJFNlkzdDgvK3pzNU11WjRXWHZCSXhEZDYrVkhvNHNUdFdGam5aNjJPU1F6?=
 =?utf-8?B?TENCTDB1QWtpYnlmMWUrU2lja1BqZU9xVXppVFFucWlhNnFWMVFtMXFzN0tm?=
 =?utf-8?B?Q2NCVCtXR01qamQwOTdzWEJwWWZKc1lzRkJpUk5VL21MaDRCaEJCb01ZU2FM?=
 =?utf-8?B?YVhPWmhFQjBRdmtCQUlkWEdoeVhaSjllYTlSMWdPZDYwZGk3Zk81YkhPWkk1?=
 =?utf-8?B?VWlxaWdtTXRvcjlLWFV4anRnaG5ubC9MVnJKOGlCWEZ3MkExSnM4NldkNDBV?=
 =?utf-8?B?VXMvSUw1M21iVVh6VzczT0xBZENxczNYMHlZeGJwK2xoTWY2Q0VtbXdyVkV6?=
 =?utf-8?B?ejBSZGFBOUpPSUFINnhTMk5UUHNOUW5MazhuaG1OT0N2Syttaml4ZVhCSzc4?=
 =?utf-8?B?MWR1c2k1OGE2dGxFWllPSDdtWGYxQ0hJQlU1cVhkM3pWNzJ2RlF1TGM5Z0dh?=
 =?utf-8?B?OS9ERTV2N2x3TFYxVnhmZXVkNGZkWFR3VU1PTjdhZ3RWKzY3d3pOY0ZWdW9y?=
 =?utf-8?B?NEg1SUowUXc0dGgrR2xRRk1zVUFFY2UvVHJTdElSUXNtZXg2dVJwMWt6VWtx?=
 =?utf-8?B?eVoxam5Lc3ZLVkYwWGpCNFhnVVhESnc5UGh4VWczZnhWU0VvSVhoU05hVFpW?=
 =?utf-8?B?MzdJTU5rbGVsUjVraHdxRXpvQysvdjlJbDNSclVFSzB5N3BReW52MXRkUkgz?=
 =?utf-8?B?bDFpMDBUYTZUMGdqZmdXLy91VzBWVWFDeVNrNUdTRG1ENlp0Q2MvRjFaVDJ0?=
 =?utf-8?B?U2RnelJkby9jQ0taRU9GK1BERmxwYk9oYi9Ub04vMnF6MVczS0MvWkJWSHZo?=
 =?utf-8?B?TzI2RVFPRW1LZTlxWUZRNFp1dWFodUluL0ZIbFJIM3R1Q2VXMndEUStWZGp3?=
 =?utf-8?B?VkFnTnA2QXZEem5VWnFYa3NkV0IwcDdsWTZva3k4M0IrN01ZTlFFRGd5QUJp?=
 =?utf-8?B?SGVUUHV5NTkySlpNMG16dG9OL0xzblVOT0xXZjlSb016bUFHWEpxOWtjYXhC?=
 =?utf-8?B?OERpYWlwcHE0MW9wemJPWFdHaWdYbDRCZE9HaWVDN3krWGg1V0NxVTg1RWZW?=
 =?utf-8?B?Y1RvVWUrZFk4VmRZQnBLV1duRXNrb3UxSHV1S2Z6ekQzakNMT3FheHY1eUFT?=
 =?utf-8?B?VUlHOTVEelZLTzZSMXdDV1RXYW5CS3EzSGZBYzBETyttTU4yTzhWemRnazlX?=
 =?utf-8?B?QXpyZmpJb1pGcHU1d2NJeDFrWWFldDJVcmRXR3lVUnY2Wk9NdlEvKyt2S1Fz?=
 =?utf-8?B?cjNpM0Nmb0E2SFJJSDdySkVrdlJMMDdvT2tIdW1JQnZkdkdxU25vOFZXK3Iz?=
 =?utf-8?B?QjBFYnd4M3QrZnNwQk1vczV2OXdKb1hWQnozN25ZWlQ0TnloU3VSSzlhcHJs?=
 =?utf-8?B?RFJOWmFTcTJVem5qNW91b3FyMGlPcGUzNWYwbi9lMUxjVzd1S1RvWnpBeDVk?=
 =?utf-8?B?M0U3bGtFWXpHTDNYb0EzYkFZL2xDNjZZOXNoRS90MldwaFU3MlpqM3gycE1F?=
 =?utf-8?B?dHMrTHlmY2ttUnhBeDU0RThqY2FITjRMWG1HRjJnNnZDSnl2SmZ2blRWbEo2?=
 =?utf-8?B?OGl0U1Y0R2tpYjFTNmVDK2xOa3ZBWFR5dWtEUm9ZTlNFeWgyV0RuNGp6bDlj?=
 =?utf-8?B?Zko1VkU4SVdaQ0ZTbFVvWno5WjVHMjY4SDhvYWZlRi9oa0xHbDMxcVl4OE43?=
 =?utf-8?B?NC8wbDZGVFpjVTd6YWVHZ3ptd1UzeGR6bzFkSmFaNkJjcEYxREpLS3VwakZN?=
 =?utf-8?B?M0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ecc76e-d411-4665-45f3-08dc6dc7724a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 12:24:16.4117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBffa2g/1iTKG5ZfW14la8JXn8eT8490uSO87N27vogXvOkRUrfxY7IGEWt6UgeLsZ/+IIPnznwGURGPVbSkzc12gIxCsykRH1YHIw4T1rQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9512

Mule emulates an i2c mux (address 0x18). The amc6821 is exposed behind
this bus.

Add the mux node and amc6821 as a default device.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index 1eb2543a5fde..5ed7d51717bb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -12,6 +12,7 @@ / {
 	compatible = "tsd,rk3588-tiger", "rockchip,rk3588";
 
 	aliases {
+		i2c10 = &i2c10;
 		mmc0 = &sdhci;
 		rtc0 = &rtc_twi;
 	};
@@ -210,9 +211,23 @@ &i2c6 {
 	clock-frequency = <400000>;
 	status = "okay";
 
-	fan@18 {
-		compatible = "ti,amc6821";
+	i2c-mux@18 {
+		compatible = "tsd,mule-i2c-mux";
 		reg = <0x18>;
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


