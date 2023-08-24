Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9D2786459
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 02:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238881AbjHXAz2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 20:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238939AbjHXAy6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 20:54:58 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509DC10C7;
        Wed, 23 Aug 2023 17:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692838496; x=1724374496;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6+9KpsxG9bfof3E6gsnKaaRaGNZ9nmR+1o+FvV/BIZI=;
  b=fEFXdo6quWvi8PkPsmNIDAOjA1ryTahrCibdvCkz5H11ig47rQEhEH0+
   Uc0RRbKyUSav+xVfnFBB4bGs1MraEy540GL3d1GLI6bYPpn9uOR/o489q
   RFxq8C86n1/9So/feitS8mRJ0RTthAjXQkB8wvnVpoX9BzUVsthcy3GiX
   d/ApxNAi3tafylCSqXv2t3xF5+aogWNthmBCEVdTzFagr95TjKyVfMhji
   HB+/S9rQJLgIWCYJWZ/2lj0hof+9XHgbec7tagIgYRCHYA6iUXRJ9FUQ6
   bXo1p4H8Z9ZEgwittQbcGGOvwN85YdExDIV0U4IaBxt6lqRIZFyJ5U1TR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="438241363"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="438241363"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 17:54:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="771917156"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="771917156"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga001.jf.intel.com with ESMTP; 23 Aug 2023 17:54:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 17:54:54 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 17:54:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 17:54:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 17:54:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKoGjn3lOF2IFRDcKfbEhZc5eLzkCvzrgJm/y8k8SIwgzoazE9xxPyGa40wUBoVNGvavu/KGUyofiQNkCZ9sNFTGjyOUBCt+azPQMh6kGGWscXEyeu1vlTBrSrHiixAAUTKtOT2jKvgfZbcaCGPsjj6kL5VC/oP787rroGriu/uvG0abs4uvBP+vprxjlmRdKLDqUCUqwSOq1O3anGcK+mr4rU3RxNZoAnf4GElbDd3czkTX1cthqSrc9Q498PNiKEuk3NPNInWhP4Cca1He4u4kDIMageOv3tUUT4tLHnH4ONMItz3E+vOF0LJqelKM9nf42nt8Nk5kKAE18NOelg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+9KpsxG9bfof3E6gsnKaaRaGNZ9nmR+1o+FvV/BIZI=;
 b=VHrUr3tJF4tCNuaqTOoJsYWSuIvIs8NyxdVfGr7qLC4tHg6P3SIsBcOQjLpB6Gy4x9plhkR5rU0zXcrKnflPbkRGwzOr+d5qiQzdiWtciE7DwHzjVe5hPimouwuA7E1WO4T669xQJtOQvCoo3sSI5gcBAhQ4+ctRccsKnBT82rS0NVho9dJ//cZJ0h6kh4zhCyX/ykb+7tb8F8CgnkoSQy6FMWuLY/FNU+Ve8BjJZckWp0VbskjEcbVgowkLYXX31nIXDXg5PiCfcxyGShbLZZ6wyDexpofBmwimEVjB2arB3LJtWl61IvzhF4mQJfgTBXXo+dAYu87SVNDACN8vNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by SA1PR11MB8447.namprd11.prod.outlook.com (2603:10b6:806:3ac::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Thu, 24 Aug
 2023 00:54:52 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%6]) with mapi id 15.20.6699.025; Thu, 24 Aug 2023
 00:54:52 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Linus Walleij" <linus.walleij@linaro.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "kfting@nuvoton.com" <kfting@nuvoton.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "maz@kernel.org" <maz@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: RE: [PATCH v9 4/4] gpio: update Intel LJCA USB GPIO driver
Thread-Topic: [PATCH v9 4/4] gpio: update Intel LJCA USB GPIO driver
Thread-Index: AQHZ0JGYeq02xUBb+ESw5wMXh/fau6/uEJ8AgAAAVzCACjY+gIAAYorw
Date:   Thu, 24 Aug 2023 00:54:51 +0000
Message-ID: <DM6PR11MB43164146E1F28D2063E834C88D1DA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1692225111-19216-1-git-send-email-wentong.wu@intel.com>
 <1692225111-19216-5-git-send-email-wentong.wu@intel.com>
 <CACRpkda4Wrih_HPz6KjNf5rQ3A7jSRoPpMpQbm+ZWNv5P3WccA@mail.gmail.com>
 <DM6PR11MB43162BD4B856DF157D5F6F698D1AA@DM6PR11MB4316.namprd11.prod.outlook.com>
 <ZOZXc8Vsa/aJQMIc@kekkonen.localdomain>
