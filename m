Return-Path: <linux-i2c+bounces-8357-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 089EE9E69BA
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Dec 2024 10:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30572286954
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Dec 2024 09:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41FF1EF0B3;
	Fri,  6 Dec 2024 09:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Yq/BetS1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1931EC010;
	Fri,  6 Dec 2024 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733476059; cv=fail; b=m46DWzv5v2OvB1LkCOpJPFONeF8eB4AhTpDOL2agXr/EDY7jWrlLqA1P/Wdgcu1qTenYNHUTTgmn0TCkzKLwJ360B9f4DHKFJGNXHRBa0mSAXUImjDELTJQvzhwiKVg7f9t0YsRyOF1dC3Xn0Po7B5uP/v53lq3ukHbG36viwns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733476059; c=relaxed/simple;
	bh=sPqMHu2zKtZp0qhDg1TOyp8bSooXDVvqKgGb62vD8VI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Zy956+sh8ED17xmrujevnYHWC7+hSB2JvbEnaHlxbcrLgC6Ij4pdnCdWF81wojiwrR7X+5K54XB+UqvPcphwNv7t+InLMOzP/bKNUUqSIjii/yw//ZJn00Pz6why95By8l63MGJXyAh5IdEuyChhOfZncFB0ECHCEhAiuyrdvTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Yq/BetS1; arc=fail smtp.client-ip=40.107.21.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nARHzsGNtqGjCcFGicewfH8+qNDoLmbvGIM0T4VfkpyJf/qN9cqPdyWiUuhhs+Q2l1MKRlQ34t1Xgat4nKY5TxV5il7CKG7zORW/SJVZ/jPhgikqP+wWrM+uMKEeTjGlkk+sP4AA8c4hAKhpmPzp2hAFvsfRqtcAELO1g7I/5dLi8LAs5TGCExeoQcgxQ8JgRB5NU/wc6UKO2F2+OxfeCI0ShSaSCOyYrXdr1YSp0Wh1LOJiYmH23C/ya/1hjtN9X7SUPwHCUWzSlOoPRtA1OFOi2amhNSolWKEPh5WxLkxfzzkBLkqPGx5on7s1kLK/RBsj4yGzuXwFecUmybyajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtHFQGTqkSJDVKUuaC8b+gbh4ALZDeXSe7oFlkvtS2c=;
 b=xZztFZVJ/G5mVPsrBgShErCVifvZSVUJjjqsvrLi0PHL/s9vp7pRSdYZtiwlOd+7+sUBi/B7yR65eMQVX7DuN0DG74GqVUzzggG0tXTB4GZImHV3WXYyUHfY9q6KSy/u9t/h1RcHdP6GdPybPSvsnEJ0RmnidDqk64w2XVLQ2vT2FIVxRY4ptBADKiCAwgHtX7V2BD8hAqEkpIWH6RcrBqJyKBHyrjBXzwAE0kkdPNM/qwNP7kaqg3MDOWtuq8ShVcXpNHH6YSc4jvwF8DlDuJkB38TfPGoIhPyyusFwvYJffoCxEAx9L0LkZo5DSFRioz2VzhAt7Y/0BCx8MWYw+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtHFQGTqkSJDVKUuaC8b+gbh4ALZDeXSe7oFlkvtS2c=;
 b=Yq/BetS1g2aMm38I+/6WSALD9YWrO8WxokypP4Y4rUOm3AbP/eRax+htJvqHzfEjVnOqYPWyYpfLfFWKm+qmzW/OI68kq2IMBYFatV42EKQ9Km/fINtreIVwdkw1sFmBA69Iip4vrrFQM+ubJucQm051HJ1JDWfWin17rm0mFGX34pZTc7S6TFh/R7A5csfCfP6UexqeQ/ZJ0zEGdT4V9e23dzPmHP1tZS7z3qmrHskICEuWnD9AvbXfUyIWx1Qa/e//0RfXhuo/kIJ7wX0ljHgBaXsRtoU1RJzFeJ9xYjbxKYM9M9ybbhFPpKAyK7fNVnRa3QYK3C0sUkbI9F+cfw==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by VI0PR04MB10253.eurprd04.prod.outlook.com (2603:10a6:800:23e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Fri, 6 Dec
 2024 09:07:33 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 09:07:33 +0000
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
Subject: Re: [PATCH v4] i2c: imx: support DMA defer probing
Thread-Topic: [PATCH v4] i2c: imx: support DMA defer probing
Thread-Index: AQHbR75IcSDnkQBuKUWIyjvnjw2QSw==
Date: Fri, 6 Dec 2024 09:07:32 +0000
Message-ID:
 <AM0PR0402MB39378417A496F13B201A1907E8312@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241127083818.2108201-1-carlos.song@nxp.com>
 <153e8e36-7b0e-4379-9cc3-6dacb5d705be@pengutronix.de>
 <AM0PR0402MB39370E69BC4B71C761EE8377E8282@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <6b39268b-7487-427d-aff5-f3ca3b2afd42@pengutronix.de>
