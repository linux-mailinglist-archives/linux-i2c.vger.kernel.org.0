Return-Path: <linux-i2c+bounces-5792-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB5295ED21
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 11:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20EE31C218B5
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 09:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F321411F9;
	Mon, 26 Aug 2024 09:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="NM26uKpO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2085.outbound.protection.outlook.com [40.107.117.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445BD29A2;
	Mon, 26 Aug 2024 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724664559; cv=fail; b=l+LE1UyzhtgHuT6yb/gm41sZrJvpEpHoHeSmkSaKHlJceDsr4KKoDISJwPAXiNuh/yWYiRQntNbaNxBQSGFu2NZH6N8kAHJIhQMlOFVN9PeQIU+enKUeu1jRy4PNWUZ032yVifyM2EPJX+L7eZdCIAfPhidW7O8PKxYqSZJeTbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724664559; c=relaxed/simple;
	bh=4hlo8K5+PDhDwsVeBk265EvDugMeyfZLCylCMvTDb3A=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V4ix8WxqinubKhtFd++DP/Ue5ceFvF328fAE/q3lOey4gEq0ONYlU44CcZe4jWkQDkAqgbu8yPF7vc1kqHKtW8s9q6CqBORsGYloKNqSg6WXgybWba01RGKOrlgHCgGoXbv/YRdMOYT/eDbrlP6K2xCdxwVrjL2+JiDAy0umzns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=NM26uKpO; arc=fail smtp.client-ip=40.107.117.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MfRiMlZPcRvaloNCi2n6dEKhh9F2HDBpHHTLCdO1fnoAl0V8QoM87BPXwgY4jBjlr5CF9oXLsjZvAxsaAcsTvEl3koUyvpcqYYGdrWZQl3vxI6LmhW/Gh0yBlAS3uIrdWxikcaVneS9mmHhGF2rjwId00b6+HKe8om2ab3qFscdAF1uyhK0ilja6aqk/nOnr24/KYC4EE9FgvCKsHnzSO+hX45Nsaca66El1I8kzXJaAkkXPWcxjdhfb4J5OMT2Ki9nDOcTW9ImYmDEUbEcGgcaemNlln9jXNWJeSKn6UfjBPO5HUM6mw0TMRtsi2sLhQ8Ba3ORqGF3SD++4/HYkMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hlo8K5+PDhDwsVeBk265EvDugMeyfZLCylCMvTDb3A=;
 b=S0mtaoiRtR253Mm6TNWGKjKbQw4tnsbpCPtmZ2sL92IAUmS19+8SGR3MrT8bsIO/PQL3jcjMGp1VRlGfmqYWeyeeLIoqTw5yu/deUaOQjh9RNLTrgDNbt76o22OJUPiAI++P7zxitZ/reGnvNKOjdopGk5ZPJxSCM39eJOGx4Ho5HZEQCpw5pW0C3d/X1Gv88pG1F/0dL3wtKVkV72HFYYDNMMJN617EO6N34qXpYkAz1IIIMPpagdkjrXPZ5xxBWmKo5fPcW7QPBehhPw97u3S5YYjrxaKkiSyZUQVCPqh8HuW0gcbMAj5hqHyJbGPhhVkbsr9FSgyjUcsyeWqrGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hlo8K5+PDhDwsVeBk265EvDugMeyfZLCylCMvTDb3A=;
 b=NM26uKpOd97q8Lxzt4Mx9zC6LQVn6EyAWiZb1LC3DRBJ7f6qv6K2JPZ5ZbQELsBo38BGVQCYNx+mGwXjLGj36rpr282YNhBSh95y76JVVGjDqhSLGZLvtUjZ4PF66gFEk5S2WbboSHr+oCHPsmjBxZuBY3qz7lSdE6H6Ok+8bdw4dE4DADo35ti6wO9zqEzdGmiIGcMICyntu0iMceHcJROAugwidO43N2yP10Hfrrzq1UQtkR78KnQQ79NVz0OXQA2fwEC8WR3uSWiQI/N7x36ZtEF/wwkjCIMILfwTc870SZGoujg6ie67GzeaHbNC/lm+YEmurbD39wE281LwOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 PUZPR06MB5540.apcprd06.prod.outlook.com (2603:1096:301:ea::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.24; Mon, 26 Aug 2024 09:29:12 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:29:12 +0000
Message-ID: <807c17a2-393e-4c49-afe1-e42c736fdce8@vivo.com>
Date: Mon, 26 Aug 2024 17:29:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] i2c: emev2: drop sclk from struct em_i2c_device
Content-Language: en-US
To: biju.das.jz@bp.renesas.com
References: <20240823035116.21590-1-rongqianfeng@vivo.com>
 <20240823035116.21590-3-rongqianfeng@vivo.com> <ZsxGP6HKQnBuEE7_@ninjato>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Rong Qianfeng <rongqianfeng@vivo.com>, Andi Shyti <andi.shyti@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, opensource.kernel@vivo.com
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <ZsxGP6HKQnBuEE7_@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0072.apcprd02.prod.outlook.com
 (2603:1096:4:54::36) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|PUZPR06MB5540:EE_
