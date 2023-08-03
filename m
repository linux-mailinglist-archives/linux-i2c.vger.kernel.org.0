Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC06B76F05A
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 19:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234671AbjHCRKn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Aug 2023 13:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233753AbjHCRKl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Aug 2023 13:10:41 -0400
Received: from CAN01-YQB-obe.outbound.protection.outlook.com (mail-yqbcan01on2129.outbound.protection.outlook.com [40.107.116.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE54A4227;
        Thu,  3 Aug 2023 10:10:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xm7/gfqv/4RgDPZI3RYmVOsJjNM6LnD2Nhi8c6fhMU06rKzYmTBkEDtfmcXTAncDEn5NFqsuTdKlW8h0BSZ4ey27N0TiW0w7veVUsUECzfAE29EdoknMw8Drg9Y8LmWvUGgO8yRi2HOPTEFs3mrpN3U7YB1cDba0I0KNbAmZmDa59vwzzTGfvKYW6qTKCR/kNmsRbENer3Hr6KJ7EyjMnOZsILcz6+np0V//n4q/H+f5pqXa1DUyotRO9kCOTTJov7Lwd9MnYJHe1qWHNxabZNHFwt0sBHRZUMyrAixpjcwSN6EFKuHSXLJjTB1ZL06DQgQgjkvLoCdZUPr5DOwacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgIq/MrrfIvSpj0V/+dUGZAl08B671VtUm9M+dgDtiY=;
 b=Cnf2G86GBAdG0xJ/z3JZPTPcsSdVIOKph9B6eqBsLW7Z4tIMBYDwn4IR9VFgWGUhgiutXg9l18m3xaYtg5AqqcJOLagvwFbi4ncz1efdOBVQKb1anOfvabqZU3j+5vgv9PszCGYbRzPjluEY4zW3fD/EgGk7/JHZvlh+zsemQ5mT50Ms+kR2gsbFn+OY1KA9ZT7H+Xy5YkLk3a598VlMI/UY/O+T76Oq2/s2KbL68KSw7fqncT8KWxmDXx53TzMpikOyCeQag26UaUA9+urGdzmOfCi6VgWoFcZc6BdN33IL3/A30C0A44Rt69tOOkhOxWZ3b5CcoCKaOzqDEl+grw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=connecttech.com; dmarc=pass action=none
 header.from=connecttech.com; dkim=pass header.d=connecttech.com; arc=none
Received: from YT1PR01MB4124.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2b::11)
 by YT3PR01MB6051.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 17:10:02 +0000
Received: from YT1PR01MB4124.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::7fe0:2f38:7134:6e7d]) by YT1PR01MB4124.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::7fe0:2f38:7134:6e7d%7]) with mapi id 15.20.6652.020; Thu, 3 Aug 2023
 17:10:02 +0000
