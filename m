Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C555547D57
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 10:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbfFQIkc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 04:40:32 -0400
Received: from mail-eopbgr40130.outbound.protection.outlook.com ([40.107.4.130]:33334
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725837AbfFQIkc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Jun 2019 04:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jzj4+IkjUakw/7CzBNHF5DLUcnR5vkg4IYlyJm2jb1o=;
 b=E9Ymmrs/xSYln+V9uLs3E3IU1JIeVLix22gWuBjByPauMxaEfZYSjkkFVOO17aZc2KdJL09pPCVhCwBmNNRQ/7hTf1dCRSxE+DYuWaiPOfuVCxsH++HPgUs+miyzq9ypKFl2kRK+YkzFkMmMwsAzC83WbW7e0QLfrjSLG8SKZSA=
Received: from VI1PR07MB5744.eurprd07.prod.outlook.com (20.177.202.24) by
 VI1PR07MB3519.eurprd07.prod.outlook.com (10.175.244.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.10; Mon, 17 Jun 2019 08:40:27 +0000
Received: from VI1PR07MB5744.eurprd07.prod.outlook.com
 ([fe80::fcde:79c2:8330:b9db]) by VI1PR07MB5744.eurprd07.prod.outlook.com
 ([fe80::fcde:79c2:8330:b9db%6]) with mapi id 15.20.2008.007; Mon, 17 Jun 2019
 08:40:27 +0000
From:   "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To:     Jean Delvare <jdelvare@suse.de>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: Add Block Write-Block Read Process Call
 support
Thread-Topic: [PATCH] i2c: i801: Add Block Write-Block Read Process Call
 support
Thread-Index: AQHVJOhQKcHQPdbfzkOJ4s4cRqqq9g==
Date:   Mon, 17 Jun 2019 08:40:27 +0000
Message-ID: <877aef82-eab1-dc0e-a0d3-d7aab3135c14@nokia.com>
References: <20180829161810.2147-1-alexander.sverdlin@nokia.com>
 <20190613111310.3be13499@endymion>
In-Reply-To: <20190613111310.3be13499@endymion>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.167]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: HE1P189CA0013.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::26)
 To VI1PR07MB5744.eurprd07.prod.outlook.com (2603:10a6:803:98::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6efbcb1-1b49-4ba2-1683-08d6f2ff725e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR07MB3519;
x-ms-traffictypediagnostic: VI1PR07MB3519:
x-microsoft-antispam-prvs: <VI1PR07MB3519E09C5D71B501484C098588EB0@VI1PR07MB3519.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(136003)(366004)(346002)(39860400002)(189003)(199004)(64126003)(6486002)(71200400001)(31686004)(11346002)(86362001)(71190400001)(66446008)(66476007)(66556008)(64756008)(2616005)(316002)(476003)(66946007)(446003)(31696002)(73956011)(2906002)(486006)(58126008)(6116002)(3846002)(256004)(6512007)(14444005)(99286004)(478600001)(68736007)(36756003)(65826007)(5660300002)(186003)(53546011)(25786009)(26005)(102836004)(66066001)(65956001)(65806001)(4326008)(14454004)(52116002)(6436002)(386003)(81166006)(6916009)(6246003)(4744005)(76176011)(8936002)(6506007)(8676002)(81156014)(7736002)(53936002)(229853002)(305945005);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR07MB3519;H:VI1PR07MB5744.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /v8zluHKA5lGhFn2oUp2qE6tlBdYKkvHmxJKHBKxhc332AZmWv19an5VDHexxyLRNFbM6hFMSqIQHVsuN1PfVHs9Iud5YxcGcr9vJYOxSK7Mk4+Nel+CG3Hgvz0FH7t4VsQf/SMonytxkV06ddq8pyIo8x2CoqAAp33/JDTfNg7+OidbdGk4yuQbteqJZrnJhnOQPWaJerHMkiNfL71EeyojkZCQecNigsXVgxO+fAc8J1dypnokhU50P02pQKOSMcJxc1rHPftClfGWDppYIXh+OW4oL3/04oy2LScINafjsjUCEgzMUm9tAyGep61C9U5fEdCppY3ifnpITxMYzGPNa9yVT5Dh0Iyfp5mEcX7CrymK6/lm2hZcydLBktT0d3htlkHMeP7LrMOj2si+3PYV9KhSfBE2v9uLBsRf3zY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3086A63A9E66B44BAA10F9D9CBEC42EB@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6efbcb1-1b49-4ba2-1683-08d6f2ff725e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 08:40:27.1853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alexander.sverdlin@nokia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB3519
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgSmVhbiwNCg0KT24gMTMvMDYvMjAxOSAxMToxMywgSmVhbiBEZWx2YXJlIHdyb3RlOg0KPj4g
QWRkIFNNQlVTIDIuMCBCbG9jayBXcml0ZS1CbG9jayBSZWFkIFByb2Nlc3MgQ2FsbCBjb21tYW5k
IHN1cHBvcnQuDQo+IEkgaGF2ZSBuZXZlciBzZWVuIGFueSBTTUJ1cyBkZXZpY2UgdXNpbmcgdGhp
cyBjb21tYW5kLiBXaGljaCBkZXZpY2UgZG8NCj4geW91IG5lZWQgaXQgZm9yPw0KDQpUaGF0J3Mg
b3VyIGluLWhvdXNlIEZQR0EgZGVzaWduLiBUaGlzIGRldmljZSBpcyBub3Qgb3RoZXJ3aXNlIHB1
YmxpY2x5IGF2YWlsYWJsZS4NCg0KPj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFN2ZXJkbGlu
IDxhbGV4YW5kZXIuc3ZlcmRsaW5Abm9raWEuY29tPg0KPj4gLS0tDQo+PiAgZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1pODAxLmMgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pDQo+PiAoLi4uKQ0KPiBMb29rcyBnb29kIG92ZXJhbGwsIGV4Y2VwdCBmb3IgbWlzc2lu
ZyBhbiB1cGRhdGUgdG8gdGhlIGRvY3VtZW50YXRpb24NCj4gZmlsZSAoRG9jdW1lbnRhdGlvbi9p
MmMvYnVzc2VzL2kyYy1pODAxKS4gSG93ZXZlciBJIHdpbGwgb25seSBjb25zaWRlcg0KPiBhcHBs
eWluZyB0aGUgcGF0Y2ggaWYgaXQgaGFzIGEgcmVhbCB1c2UgY2FzZS4NCg0KQnV0IHRoZSBzdXBw
b3J0IGZvciB0aGUgbmV3IGNvbW1hbmQgaXMgbG9uZy10aW1lIHRlc3RlZCBhbmQgcmVwb3J0ZWQg
dG8gd29yayBmaW5lLA0KdGhhdCdzIHdoeSBJIHRob3VnaHQgaXQgY2FuIGJlIG9mIGludGVyZXN0
IGZvciB0aGUgY29tbXVuaXR5Lg0KDQpQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSBzaG91bGQgdXBk
YXRlIHRoZSBkb2N1bWVudGF0aW9uIGFuZCByZS1zcGluIG9yIHRoaXMgaXMNCm5vdCBvZiB0aGUg
bWFpbnRhaW5lcidzIGludGVyZXN0IGF0IGFsbC4gDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KQWxl
eGFuZGVyIFN2ZXJkbGluLg0K
