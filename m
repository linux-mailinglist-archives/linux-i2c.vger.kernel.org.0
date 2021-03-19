Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A053834145D
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 05:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbhCSEq4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 00:46:56 -0400
Received: from mail-eopbgr80087.outbound.protection.outlook.com ([40.107.8.87]:30112
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233732AbhCSEqc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 00:46:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6tO3PY9m0XHbQOfS6nl8JjRdFboppcRGd+ETFXwwaKxbr2xvmvpsN6avN/bA5i6Qv1qRiWFvdWZWRStn66i0yd8C5S8hClsVdOi5SNIHI5II3sYR/3ivnKF2BHHypjvu+eNkhoIpHCnNxVykSvkaZUrGMB6gxG84CILboHyMh2QBJHQ7RLhTpHZGDi/nUECfeoHe2OAEfUMr6Z+FYHnrtsJ384ScFnZbYgpvsNhWuhi5htrjvrG2wwT1vM65JMypSiEzrUx3rYM09viEsUQ9kFe9c3MJ7gVTZKvvBYoxBDq46Oz96RnGCc3oK3XK3cIe14qFQijv/OoXAtIKGXPEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RghzTnz8EmRKSxErO1/F0L5nCONfcItsc1o7iadwuaw=;
 b=dbUyo8XzoI0nje3pK4BTVb5TkPVNyyI/yx4rXwBeUJ1mKrmzmStDpU0exSiof81F6bbZIuIBiVKgMe4VSqgPpJgZo2Mj0yvBRvgM4Q3mbKUk2TDQLoWweWzsVIm5v21x7B8yskAr9vYxWDEmtT4sAGE9+vPnaRQGoVeOU41s8+DQmSa20KNe6c5AlELUaNCiKsRi5i4dq8Azrs3x9KYAsXs+73Z1s0omtwbF8id9GWUD5YJ4i/WdpSvJlUYUBP6mybM1VS7k3L3Lk+X2WRWecZD/3r2czGp62/2FqRgx0gYZkBpv1SUSLPUhcL1dWXuaF0zH0f9YhXtWnQKbf1ubyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RghzTnz8EmRKSxErO1/F0L5nCONfcItsc1o7iadwuaw=;
 b=V0GRlNifisJoZRKwMwhusf7Lz1wSk+eOTW+G0J1P9Cln/agDcsv41TlgUUkeqXRXSTmfIdJy/8iNZlSt5W0xT7cZy+vzfQMkAqP1Pj9xiY2yZaESMAcRT/nUq9gZYbjPqiMTXb9cYJnfRSgT0bob932avo/jt2Z0l0X1DamaeBQ=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Fri, 19 Mar
 2021 04:46:29 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359%7]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 04:46:29 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Clark Wang <xiaoning.wang@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 03/11] i2c: imx-lpi2c: add ipg clk for lpi2c driver