From:   Parker Newman <pnewman@connecttech.com>
To:     Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] i2c: tegra: Fix i2c-tegra DMA config option processing
Thread-Topic: [PATCH] i2c: tegra: Fix i2c-tegra DMA config option processing
Thread-Index: AQHZxi1XxuhBoZdpFUiMCrgiycCKGw==
Date:   Thu, 3 Aug 2023 17:10:02 +0000
Message-ID: <fcfcf9b3-c8c4-9b34-2ff8-cd60a3d490bd@connecttech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=connecttech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT1PR01MB4124:EE_|YT3PR01MB6051:EE_
x-ms-office365-filtering-correlation-id: 6d4e95be-44a2-4ad5-18ab-08db944479e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nLuZxC+OReXBgkWMUlsDDpja4sY/F9ZVeKdkZwIB9qCwqcbUYE3dbLOc7Xq98HCqqgsXTiD5HUtyJKPezAqVRk2RC9s/mskAo0bmRElJk1xFu5tGyriJ7/RQnpTSOz6hua8tZLG64U87Vde8rvxuhvYmlJrRQCWZbA3YYrFRBijRL4+WYQMO0T1gOzORonyWaqojQpYU5grBOV1KcdMFYLAE0G9CpsBS+f573kP9Fbjw83ttKij4vT5phkNaDtfvzs6txuLTGkA9nzIYBIsRpdApsTjd2u5DY6OnRnCDw95NWFHAd6r4d2oYX8sQMK57xyjhswRVRSvVCkLLPXUCWOT+r1yfbZbyxs/zfrqR8RCCdQcTQSXbcbDyw7GSK1vrP6Ea7ChW1LF+Vjba+VzIyvLblGeEZimy6bfzWbsVwec1M6fgfUtM1jMxIXUF6ONwuSEovbZMOPJ/WRPlk5NgaJwftUMXY0RBxNzh1GvkFpgTLK3nScvZEjHqeTZwjcbsTxf0TWEfzcjlkMeIL2xi/P8JxbZC8jd0m63+5V5XsLhui8F/AvhznnTaZ/EdqG74mzuluW/v/mHzH/lDy2Cwzh6Ujq7Z2IS3YmAXyTrTINwsMnD/ONVXb13ZYVy1hilW5WL3OsNPch9LM0/DRjqvKw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB4124.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(39840400004)(396003)(366004)(376002)(451199021)(2616005)(6506007)(83380400001)(186003)(26005)(8676002)(76116006)(316002)(66556008)(2906002)(64756008)(66946007)(5660300002)(66446008)(66476007)(41300700001)(8936002)(6486002)(71200400001)(6512007)(110136005)(478600001)(38100700002)(122000001)(31696002)(86362001)(36756003)(38070700005)(31686004)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vk9HQlJrRFdjWG5hNW83c1lWVUZ6SytTNFp1WGxZNjF5N0wyOVZVZmFzY0pK?=
 =?utf-8?B?TDRIWExLZU9GeWhxOE9PUER6VE5MeW1sZTNTT0RCM0FyMWVUaDVUVCtKV2FD?=
 =?utf-8?B?V1VOQUViV1dlK05MSlU5ZkpWYlNQeXJmN0RpemJPdzVaRW9qQzM0eUd4bHhh?=
 =?utf-8?B?ZmduQTEwNU14NHk0YWN3bEZqSGU5Uktjd2d5MURDZ3IrdmdZK2JTYncwcVFZ?=
 =?utf-8?B?eGVBVk1uLzZJWXNaSXM2VkwxYy8wQ20vdW9TVEhIRDNLOWlrOEZaN3A2Ritq?=
 =?utf-8?B?R3Z4N3Z4YkNKQkF1K2FYU0YxZGxzTlRCNCtBSG1KZHhCQXJhdFo2cVVEUXZm?=
 =?utf-8?B?djBPUWp2NHo4T29yQlE2VWs1M2lKRUNlbDMvM3VoRWFtZGJLS3lEK3VMNlZs?=
 =?utf-8?B?VUp4V3lTRHR5SERmbHlBYm9qNGk2S053d3dtNE9JdDRNYUJUSURkRXMyYU1v?=
 =?utf-8?B?TWh6SVZEQm1Yd1kvb0FvZVNGS0tQcTNqZjZabE56Z1NsVk4yOTMrTkhWQm5u?=
 =?utf-8?B?enlJYkJaWmhVU1VrNmk4SThLK2VxRGFVbGVwMDVhY3Y4aHlvYnBWRFFLY20y?=
 =?utf-8?B?SDhCYjFXdGNhVGNGVElRcm1DVEt3TkRLcXZLWVFSMHRneHM1SlhLZUQ2NTFs?=
 =?utf-8?B?aWMyaDlCWEx6b1dIRUlnZGl3YnZUNDJYUkhtQUpnYytmZHB4SWJDZVN0OXM0?=
 =?utf-8?B?K09kK2MvMGMyZ1k4RC90eEJjcmF4Szh2UEFIY0ZxZk9teDVLLzBqdVlvOWkw?=
 =?utf-8?B?UllaWlZTTFg1V3c5bTVqOFVyMHRzbjlJVlhVa2U3T0NQRUFjTnZSTUJUbmVu?=
 =?utf-8?B?VlZITlZjVG1ZTDh6dlRxcnpBS0YyeE9JL0tLZnp0Z3FjSHRaYXNwcEpBRE95?=
 =?utf-8?B?blVUUS9RalpqeFhjbXhsOFR6ajVmNFNtQmV0ZDhscXoya2M2b2NKd2FKUEpR?=
 =?utf-8?B?N3NyZy9uTjgvTk50QTlSbjIyd2ZMN0lPL21iMXloYzBEalhuYitVVzhDdWx0?=
 =?utf-8?B?ei9xNm91eldIekRTbit6dVpOZ3FKRXlXaXY2a3BESUtTWnZra2dwV05neHE3?=
 =?utf-8?B?aisrUjVjakU0NFNJN0wvR3gxMTdka05FU2pJMTlKVitjdmxPRUYvTkF4K2V6?=
 =?utf-8?B?WkpCWmNWK2c4WVRCL2V6b2o5WUgrM29JbEtiUDhvMXNZQUVSVzROek9pYTYw?=
 =?utf-8?B?WGFRQ3RWdi8rN09kNHFKZUFyZEJHQUh5T0RGMFZaU3FKVUtlcDJzb1RXOWFn?=
 =?utf-8?B?L0hhZFZiRm9QVlJPNzlSdVFQbzNvZXJ5MUo1RUNzVjhySDNkSmVRUnNMeVBp?=
 =?utf-8?B?TkFOYjBvQjBQY2IyTXhuclF5KzRySnlKQnh0WUllekgrQ1pJRGJPci9MK2VK?=
 =?utf-8?B?QTBYWWNZL1dLS3NZdEpqcTlDSHllaGJZdncybHNvMmZmR2Q0TTNLbVRkRVov?=
 =?utf-8?B?b3JXYVRUYTNMemtuVndHQlF4QTNGcnhtU3kzZUdadXhZeVNNN0pMeUkzUFNT?=
 =?utf-8?B?aHkvL25wSEpCQ2VjYUpQT3JEMHJSVkwyL205bG0rU1phZDQzckFoOGxOaHJu?=
 =?utf-8?B?NWs0NHd1OE05VFBXS1pFTm1BUHY2dTJSb1VWL3NjczV5d2QzTC80MmVRNnI5?=
 =?utf-8?B?VFBYb0UzVURweHN4U0V3TVJjR0J4V1V6VDMveXVoYVluQmlGSkJoVlVpWVNa?=
 =?utf-8?B?QUdqa2ZWbXExcDRHVDRsUjA4L0NFNitEVXJMMEhmc2JTVVZRdTdHU01OZ3pY?=
 =?utf-8?B?Y0dIakM1STJTMU1SeGJWZ3dnYmpWYVhITUExejhwamYrRmdHTUFRTng3cXRT?=
 =?utf-8?B?alhZWGdQUmZXZ0wzZFVtQk5ubnJyaTZiMVlhL25Nc0duZXYxcEhwekdmRzgw?=
 =?utf-8?B?UkFKMENpR1luUkVWV2pwR1QwWnQzQ24wZWpTYXZMNU1oUDFKVEMrMHdqSUd2?=
 =?utf-8?B?ay9nZnJkeFN2Ymh4dWFobUNURFRDaXEwYnNLQUl6SHFBVkJFRWVqaWNiREE2?=
 =?utf-8?B?MVZPY3F3M0ZoRmhxZUNaRTlLNVBhdUdYZFduWVZpR1k3N1JpQW9wNEpFYWN5?=
 =?utf-8?B?ckduWXFHbmVNcXh2ZU9BelRSYjdVUVpaWmY4RzlxaG5SdmsvTHdQd09kS2R2?=
 =?utf-8?Q?LG4w3+0wTBGzSvN3lQP3mn1p1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFDBA9A0458C2A44BA1712BBA341F3ED@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: connecttech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB4124.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4e95be-44a2-4ad5-18ab-08db944479e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 17:10:02.6632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d33071ec-da55-4b12-8469-920f998c36b3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c872yGM8Bnca/XGIwm/+BKjik3Qi6685HA5wyzKnI0Le/pcOCv9tAsbHH/AtZKIcd1dVtAVMisKHLzQnaWRPQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB6051
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpUaGlzIHBhdGNoIGZpeGVzIHRoZSBUZWdyYSBETUEgY29uZmlnIG9wdGlvbiBwcm9jZXNzaW5n
IGluIHRoZQ0KaTJjLXRlZ3JhIGRyaXZlci4NCg0KVGVncmEgcHJvY2Vzc29ycyBwcmlvciB0byBU
ZWdyYTE4NiB1c2VkIEFQQiBETUEgZm9yIEkyQyByZXF1aXJpbmcNCkNPTkZJR19URUdSQTIwX0FQ
Ql9ETUE9eSB3aGlsZSBUZWdyYTE4NiBhbmQgbGF0ZXIgdXNlIEdQQyBETUEgcmVxdWlyaW5nDQpD
T05GSUdfVEVHUkExODZfR1BDX0RNQT15Lg0KDQpUaGUgY2hlY2sgZm9yIGlmIHRoZSBwcm9jZXNz
b3IgdXNlcyBBUEIgRE1BIGlzIGludmVydGVkIGFuZCBzbyB0aGUgd3JvbmcNCkRNQSBjb25maWcg
b3B0aW9ucyBhcmUgY2hlY2tlZC4NCg0KVGhpcyBtZWFucyBpZiBDT05GSUdfVEVHUkEyMF9BUEJf
RE1BPXkgYnV0IENPTkZJR19URUdSQTE4Nl9HUENfRE1BPW4NCndpdGggYSBUZWdyYTE4NiBvciBs
YXRlciBwcm9jZXNzb3IgdGhlIGRyaXZlciB3aWxsIGluY29ycmVjdGx5IHRoaW5rIERNQSBpcw0K
ZW5hYmxlZCBhbmQgYXR0ZW1wdCB0byByZXF1ZXN0IERNQSBjaGFubmVscyB0aGF0IHdpbGwgbmV2
ZXIgYmUgYXZhaWxpYmxlLA0KbGVhdmluZyB0aGUgZHJpdmVyIGluIGEgcGVycGV0dWFsIEVQUk9C
RV9ERUZFUiBzdGF0ZS4NCg0KU2lnbmVkLW9mZi1ieTogUGFya2VyIE5ld21hbiA8cG5ld21hbkBj
b25uZWN0dGVjaC5jb20+DQotLS0NCiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXRlZ3JhLmMgfCAy
ICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXRlZ3JhLmMgYi9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLXRlZ3JhLmMNCmluZGV4IGJjYmJmMjNhYTUzMC4uZGM2ZWQzYThkNjllIDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy10ZWdyYS5jDQorKysgYi9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLXRlZ3JhLmMNCkBAIC00NDIsNyArNDQyLDcgQEAgc3RhdGljIGludCB0ZWdy
YV9pMmNfaW5pdF9kbWEoc3RydWN0IHRlZ3JhX2kyY19kZXYgKmkyY19kZXYpDQogICAgaWYgKElT
X1ZJKGkyY19kZXYpKQ0KICAgICAgICByZXR1cm4gMDsNCg0KLSAgIGlmICghaTJjX2Rldi0+aHct
Pmhhc19hcGJfZG1hKSB7DQorICAgaWYgKGkyY19kZXYtPmh3LT5oYXNfYXBiX2RtYSkgew0KICAg
ICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX1RFR1JBMjBfQVBCX0RNQSkpIHsNCiAgICAgICAg
ICAgIGRldl9kYmcoaTJjX2Rldi0+ZGV2LCAiQVBCIERNQSBzdXBwb3J0IG5vdCBlbmFibGVkXG4i
KTsNCiAgICAgICAgICAgIHJldHVybiAwOw0KLS0gDQoyLjE3LjENCg0K
