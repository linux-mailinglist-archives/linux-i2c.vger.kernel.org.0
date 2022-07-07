Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FBC656AAFC
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 20:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236322AbiGGSrI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 14:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235452AbiGGSrH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 14:47:07 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2138.outbound.protection.outlook.com [40.107.114.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953FA4F66B;
        Thu,  7 Jul 2022 11:47:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+0EC6AxMojJmDIajtn3HUPtxr+Um463YTEOWxnr8wsnna+OD4Iyaw3APyCpEUPHqMkzm9u5sUm8WGTO47YIJgQf5mRfdPS0Kkltrm1tP2vZVSeMo0ncKcWcFQFHzcvip74mlA1V0wuf8CBuu4Ig1G9JDC+NhkngfDAaWXvPC2/xRPi+LgB2bIiSTNEwN9+Lmqpfvy+uT4b5iMmGtxh8pdeswdDEtYPOjx7uWf1qwNOPWyuGB5H6ex5JtTQIx+BA9+rxcJyqgFdQVYbhOmsIHfARw1NiGJ4gDntDG6B0Tj63AlIN1oIprm+ltvzr/W6hIou5Qnc8AWh78T69riJl+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3ruTZ6Zsj747YNIrWOCZV9GEVwNlfrmgeFG1c8/VbM=;
 b=ZKr+aFnY1VQV5gQEzwNVDy9L5/RbOThPEcM5x/aVKEj0fmKQAFc5YP95ybzciAp1y1jm6ovg6b1Il4COJnaCP/Fg+bBCpCaClZ/DYqx1fPnVvEwmmmWSAztTzq2S9eVU04sXCTPg8OYV/sZ4r6n/pBFpLgL/38ad3Q1mXeTCk00G+CkunxK2akgg1IsfHZTi6T3rexh5H/pAJE7oTjazPLE0QBwRFdQqLVm5u3MCEBC0aSFIIcUG8WPT2/X8Vx4kAy0o1praxOp0yHLN9nR77eO+6TwWn1u483P8IXlrggsknPZ0pF6Xe2HhEv1EQZjBV8b9BLe4KAhUmO9agMVlgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3ruTZ6Zsj747YNIrWOCZV9GEVwNlfrmgeFG1c8/VbM=;
 b=UI/3HTxLH6/AjzGACouK0L6x1djjpEdXqjdQEx7aR1//1ufqq/7gSZsYHU0L448x7XxPadtqEfcmz/t3VQgE9vTSaqevY3IaKIlVNCRDhYAWmGkL8T8TM8WxhC5h2+NbZRJlEevTkhYMyIxtMAMOobj2IHxM39u8rzV36xobQt8=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYCPR01MB8679.jpnprd01.prod.outlook.com (2603:1096:400:15e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Thu, 7 Jul
 2022 18:47:04 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5417.017; Thu, 7 Jul 2022
 18:47:04 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] i2c: Add Renesas RZ/V2M controller
Thread-Topic: [PATCH v3 2/2] i2c: Add Renesas RZ/V2M controller
Thread-Index: AQHYjWkxMg1ZnbISoEmC77vxSwmcoq1q+VkAgAFdSICAAG5ZAIABgxGwgASWB2CAAFnZgIAADfFg
Date:   Thu, 7 Jul 2022 18:47:04 +0000
Message-ID: <TYYPR01MB7086B6281BCBA67BB6626333F5839@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220701163916.111435-1-phil.edworthy@renesas.com>
 <20220701163916.111435-3-phil.edworthy@renesas.com>
 <YsAxSrcAk4jtRYx4@smile.fi.intel.com>
 <CAMuHMdU1-LQJUCsDAfaC4OhRW7ijcpAG9VEUHu_Gu1qE7LdweA@mail.gmail.com>
 <YsGy2rqk1tKQJJ/b@smile.fi.intel.com>
 <TYYPR01MB7086921244A6D1B764368A54F5839@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <TYYPR01MB70869DD9107B4A3B2319AF4DF5839@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <CAMuHMdUnR819KRVke=ob21cvsMnOcQHFq3ym-oAg0dKcpWCGtw@mail.gmail.com>
