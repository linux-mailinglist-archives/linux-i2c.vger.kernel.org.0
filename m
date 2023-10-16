Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32D157CADF0
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 17:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbjJPPo1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Oct 2023 11:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjJPPo0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Oct 2023 11:44:26 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE730E6;
        Mon, 16 Oct 2023 08:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697471065; x=1729007065;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0wsLJJC8YJI4BpmdkZY+nfQC2CtEhUW9yMaILeAookA=;
  b=Cjq/3sa5Ui5Ic14F5NWp2NeHs1GiPn7zFj2mrl65TIQxJJ5gVYTY8qpz
   QeGPr3RWogQb7o/DqVtaMFqx7GkQzDhUTXTKHCTcWAnVWNzHOT2c6/cqS
   savDMN+LD4Xfm44vYhDlgFr1C1om/z3brnP33CiVv2w559RedDzPpvGIV
   iFYsyMz30+4YRoVltyzAGAYW+njTS8vSKiOqAuIaorPFfsFOcNjCKXWpx
   aRRNEhg8YT7XYEFTWSrR7dz7RMNB85U7CcAAWK1TjSo+UznMI5radndbG
   ozDem0z7jkI4hsot1w6dPdBJ8A4n/ux1Ymyxqzs0aalLYi/ARWCPLS3iY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375922721"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="375922721"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 08:44:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="3571073"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Oct 2023 08:43:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 08:44:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 08:44:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 08:44:23 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 08:44:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvEUlADC5CQ6jrp0y5ckIX3RGn+vuARuIl3gypIe6oUf88M/hbo5pOTRseBCyhgJIOwJvKGa+ZNpAVcTO+QjIdkd3JYHppE8Mm4Rp2zXPiH1V5qgeDSyZ+1/SuJAI3GrvGNNbYOXoAYcDKkDvqPuimL/1k4NSwujAad1Cu+QIexE2Q+/bqghn39ZshXqni9QXy78a5eMqYyjkLwUwgU6gFbCr6Si5n7JLedlzrboaIyvc7j/sD6uJqjUQncx9nSZXygSNw5y0Rm/1lXvICts6OG5+nHS9L6fNggzbrRWgaO+lmwaI6UEudgCtWgyq8TXPB1mjxJBWfL2bGDjLOwMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fPsqA0U5QWtU4e9Lkf2/sSFQx+HG7W88ewcz104pR4=;
 b=dO0kxRno0/cgYleKpLWMnAS+rgkG84WLCpYVZ/olx3WvRYSPAIlQvMyWjn93LmI3Y2YU4u+UGgQOyJJX8k86Pl0Rqe13FBUoV883okBas5wZeMNzYJKSgvAfNkQ1sbqEm6lCAEA1uqdIDsOHHCgUKDzzOcZHjfe0rhsMgn3+aXc/H3oCX3TymmY78rSqO6WT0KS45+MR+vy7taugsW8B45oLr7h+SknlRH/+5fK+pEXJHCyl3cfho7ZeG2CQgRNsfYOMKrfiD9D4OFMFOM3HKKmAzCl/DpkQAN/R/mou5TKrBHjQRx/F+nXG623p+YoYsW/X/mqiuzr5/y6rtBCcmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Mon, 16 Oct
 2023 15:44:21 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6863.046; Mon, 16 Oct 2023
 15:44:21 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
CC:     Hans de Goede <hdegoede@redhat.com>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v20 1/4] usb: Add support for Intel LJCA device
Thread-Topic: [PATCH v20 1/4] usb: Add support for Intel LJCA device
Thread-Index: AQHZ+nqZYOWB2QQzm0agSGlxpBPNmbBEZGUAgAAEnYCAAByScIABf/iAgAImwQCAAPlcAIACx//wgAAk8gCAAHc9cIAACXCAgAAFf1A=
Date:   Mon, 16 Oct 2023 15:44:21 +0000
Message-ID: <DM6PR11MB4316711C71937AE3C0516C7B8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
 <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
 <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
 <DM6PR11MB4316BE44F53E276384FF06C88DCCA@DM6PR11MB4316.namprd11.prod.outlook.com>
 <5d2e9eba-a941-ea9a-161a-5b97d09d5d35@redhat.com>
 <ZSmjEKfYzFuAHXW+@smile.fi.intel.com>
 <9a080d06-586d-686f-997e-674cb8d16099@redhat.com>
 <DM6PR11MB43169A9ADDA7681DB7D9347C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <ZSzogNhlX9njvOIU@smile.fi.intel.com>
 <DM6PR11MB4316382324D15985A70E531C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <2023101653-shiftless-scorebook-19e3@gregkh>
