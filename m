Return-Path: <linux-i2c+bounces-10676-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBD4AA07C6
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 11:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97BB51881C1A
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 09:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B641C2BE0FD;
	Tue, 29 Apr 2025 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q/r9ueUe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35E2279338;
	Tue, 29 Apr 2025 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745920283; cv=fail; b=db8ZB59A7Ns+RWGHmIZDRY8SDwFlS1XS06GejqM9sCL8ka8P5D72jRkf/fmVWixerLDfa137uXkQBwiMibVSW5vVs1xSlA9cmfzqH4ClMKZt/ydzE8joDDUK3WO8lOfH+nQvVMzS/M0UxHBYheHNs45Q8uwXXfxYCAFGR3MWxPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745920283; c=relaxed/simple;
	bh=mTB5TwHMag8EOmbBft1O5HFyQesH7GL8S8EjCi6yoCg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nYLDmK5af9++bhjNdt1E8bOe8pRvHx5zuk7zIjpOqbbTlIhlDjbq10TsM2poWFULD/Y1zmJS0cnRS6x3Eb6bdp77LkT0ol3on78H+PjJnN84wQ37wRmbxj9qRVI4TtyUZqYGjv7Hq7R4OAVXUBwpo8zamiESima4UC/Q0TTNxqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q/r9ueUe; arc=fail smtp.client-ip=40.107.223.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U57xW6djXKkG59x2/FIg1j9OrPWgdlpIkmuivcKdgOOLo2CR7vWUFnOzSa2a/bP149+oi/WPzHur0yXLS5F21Rxb9CXYWK/laOD7FmGPMD0iYq+QpDiPahI+5M0O1dd6bQJGbruePKdLGeOUujTZWHvEs2C4GRJx+2CoNQzTsNdtYf4ceBe2N2asQwstb+01eYL3Cr77BOB2HqCJVIuPL471rlkrYmc017ptnPuVpFTrj2AHtYeqZ7+MJ0bwb1ZbDTLrHSFPJQ148yd9ZXljnPr0dhACQQj4bucOraqFq0t55bJgGm/LBzT7V40LE25ya3yk1Ghq2cgG93xBXeAdWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTB5TwHMag8EOmbBft1O5HFyQesH7GL8S8EjCi6yoCg=;
 b=TZlTJbype79ERj5S/Uyrvd7wDcsWHW2wOT/ICQKfPgWIjdNrx3maR1B4SSbw9D1Kjf4vXZHQY6uFdfFornJLIsv10BDLrYZ3aHFLG+nUN2vXnmuIT7lV8DsTad0ZB1hqD3ojMNys2hRHu7zGMFgLXkpxFkb4Dw6S4EH4b5kQkJfpIeAVyJjFQaiLSpzdKL1kwgyAM04BpIr2O8tAZHRwnj43HXp6okLxrfQoroJnRNahpu1MrX6hL0h0NWNvLPiq9rNgMk1GCjtT0SdYOGRot0HW70BPVtJrEPgydtsbySvJT0zfosUF5Lg7FCAEup4ageUMuD6ZRlc4uCej68lxuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTB5TwHMag8EOmbBft1O5HFyQesH7GL8S8EjCi6yoCg=;
 b=Q/r9ueUewVTJP1io77h5jcRUFPllnZHBcfBDuXXaeCREEmOXJpT7cPmEOms0K8zcvakxI0Dzn4kgrehOzmXC47APkARJq7q8qNQK9v3RBVuF5R/qxiITRSYGY+7Ja21dik8f9S53wnYsUbGDdQGsIIt22L/hBLNrvE/nF8sZ2dgpVubkdKox/hi6ctrpIouu0lW3J8f3wV4Kmajet3i2NsZPtNFt+iEXB4XD1F0Osuq/DnhTzm4tuZzggyOupS3g+aY3uCoL7St63Z6RZ0NJoRcySDsYfnVtAyGAg22dznh/WBRZ2/cFsHwbmrqnaKHOqUKNw0M+h7SZVwEZXhTJKA==
