Return-Path: <linux-i2c+bounces-6519-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C24D974B36
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 09:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACF071C24060
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 07:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A7213A265;
	Wed, 11 Sep 2024 07:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Bdz427zK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29C8136341;
	Wed, 11 Sep 2024 07:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726039595; cv=fail; b=sPJC/srHHLVHgfwbeRoAPGt/n7Fa0WaLMtFj1evIh33PreV/95y8lZ/h+N589R9IuGIWYW0A6IxU01r4DrZInCnHRQbjFdFibFNUWVJAFuCbJS/66SSr7hHiSKzWm0dHwnPa10iH56VgOdj9nLxRzKDmtp3XTcYxNcTQQJgvoC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726039595; c=relaxed/simple;
	bh=tOO+TbUH9nCkqfcQFywKW/3YRGUlbmgynG59QVXca18=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RKQZZWvQbm/kSAInqLql4yZ3rxvC2skKzsHDfG3A8zOSSaa8ib8iewXAVw7AczIEFmI3lh/foXGmXBFXb9nfTuf+kfqgx0FKwtdKxmhBZb3K8O9wgCvGViwUI9TwzuOebwLkoyHb/xdSwAxj4J6WV291Xb6JrNvaymjThwlR5dQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Bdz427zK; arc=fail smtp.client-ip=40.107.220.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAo2PIU2Qj2ConBLm6qLLQmwNugP0aAEw1DAtz+z2xVojmKdTrBoo4/0Y30pqfd/690FzLBdVEMpTwKLTZMhEX4eTNQn7aZOzZ25Zh5WDVpvl6MutghQ1msIxy83Vj6pbCDLiW0S7Eg88iblu7xBOLLaJRrAzSNEmKdt/2iiwT0WDppW7wiPATNo/BTgKBNaUUnpnRqe1oOioXoHXWyqMJBNkR2duyTn8pTN9c9uQg1I0EUI3iH3OZBNYVgEbKJff+a2O4C9qhZoIZb1/pKEBO2w67Ye4vzCUeLBbIbsPtApYlRz3m2Jex28O7OQ0Zh2PYXys7vXqxKOUBydlxddcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5kPRlvueHceK3vyvseQuYkpJ88cUWaqqS4vZbbyKAE=;
 b=VXPE3I5U079Ffz2oAlCdqufPM9tCjvX0koWXgTN1ZGRnL+c/VpTfTJU24ksis8yVsqGyrurnQcIV0/2ixdQq7HAlCObgApvLrfNeucu26OvSOcPtcjWnKDHIou80uuNfbxKv1Ze+/If0PmLGGKlq2P/suKWrhu7/5KsNSa2Mz07kNEX8dueNG8v+uBqF9CAb8HJYZMlFBwDqOA1uBSymUu5i8JgebSRMLe7Fmx5ipRyRJD2rYePVg5UtzBDfgKJ4vDYAM0Bi5IxTy+ll2oDsxgZcmHBqkomgWS5dfFaUt+dYJiQgXRONM6orV9w30TkKEr6XkfBpln8ljcsKzwFzug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5kPRlvueHceK3vyvseQuYkpJ88cUWaqqS4vZbbyKAE=;
 b=Bdz427zKHbqunIkCrplaF2FhwAaw0xPYr0dBpqj1NhhA+Qa0l9NNDJ6WimQuhTGKBB4SK4+YnFBc5SzMW3EmIQ+5bR/1rJ7g+uIt8vn/fCQWswGJQnSli/6LoWG6UEwy9GffBEf5Tj+zHlZ3aGQbsPYQ5QRmSw4fG9E3TVI0/1M=
Received: from DM4PR12MB6109.namprd12.prod.outlook.com (2603:10b6:8:ae::11) by
 CH3PR12MB8484.namprd12.prod.outlook.com (2603:10b6:610:158::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.24; Wed, 11 Sep 2024 07:26:31 +0000
Received: from DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1]) by DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1%3]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 07:26:31 +0000
From: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: "git (AMD-Xilinx)" <git@amd.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
	"Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>, "Goud, Srinivas"
	<srinivas.goud@amd.com>, "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
	"manion05gk@gmail.com" <manion05gk@gmail.com>
