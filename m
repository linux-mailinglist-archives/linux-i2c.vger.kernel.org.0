Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B072A5BF081
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 00:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiITWtf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Sep 2022 18:49:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiITWtd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Sep 2022 18:49:33 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 840AD3A1;
        Tue, 20 Sep 2022 15:49:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDeUsU3r4up2g4lP2MXfvDlSqwh9X0ZhkjRO3+cZpL3ZR7h9jfcCFTub255qW3SkwUthwb2iL02n/tl5XAJyp73ZZ/kzTBmyoAKob2TA3vgeh4eo2QgsOHxs97bjFpVGsWMk9BxeD92FbNinNxF66Gl2Fiy/rDyJLfM+nFWyQwb98WdqQD4gQt/edUW0QDpuKy2okUPNBp2cr2kVU8guKtZghUnlMwguoaJMtkGmFVHF261zBW3CxzUCOryy3i5uupc8Sz0Kcktzb5jYjrEroDGXhk/Sd+A+lfVhjGWynY0r04z7YqyUnOwQAETEtI5qvk9x1jsdpn36j+Anm8qwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzKPI0Ob40cbVKJMq19bfE3wMJZ0DOlfZvpws4OYzFs=;
 b=MSVmXU1t3wEDX1ng2HhD3a7ECAeHAruxQWADOmJAcAfwdzMkjbViaMgjky5qKsQUKV8GOmjs/C3Hk3CZeVToK1NOdHj9ZJLae3kvNOPtu1h9hqioWioOlCOgkJTbUmYtTKgzlk3bGMhkk7KMGMFn9jFFQhehfuBlo5rXye9PJ5XTgHxmqGD5UmJ8GxJNGTb+dAzUc39p+C6SndPvM3nERPp/Dy146SfvlVTd3ddZgr1G8vbeCNOJ9d2wsVb4tzWKuhm6kjry51WcgoSSpFbBf9jsGUwhQv2Tkt8B1+c5qUtDHScraqDco0ISAWQf6V+vcoZiil++iSkdOUm20BB7ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzKPI0Ob40cbVKJMq19bfE3wMJZ0DOlfZvpws4OYzFs=;
 b=GgrbqiHK2qUeGDNt6EJv/EnZxpRih02L1zPgweVglkKZ1C5bgUQcEca/Y1MZm9ZyI121wni11KQoshi4UdIMV5pn8AiH6JrYyLJH0VErZQSEnYSkzpBxH5yjlE5hVQs5Z4GMKHHoKgI/6HLVrTYw1ejb+cS+nwMPPKRKCQ5kf+Y=