Received: from PH7PR12MB8178.namprd12.prod.outlook.com (2603:10b6:510:2b3::19)
 by PH0PR12MB7837.namprd12.prod.outlook.com (2603:10b6:510:282::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 09:51:14 +0000
Received: from PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530]) by PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 09:51:14 +0000
From: Akhil R <akhilrajeev@nvidia.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Andi Shyti <andi.shyti@kernel.org>, Laxman Dewangan
	<ldewangan@nvidia.com>, "digetx@gmail.com" <digetx@gmail.com>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter
	<jonathanh@nvidia.com>, "wsa@kernel.org" <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thierry Reding
	<treding@nvidia.com>
Subject: RE: [PATCH v2 RESEND] i2c: tegra: check msg length in SMBUS block
 read
Thread-Topic: [PATCH v2 RESEND] i2c: tegra: check msg length in SMBUS block
 read
Thread-Index: AQHbtNp7s1SLK4Twwk6tSesUZmRNhrO5wm+AgAA+eACAAAJCIIAAJekAgAA0i/A=
Date: Tue, 29 Apr 2025 09:51:14 +0000
Message-ID:
 <PH7PR12MB8178A35A3D51F6BE3D1E6888C0802@PH7PR12MB8178.namprd12.prod.outlook.com>
References: <20250424053320.19211-1-akhilrajeev@nvidia.com>
 <j3jxuuwu2joyn6jsfa63lkkuwqazd2mpeki6gamdpktllhpkhv@tfoqnztsa7zw>
 <aBBE5mgqGk0yXQWN@shikoro>
 <PH7PR12MB8178416B09D217B77CC43C04C0802@PH7PR12MB8178.namprd12.prod.outlook.com>
 <aBBmmNlM3_zjNMC3@shikoro>
