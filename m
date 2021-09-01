Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFDF83FDDC5
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Sep 2021 16:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244812AbhIAOZF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Sep 2021 10:25:05 -0400
Received: from mail-dm6nam10on2130.outbound.protection.outlook.com ([40.107.93.130]:46909
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244778AbhIAOZE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Sep 2021 10:25:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXn7Ib1fbRbuaTCuJGhkYUTyAB942656EqWsYwMKjqZ1NvbsYApFZUv9jnkDjrbON1ydm/2NDugl/U4yxJ7jMOATAiCGW4kM6qBWI4yqwz5N/ekjneW47TczJQsQUXdUnqYCRcjw3NmtCXHlJi0K4X+Yi3eZIWyG3QwniOoLVs/anUrksNTiiI1ABjj2ev47KJFmGgmPeBlQ0SC3SSvx9JqdcbQveECG+oe94UiFQvBir+yulbfo5sV7G+ZPnQXTXOFMiHne0mPeSYFq/PJxgEt9lLFyenXCSg+HtGDDH6+4+pLssOIWzdUcVGtX84ryoKWvxa/74DT7MJ5hxaYCbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NoAV4TqfFAR66lfjxFFH/RSYDart8DAPTv/0IkXD2R8=;
 b=QT5w3U8wT5QimLnS/UlqBBjXgu5JR6MtLJh4DPA0ADWIXgOwxnWh7vY3bhRxigUMSKSAweiuELtNp/D+/T8wiQUcYvXvLXT9rlJK2r/FngmWtJTa3JewELyEl2C+S+e1g0IYihMbZr+yVnpgrwnLi/3mVI0w4s/TYbmt3wBsjFmy+5uY/XBlMZ5/75CKXSNX3MCDoRUbpW/e6s7Ilbx6Q/QHR8lxIeAtA6/nLOh/CRpL6irQ4Rp/vHEiViEv7HNOAHXO6GT3vHloqNoU0DrloyO+Q7qIzv6bmMvOhsU/1dqxPWfbTMv4+BP1RJgZzLCVltuXJmWq39we4NXMEi1f7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sealingtech.com; dmarc=pass action=none
 header.from=sealingtech.com; dkim=pass header.d=sealingtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sealingtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoAV4TqfFAR66lfjxFFH/RSYDart8DAPTv/0IkXD2R8=;
 b=bU7yFphu2tfyAsypO5IDlg/m6NLEYReG/fVOXIbw5gZFihQVOIIx+T0Tz1cm4EAwGMY/QSIKv55Cjxhi4YYuLzUN3eW2YAH90v4fLggexud8XPSlRpZCDqNio7j2+lDgB0R9twjLsb+glQB65MiresbelNoJB3Li9/Y8Gvp2ckI=
Received: from MN2PR13MB3502.namprd13.prod.outlook.com (2603:10b6:208:16e::14)
 by BLAPR13MB4595.namprd13.prod.outlook.com (2603:10b6:208:322::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.14; Wed, 1 Sep
 2021 14:24:05 +0000
Received: from MN2PR13MB3502.namprd13.prod.outlook.com
 ([fe80::2143:cecb:6e94:2522]) by MN2PR13MB3502.namprd13.prod.outlook.com
 ([fe80::2143:cecb:6e94:2522%3]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 14:24:05 +0000
From:   Dan Lohin <daniel.lohin@sealingtech.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Andrew Manley <andrew.manley@sealingtech.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "biwen.li@nxp.com" <biwen.li@nxp.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        Tim Harvey <tharvey@gateworks.com>,
        Embedded Controller <embedded-controller@sealingtech.com>
Subject: Re: I2C_SLAVE_STOP with i.MX 8M Mini I2C driver
Thread-Topic: I2C_SLAVE_STOP with i.MX 8M Mini I2C driver
Thread-Index: AQHXlGJfrH25OMC2O0Of8zQrtUDHjquCHdYAgA0uM5A=
Date:   Wed, 1 Sep 2021 14:24:05 +0000
Message-ID: <MN2PR13MB3502A75AFAB4CB08EDC64FF09DCD9@MN2PR13MB3502.namprd13.prod.outlook.com>
References: <MN2PR13MB4208E382DD4A2BE7A4D5A8DFE3FF9@MN2PR13MB4208.namprd13.prod.outlook.com>
 <20210824044838.GA14337@pengutronix.de>
In-Reply-To: <20210824044838.GA14337@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=sealingtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a233c8df-f0af-4bb2-5281-08d96d542756
x-ms-traffictypediagnostic: BLAPR13MB4595:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BLAPR13MB459565695AF12839C29742619DCD9@BLAPR13MB4595.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BTKWFLQSCwidOTTcm7wC9HT4UhQI+jNEJbEKTa8L4FrxrpHzb2+Y0h5FOdMhABHcWFyGv29hGEpqTVelkMY0j/uuhdsbQgDNOvFOxMIvSF5k/sYpcsyKKD7RjEgztzJjBus2eeixKsFUs/WDXcGLNOP1KCns9ephNnN9MjKhyjeTiFYtuFTYJsEZAAb20S94gV4D288eLNCC8X7vTBZfFXQYlAKtb52d83UwdcJ4fNJqSrGUabYlCzxQw8IDbxNIm/gmKmkxkwz7p1LuJ8KkZ5G+87meoMllV6c3uzts0DRvVYq8Yy0M1q/I9wEWOOQ++VyewLlbYUgn/gal21qrkydmVdGh665NxZcL+2wN7rc/AAPX6EUBxDEAiIt3qAtawQ0zveOjP0oS95o94UnAVUkMNUyjDnWu6OhmM3/INXd2O2WZQjlFByzp1xza3kqr0nEQIaGR4FGqc38av7tcvxSyuX5wXIhcVg93K4jQJU9BU1cOyAudRBOXmM9EVqgPtjia8nph6MfQIATksefI0OB3+FQ7a+9iJXCulLbLT3f3njHYxJ+uZzdHeNpaeNEIZGqfu8SxYU2wEbZimqj17G14Et1BhNFm0lusNfQff9Cg1HM8TAHETsC/+4efB/l6rYV2wE1r6JajNaK0LD2dEQQNpAevoq1yhoXBJ/uWH9lvZIwwZF2ofEA30hObZpimDvtIW7tBCNlGloByn/4+jJV1WAWD/q2DK7LifdEE9JZuO5HCkHYkieewdS7aWU8Aqt/R6Dcy4Uqu6GhZbmgF9gzjD0pLZ3PjZBtwRJkH8ZKoi6XkqusEZndOewQ7YL7O
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR13MB3502.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(39840400004)(366004)(136003)(396003)(346002)(376002)(83380400001)(33656002)(2906002)(8936002)(8676002)(478600001)(5660300002)(110136005)(54906003)(86362001)(66446008)(64756008)(66556008)(52536014)(9686003)(316002)(38070700005)(107886003)(66476007)(38100700002)(4326008)(91956017)(76116006)(966005)(53546011)(6506007)(66946007)(7696005)(122000001)(6636002)(71200400001)(26005)(55016002)(186003)(15519875007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1dQbHVBeXExL3E0MStiV0d1UllZVUYrS0x6UGxUOG9NdHFVUStEZjROaWFa?=
 =?utf-8?B?SmtOK1A2VWUrV0ZzWlZ6ejlURWdiS0JaWlNVTWlNUzVLV2JqS2pobm5DdkFn?=
 =?utf-8?B?SDJIV1pwZnFiQ244eHhGdFBmazhPeU1ka0JPWFdPUk0zK0M5ZlhYRWlSeS9j?=
 =?utf-8?B?RmdvNlFaNzYwTE9ES2NUa1pmaEt5U3EvQnFDYm9DU2MrdVlvQUlUd2hYSzho?=
 =?utf-8?B?Nm1WdzNTYXNqbWZ4MnEwUTlIeWxlSkhYS1dQYVJHL1ZhM2hDNkdId1AvZ0FG?=
 =?utf-8?B?MzZjamJjSUNRVmZzdFE2RjhYQ216K1JucisxeFR0dmdEU250bHdpNm9XYWZo?=
 =?utf-8?B?Wk5wQkRvZlZuelRwbThmSEIxMlhZSmVpVHhydlpPYndaUjhjV1ZRQ0NUSGw3?=
 =?utf-8?B?R2UwZFFQdGEyZmRxUE1EUzc1QXFQSlBwWDlhQmVOY3F1VjZnRU1JRkZxMzNr?=
 =?utf-8?B?WmhSeGx1SWw4SEp4alFtdEZaTGRkM3FMU3ZhcEpxVk42Qm9MaVc0K0l0ZnZy?=
 =?utf-8?B?M0NPOWVTREdDdllEWld2aDNoNlRtWXNXWUtES0M0RTBrY1k1Q2pmenZSL09y?=
 =?utf-8?B?dXlJWTZlV3F4NWhQckV2MWt2enZiVkphQTNreEVXS2t5VXdlNm9aRk9jcUpx?=
 =?utf-8?B?QVRvc2RxUmlyL2loY2hXN0dKY0xsZXlseXYwTDVKbWpDSGhPQ1RaVDVrNEcw?=
 =?utf-8?B?c2lnUEUxMVlObkVFcFlpSnNpVysycWtDQ0N3NExROTdzNDZYN1Z0TXQyVGll?=
 =?utf-8?B?dUJKS3NFQjRGYjU5c3NiNWtaNEk3QzVYNm9BVWNzL2FMYlA4VTlvU3ozQzJ0?=
 =?utf-8?B?SC9SZGlnZjRGd0Fna2hJLzNyZTJhQjBaU1ZLc0RRR3lDSlBWbUh1aW5aSnNX?=
 =?utf-8?B?LzBVQ2ZpTWhFU216OEN5VmNMa3p4NFZaTzdZbTR2U3JZVktjNXRJZFIrK3or?=
 =?utf-8?B?Z1dZbitTVnExdit3QjgvK0wzN1pUcVpKSlAyQkFmb0F2M3pheUdqRjdEMUFo?=
 =?utf-8?B?STM5MWNreWc3NXA5V3hoQXg3WWg1R2RHRVFmNFo4RkphNlhlMWgzMnBtK1Jx?=
 =?utf-8?B?M29sUENPVlNVZG02UVFVQjZSU1JEbW16aWZ0WTI5SDVXOWt1ZnB3eTBMTHM1?=
 =?utf-8?B?SXAycVhnUWkrZ1I3TVhXQUE4aGpPQkhENTdhbGc1RHpBbkxnMFFvejNiUGdo?=
 =?utf-8?B?Z2V3WEtvT1VvTFViMTFRdXg0ZEhONGlnYlI0Y1laLzdtczV3S081SXdlUEJW?=
 =?utf-8?B?eWlFcm4xWk5IVU9rd0doZktQd3hIZXR5M3NKNG5GWEtwMUhRN3FmeStQTWlB?=
 =?utf-8?B?aW1JbGQwclVzK3J1bWgydFlCWjJRSnNJanMwenlyQjFjdlUyOGJWT0s5R0dr?=
 =?utf-8?B?NHk4SXZENXBXYlFSVjV2WDlUZ1ZQVjJqSEJJeDFpaUJrcXBLQmFtMkNlSU55?=
 =?utf-8?B?N3V3VmtMU2ZLNm5IYW9JT2hIcDVxRFNkSUNYdzFwdXZqb2wwcStSUlR5MU5V?=
 =?utf-8?B?ZDNMZUZ6MEdER0pxR241cFdkSG4wTHZrb2ZwQzNGai9zbTZSQnRNUTNEd1Rw?=
 =?utf-8?B?QzdhKy9kOWgzOGZmNU53bERHZkZlL08zaUd3U1VWK0NtTXJDREE5Q01TdXJq?=
 =?utf-8?B?U2d4RmJaZ3BxNWZsRFFDTXNXeWViV3dDZkE1aXdpYTNxZmREOTg1dEtCbDF0?=
 =?utf-8?B?VE9CTDA3Z1QxYlFCWmJsQkZnWXZkZXF3enUyQ3MvMGZkN0YvYW5xZWp6aXNT?=
 =?utf-8?Q?cdeuc91jWw7AWtjP4Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sealingtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB3502.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a233c8df-f0af-4bb2-5281-08d96d542756
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 14:24:05.3005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 647a570e-dbad-43af-af08-79999bd307d9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r5dezfNzB7vGxdbCtlQVyQKOp1ycqkF+shuhfGwtpqzPdcjoF8kfHHx4iD5LATy0oRE6JTYCVQ9JYFgzb1EdoUKvVvcruI8QQiSuu1jeTdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR13MB4595
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGhhbmtzIGZvciB0aGUgcmVwbHkuwqAgV2UgaG9va2VkIGl0IHVwIHRvIGFuIG9zY2lsbG9zY29w
ZS7CoCBUaGUgc2lnbmFsIGxvb2tlZCBjbGVhbiBvdmVyYWxsLsKgIFdlIGRpZCBub3RpY2UgYSBz
bWFsbCB2b2x0YWdlIHNwaWtlIG9uIFNEQSByaWdodCBuZWFyIHRoZSBlbmQuwqAgSSBhbSBub3Qg
c3VyZSBpZiB0aGF0IGlzIHNvbWV0aGluZyBjaGVja2luZyB0byBzZWUgaWYgdGhlIGxpbmUgaXMg
YnVzeSBvciBub3QuwqAgSSBhZGRlZCBwdWxsLXVwIHJlc2lzdG9ycyB0byBlbnN1cmUgdGhlIHNp
Z25hbCB3b3VsZCBtb3ZlIHVwIGZhc3RlciBidXQgdGhhdCBkaWRu4oCZdCBoZWxwIHNvIEkgYW0g
cHJldHR5IGNvbmZpZGVudCB0aGF0IGl0IGlzbuKAmXQgYSBoYXJkd2FyZSBpc3N1ZS7CoCBOb3Qg
c3VyZSBpZiB0aGVyZSBhcmUgYW55IG90aGVyIGlkZWFzIHlvdSBoYXZlLCBpdCBzb3VuZHMgbGlr
ZSB3ZSBuZWVkIHRvIGRpZyBpbnRvIHRoZSBJTVggZHJpdmVyLgrCoApPc2NpbGxvc2NvcGUgaW1h
Z2VzOgpodHRwczovL2ltZ3VyLmNvbS9hL0NJc1pFbngKwqAKwqAKRnJvbTogT2xla3NpaiBSZW1w
ZWwgPG8ucmVtcGVsQHBlbmd1dHJvbml4LmRlPgpEYXRlOiBUdWVzZGF5LCBBdWd1c3QgMjQsIDIw
MjEgYXQgMTI6NDggQU0KVG86IEFuZHJldyBNYW5sZXkgPGFuZHJldy5tYW5sZXlAc2VhbGluZ3Rl
Y2guY29tPgpDYzogbGludXgtaTJjQHZnZXIua2VybmVsLm9yZyA8bGludXgtaTJjQHZnZXIua2Vy
bmVsLm9yZz4sIGJpd2VuLmxpQG54cC5jb20gPGJpd2VuLmxpQG54cC5jb20+LCB3c2FAa2VybmVs
Lm9yZyA8d3NhQGtlcm5lbC5vcmc+LCBUaW0gSGFydmV5IDx0aGFydmV5QGdhdGV3b3Jrcy5jb20+
LCBFbWJlZGRlZCBDb250cm9sbGVyIDxlbWJlZGRlZC1jb250cm9sbGVyQHNlYWxpbmd0ZWNoLmNv
bT4KU3ViamVjdDogUmU6IEkyQ19TTEFWRV9TVE9QIHdpdGggaS5NWCA4TSBNaW5pIEkyQyBkcml2
ZXIKQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3Jn
YW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuCgoK
SGkgQW5kcmV3LAoKT24gVGh1LCBBdWcgMTksIDIwMjEgYXQgMTI6MjM6MjlQTSArMDAwMCwgQW5k
cmV3IE1hbmxleSB3cm90ZToKPiBEZWFyIG1haW50YWluZXJzLAo+Cj4gSSBoYXZlIGFuIGkuTVgg
OE0gTWluaSBhbmQgSSBhbSBydW5uaW5nIGEgNS4xMyBMaW51eCBrZXJuZWwuIEkgYW0gYXR0ZW1w
dGluZyB0byBzZW5kIElQTUkgY29tbWFuZHMgdG8gYSBTdXBlcm1pY3JvIHNlcnZlciBvdmVyIEky
Qy4gSG93ZXZlciwgSSBhbSBub3Qgc3VyZSB0aGF0IHRoZSBJMkNfU0xBVkVfU1RPUOKAiyBldmVu
dCBpcyB0cmlnZ2VyaW5nIHdoZW4gaXQgaXMgc3VwcG9zZWQgdG8gb3IgYXQgbGVhc3Qgd2hlbiBJ
IGFzc3VtZWQgaXQgd291bGQgdHJpZ2dlci4KPgo+IEZpcnN0LCBJIGluc3RhbnRpYXRlZCBhbiBJ
MkMgc2xhdmUgYmFja2VuZCB3aXRoIGl0cyBvd24gYWRkcmVzcy4gVGhlbiBJIGNyYWZ0ZWQgc29t
ZSBJUE1JIG1lc3NhZ2VzIGZvbGxvd2luZyB0aGUgc3BlY2lmaWNhdGlvbiwgc3BlY2lmeWluZyB0
aGF0IHRoZSBzZXJ2ZXIgcmVzcG9uZHMgdG8gdGhlIHNsYXZlIGFkZHJlc3MgdGhhdCBJIHVzZWQg
dG8gY3JlYXRlIHRoZSBiYWNrZW5kLiBBZnRlciB0aGF0LCBJIGNhbiB3cml0ZSB0aGUgYnl0ZXMg
dG8gdGhlIHNlcnZlciBhcyBhIG1hc3RlciBvbiB0aGUgSTJDIGJ1cyB3aXRoIG5vIHByb2JsZW1z
LiBBcyBwYXJ0IG9mIHRoZSBJUE1JIHNwZWNpZmljYXRpb24sIHRoZSBzZXJ2ZXIgcmVzcG9uZHMg
dG8gbXkgcmVxdWVzdCBieSBiZWNvbWluZyBhIG1hc3RlciBvbiB0aGUgSTJDIGJ1cyBhbmQgdGhl
biB3cml0aW5nIHRoZSByZXNwb25zZSBiYWNrIHRvIHVzIGF0IHRoZSBhZGRyZXNzIHNwZWNpZmll
ZC4KPgo+IEF0IHRoaXMgcG9pbnQsIHRoZSBpMmMtaW14LmPigIsgZHJpdmVyIHNlZW1zIHRvIGhh
bmRsZSBhbGwgdGhlIHNsYXZlIGV2ZW50cyByZWxhdGVkIHRvIGJlaW5nIHdyaXR0ZW4gdG8gYW5k
IHRoZSBiYWNrZW5kIGRyaXZlciByZWNlaXZlcyBhbGwgdGhlIGJ5dGVzIGFzIHRoZXkgYXJlIGJl
aW5nIHJlY2VpdmVkLiBIb3dldmVyLCB0aGUgYmFja2VuZCBkcml2ZXIgZG9lc24ndCBhcHBlYXIg
dG8gcmVjZWl2ZSB0aGUgSTJDX1NMQVZFX1NUT1DigIsgZXZlbnQgd2hlbiB3ZSBhcmUgZmluaXNo
ZWQuIFRoaXMgY2F1c2VzIGEgcHJvYmxlbSBhcyB0aGVuIHRoZXJlIGlzIG5vIGRldGVybWluYWJs
ZSB3YXkgdG8ga25vdyB3aGVuIHRoZSBieXRlcyBoYXZlIGZpbmlzaGVkIHdyaXRpbmcuIEFmdGVy
IHJlYWRpbmcgdGhlIGRvY3VtZW50YXRpb24gZm9yIHRoZSBldmVudCBodHRwczovL3d3dy5rZXJu
ZWwub3JnL2RvYy9odG1sL2xhdGVzdC9pMmMvc2xhdmUtaW50ZXJmYWNlLmh0bWwsIEkgYXNzdW1l
ZCBpdCB3b3VsZCBiZSB0cmlnZ2VyZWQgYWZ0ZXIgdGhlIG1hc3RlciBpcyBmaW5pc2hlZCB3cml0
aW5nIHRvIHVzLiBJIGFsc28gdGhvdWdodCBhcyBwYXJ0IG9mIHRoZSBJMkMgc3BlY2lmaWNhdGlv
biB0aGF0IHRoZSBtYXN0ZXIgd2FzIHJlcXVpcmVkIHRvIHNlbmQgYSBTVE9QIHNpZ25hbCB3aGVu
IGl0IHdhcyBmaW5pc2hlZC4gSXMgaXQgcG9zc2libGUgdGhhdCBpdCBpc24ndCB0cmlnZ2VyaW5n
IGJ1dCBzaG91bGQ/CgpGcm9tIHRoZSBpMmMtaW14IGRyaXZlciBwb2ludCBvZiB2aWV3IHdlLCBk
ZXRlY3Qgc3RvcCBzaWduYWwgb24gdGhpcwpwYXRoOgppMmNfaW14X3NsYXZlX2lzcigpCsKgIGlm
IChzdGF0dXMgJiBJMlNSX0lBQVMpIHsgLyogQWRkcmVzc2VkIGFzIGEgc2xhdmUgKi8KwqDCoMKg
IC4uLgrCoCB9IGVsc2UgaWYgKCEoY3RsICYgSTJDUl9NVFgpKSB7IC8qIFJlY2VpdmUgbW9kZSAq
LwrCoMKgwqAgaWYgKHN0YXR1cyAmIEkyU1JfSUJCKSB7IC8qIE5vIFNUT1Agc2lnbmFsIGRldGVj
dGVkICovCsKgwqDCoMKgIC4uLgrCoMKgwqAgfSBlbHNlIHsgLyogU1RPUCBzaWduYWwgaXMgZGV0
ZWN0ZWQgKi8KCklmIElCQiB3b3VsZCBjaGFuZ2UganVzdCBhZnRlciB3ZSBoYXZlIHJlYWQgaXQg
aW4gdGhlIGludGVycnVwdCBoYW5kbGVyLAp3ZSB3b3VsZCBub3QgYmUgYWJsZSB0byBkZXRlY3Qg
dGhlIFNUT1Agc2lnbmFsLgoKVGhpcyBpcyBvbmx5IG15IGFzc3VtcHRpb24uIFlvdSB3aWxsIG5l
ZWQgdG8gY29tcGFyZSB0cmFuc2ZlciBvbiB0aGUgQlVTCih3aXRoIGxvZ2ljIGFuYWx5emVyKSB3
aXRoIGtlcm5lbCB0cmFjZXMuCgo+IEkgbm90aWNlZCB0aGF0IHRoZXJlIGlzIGEgcGF0Y2gg4oCL
MDVhZTYwYmMyNGY3NjVkMGRiNmI3YzZlNWFjYWJmMjI3MThiODIzZCBmcm9tIERlY2VtYmVyIHRo
YXQgaXMgc3VwcG9zZWQgdG8gIlN5bnRoZXNpemUgZW5kIG9mIHRyYW5zYWN0aW9uIGV2ZW50cyIu
IElzIGl0IG5vdCBwb3NzaWJsZSB0byBmaWd1cmUgb3V0IHdoZW4gdGhlIHRyYW5zbWlzc2lvbiBh
Y3R1YWxseSBlbmRzPwoKSXQgZGVwZW5kcyBvbiBhY3R1YWwgaGFyZHdhcmUgaW1wbGVtZW50YXRp
b24gb2YgdGhlIElCQiBiaXQuIEZvcgpleGFtcGxlLCBhcmUgd2UgYWN0dWFsbHkgYWJsZSB0byBn
ZXQgSVJRIGZvciB0aGlzIGJpdCBvciB3ZSBuZWVkIHRvIHBvbGwKaXQ/IGlteDhtbSBkb2N1bWVu
dGF0aW9uIGlzIG5vdCB2ZXJ5IGNsZWFyIGFib3V0IGl0LgoKUmVnYXJkcywKT2xla3NpagotLQpQ
ZW5ndXRyb25peCBlLksuwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfApTdGV1ZXJ3YWxkZXIgU3RyLiAyMcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgaHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS/CoCB8CjMx
MTM3IEhpbGRlc2hlaW0sIEdlcm1hbnnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wwqDCoMKgIHwKQW10c2dlcmljaHQgSGlsZGVzaGVp
bSwgSFJBIDI2ODbCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IEZheDrCoMKgICs0OS01MTIxLTIwNjkx
Ny01NTU1IHw=
