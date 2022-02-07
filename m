Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2FC94AC24F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 16:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbiBGPCd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 10:02:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237100AbiBGOic (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 09:38:32 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A31C0401C8;
        Mon,  7 Feb 2022 06:38:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E15u+a+ER22ZIJ3Ym6zMks0ZK7c8edObexMp7Vy2C8/jVG0xj9j5z5soo6xb9JtbMmzYSnxq7+FlEuXGfpqUse97oFFyFGK+efYlml6OI7ChwnpKfkthgPp8xQPHbP9cF/XccIWi4mgnVKB7jBbl7ZLmRHEqAqhW347KmXPzGqouN9CRgtANqbbgZ7gopYXlRdNBEJQhbvzxCq+7LBkZL5nZrZltpx93bcTViEqeCyyKBj7vsGDY7oVOX38sP4rY4RmLQiC7eJWN9wBSMKZ/CCxJQip40Hx5r6ZOj5w/zZJ0FgbZf1gDp7vLufxW6QeN8QoF7U+U9QOpiPbflH4icQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCSDeBtwAWEV+5b/TWdNSJ1dzQ23zUyvclvbWFum49o=;
 b=MSn1SBKFnJsu5007p3x4Z4/l6sr/FSyHuPhxBi/yeYXTuK9yZ9yK5sqoScjj3Cxtxi/g5QSU9JuKL7aZb4LTzqOAr6q5PVbisvRRjWANW16S52BA1pkaPvYO1QpCuu3a6OfoE9/BqI3Pa1D14L9gxMxUCUmtz6C/hLBUBYhEUO1rz0RM6ogmgZetmtjxDUWxGRQOsxI5J6/qXx4OwpUf9DMm25SHn93G2KboeYiHfliTGSqrULwgJas215tuSZmdUlAQqfE/ej0yfAItKKm4dGz0zr283AFkLYsg9X1VmCDOKaUM0PxDgZ1z3qsDAA/xLX3Cl9XoBnQ7wsBEpc7T8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCSDeBtwAWEV+5b/TWdNSJ1dzQ23zUyvclvbWFum49o=;
 b=p7tGCLYuCglWuij0wY8KWIsNm0DvrDqjYf6Rl61L2uFxrYlOUKNcCzT0Li/PWEF4bb1tkRSDnTaXjAFy/rli1zBrrQN1+3h4nIcVbjE5NLGFSAgty6ghdyZCfSSQMj5oOSCgYiNXrXtBIS2GAdoIKTFzoDLrhSPMqL00fAA05TE=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2809.eurprd03.prod.outlook.com (2603:10a6:3:f1::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.18; Mon, 7 Feb 2022 14:38:23 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::833:be72:6b04:dca9]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::833:be72:6b04:dca9%7]) with mapi id 15.20.4951.017; Mon, 7 Feb 2022
 14:38:23 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [RFCv3 0/6] TI camera serdes and I2C address translation (Was:
 [RFCv3 0/6] Hi,)
Thread-Topic: [RFCv3 0/6] TI camera serdes and I2C address translation (Was:
 [RFCv3 0/6] Hi,)
Thread-Index: AQHYHBs2RD5e2C8Zu0SeCTUQRW2AkqyIEuOAgAANHYCAAAh/AA==
Date:   Mon, 7 Feb 2022 14:38:22 +0000
Message-ID: <608d23fc-eef7-c0dc-de5b-53b140fe2d0f@fi.rohmeurope.com>
References: <20220206115939.3091265-1-luca@lucaceresoli.net>
 <7e5af144-bd5f-cd0e-2109-49b318449a78@ideasonboard.com>
 <5aa3e282-3056-2088-9741-6d17273701b4@fi.rohmeurope.com>
 <74bacec6-35e5-346a-fb05-09ae44fc5592@lucaceresoli.net>