In-Reply-To: <6b39268b-7487-427d-aff5-f3ca3b2afd42@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|VI0PR04MB10253:EE_
x-ms-office365-filtering-correlation-id: 32389c02-e6ad-421c-ece7-08dd15d56b99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?JWn6WUWTYf3U19Fg4yXgXcdzSPySy58/9igI+6GkySMR4TpsUsEnWinwQQ1J?=
 =?us-ascii?Q?3qdN7gl6LYMIST1+BYnc/H2s+dc4sLqJ8mZ3ScXj30YMuXAfxTdkZXcxKCUP?=
 =?us-ascii?Q?TnX3nwbrUugSWC5lzi8cHE0MwX6hDcTFmhPM5ubkJHj2t1II/lsYCrFu7Tze?=
 =?us-ascii?Q?wrBnbFadHHu9w0p69j5OAY3SdRu6HJuLosMD2UlCWssze8vZp8parikjXq4g?=
 =?us-ascii?Q?M9DJ2gESzA4rAQHqN4AUBk7zGEeWomvwed6Q16kJP34j2r8A1+Q8qRTHz2ru?=
 =?us-ascii?Q?CFYc8Kn3m4mrcEuQm6wnsk9yy5/v600GuvcDV90s0FAWbhuKrLemJqA+iuvJ?=
 =?us-ascii?Q?7jA/RQqw/8B3w0q0bep13TIG0VrRtixhajS6mlgnpFMOz8j2KI40dlb7RzdE?=
 =?us-ascii?Q?WAnHkY/j5zIaSrUqW4Z+EHsW2TObOFdzRciBfEWwjc0pj0voiLb1Z0IV8Flo?=
 =?us-ascii?Q?qxMvpsReayLh7ZaAPy2uTt8TjEUAzEVgFZfw3Q5kRNRQHGzpFG5viszcp3HH?=
 =?us-ascii?Q?G+eu9/QSm1Etvasv5HoKhhJGdbhV6+PpAZH8vCdLXbyTtHptvQVR2Eo1FML1?=
 =?us-ascii?Q?OQ0d3clw4PKjPdCilI6WV2SYF6OSnT459h/GC7ghiyLuQGon7Oq1eEpw1Nel?=
 =?us-ascii?Q?tsIjAfOhW/OjyR7Uqq8Ay904RDFer2Y6nFN8LHnKFritOfpPv8vWexTrKFUb?=
 =?us-ascii?Q?4NMTymT4tUBBARmaniM2V1rq0MShz+IiYv5NNACcoA3YCcIZULSfy5YVzc2h?=
 =?us-ascii?Q?dUofr6qIT2uNhQN+Rn0w3CM28nsLcVdOfM4juGGDRUVw5jXCI+OQdYXr7ch9?=
 =?us-ascii?Q?k/YMssNd6MJau/awPJnzXGdR+Pw6takKZ/zViilq3XWw7FqScag3lEKd6fgf?=
 =?us-ascii?Q?fGp3hkCxPdsuw9WWu1oLDuhwdrJ+bWHx11UBOf+DXZMFvyfIYt39TYxemne0?=
 =?us-ascii?Q?hc1s2XT/faxpl1lNO9roizVAK1NszTD1FJPdD2g8gX7SXKBkV0C4fwbn2C4+?=
 =?us-ascii?Q?Kxqabfb/n7UsB+hkrFtEZi14fVYeGVR1ZOsLEFCxYG7bPweFumVHpY0sDP8T?=
 =?us-ascii?Q?QDazEJtiHe/3lvqv6TanaUPNrPSacFHGEn/dWPWzEfLikr5MJg/qBfjpswyc?=
 =?us-ascii?Q?YEZK/ivGK/TYdlMPWJkhFfiOcawNfTLxocqm4essdIFu76HMuiCjrBd4PttO?=
 =?us-ascii?Q?I6KeqRDqICEYOu/c+H9NucpiqXqr2ra8nVwxAuTmaoQj8E1nhTvG1v1/2ML8?=
 =?us-ascii?Q?Md2FifJHBk7D5YaOq3W6FLgnZ63hA4buwYWMlzQPjCuS4LDRnSLy2gDlKD3U?=
 =?us-ascii?Q?66qHuAqX24Sk50cBBgD2rrQkrPLY9G6iO4Xlr+aH7JOF2KAXdnBLR9VRdkSx?=
 =?us-ascii?Q?K7vO7Y4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YuIc4hS5m5Xfk1DLEzbtHxGzwjHkQXrxmHUNIliFw3y2uqQ4zCWpi5EnqsYA?=
 =?us-ascii?Q?tPuXwoneddrXCE/T6fd64rJnSriv6wr97hi0aZhWlgZB4t9sV7I9lDt0eDKn?=
 =?us-ascii?Q?nOe4Fs4MRL6zzktPoreuKKJvFo/M327MPlDDCtIxSsi+jC6WR5uB89l8DSvf?=
 =?us-ascii?Q?BxTKnxJlJDHzKiYwS/N5JfW34tTOsupEIpdoMuEVZTY9H6akozRJ9JGqieTv?=
 =?us-ascii?Q?TWbKc0EYI/hoIMEwf9rEEMeoBNVWLmM9tQN23Zq1BiPjNI6cl3IA8D8sCNXb?=
 =?us-ascii?Q?M9zGi5lD3XBDOTeKqz9VRJLDSfBF7T7OiXWspIYxjzZkPEsYh3wHzdsxqKA2?=
 =?us-ascii?Q?GXzlv3YJNA/0zE/5BwSJiVpCOFiPUl8rkyusXsfODzmw+stgmx84WFlhPray?=
 =?us-ascii?Q?J1zcr4KjOo83mXlNNFdDXVr7Kkv6FDxbaLcMIaqs/MElPhafpmF4izue8dPC?=
 =?us-ascii?Q?Ry42PHzDPQ7z+UDRd+lLvMb7q1oVqfB4DR+91lGmVJ3TBa/blP4D1yl8lnI7?=
 =?us-ascii?Q?huISZuNDJ5gVhdqvI/11ps8H7Biv4fwg4GOdOtgky2rGlqWFzE5X8bt/aPOi?=
 =?us-ascii?Q?qpeLK2w623m3+a/3WIVqrP93VjbVkKjXKFuW7f8CD4MBjGSUTEZhVD7UBQav?=
 =?us-ascii?Q?F6EBnDLeM2pMEWMHPnckHn8NbRDD646BJQvL+ZRP3qIFnONXxwtp4J3TPiZM?=
 =?us-ascii?Q?nkGMw+uBa9QjQfBnRJJRnQijbHoJNL/7yRu/bTavDxUmUIjXU4PaXbu3Vskh?=
 =?us-ascii?Q?hbhosVXDj5K3MX79wsFecrbmDqGDgBqCiBy6PYq+YxjAAKWtjdnGygb4yx4A?=
 =?us-ascii?Q?C6v3HeNMwiBZPKN1ykqQt2NgRxoDz46DznYJHrAVlLad04r1DZ98+qJJWTTq?=
 =?us-ascii?Q?8QF0JMx3kZjZ2nMLU0Ddqk7jg1a+iDDrHV1u5X3aPSNqkWlpU8+8uckUCiev?=
 =?us-ascii?Q?pH1ow2nw//kAXINOfFs2n9XYstX5pPwGPc2rWASHlgMfqN6xCrFsT+jTGy0y?=
 =?us-ascii?Q?OKm14PvCTb31ubRX1tXcIjwnpExY0Mb1wMRYYcUZoCEZv626H79McBzBb2Th?=
 =?us-ascii?Q?kqjrQSBmLAnNqkt2xOHnMX1EtBTI3ugryLX5dzlS4JEKJwdMWIQoq5yKjxhn?=
 =?us-ascii?Q?mRzpRZwj9XZn9r+kKekf820oWkKGz5lNEcIk2huKFfsvnRnPOxUbp7Q1UL/J?=
 =?us-ascii?Q?jTnLMLodNBe8air07fnKVw94Gl2mG9tDM8nO0hXgh2O7AeszMpRhIRJSYfIu?=
 =?us-ascii?Q?za0tsEM3HVTqyJJB4AtfEcamrSegSeyghSV3F1Q+p049xd0vGFUTrkDHIQFm?=
 =?us-ascii?Q?0ehYuU/sU0j2g528lBIDrt3vDVO3SiS5KoPZTEqfNABicdBEIZ/0fB5o1o/5?=
 =?us-ascii?Q?iRccXmfCs0QNMkk3SYptt/o7wTCm8csVnddLqgLBaKgk2GniOgD+RIVZtZ0l?=
 =?us-ascii?Q?JBvZoKuSNTC2je2jU03ZJTRk/Xxg/YaN4bE90x1TBVS4V7Jo0z3EvnwBE3x+?=
 =?us-ascii?Q?gNjvugVBdfiBWEmXZjqxTy4c0Z/WXZfoffWIbYPLzfFhFnYAAVTtuJozypZo?=
 =?us-ascii?Q?WTmt9DcQkohYgpZutlI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 32389c02-e6ad-421c-ece7-08dd15d56b99
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 09:07:33.3519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vxj/Xi1lpu/JqsXNXBYGpVj5grBprm2oDOhuNjT7jaVSLHfE7tP/9gP5vr+4N9frOGW4gJ2IbhLsV+wsntdejQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10253



