Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFF8A7908DC
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 19:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjIBRSA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 13:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjIBRR7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 13:17:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C830BE5B;
        Sat,  2 Sep 2023 10:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693675073; x=1725211073;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dOEYxDoIy9zJP7rTIC5pRBzd/XdMo1fVa56NEMMRJ7A=;
  b=iopYlomnoYaOfHshtpjQBzbiVNDgqCsckiM59cBbzx1lueI6BIfibR7G
   acd09vdWLtBmUZM0cD6itYDWvMSQjo5Xo6EdgTOG3kx4MPEgw7PIMA8IH
   EquhjoPQaJk22me260+p8LHBjNZHt9QB+BoSDt13JbKut/3F+WdLwGYZG
   dsI3U+8zo7/2Et5VG1bzV1oJWQDITWUD6CHYHX7PBR3bg8Pywy7dMpIcy
   jR97Drgfs/dKfHUFyqoDnYjskQawLb7Flb2VRp53fd/gfsVGHV6rTF7jh
   UtnPWdnMOLEt48TJxkPlu0A2hCGY+GzDBi3dBRxw7EBz1iYY13ilUYRSd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="375286665"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="375286665"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 10:17:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="717123578"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="717123578"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Sep 2023 10:17:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 2 Sep 2023 10:17:51 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 2 Sep 2023 10:17:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sat, 2 Sep 2023 10:17:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sat, 2 Sep 2023 10:17:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqTzXeTsid8LyAjvZKSa4xq4zobj5eYVqquj9YS8cc658pjnWZXlOVHj89ogw3RFF32Wa74D+WApRCBuPsSrzo+4Y5V7rRFMMfnmxaqlK+YXZQ5uf47JGb8mteYj8kaNkFkk3/azw8iihlDyLBciQIT7XHIT2Dipom/OslS52nsAC2o4WOmmMczRSZS5hNtoaM53nm3LtwgYg50E/Ge7t32ia+qGpZrVVRCYd3W4l/EuD1QBpMoMyhssqvxt+7nU1STvDaPubpx6j7hlwf3IhcNWqjV1TQ8am4AmcPpJymW86dlU+BcfcVzfY9liDJTvdRcxZB2DLYKFpsS3BsDZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKMceJEXPmE+jrCKYnjAZ7BVwwIn8/LnEjewm2aA22A=;
 b=Pyip6aPstcuUireSZYS+MWwkOyW2/zAEP1KsEel5pvQhqFlRn3NzKifqMAyTroAt43/Aah8FMGL7JA2JpF6Z6QmGR/MDV5XzblZ48SocHHWVJb2mJ2PJhZ2gfEt+Y2934wwcW9mktNczJ952wwpkXP6SMec4ZbPH0uZEGe5PTK/I20AsaTmOlO3pKNwshyyAjvfwiwq5aMfNyre6EkJf8jKTq6pAzTM7CNbuKZrrtxegrI16xk7tDglibtTe+7d7x2LC9jQfzW6WRjjStbXkP9tV/T86MNiWzTbmXxV2v8O+dDfLUs3YQySrEawUnNDI4Vp80SkEvsRFci8UtJf86g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Sat, 2 Sep
 2023 17:17:49 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6745.028; Sat, 2 Sep 2023
 17:17:48 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Andi Shyti <andi.shyti@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
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
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: RE: [PATCH v12 1/4] usb: Add support for Intel LJCA device
Thread-Topic: [PATCH v12 1/4] usb: Add support for Intel LJCA device
Thread-Index: AQHZ3JZaT3mEHd16AU6JiZjDuti4n7AGEhEAgAG3YwA=
Date:   Sat, 2 Sep 2023 17:17:48 +0000
Message-ID: <DM6PR11MB43162C57D91287737B1C77CE8DEBA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1693546577-17824-1-git-send-email-wentong.wu@intel.com>
 <1693546577-17824-2-git-send-email-wentong.wu@intel.com>
 <ZPH9hLjQ9GrmfvXh@ashyti-mobl2.lan>
