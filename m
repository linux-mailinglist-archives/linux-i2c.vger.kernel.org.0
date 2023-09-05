Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A33B279273D
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237790AbjIEQTk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245655AbjIECUo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 22:20:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA944CC6;
        Mon,  4 Sep 2023 19:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693880440; x=1725416440;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UFnnd2LyAWkUZOK6m/0j2Tjb5dN30oo9AuXNefX9L9Q=;
  b=NKYebeHg0MT2GmtfpTsRJmUljpmVXgocSGQvZpAT5wk7GLG4eQ4KDx5e
   R4noFNEQH7JQ3H1ZMxg521Sc4dujsqTYFbpTn6nU8k/SGIz8PMp7bGJ/E
   V3X1amXiy+aLPUbN0sTsPNjAne1MENrBinTwRiEpTqmvQPq0Pil1HlTbh
   IFx1Fsqo77dnj/QvghUORsCHLTPBdaOI7j+rBdAlJJDk25ihSa19kcAXg
   IulXbVVwyWK4zVD5OGpQwDWQmENYOJ0XD30EeRaookih7JXeGpq0hTG1q
   A7EyxYnhyvIWM9kTbJIbqQQcA7S9b8b0tuSScP+4Hdy3AWGmhSfpJgLGw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="463053701"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="463053701"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 19:20:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="987649751"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="987649751"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Sep 2023 19:20:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 4 Sep 2023 19:20:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 4 Sep 2023 19:20:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 4 Sep 2023 19:20:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 4 Sep 2023 19:20:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvJxS3Rp59rUl+zQ8TT18Ozqrzf4mxKSyJcIICnQB+EHR519AALjmQkDvaI+sBv6iMJ3Q6IAduVXnOSv46dlW4U27Fs4xIR5PB3KncNet1d8oERpqrjHGMcdOWHpG0xhZ3mb7j26112E6oSNbw/g9wq7aTAjcTVwTiAYhYsMw3jkHLaZtOipsrfM4RqXSSud2AYu+xTXOU+ZoDn7nztInqC+5wvXr/AWaLm3/az4ehDM+bhy46LYO3lfTLTbt4P9/QE7+tZD+NgrMmtOnX4d9oA1ZbA0L0PYb/zyfSpifId04Uix8aJDoHbjVu/nskXEwhQDpxHRxdaobgLiy//JUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFnnd2LyAWkUZOK6m/0j2Tjb5dN30oo9AuXNefX9L9Q=;
 b=ZEvaSc9scfTZd8q20YcG0iZJBprh8GoHZg7SZDQFY2Thuu4oQQ0YBY7amYgTQCmOz9cyTaO3FLC6pVsbZbjhcTa0bRl/2LpXo/55184W2MMMsiOVW8INiQ23BGGhmqg5ZQ50WjnAf3AsSypi7Z9tm1/GVhnvFvMJUOMEHfzVaakYrpti5j2FdB//fjNaSgK4Cv42d+YKPjbf+kByjJRKJwtiRBtNW+t4XbwwlSdOaGsFX8EXsAJuDzgluwkTKA95yVCbDajgYwvMcPbwn1xzMSJR+UjffAPxBWr8mWqzJQk0xJUQJDvF3na9ubLVlaU5JCUIlLix6WlG7mADaj6Slw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Tue, 5 Sep
 2023 02:20:37 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 02:20:37 +0000
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
Thread-Index: AQHZ3vLqt0FUDCDFkU6MTx3mqLWspbAKeKEAgAAuthCAAAzNAIAAxW/g
Date:   Tue, 5 Sep 2023 02:20:37 +0000
Message-ID: <DM6PR11MB4316C70D7C14B56ED349F01F8DE8A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1693806261-12958-1-git-send-email-wentong.wu@intel.com>
 <1693806261-12958-2-git-send-email-wentong.wu@intel.com>
 <a8c8af1b-9399-6ca9-ea3d-b71e6ee68cad@suse.com>
 <DM6PR11MB43166D27FB15905CB02DBC5B8DE9A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <7755c3ee-9d7e-8ae5-1cf7-a5247cc4e6e5@suse.com>
