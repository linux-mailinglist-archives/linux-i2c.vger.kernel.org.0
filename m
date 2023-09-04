Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5B2879135E
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 10:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238114AbjIDI0C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 04:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbjIDI0C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 04:26:02 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA52D8;
        Mon,  4 Sep 2023 01:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693815959; x=1725351959;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Jz9jDIIRL67R4Vja5JLlnHsh4L6hopbcnisiUdviotA=;
  b=O2bq7TXK8DYK4ULgM9a7Y8ZXmeIAwazsjKuQhzk82qYS7PQvWV/ASIZe
   hHFPTaqcKxsogT+lvsN86SOxpVOtfmNaC+w0rubKOdXyJkQ06KSPIQUil
   nq5wjYJ7sG3BR3t9Kdj5MpTB9sem1Kxy+rHMi4BESO+XyyuTayYyqNeDX
   cF0GtUxBW+bIbuowH+QWtXql7+yUN4H296+0cxI4l0MNLTkuBV35unUQD
   QusoIScinp4Xsp5CaNAtOUde7lgH2voDuvpYby/211d3Qp/Zx7vu8YInO
   Varu2Wt+pnb/GayFGdhF4ASQEEqHkPtqfGhuJDQxlVHAYyOdrRgFXI/4n
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="376478519"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="376478519"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 01:25:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="914432826"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="914432826"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Sep 2023 01:25:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 4 Sep 2023 01:25:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 4 Sep 2023 01:25:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 4 Sep 2023 01:25:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2CAhlkCmISvb8o8VeNoRq5BKjr0buSGKhyVl6CAK4IWh1sur9WBgSgefUuMYss7E4Ow8ZH4NfjgR9XdVLV4//MlMkDsIMczrA4SaxfvIKHJRdj4mA5zVRm3zSn5BF7AgZ3AbmVaUA4u58GMhxBZlLKxJePoeBeFmMkTZ1hA2eRHh8Nix6I/gD9y0o7gFfT4TIHLoGrx5U4T6hoE4HFEl7q3f25GJoc5irZZpr1Zg3NbPU2a0W3tQPih00RT0FIFRCue/yixuq16rUrBfMiljFAV50jELaQLBmK6egfuUxO0pNKk8cbpiUuYc2JncxTgL0BRyGoDSTL5OEKaKRhd4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jz9jDIIRL67R4Vja5JLlnHsh4L6hopbcnisiUdviotA=;
 b=QT4kb7xifHDJiPSrG2EmeJYl2pjlIoxPEGPN510tIDgS0eGgyp3OyASDg2VBQYvdgOwbv9IgcIh0Xi5dGb9Vp2ek1db0o90GQdZoR43D6ZMezC6rkyHKVtFSuGmraLOBOrofekwzRAmWhPyEIRy/jYHlcHFLrJbskv2pKahtH/mD9tkvF4mNMKLTTZpTQNIT8bO4tOrFS8M1M/crdQ+raZQ4Ff3Yd2RLrogUWzBGEXTlFYyya/wXV8rFyz0TXdiXeFxyWhi+hbvnKeFYwf6R6KavvuOKHBVZjualbG9b+usB1HzZkNJJqQSkmGQD7F0n2ARFI+AKP5EmbtSZYERg4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4318.namprd11.prod.outlook.com (2603:10b6:208:17a::22)
 by CY8PR11MB7945.namprd11.prod.outlook.com (2603:10b6:930:7b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 08:25:55 +0000
Received: from MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::d363:c1a7:3bb7:a804]) by MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::d363:c1a7:3bb7:a804%2]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 08:25:55 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "kfting@nuvoton.com" <kfting@nuvoton.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "maz@kernel.org" <maz@kernel.org>,
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
Subject: RE: [PATCH v14 0/4] Add Intel LJCA device driver
Thread-Topic: [PATCH v14 0/4] Add Intel LJCA device driver
Thread-Index: AQHZ3vLjqM86aaWCYk2CGgLT6KzevbAKR7SAgAANEvA=
Date:   Mon, 4 Sep 2023 08:25:55 +0000
Message-ID: <MN2PR11MB431861597934AF6EAC8FDDB28DE9A@MN2PR11MB4318.namprd11.prod.outlook.com>
References: <1693806261-12958-1-git-send-email-wentong.wu@intel.com>
 <CAMRc=Md2TBRNBrD+w7=tys9fUqNKT0XwHYMHUgJ5WATLiR4UYQ@mail.gmail.com>
