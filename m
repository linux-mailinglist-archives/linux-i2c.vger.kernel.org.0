Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 046157B316E
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 13:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbjI2Lbc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 07:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjI2Lbc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 07:31:32 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D60A94;
        Fri, 29 Sep 2023 04:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695987089; x=1727523089;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qzP0fE3+XBfGdKwq2FKiujzWEK2mzH752R5/UKCTo/I=;
  b=NTlUOG3tohUMzafRnueSKXMdNjkwAGnVBE2O8z/SaTJsvYofHf+pFfGM
   kTpA38Kd+wUHUYAGTSog6DYGN0GqWlXlkwRSw4GFZe1dHlgVcgW3rUZlW
   1VyVglz3ncFtsUOwhczHlSCv9MfYI9fURwI992P0r/5qdXfpmxeIG4xiZ
   PxontxaM1dccppbouCRMK7TtjA+Ue8fRZxfivJJR6PHHeX6/EyeQId+tb
   uU2PcyXAHaN00f/ncFwuWCw6FZCmixwltbcDdlF/VXx8b35VGE7OYIbAp
   fNgA9Jxv76Bz67IZVti7ssMhyE7eRU6q6LNywpXorPPQQGCm8dQu/R3Rl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="3852340"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="3852340"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 04:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="804458"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Sep 2023 04:30:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 04:31:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 04:31:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 04:31:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 04:31:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BS2hK0Ffc610AwVd/xle/weJ04soDvt5LSrrSgfP0oQ4YdDDO1bxwGJveHju439MEFywvcE/HVqHX0uwF/NMkUjnNbvmvsmEr7mSrjFDtWvHU0PsYouV3mq2mLFHn7yN7DeEOjHscaLEumys+Hf4Q9k+SWfTu5oVN6TCMOHmJ+Ir2KAQR9bJN7gJkwvuciv+eICtIy2kXMWRfOi3emzN9sWxa9uBZBGMCWTJ9gFUfY7Q1ARAJubiVBBpGyxwKJhcboDdbmN7eCV8hQuxrZT7U/apeSJ0eQcMmYm51aMC2ivanPses6LI6dD9zAnSzDrWTkaKWWcoO1M5T4QtJDXIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+fm29ZvBd0jARaL6Si5Xv+wbilPOAO7iIMVTM26giE=;
 b=BhPiag3+MHar4j9Nm0c2Wja7/8n34Bg5kNjvwTG17lsh3Tnq1R19cMAubBucqMH3SIZEHYJd+7IIxbdBOsIf3Giis7sVr3KY3E8iCHe3JF24ZTIooeUyXd/HA+zCa1ZZlw4SMlgbpsyleZyLRI8Vzecm2oSKfdlge2lKoM+5v9NSh2g6u69APz9EMOy1VlJZz+XEfGDuWbMrbmB635jd4GFl7sv7DoQwCjMzXX/sg1xwtbyj0Jj3wFL6i2dIV1Jfb22CP6wOHra0BKy3Id3UF/Z/RJaHyoR/rlmYhO1iiDqURaBUoEUBmC6Pst+gbwgVsaPFqJ0JxojPn6xzNmezDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by SA1PR11MB5921.namprd11.prod.outlook.com (2603:10b6:806:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Fri, 29 Sep
 2023 11:31:23 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6813.027; Fri, 29 Sep 2023
 11:31:22 +0000
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
Thread-Index: AQHZ6M8oxqIjIiIdxk2dZoehwR11grAwYLSAgAFHNNA=
Date:   Fri, 29 Sep 2023 11:31:21 +0000
Message-ID: <DM6PR11MB4316E03DA12320D62995F15B8DC0A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <1694890416-14409-2-git-send-email-wentong.wu@intel.com>
 <2023092857-atrium-scared-b624@gregkh>
In-Reply-To: <2023092857-atrium-scared-b624@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|SA1PR11MB5921:EE_
x-ms-office365-filtering-correlation-id: 208aba5c-a290-437c-6d6a-08dbc0df9b2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DTV4988k0zs91V3H3YnpeIvcw6S11bwe0Hq6BV45a6GOBmcEHMolEvurRZfBxAicN4+ngk1zn2CfitxSlrIfz3p7oNTN7uCF2JAp659z7ncnSU7Dxl2zOoHt3rlY8aM3oLls+N67VLuxAXmiK0tY/8BJEJQdK/+fkofeFsd4YXfGClnjviWrVyuWnKLCSXppcaLO7saqFWQk0KXGqZa4sgfbWlMsmzMViCS/PtFdgg0U50ftsUUXkJRHQrudW8Kwzp5J4u38uIwo40lJtHd7sApqjRVRFGU49DFri28Mco7tyqahJDv16Wjj3tJ6ofg6t3/6W4o6CYxta1CHChzaz0IcieWT3sNd68GHaYK2E7XHWK6mgxbrnIdL1wI/d/iC8PMXJ1MhWStH/gOP/r/uHCqSJtfEA2pzqMGYxgt4ZPYxOiJPaid04rvKwkYtzpBY1x07Z14j9kCduMrCaePvy6kdqk8NQLy3UUahCsSAC/aoST9tyBTZxilg5j1SP+cEf+r5Z7qxH5L9lAAm48GLDZdc7ww5FZiUCCnvuKML2e1/xFvJxL3FgreMyLAx0WofW4lwCAMtNNMQsQOf7VYBnySL0AO973fbIlYaRFcbqpCJDmaHSR5Rj0AL6lxebBLuqBU5gjaon2W5IiA0VzDnSA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(136003)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(54906003)(316002)(5660300002)(66556008)(52536014)(8936002)(8676002)(6916009)(64756008)(76116006)(41300700001)(66946007)(2906002)(66446008)(66476007)(9686003)(478600001)(7696005)(30864003)(6506007)(7416002)(71200400001)(26005)(4326008)(83380400001)(55016003)(82960400001)(86362001)(33656002)(38070700005)(122000001)(38100700002)(21314003)(579004)(559001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rKlGmV+pQwfEU/g7PtzUrNp3zS8ox7Pd9I05GvBbP/KuAVJpRob+TCTbzQTU?=
 =?us-ascii?Q?6FgG/913xsZxJbWbdHfj+4KMuARZkUXA19qbH0TXc8epz/G78bakaYxSaQqY?=
 =?us-ascii?Q?3AeFJptq9TjQV9ViHYcOq6+fmlmhb9qmsHRO2oSjEh/9JBx5cGUWoMuTcNXO?=
 =?us-ascii?Q?EeoJoOV1hDW8FfMOVMcvzlxQqSU65DHEj0zJjG2Di6gybVDfsyIkdhVNrsd3?=
 =?us-ascii?Q?OIEan0ZMN+cECGtmwHcFEhaN/tcUpdNIpCXFk2yZl4tS8j2MAbuFLC+OA0F+?=
 =?us-ascii?Q?g2k2kDRGpgobuXycJe5wA83YMQICLqFORVzeu7f/CGy/p3LpSTSNGYyimVgg?=
 =?us-ascii?Q?GUdlvqyqEfxyg/cKi2vrcRiWA9RdkCILcXKkiIp8t5jTh+8vW08Ou1iqGO5p?=
 =?us-ascii?Q?7IuS491kwvZj14uhJNdHS6eG4g+jE/u0CXv3Fdcl24oBVv9/iBlV9JXAv9pa?=
 =?us-ascii?Q?/p7MsfUjMcceZRQ1CssMQNabGUCJ2+RoTV00Dj0neYydu4ameUtJyIKXT3f7?=
 =?us-ascii?Q?xfhvac/iT1zN/svhsG1kH/sfeQMjtaEGSjvtajrjMXUfD3a7VyAOrImRRacc?=
 =?us-ascii?Q?+T8JDnwxQNh4SQEdsN+rJitMdc9xwhy9QRhTHy5jDwhl5SXL9tJhs0iBOayT?=
 =?us-ascii?Q?cVisRd/mG8LHRLv9BZjvMb+PUmYqq5zr1gjdZollrpeQd+WdVvv043SYqaqK?=
 =?us-ascii?Q?EvLTLP7G/CzVmpEw+SUGJh7Vw+tqva0Y55ihUKMBVtyw8LJIDZts4uW6BY/G?=
 =?us-ascii?Q?vUS5rTmy65PZSi09/4K7R5Pl+jQGUEoC0WN3mvxN6cwhE0ClH+asoW2lBVKc?=
 =?us-ascii?Q?7hfTzocQjxFCN9ABg309HCQQFbEn0FfFEti6FpSXeRk0gHJt7u2rIZKT1jgP?=
 =?us-ascii?Q?lEJkFKyoHMYMG75777EcBuRAnqGJaR9LdnmSQvMWgASXMpZ5RIHigeGM/+iA?=
 =?us-ascii?Q?r5j2LUEshmbZpqezq1snHh2rlbFatfeL0uhWVOEB7XG2hAtLziP0ErCbC+dA?=
 =?us-ascii?Q?+PxYwmsppp7rWrNmMq2kzLwCOAQ8TMPKeQtqvgNvIXv65EKW9H4g3soslfkI?=
 =?us-ascii?Q?omF8exBXTKhLT6Zh3vXofI9QVDScp7y9WH7G6h/9+XqrRo8lvIcgmhb5Hecy?=
 =?us-ascii?Q?jVMGjEEq4zppTURh9wJUNMYVw4Pt9sIIVnH5Fu78GFYAY1K/2ZhQAyiYHjMb?=
 =?us-ascii?Q?qc72/IN9y++yDjsVEYpKcNGjUBynLTrbwGOJ7NywuI4IMdAISlUI79wgb7iX?=
 =?us-ascii?Q?o5iSb31sHCYUbjLXO4cq0FBvwY92UUl5OnWlt76YMgO3U6MN5CE+T2+gkORH?=
 =?us-ascii?Q?d/S7oa8aX25DdHsT25ctmNORpndgu9/AcZ17axFRctAdsXijTFA25IIGX6aO?=
 =?us-ascii?Q?TS2Ebh4asR7fmlg9N99DsvHwcaI+10C2BdZBsu0viMbJ26UPYq0E1tsD0fkB?=
 =?us-ascii?Q?/71mw8cWRLNkySElQjDu3QZzQDC6qPccZRz0Iwj4iAHIz4kuYnLH1aexbCRE?=
 =?us-ascii?Q?Mhz/SA8OFlKArM5uFCtYoi7wktVkZnzTHmoN91nE17vnaFguf1xQ6n6dltW9?=
 =?us-ascii?Q?Zuy/3cl4bAhhDDNTEEbvnc98q10e+/rySoRT/fVC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208aba5c-a290-437c-6d6a-08dbc0df9b2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2023 11:31:21.6528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pHvM/zOkgM+sKV3i73RgMYzqNxYtbBacyEcR7aWEcLxswKAH18V091LppdGQ7thLGbWMfXYyrtvRHoR1hx/Iow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5921
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Greg,

Thanks for your review

> From: Greg KH <gregkh@linuxfoundation.org>
> On Sun, Sep 17, 2023 at 02:53:33AM +0800, Wentong Wu wrote:
> > +/* ljca cmd message structure */
> > +struct ljca_msg {
> > +	u8 type;
> > +	u8 cmd;
> > +	u8 flags;
> > +	u8 len;
> > +	u8 data[];
>=20
> Shouldn't you be using the __counted_by attributes for all of these [] ar=
rays so
> that the compiler knows what to do and how to check that you don't overru=
n
> the buffer?

In this structure, len is not for data length, instead it's the length of h=
eader and data.

>=20
> Adding that now will save you having to add it later, AND it might catch =
bugs you
> already have so please add that.

But, I will add the __counted_by attribute for others like below:

struct ljca_i2c_descriptor {
	u8 num;
	struct ljca_i2c_ctr_info info[] __counted_by(num);
} __packed;

struct ljca_spi_descriptor {
	u8 num;
	struct ljca_spi_ctr_info info[] __counted_by(num);
} __packed;

struct ljca_gpio_descriptor {
	u8 pins_per_bank;
	u8 bank_num;
	struct ljca_bank_descriptor bank_desc[] __counted_by(bank_num);
} __packed;

>=20
> > +
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
> > +	u8 *ex_buf;
> > +	unsigned int ex_buf_len;
> > +	/* actual data length copied to external buffer */
> > +	unsigned int actual_length;
> > +
> > +	/* buffer for send */
> > +	void *tx_buf;
> > +	unsigned int tx_buf_len;
> > +
> > +	/* lock to protect tx_buf and ex_buf */
> > +	spinlock_t lock;
> > +
> > +	struct completion cmd_completion;
> > +
> > +	/* mutex to protect command download */
> > +	struct mutex mutex;
> > +
> > +	/* client device list */
> > +	struct list_head client_list;
> > +
> > +	/* disconnect ongoing or not */
> > +	bool disconnect;
> > +
> > +	/* used to reset firmware */
>=20
> Can you use proper kernel doc for this structure instead of inline commen=
ts?

Ack, thanks

>=20
> > +	u32 reset_id;
> > +};
> > +
> > +struct ljca_match_ids_walk_data {
> > +	const struct acpi_device_id *ids;
> > +	const char *uid;
> > +	struct acpi_device *adev;
> > +};
> > +
> > +static const struct acpi_device_id ljca_gpio_hids[] =3D {
> > +	{ "INTC1074" },
> > +	{ "INTC1096" },
> > +	{ "INTC100B" },
> > +	{ "INTC10D1" },
> > +	{},
> > +};
> > +
> > +static const struct acpi_device_id ljca_i2c_hids[] =3D {
> > +	{ "INTC1075" },
> > +	{ "INTC1097" },
> > +	{ "INTC100C" },
> > +	{ "INTC10D2" },
> > +	{},
> > +};
> > +
> > +static const struct acpi_device_id ljca_spi_hids[] =3D {
> > +	{ "INTC1091" },
> > +	{ "INTC1098" },
> > +	{ "INTC100D" },
> > +	{ "INTC10D3" },
> > +	{},
> > +};
> > +
> > +static void ljca_handle_event(struct ljca_adapter *adap,
> > +			      struct ljca_msg *header)
> > +{
> > +	struct ljca_client *client;
> > +
> > +	list_for_each_entry(client, &adap->client_list, link) {
> > +		/*
> > +		 * FIXME: currently only GPIO register event callback.
> > +		 * firmware message structure should include id when
> > +		 * multiple same type clients register event callback.
> > +		 */
>=20
> When will this be fixed?
>=20
> If not now, why not?

Actually this doesn't impact current functionality because only GPIO regist=
er
event callback, but from coding perspective it should add the id in the mes=
sage
structure. This fix should be done by firmware first, but many products hav=
e
already been running the firmware, it's not easy to update the firmware.

Can I just remove the 'FIXME' and leave the comment here?
=20
>=20
> > +		if (client->type =3D=3D header->type) {
> > +			scoped_guard(spinlock_irqsave, &client-
> >event_cb_lock) {
> > +				client->event_cb(client->context, header->cmd,
> > +						 header->data, header->len);
> > +			}
> > +
> > +			break;
> > +		}
> > +	}
> > +}
> > +
> > +/* process command ack */
> > +static void ljca_handle_cmd_ack(struct ljca_adapter *adap,
> > +				struct ljca_msg *header)
>=20
> We can use 100 columns...

Ok, I will make this in one row.

>=20
> > +{
> > +	struct ljca_msg *tx_header =3D adap->tx_buf;
> > +	unsigned int actual_len =3D 0;
> > +	unsigned int ibuf_len;
> > +	unsigned long flags;
> > +	u8 *ibuf;
> > +
> > +	spin_lock_irqsave(&adap->lock, flags);
> > +
> > +	if (tx_header->type !=3D header->type || tx_header->cmd !=3D header->=
cmd)
> {
> > +		dev_err(adap->dev, "cmd ack mismatch error\n");
>=20
> When you print error messages like this, who can do something about it?
> And why print with interrupts disabled?

Thanks, this will be like below:=20

	if (tx_header->type !=3D header->type || tx_header->cmd !=3D header->cmd) =
{
		spin_unlock_irqrestore(&adap->lock, flags);
		dev_err(adap->dev, "cmd ack mismatch error\n");
		return;
	}

>=20
> > +		spin_unlock_irqrestore(&adap->lock, flags);
> > +		return;
> > +	}
> > +
> > +	ibuf_len =3D adap->ex_buf_len;
> > +	ibuf =3D adap->ex_buf;
> > +
> > +	if (ibuf && ibuf_len) {
> > +		actual_len =3D min_t(unsigned int, header->len, ibuf_len);
>=20
> You control both of these types, why aren't they the same type to start w=
ith?
> Why the force cast?

The len of header is defined by firmware, it should be u8 type. But the ex_=
buf_len
is passed by API users, I don't want users to do the cast if their buffer i=
s large than
256.

>=20
> > +
> > +		/* copy received data to external buffer */
> > +		memcpy(ibuf, header->data, actual_len);
> > +	}
> > +	/* update copied data length */
> > +	adap->actual_length =3D actual_len;
>=20
> Wait, what happens if you don't actually copy the data?

This actual_length is the actual length of data copied to external buffer
where is to save the command response. The API callers should check
the response length according to the command you passed to this API.

> Why lie and say you did? Where is the error handling?

As I said, the API callers should have the error handing because they know
the exact response format, and actually I already the error handling in thi=
s
patch set.

>=20
> > +
> > +	spin_unlock_irqrestore(&adap->lock, flags);
> > +
> > +	complete(&adap->cmd_completion);
> > +}
> > +
> > +static void ljca_recv(struct urb *urb)
>=20
> No error handling?

Actually I have, I re-structure this function as below to make it more clea=
r,

static void ljca_recv(struct urb *urb)
{
	struct ljca_msg *header =3D urb->transfer_buffer;
	struct ljca_adapter *adap =3D urb->context;
	int ret;

	switch (urb->status) {
	case 0:
		/* success */
		break;
	case -ENOENT:
		/*
		   * directly complete the possible ongoing transfer
		   * during disconnect
		   */
		if (adap->disconnect)
			complete(&adap->cmd_completion);
		return;
	case -ECONNRESET:
	case -ESHUTDOWN:
	case -EPIPE:
		/* rx urb is terminated */
		dev_dbg(adap->dev, "rx urb terminated with status: %d\n",
			urb->status);
		return;
	default:
		dev_dbg(adap->dev, "rx urb error: %d\n", urb->status);
		goto resubmit;
	}

	if (header->len + sizeof(*header) !=3D urb->actual_length)
		goto resubmit;

	if (header->flags & LJCA_ACK_FLAG)
		ljca_handle_cmd_ack(adap, header);
	else
		ljca_handle_event(adap, header);

resubmit:
	ret =3D usb_submit_urb(urb, GFP_ATOMIC);
 	if (ret && ret !=3D -EPERM)
		dev_err(adap->dev, "resubmit rx urb error %d\n", ret);
}=20

>=20
> > +{
> > +	struct ljca_msg *header =3D urb->transfer_buffer;
> > +	struct ljca_adapter *adap =3D urb->context;
> > +	int ret;
> > +
> > +	if (urb->status) {
> > +		/* sync/async unlink faults aren't errors */
> > +		if (urb->status =3D=3D -ENOENT) {
> > +			/*
> > +			 * directly complete the possible ongoing transfer
> > +			 * during disconnect
> > +			 */
> > +			if (adap->disconnect)
> > +				complete(&adap->cmd_completion);
> > +			return;
> > +		}
> > +
> > +		if (urb->status =3D=3D -ECONNRESET || urb->status =3D=3D -
> ESHUTDOWN)
> > +			return;
> > +
> > +		dev_err(adap->dev, "recv urb error: %d\n", urb->status);
> > +		goto resubmit;
>=20
> You have an error, yet you don't report it you just spam the kernel log?
> Why?  Doesn't this happen when a device is removed?

When device is removed, it will be covered by ESHUTDOWN case in the above
'if (urb->status =3D=3D -ECONNRESET || urb->status =3D=3D -ESHUTDOWN) '

Most of the command error cases have been handled by the above
'if (usb->status =3D=3D ', for others it will print error log, In the re-st=
ructured code,
I changed it to dev_dbg to avoid spam.

>=20
> > +	}
> > +
> > +	if (header->len + sizeof(*header) !=3D urb->actual_length)
> > +		goto resubmit;
> > +
> > +	if (header->flags & LJCA_ACK_FLAG)
> > +		ljca_handle_cmd_ack(adap, header);
> > +	else
> > +		ljca_handle_event(adap, header);
> > +
> > +resubmit:
> > +	ret =3D usb_submit_urb(urb, GFP_ATOMIC);
>=20
> Why atomic, is this in a urb callback?

Yes,

>=20
> > +	if (ret && ret !=3D -EPERM)
> > +		dev_err(adap->dev, "resubmit recv urb error %d\n", ret);
>=20
> What happens if ret is an error here?

No command response, and there will be command timeout.

>=20
> > +}
> > +
> > +static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
> > +		     const u8 *obuf, unsigned int obuf_len, u8 *ibuf,
> > +		     unsigned int ibuf_len, bool ack, unsigned long timeout) {
> > +	unsigned int msg_len =3D sizeof(struct ljca_msg) + obuf_len;
> > +	struct ljca_msg *header =3D adap->tx_buf;
> > +	unsigned int actual;
> > +	int ret =3D 0;
> > +
> > +	if (adap->disconnect)
> > +		return -ENODEV;
> > +
> > +	if (msg_len > adap->tx_buf_len)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&adap->mutex);
> > +
> > +	scoped_guard(spinlock_irqsave, &adap->lock) {
> > +		header->type =3D type;
> > +		header->cmd =3D cmd;
> > +		header->len =3D obuf_len;
> > +		if (obuf)
> > +			memcpy(header->data, obuf, obuf_len);
> > +		header->flags =3D LJCA_CMPL_FLAG | (ack ? LJCA_ACK_FLAG : 0);
> > +
> > +		adap->ex_buf =3D ibuf;
> > +		adap->ex_buf_len =3D ibuf_len;
> > +		adap->actual_length =3D 0;
> > +	}
>=20
> Do you really need a scoped guard when you can not fail out of the block?

The scoped_guard is required by you with "Why not use the functionality in
cleanup.h for this lock? Makes this function much simpler." If I understand
correctly, so I use the scoped_guard where I can to make things simpler.

>=20
> Why do you have both a mutex and spinlock grabed?

The mutex is to avoid command download concurrently

The spinlock is to protect tx_buf and ex_buf, which may be accessed by tx a=
nd rx
at the same time.

>=20
> > +
> > +	reinit_completion(&adap->cmd_completion);
> > +
> > +	usb_autopm_get_interface(adap->intf);
>=20
> This can fail.  Why aren't you checking that?

Ack, thanks, and it will be like below:

	ret =3D usb_autopm_get_interface(adap->intf);
	if (ret < 0)
		goto out;

>=20
> > +
> > +	ret =3D usb_bulk_msg(adap->usb_dev, adap->tx_pipe, header,
> > +			   msg_len, &actual, LJCA_WRITE_TIMEOUT_MS);
> > +
> > +	usb_autopm_put_interface(adap->intf);
> > +
> > +	if (!ret && ack) {
> > +		ret =3D wait_for_completion_timeout(&adap->cmd_completion,
> > +						  timeout);
> > +		if (ret < 0) {
> > +			goto out;
> > +		} if (!ret) {
> > +			ret =3D -ETIMEDOUT;
> > +			goto out;
> > +		}
> > +	}
> > +	ret =3D adap->actual_length;
>=20
> Why are you not verifying that you sent what you wanted to send?

As I said, the actual_length is the actual length of data copied to user bu=
ffer instead
of the length of what we want to send.

And even for verifying the length of what we want to send, the max length o=
f the
message is sizeof(struct ljca_msg) + LJCA_MAX_PACKET_SIZE which is less tha=
n
the endpoint's max packet size, so I don't check the actual sent length in =
above
usb_bulk_msg().

>=20
> When you call this function, sometimes you check that the function sent t=
he
> proper amount of data, but in many places you do not, and you assume that=
 the
> full buffer was sent, which is not correct.  So please change _this_ func=
tion to
> check that you sent the proper amount and then the caller logic will be m=
uch
> simpler and actually work like you are using it in many places (some plac=
es you
> got it right, some wrong, which is a HUGE indication that the API is wron=
g
> because you wrote this code, and if you can't get it right...)

As I said, the return value of this function is the response data length in=
stead of
sent data length. And in this patch set, every caller has verified if the r=
esponse
length matched with the sent command.=20

>=20
> > +out:
> > +	scoped_guard(spinlock_irqsave, &adap->lock) {
> > +		adap->ex_buf =3D NULL;
> > +		adap->ex_buf_len =3D 0;
> > +		memset(header, 0, sizeof(*header));
> > +	}
>=20
> Again, why a scoped guard for something like this that does not need it?

As I said above, this is to address your last time review comment if I unde=
rstand
correctly, I can switch to the original one if we don't need this scoped gu=
ard.

>=20
> > +
> > +	mutex_unlock(&adap->mutex);
> > +
> > +	return ret;
> > +}
> > +
> > +int ljca_transfer(struct ljca_client *client, u8 cmd, const u8 *obuf,
> > +		  unsigned int obuf_len, u8 *ibuf, unsigned int ibuf_len) {
> > +	return ljca_send(client->adapter, client->type, cmd,
> > +			 obuf, obuf_len, ibuf, ibuf_len, true,
> > +			 LJCA_WRITE_ACK_TIMEOUT_MS);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(ljca_transfer, LJCA);
> > +
> > +int ljca_transfer_noack(struct ljca_client *client, u8 cmd, const u8 *=
obuf,
> > +			unsigned int obuf_len)
> > +{
> > +	return ljca_send(client->adapter, client->type, cmd, obuf,
> > +			 obuf_len, NULL, 0, false,
> LJCA_WRITE_ACK_TIMEOUT_MS); }
> > +EXPORT_SYMBOL_NS_GPL(ljca_transfer_noack, LJCA);
> > +
> > +int ljca_register_event_cb(struct ljca_client *client, ljca_event_cb_t=
 event_cb,
> > +			   void *context)
> > +{
> > +	unsigned long flags;
> > +
> > +	if (!event_cb)
> > +		return -EINVAL;
> > +
> > +	spin_lock_irqsave(&client->event_cb_lock, flags);
> > +
> > +	if (client->event_cb) {
> > +		spin_unlock_irqrestore(&client->event_cb_lock, flags);
> > +		return -EALREADY;
> > +	}
> > +
> > +	client->event_cb =3D event_cb;
> > +	client->context =3D context;
> > +
> > +	spin_unlock_irqrestore(&client->event_cb_lock, flags);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_NS_GPL(ljca_register_event_cb, LJCA);
> > +
> > +void ljca_unregister_event_cb(struct ljca_client *client) {
> > +	scoped_guard(spinlock_irqsave, &client->event_cb_lock) {
> > +		client->event_cb =3D NULL;
> > +		client->context =3D NULL;
> > +	}
> > +}
> > +EXPORT_SYMBOL_NS_GPL(ljca_unregister_event_cb, LJCA);
> > +
> > +static int ljca_match_device_ids(struct acpi_device *adev, void
> > +*data) {
> > +	struct ljca_match_ids_walk_data *wd =3D data;
> > +	const char *uid =3D acpi_device_uid(adev);
> > +
> > +	if (acpi_match_device_ids(adev, wd->ids))
> > +		return 0;
> > +
> > +	if (!wd->uid)
> > +		goto match;
> > +
> > +	if (!uid)
> > +		uid =3D "0";
>=20
> Are you sure this is a valid uid to use?  If so, why?  What happens if th=
is gets set
> to "0" for multiple ones?  Don't underestimate broken firmware tables, bu=
t also
> don't paper over problems in ways that will be impossible to notice and c=
an
> cause problems.

This actually has been discussed in previous email as bellow:=20

some DSDTs have only 1 ACPI companion for the 2 I2C controllers
and these don't set a UID at all. On these models only the first I2C
controller is used. So if a HID match has no UID use "0" for the HID.
assigning the ACPI companion to the first I2C controller.
An example device with this setup is the Dell Latitude 9420.

>=20
> Or am I mis-reading this function wrong, how can this ever be a valid UID=
 to
> compare against?
>=20
> > +	else
> > +		uid =3D strchr(uid, wd->uid[0]);
> > +
> > +	if (!uid || strcmp(uid, wd->uid))
> > +		return 0;
> > +
> > +match:
> > +	wd->adev =3D adev;
> > +
> > +	return 1;
> > +}
> > +
> > +/* bind auxiliary device to acpi device */ static void
> > +ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
> > +				  struct auxiliary_device *auxdev,
> > +				  u64 adr, u8 id)
> > +{
> > +	struct ljca_match_ids_walk_data wd =3D { 0 };
> > +	struct acpi_device *parent, *adev;
> > +	struct device *dev =3D adap->dev;
> > +	char uid[4];
> > +
> > +	parent =3D ACPI_COMPANION(dev);
> > +	if (!parent)
> > +		return;
> > +
> > +	/*
> > +	 * get auxdev ACPI handle from the ACPI device directly
> > +	 * under the parent that matches _ADR.
> > +	 */
> > +	adev =3D acpi_find_child_device(parent, adr, false);
> > +	if (adev) {
> > +		ACPI_COMPANION_SET(&auxdev->dev, adev);
> > +		return;
> > +	}
> > +
> > +	/*
> > +	 * _ADR is a grey area in the ACPI specification, some
> > +	 * platforms use _HID to distinguish children devices.
> > +	 */
> > +	switch (adr) {
> > +	case LJCA_GPIO_ACPI_ADR:
> > +		wd.ids =3D ljca_gpio_hids;
> > +		break;
> > +	case LJCA_I2C1_ACPI_ADR:
> > +	case LJCA_I2C2_ACPI_ADR:
> > +		snprintf(uid, sizeof(uid), "%d", id);
> > +		wd.uid =3D uid;
> > +		wd.ids =3D ljca_i2c_hids;
> > +		break;
> > +	case LJCA_SPI1_ACPI_ADR:
> > +	case LJCA_SPI2_ACPI_ADR:
> > +		wd.ids =3D ljca_spi_hids;
> > +		break;
> > +	default:
> > +		dev_warn(dev, "unsupported _ADR\n");
> > +		return;
> > +	}
> > +
> > +	acpi_dev_for_each_child(parent, ljca_match_device_ids, &wd);
> > +	if (wd.adev) {
> > +		ACPI_COMPANION_SET(&auxdev->dev, wd.adev);
> > +		return;
> > +	}
> > +
> > +	parent =3D ACPI_COMPANION(dev->parent->parent);
> > +	if (!parent)
> > +		return;
> > +
> > +	acpi_dev_for_each_child(parent, ljca_match_device_ids, &wd);
> > +	if (wd.adev)
> > +		ACPI_COMPANION_SET(&auxdev->dev, wd.adev); }
> > +
> > +static void ljca_auxdev_release(struct device *dev) {
> > +	struct auxiliary_device *auxdev =3D to_auxiliary_dev(dev);
> > +
> > +	kfree(auxdev->dev.platform_data);
> > +}
> > +
> > +static int ljca_new_client_device(struct ljca_adapter *adap, u8 type, =
u8 id,
> > +				  char *name, void *data, u64 adr) {
> > +	struct auxiliary_device *auxdev;
> > +	struct ljca_client *client;
> > +	int ret;
> > +
> > +	client =3D kzalloc(sizeof *client, GFP_KERNEL);
> > +	if (!client)
> > +		return -ENOMEM;
> > +
> > +	client->type =3D type;
> > +	client->id =3D id;
> > +	client->adapter =3D adap;
> > +	spin_lock_init(&client->event_cb_lock);
> > +
> > +	auxdev =3D &client->auxdev;
> > +	auxdev->name =3D name;
> > +	auxdev->id =3D id;
> > +
> > +	auxdev->dev.parent =3D adap->dev;
> > +	auxdev->dev.platform_data =3D data;
> > +	auxdev->dev.release =3D ljca_auxdev_release;
> > +
> > +	ret =3D auxiliary_device_init(auxdev);
> > +	if (ret)
> > +		goto err_free;
> > +
> > +	ljca_auxdev_acpi_bind(adap, auxdev, adr, id);
> > +
> > +	ret =3D auxiliary_device_add(auxdev);
> > +	if (ret)
> > +		goto err_uninit;
> > +
> > +	list_add_tail(&client->link, &adap->client_list);
> > +
> > +	return 0;
> > +
> > +err_uninit:
> > +	auxiliary_device_uninit(auxdev);
> > +
> > +err_free:
> > +	kfree(client);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ljca_enumerate_gpio(struct ljca_adapter *adap) {
> > +	u32 valid_pin[LJCA_MAX_GPIO_NUM / BITS_PER_TYPE(u32)];
> > +	struct ljca_gpio_descriptor *desc;
> > +	struct ljca_gpio_info *gpio_info;
> > +	u8 buf[LJCA_MAX_PAYLOAD_SIZE];
> > +	int ret, gpio_num;
> > +	unsigned int i;
> > +
> > +	ret =3D ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_ENUM_GPIO,
> NULL, 0, buf,
> > +			sizeof(buf), true, LJCA_ENUM_CLIENT_TIMEOUT_MS);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* check firmware response */
> > +	desc =3D (struct ljca_gpio_descriptor *)buf;
> > +	if (ret !=3D struct_size(desc, bank_desc, desc->bank_num))
> > +		return -EINVAL;
> > +
> > +	gpio_num =3D desc->pins_per_bank * desc->bank_num;
> > +	if (gpio_num > LJCA_MAX_GPIO_NUM)
> > +		return -EINVAL;
> > +
> > +	/* construct platform data */
> > +	gpio_info =3D kzalloc(sizeof *gpio_info, GFP_KERNEL);
> > +	if (!gpio_info)
> > +		return -ENOMEM;
> > +	gpio_info->num =3D gpio_num;
> > +
> > +	for (i =3D 0; i < desc->bank_num; i++)
> > +		valid_pin[i] =3D get_unaligned_le32(&desc-
> >bank_desc[i].valid_pins);
> > +	bitmap_from_arr32(gpio_info->valid_pin_map, valid_pin, gpio_num);
> > +
> > +	ret =3D ljca_new_client_device(adap, LJCA_CLIENT_GPIO, 0, "ljca-gpio"=
,
> > +				     gpio_info, LJCA_GPIO_ACPI_ADR);
> > +	if (ret)
> > +		kfree(gpio_info);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ljca_enumerate_i2c(struct ljca_adapter *adap) {
> > +	struct ljca_i2c_descriptor *desc;
> > +	struct ljca_i2c_info *i2c_info;
> > +	u8 buf[LJCA_MAX_PAYLOAD_SIZE];
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	ret =3D ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_ENUM_I2C, NULL,
> 0, buf,
> > +			sizeof(buf), true, LJCA_ENUM_CLIENT_TIMEOUT_MS);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* check firmware response */
> > +	desc =3D (struct ljca_i2c_descriptor *)buf;
> > +	if (ret !=3D struct_size(desc, info, desc->num))
> > +		return -EINVAL;
> > +
> > +	for (i =3D 0; i < desc->num; i++) {
> > +		/* construct platform data */
> > +		i2c_info =3D kzalloc(sizeof *i2c_info, GFP_KERNEL);
> > +		if (!i2c_info)
> > +			return -ENOMEM;
> > +
> > +		i2c_info->id =3D desc->info[i].id;
> > +		i2c_info->capacity =3D desc->info[i].capacity;
> > +		i2c_info->intr_pin =3D desc->info[i].intr_pin;
> > +
> > +		ret =3D ljca_new_client_device(adap, LJCA_CLIENT_I2C, i,
> > +					     "ljca-i2c", i2c_info,
> > +					     LJCA_I2C1_ACPI_ADR + i);
> > +		if (ret) {
> > +			kfree(i2c_info);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int ljca_enumerate_spi(struct ljca_adapter *adap) {
> > +	struct ljca_spi_descriptor *desc;
> > +	struct ljca_spi_info *spi_info;
> > +	u8 buf[LJCA_MAX_PAYLOAD_SIZE];
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	ret =3D ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_ENUM_SPI, NULL,
> 0, buf,
> > +			sizeof(buf), true, LJCA_ENUM_CLIENT_TIMEOUT_MS);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	desc =3D (struct ljca_spi_descriptor *)buf;
> > +	for (i =3D 0; i < desc->num; i++) {
> > +		/* construct platform data */
> > +		spi_info =3D kzalloc(sizeof *spi_info, GFP_KERNEL);
> > +		if (!spi_info)
> > +			return -ENOMEM;
> > +
> > +		spi_info->id =3D desc->info[i].id;
> > +		spi_info->capacity =3D desc->info[i].capacity;
> > +
> > +		ret =3D ljca_new_client_device(adap, LJCA_CLIENT_SPI, i,
> > +					     "ljca-spi", spi_info,
> > +					     LJCA_SPI1_ACPI_ADR + i);
> > +		if (ret) {
> > +			kfree(spi_info);
> > +			return ret;
>=20
> What about the other objects that you created here, don't you need to unw=
ind
> the new ones if one in the chain fails?  And if not, why stop at the firs=
t failure?
>=20
>=20
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +
> > +static int ljca_enumerate_clients(struct ljca_adapter *adap) {
> > +	int ret;
> > +
> > +	ret =3D ljca_reset_handshake(adap);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ljca_enumerate_gpio(adap);
> > +	if (ret)
> > +		dev_warn(adap->dev, "enumerate GPIO error\n");
> > +
> > +	ret =3D ljca_enumerate_i2c(adap);
> > +	if (ret)
> > +		dev_warn(adap->dev, "enumerate I2C error\n");
> > +
> > +	ret =3D ljca_enumerate_spi(adap);
> > +	if (ret)
> > +		dev_warn(adap->dev, "enumerate SPI error\n");
>=20
> So none of these "errors" are actually errors:
>=20
> > +	return 0;
>=20
> You return success?  Why?  Are they not actually problems?

This is to be compatible with old version FW which does not support
full USB2xxx functions, so it just warn here as this is.
To make things more clear, I re-structure this as below, hope that
helps, thanks

static int ljca_enumerate_clients(struct ljca_adapter *adap)
{
	struct ljca_client *client, *next;
	int ret;

	ret =3D ljca_reset_handshake(adap);
	if (ret)
		return ret;

	ret =3D ljca_enumerate_gpio(adap);
	if (ret)
		goto err_free;

	ret =3D ljca_enumerate_i2c(adap);
	if (ret)
		goto err_free;

	ret =3D ljca_enumerate_spi(adap);
	if (ret)
		goto err_free;

	return 0;

err_free:
	adap->disconnect =3D true;

	list_for_each_entry_safe_reverse(client, next, &adap->client_list, link) {
		auxiliary_device_delete(&client->auxdev);
		auxiliary_device_uninit(&client->auxdev);

		list_del_init(&client->link);
		kfree(client);
	}

	return ret;
}

And accordingly, the ljca_enumerate_xxx() has slightly change to cover the
unsupported case as below( take spi as an example)

@@ -617,6 +633,11 @@ static int ljca_enumerate_spi(struct ljca_adapter *ada=
p)
=20
        ret =3D ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_ENUM_SPI, NULL, 0=
, buf,
                        sizeof(buf), true, LJCA_ENUM_CLIENT_TIMEOUT_MS);
+       if (ret =3D=3D -ETIMEDOUT) {
+               dev_warn(adap->dev, "doesn't support SPI function\n");
+               return 0;
+       }
+
        if (ret < 0)
                return ret;

Thanks
Wentong
>=20
> thanks,
>=20
> greg k-h
