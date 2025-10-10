Return-Path: <linux-i2c+bounces-13446-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D8EBCE4BB
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 20:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 49A6735648B
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 18:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A1F3016F5;
	Fri, 10 Oct 2025 18:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aFJilxbY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ED5301483;
	Fri, 10 Oct 2025 18:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760122255; cv=fail; b=U5V/rqc+IQ7+ADyRLXFCnfZ5OT7e+3ga/PesKEldipqMp8E7J1EpLsTmw9ThKpkI7gAVa3NQl4wGSHAYxecSXBzsnYv5j8B0AzOxz9oLSCVuLIsya86DUlVTOMV7E9b4h6A0H0DrtC9jEooMat5lsxEKSUZZY5zqtZN33w6aZzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760122255; c=relaxed/simple;
	bh=aqvECgYHadrJpFYtfOSsLxaFaplUyXoxr6bd5wsHOXY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ou+UV1k5H9Q66WbkEUsKpdn8kj5YAbr1dtxc3AQbuYx5LY8NFdJCDHvqf6KRTbMga9K0rkG2GbFSJxkHw42GquEAX3lPE79wRONacKzVLkLNi9K6aPzI9OEp1mwXvqlKK4r0cj4mOz6FMimYMCWIAYotgdGRqtjazFVUiQw9I5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aFJilxbY; arc=fail smtp.client-ip=40.107.130.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdXHX90l0SPWjXXGGBNAFdadmxybj/aczMFe7MzExwln6I6gkylFOLwZ5vmROYyuE+dMRGZqKcXx6Kuuu8LbUjqDrDDUg4bXmZ20XqdopvuO5AR5Nx/ykjIADzfdd0O9jv3EIewXzyRq+C+CEiECCOuduGtzH/jSrjucU6I+kxIgmbKukSr2SwFj2vO7zycze/z1i51JzM8bmycl8IADN2g5JmSgd0am+ioYwWWfwujVr6vSmF+h+uvsPlDzMDXxruD/yy1J6vP+FtVmvVzgEWMxl2oC4bbIyYosHexcGaT412Dg4iN2n3QuvkNyxl7MJwWu8V13RlIOJR63uYADCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQw6yH5Z9L7B+fgrcbS65Cks5ky2LLS7ty0gZ1n3rTg=;
 b=O1Xphm6e2uieP113n5/QdhUonHjq9EhEzZ9MdOEZjcojBIWtfLea/OFdqvzhB20OlU8tDu9QHqkQJIlhk742Y+EwCRq8w76xldJyh1foJr3Y7iT0rcfUJeHplIy5HFl4qh3I2LFlBYI6NAsyMeOxozzJb/ZUv0jmdhGYp/+b+0tPvuPd5ulpwAv6zXNFbzOtsjK+P3zyRzw8LMyuTMortHco+5WFnE9vSB/wFbufB0B5L8TIVPlgF4vurN7RbV0NYVKdPP7+4Mvo766lcSlldLkvg2k78Fce2WwwTIjrtrMl8xrD54Um9t+4eYM9enAHNnZP4037NgHE0BsdnE2NTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQw6yH5Z9L7B+fgrcbS65Cks5ky2LLS7ty0gZ1n3rTg=;
 b=aFJilxbYjacbew6lbW90fWReNNsLOBwHPykTzuMXAm7IrUMTVCOR4gMY1vOUYh6+nLPNnHfrm6hQJTcyCzrLDgZm+7d53umpfJUIQcIqYTwNEveS9mxOYqpa2DmkvkT17A/xmD/rf9cekU8fyyMO+ZVTX8rFsFyONv30QbX9lWs5Wo7nGGna2SS4lh7uVyAytSEA2G02MAAzDohtGRvjgQc6i75asaOdC0zRW4ktbpAOugqBcWBRfxGtuj+SFJGMOtR43/w1/g6hJT6rpde92nIJKZvRcyJH3cj9VGMjQJhKPuAutcxkYiEYJWIi8YnovNrlOTqxsRXcqGmi0w3/KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DU0PR04MB9659.eurprd04.prod.outlook.com (2603:10a6:10:320::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 18:50:50 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 18:50:50 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 10 Oct 2025 14:50:26 -0400
Subject: [PATCH 3/3] i2c: lpi2c: Use auto cleanup for dma_map_single()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-dmamap_cleanup-v1-3-ec5bc14e82c4@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760122235; l=1781;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=aqvECgYHadrJpFYtfOSsLxaFaplUyXoxr6bd5wsHOXY=;
 b=cNHjs/qQAREU2O8pb6iG2KPjHbHEB9y0WVehHpS3bG7zdaSM4dlWA8QDxWTtqcNaanwwOwWJL
 ORttjxQz8KyDAO+bVCQ1YZy84zSh14I6lwlzNnNLy0vZKSg04FCL7d1
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
X-MS-Office365-Filtering-Correlation-Id: dbfe068f-f00c-47da-7ee4-08de082dee4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXNpRUlzTm5wSDlhN0J5VGpKYmd6S1dLOHMrQWlXRG9zb2w1SytoRXh6eVhZ?=
 =?utf-8?B?SHltQkNMNnIvMWkvVmtKSlRrRlhzS1Y4djRJVHJVd09zT1BETkd0dCtHYXhF?=
 =?utf-8?B?eTk2REw4NHNhekNpN2VxdkoyYXcyczVBZFVnc09Cb1FkMy9pTzZ1R2QwMVZl?=
 =?utf-8?B?QWF2TTNnb3JLSVIyUUdwNlgvU1BDMGFsUDVhdUw3YjY1eEZNb3pDQmpuSkk1?=
 =?utf-8?B?azRkN3hMeC9leDhUc0VtS01zSEtJcWtCN0JKYmtYYVMwMU5CaStyUk82Q0li?=
 =?utf-8?B?R1R1d05uWUJVU1FxWXJPT0lRMzRGNzJTYUxDRGc3TmJ6bjFvQjlrOHFpL2M1?=
 =?utf-8?B?R2tiaSt6V3pSSUUxakViNEgrYW1yQXNZcTd3UGVmTE1YZ2tqL1BCZmwvUGlT?=
 =?utf-8?B?bEw1Nk9mTUlOTUl0Z1hLNWFYTGFqVU5CVEl3QStsQWlYYWhKR1lXOExHa2o2?=
 =?utf-8?B?emxVOWlUMXRibk56VkVxRk9senZPdTF3T1pQNWM4b3hEejBSVStIekcyTzhw?=
 =?utf-8?B?bm43WXUxeUd0NVhYa0JURldkaU9rT2Q4bHBBL1pyU1daTkpFanV2WU9UT1li?=
 =?utf-8?B?YTJ1bEVBTXEyalIzaVB6S3B1SUJiLzdETyt0Q0cyQlVad3VOWkdOL29wanZk?=
 =?utf-8?B?K09lUlh3Y1ZtcTFQQXZ5d0dXbnZicXhCdDRCMkZuVUtqbHdNeDlHQU1HeG1G?=
 =?utf-8?B?dk94SHZWb1I4Nmc0WnlBSW8wSkd1WC9ZZHhicGgwaDUvVCttK3FTTXBSN3NV?=
 =?utf-8?B?a0JOVHNtUUttZGFVWmdGeEdCUjd0dHgvNmhrTU9PcndOdXhQVk9oOGs4SjFo?=
 =?utf-8?B?Y09UcDl4VGN1WWhCUy85clhZNEpCNHZCUDZpbnZ2Vk9wSlVzWDN5YXZzSDR3?=
 =?utf-8?B?NUo0T2pIcUdUMnpDRHE0YS9jcjBqUkh2MmZmTkgvQjhRN3hLOGhRMHdtZGRy?=
 =?utf-8?B?V0UzVThtd3d5aVpLVVBmazd3NzJJNEdFVVpBVno3WW1hV1VTTjNVUEQyUlNI?=
 =?utf-8?B?d1lEeThMTzcvMGgzTjRZSm9zeWpvWEI1RHJuSjVOSllVaGM5OUFUS1lMaEFQ?=
 =?utf-8?B?Ny9WdjJ3dS9qZGRQMzU1Q0hRZnhoUEtmbEhuanpLNFF2bHBVTU9kZGxqWXUx?=
 =?utf-8?B?Y2ZxYUpYKzYrNWx6WEp1ZGg2T2NvSmNEUkNLQlpkOFFpL1IraE9IUE9HWWx0?=
 =?utf-8?B?dEdna1puN1J6aGw1ZEN1NmFGbW9IanVqKy9nMVFZTGNXd3QvWE91WHJUWE0r?=
 =?utf-8?B?QUlFaWM5bXp1V1JiOVBXZU1tOWt6V2RQaTg3YVFwTUYrZWNZeEVzUXI2WkM3?=
 =?utf-8?B?ZDV3ZnFJOVhqdjVZY0E2QXNVRzlUejlxUnBMNkNZNGhvNWFweGVuQ21uRmJX?=
 =?utf-8?B?R200TE55R01yWSs4VTM0cWx2SUtWc3ZRODc5ZDBlS1N3WWFvY09ENWpxTWtO?=
 =?utf-8?B?dWpZZEJQZm8wS1hZTWhjSVlXa0pzL3c2cTFJRkkrV28wN0sxNVVaWktNQ0FY?=
 =?utf-8?B?Q2h2d2ZCemdNZVQ2YWNaaUVLTVBMNnpzNkJ0Sk02UE1aSXg3cFRMWmloRzNV?=
 =?utf-8?B?cXNVK3I5VFUyTFNDaFNLbkRmS09tcElWdXFsSXdoeEs3bnNjNUVFWjRCMnBn?=
 =?utf-8?B?NHhCWlZkb1k5dUNJZXlQalVJUWNzU01Mc0tjUGxFcWI5K0U3Y0hERW1XSmRK?=
 =?utf-8?B?Z29qalNCMUlHSURtNHVDUjRkN3ZhQXNQRGRiNmhxYlJQa3hUQ1VWMzhMRzJo?=
 =?utf-8?B?cDlBV0ZyTGtyZEtIU1c2a0dFYmhuM2o4bzRLTzZ1YkcvRC8xU2IvL3VqTlF4?=
 =?utf-8?B?VDdhRlk5V292bVRCWkVqcWtQNGVucnJldzVTREhlbGxnajE2amhJSHg3bzR4?=
 =?utf-8?B?dU5CZnRJeUI4WVprUmdveUxqVzFXZUpOa21VdnRHRmV4OG81MDFmTTJ6ajZl?=
 =?utf-8?B?aHYrRXByaUM3SlhHaDlkRXlGd0F1WXEvVk9TNnpDWmZtOW1nWWN4RW1OOEhX?=
 =?utf-8?B?cUlvUlAyWUNFSnFpdTFqL1d4T3k0Z3NyanU1ODNyNjI5Mlpva3NhK1QyaFZn?=
 =?utf-8?Q?pYGvlA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHJIaGVVdldHYmlhMGV4Y1h1QnR5YkNYWW9nR0N5ZDJLNW5qMlBQRGNzNngx?=
 =?utf-8?B?VUUrUlp0TVppQU1UTDVjVjI1VXlrWEtkTWhXU0FzUVdxUTdKNS9NZXNqNXE1?=
 =?utf-8?B?MU0wdTJISzMwb2NkTEJETkM2d1Zud2w0aThYVmRDUUpkZjhqYjF1K29EL0Nh?=
 =?utf-8?B?Q3dPV2pGS1Eydnpsdk14Y0xHYmhKSEcwVnNUM01SRDNucTUwcXhReWtGKzBJ?=
 =?utf-8?B?bHlLVkFwbkRBY0ptTWFRMVhRWFc4S2I3MGdBaU12N3I2eWVqU2xVSENNV3gr?=
 =?utf-8?B?N0JSWitxMTJIbDlEaEk4REdqRU1CUnZkOElFa004MFVJWXdieWl6a0FvZjN0?=
 =?utf-8?B?UFp6TGo2TUhFQWxHRmlBUnFwRDdhUHRxcTZuamZkYzI3NzdGaG9hRkRwQXVE?=
 =?utf-8?B?QktZQXJqWkJVVXhVQnRscVBqR0JyRklLU0xnNXliTTlBR1BqamduL09iK3JR?=
 =?utf-8?B?bFdVNlFWYTcxcnBZYXB1VFYxSXhmY2RPeHdlWG9PQVRoeGViZCt1Z3I5dElE?=
 =?utf-8?B?R0ExcG1wMXpyaUxsMFJrTjRtU29zWk5DenR5YXBBNlh1LzF0YzZjYk9TY0Jn?=
 =?utf-8?B?d1pjS29xdXpnbDI1bTFwNHNTOHpXYUFkOWIyTGkxNHlOU2lhU01sQVQ0Tng3?=
 =?utf-8?B?MHdpZ0sySVJvWnV3Y0c5dVJlL2orV1M1RmwyTG9mOUxEdHlmcjRwUm5MYzdQ?=
 =?utf-8?B?Z0N3RHEveVVQMjdQR2FEWmZKN2JTZTBHZS8yMy9qaE9aQkJmUVI3WFdtdkVl?=
 =?utf-8?B?S2lTZHNvYkpHNldMNHhWS1B2VHhocFIxUGZQTGlWbnIwTGZGTGNVTnN6NW9l?=
 =?utf-8?B?MDZ3cVk0bnFFR2pBZ0JxUUl2TW9UbjRFdEtmYlhROVBJUlZnZUIvVWxFbkNS?=
 =?utf-8?B?RHVyMVFmdWdHTTBtbC9hSDlEdERuNjJ5S0FCLzRjam9CU2lWM201cHlPeC9o?=
 =?utf-8?B?WVhqd0NWN0pCSTVNZ1EzUFNHSU1tdG51QU52SnlmbEhxV3AxUThGZUhpNjYv?=
 =?utf-8?B?NDNqaUVTYWVNZHVDREYwY292YkhPVG9Gd1N2bGdtSC9LeUg1cU5uakJPb0ta?=
 =?utf-8?B?YkhHQyt0NmFNWFpQN01IMHcvSUc5a0JGSTJUNUo0aU9pYzBnanIrQy9hSmNh?=
 =?utf-8?B?NS9UdGRaRzYwYk9VK2lZcTBqZVdWWUp1MDVITnhrMXR1SWtJNHdVaVNNdDEy?=
 =?utf-8?B?cXhwSThQSHBGdUdvMU04a0NsUi8zUGM1M0dUN0tyUjlCNFg2aEVNbnNqMnUx?=
 =?utf-8?B?ZlJNYVEwSVAyMFJxaHZZTHJiK0g4bDFQSklwN1ZpMGJ5M0tFTlNlNEYyUW93?=
 =?utf-8?B?OGJkR2JiakY4eUVveWR2K2RJNTh0WUExdms5ZXdMRDdrVG1HUXpYVkpKNHd5?=
 =?utf-8?B?WW9nV1hLZGRFSytwc3NPSHVrUDE5bHhMVkhlL2M5U292eDkxZDV5L1N6cmIz?=
 =?utf-8?B?QWZBTWFRVDhaYldmNG4vNElrWFV6djVCakVCbVY3YVIrRGdSTWtJbWY0RDYy?=
 =?utf-8?B?cHVMNHdUWVV5Q1Q0V2FKck1BRk80N2ZaemF3eFNEc1BLY0l5eGNKc0t5Y0tE?=
 =?utf-8?B?T1hMOFY2SHdpYXJreVBLcm4zZGZzbkY3STBpWVRBMjhhQnhuQ2FKS2wvWEd1?=
 =?utf-8?B?UEZ1VGZxU1ZoOVNGTlMvVVpLK1ZEMEViWC9UUFdzSXhHVUE3bGJxdkVBRmYw?=
 =?utf-8?B?TTFLVS91MnVPd3M5K1BLSTRoK0JSMGJiNDJ4OVdHODdQUHRKWC8vSG52Wm50?=
 =?utf-8?B?d2d2eVh2UkVMcTV1UFY4QkttR0lSQVBtSSs3SXk4czQ1QUNmWGRJZlZrOVdB?=
 =?utf-8?B?amlSUkt2dEY4RnhuMzVMRDJvYnVIS0thcDlLdXBnZytvRTdNSVVWREE0RGJF?=
 =?utf-8?B?b0dZbTlCKzVZWTRHbjBJNkpEdVJNdFZ4WDF0MjBKKzRaMGVNeXZlK0cyejZn?=
 =?utf-8?B?TS9vUFA0TWQ4YkIvQXRDVUNhM3VPT0x4MFAyemRHNS9TL24xTllHUVRIcE52?=
 =?utf-8?B?YU1iYTVBbHFsemZUNzdWSFZGRnJodXNRUlUyV0xKcWZaVWNXb20vb3RWOWZS?=
 =?utf-8?B?OTJweTJuNUlVaURyZEduUVIzVkxzNFFkWVExcDRhK1BmT3JOSTRmMGdsN2po?=
 =?utf-8?Q?vmDxcMbyNIkieOTvpO82QsdMS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbfe068f-f00c-47da-7ee4-08de082dee4d
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 18:50:49.9114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqIf2gggw0aEpYdOR346vEv8E4GxXceU1da5tYtxP32rV3G6sm3PsmtWbdBWSbf0GOBs+OUu2kETDmiTdt36Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9659

Use auto cleanup for dma_map_single() to simple code.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Demostrate to how to use auto cleanup for dma map functiongs. It will
simple more if need map multi buffers at a functions.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 03b5a7e8c361abe1d75fb4d31f9614bbc6387d93..2c89d441ab1b3e607b8a2b0a6589e5909fa39ef4 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -727,9 +727,11 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
 	struct dma_chan *txchan = dma->chan_tx;
 	dma_cookie_t cookie;
 
-	dma->dma_tx_addr = dma_map_single(txchan->device->dev,
-					  dma->rx_cmd_buf, dma->rx_cmd_buf_len,
-					  DMA_TO_DEVICE);
+	CLASS(dma_map_single, dma_addr)(txchan->device->dev,
+					dma->rx_cmd_buf, dma->rx_cmd_buf_len,
+					DMA_TO_DEVICE);
+	dma->dma_tx_addr = dma_addr.ret;
+
 	if (dma_mapping_error(txchan->device->dev, dma->dma_tx_addr)) {
 		dev_err(&lpi2c_imx->adapter.dev, "DMA map failed, use pio\n");
 		return -EINVAL;
@@ -749,18 +751,15 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
 		goto submit_err_exit;
 	}
 
+	retain_and_empty(dma_addr);
 	dma_async_issue_pending(txchan);
 
 	return 0;
 
 desc_prepare_err_exit:
-	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
-			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
 	return -EINVAL;
 
 submit_err_exit:
-	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
-			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
 	dmaengine_desc_free(rx_cmd_desc);
 	return -EINVAL;
 }

-- 
2.34.1


