Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 194FD297B43
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Oct 2020 09:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756110AbgJXHrR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Oct 2020 03:47:17 -0400
Received: from mail-eopbgr60072.outbound.protection.outlook.com ([40.107.6.72]:56197
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755835AbgJXHrR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 24 Oct 2020 03:47:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cp8VCEYFyIma55R3cgtT894M4jedftZrbK3XyCS6Mas+hmTKIV72HQrPdDHzq6VzblQbOr6WoUJBd5xD3qHu+0v9e+0+uz1JFxknQdQlEdPL145vBEn1P0WD1QLdUOYCKMrd5IMt5WjgMbsym4ozCyobcNOtj79ZymQaVMSccu6RUlCjS/IrbhP63C3M41bBL9CRBWVi7Ycs2Q/dfCUoZRSsxN6Qc1VTrcuIFUPbrgV81+OTvP6avBULp6bL/5oV3u0SI34AbDlUppcwCQ80czKcQM9DVpCn8lbE0WrmeuKT0exstOiZLRjwBm75uX/K646JL9SZvs1Rqssc7Nx5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yxm8abs8irudvwI8Qx8fzNRrij4MW8CqJR5Yjxhkvdw=;
 b=Rmg8ZVIy0ss0xVn68vRQUcamVSHVCC28WbvLS3t4h8TOicnEtdq6W92mwWAmQe1VzaK/NHDe1uDGFN2wi/yX09dlcDIlrccBwK2AOLKNMF57u4eewxwYsDy2dyt0aEI9wRYT6EZ9NHcP+WqLWJ1ZNjYl3m1AU9OqwFETpQqgZGn78J47ccGsp/zHj/XCfzcyyjBEyHogz5t98PMd8/HVBAOZsOpOHn7q6p0zuaBpxPLrLCJrgW133x8Mt7glAFosG3drbC5dFDIq1pQPzzrI99XJVPM7aoAEJYhFv199FEGeo821uYTLJLLCtEJFB5/MWcZ6YDtH2mtbCDmzk43C0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yxm8abs8irudvwI8Qx8fzNRrij4MW8CqJR5Yjxhkvdw=;
 b=DpxQSbGy7cDdnku2y8H1RleqQhypgz2P5OctkuA0Z6E21P30RQ0sipuJVH0HFIU4W7lkarbJxpNfSfn81WYacPRi/brScWhlLzSK/ysmJ/337bnPWwGf13OWpBLBLg10JtqqorCCdolT6XaWbseMFU//qi/AuP1gLs0FS8emHbI=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB7178.eurprd04.prod.outlook.com (2603:10a6:10:12e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Sat, 24 Oct
 2020 07:47:13 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef%8]) with mapi id 15.20.3477.028; Sat, 24 Oct 2020
 07:47:13 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: RE: [PATCH 2/2] i2c: imx: remove id_table entry
Thread-Topic: [PATCH 2/2] i2c: imx: remove id_table entry
Thread-Index: AQHWqRXTUwraF8FYdUmzA5S0YIqKi6mlUDQAgAEQSXA=
Date:   Sat, 24 Oct 2020 07:47:13 +0000
Message-ID: <DB6PR0402MB2760D2A54C69E7AAAB366C78881B0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1603441103-17735-1-git-send-email-peng.fan@nxp.com>
 <1603441103-17735-2-git-send-email-peng.fan@nxp.com>
 <20201023152842.GA5227@kozik-lap>
