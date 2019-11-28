Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58AD310C708
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Nov 2019 11:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbfK1Kq1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Nov 2019 05:46:27 -0500
Received: from mail-eopbgr10069.outbound.protection.outlook.com ([40.107.1.69]:23894
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726609AbfK1Kq1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Nov 2019 05:46:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtNUgucxYA5Nu7OBXCy7fqydI2CBUuVDt7oTxrm8S0dpOfXfRNjl0CU97TRsXdWmi7kPlZhGDf0s1ZPWBEaC6uj5A7v0Ec+1V7jWU6poeU3aj0QIuQdYEpXUYbV15AKdluZpp0orpEDiS40AYD0gjvoE/jmXtSPOwHiEsSFi7IttEitHUQDc7FGvrjc7hwhr8ImLBHRdGJVJoYPHFE+B0T3NvdavWH4LqrNXLEBRAoP+SOF6f8WjsmQNDZhh0/uIHv3kLqZ0EWYaIq2sGPQB07YRr5y5u6LlDhV9LxAaeTo8yQ+pQBeUElw2vIo6fwLN5zXJ4Dh/1NmCi85R2hnr4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDJwPaFMCdqhv87bevC/L3T7fUkY1ZrjRzrVoAX1uco=;
 b=l875X67uklorYzQszNHC67vOzaQeGubDjlby9UVgzN9Iwm7zZUHt3GjZUOsb1Pig1AlCum0MFuhakd8buyUxIRa50QclblzJB0UASCX3ykJZyZoZvPZu/umutl3CtMFsqKoRuAhoeY13n9ac1XxeRF13U5tuDEYC2SrNwdGGQkacaw0A4CuRlLPWswcAVimmPKl+09+M6MysOD/1cizSUzDj376A/cf6fZPGB7Hi1s8WWo3kN0QUpJPYlWnpAD2fwjF/EbiexTnC0TGuhTeYpvDgD7/md21kqSdVHwKV7KM76QUkuh8dGzrLyOBqMO1uwcqMHq2I+1t5YV4dKrcmkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDJwPaFMCdqhv87bevC/L3T7fUkY1ZrjRzrVoAX1uco=;
 b=AK9CpC2QHCl8ZogRxDpzpy6R978SJSqcMYDDgodqxskwusmyNvbD1QDx+xleXp51R09K6NRYIjz8/BvB7ti33XaH+BJL/fcB8iMl7lbk4CkprOCGAdLmZFnTHXg/QGelmWMpVzhXQpdJ+1TH8wCQrn1ZlljEgao5GryVbJMGfXk=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB5356.eurprd04.prod.outlook.com (20.178.85.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Thu, 28 Nov 2019 10:46:23 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4182:4692:ffbd:43a0]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4182:4692:ffbd:43a0%6]) with mapi id 15.20.2495.014; Thu, 28 Nov 2019
 10:46:23 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Peter Rosin <peda@axentia.se>, Leo Li <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [v5,2/3] i2c: mux: pca954x: support property idle-state
Thread-Topic: [EXT] Re: [v5,2/3] i2c: mux: pca954x: support property
 idle-state
Thread-Index: AQHViJBl22hUmzXlbUux/Avv7TBADKeMKw/AgAWMtICADukgsA==
Date:   Thu, 28 Nov 2019 10:46:23 +0000
Message-ID: <DB7PR04MB449066A2FFBC78B0645B8FCC8F470@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20191022041152.3663-1-biwen.li@nxp.com>
 <20191022041152.3663-2-biwen.li@nxp.com>
 <DB7PR04MB4490B0121FEED3C74A682C248F700@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <e04c77cc-6c41-8ce3-b584-944eb1595191@axentia.se>
