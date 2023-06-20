Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A628C7364EF
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jun 2023 09:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbjFTHl0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Jun 2023 03:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbjFTHlJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Jun 2023 03:41:09 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B9F19BB;
        Tue, 20 Jun 2023 00:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687246796; x=1718782796;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oaXE+QV/1fX//pLEp7rgdyd2z5bm4oJoXOr/+nOTDVE=;
  b=JgQexKakhU+mWN1ITPbVRWBB/9p1lqrOQU/w0+ooyAl9pwFi62w0L0uQ
   05j6dhVYxxL4l2NJ4UlW1HApkXibTBEcTgTq63RpviUqh+duezO3HL++j
   9KsJH0AepcXAuRMilIuVYlJQQ1GrLs4by5YqE7+PME47aV+JP6RTNK2T6
   Qci5nLBQIJfTXCdmGzSUX1wdWVGnsiquBQJB9pJyS1VDvCHch8A1tqI8z
   RpKyKNsmkRUCkY54+GfdPiokor6RvBzYz5/l9bw/waxMrS/BbEhtgC84D
   4EwoHProqkIpmnOq2TNz3+JyIG+29Y8+ZUGxg+eOeq+jL6ETkkYkwQp6c
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="358661324"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="358661324"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 00:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="826876061"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="826876061"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2023 00:39:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 00:39:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 20 Jun 2023 00:39:46 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 20 Jun 2023 00:39:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3SXYmv8nkiHjALVVRRylyqSAGjSZ0a9Qt7ZuP3RCXhIx6g5eQlhr04DqwL1aqCiyjzSyYAnm+l4bAxfQAs827jYLiZ4qwgdsE55tscpRWgwNm02RvMA00jQWd1biECdj6Vi5bYpKnVXGCZSHAb7AH45duYyS5O9WY4VCWeWdmQ6HdqeDOelbxd3PHyfiUNciIVWg5LyKQUR67Fmm1EmQYpLHZvgTUqe1h7YA7F1pf1dwjIWxmkiFO/uvQAa56MSG4YEklR1LRODQ8WW5YxNtTy/9KMaN7WAfaUtL7H3Zi0MyKurGD9kXWy2Nezi6xnm1yGBVeoPrd/qZd4xQLXlLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oaXE+QV/1fX//pLEp7rgdyd2z5bm4oJoXOr/+nOTDVE=;
 b=SJ8UDABbUAXq+4MmK26O0HW6hVVkMQcsf2yiNU560PBu7rJm0jyGamRm8oL35QFkDBaG0gpwvCtQnH4TLosrOK3NZu4Ut4hzsi69SXK7Ke7bK1q197aUdiVSaLfyP9Ph4dj53dAzvW3655njA3QGFtAIg2Q8JhNGNvVfV7WGobyKsHAh3X2YDQFQd8HNWDgKLejzUC7t+tLSgiy31H3+s+cIml80plQXwuBFMG8f5chLXUN1GJb8ymXHWbLf3AeAQJchEL/i/ScDgE0PpkI5vcKXwiXygbaejY2eMH9dufHdk22HnfFxPehM1k67kSlxt+zE0jdg9k0uZsv8rvu/5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by LV3PR11MB8484.namprd11.prod.outlook.com (2603:10b6:408:1b4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 07:39:44 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::9358:a28d:ae08:7ab8]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::9358:a28d:ae08:7ab8%4]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 07:39:44 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Oliver Neukum <oneukum@suse.com>, "Ye, Xiang" <xiang.ye@intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Zhang, Lixu" <lixu.zhang@intel.com>
Subject: RE: [PATCH v8 1/6] usb: Add support for Intel LJCA device
Thread-Topic: [PATCH v8 1/6] usb: Add support for Intel LJCA device
Thread-Index: AQHZhDKaV01cSU6G20yOtUCZldq1869mFUMAgC1wm3A=
Date:   Tue, 20 Jun 2023 07:39:43 +0000
Message-ID: <DM6PR11MB4316170659C5F22C7E54EF808D5CA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <20230511175844.185070-1-xiang.ye@intel.com>
 <20230511175844.185070-2-xiang.ye@intel.com>
 <ca61c02d-9a3b-8e75-664f-c86683322e8e@suse.com>
