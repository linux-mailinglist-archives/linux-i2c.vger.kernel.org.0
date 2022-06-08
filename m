Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 086675426BD
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jun 2022 08:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbiFHGxh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jun 2022 02:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349239AbiFHF6w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jun 2022 01:58:52 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0879B3151E7;
        Tue,  7 Jun 2022 21:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654662843; x=1686198843;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Cnnq64KhMbDQY/s7xdXnwwkm1WhMhB4r2RibOZODg3w=;
  b=SNMv3kDNKOd4RhZs7oqIpwyiZBetqDq1eSx9FfCqDmgtKy0zy4w6WARA
   r3XaiBAqM2LG4i87eDYeHFKYEZyDhhK/eiR0yC+QlUaEBTlYZc8zgDgri
   QpGxj1ba21IXKD/KsxTLnywsVd6MnytXLeTP7hbmsxbWb0iiowGgghwgi
   XdJy/LXAHaiDOA+QpwQVdRlaZSQ4LLMYTn66qnKQwtjbzQBuuIyHlZSNQ
   GsTeeI3SIS3JH1Fqf9xU5zpfF+yWhLTwcgmte07mYVn7O/Fo5wj+tUxMt
   H3Bhn3ZEvnwe+Mp6X5u/Rfda8LDrjY0Wyp9HroBh8/Nibsk0f3jYmHfbQ
   g==;
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; 
   d="scan'208";a="99045071"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jun 2022 21:34:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 7 Jun 2022 21:33:59 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 7 Jun 2022 21:33:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jczv1mZR2feBSTeJ7w67dlyXlcCyRrQyjFah+AmGZbuhz+E9RKMPmD9+RzUHlVDqhckMmek98XW4E/pADac8rIlr8bGoeW0GO70kg1EsPE3N9pJ6O+pm0AgDu446ubUC4L1TFcgbBqVnXj0XSzOdOQYGVrxEetPYlQBaagbx6LpN2f/frOGKK+t8QPJgOytgFt3tOYoTKyzlxla+LpUgdIesQRD0vWz+sujqMbkcWLXtEjgV+QhLSWR6Tk5HdtAECRxlD5+jKNH6IxMed0Fp3xGz/nRTwvWFzwPDmJWKzybtqAPyoQk4QrH53fWHwsXqFd/7mwlWY3qL8rxtJ8fGIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cnnq64KhMbDQY/s7xdXnwwkm1WhMhB4r2RibOZODg3w=;
 b=Qv7sihLXGE8MWsfY7cyIN4xnVWBMiLDkYraBqJEelTkhzKpt/yvTFhCNn2do3y9pONZ/gyWeDKrGz28jt1NGCxa45PtM/Z0p+9PQFPFXfbsCFVSI22HxDQJGVVRpyIQIjWnENblllLtw/GuFCZA8NcY0WPsrr9CHx7nmrWsJwojIH9JdXEv3nEkrgKsixn4TZyzrAzg9LnlEmuYPWTNPqAicmZXMErgb/ADo/sQxgOk/nbaDJ/YHRyBCFBYFmcLwSy7+Ew1fXeu2ZUWmX/Mj54RkEko7FV/7dwQcg0FdbG4kTuOoF6QdA32XHuFGCwL4W6Zm4vL3XpPvbAKfIokQJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cnnq64KhMbDQY/s7xdXnwwkm1WhMhB4r2RibOZODg3w=;
 b=XiAwgs/qewuj6Zi8Q4bfutkw37UAK0gdh+VVaLp1cJVHek8rsrgZYmD4lYZum9mqhh6tBkUctSePadQsV9lIGEhx3ZjhnVv5I206Z/4BORgUu6LnYg4Lvb+US2wmGX3802gU8VgCJ6es5vhVGJGGfGIupCYPHkHCe+DEHoHhIl8=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 CY5PR11MB6486.namprd11.prod.outlook.com (2603:10b6:930:32::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.19; Wed, 8 Jun 2022 04:33:49 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::d9de:be6:d90f:392b]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::d9de:be6:d90f:392b%7]) with mapi id 15.20.5314.013; Wed, 8 Jun 2022
 04:33:48 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <u.kleine-koenig@pengutronix.de>
