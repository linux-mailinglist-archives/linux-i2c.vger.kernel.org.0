Return-Path: <linux-i2c+bounces-5453-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 523659548D6
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 14:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F3A5B240D1
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 12:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E27B1BD004;
	Fri, 16 Aug 2024 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="g4ziCbDS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2062.outbound.protection.outlook.com [40.107.103.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1E71BC08B
	for <linux-i2c@vger.kernel.org>; Fri, 16 Aug 2024 12:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811533; cv=fail; b=MV3H3zovy91uYed91/QDdteNNWjY/Ri/8RC+raE/5YJ481GLTPRphDiLUGZk0TAJJhV/0S3irnMjniJ8V/L8WsCz4m4A8b4BVlazFN1dwVKDxm661D2cFTAAiCzJEtE9yFCGUZ6iulO2b8ZpWoZPkKy9yJp0aO5sdubg6kU4J0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811533; c=relaxed/simple;
	bh=LLoW37eKVI/GCwTpkUPj9fMyER7SSe+9pxdALiDhFXU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k1+gbh+flqfjAs4w5AumrPv/O3+S8aefVDnzjNOzpICLpGK19JO7b6lwtvmJqmZZeztUECDHnSLmM5duIbTrFoA2jy3yMdtmL/GOVPZmheaxDRlZGYmLwqPew2PHL/mhBv/njTRY50MW4QQHhYfVmoNGWwnSlNPPQivrVPLVikc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=g4ziCbDS; arc=fail smtp.client-ip=40.107.103.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsegANFBPWyyO4mvb31+9n6abmzfsGTnfA/0OHvFvsaK/iC+qUn7lp/ZYEbm0KOJ+ljrizgXehezsfx4tKRea5JD+JQ84ykN/4ODOpwugGEl4tS4HcjBRF7412DTwRs2j8iQhQZrB7H+x233Nvs8B7Ob1h4GW9vy8azBnPCSTNLP2FqJHsWwpEqFOtDLd0znI0PsXuAN1pgbFinLlS1WxqeUWifFzw1xYcOamFVrlKC88qJb5xNrG+7sryL1RAf0qQU3TiP2xVB4aJo3WuvwUXnag7wm36KqU6HAnXVvVlY2CUemUPLGYDnXTwP8B7r3f20TuufBqTU3QQgBPNlVwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLoW37eKVI/GCwTpkUPj9fMyER7SSe+9pxdALiDhFXU=;
 b=gXeOgYSaiJuofKLGZ9j0MosTMcjYMN+WhYiu+lXgIjl3U35mprV4A0z/hFtwcg+/muU2b4bfqkW0CEinjxB6dNeygjpSKtQ0AtlfdQ1FGfp8Xm16mRCuaEmP58imxSZuiQJCsk9wLJRQmfd5MAKDRSLiQzsc+kKFVuehSYKLoU8pXJnP6LJ+UilxuG0b/J9OqxNSrTNS4nRI+lJ4pTlTs1Nz3L6YHjwxogJMEQrQlWafHXbrTUX9+VmLfZqQd4gqvDVHCT+1ncVBGHK3kyKOVfylvz8deU10YPhLXyxhTilDpaEldrmLct3uPJVhKVnV3iH3cCOGF/9khVL9DIxnpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLoW37eKVI/GCwTpkUPj9fMyER7SSe+9pxdALiDhFXU=;
 b=g4ziCbDSy1E9XivXqVmROWm0AZC4a4m3XDlDdIJr+DO0TTUAHyhZRJZPP8cX/NyIZfXrntbwz5uYvxjk7XDHioZ6bHOxX8wfBl8CDpha3FFYReiJ9pJOxV1H1dYEUENIO11YddbyuH2qAabzPjQ4xqAw9Bxmwx2Clk+7Z9EwNpsFe67MQM44iKs5yB2PHakSnovOlQgksuwN7ImrGGQj6IY5Dk6H2vJG2djWk8iNq5nv2OLTkId4s2pJ25fuLWpVNhzwIC6sVEwOXvW2HtVpPHYxHl8iRYqwcA3nwnAIJJBuwsaYA8Bq/YB9ytvFF6Drx2QD5Op4iGSoRuO4fpAl2Q==
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 DBAPR07MB6648.eurprd07.prod.outlook.com (2603:10a6:10:179::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.18; Fri, 16 Aug 2024 12:32:08 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%6]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 12:32:08 +0000
From: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] pca954x: Reset if channel select fails
Thread-Topic: [PATCH] pca954x: Reset if channel select fails
Thread-Index: AQHa6jQddQPwTX4+5E2Bd0WqFVKNF7Il3peAgAPfU00=
Date: Fri, 16 Aug 2024 12:32:07 +0000
Message-ID:
 <DB6PR07MB35090BB5F7F2B172D4EAF7B49D812@DB6PR07MB3509.eurprd07.prod.outlook.com>
