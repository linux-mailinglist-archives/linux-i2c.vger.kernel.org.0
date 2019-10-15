Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8285D6D93
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2019 05:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbfJODSW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 23:18:22 -0400
Received: from mail-eopbgr00083.outbound.protection.outlook.com ([40.107.0.83]:52900
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727195AbfJODSW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Oct 2019 23:18:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6XxELxUPQl5fZKVJlbskiH7jmJHmRR0WuvW31OoKhYWKZHlHvJOX2EaL3uliDcqM5ag4BUABAOmtWzdh3ox49660FGgMtKty1NbavRtJdw+vXA2rdd0mw89yxdg4rE+QQnkwKFmErvSYXrOvsyoCzrTEUQijfErjMJOVPr8rlpMmE116MXXsxRRTG8h0xT8SCaiAjiw7wTZnPw5o/6c7xJKo8pj6oJWM5s5OvktCQg5U15g6Y8ZfHCkIC1NavzkOYgxL9ty+6iAmTBAxYHNOLKi4ZliTLEqQ4EzPkTvPnBsQXFrYw5rwjvGZS+m/xugiWQQRmRRDxZgzgn/fAhrYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiXDP2sP5tzDY7+oGIt/UPL3h0M7DseVjkehRChBlbA=;
 b=fQ/0QIb2qwuP2FXfajYQ6Oq8uKtCgFMYT6vF6FyTWeu/LE76TKiXaFSi0HqatCP2uPpSSIzYTvo9S4zARf3FkF/1858B71Q+UTzZw2oU0hMatP4z+Y5GdvZcBcFdblCBNdnCRmGUerpFD0e7TYjAvxEkvGFYx2GI5KV5EjIvIqYlykKWOxWKwOPsd59kV4SQ3P73O2Svejv3AnP1Zkbqsz59o6gS366FLRqdG52PaO/zwmnEynZrYoTsbgpSd4RLQvF4dbRODtL4qa69LT/hwInrbhiie0LXxhWGI25bIczKtgxw1ltJSQHUYsj4mwQALAKz7GlPMrJTYL0yjO9ULA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiXDP2sP5tzDY7+oGIt/UPL3h0M7DseVjkehRChBlbA=;
 b=nrWcdihhSd719qri9Y552bVBWubRp/xLqDOeS69u5QtKejpw1qjYqUA6HayzW+kOYKBi4VyZVFRn7/XmsJ1hTkYkfcNDEK+eyrhuIctMCWcIG44dPyQsfWi3tzKyE1kcQH2T4jYjC8KHXLeS9CXWtVlC2NkU6SvOtgm3rGj5Mbw=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4764.eurprd04.prod.outlook.com (20.176.233.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 03:18:19 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11%7]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 03:18:19 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Peter Rosin <peda@axentia.se>, Leo Li <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH 1/2] dt-bindings: i2c: replace property
 i2c-mux-idle-disconnect
Thread-Topic: [EXT] Re: [PATCH 1/2] dt-bindings: i2c: replace property
 i2c-mux-idle-disconnect
Thread-Index: AQHVgoOwZ96O8ZHg3EmhfguQXwsY4adaR50AgADBn7A=
Date:   Tue, 15 Oct 2019 03:18:19 +0000
Message-ID: <DB7PR04MB4490B0E379E3048F043203088F930@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20191014112558.3881-1-biwen.li@nxp.com>
 <4124752f-19a2-e3c1-7887-07ba66a79c29@axentia.se>