In-Reply-To: <ZPH9hLjQ9GrmfvXh@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|PH0PR11MB5925:EE_
x-ms-office365-filtering-correlation-id: b11230bf-9569-4804-fd17-08dbabd8882d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y25yhHgHDmpeMpZVtmMjkdatcGbIOawh0nUCErk/5HgzFxABkOmM17koImSfPWBH/X99xINN+JvkMSJQjQvIzF5c8pISKvCS6ZFW1Y4bJuBMQIpq9EpV2yrKdXPvj5V3+zlbSY4/z1GU60ujn7NJ3plSF6HOTQyrgVNptZJIIF3dMoZ+9gjGxo+bCuhHldLEwT5shBidncfDrK5kSL8jXfkfqlP811v9ZARKjpwona4nAGNMdr+JNVNMjXmtiNB173yIbzimFTVw8i/vW8oM7CfdLCDZi5AoMv9KNH22QKsGg1v2Z6CBYmSaw+U1Cmm2YhHWnYtANzpivkp3n6M40/xgf5p0EHyCeUqPojooIRk3CdvtxTYImUlbh0Q2x5PyHwTSG12lbWBexyulGmGvSNBYpGNN75hCdyVgAvNUAf7xkw2o1IEATxe++M48dUtvyTojEim93Sht8KiaaIn+yxhk5EiQvRFPzuTyBYzahZKgzeRC7S0FOCaZQ7LGzUE8e3R+2RCUfNtekg4aDgOwqHyqg3C3l/HWDljZC3ojhsmsO79EPg1DevKmJPI75GWwaL5AmZL75u5BcdSK4TSQ6r5ogv+crO9wo3Dpaq63xPXWidNe1oahIcYjrqnuNp+x
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199024)(186009)(1800799009)(7696005)(6506007)(9686003)(71200400001)(55016003)(26005)(86362001)(38100700002)(38070700005)(4326008)(52536014)(33656002)(6916009)(5660300002)(8676002)(2906002)(66946007)(64756008)(8936002)(7416002)(66556008)(66476007)(76116006)(66446008)(41300700001)(316002)(54906003)(82960400001)(478600001)(122000001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?we6dsasLMp2u/NUhUBLQ7wsvT8URifOIpSfsDW9RaHIoDsZgiaJjrhcjXIaQ?=
 =?us-ascii?Q?FFyrK54VbYhEC9fa14pFN7+j1rlqqUc4xiI0zjZJvvSncXXlUAWFDe4fiO3b?=
 =?us-ascii?Q?AVDiLLeuAL/F81odeGxBtvyS64DITmHfDWLqxX93vbItwI3TbenUugTAW/X9?=
 =?us-ascii?Q?oZjJzieudA6rM3Yo6QUzCXhUkw0m4mPGVAIFeHAXrVgOfEu4YGRnmPO9mqiM?=
 =?us-ascii?Q?alaYwkygvh9skA6QhU3KYB6v4Bq2qgesz9eXp6+2dBrz1t0PAvg91kOAV8Jb?=
 =?us-ascii?Q?3XURIKgvQNKYwYm5f6ALE+EG1IXx85ZDrQ93Dqlot3iYJ1x31OfeHlc1nMfR?=
 =?us-ascii?Q?ly/7/UIJEUc9wF+1pgAfqbEp667PnMrC+IWiRSfJeknXL/Wlr7IlMGRQA7Du?=
 =?us-ascii?Q?+4Qq1K325GfMf/j/7ey5FmIZ4ktIhDmkjEnR7eAXradrJibx4YPSNiNB7hxV?=
 =?us-ascii?Q?bHPEZNX0DSSLSm2GBz4yGa8iCEBfLG9+IrUstdzB9RzchwTPoKSgrq85cPs/?=
 =?us-ascii?Q?mY0BcJhG9Y1VOpC1Q7aI9hsIpv6js5OvWVg+9f+YOEUbeCVJ7Lg9t19iPB6H?=
 =?us-ascii?Q?BFfbARzO4mlDxYaf/c4RVOtf6po+Qe9LMWCjR3ThdyH/QXIgwBRqVo0bM3mr?=
 =?us-ascii?Q?wua4NIqtKjvNBZ2i1ZCH9qERqB8GhvNkZTK1cs0XqF2ImjvPi35kljUGyne7?=
 =?us-ascii?Q?3G2yOyw/aJcYS4bbskqLBdu+HNHBLgh5cR9IwO49sn1YbtHPa3WsQaCfTbiT?=
 =?us-ascii?Q?jtEbgY7F6ICTy5OE870mFacVcHH4Kx/dF/d6w5vaUAtxcdmSqe+OR3MMWY6p?=
 =?us-ascii?Q?pvfdJZwz4JHbkQLmgR5gHwOBUrCoaztdg4jKy5aZ5zV/k/zs5S2sEdXu6xkS?=
 =?us-ascii?Q?qYY0ZJbFWbLnGM9vfzIhPCitEqb+B88+7/1njKQVXcHwBE48rV4FRM+usvXQ?=
 =?us-ascii?Q?FzcmhXiVL2fHtcj/pa91hGE79EmxAWpdzEc3CtXNVe9v2ohphuf24G8n/5bp?=
 =?us-ascii?Q?ebGjwpyDt+fCX51X5UWQ7uDIpXXTG6o3nh8nML2bf2aZJ+WQBAXBFskwjLk2?=
 =?us-ascii?Q?Srk/+SmHynIGm+EdDU6JFdZ1NXoFV4TwvlH50Y/8INKfIn3x2YGQnAOG6nvn?=
 =?us-ascii?Q?9CIMfL+Ie8l+Erfd1zZ7YZ9jN4mtS3UrChR+BEEC7Be227YNi7AXqf/T/10x?=
 =?us-ascii?Q?U7FZDAMGRQGslBX2LqvWcCEeiBzEsfoxorrxb7hGb5BxatRXExtUTPkHIbc5?=
 =?us-ascii?Q?iwQaR55PV61a6bM3o3xDLYlL37ZHmBkFKijetai3xW8JrZtVHsf/SHJRUXQt?=
 =?us-ascii?Q?UgMs4NAK7fcrajSExVbogjQYsDHFP2eYGislhOBSgoAPvNU7xQttgN7bIJY8?=
 =?us-ascii?Q?B6GfqW4+nwR7pWc24+ZIce/dzytWxTy+H6/4TXArLA15IPurazcCtoD09RxN?=
 =?us-ascii?Q?Bk5B2mloinmEUOJW2b3an763w9gI0Y5wlV632rS2XD4k9q2Wuf4STAff7wS+?=
 =?us-ascii?Q?RvsNMPdBBT61ljq0JJ01epR5OE/Z5RfHBkQCr27dxgVCFKqXqx57Hkvaay7s?=
 =?us-ascii?Q?IN6SJ/wNPyzlx0fRvRuMxZf2/cczU2rfxMZR3MG5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11230bf-9569-4804-fd17-08dbabd8882d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2023 17:17:48.8998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tj//So1c9pVbN40qzIUbHQeUlp0Kt4HN6o1ZAD5Mf4c+2ORw1P9gaZQ0ayMzjMrMujCbrYwMEsxSUizs0jiLGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5925
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

Thanks for your review

> From: Andi Shyti <andi.shyti@linux.intel.com>
>
> Hi Wentong,
>=20
> On Fri, Sep 01, 2023 at 01:36:14PM +0800, Wentong Wu wrote:
> > Implements the USB part of Intel USB-I2C/GPIO/SPI adapter device named
> > "La Jolla Cove Adapter" (LJCA).
> >
> > The communication between the various LJCA module drivers and the
> > hardware will be muxed/demuxed by this driver. Three modules ( I2C,
> > GPIO, and SPI) are supported currently.
> >
> > Each sub-module of LJCA device is identified by type field within the
> > LJCA message header.
> >
> > The sub-modules of LJCA can use ljca_transfer() to issue a transfer
> > between host and hardware. And ljca_register_event_cb is exported to
> > LJCA sub-module drivers for hardware event subscription.
> >
> > The minimum code in ASL that covers this board is Scope
> > (\_SB.PCI0.DWC3.RHUB.HS01)
> >     {
> >         Device (GPIO)
> >         {
> >             Name (_ADR, Zero)
> >             Name (_STA, 0x0F)
> >         }
> >
> >         Device (I2C)
> >         {
> >             Name (_ADR, One)
> >             Name (_STA, 0x0F)
> >         }
> >
> >         Device (SPI)
> >         {
> >             Name (_ADR, 0x02)
> >             Name (_STA, 0x0F)
> >         }
> >     }
> >
> > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>=20
> looks good:
>=20
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks

BR,
Wentong
>=20
> Andi
