Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 227D4771021
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 16:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjHEOZy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Aug 2023 10:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjHEOZw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Aug 2023 10:25:52 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2107.outbound.protection.outlook.com [40.107.114.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A400C3C16;
        Sat,  5 Aug 2023 07:25:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXDinQH28BCACvJetqePcsF4R4ZS3PD2goHubbYdmkuJQ6mCRhvHm5RtUxTDvbsz9ON6hBw4c5LSrlm1mdFyH3Ig1fahEUggQxzdWGCcohLQzrHu24/CULf17pmNEeVOpDyacbQvMhmX6+vt6cshYItw7fwOYxmfeIxaPQo6QATFPhDeEqQpHfQbBZ0iheWWwTRLMVb99WdX/cXu4JDxKkfGw8ZygZtKOifhOHXNSJgC858X74rRYufVHP9rcooHvqdJrpsc4EUS+H9mvzN0mB86ZMmwOxNkJ+PO1hRF3q6JlQI3yuxulRoxuitJAPJKzpRLmClkIVi+Pts4U5+f2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BiTiaQXapDOesVgcY5JEQZPetC2ihPssMu9NSGgNITI=;
 b=obhgXieQEWSMfvDNNg760JY0yj6VXOVkcd35olwF3O0PegaaU4nXqLu52sa3IxTdposFF7dotMX3oS6oUFXu2D0qbj/n1n4/ck8Y6+7NeGp9W0OF4dqTm9Z49LJfgNcWCMAyRicLmNg2EUUOBhtA7I7iU7mmZNTnAuo+WGuB54txtWEQrqsXNFd+y/mzCVhoQC1Lg7WcDdKg3bNEUahWuw9wrIEQgXTe5OOfoBFbdj1M8ViEGBCYbLq1roOGs3G74b/UI4qwIEPzylg8v+G3e0Jl2VXjVDcAN6qU7LEtPcocDUUWRQyuY6ZNZf1HWqAfr7Jt6wMIiV0zY/0F0E1zKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BiTiaQXapDOesVgcY5JEQZPetC2ihPssMu9NSGgNITI=;
 b=qWsB8wmFKrG03tmVpfeG1dZnCBI1q0agtK3psEg04hBQIYjZNjrZvAu6osVJ8j11Mb0DAwWBAsgE+KogE9/B0OUFOLQOhAKeiTWZFV7XEydFY3jCQBH9KOeZ3z5uVB7Tmvl+Dfn74TFy5Y1tPwUDrOAC5M91ZJV/1UMVe5j7HXk=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYCPR01MB12012.jpnprd01.prod.outlook.com (2603:1096:400:387::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.22; Sat, 5 Aug
 2023 14:25:45 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::f5b0:8a:38cb:1fb1]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::f5b0:8a:38cb:1fb1%5]) with mapi id 15.20.6652.025; Sat, 5 Aug 2023
 14:25:44 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Peter Rosin <peda@axentia.se>
CC:     Michael Hennerich <michael.hennerich@analog.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] i2c: mux: ltc4306: Drop enum ltc_type and split
 chips[]
Thread-Topic: [PATCH v2 2/2] i2c: mux: ltc4306: Drop enum ltc_type and split
 chips[]
Thread-Index: AQHZuLVXvdrQExZ/IE63tBtI1ffW06/b3HYAgAACLYA=
Date:   Sat, 5 Aug 2023 14:25:44 +0000
Message-ID: <TYCPR01MB59334B6AFAEADD75DA94FC2C860EA@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230717134807.265302-1-biju.das.jz@bp.renesas.com>
 <20230717134807.265302-3-biju.das.jz@bp.renesas.com>
 <c557d38f-a899-69a0-8c76-b867f0448a6d@axentia.se>
