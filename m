Return-Path: <linux-i2c+bounces-8250-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F07789DB2F1
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Nov 2024 07:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BFC3B20D35
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Nov 2024 06:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C87145B21;
	Thu, 28 Nov 2024 06:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="j3ZHGgiS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2072.outbound.protection.outlook.com [40.107.104.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1162E13B590;
	Thu, 28 Nov 2024 06:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732776851; cv=fail; b=BGmo28CfbZhQP8sw3vKC4hIk6iKVuqU8AZbJv75SA+hgtAKHCSnVQDfXr+NOhEdtH6SISmtLR9Sc6wCHJIUB7qqAwXZPqorAjf6XbME3kcyu+EUKQF6kgliXgUhKrvGptY9Mjy5ZGclN+0ALK9+S3DC0UbZ5XqX7ObaqpC1gSMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732776851; c=relaxed/simple;
	bh=LWzkNBOn2iOe61OikU8b4oJLSKLFt+2s2dlRr507j0c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GUj68CjyniUt0ECPNDOqqlOfes5A3BPyPslCUKQEqZw0npk1KwqENQsxUBCzHoCWfbvM56X5rC7B3g++uDlK/ZknFhpAfW/FJeS84n8axspso3aE8sellvZzBDldvrmn4eHCiDKvCL8D5hAbAMjVukNz3rzkmwcFneCpBA5GBm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j3ZHGgiS; arc=fail smtp.client-ip=40.107.104.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylGrO8FaUHmpuOB/sch+kdVwF+hbOM7ztRgIWZSpHGZvE92zhK7Gk81DtT09gIemH+A8j+FhYabn6tgMjBScx9oJyXNyWR8x5tuaPYZA9cEH9XG+rXKIfHs0bFIuuJ9lHY+1C5AXBJhazCXTp4+g+1VQ3bSuiXGbQBr2UxmGpRHRj/QzECYPbWIlbWI2SPOahE/zEHD0QjNrkSXD1Y8JIdyFqC1vfoXFIiZs6EFOihwb07xcW7+EbFLdF4MdiW0WLEZ3rFqWzkKRbymy4STlRiqN524O8c7Jvb+sq0uyj6Gs/qpvcbqMS+oCEpTt/RWWuWJ6bBqOxAnlGDc/nKANlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tgeg+e/ZvUXKZDYTynkZgpbU0g6UXeS4r9Ja5ZQpj3U=;
 b=pPaoLnefsunAaZy4C1PpU10w90SRcC+Kt2PzMKrYLjM7I3Q0HvXeV5cGYL6U9okgw/Qjqa5oxwERcJwDcn3Z37NE5TiKabwGFriloEUGX/f+ygJV2uHZMYIKVFwR/5xxKDDLjo43tgJOggzR+v29gHEDb2uNet0q7RHOHQlptzCuNC0I1nCi4p6UxiOci7ygtAARx8S/128cZb95pa1PxFLEhVWdRDXJIuyyC5tFXkfs3XV8hwBrbYCexKNYMGl6yGb12BciDy5s5VhE4H6d45KkcroxgXxTeTiFk54HsU76hM6O4264addKXyZQbEVZf9494QloOsu9fQq4yLvutA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tgeg+e/ZvUXKZDYTynkZgpbU0g6UXeS4r9Ja5ZQpj3U=;
 b=j3ZHGgiSiL2ND+CGOPJfMKJqr40+CNAmtC3i+LDf58Z1V6tEaoKq1S1cqPRJnffqWCPYWTsPVEmhiWlXqHwV/tZh2XmFJe9ihfXGdhN7ajy8qntxJV/+96nDWAqJ7bY6MR3pmvhKezKTEoarOh9/i89hDvIY8mEYnYVW0NW7wxUk69197ck7pd5Nnk3Prguy5mhBEEvKr3vGu2Q+Qpt/6OxYAHwVg29KtUFResi/wKvT28ofYPsdZQ7cdQjxogL0ZpHHy/nwjYgoAFrtUA1xQ9wlDKfd9WhGeYcrmBlrQs0Wg2mpDzaoOs9IY1KeWqkuPYcOrY/TgrQ0YQnlTmE3qw==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AM8PR04MB7809.eurprd04.prod.outlook.com (2603:10a6:20b:242::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Thu, 28 Nov
 2024 06:54:04 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Thu, 28 Nov 2024
 06:54:04 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, "mkl@pengutronix.de"
	<mkl@pengutronix.de>, Frank Li <frank.li@nxp.com>, "o.rempel@pengutronix.de"
	<o.rempel@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4] i2c: imx: support DMA defer probing