> -----Original Message-----
> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Sent: Friday, December 6, 2024 2:50 AM
> To: Carlos Song <carlos.song@nxp.com>; mkl@pengutronix.de; Frank Li
> <frank.li@nxp.com>; o.rempel@pengutronix.de; kernel@pengutronix.de;
> andi.shyti@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de;
> festevam@gmail.com
> Cc: imx@lists.linux.dev; linux-i2c@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH v4] i2c: imx: support DMA defer probing
>
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>
>
> Hello Carlos,
>
> On 27.11.24 11:43, Carlos Song wrote:
> >> -----Original Message-----
> >> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> >> Sent: Wednesday, November 27, 2024 4:38 PM
> >> To: Carlos Song <carlos.song@nxp.com>; mkl@pengutronix.de; Frank Li
> >> <frank.li@nxp.com>; o.rempel@pengutronix.de; kernel@pengutronix.de;
> >> andi.shyti@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de;
> >> festevam@gmail.com
> >> Cc: imx@lists.linux.dev; linux-i2c@vger.kernel.org;
> >> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> >> Subject: [EXT] Re: [PATCH v4] i2c: imx: support DMA defer probing
>
> >> Please try to address open questions before sending new versions of
> >> the patch set. Otherwise, it's difficult to follow the conversation.
> >>
> >> Did you see my question[1] on your v2:
> >>
> >
> > Hi, thank you so much! So sorry about it... I missed it yesterday. I wi=
ll answer
> your question[1] in this mail.
> >
> >
> >> | Wouldn't this break probe for all i2c-imx users who have
> >> | CONFIG_IMX_SDMA disabled?
> >> |
> >
> > I have tested i2c probe at IMX and LS platform when DMA disabled,
>
> What does DMA disabled mean? Did you leave the dmas property in the devic=
e
> tree unchanged, but just disabled the config option?
>
> > it won't break i2c-imx probe.
> > When require DMA channel in i2c_imx_dma_request, find no devices and
> > return -ENODEV, as you see at V4 patch, it will continue to probe and w=
ork in
> PIO mode.
> > I2C adapter should keep available whatever DMA mode is or isn't enabled=
.
>
> If that's the case, then all is good. I thought the situation described a=
bove would
> return -EPROBE_DEFER instead. I haven't dug into the code to understand w=
hat
> the difference between when dma_request_chan().
>
> >> | Also I am wondering on what kernel version and what configuration
> >> | (CONFIG_I2C_IMX=3D?, CONFIG_IMX_SDMA=3D?) you have that made you run
> >> | into this situation.
> >> |
> >
> > I want to correct something, these code about DMA in i2c-imx.c is for e=
DMA
> not for SDMA.
> > For eDMA mode, I have tested this patch at layerscape-1043 platform.
> > My patch is based on
> > cfba9f07a1d6 (tag: next-20241122, origin/master, origin/HEAD).
>
> The driver also handles i.MX variants like i.MX6, i.MX8 and so on, which =
have
> SDMA. So eDMA is not the only DMA driver it is used with.
>
> >
> > Test log is :
> > No apply this patch:
> > CONFIG_I2C_IMX=3Dy
> > CONFIG_FSL_EDMA=3Dy
> > root@ls1043ardb:~# dmesg | grep i2c
> > [    1.162053] i2c i2c-0: IMX I2C adapter registered
> > [    1.166826] i2c i2c-0: using dma0chan16 (tx) and dma0chan17 (rx) for
> DMA transfers
> > [    4.722057] i2c_dev: i2c /dev entries driver
> >
> > Not apply the patch:
> > CONFIG_I2C_IMX=3Dy
> > CONFIG_FSL_EDMA=3Dm
> > root@ls1043ardb:~# dmesg | grep i2c
> > [    1.166381] i2c i2c-0: IMX I2C adapter registered
> > [    4.719226] i2c_dev: i2c /dev entries driver
> > (result shows i2c not enabled the eDMA mode) root@ls1043ardb:~#
> > i2cdetect -y -l
> > i2c-0   i2c             2180000.i2c
> I2C adapter
> > root@ls1043ardb:~# i2cdetect -y 0
> >      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> > 00:                         08 -- -- -- -- -- -- --
> > 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> > 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> > 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> > 40: UU -- -- -- -- -- -- -- -- -- -- -- UU -- -- --
> > 50: -- UU UU UU -- -- -- -- -- -- -- -- -- -- -- --
> > 60: -- -- -- -- -- -- -- -- -- 69 -- -- -- -- -- --
> > 70: -- -- -- -- -- -- -- --
> >
> > After apply the patch:
> > CONFIG_I2C_IMX=3Dy
> > CONFIG_FSL_EDMA=3Dm
> > root@ls1043ardb:~#
> > root@ls1043ardb:~# dmesg | grep i2c
> > [    4.697046] i2c_dev: i2c /dev entries driver
> > [    7.304142] imx-i2c 2180000.i2c: using dma0chan16 (tx) and dma0chan1=
7
> (rx) for DMA transfers
> > [    7.313532] i2c i2c-0: IMX I2C adapter registered
> > (result shows i2c probed after eDMA module installed)
>
Hi, Ahmad

