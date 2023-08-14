Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A68977B98B
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 15:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjHNNR7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 09:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjHNNRp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 09:17:45 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2115.outbound.protection.outlook.com [40.107.114.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199A6F5;
        Mon, 14 Aug 2023 06:17:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZqomeiCrI/Q5uhAp1oIzepr0d7LrpPZAPD1am0Ou07cRubAr4jjq1Igo3/V176FB2XSYOn+CisjJ9CQ3leijx9PE8hGR7i4KMg1SQtqSD7kuHMLzb5tGMLFTG5OCym9Sgbb32ENQDLoe9H7lyK9VSp21fJiE4zsM/KbRNh1LumHym6/BGj/lr9MfMb7WpSrIV8blftf2aSoUBW721x2APzCDKofWaQQzbRG3+zfZGK9eBccZOLPo/WfEEp5rqJ7JJoC0AL22j2TP0FFV9ZA0afH7wwiUSkeIMy5QE+Xw5bsaEBbyGrjtVJ+0oASVomeGgKJ6sylZ8zaJXBWlNs2mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3f9hmZrc1yHPYHGr8tuNv36z4uRxCLSvmaM2noxWcKE=;
 b=YUbpGpe1k+tixLHHnQ+LhVc7/JZZfAFzqU15AEYf0LSTha2FV35vJKUAdaUEXa+bVOhu+su6f2CC9aSEts0wi6E4aREzBQJ6JJkiGWYbPxxs20sSCQUIHeYjNg79UD5eWgTl6dxzc+RGASx1uynnniuwSK15aqVZVlckG0z2Wiyu9mOwWcK5zUhsBv4YyiKdfaHtPfCqftJuuWvD+LGIzWvYi7xqh/VVG2pnhQEJ+ve1YMM8uSdgzqmwuHHb57x1+3VUn4/EMSX2UjPKuqdIueAEWDfImQTv6cE/diPVpBdQNmu8uDQq0/dv3mNn5jsGHmowAfmzTMjHI2hxoyU0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3f9hmZrc1yHPYHGr8tuNv36z4uRxCLSvmaM2noxWcKE=;
 b=Vo4xU7jm430CTtQqYQB+hK9tzWiYL0QwAuY56Bw1h2/FOPGUSHxYlvFucgZiEFsVI6AZAO08nvjHHL7f1SBmjHnkUGXirHqG14dAUnPtkmA//jyrpYk3/YzxMwmsnlKdeC56MxnAx0Krh/KqrDGaxWFV1huei80xjCOAffBEpiI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8879.jpnprd01.prod.outlook.com (2603:1096:604:15a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 13:17:40 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%6]) with mapi id 15.20.6678.025; Mon, 14 Aug 2023
 13:17:39 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Cameron <jic23@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
Thread-Topic: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
Thread-Index: AQHZxu8xqdWpTKFxl0mrPmlP0GQCwa/b6UAAgAADvoCAAVlKAIABqeGAgABf2wCAAQcZAIAB6BqAgAED5pCAAGj8gIABdEDwgAASZ4CAAALG8IAEnokAgAABDZA=
Date:   Mon, 14 Aug 2023 13:17:39 +0000
Message-ID: <OS0PR01MB5922F35E832483BA7365CFB88617A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230805174036.129ffbc2@jic23-huawei>
 <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230806142950.6c409600@jic23-huawei> <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
 <ZNFV+C1HCIRJpbdC@google.com> <ZNIyrG/2h/PeS9Oz@smile.fi.intel.com>
 <20230809182551.7eca502e@jic23-huawei>
 <OS0PR01MB59221A1ADB67E96E9E39D0198613A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNT+NY99n7y3abwa@smile.fi.intel.com>
 <OS0PR01MB5922DD3C809B78F1E9C5949B8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNZF6cjx5N+ZsIJx@smile.fi.intel.com>
 <OS0PR01MB5922E09340CDCFF54A9A6CBA8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdU6LhvnZ5FE_3BxyH7reVi69Rjcircquk=jYZ6-j3cqug@mail.gmail.com>
In-Reply-To: <CAMuHMdU6LhvnZ5FE_3BxyH7reVi69Rjcircquk=jYZ6-j3cqug@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8879:EE_
x-ms-office365-filtering-correlation-id: 36a9f5b6-e280-406f-5cce-08db9cc8d5d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Qg6nKhSEopm676MTOgeS+xs3G8VIHr3kxWMDeXyQhOYBT+1LMp3M+qxKzbbdtMAGyg5QsoOvbLJC/8AvtqWtPq/P8nxkr9Bts1gedJLsPMoxkhxqn3FDsq6IJ70HgJYd8ZFHr4BQfwq9qmbqaIiUEZa7Lc2SgPeI6EORlicKPNcEF0C7U/+AilObhzsLirKdDliDPKBIfRu+PZ5oTVWQegLKiYBgCBNSlnGuAp5ic6qTWKjZWMXfqBfF37VUluph3mpQJi0Cr2MYiOI5CdotwquJqivWTFocMXGSGvpdmlzrxzvvasedFTryWc6EM+MkrL7QTmH/YoOe5NLZn17zQMGhMzmI2RWBHaOq4J5xu7/rClWdCQZ/5onSv6j58IhsOqrV2rxf7r9YnfBEc+7BxHkxBQBkCpEdRMovvjTD64CiCD9taeDQ4+L072NTPhrlreiYkXacBM/AnFy/nRFajgs6fHZ7uZuMrAedNSK3vPaSDRdcjaIGOEE9188jcIrdfPzr4JhsiBU4LGIz6p8FCEF3A6VrCnv7Sz4dcPYzzNYNwce7RMwV8802UjMdfHhLQ/1AMWCy5oWDOpJS/5tGBTg2ZROlCpuxqvUV+xEeNo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(376002)(136003)(366004)(396003)(451199021)(1800799006)(186006)(53546011)(2906002)(6506007)(26005)(55016003)(478600001)(38070700005)(41300700001)(52536014)(5660300002)(7696005)(8936002)(8676002)(71200400001)(33656002)(86362001)(54906003)(316002)(66946007)(66556008)(66476007)(66446008)(76116006)(64756008)(6916009)(4326008)(122000001)(38100700002)(9686003)(7416002)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlozK1YyT3V0QlhuWHlDREFhS1hyZVN1NkRVZ3oxeDl0Rmg0VlRrcEI5Y2d3?=
 =?utf-8?B?UmpodklXaFl6ZjBicUdWTUM1TlNVNVptOGF0TE1SbzlMVFRUTW1lb0hIS0Y2?=
 =?utf-8?B?WGRnQkk2amZLNk1VZWVLRTZoTVR1OGVJdHM5Tm4xcHptbUI3SzZKSUlYQytj?=
 =?utf-8?B?VEVRbkhCOXozQVFnYTN2cVJheXcxMVNjNENxOGg4RGlDNGo3UnRjSGNVKzYz?=
 =?utf-8?B?NXc2WG5ZR2NwbGMyWHpzcndvWnNUQkc3MEJKa1RLVTNja3NrWW1qWnhDVHha?=
 =?utf-8?B?bi8xdXU3QWFoNjNVN293L1pQME4zb3pYNHRBSDYxN1NBbDhncG5rRXcyVDFG?=
 =?utf-8?B?cGlVcjJSRmVZUm40UmpTVmhjR3A3RUd3MS9ybDZFWHdST0lMbGttbUE1M1Zh?=
 =?utf-8?B?T01LbWZRWS9BdFN1K0NkSmg3ek54d0QxTlgyN1Z5cndqSC9KM2hPTENEcmhk?=
 =?utf-8?B?eVNCWVhraEJvdm01Q24rUGg5bzZxMFV1bGJTT2psOU85M2xoUzRoOS9xeUcx?=
 =?utf-8?B?MjExbVlzOW9LWm1Od0hRQ0xNMjVqTDVXZ0U0cDg2TDNqaUE3N2ErQmJHWFpj?=
 =?utf-8?B?eFFoM25Oa09JZmtRdFR1Z0VhQnIwc3NaejVTSGQwMTRrbEtMeU9POHExeU1V?=
 =?utf-8?B?YWVJZGpvYmdNbDdhcXQ3N0dEaFNFWVhsYWtxU1h2ME42MFI4WnRwUm1iWmpV?=
 =?utf-8?B?a2svS2pSdS9jVy9zZXJsRTUrbFBabm9VeGVjTG9GcHl0cmRwRG5MZ0xrV0hm?=
 =?utf-8?B?Uy9JeXdweUozR05ta3dDcCtOWUZrTi9OcUxkRU9lZWhSR21ESDBYcFFJODlL?=
 =?utf-8?B?U2JReG5kRExtRDJJRzdtZjVxaUZBTWl0NnRMOGRYUGZqdFc1L1FBRW5XMUlw?=
 =?utf-8?B?WjdiR2liQ2diSlhhc2x3dU9KUDRKSVVOUG93cmhPWWZYZThNWDRVTW01cXVU?=
 =?utf-8?B?UnhVZ1doOER1YkorODJIdHU2NUpMWkFPMlRqYmIwbWdjcDBYcVpRMlI0WTUx?=
 =?utf-8?B?NTVUNVl5UVhVUnRFNGtZZzhJRldEUkhxMkpJSkYra1Q4K3pHNDlhVmt6aXpH?=
 =?utf-8?B?UVdiWXNzVFJhdUdsa0lITFE3UGd2YVNKbWs0aHVGQXROYm50aXpZVUI5eE9q?=
 =?utf-8?B?bHRuaC9yRE44SWpLa1RXaGFvZ2dBSmg0czF2TnI3RlFzRE5uWkJ4ZnZGWVZt?=
 =?utf-8?B?dDZVS3N1aDlrclI4cnZROXZTYkZhdDI4djNPQ3dyd2sxQWw3WHpGeFhnZ1or?=
 =?utf-8?B?VlpYM2xQSDdaRDBuK05DTFVvSy9LRTI3bXRkRCtIK1ZJVzdLY3NnT3RTcHFX?=
 =?utf-8?B?RjQ2WU94TGxJdTBqZmk5UFZYblBLUEdQVWxTWitXTEg1aytJRzBKNVF5OHYy?=
 =?utf-8?B?ZjhFQS9tb3lLRzRPTWEvbjJCRTZ1UkVXR2dYc1RnZjdCbUV1NDhKeWNhU2s3?=
 =?utf-8?B?VXlKMDZqQko4RGRTTERxeFRHT1lHT1UyUVgzL2llRmlRWTN6RUxpb0NXV2sw?=
 =?utf-8?B?bllVRFpoaXhrRjBka0pHUGc3S0xrY2RsdXRsZDlXa3VqVUprSDFIRCtwQjF1?=
 =?utf-8?B?dnBwa0xVVmY5MXRSMk5nTDBzY01ZQXB1WE5odmFzbi9McjZMV0s3ODJOVUI5?=
 =?utf-8?B?aWFzSUNCK3JuZk0xNHFzZzYzejFpZE1yMUh2Tmx0YWV6Vy9JQXBIaHFKNFJk?=
 =?utf-8?B?VTErTlZDVmlYSVhJNmpGd3NxR2RGQXBTOHlRb3FaeEVyNFV1bStVUkw5TTdY?=
 =?utf-8?B?VnVmT0pTMUhDck5rYzdPa3hYcXRESWZFZEJFR3RER3kvVHR1L2JnSFByRlYz?=
 =?utf-8?B?QnpkRStDRnA5VmZLSFhNVXYza0VKajBnbEhQRmZOTXJ6dXVNOUxubDYzbkZH?=
 =?utf-8?B?ZkF1WFdJYXZuREJJSWE3ZmVMZ2I1OG1HdVQwY2NOc1ROcFcxNktSTVJHTlNl?=
 =?utf-8?B?aFJ1SDBtOG9mOURiallrNmNUbW4wRUxxRlY3SGxUTDJpek1SNmZuVlVBaG1G?=
 =?utf-8?B?RFd3TnkzenV2ZkFLOFVPckxNNm4wTUJZZm9WbFJjNUhzMFJSN1FPaklBaEdq?=
 =?utf-8?B?Q1FMVG5PMzh6ZmxZVmJ0TWdNL0VESlZaYjI2aXNNZ2ozdVBidlZDc0YzcFpO?=
 =?utf-8?B?K3hEVnZxQWJnQ1VzQUlSZHg3aWxDL05sVWdQU3B6YzFWTHYwMEFKaS9iUkpL?=
 =?utf-8?B?UXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a9f5b6-e280-406f-5cce-08db9cc8d5d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 13:17:39.7447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: easLC9izMJGvr1PLZMF7b13jjU21sKQPcozrgC/D0H0fjlicr1iOZcMR1Xh0crwdE1pZ5GXJ9M4o/Y4xk+KMoBLa3VFWGgCYC0A7lGdHTE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8879
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjcgMC80XSBFeHRlbmQgZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkgdG8gc3RydWN0DQo+
IGJ1c190eXBlDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCBBdWcgMTEsIDIwMjMgYXQg
NDo0NuKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6
DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDAvNF0gRXh0ZW5kIGRldmljZV9nZXRfbWF0
Y2hfZGF0YSgpIHRvIHN0cnVjdA0KPiA+ID4gYnVzX3R5cGUNCj4gPiA+DQo+ID4gPiBPbiBGcmks
IEF1ZyAxMSwgMjAyMyBhdCAwMToyNzozNlBNICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiA+
ID4gPiBPbiBUaHUsIEF1ZyAxMCwgMjAyMyBhdCAwOTowNToxMEFNICswMDAwLCBCaWp1IERhcyB3
cm90ZToNCj4gPiA+DQo+ID4gPiAuLi4NCj4gPiA+DQo+ID4gPiA+ID4gSSdtIGdvb2Qgd2l0aCB0
aGlzIGFwcHJvYWNoLCBidXQgbWFrZSBzdXJlIHlvdSBjaGVja2VkIHRoZSB3aG9sZQ0KPiA+ID4g
PiA+IGtlcm5lbCBzb3VyY2UgdHJlZSBmb3IgYSBzdWNoLg0KPiA+ID4gPg0KPiA+ID4gPiBDaGVj
a2luZyBhZ2FpbnN0IDE2IGlzIHRvbyBzaG9ydCBJIGd1ZXNzPz8NCj4gPiA+ID4NCj4gPiA+ID4g
ZHJpdmVycy9paW8vaW11L2ludl9tcHU2MDUwL2ludl9tcHVfaWlvLmggaGFzIDE4IGVudW1zLg0K
PiA+ID4NCj4gPiA+IFNvLCB3aGF0IGRvZXMgcHJldmVudCB1cyBmcm9tIG1vdmluZyB0aGF0IHRh
YmxlcyB0byB1c2UgcG9pbnRlcnM/DQo+ID4NCj4gPiBJIHRoaW5rIHRoYXQgd2lsbCBsZWFkIHRv
IEFCSSBicmVha2FnZShjbGllbnQtPm5hbWUgdnMgaWQtPm5hbWUpDQo+ID4NCj4gPiAgICAgICAg
IG1hdGNoID0gZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZjbGllbnQtPmRldik7DQo+ID4gICAgICAg
ICBpZiAobWF0Y2gpIHsNCj4gPiAgICAgICAgICAgICAgICAgY2hpcF90eXBlID0gKHVpbnRwdHJf
dCltYXRjaDsNCj4gPiAgICAgICAgICAgICAgICAgbmFtZSA9IGNsaWVudC0+bmFtZTsNCj4gPiAg
ICAgICAgIH0gZWxzZSBpZiAoaWQpIHsNCj4gPiAgICAgICAgICAgICAgICAgY2hpcF90eXBlID0g
KGVudW0gaW52X2RldmljZXMpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaWQtPmRyaXZl
cl9kYXRhOw0KPiA+ICAgICAgICAgICAgICAgICBuYW1lID0gaWQtPm5hbWU7DQo+ID4gICAgICAg
ICB9IGVsc2Ugew0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT1NZUzsNCj4gPiAgICAg
ICAgIH0NCj4gDQo+IEkgZG9uJ3QgY29uc2lkZXIgdGhhdCBwYXJ0IG9mIHRoZSBBQkksIGFzIGUu
Zy4gY29udmVydGluZyBmcm9tIGJvYXJkIGZpbGVzDQo+IHRvIERUIHdvdWxkIGNoYW5nZSB0aGUg
bmFtZS4NCj4gSW4gYWRkaXRpb24sIHVzaW5nIGlkLT5uYW1lIGJyZWFrcyBtdWx0aXBsZSBpbnN0
YW5jZXMgb2YgdGhlIHNhbWUgZGV2aWNlLg0KDQpPSywgdGhlbiBhY2NvcmRpbmcgdG8geW91IHRo
aXMgcGF0Y2ggaXMgb2sgWzFdPw0KDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QvbGludXgtcmVuZXNhcy1zb2MvcGF0Y2gvMjAyMzA4MDcxNzI1NDguMjU4MjQ3LTItYmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20vDQoNCkNoZWVycywNCkJpanUNCg==
