Return-Path: <linux-i2c+bounces-7870-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7A29C09F0
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 16:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BA28B24EE7
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 15:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA455212EEE;
	Thu,  7 Nov 2024 15:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lfAEPfD0";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Enw1D9XR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2ADCA6F;
	Thu,  7 Nov 2024 15:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730992796; cv=fail; b=eQjqNEhCjRwX8Lf/11FkWIJNdM3Qv83HWo6j8hgVbZxeZ0U7Pyhwjz7LvisZNiv+8kaVfcGyRCJyDRpKQ5Uc5JRjh3wkRcYqGp04VCK0Of2qJpBOD61FgS1X2lFzXspELzFpsAtEQ28tT6hmDAFjJc0xLlTfFieKyr7B4QTGkXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730992796; c=relaxed/simple;
	bh=fY8to83kfC8me393dvpVXpe38bd44tp72V+o+lT4+A4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DTzVLGPCDv/Ti97CkLUOUdfOxsW+DKY/sugAo9bK5JJMkf/3WTqBhH3U/jrgNiOpeFPJfgqd6OZ1673BSPIsnHsuBLsLizHhaKo17CAftQmA1eCuffb7gmJzzt7pPP3/lncvSGig59ief6lltjbi+h6KqY8FrVy0Mz8KWAGJPuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=lfAEPfD0; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Enw1D9XR; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b5ce15809d1b11efbd192953cf12861f-20241107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=fY8to83kfC8me393dvpVXpe38bd44tp72V+o+lT4+A4=;
	b=lfAEPfD0IXUykLTUbBiH2Ipq/gmH3V5a8UNsQ7JdHOBRgQJlRZUahb90okd3z0jIpd8DJ0/V4D0fpiza9NGoWAJ4gcj7u6uWcLli+V3wUHUTNIo3mUfb9NMAx8zljpH2lqumNRQ+NuJLLw9U+VysrM9tl2ciQP4NmiRQRI5064k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:82d278f5-ebfa-4dc7-9827-5a4c7968339c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:9bbbc91b-4f51-4e1d-bb6a-1fd98b6b19d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b5ce15809d1b11efbd192953cf12861f-20241107
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 641907376; Thu, 07 Nov 2024 23:19:41 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Nov 2024 23:19:39 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 7 Nov 2024 23:19:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDlXKlsRaEsJk7QF0KQnnuDgqDgIvnK0pG/YJnyZzNdfbKm/KEv9LkCv7bXrrBkBLGzDRDVZJkHK2+Dsav01dgMlBof6XF002/55mTOP9ntGpSHzKhlbHHcoQzRTXUerEpculGeex0dQCTfeXICkJdeLzIvTez5vhTRGJiNTp5tKEkHvRyh9fmqf3mXbfXjZTIDNBHbcnzPFi7nF8DF9sefDeFob/XLt8h1kkjn71xUyrukPDbA2yyPyqMsAugievVTAmWeCGtvk+zJ64Be79H8X//qw7BKlbrZ/rCWhTiRYBiO8DJmvXWllhzPWz0QCf/kUnxVXBj3s3PVtctGROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fY8to83kfC8me393dvpVXpe38bd44tp72V+o+lT4+A4=;
 b=xc9epiwgFUlmebRrD7NhncBYwxMJK7LQkw8mLavIoVVCrEoI16loXTSuv3DjBtAKcsEHS7YLDoRCpqahnSoysdfIyh76OPVDVxSd+E+M/1M4Bnrm/xDFrXwY3nNzqvEHbwI29p6bt+DxlJKy8nryyRTQRWeatOw9a+7+q77KaOESbEZ+Xswj3nGtQz9zqNj2+uiaT4lzrnvBh5zn9cR3YMNMzTbaeLDmYmZ+G7ecxUyVSMX9M5Gjwiwm6BJw/Xvw0waguMK4Lxur/pA/W0Pb7QynriJ1EJUuiKKRUA18WIM5QSS5Zm9b0aTvpEVuI6dIveLs8rYGEuvBk4rCV6Da9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fY8to83kfC8me393dvpVXpe38bd44tp72V+o+lT4+A4=;
 b=Enw1D9XRPD/302xeUNlkH6KuGuFEjIrWIJ+gz0vUOn9DVp14JpXswzkNtX8WfT0d8O5rdJbkTQQ/RBDglFHWqCdcSS1gbjmiX40prKOb+p0OJhGwBQAaRHm5NOf6yfdrFTtZ+sIXJGzgDC3GcE5jo5J5TmuyAnLI2vUuiDi15Cs=