Thread-Topic: [PATCH v4] i2c: imx: support DMA defer probing
Thread-Index: AQHbQLkj2JmsLENAeEerpa0YTZxURbLMBLQQ
Date: Thu, 28 Nov 2024 06:54:04 +0000
Message-ID:
 <AM0PR0402MB3937CD206F229B750EB790E4E8292@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241127083818.2108201-1-carlos.song@nxp.com>
 <153e8e36-7b0e-4379-9cc3-6dacb5d705be@pengutronix.de>
 <AM0PR0402MB39370E69BC4B71C761EE8377E8282@AM0PR0402MB3937.eurprd04.prod.outlook.com>
In-Reply-To:
 <AM0PR0402MB39370E69BC4B71C761EE8377E8282@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|AM8PR04MB7809:EE_
x-ms-office365-filtering-correlation-id: 94fdaea2-7382-4489-c8de-08dd0f7972be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?L37PCkJ8H5oAJIoVcqYVqmdJ4RelLm7KG4+23eGAg2kA3wRgnV7fE4AF6q1X?=
 =?us-ascii?Q?hLTAmhyGX0DLIkMoyiK7HVcePXePkN+SV3TwY3SmKLozBMOOQCyQrj6TLBPH?=
 =?us-ascii?Q?phzP4nRaVBCLFxzP4DDCRDJq7WITKHlkQRalE8UzvLKa8GHKTmLSwOxRrnW/?=
 =?us-ascii?Q?cBsoeGgszBsw95flnojkw1K6BHxQNCkkpMciYqvLjm7+7bGS1e88QZWM4HKO?=
 =?us-ascii?Q?KNKf6cjd5sax5j7XhAGKWkgrKyFCkY1Iffusy0Qd+jZyvW+BZqOGHhcYZhzw?=
 =?us-ascii?Q?EM+V1hAWjnBHXmPBV92pwxCKUvaNoMmYu5OTFXKLOl/yNeWUr9Zb4Aj4X2xz?=
 =?us-ascii?Q?l9abiFy0ANF6KgjWrYK+q3YGs56sfhn3BAMm320gp3AHvKFFhtY/K64omxR/?=
 =?us-ascii?Q?VWdcP0jD21IUN1VOTE1ekYYAngqOFxCmQ86Ie6U4kIPQXMK4+VaDVQgNTBnb?=
 =?us-ascii?Q?mAkVqgb5FoS1RfnmVwe2bSjOg6Z4E2Oe85O2sSpjORcov0OOstznc8nRAkou?=
 =?us-ascii?Q?dceuJD+XIVV4L+1TBxbMFg3W9iLrf+4OokhDF9cKS7MpVAD8sRyS32/rH8HV?=
 =?us-ascii?Q?tpfUzz8Dy/3md90muVSwoo7FYjEWRrGNM1Y5a/L6to5FgGoyv097QGcJON1W?=
 =?us-ascii?Q?tqMxnjGzYxWHBvExB2f1AOFjgPYxX/gNodRu9ZxH/5SQ8LpVJlAOutytxnVV?=
 =?us-ascii?Q?3+wZAtZ0QaYARbDUy3rk18ZTKvsyBeb3GmxaE3MEesvOFEcGh7K4opbvzuwE?=
 =?us-ascii?Q?If+gVAMWntn/FuCMjZ+DwsrfBuSySUptOgAZGvRgu0Q+jkqjUse4AJTdROhE?=
 =?us-ascii?Q?OZe19XlPgkQjBnyDQF7jK/TDUMGSl1eqLvaiM+MkHRTTvOUaesbbUJc2AphQ?=
 =?us-ascii?Q?5Mj9VZcSExVj1gfy/F98ZKOYUVno5GLtc1IY7R3V21nb/JEjHic6OyILNMzq?=
 =?us-ascii?Q?BnQ00WTeVGw09jEfr5AiN3IZqmG4yXJCRG0NocNzlLEnGajIB9qGhQkcKQBr?=
 =?us-ascii?Q?zESCScnMJa6Hde30HdbP5w4k7zuwgPQq5VuqblpqnzDABhbdHBrKLnBWz2UF?=
 =?us-ascii?Q?+1qt736G1mEOTigYqU/PD4AQj68+0fDXvecgar4J4atTj10m1Sp0g8UjMinU?=
 =?us-ascii?Q?wAmDN/7zwvCVqPFtmKeZ2oWluhqhlCezappvqqXuBWhK0wZCbBWSx7H1cAGi?=
 =?us-ascii?Q?90FmfkLiLoZGqFjV1gdeCl+0azs5Ec52eZwbUoGCa1eqzZxMXUrFIOMLLBIw?=
 =?us-ascii?Q?BxZCbkiZgJkDDGUe03RQTFo1Jqryjoe3hKwOqZVx1bWUi520q/snzT0xNzgA?=
 =?us-ascii?Q?LYkzkgrtKLYIQOmNGjXndzFERChzHKzD1npiP1YJmHIzc78FKSKZ+FWoooX9?=
 =?us-ascii?Q?A9YZ89A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?A3rIPigZsg8AE9yuYTRpj9kQcj7Ui0J1u7LClGyiirus+UUmVED2Q1bmHQhu?=
 =?us-ascii?Q?CHKpSs+MVgufLhfy1xyXOtZU8twF5qW0kwq5RLuZ9AyGWCRiufGoni3dX9pu?=
 =?us-ascii?Q?eYDSgOSYsDR4wUcebSQVJx1D73AEXitZs8tmAE7TqK685nqOttUIdTSmrL/9?=
 =?us-ascii?Q?WZYgbfYeef3g7mhM7UrUwBgt/FfU7pBxnGvCzmK94lK1GbJyhsUVK4r3nntH?=
 =?us-ascii?Q?49OHZJNLTkEXZBIjFTGNEEYil4xFAD0PqMjkGw3YJ1Z9AZng6C5NUCXPu1iH?=
 =?us-ascii?Q?1rP1xjvXPBqAaRUGMoZatX6odyzRx9dWuPBAF4/eFqMwcsSj4lsLGUY37ooo?=
 =?us-ascii?Q?OiMWbYMQ/x+PGqJs69iy145Veh+1vWuVjepH9TqVER7/umlROJ1wJe3vFEiT?=
 =?us-ascii?Q?J9EoS5jxOLWWjaiXFdleteIF00iv0avTw0kRBvJ5yRgTd4KtrcmYTOrR6ZM3?=
 =?us-ascii?Q?5bmWZz3ZwxRdqzP2Bwqy1umbmQBM9t5AtiXn6VUFcVfqJZHuCSw58VLsU1ej?=
 =?us-ascii?Q?KxrnJuMScUXFLbscgYDMGOJfppMAt5L17rr3GnmYd0niQrogPjzn4va274L3?=
 =?us-ascii?Q?3qfiYhk5vSG8uAYSzGnRPfhNeTETC9CA4pWtMpo5vDWadPF7PHWvbTGajZ5C?=
 =?us-ascii?Q?aj6biUPzQZkaGDkCxgeCukiIUf2L9BUeZO/QruSIo0qXFqwveGxCrW5huoko?=
 =?us-ascii?Q?LXI6dukFBpVWAWz4u21MVCid3sqBKrSEkOKSsGwyt6wP6DvX+uVmCOtjHrxs?=
 =?us-ascii?Q?oBke0vI2shjvUG8DoACbSw5y5TpwhlAtIO7tlYo2y8oQPhqwbT1ES8INLS8B?=
 =?us-ascii?Q?mHGdmpqxamZJY7cdIYa84PE0Us6DncGnfUbDCSIx67pdLznSEiC4a3n7/Zbm?=
 =?us-ascii?Q?GzWuNG0lo0I6TNtv4q7WxsvsUJRxWT521iSvAG++X75/25UfvBLMKhSBKEJ3?=
 =?us-ascii?Q?KUHZ1ELjxGzcQbSejMcOATObu770+CrtIVs/yqdvsHARwxvgG5lBwBBTLQDH?=
 =?us-ascii?Q?4TInwacB4Fe4obNO721LzZt/n0QKI2mv8gwTjpG8r3hFBeVu9q6snd2IKxI2?=
 =?us-ascii?Q?FXPOj9/e2e0gDdERbodUimu0hDHZWWPnWbalfXzYXxkvRu8XRH3C5R/39wfT?=
 =?us-ascii?Q?Jd/UtpJo87SzrbdwoMjSNMfmwxoEBwqJ9X0MOnqRIUCZgOdIgHgs+4Xz2FAA?=
 =?us-ascii?Q?zlLBbKq7/SseAUd+TFQxZDVLjiK+MLt8wEsSi5i66C1xUkojrp2G6QK8YizD?=
 =?us-ascii?Q?A4Seu8zLgsugdFGhlndsKDWds5KLFBffYmM+UCpES3u0jTF5FEAnireXKaCN?=
 =?us-ascii?Q?sCNOPrCAGKWwRe9HVE6WolWLRxsHd79nyMBzipf+kqAtIckmFm70fxOBp2YN?=
 =?us-ascii?Q?89TabRL6+YgKQQ7NRMh+79CwcX+Edt0H2vEwB1HdY4JFWDEVPqSc+Vje/l8b?=
 =?us-ascii?Q?n6c0aR6ZGyPbV+qy33a/kBfQoi0jId26FlUfgJQWiBeDduPNm4wtUMk8oKx1?=
 =?us-ascii?Q?7+Q2Ti9zUB2S/3/aCHjIczpj9e1JFtUfqkxC1Tt+uD3oZUT9NGg33hTs5Qfw?=
 =?us-ascii?Q?2sM78GjMm40HGz/VcSU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94fdaea2-7382-4489-c8de-08dd0f7972be
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2024 06:54:04.6633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: orrPNjNbiYfYdHPpq5tN7Bikk6r4O5/bz+a635Iwigvxwjhh9kj+p9FFVGpL2qKSN/TyEDinUTCE9atVVJ2jzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7809



