Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9865A5271F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 10:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730858AbfFYIvb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 04:51:31 -0400
Received: from mail-eopbgr70098.outbound.protection.outlook.com ([40.107.7.98]:27223
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729806AbfFYIvb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Jun 2019 04:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNRey0Q/Xh555bd7+jbqJv2t7P70BgNv5KqDmeqs6ag=;
 b=j0XaP3ySimDY/vPc8792zucRFEtZlXHME1hBISGieZ0GkA9qUV+ET/9+adn6zp5Jk01aIYryABiJILUD7bwRSvdiYOyTZddmJzu3FpCWD8xoDZvd9uVwCzww9UoJklPIDl8sfWKujmDcMmS8SOMT1K6FF2FYNdKxoGXOpX5xoTo=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3401.eurprd02.prod.outlook.com (52.134.73.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 08:51:27 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::29c5:d1ae:8855:3153]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::29c5:d1ae:8855:3153%3]) with mapi id 15.20.2008.014; Tue, 25 Jun 2019
 08:51:27 +0000
From:   Peter Rosin <peda@axentia.se>
To:     "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "Ludovic.Desroches@microchip.com" <Ludovic.Desroches@microchip.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 9/9] ARM: dts: at91: sama5d4_xplained: add analogic
 filter for i2c
Thread-Topic: [PATCH v2 9/9] ARM: dts: at91: sama5d4_xplained: add analogic
 filter for i2c
Thread-Index: AQHVKyzD88KDJW5qrEyetFFZXOAmS6asD/kA
Date:   Tue, 25 Jun 2019 08:51:27 +0000
Message-ID: <8b964ca4-58b6-5560-b06a-da3ad98dd36d@axentia.se>
References: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
 <1561449642-26956-10-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1561449642-26956-10-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0701CA0043.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::11) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 367c900a-b005-471b-1312-08d6f94a4f02
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3401;
x-ms-traffictypediagnostic: DB3PR0202MB3401:
x-microsoft-antispam-prvs: <DB3PR0202MB34019D0DA115AE19E0AC1AFBBCE30@DB3PR0202MB3401.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(376002)(39830400003)(366004)(136003)(199004)(189003)(71200400001)(71190400001)(66556008)(76176011)(5660300002)(66476007)(64756008)(66446008)(73956011)(6436002)(66946007)(486006)(7736002)(305945005)(186003)(508600001)(8936002)(6512007)(65826007)(64126003)(2501003)(52116002)(2906002)(99286004)(4744005)(31696002)(256004)(58126008)(6246003)(81156014)(7416002)(26005)(316002)(81166006)(8676002)(229853002)(110136005)(25786009)(68736007)(2616005)(11346002)(74482002)(14454004)(31686004)(65956001)(476003)(65806001)(66066001)(2201001)(6116002)(6486002)(36756003)(102836004)(6506007)(53546011)(446003)(53936002)(86362001)(386003)(3846002)(921003)(1121003);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3401;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pMOkyFz/1eyyAmnwxi1zallek3GFLVeFbMaR/87mjg4E90zBNF3kwD2HDIMKC4hxKuLZnxg256F+10NtZ9TljoNCtoopZZK4Relik5T4Y93VvITG/I1hACmqshNkupp7HBmM9aJC0w31Xxekvao0uFx75ShDUo5jCDYKh+AkYDSZyituOYTQlV/ai++Nddw6GZ8MvtTWjAVM++LiX+oNYImCVskVJgHFi6zf5BuxxS2/79hY1BCKlQQUnKfI1FCI/mwVZpwhyIvqyKVv0GnlkPULxJ1uDO1w2QHkxub8Coea3UDhmIhSUZuVgqaqFVsXGUcha+d2z7u2UTRtsjRAETY08jHSrJ2/bQ/4RO1ztn2VyDmThPHHaJb+npJbb8NxKEZK+lWbYNaBxkQbJNZoMrVk9bIsLDydCsPszEUE52Q=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30346D7CF884B04D8E7CF466AED05481@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 367c900a-b005-471b-1312-08d6f94a4f02
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 08:51:27.1214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peda@axentia.se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3401
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wNi0yNSAxMDowNSwgRXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tIHdyb3RlOg0K
PiBGcm9tOiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5jb20+DQo+IA0K
PiBBZGQgcHJvcGVydHkgZm9yIGRpZ2l0YWwgZmlsdGVyIGZvciBpMmMwIG5vZGUgc2FtYTVkNF94
cGxhaW5lZA0KDQpUaGlzIGRvZXMgbm90IG1hdGNoIHRoZSBiZWxvdyBodW5rLg0KDQpDaGVlcnMs
DQpQZXRlcg0KDQo+IFNpZ25lZC1vZmYtYnk6IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZA
bWljcm9jaGlwLmNvbT4NCj4gLS0tDQo+ICBhcmNoL2FybS9ib290L2R0cy9hdDkxLXNhbWE1ZDRf
eHBsYWluZWQuZHRzIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hdDkxLXNhbWE1ZDRfeHBsYWluZWQu
ZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXQ5MS1zYW1hNWQ0X3hwbGFpbmVkLmR0cw0KPiBpbmRl
eCBmZGZjMzdkLi4wNjA2OGRjIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9hdDkx
LXNhbWE1ZDRfeHBsYWluZWQuZHRzDQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2F0OTEtc2Ft
YTVkNF94cGxhaW5lZC5kdHMNCj4gQEAgLTQ5LDYgKzQ5LDcgQEANCj4gIAkJCX07DQo+ICANCj4g
IAkJCWkyYzA6IGkyY0BmODAxNDAwMCB7DQo+ICsJCQkJZW5hYmxlLWFuYS1maWx0Ow0KPiAgCQkJ
CXN0YXR1cyA9ICJva2F5IjsNCj4gIAkJCX07DQo+ICANCj4gDQoNCg==
