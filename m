Return-Path: <linux-i2c+bounces-506-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8309C7FB6F0
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 11:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37DA3282B25
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 10:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C19B4D5B8;
	Tue, 28 Nov 2023 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="kIfbISXL";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="K20+2tN1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB768E6;
	Tue, 28 Nov 2023 02:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1701166593; x=1732702593;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Cc3JaVX9L5oC6OieSV9giFKqd7Cr6UloCRt2GZvJ4vo=;
  b=kIfbISXLLNNfKNT5IVj2pgr5WeoZknVBRX6Ww8pHP8Z5XFrdcURDAAcY
   iNQCUL6mpSGwyn5NPsBpEvHCzJ49wVQHQ3HvSfLc2oqQ0V7PcRnj5PPb4
   rpcNky4Dq2mN5gSRIQmIlfCami9leH78WfCTQ0J5hAfeGOT2u3fl3EYcU
   /zx8mlSwqhK8x1LrhzEAnGrjGQMadE6qvKSY/oWJePDb5n4sI/5HVQqb8
   lCCo8CArh9SZre5fV3WQzoXni1fFRTM366Gx4w1656HWe/Y/UzBagr0LW
   3oBfSrynz6Tna/YWY7U8m1Uw/NFesPnD+bQtT0UiWMQpq3l9Bqo54NWtG
   Q==;
