Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D83A59FD64
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Aug 2022 16:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237823AbiHXOii (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Aug 2022 10:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239234AbiHXOig (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Aug 2022 10:38:36 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0931183BE;
        Wed, 24 Aug 2022 07:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661351915; x=1692887915;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XQSFhRDBmyKzj8esMODQR3Ux4i3OTWRfKpa/uQ1mLfw=;
  b=0AJDJJMMnUpqzafZ5LpcPhd7klQlx+cqmZOd+1RZRe8BjA7PGpu6g2oc
   QJiCkmzm3UirXgn655vp3UMzBrg0pTavzJPV/pUYbWcwAjDznsR045UDL
   kjdmYP17E8zc3RXxCVJMuitiI7dQG7j6ScnQ7IhNSxyAs9PCQE1Raumyi
   sdaxR4kfQMzEfD2cyflVUgZ69Bz9cwDc6cpj/1pQnnBXSTW6gzCdgJXf0
   SBATUOARP/bqzZgfIxGCX6jXGcRPUwgEefoHjCLfUELB9xIaQjHB9XxqQ
   xDt41aC0v76JYFIWGWVFrUaaNVdyi+fLZmZGnW5jkCOEKrQyBiXAYMePP
   A==;
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="110531938"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Aug 2022 07:38:34 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 24 Aug 2022 07:38:34 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 24 Aug 2022 07:38:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AR+/CqKhO9v/hJBRqwZ7faHypVbPeqr0ceI4sb2u3Dzmaf1khb3xaxFk2us7GO0GeiuPGnDD7u/oe0fwHbVZn2LsHdASDdCzSr+yQGziEhHlfmbKVjBP8F+KeHn9rG9UbmFgr3Hi8tglIL5pQaXaOxXugfqMTK8DgrLtsy4rXYijLt0n7Be7AsP6NsaeikHKLiAn4yKkPgcNqPN/butg0mtqQvxZaSplMHy2w2ZgNPM+GWJb2sdIrBLjeSP08fWiOOYYu2aB2N7lD32MK+sNbmiUs/0Uwyh252Gjlihc3kw0B/vIO3cmUxvSfOW9E0EAFZPlgXxgUqEL8oXkEN/3lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQSFhRDBmyKzj8esMODQR3Ux4i3OTWRfKpa/uQ1mLfw=;
 b=DuWH6kZN4F9ae9UfuIppbXWtmuAKing1jthJzw7YMQUx4kS2iWUMakGJ4xP5lTlq1wU6XKJKMwqhSjyh5XxLt9IezmRPPWPH6T8KtvYq8EzJV4Gi8OHLDIJdFKO4DtqQ6FNPHMEs1pXEY1xdx7OX88mfuW+7sRL0QduOprsF6iNAc4D5lUgf1t98p6KYSwIrFBu9YePvXRYPFnupW8MWu6e9xHieDoGXW+UMXVkbTSlRA6qrx2dUii/XU0YlmtID6D0ffGjXclemJZZIuYL+71pY5rEXkeYG2c2cIW4lCuy0y7770KLwSxSHri++OVUB9RpQctINLOiHv08LMvRN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQSFhRDBmyKzj8esMODQR3Ux4i3OTWRfKpa/uQ1mLfw=;
 b=l5tjz7Hr9Hmp/w3y92zUsKAe4t5udoXFk2sS1V1vug/+vQO/UkJPIfhI66S3aUFXFYWybBry+Nw85BuFKndweuA33LNXiFcULmks46Ho4+D4lwCihBwTen2/0Ws63IkNyCMGG+EjW2e8PXDn5nnEZ9C3GmObAHvN2O6VR4FXCqs=
Received: from PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5)
 by DM5PR1101MB2122.namprd11.prod.outlook.com (2603:10b6:4:54::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Wed, 24 Aug
 2022 14:38:29 +0000
Received: from PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::b9d5:a00c:517f:8454]) by PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::b9d5:a00c:517f:8454%6]) with mapi id 15.20.5546.022; Wed, 24 Aug 2022
 14:38:29 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <andriy.shevchenko@linux.intel.com>
CC:     <UNGLinuxDriver@microchip.com>, <wsa@kernel.org>,
        <krzk@kernel.org>, <sven@svenpeter.dev>, <robh@kernel.org>,
        <semen.protsenko@linaro.org>, <linux-kernel@vger.kernel.org>,
        <jarkko.nikula@linux.intel.com>, <olof@lixom.net>,
        <linux-i2c@vger.kernel.org>, <jsd@semihalf.com>, <arnd@arndb.de>,
        <rafal@milecki.pl>
