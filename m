Return-Path: <linux-i2c+bounces-1129-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68770824F9B
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 09:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3C991F23960
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 08:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D1020B3C;
	Fri,  5 Jan 2024 08:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="nKJF3REK";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="qPeeXQEc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF8220B29;
	Fri,  5 Jan 2024 08:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1704442756; x=1735978756;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YZKx09vFVi1wJWSjbGrvAPemLzRqZ67SDkcW358L5rs=;
  b=nKJF3REKJQN5yRVib9NuhdITewTZ5C+fcRs92YkZOmrXIE2HcJ5Dsp7V
   vgRPbELTzWUA/Hka0ewi9Z8PVZXNJKxBeNY+9qlOYIFFSwpHiumcAYn5e
   y+FHNBNoP0trZlSIaGCC+WbKz0dLksXn20cBi7knuk5EmiuHinDcFXvRV
   Fu/vNhZpLoBON8NlcZoIn2WvNMwThV84uJWRoSZ1BGnnmcL9QPKMZtxHH
   bJdJUVs6UA6gjYoTPc4GTqCy6zuvjHcKyHB9woEO/pw4kDgHLMi79qX3a
   Qh/1V3YBij6y7IoH7QUHwc9DiGe7vtrAOagMIBX9bkhNu91TRRGHtd27J
   g==;
X-CSE-ConnectionGUID: KDQSGNw3RLCoHQ2O5TNPyg==
X-CSE-MsgGUID: MxKslL/ZSXuzT5OwmccXBQ==
X-IronPort-AV: E=Sophos;i="6.04,333,1695657600"; 
   d="scan'208";a="6009184"
Received: from mail-mw2nam04lp2169.outbound.protection.outlook.com (HELO NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.169])
  by ob1.hgst.iphmx.com with ESMTP; 05 Jan 2024 16:18:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVTBl1OliofHhla3jYLEltGKByGrfiF4PeNpN9G2DHXTIyP5D8R2m8iVIdqViv+5EGVRlY2/OePv4BFSUKDb8NK35hrnlVQs+QZwQlkwxN5i9d10BEYo42Gf+K0HdGsarceiZxsR1/b4p8nHxIzPHTYJka6TsmlSiYbh8+RsJF3I8YRJtw8xFLIxj/yM4hdBFn97WTdnCgaHQCDvMkWqnebDiTb159Vft0ZDyTa1DDuBS5n2BRIXNRW5a9Degh5nOU3L8Qnqh5du8tdCu7mcofZfxJv9E43C5UT8U0ZX590+dwp1rYcuq3mmHDNFUfNsmiOV7Vugi/Wp3OlQsxtptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewFqNkt8jyH1NwObpe87/mpFPfjfdM3Ou0PRYrVCdwo=;
 b=LRsc3jyfpCf9mztNWbaPfmiWM9mLJgyIf1QA8XJ02wcLdVDT5C9uWUC4LUJciLwHz0xe+7tq5Pi77HVJfOsCX4C0AVaLSw7B71DVCZ6lew7d0hsIYiSnDUOspTQvUlJDwDgZs+ShQj7U3Bh+/kinis7J+vq/Uv5BD0VeZGzoFIcNIOjkD4HyqJcNNayyMI36bPILfW5xHihg+SDRQyeV3Hd0IhLzY+m2g+dYWt6nvXrwuGL/tjUQDXBfVwlVzg0cljqcGZlTfSCfJRDait5LB/EuG1q+Bo5B2Xxj4n0QvHU1xU93KryHAsyMYvmJKkcs2akQv3X4nP7b9KZdbnNsmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewFqNkt8jyH1NwObpe87/mpFPfjfdM3Ou0PRYrVCdwo=;
 b=qPeeXQEcNkbkba1njZWhk0PASNUuo1kdLe0SwrcOsPvz1ft3FXf4D/zGG4a89Ow+To7/AMMS2okpi8ippKA+P3WeLzfdIM5LShXugn++pgstR5F+IrjQiKbeo/QCFZVOO4SOVKsz2gr7TpF4Nt6dxkGMf/KfIJIal8mEPCsABHc=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 SA3PR04MB8769.namprd04.prod.outlook.com (2603:10b6:806:2f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14; Fri, 5 Jan
 2024 08:18:05 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4%3]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 08:18:05 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Lukas Wunner <lukas@wunner.de>
