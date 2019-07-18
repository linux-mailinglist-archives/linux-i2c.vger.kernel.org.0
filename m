Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BEAC6CB41
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2019 10:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389534AbfGRIsh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Jul 2019 04:48:37 -0400
Received: from mail-eopbgr80085.outbound.protection.outlook.com ([40.107.8.85]:32676
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389528AbfGRIsg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Jul 2019 04:48:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6MfIS5dhRfxtOyLqMT/K+7q7EmUTbPyMXwB0ZdNDDbcjo2I5NilGE/Gi4J8U8PvKGLIhLHsVAaPu/Q6MSdd/Oue4PLYu4r9cGjVN30dzo1UhMeKSamxZ3MCaCGes8KuBt+bo85U3p8IPqEOrtocsZ88b9vz3mlr/WTAi10SE0pQE1YtnVOwDjhYlq17u8Vs/PsUNKEyCyk6ZFP7EamcWoh3Nb0VIvsL8TgE8G7+XTO3jSCfkHkC5JSzmtGzBpFYqnch6Apjga5yd9Qaurq5U0aEsCAOJ1tzvoiVkLxKuTIFSXmMQxOvmtLGILnMyTa/P2VLV6ej8xngOHVrMocm7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhZ6MFuNqPvtei1ESQKY3A/LgusY6bjONwJXUrTGH6E=;
 b=PtXR5erITWYD1Uxlgg25xDBl8hBOVwLRzRiY8JgM+LR+McG1Yo9RQmSZzB2AMO7/sXCgJxD1cEE1wMYIAFe9S8VvSILLMwO9n0k1Q1zIU+mUMZxnFJac70VcjfCb8nkN0TNjz5xvi8uyTVJiGCcZ0rq1D2+oAE95b7n5e74+VsodvYu7PJUnyQeMTcltAyUxVk/n9ndkihu1P1mWbQW5coUhaWtUQvVBBZZA0JEgB84oKfBDgYvdt/V70FH1N7QMZal4fN69ieSfwUgUqkAcFFAbMqy44b7Kop3kHTSIGehloYRv1hmU6UwjmDQdTLkgwjAzmrMdgNTLWSKc/7aNhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhZ6MFuNqPvtei1ESQKY3A/LgusY6bjONwJXUrTGH6E=;
 b=IJLgZMs7pgSrzH577zdI4XQ+6BZ3JPcOGxmjktBRf/4Ev8d8DuH27+T2rmtVuiBwUSdWsw/SDVddpmXtHamdhA7hmhXcGneJofWuXyKWSWP/RooBWRnlRQR+xRrjf+oSQyDGLvdVcaiOKYiWrcssjojMAPBqADtmzeRvTPnrR0o=
Received: from AM6PR04MB4357.eurprd04.prod.outlook.com (52.135.167.33) by
 AM6PR04MB3973.eurprd04.prod.outlook.com (52.135.160.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 08:48:32 +0000
Received: from AM6PR04MB4357.eurprd04.prod.outlook.com
 ([fe80::f14c:9aff:4a98:1bcf]) by AM6PR04MB4357.eurprd04.prod.outlook.com
 ([fe80::f14c:9aff:4a98:1bcf%7]) with mapi id 15.20.2094.011; Thu, 18 Jul 2019
 08:48:31 +0000
From:   Chuanhua Han <chuanhua.han@nxp.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC:     "lenb@kernel.org" <lenb@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Leo Li <leoyang.li@nxp.com>,
        Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
        Udit Kumar <udit.kumar@nxp.com>
Subject: RE: [EXT] Re: [PATCH] ACPI: support for NXP i2c controller
Thread-Topic: [EXT] Re: [PATCH] ACPI: support for NXP i2c controller
Thread-Index: AQHVN9RWC3fNidOxSkCq2pP/dOUIIabQGo4AgAAAmTA=
Date:   Thu, 18 Jul 2019 08:48:31 +0000
Message-ID: <AM6PR04MB435762D38C6CA133A97C037097C80@AM6PR04MB4357.eurprd04.prod.outlook.com>
References: <20190711102601.20582-1-chuanhua.han@nxp.com>
 <4848044.j3iIk1DuVf@kreacher>
In-Reply-To: <4848044.j3iIk1DuVf@kreacher>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=chuanhua.han@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3b79c5b-9777-4905-4f8e-08d70b5cb644
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM6PR04MB3973;
x-ms-traffictypediagnostic: AM6PR04MB3973:
x-microsoft-antispam-prvs: <AM6PR04MB3973C25E3A8FC1EA1D5C6C9D97C80@AM6PR04MB3973.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(189003)(199004)(13464003)(54906003)(446003)(256004)(5660300002)(52536014)(99286004)(6116002)(4326008)(186003)(3846002)(26005)(53546011)(66556008)(71200400001)(71190400001)(76116006)(14454004)(316002)(66066001)(102836004)(9686003)(66446008)(66476007)(66946007)(64756008)(6506007)(229853002)(2906002)(44832011)(486006)(478600001)(11346002)(74316002)(7736002)(305945005)(6436002)(68736007)(476003)(53936002)(81156014)(33656002)(7696005)(81166006)(8676002)(76176011)(6246003)(6916009)(86362001)(25786009)(55016002)(8936002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR04MB3973;H:AM6PR04MB4357.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2o9eqHPaoQTFxFgTqZvxdS5nWd/UtYVHhHstM6mzMUAdiN28CIJ7VF1jDlNsO2LBVGUA3guN7UZNob2K8/ntX5CjEYKxoKBkLl+m2OPCKD1sX0UwHgSQs9Gbvnag4n0nOFO1y2zkOQRTNBZix/31wd91fNOq5kZAQzg1Vzkf09BpI/or5azYx7+rre97dbqxzoilFxIMH6NvqSMqh+Lo1gknHVT3VRdJp1WL5mgN9+c/w2FCLsMzU8MkaThfy+zzm4nAq+TPnqh6fssa/Y3zTNk73PLz5cPJ1DoFJ1Rkd6+3Zl0VeD6zjKSJXzXUhLdnKRdL2sInTT+zV/mPeduPNDRyCczbdzVAXqoul7lb29zIsvskfk0Q6dT9BbJaKUkg+BMO9UiA4/CxwHkZoWYdNPA2A7uzem77eU8QBnyQkTM=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b79c5b-9777-4905-4f8e-08d70b5cb644
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 08:48:31.8022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: chuanhua.han@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB3973
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGksIFJhZmFlbCBKLiBXeXNvY2tpDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogUmFmYWVsIEouIFd5c29ja2kgPHJqd0Byand5c29ja2kubmV0Pg0KPiBTZW50OiAyMDE5
xOo31MIxOMjVIDE2OjQ1DQo+IFRvOiBDaHVhbmh1YSBIYW4gPGNodWFuaHVhLmhhbkBueHAuY29t
Pg0KPiBDYzogbGVuYkBrZXJuZWwub3JnOyBzaGF3bmd1b0BrZXJuZWwub3JnOyBzLmhhdWVyQHBl
bmd1dHJvbml4LmRlOw0KPiBsaW51eC1hY3BpQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBMZW8gTGkNCj4gPGxlb3lhbmcubGlAbnhwLmNv
bT47IE1lZW5ha3NoaSBBZ2dhcndhbCA8bWVlbmFrc2hpLmFnZ2Fyd2FsQG54cC5jb20+Ow0KPiBV
ZGl0IEt1bWFyIDx1ZGl0Lmt1bWFyQG54cC5jb20+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFU
Q0hdIEFDUEk6IHN1cHBvcnQgZm9yIE5YUCBpMmMgY29udHJvbGxlcg0KPiANCj4gQ2F1dGlvbjog
RVhUIEVtYWlsDQo+IA0KPiBPbiBUaHVyc2RheSwgSnVseSAxMSwgMjAxOSAxMjoyNjowMSBQTSBD
RVNUIENodWFuaHVhIEhhbiB3cm90ZToNCj4gPiBFbmFibGUgTlhQIGkyYyBjb250cm9sbGVyIHRv
IGJvb3Qgd2l0aCBBQ1BJDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNZWVuYWtzaGkgQWdnYXJ3
YWwgPG1lZW5ha3NoaS5hZ2dhcndhbEBueHAuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFVkaXQg
S3VtYXIgPHVkaXQua3VtYXJAbnhwLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVhbmh1YSBI
YW4gPGNodWFuaHVhLmhhbkBueHAuY29tPg0KPiANCj4gSW4gY2FzZSB5b3Ugd2FudCB0aGlzIHRv
IGdvIGluIHRocm91Z2ggdGhlIGkyYyB0cmVlOg0KPiANCj4gQWNrZWQtYnk6IFJhZmFlbCBKLiBX
eXNvY2tpIDxyYWZhZWwuai53eXNvY2tpQGludGVsLmNvbT4NCj4gDQo+IG9yIGluIGNhc2UgeW91
IHdhbnQgbWUgdG8gdGFrZSBpdCwgcGxlYXNlIGxldCBtZSBrbm93LCBidXQgSSB3aWxsIG5lZWQg
YW4gQUNLDQo+IGZyb20gdGhlIGkyYyBzaWRlIHRoZW4uDQpJJ20gc29ycnksIEkgZG9uJ3QgcXVp
dGUgdW5kZXJzdGFuZA0KPiANCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9hY3BpL2FjcGlfYXBkLmMg
ICAgICB8ICA2ICsrKysrKw0KPiA+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jIHwgMTUg
KysrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9hY3BpX2FwZC5jIGIvZHJpdmVycy9h
Y3BpL2FjcGlfYXBkLmMgaW5kZXgNCj4gPiBmZjQ3MzE3Li5jZjg1NjZjIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvYWNwaS9hY3BpX2FwZC5jDQo+ID4gKysrIGIvZHJpdmVycy9hY3BpL2FjcGlf
YXBkLmMNCj4gPiBAQCAtMTY1LDYgKzE2NSwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFwZF9k
ZXZpY2VfZGVzYw0KPiB0aHVuZGVyeDJfaTJjX2Rlc2MgPSB7DQo+ID4gICAgICAgLmZpeGVkX2Ns
a19yYXRlID0gMTI1MDAwMDAwLA0KPiA+ICB9Ow0KPiA+DQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgYXBkX2RldmljZV9kZXNjIG54cF9pMmNfZGVzYyA9IHsNCj4gPiArICAgICAuc2V0dXAgPSBh
Y3BpX2FwZF9zZXR1cCwNCj4gPiArICAgICAuZml4ZWRfY2xrX3JhdGUgPSAzNTAwMDAwMDAsDQo+
ID4gK307DQo+ID4gKw0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGFwZF9kZXZpY2VfZGVzYyBo
aXAwOF9zcGlfZGVzYyA9IHsNCj4gPiAgICAgICAuc2V0dXAgPSBhY3BpX2FwZF9zZXR1cCwNCj4g
PiAgICAgICAuZml4ZWRfY2xrX3JhdGUgPSAyNTAwMDAwMDAsDQo+ID4gQEAgLTIzOCw2ICsyNDMs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlX2lkDQo+IGFjcGlfYXBkX2Rldmlj
ZV9pZHNbXSA9IHsNCj4gPiAgICAgICB7ICJISVNJMDJBMSIsIEFQRF9BRERSKGhpcDA3X2kyY19k
ZXNjKSB9LA0KPiA+ICAgICAgIHsgIkhJU0kwMkEyIiwgQVBEX0FERFIoaGlwMDhfaTJjX2Rlc2Mp
IH0sDQo+ID4gICAgICAgeyAiSElTSTAxNzMiLCBBUERfQUREUihoaXAwOF9zcGlfZGVzYykgfSwN
Cj4gPiArICAgICB7ICJOWFAwMDAxIiwgQVBEX0FERFIobnhwX2kyY19kZXNjKSB9LA0KPiA+ICAj
ZW5kaWYNCj4gPiAgICAgICB7IH0NCj4gPiAgfTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1pbXguYw0KPiA+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYyBp
bmRleCBiMWI4YjkzLi45OWY5Yjk2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtaW14LmMNCj4gPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jDQo+ID4g
QEAgLTQ0LDYgKzQ0LDcgQEANCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4g
PiAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+
DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9hY3BpLmg+DQo+ID4NCj4gPiAgLyogVGhpcyB3aWxsIGJl
IHRoZSBkcml2ZXIgbmFtZSB0aGUga2VybmVsIHJlcG9ydHMgKi8gICNkZWZpbmUNCj4gPiBEUklW
RVJfTkFNRSAiaW14LWkyYyINCj4gPiBAQCAtMjU1LDYgKzI1NiwxMiBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBpMmNfaW14X2R0X2lkc1tdDQo+ID4gPSB7ICB9OyAgTU9EVUxF
X0RFVklDRV9UQUJMRShvZiwgaTJjX2lteF9kdF9pZHMpOw0KPiA+DQo+ID4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgYWNwaV9kZXZpY2VfaWQgaTJjX2lteF9hY3BpX2lkc1tdID0gew0KPiA+ICsgICAg
IHsiTlhQMDAwMSIsIC5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmdmY2MTBfaTJjX2h3
ZGF0YX0sDQo+ID4gKyAgICAgeyB9DQo+ID4gK307DQo+ID4gK01PRFVMRV9ERVZJQ0VfVEFCTEUo
YWNwaSwgaTJjX2lteF9hY3BpX2lkcyk7DQo+ID4gKw0KPiA+ICBzdGF0aWMgaW5saW5lIGludCBp
c19pbXgxX2kyYyhzdHJ1Y3QgaW14X2kyY19zdHJ1Y3QgKmkyY19pbXgpICB7DQo+ID4gICAgICAg
cmV0dXJuIGkyY19pbXgtPmh3ZGF0YS0+ZGV2dHlwZSA9PSBJTVgxX0kyQzsgQEAgLTEwNTIsNiAr
MTA1OSw5DQo+ID4gQEAgc3RhdGljIGludCBpMmNfaW14X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpICB7DQo+ID4gICAgICAgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqb2Zf
aWQgPSBvZl9tYXRjaF9kZXZpY2UoaTJjX2lteF9kdF9pZHMsDQo+ID4NCj4gJnBkZXYtPmRldik7
DQo+ID4gKyAgICAgY29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlX2lkICphY3BpX2lkID0NCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgYWNwaV9tYXRjaF9kZXZpY2UoaTJjX2lteF9hY3BpX2lkcywN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnBkZXYtPmRldik7
DQo+ID4gICAgICAgc3RydWN0IGlteF9pMmNfc3RydWN0ICppMmNfaW14Ow0KPiA+ICAgICAgIHN0
cnVjdCByZXNvdXJjZSAqcmVzOw0KPiA+ICAgICAgIHN0cnVjdCBpbXhpMmNfcGxhdGZvcm1fZGF0
YSAqcGRhdGEgPQ0KPiA+IGRldl9nZXRfcGxhdGRhdGEoJnBkZXYtPmRldik7IEBAIC0xMDc5LDYg
KzEwODksOSBAQCBzdGF0aWMgaW50DQo+ID4gaTJjX2lteF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiA+DQo+ID4gICAgICAgaWYgKG9mX2lkKQ0KPiA+ICAgICAgICAgICAg
ICAgaTJjX2lteC0+aHdkYXRhID0gb2ZfaWQtPmRhdGE7DQo+ID4gKyAgICAgZWxzZSBpZiAoYWNw
aV9pZCkNCj4gPiArICAgICAgICAgICAgIGkyY19pbXgtPmh3ZGF0YSA9IChzdHJ1Y3QgaW14X2ky
Y19od2RhdGEgKikNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhY3BpX2lkLT5k
cml2ZXJfZGF0YTsNCj4gPiAgICAgICBlbHNlDQo+ID4gICAgICAgICAgICAgICBpMmNfaW14LT5o
d2RhdGEgPSAoc3RydWN0IGlteF9pMmNfaHdkYXRhICopDQo+ID4NCj4gPiBwbGF0Zm9ybV9nZXRf
ZGV2aWNlX2lkKHBkZXYpLT5kcml2ZXJfZGF0YTsNCj4gPiBAQCAtMTA5MSw2ICsxMTA0LDcgQEAg
c3RhdGljIGludCBpMmNfaW14X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYp
DQo+ID4gICAgICAgaTJjX2lteC0+YWRhcHRlci5uciAgICAgICAgICAgICA9IHBkZXYtPmlkOw0K
PiA+ICAgICAgIGkyY19pbXgtPmFkYXB0ZXIuZGV2Lm9mX25vZGUgICAgPSBwZGV2LT5kZXYub2Zf
bm9kZTsNCj4gPiAgICAgICBpMmNfaW14LT5iYXNlICAgICAgICAgICAgICAgICAgID0gYmFzZTsN
Cj4gPiArICAgICBBQ1BJX0NPTVBBTklPTl9TRVQoJmkyY19pbXgtPmFkYXB0ZXIuZGV2LA0KPiA+
ICsgQUNQSV9DT01QQU5JT04oJnBkZXYtPmRldikpOw0KPiA+DQo+ID4gICAgICAgLyogR2V0IEky
QyBjbG9jayAqLw0KPiA+ICAgICAgIGkyY19pbXgtPmNsayA9IGRldm1fY2xrX2dldCgmcGRldi0+
ZGV2LCBOVUxMKTsgQEAgLTEyNTMsNg0KPiA+ICsxMjY3LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0
Zm9ybV9kcml2ZXIgaTJjX2lteF9kcml2ZXIgPSB7DQo+ID4gICAgICAgICAgICAgICAubmFtZSA9
IERSSVZFUl9OQU1FLA0KPiA+ICAgICAgICAgICAgICAgLnBtID0gJmkyY19pbXhfcG1fb3BzLA0K
PiA+ICAgICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gaTJjX2lteF9kdF9pZHMsDQo+ID4g
KyAgICAgICAgICAgICAuYWNwaV9tYXRjaF90YWJsZSA9IEFDUElfUFRSKGkyY19pbXhfYWNwaV9p
ZHMpLA0KPiA+ICAgICAgIH0sDQo+ID4gICAgICAgLmlkX3RhYmxlID0gaW14X2kyY19kZXZ0eXBl
LA0KPiA+ICB9Ow0KPiA+DQo+IA0KPiANCj4gDQoNCg==
