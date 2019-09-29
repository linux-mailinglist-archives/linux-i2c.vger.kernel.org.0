Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 727AEC1990
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2019 23:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbfI2VVs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 29 Sep 2019 17:21:48 -0400
Received: from mail-eopbgr80105.outbound.protection.outlook.com ([40.107.8.105]:52206
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726360AbfI2VVs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 29 Sep 2019 17:21:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1AGt50uOj2IIAUVzowQywv4VihHorzf5MbJ8RYw6kIRrU9nxdL//09ystdzEPF8rzYy47IpTQVl0PLI07DxTsw/6hG/OyLcyqRl2rMeEHu+NT2R/MxRdKUKlfDnf0waXC6u86F9PTTUznGuz4VrhldQ65T8KlUSmpcZvMHmR7OaysKMO2gdI1JKUEmmmMisjwKG5NBVgl55V3hQbFL0Qqa7aodhICs9V6jbLTkoXjvPs6zTABKgAQQfSuYBAjxxAhX3Law1EXrIigF4s7d6zTii4TNC24vdC+lTMG219z4xO4OGvm579pPADTFm8siMf2BCvE398gWttAJSmW4ltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sr7ASVV5jYj+z2BSZFLfIfp9Sc+oWQ0EcWPQsAmvGzY=;
 b=IspT+PhvYLfPPFr7Y7cUdRC50szcBPPV4Fm21PPWy2x2I9vbFlWg1VF2EW0L2AACwhFwXpzGIL3/Cc5yvaUI8hWlS/ab2pH94yIhCjQcv39cl8LsnWMGXAfWP9E2x8LMAptAyeCF3qrUo2uO2ULkatlzMv7rVSp/kBtCJQRArk6XFRgHV6LypvCSokVDqNe+T7z2hk92Ox0hzDLOy6YmPU+0VkNEa9JWWRl7yY8/y21SGcrb2Pag0g+BucheReXfzsBAFkPx34XYoQNpdUp1dfnna4ZewoL+zZ0ict3zxZqeYDFjwXOgdOI2VvHXE1HPYSre4H4TcPucgE/0Xa6/Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sr7ASVV5jYj+z2BSZFLfIfp9Sc+oWQ0EcWPQsAmvGzY=;
 b=gdrbammDogy4Cpuef20qvbYAFGVwpzgv+KlY0pXopmm6ixXlvxO6EnboWbif7rdj59YdM8iFWzJQgn59mNvN/9CtjvPXcAxEZEz7M6VxHBhGctOvfvtjX6rfz1r0S1Ri43eK9xumxx9JUUeeJ8QbqUYXzydcXLEIimzvx7YatBE=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3387.eurprd02.prod.outlook.com (52.134.71.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Sun, 29 Sep 2019 21:21:40 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe%7]) with mapi id 15.20.2305.017; Sun, 29 Sep 2019
 21:21:40 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Biwen Li <biwen.li@nxp.com>,
        "leoyang.li@nxp.com" <leoyang.li@nxp.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: pca954x: Add property to skip disabling PCA954x MUX
 device
Thread-Topic: [PATCH] i2c: pca954x: Add property to skip disabling PCA954x MUX
 device
