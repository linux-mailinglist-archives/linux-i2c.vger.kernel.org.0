Return-Path: <linux-i2c+bounces-6517-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B179749B7
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 07:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3540328780A
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 05:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAD742052;
	Wed, 11 Sep 2024 05:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="ZXBx0Lsi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2049.outbound.protection.outlook.com [40.107.247.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8692F30
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 05:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726032333; cv=fail; b=n9KzeRyIHmZ4QOC1pOtps4GLxWcWTUFq4OaROTgUvTnZ7Jrc5X+sGmqomeeXVkYmMrVBVHnAsk/wXIiSPHWdIVK9aheK9XCdHfMX0nKGLY7WiNHiFiqwNrucdhUHJ2AabNNxAc07hihEQLeNrU4Iwanvgq2HU/0zwVv8u22qdKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726032333; c=relaxed/simple;
	bh=2D7Rbra6Jpy9NX57TvzgatxeBZHizqfr+cgzCLB9sz8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LMnyO2MLsmc5Va410z/3kqpixd6qkVt8axfByLNHgGwsCYyBxWJoDbNJzpfOVm9wAns7oBSuTgKty0hS0wRK4e12Qjui9nbS7HsaZLhOanbqQ0dv7wZOPVShrQuzPG4B3fTTv+IUCH3sbipedaKD5n7joSqShyyR12AcuZuPGuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=ZXBx0Lsi; arc=fail smtp.client-ip=40.107.247.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEmGhTppUwGHjlyorE0UxJHyBzhml37XmIdql8pRPYwiCm5jKxQoMxbIxGX6ltBchYlSHIiK5M4Al7xNGkXQh91xjlcNXsp1DtgYwdIhy3O8ZXdmDafdEU8S9pc9w4cP5N46BKVi4E4HyUn6Glu7/ug/eIcH6NMvG7KX6xl+VATWGwwd32IQ8d8n+fFz27B64w8E+BGHzoYItG2o5Mpc4NrYyaXLKgFjgRf+DT+h+jWSFioV9FU/2RwBwtLmesmVQH4vYmHoURn5Kd1iSdU4f6pp8XPNC4otFyI6m9APt2iwhzrq1Dla3bLpYPur9nnM4m0iCp9vFsmEPRB+8xt0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2D7Rbra6Jpy9NX57TvzgatxeBZHizqfr+cgzCLB9sz8=;
 b=Zsdlw0D2txjVD7YoKOqa9Imq2A2bTzH02USl9zV5RHa98CBUu+QDgXgH0NdHagbLj3GYFEGOd0w4glb5kEztXkh0g6Ye6M/nzCpm6u9zortKNWxlOvP1jN2PbAuY+tsBgmEtqEret6kpfG/zBbkStAYO/GZ42GwHLCngeMbyFZRPAS9SaCrIFTuz4SB4aXhXb+12pIseW7YeAAUR0QmcSup/yTzkrD1sQiTA7q3by/W1ftTR7PODWQPto9anNmucbUHs7uZlFrdJzeZRhn+CN+ot7S+T4MlK1QWtOmtyTscuqUP8rnFEsBSpJqnoa+/OYRPA3mmmP1bxKkIjGR44+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2D7Rbra6Jpy9NX57TvzgatxeBZHizqfr+cgzCLB9sz8=;
 b=ZXBx0LsiC7nIru5ZKVEoYEI/sALqeztCUsc49fZpqpZUsSCvzMj7ldISUs099CQLY/+W10G47e5xdIqawSk0mAsfJ98uxhvI25Z4+WLF74AvtbkwyVvu77OHLXxHxRU2m9NKWYiAWn4IYiG3iE5Fx/6JAoxtcHSadtRrRvBSD792895hokbB/tN0vfbp0g1uL4ttnqflEYgwHDtmAaVGK/65HIEQWtChDj19lIb44nMoxirNg7mejT0R6BOizWF/ceYNIG7IeMqP9b8V/jTeF+37nXaXvI+vrGtw7oRZ2mvtB/jBqzSclpbG+9XuooBSL77B4O/ZiMdtbn0p/YhbPg==
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 AM9PR07MB8020.eurprd07.prod.outlook.com (2603:10a6:20b:30a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 05:25:28 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%6]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 05:25:28 +0000
From: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Peter Rosin <peda@axentia.se>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: ODP: [PATCH v2] pca954x: Reset if channel select fails
Thread-Topic: [PATCH v2] pca954x: Reset if channel select fails
Thread-Index: AQHa79MbyYnkGBOn7E2e85VmQT3fT7IuNhcAgAL+JQ+AHvBbAIABAv9l
Date: Wed, 11 Sep 2024 05:25:28 +0000
Message-ID:
 <DB6PR07MB35090FF8DDEC34ED9B55C0759D9A2@DB6PR07MB3509.eurprd07.prod.outlook.com>