References:
 <DB6PR07MB3509F48523F601D4F6429D069DBA2@DB6PR07MB3509.eurprd07.prod.outlook.com>
 <htbbicu2tfag5vza6fiem67jvoxvstxyws345ghjlug5cpouhl@ig5air5zhfp2>
In-Reply-To: <htbbicu2tfag5vza6fiem67jvoxvstxyws345ghjlug5cpouhl@ig5air5zhfp2>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR07MB3509:EE_|DBAPR07MB6648:EE_
x-ms-office365-filtering-correlation-id: 6e25ad85-d398-40bf-c7e5-08dcbdef718f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?fhniAg1NPS0vJ2Ta1eQS5B7ZYrFlPshiegFiYbIWERQPejtI681aj1JyuA?=
 =?iso-8859-2?Q?E8elB2UeTihEfurWX6xOgc+qrOMvI8+tl/U2qolgk/EFi5837EjxXuHEZZ?=
 =?iso-8859-2?Q?1dkriCuNXp5N9BJrVHfVI6WpEa42mRM/pfac4Q75gAAmOTE3lJYiy/1QgB?=
 =?iso-8859-2?Q?+WQSE4nDvQeDXuEIfPoKtmJRPgSi2BFQ8VyMJrVR9TEMluyCmdldSkXmqX?=
 =?iso-8859-2?Q?L6ACyos/pkR+Uu+e3ZfvZNWTb3rY2DngTkeMQlFrvm43lNvXGy435Gyi/U?=
 =?iso-8859-2?Q?32Ez3+hyvt+44u2edE5PlEQLG5XL47qfKGRo1Sw6uXdV6iDGMvLRSTV4el?=
 =?iso-8859-2?Q?Fqapri+Beu5JQa2ER3z/3fPLn3I8h2UTVgcOVQeDqw6DXlhEVe4SRWdxrJ?=
 =?iso-8859-2?Q?B459JB+jli+mPKPOXVvZ39f9uIWsFPl+MHKFgBjBEBUvmWYd/rIEaTugfo?=
 =?iso-8859-2?Q?vM77B43vdBAFbgXO4D4PBIEta3sGofowQNLrxv4tvUs0aJHa3UqcmUNVFZ?=
 =?iso-8859-2?Q?OHUnUT/NimyEoL3zvfoEeqt7ZzEoOKeqnIqfuR/tZdt5kwQGKuipTT1duo?=
 =?iso-8859-2?Q?zOE4h0xvkX3fjvWZWCghMp2eVZBvhGNhfMXQTl0yDt+zqoZiqVRFs4l3jU?=
 =?iso-8859-2?Q?2xNl+8AL3VtbrETiSCk+SThrzMHv6wltAeh8I+QvecP0SHZmWuCnMMyVcF?=
 =?iso-8859-2?Q?QM9eX/FkHElarKCDIX6zEHXF9jk98OYx/Qcna8VAfFoAtTurdBiUfEuFt3?=
 =?iso-8859-2?Q?IRgQbGf3a479assQSbAD66G3q4HpKw/uO5rwStDAvSxu0cDBHLbJrj7p9v?=
 =?iso-8859-2?Q?W9OQNLm9HrINONdMi+//unzX3EPcdL+bdHQRyI5QKZ7Ig5CALaJZd1RqcO?=
 =?iso-8859-2?Q?+oqdInMOsEaMqrj8ysG4nZOn6+jqINqo+LZaQPHtmmtCg6XAREKVrqe+fU?=
 =?iso-8859-2?Q?3WTb5kiKRIXJk+GSMARwBkwBVEo9JEullLroD5Wg/NURSDMWAep4UJhz7m?=
 =?iso-8859-2?Q?6lTRLZ0GM5lqMSsZ5XvdptXLaWn6Or0Ccrp/2VnT5kyTqQB6nTmFvnOjrt?=
 =?iso-8859-2?Q?e7DtsEWDax3ZwxVEXp5jB6wQIs4+tp5HNlvtfp9sLCgVmBJokaOHRbGNiN?=
 =?iso-8859-2?Q?VQt4QKIl3dUhRUu+yUOlKEUsRiE/AtJc0pNrrKnzeBVZ1H6NVa88y8ohMu?=
 =?iso-8859-2?Q?arEwrtcJKW0MWvYpcWEq5Pq5tJLqDPUPRFz0HcyP9kLZQBOqu58eNXkHZZ?=
 =?iso-8859-2?Q?Eur0VBYODpkC+jVSEvDduZdU2lWSf10IUJsYCv2/6aYgBxPs+IOG+GTbbk?=
 =?iso-8859-2?Q?n3XnbzjSXSxIAKfxpFP3aOlttsy+i3HqM80mmPKpt3qj1fF6EhB+sKFE1y?=
 =?iso-8859-2?Q?ctoY6muPopDT1QElBmrlXc88yRwwKzBwdqIkEBLK8Kb7uf5jG5eWKf90jr?=
 =?iso-8859-2?Q?AhXbuE9eRkIaMFCoKalE3SAkMhHC65ixrX6LWA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?JjdVZYhaAQJbl89gH0Fp8Eya0ruI4eF+9lWm0HzLLBNycuaOeKTfjfP+Hv?=
 =?iso-8859-2?Q?YRx2b+svfZk5AMa9RK8Aa4m1WDJTaHUYx/K4ZA30XW4qibCT4j/U3NzKV1?=
 =?iso-8859-2?Q?GPjnIOM/GFjuDWxymmyklxxSfJT89YBAf0K4PYtFlvivEyIehwDWRIaqY6?=
 =?iso-8859-2?Q?RnS0/I4OWO4thUGpJvGYwmUZPNXXq25lUrRoXe8ZzbnFXr4LduhUOJnTOz?=
 =?iso-8859-2?Q?FF+8I8tagWb5APMxIDSYrQfsJZVsDuwpCTXo0+4jDF58c+wlNdlcIrmZd2?=
 =?iso-8859-2?Q?EGYyf8GpICFSe0cczxGGsdlgftWXgUly0reMgcDsDWJnTRzItGfTj3bhvR?=
 =?iso-8859-2?Q?pGsr7AtSwl2QKwB79dRi24cKPj+S4Vj6OIMZxMFQ/lujRkdXztZEx+Ue+w?=
 =?iso-8859-2?Q?W65l6XyW+IjQfOE0sRDuK/1JyYoe8W6uKjzY4TKF1wcuy1nzceQS9XC6fF?=
 =?iso-8859-2?Q?s9BgATq9vmQRIAoriMPKmCODy+Ao0FgPgUZpbVn4oF4ELbP3SpNQ6/Xmyt?=
 =?iso-8859-2?Q?4qginpo0xyAK3GzNs/EUQc/KJaE4h3vz3GVVLpMe4bg5RHLv7oYFiQqFX7?=
 =?iso-8859-2?Q?9wQDebQh7EiW8FMjiA8ppQH+Tie3mzBVBG8yZP8CL2hgxtqFjvPL5W2LVB?=
 =?iso-8859-2?Q?RMD2DH4dMmfT+jZqMdvuDDZZ904X7gy8Wnsxbf/o906+WN9jz+nYZ5AKlu?=
 =?iso-8859-2?Q?U35ckPHE/0nEgqNTTSlm+RrpkkPXwgNRCmSQyffsvnWmtNqk/l60vSKPds?=
 =?iso-8859-2?Q?4j1vLrWsMDJI13Ww3B4pQ8lM6fP/wDlWnqXfwwhHGOYidnCBrO+x9mRQLe?=
 =?iso-8859-2?Q?eGIL8k8vqlyrd+yCNhrbuNvauJMuyEg/8k7OhfHEzabo8gR5dpx8+tnXb/?=
 =?iso-8859-2?Q?/EFbDJ7MzWTkdHD2caj23sTHmKc8aCOEvi2Ly9fQt7PcOyXkAN85x8LC96?=
 =?iso-8859-2?Q?DXBPa4s29AciRUue9A1xXNE3srawwPUEEAhdqv0BpBU7asRzWCUfbJZ+5x?=
 =?iso-8859-2?Q?WcwJnahoO+HLSc0wi0g5JeIP8bHd1J+hRGhPNThsvxMNqAYCOAU5lxhqrb?=
 =?iso-8859-2?Q?rpmgufodrLNnMRTi4ajG5ApHLXLZoajPwwv6vejrxIvgoKnQmvFgY4kG7Q?=
 =?iso-8859-2?Q?pKIU8SyC2ZVlr1mXn+f08C6M7GDR9Sv6zVftS3JseC/56wjK48NEMHrIlv?=
 =?iso-8859-2?Q?ZaqSB5YIjq3dNCJi+jgzd+dZAMCsZ6vJgu4R9RvsBon/jIBP4wHXbcvtwq?=
 =?iso-8859-2?Q?QNcmqThe8w9ebc2p22HH+khKCrYH/VezN0U8P/TD6ug/qQY09PpnWZb9hg?=
 =?iso-8859-2?Q?cPTLtvbXYuLgdpTjWpBuyxXJNfxmvXQScqsiNjTFFvYBzWBU4fNeDxUBwm?=
 =?iso-8859-2?Q?cmTg6E2Z0swsU3m3Jr/e+VKqU+i1mMdP8tkmtfhoSgx+uQ76uoHnKr3maw?=
 =?iso-8859-2?Q?GuUgEptI6PQGYNftnvQyTz89OCTwqjlshVsyHChRbH8aIducb5h2Yclbtn?=
 =?iso-8859-2?Q?H4cqdYjR3uoDAhn9KvPndWdK6iYQeRS+8L0Dv7Eeop9dxquF38EKesPUxr?=
 =?iso-8859-2?Q?k8imL8kMSCXsZXDi5D8fbzWsyEQkyahP+CRsIaZF3li997Rk0S1uaoKYSW?=
 =?iso-8859-2?Q?HuB2IEGp+J58NSmY9Wk/QFEbM8Fxo3Gpj0?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e25ad85-d398-40bf-c7e5-08dcbdef718f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 12:32:07.9675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Z88lMHYXUSqZz7gXisSMYyL76kvcZdAiCGRRDjkmxXvw4uJsjZ6iedIlZc1yzUwzRolX1zAZCyPDtojGBoBs6dWOCaujc7Hyft4py8wnQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6648

Hi Andi,=0A=
=0A=
>=A0Nice to see patches from Nokia :-)=0A=
I am glad to hear that :-)=0A=
=0A=
> please remove the mail header from the commit log.=0A=
OK.=0A=
=0A=
> Why 10?=0A=
Well, the datasheet mentions minimal hold time as 4 ns, so 10 us seems to b=
e exaggeration, however when we get under 1 us must keep in mind potential =
paths capacity and lack of synchronization between mux and CPU clock, so le=
t's stay with 1 us that I will post in next version of the patch.=0A=
=0A=
Regards,=0A=
Wojciech=

