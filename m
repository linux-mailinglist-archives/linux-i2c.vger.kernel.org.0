Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAB57908D9
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 19:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjIBRRX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 13:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjIBRRW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 13:17:22 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C40CE5B;
        Sat,  2 Sep 2023 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693675039; x=1725211039;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+R6C2yGxmR2lAPg65o31UeP+ZTJG+2//uf8yuTedelo=;
  b=ZjjZLEDpFPSVO+8xqsVzWMqTX8gQB0yUk7ouPhmEJuz59yHdbNRYj+wg
   ho/oR0H2A+FTF8EL0LDv3AhTPpnTpniFStdccM0uCsOSni414c6tF5of4
   VZCsy4zCCun2PWRWviQPhXlrRVGPIw20z4I8Dx4QDSrWcG0GZi/tQyegA
   XgSYrkEvoNKUhanNQASJ7SSIMKNQmM/Dw1HO/DerSdx7/pZiQTbvuut/X
   gDmGiyEPL8TBCmAYWxp3WIzMQyYxnp0lwUZv4/aCyDOn/w9rVrgpHWZgs
   MoJ9YWXFSUpQ79Qk6cs9pksCNID4k4NfVWnH+WuEbI/6xk/pN1FnXg2vc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="355882372"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="355882372"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 10:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="863887844"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="863887844"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Sep 2023 10:17:07 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 2 Sep 2023 10:17:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sat, 2 Sep 2023 10:17:06 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sat, 2 Sep 2023 10:17:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dz/KxFxqu8/NuMYzpM0cbZY3NiaR1falVh9HWjI3ZlVrD+lX/sAUDdkXz1KWUmXAen6HEFONbbfRCGJfsrDK0tq/SCqhpbF5yd1ZtjmeT5k3cbDNAeZkQ4fn4mge0QBAyloOSNcHGiIlsAE/hJOeny/8r3EOZJIQv+QIw5SHcAkcwhBlJghiTkZa6sq5TCW5v/yQ6MpXukKDdlc/hboRq4IqgZ/lTwUKoCEvX8xqM+QMLIZ1RGqO2mrOeSp/M5mjKvFDwDmUMuKu3P3mIW4gvweNNUH1fdWu+4dyV7XWxeqP1sw03Ltt1UTuQQefyzKwvHx633DRNu7msD7mpjTxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+R6C2yGxmR2lAPg65o31UeP+ZTJG+2//uf8yuTedelo=;
 b=BVzyPuWR8reQYPNOT2nZlRlhmnHGVymUvFbLMMj4Wsc1Q8FUbN7cxEJRM5Az+T++g7GAeYe4JG+lwaBVuPIuhxfqMrE9H3LRsypdP42/H7JEJEHzBHT2dqVzx9tmMCjkImVz3sWEzmgwvQjx/qDoVjbPsE0bwmuN//vS7Od1J11/VTX4o8VFbF7dwJ/qbd9G9YYuSJPuy6VQaTIeF1Kuz9DOpqr57JF85g00On6FNOQT/nOmEMSXbE2w8/08k+ndDuFx0TD/4YvCnE2XXh10ERdV8ukdTwRcvOVwq8RkCHy31mbXK+ZyrU3ilW9Rb8yQTpxXr3tkXzKSCJhY/cYcSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Sat, 2 Sep
 2023 17:17:03 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6745.028; Sat, 2 Sep 2023
 17:17:03 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Andi Shyti <andi.shyti@linux.intel.com>
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
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: RE: [PATCH v12 3/4] spi: Add support for Intel LJCA USB SPI driver
Thread-Topic: [PATCH v12 3/4] spi: Add support for Intel LJCA USB SPI driver
Thread-Index: AQHZ3JZmN/Oxjo7/p0CggIGIw+eE6rAGFFAAgAG05HA=
Date:   Sat, 2 Sep 2023 17:17:03 +0000
Message-ID: <DM6PR11MB4316E06061307EABBF94C0CE8DEBA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1693546577-17824-1-git-send-email-wentong.wu@intel.com>
 <1693546577-17824-4-git-send-email-wentong.wu@intel.com>
 <ZPH/Zkkt4lNsBom7@ashyti-mobl2.lan>