X-CSE-ConnectionGUID: /6l7X2jtR26kADl0JIuXww==
X-CSE-MsgGUID: GeI9wA5cQD2BfWggKGI99Q==
X-IronPort-AV: E=Sophos;i="6.04,233,1695657600"; 
   d="scan'208";a="3466216"
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
  by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2023 18:16:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gggfOMLwKTGzCXHaqN/P90XeYpot13z+0G+6i+fF5kO1pSIRrz6+yf5wPIi+CW/5IKRWy+8I1QKO2Kz14Xy8+6h8cCdokvJ+6jCUWZfbFY/b5PTqdxanXXLC5EQkRg/2cCMIt/FRZMgseXMklO58WQMTg6hGpYebOoZlKcoB93G3WAAtMQMRN1BTH2yhXMt7wtjIxsuI0FDAc4KgsJpUN42rdtIbCd0w3vqSB95mKuITb5TzcpoO5DJ2O+WnXtyI8FdNFhnl+DCgatOKMW98Csu/1FTnsmh7PkM0CnHQbobgEHH9oYiyNHKjXP5DwNxy9eWl5jFuBjgGlA0jxX4/Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flKwdBbkZQrFzFKHG2b9rYaiIM3I+BySPfcVSMP5wd8=;
 b=TfAqvwjLm5rWxRgcOp0EzByMZASOl7Ht3UhVfI+2X1K4enOz8nqAMOgDO6num+eT2nJdLrvZRY//Ay9M2onzr9F5SJSypgZCw1GlC0NSAUkAAQJysFwJTGkK1HSnrHkQfa4mtI8URNGyuRJDYYKgOpbIsA2Be7IE1QUjSeZVDXsznEHxqSLEWtze7DCWLWhSreBukb8M8vEYVbZJwcssRz7kKyEnuDVOBlTAigLPh21loebHCqIAgY65qs/4korvUHrofH9D4ZNaCfgO7KIPX4SMeS9AQ1jp34fBjyM5PxSFPTc/H0AIvrWJ9+0PcG4CUPHs8IzKUKZI67spy3oRZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flKwdBbkZQrFzFKHG2b9rYaiIM3I+BySPfcVSMP5wd8=;
 b=K20+2tN1z3PANzFn/8AYPz7frNMJGmr76djmiegP5Awdxrobk8k9w8dwNMEdYuOql95kQN3BZD9owqzIzudms0hIfvf22qWT3Z5G6u+de+XdOzK0Ei/cC5HCnmhCZvsvJmHX4arGlm3mKGYEAox35GF0iULDnzRUHJeBhl+Y9qY=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 BY5PR04MB6614.namprd04.prod.outlook.com (2603:10b6:a03:1d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 10:16:29 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 10:16:28 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lukas Wunner
	<lukas@wunner.de>, Keith Busch <kbusch@kernel.org>, Wolfram Sang
	<wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>
Subject: Re: [bug report] lockdep WARN at PCI device rescan
Thread-Topic: [bug report] lockdep WARN at PCI device rescan
Thread-Index:
 AQHaFsdpw8Adedg0CUyhPBScx+2k2LB5mcWAgAAIiICAABWaAIAAQPKAgAAEGACAAB3DgIAPP5sAgABv2gCABdAtgA==
Date: Tue, 28 Nov 2023 10:16:28 +0000
Message-ID: <l34l5gd6ann3wajjs7nruwlthjugyg4fawtw3cwellfilevrc2@xjxzr3zejfit>
References: <6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j>
 <ZVNJCxh5vgj22SfQ@shikoro> <ea31480f-2887-41fe-a560-f4bb1103479e@gmail.com>
 <ZVNiUuyHaez8rwL-@smile.fi.intel.com> <20231114155701.GA27547@wunner.de>
 <ZVOcPOlkkBk3Xfm5@smile.fi.intel.com> <ZVO1M2289uvElgOi@smile.fi.intel.com>
 <eaawoi5jqrwnzq3scgltqxj47faywztn4lbpkz4haugxvgu5df@koy3qciquklu>
 <c85f2d02-d862-4431-a210-79c13efd163c@gmail.com>
In-Reply-To: <c85f2d02-d862-4431-a210-79c13efd163c@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|BY5PR04MB6614:EE_
x-ms-office365-filtering-correlation-id: dc84b2e2-9b64-413f-a98b-08dbeffb15f3
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8nyAK2VPqUmRZY7gKeGx5ca5NkWY8mYV8VdAfpqeykYaZDkcv5qvU4E+66gUuA1B75DQw0WMKdZsne1TTM8d2DZnGTFPg60EFF98R8Y1YJ2VpAyhAErzpW7G1hQrNK5x9k0zQ0sGpfbJdWhYXfDM3PfRtA2Hksmsu4n3ZbDg6OIOZqZ9edT2Dsm0JAY8YH3hNBazd8HQ33Nz3N2qbSGS2EXAkewkI3V+227LaQ1oq9njj2KZTm2G5C9ijerT044Az150bLkrxNFRVtDmmsxhDDKPYUQdluI9zUXcqyJavmDHbr3jKOL/ZAwXprSj+6lkezhgPwBAv1rYTp5TQOw+yBQKhcpYa0CVfpG/hrRSqfvXAXK8Csn/SkGm4bfoqxAnnvpba5FfU9tQLT1G8V4EmIhAyDxggDUFljW7cDcyihPRaIsr1wgSKnnTIsEmG/x03mbKyQH58LRHZTPMQ9D/aSzJYWZyQOqGqXkIcEDRWbxfbCGqzclFaSHS66t4bc/Csdvkg4Sgy754wMHRMcExeh37nS7t8PuNqwiSQ/yMWCQSP28/8bncTttoqZa03XIABzNgUwakEP5v/Q+E5QftjF5G23WKTN+npblSHT+/8+s5k8Gm0dCn2KPKE3jUXtoL
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(366004)(376002)(39860400002)(346002)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(38100700002)(33716001)(38070700009)(82960400001)(122000001)(86362001)(53546011)(9686003)(6512007)(6486002)(71200400001)(6506007)(478600001)(44832011)(4326008)(8936002)(8676002)(5660300002)(91956017)(66476007)(66446008)(64756008)(54906003)(76116006)(66556008)(6916009)(66946007)(316002)(41300700001)(2906002)(26005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/apIdNJs2qeJjT4S79Xf5dF4bDky/rNYCXk9nty17oFPHzzpOG7DBS4UFJnB?=
 =?us-ascii?Q?pyTEfkbNwh4afk5+hoMDBpZG0UdSfD1DUTrVUIZWE9dKmaAH/VEacbtvuMtV?=
 =?us-ascii?Q?2uZTy+8yAB54NU6BkKT9FSpSRTKq6jRe+8u8UJoheN4mkU7n4UkPKhFRyY/p?=
 =?us-ascii?Q?fd8jA4e+2pcvGj5VPnYuCk41iI+DVBFqqK1BoNoa9Kaj5XhJob6WLaf1l4/u?=
 =?us-ascii?Q?WegRk3ECuTu8zfQ/GS+Y/dm+d47OR6nzaquEs4TRhiDx/sG//EHaDfBQricI?=
 =?us-ascii?Q?jA4i3yfoQAa9maV4onQ2R2+LnK/puVakOXJizA+S8Te7l08hFlygQ9qxeoMD?=
 =?us-ascii?Q?Mewmq2ZQEK/d9pyN37wsleYwjTXYEHUVRLPdyzCidv9GnsPDi9kQni0dIGit?=
 =?us-ascii?Q?KZwWJjqbxSKlzWac7Ae5CqITBzW5ZeClyUHPhbklYGSvplU+s0RvPqdmNL+B?=
 =?us-ascii?Q?XzqLNzz6ML37Cba6V8znfKHYhsHXdtBPSO3Wdft0WcEi3bkYKw7vkCqpmmpE?=
 =?us-ascii?Q?scKj+txcMG1FVzSFCD1j+E8XxsttzdaE/AkDrMua3X8rvxpdobX8lzgGKNjo?=
 =?us-ascii?Q?BDEG5HS0l1IFG3X/89l/Wl9o8SJiQ5XJ5wNN9UsSSgL3ygBcy7pss2t5sxa6?=
 =?us-ascii?Q?LZXhKZ/+W9F1IndSPyLjeGJilRA0STei17bYHwFFR1KIhmT/YjqUMU/LRHxF?=
 =?us-ascii?Q?aB587ZVYuO6pmaGCL3jsOPdRayjP7tTsgCw7CQQCqOgabnZNY5Gk7YjD3WTz?=
 =?us-ascii?Q?aOO58Hb8aPv1fAo1K0JG73m85qHtL2NJFMZDKfiyGx21KB/s5U6iW/riqLgs?=
 =?us-ascii?Q?zcVHIrNcZ0SA6BN3eFPT6eMWpUXwtZstGuwf2CvFPYdfCZlJa/QA9HZG6clK?=
 =?us-ascii?Q?+il3RdAlkQ4BpIM4PnNsJzizobywqRIc2khLoPp9+fDv57/JsPRzPjLJantG?=
 =?us-ascii?Q?MZvyqJVEcCZoMtoFce3rlZmtGlbN2/Iizni35/vL/bytQIG5L6klRSLJmVVS?=
 =?us-ascii?Q?7qoa6qNtKw27MHVya5cEGUMgJocraAMzYsTRdk/g5428IS0EJ1epmdX9nZQ6?=
 =?us-ascii?Q?iiJ3t2LHN+i4zNIWzX8BmlxFGAFj8ooZwDKx/UXsD396e+JweV9xlqYfUtoH?=
 =?us-ascii?Q?FLNc1KdS6I8irxr9r8EADb2HYU+O5wOyBhLo8aGZ2J2q0gLFf8Y6Nuo/BLAq?=
 =?us-ascii?Q?Xm2Gpr6z9TcVnBBkdN6cJSEKph0ZdXwsZKPARCO9ajlaml3DvmBN/6CMNiUg?=
 =?us-ascii?Q?ggwyZsznRird3/tUxDhF6CHZfzF8yKu2CeW+Ut0WJa1HtEtoXdODhhsN1tWG?=
 =?us-ascii?Q?G836XZOmNcEP2f5WJeJJ/4R3U4b5xc0Pdc8z2Hf49CbZygZfIj9TrOAEIK2g?=
 =?us-ascii?Q?9Bnj7DOQod1eJ+i37uAGmoHbWrYhMKGwFswmreokRDE/2vJcPM6CyQu7/c8s?=
 =?us-ascii?Q?7mkFzf1/FDldyOjCqhhVQXJxtCpoYSg5xox4EUCu6X4jnFQBvyvapxhgsn9x?=
 =?us-ascii?Q?imuPZC6GDaB/1OOfulIJamMynxoQUr5LePNERSLS5YXHBPSr/f1SSHOBST2D?=
 =?us-ascii?Q?00X3DFKO5Umcnid8aPJV9VzMpsa81zfGcpn/v4LT6SsJpYQSnB+O/5iCPTu5?=
 =?us-ascii?Q?KrLWmUJudOeEktP2i5uZjXw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2DD0FA14F8E6734CB71F3D9A8472CC67@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?us-ascii?Q?czfCl93TjLxeK6ydqKiJzIWDifCP2FgDs40zUx/R6tkWpyLqjo3rhHoZaDxh?=
 =?us-ascii?Q?xoUZyfAV/i9W5gmQRrj9Qb6eWw13w8CD1yuRN18KRko6nUW6316T0CSScJpO?=
 =?us-ascii?Q?g6w1d0lyin+LY3CPttqNIThmM+5Ds55QqmIJXAR8vu1LTe1WAXk2pFGCsWdg?=
 =?us-ascii?Q?BOVUw2iZu6UsSoDLmQCa+ATTB0yTF3C0696uAbpjmKamdLy/+xkaZdfVeIwc?=
 =?us-ascii?Q?hb/xb4z684HBeC6d/Vx/BAq8yqEO/rNTv+UYUc1DnW7gFiv40dVgZ2Mg1vpJ?=
 =?us-ascii?Q?zqnHRJILSZnjzwJ997lZNrhs24p4TuYuMNT1qfxcPxM7yl22zlbi71LxhIiz?=
 =?us-ascii?Q?i0FXtL+8D3oVvmu8yrF9wpwRsbwsc19l6AvakpJ5G2YgL/ao9h9awqakChsX?=
 =?us-ascii?Q?b7V8/PqscUke4ZdKJbYUADj/dln/PcLOBmd7JyOYzlowzv0Hcwhcaa13VEzW?=
 =?us-ascii?Q?fT+xlKRNqTUtJvE9QoaK5gVrvFEEkOJSjN0CdI/A1k3j8/6/l5U11CVrY04y?=
 =?us-ascii?Q?ttSIicHIVP3jxQnVP8A4hiNNj1T00xUVe6kqZKU0Q2J6rleNCtAt7rAgkjpy?=
 =?us-ascii?Q?nycZDent6n5PIt4rI1mhYvwXTcd3N+DoOb7AvG0A7x1wXy6xl7onsqUH4pQB?=
 =?us-ascii?Q?9p1akaORRBwc9DuyZoBdEtdNv6JrCxUihGaMIw+7dYzfVQn1nsK0PDLXL6rc?=
 =?us-ascii?Q?5/QVUuoOT//QrU3EBpUUwbaS5/HcXWXWQV2UvWjqFVMShE7hBl1r8UhqDNym?=
 =?us-ascii?Q?Qw9OEld18gBUYatJD4o9pTk2RQ+1m/XgghkJbaRrWiOpiJToS/Eh5VmkiSza?=
 =?us-ascii?Q?JUcWqpi1m9RkNuy+fTjgAkX+MRi5ZPWqLbG5nYuP9/QDNaT+7uAoQUffRWJR?=
 =?us-ascii?Q?DcxvlUxp9YykcVNynpU/XjPuZhzuXe3gysGGHSfM57PSeJYwN5akMitMjRO+?=
 =?us-ascii?Q?g7JOjyGkqJuh94QcRl7qWw=3D=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc84b2e2-9b64-413f-a98b-08dbeffb15f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 10:16:28.7121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sCefDFX4pFztNnhe6yrEmZ/HXK17t/SLl5w/LutYAMvWcBUp88RLgPKdFLU1U0XLJN5fNkXosXKrTp60lK0Z4iT7+WTwHGKtDSPDUzDQeGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6614

On Nov 24, 2023 / 18:30, Heiner Kallweit wrote:
> On 24.11.2023 11:49, Shinichiro Kawasaki wrote:
[...]
> > I came across another fix idea: assuming the guard by pci_rescan_remove=
_lock is
> > required in p2sb_bar(), how about to do trylock? If the mutex can not b=
e locked,
> > make the p2sb_bar() call fail. This way, we can avoid the deadlock betw=
een
> > pci_rescan_remove_lock and workqueue completion.
> >=20
> > I created a patch below and confirmed it avoided the lockdep WARN. The =
i2c-i801
> > probe was ok at system boot. When I did the two commands above, I obser=
ved the
> > i2c-i801 device probe failed due to trylock failure. But I think it's f=
ar better
> > than hang.
> >=20
>=20
> I wouldn't call this a solution. A solution has to support pci drivers us=
ing
> p2sb_bar() in probe(). You can't simply make them fail.

I see... it looks a bit tough to find out the good solution, but let me try=
 some
more.

Here are my three observations:

A) pci drivers should be able to call p2sb_bar() in probe() without failure=
.
B) when /sys/bus/pci/rescan is written, pci_rescan_remove_lock is locked th=
en
   probe() is called.
