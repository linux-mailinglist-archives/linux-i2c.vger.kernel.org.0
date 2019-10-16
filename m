Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 123E6D8651
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2019 05:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390900AbfJPDYs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Oct 2019 23:24:48 -0400
Received: from mail-eopbgr130089.outbound.protection.outlook.com ([40.107.13.89]:51677
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726973AbfJPDYs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 15 Oct 2019 23:24:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRWdBVbJdfXEA8atLmXOFRC3fHbcXWiNtOCh0t7yOirOBUb+a39VLa7xpMIntye9GFiFyr81/j9YbdWqnIYEHrCglJFd9x//a4b1v7b8aXn81C2hhEaM+2T3brOQITvxNWiOMOpxRghiADYptIojcCn/OTGweUYfA2tX+0Q31UeVeFb6ZgiifB5FpB9fcv6gUBYmZTG++lVOXT9rRO3RabIA5Q7hR+EajOQuGAv/KYbq09tzu7s/IIJayRVqRquaduhGvg/B4pKHVqUKHyJ0x7MWEUoESXkt3gDxRpRgzdBcy4poDjc8SFbPLOYZxATLYtzqC4x2MhBra3Y3M/aySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeOnnnDCtkSteiP58E74Dp+PFCoDGsDT8C1sZ2/Klk4=;
 b=n9uHfcP3lKl3U7M73PueueF5r6rKNcn2cOpKUfmgazLivjERIQuKhFnD3KIGCRhEEuWXx+R13VPnAO5Q6ZpT+vlvO8CY0nmL3b3AYBvM/3u1UOxY7kDlG4flgYBT6ExazAlcsGScPqngU0kZPOP39QMCNhthgh+rUxZaduBMy5BOV8x4lLB+lAx9Zhbbe/HT8rDBzFKPbhayx/nVl/plCqS+WHgkPxTuq/iUOHQQmdTXK5GNe+e06cJL0O3/HOG+ZtjQUKe3Vzt/C2i44dVXLQw5aCeETxGr1mw0/HTUMoWKafqQZ7mya6HfQ1w9MoP5iRHEPQMsja0fZ86JOZSqrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeOnnnDCtkSteiP58E74Dp+PFCoDGsDT8C1sZ2/Klk4=;
 b=cN0SnW24ktNATm7RtD57yRzSIWd4vYciQ2AJBYh5U3+X8PiKjn43MYYOqZna0/Oimu6WNmMfzpNs4+0vtjE1obPcQtKMmPeyQiTaVp4fJjkyn/lFgKzSJH+QHu3IyTK5rhQILCAZBPBqUU56P+abqUIubkO8WQh4uBlIlKSsCsE=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB5148.eurprd04.prod.outlook.com (20.176.233.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Wed, 16 Oct 2019 03:24:26 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11%7]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 03:24:26 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Peter Rosin <peda@axentia.se>, Leo Li <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [v2,2/2] i2c: mux: pca954x: add property idle-state
Thread-Topic: [EXT] Re: [v2,2/2] i2c: mux: pca954x: add property idle-state
Thread-Index: AQHVgxVYAENBiQg8pU2zik4U7qx0iqdbu3kAgADZ8cA=
Date:   Wed, 16 Oct 2019 03:24:26 +0000
Message-ID: <DB7PR04MB4490322ED91EC17B383D9B958F920@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20191015044839.23746-1-biwen.li@nxp.com>
 <20191015044839.23746-2-biwen.li@nxp.com>
 <e53f0a07-eaae-7f84-8e87-da4e99f0105a@axentia.se>
In-Reply-To: <e53f0a07-eaae-7f84-8e87-da4e99f0105a@axentia.se>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f954d3c0-f1a1-49eb-1e71-08d751e85932
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DB7PR04MB5148:|DB7PR04MB5148:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB514874EAE87ACBB4CB214B978F920@DB7PR04MB5148.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(189003)(199004)(66066001)(81156014)(14444005)(2906002)(5660300002)(186003)(316002)(110136005)(54906003)(6246003)(55016002)(9686003)(6116002)(256004)(476003)(8936002)(76116006)(26005)(33656002)(11346002)(81166006)(66446008)(64756008)(66476007)(66946007)(52536014)(446003)(66556008)(99286004)(71200400001)(44832011)(4326008)(486006)(102836004)(7736002)(53546011)(4001150100001)(3846002)(6506007)(7696005)(71190400001)(6436002)(76176011)(2501003)(478600001)(86362001)(305945005)(8676002)(74316002)(229853002)(25786009)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB5148;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qgm28E+SKxvjYuN8B/B4MHRf0r28E6DScSooHC+uYXzeDGouTLdZfnik2lTKwl4UIt/5n5sSI5C/w7wxdSo/0+CXjo/68+hrrESobBTe92s/9u6x5wQa/20ya6/bqCi4Sd6kv4BmjFzDvG+UsMGHLyDtFRdnBRo4DsXddgCdI6RqNCtpyq0iL84ARO6pKOmN1fp2redqyMz8Vvo6F82/In755OwQPCPytfIkSAn1oWna6fnN/Y/ltmRTuy0cvoTXTDKn0ZOLDCNUTX0ff6L+Ky9TX696tzG8R0UstfcOWe3GL7aKfdSUMPUhvdK6qfO08C5gUp4XZ2gGVcQ+3L/g7xfBVp2lzh+LG+R446IADweZ0Zc6qS95cDT40ET27SPG9W4yaLlpoeVrIet71x/RnxYonwCih/JJ1uWHt0rozcY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f954d3c0-f1a1-49eb-1e71-08d751e85932
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 03:24:26.5184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nyde//tkePavfpNqIaJKksGsP0Jg5fOMKima8Ft2VLYnNMsEjzzkgnjX3Tw+DsDshFkJBHk+jQGDry6/WuX+0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5148
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiANCj4gT24gMjAxOS0xMC0xNSAwNjo0OCwgQml3ZW4gTGkgd3JvdGU6DQo+ID4gVGhpcyBhZGRz
IHByb3BlcnR5IGlkbGUtc3RhdGUNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpd2VuIExpIDxi
aXdlbi5saUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZSBpbiB2MjoNCj4gPiAgICAgICAt
IHVwZGF0ZSBzdWJqZWN0IGFuZCBkZXNjcmlwdGlvbg0KPiA+ICAgICAgIC0gYWRkIHByb3BlcnR5
IGlkbGUtc3RhdGUNCj4gPg0KPiA+ICBkcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1NHgu
YyB8IDQ3DQo+ID4gKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtcGNhOTU0eC5jDQo+ID4gYi9kcml2ZXJz
L2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1NHguYw0KPiA+IGluZGV4IDkyM2FhM2E1YTNkYy4uOGVj
NTg2MzQyYjkyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtcGNh
OTU0eC5jDQo+ID4gKysrIGIvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMNCj4g
PiBAQCAtODYsNyArODYsNyBAQCBzdHJ1Y3QgcGNhOTU0eCB7DQo+ID4NCj4gPiAgICAgICB1OCBs
YXN0X2NoYW47ICAgICAgICAgICAvKiBsYXN0IHJlZ2lzdGVyIHZhbHVlICovDQo+ID4gICAgICAg
LyogTVVYX0lETEVfQVNfSVMsIE1VWF9JRExFX0RJU0NPTk5FQ1Qgb3IgPj0gMCBmb3IgY2hhbm5l
bCAqLw0KPiA+IC0gICAgIHM4IGlkbGVfc3RhdGU7DQo+ID4gKyAgICAgczMyIGlkbGVfc3RhdGU7
DQo+ID4NCj4gPiAgICAgICBzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50Ow0KPiA+DQo+ID4gQEAg
LTI1Niw3ICsyNTYsNyBAQCBzdGF0aWMgaW50IHBjYTk1NHhfZGVzZWxlY3RfbXV4KHN0cnVjdA0K
PiA+IGkyY19tdXhfY29yZSAqbXV4YywgdTMyIGNoYW4pICB7DQo+ID4gICAgICAgc3RydWN0IHBj
YTk1NHggKmRhdGEgPSBpMmNfbXV4X3ByaXYobXV4Yyk7DQo+ID4gICAgICAgc3RydWN0IGkyY19j
bGllbnQgKmNsaWVudCA9IGRhdGEtPmNsaWVudDsNCj4gPiAtICAgICBzOCBpZGxlX3N0YXRlOw0K
PiA+ICsgICAgIHMzMiBpZGxlX3N0YXRlOw0KPiA+DQo+ID4gICAgICAgaWRsZV9zdGF0ZSA9IFJF
QURfT05DRShkYXRhLT5pZGxlX3N0YXRlKTsNCj4gPiAgICAgICBpZiAoaWRsZV9zdGF0ZSA+PSAw
KQ0KPiA+IEBAIC00MDIsNiArNDAyLDI1IEBAIHN0YXRpYyB2b2lkIHBjYTk1NHhfY2xlYW51cChz
dHJ1Y3QNCj4gaTJjX211eF9jb3JlICptdXhjKQ0KPiA+ICAgICAgIGkyY19tdXhfZGVsX2FkYXB0
ZXJzKG11eGMpOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIGludCBwY2E5NTR4X2luaXQoc3Ry
dWN0IGkyY19jbGllbnQgKmNsaWVudCwgc3RydWN0IHBjYTk1NHgNCj4gPiArKmRhdGEpIHsNCj4g
PiArICAgICAvKg0KPiA+ICsgICAgICAqIFdyaXRlIHRoZSBtdXggcmVnaXN0ZXIgYXQgYWRkciB0
byB2ZXJpZnkNCj4gPiArICAgICAgKiB0aGF0IHRoZSBtdXggaXMgaW4gZmFjdCBwcmVzZW50LiBU
aGlzIGFsc28NCj4gPiArICAgICAgKiBpbml0aWFsaXplcyB0aGUgbXV4IHRvIGRpc2Nvbm5lY3Rl
ZCBzdGF0ZS4NCj4gPiArICAgICAgKi8NCj4gDQo+IFRoaXMgY29tbWVudCBiZWxvbmdzIGluIHBj
YTk1NHhfcHJvYmUsIGJlZm9yZSB0aGUgY2FsbCB0byB0aGlzIGZ1bmN0aW9uLg0KPiBIb3dldmVy
LCB0aGUgY29tbWVudCBtYXkgbm93IGJlIGJlIHdyb25nIHNpbmNlIHRoZSBtdXggaXMgbm90IGFs
d2F5cw0KPiBpbml0aWFsaXplZCB0byB0aGUgZGlzY29ubmVjdGVkIHN0YXRlLg0KR290IGl0LCBJ
IHdpbGwgdXBkYXRlIGl0IGluIHYzLg0KPiANCj4gPiArICAgICBpZiAoZGF0YS0+aWRsZV9zdGF0
ZSA+PSAwKSB7DQo+ID4gKyAgICAgICAgICAgICAvKiBBbHdheXMgZW5hYmxlIG11bHRpcGxleGVy
ICovDQo+IA0KPiBXaGlsZSBJIHVuZGVyc3RhbmQgdGhhdCBpdCBpcyBpbXBvcnRhbnQgZm9yIHlv
dXIgY2FzZSB0aGF0IHRoZSBtdXggaXMgYWx3YXlzDQo+IGVuYWJsZWQsIHRoaXMgaXMganVzdCBh
IHNpZGUgZWZmZWN0IG9mIGhhdmluZyBhIHNwZWNpZmljIGlkbGUtc3RhdGUuIEkgc3VnZ2VzdCB0
aGF0DQo+IHlvdSByZW1vdmUgdGhpcyBjb21tZW50Lg0KR290IGl0LCBJIHdpbGwgcmVtb3ZlIGl0
IGluIHYzLg0KPiANCj4gPiArICAgICAgICAgICAgIGlmIChkYXRhLT5jaGlwLT5tdXh0eXBlID09
IHBjYTk1NHhfaXNtdXgpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRhdGEtPmxhc3RfY2hh
biA9IGRhdGEtPmlkbGVfc3RhdGUgfA0KPiBkYXRhLT5jaGlwLT5lbmFibGU7DQo+ID4gKyAgICAg
ICAgICAgICBlbHNlDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRhdGEtPmxhc3RfY2hhbiA9
IDEgPDwgZGF0YS0+aWRsZV9zdGF0ZTsNCj4gDQo+IFRoZSBtZWF0IG9mIHRoaXMgImlmIiBpcyBz
dGlsbCBkdXBsaWNhdGVkLCBJIHdhcyBzdWdnZXN0aW5nIGEgaGVscGVyIHRoYXQgb25seSBkaWQN
Cj4gdGhlIHJlZ3ZhbCBjYWxjdWxhdGlvbiBzbyB0aGF0IHRoZSBuZXcgaGVscGVyIGNvdWxkIGFs
c28gYmUgdXNlZCBmcm9tDQo+IHBjYTk1NHhfc2VsZWN0X2NoYW4ubw0KPiANCj4gPiArICAgICB9
IGVsc2Ugew0KPiA+ICsgICAgICAgICAgICAgLyogRGlzY29ubmVjdCBtdWx0aXBsZXhlciAqLw0K
PiA+ICsgICAgICAgICAgICAgZGF0YS0+bGFzdF9jaGFuID0gMDsgLyogZm9yY2UgdGhlIGZpcnN0
IHNlbGVjdGlvbiAqLw0KPiANCj4gVGhlc2UgdHdvIGNvbW1lbnRzIHNob3VsZCBiZSBjb21iaW5l
ZC4NCkdvdCBpdC4NCj4gDQo+ID4gKyAgICAgfQ0KPiA+ICsgICAgIHJldHVybiBpMmNfc21idXNf
d3JpdGVfYnl0ZShjbGllbnQsIGRhdGEtPmxhc3RfY2hhbik7IH0NCj4gPiAgLyoNCj4gPiAgICog
STJDIGluaXQvcHJvYmluZy9leGl0IGZ1bmN0aW9ucw0KPiA+ICAgKi8NCj4gPiBAQCAtNDExLDcg
KzQzMCw2IEBAIHN0YXRpYyBpbnQgcGNhOTU0eF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xp
ZW50LA0KPiA+ICAgICAgIHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCA9IGNsaWVudC0+YWRhcHRl
cjsNCj4gPiAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmY2xpZW50LT5kZXY7DQo+ID4gICAg
ICAgc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZTsNCj4gPiAtICAgICBib29s
IGlkbGVfZGlzY29ubmVjdF9kdDsNCj4gPiAgICAgICBzdHJ1Y3QgZ3Bpb19kZXNjICpncGlvOw0K
PiA+ICAgICAgIHN0cnVjdCBpMmNfbXV4X2NvcmUgKm11eGM7DQo+ID4gICAgICAgc3RydWN0IHBj
YTk1NHggKmRhdGE7DQo+ID4gQEAgLTQ2MiwyMiArNDgwLDE4IEBAIHN0YXRpYyBpbnQgcGNhOTU0
eF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiAqY2xpZW50LA0KPiA+ICAgICAgICAgICAgICAg
fQ0KPiA+ICAgICAgIH0NCj4gPg0KPiA+IC0gICAgIC8qIFdyaXRlIHRoZSBtdXggcmVnaXN0ZXIg
YXQgYWRkciB0byB2ZXJpZnkNCj4gPiAtICAgICAgKiB0aGF0IHRoZSBtdXggaXMgaW4gZmFjdCBw
cmVzZW50LiBUaGlzIGFsc28NCj4gPiAtICAgICAgKiBpbml0aWFsaXplcyB0aGUgbXV4IHRvIGRp
c2Nvbm5lY3RlZCBzdGF0ZS4NCj4gPiAtICAgICAgKi8NCj4gPiAtICAgICBpZiAoaTJjX3NtYnVz
X3dyaXRlX2J5dGUoY2xpZW50LCAwKSA8IDApIHsNCj4gPiArICAgICBpZiAob2ZfcHJvcGVydHlf
cmVhZF91MzIobnAsICJpZGxlLXN0YXRlIiwgJmRhdGEtPmlkbGVfc3RhdGUpKQ0KPiA+ICsgICAg
ICAgICAgICAgZGF0YS0+aWRsZV9zdGF0ZSA9IE1VWF9JRExFX0FTX0lTOw0KPiA+ICsNCj4gPiAr
ICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiaTJjLW11eC1pZGxlLWRpc2Nvbm5l
Y3QiKSkNCj4gPiArICAgICAgICAgICAgIGRhdGEtPmlkbGVfc3RhdGUgPSBNVVhfSURMRV9ESVND
T05ORUNUOw0KPiANCj4gSSB0aGluayB5b3Ugc2hvdWxkIGlnbm9yZSBpMmMtbXV4LWlkbGUtZGlz
Y29ubmVjdCBpZiBpZGxlLXN0YXRlIGlzIHByZXNlbnQuDQo+IEkuZS4gbW92ZSB0aGlzICJpZiIg
c3RhdGVtZW50IGludG8gdGhlIGJvZHkgb2YgdGhlIGZvcm1lciAiaWYiLiBBbHNvLCB5b3UgaGF2
ZQ0KPiBicm9rZW4gdGhpbmdzIGlmIG5wIGlzIE5VTEwuDQpHb3QgaXQsIEkgd2lsbCBtb2RpZnkg
aXQgaW4gdjMuDQo+IA0KPiBDaGVlcnMsDQo+IFBldGVyDQo+IA0KPiA+ICsNCj4gPiArICAgICBy
ZXQgPSBwY2E5NTR4X2luaXQoY2xpZW50LCBkYXRhKTsNCj4gPiArICAgICBpZiAocmV0IDwgMCkg
ew0KPiA+ICAgICAgICAgICAgICAgZGV2X3dhcm4oZGV2LCAicHJvYmUgZmFpbGVkXG4iKTsNCj4g
PiAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPiA+ICAgICAgIH0NCj4gPg0KPiA+IC0g
ICAgIGRhdGEtPmxhc3RfY2hhbiA9IDA7ICAgICAgICAgICAgICAgLyogZm9yY2UgdGhlIGZpcnN0
IHNlbGVjdGlvbiAqLw0KPiA+IC0gICAgIGRhdGEtPmlkbGVfc3RhdGUgPSBNVVhfSURMRV9BU19J
UzsNCj4gPiAtDQo+ID4gLSAgICAgaWRsZV9kaXNjb25uZWN0X2R0ID0gbnAgJiYNCj4gPiAtICAg
ICAgICAgICAgIG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImkyYy1tdXgtaWRsZS1kaXNjb25u
ZWN0Iik7DQo+ID4gLSAgICAgaWYgKGlkbGVfZGlzY29ubmVjdF9kdCkNCj4gPiAtICAgICAgICAg
ICAgIGRhdGEtPmlkbGVfc3RhdGUgPSBNVVhfSURMRV9ESVNDT05ORUNUOw0KPiA+DQo+ID4gICAg
ICAgcmV0ID0gcGNhOTU0eF9pcnFfc2V0dXAobXV4Yyk7DQo+ID4gICAgICAgaWYgKHJldCkNCj4g
PiBAQCAtNTMxLDggKzU0NSw3IEBAIHN0YXRpYyBpbnQgcGNhOTU0eF9yZXN1bWUoc3RydWN0IGRl
dmljZSAqZGV2KQ0KPiA+ICAgICAgIHN0cnVjdCBpMmNfbXV4X2NvcmUgKm11eGMgPSBpMmNfZ2V0
X2NsaWVudGRhdGEoY2xpZW50KTsNCj4gPiAgICAgICBzdHJ1Y3QgcGNhOTU0eCAqZGF0YSA9IGky
Y19tdXhfcHJpdihtdXhjKTsNCj4gPg0KPiA+IC0gICAgIGRhdGEtPmxhc3RfY2hhbiA9IDA7DQo+
ID4gLSAgICAgcmV0dXJuIGkyY19zbWJ1c193cml0ZV9ieXRlKGNsaWVudCwgMCk7DQo+ID4gKyAg
ICAgcmV0dXJuIHBjYTk1NHhfaW5pdChjbGllbnQsIGRhdGEpOw0KPiA+ICB9DQo+ID4gICNlbmRp
Zg0KPiA+DQo+ID4NCg0K
