Return-Path: <linux-i2c+bounces-4957-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B01A792F669
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 09:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 294681F22DE9
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 07:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A0113DDBD;
	Fri, 12 Jul 2024 07:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ROSzGdWb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010069.outbound.protection.outlook.com [52.101.229.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C94A18E0E;
	Fri, 12 Jul 2024 07:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720770318; cv=fail; b=rlhRALjksh50s41uIfOmyNt5NyW6EHzIywwaRpAzdIGaoBjYYgAGRNk6gwHQJpXFZM5VPos7ot7XpVb6czwSrrVlGNhIOyy96QDb6647vg1fZ+WJCLO55FO3R+odu23IRD4seLBZx3+OP+Es2Ei4U287TN15Ut5k8BdVvFD43wU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720770318; c=relaxed/simple;
	bh=cAraJq0ptg4z7Bv0KWJA4/2VKkT+yBX0GHXAvR9ErSI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=prMwk6l/wgu7BtbF9lKNaUpq5C36Xkyt59Ya17OjdPY0creOAnIO4wiUO/hh4fLM7BoTwB2gHH5HKBCFpYkY1WgmEQ81K4Gw7dGEh03Alv75RqIAvE7n+zZeiawUzkJP5c8cizu7UL6T78OUzDeZQn82dF9BzHZqbl+2ewzdnzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ROSzGdWb; arc=fail smtp.client-ip=52.101.229.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqJSFYelasJ9rnXgw9LCcGeiN9A7B9EkyVxOuvAaYeVggrHoAxgNJu+TPxJc2TV+ag1KaR353nMqjyGk8trFHDwS3kbXK9qME7UzW+0xDh0gvFTW4eOHGFTMEimsBkDlPU6lJ9VLAmx+zRhcFP0TINfqTvJ2Kd+xaHXtPY8/9twtKHrGmp2YW+mrzVLQDRjejpzyUlWmgUhI5m2Zxq7Z3KWoPl3QyB89B9rXxBYBmcNCsIRIz68SX+ihoJ0A3hqLIrfpJeBpD59F1NfnSKkHkQOUsYRcjBmRyXw3PjGRYusrzBvxQgY9RlVUf0jeDimCzztJ+lYLiXXdEwBW9jJ6ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAraJq0ptg4z7Bv0KWJA4/2VKkT+yBX0GHXAvR9ErSI=;
 b=MsGZapcg9On4iWATiPUK+baMzFIMGfcMXY/vrfvRU5v34vF41bV2WeK0mr1U0x0gBOYs3XKAdahjVpeXhQKwlvKdwANRZuAUPFAYjR8tZJah3drpQz6zA4138d3qEJ+eVvqC3HfSiUbOP+oD1M0WE0N0CQzx7VZ4XmK+edbkqPjhW0M8sBRk0aFLWpKZ2MZ2jFRe+9T6Y0CxcJJcYkoMuwjvsVb9xEsLnR8ENMsf+TVVT3wp40oXwOJxZyoUPOPX/R0n6jh9A3Vg8YIB+iocqLCDs9X0qTSNio+200Vnk5Ujie5eOiPjXnbMa3mp1Swgf73yOcFXWmvOe6Oxh4Iqog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAraJq0ptg4z7Bv0KWJA4/2VKkT+yBX0GHXAvR9ErSI=;
 b=ROSzGdWbtnh0XlJbbTerPkXGTx0SwtEKMQrWcGLkOCDrrKXu8fer8g0mMyayun88hsvgFOshaDlgNv5ZKfYI2Y67huJW5af39ErQcOjg+7B1bd/hlHpjO8xPCD816O7usK4QlmYpe+K6XC4Ug2R9dpkDzfYqNrV+Cai/8cCjxW4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB5658.jpnprd01.prod.outlook.com (2603:1096:404:8052::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 07:45:10 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 07:45:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Chris Brandt
	<Chris.Brandt@renesas.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v3 04/11] i2c: riic: Enable runtime PM autosuspend support
Thread-Topic: [PATCH v3 04/11] i2c: riic: Enable runtime PM autosuspend
 support
Thread-Index: AQHa04j2mz4Dz3PEykickJkh+EMpYrHyrpZQgAAH7gCAAAC8wA==
Date: Fri, 12 Jul 2024 07:45:10 +0000
Message-ID:
 <TY3PR01MB1134611DB941585B340D09B7186A62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711115207.2843133-5-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB1134615117603F62796558D1486A62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <e574e2a6-b231-4737-9501-342445923542@tuxon.dev>
In-Reply-To: <e574e2a6-b231-4737-9501-342445923542@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB5658:EE_
x-ms-office365-filtering-correlation-id: ddf662c4-2a09-4553-77e2-08dca2468e79
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R3A5eEkzSlhFd05sY3dteDJRZUJPTmF1VzErVTFWSlV6MWRmMmhwcGRBb0pB?=
 =?utf-8?B?SWFuYmJMbDEya3VmVit6UUpKWnp4S2p0QW5nRnRpbW5IM3JHZlFZVUtXc1NM?=
 =?utf-8?B?MlFIVDNlOEt6U1oyOU9BMzZYbFRndDVuWTQ0VmJCTnJZNVoyenBKdzFvOFhy?=
 =?utf-8?B?YUVremRUU1VFcmdnZW5RMFBBako1dnU5NTNYOG9vZURsUFFTdW9yd0U0eElJ?=
 =?utf-8?B?T0E1NG1ZVlJQbmUwOWdaaHBQRjVweDJJMUh0RVFBYVhaaVpjYUpKOG85MlNu?=
 =?utf-8?B?RWViNm9SSC9zNWpNRUdGeUNqUDlJcWZLa0ZUL1ZnUHhnc0tQbk45dWI0dnJ6?=
 =?utf-8?B?UjNhVU43VHRBL3M0cHFPT21iQnZWSldsMzZIRVlBbjdQVzNMSi90TGduSitE?=
 =?utf-8?B?eTZwQWZ3SnBkeUVOTWNSUCtTMnE0RHRwWXNHdTFZdXl4RzJSY0h1KzhwMk5Q?=
 =?utf-8?B?M0kvdmN5b1BrOXZvK1duaEhQd2FkUThMbXpmT0h6dzI3VGxQOWUzOUx5anh1?=
 =?utf-8?B?dnROWlZzbFpCdE9VcTJJR3M4TmRQRlNqSW9Tb2hxaitpeUs0bTR5TVJWM3lt?=
 =?utf-8?B?Nklia296Q2dzNWRxaE9GL1ZnajN3TWtVZ2o1aDdyV21QZlZndFZ2VSt5ZWQ5?=
 =?utf-8?B?Z3UvR3Rob2dsNUZzczBIa2ZBN2o1bnIzbndvTXp2WHhXQlJEOHRyUTVabVl6?=
 =?utf-8?B?Y2NZWTc0SWlodWVXSlR0SzFBdng0TGZIZWpjMUhXVUxrOFhmWFcrMEpnUGtn?=
 =?utf-8?B?TUhSR2ExQ3ZTQXVpOVJ6V2JMNzdwRHI2YWJzMDRKRDRZN0hjd3d6UEdFTzlm?=
 =?utf-8?B?b2k0U2IyV2orc3lZemhwcVBpMjEreGVyaFQxYnRhSEU2R2lqalpSN1dJUnVD?=
 =?utf-8?B?dTkzMVVNSGZsNUNOL0VIMUI4MEFHYlhMMmZHTDBvNWx2YzhTeHNJTWUxU2hH?=
 =?utf-8?B?WTZ2a0xhS2hiR1dlWEFzSkttYjcybDBxK0lKcG9JMkRqenhEZ3p2djIxRThV?=
 =?utf-8?B?L3JVZ2lQUUdBNThQTGlYRUJyVG1jazJDZUY2aXdYWVJDd0g4SG5Wb1Vud2sr?=
 =?utf-8?B?aUMzTmlqVGFtR0poeVZibG1UNmlPN0pNcFoxNUhNQThEUmw0ZEZuOExVakVL?=
 =?utf-8?B?UFRtTGtJdHFmRnJTSzB0eEVEVDBxM0RQZFNHR2tiaUtiblhlQ3NhOFNrWHM5?=
 =?utf-8?B?bDNJdzJzaE4vMmx1aUJCNUhxK2NKTFJiWU9aMkpOcXB1Wncycm1sRGV6NWNm?=
 =?utf-8?B?Y0o3WnJiRUd3UWZPRFQzNG5oKzg3dUp0bCthcGI0MWNONWU4alVDQkxnR0RQ?=
 =?utf-8?B?b0Y1ZHBTZS9SY2ZtRGpoTjBqMUREbDJWVkc3bzFSMlQycU02bUV0YTB5ZU4x?=
 =?utf-8?B?UUh4WkRIa1FmYVNseFVsakNUajU0RVJaOTdGSzdhRGsyN2pDWFpJU2M5WVRM?=
 =?utf-8?B?QUVlamoxYklPUHRpcllsN2lrbDZwbUI1OENQelBreHFEeHlUUVdCdlF1WkVV?=
 =?utf-8?B?Qzh2bHh0cUxtM3dBR3BjN0EwSnZ4YU1ERGMrS2IreWxpKzcrY0VmbDJpOXp0?=
 =?utf-8?B?MzJXRjZrYWo5K3ZLbGZQN2w0ZkdWTWZXUHVVOTEzQ05ndXhEeDY3VWx6ekQx?=
 =?utf-8?B?VUVOUkNmb3JaampzbWtuRGtvVGRKdzJzakFEaXMrQmd5UGl3ZlVSQ1pNeEw3?=
 =?utf-8?B?S29MaFRrM2NCL0FCbnlMTjZOVFBjN0hDUWlSZmlYd2o2SkxRWkVNM2IwYWph?=
 =?utf-8?B?dkdHWGVJRHBZSTAxYTcrRnRocUVIYzVIR2NYYzVyOWVzRnV0eXZocVQrMlJZ?=
 =?utf-8?B?aHRaL3FaYXFsc0NjOUxRY0k3aERNTDE0UHB6dDNOdno5VGRKYWJGWFVhUW1W?=
 =?utf-8?B?RW9aUnhUMFc4QzJYK1ViQkNkcE5xenJDK2lHMTB0b29hb012Q0JqT0ZXTUFX?=
 =?utf-8?Q?0JUf5L6K4qI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TmJsRmxGRHBjKzN2L2ZhUE55Y1FOUkJQV2p1S0hVSk82b1d4a29WRTlVdVl2?=
 =?utf-8?B?TUJjU0ZUSXhLMWdSWC8wcFBQMTV3enF5blU1amduUVVwUnhTQjREcnJzUkF4?=
 =?utf-8?B?MXRiSHJTMHpIN05uV2xZY3VCS2Z5cHBtclFlcG8rMGJ0MjA1OGJNT0xOMHll?=
 =?utf-8?B?UUR3TXFUV2JhS3ZTWFJRT2ZCTHR3L1RQaDlQS2IvNnVMRjdIclRON0NONEtF?=
 =?utf-8?B?NkJFL05nOGtXVkJ1czYxOTRHc2VLZFBxa1U3YjZvdGNJa2N2SUczVXZQY1U3?=
 =?utf-8?B?eVRFZ1FHbXgwd0YzenZjMERTV2N6MTJSWU1BQU1Ma1Y3eEZZYTZxN0FYS3RQ?=
 =?utf-8?B?Tit1NjR0YnIwNWtDT2FzM1JYRHkwOXREaE45S2o5QmwySmhSKzdTbWVYZENY?=
 =?utf-8?B?N1o5aUp2bnRWSVNoc0c5NENsT1IzZFVjVEc3V1FGRmIyU2tJcElkZTF2QVR2?=
 =?utf-8?B?TGlrVTFVUWZYeEZZL1ViL2o1YTlMajN1Smxibm9kdlVucWxqSVZnSzgwMFVB?=
 =?utf-8?B?U0l6eWwvVXNURFMrRDIrVW10WXN4SXBKdFZsMFRsNzd1c2Fkb29wNjQ1Nkgy?=
 =?utf-8?B?dG8vK0RUZkdQeGxsd0plb3czQnZmY01sQS9IMG9pekpUWmhlT3pQTGd3SlNz?=
 =?utf-8?B?UEU3RFN5TjhlZFVpdGttMStvNWNpb0ZLUFd2dzAxRDhkeFVQZ2F3cEVKbStH?=
 =?utf-8?B?blhEV1dTQytPaVAwbnR6VlJnYlhpYklmL2p0Njc5citJL1BXVjIxNGNjRVlk?=
 =?utf-8?B?L3J6eCsySDNVcXcxZitJNEpncXRWeWFRYUJwdXlrdWcwdVArUkJRUVRaNFpj?=
 =?utf-8?B?dVBWTVNMRVFEVkRkc1FsK24zYXIzdE1iN2w0TzFSRHJiZzdnQVZ4cEVJN2di?=
 =?utf-8?B?aG9rZW5sMjZvWVkxWEw4QS91R2N6V3JTTlFhNEZ3NXV4MTlKRUFBalJvWkNy?=
 =?utf-8?B?NmZwZGdCUnVGeWMwcDRIeHFIcERKV2VOUS9kczJRaG0zSWI1Tm1tMTQ1c05L?=
 =?utf-8?B?L2xlWWNSYXlXcFZEY1RsNG96eHJubjF1Wm1GSTNDOGthekIxcE8zM0hMeTA3?=
 =?utf-8?B?TjNtck1hcTJ5MzVNV0tsbWFFc3FrZi93aWtjK2pzQ1NTTkxDUXJXODFsVnM0?=
 =?utf-8?B?c0VvUTZ6dDlFRllidlBTTEhkSTUrSmlCUFVKamNjS0NKa3V5NEhXb2hLM2I0?=
 =?utf-8?B?eFpmdkJUeVptcjhCOU1GNmVielNTK0FtbXh3cm9uSTJvTE5YbS9lMlBmbnJU?=
 =?utf-8?B?dzZpVmpzN0dEelhSeGt2eUVHV1owaHgrNDJjNDA2bmJ1SmVUenFIZUNzcUhz?=
 =?utf-8?B?U0phMmRFYWVrTTZGelFaNll4S085eitmWVRqZmdBZ25qWW1SNStsUEVoVmlx?=
 =?utf-8?B?SG5ROWtiR21xKzNyZmhSQXVic1dqWWZJL2YvUm9LZWZJQ24waHhJc2FBZVla?=
 =?utf-8?B?SE0wSE1lSE5DSVlDaitGazFhL000QUpQeUtxVEk1bzlYVS9mVXF6U2YycjhF?=
 =?utf-8?B?eTBIUWZaczZiOVVwUTQ4YTVyQ2FNOVo4aDFlK3N6NlltTExNZ0Jhak9GeUJL?=
 =?utf-8?B?enNvdTQzMFgvd1Z5ckJjell5QUtXcmxnL1ZGSUdyZkk4KzNMQmdYL2JlU1R0?=
 =?utf-8?B?TlZnTXVCOXBPeHg0Q1NFdEJpK05tYlBDcFZ1V3k2NXhycDBYSWNmWU5zNmtP?=
 =?utf-8?B?UlgzZ0hyczEyL21QR1pmRTZxZW5hb2NPcG90aFJkMngwQ0lXSVMzVVRONWpI?=
 =?utf-8?B?czNXM1p2UHdpRW5BWWd5b1RQQXQxWktWRGV6S29uK0lGZGNZRmJTd3owWnlV?=
 =?utf-8?B?VDc5MExUYzFidzJOZXQwZUNzaU5rMnRUbFQ1dWVPN0lkTWxQTnFIVnBYTzU5?=
 =?utf-8?B?aGxxNlk5YlNKZ2FkcnI0dS9odUdoaFNKbys3Vm54SE5lRGcyeGxnbmcrMlJs?=
 =?utf-8?B?RXZjYm9nUE5nUUowWG1zWlhWM05HRE1IdDVpdlV2ZWZXNmxpNXZUNjdWZGtF?=
 =?utf-8?B?Uko2SGhNbEI1V0xlZy9vclpHYjMyRHNRK0FlY1Z0R2l4T1NNUGV0YnRFdHcw?=
 =?utf-8?B?TTFWc05CMk8wYWV1cG1xeTgwcWI5akNISTBISGFJdENTcVk4ZW1VSEg0OXcw?=
 =?utf-8?B?bndvTm1xQmo4R1MzRkJuNWJsZzREbGVmUlg3ZStEOUg4RDJyK2UyRGlFODFm?=
 =?utf-8?B?YlE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf662c4-2a09-4553-77e2-08dca2468e79
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 07:45:10.1215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eETvNg6UU3GoXU1qC65JajHo0z14wfENeVq0e/wXpdGsipDjcihmQKF/4a5vbTCX8WxbCgRJLrlWU0NcOQXXyZ7qF1rBhNjpHPfUk0uMYCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5658

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiBGcmlkYXksIEp1
bHkgMTIsIDIwMjQgODo0MSBBTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDA0LzExXSBpMmM6
IHJpaWM6IEVuYWJsZSBydW50aW1lIFBNIGF1dG9zdXNwZW5kIHN1cHBvcnQNCj4gDQo+IEhpLCBC
aWp1LA0KPiANCj4gT24gMTIuMDcuMjAyNCAxMDoxNSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkg
Q2xhdWRpdSwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9t
OiBDbGF1ZGl1IDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+IFNlbnQ6IFRodXJzZGF5
LCBKdWx5IDExLCAyMDI0IDEyOjUyIFBNDQo+ID4+IFN1YmplY3Q6IFtQQVRDSCB2MyAwNC8xMV0g
aTJjOiByaWljOiBFbmFibGUgcnVudGltZSBQTSBhdXRvc3VzcGVuZA0KPiA+PiBzdXBwb3J0DQo+
ID4+DQo+ID4+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5l
c2FzLmNvbT4NCj4gPj4NCj4gPj4gRW5hYmxlIHJ1bnRpbWUgUE0gYXV0b3N1c3BlbmQgc3VwcG9y
dCBmb3IgdGhlIFJJSUMgZHJpdmVyLiBXaXRoIHRoaXMsDQo+ID4+IGluIGNhc2UgdGhlcmUgYXJl
IGNvbnNlY3V0aXZlIHhmZXIgcmVxdWVzdHMgdGhlIGRldmljZSB3b3VsZG4ndCBiZQ0KPiA+PiBy
dW50aW1lIGVuYWJsZWQvZGlzYWJsZWQgYWZ0ZXIgZWFjaCBjb25zZWN1dGl2ZSB4ZmVyIGJ1dCBh
ZnRlciB0aGUNCj4gPj4gdGhlIGRlbGF5IGNvbmZpZ3VyZWQgYnkgdXNlci4gV2l0aCB0aGlzLCB3
ZSBjYW4gYXZvaWQgdG91Y2hpbmcNCj4gPj4gaGFyZHdhcmUgcmVnaXN0ZXJzIGludm9sdmVkIGlu
IHJ1bnRpbWUgUE0gc3VzcGVuZC9yZXN1bWUgc2F2aW5nIGluIHRoaXMgd2F5IHNvbWUgY3ljbGVz
LiBUaGUNCj4gZGVmYXVsdCBjaG9zZW4gYXV0b3N1c3BlbmQgZGVsYXkgaXMgemVybyB0byBrZWVw
IHRoZSBwcmV2aW91cyBkcml2ZXIgYmVoYXZpb3IuDQo+ID4NCj4gPiBPbiB0aGUgb3RoZXIgaGFu
ZCwgeW91IGFyZSBzYXZpbmcgcG93ZXIuIEN1cnJlbnRseSB0aGUgZHJpdmVyIGlzDQo+ID4gaGln
aGx5IG9wdGltaXplZCBmb3IgUG93ZXIgdXNhZ2UuDQo+ID4NCj4gPiBCZWZvcmUgdHJhbnNmZXIg
dHVybiBvbiB0aGUgY2xvY2sNCj4gPiBBZnRlciB0cmFuc2ZlciB0dXJuIG9mZiB0aGUgY2xvY2ss
IHRoaXMgaXMgdGhlIG9wdGltYWwgcG93ZXIgdXNhZ2UgY29ycmVzcG9uZCB0byBzdXNwZW5kIGRl
bGF5Lg0KPiA+DQo+ID4gQnkgYWRkaW5nIHN1c3BlbmQgZGVsYXksIHlvdSBhcmUgY29uc3VtaW5n
IHBvd2VyIGNvcnJlc3BvbmRpbmcgdG8gdGhhdA0KPiA+IGRlbGF5Lg0KPiANCj4gVGhlIGRlZmF1
bHQgZGVsYXkgaXMgemVybywgc2VlIHRoZSBmb2xsb3dpbmcgZGlmZiBpbiB0aGlzIHBhdGNoOg0K
PiANCj4gQEAgLTQ3OSw2ICs0ODEsOCBAQCBzdGF0aWMgaW50IHJpaWNfaTJjX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+IA0KPiAgCWkyY19wYXJzZV9md190aW1pbmdzKGRl
diwgJmkyY190LCB0cnVlKTsNCj4gDQo+ICsJcG1fcnVudGltZV9zZXRfYXV0b3N1c3BlbmRfZGVs
YXkoZGV2LCAwKTsNCg0KSSBqdXN0IHByb3ZpZGVkIGp1c3RpZmljYXRpb24sIHdoeSB5b3UgYWRk
ZXMgMCAgbXNlYyBoZXJlLCBjb21wYXJlZCB0byB4eCBtc2VjDQppbiB0aGUgb3JpZ2luYWwgaW50
ZXJuYWwgdmVyc2lvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0K