References:
 <DB6PR07MB35090E8350CC105E00E0462C9D812@DB6PR07MB3509.eurprd07.prod.outlook.com>
 <7c2ca9a7-c328-6d88-eb16-9c940114ceb0@axentia.se>
 <DB6PR07MB3509CF232310CBFEEAB0A3639D8E2@DB6PR07MB3509.eurprd07.prod.outlook.com>
 <3tpj6ohcx3hrnlhwzu32xbzeob7yhtlf5cs4itm7obiwevdpz4@4m6ycn2wkmqq>
In-Reply-To: <3tpj6ohcx3hrnlhwzu32xbzeob7yhtlf5cs4itm7obiwevdpz4@4m6ycn2wkmqq>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR07MB3509:EE_|AM9PR07MB8020:EE_
x-ms-office365-filtering-correlation-id: 4463b263-cb4b-4eb7-d0a1-08dcd22225cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?jc/bFzzHNTOMYvFJ4TQ0f7byoPC2tQcKFUYk0ZIAcpN9qSd/qL9r3/PJDN?=
 =?iso-8859-2?Q?HbohOkEdcjYZ/HdVc1w6/msKGEnFdf7dEfzYql9UrJ1ThBEAYiWqWy9Yed?=
 =?iso-8859-2?Q?2nQ8lTW9XHKWYGfyOD6E5vugWBtyi3AjI3KlCzLmen2wGf8VxhFe00VUSq?=
 =?iso-8859-2?Q?fyjD9aF4wycrv/QCYsqj/FEpGxvUn3B0KSPGih1ShCE4SwsyxMMfM6cKjR?=
 =?iso-8859-2?Q?1vNwetx6vYSPK9wOSGE6g1mJU5EcA714ADOOwL1Af8K1muX36H4RvZbhM7?=
 =?iso-8859-2?Q?FLS0+bVIerZRdzriJj+s8WwvjReNqthtzE7gtjKcHx9nnAgvaL1GzKtENs?=
 =?iso-8859-2?Q?tyUfN8pUj1wSZJU8Y4VmAQThAZfhVlxGqLQ5aqrlT8ztBnpdBQBV/Bdm2g?=
 =?iso-8859-2?Q?fky6EAoyB2BrLr3DKEVYwctD/7sH2H4lJ+MAv5rPpYU9At6IXAs5dfwpb7?=
 =?iso-8859-2?Q?ettUde52WdKkC9COMh0Vdz5+GaVkf23ytAk9SEq42qUaRpK/Yde9+KwcPj?=
 =?iso-8859-2?Q?22XKN/Lwb0HROI5Pzg0joVWToQBtpjFALhHhGVtZ7FUXtckYtwDWB7SXAN?=
 =?iso-8859-2?Q?QOSNzhmbEf3QSqQvrbopg7KME+/ay9JqXZLTV2xebg4/wpIyFo2gQkDqAy?=
 =?iso-8859-2?Q?kPn6qAiOebu4VCFfKT5E/XQFvgDo+pg0HhyRGKF0e1/NVGFdgTu/2hVEsF?=
 =?iso-8859-2?Q?RXAkr912RG2iPOFYQJ1V7LlOxfUWKIyXt9sKyYq3669l4qIWpgL03Uf8ib?=
 =?iso-8859-2?Q?xXylIzN3zVBqmObewF6IO/N5d4DhKU850xOiiJ+ka5zOL/Y11j6I/EQ9/Y?=
 =?iso-8859-2?Q?PmcE/GhvnxjVe/0BWx3o6zJfrETPSUTbmONJIYrP7foq5L/fFAADY8EE73?=
 =?iso-8859-2?Q?9THQvGC5iV5NK589kmZA1s/pmhCe1ddN8jGFqq73FSIm6/5Cp91zId8z9t?=
 =?iso-8859-2?Q?sC+8l1RBfNrPp4FwMfrUYU0VWbzK/VirYwoEQ4B/orPgPyIXTBobbHqMGa?=
 =?iso-8859-2?Q?Nkf5jkHP+qqRZYPMd9xQodgsFW8bpTtM7+l3k6u7lvU5VD758/EjfavFLu?=
 =?iso-8859-2?Q?8jHJOGFGkrTBzB+0FRfkTgQ2qPfL7pCeqQZdn6F8uzV2V50QfYuXc/2nHG?=
 =?iso-8859-2?Q?Y+OmUST/lHgUvoLEYhCuafXqb6JbU68aBdKfdZsMlCsoFVa56bA+vd3n+q?=
 =?iso-8859-2?Q?2U1PeWobOnVpB9aGQtL+9E1VykWfluLirPz1dIFSmrwBnnQe0LO72064xc?=
 =?iso-8859-2?Q?MNpSPzG+mIbAyNCPHtQuK85Qyd+JAMWvhTb+zHv2SwwKkNijXjl5J+3VXU?=
 =?iso-8859-2?Q?W/7tWdkQtgN2WF6ik7RaxD3tUd3878gNL5sAU9yWIfQKTANGNAZ2bBjYR6?=
 =?iso-8859-2?Q?eUeUsxWhlq4cPYegQggYPCir/162RSM7SsX+XWxz1sRqdAVEgFmVSv1Zt1?=
 =?iso-8859-2?Q?uS2dEThRWJNhqJYqcDOOsjuOqW/PJUHyIFkLDw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?jo2l2JrH6JQwMrFeSNOlZLh2aa/sjr9F/Nk2phVqHbYurej1+Mk2jAkUnD?=
 =?iso-8859-2?Q?1/1Oa1885NuLOlI8iyDScfIuoQz9sUi+pz0BFna1BqIYaMmyDux4zxWxFs?=
 =?iso-8859-2?Q?+Tf2Pflo53BjXq7oSsIFYyEsn4A2Bcx1RgLFxqbtoqTg1AeRrKPbHsC3nC?=
 =?iso-8859-2?Q?/DgyXTCVoPz2JpRfK3j64EBGeia9+p9ed7ZqiQ510qLzNi5coq9q0A67kz?=
 =?iso-8859-2?Q?6rMYX7URsrM3upPXa5b/FwD/AerLRb22w6yj4GU4zsQqdPI3lqnfwkRhWn?=
 =?iso-8859-2?Q?tIpfXaIUtwbHHjdJ2vidOkyye1BoIfeM8UU0SL6pgZ41WI7XQTExCdChV/?=
 =?iso-8859-2?Q?1ocx2Nb/kQuHMHWRGQAHMrt9BY4i/pRY6XgjsiqjJ6k8/xlkP65g/zfw7z?=
 =?iso-8859-2?Q?kElgBHAO2Jl0rrW8/Tnf6DQd0zpim2AjzV/ejNzz3xk4UyDvJEpmxldJD8?=
 =?iso-8859-2?Q?AgPcpWqrcA2sEJwEsW+jU8UeWDWdzhjJl87NgOxjWgS61LH0uuWhVnwcrA?=
 =?iso-8859-2?Q?AXJew7PhCX8QyZVIlf8++l+bp0TPyT6EOR526F08caUvY/2Tb99fhkedv6?=
 =?iso-8859-2?Q?/AaKm28lfFLxfzMzpYPrlddwzdc7ypH7ffRjHtsAUTGT1Ehm8HTRzotpFv?=
 =?iso-8859-2?Q?KLQ9oNX4l0GPRdFP3yOm9RiEHzoua8p6H8o2Ue6rK0bnAvTEtfJEB/CBB9?=
 =?iso-8859-2?Q?oXAKEz8UxkQSZ0mikJEkKwv5bv26jQpTNaJID6Gsv6TOMQm9KTr/LZb+Bn?=
 =?iso-8859-2?Q?ghdGZ3odxYcd25OavWZQRcw8OjUG+ZWvkyDlTVIxbmIeSWlsPw99dLS0mC?=
 =?iso-8859-2?Q?XIryBgaxQcZLvVsTw37Jqyuyl8Y2ZwvGt7deQVTOv4mPC6IJpdS7CNciy8?=
 =?iso-8859-2?Q?hM5PBdoVjpEZEe5omikOgu3ExQXdkmC8Y4iCbi/lR8qqdqccbYjag2vl4t?=
 =?iso-8859-2?Q?lZBLHPtZoU+DfiA4ZPsqBuPxrxEvOXq56A/7sBlra6u/mauK4RrswnXCZG?=
 =?iso-8859-2?Q?xcRCdxRlVyFwyxEnKpcufBgNzFZPxqpYbv3bzlWxPiXOL1cRkX4IpzYHII?=
 =?iso-8859-2?Q?RWVfTNTbHzRY7malAcMmthrzCkFpXx3ppmYJKVtmTydRiPcWoqovmbMCsi?=
 =?iso-8859-2?Q?CGv4gke1kHRycIF8i7CIS8GQPrOeLQKNavSc/IzueZZCJ8XDId/HQcSTZH?=
 =?iso-8859-2?Q?Z2fiqaeuXlF/nY/spP6pvL99bavEVwECTBMx4OUg9wvR+5Yngz1Nl1COxt?=
 =?iso-8859-2?Q?bSAPL0zV0lmI3qqIsPuL+u6NkWdLckAJtOCd36vWPZLOqHL7RiPenKQT+H?=
 =?iso-8859-2?Q?/BeNja+pIwUnTpzRbLhcb5wiova4mrVzAL9xinvhOULDX2+yNYz1tYBlU3?=
 =?iso-8859-2?Q?JfbiYeVU0IQR+zruugnWUnrgm3ZQ1R2EKSFIzqZELluN131Xy2/of4K2LU?=
 =?iso-8859-2?Q?zD6RD4toSx2koSpy8WcVpeWt+w1OiQNz48kVzqTkLUzLYetOpGQYnGcpTX?=
 =?iso-8859-2?Q?r66xPJwKxeHkQ8oJBu/nVYC6U2HsPf3/0Niidh0GctChCysGYW21N4O6rW?=
 =?iso-8859-2?Q?CxvX4m3rjOI0hvvZO3XF+KrVf/75pk05gFkdgKSvic9JujA01dE69b6K1K?=
 =?iso-8859-2?Q?eceD94xgFxswgIjgXXWHIVj2hV+uEy/R6n?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR07MB3509.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4463b263-cb4b-4eb7-d0a1-08dcd22225cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 05:25:28.4456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CO31hUp5zy0ntkgXuR7entzL5NGgDOxFQNJaMWfv2eAYI4wq1vZLlH1h787gdUCovbcBw+92QrszvsMinQoOEAWxkBF2gUo/JB3wUdPLoAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB8020

Hi Andi,=0A=
new version enabling this functionality via device tree property nearly don=
e, but not sent because I didn't have time yet to make proper testing. Will=
 do this week.=0A=
=0A=
Regards,=0A=
Wojciech=0A=

