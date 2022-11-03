Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1912617C43
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Nov 2022 13:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbiKCMN6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Nov 2022 08:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbiKCMN5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Nov 2022 08:13:57 -0400
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (mail-fr2deu01on2105.outbound.protection.outlook.com [40.107.135.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B2C6103B;
        Thu,  3 Nov 2022 05:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cmrj8AvS0e7ULtAjV2GS7nE60RJkNGsV3ooQmn0zz7I+EpacOVpZleZBWEfqCSeIu8R4hu6Tls2bPkIfMsTiQyC5O9qUPXDy/wLYR6ed17PHt+7CtqcVe8PFlFjXm9Z9IYcMGTNpCUOWEg95RgU16VvlHmr8UQUqoCaAJWPB3hBApxEyzv4kCWNwUWrMU6pDcsV906GP4BFXur4chy3U6PbuslQqEESBlw4g3+DZx+wYrzckD/8GO6mPhQ4zJh8vGMs0S6hPt2FSXKui/Losr2gt1RNvicAQfMOby4vvi2fuEAMWuFSnItAJDowGAjup1wevrcg1S+G6HAGiq4k1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgokyizebqORzoLoaIFEmUxVanaOwX06ALg/r4sCffI=;
 b=D9ZF8coCuD/MALBhvMzpESrA4x8LlYh6QzsOAL8lobwHqGTJI7E084IW/JVzfccRiX8VMsMQUwhriQNdVjO8adBCwL6vzuZKHaaJzXeZDontifLI+SaIjzK9i6XDvvvFTTB4tZudHjso3p9SWN/O1Abypzjdwfl//Oejeg2rPDJflRaQn44n2Ns0PJA8BqZmMd5j5n1R8hcdH5NuXZ+rsgE3pxtnMBk87hs0OnjFYBdTfzTel4kjg5AWjtLM/BzfAB2qLfaimtC4GA3OcY6x+ub78TFyJP6Xk2C23m2Nhnt0YY6NA1wN9fxrHZE6I/XH4tOsQYaeHeFzfb5O3RwYFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductor.onmicrosoft.com;
 s=selector2-rohmsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgokyizebqORzoLoaIFEmUxVanaOwX06ALg/r4sCffI=;
 b=Awcp52mQPeR6+aoQZLeVYHoavef0d8BrJF0MD1TOxUFCrQf9NpwA0FeZftI61zPJaQUKMe5tpeJNpPp8RTaHxYFPTnH48nAhw/G/1wBpNod0lcc8y9/xS1sy1RLlD/gDD0JSEyrO+BdCww5YDYjkZK9+eGSBLrXl3UkZAG1Sun8=
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:59::10)
 by FR0P281MB1531.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:6e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 12:13:50 +0000
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::33b1:3599:eb56:8fd2]) by BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::33b1:3599:eb56:8fd2%4]) with mapi id 15.20.5791.020; Thu, 3 Nov 2022
 12:13:50 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "satish.nagireddy@getcruise.com" <satish.nagireddy@getcruise.com>
Subject: Re: [PATCH v4 3/8] dt-bindings: media: add bindings for TI DS90UB960
Thread-Topic: [PATCH v4 3/8] dt-bindings: media: add bindings for TI DS90UB960
Thread-Index: AQHY7fTOttfBC2Q2XkKifJZf/uHjg64r5JMAgAE0hICAAAZ0gA==
Date:   Thu, 3 Nov 2022 12:13:50 +0000
Message-ID: <fb9e9d5e-9c8b-1ce2-5723-efa498d1ba93@fi.rohmeurope.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
 <20221101132032.1542416-4-tomi.valkeinen@ideasonboard.com>
 <20221102172630.GA4140587-robh@kernel.org>
 <6c254d5f-9fa1-b06a-4edb-7e58e4b33101@ideasonboard.com>
