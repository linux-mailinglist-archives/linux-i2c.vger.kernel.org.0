Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD95252F40
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 15:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729457AbgHZNDG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 09:03:06 -0400
Received: from mail-eopbgr80047.outbound.protection.outlook.com ([40.107.8.47]:21942
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729382AbgHZNDF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Aug 2020 09:03:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwFj4x5wjd9ezcqvUGe5WJhFaEnf9qM+ielNGiB/raIPZ1MEuVpRhrfV5ub+xaLeHFQGJg8PN8IrUtecFNxl3ybx1ix1swATeiXw/uwaaHEcJt5f50pChycKNjGjdo8m6C16a09TzMbdKn7g6HNhd+ZKSYiriPsF/puGfBHC5H5AkBSi88p6ckBCW1mRQvDdgypXtufAkJy3G2FmMHUMMl8Un7RhVfYBPXBu7SEbH2RGYMwGYIR0UXmwrNvuPQsTMv+sS7scD2OhBGBOwprEKj0B6FMbWT0DSpg3o+rQgYK/otOejm3g8r0chhnHpIhtT3ILf5cnGl4aMsCpTEh5pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44Firi5vRSPcv75s6ZG/dKCvHZpkC6kSZYTCBcAEqxI=;
 b=YfH3xCNo7feZfpcprneAbk1YRVpU6Mtd+9/xbtjLElg7gt/TCRQefkjbf+ZFY5Nevh7ZF4BrZoR9MQQcTcru7Lz7lDiaVi8NaYGfd3/C7r3i5aHymJwtr7RoVO12WzIbN7hcueD32E/aUm4QCACaQkaiVGE4ZU36vEMF5brtWZ8pZJxCzWpqyKpF3ASHzZucQIRWc4ncCQLJ+uC0yMtuKhx3iT+loD1OU/Ke+tZmqSsAEeoredOgHBLiZrHtC1/3uTYFeF2zHhu/9mtQquq9Ug/gZX5GFTiBKYg3WkkLiY8Hxe0qnKza9U0vmgm/hkaBKe+QazPT1ADxKAdOyKP6Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44Firi5vRSPcv75s6ZG/dKCvHZpkC6kSZYTCBcAEqxI=;
 b=lpwi8Dd3x49K26/+oXHtR/ev7QPHBqx0YoiagzMSVNjN/LWNYN/Z4IZM6yDLrrrJK6JhF/qJx+3dTjf8uBJQ+1snSYiCmSmU+F+l7DOazz00xtFH6KHYXnADe+YbdTYb5UUbyMQZrLFxo+mBvftWjVmSrHaDernpQIOkESGGFFE=
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com (2603:10a6:208:107::25)
 by AM0PR06MB5858.eurprd06.prod.outlook.com (2603:10a6:208:120::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Wed, 26 Aug
 2020 13:03:01 +0000
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d]) by AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d%7]) with mapi id 15.20.3326.019; Wed, 26 Aug 2020
 13:03:01 +0000
From:   Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
To:     Michal Simek <michal.simek@xilinx.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>
CC:     "shubhrajyoti.datta@gmail.com" <shubhrajyoti.datta@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 2/2] i2c: xiic: Support forcing single-master in DT
Thread-Topic: [PATCH v2 2/2] i2c: xiic: Support forcing single-master in DT
Thread-Index: AQHWdtk2CZfOpUVfP0W7+XiJ8FAN+KlKUekAgAAFmMA=
Date:   Wed, 26 Aug 2020 13:03:01 +0000
Message-ID: <AM0PR06MB518518C10379FA24ABBBF04ED4540@AM0PR06MB5185.eurprd06.prod.outlook.com>
References: <20200820100241.96866-1-ext-jaakko.laine@vaisala.com>
 <20200820100241.96866-3-ext-jaakko.laine@vaisala.com>
 <4d6b11e2-1af4-e7b3-5ede-7de723300a52@xilinx.com>
