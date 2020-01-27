Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39F1314A179
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2020 11:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727441AbgA0KIh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jan 2020 05:08:37 -0500
Received: from mail-eopbgr70125.outbound.protection.outlook.com ([40.107.7.125]:57038
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726179AbgA0KIh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 Jan 2020 05:08:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8o7ZdSYN3EEGG8yUBJoIzVJ0i5/1ZtZtk8G02+oxZSAb9YVPccDI9hh0TRSlcsIftSKdL+8NtBu5TShg6tmungIKsI0dWRfEkgh4H3vwOSqhqO/3gw3sJjBz3Ez+U/GQwD5tnfbGi6+iMfw7zPn73sxp1eVEo40m9QtTiM8DuRL8KRkDvxFipBzHcJvv4dcjLK7xw0m/5kEG80Zsv9qFlkeW8W3NNe5adKq4Dk1NNlQ5GdZrRUBJK1S6MijGlF4UelvYqpHStX8ajOjQakmlsGa/b3aTvlw7gJvQKyiAoyUQPvzjgkfP1xVP8UzEpFcUaY53v92tbncbjbnKCCSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DP0visv+1QQ5bROCjSnALyf+03E81AE1jRd+Qoncw9I=;
 b=Xzz825vIFblXtFEa9ERXFgAcO9iirCtCPc0x9fDcHUEhHWsv6f0oJHMUnSoeSx9jkDMJ+TQxbp6JncW5aukQp9ML1GZyEkE+k5iEhsJvsJqaXQy0kxfq5vWjGeqrubg6JhXa6rsFTZ91zJ/SOYjBNGrNPFdzuX6hg1sw6AOlMNffyPiwXb0ujQI20oiiiTYF4mI6dHs+/Aka4E1u1UeUuH6OmXNmFycrEDmcwvAuxbq7nyIIRPHYAs6zt7jo8evvyoXJTmihdixz7T7kjTZyyIhNDzigp0HW2tGT8W3J6Z1RWR6L055QBKWAdo80jgzKoxEVpNH48+JRSHBoiKeUKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DP0visv+1QQ5bROCjSnALyf+03E81AE1jRd+Qoncw9I=;
 b=FRyn74VXwmahYqgllGoNfXytT2z7/s0wRReA25ZjcZS+XPtMuiUA4jyCs9T7Vpvr6yilYXJPwKIdycoPaO4PuBrhCtNNSTFS2WxGIAoEAR0Qnhp9Q70v5TQ7dXX6ou73miwOqjIljvNOx7qaMuaB7WkE8O++l3C3Cx+nRYYbw/s=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3385.eurprd02.prod.outlook.com (52.134.73.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Mon, 27 Jan 2020 10:08:27 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13%7]) with mapi id 15.20.2665.017; Mon, 27 Jan 2020
 10:08:27 +0000
Received: from [192.168.13.3] (213.112.138.4) by HE1PR0502CA0009.eurprd05.prod.outlook.com (2603:10a6:3:e3::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.21 via Frontend Transport; Mon, 27 Jan 2020 10:08:26 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Colin Ian King <colin.king@canonical.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] i2c: xiic: fix indentation issue
Thread-Topic: [PATCH][next] i2c: xiic: fix indentation issue
Thread-Index: AQHV1F9MXsnBtPvzREO9EfvLgEq5Laf+IjwAgAAcsYCAAAvAAA==
Date:   Mon, 27 Jan 2020 10:08:27 +0000
Message-ID: <a49786b8-bf71-727b-0785-62bd606a159b@axentia.se>
References: <20200126154257.41336-1-colin.king@canonical.com>
 <e20558ec-bf4e-9348-f6cb-a37c5dbbb2de@xilinx.com>
 <6558ccbc-56f7-b30d-df02-1eaf07072c4d@canonical.com>
