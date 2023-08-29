Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 970F078BF86
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Aug 2023 09:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjH2Hqx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Aug 2023 03:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233814AbjH2HqV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Aug 2023 03:46:21 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BCAC139;
        Tue, 29 Aug 2023 00:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693295171; x=1724831171;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xcU/wFAjD4gxTWlUw3a7EBwTx2V5SOMYrprVuwwvW7M=;
  b=aDMWbiJ7Y7QfeTV1cUhDr6Mel7BowXJiYeDa3VMY9Vp6S9qVo+SNze+3
   8C5/oOytroZOr9IEkaLjuOijVqwfdZ1O5Ks9iSA6nxhh4OXx28Hi87oys
   9DKDQC8PwDwAq3tqNH+HHkY6ZC3fDJnWtmYeQrD9A9iA8hxR1Soje+9xD
   0i7GtqsZsT7qZ6GCo9k0K5iPzGd6EPZsvC6H3dhWWBuOt6ECvUSotQelP
   jWhie1zZ5QqraCA2v2zhgV2EGqF3BHI+6tGC30+wbq8KS2OUlpWs2VKbU
   vOA3YMl3iQoZuHe9ujowpFjQ2F58NSDDJ7nfpIxYX+jUUCyXbS3TVax+4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="365507256"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="365507256"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 00:46:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="912321260"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="912321260"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga005.jf.intel.com with ESMTP; 29 Aug 2023 00:46:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 00:46:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 00:46:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 00:46:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 00:46:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxdE0rS/GckxPzrOoSmN7M4H3ruXW0f1lf+cAKe3BMmlF4jAffMKnf4Z16B2N+H7/A2Ke0LSOIU2TwFGx9uJ31cF7gCdbVPuZKDV0mECxYPSQFkiOE8gULHpFvUkC4HDtVvWDO+RKVCR5gx1sdIdKQS9U5Kbgn6BTn/VTeYeiJbNtVnUfgpOH7JXYM/RkmVlxnDy3Jz94i20TgdwHabjVNIOhRwlZIda+zd6twsTfHWKtPIS8TyfL+WMAFjWQPLbN4a33ge4BxG6fxoMeiJx8GvpEY9J7jZEy866pDlwFWETLv9QTeiDn1VN3L04semZv0fG9ml5I19WpgfqqEvsNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcU/wFAjD4gxTWlUw3a7EBwTx2V5SOMYrprVuwwvW7M=;
 b=b5Uq9iqCJQHeETi/RyAAe5gqF/NoYq6JBxHfuTdluW3zVeSlYbR3aDLZfJfa59k2b7aP8V1thLPg1NhXA/Eb1Ze185qT6lahXmGh2imYaqhKEM3SOkUFBHNYvlWit97lJ6QUzme1dhs3d9ulcz4eT99RJjNRoIrQ76JtlJ6vmt7hjgbnL4T1AbRWIe8IdybRLEWsbhFsmQWM2SYa0Gli4BkO2o0uuOtaoVdtvQHdmOZ/bLyTfn9m5bphhoSyZCkgSyK6bMfcmn8QKNZU53JtjQW0/+FGuveY3ArBClWy2fhYfFU0yLK1JepDlEOxfEeN4XCXmpUeWdedo744KuXOsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by CH3PR11MB7346.namprd11.prod.outlook.com (2603:10b6:610:152::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 07:46:02 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%6]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 07:46:02 +0000
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
Thread-Index: AQHZ2HMfV46vDfy+K0Gogfafhp4on7AAGaIAgACB5lCAAEyLgIAAAF3w
Date:   Tue, 29 Aug 2023 07:46:01 +0000
Message-ID: <DM6PR11MB43168A83B5FDDB64294548B48DE7A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1693091643-20867-1-git-send-email-wentong.wu@intel.com>
 <1693091643-20867-3-git-send-email-wentong.wu@intel.com>
 <ZOz0bgJUZuAcUBWf@ninjato>
 <DM6PR11MB4316FC089596F44FB02314B18DE7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <ZO2hm7rQonLyljud@ninjato>
