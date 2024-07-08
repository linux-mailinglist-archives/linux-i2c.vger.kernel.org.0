Return-Path: <linux-i2c+bounces-4764-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDD992A70B
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 18:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FB512899CB
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 16:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7917814AD0A;
	Mon,  8 Jul 2024 16:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="dVksHG14"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2114.outbound.protection.outlook.com [40.107.20.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0CB149C77;
	Mon,  8 Jul 2024 16:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720455207; cv=fail; b=Do5LGBq7cCmWv3nQn6PUExwkqiGL/wIQrjGp/sZHXISr1TlqpfBLGlZhbMk9u5tRz3/PtaIVCI/OfMmvoJER06plv2orGBsqAlMrHowx8eErSlIwsO2RhlTejNJqE5tHmWc89k2naW3NjWb4N8gaPWvotGdMosUp44SuVLvgFSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720455207; c=relaxed/simple;
	bh=0ycskgF4i/k1Gn0W5b36xNoc0QCRO5/LXJVn/yn6OyQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oNCvJPQwOr0HyxaSdtSWMS/EvtcVczj0zaMAKl7Ju4S80HdUIIvJi/4rWxLP/7qWC5kiazVngZ34PwIGnn5kw6TS6dHZP3jTALxjnhQKb7fb+RvvF26Lq2PpN3FKCl2FPfzG2Si46R3xbcLfcfa+HCEmWmi/nMO68xLYa35vxEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=dVksHG14; arc=fail smtp.client-ip=40.107.20.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6Xv/rbNLwaHAjfMl128vNUAzgWD28MsfuhnwWn6CkE7bUkULkC2fEo8nnxKiKfIKVlIXDZIi+HoqBE1loQzTNAUwnhKzLyrYKXGxIKdisPuVu+Tqq0VBU/iypOSR6KnywTgQSY9gS5B2kPO3E5LUiyoP82tqpC+C0/9U1Yrxu3nTWEV5HbnVd6oDyds3tddaii4e5ak9x18zgDcRRA56T9gkjrXydqi/m06ONf71hq5LqyYD9LFasYnZS3LJ+tJ6KZ81i3cnzlqgJtxLzYnRI3bVBCR4PI44xMhqiylzg9Rf73ay3EgwoyEfw8W7j3uKXFK/feOJsXss2qBfvf4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vi2HZwiFEVHtrJA2zjt1qkuKLdtn2l7f/q+3qLebRPw=;
 b=FSCladac6bDy9IXlU5BqaCLl7vrZRBXixfcSkL34wxMnAFmxbShuBoq6UXwaWU/BBCG04WLDkPyTlqOzvdzNcKExL/e5UMXXwLzdGMepr2WSoVBX9+jW6ZGxzvP9dvyKJfCU7moe5IFRGwj6up6NaydkKCSy4xyxbIJgJm0EL16LAei8MK5ePdP8RwkBKu9xiOUY/Pgu3NyenP1tgrwRAjBwtiDyJFWGdl4ayh3UpyUFh4MBgHndWQE0k3j58xyNWMrOhPBpIe8IUunYFh5DkyGG5VIQPd5VE84vble2S/JrI5CMNTnwJX74cYLhuMa1Ef5Uv8RKDvNYceiEQlmtOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vi2HZwiFEVHtrJA2zjt1qkuKLdtn2l7f/q+3qLebRPw=;
 b=dVksHG14lPI4JubCWWQIxwnPabJ4TXm0iUp1UMohc4BFjoBK3Ur/Qvji7juZuN7XbaUhawpNf5YigooEYkxht5EmZyEGDMaBYiZBMWC16irO+T3MEv7a3lFlpze1u7F2BmZNb6JuBLyvaD6y/K+wmWLGWytQ3lfemIrDpZHqOhg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by GV1PR04MB9055.eurprd04.prod.outlook.com (2603:10a6:150:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 16:13:16 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 16:13:16 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 08 Jul 2024 18:12:18 +0200
Subject: [PATCH v5 7/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on
 rk3588-tiger
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240708-dev-mule-i2c-mux-v5-7-71446d3f0b8d@cherry.de>
References: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
In-Reply-To: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.0
X-ClientProxiedBy: VE1PR03CA0057.eurprd03.prod.outlook.com
 (2603:10a6:803:118::46) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|GV1PR04MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e39e594-6242-4e10-598d-08dc9f68dfc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjVvMk56ZFR1Z2VmQVkzVTlPOEE2cmcxWTdETDcvbVBzRHRKTTVONlVmNDM4?=
 =?utf-8?B?UDNiY21sM0pOU0VOd0hkNjVwUU9tWjNldmVPYWg2RFd1aXNXaDhkUStFTHhT?=
 =?utf-8?B?bXZhOXU4cTN0OEJpRGduMFdma1J4RmV0TEkycFNiNVFleWhkaS9iczd5OHBO?=
 =?utf-8?B?cDVtalRaTUZXVWZXUnV4eWZWdWNsaEJnWk1ybEZtK2NlTnc0YTRnZTJVL1Zi?=
 =?utf-8?B?ci9pdWRNd2NOV3hXZmM0MnQ1eWZ4ZmRLT1FZREdCZ2IwWmdiRmRNUmN5SzE2?=
 =?utf-8?B?SlExR0Fnbnp3RjNYbll2cE50aTgvYWs1UEQraEJTQ1I5OXFXUnRlQlIrM1o1?=
 =?utf-8?B?cVUwdUNoNlJJTms5cWJydXg2MlM5TCttQjNKcGk2bkNLdGZOOVI3Q0YzclFi?=
 =?utf-8?B?T2pKVEJFWWtBSThJblFkeDBmZW8zVzd4eXkrYmZ0Q2trMVJwL0Y3THk5Z0Zs?=
 =?utf-8?B?cU1DbUFiVTNNQkhKU1BJMlMxRFdhTjNwMy9aUDNCKzJmM0NHdDZRbUxoRVpr?=
 =?utf-8?B?TE5EN1YwWFpvbjlaOVluOGQzWThHR3YzMU5kZ3M0aWtuYUpvUkI3b2hIbDI1?=
 =?utf-8?B?aERORXNFY1ZEeVdUeXNBbHJLZVFrVmMvK04rNDBkN3VPYXFJL1gzbEdDNGFQ?=
 =?utf-8?B?bFU2MmdnVW82V1dDeFRNU0ExaWU5aDg1dHRQR3V3cmw0MFdwSjJMRHgxOGNG?=
 =?utf-8?B?RXF6WUxBV1RDU2huL3psYmU3UXo2NEZ5enpGM2RDVU1YWnpnWFRMV2VqNGt1?=
 =?utf-8?B?ejNuUmNNcGxkTC8zMWFsWWF6KzlXTzIvZ001Q0c2M0VHR211SXIrZTJxU2Uw?=
 =?utf-8?B?WWJWMFFqS3BkSUdGNDJzRnlIMXlndW45SmVNNGhQYXViMElJdWxPWWdud3FH?=
 =?utf-8?B?UytCU0llamNlN0xIOFhJR0FKYjZSKy9XRE42K0tNcDdQeS9kRk1rRlp4VERh?=
 =?utf-8?B?dTZHbE96M3dINUlFL2hDNXlPVGhPcXVOYVJ3RGtJalRyNlJZeFhnQzlFZGxw?=
 =?utf-8?B?YUg0NVBHNGJSSm8yUmpzbHhwcVZhVlBwakVwVGxHaVREOXlUU09xTHZja3Yx?=
 =?utf-8?B?MnFrcXZQYnNyWGdwMjU1MFhFcGJ6RnVya2NXeGZ3OUFNQkNPRmNrdTF5eHhs?=
 =?utf-8?B?VysxTlhHaWVPNjA4NVFUTzNoT2FhSFhRUlRLZG5HRHdIYkZMOUFOOTlDZ2RH?=
 =?utf-8?B?a1ZZRWFNMlViOEpkb21Fd0FLdXIvMUtNWVkyWmpEbjMvWFRPekFQZ3U5UFFv?=
 =?utf-8?B?VHhKRFdCT1VwT0UvdlFuN3ozKzM1WXU3OE9Bc1RWTHlnUEY0aWpXT0ppNHdj?=
 =?utf-8?B?RklUSm5HT3o2eFpxaFhTbUVGN0ZWWFdtMklLMzlCa21hb24zaUQ1YTFUdkhj?=
 =?utf-8?B?aEV4M2FBZSt0OUEwaGVYSVkvdWlGZVM0b1AwMUFlcFhibnF3RUZqY01oYk03?=
 =?utf-8?B?TGcrc093WEM0U25pWldIVVJMN0l1MCt1OEp1U0ZHMVRqcXRLVUM3RjdxSWYy?=
 =?utf-8?B?czNpZjc5R3BjM0I5U2phRjU4enNFb0pPb2dNK2UvL2cxNGZYVjFWZG5KTVRB?=
 =?utf-8?B?cEVjSmdlVVBPbTBOdkZCYXJ1cTJBUFBqZUVsVTMwQUN0VVhkRWZHWWJxRFNZ?=
 =?utf-8?B?RjM3R09nUEdsWXQ2MW5Rb0NGN25ORjFLYlRaL0FtZ2RVWGdzM2Y0M0I3bm4r?=
 =?utf-8?B?dDBNTnR5RFczKytrV2dmM1FnL05GbURueGlOb3A4ekxDZnBnTENPaFMxVkZX?=
 =?utf-8?B?R2hBN3ZXRWQxRTVKRWVmNUF5anQ5V3liWG1kbkU1ZUk1YllqVDhWZmM4MFBt?=
 =?utf-8?B?OVdnY1kvODlzcDFGNzJpYjYwSndTVW0vVHhvR29TZE9rUmJmNVRrcCtFbHM0?=
 =?utf-8?B?QVkyUDZueE1hYWtQUy9jY3dINS9MUUxPaEM5eTA1RFJIc2UyQkVCdGFMSWt1?=
 =?utf-8?Q?+uqs6Dm4+dk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1psSnV1dElLNUxnSDQvR2t4S3pSN0FjT1RSUGlyNVpKajdMeUZiNVNlVSs0?=
 =?utf-8?B?T2pTZElldEtJd2lhL0lFdGw5MnRKWDVJTVZDSHBEc1lEclNLRTRpYngwNTlJ?=
 =?utf-8?B?VHBXQmZ4eUxOM1BVOGN3Q0JqVXIzMmVkTUU5SXA1Ris2ajhWMjJnS003ZDlo?=
 =?utf-8?B?bVFaa1JtcG8zT1VxUWhON2Z1NEwyek5tNUtwUU1sNkhXMWU3ZUt1RmYvS1lr?=
 =?utf-8?B?Y0xram5weEE3YnNudnI0WFFLejExM2w1TjZPakpPTGlIYWdQZHdzQXJITDlD?=
 =?utf-8?B?TkVCWE1POGttYVA5RGNLakhRNENkbUFPNWhPTzB0UForQzNuOU4rc2t2M2VT?=
 =?utf-8?B?NWdycGIrZEduVTJRcWN6bWU3dGhXL2I1WmdCeS84SWd2ZVc4enJRRVdwckpE?=
 =?utf-8?B?SXgweEFqQ0hGdk85NFYxWWg5RW9BYitLUU1ubS9aUGZBS1V0UW9KTGk3YXRh?=
 =?utf-8?B?Uk5PL2NKc0JmMTdvalZpOENqYWdYZSt0VlNOQVllbTMvbGVWK0Z5WDlGR0NW?=
 =?utf-8?B?azYzQUdUdlovWWY0Nnl5ZjdHVndaRENBbzc0d1Z1VWwxZTh6a1FlZjZYdWhC?=
 =?utf-8?B?YlNKMHdHblp5Sk0xSEVIYTNLZUFOU2MwNm14cmxpeTQxYTB3Q29ENE5kbmlZ?=
 =?utf-8?B?SzBLV2dkQWpqWTI3UklTR0xNcjVka3BDYnVHSnQvcUJDS1I2VUdURzNtTnVq?=
 =?utf-8?B?K0x6WENIUGtzRVp4eEtsWWlJbE5Mcm85eWNZR01QaHZEMTFRamJaZmY1OTdD?=
 =?utf-8?B?MlFZdmlUb0t0MjBDTHlGQTZmelZ6cEhRRm8vVzdXWHlyUGFycDRqbDNGWE5M?=
 =?utf-8?B?VVlyaExhZWp6WmhCNTUxZmthOHdNODlDdXR3SjFBR0llVmovRzV6V0daTnRx?=
 =?utf-8?B?R2tYWDNFcndMK25tUVpOZlBrM3hqRUR0USt5TG16NkxTOExzNG9jL0s5K3ZH?=
 =?utf-8?B?U2VFeDBNV0NTVC93ekFGL04rQXdYTHZPa2tPVFBNR0dRbmVyYkp1YWkwVWpE?=
 =?utf-8?B?WmYrbko4Um9CKzl1ZnJjZkVqOThIc0QvMTdPc2ZKbGFqWTJMVnB1NlhwdFNk?=
 =?utf-8?B?VUIzME9FYlVJMHdNeWQxTS9VV1JzS0dLcjdvWDNIclo4NnhGa3dHamwvNW9F?=
 =?utf-8?B?WjM5QU5WVUxaUUQ1OHZkN3oxa0NIQXJ5NHo1YTVZa29oYW5Yc2t4cyszMVhT?=
 =?utf-8?B?MFIxdFkwRGdES05rZExrcE1JMWhvbE5vKzd4SEcySisxMU1NYzg0MHdyQnJz?=
 =?utf-8?B?ZVBtakxuN2F4SWtPQkluc3FwREhNZy9xa0IrQUZSaTEvcW5aQmJ5VEF1Ly92?=
 =?utf-8?B?QXE1NmxvVjVzc1NmbGFqbnFKekVpMjlZYnN0eXhINjdNUjBEWVA3YkxoRUI2?=
 =?utf-8?B?Y1NXNjJabmY3bTBoRHhLVzFoWkp0YnpwL3laTGdGRmJ1RUE0bVMzVTd1V255?=
 =?utf-8?B?eGd2c2RqeWtBMWFBeXJ5U01XSmhISjBMZVpUYi9rclJ0RFJabGVWSFNpSXNP?=
 =?utf-8?B?NzdRdFZIb1JKU2F3K1p2Q3NQMGF3azRXL0dyaW9jdXl3S0NnSGRvRzlyQks0?=
 =?utf-8?B?TWw0eWlXb2txclZRY1hIRC9LN0M1azg4eUlUOG1YdGFVWk5sQjhDWXE5TWRZ?=
 =?utf-8?B?N2ROeVh4RStJQXQzYWNITHlBU09Vb1pOT0RiQVpEa2xmak9Wa0tlRkRndUJ6?=
 =?utf-8?B?QzRmVU16eVFEQ0M0UE1id3RZcDNuVUkrUCtvbzJOc0FjTFRWU3N0UFZNcGhn?=
 =?utf-8?B?MGljaXV4bUljalByNjhrNy9YcGpIN2ZFS2ExWVVuUmw3RWpRcDVsN3RRbTBj?=
 =?utf-8?B?WkdWMHp3amkwLzUvSUNISGhialF6UDlJdEFHeVE3YThiRW9GeWNqdTluRTY0?=
 =?utf-8?B?Q2hYNFNJNm1tTE1lc3RZNktPT3lsS1V2bXpWVFNhV0cxZTNBeWtxNEJRRmZN?=
 =?utf-8?B?dk5xSWFVMWp4bHJJdk5iZ2V4K1N4RGhHM1JUc08weXZKeks4a1ZZMmdBZWtj?=
 =?utf-8?B?ZFhJZklkRjJVanROZWYxMEFpYjdaRGhxektKWVhGdzkwWlF4eVI1TTh4dHVR?=
 =?utf-8?B?anJaMVFBcUN6Z2dBaXhqT0VRTmdmUW0rNWlaUVl1TzNxRWFtOVRCSUdHcEM4?=
 =?utf-8?B?U01GZnJGMzV4T1prUDNldC84aW9BeVg1RkVrdHg5aUxMWnl6c3ovSmM2TmRt?=
 =?utf-8?B?RHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e39e594-6242-4e10-598d-08dc9f68dfc4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 16:13:16.0428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGr2+W5CaN9aooDeFZu3V2WXJKY8ju9TBGtWcZ4OKgHsRHudeJLq6l1YQGspKjBP2RYcDFgzAoWUdYQDsxfQwAfkmLF4Sz18mOcQSksuQ0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9055

Add the tsd,mule-i2c-mux alongside with the amc6821 (tsd,mule) and isl1208
as a default device on the mux.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index 615094bb8ba3..a02f1178c60c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -12,6 +12,7 @@ / {
 	compatible = "tsd,rk3588-tiger", "rockchip,rk3588";
 
 	aliases {
+		i2c10 = &i2c10;
 		mmc0 = &sdhci;
 		rtc0 = &rtc_twi;
 	};
@@ -224,13 +225,25 @@ &i2c6 {
 	status = "okay";
 
 	fan@18 {
-		compatible = "ti,amc6821";
+		compatible = "tsd,mule", "ti,amc6821";
 		reg = <0x18>;
-	};
 
-	rtc_twi: rtc@6f {
-		compatible = "isil,isl1208";
-		reg = <0x6f>;
+		i2c-mux {
+			compatible = "tsd,mule-i2c-mux";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c10: i2c@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rtc_twi: rtc@6f {
+					compatible = "isil,isl1208";
+					reg = <0x6f>;
+				};
+			};
+		};
 	};
 };
 

-- 
2.34.1


