Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C951C7A3F96
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Sep 2023 05:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233584AbjIRDIg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Sep 2023 23:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233376AbjIRDIL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Sep 2023 23:08:11 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B1BE7;
        Sun, 17 Sep 2023 20:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695006486; x=1726542486;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=M7NIirh6YV8kCKaZbAUGUH3sw3uGX/cD6N6839mlsK8=;
  b=k+KH6xcfpeLrIJ3DOfaxmyVNe9nNrV2g2UviFQIQ5zJeIiwbV7g3h7Fe
   6obGh6I7qSrgUETuAUsLPhV5MuQfpUoWwFrInLX+Ea5w5Nh7/6PYei5Jy
   jt2+qixmk55E03WkpLgqYVZdrNBxd7wqvqq1MMXeRilwFTF962t3WGIsT
   8pC6bB+d9n8IFJbEJmF6coHXbBnDTuaQFabG3NFsuBUvXsCg7lilrpejE
   NTYcB1SUpN/Q1Xis4dw/+a9ayrh2zupGbGY3BIuWUOoQ6RWI1yKWJxp1v
   Trqqu6zTg9k2iSc48FnKl6pf1T7FGcPw2Nx/jP9Cvr3vaAdeJpK4fDB/u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="378467820"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="378467820"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 20:08:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="695369101"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="695369101"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Sep 2023 20:08:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 17 Sep 2023 20:08:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 17 Sep 2023 20:08:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 17 Sep 2023 20:08:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 17 Sep 2023 20:08:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHO0Ia2Fq3F+pAFC3/hx2Oy9uttG8tJ4VQ349952OqT3BA4sMrN3Rh0lBpJRLFcPgQNwxP3JW+evnQ1mgL2prAgDAYsPJc5KxRrLcXkKzAreMVM6HOFwt7zTNYaNvFTpll3btEvm/G5XROPrWIzKvUdlOF0Qt8G/13mRZlfLOZFGdryaLus5u1pOT0JQH1JaRe5Toe+9G5+/lwbwF4NXkESfHxQoxego6w36ViHHvyGoHOcZFjUqKLeOSfXBUWYpY5C+ZGoWqdYNewP9ZCSmsKH46KRT8Meslw3utlmzCOvnml3nUUALnYWkx6JflgdckNNhvpRKF2Z5/vNgxPNsVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Il0bwmd/h7naNKaqcPAUVlICuGaz4cuSLhIo40EBzlQ=;
 b=DHoGaEkEZmAyPxp/ph9oJgBaFU39X95YusNUFbffgbXP601LgsnnTruTn/UYG3r/9HGLR+DhSp7wKIc1W7HR6aDWtTuTvY4gwkw9L+kLC4+pN8VJbO5mludtEJjo8V3jw+FEDOpO6fEsN3NHjN6KWPii9n9rnZBrhtI9RCTkS/BYguFk/EHN5hAcp1j123bytnH9kS+fWVm+A2QYwfNuW3eopgbxtLimGFdYMAGwqxJj3GtvWI91XaGANzj5B0iejddl7caJ4456Ss5J0i3UoqpPStqTkYkLZRLSMGBwJO4Dec1QPlG0nvbQJnJJd3cgk8QtEQDzlG3+TbIO/C9cVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DM3PR11MB8735.namprd11.prod.outlook.com (2603:10b6:0:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 03:08:01 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 03:08:00 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        "maz@kernel.org" <maz@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
CC:     "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "kfting@nuvoton.com" <kfting@nuvoton.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
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
Subject: RE: [PATCH v19 0/4] Add Intel LJCA device driver
Thread-Topic: [PATCH v19 0/4] Add Intel LJCA device driver
Thread-Index: AQHZ6M8jp9+Eu4clekmQw5eQWESW5rAe1asAgAEKUwA=
Date:   Mon, 18 Sep 2023 03:08:00 +0000
Message-ID: <DM6PR11MB4316729CE4FEAC3DA56CA1DE8DFBA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <2023091704-nape-coconut-af6c@gregkh>
In-Reply-To: <2023091704-nape-coconut-af6c@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|DM3PR11MB8735:EE_
x-ms-office365-filtering-correlation-id: d338caf6-5fd3-4694-8e9a-08dbb7f47769
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pfogotEAOXJqEzMQshaV4yAZpuK0HdJLYL0XLd+NWM0+LBvj56/AIMoJEWqF0BEMDNpGNwU11bTfCSD2ZYTO1xQdeJrkCAPeRpHeDcmIre8/nMaO/3MPBvu8ESHRqSXI7SKzlEdXSLwKo2PQi8LyxvjqYDFPYeqN8TQT7c6KvxNVBoLSXf/E/Cp4j0i5IB68R7UKzYm+2aBPYbrWXzjvka5ZDD48K/x9l+Si5jXsGV+6RfOM7mxlIhCHAJxaELbBlN0kr4yy9O6VZGvy9/y1X2t4AsDIa0PAla2cZwSocXVdBTccah6HfBUneyC1mSKUWrJX5a1vRLxcpbcmO1tOuqVzaxKnekIxLdkti+o39kFmhf5BbBrAJm4o5NyyRM+ATA3slvLKdxmtILQrzOa2KsoCmWe7Um8O++ipTGB99imHu+7giTkuaSXLn0CZRcFwz2k6KZOnn5nVUkFjhlUodYoDmA61inTeH71ffKWcSFty5v2n15fvJ71nm/FZbXYVwYWMBpXAsxVzt1Kicg8XOmPxMzk4IH4YddrmL30BEuD1H7eyesF1qwKdEgmoFjmwMgHXSMMW84xuqMJFFK/s3jBwWAFB74d6EA5srBrPFqE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199024)(1800799009)(186009)(55016003)(5660300002)(6506007)(7696005)(86362001)(9686003)(54906003)(316002)(66446008)(64756008)(66946007)(38100700002)(41300700001)(66556008)(38070700005)(66476007)(76116006)(110136005)(71200400001)(478600001)(82960400001)(8936002)(8676002)(52536014)(26005)(33656002)(2906002)(122000001)(4326008)(83380400001)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7RxSrOZ1pKC7PEvLhBkyEk4HZOj4RQAZ3fj/lD/irAjx5mhMUXyyJ2yp8f8d?=
 =?us-ascii?Q?ZZHsxeW2rP9fWJA9+igXW0Kx1fZLsm4sVhGbG0vT8ud14ZH1lqBQLWi0BUs4?=
 =?us-ascii?Q?VzWxSdmLG1orBsXLiVtOwxIDZiJOlBz62MlNv6EicY9whRy+/O6bEoFA7uV2?=
 =?us-ascii?Q?XZe4m02ygqICPzCs4htQgY7NOLu360TGNUwmX3XPh8Z3UPmRaORxrH24+h26?=
 =?us-ascii?Q?vW+8DgH/z0FCDQQZBQXMxPmarOO5L94VBt3dPYzn6fOkGao3ofX93Z4e+qcF?=
 =?us-ascii?Q?xcI2/JD8BtsLukwifzWciwQDhMN5lEmBtaxaXA70AN9yR1Jac4Pa+CUUJki/?=
 =?us-ascii?Q?Oj8Owj4269aEBKWh0QtELdw5hlXVvyzsdnBJ65F6aT3ftSfYuXMNGH4stxnr?=
 =?us-ascii?Q?ppbU6oI0OpBrasUCrZCJVekfT/bzZkQ8o1uKnkG7FnLWBCr2hpNyfBX2x5W7?=
 =?us-ascii?Q?GHza8dpZypT9fyw3ZzJZPy9uBCMwAOYKTIHAS9TtPnL1owCd4ukppYvvt/J/?=
 =?us-ascii?Q?otkkA9rbkl1n+9fC3cpqfeqD/0+X9UM+0SPfulyMaGepLN8BPdnI0FEgWUqs?=
 =?us-ascii?Q?IYf3OAgGZvccbduHoenfhyqbGgLffeYFtZRPYbfRbIhXTG4ti9olSOf/1/F5?=
 =?us-ascii?Q?lFBeRq9o1HUwTKGnezvWZ6sxkqYO/Te9f2jCFfxIXGbRiyVynRVa4xlyAOlk?=
 =?us-ascii?Q?DfxBxyl4pi2XrgjDd8KZzC+dQoOva5wNDJR9YsWYjiKhnSdyi78bTIH2RPEN?=
 =?us-ascii?Q?StSztETNmz7dfRUSDxjRGzhnAA+dNKPZ+XkrNjPwOV5RC38TFLtvFlk4BHpO?=
 =?us-ascii?Q?KnchoPJf14/w1//+VaHE+bwSotnFC9pQRGK4JEDC/VklhmQn8GitNnPcqR0V?=
 =?us-ascii?Q?JyuFbxggplzy9AD4ek6BGPItQPEvoRU5nSm+MPJdTxnzs4Hu8DsWoq6pH8bU?=
 =?us-ascii?Q?ObDD3H4ujfaBPrX0Q5GXBPrChZzEbXv1v6iPGjBwb6xkHjUfdHTKEMzZ9zcB?=
 =?us-ascii?Q?+IqFfbqPuf8TUyMY+teyoSZJbwKtGgCXxkRtVA1V6HmHRmj7779nY3vjlL46?=
 =?us-ascii?Q?Z6PMFRjqhQSr1vqhr9lLsnMrODhmBYRVWTTBhqxwi35VYoJXe2IEl0izENgW?=
 =?us-ascii?Q?TavPw6IsHtZO/IYNiP9NWJqu8QaIrRM5IVBSbjc2MQiFJhRe8U13I2aKLxRL?=
 =?us-ascii?Q?Z7wEuxUoJfLon0t2Bz7Opd6mWqYUz1u2wkJCAsLd6XQ0fN+AsaGo/RqbQgYB?=
 =?us-ascii?Q?P5t35LvIk+3bRvXhtHpveAVN8B+ZH7CSARHUmRmcozUYq7TffHUrMfd7VGK+?=
 =?us-ascii?Q?SyGVlcPl2u+iTvacUTjvb7/c2NyjfXYv5yNQ2Ytal8o7SkyYDqPuGuX9i/sR?=
 =?us-ascii?Q?9bJd+u2Xihvh4XZ4zn+XGQlZkiG9wd6hc4boQtoSPNf7HF4zmEi62Ncw3xvv?=
 =?us-ascii?Q?cAYNv6Ziw8vbin5UoSqK+KZO7uKkf73mfbF1O2/y6hV7IpDzPbFvW6/tFgnA?=
 =?us-ascii?Q?2lPPdKJ21J7SNTFGS7P9Iti2kyS8g4m39Me7EPtjsiH+zPJsou9yItNl3/8f?=
 =?us-ascii?Q?t17dgl4Qaj73RsnCkRN7C5i2Cbp2nNXNuBeoMQoj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d338caf6-5fd3-4694-8e9a-08dbb7f47769
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 03:08:00.6183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dbWNmebtjAzFbxcuySOEhw/vSKzjMx8y7jNn+cPLTPB6MGjcjaP6nfPxazeyV8eluhSKULCjA7MxS8AJreEKnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8735
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Greg and Marc,

