Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB6F75AFBAB
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 07:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiIGFXV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 01:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiIGFXU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 01:23:20 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042EA7F276;
        Tue,  6 Sep 2022 22:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662528197; x=1694064197;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=By68b2dELZem9zObVAjkzG2h0U98qk1bv/L9iXhSCqc=;
  b=aqxW7niAkQw7bEg9kULa4m0DXwXl6nyC8jQr60oMddwNsAPymseN+IcF
   U1sVUl3iuwsCYR1FDa1lNgORni/uwH8GuVP68fUyByvQmbWqbrYla7H6a
   MZlAgDaalNnnjyW1UZnm1zhRQBu0e1fwjqvPQWNI81UPmZzSwWdFN0to8
   IMiQnAEe1oZyv71paOCG8gMWyUMl9HmQfmfX1py9RtllbV1dcw+FUBrnO
   1LhrrTPbjzWXBlhnv8c6m8D9D18vICfFXuS3oPY8ZPh2dV1Bw7z/WhCoo
   XlO8vHA8g2X0xx1ZCLS5NUxvB91ivhFOXJVC8ZyCRR6+R7VZP8ph3CV4s
   w==;
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; 
   d="scan'208";a="112489090"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Sep 2022 22:23:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 6 Sep 2022 22:23:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 6 Sep 2022 22:23:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kukC8j1KyIM6LWUnZM291wpExz6ro73DEsPeIDMy+bLd22ln5n+uAy86lq2Yox6z7SF8/JRbTy4OZlBIo193cDucM8NXfe59MDvgoVSnb9i8zVhQa18BvCnvIXEdt1RtnHKiqpSu2K1NMW4NZXKnXg5WhsAKf3HQz89DQojxUXeDbnGQrCa6SYl+f6CQi6S3XbJ2xL3DX572GBd70NdDYYb9mEHEFvreO8krTZl0T3EW2v/vwTgCkHKlNRrG1ps5i/Qan84lvlNiR5PLHEdveGhXT3D6+4YThI+S1parpjD4527PhbL0Y2zM2JgXuH9FB4rG+byKK7acof3jzHON5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=By68b2dELZem9zObVAjkzG2h0U98qk1bv/L9iXhSCqc=;
 b=BWUZPS6x4R+InrxUErlKWqKPIXrCD4kTx1feXQOm4HiLaQImvMMZjMNDVz6ku4Bt6/0kae2ZXpPaiktabmGM87xfj4jX8JA4RnDKPOsc5JJYUo/1Bdexja0tQ+5SKazlFT9IqDuhQEZHVH0TF4QjQSYtBwkQ9nVCCqHUZQAv3zfs3gjbc6bGmv4LXW8TdbRyW0zEYG/mYLcQd59vM/kUpKrvCjuIEgAg3N4gDcg3a0dLyjjPqhy94C4ChtRsK0nRPRx5cEgNQhCc7XT0CR7gau0cnLsHc2nLjAVXffXSz1hnXQfw+MGHaW93aDVts78wOLTKaIwaXsjiV6ZLhxZsZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=By68b2dELZem9zObVAjkzG2h0U98qk1bv/L9iXhSCqc=;
 b=CUr3mgXuHWE4i10QZNFwWXe0dwY0Nw8jAxliF1IkPtzVJnf+j5uXt03l9k9x3gK+wfXOD0emYOVO4w+hF5yoanhYszVBaWqVttkPEfT3KKZbD6lVpWstmS+HfDnPEZ5Zb1xDrT1IPIc7sPCDgpJ3akoP7ukI7X8SXq2qEcdRWpc=
Received: from PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5)
 by CO6PR11MB5604.namprd11.prod.outlook.com (2603:10b6:303:138::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 7 Sep
 2022 05:23:14 +0000
Received: from PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::61bf:18d5:c7e7:f89c]) by PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::61bf:18d5:c7e7:f89c%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 05:23:14 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <andriy.shevchenko@linux.intel.com>
CC:     <UNGLinuxDriver@microchip.com>, <wsa@kernel.org>,
        <krzk@kernel.org>, <sven@svenpeter.dev>, <robh@kernel.org>,
        <semen.protsenko@linaro.org>, <linux-kernel@vger.kernel.org>,
        <jarkko.nikula@linux.intel.com>, <olof@lixom.net>,
        <linux-i2c@vger.kernel.org>, <jsd@semihalf.com>, <arnd@arndb.de>,
        <rafal@milecki.pl>