In-Reply-To: <CAMuHMdUnR819KRVke=ob21cvsMnOcQHFq3ym-oAg0dKcpWCGtw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c50d2a03-ef83-44b4-a10e-08da6049161f
x-ms-traffictypediagnostic: TYCPR01MB8679:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Oq+ho0Vd4GRFITsxp1qQz8/MeB1daaGW97jdekul7US3ZItyuQ65IrdaMzygB8S40MRDJVz0RnYbQH+EgLVMxIaxkwb+Ar1jH2F1CVPua4lfbfrAmgE+TpIcjMaZk4M4WO5LxwGZxu2RYwhf1/4BjjDk6zzkLlRkRpJ08adbMTLrJ6kXQxRGPLil1Xd78sz1xboy2mlJ8KmFJ9Pw3/5G6MTgMtsKNoOsthAs9sa7Wd+d+Xs9NWB4oS4fogCP4lCunwdT997pOozrv2KV4l7nDuPXYPbuSNqiTJ/vDhfRiodcRV53hdtOTiw/U4O0BpzTZZLN7kWMeiH2v9JdMyfBlrm7RGhAHYeRt660ev6eubWFX3tR6kHlo0yEIuyubFB1hv12yoosRK76Tq439/u+utfaBrYlBYLHZPt70bhoNVvteedsE7WI5l439rPozIYnz/qmPa/ixgb+0wIno7dMjCmShRS9oC08IHmVXeE6ps2bOzEPGLBIERmgPWk9B/a917IunILNGAxDjbSKEyIFcqz+2R91yRBYvbHe3H6vYXqGiKFDSVUgJop/pcdq2i4MrxTk6iyGoRXhq/fh/Ttc6oA5U5Pjqt1HbKkDf61RSiCp3gvQP03ooZnHGbkt+gu900iUESvZSpQjPBMmSyXDR4pbocPLGGpLYMf+IeFWBBrmY9bZuramC96DAnYcMgCcBm1rIT4mJOl9/155YYuRiQiw+1ItRy/FodreZtBtk1z35dfShwS1jw0AZwAyX/n9C8CcHHcff0yHjYocAaXLv5fqcAGXjNscXIdWflcFAz3KJSKvIml5WeIweh4/D4K
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(33656002)(38070700005)(86362001)(478600001)(8936002)(38100700002)(5660300002)(122000001)(52536014)(2906002)(41300700001)(44832011)(7416002)(6506007)(6916009)(4326008)(8676002)(66446008)(64756008)(66476007)(316002)(76116006)(9686003)(54906003)(186003)(53546011)(26005)(83380400001)(71200400001)(66556008)(66946007)(7696005)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3ArRllQaHpzOGpLNWVvTllUejNicncyTFJvWkJkVFJ4RGhBWFlJelE2Qlg3?=
 =?utf-8?B?ZXNTUy81cUZwajIyYzRSNFYwMzFlRFk3NXQxR0JkMWR2WFVtaTVBQ2RoYmdC?=
 =?utf-8?B?NjNWWXhGWXp2OUhQN0lQVHYrK2VSMnE1SWdFZnphYXd4VGhQM3RacW9STlJa?=
 =?utf-8?B?bFJMYmJ0ZWZZUHVUdnRucVc0QS8yY1pUOENqaVA0cGwzL0FsRU9jWnA4WFAz?=
 =?utf-8?B?OEZlN01mK281YXVFNEVNMkxYRlZOdGFSalJHZnlDSks4Y0xDckdkMlhoMm5n?=
 =?utf-8?B?eVNSb2NKdERUWG9YZWRLREw0NDl5U3JKaXZ4NkMxYitseElGWkRWUXFXU053?=
 =?utf-8?B?enM5VGkvYk5ESXpRbzh2Z01Fek9zRmlBQk5pSWVCYnJ6NXEycHkvcmlrYkta?=
 =?utf-8?B?YnY3UEp5QzRDOU1LcG5xQzRJZlZLb1BkM2ZVVzZBdFM1d1B6U2R5TmZ3cW9I?=
 =?utf-8?B?c1l4anQ5dHhmMmgxd3lUZWZvREd5dEZRL2xSZFFKVHBpNXM0clE3N0doMUZ3?=
 =?utf-8?B?Q2VJdXVaWGVDbGtxV2RRNDhzY1hEMkdkaUJLSnpsYjN5MjNGb20yejFlbzlM?=
 =?utf-8?B?ZkpjVlhOK0tXNzdkdElXQXNFY2VBbHhtZUJyZSthbCtQUFJ2RXQvVWJoUXlx?=
 =?utf-8?B?M2pZTVNxeEVTbUo4T0dPZ2dxZnU3WDBFSSs4V1laNkh6QnN0VjhUcklRQzJO?=
 =?utf-8?B?WkprYnNFSVNZeUdpYlVjMCsvWFZBWENZbENRTzdKa3dGcFF0WmZZZFo5b3Zz?=
 =?utf-8?B?aHBkWGN5aE1Ha2kzamRTWUhqaEhidTlVdWxUZ2E4cFZ0S2lqMUZuaVpJbVNL?=
 =?utf-8?B?Y1NZMFhWdDhiR2pGdHd5bGFvZU9QQktGT09kRnRXbjJLRDNyWVgxYXhRWjA4?=
 =?utf-8?B?Q01lM28wK0t6dTRpT255TlB5UXIwVVpMMkowejlzamNENVA1VE5tdzIzOHph?=
 =?utf-8?B?OUpVbGoyUVpkeHVwMTBsMC8yWHhKdzRsN09UYnlBSkVrTVJiU2ZiQ2R4SERq?=
 =?utf-8?B?Y3NLZmRmOFhEeVE1a2FpekpZN3lCWXVxUnZ1QmY4cVJVSlR1UDBHckFrTFRh?=
 =?utf-8?B?TDh2VDMvUVN6eXRwUDVySXZnMldobzZGM1EzZjRaMjdSRmpRMlAwVGNHMXNn?=
 =?utf-8?B?eUJGMklwWWlraGt6ZFgzRlRHbzRhbHMvSVJMcjUxMllRSTk1U291SjZFZ0Nn?=
 =?utf-8?B?OU9WdGFLUTgxZ3c5WFpSRHpkVzFxN0lJanRSUk9mS2xSUmVhbFBnWnlQbUdU?=
 =?utf-8?B?c2M5ZHJodFJIYmVvb3FrTWY4dWZqOFVRbDE5d0JzNUEwU1VBRWtQRzAraVlv?=
 =?utf-8?B?QVFRVTlSMnI1SlJ2aHpxZkt6NHA3REFRRFlLbTNmb3ZrR282ZUxZQWJUNlZq?=
 =?utf-8?B?Q3Q3c21BcjEvYUdKNTV2NVJVWFBYcnZ4cmZtZXVRaGtaNkJRWFVXamhObFdk?=
 =?utf-8?B?a21LY1hhR2JxZUNnSlhRUTQwYXZzWVp6Tng5SmZYN1J0bHNmeitMZ2NEUy9n?=
 =?utf-8?B?NXRCQjkrYmRTMGZYRk96QWhRSURxSGtTSnJGRkxRREtBVWlIS2V2UmFUaXBk?=
 =?utf-8?B?UFBhVGVhbGNkVjNLbzhpZVBWQmlUbGs2VVZ0dE9tbkpTTDY0aUdmcjJDY1ZB?=
 =?utf-8?B?dlZTaGJwL2tKTWVIR1F6SEp6cUUwRnByYnRPOEVkQnI3Y05kUGc0ZUNNVDJy?=
 =?utf-8?B?TzRqQkZCeHhZTGZYVW56bGVhRk1hUWt5aC8zV2JWYWM4T2FWVlViY1pvNktt?=
 =?utf-8?B?S29laWNHVjV6cW4zTnY1UHZRT29PNWl2dVNJOVRnVnNyMmNrOGdwOVNOd24z?=
 =?utf-8?B?MWhVRjNrS3Frb1NBNHIyVlBqL3ZRUTdFM0kyTGZFZ3k4QnVRM1NoNDRJM0RV?=
 =?utf-8?B?b1dESm96Q2NQK2M0NXRlM280cW9ZNlZUblFjeEMybDkvdUVObUhESTdCSHhM?=
 =?utf-8?B?Zys5UVN4c1owUE9ZcGVMeUl4dGdDR1FDajd1SVhQOEpoZXI4V3BMci9GTzF5?=
 =?utf-8?B?d2YzbkF2ajhWQmpJQmR6WUI5L3p3QXFGQ3VYV3ZlTkloaGI4MkpCdDFzbDdE?=
 =?utf-8?B?bEpxbmpId1g3VU1PendVM2ZheHFTVXNRY21ESXhoYVNhZlhDQml5Nm0vSElV?=
 =?utf-8?B?UVViZTZaeWROeHpXRWJPRkE2TWttNHpFV3Qzei9WSmZ5ekpQODFwYXM1WE1z?=
 =?utf-8?B?WHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c50d2a03-ef83-44b4-a10e-08da6049161f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 18:47:04.5772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dSFW2gX4FVkRmN2Oz5TpH6soEj86ELIScHzWEsDDo5tNtuIHcwGfrH4pW+u3ZerL4HOt/59v5ySugg73TOSST3MfqZhz/aEiIeIADCknILI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8679
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIDA3IEp1bHkgMjAyMiAxODo0NiBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IE9uIFRodSwgSnVsIDcsIDIwMjIgYXQgNjozNyBQTSBQaGlsIEVkd29ydGh5IHdyb3Rl
Og0KPiA+IE9uIDA3IEp1bHkgMjAyMiAwODoyMSBQaGlsIEVkd29ydGh5IHdyb3RlOg0KPiA+ID4g
T24gMDMgSnVseSAyMDIyIDE2OjE3IEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gPiA+ID4gT24g
U3VuLCBKdWwgMDMsIDIwMjIgYXQgMTA6NDE6NDVBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVu
IHdyb3RlOg0KPiA+ID4gPiA+IE9uIFNhdCwgSnVsIDIsIDIwMjIgYXQgMTo1MSBQTSBBbmR5IFNo
ZXZjaGVua28NCj4gPiA+ID4gPiA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3
cm90ZToNCj4gPiA+ID4gPiA+IE9uIEZyaSwgSnVsIDAxLCAyMDIyIGF0IDA1OjM5OjE2UE0gKzAx
MDAsIFBoaWwgRWR3b3J0aHkgd3JvdGU6DQo+ID4gPiA+ID4gPiA+IFlldCBhbm90aGVyIGkyYyBj
b250cm9sbGVyIGZyb20gUmVuZXNhcyB0aGF0IGlzIGZvdW5kIG9uIHRoZQ0KPiA+ID4gUlovVjJN
DQo+ID4gPiA+ID4gPiA+IChyOWEwOWcwMTEpIFNvQy4gSXQgY2FuIHN1cHBvcnQgb25seSAxMDBr
SHogYW5kIDQwMEtIeg0KPiBvcGVyYXRpb24uDQo+ID4gPiA+DQo+ID4gPiA+IC4uLg0KPiA+ID4g
QWxsIG90aGVyIHN1Z2dlc3RlZCBjaGFuZ2VzIGFyZSBvay4NCj4gPiA+DQo+ID4gPg0KPiA+ID4g
PiA+ID4gPiArICAgICBwbV9ydW50aW1lX2dldF9zeW5jKGRldik7DQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgOy0pDQo+ID4gPiA+DQo+ID4gPiA+IFRo
aXMgbWFrZXMgc2Vuc2Ugb25seSBpZiB3ZSB0ZXN0IGZvciBlcnJvci4gT3RoZXJ3aXNlIHRoZSBw
dXQgbWlnaHQNCj4gPiA+ID4gaW1iYWxhbmNlDQo+ID4gPiA+IGNvdW50ZXIuDQo+ID4gPiBJIGFk
ZGVkIGNvZGUgdG8gY2hlY2sgdGhlIHJldHVybiB2YWx1ZSBhbmQgdG8gbXkgc3VycHJpc2UgaXQg
cmV0dXJuZWQNCj4gPiA+IC1FQUNDRVMuDQo+ID4gPiBTb21lIGRpZ2dpbmcgbGF0ZXIsIHRoaXMg
b25seSBoYXBwZW5zIHdoZW4gSSBoYXZlIGFuIGkyYyBjb250cm9sbGVyDQo+ID4gPiBlbmFibGVk
IHRoYXQgZG9lc24ndCBoYXZlIGFueSBjaGlsZHJlbi4NCj4gPiA+DQo+ID4gPiBycG1fcmVzdW1l
KCkgcmV0dXJucyAtRUFDQ0VTIFsxXSBiZWNhdXNlIHJ1bnRpbWVfc3RhdHVzIGFuZA0KPiBsYXN0
X3N0YXR1cw0KPiA+ID4gYXJlIHNldCB0byBSUE1fU1VTUEVOREVELg0KPiA+ID4NCj4gPiA+IFRo
ZSBpMmMgY29udHJvbGxlciB0aGF0IGRvZXMgaGF2ZSBhIGNoaWxkIGhhcyBydW50aW1lX3N0YXR1
cyA9DQo+IFJQTV9BQ1RJVkUNCj4gPiA+IGFzIHRoZXJlIGlzIGEgY2FsbCB0byBwbV9ydW50aW1l
X3Jlc3VtZV9hbmRfZ2V0KCkgb24gaXQgZHVlIHRvIHRoZSBpMmMNCj4gPiA+IGNvbnRyb2xsZXIg
cGVyZm9ybWluZyBhbiBpMmMgdHJhbnNmZXIgZm9yIHRoZSBzbGF2ZSBkZXZpY2UuDQo+ID4gPg0K
PiA+ID4gSSBhbSBjdXJyZW50bHkgc3RydWdnbGluZyB0byB3b3JrIG91dCB3aHkgdGhpcyBpcyBo
YXBwZW5pbmcuLi4NCj4gPg0KPiA+IEZpcnN0IHBtX3N1c3BlbmQoKSB3b3JrcyBpdCdzIHdheSBk
b3duIHRvIF9fcG1fcnVudGltZV9kaXNhYmxlKCk6DQo+ID4gICBfX3BtX3J1bnRpbWVfZGlzYWJs
ZSsweDEzNC8weDFlMA0KPiA+ICAgX19kZXZpY2Vfc3VzcGVuZF9sYXRlKzB4MjgvMHgxYzQNCj4g
PiAgIGRwbV9zdXNwZW5kX2xhdGUrMHgxNTgvMHgyMzANCj4gPiAgIHN1c3BlbmRfZGV2aWNlc19h
bmRfZW50ZXIrMHgxYzgvMHg0YjQNCj4gPiAgIHBtX3N1c3BlbmQrMHgyMTAvMHgyOGMNCj4gPiBB
dCB0aGUgZW5kIG9mIHdoaWNoLCBydW50aW1lX3N0YXR1cyBhbmQgbGFzdF9zdGF0dXMgYXJlIGJv
dGgNCj4gUlBNX1NVU1BFTkRFRCwNCj4gPiBhbmQgZGlzYWJsZV9kZXB0aCA9IDEgWzFdDQo+ID4N
Cj4gPiBBZnRlciB0aGF0IHJ6djJtX2kyY19zdXNwZW5kKCkgaXMgY2FsbGVkIHRyaWdnZXJpbmcg
dGhlIEVBQ0NFUyBlcnJvcg0KPiA+IGNvbmRpdGlvbiBbMl06DQo+ID4gICBycG1fcmVzdW1lKzB4
MzM4LzB4NjMwDQo+ID4gICBfX3BtX3J1bnRpbWVfcmVzdW1lKzB4NGMvMHg4MA0KPiA+ICAgcnp2
Mm1faTJjX3N1c3BlbmQrMHgyNC8weGIwDQo+ID4gICBwbV9nZW5lcmljX3N1c3BlbmRfbm9pcnEr
MHgzMC8weDUwDQo+ID4gICBnZW5wZF9maW5pc2hfc3VzcGVuZCsweGIwLzB4MTMwDQo+ID4gICBn
ZW5wZF9zdXNwZW5kX25vaXJxKzB4MTQvMHgyMA0KPiA+ICAgX19kZXZpY2Vfc3VzcGVuZF9ub2ly
cSsweDY4LzB4MWQwDQo+ID4gICBkcG1fbm9pcnFfc3VzcGVuZF9kZXZpY2VzKzB4MTEwLzB4MWRj
DQo+ID4gICBkcG1fc3VzcGVuZF9ub2lycSsweDI0LzB4YTANCj4gPiAgIHN1c3BlbmRfZGV2aWNl
c19hbmRfZW50ZXIrMHgyZjAvMHg0YjQNCj4gPiAgIHBtX3N1c3BlbmQrMHgyMTAvMHgyOGMNCj4g
Pg0KPiA+IEkgdGhpbmsgdXNpbmcgcnVudGltZSBQTSBmcm9tIHdpdGhpbiBkcml2ZXIgc3VzcGVu
ZC9yZXN1bWUgaXMgc2ltcGx5IG5vdA0KPiA+IHN1cHBvcnRlZC4gSG93ZXZlciBJIGhhZCBzb21l
IGRpZmZpY3VsdHkgZm9sbG93aW5nIHRoZSBydW50aW1lIFBNIGNvZGUsDQo+ID4gc28gSSBjb3Vs
ZCBiZSB3cm9uZy4NCj4gDQo+IE9oLCBpdCdzIGEgTk9JUlEgc3lzdGVtIHNsZWVwIG9wLiBZb3Ug
aW5kZWVkIGNhbm5vdCB1c2UgcnVudGltZSByZXN1bWUNCj4gZnJvbSBzdWNoIGEgY2FsbGJhY2ss
IGFzIHRoZSBsYXR0ZXIgbWF5IHNsZWVwLg0KVGhhbmtzIGZvciBjb25maXJtaW5nIHRoaXMuDQoN
CkkgYmVsaWV2ZSBpMmMgY29udHJvbGxlciBkcml2ZXIgc2hvdWxkIHVzZSBOT0lSUSBzeXN0ZW0g
c2xlZXAgb3BzIGFzIGkyYw0KY2hpbGRyZW4gbWF5IG5lZWQgdG8gc2VuZCBJMkMgbWVzc2FnZXMg
ZHVyaW5nIHN1c3BlbmQsIGFuZCB0aGUgbm9pcnENCnNsZWVwIG9wcyBhcmUgY2FsbGVkIGFmdGVy
IHRoZSBsYXRlIHNsZWVwIG9wcyAodXNlZCBieSBzb21lIGkyYyBjaGlsZHJlbg0KZHJpdmVycyku
DQoNClNvIHNob3VsZCBJIGp1c3QgdXNlIGNsa19wcmVwYXJlX2VuYWJsZSgpIGFuZCBjbGtfcHJl
cGFyZV9lbmFibGUoKQ0Kd2l0aGluIHRoZSBpMmMgY29udHJvbGxlcidzIHN1c3BlbmQgYW5kIHJl
c3VtZT8NCg0KQlINClBoaWwNCg==
