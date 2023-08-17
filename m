Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85AD377F0E7
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 09:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245225AbjHQHIe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 03:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243464AbjHQHID (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 03:08:03 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 271951FE3;
        Thu, 17 Aug 2023 00:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692256081; x=1723792081;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yq6m1iKCGa7pADgvvHKMFEXMmypqCnkGIjBmxwUi4ug=;
  b=aztJ0e5EGponci41a8+mh1lr2LaJWxtKk/4eLcGJpsoJruOZmO61K//O
   /8JGp4WgbdK2gQvY8air8zxodNDeXMDQ3P+PsB5QRe4st8dIdYZvG+zdq
   FnMItl93qt0AsVxaylIAZ0REygXC8vRLJA+j2JXN1+TMTZj2cuAfjogzU
   YmU4xnITrdoy/qxvbqZTY9dXHLi4qI0rwP+jN9NNHMKWBR/7RpkPJxrsc
   5VJy9hY/Ia0yFxYFB2IAgNUvJo/AZ8cIGkQJN01Zp2tIAIM7d1HAaAA6x
   O/+MGYIzSdT6Omd9n5EpEFYETC6aGSA6tKgoBAdCK3moc7bgqxidrA50z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436635996"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="436635996"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 00:08:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848783642"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="848783642"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2023 00:07:59 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 00:07:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 00:07:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 00:07:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 00:07:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REp4UU3wlgMdbJwbIy32Y3Er847ElK1DP39/xEOABtQqAnTpFRdVxnf44yPQUn8BW9O0eCN7J23iYjaYTzqsc6Y94ucF2vhlaFJl+7HhT3399TOGGYvAQ57FiaU14mWhJPlRUj2LWr4sQ180W2ya6qawlL5v/V1XVTBtfSdmkUvFFFWqjJxTZIaNjbrKkmZGcvX/vyhMv+Ach0BGGboPgVyI+m2414Djx2A5M83sCoBNaVi12HfqzF2F5YAI03D6qmocdrSV1XkY4Y/R9LYmWB0VZlQ+sl+QoOwsoluCDzunCNiEfzc+djoEcHz0+z3W5y4xurBvIMkpuDw/FnZN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yq6m1iKCGa7pADgvvHKMFEXMmypqCnkGIjBmxwUi4ug=;
 b=BYZ3c/l0CrKlo4PDAxhH+m5WKnuC7txCr/y3wjiVevbkQiMbIHq2atvs7bxTolhZETgc1Un7zCQ59gp/uUhPuRLSs1fM9C4bj8N28vXQz4qelOuqJVZZvkBLKNr/JyGQWDSCSCGSugiVqHhAM7JIk9kse69udcLSV1FwzIko8GcXsIrl1hZqwwpiW3tdyeDcZrrRsWqbxHAzVyxN7DnEqv2Uampc89+pVxo8m50WXSAtNBqRdT1M9mrfTs176gUl107tbJzLfvxyakZjSrrdW0JeUnCYxlU1yny2VcUzAla3zoTthcPkoSiFsKEldrQOMf2TQhUD65EXOnDDc5R+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by CH0PR11MB5692.namprd11.prod.outlook.com (2603:10b6:610:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 07:07:54 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::3dc:446f:8474:1710]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::3dc:446f:8474:1710%4]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 07:07:54 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
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
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "linux-drivers-review@eclists.intel.com" 
        <linux-drivers-review@eclists.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: RE: [PATCH v9 4/4] gpio: update Intel LJCA USB GPIO driver
Thread-Topic: [PATCH v9 4/4] gpio: update Intel LJCA USB GPIO driver
Thread-Index: AQHZ0JGYeq02xUBb+ESw5wMXh/fau6/uEJ8AgAAAVzA=
Date:   Thu, 17 Aug 2023 07:07:54 +0000
Message-ID: <DM6PR11MB43162BD4B856DF157D5F6F698D1AA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1692225111-19216-1-git-send-email-wentong.wu@intel.com>
 <1692225111-19216-5-git-send-email-wentong.wu@intel.com>
 <CACRpkda4Wrih_HPz6KjNf5rQ3A7jSRoPpMpQbm+ZWNv5P3WccA@mail.gmail.com>