Subject: RE: [PATCH 3/3] i2c: cadence: Add atomic transfer support for
 controller version 1.4
Thread-Topic: [PATCH 3/3] i2c: cadence: Add atomic transfer support for
 controller version 1.4
Thread-Index: AQHa4/d1fUhXdL0Y7U6RgxGWXLGsjrJRPzWAgAEgEWA=
Date: Wed, 11 Sep 2024 07:26:30 +0000
Message-ID:
 <DM4PR12MB61098BA9557140DB0BEA36848C9B2@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20240801094408.2004460-1-manikanta.guntupalli@amd.com>
 <20240801094408.2004460-4-manikanta.guntupalli@amd.com>
 <5hjezq5ag4etru6suzbntvg2fwn45acckiyxsujmsjxsrgqxrd@asub7zr2t3gd>
In-Reply-To: <5hjezq5ag4etru6suzbntvg2fwn45acckiyxsujmsjxsrgqxrd@asub7zr2t3gd>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB6109:EE_|CH3PR12MB8484:EE_
x-ms-office365-filtering-correlation-id: 20972204-7791-47af-edf9-08dcd2330e9b
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?+22/NQX+YZkoeuewKdOWnNY62K4rj7Br1ry37BAqsdmBCpbnfnaaxYmUpD36?=
 =?us-ascii?Q?C6WCEsEf1uLRv6Y/9F+Riz0y0SnTYjnkbea8irLlL7Kzv12nS8a/bA1GkyWv?=
 =?us-ascii?Q?2Z8qmpY71QBz8futbIDtiZ9HfQ9iKmL6nKCwXiMGvHsmvkIag/+rPZfIzc9v?=
 =?us-ascii?Q?EIjCXWSxVF2k5RusiigTHwwJ5r+jsqqYnp2kesrsHvZIVVyvbWTr4ibpXrZh?=
 =?us-ascii?Q?OaGdFKplmStaYo6v5wf7WRwXbQIBT25AaU7b4Fj2N3nhMYGQ7lCkmWqTce/Y?=
 =?us-ascii?Q?F/touqAd8EIECh83FUJKN8YT2aIfuhbQtiZrgcmr8l210MBUowfskxnyG4vD?=
 =?us-ascii?Q?bpKKn1IIrcjzxKv8o5sbLAO3UZHZrTLdFzwSSvXZISpHR7ruoASDNM4zdYLn?=
 =?us-ascii?Q?mZ2WbcA/F5RytsOrJ93RqS7ucozv18/X1VZiSxWAQmK/6ztW4BZK7Qgh96Xi?=
 =?us-ascii?Q?0NkoYv0TIJNzIisDgGyHKt2mTaAo/bXIbwZzNuPx+5qUTMv2z0fL1rYOoBNZ?=
 =?us-ascii?Q?KEhjF/HUz39SxGSe9314iCJnTgST1YJTrTsP2psbgkJlMAbpPd/uqIprHr4L?=
 =?us-ascii?Q?wHmiTs0/S3rqcTI/MQwyAGdDxnfVSDBRzjRLgNRXqm4SUqn+3TBPilREfreJ?=
 =?us-ascii?Q?ByIvbpF/GuzLI38HboxTb4wv54dmwHFtjx0u1WPPpwoSIsZFBOKPk4qLRLDJ?=
 =?us-ascii?Q?exPXsVfD4Z/RWLX8uy5T93EwG/CLpvWtx4PIhSJBmT47HBEr5wDQHLDtHWYv?=
 =?us-ascii?Q?L+YtGffbZN5jzJ6hxJzEj002l2bzVEP0nrbdrxWXr0ovEnT8KZoiqw3d59MY?=
 =?us-ascii?Q?8DmF8c6sa/zGeGXlIVL3QcodxLZtlT/Kv1ra1agZALU9Clr+Q/KF1ftCYkDc?=
 =?us-ascii?Q?rg6q38DxSJb22meO975mATCHnlqMRTeekPnizUBfsBAXK4y4hI5RXlvRv3PZ?=
 =?us-ascii?Q?5xWwcnWdWmm0XZwFExJ0BvYn2FmFn6TD2u1xi7CxvcasrdyZMUdYPe/sft0a?=
 =?us-ascii?Q?5HhSeiopqZqCLEuqBmzBVVvajH6VbofxWOBdKxDfZVt7u1tCUcj/a2mSXdY7?=
 =?us-ascii?Q?wWnyEpIVF0W8bD4YBCsJIZ4c9yTh/ahdwBIrNMV3D3x7WnpjBD6EFQqzZXf5?=
 =?us-ascii?Q?8m4WzsjWJI7Y5I/imDGITXWbusBb51Turf4jwxirkbDhtk3rNJP+/+iX0ORT?=
 =?us-ascii?Q?Eou3qtpUwKYF7zVYQ7Dad0riA0oN32N46lOy2k2YE3cM57mnTeNJCF0awZJA?=
 =?us-ascii?Q?JNRm0Vws8qRT5SeJffaeYEwQ8Jt5DU4u6zmEfCdoQRUHpZR0x/FfaJ703erM?=
 =?us-ascii?Q?acZuj896DFbCurIbosydSv4FFqltQnvQDyVGr4v7mH1sPemBNK1nM2MKbbOu?=
 =?us-ascii?Q?YFOkZSzYvABNINvNkgqoinqTIXj9RnrpyPlYqSuqpr0tWCsBAg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NGudt+erk57A8Zu7FY23HhsuwaKkXfbbY/AeC0dTiDGiZh1ObHbB7/YmTmu/?=
 =?us-ascii?Q?r/v5KSxvzlbC4zKFkalXDEDUFjv28Iw5Ix84nmjrws2uKE8SJ4XXS42JSNe7?=
 =?us-ascii?Q?xz+ELpTUmxM0Stf4xD0PhA8lWCod5AjZKL8+sqN1BgwGxPkJV0TR/v4eKiSG?=
 =?us-ascii?Q?jwgG1COn0tS1PC/Wt/zwqJMiKs+wXhSURmU5DivelW8bj95aysRxNrnqYDOK?=
 =?us-ascii?Q?x00VhQQ97W2r5Slk8Fsh0S91QZlfKzwMgwoQShR1uIyT1lWQIQwNOJ+cJ0rJ?=
 =?us-ascii?Q?smVBKAjz6AhB+CTiYbyng/UVbFKw1uc6/vC7OP5AuZlsvhxEqqXgu9Ew8Glu?=
 =?us-ascii?Q?j46zwz8sanxq6no339c6I0j/MWV2qYIY6voGZRTOohNrQ2mTY1+UOPxwnyhJ?=
 =?us-ascii?Q?a978d/vVumqVDvGVH4h1Dtne47T8/Ekb/hNCz39UrHwMXMdiXY6hTEIkRhle?=
 =?us-ascii?Q?Z89OJ3isD9GMkrjHi62DHpvUqtHhE/6oik88XrQnPFXPQVSKfSX9voGQzKmp?=
 =?us-ascii?Q?kLMOlz8gDtJEY2BwL5YhbZOAJ+u9ItYBX/mWjSKduw0+2Be23ocQYW38cWBi?=
 =?us-ascii?Q?i20tPwT72J0t8knZKgHC4BRJ6oNttmd7bgkTU7sdtDYtnjoLM4eFVmvj8ZmK?=
 =?us-ascii?Q?8LACOOKdaTdIeR3Pyo7/Ey21G/PcXqNjYlOlQnhXkvTGWBk04mrSHiBrtiGj?=
 =?us-ascii?Q?7BYZFA6M7xDWA2LepBr6Qf9iHxLGvp2XcpIzT5Uk/rEH475YAkrCX6DM3WU3?=
 =?us-ascii?Q?WZaRAa4uUVtkprUEh/MRqKy4EcBWBF6KUSECMTZel31Km5ap4oTQzQ02oGuZ?=
 =?us-ascii?Q?rHi2u7ZMDhYRArWkPYlL9JUZ6p3XXLu5jrN98P00EuNAVOaljhFR+FK8zmQy?=
 =?us-ascii?Q?/8adwVAZr2E5Osd6fuo704BzXx/z80+jL2GAfvLf9rw/51f+qj6XYZzCnaWD?=
 =?us-ascii?Q?utLxqgsOr282GkMI39BCNF8raBQdMsZa3OfuudaxYJEPwT7QcZdDBS0YjEgD?=
 =?us-ascii?Q?8o09gNYZJmwlt2Y3qekP5XO9k5O52SvSN9YhqIm5GFgR2Lmit1lWb9D3lBju?=
 =?us-ascii?Q?fT6X1pWQFGxnz9Ilsq9BD4e0/tOKN8XX/glltrGi2NlOonRv63fbi/AdV7go?=
 =?us-ascii?Q?YU3P6o8oy5luWQKXpYdlhDjaBiHpVRqjNavQIPrVYMnkP4XlgbweY9R4UuuZ?=
 =?us-ascii?Q?QvSvF/pAr1tzFvhpEi3ilJNcTl7DdI4WoIbYspe3rFUuv0hb/NTsTW18BCBi?=
 =?us-ascii?Q?FlQOkRlGZPurcTf1wtkdchyKIKtOsmR22xNE4bVML0FTwj0TiTMqbb4uJHm1?=
 =?us-ascii?Q?oNeX4BBvvDasbDR/pBcWPO/ei68qSmhUAPvgUtWlTfpv6byPTecujF4UwHwM?=
 =?us-ascii?Q?loLZb50RwniQwRp6Wx6nRLA8/FehFaYetyZ3HLMB+V5dQapVA8OlsxQ8i9a5?=
 =?us-ascii?Q?GMiMUKpQBjQH8dh+yr/ufdJssQ++A7wZ9TfCl8xD6fHOzwWk7QVMY5dmH9yJ?=
 =?us-ascii?Q?F+Pxg2OTNGbdpM2eQLMpa1kXI7al2YWjo1kIL5okwQQRZciJxomLpRYNtLHO?=
 =?us-ascii?Q?a9THoNIdqEI+HjhhDrw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20972204-7791-47af-edf9-08dcd2330e9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 07:26:30.9810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dn47T/cY9/epAuI9zAfkbKpKX7LlQqaUUii0ys+rthKy6Kh6n+lTHL37Huj5LFN9Le9YaWftPdFzLR5KvQw+vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8484

