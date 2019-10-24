Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6083DE2A87
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 08:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437796AbfJXGs3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 02:48:29 -0400
Received: from mail-eopbgr20115.outbound.protection.outlook.com ([40.107.2.115]:41122
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2437772AbfJXGs2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 24 Oct 2019 02:48:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQwJ/yXWhE9thgzQc5tDs+2LjL7p+lpNQ92X97gbjasU6P+RzMlWfHZ/R61qx1iXiLuoLnclyZpuWO5qUHLiF880oOYXlHFL4WTAjdVgUtQWp+uQ3Yae6F+vLHEdCV9UnGdyK6FpwU8XpYQJOiZO08LCLXAHUXEqFpEsXADO4FrPlwWn9wOdqPgSGkbhgwaE1QMbO1sLCZFGBG9HOE6xvKQiIsmWqmNt24ysNacMRTU79VhPks5h7igWSyLoHtOsKMG+CMTISJ4mo0OVdVqYSsTpCXsb2HKaak1BPXs+clhnfIhV8J1F57/un5Zvjnok6TPLglMWJuX+zqX7aceVHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kH+2tS8dKDTbBHWsbwFbvgDdsFZt5jRFwq/0ZRrsfcU=;
 b=RLWOt6orO0Bg2pAlwa+niS8oLjS2rvxlmsKXoeKdAqol4a8JL8fTf6U6EYc7tRRN1YcayC8gFIbZ5gXpXm1AOl4COcw7SWtUPNZI//kafEPCmv5FSM7hs4Cy1OykuJ2fEEluMpA4hsAD+fTmaX7L3g02K5s+pG4Rk5cWwRc/iZg/hQ4x5VLYi3urmU8vD/0ANAg1n81V6BCkhjiac3DGL29XRvabSYXDeTE43ICgrd2rMSk+JdGruEk+mat0ZtIbu/kNk4+W8AjIjCeuoGrIUrkabFrgdPUyMzdhUIeKUQdIwMOeRsdejennQGAUBdm9GftSa05SJmhkgmTIMWaI0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kH+2tS8dKDTbBHWsbwFbvgDdsFZt5jRFwq/0ZRrsfcU=;
 b=hyFdNMn7jC1TyWgJ/Hr0pSSZv/yfILDg7gexOwejHo2bIahkeoT6T4kqt/jStjMGLXaaRk8seF0cqRK+B4GRPzOalIZHBffCdyAL2UePunp2xndIEDyjuMT86LOa9dz8uFBKiCGRNUr1a3MxorrdViUtKo50lMc94GJDZ/MuwA4=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3324.eurprd02.prod.outlook.com (52.134.67.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Thu, 24 Oct 2019 06:48:23 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe%7]) with mapi id 15.20.2347.030; Thu, 24 Oct 2019
 06:48:23 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "tfiga@chromium.org" <tfiga@chromium.org>,
        "drinkcat@chromium.org" <drinkcat@chromium.org>,
        "srv_heupstream@mediatek.com" <srv_heupstream@mediatek.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] dt-binding: eeprom: at24: add supply properties
Thread-Topic: [PATCH v2] dt-binding: eeprom: at24: add supply properties
Thread-Index: AQHVhY2ytpixntn4Q02Xj2kF/r5ULKdpYu6A
Date:   Thu, 24 Oct 2019 06:48:23 +0000
Message-ID: <b8d637a1-d565-14ec-dc5d-19610e0cd01e@axentia.se>
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
 <20191018082557.3696-2-bibby.hsieh@mediatek.com>
