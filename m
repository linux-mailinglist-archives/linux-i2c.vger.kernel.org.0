Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24DCA79C45C
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Sep 2023 05:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233518AbjILDuN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Sep 2023 23:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbjILDuM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Sep 2023 23:50:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D3CA4;
        Mon, 11 Sep 2023 20:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694490608; x=1726026608;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XlDXv7l9fpVAh9mi2ixAL4hrY/XZRlX5WPEuspmPdaA=;
  b=kTzBD5YHP9Nzn9NaNTfNqxOoHfDjdVRMhLa3JltQ/RMqT9z5vjFTC6qF
   cqtA5+0OPGJp4kdPkzUjDLkxNz9Xk81z3nj2f7FK0M222br9+j5ORFAZd
   Tot4A5SNhLIaJSNDaTZn4q9tSFVI3x0nzVEIFsHpx0/GPvVbOlknCVI6s
   Avn5D6Y2B8XM8yT8IVGh2nl1Pl6x+A5feTsdBzSdclkCoPNGqH51cDXbR
   BP2bnmnyYd9CWcPPqJGblHq7sNooeVzgOBEvxz0Q4d2HOnt8RuWJjXzvP
   YA1curzUFTH1YVimI9Sw7CF4lVZmUSElCkfHFTxl0bVfxDgfzst0SHmW5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444704375"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="444704375"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 20:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="833746172"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="833746172"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Sep 2023 20:50:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 20:50:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 20:50:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 20:50:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 20:50:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwzHeKIt4cTaTLIvalvdUGTuH2uHpSB0A/fNmDrBslU0Vg8zrQo1GnLI/fVyz3wFVzSfTeLZZC1z1uluqKEZsE72FTUDfdbGUOPP3ClNcc48kZLet+5cjrfGn+KL+chYRnlNBZ9UpEKTOFbxWm+uw7T32+l68rzrqmd9b5TUES9GaNZTuYEFP4U+SFf1SacFiuJIECoOVcahZOUvixUHyAuQUKA1FK8h4Tn63w9UVJXQgy3na6thUyvvX9cWl5B46wbW3Nqc/Y/NqojaQCiuGlgE4BIqdhuskgBKRcPAe6nHwlHLOCWBnm32DHXvVF8ACi1Ob7deDVAgJa16PUTMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9jR9xmKb0AVlri16IYuq6UgxMMBEV7KabIkTV5PHsE=;
 b=TSMtN0S2RhxuPKtRa7qW+iU0dDZ58OgRiTRs/5v8U6/HN5d4dJvCYiXk3PAzvqUw+VgvVXMriLH0o1ZxcEJNvBS3uuxr7YzIkkbmD4A+sYdJtHtsoS8FuMsglVkJsU5Li4KZViAWAJdjKj4CHidw7K5KPwB8MDDc0Si49fMK//CkoP/qfCbt0IYeJ4CwV/1ONJ5njNukIeCA7NKJc7U5NCFj/0YouX9LkzWsJQIwbEPYjOZsGLzTDi0xnG3poBmL+4AIIlqQHsqmFqEyP+fKGZhGLHs4juqPd51FUWHry/SIHoYVYcK5JBFcDJH16+GovxolvenEj6uH731UWntQAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by PH0PR11MB7543.namprd11.prod.outlook.com (2603:10b6:510:26c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 03:50:00 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6768.036; Tue, 12 Sep 2023
 03:49:59 +0000
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
Subject: RE: [PATCH v15 1/4] usb: Add support for Intel LJCA device
Thread-Topic: [PATCH v15 1/4] usb: Add support for Intel LJCA device
Thread-Index: AQHZ4HF+A3wMCVoqAkyEsPt16c0Su7AQ8p+AgAWjb2A=
Date:   Tue, 12 Sep 2023 03:49:59 +0000
Message-ID: <DM6PR11MB43167EC56EF719491A4867318DF1A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1693970580-18967-1-git-send-email-wentong.wu@intel.com>
 <1693970580-18967-2-git-send-email-wentong.wu@intel.com>
 <2023090854-verse-crabmeat-bf14@gregkh>
