Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9304561EEF
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 17:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235176AbiF3PQt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 11:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234926AbiF3PQs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 11:16:48 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F5332ED8;
        Thu, 30 Jun 2022 08:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXCRvdhZXhMjmS3u77oTMk+YAlfZiMqE1iFfomF7DwvQEA0cwsVmgUGLzCkJG1HAbJYVPt8ejiUqo6e7HAfHbvWRmbtrHpbcpPVeIq9xxrveNlwblMUwhTCjUKYaT2x4Ti75cyRXMr9YZR1Tt9vgQii3Hy2SsxGfzS3HkeZQ1rJ4NZ2yMbA2OtdidnsEMKTCM/TdgEDm8ThBdjENP8+5i/puH5DtsqGIrZeyPkbIop99Wbker4Ih78MXQ2+ZXXuk/YyB6Ue7oBBoWzv5P3NPUsBJy1Zf2XtVC55woyWFAQOpOhtrCO+4fC4Zux+y1tnKhWeDDpVrBi4O/Q0wvPw0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDnxQ4QTq2JaJCay/McoPQWiPK60vaLvseGH8KjFh2k=;
 b=AB163T8I22Ks3aSVVdkQePkKhIuqnocU1gcfuwupqabtZW3Wdal3MfKVo8pHwFkXDcECRp2zQMv2dle/v50V8WKhuYXB3420/+4MlfmJQb0+JQNhxW6heAZ+URElNrkZcjlWvjDF58ZrzToRtS+uTcWVKdbSppdX3lmFAF+Q4wMinSpGAt7NYCtXCpZDZnwPNNmXILEn1+HyNEXFFTeua3THGqoKvQW7ssrpf53KVBqjrIrWs4sVMD/gqn1VtHWfdsIA15bCwgUnhgUIVcBMB/Y3QII7XzxOsOlp2V1al+cr6fCNl/dbwP2RCz3Kq8CbWWyCZ4ZBW8/Ot4rW9vS7Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDnxQ4QTq2JaJCay/McoPQWiPK60vaLvseGH8KjFh2k=;
 b=PN7LAIDaVGtoz7JkuDW4F+lH2R0oeRqp+AIbe4qxeILuOYdkFTpDUgwxQaZhoBi+n6PckpQc0LRpvJNfp69fsJS1HH9WebtVTa4PhTId1DAzCjh8VkEhpwkGcf5jif7zL2OBBpjpZ2KpP207xW4jY0CyhRWu0+hdrA7XGvD83bU=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OS0PR01MB6034.jpnprd01.prod.outlook.com (2603:1096:604:ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 15:16:42 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 15:16:42 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sven Peter <sven@svenpeter.dev>, Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 0/2] i2c: Add new driver for Renesas RZ/V2M controller
Thread-Topic: [PATCH v2 0/2] i2c: Add new driver for Renesas RZ/V2M controller
Thread-Index: AQHYiyeuOazIOKkpQEybI7nuneMbcK1mkhuAgAAQCACAAVE6EIAAFliAgAABFLA=
Date:   Thu, 30 Jun 2022 15:16:42 +0000
Message-ID: <TYYPR01MB70864F60A6F0ED029045E071F5BA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
         <c168df990e1187bf44a5c46be53aa6b20d30d14d.camel@pengutronix.de>
         <CAMuHMdXV72_BWOpU=O13Fa3-t001YSRdsFePSHBS=Xvh1jY1EQ@mail.gmail.com>
         <TYYPR01MB7086706381CDCEF4F582690CF5BA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <be61be2446998c40b51a33453dda4d0b5f1518c3.camel@pengutronix.de>