Thread-Topic: [PATCH 03/11] i2c: imx-lpi2c: add ipg clk for lpi2c driver
Thread-Index: AQHXGvpOZCOIkl+RFkuTNJThQPLCFaqKvfdw
Date:   Fri, 19 Mar 2021 04:46:29 +0000
Message-ID: <AM6PR04MB4966B34788B83306B64E92CF80689@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-4-xiaoning.wang@nxp.com>
In-Reply-To: <20210317065359.3109394-4-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 91c2ed92-e9f2-4c2b-dadd-08d8ea91f670
x-ms-traffictypediagnostic: AM7PR04MB7046:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB704685109E9E6F6AADC99E0880689@AM7PR04MB7046.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 25pBu1gPFZfH9yqADUw4sIPJvBP+ZDqIgUQBxLw65gOBwd6523YCqU+djmyR3y7zIotNhmOTYehIV3RYwBpTKnaD//jFOlwgOr3GknRvxRAIRVqKzq2DoI9FcDRFCLM8MnCd6RP8feoS8cBwHeO7NaYTo+++J1MEcv4PW4AnLCL/21wdb/Q3zuTOQFHQOZl9Vg3rBpTG+1Wl4RKJedbZHWGhzBmQa1G4cMDNRCnyuy6iJTgVIp6iRXjs4GYTFoF2lb+B0t3BCw6wwHXqwXv4EKXOO2g6u05BoMj3KuRh1TAw4apmTotMIjo/Ju1sTjHexqUMJcpIsB22MhvgSmOTTmy1rorqFNzE7s0xM1+DRGFjJY+dljQydxkDNr0jEorswh2z6p5xTu5E9k8ddj1tQnhNY+WHyNuHAGEkuP0gN1ZvrjKorO7uV7R18tbo/+AROYV+mjlxdPHnIHteN6JwZcmJrllGBGJRfEYfW3HSyXbbMgStF9I25b6XpVfowUHGUfK4HFbVZqdPmR6+1SR04f4iHUexoFW2eG6ga2CuOQ9r0daE0V8V74OQjuPxHUYDE6jUKXvvs9DOo90Bu24Xw/Bv2fkKnL2ZPwjqidcbgKEh6AEpWBeXL6WsOE2R43Vf9N0OtiDjSif/6D8Zsoqe6zG0zQROR058FwwNtsNDyvc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(64756008)(66556008)(66946007)(66446008)(2906002)(66476007)(110136005)(86362001)(8936002)(478600001)(44832011)(76116006)(7696005)(5660300002)(4326008)(55016002)(83380400001)(6506007)(26005)(54906003)(71200400001)(186003)(52536014)(9686003)(38100700001)(8676002)(33656002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?VE8zdXpKUk9ldlFCK0YzWTRqeFExUlJOVHFoSU5sTVZEbGFaQWhvZSsrNDhl?=
 =?utf-8?B?WFJXSCtDVHdRaHVydGFkdEZPUlJ3MUppd3dmOGgrRXl5TXpWaEo1WEZmbENo?=
 =?utf-8?B?RDRGUVQvRlRhbktZL0NFLzBYR2NTVnhybDZIZzBGT3plcTdzYnZEZWtieWM4?=
 =?utf-8?B?TUxGV082NFVONHlIK3ltY3d0aVl0Nk5CT1Z4ZlFPNlpjVkI0eTRXNUlUY2dq?=
 =?utf-8?B?NDRkOHhUdkhDK2lTWUx6VVFiRTk1N3l0ZW40R0RrN3h1TWNPeTlYbU9kOXQw?=
 =?utf-8?B?MURlZU9PQk1hNVVPb21mcjdPNFZvd05hQ0tGYktER2IxUjR5Sy9yeXo1Q3Rz?=
 =?utf-8?B?cTNYMlo1V2ZKUWQzWm9TV2tIRWxhZ2JkOU9haG95d05PZWJEYjFmT0pIUWtT?=
 =?utf-8?B?a0l5SGdoUDRBUW5iOXV5U3VZeTc5SGVhQ3p5TjNVZjZ3RFNKekVPMFFMRGRp?=
 =?utf-8?B?R1pXM1NFdG43VkJ3blJsV2ZKNE0zeDhiQ3d1ZzlTYUJHVFppdVh6T2swTERR?=
 =?utf-8?B?U3JVNXAwVFc3a24rc3JRM0Q4cHZxRGxCck5yaEpLYXdLN0dWOXBPeWJwL1lZ?=
 =?utf-8?B?NkczWitmd2Z4QTBqWnZwV1VLWDM5Rlp2djdFanNhUGxBeWN3dTJ2WVVRVlU2?=
 =?utf-8?B?NEtvclY3N29xSHA2WGNXUys5YkFPd2lrdVA5SnMzcHVlL1grTWxqY2hxZVdF?=
 =?utf-8?B?WXc4RWtRNjdvRm9tVUxqZ3gvam85SDZaaDhCclE2SjhOelg4WE9zU05BWENG?=
 =?utf-8?B?MENZMnQwZkhSSWYzekZsUUErN0RQYnp3djAxWmk0ZDdXTVQ2SU1lU2pxWEZM?=
 =?utf-8?B?ZW1rR0grTVlBMEZ3RzVIVHpmUER4QVVEM3VuWVVxY1F1R0x3YnFjL05takxk?=
 =?utf-8?B?OEtFWXlLODkrQ0pSbmQwcE53QXhub0l5OTNEeTBWMlNQaVpBdU4yNE0rRDNh?=
 =?utf-8?B?TmhHRUVsWkFaeDZZSHpNL1YvbGV4UzRNbHJ0d3d5S1ByOWQ2QUhOSjFNZU9O?=
 =?utf-8?B?UzIyN0FKTjNaNmgxM2JjMk94Y3JTS1AyUmdpcENiazdsSkEwVzBZeUtTZWs0?=
 =?utf-8?B?K0lDSmpZME1Tdi9MNjh3dGRmY2NMY3VjVUtNd05WbldPTFBQNWNBV0lFYUpm?=
 =?utf-8?B?MFRQeEIyUGdUbUx3M3pLR1hNZmREUzdHMTVhNnFVdUZvdmRIR0dtamJBc3V2?=
 =?utf-8?B?NWdFblQ0SDVDY3htRk1CcDRHcGd2OXBLdG5xcEZYaUJDWlh2NWJFTzJJcUU2?=
 =?utf-8?B?R3puY3pFQlF5NWN5dHBqb08rd05JY0t4eEp3aDlJWnp1Q2FPRnhscFFoc1Zr?=
 =?utf-8?B?dTdpVzR5eFBGbTc4Q29OcEx3R2lvMVltdlRqckphb0VhdGdHU0FWd3ZsZjNF?=
 =?utf-8?B?K0Nsb0xSYkdPTHcySk4vdFkxUVpoNWpDaXVWNDZWNm9CVmlhVm5IVTc4dS9J?=
 =?utf-8?B?Um5aUXFwWmkrVjJTWU9LQ1l3cGI2cm95R2VhdXdXaS9UU0QzZERzQnFDY1ZN?=
 =?utf-8?B?Y2xGRXlQRDRrMC9kSUwzWWpHbkNWSjdTNlJjT1BTckMycnEzOS9tL0NTOTVX?=
 =?utf-8?B?anNTcHczZFFCZUs5LzRrWjZtYU9WcktrNldEeTBWc29PcmNLOFR3WWlVSmF2?=
 =?utf-8?B?TVdaWnFZL3FFajlCMTltSWk1N0Vwcjk0akRnYlV4dktLLzZzbU9NanJ6d2d4?=
 =?utf-8?B?b1ZvMzhGd09jYTgyWStLYzBZUCtObU9BdjJSZnROZ2xIQ2xvcW5WaFF6UGE5?=
 =?utf-8?Q?AaOcP5ZkQVitsgHRMDrrIf6voBjbUuLaTPy5Z/v?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c2ed92-e9f2-4c2b-dadd-08d8ea91f670
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 04:46:29.7441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aY2vweibGNZGUZv/kn/MEzD3ptetAiPezs64ONUmbJwiidoTpcJMe/rRdKPzWqJrw2xopDULJ8APmXweelg7Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7046
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTWFyY2ggMTcsIDIwMjEgMjo1NCBQTQ0KPiANCj4gVGhlIGxwaTJjIElQIG5lZWRzIHR3
byBjbGtzOiBpcGcgY2xrIGFuZCBwZXIgY2xrLiBUaGUgb2xkIGxwaTJjIGRyaXZlciBtaXNzZWQg
aXBnDQo+IGNsay4gVGhpcyBwYXRjaCBhZGRzIGlwZyBjbGsgZm9yIGxwaTJjIGRyaXZlci4NCj4g
DQoNClBsZWFzIGFsc28gdXBkYXRlIGR0LWJpbmRpbmcgYW5kIHNlbnQgYWxvbmcgd2l0aCB0aGlz
IHBhdGNoc2V0LihiZWZvcmUgdGhpcyBvbmUpDQoNCj4gU2lnbmVkLW9mZi1ieTogR2FvIFBhbiA8
cGFuZHkuZ2FvQG54cC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IENsYXJrIFdhbmcgPHhpYW9uaW5n
LndhbmdAbnhwLmNvbT4NCj4gQWNrZWQtYnk6IEZ1Z2FuZyBEdWFuIDxmdWdhbmcuZHVhbkBueHAu
Y29tPg0KDQpZb3UgY2FuIGRyb3AgdGhlIEFjayB0YWcgaWYgdGhlIHBhdGNoIHdhcyBjaGFuZ2Vk
IA0KDQo+IC0tLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMuYyB8IDI4ICsr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGky
Yy5jDQo+IGluZGV4IDFlOTIwZTdhYzdjMS4uNjY0ZmNjMGRiYTUxIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gQEAgLTk0LDcgKzk0LDggQEAgZW51bSBscGkyY19pbXhf
cGluY2ZnIHsNCj4gDQo+ICBzdHJ1Y3QgbHBpMmNfaW14X3N0cnVjdCB7DQo+ICAJc3RydWN0IGky
Y19hZGFwdGVyCWFkYXB0ZXI7DQo+IC0Jc3RydWN0IGNsawkJKmNsazsNCj4gKwlzdHJ1Y3QgY2xr
CQkqY2xrX3BlcjsNCj4gKwlzdHJ1Y3QgY2xrCQkqY2xrX2lwZzsNCj4gIAl2b2lkIF9faW9tZW0J
CSpiYXNlOw0KPiAgCV9fdTgJCQkqcnhfYnVmOw0KPiAgCV9fdTgJCQkqdHhfYnVmOw0KPiBAQCAt
NTYzLDEwICs1NjQsMTYgQEAgc3RhdGljIGludCBscGkyY19pbXhfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZQ0KPiAqcGRldikNCj4gIAlzdHJsY3B5KGxwaTJjX2lteC0+YWRhcHRlci5uYW1l
LCBwZGV2LT5uYW1lLA0KPiAgCQlzaXplb2YobHBpMmNfaW14LT5hZGFwdGVyLm5hbWUpKTsNCj4g
DQo+IC0JbHBpMmNfaW14LT5jbGsgPSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRldiwgTlVMTCk7DQo+
IC0JaWYgKElTX0VSUihscGkyY19pbXgtPmNsaykpIHsNCj4gKwlscGkyY19pbXgtPmNsa19wZXIg
PSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRldiwgInBlciIpOw0KPiArCWlmIChJU19FUlIobHBpMmNf
aW14LT5jbGtfcGVyKSkgew0KPiAgCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJjYW4ndCBnZXQgSTJD
IHBlcmlwaGVyYWwgY2xvY2tcbiIpOw0KPiAtCQlyZXR1cm4gUFRSX0VSUihscGkyY19pbXgtPmNs
ayk7DQo+ICsJCXJldHVybiBQVFJfRVJSKGxwaTJjX2lteC0+Y2xrX3Blcik7DQo+ICsJfQ0KPiAr
DQo+ICsJbHBpMmNfaW14LT5jbGtfaXBnID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsICJpcGci
KTsNCj4gKwlpZiAoSVNfRVJSKGxwaTJjX2lteC0+Y2xrX2lwZykpIHsNCj4gKwkJZGV2X2Vycigm
cGRldi0+ZGV2LCAiY2FuJ3QgZ2V0IEkyQyBpcGcgY2xvY2tcbiIpOw0KPiArCQlyZXR1cm4gUFRS
X0VSUihscGkyY19pbXgtPmNsa19pcGcpOw0KPiAgCX0NCg0KV2lsbCB0aGlzIGJyZWFrIGV4aXN0
IGR0cz8NCg0KUmVnYXJkcw0KQWlzaGVuZw0KDQo+IA0KPiAgCXJldCA9IG9mX3Byb3BlcnR5X3Jl
YWRfdTMyKHBkZXYtPmRldi5vZl9ub2RlLA0KPiBAQCAtNjMzLDcgKzY0MCw4IEBAIHN0YXRpYyBp
bnQgX19tYXliZV91bnVzZWQNCj4gbHBpMmNfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2Ug
KmRldikgIHsNCj4gIAlzdHJ1Y3QgbHBpMmNfaW14X3N0cnVjdCAqbHBpMmNfaW14ID0gZGV2X2dl
dF9kcnZkYXRhKGRldik7DQo+IA0KPiAtCWNsa19kaXNhYmxlX3VucHJlcGFyZShscGkyY19pbXgt
PmNsayk7DQo+ICsJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGxwaTJjX2lteC0+Y2xrX2lwZyk7DQo+
ICsJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGxwaTJjX2lteC0+Y2xrX3Blcik7DQo+ICAJcGluY3Ry
bF9wbV9zZWxlY3RfaWRsZV9zdGF0ZShkZXYpOw0KPiANCj4gIAlyZXR1cm4gMDsNCj4gQEAgLTY0
NSwxMiArNjUzLDE4IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQNCj4gbHBpMmNfcnVudGlt
ZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgCWludCByZXQ7DQo+IA0KPiAgCXBpbmN0
cmxfcG1fc2VsZWN0X2RlZmF1bHRfc3RhdGUoZGV2KTsNCj4gLQlyZXQgPSBjbGtfcHJlcGFyZV9l
bmFibGUobHBpMmNfaW14LT5jbGspOw0KPiArCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShscGky
Y19pbXgtPmNsa19wZXIpOw0KPiAgCWlmIChyZXQpIHsNCj4gLQkJZGV2X2VycihkZXYsICJjYW4n
dCBlbmFibGUgSTJDIGNsb2NrLCByZXQ9JWRcbiIsIHJldCk7DQo+ICsJCWRldl9lcnIoZGV2LCAi
Y2FuJ3QgZW5hYmxlIEkyQyBwZXIgY2xvY2ssIHJldD0lZFxuIiwgcmV0KTsNCj4gIAkJcmV0dXJu
IHJldDsNCj4gIAl9DQo+IA0KPiArCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShscGkyY19pbXgt
PmNsa19pcGcpOw0KPiArCWlmIChyZXQpIHsNCj4gKwkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGxw
aTJjX2lteC0+Y2xrX3Blcik7DQo+ICsJCWRldl9lcnIoZGV2LCAiY2FuJ3QgZW5hYmxlIEkyQyBp
cGcgY2xvY2ssIHJldD0lZFxuIiwgcmV0KTsNCj4gKwl9DQo+ICsNCj4gIAlyZXR1cm4gcmV0Ow0K
PiAgfQ0KPiANCj4gLS0NCj4gMi4yNS4xDQoNCg==