In-Reply-To: <e04c77cc-6c41-8ce3-b584-944eb1595191@axentia.se>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d1c8c0f8-4f76-479c-6f34-08d773f03631
x-ms-traffictypediagnostic: DB7PR04MB5356:|DB7PR04MB5356:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB53563759FED00896D22D7D5E8F470@DB7PR04MB5356.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(199004)(189003)(66066001)(25786009)(11346002)(74316002)(53546011)(8676002)(71200400001)(316002)(478600001)(54906003)(6506007)(76176011)(110136005)(71190400001)(81156014)(229853002)(76116006)(86362001)(2906002)(6246003)(446003)(5660300002)(44832011)(81166006)(7736002)(102836004)(26005)(4326008)(256004)(66446008)(66476007)(7696005)(305945005)(6436002)(4744005)(66946007)(33656002)(66556008)(64756008)(8936002)(99286004)(3846002)(52536014)(186003)(4001150100001)(9686003)(6116002)(2501003)(14454004)(55016002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB5356;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FheV/p2XR0YdDSi2S5vxk79OWG1O7oIZQmSYjwz2WUyrlEFOR90xYyE9G6aZNSyVoHea6yogjhahbjrFuGT9MWcAErZF0gBZTWrOKigBPTN1vGMDNu9nx/35c4ufn7gPGOBQjhCA/wm8kQH3MYdqZJc4kqjwtkB1TVYjbtjt1Jqc8Z+zv4BCWpldhpcs8qtihmug0qnDqce5NPY+aKjN35RVq/4FjzG7cHWkSKh1s/LGPKd9OXZjqr1H6y4pwROLyu2HEltNgJqRJFdt5QfR/XDzwy7i/htgU0gkcYiQqRkiI3u4k41MODv4VzVFmRKkK4wFv7VZQl1+swPIdX5LFgD3yLUnQKzehFIyYgLf13NZg5P42ziD0AguT2nMZUcDKqhsagk4htRKfsF8jgk7CleiPGU+gRCFymhQxmBpUoLD1VgJJ7rfBiOQjoYSeMtU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c8c0f8-4f76-479c-6f34-08d773f03631
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 10:46:23.3499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: swLUJ0ZEeBGmR4G3GNEuNXd/7mMQt1Ak5+GhI8hfVIwzvlMtghQPRDPugydprHhOGvjpJx28ce2zZByQApX2mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5356
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBDYXV0aW9uOiBFWFQgRW1haWwNCj4gDQo+IE9uIDIwMTktMTEtMTUgMTE6MjEsIEJpd2VuIExp
IHdyb3RlOg0KPiA+IEhpIFBldGVyLA0KPiA+DQo+ID4gQW55IGNvbW1lbnRzPw0KPiA+IElmIG5v
IGNvbW1lbnRzLCBjb3VsZCB5b3UgZ2l2ZSBtZSBhIHJldmlld2VkLWJ5Pw0KPiANCj4gSSB3b3Vs
ZCBoYXZlIGxpa2VkIGEgY29tbWVudCBmcm9tIHRoZSBkcml2ZXIgbWFpbnRhaW5lciBvciBhIHRl
c3RlZC1ieSBmcm9tDQo+IHNvbWVvbmUgd2l0aCBhbm90aGVyIGNhc2UgdGhhbiB5b3Vycy4gQnV0
IG5vdyB0aGF0IEkgY2hlY2sgSSBzZWUgdGhhdCB0aGVyZSAtDQo+IGNvbnRyYXJ5IHRvIG15IGFz
c3VtcHRpb24gLSBpcyBubyBtYWludGFpbmVyIGxpc3RlZC4gU28sIEkgdGhpbmsgaXQgbG9va3Mg
ZmluZSwgYW5kDQo+IEknbSBzdXJlIGl0IGNvbXBpbGVzIGNsZWFubHkgZXRjIGlmIEkgdGVzdCB0
aGF0LCBidXQgSSBjYW4ndCB0ZXN0IHJ1bnRpbWUgYmVoYXZpb3INCj4gbXlzZWxmIHNpbmNlIEkg
ZG9uJ3QgaGF2ZSB0aGUgSFcuIEkgc2hvdWxkIGhhdmUgYmVlbiBjbGVhcmVyIGFib3V0IHRoaXMs
IGFuZA0KPiBzaG91bGQgaGF2ZSBkb3VibGUgY2hlY2tlZCB0aGUgbWFpbnRhaW5lciBzdGF0dXMg
aW5zdGVhZCBvZiByZWx5aW5nIG9uIHdoYXQgSQ0KPiB0aG91Z2h0LiBJIGhhdmUgc2ltcGx5IGJl
ZW4gZXh0cmVtZWx5IGJ1c3kgYW5kIHRoYXQgc2xpcHBlZC4gU29ycnkuDQo+IA0KPiBCdXQgSSds
bCB0cnkgdG8gc3F1ZWV6ZSB0aGlzIGludG8gbGludXgtbmV4dCB0b21vcnJvdywgYmVjYXVzZSBp
ZiBsb29rIHNhZmUsIGFuZA0KPiBob3BlZnVsbHkgYW55IHByb2JsZW0gd2lsbCBiZWNvbWUgYXBw
YXJlbnQuDQo+IA0KPiBHaXZpbmcgYSByZXZpZXdlZC1ieSBzZWVtZWQgcG9pbnRsZXNzLCB3aGVu
IEknbSB0aGUgb25lIHBpY2tpbmcgaXQgdXAgOi0pDQpPa2F5LCBnb3QgaXQsIHRoYW5rcy4NCg0K
QmVzdCBSZWdhcmRzLA0KQml3ZW4gTGkNCj4gDQo+IENoZWVycywNCj4gUGV0ZXINCg==