In-Reply-To: <2023101653-shiftless-scorebook-19e3@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|DS0PR11MB7621:EE_
x-ms-office365-filtering-correlation-id: 2fc70d23-2551-4e28-9eb1-08dbce5ec40e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tqRpwW+2GtCYXbxTiP8H/Ra8bMvcjtZ3W6dY+z3uOB/IvwjiYLqYBXsr1SICfZg7HCQ6HvhWD2jdYj8vRlokg/2A93D6r4hv0MtboBWCa4fbHheisyH2CsEgyUAQooVPEYWFRnaadWY/GApmMB4PAM5AMQWchm2y0LEPwiHWOMBvqtexjXzsl6vGvgTZ6u9eoS9GnuAEjJAPl4VuTlHb8AdrQ4/YJXb5g8W3a0M1hKi82oqgw4wsdwCIWeYZKVHpp8thbkRsVyI+IR5x/uCdwlrgwcdKza2SGtZrPivSYhAYjOJKwTyAakKZ/wl22doaV6NysBZoIjOmazpj9tSF/06hGIR32zVQ43PcoOKAKvU5bvMrYmvaJw7yq9hVIjVDRepS7TjHUH2Nf0xHAMePWpBqLCM0hBHFPk8RYM1yNdm2av8rZVqfG+Vcf0nYC2K0loovYw1W2e5dwrcUusnDxmTa57eCCKLvf9Ulki/a43bYXzgmF+22le2/Kja7n/FyC5kch0o+DJKvCK0oxl9N0QSkOifD82w0kHrXb0bmRc3MQ6DtyAQUQj8zVUzTF8bWXJFay1NNzNG4xcqINQSjFGnW+AEF0G92wkUscZBP4OCNDN0qPoxBYVjYCJbxjkBV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(7416002)(2906002)(316002)(6636002)(41300700001)(54906003)(64756008)(76116006)(66556008)(66446008)(66476007)(110136005)(66946007)(52536014)(4326008)(5660300002)(8676002)(8936002)(55016003)(26005)(38100700002)(53546011)(86362001)(71200400001)(478600001)(33656002)(82960400001)(83380400001)(9686003)(6506007)(38070700005)(7696005)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O3p1aqNxffITVOeIqyiCW7Xs6XuSnKV4RwNMDwsRnxApM3sEInPXirHfP63Q?=
 =?us-ascii?Q?17kzzOdRlTvkLGPkbpX44mctSWEMETpfC/rQDkzzWhKoUsSwuPilofHWIzpg?=
 =?us-ascii?Q?FA74xtq+Dot3gMqm5eX9mBhZGbD7bYg/7Y/dmY3BSPZ0v43Fv3BYQL7Tvs+m?=
 =?us-ascii?Q?MbjoflzdhGdh3nGQQ+td42zCI8GiSNIAycSZlSaVS6/IUw0Q5vEnR3TyDzJR?=
 =?us-ascii?Q?t8XoBU8jmu/g0JhyhKGKLXGxpeGqNTfCI526hmD8ouy6fGV4TrbWwj16ol4t?=
 =?us-ascii?Q?pQkDI0fVo5mHZ3hHQXWSHRvsl1c1UW5+BLqEPomPEpuUVgRxYYfuBzlxvw/3?=
 =?us-ascii?Q?bV4IrswYrKR8ogyasC1SuJ+rxVShn/LUud2Q+zZIyWZttg0Bku1EGaZT59Hp?=
 =?us-ascii?Q?+tfBdKghjdB/s9f68bF0R2D2vLdscLmXy8kijb1/g4QYIFJvoXilRzzprW0X?=
 =?us-ascii?Q?4N5bN2u609aw/Ft41JjWud6TKXiRnKZzVRaVqHQ9xl/cl6azon8MzhzOkHNJ?=
 =?us-ascii?Q?bCPQkrcWLi+ieab/QFtsGWWYWsIJHE+Iriu4i5vlhxNyG2pmu2dxfFo3P9g0?=
 =?us-ascii?Q?jRHPzYNOP+xaVSBtXZ/tJVBLXDSKs+1A35Tf4BZm1vkUuB5tpO6RH2sjP+aJ?=
 =?us-ascii?Q?4zpUg5HrviCmhd/Sib+zAkRHLKJlW2/aUtKJUgwdcRBJXntJvYInjsN54j+W?=
 =?us-ascii?Q?euNsWRviLAYKSOzpotD2+eb+xGXyYnvWIFydTDDg8d00IulXgbIjzXBiY43H?=
 =?us-ascii?Q?B9i0xWW92EqbWtidbOwzCMTUGAXr0zQO6mEQxC4H1rUETjYih8w/iPy7RzDm?=
 =?us-ascii?Q?gjd5lyFih5AXgETAx2d4NlaaTJFcLvhl+vF7bf6bfsXPii0k9r+zRTgvLjBI?=
 =?us-ascii?Q?CgqRH9Y/UDCTKS70mf8jigX90MHOfr3/yX98Nd0goe++DLFmXyjFwe9I8GuP?=
 =?us-ascii?Q?zlZCyE0RgadnM35jeggqqrfArlm8b5uJuxjG6bKIahHQkRWWoAjhgVW1zzUk?=
 =?us-ascii?Q?RFwRnMxV3J2UfdKFJZ+WdsJzVmTbyEkRIqvpmpqk2WYIG4vNenYU9kBYCo8/?=
 =?us-ascii?Q?lAncn0y2ybJjR258bQ2zLXv+PuwqIn115aG/0IdLXNF/gbgsCFaGXBlpqgu5?=
 =?us-ascii?Q?BwXPSZwFCq1JfmVEii1pbrqXKknDGsgzMmKiUXR2oJDTJdTkEwQk5agPEtzn?=
 =?us-ascii?Q?ZNuE61r/+4kmfFSS0rM39NBZD9755h8MByhMMEPB1MF/0Zw4umSjpKPeG7iK?=
 =?us-ascii?Q?8i98tNhWagBqJrQzkn0cLWCiAtSh4D0pJE+/jgePChoo8HuReQ5zwMxWWRi8?=
 =?us-ascii?Q?Fm0nBsphS3j8OD/MwxxORQndGqgDUGNlJK1g+TjS4RQ1Kbe7DWbNNAgoLajs?=
 =?us-ascii?Q?VfR6YUgZm1Mm4XufG1IjQDSfja8Yr/uE0u0jyu2wKBXE+iaiMufnHUxlo7Za?=
 =?us-ascii?Q?AXYArgVoVXfRMMyTqhPIsDY+aR/IuebbfrqRAbuIyv9uOpd5dQlLvIJE1T9V?=
 =?us-ascii?Q?TS5H/OJ37+uSmDQxGDvFz8fvNcg7QzisldS8A4l4HwLFX7vQMuPVamWW9Pjy?=
 =?us-ascii?Q?pqQtb27DoCowMyRjmqwVqabeyN8l35CZZrflAbki?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc70d23-2551-4e28-9eb1-08dbce5ec40e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 15:44:21.4191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+Cbg9JNniDZTVxvrYJQKiU18U5WQ7R/1G8Yyb0VsInm9/SHSy3CJ4kQxwfcOJwtNZJtMfi1/nCqO4SLlDak1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7621
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> From: gregkh@linuxfoundation.org
> On Mon, Oct 16, 2023 at 03:05:09PM +0000, Wu, Wentong wrote:
> > > From: Shevchenko, Andriy
> > > On Mon, Oct 16, 2023 at 08:52:28AM +0300, Wu, Wentong wrote:
> > > > > On 10/13/23 22:05, Shevchenko, Andriy wrote:
> > > > > > On Thu, Oct 12, 2023 at 01:14:23PM +0200, Hans de Goede wrote:
> > >
> > > <snip>
> > >
> > > > > >> Ah ok, I see. So the code:
> > > > > >>
> > > > > >> 1. First tries to find the matching child acpi_device for the
> > > > > >> auxdev by ADR
> > > > > >>
> > > > > >> 2. If 1. fails then falls back to HID + UID matching
> > > > > >>
> > > > > >> And there are DSDTs which use either:
> > > > > >>
> > > > > >> 1. Only use _ADR to identify which child device is which, like=
 the
