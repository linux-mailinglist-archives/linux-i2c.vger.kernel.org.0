Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D654D6D92
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2019 05:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfJODR5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 23:17:57 -0400
Received: from mail-eopbgr20076.outbound.protection.outlook.com ([40.107.2.76]:7907
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726259AbfJODR5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Oct 2019 23:17:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeDISvn++maYwZS6IlEcCOtq10JQGap3e4ho3gB8phelroWinhCy48gqmfsW0gEdtqhDS7LWYCSZmZYuQaSUG9GhyC4LCL55t3ZioVMaMwSG2hZx/UVsuHB0PDPa/p8Vuzj+7MUHg4YjLxYQZ81ympjYNBk2i3HiaTYEwt8TnhPxO3AaE3tc56+YM1o6UnTaPXdtyYer3THQM8xk4vdUvvdTkCFzJ0XePQa1vFvFcRr7+Z71+3eItuom1gs1HZRnmSgGcqNmb/WCPfJdn5aPhgUbD/LHdZtpG7CUkrxXUEEhLDdztVGYEyU7zLEbntjqIVT1dL5jRuxzyZ4j9O8Ytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izfC476EAjfnPTI7M+wVRRQlivECgHaHjOzZl7jJA3Q=;
 b=lhCE8/9M1Ex4nPUhCMWIhan2De95LOVt3GNUqJO4Sxqx0WUrmgEkWv/IUzNy44buZMR0EspByX1g42LrTisgKcBPu66vhcQCvN43sLMVi+PiWqZr+ybMNK/M0r637jWuvOCzassmho0BrZ+AxJezKts7VP5ZmwS33C6k3NvwBWEp7k4KuZ1mQ18xxxrjTpLHsmHejHLE4UKgTN8FRLeYTCMgk/kA7XWa6WpzopRI3t40noZrazIWqA3g0cXr4alUOLxqMbBuTKZ8HjDG7EMiMTJBnM3NjXpprNGazqkID5s+WFHnnhQoIr9QHGnrnUrgGqTNLtgWy6sZOK9WwKS8ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izfC476EAjfnPTI7M+wVRRQlivECgHaHjOzZl7jJA3Q=;
 b=KUubWXhtamc3f2ropf2TYJk+zZPYvY/D9TDMp+DD8fHH6ktopiHJGR/G+knH6EvokcQOFzhoZfMZo7pVmn3rJGvkXeJk3AhsJpvGZkltAooNHXhXhXXgnxH4kv4IRu80EgZF/FrNxumZxFcaaEvX63cWuCIjb8WBz+E+RjAZ55A=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4699.eurprd04.prod.outlook.com (20.176.233.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 03:17:51 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11%7]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 03:17:50 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Peter Rosin <peda@axentia.se>, Leo Li <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH 2/2] i2c: mux: pca954x: replace property
 i2c-mux-idle-disconnect
Thread-Topic: [EXT] Re: [PATCH 2/2] i2c: mux: pca954x: replace property
 i2c-mux-idle-disconnect
Thread-Index: AQHVgoOwKvhf+7tOikalLMCcBtmwHadaTLYAgAC7wsA=
Date:   Tue, 15 Oct 2019 03:17:50 +0000
Message-ID: <DB7PR04MB44906BE3732F777C4DBB67538F930@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20191014112558.3881-1-biwen.li@nxp.com>
 <20191014112558.3881-2-biwen.li@nxp.com>
 <f3d1e68e-dfb0-b820-7797-1f0d95fa72dd@axentia.se>
