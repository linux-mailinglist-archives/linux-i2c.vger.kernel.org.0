Return-Path: <linux-i2c+bounces-4214-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EC6912617
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 14:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A950C1C258C8
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 12:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7041115357A;
	Fri, 21 Jun 2024 12:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BZrLJitb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2077.outbound.protection.outlook.com [40.107.113.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ACC1514C1;
	Fri, 21 Jun 2024 12:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718974609; cv=fail; b=ZP/afzMQ31er752WVrMnDF+GY3wFYq6tJhOqfcfDkuZJ4KFeK5tkuMEud5ztkJ0WWjE7U6KuXmQDJi5QqcaFoH/nUHpnLScUZIKes9ZPs9UQBd6aqVDjHVInj7aZ2xpqOp2d2VU5U58Me2xVh4ffXnHKl1fR8/AU3hqbVDeab1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718974609; c=relaxed/simple;
	bh=lmtxJPZcUaNnmSTk9a8jWgrTME03rEgifbKrIhR/aw4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oiH4DgifuNKQpqVb/V+j1jWNOt1pojAwM7d9bZSTv8udpDwJWZtcUEAWQ3GWNTB6ke/H/hZaED2HcpOl9zJnUXPDyXiFosFgJao57OPUlu8CgTQfPck/Zloe1THXIO8iDOiJdOM9BSHyMKyzYFoM9TIBDjnSlx4f2sGzhGsxEYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BZrLJitb; arc=fail smtp.client-ip=40.107.113.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQN+HVLXVK1Hwj38rlfOx3gbUXE4LcibcEmYA4GEXWck4EAvIbF5/vea3JCTP7ghYuRNuRTy0CssyXj/m4w8HUqAn9HLO6p6kMDPYL1MWciFtekjC7GDEEpE2pnUe3sg36UvTK7ByVxAsBSWG0jeDkBxuvNrjR3oOMZazJgP5LgpyEUCFA/oQyYigCgCHrLEmqBbu13bDoAJ9PW3JDhHPwwmjH2poqRcXTagLNaLdy94JZE2FnNmEwd9+WVBD5taYayp6CuGPydrEUt6iug5OgQfzFkGap/B5s/pV3MW7fTZpgO//ejTwxznqW4MKIV/otkuLJT54CJ+c2DiOJCS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmtxJPZcUaNnmSTk9a8jWgrTME03rEgifbKrIhR/aw4=;
 b=dKJTZn0gV4cJphmDz4tdjDStGUXgIAonc21YKqxoR6ZXnr+/lI7sf+n+37j7gcBedlKtAiPfBWevzDHBm3oY2f3P22A1d01Lo4ufsPwbvVz9xdXMQifkdZi7rdYn8vhL6fzAUYrpYLI1utN/vGqxbmArXyS6zvFrZEcyypgntW+Z9+utzEyoem4FMd8sA4wgpWosv2JymTu47outfy7fwLwYCta7gSjgfXND92GR5pKlXQkdTmvoSB+kf3lhRQIGS8j/XbOLH9n5jr23AY84HD2WarTICYSacNU6/Kkrj1midOyMpH1CZ51yFTbAZHoNxTOvQwx89q5TWynI9MFQqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmtxJPZcUaNnmSTk9a8jWgrTME03rEgifbKrIhR/aw4=;
 b=BZrLJitbt0MtwUQIFnHzi5DS/2x1X2P6eGunjUaU1ujPV6y2FfHfEKsl7nupNmAn/l+S1Eus2loR+8VkjrvuYwQKlgjQfG/uXpE8bWEKvReuBsf4fYRB6C2HWNf5Ulapt7PYHBRKbBi1h3VbismiKJkWu4DPs1ikOWE6VUOPM/0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10051.jpnprd01.prod.outlook.com (2603:1096:400:1e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 12:56:42 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 12:56:41 +0000
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
Subject: RE: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Thread-Topic: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Thread-Index: AQHaw83CoDfPceNxD0KOSNXxIs1DTLHSJmsggAAGUYCAAAAcwA==
Date: Fri, 21 Jun 2024 12:56:41 +0000
Message-ID:
 <TY3PR01MB1134602C189C6C63C6187840886C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
 <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346105D3D3DD46AEF8CD44986C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <0bc78e5e-de37-4ff6-ac74-571f615b97f9@tuxon.dev>
In-Reply-To: <0bc78e5e-de37-4ff6-ac74-571f615b97f9@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10051:EE_
x-ms-office365-filtering-correlation-id: 6cd781d9-1c6a-48bf-269c-08dc91f198fa
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|376011|1800799021|7416011|366013|921017|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?dXpwTzkyaFNLUGVES29aT3JIczcyWG9sejZxT1lnNFFuM3RiZFFHWm1LSFZT?=
 =?utf-8?B?dThlT2dyZEpsUWd2YXQ0dTN5citOSVFIdmFrT0NmdWpRSzNMVXlYeXRXNGxG?=
 =?utf-8?B?bmNHU2lvdjRXQmNBYlIxSkM3eFdLZ0lqWCs2enJDc3FCcnY3RFlKNmhFbTRq?=
 =?utf-8?B?S1BRaEZrRVgyY29wNmEwSkhsOTgxNHgxdGE4MkxNVFhKN1VRdDFWL2RuZlFu?=
 =?utf-8?B?OW4wK1EvSnZwQmlRQzFBeGRlSXRadUtyUWVjeCtrdGIxczdFTm05bDJyZVFZ?=
 =?utf-8?B?VjR2c0wxZHFNcjZlbmZuMmY2TDR4Ni9wUisyNFFZWTNSTXZFNnl1ZEdxT1dC?=
 =?utf-8?B?Sm1JZUtUNEtLOTZtZGhDWUVKYmdFL2JLbFhXcktRcjlPNjF4cGEvb1lyM2FB?=
 =?utf-8?B?Ty9XNjZVcXdMZERZZzZaa2l4TUtiTU5aQVN0OXpKamxVZDNGcjNCZTQwejAw?=
 =?utf-8?B?OUM4eW91WThnZkF2Y054ZzFRa2VDZ0xIVjBidWNUWjF1RTNPWm5aaDVPU0ZF?=
 =?utf-8?B?Kzlmd2FYYUYzNEc3T0s1T000dDA5SlJEb1BjajltMGJZZXlHS0JudzFVMjBr?=
 =?utf-8?B?aHNZVy9ONHlYc3FWVGNKN0dqT2FvNi94VnVoWk9XZ3R0RDdReGlNcVMwajFN?=
 =?utf-8?B?MmJkZjlDSkRlRENLQmxHYjJ3WDlBV3pjVFdOdEVGZ1BKMlVhVFpsbDlxZ09s?=
 =?utf-8?B?WmlzeVhRdnJsdEFranArTVFsalh5VTVLamc0L2wvTVpsd2t4NEtsZk92c0ly?=
 =?utf-8?B?OXMra3pUZEdieDFNSzNubVo0RG8zM3hMS2dvT1FKQ1luM1RYeEltNUhWbDU5?=
 =?utf-8?B?OFRzMDhvN1BZU05Yc2U5WEt1d1pLaEEza01TS3NmQmphbGZ6WUliaU5sNGsz?=
 =?utf-8?B?N2pnMTFsaE1UME5EdUIvTFd2RngwcDlVWFpaeEk2NmJqbDdQcHlaTFdjU3BV?=
 =?utf-8?B?ekUyQ2NRV1lrcnRjWlY2V2NXaHY5N1ZwOGNZeVFRK2p2cW1jbTdmbjZDOWtG?=
 =?utf-8?B?Z2NnWlM5NmlVZWdERXlPd2g2K2FjZUlLUjB3YkVwTXFtUStlTmd2SUdQYXZK?=
 =?utf-8?B?V0JqV2d3K2JBQVB1Y1FLV3JQakxmYVZINTZiVCtabElKWHBoU01JeXY2aW1B?=
 =?utf-8?B?Z3diR1FIYkN6VHJwbUtXMVN1TEY1RVIySDJlUkZCTC9jUnVJeko2aVhnSEcx?=
 =?utf-8?B?TTJ6WGFVTzVZcXA2OFQ3dnhNMVVtS0NDaGhTTlpyZ0VxSWoxSzFvaUdjeE1P?=
 =?utf-8?B?ZjlVb05ZN2NrY0dENHMrWWQvVUc4cUtXZzRPT3ZXMlZnWnlTNUIraXArdHBn?=
 =?utf-8?B?RHo0UTJNbmlOeUdsTHA0YlM5bDdidGNia1Jhamt5dGJ2bnBCcXdoSEpZK3Mr?=
 =?utf-8?B?NE9rNzRJMmRjQ2ZzTUZsSEdvWDRaSXJjRzdvMTc0MHVKMWtsb29nMUsxa2tn?=
 =?utf-8?B?UFZXYUtabk5neUlXTkx3SGE1T0dqamVhNEZZbTcyUktFL1pvRXl1SUJkVTNx?=
 =?utf-8?B?dkxtMkpTajhTUGFZYlg0VFVMQ3lERU9ZQ3hYT1dleXRNcktjZ1pNL2NJTUdJ?=
 =?utf-8?B?cTY3QVVOZE9ta0xnSEgxV2w2Qy8zT2NyR0ZWc3BOS0tzQjIzY2RrWXVuNGJM?=
 =?utf-8?B?RW40ZS9sY3hGbUVqREFSTHk1dm5vY3dhY1Y3UWxxbjR2QWRua0JwejlWZ0No?=
 =?utf-8?B?ekJGSkF4aWxUWHgzYVFMZjQ5b2lUNlV4L0VjWE1wSnpWWjBzaEk2bXBXaEgx?=
 =?utf-8?B?MitJdi9SbVZ1aDE0YlJUTHNTdWJZalBCS3ZLeUkrQkorTDRDQ2NEWkN1OEox?=
 =?utf-8?B?cWVhSjFMQmpJQlR6SGh0Z1M1T0h6U1kzclk4dXI4MUpEMk95SGR5bUNVRENS?=
 =?utf-8?Q?zB/B91gSZvkxi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(7416011)(366013)(921017)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ellkallsMHg2c01xckZJV0RNYlByVUxPdWNwQk1WcnR6djdIcmlMSWduUkJR?=
 =?utf-8?B?alNMRnZ5em9lU3BFSXJXT3V2Rm1zaTAzS01oTE1FRkFPYzBSTUw4T0V3cVpv?=
 =?utf-8?B?aFpPbDVYUU1WU0YweWxpRUk2aCtLaGk2VmlZUnB3eWhCMWE0RWdoNWh3Wm1Q?=
 =?utf-8?B?WklkVEx2dzU4cUx5NVN6U0RYbHdQU1lqYkdsa1JKL3podGJwVjllMHpVbDJP?=
 =?utf-8?B?SDZySVZYZVFxTjk4UnB0Z2dXamNoczYvdmVaNCsyOFF6OEtVeE9PVDhhSjBE?=
 =?utf-8?B?SlNzbEJydWdYcjdvVjZZV1AweVA5Q1B4N1NSOXFaaHc5M0swUXYwMlY0ZE9h?=
 =?utf-8?B?OWlvTzY2UytzL00wTEcyc2x3ZzN4SDBaQVFJRE4wY2o2c3F3TGRnL0xEUWtQ?=
 =?utf-8?B?UEtTbVZNQjlhKzZwQi9OMXQrd3NsdkxOdFQ4VFphRStmUTBsRnM4c2ZCNm5t?=
 =?utf-8?B?TzF5K3FaRytSZmdGeWdnT1locjNWM09PNkNVV2oxazM1YUJTY3lQdU9Db1M2?=
 =?utf-8?B?S0xEZE9TMHZERFRGVHhPb3c2czJhMDk4Q0VuS2tWZkI0bUkzRUpBSHJGOHVt?=
 =?utf-8?B?VVFKZ21zK2dkanVCWE5ibnc0K0pIQktiMm9JaW9zVTJnZjZmOHMyZTdQSThU?=
 =?utf-8?B?b2o3N2xyWVVLTjJGcUdmbVgvZWFaVm1TbDlBTWNaN0w2M01pT3IySVBTTzVK?=
 =?utf-8?B?WjRCNm9aUVJSWGlIaDZ2bGtNdVFnZWRVVzd3KzBWclR5U0huMlFKdG9VaFJK?=
 =?utf-8?B?R2lQSERJdWhRSm9xdmlmdklXQW5nRkRON0NjdndhQmJtR1RNVENweFQ1cDFp?=
 =?utf-8?B?a3VkcjRvU1hWcUVVSjBXSTU4RXg2aTB4SjhGbEVmSDN1WGJoK2hBQWNLT3J0?=
 =?utf-8?B?VXlwTGYwVmtTWGNwMjVqbklvUjV2cy84ak9CbWRJc3U1NFFKWk11UWN1bFRi?=
 =?utf-8?B?cC9oNWk1cGY2ajJKM1ZRaVNHcVF3WHNDdVVSMnU4djUzMGlWMmo0dlVWME5S?=
 =?utf-8?B?aWxYWlJjY0pWMVhyRlZoajNLRitpdDhENXZuWjJWYVhrOUM1T3AyMWVMZTdH?=
 =?utf-8?B?OXlSMmF3eEVrQktDNDdyUks3cll0YnVOSVIrTjRGOE40V1VKV25HNm5yRGhr?=
 =?utf-8?B?MnZWMzVTSEZ4ZGpwMkI3OGs4eXNheU5FLzBoSUdPeHdQbGY4SGNNaEJQVTRw?=
 =?utf-8?B?OGkyVDVTb2V2OVhKK252dHpBTjlWUkV3R1U4SjgwdEVoZ2hSdzhSc00rNVNr?=
 =?utf-8?B?VHh3U0svRHZ1TG5adHRwc250V1RtS1RoZlVEOHp4TFZrSlJEbnR2QkV0dllT?=
 =?utf-8?B?VlhaOUw1NGdHUXoyckpCT1dSejVWdllyeU0zckV5TDVnMjBEN3czQ1pJcE4z?=
 =?utf-8?B?a3VCUkRwWmpNU00yUzFnVlFvRzZEK0ZNd0VvZ214VXZMN1ZjOCtORllYR252?=
 =?utf-8?B?UXlLZnhxQTQwajVNV3ZLOHQ0YnZ4enRoSGdUYXdGMFJSanZZUE03RXVFUy9l?=
 =?utf-8?B?Uk85NXNjei9xVnBaa0VwaUI3MUxSc0dvNEpZY1VTdjZMSVU3YkI2dUl1dGl6?=
 =?utf-8?B?UlhFZDQ1YXZUN3F0RVRXV3pJTjlPUkcyckIweHduVldOTzRrbHhCWDczOXUv?=
 =?utf-8?B?d20waC81L3NDbUNIVnlIckt1U3NlZUdjTzdwcEtPaVp4MkNIakFVTE1EQWxy?=
 =?utf-8?B?cjZlOTByTlN0ZlBmREk5MjBMREcyanBObUdKblZLNXFWTzZrWk1NczNON2pu?=
 =?utf-8?B?a3BBSWMwbXIzQ05KdUNCZEI2VEJGSFBWL3Y1UEcrM2tDYncwQVJZVllRR1Ja?=
 =?utf-8?B?ejlBU1BiMFpEcXI4S0tDK2tGcmp0eStmZlJxclBZUCtMR1lKWThydUk4dFFt?=
 =?utf-8?B?aWR6VE0wYXR1RElLT0dGdkpUSEdQcW1rYjBLMlY2d3laTFJrRVc0cGg0UTA2?=
 =?utf-8?B?UEZsT2ZvZUZUS0lKRnh6b3I2UDI2dy9Nc3Z1MG56RVpXYW9XSEdwSDFaa0FO?=
 =?utf-8?B?STRhU0NySlFDRTZjSUR5NHY3K21qSldpNEp5QkNiM0NDUDZPYjdGSUFIRnZo?=
 =?utf-8?B?ckdMcTJlZ05pcW1sQndRVVN3bytOQ1FrM0NpMlM3RUliNFNjZ2dwYmJBaW4v?=
 =?utf-8?B?b2FsZ013b3BUWEUrZDVYMnBoZHdDaGRDSmZ6ZlRSQVQ3VjltWWswUWljL09Q?=
 =?utf-8?B?amc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd781d9-1c6a-48bf-269c-08dc91f198fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 12:56:41.9409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zquXs7AOMXEKsx7Qct6TgjKUW4Tk32yIzlKD9LUR9szhjwzRo07OQDSRfRIcNwaUIqWxOaufPG5x0uOfyUGzPKfPoiVpGS7EkUhneF+5mLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10051

DQpIaSBjbGF1ZGl1LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGNs
YXVkaXUgYmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+IFNlbnQ6IEZyaWRheSwg
SnVuZSAyMSwgMjAyNCAxOjU1IFBNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDgvMTJdIGR0LWJp
bmRpbmdzOiBpMmM6IHJlbmVzYXMscmlpYzogRG9jdW1lbnQgdGhlIFI5QTA4RzA0NSBzdXBwb3J0
DQo+IA0KPiANCj4gDQo+IE9uIDIxLjA2LjIwMjQgMTU6MzQsIEJpanUgRGFzIHdyb3RlOg0KPiA+
IEhpIENsYXVkaXUsDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4g
RnJvbTogQ2xhdWRpdSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiA+PiBTZW50OiBGcmlk
YXksIEp1bmUgMjEsIDIwMjQgMTI6MjMgUE0NCj4gPj4gU3ViamVjdDogW1BBVENIIDA4LzEyXSBk
dC1iaW5kaW5nczogaTJjOiByZW5lc2FzLHJpaWM6IERvY3VtZW50IHRoZQ0KPiA+PiBSOUEwOEcw
NDUgc3VwcG9ydA0KPiA+Pg0KPiA+PiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpu
ZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4+DQo+ID4+IERvY3VtZW50IHRoZSBSZW5lc2FzIFJa
L0czUyAoUjlBMDhHMDQ1KSBSSUlDIElQLiBUaGlzIGlzIGNvbXBhdGlibGUNCj4gPj4gd2l0aCB0
aGUgdmVyc2lvbiBhdmFpbGFibGUgb24gUmVuZXNhcyBSWi9WMkggKFI5QTA5RzA3NSkuIE1vc3Qg
b2YgdGhlDQo+ID4+IElQIHZhcmlhbnRzIHRoYXQgdGhlIFJJSUMgZHJpdmVyIGlzIHdvcmtpbmcg
d2l0aCBzdXBwb3J0cyBmYXN0IG1vZGUgcGx1cy4NCj4gPj4gSG93ZXZlciwgaXQgaGFwcGVucyB0
aGF0IG9uIHRoZSBzYW1lIFNvQyB0byBoYXZlIElQIGluc3RhdGlhdGlvbnMNCj4gPj4gdGhhdCBz
dXBwb3J0IGZhc3QgbW9kZSBwbHVzIGFzIHdlbGwgYXMgSVAgaW5zdGFudGlhdGlvbiB0aGF0IGRv
ZXNuJ3QNCj4gPj4gc3VwcG9ydCBpdC4gRm9yIHRoaXMsIGludHJvZHVjZWQgdGhlIHJlbmVzYXMs
cmlpYy1uby1mYXN0LSBtb2RlLXBsdXMgcHJvcGVydHkuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYt
Ynk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4g
Pj4gLS0tDQo+ID4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3JlbmVz
YXMscmlpYy55YW1sIHwgOCArKysrKysrKw0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2kyYy9yZW5lc2FzLHJpaWMueWFtbA0KPiA+PiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9pMmMvcmVuZXNhcyxyaWljLnlhbWwNCj4gPj4gaW5kZXggOTFlY2Yx
N2I3YTgxLi5jMDk2NGVkYmNhNjkgMTAwNjQ0DQo+ID4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9pMmMvcmVuZXNhcyxyaWljLnlhbWwNCj4gPj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9yZW5lc2FzLHJpaWMueWFtbA0KPiA+PiBA
QCAtMjUsNiArMjUsMTAgQEAgcHJvcGVydGllczoNCj4gPj4gICAgICAgICAgICAgICAgLSByZW5l
c2FzLHJpaWMtcjlhMDdnMDU0ICAjIFJaL1YyTA0KPiA+PiAgICAgICAgICAgIC0gY29uc3Q6IHJl
bmVzYXMscmlpYy1yeiAgICAgICMgUlovQSBvciBSWi9HMkwNCj4gPj4NCj4gPj4gKyAgICAgIC0g
aXRlbXM6DQo+ID4+ICsgICAgICAgICAgLSBjb25zdDogcmVuZXNhcyxyaWljLXI5YTA4ZzA0NSAg
ICMgUlovRzNTDQo+ID4+ICsgICAgICAgICAgLSBjb25zdDogcmVuZXNhcyxyaWljLXI5YTA5ZzA1
Nw0KPiA+PiArDQo+ID4+ICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHJpaWMtcjlhMDlnMDU3ICAg
IyBSWi9WMkgoUCkNCj4gPj4NCj4gPj4gICAgcmVnOg0KPiA+PiBAQCAtNjYsNiArNzAsMTAgQEAg
cHJvcGVydGllczoNCj4gPj4gICAgcmVzZXRzOg0KPiA+PiAgICAgIG1heEl0ZW1zOiAxDQo+ID4+
DQo+ID4+ICsgIHJlbmVzYXMscmlpYy1uby1mYXN0LW1vZGUtcGx1czoNCj4gPj4gKyAgICBkZXNj
cmlwdGlvbjogc3BlY2lmaWVzIGlmIGZhc3QgbW9kZSBwbHVzIGlzIG5vdCBzdXBwb3J0ZWQNCj4g
Pj4gKyAgICB0eXBlOiBCb29sZWFuDQo+ID4NCj4gPiBDYW4ndCB0aGlzIGluZm8sIGFzIHBhcnQg
b2YgZGV2aWNlIGRhdGE/PyBCYXNlZCBvbiBmcmVxdWVuY3kgYW5kDQo+ID4gZGV2aWNlIGRhdGEg
aXMgZW5vdWdoIHRvIGRlcml2ZSB0aGlzIGluZm8/Pw0KPiANCj4gV2UgY2FuJ3QgcmVseSBjb21w
bGV0ZWx5IG9uIGRldmljZSBkYXRhIGJlY2F1c2Ugb24gUlovRzNTIHdlIGhhdmUgMiBSSUlDIGNo
YW5uZWxzIHRoYXQgc3VwcG9ydCBmYXN0DQo+IG1vZGUgcGx1cyBhbmQgMiB0aGF0IGRvZXNuJ3Qg
c3VwcG9ydCBpdC4NCg0KQ2FuJ3QgYXJyYXkgb2YgYml0cyBmb3IgdGhpcyBjaGFubmVscyB3b24n
dCBoZWxwPz8NCkJhc2VkIG9uIHRoZSBiaXQgaW5mbywgeW91IGhhdmUgdGhhdCBkZXRhaWxzIGFu
ZCBjaGVjayBhZ2FpbnN0IGZyZXF1ZW5jeSBkZWZpbmVkIGluIERULg0KDQpDaGVlcnMsDQpCaWp1
DQo=

