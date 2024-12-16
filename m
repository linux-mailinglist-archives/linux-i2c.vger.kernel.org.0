Return-Path: <linux-i2c+bounces-8550-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 512BD9F3AAE
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 21:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 854B3167E45
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 20:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840411D432D;
	Mon, 16 Dec 2024 20:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TUGf+hgp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010010.outbound.protection.outlook.com [52.101.229.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1208A13D29A;
	Mon, 16 Dec 2024 20:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734380627; cv=fail; b=f+PxA7XiD3Es/zylslQvMGYrdieyGhUgyGx3ffz0Wta2WwpJotynLc86BOqL+/wzcl8s7P+906fRB8qd4Z8MGZhdvXHPi3xFWQejbUDrdbivdTpkGpELwh7VGCge+1sNsI2dtY98trnM5YPmvrgfKD/PbnoO1cdJndlQAXANn2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734380627; c=relaxed/simple;
	bh=+aph4QBeEyMiQxVspoqfPgBA5cDpjVqxDhBJZinZLfw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QI5X5VTqP9th6ixsYopSV0n+aSf4EnbGdYAiQwMkeSK5ao673yDgThJZ0BL7AiwjvM18rIdPnPSGU/v/FOipNGgs5TO4OgviVbO6cHMzppnPVeTz9/9YHVQV+VJMVNu69kSAP972zifQfZuhYVG09vGYqjxv3LW1S4MSExaCFIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TUGf+hgp; arc=fail smtp.client-ip=52.101.229.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Edy8PgFjxxr5ka6ljCNBAnZ83Rvfi8AHyf8moNrnYLM2RgXXe11D6Ak+z1ckmAP4kVyLF5XA2rnQoxPvkfp0ipuxKlS0QBEo0Jh6E7/V9E+nocYfcwjNQM2G+2jUWNIFH1J5fpzIOdbvDQZw8me7tQ6DumVmrFmd+6aJXAjNrXU3tvaLh3eI4a4YX5ZTU+IHIKjbz6yWDiBFzV+cCf+ha8esMiE3neo9dyWbFSeIAQvcGKbaBzPBwQPQMtZKMYutib0bPQx5ZMJfg+ixUm6kz/GxD/a2NkyNQp8X7m9NN01xeWMpUGOquGDV7ZTnMSDpPnWhV6F5qZPtLbsiOHYHuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aph4QBeEyMiQxVspoqfPgBA5cDpjVqxDhBJZinZLfw=;
 b=VI9mt9Oq3B7LjNZOJKLjAx0kdGuG0QQvwNw3Ly8wbacyGV7NxMSjlbPk1qXwkWlj/pF3JdNH/Jr2B8saANBfrArj+rM49EOoQVa6399zs3tMjgUYthDeDLphuU9o7xsLiYqKUY+1G6Xp09+yyGcJy7Cjn9+SXSRcp3bddoq9ydg+1SBkK8/6NS9ZYJkckeVmBIb91YWyZ9t2X15VJUO5bjKe7pNc/dBfikwbIwr4gmWBpNSWAPdvne4tN/CcKazvCK+vZZooSt3Jtiiooj2qYHKtRZNvbV0f2FOS5mAq+CnSpbfc6C5UzV8XvunMeHWOY1RRhXJEGNeS20wmVO001w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aph4QBeEyMiQxVspoqfPgBA5cDpjVqxDhBJZinZLfw=;
 b=TUGf+hgpHrtL2wjKM/Fq8qxcYZULG0OPW4uEZQ0z4xF2/fcfX264Hr0UIaLU8FmF/IsJUFW2csZ1SLc+2ri6iku5OG6j6XhfmGbQSxZfdlvPxUdc8Fg4SQhh/J8YS+7u0tISL1NaGSYNZp3/hdfCf3hmOm0JJ2/r0Fs2R9wnge4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB12391.jpnprd01.prod.outlook.com (2603:1096:604:2e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Mon, 16 Dec
 2024 20:23:40 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 20:23:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Chris Brandt <Chris.Brandt@renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 1/3] dt-bindings: i2c: renesas,riic: Document the
 R9A09G047 support
Thread-Topic: [PATCH 1/3] dt-bindings: i2c: renesas,riic: Document the
 R9A09G047 support
Thread-Index: AQHbT7Isv2xroziW4UOp7qDe4GsJ3bLpEToAgAA/58A=
Date: Mon, 16 Dec 2024 20:23:40 +0000
Message-ID:
 <TY3PR01MB11346DF0FD7D74B556497FF2F863B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241216120029.143944-1-biju.das.jz@bp.renesas.com>
 <20241216120029.143944-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdXvQ5SWHkU7dXHmDtQ_fzU75ZTWSNr1ZDhq8GUgc-E8mg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXvQ5SWHkU7dXHmDtQ_fzU75ZTWSNr1ZDhq8GUgc-E8mg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB12391:EE_
x-ms-office365-filtering-correlation-id: 605b2734-4183-470c-6b75-08dd1e0f879c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d0ZwKy9IM2F6MnE2dW16TnZ1VkJsZ1lhajVONTFKaTFySzZkMGlVL0FFWWxO?=
 =?utf-8?B?bEVMYkc1NzYrWU9NTUtLNU1CSFhvd1RxdUNrM294ek0vbmJFNHN1SWFveDZr?=
 =?utf-8?B?VVJTTlhScmxmYkhUWkR6dUFzbDkrY1Zia0NJT2g5eCsvZzA3S1lrRDVweEpP?=
 =?utf-8?B?cG92eXNvbDRqT0ZnQmZQWlcvOGZzeWVudkwyNEt5TVJqWHdlSHZyOElkUmZT?=
 =?utf-8?B?MVpHcFZOVWt5N21jOVczL3JTcVppS0wzb0kvSUlEeGJYdFZqVUNzWC9uVXA4?=
 =?utf-8?B?NlFuSGtyOGVyTFo4V2wyTm02MGZuQXJoenkwcDNxdHJGQ21iYXZUWkxBVU9i?=
 =?utf-8?B?d0U3aSszMk96MWNMYWQxQk8wSlk4M0NuMDFmSEtrM0Nncyt4RWIveUF0b2JI?=
 =?utf-8?B?cjA4d21RanZKTlM1RWEzN2kvaVZZK1NaV3JhYXB2VkgxemZZcUdTcDd1Z2d0?=
 =?utf-8?B?Y29JR0N6Qktod29vWVZWd0NvRmJDSjJ0M2xFK2xDQm55RjJXcEFod2VyYWxN?=
 =?utf-8?B?YWFQdXZmMU1nTFVoSUJrMXBBQ1lMaWNKUWNaVUZwOFhqWWRlTWdqZXlzd3F5?=
 =?utf-8?B?YVhTUkxOcUQreGZxaTBVZHBxRHVEOUJwS1ppZkVKbXcyUmp3RTRtaGFjdjFV?=
 =?utf-8?B?RFdkd1FFaHhPNGlqc2ZyRHJCMEdkN0h2bEFTM3ErTHl4Nk94dE02aWc2VlFG?=
 =?utf-8?B?VmhoSGxkNE44aFdMRWYxT3JqdWMzdU1Bc2NWc0syQ1dteXI0RXV6UW9hdGpY?=
 =?utf-8?B?T0FWNDNkVDhSdUdDQ1piaEllSmtGS0pWRHdKVXBDTXArWURYb3NjdzF2MWUv?=
 =?utf-8?B?YXc4ME5nazhxU3BhZFF4bGZpZlJVWlJDcHc0dCsyT0xkSEFuZVNhREt4Mk9I?=
 =?utf-8?B?bDl2UFBwREtZVk5qY2Q3NFNIdmh2YVpkY1BQalBWbnFpTTNKYXFZeEQ4RVNL?=
 =?utf-8?B?RHpkSDZFcFdibFYzaVc2QTUxbXFJL0h6Z0wxc3BkZE8yb0ZuWkR3TDc0ZlpN?=
 =?utf-8?B?ZlZJYXpTOC9RZmk4VzhHa2ErWU51VXV0SGQzZVpYbjFoZFVaN2pPckNBVlor?=
 =?utf-8?B?YUplUWNxcUM1c3JDRURMaXlUNTVFQzdEQytSSm9OejZUTGExRFl6SCtxWVhL?=
 =?utf-8?B?SksxRUJLUnVFclZOMDhJY3hqYVZvU2xTYW9hQjZVVDlOSXNLR2tacTgxWndD?=
 =?utf-8?B?cFFCRUMwVERucjVzMkdmQXlzZThMMlpQSW9BdTJxMlg4M3NlbjlHVEtSckdE?=
 =?utf-8?B?NWdxSmp1bXMwZjIxNHF3bEVPVmJic1B4K2Rlck1hZDdwZ2NMZ1Vtem9vaU1k?=
 =?utf-8?B?Q3I4c1FWYm5hM01sMW5WZnRjVmVoZzJUUityaWtKSXVRVFE0djJuM09venhI?=
 =?utf-8?B?N0ozZHR1cFErOU9Jd3ppajRkWW5uZFpPRCtaM0pIbFlSbDZrK0Zha1MvU0Vo?=
 =?utf-8?B?Z0dTcFY3VmdMNmFRTS9xN0p2VVB0Y3UxUXByTjZwZ2Jjb283Q0FZQ3QzN2Nz?=
 =?utf-8?B?Tk9nTEJtM05VcGloZGltVEN5cFUvR2pLbWpnKzlueFlXWXJzQnlubnMvK05l?=
 =?utf-8?B?eEdQU0JvUzBBODJDM3lIcGVncTQxaTJlL0o1TENFYXJ6ZFVwc21CZFNwN1lM?=
 =?utf-8?B?NVlHYzljcHJJbmJPekJlcmhQWnE3RjFZYmhWd09jL2NXVUwxVjgrS3ptTTJN?=
 =?utf-8?B?dEpMclBPUkthbEVvYmloRTJUblNRZTM4WmJhSCsyLy9rdlVRdCtaVURYUHFy?=
 =?utf-8?B?K25qWnVHd1A3U3hBNmo3VWQ2blAvdnZ0WUdwR3UvMHlpaWs3U0o2WWZHL3Jm?=
 =?utf-8?B?VjhDQ3FBcGp6Z2NFenc4TWhrd2wzTkpEc0Npd0Y3aERMNXdYRzc5TzZxSnJH?=
 =?utf-8?B?SkEwTVRsb3NhWS8wNU9WSDRrU3VCWFN1NnVzNHE5djh5MXB5dFBaZTF4TDQ4?=
 =?utf-8?Q?8UXcAId08bBOTVHXFZo89XpwdkhqfCEX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bDJaZzhXS2k1bTVVTXQzRTk0QTBmOTgyUmRjcHkxMDlhdGJRSTIvRmMvMys1?=
 =?utf-8?B?bXAxYUxXOVM1eFk2MjRjZHk5aVJndXN2UVNqY1NHcjNIUjZxWURFWXM1L2Uz?=
 =?utf-8?B?cUI5TEloUmFQSTJpMzNJbDdidG12TFExMEp6L1V0dk1NakkzWElXTzBtYW9k?=
 =?utf-8?B?NWFTWG0vRmhyTjJoWFZ0di9ESkNtTGJaWlJXOWMrdXAvbVF3QTE4QWhtL0gr?=
 =?utf-8?B?VUlFMHpWOEFjaXlzc0VKb1BYYy9qcUI4UkxLa0VxZWpJZGxqOXg0blM3clg2?=
 =?utf-8?B?TDg5S1l3a0hBZFBPcXRwV3dCdGU1dks4YU1hREN6NVBTK3o1RTQwcU1jRy9Z?=
 =?utf-8?B?MzNTaHVHWXA0SWJoV2VpaHZ6UVZsTGMzeG1nQXl0cFIzVS9KTVJKK05lTUxM?=
 =?utf-8?B?UG13eWRZTDdQNjFuRmRxc1BxTTl5c3hWSi9WTDhpeTA1ZnR6Q3RGTVE2UzNB?=
 =?utf-8?B?U3FHMEJRUzBWMU40Ri9pMFB4cnA3WVZiVktJKzZzYmM0N2lGOXVZS2FkMTY3?=
 =?utf-8?B?QlJKNFNPTldTWStjK3JTN3pTWU5JMnd3VHg2K2pxYzRiNWJjWlJrTzZsVVBM?=
 =?utf-8?B?WlkxWUtpcGp4OVI3RFNPWUpWckxKQWNWendyTmlLMERPSGcvSDhHZVFsZWdl?=
 =?utf-8?B?NXd1OEYzNXZITTBhMEt5WVpiMnB3Wi9Wc25CRkgxUjdKS2ZaUFU3TXUyWnFp?=
 =?utf-8?B?R3FLV013RWdNTDdIWmJkbWxTUUljNk1tVEpIQTR5SWtiVmhJY3dHTWpwelhh?=
 =?utf-8?B?eCtNYzJLcVEyZDdOUm1xOWpVZzhod01lMHBZYVZKdzBEcCtYV3hteUZLbWRB?=
 =?utf-8?B?SytVaDJlRmxiYytmUlNZWjRPeTlSeUJEditWTlZGOEJaaVdteVYvOHJ0VDhK?=
 =?utf-8?B?VWpKaTNlWVczS2VMNXVyUWF5WHlhWVdtUExVOWtVT3J5VVVHOFRGL2F1V0Va?=
 =?utf-8?B?NW5BM0x3TmdmT1BzV0I3Y0luOWg5K0NNQittRGFwaVpNZE5CUTBma2l4NTgv?=
 =?utf-8?B?bWdqTzNMb242dThRR2U2dFRqV25WZWdxUmQwaVVXN1pWZTIrdnFjei9aTGpm?=
 =?utf-8?B?dGdYbGhUczdQZ0dnSThFRHdHeUxSaFdLREllbUo2Ykd2WHRidUJGRVo1amxk?=
 =?utf-8?B?SWdvNWwzUVNubVNQeEF5RktVdytvZWFYNGtaOVp3Q0VDYnhDd0dJbGZDR2Z6?=
 =?utf-8?B?SmpWcmtZb25VTUtlc2tzcis3SEpNT2NlQ296dTZ3UXF3bWY5NHpmZHJVRWtD?=
 =?utf-8?B?WjkycXlZcVBlb0VXcFZnVWd5V0VBLzFOcUJHdUw5Y2dTWjBsTWRHQ2l3YS9S?=
 =?utf-8?B?aXFlbExpRGVGQm56WXBwNVE2dFRhaXVmYUkxbHR3dUNvOWFPQTJQWDZaVkFQ?=
 =?utf-8?B?M1VHV2pmTCtibnlFZ3RsUjVLTVBaa1hWamVwUGQwZlpOYWxlcWdlOWxYOVBO?=
 =?utf-8?B?bE5UR1RXQkNKSVBkRXhuZGZqWXBGMWZrbzdzV1BXRVFNWll1L21sZjRRT2RG?=
 =?utf-8?B?dFpZeGYvbWVDL1hqSGRtMThFNzlhQ213Zng3YkUyOXkyOU9jYU5LTEJ3NDls?=
 =?utf-8?B?M3JEaUllbGFFQzRnNExwcUd4d3NTTzF6OHhJQURnUzlvajBYeUk4ZjhQRVZ1?=
 =?utf-8?B?MlJ4SitKSThCTTJGY2IyK1paZy8ya3ROUlBHeEh5a0x0bFNFaUgrd3ZWak0w?=
 =?utf-8?B?VTV0M0dleGx4T3RMS1AwWTNHNFdFLzhEL1J1cXErL1JDU0dueG5jRDdDU3JN?=
 =?utf-8?B?K1BxL005bjF6V1djWjgzZXRZd2ZxVkFSbkVKVkhnRlNnY1pGM1BCQVlWYzdK?=
 =?utf-8?B?OW5QcnpSK0JRNlhNQmdpOUdML0hrUHdneU1xSUZvNWlBTnVtakhzRENzeEI2?=
 =?utf-8?B?R2pZRlRLWHFoQkFOUlFvbHVYenh2QWltbUNWUzJudGQyTFZiNHZJNlQxNFND?=
 =?utf-8?B?WSt3S2FYd1BFSlFwcU9ONXJ6T2N6NGM3Mnk2MzFERWFQV2FJN3FvRWRCRXFP?=
 =?utf-8?B?OGU3aTBCdlZFTXJoL0Q0azVVUVl2TXp0MktxQzFBUjVSenloRnBxYS96OGxz?=
 =?utf-8?B?VVRPMkdmbUxqbFk2NVRXcC9YbHlZWXlOcldSTVBZTDlZN1JnMEZnRStMaHQz?=
 =?utf-8?B?OHdZWWwxWEFYR3J2dnN3TmdCb1lZWjZPc1c5YWVTb3kwY2NZSll2cHp4Z0Jr?=
 =?utf-8?B?MXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 605b2734-4183-470c-6b75-08dd1e0f879c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 20:23:40.4492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yvAvzT+x8Y4Xx8+pM2pBB4gek2eb9EYZxpmRj8KxbhBkkcu37Vvr9zxAmN+17M26Y08LugQGRZZ9YA8LYt4Dw1XEwEoUzK6i7ofXPPPCvJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12391

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTYgRGVjZW1iZXIg
MjAyNCAxNjozNA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvM10gZHQtYmluZGluZ3M6IGkyYzog
cmVuZXNhcyxyaWljOiBEb2N1bWVudCB0aGUgUjlBMDlHMDQ3IHN1cHBvcnQNCj4gDQo+IEhpIEJp
anUsDQo+IA0KPiBPbiBNb24sIERlYyAxNiwgMjAyNCBhdCAxOjAx4oCvUE0gQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBEb2N1bWVudCBzdXBwb3J0IGZv
ciB0aGUgSTJDIEJ1cyBJbnRlcmZhY2UgKFJJSUMpIGZvdW5kIGluIHRoZSBSZW5lc2FzDQo+ID4g
UlovRzNFIChSOUEwOUcwNDcpIFNvQy4gVGhpcyBJUCBpcyBjb21wYXRpYmxlIHdpdGggUmVuZXNh
cyBSWi9WMkgNCj4gPiAoUjlBMDlHMDU3KSBSSUlDIElQLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3JlbmVzYXMscmlpYy55YW1sDQo+
ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9yZW5lc2FzLHJp
aWMueWFtbA0KPiA+IEBAIC0yNiw3ICsyNiw5IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAg
ICAtIGNvbnN0OiByZW5lc2FzLHJpaWMtcnogICAgICAjIFJaL0Egb3IgUlovRzJMDQo+ID4NCj4g
PiAgICAgICAgLSBpdGVtczoNCj4gPiAtICAgICAgICAgIC0gY29uc3Q6IHJlbmVzYXMscmlpYy1y
OWEwOGcwNDUgICAjIFJaL0czUw0KPiA+ICsgICAgICAgICAgLSBlbnVtOg0KPiA+ICsgICAgICAg
ICAgICAgIC0gcmVuZXNhcyxyaWljLXI5YTA4ZzA0NSAgICMgUlovRzNTDQo+ID4gKyAgICAgICAg
ICAgICAgLSByZW5lc2FzLHJpaWMtcjlhMDlnMDQ3ICAgIyBSWi9HM0UNCj4gPiAgICAgICAgICAg
IC0gY29uc3Q6IHJlbmVzYXMscmlpYy1yOWEwOWcwNTcgICAjIFJaL1YySChQKQ0KPiA+DQo+ID4g
ICAgICAgIC0gY29uc3Q6IHJlbmVzYXMscmlpYy1yOWEwOWcwNTcgICAjIFJaL1YySChQKQ0KPiAN
Cj4gQlRXLCBJIHRoaW5rIHlvdSB3YW50IHRvIG1ha2UgcmVzZXRzIHJlcXVpcmVkIGZvciByZW5l
c2FzLHJpaWMtcjlhMDlnMDU3LCB0b28uDQo+IE9yIHBlcmhhcHMgbWFrZSBpdCByZXF1aXJlZCB1
bmxlc3MgY29tcGF0aWJsZSB3aXRoDQo+IHJlbmVzYXMscmlpYy1yN3M3MjEwMCBvciByZW5lc2Fz
LHJpaWMtcjdzOTIxMC4NCg0KVGhhbmtzIGZvciBwb2ludGluZyBvdXQuIEkgd2lsbCBtYWtlIHJl
c2V0IHJlcXVpcmVkIHByb3BlcnR5IGZvcg0KcmVuZXNhcyxyaWljLXI5YTA5ZzA1NyBjb21wYXRp
YmxlIGRldmljZXMuDQoNCkNoZWVycywNCkJpanUNCg0K