In-Reply-To: <aBBmmNlM3_zjNMC3@shikoro>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8178:EE_|PH0PR12MB7837:EE_
x-ms-office365-filtering-correlation-id: 1c2ae50d-c586-480e-e2c0-08dd87036176
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xVevwADNgRV+39ZsMuWNVCTtfLjR0UlfTdbKC3mQ3gmVmka7YhIDDV4yoi2Y?=
 =?us-ascii?Q?vGMbQ13GXlfSMb+J8wyeoxKCPLlxmF4S4cCO0vS1xkHIncsHOMLsW0mGdeMT?=
 =?us-ascii?Q?UTLMjUOT2gpJvZ9abyogA30ySMdRvtNeiKzP+qnIEDUMXYFb7FeUgRq0KYhB?=
 =?us-ascii?Q?g8QowH4zHNgFwTZOuBKensMOtIC0iSBkbl2Y08oXU6timfqH4vPVN9csL2I4?=
 =?us-ascii?Q?4VpXEh5pQf2XflqMjSlAYNEYImiNPdbs7FDsTid7iBIcp8cHSe1dMejlPJsH?=
 =?us-ascii?Q?FGUhZJJAnMgkqcljorHrYdxeoE8cpfO7LseBvKYGw9L14qtNNn7UehK6sBDJ?=
 =?us-ascii?Q?mtkfBJltCebgvY5Z8SKwAZVS9/qDjUL4zVn6qEc3wCGb2sMAifl7lF6ITEdJ?=
 =?us-ascii?Q?vsyHJr4NIlr5XwIgXGRiC3dXal4e3DoPFCMGgKnA1R0EI1xxy2WP6amCFMKw?=
 =?us-ascii?Q?IMPXKECzXNZjXVCLqPxHB/7zof5eCPUhBwbjEgT6UY3AcZwJy985yfRgz/NW?=
 =?us-ascii?Q?VqkpsH/nNktZBhjMAFDHoQX6MzPFRGXiMiFG3mRFnj1Xl2n3x7k2dj4TShn4?=
 =?us-ascii?Q?NJZflhkkXKMFGL0DFTr81/AmQHF//xqUf1toRj9IsFFhRIKojLGY5vy0dKI/?=
 =?us-ascii?Q?1fex03ZKJHHohkwqg9cmUEmNhfHp7JzS5S7hWFrwkWSQtCO9hEjX3Fe54U3B?=
 =?us-ascii?Q?xJxVzK/m+FQOl/BRybSKpqVMRxU6kn35jaSxIl4ShZxQ62F5XNTfJySpBmPJ?=
 =?us-ascii?Q?CAAq7YMuiU8lB7TtEotTLmO7xddGG7AqJQPm+vu8VlGFFUdH2jOZn4eCMvd2?=
 =?us-ascii?Q?T6/mxbi9ZMtqvbeA/5u5m7YGiA80knAV+y5jXRaIdHFXNhzZ1qWZheoCGQOg?=
 =?us-ascii?Q?923q98Ozl7FBTZMOt2YLKK67l7OkWelWuOfcg8jF2lAvGDLE9+bdU5GrVVCW?=
 =?us-ascii?Q?kzR8i4oqsunI6CjmSBe++3Uhyb1bEZb0pUkVQOGNiaFbgZuGG7MuXG3hgWcy?=
 =?us-ascii?Q?ysfCWyTSK5FVAYoWI9bdVHBqoHf8ZVzUzuIgl3gTiYf4Pb3PlLTLQYo55Lm3?=
 =?us-ascii?Q?jNWDQ/C9x+9xKZ8arWDZP+X3ezaGuUJAAbyBD8eteNrzqKWMZR1EE2gaETwP?=
 =?us-ascii?Q?pFVnLxVa3s58FJGZZxjXijXQLdnQNM1cUjOPKIhTeVe9/7gBGZAqbYQ7vVj7?=
 =?us-ascii?Q?Dkxx8n1R80PZMFbZa8yATCb0thhxvT36/coINqWIbQHNk3bHPkEurpeUYC0h?=
 =?us-ascii?Q?nxIn9o15kurFW3sDW0YxnZ2SUHR4xy2B2giBoHfAnluivIeZoyyxuT2Rgqjc?=
 =?us-ascii?Q?bcHVRL+bNWxPWCxCRYdhK26e6CQt6fztBg43Y8FOIgoqTFJLLLxTcome54zd?=
 =?us-ascii?Q?a5EoaW0I0GWrtauVkDd2nwlG+Luz4DTyWrsoDmaC2Qy55XE+P7/Kl6Fh4Sm2?=
 =?us-ascii?Q?jw62kneMrTdhk/FuBy5yxfPykNAlJ9BZ2aIlFZZ4m1ocEoqkFIM/bA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8178.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/x9HU3qwSt5L6xHYUyvB5JuYCABizI6xXJVSxy59DlIHzRC/vz3EdhVlRtQf?=
 =?us-ascii?Q?vmNVbK4hE9EWJnEwVJVKVr790ebYq0j6uFHDbIHAGKg6+P5Jnm+703N6tWrF?=
 =?us-ascii?Q?QEciJpxGc0Fv4/a0k1Z7TFuvVBiOdhfJdpNdpRsZp8CiASTcYTtNPgYdiTnu?=
 =?us-ascii?Q?4GLrGvAowMaVDM+ihDrez+HP1aOpX92bdpo7dwcarDa2LVW5QWsRFxcvDJi0?=
 =?us-ascii?Q?Ga863GeZAw0DhnmpGM1kJqryaYqQSl80Hhu/PzzCvgRUgwYWc8yLIodKh/+0?=
 =?us-ascii?Q?ZKuDl/ssg6VziIzwMqsDbLozxIzjsufWKAQCscQRJlPiOWoGJe+9kAl34CPL?=
 =?us-ascii?Q?GKTpGDn4SbNH/X/A9XdC3zu3ETuDfPiXJbTwKDlzS/jrvFLP12TWtsg+0qNG?=
 =?us-ascii?Q?putXDcEVRCoXDy/Rxs6s5i/uCbnL7m55vpPCpBzE5Y57q9N82OROWIDDrxdo?=
 =?us-ascii?Q?8iHZeY+M77CQLdO2Llbfp4OBZMhH6k7SJmjz5sOWtyzuPfqstCT6Az1v4Gvg?=
 =?us-ascii?Q?iiMv/gTolGZyXP25ilzYXJeDT6YWVkfOk6o6mUa65Hkbu4asxf8sK2snjorJ?=
 =?us-ascii?Q?4YMNEGADY48p32t+l3ilZLgUl98KckpifK+PpWJW4oD8YFouEAnElZGylK7e?=
 =?us-ascii?Q?ETILOslYX+AwWf/Y7PB565/rzpzxf5BeYw4VuFg3FnahQNUiiF0+SXQWNXMh?=
 =?us-ascii?Q?UFG8kbeGTh4ZVfKHuoffOydL6OU4l2zF6lQ6M36hxQtcti1SsZ9Fj+/Lbmnr?=
 =?us-ascii?Q?xQeHsOEmH0DuD/uGGiyAo7CtQSuON85IvD8E2boUxkRLm7mOewX7ET1Us7QY?=
 =?us-ascii?Q?eyPxtYEqyxOae4DkKpALGAQYux8vDkMuOLuKMvjVXPLjUBWByPBPVHw3OcfK?=
 =?us-ascii?Q?2Pt9U7jzwxJdaN/dZwe2z80EtKsbsPqgb5v1p595HcqRJyWFYRQ+pXPsFn68?=
 =?us-ascii?Q?sRVjNmPM/eY6YqW197F6lgnrjn2kT5nTjq2ALufYM4fgxsmGqRJURTFkZ0QP?=
 =?us-ascii?Q?vAVO3pVA/0RHupNX0KwM7ZM4wTvd7tH+msgyX89MHz0K42n2fKdowh5j19EL?=
 =?us-ascii?Q?MAmgClkV2dn333lFyX3s437DpmkQwX2AyvicljM2scN/ultZf9NmcmJFqAPr?=
 =?us-ascii?Q?x3pDC6Ry2DB4CVeMVy7kgGhx5XwrfR/MW1RnPpeJNs06AoPCHgAMaNmquF52?=
 =?us-ascii?Q?gq2xkjbPbukuBzOE4dGt3bZZC9Qr8OnrSHAS0ZR3NW2fyAlpV7P69k88b0We?=
 =?us-ascii?Q?ijKxihbEKW8favBJCnLZzmrcLH8LTx8AYQAQh5Xsj2nD1xgHFBjwdq7dD1k/?=
 =?us-ascii?Q?vRTxruJAlLbWPOlsbXjHtSN/UknBJx0wPEddc2DuWOLMq57IIgN/6JEZOl/P?=
 =?us-ascii?Q?NodnPDFmyNrek44dn+GF2IL5jJ6SqQlR2XWjhN4Uug9fRAAWQwyJM8dsYoi2?=
 =?us-ascii?Q?atxCMCz1Ii86r5NqcJ+k7W02lbpf2PZqc4NfGZpQPMATE7DHoWgVnJWL7mPz?=
 =?us-ascii?Q?LYXGtJYGR28wG3D1h0mxZ+fxcCVuSRmJwX7xI+Y9WsPrxrKszvk8BXhcevQJ?=
 =?us-ascii?Q?O5FgSFeltM2DkT2ibR0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8178.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2ae50d-c586-480e-e2c0-08dd87036176
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 09:51:14.5989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fE4BQTNzq89QWZG5n+pkdSe6FRRX7UBQvkE5FaT4t5uTHkFFOqdU18c7i5t4Ep0ckqaUBqCuZxn5LZv7BEmAWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7837

> Hi Akhil,
>=20
> > Yes. We have had issues where the client device sends '0' as length if
> > the
>=20
> Can you reveal which client that is?

The issue came from a downstream change in the file=20
drivers/char/ipmi/ssif_bmc.c in the OpenBMC Linux tree.

>=20
> > transfer is terminated abruptly at the client's side. The actual fix
> > is in the client's driver, but this check here would ensure that the
> > master does not run into trouble either.
>=20
> Correct.
>=20
> Happy hacking!

Regards,
Akhil

