Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD51A7435FC
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Jun 2023 09:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbjF3HlC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Jun 2023 03:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjF3Hk7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Jun 2023 03:40:59 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6A0411F;
        Fri, 30 Jun 2023 00:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688110857; x=1719646857;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zzL6xzXwLVyK/hlMXhQWdTKw+vjbA8htIstcqj32a4E=;
  b=P+ds5zSArirhNuXjBRq3C+H4HQHaduK296+0wvhaBxyOmwSWfHOThDSU
   PVJHErwxxqV++TRhTZss4paJHL89typYZHUW4u3ICo7FEQ3C8QU6k3532
   OhgyKr2T4nNAhyOgoDTTIU49T9MzSYPVn19zy6u43ze+7X12BBacWoLSf
   PWyhWtJZiCioEziV0jH+/4AOvBw9V3h/0hYGtsXSutksSlqWhbEtBEIQJ
   gUlXVl21xIb8ocy+xUzZP5UlKLxUV6e3+xLyk1BC1ufYolnph5n4fRy+C
   cqz3J9meYRVpN1jv1G81HhtinqH8K4i3Aq32i81MClLVguTkM3f5GH72k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="341920027"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="341920027"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 00:40:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="841769614"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="841769614"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga004.jf.intel.com with ESMTP; 30 Jun 2023 00:40:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 00:40:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 00:40:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 30 Jun 2023 00:40:53 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 30 Jun 2023 00:40:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSLypuAuf8AJ36Mzkv6Oniw7st13q/udkraKVlasiv+PLFME6tk8vczyZJHc+FQ0B2m6kXQvTm2PqJbaMJQV4QTvuvkxhdTRNYuf2SatRYRUjd+RnD7IdJLXbMzAOXBlJjTgKP8aVptAKXiCN0vIA0FKde/yqB8G6XF7pqMzLFKs3FYlfXIHWlcog5hIKHSxwPn/8BOoCPc1aSMuv0oPn5eFP3rE9w/BkoJm51WPd2MKLkPnJuSzLj4vkH6A8NUqrK660dcubqzaz5zpF9e9bmHMDg0RVMvjKByRvjdMo/cP7CmkzJ07vlsl/QTm1rr6bkuPU59BOETqn/hgBwX0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzL6xzXwLVyK/hlMXhQWdTKw+vjbA8htIstcqj32a4E=;
 b=CBls6z4pX2YLgMtGizEsZ9JcYBrKiOhrXKP/M88CZYYdKIiyB0UFbOqBPgVGi9rbM71YiVS3qY6+tCCUZQOKv8f4IETGrbRoOHY1ydiFyHdSxjSGco6MoHAmeCY/fNaXWC0c1VhvigoK/fqYpxJVFiaRykoc1IWf9KcC9zAJC61byl2oywUx93xleU44Ovxvx/GQBpCC1V2vQIo2HnK0WUtSyQvpjWeZpf6lKk1Ix+pehg+DcCeHI68rCpS++SDeKwtdlRYmmpGykY1Z+1zF0+ZlNFhxgOjT+4QhsbYxXl93FDj99CL2DtWgCz+Iz1Ahwxa2XwY+/EVgGaqnGVSlwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by CYYPR11MB8388.namprd11.prod.outlook.com (2603:10b6:930:c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 30 Jun
 2023 07:40:49 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::9358:a28d:ae08:7ab8]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::9358:a28d:ae08:7ab8%4]) with mapi id 15.20.6521.026; Fri, 30 Jun 2023
 07:40:48 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     "Ye, Xiang" <xiang.ye@intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        "Matthias Kaehlcke" <mka@chromium.org>,
        Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Zhang, Lixu" <lixu.zhang@intel.com>
Subject: RE: [PATCH v5 1/5] usb: Add support for Intel LJCA device
Thread-Topic: [PATCH v5 1/5] usb: Add support for Intel LJCA device
Thread-Index: AQHZVRWD5foyHxgwkkK9uWFVvb93r6748VqAgAD7YwCAAAlegIAAdbQAgAAEFwCAASG9gICoCqlw
Date:   Fri, 30 Jun 2023 07:40:48 +0000
Message-ID: <DM6PR11MB43163C9D76023777B36380B98D2AA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <20230312190435.3568212-1-xiang.ye@intel.com>
 <20230312190435.3568212-2-xiang.ye@intel.com>
 <20230313170341.GV9667@google.com> <ZBAqTqZEDz/vAwVC@ye-NUC7i7DNHE>
 <ZBAyKQwnQ8fxHRuU@kuha.fi.intel.com> <ZBCU5h/A2woJLtvT@ye-NUC7i7DNHE>
 <ZBCYVNmoo2EdDY90@smile.fi.intel.com> <ZBGLYXxpkwokgV4R@kuha.fi.intel.com>