In-Reply-To: <ca61c02d-9a3b-8e75-664f-c86683322e8e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|LV3PR11MB8484:EE_
x-ms-office365-filtering-correlation-id: df0d7108-4848-4b59-195e-08db716183cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0RVhEwXKEBoYgr7puj1gTaTCwGgQY6I9iYbE3wd9ubqE1ZRKOi0iMEIZ/Zyo1Q4CUfo7iYoEAKYKfx/XDRT+F+ji4uN86GbxDTtQ1qtUl/bVFByIhUsK2DWADuI7U7rZdgFwLRz6ANVkitHzijC2q+tZfLNPqlOh61SABXqMsqgISWRqHJbhWp86ulcypZUNo+h1cepUbRsciNGKbP3DPCfUpuAYZZps8ZTtEbWjMXz0RBbo5LY9sbWJkK17sIjtJ1MINaFHnjHvYGsqxtFZWWtHUbvorrByCWZ3gpyJviF45PEcnXi4h+dZcHhC6+uIXwJKrjJmV7w8f5+2eFySnOTcRsqxtcehXtFm7S0Y3dPJo2Dl0KNym5vdkOAQTc5LH8zSoFq7hqZ/RlOtIWxBDQLwMUI0vuTJ1SZ79HNTNt+hyp4zuSS1Tx9SxMpUT5o53KuwZwkOT63JBqpVF1BHop66VIWy9w50/uyGiJlhVma/YuVag9+bG1qaWYyvJwVmpMe/uJgnEqtBco5Y9GbXiMMGol4t4nwtOf3wPqM/k0fGYikCbyx+eTUS1mp7j9KXFqEc3L1LyJxYNmjG2iNODN6PIURQfwGGMgulePDH/4xHa3s124ICo6UNtu6kOyvp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199021)(38100700002)(55016003)(82960400001)(122000001)(38070700005)(33656002)(86362001)(71200400001)(7696005)(53546011)(6506007)(26005)(9686003)(8676002)(8936002)(186003)(5660300002)(7416002)(52536014)(478600001)(110136005)(4326008)(54906003)(41300700001)(316002)(76116006)(66946007)(66446008)(6636002)(66556008)(64756008)(2906002)(66476007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlcvUCt0TVkvbjlnSmhJYlZhZjU1L3FKbHo3QXAzVlJDZEJjQkFBRTVnd2p5?=
 =?utf-8?B?VVZtUk8wV1lCMG5ucTlZRFlRZzNYSEdDQXpTN2JVM0d1bjJMRURlMFl5R1lZ?=
 =?utf-8?B?bTVSelVnVjg1VWJVV1N6SXlMWUJJYlJ4ZDJTU2poOWtGR3c2YzlUcXF0c21x?=
 =?utf-8?B?R0hqM0hNYUdCL3FNVGc4R2s4NTV5WFdJMlRYTlFCRzRBUzR4Q21KMGZlQWE2?=
 =?utf-8?B?aDhTczFWbllpZUhWRFJYUTlqc0kyVUNyS2xDQWlvSnNBcldZOVdoN1pIbXRX?=
 =?utf-8?B?b0VIWllnOVB2S3NqUUMyZEUrUmM5TWVsN2xTMFllRTUweHo2OWZNeHZYa0dL?=
 =?utf-8?B?aU8vYUlseGFWV3NnY1AyVWY2TGM3OS91cVJCYkRoQ0RXdFV0bWFSdEVwUXNn?=
 =?utf-8?B?ckZobFQzU3JlQlhzSklEYXhPdlBJMEFwTHpFb2VxV3hFNy9EdVdoVkZjemdV?=
 =?utf-8?B?TUEwTm8rYmpLMVVYU2dpSFJPWWJWYWowR2Y0ZDlGSWtKZEppYkRQaUlPMENv?=
 =?utf-8?B?UFZrNlRWbjZkTVc4d0dwY2tBRGFnMzI2VDBpMzIxU1lva0ZzV2pydWFubFNJ?=
 =?utf-8?B?cHdrTFpRaGdIb2RRUHU5S3NpWGRhUEJOZk02eDUzd01lVjBHRnBobkZ6R0dB?=
 =?utf-8?B?V3VjN2E4SWhHQlRFeTR1cWxmNjJQL1UwV2Iwbmc3VXA5NStWTDVDOHhYODVz?=
 =?utf-8?B?RFBDRHlYRmtwV3lTSStkWm0waXBjbFFLT3FNRlRMMndHbjF1ZnRjZEFaZE1X?=
 =?utf-8?B?clpReDE1S1BpczdZWS8xSlp0WFpWVW1Tb3hhOUhFelVuN2Z3WEI5bm5nVVN6?=
 =?utf-8?B?cndhYno4aTFrRmg1aXorOTBRcHVXNjBWakx5czhld1RsVjh2ZGJ2QysweUxQ?=
 =?utf-8?B?d0wySG5WSFNId2hQMFk4V1MxN2pUZCtNQk5CdkVXeDRiaHVScS9nSWk2RGFG?=
 =?utf-8?B?U3NVNnplZC9Wb0dKUFRDOEVBclV3TnBXSXVqUmdzYmk0bDVaRXFQbENDcGRQ?=
 =?utf-8?B?dDFuTFlUTVV4TFpub2VzRTlzdGZoZUhBczdXMUJPUjBVVGJsaXJVdkxlKzVM?=
 =?utf-8?B?NHNPYXFiaXFMa096aERxK1pPUmVuWnJ1QzkremttNDhHV01lY3Z2UWpjcmVq?=
 =?utf-8?B?czc3cVQ1QmtHZXByQk5sVDdjRGZzZi9QUXV4UEw2SFF6TWI0UTBldGJEUGFX?=
 =?utf-8?B?bUwrNkd4MStEVE1mS2hKUkQrbnpHTWFwSlBDamlPbjM1RnFmeUI0dUNSbDd6?=
 =?utf-8?B?cDFIeGlJRWErdjlrVVBHd1dCV0RSak9KNXhNS1NsMzFPektsdEg0Z2VSSWdQ?=
 =?utf-8?B?clorNGpDRk9DUjVzdFlpTVh3MHo5Y3lDQ2hLbTNDemVMTFFQaWgwQkN4MmFH?=
 =?utf-8?B?TEcrazY0RFRZN3JGK3pMWFJiQWkwZERZWkhvV0o2V3E5eTRzeUJWM1U0WE02?=
 =?utf-8?B?NmhGc1k0dk5CWE9nOHY0V1dLSjVjc0U4VG45dC9OalBiVDVRSTB4TTVOUlBj?=
 =?utf-8?B?QW9WVkZqN0JIV1Q3bUFYQ3NyNGlnZUdGU3FuVDdOcGpTMFNtTUVoaXZ6NXlh?=
 =?utf-8?B?K3JzYXRxbFFHck5UeW11RW5aK1VHbTMxQlZ6WE51MEE3S2ZjbTE2dEY0bTJ0?=
 =?utf-8?B?NUNRZENCYldmbFE5RndTTlJ5WUlwaW85M1BJajFFdzF0TERxaVYwTjg4bnhy?=
 =?utf-8?B?dXJtREtqdHQ5L3R0WkM1ZWt5Z1kvR1RHN2hhQUhEM1FDMG9VOFVXTndJd0E3?=
 =?utf-8?B?YlArZzh4akZhMmxZaFIzcCt1Yis0ZGZPU0o2T2FERXptZGdJNnpwdkNscXlV?=
 =?utf-8?B?cGpuODRyLzBscGZRU24yaFJJZXhKWTM1QVhOZVB6dVo1UEN2Vmk0Wm5NQUpo?=
 =?utf-8?B?UHVTZmZxbmNRMDgxRVplZzhGUWt1ZGJnNE9razFRems3ZzZCT2JMejZZcHR4?=
 =?utf-8?B?RlRacS9PSWtmcFBCeVN6RDlqaHE3SnB6ZE03a25RY1hqUld4YUdaNTg4b0Zl?=
 =?utf-8?B?ZGN6Z0pJMGhSTEkwU096ZHFyVjZpRXAzbHVNVDlvbEFZR1YyTmtWNDdLNkxC?=
 =?utf-8?B?cHlSUnRuWDk0ZjZGMGkvd2NGVGp3QWxxQkRBSld6eERJbGZucjNzU2ZuWGk4?=
 =?utf-8?Q?GP4wbLr7OUOgDyFWc7qXjycO+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df0d7108-4848-4b59-195e-08db716183cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2023 07:39:43.9967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8DF2bOlOj96CuA8RnMDNgZ27VdNzbk4wElN7L1xlggMq6xYr7cL5IufhHUXm4hWsrHFvzcOC6Jsr/SyK9EYSbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8484
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgT2xpdmVyLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3DQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogT2xpdmVyIE5ldWt1bSA8b25ldWt1bUBzdXNlLmNvbT4NCj4g
U2VudDogTW9uZGF5LCBNYXkgMjIsIDIwMjMgNToyMiBQTQ0KPiANCj4gT24gMTEuMDUuMjMgMTk6
NTgsIFllIFhpYW5nIHdyb3RlOg0KPiA+IEltcGxlbWVudHMgdGhlIFVTQiBwYXJ0IG9mIEludGVs
IFVTQi1JMkMvR1BJTy9TUEkgYWRhcHRlciBkZXZpY2UgbmFtZWQNCj4gPiAiTGEgSm9sbGEgQ292
ZSBBZGFwdGVyIiAoTEpDQSkuDQo+ID4NCj4gPiBUaGUgY29tbXVuaWNhdGlvbiBiZXR3ZWVuIHRo
ZSB2YXJpb3VzIExKQ0EgbW9kdWxlIGRyaXZlcnMgYW5kIHRoZQ0KPiA+IGhhcmR3YXJlIHdpbGwg
YmUgbXV4ZWQvZGVtdXhlZCBieSB0aGlzIGRyaXZlci4gVGhyZWUgbW9kdWxlcyAoIEkyQywNCj4g
PiBHUElPLCBhbmQgU1BJKSBhcmUgc3VwcG9ydGVkIGN1cnJlbnRseS4NCj4gPg0KPiA+IEVhY2gg
c3ViLW1vZHVsZSBvZiBMSkNBIGRldmljZSBpcyBpZGVudGlmaWVkIGJ5IHR5cGUgZmllbGQgd2l0
aGluIHRoZQ0KPiA+IExKQ0EgbWVzc2FnZSBoZWFkZXIuDQo+ID4NCj4gDQo+IEhpLA0KPiANCj4g
SSBhbSB0ZXJyaWJseSBzb3JyeSB0byBjb21lIHVwIHdpdGggaXNzdWVzIGFmdGVyIHNvIG1hbnkg
aXRlcmF0aW9ucywgYnV0IEkgYW0NCj4gcmVhbGx5IGFmcmFpZCB0aGVyZSBhcmUgaXNzdWVzIGxl
ZnQuDQo+IA0KPiA+IFRoZSBtaW5pbXVtIGNvZGUgaW4gQVNMIHRoYXQgY292ZXJzIHRoaXMgYm9h
cmQgaXMgU2NvcGUNCj4gPiAoXF9TQi5QQ0kwLkRXQzMuUkhVQi5IUzAxKQ0KPiA+ICAgICAgew0K
PiA+ICAgICAgICAgIERldmljZSAoR1BJTykNCj4gPiAgICAgICAgICB7DQo+ID4gICAgICAgICAg
ICAgIE5hbWUgKF9BRFIsIFplcm8pDQo+ID4gICAgICAgICAgICAgIE5hbWUgKF9TVEEsIDB4MEYp
DQo+ID4gICAgICAgICAgfQ0KPiA+DQo+ID4gICAgICAgICAgRGV2aWNlIChJMkMpDQo+ID4gICAg
ICAgICAgew0KPiA+ICAgICAgICAgICAgICBOYW1lIChfQURSLCBPbmUpDQo+ID4gICAgICAgICAg
ICAgIE5hbWUgKF9TVEEsIDB4MEYpDQo+ID4gICAgICAgICAgfQ0KPiA+DQo+ID4gICAgICAgICAg
RGV2aWNlIChTUEkpDQo+ID4gICAgICAgICAgew0KPiA+ICAgICAgICAgICAgICBOYW1lIChfQURS
LCAweDAyKQ0KPiA+ICAgICAgICAgICAgICBOYW1lIChfU1RBLCAweDBGKQ0KPiA+ICAgICAgICAg
IH0NCj4gPiAgICAgIH0NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFllIFhpYW5nIDx4aWFuZy55
ZUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+IA0KPiA+ICsNCj4gPiArLyogTU5HIHN0dWIgY29tbWFu
ZHMgKi8NCj4gPiArZW51bSBsamNhX21uZ19jbWQgew0KPiA+ICsJTEpDQV9NTkdfR0VUX1ZFUlNJ
T04gPSAxLA0KPiA+ICsJTEpDQV9NTkdfUkVTRVRfTk9USUZZLA0KPiA+ICsJTEpDQV9NTkdfUkVT
RVQsDQo+ID4gKwlMSkNBX01OR19FTlVNX0dQSU8sDQo+ID4gKwlMSkNBX01OR19FTlVNX0kyQywN
Cj4gPiArCUxKQ0FfTU5HX1BPV0VSX1NUQVRFX0NIQU5HRSwNCj4gPiArCUxKQ0FfTU5HX1NFVF9E
RlVfTU9ERSwNCj4gPiArCUxKQ0FfTU5HX0VOVU1fU1BJLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAr
LyogRElBRyBjb21tYW5kcyAqLw0KPiA+ICtlbnVtIGxqY2FfZGlhZ19jbWQgew0KPiA+ICsJTEpD
QV9ESUFHX0dFVF9TVEFURSA9IDEsDQo+ID4gKwlMSkNBX0RJQUdfR0VUX1NUQVRJU1RJQywNCj4g
PiArCUxKQ0FfRElBR19TRVRfVFJBQ0VfTEVWRUwsDQo+ID4gKwlMSkNBX0RJQUdfU0VUX0VDSE9f
TU9ERSwNCj4gPiArCUxKQ0FfRElBR19HRVRfRldfTE9HLA0KPiA+ICsJTEpDQV9ESUFHX0dFVF9G
V19DT1JFRFVNUCwNCj4gPiArCUxKQ0FfRElBR19UUklHR0VSX1dEVCwNCj4gPiArCUxKQ0FfRElB
R19UUklHR0VSX0ZBVUxULA0KPiA+ICsJTEpDQV9ESUFHX0ZFRURfV0RULA0KPiA+ICsJTEpDQV9E
SUFHX0dFVF9TRUNVUkVfU1RBVEUsDQo+ID4gK307DQo+IA0KPiBTaG91bGQgdGhvc2UgcmVhbGx5
IGJlIGVudW0/IFRoZXkganVzdCBoYXBwZW4gdG8gYmUgbnVtbWVyaWNhbGx5IGRlbnNlLg0KPiAN
Cj4gDQo+ID4gK3N0YXRpYyBpbnQgbGpjYV9wYXJzZShzdHJ1Y3QgbGpjYV9kZXYgKmRldiwgc3Ry
dWN0IGxqY2FfbXNnICpoZWFkZXIpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBsamNhX3N0dWIgKnN0
dWI7DQo+ID4gKwl1bnNpZ25lZCBpbnQgKmlidWZfbGVuOw0KPiA+ICsJdTggKmlidWY7DQo+ID4g
Kw0KPiA+ICsJc3R1YiA9IGxqY2Ffc3R1Yl9maW5kKGRldiwgaGVhZGVyLT50eXBlKTsNCj4gPiAr
CWlmIChJU19FUlIoc3R1YikpDQo+ID4gKwkJcmV0dXJuIFBUUl9FUlIoc3R1Yik7DQo+ID4gKw0K
PiA+ICsJaWYgKCEoaGVhZGVyLT5mbGFncyAmIExKQ0FfQUNLX0ZMQUcpKSB7DQo+ID4gKwkJbGpj
YV9zdHViX25vdGlmeShzdHViLCBoZWFkZXItPmNtZCwgaGVhZGVyLT5kYXRhLCBoZWFkZXItDQo+
ID5sZW4pOw0KPiA+ICsJCXJldHVybiAwOw0KPiA+ICsJfQ0KPiANCj4gRmlyc3QgeW91IGFjayAu
Li4NCg0KVGhpcyBpcyBjaGVja2luZyB3aGV0aGVyIHRoZSBtZXNzYWdlIGlzIGNtZCBhY2sgb3Ig
ZXZlbnQsIGlmIG5vdCBjbWQgYWNrLCBpdCB3aWxsDQpiZSBldmVudC4NCg0KPiANCj4gPiArDQo+
ID4gKwlpZiAoc3R1Yi0+Y3VyX2NtZCAhPSBoZWFkZXItPmNtZCkgew0KPiA+ICsJCWRldl9lcnIo
JmRldi0+aW50Zi0+ZGV2LCAiaGVhZGVyIGFuZCBzdHViIGN1cnJlbnQgY29tbWFuZA0KPiBtaXNt
YXRjaCAoJXggdnMgJXgpXG4iLA0KPiA+ICsJCQloZWFkZXItPmNtZCwgc3R1Yi0+Y3VyX2NtZCk7
DQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKwl9DQo+IA0KPiAuLi4gdGhlbiB5b3UgY2hl
Y2sgd2hldGhlciB0aGlzIGlzIGZvciB0aGUgY29ycmVjdCBjb21tYW5kPw0KDQpJZiBpdCdzIGNt
ZCBhY2ssIHdlIGNoZWNrIGlmIGl0J3MgY29ycmVjdCBjb21tYW5kLg0KDQo+IA0KPiA+ICsNCj4g
PiArCWlidWZfbGVuID0gUkVBRF9PTkNFKHN0dWItPmlwYWNrZXQuaWJ1Zl9sZW4pOw0KPiA+ICsJ
aWJ1ZiA9IFJFQURfT05DRShzdHViLT5pcGFja2V0LmlidWYpOw0KPiANCj4gVGhpcyByYWNlcyBh
Z2FpbnN0IHN0dWJfd3JpdGUoKS4gWWVzLCBldmVyeSB2YWx1ZSBub3cgaXMgY29uc2lzdGVudCB3
aXRoaW4gdGhpcw0KPiBmdW5jdGlvbi4gQnV0IHRoYXQgZG9lcyBub3Qgc29sdmUgdGhlIGlzc3Vl
LiBUaGUgcGFpciBuZWVkcyB0byBiZSBjb25zaXN0ZW50LiBZb3UNCj4gbmVlZCB0byBydWxlIG91
dCB0aGF0IHlvdSBhcmUgcmVhZGluZyBhIGRpZmZlcmVudCBsZW5ndGggYW5kIGJ1ZmZlciBsb2Nh
dGlvbi4gSSBhbQ0KPiBhZnJhaWQgdGhpcyBuZWVkcyBhIHNwaW5sb2NrLg0KDQpTb3JyeSwgYmFz
ZWQgb24gbXkgdW5kZXJzdGFuZGluZywgdGhlIHN0dWIncyBpYnVmX2xlbiBhbmQgaWJ1ZiB3b24n
dCBiZSBjaGFuZ2VkIGJ5DQpzdHViX3dyaXRlIHVudGlsIGZpcm13YXJlIGFjayB0aGUgY3VycmVu
dCBjb21tYW5kLg0KVGhpcyBtZW1vcnkgYmFycmllciBoZXJlIGlzIGZvciBwb3RlbnRpYWwgY2Fj
aGUgY29uc2lzdGVuY3kgaXNzdWUgaW4gc29tZSBhcmNoZXMgdGhvdWdoDQptb3N0IGxpa2VseSB0
aGlzIGRyaXZlciB3aWxsIG9ubHkgYmUgcnVuIG9uIFg4NiBwbGF0Zm9ybS4NCg0KPiANCj4gPiAr
DQo+ID4gKwlpZiAoaWJ1ZiAmJiBpYnVmX2xlbikgew0KPiA+ICsJCXVuc2lnbmVkIGludCBuZXds
ZW47DQo+ID4gKw0KPiA+ICsJCW5ld2xlbiA9IG1pbl90KHVuc2lnbmVkIGludCwgaGVhZGVyLT5s
ZW4sICppYnVmX2xlbik7DQo+ID4gKw0KPiA+ICsJCSppYnVmX2xlbiA9IG5ld2xlbjsNCj4gPiAr
CQltZW1jcHkoaWJ1ZiwgaGVhZGVyLT5kYXRhLCBuZXdsZW4pOw0KPiA+ICsJfQ0KPiA+ICsNCj4g
PiArCXN0dWItPmFja2VkID0gdHJ1ZTsNCj4gPiArCXdha2VfdXAoJmRldi0+YWNrX3dxKTsNCj4g
PiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBsamNh
X3N0dWJfd3JpdGUoc3RydWN0IGxqY2Ffc3R1YiAqc3R1YiwgdTggY21kLCBjb25zdCB2b2lkICpv
YnVmLA0KPiB1bnNpZ25lZCBpbnQgb2J1Zl9sZW4sDQo+ID4gKwkJCSAgIHZvaWQgKmlidWYsIHVu
c2lnbmVkIGludCAqaWJ1Zl9sZW4sIGJvb2wgd2FpdF9hY2ssDQo+IHVuc2lnbmVkDQo+ID4gK2xv
bmcgdGltZW91dCkgew0KPiA+ICsJc3RydWN0IGxqY2FfZGV2ICpkZXYgPSB1c2JfZ2V0X2ludGZk
YXRhKHN0dWItPmludGYpOw0KPiA+ICsJdTggZmxhZ3MgPSBMSkNBX0NNUExfRkxBRzsNCj4gPiAr
CXN0cnVjdCBsamNhX21zZyAqaGVhZGVyOw0KPiA+ICsJdW5zaWduZWQgaW50IG1zZ19sZW4gPSBz
aXplb2YoKmhlYWRlcikgKyBvYnVmX2xlbjsNCj4gPiArCWludCBhY3R1YWw7DQo+ID4gKwlpbnQg
cmV0Ow0KPiA+ICsNCj4gPiArCWlmIChtc2dfbGVuID4gTEpDQV9NQVhfUEFDS0VUX1NJWkUpDQo+
ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsJaWYgKHdhaXRfYWNrKQ0KPiA+ICsJ
CWZsYWdzIHw9IExKQ0FfQUNLX0ZMQUc7DQoNCldpbGwgYmUgcmVtb3ZlZCBpbiBuZXh0IHZlcnNp
b24NCg0KPiA+ICsNCj4gPiArCWhlYWRlciA9IGttYWxsb2MobXNnX2xlbiwgR0ZQX0tFUk5FTCk7
DQo+ID4gKwlpZiAoIWhlYWRlcikNCj4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gDQo+IERvIHlv
dSByZWFsbHkgd2FudCB0byBmaXJzdCBzZXQgYSBmbGFnLCB0aGVuIGVycm9yIG91dD8NCg0KVGhh
bmtzLCBpbiBuZXh0IHZlcnNpb24sIGl0IHdpbGwgYmUgbGlrZSBibG93Og0KaGVhZGVyLT5mbGFn
cyA9IHdhaXRfYWNrID8gZmxhZ3MgfCBMSkNBX0FDS19GTEFHIDogZmxhZ3M7DQoNCj4gDQo+ID4g
KwloZWFkZXItPnR5cGUgPSBzdHViLT50eXBlOw0KPiA+ICsJaGVhZGVyLT5jbWQgPSBjbWQ7DQo+
ID4gKwloZWFkZXItPmZsYWdzID0gZmxhZ3M7DQo+ID4gKwloZWFkZXItPmxlbiA9IG9idWZfbGVu
Ow0KPiA+ICsNCj4gPiArCWlmIChvYnVmKQ0KPiA+ICsJCW1lbWNweShoZWFkZXItPmRhdGEsIG9i
dWYsIG9idWZfbGVuKTsNCj4gPiArDQo+ID4gKwlkZXZfZGJnKCZkZXYtPmludGYtPmRldiwgInNl
bmQ6IHR5cGU6JWQgY21kOiVkIGZsYWdzOiVkIGxlbjolZFxuIiwNCj4gaGVhZGVyLT50eXBlLA0K
PiA+ICsJCWhlYWRlci0+Y21kLCBoZWFkZXItPmZsYWdzLCBoZWFkZXItPmxlbik7DQo+ID4gKw0K
PiA+ICsJdXNiX2F1dG9wbV9nZXRfaW50ZXJmYWNlKGRldi0+aW50Zik7DQo+ID4gKwlpZiAoIWRl
di0+c3RhcnRlZCkgew0KPiA+ICsJCWtmcmVlKGhlYWRlcik7DQo+ID4gKwkJcmV0ID0gLUVOT0RF
VjsNCj4gDQo+IEFnYWluLCB0aGUgZmxhZyByZW1haW5zIHNldC4NCg0KVGhlIGZsYWcgaXMgbG9j
YWwgdmFyaWFibGUsIGFuZCB0aGUgaGVhZGVyIGhhcyBiZWVuIGZyZWVkIGFzIHdlbGwsIEkgZG9u
J3QgdGhpbmsgd2UgaGF2ZQ0KdG8gdGFrZSBjYXJlIHRoZSBmbGFnIGhlcmUuDQoNCj4gDQo+ID4g
KwkJZ290byBlcnJvcl9wdXQ7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJbXV0ZXhfbG9jaygmZGV2
LT5tdXRleCk7DQo+ID4gKwlzdHViLT5jdXJfY21kID0gY21kOw0KPiA+ICsJc3R1Yi0+aXBhY2tl
dC5pYnVmID0gaWJ1ZjsNCj4gPiArCXN0dWItPmlwYWNrZXQuaWJ1Zl9sZW4gPSBpYnVmX2xlbjsN
Cj4gPiArCXN0dWItPmFja2VkID0gZmFsc2U7DQo+ID4gKwlyZXQgPSB1c2JfYnVsa19tc2coaW50
ZXJmYWNlX3RvX3VzYmRldihkZXYtPmludGYpLA0KPiA+ICsJCQkgICB1c2Jfc25kYnVsa3BpcGUo
aW50ZXJmYWNlX3RvX3VzYmRldihkZXYtPmludGYpLCBkZXYtDQo+ID5vdXRfZXApLCBoZWFkZXIs
DQo+ID4gKwkJCSAgIG1zZ19sZW4sICZhY3R1YWwsIExKQ0FfVVNCX1dSSVRFX1RJTUVPVVRfTVMp
Ow0KPiA+ICsJa2ZyZWUoaGVhZGVyKTsNCj4gPiArCWlmIChyZXQpIHsNCj4gPiArCQlkZXZfZXJy
KCZkZXYtPmludGYtPmRldiwgImJyaWRnZSB3cml0ZSBmYWlsZWQgcmV0OiVkXG4iLCByZXQpOw0K
PiA+ICsJCWdvdG8gZXJyb3JfdW5sb2NrOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWlmIChhY3R1
YWwgIT0gbXNnX2xlbikgew0KPiA+ICsJCWRldl9lcnIoJmRldi0+aW50Zi0+ZGV2LCAiYnJpZGdl
IHdyaXRlIGxlbmd0aCBtaXNtYXRjaCAoJWQNCj4gdnMgJWQpXG4iLCBtc2dfbGVuLA0KPiA+ICsJ
CQlhY3R1YWwpOw0KPiA+ICsJCXJldCA9IC1FSU5WQUw7DQo+ID4gKwkJZ290byBlcnJvcl91bmxv
Y2s7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaWYgKHdhaXRfYWNrKSB7DQo+ID4gKwkJcmV0ID0g
d2FpdF9ldmVudF90aW1lb3V0KGRldi0+YWNrX3dxLCBzdHViLT5hY2tlZCwNCj4gbXNlY3NfdG9f
amlmZmllcyh0aW1lb3V0KSk7DQo+ID4gKwkJaWYgKCFyZXQpIHsNCj4gPiArCQkJZGV2X2Vycigm
ZGV2LT5pbnRmLT5kZXYsICJhY2tlZCB3YWl0IHRpbWVvdXRcbiIpOw0KPiA+ICsJCQlyZXQgPSAt
RVRJTUVET1VUOw0KPiA+ICsJCQlnb3RvIGVycm9yX3VubG9jazsNCj4gPiArCQl9DQo+ID4gKwl9
DQo+ID4gKw0KPiA+ICsJcmV0ID0gMDsNCj4gPiArZXJyb3JfdW5sb2NrOg0KPiA+ICsJc3R1Yi0+
aXBhY2tldC5pYnVmID0gTlVMTDsNCj4gPiArCXN0dWItPmlwYWNrZXQuaWJ1Zl9sZW4gPSBOVUxM
Ow0KPiA+ICsJbXV0ZXhfdW5sb2NrKCZkZXYtPm11dGV4KTsNCj4gPiArZXJyb3JfcHV0Og0KPiA+
ICsJdXNiX2F1dG9wbV9wdXRfaW50ZXJmYWNlKGRldi0+aW50Zik7DQo+ID4gKw0KPiA+ICsJcmV0
dXJuIHJldDsNCj4gPiArfQ0KPiA+ICsNCj4gDQo+IFsuLl0NCj4gPiArc3RhdGljIGludCBsamNh
X3N0YXJ0KHN0cnVjdCBsamNhX2RldiAqZGV2KSB7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsNCj4g
PiArCXVzYl9maWxsX2J1bGtfdXJiKGRldi0+aW5fdXJiLCBpbnRlcmZhY2VfdG9fdXNiZGV2KGRl
di0+aW50ZiksDQo+ID4gKwkJCSAgdXNiX3JjdmJ1bGtwaXBlKGludGVyZmFjZV90b191c2JkZXYo
ZGV2LT5pbnRmKSwgZGV2LQ0KPiA+aW5fZXApLCBkZXYtPmlidWYsDQo+ID4gKwkJCSAgZGV2LT5p
YnVmX2xlbiwgbGpjYV9yZWFkX2NvbXBsZXRlLCBkZXYpOw0KPiA+ICsNCj4gPiArCXJldCA9IHVz
Yl9zdWJtaXRfdXJiKGRldi0+aW5fdXJiLCBHRlBfS0VSTkVMKTsNCj4gPiArCWlmIChyZXQpIHsN
Cj4gPiArCQlkZXZfZXJyKCZkZXYtPmludGYtPmRldiwgImZhaWxlZCBzdWJtaXR0aW5nIHJlYWQg
dXJiLA0KPiBlcnJvciAlZFxuIiwgcmV0KTsNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsJfQ0K
PiA+ICsNCj4gPiArCW11dGV4X2xvY2soJmRldi0+bXV0ZXgpOw0KPiA+ICsJZGV2LT5zdGFydGVk
ID0gdHJ1ZTsNCj4gPiArCW11dGV4X3VubG9jaygmZGV2LT5tdXRleCk7DQo+IA0KPiBXaHkgZG8g
eW91IHRha2UgYSBtdXRleCBoZXJlPyBFaXRoZXIgdGhpcyBmdW5jdGlvbiBjYW5ub3QgcmFjZSB3
aXRoIGFueXRoaW5nDQo+IGVsc2UsIG9yIHlvdSBzZXQgdGhlIGZsYWcgdG9vIGxhdGUuDQoNClRo
YW5rcywgSSB3aWxsIGNvbnNpZGVyIHRoZSAnc3RhcnRlZCcgYWdhaW4uDQoNCj4gDQo+ID4gKw0K
PiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+IA0KPiA+ICsjaWZkZWYgQ09ORklHX0FD
UEkNCj4gPiArc3RhdGljIHZvaWQgbGpjYV9hdXhfZGV2X2FjcGlfYmluZChzdHJ1Y3QgbGpjYV9k
ZXYgKmRldiwgc3RydWN0DQo+IGF1eGlsaWFyeV9kZXZpY2UgKmF1eGRldiwNCj4gPiArCQkJCSAg
IHVuc2lnbmVkIGludCBhZHIpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBhY3BpX2RldmljZSAqcGFy
ZW50Ow0KPiA+ICsJc3RydWN0IGFjcGlfZGV2aWNlICphZGV2ID0gTlVMTDsNCj4gPiArDQo+ID4g
KwkvKiBuZXcgYXV4aWxpYXJ5IGRldmljZSBiaW5kIHRvIGFjcGkgZGV2aWNlICovDQo+ID4gKwlw
YXJlbnQgPSBBQ1BJX0NPTVBBTklPTigmZGV2LT5pbnRmLT5kZXYpOw0KPiA+ICsJaWYgKCFwYXJl
bnQpDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCWFkZXYgPSBhY3BpX2ZpbmRfY2hpbGRf
ZGV2aWNlKHBhcmVudCwgYWRyLCBmYWxzZSk7DQo+ID4gKwlBQ1BJX0NPTVBBTklPTl9TRVQoJmF1
eGRldi0+ZGV2LCBhZGV2ID86IHBhcmVudCk7IH0gI2Vsc2Ugc3RhdGljDQo+ID4gK3ZvaWQgbGpj
YV9hdXhfZGV2X2FjcGlfYmluZChzdHJ1Y3QgbGpjYV9kZXYgKmRldiwgc3RydWN0IGF1eGlsaWFy
eV9kZXZpY2UNCj4gKmF1eGRldiwNCj4gPiArCQkJCSAgIHVuc2lnbmVkIGludCBhZHIpDQo+ID4g
K3sNCj4gPiArfQ0KPiA+ICsjZW5kaWYNCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgbGpjYV9hZGRf
YXV4X2RldihzdHJ1Y3QgbGpjYV9kZXYgKmRldiwgY2hhciAqbmFtZSwgdTggdHlwZSwgdTggaWQs
DQo+IHU4IGFkciwgdm9pZCAqZGF0YSwNCj4gPiArCQkJICAgIHVuc2lnbmVkIGludCBsZW4pDQo+
ID4gK3sNCj4gPiArCXN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlICphdXhkZXY7DQo+ID4gKwlzdHJ1
Y3QgbGpjYSAqbGpjYTsNCj4gPiArCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJaWYgKGRldi0+bGpj
YV9jb3VudCA+PSBBUlJBWV9TSVpFKGRldi0+bGpjYXMpKQ0KPiA+ICsJCXJldHVybiAtRUlOVkFM
Ow0KPiA+ICsNCj4gPiArCWxqY2EgPSBremFsbG9jKHNpemVvZigqbGpjYSksIEdGUF9LRVJORUwp
Ow0KPiA+ICsJaWYgKCFsamNhKQ0KPiA+ICsJCXJldHVybiAtRU5PTUVNOw0KPiA+ICsNCj4gPiAr
CWxqY2EtPnR5cGUgPSB0eXBlOw0KPiA+ICsJbGpjYS0+aWQgPSBpZDsNCj4gPiArCWxqY2EtPmRl
diA9IGRldjsNCj4gPiArDQo+ID4gKwlhdXhkZXYgPSAmbGpjYS0+YXV4ZGV2Ow0KPiA+ICsJYXV4
ZGV2LT5uYW1lID0gbmFtZTsNCj4gPiArCWF1eGRldi0+aWQgPSBpZDsNCj4gPiArCWF1eGRldi0+
ZGV2LnBsYXRmb3JtX2RhdGEgPSBrbWVtZHVwKGRhdGEsIGxlbiwgR0ZQX0tFUk5FTCk7DQo+ID4g
KwlpZiAoIWF1eGRldi0+ZGV2LnBsYXRmb3JtX2RhdGEpDQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07
DQo+IA0KPiBtZW1vcnkgbGVhayBvZiBzdHJ1Y3QgbGpjYSAqbGpjYQ0KDQphY2ssIHRoaXMgd2ls
bCBiZSBmaXhlZCBpbiBuZXh0IHZlcnNpb24sIHRoYW5rcw0KDQo+IA0KPiA+ICsNCj4gPiArCWF1
eGRldi0+ZGV2LnBhcmVudCA9ICZkZXYtPmludGYtPmRldjsNCj4gPiArCWF1eGRldi0+ZGV2LnJl
bGVhc2UgPSBsamNhX2F1eF9yZWxlYXNlOw0KPiANCj4gCVJlZ2FyZHMNCj4gCQlPbGl2ZXINCg0K
