Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABD6C7908D3
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 19:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233240AbjIBRPb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 13:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbjIBRPa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 13:15:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412B2E5C;
        Sat,  2 Sep 2023 10:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693674927; x=1725210927;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nYs/HK+wBhM21RMMJMj9fp+WIP/Y5LH/ukDUubrXW34=;
  b=f+D1F8B2lpBuvt8IrullZUrKDSyYRfblrrTAFWCtJpnCM2VvLXvdceMo
   VMW5F4aVceXTTF7otlTZR3+5q4/JDKdUli4TaxdMSlZCuwMW4DaKz3i7P
   soVRAtaUA1HBcDRxTHXEqfrjgMwc5yAwfxSAyPQq5r75Zl33NmmA/v2+A
   aTpYL/4bI2Laiv+0Yqdx1kG3TUpalKO5w+GrV91WLKCi93gRQphzSYYUy
   D2jvsnQfGW31hzq83PdWNO++I1j0lHHPu//LAkyfr7xvjA3d53pnVtrFE
   1jQXw2u/YJOWz16/R2EmuymFZ1wSQ6bywZPLxDsXa14NdN1jmIZ32/8s5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="373778925"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="373778925"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 10:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="805801679"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="805801679"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Sep 2023 10:15:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 2 Sep 2023 10:15:26 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 2 Sep 2023 10:15:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sat, 2 Sep 2023 10:15:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sat, 2 Sep 2023 10:15:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N42+laFmJzazNyG2eIKW2yyTP/GRcSLf5izBVMCpm80YWGn6UIaXi4hQ5e4uPh29dLou7MNMUIPDPuMPLWB4Q8Pv+tdRWZd1WkKpeefrdfXTGkXQPcCORkD57oIbfxoFrPhmHdTkjygj9T0efvY8ocHVVhw55dSQieU+4TIpMW8kEdrYh0bInKEQ/Hi8/V02vhCLhfa4nQBWQCz7TIKRSjmw03bh/FQhMLSBLztMLetW17rkQrcPDlMypizijrr3B8xGfluQv/1ntr6ZLqz0+Go75ykTYvcmzLJbfebWjbxktPcHPDm1NpUd51A11/ew9i2atQDTfllvH3UGqOdZOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYs/HK+wBhM21RMMJMj9fp+WIP/Y5LH/ukDUubrXW34=;
 b=MZ4DpgCCA4raUYVSS/4+Um/BB7x/+l2+POqxokx767M57AqG2mQz74rP6yBSYz9xpsr8VVwNadaRSIYx9Aa++O7w/L/wICsYELqqnvgzTgc2kCnqgWXl0+D6bDKX48C8682ucoqVVtjA95j+5EECrP48ExehwPMT1b17wP8jXZJhUBSsC2XIp+AnWP59QXdrCB0MEi8vnmklOAIwYWWhA1/xhawLZvoQftbCg8f1jHyFEEFAjINtJziNrEH6S2quUZfpgCG+Yl+WBGwZB+O5go+TlWtp3hPYrLuHFTtn4YCNZ+mfvAWvBGXic1ET2iuyRAUs0jUwPEoEkGbsJCDRQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Sat, 2 Sep
 2023 17:15:21 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6745.028; Sat, 2 Sep 2023
 17:15:21 +0000
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
Subject: RE: [PATCH v12 0/4] Add Intel LJCA device driver
Thread-Topic: [PATCH v12 0/4] Add Intel LJCA device driver
Thread-Index: AQHZ3JZM3L/1K+kPhkqbxShD2s4CurAHoqgAgAAjxMA=
Date:   Sat, 2 Sep 2023 17:15:21 +0000
Message-ID: <DM6PR11MB4316D9C6026B6672872939DE8DEBA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1693546577-17824-1-git-send-email-wentong.wu@intel.com>
 <7fc37bb5-2121-4174-fb1d-9edf49213a6c@redhat.com>