C) p2sb_bar() locks pci_rescan_remove_lock.

These results in the deadlock. To avoid the deadlock, one of the three need=
s
to change. A) is not to change. I guess changing B) will be too much. So, I
would like to question if we can change C).

Can we remove pci_rescan_remove_lock in p2sb_bar()? Maybe no. As its inline
comment says, p2sb_bar() locks pci_rescan_remove_lock to guard the section =
which
unhides and hides the P2SB device from parallel scan. We can't simply remov=
e it.

Or, can we replace pci_rescan_remove_lock with other lock? For example, wha=
t if
we have locks for each pci_bus which serialize scans for each pci_bus? Is i=
t
enough to guard the P2SB device? (Or is it just a stupid idea?)

As a trial, I created a patch below. I confirmed it avoids the deadlock and=
 the
lockdep WARN. But it has impacts on PCI sub-system, and I'm not sure if it
really hides the P2SB device. May ask comments on it?


diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index ed6b7f48736..6995d66fb36 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -562,6 +562,7 @@ static struct pci_bus *pci_alloc_bus(struct pci_bus *pa=
rent)
 	if (parent)
 		b->domain_nr =3D parent->domain_nr;
 #endif
+	mutex_init(&b->scan_lock);
 	return b;
 }
=20
@@ -2417,6 +2418,18 @@ bool pci_bus_read_dev_vendor_id(struct pci_bus *bus,=
 int devfn, u32 *l,
 }
 EXPORT_SYMBOL(pci_bus_read_dev_vendor_id);