CC:     <alexandre.belloni@bootlin.com>, <Nicolas.Ferre@microchip.com>,
        <linux-crypto@vger.kernel.org>, <kernel@pengutronix.de>,
        <Claudiu.Beznea@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] crypto: atmel-ecc - Remove duplicated error reporting in
 .remove()
Thread-Topic: [PATCH] crypto: atmel-ecc - Remove duplicated error reporting in
 .remove()
Thread-Index: AQHYevDyjU6JcDefx0Gz4UCefFNvBQ==
Date:   Wed, 8 Jun 2022 04:33:48 +0000
Message-ID: <fd8d1ca1-b6fa-ecb9-ba71-80449af59a9a@microchip.com>
References: <7ffd4d35-938a-3e82-b39b-92e76819fa92@microchip.com>
 <20220520172100.773730-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220520172100.773730-1-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc409f33-21c6-4098-6e6c-08da49081511
x-ms-traffictypediagnostic: CY5PR11MB6486:EE_
x-microsoft-antispam-prvs: <CY5PR11MB6486BD5CBE75CE302B89DDA6F0A49@CY5PR11MB6486.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sHLo9F/IDjBd0VG25r6KloZ/F6MVvEtZJ9BTzOOSBLfAivkp+j65UO0iFomXz/lJ3qt+YB7i1XINNsRXPKGRpj4Jkte+RhgB97ytFBHCB2nhW1ze9xVDyD7KrZFiQO6+RI5jpNGbAbBFGLa1UgTC0T/BwVZagK+QuFA23KryGUrdmG3pyunTq0hIQJC9/fjXcLIdixvgIRsZakA55hvNcLQDZNGppjPwC1+rSwzQy7GSFRn5ymSGO+9h72G3rChs8ifckkv7Uf7qocvG0bXcvpv0BwKZkVmlUFQmiAj+PGh5Rq26/5evSRR1Hxc2aGU/5OKJSHnaJPWmRbHI/vKxJq4XHZYslWrOE7wnkZN7yVQFOWP68tWN6QTIYTGyusd8pgfzAfs/hdsndKjsoyglOuIEczlY40urxxaju1pvRms3fGch25iTtVIn0/LwdxzakFZpC5mX1GuMEgvdrwotqpWbPbXHVuhnDery/Rlq5U+X3ZDoXWCiVgGLN301O3bjORYi8cSAT2S0kdUkzWngBJc2hm8ApZz0kxVTq1SR8jbe4rgBDCBTtMxNn0kUnIFMJEFTV1a3VzHKKfqdQ0TpyBoEOzV4ouCgIYlnLJe37WBWdVULcAVTV+yVDznDoF7B28BCgj8a5GxuXRMHqqfFIoXez470yikopUzUGoP5Ti8F5tPxDQz3hA6EyU9eGsp3QxlDThBY/Mw1qwIK+aIvsR68c1lm1WTbpr5oZR6BlHS5aoG/MZy/NKPqzG4839w9KJTnoaU5Mp18UsGpcAp9WfXAWJCJMGfgbmQo9vu0o38=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(66574015)(26005)(71200400001)(5660300002)(508600001)(122000001)(83380400001)(186003)(2906002)(316002)(8936002)(6486002)(6512007)(38100700002)(54906003)(6916009)(4326008)(8676002)(64756008)(6506007)(31686004)(86362001)(91956017)(53546011)(76116006)(66556008)(66946007)(2616005)(66446008)(66476007)(38070700005)(36756003)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWpIZUVoaVFsM0N1RnA3Yk9seXE4WENaQUJWYmQ4UnV6aUpPclVLcDRZNGY3?=
 =?utf-8?B?V0sxL0RJYjUxSTZ1M2dseU1WalN5M01QVU53TXpHZkRNL3RYQzZBQTZQNkta?=
 =?utf-8?B?YWorYUd1SHFNdjlhQmNvYUdxcVZGMjErcC8yRUl1VUNZRUFlWSsrSmQrZGE5?=
 =?utf-8?B?NmtvM0dDUkdZbkRwSm5tc3IzUXJyMk96WlNwODdvd0UrR1psaXZTb1dxRVZX?=
 =?utf-8?B?all5Uklhd1ByR21FMUZGTWo0Q2lvOUVxeXExem1rMURUL1ZvMmg1d2ZwcHlR?=
 =?utf-8?B?VWY2cU1xcHJ3THgyU1BmTU9CVERLYTBBZnNGTU81ZTdzcmFrK3ZVbUlWaEE2?=
 =?utf-8?B?ckpqKzBoSStIRmgwMXRIcUpvc0h6Vi9UZG5zeUFLLzk1TW1paUV1cE1pYTRE?=
 =?utf-8?B?U1V2RkVudmViby8wdU9mUXdQOS9pZ1NqWlJ4UG0rcWd3QVFBK1AyL0R3QzNk?=
 =?utf-8?B?UDA3RzQ4b1FLWUN1T2hzeTd1N1ZqK2JUYVJ3VGRzQUs0MHMvUVZBSmpSK0dp?=
 =?utf-8?B?T3Jjd1plNFBKVUlLRkV0aDlISjhoZDVQeVp0NTFSdnZldGZLdVc3MjlFanky?=
 =?utf-8?B?eUM5QkJxWlB1cGN1eG82QTdsbzRnUnQ3VUxFQWtnTHVDUi9BSVAyNE1pRjBp?=
 =?utf-8?B?RFgxWi9sNVlJZU01UnduN3RaRW8yNnZVMmQzTXJ1RE9MbG5CdW1jTnYrSmNM?=
 =?utf-8?B?Y0MrelNyRkZaQnJEWFR5Ti9qb3RuRkpLN3hmODB3YUZTTXRCVWVwSWRTYjBN?=
 =?utf-8?B?N0QvOUQxWU8wbEFMMXZ1aGxGOGRXMTRZU1dzaVpRUHV6VUZoUjF0RnhEYlln?=
 =?utf-8?B?MmU1NGlVcHk5WTVNVGowOWY1S2g4SVlwYTMrMSt6NWRjYTJmUjd2SEc5ZWlx?=
 =?utf-8?B?bW5hNmtrbEsxQWpqczFXUENRWWtmNDIxUmJYU2tTUksxV0xuQzJUalVqTW4w?=
 =?utf-8?B?Ump4ZE1DeEVhYmdKcUF2K0l1QUozLzJ0ZUg5WkZXZGVtRDh0Q1lKRVJvcDBS?=
 =?utf-8?B?eXlSejBMN1U4bkxXZEJvQkJuanFnVEV0ekhPSitpcGZNeU5FRUI5MFVlOXVO?=
 =?utf-8?B?ZlAzN3JHTXh6UjJsanAxeGRaUGFTYmNHSTgra1hBbW5WL0c1RllsaFduZXJD?=
 =?utf-8?B?MGVWbmcwcEtKOWV2QUJyZ1lFMzhiUlBJL0VOZ2M1dm9hL3B5ak5TSlRmNkYy?=
 =?utf-8?B?WlI2cVFXdFh6ZUNkMXFBZzBmY3dEdmJ6dXdZM2tNOTVnUlZhTTBsWDFGRnNL?=
 =?utf-8?B?K1JpbDNramxvR2JiY3I5RU1PYVBaRERiMnlTUzlVbzE3YzJxOGl0VTMrZ04x?=
 =?utf-8?B?Nmw2aEhObytDOWVaWnNkZzM4enA0T3VycUNjeGQ2N0ZRNEZoY0w5akY0SjBh?=
 =?utf-8?B?TG5YdjhYbER1K01XQ3lDOWFaUE1oZVNlVTIxTFk3UXJuNkl2SzZHZHBqRzBr?=
 =?utf-8?B?b3pRQnJXRjZSSFVCRExKR1UrMm9qNUN2eDJtUCtMUWZvKzBPYThoeUxzSE9m?=
 =?utf-8?B?bnJFRXIrY1hrUUdqdklOQzBwQ0k2WVNiZHlTMDFYOUhWNnJYSDBSYWNvcDZk?=
 =?utf-8?B?TEVSTk14ek5VZU5wTGxyU005eTh1Y2FiNjA3WHFSVDFyUGs0VWdQR3JFNHdE?=
 =?utf-8?B?WW42U0tHWG1wdE9wQzVUbDhGRnFsU2ljYlFlRkJWQ2x2VnJpM1Q1SGxwMDdQ?=
 =?utf-8?B?bkhRS0pxcW04MURmWVVnRnR4T1JRekY2bUtEbVlvOStMSE9zbUl5Z2RkOWZ1?=
 =?utf-8?B?K0I1K0xMdU5sS2RsV3QxNUxQTUtHbHZxREl0czVNN0oyT01TaUhxYUZKYzY2?=
 =?utf-8?B?L1JKOUVkc3RhNmpya3NKbk12b2tTcDJrakFJV0c0ZHVGcUtPNWMyVHhlczUw?=
 =?utf-8?B?clU1VXV0Z1haczZOSnM0T2FHQVM4NHRYSExjTXRZUzd2Q01RbGh3c2huTEZH?=
 =?utf-8?B?ZXpQdnJCWEhDTzUrekEwd0t1SzlQZXJVUG1JZHk0T0ZTb0VDYUE0aFJEalBQ?=
 =?utf-8?B?U2plUmsxeWIxaXpON3hZQ1ltQm9qWVNnSjloclhvaWJ4NDVmTEdOTDQvUUhv?=
 =?utf-8?B?c0lSWFlRTnF1NnVCUEMySXdnY1I5MFlHUTQvczdwdERrWktLcUZtN21hbGRj?=
 =?utf-8?B?WjlqV1BmQXZhRkFmSXNQKy9hM0I3emthK1NwcmM1dkxkL3hGL014ZGFiZ2gr?=
 =?utf-8?B?cHRuVEhiUm1BZVhrTDdDOTVxMnkzSkN2bXNOUFlGamI4SzR1YVBUS1JPb0NR?=
 =?utf-8?B?emdqTll5TmEwTnVpV0djUmxiajZhVldkUjhwa3JoSi80MW5CQTVIV0p1blBX?=
 =?utf-8?B?dVUrM08vSi9sNmVZb3QvTkIzdzhUNVZtNVZkL3J2UTJvemtacUdhdUx4OUc3?=
 =?utf-8?Q?H6IjqsN6Can8XXpc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D8C05D922869F43B133D90FABEEC7CC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc409f33-21c6-4098-6e6c-08da49081511
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 04:33:48.7751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VrWlA5ATXYqYmsIfm5M3zfdh9W5ugcYiP3iCk5y+nJFfwY/0+ROrLZPuaj+KyBKTNB4YApN+cRMKOV5hq1VeXmbrP0Bv7KXeEJUseRCrmzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6486
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gNS8yMC8yMiAyMDoyMSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gUmV0dXJuaW5nIGFuIGVycm9yIHZhbHVlIGlu
IGFuIGkyYyByZW1vdmUgY2FsbGJhY2sgcmVzdWx0cyBpbiBhbiBlcnJvcg0KPiBtZXNzYWdlIGJl
aW5nIGVtaXR0ZWQgYnkgdGhlIGkyYyBjb3JlLCBidXQgb3RoZXJ3aXNlIGl0IGRvZXNuJ3QgbWFr
ZSBhDQo+IGRpZmZlcmVuY2UuIFRoZSBkZXZpY2UgZ29lcyBhd2F5IGFueWhvdyBhbmQgdGhlIGRl
dm0gY2xlYW51cHMgYXJlDQo+IGNhbGxlZC4NCj4gDQo+IEFzIGF0bWVsX2VjY19yZW1vdmUoKSBh
bHJlYWR5IGVtaXRzIGFuIGVycm9yIG1lc3NhZ2Ugb24gZmFpbHVyZSBhbmQgdGhlDQo+IGFkZGl0
aW9uYWwgZXJyb3IgbWVzc2FnZSBieSB0aGUgaTJjIGNvcmUgZG9lc24ndCBhZGQgYW55IHVzZWZ1
bA0KPiBpbmZvcm1hdGlvbiwgY2hhbmdlIHRoZSByZXR1cm4gdmFsdWUgdG8gemVybyB0byBzdXBw
cmVzcyB0aGlzIG1lc3NhZ2UuDQo+IA0KPiBBbHNvIG1ha2UgdGhlIGVycm9yIG1lc3NhZ2UgYSBi
aXQgbW9yZSBkcmFzdGljYWwgYmVjYXVzZSB3aGVuIHRoZSBkZXZpY2UNCj4gaXMgc3RpbGwgYnVz
eSBvbiByZW1vdmUsIGl0J3MgbGlrZWx5IHRoYXQgaXQgd2lsbCBhY2Nlc3MgZnJlZWQgbWVtb3J5
DQo+IHNvb24uDQo+IA0KPiBUaGlzIHBhdGNoIGlzIGEgcHJlcGFyYXRpb24gZm9yIG1ha2luZyBp
MmMgcmVtb3ZlIGNhbGxiYWNrcyByZXR1cm4gdm9pZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+DQoNClJldmll
d2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+DQoNCj4g
LS0tDQo+ICBkcml2ZXJzL2NyeXB0by9hdG1lbC1lY2MuYyB8IDEyICsrKysrKysrKystLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9jcnlwdG8vYXRtZWwtZWNjLmMgYi9kcml2ZXJzL2NyeXB0by9h
dG1lbC1lY2MuYw0KPiBpbmRleCAzMzNmYmVmYmJjY2IuLjZiYTM4Mjc1ZGU4YyAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9jcnlwdG8vYXRtZWwtZWNjLmMNCj4gKysrIGIvZHJpdmVycy9jcnlwdG8v
YXRtZWwtZWNjLmMNCj4gQEAgLTM0OSw4ICszNDksMTYgQEAgc3RhdGljIGludCBhdG1lbF9lY2Nf
cmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+IA0KPiAgICAgICAgIC8qIFJldHVy
biBFQlVTWSBpZiBpMmMgY2xpZW50IGFscmVhZHkgYWxsb2NhdGVkLiAqLw0KPiAgICAgICAgIGlm
IChhdG9taWNfcmVhZCgmaTJjX3ByaXYtPnRmbV9jb3VudCkpIHsNCj4gLSAgICAgICAgICAgICAg
IGRldl9lcnIoJmNsaWVudC0+ZGV2LCAiRGV2aWNlIGlzIGJ1c3lcbiIpOw0KPiAtICAgICAgICAg
ICAgICAgcmV0dXJuIC1FQlVTWTsNCj4gKyAgICAgICAgICAgICAgIC8qDQo+ICsgICAgICAgICAg
ICAgICAgKiBBZnRlciB3ZSByZXR1cm4gaGVyZSwgdGhlIG1lbW9yeSBiYWNraW5nIHRoZSBkZXZp
Y2UgaXMgZnJlZWQuDQo+ICsgICAgICAgICAgICAgICAgKiBUaGF0IGhhcHBlbnMgbm8gbWF0dGVy
IHdoYXQgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGlzIGZ1bmN0aW9uDQo+ICsgICAgICAgICAgICAg
ICAgKiBpcyBiZWNhdXNlIGluIHRoZSBMaW51eCBkZXZpY2UgbW9kZWwgdGhlcmUgaXMgbm8gZXJy
b3INCj4gKyAgICAgICAgICAgICAgICAqIGhhbmRsaW5nIGZvciB1bmJpbmRpbmcgYSBkcml2ZXIu
DQo+ICsgICAgICAgICAgICAgICAgKiBJZiB0aGVyZSBpcyBzdGlsbCBzb21lIGFjdGlvbiBwZW5k
aW5nLCBpdCBwcm9iYWJseSBpbnZvbHZlcw0KPiArICAgICAgICAgICAgICAgICogYWNjZXNzaW5n
IHRoZSBmcmVlZCBtZW1vcnkuDQo+ICsgICAgICAgICAgICAgICAgKi8NCj4gKyAgICAgICAgICAg
ICAgIGRldl9lbWVyZygmY2xpZW50LT5kZXYsICJEZXZpY2UgaXMgYnVzeSwgZXhwZWN0IG1lbW9y
eSBjb3JydXB0aW9uLlxuIik7DQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gICAgICAg
ICB9DQo+IA0KPiAgICAgICAgIGNyeXB0b191bnJlZ2lzdGVyX2twcCgmYXRtZWxfZWNkaF9uaXN0
X3AyNTYpOw0KPiANCj4gYmFzZS1jb21taXQ6IDMxMjMxMDkyODQxNzZiMTUzMjg3NDU5MWY3Yzgx
ZjM4MzdiYmRjMTcNCj4gLS0NCj4gMi4zNS4xDQo+IA0KDQo=
