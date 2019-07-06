Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8039C6127D
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2019 19:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbfGFR53 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 6 Jul 2019 13:57:29 -0400
Received: from mail-eopbgr60087.outbound.protection.outlook.com ([40.107.6.87]:29470
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726743AbfGFR53 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 6 Jul 2019 13:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=p1hq.onmicrosoft.com;
 s=selector2-p1hq-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UoO5Q4F3OVW3nF8xdti1t5Xsnh/uAjWb0L1+DNYao0=;
 b=UVrmnI658iZl6a1MBOMUTC+6Pikx3uXeqVU8VUy2BxkfiQfbfCxfti19uJra9HSubLqeDnB2Ih3RSjk5rKtuI6CyXfP7AfB20mRITafx3in2v0/PgV0ReiXXcl4nQMy8FBv6EbfzL+SQtikVOKTh4UR5VgKQl84r5/Nt0z1K5Zc=
Received: from HE1PR01MB3001.eurprd01.prod.exchangelabs.com (10.170.254.142)
 by HE1PR01MB3883.eurprd01.prod.exchangelabs.com (20.176.162.140) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.19; Sat, 6 Jul
 2019 17:57:24 +0000
Received: from HE1PR01MB3001.eurprd01.prod.exchangelabs.com
 ([fe80::74c9:e863:a713:f675]) by HE1PR01MB3001.eurprd01.prod.exchangelabs.com
 ([fe80::74c9:e863:a713:f675%5]) with mapi id 15.20.2032.022; Sat, 6 Jul 2019
 17:57:24 +0000
From:   "Claus H. Stovgaard" <cst@phaseone.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     linux-i2c <linux-i2c@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] eeprom: at24: Limit gpio calls to when wp_gpio is defined
Thread-Topic: [PATCH] eeprom: at24: Limit gpio calls to when wp_gpio is
 defined
Thread-Index: AQHVM1eLHo0Hp2JQFESB69cj9dzb2qa920mAgAAGjQA=
Date:   Sat, 6 Jul 2019 17:57:24 +0000
Message-ID: <4359efb29daa2a6922e651bba90908794190de07.camel@phaseone.com>
References: <1562347885-58349-1-git-send-email-cst@phaseone.com>
         <CAMpxmJX3x5kOi63+cs5JFHp2Eu5W+0=zKBURcde7pZ5K_2=3nA@mail.gmail.com>
