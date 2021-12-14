Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420CC474329
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Dec 2021 14:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234236AbhLNNGt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Dec 2021 08:06:49 -0500
Received: from mga06.intel.com ([134.134.136.31]:56722 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230103AbhLNNGt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Dec 2021 08:06:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639487209; x=1671023209;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ww6BDzjkxhIv1bLTXL2z5nu2Zwg8Y1d3tDreiBpuz34=;
  b=QPjKgWkeljEOLt8u2wreeU14tQiRlYrE4N1gdAXBjEzSsPiXMzxDxHoX
   cE3SL4ucCgCvatVWrijaj3dHNzH+pXFqL+nP2vhpYl/TQiILtNCRNr6fL
   noMxoMPketWKMJKTdKb2b1DQ/usvtrAGg8aIY8IZcVFYhBSFDJ6PYHvcE
   zY5IT5IonqG2aMVOUrdtMno51agvAcjslo3PZZFAJXQcZmMlH4yQu+kOR
   tM+RQxXY4YMsCJXxLfceHFUgKnErkEhXtxjrL5Yp6accZhG7fLScI7aNR
   Oj59+wwcZGXWy3pW3mcePkclNj49567eIxUpZme8iBgTq6PIRjugUw+BP
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="299751521"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="299751521"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 05:06:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="604278214"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Dec 2021 05:06:48 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 14 Dec 2021 05:06:47 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 14 Dec 2021 05:06:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 14 Dec 2021 05:06:47 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 14 Dec 2021 05:06:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRcjXthQt+E6ZtInC8IuMQm1BXQy35n7uW0+SNWLI7DeK4J2fSUweaFZ21Hwm6yd0WLUv0I9xlxN/9ZOmOqrEqf6gNdGIASvSbWMdaeVdQmBu5oKxvJaG22F3iuRNLuGqWPW7xupPKfXr96UvkSttS9pyvF1yoNiwZ9vIA4nBVw68uY2Z1g3ehXQEqfBBKRwvTd2t7Ddx3y14Zf6XgGIIG5+2H/DYICupMc4WY8dpQ8NJrrz8JZkgXQpQLi7YiSYA2S3O5QguEHxwCtgfNp1vkT5NGz961+Ttf6i0phTl+tQuevef3MVaPp6UNjKSK2epkGdOLULCG36MhDSyrqLnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Dn9f7f+my1343YzvRqWX32yH6EY5VmFwd4w3065vyo=;
 b=ISoD8C1+4G8cxxp/1pS6t84SDIsAw7xaqA3swMqpoedPykJHFmM/Hj9EFdVDtmiTerckt+vt6lGugFiUQ8fdoweHmPgmQyVNhtDLlLyTN9arvqqB2QdiOml5vHywY1h3+zXGFA8kb9zzqzw+EMvdC5Tr5ckBhVy1mQwOzW9NOR7dAylMrtHRX1U9VzKOaDR8TRgLw0zjpBPW0H1xwM4rOjWCYXAtqUJHami5WiQLVd17jvqg30Bak51sg8+Dd+bpl/qL+hfhYMH1qCN58qEhEvI5iYvwErT0gyFMqxyzESuVs+l8RKtnf2h9H7VSB+MZnmBjhIPvQvoN8n9j1yna5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Dn9f7f+my1343YzvRqWX32yH6EY5VmFwd4w3065vyo=;
 b=qjWavSkjIqxKW3nh+aHBvaTrqmZN7Fnqlkk4EKA0MmU1/hkRoaLH1yWiNnUFX1vneqdqX4fLutFjRINRk2SueBkZJYKRxR9+XDUXBlhyXKwU5w/IrM8JNY1k0qHyWtUG2ZHNE/VdPOh7+yR84iadHXuUr9aYmwT1VcUSKK/ixcE=
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN7PR11MB2705.namprd11.prod.outlook.com (2603:10b6:406:b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Tue, 14 Dec
 2021 13:06:44 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04%3]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 13:06:43 +0000
From:   "Saha, Tamal" <tamal.saha@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     "wsa@kernel.org" <wsa@kernel.org>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Senthil, Bala" <bala.senthil@intel.com>
Subject: RE: [PATCH v2] i2c: designware: Do not complete i2c read without
 RX_FULL interrupt
Thread-Topic: [PATCH v2] i2c: designware: Do not complete i2c read without
 RX_FULL interrupt
Thread-Index: AQHX8JYMLHg/XLfb1UaArqHQIu/JIKwx41eAgAAAlICAABCYMA==
Date:   Tue, 14 Dec 2021 13:06:43 +0000
Message-ID: <BN9PR11MB52763AB882607398B4B1A8478F759@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20211214025518.31211-1-tamal.saha@intel.com>
 <YbiHe6Lghi97CEz9@smile.fi.intel.com> <YbiH95v9h2Zz55PS@smile.fi.intel.com>
In-Reply-To: <YbiH95v9h2Zz55PS@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6ad5693-78e7-4945-c9ce-08d9bf0293c6
x-ms-traffictypediagnostic: BN7PR11MB2705:EE_
x-microsoft-antispam-prvs: <BN7PR11MB2705E859CE82B32B15B057BC8F759@BN7PR11MB2705.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1eDp1FpiI/jJCHiYhOwDruELr0WsXS54GvhXvszDBm500E5fg9Tq/ZQdSTZz1hwMmBVom8jvNifAMwzaZKVstagGQz2PTRUMQEqsnAgkgdZkB2aE3yn6BHzOfQtBCDIOvfisb/PG4qNevfNsmLGBOop1VKDE2piFctcogljaldKxASR6Pwu2O5gVnHDcIm7LJbFbcPk0V/v7rmHxOzhqM/J7j5b91mVD6WcxuZHIblutDDdgBNhUK3DfqEXW6Kf5sDYvQdwjOzEV6XGlHv2JN5xDYq+qNbX9mtkDw0XhhMQ8v/ybZ5OLvCdijpnrESrDGyDfpC2zM/42S79tqLadVZDlJ85XjWj8RoaS5Iuaax1TDNsHddBM3XlUx/jKbkorUYBQtDbN/37DmyRi/JEY7eb5JC3is7F9teUfx/Dr59rC3VIHF8AaMpAfgdBWgS7BAqN7w4/Av737q5KYr4b7nIFpjkJfFZF1Yah5hIw9J55r28T0tCb31rohQJj/CcLXcMKUDluSDsl8dauDJTc9zzUdBP/zEpWITP7bnAPYNog8994ZgH6TMjrFc9zcV0f5ESmJKT8FzLoyjKlnDRxt+L3qhOylSZOM0yQHkHxI+h+BGGmYqOZ1nGJEimfA6at2M5dOwu5/i8r0edvEHCDDqZVJ28xQsj4p3qvbSYcWeMJ2m8sWo7A1ybU9zs7v6JULMRi9l8FNbJDy8U3vsLbu9w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38070700005)(6916009)(54906003)(8936002)(86362001)(316002)(83380400001)(2906002)(53546011)(33656002)(186003)(508600001)(52536014)(7696005)(6506007)(8676002)(55016003)(122000001)(82960400001)(38100700002)(71200400001)(66556008)(64756008)(66476007)(76116006)(66946007)(9686003)(66446008)(4326008)(26005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mk2wRXGi9dsSLJ73juizOo42iJ6TtAbjc/51yHxXOzu2EwrDVh1S+nQ1jJy1?=
 =?us-ascii?Q?h8Ky/fIY39pkLIpP2w0eQ2YRoP4XNvAHA9rn/MeQcNrqtrdWbO3FkEcNUOvH?=
 =?us-ascii?Q?gu4yC6TsRrDZXTeRzu0z/6OJ4I5v1dZFb+Y/VDYDz1xunuU/useKjfwH+hIe?=
 =?us-ascii?Q?nvPMCXBot12K+7eCosquDs80mWfR7JXHlyyjzQaJzv24+mqvDd8KkxfqvwNa?=
 =?us-ascii?Q?loLDla2PgtGeOFskFCqdsPAob42w84lsyLzAf/Ca1Jbe+qCdS3Ayh+5+kVJN?=
 =?us-ascii?Q?FarMfm9muKyondWuh/eE4bJqa+6fFDGK41YoULn0IdGvnGFFxs/OKdGerdnB?=
 =?us-ascii?Q?9qpst6s4YyXAIwAo63SyGbp6AW68tarH8PUOWixXUdNfFJPuYV/VtCnTJ4G2?=
 =?us-ascii?Q?Mfj/2NULpIhEeh7Aakja6qeMc4Q1F/zAOVgl1BwLbmTpo0kpH7lJxfE6XGgI?=
 =?us-ascii?Q?CtKlGWgM2PsHzje60Nay/y7X4DXplq16hIfYB35RWcDrYiogfeLXLAOdWJL9?=
 =?us-ascii?Q?lOW9J9e2awTJzXf1Bv+i46vLA5bnwousbvRMhmiqk8/FTWixcj1Sv/Tpa2sG?=
 =?us-ascii?Q?b27YU2YvsCYq026DvHqicsNODgXK+vHq2HyTZu1rekMYKvd3XDx4yizhJw9n?=
 =?us-ascii?Q?DPbuFG+7k4eVb7tGeqIoo0BB1IfE7YlPDJW3ch0HWFtDIiz2F3RXZdk00zxF?=
 =?us-ascii?Q?97E6UAny9EBfokl64zhwfW4B+hYocYTjbDr9ytHCwgP9eytht4HFaDvGupXO?=
 =?us-ascii?Q?fWqEk6BJdcbOZPIRPKVdqpViov4DftL7C0n7e47zPNbNNXFl/J9ndqymPnRv?=
 =?us-ascii?Q?gxekOlDtr1EE38t2k/DzgrhGr7dnHKMlTofzk64rNoJBShUFiplgKJVX9UI1?=
 =?us-ascii?Q?zvL3oisF8Bl2Mk8Ad7ikQfT0zrMbE2sYTZW3bLStAlIH2pAymzvBollNXTkW?=
 =?us-ascii?Q?qzlYt6JpRDnrzzMAi6mebp4FTKT/CwJa7CqmNI+Anp/fD+do+SfqUK04vyzx?=
 =?us-ascii?Q?Uz3zJe9I3oHViIdOL3xKeQvs8tPnjJGneDROSUD0yc3kHLWCQp9a0sZzFBNe?=
 =?us-ascii?Q?cPm4OUCTLWTTrYyzaUdRcxiVbEtoTGblKfKXsDV9v4kW9QgGo48ge0orAfHH?=
 =?us-ascii?Q?AFc64M1Km4fCdZ8q7O4OybWZDE79w19gvJsUe6T8Ov9xXsvqU1pEWl51pSjs?=
 =?us-ascii?Q?gT7uhdI0qOw8bSYFbUHVbXTVNI46jsmTPjSRNuy7yYcIwinvW6cN6JJKkvoK?=
 =?us-ascii?Q?ikcoSIAOTsTFeE4raEXXJvcfqtX7Vj4YhZ0liMi0fHCrWGKtd3DTBtfOifVJ?=
 =?us-ascii?Q?/GxQUyzXHkTrBdZA9kyW+oWSfRauzawuYbi8iHeBtL4IlOnvcGEtRVJIBLt2?=
 =?us-ascii?Q?TWCySYFsHlx7TwaDsOPQbqgJmeutJlQrYUnzmA70qWz5O7n2OMDFg5IBUm7B?=
 =?us-ascii?Q?EY7HleKFQ9jyKj7VQCnk8WO5PkUzgsHGn98e4gVWbbT/aHDcSdhEWKd9iCVI?=
 =?us-ascii?Q?o4Y3CPVezahpRn6ONfz/aDHRI3atWgt5iffXIz1BZNQsngnG4alyDS8jeOCl?=
 =?us-ascii?Q?Vnra8qvbIDwnhNlWFCRAzaH+/NIav/SVjgiL3QkbhntfrNfiVHerXQx98rkG?=
 =?us-ascii?Q?hw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ad5693-78e7-4945-c9ce-08d9bf0293c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 13:06:43.7543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: msdxK6vxyc4lFVlnF7JuWt7X6mtGdOwROfGVH/Rjikj5FeeCIkjI56iTpS8WiYh/6bAqQuMuqaaPZWN8+Vb1Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2705
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks Andy. I'll incorporate patch version changelog and review findings f=
or this patch in next version.
Please let me know, if you have more findings for this patch.

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Tuesday, 14 December, 2021 5:33 PM
> To: Saha, Tamal <tamal.saha@intel.com>
> Cc: wsa@kernel.org; jarkko.nikula@linux.intel.com; linux-
> i2c@vger.kernel.org; Senthil, Bala <bala.senthil@intel.com>
> Subject: Re: [PATCH v2] i2c: designware: Do not complete i2c read without
> RX_FULL interrupt
>=20
> On Tue, Dec 14, 2021 at 02:00:59PM +0200, Andy Shevchenko wrote:
> > On Tue, Dec 14, 2021 at 08:25:18AM +0530, tamal.saha@intel.com wrote:
> > > From: Tamal Saha <tamal.saha@intel.com>
> > >
> > > Intel Keem Bay platform supports multimaster operations over same
> > > i2c
>=20
> Here you put multimaster...
>=20
> > > bus using Synopsys i2c DesignWare IP. When multi masters initiate
> > > i2c
>=20
> ...and here multi masters.
>=20
> Be consistent.
>=20
> I believe the best way is to use dash variant, i.e. multi-master(s),
>=20
> > > operation simultaneously in a loop, SCL line is stucked low forever
> > > after few i2c operations. Following interrupt sequences are observed
> > > in:
> > >   working case: TX_EMPTY, RX_FULL and STOP_DET
> > >   non working case: TX_EMPTY, STOP_DET, RX_FULL.
> > >
> > > DW_apb_i2c stretches the SCL line when the TX FIFO is empty or when
> > > RX FIFO is full. The DW_apb_i2c master will continue to hold the SCL
> > > line LOW until RX FIFO is read.
> > >
> > > Linux kernel i2c DesignWare driver does not handle above non working
> > > sequence. TX_EMPTY, RX_FULL and STOP_DET routine execution are
> > > required in sequence although RX_FULL interrupt is raised after
> > > STOP_DET by hardware. Clear STOP_DET for the following conditions:
> > >   (STOP_DET ,RX_FULL, rx_outstanding)
> > >     Write Operation: (1, 0, 0)
> > >     Read Operation:
> > >       RX_FULL followed by STOP_DET: (0, 1, 1) -> (1, 0, 0)
> > >       STOP_DET followed by RX_FULL: (1, 0, 1) -> (1, 1, 0)
> > >       RX_FULL and STOP_DET together: (1, 1, 1)
> > >
> > > Signed-off-by: Tamal Saha <tamal.saha@intel.com>
> > > ---
> >
> > So, where is the changelog?
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

