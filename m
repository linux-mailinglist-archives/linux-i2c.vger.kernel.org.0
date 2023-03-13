Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3396B718A
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 09:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjCMIuj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Mar 2023 04:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjCMIt6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Mar 2023 04:49:58 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20603.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::603])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 774791E9FA;
        Mon, 13 Mar 2023 01:48:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mr1TIE8wTQ5BR4PXLUnSURD6516I7jPFk48+iMkYgECaTJ7GWC7ESqFINtt2deGZXIgLYBX6o/GVrkmdZAQtnWcCHwBqkLHgShI6ob9h/JrWnpSLHOGzjLUdD5qwOWE2E6Cm9vcShmAcUQBX3Q6HOQ3r28cJPPrlynr49FhOYiL2b+V37AqtmMgx+56TEsuNAiV+ZUSyhYFW/JFip6ElIt5Kc9vT7YCe8P8bttjmUwuwbY8hscwzTGaJm03TezS/H3qWhcK6Srdilv3d0jYYCaDhzoR8iK54kEUfvMFF28WAhHoFP6jcmJLZkUASqAk3F+lttBMob4zzUR0SwK2ehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsEF8rZd/FNBeQwQQjjBJpYuOLjWlUggLkWKgQ6+UYg=;
 b=mAGElkVMkXh5AWEwQZo3LVkEyWKaGDsYAO7ZM8/dG8kIlzUzPCnkTxojPywDy0YISEzlBYjq8S4WEIf9zYnYLfBNp3QM6ChKKG8tACRvkCxPV/3mnmlJnnE2MilBtTuQbpOFEBvyUJEyfOY+hGZmS4gITYvtvyjQVkHn80FBwDZ10wA4Zd4iHV8BXuovlbXHEbNuqufYMmWFy4BxWln+zYg4kKito/LdqFgBTP+v5xcLbv7gM897plnvKFOtuh/+xeYEpMtOoW14jwBERzU71tR3bgcPWDDX+IDpXRm5EvKoTI5xD8iNpAIubvb3QRA/fKbz+40C/DDjEIk9wDNbOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsEF8rZd/FNBeQwQQjjBJpYuOLjWlUggLkWKgQ6+UYg=;
 b=l29kzlPjpTFidpiSMlNcdutDM1rXo5+N3/Ne7Xur5Bcekcgcqa1QzAvl8c1QlBojPLWMGwMVHry6s0lw5zpFeyVSpQeCkkbkhhzmQtTtCo5Yd3U9oL6P3myGcNFpSl5uQqr32+dsWZhPy+mOc1cfpfZZ4ygQgtJLdltpT7E2DlEnnPnJ8fGWxaKpF3XvQlQuzbXK9T5TgIodl75Vs7zW6XrP61qE6U3pVIFKwnZaoiedH2qjdclbwc5dASzi7EGhEBzED0t3qRexwoxdd2+LiQPqyJvXuND0P0035TL4cWfTa4RlyCNn8wZ7TAQ/UT5/FRfnT4WUtBKUqVoKiTpWlg==
