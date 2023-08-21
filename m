Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85AB878250D
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Aug 2023 10:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233898AbjHUIDY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Aug 2023 04:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232820AbjHUIDY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Aug 2023 04:03:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2159B8;
        Mon, 21 Aug 2023 01:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692605002; x=1724141002;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+fY/VmXaoxe7bBD+ljw4WFarKRxNWqa4OTFgeBaivl4=;
  b=nJE4C2p2i9/7bZnNwDF4cOWtylTCxOZSMlXMD2tvgR6akZjN9XZZeRP0
   5R6eRW2aiB4mEavSC1CwSFsGHYOZvmxzY8Zj6gWtkaGfvLEbZqgcNGYkY
   SXfzTPADiQqTu6ZqqXP4oyPa3DFZGLUG18u+bxTPX67F6GAyQzAKOawxw
   1UhkvgY9anlO5TSVEZxa/M1icGyI1pSLMGimkDszzlCiYt80YhQrdtjxC
   AQpxA3qWgXp5NMc3JY89qggtb0cUFA3I3cTh1KPaDIBvW2gB6+GS9X20v
   7+MMyp1rHJpFkoE5DBqkmnjqe1pzpT6OPLT7D3ADUyC+6AH4NWN6kxCei
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="376278571"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="376278571"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 01:02:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="879427600"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2023 01:02:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 01:02:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 01:02:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 01:02:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 01:02:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kl5OODUAmDk6rupaX6UuWeZcXktLR+yIQvP37JiKjDU3Z61va+dChwTGBAbr765IzKz5njG7bWQFpFYrNmg5b5/IQy9YP9XNbgOJI+s2LXD2A8OySIu+bsbyYo9iGpG+rHz0Vj5fxjWTAZiZfzirFSmEi9y7C4iB2hHQgV+PoipBmA3C4NFfziE1NbSgCqNbOJvHngenOnovw1UYTJR0w0tg7g75bbTRN42dqhHc6VGLu5NkOIODG26m1jeiUaTU0eaLaqhwY/wgRo3j87gjlb2Jgr/eLK5KN9Cmzk1zArS5J4Mj0ok6EDVssnqq/j7o2CBpJIj2RtEGIcbmMm+GRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xbl8TntVDwZPF2eJPMFPosZ96Vk+vhas0QbUZeVmm4w=;
 b=es6Mmo3wOJPGLj9RnDl5H2Gwuzm0SWhgIxUkM0h3vYjs+LTMtbJKRJ6NjtinQtpu2vvSWKnXDaAzu74fBFDuZzzGmoP5a9DRXPiLjDFsVOKSIXBCyh2IPUK/uzI67XPa/L1ws5lJ6ftJSWHcOaoPN+OOuGCK0J5TPsZj9snSazZoAdkb0mz6DUsXE+FTu1sybvnD9aUa34d0pJUlkVAGr8bxmCxZUUzpz/5aY1/l5rCl5QOQuoLSu75cXnrJ6J9sYyeShYlpHyAqQqMk6jEJZeS7awbymppdA/d2nhwpET3WKXZPzwL+pR74/w7kHQmUYv3rJ0Mg1R5VM/v6JKCvuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DM4PR11MB5565.namprd11.prod.outlook.com (2603:10b6:5:39e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 08:02:30 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::3dc:446f:8474:1710]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::3dc:446f:8474:1710%4]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 08:02:30 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Andi Shyti <andi.shyti@kernel.org>
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
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: RE: [PATCH v9 2/4] i2c: Add support for Intel LJCA USB I2C driver
Thread-Topic: [PATCH v9 2/4] i2c: Add support for Intel LJCA USB I2C driver
Thread-Index: AQHZ0JGQEHA/i1kSe0mQruAZ8XWwc6/zbrwAgAD6qgA=
Date:   Mon, 21 Aug 2023 08:02:29 +0000
Message-ID: <DM6PR11MB4316A07EC19557605F09134F8D1EA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1692225111-19216-1-git-send-email-wentong.wu@intel.com>
 <1692225111-19216-3-git-send-email-wentong.wu@intel.com>
 <20230820170118.vdhtror3cfizbkfh@intel.intel>
