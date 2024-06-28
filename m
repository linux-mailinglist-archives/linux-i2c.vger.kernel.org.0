Return-Path: <linux-i2c+bounces-4467-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF7591BD66
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 13:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD786B22BC3
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 11:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EF415688D;
	Fri, 28 Jun 2024 11:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EwtZ+MSB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ABC23D0;
	Fri, 28 Jun 2024 11:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719574163; cv=fail; b=cYzMuCIJDWjb91sty+ceLdEtPfoyGozAJmRzLbZkx8aN/ybfHidoYH2Py+4K5k6BhJ3es9bPhpDRRmXDmqIekaFM0d4sevSeEuZUI0WYNJR2zcQEseKRa2kM2P0cobjFR+fifPXYG8WuXPCE8xQWhHYnRCWI1Jzu3FFhrDH4szQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719574163; c=relaxed/simple;
	bh=rh596/urSWx2irwfcgTo0t6Yf2/ADyCle6tWyJyEFyQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FXPHi0UwbOQytEHE67h3kGgb6ZUzGrmgFXUXMuWJc0NE1mXknH5WqNnJ/k++wkTy/dNGMbaFum5aaHcYWoQQcONHBxJ6bZNg4oJV9Q4SIli6OkA77u8tHrmssPgRzkVbANhfD8NaEOrcHnkcgZZWgZVr8poOoI/3E/L1bAH3hs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EwtZ+MSB; arc=fail smtp.client-ip=52.101.125.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afj87DANEbd9GVV8BoNQjEQBYgcdvCu1Zqk2vKQMkaDBYjduyv053QjVT2GU2lgwyP46wnrXCuwQ4x46en+zAOIttAE/I6EElxRHR8zeKR/KmdBH3m76/HY1NMtzgdAb7Hwau1EGdtSE3eM6yvf9vB4uaU383OYcdnbXqBdtIre36+37LrQTIQpFw1GXmKjfi76Mleuq9Rw1PuoBSHhEW8WP12jEHqEHABD1EZaW9W8Je7WUq3RYrtVntJnukDI1r+p42GNNA4hn1whB0JKkLrQsommbqbK9SOK42RNsSHJBwm4ukSOoWHny50ix5xezqDOr+MXF5aAN6zsk5a/i0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rh596/urSWx2irwfcgTo0t6Yf2/ADyCle6tWyJyEFyQ=;
 b=X/5uRhPhwI2gRpwn9qcLbsSKYfdVXeoRql9gRWyvA1LkS5+UtjSTP0VlW453ZHJneBVcWCeLlaWyhZnMmgLz7SKtxI0vdCZwpry632d5a+zpj7sq1UWRi7lTlPeQnQlTPF61sjNSjIVZ/oNntILF3xc3epZkZV26k5r8NOCsH9ZC8q3lj9NStKTIAtXMXHWiGbsCIYr6J4YTLO9r6Pq1Vop7/hFt3KFYRJ8uGluxo4YyXPbDjQnLvPytHXo3Yj6PZtv8rVL6rw+/QpOjLJlHs1x5mtFI29wlVsnO5bS21FStcTyFG/F27RGDs9amUfK3ndgTGgRE3J+/ipxvrurcsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rh596/urSWx2irwfcgTo0t6Yf2/ADyCle6tWyJyEFyQ=;
 b=EwtZ+MSB9qCON6wW1HT5dr7Iukp8RboAf/qeNXJ9nmg3A+n/uyyk9bz2//QJf0lUEuB1dIY+Ffaf0wE38DiRCryRfV5xDXa1AX8zxYVAHVuT3wmmt+rgAnfjQGsdX+KsM5jgbrQ60jvJxNHFU2wAHf+3pIqy8MpeGeXygLIo0MQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSOPR01MB12409.jpnprd01.prod.outlook.com (2603:1096:604:2da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 11:29:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 11:29:15 +0000
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
Thread-Index:
 AQHaxvl1VmkioavocEOGYVCwgbbtfLHcsPSAgAAbwoCAAAXZcIAAAqEAgAAAkfCAAAI1gIAAAhDQgAAi5QCAAAElIIAAD5mAgAAAQqA=