In-Reply-To: <6558ccbc-56f7-b30d-df02-1eaf07072c4d@canonical.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-originating-ip: [213.112.138.4]
x-clientproxiedby: HE1PR0502CA0009.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::19) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04a5fcc8-d9ec-4e3b-f6fd-08d7a310da38
x-ms-traffictypediagnostic: DB3PR0202MB3385:
x-microsoft-antispam-prvs: <DB3PR0202MB3385DCFE13C48A008737D6D6BC0B0@DB3PR0202MB3385.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02951C14DC
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(31686004)(86362001)(31696002)(71200400001)(316002)(53546011)(16576012)(110136005)(54906003)(2906002)(508600001)(6486002)(81156014)(4326008)(81166006)(8676002)(36756003)(52116002)(8936002)(16526019)(956004)(5660300002)(186003)(66946007)(26005)(2616005)(66446008)(66556008)(66476007)(64756008);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3385;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nTmqrX7L85eAPXLwoqtrSiB0Ww9Obmah/st+/PPDzESY20UE2IFLAee8GsGBHzjPtKfDhaMWHiuB9HId/VEWu70E4RDO+XvB2JbzGJ8mg92EoQ6RX4C1pojFwHkmRLaSCkZPAENXwwd3qSNhz3288Aqb8ltEIZaBPz1NBBFDWdk59Wgi7OWLpKcMnG5ZQJWMAKBRp2l28gmXYSFf7cDZ6mjTl4Paoo1kYNreE0vfv4TYrXX6uaq5uZc7RSlZ7AKxX6xv9MZRA7ZqAOw4LPZx1gpOF+aqG9/yYKSv1UQPNyBekuyHIdXSzNQ3c0TlGhaYsCyduxUUKOtEO0wX0Zf5b65Sr0gdEEDm+Blx7+m2ChhXg06Bb936ZRCoRhWqD/dYY1idGb+jT1Q+V/bxcpj980V9tjaB02uTxfz1SQMMcPkQqss/UM3IEBvoSHkzDi38
x-ms-exchange-antispam-messagedata: hJ2Y9a8/a632aDFErlh72/weW8YqCwbyiOTlioeq0+51itwbB/j3dqPaQXwCjpk/x2ZH1Mjm0TdSHSXm/QdNvazx98etRddBqiqsgdpTLl5/6FrehOg6vbkd4Iu/BAVQb+j6bIlMgphuHxI60gXLcw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D4CE742CE73534BAB68505071BDB30E@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a5fcc8-d9ec-4e3b-f6fd-08d7a310da38
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2020 10:08:27.4743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X09dddJvbhKD2KKSdpp3wwyFKPDPOCchtlXTAa6CYqtN04ZseZ64P5ghd1lxlJHy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3385
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAyMC0wMS0yNyAxMDoyNiwgQ29saW4gSWFuIEtpbmcgd3JvdGU6DQo+IE9uIDI3LzAxLzIw
MjAgMDc6NDMsIE1pY2hhbCBTaW1layB3cm90ZToNCj4+IE9uIDI2LiAwMS4gMjAgMTY6NDIsIENv
bGluIEtpbmcgd3JvdGU6DQo+Pj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fu
b25pY2FsLmNvbT4NCj4+Pg0KPj4+IFRoZXJlIGlzIGEgc3RhdG1lbnQgdGhhdCBpcyBpbmRlbnRl
ZCBvbmUgbGV2ZWwgdG9vIGRlZXBseSwgcmVtb3ZlDQo+Pg0KPj4gdHlwbyAgICAgICAgICAgICBe
DQo+IA0KPiBDYW4gdGhpcyBiZSBmaXhlZCB3aGVuIHRoZSBwYXRjaCBpcyBhcHBsaWVkIHJhdGhl
ciB0aGFuIHNlbmRpbmcgYSBWMj8NCg0KSXQgY2FuLCBidXQgSSB0aGluayB5b3Ugd2lsbCBtYWtl
IGl0IGVhc2llciBmb3IgV29sZnJhbSBpZiB5b3Ugc2VuZCBhIHYyLg0KV2hpY2ggaXMgdGhlIHJp
Z2h0IHRoaW5nIHRvIGRvIGFueXdheSBzaW5jZSB5b3UgYXJlIG1pc3NpbmcgYSBGaXhlcyB0YWcu
DQpJIHRoaW5rIHlvdSBzaG91bGQgaGF2ZSBvbmUsIHNpbmNlIGl0IGlzIGJvcmRlcmxpbmUgaWYg
dGhpcyBwYXRjaCBpcyBnb2luZw0KdG8gbWFrZSBpdCBiZWZvcmUgNS42Lg0KDQpDaGVlcnMsDQpQ
ZXRlcg0KDQo+IENvbGluDQo+IA0KPj4NCj4+PiB0aGUgZXh0cmFuZW91cyB0YWIuDQo+Pj4NCj4+
PiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29t
Pg0KPj4+IC0tLQ0KPj4+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXhpaWMuYyB8IDIgKy0NCj4+
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4NCj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy14aWljLmMgYi9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLXhpaWMuYw0KPj4+IGluZGV4IGIxN2QzMGM5YWI0MC4uOTBjMWMzNjIzOTRk
IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMteGlpYy5jDQo+Pj4gKysr
IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy14aWljLmMNCj4+PiBAQCAtMjYxLDcgKzI2MSw3IEBA
IHN0YXRpYyBpbnQgeGlpY19jbGVhcl9yeF9maWZvKHN0cnVjdCB4aWljX2kyYyAqaTJjKQ0KPj4+
ICAJCXhpaWNfZ2V0cmVnOChpMmMsIFhJSUNfRFJSX1JFR19PRkZTRVQpOw0KPj4+ICAJCWlmICh0
aW1lX2FmdGVyKGppZmZpZXMsIHRpbWVvdXQpKSB7DQo+Pj4gIAkJCWRldl9lcnIoaTJjLT5kZXYs
ICJGYWlsZWQgdG8gY2xlYXIgcnggZmlmb1xuIik7DQo+Pj4gLQkJCQlyZXR1cm4gLUVUSU1FRE9V
VDsNCj4+PiArCQkJcmV0dXJuIC1FVElNRURPVVQ7DQo+Pj4gIAkJfQ0KPj4+ICAJfQ0KPj4NCj4+
IFdoZW4gZml4ZWQuDQo+Pg0KPj4gQWNrZWQtYnk6IE1pY2hhbCBTaW1layA8bWljaGFsLnNpbWVr
QHhpbGlueC5jb20+DQo+Pg0KPj4gVGhhbmtzLA0KPj4gTWljaGFsDQo+Pg0KPj4NCj4+DQo+Pg0K
Pj4NCj4+DQo+IA0KDQo=
