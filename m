Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1733419E5
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 11:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhCSK0q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 06:26:46 -0400
Received: from mail-eopbgr60086.outbound.protection.outlook.com ([40.107.6.86]:62695
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229634AbhCSK0j (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 06:26:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggipUAGI9V2mCEzr1on+rhhgfQsnZ0gAfmkgFw9bPWHOL59lBIsNsMKw30PAz2Etioz+QbmoTE4VhpftzP4La+d2S/owhAbw410WbK0DtI8DLezK1Wmud2uxIgIhL9EgwKAwA5SC/oMVPnd4Htrc4AW58WcwZyUjyzsX6vBRzRxbAMhy7L/ZUGWr+R7NDd3REqgcdnp7cwHpYdt71P3yu2wWBE5SWypS/XGeVTG5Od/Ca6D1v+PWJnOrFvvySvOGIJ06yuUQSMNGAgjqowwpnOuabqrfKtGJd0Uxvq6pYRrOwtM8RFj6X5iGsS5iffO4bbJOCaOQTPifWo0z/jUspg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zz+YXrWoMEl0Qk2yjp6tcxA9vXp8fMYhI0lFZtYIZe4=;
 b=QwOPO4uSiY6tpFWBBPRNpCzH5C6464vBqHcT7yANiNU9P8mcft/UfMZypR2s4whyd9XyW4RVdCHwzcRT3Ke/GbIxHzLECKZ0nRiC+dHBhZLfEV+B2AtTvAaFNmxv3ATeq6mpmXFer/pv9F046qvSc+e4MEr1/JSgarM/gjP3XbB/wlhfO9jAYGFpSZSZG+QJ0rn6rP4YOptulInIGesOKiA9fz0NvJoAScCnbCTKV+CS4B31GIB8JkTxIResdbq3okvJvw+iIEPb6nRbAvfXTk21u4IBqwpcBFhLBCN/9xzHFYEUtgGRgVi5b5UPs5x/fwhS7pT2Bg9E6bF7tSgvNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zz+YXrWoMEl0Qk2yjp6tcxA9vXp8fMYhI0lFZtYIZe4=;
 b=ZRsvUjSSuHIW5ln9aQMdshdfw9S5aR9Qr9eELw79X7H+MO/+a1vEA26ph492VMJeJOfQVxzKdqE4B0cDlOhdvHa5GXnNfmFwFhzAAjQFYsA7IXByNxZx3CfMMeb/yOrliKsZrnMBMO9xuTAOHIY3WJ5cmBQH04v8a5gFiF6301A=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB6518.eurprd04.prod.outlook.com (2603:10a6:20b:f8::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 10:26:36 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359%7]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 10:26:36 +0000
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
Subject: RE: [PATCH 02/11] i2c: imx-lpi2c: add runtime pm support
Thread-Topic: [PATCH 02/11] i2c: imx-lpi2c: add runtime pm support
Thread-Index: AQHXGvpN2akEV/mfwkGzCpLEq/gN0qqKuivAgAAeqQCAAB02gIAAJjEw
Date:   Fri, 19 Mar 2021 10:26:36 +0000
Message-ID: <AM6PR04MB4966A89FA43404FCB8C9E4A080689@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-3-xiaoning.wang@nxp.com>
 <AM6PR04MB496648409D86D673355B9DAC80689@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <AM6PR04MB5623F105B7B218D99FA10229F3689@AM6PR04MB5623.eurprd04.prod.outlook.com>
 <AM6PR04MB5623EF66E8ED430F84F8A57DF3689@AM6PR04MB5623.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB5623EF66E8ED430F84F8A57DF3689@AM6PR04MB5623.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 983c8556-7cea-4ce7-a894-08d8eac179f7
x-ms-traffictypediagnostic: AM6PR04MB6518:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB6518298A2D3BE4C547DD742A80689@AM6PR04MB6518.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kUMelffDPPigtd2tu/cJWmIKion06PHBouanjYz1MHGvB/48Q77V+bhgvllpuoR/R1JMUnQqKsYjOcCWTlDBMvwX5UNWGca/vty5SQ1Q0F2P9dj+k6N53Y6tHtBLDQQjHqsHesENRIq1RwhomURY1PEJlZoP4ZX5czoI3uCmPhPtgFXGGaj6mamNhDyUXg0lZEXat4froE7BI39I8i6cEEF+GgJpvJCBUi/7BxQbOewLJYsf4Dwae4rSzvYFRTRn+E8IczSor2DAMgpBOs93qQ/PQ/MSme9kwwG5mnfKzeEoqKVAWqaLfwMsSc6ePwqudc9z5Naq49hsu78+QHnJ6ALGdg5/AB+p+dG52TlaFSxSlngbm64wRptcOiLYzhEkdD4pyJxxGgSZ9bH5oVmYbJU9CpO7OXb1my/H+Ut3/vMBA4ckRiKNtN+Jb5ttaNED8mgQUjTpye+lil9DqdEEabEC+NywY/PwRUE/ADS94q32hs/kptBFOJ94Jl8by85kHa+DFZe9vox9r+ZiWQIns5t2k6SsE5qywMUHqiOOOT0/IvYqjKGJ4qo//WtmzoCnF4D7kY6bTsR9h6pJhWm6s76HnMvkfMzzErhSYVWxUT2YQ0Ycb3EJIQwUBIM8NG+8Od4qer+569tvJQGPL3OP7mhQUwTPwjvmNBJgfe3mC6s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(83380400001)(52536014)(8676002)(54906003)(6506007)(110136005)(7696005)(55016002)(5660300002)(9686003)(86362001)(8936002)(76116006)(66946007)(4326008)(44832011)(38100700001)(71200400001)(33656002)(478600001)(2906002)(66556008)(186003)(316002)(26005)(64756008)(66446008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?R3BCb0xFM3JnVjJkYU1SOU1iK3VkSEJ1R09NK2Q5TjdvYno3OFROZHBpYUd1?=
 =?utf-8?B?OWppL01xaWI0b3lXVlRHTmRoZjhCZjV2WEpPamVVWXEyNTV5TUdWMGUrbTRk?=
 =?utf-8?B?SjhlTWlSa0ZZU05jVTVnTEtaMVE3VW1qekkzOXlmMkRhR3RYdFVnSldZdVR3?=
 =?utf-8?B?MkRjTXdVUEJvR1BWdm5yUi82TkM0V3hoOXlNVjhqSk5qR0dWQXpsYm0yWHl0?=
 =?utf-8?B?L0tHaHMycUdyd2hpd2dKM21wUGN2bTZMb3NoMGpTaE1lSGlPODFLZzF6SGNa?=
 =?utf-8?B?Tmc3cSswdEUwRFVwZW9sRyszSHYzTTBEeWZHeWQrcVNMUXlLK3NsVHlWdjNN?=
 =?utf-8?B?SUE5bTJIcURtbWNSam5ORDhZZTRybEtOd3VNSUVGUENKR1JQNFJWRVJVbm5n?=
 =?utf-8?B?VC9kU056MTlRVEhYV3JYd1lvMVNCeGN5NytFZ0NNUlhDMks3TXJqNnVQOFVG?=
 =?utf-8?B?WGgydndzRTFXTWFLbG5nTVNKYVp3Rm45UVoyekRnQWZJaXJ3N3hMVXRSa25a?=
 =?utf-8?B?dVh2UE0zLy9sQ3ZQZXRKQkRJYUpNRnZ3RlpsSDJicUUxT253UEIwaERGWm5D?=
 =?utf-8?B?NmM5SEdrVG5aR2M0TzlPY1JycUVWMW5yWXRkSlloaFlqMEphUkFQTjVXR09U?=
 =?utf-8?B?MHAvbzEwWmVta3FHTnFRNjIxTTZpTGVsNEtvWmdtU0QxODcxcTNFUkZSR2VL?=
 =?utf-8?B?andFY2Nzb2tQNm1GdmxTQlBPZFc2NkVCdzZQeGtiVjhsTkNiWHZIdWtuOW5J?=
 =?utf-8?B?QVlDQkUvcmFUbC81amVxNXBDZUNobHgxVmVBWndjV1I1aWMvZ1JPdmZHRDMw?=
 =?utf-8?B?UHo2TjZYZWNRdTJWNGNqemN3YUh1WmM3MUtmRFY0WXVoYnJDd05mUzVyTTdt?=
 =?utf-8?B?VWRjbisxSVl1dmc0MTRhWEhaOHBaR2VaZzJEZmRlYnJWd25yQjh5RGI1TVNB?=
 =?utf-8?B?OFVhNlh4MjJGaVdzQ080cytINC9TRFFiZmlmcG9IVGZUaElBdWMwdWczdTRh?=
 =?utf-8?B?cFg1OFNkNW84UnJCSlZCOG9reGcreGxQY3ZUNnRoUDh1bUZJdzJiY0VIcGlL?=
 =?utf-8?B?cDZYTDViOWphNTA1TWRoK3dvbzVFOTY3MkQvMFNZWUhnMUtDakw0SUhpcHV5?=
 =?utf-8?B?TWQybUhhcTRORHZiQXJoaGFEVEZ1MUVGTzlxa1NBWm5RcVlQb3ozdDdlc2J2?=
 =?utf-8?B?U2g0NlV2V051dHlqajlTVFc2VTFuem5DckEzV1NEbmtORE1hejNtQ0hTR3F4?=
 =?utf-8?B?S1ZDbDI2cFU3citvMnJaOG9IKzIzQndFQW5TY3V5WStlM3FUNU5uMGp0VnEv?=
 =?utf-8?B?a1RHSmdKUDB5RDJFcEtqR2lpdTIzKzVRK0R1QjMrV1ZPU2sxN0FORHN5NHV2?=
 =?utf-8?B?UXl4c096UVArNG9Eb2M4VFh6a0ZnWWlqT3lkc0dXVzVaSEhia2M3THROekUy?=
 =?utf-8?B?c200Nk1oT2lRblQ5Mm1HdDB5a0FQTUJKYXhwaEVXYTdJanQ2RjhJdmIwRmUx?=
 =?utf-8?B?c25KM0ZCcldmSWVRa3JVZUYwSFhHeHZpRFNzSUNWWVN6bFpRWTBaSHBQcmJn?=
 =?utf-8?B?bG9ma1JGNVp4cVkxMXkzRWZEY0p4SDZrQTZDNG56anE5aVA2WHNmSXA3U0Uw?=
 =?utf-8?B?Z3A2UmhhaGpYYkZVMXZ3OFFYV3ZtaHVucWZRdE4zeVpHMXJhdXVNK3hBL2t6?=
 =?utf-8?B?c21uWk90V1gweFEvQS84SHBldFVxNzlSWEZnanNuaFpQL050WWdreEFnZEdk?=
 =?utf-8?Q?t9lb/JM8nTToAbHwGHuUij8U9X+SfR6gReOV0ll?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983c8556-7cea-4ce7-a894-08d8eac179f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 10:26:36.7583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EwIqAaYT2ZaxmhbTwZlgNrsp9ptyN1FkXXpqDXQjBB6KtrcFIVD8+QTw3hXLyhppdDHVCtXSXgnisU8mq3lcVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6518
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wy4uLl0NCg0KPiA+ID4gPiAgCXBtX3J1bnRpbWVfc2V0X2F1dG9zdXNwZW5kX2RlbGF5KCZwZGV2
LT5kZXYsDQo+ID4gPiBJMkNfUE1fVElNRU9VVCk7DQo+ID4gPiA+ICAJcG1fcnVudGltZV91c2Vf
YXV0b3N1c3BlbmQoJnBkZXYtPmRldik7DQo+ID4gPiA+IC0JcG1fcnVudGltZV9nZXRfbm9yZXN1
bWUoJnBkZXYtPmRldik7DQo+ID4gPiA+IC0JcG1fcnVudGltZV9zZXRfYWN0aXZlKCZwZGV2LT5k
ZXYpOw0KPiA+ID4gPiAgCXBtX3J1bnRpbWVfZW5hYmxlKCZwZGV2LT5kZXYpOw0KPiA+ID4gPg0K
PiA+ID4gPiArCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoJnBkZXYtPmRldik7DQo+ID4gPiA+
ICsJaWYgKHJldCA8IDApIHsNCj4gPiA+ID4gKwkJcG1fcnVudGltZV9wdXRfbm9pZGxlKCZwZGV2
LT5kZXYpOw0KPiA+ID4gPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gZW5hYmxl
IGNsb2NrXG4iKTsNCj4gPiA+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiA+ID4gKwl9DQo+ID4gPg0K
PiA+ID4gQ2FuJ3QgY3VycmVudCBjbGsgY29udHJvbCB2aWEgcnBtIHdvcmsgd2VsbD8NCj4gPiA+
IFBsZWFzZSBkZXNjcmliZSB3aHkgbmVlZCBjaGFuZ2UuDQo+ID4NCj4gPiBJIHRoaW5rIHRoZSBw
cmV2aW91cyBwYXRjaCBtYWtlciBtaWdodCB3YW50IHRvIHVzZSB0aGUgcmV0dXJuIHZhbHVlIG9m
DQo+ID4gcG1fcnVudGltZV9nZXRfc3luYyB0byBjaGVjayB3aGV0aGVyIHRoZSBjbG9jayBoYXMg
YmVlbiB0dXJuZWQgb24NCj4gPiBjb3JyZWN0bHkgdG8NCj4gPiBhdm9pZCB0aGUga2VybmVsIHBh
bmljLg0KPiA+IE1heWJlIEkgY2FuIGNoYW5nZSB0byB0aGUgbWV0aG9kIGxpa2UgdGhpcy4NCj4g
PiAJcG1fcnVudGltZV9nZXRfbm9yZXN1bWUoJnBkZXYtPmRldik7DQo+ID4gCXJldCA9IHBtX3J1
bnRpbWVfc2V0X2FjdGl2ZSgmcGRldi0+ZGV2KTsNCj4gPiAJaWYgKHJldCA8IDApDQo+ID4gCQln
b3RvIG91dDsNCj4gPiAJcG1fcnVudGltZV9lbmFibGUoJnBkZXYtPmRldik7DQo+ID4NCj4gPiBC
ZXN0IFJlZ2FyZHMsDQo+ID4gQ2xhcmsgV2FuZw0KPiANCj4gU29ycnksIEkgbWlzc2VkIHRoZSBw
b2ludCBiZWZvcmUuDQo+IElmIHdlIHVzZSBwbV9ydW50aW1lX2dldF9ub3Jlc3VtZSgmcGRldi0+
ZGV2KTsgYW5kDQo+IHBtX3J1bnRpbWVfc2V0X2FjdGl2ZSgmcGRldi0+ZGV2KTsgaGVyZSwgdGhl
IGNsayBzaG91bGQgYmUgZW5hYmxlZCBieSB1c2luZw0KPiBjbGtfcHJlcGFyZV9lbmFibGUoKSBp
biB0aGUgcHJvYmUgZnVuY3Rpb24uIEhvd2V2ZXIsIHRoZSBjYWxsIG9mDQo+IGNsa19wcmVwYXJl
X2VuYWJsZSgpIGlzIGFscmVhZHkgaW4gbHBpMmNfcnVudGltZV9yZXN1bWUoKS4NCj4gVXNpbmcg
Z2V0X3N5bmMoKSBoZXJlIGNhbiBoZWxwIHRvIHJlZHVjZSB0aGUgcmVwZXRpdGl2ZSBjb2RlLCBl
c3BlY2lhbGx5IGlwZw0KPiBjbGsgd2lsbCBiZSBhZGRlZCBsYXRlci4NCg0KTGV0J3Mgbm90IGRv
IGZvciB0aGlzIG5lZ2xpZ2libGUgaW1wcm92ZW1lbnQgdW5sZXNzIHRoZXJlJ3JlIGFueSBvdGhl
ciBnb29kIGJlbmVmaXRzLg0KSWYgcmVhbGx5IGNhcmUsIG1vdmUgY2xrIG9wZXJhdGlvbiBpbnRv
IGFuIGlubGluZSBmdW5jdGlvbiBpbnN0ZWFkLg0KQW5vdGhlciBiZW5lZml0IGlmIG5vdCBkb2lu
ZyB0aGF0IGlzIHRoZSBkcml2ZXIgc3RpbGwgY2FuIHdvcmsgZXZlbiBSUE0gbm90IGVuYWJsZWQu
DQoNClJlZ2FyZHMNCkFpc2hlbmcNCg0KPiBTaGFsbCB3ZSBjaGFuZ2UgdG8gdXNlIHBtX3J1bnRp
bWVfZ2V0X3N5bmMoKSBoZXJlPw0KPiANCj4gUmVnYXJkcywNCj4gQ2xhcmsgV2FuZw0KPiANCg0K