> -----Original Message-----
> From: Carlos Song
> Sent: Wednesday, November 27, 2024 6:43 PM
> To: Ahmad Fatoum <a.fatoum@pengutronix.de>; mkl@pengutronix.de; Frank Li
> <frank.li@nxp.com>; o.rempel@pengutronix.de; kernel@pengutronix.de;
> andi.shyti@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de;
> festevam@gmail.com
> Cc: imx@lists.linux.dev; linux-i2c@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v4] i2c: imx: support DMA defer probing
>
>
>
> > -----Original Message-----
> > From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > Sent: Wednesday, November 27, 2024 4:38 PM
> > To: Carlos Song <carlos.song@nxp.com>; mkl@pengutronix.de; Frank Li
> > <frank.li@nxp.com>; o.rempel@pengutronix.de; kernel@pengutronix.de;
> > andi.shyti@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > festevam@gmail.com
> > Cc: imx@lists.linux.dev; linux-i2c@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: [EXT] Re: [PATCH v4] i2c: imx: support DMA defer probing
> >
> > Caution: This is an external email. Please take care when clicking
> > links or opening attachments. When in doubt, report the message using
> > the 'Report this email' button
> >
> >
> > Hello Carlos,
> >
> > On 27.11.24 09:38, carlos.song@nxp.com wrote:
> > > From: Carlos Song <carlos.song@nxp.com>
> > >
> > > Return -EPROBE_DEFER when dma_request_slave_channel() because DMA
> > > driver have not ready yet.
> > >
> > > Move i2c_imx_dma_request() before registering I2C adapter to avoid
> > > infinite loop of .probe() calls to the same driver, see
> > > "e8c220fac415 Revert "i2c: imx: improve the error handling in
> i2c_imx_dma_request()""
> > > and "Documentation/driver-api/driver-model/driver.rst".
> > >
> > > Use CPU mode to avoid stuck registering i2c adapter when DMA
> > > resources are unavailable.
> >
> > Please try to address open questions before sending new versions of
> > the patch set. Otherwise, it's difficult to follow the conversation.
> >
> > Did you see my question[1] on your v2:
> >
>
> Hi, thank you so much! So sorry about it... I missed it yesterday. I will=
 answer