In-Reply-To: <c557d38f-a899-69a0-8c76-b867f0448a6d@axentia.se>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYCPR01MB12012:EE_
x-ms-office365-filtering-correlation-id: 58fdea20-8636-47af-d827-08db95bfda9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PQZG5tY5nS00C4kalqk/nxTlAANtxzMYw+M7I2YRyK7ny4UxVIkqQNJUt7zPBf0MJv8UqRXC/tSz83t5TkHKSATXFLy3KzMtZjCE5bF6iyVsqrkK0nvjdUXw+sjrS48IHL2TlwLhPaf344UluG+uSH6aUNUH/3CFY+wJzWOfouSU8JnI6Rh9FDd6wyYE4/PV2XGYPspFp+LO+S1qDXZKiYx9J148C43PvCMyw4PLs+tRFLH7AvIG+UCRMjkuUX8b3jcNZ5mbePJIcMwYtiysiqerf2im+v0UqhqDSP07kmbyQO7cjfaBhGsaXJj7P3JwBJ41IndnnNryGdWzsIaHclQdEmaBKRzwrW6LE8xumCcRLrm4UFb5w/gH94fMK7xO3+IFyEWlLRVwyEoG2B+BytYMZxG3WLptgRRkczz7PHyxZrltt43ONVCd+ZHaPRyJBtM3oVK3qoSqk6lrAghbUUZtBv/qe2BZ4gzVMZw7EdsTLbZoSW1KiDouXZJt+SHHiuHtHNY8u8He/5PuVqh6vMQ4JCw/+fEnr+KPngT/8UA7L9TrKXopDwxM8BHYTZFuPqlu2PQ29H3OKnq9qTNziV2Tx0LBpJxbOhc4qhid3ga4da3WSW1VwB+bSvhW8smF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(186006)(1800799003)(5660300002)(52536014)(76116006)(64756008)(4326008)(6916009)(2906002)(66946007)(66476007)(66446008)(66556008)(316002)(54906003)(8936002)(8676002)(41300700001)(478600001)(66574015)(86362001)(71200400001)(38070700005)(9686003)(7696005)(122000001)(38100700002)(33656002)(6506007)(55016003)(26005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWFNL1dXVnpUakVsRmd4ajJ3eHRqMThRdFBjSGxaRE9FWkxDRW9leHd6WlJM?=
 =?utf-8?B?WnRVWSt3N2p1ZGNSNVEvNDk3NzlWMmxGTlBzUWNrSlhKTUh3MEY4Q1hHRCtS?=
 =?utf-8?B?cHFrMnF6U2hmd3hla0xISkhXS1FRUkJ5YmhnZmVoUDg4em45RXJJWTBja1lm?=
 =?utf-8?B?QW12cU91MDlZZjFCRFdsMTRmZE9hSTNWQ2RJZW1UWXJCSFBTaThDWWdDTUpX?=
 =?utf-8?B?Q2d3QVpGMkxudWlscm1RNElPUG9wVFBJRllsbWFrKzlHeGVpZzl4d0lzcVEy?=
 =?utf-8?B?d1BIUTNTSnFVTG93eEhwSjl1WlpheENXeC9uMCtVSlZlUVpOblBPb0VoRzA4?=
 =?utf-8?B?aVUxWWRWOXVMNDlTNjk2NzV4d0RHUzBDOTBqKzl3alpZUC9GUUlyMHNjT3JT?=
 =?utf-8?B?MEpJaDlEaGJSUE4xdjdyMjI4c282RjhzcHNHNFREbU5UUEhoc2VFcjdIcmk5?=
 =?utf-8?B?UEszckhiYnRFNWp1QjZQLzNpckN2VjJNZ0RJcDBDejUyU1N5OXEra0JjMlov?=
 =?utf-8?B?ZFRpcHJielJ6TjBIdjVQRGsrZ1kyZDlkbW5RNmFpcDYwWTF1RWlKWFBzZ3Bt?=
 =?utf-8?B?QmdWazE3a1RxMHNxdS9YQURIVTMvUFhibGZqUGdWUXJGcU4rVUpSNkNtOGl6?=
 =?utf-8?B?aUNranpla3hVQjAxOXBIYlFRVkVpa0IrWis1dVc2MGVndzZoamJMYjFmTUhR?=
 =?utf-8?B?UGhpdkMzSG9vQ3czSFFKNFAxZ2dwL3hCRW5yNlc0RVVZQXg0Qkw2WXdrTEZl?=
 =?utf-8?B?N3V0ZGhHc2tIS0NnWnZrNmR2dUZyZmFrcHc1SmttUDdRRExEQTJnWkpscVlG?=
 =?utf-8?B?UHo0Um94QjFkQmJ6a1Yvb2ZtMHJaVVQxa0hoVm16aHNHM0xnTllhTzZ5S0E1?=
 =?utf-8?B?bjN0SFErelowK0FXWG12T2tSWUFDZlRRSk5mUktVaVhYdjhkUS9pdm1qaytt?=
 =?utf-8?B?S3loZlFuQ3FhcFNMc1dPM3FTTEpIMG9TSUxkOFl6QU83VUdmdnlHcGhna0da?=
 =?utf-8?B?QngrWnFBS3RkRFZVdWUzSm9GREFqRVRsZHR0VFFFd2haZXRGYlVJU2FnMmpE?=
 =?utf-8?B?K2NvelhqQ1hUakRTUXZrYUp2aC9TSmYyMGZhb3dlUzNnTDl6eUpyY2o1dVJB?=
 =?utf-8?B?S1REL0F3TEs3MUlKbjBaVFhpMGRYUEc5bFlWRDg1M0hrMjhaSmR0WE9STGFT?=
 =?utf-8?B?aG8xMTN6MWR6Wit6ZWRwUlp0VEoweXFad0o2eGk4UDljQ1dPTk9xbEJSWkRT?=
 =?utf-8?B?VEN3UE13VzRrMSs0VVFwV3p1Y1JxbFhJbnJpSGJRR3ppUFl6NHJwVFYrWUJN?=
 =?utf-8?B?Z09naEN5SGZtM2JnUTEycUlmdTlja0ZPMGRkMEdhZ3FDbkJOdGhRR1JhcHRp?=
 =?utf-8?B?VWIvNXdkcy9FajB0YzloV0Yrd2xPamQzT1VKWkVvYS9WTE9MN2ZxUFVzZTc0?=
 =?utf-8?B?c1V4RU1BLzRqUDY2SkxiQUlZYmttK0orTERMdzd4NkhmUHFyYkJ5azZoaGky?=
 =?utf-8?B?akVWNGVEa2V0aTQ1azB1dERMZ2I4b0ppWGNUUzRMRHJPM0FsdG1qNytSbEtp?=
 =?utf-8?B?QThhbTZaTmx0K25ZT3k0Q20xYXdKdHJIMjBoUFJLZFV2Nmhud1FIeFlRL3Fl?=
 =?utf-8?B?ZEU1Q3RQWGZDNSs5RmZtTFZrMHJ5ZExaTlM4bHY0UExxQ0xrY0JmcnY5VTRS?=
 =?utf-8?B?Si9NM1J1VFBLM1FIakZVaVVYVjdCNXBpczNLbW9JSnM4cEZsTE5JcDFHTzJh?=
 =?utf-8?B?ZnVmNVFCMVA3Y1NLbHI2ZmFEeVVLbXFxSTNXT1dtLzdKU1E1a1BxcFNtVDdw?=
 =?utf-8?B?a0tNZENBTHdraDd4Vm5yUlJ1VUNnWE5YWTY4bFg5NncxRnl6M2tYVGZ5dnZh?=
 =?utf-8?B?aG1pT1VBcjJuOGx5WitMdVI3RVRQajM2bVRxbmtYdTJBMVplTmlCQXA3QXFI?=
 =?utf-8?B?aUJEUkpxQ01EcDlaL0pLblpoRU1TNmQ4d05jZGR3M1JWUTBxOG43cnQySzh6?=
 =?utf-8?B?amV4VUxoeXlwVHNWdzlHY1VoQ1M2ZXlJQVlOc1h4d3NOWGltNWtKUDA5bzcy?=
 =?utf-8?B?ZEk5M2FjdHVTRnBickZvbXpLQ291ZTd4blY4c1cyUkF4MEkwTlQxdzRTSitC?=
 =?utf-8?B?SkFFT2pITzEvZ3Y3SGN4SUVDZy8rNzhiY3JLK3U5clB0anZRbE1DaTBvR2pq?=
 =?utf-8?B?UlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58fdea20-8636-47af-d827-08db95bfda9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2023 14:25:44.2039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lniHBGayEDUqCWykVvO7pt5WNaASLJCPCpvGXFFfOKoE3fLPgx1JSg/riazP5KemyMIDCJThmk9baeXJBaZDIBLykwAZkEckkYVaVymFj2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12012
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgUGV0ZXIgUm9zaW4sDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjIgMi8yXSBpMmM6IG11eDogbHRjNDMwNjogRHJvcCBlbnVtIGx0Y190eXBl
IGFuZA0KPiBzcGxpdCBjaGlwc1tdDQo+IA0KPiBIaSENCj4gDQo+IDIwMjMtMDctMTcgYXQgMTU6
NDgsIEJpanUgRGFzIHdyb3RlOg0KPiA+IERyb3AgZW51bSBsdGNfdHlwZSBhbmQgc3BsaXQgdGhl
IGFycmF5IGNoaXBzW10gYXMgaW5kaXZpZHVhbA0KPiA+IHZhcmlhYmxlcywgYW5kIG1ha2UgbGlu
ZXMgc2hvcnRlciBieSByZWZlcnJpbmcgdG8gZS5nLiAmbHRjXzQzMDVfY2hpcA0KPiANCj4gV2hh
dCBkbyB5b3UgbWVhbiAibWFrZSBsaW5lcyBzaG9ydGVyIj8/Pw0KDQpIZXJlIHRoZSBtYWluIHBv
aW50IGlzICwNCg0KMSkgQSBzaW5nbGUgQVBJIHRvIGZpbmQgbWF0Y2ggZGF0YSBmb3IgdGhpcyBk
ZXZpY2UgZnJvbSBhIHZhcmlldHkgb2YgdGFibGVzDQogICBPRi9BQ1BJL0kyQyBhbmQgdG9tb3Jy
b3cgSTJDIHN5c2ZzLiBZb3UgY2FuIGF2b2lkIGxvdCBvZiBpZidzIGhlcmUuDQoNCjIpIERyb3Bw
aW5nIHVubmVjZXNzYXJ5IGVudW0uDQoNCkJhc2ljYWxseSwgaXQgaXMgc2F2aW5nIGNvZGUgc2l6
ZSBmb3IgdGhpcyBkcml2ZXIuDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gQnkgYSBmZXcgcGVy
Y2VudCBvciBzb21ldGhpbmcgKDIgY2hhcnMpLiBXaGVuIHlvdXIgcHJldmlvdXMgcGF0Y2ggbWFk
ZQ0KPiB0aG9zZSBzYW1lIGxpbmVzIG1vcmUgdGhhbiAyLjUgdGltZXMgYXMgbG9uZyEgSSBoYXZl
IHRvIHNheSwgZ29pbmcgZnJvbSAyNA0KPiB0byA2MiBpc24ndCBleGFjdGx5IG1ha2luZyBsaW5l
cyBzaG9ydGVyLi4uDQo+IA0KPiBOb3QgdGhhdCBJIGNhcmUgZGVlcGx5IGFib3V0IGxpbmUgbGVu
Z3RoIHdlbGwgYmVsb3cgODAsIGJ1dCBpZiBvbmUgb2YgdGhlDQo+IHNlbGxpbmcgcG9pbnRzIGlz
IGxpbmUgbGVuZ3RoIHlvdSBzaG91bGQgcHJlc2VudCBhIHBhdGNoIHNlcmllcyB0aGF0DQo+IGFj
dHVhbGx5IG1ha2UgbGluZXMgc2hvcnRlciBpbnN0ZWFkIG9mIGxvbmdlci4gSG93ZXZlciwgdGhl
IG5lZWQgdG8gc2VsbCBhDQo+IHBhdGNoIG9uIHNob3J0ZXIgbGluZSBsZW5ndGggd2hlbiB0aGUg
bGluZXMgYXJlIGFjdHVhbGx5IG1hZGUgbG9uZ2VyIGJ5DQo+IHRoZSBzZXJpZXMgaXMgYSBzaWdu
IHRoYXQgc29tZXRoaW5nIGlzIG5vdCByaWdodC4NCj4gDQo+IFNvLCBhZ2FpbiwgSSBmYWlsIHRv
IHNlZSB0aGUgcG9pbnQgb2YgcGF0Y2hlcyBsaWtlIHRoaXMuDQo+IA0KPiBBbHNvIGFnYWluLCBJ
IHRoaW5rIGl0IGlzIGJhZCB0byBoYXZlIGEgbmFtZWQgZmllbGQgZm9yIC5kcml2ZXJfZGF0YSBi
dXQNCj4gbm90IGZvciB0aGUgb3RoZXIgbWVtYmVyIG9mIHRoZSBzdHJ1Y3QgaTJjX2RldmljZV9p
ZCBpbml0cy4gTm90IHRoYXQgaXQNCj4gbWF0dGVycyBtdWNoIHdoZW4gdGhlIHdob2xlIGV4ZXJj
aXNlIGlzIHBvaW50bGVzcy4NCj4gDQo+IEFsc28gYWdhaW4sIHdoYXQgeW91IG5lZWQgdG8gcHJl
c2VudCB0byBnZXQgbWUgb24gYm9hcmQgZm9yIHBhdGNoZXMgbGlrZQ0KPiB0aGlzIGlzIHRvIHNv
bWVob3cgbWFrZSBpdCAqb25lKiB0YWJsZSB3aXRoIGRyaXZlciBkYXRhLiBUaGVuIGl0IG1ha2Vz
DQo+IHNlbnNlIHRvIGZvcmNlIGFsbCBkcml2ZXIgZGF0YSB0byBoYXZlIHRoZSBzYW1lIHZhbHVl
LiBCdXQgYXMgSSBzZWUgbm8NCj4gcm9hZCBtYXAgZm9yIHVuaWZ5aW5nIHRoZSB0YWJsZXMgZm9y
IGRyaXZlciBkYXRhIHRoZXJlIGlzIHNpbXBseSBubyBwb2ludA0KPiB0byB0aGUgY2h1cm4uLi4N
Cj4gDQo+IENoZWVycywNCj4gUGV0ZXINCj4gDQo+ID4gaW5zdGVhZCBvZiAmY2hpcHNbbHRjXzQz
MDVdLg0KPiA+DQo+ID4gU3VnZ2VzdGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3Jl
bmVzYXNAZ2xpZGVyLmJlPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2MjoNCj4gPiAgKiBOZXcgcGF0Y2gNCj4g
PiAtLS0NCj4gPiAgZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1sdGM0MzA2LmMgfCAyOCArKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRp
b25zKCspLCAxNyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2ky
Yy9tdXhlcy9pMmMtbXV4LWx0YzQzMDYuYw0KPiA+IGIvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11
eC1sdGM0MzA2LmMNCj4gPiBpbmRleCBjN2RmZDVlYmE0MTMuLmM0ZjA5MGU4ZDZkYiAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LWx0YzQzMDYuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtbHRjNDMwNi5jDQo+ID4gQEAgLTM0LDExICszNCw2
IEBADQo+ID4gICNkZWZpbmUgTFRDX0dQSU9fQUxMX0lOUFVUCTB4QzANCj4gPiAgI2RlZmluZSBM
VENfU1dJVENIX01BU0sJCTB4RjANCj4gPg0KPiA+IC1lbnVtIGx0Y190eXBlIHsNCj4gPiAtCWx0
Y180MzA1LA0KPiA+IC0JbHRjXzQzMDYsDQo+ID4gLX07DQo+ID4gLQ0KPiA+ICBzdHJ1Y3QgY2hp
cF9kZXNjIHsNCj4gPiAgCXU4IG5jaGFuczsNCj4gPiAgCXU4IG51bV9ncGlvczsNCj4gPiBAQCAt
NTAsMTQgKzQ1LDEzIEBAIHN0cnVjdCBsdGM0MzA2IHsNCj4gPiAgCWNvbnN0IHN0cnVjdCBjaGlw
X2Rlc2MgKmNoaXA7DQo+ID4gIH07DQo+ID4NCj4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBjaGlw
X2Rlc2MgY2hpcHNbXSA9IHsNCj4gPiAtCVtsdGNfNDMwNV0gPSB7DQo+ID4gLQkJLm5jaGFucyA9
IExUQzQzMDVfTUFYX05DSEFOUywNCj4gPiAtCX0sDQo+ID4gLQlbbHRjXzQzMDZdID0gew0KPiA+
IC0JCS5uY2hhbnMgPSBMVEM0MzA2X01BWF9OQ0hBTlMsDQo+ID4gLQkJLm51bV9ncGlvcyA9IDIs
DQo+ID4gLQl9LA0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGNoaXBfZGVzYyBsdGNfNDMwNV9j
aGlwID0gew0KPiA+ICsJLm5jaGFucyA9IExUQzQzMDVfTUFYX05DSEFOUw0KPiA+ICt9Ow0KPiA+
ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBjaGlwX2Rlc2MgbHRjXzQzMDZfY2hpcCA9IHsN
Cj4gPiArCS5uY2hhbnMgPSBMVEM0MzA2X01BWF9OQ0hBTlMsDQo+ID4gKwkubnVtX2dwaW9zID0g
Mg0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0YXRpYyBib29sIGx0YzQzMDZfaXNfdm9sYXRpbGVfcmVn
KHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgaW50DQo+ID4gcmVnKSBAQCAtMTkyLDE1ICsx
ODYsMTUgQEAgc3RhdGljIGludCBsdGM0MzA2X2Rlc2VsZWN0X211eChzdHJ1Y3QNCj4gPiBpMmNf
bXV4X2NvcmUgKm11eGMsIHUzMiBjaGFuKSAgfQ0KPiA+DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgaTJjX2RldmljZV9pZCBsdGM0MzA2X2lkW10gPSB7DQo+ID4gLQl7ICJsdGM0MzA1IiwgLmRy
aXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSZjaGlwc1tsdGNfNDMwNV0gfSwNCj4gPiAtCXsg
Imx0YzQzMDYiLCAuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpJmNoaXBzW2x0Y180MzA2
XSB9LA0KPiA+ICsJeyAibHRjNDMwNSIsIC5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkm
bHRjXzQzMDVfY2hpcCB9LA0KPiA+ICsJeyAibHRjNDMwNiIsIC5kcml2ZXJfZGF0YSA9IChrZXJu
ZWxfdWxvbmdfdCkmbHRjXzQzMDZfY2hpcCB9LA0KPiA+ICAJeyB9DQo+ID4gIH07DQo+ID4gIE1P
RFVMRV9ERVZJQ0VfVEFCTEUoaTJjLCBsdGM0MzA2X2lkKTsNCj4gPg0KPiA+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBsdGM0MzA2X29mX21hdGNoW10gPSB7DQo+ID4gLQl7IC5j
b21wYXRpYmxlID0gImxsdGMsbHRjNDMwNSIsIC5kYXRhID0gJmNoaXBzW2x0Y180MzA1XSB9LA0K
PiA+IC0JeyAuY29tcGF0aWJsZSA9ICJsbHRjLGx0YzQzMDYiLCAuZGF0YSA9ICZjaGlwc1tsdGNf
NDMwNl0gfSwNCj4gPiArCXsgLmNvbXBhdGlibGUgPSAibGx0YyxsdGM0MzA1IiwgLmRhdGEgPSAm
bHRjXzQzMDVfY2hpcCB9LA0KPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJsbHRjLGx0YzQzMDYiLCAu
ZGF0YSA9ICZsdGNfNDMwNl9jaGlwIH0sDQo+ID4gIAl7IH0NCj4gPiAgfTsNCj4gPiAgTU9EVUxF
X0RFVklDRV9UQUJMRShvZiwgbHRjNDMwNl9vZl9tYXRjaCk7DQo=
