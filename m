Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73DE97927DF
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243155AbjIEQUP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353963AbjIEIxw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 04:53:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944A0BF;
        Tue,  5 Sep 2023 01:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693904028; x=1725440028;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Qy+fLHGhxoRO9WkARntRemPAL3dnpsf54Dcy0IlrbJg=;
  b=U2PA7OJlITMU5+i9EOj8SdT7RPRuHxpR+x7/70GTOzTr0pXxzK6fH0/F
   BBy4QG1xrARgNqFNiLENC9lfBtV1clPwBxKCnjGu9sSC0kMgY6tfeP5bj
   JHl9dFw6Y7H4mQ276OsPUtAeFQQHp/QBrMURcuCmNXWvYuFp2RZqYlgpQ
   61F7Xg1yM+Hof84uSohEsF9u2O+4rxGVCgZ153gzQlAwvpjA0Yrre4fbU
   OEgi18H86zRj+qxCUNhxzmiWvLkvyf+B3sGTXEzx1jD3fbobxH20UIsm3
   72Py8H2cjrBQLuvCJg/D4qAwvi6MxdRCE7CAafiAjI6LGPlsQgukEN3eg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="357053998"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="357053998"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 01:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="914755404"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="914755404"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Sep 2023 01:53:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 01:53:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 01:53:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 01:53:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gc5Xu+IcmCxkS2Qilh5lYmsbi92ubAxtuHrXtFfWGKqwZlnjKNGUJN3pq2hdbXAIPHScPLJmQidMyQ70K7UPE/c7fkHqZYTMyTO7IQxQhoHrvBr4liL6rLO7GNSaoS/kn9U8FR+UYe/o9i8ReQ1wNOLdWJk3bWBINA5LJ4J+2wTeEHHQ9kl2rcrqEZlHWijd9k9Ay35mp7vb8n1CFgX6191sW6yJTWHuJR99XXq3MCNVb58GrOhbaXjwOIDppnTva+t4QEDOUtsxbrp5gMZRJKqNMEkI5gkUFk8UhaTPSO3RqlFdZBED1DLirBlRr2MFq/b1OdPlbWealwrisyuAxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qy+fLHGhxoRO9WkARntRemPAL3dnpsf54Dcy0IlrbJg=;
 b=l+0PxplF3qQr0rI+/BG9mohAu0Dj2DiOU1pijiFG7I6UH6/uXwdSKW1Xvboak6pNrN9whiYNVaakbkmUnMlkUao46U2Mbe2lUUtnyUXNDi7l7OKhtz19oAaPve9ziArQRFM8fSLYj/buUD1ZrMOIJ0aJ/gbafysYxwtYVcsFLVRw+8XNIUdlJ+gHegchDj3yjvuvOLl4JOU2QgT/ZAg+RBT1QCfxhxkbIFscZ1kWMHYp8RFwG3/TMDHIcyVWtPqXx20Ecz1alRK0v8A97TwYBDGcUXSmSpgc23ob8I+a/vuMDyneMAr8Ud1mbd4f4XbNU7UwCFheGkG4xuJl7QxYkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DS0PR11MB7624.namprd11.prod.outlook.com (2603:10b6:8:141::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 08:53:44 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 08:53:44 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Oliver Neukum <oneukum@suse.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
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
Subject: RE: [PATCH v14 1/4] usb: Add support for Intel LJCA device
Thread-Topic: [PATCH v14 1/4] usb: Add support for Intel LJCA device
Thread-Index: AQHZ3vLqt0FUDCDFkU6MTx3mqLWspbAKeKEAgAAuthCAAAzNAIAAxW/ggABzcACAAAC/YA==
Date:   Tue, 5 Sep 2023 08:53:43 +0000
Message-ID: <DM6PR11MB4316F903C524668BA35707398DE8A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1693806261-12958-1-git-send-email-wentong.wu@intel.com>
 <1693806261-12958-2-git-send-email-wentong.wu@intel.com>
 <a8c8af1b-9399-6ca9-ea3d-b71e6ee68cad@suse.com>
 <DM6PR11MB43166D27FB15905CB02DBC5B8DE9A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <7755c3ee-9d7e-8ae5-1cf7-a5247cc4e6e5@suse.com>
 <DM6PR11MB4316C70D7C14B56ED349F01F8DE8A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <f6f8a9c4-faf1-f9da-e688-a29eb267fabc@suse.com>
In-Reply-To: <f6f8a9c4-faf1-f9da-e688-a29eb267fabc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|DS0PR11MB7624:EE_
x-ms-office365-filtering-correlation-id: db3b2075-559d-4298-f3ef-08dbaded9c16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HFrWn2sTZN1fklpKc1m16qKdMr+4a5Hz/fYpLJ5k4lOKKDedcrDYA8V+hMumQobGvxrFKCWl9fzY5tHZMTLhjbiNt4qLOJ4tztlJTCe1TWFRLkxZ7OC7PFkKMwseRJmShtLL3ZIPpq04Jd5C0tQhy8ZMRCPIx9ezUR3jBYK+F+SByrtgEooayAKyNQ3YRCc0TawVNkeDd0oxkkmMHszLj9MvKtdQZoLbRYIazCZ5Bw+I1OAZ7kHL/l7pNsLE+I4jfEhRebVritTB3gaDV+4QrE32336fcbfqNywKNJVScZzO/KLKZ3o9F1Buuna8wQhkYHKSwrhGlXWCHgD7v/LrO4cKNCEB5lOhyvd0cHkHxruIQ/b2Z2LkrstspPGj8p4hqDWa7Zor0WutWczOYNgFPcDDwwLs6wvTpi8oh9RimFFRhny13pl5bh2sR3wHneZfpNLeZHryvdGHSourBR//Si2kqci4Gbjr7jJts7GtTRddTkez8scSmv9/Fyq1IG+/rt4u+EOfRF5/kv0ExxVkZY9QNzCNEGF2r1xEzmIvmaqNdHB+FwCP2yDUy/risAmw+ck7IofzKnGMqO9CP3aXff5FERxudNVvYsEEXTrqceE/UvqHcuHS2+xkDAXdMLD0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(376002)(136003)(366004)(186009)(1800799009)(451199024)(38100700002)(5660300002)(122000001)(38070700005)(478600001)(71200400001)(82960400001)(316002)(6916009)(76116006)(64756008)(54906003)(66476007)(66556008)(66446008)(66946007)(55016003)(41300700001)(52536014)(4326008)(8936002)(8676002)(83380400001)(2906002)(26005)(33656002)(86362001)(7416002)(53546011)(9686003)(7696005)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWg4c1VVSk5EQkdLQUJxWk92WDArSVQrM2pYZXY4NEg0b2FnQUoxUVoyZCtp?=
 =?utf-8?B?cFVVYm9ab0NwVnZiWUtkS203MXdrVlNDd284ZFo3SkR2VkpMOWxTN2xXc3ZG?=
 =?utf-8?B?Y3EyWHlxT0xJOFZFWnFDRWFOOVlmWlJIbG1sNEE0bnRwYjRCUjU3QmhnN1Y2?=
 =?utf-8?B?U0hXQjBVWmNGQWlSNHIzZHpZdUc4NVh3ckdXeWNUN2NOWHFpVittYzA1bFlj?=
 =?utf-8?B?eUJhamZ6QytSYjFVdTVYaTM5SXpvZ0E0Sm1kamJwWmZBbjgva0FBS0U5bUJP?=
 =?utf-8?B?SnB0MDZQVGNBeWR6Qi9xMVN2TmxQeUNLWjgvVTVzZWdDM1JyMVhWWUxZejdK?=
 =?utf-8?B?WEw4aEhKaWE0a2I0WDBYZ25kN2o0eERsdWZCQVZIU2V3Nno4K2liWHhmcTd2?=
 =?utf-8?B?a2hZN0FkSkQ4V2FKd1hINExTVnJTYXFpajJOR05mMmE0MVpDZkZPUjZjaGpt?=
 =?utf-8?B?d2dDMkpNa0ZCMWFBMnQxUmJyaGRpbGZxQmlrSjhYUllxdXEwdEhDREc0d3VH?=
 =?utf-8?B?TnlwUkM4Ylh2V3EzNmJyVXMrV1lPT1dETUx0VnA4dmpDNXZ5MUlXLytiZW9W?=
 =?utf-8?B?dnM1WmZPSXJTSWRxVHFUNU1tbnJSellZN1k4TVRKUXZLM3pCK0RRdlU4ZzNQ?=
 =?utf-8?B?RzBZdlhyNlVPeXRNcG5ybXRVRHRVbGtnV2tQVm11M1hNNmFta2JpSFZSQ2JE?=
 =?utf-8?B?b2M5U3U4dzd5Tk1vVStTYnd1bW5ndm1xaEw2bHhzbXJ5aDVxSVhPMEpYekxK?=
 =?utf-8?B?STlHTld1VU0vWm1mV1ltVlVEcTlVV1d6WVRncTB6ajM0TEtCR3lITFk2c3RX?=
 =?utf-8?B?OTEzSzZSS3o3R2NUNUh1cStxbVN1enhuQ2pEcnNKSDJXaGg4dDNaaVVVYlN0?=
 =?utf-8?B?WFllUXlBcmxsNVNHSW4yMXhGSVZOQ0MrOENFdGgwaitWRzIxYlYrYU5seHFn?=
 =?utf-8?B?ZEJBZTRBVmhPUDhGU2l0ZkhPVnpvRnpvY3JXMm5GaTRnNWJvNnhLeEVmQUdz?=
 =?utf-8?B?YkMwUHQzSGx6QlRZMGg2cUVUVGxlMnpaSVRMTEprUEVkQ2VRLy92ZWpXZzRu?=
 =?utf-8?B?K0c0ZjM1dXNwQ3lhTDljRVFadXRDWlhNRE9NeG1yYWIxQ0pZcDZ2QXRzc0tJ?=
 =?utf-8?B?bTU3QXJjRXprZVlFRnlvVFNxd0ErSGxXUnNuQTB6c3FqaEpqUVJGM1M5Zzd1?=
 =?utf-8?B?aURSMVpOYWg3WjZ0anR5STExODJ3T2ZxTXd0L3dCTVU4YS9yeHRBcUpxVURJ?=
 =?utf-8?B?ayt2VXhobllyRGNrWm5PQ0VDdVFrdnBaUVFIVlZhNitXNHV2WWlueVZZZUFp?=
 =?utf-8?B?SmlYSHNKQzZGc1EwVHVsYi9LSkRTKzZBRzJpeHAvQU1scGFIQXdaR0FOS3NI?=
 =?utf-8?B?OUZxVWhKOWtCUStlbUFCVmgxODNXNXFUYk1RR000dHc3TTRuL1dMWnJCN0ll?=
 =?utf-8?B?TVc5WGZlOFVpOVdkUXpKTWd5dE41L2ZsUENSZkFMYldlb2o3RFBMNVR5VUJh?=
 =?utf-8?B?QWNQSkpmWW9Ma2h6M1VLSnY4WHZxMWpjekI3ZmlKa2dRS3ZkZUpLaEVyMFND?=
 =?utf-8?B?SWNHenRPa1JaWkVUWDBNL1BZNEsreTIrTkcrcU1BVURVeUFWZFlxanR5UFVD?=
 =?utf-8?B?eVUvWVY4cTljcVIxZUtUTWx5NW16dlJYMDFVSXYwU2tGWU5BRlNPaXJHVkt3?=
 =?utf-8?B?NU85Ukt1bGxGT3JPeGQ1U2ZYYjNFcjIyd1FuSDI1R1N0NmN3QmxOaExVOGFB?=
 =?utf-8?B?QkZsZXdKbVZOL1M1SXpXSGhJNXl3TXhqQ1pydHFtQnJnMWVKOWlCWUlhb1Fk?=
 =?utf-8?B?Y05xSlRMZnBZQzIrM1NQdEdpQVVtTUVJck9RMmYrd2xaTTNmYythek5xT29x?=
 =?utf-8?B?cjJ2Z21ycXc2VFdHbmlVR2YzR0w5Ymk3WExuMlNBaGxoTGdSN09VcTFJQkRC?=
 =?utf-8?B?SDVHK0hoSXV1Q1JyMHVXODh5dnU2U3ZOcWVrdnREcTk2YmtOM2lkMHFCQ0Vu?=
 =?utf-8?B?UFQzTGxFTHFaSnRWRWJESFM4WFhnTzlhR0JpRUlnbFRaWXNXcGxXbzgwK29x?=
 =?utf-8?B?MU44UG1zNU9UekZIa3BONGl0c3loeE9ZTU1NcmM0ZVR5ZWJZcE1YZEpVSjhC?=
 =?utf-8?Q?IfSng3PabPU/QV5OYAfJgHnSX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db3b2075-559d-4298-f3ef-08dbaded9c16
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2023 08:53:44.0465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nMt+XAG61/U8E/aHAb8TIjIZRccOweClpMhS2V6qR9z1BYc2L5gisyL1Brq0i5oalNlLDAjop5vn6bvQFylMoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7624
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPg0KPiANCj4gT24gMDUuMDku
MjMgMDQ6MjAsIFd1LCBXZW50b25nIHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiA+PiBUaGF0IGlz
IHRoYXQgeW91IHdpbGwgaGFuZyBhcmJpdHJhcmlseSBsb25nIGluIGRpc2Nvbm5lY3Q/DQo+ID4g
VGhpcyByb3V0aW5lIGlzbid0IGNhbGxlZCBpbiBhbiBpbnRlcnJ1cHQgY29udGV4dCwgYW5kIGl0
IGFsbG93cyBzbGVlcA0KPiA+IG9yIHdhaXQgc29tZXRoaW5nIGJlZm9yZSB0aGUgcmVhbCBzaHV0
ZG93biBsaWtlIG1hbnkgZHJpdmVycycgcmVtb3ZlKCkNCj4gPiBvcg0KPiA+IGRpc2Nvbm5lY3Qo
KSBkby4NCj4gDQo+IEl0IGlzLCBob3dldmVyLCBpbiB0aGUgY29udGV4dCBvZiBhIGtlcm5lbCB0
aHJlYWQuIFdlIGNhbiB3YWl0LCBidXQgbm90IGZvcg0KPiBhcmJpdHJhcnkgcGVyaW9kcy4NCg0K
QUZBSUssIHRoaXMgaXMgdmVyeSBjb21tb24uDQoNCj4gDQo+ID4gSWYgd2Ugd2FudCB0byBzcGVl
ZCB1cCB0aGUgZGlzY29ubmVjdCgpLCBiZWxvdyBjaGFuZ2VzIGlzIHRvIGNvbXBsZXRlDQo+ID4g
dGhlIGNtZF9jb21wbGV0aW9uIGlmIHVzYl9raWxsX3VyYigpIGhhcyBiZWVuIGNhbGxlZCwgYnV0
IHRoZXJlIGlzDQo+ID4gc3RpbGwgcG9zc2liaWxpdHkgbGpjYSBjbGllbnQgaW5pdCBvbmUgbW9y
ZSB0cmFuc2ZlciBiZWZvcmUNCj4gPiBhdXhpbGlhcnlfZGV2aWNlX2RlbGV0ZSgpDQo+ID4NCj4g
PiBAQCAtMjA2LDcgKzIwNiwxMSBAQCBzdGF0aWMgdm9pZCBsamNhX3JlY3Yoc3RydWN0IHVyYiAq
dXJiKQ0KPiA+DQo+ID4gICAgICAgICAgaWYgKHVyYi0+c3RhdHVzKSB7DQo+ID4gICAgICAgICAg
ICAgICAgICAvKiBzeW5jL2FzeW5jIHVubGluayBmYXVsdHMgYXJlbid0IGVycm9ycyAqLw0KPiA+
IC0gICAgICAgICAgICAgICBpZiAodXJiLT5zdGF0dXMgPT0gLUVOT0VOVCB8fCB1cmItPnN0YXR1
cyA9PSAtRUNPTk5SRVNFVCB8fA0KPiA+ICsgICAgICAgICAgICAgICBpZiAodXJiLT5zdGF0dXMg
PT0gLUVOT0VOVCkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBsZXRlKCZhZGFw
LT5jbWRfY29tcGxldGlvbik7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOw0K
PiANCj4gSSdkIHNheSB5b3UnZCBicmVhayBzdXNwZW5kKCkgYnkgc3VjaCBhIGNoYW5nZS4NCj4g
WW91IGNhbm5vdCBjb21wbGV0ZSBpbiB0aGUgaW50ZXJydXB0IGhhbmRsZXIsIHVubGVzcyB5b3Ug
Y2FuIGRldGVybWluZSB3aHkgdGhlDQo+IFVSQiBpcyBraWxsZWQuDQoNCldpdGggYmVsb3cgc3Rh
dHVzIGZpZWxkIGluIGxqY2FfYWRhcHRlciB0byBkZXRlcm1pbmUgaWYgaXQncyBraWxsZWQgYnkg
ZGlzY29ubmVjdCgpLg0KDQpJZiB0aGlzIGlzIHByZWZlcnJlZCwgSSBjb3VsZCBjb29rIHRoZSBw
YXRjaCBmb3IgcmV2aWV3Lg0KDQpJZiB0aGlzIGlzIGZpeGVkLCBjb3VsZCB5b3UgcGxlYXNlIGhl
bHAgbWVyZ2UgdGhpcyB1c2ItbGpjYSBkcml2ZXIgc28gdGhhdCBpdCB3b24ndA0KYmxvY2sgb3Ro
ZXJzIHdoaWNoIGRlcGVuZHMgb24gdGhpcyBkcml2ZXI/DQoNCkJSLA0KV2VudG9uZw0KPiANCj4g
PiArICAgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgICAgICAgICBpZiAodXJiLT5zdGF0dXMg
PT0gLUVDT05OUkVTRVQgfHwNCj4gPiAgICAgICAgICAgICAgICAgICAgICB1cmItPnN0YXR1cyA9
PSAtRVNIVVRET1dOKQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47DQo+ID4N
Cj4gPiBwZXJoYXBzIHdlIGNvdWxkIGFkZCBvbmUgbW9yZSAnc3RhdHVzJyBmaWVsZCBpbiBsamNh
X2FkYXB0ZXIgdG8NCj4gPiByZXByZXNlbnQNCj4gPiBkaXNjb25uZWN0KCkgaGFwcGVuIG9yIG5v
dCwgYW5kIGl0IHdpbGwgYmUgY2hlY2tlZCBpbiB0aGUgYmVnaW5uaW5nIG9mDQo+ID4gbGpjYV9z
ZW5kKCkgdG8gYXZvaWQgYW55IG5ldyB0cmFuc2Zlci4NCj4gDQo+IFRoYXQgd291bGQgYmUgYSBz
b2x1dGlvbi4NCj4gDQo+IA0KPiAJUmVnYXJkcw0KPiAJCU9saXZlcg0K