In-Reply-To: <f3d1e68e-dfb0-b820-7797-1f0d95fa72dd@axentia.se>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 763337d0-094f-4ac8-7b85-08d7511e42ee
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DB7PR04MB4699:|DB7PR04MB4699:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4699B5D170631C8441055B458F930@DB7PR04MB4699.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(189003)(199004)(81156014)(81166006)(8936002)(44832011)(8676002)(486006)(9686003)(186003)(7736002)(6436002)(64756008)(66476007)(66556008)(76176011)(66946007)(74316002)(53546011)(66446008)(6506007)(7696005)(66066001)(76116006)(99286004)(476003)(446003)(11346002)(6246003)(86362001)(229853002)(478600001)(2501003)(25786009)(33656002)(4326008)(3846002)(6116002)(14444005)(52536014)(71190400001)(71200400001)(256004)(316002)(14454004)(102836004)(305945005)(55016002)(26005)(54906003)(110136005)(5660300002)(2906002)(4001150100001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4699;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +Aht1EnaEg25MM9G5ZSyBtJLFK2X0IcITkZIC6DWZt1qICJ0R7mdWDAGqO/nVdybmxDw7F3LF/Mumqtrm42s0oWoSM8yMQYtF1TepwYaveCoyAEAvNtuE7qnNi9SqAIiU/I28w+oESk9EyiqvY4g/yjMpblgm16+2prBZjjHfNU6DUAmNnuXpykZ683+5EvShlC1n2amyjEbfI7CiWJ3dpZh2Nc3ZdMjiJK9OS2gEaACFB9Sb2bd/EzolwEOtxKLq5dSr3qq+xWaSuKp+iGaMYPfCaLRsyfN3RtzvOlyP/NGfMackN3Myb+/+t2OCRn15XcUmku44tSDVxBj6uq7syYbyXpPuHTzWOCiMYx0KOlkGANyAGzNVE6kYo6i1Qv1UAZoGzDEwFEVclWBcUvkuBHZDaVNyY2E9GbdLhiDpQo=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763337d0-094f-4ac8-7b85-08d7511e42ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 03:17:50.9219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iSOs4JxZ7hmGKHh76mda+/yz6HGDojrcCLBZmVqSko4itXGUpWx6tTp6880aN9MA3Lig350SViEbbcomQMBkGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4699
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiANCj4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+IA0KPiBPbiAyMDE5LTEwLTE0IDEzOjI1LCBCaXdl
biBMaSB3cm90ZToNCj4gPiBUaGlzIHJlcGxhY2VzIHByb3BlcnR5IGkyYy1tdXgtaWRsZS1kaXNj
b25uZWN0IHdpdGggaWRsZS1zdGF0ZQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQml3ZW4gTGkg
PGJpd2VuLmxpQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvaTJjL211eGVzL2kyYy1t
dXgtcGNhOTU0eC5jIHwgNDQNCj4gPiArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMNCj4g
PiBiL2RyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtcGNhOTU0eC5jDQo+ID4gaW5kZXggOTIzYWEz
YTVhM2RjLi5hMzMwOTI5YzRkNjcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pMmMvbXV4ZXMv
aTJjLW11eC1wY2E5NTR4LmMNCj4gPiArKysgYi9kcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBj
YTk1NHguYw0KPiA+IEBAIC04Niw3ICs4Niw3IEBAIHN0cnVjdCBwY2E5NTR4IHsNCj4gPg0KPiA+
ICAgICAgIHU4IGxhc3RfY2hhbjsgICAgICAgICAgIC8qIGxhc3QgcmVnaXN0ZXIgdmFsdWUgKi8N
Cj4gPiAgICAgICAvKiBNVVhfSURMRV9BU19JUywgTVVYX0lETEVfRElTQ09OTkVDVCBvciA+PSAw
IGZvciBjaGFubmVsICovDQo+ID4gLSAgICAgczggaWRsZV9zdGF0ZTsNCj4gPiArICAgICBzMzIg
aWRsZV9zdGF0ZTsNCj4gPg0KPiA+ICAgICAgIHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQ7DQo+
ID4NCj4gPiBAQCAtMjU2LDcgKzI1Niw3IEBAIHN0YXRpYyBpbnQgcGNhOTU0eF9kZXNlbGVjdF9t
dXgoc3RydWN0DQo+ID4gaTJjX211eF9jb3JlICptdXhjLCB1MzIgY2hhbikgIHsNCj4gPiAgICAg
ICBzdHJ1Y3QgcGNhOTU0eCAqZGF0YSA9IGkyY19tdXhfcHJpdihtdXhjKTsNCj4gPiAgICAgICBz
dHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gZGF0YS0+Y2xpZW50Ow0KPiA+IC0gICAgIHM4IGlk
bGVfc3RhdGU7DQo+ID4gKyAgICAgczMyIGlkbGVfc3RhdGU7DQo+ID4NCj4gPiAgICAgICBpZGxl
X3N0YXRlID0gUkVBRF9PTkNFKGRhdGEtPmlkbGVfc3RhdGUpOw0KPiA+ICAgICAgIGlmIChpZGxl
X3N0YXRlID49IDApDQo+ID4gQEAgLTQxMSw3ICs0MTEsNiBAQCBzdGF0aWMgaW50IHBjYTk1NHhf
cHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCj4gPiAgICAgICBzdHJ1Y3QgaTJjX2Fk
YXB0ZXIgKmFkYXAgPSBjbGllbnQtPmFkYXB0ZXI7DQo+ID4gICAgICAgc3RydWN0IGRldmljZSAq
ZGV2ID0gJmNsaWVudC0+ZGV2Ow0KPiA+ICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBk
ZXYtPm9mX25vZGU7DQo+ID4gLSAgICAgYm9vbCBpZGxlX2Rpc2Nvbm5lY3RfZHQ7DQo+ID4gICAg
ICAgc3RydWN0IGdwaW9fZGVzYyAqZ3BpbzsNCj4gPiAgICAgICBzdHJ1Y3QgaTJjX211eF9jb3Jl
ICptdXhjOw0KPiA+ICAgICAgIHN0cnVjdCBwY2E5NTR4ICpkYXRhOw0KPiA+IEBAIC00NjIsMjIg
KzQ2MSwzMSBAQCBzdGF0aWMgaW50IHBjYTk1NHhfcHJvYmUoc3RydWN0IGkyY19jbGllbnQNCj4g
KmNsaWVudCwNCj4gPiAgICAgICAgICAgICAgIH0NCj4gPiAgICAgICB9DQo+ID4NCj4gPiArICAg
ICBpZiAob2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJpZGxlLXN0YXRlIiwgJmRhdGEtPmlkbGVf
c3RhdGUpKQ0KPiA+ICsgICAgICAgICAgICAgZGF0YS0+aWRsZV9zdGF0ZSA9IE1VWF9JRExFX0FT
X0lTOw0KPiA+ICsNCj4gPiAgICAgICAvKiBXcml0ZSB0aGUgbXV4IHJlZ2lzdGVyIGF0IGFkZHIg
dG8gdmVyaWZ5DQo+ID4gICAgICAgICogdGhhdCB0aGUgbXV4IGlzIGluIGZhY3QgcHJlc2VudC4g
VGhpcyBhbHNvDQo+ID4gICAgICAgICogaW5pdGlhbGl6ZXMgdGhlIG11eCB0byBkaXNjb25uZWN0
ZWQgc3RhdGUuDQo+ID4gICAgICAgICovDQo+ID4gLSAgICAgaWYgKGkyY19zbWJ1c193cml0ZV9i
eXRlKGNsaWVudCwgMCkgPCAwKSB7DQo+ID4gKyAgICAgaWYgKGRhdGEtPmlkbGVfc3RhdGUgPj0g
MCl7DQo+IA0KPiBTcGFjZSBiZWZvcmUgew0KT2theSwgZ290IGl0LCBJIHdpbGwgYWRkIGl0IGlu
IHYyLg0KPiANCj4gPiArICAgICAgICAgICAgIGRhdGEtPmxhc3RfY2hhbiA9IGRhdGEtPmlkbGVf
c3RhdGU7DQo+IA0KPiBkYXRhLT5sYXN0X2NoYW4gc2hvdWxkIGhhdmUgdGhlIGFjdHVhbCByZWdp
c3RlciB2YWx1ZSwgaS5lLiAodW50ZXN0ZWQpDQpPa2F5LCBnb3QgaXQsIEkgd2lsbCBhZGp1c3Qg
aXQgaW4gdjIuDQo+IA0KPiAgICAgICAgICAgICAgICAgaWYgKGRhdGEtPmNoaXAtPm11eHR5cGUg
PT0gcGNhOTU0eF9pc211eCkNCj4gICAgICAgICAgICAgICAgICAgICAgICAgZGF0YS0+bGFzdF9j
aGFuID0gZGF0YS0+aWRsZV9zdGF0ZSB8DQo+IGRhdGEtPmNoaXAtPmVuYWJsZTsNCj4gICAgICAg
ICAgICAgICAgIGVsc2UNCj4gICAgICAgICAgICAgICAgICAgICAgICAgZGF0YS0+bGFzdF9jaGFu
ID0gMSA8PCBkYXRhLT5pZGxlX3N0YXRlOw0KPiANCj4gICAgICAgICAgICAgICAgIHJldCA9IGky
Y19zbWJ1c193cml0ZV9ieXRlKGNsaWVudCwgZGF0YS0+bGFzdF9jaGFuKTsNCj4gDQo+IEJ1dCBz
aW5jZSB0aGlzIHJlZ3ZhbCBjYWxjdWxhdGlvbiBpcyBub3cgbmVlZGVkIGluIHRocmVlIHBsYWNl
cywgaXQgc2hvdWxkIGJlDQo+IG1vdmVkIHRvIGEgaGVscGVyIGZ1bmN0aW9uLg0KWW91IGFyZSBy
aWdodCwgSSB3aWxsIGFkZCBhIGhlbHBlciBmdW5jdGlvbiBpbiB2Mi4NCj4gDQo+ID4gKyAgICAg
ICAgICAgICAvKiBBbHdheXMgZW5hYmxlIG11bHRpcGxleGVyICovDQo+ID4gKyAgICAgICAgICAg
ICByZXQgPSBpMmNfc21idXNfd3JpdGVfYnl0ZShjbGllbnQsIGRhdGEtPmxhc3RfY2hhbiB8DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGRhdGEtPmNoaXAtPm11eHR5cGUgPT0N
Cj4gcGNhOTU0eF9pc211eCA/DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRh
dGEtPmNoaXAtPmVuYWJsZSA6IDApKTsNCj4gPiArICAgICB9DQo+ID4gKyAgICAgZWxzZXsNCj4g
DQo+IFNwYWNlIGJlZm9yZSB7DQpHb3QgaXQsIEkgd2lsbCBhZGQgaXQgaW4gdjIuDQo+IA0KPiBO
YXR1cmFsbHksIHlvdSBoYXZlIHRoZSBleGFjdCBzYW1lIGlzc3VlcyBpbiB0aGUgcGNhOTU0eF9y
ZXN1bWUgaHVuaywNCj4gYmVsb3cuDQpHb3QgaXQNCj4gDQo+ID4gKyAgICAgICAgICAgICBkYXRh
LT5sYXN0X2NoYW4gPSAwOyAgICAgICAgICAgICAgIC8qIGZvcmNlIHRoZSBmaXJzdA0KPiBzZWxl
Y3Rpb24gKi8NCj4gPiArICAgICAgICAgICAgIC8qIERpc2Nvbm5lY3QgbXVsdGlwbGV4ZXIgKi8N
Cj4gPiArICAgICAgICAgICAgIHJldCA9IGkyY19zbWJ1c193cml0ZV9ieXRlKGNsaWVudCwgZGF0
YS0+bGFzdF9jaGFuKTsNCj4gPiArICAgICB9DQo+ID4gKw0KPiA+ICsgICAgIGlmIChyZXQgPCAw
KSB7DQo+ID4gICAgICAgICAgICAgICBkZXZfd2FybihkZXYsICJwcm9iZSBmYWlsZWRcbiIpOw0K
PiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+ID4gICAgICAgfQ0KPiA+DQo+ID4g
LSAgICAgZGF0YS0+bGFzdF9jaGFuID0gMDsgICAgICAgICAgICAgICAvKiBmb3JjZSB0aGUgZmly
c3Qgc2VsZWN0aW9uICovDQo+ID4gLSAgICAgZGF0YS0+aWRsZV9zdGF0ZSA9IE1VWF9JRExFX0FT
X0lTOw0KPiA+IC0NCj4gPiAtICAgICBpZGxlX2Rpc2Nvbm5lY3RfZHQgPSBucCAmJg0KPiA+IC0g
ICAgICAgICAgICAgb2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiaTJjLW11eC1pZGxlLWRpc2Nv
bm5lY3QiKTsNCj4gPiAtICAgICBpZiAoaWRsZV9kaXNjb25uZWN0X2R0KQ0KPiA+IC0gICAgICAg
ICAgICAgZGF0YS0+aWRsZV9zdGF0ZSA9IE1VWF9JRExFX0RJU0NPTk5FQ1Q7DQo+IA0KPiBJbiBj
YXNlIHRoZSBpZGxlLXN0YXRlIHByb3BlcnR5IGlzIG1pc3NpbmcsIHlvdSBuZWVkIHRvIGZhbGwg
YmFjayB0byB0aGUgb2xkDQo+IGJlaGF2aW9yIGFuZCBoYW5kbGUgaTJjLW11eC1pZGxlLWRpc2Nv
bm5lY3QgYXMgYmVmb3JlLg0KT2theSwgZ290IGl0LCBJIHdpbGwgYWRkIGl0IGluIHYyLg0KPiAN
Cj4gQ2hlZXJzLA0KPiBQZXRlcg0KPiANCj4gPg0KPiA+ICAgICAgIHJldCA9IHBjYTk1NHhfaXJx
X3NldHVwKG11eGMpOw0KPiA+ICAgICAgIGlmIChyZXQpDQo+ID4gQEAgLTUzMSw4ICs1MzksMTgg
QEAgc3RhdGljIGludCBwY2E5NTR4X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gICAg
ICAgc3RydWN0IGkyY19tdXhfY29yZSAqbXV4YyA9IGkyY19nZXRfY2xpZW50ZGF0YShjbGllbnQp
Ow0KPiA+ICAgICAgIHN0cnVjdCBwY2E5NTR4ICpkYXRhID0gaTJjX211eF9wcml2KG11eGMpOw0K
PiA+DQo+ID4gLSAgICAgZGF0YS0+bGFzdF9jaGFuID0gMDsNCj4gPiAtICAgICByZXR1cm4gaTJj
X3NtYnVzX3dyaXRlX2J5dGUoY2xpZW50LCAwKTsNCj4gPiArICAgICBpZiAoZGF0YS0+aWRsZV9z
dGF0ZSA+PSAwKXsNCj4gPiArICAgICAgICAgICAgIGRhdGEtPmxhc3RfY2hhbiA9IGRhdGEtPmlk
bGVfc3RhdGU7DQo+ID4gKyAgICAgICAgICAgICAvKiBBbHdheXMgZW5hYmxlIG11bHRpcGxleGVy
ICovDQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gaTJjX3NtYnVzX3dyaXRlX2J5dGUoY2xpZW50
LCBkYXRhLT5sYXN0X2NoYW4gfA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChk
YXRhLT5jaGlwLT5tdXh0eXBlID09DQo+IHBjYTk1NHhfaXNtdXggPw0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBkYXRhLT5jaGlwLT5lbmFibGUgOiAwKSk7DQo+ID4gKyAgICAg
fQ0KPiA+ICsgICAgIGVsc2V7DQo+ID4gKyAgICAgICAgICAgICBkYXRhLT5sYXN0X2NoYW4gPSAw
Ow0KPiA+ICsgICAgICAgICAgICAgLyogRGlzY29ubmVjdCBtdWx0aXBsZXhlciAqLw0KPiA+ICsg
ICAgICAgICAgICAgcmV0dXJuIGkyY19zbWJ1c193cml0ZV9ieXRlKGNsaWVudCwgZGF0YS0+bGFz
dF9jaGFuKTsNCj4gPiArICAgICB9DQo+ID4gIH0NCj4gPiAgI2VuZGlmDQo+ID4NCj4gPg0KDQo=