In-Reply-To: <6c254d5f-9fa1-b06a-4edb-7e58e4b33101@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BEZP281MB2454:EE_|FR0P281MB1531:EE_
x-ms-office365-filtering-correlation-id: 4e7e68fb-c067-4e0f-16a5-08dabd94ddf1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DN+sAf5dI/dxlGp7A9EjuN/78pRuy1GSJUjyfrkS9CwC3osKlfcLAW7APejC7kWzvolp2o51TGhDfpm3Wp81JzG8lqdeLjBTKxUeXDLVeUsCUOrvm/zuvsxxY7dYqNUuWvl2gn/fFyHKwJvDa4HvfdOJFwRnW+L1KfXIBYlKDYEDlnJEdiVmGZYuXXiXutH6zVG0MCDUVnbKGVq6CgxVAZtbe1OiQ8GPp0m9eO2M7mg2ZadVIhjOprO88YO9lU6SJOMXJXZhIyXgJTJ2IB57t023GDA2Kax5AdIxWMvoldvmdlI8Kw44WrJWkyWHTzzFYkYlgU4NZdsynCwXN+WYsrSmc1SrdHOjF4SjGnUyOnvkCxMEH/aB06oiHW1rykAqGMbDsouWQPQrXMaNxdbeBIZeE/wO+QFoaZVQ1X/l0liv+BNLOCx8kuHVcJG0699dS8HobItJwJuFUXr0XY36CZqZBdAKAcu95qciek9egX4d+l4Ol7zi8dORdP6YWAH3Sx+ICo2kxwjepPbzRR68xZw60dTecxohHeP02Y2TU5Q67cSn7R8tl1ZMISk1e7SL8xGcoMqbjYxiap0hA6K8lqRywhnxaLhXwlO7TLBIFibn5BRFN/ksTlXY1uPzh4TXgUj6Lux8P1s455zynVPWIQATEIWyEPqMoXc7hF6BtVWqptdGy7LBIuTmaKrF+cqjUxe0PNn4U6jPCaRjhn7I/vnz31zCjnlKKBEhrgt0CKKajL8NXBAHC4MZq6iVrkmf1Sd8l0XplHmX1LcJvpy5u9MBqxMd9VofX48txFqvo+7MEUt/VFYJwx/P5eD2nghZJcF9/51/UX0sgfLGYcaqyA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(39850400004)(376002)(346002)(451199015)(41300700001)(316002)(2906002)(8936002)(91956017)(66946007)(66556008)(66446008)(66476007)(64756008)(8676002)(186003)(76116006)(6486002)(7416002)(478600001)(110136005)(54906003)(71200400001)(4326008)(38070700005)(5660300002)(86362001)(31696002)(53546011)(122000001)(6506007)(6512007)(38100700002)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUF0UVN3N2Nnd3h0T1U1K0tXYVByU1hyeEZ3WFVid3JQRGw0SEw0YnJ1dDJG?=
 =?utf-8?B?NnVrQ1FPS1RYWUJaV08zS1NnMWNQREFiK0ttcms4TENUNDB2WGpsNk81VGhm?=
 =?utf-8?B?bVZHRDRHejA4aThtdFNXT2IzNWhpNVp0eFJRSTNGVitpYnVSQ0lHemQ1K0Er?=
 =?utf-8?B?WE9SVS9PYWwraE91WUVLcGE1NW1iVkN1cWNxamQyTTl1Q2kvSXptZ0plL050?=
 =?utf-8?B?b2NXVXgxVDNLbWdWRUdmVFJGZjVnNmZNOW1kNzd1alNCY1d6YWY1TlNqRndO?=
 =?utf-8?B?YUkxN09zaHlDblQxc2pGcWJKTHJNaEhCQWIxTmZiQUVqREcybkJlcE9aOHdK?=
 =?utf-8?B?QjlUQkRRSlhEU3lxblZJTGI5Q2RYQ05MYTlRRDNLMTRUS0tIc0VqQ2JSVGJQ?=
 =?utf-8?B?YzBhcW5TY1M5ZWdOOTBkV3hnZnVTM1dReFFReDVoOGluVStKUG9RTnhicGta?=
 =?utf-8?B?MGdQMmU2ZUhaZHQ0ZDZuOUxiZDhwdG9qOWMzeVhyNmVuZm1JaGhJRlpzL2tn?=
 =?utf-8?B?WkJZRFVORE44SXk4SEJzbFIzN2c0SG56UHJNb2ZtOFdQUnRMTlBHVXZSb0dW?=
 =?utf-8?B?WnRONENMMmR2THEzVmxEYi9EcXpna1JiTHp6czgxOGZHNmVGU1BlVE9hUWI4?=
 =?utf-8?B?c1VJZWdGWVAxVXZqcStENmNRQU1uNHRUQ0lFWGErUmR3TTJEUmtMUDk2eld0?=
 =?utf-8?B?MlNrZFNmZ2JlNFFpM2ViY3hwS2dTRXBtbTNqcFY1WVV4WWZYQkNjRUpzaGxs?=
 =?utf-8?B?M3IrSEowciswSUc3Rmd4WFFMRVlkVG5uM213azFmZm5QVG8xVFNweGs5MFQ2?=
 =?utf-8?B?SElFNTlYd3BqbVJNOXZlKzBoMGhaNWd6emtlVThrRFgxMFg5SUJIR3hra3hM?=
 =?utf-8?B?dS96UUpiODZpN1ArdWZyWCtHS0FJWEtjUDNrTytGaENpQnhGbDJ5dE9yYlA0?=
 =?utf-8?B?ZmlyU2wzUERYZjA2eDlNYjlKKy9tOGk3dTNDUjl4TTJOaVNiOGJVN3FRb2h4?=
 =?utf-8?B?YzlyRzU2bDd2bzBQTXFySk9paE8yQkZHMG5oOGdQL205SUhqOXZFcjErZGpB?=
 =?utf-8?B?SXcxZjB3MkVQY0FvN1R5Wm9BcUY3aXhCWWNBWTNFd2l3enlrM2RJdVJ4b01s?=
 =?utf-8?B?MlB0eFM0YWhDSDZxVEdiaHdLTmFMSGhFdDVYZjZwRE1tb1pFSlhJc0JNcEZv?=
 =?utf-8?B?Z1JsWXhCNGx2OTVkUzhNMHVXeVJmQk42V2tEMm1mZDNMV1BSSkVmMDlUWFZs?=
 =?utf-8?B?YjNkWUhzTEE2d1NQa2dwdTlGeUd0QWMzUEZ1UitLSkVYRS9PQmpsTFl2K3da?=
 =?utf-8?B?Q01RcGN4MGw1K2w2R09wa3RnVUFiWTkxdUFrZno1WGlwL0lJOHFNMVVjMUVq?=
 =?utf-8?B?NWNJMloxVDEzSHoyRjFqbTRBZmJOTU45YjNyUlN5WGhwOTRlMmJlYm1RY1FV?=
 =?utf-8?B?N1hjQms0MHYzYW1uZ0hVdm5ZYlBlLy9XSlBDQlhqN0F0NnQ5bWErcjlmMnlu?=
 =?utf-8?B?dk9qTGpWTDc0S1Z5TjVYQVlhZzY3LzBnb1U1cTlDRXE2alhOcmRTQWlHWlpL?=
 =?utf-8?B?L3Z4cHZzR1hnQ3IzS1Z2TWFQVXhPdms1ZWJZd01OU1M4aVV6UFJJUzdvblhX?=
 =?utf-8?B?L0dFRWRkWkZETWplTEJOWVhDRHZrZlBtNHpwbk9adkMwY2hqNkc2S3RqM3Fy?=
 =?utf-8?B?VXVRTHd6NTBGT25kWXA0UGx1WDRuSkpHaWozUVBJVS9VZktqREVYV2dWY055?=
 =?utf-8?B?S3FTTXMyRzgxVHhJZG1Xa0Z5T2ZxZjc5Tlg3alQzVXU4cldSU3l1c1JFRVdx?=
 =?utf-8?B?RXNXMFZEVFppWkVOZWRqZldBbS9wVGxzRWt6ZEkxYVpjZDNzbzN6aFdRaDlL?=
 =?utf-8?B?ckxCaHBNdVJGUE03QWM1VmRwMDZpWHo5SjAzTEJ5Z1ZMN2JHOWlWM3lpNEJX?=
 =?utf-8?B?NWkwbHhUb2ZINW83TWVJSGVkTkJUeWJWa0pYSDY5ZUlRVW5oVXpZZW9VWjdH?=
 =?utf-8?B?UGxtYjkvNGdERGtKYStPcmRVSWhYSElSQ284bHBNUjNKVXRhNlZ5NkYzWGhM?=
 =?utf-8?B?ZkNCSDkrT2QvQmRoNGF6QjlOemZZUk04OTVDOHVMMzRHOVR6TXFMV1VUdEl3?=
 =?utf-8?B?SW9nNUNyTjNtcm56eGN5azdTK0RVanhyTHhxNVdVWWJWZzdPUFA3NDFtcnRp?=
 =?utf-8?Q?E3zdNN6fPCIRrULC8dTre7I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <067EE51141C16B41B6B0673DE218D299@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7e68fb-c067-4e0f-16a5-08dabd94ddf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 12:13:50.2408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b24d4f96-5b40-44b1-ac2e-2ed7fdbde1c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7EGN0VGws7yM5Utps4g1D4r/QGd91+T2PAHAzWVgGWyJVMaesCnhMnJTgHHUrYq4sqCj+tQUEcME0UKqe7+InJ+1zbl3Ce4gBXRRWSpiXzjbUBh0FJzv2YItLboDhoeC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB1531
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTEvMy8yMiAxMzo1MCwgVG9taSBWYWxrZWluZW4gd3JvdGU6DQo+IEhpIFJvYiwNCj4gDQo+
IE9uIDAyLzExLzIwMjIgMTk6MjYsIFJvYiBIZXJyaW5nIHdyb3RlOg0KPj4gT24gVHVlLCBOb3Yg
MDEsIDIwMjIgYXQgMDM6MjA6MjdQTSArMDIwMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6DQo+Pj4g
Kw0KPj4+ICvCoCBpMmMtYWxpYXMtcG9vbDoNCj4+DQo+PiBTb21ldGhpbmcgY29tbW9uIG9yIGNv
dWxkIGJlPyBJZiBub3QsIHRoZW4gbmVlZHMgYSB2ZW5kb3IgcHJlZml4Lg0KPiANCj4gSSdsbCBo
YXZlIHRvIHRoaW5rIGFib3V0IHRoaXMuIEl0IGlzIHJlbGF0ZWQgdG8gdGhlIGkyYy1hdHIsIHNv
IEkgdGhpbmsgDQo+IGl0IG1pZ2h0IGJlIGEgY29tbW9uIHRoaW5nLg0KDQpJJ2Qgc2F5IHRoaXMg
c2hvdWxkIGJlIGNvbW1vbi4gV2hlcmUgdGhlIGkyYy1hdHIgcHJvcGVydGllcyBzaG91bGQgbGl2
ZSANCmlzIGFub3RoZXIgcXVlc3Rpb24gdGhvdWdoLiBJZiB0aGUgSTJDLWF0ciBzdGF5cyBhcyBh
IGdlbmVyaWNseSB1c2FibGUgDQpjb21wb25lbnQgLSB0aGVuIHRoZXNlIGJpbmRpbmdzIHNob3Vs
ZCBiZSBpbiBhIGZpbGUgdGhhdCBjYW4gYmUgDQpyZWZlcmVuY2VkIGJ5IG90aGVyIEkyQy1hdHIg
dXNlcnMgKGxpa2UgdGhlIFVCOTYwIGhlcmUpLg0KDQovLyBzbmlwDQoNCj4+PiArDQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoCBpMmMtYWxpYXM6DQo+Pg0KPj4gVmVuZG9yIHByZWZpeC4NCj4+DQo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVzY3JpcHRpb246IHwNCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgVGhlIGkyYyBhZGRyZXNzIHVzZWQgZm9yIHRoZSBzZXJpYWxpemVy
LiBUcmFuc2FjdGlvbnMgDQo+Pj4gdG8gdGhpcw0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBhZGRyZXNzIG9uIHRoZSBpMmMgYnVzIHdoZXJlIHRoZSBkZXNlcmlhbGl6ZXIgcmVzaWRl
cyBhcmUNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yd2FyZGVkIHRvIHRoZSBz
ZXJpYWxpemVyLg0KPj4+ICsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIHJ4LW1vZGU6DQo+Pg0K
Pj4gVmVuZG9yIHByZWZpeC4gQW5kIHNvIG9uLi4uID4NCj4gWWVzLCBJIHRvdGFsbHkgbWlzc2Vk
IHRoZXNlLg0KDQoNCkkgdGhpbmsgdGhlIGkyYy1hbGlhcyBtaWdodCBuZWVkIHRvIGJlIGNvbW1v
biBhcyB3ZWxsPw0KDQpCZXN0IFJlZ2FyZHMNCgktLSBNYXR0aSBWYWl0dGluZW4NCg0KLS0gDQpN
YXR0aSBWYWl0dGluZW4NCkxpbnV4IGtlcm5lbCBkZXZlbG9wZXIgYXQgUk9ITSBTZW1pY29uZHVj
dG9ycw0KT3VsdSBGaW5sYW5kDQoNCn5+IFdoZW4gdGhpbmdzIGdvIHV0dGVybHkgd3Jvbmcgdmlt
IHVzZXJzIGNhbiBhbHdheXMgdHlwZSA6aGVscCEgfn4NCg0K