In-Reply-To: <74bacec6-35e5-346a-fb05-09ae44fc5592@lucaceresoli.net>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df1ae3a7-1e7a-4975-32c9-08d9ea477e36
x-ms-traffictypediagnostic: HE1PR0302MB2809:EE_
x-microsoft-antispam-prvs: <HE1PR0302MB2809076F209D170FE28F6B0EAD2C9@HE1PR0302MB2809.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JTymKtTnCnxCt5fTkgLvDB/IFTBoct0e/q312LXbuVxa8+dbFcgLEnP83YEfQQ/afl38pAobq8ULJgg50BkTEWpGpdP3cB9iYOF/VZJ5ic0eXVwpM7B/uBcDJnjJ+8RjdwP7r91ofFlOTk049x8xZJZUk/KGzUkV9BVQmb1R0lPezQF6m12+DxdE/hhkrpEaAyin9Aimq7HQsdbZ5XegEAbseDqfgCZ0CoQJhzpWWJ3zla4BBUtW6iWpxKF+olOn1mUxdJ7M+yKpvjd7ew8wo/Je0yXsRL5UcInMisiwXUUx9n1QwDJdu3hbNPpNKXdz8wANNn7mPPNWJkEPwFdt1d8KQ7qxfuUAkATOLn2a4ozypc9XAf7KYqDRpu/4cCAWRBi4gqYA6oHohR1qpO7epvRhh2kOy0P61uIX0drLthroUoNV2hAsor3TuDRyqe571enAeEi7uJu81T2GpVBr2ymHenXj9gINomCLqxB5uG/8qJ9UmvOT8l9BC4zHlD3bav9ekxrpn1lSfn49pTfGvyBrVx+TVqsYoTGY8r/P1bsDq/i5jcDQnBrLnH8R95BrsEpwxJf/7BaoCHapG6LAJAaXnPo4/MCUJjXBXcXG2OFkPVDyMrtOTX2pYJ4G6AiYfPNttxxgdP9Qt0mzOJEDzvlDwiXAo/bhIGPbMp/1IfrL0dU6eZXQg3gGmSMaoW0OKv5O9hyEqDCxy+s/IiYURsoUe6bsYZtJQHz9jKkcDPkQcHAKuzQSvAls0h+ZgUbAi1FhJTrK+HaaG+ZL0lIWgqhS+Jp2UMWHqsznhqGxCh3nP3gGvvDGAKL0HKg8tuYEFSEW00Up9MXJgtF8lSGHL3P+4WXuEmvaE2WQxPSa4QM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(186003)(31686004)(83380400001)(6512007)(53546011)(6506007)(2616005)(498600001)(66446008)(66476007)(966005)(71200400001)(4326008)(38070700005)(6486002)(8936002)(54906003)(122000001)(110136005)(5660300002)(86362001)(66946007)(38100700002)(7416002)(66556008)(76116006)(64756008)(8676002)(31696002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bG1XZnZMYnkvNUhWQ21FdXBudVdSVkEySUhRUWJQN3F3ZlJuRGZpV0hYMEZh?=
 =?utf-8?B?OERYSE1QcUFSYi9OVWpsZm1VU1FON2VQOFZaQVdPWGVSWWZzMzc1MnVTc05j?=
 =?utf-8?B?YmNzb0dJbVF4TmQzVXhNSmQzS0o4OVdiOHVpSFY2aG5aSmYwSFBGbWZNUWxx?=
 =?utf-8?B?dTZheXFYQ3RuaUhYY2V5cE1lUDRsUENMbkY3OGxRNFpNRUtjWi9TWWQvRVNW?=
 =?utf-8?B?UHBGWHpkUHRRaytaeWpOczdTMUNLM3Q0Y3VrT05wSU1WVWV1TEhJazVqUlYx?=
 =?utf-8?B?dXFwWDZoMks2UEtpLzg2SUlwUDRvcjdKejNmWmlIRHNuVkFUMDRNZG5IWVFj?=
 =?utf-8?B?dWhFcTJpTlhOZ0o3T1d5UWhGTVlzU2N3Q3hRNHR3alIrZk5qQzllVWsvVk52?=
 =?utf-8?B?RE5iY2NrSW9LRldYOU5iNnpMVXBqMXRLWGF6dmZSUExtQU92RDhJZ0pQREEz?=
 =?utf-8?B?YnpLRFVJMUlndWxOay9pZXQ2YWdqcEZkZVBMZCtDZnE0L3pROFI5aTRBSG13?=
 =?utf-8?B?dzI3cllOMW90b2FXNmRVaUVtRDYrQ3RqeTg3TkV0R2d0TUNGdS9oS3Vad29V?=
 =?utf-8?B?c2dYTnhQdjI1UEx6MndpdlVSdy9tUnpkbWRWL1VVb2JIRi94YXhYYktxV1Rn?=
 =?utf-8?B?b2VQQ0dXczhWU3FZdDk3ajM4bzRjT05WMHQyTnN0UEdaV05GWHJiMkFNeTFM?=
 =?utf-8?B?RXZzcFhUYVpEZ0RMMm9tWVJRb2VISS9TWHVnMGFZOVZRN25Jelg2aldaNGli?=
 =?utf-8?B?SFpDN2llT1VndVNQSnQrcTZJblZDZFZ1YzFBUGRUUlIxU2I2YlAvSXAwamFF?=
 =?utf-8?B?ZlJHZGc4KzIwZzVUNDNtcVZBWVdaN2hFQXQwQU5uTXRWTVZlZUZzNUY2OHdV?=
 =?utf-8?B?U1VmanMyNGhYZkxYajBNakRtd0lMbFBmcEpxUWsyOE4zT045ejlqK1Q3VU1X?=
 =?utf-8?B?TlcyT0RTdVFZbG1xcWYreE80QmhUWm1HL3ZxYVF5SVZyUTJXWW1pU3MxRnVj?=
 =?utf-8?B?OUxwK0xZdU55K3E3VDZvWFJzTk1DdkcxWUZ0TmU4OVVQOFpudEZWQmVBT1dM?=
 =?utf-8?B?S3dxZ3daYmRkNTlYU3huWm9nVUUyTDVlVWpUZkVhMTZYcTZzK0ZhSFZJd05S?=
 =?utf-8?B?TnUxelZrcU5GbGk2eUt3bWNzalk3QVgydnR3RHBIeEQyaTRrcWpkaXhIKzFB?=
 =?utf-8?B?TXdDTmtuL2E5VjJjUGFvOUhIVy9KN3QvaVJBZUJFUXUwRGpMSkgyd3oxZFRm?=
 =?utf-8?B?U1B2Y0J0UnNqRDhyTkN2eVR5RU1SeXp6amNkcGI0dm54Q0tCaUJpeGxFUS90?=
 =?utf-8?B?TDd2N3VHMGZJd09PVDMweEFXV0NQZmRtbWtYcU5DWUpQbWNMSGV1QW92Qmpv?=
 =?utf-8?B?STRMZmtsMWFHUWcwR2VYalo5UlZpVWF6cU5STXVUUnN6R1grazA2SUJTbCto?=
 =?utf-8?B?REhVWTJNNVlqenNIdVkzVnN6Mk82c0lSM0hMRGZtV0EvV0E4QnU3TmY5c0xt?=
 =?utf-8?B?a25oVnhqU2dleGd4K0NQZkNPak51MjJUL21zZjQwVER1aVZuTXIyd2NQSG40?=
 =?utf-8?B?QmxlZGtLYnZER2IzdHhxWHovUnhwcEg3bzVzaXhWSzRuSGxrTUM1WUNvbk1k?=
 =?utf-8?B?UDRwTUxwYjRGd1NQVlJ1RUNQT2hISjU5Wk1uY3B1Z3VQVm9qK0RGZ1lneW9y?=
 =?utf-8?B?MDYzbVdWMjlZR3BjankzdUhrbWtva3d6dCt6SEprOUdCdnVSd0VTd2VZcWFt?=
 =?utf-8?B?WWpQNWdYN1BBT0tuVXFmd3BacXJzd2x3OEZWcXlCRTRkYUw5bm1DNStUWHFt?=
 =?utf-8?B?bllLeGpVeEc1bjREMXUrMFBsenFaeTJkQ3N3bGlvNDJnVm9sdGt3RnlwcFNt?=
 =?utf-8?B?NUMwZk1ZOUFuZmVUYUN0VkFJYXhxT24rZ2F6dnlWV2pVOUhaTHdCcmF2UXJ0?=
 =?utf-8?B?KzhwMjFRa0ZSbmE5cWgzMzR6am9RK3BtQlpITVFJbUx2WVhnL01QRGg2Lzhm?=
 =?utf-8?B?UHVvWVdzQThXREtxd0F2UzNvWUNlUDZTSDBLNmtKQTM1eWEzTGlFS3dGbHdx?=
 =?utf-8?B?WG5kWGM5NnYwbC9ROEVOeHIyczBMS1lPeHI5UjNpaW0vSUcvdmhuOXZuUFZF?=
 =?utf-8?B?TGpwaFdhd1BuSGZJb3NvVkgvQ0pIdWVNUVMzR3pLU2tDMVYvaDVWQlVFUDFJ?=
 =?utf-8?B?KzlYNE41dGxTbjZwbzFxeXFmUGM3TFo0dWVHYTZYZTV5RE4xNlk2d3R1eU5B?=
 =?utf-8?B?R3QwZytQMDlINTBNL295QnA4bHFySTI2bXFwcUN5MEk5MGU5WWNWeEZhS050?=
 =?utf-8?Q?Q3sO59vpT1l+FcFCdf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51E44A1ECA30C7419E9C873B50A10C85@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df1ae3a7-1e7a-4975-32c9-08d9ea477e36
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 14:38:22.9600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cAGs+waySHZd0Usm+FPXXD2vFneVxE6Q8EfZ4ha+yJT1eq9Foj+XYXX7QyOLVeOImWklgJEfI5mqizTL5/YGfBOgjtjeY3fmS8q8ZPbiAU9eEqjvxXDRmZfPum9I9BUF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2809
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgYWdhaW4gTHVjYSwNCg0KT24gMi83LzIyIDE2OjA3LCBMdWNhIENlcmVzb2xpIHdyb3RlOg0K
PiBIaSBNYXR0aSwNCj4gDQo+IE9uIDA3LzAyLzIyIDE0OjIxLCBWYWl0dGluZW4sIE1hdHRpIHdy
b3RlOg0KPj4gSGkgZGVlIEhvIHBlZXBzLA0KPj4NCj4+IE9uIDIvNy8yMiAxNDowNiwgVG9taSBW
YWxrZWluZW4gd3JvdGU6DQo+Pj4gSGkgTHVjYSwNCj4+Pg0KPj4+IE9uIDA2LzAyLzIwMjIgMTM6
NTksIEx1Y2EgQ2VyZXNvbGkgd3JvdGU6DQo+Pj4+IHRoaXMgUkZDdjMsIGNvZGVuYW1lICJGT1NE
RU0gRnJpZXMiLCBvZiBSRkMgcGF0Y2hlcyB0byBzdXBwb3J0IHRoZSBUSQ0KPj4+PiBEUzkwVUI5
eHggc2VyaWFsaXplci9kZXNlcmlhbGl6ZXIgY2hpcHNldHMgd2l0aCBJMkMgYWRkcmVzcyB0cmFu
c2xhdGlvbi4NCj4+DQo+Pg0KPj4gSSBhbSBub3Qgc3VyZSBpZiBJIGFtIHBva2luZyBpbiB0aGUg
bmVzdCBvZiB0aGUgd2FzcHMgLSBidXQgdGhlcmUncyBvbmUNCj4+IG1ham9yIGRpZmZlcmVuY2Ug
d2l0aCB0aGUgd29yayBJJ3ZlIGRvbmUgYW5kIHdpdGggVG9uaSdzIC8gTHVjYSdzIHdvcmsuDQo+
IA0KPiBZb3UgYXJlLiA7KQ0KPiANCj4+IFRoZSBUSSBERVMgZHJpdmVycyAobGlrZSB1Yjk2MCBk
cml2ZXIpIHBhY2tzIHByZXR0eSBtdWNoIGV2ZXJ5dGhpbmcNCj4+IHVuZGVyIHNpbmdsZSBkcml2
ZXIgYXQgbWVkaWEvaTJjIC0gd2hpY2ggKGluIG15IG9waW5pb24pIG1ha2VzIHRoZQ0KPj4gZHJp
dmVyIHByZXR0eSBsYXJnZSBvbmUuDQo+Pg0KPj4gTXkgYXBwcm9hY2ggaXMvd2FzIHRvIHV0aWxp
emUgTUZEIC0gYW5kIHByZXBhcmUgdGhlIHJlZ21hcCArIElSUXMgaW4gdGhlDQo+PiBNRkQgKGFz
IGlzIHByZXR0eSB1c3VhbCkgLSBhbmQgcGFyc2UgdGhhdCBtdWNoIG9mIHRoZSBkZXZpY2UtdHJl
ZSB0aGF0DQo+PiB3ZSBzZWUgaG93IG1hbnkgU0VSIGRldmljZXMgYXJlIHRoZXJlIC0gYW5kIHRo
YXQgSSBnZXQgdGhlIG5vbiBJMkMNCj4+IHJlbGF0ZWQgREVTPD0+U0VSIGxpbmsgcGFyYW1ldGVy
cyBzZXQuIEFmdGVyIHRoYXQgSSBkbyBraWNrIGFsaXZlIHRoZQ0KPj4gc2VwYXJhdGUgTUZEIGNl
bGxzIGZvciBBVFIsIHBpbmN0cmwvR1BJTyBhbmQgbWVkaWEuDQo+Pg0KPj4gVGhlIEFUUiBkcml2
ZXIgaW5zdGFudGlhdGVzIHRoZSBTRVIgSTJDIGRldmljZXMgbGlrZSBUb25pJ3MgdWI5NjAgZG9l
cy4NCj4+IFRoZSBTRVIgY29tcGF0aWJsZSBpcyBvbmNlIGFnYWluIG1hdGNoZWQgaW4gTUZEIChm
b3IgU0VSKSAtIHdoaWNoIGFnYWluDQo+PiBwcm92aWRlcyByZWdtYXAgZm9yIFNFUiwgZG9lcyBp
bml0aWFsIEkyQyB3cml0ZXMgc28gU0VSIHN0YXJ0cw0KPj4gcmVzcG9uZGluZyB0byBJMkMgcmVh
ZHMgYW5kIHRoZW4ga2lja3MgY2VsbHMgZm9yIG1lZGlhIGFuZCBwaW5jdHJsL2dwaW8uDQo+Pg0K
Pj4gSSBiZWxpZXZlIHNwbGl0dGluZyB0aGUgZnVuY3Rpb25hbGl0eSB0byBNRkQgc3ViZGV2aWNl
cyBtYWtlcyBkcml2ZXJzDQo+PiBzbGlnaHRseSBjbGVhcmVyLiBZb3UnbGwgZ2V0IEdQSU9zL3Bp
bmN0cmwgdW5kZXIgcGluY3RybCBhcyB1c3VhbCwNCj4+IHJlZ21hcHMvSVJRLWNoaXBzIHVuZGVy
IE1GRCBhbmQgb25seSBtZWRpYS92NGwyIHJlbGF0ZWQgcGFydHMgdW5kZXIgbWVkaWEuDQo+IA0K
PiBUaGVyZSBoYXMgYmVlbiBxdWl0ZSBhIGZpZXJ5IGRpc2N1c3Npb24gYWJvdXQgdGhpcyBpbiB0
aGUgcGFzdCwgeW91IGNhbg0KPiBncmFiIHNvbWUgcG9wY29ybiBhbmQgcmVhZA0KPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDE4MTAwODIxMTIwNS4yOTAwLTEtdnpAbWxl
aWEuY29tL1QvI205YjAxYWY4MTY2NWFjOTU2YWYzYzZkNTc4MTAyMzk0MjBjM2Y4Y2VlDQo+IA0K
PiBUTDtEUjogdGhlcmUgaGF2ZSBiZWVuIHN0cm9uZyBvcHBvc2l0aW9uIHRoZSB0aGUgTUZEIGlk
ZWEuDQoNCkhtLiBJIG1heSBiZSBtaXNzaW5nIHNvbWV0aGluZyBidXQgSSBkaWRuJ3Qgc2VlIG9w
cG9zaXRpb24gdG8gdXNpbmcgTUZEIA0Kb3Igc3BsaXR0aW5nIHRoZSBkcml2ZXJzLiBJIGRvIHNl
ZSBvcHBvc2l0aW9uIHRvIGFkZGluZyBfZnVuY3Rpb25hbGl0eV8gDQppbiBNRkQuIElmIEkgcmVh
ZCB0aGlzIGNvcnJlY3RseSwgTGVlIGRpZCBvcHBvc2UgYWRkaW5nIHRoZSBJMkMgc3R1ZmYsIA0K
c3lzZnMgYXR0cmlidXRlcyBldGMgaW4gTUZELiBRdW90aW5nIGhpcyByZXBseToNCg0KIlRoaXMg
ZHJpdmVyIGRvZXMgdG9vIG11Y2ggcmVhbCB3b3JrICgnc3R1ZmYnKSB0byBiZSBhbiBNRkQgZHJp
dmVyLg0KTUZEIGRyaXZlcnMgc2hvdWxkIG5vdCBuZWVkIHRvIGNhcmUgb2Y7IGxpbmtzLCBnYXRl
cywgbW9kZXMsIHBpeGVscywNCmZyZXF1ZW5jaWVzIG1hcHMgb3IgcHJvcGVydGllcy4gIE5vciBz
aG91bGQgdGhleSBjb250YWluIGVsYWJvcmF0ZQ0Kc3lzZnMgc3RydWN0dXJlcyB0byBjb250cm9s
IHRoZSBhZm9yZW1lbnRpb25lZCAnc3R1ZmYnLg0KDQpHcmFudGVkLCB0aGVyZSBtYXkgYmUgc29t
ZSBjb2RlIGluIHRoZXJlIHdoaWNoIGNvdWxkIGJlIGFwcHJvcHJpYXRlDQpmb3IgYW4gTUZEIGRy
aXZlci4gIEhvd2V2ZXIgbW9zdCBvZiBpdCBuZWVkcyBtb3Zpbmcgb3V0IGludG8gYQ0KZnVuY3Rp
b24gZHJpdmVyIChvciB0d28pLiINCg0KQW5kIEkgdGVuZCB0byBhZ3JlZSB3aXRoIExlZSBoZXJl
LiBJIHdvdWxkIG5vdCBwdXQgSTJDIGJyaWRnZSBzdHVmZiBvciANCnN5c2ZzIGF0dHJpYnV0ZXMg
aW4gTUZELiBCdXQgSSB0aGluayBpdCBkb2VzIG5vdCBtZWFuIFNFUkRFU2VzIHNob3VsZCANCm5v
dCB1c2UgTUZEIHdoZW4gdGhleSBjbGVhcmx5IGNvbnRhaW4gbW9yZSBJUCBibG9ja3MgdGhhbiB0
aGUgDQp2aWRlby9tZWRpYSBvbmVzIDopIEkgYW0gY29uZmlkZW50IExlZSBhbmQgb3RoZXJzIG1p
Z2h0IGJlIG11Y2ggbW9yZSANCndlbGNvbWluZyBmb3IgZHJpdmVyIHdoaWNoIHNpbXBseSBjb25m
aWd1cmVzIHJlZ21hcCBhbmQga2lja3Mgc3ViZHJpdmVyIA0KZm9yIGRvaW5nIHRoZSBBVFIgLyBJ
MkMgc3R1ZmYuDQoNCkkgZGlkIGFkZCBtaW5pbWFsIG1hbmRhdG9yeSByZWdpc3RlciBpbml0aWFs
aXphdGlvbnMgaW4gb3JkZXIgdG8gYXZvaWQgDQpzeW5jaHJvbml6aW5nIHRoZSBzdWItZGV2aWNl
cyAtIGJ1dCBJIGhvcGUgdGhhdCB3b3VsZCBiZSB0b28gbXVjaC4gDQooU3luY2hyb25pemluZyBz
dWItZGV2aWNlcyB0byB3aGVuIHRoZSBJMkMgcmVhZHMgb3ZlciB0aGUgbGluayBiZWNvbWVzIA0K
YXZhaWxhYmxlLikNCg0KV2hhdCBjb21lcyB0byByZWdtYXAvcmVnbWFwIElSUSBpbml0aWFsaXph
dGlvbiBpbiBNRkQgLSB0aGF0J3Mgbm90IA0KZXhjZXB0aW9uYWwuIEkgdGhpbmsgaXQncyBxdWl0
ZSBzdGFuZGFyZCBmb3IgTUZEIHRvIHByZXBhcmUgSVJRcy9yZWdtYXBzIA0Kd2hlbiBtYW55IHN1
Yi1kZXZpY2VzIHVzZSB0aGVzZSByZXNvdXJjZXMuDQoNCj4gSSBwZXJzb25hbGx5IGRvbid0IGhh
dmUgYSBzdXBlciBzdHJvbmcgb3BpbmlvbjogSSB3cm90ZSB0aGlzIGFzIGENCj4gbW9ub2xpdGhp
YyBkcml2ZXIgYmVjYXVzZSBpdCBsb29rZWQgbGlrZSB0aGUgbW9zdCBuYXR1cmFsIGltcGxlbWVu
dGF0aW9uDQo+IGFuZCBmb3VuZCBpdCB3YXMgd29ya2luZyBmaW5lIGZvciBtZSwgSSBuZXZlciBy
ZWFsbHkgZXhwbG9yZWQgdGhlIE1GRCBpZGVhLg0KDQpObyBwcm9ibGVtLiBJIGFtIGRlZmluaXRl
bHkgdHJ5aW5nIHRvIHRlbGwgeW91IGhvdyB0aGVzZSBUSSBkcml2ZXJzIG11c3QgDQpiZSBkb25l
LiBFdmVuIEkgZG9uJ3QgaGF2ZSB0aGUgZ3V0cyB0byBkbyB0aGF0IDtEDQoNCkkgYW0gc2ltcGx5
IHNheWluZyB0aGF0IHRoZSBNRkQgYXBwcm9hY2ggY291bGQgYmUgdXNlZC4gSXQgZG9lcyBoYXZl
IA0KY2VydGFpbiBtZXJpdHMgaWYgd2UgbWFuYWdlIHRvIGtlZXAgdGhlIE1GRCBsYXllciB0aGlu
IGVub3VnaC4NCg0KPj4gQW55d2F5cyAtIEkgb3BlbmVkIHRoZSBtYWlsIGNsaWVudCB0byBqdXN0
IHNheSB0aGF0IHRoZSBBVFIgaGFzIHdvcmtlZA0KPj4gbmljZWx5IGZvciBtZSBhbmQgc2VlbXMg
cHJldHR5IHN0YWJsZSAtIHNvIHRvIG1lIGl0IHNvdW5kcyBsaWtlIGEgZ29vZg0KPj4gaWRlYSB0
byBnZXQgQVRSIHJldmlld2VkL21lcmdlZCBldmVuIGJlZm9yZSB0aGUgZHJpdmVycyBoYXZlIGJl
ZW4gZmluYWxpemVkLg0KPiANCj4gU291bmRzIGxpa2UgYS4uLiB3aGF0Li4uPyBBICJnb29kIGlk
ZWEiPyBPciBhICJnb29meSBpZGVhIj8gOi1EDQoNCkxldCBtZSByZXBocmFzZS4gSXQncyBncmVh
ZiBpZGVhIDspDQoNCihJIHJlYWxseSBtZWFudCBhICJnb29kIGlkZWEiIDpdKQ0KDQpCZXN0IFJl
Z2FyZHMNCgktLSBNYXR0aSBWYWl0dGluZW4NCg0KLS0gDQpUaGUgTGludXggS2VybmVsIGd1eSBh
dCBST0hNIFNlbWljb25kdWN0b3JzDQoNCk1hdHRpIFZhaXR0aW5lbiwgTGludXggZGV2aWNlIGRy
aXZlcnMNClJPSE0gU2VtaWNvbmR1Y3RvcnMsIEZpbmxhbmQgU1dEQw0KS2l2aWhhcmp1bmxlbmtr
aSAxRQ0KOTAyMjAgT1VMVQ0KRklOTEFORA0KDQp+fiB0aGlzIHllYXIgaXMgdGhlIHllYXIgb2Yg
YSBzaWduYXR1cmUgd3JpdGVycyBibG9jayB+fg0K