In-Reply-To: <20230820170118.vdhtror3cfizbkfh@intel.intel>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|DM4PR11MB5565:EE_
x-ms-office365-filtering-correlation-id: 946fa213-48e3-4e15-c85f-08dba21cf78d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tBmHpB4E9OT8wFU8U1EPU2eguHDeerOTgJ8xtXaKIhXVR3RPRhRgn1PevE06HnMtnhFi6mpXeEXII7VJJvWIGcehn3LZXMB3DHeVctWqwzl/DZwDE+NlPt25dJ7SFu/ZBxB/1dj9J3l/bIuLDy4T1ELCVexbha/cY1U61zsvlj8AMCdLrcUdyGXDYDaX69l5nAW9yz+qSDTTjXYkBlKu/EmJlcELSfHdNficw30BOwlSfeUo0A7B+9B0QAiIUHT00aDCU2NJxScdf7y0NIebn8eNKf0yzpF4tl+cQr/Y/oTDpJkzru+2H7tydK/Y/kqM59neOfy239IaGeoytn82mKsWcwC59khZdyiQzOhvRlid/UTiw1yV3DSgka+vG8/Fu+rdyLy+7nAKClY0ifurh62SnnqvvTAi0KuJo/o9FQcZYmVTp2Xckiwft9hVafN0rxXLlNTbLfTXDCAYEkNOTQ5EyYGDytozH5KxPALljoApgc0i3qho/A3yWucgGqJKdtfJG9V/FFaxaxUUIg3DAppXAR7hjcs5oSJBEC2Ky8MxcxgGyFQm+h46scKD7JWw3z29O27SY2NLiGe0qNTZTUehtiTzNDjbyWw8EqvkJTXakmGtuYJ4E0fQad2jVewI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(451199024)(186009)(1800799009)(2906002)(66556008)(66476007)(66446008)(64756008)(54906003)(66946007)(6916009)(4326008)(5660300002)(52536014)(76116006)(8676002)(8936002)(316002)(41300700001)(478600001)(6506007)(7416002)(71200400001)(7696005)(9686003)(26005)(83380400001)(122000001)(38070700005)(82960400001)(55016003)(38100700002)(33656002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wIt1S59NzaceUo/o5Y4Ilyte5PD1fxl8cy9GL5nB7snOXhMa7Nz0LQRHEm85?=
 =?us-ascii?Q?2rEk0j57WO/z0rctRKWxKalqtDtTGQf2C6e4HH/s7j+MkVQRIjNDXo+Mf2kW?=
 =?us-ascii?Q?ldIf4P9oX0gp8N2mJW3KklFpTrAXru5TNSiE8+Jv3QWBH1Yhc0NkrF9fm5UM?=
 =?us-ascii?Q?kxk3M6ayQRYcoPEuwcBKTMB9UG9z2gIuj69OpiAdrNiu/SmmXHAQGudjk2Kw?=
 =?us-ascii?Q?Amdl/fvAl1xX/YD5DzyyKdjEJWoi1zFeA5S6OGUb9v7oKQ+jmLr0tkWmKgXm?=
 =?us-ascii?Q?j7e99VwJuF1LtcmBBGVGkn5naiz/nT2zr4pkLOlzzqdNEurC73UfwYDM00Kk?=
 =?us-ascii?Q?OQvZpDjd9XuYQ1amlzX3VyrcSdbPiYCcM7lgeE3/JSflzW48gxKZCmjbphL+?=
 =?us-ascii?Q?UmbcYSx99NjAD06xyWxUO7IIZ9ooXMxMIDafS9P+IEPCrZquwzTjmlYdiFNx?=
 =?us-ascii?Q?B7QrOuGIsePeHosFp/bv+8/vTWcUdfLgeZVSUgPx3JsLD/akm4q5W+AWeYnI?=
 =?us-ascii?Q?D27PqzSmSVwzvujRyJWbV6mwV/xn2fndvtyLosS+78EoSubybwFrLbTaQUEs?=
 =?us-ascii?Q?Ia7+/R7ff5rqJtBd13yL8HkLFayUG5LNWi7sEz4SG7MjaYHKGYwNL1Di/TK3?=
 =?us-ascii?Q?etz5k9YJ03JNnIIV9e1lgqSezne03+S1kta+pYKKSNrhydJbB/GFvo2LOEXd?=
 =?us-ascii?Q?JnvSQyyzPXXitPGroJ0AyFk+MTdsU3GraXcY9AOsx7kQWMWzESOw1pCaTMuM?=
 =?us-ascii?Q?yQL/+rfmkz23AzEJ++b5cCWRBXlODw/tNDzI8iqwSvZfzS16P1qYj4MwtwH/?=
 =?us-ascii?Q?E6dXxv3CILH5w3EB593ivxDSK5QXjbsnqQZhvo0zxGZPWWE1aaf8oWO8xnkb?=
 =?us-ascii?Q?IE1C6x7Kt0cvMbV9Gc0HwT+3OJsJcE5kltynN435jnH0gPDWksE6CKpcZv7S?=
 =?us-ascii?Q?g7oZmZNk5YNUcmqBjfpin8KU5DB/hihVEzxasK5i3PLujiivXzp8dPZdoei9?=
 =?us-ascii?Q?xXV8CTEX+sfdIarG9PoWZ474i3FHoiXLmHyn5WmYi+YtzqSJYeJw6JQnFxAZ?=
 =?us-ascii?Q?God2F14oZK9u32VHSzWPwolDbTLmkd0fT8QQtdabWAQWY8gAtA0xD+3fDXgS?=
 =?us-ascii?Q?r9A371Hw+iKaQfcpyPGA8MnQvKJcTc7S/XNPTz9mV8rpZhehZSHk5Ci0YNH0?=
 =?us-ascii?Q?wQc73XvAAN8jjACdlZ4eucWCSJS0p3+8OFB/HFuEs+hSy9bAV0l5ZLldKa2i?=
 =?us-ascii?Q?32SptPPyhKQK5SdR+3h+pstgYFonNSvS8cVN/V7yC/fgVvwWwLSnUlP5GWjC?=
 =?us-ascii?Q?7MUo3FRJH58aNe2V98IUi75N0ZiJojAwH4KX77VEvD2FXnKqE0fCkvjrDABO?=
 =?us-ascii?Q?b3MXOGfOW9eD88ImT8pJ0UTTCwz6pj6QuKrAXDrDi5JJ+Qw7kyzRiB83mHsB?=
 =?us-ascii?Q?qqONvhw5E7QIdjhGI438igrBub/qOdZZ0DxT+2j1U2g/gta2qXixLYzfxaor?=
 =?us-ascii?Q?qZpxAuWiay0cjMz+1tDwhU46BIzAGHi1iB/1x5ezDE0WaKmKldjYBFk76OuK?=
 =?us-ascii?Q?EkfcDoo7hRC1fmdR5nrwNuvLDMwbpua5sMwp25Il?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 946fa213-48e3-4e15-c85f-08dba21cf78d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 08:02:29.8826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jWlTOsN8m/Dwk2QcyxiCy+bGGgOnMI1lbABrDLO4FAk70GfvNpRRmNpVgDavngRlFzsY79c6//kZSMtz3Cqg0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5565
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

Hi Andi,

Thanks for your review.=20

> From: Andi Shyti <andi.shyti@kernel.org>
>=20
> Hi Weontong,
>=20
> patch looks good, just few minor comments.

Thanks, and below comments will be fixed in next version patch set.

BR,
Wentong

>=20
> [...]
>=20
> > +static u8 ljca_i2c_format_slave_addr(u8 slave_addr, u8 type) {
> > +	return (slave_addr << 1) | type;
> > +}
>=20
> this is used only once, you could eventually ger rid of it and use explic=
itely in the
> start function.

Ack, thanks.

>=20
> [...]
>=20
> > +static int ljca_i2c_start(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr=
,
> > +			  enum ljca_xfer_type type)
> > +{
> > +	struct ljca_i2c_rw_packet *w_packet =3D
> > +			(struct ljca_i2c_rw_packet *)ljca_i2c->obuf;
> > +	struct ljca_i2c_rw_packet *r_packet =3D
> > +			(struct ljca_i2c_rw_packet *)ljca_i2c->ibuf;
> > +	s16 rp_len;
> > +	int ret;
> > +
> > +	memset(w_packet, 0, sizeof(*w_packet));
>=20
> do you really need to set this to '0' as you are initializing the header

Ack, thanks

>=20
> > +	w_packet->id =3D ljca_i2c->i2c_info->id;
> > +	w_packet->len =3D cpu_to_le16(sizeof(*w_packet->data));
> > +	w_packet->data[0] =3D ljca_i2c_format_slave_addr(slave_addr, type);
> > +
> > +	ret =3D ljca_transfer(ljca_i2c->ljca, LJCA_I2C_START, w_packet,
> > +			    struct_size(w_packet, data, 1), r_packet,
> > +			    LJCA_I2C_BUF_SIZE);
> > +	if (ret < 0)
> > +		return ret;
> > +	else if (ret < sizeof(*r_packet))
> > +		return -EIO;
> > +
> > +	rp_len =3D le16_to_cpu(r_packet->len);
> > +	if (rp_len < 0 || r_packet->id !=3D w_packet->id) {
> > +		dev_err(&ljca_i2c->adap.dev,
> > +			"i2c start failed len: %d id: %d %d\n",
> > +			rp_len, r_packet->id, w_packet->id);
> > +		return -EIO;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int ljca_i2c_stop(struct ljca_i2c_dev *ljca_i2c, u8
> > +slave_addr)
>=20
> the return value here is not used anywhere, what about making this functi=
on
> void and printing a warning in case of failure?

Ack, thanks

>=20
> [...]
>=20
> > +static int ljca_i2c_probe(struct auxiliary_device *auxdev,
> > +			  const struct auxiliary_device_id *aux_dev_id) {
>=20
> [...]
>=20
> > +	ret =3D ljca_i2c_init(ljca_i2c, ljca_i2c->i2c_info->id);
> > +	if (ret) {
> > +		dev_err(&auxdev->dev, "i2c init failed id: %d\n",
> > +			ljca_i2c->i2c_info->id);
> > +		return -EIO;
>=20
> please use dev_err_probe();

Ack, thanks

>=20
> Andi
