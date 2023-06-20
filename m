Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7067363E9
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jun 2023 09:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbjFTHA3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Jun 2023 03:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjFTHA2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Jun 2023 03:00:28 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D2EE58;
        Tue, 20 Jun 2023 00:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687244426; x=1718780426;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rrwaK1VydDNfwrpwJzW3QYp6qLRWA0mAATahNLwcLx8=;
  b=ZP42Z/8tmfeuCoe6u2VA5ugdH5jkWbfXHgs3WMzDhnHp4DFErUynFi71
   XI8i84qRXCVfiZPQV3DKwVXyHSuVtrk183RJnikhLooVOhLJhbDL5U1at
   YDIy6UzhNo5uKvUoCxdRnSPPu+JaGNyex088UBs5ve+UpOjh753mx/xF3
   oCc0YhP1TXJLTXobQHAnf0aN0m4nHI4pKmBSqYiWBBkDofn9nyPIs0y8T
   GqWSF25B64ciV13C6E6PJberfDGKyAg+svw4UTYFYJeqt+zBAhNDlK7l5
   MDkJ15syapQpJY7OaWCNyhMZd1mzQVjjXW2TzM/kzlZamQTHqHTSLj6iM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="363208097"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="363208097"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 00:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="779280338"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="779280338"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2023 00:00:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 00:00:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 00:00:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 20 Jun 2023 00:00:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 20 Jun 2023 00:00:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOGp7kifmcYPlLzAd1v3f0+nxmVDSKMVgk0nwKeqFEqovKWFmASmILftTjjx3uG+O/RqoBvoXqDx/7KUU0FnOu+rj8llXeJ6fy/3pJqFkdO4qEslWqoJZjZAPNLeDRJLXonQyIyy2W0B7CtkkKXGw4bJUPeggz75pEazGh3GV+50aZ4Zt2nL11d1Gm92DoyOoLymGoFsjD6iz00dq30/4Xj7c7TZ/MTVTBAtqurZxp/uOM54YT2WgWUIKZUB1jpiakBK0x1jLDoDU0qpaekqiEA9uD4Ah8q/hK5IlQCETX1tTn8ZLm0EPI7J4Acb878yiOdQDCE1m9RrcbBxfqi8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrwaK1VydDNfwrpwJzW3QYp6qLRWA0mAATahNLwcLx8=;
 b=oXHeVcqKSD38/ABmLsrVYp9cgj9yl9VZCvZ1UwWoAR5LhpWWKYHbDVNZ8o0xH1vPvJPdfRG4/EBJJhTncWWmNqtxvqoYFJ8ROM2OCSKDNvJVRybYuarYmfLS+D0FvxVczMTfk5NXOYnfuzCJdjRRvnPOsV8rqBe/Bpbm/33IlzFIdHgijPcUBqqL1z52tTrzPEGwaEym2yt/d5FSjdAlVLg+InzM2HXa7AOmDk4pFGwNk8h2ljFFejxaCK1ll79l5zWVEsrRs+cUQ8eHzrUIIY/BVzrPFIOFTJxhuS1MtnlGzrY44TuYHM5cRUV/oiby3NNvyzUoALvY+mCL8FKW4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by PH0PR11MB4805.namprd11.prod.outlook.com (2603:10b6:510:32::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 07:00:20 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::9358:a28d:ae08:7ab8]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::9358:a28d:ae08:7ab8%4]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 07:00:20 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        "Ye, Xiang" <xiang.ye@intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
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
Subject: RE: [PATCH v8 4/6] gpio: Add support for Intel LJCA USB GPIO driver
Thread-Topic: [PATCH v8 4/6] gpio: Add support for Intel LJCA USB GPIO driver
Thread-Index: AQHZhDKa9RYNq2qAR0ODSRj3xTs13a9VkNUAgD3wP9A=
Date:   Tue, 20 Jun 2023 07:00:19 +0000
Message-ID: <DM6PR11MB4316BEB6C6D34F38465A33DE8D5CA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <20230511175844.185070-1-xiang.ye@intel.com>
 <20230511175844.185070-5-xiang.ye@intel.com>
 <CACRpkdZvn_cX=GNO2VYC6YfJif-cXST=avT2yoMpYVq5C87bMA@mail.gmail.com>