Subject: Re: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Topic: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Index: AQHYttI9ItE0vA92WES0jroLXsIOYq28lckAgAGLSYA=
Date:   Wed, 24 Aug 2022 14:38:29 +0000
Message-ID: <80debd4bbf819cbfa16681172919436df476558a.camel@microchip.com>
References: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
         <YwTsnCdxM5I6BoJu@smile.fi.intel.com>
In-Reply-To: <YwTsnCdxM5I6BoJu@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c5140c3-ca10-43cb-7a99-08da85de4fc1
x-ms-traffictypediagnostic: DM5PR1101MB2122:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l98vugrObGJlIa1zB1zzAYH8iLmKQFv/uRnJVyoU3wnGSuTg4JLgpz7eBaKf4hqQ1r1Vsx1gMg3SdlRrgbf1pDQGuxf0icKtX7epZWBkIYyhTvIEtwYX0RDFDKfZnEXylHoqi8TQvj1fNai/gCYSh6WcbHhg9hr6cTYQK+N/Z22j6nuBEQWnGnL5j3se3SnmIPm3GexnKdzuI3qKxuH7gBWHuvuihTAXpZJbH9hd+P1+O/ZpaaN5KVNIWkG30aKATHv7rB20fQsW6X6oB/YdMfVrtn39w2FnqKSZy8alS35mbfoPg7d85K3xCXlA9g0JAQDhKgqgFF01dA85SjaqSrDKTyyzWT6/kD+fWdxrmSDKHJsTq8BgjPhdHDzbb0gz0q+G9Xr1QmjKrTgAzsSqxtz4s/i6mkr7fQnc6jDGpLl0701vk9qtao4MbeR/yuZSAU/+6yJZ4PZQ9MW+tKs+acyVKk1b/x3Epl7m6tn67zhZURM6yg5mkqLaTgv+o5ppHyHFlaqIN7b4xgLurpZomgcUV7adgHYSCZBjEJTNjofN8AHxVK3HFdx70I2D6otrqZ9kI/zyTBnjfwxdpQ9IA8en0hDn29bv9HOitkJWFybeP7qLxduafMQVdPED8bkr69bGiVuv/bu/BVdTx37pk2HhnRELsR2HxNcBqgQBzL8IwbOb0wvImCHNLzUmKrpl3ZhYgkq2/4nt2WIFh60NJ/TiQoi81XkstwDqwlTqRgTQjTd5l12/gJV+csKH2ADi51Jz7/tPI/kabo230FztIXu1S7SSHiH+YM4Cp/nKZCgoc4UnIZAdf+ZdVFiskZFUQIbXg3vkOLL2MIkudezhhYKiUIkXwR5AzOU+BcOwgwQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5096.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(136003)(346002)(396003)(376002)(122000001)(86362001)(38100700002)(316002)(6916009)(54906003)(38070700005)(2906002)(4326008)(66946007)(76116006)(66556008)(36756003)(8936002)(64756008)(91956017)(83380400001)(66446008)(66476007)(186003)(6486002)(7416002)(2616005)(5660300002)(6506007)(8676002)(71200400001)(41300700001)(6512007)(478600001)(26005)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnR3YzdjL2NJN1owdUJuZnM3bTRtOVhSQXRPMlJJQUNJNHNVTjdINm5EUkV4?=
 =?utf-8?B?Sng2Tmh1NkNhZVhPeXZoS3JXMFkrUG1xTy9kWmtCUVhsd0ZPSDFxS1NCb045?=
 =?utf-8?B?YnJaVjl6N0FKek5vZksvWG9EeVFzVXZzdGFxVVpveWh5dzZQaW9RS1hVay9J?=
 =?utf-8?B?SUpCbkNHQ1JaMzcwZEtYQVhpQnAxek84ZkRJdDl5MjhNT1RGdGYzLyt5OEFs?=
 =?utf-8?B?eXMwRmNaZTBCTlg1WDViWE5nSmJOWU5hRFRYNGZZSm84Q2RVTE5aNjVJbXpY?=
 =?utf-8?B?VzhwekFPeXA4ZExrRGpmc0ZGMU04SEZlSmVEUTNYaHBLWkQwZ3l1MTVaVDMy?=
 =?utf-8?B?ajVhbFkxeUd2a2NZU3FtTmZkWDI2MGNGUjYvaVdITHVvdURtandaUnAzaTVP?=
 =?utf-8?B?ZGJZVjlyWGw5TW5ndmhjQWUyODk1UkxmNzU3Smt4ZVU4THpURlJGYkdDcTU1?=
 =?utf-8?B?bmdiaFBUaE4wUm12TmpFOVgweTlkRVN1WWU3SHBENUJqcVg3Tk9DTjRib0Zm?=
 =?utf-8?B?aXFSemJqYzBJMVl4MktsblVKWEtlYzJTVUJpbkUzOHovM3RFenpaenh1RHI3?=
 =?utf-8?B?RG9NQUwycFcxc0gxNDhkaSt4SVc2cllnZ3Y3QXdER3kvQ05TRGwrWnVMQmtG?=
 =?utf-8?B?Z0syWGt1bUdDWE5oU2FaQlhzVE5oWXlWZGRubVgvb1h1MHUxQ0ZRZEVPcE9K?=
 =?utf-8?B?WVlLN24zRTNOS01lUGlRRWhkZyt2T0lNQjd5N2hRa0xUUFhENVZHUVNRaGpx?=
 =?utf-8?B?K0tXMUFEOXowMFBURGZCNmM2RnB5WkthUTVZb0FnQXZ1MmtBem9HRjRyenoz?=
 =?utf-8?B?Y2FyeHRZRkZqMUU4OHROcEdpREtROHNvTDZjQkZ2cGloZktkakNieUdYRlFz?=
 =?utf-8?B?SkhrSTlvbG1ZZXg0dXpYQkE0UnlualFqRC9ZaU1jWjNlZm1yeWN4R2FkR3Z1?=
 =?utf-8?B?UjRQc0Rhd3p0ajhHSEFtN05kMERwVXRjNkxid29RNlU2OEQ1em1zVXVKTU92?=
 =?utf-8?B?cWU3VE0rYjBwWFRiQzNEZEZsVHJlem5lSDB1NUxSdi9iL0MvMUEzOVd1bjIr?=
 =?utf-8?B?c3daSHQwTDBRdktRb3ZHMXRVZDEydjEvODh4dzJNRm1xbCtWMjFHbm9DcUtV?=
 =?utf-8?B?MjIzOGR3VE5NQ3VzSm94Z3dEOE51a0NyYWdqK3A4MlFqcjF0V0dxZEhidVhp?=
 =?utf-8?B?bGtBSlNZakdWOVNLVUtpZ1VISXUydW5JdVllMWdZOWxaYXQ1eVlIdXgvNkdq?=
 =?utf-8?B?Q2txUUw1ajRwck1ocFpRRklqN0pmQ0VyVm5kaTFYM3Vja2FJT2F2R2ZpUWI0?=
 =?utf-8?B?eEhSUWQ1N1Fkd0VuUlY0ZVNiY1p5ekMydzlGU3YwNjlWMjUrY2lwOUdhc3lz?=
 =?utf-8?B?ZzJkUzlFRlFQRjc1M1pJbVhjUG1qdUZvQ0lJNUhocERKdDA3NmdiaytRTDlr?=
 =?utf-8?B?L1FqclRHcGdGZFF3VlE3ZG5jSlhoTEFOVEQ3MG1acnlKUnVvMC80TXZqUVY2?=
 =?utf-8?B?UW1UVXRQVEhPM1lQWCtHdGZ0a0NYZkFUN2taSURRVnNCK0ExcVoxZVdzT29q?=
 =?utf-8?B?UmxYY3N6QUxlV1RkNEJ1N1BXUHhnWGZHZlZsazF1WTRXYVhrQ1NucEh3ZUZs?=
 =?utf-8?B?TmpEZEloZjloK3NhVkhTb2RMaUhXY0p3MTlXTDZnMHVIQjJhR1NsT2dyR3JI?=
 =?utf-8?B?ek11SW1XTkQzVlU4NDd6TzVITFJZdTdQTFgycDdId0ZzWSs3aW5ac21yMUJw?=
 =?utf-8?B?TjZCVzY3TTFab2NKaE0vQUFieUZXbmJJemUrT1ZYVDNRNEExZnZyQVA4NG9i?=
 =?utf-8?B?M0xJRlRlcnhVTnQ2TmVGTWdPZEJHS0Y0MHpPRUJkWnhGdVpYdjV2TVlYU3F1?=
 =?utf-8?B?ODNOaklSZmxtWEdZem9EMlYyNUxZZHlKWUxTWjQzMGFLTWk2MmMrZEIzU2k5?=
 =?utf-8?B?V1Q1WUtmWHkzNmhlSjVUcXNGT2VHNDdOVUxSaWVYWVlxUzFTWFpSR2pBenpQ?=
 =?utf-8?B?c3JINWhwNU1zYXk4RmU2SkkzSGJkUFVUUnkvSW10UUxLOHdiaWJFbmNKekJU?=
 =?utf-8?B?Y1hSNEthVVVoL2xTTTFCaC92eE1tSWREakd4YmNYSXk5YnM3ZlJEU1NDNEFt?=
 =?utf-8?B?VHFsQVpGUGJKMUEra3dFREJJNHA4MThpMVY0eWJ1L1pZaVNkdDR5eHRZNUtF?=
 =?utf-8?Q?nDkynahe43MBGtYPXQLveTCpPaXu3VsIC+DH1E8dDX45?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B7B0C3210CF2D4EA93B75A73F9B5631@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c5140c3-ca10-43cb-7a99-08da85de4fc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 14:38:29.3347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7zC1LFJ94NjJqSDB/ugElNKmM1iFsSY+8qjxaybYIvFcv5VWzlgsXKojnW9+sZOTHiOZFM/7ZeWWOBOTX8r9sQbhLpV3FbzF0gUKDqIo3jcDB7m8BiX9d8BWjY/Xnm5+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2122
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIyLTA4LTIzIGF0IDE4OjA1ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IE9uIFR1ZSwgQXVnIDIzLCAyMDIyIGF0IDA4OjI2OjAzUE0gKzA1MzAsIFRoYXJ1biBLdW1h
ciBQIHdyb3RlOg0KPiA+IE1pY3JvY2hpcCBQQ0kxWFhYWCBpcyBhbiB1bm1hbmFnZWQgUENJZTMu
MWEgU3dpdGNoIGZvciBDb25zdW1lciwNCj4gPiBJbmR1c3RyaWFsIGFuZCBBdXRvbW90aXZlIGFw
cGxpY2F0aW9ucy4gVGhpcyBzd2l0Y2ggaGFzIG11bHRpcGxlDQo+ID4gZG93bnN0cmVhbSBwb3J0
cy4gSW4gb25lIG9mIHRoZSBTd2l0Y2gncyBEb3duc3RyZWFtIHBvcnQsIHRoZXJlDQo+ID4gaXMg
YSBtdWx0aWZ1bmN0aW9uIGVuZHBvaW50IGZvciBwZXJpcGhlcmFscyB3aGljaCBpbmNsdWRlcyBh
biBJMkMNCj4gPiBob3N0IGNvbnRyb2xsZXIuIFRoZSBJMkMgZnVuY3Rpb24gaW4gdGhlIGVuZHBv
aW50IG9wZXJhdGVzIGF0IDEwMEtIeiwNCj4gPiA0MDBLSHogYW5kIDEgTUh6IGFuZCBoYXMgYnVm
ZmVyIGRlcHRoIG9mIDEyOCBieXRlcy4NCj4gPiBUaGlzIHBhdGNoIHByb3ZpZGVzIHRoZSBJMkMg
Y29udHJvbGxlciBkcml2ZXIgZm9yIHRoZSBJMkMgZW5kcG9pbnQNCj4gPiBvZiB0aGUgc3dpdGNo
Lg0KPiANCj4gLi4uDQo+IA0KPiA+IEBAIC0xMjkwLDYgKzEyOTAsMTYgQEAgY29uZmlnIEkyQ19W
SVBFUkJPQVJEDQo+ID4gwqDCoMKgwqDCoMKgwqAgUml2ZXIgVGVjaCdzIHZpcGVyYm9hcmQuaCBm
b3IgZGV0YWlsZWQgbWVhbmluZw0KPiA+IMKgwqDCoMKgwqDCoMKgIG9mIHRoZSBtb2R1bGUgcGFy
YW1ldGVycy4NCj4gPiANCj4gPiArY29uZmlnIEkyQ19QQ0kxWFhYWA0KPiANCj4gTG9va3MgdW5z
b3J0ZWQuDQoNCk9rYXksIEkgd2lsbCBzb3J0IGluIGFscGhhYmV0aWNhbCBvcmRlcg0KDQo+ID4g
K8KgwqDCoMKgIHRyaXN0YXRlICJQQ0kxWFhYWCBJMkMgSG9zdCBBZGFwdGVyIHN1cHBvcnQiDQo+
ID4gK8KgwqDCoMKgIGRlcGVuZHMgb24gUENJDQo+ID4gK8KgwqDCoMKgIGhlbHANCj4gPiArwqDC
oMKgwqDCoMKgIFNheSB5ZXMgaGVyZSB0byBlbmFibGUgdGhlIEkyQyBIb3N0IGFkYXB0ZXIgc3Vw
cG9ydCBmb3IgdGhlIFBDSTF4eHh4DQo+ID4gY2FyZA0KPiA+ICvCoMKgwqDCoMKgwqAgVGhpcyBp
cyBhIFBDSSB0byBJMkMgYWRhcHRlcg0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgIFRoaXMgZHJp
dmVyIGNhbiBiZSBidWlsdCBhcyBhIG1vZHVsZS4gSWYgc28sIHRoZSBtb2R1bGUgd2lsbCBiZQ0K
PiA+ICvCoMKgwqDCoMKgwqAgY2FsbGVkIGFzIGkyYy1tY2hwLXBjaTF4eHh4DQo+IA0KPiBFbmds
aXNoIGdyYW1tYXIgYW5kIHB1bmN0dWF0aW9uIHdoaWxlIGtlZXBpbmcgbGluZXMgc2hvcnRlciAo
fjc2KSBwbGVhc2UuDQoNCk9rYXkNCg0KPiANCj4gPiDCoG9iai0kKENPTkZJR19JMkNfVklQRVJC
T0FSRCkgKz0gaTJjLXZpcGVyYm9hcmQubw0KPiA+ICtvYmotJChDT05GSUdfSTJDX1BDSTFYWFhY
KcKgwqAgKz0gaTJjLW1jaHAtcGNpMXh4eHgubw0KPiANCj4gV2h5IHVuc29ydGVkPw0KDQpJIHdp
bGwgc29ydCBpbiBhbHBoYWJldGljYWwgb3JkZXINCg0KPiANCj4gPiArICogQXV0aG9yOiBUaGFy
dW4gS3VtYXIgUCA8dGhhcnVua3VtYXIucGFzdW1hcnRoaUBtaWNyb2NoaXAuY29tPg0KPiA+ICsg
KsKgwqDCoMKgwqDCoMKgwqAgS3VtYXJhdmVsIFRoaWFnYXJhamFuIDxrdW1hcmF2ZWwudGhpYWdh
cmFqYW5AbWljcm9jaGlwLmNvbT4NCj4gDQo+IFNpbmdsZSBvciBtYW55Pw0KDQpUaGVyZSBhcmUg
MiBhdXRob3JzIGZvciB0aGlzIGZpbGUNCg0KPiANCj4gPiArLypTTUIgcmVnaXN0ZXIgc3BhY2Uq
Lw0KPiANCj4gU3R5bGUuDQoNCkkgd2lsbCB0YWtlIGNhcmUgb2Ygc3R5bGluZyBmb3IgY29tbWVu
dHMgdGhyb3VnaG91dCBmaWxlDQoNCj4gDQo+ID4gKyNkZWZpbmUgU01CX0NPUkVfQ1RSTF9FU0/C
oMKgwqAgMHg0MA0KPiA+ICsjZGVmaW5lIFNNQl9DT1JFX0NUUkxfRldfQUNLIDB4MTANCj4gDQo+
IEFyZSB0aGV5IGJpdHMgb3IgbnVtYmVycz8NCg0KVGhlc2UgYXJlIGJpdHMNCg0KPiAuLi4NCj4g
DQo+ID4gKyNkZWZpbmUgU01CX0NPUkVfQ01EX1JFQURNwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgx
MA0KPiA+ICsjZGVmaW5lIFNNQl9DT1JFX0NNRF9TVE9QwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAw
eDA0DQo+ID4gKyNkZWZpbmUgU01CX0NPUkVfQ01EX1NUQVJUwqDCoMKgwqDCoMKgwqDCoMKgwqAg
MHgwMQ0KPiANCj4gRGl0dG8uDQoNClRoZXNlIGFyZSBiaXRzDQoNCj4gLi4uDQo+IA0KPiA+ICsj
ZGVmaW5lIFNNQl9DT1JFX0NNRF9NX1BST0NFRUTCoMKgwqDCoMKgwqAgMHgwMg0KPiA+ICsjZGVm
aW5lIFNNQl9DT1JFX0NNRF9NX1JVTsKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MDENCj4gDQo+IERp
dHRvLg0KDQpUaGVzZSBhcmUgYml0cw0KDQo+IC4uLg0KPiANCj4gPiArI2RlZmluZSBTUl9IT0xE
X1RJTUVfMTAwS0hawqDCoMKgwqDCoMKgwqDCoMKgIDB4ODUNCj4gPiArI2RlZmluZSBTUl9IT0xE
X1RJTUVfNDAwS0hawqDCoMKgwqDCoMKgwqDCoMKgIDB4MTQNCj4gPiArI2RlZmluZSBTUl9IT0xE
X1RJTUVfMTAwMEtIWiAweDBCDQo+IA0KPiBUaGVzZSBoYXMgdG8gYmUgZGVjaW1hbCwgYW5kIHdo
eSB0aGUgQUNQSSAvIERUIGRvZXMgbm90IHByb3ZpZGUgdGhlbT8NCj4gDQo+IEFsc28sIGRvIHRo
ZXkgaGF2ZSB1bml0cyBvciBhcmUgdGhleSBwcm9wb3J0aW9uYWwgY29lZmZpY2llbnRzPw0KDQpU
aGVyZSBpcyBubyBkaXJlY3QgY29ycmVsYXRpb24gYmV0d2VlbiB0aGUgaGV4IHZhbHVlIGFuZCB0
aW1lLiBFeDogMHg4NQ0KcmVwcmVzZW50cyAwLjUgdXMuIE91ciBkZXZpY2UgaGFzIGFuIE9UUCBy
ZWdpb24gdXNpbmcgd2hpY2ggdXNlciBjYW4gY29uZmlndXJlDQpkZXZpY2UgdG8gb3BlcmF0ZSBh
dCAxMDBLSHosIDQwMEtIeiBhbmQgMU1Iei4gQmFzZWQgb24gdGhpcyBjb25maWd1cmF0aW9uLA0K
U1JfSE9MRF9USU1FLCBJRExFX1NDQUxJTkcgYW5kIGZldyBvdGhlciByZWdpc3RlcnMgd2lsbCBi
ZSBjb25maWd1cmVkIGluIGRyaXZlcg0KDQo+IC4uLg0KPiANCj4gPiArI2RlZmluZSBDT01QTEVU
SU9OX01ET05FwqDCoMKgwqAgMHg0MA0KPiA+ICsjZGVmaW5lIENPTVBMRVRJT05fSURMRcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MjANCj4gPiArI2RlZmluZSBDT01QTEVUSU9OX01OQUtY
wqDCoMKgwqAgMHgwMQ0KPiANCj4gQml0cz8gU2FtZSBRIGZvciB0aGUgcmVzdCBzaW1pbGFyIHN0
dWZmLg0KDQpZZXMuIFRoZXNlIGFyZSBiaXRzLg0KDQo+IC4uLg0KPiANCj4gPiArI2RlZmluZSBT
TUJfSURMRV9TQ0FMSU5HXzEwMEtIWsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MDNFODAz
QzkNCj4gPiArI2RlZmluZSBTTUJfSURMRV9TQ0FMSU5HXzQwMEtIWsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDB4MDFGNDAwOUQNCj4gPiArI2RlZmluZSBTTUJfSURMRV9TQ0FMSU5HXzEwMDBL
SFrCoMKgwqDCoCAweDAxRjQwMDlEDQo+IA0KPiBTaG91bGRuJ3QgdGhlc2UgbWFnaWNzIGJlIGRl
Y2ltYWxzPw0KPiBEaXR0byBmb3IgdGhlIHJlc3Qgc2ltaWxhciBzdHVmZi4NCg0KVGhlcmUgaXMg
bm8gZGlyZWN0IGNvcnJlbGF0aW9uIGJldHdlZW4gdGhlIGhleCB2YWx1ZSBhbmQgdGltZS4gQ29u
ZmlndXJpbmcNCnJlZ2lzdGVycyB3aXRoIHRoZXNlIHZhbHVlcyBpbiBkcml2ZXIgd2lsbCBzZXQg
dGhlIHRpbWUgaW4gZGV2aWNlLg0KDQo+IC4uLg0KPiANCj4gPiArI2RlZmluZSBJMkNfRElSX1dS
SVRFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDANCj4gPiArI2RlZmluZSBJMkNfRElS
X1JFQUTCoMKgwqDCoMKgwqDCoMKgIDENCj4gDQo+IE5hbWVzcGFjZSBjb2xsaXNpb24uIERvZXNu
J3QgScKyQyBjb3JlIHByb3ZpZGUgdGhlc2U/DQoNCkkgYW0gdW5hYmxlIHRvIGZpbmQgYW55IGV4
aXN0aW5nIE1BQ1JPcyBmb3IgV1JJVEUgYW5kIFJFQUQgaW4gSTJDIGNvcmUuIEtpbmRseQ0KbGV0
IG1lIGtub3cgdGhlIE1BQ1JPcw0KDQo+IC4uLg0KPiANCj4gPiArI2RlZmluZSBQQ0kxWFhYWF9J
MkNfVElNRU9VVCAxMDAwDQo+IA0KPiBVbml0cz8gU2FtZSB0byB0aGUgcmVzdCBzaW1pbGFyIGNh
c2VzLg0KDQpVbml0IGlzIG1pbGxpc2Vjb25kcw0KDQo+IC4uLg0KPiANCj4gPiArI2RlZmluZSBT
TUJVU19QRVJJX0xPQ0vCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCSVQoMykNCj4gDQo+IEJJ
VCgpIG91dCBvZiBhIHN1ZGRlbi4gU2VlIGFib3ZlLg0KDQpXaWxsIHVzZSBoZXggdmFsdWUgZm9y
IHRoaXMgbGlrZSBpbiBvdGhlciBwbGFjZXMgdG8gbWFpbnRhaW4gdW5pZm9ybWl0eQ0KDQo+IC4u
Lg0KPiANCj4gPiArLyoNCj4gPiArICogc3RydWN0IHBjaTF4eHh4X2kyYyAtIHByaXZhdGUgc3Ry
dWN0dXJlIGZvciB0aGUgSTJDIGNvbnRyb2xsZXINCj4gDQo+ID4gKyAqDQo+IA0KPiBSZWR1bmRh
bnQgYmxhbmsgbGluZS4NCg0KV2lsbCB0YWtlIGNhcmUgb2YgdGhpcyBpbiB1cGNvbWluZyBwYXRj
aA0KDQo+IA0KPiA+ICsgKiBAYWRhcDrCoMKgwqAgSTJDIGFkYXB0ZXIgaW5zdGFuY2UNCj4gPiAr
ICogQGRldjrCoMKgwqDCoCBwb2ludGVyIHRvIGRldmljZSBzdHJ1Y3QNCj4gPiArICogQGkyY19i
YXNlOsKgwqDCoMKgwqDCoMKgIHBjaSBiYXNlIGFkZHJlc3Mgb2YgdGhlIEkyQyBjdHJsZXINCj4g
PiArICogQGkyY194ZmVyX2RvbmU6IHVzZWQgZm9yIHN5bmNocm9uaXNhdGlvbiBiZXR3ZWVuIGZv
cmVncm91bmQgJiBpc3INCj4gPiArICogQGZyZXE6wqDCoMKgIGZyZXF1ZW5jeSBvZiBJMkMgdHJh
bnNmZXINCj4gPiArICogQGZsYWdzOsKgwqAgaW50ZXJuYWwgZmxhZ3MgdG8gc3RvcmUgdHJhbnNm
ZXIgY29uZGl0aW9ucw0KPiA+ICsgKiBAaXJxOsKgwqDCoMKgIGlycSBudW1iZXINCj4gPiArICov
DQo+IA0KPiA+ICsNCj4gDQo+IERpdHQuDQoNCldpbGwgdGFrZSBjYXJlIG9mIHRoaXMgaW4gdXBj
b21pbmcgcGF0Y2gNCg0KPiA+ICtzdHJ1Y3QgcGNpMXh4eHhfaTJjIHsNCj4gPiArwqDCoMKgwqAg
c3RydWN0IGNvbXBsZXRpb24gaTJjX3hmZXJfZG9uZTsNCj4gPiArwqDCoMKgwqAgYm9vbCBpMmNf
eGZlcl9pbl9wcm9ncmVzczsNCj4gPiArwqDCoMKgwqAgc3RydWN0IGkyY19hZGFwdGVyIGFkYXA7
DQo+ID4gK8KgwqDCoMKgIHZvaWQgX19pb21lbSAqaTJjX2Jhc2U7DQo+ID4gK8KgwqDCoMKgIHUz
MiBmcmVxOw0KPiA+ICvCoMKgwqDCoCB1MzIgZmxhZ3M7DQo+ID4gK307DQo+IA0KPiBJIGhhdmUg
bGFjayBvZiB0aW1lIHRvIGZpbmlzaCByZXZpZXcsIGJ1dCB5b3UgYWxyZWFkeSBoYXZlIGVub3Vn
aCBmb3IgdGhlIG5leHQNCj4gdmVyc2lvbi4NCj4gDQo+IC4uLg0KPiANCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0cmFuc2ZlcmxlbiA9IG1pbigodTE2KShT
TUJVU19NQVNUX0JVRl9NQVhfU0laRSAtIDEpLA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
bWFpbmluZ2J5dGVzKTsNCj4gDQo+IG1pbl90KCkNCg0KT2theSwgV2lsbCByZXBsYWNlIG1pbiB3
aXRoIG1pbl90DQoNCj4gLi4uDQo+IA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KHJlbWFpbmluZ2J5dGVzIDw9IHRyYW5zZmVybGVuICYmIChpMmMtPmZsYWdzICYNCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSTJDX0ZMQUdTX1NU
T1ApKQ0KPiANCj4gU3RyYW5nZSBpbmRlbnRhdGlvbi4NCg0KT2theSwgV2lsbCB0YWtlIGNhcmUg
b2YgaW5kZW50YXRpb24gaW4gdXBjb21pbmcgcGF0Y2gNCg0KPiAuLi4NCj4gDQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAvKg0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
IHdhaXQgZm9yIHRoZSBETUFfVEVSTSBpbnRlcnJ1cHQgYW5kIGlmIHRoZSB0aW1lciBleHBpcmVz
LA0KPiA+IGl0IG1lYW5zDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogdGhlIHRy
YW5zYWN0aW9uIGhhcyBmYWlsZWQgZHVlIHRvIHNvbWUgYnVzIGxvY2sgYXMgd2UgZGludA0KPiA+
IGdldA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHRoZSBpbnRlcnJ1cHQNCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4gDQo+IFlvdSByZWFsbHkgaGF2ZSB0
byBnbyB0aHJvdWdoIGFsbCBjb21tZW50cyBhbmQgZml4IGdyYW1tYXIsIGV0Yy4NCg0KT2theQ0K
DQo+IC4uLg0KPiANCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRpbWVfbGVmdCA9IHdh
aXRfZm9yX2NvbXBsZXRpb25fdGltZW91dA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoJmkyYy0+aTJjX3hmZXJfZG9uZSwNCj4g
PiBtc2Vjc190b19qaWZmaWVzKFBDSTFYWFhYX0kyQ19USU1FT1VUKSk7DQo+IA0KPiBTdHJhbmdl
IGluZGVudGF0aW9uLg0KDQpPa2F5LCBXaWxsIHRha2UgY2FyZSBvZiBpbmRlbnRhdGlvbg0KDQo+
IC4uLg0KPiANCj4gPiArwqDCoMKgwqAgaTJjX2RlbF9hZGFwdGVyKCZpMmMtPmFkYXApOw0KPiAN
Cj4gQ2FuJ3QgeW91IHVzZSBkZXZtXyB2YXJpYW50Pw0KDQpPa2F5LCBJIHdpbGwgdXNlIGRldm1f
IHZhcmlhbnQNCg0KPiAuLi4NCj4gDQo+ID4gK8KgwqDCoMKgIHBjaTF4eHh4X2kyY19zaHV0ZG93
bihpMmMpOw0KPiANCj4gRG8geW91IHJlYWxseSBuZWVkIHRoaXMgaW4gLT5yZW1vdmUoKT8gSSB3
b3VsZCBleHBlY3Qgc29tZXRoaW5nIGluDQo+IHRoZSAtPnN1c3BlbmQoKSAvIC0+c2h1dGRvd24o
KS4NCg0KcGNpMXh4eHhfaTJjX3NodXRkb3duIEFQSSB3aWxsIHJlc2V0IHRoZSByZWdpc3RlcnMg
dGhhdCBhcmUgc2V0IGFzIHBhcnQgb2YNCnBjaTF4eHh4X2kyY19pbml0LiBTbywgdGhpcyBBUEkg
aXMgcHJlc2VudCBpbiAtPnJlbW92ZSgpIGFuZCBub3QgaW4gLT5zdXNwZW5kKCkNCmNhbGxiYWNr
DQoNCg0KVGhhbmtzLA0KVGhhcnVuIEt1bWFyIFANCg0K