In-Reply-To: <CAMRc=Md2TBRNBrD+w7=tys9fUqNKT0XwHYMHUgJ5WATLiR4UYQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4318:EE_|CY8PR11MB7945:EE_
x-ms-office365-filtering-correlation-id: 3eb6ade3-e683-405c-97d9-08dbad208eec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JU9ny0h0LeiIMlNoOssTktiflAsEPNkNvbnhtv+GYSvVOfROi+Z/glVz+PuuUVhLjNd7Y8j2zY5rrycLq37BMtvLVWETXEPYIRubGg1rvAK285X51ELwUe4y9lAl+LXinxRJwpPi5EbDaRgYXdR25+g2Q9CKFw0m3XalynEvd3GRsW9I8tkck+4SqmXjRSoKnkFRaH+HfklAY3eLyO+nVxyaHAwmthfoViLeu1D/CbBQWlsK18S7bVxD0rlHx4335Uya5oUFJTLHii1q+Tie0hbOR66q6nfXuaEnkZ7s66LdtldLaFcwnTUWDxobG/5nYtlFWsjw6yD/JGh0KSElzcy8IKaQZSnl13Qa4G1XILyBnicQX2ISudW/AqojM1ASHk1s4XbnnwMpT9sexI2WPf3mlg0UqIU6l/mBxO0HFLAFHSwPz0JgmqRvziNH+NhUTCObIgwGF17onbnb9ZLz53e0m1zzPjDeoz7hLApK4qqhlgZKhWpru6KDAMYsuVCWTlOp3nzchA7XxgJCXISNV5OjFCUlIcanu8myjHgQCS42LnT78weiMxKKpZA4HVcLjX0KBQz+8Hz/aImiLO9dE2crsU7ozG5RtovHuiUX5aFHp69PRg2tZvF/4Me1wmv2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4318.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199024)(186009)(1800799009)(66556008)(66476007)(64756008)(66446008)(76116006)(2906002)(54906003)(66946007)(6916009)(86362001)(316002)(33656002)(55016003)(52536014)(5660300002)(8936002)(4326008)(8676002)(41300700001)(9686003)(38100700002)(38070700005)(26005)(4744005)(7416002)(478600001)(82960400001)(122000001)(6506007)(7696005)(71200400001)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0w3WjE0bWUwZXdqd1lXVEFYM2diT0tyVjZtMllsdjBLakcyQnRXc2lBVm5l?=
 =?utf-8?B?RmR1VUVYaWthWjA4MFplYnFIVFhrTVppbDdSNVptclJvVFppSndtdkdER1NG?=
 =?utf-8?B?ZWNqVjhlSjczeGI5YjNGeEp3K1RRbHlLeWVHVmtsS1Rlalk4Y2hEbDhpYUt0?=
 =?utf-8?B?TW5nNjZKZ3J6aC9jeHMwbmJ1MDlLSnVzbWRYdEdnNm9vYWpuVjkvb0RmOWdz?=
 =?utf-8?B?MGJoL1VjK294YUlGQ25wSDN4dlFjNXNoSGpXcVYxN0ErbFVxTWxIZWFIRHhK?=
 =?utf-8?B?NEE0c1JRTjZCcklDc2JEZTVqSDZ2dmEyNHRDeWFPOS9sVjJyalRRRHU4Mml6?=
 =?utf-8?B?TVFPZHRmUDRjNkpjVHM2OFdLTDVDMTRqelNRWDBtQ1JNTkhqV1FxWEc2NEI0?=
 =?utf-8?B?RHMzdTl0QnhpdCtKYXAxbnBuVEtRN2pMSWRqemZrL0F2MUpaNXRTMlJqY0F5?=
 =?utf-8?B?YkR4WitjcXBKZ21FeEFWRWFlMC81dmhiemMzU1l1eG1iOFFUMm5SQVlKQ2Zp?=
 =?utf-8?B?K2dRTFBmL1VOV2tkREIwbDFQVWc4THVWYkJRaWNPWEh2YllacFdSMERsUmdq?=
 =?utf-8?B?b0tkYzV3UEN3ZWJWY1F6UW9KRU9qdFgwTWlBTkRaREVHakNiK0h6VW4ybUtX?=
 =?utf-8?B?Mi90SVE2SHllS1FGSVJhaCtTNEtrUVgrS3JTMmp4TElsVElxbzJIQUtXOTZ5?=
 =?utf-8?B?Nlh4RWQ0djNYR2xBdFRBYVlFeUw2UjBqUFhZa0pzN2F6OEJNcGVoRmozRTdt?=
 =?utf-8?B?OHdITVJOZXVUVlltb0FKVVA5RXRvZTFwbllKdjBDVTE5cjZMN3U0YnExbmVN?=
 =?utf-8?B?TFdEUTBvSmdxeTNTcXFjTHFWQldRaTB0T2p5NFRqOVRRQnVYUTkzV0Q5RlY4?=
 =?utf-8?B?LzQxVERqZm1Da2tZbmJqRy9DbXgyYjJqRGtvV1dEUXlkMzgzWTY5VHI2RTJl?=
 =?utf-8?B?a0Vjc3ZNaytORDVHaUc2clZUV0EwRGlORDMyMWw4VFpZTzJRNDIzVFQzclk4?=
 =?utf-8?B?M0VUQzZETWRBWURRMVZjeGFqcFFxbHZDN0VXaDZMNTllR2Zsb1ZWa1g3QmFl?=
 =?utf-8?B?K1NsZVdvVW42dzAvTGMxOXV1UUs3SUxQQUpCQ2Q5MVNGV2U5ZDBWYjR0UExD?=
 =?utf-8?B?My95Vm1jS09tWUsxL0ZPTG9PR2JWUkxZSzN4c3ExWVYvcDFoL2J5MnZZU2JW?=
 =?utf-8?B?a2tadEFKcnhoNDkyZDdpZ3hCb2NpZVg0MDFTclR5Wmc4L2FscXRPRTRyOEJn?=
 =?utf-8?B?S0ZvMHFnckZaUEliMmJQK0FYZmQxMVVzTU02UHRMKy9VTlErQVpJaDBsS0Vh?=
 =?utf-8?B?eWMxQjd6d2I4YzRLQ09yYTE1QVlCNDIrKzNxSkZxNFA5bG5uT3FrNWRwaWpJ?=
 =?utf-8?B?VXpTTysxTEphYVZUaElYemVJS3VJYm5QOFhvelYxVFMraEtSUEo5Ti9BN1B5?=
 =?utf-8?B?N0oyRkN6WlRSbHJrOWE1WWgxdW93WDNaOXhCZytmVFJ2SjFSNlRpYUVFM1Iv?=
 =?utf-8?B?eFZSN2F3dzVqVkNWd1JHU3Y5Y3RwRjdKN2huKzM2dTE0THIvd0pkR3o0UGVi?=
 =?utf-8?B?NlhBeTFlV1hoZXZkK1dKNnBCRGpNcENvdHp5S3ppK2lKdWd0NHRDWDNJeUI4?=
 =?utf-8?B?U1U2aEp6UGdiMEFGWUE3UGVDalBkbGZzTDJpRmUwUTJKdmRIMXo0Ujl6MUtj?=
 =?utf-8?B?RzlXN2UwaGVtZGpxbWM3Q3d5TDJGREJmT3NyMkNIbzVTNG5HcWlqZXFXYWZ5?=
 =?utf-8?B?NWI2VXgvcnA1TXRjWXFyRGlGR1RLS1dZSjc2ZjNucit6OWZ1M3puanM2QjRP?=
 =?utf-8?B?SW9QbTAwajc3clJTSS9xei9mQm85Kys3VjFiaDFLRWFZOUJMTGxiUTdBdU8x?=
 =?utf-8?B?dTkvZHpOOVdBdUY5dkdsQlQ0dmh5VmlSSk80aks4RTFpYjcrVndPc2dPSUdi?=
 =?utf-8?B?eU1WOWROTTgxYUZ3ZWpCS2Yzd3dvWk4zMEVpSDZZRzFvNVo0RWp1aFpBc1ZD?=
 =?utf-8?B?OWc4TVFPaUREVU5sMjJrQnh1ZHNaRFNSNWRPMFlBemhvb1RTdVZOYmUvdUNu?=
 =?utf-8?B?M2QzNXQyVzJpMkRhaGFSUXROd2RjS0hGaTVOOS9nLy9CUzNnNDNVei9iY0xQ?=
 =?utf-8?Q?5BtHoefN9vJeIM00zAC/1kOAz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4318.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb6ade3-e683-405c-97d9-08dbad208eec
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 08:25:55.1350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z3bVyDMMTSwZgXPYH2FqwG3I4NRJYLvCJD2NHAVkoZoYxhnG/0diq8CD0DsYsNmXwDy9cIxQfO8310YZ4LOKJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7945
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPg0KPiANCj4gT24gTW9u
LCBTZXAgNCwgMjAyMyBhdCA3OjQ04oCvQU0gV2VudG9uZyBXdSA8d2VudG9uZy53dUBpbnRlbC5j
b20+IHdyb3RlOg0KPiA+DQo+ID4gQWRkIGRyaXZlciBmb3IgSW50ZWwgTGEgSm9sbGEgQ292ZSBB
ZGFwdGVyIChMSkNBKSBkZXZpY2UuIFRoaXMNCj4gPiBJTy1leHBhbmRlciBleHBhbmRzIGFkZGl0
aW9uYWwgZnVuY3Rpb25zIHRvIHRoZSBob3N0IHN5c3RlbSBzdWNoIGFzDQo+ID4gR1BJTywgSTJD
IGFuZCBTUEkgd2l0aCBVU0IgaG9zdCBpbnRlcmZhY2UuIFdlIGFkZCA0IGRyaXZlcnMgdG8gc3Vw
cG9ydA0KPiA+IHRoaXMgZGV2aWNlOiBhIFVTQiBkcml2ZXIsIGEgR1BJTyBjaGlwIGRyaXZlciwg
YSBJMkMgY29udHJvbGxlciBkcml2ZXINCj4gPiBhbmQgYSBTUEkgY29udHJvbGxlciBkcml2ZXIu
DQo+ID4NCj4gDQo+IFBsZWFzZSBzdG9wIHNwYW1taW5nIHRoZSBsaXN0IHdpdGggcmVzZW5kcy4g
R2l2ZSByZXZpZXdlcnMgYXQgbGVhc3QgYSBjb3VwbGUgZGF5cw0KPiB0byByZXNwb25kLg0KDQpV
bmRlcnN0b29kLCB0aGFua3MNCg0KQlIsDQpXZW50b25nDQo+IA0KPiBCYXJ0b3N6DQo=
