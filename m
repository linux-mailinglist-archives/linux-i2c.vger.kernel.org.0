Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3B5920B12B
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jun 2020 14:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbgFZMNf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Jun 2020 08:13:35 -0400
Received: from mail-bn7nam10on2043.outbound.protection.outlook.com ([40.107.92.43]:30684
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727977AbgFZMNe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Jun 2020 08:13:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERYnIBkr20iJFftQyRjEnblMAk9yG2CGsprr881KRUqe9BPJ68IpIsqH/zeEZKx/6ylDO9Wr+lUEwx/7viMyUZGwV6mjgVLFiSvwnbkNhY3lY+tsbvymC764zhSSn665Wao1KzbL4bC4ysRTrrrxtqmIwZdyM52eLzRN8SVU/JNTvqHqrURK3ys3sTH9lrpCQfjPADx2PFuoSoiXkE7IdPXftcKK1B/3hZU0iwnQ4yrCiVdeyVa3FYPH/f/Y4kKQoqf6+QXdKEw2W+eWIQDTqTFr/sufUibKkBg7AIpziWRCUJgbO4kD/kbhFiYwrtMRVQi8X4PiPydN722HQsU9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xn07CQugzATd+U2nCZ7579U6BAv11wqUpPPz9hDf0CY=;
 b=hIlsUr9OeEEVwBYsTXBPZ5z4wajeB98928OqgGWocSggscjy7Ikk1RZIP0LfST/+Eg1BBWAh9/3ydAE8fux1V6qWpbm/TnRG0KIAE6eGOuLu3UAyeOi6WA1HdhJA3LJRB9/IiPADBWGcatdZ4IE4eco2zOOSh+LdrSwVRR3z4/5Amsh2WteZ3/+lbe62Y7GxZw4lDFpEURjoNY+nOh711478NBO42QV5JzeIG8MzT0aaTpzYsByWatjroQUZ4AkVuxg88cntAuV3wXRILjHbitaChCcKe+Uy+kcniicvFg+FLBhPdNU+NQ0adQiSZFeQUZ5jGxiZlQkdIg90nvZJYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xn07CQugzATd+U2nCZ7579U6BAv11wqUpPPz9hDf0CY=;
 b=E6TVrR/KtxC6vPOz4NdjUIfg+emqAqZPScrLJKqiDHN20b7DpQV+QVAg+SP9ukuXqpvUXGJDRMmLpcs3ynTMFEMqhxI5gMyJLqGicWYaTGxH6YMnw+yQ8+rO9Di+XfxRf9CQFsgCrDQEKXxzgkX9ZFmf+HwiyDH/Pvzc2VnkbuI=
Received: from MWHPR0201MB3484.namprd02.prod.outlook.com
 (2603:10b6:301:77::36) by MW2PR02MB3753.namprd02.prod.outlook.com
 (2603:10b6:907:f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Fri, 26 Jun
 2020 12:13:31 +0000
Received: from MWHPR0201MB3484.namprd02.prod.outlook.com
 ([fe80::f487:3551:25a3:f0a1]) by MWHPR0201MB3484.namprd02.prod.outlook.com
 ([fe80::f487:3551:25a3:f0a1%7]) with mapi id 15.20.3131.021; Fri, 26 Jun 2020
 12:13:31 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH 3/5] i2c: xiic: Defer xiic_wakeup() and
 __xiic_start_xfer() in xiic_process()
Thread-Topic: [PATCH 3/5] i2c: xiic: Defer xiic_wakeup() and
 __xiic_start_xfer() in xiic_process()
Thread-Index: AQHWQZR3+2cGBvx9+0GDF7OdSX0DVKjqibDg
Date:   Fri, 26 Jun 2020 12:13:31 +0000
Message-ID: <MWHPR0201MB348411EE961DD3179E2C9F06CA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-3-marex@denx.de>
In-Reply-To: <20200613150751.114595-3-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9986b95c-1c85-4c13-2049-08d819ca57aa
x-ms-traffictypediagnostic: MW2PR02MB3753:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR02MB3753556B8EA982EFD9771FE1CA930@MW2PR02MB3753.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:352;
x-forefront-prvs: 0446F0FCE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9dh8xNMn0MGiToK7uhXJJvK/1d7HE++BYdaXlLavAh6mwTBUOCQcp07f+9ZXVeBikuzv+DY6kfCMUfWI/laeLTkTa+SJ3iNAGdZuO9RypYFYu/BRQjwsi9ON3I5t+BOzU5qF1tE2PKmr+382wx3sVsG1z+sYbOcYkmOvk76UEZ32hg64hrs03xynKVU8/qfpmJmhjeiNlXMENjXF33uO80I3ZuWtHCwDXF7SDjKj0/gBiDBX2KYdH5sOSVEsmvNAXQEhd4w+JVohuaCe/uAqNJ93gGPrj9RnMNhBEPsDbBvkz3M1t257JMomyV4NZ2aN1UwDSFzvjQfnSpfJHyEsXA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR0201MB3484.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(136003)(396003)(39860400002)(110136005)(54906003)(478600001)(6506007)(9686003)(86362001)(7696005)(2906002)(55016002)(53546011)(71200400001)(316002)(186003)(4326008)(26005)(8676002)(76116006)(8936002)(66556008)(83380400001)(33656002)(64756008)(66476007)(5660300002)(66446008)(66946007)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: T1b74tqROE8yR02o0f+b5YygjAKclzoWb8l9+e3IqI/ZHVUuMMqC7cLtFsVRohDzdqTJL1U1c7fzYmkl7ff3v19+gyU6J9kWoYY8ivERMwijXT8qIJWYKXPhOG6HXu5rSeZ0YJPkHRp16Te2eEAHubsGnQZ1mAniN7XjrjDcWDMSvwGonv0ltqLEd1XtXHosgwXGtzIX8+GljEBon+KKPsaw6Qhc5QzYz3Q8QlNVMod9o63fV8xUAIXrCwVgBRbssi/cbhpFWy+qOJuZVD7aRIi1ZWTmtsev/+FZAwxJiyRG6SlBp7dR50UTFYVoQKW0VL3JQNRrrmHQ/pCD3mNeRgaajIDQqDNQ+jGr+8JUZfM3D00dkT5gTlkHwuIyKLtgFedTEv1Y1yfH0TDJUxNAuFq9vN6590i/Drppw20101oYnqBkgwAICxucW1BVylUxYRKof4Hj/cWXubm4m7aKJ43oovYg5J6OuOru3f+kAwS9PXUBmLJ6Z/mjC/I1F+Fa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3484.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9986b95c-1c85-4c13-2049-08d819ca57aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2020 12:13:31.5401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T7AK+s2GOUyRigHinoW1TW1B7yQtXs7BO0qEOsFJYK6M76LD8bSWORsrL7NAIYSZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3753
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogbGludXgtaTJjLW93bmVy
QHZnZXIua2VybmVsLm9yZyA8bGludXgtaTJjLW93bmVyQHZnZXIua2VybmVsLm9yZz4gT24NCj4g
QmVoYWxmIE9mIE1hcmVrIFZhc3V0DQo+IFNlbnQ6IFNhdHVyZGF5LCBKdW5lIDEzLCAyMDIwIDg6
MzggUE0NCj4gVG86IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IE1hcmVrIFZhc3V0
IDxtYXJleEBkZW54LmRlPjsgTWljaGFsIFNpbWVrIDxtaWNoYWxzQHhpbGlueC5jb20+Ow0KPiBT
aHViaHJhanlvdGkgRGF0dGEgPHNodWJocmFqQHhpbGlueC5jb20+OyBXb2xmcmFtIFNhbmcgPHdz
YUBrZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMy81XSBpMmM6IHhpaWM6IERlZmVyIHhp
aWNfd2FrZXVwKCkgYW5kIF9feGlpY19zdGFydF94ZmVyKCkgaW4NCj4geGlpY19wcm9jZXNzKCkN
Cj4gDQo+IFRoZSBfX3hpaWNfc3RhcnRfeGZlcigpIG1hbmlwdWxhdGVzIHRoZSBpbnRlcnJ1cHQg
ZmxhZ3MsIHhpaWNfd2FrZXVwKCkgbWF5DQo+IHJlc3VsdCBpbiByZXR1cm4gZnJvbSB4aWljX3hm
ZXIoKSBlYXJseS4gRGVmZXIgYm90aCB0byB0aGUgZW5kIG9mIHRoZQ0KPiB4aWljX3Byb2Nlc3Mo
KSBpbnRlcnJ1cHQgdGhyZWFkLCBzbyB0aGF0IHRoZXkgYXJlIGV4ZWN1dGVkIGFmdGVyIGFsbCB0
aGUgb3RoZXINCj4gaW50ZXJydXB0IGJpdHMgaGFuZGxpbmcgY29tcGxldGVkIGFuZCBvbmNlIGl0
IGNvbXBsZXRlbHkgc2FmZSB0byBwZXJmb3JtDQo+IGNoYW5nZXMgdG8gdGhlIGludGVycnVwdCBi
aXRzIGluIHRoZSBoYXJkd2FyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxt
YXJleEBkZW54LmRlPg0KPiBDYzogTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAeGlsaW54LmNv
bT4NCj4gQ2M6IFNodWJocmFqeW90aSBEYXR0YSA8c2h1YmhyYWp5b3RpLmRhdHRhQHhpbGlueC5j
b20+DQo+IENjOiBXb2xmcmFtIFNhbmcgPHdzYUBrZXJuZWwub3JnPg0KPiAtLS0NCj4gIGRyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMteGlpYy5jIHwgMzcgKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXhpaWMuYyBi
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMteGlpYy5jIGluZGV4DQo+IDZkYjcxYzBmYjY1ODMuLjg3
ZWNhOWQ0NmFmZDkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMteGlpYy5j
DQo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMteGlpYy5jDQo+IEBAIC0zNzMsNiArMzcz
LDkgQEAgc3RhdGljIGlycXJldHVybl90IHhpaWNfcHJvY2VzcyhpbnQgaXJxLCB2b2lkICpkZXZf
aWQpDQo+ICAJc3RydWN0IHhpaWNfaTJjICppMmMgPSBkZXZfaWQ7DQo+ICAJdTMyIHBlbmQsIGlz
ciwgaWVyOw0KPiAgCXUzMiBjbHIgPSAwOw0KPiArCWludCB4ZmVyX21vcmUgPSAwOw0KPiArCWlu
dCB3YWtldXBfcmVxID0gMDsNCj4gKwlpbnQgd2FrZXVwX2NvZGUgPSAwOw0KPiANCj4gIAkvKiBH
ZXQgdGhlIGludGVycnVwdCBTdGF0dXMgZnJvbSB0aGUgSVBJRi4gVGhlcmUgaXMgbm8gY2xlYXJp
bmcgb2YNCj4gIAkgKiBpbnRlcnJ1cHRzIGluIHRoZSBJUElGLiBJbnRlcnJ1cHRzIG11c3QgYmUg
Y2xlYXJlZCBhdCB0aGUgc291cmNlLg0KPiBAQCAtNDA5LDEwICs0MTIsMTQgQEAgc3RhdGljIGly
cXJldHVybl90IHhpaWNfcHJvY2VzcyhpbnQgaXJxLCB2b2lkICpkZXZfaWQpDQo+ICAJCSAqLw0K
PiAgCQl4aWljX3JlaW5pdChpMmMpOw0KPiANCj4gLQkJaWYgKGkyYy0+cnhfbXNnKQ0KPiAtCQkJ
eGlpY193YWtldXAoaTJjLCBTVEFURV9FUlJPUik7DQo+IC0JCWlmIChpMmMtPnR4X21zZykNCj4g
LQkJCXhpaWNfd2FrZXVwKGkyYywgU1RBVEVfRVJST1IpOw0KPiArCQlpZiAoaTJjLT5yeF9tc2cp
IHsNCj4gKwkJCXdha2V1cF9yZXEgPSAxOw0KPiArCQkJd2FrZXVwX2NvZGUgPSBTVEFURV9FUlJP
UjsNCj4gKwkJfQ0KPiArCQlpZiAoaTJjLT50eF9tc2cpIHsNCj4gKwkJCXdha2V1cF9yZXEgPSAx
Ow0KPiArCQkJd2FrZXVwX2NvZGUgPSBTVEFURV9FUlJPUjsNCj4gKwkJfQ0KPiAgCX0NCj4gIAlp
ZiAocGVuZCAmIFhJSUNfSU5UUl9SWF9GVUxMX01BU0spIHsNCj4gIAkJLyogUmVjZWl2ZSByZWdp
c3Rlci9GSUZPIGlzIGZ1bGwgKi8NCj4gQEAgLTQ0Niw4ICs0NTMsNyBAQCBzdGF0aWMgaXJxcmV0
dXJuX3QgeGlpY19wcm9jZXNzKGludCBpcnEsIHZvaWQgKmRldl9pZCkNCj4gIAkJCQlpMmMtPnR4
X21zZysrOw0KPiAgCQkJCWRldl9kYmcoaTJjLT5hZGFwLmRldi5wYXJlbnQsDQo+ICAJCQkJCSIl
cyB3aWxsIHN0YXJ0IG5leHQuLi5cbiIsIF9fZnVuY19fKTsNCj4gLQ0KPiAtCQkJCV9feGlpY19z
dGFydF94ZmVyKGkyYyk7DQo+ICsJCQkJeGZlcl9tb3JlID0gMTsNCj4gIAkJCX0NCj4gIAkJfQ0K
PiAgCX0NCj4gQEAgLTQ2MSwxMSArNDY3LDEzIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCB4aWljX3By
b2Nlc3MoaW50IGlycSwgdm9pZCAqZGV2X2lkKQ0KPiAgCQlpZiAoIWkyYy0+dHhfbXNnKQ0KPiAg
CQkJZ290byBvdXQ7DQo+IA0KPiAtCQlpZiAoKGkyYy0+bm1zZ3MgPT0gMSkgJiYgIWkyYy0+cnhf
bXNnICYmDQo+IC0JCQl4aWljX3R4X3NwYWNlKGkyYykgPT0gMCkNCj4gLQkJCXhpaWNfd2FrZXVw
KGkyYywgU1RBVEVfRE9ORSk7DQo+ICsJCXdha2V1cF9yZXEgPSAxOw0KPiArDQo+ICsJCWlmIChp
MmMtPm5tc2dzID09IDEgJiYgIWkyYy0+cnhfbXNnICYmDQo+ICsJCSAgICB4aWljX3R4X3NwYWNl
KGkyYykgPT0gMCkNCj4gKwkJCXdha2V1cF9jb2RlID0gU1RBVEVfRE9ORTsNCj4gIAkJZWxzZQ0K
PiAtCQkJeGlpY193YWtldXAoaTJjLCBTVEFURV9FUlJPUik7DQo+ICsJCQl3YWtldXBfY29kZSA9
IFNUQVRFX0VSUk9SOw0KPiAgCX0NCj4gIAlpZiAocGVuZCAmIChYSUlDX0lOVFJfVFhfRU1QVFlf
TUFTSyB8IFhJSUNfSU5UUl9UWF9IQUxGX01BU0spKQ0KPiB7DQo+ICAJCS8qIFRyYW5zbWl0IHJl
Z2lzdGVyL0ZJRk8gaXMgZW1wdHkgb3Igwr0gZW1wdHkgKi8gQEAgLTQ4OSw3DQo+ICs0OTcsNyBA
QCBzdGF0aWMgaXJxcmV0dXJuX3QgeGlpY19wcm9jZXNzKGludCBpcnEsIHZvaWQgKmRldl9pZCkN
Cj4gIAkJCWlmIChpMmMtPm5tc2dzID4gMSkgew0KPiAgCQkJCWkyYy0+bm1zZ3MtLTsNCj4gIAkJ
CQlpMmMtPnR4X21zZysrOw0KPiAtCQkJCV9feGlpY19zdGFydF94ZmVyKGkyYyk7DQo+ICsJCQkJ
eGZlcl9tb3JlID0gMTsNCj4gIAkJCX0gZWxzZSB7DQo+ICAJCQkJeGlpY19pcnFfZGlzKGkyYywg
WElJQ19JTlRSX1RYX0hBTEZfTUFTSyk7DQo+IA0KPiBAQCAtNTA3LDYgKzUxNSwxMyBAQCBzdGF0
aWMgaXJxcmV0dXJuX3QgeGlpY19wcm9jZXNzKGludCBpcnEsIHZvaWQgKmRldl9pZCkNCj4gIAlk
ZXZfZGJnKGkyYy0+YWRhcC5kZXYucGFyZW50LCAiJXMgY2xyOiAweCV4XG4iLCBfX2Z1bmNfXywg
Y2xyKTsNCj4gDQo+ICAJeGlpY19zZXRyZWczMihpMmMsIFhJSUNfSUlTUl9PRkZTRVQsIGNscik7
DQo+ICsJaWYgKHhmZXJfbW9yZSkNCj4gKwkJX194aWljX3N0YXJ0X3hmZXIoaTJjKTsNCj4gKwlp
ZiAod2FrZXVwX3JlcSkNCj4gKwkJeGlpY193YWtldXAoaTJjLCB3YWtldXBfY29kZSk7DQo+ICsN
Cj4gKwlXQVJOX09OKHhmZXJfbW9yZSAmJiB3YWtldXBfcmVxKTsNCj4gKw0KPiAgCW11dGV4X3Vu
bG9jaygmaTJjLT5sb2NrKTsNCj4gIAlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ICB9DQoNClRoaXMg
aXMgdGVzdGVkIGFuZCB3b3JraW5nIGZpbmUuDQoNClJhdml0ZWphIE4NCg0K
