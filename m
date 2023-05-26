Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A577E7121DD
	for <lists+linux-i2c@lfdr.de>; Fri, 26 May 2023 10:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242135AbjEZILW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 May 2023 04:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjEZILW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 May 2023 04:11:22 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2107.outbound.protection.outlook.com [40.107.113.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA0CA3;
        Fri, 26 May 2023 01:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHoDfCz6VJH2+V+3J9hF/t6SnlrNAvHLmt5UQdX3k7SFLtPoe8JLdX/DU/zykkieSaOzOe8eDxxZixl7Qu/PcsDqIhvqI/vl4GIpZpPs/4/NiEqybYz4rnWA6Y3Lci0z3psPNxSVQBi2anyEKr4/VBXMAjaLeiMYfcEYjfG4kncL6LgiqyNcdtGiCqkjFx/fxYJ7AqaePGxgNCdxkGVr/CaA2E2T9aMtthSm5FYt9Am/Hn3hHmutEjviW7Aedl8S9ZlQi+u5K9eOcwCEwvbSUyoouRFlVlxwN7GIFehEPiQ3JDBgKY1pAe4dbkPIPgkjQK7DOl27pZ7I1J3XwZZstA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pD6l7oFJxLUA/TzXcvvGeSgrVUJjxtWaNMPIh11CSMI=;
 b=i7K0GKPs0uKxCm6kjDP4lNr1f912wUhysVoKJ9Xg9CbPDaji0/geu2x8o3keO4sjx3ePGaVjTpvoDMmxj8t+QHHO6NSHDqEwKZyGyZ45G3u8/9wOhw2Nk7aQ1HRvXXAxGfRtpNx6RnDo8nWVQhtLIPKz4jQlLjP2LpNzIs4UFXi4rRhOQ1ZTDdHv05QqfmNa8ErHK4+lJqmoQCET8wDrx8MVeHE13BQrCuhdXfeGya++7QDaHuAYh11BIdb5XoJ+aTArw8gqX5CuE+VQoXQV0kGMScLWx0RykgUOv+JjymP4WkWE+OR/KZO8D3nb5TVuDyzUduzVCK82af8ZDe/pBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pD6l7oFJxLUA/TzXcvvGeSgrVUJjxtWaNMPIh11CSMI=;
 b=u0JfuMhQLEo0E82wHWYnBVsKOjJtwJIbBINmwoBshnRZV0mOvyYe+1KWz3uIIZU86xRioawGjgILuHqnKzAAI1UjjJZ00B/+RI8VqYheje57Z6TOYdL40m+3Wx2IUJ9QU45CK0P5dI6+7JSzSaW3hV3uDnSgydseVqFKDbT7TmQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB9657.jpnprd01.prod.outlook.com (2603:1096:604:1f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 08:11:15 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6433.016; Fri, 26 May 2023
 08:11:14 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Pavel Machek <pavel@denx.de>
Subject: RE: [PATCH 3/3] i2c: rzv2m: Disable the operation of unit in case of
 error
Thread-Topic: [PATCH 3/3] i2c: rzv2m: Disable the operation of unit in case of
 error
Thread-Index: AQHZjw//iGyXAa9Yo0KLQ3UIw12AGq9rKeKAgAEKlvA=
Date:   Fri, 26 May 2023 08:11:14 +0000
Message-ID: <OS0PR01MB59222A409EDC78FB8197C80286479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230525135108.240651-1-biju.das.jz@bp.renesas.com>
 <20230525135108.240651-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdXpvxpmKNo7wUcxdPq_s0u4jLioFUqxGB9rgogxioz4xg@mail.gmail.com>
In-Reply-To: <CAMuHMdXpvxpmKNo7wUcxdPq_s0u4jLioFUqxGB9rgogxioz4xg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB9657:EE_
x-ms-office365-filtering-correlation-id: 745cfdb6-b5f1-4ba1-53d9-08db5dc0c629
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aYmjFPx9OQYPeXnl74s8fvU45dS9bOZm/5Ia/aY1tud93AK9J6H5styQ8+IbqJwUhbNZWArdw8OUaZLrsX0xNYA6P0uZMYFD7lKmZTMHSuVX2t+VAB+qxatfvj6KeKlYmrmdKdRpbUj8oDSNnGHpxCc0CE3gvMuSzaH6p+8OOwFk2ZtWhgFAJ5RKEmf/Pv9W2xncui4eAdJJvl9Watzds5N41Ku7R/2cRV9vc9VI4NqCgvEqE7BRfPG9iSVK3TNATaREyLO7DZ6UTKFnoHvNLYXi500lCugX0Ub6RSl3R77k4YP+y8j6qAeRJg30UzjUKcvk/Ksx8ezgbIilVSIhmkya9OAlQ8Kw41y45mfB1AEWFWfNUyqQkZC42lW+wKYXJevgI4ZhoJpNjnv2WP0GdnOvjiB0nqhDaTse1EDHzScNavBdrKq1ZrWd5xgsSQYG8fINmAA16RFz+SyYIcCg3vIbDAIqHW93zJIZHA66ag4nODukD/Lueba4Dd95BVYRVNN/w2mMF0meCnpmb28qmbwUijI4B6HRTSiZmBEJr3CpIivEL7oGd6Z2HP6httHeYssI2+em4FxkJJtFLUEanXma6+VA3u3IxOJ/q649PQo0wzX37h0psZgN2DhuddUM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199021)(2906002)(86362001)(54906003)(186003)(33656002)(53546011)(6506007)(38070700005)(5660300002)(52536014)(66556008)(76116006)(66946007)(66476007)(66446008)(64756008)(6916009)(4326008)(83380400001)(8676002)(8936002)(26005)(38100700002)(122000001)(316002)(55016003)(71200400001)(41300700001)(9686003)(478600001)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0toQXY0Z3hMZUtDSUxvTEJHSjRGbnBtVVFPbWNFeEdxUS9pSnhzdWtKVkxX?=
 =?utf-8?B?QjlveDQ2MVhtK0tzVWlTM3pnYVpCYm5mTHd1cHZIbG5xWStZTFQyYTBFODVL?=
 =?utf-8?B?UlBVZXVicGhTdDJybEpZZUUrZWxHbXYvc1FlTDdETit1L0wvaDJnMnBzRTJJ?=
 =?utf-8?B?NmZCOFRuNWFnVkdFbGhCanIvczZVcGMwNStWY2cvWDU0a3BNZzlVZWNzSEdP?=
 =?utf-8?B?RjVienFtSWFJU2tiNXFUeWtHay9kL3pzNThMcHZKWHhsUmhTTkozQjE1YkdO?=
 =?utf-8?B?K1ZWV2QvOTFrMXBDdEhQOEJlcmp2eGQ0WGhteVpVclA1MWNCemZlS013OVk5?=
 =?utf-8?B?TnpTbEFYRDN4KzFQKzl2Y1NTSlV5QWY1Ni9acGRPNW43MDBWWDJBdkJlZzAv?=
 =?utf-8?B?SmVvV2NDTEFuZnlNODkzNVgrRGV6QmR4Nk5ZK21NU052T3AzY1VuRm1Gb0lP?=
 =?utf-8?B?TjYyeUNPQ2JZeHRiV2RRTGF2anB0OWswYzJnTlJLenZOdzZVekdSbEZnMG5j?=
 =?utf-8?B?MktFaVpURDB6aTIwZGl6Z2NXcXVmVjR1OXpsS2Z3dGI2YnF5Z2lHeFhyUi9Z?=
 =?utf-8?B?c0NLSEpQbVdNWlhhcTAwUFdndHJBU01lRk5FYWU2UGhMUjkvNlloTXMyaFh2?=
 =?utf-8?B?WDhZU1A0cldVVUh5VGVPWVc0Y1JuZjZud3VwaEw3Z2xieUozeis0NlhJckd6?=
 =?utf-8?B?UFdRdHZsQVVHMER2UjdRd0hsMXNSVi9NVW9LL1lUWXIvVGJ4UkJkZFVkOHBs?=
 =?utf-8?B?MVo4N1ZJYXNGV21ORmhRRzRBeG53Z2hJOGVyaFRnSmJLMVBraFFxMGNpUGtF?=
 =?utf-8?B?K3Z0SFM3K1FwbmUwRU03ZklxOEFhQUF4dk05dWNEVy9OSzVWZG9vVGIvV0ZN?=
 =?utf-8?B?SkRYMTkramVHNUdPK1M5ZVlETHZqUFpNbWVsQmtLZ2hETVhud0RiNDd3NXh1?=
 =?utf-8?B?d0FyKzFpRzJ4M0F4OFFTTjl5SmRiN0FDZDRZc2JMMGpKRFpQczdHWHJ5ZGdx?=
 =?utf-8?B?bitVaXdmbEVreExmcWxBL2I4OU5lM04yNTVydHB5MFltZE03OVpPZkRCMlhv?=
 =?utf-8?B?dWVYSVQrdHFxWDFPOGw4RkxCZEhuWjI1Tjc2ZTlzSVpyQlhPUVAxdjU4ZmJa?=
 =?utf-8?B?dHVzcDFUdWYxdENBNGZyTGxaY283NElaR3FHWGtkOGV3b3BIK29QbGRzV04v?=
 =?utf-8?B?eDRXRDdKMWJpOWM4dXV4a1dOZWJzcnZqdFpsdFU3NlZ1NWg2Qmw2TVhoajl2?=
 =?utf-8?B?QXNSU1BkMmlUY01kSFBCQ1F3dkNBV05qVStsOVFSWXBXdmJDcUJFOHZvWGlW?=
 =?utf-8?B?YXlROER0bStIRVFmRDZVektsSFRZK25BZjZ4Sml6RXBVaC9rM0xtSlpZRmdj?=
 =?utf-8?B?WXNCNmdmMmMyQWZlTXZZSndaTmxBUWtNaUNqRFJuMWgrWE1EQ2thR1dyK21X?=
 =?utf-8?B?cG1XazlLRVBiOTlTMTdCL2hCYWRNWHhRbXFEMjRPYUV5R29xK1RNbUYxZjh5?=
 =?utf-8?B?MjJrRGNPMGVFSlNwdEJvS1d2SGdLNzN5MDBJMXBXNmdDL2FISk8vdlZiL3Z5?=
 =?utf-8?B?SUIxREY4aGFtMFQ2MDNUNXZJNkVuaDVpUUdRK3BUbG1TMVRnVHltK3Q2b1VZ?=
 =?utf-8?B?dnZyallDOURzUWt2K201QkhzT3JmdWxaQlJwaTQrQmlLeEEwNlJ3V3A1TDAy?=
 =?utf-8?B?dU9wamNvZ0dGanliL2lJVDdBUGFDU3hDZFRFeW9pMStVZ0d0cVN6QTVGK1Vz?=
 =?utf-8?B?ZXk5WGhFSEtBeXY2NXUzaGJEaHpqOTB6Sk91c0pFZ2VoSlU0dW82dDQxbGp2?=
 =?utf-8?B?Zno5aDgrbjRJZFZRbXhEMXZrRGpYM2s3SytOYkg4WElWWTRTYUlEUmtzSVdX?=
 =?utf-8?B?ZTR6ZVBhL2ZWaDA1SG5TRUpvVmliMXhLVlQvUUI4cklZU3JLVVhQdWtITTE4?=
 =?utf-8?B?QWdCL2RKTWhWSG5UL0JLRVNjZDhPQ3p0eGFZbndvd0NDdXdRTUxWcHk5TEhh?=
 =?utf-8?B?aGJyeUVNT05TK296ZjFMS0pHdUFnMWtpQ0doS25XNHZETEt3d2djMlUyOERC?=
 =?utf-8?B?bDNtVm12QmVsT3Q0M0VUeDVXaDVuWG1sMUY2WGI2Y2psYTZwMWJNNk1LSyt1?=
 =?utf-8?Q?CbeUI4vMq7UaH59e81ImZ33Io?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 745cfdb6-b5f1-4ba1-53d9-08db5dc0c629
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 08:11:14.2572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lxyMdg8siY0JRYuo9Cp78hYBm8WoGOyTJnodxDacw6i6QBu4FRaaS+28BFmOuSdS7OIItvi6Qvq53yAbm2Wk+qWdwUXm8++gZz92ZtNHJIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9657
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXkgMjUsIDIwMjMgNToxNSBQTQ0KPiBUbzogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBDYzogV29sZnJhbSBTYW5nIDx3
c2FAa2VybmVsLm9yZz47IEFuZHkgU2hldmNoZW5rbw0KPiA8YW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tPjsgUGhpbGlwcCBaYWJlbA0KPiA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47
IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiA8Z2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU+OyBQcmFiaGFrYXIgTWFoYWRldiBMYWQgPHByYWJoYWthci5tYWhh
ZGV2LQ0KPiBsYWQucmpAYnAucmVuZXNhcy5jb20+OyBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtl
cm5lbC5vcmc7IFBhdmVsIE1hY2hlaw0KPiA8cGF2ZWxAZGVueC5kZT4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSCAzLzNdIGkyYzogcnp2Mm06IERpc2FibGUgdGhlIG9wZXJhdGlvbiBvZiB1bml0IGlu
DQo+IGNhc2Ugb2YgZXJyb3INCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIg
cGF0Y2ghDQo+IA0KPiBPbiBUaHUsIE1heSAyNSwgMjAyMyBhdCAzOjUx4oCvUE0gQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBUaGUgcmVtb3ZlIGFu
ZCBzdXNwZW5kIGNhbGxiYWNrcyBkaXNhYmxlIHRoZSBvcGVyYXRpb24gb2YgdGhlIHVuaXQuDQo+
ID4gRG8gdGhlIHNhbWUgaW4gcHJvYmUoKSBpbiBjYXNlIG9mIGVycm9yLg0KPiANCj4gTWFrZXMg
cGVyZmVjdCBzZW5zZS4NCj4gDQo+ID4gUmVwb3J0ZWQtYnk6IFBhdmVsIE1hY2hlayA8cGF2ZWxA
ZGVueC5kZT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcnp2Mm0uYw0K
PiA+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcnp2Mm0uYw0KPiA+IEBAIC00NTQsOCAr
NDU0LDEwIEBAIHN0YXRpYyBpbnQgcnp2Mm1faTJjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UNCj4gKnBkZXYpDQo+ID4gICAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwcml2
KTsNCj4gPg0KPiA+ICAgICAgICAgcmV0ID0gaTJjX2FkZF9udW1iZXJlZF9hZGFwdGVyKGFkYXAp
Ow0KPiA+IC0gICAgICAgaWYgKHJldCA8IDApDQo+ID4gKyAgICAgICBpZiAocmV0IDwgMCkgew0K
PiA+ICsgICAgICAgICAgICAgICBCSVRfQ0xSTChwcml2LT5iYXNlICsgSUlDQjBDVEwwLCBJSUNC
MElJQ0UpOw0KPiANCj4gVGhpcyBuZWVkcyB0byBiZSB3cmFwcGVkIGluc2lkZSBwbV9ydW50aW1l
X3Jlc3VtZV9hbmRfZ2V0KCkvDQo+IHBtX3J1bnRpbWVfcHV0KCksIGxpa2UgaXMgZG9uZSBpbiB0
aGUgLnN1c3BlbmQoKSBjYWxsYmFjay4NCg0KT0sgd2lsbCB1c2UgYSBoZWxwZXIgZnVuY3Rpb24g
dG8gZGlzYWJsZSBJMkMgYW5kIHNoYXJlIHRoZSBjb2RlDQpiZXR3ZWVuIHByb2JlIGVycm9yIHBh
dGgsIHN1c3BlbmQgYW5kIHJlbW92ZS4NCg0KK3N0YXRpYyBpbnQgcnp2Mm1faTJjX2Rpc2FibGUo
c3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qgcnp2Mm1faTJjX3ByaXYgKnByaXYpDQorew0KKyAg
ICAgICBpbnQgcmV0Ow0KKw0KKyAgICAgICByZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0
KGRldik7DQorICAgICAgIGlmIChyZXQgPCAwKQ0KKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7
DQorDQorICAgICAgIEJJVF9DTFJMKHByaXYtPmJhc2UgKyBJSUNCMENUTDAsIElJQ0IwSUlDRSk7
DQorICAgICAgIHBtX3J1bnRpbWVfcHV0KGRldik7DQorDQorICAgICAgIHJldHVybiAwOw0KK30N
Cg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiBOb3RlIHRoYXQgdGhpcyBpcyBhbHNvIGxhY2tpbmcg
ZnJvbSB0aGUgLnJlbW92ZSgpIGNhbGxiYWNrLg0KPiANCj4gPiAgICAgICAgICAgICAgICAgcG1f
cnVudGltZV9kaXNhYmxlKGRldik7DQo+ID4gKyAgICAgICB9DQo+ID4NCj4gPiAgICAgICAgIHJl
dHVybiByZXQ7DQo+ID4gIH0NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02
OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2Ug
dGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxk
cw0K