Refer previous history:
https://lore.kernel.org/linux-arm-kernel/6b39268b-7487-427d-aff5-f3ca3b2afd=
42@pengutronix.de/

Your suggestions are very insightful. I'm very grateful!

Before replying to your question, I think we should synchronize SDMA and eD=
MA firstly.
sDMA and EDMA for i2c is different.
Only 1 SDMA channel for i2c SDMA TX/RX event.
But 2 eDMA channels for i2c eDMA TX request and RX request.

Now in i2c-imx, DMA code all are for eDMA, they have nothing to do with SDM=
A initialization.
It is very different initialization of SDMA and eDMA.

SDMA at dts:
@@ -1046,6 +1046,8 @@ i2c1: i2c@30a20000 {
                                ...
+                               dmas =3D <&sdma1 18 27 0>;
+                               dma-names =3D "rx-tx";
                                status =3D "disabled";
                        };
eDMA at dts:
                i2c0: i2c@2180000 {
                        ....
+                               dmas =3D <&edma0 1 38>,
+                                      <&edma0 1 39>;
+                               dma-names =3D "rx", "tx";
                        status =3D "disabled";
                };

SDMA initialization in i2c-imx driver:

+       dma->chan_tx =3D dma_request_chan(dev, "rx-tx");
+       if (IS_ERR(dma->chan_tx)) {
+               ret =3D PTR_ERR(dma->chan_tx);
+               goto fail_dma;
+       }
+
+       dma->chan_rx =3D dma->chan_tx;
+       i2c_imx->dma =3D dma;

