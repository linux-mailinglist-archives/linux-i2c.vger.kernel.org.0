Return-Path: <linux-i2c+bounces-8623-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EC69F7522
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 08:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A19F816C9C6
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 07:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5262F1C69D;
	Thu, 19 Dec 2024 07:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q/OWxnEJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2073.outbound.protection.outlook.com [40.107.103.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB5B15AD9C;
	Thu, 19 Dec 2024 07:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734592218; cv=fail; b=jmn9/zclKhuG7RZWaydHEenG2648pB5SJviN3VJR93KfGx016MA8TwgrI73F9rrmOoH9ep8TDNeCQ/GsP4DKJ/ClQXUbFbokZqW2EF8TTn1dwV3+trulVSqfFKusc5oL+UUDdhmoDOB8mPkKsHJ8geNk6bD9/GbRrtO6Glu8EUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734592218; c=relaxed/simple;
	bh=cjMjrqvm39B67z78QRpAhSGQw/I+WsGLyfm9GolLx3o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NiJJ/7Vlzgo8JnfKp8/0lFO4zNXXtKXG+qLvtE0Weeh1ZWg9lskcSUplcOOxP3iRos3Ng2RdtqLLiCc1K5qLb88wtxN38tJjEQ0C26uK14PB1KBrER9lw9E7K+7TbYGY7L/qaj5WK80rN0PV4uv1kjrHrKdSzeXz8+Jo3h36J04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q/OWxnEJ; arc=fail smtp.client-ip=40.107.103.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJ9m/X2ofhCW0SzHPoS8/f2U/pLh50IG1x5DTWnjh/3ZjBm6y2t81Up6RXx9rX3z0nOquJwz/1g02hs2jceqbQeOv2FHCvh16sXJOvIA2ZgJ8or6x6/dPjUg4PiFiQ3uejNEK6QznbHpTCoJFaf4Pws2bjyPxM05mvd2jlxJuKfQyDyHN7hE8jYvkV1ykj+F88tMUvQrzU2T4prOCSKsEsxk/BC1WtzJMbW8HlN4MXt+K+4a2QymKGPtuL2S0PY3AJqAnLktqPrYsYC/rSUZFcs1TfDNiJV8q2Zf4GNEDZrcQAOOQzyzB2tQq1TgfCQaYFxal6Pj09IHbKNWYNuxVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SSSNTf9ZzK1I6FQ9XaYjSXqutqqKl+v0D7WDr7nHKw=;
 b=c7TC/dhjaksFMfiQIHQOSJqm0CCWyVIfHsJw9S+YHFGNPERacEw/Jj8pKIWaiIcdfZ3L2gjQDAUct0SeItK1n8qGpr5MS/t9KmyvAKJ9Bl4W7Sbi99ZEfrzC/2q0ImvPnXEftSt87PNIzb8CJ7VPQ1GxiB44sKG5Uc6FHtgUCPAEZCgMg7wnIumxTjWQ1Dmdst3jyo5/0ALdQHmPMkPzN9e99+6GZ834Ft06kaj5vyWvYHsAUImp8lBbKpK6ehfGy68a4WNh1+NUl2M7KrOmhobJIlA8inNonkL11612NI2tt0gszhMHY+9cQnl9FnUILzL6zL+AZ7U9uDlMUwuBGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SSSNTf9ZzK1I6FQ9XaYjSXqutqqKl+v0D7WDr7nHKw=;
 b=Q/OWxnEJ1+aFjrj5TrTH9FrZ3r2ihwXjJ7U5KRfXTXm2btrMR1JR8cYq8D7CE6hI+M5q3xvk7/bQnGz4NoaTyKzOZYrOUKv9bfesr34+ozwSEB3vJ5RhJbtPFN1hCqDvyynwIQ4jJIHAJRIdzxrhKvZcqyVSucUWw1xBE6tpHHpfSgxWlHktIdAZqDDemIWPBmmChhK2WitfpGri/2VspAPATYjL4nKYCdqaTwBmiTn0gJFMr9IILfcHfYr/NuQcAyFhrh4zYVooMIH0gFmDuUBkwjHYWF6BCLZNNOPaVyYDmTtM3QXS970NL26X2kv9WE/y4hQDrKJpvrWZnYgAkw==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by VI0PR04MB11071.eurprd04.prod.outlook.com (2603:10a6:800:262::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 07:10:11 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 07:10:11 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
CC: "andi.shyti@kernel.org" <andi.shyti@kernel.org>, Frank Li
	<frank.li@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Bough Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v3] i2c: imx: add imx7d compatible string for applying
 errata ERR007805
Thread-Topic: [PATCH v3] i2c: imx: add imx7d compatible string for applying
 errata ERR007805
Thread-Index: AQHbUeULM5Uq4m56o0CI7vVS8hYCEA==
Date: Thu, 19 Dec 2024 07:10:11 +0000
Message-ID:
 <AM0PR0402MB39379D10473292DA6533A757E8062@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241218044238.143414-1-carlos.song@nxp.com>
 <Z2O1PFr4ZQHXTsrX@pengutronix.de>
In-Reply-To: <Z2O1PFr4ZQHXTsrX@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|VI0PR04MB11071:EE_
x-ms-office365-filtering-correlation-id: edadca6d-4f50-4d88-5e08-08dd1ffc2ddc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vq85Zq/IhHO8baU4kkihJaN6aBc5epgCiY7DUnTA3s69ebTdEd95mtnrC794?=
 =?us-ascii?Q?9xsMTLvV+reR6F4lUrkdl8k91mn4io8I05MxyJWxB5VXhnOPs+2YLLR2z9yy?=
 =?us-ascii?Q?BNEISHITFAsWvnZWbZEnR+2xTKTwYpkIo3pTBCeJDkkyphjj6tL/+LYZ93dy?=
 =?us-ascii?Q?A2ZPuVemUR0e89WYo6csneEYMpu5cnID07GlSiU7d6+RJCiTmlhK7ls4oSKa?=
 =?us-ascii?Q?X80O1ed7jjy9cZ8l5xcwAl4bLwqiQnA1EYg2ZdAmYqmU67OkFg8Z3mvMif7X?=
 =?us-ascii?Q?VQiLaEtMEJ4drL9UPzBLrxot5V6TJaCQ6H8tHL/0xxZVb6cHsHWkloc/BWXM?=
 =?us-ascii?Q?dtWc/4Bbc+q2ucA3yYZO6ClaMWpepcqmzgmZkie3NGVeHyOH2D1RpSYvkiqv?=
 =?us-ascii?Q?OX/zz78hpU62ozymRG/nSDUDhEY6VP2YG8AHYJqQFBcWXQksw0Y2i6jUbJoY?=
 =?us-ascii?Q?hDzr37v5T4XmG772Scz8VxtEZSrNQ3giQ23tSji+lx6lrp0oYvUlb8ppVvdG?=
 =?us-ascii?Q?n0O4VZ1XTSH1XI3sF7x0Erv/1ZND8q76Tki35SIKpHF3PbH1cI2TS3KBnLqh?=
 =?us-ascii?Q?8NGp9/gYHfwAxkOig2o9ASTqbU9VhgRw85MMxvamg/7JivyTRwSYTgS6hWyI?=
 =?us-ascii?Q?cYZb/h5GSoL2PxBH5DAoiHSsg4mqNeUo/V0gqiGeasQjP1BUUinAqPkXW1am?=
 =?us-ascii?Q?xd/ZGQkRVrdTEQAzXvPh/UmLbQEeMSIkUw2s2y+gz7rm7Td9WgEUoBs/9KbL?=
 =?us-ascii?Q?fnWUBipa2ok0tiSyvJ2XRBc+pAq7cAo0YgC1QRv8Xkv8NfdiVJsmGatB+UyR?=
 =?us-ascii?Q?AKuDc+Z5l6sUukKAiOipIgxh7kPW01Cabsh8CI/E0mc2AvXRR7DPCFScJa7e?=
 =?us-ascii?Q?8TpK4ODpZ2yP77YgCQqG87qcKez+cYyu3m48iJdBXEv+VvIJxXl6n2h8g7Yy?=
 =?us-ascii?Q?eJ61Uj8QfO3UB6uR9DtgTshK2Z1mQEOBkEuPOYbOsYYST+LZZfGJ6uxY1ccI?=
 =?us-ascii?Q?yUAkUlqYTuwAfyrFjr4RTEXS80XefuqJIMaDs8hm/2qGa5jKtsjoSmQFvuRE?=
 =?us-ascii?Q?ZcVfICQ012OdadP0gE2suesv8EhrUPKqJmfz8CA3TxnSwgyV+vCaWddNWe8q?=
 =?us-ascii?Q?x2zs4H20vI5/G00YQ+/Vbx5xAgwMvKJzX5C/FR9XBoYll7PqOHGqcGVraIrj?=
 =?us-ascii?Q?bxhlD3fWpKrj4kofDcKfonUoMDfGunla1x2TaxexJLFSnU4Zt5DuTVgRgTM2?=
 =?us-ascii?Q?bZ2elq1gkM7sDqodsElu4nVmCzA455GsOHhdGTlLvvYfBkPYePhQlslZSds4?=
 =?us-ascii?Q?wn5arjcU6YhsFNQZK1F5goUUeMx0VllVCX8+wEUQGpaAVA8EDMwRfktJS1Xu?=
 =?us-ascii?Q?YJJ64GqT8T7Qq/sSB6uAYHyXvbaiOQgD+oqCHqg/92CifmCUhg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GSgzkcuiCqUlr68J6ncA4jH+n3lPG0tzxvqXyt3rrbqzs5H7mnvnd+dBPlGz?=
 =?us-ascii?Q?0NiSg+sgb4O/ogaPvAzR5Ge7gQ3yNzLATjfOUrUjntKuRPWgMFb0Ma2Y20qR?=
 =?us-ascii?Q?nZZwKP4MJwOnNz2tGXmUs9FFWM04D3st/WuKx6yrOpNxQkviMLNaVap20lhJ?=
 =?us-ascii?Q?G+xMUknGn/3vB+AMnTwdPtZAXsrnojRdT7byPRQZnLIwX+s7p9RjjkcOiDIS?=
 =?us-ascii?Q?q8/tXrY+ZrSlHyyhRNLzJ8DXW9WXJeUFvnixq4sftCXnm4xVNYSclXaWGyX+?=
 =?us-ascii?Q?BMwckr+FgSWG5It9kGiaRPDr48q1gyutb5Yc6reeglOwiEWvFlLWZcZKJlcU?=
 =?us-ascii?Q?3EKbwggHpN2HbIqpnt4a96OaUlaFF8OkAM6xHQR/rYDfWBPKhdZvkgpuAkKZ?=
 =?us-ascii?Q?pzOG2INyQSy2eVWChEmKCDnYa3UryEH6t9hHpjbHssDux6nprydyj7E+4G4x?=
 =?us-ascii?Q?LTZgeq2OVHutuQZ5pPkyQyK+eOtc1PsXyR5aQAqQXseeH/ZmSWyOd+oiBKZz?=
 =?us-ascii?Q?Mn6ZEbOaVaBDvSC6xEym44miDBilxlf4nRb8urznkwcq5uS6HelQHqmFLl1X?=
 =?us-ascii?Q?jTcS/Y/4WAmnK0iue/3qpPHmsWIfrVR7pzPIKU+tVwLgWZ9koySUzap/G2jd?=
 =?us-ascii?Q?91qvetrFaO6HZyCnFu2jYXSo7/MqT4fsnFpXV9hu7TBOdfjtRXbtz5U5OqJ+?=
 =?us-ascii?Q?Tc/i0a1F5siKXx6JJOr7Wjmc+cp86LKjrkK4whPichVbYWYyMcxwvS0ZtxwJ?=
 =?us-ascii?Q?pErlNrZfKlaqZpl5QSaj9ev3FDUo30rnd9s0eKZ8e9dozL6z6gTQ78RxYbTo?=
 =?us-ascii?Q?kif6ZZIcZT1oYS+UwPDDwNseTf+NxiqYmGzzGMXz9hTUb718y4MQsC8wEiCK?=
 =?us-ascii?Q?N8nsCRrzhQXbxBNAy9Yh+uFma7fCqn9Sjckw+qwXRQRqkT9TfXsfqzrTqNOn?=
 =?us-ascii?Q?gtRWgbXIQBNcTFJdaiVktVZp2K0/TZutVmpy//bhiyZ1a9J5t/kPYS0wGAOq?=
 =?us-ascii?Q?k/ix9fH2tk6gSXMN8qYsih+XfFDhrucm1ATbb/jax8yT9u/SQ27Zo8raefNb?=
 =?us-ascii?Q?nOX8hF/MQv1g62U94SN6BzSA+8in3bWbmK6xP2JyWWgFb4mzvvNi1e99hAvk?=
 =?us-ascii?Q?LQrj+usACXcvXwZQYEkAwTtuJ1TGYDz55xFWJT69DuxZNqb1PNuXNVpPiQQ+?=
 =?us-ascii?Q?4GqMYXIJMQPlsezq+6t/bYv29i89PhAXlyQ9o2Kq85StM7A6BsNuSe7A/duC?=
 =?us-ascii?Q?bPbPoeVMtRronwWVPr0XaDRXbB/buvwFaAzs55yIJ5uj4zSs1Re7DB2daScp?=
 =?us-ascii?Q?ch60v3ll6L/OUM/BJbSsndKkKfnN+lBMtpEk8Wdfrh7xluNHY0JkYdeCK8bO?=
 =?us-ascii?Q?6mLGxn3OQCgwJ1M2cnEh6ZNuwEKwk7q/y/RQSH/JwYBZ5PS0dsof7ME5/hDN?=
 =?us-ascii?Q?qQZgx+cwRj+VIRWtlbN3p4RFPix/HnCiRFxJvS1X18L2VVJJlKIjhp+hMecZ?=
 =?us-ascii?Q?vTSGwtEaxDoulbD7l7mDu6qTTjmzCKrv+2pI2YJz8ogP6s+v3UvY/UPgWkir?=
 =?us-ascii?Q?H1jX4419/ivpUSAEPRYspc40p4Q1pvBH7ZG6w84Q?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: edadca6d-4f50-4d88-5e08-08dd1ffc2ddc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 07:10:11.7801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RreRo1gmjplLhuiIZtJncHNS38Xpq61h3QfuY1f1BPCpxpSLTCTYb6HLaBonFHNGJkEdffx5yPqAG8Qqnr8h9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11071



> -----Original Message-----
> From: Oleksij Rempel <o.rempel@pengutronix.de>
> Sent: Thursday, December 19, 2024 1:55 PM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: andi.shyti@kernel.org; Frank Li <frank.li@nxp.com>;
> kernel@pengutronix.de; shawnguo@kernel.org; s.hauer@pengutronix.de;
> festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Bough
> Chen <haibo.chen@nxp.com>
> Subject: [EXT] Re: [PATCH v3] i2c: imx: add imx7d compatible string for a=
pplying
> errata ERR007805
>
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>
>
> On Wed, Dec 18, 2024 at 12:42:38PM +0800, Carlos Song wrote:
> > Compatible string "fsl,imx7d-i2c" is not exited at i2c-imx driver
>                                        do not exist?
> > compatible string table, at the result, "fsl,imx21-i2c" will be
> > matched, but it will cause errata ERR007805 not be applied in fact.
> >
> > So Add "fsl,imx7d-i2c" compatible string in i2c-imx driver to apply
> > the errata
> > ERR007805(https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A
> > %2F%2Fwww.nxp.com%2Fwebapp%2FDownload%3FcolCode%3D&data=3D05%
> 7C02%7Ccarl
> >
> os.song%40nxp.com%7C958101ea901c4404272f08dd1ff1bb7f%7C686ea1d3bc2
> b4c6
> >
> fa92cd99c5c301635%7C0%7C0%7C638701845332883650%7CUnknown%7CTW
> FpbGZsb3d
> >
> 8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoi
> T
> >
> WFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DgLJgTRfX8KgwxAIm7GHP
> TKgbQx3
> > 4f6p2lyaRna0BD%2BU%3D&reserved=3D0
> > IMX7DS_2N09P).
>
> This link is not working, may be this one:
> https://www.nxp/
> .com%2Fdocs%2Fen%2Ferrata%2FIMX7DS_3N09P.pdf&data=3D05%7C02%7Ccarl
> os.song%40nxp.com%7C958101ea901c4404272f08dd1ff1bb7f%7C686ea1d3bc2
> b4c6fa92cd99c5c301635%7C0%7C0%7C638701845332903180%7CUnknown%7
> CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXa
> W4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DxhrAk7
> %2FVbIWyXGr9ltpprMNimJjAX%2BfFrxQ%2BUvj7wZs%3D&reserved=3D0
>
> More practical is to include the erratum text with list of affected SoC v=
ariants.
>
> > "fsl,imx7d-i2c" already is documented in binding doc. This errata
>
> s/errata/erratum
>
> Errata is plural
> Erratum is singular
>
> > fix has been included in imx6_i2c_hwdata and it is the same in all
> > I.MX6/7/8, so just reuse it.
> >
>
> Please Fixes tag, this patch should go stable:
> Fixes: 39c025721d70 ("i2c: imx: Implement errata ERR007805 or e7805 bus
> frequency limit")
> Cc: stable@vger.kernel.org
>
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
>
> With fixes in the commit message you can add my:
> Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
>

Hi, I have remake the commit log referring to your comment.
Is this what you expected? If yes, please let me know. I will apply it at V=
4 and add your
Acked-by.

It will be this in V4:

    i2c: imx: add imx7d compatible string for applying erratum ERR007805

    Compatible string "fsl,imx7d-i2c" is not exited at i2c-imx driver
    compatible string table, at the result, "fsl,imx21-i2c" will be
    matched, but it will cause erratum ERR007805 not be applied in fact.

    So Add "fsl,imx7d-i2c" compatible string in i2c-imx driver to apply
    the erratum ERR007805(https://www.nxp.com/docs/en/errata/IMX7DS_3N09P.p=
df).

    "
    ERR007805 I2C: When the I2C clock speed is configured for 400 kHz,
    the SCL low period violates the I2C spec of 1.3 uS min

    Description: When the I2C module is programmed to operate at the
    maximum clock speed of 400 kHz (as defined by the I2C spec), the SCL
    clock low period violates the I2C spec of 1.3 uS min. The user must
    reduce the clock speed to obtain the SCL low time to meet the 1.3us
    I2C minimum required. This behavior means the SoC is not compliant
    to the I2C spec at 400kHz.

    Workaround: To meet the clock low period requirement in fast speed
    mode, SCL must be configured to 384KHz or less.
    "

    "fsl,imx7d-i2c" already is documented in binding doc. This erratum
    fix has been included in imx6_i2c_hwdata and it is the same in all
    I.MX6/7/8, so just reuse it.

    Fixes: 39c025721d70 ("i2c: imx: Implement errata ERR007805 or e7805 bus=
 frequency limit")
    Cc: stable@vger.kernel.org
    Signed-off-by: Carlos Song <carlos.song@nxp.com>
    Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

> > ---
> > Change for V3:
> > - No ACK, so resend this patch.
> > Change for V2:
> > - I have tried to fix this issue at imx7s.dtsi in V1, according to
> >   the community suggestion, I make V2 patch for i2c-imx driver to
> >   avoid updating the FDT to fix an errata. Discussion in V1:
> >   Subject: [PATCH] ARM: dts: imx7s: change i2c compatible string for
> applying errata ERR007805
> >   Message-ID: <20241021031148.2682015-1-carlos.song@nxp.com> (raw)
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx.c
> > b/drivers/i2c/busses/i2c-imx.c index 350346a7892c..9d5caa032c5c 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -335,6 +335,7 @@ static const struct of_device_id i2c_imx_dt_ids[] =
=3D {
> >       { .compatible =3D "fsl,imx6sll-i2c", .data =3D &imx6_i2c_hwdata, =
},
> >       { .compatible =3D "fsl,imx6sx-i2c", .data =3D &imx6_i2c_hwdata, }=
,
> >       { .compatible =3D "fsl,imx6ul-i2c", .data =3D &imx6_i2c_hwdata, }=
,
> > +     { .compatible =3D "fsl,imx7d-i2c", .data =3D &imx6_i2c_hwdata, },
> >       { .compatible =3D "fsl,imx7s-i2c", .data =3D &imx6_i2c_hwdata, },
> >       { .compatible =3D "fsl,imx8mm-i2c", .data =3D &imx6_i2c_hwdata, }=
,
> >       { .compatible =3D "fsl,imx8mn-i2c", .data =3D &imx6_i2c_hwdata, }=
,
> > --
> > 2.34.1
> >
> >
>
> --
> Pengutronix e.K.                           |
> |
> Steuerwalder Str. 21                       |
> http://www.pen/
> gutronix.de%2F&data=3D05%7C02%7Ccarlos.song%40nxp.com%7C958101ea901c
> 4404272f08dd1ff1bb7f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
> C638701845332917054%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOn
> RydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3
> D%3D%7C0%7C%7C%7C&sdata=3DZc4%2BMIZBmbv7BsAELQk9jKNtmhMTGxcdT
> mytHTYdNag%3D&reserved=3D0  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0
> |
> Amtsgericht Hildesheim, HRA 2686           | Fax:
> +49-5121-206917-5555 |

