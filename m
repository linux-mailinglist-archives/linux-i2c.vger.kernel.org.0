Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D86D7B378F
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 18:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233653AbjI2QLf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 12:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233301AbjI2QLd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 12:11:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1EF1A7;
        Fri, 29 Sep 2023 09:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696003888; x=1727539888;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yBVXLrEyDuxi4AbykKT37WA0TpNW4VWy31j417LZp7g=;
  b=QF4CLTVGusRwP9xgQd2AVltIadmhhvD8xQhdviUxJik9QEOYdWL/e0b/
   OSr9vQhIPbUntVDmRnaua9CA2rJ7ublY5SVNJHW0o6XN/Nkp2bDHnAF5N
   nj/JxGWlZC0CCqLX3D4qgi7ktNhfhl5Y5gfpT6Oq1z6boh3VIyEKRdXkX
   +acdmX41d1isJn5yBZFbGfVkf1YW3iBlxuaJvIIRWY/sFEnYCXFfX5BjF
   Zy61j/bvSMdEsMT7sfR7vvhY+a5mtt7buzY031aodTFcIp3bf+W/d3uyZ
   xKfPCEXurfvi1uAkVxBi2NLA6T3nP5RDOwVsyLWggPgRDjQ8cZXM9R6Xm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="386195230"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="386195230"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 09:11:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="873723219"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="873723219"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Sep 2023 09:11:27 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 09:11:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 09:11:26 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 09:11:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnemYvdPBzH3UhIBtXMGEXag3baXxlqjlP9HQMiJOMGPSBVdu4Ya62ogwLFobVMLa/+V7sIIm9y/NOepCa3Dj5YqrcQhIzz+JYDqinbFK1Qipv58kl1R5i4bibWO/yzwF5IjqKwZATcDEHuTAQGqO3cmsUx7O+sX89Pbot3x5WDRvbEztQv8jgKMUl8i3xLKrXuj7zbiLWxrR4W5USmdhME122zNdqRoLX3B3Ek/WQ0npDwQOJD/2TsAS23JyaXOLKcpJCfYl1mK3fpsX7+c2sM7bsDenBkeYbvUhDSkDfJ3dKWHQiOPv5DbVQTZdHV8f8TsnnEa8hsRD1T5j3mWcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fr2tzhnv1i+7yOxyiNrdtPn8Sjq1/zrWZVzpVKovwnM=;
 b=i+cU8S4i77pHxSbAPwvMo1z6+Io2kkPUSm1TtidTlRg56K9snIzyhG5j7nTtH07FPNyUaNKXtvDadiEe15LItV/Qbl2YApidfxY312I7NFufBTsUmARjGGp+hMy3oFNjqyLsiVUFyjmtYJrl2Jg2HC/gQfCicNGvyNYzdhMzqO9wdh07tfFaUwB7/xvqsIWC5mFFXaoMIPtrv+1rsbkftWfsMDp60I1U8ogCz4AHItaBtik/cA51M90Ppy8zusIP5kt59NmFkyg/0QBl+EmN30iYr7cirk5vRLybLkAQbhw74McY9KBQKXA/AiV+2/u1sF9/GSpPCXhR5b61bHk64Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by MN0PR11MB6109.namprd11.prod.outlook.com (2603:10b6:208:3cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Fri, 29 Sep
 2023 16:11:22 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6813.027; Fri, 29 Sep 2023
 16:11:22 +0000
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
Subject: RE: [PATCH v19 2/4] i2c: Add support for Intel LJCA USB I2C driver
Thread-Topic: [PATCH v19 2/4] i2c: Add support for Intel LJCA USB I2C driver
Thread-Index: AQHZ6M8pHucFYlFBH0KHbEw9mT3Pn7AxgfYAgABfa4A=
Date:   Fri, 29 Sep 2023 16:11:21 +0000
Message-ID: <DM6PR11MB4316B740D57D4E9EFE4D5B608DC0A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <1694890416-14409-3-git-send-email-wentong.wu@intel.com>
 <ZRaCEI5EZuSx5/Lx@ninjato>
In-Reply-To: <ZRaCEI5EZuSx5/Lx@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|MN0PR11MB6109:EE_
x-ms-office365-filtering-correlation-id: 95c65afb-e01a-444b-8727-08dbc106b8ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: drFYLmU7nBFIXVAZb9mS8ikB98iWNc2CDn8zK66ium4FODitumckjh2yzy6Ro7/2VEzQZuPmNTpKtSion/1V4CmpqvCgVRc7ys2dH+XXkoFEfGohH3icf2y9Rw/d7Yt0a8svCys1SsOGc4ktRIlCuuSFrVfBAARPu+3cjEEgs0UVleC1TgAITiYC6OAk0f2XjJOxvlPxJp0e6fW5NBO2P0sP0KnVztHZFeagdTuK/mvxF6IjPkTq2mYpjOveRWXX4OKMmAnWfD39zje+SrjJbHTcjFh6m2OmQXV+8y8pSLK3kcWrUnBBPm0GKFIzJ2w0jy0hCFCfdYkIMQRT/2GkVh9Tasi0RO+5s/bAh4xWUkH6LM6HBUAxtNyZOkS07ZirMKy1B5IvmlexzhXSChquXVXLyeavthWydqFctyUT6vahpKsN50iQUt3dc1mqtx2oA1ybV0LXEIkalBZZ9sDg1pTNHDktJyf+ewb+CWdSlD2L0uVZFj7rOz2M9h0FH7t6N68KaFBHVsuPRN7BmjPUJtQIQcpfHPQ3zkTBbubsw01/af/AeNN5zUudBM5OzNUKnx/MR3rvxopGGKShOwqei978LudGsRJWtMy8TCFPXpodpyhIjVvafnCL1hFPxWFt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(346002)(396003)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(71200400001)(6506007)(7696005)(478600001)(83380400001)(26005)(9686003)(7416002)(2906002)(41300700001)(66476007)(316002)(76116006)(6916009)(66556008)(5660300002)(66946007)(54906003)(4326008)(8676002)(8936002)(52536014)(64756008)(66446008)(33656002)(38070700005)(38100700002)(122000001)(86362001)(82960400001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DFPbiMNMcjuZ2I3WSE5dvx4T9k/RGka9AbbkVcUg5yOmXHpQWuwmSbjzxluj?=
 =?us-ascii?Q?JMetsKYvUBExMZGByvAto27PUngNemKwXBogRRp4nh5pBrTXenJlQdsTgaKW?=
 =?us-ascii?Q?GGbF+Z6W9jwU5ExNH577/it5tKO0UtURR5OUAEIoytZo/Q33ul62OyGhxmI4?=
 =?us-ascii?Q?qkmgwUV7qAajRtgpiV2ihhpj0KrJvU35rnUWRJF4oIU8qwB9fzW2N/6PXG2q?=
 =?us-ascii?Q?JxDghierLmCxATJTtMfo0P3UKYCglFQQv2Pt8iWOj3E6GINoCxKbnSlwFve1?=
 =?us-ascii?Q?TfD3vwDcKXXVvKB5ijbCnm+CyflvTGGpeK5CZ4RO17wHLdMHlQQCAyPtHIy3?=
 =?us-ascii?Q?seDAS/zpNGop26vw6+0MHU96kd2pZggr+4oc4NX7hvnXu85s4lmkts03NL/P?=
 =?us-ascii?Q?fYWSdkd8ZC0ZnLRz9lFWxD429MamBnAqsupFckjCZWSRt8Bo3KEJr7eXsbX5?=
 =?us-ascii?Q?38vMDxiycvdc8sXGdsEMfHnw5CVck9SJz6rgTvJ+hW4J/HtTOPxHRxBsFTJw?=
 =?us-ascii?Q?1cSYYuCXsx9IADaH0L0IQtya7CCC8BbKIdbrbU5gsbBSKCME0vt/GltlJwSL?=
 =?us-ascii?Q?9SISBEK2RuFglPzCdP0riD0I9bLJoMZnYmrp5qQkIsmaUU/wkd40DXxG7wMY?=
 =?us-ascii?Q?nPaaDOi7oU7xPxUnoei8c9bs0z9v3Ys+32RTZCBnmdgsrOTamIBhxlUpdjfc?=
 =?us-ascii?Q?bDbFqYpsRaoMJ7ESuceDxM7KYOYo8OHschDZE2sQQo4DDJQpsrsFHx8XHRv5?=
 =?us-ascii?Q?Bhv3Ov5gHucAoOrgJJqBlfabl1M603OYRbSPGxErCCDKuFcuC3XGSzvgQ6Gr?=
 =?us-ascii?Q?a+7usfeIYbsXP2CgmWS+/b15ZFiIFWKiy1mQY7KqYaDgjxOI9Q+lf3SoRrXg?=
 =?us-ascii?Q?YSU4+RJZKCklvajW++ewfCDDa5QLCVK7Xd/wsoS/r0pK+y+A13K6tBE1M8jD?=
 =?us-ascii?Q?ghgzoW/aySm2uH7BBl71DeX6NANUB3EcrE/IG904i6t3l5os0TSx0dyl9l4n?=
 =?us-ascii?Q?1wUMEtOn4t70Lc4wnq8/e8uKpejYHd5+zP7V2vppvmtqVBO7zS00uxO2DHGB?=
 =?us-ascii?Q?fZs/l6nMIQK5gl07lB8SVYSOLIQZEkfTockAx4ZJRIQkJWFyc3gZbnne8GpC?=
 =?us-ascii?Q?4DwWyCR/vHNXOWokudr63z9s0i+RUL1Vij2zpBhx6K/+XStn/NlVnkuc4ZZd?=
 =?us-ascii?Q?ZQOqspnnILHIXVB1akunS684jg9xUGtjtCC9vq4NiXQ7DnfOdCMUXwXt/o9G?=
 =?us-ascii?Q?fm1uW4k2oEJ5mjpildID/OmmGbMDRqU6NThwxXeVmTVKkM1yt6nGhx/rKYCP?=
 =?us-ascii?Q?g150M6pxQOSib485B6PlQzrbf80JSuE6RJSMkgcU/a9JOV5Z9iFY8ocso2KC?=
 =?us-ascii?Q?sdKDkiJxJVnee3yiHFrWDwpMS2+0Vfx90xq0e4XijEQQkORi5JdCnDtUNKWw?=
 =?us-ascii?Q?L1D49KY9KNDeP5BfFKtp8N7wBqXl5+vHwMIAbCoTiNZohA0TxDqFombqUsCY?=
 =?us-ascii?Q?2krwH0ytWDjWt53ySGpYNYGECRG9MIW2kJHAckyGAHDx1ZMLL+rst8CBaZds?=
 =?us-ascii?Q?ule4pCSPdhNU+kzFMlbJj/7VLbP7rXHZyYhnCb3W?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c65afb-e01a-444b-8727-08dbc106b8ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2023 16:11:21.9092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gwtFD5f/OtxWWtqMkYU5TVuoREcvvVg9GJW9duWr6t8cxZtvV1mKlH6oSm1gCgyIw3b4zydYFLWTq0wuOqBgRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6109
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

> From: Wolfram Sang <wsa@kernel.org>
>=20
> > +static u32 ljca_i2c_func(struct i2c_adapter *adap) {
> > +	return I2C_FUNC_I2C;
>=20
> You could use this here to make the driver way more useful:
>=20
> return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL &
> ~I2C_FUNC_SMBUS_QUICK);
>=20
> Except I2C_FUNC_SMBUS_QUICK, emulated SMBUS calls work out of the box.
>=20
> For I2C_FUNC_SMBUS_QUICK, you need to test zero-length transfers indeed
> ('i2cdetect <busnum>' will use it and is a good testcase). Which would be=
 good
> anyway, because if it is not supporting zero-length, we need to add an ad=
apter-
> >quirk flag as well.

Thanks.

And with i2cdetect -q busnum, I see error on driver side which enable
I2C_FUNC_SMBUS_EMUL and not disable I2C_FUNC_SMBUS_QUICK, I think
it means we don't support zero-length transfer if I understand correctly.

>=20
> We could add this incrementally, but it will be better to have this corre=
ct right
> away. i2cdetect is a good and simple testcase.

So the code will be like below, please help take a look, thanks.

static u32 ljca_i2c_func(struct i2c_adapter *adap)
{
	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
}

static const struct i2c_adapter_quirks ljca_i2c_quirks =3D {
	.flags =3D I2C_AQ_NO_ZERO_LEN,
	.max_read_len =3D LJCA_I2C_MAX_XFER_SIZE,
	.max_write_len =3D LJCA_I2C_MAX_XFER_SIZE,
};

BR,
Wentong
