Return-Path: <linux-i2c+bounces-3974-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE930903B08
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 13:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BE891F22951
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 11:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF4017CA06;
	Tue, 11 Jun 2024 11:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="nNdmiDvF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2097.outbound.protection.outlook.com [40.107.22.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBB417BB2B;
	Tue, 11 Jun 2024 11:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106281; cv=fail; b=pcCALquipcb7rh9W1YNr+4+mVrp4jOJo17kTDcfd3h7BWju1nEmPZpmZMzEBLW6GRQI6EG2sg7mRjpTKD3cDtLemN0j/HPsNIFXf7MQ007sALMU6TMuaUIKVTE4x0u8Euge+akL4u3EAR4t6UOcVSDM4UtBnPkV7xOllKqhL1ZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106281; c=relaxed/simple;
	bh=vhC1usf6aAKwa44qET5gnHFYGBkgbSm6Lk2JzIlNLcY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EINlBDUS20SbfBFo6mHWZHdEE75jWll1wCu2yAI8BGJyP5UeZEIT9lMqm3CWXoBtmkzj3iTcilwmuyTSzpGPvLiFTOY9rLPZy925tbxdWX4xY+rTJLaTvw49dYBNF8DU+3i7nfRlrp9rooNokYaElGqCXCYuBCM3V0tKyl/iCi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=nNdmiDvF; arc=fail smtp.client-ip=40.107.22.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iv/qnxzmzgN17AkKX5dYDg1tcdR8mL9i80Y+qmxoDztssd0xPviNVMVe8Z1acd0nuPe6vZfvslVPISljx5Z2eLq+0G9nlG17wHajdv48Xa/MUAk5d0HVNx5ROe6d0aIIevJ02BsMf20FHivCwNyGkVrkuzizRghv4A7x8hQWe+Tr0wh2sJforYyC6gMi1vtFS+qummLGFA5gHJQiuRnQkrERb9HIfHSBN3Pau2AV5BRJCt5ADhTbS2RLBSD18mYq/pbYMrstfI5PrgqEdAZJAr93IoxJz5/6VR4/EEMTiPe6CPSzVACw3wLnkBeqV/O+h180NPwIvSXmYwJA4fl5nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAKZwqSDccjmur5hLkm1VaeNdFGpJbQRsK80k2PwSmc=;
 b=PsRNYcxFsYdz9NE1rDfTfnfWKWkk0FMITmaiqF57Unv87yAoWMgMA1fuvKnjNlbscJ1cKz8bBwP4LwNJ+RJSXiDTQn7KzcS2Un5XVBMZGl0JNCi2RMgYx5VscrxnAfGEn8/KytMbFdvA1uaMI9gvgVv4gpZ+Nq6E8iyaPEnMBZosaXa2NXyPGmTG6FHZvINTVJRyOHTJLaQrYUOFerPQBimmPn5kzH4+Geaa4PaN+jtgxSi+03QVQ5FwlQvM9QOWOg3HaGwd2rXlHoahfVcdYavUr3fzrRdIge1AVb5b70uLKjNAqc748H4hgYgPo/4o2IFk7iaFHS6MVVP9bx3Hcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAKZwqSDccjmur5hLkm1VaeNdFGpJbQRsK80k2PwSmc=;
 b=nNdmiDvF+8jcn1PDlXgBGAnqKuKq7xcdkBptyaAIqswSEVIW+0WtcjXTeaoEK2yWqi/FUKmZtW7tTpnY49B/F/4cnu8D/fmzgSTAVEjmDyvALHkpJ1xZEfapdbrVcbCbmDq4uZHOya9ErMbFVY2xSeE4bwSWOKf/CDUM/3So5n4=
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
Date: Tue, 11 Jun 2024 13:43:55 +0200
Subject: [PATCH v3 4/7] arm64: dts: rockchip: add mule i2c mux (0x18) on
 rk3399-puma
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-dev-mule-i2c-mux-v3-4-08d26a28e001@cherry.de>
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
X-MS-Office365-Filtering-Correlation-Id: 081e17de-9f20-4438-6690-08dc8a0bdb04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|1800799015|376005|7416005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0pMcExaOEZ1eHNsUTEyblo1NjRYVUZIZFErcG1kdkJzS3JVak9jaTN2SWtP?=
 =?utf-8?B?RTloY0E1MmNPZnMzckxzd1Nia1BFQmVHbEJlSlh4RU5GeS8wd3M0bFhVZzFS?=
 =?utf-8?B?M3BWM3ZQMjZWZUN1dDhtR1pIa1hMaHkrVkJjMjZ0YmtYd0FkYVZIQnh1cTFi?=
 =?utf-8?B?NFBnYzJSUEV1K0g2bXJCMWZnR1VVN3R2N0NpdGhib1UxbzVJTm82N0FHbGhq?=
 =?utf-8?B?QlJneFVCcDFyUXl6SURCZXJxY1NpZmQ1Y1Noa1g0Q1J0NHVXbXVHdDdHcExQ?=
 =?utf-8?B?OExwVWZTYTBmTHNmQnBINEFOTW5DSkJ6ZlNkQ1pDaGZsUTFtdWF4YUJaVXgw?=
 =?utf-8?B?RjNLNVQ4cDlNaEcvMUw0VFVOOC8ydHFXaW5MNUlKSEgwOS9mVkpvMHVUT1VF?=
 =?utf-8?B?MTBXVzJEK3luMGxjM1RtaVJuZmpQU1ZqTWR2UEkxODNaMFYxSW1obmkvcUMr?=
 =?utf-8?B?b0JHeElkRUR1dzRSOWNTMTdRNS9wNTI0SGQrQlVvREl3SnkrQ20yWEpMLytT?=
 =?utf-8?B?NmpmcjJFU1pqK1d6Wk9zVUN6RC9mRk5FTVUrNVprdmVEY2huNHFvdHc2eGZ0?=
 =?utf-8?B?VVR4cUVmbXJzS3orL2M3ckFZb1J1K3FTRGxhWm9wUHQxRWZrenpacVRhQi9H?=
 =?utf-8?B?bmhQVWxnZ0p4K3VObkR4WjQyVTdTQkFsSjMvdlFiTEhWTXRCb01QRFl0UEs1?=
 =?utf-8?B?dDRvQUFmUnJVc1NUUjJNZzd1UVV4MXJydXpJc2REWWVJRE1ONkE4eTZ1Q0gy?=
 =?utf-8?B?VnhnVjBSbGx5ODZ1L2pOMCt0R2VrckhFK3lNVG40REx0WHYwczQ5aStVVVhU?=
 =?utf-8?B?cGFPN3YxZWxDZ09Zb2hSRlIwRWkwejZ5VlErVEpwb0czb28wR3o1b1d6NWx3?=
 =?utf-8?B?UjlGd3ZVWVc2MFdlWTVqcmdxT1NrTGk5aE0yaTVzdi9RNXhCUjY2ZHptWnUw?=
 =?utf-8?B?TTkrTkRZUG5hQVpBdExEbXFMOE1CamZaTGg3Q3ZGYkl4N3dET29WNXRjcTV6?=
 =?utf-8?B?UzZTcTBBMTMzQkhaOUR3c0NVRjRtMDFnZEwySERCcDExTzI2aHFUOXdwM282?=
 =?utf-8?B?cHFwaWR1UVFNbkJBZk9iNWhXb2p5WHhqRnhkYTM3eHhwbzl6TkdwL2lNNEZ2?=
 =?utf-8?B?d21GOUppSXRVMVNIRk1RRE9mcDlDMVp4MVEwR2p4aVo0bEhXNHNzcG9yVmNR?=
 =?utf-8?B?ZUZkMmIvQWlKcS9EakR0ODF0Q2lDaGpQbURhT240NkdndU1jQmdnQTZGTFha?=
 =?utf-8?B?aVlkeFJwMlZZK2RkQTJzR2ZjNFB5U1IvZEViNngzR2c2UXRadUh4VS9rbFI0?=
 =?utf-8?B?ZGd1VmVWOVo0QnljZ29wT0pNTEF6VXc1K2tqVDJPQ2Zwc0paNGhSK2U4T2hy?=
 =?utf-8?B?bS9lWWdSLzhrcE8ySnpyTUczL09STDlyaXoxbFNFcEdBMmlhM0dzbzVYRHc4?=
 =?utf-8?B?a1RvbWJNNzFKNmlkN0J6dWV1dTlzMkljaHZDNFMwRjY4YzJxN1IvY0ZyRVVP?=
 =?utf-8?B?S1NqV29pL0U4Zk5UNTYvaDVrRzB4UGRGUWRwRSs4aWJyTHUwOUNwUHlZZUhD?=
 =?utf-8?B?b2JPQ0VsOHJ4ZEcyanhQUjZzM0ZmUGE4NEVDMVJJQ2ZkTHNxcmpOamtwQTM5?=
 =?utf-8?B?ZjBPWUZmSXVOZWNNTXVEWlYvcGkrN3N5dExycnh1R05HWGZwTEw3N2tLR01m?=
 =?utf-8?B?ZnV3aFVuTDd3U2k1OXlENkZnbXNlbklUSjRHd3Zwdk5Yb0NhSXdEM2Qya1FQ?=
 =?utf-8?B?UHhwTWFYQVdDT2pmbVpKQkhCYnluTUtEdml5dGNzYTQvQ0s5aU1IWGJKcjVi?=
 =?utf-8?Q?iZKKG8Fd/HSsg/eWld84YfHB9EcSAMdHftCTE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(7416005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUlnUHFBSDBieklHUG5GclptV2tCK1h6RDZEVCtLSDkxaVptNmFHRVorNnIy?=
 =?utf-8?B?VlQ1b0xtdlYzZk4yU3FOY1JkQkFCOGtyWTV2c2ZGRmRrSGs1bjFDd01CZjMv?=
 =?utf-8?B?UXh6YlB2R1Z2aG5tTFBwSUZrbGQ5blRrQ255UzdCaU5kMEcrME1aTkJmeGVS?=
 =?utf-8?B?WXV2aXZiNGpRc2J2RFJyc3ZZbUxwYUZaNUNqTEEwTUxzZ1NySVFqWEtlR0J2?=
 =?utf-8?B?cEowbEYyNUlSa1hYbjRCVTVpbGRDc0xZVDRGNStqT1NWc1duZnJjcFpPZVpH?=
 =?utf-8?B?YWwvZi8xUk11cUxLQ1ZDTlpadm5DNDV2TGl4Nk8yMnYzWVJiR3Q5V2N1aTRI?=
 =?utf-8?B?TVdvQ1BTbVZjQ0RsczNxZ0FiZkF3eGxNcDR3SWtCcGQreGFERjZqU2VNOUhL?=
 =?utf-8?B?UWpHWDZBRXZ4b0NVZ254bTZRZTdnM2QvM3UwbGpnLzQyRGpMVlpLb3VSTVow?=
 =?utf-8?B?NTRTcWpXazUxR2VqTXhmOUMvbURCVGNyRFIycnQxWVdGYlA0ZERDeDdkbFN5?=
 =?utf-8?B?UkRmR1JUM242RnRWUUwweUxqeUNoMWFRMTZscHFmUFVXNElSdDV0bUhYSWNM?=
 =?utf-8?B?RkMwRThvbkt2QWFMZUwrV282dGIwVzdMMWdVMEZjWmRDbnNxYk9xb0VWYXpX?=
 =?utf-8?B?UGdoK3hCbmM4VnRBbURDWFNVNG12N1hWdWg3dFRNZE9tLzZLaG1JYzN3TG45?=
 =?utf-8?B?eU5wRzgwU1VIeG1GTXd5bCtSYlo4aW0zdkZxOHFGVnJuSktLaFhvZ0xoVmdi?=
 =?utf-8?B?KytHR000SE8vcHB0LzBaMzMrZm5NcDNvVGZBOXBZSEVMcUdzb0tGM0VzbTFD?=
 =?utf-8?B?ME9IVXhCUEl5NVVDSEViSlQxZzFWdjlRYzlJOTVVMmYzQmJFWDhrSEpwNXoy?=
 =?utf-8?B?SjlaV3dzTUdzZ1Ntemo1bllvcWJyZjduSzhud3JWcndNZEdpZ1hyczRjQVA3?=
 =?utf-8?B?SmRoc1BJMnpqYmhudFJ3SldFVmVtYWt1MHptU2x3bFhiQ3VvWVh5R2NqUy9Z?=
 =?utf-8?B?SWlKRmJ5Ynk0Rldqd3VmV3lZRjdFalhUVnp0WnJIS2o1cjlCbUg1SUtQWkhQ?=
 =?utf-8?B?OE9kR2E4aTJiL2xJUUptc2ZYZzhtN2M3aTZ4YTREOHFMYUk2SGNQNVNTZDl5?=
 =?utf-8?B?bFRzV0JYL0p4MExTQ3h5QzJaaGlIMFJ4bWVnTEN6SG9pclRwTnJLWkMzbTUv?=
 =?utf-8?B?VzV0VVg4eGpDUzVGUjNlVHlDL2F5cDFCcEh0N0ZVamN1MjVIZCszOEFiZFFV?=
 =?utf-8?B?aTFYeDA3WXNDSFhkT2hjb0N5L25TRWZhNUdCZjlVRUVTK3RBZm41RzBoRll3?=
 =?utf-8?B?NmJ6eEQvc1JteUV3U0lmRUwvSThHeVpQK0JGMjRMZGFzQkwxdmI1N1FUOGo5?=
 =?utf-8?B?ZVNnTWlWWmd1TW1mQmlZY050TU1yTE9uSnBPMFMwWlhzWllnL1h0Q3NxRTkz?=
 =?utf-8?B?Tk1Zd3JKME00ZnFoc3RJRUJ4ZUJ0UUpwUWM4MUNka0ZxbFQvMXJtREhMTFlD?=
 =?utf-8?B?MzdFK1ZJODBuNEJlRTlMT3d1WW14MS9ja2lIYnZzWEJBS05nSTh1QlI3b2k4?=
 =?utf-8?B?YVdXazBpaGtkc2YrbTA4T3ZqNlF2ZVQ2eTAxNTE1S2k4SExWQXpMbXYzbEVr?=
 =?utf-8?B?cmhuR3Uyb1NCL3laRVRRY1hkTEkxaFJmN1REK3hNQ2k4d3NwdEtJN0gvd0Yz?=
 =?utf-8?B?M2w1WnZ4b0RHbjllMlZIOHNDK0h6elJQMTd5eFZTK0wrWHBCN0xRL2xMWk5F?=
 =?utf-8?B?VVVQZEJFZEw0Vko0NjA2S2c0ZnQvZ0RHbkhKSFBBN0xYS2ZrdHhqU1FyakhN?=
 =?utf-8?B?cUlHYUZoNUdYNHZ3cXFlRmRyMURZblc1Vm16ZE4zTE9LcUlxZTg4MmUrSWFy?=
 =?utf-8?B?Vk9rWHdrbStvNHpIQVJ4L0RPZkRZdkh5dTRRZFRWdFB1anlCaGVSblJGNDhZ?=
 =?utf-8?B?bUc2Uks0QW9OWk1lRWtNNDYySVBEaE5hMXJqSUFHa0hUa0kydmd4ZXc3b0Iv?=
 =?utf-8?B?ZFdvRHVqWFBQaW96c0xJL0YvQUFwdTRBV0FRbE9Rc0pLWVZTTFoxU1hJaG5G?=
 =?utf-8?B?MGFXZTBIZnFMVW5TRmFQU2UxUzJndDlVTzAvYkhkLzlEWTlleWMxUnhJQ1dT?=
 =?utf-8?B?N0VNZmk0TnE4cnJIbjE1TlNGL3NhRUxGQ1N5Tk05Vm8yY0Z1VklQYkNnWlpx?=
 =?utf-8?B?c3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 081e17de-9f20-4438-6690-08dc8a0bdb04
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 11:44:30.7856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpyjcm/3+Go6lIcp+rdMVQUHsRIgVzpVUWLK0KyaaV4DR7dn9SpMNTX3rydCA32Md6RVGxtDPHBBMsMmKtSl5Dqbeyh3f/x2mgdExHk+N0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10301

Mule emulates an I2C mux (address 0x18). The amc6821 is exposed behind
this bus.

Add the mux node and amc6821 as a default device.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index c08e69391c01..e7313be24c1a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -10,6 +10,7 @@
 / {
 	aliases {
 		ethernet0 = &gmac;
+		i2c10 = &i2c10;
 		mmc0 = &sdhci;
 	};
 
@@ -357,10 +358,23 @@ &i2c7 {
 	status = "okay";
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


