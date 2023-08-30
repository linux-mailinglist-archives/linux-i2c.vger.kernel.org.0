Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA7B78E065
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Aug 2023 22:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234390AbjH3UPy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Aug 2023 16:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233740AbjH3UPq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Aug 2023 16:15:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2976811A89;
        Wed, 30 Aug 2023 13:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693426525; x=1724962525;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fGdKPSKsEOpoLVB++nOJY7JI45xSwbs9qz/oHplH6F4=;
  b=lErF2p8If0wWpNM7RpBRcAIISUObfZ8L/gAstmu/mlIk+oOjnOrbD4tB
   PLiWNyy6LsgxmzgyDZPOr01jJPJj8XQvLnIlbHtpiWp5KINyvYOhbufX5
   G+C8Rkwvum/mijfXxVOhKoSHo+v2rRfwPXHdS5kV52C/Jn2uJdkZzenTn
   4/Xr3JwKtCdHYEpkccLFTu/bzHEvKcrY/eBpNEQTrQFeQph9qOt/xFxrX
   MTje+Ck6lVwRvwAL2T5abeNdrH1Bzu9L7wzMWujwiPc5jIyDX6CD7DCdB
   +7jRNzMv5VWR+5gi5Jfd4/RtWBlfWrocekKBQBsjFU/ee0LoE/KT08CsI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="439689319"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="439689319"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 13:08:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="716040517"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="716040517"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP; 30 Aug 2023 13:08:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 13:08:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 13:08:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 13:08:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 13:08:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6K6JSsOja2dFOQBkFAl9ULK7/9zPM+ATT3HY+pXnPKrVqXK6C8zU34VcDSRQ7DKfkIfEYPFaaOIzV3tlIzBRUDXk15JcmzntWVZtecunALuBQrA1OqrLb6jXEPiRx9S8nYmwWynL7Z791K0LWWBqSjYOChsokYcCkZHnnZJlHWIgXHkET/UQ44aoTM7dejuSe5kfm8DRnJcNJfg5Zz9GZattarhMcNWjtQdCv1LaaM7Syi9kKbN0UG2Y7lWOpY4/h+5XsV+F8XWxst89gE6n8OeOkbkZhaz90v7sTt8rjXTJDdO12hPZFxy3aQSy39eX/iKz2/U88rFabMEy6m+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lS+bpcrh6iJ4dJvik1q0KdKePBctglaercOxDCqh9Y=;
 b=gHiI6yhKsl/aFxKDoKyDwIEUYBWdjREqO/sHF8Cgs728Dp0r4aaj1VMUiX49nqCh2fD+mjE2op9BdL9jXabAd8f18ir3zy2OwnkkLjHHZfeXPXeFbbXZ+Z5ZRxM1oYF7BuM2L1mBnvBvVeJekkFa6UZX63i1FuluuKPBHp7vIPKOcB68RaPNqID/0vDpYnC3eguHFU3VKZ+pSQUOvlQCDosZk0B46wCpOfCKR2eQ6AXJao8Zr0eovP69CCsL3/Z3tRiERXuw2hHU3fG9+ynfsUpIJlTXRxok3eLLl65MtKv9GgxxacChDE6qKM5U8Twg5NESkxT4qV3tOyBgFQDc5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by SJ0PR11MB5038.namprd11.prod.outlook.com (2603:10b6:a03:2d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 20:08:32 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6745.015; Wed, 30 Aug 2023
 20:08:31 +0000
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
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: RE: [PATCH v11 2/4] i2c: Add support for Intel LJCA USB I2C driver
Thread-Topic: [PATCH v11 2/4] i2c: Add support for Intel LJCA USB I2C driver
Thread-Index: AQHZ2jT0CC/4TLc7CESuo0vwez4/1rADN46AgAAOLNA=
Date:   Wed, 30 Aug 2023 20:08:31 +0000
Message-ID: <DM6PR11MB4316875F52F359403BCC072A8DE6A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1693284848-29269-1-git-send-email-wentong.wu@intel.com>
 <1693284848-29269-3-git-send-email-wentong.wu@intel.com>
 <ZO+UucQM++smFBpR@shikoro>
In-Reply-To: <ZO+UucQM++smFBpR@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|SJ0PR11MB5038:EE_
x-ms-office365-filtering-correlation-id: 67f16881-fe82-4208-e5a8-08dba994e1d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z0JWePZCq6LAJRtdOBPK0jcCuy0YSHQzjljaTV9TfhviOVogw+sbbuhQGvYc3P1PpjZG5TKN3CFpt35QF6hoIojBSuBqgdQMo1lgI9+1wptHB5F/+WVSGXm1fGJV0/jox6MxhyZl0pBOzcgCcN7ZYqTF3n+K/mLek7Drbz2ftnyEm34pjt73U6RQuRUXKDn3DO8HDHt5wT/G6xt0MLw1LdhLMkrKior00NxzAHQISNhCnaZvGWHjomY77oWGO7MROdtVheWIbyczObO+4ZxzRIB9HSmZSIHee3tLmo2dDi0Jq0r+hiGGndsjXoAoM0Pc43cjjtCJaF+LQ5FRpVoOyN/WI77oQhHl9mGTq0bd2f5k+7ZKe15IYG3jORxHlmsq/GKpoKecjqq9dJTeJA1qR5VnVtx1nkhGZ9A3R+ypTuHE+1Gs3Z0IlLjMxOviQpSvuVXZIC5RU6tXAIEmxcGx7wtfaqRhmoG7ercH6mUDOw1ImPic5hvRxcZDSG7/zXLj+Z9r7NIlE/q/HWk2NeS7nvaRzxL9agNBXKcGoOAKbYCMweyXveGjjnlhV6uDUgiEJZQ1vPhBXJ3wHWr5nqAEXhi9/axKGRChstrGvBQvaGaP4FBbuaLju9YOcwTx6j3J
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(376002)(396003)(39860400002)(186009)(1800799009)(451199024)(41300700001)(82960400001)(38100700002)(478600001)(86362001)(122000001)(71200400001)(38070700005)(6506007)(7416002)(26005)(9686003)(7696005)(4744005)(55016003)(64756008)(76116006)(66556008)(54906003)(316002)(66446008)(66946007)(66476007)(33656002)(6916009)(2906002)(5660300002)(8936002)(8676002)(4326008)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m58cHR3GttaOojlTstiB5sUDR751bOSGdcm5skwbzwk2CPv1Pu4Fleim+SoK?=
 =?us-ascii?Q?61I1ouiMSPm/tMt1RJi/lBOSNP4P6tTdiM6IqeyaunG1TpppRFHz377M4Xy6?=
 =?us-ascii?Q?VmReWJ7ei2GqN3UoyXNzbXfdr5QsgeVvjZQWzoG+X+0Rz4Cf5S3c+qyio/7V?=
 =?us-ascii?Q?r22y/rNb5jyWVgc2o3vHtCrGzTTbF2V5PI3qGySrYpzLBsbDwhmoF7r51cA2?=
 =?us-ascii?Q?SDbaB91XlG/MFef17PCTeFZvwkRqCIOPAGUYPrvqDH7nsN1658Jje7cUWv70?=
 =?us-ascii?Q?VGuAF+/1seOMX06n3C6swjMGlBP1YBbF1Ypl8CLYNvjByI4NOijiayEDHNC2?=
 =?us-ascii?Q?KPvUzYYqGyPp49zGoJLnD1Eiri1L33rpcouMnm2pyzu0MO13F1hokRQvcQIZ?=
 =?us-ascii?Q?Z0bn5TUe9UNCbvap8izYWPTnj/oNVBdLdkAhthfd/9GqaHHcwlF01FCdK/9m?=
 =?us-ascii?Q?FyeUnsDwjGtWAEP59fgO/T5HioOav1+vYRRGGgBKxYBwHdD4Mts8ksachi+M?=
 =?us-ascii?Q?MVFMjo4jTL26JnRxbPAxWV6QJtH7XPzVi9OA+hw/wdC4WdLlKZL8O3BAY6pH?=
 =?us-ascii?Q?tLCt8FzrX/tZ2yUvZYiIyoF43dguNwTjX41TL9o1xjEwMN6jMLJK3Q0gMMm3?=
 =?us-ascii?Q?XbrrpoGtgJlRFkZZfn7m6njZdqkMumt8loxWfbgGXovrmnBH/PgGFlO1z5d/?=
 =?us-ascii?Q?ajouNozhGn7PnFHs3dLl0By+WicBEQ3024r5MH0yZm8OeMvryOXFjbnaY8U4?=
 =?us-ascii?Q?pOjEL+WOldzn/jy83GtwAT06gG0p/1MwCCD5ory5MIEsCLVLa2/a8+YFwdRv?=
 =?us-ascii?Q?6X1GaKKOkQVAlsDyIMNJY1JuORcBD7lBlmEnTE0tC8qf+iZ4hADDqwR983cv?=
 =?us-ascii?Q?NrW4dWDARAYqRPxDot0ebcDn/5LVlkGlk2injJMkVYdG9SlSskymHgoamFmV?=
 =?us-ascii?Q?v5n+duRzGLRy7ZgGFKPxZEEK80qa3GVrbG/jF1VZ7BapD1GmeLhWhBYiHhcq?=
 =?us-ascii?Q?TYDZW0DHHP0TBeInmLVEq3flD46IMr0jhyUw4c7jujH+nCm5I8vZR+TiZkTX?=
 =?us-ascii?Q?PLruiJDMPNtQ6XZHjqH5jbYmyi3Q181z4qhLhZb8tdmTh2lXu9QZ8K62boQJ?=
 =?us-ascii?Q?AY3qHiwA5TMg7Z/PUjJsIjV/ZC49ssvUZB95JkpAtRdZvIzBecU0yZ4o9PLQ?=
 =?us-ascii?Q?LHeahgxn+r/j+Pl4ufgBMBuEQQnylc3W0ewLwO/FUE7J8AZLexkKY47tkD33?=
 =?us-ascii?Q?bUskWL7AH5K7nWUeOliRtvN7ptgRtNiOxSYKvfS2949oEEmqye7W/4etCwCz?=
 =?us-ascii?Q?eUfT97ZUjpqIgD0a5DSTeSoAW3lUaHrx85UrwCMGoST9I6bzEtqPJ0taIoN7?=
 =?us-ascii?Q?VPQHYOeTet6hHc2QkOFHmfgPrsW35nk3sXYrh+dkogKDxIqaSmPiaxK2OOGO?=
 =?us-ascii?Q?SgFfawurd2GCqPO+YUiM1JnyEC01v5Rl9zLF48HN27v3Wp54MHcj4DuQGcgV?=
 =?us-ascii?Q?a+hRAGlSanfBP5gR4l8sDJzYi5InbcVpXyZs6skmKE0g2NEyc7O3qIfRgYHo?=
 =?us-ascii?Q?blSRVuFu9pHgP+e7YJsZQyGyQdkiyG5R0mDbCr1L?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f16881-fe82-4208-e5a8-08dba994e1d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2023 20:08:31.1739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GBwCwdH+zt927cx7mhBc3CjYhtJ9WIbmNZrP+yhe+V2XeqdHkmyqabnjyC5RFbtP1MLd64/OvJ83iuqEhkPxaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5038
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

Hi Wolfrma,

Thanks for your help

> From: Wolfram Sang <wsa@kernel.org>
>=20
> On Tue, Aug 29, 2023 at 12:54:06PM +0800, Wentong Wu wrote:
> > Implements the I2C function of Intel USB-I2C/GPIO/SPI adapter device
> > named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA I2C
> > module with specific protocol through interfaces exported by LJCA USB
> > driver.
> >
> > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>=20
> Basically good...
>=20
> > +	if (ret < 0 || ret < sizeof(*r_packet)) {
> > +		dev_err(&ljca_i2c->adap.dev,
> > +			"i2c stop failed ret: %d id: %d\n",
> > +			ret, w_packet->id);
>=20
> This was forgotten to be turned into dev_dbg. I could fix it while applyi=
ng.

Thanks.

> But shall I take this patch via i2c?=20

Yes, please help merge this i2c-ljca patch via i2c tree, thanks

> I'd assume the dependencies are hidden away by auxiliary_bus

Exactly, thanks

BR,
Wentong