In-Reply-To: <ZBGLYXxpkwokgV4R@kuha.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|CYYPR11MB8388:EE_
x-ms-office365-filtering-correlation-id: c90bd5c8-2d9c-447b-21b7-08db793d524c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MDT5+B3Cn4QMFCCLQ1+VGjbs2bSvfgKxhZUEpwbfidpYuPbL1sC7aaw4frhIJ/GM5PHctOo52WQgeyH3PgO7vXNr6AmDlfKxD9u+LrdcheUeWCGkR8ETcHnLJXj/nFV5KnfrNa6DaR+dsd0Mt3+dRkScKfiKCcVrfqwb8Dd4D0w1UM4BewatVoeN4rvH+/XDzv+2bveFMV0stMANhrlXUMaENxHhx3fuTZTNBQy6NRX7CGDdeKyIIxLHKOLXVbt8J1gI4UTxJeFZP/jI38Y7zvjQBP5LSZEyyLBpVS2z1DVwoyvdZycozGVC+cWdKTBMDnb99TlcUjm4MlGorkYBHJEPbKILnMdNS9zLZR2Ks6fSDjkqYU/yfUBgAh/WfRUnQNkaklhSHruKUKjdQ0nYnXXv/ogjIYB/GHjCZ6T1u+/2PKq8Mn5x1J50DUfC6eKWXQZ4PpYHSNv8HYPhTS8sAW1sF7qSQlxmIfPxny42G6EpLa+EJ9MSN47a3XoZJ+VuG2ET+JLUzWu4Bdw8108rDCCEBD17JjzZ6o3rfCOMfVRd8fLAPAxJo6MxVU3w6IokxWSuP/4/teGIa6E7YrVz3A+WNWf17aTE5E/TDg2KVzjff+prqw0VgL9sAH9lggae
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(2906002)(186003)(55016003)(7696005)(71200400001)(122000001)(86362001)(9686003)(38100700002)(83380400001)(82960400001)(6506007)(110136005)(41300700001)(54906003)(38070700005)(26005)(478600001)(316002)(76116006)(66556008)(66446008)(4326008)(66946007)(33656002)(64756008)(66476007)(7416002)(5660300002)(52536014)(8676002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6CU8VJ1VffSUwF4O76qGcWYxKdFaCwr4/R41GNHAuaIRkx3KDdG0+/3MZRg7?=
 =?us-ascii?Q?wxCECxLukDsN/ePZmID1ob0Mpo2KM1RIiaaGJHAln0Mv1mKoyQTWX4grIGEn?=
 =?us-ascii?Q?xBAN+N9WXY9VQCOEognJk6yhwlb5au/yLsJtgRVKaA0PUwa7PZs7nFcFHmcM?=
 =?us-ascii?Q?d24Lhff6yGtdUbJZOcwOFEclDZ6tef9MGOQPEZLNJL9glojcf1DI/pDCbtrd?=
 =?us-ascii?Q?WKxPphUKVeCOBv5BJ9flH0NyIV8wALRW8Wz60cvH5kVXNBD+ee2+XetaxB1A?=
 =?us-ascii?Q?I8ngChFhxea4nyit/JPOMiJtwqTKPkLIXF9E8QlZPnRlCDcfUHg25AXHHD2w?=
 =?us-ascii?Q?Y4SMpxJO2E2G4UFZ1g1898UeaHlkTWEEuuBjF0td9u4Wjuz2U/1FexDbFsjc?=
 =?us-ascii?Q?Izs/fWz9p3/RAcym10V2NUwGKSxkVIN1pW5vewjDN/4fbF42tLSwa4nOo+7A?=
 =?us-ascii?Q?YLy8gq5BdF/IBB4RNdpsP6lAcmKDr3Dtw9wn/eyz24J6NXZFpjorbwBsODpb?=
 =?us-ascii?Q?R7BKA7nK3zEVlW36ledUSwGwnzs+hCmXa/UdKElV4WArjhE69wiXFibA/ijS?=
 =?us-ascii?Q?RgLYMrD2N4TJB+IOfMA7Xp4SycsKIgNdiBONqGKfGCl1C1KOZoyfGADQry64?=
 =?us-ascii?Q?imwiSdhaZ3wzJYlPSOoDH9qcWnn8X7cc5FldzZRm2yA9NRahelLqI+gL/KJf?=
 =?us-ascii?Q?Zq6reaTT+PjtmhnmdCjSmHhQ0csjx211f+gAjZm8WoyoCn1erDW8CkCp2ESv?=
 =?us-ascii?Q?5KQEcYxes9nIiqg/S5RXO58QWtgRqbWWpPrHz1mg3Kx7ORyN0svbqObE/nFm?=
 =?us-ascii?Q?SGr5HnMhYndaqFMpgm0qR7LxeUVAY/ea2q6l/l/FWRPyiN1wy+2aK39XGhwc?=
 =?us-ascii?Q?AfyB3wmLXULeuYMeqd/wsIbq+wiGViTNAOTST71Chtco+iS+i/Qkzc6yKC+4?=
 =?us-ascii?Q?SbUm8bMumlMLj3ZerCwxpO4x9IvWX4snueeWl1+n22Pr6+baclWMWh9weTNg?=
 =?us-ascii?Q?mYgyqfusI0mh4EYjYUw2fPVVLimv4dAMLSxwBmh1n5pALsvzQamDM1h4fpQt?=
 =?us-ascii?Q?/nCHW1Wg9R0tK5o29InP11Fr84uUdXJMcOafyLm0spcA75t8UZYYTokHTy6Q?=
 =?us-ascii?Q?c9fQzXIZrTX30XyysdVQpIbXAqAHgQVbWMW9XvPpsKAvgYr0ZDXH8M9943IM?=
 =?us-ascii?Q?/VBAAwmoV3RdqgqK0HD5DVFvi+MqUKI0WdzJik+tmr3iHr4ST/8qMf+tkW5C?=
 =?us-ascii?Q?sQ0NZ85RYlsWpAWKmxVccIXqgetKxRj7h2IJFIzPmDjtmZIS2x+EUzvRqzaA?=
 =?us-ascii?Q?1VfEMxVJF1LBfq36vNqEJ3/9tlvV8Sj+Z9akVIli9DeaZUBVIyopuFBHMWq4?=
 =?us-ascii?Q?aQN4pT38sLV7Uyc9ylczeZtxV9SidU8JpkRs51E0eV21p7m7D1GxUfFlrsi4?=
 =?us-ascii?Q?tDS4gfOVeNiBB/4B3kF87naUSgNA/ptChElBouUJwo76IP5NcWXr7QM7ryAh?=
 =?us-ascii?Q?IZ8PojWHPxMLqDAZQI8x3TcJFVnOOcR+utX0g5W1TU2NzZQOruKx3RIufvRi?=
 =?us-ascii?Q?+eWOte+/MZ+vfJNGXOyiOFSnbNInBQKInoPHMftH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c90bd5c8-2d9c-447b-21b7-08db793d524c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2023 07:40:48.3648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jxtKSvEB7KB+H4Ut3gbP3Tgu2A+tqJcDX0uPaJUVGRsSdt4bMI2CZVfc96NOUlOKF1O7pPL80S28bk23W4zsAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8388
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Wednesday, March 15, 2023 5:10 PM
>=20
> On Tue, Mar 14, 2023 at 05:52:52PM +0200, Andy Shevchenko wrote:
> > On Tue, Mar 14, 2023 at 11:38:14PM +0800, Ye, Xiang wrote:
> > > On Tue, Mar 14, 2023 at 10:36:57AM +0200, Heikki Krogerus wrote:
> > > > On Tue, Mar 14, 2023 at 04:03:26PM +0800, Ye, Xiang wrote:
> >
> > ...
> >
> > > > You don't really seem to get any benefit from MFD. Perhaps it
> > > > would be more appropriate and clear if you just registered
> > > > auxiliary devices in this driver. Check drivers/base/auxiliary.c.
> > > Yes, it should be a work. I have a question.
> > > MFD provides the ACPI binding for sub-devices through struct
> > > mfd_cell_acpi_match. But I didn't see this in drivers/base/auxiliary.=
c.
> > > If using auxiliary bus to implement the LJCA sub-devices, we need to
> > > do the sub-devices acpi binding manually in ljca.c.
> > >
> > > Something Like:
> > > adr =3D LJCA_ACPI_MATCH_GPIO
> > > adev =3D acpi_find_child_device(parent, adr, false);
> > > ACPI_COMPANION_SET(&pdev->dev, adev ?: parent);
> > >
> > > Is that acceptable?

This actually doesn't work, look at the acpi_find_child_device(), it compar=
es the
bus address specified by _ADR object, but there is no _ADR object in DSDT f=
or
these three devices because the relationship between the parent and childre=
n
isn't bus type listed in ACPI spec, so it always return NULL.

BR,
Wentong=20

>=20
> Looks ok to me.
>=20
> > Maybe you can implement this on the level of auxiliary bus.
>=20
> I would actually prefer that the auxiliary bus itself does not make any
> assumptions regarding the whereabouts of the fwnodes at this stage. Maybe
> later, when(if) there are more users.
>=20
> thanks,
>=20
> --
> heikki
