Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACF9610C297
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Nov 2019 03:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbfK1Cp5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Nov 2019 21:45:57 -0500
Received: from mail-eopbgr00053.outbound.protection.outlook.com ([40.107.0.53]:34253
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727822AbfK1Cp4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 Nov 2019 21:45:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVfood2aQUI1yW+raag/gnoaPAXpS/abIZ3tOGBSklL39V/e4fc6nqJ9WzfNT17bpozfM8IKV1ui9aUjIc6oQohKcB7Qnp6bnrcmWsapQQUldkbwkf49dTGDG+XYTdQALRphEw/02YJksd5vdm8cKJNKTV1Ob9I4TjP/seeST7F+CqDIFpw+DWGs9CqQrwyQCOQGSlUK06m86UXXG86xFciTTD7T5/ZTvsKUX89bmqojli4KHxy/AfcKrqtKUTRjcm+154Jms2KmZPRkVxgGFtT2gJDyJjSu7qNhb5JdM77bbTy/UQKfNf+W4c7xKhI7kKqucP3VIVvCwfkHdDR13w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBUAQMT1gSwo/n+MArZ5u3w2kFcpbY5wmXTNcnEBJA0=;
 b=WQTtRVA89x1peVP6VEedyMloytpJRayYtvov3GIidUS57/HwmOgGAfY7je276RKFSuEylX4vLejYuwkP01ImrDgV+fsX6X1z2YylxFpM9Lv24yKoO2oioadcpm6fJQKq1yBg8rF6iUcGGHN6vbTGGX4IyiWinNH9kA6Jm1KkyCFGW5oo2x3DGTPZiH15VrarKrKqcsDriwx96T2w7DfgLcZfVSQnm46SElRe/Kc/QMpWNUebRoRCn5jj1mRiG1dXVyMy2NTaq3PGhyHawZEoHQ4dSyicrHeM8JoplyIz4c2RZfrJOoDuG3H/OrHsEsHdIwaq/KtTjYlt9nIz3y+9jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBUAQMT1gSwo/n+MArZ5u3w2kFcpbY5wmXTNcnEBJA0=;
 b=IX9bG93T1UIY3R9RruqpqKPDdA12GB9gcLffVP+Xn0k0wzfFqtz1NpPBUcxUcPsJH3tdQ5AF9vsW/UUUoR9M2r7N84oKz27auIMJJOYVqWNaL6gd8c5s2dUnDMuCdfJ0CuCgTsdW6H8NySdnavmPSWbXzlIxzSX8uc/Md5ndMpg=
Received: from VI1PR04MB4431.eurprd04.prod.outlook.com (20.177.55.205) by
 VI1PR04MB6174.eurprd04.prod.outlook.com (20.179.26.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Thu, 28 Nov 2019 02:45:52 +0000
Received: from VI1PR04MB4431.eurprd04.prod.outlook.com
 ([fe80::c947:5ae7:2a68:a4f2]) by VI1PR04MB4431.eurprd04.prod.outlook.com
 ([fe80::c947:5ae7:2a68:a4f2%3]) with mapi id 15.20.2495.014; Thu, 28 Nov 2019
 02:45:52 +0000
From:   Peng Ma <peng.ma@nxp.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
CC:     "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH] i2c: imx: Defer probing if EDMA not available
Thread-Topic: [EXT] Re: [PATCH] i2c: imx: Defer probing if EDMA not available
Thread-Index: AQHVpPH7P18PyO0DCUWpmTSTyww0uaeenlSAgAFCqIA=
Date:   Thu, 28 Nov 2019 02:45:52 +0000
Message-ID: <VI1PR04MB44315FD37E81C7EE6903D49FED470@VI1PR04MB4431.eurprd04.prod.outlook.com>
References: <20191127071136.5240-1-peng.ma@nxp.com>
 <20191127072723.7twwbjafqdd22v6m@pengutronix.de>
In-Reply-To: <20191127072723.7twwbjafqdd22v6m@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.ma@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3119104b-41e1-4c2f-b935-08d773ad1570
x-ms-traffictypediagnostic: VI1PR04MB6174:|VI1PR04MB6174:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB617469A3EF96EA05467C9371ED470@VI1PR04MB6174.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(199004)(13464003)(189003)(6506007)(71190400001)(71200400001)(102836004)(478600001)(14454004)(3846002)(6116002)(6916009)(446003)(99286004)(45080400002)(11346002)(86362001)(7736002)(74316002)(305945005)(26005)(44832011)(256004)(316002)(33656002)(66066001)(54906003)(186003)(66476007)(55016002)(8676002)(81166006)(66556008)(81156014)(6436002)(76116006)(4326008)(66946007)(6246003)(6306002)(229853002)(52536014)(7696005)(2906002)(8936002)(5660300002)(25786009)(66446008)(9686003)(76176011)(64756008);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6174;H:VI1PR04MB4431.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BstHFuXmRU1H6QTiUyXPhOUnZ/jbHEggdePER10eX9NpHC3fx2RyDeEa9+dAUYRiq1KkRnNIlj07n30REnGIGOpzw64gUy8tPf1RhFRbrwd4Z0X1aB6WqZfmNvIOD5aPIn0cuGWMxeEop7gmE5cvgf4F8U9zzfY0QwuKwNM987vo2fqvP+UriUgG5HHWtBxQ5JGlw+MpJZbrXloa9gakxpfhmm7HhvsGtzAUS3Yfy7KDAF6WhqHvQFOTGZoG+w/W1RWzzvd/Ynz21xD0qv/2m3aJdcDzk1vlFIZvrM8kFX59Ge+ZEWQmJs2h6ZJQZaabqd2du+U8l2+pD4mH9SZXIdsH7m/h2yVaKAuNg+6Wk/q2GVjFyAK2JQvUqNcHeJ/wMjRKb+HfDCkAnfqQc7C8GzTrgVFqz2rfu6CfDbQTnCeZ9ntIWsJXk41+GdMZCbDMdMBoqBVhjW/r4OJPglRBw+FeHiZBZb0eCawDXp06vAI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3119104b-41e1-4c2f-b935-08d773ad1570
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 02:45:52.1621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hV8eaLCANzbvn57v0flbsANuhJ/5EEVX0mwhzNTDvT/rEQ5b4PHa0TpvLy+WdmvK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6174
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFV3ZSBLbGVpbmUtS8O2bmln
IDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+DQo+U2VudDogMjAxOeW5tDEx5pyIMjfm
l6UgMTU6MjcNCj5UbzogUGVuZyBNYSA8cGVuZy5tYUBueHAuY29tPg0KPkNjOiBsaW51eEByZW1w
ZWwtcHJpdmF0LmRlOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IHNoYXduZ3VvQGtlcm5lbC5vcmc7
DQo+cy5oYXVlckBwZW5ndXRyb25peC5kZTsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsg
ZGwtbGludXgtaW14DQo+PGxpbnV4LWlteEBueHAuY29tPjsgZmVzdGV2YW1AZ21haWwuY29tOw0K
PmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtaTJjQHZnZXIua2Vy
bmVsLm9yZw0KPlN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0hdIGkyYzogaW14OiBEZWZlciBwcm9i
aW5nIGlmIEVETUEgbm90IGF2YWlsYWJsZQ0KPg0KPkNhdXRpb246IEVYVCBFbWFpbA0KPg0KPkhl
bGxvLA0KPg0KPk9uIFdlZCwgTm92IDI3LCAyMDE5IGF0IDA3OjEyOjA5QU0gKzAwMDAsIFBlbmcg
TWEgd3JvdGU6DQo+PiBFRE1BIG1heSBiZSBub3QgYXZhaWxhYmxlIG9yIGRlZmVyZWQgZHVlIHRv
IGRlcGVuZGVuY2llcyBvbiBvdGhlcg0KPj4gbW9kdWxlcywgSWYgdGhlc2Ugc2NlbmFyaW9zIGlz
IGVuY291bnRlcmVkLCB3ZSBzaG91bGQgZGVmZXIgcHJvYmluZy4NCj4NCj5JJ2Qgd3JpdGU6DQo+
DQo+ICAgICAgICBpMmM6IGlteDogRGVmZXIgcHJvYmluZyBpZiByZXF1ZXN0aW5nIERNQSB5aWVs
ZHMgRVBST0JFX0RFRkVSDQo+DQo+ICAgICAgICBETUEgbWlnaHQgbm90IGJlIGF2YWlsYWJsZSB5
ZXQgd2hlbiB0aGUgaTJjIGRldmljZSBwcm9iZXMuDQo+ICAgICAgICBQcm9wZXJseSBoYW5kbGUg
RVBST0JFX0RFRkVSIG9uIGRtYSBjaGFubmVsIGFsbG9jYXRpb24gYnkNCj4gICAgICAgIHBhc3Np
bmcgb24gdGhpcyBlcnJvci4NCj4NCj5JdCB3b3VsZCBiZSBuaWNlIHRvIHBvaW50IG91dCB3aGVy
ZS9ob3cgdGhpcyBmYWlsZWQgZm9yIHlvdS4NCj4NCj5PdGhlciB0aGFuIHRoYXQgdGhpcyBsb29r
cyByZWFzb25hYmxlLg0KPg0KSGksIFV3ZSwNCg0KVGhhbmtzIHZlcnkgbXVjaCBmb3IgeW91ciBj
b21tZW50cywgVGhhdCBsb29rcyBnb29kLg0KDQpCZXN0IFJlZ2FyZHMsDQpQZW5nDQo+QmVzdCBy
ZWdhcmRzDQo+VXdlDQo+DQo+LS0NCj5QZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCBVd2UgS2xlaW5lLUvDtm5pZw0KPnwNCj5JbmR1c3RyaWFsIExpbnV4IFNvbHV0
aW9ucyAgICAgICAgICAgICAgICAgfA0KPmh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rp
b24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnd3dy5wDQo+ZW5ndXRyb25peC5kZSUy
RiZhbXA7ZGF0YT0wMiU3QzAxJTdDcGVuZy5tYSU0MG54cC5jb20lN0M0MjZlYzRmDQo+NWYxZjE0
NzUxMDIyZjA4ZDc3MzBiNDA0MyU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdD
MA0KPiU3QzElN0M2MzcxMDQzNjQ0NzA1Njg3MjImYW1wO3NkYXRhPUpqRDJvdnk0b3hac2VVRVV3
TkVSQVNCSkNrDQo+MG9NTFNwbGI4cVJUa2hhVEUlM0QmYW1wO3Jlc2VydmVkPTAgfA0K