Subject: Re: [PATCH v3 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Topic: [PATCH v3 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Index: AQHYwdpQ6HzuNz4DtkGtBXLrXymkfa3Sfn0AgADyDQA=
Date:   Wed, 7 Sep 2022 05:23:13 +0000
Message-ID: <dba2331ab6a8eac3d625034aa53e379846c1932a.camel@microchip.com>
References: <20220906102057.679839-1-tharunkumar.pasumarthi@microchip.com>
         <YxdgCmj+Xr23V4v/@smile.fi.intel.com>
In-Reply-To: <YxdgCmj+Xr23V4v/@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6336533c-8395-40d3-4d72-08da9091100e
x-ms-traffictypediagnostic: CO6PR11MB5604:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mdbWTv0HkoXIuiSXVqZ/SaPgWhTCxm3SZF0Ii38/D6F6OHtz/GayvEenqQueMG9HZnbR2HxHM8+D51r5+s3LXKhDmiuTupCKRXdw4j/LWxnwgGGkTg2VutPbWkPsyTylzJptgWhoUVQL/fRQ+4a2EvjfrttiOmIx9/9+auYtEjunrqRX2o2UKeYqqNW974XsSxtjfeG21MJ/3GdibDks8LR/G/b6wyEJb4O9SQArRU9pO9SBjXK1ZK+e1oc8czIfc54lqdHY36ZP94awywqyleF6y3fsDUzXdAa45phFWpZAAHm6n4Rsm41s2VhbTjHQGuB7Zz7qYL+o9JGUqeE5tuB6nloZ8RsSlNSzyDIk+SgeghV9Xa55CaJHRlxeKmv2gOy7wzYlvCc/Qx1NblMPoupMuoJzHdiC93TP/Y89GkMBBwrtWJs4m/MfHtydoMc1KtyWPHtFv7P1reNXo7manQmVyrhaPUqiH1lsFRyTanaX7hyDF7ezaedZRxhe7IGVvHwFFspYT/oBDHRuRz71oBxeLe8RfatXGVzXu8YRC+HvsPfce2muL/UWUxmhv0st2YmaMY3+SdwyUNetBgFuAPmpHa7n7WOEH5je1DB9wS3Th/gcy5OZu9tY5gLqSnoAo+EiEdSqjTseiCw4tLmFYS7eTVKBf/md4enAOlRd+AIXpVUCJ2twjCzRs6mV5SusJnWfTXI3KAEERF35j+Wq1DitgUdjJGrq3B3iRnuCngbcyHPa+Hc8xDIrMd0gag1G7jKv1bd/p3ah07u5m8kRKv7ZoW6Jaoq14M+hBhgOvcIabkHRaUVKC7y3Jov31tkj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5096.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(366004)(376002)(396003)(346002)(83380400001)(54906003)(316002)(6916009)(71200400001)(2616005)(36756003)(86362001)(186003)(6506007)(8676002)(4326008)(8936002)(66446008)(7416002)(64756008)(38070700005)(66946007)(5660300002)(41300700001)(76116006)(91956017)(66556008)(66476007)(38100700002)(26005)(6486002)(2906002)(6512007)(478600001)(122000001)(32563001)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkZ4a25FZ1ZwT2xlZURxL3g4MFhLeE9mYXkzRHBLelJ2OFNGTlcvd0xlQW9R?=
 =?utf-8?B?MWt3ZEdManFVVmtwVnd5Z3pkOS82ODlNUDdMMER4ay9va2RXazdTbzRvY01Q?=
 =?utf-8?B?WmVZdlIyU3NVdkpGc3ZyT09mbDlCUEkrckdFc0Z1VzNvdk00dDZDSitzNEht?=
 =?utf-8?B?eHlCUXNzREtkaHRJS3JGTUh3ek9QTXZQaFFXT2xiWXZNRC93dm5qMzJUd1E4?=
 =?utf-8?B?dFRkSEoydTNlL1ZGMXVORGVUcmliei9WVlEyTjBIN1pnRW1OSzJRaGdRWUF4?=
 =?utf-8?B?WmJ0YzJScFRRSXRoWEFZNGFWQWg3bjFySGVqekx1TEpnd3Z6UzFjQ3B4SDBT?=
 =?utf-8?B?R3dvOXlGQklyOTR0c2hMQlZSbU1uZ2Rvc1pOaWpOcEtlL3I0SDdtUGJjVHJW?=
 =?utf-8?B?TVNiekZjSHdsZFgzMC9JaTlqQUl0eU5BbENPVVNud3BNSHNERDFLTTNjZW5k?=
 =?utf-8?B?NTNodzZDQzZ3cGFBSGFiM3pIMGRvUkVRUWQxWFFlVWdCOWJxeGtRaTNJYUtP?=
 =?utf-8?B?d05ZNk9ESm9kVjBRYitydTIxQ0xBT0FuYmZ0eXlwV3VPWHo3WVRJeHdDcVFW?=
 =?utf-8?B?WjFmYlNmUDQzZWY5aGVKNUo1UzdqMlBIa3hwclBjaGljYXAwVCtFZTJKU3E4?=
 =?utf-8?B?RExLVHhGaFNIRHdMaVNsVnU5TWQ3NzQvN2MxZzA1V0hJckYvS0VGaHFqL1Uz?=
 =?utf-8?B?QjRSNTRTYXJiSUEycHcwSjhZdWxqVDVvSGVOZnJycjVUeVJpcVlZYWJ5K3RL?=
 =?utf-8?B?S3hlQ0ZvR2ZmQlpMeGZsbytKR3FDbjlSbWRVQ3YraDRBZCt1cmpDMFpjZVBP?=
 =?utf-8?B?bURIZUhLVlpyMnpPd0JqanVSVmV2ODRMajdKRmhFblJNTXpEcHFVQ2pxeVVp?=
 =?utf-8?B?QnJnRmx1YkRQMDdLMm9Cd1N4UWFVNC85WHZidU1FWDBnM21ZcHFRZ3FiTk1n?=
 =?utf-8?B?YW1mMkJwNDk0eWwxMW1qUnM4cmR2aWJEeDFkRHNJOGJlT1pCTGE2YW02OWQ4?=
 =?utf-8?B?S3pEeWhUWkVFVzZTbG1FNDBhWW1DTG9HUVB4SlgwZmc2Q0NJQlo3Skt3Q2xV?=
 =?utf-8?B?a05JZWswYkUxMHd3S1pLU2JvZmxxQjhZdWlvV1BvYW9LaE5adEVkYkh4bG5M?=
 =?utf-8?B?TXIzNXVzYmJkZXRwQTRQamwvYWpSWUZyYTFxWkRNUlBvU1ZadENiM2VzTG1n?=
 =?utf-8?B?c3BtQ1h5Tkk4TjJTdURNVkdxeHpXU21pQURZanE3Y2t5RHF3VS9Sd0FsOGZi?=
 =?utf-8?B?M0NhM2lHaG5HUUY1NWVJZWlwaU5vQ1ZNRURPOFJCb2gzQ0RBaWwxOXRKYTVa?=
 =?utf-8?B?RWJWZktNcjk3K0M0Y2VTb1Z4QTdsamhydy9JTWJaWTJpZW1kUUZMMXFzNEJk?=
 =?utf-8?B?N3J0VGhCUCtJaG9yQXZCT3Bjcm4zMFQybmUzOEtwNUZ6UTF2dmh6KzJBK1hT?=
 =?utf-8?B?M2NEcm0zR0l2b25DOVFNSGs5VTVwejZTRzZpZFlHNWwvL0JnbWRFN0IreGRJ?=
 =?utf-8?B?ZVVaNzVCZnZFTW9sWHcvS1FTYkc3dEhuVThUeit0bllNeUp3NGhHRE8wSWhC?=
 =?utf-8?B?YnZLRE1WMUVDZjBoNThCYldhNWUyYTdXaEZMUUJuajRucGVKbndMcEFCRkF5?=
 =?utf-8?B?akVzbTRYY3F2bW9vYWtiWlBzQnZqZGF6eU1MUVlzdlVWVk1tNnhlS0d5Rkdh?=
 =?utf-8?B?UHZqUUV4TThtdHhtS1N3ZkZtbVkvWjY1eEFXa3ZlUHpjRENzbFVPWDE3VHdP?=
 =?utf-8?B?S29hRFJRamZLUHR0d3A5WWppWXJSMm55VHI1U05HTDJ5QzB0MWhaUDZhbkJQ?=
 =?utf-8?B?SEprRFFrQVpiQzUwLzVCTWNpUVJ2dFdRbXFPaXI4UFpEb0s1VGhOQ2ZFVHJB?=
 =?utf-8?B?R2RWQ2ZQYmhGcEdpY3VNVEJ0RW5uSDc5TU5lSnFlSldhc1pnNzk4UGVtZ2cy?=
 =?utf-8?B?a2pWTDBUeHJ6WXQyVStreVdieEdVK1VoYVY1aWE0Qk5jeU5sbUZwVlV0Qm80?=
 =?utf-8?B?bC8wRXoxNzMxZG1LU2xzSFV4ZGh3V2s3dFkvUWVoSjhuQ0ZFL3hZWTM4blBU?=
 =?utf-8?B?RE5rZGJaRlQ1cFhHT0JFMXkwY1ovUm5MRWlHbW1mSlJ0SndWS2k0L2swT2x0?=
 =?utf-8?B?RmE2TVlDeUtjYlJMblA5NFNQRjJ0L1B2ZTB4bElTcWpHWW9PQkxpK2FjZGh2?=
 =?utf-8?Q?lv/iZ7JsHTatIg65R3Qd949zb7nG1TmvH65Q2Yy1wc0x?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <911325B7C1D197459D4E0DDFF923DB65@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6336533c-8395-40d3-4d72-08da9091100e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 05:23:14.0064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iLxKfY/LvHzLlGeku30jyQU0FRKLOhGE7YCQfJUykPLPyaqo6AyZsbFN2n7ICKyRqRf4C/527Imdt7Fx6v6PgDDd5YkiutQpgsavV7WfZZCHn1Rj43G8RJDi18vZcUSE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5604
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIyLTA5LTA2IGF0IDE3OjU4ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gKyBiaXRzLmgKPiArIHR5cGVzLmgKCk9rYXkuIEkgd2lsbCBjaGVjayBhbmQgaW5jbHVkZSB0
aGVzZSBoZWFkZXIgZmlsZXMuCgo+IFNvLCBiYXNpY2FsbHkgaXQncyBsaWtlIHRoaXM6Cj4gCj4g
wqDCoMKgwqDCoMKgwqAgdm9pZCBfX2lvbWVtICpicCA9IGkyYy0+aTJjX2Jhc2UgKyBTTUJVU19N
U1RfQlVGOwo+IAo+IMKgwqDCoMKgwqDCoMKgIGlmIChzbGF2ZWFkZHIpCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlYihzbGF2ZWFkZHIsIGJwKyspOwo+IAo+IMKgwqDCoMKg
wqDCoMKgIGlmIChidWYpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lbWNweV90
b2lvKGJwLCBidWYsIHRyYW5zZmVybGVuKTsKPiAKPiA+ICt9CgpPa2F5LiBJIHdpbGwgdXBkYXRl
IGNvZGUgbGlrZSB0aGlzLgoKPiAuLi4KPiAKPiA+ICtzdGF0aWMgdm9pZCBwY2kxeHh4eF9pMmNf
cmVzZXRfY291bnRlcnMoc3RydWN0IHBjaTF4eHh4X2kyYyAqaTJjKQo+ID4gK3sKPiA+ICvCoMKg
wqDCoCB2b2lkIF9faW9tZW0gKmJwOwo+IAo+IEluIGFsbCB0aGVzZSBoZWxwZXJzIGRvIGxpa2Ug
YWJvdmU6Cj4gCj4gwqDCoMKgwqDCoMKgwqAgdm9pZCBfX2lvbWVtICpicCA9IGkyYy0+aTJjX2Jh
c2UgKyBTTUJVU19DT05UUk9MX1JFR19PRkY7Cj4gCj4gSXQgd2lsbCB1bmxvYWQgY29kZSBmcm9t
IGR1cGxpY2F0aW5nIG5vaXNlLgoKT2theQoKPiAuLi4KPiBXaHkgbm90IHBvc2l0aXZlIGNvbmRp
dGlvbmFsPwo+IAo+IMKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPT0gLUVQRVJNKSB7Cj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC4uLgo+IMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC4uLgo+IMKgwqDCoMKgwqDCoMKgIH0KPiAK
Ck9rYXksIEkgd2lsbCBjaGFuZ2UgY29kZSBsaWtlIHRoaXMuCgo+IC4uLgo+IAo+ID4gK8KgwqDC
oMKgIC8qCj4gPiArwqDCoMKgwqDCoCAqIEVuYWJsZSBQdWxsdXAgZm9yIHRoZSBTTUIgYWxlcnQg
cGluIHdoaWNoIGlzIGp1c3QgdXNlZCBmb3IKPiAKPiBwdWxsLXVwCgpPa2F5LiBJIHdpbGwgbW9k
aWZ5IGxpa2UgdGhpcy4KCj4gCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRyYW5zZmVy
bGVuID0gbWluX3QodTE2LCByZW1haW5pbmdieXRlcywKPiA+ICh1MTYpU01CVVNfQlVGX01BWF9T
SVpFKTsKPiAKPiBtaW5fdCAobm90ZSAndCcgcGFydCkgZG9lcyB0eXBlIGNhc3RpbmcgZm9yIHlv
dSwgbm8gbmVlZCB0byByZXBlYXQgdGhpcy4KPiAKCm9rYXkuCgo+IC4uLgo+IAo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoKGNvdW50ICsgdHJhbnNmZXJsZW4gPj0gdG90YWxfbGVu
KSAmJgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIChpMmMtPmZsYWdzICYgSTJDX0ZMQUdTX1NUT1ApKSB7Cj4gCj4gQnJva2VuIGlu
ZGVudGF0aW9uIChhbGlnbiAoIHVuZGVyICggaW4gdGhlIHNlY29uZCBsaW5lKQoKT2theS4KCj4g
Cj4gLi4uCj4gCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRpbWVfbGVmdCA9IHdhaXRf
Zm9yX2NvbXBsZXRpb25fdGltZW91dAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICgmaTJjLT5pMmNfeGZlcl9kb25lLAo+IAo+IFdo
eSB0aGlzIG9uIGEgc2VwYXJhdGUgbGluZT8gSm9pbiB0aGVtIHRvZ2V0aGVyLgoKT2theS4gSSB3
aWxsIGpvaW4uCgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2Ugewo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtY3B5X2Zyb21pbygmYnVm
W2NvdW50XSwgYnAgKyBTTUJVU19NU1RfQlVGLAo+ID4gdHJhbnNmZXJsZW4pOwo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gCj4gSG1tLi4uIGNvdW50IGluIHRoZSBzZWNvbmQgY2Fz
ZSBiZWNhdXNlIHdlIG1heSBub3Qgd3JpdGUgYWxsIGluIG9uZSB0cmFuc2Zlcj8KClllcy4gSGFy
d2FyZSBzdXBwb3J0cyB0cmFuc2ZlcnJpbmcgMTI4IGJ5dGVzIGF0IGEgdGltZS4KCj4gLi4uCj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGViKDB4MDAsIGJwICsgU01CX0NPUkVfQ01E
X1JFR19PRkYxKTsKPiAKPiAweDAwIC0tPiAwCgpPa2F5LgoKPiAoYmVsb3cgYXMgd2VsbCkKCk9r
YXkuCgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHJhbnNm
ZXJsZW4gPSBtaW5fdCh1MTYsICh1MTYpU01CVVNfQlVGX01BWF9TSVpFIC0gMSwKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJlbWFpbmluZ2J5dGVzKTsKPiAKPiBObyBjYXN0aW5ncy4KCk9rYXku
Cgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHJhbnNmZXJs
ZW4gPSBtaW5fdCh1MTYsICh1MTYpU01CVVNfQlVGX01BWF9TSVpFLAo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmVtYWluaW5nYnl0ZXMpOwo+IAo+IERpdHRvLgoKT2theS4KCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZW1haW5pbmdieXRlcyA8PSB0cmFuc2ZlcmxlbiAmJgo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIChpMmMtPmZsYWdzICYgSTJDX0ZMQUdTX1NUT1ApKQo+IAo+IEluZGVudGF0aW9uIG5lZWRz
IHRvIGJlIGZpeGVkLgoKT2theS4gSSB3aWxsIGZpeCBpbmRlbnRhdGlvbgoKPiA+ICsKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlYihDT01QTEVUSU9O
X01OQUtYLCBpMmMtPmkyY19iYXNlICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFNNQl9DT1JFX0NPTVBMRVRJT05fUkVHX09GRjMpOwo+IAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGViKENPTVBMRVRJT05fTU5BS1gsCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGkyYy0+aTJjX2Jhc2UgKyBTTUJfQ09SRV9DT01QTEVUSU9OX1JFR19PRkYzKTsKPiAKPiBs
b29rcyBiZXR0ZXIuCgpPa2F5LiBJIHdpbGwgY2hhbmdlIGNvZGUgYXMgc3VnZ2VzdGVkLgoKPiAK
PiA+ICvCoMKgwqDCoCAub3duZXLCoCA9IFRISVNfTU9EVUxFLAo+ID4gK8KgwqDCoMKgIC5uYW1l
wqDCoCA9ICJQY2kxeHh4eCBJMkMgQWRhcHRlciIsCj4gCj4gV291bGRuJ3QgUENJMXh4eHggbG9v
ayBiZXR0ZXI/Cj4gCgpZZXMuIEkgd2lsbCB1c2UgUENJMXh4eHguCgo+ID4gK8KgwqDCoMKgIC5h
bGdvwqDCoCA9ICZwY2kxeHh4eF9pMmNfYWxnbywKPiA+ICt9Owo+IAo+IC4uLgo+IAo+ID4gK8Kg
wqDCoMKgIGRldmljZV9zZXRfd2FrZXVwX2VuYWJsZShkZXYsIFRSVUUpOwo+ID4gK8KgwqDCoMKg
IHBjaV93YWtlX2Zyb21fZDMocGRldiwgVFJVRSk7Cj4gCj4gV2hhdCdzIFRSVUU/IFdoeSB0cnVl
IGNhbid0IGJlIHVzZWQ/CgpJIHdpbGwgdXNlIHRydWUuCgo+IC4uLgo+IAo+ID4gK8KgwqDCoMKg
IHN0cnVjdCBwY2kxeHh4eF9pMmMgKmkyYzsKPiA+ICvCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpk
ZXY7Cj4gPiArwqDCoMKgwqAgaW50IHJldDsKPiA+ICsKPiA+ICvCoMKgwqDCoCBkZXYgPSAmcGRl
di0+ZGV2Owo+IAo+IFRoZSBpZGVhIGlzIHdoZW4gd2UgMTAwJSBrbm93IHRoYXQgdGhlIGRlcmVm
ZXJlbmNlIGlzIG9rYXkgYW5kIGNhbid0IGZhaWwsIHdlCj4gbW92ZSBhc3NpZ25tZW50cyBsaWtl
IHRoaXMgdG8gdGhlIGRlZmluaXRpb24gYmxvY2sgYWJvdmUsIG90aGVyd2lzZSwgd2hlbiBhbgo+
IGFkZGl0aW9uYWwgY2hlY2sgaXMgbmVlZGVkLCB3ZSBrZWVwIHRoZSBhc3NpZ25tZW50IGNsb3Nl
ciB0byBpdHMgZmlyc3QgdXNlcgo+IChjb25kaXRpb25hbCkuCgpPa2F5LgoKPiA+ICvCoMKgwqDC
oCByZXQgPSBwY2ltX2lvbWFwX3JlZ2lvbnMocGRldiwgQklUKDApLCBwY2lfbmFtZShwZGV2KSk7
Cj4gPiArwqDCoMKgwqAgaWYgKHJldCA8IDApCj4gCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAtRU5PTUVNOwo+IAo+IFdoYXQncyB3cm9uZyB3aXRoCj4gCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4gCgpZZXMsIHJldHVybiByZXQgY2Fu
IGJlIHVzZWQuIEkgd2lsbCBjaGVjayBhbmQgdXNlIGl0LgoKCgpUaGFua3MsClRoYXJ1biBLdW1h
ciBQCg==
