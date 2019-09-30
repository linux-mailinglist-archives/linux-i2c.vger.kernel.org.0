Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3859C1A3D
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2019 04:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbfI3CsH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 29 Sep 2019 22:48:07 -0400
Received: from mail-eopbgr40052.outbound.protection.outlook.com ([40.107.4.52]:57216
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728853AbfI3CsH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 29 Sep 2019 22:48:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neuUKR7pyxqUgut9+Dl8P0albqVYP0F4LEI01TmLTR0r/Ss3yan15lL/uwGjJmR+h4DYeG3DKx1nYG9B7brLPcByL5iQnbiWN9qRbWKi3S9BA6nzqEJOYgN8qVSTqNy4eHpz2oEfjoQ3hxbjyQL/I61QEidhwmHu3Gc74Eyk2d8L5/gFL/uu6/mK7l+XMyPD/ewYMdaI+XE9d7zF8ZgicRaQdUBKjbQu1IGtIv4e/z30Xy589SUZ6hzIDRGnbNc7tuxZgR31zD+tPhgKpQq4Ey17U7duqWBDYEvbioQRn4WAdAayF/CbXgaSmyRd2Dt2Fy86bFUjSfWkNadVtO6kbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYxH/6gEEQTThluScmhj4dtJfLbfRT5I+4OCBkMWCEY=;
 b=ER16QbdlRv+/XHxOIH3xyBTAqCInBzBwZAS0mlVreIoAKLW87X/oNczBTQzIrUMN75TUYCj+R8hurHMwvct9ZtWtuN7son4bypZZMVxsq3yeWKVYZ4++vBtrG9kiIvTbWCn/03ju5ljws7b7iLoTRkq3QrGZZqw/hIzuvh+puDuXjhQouRYHV36zTCymI9SwXNk1Abhoev0vxqJhPmFDWSB2bP6MJM+ie/+vNutlmqC0zLI9HVW71WW3l/+vEI9hxi98XKd3mVyFh9xfnrpg0eeUHuse/4wZjrZciOWJ5787WVcqsCZpz9YaeQRkD4DKMxVDq4tFRx2fCjMFw7Yr3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYxH/6gEEQTThluScmhj4dtJfLbfRT5I+4OCBkMWCEY=;
 b=LO5e6SXqTyTjhyiYwWYweJlLCVs9Ik5T1iO3+t+DIWCl7IQebU+dq99h9So2utj8Pl/scez+fEzLIeN7g17XW86GZKSQi0PnI60BAIi+nLqpwnOKL2SLgHMkSYnXFzRpk34YjocKQYnt9Xbv9ALv3de5jhQrTFCvzRTV03Vf4vY=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4780.eurprd04.prod.outlook.com (20.176.235.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 02:48:05 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11%7]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 02:48:04 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     "cengiz@kernel.wtf" <cengiz@kernel.wtf>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peda@axentia.se" <peda@axentia.se>, Leo Li <leoyang.li@nxp.com>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: RE: [EXT] Re: [PATCH] i2c: pca954x: Add property to skip disabling
 PCA954x MUX device
Thread-Topic: [EXT] Re: [PATCH] i2c: pca954x: Add property to skip disabling
 PCA954x MUX device
Thread-Index: AQHVdrNEJV2leaUci0C/QdGNs99lDadCfriAgAEFpCA=
Date:   Mon, 30 Sep 2019 02:48:04 +0000
Message-ID: <DB7PR04MB449059DCF1A24CFBBFEAFF678F820@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190929103638.46038-1-biwen.li@nxp.com>
 <2a3f9ec1955e8b785888994e2a9b7cc0d5800a71.camel@kernel.wtf>
In-Reply-To: <2a3f9ec1955e8b785888994e2a9b7cc0d5800a71.camel@kernel.wtf>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c132c6f-a48e-43e5-8e7d-08d745509e2a
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DB7PR04MB4780:|DB7PR04MB4780:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4780E8556819716214968ED08F820@DB7PR04MB4780.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(76116006)(66476007)(66946007)(66066001)(25786009)(71190400001)(6916009)(71200400001)(2351001)(478600001)(66556008)(66446008)(476003)(305945005)(74316002)(7736002)(256004)(14444005)(64756008)(7696005)(52536014)(33656002)(2906002)(8676002)(2501003)(81166006)(81156014)(44832011)(1730700003)(26005)(486006)(316002)(6436002)(55016002)(5640700003)(6116002)(5660300002)(54906003)(4326008)(186003)(3846002)(99286004)(14454004)(76176011)(229853002)(11346002)(446003)(8936002)(9686003)(6246003)(6506007)(86362001)(102836004)(4744005);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4780;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /nnqqgIBQRhgoRpHO6zaMQIjZKrdYMrnW5pNUomkYvVBjj7wt/LrTO1Ud0in9Hu/x8ZnSQKNsJlCJNGLHnjmWD73pyP9U+h7u2EFUBv4awb3wRHc7Urr3LUCsgeuKxZzoNt3ukFBQ5PLLhdebBK1OGqsoIbgtg4ddXowz4cY+7LYRfjyL6Dz3ctFM5PZObUNpQ4FtFGYDXd0Uzu6xt/q/M7aOUoFC32B/DZTY61aw039Se44vwkUADGV0HcGsWur1O4RhS5Hza1o3vo3kEgK6A+jmCo39X78hyP4MBvSl1ahj59MBYvj8XbT2MWxB+AQIMCK9onAvaYaXy6suJJHXtRbDxVAexQje3y5oNJWx80ivb9iOlj8Wgqm6o9/UzRDpEoIV1Ov0qPj9ufsefPurdUoHT++HNg4MoO+sn37JiA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c132c6f-a48e-43e5-8e7d-08d745509e2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 02:48:04.8354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ZS0Swz7QOSGOT4ujNhM4UKLIQfskT4lpLXB/grCLuK1uefN3RxacXUVCvtA0AO1xIxESz+JTfqSpz2+ja5hqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4780
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiANCj4gSGVsbG8gQml3ZW4sDQo+IA0KPiA+ICsgICAgICAgLyogRXJyYXRhIElEIEUtMDAwMTMg
b24gYm9hcmQgTFMyMDg4QVJEQiBhbmQgTFMyMDg4QVJEQjoNCj4gPiArICAgICAgICAqIFRoZSBw
b2ludCBoZXJlIGlzIHRoYXQgeW91IG11c3Qgbm90IGRpc2FibGUgYSBtdXggaWYgdGhlcmUNCj4g
PiArICAgICAgICAqIGFyZSBubyBwdWxsdXBzIG9uIHRoZSBpbnB1dCBvciB5b3UgbWVzcyB1cCB0
aGUgSTJDLiBUaGlzDQo+ID4gKyAgICAgICAgKiBuZWVkcyB0byBiZSBwdXQgaW50byB0aGUgRFRT
IHJlYWxseSBhcyB0aGUga2VybmVsIGNhbm5vdA0KPiA+ICsgICAgICAgICoga25vdyB0aGlzIG90
aGVyd2lzZS4NCj4gPiArICAgICAgICAqLw0KPiANCj4gQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbiB3
aGF0IGEgIm1lc3MgdXAiIGlzPw0KVGhpcyBpcyBhIGhhcmR3YXJlIGJ1ZyB0aGF0IGhhcHBlbmVk
IG9uIE5YUCBib2FyZCBMUzIwODVBUkRCIGFuZCBMUzIwODhBUkRCLg0KU28gZ2l2ZSBhIHNvZnR3
YXJlIGZpeCBmb3IgdGhlIGhhcmR3YXJlIGJ1Zy4NCj4gDQo+IEFuZCBhbHNvLCBzaG91bGQgd2Ug
cHV0IHRoaXMgbmV3IERUUyBwcm9wZXJ0eSBpbiByZWxhdGVkIGRlZmF1bHQgYmluZGluZ3M/DQo+
IA0KPiBJZiBub3QsIGFyZSB5b3UgcGxhbm5pbmcgYSBkb2N1bWVudGF0aW9uIHVwZGF0ZSBmb3Ig
dGhlIHVzZXJzIHRvIG5vdGlmeSB0aGVtDQo+IGFib3V0IHRoaXM/DQpJIHdpbGwgdXBkYXRlIGJp
bmRpbmdzIGRvY3VtZW50IG9uIHYyLg0KPiANCj4gLS0NCj4gQ2VuZ2l6IENhbiA8Y2VuZ2l6QGtl
cm5lbC53dGY+DQoNCg==