In-Reply-To: <20191018082557.3696-2-bibby.hsieh@mediatek.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1P192CA0017.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::27)
 To DB3PR0202MB3434.eurprd02.prod.outlook.com (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c86827d4-5823-4f00-804d-08d7584e29dc
x-ms-traffictypediagnostic: DB3PR0202MB3324:
x-microsoft-antispam-prvs: <DB3PR0202MB33249E06ED5959C73605F681BC6A0@DB3PR0202MB3324.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(396003)(136003)(366004)(39830400003)(189003)(199004)(6246003)(54906003)(76176011)(7736002)(110136005)(4001150100001)(4326008)(58126008)(53546011)(6506007)(31686004)(25786009)(2501003)(256004)(316002)(386003)(52116002)(6512007)(36756003)(186003)(31696002)(102836004)(86362001)(305945005)(99286004)(71190400001)(71200400001)(26005)(3846002)(476003)(2616005)(65956001)(66066001)(65806001)(446003)(486006)(6116002)(229853002)(2906002)(6436002)(11346002)(6486002)(66946007)(64756008)(66446008)(66556008)(66476007)(508600001)(14454004)(81166006)(81156014)(8936002)(5660300002)(8676002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3324;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UxBgYBByVrLcarBc7TlB8uDJln1cQkCxd1kkuTYMdWN4VbV8vWUiCOO+SbaZKwgjYd1+eVGfD4esVDy/t/gnwe6cH5AecmyVNlLdDcKijisf5jVeKq/COQmdB41r/Ir35A9AHccGQBaLqwoQsqsAUIb+zuFIKTAs8/C+C4CCtlhAz7sPpDKFtPUlAc3GH3GZIOnNFo5EIWs5q7EZlq0xIkUWq3pWp16cZWqgvRO2qWLjVTO1vyiCrbRESGn+N1E7NDDK7fpQ9WIFNDBN5Lh8MFgxWlYh2Ew5bBMAjx/HZtpVX3d1sYIOBGhyoy7Zo16Z8JoadrDq+tCMMkoafpadJtnnVUDZg58NDrIpZNkiEwH273fOAPSVip2iZylTdAHHOYwflGiati/+UXlIb5MeX1TsNhSgSbpLI+h6L6qROoEqCFBDJ98Y+ntnA4hVu0d+
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFE1E3D30A3CAC4DA39EC313A15C9B2C@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: c86827d4-5823-4f00-804d-08d7584e29dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 06:48:23.0993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lM5LRVXGlBaaB2J8hfjFvLPtfZdLhOWnkXFLZDVnWlWJq2+PTEc8PeCnWCWKP3ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3324
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMC0xOCAxMDoyNSwgQmliYnkgSHNpZWggd3JvdGU6DQo+IEluIHNvbWUgcGxhdGZv
cm1zLCB0aGV5IGRpc2FibGUgdGhlIHBvd2VyLXN1cHBseSBvZiBlZXByb20gYW5kIGkyYyBkdWUN
Cj4gdG8gcG93ZXIgY29uc3VtcHRpb24gcmVkdWN0aW9uLg0KPiANCj4gVGhpcyBwYXRjaCBhZGQg
dHdvIHN1cHBseSBwcm9wZXJ0aWVzOiB2Y2Mtc3VwcGx5LCBpMmMtc3VwcGx5Lg0KPiANCj4gQ2hh
bmdlcyBzaW5jZSB2MToNCj4gIC0gY2hhbmdlIHN1cHBseSBuYW1lDQo+ICAtIHJlYmFzZSB0byBu
ZXh0DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCaWJieSBIc2llaCA8YmliYnkuaHNpZWhAbWVkaWF0
ZWsuY29tPg0KPiAtLS0NCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9lZXBy
b20vYXQyNC55YW1sIHwgOCArKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9lZXByb20vYXQyNC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Vl
cHJvbS9hdDI0LnlhbWwNCj4gaW5kZXggZTg3Nzg1NjBkOTY2Li41Nzg0ODdhNWQ5YjcgMTAwNjQ0
DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9lZXByb20vYXQyNC55
YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9lZXByb20vYXQy
NC55YW1sDQo+IEBAIC0xNjcsNiArMTY3LDE0IEBAIHByb3BlcnRpZXM6DQo+ICAgICAgbWluaW11
bTogMQ0KPiAgICAgIG1heGltdW06IDgNCj4gIA0KPiArICB2Y2Mtc3VwcGx5Og0KPiArICAgIGRl
c2NyaXB0aW9uOg0KPiArICAgICAgcGhhbmRsZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlk
ZXMgdGhlIHN1cHBseSB2b2x0YWdlLg0KPiArDQo+ICsgIGkyYy1zeXBwbHk6DQoNCnMvc3lwcGx5
L3N1cHBseS8NCg0KQ2hlZXJzLA0KUGV0ZXINCg0KPiArICAgIGRlc2NyaXB0aW9uOg0KPiArICAg
ICAgcGhhbmRsZSB0byB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgcG93ZXIgdG8gaTJjLg0K
PiArDQo+ICByZXF1aXJlZDoNCj4gICAgLSBjb21wYXRpYmxlDQo+ICAgIC0gcmVnDQo+IA0KDQo=