In-Reply-To: <ZOZXc8Vsa/aJQMIc@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|SA1PR11MB8447:EE_
x-ms-office365-filtering-correlation-id: beb0f751-31e7-4828-9158-08dba43cb945
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /6snAHptIKD8IbnFPHXLFZNzu/leAe/cOxj8RlkPSH5skGghfXQEp1frv7zK3aPwCKcxZtSWz/kmJOUtOWOZR2uLV+3XSCjJO6AthyaruJsq2GesvHjD1OD7y+cHsKh5dQsyMgMdDYiy9eaMaSUcclz3A+InzlGb07VXuS3Gj5T/Xxbx1mhPsdi+ItkVhK4gyvjmWtemWbIrGNZiLHKYFuKyDCFvyD7Dn3HWiApQ/lLM1PKRl/ZGzibEb78wqnpzBfhsQUaTzDci5DDNDNsGHE+y4k6nAkErEe5rz7OG71ty8Nnjq7xIcHh4qJn2aJZUN+GCfKzVgXGcA6YOEIu9bvm53ADBFSmMx6acFocVSKiBIoPp1m0EYTo2M9mjP9I9YODbd51VJfAF+AZg7V8rkYrC0SXQg/H6K/nJixdfH8BhZLmlMd3eUsyttJk8r4aRO2lA52qHDNFUiBTpsqLLv47L+FPQWC3Nxi/hyB+GAp5JBtNEFqG0hlZh3oNZtBnP1LliOMBc+l8dV8rq+WhPojqGJr83Xf2uuRhpEPjuUrje8rMUAn6Bsk5wQhIUB+1zk7JIIfc6zVtE6e8sopR4f+moSoS92Igohci+BMnwT+35eYgnb8lQn8xquvyks9X2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(136003)(346002)(396003)(1800799009)(186009)(451199024)(82960400001)(478600001)(71200400001)(110136005)(6506007)(9686003)(76116006)(7696005)(2906002)(41300700001)(7416002)(8936002)(26005)(4326008)(86362001)(64756008)(66446008)(54906003)(316002)(5660300002)(53546011)(8676002)(52536014)(66946007)(33656002)(66476007)(66556008)(15650500001)(38100700002)(83380400001)(38070700005)(122000001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTMyQVl2aUdLVng0YTVESjVGNjM5MlBUODVHOCtpRTZyK2ZHbFdHVnBtS2RV?=
 =?utf-8?B?TTZrV0wwSDMrSmVrS2lwM3NTam85bG5PL1l1ZFBSVWV2dCtLSnVLaVpVQjd1?=
 =?utf-8?B?M3BQa2pCSUZZa2JDaHliZnNocXVwY2lDM0s3OWxYay9zUUtkelVZdy9VYVMw?=
 =?utf-8?B?VXZ2M1BLUFY0NHFsazliTFQwZk0wWkhuVWlEcEZSdDRhRy9MWUVFRk5sazhP?=
 =?utf-8?B?THdCOXdXeU1mU2JqMkNzaFIyVEp4N1JCRUFPZkVKVFdYbzVSQ3NYbkZabkVR?=
 =?utf-8?B?L1o0Q2o5c2ZBS1doeGFQdUFOS2ZnT3lQYk9KRnBtYUlVQjFNcElFc0MxRTBu?=
 =?utf-8?B?b3lMOXM3L2V6bEVOUkt4ZENDcXJROTVZbkM5QjNNZ2NrcFVlb1cvUUc0ZDNk?=
 =?utf-8?B?YXJDamtTWTJxblMxZ1FrYXd0SkloV2VDc3V1dzZnUlNMeEp1dnEyT2VTUm5I?=
 =?utf-8?B?dndzRDdOV1JrZG9BOTdTM1dHZm14Y3NzblhUZjl3OUNsYVgyZVp1SFl6VUJU?=
 =?utf-8?B?OGpmSlhUU2g3MFJZNC94ZFFyRk9xMFZNd2FWNFhJWGlKd2FwVUZ0ZDI4bUFH?=
 =?utf-8?B?RVpzTkZyNk5LNG1xVWhROVJ3dE4vYitoU1FMZ1c5aWowdnFZRnl0TVFvYXB3?=
 =?utf-8?B?MUtrZlRqWVRVdnRGaDVVaU1YRG5KWlJxZVNKZ1hQN0ZCbE9jYm5iQzhReitI?=
 =?utf-8?B?LzhWaUNKWE4vTzlCM2VMNWRNcTd4aGpkQnRtc2VTMDZ4Q0JmdmRRNEZRcEJP?=
 =?utf-8?B?eXZ5WjdUanRiWGJQU0RuaTROa3lsdGZRZitHdzAzTG5YTzdnTzBvWW9ra3pM?=
 =?utf-8?B?dk85SU1zWVlVODBYbzhTOEhib1h5d21wNTR2SFJ3QjUvak5TQ1RIeXBJZEQx?=
 =?utf-8?B?WjVEbGVOK2VxTVZ2amNXN0xnbXZRN3c2eEo1R1pyQWtyZXdEUXhSM2pZcWdH?=
 =?utf-8?B?aFJPUmpJakM0R0JkdmRYZDdmWktoUzIxUDZnMG1lWm01MUI4QVM0QjJzVlRR?=
 =?utf-8?B?dmtkeVZ4cFVLSHdsV3d4VnYzbmFIYnpVSWVEbjVtbmlodERBNWExS1JjNURq?=
 =?utf-8?B?aS8yQ1I5dTV5M1JzbFBzbCtPNFYwcStCT25TWS9QYTNtMUNDYmU5Sll1cC9V?=
 =?utf-8?B?cERMUzlWcFhWZmMxeS9HdmNiUU9lbEljTlZtVmE4KzJBMGxXc3d6OEdlRnBU?=
 =?utf-8?B?MXRxRVVLZnRpdkY5VnRDVmpXMGk3YVNvM3pnc1R5Q3hoeTRJOTZwV0w0NTdV?=
 =?utf-8?B?S2paSjZrRzQ5NG5aY1NWQW9IOGhnaVFjdHJmN2MydHB0N2FFOXpZNkcrK0o5?=
 =?utf-8?B?SnVSdW5meTNhdml2MGNlMFdRT1JwQnhWODBpQzB6UlJlWEZXdkpRZzBKWVhk?=
 =?utf-8?B?SGhjVUtnUldSQmdpK3N5d3VycGE0YlFITEx4SDZLMTZDVEIxMm5YSysyUzRv?=
 =?utf-8?B?d0xjMU94UDJOdngwWFRBYjlrcytZVTkva05xR0YzV1IveHZXMWZlQVI1TFNr?=
 =?utf-8?B?THYwWkx1TmlNSkswM2VWRktEWk5wY3lWYkVKckpuWk1OL2RyOW5JekFjV3VO?=
 =?utf-8?B?UTZ6RHNINllWc2l5Qy9rK1JVdFc4MXdLMWNBalhkMnYraU5zSnY5cUZUUWlZ?=
 =?utf-8?B?NmUxb202NEo2Q2NrU3Vha0lBU3NaQnJYTnVycy9JNUpGeFhEQk1sV1hRNHhD?=
 =?utf-8?B?NWRndThLbk5Ca0RiS0dtcmFkV2FBYU4zUWtYMURkM0E0cHc2Y2plc3VoeDU3?=
 =?utf-8?B?RWVNUnh3bmRmRHQ5cFdjemZxT2dxT2treDYzL0svMFZHeTJWZThuTExPdTZ1?=
 =?utf-8?B?ckl2Wk9LRnZ5WFdQVkFQaEZUb0ZwbkE2TmVEdTREN1VJaHc0OE5FUWFWRVRK?=
 =?utf-8?B?RktZMnBSQWUyTE1WM1FzSGRDbTNySG5aRnBpaE1lWnphN2xVK0JEcEN6bG1K?=
 =?utf-8?B?cG4vK1hYSytYQWpkbm5nY0RMUGorWVZDQ2FTSVVQeGR0RFRTbXhGemt2blVI?=
 =?utf-8?B?U0hVWXlDcGNvWmxBUGRJYVNpc2c1NFFzRXJPdXpFRmVvdVBGNG8wbzl0TmNm?=
 =?utf-8?B?a2EvUWYzdHYrVjJ4Nmwra3o1aHhtYXArbU1mbzQxTStzY2RkdnRWa0hJNTQv?=
 =?utf-8?Q?WbQ1Qplq8IF3kt2EL7dxrWU+g?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb0f751-31e7-4828-9158-08dba43cb945
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 00:54:51.5950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jhShS+lGnQ/WEVFsKN040GEXAQjQL//5msunVQh+qIY/n0FQLaPpM2IHrCsI7vt/JY16sU+b7AGuDMAxBsDkkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8447
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQo+IEZyb206IHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20gPHNha2FyaS5haWx1c0BsaW51
eC5pbnRlbC5jb20+DQo+IA0KPiBIaSBXZW50b25nLCBMaW51cywNCj4gDQo+IE9uIFRodSwgQXVn
IDE3LCAyMDIzIGF0IDA3OjA3OjU0QU0gKzAwMDAsIFd1LCBXZW50b25nIHdyb3RlOg0KPiA+ID4g
RnJvbTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiA+ID4NCj4g
PiA+IE9uIFRodSwgQXVnIDE3LCAyMDIzIGF0IDEyOjMy4oCvQU0gV2VudG9uZyBXdSA8d2VudG9u
Zy53dUBpbnRlbC5jb20+DQo+ID4gPiB3cm90ZToNCj4gPiA+DQo+ID4gPiA+IFRoaXMgZHJpdmVy
IGNvbW11bmljYXRlIHdpdGggTEpDQSBHUElPIG1vZHVsZSB3aXRoIHNwZWNpZmljDQo+ID4gPiA+
IHByb3RvY29sIHRocm91Z2ggaW50ZXJmYWNlcyBleHBvcnRlZCBieSBMSkNBIFVTQiBkcml2ZXIu
DQo+ID4gPiA+IFVwZGF0ZSB0aGUgZHJpdmVyIGFjY29yZGluZyB0byBMSkNBIFVTQiBkcml2ZXIn
cyBjaGFuZ2VzLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBXZW50b25nIFd1IDx3
ZW50b25nLnd1QGludGVsLmNvbT4NCj4gPiA+ID4gUmV2aWV3ZWQtYnk6IFNha2FyaSBBaWx1cyA8
c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4NCj4gPiA+DQo+ID4gPiBUaGlzIHBhdGNoIGRv
ZXMgc2V2ZXJhbCB0aGluZ3MgYXQgdGhlIHNhbWUgdGltZSwgY29uc2lkZXIgdGhlICJvbmUNCj4g
PiA+IHRlY2huaWNhbCBzdGVwIHBlciBwYXRjaCIgYXBwcm9hY2gsIGZvciBzb21lIGRlZmluaXRp
b24gb2YgYQ0KPiA+ID4gInRlY2huaWNhbCBzdGVwIi4gVGhlIHVwc2lkZSBpcyB0aGF0IGdpdCBi
aXNlY3QgZ2V0cyBiZXR0ZXIgcHJlY2lzaW9uIHdoZW4NCj4gc29tZXRoaW5nIGdvZXMgc2lkZXdp
c2UuDQo+ID4NCj4gPiBBY2ssIHRoYW5rcy4gSSB3aWxsIGZvbGxvdyB0aGlzIGdvaW5nIGZvcndh
cmQuDQo+IA0KPiBUaGUgb2xkIExKQ0EgR1BJTyBkcml2ZXIgZ290IGFkZGVkIHdpdGhvdXQgdGhl
IHJlc3Qgb2YgdGhlIExKQ0EsIGluY2x1ZGluZyB0aGUNCj4gbWFpbiBkcml2ZXIgKG5vdyAxc3Qg
cGF0Y2ggb2YgdGhpcyBzZXQpLiBJIG1pZ2h0IGhhdmUganVzdCByZXZlcnRlZCB0aGUgcGF0Y2gg
dGhhdA0KPiBhZGRlZCB0aGUgb2xkIG9uZSBhbmQgcHV0IHRoZSBuZXcgb25lIG9uIHRvcC4NCj4g
DQo+IFRoZSBvbGQgZHJpdmVyIHdhcyBuZXZlciB1c2FibGUgQUZBSVUgYW5kIHRoZXJlIGFyZSBt
YW55IGNoYW5nZXMgYXMgTGludXMNCj4gbm90ZWQuIEl0IHdvdWxkIGJlIGVhc2llciB0byByZXZp
ZXcgYXMgbmV3IGRyaXZlci4NCj4gDQo+IEkgd29uZGVyIHdoYXQgb3RoZXJzIHRoaW5rLg0KDQpB
Z3JlZSwgVGhhbmtzDQoNCkJSLA0KV2VudG9uZw0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+
IFNha2FyaSBBaWx1cw0K
