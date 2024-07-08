Return-Path: <linux-i2c+bounces-4760-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E458A92A6FC
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 18:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13C6A1C20C94
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 16:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F3F148310;
	Mon,  8 Jul 2024 16:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="AOM5EtAx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2130.outbound.protection.outlook.com [40.107.20.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47835146586;
	Mon,  8 Jul 2024 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720455202; cv=fail; b=nwEhQYozGcrBVH9T7fZ3SlmZSKE1S43iRBOa8zh1rk63FgWiEufLNP5NXLfKo1mlES7rYVl6lbw3ckDz9ZGuycAcaLdGjDAv+0x6YG3hLgvLFjbIhNRz2obE14TPQO/ODF+mMIAEL10/uWcCpnU5VHTgWSytozSDyG+CIVwkf9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720455202; c=relaxed/simple;
	bh=NP9k8yloeg7t5mdGN0rvkMAqqSn42iQ5yzJrUhgibr0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CgOpnT1YASqp5bB+tfIVpI+LuyC/E2yiF8MDBBJW/HHtbeMBmQftQlj9yrgqX4NZcQBwaLrFj8ZHHlD39MpRVPP5PxjjfZG4avzh5GcGSrfXOa2GVOtbDtvMXJqaKNIxhOpRD36Rc+Bf3fNtoewb3IgJ0jNpEwlyhZWPRm7kSBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=AOM5EtAx; arc=fail smtp.client-ip=40.107.20.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbnVu33MNB//FB+2rIj5Ho+JYMwu1Ma9F1S4Y1gbtjDPtr3LhV2k8lb65j8REwV4rvfjDKuEBJxGJWR6kFUgmegagr/sLWDO3mGsufznDrSMMBzfQ1P/6fi1whgZUL70hmCa40rSEgibME6FhMxIVjrwNkyt1Yx1bmfrkW5gd2of8vLOwMO4JYLwszWS0QFDEUUpEchNrZx+B+kUbbNnkbwqN4d6qKcnRqYn0F/53c/ULewBMFM0r+tSriaNZCy2zsCkl6lNwH3OA0mi6CuUjHI5mDlO4Z6ddp6YZRZEevZmMGvBvOah0aPkR72+jrTf+XCrZ2Lyu6uMflIDjN7quQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkOCG7RY7/trDIgoqsitLNlBKtDFLvlpQa96h6aNfEY=;
 b=jPRyR8/v39jhmy/1QzFLgUtJkx4A3dmfd3B6kbBOfS0BTF7N5DcdRu1vjiQSHTiBR5PbX6aXRM4CfWp7Jv0s3gAM7jC/6aakz3qgj3fTvOTdYTotSkSbrBg9gObfH4oPlNaa4NydytMjLvmD96TlnJH28L3MVgBqzz4RAySLT8WA9/gYklVhxiDj/1sz9h7t4VxfJ2l7/nhoxWqrEDxTCrKWmUtMDO3Fgbw3MR7GSgtoZCBs9IUdjDbflm+yehKRHt1llHBs7Vm55XjGvNYZ1ZTM6PFfYfbFODNXtlLkKy/EcCks5wpN9L1voA3Ob3qw7fPoothoCtAtH8gQ8MhvnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkOCG7RY7/trDIgoqsitLNlBKtDFLvlpQa96h6aNfEY=;
 b=AOM5EtAxMZI46bqvSaYRYfIcg8zLhW1FcVHln4MCKuKRkS34jxyZJvYE4kPPGCMMkG2JuA6DxfWWInSfeD1tXLLLSXloo0ZGGEHw34d8GGCFZfOgv8EzzkHRF48Q/rq5MhY9GoPgUTwiE8yVqvgk1TbXenTw4oL239jvxqjQ3MI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by GV1PR04MB9055.eurprd04.prod.outlook.com (2603:10a6:150:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 16:13:12 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 16:13:12 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 08 Jul 2024 18:12:14 +0200
Subject: [PATCH v5 3/8] dt-bindings: i2c: add support for tsd,mule
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240708-dev-mule-i2c-mux-v5-3-71446d3f0b8d@cherry.de>
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
X-MS-Office365-Filtering-Correlation-Id: 80034f53-2024-4555-4fe9-08dc9f68dd92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTEvRzdBV0xGUGZqYitaNkRVdFBnUEZuNDNDcUtwdGpWSWgwK3hLNWFhWlVo?=
 =?utf-8?B?OUoyTWNiQWNwSUVVN1NSV2t2UXk1Mnd2WExackRwb2daTld6T3V4MGxncm96?=
 =?utf-8?B?OVY0ZndCZ0plek5jbHNTTXg0MmtERk0zcDk0ZVUya0V6dnRWb1BQcUNQQ2lv?=
 =?utf-8?B?bSt6RlhPeFM1R1JyVGk5bGY5dnI3d1J2TWdVaDZtYVNnVzNxVC9FRWtHTXBy?=
 =?utf-8?B?cGdmK3lzSWdpbFprLzViZ3V3ZW1UdmlPOFVCYk9xWlM5T2U5d3o4YmEzVHVO?=
 =?utf-8?B?Vm16MG1PRWpIZGhVT3VlelFKVXVDS2c5UXlia3RzdEE1T3BCaDBNQVl5bXQ5?=
 =?utf-8?B?UjlKblJIK2J6RncrdGdhUks2ZUFJVlYvd1MzeUVoQStiQWdrWWRQcG5mUVA1?=
 =?utf-8?B?RUdsTkVEWFUzb2l6TkYwQkNQU3dlSXp0b1lTMWlQRUJpY1ZoSndRTGZ0bngy?=
 =?utf-8?B?UGdTZGJ0aGhsL2dmSnlpSWpnSTY5OE8xNFZHNkprWjJXTTNabmZOOFFGRG5X?=
 =?utf-8?B?ZGJoK2k0OTFZZEY5akg4YllVemxtWXFUSUhJZHBFZEhJR25EMEFJME1QQ2Fy?=
 =?utf-8?B?ODBJSXZkclk5VklHSjlhUW84MjlUZ0tmcXFVRkpqWGp0eDd4MUhjanRGZ1JG?=
 =?utf-8?B?VGNwNWxYd1NHVFNMOXorT1Rxc0NXZDhETWZkZU1ud0YwUC9yV2xYMWVKUHJF?=
 =?utf-8?B?YjlmU0toMFBONHZSVFFqcUxQc2VhRUZDVFBuZEt0cy84NUJUT2wvSlhQemlB?=
 =?utf-8?B?Zk9qMmhKVUNER2xkdE5RY2hiUkN2cHBEaWkyMU1vOXhHWE93SUJVRmEyVGRX?=
 =?utf-8?B?L0J1Z1pVUStRNGJNYWhWMlZzUWdRQzdSSTNzdm5WNFRQUG10eUVicUs4WXlR?=
 =?utf-8?B?YUVPTWRTV1Bjc2tKRU5CTU1HOHVCcFoxOCtkVWc3Z2g0R1FGTzRrSXpsSzh1?=
 =?utf-8?B?bW9jRlRQWUw5NDVUbVlWamhDYTk2amVkbkZZdFVlSWtmOGZmRlFXR2lKVWFa?=
 =?utf-8?B?MzBCY1pxRVVMWXhqdjhnR2ZDV0JHVGEvQVpzdUNsOUJnWFREaEFINjFqTGZG?=
 =?utf-8?B?eS9ROFluT3pVc2p5QTVud0Y1akVjSDBVK1pwaEtwTmVRU2tSSFhOdTdHSFM0?=
 =?utf-8?B?bDMwWlVrSzhabjlLVHpJVUhvZWl0V0RtejJXSktoSjI4T2pBaVZjdTAxK0g5?=
 =?utf-8?B?QmtWVlpCK2txcFZXUlpDKzVhbThXVG5VWTVGaXdwdE5wQ2hkdDRlV0kyekpx?=
 =?utf-8?B?Qk5kZFpkQ09Ua3c1UllEUGRUS1g0WkFhSXFvNlpPWjZOVU5kaWVYSVhKaVNh?=
 =?utf-8?B?N0MyUG1JejZ6RjdFYitYZEdlUytNQmorVlpremt2UWVPOEFlcmpmWUJhQ0Ew?=
 =?utf-8?B?SVFZMXJRVmJJbGJFbzVobW5lcHdNUUY5OGxYU05MclNSY0QrYnZiZG1Qck1E?=
 =?utf-8?B?UHV3YWVwY1FoUHFTNENvWHo5UVVraG5jRU5sZzlaQ1c1TnRzUmQ1MTJhMnMy?=
 =?utf-8?B?ejY3bGxkeEFWL2JKUi81b3N4OHF1YXYzcUk5S3huK0ZJQXVwb3pFcjRJUUpo?=
 =?utf-8?B?NnZOeTVEdEhqWnlLYzhVUUFsWkQ4eGM4WnQxT29vTW5aR1BPbnNUR2xFQ3NU?=
 =?utf-8?B?VjNpazY0ZCtkTGpDSHlsVEdPMlN4OUt1MXBoYXZQYUhGZm8rdDhlVzN6VW9X?=
 =?utf-8?B?WmNGaVFZU1VNaHM2Y25PZUhkc3ZWQ2t5WHZOYUNYTG5mVE0zYk5Bd1FMUkZs?=
 =?utf-8?B?RFpMN3lWbUVid0NhZFlneHJsVU5Hbk1KejkrOTcxK1U3U3NkRTJONHNtMExs?=
 =?utf-8?Q?1NAhMqAfkQkbBs+vANyXER1Bn3bwpL7p3shIE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjVKckRzdURyV2ErSkFXeEx0cVRsTitFOGorKzlFT0dGRUgzYjlIUmxmczA0?=
 =?utf-8?B?ajhHejU4eTF3czM2L1lNRHlvc3YySUlQblRsbDdla3RQMkpkTFpsaFFod05M?=
 =?utf-8?B?cGtzbjlMWEM5NURCL2tVSWxYamZxZzJQMWd2SWQzTSt3MkNBaC9hY2lDUnAw?=
 =?utf-8?B?OXJ3S0RnQytoQjl0OEdEOE13WW5vbkRlc3FyRWw5cnJGVWhOTmpMZDZ6MXdK?=
 =?utf-8?B?Ti9XcnpTWnJCSDVMc0dHOXNRQjhkMmJlc2FNWno1bzdJRmFXZ2k1YUFMWVFD?=
 =?utf-8?B?SnFhVi9mUWo4NXBCMThNNUE0UTF3dzVYMUoybTV2aDFnYVdsN3B5V01wTFla?=
 =?utf-8?B?ZTMxYWdoZkFRQzlPK1hld2NleDRWY3FxemNVeUMvVmREMG5QRlhnNlRWT2tE?=
 =?utf-8?B?ZzhCQVg4Vm5XRTliNE9kMnVNSHQrVGFlVzRERURKVW5VMlA3WE5YVXg0SVM1?=
 =?utf-8?B?UUlOUE9jeW9kV1pkOEtCRDJTRDJLWXpWckJtM3l1SkFmaWdpN1lUeG5sM29a?=
 =?utf-8?B?NE1PVjlBVi8rcEFyNGY2NzEwWmZyNk9YR05qYWFFQmhpTUw2ZWkzZHlPbUl6?=
 =?utf-8?B?ZzY0eGo2MXlxUVpHQXNaWWJMRHRCWWQyaUs0Mkl1Yi90Wk5TdTZ0YWdFS0xi?=
 =?utf-8?B?RVdsaEdraVFLcHQ4R2xMRzZSOFVlbkNmY1hpdlRCTjl6N1Fwc25tRGg1a3NY?=
 =?utf-8?B?NC9QSFhJNkhib1BlOXNOVFhOb1NBLzRrTHNrRVZZWkNtN3NjbWdXSUFtTi8w?=
 =?utf-8?B?MG0zL2pTNVl3allQOW9kN3Nrd0NqTmJmWC9iNGhVbndTNlhHb3gxY05UT3Jx?=
 =?utf-8?B?c2wxQURJQTh5T0ZZS1dPR3ZTSDJWOHFxRHRmRkd4dGg0ei9jN25kSkVhZ08v?=
 =?utf-8?B?dGxpais4ck15MU56VjU0VDdWR3N6WEpVY3REVVVMS1ZxNk9maGd3K3dUcW5B?=
 =?utf-8?B?USt6clg4SlBjaUh5VlhkVUF0YTdPYXhMUnhCZS9NREtuZklCR01JOFpDbjJW?=
 =?utf-8?B?M0Zyc3JFeUx2RjE2YzBYM2FVT09LbERCaTN2N3l3Kzc4Q3lFTVl5V1U0UzQz?=
 =?utf-8?B?RS9zVHRGL0VGazJ1M2F1M09KeHJwY21kYWo2TjRWNklMc2szSEZmdVZXOUNa?=
 =?utf-8?B?eHdsVlNwelJnNWo3cXkwamZ1Q1grZGM0WHdLWnZVUnliQ1ZQUk16TDJORGFQ?=
 =?utf-8?B?NnIwU2g4ODNCQmVYNmpyQ0VDMFJtV3VQdTd3Rk1CMG9xd0M5SU9xQWU2S2ty?=
 =?utf-8?B?SDNwSy9XVnN4ZmJEdUxjU3h1bnk4L0p5TmMxUW9PTW1BWXBJZlZrL05PRk9l?=
 =?utf-8?B?d2ZjS0dlZE9IT05mU0trcUU3NnJzVWIzaTBBQ0dVQUo5TXZaRmFDeTNPanpu?=
 =?utf-8?B?V01hSTVZS0w5U2RKcm1abit1TXZiYzh3d2RFY3hpOXp5YSswWG9UeFpZakI3?=
 =?utf-8?B?MHBwY3laWkJlcWxQK3NjZmxsN2dwSmZVUFJWaWsxRmlsRVF2WWRWYzllb0gv?=
 =?utf-8?B?T1ZzdTgvemlsSitVdnJpZFdhUW50WUpqTHVtS3Rnc2tZQWNJRkxjb2J6d25S?=
 =?utf-8?B?UVgreEZ1cHRYcGhsM2lpampIS2h2MHpHUVdEUDZFOU9yL05JY1dCVGxueDhy?=
 =?utf-8?B?cko3QkJvYWlHM0dHSG5MZWdNWldhaHNsak9ISm1maXQ0MVNwa2FkNFE4eUtQ?=
 =?utf-8?B?UUlZbnJmY3l4ZnJBMHF0M3p2UWt6Q0EyeFQvZE4zOUFCbUY5Sm1OMzZ5Ym9P?=
 =?utf-8?B?Z0dmUXhyTW53bnRTNW8wSXZwaE5BRzRLZW9zdk1LZTJkNWcya2t0eUpLTjlD?=
 =?utf-8?B?U2s4RkRqallhejFmS0lVMjI1citWUHNkMzE2VWRFOVBUVW8va0EvZ3VXL3Fx?=
 =?utf-8?B?ZkZFbnd5UkNObjQxSEFoa0kwMmo3WmNzY1dSaDFGcUpaQ1owRWlwUlhiMjBx?=
 =?utf-8?B?NmdwazR1UVdQU1pIMEl3c0hCR3RlSWJuVWllQ1ZIdkQ4cnRZVCtKNWNuS0pt?=
 =?utf-8?B?UEthV0dEVHNPT1JWMDlHeHJObzJmVlMyemxPZFhZSDRCK1JLbG05bmZhUUJN?=
 =?utf-8?B?dUxoNmZ6bm5SMU4wdHVveFZScnBxTnorWnRIdmM5SWxOL083U0FMd3ZFMW5x?=
 =?utf-8?B?QXgvUDlQSjhMN1ZxUEErckRxclNMaFM1Q0pZWFFsRjh2ZlcyaXpaLzUydWxN?=
 =?utf-8?B?Rmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 80034f53-2024-4555-4fe9-08dc9f68dd92
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 16:13:12.3105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQxXZU7xvwyI3BSDfDz8MSeVTJu9J7/QUQNz5149O+DE+XYsbGDMdMiDM3EChwi/hXfNFm85ZqX2scornan1fcKmzD6loLU9dwFFzLCJUiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9055

Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
among which is an amc6821 and other devices that are reachable through
an I2C-mux. The devices on the mux can be selected by writing the
appropriate device number to an I2C config register (amc6821: reg 0xff)

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 .../devicetree/bindings/i2c/tsd,mule.yaml          | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/tsd,mule.yaml b/Documentation/devicetree/bindings/i2c/tsd,mule.yaml
new file mode 100644
index 000000000000..dbbabba8dd6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/tsd,mule.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/tsd,mule.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Theobroma Systems Mule I2C device
+
+maintainers:
+  - Farouk Bouabid <farouk.bouabid@cherry.de>
+  - Quentin Schulz <quentin.schulz@cherry.de>
+
+description: |
+  Theobroma Systems Mule is an MCU that emulates a set of I2C devices, among
+  which is an amc6821 and other devices that are reachable through an I2C-mux.
+  The devices on the mux can be selected by writing the appropriate device
+  number to an I2C config register (amc6821: reg 0xff)
+
+additionalProperties: true
+
+properties:
+  compatible:
+    contains:
+      enum:
+        - tsd,mule
+        - ti,amc6821
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan@18 {
+            compatible = "tsd,mule", "ti,amc6821";
+            reg = <0x18>;
+
+            i2c-mux {
+                compatible = "tsd,mule-i2c-mux";
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                i2c@0 {
+                    reg = <0x0>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    rtc@6f {
+                        compatible = "isil,isl1208";
+                        reg = <0x6f>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