In-Reply-To: <ZPH/Zkkt4lNsBom7@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|PH0PR11MB5925:EE_
x-ms-office365-filtering-correlation-id: 60a66233-0f78-4b9d-6349-08dbabd86d4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eVd0YyjqblwtxbjQlPK2vjas+316tzm8ST5mcCBjZbgL0RTVMLa3AyfrxWX36oIisFt39ssMmDJ82lZlETecb3K2PWSpg1TbWiaqnkQGPOvAtaqYyUgCaBhVaJKOzOXPnPsJ/mMdombMI77102vFEsc+71eyzPawJYphHre0dg0K5nhIXlkw0WIQczypu3uaEsDUFy4Fr6rHR5ppU2nOoPsv3PRIkwdnl0gxR3c/4DcpCHfHa0fTcdvooJv7TRs5w03QCiHr27JaK3xw0rkddWiqj0Q2wNpNeuL60wOLlbfVJ3OGLuFJ4n0nCKUo3I6w8105OwS18cihx9fIVKqw2lvZmseoZhnebKOccAe7m3z0XAdsX8YgGkwOvVklOCwvq1LLxMZAnM5WWIDSlnhn3YyO/avrDB4AzksVbb17x7Qk+Ie0faN5IdtKjF7VO+Q3fUgWLWxoz5/rK/bLS274qwqP9JBDW3jLQHBS7u9LXhlBKLuNgyti3287VDUuILMiIRQw9U88CFj/1azoISjSaDV7B1i0HEprur0bmRhzzyGNXipJutP/cy28DYF2bV5gRLy7Wzoo0e0gKMbLI3lLEF5y7GJPD9hGq9SYaw/e2Wb/JA5UwH0I16z/0rekvOSN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199024)(186009)(1800799009)(7696005)(6506007)(9686003)(71200400001)(55016003)(26005)(86362001)(38100700002)(38070700005)(4326008)(52536014)(33656002)(6916009)(5660300002)(8676002)(2906002)(4744005)(66946007)(64756008)(8936002)(7416002)(66556008)(66476007)(76116006)(66446008)(41300700001)(316002)(54906003)(82960400001)(478600001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?x0HSM2cgyslrKljtA11UwHTb0bWoMe0uUsEb+uJVqgLidXgMkzCDx0QhEYje?=
 =?us-ascii?Q?5kw8TCBLCxz514Fr4nwmV/b2cVkhHwlNX++bXHryGg27decadFX0jP15AdTy?=
 =?us-ascii?Q?Sp4I07+fwqGEqH3aD+hIRRjoMayUUK8HMed4e5Unc1lpmJkOJrllEGc1KvN+?=
 =?us-ascii?Q?PGjestRQMS41/qKR6L3eUMo6n5ZsIYVvH1i38PKRIFl8LZeEdbPdSnrfE+mI?=
 =?us-ascii?Q?JyNHwtzuwjZMbXl7UnGyu7TxYhm8Fyix2Xqsq7toM4JWmB39z5kIGDL6fF31?=
 =?us-ascii?Q?x3a1Ugs1RWtU1aUFyoWZO6z0Y8eYqtfuAIfc4ciUlQLoADSBYs6lOcwY0ns8?=
 =?us-ascii?Q?LCUv1Lju0xop0mJkxf+9uiXzKUwpNPfnp7/Ay+fbxEulBEhH0pD5kied5/s7?=
 =?us-ascii?Q?JHn5b1LRKh9gJZq4fF72YS1AsWC5YnZMk2NYSZZn8hLMExorrIvD9r31aI/u?=
 =?us-ascii?Q?njDV2e94CfFj/whDCb24aRvRjB827SeYJ3If4GlE0IGRU6EbL+AKYOVVx1/G?=
 =?us-ascii?Q?doC6GdS5sfdCNUF4Vxu7CtBFzSGG8cN19fYpdIUF9NK1oabYnvJeCTktHAYB?=
 =?us-ascii?Q?1d0JTM1tJkTd8STz/rJUpj4AehYSOiwgyywKHYBp/dirQZMehLaiUm9vhmU/?=
 =?us-ascii?Q?lK0FDNJ41nLJckFijWBys5cXu62BzR0MAlgWwErlqyoMlGhBu4OUueueUbfT?=
 =?us-ascii?Q?3znv/zzKagq/ixSQR8KmiCe+DkXViK5/4STKk3fs3oyKzpy62WzXw7XROKMB?=
 =?us-ascii?Q?GwnbwiPfaF0OjJr9X/8n1I9Yb+MajfMGXoNLZ4e8etcxARk1aKNIamzrGzA2?=
 =?us-ascii?Q?KcuSIs1n7u4JUfZUnpJehglRgN0rjz2mTV23lyCHEJ3oZZbNXUoTKZVZTTi/?=
 =?us-ascii?Q?b0e399GOTMbeN6/v9UjsfXjUoccvM7UyavUlyiqwyAoE5Jo7qiCflO9ljiOW?=
 =?us-ascii?Q?UhfaC8hjMqp/rPL/errtzle9XqsygWSe10anV1msX2VxxjegulDS0XxFUrx2?=
 =?us-ascii?Q?vF2GubQOfK7RLI+Z0XsXH+X5QjAlV4yHiCCMGJQtisNZjPN7+BpksW4DbZpJ?=
 =?us-ascii?Q?YmdHiTdv7+3PiSJ3l2aTcPVljWmERmMi61Ft7OfXBB+f1UdZZ6Nl4G9eVzRL?=
 =?us-ascii?Q?RKlv1ymXkiwOIni0XUkZ5stjNKYxtGRK3ZIItG6TjZ9svfmPOTEUkLL0w8Or?=
 =?us-ascii?Q?Gxy4Oo98Tdh0Z0bQBRuxBkx5BPw938GiEl6ZuGGuvwph8JbaNQV3ryB2pskj?=
 =?us-ascii?Q?v597ftewqogwBIYUrwid256Kg67AWANWV27AqaQ8ir3GcDaTVkXpip0dbVRU?=
 =?us-ascii?Q?BO6xjfHP9mxaZzMm5okSS9bKVyv/cbHuurjeWBo1hF0mU5HovwtC6cPFCoZc?=
 =?us-ascii?Q?3zLaS4qQqSl0F13tlh/gTle06Jcn50KCNwpRjb+uzPgDCypimsufc59y4d7O?=
 =?us-ascii?Q?mOA1KXdnF1EB19IhaMUIUNx1Bz70CpWqlU9sChCGDBa2njKcEDPmIsUt9coj?=
 =?us-ascii?Q?yItigLRH7n/3aiPgYCkQ+DZwtRJFvNSA1s22Dz5g2B7XaYD8Q2dyGk+sSeA4?=
 =?us-ascii?Q?E4x5dhO2sm1tOAnZTLd2oRFYf86cSrgoiMu6zE+V?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a66233-0f78-4b9d-6349-08dbabd86d4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2023 17:17:03.7815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rHezMcokY2dyUcPfge5BWqcy50OXjGATBk8SaU6hNyDAlAOnSCYnQ+TueBij4SoRe0dytDK9iVnZcHslpI57IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5925
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

Thanks for your review

> From: Andi Shyti <andi.shyti@linux.intel.com>
>=20
> Hi Wentong,
>=20
> On Fri, Sep 01, 2023 at 01:36:16PM +0800, Wentong Wu wrote:
> > Implements the SPI function of Intel USB-I2C/GPIO/SPI adapter device
> > named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA SPI
> > module with specific protocol through interfaces exported by LJCA USB
> > driver.
> >
> > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>=20
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks

BR,
Wentong
>=20
> Thanks,
> Andi
