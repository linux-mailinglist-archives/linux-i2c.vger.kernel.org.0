Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234DA341812
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 10:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhCSJSb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 05:18:31 -0400
Received: from mail-eopbgr130040.outbound.protection.outlook.com ([40.107.13.40]:10840
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229725AbhCSJSO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 05:18:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvR8CELzltZs5FEh5v5AWZQOCgIAaGfD4lUpSFVEL5a6+30LC5Ukr+pHORuDssitdBmFFrWKHCpkA8QQiyMEepZDEb2m/T+S7fNoscM57B/AIq6xWyvjXJsWeb+Mfg8626iTCsPEdc7TEt2BgIFVtYGAuOPGxt6DtCcaDPhty3TnezFnJuFvmo9bU1DfAtyhl7l0DZjlRKQMP54o/cf++9TdBjpPkKbZukYBW5/R1lR55+4lrmfD59wlip73+jBm1xCI2BPStlgNMa5TUPl79HZXZV10c/gH+ZARJiM2Hm+ljGDcrrg7PRkF/Kg6qH/5AxYUqW/hCR5djKZ4J4SZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z879blCS+aS0paC2oCr9vAKJqD5u2HSWFLnawus83gY=;
 b=hRoIhwMOGXoxWPLuzNbLhSP1eR7/e8m/H6FANVSU07n24UKdDpnJJXUxv/BLsVx2avBw97fv+iUtoe5MCIcP6iNQBiXtIO5wM5R7f/266qxAp9V2lv2VmvQXgZaFsZVuJsug/eRVyuMl4auON/B+Fp+gg26JkrXGY+4iOtluwpPvQkGiLFNMh/MtF4eLJMYTU+bTlhMZ4bZ/vbkGdIx6F5fxSHWpkG/nO/TOA6eup1pZoDOecNEBqh/knNsPvPASo7qov2YIzdxU4HEEaz0vDZoS3kko5xDXTfPhL8Ew8Z/+dEX6xW7cR4KlKSKrCa1whPKhlfC3WbW/9efPwjc7cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z879blCS+aS0paC2oCr9vAKJqD5u2HSWFLnawus83gY=;
 b=K/5Uf9JvQnXnp+GwNHUsu/M6sJYdbf0UMAG8wjNA5r0wq3YxBxqIkpGzJClZyFCzThBZ1d4z9BAGNx2bOv2u9uztcMK3l4pRaY43TdCbtxBK+zExhjy/XRy84/kaFcVf0SfpVEZLrKeiPv9yMJl1xxWpXSwHYYmjljJO656fDGc=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB4278.eurprd04.prod.outlook.com (2603:10a6:209:4f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 09:18:10 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359%7]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 09:18:10 +0000
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
Thread-Index: AQHXGvpOZCOIkl+RFkuTNJThQPLCFaqKvfdwgAAc0QCAADCloA==
Date:   Fri, 19 Mar 2021 09:18:10 +0000
Message-ID: <AM6PR04MB4966EF4C11F6A37EF58EBA7080689@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-4-xiaoning.wang@nxp.com>
 <AM6PR04MB4966B34788B83306B64E92CF80689@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <AM6PR04MB5623C88A286E99F55EEC0A48F3689@AM6PR04MB5623.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB5623C88A286E99F55EEC0A48F3689@AM6PR04MB5623.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5ad1b3e3-0087-43e4-3cb5-08d8eab7ea97
x-ms-traffictypediagnostic: AM6PR04MB4278:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB427844F85E13DCE590EF9A2280689@AM6PR04MB4278.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: crQqdnSZ1RK3CSpbeXdXbyaha9v3H07FyQmxTT5n0EceQjttipYNRKc1iVUHzHKqwIlWioo3DBZZg52WB4mF2t5Q9sIEzFe8yLn5npyuq7oqJUnV8Hv6WCG6v8REhz3k8srxH9TO0kSdwZN1W1ZFRUrtBRwZ6b73vX7WvU+0H3672mJnIp5XiEUZXjwg8RSQGijjFOTs5zI/eS6n1MzjnIhXvAOijW2UBiVi9gIKl5mQo0n8QgzJh6m9bxa0r0srqLF397VEykCVDp1n7InOf4SudgjCnk79vJOjdt+QcNzey38kiWvj+alcJMw/tr1rOK0dlwKLneHxLjlKMCgEro7Q/LagnEovScCbAu37Yc3FzFQjhIqtnJpM4EwEvEby7XZU7U+K3fYzh4q6J0KUaVP27G45c9q48oYkt1okhR2xE4Lww3J8eCEVkpyoVro1nMjPzDtNKshNrxkgUXqUFJfTz3TMBb1ajxDCEB+Ut38jvFTSjaK3Hcwqmic1mBwa/1W72AR+N72kN6Ld3Rfy4KdIEfmi3zAZXcGq/tLOqVDUPI/uPgPYWdq3adpMepH2844L/QmhXZJuvR4/1frhcdx5OS2avlb9oyBEY9JWJCgaaDkSvNT8tY+QQPgcTD1J/3G3HAfFJwvV8iqB2drH42jI8s5a+aIiH78z2+Af6Vw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(83380400001)(9686003)(33656002)(52536014)(110136005)(4326008)(64756008)(66446008)(316002)(54906003)(186003)(44832011)(76116006)(6506007)(7696005)(66946007)(71200400001)(86362001)(5660300002)(2906002)(55016002)(8936002)(66556008)(478600001)(26005)(66476007)(8676002)(38100700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UFBYcFRPaHh4SnVGKzRjeDhBY1JHVk5aZ0xWMW80cmdUYnZKQnAvSnJzNXdI?=
 =?utf-8?B?VDl0bUJlVnIra0sxNzJJSkgvcm80VDk4RkJ5MXZZaHlJdFRLdTBMTTZNWHdh?=
 =?utf-8?B?UUxWOG1UV3JnTjhGbHRjZkhUQlpwOEpBRXA2RnBUeHZlQVpreXFJbVRQKzdI?=
 =?utf-8?B?RXhIM1lRZ0hZazJGTzZVYmlwYWs5a21WYXhPVGJOdjM3THdjMEJpZXB1ZTJs?=
 =?utf-8?B?UGNYaEU3THo0WWxGMTFOZWdVaS9UaXJwZWlKQUNUOWpJMFp0WDVoOGNtYXU0?=
 =?utf-8?B?eGxXTm9PYnp3VGJ6MGM2ZFNac2N2bGlDcnhzZXg3RU42Wk5qQ0s0UUZUU0R0?=
 =?utf-8?B?Mk1yLzdTSDQrNFRhdHNjK1BPWnNmZGphdTBQQ29lQmgyLzcrTWNZejQ3bTd3?=
 =?utf-8?B?RFVlVTYrWHNUdWg2OElZeVpNTFYvdllXdlZUR21iQXkwWEgxT2dCeUN3RHlP?=
 =?utf-8?B?ME82dGFpWSszVlhUVldHV3I1R1B6VVZmdUhUbDAwNGJaNy9YUWJSSVQvV3Nt?=
 =?utf-8?B?RVNHS2dCdnlLcjZWUkZRSTl6eDN4SDN0RndJYmxmTUJxT3ppZCtHQy9Hc08r?=
 =?utf-8?B?WFBJdzNrVXk5N3VMSE1SNi8rUkRVSS9qVEpkcHlrNzNHOGxXN3ZEVEUyQUNP?=
 =?utf-8?B?RGViZ2RzdWVON3p6bDF5TUY2bXlxMk0yMnlSVUg5VGkydG9QU3FJSW4xdUg0?=
 =?utf-8?B?L2Y1UE14NmwxQ2dCTFUvbUhJeGtBQ3NhdENtL2tudGJjTVFGOURlcjkxakxD?=
 =?utf-8?B?LzRuZ2t3OWUza3o5Vi9RMzA1M3Zpc1VzaWI0RTZRaUhSVFFObUlxR0U2Q3dm?=
 =?utf-8?B?Y2hFSUgvbmtnbkZrYWl1YmFTWXVkajZvYWR3NGhHaW9UQnp2MzhSaXhhbVQ4?=
 =?utf-8?B?ZURSUGNRd1BaQjlSNFIwTFFhZnNWWlBGaU1XaHd4SjBZWDBzcFJPODFVNzB3?=
 =?utf-8?B?Z1NLZVg5RlEzaksrUjRiQitUeXJ0NWVSeWxYeXFDMFhyOWFpUEwyTU9TVmNi?=
 =?utf-8?B?ZGV0NXB5bzJiSWw2L3dSd0ZzQ00vdG53Y2xZWkNhcTZ5SEErMWJaRE5wdW5F?=
 =?utf-8?B?ejFnb290UGgydUdBNGkyZy9jLzZhUVFlOXFrNmFwZzNmRWNtMVBvTlVWaTJ3?=
 =?utf-8?B?bmFTUThqZDJuWlZJczdUTTYwTllZOUxDU1dnY0NoOFpaRU5oMExyTlNOOUw2?=
 =?utf-8?B?MWVldFRiY2JWLzVFeUZPUEFHRjM1eTFQRHQyUG9BZlp5Tm45SXRKS1pNWkJO?=
 =?utf-8?B?TFFrSm5qcXVFMEsvQTZkelFFYzRtSjVBRmpacW9Lc2U4MXhzdkRLOERYTUI3?=
 =?utf-8?B?aUoxUnlhQUNDQk1hWjFWZzU4L1FwY1BKMlNBMElUL1ZaQXBHYm8rS1NGbE84?=
 =?utf-8?B?QXUxdjRvVUs1UjduYXhyUFhvMlBNYUlibWViOUJkTzAxV09UdGY0aGN0Tzha?=
 =?utf-8?B?QkVvZ05JSk5ldGNzZWRVN2dwdzZtS3liYXk4bDAzY3FDaVJDOGQ2MFR5V2Jh?=
 =?utf-8?B?YmVHMFBWZUM1bzBZMWpSRG11Z2tFRXlkZ243M3Fpc1kveVBBbWZzSTBubmVa?=
 =?utf-8?B?QUJRVWdwdFpWSE01V1VubzQwNVNkUTZyMkZYcnJkakRiWUJ5RWlybkp6QkZq?=
 =?utf-8?B?dVB2bS9nejNlNk9jV0ZHeUpLY0RacFFsZThudjUyaEVwcUlHQzYvM0NScU96?=
 =?utf-8?B?elRsOFMzVHJ1eFdrWEJKMFVXVmtCSFUyejA4OWVoZVlhQ2o1djZ6WTc5bXg1?=
 =?utf-8?Q?z6E7oXQGFnrMlVBzKpGYPYpAMK82Aq4011/5E9Y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad1b3e3-0087-43e4-3cb5-08d8eab7ea97
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 09:18:10.7427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hh1Uk28r+0lOrDoaYovORULbc8M4nHlFWoZqgxrtJdI3zaqnAqpVrS7SwUOeWaez3miLcrAKgfSfqnIMsktWUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4278
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiA+ID4gKw0KPiA+ID4gKwlscGkyY19pbXgtPmNsa19pcGcgPSBkZXZtX2Nsa19nZXQoJnBkZXYt
PmRldiwgImlwZyIpOw0KPiA+ID4gKwlpZiAoSVNfRVJSKGxwaTJjX2lteC0+Y2xrX2lwZykpIHsN
Cj4gPiA+ICsJCWRldl9lcnIoJnBkZXYtPmRldiwgImNhbid0IGdldCBJMkMgaXBnIGNsb2NrXG4i
KTsNCj4gPiA+ICsJCXJldHVybiBQVFJfRVJSKGxwaTJjX2lteC0+Y2xrX2lwZyk7DQo+ID4gPiAg
CX0NCj4gPg0KPiA+IFdpbGwgdGhpcyBicmVhayBleGlzdCBkdHM/DQo+IA0KPiBJdCB3aWxsIG5v
dCBicmVhayB0aGUgYnVpbGQuIEJ1dCB3aWxsIGJyZWFrIHRoZSBscGkyYyBwcm9iZSBmb3IgaW14
N3VscCBhbmQNCj4gaW14OHF4cC9xbS4NCj4gSSB3aWxsIHNlbmQgdHdvIHBhdGNoZXMgdG8gdXBk
YXRlIGR0cyBpbiBWMi4NCj4gDQoNClBsZWFzZSBkb24ndCBicmVhayBleGlzdCBwbGF0Zm9ybXMu
DQoNClJlZ2FyZHMNCkFpc2hlbmcNCg0KPiBCZXN0IFJlZ2FyZHMsDQo+IENsYXJrIFdhbmcNCj4g
DQo+ID4NCj4gPiBSZWdhcmRzDQo+ID4gQWlzaGVuZw0KPiA+DQo+ID4gPg0KPiA+ID4gIAlyZXQg
PSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihwZGV2LT5kZXYub2Zfbm9kZSwNCj4gPiA+IEBAIC02MzMs
NyArNjQwLDggQEAgc3RhdGljIGludCBfX21heWJlX3VudXNlZA0KPiA+ID4gbHBpMmNfcnVudGlt
ZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikgIHsNCj4gPiA+ICAJc3RydWN0IGxwaTJjX2lt
eF9zdHJ1Y3QgKmxwaTJjX2lteCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiA+ID4NCj4gPiA+
IC0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGxwaTJjX2lteC0+Y2xrKTsNCj4gPiA+ICsJY2xrX2Rp
c2FibGVfdW5wcmVwYXJlKGxwaTJjX2lteC0+Y2xrX2lwZyk7DQo+ID4gPiArCWNsa19kaXNhYmxl
X3VucHJlcGFyZShscGkyY19pbXgtPmNsa19wZXIpOw0KPiA+ID4gIAlwaW5jdHJsX3BtX3NlbGVj
dF9pZGxlX3N0YXRlKGRldik7DQo+ID4gPg0KPiA+ID4gIAlyZXR1cm4gMDsNCj4gPiA+IEBAIC02
NDUsMTIgKzY1MywxOCBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkDQo+ID4gPiBscGkyY19y
dW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gPiAgCWludCByZXQ7DQo+ID4g
Pg0KPiA+ID4gIAlwaW5jdHJsX3BtX3NlbGVjdF9kZWZhdWx0X3N0YXRlKGRldik7DQo+ID4gPiAt
CXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShscGkyY19pbXgtPmNsayk7DQo+ID4gPiArCXJldCA9
IGNsa19wcmVwYXJlX2VuYWJsZShscGkyY19pbXgtPmNsa19wZXIpOw0KPiA+ID4gIAlpZiAocmV0
KSB7DQo+ID4gPiAtCQlkZXZfZXJyKGRldiwgImNhbid0IGVuYWJsZSBJMkMgY2xvY2ssIHJldD0l
ZFxuIiwgcmV0KTsNCj4gPiA+ICsJCWRldl9lcnIoZGV2LCAiY2FuJ3QgZW5hYmxlIEkyQyBwZXIg
Y2xvY2ssIHJldD0lZFxuIiwgcmV0KTsNCj4gPiA+ICAJCXJldHVybiByZXQ7DQo+ID4gPiAgCX0N
Cj4gPiA+DQo+ID4gPiArCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShscGkyY19pbXgtPmNsa19p
cGcpOw0KPiA+ID4gKwlpZiAocmV0KSB7DQo+ID4gPiArCQljbGtfZGlzYWJsZV91bnByZXBhcmUo
bHBpMmNfaW14LT5jbGtfcGVyKTsNCj4gPiA+ICsJCWRldl9lcnIoZGV2LCAiY2FuJ3QgZW5hYmxl
IEkyQyBpcGcgY2xvY2ssIHJldD0lZFxuIiwgcmV0KTsNCj4gPiA+ICsJfQ0KPiA+ID4gKw0KPiA+
ID4gIAlyZXR1cm4gcmV0Ow0KPiA+ID4gIH0NCj4gPiA+DQo+ID4gPiAtLQ0KPiA+ID4gMi4yNS4x
DQoNCg==
