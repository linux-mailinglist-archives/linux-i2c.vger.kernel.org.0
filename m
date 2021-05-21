Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3669B38BFED
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 08:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233240AbhEUGqH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 02:46:07 -0400
Received: from mail-vi1eur05on2050.outbound.protection.outlook.com ([40.107.21.50]:53217
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229762AbhEUGqG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 02:46:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIXYG4YLK9UArWI0fI3rC8B4AbhrmWimbTepLAMqz6kmQwEwRDsrMc2H140tKsdTDLZW4HjWz0M5RvsSR641qi5Lrn9hhwXICTgg1V9q7r8MT9rI8rdenZBYN3ZTpHo8LOlYfdJ6S+hZRrrhjNrnBNORW9lqPrwpFPByWro/B0B0EE2ae/yEXDv4v06vc1i7q2RR4cb0I6G6mryGyGSH5uZgJIqtfvXY0W+ixlTkLIJgP4HGnxFVAF5MZ5r7tJWGHu2ZXFbsOsAOT8Ael1hlHq1yYFkSHe1emR02Wak42eGTDseTBAe0oS7GT3UPWL3N6sNYRVuA8ghTSIxeovB8xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ag9/GHQYGGFtOx2+XjmQ78c3troJzS/h6a5GLGSHw70=;
 b=fQGPsSh9yaFIQ8QPLmz8Iy2xFb5dQ+VOhaDp8ZOVEwcl/UqblMUZAUZSzuR4YR5O6oVZ48LK5zIR3O28IVl9BtaFMtHEVMlZkRffxHVSi90kimbczFaVjplwJg+PsYogM8JZU0A2RGyWVQoTlcm25kdJYi7F4ri9utMfJcuLAVQ6XJ5j3adm5n7jmbVtDhRjUcUwr21kJMSJJTTl/QhAhrS3P7kPOeXnlTMeULZdrU9O+i8n7A5BlNYFIseccpjn3/81Wk6YNFkJ3Cp6Gs37VO3AiW2qNFcU7eA6JRzAcBNVNAk0Z319yJ+M4YiGrQJ/SG1Bc635Lt5SO+Wg6H9IXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ag9/GHQYGGFtOx2+XjmQ78c3troJzS/h6a5GLGSHw70=;
 b=iNBvB6dGUZOI+XAH4257EeJybpGQSHC5+GhOLnIh2LqcE5vdi3qkxKfHx8yPClbNaaceQRWkv05cccX3Tia7svAODCFCpLQEgo8OoXkIQZvkJFi9LBePfmAKix+DiXwU4YFpElegHc1xv8sDCDt8T45EiqOEboct3I54Pdmz0Ts=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB4904.eurprd04.prod.outlook.com (2603:10a6:20b:c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 21 May
 2021 06:44:41 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 06:44:41 +0000
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
Subject: RE: [PATCH V2 10/18] i2c: imx-lpi2c: add bus recovery feature
Thread-Topic: [PATCH V2 10/18] i2c: imx-lpi2c: add bus recovery feature
Thread-Index: AQHXKtitagEo1eB4tUWUGDOwtXI616rtw6/w
Date:   Fri, 21 May 2021 06:44:40 +0000
Message-ID: <AM6PR04MB49666D7EC3D67A69C0DA100580299@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
 <20210406113306.2633595-11-xiaoning.wang@nxp.com>
In-Reply-To: <20210406113306.2633595-11-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24f6a72d-824d-4078-5185-08d91c23e92f
x-ms-traffictypediagnostic: AM6PR04MB4904:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB49044742214A91088EDE308F80299@AM6PR04MB4904.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CcO5dIU5NO5GTL/kbUCJbFl/5iBoPnWxRxOImKqCz3miQBAgrO0Pz265nYMJnKqK+4LfKzAis2AQ5SnalkDJU+vyIhRfo8TFyuNmJkmkw6nt+8VFelu7EQMr/5mP3yPzyvQ//hsqFlvH1euCGqGhC3qKjVrG6guJgOXwRJ+I8NN4wTRqMAFNBilw8eaU3MEXyZkPycuA6yfq2oenFIbEE8AQG3G90O2MDMp/unEEJlEfv/xGjzJGZo7tQspprj8I5wp4vEgyvwEE4blKK3ImPuYCXvPyRGHlx8k96eKV1vZBIh6YyqYI4/mbhzxysFowgP68sBsH6QAXkDhBMRIVLhuqJM0sWEs1LTBrha4n3JigmPlKYFTVw0ZujnKIbLgOAaqbU0jU5O528jqkMgbd71BPXYpKVSWOFJpckwUYjWwL1B+oIXyLFZo/NVpNmNYbDK0i2JGByzkRBxYmpiZnTC5tu0h5xJLBn4G93n5Q3B5emdns6GX9yEQzCp267bh0cV5nVbbr/g6IMZ+oaNgq/BCERlQS6HmO8mBaC/IftVj+zCS+ZuBx84UBkkBIvDrEjoQsuaH8m1LnZX3CHEI5u1l2E55ouxQ3cGwWwAPEqeY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(316002)(186003)(66556008)(8676002)(66946007)(76116006)(8936002)(66476007)(9686003)(110136005)(54906003)(4326008)(33656002)(2906002)(86362001)(6506007)(66446008)(7696005)(64756008)(5660300002)(478600001)(38100700002)(44832011)(52536014)(26005)(122000001)(55016002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?R0NKZzhrL2ZNcVhhcFpLZ1UvdnovMitsVCtiTHlqZDBMdzNYNUNsMktNdVI1?=
 =?utf-8?B?bXdHeVdOWitJazEvVkZJRkticFZ5ZnpaRk1tZmZlMktpdkM0dDBtOXVaK0tq?=
 =?utf-8?B?OHRnVUI5L285UXZCRTVDdGxYMlphOTkybHBtZGtMUElRY3JLNllJZDR0RG0y?=
 =?utf-8?B?VFpkMDJ0aUplSVA3N3ZPenU5ekpXbE92ZExQWEpjT2p2Qm4vYWR3cHVQM2I0?=
 =?utf-8?B?N0pzZzBaaFB2R0swUWRsVFFnWjVCaXlBcWZpR0gxbW5IRUJ2U1hJK2wwZWdE?=
 =?utf-8?B?aHhmQzhGa0hNNDFyUTRRR0pIZEprTUR0UDBUVnY2SDkrSlg3UmRjR00rcnA3?=
 =?utf-8?B?K3p0VkZScnhrdXBZNHg1dllzRWs1NElvZklPbDNwcGZYTVA5OC9MNDVrWlRt?=
 =?utf-8?B?TlJRVE82MThnaFlFU1FjbE5FalhkcUV6a3FkdnFWV2RMcWQ0L2NGRVlhZUsv?=
 =?utf-8?B?Szc4UVlmK2JITFB0cHg4aFU4NnI5Ukt3cGhiMFZCWTYwWktjdHBCR3VWUDla?=
 =?utf-8?B?K0ZZZTJubEptWmlhRTFZeHRXek93T3FFZE1nMzhDeE1kNWo5Rk5QNVB1UmJI?=
 =?utf-8?B?WTVmWk1VN0FuY1A4M2ZpamFrVnFsUHUzcDkxSGpCbEtPeEc4R3labkpwNXEr?=
 =?utf-8?B?Z0N4dkdpMkd2YVBibGJrNEpwZnc0WFNhQ3BjV3Y5THFZS2lrTFY5V0Ywekdu?=
 =?utf-8?B?Rzg1WGF0WEg4UVdCSHZIM2pKMTYvK2tTZldnUXVGazVuRWd3K09sR1UxdTli?=
 =?utf-8?B?VThqWVBKbDlzWFoxQW5ZWmsrZE9kQjRBQTFETlZWclpFMDVWM1lMNk5VZngr?=
 =?utf-8?B?U0VCcUpIUWRNTVJNSUh2YW14Rk9zU29xWDhiK3BBemJRQ0xrV1YxRklmTm8z?=
 =?utf-8?B?b05BYThBOVZ1c3BWVForWm9aRWZxb1hqb3VFN0I2SW9hM2lZdGllQ1RPWGFa?=
 =?utf-8?B?c2V2T3ExTlo0bXZSbjU3VFdsWmFUV2IzQUlNajlib0owTGJMcEF0Rk1ISElQ?=
 =?utf-8?B?U2hqUmgzd3h1WXNFV01BTldUNjExSldEVGNPTEhscWwxR0RMMkx3cXdNOVFr?=
 =?utf-8?B?RnVCYzZqMDdUWExSL05PaW56eUpCcDhiUTFDWWJlTG1qM3BVaDM1MTIrS25m?=
 =?utf-8?B?SjVqZldSc1JGSzZNQTFLRzJkeEdDOGJ4bHhLaFJVRldac3FpNjgvbWgwMnVr?=
 =?utf-8?B?V2tCcU16Q2RWT2wrVnJKbXk2RDZ6Z2RjMnVHeUM4ejdzNjFxUmZTK3BwT3hZ?=
 =?utf-8?B?K1pMQzUxdjU2Ny9NanExZWFlbGs2YVlwM2pOU1EvY09hbWp2MTNrY2U2MHdj?=
 =?utf-8?B?UW11c00zcHVkRmtWaXRPc2JvOWJoYTdqTS9kMENpdEUwZE10bS9md1pKemNO?=
 =?utf-8?B?Wkp4bDk1NWpjK3ZjVkRiRXpBcXpkUzhTWHVtNDU1TlgveEFKRlRIUytCMk8z?=
 =?utf-8?B?MGo5VTNiZ0RGTThibk51VzZhS1BRS2haT0JuWHQrd3JPbHJKdDY0MVhETnpW?=
 =?utf-8?B?OUZUS0Jxc2FyeWZ2Vk92eFRSRmZTRCtCanNSZCs3NmFQOElVamZWbWlVRFEv?=
 =?utf-8?B?blpNa21xd1F0aUVka2pOcitpY3oxN2lCQVZVeFhPa3lJNTAybk9Tb2lOMjBV?=
 =?utf-8?B?VFZDZnFVNUZ0NTFPZnBBY0NRb2l2L09NQStUVzJoMkM5bGFoQzBLMDhnUEJG?=
 =?utf-8?B?bUh4bnNsWFlueWpDSkxXWTVlYjYwQTB5S0N5dG5Rc3pmVDVRbEhPb2crc045?=
 =?utf-8?Q?QcAd/rB0Q/U8bVV23l9IMnQweWSX6K11q5bS+S/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f6a72d-824d-4078-5185-08d91c23e92f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 06:44:41.0121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Drp7289SPyc6I4+q2DFyfhJFbncbkvFj1KOc2Hn23RE8IHO+DYS3ApT1sqTGYYlP4rVbEP4sHKkAshtQMURK8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4904
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIEFwcmlsIDYsIDIwMjEgNzozMyBQTQ0KPiANCj4gQWRkIGJ1cyByZWNvdmVyeSBmZWF0dXJl
IGZvciBMUEkyQy4NCj4gTmVlZCBhZGQgZ3BpbyBwaW5jdHJsLCBzY2wtZ3Bpb3MgYW5kIHNkYS1n
cGlvcyBjb25maWd1cmF0aW9uIGluIGR0cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENsYXJrIFdh
bmcgPHhpYW9uaW5nLndhbmdAbnhwLmNvbT4NCj4gLS0tDQo+IFYyIGNoYW5nZXM6DQo+ICAtIE5v
IGNoYW5nZS4gQWRkIGR0LWJpbmRpbmdzIGluIHRoZSBuZXh0IHBhdGNoLg0KDQpEdCBiaW5kaW5n
IHBhdGNoIHNob3VsZCBiZSBzZW50IGJlZm9yZSBkcml2ZXIgY2hhbmdlDQoNCj4gLS0tDQo+ICBk
cml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jIHwgODMgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgODMgaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gYi9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jDQo+IGluZGV4IDc3Y2ViNzQzYjI4Mi4uNzdk
ZDZlZTVhNGE4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGky
Yy5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gQEAgLTE4
LDYgKzE4LDcgQEANCj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gICNpbmNsdWRlIDxs
aW51eC9vZi5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPg0KPiArI2luY2x1ZGUg
PGxpbnV4L29mX2dwaW8uaD4NCj4gICNpbmNsdWRlIDxsaW51eC9waW5jdHJsL2NvbnN1bWVyLmg+
DQo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ICAjaW5jbHVkZSA8bGlu
dXgvcG1fcnVudGltZS5oPg0KPiBAQCAtMTA4LDYgKzEwOSwxMSBAQCBzdHJ1Y3QgbHBpMmNfaW14
X3N0cnVjdCB7DQo+ICAJdW5zaWduZWQgaW50CQl0eGZpZm9zaXplOw0KPiAgCXVuc2lnbmVkIGlu
dAkJcnhmaWZvc2l6ZTsNCj4gIAllbnVtIGxwaTJjX2lteF9tb2RlCW1vZGU7DQo+ICsNCj4gKwlz
dHJ1Y3QgaTJjX2J1c19yZWNvdmVyeV9pbmZvIHJpbmZvOw0KPiArCXN0cnVjdCBwaW5jdHJsICpw
aW5jdHJsOw0KPiArCXN0cnVjdCBwaW5jdHJsX3N0YXRlICpwaW5jdHJsX3BpbnNfZGVmYXVsdDsN
Cj4gKwlzdHJ1Y3QgcGluY3RybF9zdGF0ZSAqcGluY3RybF9waW5zX2dwaW87DQo+ICB9Ow0KPiAN
Cj4gIHN0YXRpYyB2b2lkIGxwaTJjX2lteF9pbnRjdHJsKHN0cnVjdCBscGkyY19pbXhfc3RydWN0
ICpscGkyY19pbXgsIEBAIC0xMzUsNg0KPiArMTQxLDggQEAgc3RhdGljIGludCBscGkyY19pbXhf
YnVzX2J1c3koc3RydWN0IGxwaTJjX2lteF9zdHJ1Y3QgKmxwaTJjX2lteCkNCj4gDQo+ICAJCWlm
ICh0aW1lX2FmdGVyKGppZmZpZXMsIG9yaWdfamlmZmllcyArIG1zZWNzX3RvX2ppZmZpZXMoNTAw
KSkpIHsNCj4gIAkJCWRldl9kYmcoJmxwaTJjX2lteC0+YWRhcHRlci5kZXYsICJidXMgbm90IHdv
cmtcbiIpOw0KPiArCQkJaWYgKGxwaTJjX2lteC0+YWRhcHRlci5idXNfcmVjb3ZlcnlfaW5mbykN
Cj4gKwkJCQlpMmNfcmVjb3Zlcl9idXMoJmxwaTJjX2lteC0+YWRhcHRlcik7DQo+ICAJCQlyZXR1
cm4gLUVUSU1FRE9VVDsNCj4gIAkJfQ0KPiAgCQlzY2hlZHVsZSgpOw0KPiBAQCAtMTkyLDYgKzIw
MCw4IEBAIHN0YXRpYyB2b2lkIGxwaTJjX2lteF9zdG9wKHN0cnVjdCBscGkyY19pbXhfc3RydWN0
DQo+ICpscGkyY19pbXgpDQo+IA0KPiAgCQlpZiAodGltZV9hZnRlcihqaWZmaWVzLCBvcmlnX2pp
ZmZpZXMgKyBtc2Vjc190b19qaWZmaWVzKDUwMCkpKSB7DQo+ICAJCQlkZXZfZGJnKCZscGkyY19p
bXgtPmFkYXB0ZXIuZGV2LCAic3RvcCB0aW1lb3V0XG4iKTsNCj4gKwkJCWlmIChscGkyY19pbXgt
PmFkYXB0ZXIuYnVzX3JlY292ZXJ5X2luZm8pDQo+ICsJCQkJaTJjX3JlY292ZXJfYnVzKCZscGky
Y19pbXgtPmFkYXB0ZXIpOw0KPiAgCQkJYnJlYWs7DQo+ICAJCX0NCj4gIAkJc2NoZWR1bGUoKTsN
Cj4gQEAgLTMyOSw2ICszMzksOCBAQCBzdGF0aWMgaW50IGxwaTJjX2lteF90eGZpZm9fZW1wdHko
c3RydWN0DQo+IGxwaTJjX2lteF9zdHJ1Y3QgKmxwaTJjX2lteCkNCj4gDQo+ICAJCWlmICh0aW1l
X2FmdGVyKGppZmZpZXMsIG9yaWdfamlmZmllcyArIG1zZWNzX3RvX2ppZmZpZXMoNTAwKSkpIHsN
Cj4gIAkJCWRldl9kYmcoJmxwaTJjX2lteC0+YWRhcHRlci5kZXYsICJ0eGZpZm8gZW1wdHkgdGlt
ZW91dFxuIik7DQo+ICsJCQlpZiAobHBpMmNfaW14LT5hZGFwdGVyLmJ1c19yZWNvdmVyeV9pbmZv
KQ0KPiArCQkJCWkyY19yZWNvdmVyX2J1cygmbHBpMmNfaW14LT5hZGFwdGVyKTsNCj4gIAkJCXJl
dHVybiAtRVRJTUVET1VUOw0KPiAgCQl9DQo+ICAJCXNjaGVkdWxlKCk7DQo+IEBAIC01MjgsNiAr
NTQwLDcxIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBscGkyY19pbXhfaXNyKGludCBpcnEsIHZvaWQg
KmRldl9pZCkNCj4gIAlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ICB9DQo+IA0KPiArc3RhdGljIHZv
aWQgbHBpMmNfaW14X3ByZXBhcmVfcmVjb3Zlcnkoc3RydWN0IGkyY19hZGFwdGVyICphZGFwKSB7
DQo+ICsJc3RydWN0IGxwaTJjX2lteF9zdHJ1Y3QgKmxwaTJjX2lteDsNCj4gKw0KPiArCWxwaTJj
X2lteCA9IGNvbnRhaW5lcl9vZihhZGFwLCBzdHJ1Y3QgbHBpMmNfaW14X3N0cnVjdCwgYWRhcHRl
cik7DQo+ICsNCj4gKwlwaW5jdHJsX3NlbGVjdF9zdGF0ZShscGkyY19pbXgtPnBpbmN0cmwsDQo+
ICtscGkyY19pbXgtPnBpbmN0cmxfcGluc19ncGlvKTsgfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBs
cGkyY19pbXhfdW5wcmVwYXJlX3JlY292ZXJ5KHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCkgew0K
PiArCXN0cnVjdCBscGkyY19pbXhfc3RydWN0ICpscGkyY19pbXg7DQo+ICsNCj4gKwlscGkyY19p
bXggPSBjb250YWluZXJfb2YoYWRhcCwgc3RydWN0IGxwaTJjX2lteF9zdHJ1Y3QsIGFkYXB0ZXIp
Ow0KPiArDQo+ICsJcGluY3RybF9zZWxlY3Rfc3RhdGUobHBpMmNfaW14LT5waW5jdHJsLA0KPiAr
bHBpMmNfaW14LT5waW5jdHJsX3BpbnNfZGVmYXVsdCk7IH0NCj4gKw0KPiArLyoNCj4gKyAqIFdl
IHN3aXRjaCBTQ0wgYW5kIFNEQSB0byB0aGVpciBHUElPIGZ1bmN0aW9uIGFuZCBkbyBzb21lIGJp
dGJhbmdpbmcNCj4gKyAqIGZvciBidXMgcmVjb3ZlcnkuIFRoZXNlIGFsdGVybmF0aXZlIHBpbm11
eCBzZXR0aW5ncyBjYW4gYmUNCj4gKyAqIGRlc2NyaWJlZCBpbiB0aGUgZGV2aWNlIHRyZWUgYnkg
YSBzZXBhcmF0ZSBwaW5jdHJsIHN0YXRlICJncGlvIi4gSWYNCj4gKyAqIHRoaXMgaXMgbWlzc2lu
ZyB0aGlzIGlzIG5vdCBhIGJpZyBwcm9ibGVtLCB0aGUgb25seSBpbXBsaWNhdGlvbiBpcw0KPiAr
ICogdGhhdCB3ZSBjYW4ndCBkbyBidXMgcmVjb3ZlcnkuDQo+ICsgKi8NCj4gK3N0YXRpYyBpbnQg
bHBpMmNfaW14X2luaXRfcmVjb3ZlcnlfaW5mbyhzdHJ1Y3QgbHBpMmNfaW14X3N0cnVjdCAqbHBp
MmNfaW14LA0KPiArCQlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArew0KPiArCXN0
cnVjdCBpMmNfYnVzX3JlY292ZXJ5X2luZm8gKnJpbmZvID0gJmxwaTJjX2lteC0+cmluZm87DQo+
ICsNCj4gKwlscGkyY19pbXgtPnBpbmN0cmwgPSBkZXZtX3BpbmN0cmxfZ2V0KCZwZGV2LT5kZXYp
Ow0KPiArCWlmICghbHBpMmNfaW14LT5waW5jdHJsIHx8IElTX0VSUihscGkyY19pbXgtPnBpbmN0
cmwpKSB7DQo+ICsJCWRldl9pbmZvKCZwZGV2LT5kZXYsICJjYW4ndCBnZXQgcGluY3RybCwgYnVz
IHJlY292ZXJ5IG5vdA0KPiBzdXBwb3J0ZWRcbiIpOw0KPiArCQlyZXR1cm4gUFRSX0VSUihscGky
Y19pbXgtPnBpbmN0cmwpOw0KPiArCX0NCj4gKw0KPiArCWxwaTJjX2lteC0+cGluY3RybF9waW5z
X2RlZmF1bHQgPSBwaW5jdHJsX2xvb2t1cF9zdGF0ZShscGkyY19pbXgtPnBpbmN0cmwsDQo+ICsJ
CQlQSU5DVFJMX1NUQVRFX0RFRkFVTFQpOw0KPiArCWxwaTJjX2lteC0+cGluY3RybF9waW5zX2dw
aW8gPSBwaW5jdHJsX2xvb2t1cF9zdGF0ZShscGkyY19pbXgtPnBpbmN0cmwsDQo+ICsJCQkiZ3Bp
byIpOw0KPiArCXJpbmZvLT5zZGFfZ3Bpb2QgPSBkZXZtX2dwaW9kX2dldCgmcGRldi0+ZGV2LCAi
c2RhIiwgR1BJT0RfSU4pOw0KPiArCXJpbmZvLT5zY2xfZ3Bpb2QgPSBkZXZtX2dwaW9kX2dldCgm
cGRldi0+ZGV2LCAic2NsIiwNCj4gK0dQSU9EX09VVF9ISUdIX09QRU5fRFJBSU4pOw0KPiArDQo+
ICsJaWYgKFBUUl9FUlIocmluZm8tPnNkYV9ncGlvZCkgPT0gLUVQUk9CRV9ERUZFUiB8fA0KPiAr
CSAgICBQVFJfRVJSKHJpbmZvLT5zY2xfZ3Bpb2QpID09IC1FUFJPQkVfREVGRVIpIHsNCj4gKwkJ
cmV0dXJuIC1FUFJPQkVfREVGRVI7DQo+ICsJfSBlbHNlIGlmIChJU19FUlIocmluZm8tPnNkYV9n
cGlvZCkgfHwNCj4gKwkJICAgSVNfRVJSKHJpbmZvLT5zY2xfZ3Bpb2QpIHx8DQo+ICsJCSAgIElT
X0VSUihscGkyY19pbXgtPnBpbmN0cmxfcGluc19kZWZhdWx0KSB8fA0KPiArCQkgICBJU19FUlIo
bHBpMmNfaW14LT5waW5jdHJsX3BpbnNfZ3BpbykpIHsNCj4gKwkJZGV2X2RiZygmcGRldi0+ZGV2
LCAicmVjb3ZlcnkgaW5mb3JtYXRpb24gaW5jb21wbGV0ZVxuIik7DQo+ICsJCXJldHVybiAwOw0K
PiArCX0NCj4gKw0KPiArCWRldl9pbmZvKCZwZGV2LT5kZXYsICJ1c2luZyBzY2wlcyBmb3IgcmVj
b3ZlcnlcbiIsDQo+ICsJCSByaW5mby0+c2RhX2dwaW9kID8gIixzZGEiIDogIiIpOw0KPiArDQo+
ICsJcmluZm8tPnByZXBhcmVfcmVjb3ZlcnkgPSBscGkyY19pbXhfcHJlcGFyZV9yZWNvdmVyeTsN
Cj4gKwlyaW5mby0+dW5wcmVwYXJlX3JlY292ZXJ5ID0gbHBpMmNfaW14X3VucHJlcGFyZV9yZWNv
dmVyeTsNCj4gKwlyaW5mby0+cmVjb3Zlcl9idXMgPSBpMmNfZ2VuZXJpY19zY2xfcmVjb3Zlcnk7
DQo+ICsJbHBpMmNfaW14LT5hZGFwdGVyLmJ1c19yZWNvdmVyeV9pbmZvID0gcmluZm87DQo+ICsN
Cj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiAgc3RhdGljIHUzMiBscGkyY19pbXhfZnVuYyhz
dHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXB0ZXIpICB7DQo+ICAJcmV0dXJuIEkyQ19GVU5DX0kyQyB8
IEkyQ19GVU5DX1NNQlVTX0VNVUwgfCBAQCAtNjMyLDYgKzcwOSwxMg0KPiBAQCBzdGF0aWMgaW50
IGxwaTJjX2lteF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCWxwaTJj
X2lteC0+dHhmaWZvc2l6ZSA9IDEgPDwgKHRlbXAgJiAweDBmKTsNCj4gIAlscGkyY19pbXgtPnJ4
Zmlmb3NpemUgPSAxIDw8ICgodGVtcCA+PiA4KSAmIDB4MGYpOw0KPiANCj4gKwkvKiBJbml0IG9w
dGlvbmFsIGJ1cyByZWNvdmVyeSBmdW5jdGlvbiAqLw0KPiArCXJldCA9IGxwaTJjX2lteF9pbml0
X3JlY292ZXJ5X2luZm8obHBpMmNfaW14LCBwZGV2KTsNCj4gKwkvKiBHaXZlIGl0IGFub3RoZXIg
Y2hhbmNlIGlmIHBpbmN0cmwgdXNlZCBpcyBub3QgcmVhZHkgeWV0ICovDQo+ICsJaWYgKHJldCA9
PSAtRVBST0JFX0RFRkVSKQ0KPiArCQlnb3RvIHJwbV9kaXNhYmxlOw0KPiArDQo+ICAJcmV0ID0g
aTJjX2FkZF9hZGFwdGVyKCZscGkyY19pbXgtPmFkYXB0ZXIpOw0KPiAgCWlmIChyZXQpDQo+ICAJ
CWdvdG8gcnBtX2Rpc2FibGU7DQo+IC0tDQo+IDIuMjUuMQ0KDQo=
