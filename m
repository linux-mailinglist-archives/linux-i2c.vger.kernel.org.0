Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C24A341465
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 05:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232090AbhCSEye (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 00:54:34 -0400
Received: from mail-vi1eur05on2074.outbound.protection.outlook.com ([40.107.21.74]:31516
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230459AbhCSEyH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 00:54:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUZJDh0rV5Mfhz3yVD4j4BswFoQR4D+q0IX9QvjOnaMe3IzakKGPl83Sd4xQqNcZyAzkqYiqzGpZz9Fg/Ub/0llXZdKgMgqKWdyU3HndcpRjxMk1q1z9ED/NAO9cFG8MGx6R8wFodmITlmuk6PLS7dkpbTLTRlt8QmkiLNnW0DRLxzxWxb9/enUcvRRtopN2pUP8EAjJrx1NWEu4FOt+nIPNv610ZObF4nnyNb1e5OafHEys07hvTZX2TiCSNxP6zkH2H5R+Eh0VVq4C36XyJdRkQiWMk8GboYaM3D9RSjOQR63WzvfJVRIyUzqNUeyONFK0LuJF0EEdiSD++6mfmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCTcWVCzGsthRtT0AoVKIpb1yrbujnmRgdj8gAxHibg=;
 b=dBDZCUB7I45B99bMHtibxQsA/PJtdn43i4bD1PanVAqRtoYqciFgmi35VaNnvcHvVQBgCsMPXXIbVkKfzviHN8T8IPTCkGZhUNJIpokvNyjNCrAdEebNlk0mwRFmFezXWYBDxdMb1dNIa4+SitYLyGU0GaffJ6kGBoUtubhbiAvYyMrtZlng4V80VHpovcKc9LjUaI0Kek0ftT1Buhrg3wt9sVa4ebDzj4NJ0XmGh4w+ooKAnGvrzt8zVQfTDdJtWQzk7uNZPNFktjpxesrDJDC8UPjki7L5UtdgyQbpLBlDl7fltpOF/wTChEG+a4LxqGfQTK0jomC09MmVLYnlew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCTcWVCzGsthRtT0AoVKIpb1yrbujnmRgdj8gAxHibg=;
 b=dtLofmNoM8WNKK9j/y3hipw51vrlrDPZAkSm8XMtkyDumVJjjHX2P13N1bAW1M1DJICCdbthMLf7iOPG7i3kJe16FJ9VN/WPgKMq8Md1XdPwZMv44fBRBILj3TTUaEG/1dqFcWdzAGYCnPhT4oKNbiPX3hp078wxPI37XQj9zdI=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR0402MB3895.eurprd04.prod.outlook.com (2603:10a6:209:1a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 04:54:03 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359%7]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 04:53:57 +0000
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
Subject: RE: [PATCH 04/11] i2c: imx-lpi2c: manage irq resource request/release
 in runtime pm
Thread-Topic: [PATCH 04/11] i2c: imx-lpi2c: manage irq resource
 request/release in runtime pm
Thread-Index: AQHXGvpRMC9RrtsTgkyXF7VMJ0eOUqqKwZxg
Date:   Fri, 19 Mar 2021 04:53:56 +0000
Message-ID: <AM6PR04MB4966C74D4E052317F22358C080689@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-5-xiaoning.wang@nxp.com>
In-Reply-To: <20210317065359.3109394-5-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0a6f2b1b-39be-4ab8-f624-08d8ea9300fa
x-ms-traffictypediagnostic: AM6PR0402MB3895:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0402MB38955E7305316136AA9B757580689@AM6PR0402MB3895.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bk38k3vaKnmmTceUuD3xhQnHTNYK/G5/H5EW1oa1hO262/xQWd+RSZCIiSzZg8jjuXJCbghCNNCqHEQap3YTT1DLtv7u0eZc2qku7Wh6qSHju7LBHv1fdxlj8kMMiMw1VyGlYszEgWAgzq0YhHtHdfUPyyv6ZdFqEvgJYS4xtXXiOtRFHieICwWozibyiuEtNDkqIZX4ojv7QInKWkKDt7BXWHkZmdBgJsYNYN+k4vVva5YsmkovG9wH2Rl1TEsSoZR/CJM7LlTrh2DvS/W8d+gvQkfQdEZlBb8DEh3vUa62vVbH85z0DGdXwfr3tObPGENdeY+VtzCyWVerLieIzmBxmu6EurK+IZQuq0uxYwvvari5tB9t7WIYrzh9kkVPewetWylziktuSn/GJEnTne4FvFU0isy52jtntTae5xRgotOoGHeiN0TMhGva/HoQiGTPLc9TCRO6QRz3A3mAxC5ydwD1KRF/GY8R6ArPm4CJ+82N7Hc+4fO5vuFU1gZ0DXtskNHRRWNc6fVrJzA0jqkpSgbY98fnK2lGF6y+QbV8mFQKSKeYbUjXNr4mx3AVHI8DT6ObEp+BfSZrmydCW/AUiSXmHRf+ZOO3Tv5f+i9b2AixZvcMhr0MAHUU9hRjKnIJ2d/aUj8Lz10BEBVb7/aXdq+Ksh7u2kwkdH3+Uz0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(6506007)(86362001)(38100700001)(2906002)(8936002)(8676002)(7696005)(33656002)(5660300002)(71200400001)(52536014)(83380400001)(26005)(55016002)(186003)(66446008)(66476007)(66556008)(64756008)(76116006)(66946007)(110136005)(9686003)(44832011)(54906003)(316002)(4326008)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?cUFZRzBuYmFmS0x2OVdjTURnRFFxWGhHdGt6cjNPSHRwbktjZkJaTUhDcCtZ?=
 =?utf-8?B?TFo4TG1vRy9uRVFNYmprUHcwNW5TY3cxT2lEYXliWjcwMmJrQVorSE9hcW1V?=
 =?utf-8?B?QzQ5ajR6SG5qaHliSk5mSG1rODFUM1JuWXo3eHlJekJwZFhVMHl5bWdHYzYw?=
 =?utf-8?B?NklPY0l6bXhzYXorWmoza3lDaHVtMWo2aHMxOUFaOVJlQmV5Z212aXNjbXk3?=
 =?utf-8?B?UWtTaTZUdTZ4bG51SlVIN3pBTVp1Z2ZQK1VlS29FRkxZR2d5THU3MklHZ25o?=
 =?utf-8?B?MnllSzlpNjNJVFFlYU5Vcm1YZ0ZnVWgrUzc2aFVQcUVCQXVSeUhGdmdDNmpY?=
 =?utf-8?B?MkN4WWh4dzBCRmxMOUVzSlFpU2ZWL29XNHhLQ0lYTExiU2x0ZmZsTFlUdzBx?=
 =?utf-8?B?Q0gyVHlacCt3Wk9XbThEUWw0eGVVUnRpTlpTSXNONDdQQ25POU9tdTk2Ukpx?=
 =?utf-8?B?SEFEeHA3VFAvTTVmcHlXTnlBd3lMYVE3YUdRR01VcEgvSGIzUzZHT0JGQXRk?=
 =?utf-8?B?MW4zZ1VSUStsREsyL0QyWHErNTI3OVcvZkhPSG8yQ1oxUCtZdGI1eUNRdzZq?=
 =?utf-8?B?T2NhZFVucVdRZjU4UG4vbGRjVFQvOU5oRHVaZ0JQbktnZll1d1NiRVk0dS90?=
 =?utf-8?B?cHFVendCS01HUjlaMkZ5TTNmQkltZVlBTGJtbXlmMFc4NXhjQjdibHZkZEh0?=
 =?utf-8?B?OXdGRFVwWStDbENhU2dOSVd0Z1h5SVorS0NvUkRoTUxueU01eGtVK2g5eG93?=
 =?utf-8?B?TmNDcVM2YkwzUlpwQkpmbHU5NXBvaWxONW9JU2E5Zm5hWE4yaGxJeGFSVkdG?=
 =?utf-8?B?MWY2UXBvM01Ka25rNVM0UGd6UW5GYXdsUGxWUG1vMTdCaUtFN21MVzh1bkc3?=
 =?utf-8?B?ZmFZNVlkY2VEY0Y1Z0tOVWM0eFZEeFl6a2E0ZEg2SVgwSHRyT0hudHduZVg3?=
 =?utf-8?B?WWZycVQ5T2pTd2xHaHU2SkRpQjdBZGpBaDdJbWthQWd1eGxFY0pIR3BVcVNP?=
 =?utf-8?B?Rlp4ZmRzRjV6c1RpZ3FJUDBXS3FjMVF3QXZFc01UbVpjd09kb2pZMUlFNEpZ?=
 =?utf-8?B?VE8zcS9QZU03N2F6QThrdVZVV3VKZ3RqZzJFR3FQblN3MG5wNlo1Z21lNkNW?=
 =?utf-8?B?cnM0a05jSmc4NXc1clBNOFZ4blJzcWlUS05SVXBtV3A4WXJLb1lGbEs1Uk1H?=
 =?utf-8?B?VytwY081clllbXFRNloxRnBWRzlvdERla0hZQzZ3Uy90ZU9nYjY4N2xhNVFF?=
 =?utf-8?B?eGZqVTB0cmhMZVFKVjYrRTdLL05YVkJpTnQzQWxzRVEyRVh3RUpGTFpsbmp6?=
 =?utf-8?B?U2xOaDNrVXdvTzhCdm5OSkRHcy9uZml6OE9rVCtocmZzeFh2Rk1QRzV4Zkh4?=
 =?utf-8?B?U3cya0U1Vko0Z1VwVUVhSDMybUVSQytGQU5HOWx3R1oxOHZwZHZ0dXIvemJ2?=
 =?utf-8?B?ZHA2UDZIR1Z4UkpKU3U2UmxvZ09MS1JoRGlQQVMvcU9uWTlkSGFtbzJTcVc4?=
 =?utf-8?B?TG5RTzRGNEJJdzR0S3VKSWplTlYrUVkvM3BKS2lVNi9ocnNuMmtoZXA0L2ty?=
 =?utf-8?B?SG1weUREL2RSaTc4U1pOM3VUbVZKTGtPc2Q1eGs4SUdaV2pGekdnMDkySjZ6?=
 =?utf-8?B?T0xzQ25tRDRVcXdiWWMrVFo5M3lVUVMzR2lQK0tTU1p3OWQ1clA2LzZjc0hB?=
 =?utf-8?B?QnRWNVpiY2hTOHB5cW9McjJSNWRLdk1CcVZXOW5mUklxdHUrOVdBaHFHUFB4?=
 =?utf-8?Q?rXDqKHkM8bbG6n/yFYmxvKTgQ/WszHwdkHGhGdv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6f2b1b-39be-4ab8-f624-08d8ea9300fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 04:53:56.9046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +BopyxFvbcvBRK9lxc5DpRoPKP19qsvXkZEPmC6ODhybguu8iVSaAoo7JWmVPSF27DbjqEpQ2r9f+FDegw2tdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3895
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTWFyY2ggMTcsIDIwMjEgMjo1NCBQTQ0KPiANCj4gTWFuYWdlIGlycSByZXNvdXJjZSBy
ZXF1ZXN0L3JlbGVhc2UgaW4gcnVudGltZSBwbSB0byBzYXZlIGlycSBkb21haW4ncw0KPiBwb3dl
ci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBGdWdhbmcgRHVhbiA8ZnVnYW5nLmR1YW5AbnhwLmNvbT4NCj4gUmV2aWV3
ZWQtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMgfCAyNiArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gYi9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jDQo+IGluZGV4IDY2NGZjYzBkYmE1MS4u
ZTcxOGJiNmIyMzg3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1s
cGkyYy5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gQEAg
LTk0LDYgKzk0LDcgQEAgZW51bSBscGkyY19pbXhfcGluY2ZnIHsNCj4gDQo+ICBzdHJ1Y3QgbHBp
MmNfaW14X3N0cnVjdCB7DQo+ICAJc3RydWN0IGkyY19hZGFwdGVyCWFkYXB0ZXI7DQo+ICsJaW50
CQkJaXJxOw0KPiAgCXN0cnVjdCBjbGsJCSpjbGtfcGVyOw0KPiAgCXN0cnVjdCBjbGsJCSpjbGtf
aXBnOw0KPiAgCXZvaWQgX19pb21lbQkJKmJhc2U7DQo+IEBAIC01NDMsNyArNTQ0LDcgQEAgc3Rh
dGljIGludCBscGkyY19pbXhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiAqcGRldikg
IHsNCj4gIAlzdHJ1Y3QgbHBpMmNfaW14X3N0cnVjdCAqbHBpMmNfaW14Ow0KPiAgCXVuc2lnbmVk
IGludCB0ZW1wOw0KPiAtCWludCBpcnEsIHJldDsNCj4gKwlpbnQgcmV0Ow0KPiANCj4gIAlscGky
Y19pbXggPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpscGkyY19pbXgpLCBHRlBf
S0VSTkVMKTsNCj4gIAlpZiAoIWxwaTJjX2lteCkNCj4gQEAgLTU1Myw5ICs1NTQsOSBAQCBzdGF0
aWMgaW50IGxwaTJjX2lteF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0K
PiAgCWlmIChJU19FUlIobHBpMmNfaW14LT5iYXNlKSkNCj4gIAkJcmV0dXJuIFBUUl9FUlIobHBp
MmNfaW14LT5iYXNlKTsNCj4gDQo+IC0JaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsN
Cj4gLQlpZiAoaXJxIDwgMCkNCj4gLQkJcmV0dXJuIGlycTsNCj4gKwlscGkyY19pbXgtPmlycSA9
IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7DQo+ICsJaWYgKGxwaTJjX2lteC0+aXJxIDwgMCkN
Cj4gKwkJcmV0dXJuIGxwaTJjX2lteC0+aXJxOw0KPiANCj4gIAlscGkyY19pbXgtPmFkYXB0ZXIu
b3duZXIJPSBUSElTX01PRFVMRTsNCj4gIAlscGkyY19pbXgtPmFkYXB0ZXIuYWxnbwkJPSAmbHBp
MmNfaW14X2FsZ287DQo+IEBAIC01ODEsMTQgKzU4Miw2IEBAIHN0YXRpYyBpbnQgbHBpMmNfaW14
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ICAJaWYgKHJldCkNCj4g
IAkJbHBpMmNfaW14LT5iaXRyYXRlID0gSTJDX01BWF9TVEFOREFSRF9NT0RFX0ZSRVE7DQo+IA0K
PiAtCXJldCA9IGRldm1fcmVxdWVzdF9pcnEoJnBkZXYtPmRldiwgaXJxLCBscGkyY19pbXhfaXNy
LA0KPiAtCQkJICAgICAgIElSUUZfTk9fU1VTUEVORCwNCj4gLQkJCSAgICAgICBwZGV2LT5uYW1l
LCBscGkyY19pbXgpOw0KPiAtCWlmIChyZXQpIHsNCj4gLQkJZGV2X2VycigmcGRldi0+ZGV2LCAi
Y2FuJ3QgY2xhaW0gaXJxICVkXG4iLCBpcnEpOw0KPiAtCQlyZXR1cm4gcmV0Ow0KPiAtCX0NCj4g
LQ0KPiAgCWkyY19zZXRfYWRhcGRhdGEoJmxwaTJjX2lteC0+YWRhcHRlciwgbHBpMmNfaW14KTsN
Cj4gIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBscGkyY19pbXgpOw0KPiANCj4gQEAgLTY0
MCw2ICs2MzMsNyBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkDQo+IGxwaTJjX3J1bnRpbWVf
c3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpICB7DQo+ICAJc3RydWN0IGxwaTJjX2lteF9zdHJ1
Y3QgKmxwaTJjX2lteCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiANCj4gKwlkZXZtX2ZyZWVf
aXJxKGRldiwgbHBpMmNfaW14LT5pcnEsIGxwaTJjX2lteCk7DQo+ICAJY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKGxwaTJjX2lteC0+Y2xrX2lwZyk7DQo+ICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGxw
aTJjX2lteC0+Y2xrX3Blcik7DQo+ICAJcGluY3RybF9wbV9zZWxlY3RfaWRsZV9zdGF0ZShkZXYp
Ow0KPiBAQCAtNjY1LDYgKzY1OSwxNCBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkDQo+IGxw
aTJjX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIAkJZGV2X2VycihkZXYs
ICJjYW4ndCBlbmFibGUgSTJDIGlwZyBjbG9jaywgcmV0PSVkXG4iLCByZXQpOw0KPiAgCX0NCj4g
DQo+ICsJcmV0ID0gZGV2bV9yZXF1ZXN0X2lycShkZXYsIGxwaTJjX2lteC0+aXJxLCBscGkyY19p
bXhfaXNyLA0KDQpJIGd1ZXNzIHVubmVjZXNzYXJ5IHRvIHVzZSBkZXZtIGluIHJwbQ0KDQo+ICsJ
CQkgICAgICAgSVJRRl9OT19TVVNQRU5ELA0KPiArCQkJICAgICAgIGRldl9uYW1lKGRldiksIGxw
aTJjX2lteCk7DQo+ICsJaWYgKHJldCkgew0KPiArCQlkZXZfZXJyKGRldiwgImNhbid0IGNsYWlt
IGlycSAlZFxuIiwgbHBpMmNfaW14LT5pcnEpOw0KPiArCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4g
Kw0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo+IA0KPiAtLQ0KPiAyLjI1LjENCg0K
