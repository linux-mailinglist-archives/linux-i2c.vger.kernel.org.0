Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 766A17912B0
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 09:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352415AbjIDH4T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 03:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352024AbjIDH4S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 03:56:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F1C4FA;
        Mon,  4 Sep 2023 00:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693814175; x=1725350175;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wAGFuXsVHNbPdJsMuvJ6d6vhpmy7DWMyTnuDoVWYCow=;
  b=liqnJv3cWibaOHU6IUIU+JOREf1bLh2OUv3yS63LzTa9ehIAKPbvLIfN
   zFWsxIIK5u0rKX/o+DifzoBMsCdT/nwXXOfNtYznXUc6OQFF23RjLkH/5
   lZ4uChgGPQjXQDhxFgOA4ojivlWdmyg1K2JcgaQOspKVk/ENGSHdCk1Wx
   PZdRGZ5k4gVvdPHwVVDTgle0jq0rd3n7E6SYVIZS6UoA+fcHstshP9CZb
   gdxXtr6R/xs7H1X8ukWzVPj0qEFRuDgbROj+bCHOxtnrnje8TfIk01BnZ
   gGB+EdAH+MLpkg+Gew9jcI3I9jke+lvMqatDZG/8+jrMMO5ug1+G3TS4n
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="356859556"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="356859556"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 00:56:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="864252149"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="864252149"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Sep 2023 00:56:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 4 Sep 2023 00:56:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 4 Sep 2023 00:56:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 4 Sep 2023 00:56:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 4 Sep 2023 00:56:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNzGd71CoCK74GpeQC7iEZiXiDA3TlgSXtvT0Hw28dDQwGucqCffWgzgi4axNGk6HEieMB+Xi58dukGo4Vqpwg1H+tf63xoVERfoImhDh6rTql/8MNRHARPRonIb5fVK5+LzlZiseVRzSI+d+Z7W9a8eBC+ANdarEkVtQbJRKrDsnjQa5Ad2wXl4VCS4Ff3O4FJFw7otrZ9LkYgcIcsQtnWkCRjD9Sy2og/5ceJh42mHkhVi4KQ98cBHp2z+ZG7JgFBpPb8EpIrPjKPNpdRCy3WUgyWLLOwUSs8ApUULXDWUBrr4Ob+3vXVXpv/nzS/O70z393jTr4yObWYOJ5jxew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAGFuXsVHNbPdJsMuvJ6d6vhpmy7DWMyTnuDoVWYCow=;
 b=UfFjbqjOQohmHxbFrFVQbqL525gF6JvbR07hQyhtN1fRuUDubNNIIvia2dD4ipLlTAgXjM00QNHgONNe1O06IRNecyZJaN449XWJ7cEkeGvMXngdTmgOmTfdn0KioYLVCTb++qws8OPzawqm32r2IkpmyJJ8mAMA3ju6bpB+TW1h+xxRKdJAx+W4NajBYZJKwo473Tb+lXXTvl8TNcL6jR37bPuu6zJYxdlxV5liP72xR0RZTj2a1ikZ1wz+KyXEo1Q5Xwo85FH1rIHCKT5Gou4dndoO6bQG5gKjDUk/YggJ0UrXdnDKWhTpZ9DX0JamprU2naDaI0Y+QP4TJYUE0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4318.namprd11.prod.outlook.com (2603:10b6:208:17a::22)
 by MW4PR11MB7008.namprd11.prod.outlook.com (2603:10b6:303:227::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 07:56:03 +0000
Received: from MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::d363:c1a7:3bb7:a804]) by MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::d363:c1a7:3bb7:a804%2]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 07:56:03 +0000
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
Subject: RE: [PATCH v14 0/4] Add Intel LJCA device driver
Thread-Topic: [PATCH v14 0/4] Add Intel LJCA device driver
Thread-Index: AQHZ3vLjqM86aaWCYk2CGgLT6KzevbAKSUeAgAACf/A=
Date:   Mon, 4 Sep 2023 07:56:03 +0000
Message-ID: <MN2PR11MB4318E4CE7DE0A4C4F82CAC7B8DE9A@MN2PR11MB4318.namprd11.prod.outlook.com>
References: <1693806261-12958-1-git-send-email-wentong.wu@intel.com>
 <5674e677-2bdc-bb0e-20cc-2ec855d1f8d4@redhat.com>