Received: from TY2PR04MB4032.apcprd04.prod.outlook.com (2603:1096:404:8002::7)
 by SG2PR04MB4105.apcprd04.prod.outlook.com (2603:1096:0:5::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Mon, 13 Mar 2023 08:47:52 +0000
Received: from TY2PR04MB4032.apcprd04.prod.outlook.com
 ([fe80::e8c5:5f9:2a10:ae23]) by TY2PR04MB4032.apcprd04.prod.outlook.com
 ([fe80::e8c5:5f9:2a10:ae23%6]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 08:47:51 +0000
From:   Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
        "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     "garnermic@fb.com" <garnermic@fb.com>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Samuel Holland <samuel@sholland.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 2/3] dt-bindings: soc: meta: Add meta cld driver
 bindings
Thread-Topic: [PATCH v1 2/3] dt-bindings: soc: meta: Add meta cld driver
 bindings
Thread-Index: AQHZKlh9jD6I1rNMGUGGIsrbjqBF6q6iblIAgFZI23A=
Date:   Mon, 13 Mar 2023 08:47:51 +0000
Message-ID: <TY2PR04MB403248166A99841E5B69A29783B99@TY2PR04MB4032.apcprd04.prod.outlook.com>
References: <20230117094425.19004-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230117094425.19004-3-Delphine_CC_Chiu@Wiwynn.com>
 <c7787be5-b328-4507-ba51-dd26bb9ae408@linaro.org>
In-Reply-To: <c7787be5-b328-4507-ba51-dd26bb9ae408@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR04MB4032:EE_|SG2PR04MB4105:EE_
x-ms-office365-filtering-correlation-id: f3c18d0c-ca92-4af4-b7a3-08db239fa140
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FAfveSrvp7gYT9R+S/Y9cgvnxLixf8/qlRBWAPtaiiW1v7Gj7PkDX4jvr3H4cS2jw3Y2m92PrhXvLB6bKZ7xaIkIK3VUVaox7yDYdj9o1NXs0i3/oZvSUpi8+xeBoYGjPGy18lVUB7K+u3C/mPZjE+/Z1SQmE8vHHVj6XGOmCShoeJY2Q6WzBMM2SCNlB0eq2aIsG6eeMl9wsDO5SoPnKkLUhqn69RyJrijqgJJ5Jrofk2qXnFAhKVSX3uLnb4LkuGN/EbtPkgih5tMYTrISxJ+m5WpHD9IihUbE1RjluW3LM58Dmm4rFkNZTdTPYhP24JtLF3spzNc/50vWS6FS8BNyln2AcE8/h85s+kIsfwTELd/WyT8wRxtZVvTzCIxH7r1DavQzH1q8KK9Mw0QPoIiTjBF2ZNbYOu2rtwi+/8e9KdknGdRIjOKK1M8itwRYlZ/57rm8isG0d9uuuBZ2IibWo881Mwsz0rGjqCGGY5KuSlJLWghZOGxpCxqp45jmLzShNNcsRYkF+V6jzK1EAHj01t5qKLe4Neu/54UaHDw6039ilkkgjO+ZNI2lbIgndwZv0I/E3VB6pBc6WdBnOkFVcTqO5iQcoXU5aQDseHhKFFSA7GLqaOUi71bxgQNie6xchrkfm1Nr2muv19QPfop+z5H/DSJFKYg7LKGSznjpYe5wxD5h7LZtjc0bJU2XJ9Rpf8CHA4Q0yDzsVOLtnA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR04MB4032.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199018)(7416002)(186003)(9686003)(53546011)(6506007)(26005)(8936002)(83380400001)(52536014)(38100700002)(5660300002)(38070700005)(33656002)(66476007)(64756008)(55016003)(66556008)(66446008)(4326008)(76116006)(71200400001)(2906002)(7696005)(8676002)(41300700001)(122000001)(110136005)(478600001)(316002)(54906003)(86362001)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3BLMU1zSUxIc2tFbkFaYzVZbWg1dCtVNlBhcFBxRlo3T1NrU2UzOXNsYVpT?=
 =?utf-8?B?bStvRnNiMW1LdjFTdzFkM3VhZDB0QTZyQzVVdG1YT1QxeXEwaVBhZ1M1cDhO?=
 =?utf-8?B?Z3YwV0lwZmdDNDAxdXVoMzdpTXVidTZMS2pqcCt4VEhRRGRIU2xGUkZoalM3?=
 =?utf-8?B?Ukt1c0tOa2NxbTREc2hjczdUbUF2cFU3RzNHTkIyL0N5Q1NFQzJVVGxWdlVy?=
 =?utf-8?B?Qi8vOFlBdHhFcDRHQVdtUTJqYis1Mlg4ZDJiZGQrUHBhYTUyTE0waFppUkg5?=
 =?utf-8?B?YThPYTAwdVFrdVFxVHdsRGY4cEtMYzBJajFlUkU2UUcvaEhxUzQ1NXlad296?=
 =?utf-8?B?WEpuUE9WZlNKTnMyRnJwaUx5QUVDbUtjUXBRRm4ySEZJc1pDbXdid1c5TzZV?=
 =?utf-8?B?VHpjUHUxS1dwOUFjU2hzN3RwMVhNbVk0YVNWeUlYektLK1lVUE15aGZBOFV0?=
 =?utf-8?B?YnlEQWVEQjVjbTF4RVhuYmxNMDFpOU9ySTVWeW5DdFBKZWtPMFp1UjdZcERW?=
 =?utf-8?B?cHlvdU5KNy9HWklMWkk5QXJwZUlZWmZVUi9qdWlxZ3pzYy8xVS9EdEdlZzN3?=
 =?utf-8?B?Slp4VVo3c0x0U3plYU0vaitiYVM1b2ZzOVd0M3lZY1p0c2toeU1HejYwb0c4?=
 =?utf-8?B?bGlmeGhFdmtNTys3dTA0VHkyekVORFJMYU5GTmVnT2Q0L240Y3JQblorSUQx?=
 =?utf-8?B?OUVQWEY0UXN4dllvWnZPZ2RRMm5qbnRERi81Qmhtd25rS2paQ0VJbG1pTytF?=
 =?utf-8?B?TTVyazlpYWlBNUFXbkVVOW9UN2lBNDErMmtMbVlnV0dQTm9ia1dvTlhyaElh?=
 =?utf-8?B?N1Rjd2lZZEl4b1E0L2JXd1Q4Sm03VFR2ZEpmSExiZXRyak9SMEl3dC9XR1Rn?=
 =?utf-8?B?MjhYSlNpeVF0Z2ozbHgzUlRSaUFSUW9DTTQ5dzMzWFNqZVhpVmc5OWJjRUVG?=
 =?utf-8?B?dXhOUGxMcFN2YVRaRHhUWHcySW5Gam1MdjRiOUtnb2EvbkRBNGdMeDdzRDlt?=
 =?utf-8?B?aGlrMHZPZk1ZOHg3YTZNbVVHTktneDNMNDIrSWxrWVdJK1ZhMStrdkg3MjJP?=
 =?utf-8?B?L3NVUlJvY3ZLL21rdWlNSFJsVWFuS0ZseGJNL3ZQUG1GQnI1SFMzbExUeUdm?=
 =?utf-8?B?eWhhYXV2dWZzMnYwOTVTS09paHI4WmpSem5lMHJHc3NuTXhyUjBhQk1ZVUtw?=
 =?utf-8?B?cVU3Wlp3cElnQS9TRFIrK0hFUnA4Ulh6bmFSMTNQNFBVRmh6dDdPNTF1ODJW?=
 =?utf-8?B?YUFvc0s5dDhxaldrZEtSbWx6T0lTcmxacFFrWkp1dGxsODZXVS9zMHF0ZlZj?=
 =?utf-8?B?b1Vjd0tsckNFU1pIMWtvNExSL0lGeEk3UzZlckR6cy9iYWdXZ3pNRlRHYWtj?=
 =?utf-8?B?OW1JTXZ4cTh3TXBKN3ZlQ0FlTjVTQmpxWGV4VWtucndEVUN5ckEvTFYreVlv?=
 =?utf-8?B?M25LYVNNVjB3S0FyRWJ6cVR1bmF4KytvSXdaU1BSREp2QVZsRDd1d0NuRjR0?=
 =?utf-8?B?MEtUN2pYcGh0ZlJyUXFmYTJHcm5uU3pyMVdPTXJjak94YVFDaUZSOC90bEts?=
 =?utf-8?B?ZHA1dTQzM3QxMEJTeUZHSHR5K3hOZ2QzVTlaL3JMcFhyNENQNVV0K3E2cHVu?=
 =?utf-8?B?bkgxUGlOK0ticlk5dWk3b2JDQkllcUdjQkp0d1ZBY211bWxPTlpFaU1TRnU3?=
 =?utf-8?B?aWMzaWlHNCs1VGwyOW15ZHBNSVl2YkZTMHhmZzlwVFNEZDk5TDgramlIcVIr?=
 =?utf-8?B?LzNwM1ZBWThxeHV1RHlNYmFBN2QwZlpWM01lUFVCeXZDMThtY0FhUjF6ZHh6?=
 =?utf-8?B?QTRYa2lObzBOendVSEJtSHhZSWFzVzZFQ2VpWjJEOENqS1B6WVVYWW82eTMz?=
 =?utf-8?B?SEZHMDM0cWcwSDhnR0l3RHFEa0pqamhaZkVaWm5GQWxXbGVSVlYweSsxeG1m?=
 =?utf-8?B?T0c0OEFzS2t1TWhibjU0MTkwN1VCWmpGY29PTUkwOVMwQ0I0YXNzZm80ZE1j?=
 =?utf-8?B?TjdNNjFaUUlNUXkzZnFtQnZQNmw3clhEVGRZRmFteWtrcVlnRGtUaWc4QVhW?=
 =?utf-8?B?Nmo3c0tyTjNqSEVDY0NuNmk3L0x1bHI5b0xFdFJDYi9aeTR6ME91Q2JtaXg2?=
 =?utf-8?Q?jjsVkaLtDRmRmcraOVaGWMQJn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR04MB4032.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c18d0c-ca92-4af4-b7a3-08db239fa140
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 08:47:51.4890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gyXhXHvwsvlcTgUSkTlWFLtRyNzeDRVQrCCS1lhcjOMNIKZpdGeVNbzhDT0YsvO6sG1d//T5S/Vp9Gfwb51KXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB4105
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudC4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yu
a296bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMTcsIDIwMjMg
Njo1MCBQTQ0KPiBUbzogRGVscGhpbmVfQ0NfQ2hpdS9XWUhRL1dpd3lubiA8RGVscGhpbmVfQ0Nf
Q2hpdUB3aXd5bm4uY29tPjsNCj4gcGF0cmlja0BzdHdjeC54eXo7IFJvYiBIZXJyaW5nIDxyb2Jo
K2R0QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296bG93
c2tpK2R0QGxpbmFyby5vcmc+DQo+IENjOiBnYXJuZXJtaWNAZmIuY29tOyBEZXJlayBLaWVybmFu
IDxkZXJlay5raWVybmFuQHhpbGlueC5jb20+OyBEcmFnYW4NCj4gQ3ZldGljIDxkcmFnYW4uY3Zl
dGljQHhpbGlueC5jb20+OyBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPjsgR3JlZw0KPiBL
cm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IFN0YW5pc2xhdiBKYWt1
YmVrDQo+IDxzdGFuby5qYWt1YmVrQGdtYWlsLmNvbT47IERhbmllbCBQYWxtZXIgPGRhbmllbEAw
eDBmLmNvbT47IExpbnVzIFdhbGxlaWoNCj4gPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz47IFNh
bXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPjsNCj4gbGludXgtaTJjQHZnZXIua2Vy
bmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAyLzNdIGR0LWJpbmRpbmdzOiBz
b2M6IG1ldGE6IEFkZCBtZXRhIGNsZCBkcml2ZXINCj4gYmluZGluZ3MNCj4gDQo+ICAgU2VjdXJp
dHkgUmVtaW5kZXI6IFBsZWFzZSBiZSBhd2FyZSB0aGF0IHRoaXMgZW1haWwgaXMgc2VudCBieSBh
biBleHRlcm5hbA0KPiBzZW5kZXIuDQo+IA0KPiBPbiAxNy8wMS8yMDIzIDEwOjQ0LCBEZWxwaGlu
ZSBDQyBDaGl1IHdyb3RlOg0KPiA+IEFkZCBhIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciBNZXRh
IGNvbnRyb2wgbG9naWMgZGV2aWNlLg0KPiANCj4gU3ViamVjdDogZHJvcCBzZWNvbmQvbGFzdCwg
cmVkdW5kYW50ICJiaW5kaW5ncyIuIFRoZSAiZHQtYmluZGluZ3MiDQo+IHByZWZpeCBpcyBhbHJl
YWR5IHN0YXRpbmcgdGhhdCB0aGVzZSBhcmUgYmluZGluZ3MuDQoNCldlIHdpbGwgcmVtb3ZlIHRo
ZSBiaW5kaW5ncyBmcm9tIHRoZSBzdWJqZWN0Lg0KDQo+IA0KPiBTdWJqZWN0OiBEcm9wICJkcml2
ZXIiDQoNCldlIHdpbGwgcmV2aXNlIHRoZSBzdWJqZWN0Lg0KDQo+IA0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogRGVscGhpbmUgQ0MgQ2hpdSA8RGVscGhpbmVfQ0NfQ2hpdUBXaXd5bm4uY29tPg0K
PiA+IC0tLQ0KPiA+ICAuLi4vbWlzYy9tZXRhLGNvbnRyb2wtbG9naWMtZGV2aWNlLnR4dCAgICAg
ICAgfCAzNyArKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNl
cnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9taXNjL21ldGEsY29udHJvbC1sb2dpYy1kZXZpY2UudHh0DQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWlzYy9tZXRhLGNvbnRyb2wtbG9naWMtZGV2aWNlLnR4dA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21pc2MvbWV0YSxjb250cm9sLWxvZ2ljLWRldmljZS50eHQNCj4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZTk2NjM2OGUy
ZmQ2DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9taXNjL21ldGEsY29udHJvbC1sb2dpYy1kZXZpY2UNCj4gPiArKysgLnR4dA0K
PiANCj4gTmV3IGJpbmRpbmdzIG9ubHkgaW4gRFQgc2NoZW1hIGZvcm1hdC4gU3RhcnQNCj4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dyaXRpbmctc2NoZW1hLnJzdCwNCj4gZXhh
bXBsZS1zY2hlbWEueWFtbCBhbmQgb3RoZXIgZG9jcy4NCg0KV2Ugd2lsbCByZXdyaXRlIHRoZSBi
aW5kaW5nIGRvY3VtZW50IGZvbGxvd2luZyB0aGUgc2NoZW1hLg0KDQo+IA0KPiANCj4gDQo+IEJl
c3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNClRoYW5rcywNCkRlbHBoaW5lDQo=
