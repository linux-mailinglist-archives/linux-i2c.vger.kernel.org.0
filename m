Return-Path: <linux-i2c+bounces-3609-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0328CA88E
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 09:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89B50B217B8
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 07:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0AB14D5B0;
	Tue, 21 May 2024 07:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.b="R1h/3Ezq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2108.outbound.protection.outlook.com [40.107.105.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0917F;
	Tue, 21 May 2024 07:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716275503; cv=fail; b=eU7GV7TobbFw3KDRGwHGfk65k+tBB52dQRJfKB6k8q3Uu8YGfd6SVoEtqXuJfkc4+d4gZGeoiajArGk3uXOzfbmI1E5LDvYsPfEryLxZV+aTs4dfU5S5Iq/MdvvfmV2b2Acweb6e/8u+EYOoQNfEYHeQN+nTcLkKA20gwyeMMow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716275503; c=relaxed/simple;
	bh=xoc2yBmvfWDXV5puXW763fA5Cne3UptgrGr8BtDmJo0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ke4rk1rTrhjw1xFyVu9Vggm+OVQRSK0b/CcIgITbjs9WBeXRWbmD6p+FSvSZepKG4tqo9AXVglm49Qtfrryd/LCUWvZMSfbnPT1eI2nIypZFOdbPih9gs8YScX4e1QcbEO5i2PWgpTENx62qLlmdBtaF+4vAoHJSXXxHTfhawUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bang-olufsen.dk; spf=pass smtp.mailfrom=bang-olufsen.dk; dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.b=R1h/3Ezq; arc=fail smtp.client-ip=40.107.105.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bang-olufsen.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bang-olufsen.dk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e919ZY9udKJ3P5TCZhBudp0TkesfVZG6c50B+MrocjycQwlEar7IarisvsANM4SKzqA0dKeSipU2IoBqeUPXFDnj2IxA4MM++3LgzTnsyU34fC2S8BXvKGXE+WPDq/mTnQChZwifuuX7So8vs2CblHFAdYxs+MP/vK/kG07Jy9Wvx8T8mPMerpXZCs5ODcsFvKZcT0maHhQqFuUD1kg7GQVnnky8vRL9NBFdnSfogr2Gr7KToLGAnLJKA64nYbKlVeZJHTrlHR9WOS04hX6YU9nWycU8BN+pBeCQtFgJIlp+VvljhOUFpXFSZFxmNpnvHC7ntFOfVexkgBsc1PmgXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoc2yBmvfWDXV5puXW763fA5Cne3UptgrGr8BtDmJo0=;
 b=Z58zUFh1LSo2C5NoNlBONrL59rrSebtWB3SzhegdapAX/oINBrilIBuAW0v/gFI/4n2ZG9JAXaQ9KFzNJbkrn0ngxpbkkDnzjsaVopuv3QHKWwkYKzrZwJbvUAaoEfz//ZjlPpdzYt5LhFL9UGuF+FU+hSFGl0VYnmEaeR9LwKuxiFpZm7w7Py0zQLwIaEQEx3+P6y9vFfxe+rapnuO8YI3rBHw7Bn+Y04UdlFtk5IiPJIxSkQQUxllUXpQnI7LYsnxa+ZCo45trLGzCHrywo553atEqiFbj44UIaxFrfFEN3zdma1X36sEBCGG3JUXE1lqW7DtYtuAZsKTsKKL/ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoc2yBmvfWDXV5puXW763fA5Cne3UptgrGr8BtDmJo0=;
 b=R1h/3EzqU5VNhMtD80pvc/vTmQxkqNhbJXNk1uLGpKu5X4xBjSIDmCfPq9U1LEaDlSPIRjgOmsBmvvNepdABrTPPBrkPfHDCIlE+QYyaAX88lKdKIPMXGid7qUECb7/w9V7ycnVmyxtThhq6M4n6qbBWPUK3zH7lqavtAE5Y9DU=
