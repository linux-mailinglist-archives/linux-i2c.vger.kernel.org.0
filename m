Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD387BB899
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Oct 2023 15:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbjJFNIH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Oct 2023 09:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232118AbjJFNIG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Oct 2023 09:08:06 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7355B83;
        Fri,  6 Oct 2023 06:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696597684; x=1728133684;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lu3e0FNamOQIjdtlMpvhnd5AF9E83sQ3P9/L1ilJQYc=;
  b=LLtSnAWHoFrUGj2kWSsNpI7Hob65rxym1UivEhf3wL6kokdffK2D3g4P
   Yl8pDMg4ZzQgq0VRYHSUewMx2JbezPrkN8TAgr0+rkeBhc2X4J85NvSzL
   U4kU5GgFHs20KB74zNX8ojTAEJkvambIhqUqU6ZytNF/9lJ5fItr+Vok7
   k9n2sK+vm/6Pfesfrs0OVgP6h3ndCei28cdJLp3CEto5AWUFV7I3Q7e1l
   dVxbvW4j9jfjYAV4Lt5Ki/mRENVDg9UVIIrddm6WgMKhqIJwlIC3eFaRd
   lKq3z2B+Nep7pFYiNsTBizg7wlC3lxtcZt0NncbAM4B6lTj+ixazoigeo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="2350765"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="2350765"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 06:08:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="842836479"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="842836479"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Oct 2023 06:08:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 06:08:02 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 06:08:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 06:08:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 06:08:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qg4faZnkXQRD/y6nOWLoaq0gi097lWG8MGLl5xd61s4GluHbR7TMELoJVy7YHdX71z4fgqINMEghnJYbAEjhcfZ2OPm9K309NQCQmmkVgYDqtv1jXWHNfgTFVzGvsk5iSFGm1StzCwQlhZqGrmSqy+bQX5A1KyZJRdjolGxpdt8VcHitBSNz3cutWA0UcWa9jHpMsYD1zJ7oY36yz8jQns0DQUzEtZo+MGGFayjCCFZmp1zBRCAsEG/ND9PFYj9pOyseTLBOhZHMjFFzQrNoOviW6oalDd5qZEpuYQQiYmMgL/x29TCGoz8kExOOOEkOQo1HXI81Wf0/4sijiJujIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+88lrFHbFv7aoxy7eJwbeqqbx+QL6urDW+iRs5BRQmA=;
 b=mFNfgwqlijbNDv/qq7dB+08uQyxrJ/gRn+oOBFNQL5BA+8NcP2pKgB7crI49JB/ELIuXq5NvHALAQYJ6si62BcriUSYBpnw9P43dQ3LDZu/YgMLzmsdJEVma1Zl57igNn1bVwr4Rc2+72YnPMAvJL1HH9JK+3kFc1doSjjUUqbRbWlwfMoGLjoL8hHXJ1Hgu6D5Of02BwemXwBg7L162SJToQakftcrM8vvNZK5Rq6xD6qWje7wDE81cO1LIagmhunp3fSMv3px/Bn72sKv8lt3NBz30wkojPdcc1cDHrM7ed5uWV+TkM1R7NzBYqWS/c+4qRBTQU5OrG6osvlLxrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DS0PR11MB6447.namprd11.prod.outlook.com (2603:10b6:8:c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 13:07:59 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 13:07:59 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
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
Subject: RE: [PATCH v19 1/4] usb: Add support for Intel LJCA device
Thread-Topic: [PATCH v19 1/4] usb: Add support for Intel LJCA device
Thread-Index: AQHZ6M8oxqIjIiIdxk2dZoehwR11grAwYLSAgAFHNNCABM4egIAA5ZtggAV+OtA=
Date:   Fri, 6 Oct 2023 13:07:58 +0000
Message-ID: <DM6PR11MB4316C52DE705E7384104202A8DC9A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <1694890416-14409-2-git-send-email-wentong.wu@intel.com>
 <2023092857-atrium-scared-b624@gregkh>
 <DM6PR11MB4316E03DA12320D62995F15B8DC0A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <2023100229-immodest-cattishly-2ea1@gregkh>
 <DM6PR11MB4316BCF3E25A54F7EB5E331C8DC4A@DM6PR11MB4316.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB4316BCF3E25A54F7EB5E331C8DC4A@DM6PR11MB4316.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|DS0PR11MB6447:EE_
x-ms-office365-filtering-correlation-id: 6b3f9233-da33-4edb-6d40-08dbc66d438c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zb0LxHkeFSnZDPSR56G78ks6i4AjDQ2HCjyfh6Yrc+/+m9+FYWeyfrNfOY59WOfWOr8EH49FAmyExk1wbI371rjdI783N9ikqElnDkNAJkrBqdITVzuZAUcCr5bn6XMoK2BKWy/vJhG86h0W1ZglU8eBTbJg20sMW2zL6APR434AFQ3LRFQCzBUUMneHvl210LMJ2hDoHVVnfoLJM/vs5GoBabVQvdBpebRb9vTzhhBwxwWMHh7U0ExDowmcxq5t8LdQrQhAiqxLmQOvqpp/4ft9QwwU0oxjN4Pz3Ht7YVp6rah8mDbKv9hc0BjNOGK8+bVcgw9hjkt2VrW5k4VEMI7PyBYPFAzvHxMQGGwk1E9hqkCIssgT5ohb6N3WAJ4svN6sYYxfnwDz8slDOYh4zRsyHXay51rcggeT55yLxn+VjvrKYXh4BPk2VMD1GHgw+JYwOV6AQo+QxKoZVo9XB2paUJO3iX2NqeyB6+Kc5pTZckVnZBM27TQ2j46upyxqIfuoH7j8ck/Tcw+ixpsrESV1wT+yvvnXxtLTDiW9P1rrG+mdP5mHGPDlH3Uu08U2lKgGtUoZJ75u1dBapWB2xjRIh96FjRiurJ2MCt8iU6/VW+dIWPE91S1NP8INRACK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(83380400001)(478600001)(55016003)(33656002)(122000001)(9686003)(82960400001)(6506007)(7696005)(26005)(71200400001)(38070700005)(38100700002)(8936002)(76116006)(8676002)(66946007)(54906003)(64756008)(66446008)(66476007)(66556008)(7416002)(4326008)(86362001)(41300700001)(2906002)(316002)(6916009)(30864003)(5660300002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HTIPx6p5hug7E4yfAbv/VqgW9TJNKPYDMnl38/krwubBmdacJGe8zN67q2KG?=
 =?us-ascii?Q?WnQfmFsmNgrtA3PYzrmhwFWcpXGgldOcGlu28gr7F9oDTF0Z1BVDtMXmltNQ?=
 =?us-ascii?Q?QkbUXAxG/2gtixM9VvNg7hQ2R8gV9uFWeNoZSNu9TSYrfEOnkwSdYxdEuZRy?=
 =?us-ascii?Q?5JEIRJJoIFmkPVXgRU6VDY5A1le6O1VyYjzqqywDhrOnBbVSUV8y+KiRHBXF?=
 =?us-ascii?Q?GgIiUPijP9MUAqltjeuVUK3WKz7qnUK+0O1A82/rQDlSgQBClamtVR+Gbvin?=
 =?us-ascii?Q?5JqijQJ9tqN1Zd8ze2Apa5//KBZppFfdnzp4aWRFwXqQmUctaPfBrcMqB5BZ?=
 =?us-ascii?Q?Djb0r+SFFBOgaEK0V+ToXGqZvnMwgNzhF+BpS4lca+XvweNecMuwdOlTiHXI?=
 =?us-ascii?Q?BkxDhAVU3899P/0ATzg+T3qSxg/kzaCVfd4POpbBjvwLWrTU5dkAa8sznm3y?=
 =?us-ascii?Q?48i5SKzkMEhwaGVwk344+3EodkJDT796tVSNpBi84QU+uwiMLYK5RKsa/qps?=
 =?us-ascii?Q?8mDXCqp6qLNsiIl73EgQyVEWIURHuKH1hpXSksJvcIWZrwUT8A6gTIGOv39r?=
 =?us-ascii?Q?nYNmiI0zzlgE6kSclcz0Y8B6/3sOZs1Q1bIRM10UapiIfWYjA52SW0RaO980?=
 =?us-ascii?Q?gDb5CUZj9U6Na06AiLagpyPnlvAHshPj7rZ48ahVoUFNlQxGOHmgf74aXT3F?=
 =?us-ascii?Q?LUq8dcu8jHZ1kd+RZhg4QBOXOPBjn9s0pP8U6KV4kyyT4IyS5+7/N/3LlC8l?=
 =?us-ascii?Q?og8/0Zm0t7wjEkYS8+3l8gyP09Tro/Lk0MidWnnb7Uyji8APEAGPfcoQiqjL?=
 =?us-ascii?Q?RhyvJVIN5oJT7JkWL8R1aFcHxevbwhjI/MaligoyxiQ7TWXVkODbmw/dmAZM?=
 =?us-ascii?Q?mqe5X9KPASLNtT+NyYam9rL07FByy7klkr2k+cQDnSnmteFsn1fnyatPfB0U?=
 =?us-ascii?Q?B41eBpFC2mSd0hi8CngWwhsbZxV+GDJLINxE9PXVn6XeJLBbZ9WGk1p+1RFd?=
 =?us-ascii?Q?KVaJG9Z9VmI8M2FC3ZQfuYdGPBY6/ye/sK8LpK2tkdmwwcwW/eWTpKIbHN0I?=
 =?us-ascii?Q?NVBi7iLmh9uX97AisrDDl+mRY4W+VsZhHyqlzLvlzxVfMFBrNHz5XQAkjDJX?=
 =?us-ascii?Q?LCy1f3EJpj5kMKxEIkCysAEsN2Ybv1VyLOQgSqKqjoVUTy7GadT9nQgjl2GD?=
 =?us-ascii?Q?JVuVAKZPpi+pmdlXWg48tkR8VViNfmcqbIxDyazDNYFqEcfBK0rgltk7vdry?=
 =?us-ascii?Q?f06diEhtRyw9AG1ICi43Eo6uqCZYAHtPdRUHSDeBoHFpNCQ/QcSuxducE8Vt?=
 =?us-ascii?Q?zhv5xQ2KDAlUK9yvhpI7MmShMOUQZlCu0R+n0FO8VcrAzeLEsE+eccdUeQ6g?=
 =?us-ascii?Q?yYhe/dOFSBgf7xC9weKSquuK25H2/I+SapI8WZR/KCdjNVCx6ZIUAuOTrjVI?=
 =?us-ascii?Q?y5HUE0uUjpdq3zWavvYAz2sGw6TMz+WTMrRUm9w+4Z0oGNPFqokW4WzxXfKT?=
 =?us-ascii?Q?OnHMEYXwILUMCOL+gBTyYrASyG0U8tH3EnJGBiA98xb2N6O7EEX8U43R43xB?=
 =?us-ascii?Q?KMZo/+xmMXlCVcWxuv8tYX2G4FMUDauyGvChUZtW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3f9233-da33-4edb-6d40-08dbc66d438c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 13:07:58.9982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XQ0TNL7awoRYq5ySLCGLfoPWyjY76t268VnpUdAR0tNjpOunhw1AdMCIa8Qm4rwKxEyR1pKUGAgI8ifyygZ1PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6447
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> From: Wu, Wentong
> > From: Greg KH <gregkh@linuxfoundation.org> On Fri, Sep 29, 2023 at
> > 11:31:21AM +0000, Wu, Wentong wrote:
> > > > From: Greg KH <gregkh@linuxfoundation.org> On Sun, Sep 17, 2023 at
> > > > 02:53:33AM +0800, Wentong Wu wrote:
> > > > > +static void ljca_handle_event(struct ljca_adapter *adap,
> > > > > +			      struct ljca_msg *header) {
> > > > > +	struct ljca_client *client;
> > > > > +
> > > > > +	list_for_each_entry(client, &adap->client_list, link) {
> > > > > +		/*
> > > > > +		 * FIXME: currently only GPIO register event callback.
> > > > > +		 * firmware message structure should include id when
> > > > > +		 * multiple same type clients register event callback.
> > > > > +		 */
> > > >
> > > > When will this be fixed?
> > > >
> > > > If not now, why not?
> > >
> > > Actually this doesn't impact current functionality because only GPIO
> > > register event callback, but from coding perspective it should add
> > > the id in the message structure. This fix should be done by firmware
> > > first, but many products have already been running the firmware,
> > > it's not easy
> > to update the firmware.
> > >
> > > Can I just remove the 'FIXME' and leave the comment here?
> >
> > If you are never going to fix it, it does not need a FIXME, right?  :)
>=20
> Thanks, I will remove 'FIXME' here.
>=20
> > > > You control both of these types, why aren't they the same type to s=
tart
> with?
> > > > Why the force cast?
> > >
> > > The len of header is defined by firmware, it should be u8 type. But
> > > the ex_buf_len is passed by API users, I don't want users to do the
> > > cast if their buffer is large than 256.
> >
> > Then fix the api to use a u8 as obviously you can not handle more data
> > then that for now.
>=20
> Ack, thanks
>=20
> > > > Do you really need a scoped guard when you can not fail out of the =
block?
> > >
> > > The scoped_guard is required by you with "Why not use the
> > > functionality in cleanup.h for this lock? Makes this function much
> > > simpler." If I understand correctly, so I use the scoped_guard where
> > > I can to
> > make things simpler.
> >
> > But that's not making anything simpler here, cleanup.h works well when
> > you have error paths that would be more complex without it.  You do
> > not have that here at all now (maybe you did before?)
>=20
> I'll remove scoped guard
>=20
> >
> > > > Why do you have both a mutex and spinlock grabed?
> > >
> > > The mutex is to avoid command download concurrently
> > >
> > > The spinlock is to protect tx_buf and ex_buf, which may be accessed
> > > by tx and rx at the same time.
> >
> > Please document this somewhere.
>=20
> Ack, thanks. Below is the kernel doc for struct ljca_adapter where we hav=
e
> spinlock and mutex document.
>=20
> /**
>  * struct ljca_adapter - represent a ljca adapter
>  *
>  * @intf: the usb interface for this ljca adapter
>  * @usb_dev: the usb device for this ljca adapter
>  * @dev: the specific device info of the usb interface
>  * @rx_pipe: bulk in pipe for receive data from firmware
>  * @tx_pipe: bulk out pipe for send data to firmware
>  * @rx_urb: urb used for the bulk in pipe
>  * @rx_buf: buffer used to receive command response and event
>  * @rx_len: length of rx buffer
>  * @ex_buf: external buffer to save command response
>  * @ex_buf_len: length of external buffer
>  * @actual_length: actual length of data copied to external buffer
>  * @tx_buf: buffer used to download command to firmware
>  * @tx_buf_len: length of tx buffer
>  * @lock: spinlock to protect tx_buf and ex_buf
>  * @cmd_completion: completion object as the command receives ack
>  * @mutex: mutex to avoid command download concurrently
>  * @client_list: client device list
>  * @disconnect: usb disconnect ongoing or not
>  * @reset_id: used to reset firmware
>  */
> struct ljca_adapter {
> 	struct usb_interface *intf;
> 	struct usb_device *usb_dev;
> 	struct device *dev;
>=20
> 	unsigned int rx_pipe;
> 	unsigned int tx_pipe;
>=20
> 	struct urb *rx_urb;
> 	void *rx_buf;
> 	unsigned int rx_len;
>=20
> 	u8 *ex_buf;
> 	u8 ex_buf_len;
> 	u8 actual_length;
>=20
> 	void *tx_buf;
> 	u8 tx_buf_len;
>=20
> 	spinlock_t lock;
>=20
> 	struct completion cmd_completion;
> 	struct mutex mutex;
>=20
> 	struct list_head client_list;
>=20
> 	bool disconnect;
>=20
> 	u32 reset_id;
> };
>=20
> > > > Why are you not verifying that you sent what you wanted to send?
> > >
> > > As I said, the actual_length is the actual length of data copied to
> > > user buffer instead of the length of what we want to send.
> > >
> > > And even for verifying the length of what we want to send, the max
> > > length of the message is sizeof(struct ljca_msg) +
> > > LJCA_MAX_PACKET_SIZE which is less than the endpoint's max packet
> > > size, so I don't check the actual sent length in above usb_bulk_msg()=
.
> >
> > But you need to.
>=20
> Ack, thanks.
>=20
> >
> > > > When you call this function, sometimes you check that the function
> > > > sent the proper amount of data, but in many places you do not, and
> > > > you assume that the full buffer was sent, which is not correct.
> > > > So please change _this_ function to check that you sent the proper
> > > > amount and then the caller logic will be much simpler and actually
> > > > work like you are using it in many places (some places you got it
> > > > right, some wrong, which is a HUGE indication that the API is
> > > > wrong because you wrote this code, and if you can't get it
> > > > right...)
> > >
> > > As I said, the return value of this function is the response data
> > > length instead of sent data length. And in this patch set, every
> > > caller has verified if the response length matched with the sent comm=
and.
> >
> > No, I found many users that did not do this.
>=20
> Ack, I will check more, thanks
>=20
> >Please make the api easy to use, right now it's not.
>=20
> I post the new ljca_send() here to try to address several comments.
>=20
> First it changes the type of buffer length to u8, second it checks the ac=
tual sent of
> length usb_bulk_msg(). It removes the scoped guard as well.
>=20
> And below gives an explanation of the parameters and return value.
>=20
> The parameters(type, cmd, obuf_len) are used to construct message header,=
 obuf
> is used for message data. And ibuf and ibuf_len are for response buffer a=
nd buffer
> length passed by API users. ack indicates if the command need an ack from
> firmware, timeout is timeout value to wait command ack.
>=20
> And the return value is the response copied to response buffer passed by =
API
> users, normally the users know how large buffer they have to pass to this=
 API, but
> from coding perspective we should check the passed response buffer
> length(ibuf_len) and return the actual copied data length to the buffer.
>=20
> Hope that helps, thanks
>=20
> static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
> 		      const u8 *obuf, u8 obuf_len, u8 *ibuf, u8 ibuf_len,
> 		      bool ack, unsigned long timeout) {
> 	unsigned int msg_len =3D sizeof(struct ljca_msg) + obuf_len;
> 	struct ljca_msg *header =3D adap->tx_buf;
> 	unsigned int transferred;
> 	unsigned long flags;
> 	int ret;
>=20
> 	if (adap->disconnect)
> 		return -ENODEV;
>=20
> 	if (msg_len > adap->tx_buf_len)
> 		return -EINVAL;
>=20
> 	mutex_lock(&adap->mutex);
>=20
> 	spin_lock_irqsave(&adap->lock, flags);
>=20
> 	header->type =3D type;
> 	header->cmd =3D cmd;
> 	header->len =3D obuf_len;
> 	if (obuf)
> 		memcpy(header->data, obuf, obuf_len);
>=20
> 	header->flags =3D LJCA_CMPL_FLAG | (ack ? LJCA_ACK_FLAG : 0);
>=20
> 	adap->ex_buf =3D ibuf;
> 	adap->ex_buf_len =3D ibuf_len;
> 	adap->actual_length =3D 0;
>=20
> 	spin_unlock_irqrestore(&adap->lock, flags);
>=20
>  	reinit_completion(&adap->cmd_completion);
>=20
> 	ret =3D usb_autopm_get_interface(adap->intf);
> 	if (ret < 0)
> 		goto out;
>=20
> 	ret =3D usb_bulk_msg(adap->usb_dev, adap->tx_pipe, header,
> 			    msg_len, &transferred, LJCA_WRITE_TIMEOUT_MS);
>=20
> 	usb_autopm_put_interface(adap->intf);
>=20
> 	if (ret < 0)
> 		goto out;
> 	if (transferred !=3D msg_len) {
> 		ret =3D -EIO;
> 		goto out;
> 	}
>=20
> 	if (ack) {
> 		ret =3D wait_for_completion_timeout(&adap->cmd_completion,
> 						       timeout);
> 		if (!ret) {
> 			ret =3D -ETIMEDOUT;
> 			goto out;
> 		}
> 	}
> 	ret =3D adap->actual_length;
>=20
> out:
> 	spin_lock_irqsave(&adap->lock, flags);
> 	adap->ex_buf =3D NULL;
> 	adap->ex_buf_len =3D 0;
>=20
> 	memset(header, 0, sizeof(*header));
> 	spin_unlock_irqrestore(&adap->lock, flags);
>=20
> 	mutex_unlock(&adap->mutex);
>=20
> 	return ret;
> }
>=20
> > > > Are you sure this is a valid uid to use?  If so, why?  What
> > > > happens if this gets set to "0" for multiple ones?  Don't
> > > > underestimate broken firmware tables, but also don't paper over
> > > > problems in ways that will be impossible to notice and can cause pr=
oblems.
> > >
> > > This actually has been discussed in previous email as bellow:
> > >
> > > some DSDTs have only 1 ACPI companion for the 2 I2C controllers and
> > > these don't set a UID at all. On these models only the first I2C
> > > controller is used. So if a HID match has no UID use "0" for the HID.
> > > assigning the ACPI companion to the first I2C controller.
> > > An example device with this setup is the Dell Latitude 9420.
> >
> > Then document this really really well in the code itself, otherwise it =
looks
> broken.
>=20
> Ack, thanks, I post the new ljca_match_device_ids() here, hope that helps=
, thanks.
>=20
> static int ljca_match_device_ids(struct acpi_device *adev, void *data) {
> 	struct ljca_match_ids_walk_data *wd =3D data;
> 	const char *uid =3D acpi_device_uid(adev);
>=20
> 	if (acpi_match_device_ids(adev, wd->ids))
> 		return 0;
>=20
> 	if (!wd->uid)
> 		goto match;
>=20
> 	if (!uid)
> 		/*
> 		 * Some DSDTs have only one ACPI companion for the two I2C
> 		 * controllers and they don't set a UID at all (e.g. Dell
>  		 * Latitude 9420). On these platforms only the first I2C
> 		 * controller is used, so if a HID match has no UID we use
> 		 * "0" as the UID and assign ACPI companion to the first
> 		 * I2C controller.
> 		 */
> 		uid =3D "0";
> 	else
> 		uid =3D strchr(uid, wd->uid[0]);
>=20
> 	if (!uid || strcmp(uid, wd->uid))
> 		return 0;
>=20
> match:
> 	wd->adev =3D adev;
>=20
> 	return 1;
> }
>=20
> > > This is to be compatible with old version FW which does not support
> > > full USB2xxx functions, so it just warn here as this is.
> >
> > Why do you have to support obsolete and broken firmware?  Can't it be
> updated?
>=20
> make sense, and probably they have to update, thanks
>=20
> > You warn, yet return success?  Again, that doesn't work well as you
> > never know if you need to unwind it or not.
> >
> > Either report an error and handle it, or don't, but what you have here
> > looks broken as-is.
>=20
> Ack, it should report error and handle it. Thanks, the function will be l=
ike below:
>=20
> static int ljca_enumerate_clients(struct ljca_adapter *adap) {
> 	struct ljca_client *client, *next;
> 	int ret;
>=20
> 	ret =3D ljca_reset_handshake(adap);
> 	if (ret)
> 		goto err_kill;
>=20
> 	ret =3D ljca_enumerate_gpio(adap);
> 	if (ret) {
> 		dev_err(adap->dev, "enumerate GPIO error\n");
> 		goto err_kill;
>         	}
>=20
> 	ret =3D ljca_enumerate_i2c(adap);
> 	if (ret) {
> 		dev_err(adap->dev, "enumerate I2C error\n");
> 		goto err_kill;
> 	}
>=20
> 	ret =3D ljca_enumerate_spi(adap);
> 	if (ret) {
> 		dev_err(adap->dev, "enumerate SPI error\n");
> 		goto err_kill;
> 	}
>=20
> 	return 0;
>=20
> err_kill:
> 	adap->disconnect =3D true;
>=20
> 	usb_kill_urb(adap->rx_urb);
>=20
> 	list_for_each_entry_safe_reverse(client, next, &adap->client_list, link)=
 {
> 		auxiliary_device_delete(&client->auxdev);
> 		auxiliary_device_uninit(&client->auxdev);
>=20
> 		list_del_init(&client->link);
> 		kfree(client);
> 	}
>=20
> 	return ret;
> }
>=20

Hi Greg,

Could you please share your comment about this? If no more comment, I will
sent out next version patch set. Thanks

BR,
Wentong

>=20
> >
> > thanks,
> >
> > greg k-h