In-Reply-To: <ZO2hm7rQonLyljud@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|CH3PR11MB7346:EE_
x-ms-office365-filtering-correlation-id: ea163285-4eeb-42c2-a6fc-08dba863fe02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I/5ni+sbBOT02tIr4g/zDAWaMrMlUCARtHbMfLQbcwFg/Q+RUiNudccRsB8C/f6uVpmqe+XtDvi1bWRkOKEhpR+LiEHY9MSJ6CLJLIVXlkAEaoTlpwxDBrldjsCx7QIt7/qJ1qmUoFJkppVaxKYStN//cJkHqDHrZd65SF4D2xDxGab9+iq27qjwrQUgMtz5WbljWZOijMjy1d3CZ3RT4p3ZUyGdiDV5k/8ar9sKhS6QNdzrqRoWKKskGYl009iy8bJNdo+02n0y+xV1mF87PDuRliHoqqxtBFKVvjf8cAyXc1pNBrEBQIMb7R/TNGOuP2Mi4ulfGiVGa+1r4+xZB7B6foeVbMFjPyz6wqidP29uTlGKHMgFiq+vZQJAWv5/if7QmaGbkZLA2Ps7XT7/Lcldmm29OuExz7X8VrfnkaFB2uG+2D8jGUkCjcrX2gw5FKSQci7M2gVTh20LRn8uEFOX4GNAZ1xsS0G6v1XV3ape7bXSm1XCsUm33nzaDNU+nOXZVAaRzrmUJtLHDrCHScpRzyugZfNRAC48CuaAgNmepkrbeaCLZ0u21V1oX5sNa1+LZ8Mbcbmd+li6kdNJpmI+WPfeg4ZwD6XrFtkvz9U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199024)(1800799009)(186009)(8936002)(122000001)(76116006)(478600001)(66946007)(6506007)(7696005)(71200400001)(64756008)(66446008)(66476007)(66556008)(54906003)(966005)(6916009)(38070700005)(316002)(38100700002)(41300700001)(82960400001)(9686003)(26005)(8676002)(5660300002)(2906002)(52536014)(86362001)(4744005)(55016003)(7416002)(33656002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KjNwjnOqGQHs8YGCygC60Vn4HOp64N8Qm/z7ZsqfzHLx52adrmfL7uVs6woh?=
 =?us-ascii?Q?D4FErcsXN7+wQ2Syvqa9VVwSlrZ7yprqNdf9HzrGV9n4+AMaBksS6pJB2G43?=
 =?us-ascii?Q?7nVvB/DhjpO9hj/bI8IdoChpirAKlpQfnC9NLIk1yWWD0flCU9ALEf5XoeEm?=
 =?us-ascii?Q?hnlLIV1/i4q3zjGQmoNXAjqo1aJjYgxpfo3NJ6yRM0KMSyr0JP9Sy6unx7JF?=
 =?us-ascii?Q?t6yzusa/ic576EVExa2kQXUwa3fviatmLgUhBfp0jFs//a7CrP9RzEn9rE/x?=
 =?us-ascii?Q?u1ebTDG6K9cvybYz9i4d7k7z9s5j6TV11pkuAAJvC1FD1eYVhbGI9X3W1lsf?=
 =?us-ascii?Q?uYit75kK2dQa9+74UBD9vyob1ONQ7u+E8HQRQeMoqrKmeRycEN2WTNPIPp88?=
 =?us-ascii?Q?dzQXGc5mbQzISwzUn8RdemxaiGm+++ndZzMLg9TbHV9bvBoIKcEjnB23v0Cr?=
 =?us-ascii?Q?/NFDLgknk/7dJta/EPRoG97j3sAJBYS8Gt7DF2cF3cR+h22FnYRzI+U3daIt?=
 =?us-ascii?Q?IEKI2lWzswsmnAph3GRmgiLabOqZVg6S5//TeLseCXg9GPwV5YYuVMYALCAt?=
 =?us-ascii?Q?k/18tiEvNY5/QSXP7/nk4/fZLZA+3ajynQD0Gb5mlpPDROjFyhiuBofEMBHm?=
 =?us-ascii?Q?h5+r1I4sL9Gm/93R3jFS6wejhdNWm5jFrRZ6uPd+MCBHYnWCVOVvxEtuJzvW?=
 =?us-ascii?Q?Oepe8uojAGRtpMMTTUcjWmSVKeDIRUz41rxDLCeGlhupddkwuvEFMx+iZSry?=
 =?us-ascii?Q?v+BB441HIHN/Y/1HZDR4do7JZxG14HhwnLZPP5pK51Fl4m4dwBckTiCa0rze?=
 =?us-ascii?Q?KFYBgcrgHA36fQ8NJfTsAp2fH9yCYruhq4b5OzDt8g0noXcbYnVFxyjk9zSv?=
 =?us-ascii?Q?9mMKYfJdq60xbBHVOUvpTg0dimmiWdq9bW3Y/NfaFvlqTYdI3NYADgsUfH8K?=
 =?us-ascii?Q?syZFLsQ+qGrgOZuT6gDlm7lc2BkYmS5hC8awvKoKNoRyQEGbeBh3sOLqBrgu?=
 =?us-ascii?Q?v8mZkk5EjVNCyS4dkPAb3RQpsRozTmqva9rz4JfHnnpIE0HC+aFyE1s0sVPm?=
 =?us-ascii?Q?rLmOR4FSriKhMSUBJlSq9ERSujMrFbN/b506vY34YJ1R0RDWWt3QT8TyGwMp?=
 =?us-ascii?Q?fsjP738VlzBWTb3zFEHbh3ggBgQ7xKEOCZjKkp3e2t4tcXigfcZrmY626qMt?=
 =?us-ascii?Q?LrfYN3u7EfVTOmzMDa3slKIcms3Z+A1MehzTkG9Wi8kginbiVq/CaovyVOGz?=
 =?us-ascii?Q?D1jBD2BnQuxOLFRoYp0lwaZIsrRv9/ixA6sKLJs0AR8fB4PrA8xMA5gdKAT3?=
 =?us-ascii?Q?KZ5YHsvP88E95qfjzJJRzvpmifuIVD7Lrm9B1U9d7ZKkqxNzFNOOWnzzKHR3?=
 =?us-ascii?Q?Ks8v5/OUijOHOfIGvInrt86rRyH5sdhoHzpVruurKXLXsXcBq7YTj/5BU6PP?=
 =?us-ascii?Q?w9eVmgAVtKqzcik0UOJ5HiRtB/ubWfvMrfr72dVkmraatSz3RTDBWSGYgBOn?=
 =?us-ascii?Q?sKTY4sowHPCrYasBbFxluzJrMzuDXWfqp40PARsoadRS0l9l4Ylh4+QljD5K?=
 =?us-ascii?Q?EuGHrIqyJFniazxjEVnpuvxaLf1CsyDyS9mR9GRe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea163285-4eeb-42c2-a6fc-08dba863fe02
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 07:46:01.9704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TayRzFRSdiQdUvSDr83w6W142s1D5prjWa5ENeHVAwqmTmjuXF8ka5DH5LnLQFyrCoNJi7S0z97oQ/JDiqPAQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7346
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



> From: Wolfram Sang <wsa@kernel.org>
>=20
>=20
> > Actually it's about the method 3 of instantiate I2C devices described
> > in https://www.kernel.org/doc/Documentation/i2c/instantiating-devices
> > and it's not preferred wherever possible. And below are the
> > definitions about i2c adapter class, we only have I2C_CLASS_HWMON
> > class tested, so just put it here.
>=20
> Yeah, as I mentioned before, it may make sense for a USB based device. I =
just
> wanted to make sure you did it intentionally. Keep it.

Thanks, please help review v11 patch set as well which is to address your c=
omments.

BR,
Wentong
