Return-Path: <linux-i2c+bounces-8055-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 859C19D2DDB
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 19:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A814B2FB9F
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 17:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3251D2F56;
	Tue, 19 Nov 2024 17:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wq+cppgM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003241D26F5;
	Tue, 19 Nov 2024 17:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732039009; cv=fail; b=jVE2Z1FtLOdhG7hKOHKdicn+eVUr1ZJF6a3addi2gXevQLzmWZ9X0gpkKO3oIyXI7I9u+pwobpzDQmSX5+cdqqT82FuguIQKdmZdm4ldMX8ckQeoOWT5jsb/ZrqMiwMs1fXZpJajuCXRc5oVRnVqpe+YAyqjhGAR9qO6IbjUldo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732039009; c=relaxed/simple;
	bh=dYxhXSxXdHc4LEY91uduQVBbyEsXu9ke475u6AbUPpM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ajql6B3t2Z+O+ZjYsbwdIdqnE/W/swTv0BH+FftnkB+o5y3lSXLBFGjSi0ZKLOVXdDgP0bx0fivB2w1dLr6ZdSvlRITSiay6GMfbw6lcT2kb4WSIMVUS9XtlQlKK3T638Ii2VhmOS1bLJUTF5aDT7CJcsH/oDuPEk4BDOgJlKxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Wq+cppgM; arc=fail smtp.client-ip=40.107.223.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xivsA8Mc0p3lMRUUiBJS7PgfLjbNo+V/ZC+vJXIqadJIrILZP3zg8hR+jCQvSjZTNY2NqIFXHQ05/THnlL1DuiHJKyQ8mBneJ0PoO+OAPgqbIBmatL8FyeunAJckef6es47ocuj5BAPmAqPo/7PEG+1DstOIaOouI5wg3F5Ve3QDMVBJ9Ne9fc7oBkjWLtT4Eg7dZfU18SXF2EjrLFEZ6JTZEy6NcZBFNHuohPH3kw3ruPEFNtc3RnElwf6Aj2SIC5EtaEeVxT7Il8SDVDkt6GCLjU9Rj66f0LCmVOWrfNdKeLMwiMaNzMoRgBJE143v0DLnwxN3mJcTRA3mUvgxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYxhXSxXdHc4LEY91uduQVBbyEsXu9ke475u6AbUPpM=;
 b=MfkWC+vQcFhMa32KV7wNXpYfdcEKV2XW/j5sCpCjXT2Oir6pUyUxo2zMJHTt+JIjwPTvH3UnGDKVAelRuPLJkLJeeTGP0XPL+xX/ooK5M23QaFA+xzGTR6gZbeAXIHW1bC4DnN2F+J3FtWtNcwNtOyv/xE/ykPsPGh+iOpFViz7pS3VwLoNL3mZ320Lz0p/r2pa0VXgxtaH8XI52Cfxw6kJTiFIF01ou/z8d6vpr1JluSVzw/GuP3e2NhehGNwsxzn73GO3afKddup5+FcrdnhFD06BwvVY+LKJnq1cx4oc0dXH/M9MYjBbK4xPu2I41W/yEReOgFfFCuznk5v6F4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYxhXSxXdHc4LEY91uduQVBbyEsXu9ke475u6AbUPpM=;
 b=Wq+cppgMqZfWyEUCku4QZdGePT1EBDNGYYWLPLsJAr6Zx+ugTXHxNq3wrJJqog/6+YQo+xsLzpUGbXYq6ir+Q3blg5N92T46o9QWZPu2GnNzRN0/UemypmGnRGm0pHXunpzIUKnRShrEpp4jaViVMb69xtgJ4wURccEGab7hzd3Q290UcsJNtVqC1hHXTlvU64ebahGunvvHgq+jZDZJ0Ga/89Gi5MxjQwER7efYXPUORhYndgjBKHFYDvUQLIxMP3taKpWcbLl9oq/4AFUjIC4KF9MtsG3NkEJvwSuzB7ZRakvTPrHmvIJRu0XQ+dwR2cDGY0SxKCSCSNgbizk4Ww==