In-Reply-To: <2023090854-verse-crabmeat-bf14@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|PH0PR11MB7543:EE_
x-ms-office365-filtering-correlation-id: 85f3dd3c-680c-4bf2-107d-08dbb3435672
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1lCAsnvq0G4+6yU7I4ytBmCkwWJxmJGQ1l98+OUbPXcMWMtodG3jZk1/wdTkz5rN5Axr0Jm1dS3W933mXf34p4JViLjJAlvQeo9SzlHSY8lUXkEm2s7SLqXvxz3fmNPKajTqc5UfC773StFqc84OqhZukFvfw7ZzexZJTVllerqCMtUUJZfBALuPodE1wf6qHRU89Ll2s3lNO4Wj6brSSk76L84HAWMkWrGaO6pJt8U8LeJhoVH95mLsT4suw+wu9zv5Bd+9I3zfC+j+HjU//7fhENSniK9NJJ/qIQLER/tJadFREzB/XCaBGbLHqwCI2f4e7o2hWNpVGh8o0IorGN9yhY/Bj57eLWsNW7ebjKPW6tqVibKbDVmoZlZnCEeTT6phLgIq38xft8kBHeXHk+pJQLtqicRQ51IlezugyikFZaOOKN8klNp/BrVXfNL/3iXPV3z7NzzaMPU6gLH3pBV0XfdOW00QFT812cUyrqA+oKdp46mPlxeLnv+cmYGm90bANAyjEtLK3mGFWxVx24sftCK6t1ZfgfcnHjdQ6Wg/dMSbkZ2JSQE51+e4rTrlnJIYshAKx9wSZK+jMWd2LmAs9Z8hjSrzib09EXQX03/6/LTUFGylNzwCG4HMaOo9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(396003)(376002)(186009)(451199024)(1800799009)(6506007)(82960400001)(9686003)(71200400001)(7696005)(83380400001)(66946007)(478600001)(41300700001)(52536014)(66556008)(2906002)(66446008)(64756008)(6916009)(66476007)(54906003)(8936002)(76116006)(316002)(8676002)(5660300002)(26005)(7416002)(55016003)(86362001)(4326008)(38070700005)(33656002)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5/1/12seP6bQba5MN+6k/M0dfcqWIUUADUGMsy1Hv+XUhBpmZd4x/6AYZ7v9?=
 =?us-ascii?Q?eg9Pf7LfC0G/qb66M0j5Hii1NHttWuVfljWpl3W5B5VhHqBNeVQ4VJJc697d?=
 =?us-ascii?Q?lXnjgW/ILAyLyTFFRSa0HREsgu5DalN5P+lG5rx+MtyU7zShd9vVpo7Iv3jU?=
 =?us-ascii?Q?pCO6fr0BvWcMGPtOx9bzw7tlalgUFtbLs0Zg0vCfs4ANxEmM47V+4c25zQiO?=
 =?us-ascii?Q?v81f5ZnB5/P27OWp5+25hIpVv/mjL3Pc3fMcIsoNWBWx6EfSrIDwyUkraAnI?=
 =?us-ascii?Q?Rny4k+aO543DixdyfjYa2JAKatLITB+/9pleTom0FDK5Cqg/swem2P1dwR1M?=
 =?us-ascii?Q?k16qN1Nbp8c2CXlgcMUboPqm5FQOjmDxdY3iLJmKuRlYCP6pNnv7EGh5zULI?=
 =?us-ascii?Q?yiq3yHg+kRBP609FL/xgw/uAorEEY2g6JyE63MJ0gQuGGDuUDnD85AB12ylq?=
 =?us-ascii?Q?oFOmN/iJt1YVB27WAmi5/MjdAcrHJ1BekN6qsyIQBrVtFwwgC2bnACZhQpJ8?=
 =?us-ascii?Q?hqE/YZ+IA2Xcx43G++CynSUboEWxFu5tVDyLYbqmIiHbW8DfIhqpcX0h2BGy?=
 =?us-ascii?Q?XLdeNpJZHQKNMQnmnlkAcnqxVmu3hV7lYp0WXYcvDunkq4Z1BYk7m0LpJMds?=
 =?us-ascii?Q?LoOE/aM49ai4vXp8HQhIcw1VlA3nXndKENJzfwlc4mydtE2P6LBmmbMTd6Oc?=
 =?us-ascii?Q?pwKNvGWiw+m9PHD7xEG4dcVuWR7B+dx+b+ZjKSUPtfSqmtq63dNk/adOFthn?=
 =?us-ascii?Q?5pdq+xDSoqhvDUQWZgcbnullm+DhuojKSLW2K/shyQdosYPj/RckW7eu76bw?=
 =?us-ascii?Q?SylUXJKL0fneh1z5ltAL1edOu+bfuMR7p52hhhRGjegUx54WTO3hvDmsmUcs?=
 =?us-ascii?Q?bx683MDt6hYBVKrUdDZycG8c/PXIHRKFFK4ZvR658gyl7pZMw/gt5LQm60rm?=
 =?us-ascii?Q?+M+xZKOyBBTcvjVMUBad01rU/KVAqkKFrXAjKcLqeuhICIanDgrnH0X2xDgX?=
 =?us-ascii?Q?O1XOtYFF/hgRh17HvRS9PJgd/Ss5f9NryqHxkTmPbo8ki4mm37q4g5O4x3xa?=
 =?us-ascii?Q?+IPZ5DQ7cFjRPwed4edljQiujgDZHrL2ugQkyELPzz3CJoIelHMRiVdIJP46?=
 =?us-ascii?Q?IaqVeLIgaRS/+GS/ItxCLCLgtuwTiJU6ceQkZgY2aVMbLwRFHJba3LTRFVrV?=
 =?us-ascii?Q?sVw3WKzMlvwvEDsGZTosjNYWHi9h3rExiWpArhFLxnGBL1abDYGdCeiGljyp?=
 =?us-ascii?Q?Nw30dyf/DfxkSr0KnWUl0nn/cJOQ/iBTLRsygCxvJSCpzaa4LHdr8mqOUuph?=
 =?us-ascii?Q?BC8VQNmibD2hvimldC2qKMrlmFfqu8nvEn8goWmoZq0XEG5MqO+of8mnLL5o?=
 =?us-ascii?Q?S8CDd2yDn9qQ+xn2PRK1iOmSmJjUibtkyj49mOxxLKs1LLQPHafFcIFDG5pR?=
 =?us-ascii?Q?4VrEita8p6qmZFNUTG/6UDhAlTV0Gg7Loj0rFcel4yropOH8DWmgSHxsm5uB?=
 =?us-ascii?Q?31uKzY/39JTTG8wovdCrvxl2c0ewwxLsiajRFZIi62ySjO5/upbc8akIWmQ8?=
 =?us-ascii?Q?AuTv4v3cNrM2Q2G1kpRf5PFY48myW8FlGNJpaJW3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f3dd3c-680c-4bf2-107d-08dbb3435672
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2023 03:49:59.7233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TbI01sX7ocRtK+P+FkA/5a4t/6BJG9iF3Hjao+KLwHXJN8NKBrGDf/m0yUAMEL/FSoQytKTgyPsJ02iNxTJ3UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7543
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Greg,

