Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B093F21419
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2019 09:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbfEQHRE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 May 2019 03:17:04 -0400
Received: from mail-eopbgr30136.outbound.protection.outlook.com ([40.107.3.136]:3077
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727871AbfEQHRE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 May 2019 03:17:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTURChKUCHpe6//shfJaR+7kZLuKhERV1MzR8SXnpY8=;
 b=bIuI2oW4o2u+2HtaDvdIqNRctdzvl2d+Ce5MslOhW85/6oyp2gc56yli0YQjDsmcxsE6ZYP1/jy5Yh8O6srnnaG2anClpAOhECArb9LMb0Z04gOR5lUvO3XbY31YpZ9eWcaitfLzhwmGn8De5G+LCEblWl2k193hxPlinvLZl4c=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3355.eurprd02.prod.outlook.com (52.134.72.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 17 May 2019 07:17:00 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf%5]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 07:17:00 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH v8 2/3] i2c: core: add device-managed version of
 i2c_new_dummy
Thread-Topic: [PATCH v8 2/3] i2c: core: add device-managed version of
 i2c_new_dummy
Thread-Index: AQHVDCww5UI8ll6MN0WBQvlD1/peWqZu6K2A
Date:   Fri, 17 May 2019 07:17:00 +0000
Message-ID: <278f4e2b-e96d-1ec9-61b2-cf3a91b87182@axentia.se>
References: <20190516211310.22277-1-wsa+renesas@sang-engineering.com>
 <20190516211310.22277-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190516211310.22277-3-wsa+renesas@sang-engineering.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR08CA0075.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::46) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77dabc58-d7c9-484e-a10b-08d6da97a74e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:DB3PR0202MB3355;
x-ms-traffictypediagnostic: DB3PR0202MB3355:
x-microsoft-antispam-prvs: <DB3PR0202MB335577782E05754ECDC0C0EFBC0B0@DB3PR0202MB3355.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(376002)(366004)(39830400003)(136003)(189003)(199004)(6512007)(2501003)(4744005)(446003)(2616005)(11346002)(53936002)(8936002)(7736002)(102836004)(66556008)(65826007)(66476007)(6436002)(64756008)(66446008)(508600001)(476003)(14454004)(64126003)(3846002)(256004)(6116002)(74482002)(486006)(73956011)(6246003)(66946007)(186003)(26005)(36756003)(229853002)(76176011)(4326008)(6486002)(31686004)(52116002)(305945005)(54906003)(86362001)(68736007)(5660300002)(2906002)(110136005)(53546011)(99286004)(31696002)(8676002)(6506007)(386003)(71200400001)(81156014)(25786009)(65956001)(65806001)(81166006)(58126008)(71190400001)(66066001)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3355;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gpOo8BHGa+sjFd5G7qXRi/F+UQAUgyTBH6xY5prKnQfWZqcg3oGUwPW7hlgBohTeTQ0pb3EKTaQzAiwrQr7l+zLQJD4uhUKNtfrVUQecquc1o+oU/rklsxsHC+sQ/UYQGgkIZ5lTuHcucABx1btmL+ZZxKUKXitXurgSjD9kkplbKh5U/Sb01lOynCD6oX8PLn7oSBgCVgY8buDQyBGJ0L9JiWHoYEMXNRjHfwkSkRaHr8SMUBipecT/eYRk04W5GtfH8YfVEbUFvgS1hdORY04piJdtxbBrLWjeBXiEEOR4bJJeLlD9rEUeOzaijrBxq4f9vaLg4omlluR5Cl9CdL4PmlgAhowt6d4Obehm8NYSqV+Xd1ZFLSsFTkww7RJh9zHMv+x+QyRE4BBW8zFw9n/ggYAwTt5N5oR5thWBRC4=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FB37543AE5DFF44A0AE6271E26DF4BE@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 77dabc58-d7c9-484e-a10b-08d6da97a74e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 07:17:00.4287
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
S2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPg0KPiANCj4gaTJjX25ld19kdW1teSBpcyB0
eXBpY2FsbHkgY2FsbGVkIGZyb20gdGhlIHByb2JlIGZ1bmN0aW9uIG9mIHRoZQ0KPiBkcml2ZXIg
Zm9yIHRoZSBwcmltYXJ5IGkyYyBjbGllbnQuIEl0IHJlcXVpcmVzIGNhbGxzIHRvDQo+IGkyY191
bnJlZ2lzdGVyX2RldmljZSBpbiB0aGUgZXJyb3IgcGF0aCBvZiB0aGUgcHJvYmUgZnVuY3Rpb24g
YW5kDQo+IGluIHRoZSByZW1vdmUgZnVuY3Rpb24uDQo+IFRoaXMgY2FuIGJlIHNpbXBsaWZpZWQg
YnkgaW50cm9kdWNpbmcgYSBkZXZpY2UtbWFuYWdlZCB2ZXJzaW9uLg0KPiANCj4gTm90ZSB0aGUg
Y2hhbmdlZCBlcnJvciBjYXNlIHJldHVybiB2YWx1ZSB0eXBlOiBpMmNfbmV3X2R1bW15IHJldHVy
bnMNCj4gTlVMTCB3aGlsc3QgZGV2bV9pMmNfbmV3X2R1bW15X2RldmljZSByZXR1cm5zIGFuIEVS
Ul9QVFIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFA
Z21haWwuY29tPg0KPiBbd3NhOiByZW5hbWUgbmV3IGZ1bmN0aW9ucyBhbmQgZml4IG1pbm9yIGtk
b2MgaXNzdWVzXQ0KPiBTaWduZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNh
bmctZW5naW5lZXJpbmcuY29tPg0KDQpSZXZpZXdlZC1ieTogUGV0ZXIgUm9zaW4gPHBlZGFAYXhl
bnRpYS5zZT4NCg0KQ2hlZXJzLA0KUGV0ZXINCg0K
