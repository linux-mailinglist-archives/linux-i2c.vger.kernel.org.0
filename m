Return-Path: <linux-i2c+bounces-1056-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA6F81FC61
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 02:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6519285F98
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 01:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEFD1388;
	Fri, 29 Dec 2023 01:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ldqqyWF3";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="cYeclCml"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0598D1369;
	Fri, 29 Dec 2023 01:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1703813933; x=1735349933;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ykjMaAVhqCbTZkfykg4YPDgNUKqsHaFQtMPmXRNICIw=;
  b=ldqqyWF301hGoncEad7Y/Dmc4LUBnkbGwraSscsQeLF4BIloacw+KP7U
   ag9qiGgPHBkCzVBhRkttwUl6g+Abb9JIQ6+tT0Touaj/PTS8Q8sYvtJ+C
   AJUI4NFo5vY1kI/JJ/6D//teih4bvus3vnxypw5Cw1DhuYLL4gl/dj+pt
   wv1wVKlntg36UZSgzve2j6H/D6vzQex0tueemNh8sPeGzF9gmsOqiWCDp
   PVfeDA9bHei2dWvbKsU4ug3AjOVxnmaXgqJOYvoB6fz/bQNNI7eR3+R7e
   unuuDmab0Cm0iEr+qB6MwD0BqAVekOt7z61BhVxYyHwFq4OONRRtAMIdU
   Q==;
X-CSE-ConnectionGUID: q17PsRzASVuq806sdezWfg==
X-CSE-MsgGUID: fEl/9z6jQ5iJe4q2FpviwA==
X-IronPort-AV: E=Sophos;i="6.04,313,1695657600"; 
   d="scan'208";a="5832350"
Received: from mail-bn8nam04lp2041.outbound.protection.outlook.com (HELO NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.41])
  by ob1.hgst.iphmx.com with ESMTP; 29 Dec 2023 09:38:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuoSgKa09KF+0KMixAibZrT28PSGhO+BIAKJ+ms+lhd5k8qyQm3U6KjY6y+Lq8dtao5ksEzluWLfEOGr+iyd0PtX92zzRa2NLxVJiPQrj9dj/2Hof//gYkrFm74ktt2Dzf7aZq4RNw1n1MybSmyzNi0XhxEhmdbLZIUDt/3SeHs+wdyYhXALArQfKpiKPc7UCONKphRVdLmJ/E8Tjfoj3mZ3pT3hOcNPuzULjmOESH7Enezf5ImqqsOnhNwmRQ9dRpFGhOwlmEzuleWaFJr3T4ZHNYJQaBliLTJtJ1jT0OEUq9xPXVmgNnq8Y/RtXoGTB+SYPDrZ1/h7a81Zwlelyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69uNbiTcXfxYEHZLTKe1R27vXb0OaFoaN7LeT0pL3NQ=;
 b=BiFN1Xqda6h/q7J2Ver8phB+0jnLRFSLR26ZBir9WZ/g2mCBsAy80K6/M1iutzIKF4lhD5A92aGzI8+0NObJxf216JIWkk1XY90j+6Tu1B1N6z/q83EBdcpTyR+9PrCjY1VNeenWSvGZMLGz0bSEdUnZ0fv2h0SMZ3Sprkiirh27iuLHfZqmq+RIdp7+uU/ejK5Taum8akVxLRwFDVIA52ygn1WDmh2TGhdw44wbfF02tOktBaBWh1mbTou5qbXIdtUgCmzGtNjE0wR7zblDg10QFWCit9biECTIONHOTm2TelGnDSBcqIO0Yab9lbFzliVCwZSaqNPRpi51U+EhRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69uNbiTcXfxYEHZLTKe1R27vXb0OaFoaN7LeT0pL3NQ=;
 b=cYeclCmloD6P4Y4AkNGn2HLOvSe1sjXx+GkhgK8n0xxeBwpZuBxT4BRSiQcTq7A4XQywQ6idAW/fgJFw2s5P9orcsdCzpncI+8ZF42DKllbcf+9TAFA1yFo21thFEGJswkQboRx/xJGrCVnTWRDvMwGBXd4Lk9RyoJbR/n4YVI8=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 BL3PR04MB8201.namprd04.prod.outlook.com (2603:10b6:208:348::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20; Fri, 29 Dec
 2023 01:38:44 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4%3]) with mapi id 15.20.7135.019; Fri, 29 Dec 2023
 01:38:43 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lukas Wunner
	<lukas@wunner.de>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Bjorn Helgaas
	<helgaas@kernel.org>
