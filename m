Return-Path: <linux-i2c+bounces-4360-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 638BB9178DC
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 08:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99E2BB239B0
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 06:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41FE14D710;
	Wed, 26 Jun 2024 06:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qnbHfM3n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2082.outbound.protection.outlook.com [40.107.113.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EF514D2A4;
	Wed, 26 Jun 2024 06:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719383022; cv=fail; b=Ia6ExXyosYtsz/dKVDMta0q9K0edylqvm2wusONDWJjOxKU7zY8i6RJrV9hzqQ+Idx3cdDXv419fViWjQeMqheN95z/tf6zGZnp6aHoSHBXN8QbBW6RZnp6AwG3nMMR8QarrzWiuOKG25TMUzqaTsueCDNU+9Arh4uLAnnd06Rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719383022; c=relaxed/simple;
	bh=qc9iJSxRwmcmQAVWUNDNe7hF6iLFZr2L9WAEr1V3AC8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ah7TcQg5qd+GQsH5lsvMPVKFGNEXfxNIt2G0kHneQwwQx8D/svgO3u1eySoVwiZOr4od3SVcoA+Oi8yq0GQxzMPEcufE0Ty4jlt7clpOea9lWy1Fa8Y1oZoA0Ofs9b4EEOLbZQUuMVjQqUljJEtd6yI+bnAWsAKezQc0SU3ahgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qnbHfM3n; arc=fail smtp.client-ip=40.107.113.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTEWO8j1EUyO6uWdGvAtBpFiQD7dRuQD01DpkSzD8h/OlYrEYkr75c2j0ZFgmMSoGEGxLhR382RnXVhHN3Cx6XO//sI7mvjkNNfgCEyd2fXyumEyHwx0y7XLgb6wRs20DGDNOKPTpofqV24G17amwBYkBooYLiCrIMEayK/XYH2u3KbJ/ftWEV1aXXEX1koNztCtfxFwOHsAeibrKsB1Z5g8VI9XNvH8DM4Sz1RuK3cbeTjFJJD8n/usMzYBYMpNCEqsyz55AZ4aLnSOyVqjWilq1SBNrapBRdg6rrwQb823Zgnyfz+HPCCuNLnZWIYFmR02tswDlickW8Cs3F9Vnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qc9iJSxRwmcmQAVWUNDNe7hF6iLFZr2L9WAEr1V3AC8=;
 b=h9DWLc9FkJAw3QiWqesVMsR2JNWSZyU9drCuIVHzUqIxSzcN7XKExBk08dwhvjh1z6edFBF0KffmG7zYzL6OUnDyayxjQtQfpLhLHGFEI+pqOHf1ZE3s/LkcnnXbocHWl3Ly+mxrn5ZXrKIsnjo4WQTs1mvwWuw7Y0kTfdoC2NGFQFdr2rpXxGgUhRN/nieKdP0s5KobXKy9RaOh3ahR4VVxiC6UiCvHsj71TuWLe2TUJIKOzmNXBZuzFRCv9k+98W5Is0J3RBOc5Pv/ms/ZRWUQxKIMAOnxBj4L3lTyVD9xm4Pwkpm17EYR/va3ipwG01nP+S81BXEEnGvnzjY/JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qc9iJSxRwmcmQAVWUNDNe7hF6iLFZr2L9WAEr1V3AC8=;
 b=qnbHfM3nzPvkyWLZsKkcXERnrT4vauKP4ROGAzOi9M+dnfa2WzBxenAlaxe1xUOlNAuOf0hmxRbKtfhbHGWUvrXU86JacU5aO3aqMfW89kGBAqkSGLYgnboC9vdH3NgFvd21bq/lcIC5kqql2W0ZWT1wUgX1LigB1OhoyVJKMxY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12396.jpnprd01.prod.outlook.com (2603:1096:405:106::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 06:23:35 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 06:23:35 +0000
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
Subject: RE: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Thread-Topic: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Thread-Index: AQHaxvlYh4jiRKyfj0yWu87XUamtbLHYoIVQgADxhACAAAGdYA==
Date: Wed, 26 Jun 2024 06:23:35 +0000
Message-ID:
 <TY3PR01MB11346A47493E0EE96CB2CF17B86D62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-5-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346F03386D05D608041DE8D86D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <14167607-e67b-4627-99f0-6e99acc7f880@tuxon.dev>
In-Reply-To: <14167607-e67b-4627-99f0-6e99acc7f880@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12396:EE_
x-ms-office365-filtering-correlation-id: 14062316-6b88-4f56-c182-08dc95a88231
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230038|366014|376012|7416012|1800799022|921018|38070700016;
x-microsoft-antispam-message-info:
 =?utf-8?B?V2tZZTRjUzQrL05vSUlwK00rZFhKQ1ZUL0FyTWprYnVjRzArUStBSlFQOXZr?=
 =?utf-8?B?ZnJGTXhuc2FuU3JVdFlsQmYvc1pBdG5GS08yd3VUTmE4emEwZDBGekFrQVpt?=
 =?utf-8?B?MThlWnhuemFyejQxc0drZHlZbVA3d2dHU2JjR1ozRUYyZk5JaFZuV09ZZmhB?=
 =?utf-8?B?WHlUV3Q2ZVUrbUt5cTlXVDFJOFowVElNZ1dBTXRVRk9mOXlWRG1HSCt6Nnhq?=
 =?utf-8?B?S3cxMVZzSGxFZzdZYm9ESHBFUUlRcGt6VVNCaE52TlFrRjhkdUVMR0xneVM1?=
 =?utf-8?B?L0tJZzl2blQvR3I1bzl0TVFXb0xORWtiWi9idmdnU25PVkZKL3BqUW1UNjVK?=
 =?utf-8?B?TGY1Q3dzeTVmVU53WldBc3pRNlhMODMza1g0VStnOEo4YWFKai9iWmdYR1RC?=
 =?utf-8?B?RjEyK2VkSEhWS3N3OG5CK2ZPR2N6c2paa3c5dXFwMVhzdWxzM1dUK29keGJs?=
 =?utf-8?B?TmVYL1lCSFh5RFRRMHRpa3B6NDBjRlRPSHdlL2g4U0xrZ0ZsekZiMTdPaUps?=
 =?utf-8?B?RnhmVzQrdVNJWnpFcTc2emRWR3BQWDlybTJPR0NhTUhwRThSOGIzeGNxcjRJ?=
 =?utf-8?B?dS96MWVRSG9XMk1oeldORVVEWXByV1p4dTFmVk5IR0EvVTZ0SWtoRkxBUTNk?=
 =?utf-8?B?VGw3RDZ4K1BGUzBHenkxQWk0RHRUS2d1M0xzcERMWUFCS3d4cm5HZk1JWUNS?=
 =?utf-8?B?dkZNNFY1TW5WSEFNYnZaandHZWdnbElPZzNGMlJZWVUrRnZOMzJacU92REtH?=
 =?utf-8?B?VGl3UWEvT3c1MU91MG15U2ZIeTgwRFVUbmltRGtPcTRmaTlGR1NPNDRjRjFx?=
 =?utf-8?B?bnBNaEw1Vk9DYUw0TkVBOUZrdUdidlVNQUlFR09LUzZrM3ZheUNJZENXWkFQ?=
 =?utf-8?B?WlUxQ3p1bThDT0xzMkxGY0N3WXN5KzVtS2xFY28yNTQra2R4TkdJaDVSdFRs?=
 =?utf-8?B?NDc1ZXEyUVlYeDBuQlFnb2JRcG9JalhIUjhoOFphdnZEOXNhMURiZ3VMaHRQ?=
 =?utf-8?B?RlFtZGVGeTBuRTNYNzcybExoTHdZYUlzcXVnOXZmUFd5dWF4SDBoVFBkbmtD?=
 =?utf-8?B?MzNhaCtJeU9wS0NoTWttT3JTeW54eG1OSU9kOG5oUFhYVkI2SEIwZzVNTjJD?=
 =?utf-8?B?Sms4ODhyZnZoV3lBK08xbkE5YzdoTmZqZ3g0Rlg2OFJ3YXNuajhIVGUzZW13?=
 =?utf-8?B?MzhadUs3ZktOWDBVNmtNdjhUSnVzaUg4MUhTdGRmRlV1VW5JS3p3NjZRUFdp?=
 =?utf-8?B?a1dTQmpoOVJuME1ZYmtGZHBqUUh4WkxaampWQ2doT255K3BhME9XWjljZWZl?=
 =?utf-8?B?c2dkaDBZYnhYaHAwcmxvZ1NrbkYrcEhMV3JkT3B3NFEva0dRblNtYnMwOGJU?=
 =?utf-8?B?ai9sc2VBUjFPdnpUTENGbFRYOWtqSzFrVXJrbHdueS9hVE5tcjNTZ20vZXNN?=
 =?utf-8?B?TDVlL2NJSHFnOGJSOE55cXNnZ0IzdGxVbENGNk8vaCtsS2V0LzdSRlNXbXhi?=
 =?utf-8?B?SVVNcWEvN3A3RWxLTmlITzFtc1pBd3UzQ2FmZWR6NW5DVFM0TzBhU1NCaWEw?=
 =?utf-8?B?eWxZQWJtRUo2VHZhaEY5SXpMU3NlN05wVVJ3cmVGM0syNUdZNTZoWlhRQ2Vy?=
 =?utf-8?B?NXdzUkIvc0JPQVdQcXY4T0VOaHVRVThHTVpCS1FDQWVBSmtkbnFvRVFTd3Ju?=
 =?utf-8?B?UkpuRWNQVXk1ckpUcXdmRHRmMURHcFh0Z3ZuTVc1OTAwbzA4MlFVRWxFeFJn?=
 =?utf-8?B?TnFTU1NlQ0pkZ0NLUDgrWUNoT3F5MGpYNDVFVVpzYnNCaXhrbCt3cHp6S2RD?=
 =?utf-8?B?NW15K1hRSGQ1QjZndEF3Zz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(376012)(7416012)(1800799022)(921018)(38070700016);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZVY1eVMvRm9uSEtsWWJaeFdKOVhhNzdLS0trSHJXVzFXNURHSTdwL0lSd3RE?=
 =?utf-8?B?b09YRU8zM25TV3Y0QUF3T1hFQUV4YXRJVU9oeC9ob1gxbk9TajlSYm9kT1RB?=
 =?utf-8?B?NXZaUjRBYVN5N3hRRGVFM1FRSUJyZGVuL1dreTZUejZPMlBOZTNWc2hSS0dS?=
 =?utf-8?B?cERBSDB5QzhYbEVMTEhMSEtpM3dXZENtbnRUdi84bnp0d0FQU0dkQUhZWTZX?=
 =?utf-8?B?SmpRMGxnbE1DWFBxaGdFTWJla2VjOHFtRkZrWXV1eVNBMnFBeWxnOU1sMXN1?=
 =?utf-8?B?bTNTdVVCZ1hCRGY3cElrRExqQzVQSkJrWm1WcjhiOUo2aUJ6enIyb3I4UDhM?=
 =?utf-8?B?Q2g3bXZZTEIva3V1anhLOXB2V1lpWTFUMDBNQ0xxMStVQXFQWm44MU5JcUpr?=
 =?utf-8?B?Q1Y0Y3lsYnZHVi85cXgzREhmOU8zYnpmenJNdk1VOEZyQzFQRG50a29VV0x1?=
 =?utf-8?B?MmdFV050Z3p1UDB0S0ljZjYxeHl2YjM1cmZxZmpyczJUMzdPOWZRYWwxMUl0?=
 =?utf-8?B?SHI4bnVHcDE3ZFBYMFZISlBCblpTVEVkbmt0TG0wRkRNVWpDRXlnZlV2SnB4?=
 =?utf-8?B?SlJPbmdKalZUaGxKczFhU1VpNEdrZ2ZJS1N2cUNIQUVXZXYrdWZ6czRhOVNo?=
 =?utf-8?B?bjNqWVB6TTBiNFhvOFZkcktVeHFXZmRCVFRseHBoemM2ZjR2UFZLVEdZNnZV?=
 =?utf-8?B?SEtPb0ZFNVczdVNlTGx2VTM1Slp5R0pBNW40WGRHdSswbnVtN0Eya25vak9V?=
 =?utf-8?B?eGRTc05wa0pzZW5rbGxkUnhqMzV6ZFJNTFpWd3NZWWdmQ3pya3M4UDRySjZy?=
 =?utf-8?B?M0l5VFRzWExYVVRYdEU1ZDNYcmdtQW1WQ2VBTHh2MzU1QWY5aUJzQlpsMHla?=
 =?utf-8?B?YTJnSEZ1L2FZa2pPT2Zua2h4UmJGcHRNWHp0WGlHaXc0LytLeXhoM01WSnRP?=
 =?utf-8?B?cUlkODUrOEJRRnZPSU9nOWtoN1Z1VDNudTVIM1VYMnRYWVhsYnlMSTN4VEg0?=
 =?utf-8?B?aithN1lSWm50YzMzeW1XemdEdlQwcnNKVnlxR2QvMFZJY0lja1grQzc3bVFP?=
 =?utf-8?B?MjR4MkhzK2x1YnQ3a0J5NGE0cWNPV1A5Tkt1V2YyQ1RIYXB4M2ZHZjh3dkh0?=
 =?utf-8?B?RzVnaVFHckdua2haMXQ3Z2VERDIyV2NYMjQrRTN4a2FheGJIZWZJY2REL1Fa?=
 =?utf-8?B?Tlo2WWJ2b093UGtWTFUvbU4yMld3VHc1WFg5ZW1yQ20vUDd2Y3d4cUxRWDNj?=
 =?utf-8?B?ZDJEaG00Z2RzZ2NBbEFkSVY5YndzVTBCSHZQeEdkOTlHTDJ4VUUwcnpFcFZa?=
 =?utf-8?B?K1JzVTNjNW5ud1hxY3hOdXluZlpmQjlTQVZuTlErMWlRM2xGQWY0ODJBZFV6?=
 =?utf-8?B?OGZGYnMvQ1FLUjFBT3R4elJJMHB6WnlYeEk4bmg3TDYydUhBMFlSbWVtYUJJ?=
 =?utf-8?B?VmFEdUdCYVZzK0ZXcmFzUXlRNXRzTXFYY3liSk9YNDI4TXd2aTV3c1VsaVhN?=
 =?utf-8?B?RzJRMlBFRytSTjhFaXd0b0JsN0RwcndETGR5VlNNd2EraFJvVXQxamgxeXJJ?=
 =?utf-8?B?eXRVYXl2NE9nTGQva3QreFV2MFJYSTBPWkZCMEE0QXU3TUlNOGVYRTVpbUU1?=
 =?utf-8?B?Y1BkMC9vUWJxanQ1VVJzaElTT0JUMEVoeWpYbFkrLzVNTjgxTGlMeEhzWFRU?=
 =?utf-8?B?NEIrQWVpNzBLN2ZXS1luMFkzaW5HY2lzK05lcVBmQXRmbk1ZVmNSUi9INFYw?=
 =?utf-8?B?UjY3YitiMHdkdThkN0Jka3N6VjYrUy93Q0pGWE9TM2cxR09kTVVvZzdqQjZU?=
 =?utf-8?B?TTFHQm94RWlSNndtek5mZE1CajZPZThwanU1aDR4VFJiRVk4UjVlRUY1dUU4?=
 =?utf-8?B?YnJMUmtKTlNqVzAwWk5pcExmaU1qOVlxMHhsaTFrYVFBZ3VVWFVGdzFiZ09s?=
 =?utf-8?B?bjM5ZTNaUS83V0E1ZVVRZlpDLzd4VGNNKzRndWRQYVNYaWtJYmlvRHI0dTZE?=
 =?utf-8?B?T1VtUDN4Q1JJR1lZVTJsTkVDZVBuZDR5ZG9qcENwb2R5NFhaSWdxaGdkeGtV?=
 =?utf-8?B?bXg3OFJVQTdsaWlVRkRSMkdTWmEvQzdpQ0ZPUkdOaTFnbCtBTktzQktTMnFl?=
 =?utf-8?B?NVZycXB5WE44Wno1ZVVlampSQy8vdEtFVnlVelFiV3MxY29IeUIyRWlucGJi?=
 =?utf-8?B?Tmc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 14062316-6b88-4f56-c182-08dc95a88231
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 06:23:35.1058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RfN/l63VEKP0lZeHwwo+Ni0+qpuyOCkzxFL7LLM2VsbeJX4bx/9TrBMvwSam2hOk2I92utMCnms3VdIk3h07Yb76l5i+W4JNZaCYm06dLvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12396

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogY2xhdWRpdSBiZXpuZWEg
PGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDI2LCAy
MDI0IDc6MTQgQU0NCj4gVG86IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT47
IENocmlzIEJyYW5kdCA8Q2hyaXMuQnJhbmR0QHJlbmVzYXMuY29tPjsNCj4gYW5kaS5zaHl0aUBr
ZXJuZWwub3JnOyByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRA
a2VybmVsLm9yZzsNCj4gZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU7IG1hZ251cy5kYW1tQGdtYWls
LmNvbTsgbXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb207IHNib3lkQGtlcm5lbC5vcmc7DQo+IHAuemFi
ZWxAcGVuZ3V0cm9uaXguZGU7IHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tDQo+IENj
OiBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWkyY0B2Z2VyLmtlcm5l
bC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnOyBDbGF1ZGl1IEJlem5lYQ0KPiA8
Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djIgMDQvMTJdIGkyYzogcmlpYzogVXNlIHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoKQ0KPiAN
Cj4gSGksIEJpanUsDQo+IA0KPiBPbiAyNS4wNi4yMDI0IDE4OjUzLCBCaWp1IERhcyB3cm90ZToN
Cj4gPiBIaSBDbGF1ZGl1LA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4+IEZyb206IENsYXVkaXUgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPj4gU2VudDog
VHVlc2RheSwgSnVuZSAyNSwgMjAyNCAxOjE0IFBNDQo+ID4+IFN1YmplY3Q6IFtQQVRDSCB2MiAw
NC8xMl0gaTJjOiByaWljOiBVc2UgcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpDQo+ID4+DQo+
ID4+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNv
bT4NCj4gPj4NCj4gPj4gcG1fcnVudGltZV9nZXRfc3luYygpIG1heSByZXR1cm4gd2l0aCBlcnJv
ci4gSW4gY2FzZSBpdCByZXR1cm5zIHdpdGgNCj4gPj4gZXJyb3INCj4gPj4gZGV2LT5wb3dlci51
c2FnZV9jb3VudCBuZWVkcyB0byBiZSBkZWNyZW1lbnRlZC4NCj4gPj4gZGV2LT5wbV9ydW50aW1l
X3Jlc3VtZV9hbmRfZ2V0KCkNCj4gPj4gdGFrZXMgY2FyZSBvZiB0aGlzLiBUaHVzIHVzZSBpdC4N
Cj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVh
LnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+PiAtLS0NCj4gPj4NCj4gPj4gQ2hhbmdlcyBpbiB2MjoN
Cj4gPj4gLSBkZWxldGUgaTJjIGFkYXB0ZXIgYWxsIHRoZSB0aW1lIGluIHJlbW92ZQ0KPiA+Pg0K
PiA+PiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yaWljLmMgfCAzMCArKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0NCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1yaWljLmMNCj4gPj4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXJpaWMuYyBpbmRleCA4
M2U0ZDVlMTRhYjYuLjAwMmIxMWIwMjBmYQ0KPiA+PiAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1yaWljLmMNCj4gPj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1yaWljLmMNCj4gPj4gQEAgLTExMyw2ICsxMTMsOCBAQCBzdHJ1Y3QgcmlpY19pcnFfZGVzYyB7
DQo+ID4+ICAJY2hhciAqbmFtZTsNCj4gPj4gIH07DQo+ID4+DQo+ID4+ICtzdGF0aWMgY29uc3Qg
Y2hhciAqIGNvbnN0IHJpaWNfcnBtX2Vycl9tc2cgPSAiRmFpbGVkIHRvIHJ1bnRpbWUNCj4gPj4g
K3Jlc3VtZSI7DQo+ID4+ICsNCj4gPj4gIHN0YXRpYyBpbmxpbmUgdm9pZCByaWljX3dyaXRlYihz
dHJ1Y3QgcmlpY19kZXYgKnJpaWMsIHU4IHZhbCwgdTggb2Zmc2V0KSAgew0KPiA+PiAgCXdyaXRl
Yih2YWwsIHJpaWMtPmJhc2UgKyByaWljLT5pbmZvLT5yZWdzW29mZnNldF0pOyBAQCAtMTMzLDEw
DQo+ID4+ICsxMzUsMTQgQEAgc3RhdGljIGludCByaWljX3hmZXIoc3RydWN0IGkyY19hZGFwdGVy
ICphZGFwLCBzdHJ1Y3QgaTJjX21zZyBtc2dzW10sIGludCBudW0pDQo+ID4+ICAJc3RydWN0IHJp
aWNfZGV2ICpyaWljID0gaTJjX2dldF9hZGFwZGF0YShhZGFwKTsNCj4gPj4gIAlzdHJ1Y3QgZGV2
aWNlICpkZXYgPSBhZGFwLT5kZXYucGFyZW50Ow0KPiA+PiAgCXVuc2lnbmVkIGxvbmcgdGltZV9s
ZWZ0Ow0KPiA+PiAtCWludCBpOw0KPiA+PiArCWludCBpLCByZXQ7DQo+ID4+ICAJdTggc3RhcnRf
Yml0Ow0KPiA+Pg0KPiA+PiAtCXBtX3J1bnRpbWVfZ2V0X3N5bmMoZGV2KTsNCj4gPj4gKwlyZXQg
PSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGRldik7DQo+ID4+ICsJaWYgKHJldCkgew0KPiA+
PiArCQlkZXZfZXJyKGRldiwgcmlpY19ycG1fZXJyX21zZyk7DQo+ID4NCj4gPiBBcyBhdCB0aGUg
bW9tZW50IHdlIGRvbid0IGtub3cgaG93IHRvIHJlcHJvZHVjZSB0aGlzIGVycm9yIGNvbmRpdGlv
bg0KPiA+IENhbiB3ZSB1c2UgV0FSTl9PTl9PTkNFKCkgaW5zdGVhZCB0byBjYXRjaCBkZXRhaWxl
ZCBlcnJvciBjb25kaXRpb24gaGVyZT8/DQo+IA0KPiBbMV0gc3RhdGVzICJTbywgbmF0dXJhbGx5
LCB1c2Ugb2YgV0FSTl9PTigpIGlzIGFsc28gbm93IGRpc2NvdXJhZ2VkIG11Y2ggb2YgdGhlIHRp
bWUiLiBJJ3ZlIGdvIHdpdGgNCj4gZGV2X2VycigpIG9yIHNvbWV0aGluZyBzaW1pbGFyLg0KDQpX
QVJOX09OX09OQ0UoKSBzaG91bGQgYmUgb2sgSSBndWVzcyBhcyBwZW9wbGUgYXJlIHVzaW5nIGZv
ciBwcmludGluZyB0aGlzIGluZm8gb25seSBvbmNlPz8NCg0KQ3VycmVudGx5IHdlIGRvbid0IGtu
b3cgaG93IHRvIHRyaWdnZXIgcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpIGVycm9yIA0KY29u
ZGl0aW9uIGluIG91ciBzZXR1cCB1c2luZyBhIHRlc3RhcHAgYW5kIHdlIGFyZSBleHBlY3Rpbmcg
YW4gZXJyb3IgbWF5DQpoYXBwZW4gaW4gZnV0dXJlLiBJZiBhdCBhbGwgdGhlcmUgaXMgYW4gZXJy
b3IgaW4gZnV0dXJlLCB3ZSBuZWVkIGRldGFpbGVkDQplcnJvciBpbmZvIHNvIHRoYXQgd2UgY2Fu
IGhhbmRsZSBpdCBhbmQgZml4IHRoZSBidWcuDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gVGhh
bmsgeW91LA0KPiBDbGF1ZGl1IEJlem5lYQ0KPiANCj4gWzFdIGh0dHBzOi8vbHduLm5ldC9BcnRp
Y2xlcy85Njk5MjMvDQo+IA0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+IEJpanUNCj4gPg0KPiA+PiAr
CQlyZXR1cm4gcmV0Ow0KPiA+PiArCX0NCj4gPj4NCj4gPj4gIAlpZiAocmlpY19yZWFkYihyaWlj
LCBSSUlDX0lDQ1IyKSAmIElDQ1IyX0JCU1kpIHsNCj4gPj4gIAkJcmlpYy0+ZXJyID0gLUVCVVNZ
Ow0KPiA+PiBAQCAtMzAxLDYgKzMwNyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2FsZ29y
aXRobSByaWljX2FsZ28gPSB7DQo+ID4+DQo+ID4+ICBzdGF0aWMgaW50IHJpaWNfaW5pdF9odyhz
dHJ1Y3QgcmlpY19kZXYgKnJpaWMsIHN0cnVjdCBpMmNfdGltaW5ncw0KPiA+PiAqdCkgIHsNCj4g
Pj4gKwlpbnQgcmV0Ow0KPiA+PiAgCXVuc2lnbmVkIGxvbmcgcmF0ZTsNCj4gPj4gIAlpbnQgdG90
YWxfdGlja3MsIGNrcywgYnJsLCBicmg7DQo+ID4+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gcmlp
Yy0+YWRhcHRlci5kZXYucGFyZW50OyBAQCAtMzc5LDcgKzM4NiwxMSBAQA0KPiA+PiBzdGF0aWMg
aW50IHJpaWNfaW5pdF9odyhzdHJ1Y3QgcmlpY19kZXYgKnJpaWMsIHN0cnVjdCBpMmNfdGltaW5n
cyAqdCkNCj4gPj4gIAkJIHQtPnNjbF9mYWxsX25zIC8gKDEwMDAwMDAwMDAgLyByYXRlKSwNCj4g
Pj4gIAkJIHQtPnNjbF9yaXNlX25zIC8gKDEwMDAwMDAwMDAgLyByYXRlKSwgY2tzLCBicmwsIGJy
aCk7DQo+ID4+DQo+ID4+IC0JcG1fcnVudGltZV9nZXRfc3luYyhkZXYpOw0KPiA+PiArCXJldCA9
IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoZGV2KTsNCj4gPj4gKwlpZiAocmV0KSB7DQo+ID4+
ICsJCWRldl9lcnIoZGV2LCByaWljX3JwbV9lcnJfbXNnKTsNCj4gPj4gKwkJcmV0dXJuIHJldDsN
Cj4gPj4gKwl9DQo+ID4+DQo+ID4+ICAJLyogQ2hhbmdpbmcgdGhlIG9yZGVyIG9mIGFjY2Vzc2lu
ZyBJSUNSU1QgYW5kIElDRSBtYXkgYnJlYWsgdGhpbmdzISAqLw0KPiA+PiAgCXJpaWNfd3JpdGVi
KHJpaWMsIElDQ1IxX0lJQ1JTVCB8IElDQ1IxX1NPV1AsIFJJSUNfSUNDUjEpOyBAQA0KPiA+PiAt
NDk4LDExICs1MDksMTggQEAgc3RhdGljIHZvaWQgcmlpY19pMmNfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpICB7DQo+ID4+ICAJc3RydWN0IHJpaWNfZGV2ICpyaWljID0gcGxh
dGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+ID4+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBk
ZXYtPmRldjsNCj4gPj4gKwlpbnQgcmV0Ow0KPiA+Pg0KPiA+PiAtCXBtX3J1bnRpbWVfZ2V0X3N5
bmMoZGV2KTsNCj4gPj4gLQlyaWljX3dyaXRlYihyaWljLCAwLCBSSUlDX0lDSUVSKTsNCj4gPj4g
LQlwbV9ydW50aW1lX3B1dChkZXYpOw0KPiA+PiAgCWkyY19kZWxfYWRhcHRlcigmcmlpYy0+YWRh
cHRlcik7DQo+ID4+ICsNCj4gPj4gKwlyZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGRl
dik7DQo+ID4+ICsJaWYgKHJldCkgew0KPiA+PiArCQlkZXZfZXJyKGRldiwgcmlpY19ycG1fZXJy
X21zZyk7DQo+ID4+ICsJfSBlbHNlIHsNCj4gPj4gKwkJcmlpY193cml0ZWIocmlpYywgMCwgUklJ
Q19JQ0lFUik7DQo+ID4+ICsJCXBtX3J1bnRpbWVfcHV0KGRldik7DQo+ID4+ICsJfQ0KPiA+PiAr
DQo+ID4+ICAJcG1fcnVudGltZV9kaXNhYmxlKGRldik7DQo+ID4+ICB9DQo+ID4+DQo+ID4+IC0t
DQo+ID4+IDIuMzkuMg0KPiA+Pg0KPiA+DQo=