Received: from BN9PR12MB5196.namprd12.prod.outlook.com (2603:10b6:408:11d::17)
 by PH7PR12MB6696.namprd12.prod.outlook.com (2603:10b6:510:1b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 17:56:40 +0000
Received: from BN9PR12MB5196.namprd12.prod.outlook.com
 ([fe80::6a:6f30:3c6c:43a8]) by BN9PR12MB5196.namprd12.prod.outlook.com
 ([fe80::6a:6f30:3c6c:43a8%6]) with mapi id 15.20.8158.017; Tue, 19 Nov 2024
 17:56:40 +0000
From: Chris Babroski <cbabroski@nvidia.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
	David Thompson <davthompson@nvidia.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] i2c-mlxbf: Add repeated start condition support
Thread-Topic: [PATCH v1] i2c-mlxbf: Add repeated start condition support
Thread-Index: AQHbOfAkVdP6S2B8kUKAddOBk1HLqbK+nssAgABCmAo=
Date: Tue, 19 Nov 2024 17:56:40 +0000
Message-ID:
 <BN9PR12MB5196995C8060A427C8174E33C6202@BN9PR12MB5196.namprd12.prod.outlook.com>
References: <20241118192833.346064-1-cbabroski@nvidia.com>
 <ji23yczfp75vtu7sp7pots66lr63mxbtkxea27lvc5id5tmfk3@pltlopcoz55c>