Received: from AS8PR03MB8805.eurprd03.prod.outlook.com (2603:10a6:20b:53e::20)
 by AS8PR03MB7046.eurprd03.prod.outlook.com (2603:10a6:20b:23e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17; Tue, 21 May
 2024 07:11:38 +0000
Received: from AS8PR03MB8805.eurprd03.prod.outlook.com
 ([fe80::6ac3:b09a:9885:d014]) by AS8PR03MB8805.eurprd03.prod.outlook.com
 ([fe80::6ac3:b09a:9885:d014%5]) with mapi id 15.20.7611.013; Tue, 21 May 2024
 07:11:38 +0000
From: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To: Markus Elfring <Markus.Elfring@web.de>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, LKML
	<linux-kernel@vger.kernel.org>, =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?=
	<alvin@pqrs.dk>, Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>, Andi Shyti
	<andi.shyti@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley
	<conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij
	<linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 01/13] a2b: add A2B driver core
Thread-Topic: [PATCH 01/13] a2b: add A2B driver core
Thread-Index: AQHaqFn36wP5ajoL2EavC4bIIhwGabGePyCAgAMMaYA=
Date: Tue, 21 May 2024 07:11:38 +0000
Message-ID: <alv4rqrrnjqw3fb5vsw5r4f6lv7ymvuatcqovt7ddxi5ich5on@aan7wybzrzru>
References: <20240517-a2b-v1-1-b8647554c67b@bang-olufsen.dk>
 <feb239b1-7a14-479a-87f2-dcbf9966bffd@web.de>