It's my bad. I'm so sorry for this, and apologize for it here.

And I thought you have lots of patches to review, so I just try to address =
all
the issues currently I know before you start to review, so that my patch
doesn't take over your bandwidth much.

And now I understand your pain here, I will follow your advise going forwar=
d. Thanks

Also thank @Hans de Goede for the help. Thanks

BR,
Wentong

> From: Greg KH
>=20
> On Sun, Sep 17, 2023 at 02:53:32AM +0800, Wentong Wu wrote:
> > Add driver for Intel La Jolla Cove Adapter (LJCA) device. This
> > IO-expander adds additional functions to the host system such as GPIO,
> > I2C and SPI with USB host interface. We add 4 drivers to support this
> > device: a USB driver, a GPIO chip driver, a I2C controller driver and
> > a SPI controller driver.
> >
> > ---
> > v19:
> >  - add v17's change which v18 doesn't apply
>=20
> I don't understand this changelog line at all, what do you mean?

In v18, I forgot to include v17's change, so resend with v19 immediately, s=
orry
for this again.

>=20
> > v18:
> >  - rebase patch set on top of Linus' master branch
> > (57d88e8a5974644039fbc47806bac7bb12025636)
>=20
> Why?  What required this?

This is just a rebase for you and other viewers review and apply the patch =
easily.
Sorry again.

BR,
Wentong
>=20
> As Marc says, you are sending this way too often.  I'm going to move this=
 to the
> bottom of my pile and get to it in a week or so as with the constant rese=
nds,
> there are way more changes that were sent before yours that need to be
> reviewed.
>=20
> thanks,
>=20
> greg k-h
