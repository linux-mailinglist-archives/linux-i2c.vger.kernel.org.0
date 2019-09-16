Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1024FB36A6
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2019 10:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731248AbfIPIwT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Sep 2019 04:52:19 -0400
Received: from mail-eopbgr80134.outbound.protection.outlook.com ([40.107.8.134]:20743
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727387AbfIPIwS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Sep 2019 04:52:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKYWBCHY6iz9x+JKJ2EI1633MQdv+i9dm8Ucl5+jTerX/CV9RXTw+AWO532Wsu49nHF5MBfmnBeHGsKcTLQdyoP6v1TgKAtdVi03CbWZWB4K+zo0WTypZiGmMmkaUYjU1pcrEBfuXP9LoRphBekr9VJTkv2vz/Iekr74KPG17bzaLXwKUQshaYHVLaO9qxe3JdRsZ1tGw9LE/YlXTKO4urcOvxtPpaVoMINQkFBt8vS3/hw84cCUtwpJfs0vZPSPknN6jpnPBjW2u+MOxZA9umqoUx7DR1X6MYhWTdiBOwIeCTfc/0uxFWAQUZf6269XWrKpMTOf8v1b3aozhP5k8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRIARm+Wm3X2zfjm8stG8cgvGwjK2tVT0aFreFhFyyc=;
 b=kN78iO9On6KiNXNPN36yvt2adZz9NhafY6zcLxELYMftAwvPoq8gLJvzj+32VdP12gxZY1v4Qhpb6DoZE22HnjFS2xyLUK9EVedfFlvmbqGZoDhZVR4AswsfnmTqbKR/7S3/tFOer690adN/DODgsROTyKOs/dLQ6WaTeeUd8T9HeiUc+n5t4Z/+SYbOOHoeVzT7S1s7HqltZ7OnSvGohPcgRda3K5GwOPm3liQmND/rFVemZy7kuRZ/AzV5MfgNyC1rRa5yA+6fK8ykPG3JYyLs+VBDZDSKII67S0mhW+jiBrUK0AEMFiJXSh0wllpxVPr5NRow51PG3bQiB6W4pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRIARm+Wm3X2zfjm8stG8cgvGwjK2tVT0aFreFhFyyc=;
 b=BlARCMOWKkwTwxeGcbcBrW7RR/GjBP7im3z+B612icCzVCDl6p3PqXjiutBtvda2PzY+aNG9HRbrLkdxE84HK+nAArQTWSF7jpE677Ujd+o4OdOhorrWdcfgSTfyvgmyGhU6PCOY+CDlUBZluWnowJC4mm3duPfVT3KUjabzkeo=
Received: from AM6PR0702MB3527.eurprd07.prod.outlook.com (52.133.24.149) by
 AM6PR0702MB3558.eurprd07.prod.outlook.com (52.133.23.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.6; Mon, 16 Sep 2019 08:52:14 +0000
Received: from AM6PR0702MB3527.eurprd07.prod.outlook.com
 ([fe80::892c:2b90:e54f:ab56]) by AM6PR0702MB3527.eurprd07.prod.outlook.com
 ([fe80::892c:2b90:e54f:ab56%3]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 08:52:14 +0000
From:   "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To:     Jean Delvare <jdelvare@suse.de>,
        "Xu, Lingyan (NSB - CN/Hangzhou)" <lingyan.xu@nokia-sbell.com>
CC:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>,
        "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i801_smbus: clear SMBALERT status bit and disable
 SMBALERT interrupt
Thread-Topic: [PATCH] i801_smbus: clear SMBALERT status bit and disable
 SMBALERT interrupt
Thread-Index: AQHVYf2CtQ6bNeFFV0qdOS3acGbEtQ==
Date:   Mon, 16 Sep 2019 08:52:14 +0000
Message-ID: <6b59725a-f42b-b6f7-c93d-da218d050529@nokia.com>
References: <1565577634-18264-1-git-send-email-lingyan.xu@nokia-sbell.com>
 <20190828155822.7cb13a7b@endymion>
 <a6cd1872effd46c7ba088f28402b32b8@nokia-sbell.com>
 <20190905145716.137e155a@endymion>
In-Reply-To: <20190905145716.137e155a@endymion>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.166]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
x-clientproxiedby: HE1PR05CA0306.eurprd05.prod.outlook.com
 (2603:10a6:7:93::37) To AM6PR0702MB3527.eurprd07.prod.outlook.com
 (2603:10a6:209:11::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dec5ea9e-e2bc-49d7-e4b8-08d73a832b7d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:AM6PR0702MB3558;
x-ms-traffictypediagnostic: AM6PR0702MB3558:
x-ld-processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0702MB3558CA4D2916144813EE1D44888C0@AM6PR0702MB3558.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(189003)(199004)(52054003)(52314003)(81166006)(31696002)(99286004)(2906002)(478600001)(6486002)(14454004)(316002)(52116002)(3846002)(6116002)(7736002)(53936002)(58126008)(110136005)(54906003)(66066001)(65956001)(65806001)(6512007)(66946007)(66476007)(66556008)(64756008)(66446008)(305945005)(25786009)(31686004)(102836004)(6436002)(5660300002)(6246003)(26005)(86362001)(36756003)(256004)(229853002)(14444005)(186003)(71190400001)(71200400001)(11346002)(53546011)(6506007)(386003)(446003)(76176011)(486006)(4326008)(2616005)(8676002)(476003)(81156014)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR0702MB3558;H:AM6PR0702MB3527.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UDIM3A/SAJSBdE5ExSQ6wbzr80nInfWg0HbTfIHwPnOtJufqIkRV8k8blLmvsMQm7XaAzO1KrNxVU6sSgcBjN6Ux8/8/6NjC19hU4NFS9exGQIcppy4sL2sRSgD/Q33mmkpxdQebl/C8yGsH+vzaq/rLVm75O47wf6/AzaG27YCu2DS9UgiD6Je4NnerIVRGe2zvGUITSeJwNqLbQEdxVxQKkInCvy82UMmZIX6YjswnMU/3mHfFMUzcjT0WLsp/7pC5kHBj051rKSJTmyeJkhKQ9hpHk92/eryH4Sf9iWeegB4pnTgDKAM8ssQDowNz+cwNS97t9l4ZthjwVpMJRt214IWtEBj/9hiwGEB9gb5jralxvs4mmLnsY5935C3a9eZRLXb6TTb8doYPNLl4TYkJ6olRxcFvq9QJBTxb3xI=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F496D332CE8E8242A15232BE7C2F4D51@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec5ea9e-e2bc-49d7-e4b8-08d73a832b7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 08:52:14.2721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yVoYJJ3wOimsb3xO8dG/sQGbRotmBQVvojkdOYfhdzv/Jw2Xa31wDczOCTSZUIhdGdkBDjBK774dZg9oDQ9GdCrAgj8p/USPJsxWkpDTuk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0702MB3558
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGVsbG8gSmVhbiwNCg0KT24gMDUvMDkvMjAxOSAxNDo1NywgSmVhbiBEZWx2YXJlIHdyb3RlOg0K
PiBJZiB0aGlzIGlzIG9mIGFueSB2YWx1ZSB0byB5b3UsIEkgdHJpZWQgaW1wbGVtZW50aW5nIGl0
IGluIGkyYy1pODAxIGENCj4gZmV3IGRheXMgYWdvLiBJIGNhbid0IHJlYWxseSB0ZXN0IGl0IHRo
b3VnaCBhcyBJIGRvbid0IGhhdmUgYW55IGRldmljZQ0KPiB3aGljaCB0cmlnZ2VycyBhbiBhbGVy
dCBvbiBteSBzeXN0ZW0sIGJ1dCBJIGFtIHNoYXJpbmcgaXQgd2l0aCB5b3UgaWYNCj4geW91IHdh
bnQgdG8gZ2l2ZSBpdCBhIHRyeS4gWW91IHdvdWxkIHN0aWxsIG5lZWQgdG8gd3JpdGUgdGhlIGNv
ZGUgaW4NCj4gdGhlIHNsYXZlIGRyaXZlci4NCg0KSSdtIGdvaW5nIHRvIHRlc3QgeW91ciBwYXRj
aCAoSSBhY3R1YWxseSBtYWRlIHZlcnkgc2ltaWxhciBvbmUgY291cGxlIG9mIGRheXMNCmFnbyks
IGJ1dCBJIGhhdmUgYSBjb3VwbGUgb2YgY29tbWVudHMgdG8gdGhlIGJlbG93IHZlcnNpb246DQoN
Cj4gLS0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWk4MDEuYyB8ICAgNzcgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNjkg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IC0tLSBsaW51eC01LjIub3JpZy9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLWk4MDEuYwkyMDE5LTA4LTI4IDE1OjU4OjUyLjcyNTgyODIx
NSArMDIwMA0KPiArKysgbGludXgtNS4yL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaTgwMS5jCTIw
MTktMDgtMjggMTY6NTA6MDkuMjEyNjk2MDM3ICswMjAwDQo+IEBAIC0xOTYsNiArMTk2LDcgQEAN
Cj4gIA0KPiAgLyogSG9zdCBOb3RpZnkgQ29tbWFuZCByZWdpc3RlciBiaXRzICovDQo+ICAjZGVm
aW5lIFNNQlNMVkNNRF9IU1RfTlRGWV9JTlRSRU4JQklUKDApDQo+ICsjZGVmaW5lIFNNQlNMVkNN
RF9TTUJBTEVSVF9ESVMJCUJJVCgyKQ0KPiAgDQo+ICAjZGVmaW5lIFNUQVRVU19FUlJPUl9GTEFH
UwkoU01CSFNUU1RTX0ZBSUxFRCB8IFNNQkhTVFNUU19CVVNfRVJSIHwgXA0KPiAgCQkJCSBTTUJI
U1RTVFNfREVWX0VSUikNCj4gQEAgLTI4MSw2ICsyODIsMTAgQEAgc3RydWN0IGk4MDFfcHJpdiB7
DQo+ICAJICovDQo+ICAJYm9vbCBhY3BpX3Jlc2VydmVkOw0KPiAgCXN0cnVjdCBtdXRleCBhY3Bp
X2xvY2s7DQo+ICsNCj4gKwkvKiBTTUJ1cyBhbGVydCAqLw0KPiArCXN0cnVjdCBpMmNfc21idXNf
YWxlcnRfc2V0dXAgYWxlcnRfZGF0YTsNCj4gKwlzdHJ1Y3QgaTJjX2NsaWVudCAqYXJhOw0KPiAg
fTsNCj4gIA0KPiAgI2RlZmluZSBGRUFUVVJFX1NNQlVTX1BFQwlCSVQoMCkNCj4gQEAgLTI4OSw2
ICsyOTQsNyBAQCBzdHJ1Y3QgaTgwMV9wcml2IHsNCj4gICNkZWZpbmUgRkVBVFVSRV9JMkNfQkxP
Q0tfUkVBRAlCSVQoMykNCj4gICNkZWZpbmUgRkVBVFVSRV9JUlEJCUJJVCg0KQ0KPiAgI2RlZmlu
ZSBGRUFUVVJFX0hPU1RfTk9USUZZCUJJVCg1KQ0KPiArI2RlZmluZSBGRUFUVVJFX1NNQlVTX0FM
RVJUCUJJVCg2KQ0KPiAgLyogTm90IHJlYWxseSBhIGZlYXR1cmUsIGJ1dCBpdCdzIGNvbnZlbmll
bnQgdG8gaGFuZGxlIGl0IGFzIHN1Y2ggKi8NCj4gICNkZWZpbmUgRkVBVFVSRV9JREYJCUJJVCgx
NSkNCj4gICNkZWZpbmUgRkVBVFVSRV9UQ09fU1BUCQlCSVQoMTYpDQo+IEBAIC0zMDEsNiArMzA3
LDcgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmk4MDFfZmVhdHVyZV9uYW1lc1tdDQo+ICAJIkkyQyBi
bG9jayByZWFkIiwNCj4gIAkiSW50ZXJydXB0IiwNCj4gIAkiU01CdXMgSG9zdCBOb3RpZnkiLA0K
PiArCSJTTUJ1cyBBbGVydCIsDQo+ICB9Ow0KPiAgDQo+ICBzdGF0aWMgdW5zaWduZWQgaW50IGRp
c2FibGVfZmVhdHVyZXM7DQo+IEBAIC0zMTAsNyArMzE3LDggQEAgTU9EVUxFX1BBUk1fREVTQyhk
aXNhYmxlX2ZlYXR1cmVzLCAiRGlzYQ0KPiAgCSJcdFx0ICAweDAyICBkaXNhYmxlIHRoZSBibG9j
ayBidWZmZXJcbiINCj4gIAkiXHRcdCAgMHgwOCAgZGlzYWJsZSB0aGUgSTJDIGJsb2NrIHJlYWQg
ZnVuY3Rpb25hbGl0eVxuIg0KPiAgCSJcdFx0ICAweDEwICBkb24ndCB1c2UgaW50ZXJydXB0c1xu
Ig0KPiAtCSJcdFx0ICAweDIwICBkaXNhYmxlIFNNQnVzIEhvc3QgTm90aWZ5ICIpOw0KPiArCSJc
dFx0ICAweDIwICBkaXNhYmxlIFNNQnVzIEhvc3QgTm90aWZ5XG4iDQo+ICsJIlx0XHQgIDB4NDAg
IGRpc2FibGUgU01CdXMgQWxlcnQgIik7DQo+ICANCj4gIC8qIE1ha2Ugc3VyZSB0aGUgU01CdXMg
aG9zdCBpcyByZWFkeSB0byBzdGFydCB0cmFuc21pdHRpbmcuDQo+ICAgICBSZXR1cm4gMCBpZiBp
dCBpcywgLUVCVVNZIGlmIGl0IGlzIG5vdC4gKi8NCj4gQEAgLTYyMCw4ICs2MjgsMjQgQEAgc3Rh
dGljIGlycXJldHVybl90IGk4MDFfaG9zdF9ub3RpZnlfaXNyKA0KPiAgCXJldHVybiBJUlFfSEFO
RExFRDsNCj4gIH0NCj4gIA0KPiArc3RhdGljIGlycXJldHVybl90IGk4MDFfc21idXNfYWxlcnRf
aXNyKHN0cnVjdCBpODAxX3ByaXYgKnByaXYpDQo+ICt7DQo+ICsJc3RydWN0IGkyY19jbGllbnQg
KmFyYSA9IHByaXYtPmFyYTsNCj4gKw0KPiArCWlmIChhcmEpIHsNCj4gKwkJZGV2X2RiZygmYXJh
LT5kZXYsICJTTUJ1cyBhbGVydCByZWNlaXZlZFxuIik7DQo+ICsJCWkyY19oYW5kbGVfc21idXNf
YWxlcnQoYXJhKTsNCj4gKwl9IGVsc2UNCj4gKwkJZGV2X2RiZygmcHJpdi0+YWRhcHRlci5kZXYs
DQo+ICsJCQkiU01CdXMgYWxlcnQgcmVjZWl2ZWQgYnV0IG5vIEFSQSBjbGllbnQhXG4iKTsNCj4g
Kw0KPiArCS8qIGNsZWFyIFNNQnVzIEFsZXJ0IGJpdCBhbmQgcmV0dXJuICovDQo+ICsJb3V0Yl9w
KFNNQkhTVFNUU19TTUJBTEVSVF9TVFMsIFNNQkhTVFNUUyhwcml2KSk7DQo+ICsJcmV0dXJuIElS
UV9IQU5ETEVEOw0KPiArfQ0KPiArDQo+ICAvKg0KPiAtICogVGhlcmUgYXJlIHRocmVlIGtpbmRz
IG9mIGludGVycnVwdHM6DQo+ICsgKiBUaGVyZSBhcmUgZm91ciBraW5kcyBvZiBpbnRlcnJ1cHRz
Og0KPiAgICoNCj4gICAqIDEpIGk4MDEgc2lnbmFscyB0cmFuc2FjdGlvbiBjb21wbGV0aW9uIHdp
dGggb25lIG9mIHRoZXNlIGludGVycnVwdHM6DQo+ICAgKiAgICAgIElOVFIgLSBTdWNjZXNzDQo+
IEBAIC02MzUsNiArNjU5LDggQEAgc3RhdGljIGlycXJldHVybl90IGk4MDFfaG9zdF9ub3RpZnlf
aXNyKA0KPiAgICogICAgb2NjdXJzIGZvciBlYWNoIGJ5dGUgb2YgYSBieXRlLWJ5LWJ5dGUgdG8g
cHJlcGFyZSB0aGUgbmV4dCBieXRlLg0KPiAgICoNCj4gICAqIDMpIEhvc3QgTm90aWZ5IGludGVy
cnVwdHMNCj4gKyAqDQo+ICsgKiA0KSBTTUJ1cyBBbGVydCBpbnRlcnJ1cHRzDQo+ICAgKi8NCj4g
IHN0YXRpYyBpcnFyZXR1cm5fdCBpODAxX2lzcihpbnQgaXJxLCB2b2lkICpkZXZfaWQpDQo+ICB7
DQo+IEBAIC02NTMsNiArNjc5LDEyIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBpODAxX2lzcihpbnQg
aXJxLCB2b2kNCj4gIAkJCXJldHVybiBpODAxX2hvc3Rfbm90aWZ5X2lzcihwcml2KTsNCj4gIAl9
DQo+ICANCj4gKwlpZiAocHJpdi0+ZmVhdHVyZXMgJiBGRUFUVVJFX1NNQlVTX0FMRVJUKSB7DQo+
ICsJCXN0YXR1cyA9IGluYl9wKFNNQkhTVFNUUyhwcml2KSk7DQo+ICsJCWlmIChzdGF0dXMgJiBT
TUJIU1RTVFNfU01CQUxFUlRfU1RTKQ0KPiArCQkJcmV0dXJuIGk4MDFfc21idXNfYWxlcnRfaXNy
KHByaXYpOw0KPiArCX0NCj4gKw0KPiAgCXN0YXR1cyA9IGluYl9wKFNNQkhTVFNUUyhwcml2KSk7
DQo+ICAJaWYgKHN0YXR1cyAmIFNNQkhTVFNUU19CWVRFX0RPTkUpDQo+ICAJCWk4MDFfaXNyX2J5
dGVfZG9uZShwcml2KTsNCj4gQEAgLTEwMDYsOSArMTAzOCwzNSBAQCBzdGF0aWMgdm9pZCBpODAx
X2VuYWJsZV9ob3N0X25vdGlmeShzdHJ1DQo+ICAJb3V0Yl9wKFNNQlNMVlNUU19IU1RfTlRGWV9T
VFMsIFNNQlNMVlNUUyhwcml2KSk7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyB2b2lkIGk4MDFfZGlz
YWJsZV9ob3N0X25vdGlmeShzdHJ1Y3QgaTgwMV9wcml2ICpwcml2KQ0KPiArc3RhdGljIHZvaWQg
aTgwMV9lbmFibGVfc21idXNfYWxlcnQoc3RydWN0IGkyY19hZGFwdGVyICphZGFwdGVyKQ0KPiAg
ew0KPiAtCWlmICghKHByaXYtPmZlYXR1cmVzICYgRkVBVFVSRV9IT1NUX05PVElGWSkpDQo+ICsJ
c3RydWN0IGk4MDFfcHJpdiAqcHJpdiA9IGkyY19nZXRfYWRhcGRhdGEoYWRhcHRlcik7DQo+ICsN
Cj4gKwlpZiAoIShwcml2LT5mZWF0dXJlcyAmIEZFQVRVUkVfU01CVVNfQUxFUlQpKQ0KPiArCQly
ZXR1cm47DQo+ICsNCj4gKwlwcml2LT5hcmEgPSBpMmNfc2V0dXBfc21idXNfYWxlcnQoYWRhcHRl
ciwgJnByaXYtPmFsZXJ0X2RhdGEpOw0KPiArCWlmICghcHJpdi0+YXJhKSB7DQo+ICsJCWRldl93
YXJuKCZhZGFwdGVyLT5kZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIgQVJBIGNsaWVudFxuIik7DQo+
ICsNCj4gKwkJLyogRGlzYWJsZSBTTUJ1cyBBbGVydCBpbnRlcnJ1cHRzICovDQo+ICsJCWlmICgh
KFNNQlNMVkNNRF9TTUJBTEVSVF9ESVMgJiBwcml2LT5vcmlnaW5hbF9zbHZjbWQpKQ0KPiArCQkJ
b3V0Yl9wKFNNQlNMVkNNRF9TTUJBTEVSVF9ESVMgfCBwcml2LT5vcmlnaW5hbF9zbHZjbWQsDQo+
ICsJCQkgICAgICAgU01CU0xWQ01EKHByaXYpKTsNCj4gKwkJcmV0dXJuOw0KPiArCX0NCj4gKw0K
PiArCWlmIChTTUJTTFZDTURfU01CQUxFUlRfRElTICYgcHJpdi0+b3JpZ2luYWxfc2x2Y21kKQ0K
PiArCQlvdXRiX3AoflNNQlNMVkNNRF9TTUJBTEVSVF9ESVMgJiBwcml2LT5vcmlnaW5hbF9zbHZj
bWQsDQo+ICsJCSAgICAgICBTTUJTTFZDTUQocHJpdikpOw0KPiArDQo+ICsJLyogQ2xlYXIgU01C
dXMgQWxlcnQgYml0IHRvIGFsbG93IGEgbmV3IG5vdGlmaWNhdGlvbiAqLw0KPiArCW91dGJfcChT
TUJIU1RTVFNfU01CQUxFUlRfU1RTLCBTTUJIU1RTVFMocHJpdikpOw0KDQpJJ2QgcmF0aGVyIGhh
bmRsZSB0aGUgcGVuZGluZyBBTEVSVCMgbm90IHRvIGxvc2UgdGhlIEFMRVJUUyBmcm9tIHRoZSBi
b290DQp0aW1lIGZvciBpbnN0YW5jZS4gVGhpcyBjbGVhcmluZyBvZiB0aGUgcGVuZGluZyBiaXQg
aGVyZSBkb2Vzbid0IGhlbHANCmFueXdheSwgcGxlYXNlIHJlZmVyIGJlbG93Og0KDQo+ICt9DQo+
ICsNCj4gK3N0YXRpYyB2b2lkIGk4MDFfcmVzdG9yZV9zbHZjbWQoc3RydWN0IGk4MDFfcHJpdiAq
cHJpdikNCj4gK3sNCj4gKwlpZiAoIShwcml2LT5mZWF0dXJlcyAmIChGRUFUVVJFX0hPU1RfTk9U
SUZZIHwgRkVBVFVSRV9TTUJVU19BTEVSVCkpKQ0KPiAgCQlyZXR1cm47DQo+ICANCj4gIAlvdXRi
X3AocHJpdi0+b3JpZ2luYWxfc2x2Y21kLCBTTUJTTFZDTUQocHJpdikpOw0KPiBAQCAtMTgyMyw4
ICsxODgxLDggQEAgc3RhdGljIGludCBpODAxX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpkZQ0KPiAg
CQlvdXRiX3AoaW5iX3AoU01CQVVYQ1RMKHByaXYpKSAmDQo+ICAJCSAgICAgICB+KFNNQkFVWENU
TF9DUkMgfCBTTUJBVVhDVExfRTMyQiksIFNNQkFVWENUTChwcml2KSk7DQo+ICANCj4gLQkvKiBS
ZW1lbWJlciBvcmlnaW5hbCBIb3N0IE5vdGlmeSBzZXR0aW5nICovDQo+IC0JaWYgKHByaXYtPmZl
YXR1cmVzICYgRkVBVFVSRV9IT1NUX05PVElGWSkNCg0KSSdkIHByb3Bvc2UgdG8gZGlzYWJsZSB0
aGUgQUxFUlQjIGZvciB0aGUgdGltZSBvZiBzZXR0aW5nIHVwIEFSQSBoZXJlLi4uDQoNCj4gKwkv
KiBSZW1lbWJlciBvcmlnaW5hbCBIb3N0IE5vdGlmeSBhbmQgU01CdXMgQWxlcnQgc2V0dGluZyAq
Lw0KPiArCWlmIChwcml2LT5mZWF0dXJlcyAmIChGRUFUVVJFX0hPU1RfTk9USUZZIHwgRkVBVFVS
RV9TTUJVU19BTEVSVCkpDQo+ICAJCXByaXYtPm9yaWdpbmFsX3NsdmNtZCA9IGluYl9wKFNNQlNM
VkNNRChwcml2KSk7DQo+ICANCj4gIAkvKiBEZWZhdWx0IHRpbWVvdXQgaW4gaW50ZXJydXB0IG1v
ZGU6IDIwMCBtcyAqLw0KDQpCZWNhdXNlIGJldHdlZW4gdGhlc2UgdHdvIGh1bmtzIHdlIGVuYWJs
ZSB0aGUgaW50ZXJydXB0cyBhbmQgd2Ugd2lsbA0KanVtcCBpbnRvIElSUSBoYW5kbGVyIHdpdGhv
dXQgQVJBIGJlaW5nIHNldCB1cC4NCg0KPiBAQCAtMTg3NSw2ICsxOTMzLDcgQEAgc3RhdGljIGlu
dCBpODAxX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpkZQ0KPiAgCX0NCj4gIA0KPiAgCWk4MDFfZW5h
YmxlX2hvc3Rfbm90aWZ5KCZwcml2LT5hZGFwdGVyKTsNCj4gKwlpODAxX2VuYWJsZV9zbWJ1c19h
bGVydCgmcHJpdi0+YWRhcHRlcik7DQoNCi4uLiBhbmQgcmUtZW5hYmxlIEFMRVJUIyBoZXJlIGFn
YWluLi4uIA0KDQo+ICAJaTgwMV9wcm9iZV9vcHRpb25hbF9zbGF2ZXMocHJpdik7DQo+ICAJLyog
V2UgaWdub3JlIGVycm9ycyAtIG11bHRpcGxleGluZyBpcyBvcHRpb25hbCAqLw0KPiBAQCAtMTg5
Nyw4ICsxOTU2LDEwIEBAIHN0YXRpYyB2b2lkIGk4MDFfcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICoN
Cj4gIAlwbV9ydW50aW1lX2ZvcmJpZCgmZGV2LT5kZXYpOw0KPiAgCXBtX3J1bnRpbWVfZ2V0X25v
cmVzdW1lKCZkZXYtPmRldik7DQo+ICANCj4gLQlpODAxX2Rpc2FibGVfaG9zdF9ub3RpZnkocHJp
dik7DQo+ICsJaTgwMV9yZXN0b3JlX3NsdmNtZChwcml2KTsNCj4gIAlpODAxX2RlbF9tdXgocHJp
dik7DQo+ICsJaWYgKHByaXYtPmFyYSkNCj4gKwkJaTJjX3VucmVnaXN0ZXJfZGV2aWNlKHByaXYt
PmFyYSk7DQo+ICAJaTJjX2RlbF9hZGFwdGVyKCZwcml2LT5hZGFwdGVyKTsNCj4gIAlpODAxX2Fj
cGlfcmVtb3ZlKHByaXYpOw0KPiAgCXBjaV93cml0ZV9jb25maWdfYnl0ZShkZXYsIFNNQkhTVENG
RywgcHJpdi0+b3JpZ2luYWxfaHN0Y2ZnKTsNCj4gQEAgLTE5MTYsNyArMTk3Nyw3IEBAIHN0YXRp
YyB2b2lkIGk4MDFfc2h1dGRvd24oc3RydWN0IHBjaV9kZXYNCj4gIAlzdHJ1Y3QgaTgwMV9wcml2
ICpwcml2ID0gcGNpX2dldF9kcnZkYXRhKGRldik7DQo+ICANCj4gIAkvKiBSZXN0b3JlIGNvbmZp
ZyByZWdpc3RlcnMgdG8gYXZvaWQgaGFyZCBoYW5nIG9uIHNvbWUgc3lzdGVtcyAqLw0KPiAtCWk4
MDFfZGlzYWJsZV9ob3N0X25vdGlmeShwcml2KTsNCj4gKwlpODAxX3Jlc3RvcmVfc2x2Y21kKHBy
aXYpOw0KPiAgCXBjaV93cml0ZV9jb25maWdfYnl0ZShkZXYsIFNNQkhTVENGRywgcHJpdi0+b3Jp
Z2luYWxfaHN0Y2ZnKTsNCj4gIH0NCg0KSSBjYW4gZG8gc29tZSB0ZXN0cyB0byBwcm92ZSBteSBh
c3N1bXB0aW9uIHJlZ2FyZGluZyBwZW5kaW5nIEFMRVJUIy4NCk9yIGRvIHlvdSBhZ3JlZSB3aXRo
IHRoZSBhYm92ZSBhbmQgSSBzaG91bGQgdGVzdCBvbmx5IG1vZGlmaWVkIHZlcnNpb24NCndpdGgg
ZGlzYWJsZS1yZWdpc3RlckFSQS1yZS1lbmFibGUgc2V0dXA/IFdoYXQgYXJlIHlvdXIgdGhvdWdo
dHM/DQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KQWxleGFuZGVyIFN2ZXJkbGluLg0K