In-Reply-To: <feb239b1-7a14-479a-87f2-dcbf9966bffd@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB8805:EE_|AS8PR03MB7046:EE_
x-ms-office365-filtering-correlation-id: 0fee97af-54f1-4d4c-4131-08dc796541e1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|376005|1800799015|7416005|366007|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?V09uendkaGRUTHU3dmFrYVFIT3V0QnNidWtPVmJMZEs0VVE5V1NydTVaZmU4?=
 =?utf-8?B?eDlpRlVOeFJkeVVzdnJIbG1XSFJ5R1ZWNDRiVTl3SlhYVm93NUFRWnB4OVBo?=
 =?utf-8?B?aFNPRlVRbzhMTFJESmdxMjNUNmpEdU1LczgzYkV4eTNmT0dvdkZqWWR1eWVU?=
 =?utf-8?B?bTNNY0xPdDExK01XR0dlN3pQOEhFT1dKWnVGK3VLak1uL2dGT2YxcXV1RG1w?=
 =?utf-8?B?ZlcvS1UrRTl6VmgrMFJZRXRpbGJKK1RvN3Z2MVljekJmaER6NGV5TDdRY2wy?=
 =?utf-8?B?TG1uK043cCtvdWN1NzBsOXBFREJCTE1yNTdiVEdIQjJYeEwvTHNReXlrRXc5?=
 =?utf-8?B?MFBRd0s5ckdjSVJkbFB2Q3o5N21tMlplVHFaZ0VCd05QcllvSkp5NHIzTkFV?=
 =?utf-8?B?STZBNzRSeXViTFhHMVA4VG1TZ3cwMDFqNk15NGwrTzNzZXoySUQ4THRtUm1i?=
 =?utf-8?B?dkZES2RUREdZZ2hSbUtiaW92WXhuc2lkWWJRbnNWRFdmdVNtbUtXUmhrZVpD?=
 =?utf-8?B?SDdidFhMZ0ZiYW5qbnJRMVp3NXhTd3F0ZElYc0drUmRRTDJ5TitzUFNFR00y?=
 =?utf-8?B?UVptRi9FRStVRlVtNTA0TW1tUEV5c0tsMC9JeEdWWDE0bkI0YklvbDZrMTZX?=
 =?utf-8?B?MkN5SFhTTVRWb3kxYkFJYVd3VDMzMWdQSDFvbkwraDBtNXQyV2Y5U09RNDRp?=
 =?utf-8?B?WVF1cytqbk5qSnpVdUpzZkcvV2E3Wk13Y2FvS0ZoNE1Ma0ZLNjFjcVNwQ2FC?=
 =?utf-8?B?cUNVRVVmdk5vQzJHak5JTjBRSG1EREM0eE1QQlFxdE9vbDBXa1lNeHdRWUlp?=
 =?utf-8?B?QjdxbmFjSUFtclcxSlpSR1hZRDh5TG5laTkvYkt1aWpWTXZ1SnRxSW41K1dz?=
 =?utf-8?B?L2p5NU5wdG1aUVhSQjM3TTJRSldJVHNwdWFLZnk4MDA4SkM3ZlhIMnk5WkdW?=
 =?utf-8?B?MVlUbFp2NmNOWE1PV3A4M0hrZlhmMTJRcENxQktMR1BQSGowd2FBNm1Bb3B0?=
 =?utf-8?B?dDNtYUlRQjliZDVrbEVXOTBUaVNNTm9LaUhUWEdLS0oralVoM0ljV0lIQXlT?=
 =?utf-8?B?dUtEbVBPdkpTaUR5bDZ6TUsyNjlpWjJPR0Z1MlNXMDRiZitMOGx1Y0lJbzc0?=
 =?utf-8?B?ek12c1F5QmVOUHc3bis1b2xFRzEyQ3pOSmtlcEljdU9Xd1ZPWG1MMGQ0d3lm?=
 =?utf-8?B?MmV5MisxRG13VlFTQlVwWnhFOEVTWWh3U1REVTVaUmNiK214cVZoOEFiOUlN?=
 =?utf-8?B?aHd1UGp3SEhzVitWYzBCVHFXU3pNck1hcmYrOFpYNGtpemlnTFc3bm1kbmdD?=
 =?utf-8?B?bFpVcG1FUmQ5Yy81emU1SXZJK055YVgwcHZNWHR3QTNoTFNSRnY2MGhpVmF0?=
 =?utf-8?B?YjdtaS9PSk90YnhtcUtvWWdBMlJ2a1c3SG1qWG45TXp3R21pZ2dNUkpVSzgz?=
 =?utf-8?B?MEdIc1FNV29qQ2dtYXZ3d0EvWWoyODEwRG42bmFrdHBhVU4xZ29DYXcxNmk1?=
 =?utf-8?B?ai9JeW11SXI3azFYZ2hIVWluelNXTzB0UUdhMlhvN3gzdEcxczQyUnNRMVpl?=
 =?utf-8?B?LzhhZXlrdzhxNmljbGRQWEFEWDQ1OUNCazZzbmljNkpLQjAyVmZUdWlQUEV0?=
 =?utf-8?B?NWNDemRzVXhKajVFb2FYbnhnNGVqRERLZkZYeUQwNEZ2TGxtTWQrZW9sd25q?=
 =?utf-8?B?VXB2Mmt5aVIvc3lYMjQ4UW1rZUpkYmFvYXVuVjF5U01ZNkVJZERKU04xbWpr?=
 =?utf-8?B?T1kvUmh3WDRXZlJESnRMZHo1R3orVTFHL2Z3bmE0SzA2bjVYdHhTRTd6OVRT?=
 =?utf-8?B?a3dQQTF2K0xjT215d0xBQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8805.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UUNuVHRHbUZaU1RvZUxySytQOFFTQ3dtdGwvUytrY2NlMUx2b3E2bE15WWtW?=
 =?utf-8?B?dGNNUzZpcXNxcHZETFhXa09qVnhuNllWazRkWDI1TXlhR1FFOGhLYTloWVpT?=
 =?utf-8?B?TUpjRHRGYU5JbDRlY0o5VFd1S3l0eW9jb1kzczg2R1NnTkJ4cmUyV2c3UFdx?=
 =?utf-8?B?dG5yZE1iaDcyUURSc3pERTBtT29FQ2w4N1FZMitDZXZkSThIMjFxRExJZThz?=
 =?utf-8?B?TzdFYmhVU21mRU1OV082UjZ4eS9hRU1FRHZtZ3V0U3JEdkllYzBDUGpyUnVX?=
 =?utf-8?B?ampPRkZXSVloRjhOMHpYUFY1cjd3YWlyNEc3RnlYT1prcWtQeFhOU3dEZnMr?=
 =?utf-8?B?OEVoYnYvUno2M3Q0c3p3Wmp2anExekJOTkRFUmRWNWs2STBzL2p5Nmhyb0Rl?=
 =?utf-8?B?YVpvSzdhejJ6THVvOGUyKzQrbU9EcWFhUlZPNUtZMUx5YitSTW04S1diNmln?=
 =?utf-8?B?NlQ4YWVrdE0zeEk4ZXFtQVJ6czNTVGpyTmpHK0ZmUFdQVEcrQkR3UFRDVkcv?=
 =?utf-8?B?WWxkRnZLWmkzczhkY1FJa3NEVEZ0Vi9KaWNOb2lCSmxHTC9HM3BXTHViazRM?=
 =?utf-8?B?RmlDLzhDMW1NbFlTa0JaQkhycDBiYldTdlZIenY5a3o4OWU3MzVnNnhMUVgw?=
 =?utf-8?B?VXpLZklYU3MrOERoaEM3aFZtdEpaWW1EdXBIVjBMZUVmZWdTRHllWFBoaU9o?=
 =?utf-8?B?Q1h5TEQvckd1WUZiWE9tQmVOVk54MzdYbVc5c2tia21HQlFGU2pSMXFCbTgv?=
 =?utf-8?B?SmRWVGFENUpnNStjR3YvcTNqSkxGYWRGSU1KbTdBNVhQTmhLcktMeHBNbmhB?=
 =?utf-8?B?UGhtWmNEZEVJbDlKMmpaWDBMTkxIeHdkRGNOWWJBbjJmc0xkdE9GVGhvSDFy?=
 =?utf-8?B?b21RaFdPN2tEOTJidFc2cHJobmJUQll5bW14dnBKbUF4M3BzcWhVdWQ2bU5U?=
 =?utf-8?B?RDQ2VTI1VTJSOGJSTWRVeDNDaWpiZWxkdEthTlltaG9Hemt6SmVwVjVNanpV?=
 =?utf-8?B?MFlPVjZFcTZnOEJaSTN1bzF1VzlkWXpOdlREQTJmWFB4aTNSNmd6MHVIbXFH?=
 =?utf-8?B?RkcwTlFSSzM5M1BjZ25rYUtKNHAySGdWTENwYWIrOHFLY3RmRWtlbVRydmRy?=
 =?utf-8?B?dkVqanhWNld0UXUyNjJMZWN1ZGZidzYzaFowWis2UTBPMVFsZDBYYXkvUXF0?=
 =?utf-8?B?MXk2cEVITGFNOWFoZW1UTjNrVG9QYm5qTTA4N3ZuUjY0YURwQWNUSXdwNTZn?=
 =?utf-8?B?OE9nenhqYXlESzBCbFZwOGtuTFVDMGtYaFVNQ25lYjlCV1NPRmpvQ1RXK3ZQ?=
 =?utf-8?B?V0Urb1JMMzRnTFo4bWJvdFBET1l0ZVU5UjhRaVd5TVhmTm1zNW5RalRKb1RN?=
 =?utf-8?B?cS9kanpXcis5WFFuVm43blhvb2lTaEY5S0pIZXNBdEdaR3VvUXhLQXdrR2V3?=
 =?utf-8?B?U2d0UWJFR2N5VXc5bmVJT25lalNYbGxVRys1NElvZGVyUll6NjNtOVhKVGo2?=
 =?utf-8?B?d2h3UWJmdUhHbFRxek1GZzAzUHJDbGtXY2EwTG5wWVJJK2h1eXdQU1VGekJM?=
 =?utf-8?B?QUhjZkZKTWxhN1ZIMWRtT2VpaEFITlA2NW1TcmN6UzUzTUNmNy9LUjdPVHFB?=
 =?utf-8?B?Q09OdXMxU2pxUHBCZzNhSVlhTXdpMVE1MTBIT25MMTlTVm9md1NKM2V6T3ov?=
 =?utf-8?B?dmRuVjY1aW9NOE5TeWo1R0NkU1ozbUQrWDRWdDRieDdFNUJ1VmRCR3Vab2pK?=
 =?utf-8?B?SEF3SFc1N2xFbDdYWnBUMUVHU2lJc3hNMXV1NXdaa01mNUtCL3ErczlNQXBl?=
 =?utf-8?B?T01YU1M3bCtjRm5YWDZTakg0MjUzQi8zSjBvNUpmZ1ZSV3cvYmZtYUFDMmNx?=
 =?utf-8?B?VEdDaXJ0UEQ4bzk4VmQ1TjV2SXJsK1kydFhTWnZsUkowREYzd1hlelk5Y0Zq?=
 =?utf-8?B?d0NrSTUweXFTUWZoaU0zQnExSkNLRDlCbkw1MjVFZFhlSzhoUml3V3BPK05p?=
 =?utf-8?B?djA3dHdQZzdWY0Y0SWNYZGtWZHFaT3h4S3Zud01hL1pyRWV1OXIzMmhWcWt5?=
 =?utf-8?B?L3I3b3oweWo0bVJWRGZZQzR5dnpkcmViUTZtc0RKMzdUNWo2VjdLMHVJdWE2?=
 =?utf-8?B?OXJZbWZETVJ4QlRDZzZqRVVOWGFoUnBKc0x6ajc2MElNa3pCcENmRFZKVW9P?=
 =?utf-8?B?UkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94297CB7766511418C10678C3102CBD6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8805.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fee97af-54f1-4d4c-4131-08dc796541e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 07:11:38.3086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h4bQZw85jYh/uuvX9DtGZaO/nvnVX7GR2ltFYSwu1RuKH+BThJHtPR7R+NZhhdXnD9dx/fPsiKxrO7PHT2PX8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7046

