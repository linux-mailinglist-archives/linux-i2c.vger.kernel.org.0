Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85FD978BD49
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Aug 2023 05:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235614AbjH2DaS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Aug 2023 23:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235597AbjH2D3y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Aug 2023 23:29:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547E5110;
        Mon, 28 Aug 2023 20:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693279790; x=1724815790;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=p+VnkxP47PvYL9ijrQup/bn+E9pEMrwGo+T3w1cShVw=;
  b=dCUfrsWSYDaq1LRwTGe4/5m0/VyPESdX4MCEIXkxGCrn/xlODtsZCxNc
   K9A8A30i2TtwO45bp/Dn6iUgqx7OhrHtZofm46gnlEPAlq1t/OLQiWmer
   q0jPl5Yb7ShXNeAhd65v/X1TuPhRSQ2SUvQWOPkEj49PUhKVgx7/mKcHx
   +AOaUwYaWINDq97/N9k2TOSQe4NvjoSZAmo2g/3zBZDmYRsQiI4XkCJNC
   9AuOzn42Nvv0bCociYV6rCNyEMkQpSMyLolhDjKd1Ka4HUw4TF5DUa4jF
   FqIAtmxFQajOnmCTA9VcJjIPzwcMHPiLOZzjowNPt2DBXIN/fWxjrXfHi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="461629818"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="461629818"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 20:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="1069307920"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="1069307920"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2023 20:29:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 20:29:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 20:29:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 20:29:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 20:29:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I276kL4JoRR+Q8xdZswQuCUGPiUmxLYDRh1cth4vGeBEKCZrImEu31dg8Gx8oF75RSinLqHN/h/Sqh2uR+xhummJOC+j2T0303KBHqKN1nurBCB+b8xlwKuuJbZxIHLAS1c9nNYSNE7OinJKwhqKg7R3WmSQikJvEamxVwfsyt9QPvqTSppBr3Cfv5VL8V9qdB0GWGbAkRhb2HDVXNgi6+6qvrnFWXLT3zQ3QNJt8KtTOKedg7FDwFVXcl9WjK0wGrIqywogs/BcvjIPrB5NjdhOfO5nzW5CI0P1BTNNTFIOiEWGPWseC2rZA1SKFyov3f9vlcNYXGcl/6dNQedAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k63ogwlj251FFa15ecqZKiHSmmz/Omct/xTFuwAACak=;
 b=dDKq6j1rpzyEM1EZIgNxxYe1lC93aAZwlRMdr1n7DA4TWo/lcMbQxz1iDysrBgXH1G5LY9qEQZ20Ft+b7jqaWGUbh9gn2bONliJaN0YuY0QOh55AhzCZ4Tphnv9RUAtcdvU9bZs8G+oOKzFhgWd16ZQS+5XNpzPbC8fvqk4mkHPa3clQnX3bE3F7TTB3XznsFb4hCVL4LnwndAgv9khMkLkeE0HEPh9t5avLQY3R2xhRjK6P87c656whI1i6B44MBQhX0gljwJmAhojz3mVbLo3iyKAoM3HflGIRLt1RP32qVf483MwRr5MYhwMvp0P6B/W8U3rCRGGr3Saj+LXspw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 03:29:39 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%6]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 03:29:39 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "lee@kernel.org" <lee@kernel.org>,
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
Subject: RE: [PATCH v10 2/4] i2c: Add support for Intel LJCA USB I2C driver
Thread-Topic: [PATCH v10 2/4] i2c: Add support for Intel LJCA USB I2C driver
Thread-Index: AQHZ2HMfV46vDfy+K0Gogfafhp4on7AAGaIAgACB5lA=
Date:   Tue, 29 Aug 2023 03:29:38 +0000
Message-ID: <DM6PR11MB4316FC089596F44FB02314B18DE7A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1693091643-20867-1-git-send-email-wentong.wu@intel.com>
 <1693091643-20867-3-git-send-email-wentong.wu@intel.com>
 <ZOz0bgJUZuAcUBWf@ninjato>
