Return-Path: <linux-i2c+bounces-488-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5F77FB30F
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 08:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96989281E97
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 07:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7553A13FF8;
	Tue, 28 Nov 2023 07:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="hhYGeq2/";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="zRQclAeV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA856D45;
	Mon, 27 Nov 2023 23:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1701157509; x=1732693509;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=OkQEWBbcMaNuSpReYYCfMKscyM5KNTUlLZwO4KDvSLA=;
  b=hhYGeq2/FTZ1B7wGuqy9l+TgnXeHfncvS4i+HJhxH5ryDWxvP/nreCx3
   KYu+u2Y99T6FDAbHMW/nFei2hNa4at08tU9zRX+mki1EfRZTTr/jPQF/C
   3dnsoeBwQFWh1RMVHb5Qgo59QCqFQ+iqygn2x5b8yh8CruHqK7wBvjqpw
   ySLzsxlxLBtOn8t0T+qTTzbc2oHV4Vzf+/6gHFD0nv1U0QlG94Mnbmum7
   JWlDKhwgOkrMEGrebb9b5gbKdvKkcYRRiN+Yf4DSUPtieQfU3xHkerD6U
   Aa4jzzybM4lghI6yLMgk4ZNduxOqnWzvGsooRrYjCgTDn3btapjHllfK2
   Q==;
X-CSE-ConnectionGUID: cf8HFMLORVe/BDzFzuk8vA==
X-CSE-MsgGUID: apE95aVTQtqVxGzSFAeC9Q==
X-IronPort-AV: E=Sophos;i="6.04,233,1695657600"; 
   d="scan'208";a="3473500"