eDMA initialization in i2c-imx driver:

...
+       dma->chan_tx =3D dma_request_chan(dev, "tx");
....
+       dma->chan_rx =3D dma_request_chan(dev, "rx");
....
        i2c_imx->dma =3D dma;

So if need to enable SDMA, should define a separate dma_request function an=
d should not reuse the current i2c_imx_dma_request function.
Also according to different platforms i2c-imx driver need to choose to use =
eDMA or SDMA.

So now we start to discuss about your confusion:

> My concern is this configuration:
>
>   - A user has eDMA/SDMA module or disabled, but enabled in DT
[Carlos]:
I delete edma channel at dts to disable eDMA before. It works in PIO mode.
I also test your case : when enable dma channel in DT but disable eDMA modu=
le. It will meet error:

+++ b/arch/arm64/configs/defconfig
....
-CONFIG_FSL_EDMA=3Dy
....

root@ls1043ardb:~# dmesg | grep i2c
[    4.697392] i2c_dev: i2c /dev entries driver
[   18.357685] platform 2180000.i2c: deferred probe pending: (reason unknow=
n)
root@ls1043ardb:~# i2cdetect -y -l

The case you mentioned is completely inconsistent with the actual usage. Si=
nce you have defined the dma channel in dts, it means that you need to
use DMA mode in i2c, but you disabled the eDMA module when building the Ima=
ge. This makes no sense at all. I think this is a usage error.
And the deferred probe pending error is predictable. Since there is no DMA =
driver loaded, I2C will keep defer probe and be hanged.

