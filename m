Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29D48798A4B
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Sep 2023 18:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238520AbjIHQDO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Sep 2023 12:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232689AbjIHQDN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Sep 2023 12:03:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E98E1BF8;
        Fri,  8 Sep 2023 09:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694188989; x=1725724989;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lv6Fkfvh3ERiJfC/Aeq8xcqx/VjQ5lEb8Am3VYcRa50=;
  b=SRoe7+XUxsYo5+Ea3KwAHJjGfg/Yy5s9b/K+j3IEILhgpoO9X+0mLdUU
   mSRtEOfS4jwT6lDwHn4X1i2N2LIZx/AqNA9BqGi64K1OugKkrb78fJwkn
   fR8gEU50f0ovuZK7krgDGOkizptBB2DIWv76dqgcWAjYrzEjrcUs5Zw8G
   I8eHcbzgtiBQWOEMDW1E39re25jSd3AEG6oDFsLXgNLdgbPo//56QqEyo
   U3qoPEJWtnoUFZDmxpS1flWOXQ22jSmPk1AIQwQwAB5kTefNA/65ACtI9
   GalihtoR2LC6av5j6K5Tpi+U6jS5ewyq/OdL3kauKiOObS8WbhsAoxKB2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="464051981"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="464051981"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 09:03:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="777629257"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="777629257"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Sep 2023 09:03:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 09:03:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 8 Sep 2023 09:03:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 8 Sep 2023 09:03:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MF/oZUlCfCdQ5zFHy0FDcAc4gBQaYAmMEURsXGy+37vWRBdZXQOb6AKFi8Qo6X7WjJc20w0BgkHpbQJx7sCrPWr8xcLZEkNCpChVU63kfSJGWrrL3NWjfwS4KDOpDujXmVhF9xqutbVdSZJGHsyeH3ggrl9JqQ9R0lTdG1qus+UpeYT1R3iSnDrnyjn4Dd5DEmOwvdDC+waonLM9T3kMB61IwICtma0R4jCLgh+7DM0/fK6fC1Bv51SKGubHbBuKKQJbOoJO+z4h+aUlEMhaa9vbOuERBNDrbzJNBvPkJrFJrzZJqImb0tlsHsFV79lzAiGLuTvQYPZ7kYBoGCarDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXQoFNYwCVupcla6Vuyrsr+SZRJYK4obtgfx+x2jWSo=;
 b=lC6Is88WzVNES0HQW5vHW8LehzwH4wJs8fH2CaMKxB7pD2GYiJFZjGNQafyOpA+H+GDI5FYOWfiv+juq8wa26/WehL7MlFIxGPNBZFZ7Uu3fPFiBQdsHutylfu0sIeUM9P8rFR88LrqBjwoFb4Gdleo2lmVX8gBSZGeUWohSnY26qPwiKOWvvpbN4AMNwJVMeLbr0N5bH+txrkavtJ4rNy4WXx/hYnPrscpGn7fG2IqFJmwM1rpKvOKN7FYOFosfTTLEBUH90vt76RwaTH8so1eKDKC6MwIruzyUY6xu9x+FvMKmfRhSjl3s2TMIxUTS7RLN1QzapydQDEkNdP26dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by BL3PR11MB6530.namprd11.prod.outlook.com (2603:10b6:208:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Fri, 8 Sep
 2023 16:03:05 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 16:03:04 +0000
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
Thread-Index: AQHZ4HF+A3wMCVoqAkyEsPt16c0Su7AQ8p+AgAAVg+A=
Date:   Fri, 8 Sep 2023 16:03:04 +0000
Message-ID: <DM6PR11MB4316EA32140F05C2127FAD698DEDA@DM6PR11MB4316.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|BL3PR11MB6530:EE_
x-ms-office365-filtering-correlation-id: eb8ca126-b199-4331-9be1-08dbb08515b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fiIdWNiUuulmlVCB/xHjoNw0GuYo93084nemvdnP6m+Mf28LMioP8KPmpDI0CF+hgzB3gjm9iO4jVaQlX/veIPzd+qN65zyd7SNntVpvFLftBgCs4OXaiS+I7yAvU4SWkrykx3isZePjXRRWcniC+z43CHTnyqj5/F908s4t8KTOARcbRmswJQkLrxrrwCaBj6oJp0Xw7rixhiF5LQdH+cLjltlafih777c69pm5ef0sv1UwhxYZh27oEDZeU8AzTh0xTW8pz/p2KnHIz7GDsN4R5zjlg0OSlRzSghaVgC5o2VHGEwQfQ4pjV1xsssCiDOdUSCh28townG05T3abO55CrQAW8+0ponGRZePCQjdKnVC1dKWq851gLaOP7lYbRG81jFd2iqc4Fw309YK7k6v/wfV1kFBWTXUvMkZqE/3RlI41Y6rJL0P0wk6aB3a8S0wEE2AVIagONI70uX+GKGoaYSpfqCsNF7Fa+h6drvu68ApzDU9CMe/l7CwDw9BZHhl5vE+yV4UITxSEPPoCXzZ0nSbVuvdxdYiEaqunLKz4z8NcsgeBZuJKHZ9dzPD5EEypww0vD0+OhtoYiCHoGvziMwN+fHNWMlzXsUGZNYCVuhf2v+VGaXgiNEJCRKvk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199024)(1800799009)(186009)(54906003)(41300700001)(52536014)(64756008)(4326008)(8936002)(66556008)(66946007)(66446008)(66476007)(76116006)(8676002)(6916009)(316002)(5660300002)(7416002)(478600001)(38070700005)(38100700002)(55016003)(83380400001)(2906002)(33656002)(26005)(86362001)(122000001)(7696005)(71200400001)(82960400001)(9686003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/FJFTjzzq0JdsiprdU20ddPpIs60w5hjNkdSwwFzvIdTVjkIoDzPENACV5S5?=
 =?us-ascii?Q?9ChrK2j3ZnYu8Tj3xFU+t6F/KaYPg0jCVHkjaUa8kjtawz4OnKbRUWVT5kb7?=
 =?us-ascii?Q?WvM8qB/IAeTfe6y6DTqOKDUu97ZP9HdAe3o/pvuK+JW9l8EZvv8LAADIlcZm?=
 =?us-ascii?Q?TtYMR8ci1VyspZ6GDvbgnkSKC2LedCQelxvUrkG1Hqa8Y6uucd4eZpYorCtQ?=
 =?us-ascii?Q?UHjUjFIvF/utnZlGTxYdyFfl4nNdq3sw3x7qVkwOsdlIVLikm009kRN++4bZ?=
 =?us-ascii?Q?xzvtKFi2aw3akRnhpEoFJ81aW6cu+MGgTgooovqlncK0GZy8KuWFIpZUetFd?=
 =?us-ascii?Q?3+nLY1XB6VizbfCm6yAhcMqisaovKrehlGyuI4zOr/1P43xMwfmlpM0C5Oap?=
 =?us-ascii?Q?TUwuvlKtUAm5+hwKuBQDBUEn41nZ+vHiH2RKWf8xbksU01PiF2KtXALGKZIf?=
 =?us-ascii?Q?MJly44sMITn+OhxdhIE6/GDUzVVtHjxDfbr6qlQAJ778KiKs39nRPZZdR7+n?=
 =?us-ascii?Q?bEdkLMfj21ZJOsx3ttTKqjDyRrefDBTLDI1N3wT8R2larCscLNfkH/8fy48m?=
 =?us-ascii?Q?QMHnZugfkMHdgiFqG/jl/scLX9tD3v44e+XR1cFOQz7xjM07rKUJANr9Fmxy?=
 =?us-ascii?Q?GIeuyeH6xYtHm1pSK47/u9U6YZuIR0S+7cwVJpfPrg8rwUy5cpRTIV/eO2Ht?=
 =?us-ascii?Q?vBe7meKR+Wa942Ez7USAEaOBeSorVfTm5tBma1OKGXdE1DbIiZJuruIreSDJ?=
 =?us-ascii?Q?QMWpRQ0HUkoqk7/21uZsc4HbqHFqNdcXlEsGpCVTL+vmEDLZe400LZX9Fgp0?=
 =?us-ascii?Q?qi7kZN2jZgCafdgTGXWe9UjXE9nodGUCkORoCU8xONP/5yaSBy6ObJRH7ADK?=
 =?us-ascii?Q?E0qA401tcKHM0dft9+gC5F0jfY0ffQQEUUM4+QY6Gs++lPbqz68Y6Mhsv4f/?=
 =?us-ascii?Q?mX6q0Jqg0V8Qx+NazGdIWUKBJSAo/Oy9W4igBAc4Tt6N16OynDGYN7kWExzs?=
 =?us-ascii?Q?sPJTs0gLg7pvjOOtH+cbwH7lh5MGWhTe2lCn5JVUW2voZNmjHrAP7STIJDxN?=
 =?us-ascii?Q?OIBrE+bnTjUnUdrKTDdmZ63TihIw97GAX3i4gKUDygGBSIEcsR5mEPiiTts6?=
 =?us-ascii?Q?xzhv0jKRrqxUaB/MA2S5ZGrZ3mGSYrXWCJ+rr7SrIcRNlnGSxCJfhzbw3+pI?=
 =?us-ascii?Q?arzHp5b56EaaaQiKMPiWzSm1ItqkgXL1iBnDCEe2Y1LmtBsBC+LX8r86kMW2?=
 =?us-ascii?Q?FswexpPxSQrULoWTzVGiZkHOPkn/iSXBZ+MHR5/ydOJOQGGvPUVaiPa7mlsA?=
 =?us-ascii?Q?vRJP6TPk7dsZE6L3Mf5576hRP2YMFnZOtW0O5AJn0/KDQpmouaFU7OOLSj+0?=
 =?us-ascii?Q?sgrkzUYsW5XCwpi73lrbmCcdtktrPGsuonDtnBT2UcaiLOV7sx65Rq7SJEdv?=
 =?us-ascii?Q?muRUAg3y1NGrm7O29D/Cio45YTiqXMlaUi9+KWgvU6FRnIQgzbLY953rmGTi?=
 =?us-ascii?Q?w+OaXfKelgWT37w48MWc/lOa4z5W520PhtiDjH1wO4e/j0ittb9d3fY2qYNC?=
 =?us-ascii?Q?gchjqHuVydgYFH228di7jYEsViiRm+fDuDoZuWMn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8ca126-b199-4331-9be1-08dbb08515b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2023 16:03:04.3881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zORgdTb8zLOV8x6jTIVSamxKtpOjvyyixGAbPc2Y7nxGz+t++OL38iabamVGBUg6EG8rOLIwkdvlLAbCk1EhKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6530
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

Hi Greg,

Thanks for your review

> From: Greg KH Friday, September 8, 2023 9:39 PM

> > +struct ljca_bank_descriptor {
> > +	u8 bank_id;
> > +	u8 pin_num;
> > +
> > +	/* 1 bit for each gpio, 1 means valid */
> > +	u32 valid_pins;
> > +} __packed;
>=20
> This is an unaligned access, do you mean to have that?

Yes, this is defined by the firmware, we have to keep
the same structure with firmware.

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

It can be u8 *, but it can avoid many cast if with void *.=20

>=20
> > +static void ljca_handle_event(struct ljca_adapter *adap,
> > +			      struct ljca_msg *header)
> > +{
> > +	struct ljca_client *client;
> > +
> > +	list_for_each_entry(client, &adap->client_list, link) {
> > +		/*
> > +		 * FIXME: currently only GPIO register event callback.
>=20
> When is this fixme going to be addressed?

Actually this is following firmware, and it takes some time to fix
firmware issue,  but currently it doesn't impact the functionality.

>=20
> > +		 * firmware message structure should include id when
> > +		 * multiple same type clients register event callback.
> > +		 */
> > +		if (client->type =3D=3D header->type) {
> > +			unsigned long flags;
> > +
> > +			spin_lock_irqsave(&client->event_cb_lock, flags);
> > +			client->event_cb(client->context, header->cmd,
> > +					 header->data, header->len);
> > +			spin_unlock_irqrestore(&client->event_cb_lock, flags);
> > +
> > +			break;
> > +		}
> > +	}
> > +}
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

Sorry, I'm not familiar with this cleanup.h, and also I don't get how to si=
mplify
this function after review the cleanup.h, could you please help? Thanks=20

>=20
> > +
> > +	if (tx_header->type !=3D header->type || tx_header->cmd !=3D header->=
cmd)
> {
> > +		spin_unlock_irqrestore(&adap->lock, flags);
> > +
>=20
> No need for a blank line.

Ack, thanks

>=20
> And how can these things happen?  No need to return an error if this is t=
he case?

In case something wrong happens in firmware, and yes, I will add an error m=
essage here, thanks.

>=20
> > +static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
> > +		     const void *obuf, unsigned int obuf_len, void *ibuf,
> > +		     unsigned int ibuf_len, bool ack, unsigned long timeout)
>=20
> That's a lot of function parameters, whyh so many?

This function sends command to firmware. The command is composed of the com=
mand header
And data buffer which comes from the function parameters.

Also some commands have response, and we need external buffer and length to=
 copy to =20

>=20
> And why void *?  That should never be used in an internal function where =
you
> know the real type.

Ack, I will change them to real type for the internal function, thanks

>=20
> > +{
> > +	unsigned int msg_len =3D sizeof(struct ljca_msg) + obuf_len;
> > +	struct ljca_msg *header =3D adap->tx_buf;
> > +	unsigned long flags;
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
> > +	spin_lock_irqsave(&adap->lock, flags);
>=20
> 2 locks?  Why 2 locks for the same structure?

The mutex is to avoid command download concurrently.

The spinlock is to protect tx_buf and ex_buf, which may be accessed by
tx thread and rx thread at the same time.

>=20
> > +
> > +	header->type =3D type;
> > +	header->cmd =3D cmd;
> > +	header->len =3D obuf_len;
> > +	if (obuf)
> > +		memcpy(header->data, obuf, obuf_len);
> > +
> > +	header->flags =3D LJCA_CMPL_FLAG | (ack ? LJCA_ACK_FLAG : 0);
> > +
> > +	adap->ex_buf =3D ibuf;
> > +	adap->ex_buf_len =3D ibuf_len;
> > +	adap->actual_length =3D 0;
> > +
> > +	spin_unlock_irqrestore(&adap->lock, flags);
> > +
> > +	reinit_completion(&adap->cmd_completion);
> > +
> > +	usb_autopm_get_interface(adap->intf);
> > +
> > +	ret =3D usb_bulk_msg(adap->usb_dev, adap->tx_pipe, header,
> > +			   msg_len, &actual, LJCA_WRITE_TIMEOUT_MS);
>=20
> This function is slow.  Really slow.  You drop the spinlock which is good=
, but the
> mutex is still held.  Does this call have to be synchronous?

As I said above, the mutex is to avoid more commands downloading to firmwar=
e
before the current one is completed.

>=20
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
> > +
> > +out:
> > +	spin_lock_irqsave(&adap->lock, flags);
> > +	adap->ex_buf =3D NULL;
> > +	adap->ex_buf_len =3D 0;
> > +
> > +	memset(header, 0, sizeof(*header));
>=20
> Why?

In ljca_handle_cmd_ack(), we use the tx header to compare the received head=
er.
If we receive command ack after timeout(though most likely it won't happen)=
, I want it=20
just return, so I clear the tx header here.

>=20
> > +	spin_unlock_irqrestore(&adap->lock, flags);
> > +
> > +	mutex_unlock(&adap->mutex);
> > +
> > +	return ret;
> > +}
> > +
> > +int ljca_transfer(struct ljca_client *client, u8 cmd, const void
> > +*obuf,
>=20
> Again, drop all void * please, use real types in your apis.

This is the exposed API, usually it's void *. I can change it to real type,=
 but is there any
rule when to use void * and when to use real type?=20

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

Ack, but I will remove the #ifdef because it ready has 'depends on ACPI' in=
 Kconfig,
Thanks.

>=20
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
> You warn about these things, but keep on saying the code is working prope=
rly
> with a return of:
>=20
> > +	return 0;
>=20
> That's not good.  Why not unwind properly and handle the error?

This is to be compatible with old version FW which does not support full US=
B2xxx
functions, so just warn here and keep the code going. Thanks

>=20
> > --- /dev/null
> > +++ b/include/linux/usb/ljca.h
> > @@ -0,0 +1,113 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2023, Intel Corporation. All rights reserved.
> > + */
> > +#ifndef _LINUX_USB_LJCA_H_
> > +#define _LINUX_USB_LJCA_H_
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/list.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/types.h>
> > +
> > +#define LJCA_MAX_GPIO_NUM 64
> > +
> > +#define auxiliary_dev_to_ljca_client(auxiliary_dev)			\
> > +		container_of(auxiliary_dev, struct ljca_client, auxdev)
> > +
> > +struct ljca_adapter;
> > +
> > +/**
> > + * typedef ljca_event_cb_t - event callback function signature
> > + *
> > + * @context: the execution context of who registered this callback
> > + * @cmd: the command from device for this event
> > + * @evt_data: the event data payload
> > + * @len: the event data payload length
> > + *
> > + * The callback function is called in interrupt context and the data
> > +payload is
> > + * only valid during the call. If the user needs later access of the
> > +data, it
> > + * must copy it.
> > + */
> > +typedef void (*ljca_event_cb_t)(void *context, u8 cmd, const void
> > +*evt_data, int len);
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

Ack, I will add doc for these public structures in next version. Thanks

Thanks
Wentong
>=20
> thanks,
>=20
> greg k-h