=20
+void pci_lock_bus_scan(struct pci_bus *bus)
+{
+	mutex_lock(&bus->scan_lock);
+}
+EXPORT_SYMBOL_GPL(pci_lock_bus_scan);
+
+void pci_unlock_bus_scan(struct pci_bus *bus)
+{
+	mutex_unlock(&bus->scan_lock);
+}
+EXPORT_SYMBOL_GPL(pci_unlock_bus_scan);
+
 /*
  * Read the config data for a PCI device, sanity-check it,
  * and fill in the dev structure.
@@ -2584,26 +2597,45 @@ void pci_device_add(struct pci_dev *dev, struct pci=
_bus *bus)
 	WARN_ON(ret < 0);
 }
=20
-struct pci_dev *pci_scan_single_device(struct pci_bus *bus, int devfn)
+struct pci_dev *do_pci_scan_single_device(struct pci_bus *bus, int devfn,
+					  bool to_lock)
 {
 	struct pci_dev *dev;
=20
+	if (to_lock)
+		pci_lock_bus_scan(bus);
+
 	dev =3D pci_get_slot(bus, devfn);
 	if (dev) {
 		pci_dev_put(dev);
-		return dev;
+		goto out;
 	}
=20
 	dev =3D pci_scan_device(bus, devfn);
 	if (!dev)
-		return NULL;
+		goto out;
=20
 	pci_device_add(dev, bus);
=20
+out:
+	if (to_lock)
+		pci_unlock_bus_scan(bus);
 	return dev;
 }
+
+struct pci_dev *pci_scan_single_device(struct pci_bus *bus, int devfn)
+{
+	return do_pci_scan_single_device(bus, devfn, true);
+}
 EXPORT_SYMBOL(pci_scan_single_device);
=20
+struct pci_dev *pci_scan_single_device_under_lock(struct pci_bus *bus,
+						  int devfn)
+{
+	return do_pci_scan_single_device(bus, devfn, false);
+}
+EXPORT_SYMBOL(pci_scan_single_device_under_lock);
+
 static int next_ari_fn(struct pci_bus *bus, struct pci_dev *dev, int fn)
 {
 	int pos;
diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index 1cf2471d54d..0073ef1a9a5 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -65,7 +65,7 @@ static int p2sb_scan_and_read(struct pci_bus *bus, unsign=
ed int devfn, struct re
 	struct pci_dev *pdev;
 	int ret;
=20
-	pdev =3D pci_scan_single_device(bus, devfn);
+	pdev =3D pci_scan_single_device_under_lock(bus, devfn);
 	if (!pdev)
 		return -ENODEV;
=20
@@ -89,7 +89,7 @@ static int p2sb_scan_and_read(struct pci_bus *bus, unsign=
ed int devfn, struct re
  *
  * Caller must provide a valid pointer to @mem.
  *
- * Locking is handled by pci_rescan_remove_lock mutex.
+ * Locking is handled by bus scan lock.
  *
  * Return:
  * 0 on success or appropriate errno value on error.
@@ -113,14 +113,14 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn,=
 struct resource *mem)
 	 * Prevent concurrent PCI bus scan from seeing the P2SB device and
 	 * removing via sysfs while it is temporarily exposed.
 	 */