>   - The I2C has a PMIC, which is needed for eMMC VCC
[Carlos]:
PMIC is critical for the whole board, so PMIC will finish all critical syst=
em power-on configuration(include eMMC VCC) in the uboot not at kernel.
So pmic driver probe in kernel won't and shouldn't effect system boot.

>   - System startup is stuck or considerably delayed
>
The purpose of defer probe is to solve the problem of interdependence of mo=
dule loading, and to try to load again after a while is to ensure that the =
required functions
will not be unavailable because the resources are not ready. This delay is =
unavoidable. If a defer probe occurs, the first consideration should be to =
reasonably adjust the
loading order of each module, rather than directly giving up the functions =
that should be enabled.

> > root@ls1043ardb:~#
> > root@ls1043ardb:~# i2cdetect -y -l
> > i2c-0   i2c             2180000.i2c
> I2C adapter
> > root@ls1043ardb:~# i2cdetect -y 0
> >      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> > 00:                         08 -- -- -- -- -- -- --
> > 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> > 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> > 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> > 40: UU -- -- -- -- -- -- -- -- -- -- -- UU -- -- --
> > 50: -- UU UU UU -- -- -- -- -- -- -- -- -- -- -- --
> > 60: -- -- -- -- -- -- -- -- -- 69 -- -- -- -- -- --
> > 70: -- -- -- -- -- -- -- --
> >
> >
> >> | I'd have expected that with fw_devlink enabled, the I2C controller
> >> | wouldn't be probed before the DMA provider is available.
> >>
> >
> > This is a legacy patch, it has been in our local tree for a long time. =
The related
> history is relatively vague.
> > I reproduced the problem and found this patch is effective, so I
> > referred the community patch and legacy patch to rewrite the commit log=
(I
> am not sure if this would happened in some cases so I kept this informati=
on).
> > Now it seems that these descriptions are redundant. I should completely
> removed this in the commit log:
> >     Move i2c_imx_dma_request() before registering I2C adapter to avoid
> >     infinite loop of .probe() calls to the same driver, see "e8c220fac4=
15
> >     Revert "i2c: imx: improve the error handling in
> i2c_imx_dma_request()""
> >     and "Documentation/driver-api/driver-model/driver.rst".
>
> Cheers,
> Ahmad
>
> >
> > [1]:
> > https://lore/
> > .kernel.org%2Fall%2F19a43db4-db5c-4638-9778-d94fb571a206%40pengutro
> nix
> > .de%2F&data=3D05%7C02%7Ccarlos.song%40nxp.com%7C3e9bcb1cc97b43a69
> ca608dd
> >
> 155d9977%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638690213
> 9450713
> >
> 71%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAu
> MDAwMCI
> >
> sIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdat
> a=3DT
> > z0JcOxf9rrSOl2FoCHNbQz4rtKY5V0eS1ZMV%2BXED4I%3D&reserved=3D0
> > [2]:https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
F
> >
> lore.kernel.org%2Fall%2F153e8e36-7b0e-4379-9cc3-6dacb5d705be%40pengutr
> >
> onix.de%2F&data=3D05%7C02%7Ccarlos.song%40nxp.com%7C3e9bcb1cc97b43a
> 69ca6
> >
> 08dd155d9977%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63869
> 0213945
> >
> 090490%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwL
> jAuMDA
> >
> wMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C
> &sda
> > ta=3DpAT68urcH7CTFknvK1xM3lfuYjZQO0I16B%2FTTsCJw6Q%3D&reserved=3D0
> >
> >>>
> >>> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> >>> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> >>> ---
> >>> Change for V4:
> >>> - Output "Only use PIO mode" log in debug level when no DMA configure=
.
> >>> Change for V3:
> >>> - According to Marc's comment, remove error print when defer probe.
> >>>   Add info log when DMA has not been enabled and add error log when
> >>>   DMA error, both won't stuck the i2c adapter register, just for remi=
nding,
> >>>   i2c adapter is working only in PIO mode.
> >>> Change for V2:
> >>> - According to Frank's comments, wrap at 75 char and Simplify fix cod=
e
> >>>   at i2c_imx_dma_request().
> >>> - Use strict patch check, fix alignment warning at
> >>> i2c_imx_dma_request()
> >>> ---
> >>>  drivers/i2c/busses/i2c-imx.c | 31 +++++++++++++++++++++++--------
> >>>  1 file changed, 23 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/drivers/i2c/busses/i2c-imx.c
> >>> b/drivers/i2c/busses/i2c-imx.c index 5ed4cb61e262..b11d66d56c55
> >>> 100644
> >>> --- a/drivers/i2c/busses/i2c-imx.c
> >>> +++ b/drivers/i2c/busses/i2c-imx.c
> >>> @@ -397,17 +397,16 @@ static void i2c_imx_reset_regs(struct
> >>> imx_i2c_struct *i2c_imx)  }
> >>>
> >>>  /* Functions for DMA support */
> >>> -static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
> >>> -                                             dma_addr_t
> >> phy_addr)
> >>> +static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
> >>> +dma_addr_t phy_addr)
> >>>  {
> >>>       struct imx_i2c_dma *dma;
> >>>       struct dma_slave_config dma_sconfig;
> >>> -     struct device *dev =3D &i2c_imx->adapter.dev;
> >>> +     struct device *dev =3D i2c_imx->adapter.dev.parent;
> >>>       int ret;
> >>>
> >>>       dma =3D devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
> >>>       if (!dma)
> >>> -             return;
> >>> +             return -ENOMEM;
> >>>
> >>>       dma->chan_tx =3D dma_request_chan(dev, "tx");
> >>>       if (IS_ERR(dma->chan_tx)) {
> >>> @@ -452,7 +451,7 @@ static void i2c_imx_dma_request(struct
> >> imx_i2c_struct *i2c_imx,
> >>>       dev_info(dev, "using %s (tx) and %s (rx) for DMA transfers\n",
> >>>               dma_chan_name(dma->chan_tx),
> >>> dma_chan_name(dma->chan_rx));
> >>>
> >>> -     return;
> >>> +     return 0;
> >>>
> >>>  fail_rx:
> >>>       dma_release_channel(dma->chan_rx);
> >>> @@ -460,6 +459,8 @@ static void i2c_imx_dma_request(struct
> >> imx_i2c_struct *i2c_imx,
> >>>       dma_release_channel(dma->chan_tx);
> >>>  fail_al:
> >>>       devm_kfree(dev, dma);
> >>> +
> >>> +     return ret;
> >>>  }
> >>>
> >>>  static void i2c_imx_dma_callback(void *arg) @@ -1803,6 +1804,23 @@
> >>> static int i2c_imx_probe(struct platform_device *pdev)
> >>>       if (ret =3D=3D -EPROBE_DEFER)
> >>>               goto clk_notifier_unregister;
> >>>
> >>> +     /*
> >>> +      * Init DMA config if supported, -ENODEV means DMA not enabled
> at
> >>> +      * this platform, that is not a real error, so just remind "onl=
y
> >>> +      * PIO mode is used". If DMA is enabled, but meet error when
> request
> >>> +      * DMA channel, error should be showed in probe error log. PIO
> mode
> >>> +      * should be available regardless of DMA.
> >>> +      */
> >>> +     ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> >>> +     if (ret) {
> >>> +             if (ret =3D=3D -EPROBE_DEFER)
> >>> +                     goto clk_notifier_unregister;
> >>> +             else if (ret =3D=3D -ENODEV)
> >>> +                     dev_dbg(&pdev->dev, "Only use PIO mode\n");
> >>> +             else
> >>> +                     dev_err_probe(&pdev->dev, ret, "Failed to
> >>> + setup
> >> DMA, only use PIO mode\n");
> >>> +     }
> >>> +
> >>>       /* Add I2C adapter */
> >>>       ret =3D i2c_add_numbered_adapter(&i2c_imx->adapter);
> >>>       if (ret < 0)
> >>> @@ -1817,9 +1835,6 @@ static int i2c_imx_probe(struct
> >>> platform_device
> >> *pdev)
> >>>               i2c_imx->adapter.name);
> >>>       dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter
> >>> registered\n");
> >>>
> >>> -     /* Init DMA config if supported */
> >>> -     i2c_imx_dma_request(i2c_imx, phy_addr);
> >>> -
> >>>       return 0;   /* Return OK */
> >>>
> >>>  clk_notifier_unregister:
> >>
> >>
> >> --
> >> Pengutronix e.K.                           |
> >> |
> >> Steuerwalder Str. 21                       |
> >> http://www/.
> >>
> pen%2F&data=3D05%7C02%7Ccarlos.song%40nxp.com%7C3e9bcb1cc97b43a69c
> a608d
> >>
> d155d9977%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63869021
> 394510
> >>
> 5284%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjA
> uMDAw
> >>
> MCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&s
> da
> >> ta=3DqE5UgdZSuGjzXtDFcY1BVbjNgb6sPPrpykvr3gpHsLg%3D&reserved=3D0
> >>
> gutronix.de%2F&data=3D05%7C02%7Ccarlos.song%40nxp.com%7C1acf840d499f
> >>
> 49a7872408dd0ebedc39%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> >> %7C638682935131084746%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> Aw
> >>
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&s
> >>
> data=3DY9Qn9XEk15yu4CespwsNu6hl3%2FqfNTvEeOn4ZvnGxbo%3D&reserved=3D0
> >> |
> >> 31137 Hildesheim, Germany                  | Phone:
> +49-5121-206917-0
> >> |
> >> Amtsgericht Hildesheim, HRA 2686           | Fax:
> >> +49-5121-206917-5555 |
> >
>
>
> --
> Pengutronix e.K.                           |
> |
> Steuerwalder Str. 21                       |
> http://www.pen/
> gutronix.de%2F&data=3D05%7C02%7Ccarlos.song%40nxp.com%7C3e9bcb1cc97b
> 43a69ca608dd155d9977%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> %7C638690213945119868%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGki
> OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ
> %3D%3D%7C0%7C%7C%7C&sdata=3DSU8Ak78%2BZCcOo4G%2F9Kq1E3IZNAgg5E
> 0m1CC1qr4ANYk%3D&reserved=3D0  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0
> |
> Amtsgericht Hildesheim, HRA 2686           | Fax:
> +49-5121-206917-5555 |

