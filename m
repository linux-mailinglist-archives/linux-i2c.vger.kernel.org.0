Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED4D4341448
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 05:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233732AbhCSEkV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 00:40:21 -0400
Received: from mail-vi1eur05on2050.outbound.protection.outlook.com ([40.107.21.50]:15905
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233730AbhCSEkL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 00:40:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INbniir79epp0BwMZonSjvnyl5Xhu6qzBfMLQkHZqnTlFExYWOPWHsL2SsErbd5Fz49ePhCx0hGih618EfsmVQFQsc41TFpFPXr8B6DxFRi/hIh/8DZmjndvI31P0WsFzLQ/4KKndgwds+40OELjffcCR0Xb6fGkmgSPuppuX5XX7Ms8ufp4FponopT4z1N7KfhiMza56JYV99BK38gIfOY2ct6taZHZtEEDao+dTO1C4xn9eCbaVK7FrF6qig0aGUumzPqrN+lsp/VUeE2n/yfTtd16tVaeRJO+ciQjPPvwjoO6akNp2bnIfGW/LuBWcAoPhaIKJU4BuSE0b8bbBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MC8SQcu4+d+W8p5mgoNTIqyjor2HSzPw8WPVvf60v1Q=;
 b=e7XWGZWFZ9OE7VslonlMltLfWO6NCLuUya/d6lsvunZnc4OmaqRNHSEMi3/LVprSb6qrnTUJh1u6So8FLCoeqd3IGGtz/N0c6tFBXxOBFlM5YGmntw8O6pXS/+3lNbJpWaU/84p8IPeiDkNAKMyqecvIXTo9RUaGEjeAOSm23a+t6wlV8XEAxF1VlEYm/BGzTUo9y1plwV8rbvWb16kUY1/+RzVbBmuFlkkeu7aLeCJMWIro1KAYGuDUTXydCYz5CPnQOoGKbmkhz2y+1Zt2V3CI77Ghw2D+yKfbs1VeCIy6wGcMYgaTarWAjkbN6KZdNKwdinS51lY4RMjE7ByTJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MC8SQcu4+d+W8p5mgoNTIqyjor2HSzPw8WPVvf60v1Q=;
 b=Lw1uBQuMJxf7M6LoUzJdlghPK7PcL8aBGDvd9ji7+EX4EJZG+aJr2kMlToQ/qr0E41dLWnItMH1EDZ4oXDaAgKrWdehHqBXAy3NMFtQy9ZPVsDlYVvFMrqfZAcuFj3p2UMQUWDoC2j+Ge5emHQun3l9t11On6/xfcvGESxOi/pQ=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Fri, 19 Mar
 2021 04:40:09 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359%7]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 04:40:09 +0000
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
Thread-Index: AQHXGvpN2akEV/mfwkGzCpLEq/gN0qqKuivA
Date:   Fri, 19 Mar 2021 04:40:09 +0000
Message-ID: <AM6PR04MB496648409D86D673355B9DAC80689@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-3-xiaoning.wang@nxp.com>
In-Reply-To: <20210317065359.3109394-3-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3676d17e-fff4-426e-b17f-08d8ea911398
x-ms-traffictypediagnostic: AM7PR04MB7046:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB7046FF2FE7E8F4BAC59C7DF780689@AM7PR04MB7046.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5phMMykaTLneRp5133spkV1xY7zIKlPOYEFQ/2C5ZvKiYFgTtsgocELbsp6JOQaouE5K0GRc5wGNu1QKpvb0tMtsYYVxeg6XWG19Xh1Q6+0qO/ZtziguRQTXREHoQ0T3YtE3ahetOvCLQeES7gJ0svAmylD8uSRbmLQPegLp4s0WXd/4rpORxgGB1uu/lJRXfXdozTwjaYaGU281aZ9ZGu+ppJLflUxAlu3+qXV/WI9KLNaUOxxXLWGFxoCF61+X4OBdGmKC70pNx17JOuFd8SLk4Oz9jI8jAIX2K/W8meb4cycQftkOJIyGenubGV5rS4g9zAwqPLNNY9cNGRIUJZWjKc12neNbG8fqxbSiPTtVCI7V+47nsinsEeIHmHs2WYPMB5qcQixakkMrkOcyiCDsYMWxntrjf9p7FSQNs3Qbh6Y8eni1NUo+KJtECP6dSC1pKkdSn65cXdpPZ3Zf0PQaIYXhgvnXH5Ysis9rZnmVhuZ8AgAWDTJZXogt3SInH1U0FE9YY55rtmbrbVICnYeiS13F9kLnD9i07FTAM5M5rja0eauqFK7hKUIrOvOM/oQGkl1J2WLyAf78ouKeRrT1aAQPGKvLb1kermI4vzv9Unj/VVQLh/OBefc/YxIB20wkL0SQp5Im8GvpHRbzNTKtZVpAuFAqiWhOyJpuQso=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(52536014)(9686003)(186003)(8676002)(33656002)(316002)(71200400001)(38100700001)(4326008)(478600001)(44832011)(8936002)(110136005)(86362001)(76116006)(66476007)(66556008)(66946007)(66446008)(64756008)(2906002)(54906003)(26005)(53546011)(5660300002)(7696005)(55016002)(83380400001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UWNyTkhQNjNXYi81QkVzMG9BcHJQZzh0SXp4NVRvdnZ6L1ZKOVZqdzBocm1S?=
 =?utf-8?B?S0Yxc050Wjl4K3k0TmpsL1VhMURaVDk5MW5NcnkvMnJ1d3p5cHpkOFd2QU0v?=
 =?utf-8?B?TkhrWVBSM3NwK2xrTFVyY05iQ3RySVVVdEFpQXNQc2J1WmlEeFNLQ0FrdG9G?=
 =?utf-8?B?RU5JTVVscnVXUHBja1cvSDlrUndrNVZnb2FkOTl0d2lrcUp4RUFYS0QwbDNJ?=
 =?utf-8?B?WXRFbkxtNWh4MTBhU3VtSjYzOUFCZzIwRnRkRW1vTGpnbWUrN2MrTHpRQlA1?=
 =?utf-8?B?SkVISXN1cVp5Vk5HbkxwbGVUcXA1L1BwK200bTZiYU85Vm5xZk1BSnZMNWhz?=
 =?utf-8?B?NTQwV0dkd0RYNGt6c2h0bUlCSEhPY29FYW4yRDVHZFpMM25RYXVWSlI4bURO?=
 =?utf-8?B?NlQzVGZ3Zk1jOXMzQjlvb3RCdW1EaCtjSkhoNmdPaEpHMkU3Q0pWTjRYMEht?=
 =?utf-8?B?OTczOWFBbUhtVVE5MTRDSDU5MkZFYzJHcmU2SWx5L0hUeFBhWVIvZ2k2SFdN?=
 =?utf-8?B?UFRKYkQyd3huUlV4TGhoY1VBYUZHSkhsVytPVmJzUzlkSTBxUnRrZk96R2Jv?=
 =?utf-8?B?S0kwOEg4RVc2a2F3aGpldjZVNXlLczZMQjVpVVA3ZUozZjNIOVJtYzAzOEph?=
 =?utf-8?B?dzlQczRPUzczUExaVHdDb2pvdGlmMXBlaXdCRWxKdVhxaFVXdmhWWXdaemNB?=
 =?utf-8?B?OStPT1JsbmVFcnZhK0RnR0F3dWViZnFDM0NCa2xrK0M0Q0hOYXRVWVdIR2li?=
 =?utf-8?B?OUp1dVVCSzJ5T0RQOTR1U2dxZS9LSnpXdGQwTUxqdE1HWVNlSzU3UU52elEx?=
 =?utf-8?B?NDl3MFNvQmVPWXpEaHgzZkxBRDBnYVF4ajJEeHR0UFNWZldmUThNdFJ5M053?=
 =?utf-8?B?dExHdXhzM05ZQ0w4QmU0Y0loZ1AzRU5icmhOVEtaaDZxcExTUExYZUczR3Jx?=
 =?utf-8?B?cjArYWNMOTlYb1JGMU56UUJlTGdKaS9PVXVOZTNBSjhjeE5ncGRpT1YwMEhl?=
 =?utf-8?B?Q2ZBaEoydUZsSzlwZjlrQVBHOEhjUWg2Z0MrTjJqK3VxaUdzTDJINGt5ekVl?=
 =?utf-8?B?QTduSS9TQTZVdVJzdlFmd3ZDdzhER0doSEtvK05oZFdDNmNuUmJrMm00czhY?=
 =?utf-8?B?VWQxMzRzOWZQMm5heGNwZWRIWFIzZVpiWWQ2RWVnSFpQa29SKzJFZDFzN2to?=
 =?utf-8?B?c3p1M1pqU21vd3NCc3paRjZFaElHRlgxa05zWXVBSDlBQkdhaGtlTXF3Mm1E?=
 =?utf-8?B?bEgvZ0hzWE1qcS9keEh0dzlseWNQNGc2SHc4SmppRnk4SHlQaEZ2MmFPVzVS?=
 =?utf-8?B?QnBvM1M2ZlRDVHZGbUt6M2x5MlhSRDd4Z1NIRm01YVlocVk4aVA2bGhwMWx6?=
 =?utf-8?B?eFRXREh6UVl3QnI1RG43Vmo2bkIxNzVFUEtzRGhCdEJkWWJCZ0l4eVRpSVAw?=
 =?utf-8?B?a2hZc3pCV1l4b0dwZUdjZlBBT2lkV2xydmk3UWpINmQxY0ovQUI4OXlreVNL?=
 =?utf-8?B?OGwrckdFUkE0M1JoWENLMm5mRGM0d0dFUnRrbWUwTzQyODRWM3FiY1Z5VnBu?=
 =?utf-8?B?T0Frc0xQWldHNjJxcFhjd3ZadXpEcHlSZVFackxqRXY4RXFRUTk1L0xMVlRF?=
 =?utf-8?B?Z1FnN1FnU0VNYmxxWmIxYXNSLzlwUWloSlk3QXEyUTFjWFpGRzRmWTBTSWto?=
 =?utf-8?B?aXRjSm83VEh1ZWVzbytySnpEeFNqNWMvTEtqMVFybDNnOG9Xb3FkdFdlSEJF?=
 =?utf-8?Q?PKCdKS31KvxXdIszvHmde/w5SMAWEje+2zMT0o4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3676d17e-fff4-426e-b17f-08d8ea911398
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 04:40:09.1099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e1RrkWn6FatB1+KUc5g6R8Ulx/pfrHXB5GGwo0exrBvDh9g4RwJf5XlfV1Sk6hiDRVEL2o2VV/gXWYADk74HJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7046
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTWFyY2ggMTcsIDIwMjEgMjo1NCBQTQ0KPiBTdWJqZWN0OiBbUEFUQ0ggMDIvMTFdIGky
YzogaW14LWxwaTJjOiBhZGQgcnVudGltZSBwbSBzdXBwb3J0DQo+IA0KPiAtIEFkZCBydW50aW1l
IHBtIHN1cHBvcnQgdG8gZHluYW1pY2x5IG1hbmFnZSB0aGUgY2xvY2suDQo+IC0gUHV0IHRoZSBz
dXNwZW5kIHRvIHN1c3BlbmRfbm9pcnEuDQo+IC0gQ2FsbCAucG1fcnVudGltZV9mb3JjZV9zdXNw
ZW5kKCkgdG8gZm9yY2UgcnVudGltZSBwbSBzdXNwZW5kZWQNCj4gICBpbiAuc3VzcGVuZF9ub2ly
cSgpLg0KPiANCg0KVGhlIHBhdGNoIHRpdGxlIG5lZWRzIHRvIGJlIGltcHJvdmVkIGFzIHRoZSBk
cml2ZXIgYWxyZWFkeSBzdXBwb3J0cyBycG0uDQpBbmQgZG8gb25lIHRoaW5nIGluIG9uZSBwYXRj
aC4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBGdWdhbmcgRHVhbiA8ZnVnYW5nLmR1YW5AbnhwLmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogR2FvIFBhbiA8cGFuZHkuZ2FvQG54cC5jb20+DQo+IFJldmlld2Vk
LWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCg0KUGxlYXNlIGFkZCB5b3Vy
IHNpZ24tb2ZmLg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMu
YyB8IDUwICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDMzIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gYi9kcml2ZXJzL2kyYy9idXNzZXMv
aTJjLWlteC1scGkyYy5jDQo+IGluZGV4IGJiZjQ0YWM5NTAyMS4uMWU5MjBlN2FjN2MxIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jDQo+ICsrKyBiL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gQEAgLTU3NCw3ICs1NzQsOCBAQCBz
dGF0aWMgaW50IGxwaTJjX2lteF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpwZGV2
KQ0KPiAgCWlmIChyZXQpDQo+ICAJCWxwaTJjX2lteC0+Yml0cmF0ZSA9IEkyQ19NQVhfU1RBTkRB
UkRfTU9ERV9GUkVROw0KPiANCj4gLQlyZXQgPSBkZXZtX3JlcXVlc3RfaXJxKCZwZGV2LT5kZXYs
IGlycSwgbHBpMmNfaW14X2lzciwgMCwNCj4gKwlyZXQgPSBkZXZtX3JlcXVlc3RfaXJxKCZwZGV2
LT5kZXYsIGlycSwgbHBpMmNfaW14X2lzciwNCj4gKwkJCSAgICAgICBJUlFGX05PX1NVU1BFTkQs
DQoNClRoaXMgYmVsb25ncyB0byBhIHNlcGFyYXRlIHBhdGNoDQoNCj4gIAkJCSAgICAgICBwZGV2
LT5uYW1lLCBscGkyY19pbXgpOw0KPiAgCWlmIChyZXQpIHsNCj4gIAkJZGV2X2VycigmcGRldi0+
ZGV2LCAiY2FuJ3QgY2xhaW0gaXJxICVkXG4iLCBpcnEpOyBAQCAtNTg0LDM1DQo+ICs1ODUsMzIg
QEAgc3RhdGljIGludCBscGkyY19pbXhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gIAlpMmNfc2V0X2FkYXBkYXRhKCZscGkyY19pbXgtPmFkYXB0ZXIsIGxwaTJjX2lteCk7
DQo+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgbHBpMmNfaW14KTsNCj4gDQo+IC0JcmV0
ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGxwaTJjX2lteC0+Y2xrKTsNCj4gLQlpZiAocmV0KSB7DQo+
IC0JCWRldl9lcnIoJnBkZXYtPmRldiwgImNsayBlbmFibGUgZmFpbGVkICVkXG4iLCByZXQpOw0K
PiAtCQlyZXR1cm4gcmV0Ow0KPiAtCX0NCj4gLQ0KPiAgCXBtX3J1bnRpbWVfc2V0X2F1dG9zdXNw
ZW5kX2RlbGF5KCZwZGV2LT5kZXYsIEkyQ19QTV9USU1FT1VUKTsNCj4gIAlwbV9ydW50aW1lX3Vz
ZV9hdXRvc3VzcGVuZCgmcGRldi0+ZGV2KTsNCj4gLQlwbV9ydW50aW1lX2dldF9ub3Jlc3VtZSgm
cGRldi0+ZGV2KTsNCj4gLQlwbV9ydW50aW1lX3NldF9hY3RpdmUoJnBkZXYtPmRldik7DQo+ICAJ
cG1fcnVudGltZV9lbmFibGUoJnBkZXYtPmRldik7DQo+IA0KPiArCXJldCA9IHBtX3J1bnRpbWVf
Z2V0X3N5bmMoJnBkZXYtPmRldik7DQo+ICsJaWYgKHJldCA8IDApIHsNCj4gKwkJcG1fcnVudGlt
ZV9wdXRfbm9pZGxlKCZwZGV2LT5kZXYpOw0KPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWls
ZWQgdG8gZW5hYmxlIGNsb2NrXG4iKTsNCj4gKwkJcmV0dXJuIHJldDsNCj4gKwl9DQoNCkNhbid0
IGN1cnJlbnQgY2xrIGNvbnRyb2wgdmlhIHJwbSB3b3JrIHdlbGw/DQpQbGVhc2UgZGVzY3JpYmUg
d2h5IG5lZWQgY2hhbmdlLg0KDQo+ICsNCj4gIAl0ZW1wID0gcmVhZGwobHBpMmNfaW14LT5iYXNl
ICsgTFBJMkNfUEFSQU0pOw0KPiAgCWxwaTJjX2lteC0+dHhmaWZvc2l6ZSA9IDEgPDwgKHRlbXAg
JiAweDBmKTsNCj4gIAlscGkyY19pbXgtPnJ4Zmlmb3NpemUgPSAxIDw8ICgodGVtcCA+PiA4KSAm
IDB4MGYpOw0KPiANCj4gKwlwbV9ydW50aW1lX3B1dCgmcGRldi0+ZGV2KTsNCj4gKw0KPiAgCXJl
dCA9IGkyY19hZGRfYWRhcHRlcigmbHBpMmNfaW14LT5hZGFwdGVyKTsNCj4gIAlpZiAocmV0KQ0K
PiAgCQlnb3RvIHJwbV9kaXNhYmxlOw0KPiANCj4gLQlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5
KCZwZGV2LT5kZXYpOw0KPiAtCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCZwZGV2LT5kZXYp
Ow0KPiAtDQo+ICAJZGV2X2luZm8oJmxwaTJjX2lteC0+YWRhcHRlci5kZXYsICJMUEkyQyBhZGFw
dGVyIHJlZ2lzdGVyZWRcbiIpOw0KPiANCj4gIAlyZXR1cm4gMDsNCj4gDQo+ICBycG1fZGlzYWJs
ZToNCj4gLQlwbV9ydW50aW1lX3B1dCgmcGRldi0+ZGV2KTsNCj4gIAlwbV9ydW50aW1lX2Rpc2Fi
bGUoJnBkZXYtPmRldik7DQo+ICAJcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVuZCgmcGRl
di0+ZGV2KTsNCj4gDQo+IEBAIC02MzYsNyArNjM0LDcgQEAgc3RhdGljIGludCBfX21heWJlX3Vu
dXNlZA0KPiBscGkyY19ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgCXN0
cnVjdCBscGkyY19pbXhfc3RydWN0ICpscGkyY19pbXggPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsN
Cj4gDQo+ICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGxwaTJjX2lteC0+Y2xrKTsNCj4gLQlwaW5j
dHJsX3BtX3NlbGVjdF9zbGVlcF9zdGF0ZShkZXYpOw0KPiArCXBpbmN0cmxfcG1fc2VsZWN0X2lk
bGVfc3RhdGUoZGV2KTsNCg0KVGhpcyBiZWxvbmdzIHRvIGEgc2VwYXJhdGUgcGF0Y2gNCg0KPiAN
Cj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gQEAgLTY0OSwxNiArNjQ3LDM0IEBAIHN0YXRpYyBpbnQg
X19tYXliZV91bnVzZWQNCj4gbHBpMmNfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2
KQ0KPiAgCXBpbmN0cmxfcG1fc2VsZWN0X2RlZmF1bHRfc3RhdGUoZGV2KTsNCj4gIAlyZXQgPSBj
bGtfcHJlcGFyZV9lbmFibGUobHBpMmNfaW14LT5jbGspOw0KPiAgCWlmIChyZXQpIHsNCj4gLQkJ
ZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZW5hYmxlIEkyQyBjbG9jaywgcmV0PSVkXG4iLCByZXQp
Ow0KPiArCQlkZXZfZXJyKGRldiwgImNhbid0IGVuYWJsZSBJMkMgY2xvY2ssIHJldD0lZFxuIiwg
cmV0KTsNCg0KUHJvYmFibHkgdW5uZWNlc3NhcnkgY2hhbmdlDQoNCj4gIAkJcmV0dXJuIHJldDsN
Cj4gIAl9DQo+IA0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgbHBp
MmNfc3VzcGVuZF9ub2lycShzdHJ1Y3QgZGV2aWNlICpkZXYpIHsNCj4gKwlpbnQgcmV0Ow0KPiAr
DQo+ICsJcmV0ID0gcG1fcnVudGltZV9mb3JjZV9zdXNwZW5kKGRldik7DQo+ICsJaWYgKHJldCkN
Cj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCXBpbmN0cmxfcG1fc2VsZWN0X3NsZWVwX3N0YXRl
KGRldik7DQo+ICsNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gDQo+ICtzdGF0aWMgaW50IGxwaTJj
X3Jlc3VtZV9ub2lycShzdHJ1Y3QgZGV2aWNlICpkZXYpIHsNCj4gKwlyZXR1cm4gcG1fcnVudGlt
ZV9mb3JjZV9yZXN1bWUoZGV2KTsNCj4gK30NCj4gKw0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
ZXZfcG1fb3BzIGxwaTJjX3BtX29wcyA9IHsNCj4gLQlTRVRfTk9JUlFfU1lTVEVNX1NMRUVQX1BN
X09QUyhwbV9ydW50aW1lX2ZvcmNlX3N1c3BlbmQsDQo+IC0JCQkJICAgICAgcG1fcnVudGltZV9m
b3JjZV9yZXN1bWUpDQo+ICsJU0VUX05PSVJRX1NZU1RFTV9TTEVFUF9QTV9PUFMobHBpMmNfc3Vz
cGVuZF9ub2lycSwNCj4gKwkJCQkgICAgIGxwaTJjX3Jlc3VtZV9ub2lycSkNCg0KQmVsb25ncyB0
byBzZXBhcmF0ZSBjaGFuZ2UgYW5kIGV4cGxhaW4gd2h5IG5lZWQgZG8gdGhpcw0KDQo+ICAJU0VU
X1JVTlRJTUVfUE1fT1BTKGxwaTJjX3J1bnRpbWVfc3VzcGVuZCwNCj4gIAkJCSAgIGxwaTJjX3J1
bnRpbWVfcmVzdW1lLCBOVUxMKQ0KPiAgfTsNCj4gLS0NCj4gMi4yNS4xDQoNCg==
