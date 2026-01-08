Return-Path: <linux-i2c+bounces-14994-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A83B0D0221B
	for <lists+linux-i2c@lfdr.de>; Thu, 08 Jan 2026 11:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BAF633A728E
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jan 2026 09:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CEA3793A0;
	Thu,  8 Jan 2026 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="R8MWR12p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48C13590CA;
	Thu,  8 Jan 2026 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861491; cv=fail; b=TVZVcJyvcKt36z1IlxlETJtnzA02Ml55uKa/OlZj9yQT61RavD81t/+QzH+NbQ9czmauXaiz/S2XWsVJV+t8e6rO2OTv201rW/mHmS6usszEfoVI6ZuiXrPbjyu4RBpG+lcbq/xLOHQofXzgQaquX1alm9CZYJ56i9b0mthLSzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861491; c=relaxed/simple;
	bh=K/KFpXIEbY0R5VrRZxRyfRpay7PdsMG2JNx9ONWYNPs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rlLE6+95O8AXMa16BO6o5OVKCGH34X9b/pFPW1q+JBwSECW3tB9RZ2Ui5xgaMOrrBOdiizenOCDUuVBbJUwtOZeyAQHVclXTxlhTxeYVkinla7h26Q+F1en1UPWb0tTLAWyHWXkKkOKi1DBUTsm24DdMuQrKyBpQH7jMUK+9eOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=R8MWR12p; arc=fail smtp.client-ip=52.101.84.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bw7ceOMv3tsHyEU2YhP2Iyo2OZvpMgs64zlMA3Dby15yIcdkUEb2DAV5eA8+0O34JFG/90JubCvO/m7NgN5LBc7VjEXvNm0nVSYec44U/gAmu9DPz9OFwjoI3Qs2iuIL7mZZmuS1hYyW5oeyQWeNNwfrJZmGvdclUTYw/YhYLpGkrH6jzU6RKdw5xJsJu0JPnjfn/m3WJMu3nwXrRI5gfydLX4+UKIIW2A+kzim0BI+aapkw6FMv82odic1N7Sb7yZZdYqe351+qS5zYLQ9YxaVYRz6n+qVtvJKr0Zq08yF1ZZtVez0QZq2xEsodQiP6o397/3XulLBOsg0DHRryLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xx4AwN3NEYf8qNcHBrqlSSJVsew1BzCM3ucI5khArDw=;
 b=kNi/7f8hMygUIZoMAq+0bdxszPLNEfMWRTAHuf2/0kV7TwzVDpjNioCJsEHGHLdW9BTrZ0x+c7L7eYlsGzrrAU5zPZWFmeyDs3ptf5BDsqqSzenceU2AbFjLYT/N5gTIilyx+dEsiMJoDGhTk8/R/vBeB2lIxrcD/K4TOwXY+7EYhU/oe548fwPCfaqanDlr4MGqzLNNkrBSfywB6WjFhvwlp2k7vGG+Rn28zgodI3QcM2zzIhuUMp2O6iNesGFM4qBHSd+nRqQNRn2v2GYiOn5BiNAJUY75swS0F/oeRKY7AUsYNeMFiGCvRzFfcj7fiapCmCPLgSNhIPyz2L40qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass action=none
 header.from=leica-geosystems.com.cn; dkim=pass
 header.d=leica-geosystems.com.cn; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xx4AwN3NEYf8qNcHBrqlSSJVsew1BzCM3ucI5khArDw=;
 b=R8MWR12p5KBBjPBMcKVKix+DyySUnquF9HSfjR0jz0dgtpMj//8Pn99cYyXVxSQOGwhvt5KoRwEplOz/YRL1435bzJUUB0MUXPZOf4I6hSe0KPPVfr79mV+I9K0baHn6lw4hPOrVeWPCPCmZey4YDVgKuF2k+jBTabDzMJ9tyEo=