Thanks for your review

> From: Greg KH <gregkh@linuxfoundation.org>
>=20
> > +struct ljca_adapter {
> > +	struct usb_interface *intf;
> > +	struct usb_device *usb_dev;
> > +	struct device *dev;
> > +
> > +	unsigned int rx_pipe;
> > +	unsigned int tx_pipe;
> > +
> > +	/* urb for recv */
> > +	struct urb *rx_urb;
> > +	/* buffer for recv */
> > +	void *rx_buf;
> > +	unsigned int rx_len;
> > +
> > +	/* external buffer for recv */
> > +	void *ex_buf;
>=20
> Shouldn't buffers be u8*?

Ack, this has been fixed in my local version.

>=20
> > +
> > +/* process command ack */
> > +static void ljca_handle_cmd_ack(struct ljca_adapter *adap,
> > +				struct ljca_msg *header)
> > +{
> > +	struct ljca_msg *tx_header =3D adap->tx_buf;
> > +	unsigned int actual_len =3D 0;
> > +	unsigned int ibuf_len;
> > +	unsigned long flags;
> > +	void *ibuf;
> > +
> > +	spin_lock_irqsave(&adap->lock, flags);
>=20
> Why not use the functionality in cleanup.h for this lock?  Makes this fun=
ction
> much simpler.

Ack, I understand the cleanup.h now, and use the functionality as much as I=
 can.

>=20
> > +
> > +	if (tx_header->type !=3D header->type || tx_header->cmd !=3D header->=
cmd)
> {
> > +		spin_unlock_irqrestore(&adap->lock, flags);
> > +
>=20
> No need for a blank line.
>=20
> And how can these things happen?  No need to return an error if this is t=
he case?

Ack, removed the blank line and added error print here.

>=20
> > +static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
> > +		     const void *obuf, unsigned int obuf_len, void *ibuf,
> > +		     unsigned int ibuf_len, bool ack, unsigned long timeout)
>=20
> That's a lot of function parameters, whyh so many?
>=20
> And why void *?  That should never be used in an internal function where =
you
> know the real type.

Ack, have switched void * to real type

>=20
> > +{
>=20
> > +#else
> > +static void ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
> > +				  struct auxiliary_device *auxdev,
> > +				  u64 adr, u8 id)
> > +{
> > +}
> > +#endif
>=20
> Can't this go in a .h file?  #ifdef in .c files are frowned apon.

Ack, this has been removed=20

>=20
> > --- /dev/null
> > +++ b/include/linux/usb/ljca.h
> > +
> > +struct ljca_client {
> > +	u8 type;
> > +	u8 id;
> > +	struct list_head link;
> > +	struct auxiliary_device auxdev;
> > +	struct ljca_adapter *adapter;
> > +
> > +	void *context;
> > +	ljca_event_cb_t event_cb;
> > +	/* lock to protect event_cb */
> > +	spinlock_t event_cb_lock;
> > +};
> > +
> > +struct ljca_gpio_info {
> > +	unsigned int num;
> > +	DECLARE_BITMAP(valid_pin_map, LJCA_MAX_GPIO_NUM); };
> > +
> > +struct ljca_i2c_info {
> > +	u8 id;
> > +	u8 capacity;
> > +	u8 intr_pin;
> > +};
> > +
> > +struct ljca_spi_info {
> > +	u8 id;
> > +	u8 capacity;
> > +};
>=20
> No documentation for these other public structures?

Ack, This has been addressed. If no more comments, I will send out v16 for =
review.

Thanks
Wentong
>=20
> thanks,
>=20
> greg k-h