> your question[1] in this mail.
>
>
> > | Wouldn't this break probe for all i2c-imx users who have
> > | CONFIG_IMX_SDMA disabled?
> > |
>
> I have tested i2c probe at IMX and LS platform when DMA disabled, it won'=
t
> break i2c-imx probe.
> When require DMA channel in i2c_imx_dma_request, find no devices and retu=
rn
> -ENODEV, as you see at V4 patch, it will continue to probe and work in PI=
O
> mode.
> I2C adapter should keep available whatever DMA mode is or isn't enabled.
>
> > | Also I am wondering on what kernel version and what configuration
> > | (CONFIG_I2C_IMX=3D?, CONFIG_IMX_SDMA=3D?) you have that made you run
> > | into this situation.
> > |
>
> I want to correct something, these code about DMA in i2c-imx.c is for eDM=
A not
> for SDMA.
> For eDMA mode, I have tested this patch at layerscape-1043 platform. My p=
atch
> is based on
> cfba9f07a1d6 (tag: next-20241122, origin/master, origin/HEAD).
>
> Test log is :
> No apply this patch:
> CONFIG_I2C_IMX=3Dy
> CONFIG_FSL_EDMA=3Dy
> root@ls1043ardb:~# dmesg | grep i2c
> [    1.162053] i2c i2c-0: IMX I2C adapter registered
> [    1.166826] i2c i2c-0: using dma0chan16 (tx) and dma0chan17 (rx) for D=
MA
> transfers
> [    4.722057] i2c_dev: i2c /dev entries driver
>
> Not apply the patch:
> CONFIG_I2C_IMX=3Dy
> CONFIG_FSL_EDMA=3Dm
> root@ls1043ardb:~# dmesg | grep i2c
> [    1.166381] i2c i2c-0: IMX I2C adapter registered
> [    4.719226] i2c_dev: i2c /dev entries driver
> (result shows i2c not enabled the eDMA mode) root@ls1043ardb:~# i2cdetect
> -y -l
> i2c-0   i2c             2180000.i2c                             I2C
> adapter
> root@ls1043ardb:~# i2cdetect -y 0
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:                         08 -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: UU -- -- -- -- -- -- -- -- -- -- -- UU -- -- --
> 50: -- UU UU UU -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- 69 -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
>
> After apply the patch:
> CONFIG_I2C_IMX=3Dy
> CONFIG_FSL_EDMA=3Dm
> root@ls1043ardb:~#
> root@ls1043ardb:~# dmesg | grep i2c
> [    4.697046] i2c_dev: i2c /dev entries driver
> [    7.304142] imx-i2c 2180000.i2c: using dma0chan16 (tx) and dma0chan17
> (rx) for DMA transfers
> [    7.313532] i2c i2c-0: IMX I2C adapter registered
> (result shows i2c probed after eDMA module installed) root@ls1043ardb:~#
> root@ls1043ardb:~# i2cdetect -y -l
> i2c-0   i2c             2180000.i2c                             I2C
> adapter
> root@ls1043ardb:~# i2cdetect -y 0
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:                         08 -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: UU -- -- -- -- -- -- -- -- -- -- -- UU -- -- --
> 50: -- UU UU UU -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- 69 -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
>
>
> > | I'd have expected that with fw_devlink enabled, the I2C controller
> > | wouldn't be probed before the DMA provider is available.
> >
>
> This is a legacy patch, it has been in our local tree for a long time. Th=
e related
> history is relatively vague.
> I reproduced the problem and found this patch is effective, so I referred=
 the