Thread-Index: AQHVdrNFZZMQUbNsZkan/V0TQ0c5o6dDKleA
Date:   Sun, 29 Sep 2019 21:21:40 +0000
Message-ID: <e5f4f0b8-05e0-5c70-84f0-817c83059ae7@axentia.se>
References: <20190929103638.46038-1-biwen.li@nxp.com>
In-Reply-To: <20190929103638.46038-1-biwen.li@nxp.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0802CA0024.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::34) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34935216-98d8-4d11-8e50-08d7452304d2
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7193020);SRVR:DB3PR0202MB3387;
x-ms-traffictypediagnostic: DB3PR0202MB3387:
x-microsoft-antispam-prvs: <DB3PR0202MB3387DB1C32B6DDB1451726A6BC830@DB3PR0202MB3387.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 017589626D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(376002)(346002)(396003)(366004)(42606007)(136003)(189003)(199004)(256004)(66556008)(71190400001)(476003)(229853002)(65956001)(186003)(25786009)(2906002)(486006)(316002)(6486002)(58126008)(6436002)(2501003)(2616005)(11346002)(54906003)(66946007)(31686004)(66446008)(31696002)(81156014)(6512007)(8936002)(110136005)(14444005)(8676002)(36756003)(81166006)(64756008)(508600001)(66066001)(6246003)(66476007)(5660300002)(86362001)(6506007)(52116002)(386003)(65806001)(26005)(6116002)(4326008)(71200400001)(14454004)(3846002)(76176011)(305945005)(53546011)(99286004)(446003)(102836004)(7736002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3387;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KiEEBdXbbqAqHc/4OsvNYOhOrf8eLIqYVpODcQonZ1E9Wjonhs9u/E7Cy1Bzh38z2Vqr1BFthCIrQ/b2Ewcu7N5Wv3CRziaECsGvpdPBfXdpiZTqf8fVsSdyAtq23ge9cH+hBWwh8Ug64PzyNo/+ReU4uZ6sxDz7SXpoxrch3UYNHhCP7P6GseLRmHqGur0Pbox9lbmDb7yed2CU0pYkeGhj2+x1h9q/WBjHGUFL4N4Zdp3Gmm/CAUay98OMlgO5BwNvPqv9G5iXw8ns/lOa4KmkH+/ztJe20bi1g24Ymc5eAUGCdifgmhUTWQV7fSlbDqVR5UD/JA+Edu7UKn1zClE2tCpNB6XV5nJ/ZG0CZ9vHDnNwV0CDgLeW8xyTmMOz5m0d5RmiRU2UFh/Nl+bVd3f3nqsG0cMcZP/VL+DqebM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A2538A070978E4EB8D810C2BD99A7C4@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 34935216-98d8-4d11-8e50-08d7452304d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2019 21:21:40.5792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gNla05AKfz53ZW9XDSvLMbIQ3E9KC+Ym2FYjeBRbY3mqDbZ6SHSu2KvbwJ0qjs/x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3387
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wOS0yOSAxMjozNiwgQml3ZW4gTGkgd3JvdGU6DQo+IE9uIHNvbWUgTGF5ZXJzY2Fw
ZSBib2FyZHMgbGlrZSBMUzIwODVBUkRCIGFuZCBMUzIwODhBUkRCLA0KPiBpbnB1dCBwdWxsLXVw
IHJlc2lzdG9ycyBvbiBQQ0E5NTR4IE1VWCBkZXZpY2UgYXJlIG1pc3Npbmcgb24gYm9hcmQsDQo+
IFNvLCBpZiBNVVggYXJlIGRpc2FibGVkIGFmdGVyIHBvd2VyZWQtb24sIGlucHV0IGxpbmVzIHdp
bGwgZmxvYXQNCj4gbGVhZGluZyB0byBpbmNvcnJlY3QgZnVuY3Rpb25hbGl0eS4NCg0KSGkhDQoN
CkFyZSB5b3Ugc2F5aW5nIHRoYXQgdGhlIHBhcmVudCBidXMgb2YgdGhlIG11eCBpcyByZWx5aW5n
IG9uIHNvbWUNCnB1bGwtdXBzIGluc2lkZSB0aGUgbXV4Pw0KDQo+IEhlbmNlLCBQQ0E5NTR4IE1V
WCBkZXZpY2Ugc2hvdWxkIG5ldmVyIGJlIHR1cm5lZC1vZmYgYWZ0ZXINCj4gcG93ZXItb24uDQo+
IA0KPiBBZGQgcHJvcGVydHkgdG8gc2tpcCBkaXNhYmxpbmcgUENBOTU0eCBNVVggZGV2aWNlDQo+
IGlmIGRldmljZSB0cmVlIGNvbnRhaW5zICJpMmMtbXV4LW5ldmVyLWRpc2FibGUiDQo+IGZvciBQ
Q0E5NTR4IGRldmljZSBub2RlLg0KPiANCj4gRXJyYXRhIElEOiBFLTAwMDEzIG9uIGJvYXJkIExT
MjA4NUFSREIgYW5kIExTMjA4OEFSREINCj4gKEJvYXJkIHJldmlzaW9uIGZvdW5kIG9uIFJldi5C
LCBSZXYuQyBhbmQgUmV2LkQpDQoNCkkgdGhpbmsgeW91IHNob3VsZCBmb2xsb3cgdGhlIGV4YW1w
bGUgb2YgdGhlIGkyYy1tdXgtZ3BpbyBkcml2ZXINCmFuZCBpbXBsZW1lbnQgdGhlIGlkbGUtc3Rh
dGUgcHJvcGVydHkgaW5zdGVhZC4NCg0KVGhhdCBpcyBhIGxvdCBtb3JlIGNvbnNpc3RlbnQsIGFz
c3VtaW5nIGl0IHNvbHZlcyB0aGUgcHJvYmxlbQ0KYXQgaGFuZD8NCg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogQml3ZW4gTGkgPGJpd2VuLmxpQG54cC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9pMmMv
bXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMgYi9k
cml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1NHguYw0KPiBpbmRleCA5MjNhYTNhNWEzZGMu
LmVhOGFjYTU0ZDU3MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1w
Y2E5NTR4LmMNCj4gKysrIGIvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMNCj4g
QEAgLTkzLDYgKzkzLDcgQEAgc3RydWN0IHBjYTk1NHggew0KPiAgCXN0cnVjdCBpcnFfZG9tYWlu
ICppcnE7DQo+ICAJdW5zaWduZWQgaW50IGlycV9tYXNrOw0KPiAgCXJhd19zcGlubG9ja190IGxv
Y2s7DQo+ICsJdTggZGlzYWJsZV9tdXg7CQkvKiBkbyBub3QgZGlzYWJsZSBtdXggaWYgdmFsIG5v
dCAwICovDQoNCkF3ZnVsIG51bWJlciBvZiBuZWdhdGlvbnMgdGhlcmUuIFRoZSBuYW1lIGlzIGFs
c28gYmFja3dhcmRzIGdpdmVuIHRoYXQNCmEgbm9uLXplcm8gdmFsdWUgbWVhbnMgdGhhdCB0aGUg
bXV4IHNob3VsZCAqbm90KiBiZSBkaXNhYmxlZC4gSSB3b3VsZA0KaGF2ZSByZXVzZWQgdGhlIG5h
bWUgZnJvbSB0aGUgYmluZGluZy4NCg0KCWJvb2wgbmV2ZXJfZGlzYWJsZTsNCg0KQSBiaXQgbGVz
cyBjb25mdXNpbmcuLi4NCg0KPiAgfTsNCj4gIA0KPiAgLyogUHJvdmlkZSBzcGVjcyBmb3IgdGhl
IFBDQTk1NHggdHlwZXMgd2Uga25vdyBhYm91dCAqLw0KPiBAQCAtMjU4LDYgKzI1OSwxMSBAQCBz
dGF0aWMgaW50IHBjYTk1NHhfZGVzZWxlY3RfbXV4KHN0cnVjdCBpMmNfbXV4X2NvcmUgKm11eGMs
IHUzMiBjaGFuKQ0KPiAgCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSBkYXRhLT5jbGllbnQ7
DQo+ICAJczggaWRsZV9zdGF0ZTsNCj4gIA0KPiArCWlmIChkYXRhLT5kaXNhYmxlX211eCAhPSAw
KSB7DQoNClBsZWFzZSBkcm9wICIgIT0gMCIgYW5kIHVzZSB0aGUgdmFyaWFibGUgYXMgYSB0cnV0
aCB2YWx1ZS4gTW9yZQ0KaW5zdGFuY2VzIGJlbG93Li4uDQoNCj4gKwkJZGF0YS0+bGFzdF9jaGFu
ID0gZGF0YS0+Y2hpcC0+bmNoYW5zOw0KPiArCQlyZXR1cm4gcGNhOTU0eF9yZWdfd3JpdGUobXV4
Yy0+cGFyZW50LCBjbGllbnQsIGRhdGEtPmRpc2FibGVfbXV4KTsNCj4gKwl9DQo+ICsNCj4gIAlp
ZGxlX3N0YXRlID0gUkVBRF9PTkNFKGRhdGEtPmlkbGVfc3RhdGUpOw0KPiAgCWlmIChpZGxlX3N0
YXRlID49IDApDQo+ICAJCS8qIFNldCB0aGUgbXV4IGJhY2sgdG8gYSBwcmVkZXRlcm1pbmVkIGNo
YW5uZWwgKi8NCj4gQEAgLTQ2MiwxNiArNDY4LDMyIEBAIHN0YXRpYyBpbnQgcGNhOTU0eF9wcm9i
ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LA0KPiAgCQl9DQo+ICAJfQ0KPiAgDQo+ICsJLyog
RXJyYXRhIElEIEUtMDAwMTMgb24gYm9hcmQgTFMyMDg4QVJEQiBhbmQgTFMyMDg4QVJEQjoNCj4g
KwkgKiBUaGUgcG9pbnQgaGVyZSBpcyB0aGF0IHlvdSBtdXN0IG5vdCBkaXNhYmxlIGEgbXV4IGlm
IHRoZXJlDQo+ICsJICogYXJlIG5vIHB1bGx1cHMgb24gdGhlIGlucHV0IG9yIHlvdSBtZXNzIHVw
IHRoZSBJMkMuIFRoaXMNCj4gKwkgKiBuZWVkcyB0byBiZSBwdXQgaW50byB0aGUgRFRTIHJlYWxs
eSBhcyB0aGUga2VybmVsIGNhbm5vdA0KPiArCSAqIGtub3cgdGhpcyBvdGhlcndpc2UuDQo+ICsJ
ICovDQo+ICsNCj4gKwlkYXRhLT5kaXNhYmxlX211eCA9IG5wICYmDQo+ICsJCW9mX3Byb3BlcnR5
X3JlYWRfYm9vbChucCwgImkyYy1tdXgtbmV2ZXItZGlzYWJsZSIpICYmDQoNCmkyYy1tdXgtbmV2
ZXItZGlzYWJsZSBuZWVkcyB0byBiZSBkb2N1bWVudGVkLiBIb3dldmVyIHNlZSBhYm92ZSBmb3Ig
bXkNCnBvaW50IHRoYXQgeW91IHNob3VsZCBkbyBpdCBsaWtlIHRoZSBpMmMtbXV4LWdwaW8gZHJp
dmVyLiBBbnkgdXNhZ2UNCm9mIGlkbGUtc3RhdGUgc3RpbGwgbmVlZHMgdG8gYmUgZG9jdW1lbnRl
ZCBmb3IgcGNhOTU0eCBiaW5kaW5nLg0KDQo+ICsJCWRhdGEtPmNoaXAtPm11eHR5cGUgPT0gcGNh
OTU0eF9pc211eCA/DQo+ICsJCWRhdGEtPmNoaXAtPmVuYWJsZSA6IDA7DQoNCldoeSBkbyB5b3Ug
bm90IGFsbG93IG5ldmVyLWRpc2FibGUgZm9yIHN3aXRjaGVzPw0KDQpDaGVlcnMsDQpQZXRlcg0K
DQo+ICsNCj4gIAkvKiBXcml0ZSB0aGUgbXV4IHJlZ2lzdGVyIGF0IGFkZHIgdG8gdmVyaWZ5DQo+
ICAJICogdGhhdCB0aGUgbXV4IGlzIGluIGZhY3QgcHJlc2VudC4gVGhpcyBhbHNvDQo+ICAJICog
aW5pdGlhbGl6ZXMgdGhlIG11eCB0byBkaXNjb25uZWN0ZWQgc3RhdGUuDQo+ICAJICovDQo+IC0J
aWYgKGkyY19zbWJ1c193cml0ZV9ieXRlKGNsaWVudCwgMCkgPCAwKSB7DQo+ICsJaWYgKGkyY19z
bWJ1c193cml0ZV9ieXRlKGNsaWVudCwgZGF0YS0+ZGlzYWJsZV9tdXgpIDwgMCkgew0KPiAgCQlk
ZXZfd2FybihkZXYsICJwcm9iZSBmYWlsZWRcbiIpOw0KPiAgCQlyZXR1cm4gLUVOT0RFVjsNCj4g
IAl9DQo+ICANCj4gLQlkYXRhLT5sYXN0X2NoYW4gPSAwOwkJICAgLyogZm9yY2UgdGhlIGZpcnN0
IHNlbGVjdGlvbiAqLw0KPiArCWlmIChkYXRhLT5kaXNhYmxlX211eCAhPSAwKQ0KPiArCQlkYXRh
LT5sYXN0X2NoYW4gPSBkYXRhLT5jaGlwLT5uY2hhbnM7DQo+ICsJZWxzZQ0KPiArCQlkYXRhLT5s
YXN0X2NoYW4gPSAwOyAgICAgICAgICAgICAgIC8qIGZvcmNlIHRoZSBmaXJzdCBzZWxlY3Rpb24g
Ki8NCj4gKw0KPiAgCWRhdGEtPmlkbGVfc3RhdGUgPSBNVVhfSURMRV9BU19JUzsNCj4gIA0KPiAg
CWlkbGVfZGlzY29ubmVjdF9kdCA9IG5wICYmDQo+IEBAIC01MzEsOCArNTUzLDExIEBAIHN0YXRp
YyBpbnQgcGNhOTU0eF9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgCXN0cnVjdCBpMmNf
bXV4X2NvcmUgKm11eGMgPSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xpZW50KTsNCj4gIAlzdHJ1Y3Qg
cGNhOTU0eCAqZGF0YSA9IGkyY19tdXhfcHJpdihtdXhjKTsNCj4gIA0KPiAtCWRhdGEtPmxhc3Rf
Y2hhbiA9IDA7DQo+IC0JcmV0dXJuIGkyY19zbWJ1c193cml0ZV9ieXRlKGNsaWVudCwgMCk7DQo+
ICsJaWYgKGRhdGEtPmRpc2FibGVfbXV4ICE9IDApDQo+ICsJCWRhdGEtPmxhc3RfY2hhbiA9IGRh
dGEtPmNoaXAtPm5jaGFuczsNCj4gKwllbHNlDQo+ICsJCWRhdGEtPmxhc3RfY2hhbiA9IDA7DQo+
ICsJcmV0dXJuIGkyY19zbWJ1c193cml0ZV9ieXRlKGNsaWVudCwgZGF0YS0+ZGlzYWJsZV9tdXgp
Ow0KPiAgfQ0KPiAgI2VuZGlmDQo+ICANCj4gDQoNCg==