Received: from GV2PR06MB10809.eurprd06.prod.outlook.com
 (2603:10a6:150:2fa::21) by GVXPR06MB9768.eurprd06.prod.outlook.com
 (2603:10a6:150:1e4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 08:37:52 +0000
Received: from GV2PR06MB10809.eurprd06.prod.outlook.com
 ([fe80::f29e:9a49:43b4:80fb]) by GV2PR06MB10809.eurprd06.prod.outlook.com
 ([fe80::f29e:9a49:43b4:80fb%6]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 08:37:51 +0000
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: Andi Shyti <andi.shyti@kernel.org>
CC: "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, GEO-CHHER-bsp-development
	<bsp-development.geo@leica-geosystems.com>
Subject: RE: [PATCH V1] i2c: imx: Fix SMBus block read hang on zero length
Thread-Topic: [PATCH V1] i2c: imx: Fix SMBus block read hang on zero length
Thread-Index: AQHceJulRg4JDAkiF0mwNrMsygjneLVHMu8AgADKRgA=
Date: Thu, 8 Jan 2026 08:37:51 +0000
Message-ID:
 <GV2PR06MB10809C9AF32F95388E8DBF519D785A@GV2PR06MB10809.eurprd06.prod.outlook.com>
References: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>
 <aV60-Wm0c_Oo0zWF@zenone.zhora.eu>
In-Reply-To: <aV60-Wm0c_Oo0zWF@zenone.zhora.eu>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com.cn;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR06MB10809:EE_|GVXPR06MB9768:EE_
x-ms-office365-filtering-correlation-id: 0b0a5308-c4f5-4716-061b-08de4e91360f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?2IrpAtgAmspeIQD6vNmU01TP5gwFWJx+3XmAQoVxTdWXe7/4svO17yqgo2gl?=
 =?us-ascii?Q?JGxpihdqNJZoZfaKpE5/854mAHxZZQbQmh2hPWFs9qJoGdk3FDCHiaxFgDbu?=
 =?us-ascii?Q?n5lyeCbHA4em4o4D+mUU75qfj66xZZM1szs3e3V+MBZR6CXKtlLglETFFdxO?=
 =?us-ascii?Q?eXHngFfx+10BNtJBrMWK32ak0317SHXPvDWiEVN6/M53KpN6/MlLzsCTgM97?=
 =?us-ascii?Q?vj6Xbxi/Ob6j5djNlraJJASro02KlWlnso8y6vPiTPWUvJpYA4bSakF3dfRO?=
 =?us-ascii?Q?kz1iXtgOUeVMqpYkb4BB/Z9UtL2ZVmMauBWuAosEocZUwa9R9b2aLVwsk/lb?=
 =?us-ascii?Q?2V57+snaG6kb+mLRTH415PFO7jPfLlaPfdmdhJYmUPkHHrMJIvKmcoYjkQkZ?=
 =?us-ascii?Q?LOALsk+ssWc+P0ZSo4ohBShVzmI3wjGBF3vOkL+aXmhQtXQgYJOaYDniAiUu?=
 =?us-ascii?Q?ZqUXYF/METTeTSExKiUGVYahNsfAwv+hEMyxl0EJ6pPA4VEshrXGsqiqeYnD?=
 =?us-ascii?Q?pviRS/uVIF56vv2PdWdQqOweozY1UHfesPAVu0Fr/ndEbahr9tPUyQEEGc7S?=
 =?us-ascii?Q?tJRoadPnISe8bq5VHU8MS+HBqlg9x2PcBmAMpQZEgC9YwOyI7zwneoodrVSO?=
 =?us-ascii?Q?7Mb0Ws8RJoSg5goRBTD8C2noVWOcAdKgAChu0AHnnWcK1R/6T1a1bD7e1q/e?=
 =?us-ascii?Q?+LX/TrdQMayTPc4PRFPnLphRPt52gTDeIZcxyjfFp/d5eBlRsXSTxTzBEg/x?=
 =?us-ascii?Q?vgxI+2etKKtt8sNRIdPCdKjUUMuviy4YMXv16qvrkiwTBKs7cEZHEQceJH1N?=
 =?us-ascii?Q?kPGE6bn03rf1n6MxyrFLfHZx6lT/TNhr64c+CmMbTIE5xvhYEzUtpihs6Ryv?=
 =?us-ascii?Q?oW9l/JiqCqm0XDZ8QoraFLoeSUAk3FksulSfHCWY1RDvf41F+iIaoEnePGYS?=
 =?us-ascii?Q?HbHO46yq8bEa4GgzX7FPaGXypKFcaYXHdtFE0dRP+blhlYq4I6aPCoa+Lnuz?=
 =?us-ascii?Q?LUb6bgj9HXiOwTJ79sgL7lkguAg6uWeYjHdwosNDIIk+QBAVITwtMd5egwSQ?=
 =?us-ascii?Q?TEXrV8+ulTYpyDJ/tLDWRPK5LtV+g3q9Hlcf2A2koa6uArnF1cL640rQVmLP?=
 =?us-ascii?Q?kLtKPxaJW3cxLvThvphb+QhV0SoG27jhJbaWdtGViUAcrxeEL0brcaJt0yBs?=
 =?us-ascii?Q?lC5931LWxKTx2Lo8SQQpzwKP4C2O2apycWhIoWnoCF/bHDKWMGS+NyTODFFr?=
 =?us-ascii?Q?Aq3cspK7obvM52yI/OqcT703qaq6m7aZqnWd3RU9wnNNuP7NMaPuK0d5HIIG?=
 =?us-ascii?Q?/m5sIrMQhjhoDqf3XfOIs9V8bZAC+yxm2jPnxA+KjoQylmsHLAn1wv3r9K9T?=
 =?us-ascii?Q?A1m+UoKYsSRQvC/uPY47qyOHWEeB7PRQq+9xPU/TMfxbLobgpsOtowFRdACj?=
 =?us-ascii?Q?5WY0e+qGFPLqQP4aP8cUdjgJd94B7JUMmPHhm4vWkCN2JsR/Jp3CEFtlWqui?=
 =?us-ascii?Q?z/Efhu3gbbknHX2OkSAl6BI/kbQQvrPzUrIR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR06MB10809.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DwFBvhb+DfOCf/yu/QMULq/n+Um6aWHELf0fjnQLwIqnhURYQWEq/nc3szv8?=
 =?us-ascii?Q?0L9dlHv32dkfpDyUeOEmfdWogmJI32nZZPtKYgl7ERHYCbrEYw/FfYkY1ccq?=
 =?us-ascii?Q?Qr+KiwgcPEvS0JPqFHVXNrzawVlR3o6/SIvkObTLXxzaGpynHD0lVdwrCQdq?=
 =?us-ascii?Q?JRkNH9p+qZd2/9oGrP0Gq471C+akPCRJy6DXJ+atGMXpG7g5fhdbRUlm1WTr?=
 =?us-ascii?Q?gbc8ZjFY4BeX7+5BdIgapXKqi+j5aAtPhrdtUtly05dKQWqA+hepcTrFUN4q?=
 =?us-ascii?Q?6Bq4PPURptCfTZmkE6LZnNtAQ9skut6jWglQCPc0Q3moow+CCEHf/UBfKFMC?=
 =?us-ascii?Q?NgvDTM6TPQLvWPAH4wZA0EPhgiNvzdztK9rT4iqggZUJ3lKWq/SOmcepK5Mv?=
 =?us-ascii?Q?rpopHJkBgv8kFLd4rjXVkbLmMwrZvdcwlYZbSpJc6eu74dgFjTCSw/NtbKKU?=
 =?us-ascii?Q?8F/ZbqRYGr1zsV13YcbzQobUIxaGMtG+UmFbJV2cd+984TCELY3/8a7D6hfT?=
 =?us-ascii?Q?lJsO2DUxB0AgBcD761D/ARv5GQZsPvOGSYP2pMyNxzzirYHr6hDeonnq6paI?=
 =?us-ascii?Q?iH4M8P+7JkOCCx2l9df0vWIl2iE+lkiq2/HROHQSe5GrTJMDRUln6uZLbUfK?=
 =?us-ascii?Q?0hx0NjfbvxhO9LsQKPR+is+62+crtfWD1ZUYq5IEKKSECNLNRVkBCwuoHqwY?=
 =?us-ascii?Q?FCWxjIKDO8qyuNtFfJdBjjOYEL40HNfPJ4rdnyYCvKuN6XBwnjmG2SgirUiU?=
 =?us-ascii?Q?tbCQWigcgnaaV+KdcsFbl/6vWSCg4BeintLtmYjl+XNUPxpo9yWnVr/+TWLf?=
 =?us-ascii?Q?yJJ6K+oZcKeZBNMwq0PBx1xNjvGMXVekvWQ6UBtrw3zjyM7EMFgAYdqp9VUE?=
 =?us-ascii?Q?oS8RUGmaPwT2GsEtI0iPdxaOsvyOetmG6LlDxXh/IfOoGuuomcvtAHz/gUXE?=
 =?us-ascii?Q?oLcJz7R10HIqAIs2X4J2fxlMKmYo+13wIjZBiEoFo6e1rxV16uRpbUg6N0vD?=
 =?us-ascii?Q?Tv28Id+ou06YwXW+wa9/MGULOqVSjBn9jKtURlUg/UoM5ek8MH+tyUExlZbk?=
 =?us-ascii?Q?IHxf/IaROIdB7BpzaFT+aoteZ0HR/vHmCdyM4uPMnv98Ar3YFkPWycN6tzZN?=
 =?us-ascii?Q?v3ggFkFCd/UoZU18OkgqtM/9Culh3PPvuVgKKKF5TOSQooYe6tDT/o+JyXO8?=
 =?us-ascii?Q?P/F6BeOpE1QO1jiuqT5Ecxujy0Wrs+toL5VFNRA1+b1jJStNbTiqJHdVcV4p?=
 =?us-ascii?Q?nMXeBX0EcdUmY5zR90Jxdo7TVmTxeLIIYoTILrZ95d2n5m3y4a/u/6vRCDA1?=
 =?us-ascii?Q?T2BUEA6XRWxq7xv3YCtOiUzZ3yxDNDUCyaEZDReCUh4eicN0aRQ0BYYVdo0Z?=
 =?us-ascii?Q?ylkimAV6Aoz76DdZVlPktmXNiB+XY3WiBPJ/thbQ00g3Y2qYorXRzLjoTafs?=
 =?us-ascii?Q?7O9h8Gjvywxv8jQxd8mrvdc6GYpSuoBv6eyRQyaaaZL0LIDvRNbq1iovALQZ?=
 =?us-ascii?Q?dwEgraUW05WsFCDrJxTFaGrt8F9bh3sAxp3kssZ/54V8mlPyQraRx5kU+9yr?=
 =?us-ascii?Q?f1DpILApWWqW36Yx0tJ/2s5M/YO2tm7HBXMSgxDP15fuIE6LqHK2UslNmwQr?=
 =?us-ascii?Q?zsq3E+/a5R+zZZLA6wjGTTZJauXeJazsY+xJHyuWyMx2BkgWQesgyrGkBDCJ?=
 =?us-ascii?Q?ipVnMZ1jO7lxYG7F7KqVbzKxAUI4tIBCO6Qo4uVdboTu8aSBp67M8RpeRWrG?=
 =?us-ascii?Q?sKGY+MK94xkg8OO2IeWpUUpHdlq3hHo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR06MB10809.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0a5308-c4f5-4716-061b-08de4e91360f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 08:37:51.6994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: njl2DtvvIo8PcBWf8NWgUA9rtFqOZeWVV3hQpw+QnhFygfMaSaY4AAK7KKuw8c11q4zSdwvi4DR0Gb1Sgv3JBO+9ZPnS1Bs29xTIg8xDYj3ktxeY/pJ7/KhVys8yRp0i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9768



> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Thursday, January 8, 2026 4:13 AM
> To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> Cc: o.rempel@pengutronix.de; kernel@pengutronix.de; shawnguo@kernel.org;
> s.hauer@pengutronix.de; festevam@gmail.com; linux-i2c@vger.kernel.org;
> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; GEO-CHHER-bsp-development
> <bsp-development.geo@leica-geosystems.com>
> Subject: Re: [PATCH V1] i2c: imx: Fix SMBus block read hang on zero lengt=
h
>=20
> [You don't often get email from andi.shyti@kernel.org. Learn why this is
> important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> This email is not from Hexagon's Office 365 instance. Please be careful w=
hile
> clicking links, opening attachments, or replying to this email.
>=20
>=20
> Hi,
>=20
> Can anyone from Pengutronix give this patch a look and possibly a try? Ol=
eksij?
>=20
> On Mon, Dec 29, 2025 at 08:16:29AM +0000, LI Qingwu wrote:
> > SMBus block read transfers encode the payload length in the first data
> > byte. When this first byte is zero, there is no payload and the
> > transaction should terminate immediately.
> >
> > On i.MX, if the first byte of an SMBus block read is zero, the driver
> > unconditionally overwrites the state with IMX_I2C_STATE_READ_CONTINUE.
> > This causes the state machine to enter an endless read loop,
> > eventually overrunning internal buffers and leading to a crash.
> >
> > At the same time, the controller remains in master receive mode and
> > never generates a proper STOP condition, leaving the I2C bus
> > permanently busy and preventing any further transfers on the bus.
> >
> > Fix this by handling the zero-length case explicitly: when the first
> > byte is zero, ensure that a clean STOP is generated. In this situation
> > the controller is in master receive mode, so it must be switched to
> > master transmit mode before stopping. This is done by draining the
> > pending received byte from I2DR, setting I2CR_MTX to enter transmit
> > mode, waiting briefly for the mode change, and then proceeding with
> > the normal STOP sequence.
> >
> > This change has been tested on i.MX 8M Plus platform.
> >
> > Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
>=20
> Is this a fix?

Yes, this is a fix. Without this patch, zero-length SMBus block reads cause=
 a system crash=20
and permanent bus lockup on i.MX 8M Plus. The fix ensures proper STOP gener=
ation and=20
prevents buffer overruns.

> > ---
> >  drivers/i2c/busses/i2c-imx.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx.c
> > b/drivers/i2c/busses/i2c-imx.c index dcce882f3eba..f40deecf0f66 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -735,6 +735,16 @@ static void i2c_imx_stop(struct imx_i2c_struct
> *i2c_imx, bool atomic)
> >               temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> >               if (!(temp & I2CR_MSTA))
> >                       i2c_imx->stopped =3D 1;
> > +             if ((temp & I2CR_MSTA) && !(temp & I2CR_MTX)) {
> > +                     (void)imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
>=20
> why do we need a cast here?

The void cast explicitly marks this as a dummy read. We're reading I2DR sol=
ely to drain the
receive buffer (a required side effect before mode switching), not because =
we need the value.
This makes the intent clear to both the compiler and code reviewers.

>=20
> > +                     temp |=3D I2CR_MTX;
> > +                     imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> > +                     if (atomic)
> > +                             udelay(25);
>=20
> where is this 25 coming from?

It's a conservative value derived from practical testing. at standard mode =
(100kHz),
this equals ~2.5 I2C clock periods; at fast mode (400kHz), ~10 periods

>=20
> > +                     else
> > +                             usleep_range(25, 50);
> > +                     temp =3D imx_i2c_read_reg(i2c_imx,
> IMX_I2C_I2CR);
>=20
> Thanks,
> Andi

