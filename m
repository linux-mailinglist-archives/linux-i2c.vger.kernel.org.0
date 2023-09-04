Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2616791296
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 09:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245239AbjIDHxC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 03:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjIDHxB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 03:53:01 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12091AF;
        Mon,  4 Sep 2023 00:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693813976; x=1725349976;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vjOzYmwlce39x0VN3JaX4kUcHyf5zneFbDcHYwBg094=;
  b=Y5/c0131zEh9iyyG+8sxKU6Sxg7i2CbBLasPdPrf/2LCQgSXqAzE7Ghd
   cV24zbYRxEY7QKOm2H6kRVAN6LUAL2Juuft0a8pTtEBW5Gcr+PPII276/
   f056F2vI4811LPQzURxf86GFppGAp7tlCbn7TlfRi7igQ1vWZn2gguITN
   iz8tGGaPMX1BNw6R+JKIzFtlByLD04Tc4C6jbVfrkhf8D30emVYJ+dlh3
   QAi+DgqnNDF5cytbmc1G4a6SWxYyrEKfK8MecujZcpvmpml2geSIQ8CqX
   RMLncLWIEoX/ZeLQ8eaTGhM+yP64P1gKxK542TQKz2me4/0M2L+N84CeS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="356859001"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="356859001"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 00:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="830817580"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="830817580"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Sep 2023 00:52:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 4 Sep 2023 00:52:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 4 Sep 2023 00:52:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 4 Sep 2023 00:52:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Le37pVRtHKVvmEVbBWmKdS0qUTQcimnxVhPoCDV53Niis2QuwXxUjC14M1iIFklWiFZHImle115eeIYiLD2jFWqwLp+AqcEAUxY7U444GPYap4mZfHx+EvJzh6e2ralWIXnoxkB8JcnU757o1Q0EUxfomghF4D4c6Or1pm/L0duuQ4rQ+FPGeBHWHX5YL31uDPgF6BT/mdmG/MzPSuwZtGun7xRMVUzHCAsXMt3h7j3gpE+6aZ+FpRCrjUtubO/rKZIgyM3qJ8a585zW0VtC/+w559O6RKp2tT1EnruuMlQDwI3QMqhmWL3osEyoZ815CMB+1ybndcrUSvYGya3gKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjOzYmwlce39x0VN3JaX4kUcHyf5zneFbDcHYwBg094=;
 b=FwSGnSDVJRu35qRbKSYhQf+0F+eGrODg0B7D/lYHBtb01J/a48lNj4ziWT5YYORqihV5PTEVPA52bZLDurRV2mbCD7ryY40HYePRV149vBt/9f7GU0uXPno1BqrnhCPl2fRCryJosRRaY49hjCZaegjnOUdNQioqJWTPrNjYSJUP+5Xuz43D3k+3aewuq4gqpXfZMsapGZ3yxiP+1Neb/D3IxgExidTUz1++asWjiY9DZLJjTFrvy16Uk36luIRsoLu8BTwCTMzpkRUk3ITqS47kBfihj6Qu+F84URKBqOG6yr1OJsXK26pTWdYXGQjQWApDxOGQJbo0xbBysadSWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4318.namprd11.prod.outlook.com (2603:10b6:208:17a::22)
 by MW4PR11MB7008.namprd11.prod.outlook.com (2603:10b6:303:227::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 07:52:52 +0000
Received: from MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::d363:c1a7:3bb7:a804]) by MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::d363:c1a7:3bb7:a804%2]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 07:52:52 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
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
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
CC:     "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: RE: [PATCH v14 1/4] usb: Add support for Intel LJCA device
Thread-Topic: [PATCH v14 1/4] usb: Add support for Intel LJCA device
Thread-Index: AQHZ3vLqt0FUDCDFkU6MTx3mqLWspbAKSZ+AgAABUPA=
Date:   Mon, 4 Sep 2023 07:52:51 +0000
Message-ID: <MN2PR11MB431816FE4F3EFEE4CCB3B69E8DE9A@MN2PR11MB4318.namprd11.prod.outlook.com>
References: <1693806261-12958-1-git-send-email-wentong.wu@intel.com>
 <1693806261-12958-2-git-send-email-wentong.wu@intel.com>
 <e1da8a5d-ec73-7ff4-d147-c50aa44f1039@redhat.com>
