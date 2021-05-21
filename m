Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020E338BF65
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 08:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbhEUGdw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 02:33:52 -0400
Received: from mail-vi1eur05on2052.outbound.protection.outlook.com ([40.107.21.52]:54241
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231895AbhEUGd2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 02:33:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGJS006PFSplTKYwPxuHTSj4sguOjyisL9jnYR5ZLMBtT1gfu1D+VFpEeX/GhOjgvnQNs0LCHx1rcCRakyEwJ0aWHnQFKAbzyKUlcGEl2R4A0/nOzf2U1Y168neIgnXImIt/Dys0jz4u9U6cm68cLQ5IZrIaFzAe4AD03UompVZA+JnNiO/VnvFRlqyTMPGDv0aWqEJL429dQZu4L3ABYRPLtEw2MjiNOnpjqgyOrxJgBu+5GjMarUy9AV5a/avIf+hvTzgIa6A40CC2uok3fRVsMJpl5em7iC+tHMHuc/Mfs3HOJ8ewQnltIC9tCq9fiyxbQBO9egiadvjGewu5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDg5DLvoqMW/wsRlGZ228UzdXIOOlpjwN/zG6Iz6fSc=;
 b=aTSQ8W9j16lyOb3om+u/TzgT4z29yg+V8q88K7+9ZTdx9fx+nEJoS48savcfqV15OPhFoThyvMp82ER52pPWtXxtkMe6JgFlgTUe0nBdnEP35RDX7Q0D67CP6oehEPlc9tykZ/LPsy2v1EATQDQKyfPzlCPxiQye5GZLA3ztaMRCiyrDxmwc5tQcPfkNUgr+ntExpASBHRILyOsGh1eF5rJ5bR08t12na0cKnnBN9FaiXQMoKXS9UyGuxukFXpn5CxlAZjQs7nmvZ2n0cNkNgWkT1fXJXiPbO7ajaV3CRztFIE+YnyHM+pAdlQJNhozEpyz/nRs1cCkuevwbpHI5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDg5DLvoqMW/wsRlGZ228UzdXIOOlpjwN/zG6Iz6fSc=;
 b=qWLGDQ3HC0UYcvdUM6dr3Wj4K1zXLhRdtBybfSJKPk0Mntu0v7VL/pBhD3IhFdBJKtNsqueXQAis/LGGYAxXf+0ip9epsBrM2MF+CsfZhtfed3IlTo5Kgx3fS0/ilL9BgTamADxKoCv5Q09rGKysJ/yEboQf5czTQRFYJa8KMJE=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5701.eurprd04.prod.outlook.com (2603:10a6:20b:a5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.29; Fri, 21 May
 2021 06:32:03 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 06:32:03 +0000
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
Subject: RE: [PATCH V2 06/18] ARM64: dts: imx8: change i2c irq number to
 non-combined
Thread-Topic: [PATCH V2 06/18] ARM64: dts: imx8: change i2c irq number to
 non-combined
Thread-Index: AQHXKtilUkfTwCE7IkGvoaoEYmSS/6rtv2uw
Date:   Fri, 21 May 2021 06:32:03 +0000
Message-ID: <AM6PR04MB4966604A846E815BAD8EC7C480299@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
 <20210406113306.2633595-7-xiaoning.wang@nxp.com>
In-Reply-To: <20210406113306.2633595-7-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9403ad4-65e7-494e-e22e-08d91c22259c
x-ms-traffictypediagnostic: AM6PR04MB5701:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB570192279D3FD683E36B7C5D80299@AM6PR04MB5701.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aeWpDtDHMf4Svbyl6tofnsf+vUtXewKEmywFp9n/ZH2MqEg02UFXrGy+bFcO7BcQ987QD0EBEp/vETWpGxAHs0AB7zkpY1YvYrVjwNhi9uaqyxVFZJrakRbwEWlc424VHYwtaHlYsCNx98r70heHYczI8fB1Fsd0wuXcotHha2CHlIAWbakT7TbFQK9+xLFKmUVePxuuowbjCj7wkI3KxZOumrK2+MA71XTCrE57S/JUQKZXI4EoHOoNj1XsLY6ZD5zJt3guf4mVVhaJcUC7rwF9XT+RVDDK3HO5mv6kmfjdJgUKxPZvBBU/HcFcUmeuaci9mHb2eaNFlwmZhvnl56fL52GCr/NJFDlEGUsy4j665lisZ/xGxiPpmgySCejpMMcT9V7DRYjC1OKuO/s8D4CO5zylHvdg8+SWBd/XQ1oBdVgMPRQpdvZI4FqenWP9BQqKJ0KWWf2sTO4shgmt3qwoWuT7BVuNfT37Uu1tTbu1gvlo8+qcL8YnPKLsVyrV3QmbGUNltRDYJB4Ufqij46/hQ4mS+J71pdsEa19ZH3qNZHY9bniZwqt3adTzRbLZ+r2lKerchbOD2K52+jb3MiBteQGKh9F3DRm/CuGZIdw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(2906002)(44832011)(52536014)(6506007)(122000001)(9686003)(8936002)(478600001)(7696005)(8676002)(55016002)(38100700002)(64756008)(5660300002)(71200400001)(26005)(83380400001)(76116006)(66556008)(110136005)(54906003)(316002)(186003)(66446008)(86362001)(4326008)(66476007)(33656002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?bzN4QWxESnhYOGJZZ0dDNm5ZRFlSbHQyZzQ4eGQ1amswMDBPeGJ4TFJIRzJK?=
 =?utf-8?B?ZFB3RU1wTFFTLzFRMldJWmlGNi9qbVc0SXVrOWdZNWFETUFWOFdIRytaUGlL?=
 =?utf-8?B?azJIcnNvTmhEZVZkMWlwR0lzY0NCdDE3WnZNaGlsd2pGR29JblRJNHV6bUVp?=
 =?utf-8?B?VFNIN3FRbUUxUFZObS82NGNZWHZqQitlc2xkaHNEL3F5OXpUTy9EeStLMlla?=
 =?utf-8?B?azcyOXJ1REMvczk1L3VMY1M2RlhXdTZEWHAxZVlVMkl5M25Rd3VJZVhHdmdP?=
 =?utf-8?B?U1RlRjVNdkRKMEdvbThFZ0ppMi9xR2NOUktTbmgzR3g1SFZicFY3d3I2TjNq?=
 =?utf-8?B?Uzc5Q1R1dDBrZHE2LzZHWHIvQy8vNjVRWGpTekFsWkFkRktsSU1Rd2oySG1q?=
 =?utf-8?B?S244aitZeUtDOFhkRzZzNnpmMnk4cC90YVVSNW5KVitOcFBIRStMZFNZV3dK?=
 =?utf-8?B?ZlpPYm96bDdJak42SDZCSTZYdFR5L0g4TVgwZWZlTklCR0V3T0RJeWFBeDdD?=
 =?utf-8?B?ajA2cmh2ZEEybElaSmdQV3RzdjhuWi9ydU1Eb2dQS1hjeDNrQUVndWRuUmZs?=
 =?utf-8?B?YzBaZ3ZUQVI3Q2xPTUxjRnNrYVVFdjZWdEN0Tjk5R0c5L0pBWm5FdEVUZ3Zt?=
 =?utf-8?B?L0tFN2k2dDlhL2w3ZUtzR1NyOTh6Z2hNY0gxcjdOanNzOFp1cTFTckQrWWVy?=
 =?utf-8?B?aU13T1FUa2F3RStKT1E3SFpQSlNnQU1EOFZ6OWZKZFllMFNVZDFEdldmdkY2?=
 =?utf-8?B?RzkwblNwSEk2TDdQKzFubldCSjAyRVZDclA5SkJlSkhuVGc5UVdReVNmLzZW?=
 =?utf-8?B?L0JRQWhPUVc4b0wza1RUMEhOS0VOdzNVOUlkSXhYOTd3OFUwMTNCNVFKTk05?=
 =?utf-8?B?NXIxV0hxckxmYlBWampzckxhcmdLTjBXK2hBd3pGak92anVCNWlNNmh3azcx?=
 =?utf-8?B?elVNTW9KNGJSUFJFZWRiMmFyenUwdE5iQlFEbURMSFY2T0dsTGtrcEVmY3hG?=
 =?utf-8?B?ZCtqWjhJdVR2WWtBdkVGODFFcjEvcldBemhSb0VkbGNyZHQ4eG1nSm9ONXYz?=
 =?utf-8?B?Tlp0eVdSWE10b1hNbjZMMTNKZk96eDVUSmhsZTVqUzhveHFuSkU1NDNhYVRW?=
 =?utf-8?B?d3pzZmJ3a2JvRGc2Z2RKWFBsUmhnQVN1RVBuVzlacjRHV2o4cXhsVUJFanZZ?=
 =?utf-8?B?RklzeWlSTE1pM2daYlhITE1XT0JzaEVQdmxXZ3I3MWlEaithUVlvUjUwekVJ?=
 =?utf-8?B?UXlkbFpFSTc2U09KUUVOR0xPU1d1WmdFdWUvZWpmV1hXQ0tmREU0SWtPWE9M?=
 =?utf-8?B?UlgycUp1akNKS0l4QlprT2RCeHp5R2xZOUZoZnJ0djd6elMzMm10bkV2a21X?=
 =?utf-8?B?TS94QzdENkhsOXdHR0YrbGsrdUtRQmxxaVh6T0hQVzFnemloVk1vMzhwa1M5?=
 =?utf-8?B?ekJ3VFFHY2F5NGx5ekI0ektmLzdWcXNHczcwY0NHSlRsWEZaL3phdWwwMDlu?=
 =?utf-8?B?ZmJPZDBsUlA5UXlqR2FrbnAvZFZmbFFqWi9rK3UrMjhaa0tuRDdhMkREMXJr?=
 =?utf-8?B?TGJkVEJKc3lPTlJ5dHF4bXZQd3JlM1crVW80bUlJcDYzTk1UdWh0REFPZUNo?=
 =?utf-8?B?cjhrT29IaENaVld6Z3M3eE51d0VZVkVxS1BOeGxidnB5VzNVRGsyVlZLNmh4?=
 =?utf-8?B?bjZQNmEzWlYxZjJiOGlOVFo0cGRVVkRGTGs3QWh6UEhBNTZGekdMa0gydDZP?=
 =?utf-8?Q?OL04wK/WqM58zFGT7a2yA/pGfW0usQqpg31+r41?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9403ad4-65e7-494e-e22e-08d91c22259c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 06:32:03.4400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B+mP9ofQ4AWzmn0sXxVipey203NLdMlYYuuLay5OKpY5esXm172xaCMHn0Wnh27wez97QQHwA9hobkSKrQ6Mrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5701
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIEFwcmlsIDYsIDIwMjEgNzozMyBQTQ0KPiANCj4gQ29tYmluZWQgaW50ZXJydXB0IG51bWJl
ciBtYXkgY2F1c2UgdW5leGNlcHRlZCBpcnEgZXZlbnQgd2hlbiB1c2luZyBETUENCj4gYW5kIHRv
byBtYW55IGludGVycnVwdHMgd2lsbCBiZSBnZW5lcmF0ZWQuDQo+IFNvIGNoYW5nZSBhbGwgaTJj
IGludGVycnVwdHMgbnVtYmVyIHRvIG5vbi1jb21iaW5lZCBmb3IgaW14OHF4cC84cW0vOGR4bC4N
Cg0KU3RpbGwgbm8gbXg4ZHhsIHN1cHBvcnQgaW4gdXBzdHJlYW0sIEkgZ3Vlc3MgaW14OCBpcyBl
bm91Z2guDQpCVFcsIHBscyBjaGFuZ2luZyB0aWxlIGZvcm1hdCBhcyBiZWxvdyBhcyBwb2ludGVk
IGJ5IFNoYXduIGluIGFub3RoZXIgcGF0Y2g6DQphcm02NDogZHRzOiB4eHh4DQoNCk90aGVyd2lz
ZToNClJldmlld2VkLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KDQpS
ZWdhcmRzDQpBaXNoZW5nDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENsYXJrIFdhbmcgPHhpYW9u
aW5nLndhbmdAbnhwLmNvbT4NCj4gLS0tDQo+IFYyIGNoYW5nZXM6DQo+ICAtIE5ldyBwYXRjaCBh
ZGRlZCBpbiBWMg0KPiAtLS0NCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgt
c3MtZG1hLmR0c2kgfCA4ICsrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvZnJlZXNjYWxlL2lteDgtc3MtZG1hLmR0c2kNCj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg4LXNzLWRtYS5kdHNpDQo+IGluZGV4IGI1ZWQxMmEwNjUzOC4uOWJhNTdmMDQ4
NTliIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNz
LWRtYS5kdHNpDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3Mt
ZG1hLmR0c2kNCj4gQEAgLTExMCw3ICsxMTAsNyBAQCB1YXJ0M19scGNnOiBjbG9jay1jb250cm9s
bGVyQDVhNDkwMDAwIHsNCj4gDQo+ICAJaTJjMDogaTJjQDVhODAwMDAwIHsNCj4gIAkJcmVnID0g
PDB4NWE4MDAwMDAgMHg0MDAwPjsNCj4gLQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIyMCBJUlFf
VFlQRV9MRVZFTF9ISUdIPjsNCj4gKwkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM0MCBJUlFfVFlQ
RV9MRVZFTF9ISUdIPjsNCj4gIAkJaW50ZXJydXB0LXBhcmVudCA9IDwmZ2ljPjsNCj4gIAkJY2xv
Y2tzID0gPCZpMmMwX2xwY2cgSU1YX0xQQ0dfQ0xLXzA+LA0KPiAgCQkJIDwmaTJjMF9scGNnIElN
WF9MUENHX0NMS180PjsNCj4gQEAgLTEyMyw3ICsxMjMsNyBAQCBpMmMwOiBpMmNANWE4MDAwMDAg
ew0KPiANCj4gIAlpMmMxOiBpMmNANWE4MTAwMDAgew0KPiAgCQlyZWcgPSA8MHg1YTgxMDAwMCAw
eDQwMDA+Ow0KPiAtCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjIxIElSUV9UWVBFX0xFVkVMX0hJ
R0g+Ow0KPiArCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzQxIElSUV9UWVBFX0xFVkVMX0hJR0g+
Ow0KPiAgCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+Ow0KPiAgCQljbG9ja3MgPSA8JmkyYzFf
bHBjZyBJTVhfTFBDR19DTEtfMD4sDQo+ICAJCQkgPCZpMmMxX2xwY2cgSU1YX0xQQ0dfQ0xLXzQ+
Ow0KPiBAQCAtMTM2LDcgKzEzNiw3IEBAIGkyYzE6IGkyY0A1YTgxMDAwMCB7DQo+IA0KPiAgCWky
YzI6IGkyY0A1YTgyMDAwMCB7DQo+ICAJCXJlZyA9IDwweDVhODIwMDAwIDB4NDAwMD47DQo+IC0J
CWludGVycnVwdHMgPSA8R0lDX1NQSSAyMjIgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ICsJCWlu
dGVycnVwdHMgPSA8R0lDX1NQSSAzNDIgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ICAJCWludGVy
cnVwdC1wYXJlbnQgPSA8JmdpYz47DQo+ICAJCWNsb2NrcyA9IDwmaTJjMl9scGNnIElNWF9MUENH
X0NMS18wPiwNCj4gIAkJCSA8JmkyYzJfbHBjZyBJTVhfTFBDR19DTEtfND47DQo+IEBAIC0xNDks
NyArMTQ5LDcgQEAgaTJjMjogaTJjQDVhODIwMDAwIHsNCj4gDQo+ICAJaTJjMzogaTJjQDVhODMw
MDAwIHsNCj4gIAkJcmVnID0gPDB4NWE4MzAwMDAgMHg0MDAwPjsNCj4gLQkJaW50ZXJydXB0cyA9
IDxHSUNfU1BJIDIyMyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gKwkJaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDM0MyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gIAkJaW50ZXJydXB0LXBhcmVudCA9
IDwmZ2ljPjsNCj4gIAkJY2xvY2tzID0gPCZpMmMzX2xwY2cgSU1YX0xQQ0dfQ0xLXzA+LA0KPiAg
CQkJIDwmaTJjM19scGNnIElNWF9MUENHX0NMS180PjsNCj4gLS0NCj4gMi4yNS4xDQoNCg==