In-Reply-To: <4124752f-19a2-e3c1-7887-07ba66a79c29@axentia.se>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c70cdde-bba1-4e50-04cc-08d7511e5418
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DB7PR04MB4764:|DB7PR04MB4764:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB476420C6CB5F224B5E3823238F930@DB7PR04MB4764.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(199004)(189003)(316002)(71200400001)(71190400001)(66946007)(6246003)(81166006)(81156014)(7696005)(256004)(33656002)(25786009)(4001150100001)(76116006)(5660300002)(74316002)(14454004)(66446008)(64756008)(66556008)(66476007)(305945005)(52536014)(44832011)(2906002)(7736002)(229853002)(11346002)(6436002)(3846002)(9686003)(55016002)(478600001)(446003)(86362001)(486006)(2501003)(6116002)(476003)(99286004)(26005)(102836004)(66066001)(8676002)(6506007)(4326008)(53546011)(186003)(8936002)(110136005)(76176011)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4764;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KRN+34kjuothHQvp96EoVs4g9Xt4vrw7ZJRQvTwdLYXiYHhxfFa4feiu7/RHWZiEqCHo/ib3ItX4GLEYcXGW/xWcnYLxWRwqtlYKILvW/oWCIrxT6m7XTWGyMbFxtNS2Q1F70mDlWpKkSHHgMwvoEtJjpo7J+b+mQRw09ijRbUfUpc6PEYPT59JNJkWt5FYH2qDEK8iruVIGirCsXEw0ROZT6fOcXlfvAF3595HxgXjR1zj7wPu5ATIGNKGvB6Vj7bBkA8e6AAPhh/ynDCimB43cGHLVQ12zx+c3M8K44NLjSlto14wN+SSKIR5hYhz+6TR2RK7MYXIIXO+tjsevIKHpuZDIyGJdXDoFt51oLji69/5uLvmtqxW0D6hhB9x+Hy1nxaLQ+FRA7kLXpBtVjXaxmEp6Qercx8KUap5gQmo=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c70cdde-bba1-4e50-04cc-08d7511e5418
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 03:18:19.6824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K2XG2XmNH4JYrTgYxrczd68M6WE1gx0k2h6tR26TIcqCYp24/eaVBjwM9lDa6Oi4lj3iwOIxa853P9l5B2tJKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4764
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBDYXV0aW9uOiBFWFQgRW1haWwNCj4gDQo+IE9uIDIwMTktMTAtMTQgMTM6MjUsIEJpd2VuIExp
IHdyb3RlOg0KPiA+IFRoaXMgcmVwbGFjZXMgcHJvcGVydHkgaTJjLW11eC1pZGxlLWRpc2Nvbm5l
Y3Qgd2l0aCBpZGxlLXN0YXRlDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaXdlbiBMaSA8Yml3
ZW4ubGlAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2kyYy9pMmMtbXV4LXBjYTk1NHgudHh0IHwgNCArLS0tDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tdXgtcGNhOTU0eC50
eHQNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW11eC1w
Y2E5NTR4LnR4dA0KPiA+IGluZGV4IDMwYWM2YTYwZjA0MS4uZjJkYjUxN2IxNjM1IDEwMDY0NA0K
PiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW11eC1w
Y2E5NTR4LnR4dA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
MmMvaTJjLW11eC1wY2E5NTR4LnR4dA0KPiA+IEBAIC0yNSw5ICsyNSw3IEBAIFJlcXVpcmVkIFBy
b3BlcnRpZXM6DQo+ID4gIE9wdGlvbmFsIFByb3BlcnRpZXM6DQo+ID4NCj4gPiAgICAtIHJlc2V0
LWdwaW9zOiBSZWZlcmVuY2UgdG8gdGhlIEdQSU8gY29ubmVjdGVkIHRvIHRoZSByZXNldCBpbnB1
dC4NCj4gPiAtICAtIGkyYy1tdXgtaWRsZS1kaXNjb25uZWN0OiBCb29sZWFuOyBpZiBkZWZpbmVk
LCBmb3JjZXMgbXV4IHRvIGRpc2Nvbm5lY3QNCj4gYWxsDQo+ID4gLSAgICBjaGlsZHJlbiBpbiBp
ZGxlIHN0YXRlLiBUaGlzIGlzIG5lY2Vzc2FyeSBmb3IgZXhhbXBsZSwgaWYgdGhlcmUgYXJlIHNl
dmVyYWwNCj4gPiAtICAgIG11bHRpcGxleGVycyBvbiB0aGUgYnVzIGFuZCB0aGUgZGV2aWNlcyBi
ZWhpbmQgdGhlbSB1c2Ugc2FtZSBJMkMNCj4gYWRkcmVzc2VzLg0KPiA+ICsgIC0gaWRsZS1zdGF0
ZTogUGxlYXNlIHJlZmVyIHRvDQo+ID4gKyBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXV4L211eC1jb250cm9sbGVyLnR4dA0KPiA+ICAgIC0gaW50ZXJydXB0czogSW50ZXJydXB0
IG1hcHBpbmcgZm9yIElSUS4NCj4gPiAgICAtIGludGVycnVwdC1jb250cm9sbGVyOiBNYXJrcyB0
aGUgZGV2aWNlIG5vZGUgYXMgYW4gaW50ZXJydXB0IGNvbnRyb2xsZXIuDQo+ID4gICAgLSAjaW50
ZXJydXB0LWNlbGxzIDogU2hvdWxkIGJlIHR3by4NCj4gPg0KPiANCj4gWW91IGNhbid0IGp1c3Qg
cmVtb3ZlIGkyYy1tdXgtaWRsZS1kaXNjb25uZWN0LiBJdCBuZWVkcyB0byByZW1haW4sIGFuZCB0
aGUNCj4gZHJpdmVyIG5lZWRzIHRvIG1haW50YWluIHN1cHBvcnQgZm9yIHRoaXMgaW4gY2FzZSBh
IG5ldyBrZXJuZWwgaXMgcnVubmluZw0KPiB3aXRoIGFuIG9sZCBkZXZpY2V0cmVlLg0KWW91IGFy
ZSByaWdodCwgSSB3aWxsIGFkZCBpdCBpbiB2Mi4NCj4gDQo+IENoZWVycywNCj4gUGV0ZXINCg==
