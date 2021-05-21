Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F99538C043
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 09:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234866AbhEUHEL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 03:04:11 -0400
Received: from mail-eopbgr50058.outbound.protection.outlook.com ([40.107.5.58]:63972
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234672AbhEUHEK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 03:04:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuNswyWDdqmXvEij4Owut24GEyDBR5n8wnEyMRz0N3b4M27Qkl+0ha+qymltVRqDZaG2rbE9PEVNFMRVsatkr8HK3jYIMY6uArlOfHN+euNdub+Y9zNyugOv+IafIwkI0OWfVMiJ3vn5TJR1qHCplq4RRicE7UjuTaPIKdB9vVFi62Un92o3sWXRozehYFG21a1blcCFfQleHZ58yZW7AMaDUcWVegxoyRbIbgskMfwOFt1bGeyiudWHwzi0ENZKVZUdp/5MFsBeyYi80UD7CbRYyZv+s4KX6eVyuxLiTOaRL4zctcjeldrVOWnnIJxDvc5AVMH392/JGKDzqIOv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEuTOIL2D8fAyy8VGmB0zkgdjslvPGx+BC8bmgpiDz0=;
 b=ZVioNf6e94/7RHu+36QfZootZpbwXuV4aLpn0DTpE8PjScwM/Q+MTi+uMZqtu1K8cyJ15ce1T1Rh0ZvMshcBpYcka2LGatRwzdsfKoZUm27zYI/QafYUahUioi1ZVekrIO+T6WUHWZlsAmbsjAtVeWCVV3YX96Xx3n1DGx1caogoOoLGaF6fbZxqDtkY8iaqzxzktaWjTn9T8bw7M93oDjIq3r6nBa5o7aYc4tgUBRpKmQHj+lXsWuu/EkouZVoPISINScF6fy+a4yTfPu0f9E5ogaE9Pcfuwajy7+AJJmGmQhC/6goM+luM9HF4Cg3vdjP3qiXhv7mqIIFTB99U1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEuTOIL2D8fAyy8VGmB0zkgdjslvPGx+BC8bmgpiDz0=;
 b=PhZHcwf4luwIG9WDpk8LIBU0O5ywDnB8eQwTQiKSR5LaATd4jtPVaWH93CN/+YSCwKyU1IaItDIrKqWkW8hKt+jS0k7EA7zubUdPQNb8Buso4ykcQYNViCqHvTkymV0pygTQC7cm5ts6uZCfm4mJtEYGmUl62s6FZdDblgn1F4Q=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM5PR04MB3042.eurprd04.prod.outlook.com (2603:10a6:206:5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 21 May
 2021 07:02:44 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 07:02:44 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Clark Wang <xiaoning.wang@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V2 11/18] dt-bindings: i2c: imx-lpi2c: Add bus recovery
 example
Thread-Topic: [PATCH V2 11/18] dt-bindings: i2c: imx-lpi2c: Add bus recovery
 example
Thread-Index: AQHXKtivvv2FHCg45kasxMr9uq60aartw+NQ
Date:   Fri, 21 May 2021 07:02:43 +0000
Message-ID: <AM6PR04MB496638702ACB2A00CB7223DA80299@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
 <20210406113306.2633595-12-xiaoning.wang@nxp.com>
In-Reply-To: <20210406113306.2633595-12-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f53b178e-7239-4e1e-8d79-08d91c266eba
x-ms-traffictypediagnostic: AM5PR04MB3042:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB30421C562976F30C7681101F80299@AM5PR04MB3042.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:854;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R9sApYbMg4uvIplZ4D2GLS66nxKHjhsl24/LmGgeuIfdxpVodTGW/vQ7Qaq2PYoMBXpNgOLl9TpN3KH0w9CMaqqAx6X5JTuIj+Meas8ABWJKZRPgj4nzB5/1b5YN/x3OhCDAvm8FbAALkghNTPYm6q7XAysIHf/pZ/VFde9vxa4bLH19n/ys5l5Ltde+ZYEPAAhhzueJ84kx3FtYu28U/Bqoi01LoCG0UEh+lTnna37UvXYSg7WFO2H4JXjfR8LHb38uqgc/W4a8bIZlEQOUK3L4DQUbchPULVqkqRD45b2+8u9q5wv0rmXRo40aglgtfSLU4NckDUBi0rcA/WS1zVKLp/m9gPo3arS1WaNxym7LvFKVaaAl0TyK5YPeEHP4HpZ83DVzRNf8Nw5xVX5FhiZ2bF00/8xxJZ1GLfzARXllh3TSeqNg8+E1jjxH95SnW4enwaXQ2IuP4FpWft2CwkbNmNAHzdFiHgapzl53JICGV1dTTtdtPtCrmH05jORqnJ/CMgaN8lhbZpPelduofrSLG7IAndtNu6uRVV7SM4I0nnqCYlEd4qpA9PtRkqkRjVCj2gXJUPL2BNqHVwYqRg5pqFQ4jP8ldpKupPc/6f0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(33656002)(122000001)(478600001)(55016002)(316002)(66446008)(54906003)(9686003)(7696005)(8676002)(8936002)(64756008)(186003)(66556008)(38100700002)(66476007)(83380400001)(110136005)(44832011)(4326008)(26005)(71200400001)(2906002)(52536014)(5660300002)(76116006)(66946007)(53546011)(86362001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZXN6SG5CMUdEcGcyR0ZxeXpNM1dZWWV6dFV5VHRRVWQ1eVZYTkh5RVBIVDZN?=
 =?utf-8?B?MEUvOWRQM3hVMHlZNWtPQnpCbk0zVEtzQWhBWjlvamtEZFlTdHlCSkJVT0R0?=
 =?utf-8?B?ckVJQ2JzQjFkckxxR3FwNlhDVEpZZGQ5bm5ucE5zMzBxSWN3NWlpekorNWJn?=
 =?utf-8?B?by9RTkZmTGpZaXBxZWVaMnBPMDlHT3dkdDROcDdma0E0OGpPUHg5S25xby9S?=
 =?utf-8?B?blcxanpLczM2WWI3eHBIMlFYdWpRcjNiS25GNG9JNDJpUVVVZWZ5T3MxN25G?=
 =?utf-8?B?bzd5RFFDL3NqeGdjcCtWUlUxYUxEMDRHbnVDYlFCakdRdmZkMkhnblZDckVi?=
 =?utf-8?B?YkQ4cGpvUmZ4S2VlY1lMbjZENW1scVJVVXc1NW9ONzJrcmJWMDc5UG43VDUr?=
 =?utf-8?B?UGI5ckNIR3pkM1BvV0k1dTcwaGl4d3VNa053Y1BNL1BienJKYWpJYVhGV1JF?=
 =?utf-8?B?WVQxejVtcXRMOUJZZXpwTWhLV3ljR0tZaWkrNVhkc3B1SjdGT0FCSFgwdXNR?=
 =?utf-8?B?cys5QlozU3FYbU1MUG10V3JDbzgvWXJGTFd6WmwxUXpNUUdoS0pqN3dUeS8w?=
 =?utf-8?B?MHZDUkt6aHNaRjYzQ3NacFVXSURnK3ZpZmVrT1lXdUJIOGxOVEIvaDcxZGxn?=
 =?utf-8?B?VW1sSVQ1TWhwK3lYSm5HZTYwT2tTQXVGQWpJd2FYY0FoTStBQ3JyKzh3V1pn?=
 =?utf-8?B?WVJoY1lYTFMwMFlxVVZ1d1V6UEQ5OTNaY3A5SHhaZTFrWU15alV0WDRocnlY?=
 =?utf-8?B?cTNaam1BczRyUUJ0bDMyZytwV1VDNEZBcnltVS9kaUxKbmIxY2JoQWNsMjBs?=
 =?utf-8?B?ZCtMUXYxbFpNeGZ1ZzYvOGVkcWxhT204eXF2QS93NjZPN012c0lzK0pNeENR?=
 =?utf-8?B?WWdEenFWNnA5Q1MvcHhpdG9mbE1URDRMRm8vVTQ5YTZyd0p0UUFhREpaT0dD?=
 =?utf-8?B?NnlabURoOUpWbTFZMDJ5MkFxNE9lZzVpRTRjVjJXazhRTHB2ekMxM3pmNmRK?=
 =?utf-8?B?WFdJS1ZFeVJuQ2IrTFlpTnUyUklmbkRad0xpWnBIck44N3BxL2J2a0wwckgy?=
 =?utf-8?B?RTdpQTZVYjlORm5ZdWFCMDFJM0xTUUJpam9qTEIyYUR3S0hjL1dRbjRsdzFi?=
 =?utf-8?B?TjFGSklFOEhIcjRDa0YwdlF4aVlvUlBNTWxjVXZ0cDl6SzFyVHh6a1ArM0dR?=
 =?utf-8?B?WTJCYkpZRFB3VHVRd2VTWFM5bmdpYnByRGhDMlN6MU93ZFpjR1M5UFViOExB?=
 =?utf-8?B?bWkxbWlsa3lPVGZpWDVlZTI1SURZaFcrU2hIR0YxampqTlhrZ2l0MUNoUG9y?=
 =?utf-8?B?MlJqVHN5RSszR3BEekVMcGwvL09uc3lMY2pTWjh3dm5QZHk2Nldtb1A2QmJo?=
 =?utf-8?B?YXIySktsb1krRmVQdDQrTkR3SWw5SXZNYlUrYkNPZElzQVVQSTdnQ3dzdEIv?=
 =?utf-8?B?dUI2bklHUjFhMkZOMmliS0llaFllcmQ4a015YkU0Q1JaUXYzcG1LdG1aTUM2?=
 =?utf-8?B?Z3pGRml5cVowcDJMa0tuQmkwVFpOcVFHOFRHdGNzbDA5R1hORCtzT0tkMFFG?=
 =?utf-8?B?YUVwaENycDNOeHY5dGhQRElGc3VmZGxvMWloVEdFRUQ1WE4yWnR0djNxUEVm?=
 =?utf-8?B?VWRNTVU4K1dCaU5ZM21SZlZJaG1LQkZqNGFBUnBvcElCaGRmd2YzRWtvcHEw?=
 =?utf-8?B?eVBVbmVGWDVVczRnQzlNeGFjS0xBS3pYOUtNT0tYTUpxcXBQL0dXRGtUVjBV?=
 =?utf-8?Q?u7icomq9dgZeNGxMTyCVaEtOOzmLwtiJtlTAd4G?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53b178e-7239-4e1e-8d79-08d91c266eba
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 07:02:43.9971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y3xxm8J3S/Zj0OKmGEQhdvWy/Z8OHsd9klXnEH1qJfXRftNC4BNW5utzBhpmVhXxN0SL6QzB5EvYvE5+puAW/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3042
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIEFwcmlsIDYsIDIwMjEgNzozMyBQTQ0KPiBTdWJqZWN0OiBbUEFUQ0ggVjIgMTEvMThdIGR0
LWJpbmRpbmdzOiBpMmM6IGlteC1scGkyYzogQWRkIGJ1cyByZWNvdmVyeQ0KPiBleGFtcGxlDQoN
CnMvZXhhbXBsZS9zdXBwb3J0DQoNCmFuZCBwbHMgcGFzcyBtYWtlIGR0X2JpbmRpbmdfY2hlY2sN
Cg0KPiANCj4gQWRkIGkyYyBidXMgcmVjb3ZlcnkgY29uZmlndXJhdGlvbiBleGFtcGxlLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQ2xhcmsgV2FuZyA8eGlhb25pbmcud2FuZ0BueHAuY29tPg0KPiAt
LS0NCj4gVjIgY2hhbmdlczoNCj4gIC0gTmV3IHBhdGNoIGFkZGVkIGluIFYyDQo+IC0tLQ0KPiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1pbXgtbHBpMmMueWFtbCAgICAgfCAxNCAr
KysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1p
bXgtbHBpMmMueWFtbA0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMv
aTJjLWlteC1scGkyYy55YW1sDQo+IGluZGV4IDI5Yjk0NDdmM2I4NC4uMGE0YjI4ODI3ZGNjIDEw
MDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1p
bXgtbHBpMmMueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aTJjL2kyYy1pbXgtbHBpMmMueWFtbA0KPiBAQCAtNDIsNiArNDIsMTUgQEAgcHJvcGVydGllczoN
Cj4gICAgcG93ZXItZG9tYWluczoNCj4gICAgICBtYXhJdGVtczogMQ0KPiANCj4gKyAgcGluY3Ry
bC1uYW1lczoNCj4gKyAgICBtaW5JdGVtczogMQ0KPiArDQo+ICsgIHNjbC1ncGlvczoNCj4gKyAg
ICBtYXhJdGVtczogMQ0KPiArDQo+ICsgIHNkYS1ncGlvczoNCj4gKyAgICBtYXhJdGVtczogMQ0K
PiArDQo+ICByZXF1aXJlZDoNCj4gICAgLSBjb21wYXRpYmxlDQo+ICAgIC0gcmVnDQo+IEBAIC02
MSw0ICs3MCw5IEBAIGV4YW1wbGVzOg0KPiAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZp
bnRjPjsNCj4gICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM3IElSUV9UWVBFX0xFVkVM
X0hJR0g+Ow0KPiAgICAgICAgICBjbG9ja3MgPSA8JmNsa3MgSU1YN1VMUF9DTEtfTFBJMkM3PjsN
Cj4gKyAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwiZ3BpbyI7DQo+ICsgICAgICAg
IHBpbmN0cmwtMCA9IDwmcGluY3RybF9pMmM+Ow0KPiArICAgICAgICBwaW5jdHJsLTEgPSA8JnBp
bmN0cmxfaTJjX3JlY292ZXJ5PjsNCj4gKyAgICAgICAgc2NsLWdwaW9zID0gPCZncGlvNSAxNCAo
R1BJT19BQ1RJVkVfSElHSCB8IEdQSU9fT1BFTl9EUkFJTik+Ow0KPiArICAgICAgICBzZGEtZ3Bp
b3MgPSA8JmdwaW81IDE1IChHUElPX0FDVElWRV9ISUdIIHwNCj4gR1BJT19PUEVOX0RSQUlOKT47
DQo+ICAgICAgfTsNCj4gLS0NCj4gMi4yNS4xDQoNCg==