Subject: Re: [PATCH v4] platform/x86: p2sb: Allow p2sb_bar() calls during PCI
 device probe
Thread-Topic: [PATCH v4] platform/x86: p2sb: Allow p2sb_bar() calls during PCI
 device probe
Thread-Index: AQHaOJU8qBeE4n3dEEuOhLuVKqAsH7C9dPgAgAFkEACAAKVOgA==
Date: Fri, 29 Dec 2023 01:38:43 +0000
Message-ID: <vghlyyyyeke7rpll3ftk5bbrraxhjhbhkauhbyzjz3wvcm3h3u@cgqcfqri2gyw>
References: <20231227072049.2281764-1-shinichiro.kawasaki@wdc.com>
 <5e9040b-caba-463d-c260-a8425736438@linux.intel.com>
 <80daf8c4-d73a-3e6b-36bc-7e514bc38d1b@linux.intel.com>
In-Reply-To: <80daf8c4-d73a-3e6b-36bc-7e514bc38d1b@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|BL3PR04MB8201:EE_
x-ms-office365-filtering-correlation-id: 88fe87cc-1da4-45e8-a160-08dc080ee48a
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hFVjLEjP6cyIdGz+Zk5AmfvOMOY/8ry5Nv5DzznZFWkd13mWgz4Vq/vrHZECKAw8/SU0ZPG95Xd3cPjmhdd8pZrSF+WIvz4+u07TDhxdexFKvixGC5mBfOdYHw7iqRG5Tr7OUcHm5xByhEN7HYgolYi/Eoon8D/XOSlkj2ugL6m+/cJX33NxB/Vhyw0835IhR/B4ZrRgJ2IeqBXgULIuTuUhD4G/GfiRfC8aRXJhR0jCnjs5WYsDVpOq3iakzQEjIkTwe7Y3g5GUuEsIsbz/+CfIIDhNzSCtksG3Y39wWvi7XUxHmg0ETsukYHBAXdHhT3B8uQ42urLe6PJtiCN7dHGaJmOIF2OlX6sjps1mhxe3e6dMBTrm12D+YKEzPpe7ecuPWMDSPeieOeAHEyhFS20pI/0BcmlJGSxKXkNBLkN4dDuwwVxn9ImdNcyJfHiu1pOtOMJE4Z4IIAzVuEa3/QP4DohUpT12Xb6rwFD7Is3BYUQjlEsx2qdnAXbbuVhUdenU9O+7LezJBlOhoytx8n2a4nIfoGZIrllpcBMlTUavFRjc0fWyMeBpiGa0QOemO5HIeE4ZFB+zJUr3fgiXQl9QcD9nmm/6Ot65KdjbBUx3pZN7QpOfdu5xhLOhBR7kabWOTnDt10FHUpMH/HJHCA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(376002)(366004)(39860400002)(396003)(346002)(230922051799003)(230173577357003)(230273577357003)(186009)(1800799012)(64100799003)(451199024)(82960400001)(122000001)(41300700001)(83380400001)(38100700002)(33716001)(38070700009)(64756008)(76116006)(91956017)(66476007)(8936002)(8676002)(66446008)(6916009)(44832011)(66556008)(30864003)(5660300002)(316002)(54906003)(4326008)(6486002)(66946007)(86362001)(966005)(26005)(66574015)(71200400001)(6512007)(478600001)(6506007)(2906002)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CHpIz9/C+W7l7qgtFd5YGumze8XRThFE455/o3O4aJJK4yGfKpNizbn7Mj?=
 =?iso-8859-1?Q?BP4SCYra5EqxQjjz5fgpYXZRDYGmm0Pvbj0yI5u5GD2/BRD5U2bSNG54u+?=
 =?iso-8859-1?Q?sT2Yl9UdOa7rn/kQeHWDtbOBN0SA78OXs/5JZmSt92oqM3SOJdnmzutdaP?=
 =?iso-8859-1?Q?EjTlJLZWQ+A73oEBnX5co1MNXg2XDxgH6hTcFaTU2uXrwH6sTZRgSoJL2O?=
 =?iso-8859-1?Q?rPvVXo8Oqvy1Aqos2KWtpHUjNDC1hRv0aek/P933jzejmmOeNr/NcXcSSo?=
 =?iso-8859-1?Q?K7pz16xc+D2Nd8PFgaV4B8F6b5QtDfA0vN4+WpaUUHizNeWwb3gjp4k73A?=
 =?iso-8859-1?Q?b94X3qkKz5LLkb/Kiv0VD394T1R9RqM+ojhVSCDX3zMw9dky1/NSOHMcLl?=
 =?iso-8859-1?Q?sbhsaz1rPloxIz7Ie6lA9vRVbtgcXH4Klv0GJ2oUfI5ZZfeBEwmKHtQsGC?=
 =?iso-8859-1?Q?2xQp3BI+R2mi9UfvJLAgbkatQSgAmvWlImFFKAd0x2CGp2phWVUYpL9Ce8?=
 =?iso-8859-1?Q?K+LPS+0bj2FQeM8vusISiEbiUMjmkJBzbNRF4YbyL3OqPP52utv7PS8/yO?=
 =?iso-8859-1?Q?OxZ7x5n4++vexIrW6a9pesjpREjQhjs02J+nDhYvAM8khOqt4UxvWmXJLQ?=
 =?iso-8859-1?Q?PuQl2KPf17oKIrErEuLQo68nRWmTAdmqCmuiOiexdE+D+mc8rJwC9bRlhC?=
 =?iso-8859-1?Q?4DxEJ99p0pCVeKusgyCxY2gd+GovqNF81qRu0gQDk6HDj+2HFOGbRZZuoR?=
 =?iso-8859-1?Q?hRxxg7bPjgYTFe2gaKxMcNRXpTK2cnDbUDuOYvsHw8KCpjpkmkTtq+KXK9?=
 =?iso-8859-1?Q?kgMYgTceIsUrk3cDa+fcq351s0YPLBp1v41nIBxeYdNTTDilpgWMC0PQg6?=
 =?iso-8859-1?Q?LLxLQVwVMMgvX4Wk56lsYmhK5oopJ4vPVgRlwclkuXIAzdZ0R43AjsoDQw?=
 =?iso-8859-1?Q?F5EJnE6I67DeH38zVQDZtD6UPfRUAakGu+jNdt7BRlISFoQasqh4S6lHQW?=
 =?iso-8859-1?Q?ZtinxBr0V1V9fut+Kw0nFxCLFJMW/JRNFt00YU98QDJ4svlyKRgulFEzPr?=
 =?iso-8859-1?Q?S4bL7YJtH9b1749GXVC/l1KbFP5zmf1Inryw3DwV7xR2E8DKHA6Dn596xG?=
 =?iso-8859-1?Q?VxcNlcphexAjUN3Ih6xQk/VVmfo4nYEuSLmcKKXor2E7vQ1JCUJ0PHvI5O?=
 =?iso-8859-1?Q?barApDdETw+ysJ1okZS9lcJhU2iWd1L3ULsXuCCob0xOSjlrIPMhg5l3TB?=
 =?iso-8859-1?Q?P8UWGsBHta8Mr1GWc4Z2ujVx+ivxC1dVawiCSNI7VjiLP7BAaYT7FdQyTT?=
 =?iso-8859-1?Q?x7/Iz0g6gSgFjwtutcibfiXL+LcTPPOEQzLUvdQo7KOUKy30nNzLVtu2Qi?=
 =?iso-8859-1?Q?VOBOdB8vmTtZE4XwdIQVagCjArcdFcz053yJ7CPBIE3jSf5JZLuJ0/Zu6n?=
 =?iso-8859-1?Q?Axpe3OLUpcNjoCLhiJMbx3BT8xO+f+JCbPXtw+tz73p0YLpcBgnUshhgjg?=
 =?iso-8859-1?Q?Ui6/2paIOnnIczmxUoy72SRaEpf6zFuR7Sart2wWmDqLGmShW0/xX6F+n9?=
 =?iso-8859-1?Q?6ajx2i2KjiKlAEat10wDwrjFJ0xtCekzDL9vK8TsaHcXhOHp3+vh8Kz7OV?=
 =?iso-8859-1?Q?hBR+BEdwAyPDOngRU2cf/R0U1vVBrXD5rvOtuTiOJj9rG/xdhkFc85/deg?=
 =?iso-8859-1?Q?VyoO9348NnZbcwAuVv0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <EDA13913FD3CBF448D4CCDA69C3618CA@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1r+dCO4sZmvxXdcm4Ooz/FcqMX2AaUUf6Rb3SsJuEAqiQ7MhgIgGRdnOYUVOYyXbk/FgtCZH+KHAz9+1VEpVt5TGBjkKT0P3QWgjMVHN2AGsmmLCoRdT8VL592+nS/l9h6T7N7btArWyPj6OhrruPQIShV/Fb/RO7+X5MPVnBt/yUzxD7PaKk6y4mImrT8VsPihyD7z43Pbt/q/LOwRfGROghXY+C1VzL2tpDmVajktN2eJniMHFeeA7hg68qcfJgba8VJSEswPE0VD+C4J8HueEytXEjqqoS74mIA1bXkWvYmxXS9kUCT1CEKsvbf9P9/UAeFzCZAi9F4ViKNqNHHdbY8Dn497YeukKx38ssYKWxSljthXY6nNuarmjzQM5rFyM/wgEglHJU4vaMCOL4vh/fnYrqbU0AcpiFUmo/mmC9cd+DpvnPBJuJUd+R/eDX8hAguzKWjbZ1ew2CiCgkHoS/A/b8TKSx0NoxH6QF+Qz55WPVTxiopkg9a08Ud0iAKQ3ts7oN2ltwZS02/ZBtQkROHRgv+2NrJh4lvxZCoAKwalmYkPULE22Nw1cfYlixx9pzf1qnH7UFDsCKdb0SlS41GwjtaJ9ytfSdtfd92iXX07fs5tWJV3gsjcJWeq6
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fe87cc-1da4-45e8-a160-08dc080ee48a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2023 01:38:43.6053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hy62fv7AL1OnfA+HJ0oNmFGC0Zayu34YYxWOMC2TJietkpZedStd++WFQk2e48LPtRZeWKGg+uLgvuk5HLNlNHsPGEeaizYn5vqe6Dlp9Fg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR04MB8201

