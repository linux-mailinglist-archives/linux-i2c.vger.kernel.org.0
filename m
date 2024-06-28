Return-Path: <linux-i2c+bounces-4447-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C151991B981
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 10:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7642E2831CA
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 08:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4711459EF;
	Fri, 28 Jun 2024 08:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ESjQJk2Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010048.outbound.protection.outlook.com [52.101.229.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1C5145324;
	Fri, 28 Jun 2024 08:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719562176; cv=fail; b=ceMBlHl8leDjSAciLFe2nTi6AWG1+NCUbVANlk76fYHQMy+v25XHle0MoELa0jOaSDZR0XHzl3bAgDftwLnUgcmVe2sBJW0hXN8rzK8L/Bs5CB5f1fgCxVDMGkzPv4Gs7E3RETxERxME5rk1zXwRGJSzdaeWmj2R3yealfH02U8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719562176; c=relaxed/simple;
	bh=Qo7iWWQ7TwyifuUZqkLqeSKrTHf68dneb7LxGBz+bT8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CC+TO3bkO/y5ZhsRN/LxaSlBBz0I9r9lgCYSV9nQtDFcASn7zQ2Oo2kYvIBWLUOD02Vnf63k147H1UCSxoEM6DSRj6+hHnNyQVijMh588dAOSHjcBOlvhOUkBWAbEcNBKaUDrLkc9NOBt4N+uhi0qoVT5cfrlojf/RQu5yRt5AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ESjQJk2Q; arc=fail smtp.client-ip=52.101.229.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnfwQllQsEqxOkpvF+sawqWPr90suwGaNeetAJlxx9c+n38kiKkSlH1oF8gf95kj6heAct4dfW3599VcjqgJKUyrG+ypjVMRpCpOjYzC1dnY7mPzBq4G0JZ5n7xq4h8W87QNCQZQbZOgqL7HP424NUXU2lRbMcPPhEXWXjtiyeS6fXIow/g2O64NSIrCRi94Qx1MVG6YMMlcLfxiEurQx2Lb2YrLAsagBgZf5Vg5od+1orfbIttKNUAEONMwqexTlnGaNqFfLipB65ikLHbdwvD0s8lRYpAoyg42Fu/7sqMYsFyo8I1nC6R5W1QFaKvB6/urv0Yq9/BlcM1f/Oxxxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qo7iWWQ7TwyifuUZqkLqeSKrTHf68dneb7LxGBz+bT8=;
 b=Z1DZZ5kkj2PWsEMc7qspYsbc2v928YXXk2ghTQ3dSzx4mQRjgTB7PSbLDk7IZBGUSPPjbf8MNNqCpagDCU3S0qlEXKyoIXFh6AkPuk9QFS6uwqCdCSAnNtBne43V4e1LYlLnlSjzHVbWt50pXKeuunRKlxfddQXVz865CtytzdAzE5YZJCECvUQrnus/rDHcYqMxYsI/2E9OJ003bpFTm9xcfdG2TkroLVxDRiwBDPiBtGUZJPzcerNy35D28C3LtX0HXsM+VVFoTu49b936nBlaQvufS/bqEca+of7eRBRFtBnTLBA0z+mP360ul1owxEgERHE+jwtb6RQqRaEyhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qo7iWWQ7TwyifuUZqkLqeSKrTHf68dneb7LxGBz+bT8=;
 b=ESjQJk2Q3qNkCKW9HtJkm3zAaSRsHeVdOHfdKas4gyVnpVwFRpizs7MOqiVq/HOhBOKN9sLbAPdrZUIY5xR4d7ZdeLVG4AvOZDNhtmSThNs+MxyOofUxV3jMnFMMuAes/0sQRrovPLaaUwGRQctGn6tO9QZdm7lQ1DqLX6X+/Oo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYVPR01MB11315.jpnprd01.prod.outlook.com (2603:1096:400:366::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 08:09:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 08:09:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Chris Brandt
	<Chris.Brandt@renesas.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
Thread-Topic: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
Thread-Index: AQHaxvl1VmkioavocEOGYVCwgbbtfLHcsPSAgAAbwoCAAAXZcIAAAqEAgAAAkfA=
Date: Fri, 28 Jun 2024 08:09:29 +0000
Message-ID:
 <TY3PR01MB11346CA73575CF61B2024F3B386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346EF9A001F68162148B70F86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <6289f329-118f-4970-a525-75c3a48bd28b@tuxon.dev>
 <TY3PR01MB1134603F92C72D9B6C6C3733C86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2f162986-33c5-4d80-958c-4f857adaad20@tuxon.dev>
In-Reply-To: <2f162986-33c5-4d80-958c-4f857adaad20@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYVPR01MB11315:EE_
x-ms-office365-filtering-correlation-id: 841fb143-d81d-4829-0fe5-08dc9749a243
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?VVBiUVhyQ253c0dhSnNZbnRvcFR5QSsrY1BhK0QzZ2dhUHFXeXdGb2hOdFRi?=
 =?utf-8?B?U0U2SUtWb3hzRkNCVFVpaS84N1ZUdmVLQ253YnZKZXc0bnZFZk1DYmVrMGxW?=
 =?utf-8?B?M1FKd2ZiNlhuVDdSQVBOV21wQ3JDaU9rTXV6U0pRKzk0S3ZpcFRRdzR1V3Bh?=
 =?utf-8?B?ZHliTk5NTVdsNHZFVWNBRnVXMk5uNHJBTGJZRzdEZDY5UEFDNFh3RlR1MTho?=
 =?utf-8?B?RzB0blJteXVvV1lObHRBcUlVekxKSmJkUTBhcExiQTVPVXdwbkFlaUhSb1Nl?=
 =?utf-8?B?cGd6dlNyVGcvUE9vVTc0SzU5T252Q0FYdDAvem9pSXlDQnc4b3BxeFpXb2dw?=
 =?utf-8?B?N0dXRWVQQjRKczlENjZoTTVRdmxuQU5TakRqNnRvS0dYbmRPOG1wMjJkTlBZ?=
 =?utf-8?B?cFZwL2ZYRHBaRUdRYWNjVXJSTjZFTHJOcEdTTUpCZ1RSN013ZEJoT2JVRWdS?=
 =?utf-8?B?ZmkwVmpUZHV3dEdyRDZNK2VuYURZREVENisvMGFFOWF6dTRDamkxbGFOd2x0?=
 =?utf-8?B?d1Z1TGxVUXJHMHJES2srRjBtcjliTjcwWFJCTGFHejdwbE9wWUVaTXRqSjBy?=
 =?utf-8?B?YzRWQVprblJZT2VWYTZFQTlnR3F1SVVWT2xRZHdKcDduODJzajJiTjMvN3ZD?=
 =?utf-8?B?bWJZcnVJU3pmRm5hRnBWY3pTOVlaWmM2dXhIdUI3eGllUFJNR1FXUHJpT05v?=
 =?utf-8?B?ZDhxd0dKYkhVQ2FmUTRkV3ZWZjREb2htSlJZNkJhUHNkbjFjMWhYVzEvNWhr?=
 =?utf-8?B?QW1Fc0VEd2xlclhsUUVyWVZ1UnRaSFdqb1hlT2ZoaU1Nd1c1azlxTEpEcUlE?=
 =?utf-8?B?RzFCU1h3YU8yQ3F0cGhVa2pySzB3bzhPU3d1Zi96ZEZGN3pxSG9YYWhCV1N6?=
 =?utf-8?B?ZDhRUFRmbFVpUUpsRTZHQTN3b21DK1JGMC8rbzE5RFdOdVB5TmpEandDS29G?=
 =?utf-8?B?c01XaVRNMmNPY213cTRUanZCelVrdy9NVVZNb3NHR3VwcndjU1B3VWJXK0ha?=
 =?utf-8?B?cFJJa1B6ckFCbmV0WW4wU2pTYytsdWh5QmEyNTVYL0hLcGhLci9MekVvUkhO?=
 =?utf-8?B?cWY3c3dWOGFRRzB4aGNybnVyMjkyczR2QjJmZlVncHZYWENUNHNYS295MExY?=
 =?utf-8?B?dno0dlR6WmNoYyt6YUFKU0Zvbit1cjB5a3FjKzRXOGt4dU5YUFlBbU1qS2Ju?=
 =?utf-8?B?NTNLbU10MVM4OVpDT3hkMjZPdk43aXNLUmUzUDFsczlPdHhpVGhxb2JPek9v?=
 =?utf-8?B?bGptbWVPU0tIaEpLOStJVWVjMDMxYkZvYlhiZjB4OGJSaVRxK1plUmk0MnA0?=
 =?utf-8?B?d25WSmdkaUo0WC82VFZodVE1QkVFTXBjTVk4MlhBTUswby92UUo0ME5MN21F?=
 =?utf-8?B?OS8xRlhyNWVHYWpZRnpLQzdPQnlhSncvT1ZMMElVNE9wcnJYMDRiWEFWY040?=
 =?utf-8?B?VGgrbHFrRVZ2S01vUlM1T0VBeVFKblhLVHJuYld1K25CQWU4VGROT0FKeU5r?=
 =?utf-8?B?RU9Ld1VjbTNZK2NuUkNld3piK2IzUUplVTZnY291VzFrc3hYazB3MmZFcnFa?=
 =?utf-8?B?bUhMalhRbXVBQ2VlVW5Uc1VTNVdES1RtM3BqMU5HTTVZRThjc25xR05nL3ZG?=
 =?utf-8?B?c0g5cVVmSGZyY2gzeFo2akxlRUxrYk90TzZxbThyVkprQXJZZE9VZUErSGJj?=
 =?utf-8?B?TlN2YmRjeHJnNkhTUG1FODVSbnlvbFhoMUhFOE9peWpoWmRnM0p3U0Q5UGVL?=
 =?utf-8?B?MWU2WFYzNVRyRWtvZmpKc2RldVhUT1ZYTEphZHAxMXE4UkZvL3ZCNFpnWDVz?=
 =?utf-8?B?OVNNMSthTEN3MndXajN2aTl2ekg2MFVQa2Z6NEcxVTF4RGU1TW0xeHIwanFM?=
 =?utf-8?B?Z0gvYXJCK1g2cDVSTU5CK2lvUXMzWGRYbks2amNJN3NuV3QxcTA0U0Q0ZGJN?=
 =?utf-8?Q?R8wwRh7RQPM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dHJ0YUIxYXp3Q2N5dFZYYm5qNVFBanBRZ1BCS2JTOVBPbnRZQWRvWjZmWkp5?=
 =?utf-8?B?TlVDOVJFb3VGK2JQR0J5bTcrZ2xSUnlRWHY3d2hJaUt3QnM3NnRHeXhLYUtT?=
 =?utf-8?B?aDVmK3h2c2FERkpRa3lEZm9qQTgwV2dZa3RSV3RZWFRaSnp0K2F5aDFjeDhC?=
 =?utf-8?B?NWpoSVBlZWpOOTFzcy82a285MkdXaHZjcmg4VWF2S25tSDF4WDI2Q3R1aHpq?=
 =?utf-8?B?MW1JQU9PMlRSbWpzci9xNHRaSVBNenFVNktSN3o3WC9Qbys3OGFnaElFaFRX?=
 =?utf-8?B?WUI3SmlIZTBHaVN0Z2Z3b016MTRGMU52RzhmZGpqWWc4SnlwRVJ3SGhDVmZl?=
 =?utf-8?B?L043QXRlTXJxZStqdGNselZNRC9IQW9vQzFXQ0ZzRFJGNDdZdFlSek9jcjBR?=
 =?utf-8?B?SzZoTXFtNkJyb1BkK0ZvMzEwKzVaTE9xYVNMOFo0eVNacWV1a1JvZWRSOXgz?=
 =?utf-8?B?VUV2elZZeTJkTkVmenVidjVoUU9TcTBtVThrMnZrcW1oYlhhMmk4TnNoR0lO?=
 =?utf-8?B?Q0dQOUVuYS9VYTlqaUZ3U0ZtZngxaExoRFBFeWFTaFpWMXE0NFIzMk00QVlZ?=
 =?utf-8?B?MERkQ290TDFRWTVRZWZQa3A4MXZvSHFxZTBlNkg3cnBpTWFJZWtiMm5lYVhs?=
 =?utf-8?B?MTNLYitxYnI3MEpxRTA5Nm9XWlRDUWxjdGlpUjIveW96TDREVGN5SDFsR2U2?=
 =?utf-8?B?Y1lNWEpKRnkreHQ4bkJmeHZkUmNuSDU0SWFBamVYVGZ5cnJKa0lwMWhZd3pX?=
 =?utf-8?B?emlDQnBaMGxQTWgrTzlTcENEWWtEdDNQVnpIdnMxdzBSNjVnZ0lreG9mSEls?=
 =?utf-8?B?SU5uUWFKUjRKU3hpSEROdVlWcGlmVWFSd3ZYVFlobUFiS1hBbUVpNk92T1ow?=
 =?utf-8?B?V01VdEl1TGxWaCsxWFplQXBHMW1UbXM3K0dxYnVKeEI0VEsvTmg1TjVWUVdn?=
 =?utf-8?B?TGUxS1hHSXpNbXllYStjazRlL1V4U3ZTY0dmcGdrZHhpMTBaLzBZMndQMmpS?=
 =?utf-8?B?ek5PNlhOS1pBZGo1UlF1RWlPWjdDcFMwaHJCL2JEb0V2NktReHFLU2l6Y3N4?=
 =?utf-8?B?WXFiSTJNNmRzZDFMZk5XdXJRQkpEQWdWOWpoSHhONGhpQU1qSm01ZGJRU1Ru?=
 =?utf-8?B?U2hHRGFKNFgyQTFhdGYwWS92V2F4Y2dnQ1RQTU9vN0dUMy9CZnFSdFlVcHBo?=
 =?utf-8?B?UE9vVmxPQ3V4MXd0ZXppNU5zbDJLYXNiM2p1dXRZRzYzaE1oQ09DOE4zNTZC?=
 =?utf-8?B?LzYxSkNKQ0lhZ0dZRkQ4d2hrUTVRYys2bXU3TE1pNk5Ob3Y2MUx4eXNFQWhw?=
 =?utf-8?B?d1hBcmpTN0ZlMDZZQ2pIMW9DZXNPVHZNVzRuT1UrSkVYaE5FMGVIYXRtc3Bl?=
 =?utf-8?B?cDdxRUoxVjBJQml5YWo4ZXRwZ0xrdDZqdUgxcXREUmp6djFpa1lTZVk2SU53?=
 =?utf-8?B?bGxJYkdCQmxVazRKYUpKYjFiRU9BdFI4MmVRaEZMRGVJMXQvYmpxbWcwek5O?=
 =?utf-8?B?SG1rNVVDYjZROWxJU2lPaXJIaHVNdVNnclRCZnBPUnRUWEN1VlFrSXRXdVAw?=
 =?utf-8?B?ZDYxRlRuSU5CeDc3NG00bllhVHNHSTNTQVgzM3F1QklCcVRqMlVSTkJOMlBF?=
 =?utf-8?B?MHAvdXRIQmZ6dE1uYzAxZ2V2blpINmNUWmNDdERrRkdBRUxCTlp4eVpLQTE4?=
 =?utf-8?B?bDZVQzJuK1h4ZDNXbnRzc2ZVb2tlYmdrWDJidXNvdWdyMDFPbk81VlhRMXNk?=
 =?utf-8?B?YVc0dXlkOUpiY282ZkxNNE9ta0U2UzA0MWxKOTNDSkpGVTNGcEx2UWFVYW4v?=
 =?utf-8?B?QzdnMkFuMFFWUnR5cGNkb3Bid0RIMjMxOTFaTG5icUZXQUpMUHBEbzJReG9F?=
 =?utf-8?B?MUVCVHdpTlgxQ2tncjNjVkhMNG40V3kwNEpZN24ycy9ha0Z2WEhTa241YVFw?=
 =?utf-8?B?TUNFbU9ITlFHWDl4OVJ3VWQ2VForbTM1YTQ5RjFONVNaMXBWQlEydmRQUU1H?=
 =?utf-8?B?VjNoM3lvbHMxN1hjelZqNHp4Nm1mRktCNjhnOW1WdFo5UmttdGlCK2x1MFNU?=
 =?utf-8?B?cXpsMFhNYzk3RTIzMEpobFZPRVp2Yjl0eGdjVk1Tb0xYSW5MdG84ZzFGVTFI?=
 =?utf-8?Q?N/GI47B3ma1kw8HYx0QjWYker?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 841fb143-d81d-4829-0fe5-08dc9749a243
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 08:09:29.0365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y8vKYQ4DDaRdpSmU7fpeX6mmUOfFSJONZRgo8NCh6CVf6xp22el2uo3Nu9PuO+I7dDFUnHa12nTTUGkPNbduPIDXnlfTKlzhXhpOGFkm798=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11315

DQpIaSBDbGF1ZGl1LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGNs
YXVkaXUgYmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+IFNlbnQ6IEZyaWRheSwg
SnVuZSAyOCwgMjAyNCA5OjAzIEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDcvMTJdIGky
YzogcmlpYzogRGVmaW5lIGluZGl2aWR1YWwgYXJyYXlzIHRvIGRlc2NyaWJlIHRoZSByZWdpc3Rl
ciBvZmZzZXRzDQo+IA0KPiANCj4gDQo+IE9uIDI4LjA2LjIwMjQgMTA6NTUsIEJpanUgRGFzIHdy
b3RlOg0KPiA+IEhpIENsYXVkaXUsDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPj4gRnJvbTogY2xhdWRpdSBiZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4N
Cj4gPj4gU2VudDogRnJpZGF5LCBKdW5lIDI4LCAyMDI0IDg6MzIgQU0NCj4gPj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MiAwNy8xMl0gaTJjOiByaWljOiBEZWZpbmUgaW5kaXZpZHVhbCBhcnJheXMg
dG8NCj4gPj4gZGVzY3JpYmUgdGhlIHJlZ2lzdGVyIG9mZnNldHMNCj4gPj4NCj4gPj4gSGksIEJp
anUsDQo+ID4+DQo+ID4+IE9uIDI4LjA2LjIwMjQgMDg6NTksIEJpanUgRGFzIHdyb3RlOg0KPiA+
Pj4gSGkgQ2xhdWRpdSwNCj4gPj4+DQo+ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPj4+PiBGcm9tOiBDbGF1ZGl1IDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+Pj4g
U2VudDogVHVlc2RheSwgSnVuZSAyNSwgMjAyNCAxOjE0IFBNDQo+ID4+Pj4gU3ViamVjdDogW1BB
VENIIHYyIDA3LzEyXSBpMmM6IHJpaWM6IERlZmluZSBpbmRpdmlkdWFsIGFycmF5cyB0bw0KPiA+
Pj4+IGRlc2NyaWJlIHRoZSByZWdpc3RlciBvZmZzZXRzDQo+ID4+Pj4NCj4gPj4+PiBGcm9tOiBD
bGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4+Pj4N
Cj4gPj4+PiBEZWZpbmUgaW5kaXZpZHVhbCBhcnJheXMgdG8gZGVzY3JpYmUgdGhlIHJlZ2lzdGVy
IG9mZnNldHMuIEluIHRoaXMNCj4gPj4+PiB3YXkgd2UgY2FuIGRlc2NyaWJlIGRpZmZlcmVudCBJ
UCB2YXJpYW50cyB0aGF0IHNoYXJlIHRoZSBzYW1lDQo+ID4+Pj4gcmVnaXN0ZXIgb2Zmc2V0cyBi
dXQgaGF2ZSBkaWZmZXJlbmNlcyBpbiBvdGhlciBjaGFyYWN0ZXJpc3RpY3MuDQo+ID4+Pj4gQ29t
bWl0IHByZXBhcmVzIGZvciB0aGUgYWRkaXRpb24NCj4gPj4gb2YgZmFzdCBtb2RlIHBsdXMuDQo+
ID4+Pj4NCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpu
ZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4+Pj4gLS0tDQo+ID4+Pj4NCj4gPj4+PiBDaGFuZ2Vz
IGluIHYyOg0KPiA+Pj4+IC0gbm9uZQ0KPiA+Pj4+DQo+ID4+Pj4gIGRyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtcmlpYy5jIHwgNTgNCj4gPj4+PiArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLQ0KPiA+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRp
b25zKC0pDQo+ID4+Pj4NCj4gPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1yaWljLmMNCj4gPj4+PiBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcmlpYy5jIGluZGV4DQo+
ID4+Pj4gOWZlMDA3NjA5MDc2Li44ZmZiZWFkOTU0OTIgMTAwNjQ0DQo+ID4+Pj4gLS0tIGEvZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1yaWljLmMNCj4gPj4+PiArKysgYi9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLXJpaWMuYw0KPiA+Pj4+IEBAIC05MSw3ICs5MSw3IEBAIGVudW0gcmlpY19yZWdfbGlz
dCB7ICB9Ow0KPiA+Pj4+DQo+ID4+Pj4gIHN0cnVjdCByaWljX29mX2RhdGEgew0KPiA+Pj4+IC0J
dTggcmVnc1tSSUlDX1JFR19FTkRdOw0KPiA+Pj4+ICsJY29uc3QgdTggKnJlZ3M7DQo+ID4+Pg0K
PiA+Pj4NCj4gPj4+IFNpbmNlIHlvdSBhcmUgdG91Y2hpbmcgdGhpcyBwYXJ0LCBjYW4gd2UgZHJv
cCBzdHJ1Y3QgYW5kIFVzZSB1OCogYXMNCj4gPj4+IGRldmljZV9kYXRhIGluc3RlYWQ/DQo+ID4+
DQo+ID4+IFBhdGNoIDA5LzEyICJpMmM6IHJpaWM6IEFkZCBzdXBwb3J0IGZvciBmYXN0IG1vZGUg
cGx1cyIgYWRkcyBhIG5ldyBtZW1iZXIgdG8gc3RydWN0DQo+IHJpaWNfb2ZfZGF0YS4NCj4gPj4g
VGhhdCBuZXcgbWVtYmVyIGlzIG5lZWRlZCB0byBkaWZmZXJlbnRpYXRlIGIvdyBoYXJkd2FyZSB2
ZXJzaW9ucw0KPiA+PiBzdXBwb3J0aW5nIGZhc3QgbW9kZSBwbHVzIGJhc2VkIG9uIGNvbXBhdGli
bGUuDQo+ID4NCj4gPiBBcmUgd2Ugc3VyZSBSWi9BIGRvZXMgbm90IHN1cHBvcnQgZmFzdCBtb2Rl
IHBsdXM/DQo+IA0KPiBGcm9tIGNvbW1pdCBkZXNjcmlwdGlvbiBvZiBwYXRjaCAwOS8xMjoNCj4g
DQo+IEZhc3QgbW9kZSBwbHVzIGlzIGF2YWlsYWJsZSBvbiBtb3N0IG9mIHRoZSBJUCB2YXJpYW50
cyB0aGF0IFJJSUMgZHJpdmVyIGlzIHdvcmtpbmcgd2l0aC4gVGhlDQo+IGV4Y2VwdGlvbiBpcyAo
YWNjb3JkaW5nIHRvIEhXIG1hbnVhbHMgb2YgdGhlIFNvQ3Mgd2hlcmUgdGhpcyBJUCBpcyBhdmFp
bGFibGUpIHRoZSBSZW5lc2FzIFJaL0ExSC4NCj4gRm9yIHRoaXMsIHBhdGNoIGludHJvZHVjZXMg
dGhlIHN0cnVjdCByaWljX29mX2RhdGE6OmZhc3RfbW9kZV9wbHVzLg0KPiANCj4gSSBjaGVja2Vk
IHRoZSBtYW51YWxzIG9mIGFsbCB0aGUgU29DcyB3aGVyZSB0aGlzIGRyaXZlciBpcyB1c2VkLg0K
PiANCj4gSSBoYXZlbid0IGNoZWNrZWQgdGhlIEgvVyBtYW51YWw/DQo+IA0KPiBPbiB0aGUgbWFu
dWFsIEkndmUgZG93bmxvYWRlZCBmcm9tIFJlbmVzYXMgd2ViIHNpdGUgdGhlIEZNUEUgYml0IG9m
IFJJSUNuRkVSIGlzIG5vdCBhdmFpbGFibGUgb24NCj4gUlovQTFILg0KDQpJIGp1c3QgZm91bmQg
UlovQTJNIG1hbnVhbCwgaXQgc3VwcG9ydHMgRk1QIGFuZCByZWdpc3RlciBsYXlvdXQgbG9va3Mg
c2ltaWxhciB0byBSWi9HMkwuDQpXb2xmcmFtIHRlc3RlZCBpdCB3aXRoIHI3czcyMTAwIGdlbm1h
aSBib2FyZCBhY2Vzc2luZyBhbiBlZXByb20uIE5vdCBzdXJlIGlzIGl0IFJaL0ExIG9yIFJaL0Ey
Pw0KDQpDaGVlcnMsDQpCaWp1DQoNCg==