In-Reply-To: <7fc37bb5-2121-4174-fb1d-9edf49213a6c@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|PH0PR11MB5925:EE_
x-ms-office365-filtering-correlation-id: 6aa3c09c-f772-4fd4-c181-08dbabd83017
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: umqaa79iV/R/CUhe3BLIOWrT874V8qCCqKuxKmnwonVlP3HNu7dSVlf2FU+FYjMvGhvJ/fbbFwopOXcB5mEfdDOdx6nyEWn0Ldkof7/n3Q1SRYAXj20Z/qMquoOKkYe1yJAYfbjlWXXVyTEHmfsd4gTy/5iz0kKmGjY8f0ptEGPbaY257SOoeFCZ/d/vIKUGGs8PWqonrS/IW+nLxL6CGV0G4FM4M6u2T8t84Imh5o53UMX2iCoR0XRk0Kf0DMYPlfBjNQRjdbjWG4MU8/MqMw+cJM6VJuoxgnqXuLlz59qrUw+KdrhRgQm9M8gLxy6r8YN3nPMlaYz5EVthS3Hb8jDejIpM5sqyiYT8a9B2XHNKLoPASMbYjQU7h7hekx4Kr2ZDeTfzSVHoIDpAFv1VHQZgUXMVo6vhlo/5YJbGvPYDCOn8r1E6csz76zuGoalaKe5nFx4ieaF47hTjr7dxXUaYAa5h/kNUwVQRugoP6ctfYG53wFIqulpONPTV2A9TkM5afJOzpGVncK4TCv2xYsJyoFXLl+HuMG/+LYMY3hJI5+GathIFUdqvJtHuuCGLteMcSmbveBBzbzmpq/ZSu88CbwhZ4Eb2kWA4ZbDkV1GD3Lof+VMJ6DVa2jzeUAbR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199024)(186009)(1800799009)(7696005)(6506007)(9686003)(71200400001)(55016003)(53546011)(26005)(86362001)(38100700002)(38070700005)(4326008)(52536014)(33656002)(110136005)(5660300002)(8676002)(2906002)(66946007)(64756008)(8936002)(7416002)(66556008)(66476007)(76116006)(66446008)(41300700001)(6636002)(316002)(82960400001)(921005)(478600001)(122000001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUtEdEJyN09zakhsUUFCRi9yTTYzQkswamc0Q2hhSlNPcnQ3QzJmRFlxYUlX?=
 =?utf-8?B?MVJIckd4ZDBVS1NXQlczbUZJRk9JWGkxaDhucExRSVVDNFQ0eXNPWEkrL1ln?=
 =?utf-8?B?a3dRK3RtY0FXQzZrU0o1RElRYWo4ajVsbXFIQm5BQ0Q3OTVnMCthZEdkdmsr?=
 =?utf-8?B?aFh0a0NTcGIrTkF1RmZxS1dKc3VqVDBSRDBQb1dJVzJxYXp5cEFoMDRYUkhp?=
 =?utf-8?B?K2NQdDljRGlOMEtHVUdpRzJ1U3hCejBudUErT05jN1RlTlhKMXRZSzl0eGRp?=
 =?utf-8?B?aGdaSHB6UysvR2ZyMFFpRXozV2tZemhjWFVIb1BETWxFNjJmY2h4bXF0eWZm?=
 =?utf-8?B?SzRXRkFkaDdXMkF3cUJJTFAzUzhHd2dPbjZsWW1BLzBXVkFKSDY4ZzE4K0wy?=
 =?utf-8?B?S2hjRy83VGtmSTA5aWhLYVQveFJlTjhrbmh4Zi9wT2xlMVR4R3piUnZBVllN?=
 =?utf-8?B?YmJ0clVIbDNUcGpER1VCWW5xbnV0QkNlRjZRSW1QakZRUFIzR2FWTjBxUC9U?=
 =?utf-8?B?TmdPaHB6ZkxKQytnRlA3THJHUW9rd21UQmdERFl3cEIvYktVc0hBbjhtcWVU?=
 =?utf-8?B?NUh3bm5DMXRqaXBINFJrWE9TTXJ5eUtaQVZxd1UxcmZleDh4L2lFWC9QbWtW?=
 =?utf-8?B?UTZEcFNNOFNZcEFlaGYrMmVXOVpyUUphYlVOMld2WWgxb3J1R2haWHp3YXBs?=
 =?utf-8?B?Q3JDRDVFNXRyM3RWcFozN0JLamwyVGdQaEtyTm5zN1hCUU9SWFc5bVh5b2xF?=
 =?utf-8?B?ekxDMk9DWDVqUU5tcUM3NkZ0Yzd3MVRrL01RU0ZhYWhTOUxOTVUrYzhRaG0z?=
 =?utf-8?B?cUp5RXJKU1BSTStOenRQUzZHOEhreXBCVmhDakpWRzh2M0hkU3VmSFhyYkQ0?=
 =?utf-8?B?SmpTUUIxM04zaTM5MzhMeitmQWYzS1JCZzFkR1dVOG83OVpQY0FocG4vVGZE?=
 =?utf-8?B?Z0hMWm9CeTQ1U3JpVHJubXB1eUk1NEpoM0I5a3NGcmZZQWllQUx1K2Rnd3pZ?=
 =?utf-8?B?WHBlamgyTkdiSU8yRnJLTGViTm9yNjF4Y2MvYUdja053Vk9TQWNia0JFUkpv?=
 =?utf-8?B?YjlRV0l5WkFNandFY2NYM0NtaC9wNFQyUklpUDlFT3Jodm54QUxoeWpuMjhO?=
 =?utf-8?B?SVRWdU84VFV3c2JYQ2kycm1DVzZZWlN1Ukd1SWQ1WGdZVlg5QUMrcHQ2TVd4?=
 =?utf-8?B?SnFub2k1TjlaL1E3WW42WEhOTmh4ejByMVhtVmNCMGZlUDd1a0xPckVGQzNx?=
 =?utf-8?B?UVpXYW9sOWIybGFsK1dlOVBzQ3RzcDkwcmUyVHVGbkdrQ003dHR0T0dNVzRu?=
 =?utf-8?B?elI1Q3k4aWpObzB5enQvOFhuNmhIWG80WTU0TkJDOXQ5alk3a1FFcEl6dlRD?=
 =?utf-8?B?T0laQ2dKNGI3L0hBc0xlazhRMzJqUmsramhFamFXemQ1YXk5cEsrRGM1UTh6?=
 =?utf-8?B?UkVmZWt0dS9TU1pQMzBTUFFYcHVKSklkVm5zR2xiUE1pWkdEMW9BdkI5ajhC?=
 =?utf-8?B?ajBzRUJxUjQ1WFV1cks3dEFPeXlWcTdYTGRhcWdlYjFRN3Q0TVZNSzVtNks5?=
 =?utf-8?B?SVRkeEN0WHpQYlM4T3krUStRU1NhVWFndFEvdGpJUWNLcUxXYTE2aGUrMUlw?=
 =?utf-8?B?Q0JxNnIvVWRabWRzaGg2Ukoyck1HQkw4TzE4ZTlIbWNBUnI0bWhzZmdKSmZv?=
 =?utf-8?B?YXJDN2RBYkpQYlBSdmM2VnBESDdMdVhSdUdLZmdwOXZMNXVQU3Fxc0dnN2E4?=
 =?utf-8?B?UjZrT0F0T3BwRWxGbFQrdUgwbDdzd2JISkZsOFBxUXNJSEw3ZW1wZlliZmhI?=
 =?utf-8?B?VW5UZzJXUVpQUTJFd0xHaElHMmxsNWRkcjh5MGd3aVJMU2ZiMVF4MFowRnlx?=
 =?utf-8?B?ZjdMTW5QcEpBWEFma3VJdVcxVTJ4WlZaTTFzYmUvakVBaGJWcktWUHRYMjlD?=
 =?utf-8?B?aGZLVE4zaVdtZ0NrSjBtVEFOTnBReFJ3V2V1SS8xaGVwNzBhdE1SbHdBb21W?=
 =?utf-8?B?WHV4Y1ZpUTNSTi9JdUdVZGJGZVp1NkhLek1Xb3lidHkzeTAwODFYYUsrRVRF?=
 =?utf-8?B?UkhDUlQzZGcwL2FaaEVaWFo0UTdFenRnNnlwemI5Qk8wNGFkZmZ5Mit3VW8v?=
 =?utf-8?Q?7PNwHP2VmUGuavlBHx993gcqD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa3c09c-f772-4fd4-c181-08dbabd83017
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2023 17:15:21.0869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LtBMCKzQ0Xq7Z/mnA15ZZ+2v8B9YkVbgSF8HcX4xXoswajsiL7GxnHySS4fwTUtJsfj0eTGVyjiy9MlcpAwKPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5925
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

SGkgSGFucywNCg0KVGhhbmtzDQoNCj4gRnJvbTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVk
aGF0LmNvbT4NCj4gDQo+IEhpLA0KPiANCj4gT24gOS8xLzIzIDA3OjM2LCBXZW50b25nIFd1IHdy
b3RlOg0KPiA+IEFkZCBkcml2ZXIgZm9yIEludGVsIExhIEpvbGxhIENvdmUgQWRhcHRlciAoTEpD
QSkgZGV2aWNlLiBUaGlzIGlzIGENCj4gPiBVU0ItR1BJTywgVVNCLUkyQyBhbmQgVVNCLVNQSSBk
ZXZpY2UuIFdlIGFkZCA0IGRyaXZlcnMgdG8gc3VwcG9ydCB0aGlzDQo+ID4gZGV2aWNlOiBhIFVT
QiBkcml2ZXIsIGEgR1BJTyBjaGlwIGRyaXZlciwgYSBJMkMgY29udHJvbGxlciBkcml2ZXIgYW5k
DQo+ID4gYSBTUEkgY29udHJvbGxlciBkcml2ZXIuDQo+IA0KPiBUaGFua3MuIEkndmUgYmVlbiB0
ZXN0aW5nIHRoaXMgb24gYSBMZW5vdm8gWDEgVGhpbmtQYWQgWW9nYSBnZW4gOCB3aXRoIGFuDQo+
IG92Mjc0MCBzZW5zb3IgY29ubmVjdGVkIHRvIHRoZSBMSkNBIGRldmljZS4NCg0KVGhhbmtzLCBh
bmQgSSBkb27igJl0IGhhdmUgdGhpcyBsYXB0b3AsIGNvdWxkIHlvdSBwbGVhc2Ugc2hhcmUgeW91
ciBEU0RUDQpzbyB0aGF0IEkgY2FuIHVuZGVyc3RhbmQgaXQgbW9yZT8NCg0KQW5kIEkgd2lsbCB1
cGRhdGUgdGhpcyBwYXRjaCBzZXQgYWZ0ZXIgdW5kZXJzdGFuZCB5b3VyIERTRFQgYW5kIGhhdmUg
dGhlDQpwYXRjaGVzIHRlc3RlZCBvbiBteSBzZXR1cC4NCg0KPiANCj4gSSBuZWVkZWQgMiBzbWFs
bChpc2gpIGZpeGVzIHRvIG1ha2UgZXZlcnl0aGluZyB3b3JrIHRoZXJlLg0KPiBJIGhhdmUgYXR0
YWNoZWQgdGhlIDIgZml4ZXMgaGVyZS4NCj4gDQo+IFdpdGggdGhlc2UgMiBmaXhlcyB0aGlzIHNl
cmllcyBpczoNCj4gDQo+IFRlc3RlZC1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0
LmNvbT4NCg0KVGhhbmtzIGEgbG90DQoNCkJSLA0KV2VudG9uZw0KPiANCj4gUmVnYXJkcywNCj4g
DQo+IEhhbnMNCj4gDQo+IA0KPiANCj4gDQo+IA0KPiA+IC0tLQ0KPiA+IHYxMjoNCj4gPiAgLSBz
d2l0Y2ggZGV2X2VyciB0byBkZXZfZGJnIGZvciBpMmMtbGpjYSBkcml2ZXINCj4gPiAgLSBhdm9p
ZCBlcnIgcHJpbnRpbmcgYmVjYXVzZSBvZiBjYWxsaW5nIHVzYl9raWxsX3VyYiB3aGVuIGF0dGVt
cHRzIHRvDQo+ID4gcmVzdWJtaXQgdGhlIHJ4IHVyYg0KPiA+DQo+ID4gdjExOg0KPiA+ICAtIHN3
aXRjaCBkZXZfZXJyIHRvIGRldl9kYmcgZm9yIGkyYy1samNhIGRyaXZlcg0KPiA+ICAtIHJlbW92
ZSBtZXNzYWdlIGxlbmd0aCBjaGVjayBiZWNhdXNlIG9mIGRlZmluZWQgcXVpcmsgc3RydWN0dXJl
DQo+ID4gIC0gcmVtb3ZlIEkyQ19GVU5DX1NNQlVTX0VNVUwgc3VwcG9ydA0KPiA+DQo+ID4gdjEw
Og0KPiA+ICAtIHJlbW92ZSBsamNhX2kyY19mb3JtYXRfc2xhdmVfYWRkcg0KPiA+ICAtIHJlbW92
ZSBtZW1zZXQgYmVmb3JlIHdyaXRlIHdyaXRlIHdfcGFja2V0DQo+ID4gIC0gbWFrZSBsamNhX2ky
Y19zdG9wIHZvaWQgYW5kIHByaW50IGVyciBtZXNzYWdlIGluIGNhc2UgZmFpbHVyZQ0KPiA+ICAt
IHVzZSBkZXZfZXJyX3Byb2JlIGluIGxqY2FfaTJjX3Byb2JlIGZ1bmN0aW9uDQo+ID4NCj4gPiB2
OToNCj4gPiAgLSBvdmVyaGF1bCB1c2ItbGpjYSBkcml2ZXIgdG8gbWFrZSBpdCBtb3JlIHN0cnVj
dHVyZWQgYW5kIGVhc3kNCj4gPiB1bmRlcnN0YW5kDQo+ID4gIC0gZml4IG1lbW9yeSBsZWFrIGlz
c3VlIGZvciB1c2ItbGpjYSBkcml2ZXINCj4gPiAgLSBhZGQgc3BpbmxvY2sgdG8gcHJvdGVjdCB0
eF9idWYgYW5kIGV4X2J1Zg0KPiA+ICAtIGNoYW5nZSBleHBvcnRlZCBBUElzIGZvciB1c2ItbGpj
YSBkcml2ZXINCj4gPiAgLSB1bmlmeSBwcmVmaXggZm9yIHN0cnVjdHVyZXMgYW5kIGZ1bmN0aW9u
cyBmb3IgaTJjLWxqY2EgZHJpdmVyDQo+ID4gIC0gdW5pZnkgcHJlZml4IGZvciBzdHJ1Y3R1cmVz
IGFuZCBmdW5jdGlvbnMgZm9yIHNwaS1samNhIGRyaXZlcg0KPiA+ICAtIHVuaWZ5IHByZWZpeCBm
b3Igc3RydWN0dXJlcyBhbmQgZnVuY3Rpb25zIGZvciBncGlvLWxqY2EgZHJpdmVyDQo+ID4gIC0g
dXBkYXRlIGdwaW8tbGpjYSwgaTJjLWxqY2EgYW5kIHNwaS1samNhIGRyaXZlcnMgYWNjb3JkaW5n
IHRvDQo+ID4gdXNiLWxqY2EncyBjaGFuZ2VzDQo+ID4NCj4gPiBXZW50b25nIFd1ICg0KToNCj4g
PiAgIHVzYjogQWRkIHN1cHBvcnQgZm9yIEludGVsIExKQ0EgZGV2aWNlDQo+ID4gICBpMmM6IEFk
ZCBzdXBwb3J0IGZvciBJbnRlbCBMSkNBIFVTQiBJMkMgZHJpdmVyDQo+ID4gICBzcGk6IEFkZCBz
dXBwb3J0IGZvciBJbnRlbCBMSkNBIFVTQiBTUEkgZHJpdmVyDQo+ID4gICBncGlvOiB1cGRhdGUg
SW50ZWwgTEpDQSBVU0IgR1BJTyBkcml2ZXINCj4gPg0KPiA+ICBkcml2ZXJzL2dwaW8vS2NvbmZp
ZyAgICAgICAgICB8ICAgNCArLQ0KPiA+ICBkcml2ZXJzL2dwaW8vZ3Bpby1samNhLmMgICAgICB8
IDI0NiArKysrKysrLS0tLS0tDQo+ID4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnICAgIHwg
IDExICsNCj4gPiAgZHJpdmVycy9pMmMvYnVzc2VzL01ha2VmaWxlICAgfCAgIDEgKw0KPiA+ICBk
cml2ZXJzL2kyYy9idXNzZXMvaTJjLWxqY2EuYyB8IDMyNiArKysrKysrKysrKysrKysrKw0KPiA+
ICBkcml2ZXJzL3NwaS9LY29uZmlnICAgICAgICAgICB8ICAxMSArDQo+ID4gIGRyaXZlcnMvc3Bp
L01ha2VmaWxlICAgICAgICAgIHwgICAxICsNCj4gPiAgZHJpdmVycy9zcGkvc3BpLWxqY2EuYyAg
ICAgICAgfCAyOTcgKysrKysrKysrKysrKysrDQo+ID4gIGRyaXZlcnMvdXNiL21pc2MvS2NvbmZp
ZyAgICAgIHwgIDE0ICsNCj4gPiAgZHJpdmVycy91c2IvbWlzYy9NYWtlZmlsZSAgICAgfCAgIDEg
Kw0KPiA+ICBkcml2ZXJzL3VzYi9taXNjL3VzYi1samNhLmMgICB8IDgxNw0KPiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgaW5jbHVkZS9saW51eC91c2Iv
bGpjYS5oICAgICAgfCAxMTMgKysrKysrDQo+ID4gIDEyIGZpbGVzIGNoYW5nZWQsIDE3MzcgaW5z
ZXJ0aW9ucygrKSwgMTA1IGRlbGV0aW9ucygtKSAgY3JlYXRlIG1vZGUNCj4gPiAxMDA2NDQgZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1samNhLmMgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGRyaXZl
cnMvc3BpL3NwaS1samNhLmMgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3VzYi9taXNjL3Vz
Yi1samNhLmMNCj4gPiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC91c2IvbGpjYS5o
DQo+ID4NCg==