T24gU3VuLCBNYXkgMTksIDIwMjQgYXQgMTA6Mzg6MjVBTSBHTVQsIE1hcmt1cyBFbGZyaW5nIHdy
b3RlOg0KPiBbU29tZSBwZW9wbGUgd2hvIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBkb24ndCBvZnRl
biBnZXQgZW1haWwgZnJvbSBtYXJrdXMuZWxmcmluZ0B3ZWIuZGUuIExlYXJuIHdoeSB0aGlzIGlz
IGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRp
b24gXQ0KPiANCj4g4oCmDQo+ID4gKysrIGIvZHJpdmVycy9hMmIvYTJiLmMNCj4gPiBAQCAtMCww
ICsxLDEyNTIgQEANCj4g4oCmDQo+ID4gK3N0YXRpYyBpbnQgYTJiX2J1c19vZl9hZGRfbm9kZShz
dHJ1Y3QgYTJiX2J1cyAqYnVzLCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGFkZHIpDQo+ID4gK3sNCj4g4oCmDQo+
ID4gKyAgICAgbm9kZSA9IGt6YWxsb2Moc2l6ZW9mKCpub2RlKSwgR0ZQX0tFUk5FTCk7DQo+ID4g
KyAgICAgaWYgKElTX0VSUihub2RlKSkNCj4gPiArICAgICAgICAgICAgIHJldHVybiAtRU5PTUVN
Ow0KPiANCj4gUGxlYXNlIGltcHJvdmUgdGhlIGRpc3RpbmN0aW9uIGZvciBjaGVja3MgYWNjb3Jk
aW5nIHRvIHRoZSBoYW5kbGluZyBvZiBlcnJvci9udWxsIHBvaW50ZXJzLg0KDQpSaWdodCwgSSB0
aGluayBpdCByZXR1cm5zIE5VTEwgb24gZXJyb3IuIFRoYW5rcyENCg0KPiANCj4gDQo+IOKApg0K
PiA+ICsgICAgIHJldCA9IGRldmljZV9yZWdpc3Rlcigmbm9kZS0+ZGV2KTsNCj4gPiArICAgICBp
ZiAocmV0KQ0KPiA+ICsgICAgICAgICAgICAgZ290byBlcnJfcHV0X2RldmljZTsNCj4gPiArDQo+
ID4gKyAgICAgcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICtlcnJfcHV0X2RldmljZToNCj4gPiArICAg
ICBwdXRfZGV2aWNlKCZub2RlLT5kZXYpOw0KPiA+ICsNCj4gPiArICAgICByZXR1cm4gcmV0Ow0K
PiA+ICt9DQo+IA0KPiBEaWQgeW91IG92ZXJsb29rIHRvIHJlbGVhc2UgdGhlIG5vZGUgbWVtb3J5
IGFmdGVyIGEgZmFpbGVkIGZ1bmN0aW9uIGNhbGwNCj4gYXQgc3VjaCBhIHNvdXJjZSBjb2RlIHBs
YWNlPw0KDQpJIHRoaW5rIHRoaXMgaXMgY29ycmVjdCwgcGVyIHRoZSBjb21tZW50IHRvIGRldmlj
ZV9yZWdpc3RlcigpOg0KDQp8ICogTk9URTogX05ldmVyXyBkaXJlY3RseSBmcmVlIEBkZXYgYWZ0
ZXIgY2FsbGluZyB0aGlzIGZ1bmN0aW9uLCBldmVuDQp8ICogaWYgaXQgcmV0dXJuZWQgYW4gZXJy
b3IhIEFsd2F5cyB1c2UgcHV0X2RldmljZSgpIHRvIGdpdmUgdXAgdGhlDQp8ICogcmVmZXJlbmNl
IGluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24gaW5zdGVhZC4NCg0Kb3I/