Hi Andi,
Thank you for taking the time to review our patch. We appreciate your detai=
led feedback and will address and fix all the review comments, except for t=
he last one, which we believe may not be applicable.

Please find our inline replies to your comments below for further clarifica=
tion.

> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Tuesday, September 10, 2024 6:46 PM
> To: Guntupalli, Manikanta <manikanta.guntupalli@amd.com>
> Cc: git (AMD-Xilinx) <git@amd.com>; linux-arm-kernel@lists.infradead.org;=
 linux-
> i2c@vger.kernel.org; linux-kernel@vger.kernel.org; Simek, Michal
> <michal.simek@amd.com>; Pandey, Radhey Shyam
> <radhey.shyam.pandey@amd.com>; Goud, Srinivas <srinivas.goud@amd.com>;
> Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>; manion05gk@gmail.com
> Subject: Re: [PATCH 3/3] i2c: cadence: Add atomic transfer support for co=
ntroller
> version 1.4
>=20
> Hi Manikata,
>=20
> Sorry for the delay in reviewing this patch. Looks good, just a few notes=
 below.
>=20
> ...
>=20
> > +static bool cdns_i2c_error_check(struct cdns_i2c *id) {
> > +	unsigned int isr_status;
> > +
> > +	id->err_status =3D 0;
> > +
> > +	isr_status =3D cdns_i2c_readreg(CDNS_I2C_ISR_OFFSET);
> > +	cdns_i2c_writereg(isr_status & CDNS_I2C_IXR_ERR_INTR_MASK,
> > +CDNS_I2C_ISR_OFFSET);
> > +
> > +	id->err_status =3D isr_status & CDNS_I2C_IXR_ERR_INTR_MASK;
> > +	if (id->err_status)
> > +		return true;
> > +
> > +	return false;
>=20
> return !!id->err_status;
We will fix.
>=20
> > +}
> > +
> > +static void cdns_i2c_mrecv_atomic(struct cdns_i2c *id) {
> > +	bool updatetx;
>=20
> Please move the udatex declaration inside the while loop.
We will fix.
>=20
> > +	while (id->recv_count > 0) {
> > +		/*
> > +		 * Check if transfer size register needs to be updated again for a
> > +		 * large data receive operation.
> > +		 */
> > +		updatetx =3D id->recv_count > id->curr_recv_count;
> > +
> > +		while (id->curr_recv_count > 0) {
> > +			if (cdns_i2c_readreg(CDNS_I2C_SR_OFFSET) &
> CDNS_I2C_SR_RXDV) {
> > +				*id->p_recv_buf++ =3D
> cdns_i2c_readreg(CDNS_I2C_DATA_OFFSET);
>=20
> Can you please expand this operation to be a bit more clearer, without as=
king
> people to check on operation precedence?
We will fix.
>=20
> > +				id->recv_count--;
> > +				id->curr_recv_count--;
> > +
> > +				/*
> > +				 * Clear hold bit that was set for FIFO control
> > +				 * if RX data left is less than or equal to
> > +				 * FIFO DEPTH unless repeated start is selected
>=20
> mmhhh... the lack of punctuation makes this comment difficult to understa=
nd.
Sorry, we will update.
>=20
> > +				 */
> > +				if (id->recv_count <=3D id->fifo_depth && !id-
> >bus_hold_flag)
> > +					cdns_i2c_clear_bus_hold(id);
> > +			}
> > +			if (cdns_i2c_error_check(id))
> > +				return;
> > +			if (cdns_is_holdquirk(id, updatetx))
> > +				break;
> > +		}
> > +
> > +		/*
> > +		 * The controller sends NACK to the slave when transfer size
>=20
> /slave/target/
We will update.
>=20
> > +		 * register reaches zero without considering the HOLD bit.
> > +		 * This workaround is implemented for large data transfers to
> > +		 * maintain transfer size non-zero while performing a large
> > +		 * receive operation.
> > +		 */
> > +		if (cdns_is_holdquirk(id, updatetx)) {
> > +			/* wait while fifo is full */
> > +			while (cdns_i2c_readreg(CDNS_I2C_XFER_SIZE_OFFSET) !=3D
> > +			       (id->curr_recv_count - id->fifo_depth))
> > +				;
> > +
> > +			/*
> > +			 * Check number of bytes to be received against maximum
> > +			 * transfer size and update register accordingly.
> > +			 */
> > +			if (((int)(id->recv_count) - id->fifo_depth) >
>=20
> The cast is not needed here.
We will fix.
>=20
> > +			    id->transfer_size) {
> > +				cdns_i2c_writereg(id->transfer_size,
> > +						  CDNS_I2C_XFER_SIZE_OFFSET);
> > +				id->curr_recv_count =3D id->transfer_size +
> > +						      id->fifo_depth;
> > +			} else {
> > +				cdns_i2c_writereg(id->recv_count -
> > +						  id->fifo_depth,
> > +						  CDNS_I2C_XFER_SIZE_OFFSET);
> > +				id->curr_recv_count =3D id->recv_count;
> > +			}
> > +		}
> > +	}
> > +
> > +	/* Clear hold (if not repeated start) */
> > +	if (!id->recv_count && !id->bus_hold_flag)
> > +		cdns_i2c_clear_bus_hold(id);
> > +}
> > +
> >  /**
> >   * cdns_i2c_mrecv - Prepare and start a master receive operation
> >   * @id:		pointer to the i2c device structure
> > @@ -715,7 +804,34 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
> >  		cdns_i2c_writereg(addr, CDNS_I2C_ADDR_OFFSET);
> >  	}
> >
> > -	cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK,
> CDNS_I2C_IER_OFFSET);
> > +	if (!id->atomic)
> > +		cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK,
> CDNS_I2C_IER_OFFSET);
> > +	else
> > +		cdns_i2c_mrecv_atomic(id);
> > +}
> > +
> > +static void cdns_i2c_msend_rem_atomic(struct cdns_i2c *id) {
> > +	unsigned int avail_bytes;
> > +	unsigned int bytes_to_send;
>=20
> Please move these inside the while.
We will update.
>=20
> > +
> > +	while (id->send_count) {
> > +		avail_bytes =3D id->fifo_depth -
> cdns_i2c_readreg(CDNS_I2C_XFER_SIZE_OFFSET);
> > +		if (id->send_count > avail_bytes)
> > +			bytes_to_send =3D avail_bytes;
> > +		else
> > +			bytes_to_send =3D id->send_count;
> > +
> > +		while (bytes_to_send--) {
> > +			cdns_i2c_writereg((*id->p_send_buf++),
> CDNS_I2C_DATA_OFFSET);
> > +			id->send_count--;
> > +		}
> > +		if (cdns_i2c_error_check(id))
> > +			return;
> > +	}
> > +
> > +	if (!id->send_count && !id->bus_hold_flag)
> > +		cdns_i2c_clear_bus_hold(id);
> >  }
> >
> >  /**
> > @@ -778,7 +894,12 @@ static void cdns_i2c_msend(struct cdns_i2c *id)
> >  	cdns_i2c_writereg(id->p_msg->addr & CDNS_I2C_ADDR_MASK,
> >  						CDNS_I2C_ADDR_OFFSET);
> >
> > -	cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK,
> CDNS_I2C_IER_OFFSET);
> > +	if (!id->atomic) {
> > +		cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK,
> CDNS_I2C_IER_OFFSET);
> > +	} else {
> > +		if (id->send_count > 0)
>=20
> If you do:
>=20
> 	} else if (id->send_count > 0) {
>=20
> we save a level of indentation.
We will fix.
>=20
> > +			cdns_i2c_msend_rem_atomic(id);
> > +	}
> >  }
> >
> >  /**
> > @@ -818,7 +939,8 @@ static int cdns_i2c_process_msg(struct cdns_i2c
> > *id, struct i2c_msg *msg,
> >
> >  	id->p_msg =3D msg;
> >  	id->err_status =3D 0;
> > -	reinit_completion(&id->xfer_done);
> > +	if (!id->atomic)
> > +		reinit_completion(&id->xfer_done);
> >
> >  	/* Check for the TEN Bit mode on each msg */
> >  	reg =3D cdns_i2c_readreg(CDNS_I2C_CR_OFFSET);
> > @@ -841,13 +963,24 @@ static int cdns_i2c_process_msg(struct cdns_i2c *=
id,
> struct i2c_msg *msg,
> >  	/* Minimal time to execute this message */
> >  	msg_timeout =3D msecs_to_jiffies((1000 * msg->len * BITS_PER_BYTE) / =
id-
> >i2c_clk);
> >  	/* Plus some wiggle room */
> > -	msg_timeout +=3D msecs_to_jiffies(500);
> > +	if (!id->atomic)
> > +		msg_timeout +=3D msecs_to_jiffies(500);
> > +	else
> > +		msg_timeout +=3D msecs_to_jiffies(2000);
>=20
> You explained this in the commit log, can you add it in a comment, as wel=
l?
We will update.
>=20
> >
> >  	if (msg_timeout < adap->timeout)
> >  		msg_timeout =3D adap->timeout;
> >
> > -	/* Wait for the signal of completion */
> > -	time_left =3D wait_for_completion_timeout(&id->xfer_done, msg_timeout=
);
> > +	if (!id->atomic) {
> > +		/* Wait for the signal of completion */
> > +		time_left =3D wait_for_completion_timeout(&id->xfer_done,
> msg_timeout);
> > +	} else {
> > +		/* 0 is success, -ETIMEDOUT is error */
> > +		time_left =3D !readl_poll_timeout_atomic(id->membase +
> CDNS_I2C_ISR_OFFSET,
> > +						       reg, (reg & CDNS_I2C_IXR_COMP),
> > +						       CDNS_I2C_POLL_US_ATOMIC,
> msg_timeout);
> > +	}
>=20
> You can merge this if/else with the one above, to save some code.
Thank you for your suggestion to merge the if/else blocks to streamline the=
 code. We have considered this approach; however, merging them would necess=
itate duplicating the following lines in both the if and else blocks:
     if (msg_timeout < adap->timeout)
                msg_timeout =3D adap->timeout;


Thanks,
Manikanta.

