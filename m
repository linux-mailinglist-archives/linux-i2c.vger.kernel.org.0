Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28B6D7B5F23
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Oct 2023 04:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjJCCv3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Oct 2023 22:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjJCCv2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Oct 2023 22:51:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FBBE9E;
        Mon,  2 Oct 2023 19:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696301484; x=1727837484;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hSHprvaqzLf9DUXDYxtJbL7Ks9jdLFxmbDimm4cw5zM=;
  b=m3LPRpPJsxSkemKQLsxTG8759Emp9zo0KkpxyHow4pEd+IBF0V7H11AG
   P3gBe3JicqfFgFogzxos15VrLCcvcGoLEv67qgmi3PGEe174/OO2iJTSg
   u+QMVQY4dSAVSojwyFWN9AbLt7+tq5MOqhnurIbczWrNizwEFJ6uhUoAT
   kCIYdIuVcu4fzk4Gd9a159k3iprIEZ16Oz4YaLDEsYcgXuD59uzei+fl+
   hwvuURb/J4vSbwIEm3RjXkWEmUMh70bzhGHcLNf605UmVWe605dpgb6ji
   TnsyrLumVkLF3GUlX1jAtBBfQRuaW7ZAgJqB9HDmJtrc47jk1pIh1JMjs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="382693013"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="382693013"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 19:51:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="924488620"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="924488620"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Oct 2023 19:51:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 19:51:20 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 19:51:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 2 Oct 2023 19:51:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 2 Oct 2023 19:51:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPKj4Y+fZZgzgUc37deK8M+YJQHAzTz/dNMl4xEVldEltOv+kX4pWN2tq8fjquSKqksgkMXfxzuRqb22tIjpaSyJVn9tz7+nKGRclHdBYAUibuKbN336uk0eqHN2YfkiuOumh+EBTGjlAEFF5RkPBaddaNU63dsfvN1sqDiqIidIYKZ1U9Ys35UiddgP0oJF9rlz2xYyoY25CdeDgOlmRrh8k//AjS6mK6oz/Qf+b4NjgLKduxOylhveO4t7zdQ4ZlH+0AttDtf3z2Cv3G7r1414us4Y642v9NCc8Oyf1IAx7K31+cck2B7sUmwbcxrau80+Ecku7uLLaWn7czrNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGADJ2+M9DQbNSTKij7fV71pUJHSifu91xk10aPGbf4=;
 b=BNWw6/S1jh2k9SOMfsiNhlvhPZvkTZkQCva8Rv6e1Bt7CXEqz3S6pMSqsrZJHLouD+UX4f4LfYIZgzCfz84ZjPtbzysNApATC9t1xgEEtfQrshS/G8XW+COYv+pQ8z3pAhNqua0Pv5aiwa8PqoIVjR86JBlAcce8YTlYUaGTcPPhoZ5HvytrYjNBk0aHQ5ajZ630g9MMj7QDCPUyluyufjCZvdcZE3288LVCFtpzJuyQ8+D+ehNjTQUxoQSJ7WGP3+1SHPE5nccRk4CYgrqLA/8iCyGr9BaMk0y58E1pXdkwWepFzhzT4YSfqoxeNRE+q/K5Ye03wqb/1rZ4KOqxMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by SJ0PR11MB5771.namprd11.prod.outlook.com (2603:10b6:a03:424::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Tue, 3 Oct
 2023 02:51:18 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 02:51:18 +0000
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
Thread-Index: AQHZ6M8oxqIjIiIdxk2dZoehwR11grAwYLSAgAFHNNCABM4egIAA5Ztg
Date:   Tue, 3 Oct 2023 02:51:18 +0000
Message-ID: <DM6PR11MB4316BCF3E25A54F7EB5E331C8DC4A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <1694890416-14409-2-git-send-email-wentong.wu@intel.com>
 <2023092857-atrium-scared-b624@gregkh>
 <DM6PR11MB4316E03DA12320D62995F15B8DC0A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <2023100229-immodest-cattishly-2ea1@gregkh>
In-Reply-To: <2023100229-immodest-cattishly-2ea1@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|SJ0PR11MB5771:EE_
x-ms-office365-filtering-correlation-id: 30b1186c-d6a8-4d2a-2c49-08dbc3bb9e23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r67loFvDklSd6iYityW/z/rrItG6XWNmQJBv+koSlxpaKeq7oQFWYNKSmkfkp0Urgom7WR0jGPzeh/pJIRv60B7Rd8yXrSNEof7bLUPJqhCfZTGA70ZsvDVrMo5LLNT3mEMwkcIYecBdfHt/Qy9bjKR7K7ZUGXyXSs8D0UJDCp7wjMpLRyWj4WGThaYXQBhvfFeX7ZskCY9CKFud3T/2cV6uskdrGdw/5pC6R2DhAF17HcKgHkxBGRIHMKYapMthydp+02CzH3yYEvWH+1f3Am6Kek5iEn/sYedyjDo+UQ5i9lXM2UMs1CpJGs1ExJOTY4HYD2S42sa6VQwZeBj2CxdAYVbcJ4/eyt8/atSpwnS9ZeOIOKsny5OW0+I6VI8kFcb3yCfzz4pjPZ7Pnm5hpnSFulRvEZ1rJlKAQhjwvq8fYxHfRLZWGV6I5De9zqyxjLC7BbwAfNbRmJBi2MxThkWPu71NxA1paInvaKWCkvTFP7uGffRgFZKk9MKwXFNfw4QBu9Ix8vqMsBbbfvUn/inZdmwkabE0pxIsy8VAGUb/PqXMHhCIJAW2luxjrbGnfApF3g4Xr/zi6CCbmypbkxxYVMC/nF1Rtd6pj2ivP3dhGVP5GN0OJDPdy1WwQH1y
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(376002)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(83380400001)(7416002)(5660300002)(2906002)(55016003)(30864003)(7696005)(6506007)(9686003)(316002)(122000001)(66556008)(38070700005)(38100700002)(64756008)(66476007)(54906003)(66446008)(66946007)(6916009)(33656002)(478600001)(86362001)(71200400001)(76116006)(8676002)(8936002)(4326008)(26005)(52536014)(41300700001)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rcoSZ8hQ4AFqtOJ6MAv1cwOgpiwMMxwgEPB4ptr3TcaxF/rx8B/Gf8u/v4rR?=
 =?us-ascii?Q?qz2QcEzb4ucmsZUBTLlbgZvaYIZHRTISbCRQgRZOwAfRFfk1ouawb7wHQMsr?=
 =?us-ascii?Q?+0IXWFeTTEGESfI+szKmK8RE5aFLFNGckieelNPu5vWyvQ3aL3bwER21FiWw?=
 =?us-ascii?Q?reWwp5ch7AakbxB6/vTa5NdDrUlCI9T43+C3az+PVNMVYg1sVuVXJpM6V2Ea?=
 =?us-ascii?Q?TnbR+Ofz5WUCT1Tyn/Ne4ABdg4ebBRqbGcJ/tJfb1zkFN0TSyHU/+pnIS+B+?=
 =?us-ascii?Q?D/NsBZ7WI5jb9y50APvk+Ikh+5bh2Jpn7Ow/CX111l6lmSKdJzPWQKq7Vx5G?=
 =?us-ascii?Q?TlU9rlg/Tgebq2QRil+7/QdY5AqrPYR5vVAxJZtHqwkuLckx13t3RxZkVHtr?=
 =?us-ascii?Q?2ikpYragtrA27ntv0mVuKE5zG3uZ0tktSd8hOqzFlhMBMA+vQug6ieLoYhgj?=
 =?us-ascii?Q?AeZacTjMq1JSsszx/LTs9PonadXIakxv1M4qBDi8BkiGxI6Mj3df+pyeoJQK?=
 =?us-ascii?Q?P17bgGGybrzzGnHx8nIjBnOv/jVrT7ZtTJM+psiDqt+e+D11mr23n2l+lEN/?=
 =?us-ascii?Q?xb6IVx9v2O4L/W1aP8YLwmtpsrwGcGlcFIAHIMU9t8O78iMKE+1mMR2ztNJH?=
 =?us-ascii?Q?/gHVqst2f5eA+I1VDzDju9oBw+uRTQrj6NU+HoW7TY0Tty/HgRbDrHHKnSQR?=
 =?us-ascii?Q?9hooXEUHoqFgVWSbCyHDH10vJVaJ4oNGBqhRYahMXS2s/Y+jZ6NJhOrZo71U?=
 =?us-ascii?Q?Gdr1I4fTh+/7vSv/Cr1Kp+d4r8qEZcUJpSVGe+bKESMgb56iw8OSynxOg2Pk?=
 =?us-ascii?Q?e2bkr6n51KcHAOM/EatgXsspoSSW7YriMAMgntmKULl46tIR/FZC9NVsLvyw?=
 =?us-ascii?Q?MG0ERw2bWluj6qQyf1/5hJ+/RHrA96omM02Ix6smX9EfGpwDv0yoLeYMePnC?=
 =?us-ascii?Q?VeAzyMp7o1wPid1FUNwx1xcJtGgSYWjUGYKaElztg1rmCml9GqQEF69ttV9T?=
 =?us-ascii?Q?A5Jv9IlkmQ8zZI2kC4ACpjKuqTdPOXihY/uS0ijLOIV8CCKprRtJRUYDJTI8?=
 =?us-ascii?Q?sdXOGe+De9ipT9luPx9iZB6fr+r8FszlsPyyI80ktGqEFYjpYH2WaRgzSNiK?=
 =?us-ascii?Q?YeP9kgXXZkfb5op4gmeEH57PAPImQylA5IEctvM1SWuJlYo56o3lwXPoDCrD?=
 =?us-ascii?Q?h5Px6XdhBxtrcaXXwT9fKXVe4uIYbBJMk23KZopCAIVkVoHx+D/r4wfaq46/?=
 =?us-ascii?Q?s0kJguintBgpZboJa+Gc/WweuHuYBbWnU47PxruCsLEtADTec0n2aVCFlP+t?=
 =?us-ascii?Q?8/eoxhnyX9NmO7tN/FdTtkqa5I6bDNzUVvElJuVVrbcaMSB8/ZTceJeNnfx1?=
 =?us-ascii?Q?7eJdv2HyvT28H/9OP9uzCuWHptWVkEzDVr0B3uA3fEZoawGgeXc/u5U9CRQH?=
 =?us-ascii?Q?iAHGvDTVdAZZhBWeOrmnzyfRSIX8reNa1qbZfJpr/qaOKGMJUk7NBpbb1A73?=
 =?us-ascii?Q?wTr6GoB56wHVNXkQ0/vKhy4Oo+Qbr/wqYEJxQcv8B3fzJYzhW2AxOAIhuD9g?=
 =?us-ascii?Q?hhJpKRx+30Mg7HBrx6uM+oD+VdrENinLMWinddUI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b1186c-d6a8-4d2a-2c49-08dbc3bb9e23
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2023 02:51:18.2353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QZ94p4YjzXmXSGT/gesLvjmQwzU8cAnuh/u4pbOnPemLU2hYxmhFKMxfCdGZCkimBlehLM/GE8l7jQuNP9VT6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5771
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> From: Greg KH <gregkh@linuxfoundation.org>
> On Fri, Sep 29, 2023 at 11:31:21AM +0000, Wu, Wentong wrote:
> > > From: Greg KH <gregkh@linuxfoundation.org> On Sun, Sep 17, 2023 at
> > > 02:53:33AM +0800, Wentong Wu wrote:
> > > > +static void ljca_handle_event(struct ljca_adapter *adap,
> > > > +			      struct ljca_msg *header) {
> > > > +	struct ljca_client *client;
> > > > +
> > > > +	list_for_each_entry(client, &adap->client_list, link) {
> > > > +		/*
> > > > +		 * FIXME: currently only GPIO register event callback.
> > > > +		 * firmware message structure should include id when
> > > > +		 * multiple same type clients register event callback.
> > > > +		 */
> > >
> > > When will this be fixed?
> > >
> > > If not now, why not?
> >
> > Actually this doesn't impact current functionality because only GPIO
> > register event callback, but from coding perspective it should add the
> > id in the message structure. This fix should be done by firmware
> > first, but many products have already been running the firmware, it's n=
ot easy
> to update the firmware.
> >
> > Can I just remove the 'FIXME' and leave the comment here?
>=20
> If you are never going to fix it, it does not need a FIXME, right?  :)

Thanks, I will remove 'FIXME' here.

> > > You control both of these types, why aren't they the same type to sta=
rt with?
> > > Why the force cast?
> >
> > The len of header is defined by firmware, it should be u8 type. But
> > the ex_buf_len is passed by API users, I don't want users to do the
> > cast if their buffer is large than 256.
>=20
> Then fix the api to use a u8 as obviously you can not handle more data th=
en that
> for now.

Ack, thanks
=20
> > > Do you really need a scoped guard when you can not fail out of the bl=
ock?
> >
> > The scoped_guard is required by you with "Why not use the
> > functionality in cleanup.h for this lock? Makes this function much
> > simpler." If I understand correctly, so I use the scoped_guard where I =
can to
> make things simpler.
>=20
> But that's not making anything simpler here, cleanup.h works well when yo=
u
> have error paths that would be more complex without it.  You do not have =
that
> here at all now (maybe you did before?)

I'll remove scoped guard

>=20
> > > Why do you have both a mutex and spinlock grabed?
> >
> > The mutex is to avoid command download concurrently
> >
> > The spinlock is to protect tx_buf and ex_buf, which may be accessed by
> > tx and rx at the same time.
>=20
> Please document this somewhere.

Ack, thanks. Below is the kernel doc for struct ljca_adapter where we have
spinlock and mutex document.

/**
 * struct ljca_adapter - represent a ljca adapter
 *
 * @intf: the usb interface for this ljca adapter
 * @usb_dev: the usb device for this ljca adapter
 * @dev: the specific device info of the usb interface
 * @rx_pipe: bulk in pipe for receive data from firmware
 * @tx_pipe: bulk out pipe for send data to firmware
 * @rx_urb: urb used for the bulk in pipe
 * @rx_buf: buffer used to receive command response and event
 * @rx_len: length of rx buffer
 * @ex_buf: external buffer to save command response
 * @ex_buf_len: length of external buffer
 * @actual_length: actual length of data copied to external buffer
 * @tx_buf: buffer used to download command to firmware
 * @tx_buf_len: length of tx buffer
 * @lock: spinlock to protect tx_buf and ex_buf
 * @cmd_completion: completion object as the command receives ack
 * @mutex: mutex to avoid command download concurrently
 * @client_list: client device list
 * @disconnect: usb disconnect ongoing or not
 * @reset_id: used to reset firmware
 */
struct ljca_adapter {
	struct usb_interface *intf;
	struct usb_device *usb_dev;
	struct device *dev;

	unsigned int rx_pipe;
	unsigned int tx_pipe;

	struct urb *rx_urb;
	void *rx_buf;
	unsigned int rx_len;

	u8 *ex_buf;
	u8 ex_buf_len;
	u8 actual_length;

	void *tx_buf;
	u8 tx_buf_len;

	spinlock_t lock;

	struct completion cmd_completion;
	struct mutex mutex;

	struct list_head client_list;

	bool disconnect;

	u32 reset_id;
};
=20
> > > Why are you not verifying that you sent what you wanted to send?
> >
> > As I said, the actual_length is the actual length of data copied to
> > user buffer instead of the length of what we want to send.
> >
> > And even for verifying the length of what we want to send, the max
> > length of the message is sizeof(struct ljca_msg) +
> > LJCA_MAX_PACKET_SIZE which is less than the endpoint's max packet
> > size, so I don't check the actual sent length in above usb_bulk_msg().
>=20
> But you need to.

Ack, thanks.

>=20
> > > When you call this function, sometimes you check that the function
> > > sent the proper amount of data, but in many places you do not, and
> > > you assume that the full buffer was sent, which is not correct.  So
> > > please change _this_ function to check that you sent the proper
> > > amount and then the caller logic will be much simpler and actually
> > > work like you are using it in many places (some places you got it
> > > right, some wrong, which is a HUGE indication that the API is wrong
> > > because you wrote this code, and if you can't get it right...)
> >
> > As I said, the return value of this function is the response data
> > length instead of sent data length. And in this patch set, every
> > caller has verified if the response length matched with the sent comman=
d.
>=20
> No, I found many users that did not do this. =20

Ack, I will check more, thanks

>Please make the api easy to use, right now it's not.

I post the new ljca_send() here to try to address several comments.

First it changes the type of buffer length to u8, second it checks the actu=
al sent
of length usb_bulk_msg(). It removes the scoped guard as well.

And below gives an explanation of the parameters and return value.

The parameters(type, cmd, obuf_len) are used to construct message header,
obuf is used for message data. And ibuf and ibuf_len are for response buffe=
r
and buffer length passed by API users. ack indicates if the command
need an ack from firmware, timeout is timeout value to wait command ack.

And the return value is the response copied to response buffer passed by AP=
I
users, normally the users know how large buffer they have to pass to this A=
PI,
but from coding perspective we should check the passed response buffer
length(ibuf_len) and return the actual copied data length to the buffer.

Hope that helps, thanks

static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
		      const u8 *obuf, u8 obuf_len, u8 *ibuf, u8 ibuf_len,
		      bool ack, unsigned long timeout)
{
	unsigned int msg_len =3D sizeof(struct ljca_msg) + obuf_len;
	struct ljca_msg *header =3D adap->tx_buf;
	unsigned int transferred;
	unsigned long flags;
	int ret;

	if (adap->disconnect)
		return -ENODEV;

	if (msg_len > adap->tx_buf_len)
		return -EINVAL;

	mutex_lock(&adap->mutex);

	spin_lock_irqsave(&adap->lock, flags);

	header->type =3D type;
	header->cmd =3D cmd;
	header->len =3D obuf_len;
	if (obuf)
		memcpy(header->data, obuf, obuf_len);

	header->flags =3D LJCA_CMPL_FLAG | (ack ? LJCA_ACK_FLAG : 0);

	adap->ex_buf =3D ibuf;
	adap->ex_buf_len =3D ibuf_len;
	adap->actual_length =3D 0;

	spin_unlock_irqrestore(&adap->lock, flags);

 	reinit_completion(&adap->cmd_completion);

	ret =3D usb_autopm_get_interface(adap->intf);
	if (ret < 0)
		goto out;

	ret =3D usb_bulk_msg(adap->usb_dev, adap->tx_pipe, header,
			    msg_len, &transferred, LJCA_WRITE_TIMEOUT_MS);

	usb_autopm_put_interface(adap->intf);

	if (ret < 0)
		goto out;
	if (transferred !=3D msg_len) {
		ret =3D -EIO;
		goto out;
	}

	if (ack) {
		ret =3D wait_for_completion_timeout(&adap->cmd_completion,
						       timeout);
		if (!ret) {
			ret =3D -ETIMEDOUT;
			goto out;
		}
	}
	ret =3D adap->actual_length;

out:
	spin_lock_irqsave(&adap->lock, flags);
	adap->ex_buf =3D NULL;
	adap->ex_buf_len =3D 0;

	memset(header, 0, sizeof(*header));
	spin_unlock_irqrestore(&adap->lock, flags);

	mutex_unlock(&adap->mutex);

	return ret;
}

> > > Are you sure this is a valid uid to use?  If so, why?  What happens
> > > if this gets set to "0" for multiple ones?  Don't underestimate
> > > broken firmware tables, but also don't paper over problems in ways
> > > that will be impossible to notice and can cause problems.
> >
> > This actually has been discussed in previous email as bellow:
> >
> > some DSDTs have only 1 ACPI companion for the 2 I2C controllers and
> > these don't set a UID at all. On these models only the first I2C
> > controller is used. So if a HID match has no UID use "0" for the HID.
> > assigning the ACPI companion to the first I2C controller.
> > An example device with this setup is the Dell Latitude 9420.
>=20
> Then document this really really well in the code itself, otherwise it lo=
oks broken.

Ack, thanks, I post the new ljca_match_device_ids() here, hope that helps, =
thanks.
=20
static int ljca_match_device_ids(struct acpi_device *adev, void *data)
{
	struct ljca_match_ids_walk_data *wd =3D data;
	const char *uid =3D acpi_device_uid(adev);

	if (acpi_match_device_ids(adev, wd->ids))
		return 0;

	if (!wd->uid)
		goto match;

	if (!uid)
		/*
		 * Some DSDTs have only one ACPI companion for the two I2C
		 * controllers and they don't set a UID at all (e.g. Dell
 		 * Latitude 9420). On these platforms only the first I2C
		 * controller is used, so if a HID match has no UID we use
		 * "0" as the UID and assign ACPI companion to the first
		 * I2C controller.
		 */=20
		uid =3D "0";
	else
		uid =3D strchr(uid, wd->uid[0]);

	if (!uid || strcmp(uid, wd->uid))
		return 0;

match:
	wd->adev =3D adev;

	return 1;
}

> > This is to be compatible with old version FW which does not support
> > full USB2xxx functions, so it just warn here as this is.
>=20
> Why do you have to support obsolete and broken firmware?  Can't it be upd=
ated?

make sense, and probably they have to update, thanks

> You warn, yet return success?  Again, that doesn't work well as you never=
 know
> if you need to unwind it or not.
>=20
> Either report an error and handle it, or don't, but what you have here lo=
oks
> broken as-is.

Ack, it should report error and handle it. Thanks, the function will be lik=
e below:

static int ljca_enumerate_clients(struct ljca_adapter *adap)
{
	struct ljca_client *client, *next;
	int ret;

	ret =3D ljca_reset_handshake(adap);
	if (ret)
		goto err_kill;

	ret =3D ljca_enumerate_gpio(adap);
	if (ret) {
		dev_err(adap->dev, "enumerate GPIO error\n");
		goto err_kill;
        	}

	ret =3D ljca_enumerate_i2c(adap);
	if (ret) {
		dev_err(adap->dev, "enumerate I2C error\n");
		goto err_kill;
	}

	ret =3D ljca_enumerate_spi(adap);
	if (ret) {
		dev_err(adap->dev, "enumerate SPI error\n");
		goto err_kill;
	}

	return 0;

err_kill:
	adap->disconnect =3D true;

	usb_kill_urb(adap->rx_urb);

	list_for_each_entry_safe_reverse(client, next, &adap->client_list, link) {
		auxiliary_device_delete(&client->auxdev);
		auxiliary_device_uninit(&client->auxdev);

		list_del_init(&client->link);
		kfree(client);
	}

	return ret;
}

Thanks,

Wentong

>=20
> thanks,
>=20
> greg k-h
