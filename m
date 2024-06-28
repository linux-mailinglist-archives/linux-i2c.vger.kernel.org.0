Return-Path: <linux-i2c+bounces-4457-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC35F91BB3C
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 11:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B39CB22C19
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 09:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5538D1514F8;
	Fri, 28 Jun 2024 09:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AiK+I53o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2066.outbound.protection.outlook.com [40.107.114.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9478514F98;
	Fri, 28 Jun 2024 09:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719566038; cv=fail; b=bH8xWUxbhZPpOQzAoE5ms/R3MBLMtsManCTII+rfAklD3YU/4IY031wqbPz6L8PTEVQS92jW9ipjQ9MF7mZUeZu4Fsgc2E+KYHg9p43cmQDaQXCGk27MVwzUWXEbMhe6om0BzU4N4Tsw1EVM+W96mEqaW+zDxCmTfNknetSNIVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719566038; c=relaxed/simple;
	bh=mHArk7xJX+WcsUI9mTu3rpcRLkEV9kqpP1k/nqlx7NQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=isqnT0YzpKtg8dQOwroo14tgdYiOegn+mEKrUk3f1gQYbfAHRjk4l6DwFMq5ofRVt34AQgDhJkG61VAgAV9ZZ8BbgrG3QI8TkeyYLTUNSLPE9RuIBWhWm1oe6VVKMxmOH3fkrlpm6Fz4P6xw4Who8Fl41mGDr4KuMRlZzvmeabs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AiK+I53o; arc=fail smtp.client-ip=40.107.114.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6SSVpw9MzYnjHPynIS+N3Nm5PXlUsPqvPigK5PsIuFySFn9yvifIOyxDUsEU2+EWJcg9S/NOjJQHbegBc64PSlvoR2JPwIPnpwVQ1XIf4gir6VYfzdb5eS6BRURR2QPo7IrKdX3iG50tCL77Q/j1VsOjecBuzOsd+X7Losu9m0R6Pmz5ZJPWe5GDrBppz1EmTBnCt7hhcyDxGHVBbL9NQ36SSo5pIap8DNbZ0+Ln9BmHoqLnlglyZ7gx+h/+gSz1OhcEUHxEUuf9PlzrcDjo9KD4qhxwaldQ/+eqSuk3hIi6zBUwXih0wNXOgzpDHsNRBDtQw4dV/U6TeFnPc9I/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHArk7xJX+WcsUI9mTu3rpcRLkEV9kqpP1k/nqlx7NQ=;
 b=UYzODM/NO3z9FcVMRPHvbU4C7igc1QDkyqV1Ge/gKoXmOhEOpzYBXZTbFfIKILtXrDgLSWupLFjHa8kPRdXwPtaQruaQMyDq1SUY2SZMPDvJlENzrYztMMQRLqcdxA03XmR8uZOYZk28YC7UX425nrgXY8bShB2WWO8J3ys6CTWpZt+UvGrFoch5HO9GFoZ9noXiXcyxLbhAB/nAbhf/ZPE5nf1xhH+kk/FlTMNEKjE5u2mW6vlV3bHUJhxZbqBxf4CSPEO/FF2ZsPpeutzWyy2RJcE/nHbs9C2bhoBxtURvpgrt2K6IX+KirjkD/TD/CjTxZKb5AWND1TH94AIJAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHArk7xJX+WcsUI9mTu3rpcRLkEV9kqpP1k/nqlx7NQ=;
 b=AiK+I53owGQ3xcooIWH2BNU+LAgonie6rjd4VReU9ECjEr6wVlwchSiufwW84n/vdfszt/PVFD4KmED/DBB4zF3tn7vob/wyMBSqADA1lC00P35pt0cA/eaDOPK9UWIbpRVuBtZpHFwiOns1IU42cwUYIWJ8AflWgwMwKKctpjI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB5771.jpnprd01.prod.outlook.com (2603:1096:404:8052::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 09:13:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 09:13:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Chris Brandt
	<Chris.Brandt@renesas.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
Thread-Topic: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
Thread-Index:
 AQHaxvl1VmkioavocEOGYVCwgbbtfLHcsPSAgAAbwoCAAAXZcIAAAqEAgAAAkfCAABHXAIAAAKzA
Date: Fri, 28 Jun 2024 09:13:51 +0000
Message-ID:
 <TY3PR01MB113463CE4B73C617D38E4698286D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346EF9A001F68162148B70F86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <6289f329-118f-4970-a525-75c3a48bd28b@tuxon.dev>
 <TY3PR01MB1134603F92C72D9B6C6C3733C86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2f162986-33c5-4d80-958c-4f857adaad20@tuxon.dev>
 <TY3PR01MB11346CA73575CF61B2024F3B386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVRQ-o2ERma2UD0NJ6CgoJv_TaQYua+mS3tZdGziThjDg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVRQ-o2ERma2UD0NJ6CgoJv_TaQYua+mS3tZdGziThjDg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB5771:EE_
x-ms-office365-filtering-correlation-id: 18de2c7a-ea9d-4e16-848a-08dc9752a099
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T2ROeXZPcWR0amsvem9CZzJXMG5ieVNpenNPc0ZuaGNCMWpIcnNXdk1DQndC?=
 =?utf-8?B?dytUdmV1STV1aUh1QVFXTlB4cmZ0VWtuaTlSZFh4dGtRR1cwMGRuWnZ5aHhw?=
 =?utf-8?B?enp2N3R3dE1pN3RKNnBoZUIzYW9MbEJKdXJSRVc4R2dmbVFsSWtJNCtQNVNO?=
 =?utf-8?B?bVkvTXdNRnNkNmpxNWZ6UG9RRTM3UTZCVU9JNFlqWXZQLy9sc3JaRGpMRmxB?=
 =?utf-8?B?MmxRclJ5V0hCVTRKRXVnT3l1dmtRUzZJSkNzNVBoQ1Jkb0RNZzY1K09ObEZz?=
 =?utf-8?B?eHlUOUEzQ2oyUmsveldxNW42c25mRWNLK3MwUjc4MVlyQ0xkZk1yUFBvckF0?=
 =?utf-8?B?azRHRWIwS282UGdJYkFqeHNPcUtMZHZmY0o5NnVDbXl5OHF5a1M0Mm9tUXk0?=
 =?utf-8?B?b2NIbjNCcHE3UUMwQm55bHlJazR6Skp0Z3RLTWtqUWlkNG01VlVCVlZLdThU?=
 =?utf-8?B?WXdZWmdvTjJLaTlnaWwySStycVZtajBiS2ZqQXJCeEhkYXc3cVFzakx3L0Q4?=
 =?utf-8?B?U09WMWFRblhMMUx0Z0NNcldWRmxvZmRsT2Q5YlAzZnd6bmtVYjNxcHhPWi9r?=
 =?utf-8?B?dlFRejE3ZHlNejgrWFJJTFE1KzdhSW85aEQvcnorN0piVnNOT3NEeGY3SXBy?=
 =?utf-8?B?M2kyVUNxUm1yampTMFIzbXU2Qjc4YW01TFNXNWdsWmtOYW1IZDBuTm5mM0JW?=
 =?utf-8?B?WkJHRjh1TFlrWWoxdjdqMWl2aVNNN2s1d282OC9DaWRzZ1MxZ0cwQWRaZ2pi?=
 =?utf-8?B?T1A5YWQzbGhoNS9rU3lTWnpjc3dwRjIvYjZnZjI4bHhXdER0bmJ6Mk1tdWNL?=
 =?utf-8?B?WWpjRy96d0J2N2xzRUV2VU5uWGVKSVozNHZVNnRwNm4wOUdWdEsxaVo2NFlT?=
 =?utf-8?B?cXhpczNkTDdSK1E3Q2tWZ3U0YkphQWpvL0RhVk9iUVZ6eU9leEhkSGxkRCt2?=
 =?utf-8?B?QmFxcDZPZmt2c09lZVZwVjY1bW81VFJxRkZiOHdlTFBrRWNCWWl0M1o5TXl1?=
 =?utf-8?B?NGJkbVdMVCtsQUkvVmVEU3ZaOVVpb3lkdDJMNWUxdWpmRkdGenp4em8rRVV2?=
 =?utf-8?B?RUowbjBFOE91VXpWUUl4YmhNTFF6UlkrMFB5ajJIeldYTTJGRllBdjNoYTlW?=
 =?utf-8?B?RkxqbTZraEk2UURoZURiK2s1M1MwRG9hbDNUczh4ZC9tS2ZrcmJuN2NveW9v?=
 =?utf-8?B?Q21TWTk5eHNHQzZhd0d2bDhQMVNkS1luM1BKcnNRaTljcmR5UGk3REZYUDlt?=
 =?utf-8?B?dzNMMVJVSkRhdjh0MWt1d1lvTkpPOHl0bFJ2Wnd3RXY0NmgrWjh4UTB2Mndx?=
 =?utf-8?B?WUFIYjlYR0xmRWtaYXAwekM4NGdSd1luaStLbzY2QkRybVp1OXAxZFVLSjBW?=
 =?utf-8?B?WEhQcGZ4TGFJYUtmaWpnVWw3UlpJUGdBdDN1TjJpZ0ZSa01EWC9xcjFEQlAr?=
 =?utf-8?B?cmZPVGl6N0hra0NIaUliKzNEZHdpMmsvdWRWMENIUWl4MjN2UkxpbFFRWEhl?=
 =?utf-8?B?RTM5Zzd2YTIxa1lzMkdSVGNxcUxwYURJL1pkanpSeDRGQ2RCUWdKMEZGbGRw?=
 =?utf-8?B?aVJDYWg0bFVBaWs2YUZTcnFNOTlIb2thcWtkYWRDOW9DZmRRS1R5SmY2djFN?=
 =?utf-8?B?Tk1zNXZTLzVxSGtHTjdwT2cxRGpBa0trZ3BQV3lacGVvaFB0VzlERWk5a2FD?=
 =?utf-8?B?cDBLR0pyd0YyRmVuenVEeU02Y01iK2NTZi9vVFlXa3V0UjR2b3VZTVc4T3FU?=
 =?utf-8?B?Znpoc0RqUkpxQzlMTllSOFRLTFE4RktUQkRKc29zN0dNY2RzdURSUVJ3cHpr?=
 =?utf-8?B?b0N3YXY0cGdtclFOS0I0MkxDZksxWVBFQUNGc28xbVprVTdOTkRJZTRUUkM1?=
 =?utf-8?B?YnBjN2hHclBzejBZaDJ6WWNTZ2FJTFRyV0NnTUtMQWk5S3c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q3ZVKzZlR0ZWRk11M3lQNXpqcThVQ1hZRjlhRVN5SDBxKytPOVRIQXk2RlNk?=
 =?utf-8?B?NHVJdmVNS0RmME1vZGVNcnlkSjdkR0pXWWZKOFJDOGlSb3pGY0VPRTJ2M24v?=
 =?utf-8?B?MmNNUUpzM2t4WUZoMk5JNS9wTzhyYTM0TmhZS0J5b2hzcHRsV3RyRVJ0b0RL?=
 =?utf-8?B?dHRyWkN4cEg2cnMvemlMZVVhOGlVUkFFKy9iWEhQQjA2dzhCdnpYaHB1Y2I0?=
 =?utf-8?B?Rkl6WEJyOG9ZbjFBWHVTSC9pbHdkd1R5Z2cyWk9BMXFxY3lDZElqbWVxV3hl?=
 =?utf-8?B?TVkxK0RzZHJwMG0vYnNHWXdPRHZWdjliNUF0VmkyVmltSW5mV01seXVYeXh4?=
 =?utf-8?B?ZFRvODZGQStkMDAwMEo3N2lKR2cvQUI0WURONVBDQ3IvRG04SGtVZmNKMGdt?=
 =?utf-8?B?U2R1SlVscDZZUGE2aHRHUnVkOXF3QzY3Z1lpeTV1TWJxK3pkWFpNNmFRa1Rx?=
 =?utf-8?B?OXlxc0JzYi80SCs5dW9qbjB1TDZzbUgzMndCZDBuU3dhR28waldTaVdUOEk5?=
 =?utf-8?B?c3JuY1NyUEc3UVZpbGgzTnl3WWJHa3g4RmVSM0lVUUpFTW1ncjBtaSswUDV3?=
 =?utf-8?B?NVEraHh4S2ZPbzhudW1lVHB5eDdSMnFHdW9GaFNHdGFBZVRDUGF5c3dLdVdB?=
 =?utf-8?B?a3VHNTErVTM4dDRYeXd0b0lxVHRVVmlZOWVlVU81bTlLWkxLSHBxU1Y5UU5Z?=
 =?utf-8?B?aVdVc2g2TFZZV3daSmlpVVFQNkhnVUpYRmpydkxFcGx5cDlWRUp5WUlBbHpJ?=
 =?utf-8?B?dDNpcFVieFhjaWJDWEZMdHc1Sk8rbWt6QStYY25TcXlxQlFDb2t3SWVKVXRB?=
 =?utf-8?B?WnVOQ0hGSUQxWXVRbWtxSFh5aERkNXlVdHpXcG1GOEZUS1N1Tkw1cTd2aDZu?=
 =?utf-8?B?NG9kSGpDL1NkN0Zuc0ZlMUVhMldpcjhwS3ZKNGpyaTZOU3pHQ3lkbnRrdTFm?=
 =?utf-8?B?djNGbE5sUjA1dTNndWhXd3dIbVBjRVlOZlUvc1diTWdYMlFMdG5GN0EzQ2Fh?=
 =?utf-8?B?ZzNNTTZoRS9vOE9abmNqd2YvbUVKOHAraWFzODdjeEtiMUg2U0JpNlR6aDAv?=
 =?utf-8?B?Qk84a2o4ZlN1d0hPTmo0Q2FoQlRJL1VPd3dkWDN5bVJaOCt1dUVkSEJqOFpO?=
 =?utf-8?B?VDZPM1plNG95eTdBakZoT0EvSFo5b1FJZENzS2pMeTFVTEpHYkRMcElJaVM1?=
 =?utf-8?B?QzJtaDN3U1dEN1RtMGtyS1FaOXd1Z09Jb1NpV1d4K2FDbmZrdGlnNmpod3h1?=
 =?utf-8?B?YWhnREhmcUJoWGhvUzNIbXNzTmRNTE45eURjQWlvT0RtSlRicXliakhrRGlT?=
 =?utf-8?B?c2NGUXg0UUprUTErTDlNMWJiKzRrWGRIbVlRR0E1aXlKSTZTQ1I3RGsvRzJr?=
 =?utf-8?B?T1h2YjNXclhHNzdUendCVHNXUURuUk1peGZsdThJZ3plRUFVbnBVYjBKQXI0?=
 =?utf-8?B?dm02Snlwd0ZFK3IvendXTVlMUVk0MXJlWWJCMHhUeTFrclFTRk9Dbk9hdThF?=
 =?utf-8?B?ZGtzQ0xiSm1JU2tvT2ljVURnMGxvejRhVlFoaE1YSC84ckNhdGtSWTVFT0li?=
 =?utf-8?B?dWFvaWRES3RKL3ZFSUhzRVdERlNUajZESkVrWFRhQW9yUXVMR290bmpFamRn?=
 =?utf-8?B?YTJITWlRRC8wL2hLbE85NmtzV2ZES0tTb3hqdUpwcXZkZEJZUExNT3JpZjBO?=
 =?utf-8?B?bmtpRUFJNXJaL1FIYnc5ME1aNE1YRnRIblRRR2t5UVhHblp5RXdLSUdyaTI0?=
 =?utf-8?B?Szl0bmV0aCtjRmttekxLUDJzdEMzYXRvbmV5OHJpbm9QdlV5RW8waTdVQlNB?=
 =?utf-8?B?R3ZIQzVaWUhLSW4yOW56cXJENmZjUjkycTJkRzJ6NHBlWWt3ZTJHT3lNZHVa?=
 =?utf-8?B?SmovdEV3RTk3clkxNFBHMEFmZmY2M3dQRHBJZy9xekN1ODBHTGFjeXdIZWNY?=
 =?utf-8?B?dituMjhqZVRQaUdnU2VhYkdNalZEWjNtMnF6cFhORTB1dTcvdExmY1FMeVdH?=
 =?utf-8?B?SURjbUxaSXpwNmNUNVV6MnQ0OFJYWWVRazc4UVR6VzN1eHMzZklrVnJXeXE1?=
 =?utf-8?B?ZkdRSmZzRHpQMnd6OE12MkhSTTNCZWFFbGJ0U1g1RUw2ZlpYWXFmS2ZGajJF?=
 =?utf-8?Q?9tfthimBNP0JGHHfzPXwzJPPX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18de2c7a-ea9d-4e16-848a-08dc9752a099
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 09:13:51.7092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Du+EfeJgEmR0DsJmDqWKyyXdaIwxrZbkx0hZ7TGRJy4CUNVGeMkw/B+0cd2QOjFLPtRFfmoN9rOC7L4wzi+URSxdRoHM0GkM8YVmcR82QHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5771

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogRnJpZGF5LCBKdW5l
IDI4LCAyMDI0IDEwOjA5IEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDcvMTJdIGkyYzog
cmlpYzogRGVmaW5lIGluZGl2aWR1YWwgYXJyYXlzIHRvIGRlc2NyaWJlIHRoZSByZWdpc3RlciBv
ZmZzZXRzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCBKdW4gMjgsIDIwMjQgYXQgMTA6
MDnigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IGNsYXVkaXUgYmV6bmVh
IDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+IE9uIDI4LjA2LjIwMjQgMTA6NTUsDQo+ID4gPiBC
aWp1IERhcyB3cm90ZToNCj4gPiA+ID4gQXJlIHdlIHN1cmUgUlovQSBkb2VzIG5vdCBzdXBwb3J0
IGZhc3QgbW9kZSBwbHVzPw0KPiA+ID4NCj4gPiA+IEZyb20gY29tbWl0IGRlc2NyaXB0aW9uIG9m
IHBhdGNoIDA5LzEyOg0KPiA+ID4NCj4gPiA+IEZhc3QgbW9kZSBwbHVzIGlzIGF2YWlsYWJsZSBv
biBtb3N0IG9mIHRoZSBJUCB2YXJpYW50cyB0aGF0IFJJSUMNCj4gPiA+IGRyaXZlciBpcyB3b3Jr
aW5nIHdpdGguIFRoZSBleGNlcHRpb24gaXMgKGFjY29yZGluZyB0byBIVyBtYW51YWxzIG9mIHRo
ZSBTb0NzIHdoZXJlIHRoaXMgSVAgaXMNCj4gYXZhaWxhYmxlKSB0aGUgUmVuZXNhcyBSWi9BMUgu
DQo+ID4gPiBGb3IgdGhpcywgcGF0Y2ggaW50cm9kdWNlcyB0aGUgc3RydWN0IHJpaWNfb2ZfZGF0
YTo6ZmFzdF9tb2RlX3BsdXMuDQo+ID4gPg0KPiA+ID4gSSBjaGVja2VkIHRoZSBtYW51YWxzIG9m
IGFsbCB0aGUgU29DcyB3aGVyZSB0aGlzIGRyaXZlciBpcyB1c2VkLg0KPiA+ID4NCj4gPiA+IEkg
aGF2ZW4ndCBjaGVja2VkIHRoZSBIL1cgbWFudWFsPw0KPiA+ID4NCj4gPiA+IE9uIHRoZSBtYW51
YWwgSSd2ZSBkb3dubG9hZGVkIGZyb20gUmVuZXNhcyB3ZWIgc2l0ZSB0aGUgRk1QRSBiaXQgb2YN
Cj4gPiA+IFJJSUNuRkVSIGlzIG5vdCBhdmFpbGFibGUgb24gUlovQTFILg0KPiA+DQo+ID4gSSBq
dXN0IGZvdW5kIFJaL0EyTSBtYW51YWwsIGl0IHN1cHBvcnRzIEZNUCBhbmQgcmVnaXN0ZXIgbGF5
b3V0IGxvb2tzIHNpbWlsYXIgdG8gUlovRzJMLg0KPiA+IFdvbGZyYW0gdGVzdGVkIGl0IHdpdGgg
cjdzNzIxMDAgZ2VubWFpIGJvYXJkIGFjZXNzaW5nIGFuIGVlcHJvbS4gTm90IHN1cmUgaXMgaXQg
UlovQTEgb3IgUlovQTI/DQo+IA0KPiBHZW5tYWkgaXMgUlovQTFIIChyN3M3MjEwMCkuDQoNClRo
YW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uLiBTbyBSWi9BMSBpcyB0aGUgb2RkIG9uZSwgd2hpY2gg
ZG9lcyBub3QgaGF2ZSBGTVAgY2FwYWJpbGl0eSwNCndoaWxlIG90aGVycyBoYXZlLiANCg0KQ2hl
ZXJzLA0KQmlqdQ0K

