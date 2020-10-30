Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F269C2A03E9
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Oct 2020 12:17:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgJ3LRc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Oct 2020 07:17:32 -0400
Received: from mail-eopbgr00059.outbound.protection.outlook.com ([40.107.0.59]:27728
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725993AbgJ3LRc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Oct 2020 07:17:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwKZZxkz1eRM8Mu9IqT+d7X1w1XYxYnX2TilSMHlXbtQi2szrlhcJ2AL3/kGWnsMIhSNlBo/txJZwyxKeZt/y229ZNC3WRePx4IIuiU95TE1hbkPUXQkG6MIlHtTFgH8KmUDSi0fIOUGFCgR59wpeoCyDrTFr1cg7aPD2OFp4a9gK0cPlFg8nDOeb6WaDAJ7S5+k9+ziEjLTy6kTeKact4nsdYIoBqoMZlCwR0XnNbdDBLjQ1kRl7R65DXylcgGSOWZzYyOI/v9VlP9jQ4zJvNUzKstBR3aL67RYzTkszDtKUx0mu48AobCrofEGlNXqJk3iDkykfrimowjJxIWLlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyYPgjS20p6ctEQKul773FVCP1w/Pzpj2sj2ZXyj/sM=;
 b=AoR78VEVy++H7G4gQNPVOx9CqZ/+GGn/mR8sOf7lLVJuUuoFMaQ/HRgmkuibxf6V7QH5j32guJSbBYUYX5d9nvOGDkWAEsGvbjRzPIOyRAQ1kCBJqX0K6SDfCpBxGTZva41JzZerhDAZL3LzAg+0NuKoBxM+L5W9i2scpZxNq9tsCXFGf5B0dLxQ73EIPmLA6rd7oUZ5jt6GAoRHCZ/CNS80KgfQeBznOaRVDRuU43dREfqccnZF6LFHgwxidTknDhQPFvctFfQgJcVsIs18kL8o3lubuAx5tlfiQ0lgSdkXWE41RS/lpWjg7aIAlduUfSb/b/sD8ChstS5Qip8Qeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyYPgjS20p6ctEQKul773FVCP1w/Pzpj2sj2ZXyj/sM=;
 b=j//nYzD/1D//HwsSMeWOBp6m2/l8JxZpjOblXkgX+j2eTODr3KEaAH9/Cm7FG32OuIAxcoxAkTvVbx/lngxBlS9KPDFrUutb07jEzkPeQH6xRT9OYror+2aQtkelifuHkEPExjcprYWwGqGPvta/h9L1726MBW8B+YB3ri4o1Zs=
Received: from VI1PR0401MB2446.eurprd04.prod.outlook.com
 (2603:10a6:800:4e::21) by VI1PR0402MB3536.eurprd04.prod.outlook.com
 (2603:10a6:803:2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 11:17:26 +0000
Received: from VI1PR0401MB2446.eurprd04.prod.outlook.com
 ([fe80::c90a:a180:40a2:8996]) by VI1PR0401MB2446.eurprd04.prod.outlook.com
 ([fe80::c90a:a180:40a2:8996%12]) with mapi id 15.20.3499.028; Fri, 30 Oct
 2020 11:17:25 +0000
From:   "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
To:     "Biwen Li (OSS)" <biwen.li@oss.nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>
CC:     Leo Li <leoyang.li@nxp.com>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [v8] i2c: imx: support slave mode for imx I2C driver
Thread-Topic: [v8] i2c: imx: support slave mode for imx I2C driver
Thread-Index: AQHWrq4eYzLFkbsZ2kWeQk1FaIM5T6mv/x7g
Date:   Fri, 30 Oct 2020 11:17:25 +0000
Message-ID: <VI1PR0401MB244647A8A121D6EF974A35B58F150@VI1PR0401MB2446.eurprd04.prod.outlook.com>
References: <20201026100514.6760-1-biwen.li@oss.nxp.com>
 <20201030061452.ledc3ayd5dvdhhzo@pengutronix.de>
 <VI1PR0401MB2446CF6C89272BDC635397018F150@VI1PR0401MB2446.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR0401MB2446CF6C89272BDC635397018F150@VI1PR0401MB2446.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a59a5e9d-b9f2-40f9-57e4-08d87cc56187
x-ms-traffictypediagnostic: VI1PR0402MB3536:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB35369483B232E8D23DAAFFCDCE150@VI1PR0402MB3536.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GU4ec5mv9MHzEnXvdWoU/s3CukQGCZStpgURRZKvISwwSRhyZZ8X4exa2lywTF9YaiYFJg2GcNqp3xsR/zKP1EmAT3kSlvrULhUexx++YTsoP2SB0HHLnvK92gddo5xi11iqI01foxJIHWuSSR53IbgtU32hJ3xby7WoRVnavCArU4C/zeZtCWxxZy3CH8syWGrItAe2V2ULi+gE5kYSSi8PwON0XmiOGVcKjIRBcwP3stYC0FuuOhOd4oBDZhFGYJ2r/S6f+ywjYVyp9/q/7q6HRyeP0NqqARhOkYavN6kR1RSzPuMioeMZh3eoCpF9oNXsY1mUu4oS1UmrvU6oXQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2446.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(478600001)(66556008)(64756008)(4326008)(7696005)(54906003)(66446008)(55016002)(33656002)(76116006)(66476007)(66946007)(2906002)(6506007)(2940100002)(26005)(86362001)(186003)(71200400001)(316002)(9686003)(8936002)(52536014)(7416002)(83380400001)(5660300002)(8676002)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: oA3sjniDhY2WUpissMx0tMT0f2gOHE8cS18c8EjdJh9pDRn3qh/BPDV/fjABnymXAyC30piPNHezwQ6uiphjFSp8E14X+VNbgz1pNxP1b+T3BflfMHANgbSD5ZU16kngGYbyKFMQHXAFMfyC1aNvYJosqvj/ouoRklZIc6fcUTZA6yyVUTbFCyoGEZw0J8vZMJM28zwPzuIILH/OXJy/mFjWrcNj6DCSt38Nq1ZB0L8e2dqY6ZMxkqnIT3qFUO30hPpK+8eOwTSjOleicQ+wPPwgPZp2AWsYKJuufP9KH0W4IrE905ESXxDd3HBOd1nrEUEL/U47XICRm0AYmy4SP58tgD9v0E4vyDlk8bJZ3BkwxyBEK2LICaksRIK7md35Fr43FtaP3yZy+Inz7/yUSpVwBsDo9m5wSobHfK5RpmYXiRMD377e84diA4H46IbYdwYbU4IGN3EZ4a5nq/tQAUNqKhpDMu00HK93yuOlempTPcVCVkfVT62zg5LT0SAZXtZXxuVHaX1rw5XSd+mOic9TQY2aqZwBOQsSB+guUn5X5MDD9Bc+oq3GJqfYGlZJ1CZqRx73ORpYH81HtoGSc7QXGq1RinK9Migyt5VYaOh+7cVQzenRrYZOTp24UcrQ/2UCOlucBI4lVTHdQoslIg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2446.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a59a5e9d-b9f2-40f9-57e4-08d87cc56187
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 11:17:25.5718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N4mMTv7IpPIHcy+913J+I8daagv1O71BZaKQrZR4agibKFTlXvkdrlH1b9kXqXRAqb7v1nSXNFgd7QRAfVNz2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3536
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQo+ID4gPiArLyoNCj4gPiA+ICsgKiBFbmFibGUgYnVzIGlkbGUgaW50ZXJydXB0cw0KPiA+ID4g
KyAqIE5vdGU6IElCSUMgcmVnaXN0ZXIgd2lsbCBiZSBjbGVhcmVkIGFmdGVyIGRpc2FibGVkIGky
YyBtb2R1bGUuDQo+ID4gPiArICovDQo+ID4gPiArc3RhdGljIHZvaWQgaTJjX2lteF9lbmFibGVf
YnVzX2lkbGUoc3RydWN0IGlteF9pMmNfc3RydWN0ICppMmNfaW14KSB7DQo+ID4gPiArCXVuc2ln
bmVkIGludCB0ZW1wOw0KPiA+ID4gKw0KPiA+ID4gKwl0ZW1wID0gaW14X2kyY19yZWFkX3JlZyhp
MmNfaW14LCBJTVhfSTJDX0lCSUMpOw0KPiA+ID4gKwl0ZW1wIHw9IElCSUNfQklJRTsNCj4gPiA+
ICsJaW14X2kyY193cml0ZV9yZWcodGVtcCwgaTJjX2lteCwgSU1YX0kyQ19JQklDKTsgfQ0KPiA+
ID4gKw0KPiA+ID4gK3N0YXRpYyB2b2lkIGkyY19pbXhfY2xyX2lmX2JpdCh1bnNpZ25lZCBpbnQg
c3RhdHVzLCBzdHJ1Y3QNCj4gPiA+ICtpbXhfaTJjX3N0cnVjdCAqaTJjX2lteCkgew0KPiA+ID4g
KwlzdGF0dXMgJj0gfkkyU1JfSUlGOw0KPiA+ID4gKwlzdGF0dXMgfD0gKGkyY19pbXgtPmh3ZGF0
YS0+aTJzcl9jbHJfb3Bjb2RlICYgSTJTUl9JSUYpOw0KPiA+ID4gKwlpbXhfaTJjX3dyaXRlX3Jl
ZyhzdGF0dXMsIGkyY19pbXgsIElNWF9JMkNfSTJTUik7IH0NCj4gPiA+ICsNCj4gPiA+ICsvKiBD
bGVhciBhcmJpdHJhdGlvbiBsb3N0IGJpdCAqLw0KPiA+ID4gK3N0YXRpYyB2b2lkIGkyY19pbXhf
Y2xyX2FsX2JpdCh1bnNpZ25lZCBpbnQgc3RhdHVzLCBzdHJ1Y3QNCj4gPiA+ICtpbXhfaTJjX3N0
cnVjdCAqaTJjX2lteCkgew0KPiA+ID4gKwlzdGF0dXMgJj0gfkkyU1JfSUFMOw0KPiA+ID4gKwlz
dGF0dXMgfD0gKGkyY19pbXgtPmh3ZGF0YS0+aTJzcl9jbHJfb3Bjb2RlICYgSTJTUl9JQUwpOw0K
PiA+ID4gKwlpbXhfaTJjX3dyaXRlX3JlZyhzdGF0dXMsIGkyY19pbXgsIElNWF9JMkNfSTJTUik7
IH0NCj4gPiA+ICsNCj4gPiA+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfSTJDX1NMQVZFKQ0KPiA+
DQo+ID4gTGFzdCB5ZWFyICh0byBiZSBtb3JlIHByZWNpc2UgRGF0ZTogRnJpLCA2IERlYyAyMDE5
IDA4OjM4OjIwICswMTAwKSwNCj4gPiBTYXNjaGEgYXNrZWQgeW91IHRvIG1ha2UgSTJDX1NMQVZF
IHN1cHBvcnQgbm90IG9wdGlvbmFsLg0KPiA+IEluIHRoZSBWNyBvZiB0aGlzIHBhdGNoIHlvdSBl
dmVuIHRyaWVkIHRvIGRvIHNvLi4uDQo+ID4gUGxlYXNlLCBwYXRjaCBkcml2ZXJzL2kyYy9idXNz
ZXMvS2NvbmZpZyBhbmQgYWRkICJzZWxlY3QgSTJDX1NMQVZFIiB0bw0KPiA+IHRoZSBJMkNfSU1Y
IG5vZGUuDQo+IFN1cmUsIG5wLiBXaWxsIGFkZCBpdCBpbiB2NC4NCkNvcnJlY3QgaXQsIGl0J3Mg
djkuIA0KPiA+DQo+ID4gPiArc3RhdGljIGlycXJldHVybl90IGkyY19pbXhfc2xhdmVfaXNyKHN0
cnVjdCBpbXhfaTJjX3N0cnVjdCAqaTJjX2lteCwNCj4gPiA+ICsJCQkJICAgICB1bnNpZ25lZCBp
bnQgc3RhdHVzLCB1bnNpZ25lZCBpbnQgY3RsKSB7DQo+ID4gPiArCXU4IHZhbHVlOw0KPiA+ID4g
Kw0KPiA+ID4gKwlpZiAoc3RhdHVzICYgSTJTUl9JQUwpIHsgLyogQXJiaXRyYXRpb24gbG9zdCAq
Lw0KPiA+ID4gKwkJaTJjX2lteF9jbHJfYWxfYml0KHN0YXR1cyB8IEkyU1JfSUlGLCBpMmNfaW14
KTsNCj4gPiA+ICsJfSBlbHNlIGlmIChzdGF0dXMgJiBJMlNSX0lBQVMpIHsgLyogQWRkcmVzc2Vk
IGFzIGEgc2xhdmUgKi8NCj4gPiA+ICsJCWlmIChzdGF0dXMgJiBJMlNSX1NSVykgeyAvKiBNYXN0
ZXIgd2FudHMgdG8gcmVhZCBmcm9tIHVzKi8NCj4gPiA+ICsJCQlkZXZfZGJnKCZpMmNfaW14LT5h
ZGFwdGVyLmRldiwgInJlYWQgcmVxdWVzdGVkIik7DQo+ID4gPiArCQkJaTJjX3NsYXZlX2V2ZW50
KGkyY19pbXgtPnNsYXZlLCBJMkNfU0xBVkVfUkVBRF9SRVFVRVNURUQsDQo+ID4gJnZhbHVlKTsN
Cj4gPiA+ICsNCg0K
