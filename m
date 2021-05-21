Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1102838BF50
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 08:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbhEUG3x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 02:29:53 -0400
Received: from mail-eopbgr70045.outbound.protection.outlook.com ([40.107.7.45]:43673
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232372AbhEUG3w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 02:29:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZ/9bEzPOatx81UEmnp1UjAqBWnSck1bHPe2wXbszucrTVtYZlnoLKhfgwF4EzQNWVs8NgPljFkvss+a0/jopVMuoetzazWw++GaHhDLBRNPEMGFQliP5Sv+xr7bZvPHk0AnaxMdIWNrMO1GlPCpbomdaCYS17xrE+mBSwIuWowtLZlPf12L7SLyj4pvFUgItqNY97LeOA2dMt1KlKHkORLw63SOB7UiwYI49eEKNIJ/HoQRxkGgt27jKq1rKC7Wrzm8WQ8dN01Pv+lqueiGO/nOE/QFGREKyjh/aQJGZQlsNCqkkjw30OrbQ7UzF2e72e5saKQf8wqT7I+BW/XaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0pdOSh/0KvWLeg0WGhkiboEJxyMUJF9ku5hNf829b8=;
 b=eBx11WcvzShAd5xjAhNvo5xY55KfWDFvLqiMJUG1aGih7JdjO4IWUELTC5eTftPHmlOZECM00IsBdMRR/rw8bsuo//vS/MbByKBN2RE7Qstao79k47i9WSfSGRwcVwSAIqkTQo9YLP6D6MNohw3dp6XGLPeNJIDfJvjarP8E+G9eyijuBM+HAYwuZjUuFMBAFAgCdzqzagODOb7P0FVoVkFz7+IbXuE05GrIDIfQgE/y+2VErJ/zRfv/MMRjDztUO2WU6NBE/fHD4miw5dX6eMnKNViO3K/NdYRHhAnt6qKONLkz7d5irRz05cxGgSblu4b5ojQPSdzkX7jhBSbkCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0pdOSh/0KvWLeg0WGhkiboEJxyMUJF9ku5hNf829b8=;
 b=pYD6gKRQremY7JDV/AnW9ozBvUY8ShnUFLx923B4MI6uYOx7iDav/GmcCSvC4wJ2AFhCD0kpXRwartxJ01da4ltYaotuO2yOtVn1dxDVZPSE4A6TL8U0QJyYoWnlRgd6iuWf0FuF1cKnvFD6ZmCsbr9KMF/QIk1RXV4pGQSN+Ko=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM7PR04MB6822.eurprd04.prod.outlook.com (2603:10a6:20b:108::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 21 May
 2021 06:28:26 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 06:28:26 +0000
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
Subject: RE: [PATCH V2 05/18] ARM64: dts: imx8: add the missing lpi2c ipg
 clock
Thread-Topic: [PATCH V2 05/18] ARM64: dts: imx8: add the missing lpi2c ipg
 clock
Thread-Index: AQHXKtii7AYaPRn+PEC0FZOO36S5x6rtvtFw
Date:   Fri, 21 May 2021 06:28:26 +0000
Message-ID: <AM6PR04MB496691CD8FF18ADC78440C3180299@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
 <20210406113306.2633595-6-xiaoning.wang@nxp.com>
In-Reply-To: <20210406113306.2633595-6-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5dd400f8-9084-4c97-35a8-08d91c21a485
x-ms-traffictypediagnostic: AM7PR04MB6822:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB6822A0BB2C69719E115D8A5480299@AM7PR04MB6822.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jU56qvKuiCG3hYAQp/57baBu7L1Q5PkwphZ0InoC6ovDbBp67XDxpfZHQgCGSY0LXziZudJQnlVHJlS0X5cZ1KQFsiRoDU71YzJQztepSPD0/psc6DlrNlacP4PnEYoBDPJeXyIzeADxgJYfV9qaC1ts8jYWyOzVvlWCdpl/UpJ9CwWMhPFS4L101oC2tx7zuNJWwh7PmnDNMV54XRDkHQu8gQeDAc25bOK3GEIU6mjxnMkkFNPzOo44s9I6RSob3I0mTcN1qI0ir5Le6JgVaW4N0q8AoZ6oHO1lru9hETrTu3rn3Opcv/DBMTrmomdM58FYUjAsh8NB+biy4Oy2YchOZGyJhz0xUDc8zqR0PymFI376CWDKl7yTxJXz+IHLrqsZ5fxihr0myisq3AOhQcu9a6GUeyZMfwXTCWd0HRFHUQEwhQdE721WR6M6NurrKalxOHk1wT5OADMUSGeUkjsu9D0r1K8b9ERaWyIbAOBHlmey8RVh/cY0tJIi48vBzT7JcMZSaB1N0nucJUlhARPDc+lVvgAXbwZbWXzzRNWuvyt7I8GfT04qxKR6ivSzbSNjdEy18qr5EJ2a/Xkb+MvgtD7Z7BOjXZ/O4SWEOuo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(26005)(55016002)(2906002)(33656002)(7696005)(6506007)(52536014)(4326008)(83380400001)(71200400001)(9686003)(66476007)(86362001)(122000001)(44832011)(5660300002)(38100700002)(316002)(8676002)(478600001)(64756008)(66556008)(66446008)(54906003)(8936002)(110136005)(186003)(66946007)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?WHVTd0JEYmx1S1phb25GdkMxRVUyREFiZWVHWWdSYTVrVTMzWWlsUHJ1MHBZ?=
 =?utf-8?B?TkNIbHo2eDUxWXBPekFjZUNNY3R0TDJ2eWVhd3QrMVU5NlVKZEt0eGJhZ0FE?=
 =?utf-8?B?UDZKc0x1bEZyT3NUbDNGcXl3cHdtbWtHS3kwVGx0WEhuelpmR3hjNFhkSEZR?=
 =?utf-8?B?UWxvL2xMb0sxajZ4MEtZczBiQUdCenIraGM1WFJMOFBDWnRkK0FTa2hTR1VL?=
 =?utf-8?B?YVZtVC9rK2ZNT3BWRUVDMEgxdFRHRzVscDg3djBYSlBQUkdTaSszYnN3Njcv?=
 =?utf-8?B?QTUyRjdFekMxZk84ZVVhTnI5Y3ZQbWVibXp0VEQ0andoWDlBVDB4WlZObkF5?=
 =?utf-8?B?dHhHNzdTTXgzME9vUW5qQS9CZFl6aUZ2L3FrdHlTZEw3NlRaMm5WeVRLdVVs?=
 =?utf-8?B?WWNNaE1RcEt3ZmR5RnF3WVdwRUJROW40NXpsQlQ1VFFOZkMyVmQ3eWRyZ3Rk?=
 =?utf-8?B?UElCYXlZRW1nQWtrSjNaRTFoVkFOYkJOS29IdWxteWkzVGEySVM0eUFCMG1j?=
 =?utf-8?B?NkVvbzN0cGgvWERjUTNsc0RDdFBSYlVnSHBoalVQT1R4enpLU1hON1pzSnJJ?=
 =?utf-8?B?cTljcnBLRTBvWUJJbzlGU2ZJaG5aR01Qa3FibW0rVHV1OWZNeFBySG1oNUxS?=
 =?utf-8?B?YWc3TlhuT093dEhpcEIwSEZTSkZBMnY0Mk1uUnN4amFBUGovSUVwdFlhUGtJ?=
 =?utf-8?B?aFFONHpTMjZxd2pCT3RHZmNnNlkwYVdwaDRMVWxUZzBOQmtBblFuZFdUTTcv?=
 =?utf-8?B?TjB1L2NMMVpVU1hXeDkwWGdBU0s2ZlFqVUtlWW16NjFWNTNDUGJvOUF0WFlD?=
 =?utf-8?B?dUFoSmZvdjJ4NkFvNnhZODNpU3RhZU5lZFVHNCtQbFNTRXltUkw4NXRXSXRW?=
 =?utf-8?B?cTQrei9ubGQrQkk3VkNBTVluWW1hOVZMTzBRUFRrVk1oOHpGTW5kZWlzRG9K?=
 =?utf-8?B?WFBmTllOS0p3VFZxWE83WmhIQktrTGxFeVVycjlpeGVqazVNWFAxNzN4c01l?=
 =?utf-8?B?bjNycG81OGFyNUp2RVlYZlMyRzcyNis0bkpjZVRHYkJ1Rk1jdUJQeVlTRG5h?=
 =?utf-8?B?T2xGKzVjTzR6TmhIUHBnSUI1SnZZQWxPRmlsYVBoYmVnZWRXcEJ0UkZxenJN?=
 =?utf-8?B?MEpkSENCZTBkYUJkY0tpeEZPOEF6cHVtOElNckM1UWN6VXBuRzNVZm81TE16?=
 =?utf-8?B?aGNqRGNFRGVwVmx4Z29YaGUydWY4Y3lLUlFQcjhYQ2dKR1NFalZvL1lncFA0?=
 =?utf-8?B?a0FhNEsxS1BQRTJGMU9sazlaSGRabCtQMzhTcmJramFkaDluVlNOWVdQT2dM?=
 =?utf-8?B?UEJIV0piYUJrcmxxNFIzbmhSZDRzYTZoZXdaM1ZvUnc5aW5WNjdVV21SY0xl?=
 =?utf-8?B?V2NTajkrdk1yS0p2bU9yamVOaVpPbGNUMzlPVnJNZDkwQnRNMEN6Z1R2a0dJ?=
 =?utf-8?B?NndhV21JMEt0bEIzR0VDT2RiRW9ua0UvZzVjYVhSN2tqeUFKczJPbVI0VlRi?=
 =?utf-8?B?cVh6cFNYNVl1ZGFOLzlqdmM0bmloZGs3ZTVkVG9EeThJTTdjSjNCT2RnRzhl?=
 =?utf-8?B?RDk4WlRKU0RqTkJ0RDl2allZUldFY1ZiZDF4Smx6ZWMwTU03ZFNRWlIybnd2?=
 =?utf-8?B?UGtPajZEM3hyQmMxKzVwd3FhaC9sRVh5aWtMY3ZHMHNXTE9xOUJvTzlJckdD?=
 =?utf-8?B?NVpVVFg4a1gwblQ2UkdvN1cxMEI3TTh0U3BIekE3eHVEclAyVXFlWkxLVFJX?=
 =?utf-8?Q?8tDSCFUiNYr6OlJ1ElFmKWlKIcL89jvh+q7t8/o?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd400f8-9084-4c97-35a8-08d91c21a485
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 06:28:26.8388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WghKtjKfJ/XrAA1CnQqqScFoQdBsM9hdEhECxIzo9iWe1jRl0PE2bAjsGtdDItOqb6TAMMu9oz02b5JpD0RtnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6822
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIEFwcmlsIDYsIDIwMjEgNzozMyBQTQ0KPiANCj4gVGhlIGxwaTJjIGRyaXZlciBoYXMgYWRk
IHRoZSBtaXNzaW5nIGlwZyBjbG9jay4NCj4gU28gYWRkIHRoZSBpcGcgY2xvY2sgaGVyZSBmb3Ig
YWxsIGxwaTJjIG5vZGVzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2xhcmsgV2FuZyA8eGlhb25p
bmcud2FuZ0BueHAuY29tPg0KPiAtLS0NCj4gVjIgY2hhbmdlczoNCj4gIC0gTmV3IHBhdGNoIGFk
ZGVkIGluIFYyDQo+IC0tLQ0KPiAgLi4uL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNz
LWRtYS5kdHNpIHwgMjQgKysrKysrKysrKysrLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1kbWEuZHRzaQ0KPiBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3MtZG1hLmR0c2kNCj4gaW5kZXggOTYwYTgwMmI4YjZl
Li5iNWVkMTJhMDY1MzggMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDgtc3MtZG1hLmR0c2kNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OC1zcy1kbWEuZHRzaQ0KPiBAQCAtMTExLDggKzExMSwxMCBAQCB1YXJ0M19scGNnOiBj
bG9jay1jb250cm9sbGVyQDVhNDkwMDAwIHsNCj4gIAlpMmMwOiBpMmNANWE4MDAwMDAgew0KPiAg
CQlyZWcgPSA8MHg1YTgwMDAwMCAweDQwMDA+Ow0KPiAgCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkg
MjIwIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiAtCQljbG9ja3MgPSA8JmkyYzBfbHBjZyBJTVhf
TFBDR19DTEtfMD47DQo+IC0JCWNsb2NrLW5hbWVzID0gInBlciI7DQo+ICsJCWludGVycnVwdC1w
YXJlbnQgPSA8JmdpYz47DQoNCkFkZGVkIGJ5IG1pc3Rha2U/DQoNCj4gKwkJY2xvY2tzID0gPCZp
MmMwX2xwY2cgSU1YX0xQQ0dfQ0xLXzA+LA0KPiArCQkJIDwmaTJjMF9scGNnIElNWF9MUENHX0NM
S180PjsNCj4gKwkJY2xvY2stbmFtZXMgPSAicGVyIiwgImlwZyI7DQo+ICAJCWFzc2lnbmVkLWNs
b2NrcyA9IDwmY2xrIElNWF9TQ19SX0kyQ18wIElNWF9TQ19QTV9DTEtfUEVSPjsNCj4gIAkJYXNz
aWduZWQtY2xvY2stcmF0ZXMgPSA8MjQwMDAwMDA+Ow0KPiAgCQlwb3dlci1kb21haW5zID0gPCZw
ZCBJTVhfU0NfUl9JMkNfMD47IEBAIC0xMjIsOCArMTI0LDEwIEBADQo+IGkyYzA6IGkyY0A1YTgw
MDAwMCB7DQo+ICAJaTJjMTogaTJjQDVhODEwMDAwIHsNCj4gIAkJcmVnID0gPDB4NWE4MTAwMDAg
MHg0MDAwPjsNCj4gIAkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIyMSBJUlFfVFlQRV9MRVZFTF9I
SUdIPjsNCj4gLQkJY2xvY2tzID0gPCZpMmMxX2xwY2cgSU1YX0xQQ0dfQ0xLXzA+Ow0KPiAtCQlj
bG9jay1uYW1lcyA9ICJwZXIiOw0KPiArCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+Ow0KDQpE
aXR0bw0KDQo+ICsJCWNsb2NrcyA9IDwmaTJjMV9scGNnIElNWF9MUENHX0NMS18wPiwNCj4gKwkJ
CSA8JmkyYzFfbHBjZyBJTVhfTFBDR19DTEtfND47DQo+ICsJCWNsb2NrLW5hbWVzID0gInBlciIs
ICJpcGciOw0KPiAgCQlhc3NpZ25lZC1jbG9ja3MgPSA8JmNsayBJTVhfU0NfUl9JMkNfMSBJTVhf
U0NfUE1fQ0xLX1BFUj47DQo+ICAJCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDI0MDAwMDAwPjsN
Cj4gIAkJcG93ZXItZG9tYWlucyA9IDwmcGQgSU1YX1NDX1JfSTJDXzE+OyBAQCAtMTMzLDggKzEz
NywxMCBAQA0KPiBpMmMxOiBpMmNANWE4MTAwMDAgew0KPiAgCWkyYzI6IGkyY0A1YTgyMDAwMCB7
DQo+ICAJCXJlZyA9IDwweDVhODIwMDAwIDB4NDAwMD47DQo+ICAJCWludGVycnVwdHMgPSA8R0lD
X1NQSSAyMjIgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+IC0JCWNsb2NrcyA9IDwmaTJjMl9scGNn
IElNWF9MUENHX0NMS18wPjsNCj4gLQkJY2xvY2stbmFtZXMgPSAicGVyIjsNCj4gKwkJaW50ZXJy
dXB0LXBhcmVudCA9IDwmZ2ljPjsNCj4gKwkJY2xvY2tzID0gPCZpMmMyX2xwY2cgSU1YX0xQQ0df
Q0xLXzA+LA0KPiArCQkJIDwmaTJjMl9scGNnIElNWF9MUENHX0NMS180PjsNCj4gKwkJY2xvY2st
bmFtZXMgPSAicGVyIiwgImlwZyI7DQo+ICAJCWFzc2lnbmVkLWNsb2NrcyA9IDwmY2xrIElNWF9T
Q19SX0kyQ18yIElNWF9TQ19QTV9DTEtfUEVSPjsNCj4gIAkJYXNzaWduZWQtY2xvY2stcmF0ZXMg
PSA8MjQwMDAwMDA+Ow0KPiAgCQlwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9JMkNfMj47
IEBAIC0xNDQsOCArMTUwLDEwIEBADQo+IGkyYzI6IGkyY0A1YTgyMDAwMCB7DQo+ICAJaTJjMzog
aTJjQDVhODMwMDAwIHsNCj4gIAkJcmVnID0gPDB4NWE4MzAwMDAgMHg0MDAwPjsNCj4gIAkJaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDIyMyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gLQkJY2xvY2tz
ID0gPCZpMmMzX2xwY2cgSU1YX0xQQ0dfQ0xLXzA+Ow0KPiAtCQljbG9jay1uYW1lcyA9ICJwZXIi
Ow0KPiArCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+Ow0KPiArCQljbG9ja3MgPSA8JmkyYzNf
bHBjZyBJTVhfTFBDR19DTEtfMD4sDQo+ICsJCQkgPCZpMmMzX2xwY2cgSU1YX0xQQ0dfQ0xLXzQ+
Ow0KPiArCQljbG9jay1uYW1lcyA9ICJwZXIiLCAiaXBnIjsNCj4gIAkJYXNzaWduZWQtY2xvY2tz
ID0gPCZjbGsgSU1YX1NDX1JfSTJDXzMgSU1YX1NDX1BNX0NMS19QRVI+Ow0KPiAgCQlhc3NpZ25l
ZC1jbG9jay1yYXRlcyA9IDwyNDAwMDAwMD47DQo+ICAJCXBvd2VyLWRvbWFpbnMgPSA8JnBkIElN
WF9TQ19SX0kyQ18zPjsNCj4gLS0NCj4gMi4yNS4xDQoNCg==
