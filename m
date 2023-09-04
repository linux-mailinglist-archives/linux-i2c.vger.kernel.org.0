Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDD63791944
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 16:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245217AbjIDOAx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 10:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjIDOAx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 10:00:53 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E53EC;
        Mon,  4 Sep 2023 07:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693836050; x=1725372050;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5XtRN2PMH0weOMLaS7l2E/kBaBw0rwbXe+LKP1a8HT4=;
  b=UEsc/UDbY8cxcDXPRyClB0YyixRc3MjWh4WH35HAxZkcja39X1m/fo04
   caBI3IAcDOYYb9ud2IBN8QOwsJc/he9bDEDpRsIGg9hQh9/dJaTYpXbII
   S8cHqrBayRxet2NgkP+AVRn0CElhYUm72RTn82aQ5OpfDgSyh9/AuPxsp
   yUGygngHNNNkbrClz+/c4t5C24hfhrcOI+kraw1VaqPM8SrTnYbJkg3Ba
   9WoEU6bXl6q46I8Fdg8bnSPfUN2XnBqFdcwylRifLvhrONUgBNEXdeDxZ
   /Ee51HsOcNxEs0UL4t/hQTOtQD7PfynugPkLWB7vBL4t5rZuI67xPJkbS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="373995275"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="373995275"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 06:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="775857172"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="775857172"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Sep 2023 06:53:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 4 Sep 2023 06:53:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 4 Sep 2023 06:53:01 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 4 Sep 2023 06:52:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFAGypDfH3jL8cMK7hpXhutHmDsY2PWfjcDAjET9vcphOczWSvybrx0Orr1gMmRqxxTXB3lOJoRj7pMEBvKf5dqHfBcGQGQNqi4am0GWSpfEgGYFUKxoAhepi/OdHYHWEFpsgy1DWpwV5xcHuKbO6s3aGPD4Xblgnz/exnEWsGHl3yYnRW0Y1bz4+FVWW1FXEHIDT0krZxaHhj49/K7YBaH21aG47CyljbOJARddMpvff4XfNJJEsNGAEchQNbDCAZV0wcbDzo/xvIsNFWEi+vFoblOKjmTPUc0fan6JXg9wNJjHbk5RileAZQtkcJcRhi39iWciC7hhBWWojfp9OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XtRN2PMH0weOMLaS7l2E/kBaBw0rwbXe+LKP1a8HT4=;
 b=nvAjhR8C8yBqWnH4wB1kC3sAtrVKfg5hnTYUDOZQ9WIbUfDSamQYiEpM2zD+Go4UeckQ+WiGyJNNAnuGjhNb644k4m7yoOhk0CgWPxWrBII4O0CL0h2P/eWGgmI/5mPeUr4ETsOSzGpSz/LBo2HeVY7691FjnAi06YihQ80uSNX2e4pVr0+mBts6wZwJ1TjAt3qMiuYJIPHwJG8i0vDmHOjYKHx7VniPqyBXseKi+M7xP/+b5xsyn9N2ruiecKbNASDBLG0lCyup7v9c3FJv7c5h14jiQ/iwUTPoBNVkXJSM4tqIQYOmpLmRV8c7i54XU1rGOvCWFfyDqWoC6i28rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by PH7PR11MB8454.namprd11.prod.outlook.com (2603:10b6:510:30c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Mon, 4 Sep
 2023 13:52:48 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 13:52:48 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Oliver Neukum <oneukum@suse.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
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
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
CC:     "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: RE: [PATCH v14 1/4] usb: Add support for Intel LJCA device
Thread-Topic: [PATCH v14 1/4] usb: Add support for Intel LJCA device
Thread-Index: AQHZ3vLqt0FUDCDFkU6MTx3mqLWspbAKeKEAgAAuthA=
Date:   Mon, 4 Sep 2023 13:52:48 +0000
Message-ID: <DM6PR11MB43166D27FB15905CB02DBC5B8DE9A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1693806261-12958-1-git-send-email-wentong.wu@intel.com>
 <1693806261-12958-2-git-send-email-wentong.wu@intel.com>
 <a8c8af1b-9399-6ca9-ea3d-b71e6ee68cad@suse.com>
In-Reply-To: <a8c8af1b-9399-6ca9-ea3d-b71e6ee68cad@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|PH7PR11MB8454:EE_
x-ms-office365-filtering-correlation-id: 5357e72f-cc4b-4cab-de79-08dbad4e392f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0hwclA4rLsr7iQWt6XLYv28vEZiiT2UU6ldzCWSemOM6fv2IndTwLLEWEOASaNwab8tFhsoLCy8fgRpvLw9OoRkCmXQLkzYrYHg9CI1CPwXmBfff4zplHpC46l2oCSW6310DJEr3u1GbODqxY1PPuNeacoAVzM9isrBLYpGslFmALqIgA95SeIMQ1U/VgeTi+/LFQezH+0GbiwfpIAbCtkBrggDdbUsSsbBlhi2NV/qG3O+eQr3qPZVGo2kVkcnWDsq/K9LEE5qeJS45o7sbVLZ0LVcVVaifw1hNTFq4WjLDDN4wSK4TmUVGR5lyFM21MCcHbyPctZ5XHbs86op6MFUmSkWyCVhnxhIXFgKV3H5dzhn+eZUTixBN81AgoZUcCB9dLPifgIaxdhPVdylU3w3B+Nl66DiQ8K3b8wTMirNht0kCikxMD9u2XitOuLBpxU8EkXC2g3Df2yuviFhznPJPTxcgZC77pnc6olO4OOiSDO6QaeyazM4hZ07B/doGPCNOrYig7wVrB3U2Jevla+jHacEa0WmghVhAHGmaQyL2XVq4gm7GLGld1sjlojkVCE2u9edmpaImRGGJsuojHpLteahvSYr0hslw7AIYB+UGCoD/BXxC+7T9H7KcCbE4OKHcBJpFzEDCSK4ny0DHpA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199024)(1800799009)(186009)(921005)(478600001)(82960400001)(122000001)(83380400001)(26005)(9686003)(71200400001)(53546011)(55016003)(7696005)(6506007)(86362001)(8676002)(2906002)(4326008)(52536014)(7416002)(5660300002)(33656002)(6636002)(316002)(64756008)(38100700002)(38070700005)(66476007)(66556008)(66446008)(76116006)(66946007)(41300700001)(8936002)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkF0TlJwN3ZWeFVoUlIvKzEzNW03S0JFZCtVMWsvTml2dll1ekZrTmU5T2U2?=
 =?utf-8?B?MkdxZUVwN1VGaE5TRjE3cWxHMEloWFpZenN5MVFEZWoycmhkTTI0R1NIcDFo?=
 =?utf-8?B?L3pJYlRvL2hVMG9uYm9EWkFXVHorNno4K3pVYnRzYWV1RElnM0FxeXV2Z0xM?=
 =?utf-8?B?SUdLNEp6R3JsZ0NFTkdmQk9PaDdmMEt1aWJ0ZDhoVFZLai9Id1BIOWRGZk93?=
 =?utf-8?B?S2ppSmdWU05DcUJKdVBtVHFEd3pFY0cvSDNNZHJxT0NNMUcxRHplNkJON0ZB?=
 =?utf-8?B?M1Q2Z1IxUzE2Z01qclMrbnBGeGlQd1dBRzlGRWM4MENkUW92Ny83aFFJakN4?=
 =?utf-8?B?UHdlOSs0QTJUczBpRGcvR2FOZElzNHpsSVAvOEtsd0d5UUw0QzV6SitFd2F5?=
 =?utf-8?B?dHprUU5qK3p5Z05Ba2diYlB6UGlUYWI4SVlXdHdWckpYeklNTnBOd2wxMUxD?=
 =?utf-8?B?ZWM1ZUpqcjBOYnd6RG5ROHJ2eE02L0xVSFpvOHoycUJ6eUgzMGhxQTdYWEFh?=
 =?utf-8?B?UjRyVGNYRkJvazJJNHB3aU8rc2x5ZExVc0VlOWRSSmdkWCttcEcrRFgwaGpj?=
 =?utf-8?B?MGsvc0IwdktrT3d1S2xvbVdlMEYxV05scWF1T1J4NnExNFhrd3FTVkt3aDFB?=
 =?utf-8?B?NUQ4Z0J3aU0xNnYxdjRVMjhTYzFOVnluVEhQNXh0dzkvS2lmc05WRU5qanVl?=
 =?utf-8?B?NnpJRnQvdVBDcWVNT0RXU25oTUtCMTBzN1dGekwxcktwRnhOMUtOY1hiTDNt?=
 =?utf-8?B?OCsyNENza3ZTVE5xT0VvUkJTYXZYSExtQUFWOHZoM2EveDBaY3loNWFFaG5h?=
 =?utf-8?B?NlMvdnBIcDlxaEpwLzU3OTdiV0ZDRkRuekgxdlk5dy9LNTVzQjZUa200S3RP?=
 =?utf-8?B?S3pEQkt5ZktCdjQxRXU5eG84cmJqd1ROcHFUamtXZkY5RHdZdGF0c0hBcEFR?=
 =?utf-8?B?ejZCTXYxWjBzWWZBOWNyZGx3UitpWXErakZYa0ZldnJUMFMrRWFQRTJBZ2d3?=
 =?utf-8?B?M1dSdXMyQXVDQmVadEJpajlyWmp4byt4QkdFOUZwdFBTRXV4ZHZsYjR3QjhP?=
 =?utf-8?B?ZWYvWnF5VzV4Q2w5U3lEL1FwdlZWUGMwdjlid1BLdFZOYnFlODZ5UnpCZkM4?=
 =?utf-8?B?R1Jwcm5BYzRTUWh6eTZFeTU1RzBUK2gxTEhDRUU1cC9zZFQ0em81dW16THgy?=
 =?utf-8?B?cHgvcGc0a3MyUDZxMXRuM1ZGYVN2QVgyM3BHMHJvWHBOamR5VWtOUklabjFZ?=
 =?utf-8?B?a0FjYUNwNlNyL0c0ekRNb3FUQWRubmtYbWRQbUhyclEwS0tpL2tXeUZLZWJS?=
 =?utf-8?B?SGtnQ2IzSmI0K3AyNjFpSlFOK05xQ3o4eGR5bW1idWQxcDEva3pqczBmU0k3?=
 =?utf-8?B?NkU4T2U0aUIrNGpCcjdad2ZReWFDOFNEUCthR00zNXBsVGpiRXhSRkhRckZ4?=
 =?utf-8?B?UDRXd3lVOC83cGR5NkJKMEhPRWl1SFpXVEFaei9KdHpnWi9tWFFtVG5oaVUw?=
 =?utf-8?B?bG9DSEZkVDdTT0pzRHR3M2JvcHhzVjQrZno1YytqemJHVW5jVFJjQThqaXR0?=
 =?utf-8?B?MnNjWWRkSDN3ZEhDTDVuOXpKL3ZnZ0YwRFE4eHNTVXhzUWdFaS9EUFdwajlW?=
 =?utf-8?B?OWNqVE1CcHBUMDFBclVEMkM4RGQwcE5iZlNWYU9Gdm5sYkp5dmtoS1ZQbHlX?=
 =?utf-8?B?bU9Mb0FZWm5ndWlxL0VUWWhVN3BhM0tRdnpVclJ0cVgxR3RaTXBISEoyV0R4?=
 =?utf-8?B?ZXE1VDJZNi8xdXBnOWtLT3l4RHVKdVFKS0dGMHBIblFKVXpPaG1vYjltY2g2?=
 =?utf-8?B?T0lEcjRWc0VKaktTMTFGMmZVQUVobnN5UG1vNmVQSTFRdGZLV2tCRUpSOHRw?=
 =?utf-8?B?L3JPemEwMG1IQ2trT3FEQXVmSmlXLzBFcEx0bWF4V2xMcExaTHBIeVJWRmlZ?=
 =?utf-8?B?MmpFUHNIMjgzVTFDb1hweEREUlllK2J0WnVJelBHeFZOZGhWWEZLR2dKVzg1?=
 =?utf-8?B?U0Q0SlpvQTZjZjV1UmIzSUJNWFNPcU5tVGV6ZGpYQi9zMWZSMWdTS3RoZ1lq?=
 =?utf-8?B?R2ZUMW5Nc3FKdVZmdnNGU2pCUldlSldHWklZNW1sYWZpRFR5S1p1d3Q3UUZU?=
 =?utf-8?Q?CC2lfVJm2VaRpkDMK7N4Ni4cx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5357e72f-cc4b-4cab-de79-08dbad4e392f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 13:52:48.1240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xB8uPsvjACeV0UJjWZD+HD8TUAC3vAnL6dqjmbyDtX6tunX0nUnk5pyRpHSb7WmQU03E7o/s8X39ivkgmu2LgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8454
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

PiBGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPg0KPiANCj4gT24gMDQuMDku
MjMgMDc6NDQsIFdlbnRvbmcgV3Ugd3JvdGU6DQo+IA0KPiA+ICtzdGF0aWMgaW50IGxqY2Ffc2Vu
ZChzdHJ1Y3QgbGpjYV9hZGFwdGVyICphZGFwLCB1OCB0eXBlLCB1OCBjbWQsDQo+ID4gKwkJICAg
ICBjb25zdCB2b2lkICpvYnVmLCB1bnNpZ25lZCBpbnQgb2J1Zl9sZW4sIHZvaWQgKmlidWYsDQo+
ID4gKwkJICAgICB1bnNpZ25lZCBpbnQgaWJ1Zl9sZW4sIGJvb2wgYWNrLCB1bnNpZ25lZCBsb25n
IHRpbWVvdXQpIHsNCj4gPiArCXVuc2lnbmVkIGludCBtc2dfbGVuID0gc2l6ZW9mKHN0cnVjdCBs
amNhX21zZykgKyBvYnVmX2xlbjsNCj4gPiArCXN0cnVjdCBsamNhX21zZyAqaGVhZGVyID0gYWRh
cC0+dHhfYnVmOw0KPiA+ICsJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gPiArCXVuc2lnbmVkIGlu
dCBhY3R1YWw7DQo+ID4gKwlpbnQgcmV0ID0gMDsNCj4gPiArDQo+ID4gKwlpZiAobXNnX2xlbiA+
IGFkYXAtPnR4X2J1Zl9sZW4pDQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsJ
bXV0ZXhfbG9jaygmYWRhcC0+bXV0ZXgpOw0KPiA+ICsNCj4gPiArCXNwaW5fbG9ja19pcnFzYXZl
KCZhZGFwLT5sb2NrLCBmbGFncyk7DQo+ID4gKw0KPiA+ICsJaGVhZGVyLT50eXBlID0gdHlwZTsN
Cj4gPiArCWhlYWRlci0+Y21kID0gY21kOw0KPiA+ICsJaGVhZGVyLT5sZW4gPSBvYnVmX2xlbjsN
Cj4gPiArCWlmIChvYnVmKQ0KPiA+ICsJCW1lbWNweShoZWFkZXItPmRhdGEsIG9idWYsIG9idWZf
bGVuKTsNCj4gPiArDQo+ID4gKwloZWFkZXItPmZsYWdzID0gTEpDQV9DTVBMX0ZMQUcgfCAoYWNr
ID8gTEpDQV9BQ0tfRkxBRyA6IDApOw0KPiA+ICsNCj4gPiArCWFkYXAtPmV4X2J1ZiA9IGlidWY7
DQo+ID4gKwlhZGFwLT5leF9idWZfbGVuID0gaWJ1Zl9sZW47DQo+ID4gKwlhZGFwLT5hY3R1YWxf
bGVuZ3RoID0gMDsNCj4gPiArDQo+ID4gKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGFwLT5s
b2NrLCBmbGFncyk7DQo+ID4gKw0KPiA+ICsJcmVpbml0X2NvbXBsZXRpb24oJmFkYXAtPmNtZF9j
b21wbGV0aW9uKTsNCj4gPiArDQo+ID4gKwl1c2JfYXV0b3BtX2dldF9pbnRlcmZhY2UoYWRhcC0+
aW50Zik7DQo+ID4gKw0KPiA+ICsJcmV0ID0gdXNiX2J1bGtfbXNnKGFkYXAtPnVzYl9kZXYsIGFk
YXAtPnR4X3BpcGUsIGhlYWRlciwNCj4gPiArCQkJICAgbXNnX2xlbiwgJmFjdHVhbCwgTEpDQV9X
UklURV9USU1FT1VUX01TKTsNCj4gPiArCWlmICghcmV0ICYmIGFjaykgew0KPiA+ICsJCXJldCA9
IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmYWRhcC0+Y21kX2NvbXBsZXRpb24sDQo+ID4g
KwkJCQkJCSAgdGltZW91dCk7DQo+IA0KPiBMZXQncyBzdXBwb3NlIHdlIGFyZSBoZXJlLCB3aGVu
IGEgZGV2aWNlIGlzIHVucGx1Z2dlZC4NCj4gdGltZW91dCBpcyBhcmJpdHJhcnkgYXMgaXQgaXMg
cGFzc2VkIGRvd24gdG8gdXMuDQo+IA0KPiA+ICsJCWlmIChyZXQgPCAwKSB7DQo+ID4gKwkJCWdv
dG8gb3V0Ow0KPiA+ICsJCX0gaWYgKCFyZXQpIHsNCj4gPiArCQkJcmV0ID0gLUVUSU1FRE9VVDsN
Cj4gPiArCQkJZ290byBvdXQ7DQo+ID4gKwkJfQ0KPiA+ICsJfQ0KPiA+ICsJcmV0ID0gYWRhcC0+
YWN0dWFsX2xlbmd0aDsNCj4gPiArDQo+ID4gK291dDoNCj4gPiArCXNwaW5fbG9ja19pcnFzYXZl
KCZhZGFwLT5sb2NrLCBmbGFncyk7DQo+ID4gKwlhZGFwLT5leF9idWYgPSBOVUxMOw0KPiA+ICsJ
YWRhcC0+ZXhfYnVmX2xlbiA9IDA7DQo+ID4gKw0KPiA+ICsJbWVtc2V0KGhlYWRlciwgMCwgc2l6
ZW9mKCpoZWFkZXIpKTsNCj4gPiArCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkYXAtPmxvY2ss
IGZsYWdzKTsNCj4gPiArDQo+ID4gKwl1c2JfYXV0b3BtX3B1dF9pbnRlcmZhY2UoYWRhcC0+aW50
Zik7DQo+ID4gKw0KPiA+ICsJbXV0ZXhfdW5sb2NrKCZhZGFwLT5tdXRleCk7DQo+ID4gKw0KPiA+
ICsJcmV0dXJuIHJldDsNCj4gPiArfQ0KPiA+ICsNCj4gDQo+IFsuLl0NCj4gDQo+ID4gK3N0YXRp
YyB2b2lkIGxqY2FfZGlzY29ubmVjdChzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZXJmYWNlKSB7
DQo+ID4gKwlzdHJ1Y3QgbGpjYV9hZGFwdGVyICphZGFwID0gdXNiX2dldF9pbnRmZGF0YShpbnRl
cmZhY2UpOw0KPiA+ICsJc3RydWN0IGxqY2FfY2xpZW50ICpjbGllbnQsICpuZXh0Ow0KPiA+ICsN
Cj4gPiArCXVzYl9raWxsX3VyYihhZGFwLT5yeF91cmIpOw0KPiA+ICsNCj4gPiArCWxpc3RfZm9y
X2VhY2hfZW50cnlfc2FmZShjbGllbnQsIG5leHQsICZhZGFwLT5jbGllbnRfbGlzdCwgbGluaykg
ew0KPiA+ICsJCWF1eGlsaWFyeV9kZXZpY2VfZGVsZXRlKCZjbGllbnQtPmF1eGRldik7DQo+ID4g
KwkJYXV4aWxpYXJ5X2RldmljZV91bmluaXQoJmNsaWVudC0+YXV4ZGV2KTsNCj4gPiArDQo+ID4g
KwkJbGlzdF9kZWxfaW5pdCgmY2xpZW50LT5saW5rKTsNCj4gPiArCQlrZnJlZShjbGllbnQpOw0K
PiA+ICsJfQ0KPiA+ICsNCj4gPiArCXVzYl9mcmVlX3VyYihhZGFwLT5yeF91cmIpOw0KPiA+ICsN
Cj4gPiArCXVzYl9wdXRfaW50ZihhZGFwLT5pbnRmKTsNCj4gPiArDQo+ID4gKwltdXRleF9kZXN0
cm95KCZhZGFwLT5tdXRleCk7DQo+ID4gK30NCj4gDQo+IEFuZCB3ZSBleGVjdXRlIHRoaXMuIHJ4
X3VyYiBpcyBraWxsZWQgYW5kIGRvZXMgbm90aGluZy4NCj4gSSBzZWUgbm90aGluZyB0aGF0IHRl
cm1pbmF0ZXMgdGhlIHdhaXRpbmcgaWYgeW91IGhpdCB0aGUgd3Jvbmcgd2luZG93Lg0KDQpJIHRo
aW5rIHRoZSBhdXhpbGlhcnlfZGV2aWNlX2RlbGV0ZSB3aWxsIHRyaWdnZXIgdGhlIHJlbW92ZSBm
dW5jdGlvbiBvZiBsamNhDQpjbGllbnQgaW4gaGlzIG93biBzdWIgc3lzdGVtLCBhbmQgdGhlIGRl
bGV0ZSgpIG9yIHJlbW92ZSgpIG9mIGV2ZXJ5IHN1YnN5c3RlbQ0Kd2lsbCBub3QgcmV0dXJuIHVu
dGlsIHRoZSBvbmdvaW5nIHRyYW5zZmVyKHByb2JhYmx5IGJsb2NrZWQgYnkgYWJvdmUNCmNtZF9j
b21wbGV0aW9uKSBjb21wbGV0ZS4gQW5kIHRoYXQgYWxzbyBtYWtlcyBzdXJlIG5vIG1vcmUgdHJh
bnNmZXJzDQpjb21lcyB0byB0aGVyZS4NCg0KQlIsDQpXZW50b25nDQo+IEl0IHNlZW1zIGxpa2Ug
dGhpcyBuZWVkcyB0byBjb21wbGV0ZSB0aGUgd2FpdGluZy4NCj4gDQo+IAlSZWdhcmRzDQo+IAkJ
T2xpdmVyDQo=
