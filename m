Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 276ED38BF2E
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 08:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbhEUGTW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 02:19:22 -0400
Received: from mail-eopbgr80084.outbound.protection.outlook.com ([40.107.8.84]:26592
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231540AbhEUGTW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 02:19:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5uqWx4HolWTSc5wQvkH10dxIXlYmPsAGdqebioSM3dbObSW1Q/CuS6YkoAmiT3w/GSPvtdicMLwN9kU0W52kjeH8yJyA0GOD4ROjSX79ZmlJzMEUo+5tXiFqACws1q3P3PI5kvIeOdKAtRrLC5hiO9JTRkKgOE1zUJY/kr17K+O91Ffk06nJ0ZG0vwSPMtkoGwsuxrIto8MGqB21PJHahu8SYIDn8LJy8S/ia+D7S4q8pdqyihN/H15HC0Mw1gxENylvHpEBxww99l2KIZD9PPDz1e9K4UmD2eEF8Nwnoj5c6KcmNoJHsIT5Fxll1oHQpfrriY6pcq7ttTkSsuHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xOXkn81lpzBY4pUl+Ur44tSfw0c6XWK/cspDhhJL0A=;
 b=WpCMOtWjfM0LlFU3WA5FCGyD18wl9dp93eInnQ/UVxGPIwFa61lmwqiWzF2pnq16+0GKBXTGeYLucuQ9bYww+MPYiPy3pGl1TRUbZuD487BfLKtbYv3AAg40bLzNQ4ag6gtkeI3OLhCz3pH3pDOmDktQTVoNp1qR+1qmSHFrUZrQOULrsjK2CK0e4ywVeLrryX4LIuz365lxsODyzMBMZDloosoi7uMGWh/y7iFsFs+Y8fu03GPE36rFtGwV0fQJSIj6yLvk7wLzpszqckz8osvcsttwZHWQc/W7g08Y9+hcOgkko6ej0ieJ6VFbkqsM0ZpGWNsJsxzRQPgi7wg3/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xOXkn81lpzBY4pUl+Ur44tSfw0c6XWK/cspDhhJL0A=;
 b=NR7Rhvf1ZYvnSAceXlGRze54Aqjrn57DqBIXUTARKvj+OmxbAudDmO9NcvVoWrw0+c2UgejmHuisdHgi1Ek2+v1qoqviDrNBCv9b6lf/HfP0A8l+S3S0EU0yOnRrpdeuOte8IoV0khwkwW7z5q6DnW3PQuTV0jSA8r5nyLmhAIs=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 21 May
 2021 06:17:57 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 06:17:57 +0000
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
Subject: RE: [PATCH V2 03/18] ARM: dts: imx7ulp: add the missing lpi2c ipg
 clock
Thread-Topic: [PATCH V2 03/18] ARM: dts: imx7ulp: add the missing lpi2c ipg
 clock
Thread-Index: AQHXKtieYiSeX4oQpkyqDToh9iLvnqrtu25g
Date:   Fri, 21 May 2021 06:17:57 +0000
Message-ID: <AM6PR04MB4966DA92D3ADD6D72273DCAB80299@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
 <20210406113306.2633595-4-xiaoning.wang@nxp.com>
In-Reply-To: <20210406113306.2633595-4-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49398be6-7f7e-4985-80ff-08d91c202d45
x-ms-traffictypediagnostic: AM7PR04MB6870:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB6870D76DA26A5482D815DACF80299@AM7PR04MB6870.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: foBiMUhbjh0JakAfU66sWWb7VX0yQcUs9/hGg154fXNN35exddcvr2QzBKCwJYyBr9hKwfAHwGU9K1heDRIT98WQ/YRcuWYWfA5FuEbOGmk2j2speGgq4L9G9xGdfjiLwOBUbLsSlYUCH81HbUHpmpzZxmgistDLGUinpS0i+CX0CIq4dZAK9EVPNcu9ytpRaxFXpqBhl+scIWud4BNBKa7waNthktMACfxxsujwzLSB0WaTbpVmemMYDHxcR37+Pmb0PAuMuM61aDeVt3V8UW4rDczZWWpBn5o5y+O2QqDVW+Z8UPZxHlx8ppDj+Ims4t4hnhZDLaE9Ad2AZXsQA0KKF+8lZSTOGG+7NvLCuEi/Rogyxidcuu9BbX4nI+tNWueZDMq0b+NvHyNwvr7JGLxUtWGdKm3KJ4I1oHvCxKNUNwB6UaU1tCdZyYBuX4JclqlAhibcN/aIjBJIgJ8sj5PwaVTuT6MpCxqwX37Vgh693oRY+d8ZOvIHr1zxWTNa8oyobJ87+DdXW6JOyP0igH8C5+oDyQnMaO7ku+ZqAYwxfa0b/3rHOmoyFrE+PUqBHzjHzOJEq5noZFrVsFEe459zSHsSIZoq+CAtvGRnjfQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(66476007)(76116006)(64756008)(55016002)(2906002)(44832011)(71200400001)(186003)(66556008)(66446008)(33656002)(66946007)(8676002)(6506007)(26005)(110136005)(5660300002)(122000001)(9686003)(52536014)(38100700002)(83380400001)(8936002)(478600001)(4326008)(7696005)(316002)(86362001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SmZZZ3ZMaXk0L1BzbEV4S1pYVWFOaG0zTWFkTGFIRFlNRjVKNnNYS2tUR2ZH?=
 =?utf-8?B?SXdGRkR0QTVpMi9UT3FBZEpwYldyTXUxMnYyRVBmN0tBWG9EdmkwTE9XUzls?=
 =?utf-8?B?Nmx3SnBOVklQVWRGeCszUWhEeTE5MlFhRE5VaFVzNW1iN203VC9WOTQ1MmJH?=
 =?utf-8?B?RTVqcC91QzJRMGFlQk1LRjFsNkdxMEM4d1daN3kyZ3JiY0k4UjJ2RGZCSTdP?=
 =?utf-8?B?OWJQczhyeFF0OGlPQXJWSzBTMWVOS2VnaVN4blFxVlhjb2ZtTk5PRW4rd2Vi?=
 =?utf-8?B?Y3hVekVnYU4xeVlEYUtlUWdndTY2dHhjT2t3cCtKcHBSNUozM0ZCTUpyTXhq?=
 =?utf-8?B?QXkzNjVQOHZEUUIvWTJ4aTc3LzJZNkxSU0xjWHdIVnZyYUl1UjhwNDdNZU5C?=
 =?utf-8?B?RkI4MFZQWW10QUNwSFI2alNwUytPeFk4cHJjRmtqNDJUWnZ4Q1Z4VUluU0RE?=
 =?utf-8?B?anFCRklvM2RDT1dpdXdiYUZYaFJvNDZ0UTZRS3k1NzRNVFZtWHlJN2dudXdR?=
 =?utf-8?B?b21SaEpTN2UyUG4ydHZKbzlYbTRkb2JDN1d3NWZWWk1qK01VcytsWTBaQmdQ?=
 =?utf-8?B?S1dMZTF2WnRMWFVIMlE1dm41UHZKWmo0eG9iaUZMVm1mMitkSW9QeUZmcTRk?=
 =?utf-8?B?K1lNQ21zRnA4ems0YnlVaWRkbHdWdENMYUdVU2gxMW9VWnU4bzhlSFBIbnM2?=
 =?utf-8?B?ekI1U0pkdjJnTG9kQkFkUEdiZnBIcld1Z3J2SlBLY0Nrb0JBWUtpZG8yeTdT?=
 =?utf-8?B?MGdSaEZuSVJmTStOdG9wdjFIakR2NEVFOGYzekFKSUp0UGQxK3Y4ODBqNFVM?=
 =?utf-8?B?L1A5NDNraVNkVVZhb0hEalQ1Mlk4WCtoeWlFYmNBT1pGQ3VMWFhBWG9tcElV?=
 =?utf-8?B?NGt1bnJwM2o5bWRLd1BEYzc3cUhSN0w2TVhNVU1xZm5RdWVjblN0b3BEVG1l?=
 =?utf-8?B?U0ZWM1BETXBjNXIxdmtUTFBCWnRyMExlaDgxaDZyeTV2dHdLRWNWZDFpZlRi?=
 =?utf-8?B?Vy9abXNUMi9WdlYzWTMzTTh5MGlsL2d3eC8xQTdxOENPeGxjcGVBODYyQk1C?=
 =?utf-8?B?WnFNUWRJczJJVjRLdWpETmFRV2FLZDNPTU9xNFlXSnBWSmdmbTI2SFN5ZUJX?=
 =?utf-8?B?dVVzZ3AzTWlyQTJOajRzTzFia1gzSlFNUE5SK3ZDeGJJY0V4YjAvS0hQaW85?=
 =?utf-8?B?Nm1Iem9Zd0pneHNNTmhjZllUS3hEWjVYMFVYdGhPSSttSE5zdTZ0Z25BVk15?=
 =?utf-8?B?b3JpTnd6VUJrOCt4Q2FFQ09JM3lGR2c0Nm5RZ0lmb0Z5aDc4U3orZUJiZzZY?=
 =?utf-8?B?ZWV6UFpqQ2dFZHZRR0FPazZxUnhQU1Ivcys1TVA3aFNxak5TR2c2L0Q2cU42?=
 =?utf-8?B?SVVjMUtsWnlLYzF3QWppaGVtSmM1TFREbTBHZzhuUWRzUGdlTTJhWGNNaEF5?=
 =?utf-8?B?TTI0UkViQm4yR2Z3eWxkMmhwTUtQRGt3dDhUdWlNUk43NjQ5UTR2L282TVND?=
 =?utf-8?B?SHl1bzl0NjJLT2lHb0prREhPYmp0QnE1Wk14SUtMSUtyd1NZMjhnOUZoSGEr?=
 =?utf-8?B?TGthcHhtSHQwMThuNU5yc3VUQ2dpVXY2L1dMK0VmQUhrTkwzS1NVL25ueUVV?=
 =?utf-8?B?N3ZieG1JamVvYjBHQWt5Nmc3UWZ3TjRudDBZSi9lcWRDa2VXNzZaRWJGOWcx?=
 =?utf-8?B?SHpqeW9LM09BUTVoLzRPdy9JSVRmSWdKN1lEYkVMUStMNGhqc2RXbFVoN2w2?=
 =?utf-8?Q?7VcyMH0PeU2Q1/7lUGl7cnfyT0PSAvwARmthJ4e?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49398be6-7f7e-4985-80ff-08d91c202d45
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 06:17:57.2517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aUvMSJaZePSkPVfKCW5eLkVz1LpLdbIMNmDZ6gxlEx5bKmR3AF9d+Y0j7oU+x5Z2FpCvLt89DO97cGAdCe+kYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6870
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIEFwcmlsIDYsIDIwMjEgNzozMyBQTQ0KPiANCj4gVGhlIGxwaTJjIGRyaXZlciBoYXMgYWRk
IHRoZSBtaXNzaW5nIGlwZyBjbG9jay4NCg0KUGxzIGRyb3AgdGhpcyBsaW5lIGFzIGJpbmRpbmcg
aXMgbm90IGRlY2lkZWQgYnkgZHJpdmVyIA0KDQo+IFNvIGFkZCB0aGUgaXBnIGNsb2NrIGhlcmUg
Zm9yIGFsbCBscGkyYyBub2Rlcy4NCg0KUGVyIGNsb2NrPw0KDQpNYXliZSBiZXR0ZXIgcmVmaW5l
ZCBhcyBhZGQgdGhlIG1pc3NpbmcgcGVyIGNsb2NrIC4uLi4NCg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQ2xhcmsgV2FuZyA8eGlhb25pbmcud2FuZ0BueHAuY29tPg0KPiAtLS0NCj4gVjIgY2hhbmdl
czoNCj4gIC0gTmV3IHBhdGNoIGFkZGVkIGluIFYyDQo+IC0tLQ0KPiAgYXJjaC9hcm0vYm9vdC9k
dHMvaW14N3VscC5kdHNpIHwgMTAgKysrKysrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy9pbXg3dWxwLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9pbXg3dWxwLmR0c2kNCj4g
aW5kZXggYjdlYTM3YWQ0ZTU1Li5lYjBkNGI4ZjYyNGQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL2lteDd1bHAuZHRzaQ0KPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg3dWxw
LmR0c2kNCj4gQEAgLTMyOCw4ICszMjgsOSBAQCBscGkyYzY6IGkyY0A0MGE0MDAwMCB7DQo+ICAJ
CQljb21wYXRpYmxlID0gImZzbCxpbXg3dWxwLWxwaTJjIjsNCj4gIAkJCXJlZyA9IDwweDQwYTQw
MDAwIDB4MTAwMDA+Ow0KPiAgCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM2IElSUV9UWVBFX0xF
VkVMX0hJR0g+Ow0KPiAtCQkJY2xvY2tzID0gPCZwY2MzIElNWDdVTFBfQ0xLX0xQSTJDNj47DQo+
IC0JCQljbG9jay1uYW1lcyA9ICJpcGciOw0KPiArCQkJY2xvY2tzID0gPCZwY2MzIElNWDdVTFBf
Q0xLX0xQSTJDNj4sDQo+ICsJCQkJIDwmc2NnMSBJTVg3VUxQX0NMS19OSUMxX0JVU19ESVY+Ow0K
PiArCQkJY2xvY2stbmFtZXMgPSAicGVyIiwgImlwZyI7DQo+ICAJCQlhc3NpZ25lZC1jbG9ja3Mg
PSA8JnBjYzMgSU1YN1VMUF9DTEtfTFBJMkM2PjsNCj4gIAkJCWFzc2lnbmVkLWNsb2NrLXBhcmVu
dHMgPSA8JnNjZzEgSU1YN1VMUF9DTEtfRklSQz47DQo+ICAJCQlhc3NpZ25lZC1jbG9jay1yYXRl
cyA9IDw0ODAwMDAwMD47DQo+IEBAIC0zNDAsOCArMzQxLDkgQEAgbHBpMmM3OiBpMmNANDBhNTAw
MDAgew0KPiAgCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14N3VscC1scGkyYyI7DQo+ICAJCQlyZWcg
PSA8MHg0MGE1MDAwMCAweDEwMDAwPjsNCj4gIAkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAzNyBJ
UlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gLQkJCWNsb2NrcyA9IDwmcGNjMyBJTVg3VUxQX0NMS19M
UEkyQzc+Ow0KPiAtCQkJY2xvY2stbmFtZXMgPSAiaXBnIjsNCj4gKwkJCWNsb2NrcyA9IDwmcGNj
MyBJTVg3VUxQX0NMS19MUEkyQzc+LA0KPiArCQkJCSA8JnNjZzEgSU1YN1VMUF9DTEtfTklDMV9C
VVNfRElWPjsNCj4gKwkJCWNsb2NrLW5hbWVzID0gInBlciIsICJpcGciOw0KPiAgCQkJYXNzaWdu
ZWQtY2xvY2tzID0gPCZwY2MzIElNWDdVTFBfQ0xLX0xQSTJDNz47DQo+ICAJCQlhc3NpZ25lZC1j
bG9jay1wYXJlbnRzID0gPCZzY2cxIElNWDdVTFBfQ0xLX0ZJUkM+Ow0KPiAgCQkJYXNzaWduZWQt
Y2xvY2stcmF0ZXMgPSA8NDgwMDAwMDA+Ow0KPiAtLQ0KPiAyLjI1LjENCg0K
