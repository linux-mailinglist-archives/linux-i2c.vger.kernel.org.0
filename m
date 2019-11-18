Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7A4100F3C
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2019 00:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfKRXFQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Nov 2019 18:05:16 -0500
Received: from mail-eopbgr10107.outbound.protection.outlook.com ([40.107.1.107]:56110
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726822AbfKRXFQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Nov 2019 18:05:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEFTDyXcoFo6b4IOZWYL+pvGQsuoVkZjmtHv27Czdj94MA5+icePzfB+NF6gvVLQPjQVUoS3g3nN45w8FjD6aVFMRWAhpr/iRT5+AoEOFcmDkOF3XVvym2sP2NFdSYNjAjMDtw/ds+BjQ4IDVOhlHuogg35AKKhdBJx9/XebBZ1GK6Kgp2V1RboUChrOE/JNpMXyFzh31TroRvbeglTmcqCTbSgY0iei+azWDU0lw13cRfE2UZwOEfq6JPeyS2CCibtmk+35zt8NIYc3cvgnoAE17hM1yg/y6FBJyk6wB8QOX08GMqeu98lCSzr6xrpuaYPUNzs6f+Pu+6b2fvwi8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7n3O+xGMtnqzUMVLMFDauM/zHWLdw76dHizzd3UbpKg=;
 b=AkDpKXd0cBjOioQaUlENDvt3O2N9Ve3jTSANnPYHAGhmsmPG1NGXDll3ehPOlZex6jrfJVUkHqON7er1gPNMiY+eSAUL6rDZNBMBDO6V8GOnI2p+DCHk4rKkejeeW/IypfJ3Bs3z5WetSkvEALfmVRvNNQr2y0qqNLjcqtsZBIF70ylSPTh9eZe2NVrgL2ddvM+uEcBa+kn4cuTo6tZ+J5nRuWQ1SHoTctDzU8vXKaBQ5kdOgKtXXTHNtExeAtrDxy38sBBwzXUYmIELv1Y2DCCi4wK7b7hHGkbgo7+oBF+LvpmTLq/YzofqvRHw63wcaoS+o8d3gDsCWgiNdiJPbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7n3O+xGMtnqzUMVLMFDauM/zHWLdw76dHizzd3UbpKg=;
 b=RogLwX/PGvpzXoj+VMYngrHSL8yQHeyZXAVjUF5sV9NFs+t0IrmSucvui1Xm49maUcUaVUIe4ZUSMO9TMTbBh6DHvuYfsDP3OM7P3CWewtf0sNxg2oKe3L+u0qc+Yz4gYOvraNdZxlsBW3/nhfVJRatsYlR6Ydc8hD9i76oKLR0=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3289.eurprd02.prod.outlook.com (52.134.65.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Mon, 18 Nov 2019 23:05:12 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca%7]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 23:05:12 +0000
From:   Peter Rosin <peda@axentia.se>
To:     "shubhrajyoti.datta@gmail.com" <shubhrajyoti.datta@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH] i2c: mux: pca954x: Disable cacheing of the last channel
Thread-Topic: [PATCH] i2c: mux: pca954x: Disable cacheing of the last channel
Thread-Index: AQHVmsPurZy7ZtYH5UOEuWcdG58cQaeRk7YA
Date:   Mon, 18 Nov 2019 23:05:12 +0000
Message-ID: <6d135b8a-cdba-e6a6-7738-cbc94cdb7ec0@axentia.se>
References: <1573719422-7414-1-git-send-email-shubhrajyoti.datta@gmail.com>
In-Reply-To: <1573719422-7414-1-git-send-email-shubhrajyoti.datta@gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR08CA0058.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::29) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ac29d23-0ab7-4f15-85f4-08d76c7bc43c
x-ms-traffictypediagnostic: DB3PR0202MB3289:
x-microsoft-antispam-prvs: <DB3PR0202MB3289C8F4B5754821FDC36608BC4D0@DB3PR0202MB3289.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(396003)(376002)(136003)(39830400003)(189003)(199004)(52314003)(31686004)(6486002)(6436002)(31696002)(81156014)(229853002)(8676002)(6116002)(386003)(3846002)(66556008)(2906002)(186003)(25786009)(305945005)(71190400001)(71200400001)(66476007)(7736002)(4326008)(76176011)(66446008)(64756008)(52116002)(256004)(102836004)(53546011)(6506007)(6512007)(26005)(86362001)(2501003)(8936002)(81166006)(99286004)(14454004)(486006)(66066001)(66946007)(65956001)(65806001)(4001150100001)(5660300002)(6246003)(110136005)(2616005)(446003)(508600001)(58126008)(11346002)(36756003)(476003)(316002)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3289;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UTfEHMWM458FsnSIsSYAHLnMZ2XYVoyYyQ5OANtSspivEo8OadGXixwYM2wE/WqUTGV5n7KLun/yro2XzgM0hlAJs9f0C9z1uOixV0mHIBnW6NvAiZWRIiR4TaKdyf601FFYBGmVN0PPobz+ST7PYqDS6t67RgYlsDk/srhNuydSKumi99fPVWx508Wy9pPw5+LIlTqJ+Ei96hxq3XSHIj5indR5hFPIqm7FISYqpCXWX6gYViqTiKO90vdHZCKCpqSczQFMAYgtNNJC0hPstQIqFKFPfEXiXxo+0Pupq08C6sePF+/QEUCrDNRwqvO0fjuzQsgMk806zeBSh8p/xTl1q37jZK5C1MO9zY/yxnSgiS69rnXPCorbrLMjMKp1D7MAjPelpbV7Wr/tohodOgSULITjm/c43D0jmfQTvdCzl+95bzE+2gT2NBoRQVr+
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D9B6528C538C247AD52B62748CCB05B@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac29d23-0ab7-4f15-85f4-08d76c7bc43c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 23:05:12.6751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: opp10Yit3C1W3JVwMcpSQHBVKJfxIOz2XZ3ca7XIHkSZ0rp3N7ozOt7TxF0mTYnk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3289
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMS0xNCAwOToxNywgc2h1YmhyYWp5b3RpLmRhdHRhQGdtYWlsLmNvbSB3cm90ZToN
Cj4gRnJvbTogU2h1YmhyYWp5b3RpIERhdHRhIDxzaHViaHJhanlvdGkuZGF0dGFAeGlsaW54LmNv
bT4NCj4gDQo+IEluIGNhc2Ugb2YgbXVsdGltYXN0ZXIgY29uZmlndXJhdGlvbiB0aGUgbGFzdCBj
aGFubmVsIGNhY2hlZCB2YWx1ZSBpcw0KPiBub3QgcmVsaWFibGUuIEJhc2ljYWxseSB0aGUgZmly
c3QgcHJvY2Vzc29yL21hc3RlciBkb2VzIGEgd3JpdGUgdG8gdGhlDQo+IG11eCBhbmQgdGhlbiB0
byB0aGUgaW50ZW5kZWQgc2xhdmUsIGl0IGNhY2hlcyB0aGUgdmFsdWUuDQo+IE5vdyB0aGUgc2Vj
b25kIHByb2Nlc3Nvci9wcm9jZXNzb3IgZG9lcyBhIHdyaXRlIHRvIG11eCBvbiBhbm90aGVyDQo+
IGNoYW5uZWwgYW5kIHdyaXRlcyB0byBhbm90aGVyIHNsYXZlLg0KPiBUaGUgZmlyc3QgcHJvY2Vz
c29yL21hc3RlciB3aGVuIGl0IGF0dGVtcHRzIHRvIHdyaXRlIHRoZSBzbGF2ZQ0KPiBza2lwcyB0
aGUgbXV4IGFzIGl0IHJlbGllcyBvbiB0aGUgbXV4IGNoYW5uZWwgYmVpbmcgdGhlIHNhbWUgYXMg
dGhlDQo+IGludGVuZGVkLiBUaGlzIGNhdXNlcyBhbiBpc3N1ZS4NCj4gDQo+IFRvIGZpeCB0aGF0
IHdyaXRlIGFsd2F5cyB0byB0aGUgbXV4IGFkZHJlc3MuDQoNClRoYW5rcyBmb3IgeW91ciBwYXRj
aC4NCg0KSG93ZXZlciwgSSBkb24ndCByZWFsbHkgc2VlIGhvdyB0aGlzIGZpeGVzIGFueXRoaW5n
LiBJZiB5b3UgaGF2ZQ0KbXVsdGlwbGUgbWFzdGVycyBjb21wZXRpbmcgZm9yIHRoZSBzYW1lIG11
eCwgYWxsIGJldHMgYXJlIG9mZiBhbmQgYW55DQpzb2x1dGlvbiBub3QgaW52b2x2aW5nIGFuIG91
dC1vZi1iYW5kIGNoYW5uZWwgd2hlcmUgdGhlIG1hc3RlcnMgY2FuDQpjb29yZGluYXRlIHdpbGwg
YmUgcmFjeSwgYnJva2VuIGFuZCBkYW5nZXJvdXMuIEFuZCBzaW5jZSB5b3UgbmVlZCB0aGF0DQpl
eHRyYSBjaGFubmVsIGFueXdheSwgaXQgbWlnaHQgYXMgd2VsbCBhbHNvIGJlIHVzZWQgdG8gY29v
cmRpbmF0ZSB3aGVuDQp0aGUgY2FjaGUgbmVlZHMgdG8gYmUgaW52YWxpZGF0ZWQuDQoNCkF0IHRo
ZSB2ZXJ5IGxlYXN0LCBhbGwgbGltaXRhdGlvbnMgbmVlZHMgdG8gYmUgY2FyZWZ1bGx5IGRvY3Vt
ZW50ZWQsDQpidXQgdGhhdCBkb2VzIG5vdCBtZWFuIHRoYXQgSSB3aWxsIGV2ZXIgbGlrZSBpdC4g
SW4gc2hvcnQsIEknbSBleHRyZW1lbHkNCnJlbHVjdGFudCB0byBhZGQgYSBrbHVkZ2UgbGlrZSB0
aGlzLg0KDQpDaGVlcnMsDQpQZXRlcg0K