In-Reply-To: <CAMpxmJX3x5kOi63+cs5JFHp2Eu5W+0=zKBURcde7pZ5K_2=3nA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2.110.44.75]
user-agent: Evolution 3.30.5 
x-clientproxiedby: HE1PR0701CA0079.eurprd07.prod.outlook.com
 (2603:10a6:3:64::23) To HE1PR01MB3001.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:1d::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=cst@phaseone.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc1444ba-a551-4e8f-a4c8-08d7023b665b
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:HE1PR01MB3883;
x-ms-traffictypediagnostic: HE1PR01MB3883:
x-microsoft-antispam-prvs: <HE1PR01MB3883CD6FEBD7433C1348A953DAF40@HE1PR01MB3883.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 00909363D5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(376002)(396003)(39840400004)(366004)(199004)(189003)(66446008)(73956011)(64756008)(66946007)(186003)(6116002)(66556008)(66476007)(256004)(14444005)(8936002)(53936002)(6506007)(71190400001)(66066001)(71200400001)(386003)(58126008)(3846002)(26005)(68736007)(54906003)(316002)(66574012)(6512007)(102836004)(52116002)(55236004)(86362001)(5660300002)(2906002)(6916009)(14454004)(8676002)(6486002)(229853002)(99286004)(4326008)(486006)(11346002)(6246003)(7736002)(446003)(25786009)(2616005)(36756003)(305945005)(81156014)(81166006)(6436002)(45080400002)(476003)(118296001)(478600001)(76176011);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR01MB3883;H:HE1PR01MB3001.eurprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: phaseone.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FHXcd+MY3oaQFLK0mVvGqJ1a0/m6jfcY9SkCG/dxEA/lRvFfbhyNMJqMMduFSh1edKnIONloXUi7G3hDCLW6xoGd5xZcwHD6fJdcG5LpKFpQu7Bw90b2EqBRX4KMbYkf7edzTsX/2Vy0xckh8iOkAXbqEdRLmvOpIieTZHrcE7Q7/wxSPW/mTv3MF0kJdD7HMIeTNCga9oBd5Bt51rPNN3gtyUHoRS4f+SIMCGm31SRRT2CwVWjfg8a4mYeohWGrbBevPnylnXXeFR9QdnsgkWd2c4z/M+2/SUFzFvKtTnlee9cb+rmBZq12xIZ6uoZHl88/pJ3JDGGoy65wATV/zuRJT+8Yco7K5s2D9oKXwthpos72Wq0tWeuCYctG70E+pi+do1UgdORkfdNY2h34Xrs0UnFQwk+1kau+b1tyU6w=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DEB9BA0413DF6488408D7893CA69A5C@eurprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phaseone.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1444ba-a551-4e8f-a4c8-08d7023b665b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2019 17:57:24.3000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cbe5b4c6-877a-4fe4-be65-3be424dd0574
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cst@phaseone.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR01MB3883
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gbMO4ciwgMjAxOS0wNy0wNiBhdCAxOTozMyArMDIwMCwgQmFydG9zeiBHb2xhc3pld3NraSB3
cm90ZToNCj4gSGkgQ2xhdXMsDQo+IA0KPiBncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoKSBkb2Vz
bid0IGNvbXBsYWluIGlmIHRoZSBwYXNzZWQgZGVzY3JpcHRvcg0KPiBpcyBOVUxMIC0gaXQganVz
dCBxdWlldGx5IHJldHVybnMuIENvdWxkIHlvdSBnaXZlIG1lIHNvbWUgbW9yZSBpbmZvDQo+IG9u
DQo+IGhvdyB5b3UgdHJpZ2dlciB0aGlzIHdhcm5pbmc/DQo+IA0KPiBCYXJ0DQoNCkhpIEJhcnQN
Cg0KSWYgeW91IGRvbid0IGhhdmUgZW5hYmxlZCBncGlvbGliLCAoRS5nLiBDT05GSUdfR1BJT0xJ
QiBpcyBub3Qgc2V0KQ0KZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwIGVuZHMgaW4gL2luY2x1ZGUv
bGludXgvZ3Bpby9jb25zdW1lci5oIHdpdGgNCnRoZSBmb2xsb3dpbmcgY29kZQ0KDQotLS0NCnN0
YXRpYyBpbmxpbmUgdm9pZCBncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoc3RydWN0IGdwaW9fZGVz
YyAqZGVzYywgaW50DQp2YWx1ZSkNCnsNCiAgICAgICAgLyogR1BJTyBjYW4gbmV2ZXIgaGF2ZSBi
ZWVuIHJlcXVlc3RlZCAqLw0KICAgICAgICBXQVJOX09OKDEpOw0KfQ0KLS0tDQoNClNvIHdlIGdl
dCB3YXJuaW5ncyBsaWtlIHRoaXMgaW4gdGhlIGxvZw0KDQpbICAxNDguNTA4MzE3XSBXQVJOSU5H
OiBDUFU6IDAgUElEOiAxOTAzIGF0DQppbmNsdWRlL2xpbnV4L2dwaW8vY29uc3VtZXIuaDozOTYg
YXQyNF93cml0ZSsweDE1MC8weDI2MA0KWyAgMTQ4LjUxNzE4N10gTW9kdWxlcyBsaW5rZWQgaW46
DQpbICAxNDguNTIwMjM2XSBDUFU6IDAgUElEOiAxOTAzIENvbW06IERhdGFPYmplY3RzIFRhaW50
ZWQ6DQpHICAgICAgICBXICAgICAgICAgNC4xOS4wLXAxLWlxNC0wNTY2OS1nNmZlODAwOC1kaXJ0
eSAjMg0KWyAgMTQ4LjUzMDM5NF0gSGFyZHdhcmUgbmFtZTogUDEgSVE0IChEVCkNClsgIDE0OC41
MzQxMjldIHBzdGF0ZTogNjAwMDAwMDUgKG5aQ3YgZGFpZiAtUEFOIC1VQU8pDQpbICAxNDguNTM4
OTE0XSBwYyA6IGF0MjRfd3JpdGUrMHgxNTAvMHgyNjANClsgIDE0OC41NDI3NDFdIGxyIDogYXQy
NF93cml0ZSsweDExYy8weDI2MA0KWyAgMTQ4LjU0NjU2NV0gc3AgOiBmZmZmZmY4MDBkNWYzYzQw
DQpbICAxNDguNTQ5ODY0XSB4Mjk6IGZmZmZmZjgwMGQ1ZjNjNDAgeDI4OiAwMDAwMDAwMDAwMDAw
MDAwDQpbICAxNDguNTU1MTY3XSB4Mjc6IDAwMDAwMDAwMDAwMDAwMDEgeDI2OiBmZmZmZmZjOTc1
MDk2MzA0DQpbICAxNDguNTYwNDcwXSB4MjU6IGZmZmZmZjgwMDhkNDY5ODAgeDI0OiBmZmZmZmZj
OTc1MjkzMDIwDQpbICAxNDguNTY1Nzc0XSB4MjM6IDAwMDAwMDAwZmZmZjZjMTUgeDIyOiBmZmZm
ZmZjOTc3NDg0NDk4DQpbICAxNDguNTcxMDc3XSB4MjE6IDAwMDAwMDAwMDAwMDA2ZTIgeDIwOiAw
MDAwMDAwMDAwMDAwMDAwDQpbICAxNDguNTc2MzgxXSB4MTk6IDAwMDAwMDAwMDAwMDA2ZTEgeDE4
OiAwMDAwMDAwMDAwMDAwNDAwDQpbICAxNDguNTgxNjg0XSB4MTc6IDAwMDAwMDAwMDAwMDAwMDAg
eDE2OiBmZmZmZmZjOTc3MDA4MzAwDQpbICAxNDguNTg2OTg4XSB4MTU6IDAwMDAwMDAwMDAwMDA0
MDAgeDE0OiAwMDAwMDAwMDAwMDAwMDg4DQpbICAxNDguNTkyMjkxXSB4MTM6IDAwMDAwMDAwMDAw
MDAwMDAgeDEyOiAwMDAwMDAwMDAwMDAwMDAxDQpbICAxNDguNTk3NTk1XSB4MTE6IDAwMDAwMDAw
MDAwMDAwMDEgeDEwOiAwMDAwMDAwMDAwMDAwN2YwDQpbICAxNDguNjAyODk4XSB4OSA6IGZmZmZm
ZjgwMGQ1ZjM3ZTAgeDggOiBmZmZmZmZjOTc3MDA4YjUwDQpbICAxNDguNjA4MjAyXSB4NyA6IGZm
ZmZmZmM5N2ZmNzY4MDAgeDYgOiAwMDAwMDAwMDFmYmU2NDdhDQpbICAxNDguNjEzNTA1XSB4NSA6
IDAwMDAwMDAwZmZmZjZjMGYgeDQgOiBmZmZmZmZiZjIxMWEwZDhmDQpbICAxNDguNjE4ODA5XSB4
MyA6IGZmZmZmZmJmMjExYTBkOTAgeDIgOiBmZmZmZmY4MDA4NGU1NWM0DQpbICAxNDguNjI0MTEz
XSB4MSA6IDAwMDAwMDAwMDAwMDA1ZGMgeDAgOiAwMDAwMDAwMDAwMDAwMDAxDQpbICAxNDguNjI5
NDE3XSBDYWxsIHRyYWNlOg0KWyAgMTQ4LjYzMTg1Ml0gIGF0MjRfd3JpdGUrMHgxNTAvMHgyNjAN
ClsgIDE0OC42MzUzMzVdICBiaW5fYXR0cl9udm1lbV93cml0ZSsweDZjLzB4YTANClsgIDE0OC42
Mzk1MTBdICBzeXNmc19rZl9iaW5fd3JpdGUrMHg2NC8weDgwDQpbICAxNDguNjQzNTEwXSAga2Vy
bmZzX2ZvcF93cml0ZSsweGNjLzB4MWUwDQpbICAxNDguNjQ3NDI1XSAgX192ZnNfd3JpdGUrMHgz
MC8weDE1OA0KWyAgMTQ4LjY1MDkwNV0gIHZmc193cml0ZSsweGE0LzB4MWE4DQpbICAxNDguNjU0
MjExXSAga3N5c193cml0ZSsweDVjLzB4YzANClsgIDE0OC42NTc1MTldICBfX2FybTY0X3N5c193
cml0ZSsweDE4LzB4MjANClsgIDE0OC42NjE0MzZdICBlbDBfc3ZjX2NvbW1vbisweDg0LzB4ZDgN
ClsgIDE0OC42NjUwODddICBlbDBfc3ZjX2hhbmRsZXIrMHg2OC8weDgwDQpbICAxNDguNjY4ODI4
XSAgZWwwX3N2YysweDgvMHhjDQpbICAxNDguNjcxNjk5XSAtLS1bIGVuZCB0cmFjZSBmM2Y0MTRj
M2I1ZjY2Zjk4IF0tLS0NCg0K