In-Reply-To: <ji23yczfp75vtu7sp7pots66lr63mxbtkxea27lvc5id5tmfk3@pltlopcoz55c>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5196:EE_|PH7PR12MB6696:EE_
x-ms-office365-filtering-correlation-id: 78580808-7146-4a20-f9cb-08dd08c3856b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?AHgMNPxAxpjh5+r4dG5QmFDBMCFNv2Wbac6NfXnSYfwHOXac9LPYqLz2bj?=
 =?iso-8859-1?Q?R/KNQl0gq+fSZusm5uCYfeTTcH2hhCDBfgqOj1nVX8a7S1+1QrLA7mt7je?=
 =?iso-8859-1?Q?qqNOy1DnceD1hZIZz0LJxEMTfhCsyKiIpz6G5IVTWbwwXaJs445TLtVuMV?=
 =?iso-8859-1?Q?+gUg9aTasxGicC1TBJzFANeTQtO322Nj8ayGYVeQ0Td1U5C7tVHdAbEnsx?=
 =?iso-8859-1?Q?GzU0K+JcpAwx/cIaFAFtqefxHl/gjbL+pXNlEJj2CqTimL+ywMemlCUvoP?=
 =?iso-8859-1?Q?svDHXaEgFBMCSLnWnUnV3yR+PMbjMPWhomnTFdzI2L25lExv4u4CVrOWII?=
 =?iso-8859-1?Q?9V/LuWNF21kcOV0j6ukihCVqpARUSCgubTGJchoq0Hq6fRTFUWBm5Ad7lW?=
 =?iso-8859-1?Q?ZYHULm5ooGGl4IYPvzTKpT3Xs9IfIqdgLZTWdq6ClGFjvfTGKUhMlt84sW?=
 =?iso-8859-1?Q?viu7bv/UddtfiyctZDKfOPdOaGq0qzcCOi6a6xMgsuYIvSDr5ExVntI3GR?=
 =?iso-8859-1?Q?Mc3CXQAjArcwvKvg6uzSW80FVNFn8uySwVTGL6JvE9DEexZDo8ILLcdqjT?=
 =?iso-8859-1?Q?bWzfDnKriaQmI/mJZ0SD9kEObeYN4Z4gLd2Q6+ZBZM5tciyGkITlEe4Zgw?=
 =?iso-8859-1?Q?J2Hxv7SY5TpQn7NDBYhL+UkBOsBKDsQACDjnjJRhD2/S+l4bUFw1zq90Xc?=
 =?iso-8859-1?Q?2BvKh/Epk48cOd47iz7LadHFNONuKZx0T10LYyBwIDkdyVHVu1ts/PeoUN?=
 =?iso-8859-1?Q?WXPE4p/YC82w11olI1g+TR05yKJKylir8K/zqZc/c2Q31XrQ3uS8R++DGz?=
 =?iso-8859-1?Q?phAFXM3TkzTrou198xdsDepNQ3Tq2gJfA986OUUoIDs0kAVRMPpRO/g2/F?=
 =?iso-8859-1?Q?jwC7NjUz8jriQLBEQM/dj7s7FsYcsbzbQyEGJUa2+pBOLuQUDcDo0WuxCp?=
 =?iso-8859-1?Q?elgPa1MVz6pdFfsqPkoiQ5g5rfYald8Kj9l25wDcRd/Vi5E8qxebgkV7Io?=
 =?iso-8859-1?Q?zHXpLCQMJ3uk1FzxEEiCwCsly/3Z39tm7H7sxvqPH+eU1yrxRGYh7yQkT5?=
 =?iso-8859-1?Q?uhyX4/C2NA7ArmfiYeGGbkUbT4lyUJaO7RSfbz1ASEqRC5frhZ9m5uSzYR?=
 =?iso-8859-1?Q?0XAw9nlDkTpGh1akAsXwgujO31Dyqx61FtL4USalg3B0VKJ304JMB3mtwi?=
 =?iso-8859-1?Q?26Yo5+Kl4DZ5TCooggPEG508ORIzoKY0n2SHlhJpK3L/Jt+GjYyJpHaimX?=
 =?iso-8859-1?Q?sX/k6JGPwrGvHlzcNDdy/jGp98QwyXp3vcBLxtYa/qU3rrzv3Tv9Gj5u+e?=
 =?iso-8859-1?Q?920VoCPao7hs+qVRXaXjD8D5AUJP2s8ZcAiWYRzikgXofVy1cc2DjrQ6m4?=
 =?iso-8859-1?Q?lNj2PBXFsHt4+3yVP7o2Bli56Q5mspi9EUDlGgMPtJVCJOLkvDhsc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5196.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yA6I19ktRwqbA3GDu57E7mxOBy1vOaZg8ctwPgraYhoim2y46V0CAgu+yL?=
 =?iso-8859-1?Q?XoOB4L0gaAdBbdne963OfKkIVMmtmCGfbsbZxiM56bANYwV8wntFTASw58?=
 =?iso-8859-1?Q?+iG01AoYHQ4r+C7bpY43fKD6T9TBum8jZEuo83aZIimdMxz2d1IRErhQQK?=
 =?iso-8859-1?Q?a1Y87H2MSuU6A7jwRcEzMYCodo41Ls0QHmUOnVjihqbCPvz0eYaBzvzX/L?=
 =?iso-8859-1?Q?v6kDbVsuN8aUcr6+0B5DDI0koe1L84NR+pb6zAjxMKBNKmJD2Qow8VjfJi?=
 =?iso-8859-1?Q?AUfXEqfJI98RBk8FpURI59stjJHoKMkb1V+8fYpIFbujg9JOqC67+RLZM6?=
 =?iso-8859-1?Q?4JmfWDiPyhazwMNxAXpC9XTrK+ZPWLgnZuHdzNBTMph78uv00DTJSEksue?=
 =?iso-8859-1?Q?/clK4qkCkT1RrV1VysZjbzrN8ygnWlDBi3h6w9E9TaElm694YQOaXdCyGh?=
 =?iso-8859-1?Q?OcKuoYOLO/GmibsACp8yDqWqaRu594/np9ve3GTT0v+HRbXC9h70UQmIt4?=
 =?iso-8859-1?Q?RF0hSXnOwoBYf+YfvKd/12W75x77LmOQnGe4RCWr8m0tQ5a/Pa7t98B5KR?=
 =?iso-8859-1?Q?Hfsc62d3AZ+0XdI2tOiamab92Mx8SrSkS3vN6xG1QyMjUR2Pfn2PtlXDP8?=
 =?iso-8859-1?Q?VomQIom+rrD/NL3vUmdyjRTzqHqmcp6cLK/oXTsQ83fXCURsVab6V6ywFt?=
 =?iso-8859-1?Q?WHR25IIj6MV5w9oaq6lXboFDFkA69mMSTSxhZ7aSL9HVlQ5+djBvJDaNhN?=
 =?iso-8859-1?Q?NOnce0gYmOtbKDqJ5BTDS6oLU+mA4cGHWpMMOli/euRrBhCxaUpw+pAJHA?=
 =?iso-8859-1?Q?tjauFs9MWnOL01YWkeQYB7wQhFKBoRVvzGVYP2kvGJcYedCCGw3Srb5ffL?=
 =?iso-8859-1?Q?G61hc3jydXCWbkF2aLKoTa4YiAM1++feTmWdHBWRj+clSX/m4gpMZfYcR5?=
 =?iso-8859-1?Q?QLAWDe+HiXTXTfSuTXkWeHR3lyZEBqZkSeXVTUyVwpBRcmJTM+sw/1L6tD?=
 =?iso-8859-1?Q?O25k2wle2A/P2aN3sQni+SiUb/2V/rmIEiTYcNpZIrjHUTtMQtRw1PN2uW?=
 =?iso-8859-1?Q?1Q5mKahlbbtiQ45CyGVatU0XOUKcJs0r2652j0w+ZF2K87vXyJhCPnKAIq?=
 =?iso-8859-1?Q?7V5MIaCa5HM7TJ8nnw6X02SUlrsbifXapAbOYm33OK23yqSgzjEUl0T/lM?=
 =?iso-8859-1?Q?tc20u3sfo5rV6Rx49skaOGisfbuh84Nv0lJ29/93bkWXvqTARUkVTLLPfq?=
 =?iso-8859-1?Q?CUl8SYMPahgtpkG7mMV+uyqm49bi44M4H7J05gmI5EJNYDowTC/Sp1u5qC?=
 =?iso-8859-1?Q?Y7EQ63buwaMf5tyoqyv0c9OMy976y3/yptzdI/eGE9NHtIU3GZtuA2vhjM?=
 =?iso-8859-1?Q?mHZAx7wC+OhUNLJpc+U6t4pl1OLJCLAqz3J0TTKEfOXXJeYutBGSwcxQ8n?=
 =?iso-8859-1?Q?6yHIuM2vO6vp3ECFy48BZgLgZjuhGTw4Ynp54r664NTRPzG5RJ3yuOP14/?=
 =?iso-8859-1?Q?ayySmyGfXWInIdhYa6KnmxYnqiIG7CfyVE7AafkkOUcQQzgg1MSqz+VbhK?=
 =?iso-8859-1?Q?d63g0CBhwm1sfuF3Zq47luvq0n6zNZyzqhvb+wckFldjcUzQeqm9bRXX00?=
 =?iso-8859-1?Q?Kk0fVQqU8guShAwzTM+fZSUav7kGX5eExS?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5196.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78580808-7146-4a20-f9cb-08dd08c3856b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 17:56:40.6390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1eYlT0qV7Qm0RsoYMx3Y9SzMXDWiX0G2uH9t4Eveoz1IHC1xP66BATMxs+hyvrKJ90p2Rv6DC389pTxaDKhsoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6696

Hi Andi,=0A=
=0A=
Apologies for any mistakes - it's my first time upstreaming.=0A=
=0A=
> Where did these reviews take place? How is it possible that this=0A=
> patch, at its v1, already has two reviews?=0A=
=0A=
Asmaa and Khalil reviewed the code internally, but I will=0A=
leave it to them to restate their reviews openly here instead.=0A=
=0A=
Moving forward we will exclude the Reviewed-by: tag=0A=
for initial patch versions.=0A=
=0A=
Thanks,=0A=
Chris=