> community patch and legacy patch to rewrite the commit log(I am not sure =
if
> this would happened in some cases so I kept this information).
> Now it seems that these descriptions are redundant. I should completely
> removed this in the commit log:
>     Move i2c_imx_dma_request() before registering I2C adapter to avoid
>     infinite loop of .probe() calls to the same driver, see "e8c220fac415
>     Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()=
""
>     and "Documentation/driver-api/driver-model/driver.rst".
>
> [1]:
> https://lore.kernel.org/all/19a43db4-db5c-4638-9778-d94fb571a206@pengutr
> onix.de/
> [2]:https://lore.kernel.org/all/153e8e36-7b0e-4379-9cc3-6dacb5d705be@peng
> utronix.de/
>

Hi, Ahmad

I have done more test about following comment in [1]:
----------------
> | I'd have expected that with fw_devlink enabled, the I2C controller
> | wouldn't be probed before the DMA provider is available.
>

This is a legacy patch, it has been in our local tree for a long time. The =
related history is relatively vague.
I reproduced the problem and found this patch is effective, so I referred t=
he community patch and
legacy patch to rewrite the commit log(I am not sure if this would happened=
 in some cases so I kept this information).
Now it seems that these descriptions are redundant. I should completely rem=
oved this in the commit log:
    Move i2c_imx_dma_request() before registering I2C adapter to avoid
    infinite loop of .probe() calls to the same driver, see "e8c220fac415
    Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()""
    and "Documentation/driver-api/driver-model/driver.rst".