Date: Fri, 28 Jun 2024 11:29:15 +0000
Message-ID:
 <TY3PR01MB11346B97813661374F72A677986D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346EF9A001F68162148B70F86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <6289f329-118f-4970-a525-75c3a48bd28b@tuxon.dev>
 <TY3PR01MB1134603F92C72D9B6C6C3733C86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2f162986-33c5-4d80-958c-4f857adaad20@tuxon.dev>
 <TY3PR01MB11346CA73575CF61B2024F3B386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <79c26030-4b92-4ef3-b8ce-d011f492161b@tuxon.dev>
 <TY3PR01MB11346A2DFBD7FE81337A748D386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20ff64a8-e619-4281-894f-1aa08ea67f18@tuxon.dev>
 <TY3PR01MB1134678E3A8485DB152BD66D386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ae2223f8-4058-4bd1-b480-ed2b4b1d526f@tuxon.dev>
In-Reply-To: <ae2223f8-4058-4bd1-b480-ed2b4b1d526f@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSOPR01MB12409:EE_
x-ms-office365-filtering-correlation-id: 111bf363-884c-4d3b-9aec-08dc97658ad9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cXkvYzg3amhsSEhRLzFmWnFqVFYwck4rRGdKQjhHUm9IQ2JueE9EQVgxS2Mx?=
 =?utf-8?B?YlZ3WXRLVGdPbmxZSE9pNU13Z1RNSzRiMUZIWkR4UC9pVVhLMHRTbEhmV0tE?=
 =?utf-8?B?SW5xdlZGYjRCVnlHZXJQUWVka2hmb1QzMTh3eCtrQVVCcFpkUGVldURuNHV2?=
 =?utf-8?B?dmg0NCtwa3VCeHVqWmNtY3MyNHlMc1pCdGl5SmlNWVpVeXkwRFllNnNWTTVD?=
 =?utf-8?B?Sm9aQ1NiQ0FINVFhM3k5RHppc3hOMGlkTGJGNzlPU0NrdjM2RHdxK2gzZzJ4?=
 =?utf-8?B?Tzc4ZlV5TG9FSWtnNXdlVXdHdXRaWlMxaTFBakFlUW1ISC92OU9Fb1AxUWNE?=
 =?utf-8?B?ZU1FTmJKTU81T0pDcERiNmxpejJVNXYxQ1hZSXdGU2N5UzgyVmgvRFZFMk9D?=
 =?utf-8?B?MXBmMTVEUW8weTRUcFlzd05obnNvWkEyMXVEeTcvZ2I2TElVSWttc3lMWmRz?=
 =?utf-8?B?b29DdmNjODgrRG1ZY2hndW9maGREWm1JaDRoRlkxQkFieTd5TFhnNURwQTR2?=
 =?utf-8?B?MkJiSzNYMnA1dDRCdE9mRmJpSE1JU3lrdDU1WnBpbkdxdm5xakROTnNwSTNL?=
 =?utf-8?B?b1d1a0p0eHdMUVVpUy9yQjNDWkE0bDAza1B5elN4ZDRSUlpmdXlXWkZUb09L?=
 =?utf-8?B?c05XUDRwRGFzRUlrTEZEMllpUW5MRm14ZFZPMVVTNlBwdGFPdWlSZzBoQzBY?=
 =?utf-8?B?bTk0a1BzNXB6YTJSbkQ5WUpMNElJQVdEc0R4cE9NdU8zem1LOXM5QzhSVFVv?=
 =?utf-8?B?WktzVE1kWko2d1dCZElTOWRHQ0szK01MbTBCdGxqN3RoSnFPcTE0a1JOa1BI?=
 =?utf-8?B?STFmczV3S0padkl3SVRTL1pram8xVkZkcVZsWUF6bDkyOEhKWGgwd0tDVng1?=
 =?utf-8?B?bHdYNzFZZE1UemgxWFpHWnVoME9KVXRVSCtqYjR0VUxyampUVEJvT3k4ek1N?=
 =?utf-8?B?bmNuM1hNYmFUWndIeWVIZDVpNWtkVWwrUFhSRVdENFkzM2RZeEZLUmtways4?=
 =?utf-8?B?WU1CUjNsbVU3TUpqYUt4UjlwMlpobVE0OEx1UTQwc1hpL0M5dzcvNzdaMGor?=
 =?utf-8?B?TTB2eUZUUk1HeFlPVDRwcTFaSWhjbFM3TUIyeUZ4WndBakduWkRoQVlGUXF5?=
 =?utf-8?B?eFY0UVhoSWtlYm1scnpiNVByWC9kWXJiV0lRVlVhNUxXelhoVDVmc1hjN2xq?=
 =?utf-8?B?Umw0MFFneHJEdkJpK2pMcGtoTE5SNENQVzA3UC91eVhUdCtGQW9Qd3l4R2hZ?=
 =?utf-8?B?MWpwTWFpWC9vcUh4L2JBUHlKZVJDQU00UVltWkdZN2dvelhCSUpxSUtxWjNB?=
 =?utf-8?B?RDR5ZGRleStvKy9JRnFhM2d5MG5wWDMveGdDUi9YTHd5MUxxWE5NdHNycGhS?=
 =?utf-8?B?aDFkQ3JWUG5sYkNydjNtMDVkdXVSSTVmUDFoNVBYZ3gyb3RQU2U4Vk53LzhW?=
 =?utf-8?B?RkRsRzg5K3JFejIxWC9taXdCZldEck9teVJJWjRaQ05hMmU5WXluTmRYVWdw?=
 =?utf-8?B?NndKM1hrbFNXSCtNUk1XYytVRC84Y1dWTmJxMldTNTEvRDBDNUxsOEdXZjNV?=
 =?utf-8?B?NVBoUDl1M1dyYXd2SEphTzdvY0hJRUhBYjJUSE9rQVZreThRN2ZpYTNIOG1y?=
 =?utf-8?B?eDJLUVNGbFE1Uzl3Mm41MDQ0eWpMblRQb2VQS2FsZ0lSZGhpcjZPUmxZNWdK?=
 =?utf-8?B?SkVoY0dBSmRSWGtNTHdoN1A4MGxvU2x3TFRib2MrNDlIOFBHUG9HVWUxWUpU?=
 =?utf-8?B?bzNrT0JLS2krc0NDTFFtR0ZTdXdENzZUSEkxdExjaUxENjdaWDQ2ODRLVjIr?=
 =?utf-8?B?Zm1UVTQxb1RSUlFVcHJQbHJ6QWNORlFqVFI4YWk4YXdGVVJDd2RwaEYzK3RO?=
 =?utf-8?Q?Ixtx+u2ugM6ge?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N0ZQNGpvMU40d2t4Wkx2YW9SM3dNYTZBQ2RKa0dOTFlvL0JoZ2dFbWl2RFhC?=
 =?utf-8?B?Q3N6bzlmSklWUzFIZnM5T09UZEgybHgxcnBhaVdoZVBGMmRsSU5iRmRzaGNN?=
 =?utf-8?B?ZjZCZlovMzdCaTRKd2lCN3V0YWk0Q2wxRDF2Z0U4WlJ6SHNpUGVuKzlmbzJR?=
 =?utf-8?B?eXZocTIwTEdUS0F5d1k5TmhaUy9keVpwWG1IeFo4UU1iaDZzNzFTdG84UCtQ?=
 =?utf-8?B?Qmh1aU5XSCtWZDB4Ny9ZNit4NEU0Q0J1VlNpZk9ZQThHWUN5WkhIdnh1Q1Nu?=
 =?utf-8?B?Qnl3N0VFOXlXbnhwUnFwVTd6MnFIMUVNazN0RFF3TW8zS2JyU25PaEMwUW1q?=
 =?utf-8?B?Ykw0Ly9kOW10Zy9tbVFRbEc1OTRJZ0F5SWxIV3pqdFVoUHJ2VUl1dnlSaFJx?=
 =?utf-8?B?TmpNWmNRNjc4VnNWYmtTNDFvUE9LdEZ5d29HaXdZVWQ0cHRrVERDZFNMbnVv?=
 =?utf-8?B?L0pLSkZobXhvZVpoRElyTFVENXEreUt1OUF1TGc2L2FqMlJOQ05hOWJmTzA5?=
 =?utf-8?B?SGVhbEZzTE1SckVRcFpIbWhwbXF1aVh4V3dDRUNGcDlsY3JSaXZaanZBL1JW?=
 =?utf-8?B?ZDdKSEhvWWdaOVc3UE45b0hmdXRjM0pzVGRnV2NOeWNTQzZUMVhKZXp5ZjFy?=
 =?utf-8?B?cnFrOFY5NCsvU0EwdHVSa1NQQXJGRkh6WTFDTThGa1kraUVTRCt4VTBGaHJr?=
 =?utf-8?B?NFFnOHVua01EMVVYd0N3SEJzeVZhY1B6ZUtCd3RwdkpMMHhDWnI0TFVYVVBM?=
 =?utf-8?B?QUpBSU1iMzdnbWovdlp2UDBoY0ZaMTl6MmRIK25scy9oajV2bjNRNGhaQkNm?=
 =?utf-8?B?azRaSTI3OXJMcWxEdHRXbnd5bmZDOUZERlVjcEhjOG9xMjBDbWQrVFdhYXEz?=
 =?utf-8?B?QldKSVlaa2lUQytBbFZ3eTdUeGxkQk9HODRhaGk2VStYdDNlNDNWU0NoWTB0?=
 =?utf-8?B?KzhLbGZmdE9yQ3NBemo0bFh0RWVZUy9ZWXJobUd5eElidDN3RG1PK1BncCtx?=
 =?utf-8?B?MUZRdTN5M2N1YURhVlRTQ3ZrWGtmUkdSelc2aGFJWkFFZzV3MmdQbmJJQ0ZB?=
 =?utf-8?B?S2tpYW0rN1lmcGR5Ykt3SlNlTmFwTUdLSTdxSGhlSTVsMHpQZEFodEJ6Q29R?=
 =?utf-8?B?aTR6Qm9ubFRBZmV1c05mdWhPbi80OHVqWmVseGJicDFjZzR2djlSa1Q1TzRk?=
 =?utf-8?B?SVJlUk1WTFNwSVlZRzVZd1dmcnkrMHhkWlR4RVJMbVNpZytqUFNHRG5MVFNG?=
 =?utf-8?B?NHdsaUU5Vk5tQlR2SmtjUkFjUnRvcHpCOUZYRjZQNlBSMzUrd3dnaUp0SmFv?=
 =?utf-8?B?MU1JM25OejFpVEt0Slowb1RxNmhEUXRaSStqdFhOSTBTMTJLdjBRNjRtc3lI?=
 =?utf-8?B?TW9JdW1XVVhsaU5aR2xMY3Y0M3hZSmZTMU93aHlPOGI1WktWa21RUStWMTJB?=
 =?utf-8?B?Y09DaDZpTThSSm9qdkNKK3FqZUR3MHNObC84VkFhZFpMVUxLcEo0SElwN2hn?=
 =?utf-8?B?eUpxdUdWUFRzTWFrSnllbDBjQWkxZ1hvc256bGRsSmRiWk5GSmJXQ1VmODlB?=
 =?utf-8?B?ei9STFZPUHRlREF4YWtoTGYrbENzeElodlR6VFdNVXEvODRWZFlUM0dEYm5o?=
 =?utf-8?B?TGFaM01jbmJncDJKRStGM2tEWENwaXBJT2phRGdUQkladFlqcTlJMEUvWWpk?=
 =?utf-8?B?Z2JzSUZBdDhveDhtQVUzQmpvMmxyWjBVQUkyUStQWUxrVUpWMlZQdkVMWUZQ?=
 =?utf-8?B?b0E3ak5oSzArMzZhb0NuVm5WUG1qVXVrYk5qdEhlbjZCN0lUQ2txa1FMdU1O?=
 =?utf-8?B?UUJYVEsrUGY4a0gzVFdDZHBoZnhmZDB6d2piN1FuajBoQTdUZ1dabTU2VHBj?=
 =?utf-8?B?N3o2UzdUOE45ZTlNVVo4OTFFY0YyUlRiaXVxeTB2cW05V2drb2sybjUxUWxK?=
 =?utf-8?B?ZXF2STBocEd5NElMbkJHOElPTE5ZVXg2dERsb0xlSFJKRG1ndHBrOExnRUUz?=
 =?utf-8?B?VU5JTFlJV2dNOXVZVExMeHBJNERtS3NtK0IyMVBWTFV0Mm9qVTVlV1ZoU29Q?=
 =?utf-8?B?WGErL3J3K1ZjMXM0bjl6cjhXMXVJZGEzVjViU1RuZkxBaUhjbzk1azlkbTky?=
 =?utf-8?Q?lTgt9uNPNefdpgg9CThg4jgNF?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 111bf363-884c-4d3b-9aec-08dc97658ad9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 11:29:15.6177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uiPAD4146XsHTpWkcj9l2f68UD4pHg08DR7tUjbVZ03liPrlodYFoSqkLvYJx2DD07mV8fL9fnh+SNUWdSOVNs2PtQFliFdzVXr9HPerYtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12409

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiBGcmlkYXksIEp1
bmUgMjgsIDIwMjQgMTI6MjUgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwNy8xMl0gaTJj
OiByaWljOiBEZWZpbmUgaW5kaXZpZHVhbCBhcnJheXMgdG8gZGVzY3JpYmUgdGhlIHJlZ2lzdGVy
IG9mZnNldHMNCj4gDQo+IA0KPiANCj4gT24gMjguMDYuMjAyNCAxMzo0OSwgQmlqdSBEYXMgd3Jv
dGU6DQo+ID4gSGkgQ2xhdWRpdSwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+PiBGcm9tOiBjbGF1ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0K
PiA+PiBTZW50OiBGcmlkYXksIEp1bmUgMjgsIDIwMjQgMTE6MjUgQU0NCj4gPj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MiAwNy8xMl0gaTJjOiByaWljOiBEZWZpbmUgaW5kaXZpZHVhbCBhcnJheXMg
dG8NCj4gPj4gZGVzY3JpYmUgdGhlIHJlZ2lzdGVyIG9mZnNldHMNCj4gPj4NCj4gPj4NCj4gPj4N
Cj4gPj4gT24gMjguMDYuMjAyNCAxMToyNCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4+PiBIaSBDbGF1
ZGl1LA0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZy
b206IGNsYXVkaXUgYmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+Pj4gU2Vu
dDogRnJpZGF5LCBKdW5lIDI4LCAyMDI0IDk6MTMgQU0NCj4gPj4+PiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyIDA3LzEyXSBpMmM6IHJpaWM6IERlZmluZSBpbmRpdmlkdWFsIGFycmF5cw0KPiA+Pj4+
IHRvIGRlc2NyaWJlIHRoZSByZWdpc3RlciBvZmZzZXRzDQo+ID4+Pj4NCj4gPj4+Pg0KPiA+Pj4+
DQo+ID4+Pj4gT24gMjguMDYuMjAyNCAxMTowOSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4+Pj4+DQo+
ID4+Pj4+IEhpIENsYXVkaXUsDQo+ID4+Pj4+DQo+ID4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+Pj4+Pj4gRnJvbTogY2xhdWRpdSBiZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1
eG9uLmRldj4NCj4gPj4+Pj4+IFNlbnQ6IEZyaWRheSwgSnVuZSAyOCwgMjAyNCA5OjAzIEFNDQo+
ID4+Pj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA3LzEyXSBpMmM6IHJpaWM6IERlZmluZSBp
bmRpdmlkdWFsIGFycmF5cw0KPiA+Pj4+Pj4gdG8gZGVzY3JpYmUgdGhlIHJlZ2lzdGVyIG9mZnNl
dHMNCj4gPj4+Pj4+DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IE9uIDI4LjA2LjIwMjQg
MTA6NTUsIEJpanUgRGFzIHdyb3RlOg0KPiA+Pj4+Pj4+IEhpIENsYXVkaXUsDQo+ID4+Pj4+Pj4N
Cj4gPj4+Pj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+Pj4+Pj4gRnJvbTog
Y2xhdWRpdSBiZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPj4+Pj4+Pj4gU2Vu
dDogRnJpZGF5LCBKdW5lIDI4LCAyMDI0IDg6MzIgQU0NCj4gPj4+Pj4+Pj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MiAwNy8xMl0gaTJjOiByaWljOiBEZWZpbmUgaW5kaXZpZHVhbA0KPiA+Pj4+Pj4+
PiBhcnJheXMgdG8gZGVzY3JpYmUgdGhlIHJlZ2lzdGVyIG9mZnNldHMNCj4gPj4+Pj4+Pj4NCj4g
Pj4+Pj4+Pj4gSGksIEJpanUsDQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IE9uIDI4LjA2LjIwMjQg
MDg6NTksIEJpanUgRGFzIHdyb3RlOg0KPiA+Pj4+Pj4+Pj4gSGkgQ2xhdWRpdSwNCj4gPj4+Pj4+
Pj4+DQo+ID4+Pj4+Pj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+Pj4+Pj4+
PiBGcm9tOiBDbGF1ZGl1IDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+Pj4+Pj4+Pj4g
U2VudDogVHVlc2RheSwgSnVuZSAyNSwgMjAyNCAxOjE0IFBNDQo+ID4+Pj4+Pj4+Pj4gU3ViamVj
dDogW1BBVENIIHYyIDA3LzEyXSBpMmM6IHJpaWM6IERlZmluZSBpbmRpdmlkdWFsIGFycmF5cw0K
PiA+Pj4+Pj4+Pj4+IHRvIGRlc2NyaWJlIHRoZSByZWdpc3RlciBvZmZzZXRzDQo+ID4+Pj4+Pj4+
Pj4NCj4gPj4+Pj4+Pj4+PiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpA
YnAucmVuZXNhcy5jb20+DQo+ID4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+PiBEZWZpbmUgaW5kaXZp
ZHVhbCBhcnJheXMgdG8gZGVzY3JpYmUgdGhlIHJlZ2lzdGVyIG9mZnNldHMuIEluDQo+ID4+Pj4+
Pj4+Pj4gdGhpcyB3YXkgd2UgY2FuIGRlc2NyaWJlIGRpZmZlcmVudCBJUCB2YXJpYW50cyB0aGF0
IHNoYXJlIHRoZQ0KPiA+Pj4+Pj4+Pj4+IHNhbWUgcmVnaXN0ZXIgb2Zmc2V0cyBidXQgaGF2ZSBk
aWZmZXJlbmNlcyBpbiBvdGhlciBjaGFyYWN0ZXJpc3RpY3MuDQo+ID4+Pj4+Pj4+Pj4gQ29tbWl0
IHByZXBhcmVzIGZvciB0aGUgYWRkaXRpb24NCj4gPj4+Pj4+Pj4gb2YgZmFzdCBtb2RlIHBsdXMu
DQo+ID4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5l
YQ0KPiA+Pj4+Pj4+Pj4+IDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4gPj4+
Pj4+Pj4+PiAtLS0NCj4gPj4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4+IENoYW5nZXMgaW4gdjI6DQo+
ID4+Pj4+Pj4+Pj4gLSBub25lDQo+ID4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+PiAgZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1yaWljLmMgfCA1OA0KPiA+Pj4+Pj4+Pj4+ICsrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tDQo+ID4+Pj4+Pj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNl
cnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkNCj4gPj4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXJpaWMuYw0KPiA+Pj4+Pj4+Pj4+IGIv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yaWljLmMgaW5kZXgNCj4gPj4+Pj4+Pj4+PiA5ZmUwMDc2
MDkwNzYuLjhmZmJlYWQ5NTQ5MiAxMDA2NDQNCj4gPj4+Pj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLXJpaWMuYw0KPiA+Pj4+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtcmlpYy5jDQo+ID4+Pj4+Pj4+Pj4gQEAgLTkxLDcgKzkxLDcgQEAgZW51bSByaWljX3Jl
Z19saXN0IHsgIH07DQo+ID4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+PiAgc3RydWN0IHJpaWNfb2Zf
ZGF0YSB7DQo+ID4+Pj4+Pj4+Pj4gLQl1OCByZWdzW1JJSUNfUkVHX0VORF07DQo+ID4+Pj4+Pj4+
Pj4gKwljb25zdCB1OCAqcmVnczsNCj4gPj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+
Pj4gU2luY2UgeW91IGFyZSB0b3VjaGluZyB0aGlzIHBhcnQsIGNhbiB3ZSBkcm9wIHN0cnVjdCBh
bmQgVXNlDQo+ID4+Pj4+Pj4+PiB1OCogYXMgZGV2aWNlX2RhdGEgaW5zdGVhZD8NCj4gPj4+Pj4+
Pj4NCj4gPj4+Pj4+Pj4gUGF0Y2ggMDkvMTIgImkyYzogcmlpYzogQWRkIHN1cHBvcnQgZm9yIGZh
c3QgbW9kZSBwbHVzIiBhZGRzIGENCj4gPj4+Pj4+Pj4gbmV3IG1lbWJlciB0byBzdHJ1Y3QNCj4g
Pj4+Pj4+IHJpaWNfb2ZfZGF0YS4NCj4gPj4+Pj4+Pj4gVGhhdCBuZXcgbWVtYmVyIGlzIG5lZWRl
ZCB0byBkaWZmZXJlbnRpYXRlIGIvdyBoYXJkd2FyZQ0KPiA+Pj4+Pj4+PiB2ZXJzaW9ucyBzdXBw
b3J0aW5nIGZhc3QgbW9kZSBwbHVzIGJhc2VkIG9uIGNvbXBhdGlibGUuDQo+ID4+Pj4+Pj4NCj4g
Pj4+Pj4+PiBBcmUgd2Ugc3VyZSBSWi9BIGRvZXMgbm90IHN1cHBvcnQgZmFzdCBtb2RlIHBsdXM/
DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gRnJvbSBjb21taXQgZGVzY3JpcHRpb24gb2YgcGF0Y2ggMDkv
MTI6DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gRmFzdCBtb2RlIHBsdXMgaXMgYXZhaWxhYmxlIG9uIG1v
c3Qgb2YgdGhlIElQIHZhcmlhbnRzIHRoYXQgUklJQw0KPiA+Pj4+Pj4gZHJpdmVyIGlzIHdvcmtp
bmcgd2l0aC4gVGhlIGV4Y2VwdGlvbiBpcyAoYWNjb3JkaW5nIHRvIEhXIG1hbnVhbHMNCj4gPj4+
Pj4+IG9mIHRoZSBTb0NzIHdoZXJlIHRoaXMgSVAgaXMNCj4gPj4+PiBhdmFpbGFibGUpIHRoZSBS
ZW5lc2FzIFJaL0ExSC4NCj4gPj4+Pj4+IEZvciB0aGlzLCBwYXRjaCBpbnRyb2R1Y2VzIHRoZSBz
dHJ1Y3QgcmlpY19vZl9kYXRhOjpmYXN0X21vZGVfcGx1cy4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBJ
IGNoZWNrZWQgdGhlIG1hbnVhbHMgb2YgYWxsIHRoZSBTb0NzIHdoZXJlIHRoaXMgZHJpdmVyIGlz
IHVzZWQuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gSSBoYXZlbid0IGNoZWNrZWQgdGhlIEgvVyBtYW51
YWw/DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gT24gdGhlIG1hbnVhbCBJJ3ZlIGRvd25sb2FkZWQgZnJv
bSBSZW5lc2FzIHdlYiBzaXRlIHRoZSBGTVBFIGJpdA0KPiA+Pj4+Pj4gb2YgUklJQ25GRVIgaXMg
bm90IGF2YWlsYWJsZSBvbiBSWi9BMUguDQo+ID4+Pj4+DQo+ID4+Pj4+IEkganVzdCBmb3VuZCBS
Wi9BMk0gbWFudWFsLCBpdCBzdXBwb3J0cyBGTVAgYW5kIHJlZ2lzdGVyIGxheW91dCBsb29rcyBz
aW1pbGFyIHRvIFJaL0cyTC4NCj4gPj4+Pg0KPiA+Pj4+IEkgaW50cm9kdWNlZCBzdHJ1Y3Qgcmlp
Y19vZl9kYXRhOjpmYXN0X21vZGVfcGx1cyBiZWNhdXNlIG9mIFJaL0ExSC4NCj4gPj4+DQo+ID4+
PiBNYXliZSBtYWtlIHRoZSByZWdpc3RlciBsYXlvdXQgYXMgcGVyIFNvQw0KPiA+Pj4NCj4gPj4+
IFJaL0ExIC0tPiAmcmlpY19yel9hX2luZm8NCj4gPj4+IFJaL0EyIGFuZCBSWi97RzJMLEcyTEMs
VjJMLEcyVUwsRklWRX0gLS0+ICZyaWljX3J6X2cyX2luZm8gUlovRzNTDQo+ID4+PiBhbmQgUlov
VjJIIC0tPiAmcmlpY19yel92MmhfaW5mbw0KPiA+Pg0KPiA+PiBTb3JyeSwgYnV0IEkgZG9uJ3Qg
dW5kZXJzdGFuZC4gUGF0Y2ggMDkvMTIgYWxyZWFkeSBkb2VzIHRoYXQgYnV0IGENCj4gPj4gYml0
DQo+ID4+IGRpZmZlcmVudGx5Og0KPiA+DQo+ID4gTm93IHJlZ2lzdGVyIGxheW91dCBpcyBhZGRl
ZCB0byBkaWZmZXJlbnRpYXRlIHRoZSBTb0NzIGZvciBhZGRpbmcNCj4gPiBzdXBwb3J0IHRvIFJa
L0czUyBhbmQgdGhpcyBsYXlvdXQgc2hvdWxkIG1hdGNoIHdpdGggdGhlIGhhcmR3YXJlIG1hbnVh
bCBmb3IgYWxsIHN1cHBvcnRlZCBTb0NzLg0KPiA+IEN1cnJlbnRseSBpdCBpcyB3cm9uZyBmb3Ig
UlovQTIgU29DLCB3aGlsZSB5b3UgZml4ZWQgaXQgZm9yIGFsbCBvdGhlciBTb0NzLg0KPiANCj4g
SSBjaGVja2VkIFJaL0EyTS4gVGhlcmUgaXMgbm90aGluZyBicm9rZW4uIFRoZSBvbmx5IHRoaW5n
IHRoYXQgSSBzZWUgaXMgdGhhdCB0aGUgRlArIGlzIG5vdCBlbmFibGVkDQo+IG9uIFJaL0EyTSAo
cGxlYXNlIGxldCBtZSBrbm93IGlmIHRoZXJlIGlzIGFueXRoaW5nIGVsc2UgSSBtaXNzZWQpLiBJ
IGRvbid0IHNlZSB0aGlzIGJyb2tlbi4gSXQgaXMNCj4gdGhlIHNhbWUgYmVoYXZpb3IgdGhhdCB3
YXMgYmVmb3JlIHRoaXMgcGF0Y2guDQoNCkFzIHBlciBSWi9BMk0gaGFyZHdhcmUgbWFudWFsLCBJ
Q0ZFUiByZWdpc3RlciBpcyBwcmVzZW50DQoNCldoaWxlIGFzIHBlciBbMV0sIHlvdSBkb24ndCBo
YXZlIHRoaXMgcmVnaXN0ZXIuIFNvIGFjY29yZGluZyB0byBtZSBSWi9BMiBTb0MgcmVnaXN0ZXIN
CmxheW91dCBpcyBicm9rZW4gYW5kIGl0IGlzIHNhbWUgYXMgUlovQTEuDQoNClsxXQ0KaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJlbmVzYXMtc29jL3BhdGNoLzIw
MjQwNjI1MTIxMzU4LjU5MDU0Ny0xMC1jbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbS8N
Cg0KQ2hlZXJzLA0KQmlqdQ0K

