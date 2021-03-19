Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE7D341497
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 06:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbhCSFQY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 01:16:24 -0400
Received: from mail-eopbgr140085.outbound.protection.outlook.com ([40.107.14.85]:17604
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233762AbhCSFQV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 01:16:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdh/brFoRiKiJL9fwLgVxvy80/Kb/B/pAZGT5xV/VCPElTNhHhlMd7RYzAE/c+zg6F7mbzmBH4halzuxJlsBcDSJGMfwq/tjJVxMjpHIecuF0/sD7cIYkFXXFUIyO8f4qSkzFKme5d+NkcrpR1F/wI8T3Rfqb0XV128YY6WV6ZoK5ggISndUGszaMpGWKt0/jgzJoY6CkhsgBW6oR/3/iSnw+AyxgKimSEUA6RZeEv6JaTnMtBlBa8t/dP/yKiigFg0Yv7fbEhstUFWdD4RGpd7PChQnHVRA6has2kySl5nvjrww4GcxGqQqJxRz31emxGND8cn4h29RGIjhxMODUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxZMsQ/WerX1KfUveh1Dm1DsIvr0ERKFPV8PF5k17pY=;
 b=mxA5omRMo8aL4I5efJEabu7vAQV2bDBZe23MQ3SUxLc1AvmhevqeBlhRO2Hk61NBRR9mg1a6Hjw4IaJl0I2V/NgWb+0+LYpVaM2Ow91C/xMQyY36n2LU3bDHrcQkYjrjm4k+i+5bKkgYr7QsZ+x4gJexu/Y4wXI6DKA4Jwujx6onUSn1CZQhMaQdD6dElFaS9+it86JGPa0yo7DB1G5ccBKE28gNbg6GXPCzmj7NGkau2uAFdPLprXY2ZoQAcbML6EspywY5rhjAeWAydA5Abl5Vn438I/VTXXPe/kVwIErhKLVoi0ZP4p+5i0H3fRJtRmxnVvbROMySGZ/UHICPOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxZMsQ/WerX1KfUveh1Dm1DsIvr0ERKFPV8PF5k17pY=;
 b=AMM10cZOlkwLolESAuGhk8k+CJIjsedsw3Z5lFTD5zQ+DYuj3BUFpH/8KkvgiXGUiXK9Ead45nEZxUKEK8jq43qYCbBjC7HFocBpkfM2Qiv3S/4sWZtPKiiBno29dXpLqwSFU3yrsOuw3jfI0Zwrwhkm7u3ONDTnkRH75poUImg=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5415.eurprd04.prod.outlook.com (2603:10a6:20b:93::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 05:16:18 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359%7]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 05:16:18 +0000
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
Subject: RE: [PATCH 10/11] i2c: imx-lpi2c: fix type char overflow issue when
 calculating the clock cycle
Thread-Topic: [PATCH 10/11] i2c: imx-lpi2c: fix type char overflow issue when
 calculating the clock cycle
Thread-Index: AQHXGvpeWeqn5EwvYUSI9mj5ljAzEaqKx/AQ
Date:   Fri, 19 Mar 2021 05:16:18 +0000
Message-ID: <AM6PR04MB496646D93BE72408D9110A5A80689@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-11-xiaoning.wang@nxp.com>
In-Reply-To: <20210317065359.3109394-11-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3c718b1e-7e8b-4b03-d958-08d8ea962080
x-ms-traffictypediagnostic: AM6PR04MB5415:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB54156BCA48B4147D182D4CEF80689@AM6PR04MB5415.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:331;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4VjSE0iykRURH3FNXa2CJ6e2RlKV4g/GCUahuSOmkXFTFma9cdV8jer6o4KKof6LUhmDCyw4EERSBlW14oVf0oXAP1E8JTjCOgt0CXnQt9BiShlVU7VuDZMfNcYXNwO9CZQYHX+VLZKd2mT/FB3SH2yQXU7YlHoKu+mwVKxnRsjwnW5jdCqS2uPTZicVdZkDrT0pnXUaNn1wYFL1V3iGQw/aJ9zgt55bJizLiHFnelloMdCELMOudRogTI/GKGOIsbqOhO6TDMyf0Qig2RsK6HZ/puvXHkORh1BInM+aciln/qz9pZQnUobjiEzBOOz+PnLo/2qNBLBRhC4VHZDBKk0ij3MW5esRhBXq9FIGxTFc103oOYXtHmueSd806MvqdzVPRtJn1XHy8QFw/3sCbkd/E11u8vdSyFtgRoiiAVqmvrUFPYC19sWLpoUqsQjHNu1Q4UPMCDgskChtOvyIHE0ZLpbznVK2Jk62Yxt7ZS59Mb1JgK5m/6ZZs9ArhLzgkjK0n6zHVAzr0jAZqkHB80rO7HsiviEQvkAw8ehjYJaAijI2owy2jPF49ORP0oHoWN4du9C0YqNVgDBL+xiBkvzjnhE2u2/flKQKSj45IdxAoyLdOZb2mXkCttJy6y7B55KbmViaGp/SryoovqQ4S6MPI824/uUVZ3Ke2KvogUA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(9686003)(44832011)(6506007)(8936002)(52536014)(33656002)(26005)(5660300002)(186003)(76116006)(66556008)(66446008)(66476007)(64756008)(66946007)(8676002)(71200400001)(2906002)(86362001)(55016002)(83380400001)(7696005)(4326008)(54906003)(316002)(478600001)(110136005)(38100700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?bEVTZ0FXRGNZUUxNMkdyVktGVWJncE9lKzVCaVk2UjdrNVFkeEpwZ3RCdUZr?=
 =?utf-8?B?QnJCVHUwR1VRNzRSNjEyRG5SRkNmMDd2elJ0R3o4Sm9iU3JEWEFmTU44c2xx?=
 =?utf-8?B?ZmFpNndTcENMMGdGN0VXZ09oSXBYWnYzSDBnMnFpaVJ0R2pHOWdIVHp0dGF4?=
 =?utf-8?B?ODltRGVkUXBrU0JsTTd1R1VzYXdTMUJSK0xuRXBYN0ZYblJXRVoxckNyZGsy?=
 =?utf-8?B?UW5qS293WFg2WjIrZUxGbG5vUU1KWGUyeFhGK3lRN3IwREpIU3RINmJRaEl6?=
 =?utf-8?B?SlpRVVJyVFVhK3lIVFM3YWJMaUVmUUxicVc3SG8rYkFmRVRBVnBZclNqNXIx?=
 =?utf-8?B?UGtUN2FUaHhmQUd3ZHhLWnJCZm9Zd21sUkRUSjFPc25xMXBabUMvS1psU3p5?=
 =?utf-8?B?bkNUVU9McURxL3d1blNjK1VtNGErR3NCNDYzbmRGRDBnVzh3RENMV2kzOG11?=
 =?utf-8?B?cXRoMmQ0U1kyOTYxS0xiVWJsaHlUNkdLRWlrL1ZvYUlsSWFya25GamJKdkMz?=
 =?utf-8?B?WHgwRmNWeGNvRVlnMFAyeFZpUnUwcVJxOVdVdFpYamY2UzJNS0JWNlg4OVFM?=
 =?utf-8?B?T1hyWmlUbmpjMUFUTkxjdGxaVVJXTFplOVdueXdGL2w5bzVkeDliQUx1Ynli?=
 =?utf-8?B?V016OVZ6Y1ZsVG5uUmhzUlh1WWtXUWFaL0RZRFhnOWtPVUpWKzM4TDhOUmNZ?=
 =?utf-8?B?SFg0a0NWZExybHRzb1RJWGcrbm9IbnRSeWt3K05UWm80QWRJMmNTMU1KZ1U2?=
 =?utf-8?B?VjdRYlo2VWxLUTZCVWlhakRDYk44bXRHUytaaXlkby9RaTArMHVuaHppSVVP?=
 =?utf-8?B?UU4xVGNQM09Qd0liSTd3dTRma1hEd1JkZTVRMDd0N05VYVhtVHRjNmF1Z0Uz?=
 =?utf-8?B?cHZZM2lINUZMZkFmZ0JKcVJ4TFRjUndEMXhTVkQ1NXJSYVYxYzFBdVFBSG9Y?=
 =?utf-8?B?S1g2MDhHdFlHTklUSm5tL3kzcmlQbWMvWVQvU3dTRjUxc0FxSzI4Tk45cmNu?=
 =?utf-8?B?RHRNcktjYnNmaTFlOEZUOHpGQUE2L1QrQzBkeTRHN0NhcmIrTE1qTGxsZEFE?=
 =?utf-8?B?Y2hPcDJ0cXdmeWpZUXIvTmdhaU90Q3FsTGpQaGgrMFBOTjcrRkF5b2FZOHFl?=
 =?utf-8?B?ZEFEZlkyVkYzTk1oTFAwbVlKQno5NUhiYXVwYWxWa1dYYjZQWkZtcnB3SFF6?=
 =?utf-8?B?dWFGM0VGY29RU2NRNW1kMFNCcGliY3VMazUzSm5kQ3Y2am0wN2VZYmJKbHNI?=
 =?utf-8?B?alRpWU9MekdNbXF4amRIVUdqbGNvK3lpbWV1ZFhmRkxzMXBYbXN6OXFtWkt4?=
 =?utf-8?B?RW45a2V4YzVMUkcreERHS2Z3SWNpNkdmeWVzR3lrVUp2QzR2Sk9oa3FmK0h5?=
 =?utf-8?B?NFZrRlhwMzJ5Um1QTnZuUUNQRzgyMkFpSGl3MVhWRGgzM1pUMWxKOUJzaGZk?=
 =?utf-8?B?bXNMbVU2WTZmbTdNbUVBUTVHanV3NkFhWitXR21QRVFrc2ZLeDJ0QVBFa1do?=
 =?utf-8?B?dno2d2RRaWZiYjV2WWcxM1NXYmFHa0NkRUlEMnlYaWFkM3cyejZHdzhzQ3VJ?=
 =?utf-8?B?eGN5R09MMlgrUktuYk40R3dzMlFreGtlUHJPU2tuSDBnd3N4RklTVXMvNzM0?=
 =?utf-8?B?bVNaei9NNjU4aWo2SmNZQnhqRHM5Z3Vzc1B4VHRIS0pKNWtkQTBwTzgvQWV0?=
 =?utf-8?B?bnZUZXVEOEVxdHg5b3dscVU2eXRIU1NKZWVacEFQeEk1QzA1K3k0QU9NdnlD?=
 =?utf-8?Q?Swb2RhMxWSY2Ugd20AF2+D6f6EcQ2ONn4FRIna2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c718b1e-7e8b-4b03-d958-08d8ea962080
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 05:16:18.3086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NPI2covhr1fmUzpP3yfZvDGbgbGn4Vk5rCFtBHx0tCflSoCP0TEqMv05N4zPafaQ+PgemM+BpgZ4B35b5QZPNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5415
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTWFyY2ggMTcsIDIwMjEgMjo1NCBQTQ0KPiANCj4gQ2xhaW0gY2xraGkgYW5kIGNsa2xv
IGFzIGludGVnZXIgdHlwZSB0byBhdm9pZCBwb3NzaWJsZSBjYWxjdWxhdGlvbiBlcnJvcnMgY2F1
c2VkDQo+IGJ5IGRhdGEgb3ZlcmZsb3cuDQo+IA0KPiBSZXZpZXdlZC1ieTogRnVnYW5nIER1YW4g
PGZ1Z2FuZy5kdWFuQG54cC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IENsYXJrIFdhbmcgPHhpYW9u
aW5nLndhbmdAbnhwLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5k
b25nQG54cC5jb20+DQoNClJlZ2FyZHMNCkFpc2hlbmcNCg0KPiAtLS0NCj4gIGRyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMuYw0KPiBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14
LWxwaTJjLmMNCj4gaW5kZXggNWRiZTg1MTI2ZjI0Li4xZTI2NjcyZDQ3YmYgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gKysrIGIvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMuYw0KPiBAQCAtMjEzLDggKzIxMyw4IEBAIHN0YXRpYyB2
b2lkIGxwaTJjX2lteF9zdG9wKHN0cnVjdCBscGkyY19pbXhfc3RydWN0DQo+ICpscGkyY19pbXgp
DQo+ICAgICBDTEtISSA9IEkyQ19DTEtfUkFUSU8gKiBjbGtfY3ljbGUgKi8gIHN0YXRpYyBpbnQg
bHBpMmNfaW14X2NvbmZpZyhzdHJ1Y3QNCj4gbHBpMmNfaW14X3N0cnVjdCAqbHBpMmNfaW14KSAg
ew0KPiAtCXU4IHByZXNjYWxlLCBmaWx0LCBzZXRob2xkLCBjbGtoaSwgY2xrbG8sIGRhdGF2ZDsN
Cj4gLQl1bnNpZ25lZCBpbnQgY2xrX3JhdGUsIGNsa19jeWNsZTsNCj4gKwl1OCBwcmVzY2FsZSwg
ZmlsdCwgc2V0aG9sZCwgZGF0YXZkOw0KPiArCXVuc2lnbmVkIGludCBjbGtfcmF0ZSwgY2xrX2N5
Y2xlLCBjbGtoaSwgY2xrbG87DQo+ICAJZW51bSBscGkyY19pbXhfcGluY2ZnIHBpbmNmZzsNCj4g
IAl1bnNpZ25lZCBpbnQgdGVtcDsNCj4gDQo+IC0tDQo+IDIuMjUuMQ0KDQo=