In-Reply-To: <e1da8a5d-ec73-7ff4-d147-c50aa44f1039@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4318:EE_|MW4PR11MB7008:EE_
x-ms-office365-filtering-correlation-id: 56f39d04-bd56-474f-e762-08dbad1bf0e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FzHkbU/BZ3T1z6Ipl0GKK6nUoBWu92wmmpP3Da5A2q/sH5+m3a21Oh0DseBCD/b5FRqo+LcngXWlrcEVcDRyX///ukm0TMt5qcqmVr0lCt807kArnDageebbZrMs2TjskM8tnqiBB55hDyOKvr9P/v1io8DAMEKOj599magkcchCy1rV15BZgx2YdJc2YI9w47nTnyuynBYn5K+MXRICaXn3SxXZJlaX0nK4ZTC3lv0v+s7Bn5HPIt3SRRI3VHXJGT65+lIbiVkBQJLwhEQ84CBd9PcMl4vLCbeKeP880kk5Bs5GO9AVN4k7qq8ZAkWaVZciY990GHt6AhsK7OLE8DP1DfzraVaKaLK6D7W5o3kGYaQPIElMalPufJVDEFe7f4FGPGO8aiujttfIlydR6besgdfLzvCYGwozjNkJ+Hh4PLo/YgSwCAxq/7UvciXJQ9qu+IxuFsN2s2spDtuUEG6OcemRRHDnx7Yfjec4BuaVqPR/6gPBEJ7fq7YcrzU5yKapEAg+VZQv5gOAR1mZq8mo8IGWcL90BaRl+U831aFMr6wdmXLhyFSwS5IST/nipV5+IHU2zfcH8aNG0fV4ScoMVCNRevl3/EALAX2KMfomAL553VW+lRJAOGBwRF+uNIKhqv0BTsj+0cVnuj2BqA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4318.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(1800799009)(451199024)(186009)(8676002)(5660300002)(6636002)(316002)(66476007)(2906002)(66446008)(110136005)(64756008)(66556008)(66946007)(76116006)(8936002)(4326008)(52536014)(7416002)(41300700001)(6506007)(7696005)(53546011)(9686003)(26005)(55016003)(38100700002)(38070700005)(122000001)(71200400001)(82960400001)(921005)(478600001)(83380400001)(86362001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3ltOTYxdXlmbkdXMDlCUmMvVVRISHF5bWNLR2l6Mm5TSU54YjladUFWSkc0?=
 =?utf-8?B?QVBKOW9FeWdxaTViQTBZcjJNT21SeHhjSVlGOUtoREVBSkErUzBRVU5oMDUy?=
 =?utf-8?B?dTFjV24rU0NqWHViUGFIdlkwZXJlYloxTHJjUFk0T0V2UTdYbXJuRWI1T2F5?=
 =?utf-8?B?ZVFEK3orUFFYVXZ3Vi94NU5teDZBb05TakgvNTB1QTdkallvU1hYQXhDaDVX?=
 =?utf-8?B?bjNJT05DQ2x4RTZYbFpNRVJjemtGTFloTUlnQmZscGNuVXNvZGtwV01kM2hB?=
 =?utf-8?B?V0pONTd4WXpWeUI5aGRocG9CYy9iaEpnL3duMFNwV0V2MHIwK3pKVnF1MmJn?=
 =?utf-8?B?WXhYQ1YwYzJuN0R5Y2ZzZkY4T1c0dU9aWUZvMXRITkEzcEZsMWhZR2hpQ3Bt?=
 =?utf-8?B?c0o4NDV2TGovQTlDYzcwaTF4SElkSlVZZTVmZGJtR3BpblNwb1RvUEpuS29q?=
 =?utf-8?B?UER0dkVpQThMUFpBTWs4RnAzKzM3b0ZCNzQ5R0hJZDVLQ2lIUGVGalR6TEhN?=
 =?utf-8?B?eGM3RGlqWTE0enFwZUpxT1Rxd0d4K2h3TFp4UURkV3NrQ2NLc01jcVlmMjg3?=
 =?utf-8?B?NjFaOENZbmdqUGxjT3lhZUR0ZHFIREliM3V0TFlhSCtmM091THZaRXU4dVVq?=
 =?utf-8?B?eDZBd0t2TDVsSHB4OWZ2ZmVFL1FvMkQwRHM5d1c3T1V0Wk8vL2NQQmdERXhy?=
 =?utf-8?B?K3ZmUU84YVFVR0FETWxrbkhzL0svb3MzK2NiQ1M4VkZCSXJuK25PKy9QclNL?=
 =?utf-8?B?c3RsbE1hMi9EaEJpcXR1YmFWTnZYVXluYUhHZ1IyQ0ZBa3VndXdndlFkUTJD?=
 =?utf-8?B?V3lrZ1NleWtOSDI0bVFHK1N6Q24xL1puNUtHVDJyVkRTMTIxSnZ5dGlaL2RK?=
 =?utf-8?B?RWZsUm9lT2JVbzFpZWl0UTluR2ZXTjdZamNFYU9jbm9ieFg5MEFWU0dpaUFU?=
 =?utf-8?B?TlJUTmxuMmpYT2tkQWFJbG82dGVkY2JHVThiMDFnQm1Gamg2NG1zci9Bakk2?=
 =?utf-8?B?SHNMdEpYZExDeTZXSnc1VTBMbnNESS80VjJkSXFFbDR4RFNwc2h4amJQS2Za?=
 =?utf-8?B?bDkwdnUxU0ZXTHdtSXhlNmcwalNnT0dCZDhxaklrK0Iwbmhkam5uMWNETGxS?=
 =?utf-8?B?Zk5jb25ERjNuOUFETWRjdlBzMHBpRTlkQ3VnY2VTZnY5c3dnM3ZXaTIyZHgv?=
 =?utf-8?B?ckthaDV2KzFFeDZmY3QxNlczcWIrRXNxaGZTanhSclJnUE5aQ1R6TE5pT3Bl?=
 =?utf-8?B?cUQxWklHc2MyNHJTem1ZKzlTcitYb2VQTDZ3RzFIcUJkSjM1NnkxcStmUkly?=
 =?utf-8?B?VFpsODhUeHczOC9lM2FhdUw1UmhUdUk0ZUYrQ0N5eXJYQU1MK2lvbkovYW8z?=
 =?utf-8?B?d2w2bXdhbm5qK2VxczZZVjhReTV1S1hRYWNRSXRGQmhOK0lCOTZHdXh3aXlO?=
 =?utf-8?B?UmplZVBhSkpSYzhYTktUVmFFeDRiUHR1Nk5rQ3lMWURKcDBxN1VOMlY0cHN2?=
 =?utf-8?B?WW96bm9IQ21ieVFMaGpUbFB0aHJ0NGxkZUxvK3VWNjFtc2dwamJ6WUNqNkpO?=
 =?utf-8?B?dEFIRFFqQzhDRTdxbTBpSEoxME9FYzFFaHEzalhCTmZLbm83dEJNWVg3amFv?=
 =?utf-8?B?UXM4L2R0N1h0WmR2SHkzS3VBK2F5VnBEcEQ4bDM3MU4xYkZTK3RlTnJiY3F0?=
 =?utf-8?B?V0dDcWVZcFNPaUk1ZmpMVFFsc3dFWk5wZlVkbjZSNi9RY2JnamZ1SHNmRitk?=
 =?utf-8?B?NU9RQ20rRk5ORWRCQkJtQlBPZHFBMDZhNmJCL2RHbVFwQUFBQjhwdVlCTlk0?=
 =?utf-8?B?dzhnVzZLcVdBWnBLQTcySDgyVVV5cUk3SGVVQ0VabVYxMk9WYTM2UXZyV1JB?=
 =?utf-8?B?TmdsbTVuQ1VDdUM3SzFmRHJiQkRqZkU0UmI5U0M4Z0hXaHp3MkIzWFBYM2Jr?=
 =?utf-8?B?MHdMUG1SZWV4a0NkS0dnVEtCZVNnNjY3M3F5YzNjcTYxQVJhVjE4MVkrRjYz?=
 =?utf-8?B?U2VodjBFdEo1c05JNHBDRUpJY0dZQ2R2eEgzWklsUDY4QWFQcmxjLy9uUk42?=
 =?utf-8?B?Vm1mWTRZOXpnL3F6dWlJZlY3SVZVbkpnaFRIOXJRb2dsZFg1Ui9ZMkZ2bitG?=
 =?utf-8?Q?jfI5w6pzWYA8P2qSzVU9gCRAA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4318.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f39d04-bd56-474f-e762-08dbad1bf0e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 07:52:52.0027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 58edhiqf0mfkXEBwixhjirS58f02XLeJDKNqK85Ysc60rs6WWYe3Wyhy5k4snMb4AAYpjb5GBJLmmZvxVVh5MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7008
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

PiBGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPg0KPiANCj4gSGksDQo+
IA0KPiBPbiA5LzQvMjMgMDc6NDQsIFdlbnRvbmcgV3Ugd3JvdGU6DQo+ID4gSW1wbGVtZW50cyB0
aGUgVVNCIHBhcnQgb2YgSW50ZWwgVVNCLUkyQy9HUElPL1NQSSBhZGFwdGVyIGRldmljZSBuYW1l
ZA0KPiA+ICJMYSBKb2xsYSBDb3ZlIEFkYXB0ZXIiIChMSkNBKS4NCj4gPg0KPiA+IFRoZSBjb21t
dW5pY2F0aW9uIGJldHdlZW4gdGhlIHZhcmlvdXMgTEpDQSBtb2R1bGUgZHJpdmVycyBhbmQgdGhl
DQo+ID4gaGFyZHdhcmUgd2lsbCBiZSBtdXhlZC9kZW11eGVkIGJ5IHRoaXMgZHJpdmVyLiBUaHJl
ZSBtb2R1bGVzICggSTJDLA0KPiA+IEdQSU8sIGFuZCBTUEkpIGFyZSBzdXBwb3J0ZWQgY3VycmVu
dGx5Lg0KPiA+DQo+ID4gRWFjaCBzdWItbW9kdWxlIG9mIExKQ0EgZGV2aWNlIGlzIGlkZW50aWZp
ZWQgYnkgdHlwZSBmaWVsZCB3aXRoaW4gdGhlDQo+ID4gTEpDQSBtZXNzYWdlIGhlYWRlci4NCj4g
Pg0KPiA+IFRoZSBzdWItbW9kdWxlcyBvZiBMSkNBIGNhbiB1c2UgbGpjYV90cmFuc2ZlcigpIHRv
IGlzc3VlIGEgdHJhbnNmZXINCj4gPiBiZXR3ZWVuIGhvc3QgYW5kIGhhcmR3YXJlLiBBbmQgbGpj
YV9yZWdpc3Rlcl9ldmVudF9jYiBpcyBleHBvcnRlZCB0bw0KPiA+IExKQ0Egc3ViLW1vZHVsZSBk
cml2ZXJzIGZvciBoYXJkd2FyZSBldmVudCBzdWJzY3JpcHRpb24uDQo+ID4NCj4gPiBUaGUgbWlu
aW11bSBjb2RlIGluIEFTTCB0aGF0IGNvdmVycyB0aGlzIGJvYXJkIGlzIFNjb3BlDQo+ID4gKFxf
U0IuUENJMC5EV0MzLlJIVUIuSFMwMSkNCj4gPiAgICAgew0KPiA+ICAgICAgICAgRGV2aWNlIChH
UElPKQ0KPiA+ICAgICAgICAgew0KPiA+ICAgICAgICAgICAgIE5hbWUgKF9BRFIsIFplcm8pDQo+
ID4gICAgICAgICAgICAgTmFtZSAoX1NUQSwgMHgwRikNCj4gPiAgICAgICAgIH0NCj4gPg0KPiA+
ICAgICAgICAgRGV2aWNlIChJMkMpDQo+ID4gICAgICAgICB7DQo+ID4gICAgICAgICAgICAgTmFt
ZSAoX0FEUiwgT25lKQ0KPiA+ICAgICAgICAgICAgIE5hbWUgKF9TVEEsIDB4MEYpDQo+ID4gICAg
ICAgICB9DQo+ID4NCj4gPiAgICAgICAgIERldmljZSAoU1BJKQ0KPiA+ICAgICAgICAgew0KPiA+
ICAgICAgICAgICAgIE5hbWUgKF9BRFIsIDB4MDIpDQo+ID4gICAgICAgICAgICAgTmFtZSAoX1NU
QSwgMHgwRikNCj4gPiAgICAgICAgIH0NCj4gPiAgICAgfQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogV2VudG9uZyBXdSA8d2VudG9uZy53dUBpbnRlbC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IFNh
a2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1i
eTogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBsaW51eC5pbnRlbC5jb20+DQo+ID4gVGVzdGVkLWJ5
OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPg0KPiA+IC0tLQ0KPiA+ICsNCj4g
PiArc3RhdGljIGludCBsamNhX21hdGNoX2RldmljZV9pZHMoc3RydWN0IGFjcGlfZGV2aWNlICph
ZGV2LCB2b2lkDQo+ID4gKypkYXRhKSB7DQo+ID4gKwlzdHJ1Y3QgbGpjYV9tYXRjaF9pZHNfd2Fs
a19kYXRhICp3ZCA9IGRhdGE7DQo+ID4gKwljb25zdCBjaGFyICp1aWQgPSBhY3BpX2RldmljZV91
aWQoYWRldik7DQo+ID4gKw0KPiA+ICsJaWYgKGFjcGlfbWF0Y2hfZGV2aWNlX2lkcyhhZGV2LCB3
ZC0+aWRzKSkNCj4gPiArCQlyZXR1cm4gMDsNCj4gPiArDQo+ID4gKwlpZiAoIXdkLT51aWQpDQo+
ID4gKwkJZ290byBtYXRjaDsNCj4gPiArDQo+ID4gKwlpZiAoIXVpZCkNCj4gPiArCQl1aWQgPSAi
MCI7DQo+ID4gKwllbHNlDQo+ID4gKwkJdWlkID0gbWVtY2hyKHVpZCwgd2QtPnVpZFswXSwgc3Ry
bGVuKHVpZCkpOw0KPiANCj4gTm90ZSB0aGlzIGxpbmUgY2FuIGJlIHNpbXBsaWZpZWQgdG86DQo+
IA0KPiAJCXVpZCA9IHN0cmNocih1aWQsIHdkLT51aWRbMF0pOw0KDQpBY2ssIHRoaXMgd2lsbCBi
ZSBpbmNsdWRlZCBpbiBuZXh0IHZlcnNpb24sIHRoYW5rcy4NCg0KQlIsDQpXZW50b25nIA0KPiAN
Cj4gUmVnYXJkcywNCj4gDQo+IEhhbnMNCg0K