-	pci_lock_rescan_remove();
+	pci_lock_bus_scan(bus);
=20
 	/* Unhide the P2SB device, if needed */
 	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
 	if (value & P2SBC_HIDE)
 		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
=20
-	pdev_p2sb =3D pci_scan_single_device(bus, devfn_p2sb);
+	pdev_p2sb =3D pci_scan_single_device_under_lock(bus, devfn_p2sb);
 	if (devfn)
 		ret =3D p2sb_scan_and_read(bus, devfn, mem);
 	else
@@ -131,7 +131,7 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, s=
truct resource *mem)
 	if (value & P2SBC_HIDE)
 		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
=20
-	pci_unlock_rescan_remove();
+	pci_unlock_bus_scan(bus);
=20
 	if (ret)
 		return ret;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 60ca768bc86..096f018038f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -678,6 +678,7 @@ struct pci_bus {
 	struct bin_attribute	*legacy_mem;	/* Legacy mem */
 	unsigned int		is_added:1;
 	unsigned int		unsafe_warn:1;	/* warned about RW1C config write */
+	struct mutex	scan_lock;	/* Serialize bus scan */
 };
=20
 #define to_pci_bus(n)	container_of(n, struct pci_bus, dev)
@@ -1159,6 +1160,10 @@ static inline void pci_dev_assign_slot(struct pci_de=
v *dev) { }
 #endif
 int pci_scan_slot(struct pci_bus *bus, int devfn);
 struct pci_dev *pci_scan_single_device(struct pci_bus *bus, int devfn);
+void pci_lock_bus_scan(struct pci_bus *bus);
+void pci_unlock_bus_scan(struct pci_bus *bus);
+struct pci_dev *pci_scan_single_device_under_lock(struct pci_bus *bus,
+						  int devfn);
 void pci_device_add(struct pci_dev *dev, struct pci_bus *bus);
 unsigned int pci_scan_child_bus(struct pci_bus *bus);
 void pci_bus_add_device(struct pci_dev *dev);

