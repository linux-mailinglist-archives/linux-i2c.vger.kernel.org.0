Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A48CE1304F5
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2020 23:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgADWj5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Jan 2020 17:39:57 -0500
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com ([40.107.21.133]:28257
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726170AbgADWj5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 4 Jan 2020 17:39:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PO9+2c5RD3Uig4rzMfT4bkDMT9aykc2tAL0g752xL+L1q2RGYaAXX1KZ8DTMpEsSaJ+Bi0/is1f03LGLp8+uYf80TwDADsyLhTVBgTJAmgVmwFCR/r2VYkUZNerKRN+x1TJ3G5j2FG5BDgjd1quAq8m+dvmoQ4CQAoDhYRuvXl2tA0E/gG8rtFUlj2A0MG936QRYLt0P8b41p7CNZuHnVQiku+Yl/fSkVl6R+iS6NnGaQeovaQfmmZdl5meVC3sTsZp6xIETHAgAvVJcHSUTb9iZZJG6L7aVe9EBo0LhRG0NG+tKJcnVzlS830hZ00y9hYGwL3D99vTL0a5Ov3wzvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGKHzGsjSDtfKy4xAN9VatySLirDDLeA0za4abbQOAg=;
 b=L9vioW5qOfaN9Ps//CbPfPKvdyFYTZMXTj6cKm8NKX+N/KxJ+/TjutdNhVyAeIFsg8wlB0I5mhWVHGyME+szF0WLmRxScAOxa3A8jiggGOZdPzm77tqvbjr3ZyGCarmjRwRnRqeecXx+7kPgOZxki+UJn4oTKeK9dNt2wzso8r5zG/2rT2UQiN/xxm9dl2YqiAPZw3+CYP6C7L/jTk26PihEzO+EZBLbubA8tGLO3Lm9T1r8qgAsJccCGtqmmCLWpjLSxnM7MiUf4Qsj6EVnsz1Sz0j6T0mZoc+nUylpNMIki4qxiIevd0TN+0y4b/nD3yT/OS/Np7E7tJ62P7DP8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGKHzGsjSDtfKy4xAN9VatySLirDDLeA0za4abbQOAg=;
 b=keccycIYsy+ngHtVgpElXTyTDe+/vWdj73rPsPc1/C3B4LfrTpZ6L0l/JIe7Xf4lFni6XgJUsT4F0eO9vf/QwgwvPfNynFji58ZmXSGIG0mCrq6PBoNjf/jV+49LUd3dZbFCm5kOsApY8d/bRZbYTtFl0SlI92YiRPTeA3mWLv4=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3562.eurprd02.prod.outlook.com (52.134.69.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.14; Sat, 4 Jan 2020 22:39:49 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13%7]) with mapi id 15.20.2602.015; Sat, 4 Jan 2020
 22:39:49 +0000