Received: from DBBPR04MB6298.eurprd04.prod.outlook.com (2603:10a6:10:cf::14)
 by DB9PR04MB8139.eurprd04.prod.outlook.com (2603:10a6:10:248::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 22:49:28 +0000
Received: from DBBPR04MB6298.eurprd04.prod.outlook.com
 ([fe80::2a3d:6135:5a27:7044]) by DBBPR04MB6298.eurprd04.prod.outlook.com
 ([fe80::2a3d:6135:5a27:7044%6]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 22:49:28 +0000
From:   Leo Li <leoyang.li@nxp.com>
To:     Sean Anderson <sean.anderson@seco.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Vinod Koul <vkoul@kernel.org>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Joy Zou <joy.zou@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [BUG] ls1046a: eDMA does not transfer data from I2C
Thread-Topic: [BUG] ls1046a: eDMA does not transfer data from I2C
Thread-Index: AQHYzHaN1LN2T6ZYUU6MBMqKWnOJd63oGIuAgABYoICAAAWQAIAACl+AgABhdeA=
Date:   Tue, 20 Sep 2022 22:49:28 +0000
Message-ID: <DBBPR04MB629834F56595A84723E4031F8F4C9@DBBPR04MB6298.eurprd04.prod.outlook.com>
References: <38974aab-06d0-f5ff-d359-5eedd2f3bb3e@seco.com>
 <5ef51421-e6b0-edd5-6b6e-439b47b794a8@arm.com>
 <9b20569d-7855-0031-3552-090ff7880cec@seco.com>
 <afc8b784-25bc-5c52-7377-ea901a908ca8@seco.com>
 <50a63241-1ee3-e0c5-1faa-2f2734774874@seco.com>
In-Reply-To: <50a63241-1ee3-e0c5-1faa-2f2734774874@seco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB6298:EE_|DB9PR04MB8139:EE_
x-ms-office365-filtering-correlation-id: dfb1d63b-1bac-4414-9480-08da9b5a5ff5
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9dW72rCKENIoVPwBZVB2sF3VT+llp+cNfxcSXt6kUFaIOP73VGGNl3WO6FqiKmMNUcVLZaCA89Iui1hVA2o9gkKQ/qG6GOBDynzeCLkxZKVj8Gju6LFfFi9jfyk+v2VTwUUtdk/YtWRBPJY3FRXkMDZD3yikh9UxGKZ/znPkttahARTm20SwBAoadsNDI6gkEw1xwHKGBsce2lFuAivv7nIfJpRhTVte5ae3QvT+UlN2C+iKHmnm1ZDhwD/3dhqG4FD4un0q4Viz6eNP9nKf269i3jrInnmaeu02N730BVvwGBwwWVvkaPBdh7oGTDOsNeZX4pCGFvYBInpclAtCEkZ6LD1bmjQ4qd6a2o2jOlLfDVnsRbLik2ywCula9iec0nLqn1WtlILWb0v0az9RhSeZK+dZsAXW6hi3V56jVrSihBLQ7+wMMmcLl8xcXI/veKgnNF4eSojpkd07ga+joE29KlQ300j0KwufmAsVWU+HFbWuGPZRXSLaURjWJEVMCEApi7e8+hXQRCFLa1Cx2+GcfdtdkPlX7/h/D0YYzDR2AougXzoIuUrUoJKt3lOXJwkbyqJGn4hj4FC2lIsBGPgJ3PjXIKO55C46UR4WJBIQ4wcSWPgx/gvguaC7wOMY8V3OFKxgk+VSIyMw3pFEpF9qrYi8D87MliBgocYuQmPiPxchmxkp2MxCkeMKBrTelCT16miTiag7VUhjPcoUyYk7ad8WV0Ycgl/HKOwLoV/TxlqqQxbSWMVA51qGhZ6dGC5N+/0iOhvH+irbt85UfVIYlQ7BbQYgHOXxFx9d++c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB6298.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199015)(33656002)(55016003)(2906002)(122000001)(316002)(66574015)(38100700002)(4326008)(8676002)(5660300002)(66946007)(76116006)(66476007)(7416002)(66446008)(64756008)(66556008)(110136005)(54906003)(86362001)(6636002)(83380400001)(9686003)(186003)(478600001)(38070700005)(26005)(53546011)(8936002)(55236004)(6506007)(52536014)(71200400001)(41300700001)(7696005)(505234007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGtqbExiZWduZHpZWlFnbzZUbXV4YW5reksyYVJNNWQrblVJbmJsRU5wWGZS?=
 =?utf-8?B?M2F6U0duWTZ0Smk1VWRvUlNKTVFFSldkdnQ0OUtESlArRWhtVmk3STQ1aU9W?=
 =?utf-8?B?NWFodS9TYzN1TGN6MmR3cVBEZVp6ODZrNGw1NDhyc3V4WExkZ0FVcTVYeWZl?=
 =?utf-8?B?dVFHOG4zOGh6RWdxdStXTkJaYy9mWFhvUUJDOU9oOXJNQVp1NXVjYlNWR21w?=
 =?utf-8?B?eEdnMU1STm1CSWw2ZEo1Si9aWTl6Z0RseEZKOFlvc2pyMEg0N01ZSk9CalQ3?=
 =?utf-8?B?VVVBdG9rUzdGZnNSbHF4S3FHbVEyZjNZeVJuS2Z5cTcyQVFlNk5USk9WY2Jv?=
 =?utf-8?B?ZWJ6bWFFemVXZTIyTExSeWVibjdhcUFTbnJSWVhlZE1ZNDhWRzdsalJaZmZZ?=
 =?utf-8?B?VjZRY2MvU1pYVFowSG5Kd0xLNHoxdG5vK3c0TTFSUnNHZUVUY3VkNjhSVWN2?=
 =?utf-8?B?ZmJRTmV3VS9UdHlSbit4d0pQTzdITkRHRVFQYkJOTFlhaitEdHNndEFoM0M1?=
 =?utf-8?B?VG0yVWJBZFU2V09VOTMzeGJId3dlOFpoUytOOGNLeFpMNWlmWEtBZGJ2UWNp?=
 =?utf-8?B?cW1yM1lEK1dkV3Z4cDBEdkdqdzErU3M1dHJ3dEk0RFJoYkN5cVIzNlJwSzNM?=
 =?utf-8?B?WlhIMU1hdjB2a3phZHRRdThPOTBWUStMVVhOSEFSVXRVTHRwTVRFamZSdzdk?=
 =?utf-8?B?ZTJhSjU4K0pDd2pFMTdSQkpqcWgxTFUrNFNGMUE3bFkwU2JXb1pQYkhaakR5?=
 =?utf-8?B?V2JuK1F2YXd6N0t1bmNCVHZSYW9rNnRRTXdzMndxNXRUQk41dmt1SmM3Y2g0?=
 =?utf-8?B?cDFlWmp6dFVpNkpHUGZKOXIva21mekxoSmYyNnAwcHFQV3g3TC9maHlqSmY0?=
 =?utf-8?B?cDNRMlViZzBEUGRacGNXOFVjRXdSenNvTTVyNVJlQ3ZldEhlNmlRUysxWTFT?=
 =?utf-8?B?aUw5eExwVXIxYWYrNitDL04zQkwwMDFiL2o3NFJKd1p5V3MxVXJXTE01SlNv?=
 =?utf-8?B?RGh5L1lyKy85MTZxYXQ0azdTNHFHY3hrUCsvbHpoS1BmVjBXZm1oWjVtaTdV?=
 =?utf-8?B?WU1CQzBCcjRhZk1WKzJlMGRlaUZOTFdDSWwxalFsVGpOZERtNDBJZlpUaDhR?=
 =?utf-8?B?MWJQeHo3Z2Z4elB6bGU5ajU1V1NWM2k2VFEwUld2VnhYanVkMnNlMmFPT1Zs?=
 =?utf-8?B?ZXdSRTU0VnJ4cksyUzAwcldLRlc2MEVtd1N5NTlGd0lwcW5RdHJzQWpEd2tF?=
 =?utf-8?B?b01QeURtMk5yQzc3TjNuVm1XVFNseU5XejVVOWNQdXZvTHNrb0cxcXZLZmx1?=
 =?utf-8?B?cVluMEkxTEU2eHZJRDBlcTRQNkpNSWMvVFNFU0tDdktFenVEeUt5SmtnZWFD?=
 =?utf-8?B?cExac2gxSlhreEx4R3ZxQ1BiWHpvMnp6cjVLUVJFL2VEOWsrRXd3VHBBcnpM?=
 =?utf-8?B?b0FNZSs1SE5rYjg0Y3QvWXZLZ08yN0dVRzdpRzFHcUlXSWF0NHZyZUVJMmhC?=
 =?utf-8?B?WXdBNzRTc3RnbEZiU08reTIzaTYzd0tnaFZCQzh5VGVaZUg2dytYdUdpQ2ho?=
 =?utf-8?B?OHIrek1XdkM1M3JmRmt6V2s4YTNvQW0vRUEyMXFvbThibkRFSFV3cjFtZmdo?=
 =?utf-8?B?YlNDNHVrMEFuNzNEOC9BYlR5VEtja0VzcmhwVjFnV2R0N21wT0dMQnE3eFJ6?=
 =?utf-8?B?QXVJUmR3RFg0TVdKajhCNjd4cDVHUkdtMXREVFN4ckpqTkFvV21Za3RIQTlq?=
 =?utf-8?B?RVY4b3RNNEFnMWdCS2g0SGRlWkRxMWhXdE9VU0I1ODA3eHpidzdmRWl1WGpU?=
 =?utf-8?B?NWI4ZlpCcXdXU3BaWHpLUXdqZ3pGeFROK3lkaHBmbGc1ZGIzQmJBV2N4Q2ZQ?=
 =?utf-8?B?UHlVVE5Ma1JOMDJCUWNJRis4N242dE5jV3U3R1F2dG1ndUt1L1l6dXJ0TUJ4?=
 =?utf-8?B?eUI1WUVmN0pmUkx0SVlBaVl4dm9PUHk1Q2l0UFNkM1JRWW80NkVJRStkRExj?=
 =?utf-8?B?RzBzUzMxR1JIdzJrb1o2Z1VTSXUxLzlzWDNjM1hBOVR4UUlKVlB0VXM3OTg5?=
 =?utf-8?B?ZElKbkovZkllbGZMN0l0dUdaTWwwSzliZVhCMFFjOGRnSWo0V3VTdjM5ZlNG?=
 =?utf-8?Q?WoM/QCl2gJp0ItXHtp7yFQT+Y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB6298.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb1d63b-1bac-4414-9480-08da9b5a5ff5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 22:49:28.5482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P98/VS+Xg3WEc3UcbZH46VIsB8yT6ZZJGQ+3mITYAVy87w2ToQT5I5r4Mvu4v9sCYo7qj4lntX+6zaLRyfqv7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8139
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2VhbiBBbmRlcnNvbiA8
c2Vhbi5hbmRlcnNvbkBzZWNvLmNvbT4NCj4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDIwLCAy
MDIyIDExOjIxIEFNDQo+IFRvOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPjsg
T2xla3NpaiBSZW1wZWwNCj4gPGxpbnV4QHJlbXBlbC1wcml2YXQuZGU+OyBQZW5ndXRyb25peCBL
ZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgbGludXgtaTJjQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbA0KPiA8bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnPjsgVmlub2QgS291bCA8dmtvdWxAa2VybmVsLm9yZz47DQo+IGRtYWVuZ2luZUB2
Z2VyLmtlcm5lbC5vcmc7IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPjsgTGF1cmVudGl1IFR1
ZG9yDQo+IDxsYXVyZW50aXUudHVkb3JAbnhwLmNvbT4NCj4gQ2M6IExpbnV4IEtlcm5lbCBNYWls
aW5nIExpc3QgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBkcmktDQo+IGRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPjsNCj4gbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnOyBTaGF3biBHdW8gPHNo
YXduZ3VvQGtlcm5lbC5vcmc+OyBTdW1pdA0KPiBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8u
b3JnPjsgSm95IFpvdSA8am95LnpvdUBueHAuY29tPjsgbGludXgtDQo+IG1lZGlhQHZnZXIua2Vy
bmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW0JVR10gbHMxMDQ2YTogZURNQSBkb2VzIG5vdCB0cmFu
c2ZlciBkYXRhIGZyb20gSTJDDQo+IA0KPiANCj4gDQo+IE9uIDkvMjAvMjIgMTE6NDQgQU0sIFNl
YW4gQW5kZXJzb24gd3JvdGU6DQo+ID4NCj4gPg0KPiA+IE9uIDkvMjAvMjIgMTE6MjQgQU0sIFNl
YW4gQW5kZXJzb24gd3JvdGU6DQo+ID4+DQo+ID4+DQo+ID4+IE9uIDkvMjAvMjIgNjowNyBBTSwg
Um9iaW4gTXVycGh5IHdyb3RlOg0KPiA+Pj4gT24gMjAyMi0wOS0xOSAyMzoyNCwgU2VhbiBBbmRl
cnNvbiB3cm90ZToNCj4gPj4+PiBIaSBhbGwsDQo+ID4+Pj4NCj4gPj4+PiBJIGRpc2NvdmVyZWQg
YSBidWcgaW4gZWl0aGVyIGlteF9pMmMgb3IgZnNsLWVkbWEgb24gdGhlIExTMTA0NkENCj4gPj4+
PiB3aGVyZSBubyBkYXRhIGlzIHJlYWQgaW4gaTJjX2lteF9kbWFfcmVhZCBleGNlcHQgZm9yIHRo
ZSBsYXN0IHR3bw0KPiA+Pj4+IGJ5dGVzICh3aGljaCBhcmUgbm90IHJlYWQgdXNpbmcgRE1BKS4g
VGhpcyBpcyBwZXJoYXBzIGJlc3QNCj4gPj4+PiBpbGx1c3RyYXRlZCB3aXRoIHRoZSBmb2xsb3dp
bmcgZXhhbXBsZToNCj4gPj4+Pg0KPiA+Pj4+ICMgaGV4ZHVtcCAtQyAvc3lzL2J1cy9udm1lbS9k
ZXZpY2VzLzAtMDA1NDAvbnZtZW0NCj4gPj4+PiBbICAzMDguOTE0ODg0XSBpMmMgaTJjLTA6IGZm
ZmYwMDA4MDkzODAwMDAgMHgwMDAwMDAwODg5MzgwMDAwDQo+IDB4MDAwMDAwMDBmNTQwMTAwMCBm
ZmZmMDAwMDc1NDAxMDAwDQo+ID4+Pj4gWyAgMzA4LjkyMzUyOV0gc3JjPSAyMTgwMDA0IGRzdD1m
NTQwMTAwMCBhdHRyPSAgIDAgc29mZj0gICAwIG5ieXRlcz0xDQo+IHNsYXN0PSAgICAgICAwDQo+
ID4+Pj4gWyAgMzA4LjkyMzUyOV0gY2l0ZXI9ICA3ZSBiaXRlcj0gIDdlIGRvZmY9ICAgMSBkbGFz
dF9zZ2E9ICAgICAgIDANCj4gPj4+PiBbICAzMDguOTIzNTI5XSBtYWpvcl9pbnQ9MSBkaXNhYmxl
X3JlcT0xIGVuYWJsZV9zZz0wIFsgIDMwOC45NDIxMTNdDQo+ID4+Pj4gZnNsLWVkbWEgMmMwMDAw
MC5lZG1hOiB2Y2hhbiAwMDAwMDAwMDFiNDM3MWZjOiB0eGQNCj4gPj4+PiAwMDAwMDAwMGQ5ZGQy
NmM1WzRdOiBzdWJtaXR0ZWQgWyAgMzA4Ljk3NDA0OV0gZnNsLWVkbWENCj4gPj4+PiAyYzAwMDAw
LmVkbWE6IHR4ZCAwMDAwMDAwMGQ5ZGQyNmM1WzRdOiBtYXJrZWQgY29tcGxldGUgWw0KPiA+Pj4+
IDMwOC45ODEzMzldIGkyYyBpMmMtMDogZmZmZjAwMDgwOTM4MDAwMCA9IFsyZSAyZSAyZiAyZSAy
ZSAyZiAyZSAyZQ0KPiA+Pj4+IDJmIDY0IDY1IDc2IDY5IDYzIDY1IDczIDJmIDcwIDZjIDYxIDc0
IDY2IDZmIDcyIDZkIDJmIDczIDZmIDYzIDJmIDMyIDMxIDM4IDMwDQo+IDMwIDMwIDMwIDJlIDY5
IDMyIDYzIDJmIDY5IDMyIDYzIDJkIDMwIDJmIDMwIDJkIDMwIDMwIDM1IDM0IDJmIDMwIDJkIDMw
IDMwIDM1IDM0DQo+IDMwIDAwIDAwXSBbICAzMDkuMDAyMjI2XSBpMmMgaTJjLTA6IGZmZmYwMDAw
NzU0MDEwMDAgPSBbMmUgMmUgMmYgMmUgMmUgMmYgMmUgMmUgMmYNCj4gNjQgNjUgNzYgNjkgNjMg
NjUgNzMgMmYgNzAgNmMgNjEgNzQgNjYgNmYgNzIgNmQgMmYgNzMgNmYgNjMgMmYgMzIgMzEgMzgg
MzAgMzAgMzAgMzANCj4gMmUgNjkgMzIgNjMgMmYgNjkgMzIgNjMgMmQgMzAgMmYgMzAgMmQgMzAg
MzAgMzUgMzQgMmYgMzAgMmQgMzAgMzAgMzUgMzQgMzAgMDAgMDBdDQo+IFsgIDMwOS4wMjQ2NDld
IGkyYyBpMmMtMDogZmZmZjAwMDgwOTM4MDA4MCAweDAwMDAwMDA4ODkzODAwODANCj4gMHgwMDAw
MDAwMGY1NDAxODAwIGZmZmYwMDAwNzU0MDE4MDANCj4gPj4+PiBbICAzMDkuMDMzMjcwXSBzcmM9
IDIxODAwMDQgZHN0PWY1NDAxODAwIGF0dHI9ICAgMCBzb2ZmPSAgIDAgbmJ5dGVzPTENCj4gc2xh
c3Q9ICAgICAgIDANCj4gPj4+PiBbICAzMDkuMDMzMjcwXSBjaXRlcj0gIDdlIGJpdGVyPSAgN2Ug
ZG9mZj0gICAxIGRsYXN0X3NnYT0gICAgICAgMA0KPiA+Pj4+IFsgIDMwOS4wMzMyNzBdIG1ham9y
X2ludD0xIGRpc2FibGVfcmVxPTEgZW5hYmxlX3NnPTAgWyAgMzA5LjA1MTYzM10NCj4gPj4+PiBm
c2wtZWRtYSAyYzAwMDAwLmVkbWE6IHZjaGFuIDAwMDAwMDAwMWI0MzcxZmM6IHR4ZA0KPiA+Pj4+
IDAwMDAwMDAwZDlkZDI2YzVbNV06IHN1Ym1pdHRlZCBbICAzMDkuMDgzNTI2XSBmc2wtZWRtYQ0K
PiA+Pj4+IDJjMDAwMDAuZWRtYTogdHhkIDAwMDAwMDAwZDlkZDI2YzVbNV06IG1hcmtlZCBjb21w
bGV0ZSBbDQo+ID4+Pj4gMzA5LjA5MDgwN10gaTJjIGkyYy0wOiBmZmZmMDAwODA5MzgwMDgwID0g
WzAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwDQo+ID4+Pj4gMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDANCj4gPj4+PiAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MA0KPiA+Pj4+IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwXSBbICAzMDkuMTEx
Njk0XSBpMmMgaTJjLTA6DQo+ID4+Pj4gZmZmZjAwMDA3NTQwMTgwMCA9IFswMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMA0KPiA+Pj4+IDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwDQo+ID4+
Pj4gMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDANCj4gPj4+PiAwMCAwMCAwMCAwMF0NCj4gPj4+PiAwMDAwMDAwMCAgMmUgMmUg
MmYgMmUgMmUgMmYgMmUgMmUgIDJmIDY0IDY1IDc2IDY5IDYzIDY1IDczDQo+ID4+Pj4gfC4uLy4u
Ly4uL2RldmljZXN8DQo+ID4+Pj4gMDAwMDAwMTAgIDJmIDcwIDZjIDYxIDc0IDY2IDZmIDcyICA2
ZCAyZiA3MyA2ZiA2MyAyZiAzMiAzMQ0KPiA+Pj4+IHwvcGxhdGZvcm0vc29jLzIxfA0KPiA+Pj4+
IDAwMDAwMDIwICAzOCAzMCAzMCAzMCAzMCAyZSA2OSAzMiAgNjMgMmYgNjkgMzIgNjMgMmQgMzAg
MmYNCj4gPj4+PiB8ODAwMDAuaTJjL2kyYy0wL3wNCj4gPj4+PiAwMDAwMDAzMCAgMzAgMmQgMzAg
MzAgMzUgMzQgMmYgMzAgIDJkIDMwIDMwIDM1IDM0IDMwIDAwIDAwDQo+ID4+Pj4gfDAtMDA1NC8w
LTAwNTQwLi58DQo+ID4+Pj4gMDAwMDAwNDAgIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMA0KPiA+Pj4+IHwuLi4uLi4uLi4uLi4uLi4ufA0KPiA+Pj4+ICoN
Cj4gPj4+PiAwMDAwMDA3MCAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIDAwIDAwIDAwIDAwIDAw
IDAwIGZmIGZmDQo+ID4+Pj4gfC4uLi4uLi4uLi4uLi4uLi58DQo+ID4+Pj4gMDAwMDAwODAgIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMA0KPiA+Pj4+IHwu
Li4uLi4uLi4uLi4uLi4ufA0KPiA+Pj4+ICoNCj4gPj4+PiAwMDAwMDBmMCAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgIDAwIDAwIDAwIDAwIDAwIDAwIGZmIDViDQo+ID4+Pj4gfC4uLi4uLi4uLi4u
Li4uLlt8DQo+ID4+Pj4gMDAwMDAxMDANCj4gPj4+Pg0KPiA+Pj4+IChwYXRjaCB3aXRoIG15IGRl
YnVnIHByaW50cyBhcHBlbmRlZCBiZWxvdykNCj4gPj4+Pg0KPiA+Pj4+IERlc3BpdGUgdGhlIERN
QSBjb21wbGV0aW5nIHN1Y2Nlc3NmdWxseSwgbm8gZGF0YSB3YXMgY29waWVkIGludG8NCj4gPj4+
PiB0aGUgYnVmZmVyLCBsZWF2aW5nIHRoZSBvcmlnaW5hbCAobm93IGp1bmspIGNvbnRlbnRzLiBJ
IHByb2JlZCB0aGUNCj4gPj4+PiBJMkMgYnVzIHdpdGggYW4gb3NjaWxsb3Njb3BlLCBhbmQgSSB2
ZXJpZmllZCB0aGF0IHRoZSB0cmFuc2ZlciBkaWQgaW5kZWVkDQo+IG9jY3VyLg0KPiA+Pj4+IFRo
ZSB0aW1pbmcgYmV0d2VlbiBzdWJtaXNzaW9uIGFuZCBjb21wbGV0aW9uIHNlZW1zIHJlYXNvbmFi
bGUgZm9yDQo+ID4+Pj4gdGhlIGJ1cyBzcGVlZCAoNTAga0h6IGZvciB3aGF0ZXZlciByZWFzb24p
Lg0KPiA+Pj4+DQo+ID4+Pj4gSSBoYWQgYSBsb29rIG92ZXIgdGhlIEkyQyBkcml2ZXIsIGFuZCBu
b3RoaW5nIGxvb2tlZCBvYnZpb3VzbHkNCj4gPj4+PiBpbmNvcnJlY3QuIElmIGFueW9uZSBoYXMg
aWRlYXMgb24gd2hhdCB0byB0cnksIEknbSBtb3JlIHRoYW4gd2lsbGluZy4NCj4gPj4+DQo+ID4+
PiBJcyB0aGUgRE1BIGNvbnRyb2xsZXIgY2FjaGUtY29oZXJlbnQ/IEkgc2VlIHRoZSBtYWlubGlu
ZSBMUzEwNDZBIERUDQo+IGRvZXNuJ3QgaGF2ZSBhICJkbWEtY29oZXJlbnQiIHByb3BlcnR5IGZv
ciBpdCwgYnV0IHRoZSBiZWhhdmlvdXIgaXMgZW50aXJlbHkNCj4gY29uc2lzdGVudCB3aXRoIHRo
YXQgYmVpbmcgd3JvbmcgLSBkbWFfbWFwX3NpbmdsZSgpIGNsZWFucyB0aGUgY2FjaGUsDQo+IGNv
aGVyZW50IERNQSB3cml0ZSBoaXRzIHRoZSBzdGlsbC1wcmVzZW50IGNhY2hlIGxpbmVzLCBkbWFf
dW5tYXBfc2luZ2xlKCkNCj4gaW52YWxpZGF0ZXMgdGhlIGNhY2hlLCBhbmQgYm9vbSwgdGhlIGRh
dGEgaXMgZ29uZSBhbmQgeW91IHJlYWQgYmFjayB0aGUNCj4gcHJldmlvdXMgY29udGVudCBvZiB0
aGUgYnVmZmVyIHRoYXQgd2FzIGNsZWFuZWQgb3V0IHRvIERSQU0gYmVmb3JlaGFuZC4NCj4gPj4N
Cj4gPj4gSSd2ZSB0cmllZCBib3RoIHdpdGggYW5kIHdpdGhvdXQgWzFdIGFwcGxpZWQuIEkgYWxz
byB0cmllZCByZW1vdmluZw0KPiA+PiB0aGUgY2FsbCB0byBkbWFfdW5tYXBfc2luZ2xlLCBidXQg
dG8gbm8gZWZmZWN0Lg0KPiA+DQo+ID4gQWN0dWFsbHksIEkgd2Fzbid0IHVwZGF0aW5nIG15IGRl
dmljZSB0cmVlIGxpa2UgSSB0aG91Z2h0Li4uDQo+ID4NCj4gPiBUdXJucyBvdXQgSTJDIHdvcmtz
IG9ubHkgKndpdGhvdXQqIHRoaXMgcGF0Y2guDQo+ID4NCj4gPiBTbyBtYXliZSB0aGUgZURNQSBp
cyBub3QgY29oZXJlbnQ/DQo+IA0KPiBJdCBzZWVtcyBsaWtlIHRoaXMgbWlnaHQgYmUgdGhlIGNh
c2UuIEZyb20gdGhlIHJlZmVyZW5jZSBtYW51YWw6DQo+IA0KPiA+IEFsbCB0cmFuc2FjdGlvbnMg
ZnJvbSBlRE1BIGFyZSB0YWdnZWQgYXMgc25vb3AgY29uZmlndXJhdGlvbiBpZiB0aGUNCj4gPiBT
Q0ZHX1NOUENORkdDUltlRE1BU05QXSBiaXQgaXMgc2V0LiBSZWZlciBTbm9vcCBDb25maWd1cmF0
aW9uDQo+IFJlZ2lzdGVyDQo+ID4gKFNDRkdfU05QQ05GR0NSKSBmb3IgZGV0YWlscy4NCj4gDQo+
IEJ1dCB0aGVyZSBpcyBubyBzdWNoIGJpdCBpbiB0aGlzIHJlZ2lzdGVyIG9uIHRoZSBMUzEwNDZB
LiBPbiB0aGUgTFMxMDQzQSwgdGhpcw0KPiBiaXQgZG9lcyBleGlzdCwgYnV0IG9uIHRoZSBMUzEw
NDZBIGl0IGlzIHJlc2VydmVkLiBJIHJlYWQgdGhlIHJlZ2lzdGVyLCBhbmQNCj4gZm91bmQgdGhl
IGJpdCB3YXMgMC4gUGVyaGFwcyBlRE1BIHdhcyBpbnRlbmRlZCB0byBiZSBjb2hlcmVudCwgYnV0
IHRoZXJlDQo+IHdhcyBhIGhhcmR3YXJlIGJ1Zz8NCg0KVGhhbmtzIGZvciB0aGUgZmluZGluZ3Mu
ICBJIGRvbid0IGtub3cgdGhlIHJlYXNvbiB3aHkgdGhpcyBiaXQgaXMgcmVzZXJ2ZWQgb24gTFMx
MDQ2YSBlaXRoZXIuICBJdCBzaG91bGQgaGF2ZSBhIHNpbWlsYXIgZGVzaWduIGFzIExTMTA0M2Eu
DQoNCj4gDQo+IElmIHRoaXMgaXMgdGhlIGNhc2UsIHRoZW4gSSB0aGluayBkbWEtY29oZXJlbnQg
c2hvdWxkIGJlIGxlZnQgb3V0IG9mIHRoZSB0b3AtDQo+IGxldmVsIC9zb2Mgbm9kZS4gSW5zdGVh
ZCwgdGhlIHFkbWEsIHNhdGEsIHVzYiwgYW5kIGVtbWMgbm9kZXMgc2hvdWxkIGhhdmUNCj4gZG1h
LWNvaGVyZW50IGFkZGVkLg0KPiANCj4gTGkvTGF1cmVudGl1LCB3aGF0IGFyZSB5b3VyIHRob3Vn
aHRzPw0KDQpUaGVuIGxvb2tzIGxpa2UgaXQgaXMgbm90IGNvcnJlY3QgdG8gc2F5IGFsbCBkZXZp
Y2VzIG9uIHRoZSBidXMgaXMgY29oZXJlbnQuICBCdXQgYXMgd2UgaGF2ZSB0aGUgbmV3ICJkbWEt
bm9uY29oZXJlbnQiIHByb3BlcnR5IG5vdyBhbmQgbW9zdCBvZiB0aGUgZGV2aWNlcyBhcmUgYWN0
dWFsbHkgY29oZXJlbnQsIHdlIHByb2JhYmx5IGNhbiBrZWVwIHRoZSBidXMgYXMgZG1hLWNvaGVy
ZW50IGFuZCBtYXJrIGV4Y2VwdGlvbnMgd2l0aCBkbWEtbm9uY29oZXJlbnQ/DQoNClJlZ2FyZHMs
DQpMZW8NCg==