----------------
You can refer the link about the history:
[1]: https://lore.kernel.org/all/AM0PR0402MB39370E69BC4B71C761EE8377E8282@A=
M0PR0402MB3937.eurprd04.prod.outlook.com/

I don't know if I have understanded you rightly. But I am trying your expec=
t.
I create a new case, only add "return defer probe and error in i2c_imx_dma_=
request()" and
still keep i2c_imx_dma_request() after the adapter register.

The code step like:
  ret =3D i2c_add_numbered_adapter()
  ...
  ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
  if (ret =3D=3D -EPROBE_DEFER)
        goto delete_adapter;
  ...
  return 0;

delete_adapter:
        /* remove adapter */
        dev_dbg(&i2c_imx->adapter.dev, "adapter removed\n");
        i2c_del_adapter(&i2c_imx->adapter);
clk_notifier_unregister:
...

Now,
CONFIG_I2C_IMX=3Dy
CONFIG_FSL_EDMA=3Dm
As you expected, if I understand rightly, I think I shouldn't see any i2c p=
robe log until DMA is available.

When I make all i2c devices module installed, i2c still defer probe if DMA =
is not available.

root@ls1043ardb:~# dmesg | grep i2c
[    1.153535] i2c i2c-0: IMX I2C adapter registered
[    4.705068] i2c_dev: i2c /dev entries driver
[    4.995118] i2c i2c-0: IMX I2C adapter registered
[    5.003324] i2c i2c-0: IMX I2C adapter registered
[    8.079458] i2c i2c-0: IMX I2C adapter registered
[    8.213536] i2c i2c-0: IMX I2C adapter registered
[    8.278704] i2c i2c-0: IMX I2C adapter registered
[    8.283669] i2c i2c-0: using dma1chan16 (tx) and dma1chan17 (rx) for DMA=
 transfers

However when I make some i2c devices build-in, the infinite loop of .probe(=
) calls
will happened:

[    5.004716] ina2xx 0-0040: supply vs not found, using dummy regulator
[    5.012526] ina2xx 0-0040: power monitor ina220 (Rshunt =3D 1000 uOhm)
[    5.021217] pcf85363 0-0051: registered as rtc0
[    5.027042] pcf85363 0-0051: setting system clock to 2020-12-05T14:02:14=
 UTC (1607176934)
[    5.035644] i2c i2c-0: IMX I2C adapter registered
[    5.045357] ina2xx 0-0040: supply vs not found, using dummy regulator
[    5.053111] ina2xx 0-0040: power monitor ina220 (Rshunt =3D 1000 uOhm)
[    5.061748] pcf85363 0-0051: registered as rtc0
[    5.067569] pcf85363 0-0051: setting system clock to 2020-12-05T14:02:14=
 UTC (1607176934)
[    5.076148] i2c i2c-0: IMX I2C adapter registered
[    5.097323] ina2xx 0-0040: supply vs not found, using dummy regulator
[    5.105081] ina2xx 0-0040: power monitor ina220 (Rshunt =3D 1000 uOhm)
[    5.113585] pcf85363 0-0051: registered as rtc0
[    5.119402] pcf85363 0-0051: setting system clock to 2020-12-05T14:02:14=
 UTC (1607176934)
[    5.127958] i2c i2c-0: IMX I2C adapter registered
[    5.139289] ina2xx 0-0040: supply vs not found, using dummy regulator
[    5.147014] ina2xx 0-0040: power monitor ina220 (Rshunt =3D 1000 uOhm)
[    5.155584] pcf85363 0-0051: registered as rtc0
[    5.161427] pcf85363 0-0051: setting system clock to 2020-12-05T14:02:14=
 UTC (1607176934)