Received: from [192.168.13.3] (213.112.138.4) by HE1PR0102CA0059.eurprd01.prod.exchangelabs.com (2603:10a6:7:7d::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend Transport; Sat, 4 Jan 2020 22:39:47 +0000
From:   Peter Rosin <peda@axentia.se>
To:     "Codrin.Ciubotariu@microchip.com" <Codrin.Ciubotariu@microchip.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "kamel.bouhara@bootlin.com" <kamel.bouhara@bootlin.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "Ludovic.Desroches@microchip.com" <Ludovic.Desroches@microchip.com>,
        "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v2 4/6] ARM: at91/dt: sama5d3: add i2c gpio pinctrl
Thread-Topic: [PATCH v2 4/6] ARM: at91/dt: sama5d3: add i2c gpio pinctrl
Thread-Index: AQHVwhsLdxsZpEnI6UWudjXfEFHmN6fbG4OA
Date:   Sat, 4 Jan 2020 22:39:48 +0000
Message-ID: <e22772f8-9e6d-002d-98d7-414136a32439@axentia.se>
References: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
 <20200103094821.13185-5-codrin.ciubotariu@microchip.com>
In-Reply-To: <20200103094821.13185-5-codrin.ciubotariu@microchip.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.4]
x-clientproxiedby: HE1PR0102CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::36) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6cde419-f069-4ff6-fbd3-08d791670151
x-ms-traffictypediagnostic: DB3PR0202MB3562:
x-microsoft-antispam-prvs: <DB3PR0202MB3562331B2286ED19D784B577BC220@DB3PR0202MB3562.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 02723F29C4
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(136003)(39830400003)(346002)(396003)(189003)(199004)(52314003)(81166006)(8676002)(81156014)(4326008)(6486002)(52116002)(186003)(16526019)(26005)(956004)(66446008)(2616005)(8936002)(66556008)(53546011)(71200400001)(66476007)(64756008)(66946007)(7416002)(16576012)(316002)(110136005)(31686004)(36756003)(5660300002)(31696002)(54906003)(508600001)(86362001)(2906002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3562;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nF/XKk+lhR5G2mJ8Aaru2zLKn9Wk/wDQ1vlj8yyu7KhMylkAn8vAlQnWeU60DIhjXCdkIHs6rP3P1qiHUfGos7nzf0dZ5EsF0chPW0iQcITzKeU+I9XwH3J2YunpnAf8Y5GZXg5yOMZpJlPd0fnG1GgvAGbBE4xrkeTIgY0H0tgz1Trh7DPmsa8pQy1JjCa3kLpgPVgQ4fn7wctjiGjdGdcs0MWXMHrFBFksE1gpkW8Ov4FzeW8loPis87iGuKUxYIomHHCEQma2XEq5NidjvrzYknlDYzFhZPtxG9wsMEsWPLpeF0ek50kAQQ1Pacfq+kruZPeEwsfDPatCM+8otlQD37Os4R2Kdu9xcAgWk/ItET35aCo93jikuleoxW6HR1XFho//RUWKyerpLHM4baDryopDqTiVLH9D0X9j3DxjlndazJxhYIp+LJGpPQwiuY2TsPw8FRbslAmnIowvHfRhdtqBhccFW6xvT/PLDLT199erIXa8Egbt9DXkqQRh
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF949416C25CEE4A9F9A12B8347FB46E@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d6cde419-f069-4ff6-fbd3-08d791670151
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2020 22:39:48.9081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w6JffzHHSv9CG5Z3B/Gpr7ruOsx7sJ672ZPw926UHz/Fgqh3iQ7zUicQZ89NUh76
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3562
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAyMC0wMS0wMyAxMDo0OSwgQ29kcmluLkNpdWJvdGFyaXVAbWljcm9jaGlwLmNvbSB3cm90
ZToNCj4gRnJvbTogS2FtZWwgQm91aGFyYSA8a2FtZWwuYm91aGFyYUBib290bGluLmNvbT4NCj4g
DQo+IEFkZCB0aGUgaTJjIGdwaW8gcGluY3RybHMgdG8gc3VwcG9ydCB0aGUgaTJjIGJ1cyByZWNv
dmVyeQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogS2FtZWwgQm91aGFyYSA8a2FtZWwuYm91aGFyYUBi
b290bGluLmNvbT4NCj4gLS0tDQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAgLSBub25lOw0KPiAN
Cj4gIGFyY2gvYXJtL2Jvb3QvZHRzL3NhbWE1ZDMuZHRzaSB8IDMzICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+IA0KDQoqc25pcCoNCg0KPiBAQCAtNjM5LDYgKzY0OCwxMiBAQA0KPiAg
CQkJCQkJCTxBVDkxX1BJT0EgMzAgQVQ5MV9QRVJJUEhfQSBBVDkxX1BJTkNUUkxfTk9ORQkvKiBQ
QTMwIHBlcmlwaCBBIFRXRDAgcGluLCBjb25mbGljdHMgd2l0aCBVUlhEMSwgSVNJX1ZTWU5DICov
DQo+ICAJCQkJCQkJIEFUOTFfUElPQSAzMSBBVDkxX1BFUklQSF9BIEFUOTFfUElOQ1RSTF9OT05F
PjsJLyogUEEzMSBwZXJpcGggQSBUV0NLMCBwaW4sIGNvbmZsaWN0cyB3aXRoIFVUWEQxLCBJU0lf
SFNZTkMgKi8NCj4gIAkJCQkJfTsNCj4gKw0KPiArCQkJCQlwaW5jdHJsX2kyYzBfZ3BpbzogaTJj
MC1ncGlvIHsNCj4gKwkJCQkJCWF0bWVsLHBpbnMgPQ0KPiArCQkJCQkJCTxBVDkxX1BJT0EgMzAg
QVQ5MV9QRVJJUEhfR1BJTyBBVDkxX1BJTkNUUkxfUFVMTF9VUA0KPiArCQkJCQkJCSBBVDkxX1BJ
T0EgMzEgQVQ5MV9QRVJJUEhfR1BJTyBBVDkxX1BJTkNUUkxfUFVMTF9VUD47DQo+ICsJCQkJCX07
DQoNCkknbSBjdXJpb3VzLCBidXQgd2h5IGFyZSBwdWxsLXVwcyBzdWRkZW5seSBuZWVkZWQganVz
dCBiZWNhdXNlIHRoZSBwaW5zIGFyZQ0KdXNlZCBmb3IgR1BJTyByZWNvdmVyeT8gV2h5IGFyZSBw
dWxsLXVwcyBub3QgbmVlZGVkIHdoZW4gdGhlIHBpbnMgYXJlIHVzZWQNCmJ5IHRoZSBJMkMgcGVy
aXBoZXJhbCBkZXZpY2Uocyk/DQoNCkdpdmVuIGZpZ3VyZSAyNy0yICJJL08gTGluZSBDb250cm9s
IExvZ2ljIiBpbiBteSBTQU1BNUQzIGRhdGFzaGVldCwgSSBzZWUNCm5vIGRpZmZlcmVuY2UgYXMg
dG8gaG93IGFuZCB3aHkgdGhlIHB1bGwtdXBzIGFyZSBhcHBsaWVkIGRlcGVuZGluZyBvbiB3aGF0
DQp0aGUgY3VycmVudCBmdW5jdGlvbiBvZiB0aGUgcGluIGlzLiBTbywgaWYgdGhlIEkyQyBidXMg
d29ya3Mgdy9vIHB1bGxzLCBidXMNCnJlY292ZXJ5IHVzaW5nIEdQSU8gbXVzdCBhbHNvIHdvcmsg
dy9vIHB1bGxzLg0KDQpJLmUuIHRoZSBkZXZpY2UgdHJlZSByZXF1aXJlcyB5b3UgdG8gaGF2ZSBl
eHRlcm5hbCBwdWxsLXVwcyBvbiB0aGUgSTJDIGJ1cw0KYW55d2F5LCBzbyB3aHkgYm90aGVyIHdp
dGggaW50ZXJuYWwgcHVsbC11cHMgZm9yIHRoZSByZWNvdmVyeSBjYXNlPw0KDQpDaGFuZ2luZyBw
dWxsLXVwIHNldHRpbmdzIGp1c3QgZm9yIHJlY292ZXJ5IGZlZWxzIGxpa2Ugc29tZXRoaW5nIHRo
YXQgd2lsbA0KaW5ldml0YWJseSBjcmVhdGUgaGFyZCB0byBkZWJ1ZyBzdXJwcmlzZXMgYXQgdGhl
IGxlYXN0IG9wcG9ydHVuZSB0aW1lLi4uDQoNCk9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQoN
CihJJ20gZm9jdXNpbmcgb24gU0FNQTVEMyBzaW5jZSB0aGF0IGlzIHdoYXQgSSBoYXBwZW4gdG8g
d29yayB3aXRoLA0KIGJ1dCB0aGUgc2FtZSBxdWVzdGlvbiBhcHBlYXJzIHRvIGFwcGx5IGZvciBT
QU1BNUQyIGFuZCBTQU1BNUQ0Li4uKQ0KDQpDaGVlcnMsDQpQZXRlcg0K