On Dec 28, 2023 / 17:47, Ilpo J=E4rvinen wrote:
> On Wed, 27 Dec 2023, Ilpo J=E4rvinen wrote:
>=20
> > On Wed, 27 Dec 2023, Shin'ichiro Kawasaki wrote:
> >=20
> > > p2sb_bar() unhides P2SB device to get resources from the device. It
> > > guards the operation by locking pci_rescan_remove_lock so that parall=
el
> > > rescans do not find the P2SB device. However, this lock causes deadlo=
ck
> > > when PCI bus rescan is triggered by /sys/bus/pci/rescan. The rescan
> > > locks pci_rescan_remove_lock and probes PCI devices. When PCI devices
> > > call p2sb_bar() during probe, it locks pci_rescan_remove_lock again.
> > > Hence the deadlock.
> > >=20
> > > To avoid the deadlock, do not lock pci_rescan_remove_lock in p2sb_bar=
().
> > > Instead, do the lock at fs_initcall. Introduce p2sb_cache_resources()
> > > for fs_initcall which gets and caches the P2SB resources. At p2sb_bar=
(),
> > > refer the cache and return to the caller.
> > >=20
> > > Link: https://lore.kernel.org/linux-pci/6xb24fjmptxxn5js2fjrrddjae6tw=
ex5bjaftwqsuawuqqqydx@7cl3uik5ef6j/
> > > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> > > ---
> > > This patch reflects discussions held at the Link tag. I confirmed thi=
s patch
> > > fixes the problem using a system with i2c_i801 device, building i2c_i=
801
> > > module as both built-in and loadable. Reviews will be appreicated.
> >=20
> > Why no Fixes tag?

