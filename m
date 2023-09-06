Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 288CA793421
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 05:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbjIFDal (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 23:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbjIFDaj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 23:30:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90906128;
        Tue,  5 Sep 2023 20:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693971034; x=1725507034;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tFf8ZN/jCYAauSe3O5pe3KozXYO8IrjqDKKyR9wEpto=;
  b=er31wYFHSsTjW9PUd7dvooIQJ+ce0QPjYXC4NibXXjB9XaF423AbmWyj
   K54YCv6ZJPxNLBAwgCHyE+uL7ubh2AWV5TN5ei5fHcgQd0SCrIAVm7SPb
   FdnpayNIbIOntV7Yp05sFvCW2Az6c49Nvkn4jupdvfjOF6fWcNQkRcvAy
   qarbN4UaVZytPqe2XbE+itiYYcl0JkcWQzc887Oho3XJcUTjU6QI+W9X8
   BpJqnCR2foPRwTeApmZNKoTEV8oNzcmGeNh6u2iebOP0PfChM8uipuZEG
   LkvsOjSOPW60TNZz5k5UnjqsDtezynC8xUzqXncQdmV53/qhdAPXsxxwN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="357268939"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="357268939"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 20:30:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="691152533"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="691152533"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Sep 2023 20:30:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 20:30:01 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 20:30:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 20:30:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 20:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7/GoKtHBLdTa8plnL9n5Ix+oRa6Tt9VO6qQ2vZsNx8bSQtI5OLlUsuiogcOgJwO3WyqB1OrtzplbRKjb8toeRPoYfxpu9Hjp6JAWtB+Ulp9Ze6x6XfQmgMVhGjRsQ7BpW8kL0HtXWn2LOpUxIu3hbXQcAjDNXkiMmRbE0N63gWF7h6MGHI4mt2p+BoHddk9GKBtEATcTlOYdtH83fG3VAsE6YEHf2HYkT0/d8RrGN++8U1ApuknQLilk5QQnpOfaimwRnnVYVbSGnhD7QWWuO3HpH84inRZ1qFh/qrTqmNId+GJgy2KKhQoBJX6/xyci3nkE7z9IwH/gHqRL6cPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noYCN0V0mTaq6ut0Dv4NZE7Tnrr0gyAJRi0jdA6F5DE=;
 b=h9aLKJv7XbRfmm80d1U6MP/5g9lgBsj8FIn+kUua1+Qyx9X5Bz5ardJ/g9Hpr/Jx1CDmwsGX59ArrR1vfOIx7yPR+cLYkdJlnzJSSaGVlkODMrzPvGn79bs8E6ibVIbrRgsli5DNpHu8BAcFw5uVMyYtC9YfnT+wM77la1d2/X5WuyoyHoNlg5ot2mrAgk2CKmgDMH6u+rJ3Lq7oerHbMTd/YZF/0qppoUSSrjn3lKtXjUKK0XhuEjee+tDanXsHFhHBwm2qZSm5ZqW8ffV2Kp7pxXhU/Y70RNsIdJeLYVjg02NOyUhWPwg34y8q/A3s9xf0qhZLl2S/DEz9CIjckw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by PH0PR11MB7446.namprd11.prod.outlook.com (2603:10b6:510:26d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Wed, 6 Sep
 2023 03:29:58 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 03:29:58 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>
CC:     "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "lee@kernel.org" <lee@kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "kfting@nuvoton.com" <kfting@nuvoton.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "maz@kernel.org" <maz@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: RE: [PATCH v14 1/4] usb: Add support for Intel LJCA device
Thread-Topic: [PATCH v14 1/4] usb: Add support for Intel LJCA device
Thread-Index: AQHZ3vLqt0FUDCDFkU6MTx3mqLWspbAKeKEAgAAuthCAAAzNAIAAxW/ggABzcACAAAC/YIAAFPkAgAEjpvA=
Date:   Wed, 6 Sep 2023 03:29:57 +0000
Message-ID: <DM6PR11MB431656D91661A2F7597DA8EC8DEFA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1693806261-12958-1-git-send-email-wentong.wu@intel.com>
 <1693806261-12958-2-git-send-email-wentong.wu@intel.com>
 <a8c8af1b-9399-6ca9-ea3d-b71e6ee68cad@suse.com>
 <DM6PR11MB43166D27FB15905CB02DBC5B8DE9A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <7755c3ee-9d7e-8ae5-1cf7-a5247cc4e6e5@suse.com>
 <DM6PR11MB4316C70D7C14B56ED349F01F8DE8A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <f6f8a9c4-faf1-f9da-e688-a29eb267fabc@suse.com>
 <DM6PR11MB4316F903C524668BA35707398DE8A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <2023090530-cleft-chivalry-b59f@gregkh>
In-Reply-To: <2023090530-cleft-chivalry-b59f@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|PH0PR11MB7446:EE_
x-ms-office365-filtering-correlation-id: 96154c4a-32a9-45b1-092d-08dbae898b6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XSvKmMQoG1TumdVeI7uEju/xvIOkh5wT/4eOQolYzUJhi5oAAqqS5XrlDr1y6JIcQC+HOneKYrDJoO5BYPjMzcKF5yYMXdktHrzEBbzr1sHFVRtw+Aw8B7wwGs5D0KvftBV7eTbkJh7/PqL9E1X2ZFTzxMcuy78ZUF/DvAlzzeZzF9AwQy4md1dNj1w9i3HDDpWa6qcIItrfU0l02iwz1A8z6l3J1Ye1vEXMQZDUMIr8GCfElXcvtEzsh1cgQxTB/zIKun6D3eh8OZungJ6xsAvmeUWNFDFvxQiyW8VvU8sCLWludodHoqwZciBITMqSTWZvRt/xrcWG7REkCwbS+/eALoa8j9uhAX6qfHodNSrWFUlErR9uNRi8ubJuZbypR3hip25kSxVnSxzzBERM7y5mhrSCaJ3aV3b3m1fNmSD0vtGMJEPhZZMye1FsQe7F9RDiqVXweUma/ONYbgiDUE2cwOF/nhhje9Q4f4Q06DkxeRgpQ73Ja7DkCVoZWi32vx8jiVJvE5zoVzLsTa0yTm3SnftUFy6zTdXHgw+fjFRu0VCVOBEgJxt1wDl1gX2/dTk9d4TeJmXCrGfOtyCvhObuafNtNQbsVZXIlWFqpg6UixrpSK7q8J+o3FJ+G9yc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(366004)(136003)(376002)(186009)(1800799009)(451199024)(41300700001)(7416002)(38100700002)(82960400001)(26005)(122000001)(71200400001)(33656002)(86362001)(53546011)(83380400001)(38070700005)(478600001)(7696005)(6506007)(9686003)(55016003)(66946007)(66476007)(76116006)(54906003)(316002)(2906002)(66556008)(66446008)(110136005)(64756008)(8676002)(8936002)(5660300002)(4326008)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2ICHql8vnoE+BtqMbW7o1D+WVVK0hufx3RWtM5+169afM+LDyd6O3cCx70vr?=
 =?us-ascii?Q?uC0ZQXScuu6fDyZriQN8n7BkUPMIfw0u8rqSq1pWSWMhOUxzx6frluOr0hWO?=
 =?us-ascii?Q?icOkKut9ZynqpBpBqMXTpDidlWzdbIx9LPmQebXepExX1e0hZ9xh1rOZM8QC?=
 =?us-ascii?Q?Asys2A+6Ol4+aNq5OR9z388+8UD/2jPCOeK5WKn5xKS8crSg7ObUVorTvSjs?=
 =?us-ascii?Q?YHm4+QeVHPICr39F1lxtWzmitljVqMi9hBHOkSSac4V80g+cSnfJQK3QK/i2?=
 =?us-ascii?Q?im79yBaxQewDISu4mHZDtVOgHzKGyXaUQQhz0T8TeJvZ37W1G9GbmzkaqAgs?=
 =?us-ascii?Q?hO/fdfQJw0zottYuCeT4hpYMbw0IuGQDiNiHoBVRB7f1Mjtfif26+kxNI5T3?=
 =?us-ascii?Q?6tGJo16dAyZ6gNL7Wg0scQyaVQh3sQ0oWqHUUNYz0xpri1eP8daxaxuYWeoD?=
 =?us-ascii?Q?CmoT3Ii6zuTqUhIs2Wai2g7fSqxN9U5JKPloU3aBLWNu+2jP1oHtnTGLEtVF?=
 =?us-ascii?Q?5clU7tNC3qfNWQmhyCRIA7x7auIcktusIYsa+URKdea44QE3lOs/MRpQzZN2?=
 =?us-ascii?Q?PvCdRKTHUptB6dU+Q7D9CWenU/+sNQMJNFUwPVQrjZRgK8RiJmyh3OaRX8uk?=
 =?us-ascii?Q?NoiMNwDk8GCIpmC/OXVYSXwumqVp6pGBSon0I1hrAqxxrP9sHySzVgW5X8HU?=
 =?us-ascii?Q?rE1KQjIKyuSHLW4c6TAfMtPa4WK1W+wfxfX7ZG+jv0oCa4jiRIsjY5UOXKxN?=
 =?us-ascii?Q?BSbdy2Jxx8mWYu+gmvjuAw4MyFdCseZ0bs6n3kbTgP6PJe4yUMIcgXb1QyCU?=
 =?us-ascii?Q?Bh85LPTtvgBEPSLLqIP/qfT8G/IxiXOO0U0GvqPgq4mSvJ2A4fXfqFxnneat?=
 =?us-ascii?Q?dVOVtZ0sUVIvmrzdPHKTgnA67kDl2865UQpoteourKBHFEoeA5ld3XPwzg0G?=
 =?us-ascii?Q?F+xcYMD9thy/yCLysicvEXq4Ys+4wtcz4l0fEKg1RUXJHxdX3V6ys0qbijwF?=
 =?us-ascii?Q?bPCaTLuJp1+8ZbcptWVWDhzz4kAkX5iph1tV+cytLkECBFwvKtM+cpHXOQLo?=
 =?us-ascii?Q?Rp62KevQSo2BSIVhqh7KyS+556ui10Klnu4h/YClPSdxfI5fYeUpdJNR7drC?=
 =?us-ascii?Q?D1SyJyGCu2eC29jQeqUtZJ/dAwrORparJAjlO5yH3oCfF/R1x/Sbh21VaB24?=
 =?us-ascii?Q?rNLo9x70llTC/TlGJ7WyaMeqTnlb6W4Esdpkf2AxcPGD1+glPbQ4LXikZyKJ?=
 =?us-ascii?Q?tT970vpDQElNUJqrbN0Ng1dPvS2kgV2IsDp0dNzJP44YIVewWjYvZ3dyL+2d?=
 =?us-ascii?Q?xiK7xue84CIQT4Xg0dySK0F1fo0lU9z2MDUbohOaJ2lr/PnRoBrptwclKeXE?=
 =?us-ascii?Q?iukMns2UIwUyWDAVvuewWQj+W3P9PCXIdsyLvfPeCkFSI9WkZVAD2MbHQLfA?=
 =?us-ascii?Q?ZLKbIahTLMlXDpSIoo6mqJsxy5qgLXZ4Epr6/neUBvdrYCjLG5/uGORkPuIR?=
 =?us-ascii?Q?XFV9OeLJMHkCfNIeio3uHtjEVvtvH9wF0E6o3zZdke1Bgh0Su/87/mzYryWz?=
 =?us-ascii?Q?ZmlZ8WRcv0q1axRRCz21Xk2MUnqnQVHw6fIiLi72?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96154c4a-32a9-45b1-092d-08dbae898b6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2023 03:29:57.5801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RiQpybwvHKs8eyr3YarOIT/57zSK/TEO2uwuMX2eqwvJKSSP5TVKPqOdZ6T7GfB5RfSgOT0xOdr39QwufBgRVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7446
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> From: gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>
> On Tue, Sep 05, 2023 at 08:53:43AM +0000, Wu, Wentong wrote:
> > > From: Oliver Neukum <oneukum@suse.com>
> > >
> > > On 05.09.23 04:20, Wu, Wentong wrote:
> > >
> > > Hi,
> > >
> > > >> That is that you will hang arbitrarily long in disconnect?
> > > > This routine isn't called in an interrupt context, and it allows
> > > > sleep or wait something before the real shutdown like many
> > > > drivers' remove() or
> > > > disconnect() do.
> > >
> > > It is, however, in the context of a kernel thread. We can wait, but
> > > not for arbitrary periods.
> >
> > AFAIK, this is very common.
> >
> > >
> > > > If we want to speed up the disconnect(), below changes is to
> > > > complete the cmd_completion if usb_kill_urb() has been called, but
> > > > there is still possibility ljca client init one more transfer
> > > > before
> > > > auxiliary_device_delete()
> > > >
> > > > @@ -206,7 +206,11 @@ static void ljca_recv(struct urb *urb)
> > > >
> > > >          if (urb->status) {
> > > >                  /* sync/async unlink faults aren't errors */
> > > > -               if (urb->status =3D=3D -ENOENT || urb->status =3D=
=3D -ECONNRESET ||
> > > > +               if (urb->status =3D=3D -ENOENT) {
> > > > +                       complete(&adap->cmd_completion);
> > > > +                       return;
> > >
> > > I'd say you'd break suspend() by such a change.
> > > You cannot complete in the interrupt handler, unless you can
> > > determine why the URB is killed.
> >
> > With below status field in ljca_adapter to determine if it's killed by =
disconnect().
> >
> > If this is preferred, I could cook the patch for review.
> >
> > If this is fixed, could you please help merge this usb-ljca driver so
> > that it won't block others which depends on this driver?
>=20
> Please relax, we can't do anything until after -rc1 is out, and for me, t=
hat
> includes reviewing the code.

Thanks for your review.

>=20
> There is no rush, or deadline, here at all.  It will be merged when it is=
 acceptable.

Understood, thanks

BR,
Wentong
>=20
> thanks,
>=20
> greg k-h