[    5.169968] i2c i2c-0: IMX I2C adapter registered
[    5.181278] ina2xx 0-0040: supply vs not found, using dummy regulator
[    5.189015] ina2xx 0-0040: power monitor ina220 (Rshunt =3D 1000 uOhm)
[    5.197515] pcf85363 0-0051: registered as rtc0
[    5.203394] pcf85363 0-0051: setting system clock to 2020-12-05T14:02:14=
 UTC (1607176934)
[    5.211930] i2c i2c-0: IMX I2C adapter registered
...
[   26.405830] i2c i2c-0: IMX I2C adapter registered
[   26.413765] ina2xx 0-0040: supply vs not found, using dummy regulator
[   26.421485] ina2xx 0-0040: power monitor ina220 (Rshunt =3D 1000 uOhm)
[   26.429980] pcf85363 0-0051: registered as rtc0
[   26.435735] pcf85363 0-0051: setting system clock to 2020-12-05T14:02:35=
 UTC (1607176955)
[   26.444324] i2c i2c-0: IMX I2C adapter registered
[   26.452250] ina2xx 0-0040: supply vs not found, using dummy regulator
[   26.459968] ina2xx 0-0040: power monitor ina220 (Rshunt =3D 1000 uOhm)
[   26.468395] pcf85363 0-0051: registered as rtc0
[   26.474233] pcf85363 0-0051: setting system clock to 2020-12-05T14:02:35=
 UTC (1607176955)
[   26.482774] i2c i2c-0: IMX I2C adapter registered
[   26.490694] ina2xx 0-0040: supply vs not found, using dummy regulator
[   26.498405] ina2xx 0-0040: power monitor ina220 (Rshunt =3D 1000 uOhm)
[   26.506897] pcf85363 0-0051: registered as rtc0
[   26.512678] pcf85363 0-0051: setting system clock to 2020-12-05T14:02:35=
 UTC (1607176955)

