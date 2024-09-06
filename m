Return-Path: <linux-i2c+bounces-6327-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2246D96F8D0
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 17:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 996961F24077
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 15:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DAB1D45F4;
	Fri,  6 Sep 2024 15:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="TbXXrFUo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011038.outbound.protection.outlook.com [52.101.70.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792A21D415A;
	Fri,  6 Sep 2024 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725638161; cv=fail; b=N/42Xwiu/bo27v4dG76WZDNEl0vnBwk66Gtv5pniG5J/SP7Ihtgklzemc3NQfQvwrcx/obWH0jNvtqUhOvi37NOo+7kWECHTN49NAmQd1R0ALnD5mSUe5TXAE0j+jXRzMEGYfRAHwNqkxr6VsYH9CeGVvg5uCjULdjDdZ7ALcf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725638161; c=relaxed/simple;
	bh=rwXSRqqFtdcgNACeDSgbnCfmrItiPQM6m/OWfHPeEf8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hA+tKqPfMIyKq7GAUhYbqOoQ12AiKta/G9hsKgYykhBQ8V1fdXdgx8FDGd2/83hENrNjOG0qc6+X+2mvLaPKMrZdSIqAvqk5MjLFIwIx4DOmJJ3fqkAHkS65hYUdYTCdzMRKNgCN9w80MSeyjGBI0pYLtJbLcdv4jm4C3MR6Loo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=TbXXrFUo; arc=fail smtp.client-ip=52.101.70.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkFHK70zpjCVgceRtpsOVvxEI7mkA+rCe52Ny92Asb6sytQoRevckqnJB+usSzklO+cXfHJY6uYEJNxZ5DBkObwpd3rMwQGBABdpYb2Hm67+phjuxWf2sUqmi7G8lkBBy9zZA5JPS/psMcqiAf798DWL2iwe1n8WNJqgdOTUPoajiiiR8FA2M33AbS8VDK5i3rErDzYOSNaLb4v/un6LBOq59vyqaPEUpyzcqfXo8wKFceH8Z6Ghga25lBkIvWnHsZClqp4MnmU5mTc+L/pdP+c/VRL8WHMhXi6UxZe31QOea9CCt0r1U/ykHTKGOTYa2XgcLnbt9smChvtyGz/FAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8mhuCI8xUg0KfJGj5vUAfFtFVTEWAm7Pr1592ZIMsI=;
 b=o2oElQn5mjGZPZ34AIZsjM9yay5PirhSlaTp2tet8Qlraq8jYe1P/rRUCMhv172MYjTJmduf8+VR/klWXgqte0VL0sKVl0ebNHeN6/r86qv2guSJGyQABMfXu3pIy3+Fa6Z3gcDQWOY/BkKuG3aIhFXx+y+n0wNtCalf8s9wwkJzqsi8YmDmPYLOkkPCbmCxZgcd4lhEFjv9ozB8a2w4Tc45wG+688bHzKQ9ghrsXZyO1jp5dGX+avI4IYgUByxDL2ay8nad/Ty1fDVAgx99WGwh8WgRQUo6YW6HZMTrqb3Y97IIXV1F5M0slhUnJUhnDXzePbDy49nIt8RzKwScrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8mhuCI8xUg0KfJGj5vUAfFtFVTEWAm7Pr1592ZIMsI=;
 b=TbXXrFUom6QSNwEzFh85UATWuMeO4I75VLSo2xd+loO++mGjQtmP0QF7ypESssP1OKeE64P411izBK/QletsObptzSi7RLhORcB2eTbPECWloTIqZX/lFFyPJZ5T7NkyGYhzBlCu44+bBoyw7E2OmhALPAUs3yObAHkANev916I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by PAXPR04MB8319.eurprd04.prod.outlook.com (2603:10a6:102:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 15:55:49 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Fri, 6 Sep 2024
 15:55:49 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Fri, 06 Sep 2024 17:54:15 +0200
Subject: [PATCH v8 4/8] hwmon: (amc6821) add support for tsd,mule
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-dev-mule-i2c-mux-v8-4-dbd28a150e41@cherry.de>
References: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
In-Reply-To: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
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
X-Mailer: b4 0.15-dev-77eae
X-ClientProxiedBy: VE1PR08CA0022.eurprd08.prod.outlook.com
 (2603:10a6:803:104::35) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|PAXPR04MB8319:EE_
X-MS-Office365-Filtering-Correlation-Id: acced04e-f44a-4342-e80c-08dcce8c60df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVgyT0xkS3IyWEJrbXJPV285d3FOUGp1cEZWZWo3L0RMWGlwWVlaTll5MkFr?=
 =?utf-8?B?bzRjck5BUXJGVHJkYW80bnFYbUg0ckpNam1OTUJZbXlGUm54U2tqNTgrSyt2?=
 =?utf-8?B?alBnZ1BHQUF1MU92amFBSGNkbHR6RS90KzJXYzdUWUVHRDlzN1NUNitRUWlK?=
 =?utf-8?B?Rm5UeEtjWUFuWndrZGJxNzV1OVVObjR3cmU2aGlOQXAzT0QvcVhuNkpDSzNC?=
 =?utf-8?B?QVgxUjhzY25JNFpSRmNTeGJWWGFDKy8xR2doZUR3eGlaVDU1ZmdWdm5MaU1Y?=
 =?utf-8?B?MTZpbk12UGxzL2I1YVJ2cjRLcWhyQXVyVFR0MU1STDduM0FYc3Nqd0FUVXlo?=
 =?utf-8?B?Mi92Q2lOa3JNdzY4VWYrRUpHNFBqYlkxLzZ6LzVFWEZldndGU1c1N2J1bVNO?=
 =?utf-8?B?WVFaemJzckVRM1YxZlQyVUZaUWU3dGJnSXpIMVBvaHFGYkhLZWJoLzBlWlhq?=
 =?utf-8?B?SWtXdDRWMjdiRVN6T0V4NDJ0OFl5ZnREZDJhVG5SdGR5SkRxS2FXR0t2cm1G?=
 =?utf-8?B?dkl2aUJnRVNjSXRITmZwY2pvM0trcG9HR2lKM0tYYXV3RVdOVlJBdHU1VjNq?=
 =?utf-8?B?bFhraVg5anNqK3JYWk1aOWJEbTErTnpkTklNNlJ5ZW4xSnMvRlVhWDcwQVRz?=
 =?utf-8?B?NERsTWZMbkxFU3hLaWw4SUNXYld6aGFaZmRheXZRUW05NjdxTmY2UVBTcXZU?=
 =?utf-8?B?R0M3TUo2VnpxaDhlSEJxZGw0U2ZQNWk5NGFkN1FpVE5MOEJYc0Q0NG9UaEtM?=
 =?utf-8?B?V0ppbXg2U2FXWVVYeE5KenFHT09yYkprQXR2QTJMV3RoKzBhN3pxdFFKL0Jr?=
 =?utf-8?B?MlRieHJoYktIT0REeTJCNnJTakNqSEVCL1IwKzFMeGx2R1R4WkdWbTVjNG1P?=
 =?utf-8?B?ektUQjhyYUR1aGZyZlBOUXZTVzVyYjI2amtBU0FLdk1pdWFMTms0MVJtTm1n?=
 =?utf-8?B?dWZmQ1lhS0VldGxQb2NaVDl5c1BRVUt1ZCswamRZMTlxQVl2dmd0dk1EemR4?=
 =?utf-8?B?TS9POEx2YStheHY0eEhNYy9uNTRSdDZuUkhjNGt5YjBTUDk3Sm9CeHE4c1Jj?=
 =?utf-8?B?YVlNSDh6NWdDRUZBbEdOaXQ4QnVZeVRpalhxenZvR214ZzVtdWs1ejhocHVH?=
 =?utf-8?B?RFd5L05mUWZ3SlB0OGd5Y2ZPL2NNRHpxaGpmZW1CWlBwVGRFUDZRV0JSeXhW?=
 =?utf-8?B?RTdWYTlvSWpXcUFZelkwVUFkc2NCWnZhSGlySStvUEk1WmUvTDY0SWhscDNx?=
 =?utf-8?B?eVZkSHFQUVJmeGVzWjg3UHR0Ymdub1V6UE8vd3grWTJrUld6VXl5YStSei96?=
 =?utf-8?B?RzFUdTBDYk9BQ09DL3Z0RHhpNDdIbmFIazJtcjJnSjFlVkdHcThHUjhwZHRQ?=
 =?utf-8?B?QkE0VzlJUWZGVDVaQWdqL2ppenVvMHY1NnN1aFRUTlJpUkEzNE5qUCtqU2Na?=
 =?utf-8?B?by9rK21JdjdCWU9rUmtidTh2Z2tLbTFzQmdaSDJxS0hPOVhxbnJ0YWFsYUhu?=
 =?utf-8?B?a0o5bE1TTFlPTW5hWGlrVlFhMmVYdjVUZEp0dkcwK2g2aElxK0F2K2w4Y1Bn?=
 =?utf-8?B?NlJCL0NmUDJMclRSOS9KblNTYUJTV0ZZaURLLy9VbDA5Q2FQMGZGdGxVVno1?=
 =?utf-8?B?bW9LT013bk15NkxHaFRuQ3JheVlndkFoSXJZK1dyOHVUZkZVTjFWR0FJbzBy?=
 =?utf-8?B?S3dSQzR2cTVKc3ZwRmc0Z05kbjZEZXVTNW5HZFdrZGhuRmFaMXZjQjZNYllz?=
 =?utf-8?B?NyswTVVUMzJhWm1PUEZHdjJ6VGJ5SmZxMEdxdnNYREhERDVCQVdUOU1VU0dD?=
 =?utf-8?B?T3ZhRnp3L3B3T0JLUHhLRGhVQU5xMWJrV2hHTXlPdWxTdGVTRUJydUJFQVkv?=
 =?utf-8?B?QThDZC9jK0JQWG1nWlplY21OWkl2V1NiZm9heThHZ2k1OERXVHdBL1lHRlRw?=
 =?utf-8?Q?LF5npQ8JZMk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bllZdXZJVUdpZVIzakR0d1d1Q01ybUJrTkpDQXNvMEhBRG9yR3BoelI3ZjJ0?=
 =?utf-8?B?N0J2Q01FTHBQVkk2QXEzSlg3b0U1RU5XTDdNRGNBYjRwVzE2UFdBSFJndzFj?=
 =?utf-8?B?bnppWTVLaHdyY3hOSVZXRnEzUjJ0b0kyTVByaUViT2N1dFZjb0djODFybmVr?=
 =?utf-8?B?UURjeVcwTjFZc2JtQTNyTzR6eGRtakM5MmUySjBQc3U2Q0ZDTXlGbFhKV29D?=
 =?utf-8?B?ZldnWWV5eGQvUmhTRnpoRlgwZTlmTXRja1krbVhncW02bmQxbnh2Y2RaNEpO?=
 =?utf-8?B?OEdVSHdkYnZ0WlduODRQTXZFRGhTMU5hR1RJdE9uMHhQN1d5U1gwRk5CQlln?=
 =?utf-8?B?OWRzM3g3N0pMbUJ3QkdQR2hyYW52cG9JSGU3YjdTb1ZkVFBxK3dOQWw4TjBv?=
 =?utf-8?B?ZTZXNWZqTXN4STI1NDdDT0FUWmVNMnBac3JzMm9NakVFaDJrdno1bDZpN1Br?=
 =?utf-8?B?eGZHN2pSMmZvRDNZczhVeTc3bTJmOFc5cTk3MWRuUW5XKzdkdm1Zd242MmI5?=
 =?utf-8?B?cjFpd2wxdHZhY2J5K0sveStYTXRWeVNWKzdpbFZhcTM4UHQ4eWJoY3k1ZUpX?=
 =?utf-8?B?cVBKZ1FheEdET2N4Vm1OZ2JLMExnNjlDbU8xb0NyQjNLdk00OGtwY1p2L0U5?=
 =?utf-8?B?cVMyYUx4Z3BxVzJ3TmNWNDhEM1RwZE9GV0ViWnNHalgwQzBMUEJ5bk9YOG9v?=
 =?utf-8?B?d3g2K1Z4cmFYUytWZUpDN2lYVG5SOXJCT0wwdlNjTkVTay9pSnpYVGZmaS80?=
 =?utf-8?B?ZFV4ajBjOVVXNEZSUmk1b2x2MDNzbVVPY05pamphL3FFWnN0MmVQK3YxVUU4?=
 =?utf-8?B?TUY2QnhraWdzVnlpdWE5MWhhRTUvVGlaekhUTjQ1ZTFIZmplcDFKNEtMbFp5?=
 =?utf-8?B?VGpNZDZKbjB0eG1kVGw4OHg3MGZwVng0cGN0WnRPNmdtTFM0ZWlRN3FMV2t0?=
 =?utf-8?B?c2wxcUtnTGV2ZUVHNk1OeGtmRXNLRDFCcFJKYXJkU3BmSjdJRlErTUlnTGNQ?=
 =?utf-8?B?Y2pHMGJROVI1b3FCSis4aE5kZ0Y5QmJxR1B5Q013b3JnNHN2VDlwaTFFN0ZH?=
 =?utf-8?B?bG1UQ1ZpekNnZmpkejN1bndzazVaRWVBbDl6TkN3TGoydTZOMEVoaGFuSTZ0?=
 =?utf-8?B?T0pxVWhmdGc4WEplQVJONy9CV0krQVlVdjZQZEJkRGVWd2M3MDcrUnRPYVdN?=
 =?utf-8?B?cDdhTFFBOGIrOFBPbHdQN0hXUmoyRmNLOFZ6Q2FNZnBCL2FwQ254ODJEbnZh?=
 =?utf-8?B?TytpR1lLV0tSWFJJT3ZPOS9GZjlDYkowb2x2bVBSNkVQS2VWRmJ5NlduMENN?=
 =?utf-8?B?Skk1cFB6QVhKK2h6MmZWcExNNlNjK210Q054Z3BCaXkwT0lZYkErWVdXbjhH?=
 =?utf-8?B?TzNlbFJObmwxOTRpRXh6SDJBOFpmSkhIclRBUk9mUjAwYURJL0lLS0RMSXhX?=
 =?utf-8?B?ZXpZVVN1ZnVpM3dOL1QvZGZVWFh6N09DdThXaEk5MW8xS2U3a3Q5dmNLcy9W?=
 =?utf-8?B?RU56ZU1Pd0l4MENleHRYd3AyNmNvUnJVYXM2ZnV1QURsZFFSdkVDZHdyRVF1?=
 =?utf-8?B?WFRsQlJ5Vm1wL01xUkRRNXhZT2J1N1FvT3p5R0xlY0d1WW0yNm1Xd3RvZm4r?=
 =?utf-8?B?alVXWEpyZXRjQ3d3bFlFRzMxMHVNMFcwSTdsa0pIQWFYMjdPUGdySTdPVHN0?=
 =?utf-8?B?VXhjM1JUQVdwS0g4OTlQbk91NFNyVTU1bnZySHh1TndQRmFRWXBnR1czRElN?=
 =?utf-8?B?eW5QZUViTkVyK1NmOFB2RjRlM2Z2ZkJhQnB0R0c4RXVDcWNjaUxaVVlaV0ho?=
 =?utf-8?B?Z2pRdklBdnFBaDdNczJxZndWMFFKNTBFOGNudTNqNVNwS3d5a0JrTjdNaGxX?=
 =?utf-8?B?Z2ZzUmhBZjF3K0c3MXczbWlsS3FjbEpEZlQyeTRkSWFWWDRDcUdSVE84ZXp6?=
 =?utf-8?B?TC9YNmxBVG1CLzdWYUM0VkRTZURXMUxRTDNpOHpaR1FTR21xdENLc2wydGha?=
 =?utf-8?B?SGp2RVlTYUxaVDVMRDQyWjJQSGw2eFUwd2R1a2FOS3lOWlcrSEhUVWlubVZI?=
 =?utf-8?B?TlRMOVB6RmFycEMvYXBXMkVReWJaV1doMi9EclQ5TURCQWR4UENpU2JuSngv?=
 =?utf-8?B?U2swdXFNUUlkbEZFYUVFRlBqN2w0SGs3K2JYc1Z3dTE2Q2ZmeERxVVo4TkVr?=
 =?utf-8?B?dGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: acced04e-f44a-4342-e80c-08dcce8c60df
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:55:49.6632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sE4J4xH4teQAA5FOvdYOMF76b1JQaeMGNSUIUYpcvWhOVoS5+OJvSWJqeSHUcBQQ6B178//kJb+fQq/zYhfQWjPB5NaETb14tq0zFzFWKEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8319

Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
among which is an amc6821 and other devices that are reachable through
an I2C-mux.

The devices on the mux can be selected by writing the appropriate device
number to an I2C config register (amc6821: reg 0xff)

Implement "tsd,mule" compatible to instantiate the I2C-mux platform device
when probing the amc6821.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 drivers/hwmon/amc6821.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index ec94392fcb65..a3fdbcf01ecd 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -22,6 +22,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of_platform.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -897,7 +898,6 @@ static bool amc6821_volatile_reg(struct device *dev, unsigned int reg)
 static const struct regmap_config amc6821_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
-	.max_register = AMC6821_REG_CONF3,
 	.volatile_reg = amc6821_volatile_reg,
 	.cache_type = REGCACHE_MAPLE,
 };
@@ -924,6 +924,13 @@ static int amc6821_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
+	if (of_device_is_compatible(dev->of_node, "tsd,mule")) {
+		err = devm_of_platform_populate(dev);
+		if (err)
+			return dev_err_probe(dev, err,
+				     "Failed to create sub-devices\n");
+	}
+
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
 							 data, &amc6821_chip_info,
 							 amc6821_groups);
@@ -941,6 +948,9 @@ static const struct of_device_id __maybe_unused amc6821_of_match[] = {
 	{
 		.compatible = "ti,amc6821",
 	},
+	{
+		.compatible = "tsd,mule",
+	},
 	{ }
 };
 

-- 
2.34.1