Received: from TY0PR03MB6369.apcprd03.prod.outlook.com (2603:1096:400:149::5)
 by TYZPR03MB7290.apcprd03.prod.outlook.com (2603:1096:400:422::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Thu, 7 Nov
 2024 15:19:37 +0000
Received: from TY0PR03MB6369.apcprd03.prod.outlook.com
 ([fe80::5be6:4966:bde3:3508]) by TY0PR03MB6369.apcprd03.prod.outlook.com
 ([fe80::5be6:4966:bde3:3508%6]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 15:19:37 +0000
From: =?utf-8?B?Wm9pZSBMaW4gKOael+emueWmoSk=?= <Zoie.Lin@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?UWlpIFdhbmcgKOeOi+eQqik=?= <Qii.Wang@mediatek.com>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [v2,1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Thread-Topic: [v2,1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Thread-Index: AQHbMEsPCnfa7wFh2UyIxWlLfHzwBrKrmuOAgABVboA=
Date: Thu, 7 Nov 2024 15:19:37 +0000
Message-ID: <d1744ec6c7dbd63b128fa0cada2622dead9cb95b.camel@mediatek.com>
References: <20241106125212.27362-1-zoie.lin@mediatek.com>
	 <20241106125212.27362-2-zoie.lin@mediatek.com>
	 <c7c5e802-3df8-4218-865f-81a207c517cd@collabora.com>
In-Reply-To: <c7c5e802-3df8-4218-865f-81a207c517cd@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6369:EE_|TYZPR03MB7290:EE_
x-ms-office365-filtering-correlation-id: c3e21a29-bef3-466e-1964-08dcff3f979a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZUFtNTZWOWo4V0ZsL1gwL001M09rV01aUzBKSzltbEVjdW05SEFzMnFyQ3lW?=
 =?utf-8?B?SW0yb2FQOTlNOENJOFczTk9mdWJiTDB4UU9XNUFZb1pJVzd3RjNtQ1RPSFg5?=
 =?utf-8?B?RHJaOW0wV29qWnROQ0ZTZ0gxd29jR01tWFZvaUdCemQ2UFBCN0ZjbXBnYlpl?=
 =?utf-8?B?TVR5WkcwUC91ZDVZd2NucnJQT0N3bE43QitOenFUTTJBTEd0RVBqbVBNTGIw?=
 =?utf-8?B?WkhVZWNEMUhCM0xTN282bDJlanh4OC9CbXp6M2MrZk1qTmdlU0dRcXQ2TFdr?=
 =?utf-8?B?RVljYzVMY3plK0xtNmx1TithSFdxVjF3biswVUNuM0pvWTdCWXBOd2lnN1c1?=
 =?utf-8?B?NTJVZmtVejgwbzY5Q01pL0tSYUxRWHk3bEIzWU82b0Z5emE4eFdRU1ZLalVQ?=
 =?utf-8?B?a1h2WkVQZnY4bGo4RUJlU1A4Q01jZENRZmZhekx4Nnc1cGVkYU4yRWMzOWhp?=
 =?utf-8?B?S1gycmN0UFg5TG1WdERNQm5wWXVCcnFJMXRCcnhlMnYzb1FYV0Q2Z2JML0l4?=
 =?utf-8?B?WmZzejkwczY1VTArZUt1SmJwd2lvZGRnT1lRbTQxdjZ2bHg5SDB5SW9Hd05W?=
 =?utf-8?B?Zmk2S0YvZUk4eG1DeWl5NUYxTVlnSTZHVDgwR1Q5ZDRHTjVPUGZmQ1dwTzJp?=
 =?utf-8?B?cmdKS1BoL3UyWHljaGh0VCtMRTVrdWlXY2orQ2pWZGozY0taQy9WQ3FyaWNH?=
 =?utf-8?B?c1psRklJMW5VemtXOTQzQkk4YjBPUk1DcFRNcmdDM1BYU3FkV3g2aVpPa24w?=
 =?utf-8?B?SldDOUxIV3pBYlo0azJmNHlyVHk2SExHc0tnc1pSQmxySmlHZmJ1YXFOV3Bi?=
 =?utf-8?B?K25YaXhIRGsrMDRoNExDejBRR3l2UkhQRnJNZDE4c2JVRW13eXZEaThFVWJW?=
 =?utf-8?B?bEZCRHFRZWp4V24zenJaWVNvL2NLS2IyVW1pdjN5MGx5WUpTOEEwai9weGpT?=
 =?utf-8?B?aVVycTQ1elVLUVBQVnhwQlIvUnFpRXBpaWNxN1VLSzg4RlVhdDFkWDFFYnBZ?=
 =?utf-8?B?c3JYUFVBaXFmRnpFSk9xaXpDQUFsVDFKb285blZ4WUZrdjlZMjdFU0FtODMy?=
 =?utf-8?B?ZEZGdGh3bElTWExwZUxzb1dQRjlud1BrSnFsc2FIWU1Gb1ROUkJTMmVlYnZr?=
 =?utf-8?B?RDRQcDlXQkJTRmhiNFgxcjdnTmVpa2QyYmZ1M0V0RjZmeDFmeXJEc0FIUklH?=
 =?utf-8?B?ZEl6YXppTmpheHg1MnpjQlVvcmlpalArc3JtWEdjVXhZYjh2ZzEzZTIvNk5k?=
 =?utf-8?B?WWNMcUtyWGlFcjYwRVY3UnViWHRGU244dk8wclAyUDhTMlNZazB0cWNkSitk?=
 =?utf-8?B?eUFJVXBZUGNRMkxreW5KbXBFSmpWaEhTZkZDK1cxd0wxOEpvVmhIQWxaTitM?=
 =?utf-8?B?Vm0rTDhwaUpqMmJtYTVMTGxXR1g4dzFnQ3lNVWkxeWIrUGppaCtvSDNWSVlm?=
 =?utf-8?B?YXdvUVVRd3k2NC9MdU1XMDVPNlF6UHloM1pHQjczbm1HODVQbHdlaHhXQ0R4?=
 =?utf-8?B?bEhnRW90MmY1azV0ZG1SaGlrTXp5T0YwaUpEeU5CV1VUeHhwZWo0Z0hxSC9H?=
 =?utf-8?B?bEJTRlRrRG4waWVsYXc5M08vanMrMzRKMWtrWXVVQnZ1TURYejJpaHFJdUZq?=
 =?utf-8?B?SC9pT2ZuT0R2NWl0SHZHSllRVlplZ1UvYldSY0FkbDJnMjJ0V3JrZU9XTzZZ?=
 =?utf-8?B?a3Bzb2loWU0xdEU4L2JEdVJKZ1ZhUVFoOTRlb1d3VUp3ekxoak9NWkNkREht?=
 =?utf-8?B?clhFamxiMUgyY09rdnpaTDQ0UVUyYUExcWUwRjRYUkpWZTZ0Y1QxOWN3ZE9x?=
 =?utf-8?Q?G2FmvdXhK6RDLQJVF/BU+vfX/eSZw7FPPFPIU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6369.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1N0L0NXTHFwZXVzUUJ0RzBIWDFGaUJyMkFNNkNNbUJtc0NpOTZBaVk0YTQ3?=
 =?utf-8?B?ZThrUzMzcUJhblNDZ25PaHBWNzNoUUFZQ2ErMEdDMnB4aTRkVmxsSDF6YnRN?=
 =?utf-8?B?QVBZcU5qQndUa2g3SnNpcTljOXpjMnRzWTNtVUlGbmVyVzBYTUozUzgxZjVu?=
 =?utf-8?B?Z1lTVTJheEFsN2FZNkk1cW40NkhEeXdQWFZOWnhvTktseVB3NFhzeXo0Y2Zj?=
 =?utf-8?B?Q28vTUoyZDlsb3dyaldmZyttY3EwQWQzUWhBZ2NBdW03ekpuekFzbFJ5ejdI?=
 =?utf-8?B?bHRyTXRNL25hVWRsQXUzcFFoUFpxTWdFODk4bnRJWmJaRXQ4OGppRmM5VjNl?=
 =?utf-8?B?dTlkcFFQKzlTblBLNzArKzVVZzdGa2luUk84WTFrRHFzbDRrbGwrZG9EM0VJ?=
 =?utf-8?B?WnF4bVBJSmdKWHVlYjlGeHlPZGNOVms2dUg5TXNra1AvOGdtK2srcTNGOWc1?=
 =?utf-8?B?dEkrcHB6eW1qbTZuY1UxbWJSNkd5NWJuSGxjaWlvbTVDNzkrTHJRdFNDZjJX?=
 =?utf-8?B?d1Rna21OWGJETG5mNmtsWmgwVWJqUWtBQ1pWa1NtZTl4bjRYMitLb0hpZWxh?=
 =?utf-8?B?cTErMkNDQVQxQ0NGMFpwYlBOZ2o1YmJYWGVSNTdSZEtPWHcvOE15YXg4TEQv?=
 =?utf-8?B?OThPamwvM2l2Vmt1bGo0dGdUVTI4Uk9PV3N4R2xPR080SkJSM2JoeWFycHNK?=
 =?utf-8?B?N3hrK1NjQndHdGh0c210QVIwOHlEY0gzYVpZeEovcVFpTTY4N3lERDJTKzA1?=
 =?utf-8?B?UUE2L1ovM1ZJS3VuLzQ3RzB0YnZRUlhKUDVXS2VvVGg1ZGlmY3BEVnYyWFZZ?=
 =?utf-8?B?dlAxeXdkbHpwcWREK0VnMW5nVzRxaXVYMjJPckU4Y1BvWkY5Rmo4UjFaU28y?=
 =?utf-8?B?Q3hTaGo2NHRYQW4xZGYweWozMDJUcVJPaGw3RXBnYkd5WmdDUVV1TDNUSUt6?=
 =?utf-8?B?WXpnT0sxeG9NT2tVTDVtLzlneXNYdHRYK2Zab1R4eUxvZm90c0x2U1hLanRy?=
 =?utf-8?B?cUxKUkpSb2thU1VLVldIVkNoQ0lRTTRvZUVrMUdzT3JGL3JGMTZoY1c5NS9y?=
 =?utf-8?B?T0Zla2VGeDU5SGo0WENCeE1rcGdzcjA1RTU3Ukh3SlB4SjNjLzdwbTEvaFZO?=
 =?utf-8?B?WWUzMmlTTkZEWGlJZ1ZNSkdSaHNMd21uYWJ5QndLKzM3czNKOHpITmU2S3Vz?=
 =?utf-8?B?T0lZb1AzWGk0S0xtekRqVGhTWVJiL1hCMVFnUWxScXNwUlJKZGpTTXJ5OUdD?=
 =?utf-8?B?aGtPVGZjTjFxVmJqQ2tJaWh0dWk2Vkx0UXZwaExkUUZ6VU1sN3JZZGNocU16?=
 =?utf-8?B?WWw5RWtpalRhTURnNTBCK3I4RDZxZlYxK0M5d3Rzdk5lUnAxc2ZqQisxSkxI?=
 =?utf-8?B?eHloSDdlak9ZYTlONVRnUnBGUUszMTlJQ1hDcEdjZGZ0UTRTdEs2dWZHRGli?=
 =?utf-8?B?ZTNpVC9Ob3ViQnlIRUQ3RG5pMXVxdmZ0WGRxaWxsWTlTR3hQVnkzVWRiaDM4?=
 =?utf-8?B?R050RjI4V1FUd1hMOWcvd1RIaUdQYTNMRHE0Sm95WTEyN0N2L0dFQzNobUJz?=
 =?utf-8?B?ZEpvRzFENTNSMDF3VmdYQlFSVTRSZ3V5MnMzT1BHOE1yM2NPS1pmOUFHUTVq?=
 =?utf-8?B?cXhkVDFvS3ZZeWUzN2JBdFFOUkVhY1AyT1Byb09wSXg5TXFEVTJrWXZld0ls?=
 =?utf-8?B?VlNPdVJGd0l4bHZ2Q1ZxbUh6dThVcHAvTzVEdmtKNmRRY2NZMko5MVp4TlJ4?=
 =?utf-8?B?cnJXejM4NXJST2tQS0MyN0VwRjNEajZYUktsL1dIUnRzMkRNVW54dElQQWNi?=
 =?utf-8?B?MU9MNWY5QWwzQ3ZPYkI0MVFCSXllb0h3SlFodElibzQ0THVObGUzOVNzbld4?=
 =?utf-8?B?c0NEbXhCYmIxeGtjcUZmaFhHQUNseFFZSHRXMFNyMEZpZTN6TmhNL3hvQ3VB?=
 =?utf-8?B?VW1pNkhFN014THR0SlY2bzFFVXg2V0lsZGdBVjg1aFpRazRMRmFFUWJTMjRJ?=
 =?utf-8?B?RnBCWklGSFU3bldSSjE3WENxT24yOVNTbDAzRURyejQ5VEI1UVdjWmhsUG9S?=
 =?utf-8?B?aUJPalYzNDgvcTNZMGhvOU9tVEs3SVZSNFNuOVk0NnRrUDloanFicXdvbFdx?=
 =?utf-8?Q?Ax9d9dg7HgNwy587+uSrlsOUN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9A0AD8CEC746B46BC56473207CF5528@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6369.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e21a29-bef3-466e-1964-08dcff3f979a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2024 15:19:37.0953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /HgCb/0NVQ5yV2SuljIlMQu7dKbxpx7qRofigQnJobgrKsoFLRdEMw1V1lnrb2sHUC57kVaj3MefFeDDwVgdmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7290

SGkgQW5nZWxvLA0KDQpPbiBUaHUsIDIwMjQtMTEtMDcgYXQgMTE6MTMgKzAxMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJp
ZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IElsIDA2LzExLzI0IDEz
OjUyLCBab2llIExpbiBoYSBzY3JpdHRvOg0KPiA+IFRoaXMgY29tbWl0IGludHJvZHVjZXMgc3Vw
cG9ydCBmb3IgcnVudGltZSBQTSBvcGVyYXRpb25zIGluDQo+ID4gdGhlIEkyQyBkcml2ZXIsIGVu
YWJsaW5nIHJ1bnRpbWUgc3VzcGVuZCBhbmQgcmVzdW1lIGZ1bmN0aW9uYWxpdHkuDQo+ID4gDQo+
ID4gQWx0aG91Z2ggaW4gdGhlIG1vc3QgcGxhdGZvcm1zLCB0aGUgYnVzIHBvd2VyIG9mIGkyYyBh
cmUgYWx3YXlzDQo+ID4gb24sIHNvbWUgcGxhdGZvcm1zIGRpc2FibGUgdGhlIGkyYyBidXMgcG93
ZXIgaW4gb3JkZXIgdG8gbWVldA0KPiA+IGxvdyBwb3dlciByZXF1ZXN0Lg0KPiA+IA0KPiA+IFRo
aXMgaW1wbGVtZW50YXRpb24gaW5jbHVkZXMgYnVzIHJlZ3VsYXRvciBjb250cm9sIHRvIGZhY2ls
aXRhdGUNCj4gPiBwcm9wZXIgaGFuZGxpbmcgb2YgdGhlIGJ1cyBwb3dlciBiYXNlZCBvbiBwbGF0
Zm9ybSByZXF1aXJlbWVudHMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogWm9pZSBMaW4gPHpv
aWUubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtbXQ2NXh4LmMgfCA3Nw0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQ0K
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0K
PiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQo+
ID4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQo+ID4gaW5kZXggNWJkMzQyMDQ3
ZDU5Li40MjA5ZGFlYzFlZmEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1tdDY1eHguYw0KPiA+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCj4g
DQo+IC4uc25pcC4uDQo+IA0KPiA+IEBAIC0xMzcwLDYgKzEzNzMsNDAgQEAgc3RhdGljIGludCBt
dGtfaTJjX3BhcnNlX2R0KHN0cnVjdA0KPiA+IGRldmljZV9ub2RlICpucCwgc3RydWN0IG10a19p
MmMgKmkyYykNCj4gPiAgICAgICByZXR1cm4gMDsNCj4gPiAgIH0NCj4gPiANCj4gPiArc3RhdGlj
IGludCBtdGtfaTJjX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gK3sN
Cj4gPiArICAgICBzdHJ1Y3QgbXRrX2kyYyAqaTJjID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+
ID4gKw0KPiA+ICsgICAgIGNsa19idWxrX2Rpc2FibGUoSTJDX01UNjVYWF9DTEtfTUFYLCBpMmMt
PmNsb2Nrcyk7DQo+ID4gKyAgICAgaWYgKGkyYy0+YWRhcC5idXNfcmVndWxhdG9yKQ0KPiA+ICsg
ICAgICAgICAgICAgcmVndWxhdG9yX2Rpc2FibGUoaTJjLT5hZGFwLmJ1c19yZWd1bGF0b3IpOw0K
PiA+ICsNCj4gPiArICAgICByZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGlu
dCBtdGtfaTJjX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiArew0KPiA+
ICsgICAgIGludCByZXQgPSAwOw0KPiA+ICsgICAgIHN0cnVjdCBtdGtfaTJjICppMmMgPSBkZXZf
Z2V0X2RydmRhdGEoZGV2KTsNCj4gDQo+ICAgICAgICAgc3RydWN0IG10a19pMmMgKmkyYyA9IGRl
dl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiAgICAgICAgIGludCByZXQ7DQo+IA0KPiA+ICsNCj4gPiAr
ICAgICBpZiAoaTJjLT5hZGFwLmJ1c19yZWd1bGF0b3IpIHsNCj4gPiArICAgICAgICAgICAgIHJl
dCA9IHJlZ3VsYXRvcl9lbmFibGUoaTJjLT5hZGFwLmJ1c19yZWd1bGF0b3IpOw0KPiA+ICsgICAg
ICAgICAgICAgaWYgKHJldCkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRl
diwgImVuYWJsZSByZWd1bGF0b3IgZmFpbGVkIVxuIik7DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiByZXQ7DQo+ID4gKyAgICAgICAgICAgICB9DQo+ID4gKyAgICAgfQ0KPiA+ICsN
Cj4gPiArICAgICByZXQgPSBjbGtfYnVsa19lbmFibGUoSTJDX01UNjVYWF9DTEtfTUFYLCBpMmMt
PmNsb2Nrcyk7DQo+ID4gKyAgICAgaWYgKHJldCkgew0KPiA+ICsgICAgICAgICAgICAgaWYgKGky
Yy0+YWRhcC5idXNfcmVndWxhdG9yKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICByZWd1bGF0
b3JfZGlzYWJsZShpMmMtPmFkYXAuYnVzX3JlZ3VsYXRvcik7DQo+ID4gKyAgICAgICAgICAgICBy
ZXR1cm4gcmV0Ow0KPiA+ICsgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgcmV0dXJuIDA7DQo+ID4g
K30NCj4gPiArDQo+ID4gICBzdGF0aWMgaW50IG10a19pMmNfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gPiAgIHsNCj4gPiAgICAgICBpbnQgcmV0ID0gMDsNCj4gPiBAQCAt
MTQ3MiwxMyArMTUwOSwxOCBAQCBzdGF0aWMgaW50IG10a19pMmNfcHJvYmUoc3RydWN0DQo+ID4g
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgICAgICAgICAgfQ0KPiA+ICAgICAgIH0N
Cj4gPiANCj4gPiAtICAgICByZXQgPSBjbGtfYnVsa19wcmVwYXJlX2VuYWJsZShJMkNfTVQ2NVhY
X0NMS19NQVgsIGkyYy0NCj4gPiA+Y2xvY2tzKTsNCj4gPiArICAgICByZXQgPSBjbGtfYnVsa19w
cmVwYXJlKEkyQ19NVDY1WFhfQ0xLX01BWCwgaTJjLT5jbG9ja3MpOw0KPiA+ICAgICAgIGlmIChy
ZXQpIHsNCj4gPiAtICAgICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwgImNsb2NrIGVuYWJs
ZSBmYWlsZWQhXG4iKTsNCj4gPiAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gICAgICAg
fQ0KPiA+ICsNCj4gPiArICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBpMmMpOw0KPiA+
ICsNCj4gPiArICAgICByZXQgPSBtdGtfaTJjX3J1bnRpbWVfcmVzdW1lKGkyYy0+ZGV2KTsNCj4g
PiArICAgICBpZiAocmV0IDwgMCkNCj4gPiArICAgICAgICAgICAgIGdvdG8gZXJyX2Nsa19idWxr
X3VucHJlcGFyZTsNCj4gPiAgICAgICBtdGtfaTJjX2luaXRfaHcoaTJjKTsNCj4gPiAtICAgICBj
bGtfYnVsa19kaXNhYmxlKEkyQ19NVDY1WFhfQ0xLX01BWCwgaTJjLT5jbG9ja3MpOw0KPiA+ICsg
ICAgIG10a19pMmNfcnVudGltZV9zdXNwZW5kKGkyYy0+ZGV2KTsNCj4gPiANCj4gPiAgICAgICBy
ZXQgPSBkZXZtX3JlcXVlc3RfaXJxKCZwZGV2LT5kZXYsIGlycSwgbXRrX2kyY19pcnEsDQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJUlFGX05PX1NVU1BFTkQgfCBJUlFGX1RSSUdH
RVJfTk9ORSwNCj4gPiBAQCAtMTQ4NiwxOSArMTUyOCwyMiBAQCBzdGF0aWMgaW50IG10a19pMmNf
cHJvYmUoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgIGlmIChy
ZXQgPCAwKSB7DQo+ID4gICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsDQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICJSZXF1ZXN0IEkyQyBJUlEgJWQgZmFpbFxuIiwgaXJxKTsNCj4g
PiAtICAgICAgICAgICAgIGdvdG8gZXJyX2J1bGtfdW5wcmVwYXJlOw0KPiA+ICsgICAgICAgICAg
ICAgZ290byBlcnJfY2xrX2J1bGtfdW5wcmVwYXJlOw0KPiA+ICAgICAgIH0NCj4gPiArICAgICBw
bV9ydW50aW1lX3NldF9hdXRvc3VzcGVuZF9kZWxheSgmcGRldi0+ZGV2LCAxMDAwKTsNCj4gDQo+
IFlvdSBoYWQgY29tbWVudHMgZnJvbSBtZSBhbmQgZnJvbSBBbmRpIG9uIHRoaXMgZGVsYXksIGFu
ZCB5b3UNCj4gY29tcGxldGVseSBpZ25vcmVkDQo+IGJvdGggb2YgdXMuDQo+IA0KPiBXZSdyZSBz
dGlsbCB3YWl0aW5nIGZvciBhbiBhbnN3ZXIgdG8gb3VyIHF1ZXN0aW9uLg0KDQpJIGFtIHNvcnJ5
IGZvciBhbnkgY29uZnVzaW9uIGNhdXNlZCBieSBteSBwcmV2aW91cyByZXNwb25zZS4NClRoZSBy
ZXNwb25zZSB0byB5b3VyIHF1ZXN0aW9uIHdhcyBpbmNsdWRlZCBpbiB0aGUgY292ZXIgbGV0dGVy
LCB3aGljaA0KbWlnaHQgbm90IGhhdmUgYmVlbiB2ZXJ5IG5vdGljZWFibGUuDQogDQpUaGUgZGVs
YXkgYmVmb3JlIHJ1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgYWN0dWFsbHkgZXhlY3V0ZXMNCm10
a19pMmNfcnVudGltZV9zdXNwZW5kKCkgZGVwZW5kcyBvbiB0aGUgZnJlcXVlbmN5IG9mIEkyQyB1
c2FnZSBieSB0aGUNCmRldmljZXMgYXR0YWNoZWQgdG8gdGhpcyBidXMuIEEgMTAwMG1zIGRlbGF5
IGlzIGEgYmFsYW5jZWQgdmFsdWUgZm9yDQpsYXRlbmN5IGFuZCBwb3dlciBtZXRyaWNzIGJhc2Vk
IG9uIHRoZSBNVEsgcGxhdGZvcm0uDQogDQogDQpUaGFuayB5b3UuDQogDQpCZXN0IHJlZ2FyZHMs
DQpab2llDQo+IA0KPiANCj4gPiArICAgICBwbV9ydW50aW1lX3VzZV9hdXRvc3VzcGVuZCgmcGRl
di0+ZGV2KTsNCj4gPiArICAgICBwbV9ydW50aW1lX2VuYWJsZSgmcGRldi0+ZGV2KTsNCj4gDQo+
IGRldm1fcG1fcnVudGltZV9lbmFibGUoKSBwbGVhc2UuDQo+IA0KPiA+IA0KPiA+ICAgICAgIGky
Y19zZXRfYWRhcGRhdGEoJmkyYy0+YWRhcCwgaTJjKTsNCj4gPiAgICAgICByZXQgPSBpMmNfYWRk
X2FkYXB0ZXIoJmkyYy0+YWRhcCk7DQo+ID4gICAgICAgaWYgKHJldCkNCj4gPiAtICAgICAgICAg
ICAgIGdvdG8gZXJyX2J1bGtfdW5wcmVwYXJlOw0KPiA+IC0NCj4gPiAtICAgICBwbGF0Zm9ybV9z
ZXRfZHJ2ZGF0YShwZGV2LCBpMmMpOw0KPiA+ICsgICAgICAgICAgICAgZ290byBlcnJfcG1fcnVu
dGltZV9kaXNhYmxlOw0KPiA+IA0KPiA+ICAgICAgIHJldHVybiAwOw0KPiA+IA0KPiA+IC1lcnJf
YnVsa191bnByZXBhcmU6DQo+ID4gK2Vycl9wbV9ydW50aW1lX2Rpc2FibGU6DQo+ID4gKyAgICAg
cG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOw0KPiA+ICtlcnJfY2xrX2J1bGtfdW5wcmVw
YXJlOg0KPiA+ICAgICAgIGNsa19idWxrX3VucHJlcGFyZShJMkNfTVQ2NVhYX0NMS19NQVgsIGky
Yy0+Y2xvY2tzKTsNCj4gPiANCj4gPiAgICAgICByZXR1cm4gcmV0Ow0KPiA+IEBAIC0xNTEwLDYg
KzE1NTUsNyBAQCBzdGF0aWMgdm9pZCBtdGtfaTJjX3JlbW92ZShzdHJ1Y3QNCj4gPiBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQo+ID4gDQo+ID4gICAgICAgaTJjX2RlbF9hZGFwdGVyKCZpMmMtPmFk
YXApOw0KPiA+IA0KPiA+ICsgICAgIHBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsNCj4g
PiAgICAgICBjbGtfYnVsa191bnByZXBhcmUoSTJDX01UNjVYWF9DTEtfTUFYLCBpMmMtPmNsb2Nr
cyk7DQo+ID4gICB9DQo+ID4gDQo+ID4gQEAgLTE1MTgsNiArMTU2NCwxMCBAQCBzdGF0aWMgaW50
IG10a19pMmNfc3VzcGVuZF9ub2lycShzdHJ1Y3QNCj4gPiBkZXZpY2UgKmRldikNCj4gPiAgICAg
ICBzdHJ1Y3QgbXRrX2kyYyAqaTJjID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gDQo+ID4g
ICAgICAgaTJjX21hcmtfYWRhcHRlcl9zdXNwZW5kZWQoJmkyYy0+YWRhcCk7DQo+ID4gKw0KPiA+
ICsgICAgIGlmICghcG1fcnVudGltZV9zdGF0dXNfc3VzcGVuZGVkKGRldikpDQo+ID4gKyAgICAg
ICAgICAgICBtdGtfaTJjX3J1bnRpbWVfc3VzcGVuZChkZXYpOw0KPiA+ICsNCj4gPiAgICAgICBj
bGtfYnVsa191bnByZXBhcmUoSTJDX01UNjVYWF9DTEtfTUFYLCBpMmMtPmNsb2Nrcyk7DQo+ID4g
DQo+ID4gICAgICAgcmV0dXJuIDA7DQo+ID4gQEAgLTE1MzYsNyArMTU4Niw4IEBAIHN0YXRpYyBp
bnQgbXRrX2kyY19yZXN1bWVfbm9pcnEoc3RydWN0IGRldmljZQ0KPiA+ICpkZXYpDQo+ID4gDQo+
ID4gICAgICAgbXRrX2kyY19pbml0X2h3KGkyYyk7DQo+ID4gDQo+ID4gLSAgICAgY2xrX2J1bGtf
ZGlzYWJsZShJMkNfTVQ2NVhYX0NMS19NQVgsIGkyYy0+Y2xvY2tzKTsNCj4gPiArICAgICBpZiAo
cG1fcnVudGltZV9zdGF0dXNfc3VzcGVuZGVkKGRldikpDQo+ID4gKyAgICAgICAgICAgICBtdGtf
aTJjX3J1bnRpbWVfc3VzcGVuZChkZXYpOw0KPiANCj4gWW91IHdhbnQgdG8gcmVzdW1lLCBub3Qg
dG8gc3VzcGVuZCwgaW4gYSByZXN1bWUgaGFuZGxlci4NCj4gDQo+ID4gDQo+ID4gICAgICAgaTJj
X21hcmtfYWRhcHRlcl9yZXN1bWVkKCZpMmMtPmFkYXApOw0KPiA+IA0KPiA+IEBAIC0xNTQ2LDYg
KzE1OTcsOCBAQCBzdGF0aWMgaW50IG10a19pMmNfcmVzdW1lX25vaXJxKHN0cnVjdCBkZXZpY2UN
Cj4gPiAqZGV2KQ0KPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIG10a19pMmNf
cG0gPSB7DQo+ID4gICAgICAgTk9JUlFfU1lTVEVNX1NMRUVQX1BNX09QUyhtdGtfaTJjX3N1c3Bl
bmRfbm9pcnEsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtdGtfaTJjX3Jl
c3VtZV9ub2lycSkNCj4gPiArICAgICBTRVRfUlVOVElNRV9QTV9PUFMobXRrX2kyY19ydW50aW1l
X3N1c3BlbmQsDQo+ID4gbXRrX2kyY19ydW50aW1lX3Jlc3VtZSwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgTlVMTCkNCj4gPiAgIH07DQo+ID4gDQo+ID4gICBzdGF0aWMgc3RydWN0IHBs
YXRmb3JtX2RyaXZlciBtdGtfaTJjX2RyaXZlciA9IHsNCj4gDQo+IA0KPiANCg==