Received: from mail-dm6nam04lp2040.outbound.protection.outlook.com (HELO NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.40])
  by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2023 15:45:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFRq4uxPq1nEwPZB+4MpBTL/qVMVBPjLSWDn4aVafreRfURwxbPkj+VGymCVwH/egPonnuV9+3uG/oq16h4NN3rqckTHdwI5PEtboNFQSgeJP76NdV2ijFzhr61VkXUb8bHa2fL/kRRcI59pisUVNqC/INZclN09Jl2y1ckWoSemhRwq8LE8hmyOBUC+a9XVWfXMEwaSDkWw1e+ZRdcLTDmgV+uecn23NMkvR0sbjuSi8SuvyZMAkdgs7wcitkMlJZ5OwNWr3b1thvveBaFud44y+8w7SWWQBYT40icrc9RnNE9QuXeAq39SYbppgERyN1Q9o3p7uxMaYNwB9p5LYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/f60kmVcX/gsHnlz41NGwfEfiGuiBIRUluvMmGeZec=;
 b=S3yRhVmM6g3thrx40fSSRq8E+FaOD6wX3/WA5WtNpl/Zgmu+SavNK7m6Fk7mXa9mDVh25C9QSXaq2K/TSRukST0pKPSI6DjdwxTbRPEeVTPH/nTCHkf0nhW5qoW/0xvwyfOIOe7UfhjnixIlkwlEf5wdx3Tk2WAFO74tymWZOXqsAKVymTCDSsOwEs7+VI67j3BMFN5yYbjgW2WUOsWZyixhRtUvPJv0UCOu+JenZAfXs3quoj+6qSHWkCex+1mFUzU+wlidfPcw3zATn/4nsinv+eW8pvO+NGz8qJi4FV1ROC1L5HBOaJMmDpxdmZeN99C0BXeBI+5RyDnZaZHQMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/f60kmVcX/gsHnlz41NGwfEfiGuiBIRUluvMmGeZec=;
 b=zRQclAeV4iBvmVGVQ9buAbWkkGiUjFxzGMuUk3DKhXTmPpXLJOWtuxKipH6dsXjQoBsHR/9A+hOioXaNNzZl7CcjJp0l+ui4T6jF0ckKTzQV2qUykOamYWCyCSB/Xn2mDA1RYlcK2HGXvc0Pj7NjIoMaGBdRV/wiey+l8d/Equs=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 CO6PR04MB7634.namprd04.prod.outlook.com (2603:10b6:303:a7::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Tue, 28 Nov 2023 07:45:06 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 07:45:06 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Lukas Wunner <lukas@wunner.de>, Heiner Kallweit <hkallweit1@gmail.com>,
	Keith Busch <kbusch@kernel.org>, Wolfram Sang <wsa@kernel.org>, Jean Delvare
	<jdelvare@suse.de>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>
Subject: Re: [bug report] lockdep WARN at PCI device rescan
Thread-Topic: [bug report] lockdep WARN at PCI device rescan
Thread-Index:
 AQHaFsdpw8Adedg0CUyhPBScx+2k2LB5mcWAgAAIiICAABWaAIAAQPKAgAAEGACAAB3DgIAPP5sAgABMVoCABcllAA==
Date: Tue, 28 Nov 2023 07:45:06 +0000
Message-ID: <2vzf5sj76j3p747dfbhnusu5daxzog25io4s7d5uvzvtghvo24@567tghzifylu>
References: <6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j>
 <ZVNJCxh5vgj22SfQ@shikoro> <ea31480f-2887-41fe-a560-f4bb1103479e@gmail.com>
 <ZVNiUuyHaez8rwL-@smile.fi.intel.com> <20231114155701.GA27547@wunner.de>
 <ZVOcPOlkkBk3Xfm5@smile.fi.intel.com> <ZVO1M2289uvElgOi@smile.fi.intel.com>
 <eaawoi5jqrwnzq3scgltqxj47faywztn4lbpkz4haugxvgu5df@koy3qciquklu>
 <ZWC_0eG2UBMKAD3C@smile.fi.intel.com>
In-Reply-To: <ZWC_0eG2UBMKAD3C@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|CO6PR04MB7634:EE_
x-ms-office365-filtering-correlation-id: 9c94ea25-b9bf-42e0-d436-08dbefe5f069
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sFekQ3gopIUhMLLq//rHC6Fig50B1dDLRYVE18Vv0eYDK+XERr+WU6j2YI3YbKt0DvjABHPkjdgHWttGsrQBhz1l0WBjqLJO36uqeNoQOzoa4FH9ff2UklE8nnE7tVwArCtfJ4+RmfuwrkMdI/9byIoGY/ilJCXwoe1FOUs54nHPdmqD8/0UuhXvcBbi400OY4a+9OF+1TE5eA1yARWY5drJXnIwh7hEwWbQsOZmYjT4ea5zHCfgpjn3zSUNJ1IngLNogaAo3K0pwEJ+g67mIMO0Nfp1uSWZ43xayPQ6sgSI4fvv3dKaBzsTSNk3VccdUECd9YgO8Q8R/uoQ/iE4xiyAV143CRSZa4wIL58Tn8BTuXGGsbSTpZ5z20BQHFN0E+f/F9u0Ss1Zkfg4ztRqZh1bsHLZQrMwYnZPblnZLHVD+Fw5Y3/Kus2TaIEXCTAEGZs0Dxj7UWqhrbIudLNvu3qoX1N0U91GXvmRb7WXCbuUG6unY9F0EvK5yghmBCvjaQ1iIx5xC1pSKzWVf59RgIlJ7GD3zwNfJoNH14lVA8+CnbsPAn6mm77zHpb0Y1YANIlttUOsxBPGr3WNH+bpCsQEQ172L9pnOC8ibHLsIyCUFurxLiB/u2y8Rz2TUfAw
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(366004)(136003)(346002)(39860400002)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(2906002)(44832011)(91956017)(66476007)(66556008)(66946007)(64756008)(54906003)(6916009)(66446008)(316002)(9686003)(71200400001)(76116006)(6512007)(41300700001)(4326008)(8676002)(8936002)(5660300002)(478600001)(6486002)(6506007)(26005)(83380400001)(33716001)(38100700002)(86362001)(82960400001)(122000001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tqEklWHvEUcExSbvRK7EDIVwSUzLdjviLYBpSkchu+Ph+OgaTyOwl7OGMkXy?=
 =?us-ascii?Q?LK018JOTJqpZ49CjASszpyT5QtoSiVX2vPsamOqlx58sEGBEI8Xh8napKDGQ?=
 =?us-ascii?Q?JHVvc8HlLQ1jiKz37SqaCM/IuKC0BCeRyHGK0vlx+sv97APDa9+IfhTTtR5F?=
 =?us-ascii?Q?neeXPw8EhmGMJqd8Vl12/8nsT8BcpLTLBFB0aVEmTQ3XylTMmOTUjskdJrei?=
 =?us-ascii?Q?ezewdU5C7OmZfhRzAFcO5f6UF8yGrKLWbu2zQpgW1AgoORALoBN8huTgDfgj?=
 =?us-ascii?Q?MqbH4YPJ+0NdMSRpZzeI8BAu75fJb6ehspKDdEGEmQyr4dfdVPGQB939hFeG?=
 =?us-ascii?Q?IzKrEQG4XDsuZjETSvCWmQ9Z/+LzNCF7sVyF4XxbmDblA2FS2xUetWdoRK7v?=
 =?us-ascii?Q?dcSIWc04cUUdf9JXH0rIgqalOkXdLu3PBnh7IM6AENmnKnJg/OcvOBESIXhe?=
 =?us-ascii?Q?8s9agW0m8T0mZbJPSPso3EMxWkiTrHDRwXAE1fkLrn28/EdaNckJYYVsP+DI?=
 =?us-ascii?Q?83trNIWPNuJjjbco1FzCxSCltCcnRPw4lsMfz3MUrEzNKh4ZpmtKx9stFsaJ?=
 =?us-ascii?Q?4CzBlRP5Jv/Dqlju0J7EavNeFd0lG2SLqRtgVJYleqIhrFcbNdDR1PG0TM0r?=
 =?us-ascii?Q?1ehAV98Mrn/QtwWZyFseg0Zy2pAOA4Ro6HOd6dOhXclxQZBdZpKk63DCnFuQ?=
 =?us-ascii?Q?bJsvJ3vpvbA2pTIUFLxFHX8930i5G1lYlyURPQplg4Dec0tUfNyAFScCIFFz?=
 =?us-ascii?Q?nuGV1yzesjrUH8GmqGZ+jDkjAHKtOayiagRjDAqf0nKHiJ2xlztua9ArDJGS?=
 =?us-ascii?Q?xkZKHX9eLe3QJSco57v8CxMJ3EoRQkzFBhGTwqHTCbEpwvmSZkpZck2aERkb?=
 =?us-ascii?Q?vRXF/8EeR+3aL0iEqfBO5BtUEKwBKGhhgVBblH2GsIwgA+zG4Xxa8MiKP5QT?=
 =?us-ascii?Q?SWMmaZOdnEeAN+n8aPB4LoEm0M2eYuBv3DqsZkUGVJ0Qfh9bJGGUda0QKpof?=
 =?us-ascii?Q?ojDA5E+9ymus46Aea125lJ7g+E0PB3wurzoHyY0IBWjCiLZAJ63GLCmFv9RY?=
 =?us-ascii?Q?mo8oxH2He2HO0O1Axp4r1+lImI3JzxPsKVp2lgh5CtqbkZ4bQHEL3W1hTQpp?=
 =?us-ascii?Q?RQtI9L0ijXiQ98OnlGYo0V3ucdYSdoqKUMTWYJnXFRX+emfZk8W4Xgtbe6zB?=
 =?us-ascii?Q?lN98PLu1cjC2opNQ2vky38AfdH9U/AD/idiVtesNcFbR4wINi7jJc+cksZ0I?=
 =?us-ascii?Q?RoyBfurWM5Klj9VmGvLvEEytVsPaRcGUxoot2gfWH7JZtmbKbB7imosPxiSe?=
 =?us-ascii?Q?/3L1d56MFKm2oauiK+QA2Oe2zbJKY7KUPMCsEkLVGF29B4MrVsnyGhG8Yfc5?=
 =?us-ascii?Q?836J8cdewMiSEBUFg565g1Kd80BQN9YtSsq9yJnN3hwvYnl05UIMTBX0VHjM?=
 =?us-ascii?Q?vaRQez08ieZ4RWJGVSNPgRkLzqsan22I7nYL6w8AAqVsB9PrJJ0RP4aNCuJ7?=
 =?us-ascii?Q?ArtuHdsEj3eGl4qTuHBPxGmVDdmBkQv4Gp+8moF/EEEKNAap3ehO2/iu/GcN?=
 =?us-ascii?Q?Ci3cpyqqMz8//PmtMNlFY/CKcWN6K8ZI9aii6yBW6VvUq3GJ1MEOnENhnlfM?=
 =?us-ascii?Q?uLY7HEx9NuCMk04V4yAugxs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E156FC1C460D674EA420FA39686A2C8D@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?us-ascii?Q?6TKmiDsHLQml4Nel8xPJ+VnNNXP4fEsX08fNAqgYmQziPTjKKVFxTRYrTztM?=
 =?us-ascii?Q?VIj43Xg1Reaa80U3vQzGDZHjurDtsF6WvyhrkZYm4muBrGHs89lKT28Fyc6m?=
 =?us-ascii?Q?2fmXe83l8TvSL0fwH4UawsILrgjPWuarUhqUWrDBsbyfiyn+dRVgStJRVDe9?=
 =?us-ascii?Q?ftCRhoPN9CbXcPhudVX8pS3xG5A6WTssV/wItcXUNCUgKwEOp/o1GxbxSNIO?=
 =?us-ascii?Q?W0mT9BDHnihUoxXuE681jKueiUKOXaGOFJCp1ttn4Ka1p6SPdWoYZPcq2Hj6?=
 =?us-ascii?Q?+S+IFBm7t0Lf1KrPCD2I5IeXwE/OeN0RayXeguZE7ECPaWcVVAp4TrS1KX+b?=
 =?us-ascii?Q?h1HPsLtbPWxWzUoArmMYzZmNJQUsGC5CQCUy4QOSbOLrozLL/Son1lKUTcOM?=
 =?us-ascii?Q?EVc/2mIbB5ckMr2wUw4tfwsbv0mbPz1ca2sXDIS0NT+usT5/2ghxMFxN9u8j?=
 =?us-ascii?Q?4IhpZtD1bhDnjQd0z6DcDOMVeGpSYukvVnlok2xfEDwaLDwR1I6dijTBsdj2?=
 =?us-ascii?Q?QLfQjE3qxSF6q5GmQZWFQu5s7YR7w6Zv6M0Ihi295rRqzHc2L1OJmUO5w/bU?=
 =?us-ascii?Q?0Db8KaViAm2k62tlrNtR4p+7OkHCT3/SxqIW8ILbTAJwOpdLtQjjvu7D9+nJ?=
 =?us-ascii?Q?UaL4nkY79X2allRyAOuoKdZ0OX5RiBnY30aODyPjOQsYPGDv9+4nbc+wtr6d?=
 =?us-ascii?Q?r4vQeahGLADa7JGxk9y/VSpsmRG++QVyLunD4FLBqxRb5rQ+ygNtfQCIT+zn?=
 =?us-ascii?Q?6GdnQpLo//tzrqcg/88l1jNkWicV9tKcWpYgJX8yaoZAEV7ypQoO3pcArySu?=
 =?us-ascii?Q?/aJ7rxHiSyqoJYeRN/OLdlH6Bbaskq3yXZjuyHnit2NUBf/84JyYoWXrpGho?=
 =?us-ascii?Q?UyJXBUXmV9HgwSEj/JPWk1a9FxixJU4m+v1bNlUQEFXtZiFJlPtITfJBoPsV?=
 =?us-ascii?Q?hXmWcSjOGfVuSiF+8y65Qw=3D=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c94ea25-b9bf-42e0-d436-08dbefe5f069
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 07:45:06.2585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E0cgdaPfyoTa48JDx48/SCl2fYBs6sAtHCj6h3SEp2mZAVZVM4txLiIBQPs8i9p11oxv9TNt4gTXJc9owrwHc2mVC/sqpUCvDrEz9Pv/opA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7634

On Nov 24, 2023 / 17:22, Andy Shevchenko wrote:
> On Fri, Nov 24, 2023 at 10:49:45AM +0000, Shinichiro Kawasaki wrote:
> > On Nov 14, 2023 / 19:58, Andy Shevchenko wrote:
>=20
> ...
>=20
> > I created a patch below and confirmed it avoided the lockdep WARN. The
> > i2c-i801 probe was ok at system boot.
>=20
> Another possible solution I was thinking about is to have a local cache,
> so, make p2sb.c to be called just after PCI enumeration at boot time
> to cache the P2SB device's bar, and then cache the bar based on the devic=
e
> in question at the first call. Yet it may not remove all theoretical /
> possible scenarios with dead lock (taking into account hotpluggable
> devices), but won't fail the i801 driver in the above use case IIUC.

Thanks for the idea. I created an experimental patch below (it does not gua=
rd
list nor free the list elements, so it is incomplete). I confirmed that thi=
s
patch avoids the deadlock. So your idea looks working. I still observe the
deadlock WARN, but it looks better than the hang by the deadlock.

Having said that, Heiner says in another mail that "A solution has to suppo=
rt
pci drivers using p2sb_bar() in probe()". This idea does not fulfill it. Hm=
m.

diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index 1cf2471d54d..0e7057979a2 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -26,6 +26,15 @@ static const struct x86_cpu_id p2sb_cpu_ids[] =3D {
 	{}
 };
=20
+struct p2sb_res_cache {
+	struct list_head entry;
+	u32 bus_dev_id;
+	unsigned int devfn;
+	struct resource res;
+};
+
+static LIST_HEAD(p2sb_res_list);
+
 static int p2sb_get_devfn(unsigned int *devfn)
 {
 	unsigned int fn =3D P2SB_DEVFN_DEFAULT;
@@ -75,26 +84,8 @@ static int p2sb_scan_and_read(struct pci_bus *bus, unsig=
ned int devfn, struct re
 	return ret;
 }
=20
-/**
- * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
- * @bus: PCI bus to communicate with
- * @devfn: PCI slot and function to communicate with
- * @mem: memory resource to be filled in
- *
- * The BIOS prevents the P2SB device from being enumerated by the PCI
- * subsystem, so we need to unhide and hide it back to lookup the BAR.
- *
- * if @bus is NULL, the bus 0 in domain 0 will be used.
- * If @devfn is 0, it will be replaced by devfn of the P2SB device.
- *
- * Caller must provide a valid pointer to @mem.
- *
- * Locking is handled by pci_rescan_remove_lock mutex.
- *
- * Return:
- * 0 on success or appropriate errno value on error.
- */
-int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem=
)
+static int __p2sb_bar(struct pci_bus *bus, unsigned int devfn,
+		      struct resource *mem)
 {
 	struct pci_dev *pdev_p2sb;
 	unsigned int devfn_p2sb;
@@ -141,4 +132,54 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, =
struct resource *mem)
=20
 	return 0;
 }
+
+/**
+ * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
+ * @bus: PCI bus to communicate with
+ * @devfn: PCI slot and function to communicate with
+ * @mem: memory resource to be filled in
+ *
+ * The BIOS prevents the P2SB device from being enumerated by the PCI
+ * subsystem, so we need to unhide and hide it back to lookup the BAR.
+ *
+ * if @bus is NULL, the bus 0 in domain 0 will be used.
+ * If @devfn is 0, it will be replaced by devfn of the P2SB device.
+ *
+ * Caller must provide a valid pointer to @mem.
+ *
+ * Locking is handled by pci_rescan_remove_lock mutex.
+ *
+ * Return:
+ * 0 on success or appropriate errno value on error.
+ */
+int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem=
)
+{
+	int ret;
+	struct p2sb_res_cache *cache;
+	struct resource res;
+
+	list_for_each_entry(cache, &p2sb_res_list, entry) {
+		if (cache->bus_dev_id =3D=3D bus->dev.id &&
+		    cache->devfn =3D=3D devfn) {
+			memcpy(mem, &cache->res, sizeof(*mem));
+			return 0;
+		}
+	}
+
+	ret =3D __p2sb_bar(bus, devfn, &res);
+	if (ret)
+		return ret;
+
+	memcpy(mem, &res, sizeof(res));
+
+	cache =3D kmalloc(sizeof(*cache), GFP_KERNEL);
+	if (cache) {
+		cache->bus_dev_id =3D bus->dev.id;
+		cache->devfn =3D devfn;
+		memcpy(&cache->res, &res, sizeof(res));
+		list_add(&cache->entry, &p2sb_res_list);
+	}
+
+	return 0;
+}
 EXPORT_SYMBOL_GPL(p2sb_bar);=

