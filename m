Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6449170BE83
	for <lists+linux-i2c@lfdr.de>; Mon, 22 May 2023 14:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233906AbjEVMiv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 May 2023 08:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232535AbjEVMir (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 May 2023 08:38:47 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2131.outbound.protection.outlook.com [40.107.113.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93266118;
        Mon, 22 May 2023 05:38:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cnce/Ho5Ew5KGTX7hxZ9QVwxG9bvtPwWldA/hUPEbo9Xn7eyrI6ZXdDQ72Ks7QKW6jQWBdju2q3ROID7fyg4hLPqHAxJdnDdLfEqDmhkwov3FtrXi5KBLAWGBxRKxsTCzsMHDQZBN19hTtn+Dakcwl/4Y+ZrXjo97kkK0YisyCbW58t3Mt8ao7iG20U+Ulv++Bf804sRRQV7pcMk62Mao8OcG350qKT75bAYFSD3szVF5n8ryT9T7YTv8H/ufobphHTk2Cm3iLAJ/JRUyHC5uyglPSLAS1j6VYs3N+lY/pYDNR6vDTJJbBt4FgkBUKWZRbVJ1/vf6gEwEeUFIsVECg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pytNwa+G6JgJjnw62u5GCNK6bT0uMu4fB6ASS5Ox0Uw=;
 b=SzzM4e3aRFlcknVJmV4mAZGFap50fFuVyy3YGDJv51DAyrYtSyQJBuKy+kR9ZyLBBJxolKVXsGCguoroUt4pq8eKVBECaMSu4scwpnblEPPsThjxOFOG2U4tNWKoLxFnCQ9zGhM/B2p8Rod/pX/swmHroW3strfGmbCUv2pWdWgSWsZ/R7LWD15lU6hk6oBBkB0wkiOXomAN7cxRfgwmD3DzDGDDbtd3r4SECm7wAR+SUEbm1TNwjbn4l/1guMQcPSAEMNjiRhQtcdDLetzSYm9myhjzWl0b78l4Uf6ojR7x9E0xnMEd0kXnOYqoICgEdqIzt/t2cM/odkavd11BEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pytNwa+G6JgJjnw62u5GCNK6bT0uMu4fB6ASS5Ox0Uw=;
 b=iZW0AAm/YiqyXoc8ia5IYnFZ1M7wn061tcCLJalSipytsaR/U1+hHZt0v18mCQU6wqOT9c9+ZG7LLzIPXsJIVW6XAV22zTLhVfV3zdOwREqCv7OLVYtfLACpCAd7spKPgfUTfTaDch4E1z1SWUWNRfqALJJ441RiUCu8IWeGACk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB9779.jpnprd01.prod.outlook.com (2603:1096:400:22c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 12:38:11 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 12:38:11 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] i2c: Add i2c_get_match_data()
Thread-Topic: [PATCH] i2c: Add i2c_get_match_data()
Thread-Index: AQHZjJoMdfR+x3Vj306EK7lrI8lBfq9mJ/OAgAARV0A=
Date:   Mon, 22 May 2023 12:38:11 +0000
Message-ID: <OS0PR01MB5922DAE12A85AC045B6222DB86439@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230522104157.333217-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWPF8SvJ=OyPBFSwTD65ic+KB-um0zYWVL6imO-ddgC6g@mail.gmail.com>
In-Reply-To: <CAMuHMdWPF8SvJ=OyPBFSwTD65ic+KB-um0zYWVL6imO-ddgC6g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB9779:EE_
x-ms-office365-filtering-correlation-id: 049891a3-d1a7-4e5e-c51c-08db5ac1674f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A3nwdqbnO+HsNopxyXXqotPWkOxn3h2cXo/mPLUciYYk4vZGPPyi3q2zCWykmqTVWlHJ4vs0F3fdPcA9YD8uciGAxA7HVmPkOq0GOB6EfWkmhsQxnsDd3XpGOMy6Wjxubs7cL6TtE4eCmTE+h1GCyqqs2TuniUM0QgsLSCVDvlHsWm+Iyk7daXZ80kNjJQ1mZbLTDUFKZ+iJN/6SoeIBbrL8uwZ4XEsKG3mV4u/3s4OhUPqIyFZgnzsR1UR081gM36dyqgFlOvFS3FBuCBhjKwonUdoF1arjoUKk3cGBDyO8ngsc2VHUe7+3Ayd0IsDgdhgrS65gg5dEbwO+dCO9QD8/sqXjUmru2/cuvAIgmHK6L58v01uFWlosSLxTZoghNvBJzVPMbtdEMWvLr26p0u0UKNsw++nbUpfjVMF3HM7FE6iSOzLCWXvU4YkRO7/G6MhzaO7ugF+39vAok+w198vMriwpI6LomNSa83NmahIsMrbWP0CMEAeO5l9faofSX2U9F2nawp78b7hZMQpaE9YRNHGCGPXTmTypAR9ctLOyfuv7sTB2zNYZtgi3Z/WM4aLBF/2LiOEVOWw6XNhWsAxtutvdlLkfPnsNuHLUkbZ378gahRfuPdiCXHoDhDv1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199021)(71200400001)(2906002)(7696005)(6916009)(38070700005)(64756008)(66446008)(66556008)(66946007)(76116006)(54906003)(66476007)(478600001)(52536014)(53546011)(122000001)(38100700002)(55016003)(8676002)(8936002)(9686003)(316002)(4326008)(41300700001)(5660300002)(33656002)(86362001)(6506007)(83380400001)(26005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2ZBTFVXZXVWOHhjeDZoL3JoWXNYci9Md1MyU29QNkxPb2Y5SzYxQVF0cFp1?=
 =?utf-8?B?enNOcmgxOU1yYUJKUm9HOWhaRjNNK0NjWlh2M2JFMndZcnRsL0hzSEFERVBt?=
 =?utf-8?B?WFZtVXBnRExCVm92dXU2SmxybkppZ0l6MXhCYlVYY2FNcDlHd3p0L2cvKzNR?=
 =?utf-8?B?YWxyVG0ydVY3aVhsYmFOKzM0ZjFialF0eTNseU1FZ3BjeGg5aTZ0WjA2SkJy?=
 =?utf-8?B?UU9VVzdjdk9QN21VejY5ZDFkWEk3ZUVuWnpvN2VhdG9Id1VFQmNGZFkrY1lN?=
 =?utf-8?B?aEZrVkExMGR1cEtoZDgyTGtQL1FiSXdFU0Rab1UraE5nK3V0d05iVEN1MCs5?=
 =?utf-8?B?T3lidXlHOGxIeGZsZ1YvK3dXRVMyZXF0TU55ak9BbnNNOFZxZ1A2eVdCQTk1?=
 =?utf-8?B?T3dJUjhRNWpQUTBONlJEdTdhRkNzczdTRVUxNFNNR21ZMjkyYmpjYnJtN1Rh?=
 =?utf-8?B?dmw4ZXpPZXF1bkQ1Kzh0UytuTmowUXNGTmx5cWdVc1pEVEVqcG5wdytpL3Nz?=
 =?utf-8?B?QTFhTFBTMmt3RGdVMFMyQmNCRUcrWG94Q08rRVVvM09VOTdsL2pNUTdsOW04?=
 =?utf-8?B?NlpydjdmZ0pZN3JjQUFoZXExUzRKMlpwbmkrQURFSkNtY0xhYWw5aGd0dGdJ?=
 =?utf-8?B?WmxXOGFTbXlId01uY1gvdW14a3VCVTdjc3N6aVVpUHpMQTNxWjBsN0tTb2Q0?=
 =?utf-8?B?aVpoME9Gei9CTklySUUrd0hiM1IrTHZjcnEzcjRReExEK2JiSmVGZE1GWTcz?=
 =?utf-8?B?MzkyTkZ4S0JES01aaEdQQzNlU00zbXNLL3hQQUJSbFdaT2FoZFc2YW1vRCs5?=
 =?utf-8?B?QkxUbDY3cVpsbkVMU2dqQXYrbGl4OU04dHZOTk1STVhZTjhYazhQcXZrZ0h0?=
 =?utf-8?B?dzF0Sm5uT2hUK1YzWVBYNHA5NHdXL0pFMGJtdlZxdWRjeFlnQnVFd084ZU8x?=
 =?utf-8?B?bCtOL2JaMUhYUCtzZU1sTGNnNGdNUCtwSW4rcGJsZ05NRlpCampxTVF4TUdl?=
 =?utf-8?B?VkJKZitybGhYM05RUiszQitzbW1FY2lxRUVjU3lBQmhvVDRwZC94b1VIQnpI?=
 =?utf-8?B?bjNSTDBudHVPNlBDMmh4SkpHTWVydjg4ak9BNjEyVDY3TGo4TmF1VStDTEl4?=
 =?utf-8?B?LzR0MnhhUHJ1T245RmJzTW9zckg0SzZ5MXdGczdqTm1tZEVmc0NiZTVGaE5H?=
 =?utf-8?B?OHlkZGFwR1RqOUVWak81NEpsMjNLbis1L0JFeUVraHBJbFpPdlZjMnVEMCti?=
 =?utf-8?B?bi9Ta09UZG1PMWZrVjU5VkM4c3JoR0JVYlp2RlJobjdSVmVCVUlSOWxFVHQ1?=
 =?utf-8?B?Q0ZrdFgvUEsvS1VzZmZoU05hVENjTVlINS9PdThHeEVwTDhmS2t1MzlYMmVr?=
 =?utf-8?B?bFYvOVdGQllFemQ4R1ZRVkViaEx2Q2F0OWt5OUo2MDBkbmhwMjVnWDVuVWZh?=
 =?utf-8?B?Qk1wS0ZQM3dHd1Z5cE9NMmtkMklVMlRXWUpDRUZzdFdCUW1paSs1T21qQVdK?=
 =?utf-8?B?RkZKQmlwazkzdXJMdjdLOS8zUUNUUysyTkd4ZDR5d2tPd0NERnZkNEhwMHFt?=
 =?utf-8?B?VXlQZTNEMzhyNmorV0l1bDNlalNtOUdsOFFXN1d3cC9aN2lPUVhXVmFMN3BX?=
 =?utf-8?B?WDVGcmhORUlCQ04rUkZZQ2ZTT3JVYVBTYnI2SXNCN2ZMT0NDaDFOaW9pM1BE?=
 =?utf-8?B?bSt5NFM0bnNucXdoc2kwSWRGV2tQR3RodVNLVU8rbW51b0dGZ2JtOWRsQU5Y?=
 =?utf-8?B?L0tXSFZWUk5CTTIxeUdnNEQ0b2l6SWlWZzhSUXQ2dDdsdmFadDhoYWQrb3pC?=
 =?utf-8?B?a09TUVpYdlRySmJpbVFoOHNQbXB1dmtWRHFYN2orWlBwTnlIYkNOTnd1SVFr?=
 =?utf-8?B?NUo2bWJoU3oxYmlLUHBodXdybE1JVE1kb2puME00TkJ4cDBaaGtscG1zeUph?=
 =?utf-8?B?MGFFeTRKc0Z2L0JhYS9yZjVadlJKSjJCdXhVclpIU0VvZHB5SEFJRVdUaWNV?=
 =?utf-8?B?ckVIbnFTWWZsZkNPQS9SSG4rMUdPVkpNSlhrdGU1MGtzY1lSSitwbFkwaTYw?=
 =?utf-8?B?WTVrMDZJTUhXQ1JOYlVzTHhlanNkS1EyanVGRm9oTTZjblRXWklMeFNuTWNR?=
 =?utf-8?Q?/v0Anunm5gr09k0rHKHYGTzgb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049891a3-d1a7-4e5e-c51c-08db5ac1674f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2023 12:38:11.1181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rtG+nC5euDWMWo8jEhi2xMnGDuV8xo3wbb1aLkGPh0odiNGOdMCkgaNbAym/VLee/oNynVDKHy5pv4EI2K6JfY8RGYzYT6+Rmdc1svqO3X4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9779
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgTWF5IDIyLCAyMDIzIDEyOjI5IFBNDQo+IFRvOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBXb2xmcmFtIFNhbmcgPHdz
YUBrZXJuZWwub3JnPjsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgQWxlc3NhbmRybw0KPiBa
dW1tbyA8YS56dW1tb0B0b3dlcnRlY2guaXQ+OyBBbGV4YW5kcmUgQmVsbG9uaQ0KPiA8YWxleGFu
ZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+OyBQcmFiaGFrYXIgTWFoYWRldiBMYWQNCj4gPHByYWJo
YWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT47IGxpbnV4LXJlbmVzYXMtDQo+IHNv
Y0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gaTJjOiBBZGQgaTJjX2dl
dF9tYXRjaF9kYXRhKCkNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIE1heSAyMiwgMjAy
MyBhdCAxMjo0MuKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
d3JvdGU6DQo+ID4gQWRkIGkyY19nZXRfbWF0Y2hfZGF0YSgpIHNpbWlsYXIgdG8gb2ZfZGV2aWNl
X2dldF9tYXRjaF9kYXRhKCksIHNvDQo+ID4gdGhhdCB3ZSBjYW4gb3B0aW1pemUgdGhlIGRyaXZl
ciBjb2RlIHRoYXQgdXNlcyBib3RoIEkyQyBhbmQgRFQtYmFzZWQNCj4gPiBtYXRjaGluZy4NCj4g
Pg0KPiA+IFN1Z2dlc3RlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGds
aWRlci5iZT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2Ry
aXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaTJjL2kyYy1jb3Jl
LWJhc2UuYw0KPiA+IEBAIC05OSw4ICs5OSw4IEBAIGNvbnN0IGNoYXIgKmkyY19mcmVxX21vZGVf
c3RyaW5nKHUzMiBidXNfZnJlcV9oeikgIH0NCj4gPiBFWFBPUlRfU1lNQk9MX0dQTChpMmNfZnJl
cV9tb2RlX3N0cmluZyk7DQo+ID4NCj4gPiAtY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmky
Y19tYXRjaF9pZChjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZA0KPiAqaWQsDQo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0DQo+
IGkyY19jbGllbnQgKmNsaWVudCkNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNl
X2lkICppMmNfbWF0Y2hfZGV2aWNlX2lkKGNvbnN0IHN0cnVjdA0KPiBpMmNfZGV2aWNlX2lkICpp
ZCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3Qgc3RydWN0DQo+ID4gK2kyY19jbGllbnQgKmNsaWVudCkNCj4gPiAgew0KPiA+
ICAgICAgICAgaWYgKCEoaWQgJiYgY2xpZW50KSkNCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJu
IE5VTEw7DQo+ID4gQEAgLTExMCwxMCArMTEwLDMwIEBAIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNl
X2lkICppMmNfbWF0Y2hfaWQoY29uc3QNCj4gc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkLA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBpZDsNCj4gPiAgICAgICAgICAgICAgICAg
aWQrKzsNCj4gPiAgICAgICAgIH0NCj4gPiArDQo+ID4gICAgICAgICByZXR1cm4gTlVMTDsNCj4g
PiAgfQ0KPiA+ICsNCj4gPiArY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmkyY19tYXRjaF9p
ZChjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZA0KPiAqaWQsDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgaTJjX2NsaWVudA0KPiA+ICsq
Y2xpZW50KSB7DQo+ID4gKyAgICAgICByZXR1cm4gaTJjX21hdGNoX2RldmljZV9pZChpZCwgY2xp
ZW50KTsgfQ0KPiA+ICBFWFBPUlRfU1lNQk9MX0dQTChpMmNfbWF0Y2hfaWQpOw0KPiANCj4gSXMg
dGhlcmUgYW55IHJlYXNvbiB3aHkgeW91J3JlIGFkZGluZyBhIG5ldyBpbnRlcm1lZGlhdGU/DQoN
ClRoZSBzYW1lIGNvZGUgaXMgc2hhcmVkIGJldHdlZW4gYmVsb3cgZnVuY3Rpb24uDQpBcyBkaXNj
dXNzZWQgYmVsb3csIGl0IGlzIG5vdCByZXF1aXJlZC4NCg0KPiANCj4gPg0KPiA+ICtjb25zdCB2
b2lkICppMmNfZ2V0X21hdGNoX2RhdGEoY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkLA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgaTJjX2NsaWVu
dCAqY2xpZW50KQ0KPiANCj4gSSB0aGluayB0aGlzIHNob3VsZCB0YWtlIHRoZSBpZCB0YWJsZSBm
cm9tIHRoZSBpMmNfZHJpdmVyLCBhcyBwb2ludGVkIHRvDQo+IGJ5IGNsaWVudC0+ZGV2LmRyaXZl
ciwgaW5zdGVhZCBvZiBmcm9tIGFuIGV4cGxpY2l0bHkgcGFzc2VkIHBhcmFtZXRlci4NCg0KWW91
IG1lYW4gY29uc3Qgdm9pZCAqaTJjX2dldF9tYXRjaF9kYXRhKGNvbnN0IHN0cnVjdCBpMmNfY2xp
ZW50ICpjbGllbnQpPz8NCg0Kc3RydWN0IGkyY19kcml2ZXIJKmRyaXZlciA9IGNsaWVudC0+ZGV2
LmRyaXZlcjsNCg0KQW5kIHRoZW4gY2FsbA0KDQptYXRjaCA9IGkyY19tYXRjaF9pZChkcml2ZXIt
PmlkX3RhYmxlLCBjbGllbnQpPz8NCg0KPiANCj4gPiArew0KPiA+ICsgICAgICAgY29uc3Qgc3Ry
dWN0IGkyY19kZXZpY2VfaWQgKm1hdGNoOw0KPiA+ICsNCj4gPiArICAgICAgIG1hdGNoID0gaTJj
X21hdGNoX2RldmljZV9pZChpZCwgY2xpZW50KTsNCj4gPiArICAgICAgIGlmICghbWF0Y2gpDQo+
ID4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVy
biAoY29uc3Qgdm9pZCAqKW1hdGNoLT5kcml2ZXJfZGF0YTsNCj4gDQo+IE9uZSBjYW4gZGlzY3Vz
cyBhYm91dCB0aGUgcmV0dXJuZWQgdHlwZTogcGVyc29uYWxseSwgSSB3b24ndCBtaW5kICJjb25z
dA0KPiB2b2lkICoiIGZvciBjb25zaXN0ZW5jeSB3aXRoIG90aGVyIHN1YnN5c3RlbXMgKGUuZy4g
RFQpLCBidXQgYXMNCj4gaTJjX2RldmljZV9pZC5kcml2ZXJfZGF0YSBoYXMgdHlwZSAia2VybmVs
X3Vsb25nX3QiLCBvdGhlciBwZW9wbGUgbWlnaHQNCj4gcHJlZmVyIHRoZSBsYXR0ZXIuDQoNClRo
ZSBhZHZhbnRhZ2Ugb2Ygdm9pZCosIGlzIHVwcGVyIGxheWVyIGRvbid0IG5lZWQgY2FzdGluZy4N
Cg0KZWc6IHdpdGgga2VybmVsX3Vsb25nX3QgYXMgcmV0dXJuIHBhcmFtZXRlcjoNCg0KaXNsMTIw
OC0+Y29uZmlnID0gKHN0cnVjdCBpc2wxMjA4X2NvbmZpZyAqKWkyY19nZXRfbWF0Y2hfZGF0YTsN
Cg0KQ2hlZXJzLA0KQmlqdQ0KDQoNCg0KPiANCj4gPiArfQ0KPiA+ICtFWFBPUlRfU1lNQk9MKGky
Y19nZXRfbWF0Y2hfZGF0YSk7DQo+IA0K