X-MS-Office365-Filtering-Correlation-Id: c47ab480-5d67-43d0-77f8-08dcc5b18b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|81742002;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmNpeGdDZnRZaDZjVDR0QmZkN2d3U29XZWJTUDhrZjdiaURKVEdmMHp2N2NW?=
 =?utf-8?B?Z2ZtMEtLNEM2a3RUTzJMZ0t3RW9kMTJzV1ZhN2I0SWhTTi9sQnRTWVVueXJl?=
 =?utf-8?B?OGlkenNoQkFZdytJdWZCMExyZitzbW55MGZHSG1jay9ZNHhsQ3lwN1VscEhw?=
 =?utf-8?B?bWhjcjBkNHVmbzRIK3p6cDd6N2xGUFZXZ3RReHlXVnFnTEFEamhEbFh3VXJ0?=
 =?utf-8?B?VVdqdUFISDVyQUxCNkRQL1JyUWFsMklxb3lsSVZzUjZQVzF4dGJvUnlWMVJh?=
 =?utf-8?B?bHpneC9Va1M5Z2gxOGxBQU9qeHRqM0I3T1gzMzJpY1Bsc2JLYWozQzBhd3VG?=
 =?utf-8?B?R3Z2d2N2M1ZwL0pCZjh2RFV1c2V3aEgvR05FNjZOcWIrWElId1ZqSzRKcWI2?=
 =?utf-8?B?WXlXc1pvaEFyNXpNRUp3cDJ6ZHJnUzlnSi9kc2ZINkFoMUhzc2lYZmlGTWEr?=
 =?utf-8?B?SmlkeDhNeUdTSmdueTNIQUpmeTRrZTFjQWd1WUxDbVdwbHhyZWdyQVgveFNY?=
 =?utf-8?B?NCtzaTlnQWwrRHIxdVdTejRvR2dyaXVRTlFXemdEaXg4amt5dVdEL3JqSUsz?=
 =?utf-8?B?RUIvTmw0MDdBeXVvN1Bmc2JGaWgzb3hWVEJWTS9CU3pHMmJFZUhWd3ZBMENj?=
 =?utf-8?B?eEVaaVFIVlFjanRUTjlsSDFzaHk1UVRtK0UzM0RDMUZ1RDBZSkRuRy9Ra3dF?=
 =?utf-8?B?NU9QS0RkaWh6MVpFS1cxWjh6cnJSanZrTnZlM01IUHE2QWhEYUNjTGd1WTJW?=
 =?utf-8?B?NmFLa3g4VWt5VzNvV0Ywdzh3UWVXSzBTSW50RTJHeTdUclhpVS9WUDV0eXVq?=
 =?utf-8?B?Y01HTzMzNjAzV09zd2lEWi90R1hNRnJNZmc5QjN6SGxXZmRrUlV3TjhMV0hI?=
 =?utf-8?B?MGkxamdQSk1nWXF2TUtQZENBTzFabCtNNzhrd1pQdXFRVkdYS29DWGpVVS85?=
 =?utf-8?B?dDE3bU0wM2pSbDUyVE1CVEVUNDZUaFRhaHhTTGc2Mm5BRytQQ0JTWDhUR3ZN?=
 =?utf-8?B?VjNTVTZmMlRvQnl0OTNCWFliR3pvL3diRFFPQ2ZJWlptbi8rOVU4SWZwRlg5?=
 =?utf-8?B?S0lBTndlUmI1N0lYc29ycXZ2NEFaMDVyZS9oVUNsZlpadFJFbWY1SWVSRWdk?=
 =?utf-8?B?Wk1FbENHMFFtekY5SmN3RjlTYmR3N2lyMXJIRmtsYWpqKzZ1aWJYdTdmNnZY?=
 =?utf-8?B?QjB4MG1JKzE2QXE4VTVQMW1EN0VHNkYrS0k1S1dTcVFpU2FQYjY2Zzk0R1Uy?=
 =?utf-8?B?d2dPNjFvdWVQdTJOZlphL3BXdVJUOFJtNDQ3bFg1VHg0Vzl3MzV2QmI0OVZ3?=
 =?utf-8?B?UzBjMnlCbk1VNzZiNUdWZkoydEhkMjRxU3hLZlJhZ2IrYmJpY2FiU1gzVWpO?=
 =?utf-8?B?MXJqV2RtanJwNDFyR2JvNmhlUWQ4TUpOZjc5QXJVSExwNnd1NWovVVJNVTk5?=
 =?utf-8?B?NCtxc0pwTGhVSGNIbnRLdEFaU3FEOXQ4NXlETWdyam5OZk10RXMrMHVtR3lR?=
 =?utf-8?B?L2V6czdSbjF5eCtDWVlDRkR4Q2svTUVqVHNuaHJNMC9Oam1EcDhzQ0xrUGZ6?=
 =?utf-8?B?UW1jVVBpbnhlRzExWkVDcWplR0dINW1LM2hMc0V3TFIvZlYyUUo0Vk1DQUdv?=
 =?utf-8?B?OFNHM2UwRFZCMDlTeWNuTG9ReGI1emZidE9xM2Fvb1JNcmNNelAxSnl1Nk1y?=
 =?utf-8?B?d3poNHYxcjZPR3hiYlFiTmJ2NzlyUndCRTJLWDV5NWdVYUhVRXRqT2tnYm5s?=
 =?utf-8?B?TTBqNkZ5ZlZjNGgzT0tVZ0xjVitLeWQwSm1aZGdybldoUXp2WjFMcTlHYWxZ?=
 =?utf-8?B?WmNqV3FxaFZ2ZmNGOFIrMHZFVXlmcUhwb2VveUs2bUExa1MvclVIenZneC9T?=
 =?utf-8?B?RnhEOFBRTkZObkoyMHVkS1c0ZmZqd3N6TVdwTk42cE1nRHNUaGdkdkx5eFcw?=
 =?utf-8?Q?8peuJyRZahk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(81742002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFp2ajZTLzRvTnBuRENXMkVZYldJVjZicGdLN3V5RTJxKzUrR3Q3eXpNSmRF?=
 =?utf-8?B?eVNMSm9OWm0ya2FzeFc5SXFiWXN0SWlBdHFHUk5vektNa1lzVTB0THlwb0dv?=
 =?utf-8?B?MkFiNm1jVXF2cUJwV1JsNWFoaXFtS0JDd3RobVRmTFJSZ0ZjR3dILzAzYjBt?=
 =?utf-8?B?Z3doRStoSmMrRGNDVW9VQ2hGY3Q4NGcxNi9aYWs3OFF3YnFmZklaOTdTRzdo?=
 =?utf-8?B?WVJoVEl2eXAzakNWR0g3VlgrNG5LTzFjNHFycCtHQmg2V25JVzFVSnVxTnVL?=
 =?utf-8?B?SitQekZPQVhlTGx4ZDc5MjZlWXg5SUl6dU1qVE9zNS8yRk5EN0tUazN1OFUv?=
 =?utf-8?B?TkJzSG1NTDROVHRRK2ZJUEtOTDFuZmh1WEk0Ty81RXc4aTZrZ0FSUEMrYVBD?=
 =?utf-8?B?bDFYNzJHRWhvNk1mWE5rMHNQMmNBQ05xbVE5K2pWNldxRklETTFwRkRMb1B0?=
 =?utf-8?B?bGFUcTRpY0d0RVZ1ZjVVQzkveHoxeU1vNmwydUJDUmRsTlZMWXRSSVBIVlhq?=
 =?utf-8?B?OGpyb2lxbk1nQjhnRElpR24yREo1MDkzeXVXR1VtbVZDMDlmSkgzb3NJbkxI?=
 =?utf-8?B?b05mYlBiS285RERzLzVkcFAvS0R0WVlzcjNXem9NaHZZZXM0WWV1dlJteG84?=
 =?utf-8?B?YzZDeCs0N01zQmNWNVBxUkFnTVovU1h4SVMrOEpUdFAxd3VCZTQ1ZnJlY1dn?=
 =?utf-8?B?OEV4R0VXRXo2dDNNZllVT0QrdlJuZEg4b1JrSkNqd0MxNFk0YTg3a0EzT2N2?=
 =?utf-8?B?LzQzRUduWlZhNjArTGxHeGNYUVJOM3k0YXJCTU9NTUwxd0hHTm9FcGUxM1Va?=
 =?utf-8?B?M0UwMVpYd0hJbndkZ0dFMW4zeGUzNEwydVJHcWx2UkxQak1uamxpNU1xbUNS?=
 =?utf-8?B?Sld3VDdnN0dpbnFhVFhNU3cwSVVmN1lHNlNlRXBPZlByTTdZWGVaZEhpVW9W?=
 =?utf-8?B?dytnZGJkdFE3aWtuRHVvYyt3aVQ1eng1b2h6VFdDUWs4T3QvYjRyNFRXZk1o?=
 =?utf-8?B?RDZKQ1NSQW52NFJBZ2c2TTgyZGV6SzJrUzlyTWs5dkQxVlB1cWdvQWdRREpD?=
 =?utf-8?B?Vm5VU3YycU1Jb3EyWDNTWDlxdlhUZFFVN0tzZWpiRkNXVGdENjZyQ3VFVEZS?=
 =?utf-8?B?TDQvVDBsY3FoRTNXZjJkbkxWYTdlTFlNSENsMjdEL3N2KzdKRVgzL3Jua3lT?=
 =?utf-8?B?a01RZVZlc1o4dlA2d0JGOCtJNlhHeWw2cmtqZUx4dG1oZDhOdldLQ3J4RGt6?=
 =?utf-8?B?YlMwcWJIdDdHSDF4Nld4NFd3dWJUYnZzMXltOVNRakpQSDVqWkdPanIxS1Z0?=
 =?utf-8?B?b2Ezckp1dmlwdG8yelpXZDJIemVUOE1EeDdsY1pJTDFtcS9oZVVtRkVnNERF?=
 =?utf-8?B?MzlXVTJ3d3BKUGlFQXhwSU1GNUJVRFI3aTBJbUhram1GTWpMelhYV3ZZOUdj?=
 =?utf-8?B?Rmc3dmx0dTFocjczbmxMaHRkN2NLMFc2R2daVmE2SEdXdHIyaXRSMnlDSkdt?=
 =?utf-8?B?MFkxc05ZdzE2ck1wekh6OGo0azhYcXZCcTFiSlI3aEZzVXNBRVd3UTZtbjNN?=
 =?utf-8?B?MTlGYlJqUmt3YXU1VmltQWQ2SDVqT0JKUGJZU0NYYzVnaHlFaDl1dGZhK0da?=
 =?utf-8?B?WksxNzE3WDFVeE94NjJuYks2dHdIdkUxZmd4Z2pFVGF1eXJvajNqbUswM09I?=
 =?utf-8?B?Vi9ua0hpN1NvWExhU2NDMnRnNXQwZXdyVnllK3NBTkZNdmc4OE5rQnlXYVNH?=
 =?utf-8?B?WEtibWZrTjR2VTFYL1hjbVJkS256UFhScWJ5UjA5aHFVQ3Y3WUpSdFozMFlO?=
 =?utf-8?B?VmswV1ViYitMOEpFTG0rRzROSDVlNktkSnBWbnFPUXd1ckVQYU95MGhLc2Zh?=
 =?utf-8?B?eVh4MHUxRnR3Ty9td3JSWXNPM0hiZ0hTRWEydGFWaTNJWlN4LytLYVh3dHBJ?=
 =?utf-8?B?WHAxeEN3cmtoVDdINmhseVA1cmh4WHFCdkRaVUxnYUhVajlZcmpSay91UkxY?=
 =?utf-8?B?RHNLeVhncm0vZVNtdmlkcHk3TFNHNVNUZW9MVHNzMmhEZk80VFZKZ29XWGZt?=
 =?utf-8?B?VzJGeFdHTkdLRC84bnlyUmg5cEpMOXp0NE1Gc21HN1d0c0loeEpkQ3UzenpM?=
 =?utf-8?Q?B+zeHMqalt+iNLttFHjzjMwiL?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c47ab480-5d67-43d0-77f8-08dcc5b18b71
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:29:12.0366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: js4Wbzg+rTMn6UjOIJTxsHqDRMXvjdULIQjvHEldmc33vQTC2DXk3HWd1Xl8xe3nN1nPL/2Q6XTCRaDxqWL0wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5540


在 2024/8/26 17:09, Wolfram Sang 写道:
> On Fri, Aug 23, 2024 at 11:51:14AM +0800, Rong Qianfeng wrote:
>> For no need to save clk pointer, drop sclk from struct em_i2c_device.
>>
>> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Should be folded into patch 1 IMO.
Thanks for taking the time to reply.  Your comments can help me learn more.
I will try to do this in the next version.

---

Best Regards,
Qianfeng

