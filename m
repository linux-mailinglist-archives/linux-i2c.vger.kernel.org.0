Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E92439F2C1
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 11:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbhFHJsf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 05:48:35 -0400
Received: from mail-dm6nam11on2045.outbound.protection.outlook.com ([40.107.223.45]:56113
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231132AbhFHJse (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Jun 2021 05:48:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bg2wqszBtI7D1M1GB816UXHbVLj5PZYwUiaI6DD4CV4guz2EvHynIYRVXD3SHBnqItQJN4qUxsuJd58A2oKxuXzizhc8hU80A1p3v9YfVIvLvNtJtOcK2/0H+BBMx6qKNgFunKEdFzZyCXTDxwX/sfNya637hzsU8MesY7y5uJ1LC98bF0ctyGZRI2rWuhsgBphiYkIFagUtJ0d5ktURij5Guj373wQBfrETmsy6k0ceVNm1ISFaliReDBpigkCD39wglpserJcYYlf8zftpbqWB57+hSYvgFlznLz/CAYVanZV6igmsKWDmqkTlq9X6stGWg+LR8kzQIpQDKh4LWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/Eh+8zC+Ee0YD8qZMhcpdVazL3NZLo8D3NBZViSsLg=;
 b=DU9k7s612gkL6mIS7zArzKK9ugKT0ZNUMOdtJ2HGKO9WrowBWtDhT/G1WkDzwaV07J5sZwbiEtQGYAY922JRjaklfJu9YUEoKBX8bmoGIimpXUvYmyUmOnFBMwdBx/wixPf/r37gSK9rV1qEC3jLFhCygqvjn2iyxeaTRubJqMEADVORPC4mEdxpiJLmf3fKwutqFbJPI3uKGnSrVxdxvh6LV9r6bRckqshFXNI3AyLllpiLH5N2v8VH0E9PcHg/mXxl5u5MQrN5ufTHPheg22elq6XmybBpft/QkZDsOcS0rnQINZvKdTVWXwT4BC2T/PY6GI4z2Cqvr/bc2TYDQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/Eh+8zC+Ee0YD8qZMhcpdVazL3NZLo8D3NBZViSsLg=;
 b=A9QeOfdXHegIKLGfDJdpVuVFc3dNE99qxlOJa8BHEf8wmb/W26zMNXZ3qoJLs6+48ClbrU06JXpVQZjy1y2aZeshMFlDjA+ge++C/scDIxx5VeNNIBui2mzLoMwWwQv4NnioG7zd0uZRN9rExRmc2eKcKjVFWa7huAu96v4+xmY=
Received: from SN6PR02MB4093.namprd02.prod.outlook.com (2603:10b6:805:31::31)
 by SN4PR0201MB3437.namprd02.prod.outlook.com (2603:10b6:803:51::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Tue, 8 Jun
 2021 09:46:37 +0000
Received: from SN6PR02MB4093.namprd02.prod.outlook.com
 ([fe80::e020:cfc6:6016:386e]) by SN6PR02MB4093.namprd02.prod.outlook.com
 ([fe80::e020:cfc6:6016:386e%6]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 09:46:37 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Michal Simek <michals@xilinx.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>
Subject: RE: [PATCH 02/10] i2c: xiic: Add standard mode support for > 255 byte
 read transfers
Thread-Topic: [PATCH 02/10] i2c: xiic: Add standard mode support for > 255
 byte read transfers
Thread-Index: AQHXVh/IQ0c+81unIUeYIazvYohSbKsAlWkAgAEtGiCAAE7sAIAHv9+Q
Date:   Tue, 8 Jun 2021 09:46:37 +0000
Message-ID: <SN6PR02MB4093D109F1E5545318F7E796CA379@SN6PR02MB4093.namprd02.prod.outlook.com>
References: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
 <20210531131948.19477-3-raviteja.narayanam@xilinx.com>
 <0f167c21-6bc7-0806-a536-55658a199a5b@denx.de>
 <SN6PR02MB4093F1992FA306C027D01448CA3C9@SN6PR02MB4093.namprd02.prod.outlook.com>
 <df5d8f33-1fe0-5760-b19d-300c1f99344e@denx.de>
In-Reply-To: <df5d8f33-1fe0-5760-b19d-300c1f99344e@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [103.106.181.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf4a7707-e7ad-4420-516a-08d92a624f7c
x-ms-traffictypediagnostic: SN4PR0201MB3437:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN4PR0201MB3437091FBC6A295DA3DCCBA8CA379@SN4PR0201MB3437.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jDV7D0wTkb9u7cWlgGJE5lT19uV5aFOz0a6alB0fFqJ5RyMINd7nZbtNR7CAiYZq7dJRPsH3lbWWDJr6+YE+7Tk+V9ehGddj5EzOKxOWJPby3R9Mo5Mx/0CYKFyGBm3hVKrRbAx1TnmeO+efikWNiu9ghlc0D4fxGGdwYro9JPuvuSgxvLZPgfLn8F18COoSSXJWX6ykk4c5P6X/0BqOVg8mYxToojjkE80PNU4YBc5Ihpsk5cd4tbKn31dnViRA2qnc1htl2AHdJTW0qvSs3EzsVLcwLDHzPRiHauJiUUFFZadxYKLVzVOFoge9p/5eqOhakWkeyCiRoEKZ3TxGi8Yu2nEfkQMMd+EvDnXqeWnan6gTns4XGxwQhW8r4oApn04Y/qIxltANvjioUSrBZUC4GXlvli203b7CBAxgpFau2LNLR6tJJBZyipQMKnYH/pbVrKjrUT8O6UjTz1a+HbI7CO/oforh20xgWml6nMG9hkl1L3Pvl/Gm6KDzsQ3+WTBr8GLyy4LD4nyz1xoZMvxLEUt6kC4e5YUPrAP+rbr6t5RYToBURyXgsm1ENZKA9m4Lq/aJtTSeUjkpxQ1Mdq6UQQt7WJRzCeLAZax8GWU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4093.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39830400003)(366004)(136003)(83380400001)(33656002)(4326008)(5660300002)(53546011)(86362001)(52536014)(186003)(7696005)(38100700002)(122000001)(66946007)(66476007)(64756008)(66556008)(66446008)(76116006)(316002)(110136005)(26005)(54906003)(6636002)(8936002)(71200400001)(107886003)(8676002)(9686003)(6506007)(55016002)(2906002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NE5na1RIeElIWjlSbk5mU0pjWVowRU00T2pMbjM3SjNvNkRRRzBKbGZYY1or?=
 =?utf-8?B?dEdqeVdTQ2R2MjdlcXE5c2l2KytRamFBaHJxMytSUmJQMU5YU3VNK25MOWxy?=
 =?utf-8?B?RG1xcXVCRHpFTytKN2JMZS9lK0hTLzREallVUGMyQmppMWJNMzhGWXZ6UkdS?=
 =?utf-8?B?NzMzdHdZQ3lnek9LalR4WkIvaG5jTnB4eCtCaERoRzBQdzBkNDR1WFNzREFQ?=
 =?utf-8?B?WmcyWkZVZm9Rc2tvU28wKzVnUDJqc0dydGtmYVpjTnNlTWNMcnJRTWx1VE1y?=
 =?utf-8?B?OGlRbXFoTnhwaGFPdThUSWRUdHQ2V1pzYThzWkdXSEpFWUtwK2RhVDZvTHRy?=
 =?utf-8?B?SUZGSU5NU0JaQTBCOTV1STN3a3VUN3hNR1lSc0hyR3FtdVVDbzkyOTZBRzJu?=
 =?utf-8?B?NnBCWi82eUhGSXJyWFAwbGVZb01BUEVMTHhqS2VkOVpxbUh2Z3RaSHVteHBn?=
 =?utf-8?B?bHRoSFJ6TXFRSW9oRzZRRlg1eWt1ZHR5T0VFc1NyUmNLSTRDRGQ3R0N4TnNN?=
 =?utf-8?B?c2ZOTzVLTzFVUDdQazR5UW5UYWFUWm5JcHlJQmxMaEFSWUwzaGsxaW9JYjFj?=
 =?utf-8?B?RXhJVlhIZVZ6S25WV3U3UDVPT2c3SVE5ZmQ5b1FaOUtoaWJiaFVzWkFwUDdu?=
 =?utf-8?B?NmlHUzJQSmQyMjRxSFVPRVpSVWdFZjZ1YkRJa1Y3Z0VhalorbkJOYjVwaXpH?=
 =?utf-8?B?NWhmbFc2N2xXNmwzRGJ4azRWamVMMTZGV0cxSURLclQvSDNaZTRGVUU3aTZv?=
 =?utf-8?B?SW1mQjlERi9KejBEZ2toTmgxUEllRGo2dTFrNGlJRVFYUDA4ZFllNlNsL1Na?=
 =?utf-8?B?ZnBsTW45WllTMjBRVGE2ek9VR3ZHZytlRDZNaUUwRFhsRzNzd0NwcUQ0aEI1?=
 =?utf-8?B?dzhTTnp2RjMrVE5NM0hWOGNWSWNuVktZL0U4UXIxNmdrbHhzbHdxMmk4RG13?=
 =?utf-8?B?VU16Z3NYT1BQTVlsL2tKVUtORnArNWpYNFFGZFBLM2JPVUxLK2lpcUg0Mkll?=
 =?utf-8?B?T2FNd0ZxOWdWcmdTdTJJbTYwY3lqNEFKZmROczc2cGtBL3NVc01ndnN1SE1l?=
 =?utf-8?B?UnpwL3VLVEVKdVB3ZFgvL2ZSRnc2dGJwWWFjOW53RXd5c1FaRDdzZWhHcVRh?=
 =?utf-8?B?d0NhenBHUE5GZ1FFL1RVSkV2L2xicFhjRnJ2OEdwaDJIUWN1NURXYmRrRkNK?=
 =?utf-8?B?T2k4ZUNaM251ZE1mVnFvM25CVk8zQm9IUU4zK0N0SFQvcFpBeng1cnQ4MEV0?=
 =?utf-8?B?S0kzOWJVY3Ruc2hlbDJGL200VTVQTzR0cFhibWlaZmZZTTFoSjV4K0o2dkt6?=
 =?utf-8?B?WER3RmhtU2cwdlJ5M0xJcFZ1aVFTc1NoZkpJcmYxZHRpcGtCeTB0bFZMTjVT?=
 =?utf-8?B?bFV0amdrcmNSY09RVHl2NFMxNnR2YVk3aGZBZ29NQVZkYWpXclMzSEFGUnpq?=
 =?utf-8?B?MGpmcDBmdVQzeUd0NWVQM3J5UTNTSjJhVS9FbWN1Q2JkWEdBN0Y5QUZVc3VF?=
 =?utf-8?B?Qk44cy9YajFqSXRxbmQ2WWhQaldPTllsMkM4enRGWCtNSE11ZTNHYVpob3R4?=
 =?utf-8?B?ejIrcFY2SGdmUnJPRWw0U3d1QkRQdm1GOUlhWDVxQTl3N3pHRnI0QndHaUtt?=
 =?utf-8?B?dTdHZTVDRDAwYkJobmlYTVFwQ25aOXh3QnNpd3d0L3hLcWhCOGlaaUlBK2F3?=
 =?utf-8?B?dGcreW91VW5PMS9IVVEzeDRQL1lkRDNMb2xwNHNVeUpaSXU2SEJBc1RIVklX?=
 =?utf-8?Q?5gxeBOSD5InNs8yZKwSl0e1BmBYUA+CqL+tNaaR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4093.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4a7707-e7ad-4420-516a-08d92a624f7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 09:46:37.6625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nvkhAUjHR86qnMJq5ZilpuYdcc2N7q01tWeJuGweKmfQR4R1s8CYN/m9IfTQA1bl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3437
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyZWsgVmFzdXQgPG1h
cmV4QGRlbnguZGU+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDMsIDIwMjEgMzoyNyBQTQ0KPiBU
bzogUmF2aXRlamEgTmFyYXlhbmFtIDxybmFAeGlsaW54LmNvbT47IGxpbnV4LWkyY0B2Z2VyLmtl
cm5lbC5vcmc7IE1pY2hhbA0KPiBTaW1layA8bWljaGFsc0B4aWxpbnguY29tPg0KPiBDYzogbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBnaXQNCj4gPGdpdEB4aWxpbnguY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAy
LzEwXSBpMmM6IHhpaWM6IEFkZCBzdGFuZGFyZCBtb2RlIHN1cHBvcnQgZm9yID4gMjU1DQo+IGJ5
dGUgcmVhZCB0cmFuc2ZlcnMNCj4gDQo+IE9uIDYvMy8yMSA3OjMzIEFNLCBSYXZpdGVqYSBOYXJh
eWFuYW0gd3JvdGU6DQo+IFsuLi5dDQo+ID4+PiArCWlmIChpMmMtPmR5bmFtaWMpIHsNCj4gPj4+
ICsJCXU4IGJ5dGVzOw0KPiA+Pj4gKwkJdTE2IHZhbDsNCj4gPj4+ICsNCj4gPj4+ICsJCS8qIENs
ZWFyIGFuZCBlbmFibGUgUnggZnVsbCBpbnRlcnJ1cHQuICovDQo+ID4+PiArCQl4aWljX2lycV9j
bHJfZW4oaTJjLCBYSUlDX0lOVFJfUlhfRlVMTF9NQVNLIHwNCj4gPj4+ICsJCQkJWElJQ19JTlRS
X1RYX0VSUk9SX01BU0spOw0KPiA+Pj4gKw0KPiA+Pj4gKwkJLyoNCj4gPj4+ICsJCSAqIFdlIHdh
bnQgdG8gZ2V0IGFsbCBidXQgbGFzdCBieXRlLCBiZWNhdXNlIHRoZSBUWF9FUlJPUg0KPiA+PiBJ
UlENCj4gPj4+ICsJCSAqIGlzIHVzZWQgdG8gaW5kaWNhdGUgZXJyb3IgQUNLIG9uIHRoZSBhZGRy
ZXNzLCBhbmQNCj4gPj4+ICsJCSAqIG5lZ2F0aXZlIGFjayBvbiB0aGUgbGFzdCByZWNlaXZlZCBi
eXRlLCBzbyB0byBub3QgbWl4DQo+ID4+PiArCQkgKiB0aGVtIHJlY2VpdmUgYWxsIGJ1dCBsYXN0
Lg0KPiA+Pj4gKwkJICogSW4gdGhlIGNhc2Ugd2hlcmUgdGhlcmUgaXMgb25seSBvbmUgYnl0ZSB0
byByZWNlaXZlDQo+ID4+PiArCQkgKiB3ZSBjYW4gY2hlY2sgaWYgRVJST1IgYW5kIFJYIGZ1bGwg
aXMgc2V0IGF0IHRoZSBzYW1lIHRpbWUNCj4gPj4+ICsJCSAqLw0KPiA+Pj4gKwkJcnhfd2F0ZXJt
YXJrID0gbXNnLT5sZW47DQo+ID4+PiArCQlieXRlcyA9IG1pbl90KHU4LCByeF93YXRlcm1hcmss
IElJQ19SWF9GSUZPX0RFUFRIKTsNCj4gPj4+ICsJCWJ5dGVzLS07DQo+ID4+PiArDQo+ID4+PiAr
CQl4aWljX3NldHJlZzgoaTJjLCBYSUlDX1JGRF9SRUdfT0ZGU0VULCBieXRlcyk7DQo+ID4+PiAr
DQo+ID4+PiArCQlsb2NhbF9pcnFfc2F2ZShmbGFncyk7DQo+ID4+PiArCQlpZiAoIShtc2ctPmZs
YWdzICYgSTJDX01fTk9TVEFSVCkpDQo+ID4+PiArCQkJLyogd3JpdGUgdGhlIGFkZHJlc3MgKi8N
Cj4gPj4+ICsJCQl4aWljX3NldHJlZzE2KGkyYywgWElJQ19EVFJfUkVHX09GRlNFVCwNCj4gPj4+
ICsJCQkJICAgICAgaTJjXzhiaXRfYWRkcl9mcm9tX21zZyhtc2cpIHwNCj4gPj4+ICsJCQkJICAg
ICAgWElJQ19UWF9EWU5fU1RBUlRfTUFTSyk7DQo+ID4+PiArDQo+ID4+PiArCQl4aWljX2lycV9j
bHJfZW4oaTJjLCBYSUlDX0lOVFJfQk5CX01BU0spOw0KPiA+Pj4gKw0KPiA+Pj4gKwkJLyogSWYg
bGFzdCBtZXNzYWdlLCBpbmNsdWRlIGR5bmFtaWMgc3RvcCBiaXQgd2l0aCBsZW5ndGggKi8NCj4g
Pj4+ICsJCXZhbCA9IChpMmMtPm5tc2dzID09IDEpID8gWElJQ19UWF9EWU5fU1RPUF9NQVNLIDog
MDsNCj4gPj4+ICsJCXZhbCB8PSBtc2ctPmxlbjsNCj4gPj4+ICsNCj4gPj4+ICsJCXhpaWNfc2V0
cmVnMTYoaTJjLCBYSUlDX0RUUl9SRUdfT0ZGU0VULCB2YWwpOw0KPiA+Pj4gKwkJbG9jYWxfaXJx
X3Jlc3RvcmUoZmxhZ3MpOw0KPiA+Pg0KPiA+PiBJcyBsb2NhbF9pcnFfc2F2ZSgpL2xvY2FsX2ly
cV9yZXN0b3JlKCkgdXNlZCBoZXJlIHRvIHByZXZlbnQNCj4gPj4gY29uY3VycmVudCBhY2Nlc3Mg
dG8gdGhlIFhJSUMgPw0KPiA+DQo+ID4gVGhlc2Ugd2VyZSB1c2VkIHRvIGZpeCB0aGUgdGltaW5n
IGNvbnN0cmFpbnQgYmV0d2VlbiB0d28gcmVnaXN0ZXIgd3JpdGVzDQo+IHRvIHRoZSBJUC4NCj4g
PiBBcyB3ZSBoYXZlIGRpc2N1c3NlZCBsYXN0IHRpbWUsIHRoZXNlIGFyZSByZW1vdmVkIGluICIg
W1BBVENIIDA4LzEwXSBpMmM6DQo+IHhpaWM6IFJlbW92ZSBpbnRlcnJ1cHQgZW5hYmxlL2Rpc2Fi
bGUgaW4gUnggcGF0aCIuDQo+ID4gTm93IHRoZXkgYXJlIG5vIGxvbmdlciBuZWVkZWQgc2luY2Ug
b3VyIElQIGlzIGZpeGVkLg0KPiA+IEZvciBsZWdhY3kgSVAgdmVyc2lvbnMsIGRyaXZlciBpcyBz
d2l0Y2hpbmcgdG8gJ0FYSSBJMkMgc3RhbmRhcmQgbW9kZScNCj4gPiBvZiBvcGVyYXRpb24gaW4g
IiBbUEFUQ0ggMDcvMTBdIGkyYzogeGlpYzogU3dpdGNoIHRvIFhpaWMgc3RhbmRhcmQgbW9kZSBm
b3INCj4gaTJjLXJlYWQiLg0KPiANCj4gSSBzZWUsIEkgd291bGQgZXhwZWN0IHN1Y2ggZml4ZXMg
dG8gYmUgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgc2VyaWVzLCBzbyB0aGV5DQo+IGNhbiBiZSBw
aWNrZWQgaW50byBsaW51eC1zdGFibGUuDQoNClllcywgSSB3aWxsIHNlbmQgYSB2MiB3aXRoIG9u
bHkgZml4ZXMgYnkgcmVtb3ZpbmcgMDAwNCwgMDAwNSwgMDAwNiwgMDAwOSBhbmQgMDAxMCBwYXRj
aGVzLg0KSSBjYW4gc2VuZCB0aGVzZSBmaXZlIHNlcGFyYXRlbHkgYWZ0ZXJ3YXJkcy4NCg0KPiAN
Cj4gSW4gZmFjdCwgbm93IHRoYXQgeW91IG1lbnRpb24gdGhlIGJ1Z2ZpeGVzIHdoaWNoIEkgcG9z
dGVkIGEgeWVhciBhZ28sIHRoZXkNCj4gYWxzbyBmaXhlZCBhIG11bHRpdHVkZSBvZiBsb2NraW5n
IGlzc3VlcyBvbiBTTVAgaW4gdGhlIHhpaWMgZHJpdmVyLg0KDQpUaGlzIHNlcmllcyBhZGRyZXNz
ZWQgdGhlIGlzc3VlIGZvdW5kIGluIElQIGFib3V0IHRoZSB0aW1pbmcgY29uc3RyYWludCBpbiBy
ZWdpc3Rlcg0Kd3JpdGVzLiBSZW1vdmVkIHRoZSB1c2FnZSBvZiBsb2NhbF9pcnFfc2F2ZS9yZXN0
b3JlIGFuZCBnYXZlIGZpeCAoeGlpYyBzdGFuZGFyZCBtb2RlKQ0KZm9yIHRoZSBhZmZlY3RlZCBJ
UCB2ZXJzaW9ucy4NCkFsbCB0aGUgaTJjIGFwcCByZXF1ZXN0cyBhcmUgc2VyaWFsaXplZCB0aHJv
dWdoIHRoZSBpMmMgY29yZSBpbnRvIHRoZSBkcml2ZXIuDQoNCj4gSGFzIHRoaXMgc2VyaWVzIGJl
ZW4gdGVzdGVkIG9uIFNNUCBaeW5xIG9yIFp5bnFNUCBleHRlbnNpdmVseSA/DQoNClllcywgd2Ug
aGF2ZSB0ZXN0ZWQgdGhpcyBvbiBaeW5xbXAgd2l0aCBtdWx0aXBsZSBhcHBsaWNhdGlvbnMgcnVu
bmluZywgYW5kDQpubyBpc3N1ZXMgYXJlIG9ic2VydmVkLiANCg0KUmVnYXJkcywNClJhdml0ZWph
IE4NCg==
