Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63B3979F616
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 03:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233335AbjINBFq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 21:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233245AbjINBFq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 21:05:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028EF1713;
        Wed, 13 Sep 2023 18:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694653542; x=1726189542;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DqMXU4EfykY8MQbyCl2wEakuGLnzUm1u4bzb7BKeVS8=;
  b=QB2wemUQvKIenH1nodWJt8ptOweFA4SYqB7nFUwC8XmqGt9I7xgAaeYH
   2ggRa0OI2Ug/dXEb2TVill1zNr7AFbVqzkVBEfXkQyvU79b/mSuF45MK8
   Rb1N4MSD49DzgIXCs7Z+FpnF6SaK+Im/3Oj8CzQ8rJQtMFn6361mPaXR2
   8gAHewbAqXc2nJZXfqrt78HhMrmmDhadHBNQByW2aD3zswdUUPM8pCxic
   DT63mQHNOU7PsTpLJklNEKsMoWgKKO3iquPdFtG0EyD6Io2O51rwNgvGs
   NJbGva9ryugh9yJPePlSFjglYBDxzpvO8ES+XeZ7PNXUo48wABGZB8lK1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="369096026"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="369096026"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="694040192"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="694040192"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Sep 2023 18:05:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 18:05:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 18:05:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 18:05:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNNPeIOOg3yc2nh6aGrWiwE/ZS6fq/jK4UHG0j7rDPIaB7geAWdB7Tx/XQZyShdnoVLGJx0dEmdzNgnkj6a9gQIKpwUtLAeac22fOlTONSgI4JBRA1AcTtthwkNO2hx0lCVoqj+xdLPLCRAQNn6sUCnkain/8Z3jmFxmh1PgQikIIHeo4hKs6s3P/d9hY3TeBedPKStW65cOQwzJynezU2gawe3zW8XoKqQrORxQO2FtvPwr9YBD9I5GsZlfGHmzAe8hS99QWElG0MCE15d7zTcMmiLHd6NfFnwQIOtXiHoJTDFyn1zbkM7WfIsM4YGsnhyZacgAdt7k6KAd4H8A0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqMXU4EfykY8MQbyCl2wEakuGLnzUm1u4bzb7BKeVS8=;
 b=JDYAivH/EjoqTkwhxTBJokaQHNmFlBb+J4bkS3UeWTLCxdV51ikG9cfQNGHrCJWhWZ5RoSNYboltjPJJx4JvsI6Vil7nM4S9pszRRmbH/g8+DgfLPSLXGDidVRzCjEZ+zVDQCe+w+WLmizEeEz3AkAMTU5e3nXznb1jtFhTJFKDf9wfM9/R7XD6n2RBaQx40LgIVKjLI2cVyXHlFwbb2q1+WhHc28NZeQhpiFQxPx7Xq4m0CSIrtEfvoO8Sgz+82Gu2rXR7uZ3h1jG2YbRyazZI1hdSWg2ynEP4UAKcjgcCQvsFpTsoyaSMEvhKWbpmOasdst+YH8XUm1y3hU5xT3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DS0PR11MB6543.namprd11.prod.outlook.com (2603:10b6:8:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Thu, 14 Sep
 2023 01:05:38 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 01:05:38 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Oliver Neukum <oneukum@suse.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
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
Subject: RE: [PATCH v16 1/4] usb: Add support for Intel LJCA device
Thread-Topic: [PATCH v16 1/4] usb: Add support for Intel LJCA device
Thread-Index: AQHZ5eNQYYYhXKCANUeYzCUjonX6erAYdpGAgAEKJ7A=
Date:   Thu, 14 Sep 2023 01:05:37 +0000
Message-ID: <DM6PR11MB43162A9B2AC68B2686BBE2598DF7A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1694569212-10080-1-git-send-email-wentong.wu@intel.com>
 <1694569212-10080-2-git-send-email-wentong.wu@intel.com>
 <a3b75e11-9cf0-4ee3-be90-fba73bd5df3d@suse.com>
In-Reply-To: <a3b75e11-9cf0-4ee3-be90-fba73bd5df3d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|DS0PR11MB6543:EE_
x-ms-office365-filtering-correlation-id: 90290152-ce3f-4bcc-b7a0-08dbb4beb4fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PqBG6TdXxQLqruAXuK2ISGihwJiyUibE5FTQEnmMPyp5zoLCSgfCyNX7aslW/DGtMvoDyRktuptHAcMrgR50P0Ht7v1L4rwQrBOfz14SCc2l+HGlPZFZKojxjkCXyewbn/79C2SVh9+QMqkCt4C+65yGS3/6TGEv8RpHHW7mSkmTCqUMmTtfC9y07UOKXz1C8H91LTLKAQONJXdaUW4RuaSvah4uKY84ZOdLri/n+FeWfYp+5knPoOwJ+nMZMXuzgVxuBvIM9p2+3tuhdpeuHb5JlnX3R4pBM39fY8y8wWcrqMc5dBzhHZ4YJG2H4EYEBAIwn1y1mig2cDScwesdVCEz/T11Ia0xF+1Mgzyo8Li75W0lKVlErNhqLddadvd38cQGe2W5/O3o6Mcul1531MoiCyUmLh4NOyO1FYPQp9D6Woz+aMW2gnbVqUQFJvVKcP9i7PbqSvqVES4uKGt9LxgtWnlfv0fvkauCxLzfmUij+zqThNPAwouSmBHNbFPLVKNieF65q2WMU2K3fLzfPFHyRxAXbex2WWjKJeDdfq93oAy/AAIMYG8L7ryUf8AS7nbytCkiuYP1ul8TbMCw0/bWy/IXeqJ6PO0oS8Ob5gAk9h6bB7WZVEbPOL67ofiJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(136003)(39860400002)(186009)(1800799009)(451199024)(5660300002)(122000001)(6506007)(71200400001)(7696005)(53546011)(83380400001)(2906002)(86362001)(55016003)(38070700005)(38100700002)(82960400001)(33656002)(66556008)(4326008)(9686003)(4744005)(26005)(76116006)(478600001)(66476007)(66946007)(66446008)(8936002)(110136005)(7416002)(8676002)(64756008)(41300700001)(52536014)(54906003)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlR0ckhTVzNxQVpNWnBVSVNXWHBFTlRTSks2bG52MGNIL2p2Zldocmh6Y2lG?=
 =?utf-8?B?eDZGNGo5OC9tY0VNK3d2ZzROQUV4clc0dnZnS2ZkeHZCTzdyZy9RbzViazJw?=
 =?utf-8?B?KzBTMS9UMXFDNjhqSWpoenJPektPWnhnalhmYWNJZE44c0VtQUtpc3p2djlG?=
 =?utf-8?B?WmY2eFJUWmEyRjdRMDd0Ylp4YVZPUENpZXdGK2JkRVpVcGUwajNoSDU4eVdl?=
 =?utf-8?B?SEJQRkJCYy9KNy93elpaU3VxdDVaS0pvaVArUFhxUXJXQlJsVW5sZmtCUEdq?=
 =?utf-8?B?YXI0R2VpWVFQb2xaWC9QRXg0TFgvdm1xUjVaSDdSbHpMaWh0eFIxMUJ2djBI?=
 =?utf-8?B?RTdLRFJQWFg3MHZLanJGeUxQbmtBd3Zkbmh0NmU5YnJrMG5GVUIrUW9CSm5B?=
 =?utf-8?B?REtkQ0xNU1J5eUR5RWlqV1lxNHQyVGlKT0xSd0FkdG1ITjFPVy9kK0Fhd2M1?=
 =?utf-8?B?M05ibENEZk15RlZHREVuaGt2SFZNNGgwU25VTWtzand6YkRIajgxYlVyWjRw?=
 =?utf-8?B?Z1M5NkxhVmlFRXlaRDhDL0Y5M1FoS1d3UmkxV3R6UXAzTzdkRWNJKzBjRU8y?=
 =?utf-8?B?ZnhNUTQwT29hUkJoUktUeGE1b0hPNEVRbk45Q3BEWm9HUGZEL1ZkZGxTU0NY?=
 =?utf-8?B?anpjWGZ3eHcvVW9tMXhhQjVFQ0h4bmowUldtcmt3TzBtbmRMMHVBZHNGcW5V?=
 =?utf-8?B?QU8wQU1FNHFSVDJXWXowc3R5Q3JJRmpRMXQxbWlEK3BIcmtZWlBLOHc0TTVy?=
 =?utf-8?B?RWJXY0tlb29MNm1GQk8xM2Q5aFBId0dLbU0yc2pKVTZSOU1CcmRwYjBQSTA0?=
 =?utf-8?B?QWNaK2JlYzFGd0tMOEV1b1hPZWJrbW9hOFBBbkJhK2dRbzVNRzFralZMWjdB?=
 =?utf-8?B?Qi9zb2FVbzZkV3ZpOE9INlY2Ni9YYTdDazgzTUZBTklBMmFOUTBHeEVEWEhu?=
 =?utf-8?B?bTVJYU5VNSsxT2lvOGp4eWhoM0pxTFIzckplbCtHN2JneTVxbS9QZ2pXcE1h?=
 =?utf-8?B?eHE1UU5qT0xhT3FuZ0dJZzU3M2d6RXZHcy96Sk9CTTlZZlJOQ1hRZUtXc2RB?=
 =?utf-8?B?enNxbHhsSlhvVHFYZ3NRWjZPdWNHK1RqMVh5aUFEK0NyQTh3WU92SXNMWm42?=
 =?utf-8?B?dkszSlZ0Tzdoam85bFFTRmYrV3JIWXhzVHBlUVNBZVRpUGR0Vm5ndTAzTlhM?=
 =?utf-8?B?Rlh1cDZzbFBpMGZKaXNEem1EUXRPY1Z5eHZIM0JRdDRoUVhpTlBYN2xqWmhE?=
 =?utf-8?B?cXMwb0ZidTlNalZJV3F4NU95SytQcTF2QVdwV0k0WHQzUG5CeEdKV25ieDJ2?=
 =?utf-8?B?TEhvQ3BmTDdEVkxOQkRrOXY4VjJib0RvK3FaZi92UWhVTUxFQzV0QXBkUVZJ?=
 =?utf-8?B?K3dKNC9STzdTbGJKMTN2L21xS2ZqczFPdHBPOEhZSHBpSEtXNVdscyswU1Bv?=
 =?utf-8?B?Mk5ocWVHYjhxTE1QVXNMVlJsK05LN1hGQ25DUE52cURXMFh5a0l0RWV5c0hC?=
 =?utf-8?B?eUQxbWl2S2tkMDVUTVY0TGV5bUt0NmcvODNMRXhMZ09OanRQV2FPdTI3ZTc3?=
 =?utf-8?B?UEpEb1lhQ3JRN2oySFQ5VW9PQXpDR29tUzRvSmsvcmVlZThkWVl3TXVwZGJD?=
 =?utf-8?B?TmJ0L0tsYzg5WDV1NWVuRGJLWUZmT0pYM3JTTWZaYWpjVVc0N244VmlMMHdO?=
 =?utf-8?B?eFZZeUtma28wT0xJemcxWENKazVpZXdyd1ZSKzNmaERuTi9iRHlkaXRRNDRr?=
 =?utf-8?B?WGZ3eFV4eGlJWlhDY2dpN0ZWaWExL0ZkREkxamxxcm1VaG5Gc0RIT2U5NmpO?=
 =?utf-8?B?MGZEK3NhVjM5TjNOdG02MEY1T0RkS09Vc2l3amNEZXB3UVNNYmNxajBHdHRw?=
 =?utf-8?B?TnR5dXNsWGFUcTVTRERPWVYzbHJacFdqcTJIQTI0UjFlOXV6YWFJYW9HK293?=
 =?utf-8?B?M091VnhiR1pxVVptRWlrbnpvblJrdDVQZ2s2V1J4cnA4Nm9qaVhrN3F0cnVT?=
 =?utf-8?B?V3hEYWhDUUJLZ2t2ZW5Nc3dkdTBtS0NhTUZTMm5ha0QrQXM3QmJtTU9PZTVk?=
 =?utf-8?B?SEZLYUpyVEFCZkRLajRjNXo2UTVGN0hXclpRS3JSSkE2Ly9EU2VKUmd5dFZD?=
 =?utf-8?Q?7ArnAGG85122awUgwM7jGszlp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90290152-ce3f-4bcc-b7a0-08dbb4beb4fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 01:05:37.5799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PSZcjJpSZiuTwy1JfaspqRborSd5H0tah8Cy8LWVICIFgnLEpYRraPp14nwO/oR6SlGuvNCVNhEFcL7vx9clIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6543
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPg0KPg0KPiBPbiAxMy4wOS4y
MyAwMzo0MCwgV2VudG9uZyBXdSB3cm90ZToNCj4gDQo+ID4gK3N0cnVjdCBsamNhX2JhbmtfZGVz
Y3JpcHRvciB7DQo+ID4gKwl1OCBiYW5rX2lkOw0KPiA+ICsJdTggcGluX251bTsNCj4gPiArDQo+
ID4gKwkvKiAxIGJpdCBmb3IgZWFjaCBncGlvLCAxIG1lYW5zIHZhbGlkICovDQo+ID4gKwl1MzIg
dmFsaWRfcGluczsNCj4gDQo+IE5vIGVuZGlhbm5lc3M/DQoNCk9uIGJvdGggc2lkZXMsIHRoZSBl
bmRpYW5uZXNzIGlzIHNhbWUuDQoNCkJUVywgdGhlIGNvZGUgaGFzIGJlZW4gdGVzdGVkIG9uIHNl
dmVyYWwgcmVhbCBwcm9kdWN0aW9ucy4NCg0KQlIsDQpXZW50b25nDQo+IA0KPiA+ICt9IF9fcGFj
a2VkOw0KPiANCj4gCVJlZ2FyZHMNCj4gCQlPbGl2ZXINCg==