I should have added that. Will add it. I think the commit for the Fixes tag=
 is:

    9745fb07474f ("platform/x86/intel: Add Primary to Sideband (P2SB) bridg=
e support")

> >=20
> > > Changes from v3:
> > > * Modified p2sb_valid_resource() to return boolean
> > >=20
> > > Changes from v2:
> > > * Improved p2sb_scan_and_cache() and p2sb_scan_and_cache_devfn()
> > > * Reflected other review comments by Andy
> > >=20
> > > Changes from v1:
> > > * Reflected review comments by Andy
> > > * Removed RFC prefix
> > >=20
> > > Changes from RFC v2:
> > > * Reflected review comments on the list
> > >=20
> > > Changes from RFC v1:
> > > * Fixed a build warning poitned out in llvm list by kernel test robot
> > >=20
> > >  drivers/platform/x86/p2sb.c | 171 +++++++++++++++++++++++++++-------=
--
> > >  1 file changed, 129 insertions(+), 42 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.=
c
> > > index 1cf2471d54dd..ccebfd885718 100644
> > > --- a/drivers/platform/x86/p2sb.c
> > > +++ b/drivers/platform/x86/p2sb.c
> > > @@ -26,6 +26,19 @@ static const struct x86_cpu_id p2sb_cpu_ids[] =3D =
{
> > >  	{}
> > >  };
> > > =20
> > > +/*
> > > + * Cache BAR0 of P2SB device functions 0 to 7.
> > > + * TODO: Move this definition to pci.h together with same other defi=
nitions.
> >=20
> > "with same other definitions" sounds very odd and I don't understand wh=
at=20
> > you're trying to say here.

I see, I will elaborate it as follows in the next post.

* TODO: The constant 8 is the number of functions that PCI specification
*       defines. Same definitions exist tree-wide. Unify this definition an=
d
*       the other definitions then move to include/uapi/linux/pci.h.

> >=20
> > > + */
> > > +#define NR_P2SB_RES_CACHE 8
> > > +
> > > +struct p2sb_res_cache {
> > > +	u32 bus_dev_id;
> > > +	struct resource res;
> > > +};
> > > +
> > > +static struct p2sb_res_cache p2sb_resources[NR_P2SB_RES_CACHE];
> > > +
> > >  static int p2sb_get_devfn(unsigned int *devfn)
> > >  {
> > >  	unsigned int fn =3D P2SB_DEVFN_DEFAULT;
> > > @@ -39,10 +52,18 @@ static int p2sb_get_devfn(unsigned int *devfn)
> > >  	return 0;
> > >  }
> > > =20
> > > +static bool p2sb_valid_resource(struct resource *res)
> > > +{
> > > +	if (res->flags)
> > > +		return true;
> > > +
> > > +	return false;
> > > +}
> > > +
> > >  /* Copy resource from the first BAR of the device in question */
> > > -static int p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem=
)
> > > +static void p2sb_read_bar0(struct pci_dev *pdev, struct resource *me=
m)
> > >  {
> > > -	struct resource *bar0 =3D &pdev->resource[0];
> > > +	struct resource *bar0 =3D pci_resource_n(pdev, 0);
> >=20
> > This change is just cleanup and belongs IMO to own patch. (It's a good=
=20
> > change still, just doesn't belong to this fix.)

I see. I will drop the hunk above from this patch, and will add a following
patch dedicated for it.

> >=20
> > >  	/* Make sure we have no dangling pointers in the output */
> > >  	memset(mem, 0, sizeof(*mem));
> > > @@ -56,47 +77,64 @@ static int p2sb_read_bar0(struct pci_dev *pdev, s=
truct resource *mem)
> > >  	mem->end =3D bar0->end;
> > >  	mem->flags =3D bar0->flags;
> > >  	mem->desc =3D bar0->desc;
> > > -
> > > -	return 0;
> > >  }
> > > =20
> > > -static int p2sb_scan_and_read(struct pci_bus *bus, unsigned int devf=
n, struct resource *mem)
> > > +static void p2sb_scan_and_cache_devfn(struct pci_bus *bus, unsigned =
int devfn)
> > >  {
> > > +	struct p2sb_res_cache *cache =3D &p2sb_resources[PCI_FUNC(devfn)];
> > >  	struct pci_dev *pdev;
> > > -	int ret;
> > > =20
> > >  	pdev =3D pci_scan_single_device(bus, devfn);
> > >  	if (!pdev)
> > > -		return -ENODEV;
> > > +		return;
> > > =20
> > > -	ret =3D p2sb_read_bar0(pdev, mem);
> > > +	p2sb_read_bar0(pdev, &cache->res);
> > > +	cache->bus_dev_id =3D bus->dev.id;
> > > =20
> > >  	pci_stop_and_remove_bus_device(pdev);
> > > -	return ret;
> > > +	return;
> > >  }
> > > =20
> > > -/**
> > > - * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
> > > - * @bus: PCI bus to communicate with
> > > - * @devfn: PCI slot and function to communicate with
> > > - * @mem: memory resource to be filled in
> > > - *
> > > - * The BIOS prevents the P2SB device from being enumerated by the PC=
I
> > > - * subsystem, so we need to unhide and hide it back to lookup the BA=
R.
> > > - *
> > > - * if @bus is NULL, the bus 0 in domain 0 will be used.
> > > - * If @devfn is 0, it will be replaced by devfn of the P2SB device.
> > > - *
> > > - * Caller must provide a valid pointer to @mem.
> > > - *
> > > - * Locking is handled by pci_rescan_remove_lock mutex.
> > > - *
> > > - * Return:
> > > - * 0 on success or appropriate errno value on error.
> > > - */
> > > -int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resourc=
e *mem)
> > > +static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int dev=
fn)
> > > +{
> > > +	unsigned int slot, fn;
> > > +
> > > +	if (PCI_FUNC(devfn) =3D=3D 0) {
> > > +		/*
> > > +		 * When function number of the P2SB device is zero, scan it and
> > > +		 * other function numbers, and if devices are available, cache
> > > +		 * their BAR0s.
> > > +		 */
> > > +		slot =3D PCI_SLOT(devfn);
> > > +		for (fn =3D 0; fn < NR_P2SB_RES_CACHE; fn++)
> > > +			p2sb_scan_and_cache_devfn(bus, PCI_DEVFN(slot, fn));
> > > +	} else {
> > > +		/* Scan the P2SB device and cache its BAR0 */
> > > +		p2sb_scan_and_cache_devfn(bus, devfn);
> > > +	}
> > > +
> > > +	if (!p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)].res))
> > > +		return -ENOENT;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static struct pci_bus *p2sb_get_bus(struct pci_bus *bus)
> > > +{
> > > +	static struct pci_bus *p2sb_bus;
> > > +
> > > +	bus =3D bus ?: p2sb_bus;
> > > +	if (bus)
> > > +		return bus;
> > > +
> > > +	/* Assume P2SB is on the bus 0 in domain 0 */
> > > +	p2sb_bus =3D pci_find_bus(0, 0);
> > > +	return p2sb_bus;
> > > +}
> > > +
> > > +static int p2sb_cache_resources(void)
> > >  {
> > > -	struct pci_dev *pdev_p2sb;
> > > +	struct pci_bus *bus;
> > >  	unsigned int devfn_p2sb;
> > >  	u32 value =3D P2SBC_HIDE;
> > >  	int ret;
> > > @@ -106,8 +144,9 @@ int p2sb_bar(struct pci_bus *bus, unsigned int de=
vfn, struct resource *mem)
> > >  	if (ret)
> > >  		return ret;
> > > =20
> > > -	/* if @bus is NULL, use bus 0 in domain 0 */
> > > -	bus =3D bus ?: pci_find_bus(0, 0);
> > > +	bus =3D p2sb_get_bus(NULL);
> > > +	if (!bus)
> > > +		return -ENODEV;
> > > =20
> > >  	/*
> > >  	 * Prevent concurrent PCI bus scan from seeing the P2SB device and
> > > @@ -115,17 +154,16 @@ int p2sb_bar(struct pci_bus *bus, unsigned int =
devfn, struct resource *mem)
> > >  	 */
> > >  	pci_lock_rescan_remove();
> > > =20
> > > -	/* Unhide the P2SB device, if needed */
> > > +	/*
> > > +	 * The BIOS prevents the P2SB device from being enumerated by the P=
CI
> > > +	 * subsystem, so we need to unhide and hide it back to lookup the B=
AR.
> > > +	 * Unhide the P2SB device here, if needed.
> > > +	 */
> > >  	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
> > >  	if (value & P2SBC_HIDE)
> > >  		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
> > > =20
> > > -	pdev_p2sb =3D pci_scan_single_device(bus, devfn_p2sb);
> > > -	if (devfn)
> > > -		ret =3D p2sb_scan_and_read(bus, devfn, mem);
> > > -	else
> > > -		ret =3D p2sb_read_bar0(pdev_p2sb, mem);
> > > -	pci_stop_and_remove_bus_device(pdev_p2sb);
> > > +	ret =3D p2sb_scan_and_cache(bus, devfn_p2sb);
> > > =20
> > >  	/* Hide the P2SB device, if it was hidden */
> > >  	if (value & P2SBC_HIDE)
> > > @@ -133,12 +171,61 @@ int p2sb_bar(struct pci_bus *bus, unsigned int =
devfn, struct resource *mem)
> > > =20
> > >  	pci_unlock_rescan_remove();
> > > =20
> > > -	if (ret)
> > > -		return ret;
> > > +	return ret;
> > > +}
> > > +
> > > +/**
> > > + * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
> > > + * @bus: PCI bus to communicate with
> > > + * @devfn: PCI slot and function to communicate with
> > > + * @mem: memory resource to be filled in
> > > + *
> > > + * If @bus is NULL, the bus 0 in domain 0 will be used.
> > > + * If @devfn is 0, it will be replaced by devfn of the P2SB device.
> > > + *
> > > + * Caller must provide a valid pointer to @mem.
> > > + *
> > > + * Return:
> > > + * 0 on success or appropriate errno value on error.
> > > + */
> > > +int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resourc=
e *mem)
> > > +{
> > > +	struct p2sb_res_cache *cache;
> > > +	int ret;
> > > =20
> > > -	if (mem->flags =3D=3D 0)
> > > +	bus =3D p2sb_get_bus(bus);
> > > +	if (!bus)
> > >  		return -ENODEV;
> > > =20
> > > +	if (!devfn) {
> > > +		ret =3D p2sb_get_devfn(&devfn);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	cache =3D &p2sb_resources[PCI_FUNC(devfn)];
> > > +	if (cache->bus_dev_id !=3D bus->dev.id)
> > > +		return -ENODEV;
> > > +
> > > +	if (!p2sb_valid_resource(&cache->res))
> > > +		return -ENOENT;
> > > +
> > > +	memcpy(mem, &cache->res, sizeof(*mem));
> > >  	return 0;
> > >  }
> > >  EXPORT_SYMBOL_GPL(p2sb_bar);
> > > +
> > > +static int __init p2sb_fs_init(void)
> > > +{
> > > +	p2sb_cache_resources();
> > > +	return 0;
> > > +}
> > > +
> > > +/*
> > > + * pci_rescan_remove_lock avoids access to unhidden P2SB devices, bu=
t it causes
> > > + * deadlock with sysfs pci bus rescan.
> >=20
> > Does this actually tell how situation was before this change? If so, it=
=20
> > should be either removed or reworded to something that says "x cannot b=
e=20
> > used to do y because of z".

I will rephrase the sentence as follows.

 * pci_rescan_remove_lock to avoid access to unhidden P2SB devices can
 * not be locked in sysfs pci bus rescan path because of deadlock.

> >=20
> > > To avoid the deadlock, access to P2SB
> > > + * devices at an early step in kernel initialization and cache requi=
red
> > > + * resources. This should happen after subsys_initcall which initial=
izes PCI
> > > + * subsystem and before device_initcall which requires P2SB resource=
s.
> > > + */
> > > +fs_initcall(p2sb_fs_init);
> > >=20
> >=20
> >=20
>=20
> I've applied this into review-ilpo branch with a Fixes tag but without=20
> any changes to the code. Please do consider my feedback though to see if=
=20
> they comments would need to be improved.

Thanks for the comments. Will reflect them to v5.