CC: Klara Modin <klarasmodin@gmail.com>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "hdegoede@redhat.com"
	<hdegoede@redhat.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v5 1/2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Thread-Topic: [PATCH v5 1/2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Thread-Index: AQHaPow80BKhEPvQJ0yVwJLvsqPQE7DJVoSAgABBoYCAAUomAA==
Date: Fri, 5 Jan 2024 08:18:05 +0000
Message-ID: <b565j7nbqu67pjhjw6ei7i3nkazazirl4dyxhaem3z7ghii3gs@dngmvjcylrjp>
References:
 <CABq1_vjfyp_B-f4LAL6pg394bP6nDFyvg110TOLHHb0x4aCPeg@mail.gmail.com>
 <oe4cs5ptinmmdaxv6xa524whc7bppfqa7ern5jzc3aca5nffpm@xbmv34mjjxvv>
 <20240104123621.GA4876@wunner.de>
In-Reply-To: <20240104123621.GA4876@wunner.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|SA3PR04MB8769:EE_
x-ms-office365-filtering-correlation-id: 9a75013d-0106-4bf1-79d3-08dc0dc6d7c0
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 t3MUbDyI/FnBSc/Ecn9H7Vq3AnmAr3N+w39mX4c1XiCTYcCXbo/YllNh0Y/g8jaZ9Cl95MM7v6CnI67cCXZ/MdLlHLi7Mtu+KVgFwsa5DnZCUO5XKL/YvOevsZwQBt8sJ49yRBxREcM3VImnCvU1Xl4q/hCqnx2Q6KGfL6zFAiriB5N9tCu2ZswKGvujObYvSn8S8IhIs2Yylag5h+YTAPTLjGe4i8HyoqEKsqc3ED4HGJSZ1x7H6ggQw+Npi7/uKvlnsCdlaSv8CuL0ZRAwadpIB6nc+OfSXIDVFQ8fO64ofUz2jeznkKX0RBacJ1jXMDnDkF7uGbZosUDqUxyMpOSwdkq/7Lf/5Gb+skN4acqdTnhWzd/FGCMO4fK5vP3fL3c/9J+Sln3x0eWUrdKfL8FZhHXLmexrU5gmio5+TFOtDNnY7MmAfarCGRYnTggAf5/Th0MgULqMb+YMOc3drt9Sy99Voo5SIBH75ugmvNQ7AEzAKHZy7VyrDf4UQ4XYclFwNjVa72ZSvyL4GJDPbJCw8K5DF2WpLeKmG+7ww2RQbQrTpeucrN3eyfl/khnlBnQ8NBPEhHaiQKq6Y7qzre9Ly/mgLfhpJA5ayoTYK1kTZQoN2unhJx7qHXM0SYK563qYR3u8qb394dYhSBzboA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(376002)(366004)(136003)(346002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(6486002)(9686003)(6512007)(8676002)(478600001)(71200400001)(6506007)(91956017)(66476007)(6916009)(76116006)(54906003)(66556008)(8936002)(66946007)(316002)(64756008)(66446008)(4326008)(122000001)(26005)(44832011)(83380400001)(2906002)(5660300002)(41300700001)(33716001)(38100700002)(38070700009)(82960400001)(86362001)(27256008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PTfWKLAIr1pIAq/OezImL9DwXXJqJNj9B3tbbM30QjYnCs5OT2AKvJ8zKE0N?=
 =?us-ascii?Q?DpqghBZ49EyUnfXrA1YDzhyX7WYnuSqx3ep5dRQja1LUxOYVVtNvgTcWHlNo?=
 =?us-ascii?Q?bvTLS/b9yHF7i/cUjvzu/QyNOOR2qPXIyq2dR+hAI4Yta/Zhie/dCqsYBCO6?=
 =?us-ascii?Q?q2uvjxsUz8Dc5btkrH0B1wzEBwVJhKyR02bptFdnsYnhxHanSAkrEX0q0U+n?=
 =?us-ascii?Q?ilsRYU3X9wy4A7xgMbm5SnbyoiHgqBrOtb+bl42I39SmcMfheMF7ViVGKXKK?=
 =?us-ascii?Q?LcYeiWcUa2gac2dPb86Z8qzhykpflB1En66s6yomdrt2J8NVv5fj2Rgzlrzv?=
 =?us-ascii?Q?PIEmQRGIA1H1Vpivoel9FU4bDg3UjxBNDJmSjmfo31tl+4XIZNteZ5iY0aL5?=
 =?us-ascii?Q?Wv4ajo5USKVarEwHK5BL47PZGVWYn9sEm5+QNHQdwl1E8IBJwmMA2mDRtVLW?=
 =?us-ascii?Q?kuO/kHsM3NJaEfhRdGTYQqUGTqHDIFiTuc6JAlqYWRLaIZIBjkOKGoRkurqV?=
 =?us-ascii?Q?Na+YUn+i7VaiEFOkGW/+pwjA2Ftpb7VpSro97ABc8+FemYSpaSxygsdlQGCs?=
 =?us-ascii?Q?5EowEsxhi8+tZFHXIryUo5EY4LNBV1WiZzs9LGpej6LlmMLj+M6ar9xpcBR1?=
 =?us-ascii?Q?VylIEXpivNchzGqehbELjUo8cmoQWCa6nvFJC8xGEAaG4oUZP8U0WSo0eiDT?=
 =?us-ascii?Q?AniR0kcKMVr9xNTXBfXFH3qdWgengVv3rEzZOEFefG1q/lmxtnCRd4vf10nb?=
 =?us-ascii?Q?VjlB8CxXvOWX348p3Gja76q9rdskgBWcqVtHOOD+bMJGkYzQkTXVThPjVJFY?=
 =?us-ascii?Q?Cmg4Kh2qP5itYBsR+DFV9dLXpl3+ewS8VA6fsH9daTG9JC4j8/YPBWCvIPbx?=
 =?us-ascii?Q?K/tk6trI39qQWbwYb9U8Qamoj1ry2BY/lbzYmiFS5n8L0dnrjEgKcCp7HuDI?=
 =?us-ascii?Q?MAC1k3kXm7elN/LpbaNZAiYKEd20CO7w0ogSuPgQFkuREGiDdtUjqeu7spMR?=
 =?us-ascii?Q?mjCxYN/V1Pflv3YkAvXGthmAZDRvf+KzsbKUEcAX+13P+M1rJuq46r3SJu+4?=
 =?us-ascii?Q?RUNl7LXjqt7iCT4slitEekreJ0t/0GjEm2tIcrxHUOlLPAcfo83uA3DV0Vys?=
 =?us-ascii?Q?KuAhvseqKCNWGaM9lkQPUj4bIylo4DyoVdmckRenNN0Khi7QgQ0gx7XD62W0?=
 =?us-ascii?Q?eQg1dh7u+fn5EDGTcyJW7OTfNvjY6T+VTrNDFgfEnvhoGGOgjqr7LjfUH5Oc?=
 =?us-ascii?Q?HfWJvG2Sir38eMoa7K/TIkmW1EPWfGBxAaWoNSiSqrXoLS7OAtVPoNFUFdHA?=
 =?us-ascii?Q?6Gjxe6wpLTVg2bwqHjAgP0mzM/GbZyDT4a7J3UgtJ9lulOgCuR9groflXVSx?=
 =?us-ascii?Q?N0/oWn1kG1OYt40S1SXjJEmnCdlcFEqs42yC2i/d2S/6IHLYEsQ/ZoL9SR9e?=
 =?us-ascii?Q?wA7KJEOxs1porrJ4XnJADxqGatjOrT7Qsn3OUfVL9BvyvbSE7ApZVDIvNtJ9?=
 =?us-ascii?Q?SRA2ETYa28jX5pZ2UIbbP9R8uw9Fiwb/e423Rs9ATix3Dr77WJHHS3yufEt+?=
 =?us-ascii?Q?Z4msRZceI86E7qE7cx0jlIZqRBMVfks64h02l3VXnnODnneQPG7BMt/HAagN?=
 =?us-ascii?Q?g2yDds3oZv2teMEHtAp/dZg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4CAADD94BAEFD34A82AD5C60AEF4F286@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uWLuVV05bwSXThaqFf8D+Y3s7ftU46QclRZpvdvg1lHStPZdzvTxiUavPJjMvTjwxEDEh32Sacu/Bl8g0BfMv6tQva9cvkTRHJgnhUvYaENUU353mYouOMpuKc8MEWP5NixTs7/HpfGfrTvUGeoEsse+Qo9ssny1pTyKDoCIO5T3iy/bsZiKq6mhBCbMTiwXftle8agADvVkRnpj27cxrCytUAO/e4ijCeXbOetc6OgUEq+z+effYyO6ozlMePZvt1DWfjXx0CtK/x379qfFDgYdZ5O/FTkhVg/bed8OJ289abaPZJmDQHIXnwADEZHob2l0FWsoDs0bjkSQg2fzcpVHWM8lqV1Gv7tcT4BVKS5E6W8soHNKYY4cyYTCEB2EGLJFZ3NtFowuzG2pgwVxHLgrmDB4uM4fNzaA0RuB4B1pKMVid4ij9L0SFqlYt6J2CC+KtVb653lToQSHH3nrjkmS5mBwDCwCXCcopZFgmz8Nv2Vz4s/DTxuDCndOd1HSZqP/TNtFWQWTJ9ohXumtaQS2u9/8ZiLlKuoLk28ecerqOhRYlHaAZ1zTOxxcPPrpvIv+aOEtvW9rhVtEeKhgYgtrur9NLTQjhHRMxyL142yy/1icm7FPIe6g/beXDRpf
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a75013d-0106-4bf1-79d3-08dc0dc6d7c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2024 08:18:05.3995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S1zZ/5w48SGTxDwiSG5q0XhLENU8LXUtEBIAPcXuam98rYH53HcrIXoUAjPRON1n6S5tQnaaAU49Qmgw4JIr0RGNDBjHcZpXxAaJ9AzY0/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR04MB8769

On Jan 04, 2024 / 13:36, Lukas Wunner wrote:
> On Thu, Jan 04, 2024 at 08:41:28AM +0000, Shinichiro Kawasaki wrote:
> > My mere idea was to just blacklist Intel CPUs with family !=3D 6.
>=20
> The P2SB device has Vendor ID 0x8086, Device ID 0xc5c5, so just match
> for that?  The IDE controller in question has [8086:244b].  Class codes
> also differ, so that would be another suitable method for differentiation=
.

Lukas,

Thank you for the idea. I refereed ICH/PCH documents and found that Device =
IDs
of IDE controller and P2SB at DEVFN(31,1) are different depending on ICH/PC=
H
version. It looks troublesome to list them all. On the other hand, class co=
de of
P2SB looks same across PCH versions: 58000h is the class code. So I think a=
nd
hope that the class code check will be the best solution. If anyone in Inte=
l can
confirm that all P2SB devices have the same class code, it will be great.

Klara,

Thank you very much for confirming that p2sb_bar() is not called on your sy=
stem.
As the next step, I would like to try out the solution idea by Lukas. Could=
 you
apply the patch below on top of the kernel v6.7-rc8 and see if the IDE
controller detection failure is resolved?


diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index fcf1ce8bbdc5..e82ab2ddd74b 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -26,6 +26,8 @@ static const struct x86_cpu_id p2sb_cpu_ids[] =3D {
 	{}
 };
=20
+#define P2SB_CLASS_CODE		0x58000
+
 /*
  * Cache BAR0 of P2SB device functions 0 to 7.
  * TODO: The constant 8 is the number of functions that PCI specification
@@ -136,9 +138,10 @@ static struct pci_bus *p2sb_get_bus(struct pci_bus *bu=
s)
=20
 static int p2sb_cache_resources(void)
 {
-	struct pci_bus *bus;
 	unsigned int devfn_p2sb;
 	u32 value =3D P2SBC_HIDE;
+	struct pci_bus *bus;
+	u32 class;
 	int ret;
=20
 	/* Get devfn for P2SB device itself */
@@ -150,6 +153,14 @@ static int p2sb_cache_resources(void)
 	if (!bus)
 		return -ENODEV;
=20
+	/*
+	 * When a device with same devfn exists and it is not P2SB, do not
+	 * touch it.
+	 */
+	pci_bus_read_config_dword(bus, devfn_p2sb, PCI_CLASS_REVISION, &class);
+	if (!PCI_POSSIBLE_ERROR(class) && class >> 8 !=3D P2SB_CLASS_CODE)
+		return -ENODEV;
+
 	/*
 	 * Prevent concurrent PCI bus scan from seeing the P2SB device and
 	 * removing via sysfs while it is temporarily exposed.



