Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E19A138BF40
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 08:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbhEUG1R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 02:27:17 -0400
Received: from mail-db8eur05on2056.outbound.protection.outlook.com ([40.107.20.56]:44132
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230217AbhEUG1Q (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 02:27:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVhsvkodynf73csQMUTjCMtsZ1AvIS72mCsdmjiuuLtAPdNYPFsVxBJEU8JUURM3z0e74BAep/JVt0WhmWPvKE5YI3zRn4ydchO1sto5znvovOlll1IXyyvAf8sWbEQtT+DqD5qjizYdJmhycQ/zQugV9f6G1VbDH5oFjPuUQh4Wy+XbVJJ3Ms/zTAtqAFAcdQQnaAUDC5kIT6jOPu4H/voXghc3nos9qYQrSPhHw5SGargLJYM8WiAOstp/uu6v0+OcrQQdfCeL8LmjqyZvpq2ATk1N84GIIvmVBQGg/pIRbIFTUiwdahXR4mE1MIQYl7ukB/rKqrkJaW5081Y6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nq4bSuL1atqAGF0tCzMo283ljaRDyG2HH0DbfzSQ10=;
 b=NGkGDNJOkALJpsQyz0ki4J3ZZtYW/V7HE9Kae3Ma1Hk6UVSCMoRdX7wIFEW/w6oUchMgW0BWedgGfD8ICe5+ViU8KR6TdretIc/BngGxl5aQXjiAoo5LP/p2En6xwBMw8g3z0gGfdiAk6jDfmZteQ4twaqWWm27dWMmYfeGI1Fgk7Q1P6fXzR+TDOZ/TWHqypdFmldBfcGi4XgSiLPx++6QK12rb48Xa6Ezk49g0/hmip494Bdjo68gC9wIHoHSTbP2Kj6HMzAJVlMDuKyh+tqE3/NAM655tJ051ka2SSBYt3hmm8OEAaabSU8+rPhVX5ZCC33b9n1gWXssXJUW/6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nq4bSuL1atqAGF0tCzMo283ljaRDyG2HH0DbfzSQ10=;
 b=nDpLj9uXDyGX9Nd5KHv03+7mG15j8ofAgSRL8gvvgYowY/Re0xfZVaStnDb4O3CtGx0l+RWzCFvXmhFctetKKD9wgeycQUqYaI5P1b4RWhyKePMiRuORnY6OuzfIcwH9U/O/Jd3rYjiQCz8psO23VjUXyEmm100HWZ3wOM8s46g=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AS8PR04MB7879.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 21 May
 2021 06:25:52 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 06:25:52 +0000
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
Subject: RE: [PATCH V2 04/18] ARM: dts: imx7ulp: add the missing lpi2c nodes
Thread-Topic: [PATCH V2 04/18] ARM: dts: imx7ulp: add the missing lpi2c nodes
Thread-Index: AQHXKtig3zLtpaTGVEeCT7/Jd5z6partvjqg
Date:   Fri, 21 May 2021 06:25:52 +0000
Message-ID: <AM6PR04MB496628D90F197AB8B70A7E1180299@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
 <20210406113306.2633595-5-xiaoning.wang@nxp.com>
In-Reply-To: <20210406113306.2633595-5-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d8cd37c-d324-41e1-ed7e-08d91c214883
x-ms-traffictypediagnostic: AS8PR04MB7879:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB7879F0F581394F7A3114F35480299@AS8PR04MB7879.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KUautvrjqLzsO9502JvfE9yaSAWNZCV8X7h9EA+tPQQR42PfuRinsH96i+UfI+5P91Z+r2mXgqYj/DqtiOkDqNnjEvw1Ael2hrhe3XWAIum1l2O5x1NHW1+95kDsmhveKr2A4tUoC6ELhKtti6jElhpXFhjiOIds+DcBZ4jpzku2xyf4Rbmz1+x9EpYrlG6pq9I4yed0P2g592HEKygWQ9rPBwWWpap/FKGAQoVSvoS+p57aDPyk081IuU24LEjO3GCTQtcHAtZwktMmHXdlZAhIH5FXzzZlGILIyLTh1BKd4YMcy/F8B039oRuhVrzcFneCUNn2zD7NHkPkd1cxSgiOjO7Oqe8sFoQ0qAqWnxnXEO0nRmvu10l4W3PgdeVkxwHHBwqYW5FqjsnsjgC58Txjiwp6KqRr4kdcMgYEFqb5q/56aVFHHJtEd3u+5kXwFf3iXjMomrzGFCDjMs8jX4xhHjnonnXjNR9WQdBDehi+vPlSEdsU4KH3GLMPVqt8d8vqWP+dcmrbSLpMQyQYgfk9MR9zSIugubbQmtFc6C0PrSJUCCwFkHQyfIUZFDJVpz7iZ/pAigtLiJOTprXDT50kEt7dho14sDJBWb9QPoE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(186003)(478600001)(122000001)(44832011)(7696005)(4326008)(55016002)(26005)(6506007)(38100700002)(2906002)(66946007)(9686003)(54906003)(66476007)(52536014)(66446008)(76116006)(8676002)(64756008)(71200400001)(8936002)(66556008)(33656002)(83380400001)(110136005)(316002)(86362001)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZFB2RFE1NUFxWDVrSGEzeDZtcXhtNlUrd3FDUTkzU2d5L1ZyVktHcGhqT2hQ?=
 =?utf-8?B?UkpNdmFBOHpudzlqMHVjdG9JYk96K1VrRSthcG5ZVm1jNHJTWDRrMlBEa2R1?=
 =?utf-8?B?UWdCNkhrY0cxSGMzU2htNU5QaFVpdjdqUzM2bG44YTRYdzRyRW54TlM3K0Zr?=
 =?utf-8?B?MnJkNEFKTjVWc09NL0c2c1dYcGszVWQ3RmM3d3poSCtYMEJya2NOK3dUWnNZ?=
 =?utf-8?B?SHFsK3htMzdaUFF1V1hvTVBYV2N1RnlFUmVaNG40U2pjS0k0TGUxaGxtem1y?=
 =?utf-8?B?Z0x1UGsxOEQ4a2ptR0M1SVdsalFXb1BmMFB2WmxmMmZ0NHFDenZvdTlXckdz?=
 =?utf-8?B?bG5MWDh3QVZQRjhUdm85NTZ0K25Mbm5OYlZrS09ZNVVVTDk2bE5tN0l5TTFZ?=
 =?utf-8?B?cmlzTHQxdFR3eEFWOXhnSHd0cjExWVVxT1BFbGhKMlA0a3ZZcDFva2VsWFBO?=
 =?utf-8?B?SFBXWnhRRDNsSDBIYTVNSWRIR1I0T2NaalQvM09MNE9HZUxpQnVWNEZYN1lJ?=
 =?utf-8?B?UjVHcFlZVXBUeTg4NzdiV1U2MXkyd3BtMkFGdlIyV3BRWWlSTlZBTXFuLzlF?=
 =?utf-8?B?NG9XS2hlQkhJRGJwUVlLWHd3SHY4UytUcUZFZHJ5dlVIWDA1a1B5Sy91Tm1F?=
 =?utf-8?B?VXJtYkFibERzejJTWEV5V2EzeVRjTU9CSnJ0bnRTNkRqcERTVGZVMTZjV2lj?=
 =?utf-8?B?djhyN04zcEU5ZnIzMEdKR0pvM2dKRm54djdFQy9oYlV6dWZWRDBDT3NPZzhV?=
 =?utf-8?B?eitQLzBTbDh1QWkxQkl4UkJVWm9oZXNVSzQ4cXlwL0tlNW91b2w4RkdMQmNr?=
 =?utf-8?B?K3UwM214cXpnQkhJU1JPQTdRcG9iWmFYSXl1YTdPY0NrUEovNUJzb3cyODhN?=
 =?utf-8?B?R2poT3VYemtOTzczNDhhcUdIeHRrZ0E0L3RaSzJGRWpGTHFYaDByeDgzcS9w?=
 =?utf-8?B?OWR3b2ZoTFVQTmdLcHJSSWlWcUZkNnpoanh5MVJHMGFoWFE1Nmo5L0VycVAr?=
 =?utf-8?B?TUE1ZGM5K0lJdzlHWDJlMC8wODBIOWpoL1YwdFNudEJBbHdrem1tb2ZwVGxF?=
 =?utf-8?B?NzBsbHRNRk5CMmhQcGh0dFJyYjBBMU43U0piTnZ0SVloRk1lWmVYN3IxdVBJ?=
 =?utf-8?B?ZG9hbTNhN2VETDh1YUV0QW1sb0N6ZVM3SXpIaVVBTWFOVnI1dVVjUGxDVlpm?=
 =?utf-8?B?eHdjYWlEWTRBZ3M4Q2ttNFRRZG1DRllqK29IUmozcm8rOG91U3I3N3hVK1ls?=
 =?utf-8?B?eW8yZFg0OGF4dm5LemRxN1Bya2ZLVjNjVTZJL3lRU0hpcVowRzhBV1hxUWVW?=
 =?utf-8?B?d0NtU0lVVjhTa2NteEN5RHphYzFZcjErVzArZUFrTktLbUdIb3pFRnJ3Vzda?=
 =?utf-8?B?Vk9jUGM3UXk0YzIwOFdIbkV1UGNrQ0lEeHZnN1Y2ZG1WLzNJM3Y0TVkxdmVV?=
 =?utf-8?B?c1duL0VKV2x2Smh1aGtEb2Nmell4RWpqUXBrUllJZXFoRmdNVFN1SzU5aURU?=
 =?utf-8?B?Tk1hNFpack1TTzR1MU9kcDJBV04zZ0p0YjU3aEJrMHJ4NE9oTjJJcXZCK2J2?=
 =?utf-8?B?T3ZSYjNzSWh6OVl0U0lxeU9jTWpRVThQZVY5M0Zhb3ZUN1E3R1hLMjZ1d1dv?=
 =?utf-8?B?MFN3ODZoeHdiL1R2dUtBWURLdFR1Z3dzQ3NJckR5NHFpb2R2NTdnbUFrYkpY?=
 =?utf-8?B?bm5YRnU3Y1dpQVFoRXVDdm1wQzgvRXc0V3FoQ05aeG91ZVR0eXhXWXlpL3NY?=
 =?utf-8?Q?j7E+WkRqhsD0uvKiD6ZgGzda7wLR4Ag/sRhrJqz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8cd37c-d324-41e1-ed7e-08d91c214883
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 06:25:52.4410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UrjRfwuMmZFVll4TLB6RUJx7Qq3OHemJ5JGLNfOZh4A66EV4RIYCVT551BWCyNpUy1HE4wsvYgHiOKpDeUhnfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7879
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIEFwcmlsIDYsIDIwMjEgNzozMyBQTQ0KPiANCj4gQWRkIHRoZSBtaXNzaW5nIGxwaTJjNC81
IG5vZGVzIGZvciBpbXg3dWxwLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2xhcmsgV2FuZyA8eGlh
b25pbmcud2FuZ0BueHAuY29tPg0KPiAtLS0NCj4gVjIgY2hhbmdlczoNCj4gIC0gTmV3IHBhdGNo
IGFkZGVkIGluIFYyDQo+IC0tLQ0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvaW14N3VscC5kdHNpIHwg
MzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDI5
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm0vYm9vdC9kdHMvaW14N3VscC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14N3VscC5kdHNp
DQo+IGluZGV4IGViMGQ0YjhmNjI0ZC4uMGM1MWZhNzljMGJjIDEwMDY0NA0KPiAtLS0gYS9hcmNo
L2FybS9ib290L2R0cy9pbXg3dWxwLmR0c2kNCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14
N3VscC5kdHNpDQo+IEBAIC0yMiw4ICsyMiwxMCBAQCBhbGlhc2VzIHsNCj4gIAkJZ3BpbzEgPSAm
Z3Bpb19wdGQ7DQo+ICAJCWdwaW8yID0gJmdwaW9fcHRlOw0KPiAgCQlncGlvMyA9ICZncGlvX3B0
ZjsNCj4gLQkJaTJjMCA9ICZscGkyYzY7DQo+IC0JCWkyYzEgPSAmbHBpMmM3Ow0KPiArCQlpMmMw
ID0gJmxwaTJjNDsNCj4gKwkJaTJjMSA9ICZscGkyYzU7DQo+ICsJCWkyYzIgPSAmbHBpMmM2Ow0K
PiArCQlpMmMzID0gJmxwaTJjNzsNCj4gIAkJbW1jMCA9ICZ1c2RoYzA7DQo+ICAJCW1tYzEgPSAm
dXNkaGMxOw0KPiAgCQlzZXJpYWwwID0gJmxwdWFydDQ7DQo+IEBAIC0xNDUsNiArMTQ3LDMxIEBA
IHNlY19qcjE6IGpyQDIwMDAgew0KPiAgCQkJfTsNCj4gIAkJfTsNCj4gDQo+ICsJCWxwaTJjNDog
bHBpMmM0QDQwMmIwMDAwIHsNCg0KR2VuZXJpYyBub2RlIG5hbWUgaXMgcHJlZmVycmVkLiBFLmcu
IEkyY0B4eHh4eA0KDQo+ICsJCQljb21wYXRpYmxlID0gImZzbCxpbXg3dWxwLWxwaTJjIjsNCj4g
KwkJCXJlZyA9IDwweDQwMmIwMDAwIDB4MTAwMDA+Ow0KPiArCQkJaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDM0IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiArCQkJY2xvY2tzID0gPCZwY2MyIElNWDdV
TFBfQ0xLX0xQSTJDND4sDQo+ICsJCQkJIDwmc2NnMSBJTVg3VUxQX0NMS19OSUMxX0JVU19ESVY+
Ow0KPiArCQkJY2xvY2stbmFtZXMgPSAicGVyIiwgImlwZyI7DQo+ICsJCQlhc3NpZ25lZC1jbG9j
a3MgPSA8JnBjYzIgSU1YN1VMUF9DTEtfTFBJMkM0PjsNCj4gKwkJCWFzc2lnbmVkLWNsb2NrLXBh
cmVudHMgPSA8JnNjZzEgSU1YN1VMUF9DTEtfRklSQz47DQo+ICsJCQlhc3NpZ25lZC1jbG9jay1y
YXRlcyA9IDw0ODAwMDAwMD47DQo+ICsJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiArCQl9Ow0K
PiArDQo+ICsJCWxwaTJjNTogbHBpMmM1QDQwMmMwMDAwIHsNCg0KRGl0dG8NCg0KPiArCQkJY29t
cGF0aWJsZSA9ICJmc2wsaW14N3VscC1scGkyYyI7DQo+ICsJCQlyZWcgPSA8MHg0MDJjMDAwMCAw
eDEwMDAwPjsNCj4gKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAzNSBJUlFfVFlQRV9MRVZFTF9I
SUdIPjsNCj4gKwkJCWNsb2NrcyA9IDwmcGNjMiBJTVg3VUxQX0NMS19MUEkyQzU+LA0KPiArCQkJ
CSA8JnNjZzEgSU1YN1VMUF9DTEtfTklDMV9CVVNfRElWPjsNCj4gKwkJCWNsb2NrLW5hbWVzID0g
InBlciIsICJpcGciOw0KPiArCQkJYXNzaWduZWQtY2xvY2tzID0gPCZwY2MyIElNWDdVTFBfQ0xL
X0xQSTJDNT47DQo+ICsJCQlhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZzY2cxIElNWDdVTFBf
Q0xLX0ZJUkM+Ow0KPiArCQkJYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8NDgwMDAwMDA+Ow0KPiAr
CQl9Ow0KPiArDQo+ICAJCWxwdWFydDQ6IHNlcmlhbEA0MDJkMDAwMCB7DQo+ICAJCQljb21wYXRp
YmxlID0gImZzbCxpbXg3dWxwLWxwdWFydCI7DQo+ICAJCQlyZWcgPSA8MHg0MDJkMDAwMCAweDEw
MDA+Ow0KPiAtLQ0KPiAyLjI1LjENCg0K
