Return-Path: <linux-i2c+bounces-3428-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0158BCDCA
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 14:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8614285526
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 12:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1D2143C61;
	Mon,  6 May 2024 12:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="Kldl70xV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2134.outbound.protection.outlook.com [40.107.22.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF73143888;
	Mon,  6 May 2024 12:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714998267; cv=fail; b=bKiKx+NfxnYFLdMdE8hANRS3UXRet5BXgnahFe9YY1uE2DQuonhyppow2QPg9OC+wPaRdnDmH6mdssUQpE9kzDNpm0vYsZsdeWRfikIgdSJoxyHfvTJJBM1KSnESqk5giXF1q8CM5r+xcc4ohSdhVMHsjf+zcfLYnsLYXCXOAAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714998267; c=relaxed/simple;
	bh=Ca2uKOFaUFQYmrzz9oCzcU5bwL0LB/x1odz4MSAr75o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IZtD6M32S+jZ5YOPzZTLarrTmL8mypekGHbTL1MCpdEB17gadaIO/dWFHnFw+gK4Htm5Ov5cMAl9VORJx7i2pABVczSq3QzODOiDNeVS5TIY0nA60cIWx55yZxepbXA6J+KYEvy83ZSJC+pnQG+E8QLX0E5k1C5kGZdJhPynS3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=Kldl70xV; arc=fail smtp.client-ip=40.107.22.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fn15/+A6ms0Ev8d4e32AOTwfu2N20rsmmqvVYc5GbbiECpUoYH2hWBDs2pK2MGm30qVgDjZhEO3d37/01+gY1hBRSKMMmWADyE8Srxd+hF9DfswVvCgjWn5ryR29el5RK/CmImc2P6ih91/IgWSdlZg0JEE+R2rKDuNwLO4yV9ZKu3AqoKDvPeWdaf31AQJM9Ddo9wSF37CWULfL7MfzvHAmQuwz+mHOJzIAdTdsbqQHRxVHSId5zsjMmOLbJ3HAWfv11WT0TBAyYszQSi2zIF5LdL6hhIMPziRO1KGtUvGfbDjA+RgH0r8pfmi18HLDHu9naZkD0YPV05e2ZFDFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyeBzbPQltYK0YMrn80XxvYh6a7BPrKE96OfIhxZSaE=;
 b=g4IoRcW02DNAT+ftwe2ER0YNzrf07HyefAN0vNu5meReG9KCppvPBamUkI69RGehBVzKUdJJazO58IXqQ4P2iaNhAVfNxy4s6sDJXpWdTQ8Pr7ZEXXbD+35I5zsWle1H0zF+XLsCWoy2ICikqBiD6ZDb0MvmZKI9E7aSbSiN/irDVi7eavqOiOrWCcIZUK9yXu43+oZ8GLZCp6zn6kK0ddDAAhGnEZHgEsdjYTOyPMgF6aS76Fa3WbW0jj+eBtsk359RpdUS1R3RlWxqEYhu+rxp4ovacfR7xW2LMv3BWBOltKKB2sk/cS+AgRceWBIvhPCMvfaUskelrDv9farfGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyeBzbPQltYK0YMrn80XxvYh6a7BPrKE96OfIhxZSaE=;
 b=Kldl70xVGooihM9hneLNi19A8Cg5V0KNY1P5YrBSF2bfwmSGwcRBbcXQiHwWAbkOCVh4mnFHBjDENgitFk9k1i4Qq52sODg9+2zuidPfWzfduLngB/6xRR2e9LMO+ujAkj3WFrC/8YTapRnvyshHASlsHLg6lE14Qth7X3SG7aA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by AS8PR04MB9512.eurprd04.prod.outlook.com (2603:10a6:20b:40f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 12:24:19 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7544.029; Mon, 6 May 2024
 12:24:19 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 06 May 2024 13:37:52 +0200
Subject: [PATCH v2 1/7] i2c: mux: add the ability to share mux core address
 with child nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-dev-mule-i2c-mux-v2-1-a91c954f65d7@cherry.de>
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
X-MS-Office365-Filtering-Correlation-Id: 6effe2ac-152d-4e1c-0cf6-08dc6dc771b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|1800799015|52116005|376005|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzZNaXUrYXZIZjVuUTd4NVQwbERXTTU4bjN3NkY1T08wdUJFTUQ5c2tBNyta?=
 =?utf-8?B?VmpjRWF3R1ZSb01CcjUvcko1UUtPdXZZNXZjRVVWbXVuQWpMQWlPcmlUZElD?=
 =?utf-8?B?TEFsd01LL0doNWNEVkJLVzFXRERtaU1LRTdIbEh2RGp2bkEwQ3V6am1XM3pY?=
 =?utf-8?B?Y2FKbjRlNEo0ZUwrSkE1RVRHd2pGeHg2VUdTc245WHdRclBzZnRxaFNqQmRj?=
 =?utf-8?B?RmVZb1k4TVJHdEJTUmQvUGErMGxzQVZPL3owaU9VV3ZGRmNMV0plTFR1RXh4?=
 =?utf-8?B?UkxMVkNKbEhFWmlvNkd1dGd3OVUwKy9YaGg2WUdrZi8xOThjbEdWaEd1VVJi?=
 =?utf-8?B?ZXlyNi9wREtqbFVUQ0EzVE8xbHphNnhDZTdMeE5jaVlveG9TSlNENkpvZUhR?=
 =?utf-8?B?ejZBRXBpV3l5Q3RTN2FoeEE0Q3lEa1BlU0g2eU03OXM0UHVHOEZZdlVpdjlm?=
 =?utf-8?B?MXhQUjl1VHhHSDZVWDcwSDd6UGRZdDVUQWt6MldKQ0hrdENTNVczWVdTQU5o?=
 =?utf-8?B?ODNzNUhXT1cwWnZYcWtYQmVwZWNhRUp1RFV5eGVyMXYxSWk2aUJCa25yY1NX?=
 =?utf-8?B?T3ZtZGJNN1V6QXEwVHVDMUdBZXN4eE5Qb0xNS0ZrT2pOY0ZySk9sNVRDaWdQ?=
 =?utf-8?B?Q25UNjBUenFHQmVZSjArRmoxWFNGL3VHSlBadnNtWjVMakhXcEhlQjNKMzU5?=
 =?utf-8?B?bDNEdTQ2ZVFpOEpMbXBBNW94UElzSmsrdUxzbjkxc3NFVXRBMGM3SWxBZys2?=
 =?utf-8?B?eXNpWTNjZ1A4Mml1amFGMDlJekQwZzRVVFhFaHF5c0U1bDNmVGt6ZGFpODNm?=
 =?utf-8?B?WGdLejdTQUZYWnp2NU1zLy9INmc0dy9kSFdjZEtWWmV6bG5lZkZUeXBVZUVp?=
 =?utf-8?B?UGY1aEF6UkFmaHF0S3ZCV1F6ZlFDZldzalRyVGtmckRpOFhjREY0UWRNQzZJ?=
 =?utf-8?B?L2ZaOEpNNllsZk9XUy9Ya3YrbHh0eFdrbnBkOWN2eGhyeDVJY2pEQS9Ja2Vt?=
 =?utf-8?B?RU1VbGtLcFpEM2gyQm9SUjJBTUhxOW5MS3J0RVVMQmpRTTZxd1o5TnJhYTcy?=
 =?utf-8?B?Vmw0bXN6SDdEMDdRcXFsb1VpbHl3WVpDNzNIcjN2U28wNU1CVDljUFBHcWds?=
 =?utf-8?B?c0VvaFgxOUpVTUsyNUJuNEdQdFhOVWwwM3dYMm04d3pKblVMQ2NHbzZWUWN4?=
 =?utf-8?B?V3QzMzlaNWRhT25iYXBDNnpoNnJTUy9GTFQ5UGFKVzB1MGVtKzJZUGUxQWp0?=
 =?utf-8?B?T090Tm5oMVhQRlRiM3hOVFlRdDFPZkJJZlI1cWcyUW84R1dNQWRTYjhrUHQw?=
 =?utf-8?B?bEYvQ3JxaWNuU1hxSWdSbmVROWU0cnJnNU15YUR3MFJmVTNxQllSNjFnVVdt?=
 =?utf-8?B?NkE1Nkg2eXJZeENOK1NkQVFhKzA5Y1E4ZnE2WVJ6VDJNTk42N0d6RzRFQmly?=
 =?utf-8?B?NlBVb3FZMk1kcnRpWkV3cW9qMUtWQjJZQ0lsQ3Uwek1SbDYzOTU0NDRTczRW?=
 =?utf-8?B?WGtTSHBpcm94dExIZUFOME01SGUvaWpLNDNQTVMvcTZzdDJtWmxVdWdQYnpo?=
 =?utf-8?B?S3VtaG1hckhUL1IyRldGMXhZVk9LQVkwWlI2UUNPWTJpQmVMWW5uQU1ld2RG?=
 =?utf-8?B?eWlXL05wOFhtcGNJK01SRzFJNU9sOFR3cnlwelhLaytpV3VIUGU4VTl0Nm8v?=
 =?utf-8?B?VVdtS0k0N0NpbDlhMUFJc1dvRFViUEZ0VHZFN0dpVFhWWi8xREFCOUJiTnlk?=
 =?utf-8?B?ZGcrOHFHUnlKSVlOa1BxQ0psMjRvOVFmQnpyR3EzczAxMUtZWlY3UzI2dGp4?=
 =?utf-8?Q?Pppur+7GfVc1StWi89F2MS0FZTuN/pmEc/WFU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(52116005)(376005)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEF2Y2N6RXpjLzhTNUxOakNBRlYzclgzcmE2MFBqQy9EK0xncnc4aityZ2NZ?=
 =?utf-8?B?T3RLdm5OOThVakFNSGdxUVNWTGs5WmFWejhJdW12azdmWFc0NkdZby8yclR6?=
 =?utf-8?B?NUwyU0p4dlV6N3hBOWNSdnhaZm5qQ2RaRVhoWm9KQ2ZpejNBbFUzdEpMc1U2?=
 =?utf-8?B?MTNMOXhwazIzTlBpdVRPY1BNNDVHWm4yWDl6QVZxRThHYVlReXBFWlhiNUhp?=
 =?utf-8?B?Tnc0OGcwOFV6Q0cvajRVR0ZYa3dvK0pualRLdnpJbjJpYlEzS093MW1jQ2tP?=
 =?utf-8?B?aWZiNVpNZGJ4Q244cXFSdmNFdXR0b3NCS1ZSbTRYcjRmM29wRE9HYUhxeVlE?=
 =?utf-8?B?VDg0WWVac3FHcDRXMFlkVlJlbGcwdFlIUU5uSDlHR2ZobVpUb0p4YW5YQkdt?=
 =?utf-8?B?Vm11Ym0vdHA2dzQvQ2FtZVlQNlFaU3RiTFFpMFNTd3FRNTcxRHZib2czcTJZ?=
 =?utf-8?B?TThaRXN6ZEhtTFdPOWk2MlFValhFb2ZqSitkbzlSZHVBQytzOU1HVHN5NzlQ?=
 =?utf-8?B?SnAyTzB5blZYdllEL0tMamVoMWlJUWdMYzZNNVJSbjNWNUo1bXpXbzROcjJk?=
 =?utf-8?B?YlM2byswNHd5NmhTbHVmUU5YVEx6QlVWUlhZM1VnN2d1MzhUdDhQYXdHa3hU?=
 =?utf-8?B?dlV6bk5tTVlUZEs3RlRpVVNaYUVxRks2RU1YU3NMTVlKTTA0emp5dkw2elQ2?=
 =?utf-8?B?NzlreENBc0N6REFsL0NsYUdlMlF4R01HaHoyS0xZZnZYc2diY1Q2TGN2RnA2?=
 =?utf-8?B?a2NSSWpia1NsNE0xT0hsMmFWOGJQYWJ4dHlxTTFyZWFhUE5nMnJ0V1JadlpT?=
 =?utf-8?B?K1p0MDl2ZlEzT3pTMDZhOXNZcUE2SEphUld6RTVwa01LVlpUc1NCZitoeHYy?=
 =?utf-8?B?b3lJaEFKN1d2NnBnUnd0a2ZyR0VSSHkzSDgvSnJQYXdIVTdKWStJNmc2R002?=
 =?utf-8?B?amc0c0IxT3M0VXo0QVM3ak1CdDhOb1JHYXBJK1BUUGkzSmNWLzE1bkxYV0xh?=
 =?utf-8?B?NWV4THdsMFVKa0J0WUI2aWJJWU1jZnFwN3h0NTFWS3BneU5UWUt3QUtCUFZn?=
 =?utf-8?B?dmpna1hlWmdEMG9sbm4ra2txUElXeGhGMzlVdEliSFlQODF1Z2RhMGR6Rzhs?=
 =?utf-8?B?dyt2NlZuUTQ3akZUNk02VVVhZGpJRkZxRnhZN2J2aWlWU2VKRzRFMzR2Q0NM?=
 =?utf-8?B?NFI5SEZiVG1iSXlseXhxWEhkeWk3aUp5ZEhUR0MwcGpMVGt3YnNhUFJmSURx?=
 =?utf-8?B?dXdKRlBDTG1WOFA2S2owVnZ1YnJkSVl0QUh3Q2w3cmcrbFNkYXo4L3c4K3A1?=
 =?utf-8?B?Zm81VjY1eWtMbzZtZFlSZWJ6dFJsY2trQ0lWZE1NNE42WmJ2RTFsbmRUa2xl?=
 =?utf-8?B?Q3Z6Nm4yZ0E0MHJleWRjTjBBakQyUkZRdmthcWtlVVpXNUpGcndEYzVZSVlT?=
 =?utf-8?B?N2RTMldId2wwZVRkTVh2RnpRYTVsRG9mUU51R2M4RHYwY3J5OVRTb3p5WDRp?=
 =?utf-8?B?NXZxRkU3OE5zUG5adUNmT21qejR4a1BjQjBPbzRGeTN4Tk9LZ2tkYkhMTnBh?=
 =?utf-8?B?azZ0N2gzczNCWTFWeXJmZldFQTZlaTVLaS9hU2VaaWNLdjViNFVTZjIybHhx?=
 =?utf-8?B?UnZBMG1IaVllU29rNXIva2NwZlVZUjNhbWdZVkdGYjcrbHI5b21BakFOSnJQ?=
 =?utf-8?B?RXVsQ0tlbGltUlM5SStQVW9vVzhhMklDSkZhNFJwV1c4V2ZoQWVGczl5Vit4?=
 =?utf-8?B?a0puZy9tcGZpV0wwOU5PbWFJYithVTdvTStuTlpnZ0pBUkkzNDc3OTJqT2Jk?=
 =?utf-8?B?T1RNdk1FS040Z09wK0FFTTJSZ3RDMzFiOVpWdGRRQjkrcGZvNFpsQ2lsTm1n?=
 =?utf-8?B?WW1rS2xSYlJqNXNRTGxZZTBsWDY4VWtQRVQ0ZFZHTWxCZjNqRGJpcDQwdjBk?=
 =?utf-8?B?aG1QcDc4dTF5dVFuVGhPb2tiUDFvc0Z3Y1BGZnczNGFwNWVUbGZMN0NvMzgr?=
 =?utf-8?B?aWthd2VGb0ozTytxMC85VzhaN243S1ZjM2s5Ym9uWjdRMGFNdTB3U1RKa2pq?=
 =?utf-8?B?eTYwL2FHSTlYcGR3T29xcUswVGRHaXArRWZScks3Qi9La2dEb21WTUc2Vits?=
 =?utf-8?B?Uk82bkNRbUpvSExiV0ZQS01hWEdJTVlkWFkyZUZpdmJIQkxzUkhmK3VBRnM1?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6effe2ac-152d-4e1c-0cf6-08dc6dc771b8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 12:24:15.4771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrzVeorVuNa9d7Gp/GyT+qoUB/NErmzYZ4C/giRA3T3HQVn4NgJo99HGhdYyw451v3aFiS1qr84xV1osZAnqmgbE2fEz5FdXfJ8JDev6RCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9512

Allow the mux core (if it's an i2c device) to have the same address as
a child device. This is useful when the mux core can only use an i2c
address that is used by a child device because no other addresses are
free to use. eg. the mux core can only use address 0x18 which is used by
amc6821 connected to the mux.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 drivers/i2c/i2c-core-base.c |  6 +++++-
 drivers/i2c/i2c-mux.c       | 25 ++++++++++++++++++++++++-
 include/linux/i2c-mux.h     |  1 +
 include/linux/i2c.h         |  7 +++++++
 4 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ff5c486a1dbb..ce2425b0486d 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -821,9 +821,13 @@ static int i2c_check_mux_children(struct device *dev, void *addrp)
 static int i2c_check_addr_busy(struct i2c_adapter *adapter, int addr)
 {
 	struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(adapter);
+	bool skip_check = false;
 	int result = 0;
 
-	if (parent)
+	if (adapter->quirks && adapter->quirks->flags & I2C_AQ_SKIP_ADDR_CHECK)
+		skip_check = adapter->quirks->skip_addr_in_parent == addr;
+
+	if (parent && !skip_check)
 		result = i2c_check_mux_parents(parent, addr);
 
 	if (!result)
diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 57ff09f18c37..bdb75a130cab 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -334,7 +334,30 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	priv->adap.dev.parent = &parent->dev;
 	priv->adap.retries = parent->retries;
 	priv->adap.timeout = parent->timeout;
-	priv->adap.quirks = parent->quirks;
+	/*
+	 * When creating the adapter, the node devices are checked for i2c address
+	 * match with other devices on the parent adapter, among which is the mux core itself.
+	 * If a match is found the node device is not probed successfully.
+	 * Allow the mux to have the same address as a child device by skipping this check.
+	 */
+	if (muxc->share_addr_with_children && muxc->dev->type == &i2c_client_type) {
+		struct i2c_adapter_quirks *quirks = devm_kzalloc(muxc->dev,
+								 sizeof(*quirks), GFP_KERNEL);
+		struct i2c_client *client = to_i2c_client(muxc->dev);
+
+		if (!quirks)
+			return -ENOMEM;
+
+		if (parent->quirks)
+			memcpy(quirks, parent->quirks, sizeof(*quirks));
+
+		quirks->flags |= I2C_AQ_SKIP_ADDR_CHECK;
+		quirks->skip_addr_in_parent = client->addr;
+		priv->adap.quirks = quirks;
+	} else {
+		priv->adap.quirks = parent->quirks;
+	}
+
 	if (muxc->mux_locked)
 		priv->adap.lock_ops = &i2c_mux_lock_ops;
 	else
diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
index 98ef73b7c8fd..17ac68bf1703 100644
--- a/include/linux/i2c-mux.h
+++ b/include/linux/i2c-mux.h
@@ -21,6 +21,7 @@ struct i2c_mux_core {
 	unsigned int mux_locked:1;
 	unsigned int arbitrator:1;
 	unsigned int gate:1;
+	unsigned int share_addr_with_children:1;
 
 	void *priv;
 
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 5e6cd43a6dbd..c3acbaaadae9 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -670,6 +670,7 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap);
  * @max_read_len: maximum length of a read message
  * @max_comb_1st_msg_len: maximum length of the first msg in a combined message
  * @max_comb_2nd_msg_len: maximum length of the second msg in a combined message
+ * @skip_addr_in_parent: No conflict check on parent adapter for a given address
  *
  * Note about combined messages: Some I2C controllers can only send one message
  * per transfer, plus something called combined message or write-then-read.
@@ -690,6 +691,7 @@ struct i2c_adapter_quirks {
 	u16 max_read_len;
 	u16 max_comb_1st_msg_len;
 	u16 max_comb_2nd_msg_len;
+	unsigned short skip_addr_in_parent;
 };
 
 /* enforce max_num_msgs = 2 and use max_comb_*_len for length checks */
@@ -711,6 +713,11 @@ struct i2c_adapter_quirks {
 #define I2C_AQ_NO_ZERO_LEN		(I2C_AQ_NO_ZERO_LEN_READ | I2C_AQ_NO_ZERO_LEN_WRITE)
 /* adapter cannot do repeated START */
 #define I2C_AQ_NO_REP_START		BIT(7)
+/**
+ * do not check for conflict on a given address
+ * used accordingly with "struct i2c_adapter_quirks.skip_addr_in_parent"
+ */
+#define I2C_AQ_SKIP_ADDR_CHECK	BIT(8)
 
 /*
  * i2c_adapter is the structure used to identify a physical i2c bus along

-- 
2.34.1


