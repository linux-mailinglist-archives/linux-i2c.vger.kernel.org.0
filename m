Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBA0821415
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2019 09:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728019AbfEQHQk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 May 2019 03:16:40 -0400
Received: from mail-eopbgr150135.outbound.protection.outlook.com ([40.107.15.135]:58865
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727871AbfEQHQk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 May 2019 03:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5exkey6CBCCYETr3xO99muN/Fb/haCpItfkuVOtshJ0=;
 b=GQpRR22Y/xFfBz9WiPCcV61RoGP9ZjS2wsnJh0TNZ4DoKWShVuK6/cS/slwVEqzh33ZocNlYvHHoLkBqIgZys5iurhQQF4lRX1pzkuScSHjgcx9ZIZBm8TBtPkc74eJCFu3Kc5uGXYaXaWf76AvQcJJ3sik70YJ312mP6FWffy4=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3355.eurprd02.prod.outlook.com (52.134.72.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 17 May 2019 07:16:33 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf%5]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 07:16:33 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH v8 1/3] i2c: core: improve return value handling of
 i2c_new_device and i2c_new_dummy
Thread-Topic: [PATCH v8 1/3] i2c: core: improve return value handling of
 i2c_new_device and i2c_new_dummy
Thread-Index: AQHVDCwzUN1ziZSANUOs/xEg/S00zqZu6IgA
Date:   Fri, 17 May 2019 07:16:31 +0000
Message-ID: <5cdbe188-6c0b-1ba9-d4a1-2d836c1e9652@axentia.se>
References: <20190516211310.22277-1-wsa+renesas@sang-engineering.com>
 <20190516211310.22277-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190516211310.22277-2-wsa+renesas@sang-engineering.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR05CA0229.eurprd05.prod.outlook.com
 (2603:10a6:3:fa::29) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0428c85a-6eba-4f81-78ce-08d6da97956e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:DB3PR0202MB3355;
x-ms-traffictypediagnostic: DB3PR0202MB3355:
x-microsoft-antispam-prvs: <DB3PR0202MB33553DA85725C294D5F6F8A2BC0B0@DB3PR0202MB3355.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(346002)(396003)(376002)(366004)(39830400003)(136003)(189003)(199004)(6512007)(2501003)(4744005)(446003)(2616005)(11346002)(53936002)(8936002)(7736002)(102836004)(66556008)(65826007)(66476007)(6436002)(64756008)(66446008)(508600001)(476003)(14454004)(64126003)(3846002)(256004)(6116002)(74482002)(486006)(73956011)(6246003)(66946007)(186003)(26005)(36756003)(229853002)(76176011)(4326008)(6486002)(31686004)(52116002)(305945005)(54906003)(86362001)(68736007)(5660300002)(2906002)(110136005)(53546011)(99286004)(31696002)(8676002)(6506007)(386003)(71200400001)(81156014)(25786009)(65956001)(65806001)(81166006)(58126008)(71190400001)(66066001)(316002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3355;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OU8hHRdsGlZ0WAVyyi9yXMBP/lZGYive3vuA98AT7QDTaDAam7SL1SKgAeVayonw7p/+hkXWsNIHJCWPXWmnUpxOoolvdRmqZqjHP5aFfRql8wu2CnS4HRArxL2kBqD4yh6L9l4B/QbP15ELOZxQ2yPN3E1yt5A9u7Ty0P90afd8XBj0+ZeBpwjqrhpNDdnjh5pcktW8jcTQx7Gc6fHCJH6muyj/kPAMwm1gEGqWKZBQCmFSm8RJUzHfoHCRdLC/LhQ+ph2rHtmVKUqzdWX5R04EWt3LqfbmL9Az4wGzb2ELylep7vu8nJfYQ4f5s8TheYWWT3cBthcKV/7/lJCtDYZaE+aRC6hqQr/6j6PlmJX39uKBZnzWi3TdnEXjhd+gAO/JUjU/DX1zGbtPnV+VhQpVD1d/fj3hM1mKq0YY8g4=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7423A3E7F609014B99617632048CF1A5@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 0428c85a-6eba-4f81-78ce-08d6da97956e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 07:16:33.0498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3355
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wNS0xNiAyMzoxMywgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBGcm9tOiBIZWluZXIg
S2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPg0KPiANCj4gQ3VycmVudGx5IGkyY19uZXdf
ZGV2aWNlIGFuZCBpMmNfbmV3X2R1bW15IHJldHVybiBqdXN0IE5VTEwgaW4gZXJyb3INCj4gY2Fz
ZSBhbHRob3VnaCB0aGV5IGhhdmUgbW9yZSBlcnJvciBkZXRhaWxzIGludGVybmFsbHkuIFRoZXJl
Zm9yZSBtb3ZlDQo+IHRoZSBmdW5jdGlvbmFsaXR5IGludG8gbmV3IGZ1bmN0aW9ucyByZXR1cm5p
bmcgZGV0YWlsZWQgZXJyb3JzIGFuZA0KPiBhZGQgd3JhcHBlcnMgZm9yIGNvbXBhdGliaWxpdHkg
d2l0aCB0aGUgY3VycmVudCBBUEkuDQo+IA0KPiBUaGlzIGFsbG93cyB0byB1c2UgdGhlc2UgZnVu
Y3Rpb25zIHdpdGggZGV0YWlsZWQgZXJyb3IgY29kZXMgd2l0aGluDQo+IHRoZSBpMmMgY29yZSBv
ciBmb3IgQVBJIGV4dGVuc2lvbnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdl
aXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPg0KPiBbd3NhOiByZW5hbWUgbmV3IGZ1bmN0aW9ucyBh
bmQgZml4IG1pbm9yIGtkb2MgaXNzdWVzXQ0KPiBTaWduZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcg
PHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPg0KDQpUaGUgb25seSBuaXQgSSBjYW4g
ZmluZCBpcyB0aGF0IHlvdSBjb3VsZCBwZXJoYXBzIHN3ZWVwIHRoZSBwYXRjaGVzDQp3aXRoIHNl
ZCAncy9pMmMgL0kyQyAvJy4gQnV0IHRoYXQgaXMgaW5kZWVkIGEgbml0LCBzbyBpZiB5b3UncmUg
aW4NCmEgaHVycnkuLi4NCg0KUmV2aWV3ZWQtYnk6IFBldGVyIFJvc2luIDxwZWRhQGF4ZW50aWEu
c2U+DQoNCkNoZWVycywNClBldGVyDQo=
