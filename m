Return-Path: <linux-i2c+bounces-6380-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A23B4970BA0
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 04:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A622B209D2
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 02:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45618C8DF;
	Mon,  9 Sep 2024 02:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OGDNjm18"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C980442F;
	Mon,  9 Sep 2024 02:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725847233; cv=fail; b=oeMU78p3LAfSSSq1gP06uzKJ8+1P7pEKldqjuwFS6EiNUC82cI6aFJfty2UL2vTFh/v+vgxEWjJgSKzCul9RKRhpQD+wUbIcYHrCr55X1NfS4BcwcZyaxrsclmVBsqfInmct6Lr5dT8Rog2JL/FpPJ9h3iqxmXlz1ZEeugGw0QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725847233; c=relaxed/simple;
	bh=cp4mF7d2IPru/24agZg1+EZqdi+zkwaXy3y/K8pVc/Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ogzuoXwlFDL4496hqAkg9on0Sp/njKGPz3KNRi1NNtBCHtiTezJzRDHz9wpq1+/1+0tReo2eDdhQBEsDEYznoNhQWLMLJqNgogWop6Esy8dwX+yZF/7W+63d6zvDFhLc0Ij4bolGEvpBr2wsM5FfWYimHxHg6k3MFF2kB8Zk8/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OGDNjm18; arc=fail smtp.client-ip=40.107.20.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmn2ZZWGfdmsACK5g/xLp5cDxTOjFn7zogdWfRB7bgkz4F4W2HiHFuJuHls0NJfo4AAAArj+UPvb5jQCaQ5sLFcOGVewcMDdPFdA9opHxA6pTS5AlnV01fAjRljfJCqTU9g2J5EO6gouEGd4YQPRBOQ13/WaAfZJmZDoXVBL3tZgONDmPgFx0KzJpKhVq0goQYGfokmesDjRM2DlT5cB1ORwIpwIse4cUGWl5cwgXC3f33SMV5FUwfsO878NAvy9ABOlMc+mNYofJRySQVADJ54LyxNSgowdI15v/TADx1KnE4EAXeedeOi9oXkgzLaOvodSjWnSlK30596dz6+hlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cp4mF7d2IPru/24agZg1+EZqdi+zkwaXy3y/K8pVc/Y=;
 b=BzwGowHiuZdU82pr6e1+/hpP7JwVSdYC5XG37ZJZM7T+CM2dBT0meqg1qNYW220bGNSzhFKkB4+imFjrbN9jhaG0NFzpQtNYgJ9QcIxls9FOmqSQXTsBbySx7YQKJ+xoVnuWjxtG0WpqRvXQ8YS5Beu6QQRNlMDKN3wPVVEzkQcPKXgMX9/GQUxG7DaZC+EB3gnPQIlL+OulXva5Ec25Ww+cjUr6y13ZnNbl3NGcdyhm9dZM/RqomWtc1pOobXjGAq9luAY9TG8cCprspeCDDxpL8zHLAZfoJn1R2Vb2VvZ65emN9wmt6kkHeLiuyEgnReN9ImJpMOIa+d8b+eNWEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cp4mF7d2IPru/24agZg1+EZqdi+zkwaXy3y/K8pVc/Y=;
 b=OGDNjm188CgTEo8ClRQPoCxG56JwMKGeFMh1KAa49jg2avpP6/DdAfYZUWRj9c/3dfPx4s6CgJNTJuKpsuSsDEb5kCfpWKqI5T6RP3DBVc2F3vNd69P5JWX0qe5qF4+CfNiF5DkniHXuzSVjBGACI/vhxyAeklaJQqILo5VtsecFLJo2v3CV1/wVk395gNnbpzeeSuk1CN1e7SQMGgR+B0OINENjvIGPChbfkeq86s/VFAHcRXUZaoJJnoF3TnQ1Lh5xPdZGPfEU8ymENMnmO8Gosxs4sYZ2AcbPTKn4uBrQDPItZNe+IYZO7WvbRaRKBHZjhYBL/J5sKFgf3yJvgw==