In-Reply-To: <4d6b11e2-1af4-e7b3-5ede-7de723300a52@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Enabled=True;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SetDate=2020-08-26T13:02:59.4084310Z;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Name=Restricted;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_ActionId=977edf81-846c-4340-966a-2e80b6a1b577;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Extended_MSFT_Method=Automatic;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Enabled=True;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SetDate=2020-08-26T13:02:59.4084310Z;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Name=No Label;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_ActionId=977edf81-846c-4340-966a-2e80b6a1b577;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Parent=d5842b46-9b7a-431a-b662-8cc44ff92a4e;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Extended_MSFT_Method=Automatic
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=vaisala.com;
x-originating-ip: [81.175.223.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c74446f-ef31-4568-581c-08d849c05d07
x-ms-traffictypediagnostic: AM0PR06MB5858:
x-microsoft-antispam-prvs: <AM0PR06MB5858718996C0ACDED7D053E5D4540@AM0PR06MB5858.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rLSRShqRmgcKaTT/ITWADfawoIkUoVB3QA8Neh/2KASAKXwVnIfozsaft1VxhIjrMlr5RtlHQA5RCiNTYImWbBonX0NowR7rzCmQD7JQSM6xDsMuMJAh6t2W9gMwIjutMSvB8yy8x3uEWxKZPUCSy4pGTC2BecFTt7BBHkCC5qmigXrVtgUdiqo4tNQ6sM4IbZKB3DV3QJUiX1tuw5xup1GLg1zesbZLDlwBFF8nJ4vXpOk0AHytLzq46Kfk4poK6V6shrcleqq7axNPX6UJE6TttrqvdMb3U3xVyzJAFjPESluUvwS9VTTgsoMHJDV4pwP+NEdL5T2Kms/vIIxU3w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR06MB5185.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(26005)(54906003)(478600001)(52536014)(316002)(186003)(110136005)(33656002)(83380400001)(8676002)(71200400001)(66476007)(64756008)(76116006)(2906002)(66556008)(7696005)(8936002)(9686003)(55016002)(66446008)(6506007)(86362001)(5660300002)(4326008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: NhkCQnVYww0kc1aFoQu7bKoih2InuGy7Ptv/gzA4a1NOnEJ3uJkyuD9BlafEhiR5rPQR/IQcgEHKR4UwjhbQOPi2/O8H+l53C6106cHWKKfEr5Jqpc4iA2aUNyVIFadPrA6QyTqRTwMf/sfw/N0a2pjgoDJt+LKQ06XxKkEubg6JL8TacQXwZZTBOnI/qQnRJwVRzsEri2p/zRlU20rJ6uTYaQa4rJcTaxuB/Ep5yz6qbGMnvFCBNg9DE5fBIKyWkG06fyi45yiXJz+tN/yYFmYFxF8iuRsIuxoLhgfeIe++0QQV5F2vuH0Uny8WkA3zFL1UIPeb0+FttTT1VLgF3fEbIkIpNswd4qJMl+956ndc3OpWoqKCLzTlI/ZhK5IyoUL/VGg6v5DcAdVDial/d+fibFFm+ZJvjwrTsQxYZLP4YkPc2dfrTTyTrYg0qCruLwB5o5UYObSxwGEXlDUIvyEIq9p4bubbhG8nBbeC7zxa0Wq5BFhEo8rMoySaE/DGWBO0bgU8BRvTVjirQz6G3jlLkmycrfk4+yE+tPQbZFxCsiA9761y6Cs5Kqe6WMkZ7fStjtQWcTlPyakSPoBIt7bgsKa/Ug/n/AYXPQBFUAVv5onbzyx4pROCNsbKzw6YLsenECSD8h2l3xjDgig8qA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR06MB5185.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c74446f-ef31-4568-581c-08d849c05d07
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2020 13:03:01.5356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NBxuzagom/hzROA6JuRP8vR4jwQt0wtZ3GPLuyNd31zePQZkCyKfagmnV9SrUUbTPGU6LqDfmtUq4QXt9LLeg7V79XrSkOuWKzN7JwyKxTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB5858
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXhpaWMuYyBiL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMteGlpYy5jDQo+ID4gaW5kZXggMTAzODA1MzFkNDVjLi41ZDA2ZTZjYzVk
NWMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy14aWljLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXhpaWMuYw0KPiA+IEBAIC01OCw2ICs1OCw3IEBA
IGVudW0geGlpY19lbmRpYW4gew0KPiA+ICAgKiBAcnhfbXNnOiBDdXJyZW50IFJYIG1lc3NhZ2UN
Cj4gPiAgICogQHJ4X3BvczogUG9zaXRpb24gd2l0aGluIGN1cnJlbnQgUlggbWVzc2FnZQ0KPiA+
ICAgKiBAZW5kaWFubmVzczogYmlnL2xpdHRsZS1lbmRpYW4gYnl0ZSBvcmRlcg0KPiA+ICsgKiBA
c2luZ2xlbWFzdGVyOiBJbmRpY2F0ZXMgYnVzIGlzIHNpbmdsZSBtYXN0ZXINCj4gPiAgICogQGNs
azogUG9pbnRlciB0byBBWEk0LWxpdGUgaW5wdXQgY2xvY2sNCj4gPiAgICovDQo+ID4gIHN0cnVj
dCB4aWljX2kyYyB7DQo+ID4gQEAgLTczLDYgKzc0LDcgQEAgc3RydWN0IHhpaWNfaTJjIHsNCj4g
PiAgCXN0cnVjdCBpMmNfbXNnICpyeF9tc2c7DQo+ID4gIAlpbnQgcnhfcG9zOw0KPiA+ICAJZW51
bSB4aWljX2VuZGlhbiBlbmRpYW5uZXNzOw0KPiA+ICsJYm9vbCBzaW5nbGVtYXN0ZXI7DQo+DQo+
IEkgd291bGQgdW5kZXJzdGFuZCBpZiB0aGlzIGlzIHBsYWNlZCBhYm92ZSByeF9tc2cgdG8gZmls
bCB0aGF0IDRieXRlcw0KPiBob2xlIGluIHRoZSBzdHJ1Y3R1cmUuIEJ1dCB0aGlzIGxvY2F0aW9u
IGRvZXNuJ3QgbWFrZSBhbnkgc2Vuc2UuDQoNClRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0IHRoZSBz
dHJ1Y3QgYWxpZ25tZW50IGlzc3VlLiBJIGFncmVlLg0KDQo+IFRoZSBiZXN0IHdvdWxkIGJlIHRv
IG1vdmUgc3RhdGUgdG8gdGhlIGVuZCBhbmQgYWRkIHRoaXMgYm9vbCBiZWhpbmQgaXQuDQo+IFRv
IGhhdmUgbmljZWx5IHBhY2tlZCBzdHJ1Y3R1cmUgbGlrZSB0aGlzDQoNCkkgd2lsbCBtb3ZlIHN0
YXRlIHRvIHRoZSBlbmQgaW4gc2VwYXJhdGUgY29tbWl0IGFuZCBhZGQgc2luZ2xlLW1hc3RlciBh
ZnRlciB0aGF0IGluIFYzDQphcyBzdWdnZXN0ZWQuDQogDQo+ID4gLQllcnIgPSB4aWljX2J1c19i
dXN5KGkyYyk7DQo+ID4gLQl3aGlsZSAoZXJyICYmIHRyaWVzLS0pIHsNCj4gPiAtCQltc2xlZXAo
MSk7DQo+ID4gKwlpZiAoIWkyYy0+c2luZ2xlbWFzdGVyKSB7DQo+ID4gKwkJLyogZm9yIGluc3Rh
bmNlIGlmIHByZXZpb3VzIHRyYW5zZmVyIHdhcyB0ZXJtaW5hdGVkIGR1ZSB0byBUWA0KPiA+ICsJ
CSAqIGVycm9yIGl0IG1pZ2h0IGJlIHRoYXQgdGhlIGJ1cyBpcyBvbiBpdCdzIHdheSB0byBiZWNv
bWUNCj4gPiArCQkgKiBhdmFpbGFibGUgZ2l2ZSBpdCBhdCBtb3N0IDMgbXMgdG8gd2FrZQ0KPiA+
ICsJCSAqLw0KPiA+ICAJCWVyciA9IHhpaWNfYnVzX2J1c3koaTJjKTsNCj4gPiArCQl3aGlsZSAo
ZXJyICYmIHRyaWVzLS0pIHsNCj4gPiArCQkJbXNsZWVwKDEpOw0KPiA+ICsJCQllcnIgPSB4aWlj
X2J1c19idXN5KGkyYyk7DQo+ID4gKwkJfQ0KPiA+ICAJfQ0KPg0KPiBJIHdvdWxkIHByZWZlciB0
byB3cml0ZSB0aGlzIGRpZmZlcmVudGx5Lg0KPglpZiAoaTJjLT5zaW5nbGVtYXN0ZXIpDQo+CQly
ZXR1cm4gMDsNCj4NCj4gRm9sbG93ZWQgYnkgb3JpZ2luIGNvZGUuIFBhdGNoIHdpbGwgYmUgc21h
bGxlciBhbmQgeW91IGRvbid0IG5lZWQgdG8gYWRkDQo+IG9uZSBtb3JlIGxldmVsIG9mIGluZGVu
dGF0aW9uLg0KDQpUaGF0IHNvdW5kcyBiZXR0ZXIgYW5kIGVhc2llciB0aGFuIGN1cnJlbnQgdmVy
c2lvbiwgdGhhbmtzLg0KSSB3aWxsIG1ha2UgdGhlIGNoYW5nZSBpbiBWMy4NCg0KLUphYWtrbw0K