In-Reply-To: <CACRpkda4Wrih_HPz6KjNf5rQ3A7jSRoPpMpQbm+ZWNv5P3WccA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|CH0PR11MB5692:EE_
x-ms-office365-filtering-correlation-id: e101fc8e-fe38-4c2f-663d-08db9ef0adae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gB1+XWIVYJvxx1UT15uk4zp6+UUWWKNjSFeW/x+feZc4qXrkQgDwynA44Qv7c5yX3RrZF3vSoBWaGp0Bs2yPaDoSCxQifLqkIk0V2kezOIrU05+CpCc2KVdNfv4Pzb8yjapWhk8eWmrVVuVNjurPG9ACUDAVmosTRBe6u3FBPUqp5rkNMIQYfV+APDRw9PJ1jsXxJyDkwys1CBI94CiSUOomL9CqvxIxqPhIoJ2LpnSKN2Tv2c6A1mJcZ5SaAYr7ouRylm9F3giawhCSy9rpJrOIrUks30xoUXk/Kc9kgImJVWNXhxzqU3i8rOLxD0Gl8gzSl6cey1cwgaShlvF/OVdC9Ip5bG9fXsy7Csx8o9aXZ8QnehDwNk4+bi2VOYajc8TyjOApCc//qh/4UyijNq62Kk33lYEh0BRM0Sx/hlWi1mMjD8DMQzbdORjjJl/I6CJq4b6c89d5Qkz5DAIOhPX+yboBTN+EYSmaLcNRFn+g65tHLCT8NrLn65ERDEUW8KUGvlDzfXASdVywb+5+HajyI8AEctBbit6P1sB+FXhgkLYmMyxRqM3AC7kVvrSeX2BNvZ1RscdPViU002qRT9zBN1IeuCuHvkRov3yR6zCNVdEHp9BPDtkv4rMfmj9i
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(1800799009)(451199024)(186009)(15650500001)(2906002)(83380400001)(4744005)(66899024)(26005)(7416002)(86362001)(478600001)(6506007)(7696005)(71200400001)(33656002)(9686003)(53546011)(55016003)(5660300002)(52536014)(41300700001)(66446008)(122000001)(54906003)(316002)(66476007)(66556008)(66946007)(76116006)(64756008)(6916009)(4326008)(8676002)(8936002)(82960400001)(38100700002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWpsQU5EQkpoSnVBVExyS0IxOGJrSkVST1dscFhkbkVaZGVneWJ1Q1lidUZq?=
 =?utf-8?B?RGtKZG8xT2ZjbmxXOVNhcXhESnlxeVV3b3prT2Z2Q2lKYWxjMnVKTTY0TmZt?=
 =?utf-8?B?bUhQOFZZSzBqWnVXVi9qVXRHV2dVMkpXUDB4Z2t4c3orb2JQbzFIQTVtcjNr?=
 =?utf-8?B?Nkd5Y1ZKMnVtaHUweHJtQ3V0WkVOY2VCRjA1QWIrTWx6MTdxVnBkQkttYVhL?=
 =?utf-8?B?YU9vUkx3K1RnaVVrQjVWK3ZlWjhFcVZmVW1iRjZscFlieWk3dGw3S2w4N2Jy?=
 =?utf-8?B?N3RtTHg1S1hxdWtsL1FGWjBBWnRaOXNrcGZieTQ3UFJXb1JaMmpWVitmM2tQ?=
 =?utf-8?B?V3dmMjZFNXE4aFV2LzNaRzE3UjBnQmJiVWxXSVJhaDZFZFZRdjJtT05WWnl4?=
 =?utf-8?B?Vi9ZTGZzN0oxamk0TWdBQ21sMDFFSWhlNmJzSGhkK1gyaFhqK2FHWEg4S2Ni?=
 =?utf-8?B?Y3VZdWRzOTREVFZHd2FjRUxOZnl6bHVCK0RDNWp5czM4ZEh4RGsrM05Dc3hl?=
 =?utf-8?B?WVJwUWdzc0VEenNNcVdqYWpUUElQY3Bqckl6MUpsU3B6SUVIWTZNOFZLM2hs?=
 =?utf-8?B?RndLWWp1ak4zMDJrbHpTQk5XaGk0T3VreG5OQzdwOGNvYnA3QzRTdGRENGJo?=
 =?utf-8?B?cnArR1JtUlhaQWtkSkRPV0pZcklUQjljWW4vYmY4akJlaDdTcG1jSjBBMzRp?=
 =?utf-8?B?byt5L3BOa3NKcFRCaWR4RVNDeWtrQ2RKUnRjVzhoRS95YkFBMkI0ZHVXNGt5?=
 =?utf-8?B?UkRlRVZVSUFNakxkclZIbnlUQWlzWXdKSENSUVJkaU45TTBXd0JGc2RwdlZ6?=
 =?utf-8?B?cTNpOUxPRWo2cTRpQU5sbWtXYlAvZVpWZHRQd0FOOEEyWkQ0T2E1dmJRUFNZ?=
 =?utf-8?B?RFY5djJUZVFWUTZKd1A1MkhtdHk0UDNjSnVSZXB2YUdlUXpHY3ZJbDBnM3h6?=
 =?utf-8?B?TDBzQXlBV3FLNGpPZjBDV3pDREZPNTFBZzc2MnYvbDNwODNGclExa0lhcEhu?=
 =?utf-8?B?UmhQZEh3b3E0RncxTzVURzh3TEJ3aUEzSVlDM2w5cE5FL1dlNEo4MEdobjdR?=
 =?utf-8?B?WitSbzk0MlVnYS93L0NaTGkrbldXbXFLVTNob3owNEFPZzdaMWtyTjNmdU1C?=
 =?utf-8?B?TWl0MlNvTEZBS1pRczMyZnhxaDI2KzMwaDhEU3hxd3JDLzZtTFhuMW8zNDcr?=
 =?utf-8?B?N09lamJ3VTM0cUZUSDFNMUtDNVZuUFNUdjlsV01iUDVPVXVQRk1pSlZTUjVM?=
 =?utf-8?B?RkFsQXA1YmFFb2sya3hUSytMMEU3L2x2RVlRRjlTTlJMZ0RseW9EYUp2SzN2?=
 =?utf-8?B?d2ZHTUVPZUdoL0NaWG05MEUxdGlERFZyNHR6VU9teEpEZy9tZXlhNk4yYUR0?=
 =?utf-8?B?cmpUSjdUWWJiU2ZSWHhTdHp1VFJEUUFldXptNUc1M2ZxUnBDcHNPbXBvYVVD?=
 =?utf-8?B?aTF4VTRjQzRUUFNsWDBlbFdlbitvNTdaMHFJQUp5SG85b09EMTFaYmUvL0kx?=
 =?utf-8?B?R1RaQmJyR3VOWVYrTEl6bWxGM09FNGZTVDZ0WHY4MzM4UGt0dy9ubFJLSUtt?=
 =?utf-8?B?YTl0YWdJYzZMb2pTNnJHQjV5bVZobXpxZFZ4UzlmQVhJL1Z6WkJ4U1IzSHkx?=
 =?utf-8?B?Ri9EamVKVjk0VTJxUStNSnZQekpZVktJUkloRjZsRlJWZWU5WWZhNllRanBH?=
 =?utf-8?B?aWxEY3FvQVJtZE1mdDFqd2F6ZFF0RGFQWFlSWWFKc3VjcHF2ZUUzemM3c3VU?=
 =?utf-8?B?MVI1UHphNmRtenhIRytwa2FWL0YxdEppMGs3akhaY1FxOUtVVzlocWgwd3hk?=
 =?utf-8?B?Tk01b3QrR280L2gzOVk1cVhEck5iUlcyS3piZjVTdjBaRUNNRGtiQWw4VHJR?=
 =?utf-8?B?OWFHTWtRbHRFMmVKRFlmdUNYV0lmVjN3SGg4cSsrRjBLU1JHZ2xHT2VXeWtK?=
 =?utf-8?B?a1NmQmJRSDgvbVd1bUd6SEU5aU1NT2ppZms2bVprdjFUS0dXSVdWVTNlRVV2?=
 =?utf-8?B?d2g4WFJybjV0bFl5S2pSYWxTbnhyNzhUM1NVSktqNU55Q3VIMkFmbGlsQVNp?=
 =?utf-8?B?eFVwb3VZc0NKTDVWSzhEQml5c1Q4Um1BUUtrVUhXVGpiQzB5djhZNnFIdGZF?=
 =?utf-8?Q?2h3m1NkzHs9GeS820TFZX28ZS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e101fc8e-fe38-4c2f-663d-08db9ef0adae
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2023 07:07:54.5785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xg+NaYc6vIN2lZG2ng7kWnwKNzibQ3/rAMLNec8cv8gl/+UMkqBi7TcIGZNMJYbA99rCzDiSDotcCHziXUmYEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5692
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

PiBGcm9tOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+IA0KPiBP
biBUaHUsIEF1ZyAxNywgMjAyMyBhdCAxMjozMuKAr0FNIFdlbnRvbmcgV3UgPHdlbnRvbmcud3VA
aW50ZWwuY29tPg0KPiB3cm90ZToNCj4gDQo+ID4gVGhpcyBkcml2ZXIgY29tbXVuaWNhdGUgd2l0
aCBMSkNBIEdQSU8gbW9kdWxlIHdpdGggc3BlY2lmaWMgcHJvdG9jb2wNCj4gPiB0aHJvdWdoIGlu
dGVyZmFjZXMgZXhwb3J0ZWQgYnkgTEpDQSBVU0IgZHJpdmVyLg0KPiA+IFVwZGF0ZSB0aGUgZHJp
dmVyIGFjY29yZGluZyB0byBMSkNBIFVTQiBkcml2ZXIncyBjaGFuZ2VzLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogV2VudG9uZyBXdSA8d2VudG9uZy53dUBpbnRlbC5jb20+DQo+ID4gUmV2aWV3
ZWQtYnk6IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+
IFRoaXMgcGF0Y2ggZG9lcyBzZXZlcmFsIHRoaW5ncyBhdCB0aGUgc2FtZSB0aW1lLCBjb25zaWRl
ciB0aGUgIm9uZSB0ZWNobmljYWwgc3RlcA0KPiBwZXIgcGF0Y2giIGFwcHJvYWNoLCBmb3Igc29t
ZSBkZWZpbml0aW9uIG9mIGEgInRlY2huaWNhbCBzdGVwIi4gVGhlIHVwc2lkZSBpcyB0aGF0DQo+
IGdpdCBiaXNlY3QgZ2V0cyBiZXR0ZXIgcHJlY2lzaW9uIHdoZW4gc29tZXRoaW5nIGdvZXMgc2lk
ZXdpc2UuDQoNCkFjaywgdGhhbmtzLiBJIHdpbGwgZm9sbG93IHRoaXMgZ29pbmcgZm9yd2FyZC4N
Cg0KPiANCj4gSG93ZXZlciBpdCdzIG5vIGJpZyBkZWFsIGZvciBtZSBhcyBJJ20gbm90IGh1bmcg
dXAgb24gcHJvY2VzcyBhbmQNCj4gSSBiZXQgeW91IGhhdmUgdGVzdGVkIHRoZSByZXN1bHQsIHNv
Og0KDQpEZWZpbml0ZWx5LCBJIGhhdmUgdGVzdGVkIHRoaXMgcGF0Y2ggc2V0cyBkb3plbnMgb2Yg
dGltZXMuDQoNCj4gQWNrZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJv
Lm9yZz4NCg0KVGhhbmtzIGEgbG90DQoNCkJSLA0KV2VudG9uZw0KPiANCj4gWW91cnMsDQo+IExp
bnVzIFdhbGxlaWoNCg==