In-Reply-To: <5674e677-2bdc-bb0e-20cc-2ec855d1f8d4@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4318:EE_|MW4PR11MB7008:EE_
x-ms-office365-filtering-correlation-id: ea9662ee-eb39-4c6b-73d9-08dbad1c630e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JzVoEolvYEQWPZr/UVMj+gYIYQ5lnINTCfxwukhSTbi1k+dgpJn31//C5+Pwm0cKk75vzrgxPdyNpNcw20oclBuivyeX/Zn46/q1mAq0QUs18dVEwKj1RTDh/Y9bjnnvDu53o+0Oqw0ZnFIkNrwlLEvm1cmbXBhKWYS642XOsjKwRSnnv55adKbgllW2EbeqQidYGhQJeB5gQSnrmFKletyOqYdAHO4iRxsAibRXLCkHMUnRdOLow37SHvhBgV2UlTHHsGgyFNpSj4R8+I+/3d4oBbeRAME+6AcsYjn2Jpa2v/77djyISsXVWVRRmmN4gJNkKMRQ9d5boShuolZUuZSXllyhlcWaP38Z5+Xh/nQ3emkoWLFbERTClK898mo27p1ILp69YgDouByHnEB1SWSElwdAKotryFy4MOtgnHn1Yy26MPmPBow9HWiIvjxg32kgWcbGHozPk5gmr1+1b7EReNKuCOZkA+dfxtPj/MTMl9fQ3Cr/aKuLpRarVsXi+G95CfD9GZylt6DLJeZlkcz+/577/rNHhAgm81uWj9zjIysbTvWGy2/HPYuah71Rqi52xVpdEkEx8EFjMuiMUi0hY7XITkOeU0sJxVKS2p/DwFsIDuzqfZcu4VZqeJwJHvVEyf3Ca2zxovdgq+cEVA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4318.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(1800799009)(451199024)(186009)(8676002)(5660300002)(6636002)(316002)(66476007)(2906002)(66446008)(110136005)(64756008)(66556008)(66946007)(76116006)(8936002)(4326008)(52536014)(7416002)(41300700001)(6506007)(7696005)(53546011)(9686003)(26005)(55016003)(38100700002)(38070700005)(122000001)(71200400001)(82960400001)(921005)(478600001)(83380400001)(86362001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QW41aXZvV0NaRVdEdnNvRmRSZXNSNE5YN0NvVmJGV3QwMVRDWHQxVjJxelJp?=
 =?utf-8?B?amRyejZoZ0VPMUxPNzdFVXVDaG1jRGpuVmgvcVF5ZWVGUWhrKy8ycDJFM2hE?=
 =?utf-8?B?L01pYkgrT3Jyd2djMlhmVmFhVzlnc3cySG1DaERKTnBzWjhZS1Nka1lVcG5H?=
 =?utf-8?B?UWRvTFJBM1BtcGxXWSs0Qy94c0o0RTUxdjF2T0xKS1hyRUxoYWN5WmIwREJw?=
 =?utf-8?B?TWJNQUs0ZE54N3VMbTlwVkVvanJkWHVmLzdIOWtxOGwrSzd3NWVXNFlQQm9N?=
 =?utf-8?B?ZDJEbVVnNWxJQUFiRnFwWFdlNkgvWTRVNnpCQ0tPRk0xY1B6UldkVmJiU1gv?=
 =?utf-8?B?UWVDZVQ1NkxXb0RPdmdka3BFdEgyRWdEUVlaTkxyeHZhdC9acHZXUXFIZXRk?=
 =?utf-8?B?TkVoSEpnVVY5WVpCLzd4RUVsNHhzQmE1aUZkTU8rQVFCZ3RpNDZzU1E4bTZW?=
 =?utf-8?B?NzRvc3p1SS9wM3pUYTJNQU0xK1dRWDlCTlFmL0IveWZWZTR2VHJ5M29pZzQ1?=
 =?utf-8?B?QWovMEE4eldOb2R5QnZLWXVmdDBJazRHTFQ2ZmY4Vkx6VnkvRjBLeCtFNnY0?=
 =?utf-8?B?cUtITmdiRkw3QURCQm5hUFRZUk0xZUVQSE5adXpWV0oxNWdtTWlSVHAvaW9n?=
 =?utf-8?B?NUNkUU9COW5WYytMejI4YXYzOGFIb1JhcXNGS3RmMXd2UUNEWm1pdmJzN2Iw?=
 =?utf-8?B?YVY2eXNsMklLa1R4Z0FlT1NTQTdGc1QwdW1LZCtFeXlXUGRTRVZDWnEvQ3FV?=
 =?utf-8?B?YmFHenZES2VKZXVQYmYzSnJ2REkrbTV0RVh0RzdQaTd6dDFPdG42TjR4eU1P?=
 =?utf-8?B?Qkd3aWZ5dlNVa1MvREFKQWwvRWtjZi8rVDVwN2ZHYmNxM1RYSEN4R202b1Zi?=
 =?utf-8?B?MVNtZE05dkVDMGoveHgrVHh5emJUamFQMnNWWDA0Zy9Za0FLY0pSU1ltZGI2?=
 =?utf-8?B?UitBSDFnZnUvOVpSbzdkNkxSWDkzRHRwamcxcjVFcnhPd2JFZUw1RDQrRlpV?=
 =?utf-8?B?ajQvcVpxazIwMlJqVDJxVEhwZmMyZFBXN3ZSMkdTQWZyblpkOWU1VGEzZXRV?=
 =?utf-8?B?TnRpdnZOb09iY2ZxdWx4amFlODFBRzFCb3lWZHJPSEtTSWhUWTRoNHA3bHFw?=
 =?utf-8?B?TU5DOXVGNUR1a0ZwdnlpeHZKSGJseEdSellSWlVTcFBQbjZWVUM2K1I2V2JC?=
 =?utf-8?B?eTRyUjlvNlM2Z2loT0s0Tml2Mk9QeXJsRnFlb3F1N1pET3hvdjROZjU1WEZD?=
 =?utf-8?B?VVNzVlN4ZW1EekwvaUVlV3ozRzBjWGcwTkFIT0ZyYzV3RUdJamU1NXdha0Y1?=
 =?utf-8?B?Y2MwSytBd2dHSWd1MEt5TW1CdE1EdGJ5NE93NnFrMTRFUW9OanVJVG50SmRB?=
 =?utf-8?B?bVgyVWNxUjdOVnFhQ2gxR2tuREFGamJvcXEwNmhhR1JLeTB0TGZXbTNqbG0y?=
 =?utf-8?B?RlRTV1JhRllRV2xQYmhLcjhNdTNwZFB5Y3BQRHF0aXFudHVrL2duRkF5Z2Mv?=
 =?utf-8?B?Q2xaOVFIYVVNd2RBdEE5VGhXczlXK3UxS2lwbk1YS0VTQ1lTRDR6VHo2M2t6?=
 =?utf-8?B?SStHVUlycExMTDV2Sko0QlYxYjlCaDBNc0h3TWd5VGRrM1U4amVXei9RbFZz?=
 =?utf-8?B?VXRIMXlNY3VTSW9xL24xMnFpZHRBaGkzY01Eb2VaaWthUUtLRXVOa3NibXVD?=
 =?utf-8?B?ODZIRkViWlREbzZ5Vmd6elZLaUhzd0RpdTFwcVpJbmZCdmxlaXIxVlhJT0Jj?=
 =?utf-8?B?KzNCVyszVVpORWxSb0hzQkdkRVpjMzU4Z21hZVRadGZnbkRmb2RVREJGY1Qv?=
 =?utf-8?B?K1VkN2R0T21qNW5STU9EaE84R0twLzNiaGF2QnRFWEsydHd2ODFwamU1czlC?=
 =?utf-8?B?WjZyanBObzJLeUw3QXI4Ymg2R2JXblI4THUwbUorRzdQT2Jaa0hVYWtLQ1Nr?=
 =?utf-8?B?NE5wRnFaTFN4a0VVZDU4aTgraHBoWEdaTytVT0x1enMwOU5TVGNJRVY3Vy9E?=
 =?utf-8?B?eDV5NzUzSSsrUTBGRnNST3I2SlYrZ2hvOFQwOThDYitPTEhiM0tmRmlsNHNI?=
 =?utf-8?B?M0ROaVZkMHlONzdQZFVEdVo1dmpUZ2J2cUxyc0R5ekMzN1FnQVZsRGU5SVBH?=
 =?utf-8?Q?8eG3hjjNSygAtiQWM0mVjVuvG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4318.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9662ee-eb39-4c6b-73d9-08dbad1c630e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 07:56:03.5395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dgdNRnmu6yY8bIk1tXt4MXetv6Ex72hL7bg+S8UWTnR3vUpQD/WqILz7mgP5m18TlEYO/kq6U8NyBayNb28Q8w==
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
IA0KPiBPbiA5LzQvMjMgMDc6NDQsIFdlbnRvbmcgV3Ugd3JvdGU6DQo+ID4gQWRkIGRyaXZlciBm
b3IgSW50ZWwgTGEgSm9sbGEgQ292ZSBBZGFwdGVyIChMSkNBKSBkZXZpY2UuIFRoaXMNCj4gPiBJ
Ty1leHBhbmRlciBleHBhbmRzIGFkZGl0aW9uYWwgZnVuY3Rpb25zIHRvIHRoZSBob3N0IHN5c3Rl
bSBzdWNoIGFzDQo+ID4gR1BJTywgSTJDIGFuZCBTUEkgd2l0aCBVU0IgaG9zdCBpbnRlcmZhY2Uu
IFdlIGFkZCA0IGRyaXZlcnMgdG8gc3VwcG9ydA0KPiA+IHRoaXMgZGV2aWNlOiBhIFVTQiBkcml2
ZXIsIGEgR1BJTyBjaGlwIGRyaXZlciwgYSBJMkMgY29udHJvbGxlciBkcml2ZXINCj4gPiBhbmQg
YSBTUEkgY29udHJvbGxlciBkcml2ZXIuDQo+ID4NCj4gPiAtLS0NCj4gPiB2MTQ6DQo+ID4gIC0g
Zml4IGJ1aWxkIGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbg0KPiAnYWNw
aV9kZXZfY2xlYXJfZGVwZW5kZW5jaWVzJw0KPiA+DQo+ID4gdjEzOg0KPiA+ICAtIG1ha2UgbGpj
YS11c2IgbW9yZSByb2J1c3Qgd2l0aCB0aGUgaGVscCBvZiBIYW5zIGRlIEdvZWRlDQo+ID4gIC0g
Y2FsbCBhY3BpX2Rldl9jbGVhcl9kZXBlbmRlbmNpZXMoKSB0byBtYXJrIF9ERVAgQUNQSSBkZXBl
bmRlbmNpZXMNCj4gPiBvbiB0aGUgSTJDIGNvbnRyb2xsZXIgYXMgc2F0aXNmaWVkLCBhbmQgcGF0
Y2ggaXMgZnJvbSBIYW5zIGRlIEdvZWRlDQo+IA0KPiBUaGFuayB5b3UgSSBjYW4gY29uZmlybSB0
aGF0IHYxNCB3b3JrcyB3ZWxsIG9uIG15IFRoaW5rUGFkIHgxIHlvZ2EgZ2VuIDg6DQo+IA0KPiBU
ZXN0ZWQtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+DQoNClRoYW5rcywg
djE0IGFsc28gd29ya3Mgd2VsbCBvbiBteSBzZXR1cChSUEwgcGxhdGZvcm0pLg0KDQpCUiwNCldl
bnRvbmcNCj4gDQo+IE5vdGUgSSBzdGlsbCBoYXZlIG9uZSBzbWFsbCByZW1hcmsgZm9yIHBhdGNo
IDEvNCwgSSdsbCByZXBseSB0byB0aGUgcGF0Y2ggaXRzZWxmIHdpdGgNCj4gdGhlIHJlbWFyay4N
Cj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBIYW5zDQo+IA0KPiA+DQo+ID4gdjEyOg0KPiA+ICAtIHN3
aXRjaCBkZXZfZXJyIHRvIGRldl9kYmcgZm9yIGkyYy1samNhIGRyaXZlcg0KPiA+ICAtIGF2b2lk
IGVyciBwcmludGluZyBiZWNhdXNlIG9mIGNhbGxpbmcgdXNiX2tpbGxfdXJiIHdoZW4gYXR0ZW1w
dHMgdG8NCj4gPiByZXN1Ym1pdCB0aGUgcnggdXJiDQo+ID4NCj4gPiB2MTE6DQo+ID4gIC0gc3dp
dGNoIGRldl9lcnIgdG8gZGV2X2RiZyBmb3IgaTJjLWxqY2EgZHJpdmVyDQo+ID4gIC0gcmVtb3Zl
IG1lc3NhZ2UgbGVuZ3RoIGNoZWNrIGJlY2F1c2Ugb2YgZGVmaW5lZCBxdWlyayBzdHJ1Y3R1cmUN
Cj4gPiAgLSByZW1vdmUgSTJDX0ZVTkNfU01CVVNfRU1VTCBzdXBwb3J0DQo+ID4NCj4gPiB2MTA6
DQo+ID4gIC0gcmVtb3ZlIGxqY2FfaTJjX2Zvcm1hdF9zbGF2ZV9hZGRyDQo+ID4gIC0gcmVtb3Zl
IG1lbXNldCBiZWZvcmUgd3JpdGUgd3JpdGUgd19wYWNrZXQNCj4gPiAgLSBtYWtlIGxqY2FfaTJj
X3N0b3Agdm9pZCBhbmQgcHJpbnQgZXJyIG1lc3NhZ2UgaW4gY2FzZSBmYWlsdXJlDQo+ID4gIC0g
dXNlIGRldl9lcnJfcHJvYmUgaW4gbGpjYV9pMmNfcHJvYmUgZnVuY3Rpb24NCj4gPg0KPiA+IHY5
Og0KPiA+ICAtIG92ZXJoYXVsIHVzYi1samNhIGRyaXZlciB0byBtYWtlIGl0IG1vcmUgc3RydWN0
dXJlZCBhbmQgZWFzeQ0KPiA+IHVuZGVyc3RhbmQNCj4gPiAgLSBmaXggbWVtb3J5IGxlYWsgaXNz
dWUgZm9yIHVzYi1samNhIGRyaXZlcg0KPiA+ICAtIGFkZCBzcGlubG9jayB0byBwcm90ZWN0IHR4
X2J1ZiBhbmQgZXhfYnVmDQo+ID4gIC0gY2hhbmdlIGV4cG9ydGVkIEFQSXMgZm9yIHVzYi1samNh
IGRyaXZlcg0KPiA+ICAtIHVuaWZ5IHByZWZpeCBmb3Igc3RydWN0dXJlcyBhbmQgZnVuY3Rpb25z
IGZvciBpMmMtbGpjYSBkcml2ZXINCj4gPiAgLSB1bmlmeSBwcmVmaXggZm9yIHN0cnVjdHVyZXMg
YW5kIGZ1bmN0aW9ucyBmb3Igc3BpLWxqY2EgZHJpdmVyDQo+ID4gIC0gdW5pZnkgcHJlZml4IGZv
ciBzdHJ1Y3R1cmVzIGFuZCBmdW5jdGlvbnMgZm9yIGdwaW8tbGpjYSBkcml2ZXINCj4gPiAgLSB1
cGRhdGUgZ3Bpby1samNhLCBpMmMtbGpjYSBhbmQgc3BpLWxqY2EgZHJpdmVycyBhY2NvcmRpbmcg
dG8NCj4gPiB1c2ItbGpjYSdzIGNoYW5nZXMNCj4gPg0KPiA+IFdlbnRvbmcgV3UgKDQpOg0KPiA+
ICAgdXNiOiBBZGQgc3VwcG9ydCBmb3IgSW50ZWwgTEpDQSBkZXZpY2UNCj4gPiAgIGkyYzogQWRk
IHN1cHBvcnQgZm9yIEludGVsIExKQ0EgVVNCIEkyQyBkcml2ZXINCj4gPiAgIHNwaTogQWRkIHN1
cHBvcnQgZm9yIEludGVsIExKQ0EgVVNCIFNQSSBkcml2ZXINCj4gPiAgIGdwaW86IHVwZGF0ZSBJ
bnRlbCBMSkNBIFVTQiBHUElPIGRyaXZlcg0KPiA+DQo+ID4gIGRyaXZlcnMvZ3Bpby9LY29uZmln
ICAgICAgICAgIHwgICA0ICstDQo+ID4gIGRyaXZlcnMvZ3Bpby9ncGlvLWxqY2EuYyAgICAgIHwg
MjQ2ICsrKysrKystLS0tLS0NCj4gPiAgZHJpdmVycy9pMmMvYnVzc2VzL0tjb25maWcgICAgfCAg
MTEgKw0KPiA+ICBkcml2ZXJzL2kyYy9idXNzZXMvTWFrZWZpbGUgICB8ICAgMSArDQo+ID4gIGRy
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtbGpjYS5jIHwgMzM0ICsrKysrKysrKysrKysrKysrDQo+ID4g
IGRyaXZlcnMvc3BpL0tjb25maWcgICAgICAgICAgIHwgIDExICsNCj4gPiAgZHJpdmVycy9zcGkv
TWFrZWZpbGUgICAgICAgICAgfCAgIDEgKw0KPiA+ICBkcml2ZXJzL3NwaS9zcGktbGpjYS5jICAg
ICAgICB8IDI5NyArKysrKysrKysrKysrKysNCj4gPiAgZHJpdmVycy91c2IvbWlzYy9LY29uZmln
ICAgICAgfCAgMTQgKw0KPiA+ICBkcml2ZXJzL3VzYi9taXNjL01ha2VmaWxlICAgICB8ICAgMSAr
DQo+ID4gIGRyaXZlcnMvdXNiL21pc2MvdXNiLWxqY2EuYyAgIHwgODM0DQo+ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBpbmNsdWRlL2xpbnV4L3VzYi9s
amNhLmggICAgICB8IDExMyArKysrKysNCj4gPiAgMTIgZmlsZXMgY2hhbmdlZCwgMTc2MiBpbnNl
cnRpb25zKCspLCAxMDUgZGVsZXRpb25zKC0pICBjcmVhdGUgbW9kZQ0KPiA+IDEwMDY0NCBkcml2
ZXJzL2kyYy9idXNzZXMvaTJjLWxqY2EuYyAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gZHJpdmVy
cy9zcGkvc3BpLWxqY2EuYyAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdXNiL21pc2MvdXNi
LWxqY2EuYw0KPiA+IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3VzYi9samNhLmgN
Cg==