> example
> > > > > >>    DSDT snippet from the commit msg.
> > > > > >>
> > > > > >> 2. Only use _HID + _UID like the 2 example DSDT snippets from
> > > > > >> me email
> > > > > >>
> > > > > >> But there never is a case where both _ADR and _HID are used
> > > > > >> at the same time (which would be an ACPI spec violation as And=
y said).
> > > > > >>
> > > > > >> So AFAICT there is no issue here since  _ADR and _HID are
> > > > > >> never user at the same time and the commit message correctly
> > > > > >> describes scenario 1. from above, so the commit message is fin=
e too.
> > > > > >>
> > > > > >> So I believe that we can continue with this patch series in
> > > > > >> its current v20 form, which has already been staged for going
> > > > > >> into -next by Greg.
> > > > > >>
> > > > > >> Andy can you confirm that moving ahead with the current
> > > > > >> version is ok ?
> > > > > >
> > > > > > Yes as we have a few weeks to fix corner cases.
> > > > > >
> > > > > > What I'm worrying is that opening door for _ADR that seems
> > > > > > never used is kinda an overkill here (resolving non-existing pr=
oblem).
> > > > >
> > > > > I assume that there actually some DSDTs using the _ADR approach
> > > > > and that this support is not there just for fun.
> > > >
> > > > right, it's not for fun, we use _ADR here is to reduce the
> > > > maintain effort because currently it defines _HID for every new
> > > > platform and the drivers have to be updated accordingly, while
> > > > _ADR doesn't have that
> > > problem.
> > >
> > > But this does not confirm if you have such devices. Moreover, My
> > > question about _CID per function stays the same. Why firmware is not =
using
> it?
> >
> > Yes, both _ADR and _CID can stop growing list in the driver. And for
> > _ADR, it also only require one ID per function. I don't know why BIOS
> > team doesn't select _CID, but I have suggested use _ADR internally,
> > and , to make things moving forward, the driver adds support for _ADR h=
ere
> first.
> >
> > But you're right, _CID is another solution as well, we will discuss it
> > with firmware team more.
>=20
> Should I revert this series now until this gets sorted out?

Current _ADR support is a solution, I don't think _CID is better than _ADR =
to both
stop growing list in driver and support the shipped hardware at the same ti=
me.

Andy, what's your idea?=20

BR,
Wentong
>=20
> thanks,
>=20
> greg k-h