In-Reply-To: <CACRpkdZvn_cX=GNO2VYC6YfJif-cXST=avT2yoMpYVq5C87bMA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|PH0PR11MB4805:EE_
x-ms-office365-filtering-correlation-id: 9e8c5ce0-49cd-4635-ce17-08db715c02ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kfeex+5BphjzNnWfLsVUXA7nDEbufQyqKJHlxNfofkrdfzrxn+MFD8cp0HARaK8j/B+H9JIrYxKtq1+klzeR3ClRg/Kpgc8QM9b20P1/FWu3ZT8poboEVnlbB8i3fs/gQZo2/YqXlRSg5AD3QFsN5bPgQjAw0QbPtQclj2UUnGDJk084Wyjzn4tIq9KI4R+mEF3q9sArdZtTXVvTIs7b5ZboSkCAhOvmGwpOrrE4yoMCkluPaYnDv8SjS28qKTjqwFMjD7yf3976MCTJsMeAjIIio+JUB3shIevYY2I+DAsCfAC5x6rzfnB3U+wvIod5dbpE8L10RAVgZFo8Wq5WHJZUzmMMMTC82kOAv0yDmXc6r0qgNn6cABdhU7z4nJzfd2gB24r3qHQUVa6ZOv1tf7mkItiAraDZ1LyxaxHmz2hXhLZZTlLmby1AwizWsfo79MF0PSGCqHXenzeJmUdOC/di8oMiT+XWw195xqTkC/lQilVuEyt7TXZ2b0GIpqXHzf00kED+pl0B6GghmM/vU0T6MM3QGA/huR27Dfc+L0nbP1EDMaQeiYR87VBL1aH0q4vRPRSLpNmu0uFW2AL7GIplvG2GTJ0hGVjOyb6hhSjzq3xQf9A04h0LvXYl7viq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199021)(71200400001)(7696005)(478600001)(33656002)(186003)(9686003)(6506007)(83380400001)(26005)(38100700002)(86362001)(38070700005)(122000001)(82960400001)(55016003)(8936002)(52536014)(8676002)(5660300002)(316002)(2906002)(4744005)(4326008)(76116006)(6636002)(64756008)(66446008)(66476007)(66556008)(66946007)(41300700001)(7416002)(54906003)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emtCOEVCTHRhU3BtaVYxL2p5K1NwVG9jaXhGeXJzRW95Uk9PalVwbVc0N0dh?=
 =?utf-8?B?OS9DdC9VZVZiNlZsNVlEbXE1SnU3SjRHcUlkWjhoaDlJWWdVUkw0alNkdnE5?=
 =?utf-8?B?M1pIRE92SDlSTjVVL3dnRnpJQmJxRUgrZFJvREM3WUIrWi9BejYyRmhqMGJ0?=
 =?utf-8?B?TkNEUi9XUVpYVlJ0RzNDeTdXKzBEZElFRnRwaDYwaC95eit4YnZoeGprWFpH?=
 =?utf-8?B?NVpVVjNwa1pCeEJaOVlEOThrbHFGVlVVeW1vZ3g0MmMwWk4xQmZrL3hyY254?=
 =?utf-8?B?YWJmWElhcWNDY0YzaG5RMDRUSzNYM2hZS3B2cVIxUHdvNkNrUnJQN0E1dnFl?=
 =?utf-8?B?VXNTTmJJL1pCdUdkM044Y3lOUDRSQlhSTFB0R1lsK3FXTE5qNUdqa2J1WSs3?=
 =?utf-8?B?RCtMcTB0V1pWR1NPVFIxdW5xR3pMTllXT0k5ZFlUZS9YZTRyV1ZqdjE0VVlk?=
 =?utf-8?B?bFQxZ3A4NzUrTjJCdC9lcDUySVVFTkJTamtvZ0NYWGdyWENFZWZsc0M5YjFU?=
 =?utf-8?B?N1BEOVk4UHNzWkRUSDhzRzRweVFnK3BkeithQk5RT3pOTlBCNzJzQUFlUlls?=
 =?utf-8?B?VXFYMENTeUZhcGsxVnZZQjhMZ1pzZXBmbVp6NDRZT01veENhSWI2bzdQWlBR?=
 =?utf-8?B?d28wOWVTbThpVHpWSGc0NUZYQjBSQ1NHOGtDT1RkNm1XWUJYOVp2bjRvajRG?=
 =?utf-8?B?SlBQOHBmeDJMTmNabzkwcnpVeDgwSHdoWFY2UTBPYTJDRXdicVhuZUZJZThK?=
 =?utf-8?B?c2FuTkRXN2dxLy9JWkNOak5kUFFIUmwwT0lGbFN1cTZWenJJN0Zld0ZjdFow?=
 =?utf-8?B?dnJONlFWbG1QMkNuZkdkZ0lPOXExTEs4ekptZVg3anJCVXR6N0t6c3I0WGZ5?=
 =?utf-8?B?OGJvQzFVTjNobTBYSTZuTDBURlgxbmFBN2VacTBJeEN4WUMrVkR5Tklra08r?=
 =?utf-8?B?ZGN1NWFKQitETTFJcUpsejVmRmtyaGNQUW15NlFGbmtMOHcvOXRaT09GZDEv?=
 =?utf-8?B?aExuOU1obitXcWswbFRSQ0k1MCtCQVdyTHBHRmxpelhQdEJCcU01dXZVdDln?=
 =?utf-8?B?VHdsTnpyeG1xcm5JQW40UkxEWFNqT1hHSGUxY3I3dnN1UUJhbzVjZzZxaWlF?=
 =?utf-8?B?WnNqQmR1ODh2ZmRObG9PSHdkbmlPWUZIMHUrbTRMMVdmaXgrZGJmMjI3SWM5?=
 =?utf-8?B?NzRXQUl0UEFxODNaME5EdDNiQ2VJVlQrL3hlMzJIZHJiTGVjNXF0eTRac3VG?=
 =?utf-8?B?ZksvSWpCZnBMT3oxWVFVRUkrVll4T05rcVI2WWNOYjNTTm4xcy9lOXdzNFov?=
 =?utf-8?B?cGVzWFhyb2lKNFFHd3dyTzVrTTlxOUVQYk5XS29IZTBkTGEyVlZyWExGVkoz?=
 =?utf-8?B?dExhQkVvSXNXTlhac1RrTEFkSDdoTHlNdGs5anV0MDB4VWgvb0ZuT0s2clNO?=
 =?utf-8?B?cFZHYjlydU1xQTdFUmxqbk1acURvUWtiK0luQW5sS3lhSFZSb3RpVmJJTFg1?=
 =?utf-8?B?cXBCUTlYSllHUkErVG5PcXoreEIwaGFBVGhKNWFmT1pSNjhNb2V5Mm5XcTYv?=
 =?utf-8?B?eHRGS2pISENnbjBubUMyRm1jVGFkMlJLTXZvd1NhYmVpMTRwMUtNR3NoUTh0?=
 =?utf-8?B?Sk1ONm5EalRuQlVMd3BCSDdsVXZRYzQ4TEs2UEI2NUhKQ0FqWC9HOEI3bktq?=
 =?utf-8?B?Nk95RGljckZRd254cHB0bExuc1FabkViZ3FmRkFDamM5TW0yYTRLbDdIMk9i?=
 =?utf-8?B?eWhHTG52VEVZaG1LWlVBbHNDKzR0dE13YmtNWHFqUXhyTnB4UHlidGRFZEl6?=
 =?utf-8?B?ZGRYdGpIOTZVZFo5TXVtblRLeFRoWlZHT25rbnM5QUFsUlJvNDFVSTlJakRa?=
 =?utf-8?B?QTE4dUZycGJjbW5BSzZtdUJycDJmbmU3WUEwNC9ERmN5RmE1QUo0UGpwcXBI?=
 =?utf-8?B?RWtEUURFSllDS0p5Z3h0Nm1YTmhvclp6U21qWXBHNkNHdGtraWZkaWRSS25F?=
 =?utf-8?B?RXVOTVdYazM3WnRLL1kzdEFXZFBBWVNIYm9kWmhHc1ZxdVI0Z2JHdFdxY1NP?=
 =?utf-8?B?clY5NEFzSUpseUpJdlNERDVJazdtMTl5YkNaRmFkeTFxRTZRcU9DdTJYSkZ0?=
 =?utf-8?Q?LpYIxOwzfuQUDfIu8mMYkJl/P?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8c5ce0-49cd-4635-ce17-08db715c02ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2023 07:00:19.8798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tCAqVPNpM/e+hy8tGcvCP5aksO8zJ212rN+3L1lHQO7G+ZWFSpn9HMKV0AISgyg2ZKIUbBX73GjrL8jVs7qTVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4805
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiBTZW50OiBGcmlkYXksIE1heSAxMiwgMjAyMyA1
OjA4IEFNDQo+IA0KPiA+ICtzdGF0aWMgaW50IGdwaW9fY29uZmlnKHN0cnVjdCBsamNhX2dwaW9f
ZGV2ICpsamNhX2dwaW8sIHU4IGdwaW9faWQsDQo+ID4gK3U4IGNvbmZpZykNCj4gDQo+IEFsbCBv
dGhlciBmdW5jdGlvbnMgYXJlIHByZWZpeGVkIGxqY2FfKiBleGNlcHQgdGhpcyBvbmUsIHNvIEkg
dGhpbmsgeW91IHNob3VsZCBkbw0KPiB0aGF0IG9uIHRoaXMgb25lIHRvby4NCg0KVGhhbmsgeW91
LCBMaW51cywgdGhpcyB3aWxsIGJlIGZpeGVkIGluIG5leHQgdmVyc2lvbiwgVGhhbmtzDQoNCj4g
DQo+IFdpdGggdGhhdCBmaXhlczoNCj4gUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVz
LndhbGxlaWpAbGluYXJvLm9yZz4NCj4gDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQo=