Received: from AM6PR04MB4999.eurprd04.prod.outlook.com (2603:10a6:20b:2::12)
 by PR3PR04MB7291.eurprd04.prod.outlook.com (2603:10a6:102:8c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 9 Sep
 2024 02:00:28 +0000
Received: from AM6PR04MB4999.eurprd04.prod.outlook.com
 ([fe80::7056:2827:262c:9c18]) by AM6PR04MB4999.eurprd04.prod.outlook.com
 ([fe80::7056:2827:262c:9c18%4]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 02:00:21 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Aisheng Dong <aisheng.dong@nxp.com>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2] i2c: imx-lpi2c: add target mode support
Thread-Topic: [PATCH V2] i2c: imx-lpi2c: add target mode support
Thread-Index: AQHbAlwGKpM0Xg4F7Eyu6DtVo0B3sQ==
Date: Mon, 9 Sep 2024 02:00:21 +0000
Message-ID:
 <AM6PR04MB499944C16813C1A88A3840F3E8992@AM6PR04MB4999.eurprd04.prod.outlook.com>
References: <20240829105444.2885653-1-carlos.song@nxp.com>
 <qcoguhxtkwn2aowtccfybutn6xgzrqvhdob4tzericerpfntfh@q6f5upgegba7>
In-Reply-To: <qcoguhxtkwn2aowtccfybutn6xgzrqvhdob4tzericerpfntfh@q6f5upgegba7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB4999:EE_|PR3PR04MB7291:EE_
x-ms-office365-filtering-correlation-id: 235465fa-5fbb-490e-9aa6-08dcd0732960
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NWFUYVBDTzVzVVAxSjRDUmhPaStuclFjRG4yaXkxTFZIbVlpV3JzNEVaR1E3?=
 =?utf-8?B?aUo1QS9YL29JbjlCM29QUE5VbFd5dlJMd0hpdDk1R254TUpianpBdHZhckFE?=
 =?utf-8?B?cEU2SGVuWHZ4WDZ5anIwR2N6VkRUTVMvNHdXL0RuVUtOY1NrK1JVQTFrekk2?=
 =?utf-8?B?S1BUWEtMYkQxTUZLdHFYeUhxRTBaVndzZkQrSU8vM2EwSy8rY0pOdi9TMHdB?=
 =?utf-8?B?NGRxWTUreURPUW11SFprVU8rZEt1TUF3UUU4YWhBRVNOLzZoeGV3TUJyNkhD?=
 =?utf-8?B?L1k5cG56bjE1bTk3YkJqRitzd240eWJSWUs0SWlhWkVwSE5MQXJIblErSlBs?=
 =?utf-8?B?S01JTlhvVEFkTkxvSnUvdGUwaW5YdURBOSs5TE9iUFpodUh5bGxMQ1Z6L2Na?=
 =?utf-8?B?U3dHTFAxUXVQcGh1a3ZsaGxwSXVWRFVHUk9QV3FsWUxCd24rZmxqL3ozcElh?=
 =?utf-8?B?bThUNUc1aDM3akt6T2cxYUJ4VkMrUGNzTnhSMDNoYVd6Z0tHTTdkQUlmaTF2?=
 =?utf-8?B?L3hDdElGWHMyZk4rVkZqbUtnRFVwZ0RVM2pxKzkzaThFVm94bk11bElHRnJQ?=
 =?utf-8?B?WkRyWkI5bHBzN2ovVk5ZbzBlR2RhZ3c3S0RpSWlUVmhGMnJJQW1wcDFORGdL?=
 =?utf-8?B?eE1ZQjJDOVZwcm9VbXk5YmM3c09rVU9wOHphLzNkSm5hblorTGh5Mmw5NlVP?=
 =?utf-8?B?UjQ5Vm9hdjdWdFlJT1k3QmJkZ2ZuN2d4VGgxaFNPNHdlUkhjQm1WazBOWnhQ?=
 =?utf-8?B?SkdGUWJRVDVGeEVWc3lHZ2ZCZ1JRK0tmdEFiWUJZWlp1SjQrYldKTXVDanph?=
 =?utf-8?B?V0hUb2pBWFluV2Y5djEzVVM4VlVsMGtSVFdubjhBQVNLRjBCdXYvSDc2QnFk?=
 =?utf-8?B?c0lRSlVqSFhKbUtpY1NJNmxrc2F1dkR1UnBNZDlVMHQ2c3pLRjBUYjc1Ui9N?=
 =?utf-8?B?R1IrY1l1dkxDRllvekw5cC9tSmNuRGo1R1hmWUtwUW8zeGUzRmFpelFIYXBK?=
 =?utf-8?B?enBkV3J4aG5iQWp0RzY4S0loR3hEVDdlN0l2Qk5QdUZYOUg1SFB1RGtwU2Mw?=
 =?utf-8?B?UjF5ZVgwVVpia3ZFM2VWMkd5Y3VnOC9iNUgwQks1cjJUQnVzdWE0WHc1SmhO?=
 =?utf-8?B?WmxFQVNibGR5KzFhWnRiem5LMkxNcm5pc1cyQ281Tjd5dnJnMnp5aXhBckhM?=
 =?utf-8?B?K2ExdU01VU5Kc3I2RzBxcHVrRDQyTmRWRE44NHIvZVdxdGR1WU5uemZjeHg5?=
 =?utf-8?B?cUlaTXdLaXdYSXJ1MkhNMVVvVVNEa2pIVlhZd0VWYkZLZTc1eXJZWklpVjly?=
 =?utf-8?B?bldud25DOVdiKzRBc2ZIN2E3aFRvTWk5azdZcXZNVm9ObnJRY2Z6VDJrZDBR?=
 =?utf-8?B?V0JWTUd5K2Q2K0JPTEkxVHZQMnRXd256QXR6NHZmSmF3Q2NqUUhzWTB6bFlW?=
 =?utf-8?B?NWxXdENuSnRDbU1ra2dKRmtsOTlJV0c5NTc4eWhOV1g4bDFzc2F6ZHZmODhz?=
 =?utf-8?B?MmlEdjFJUkhPcWVGeDY1UllERDcwS1dwNzl2N0ZvbVV0ZEJYejhkK1NCVnRC?=
 =?utf-8?B?RTQ5Yi96QURrR0wwZE01RU0rcGVQSnhYSUc0TUZhaGZteDBaNVNsU3N0a0cx?=
 =?utf-8?B?TGoyYVRTNFRoeFpKVWQ3clBoQURlTkVONmVEN216S05pUUltYmZKVVA2MEYw?=
 =?utf-8?B?SGpzdnk0Y0hBdzlCcTU1dy9GOFk5NXduTG1OWWxlNGk3SDgwd3J3dExwRmFK?=
 =?utf-8?B?Qm11M1lrUHJ6K05UMlhTSHg3UmxLaGpMaDJnZXlzRWJOOVFsc0VleWJzeVVu?=
 =?utf-8?B?cWd5SGxOQ1IvMU9qOG5Sc3JKa2pncEJCSkVrSHVXd1c0NUdyWERzSDVPOHZE?=
 =?utf-8?B?WGFXM3dMWVc3dm85eDRNdVdBZktpM0hjZlJYWVp3dnVncmc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4999.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WjZTS0xVaTlvSk5BcU51a0dIK3djU0t5UlZNd2VuQnZFYzdsM1RsQjJ6T3c4?=
 =?utf-8?B?Qy9hc1R2OTcwTi9lcjRrYnRpVWlDektER2puVXh4UEJ0UTFkMTdyVmpPQkRL?=
 =?utf-8?B?WXVpUzUyWDF4ZCsrcTJOZlcyK1Y1Y2N6cHFTVzdJUEZZMjE0L082QWtBdGpr?=
 =?utf-8?B?bjNPK1UzZ28zczV4SzRtU2FsSEx0M2R4QmVVREZxVUVHM2tjVWFaRTU0Tkcx?=
 =?utf-8?B?dDZoK2JCNkxidHMrTEVCQ1dsRmIrM2R0OHdIcGN0OU83TjBxR3krZFhrZjZk?=
 =?utf-8?B?N1pkdUdHWlNLUm1Vb0ROeFB4emdMdnozWHVWSlZxNnJiSENuWHM4M1ZtWkpZ?=
 =?utf-8?B?WVZ3QVdMNmpiV0p4MzVEdWFvOHdjaDZWakxYWEdNR2Q1eW1WODQ0YkRiK2F3?=
 =?utf-8?B?elA3Ulo0TWZ3YjB3L1E0bDZBWSs2ek1YTkZLU1cwYURPbDBNNGVwMGhWME1t?=
 =?utf-8?B?S1hvY0ZOcFdtWnEzMHRNUHlKSC9ucStRa1pIWDg0aExOajZFREV3UEpkNUxX?=
 =?utf-8?B?MlZjL0ZGQ1djb2JFcG9vY1RnZEUxRlVlb0VEUG5mOHYzRk9PWnBMOUQybjFK?=
 =?utf-8?B?YUFaQkg1NG04VGVERVNSZ2RBSmNnck51SVBGdFRXUHJtSUk4dGdsVDIycmdm?=
 =?utf-8?B?MTlBZDZpSVFOdVRNTngwR285aWZacGVGNWJaRER3ZDdrdmxYZExwNWpmTVQr?=
 =?utf-8?B?M2piQW5TbGFWS1V4enpLcnZ1TXRubHVJcVJ2NWRZVFB4WE4zNU5xZnlOVWVF?=
 =?utf-8?B?UVRIZWlZUSt3VW1TbXA0Qk5TbTNFWE10YzBCUEVIZkJlMFlFbmppM2RidHFD?=
 =?utf-8?B?TlM2WkxZQU8wSnlwVDNNT0k5V1hYZTBRdnNpVUFFaCsxK2lDQWtpQVQ5UGRj?=
 =?utf-8?B?VGdkVmpyVkk2ejk0OGZqVTZyamU2VHA2VEZyOXFHeTFaUEN5ZExNbkpnWjBq?=
 =?utf-8?B?dlhrMnJPL0RCS3BVbVJjb25RYWtoaFJxNmxKNGV5dk1QOVh2NzlqZHA3RFlC?=
 =?utf-8?B?bEQ0YUtkTysyTlhHbWJ6enRicDhOaXBnNW1sS08yTHVDV2IwMTJXcDhJcEF2?=
 =?utf-8?B?Nmswc00yNnRDN0JPK3JtOFRlcGdudlVGUzM4Sjdwa0o4dWg1MFNpQmQ2aVFh?=
 =?utf-8?B?djl3TFM1bDNQUGtDMko4YzNqbGVaQktXQTQzOE9JYTFJek5DSU1velNTMjdZ?=
 =?utf-8?B?OUwrbnVMLzl0NnZaRkthZGhxdEdlNUloRlpqQlBIMFZnUkZCa2dNZGdkT3pN?=
 =?utf-8?B?VnVSRnRkNnp3UjJKaUxuZnJZaitiVkIraEc1Q1FnUStZb2FUakV4M0lubzRt?=
 =?utf-8?B?Smp5aVNKYmN0QkNqUW5FaHhHLzdNZHZBOXZwM05Dd3JFTGEyaWlJU0EwZVZJ?=
 =?utf-8?B?UnZRMVliYy9MMDlrVGMya1BjNlRESzcwMlkxRk5RNEhqd0pzUjA1NEkxR2JU?=
 =?utf-8?B?U1JWaFpUODdXMFNxU2xLdHRGa1U2YUZBbHpUeExjdW1PNDBsQVpQQXdMdlI5?=
 =?utf-8?B?TmFaMlRvRmhjaVIxZDdId2xVR0VjeS9kVGtsRm9XSGRQcUZnV1ZSMXRubDA1?=
 =?utf-8?B?QzluMFoxNVBxVGNocmFqeG5IaFVJNUJTbTNFbzFXQ01UZit5bUMyVVlFTGRz?=
 =?utf-8?B?Q0FiZ3JQSTIrb2wwNFdlREI2TTAycXJ2SGlIZmM4dFl3eGJnYlZMRXZ2WUFB?=
 =?utf-8?B?b3M4S3kwZENIQ3k4TE52U3J2ZU92Wkk5NDNUZTA0VWptVkVUbTVERGNtUkx6?=
 =?utf-8?B?SkFvRDZERkN0aFZqSFRMYzFmR0xQT2VjdmxtVzdjQ1k2N204aFNob1A0eS9B?=
 =?utf-8?B?QkoyelFXcDBXdko5TU12WDZmdlNSZjRPUU1iU2RhUjdDWDNvK3htWERSM3hN?=
 =?utf-8?B?Mm9VMnJrcXhFTGhhRXlBenV0S1kzU3F2YWxQdzhWRC9PM01WMW5QZTM1U1JV?=
 =?utf-8?B?UHZSZHNBN1pKTDdWeTMvNTUxV2lmQmd0dHM2SmI2YzlSQWZ1NmQ0OWtIT2cx?=
 =?utf-8?B?VXQ5enc2c3h3R2YyQW1WcnZPZTlDejBGbFl3aXhVM3p1aUxVa0NLdWdpUW9O?=
 =?utf-8?B?YXJ1ZWNpMTdxenQ5eEFaNUdpcjRKdWlOVTlrZ0JPeDVZcWsxc3hsc1pvazFI?=
 =?utf-8?Q?QBuo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4999.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 235465fa-5fbb-490e-9aa6-08dcd0732960
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 02:00:21.3178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vbq77oYfSzqcioSVM0VnQfwbAP4Dptvaor1ynJrmQWtuQnBlg2A/xIrwEQ11SUANMJqmXQcCCWMg03dPCyULcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7291

DQo+IA0KPiBIaSBDYXJsb3MsDQo+IA0KPiBMb29rcyBnb29kLCBqdXN0IGZldyBsaXR0bGUgY29t
bWVudHMuDQo+IA0KPiBPbiBUaHUsIEF1ZyAyOSwgMjAyNCBhdCAwNjo1NDo0NFBNIEdNVCwgY2Fy
bG9zLnNvbmdAbnhwLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBDYXJsb3MgU29uZyA8Y2FybG9zLnNv
bmdAbnhwLmNvbT4NCj4gPg0KPiA+IEFkZCB0YXJnZXQgbW9kZSBzdXBwb3J0IGZvciBMUEkyQy4N
Cj4gDQo+IENhbiB5b3UgcGxlYXNlIGJlIGEgYml0IG1vcmUgZGVzY3JpcHRpdmU/IFdoYXQgaXMg
dGhpcyBtb2RlIGRvaW5nLCBob3cgaXQgd29ya3MsDQo+IHdoYXQgYXJlIHlvdSBhZGRpbmcsIGV0
Yy4gZXRjLiBldGMuDQo+IA0KDQpIaSwgQW5kaQ0KDQpUaGFuayB5b3UgZm9yIHlvdXIgc3VnZ2Vz
dGlvbiEgSSB3aWxsIGVucmljaCBpdCBhcyBtdWNoIGFzIHBvc3NpYmxlLg0KDQo+ID4gU2lnbmVk
LW9mZi1ieTogQ2FybG9zIFNvbmcgPGNhcmxvcy5zb25nQG54cC5jb20+DQo+ID4gLS0tDQo+ID4g
Q2hhbmdlIGZvciBWMjoNCj4gPiAtIHJlbW92ZSB1bnVzZWQgdmFyaWFibGUg4oCYbHBpMmNfaW14
4oCZIGluIGxwaTJjX3N1c3BlbmRfbm9pcnEuDQo+IA0KPiB0aGlzIHdhcyBwYXJ0IG9mIGEgNSBw
YXRjaGVzIHNlcmllcy4gSXMgdGhhdCBzZXJpZXMgc3VwZXJzZWRlZD8NCj4gDQoNCk9oLi4uIHNv
IHNvcnJ5IGFib3V0IHRoaXMsIGl0IHdhcyBteSBtaXN0YWtlLg0KDQpCZWZvcmUgbXkgdHJ1ZSBp
bnRlbnRpb24gaXMgb25seSB0byBmaXggaXQgdXNpbmcgVjIgcGF0Y2ggbm90IHJlcGxhY2UgdGhl
IHNlcmllcy4NCk90aGVyIHBhdGNoZXMgYXJlIHVzZWQgdG8gZml4IG90aGVyIHByb2JsZW1zLiBO
byBjaGFuZ2UgaW4gb3RoZXIgcGF0Y2hlcw0KU28gSSBkb24ndCBzZW5kIG91dCB0aGVtLiBOb3cg
SSBrbm93IHRoaXMgaXMgY29tcGxldGVseSB3cm9uZy4NCg0KSSBuZWVkIHRvIHNlbmQgYWxsIHBh
dGNoZXMgaW4gb25lIHNlcmlhbHMgd2l0aCBhIGNvdmVyIGxldHRlciBldmVuIGlmIG90aGVyDQpw
YXRjaGVzIGhhdmUgbm90IGNoYW5nZWQuIEkgc2hvdWxkIHVwZGF0ZSBhbGwgcGF0Y2hlcyBzdGF0
dXMgYXQgdGhlIHNhbWUgdGltZQ0KdXNpbmcgY2hhbmdlIGxvZywgaXQgd2lsbCBiZSBtb3JlIGNs
ZWFyLiBOZXh0IEkgd2lsbCBmb2xsb3cgdGhpcyBydWxlLg0KDQo+IChwbGVhc2UsIG5leHQgdGlt
ZSB3aGVuIHlvdSBzZW5kIGEgc2VyaWVzIHdpdGggbW9yZSB0aGFuIG9uZSBwYXRjaCwgaW5jbHVk
ZSBhDQo+IGNvdmVyIGxldHRlcikuDQo+IA0KDQpZZXMuIEkgd2lsbCBkbyB0aGlzIGluIHRoZSBm
dXR1cmUuIFRoYW5rIHlvdS4NCg0KT25lIHRoaW5nIGJvdGhlciBtZSwgZm9yIG90aGVyIHBhdGNo
ZXMgaW4gdGhpcyBzZXJpZXMsIEkgcGxhbiB0byBzZXBhcmF0ZSB0aGlzIHNlcmllcyBwYXRjaGVz
DQphbmQgc2VuZCB0aGVtIG91dCBpbiBkaWZmZXJlbnQgc2VyaWVzKG1heWJlIGl0IGxvb2tzIGxp
a2UgSSBkcm9wcGVkIHRoaXMgcGF0Y2hlcyBzZXJpZXMsIGxhdGVyIEkgd2lsbCB1c2Ugb3RoZXIg
c2VyaWVzKS4NClNvIGZvciB0aGlzIHBhdGNoLCBjYW4geW91IGFjY2VwdCB0aGF0IEkgb25seSBz
ZW5kIHRoaXMgVjMgcGF0Y2ggZml4IHdpdGhvdXQgb3RoZXIgcGF0Y2hlcz8oTGF0ZXIgb3RoZXIg
cGF0Y2hlcyB3aWxsIHNlbmQgb3V0DQppbiBvdGhlciBzZXJpZXMgc2VwYXJhdGVseSwgb25lIHBh
dGNoZXMgc2VyaWVzIGZvciBmaXhpbmcgb25lIGlzc3VlKS4NCg0KPiAuLi4NCj4gDQo+ID4gKyNk
ZWZpbmUgU0NSX1NFTiAgICAgICAgICAgICAgQklUKDApDQo+ID4gKyNkZWZpbmUgU0NSX1JTVCAg
ICAgICAgICAgICAgQklUKDEpDQo+ID4gKyNkZWZpbmUgU0NSX0ZJTFRFTiAgIEJJVCg0KQ0KPiA+
ICsjZGVmaW5lIFNDUl9SVEYgICAgICAgICAgICAgIEJJVCg4KQ0KPiA+ICsjZGVmaW5lIFNDUl9S
UkYgICAgICAgICAgICAgIEJJVCg5KQ0KPiA+ICsjZGVmaW5lIFNDRkdSMV9SWFNUQUxMICAgICAg
IEJJVCgxKQ0KPiA+ICsjZGVmaW5lIFNDRkdSMV9UWERTVEFMTCAgICAgIEJJVCgyKQ0KPiA+ICsj
ZGVmaW5lIFNDRkdSMl9GSUxUU0RBX1NISUZUIDI0DQo+ID4gKyNkZWZpbmUgU0NGR1IyX0ZJTFRT
Q0xfU0hJRlQgMTYNCj4gPiArI2RlZmluZSBTQ0ZHUjJfQ0xLSE9MRCh4KSAgICAoeCkNCj4gPiAr
I2RlZmluZSBTQ0ZHUjJfRklMVFNEQSh4KSAgICAoKHgpIDw8IFNDRkdSMl9GSUxUU0RBX1NISUZU
KQ0KPiA+ICsjZGVmaW5lIFNDRkdSMl9GSUxUU0NMKHgpICAgICgoeCkgPDwgU0NGR1IyX0ZJTFRT
Q0xfU0hJRlQpDQo+ID4gKyNkZWZpbmUgU1NSX1RERiAgICAgICAgICAgICAgQklUKDApDQo+ID4g
KyNkZWZpbmUgU1NSX1JERiAgICAgICAgICAgICAgQklUKDEpDQo+ID4gKyNkZWZpbmUgU1NSX0FW
RiAgICAgICAgICAgICAgQklUKDIpDQo+ID4gKyNkZWZpbmUgU1NSX1RBRiAgICAgICAgICAgICAg
QklUKDMpDQo+ID4gKyNkZWZpbmUgU1NSX1JTRiAgICAgICAgICAgICAgQklUKDgpDQo+ID4gKyNk
ZWZpbmUgU1NSX1NERiAgICAgICAgICAgICAgQklUKDkpDQo+ID4gKyNkZWZpbmUgU1NSX0JFRiAg
ICAgICAgICAgICAgQklUKDEwKQ0KPiA+ICsjZGVmaW5lIFNTUl9GRUYgICAgICAgICAgICAgIEJJ
VCgxMSkNCj4gPiArI2RlZmluZSBTU1JfU0JGICAgICAgICAgICAgICBCSVQoMjQpDQo+ID4gKyNk
ZWZpbmUgU1NSX0JCRiAgICAgICAgICAgICAgQklUKDI1KQ0KPiA+ICsjZGVmaW5lIFNTUl9DTEVB
Ul9CSVRTICAgICAgIChTU1JfUlNGIHwgU1NSX1NERiB8IFNTUl9CRUYgfCBTU1JfRkVGKQ0KPiA+
ICsjZGVmaW5lIFNJRVJfVERJRSAgICBCSVQoMCkNCj4gPiArI2RlZmluZSBTSUVSX1JESUUgICAg
QklUKDEpDQo+ID4gKyNkZWZpbmUgU0lFUl9BVklFICAgIEJJVCgyKQ0KPiA+ICsjZGVmaW5lIFNJ
RVJfVEFJRSAgICBCSVQoMykNCj4gPiArI2RlZmluZSBTSUVSX1JTSUUgICAgQklUKDgpDQo+ID4g
KyNkZWZpbmUgU0lFUl9TRElFICAgIEJJVCg5KQ0KPiA+ICsjZGVmaW5lIFNJRVJfQkVJRSAgICBC
SVQoMTApDQo+ID4gKyNkZWZpbmUgU0lFUl9GRUlFICAgIEJJVCgxMSkNCj4gPiArI2RlZmluZSBT
SUVSX0FNMEYgICAgQklUKDEyKQ0KPiA+ICsjZGVmaW5lIFNBU1JfUkVBRF9SRVEgICAgICAgIDB4
MQ0KPiA+ICsjZGVmaW5lIFNMQVZFX0lOVF9GTEFHICAgICAgIChTSUVSX1RESUUgfCBTSUVSX1JE
SUUgfCBTSUVSX0FWSUUgfCBcDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFNJRVJfU0RJRSB8DQo+IFNJRVJfQkVJRSkNCj4gDQo+IEknbSBub3QgaGFw
cHkgYWJvdXQgdGhlIGFsaWdubWVudCBoZXJlLCBjYW4gd2UgaGF2ZSB0aGUgY29sdW1ucyB3ZWxs
IGFsaWduZWQsDQo+IHBsZWFzZT8NCj4gDQo+ID4gKw0KPiA+ICAjZGVmaW5lIEkyQ19DTEtfUkFU
SU8gICAgICAgIDINCj4gPiAgI2RlZmluZSBDSFVOS19EQVRBICAgMjU2DQo+IA0KPiAuLi4NCj4g
DQo+ID4gKyAgICAgaWYgKHNpZXJfZmlsdGVyICYgU1NSX1NERikgew0KPiA+ICsgICAgICAgICAg
ICAgLyogU1RPUCAqLw0KPiA+ICsgICAgICAgICAgICAgaTJjX3NsYXZlX2V2ZW50KGxwaTJjX2lt
eC0+dGFyZ2V0LCBJMkNfU0xBVkVfU1RPUCwNCj4gJnZhbHVlKTsNCj4gPiArICAgICB9DQo+IA0K
PiBuaXQ6IG5vIG5lZWQgZm9yIGJyYWNrZXRzIGhlcmUuDQo+IA0KPiAuLi4NCj4gDQo+ID4gK3N0
YXRpYyBpcnFyZXR1cm5fdCBscGkyY19pbXhfaXNyKGludCBpcnEsIHZvaWQgKmRldl9pZCkgew0K
PiA+ICsgICAgIHN0cnVjdCBscGkyY19pbXhfc3RydWN0ICpscGkyY19pbXggPSBkZXZfaWQ7DQo+
ID4gKyAgICAgdTMyIHNzciwgc2llcl9maWx0ZXI7DQo+ID4gKyAgICAgdW5zaWduZWQgaW50IHNj
cjsNCj4gDQo+IHdoeSBpcyBzc3IgdW5zaWduZWQgaW50IGFuZCBub3QgdTMyPw0KPiANCj4gQ2Fu
IHdlIGRlZmluZSBzc3IsIHNpZXJfZmlsdGVyIGFuZCBzY3IgaW4gdGhlIGlubmVybW9zdCBzZWN0
aW9uPw0KPiBpLmUuIGluc2lkZSB0aGUgImlmICgpIHsgLi4uIH0iDQo+IA0KPiA+ICsNCj4gPiAr
ICAgICBpZiAobHBpMmNfaW14LT50YXJnZXQpIHsNCj4gPiArICAgICAgICAgICAgIHNjciA9IHJl
YWRsKGxwaTJjX2lteC0+YmFzZSArIExQSTJDX1NDUik7DQo+ID4gKyAgICAgICAgICAgICBzc3Ig
PSByZWFkbChscGkyY19pbXgtPmJhc2UgKyBMUEkyQ19TU1IpOw0KPiA+ICsgICAgICAgICAgICAg
c2llcl9maWx0ZXIgPSBzc3IgJiByZWFkbChscGkyY19pbXgtPmJhc2UgKyBMUEkyQ19TSUVSKTsN
Cj4gPiArICAgICAgICAgICAgIGlmICgoc2NyICYgU0NSX1NFTikgJiYgc2llcl9maWx0ZXIpDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiBscGkyY19pbXhfdGFyZ2V0X2lzcihscGky
Y19pbXgsIHNzciwNCj4gc2llcl9maWx0ZXIpOw0KPiA+ICsgICAgICAgICAgICAgZWxzZQ0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gbHBpMmNfaW14X21hc3Rlcl9pc3IobHBpMmNf
aW14KTsNCj4gPiArICAgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGxwaTJj
X2lteF9tYXN0ZXJfaXNyKGxwaTJjX2lteCk7DQo+ID4gKyAgICAgfQ0KPiANCj4gdGhpcyBjYW4g
YmUgc2ltcGxpZmllZCBhIGJpdDoNCj4gDQo+ICAgICAgICAgaWYgKC4uLikgew0KPiAgICAgICAg
ICAgICAgICAgc2NyID0gLi4uDQo+ICAgICAgICAgICAgICAgICBzc3IgPSAuLi4NCj4gICAgICAg
ICAgICAgICAgIHNpZXJfZmlsdGVyID0gLi4uDQo+IA0KPiAgICAgICAgICAgICAgICAgLyogYSBu
aWNlIGNvbW1lbnQgKi8NCj4gICAgICAgICAgICAgICAgIGlmICguLi4pDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiBscGkyY19pbXhfdGFyZ2V0X2lzciguLi4pDQo+ICAgICAgICAg
fQ0KPiANCj4gICAgICAgICByZXR1cm4gbHBpMmNfaW14X21hc3Rlcl9pc3IobHBpMmNfaW14KTsN
Cj4gDQo+IE5vdCBhIGJpbmRpbmcgY29tbWVudC4gWW91ciBjaG9pY2UuDQo+IA0KPiA+ICt9DQo+
ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCBscGkyY19pbXhfdGFyZ2V0X2luaXQoc3RydWN0IGxwaTJj
X2lteF9zdHJ1Y3QgKmxwaTJjX2lteCkNCj4gPiArew0KPiA+ICsgICAgIGludCB0ZW1wOw0KPiAN
Cj4gdTMyPw0KPiANCj4gVGhhbmtzLA0KPiBBbmRpDQo=