Is above test not in line with your expectations?(with fw_devlink enabled, =
I2C controller wouldn't be probed before the DMA provider is available.)

When I apply the V4 patch. I2C adapter can defer probe and whatever i2c dev=
ices module installed/build-in, no issue happened. The build-in device
driver also start probing after adapter really registered:
(-------------i2c_imx_dma_request--------------)
[    7.437482] imx-i2c 2180000.i2c: using dma0chan16 (tx) and dma0chan17 (r=
x) for DMA transfers
(----------i2c_add_numbered_adapter-------------)
[    7.446581] ina2xx 0-0040: supply vs not found, using dummy regulator
[    7.455945] ina2xx 0-0040: power monitor ina220 (Rshunt =3D 1000 uOhm)
[    7.465146] pcf85363 0-0051: registered as rtc0
[    7.471052] pcf85363 0-0051: setting system clock to 2020-12-05T17:54:39=
 UTC (1607190879)
[    7.479902] i2c i2c-0: IMX I2C adapter registered

Inevitably, on some boards some i2c device drivers are build-in. The V4 pat=
ch will avoid some issue and is safer for i2c-imx user at different platfor=
m.
So I think it is necessary to move i2c_imx_dma_request() before registering=
 I2C adapter and I should also keep the log part.

> > >
> > > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> > > ---
> > > Change for V4:
> > > - Output "Only use PIO mode" log in debug level when no DMA configure=
.
> > > Change for V3:
> > > - According to Marc's comment, remove error print when defer probe.
> > >   Add info log when DMA has not been enabled and add error log when
> > >   DMA error, both won't stuck the i2c adapter register, just for remi=
nding,
> > >   i2c adapter is working only in PIO mode.
> > > Change for V2:
> > > - According to Frank's comments, wrap at 75 char and Simplify fix cod=
e
> > >   at i2c_imx_dma_request().
> > > - Use strict patch check, fix alignment warning at
> > > i2c_imx_dma_request()
> > > ---
> > >  drivers/i2c/busses/i2c-imx.c | 31 +++++++++++++++++++++++--------
> > >  1 file changed, 23 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-imx.c
> > > b/drivers/i2c/busses/i2c-imx.c index 5ed4cb61e262..b11d66d56c55
> > > 100644
> > > --- a/drivers/i2c/busses/i2c-imx.c
> > > +++ b/drivers/i2c/busses/i2c-imx.c
> > > @@ -397,17 +397,16 @@ static void i2c_imx_reset_regs(struct
> > > imx_i2c_struct *i2c_imx)  }
> > >
> > >  /* Functions for DMA support */
> > > -static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
> > > -                                             dma_addr_t
> > phy_addr)
> > > +static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
> > > +dma_addr_t phy_addr)
> > >  {
> > >       struct imx_i2c_dma *dma;
> > >       struct dma_slave_config dma_sconfig;
> > > -     struct device *dev =3D &i2c_imx->adapter.dev;
> > > +     struct device *dev =3D i2c_imx->adapter.dev.parent;
> > >       int ret;
> > >
> > >       dma =3D devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
> > >       if (!dma)
> > > -             return;
> > > +             return -ENOMEM;
> > >
> > >       dma->chan_tx =3D dma_request_chan(dev, "tx");
> > >       if (IS_ERR(dma->chan_tx)) {
> > > @@ -452,7 +451,7 @@ static void i2c_imx_dma_request(struct
> > imx_i2c_struct *i2c_imx,
> > >       dev_info(dev, "using %s (tx) and %s (rx) for DMA transfers\n",
> > >               dma_chan_name(dma->chan_tx),
> > > dma_chan_name(dma->chan_rx));
> > >
> > > -     return;
> > > +     return 0;
> > >
> > >  fail_rx:
> > >       dma_release_channel(dma->chan_rx);
> > > @@ -460,6 +459,8 @@ static void i2c_imx_dma_request(struct
> > imx_i2c_struct *i2c_imx,
> > >       dma_release_channel(dma->chan_tx);
> > >  fail_al:
> > >       devm_kfree(dev, dma);
> > > +
> > > +     return ret;
> > >  }
> > >
> > >  static void i2c_imx_dma_callback(void *arg) @@ -1803,6 +1804,23 @@
> > > static int i2c_imx_probe(struct platform_device *pdev)
> > >       if (ret =3D=3D -EPROBE_DEFER)
> > >               goto clk_notifier_unregister;
> > >
> > > +     /*
> > > +      * Init DMA config if supported, -ENODEV means DMA not enabled
> at
> > > +      * this platform, that is not a real error, so just remind "onl=
y
> > > +      * PIO mode is used". If DMA is enabled, but meet error when
> request
> > > +      * DMA channel, error should be showed in probe error log. PIO
> mode
> > > +      * should be available regardless of DMA.
> > > +      */
> > > +     ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> > > +     if (ret) {
> > > +             if (ret =3D=3D -EPROBE_DEFER)
> > > +                     goto clk_notifier_unregister;
> > > +             else if (ret =3D=3D -ENODEV)
> > > +                     dev_dbg(&pdev->dev, "Only use PIO mode\n");
> > > +             else
> > > +                     dev_err_probe(&pdev->dev, ret, "Failed to
> > > + setup
> > DMA, only use PIO mode\n");
> > > +     }
> > > +
> > >       /* Add I2C adapter */
> > >       ret =3D i2c_add_numbered_adapter(&i2c_imx->adapter);
> > >       if (ret < 0)
> > > @@ -1817,9 +1835,6 @@ static int i2c_imx_probe(struct
> > > platform_device
> > *pdev)
> > >               i2c_imx->adapter.name);
> > >       dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter
> > > registered\n");
> > >
> > > -     /* Init DMA config if supported */
> > > -     i2c_imx_dma_request(i2c_imx, phy_addr);
> > > -
> > >       return 0;   /* Return OK */
> > >
> > >  clk_notifier_unregister:
> >
> >
> > --
> > Pengutronix e.K.                           |
> > |
> > Steuerwalder Str. 21                       |
> > http://www.p/
> > en
> gutronix.de%2F&data=3D05%7C02%7Ccarlos.song%40nxp.com%7C1acf840d499f
> >
> 49a7872408dd0ebedc39%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> > %7C638682935131084746%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA
> w
> >
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&s
> >
> data=3DY9Qn9XEk15yu4CespwsNu6hl3%2FqfNTvEeOn4ZvnGxbo%3D&reserved=3D0
> > |
> > 31137 Hildesheim, Germany                  | Phone:
> +49-5121-206917-0
> > |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:
> > +49-5121-206917-5555 |