In-Reply-To: <20201023152842.GA5227@kozik-lap>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [114.217.181.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6036f733-10f4-4475-1b65-08d877f105aa
x-ms-traffictypediagnostic: DB8PR04MB7178:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB7178607455D7CBD1EC6408C0881B0@DB8PR04MB7178.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hgWotElTQfsuA9OiULP029xdmikUSJr3BTAwA432saivoYDdGD6b0xN0RFsXxKOLDKCfh2yb5pdXbnskEOZxP9i2jMgcMmyP9fi/4D1uS+kn2snHFpzMbuq1/aYhu/FIg1z3D2UDPPzopn8iUnxOk/VpPp8EBeZUaILSMyMNsN7Yer3/v4Xz8zhuuFh6NNgVX7QypNriEnVu66IymctOZBm+Lk63zJ2HcU9H+hD/IsShqrPKSAR03lUqTo1lWCo9xHvuO/qPP86gnwIdAQ4TnyPVCttlDX1fevLW40rw4twKdc7Q6tP7YIIfkifNYKqiX+TT80KzGUcDwjYvkSGf9A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(83380400001)(4326008)(76116006)(8936002)(478600001)(44832011)(55016002)(186003)(8676002)(52536014)(86362001)(26005)(7696005)(5660300002)(7416002)(6916009)(66556008)(54906003)(66446008)(33656002)(2906002)(66476007)(71200400001)(316002)(66946007)(64756008)(9686003)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: +qRgYF06hxSN2q2HNzjyOgxZO67dqyP5QMkhOf45en+M83MZYHC2VlMEB2aCpNvq+RI+G/uhls+HKGU9FXKwxSiqrTyxuLhLlDtau5NQjB0VEoM5lzyyV6vz6jxWCCoRUjl4/HJ+c3mHgMkKg8AfBJGFDobIF0NiU4arvQA5qULKWQ2ghESKSX6LsTdYA00H74PHJZZxvecF+OtZvtS65yNdLOkRWhk921dfdq6YdzHIpwNaQEXFSLnCU3VMzOSauS86V8OH3k6oVDPgWWeMlJxNkjU9ZH4KOF3W2q5I+dSRZleuq62UUrw9aT9dZVi+O1O9wjyPu0MNXcOMYRaxCvOgaz0jwjielc8RisI+3oK49SSAJALju3QfMaoy0X1t43Xc46waCikZ5V5kTamOyITTZ2GDyaSjAtCav9JBUrauCLBe/wOaHsHID0KkoejF1/L010rOT9MwasOs9AoCnC1chF0nA1Fnmccc4NIHgLQAA3mLQzApmXxlNEMybcqEBP2hSHORbUk3V9hgntm8oS57K9og60w357EZh6dEZSwFo1Zfwlt7qwfzDe5e/j9V8uxpX4viWIfssyUvPSycYT6NjkfjwX1YgOKe6fLBQnpS3H8K1nMziDbYB/b9tgNl5BLGFgFG/1b8Klp0Sg+OrQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6036f733-10f4-4475-1b65-08d877f105aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2020 07:47:13.7743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZsODnbSXve7uT4fCApwHe5S0krk0i1pCL5l1M/065mn460SOcDtDFam/C95luYdIlNOZokDakKkAW1o9RaKFfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7178
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gaTJjOiBpbXg6IHJlbW92ZSBpZF90YWJsZSBlbnRy
eQ0KPiANCj4gT24gRnJpLCBPY3QgMjMsIDIwMjAgYXQgMDQ6MTg6MjNQTSArMDgwMCwgcGVuZy5m
YW5AbnhwLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4N
Cj4gPg0KPiA+IFRoZSBsZWdhY3kgcGxhdGZvcm0gZGV2aWNlIGNvZGUgaGFzIGJlZW4gcmVtb3Zl
ZCB1bmRlcg0KPiA+IGFyY2gvYXJtL21hY2gtaW14LCBzbyB3ZSBubyBuZWVkIGlkX3RhYmxlIGVu
dHJ5IGhlcmUuDQo+IA0KPiBDYzogR3JlZywgR2VlcnQsIEFuZ2VsbywNCj4gDQo+IEFyZW4ndCB5
b3UgYnJlYWtpbmcgQ29sZGZpcmUgcGxhdGZvcm1zPw0KDQpPaywgSSBzZWUgY29sZGZpcmUgc3Rp
bGwgdXNlIHVzZSBpbXgxLWkyYy4gQ291bGQgd2UgcmVtb3ZlIGlteDIxLWkyYyBvciBzdGlsbA0K
a2VlcCBpdD8NCg0KVGhhbmtzDQpQZW5nLg0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlz
enRvZg0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAu
Y29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jIHwgMTQgLS0t
LS0tLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGRlbGV0aW9ucygtKQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMNCj4gPiBiL2RyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMgaW5kZXggYmE5ZDYzOTIyM2VjLi43ZWEzNmE3OGFiYjAN
Cj4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYw0KPiA+ICsr
KyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMNCj4gPiBAQCAtMjMzLDE5ICsyMzMsNiBA
QCBzdGF0aWMgc3RydWN0IGlteF9pMmNfaHdkYXRhIHZmNjEwX2kyY19od2RhdGEgPQ0KPiB7DQo+
ID4NCj4gPiAgfTsNCj4gPg0KPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZV9pZCBpbXhfaTJjX2RldnR5cGVbXSA9IHsNCj4gPiAtCXsNCj4gPiAtCQkubmFtZSA9ICJpbXgx
LWkyYyIsDQo+ID4gLQkJLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSZpbXgxX2kyY19o
d2RhdGEsDQo+ID4gLQl9LCB7DQo=
