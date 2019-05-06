Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A27B01458A
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 09:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbfEFHqz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 03:46:55 -0400
Received: from mail-eopbgr30062.outbound.protection.outlook.com ([40.107.3.62]:44010
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725855AbfEFHqy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 May 2019 03:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlbrpMn4jcauvmvLzlZ3Ywlezr8Ks2g3uPSkYHoLfzM=;
 b=AKjrTTeNTM4phOI1QRA5QhAozTAlVTh576pyGCGkVVIf3Xbi1Gvq0Qfcn0U5gmd+/p14USxq+J+D8LF2awBSvi7zryyE8+QXWnB44cBn9BClooP5TvwUFDP2391QmsUUh+CgrOxHystuS05FRQf8YRTn7Phb2T1zeBslJ3iddEA=
Received: from AM6PR04MB4357.eurprd04.prod.outlook.com (52.135.167.33) by
 AM6PR04MB4421.eurprd04.prod.outlook.com (20.177.39.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Mon, 6 May 2019 07:46:49 +0000
Received: from AM6PR04MB4357.eurprd04.prod.outlook.com
 ([fe80::f062:7002:6318:780b]) by AM6PR04MB4357.eurprd04.prod.outlook.com
 ([fe80::f062:7002:6318:780b%2]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 07:46:49 +0000
From:   Chuanhua Han <chuanhua.han@nxp.com>
To:     Sascha Hauer <s.hauer@pengutronix.de>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Leo Li <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "eha@deif.com" <eha@deif.com>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
        "peda@axentia.se" <peda@axentia.se>,
        Sumit Batra <sumit.batra@nxp.com>
Subject: RE: [EXT] Re: [PATCH 1/2] i2c: imx: I2C Driver doesn't consider
 I2C_IPGCLK_SEL RCW bit when using ls1046a SoC
Thread-Topic: [EXT] Re: [PATCH 1/2] i2c: imx: I2C Driver doesn't consider
 I2C_IPGCLK_SEL RCW bit when using ls1046a SoC
Thread-Index: AQHU/w+WtXmB7zSh+EKM7NDEvi24aqZUqIWAgAYQEbCAAwZvgIAAAgjQ
Date:   Mon, 6 May 2019 07:46:49 +0000
Message-ID: <AM6PR04MB4357663A5CBEF3BBC8EBCECC97300@AM6PR04MB4357.eurprd04.prod.outlook.com>
References: <20190430044719.30720-1-chuanhua.han@nxp.com>
 <20190430125043.weqwzim4gpsvtkfe@pengutronix.de>
 <AM6PR04MB43571B8D52C1FE9ED20DBA1D97360@AM6PR04MB4357.eurprd04.prod.outlook.com>
 <20190506073735.ctzybytamu44pbvv@pengutronix.de>
In-Reply-To: <20190506073735.ctzybytamu44pbvv@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=chuanhua.han@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1617b42f-a809-46a1-99f1-08d6d1f6ff22
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM6PR04MB4421;
x-ms-traffictypediagnostic: AM6PR04MB4421:
x-ms-exchange-purlcount: 1
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM6PR04MB442134B539C0538513456DBB97300@AM6PR04MB4421.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:612;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(136003)(346002)(376002)(396003)(199004)(189003)(13464003)(66946007)(6916009)(66476007)(64756008)(66446008)(68736007)(478600001)(7736002)(81156014)(256004)(52536014)(2906002)(7416002)(55016002)(14454004)(76176011)(7696005)(446003)(476003)(486006)(44832011)(11346002)(33656002)(53936002)(99286004)(316002)(26005)(229853002)(8676002)(186003)(6506007)(53546011)(45080400002)(102836004)(81166006)(966005)(8936002)(3846002)(6116002)(66556008)(54906003)(6436002)(305945005)(6246003)(4326008)(9686003)(25786009)(76116006)(74316002)(73956011)(71200400001)(66066001)(6306002)(5660300002)(86362001)(71190400001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR04MB4421;H:AM6PR04MB4357.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ksb1a7YzvjhbLMsWpgVca0zaqPl1uLu2cT3nkvWieJgwSppl6aIeMIltFQ2dvIz4sMK/Pc2odPs+vr2ageX9NPPleKGW8Y9NLfpMK3Bn6kN+9ci0UqGto8QXNQnxyNJFXBqu181AnKmcBr7rEVh8JfmAwmeP4gIklySOPa6tAOuA6R/W0FtCGRVilJPdSEMifyLUdOfsz/UrriK14/gRWbkg9tdtqmTOQI5UBqaKy+PTYLOmRiT6FmqRoAnxWRAJ+egI+lroQBufcckysfEtSaqmdUSLEnG+uKuHle7bmMCvsmWQaLmFV4P8ymz14IYkviVZXvEHSYfnGrHpAIGhQOnXLitLlbriX8fm7PIUhRTaLYiT7JkqlIJOHH6MAQiHiXL86XoZ1kJoAV31xXxKhO1gWwIq0Bi1ZpiDmi2yK7A=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1617b42f-a809-46a1-99f1-08d6d1f6ff22
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 07:46:49.1230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4421
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2FzY2hhIEhhdWVyIDxz
LmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KPiBTZW50OiAyMDE55bm0NeaciDbml6UgMTU6MzgNCj4g
VG86IENodWFuaHVhIEhhbiA8Y2h1YW5odWEuaGFuQG54cC5jb20+DQo+IENjOiBzaGF3bmd1b0Br
ZXJuZWwub3JnOyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IHJvYmgrZHRAa2VybmVsLm9y
ZzsNCj4gbWFyay5ydXRsYW5kQGFybS5jb207IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
DQo+IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGZlc3RldmFtQGdtYWls
LmNvbTsgZGwtbGludXgtaW14DQo+IDxsaW51eC1pbXhAbnhwLmNvbT47IHdzYStyZW5lc2FzQHNh
bmctZW5naW5lZXJpbmcuY29tOw0KPiB1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU7IGVo
YUBkZWlmLmNvbTsgbGludXhAcmVtcGVsLXByaXZhdC5kZTsNCj4gbC5zdGFjaEBwZW5ndXRyb25p
eC5kZTsgcGVkYUBheGVudGlhLnNlOyBTdW1pdCBCYXRyYQ0KPiA8c3VtaXQuYmF0cmFAbnhwLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtFWFRdIFJlOiBbUEFUQ0ggMS8yXSBpMmM6IGlteDogSTJDIERy
aXZlciBkb2Vzbid0IGNvbnNpZGVyDQo+IEkyQ19JUEdDTEtfU0VMIFJDVyBiaXQgd2hlbiB1c2lu
ZyBsczEwNDZhIFNvQw0KPiANCj4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+IA0KPiBPbiBTYXQsIE1h
eSAwNCwgMjAxOSBhdCAwOToyODo0OEFNICswMDAwLCBDaHVhbmh1YSBIYW4gd3JvdGU6DQo+ID4N
Cj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFNhc2No
YSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4NCj4gPiA+IFNlbnQ6IDIwMTnlubQ05pyI
MzDml6UgMjA6NTENCj4gPiA+IFRvOiBDaHVhbmh1YSBIYW4gPGNodWFuaHVhLmhhbkBueHAuY29t
Pg0KPiA+ID4gQ2M6IHNoYXduZ3VvQGtlcm5lbC5vcmc7IExlbyBMaSA8bGVveWFuZy5saUBueHAu
Y29tPjsNCj4gPiA+IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207DQo+
ID4gPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1pMmNAdmdlci5rZXJuZWwu
b3JnOw0KPiA+ID4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiA+ID4g
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGZlc3RldmFtQGdtYWlsLmNvbTsgZGwtbGludXgt
aW14DQo+ID4gPiA8bGludXgtaW14QG54cC5jb20+OyB3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVy
aW5nLmNvbTsNCj4gPiA+IHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZTsgZWhhQGRlaWYu
Y29tOw0KPiA+ID4gbGludXhAcmVtcGVsLXByaXZhdC5kZTsgbC5zdGFjaEBwZW5ndXRyb25peC5k
ZTsgcGVkYUBheGVudGlhLnNlOw0KPiA+ID4gU3VtaXQgQmF0cmEgPHN1bWl0LmJhdHJhQG54cC5j
b20+DQo+ID4gPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIDEvMl0gaTJjOiBpbXg6IEkyQyBE
cml2ZXIgZG9lc24ndCBjb25zaWRlcg0KPiA+ID4gSTJDX0lQR0NMS19TRUwgUkNXIGJpdCB3aGVu
IHVzaW5nIGxzMTA0NmEgU29DDQo+ID4gPg0KPiA+ID4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+ID4g
Pg0KPiA+ID4gT24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMTI6NDc6MThQTSArMDgwMCwgQ2h1YW5o
dWEgSGFuIHdyb3RlOg0KPiA+ID4gPiBUaGUgY3VycmVudCBrZXJuZWwgZHJpdmVyIGRvZXMgbm90
IGNvbnNpZGVyIEkyQ19JUEdDTEtfU0VMICg0MjQNCj4gPiA+ID4gYml0IG9mDQo+ID4gPiA+IFJD
VykgaW4gZGVjaWRpbmcgIGkyY19jbGtfcmF0ZSBpbiBmdW5jdGlvbiBpMmNfaW14X3NldF9jbGso
KSB7IDANCj4gPiA+ID4gUGxhdGZvcm0gY2xvY2svNCwgMSBQbGF0Zm9ybSBjbG9jay8yfS4NCj4g
PiA+ID4NCj4gPiA+ID4gV2hlbiB1c2luZyBsczEwNDZhIFNvQywgdGhpcyBwb3B1bGF0ZXMgaW5j
b3JyZWN0IHZhbHVlIGluIElCRkQNCj4gPiA+ID4gcmVnaXN0ZXIgaWYgSTJDX0lQR0NMS19TRUwg
PSAwLCB3aGljaCBnZW5lcmF0ZXMgaGFsZiBvZiB0aGUgZGVzaXJlZCBDbG9jay4NCj4gPiA+ID4N
Cj4gPiA+ID4gVGhlcmVmb3JlLCBpZiBsczEwNDZhIFNvQyBpcyB1c2VkLCB3ZSBuZWVkIHRvIHNl
dCB0aGUgaTJjIGNsb2NrDQo+ID4gPiA+IGFjY29yZGluZyB0byB0aGUgY29ycmVzcG9uZGluZyBS
Q1cuDQo+ID4gPg0KPiA+ID4gU28gdGhlIGNsb2NrIGRyaXZlciByZXBvcnRzIHRoZSB3cm9uZyBj
bG9jay4gUGxlYXNlIGZpeCB0aGUgY2xvY2sgZHJpdmVyIHRoZW4uDQo+ID4gTm8sIHRoaXMgaXMg
YSBwcm9ibGVtIHdpdGggdGhlIGkyYyBkcml2ZXIuIEl0IGlzIG5vdCBhIHByb2JsZW0gd2l0aA0K
PiA+IHRoZSBjbG9jayBkcml2ZXIsIHNvIHRoZSBpMmMgZHJpdmVyIG5lZWRzIHRvIGJlIG1vZGlm
aWVkLg0KPiANCj4gU28gaG93IGRvZXMgdGhpcyBSQ1cgYml0IGdldCBldmFsdWF0ZWQ/IEFjY29y
ZGluZyB0byB0aGUgcmVmZXJlbmNlIG1hbnVhbA0KPiBvbmx5IG9uZSBjbG9jayBnb2VzIHRvIHRo
ZSBpMmMgbW9kdWxlIChkZXNjcmliZWQgYXMgMS8yIFBsYXRmb3JtDQo+IENsb2NrKSBhbmQgdGhl
IGkyYyBtb2R1bGUgb25seSB0YWtlcyBvbmUgY2xvY2suIFNvIGl0IHNlZW1zIHRoZXJlIG11c3Qg
YmUgYSAvMg0KPiBkaXZpZGVyIHNvbWV3aGVyZSwgZWl0aGVyIGluIGVhY2ggaTJjIG1vZHVsZSBv
ciBzb21ld2hlcmUgb3V0c2lkZS4gQ2FuIHlvdXINCj4gSUMgZ3V5cyB0ZWxsIHlvdSB3aGVyZSBp
dCBpcz8NCj4gDQo+IE9uZSByZWFzb24gSSBzdWdnZXN0ZWQgdGhlIGNsb2NrIGRyaXZlciBpcyB0
aGF0IHRoZSBjbG9jayBkcml2ZXIgY29udGFpbnMgU29DDQo+IHNwZWNpZmljIGNvZGUgYWxyZWFk
eSwgc28gaXQgc2hvdWxkIGJlIGVhc2llciB0byBpbnRlZ3JhdGUgdGhlcmUuDQpPSywgSSB3aWxs
IHNlZSB0aGF0IGl0IGNhbiBiZSBxdWFsaWZpZWQgaW4gdGhlIGNsb2NrIGRyaXZlci4NCj4gDQo+
IFNhc2NoYQ0KPiANCj4gDQo+IC0tDQo+IFBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAg
ICAgICAgICAgICB8DQo+IHwNCj4gSW5kdXN0cmlhbCBMaW51eCBTb2x1dGlvbnMgICAgICAgICAg
ICAgICAgIHwNCj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNv
bS8/dXJsPWh0dHAlM0ElMkYlMkZ3d3cucGUNCj4gbmd1dHJvbml4LmRlJTJGJmFtcDtkYXRhPTAy
JTdDMDElN0NjaHVhbmh1YS5oYW4lNDBueHAuY29tJTdDYjJkDQo+IDQ2ODA2OTljNDQ4ZTg1MTQz
MDhkNmQxZjViZjgyJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2Mw0KPiA1JTdDMCU3
QzAlN0M2MzY5MjcyNTA3NDM1MTY1NjMmYW1wO3NkYXRhPXBGZENiaURYRSUyRkRsbDAxWDlOag0K
PiBIZzNTQ0RwRUN6Z3JyOE1MdFlCZEtINWMlM0QmYW1wO3Jlc2VydmVkPTAgIHwNCj4gUGVpbmVy
IFN0ci4gNi04LCAzMTEzNyBIaWxkZXNoZWltLCBHZXJtYW55IHwgUGhvbmU6ICs0OS01MTIxLTIw
NjkxNy0wDQo+IHwNCj4gQW10c2dlcmljaHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAg
IHwgRmF4Og0KPiArNDktNTEyMS0yMDY5MTctNTU1NSB8DQo=
