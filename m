Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0307341423
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 05:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbhCSEZ4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 00:25:56 -0400
Received: from mail-eopbgr150082.outbound.protection.outlook.com ([40.107.15.82]:13286
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232090AbhCSEZy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 00:25:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjwUFerFewnRf1DTQzUbVlA5LkmRksgwRLxmAVX5XfNn8f11DpytpyNS31yfUYT/GPh15S8YPLlJx6IfyS24lX6SoSO742TVW16vCNQlR+QAPSv4Yq+/9ocjXcwc8rrqnfs1sBA7bsZ9MVD2rJIVZmTezlUdyDE4VrOm63AKHzugYlt7CyS+4hyFwfqHUw6cjepo/80LlpusNB9Npkn2CdxM6m7FNG42pgt5CgM98j1zdkYFnxHEbbh9tdMAxZmNSMWuXh8hKOcVoJsvY2xXoL2tMSvc/bhP3x4kfiYCi6tczYEtn9/nwIZKr3pp2zdOlypppWnneoOtxvkoBHwNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktTepAU7vxbap7SbPXM1C3OkBEJu6LQPe17SBJmBdRo=;
 b=VtDMW053shIs9mVUxRrApfh+OIJdxcRKr62esRskCoFkGzxpobiv+YmEJAWtdKCGTBugd7ndCeGM/w0TndtquzKZVHZ+uuJrezNs2vw9Mu2EG9Bthua4gkoyIqqL7xIDWk1w6iid+5jaXJs2nga4ukRuKK02cDeCFf0pLj2gNubEvON+I/FKPL8/k65Uw2PpzoQr70oA/lKfT67qktjyiq00IXcDg2LwNMuIMXJ1QwsKdSKuxoiLRK/G7Dn79E/Yko7CJkdFgDwGezCDLOOxB8po+y73Z+Uetgy+hIq59kfaz4R7jsrKhX67pnaN1rQligqaptvJGNKbv+0kK0svzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktTepAU7vxbap7SbPXM1C3OkBEJu6LQPe17SBJmBdRo=;
 b=cEDqmVvsjsp65bjATkVJdRPZbWjDW8LqAdXy7cUxwFZw63RBzAWDYGHbOOg/w0GJvUOL3TyW4cpBrjM0rru1ur/iRMXa0MZTpy/KpX0BvHhKYfIF9ncWtcQKeDJcfWpKdGIkmGH8lnw1OiqVwqJHYN7fZxcRUO029bBJUsqCsE0=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB6519.eurprd04.prod.outlook.com (2603:10a6:20b:fb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 04:25:50 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359%7]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 04:25:44 +0000
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
Subject: RE: [PATCH 01/11] i2c: imx-lpi2c: directly retrun ISR when detect a
 NACK
Thread-Topic: [PATCH 01/11] i2c: imx-lpi2c: directly retrun ISR when detect a
 NACK
Thread-Index: AQHXGvpKg3KDixpkSEiRTXuv/sBkJKqKt+IQ
Date:   Fri, 19 Mar 2021 04:25:44 +0000
Message-ID: <AM6PR04MB49664AED0BD2246B79C7120980689@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-2-xiaoning.wang@nxp.com>
In-Reply-To: <20210317065359.3109394-2-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 102d5ec6-1f99-4a07-f249-08d8ea8f1035
x-ms-traffictypediagnostic: AM6PR04MB6519:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB65198FE2609F0A838079A91F80689@AM6PR04MB6519.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:741;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fyGTEOYTAlcK8eurKq4kjDBM9rHDVEkHaK/XiAUzdq8oC2qt/VJ7Niy04xzTCjwqnuZPMyyBFR//a5GHnbpqOOgHHxoZbMa1tC0EIXkzVbnN6wVmjFaBe0eeIVYEU7LD6ynGvRIaKhR+xX8AcJPKHOiH/M8fKnuXO/i8OiCRz05CO5sSxTmurRerwcWwESXq0f8FP2kKY0lfF7OzhmUWIAXRkcwN08RQzPB9D4mjkMvxGKnyt/QQgau+uItDV1LlbrU4Ary/Tf001PdgAHLUt25xP4e80bJSL5R5be0y1vsx5GR1puRzdxU4Vc9XAVNsDX20kIFpF/RCBW+XtWJoGJg7sgYMrmsIPSWIBTi2HS7Oa71aQtDk5TxVpVqP/GyIa91YFGk82ShvB2i4PDqRi41V+XUplemIhmMMvRXwQ+fh/viF+0pTAUvzZO7+U24KxXYA0lZON5zKtY9CEt3p4Fgf6dGFI/MHi/B3cu0C94JnhVSL+uIZSHiuH41NeGdPI+GPUqzBV96rqkFMr1alF2VOdanXr7aEzibhaOasAU/2MHmNXLQ0ryic0UMKNxQoUIuOI5nIjGZ4FTrYbfrH/H92LHioslHqKzAd7CfMByk3QOSgkR0QLCZ5rGec715namyKbDem7mfTQsJR/KtFgfkz3zjnXBzdlpvXr2IGKQc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(71200400001)(86362001)(2906002)(4326008)(8936002)(9686003)(55016002)(8676002)(478600001)(64756008)(44832011)(66446008)(66556008)(186003)(26005)(54906003)(110136005)(38100700001)(316002)(66946007)(33656002)(76116006)(5660300002)(52536014)(7696005)(6506007)(66476007)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?dWhLT0lnOHdQRkFpZnBSY2xLRzZDcVUrdHU0OGdocGwvSEhrYW10Z3FEVlp4?=
 =?utf-8?B?T0JIUVIwSnRjaTh3TGdWMjJodlZiS3ZiUVRlRUZmTS93Tjd1bCtxZ0V0eTZr?=
 =?utf-8?B?dWdwWCtTNGVUOFNkcDlEVGpuQi9RblY5TndDV09VMEZSUW9Pa1lUWEZTcHZY?=
 =?utf-8?B?YmkxTEpFaGM0SGcwYzRYV3hsdnBiM2J5ZHhGMGV4QUdOZ25UcDNJUkdWTHZu?=
 =?utf-8?B?QTBvSkdNSEhYSGNmTGxtSWhYYU9vbkI4RWxUQ01wNzQ3UWpWQzJ6TzVkVUkv?=
 =?utf-8?B?ZEw0K2lxc09uWUZnek80UnQ0eDBQSGx0Wml1cXlZRFNZVVJWazRkc0xiNk1W?=
 =?utf-8?B?VGlIMXFQY2k5K2dNM0FNcHZUWWNLYlpiQldJekRTL2pZUjgxN3RoeW9hRmVi?=
 =?utf-8?B?YWpDbVI0UjBLL3hsR1RrdGhVS0R6MjNNOVY0aFBYMWdlRFJhQlpyZGJXTDN2?=
 =?utf-8?B?TFh6Z21Zc0R3Y2xTVFVYank2L2p6QjNLVkJIbVUwUmVKSHZLWnRtN2ZuQzl1?=
 =?utf-8?B?QW9oUjdLYkZydHk4WUVlUktqNkhEeUI3b0ptU2hNTEZUOXV0QXVYaythYU5X?=
 =?utf-8?B?QWVSS242cUxhcmY5WWxQcXcyVEJjWWVNM3VQdmdlL3RVZHBGTlJPQ05UekEv?=
 =?utf-8?B?eWNId2JQbURhYWFxMnBFUHh4WGU5aVVkVWk3bmtnMWY2dkFFdEJmVzNmck1V?=
 =?utf-8?B?dGdSamlWS2JwU2k5bHFSRk5zckdqZzdYNWhXaEVmSy9XNVc3WWo3ZUJBMVZR?=
 =?utf-8?B?cWtGbGZSelg0SDE0U0hPNnFDZCtXYlRDdjVLbHgyYXhzS1pNakxTQUg1N3l1?=
 =?utf-8?B?LzV5K2ZXZ1hSMjFtUXBxZHRsVFYyNFYvN1h5TVBNYmh4aHB4SUhVOUJDWHp3?=
 =?utf-8?B?VmFvNXBOakFIK1hTSjd1SE53ZEN5bmhTQWZFWjM2NXNGMHhZUWUxdndYcVo0?=
 =?utf-8?B?VGdRK2ZHNWdnMkJmU3U1YmMrU3NUc1pLRFdtaE5HNkRrUVFHVVZnR0V5bTR0?=
 =?utf-8?B?Z2hjeVhjQlhTVmFjMWpRb1JVNy9IR1piMXYzMzJJay9iK2FCOEV1VXR0Q05t?=
 =?utf-8?B?eTVkclk5azdxQ0tBOEZJMERPUngrUnNOTDQxTmx1Snh5bUMyV21DazFtYlBP?=
 =?utf-8?B?OS95YUhmYVYzZ0taRTJrWkhXUDc1V3czSFJDc01vRUdOajNSR0YxUzhucTZL?=
 =?utf-8?B?aXVScUZnWFVaL0tpVjhGaDRiUkF4eEJOQ3Z3ZFppMGI5OWJsSk5kbk9EOWJt?=
 =?utf-8?B?eWxvc2U5dUlhcVZicGlxY2xuQ3J1bkZFcDlNQ0sxbEkrQ09FSnFsN1E5TzF3?=
 =?utf-8?B?Y3BHSDBSc2FQNFVmVVdYR0dXTzJDUFJlQnRJMytkSUhkQld4VHVXYVRuZmE2?=
 =?utf-8?B?ZEJJaFQxQ0g3MG43aHNvRSsrZjNoSmd2TnBMLzg1N1I3Wm9xMG5XL1pEZ3Ju?=
 =?utf-8?B?WVV6dFBVLzlCUWl1dlJXQldoa1BnM0VFUzc5NHFKRUZJSStFR0tqOE1QekF0?=
 =?utf-8?B?d0Mrakx2WWVMMllHUGV1UTV1aCt2WHhNVUw1MjFjL2pDaGRTU3N6RlVnbjZP?=
 =?utf-8?B?VU5CTmZKaTZkckRRODFEbThCMkNFWlByQ1NLc29TTXQrcHpMeHovU1pSV25a?=
 =?utf-8?B?Z0VYemRtUmFRUVlLMDJzWExXRUJITWhNbjhkMGVnV09yZzdheFFYYW0yanBu?=
 =?utf-8?B?YndBZEZXVS9xNnFjQ3lmaW5BNlgyNG1sVVVRenA3eWg4ZkUxRlhNWTlVbXlj?=
 =?utf-8?Q?cEeeNXR7cuHcpIFc+8Jji+FO//Qmqd+ipbx+wR8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 102d5ec6-1f99-4a07-f249-08d8ea8f1035
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 04:25:44.4162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SPpL839eGV+gSi/a/ARtpzFTojZ7LM1IMScQNM7+zi1VKVLmm3ZZ/4Gf/5HSaYCUhSal8pkRKauwTxX7htRPsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6519
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTWFyY2ggMTcsIDIwMjEgMjo1NCBQTQ0KPiANCj4gQSBOQUNLIGZsYWcgaW4gSVNSIG1l
YW5zIGkyYyBidXMgZXJyb3IuIEluIHN1Y2ggY29kaXRpb24sIHRoZXJlIGlzIG5vIG5lZWQgdG8g
ZG8NCj4gcmVhZC93cml0ZSBvcGVyYXRpb24uIEl0J3MgYmV0dGVyIHRvIHJldHVybiBJU1IgZGly
ZWN0bHkgYW5kIHRoZW4gc3RvcCBpMmMNCj4gdHJhbnNmZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBHYW8gUGFuIDxwYW5keS5nYW9AbnhwLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQ2xhcmsgV2Fu
ZyA8eGlhb25pbmcud2FuZ0BueHAuY29tPg0KDQpSZXZpZXdlZC1ieTogRG9uZyBBaXNoZW5nIDxh
aXNoZW5nLmRvbmdAbnhwLmNvbT4NCg0KUmVnYXJkcw0KQWlzaGVuZw0KDQo+IC0tLQ0KPiAgZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMuYyB8IDEyICsrKysrKystLS0tLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jDQo+IGIvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMuYw0KPiBpbmRleCA5ZGI2Y2NkZWQ1ZTkuLmJiZjQ0YWM5
NTAyMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMuYw0K
PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jDQo+IEBAIC01MDcsMTUg
KzUwNywxNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgbHBpMmNfaW14X2lzcihpbnQgaXJxLCB2b2lk
ICpkZXZfaWQpDQo+ICAJbHBpMmNfaW14X2ludGN0cmwobHBpMmNfaW14LCAwKTsNCj4gIAl0ZW1w
ID0gcmVhZGwobHBpMmNfaW14LT5iYXNlICsgTFBJMkNfTVNSKTsNCj4gDQo+ICsJaWYgKHRlbXAg
JiBNU1JfTkRGKSB7DQo+ICsJCWNvbXBsZXRlKCZscGkyY19pbXgtPmNvbXBsZXRlKTsNCj4gKwkJ
Z290byByZXQ7DQo+ICsJfQ0KPiArDQo+ICAJaWYgKHRlbXAgJiBNU1JfUkRGKQ0KPiAgCQlscGky
Y19pbXhfcmVhZF9yeGZpZm8obHBpMmNfaW14KTsNCj4gLQ0KPiAtCWlmICh0ZW1wICYgTVNSX1RE
RikNCj4gKwllbHNlIGlmICh0ZW1wICYgTVNSX1RERikNCj4gIAkJbHBpMmNfaW14X3dyaXRlX3R4
ZmlmbyhscGkyY19pbXgpOw0KPiANCj4gLQlpZiAodGVtcCAmIE1TUl9OREYpDQo+IC0JCWNvbXBs
ZXRlKCZscGkyY19pbXgtPmNvbXBsZXRlKTsNCj4gLQ0KPiArcmV0Og0KPiAgCXJldHVybiBJUlFf
SEFORExFRDsNCj4gIH0NCj4gDQo+IC0tDQo+IDIuMjUuMQ0KDQo=