In-Reply-To: <be61be2446998c40b51a33453dda4d0b5f1518c3.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a334fa1-4164-4220-5312-08da5aab89d5
x-ms-traffictypediagnostic: OS0PR01MB6034:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6ylxDoqYax1k4hWuoWLcAsazwPcIjouVvMKujcAyirxuB0xb4LQpTqDWRQASRWecGMmd/Gmj1rGE4Z529dfbGYFjrojM4kFKkYDg9p5W2c4hQHGede7NuDri76kBOj5AAqDAfRz1z+PsakqLA/KmjMw8xymgChjKKG0o9ZFIr9qmBauoQMSwa9i22X6H67uKBVNUOsctxp7FfLygxZtIOPbIEhhHvmkKtEk2Xtmp9SKXnVQruJqxvdteXOPpIo48uQHp5V1PdzKsLIYQj80bXm6ndL5gAPHYwq/xPNLaT3Z+OcDDTMXCiy8+hIpTAw+eA2ip2MzuwpNIp47kkmq8xeHuuHfM5pSbLeEu6oAoF9qdNWHtm06eBs5gtjWtJJl7wIPdOXRvGkNsvFl6QelhIvLW6lFyMnQdpaEuiBOwid6UbwcQon6QbvSXYf0ec8W5QV01DBhAPtVmVy6+5N7HIDKOEwznafETjaGnHEdUF+0dVhJbE0BykSGpuBbxy/U0rv4FPRMH6HDTMChGIyq3qjfa++fohyol2WarmlkA28HWE5XAEgOeqGw5YFxWo61El//26yi6WPhENg8ZPLURMazfMTFL8WykpNjL25guYZXyCY3KKsGkwx/TxQwRtGiVLVFXEt5Uz/QyMIbl9TB9VdWYqxhwHH0iAU5uDLww19SZBk91z6MH7yRmkiv7x8Nl7enfk/dSQUT6VUoiT9okKS6znL9DgLXMBa1HeA/23FDcXPQrEKWMFu0vVgCbpua1tNdSWiNfvbPVt+4qWdbfxsEd0H0VCRYTpiwiUkIzJseBN1kwiQArAkefkemP5GsG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(52536014)(55016003)(33656002)(8676002)(2906002)(83380400001)(5660300002)(478600001)(44832011)(54906003)(110136005)(76116006)(66446008)(71200400001)(7416002)(66556008)(8936002)(4326008)(66946007)(316002)(9686003)(64756008)(53546011)(66476007)(186003)(26005)(7696005)(86362001)(41300700001)(38070700005)(122000001)(38100700002)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVUxL0xFOTRGUFdjNk5UeEdzeUdVbG1HWGN2dmY0dGdNeXJJM0NsK1UvTnd4?=
 =?utf-8?B?K0xKbmgyS0dERFJNQ01xUlFUZEV0b01ZUjMrblc3Uy9DME5aYjlSQWRQK1hQ?=
 =?utf-8?B?R05CM2lBQllONUVmTTBhTjIyZnFuSGN0U3ZEUU83bks1WVJmWlR1WlFQMDZX?=
 =?utf-8?B?djNlZytiZ3RBTW40WmRabWkwc0w1UXQxaVI5MUwvMmFnOTZnVW9QWU42RHFk?=
 =?utf-8?B?QmFWVDR6aHhxUmVTTjRwbWdkcXN4TTV3a0V3M3hQVkNLeWtHNFc3eFRxaUFk?=
 =?utf-8?B?ZTU0c0kxOXFIL2dCRm5jWWszQlNpM3Zidk9YSGhZL3FqYzdoekw4MEtLblRt?=
 =?utf-8?B?bUFmd3daOXZ6dURVNGxJRjZNeHhyQVJvWS9CbXdPWkl0QjArZFZKMzZyT3Iw?=
 =?utf-8?B?REwvbzlodUNrTEtpZGo1ck9nOGFXNm14ZXdpTDRMY1Q2WkhlQ1N3M2lHNlN0?=
 =?utf-8?B?V2FabytBcTJWYWMwaS80Mzc5VDRKai8xUnF5WFhXd292a1p5bDVYUHBhVDZo?=
 =?utf-8?B?Ny9ZdWN2NVVQNWhOV3J3eDZtbzdtWFozU0xUeFN2TldnYW9heFhuQ0FxMlhn?=
 =?utf-8?B?TUZZYnk3QjZMVEJDblU4YUc4ZExNenpXZEJBKzB2ejF4cXZIc2xqWnJhbS9P?=
 =?utf-8?B?V0l6STVaN2h2eFo2MlVHaVZoTWVPY21jaEtyWFdlYUVUb2lTek5OemZmU2ZT?=
 =?utf-8?B?bXR4cHlYWE5FSzR4alI2OUdNdlNkL2drOFdEendTd1p4VzhONEswcUQrak9n?=
 =?utf-8?B?bWxjdEdjMitVYmVaSFdVTzdCZkJwUDZhOFhlbmFaSDRld05UKy9PUWZUZDFy?=
 =?utf-8?B?SzgzYUhEVVZNQ3ZrcEZTZGVsTzZRUGhtUHlqd2lWK2NkRDNoMS8zWEhiRE0y?=
 =?utf-8?B?YjU5R0Q3UXZScnM1UEdJTDRQZ000RkN1Sjl2aFlVcnV4NVRTSHdtWUZUWG40?=
 =?utf-8?B?WEs0TlYwT3dqcm8zeWsydW5WTXhkR0o4WExLM1dFeFQwR0NmMUVsQWVWQW9n?=
 =?utf-8?B?aGhvV0Izc1JSNlNEOUtuSHVwZlJVN1hXdUZQeUk1Z1FsejhyOS9LTGdtTDZF?=
 =?utf-8?B?dkRKdVJzWnVUYWtLbHRlUDFScVNRU2xEb3hSMmE4UzJ3RDVGUFplQkdZUTR1?=
 =?utf-8?B?UkI5R2JQK1FuTnhycUREenRsWDZVQnJIVDYySHVJWHJqWFVtdUhyZUxxOWpt?=
 =?utf-8?B?dkpxUEJnSXJkNGJCU1VQVDFreGhsK3NzL2FyUytHdm9kZUJRdlY3dFU0cURi?=
 =?utf-8?B?K29KeFY2elpCUndvbTZKNlB6MkZ0MnBpR3pzWU8vU3JsZERDTEUzdDBVUUlZ?=
 =?utf-8?B?Lzd1MEd1TXozY2ovb3ZNVVVUUTZ4c0NaMEFCVXdDeWFYSU5PVDBjWkUzVXFB?=
 =?utf-8?B?RUNxVVpldVVMdUNOaElmUWh0eXhGbkprR3p2Y2MwN3ErTnpkNXhtcUxkOE1h?=
 =?utf-8?B?SUo0L0NPWWFMSlZkaTBiaEpKb1p1L0hpY2QwQ3RsNWtFdXNzaTFuRHZtdUZx?=
 =?utf-8?B?Y1BUNzNKdWxpMkVoNWlObTRkQnJRWk9GQ244NEF4UXFPZTRtdHR0V3lsdXRj?=
 =?utf-8?B?K0d3Nk9sL3RXeCtVQTBuRXZJeXBhMVVkanVRZXcxNUxRSW1SRGtjaTNMOFhB?=
 =?utf-8?B?eEFXMXlhcVM3UkpPYU5XL2NPNVlmM0xKejVYRDRyRmNqUnNCYmRVWEZ3S3lQ?=
 =?utf-8?B?UWRNZml0SG4yU1E4aDVXb25wZW9Rc25yTStnM2J3SjVBNWdTZ1pjbk5kUzRh?=
 =?utf-8?B?TUNBQWVoN1c0N2p4NVFtUHRPMUNLUE1JOVBrQTF6bkxRU2xzMXp1OUppRFhV?=
 =?utf-8?B?U2lMZXVwbXM1RWlERU8rVWF5SFF1cEhycjRFaEFNbjJPUkgyTGhvajEzYm9x?=
 =?utf-8?B?OGdoODgrV1VyNC8reHAzQUYxRVNzVXQrOGxrTENnWnNlZ1JyQk05SzhJR3Zx?=
 =?utf-8?B?STg1TzdsaVFQbWVyc0g4Rm1VQzlMSnJBZGQ1RWVNOCttWGdyeVVTY0NFUUZm?=
 =?utf-8?B?MmhGcGRSSmo4RWhvdWxWelR1WTdMYjdvc0Fzam1yMDNVZjlQKzJSMmhTeUkr?=
 =?utf-8?B?ajZuZWJIYVBKSHIxUHNIRkhXTXpIRVViNGVFcWEzR3A3cGJnQm9nMFBUcmxZ?=
 =?utf-8?B?MmVaS2dKSnAxaDl4dGtrMllKbjBtVTlBRkFpVkZ3aERpRThINktpRlNiaVdH?=
 =?utf-8?B?ZEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a334fa1-4164-4220-5312-08da5aab89d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 15:16:42.4400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uzNaCIlCQLfm6XOpj9boRYqioQ/bSu+QL+zO8Tv8up6tPHtZcOHFdnyid1RMMlMKZvDHkCiMZM/Yc9GwO+jQHYOVF5whxDlV34sRwFVxelc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6034
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgUGhpbGlwcCwNCg0KT24gMzAgSnVuZSAyMDIyIDE1OjQ1IFBoaWxpcHAgWmFiZWwgd3JvdGU6
DQo+IE9uIERvLCAyMDIyLTA2LTMwIGF0IDEzOjQzICswMDAwLCBQaGlsIEVkd29ydGh5IHdyb3Rl
Og0KPiA+IE9uIDI5IEp1bmUgMjAyMiAxODoxOCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+
ID4gPiBPbiBXZWQsIEp1biAyOSwgMjAyMiBhdCA2OjIxIFBNIFBoaWxpcHAgWmFiZWwgd3JvdGU6
DQo+ID4gPiA+IE9uIERpLCAyMDIyLTA2LTI4IGF0IDIwOjQ1ICswMTAwLCBQaGlsIEVkd29ydGh5
IHdyb3RlOg0KPiA+ID4gPiA+IFRoZSBSZW5lc2FzIFJaL1YyTSBTb0MgKHI5YTA5ZzAxMSkgaGFz
IGEgbmV3IGkyYyBjb250cm9sbGVyLiBUaGlzDQo+ID4gPiBzZXJpZXMNCj4gPiA+ID4gPiBhZGQg
dGhlIGRyaXZlci4gT25lIGFubm95aW5nIHByb2JsZW0gaXMgdGhhdCB0aGUgU29DIHVzZXMgYSBz
aW5nbGUNCj4gPiA+IHJlc2V0DQo+ID4gPiA+ID4gbGluZSBmb3IgdHdvIGkyYyBjb250cm9sbGVy
cywgYW5kIHVuZm9ydHVuYXRlbHkgb25lIG9mIHRoZQ0KPiBjb250cm9sbGVycw0KPiA+ID4gPiA+
IGlzIG1hbmFnZWQgYnkgc29tZSBmaXJtd2FyZSwgbm90IGJ5IExpbnV4LiBUaGVyZWZvcmUsIHRo
ZSBkcml2ZXINCj4ganVzdA0KPiA+ID4gPiA+IGRlYXNzZXJ0cyB0aGUgcmVzZXQuDQo+ID4gPiA+
DQo+ID4gPiA+IFRoaXMgc291bmRzIHNjYXJ5LiBJZiB0aGUgZHJpdmVyIGlzIG5ldmVyIGxvYWRl
ZCwgYW5kIHRoZSByZXNldCBpcw0KPiA+ID4gPiBuZXZlciBkZWFzc2VydGVkLCB3aGF0IGhhcHBl
bnMgdG8gdGhlIGZpcm13YXJlIHRyeWluZyB0byBhY2Nlc3MgdGhlDQo+ID4gPiA+IG90aGVyIGky
YyBjb250cm9sbGVyPyBEb2VzIGl0IGhhbmc/IE9yIHdyaXRlIHRvIHRoZSByZXNldCBjb250cm9s
bGVyDQo+ID4gPiA+IHJlZ2lzdGVycyB0byBkZWFzc2VydCB0aGUgcmVzZXQ/IElmIHNvLCBpcyB0
aGVyZSBhbnkgcHJvdGVjdGlvbg0KPiBhZ2FpbnN0DQo+ID4gPiA+IGNvbmN1cnJlbnQgYWNjZXNz
IGZyb20gZmlybXdhcmUgYW5kIHJlc2V0IGNvbnRyb2xsZXIgZHJpdmVyPw0KPiA+IFdoZXJlIGEg
Y29tbW9uIHJlc2V0IGlzIHVzZWQgYnkgTGludXggYW5kIHNvbWUgZmlybXdhcmUsIEkgdGhpbmsg
d2UgaGF2ZQ0KPiB0bw0KPiA+IGVuc3VyZS9hc3N1bWUgdGhhdCBib3RoIG9ubHkgZXZlciBkZS1h
c3NlcnQgaXQuDQo+IA0KPiBXZSBhbHNvIGhhdmUgdG8gbWFrZSBzdXJlIHRoYXQgbm8gcmVhZC1t
b2RpZnktd3JpdGUgY3ljbGVzIGFyZSByZXF1aXJlZA0KPiB0byBkZWFzc2VydCB0aGUgcmVzZXRz
IGlmIHdlIGNhbid0IGxvY2sgYmV0d2VlbiBmaXJtd2FyZSBhbmQga2VybmVsLg0KPiBPdGhlcndp
c2UgY29uY3VycmVudCBhY2Nlc3MgY291bGQgY2F1c2UgYSBkZWFzc2VydCB0byBiZSByZXZlcnRl
ZC4NCkFncmVlZA0KDQoNCj4gPiBJbiB0aGlzIHBhcnRpY3VsYXIgU29DLCB0aGUgcmVnaXN0ZXIg
dXNlZCB0byBhc3NlcnQvZGUtYXNzZXJ0IHRoZSByZXNldA0KPiA+IGhhcyB3cml0ZSBlbmFibGUg
Yml0cyBpbiB0aGUgdXBwZXIgaGFsZiBvZiB0aGUgcmVnLiBUaGVyZSBzaG91bGRuJ3QgYmUNCj4g
YW55DQo+ID4gaXNzdWVzIHdpdGggYm90aCB0cnlpbmcgdG8gZGUtYXNzZXJ0IHRoZSByZXNldCBh
dCB0aGUgc2FtZSB0aW1lLg0KPiANCj4gV2hpY2ggcmVzZXQgZHJpdmVyIGlzIGhhbmRsaW5nIHRo
ZSByZXNldCBmb3IgdGhpcyBpMmMgbW9kdWxlPw0KZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1j
cGcuYyANClNlZSByemcybF9jcGdfYXNzZXJ0KCkgYW5kIHJ6ZzJsX2NwZ19kZWFzc2VydCgpDQpO
b3RlIHRoaXMgZHJpdmVyIGhhbmRsZXMgYSBmZXcgZGlmZmVyZW50IFNvQ3MsIHRoZSBTb0MgdXNp
bmcgdGhpcyBpMmMNCmRyaXZlciBpcyBzcGVjaWZpZWQgaW4gZHJpdmVycy9jbGsvcmVuZXNhcy9y
OWEwOWcwMTEtY3BnLmMNCg0KDQo+ID4gPiBJbiByZXNwb25zZSB0byB2MSwgSSB3cm90ZQ0KPiA+
ID4NCj4gPiA+ID4gVGhhdCBpcyBhY3R1YWxseSBhbiBpbnRlZ3JhdGlvbiBpc3N1ZSwgbm90IGFu
IGkyYyBjb250cm9sbGVyIGlzc3VlLg0KPiA+ID4gPg0KPiA+ID4gPiBQZXJoYXBzIHdlIG5lZWQg
YSBSRVNFVF9JU19DUklUSUNBTCBmbGFnLCBjZnIuIENMS19JU19DUklUSUNBTCwNCj4gPiA+ID4g
dG8gYmUgc2V0IGJ5IHRoZSByZXNldCBwcm92aWRlcj8NCj4gPg0KPiA+IEZyb20gd2hhdCBJIHVu
ZGVyc3RhbmQsIHRoZXJlIGFyZSB0d28gbWFpbiB1c2UgY2FzZXMgZm9yIHJlc2V0czoNCj4gPiAx
LiBPZnRlbiByZXNldCBsaW5lcyBtYXkgYmUgYXNzZXJ0ZWQgYXQgcG93ZXIgb24gYW5kIHNvIGEg
ZHJpdmVyIG5lZWRzDQo+IHRvDQo+ID4gwqDCoMKgZGUtYXNzZXJ0IHRoZW0gc28gdGhhdCB0aGUg
bW9kdWxlIGNhbiBiZSB1c2VkLg0KPiANCj4gVGhlcmUgYXJlIHJlc2V0cyB0aGF0IGFyZSBub3Qg
aW5pdGlhbGx5IGFzc2VydGVkIChhbW9uZyB0aGVtIHRoZSBzZWxmLQ0KPiBkZWFzc2VydGluZyBy
ZXNldHMpIHRoYXQgYXJlIHJlcXVpcmVkIHRvIGJlIGFzc2VydGVkIHNvbWUgdGltZSBkdXJpbmcN
Cj4gYm9vdCwgdG8gcHV0IHNvbWUgaGFyZHdhcmUgaW50byBhIHdlbGwgZGVmaW5lZCBzdGF0ZS4N
Cj4gSSBkb24ndCB0aGluayB0aG9zZSBzaG91bGQgYmUgc2hhcmVkLCBidXQgdGhleSBzb21ldGlt
ZXMgYXJlLg0KPiANCj4gPiAyLiBBIGRyaXZlciBtYXkgbmVlZCB0byByZXNldCB0aGUgbW9kdWxl
IGZvciBzb21lIHJlYXNvbi4gSSBoYXZlIG9ubHkNCj4gPiDCoMKgwqBzZWVuIHRoaXMgd2l0aCB3
YXRjaGRvZyB0aW1lcnMgd2l0aCBubyB3YXkgb3V0Lg0KPiANCj4gR3JlcCBmb3IgZGV2aWNlX3Jl
c2V0KCkgb3IgcmVzZXRfY29udHJvbF9yZXNldCgpIGZvciBzb21lIGV4YW1wbGVzLg0KPiBBbHNv
IHRoZXJlIGFyZSBxdWl0ZSBhIGZldyBhc3NlcnQvdWRlbGF5L2RlYXNzZXJ0IGNhbGxzIGluIGRy
aXZlcnMuDQpPaywgdGhvdWdoIEknbSBub3QgY29udmluY2VkIHRoYXQgdGhlIGRyaXZlciBzcGVj
aWZ5aW5nIHRoZSByZXNldA0KcGVyaW9kIGlzIHRoZSByaWdodCB3YXkgdG8gc3VwcG9ydCBsb3Rz
IG9mIGRpZmZlcmVudCBwbGF0Zm9ybXMuDQoNCg0KPiBBbHNvIG1hbnkgZHJpdmVycyBhc3NlcnQg
dGhlIHJlc2V0IGFnYWluIGR1cmluZyByZW1vdmUoKS4gV2hldGhlciB0aGF0DQo+IGlzIGFsd2F5
cyBuZWNlc3Nhcnkgb3IgdXNlZnVsLCBJIGNhbid0IHNheS4NClF1aXRlLiBJdCdzIGRpZmZpY3Vs
dCB0byBrbm93IGlmIHRoZSBtb2R1bGUgcmVxdWlyZXMgYSByZXNldCBvciB0aGF0J3MNCmp1c3Qg
d2hhdCB0aGUgZHJpdmVyIGRldmVsb3BlciB1c2VkLg0KDQoNCj4gSXQncyBzb21ldGltZXMgbmlj
ZSBkdXJpbmcgZGV2ZWxvcG1lbnQsIHRvIGJlIGFibGUgdG8gcmVsb2FkIGEga2VybmVsDQo+IG1v
ZHVsZSBvciByZWJpbmQgYSBkcml2ZXIgdG8gcmVzZXQgc29tZSBsb2NrZWQgdXAgaGFyZHdhcmUu
DQpPaywgdGhhdCdzIGEgZ29vZCB1c2UgY2FzZSENCg0KDQo+ID4gU28gaWYgYSBkcml2ZXIgZG9l
cyBub3QgbmVlZCB0byByZXNldCB0aGUgbW9kdWxlLCBzaG91bGRuJ3QgdGhlIGRyaXZlcg0KPiA+
IG9ubHkgZXZlciBiZSBkZS1hc3NlcnRpbmcgdGhlIHJlc2V0IGxpbmU/DQo+IA0KPiBJJ20gbm90
IHN1cmUgdGhlIGRyaXZlciBjYW4gYWx3YXlzIGtub3cgdGhpcyBpZiBpdCBpcyB1c2VkIG9uIGRp
ZmZlcmVudA0KPiBwbGF0Zm9ybXMuDQo+IA0KPiA+IElmIHNvLCBpdCBhbHNvIGRvZXNu4oCZdCBt
YXR0ZXIgd2hldGhlciB0aGUgcmVzZXQgaXMgc2hhcmVkIHdpdGggb3RoZXINCj4gPiBtb2R1bGVz
IG9yIG5vdC4NCj4gPiBJZiBhIGRyaXZlciBuZWVkcyB0byByZXNldCB0aGUgbW9kdWxlLCB0aGVu
IHRoZSByZXNldCBjYW5ub3QgYmUgc2hhcmVkDQo+ID4gd2l0aCBvdGhlciBtb2R1bGVzIHVzZWQg
YnkgZmlybXdhcmUgb3IgTGludXgsIG9yIHdlIGNhbm5vdCB1c2UgYW55DQo+ID4gb3RoZXIgbW9k
dWxlcyB0aGF0IHNoYXJlIHRoZSByZXNldCBsaW5lLg0KPiANCj4gSXQgY2FuIGJlIHNoYXJlZCBm
b3IgdGhlIHNwZWNpYWwgY2FzZSBvZiBtdWx0aXBsZSBtb2R1bGVzIHJlcXVpcmluZyBhDQo+IHNo
YXJlZCByZXNldCBsaW5lIHRvIGJlIGFzc2VydGVkIG9uY2UsIGF0IHNvbWUgdGltZSBiZWZvcmUg
dGhlIG1vZHVsZXMNCj4gYXJlIHVzZWQuIFRoZSByZXNldCBjb250cm9sbGVyIEFQSSBzdXBwb3J0
cyB0aGlzIGZvciB0aGUNCj4gcmVzZXRfY29udHJvbF9yZXNldCgpIGNhbGwuDQpJbiBvcmRlciBm
b3IgZHJpdmVycyB0byB3b3JrIG9uIGxvdHMgb2YgcGxhdGZvcm1zLCBzaG91bGQgYWxsIGRyaXZl
cnMNCnVzZSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X3NoYXJlZCgpIGluc3RlYWQgb2YgZGV2bV9y
ZXNldF9jb250cm9sX2dldCgpLA0KdW5sZXNzIHRoZXJlIGlzIGEgbmVlZCB0byByZXNldCB0aGUg
aGFyZHdhcmUgYXQgYSBzcGVjaWZpYyB0aW1lIGFmdGVyDQpib290IChlLmcuIHdhdGNoZG9nIHdp
dGggbm8gd2F5IG91dCk/DQoNClNvIHdoZXJlIGRvIHdlIGdvIHdpdGggdGhpcyBmb3IgdGhpcyBp
MmMgZHJpdmVyPw0KDQpUaGFua3MNClBoaWwNCg==
