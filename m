Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B14B75FA6D
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 17:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjGXPHA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 11:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbjGXPG7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 11:06:59 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3FE12E;
        Mon, 24 Jul 2023 08:06:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZeW8i3NGlmWvwfPeGoXBymOXi69yjIp9C2dSKqgUx1h0MifW0cLtvU4+RsdKJuIUWzLxZuefkzybJGomqUrL+e3sLToY2ReeSWj/vE3nUFg9uswWCh7nW0eJLgtWxC0sniQKZcaZaKztu7CfmUxUxyg/68vPW0GHOZ28vx1ZsKaDQlks7p/zlo6h8Hry7Lye3seWnoQGf3HEmBtmGua4NRRB8fCSPrZbVFS9syyynR1QY/aEi2d3jDFxMO3dEEB2tC7fXzJjOHzpx+8TyRv5peENqbkD2mNIOXB+bELGmWIFmmd8612v4Ozh25N8rGpR3OajklViN3yfp6Slvg+G8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dC7biXzBV2TQjsND/fUo+QJaORG+K4xiHJagutCnTzw=;
 b=dsF+8flFk7ShuYWXFglSXtB9Nfi80mo5nt6K503OacpwUMBwCJ37vHDc8K/1bKqOxuBfRhkys5HCTN4AuNgREULKuM4QZg9a+XTo6jf6XBmgYqhpKOnNSwt7iNpZRw44qg8ysdBmuOAwX/L9Nr5u12bkmClbsfqu0v1L7PuvuuPvWGqRxO6VIzrEvtbPfm6ExsLBu8Nimaj01J6g9Q+vv/Id6zO5Q5A99CLHjTm6MxN5ky0zaMjcTkfpiUORbExzl5EX+aarC500vtIFC5n6BKXJC5uUk7D5ZU+0+i9f5fqpqoUjmrozpr30etxXqvqUiYh/TRwBey/N8i/MPM5mzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dC7biXzBV2TQjsND/fUo+QJaORG+K4xiHJagutCnTzw=;
 b=FP6xthFfQDF4cUhtb/Qo4n4iZPtVKP5UzRYVmO7/YbqzuZypfrFbeiNBFT9ozqRGaTAIhGrX1U9jwvkaRUZqdAR8utfKAZKsHqZF2xoa88mivMpVfaNTeVr/nzsoYT4kV0xb/MLQ7+gRH2Hk+Th/ccLXS0cqHfWKoetihLAPHNc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11072.jpnprd01.prod.outlook.com (2603:1096:400:3b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.30; Mon, 24 Jul
 2023 15:06:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 15:06:50 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: RE: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Topic: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Index: AQHZvUDvgs8MHdOqQUa8bS1k2CYM0q/JA1CAgAAAS1A=
Date:   Mon, 24 Jul 2023 15:06:50 +0000
Message-ID: <OS0PR01MB5922CA1B457D6747478DCCB18602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
 <20230723083721.35384-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdWThYuw+fwoz8xwHRyDDgTQUkW_c_ANkjzuMggqZCm3zg@mail.gmail.com>
In-Reply-To: <CAMuHMdWThYuw+fwoz8xwHRyDDgTQUkW_c_ANkjzuMggqZCm3zg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11072:EE_
x-ms-office365-filtering-correlation-id: 80a119c7-eaf5-4160-6fd5-08db8c579bb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P9sK4cSYWDJll5XHA5kfEe0y0MQf+9ufS6WST+pqrY/NoYuV21qVQlQmMT1twJcYOioySSSLLjeESNJ9Dmy5Z/jvog1xmRAmyYTgiwHPZofisX8S5ZLy42h03cDHslRqCvPP7sC0FW6459UGmk9DBKelgMQPkhhFlZJlkvAJwSjTcsdsWbWEoaiKd/frAOAiM7pX+N1k3et/5UalAseQDi7ivMLzxpGn8Cs6Mu2+0i2PqaTO/1YMfmM0fCFCSJJvCiKPgVN+/aSMJ1N88/mcH02mx6guGixkSj9nGvLRWrHyKzAJZpfr6/IQKF88i304mrr09fQRrl98WqqmnVhG0K++fAl43VZAQG91xcR3/HtKZ4/jY9pTMkjiSBEfXM1kaPuxnOubPRGklh4XELGNV+IJzpWvdM6eV+Dn37pVLk2uslNwk38HYWa8IM+StGPgVnv6HJqCJVha6RWmhjVlametX91H2tqiYi5NycO/mXWhbXSwdd+zgGBQQwIBeXOiuDmXkJBfKxc179Zh2E6y6IJ3BLGlrB2ZMx07xIG0r7BNur9MnQAH1spIXeGaxHKKImk6atpOLpHNb/ncAg/smTJkDXBCO3GezXQqV0EQxNdmjDR9zmHDgeGZ/vlflfTQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199021)(53546011)(41300700001)(6506007)(33656002)(186003)(83380400001)(478600001)(71200400001)(38070700005)(55016003)(9686003)(2906002)(7696005)(86362001)(5660300002)(52536014)(66556008)(64756008)(66476007)(66946007)(76116006)(122000001)(4326008)(6916009)(66446008)(8936002)(8676002)(316002)(38100700002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzlSajNHNDNVQ3VpR1F1YnBUc0xkM1dldTFZdE8yWTBhdjRYZFB0NHVhc2ZM?=
 =?utf-8?B?cS9raU95dys0QllMVlhucXVqY0x5VHRvZERWUXMvNHlESDBJSUhTR1RNRFNT?=
 =?utf-8?B?cWlaYXVnajRPVUNKalJqeUx0bEtVc0FGb0JuM092ZVlKQnhlSFQvamdsQ0NI?=
 =?utf-8?B?RnhDQmJTelI4QnJkNWRCZ2kyRHMrK2llUHBDS1V1ZVA4UjVpem1maGdZVndJ?=
 =?utf-8?B?NlowQSswYjNnT1RUUDhYUVBCN2ZFY3VwQ1d4NHJjb0FtcnpER2V2bWt1UnFF?=
 =?utf-8?B?YnRObk51U3o3czZMRHM1Z2RoN0dzWkJJRGVxeW1wMEc0MWE2OXprNWtIWVdI?=
 =?utf-8?B?YVJtd1hSYzZJMDRhZFIveUxSZHhlMnNCSGVsRFNRM2J3WVdzM3VUb2dxRDVo?=
 =?utf-8?B?cE8yamhKekFlenBkUnIrVWxPVnNzNVVqT3BRZWRZR2YrMTExa3F4YlFqekVo?=
 =?utf-8?B?T3FMd01Cd3NYZkk1MU14ekRqL3o0T1NhdU9ZRXZ6K0F0cTRiSTVrckZJZ1JE?=
 =?utf-8?B?QjBISWs4UzN6ZXV6SEgvdGd1MWUvRURXLzBUOFJ2RFZzeFJET1hadFFReERv?=
 =?utf-8?B?Y3JhRnVOL3dmWjBzaW5qWTFSNkl5dXBMQmJKSXh0TjZ6OElENmRDVXpFd2ds?=
 =?utf-8?B?S3hPbG0xc2Yycmo0RGVzaklWcTNZQUFMT2hEc1BackhlNGV0ZXZuYzJueUVS?=
 =?utf-8?B?SDZJUUF1VDhkWnNpWjVqYUxOTDc1UnlQWnFzRlAyU04wckZnVks0dXU2Y0Fm?=
 =?utf-8?B?anVLVjcwUEFNbXdMaUVEQnUwNnJzN3F6RkgwSHI4dnViQWRkc2FsTWFwQVZx?=
 =?utf-8?B?dzNwUElKVmlvenB4ZzdpV0RwQ292TzBLTUFWWmU4K1oyVnVTZGl4cE53WHI5?=
 =?utf-8?B?b3VxSExqMHBmUnR0b3YyaXByTnQvdHE1U0dML2VEMzAyQllXS29FVERaVzZC?=
 =?utf-8?B?UDlMMW9tTWN1TWxuTm1CWGtPUTNVdmtoa2ZXVVh3bGtpazMvUTA0eS9ieFV3?=
 =?utf-8?B?UXhhb2dmYWNWbEFoQWlFU3FsM01WSDFqSWRHMHJLenVrZ0R5QlFINW9zVndh?=
 =?utf-8?B?U1EzVEV3MWkycWJkK0JLTlhRNEJIRDNPcldSQlNwVDV5OXZaaVI2VmVLTlgx?=
 =?utf-8?B?d01BUHNmQzZDTGtlQWFaa2JiVmEyTDBXdUJrVmFMVGpJN2JTamlaK3VLLzZG?=
 =?utf-8?B?Y1JsN1FSVTFuQkdHR1VyRVpxS045OHFRb3pmVDZrYTlIblRCWEs5YW5RTGhM?=
 =?utf-8?B?TDVJdVBqL0FUTUhhc1NCeU04WWJ6NTByMWlBS2N3M0lsY1M1WGhUai8zWVVF?=
 =?utf-8?B?Tk9wa1RXT1FWdUNBTUVRVWRaWWpBNG53NFF0a3dyV28yUnNWS2VsbGJTd3pm?=
 =?utf-8?B?aVVYbnpvaWJJQ1A0SWYxU21kQ0RNOWFmVWFReWloNzJSTEs1Vm0xM2gzSmtQ?=
 =?utf-8?B?cFRwVWxrZk0zT05tTkVKL3FpZkhyUXJDc00yaTFEb3YyQlAwTmZZck1CYW5q?=
 =?utf-8?B?Y0hUVzV6cnNVMmFlN01takJqNndmU2F3RHFhZzgyYm1SV3ZzbmNCemMyRmlG?=
 =?utf-8?B?bC80THAvcVAxS1lpMDNBaHY3cWZkdWlWemx3VXZ6VzNXQUI1UTVPM2tPdWlm?=
 =?utf-8?B?Uld5Z0grakFrd1N2azM3cDZmVmZEYVBPVXdENjdHTDRVYklkTDlZY0xsUmhy?=
 =?utf-8?B?N1g1MTlUeFFDQldRVFNYTTNFUS93WFN1TVZjYlovS1V5SktRTlZxak9QVkN0?=
 =?utf-8?B?OXBOS3pTRncyWndaNHJEU1dOb3hXdmtjalp1WHFoY1ZNL2ZJbS9XWVpXazVM?=
 =?utf-8?B?dEdzVlU3Q0tLNHQrZE80SmVLcWF6NmxydUtJTkJVQW9CNDlQVmxSOVkrS2p4?=
 =?utf-8?B?Y2xuWDRoUk8za3dOZjA5czF1RmtGZHhuVlo2eGtHL1JWTVNxUnYrc2ZRdytw?=
 =?utf-8?B?YUNRU1Fjd2lRa2dFUTFWY0lHQ3daakdya2VaME1RUEdNMU9IR0MvcVpXb0NG?=
 =?utf-8?B?R2RvZlp2bEFkc21NRTk0MlczUzVDaE5abm9hUHE0d1l6ckttVER2TldkYThv?=
 =?utf-8?B?MVFhMnJZQWEzeHo1eldFZk9mU1ZsYW9TMDJqSW01RjUvVTdZUUE2Y29IRzlB?=
 =?utf-8?Q?pS00=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a119c7-eaf5-4160-6fd5-08db8c579bb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 15:06:50.5217
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a0elepnrEoCfmYYBcs2VXRHg5FWQsYKeobcTaEIKxOh9q+2MaFsj9K6kXumudujWOc+55pDxMy3SKX74alPAIOxzUxClZ8JpXpepO5QeWZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11072
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggUkZDIDIvMl0gaTJjOiBBZGQgaTJjX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgpDQo+IGNh
bGxiYWNrDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gU3VuLCBKdWwgMjMsIDIwMjMgYXQgMTA6
MzfigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0K
PiA+IEFkZCBpMmNfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkgY2FsbGJhY2sgdG8gc3RydWN0IGJ1
c190eXBlKCkuDQo+ID4NCj4gPiBXaGlsZSBhdCBpdCwgaW50cm9kdWNlZCBpMmNfZ2V0X21hdGNo
X2RhdGFfaGVscGVyKCkgdG8gYXZvaWQgY29kZQ0KPiA+IGR1cGxpY2F0aW9uIHdpdGggaTJjX2dl
dF9tYXRjaF9kYXRhKCkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgVG9yb2tob3Yg
PGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNo
IQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMNCj4gPiArKysgYi9k
cml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMNCj4gPiBAQCAtMTE0LDIwICsxMTQsNDEgQEAgY29u
c3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmkyY19tYXRjaF9pZChjb25zdA0KPiA+IHN0cnVjdCBp
MmNfZGV2aWNlX2lkICppZCwgIH0gIEVYUE9SVF9TWU1CT0xfR1BMKGkyY19tYXRjaF9pZCk7DQo+
ID4NCj4gPiArc3RhdGljIHZvaWQgKmkyY19nZXRfbWF0Y2hfZGF0YV9oZWxwZXIoc3RydWN0IGky
Y19kcml2ZXIgKmRyaXZlciwNCj4gDQo+IHN0YXRpYyBjb25zdCB2b2lkICoNCg0KSSBtaXNzZWQg
dGhpcy4NCg0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBzdHJ1Y3QgaTJjX2NsaWVudA0KPiA+ICsqY2xpZW50KSB7DQo+ID4gKyAgICAgICBjb25z
dCBzdHJ1Y3QgaTJjX2RldmljZV9pZCAqbWF0Y2g7DQo+ID4gKw0KPiA+ICsgICAgICAgbWF0Y2gg
PSBpMmNfbWF0Y2hfaWQoZHJpdmVyLT5pZF90YWJsZSwgY2xpZW50KTsNCj4gPiArICAgICAgIGlm
ICghbWF0Y2gpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOw0KPiA+ICsNCj4gPiAr
ICAgICAgIHJldHVybiAoY29uc3Qgdm9pZCAqKW1hdGNoLT5kcml2ZXJfZGF0YTsNCj4gDQo+IEkg
Z3Vlc3MgeW91ciBjb21waWxlciBkaWRuJ3QgY29tcGxhaW4gYWJvdXQgdGhlIGNvbnN0L25vbi1j
b25zdA0KPiBjb252ZXJzaW9uIHdoZW4gcmV0dXJuaW5nIGJlY2F1c2UgaXQgaW5saW5lZCB0aGUg
ZnVuY3Rpb24/DQoNCkl0IGNvbXBsYWluZWQuIFNvbWVob3csIEkgZGlkbid0IG5vdGljZSB0aGF0
IHdhcm5pbmcgYmVmb3JlIHNlbmRpbmcgdGhlIHBhdGNoLg0KDQo+IA0KPiA+ICt9DQo+ID4gKw0K
PiA+ICtzdGF0aWMgY29uc3Qgdm9pZCAqaTJjX2RldmljZV9nZXRfbWF0Y2hfZGF0YShjb25zdCBz
dHJ1Y3QgZGV2aWNlDQo+ID4gKypkZXYpIHsNCj4gPiArICAgICAgIGNvbnN0IHN0cnVjdCBpMmNf
Y2xpZW50ICpjbGllbnQgPSB0b19pMmNfY2xpZW50KGRldik7DQoNCk5vdCBzdXJlLCBub24tY29u
c3QgaTJjX3ZlcmlmeV9jbGllbnQoZGV2KXRvIGJlIHVzZWQgaGVyZT8/DQoNCj4gPiArICAgICAg
IGNvbnN0IHN0cnVjdCBpMmNfZHJpdmVyICpkcml2ZXI7DQo+ID4gKw0KPiA+ICsgICAgICAgaWYg
KCFkZXYtPmRyaXZlcikNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7DQo+ID4gKw0K
PiA+ICsgICAgICAgZHJpdmVyID0gdG9faTJjX2RyaXZlcihkZXYtPmRyaXZlcik7DQo+ID4gKyAg
ICAgICBpZiAoIWRyaXZlcikNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7DQo+IA0K
PiAiZHJpdmVyIiBjYW4gbmV2ZXIgYmUgTlVMTCBoZXJlLg0KDQpPSywgd2lsbCByZW1vdmUgdGhp
cy4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiBpMmNf
Z2V0X21hdGNoX2RhdGFfaGVscGVyKGRyaXZlciwgY2xpZW50KTsgfQ0KPiA+ICsNCj4gDQo=