In-Reply-To: <ZOz0bgJUZuAcUBWf@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|BL1PR11MB5979:EE_
x-ms-office365-filtering-correlation-id: 6e82d591-6200-4616-a243-08dba8402cc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tb6LH3+7TyveGOkoRHKQyC40CnT+0eu/agKQeOIksqzACYGKOMs50K5PV58PTdjCkbCCR3dClu2gBP0JBfi4PJ90nv/YsiHSchNgatAKh2V6zleRVovrBuFWTcxeBIvAbCwYqAvT0APPpG7QhnFyUC9Rxvisg9cCZVmF8vzGyYnBGGZ/4uIgCbg9YbF/p5tmEq55Hh0iLpkUk1gTNveZFIqBjbvqD64EwrL4y97Jq1cCu7bnY1QfdStpVRaa9yA5t9vO3yg8OfE7b/b84jDMzdQt/3G/T1vI++nrfexcXkq8GUtocBJhGEEQcrvbjYfXP/7OuLaApiJn1UR6yMDHHIdbNryEbxskNKtI+/nD8T+rZ1T2+2iYKSWEYvq8BGIz+lZhgiZgQdQJ4V3/6n8eoTfFXnyPmA9Wkykbj1RQcIUje/zFfPs62+gg7Fmtv455cjbp/5jKRKj9n/rvDSr052D+3IBAPvIEF2QuIkNzDaeth4VnUxrnwVQ5ahKtAydOOHVq1e9NMk5bzp3lpY/j3jatQBO6ExdcAzutnHE2O7VY4KlDpOd1LxQ072o5LisCyxRG2aXsHwSuIOZlu/anyZ4abWwgIzqrAzt0UVF5R/Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(136003)(366004)(186009)(1800799009)(451199024)(9686003)(7696005)(71200400001)(6506007)(83380400001)(478600001)(26005)(2906002)(966005)(7416002)(64756008)(54906003)(66446008)(6916009)(316002)(66556008)(66476007)(66946007)(52536014)(76116006)(5660300002)(41300700001)(8936002)(8676002)(4326008)(33656002)(55016003)(38070700005)(38100700002)(82960400001)(86362001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VzdEvsglcq/6btcNxVha3K/yT6gJMv1uawLgoYavN5+ZDx6GGA05QtaEb9et?=
 =?us-ascii?Q?luh4KgCXUUn6Bsky4KgZRY6I76S7UOX8+7ewoA48kYV+KxxtTQo/2K5zTpIO?=
 =?us-ascii?Q?gM5plF3nDpis6Uee27CX+qYtb82C/d7kI2aVA9M0nlzTS2WYsrAX/OUCr4ir?=
 =?us-ascii?Q?H2jQ3komnpStAVgElKJ9yPxRrF5z+QlYtMustakVTuXVKYkHWML31c7jqf9d?=
 =?us-ascii?Q?QtQBEHvVHA15YilmTQPenZHoPSlSFvb4HTrJZjo3bq1CrzDufXyyQ20fYpOf?=
 =?us-ascii?Q?HbC08bDTzJprP73iOU1kg0Mp1Y5vt0LKfO0DW7UCRL/dMrbkHoOFW/bGEfzu?=
 =?us-ascii?Q?mjp8SIqX2jp+MwnSp0W2JNgrpzTp4v0QFb1fEEDhSuMfSlDz1ebwGGHN4XBH?=
 =?us-ascii?Q?03X7mBZG+TenzYXZhcjXxw2LKjH955iKsVcIMn4DqzBmijcjodN30U8PJ631?=
 =?us-ascii?Q?bLpED1cucBpNtE+Xdfya4YtxG3r2oBobTkN0n9+dyqAv0TPcQaysCTl9I30Q?=
 =?us-ascii?Q?guBbdlRc8vPnJ6CRMRsYH7dGHUYFqfhoYBo7UgSCkFWMj9jhCNUxYkD03+dX?=
 =?us-ascii?Q?f9f14pt3JMe9x6IVRVLs6wQSc7nkLm664eneci3w1EhaGzQ6vADtvgGeOuMO?=
 =?us-ascii?Q?3yk8hNgC84ierhvZcootfR55Br8t/JeUaSEbJ/Ml4g+U38okZnIDWDBg+ONs?=
 =?us-ascii?Q?DAPXYZJ2dWNQwfk/Lg4ygTOfvX0qljERitme0oTDglk6eB4WxsAtRvet1tPd?=
 =?us-ascii?Q?AuoWuvWoCe0F8aoDV9m0gTxrzGcmGIYj90tn2lW71P9HpN4KjqW3AFDu/ja5?=
 =?us-ascii?Q?a2XKUDkT2cWuLbwrCKvI8DJ16ZLXkHobKRFi7c+ylnWMgGWWaYpTIFK+Xp+V?=
 =?us-ascii?Q?gvoJoPjKFPY86mpe7N/65AIMDOyjrf63d2Fj8mAQc2mKGKt1ZTs2cw1w3TrC?=
 =?us-ascii?Q?gIcQc5ahe/KKnUqpVetq+FN9PKAX2s1o9mYlQ3gY+njHvkqCx1LloyX8i6Ve?=
 =?us-ascii?Q?jioITRQLL3nvJIdDQXy6VXsFdBcKlrGzc31w04LH6WpyrFwwYGJYNFgW5BcK?=
 =?us-ascii?Q?IaeopJ2S1k9O3ojKqYRQ1aImFVTlPBN532yeKx4E8Dao6z1gqsLg8PqZV+Sb?=
 =?us-ascii?Q?By34TdOvQNQl6XOl9tI1cDVsdVKiUJsIKfXlNt5zxHasQ9wcdLzbevJim58P?=
 =?us-ascii?Q?XQg5Uvb48WnFEnuQWO0sZ89RrD1uurGEJ4WfEa2YZLbquNVmt730bmKqWkgP?=
 =?us-ascii?Q?cl4rl934/YmAF6tNQF22fwW4kbuYQeowAXsYe4oQT3tXGUFWEBncpukK9rVr?=
 =?us-ascii?Q?3hTUseU0E0gaJI3yTguykoTD7VhUzt/lK/TPIlnG3gVLBvb7x/Vy8jtGUvPo?=
 =?us-ascii?Q?h6LMFRp7Vgq6M5mqG3bfLktBDOJhwqqmC3cuC5lTWbg6RdLuViO9gWiUluqd?=
 =?us-ascii?Q?2tHXbZ3gtIAI6XvqwEu1kbpXrg04W48bUTHFSPo5bdfXG3NMztiaAL9rWupV?=
 =?us-ascii?Q?MjitzNNIxi0pYrufh5OD97zNVYBTOuK5g5FsGysq2KI1rm2v+kB/mY6QZ+8W?=
 =?us-ascii?Q?mBpXT9Gi0vIFJSRdp1aqHIbLw8PhlqCRjV/BvzQo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e82d591-6200-4616-a243-08dba8402cc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 03:29:38.5083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ARmX6uxIu2dDmUSyL+Gsy6YZPul6y4oQWeO4n1yUVEtBifnnWhqSdEQRpCH+HsDayqSPR3tYO/TxCSHQnC7Rsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5979
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thanks for your review.

> From: Wolfram Sang <wsa@kernel.org>
>=20
> Hi,
>=20
> thank you for your patches!
>=20
> ...
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
> > +	w_packet->id =3D ljca_i2c->i2c_info->id;
> > +	w_packet->len =3D cpu_to_le16(sizeof(*w_packet->data));
> > +	w_packet->data[0] =3D (slave_addr << 1) | type;
> > +
> > +	ret =3D ljca_transfer(ljca_i2c->ljca, LJCA_I2C_START, w_packet,
> > +			    struct_size(w_packet, data, 1), r_packet,
> > +			    LJCA_I2C_BUF_SIZE);
> > +	if (ret < 0 || ret < sizeof(*r_packet))
> > +		return ret < 0 ? ret : -EIO;
> > +
> > +	rp_len =3D le16_to_cpu(r_packet->len);
> > +	if (rp_len < 0 || r_packet->id !=3D w_packet->id) {
> > +		dev_err(&ljca_i2c->adap.dev,
> > +			"i2c start failed len: %d id: %d %d\n",
> > +			rp_len, r_packet->id, w_packet->id);
>=20
> All dev_err look more like dev_dbg to me. They are not helpful for the re=
gular
> user, I'd think.

Ack, thanks

>=20
> > +		return -EIO;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
>=20
> ...
>=20
> > +static int ljca_i2c_pure_read(struct ljca_i2c_dev *ljca_i2c, u8
> > +*data, u8 len) {
> > +	struct ljca_i2c_rw_packet *w_packet =3D
> > +			(struct ljca_i2c_rw_packet *)ljca_i2c->obuf;
> > +	struct ljca_i2c_rw_packet *r_packet =3D
> > +			(struct ljca_i2c_rw_packet *)ljca_i2c->ibuf;
> > +	s16 rp_len;
> > +	int ret;
> > +
> > +	if (len > LJCA_I2C_MAX_XFER_SIZE)
> > +		return -EINVAL;
>=20
> You can remove this check. You already have a quirk structure, so the cor=
e will
> do it for you.

Ack, thanks

>=20
> ...
>=20
> > +static int ljca_i2c_pure_write(struct ljca_i2c_dev *ljca_i2c, u8
> > +*data, u8 len) {
> > +	struct ljca_i2c_rw_packet *w_packet =3D
> > +			(struct ljca_i2c_rw_packet *)ljca_i2c->obuf;
> > +	struct ljca_i2c_rw_packet *r_packet =3D
> > +			(struct ljca_i2c_rw_packet *)ljca_i2c->ibuf;
> > +	s16 rplen;
> > +	int ret;
> > +
> > +	if (len > LJCA_I2C_MAX_XFER_SIZE)
> > +		return -EINVAL;
>=20
> You can remove this check. You already have a quirk structure, so the cor=
e will
> do it for you.

Ack, thanks

>=20
> ...
>=20
> > +static u32 ljca_i2c_func(struct i2c_adapter *adap) {
> > +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL; }
>=20
> Have you successfully tried SMBUS_QUICK (e.g. with scanning a bus with
> 'i2cdetect')?

Thanks, we just suppose it support SMBUS function after reviewed the
core code, but never try the SMBUS functionality, so I decide to remove
the I2C_FUNC_SMBUS_EMUL support currently and after we verify it working
correctly, we will add it in another patch.

Thanks

>=20
> ...
>=20
> > +static int ljca_i2c_probe(struct auxiliary_device *auxdev,
> > +			  const struct auxiliary_device_id *aux_dev_id) {
> > +	struct ljca_client *ljca =3D auxiliary_dev_to_ljca_client(auxdev);
> > +	struct ljca_i2c_dev *ljca_i2c;
> > +	int ret;
> > +
> > +	ljca_i2c =3D devm_kzalloc(&auxdev->dev, sizeof(*ljca_i2c), GFP_KERNEL=
);
> > +	if (!ljca_i2c)
> > +		return -ENOMEM;
> > +
> > +	ljca_i2c->ljca =3D ljca;
> > +	ljca_i2c->i2c_info =3D dev_get_platdata(&auxdev->dev);
> > +
> > +	ljca_i2c->adap.owner =3D THIS_MODULE;
> > +	ljca_i2c->adap.class =3D I2C_CLASS_HWMON;
>=20
> Just to make sure: you want class based instantiation here because you ha=
ve no
> other way of describing clients?=20

Actually it's about the method 3 of instantiate I2C devices described in
https://www.kernel.org/doc/Documentation/i2c/instantiating-devices
and it's not preferred wherever possible. And below are the definitions
about i2c adapter class, we only have I2C_CLASS_HWMON class tested,
so just put it here.

/* i2c adapter classes (bitmask) */
#define I2C_CLASS_HWMON         (1<<0)  /* lm_sensors, ... */
#define I2C_CLASS_DDC           (1<<3)  /* DDC bus on graphics adapters */
#define I2C_CLASS_SPD           (1<<7)  /* Memory modules */
/* Warn users that the adapter doesn't support classes anymore */
#define I2C_CLASS_DEPRECATED    (1<<8)

BR,
Wentong
> I guess it makes sense for USB, just wanted to
> ask.
>=20
> Other than that, it looks good!
>=20
> All the best,
>=20
>    Wolfram