In-Reply-To: <7755c3ee-9d7e-8ae5-1cf7-a5247cc4e6e5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|CY8PR11MB7922:EE_
x-ms-office365-filtering-correlation-id: 4aacbb67-5e78-4eff-7160-08dbadb6b16f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ehG7kfKo2vnT6Wuitfl6Sm+7vVYr9aJmkh27l7+kdUaSftBLJz3kWelzMD+oNOAIr4JELBEAhIncL4YWUajQZlgdyA0vH0uFLfliF/srZy3gr2m4DNaFs9Ao5KRZSzjc+UzzIOpT1/0RZAd9TN3IBlqtLW14bs+xHWIfThSsXt7pxd5YLKfQn5sX2uVzbK07uaOzwqaJS1Y7VCScjgvlUcvEWuuIBq3j2/1cy7zo/BJG/EmHJ8NfxAB5VbzU1ydPHbEbOihH/wSLE5fpK6qfL7ahDWYyy1uEU9KR80HW4F7RZdUiJErawWEckQEd1Ujfc39C8aUQIU/i0Gt+t9Mu+JHPfcjbkAe9bJd+fYcZZJED4VMWvOui/GKl51sy1Eb6cw7Tb+AqmaEMCbTD1Y5qgD5quRqLx73YbxRBKgaaRKmctZQtoDcgwfbsme0KMXypXfznSP+oFfAQ16PxQzHsJ3zvUA4+9yT5AJOTJNzA/tnP+sGDvB9JSAd5D6DYGXVE1fzxrcqs7D/ZjC87XExJBeGh21Mv3hE0znGPsFeppf92ATruquEXhqGf7Qy2x0GLLp2K1/3TR4nWZE9Qltta2ChDgOZJGc6RZmRjinNqcaSWCa71EPREWcPOXweJ9UL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199024)(1800799009)(186009)(8676002)(8936002)(5660300002)(316002)(6916009)(66476007)(66446008)(2906002)(64756008)(54906003)(66946007)(76116006)(4326008)(66556008)(52536014)(7416002)(41300700001)(6506007)(7696005)(53546011)(55016003)(26005)(9686003)(38070700005)(122000001)(82960400001)(71200400001)(478600001)(38100700002)(83380400001)(86362001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZzJtQ1NvWitPVFU5M1hudzFmM2RJZE5XMnVqMEdiYTFHRlFPSTlzZExjcCtZ?=
 =?utf-8?B?eUp1OHNyZUVRZTRhVmlRcndId2hPRTlFUmpBTHo0VVArNE9GY3JwWWl1Rlgw?=
 =?utf-8?B?U0pNNXhGWDZhRmprZnRLam55Sk5DTmF6VEQyWUVwNWhmZVRjMFoyWk5rdmtn?=
 =?utf-8?B?V29vNS9raEVrOVhqc3Nsa283OHVoVC96WHJleTNZRUJXZEdSZG1uUElzd1gr?=
 =?utf-8?B?VUFlbllUR21XakQ3MW9DZ2IrbWRRVHBZaWdMOWhlODJlNEtGQ1FEa09mNGVu?=
 =?utf-8?B?V1FrSHgxSW1RNzRzODYva04xZDBMblhHZEcxcmF2bFd6aVMxN3hqT1JlMito?=
 =?utf-8?B?NUJsZWN5RWNQVW1LR001cldiUWRyWGlZeGRTR05ZVXFOL25FTlZadFlDRWFl?=
 =?utf-8?B?Rm5wa2hwaUVqRDZ4MktmSEFyTTBQT1A2YUlVQXdGU1FEVzBwd1hZN3p0VTZn?=
 =?utf-8?B?SHowRDlKb0g2U2xHbjh4Y2duRGliQWIySEFHYWlqTGQ3NUhUQTBSYkFZMnlK?=
 =?utf-8?B?dEhHVkxCakVKTUhjeCs0T2JCNHRGdmgxZ0Erb05YUkpockNsS0ZEOVh5QWQ4?=
 =?utf-8?B?MmdVWU9Cd05DM2trM0hYbGtpVVJvdmNpemNPZlpQeUZPQnFuUTQvMncrQTlK?=
 =?utf-8?B?YWd1VE9KaDNoeEU0d1QyKzVCYlVsUlQ0djd4MWpFYTQ1Q3VxQTM3d1g5M0VI?=
 =?utf-8?B?a3oyTm1vc25JK1lML3dZZForK2ZLZ1BkWjB2S2Nua1FWV0NCSStpRGFESC91?=
 =?utf-8?B?WEFBMHVOUXlXd0VMSmRWTlR1VDJEUnNKTUlWQnAxdHFNSXNPYU1OSDVTVTNl?=
 =?utf-8?B?SGpQTWNUYjFqS25MMCtGdm5aRHEvcldXV2N0SGV1bExZUm9uSkU5eU5tT3dW?=
 =?utf-8?B?Z01CZ2lRTGZCcDl1SS9VekhmYWFtc1JNTGt6WUROYVhaazlQRFg2VHhnYUNv?=
 =?utf-8?B?SVRuSEhQYk13SGtIcDlySFhFUTRGd3c2YUVaNWVHZDNWL29Ob0hDalJNL0FB?=
 =?utf-8?B?MVEwdDVNRlB1R2kxUFp4aFViSjRyVUNVQWx4bEtSbnlhQ0xsSE82U25zcEhC?=
 =?utf-8?B?N1Rmd3NqMDlielFQTmVhNThpSnNnOFFGU1NtcTJuQ0dTNGJ4RVdBWG1UTlhW?=
 =?utf-8?B?K1dMbHZGOUVCckJCL3BOd0p2NGFnS3BjanRkc2xoaXNIWndUYW5Tb1ZrMGZx?=
 =?utf-8?B?UEsxdjlUdk1JKy9xbjN4UHZGbnpKeDBOaTNNbjNQbUUwYlBVRHVMaVp6MDV0?=
 =?utf-8?B?akhtYy80bERYTVc4K1hOTFBDWWtrTlA2d1ZPUkxLZUUrZkR3ak1udk1Pc0Fr?=
 =?utf-8?B?OHowaHpzVHZlaEdxV2tCYVNEMzlJZ0RBQm11bmlFWjFLVDR5UGlnQXk5MzI3?=
 =?utf-8?B?N2k2clpMc0pydzBoSVpRN1FGS2VsNHVCL05Dc0RTRi9HUTR0SFl0a2lFcGdj?=
 =?utf-8?B?bUE5Q09tWm1LZTVGSndmVGVPRnFLYnJ3bFFKeFNiWjZlTkFDSUUycFVhYVQy?=
 =?utf-8?B?aUU2aW9YbUF5Wjh5bElIWjlrU3dPT1BPbTRxYklNbllvZEVSNkdhaGxXa1dC?=
 =?utf-8?B?dUhGWHlEN3JrVTlwbkxKQW5LSjVUUlNDVjUwYWFEc3NqV1hYb0RjSUlCUWhN?=
 =?utf-8?B?K0RNbVB3MElMbWlnNWJreE5ZNjE1ZzBNMFhZTkhJdG1CR21PNi90bHNFaE9J?=
 =?utf-8?B?Q2NSYjIxbVdPczFqMDB2UnZBcmE0YzNyaGJ2ajBFU1loSCtNQ01KM09ZaWNB?=
 =?utf-8?B?Y3hMSFpjeXpKNS85Q3AzOTkwUTV2MTFlaHhMaGdMRnJxaTl5THBxRzFSUHg2?=
 =?utf-8?B?VVJzTjJnOHNQRlNFSHJtSUhVbGdRWkRrTDVlUDE3Nk9jUENMYmp0TXl2QXpj?=
 =?utf-8?B?RWlhNnhjd3RTYmJPV0p1ZkxYdUlSUlBXQVVZYjZWdWtSbVI1MU5sQ082NXNJ?=
 =?utf-8?B?MEgvYmhCTnlMTkUrK1BpeWlaR3hjYmF3ejU3ZnRWNitNcFhkVXFlTXRaVWR0?=
 =?utf-8?B?M1Y3bFN2eTZFYjlCS25sSG1kVllmNWJpRHVtNEljUllXaUd0a2dCeHYyUXJn?=
 =?utf-8?B?ZWlOZkV6OFB4ZUd1M2lHUk10RUM3N1NNWEYrY2oybGxBNGF5WDR1SjlPTGxn?=
 =?utf-8?Q?rc7m1Qxr7GPckkzOl7AOFNulF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aacbb67-5e78-4eff-7160-08dbadb6b16f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2023 02:20:37.5050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V7PNqmfdFyXtIT03a2P3pUpoV5nFpEI1WV0v6tN8WsV1VRzh4BbVPvUQW276J9hPEf3I8vTljwK0zkZelteDXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
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

SGkgT2xpdmVyLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3DQoNCj4gRnJvbTogT2xpdmVyIE5l
dWt1bSA8b25ldWt1bUBzdXNlLmNvbT4NCj4gT24gMDQuMDkuMjMgMTU6NTIsIFd1LCBXZW50b25n
IHdyb3RlOg0KPiA+PiBGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPg0KPiAN
Cj4gPj4gQW5kIHdlIGV4ZWN1dGUgdGhpcy4gcnhfdXJiIGlzIGtpbGxlZCBhbmQgZG9lcyBub3Ro
aW5nLg0KPiA+PiBJIHNlZSBub3RoaW5nIHRoYXQgdGVybWluYXRlcyB0aGUgd2FpdGluZyBpZiB5
b3UgaGl0IHRoZSB3cm9uZyB3aW5kb3cuDQo+ID4NCj4gPiBJIHRoaW5rIHRoZSBhdXhpbGlhcnlf
ZGV2aWNlX2RlbGV0ZSB3aWxsIHRyaWdnZXIgdGhlIHJlbW92ZSBmdW5jdGlvbg0KPiA+IG9mIGxq
Y2EgY2xpZW50IGluIGhpcyBvd24gc3ViIHN5c3RlbSwgYW5kIHRoZSBkZWxldGUoKSBvciByZW1v
dmUoKSBvZg0KPiA+IGV2ZXJ5IHN1YnN5c3RlbSB3aWxsIG5vdCByZXR1cm4gdW50aWwgdGhlIG9u
Z29pbmcgdHJhbnNmZXIocHJvYmFibHkNCj4gPiBibG9ja2VkIGJ5IGFib3ZlDQo+ID4gY21kX2Nv
bXBsZXRpb24pIGNvbXBsZXRlLiBBbmQgdGhhdCBhbHNvIG1ha2VzIHN1cmUgbm8gbW9yZSB0cmFu
c2ZlcnMNCj4gPiBjb21lcyB0byB0aGVyZS4NCj4gDQo+IFN1cmUsIHlvdSB3aWxsIG5vdCBmcmVl
IHVzZWQgbWVtb3J5LiBCdXQgd2hhdCBhbGxvd3MgeW91IHRvIGJlIHN1cmUgdGhhdCB5b3UgbWFr
ZSBhbnkgcHJvZ3Jlc3MgYXQgYWxsPyANCj4NCj4gVGhhdCBpcyB0aGF0IHlvdSB3aWxsIGhhbmcg
YXJiaXRyYXJpbHkgbG9uZyBpbiBkaXNjb25uZWN0Pw0KVGhpcyByb3V0aW5lIGlzbid0IGNhbGxl
ZCBpbiBhbiBpbnRlcnJ1cHQgY29udGV4dCwgYW5kIGl0IGFsbG93cyBzbGVlcCBvciB3YWl0DQpz
b21ldGhpbmcgYmVmb3JlIHRoZSByZWFsIHNodXRkb3duIGxpa2UgbWFueSBkcml2ZXJzJyByZW1v
dmUoKSBvcg0KZGlzY29ubmVjdCgpIGRvLg0KDQpJZiB3ZSB3YW50IHRvIHNwZWVkIHVwIHRoZSBk
aXNjb25uZWN0KCksIGJlbG93IGNoYW5nZXMgaXMgdG8gY29tcGxldGUgdGhlDQpjbWRfY29tcGxl
dGlvbiBpZiB1c2Jfa2lsbF91cmIoKSBoYXMgYmVlbiBjYWxsZWQsIGJ1dCB0aGVyZSBpcyBzdGls
bCBwb3NzaWJpbGl0eQ0KbGpjYSBjbGllbnQgaW5pdCBvbmUgbW9yZSB0cmFuc2ZlciBiZWZvcmUg
YXV4aWxpYXJ5X2RldmljZV9kZWxldGUoKQ0KDQpAQCAtMjA2LDcgKzIwNiwxMSBAQCBzdGF0aWMg
dm9pZCBsamNhX3JlY3Yoc3RydWN0IHVyYiAqdXJiKQ0KIA0KICAgICAgICBpZiAodXJiLT5zdGF0
dXMpIHsNCiAgICAgICAgICAgICAgICAvKiBzeW5jL2FzeW5jIHVubGluayBmYXVsdHMgYXJlbid0
IGVycm9ycyAqLw0KLSAgICAgICAgICAgICAgIGlmICh1cmItPnN0YXR1cyA9PSAtRU5PRU5UIHx8
IHVyYi0+c3RhdHVzID09IC1FQ09OTlJFU0VUIHx8DQorICAgICAgICAgICAgICAgaWYgKHVyYi0+
c3RhdHVzID09IC1FTk9FTlQpIHsNCisgICAgICAgICAgICAgICAgICAgICAgIGNvbXBsZXRlKCZh
ZGFwLT5jbWRfY29tcGxldGlvbik7DQorICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47DQor
ICAgICAgICAgICAgICAgfQ0KKyAgICAgICAgICAgICAgIGlmICh1cmItPnN0YXR1cyA9PSAtRUNP
Tk5SRVNFVCB8fA0KICAgICAgICAgICAgICAgICAgICB1cmItPnN0YXR1cyA9PSAtRVNIVVRET1dO
KQ0KICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOw0KDQpwZXJoYXBzIHdlIGNvdWxkIGFk
ZCBvbmUgbW9yZSAnc3RhdHVzJyBmaWVsZCBpbiBsamNhX2FkYXB0ZXIgdG8gcmVwcmVzZW50DQpk
aXNjb25uZWN0KCkgaGFwcGVuIG9yIG5vdCwgYW5kIGl0IHdpbGwgYmUgY2hlY2tlZCBpbiB0aGUg
YmVnaW5uaW5nIG9mDQpsamNhX3NlbmQoKSB0byBhdm9pZCBhbnkgbmV3IHRyYW5zZmVyLg0KDQpC
UiwNCldlbnRvbmcNCg0KPiANCj4gCVJlZ2FyZHMNCj4gCQlPbGl2ZXINCg0K
