Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B10218B21
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jul 2020 17:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730048AbgGHPXT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jul 2020 11:23:19 -0400
Received: from mail-eopbgr680051.outbound.protection.outlook.com ([40.107.68.51]:57762
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729206AbgGHPXT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Jul 2020 11:23:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d84eYNkdynRZLBY6pYCs1xzlkMukGCtWkcMkKYWV6PISNazqURQY5KbsujoFAHXjD4ROKZRCwxD32H6vaR25bWUDBqNuUms6TcYHilO26nAy6fuywnLz1tPblaFDrcgNqezyPkgXF4MqdZsI1YvYzMZM66O+7tPiAnFeetrHCASxBsD3SxTJAB6+zHD/GoOWWVYYV7nEaP4BIWyQJ9+hD+oEO2qCX+oFuuGkWf/763Vd+175cDQwR6X9rYfWySYXEdCrAWNJrOMWUeC1ieJp6hAPTySfaBqnSAwmq8yPITaFg+XGqpG9igIX8mAxAAwUmFcTQBbygDO85NrxOoizDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiauwYSix27/2VviLrBXHgpZ86VexDsao/i5hb+HJNg=;
 b=K1pua84RXtKzqMJJcIicThPYmt/lG2uqYpy08QzHfGogySpSGaKSOxw95HGrlzxXCbh6PY233/hk4C2gmRaI75aoQz/H1B/FVemDzQjv8OHJQYpzFRLZjEyVhcUP3/7VP+m/ow8H4DGMdcQtvmMCgnI+QnZ8EvuUWvNQmCApm1u+zk6Gi7i7p6xNWcCjiZqFMeWsM8O/rSWOEo0DJtnTgBam36HIHzu9U04Hzulwe35/FBXCd8P+TUiXeO2I69a626H4I9zsn2FDo2D0mHmTU2M4zseGVHInp/HBv/PHcqW1SvHra6jwEkw0SYY3H8z+VFRgbYpf40bgIPLLw1wPUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiauwYSix27/2VviLrBXHgpZ86VexDsao/i5hb+HJNg=;
 b=RHcL+yjhNwxJpKy+lvfQElYuAXBurLcfJUAnvKjRW9C+Tc2HRYPBI/+Of+FgnInulpgcKTz+8CAOit9wagyTDsZXXz3ivlz34UYOeztqYU/9zr3CyvaD1irFf5BOalYTqrRlTvuFGz7HGgQDFw8nwhMRKm9I6MFRWeMsmnWgQ5M=
Received: from SN4PR0201MB3486.namprd02.prod.outlook.com
 (2603:10b6:803:51::12) by SN1PR02MB3838.namprd02.prod.outlook.com
 (2603:10b6:802:2d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Wed, 8 Jul
 2020 15:23:15 +0000
Received: from SN4PR0201MB3486.namprd02.prod.outlook.com
 ([fe80::c1d:375a:a8ad:f142]) by SN4PR0201MB3486.namprd02.prod.outlook.com
 ([fe80::c1d:375a:a8ad:f142%6]) with mapi id 15.20.3174.021; Wed, 8 Jul 2020
 15:23:15 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Raviteja Narayanam <rna@xilinx.com>, Marek Vasut <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH 3/5] i2c: xiic: Defer xiic_wakeup() and
 __xiic_start_xfer() in xiic_process()
Thread-Topic: [PATCH 3/5] i2c: xiic: Defer xiic_wakeup() and
 __xiic_start_xfer() in xiic_process()
Thread-Index: AQHWQZR3+2cGBvx9+0GDF7OdSX0DVKjqibDggBNmC1A=
Date:   Wed, 8 Jul 2020 15:23:15 +0000
Message-ID: <SN4PR0201MB3486C878260CEA872D4FCD10CA670@SN4PR0201MB3486.namprd02.prod.outlook.com>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-3-marex@denx.de>
 <MWHPR0201MB348411EE961DD3179E2C9F06CA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
In-Reply-To: <MWHPR0201MB348411EE961DD3179E2C9F06CA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: adb99692-4b1a-4c1a-2b28-08d82352d5ec
x-ms-traffictypediagnostic: SN1PR02MB3838:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR02MB3838546AB38CFFE1171EB6D6CA670@SN1PR02MB3838.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:494;
x-forefront-prvs: 04583CED1A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rw0/eIxheuCYoh6moS1cTZt/7gmd3iiB085ALCV3uyzHQShZPvFqsVQQh4AchqtUMXv/6cyIWFpQ5Wjp1dABskntcReMbJp3shY/BRJ9R7MZnTh7xqgefHsHQAF8PGSFsRr+VpK1Rj8l2e7fK3G+Qbnd7Qm2NeWaBukg8XFbrcvixTXJwi8D8UVZp75YOnhOKl+ppwzZMuveqj1rEgeKfvdh50OEAnNtwXBlU2tQ1RuTm8AgkY4pfgQkbk5Ao6u6klnXadYFVqtAuwDv3rOg2DOSqKzoFEMuAImNg4gLVKYZm9eI02AtHKVfQ7t654ttbWtbJatp74g1U/qZ9Q6Wrw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0201MB3486.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(39860400002)(366004)(396003)(136003)(83380400001)(478600001)(86362001)(8676002)(6506007)(2906002)(53546011)(9686003)(54906003)(5660300002)(110136005)(55016002)(8936002)(71200400001)(316002)(52536014)(76116006)(33656002)(4326008)(186003)(66476007)(64756008)(66556008)(66946007)(66446008)(26005)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: GpynFMvrFasV+KQjEBvy07WT/5ax1QrF/1yaM9k6kzOi0UBSNL0rnxQH7nkbNtw/Tmbn1po532eXYI3RcwK6SANM7DfW3tgi7C7c8pXbswgcUrTKVJYZ2aDh1iQdNBdAKKgbR3Hs5TShP1fi0f4pGRPTCNYM4yWHl3FSNFtiEdSe8jmQBjRr+9A7s2sh6mcoOuGIyLkMqWksn40Pr5PPnAi1ehByfWGaDZHk9Gueuu6vzeXK18vWQ9AUDakJDrtwCmB/K7MZuwu48HwYQUZuoJ6ed8/Bb33YLTVInHs0zNi8Xlw296PuVcBsozbCGcl5uC8SbAjeeA3HIdQbytbgcI18HgoK4xrUxDOUFTLj0eXgrYYB/CJR+WUdtkR37OzcGefEVelZ5V+SLQNftE3lCwH0Fmmm1z59G6QRojHVMAzkVIvAsd4WQ1TMKvWd8LAyzOQroR5UuVM/0pE6M2s5SH78SN+vM6y7GTB+kODxoP9DS5R7fAvWqPCP43yYOCIY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB3486.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb99692-4b1a-4c1a-2b28-08d82352d5ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 15:23:15.5020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jeGv3DRFiyaKV1Z3KNAwLYEqIMuuRBhT5MXegiox9SwJBnzOxEysikK8wtU5UgDF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3838
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGVzdGVkLWJ5OiBSYXZpdGVqYSBOYXJheWFuYW0gPHJhdml0ZWphLm5hcmF5YW5hbUB4aWxpbngu
Y29tPg0KDQpUaGFua3MNClJhdml0ZWphIE4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBsaW51eC1pMmMtb3duZXJAdmdlci5rZXJuZWwub3JnIDxsaW51eC1pMmMtb3du
ZXJAdmdlci5rZXJuZWwub3JnPiBPbg0KPiBCZWhhbGYgT2YgUmF2aXRlamEgTmFyYXlhbmFtDQo+
IFNlbnQ6IEZyaWRheSwgSnVuZSAyNiwgMjAyMCA1OjQ0IFBNDQo+IFRvOiBNYXJlayBWYXN1dCA8
bWFyZXhAZGVueC5kZT47IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IE1pY2hhbCBT
aW1layA8bWljaGFsc0B4aWxpbnguY29tPjsgU2h1YmhyYWp5b3RpIERhdHRhDQo+IDxzaHViaHJh
akB4aWxpbnguY29tPjsgV29sZnJhbSBTYW5nIDx3c2FAa2VybmVsLm9yZz4NCj4gU3ViamVjdDog
UkU6IFtQQVRDSCAzLzVdIGkyYzogeGlpYzogRGVmZXIgeGlpY193YWtldXAoKSBhbmQgX194aWlj
X3N0YXJ0X3hmZXIoKSBpbg0KPiB4aWljX3Byb2Nlc3MoKQ0KPiANCj4gDQo+IA0KPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogbGludXgtaTJjLW93bmVyQHZnZXIua2Vy
bmVsLm9yZw0KPiA+IDxsaW51eC1pMmMtb3duZXJAdmdlci5rZXJuZWwub3JnPiBPbiBCZWhhbGYg
T2YgTWFyZWsgVmFzdXQNCj4gPiBTZW50OiBTYXR1cmRheSwgSnVuZSAxMywgMjAyMCA4OjM4IFBN
DQo+ID4gVG86IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4gPiBDYzogTWFyZWsgVmFzdXQg
PG1hcmV4QGRlbnguZGU+OyBNaWNoYWwgU2ltZWsgPG1pY2hhbHNAeGlsaW54LmNvbT47DQo+ID4g
U2h1YmhyYWp5b3RpIERhdHRhIDxzaHViaHJhakB4aWxpbnguY29tPjsgV29sZnJhbSBTYW5nDQo+
ID4gPHdzYUBrZXJuZWwub3JnPg0KPiA+IFN1YmplY3Q6IFtQQVRDSCAzLzVdIGkyYzogeGlpYzog
RGVmZXIgeGlpY193YWtldXAoKSBhbmQNCj4gPiBfX3hpaWNfc3RhcnRfeGZlcigpIGluDQo+ID4g
eGlpY19wcm9jZXNzKCkNCj4gPg0KPiA+IFRoZSBfX3hpaWNfc3RhcnRfeGZlcigpIG1hbmlwdWxh
dGVzIHRoZSBpbnRlcnJ1cHQgZmxhZ3MsIHhpaWNfd2FrZXVwKCkNCj4gPiBtYXkgcmVzdWx0IGlu
IHJldHVybiBmcm9tIHhpaWNfeGZlcigpIGVhcmx5LiBEZWZlciBib3RoIHRvIHRoZSBlbmQgb2YN
Cj4gPiB0aGUNCj4gPiB4aWljX3Byb2Nlc3MoKSBpbnRlcnJ1cHQgdGhyZWFkLCBzbyB0aGF0IHRo
ZXkgYXJlIGV4ZWN1dGVkIGFmdGVyIGFsbA0KPiA+IHRoZSBvdGhlciBpbnRlcnJ1cHQgYml0cyBo
YW5kbGluZyBjb21wbGV0ZWQgYW5kIG9uY2UgaXQgY29tcGxldGVseQ0KPiA+IHNhZmUgdG8gcGVy
Zm9ybSBjaGFuZ2VzIHRvIHRoZSBpbnRlcnJ1cHQgYml0cyBpbiB0aGUgaGFyZHdhcmUuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4NCj4gPiBDYzog
TWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAeGlsaW54LmNvbT4NCj4gPiBDYzogU2h1YmhyYWp5
b3RpIERhdHRhIDxzaHViaHJhanlvdGkuZGF0dGFAeGlsaW54LmNvbT4NCj4gPiBDYzogV29sZnJh
bSBTYW5nIDx3c2FAa2VybmVsLm9yZz4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy14aWljLmMgfCAzNw0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXhpaWMuYw0KPiA+
IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy14aWljLmMgaW5kZXgNCj4gPiA2ZGI3MWMwZmI2NTgz
Li44N2VjYTlkNDZhZmQ5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
eGlpYy5jDQo+ID4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy14aWljLmMNCj4gPiBAQCAt
MzczLDYgKzM3Myw5IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCB4aWljX3Byb2Nlc3MoaW50IGlycSwg
dm9pZCAqZGV2X2lkKQ0KPiA+ICAJc3RydWN0IHhpaWNfaTJjICppMmMgPSBkZXZfaWQ7DQo+ID4g
IAl1MzIgcGVuZCwgaXNyLCBpZXI7DQo+ID4gIAl1MzIgY2xyID0gMDsNCj4gPiArCWludCB4ZmVy
X21vcmUgPSAwOw0KPiA+ICsJaW50IHdha2V1cF9yZXEgPSAwOw0KPiA+ICsJaW50IHdha2V1cF9j
b2RlID0gMDsNCj4gPg0KPiA+ICAJLyogR2V0IHRoZSBpbnRlcnJ1cHQgU3RhdHVzIGZyb20gdGhl
IElQSUYuIFRoZXJlIGlzIG5vIGNsZWFyaW5nIG9mDQo+ID4gIAkgKiBpbnRlcnJ1cHRzIGluIHRo
ZSBJUElGLiBJbnRlcnJ1cHRzIG11c3QgYmUgY2xlYXJlZCBhdCB0aGUgc291cmNlLg0KPiA+IEBA
IC00MDksMTAgKzQxMiwxNCBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgeGlpY19wcm9jZXNzKGludCBp
cnEsIHZvaWQNCj4gKmRldl9pZCkNCj4gPiAgCQkgKi8NCj4gPiAgCQl4aWljX3JlaW5pdChpMmMp
Ow0KPiA+DQo+ID4gLQkJaWYgKGkyYy0+cnhfbXNnKQ0KPiA+IC0JCQl4aWljX3dha2V1cChpMmMs
IFNUQVRFX0VSUk9SKTsNCj4gPiAtCQlpZiAoaTJjLT50eF9tc2cpDQo+ID4gLQkJCXhpaWNfd2Fr
ZXVwKGkyYywgU1RBVEVfRVJST1IpOw0KPiA+ICsJCWlmIChpMmMtPnJ4X21zZykgew0KPiA+ICsJ
CQl3YWtldXBfcmVxID0gMTsNCj4gPiArCQkJd2FrZXVwX2NvZGUgPSBTVEFURV9FUlJPUjsNCj4g
PiArCQl9DQo+ID4gKwkJaWYgKGkyYy0+dHhfbXNnKSB7DQo+ID4gKwkJCXdha2V1cF9yZXEgPSAx
Ow0KPiA+ICsJCQl3YWtldXBfY29kZSA9IFNUQVRFX0VSUk9SOw0KPiA+ICsJCX0NCj4gPiAgCX0N
Cj4gPiAgCWlmIChwZW5kICYgWElJQ19JTlRSX1JYX0ZVTExfTUFTSykgew0KPiA+ICAJCS8qIFJl
Y2VpdmUgcmVnaXN0ZXIvRklGTyBpcyBmdWxsICovIEBAIC00NDYsOCArNDUzLDcgQEAgc3RhdGlj
DQo+ID4gaXJxcmV0dXJuX3QgeGlpY19wcm9jZXNzKGludCBpcnEsIHZvaWQgKmRldl9pZCkNCj4g
PiAgCQkJCWkyYy0+dHhfbXNnKys7DQo+ID4gIAkJCQlkZXZfZGJnKGkyYy0+YWRhcC5kZXYucGFy
ZW50LA0KPiA+ICAJCQkJCSIlcyB3aWxsIHN0YXJ0IG5leHQuLi5cbiIsIF9fZnVuY19fKTsNCj4g
PiAtDQo+ID4gLQkJCQlfX3hpaWNfc3RhcnRfeGZlcihpMmMpOw0KPiA+ICsJCQkJeGZlcl9tb3Jl
ID0gMTsNCj4gPiAgCQkJfQ0KPiA+ICAJCX0NCj4gPiAgCX0NCj4gPiBAQCAtNDYxLDExICs0Njcs
MTMgQEAgc3RhdGljIGlycXJldHVybl90IHhpaWNfcHJvY2VzcyhpbnQgaXJxLCB2b2lkDQo+ICpk
ZXZfaWQpDQo+ID4gIAkJaWYgKCFpMmMtPnR4X21zZykNCj4gPiAgCQkJZ290byBvdXQ7DQo+ID4N
Cj4gPiAtCQlpZiAoKGkyYy0+bm1zZ3MgPT0gMSkgJiYgIWkyYy0+cnhfbXNnICYmDQo+ID4gLQkJ
CXhpaWNfdHhfc3BhY2UoaTJjKSA9PSAwKQ0KPiA+IC0JCQl4aWljX3dha2V1cChpMmMsIFNUQVRF
X0RPTkUpOw0KPiA+ICsJCXdha2V1cF9yZXEgPSAxOw0KPiA+ICsNCj4gPiArCQlpZiAoaTJjLT5u
bXNncyA9PSAxICYmICFpMmMtPnJ4X21zZyAmJg0KPiA+ICsJCSAgICB4aWljX3R4X3NwYWNlKGky
YykgPT0gMCkNCj4gPiArCQkJd2FrZXVwX2NvZGUgPSBTVEFURV9ET05FOw0KPiA+ICAJCWVsc2UN
Cj4gPiAtCQkJeGlpY193YWtldXAoaTJjLCBTVEFURV9FUlJPUik7DQo+ID4gKwkJCXdha2V1cF9j
b2RlID0gU1RBVEVfRVJST1I7DQo+ID4gIAl9DQo+ID4gIAlpZiAocGVuZCAmIChYSUlDX0lOVFJf
VFhfRU1QVFlfTUFTSyB8IFhJSUNfSU5UUl9UWF9IQUxGX01BU0spKQ0KPiB7DQo+ID4gIAkJLyog
VHJhbnNtaXQgcmVnaXN0ZXIvRklGTyBpcyBlbXB0eSBvciDCvSBlbXB0eSAqLyBAQCAtNDg5LDcN
Cj4gPiArNDk3LDcgQEAgc3RhdGljIGlycXJldHVybl90IHhpaWNfcHJvY2VzcyhpbnQgaXJxLCB2
b2lkICpkZXZfaWQpDQo+ID4gIAkJCWlmIChpMmMtPm5tc2dzID4gMSkgew0KPiA+ICAJCQkJaTJj
LT5ubXNncy0tOw0KPiA+ICAJCQkJaTJjLT50eF9tc2crKzsNCj4gPiAtCQkJCV9feGlpY19zdGFy
dF94ZmVyKGkyYyk7DQo+ID4gKwkJCQl4ZmVyX21vcmUgPSAxOw0KPiA+ICAJCQl9IGVsc2Ugew0K
PiA+ICAJCQkJeGlpY19pcnFfZGlzKGkyYywgWElJQ19JTlRSX1RYX0hBTEZfTUFTSyk7DQo+ID4N
Cj4gPiBAQCAtNTA3LDYgKzUxNSwxMyBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgeGlpY19wcm9jZXNz
KGludCBpcnEsIHZvaWQgKmRldl9pZCkNCj4gPiAgCWRldl9kYmcoaTJjLT5hZGFwLmRldi5wYXJl
bnQsICIlcyBjbHI6IDB4JXhcbiIsIF9fZnVuY19fLCBjbHIpOw0KPiA+DQo+ID4gIAl4aWljX3Nl
dHJlZzMyKGkyYywgWElJQ19JSVNSX09GRlNFVCwgY2xyKTsNCj4gPiArCWlmICh4ZmVyX21vcmUp
DQo+ID4gKwkJX194aWljX3N0YXJ0X3hmZXIoaTJjKTsNCj4gPiArCWlmICh3YWtldXBfcmVxKQ0K
PiA+ICsJCXhpaWNfd2FrZXVwKGkyYywgd2FrZXVwX2NvZGUpOw0KPiA+ICsNCj4gPiArCVdBUk5f
T04oeGZlcl9tb3JlICYmIHdha2V1cF9yZXEpOw0KPiA+ICsNCj4gPiAgCW11dGV4X3VubG9jaygm
aTJjLT5sb2NrKTsNCj4gPiAgCXJldHVybiBJUlFfSEFORExFRDsNCj4gPiAgfQ0KPiANCj4gVGhp
cyBpcyB0ZXN0ZWQgYW5kIHdvcmtpbmcgZmluZS4NCj4gDQo+IFJhdml0ZWphIE4NCg0K
