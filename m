Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 301034AD616
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 12:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357066AbiBHLWD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 06:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347455AbiBHJgX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 04:36:23 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBCE1C03FEC0;
        Tue,  8 Feb 2022 01:36:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFRHZOBiyjd1kcu0EABSaTQv8wlmlFbZqE+hETF8jGLAHN5i2ZqO2FZN080VKqwTFOIuiH+pbIlfgfc+rGYUBpikJxCUl8ZTF3LxTXJGaPXFH+lx/Yy4lDhCUeVeHuYk1SAJIhO+rsETPNq28O8YIOdlOYK+8BqAcnAjOWjSS/kYNwG7BgLesdpKbvRzfJUdzcz4evjpgKedR7x1gN3riJ09mUaMgEyQBFX6l6z/UqjVxZH22RiJtcF6fjgWhmJasAm0hEcNxwqRFksLyRgC7JGanCN1Ct7e5DlCUXWeZaXWTuxD4BorA46gPPUs9ojtE1ttAUKotkVnC6CNqpwoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWJhijgDWTK631gozSTbnSKXUHEJj044WANkNnQJcsk=;
 b=DfYQSNf0FlMkH4wgoLI9I/2r4Ju/eDJqPGM+PaC6f8r20g0g8ZrPIpehJ5A/oz0f52EJXrYivi1F7/qaIhlTErl59O34IWxYV2JBWof4ryn2q8d9LjkOb3ky+5WIKHCzd5PIq2PXTXmVJFTpZ8xCFp4cTPkDz9evrt/TvaDX8XNTHXYd9d4aVV8Efyjj4BF4M4I6jOvdlm138X6gIT/tiI5BGdJb3vkzvKEVboyGVP5MxSbrx5mwHhTRV0XcBfXtC44MUaDG4cWlN9tRIqub09heohKYqlUPqQ4VInbMXQBDiR1e+PDYvneqFMzehB8P/hbmn60Bh4zZdbfUxJ3LRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWJhijgDWTK631gozSTbnSKXUHEJj044WANkNnQJcsk=;
 b=YYpXwRmMzF4HCBkX/mBB/B1IG+gzx7I3Rr68CLLHdGsSMYul6a4xv4P7zBCK+8aI4zrl6WjdER5oS/8ScXZ0XrGKhiON6aacshKpLlIfCddHS0skSzWXS/HI+XIYcznM1NNoBtUXmTPUCaNOAaMppg4pSNNe9uthNtBh2WeNsxw=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 PR2PR03MB5257.eurprd03.prod.outlook.com (2603:10a6:101:27::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.19; Tue, 8 Feb 2022 09:36:18 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::833:be72:6b04:dca9]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::833:be72:6b04:dca9%7]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 09:36:18 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
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
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFCv3 0/6] TI camera serdes and I2C address translation (Was:
 [RFCv3 0/6] Hi,)
Thread-Topic: [RFCv3 0/6] TI camera serdes and I2C address translation (Was:
 [RFCv3 0/6] Hi,)
Thread-Index: AQHYHBs2RD5e2C8Zu0SeCTUQRW2AkqyIEuOAgAANHYCAAAh/AIAAHWUAgADvUgCAAB5MAIAAEuuA
Date:   Tue, 8 Feb 2022 09:36:17 +0000
Message-ID: <8d534ade-3c38-c040-0953-c1a9fb4e87d7@fi.rohmeurope.com>
References: <20220206115939.3091265-1-luca@lucaceresoli.net>
 <7e5af144-bd5f-cd0e-2109-49b318449a78@ideasonboard.com>
 <5aa3e282-3056-2088-9741-6d17273701b4@fi.rohmeurope.com>
 <74bacec6-35e5-346a-fb05-09ae44fc5592@lucaceresoli.net>
 <608d23fc-eef7-c0dc-de5b-53b140fe2d0f@fi.rohmeurope.com>
 <ef6eec20-6c1b-4c27-e5ad-5fb87300c6ba@ideasonboard.com>
 <c772513f-e60f-8e32-07bd-e3b86f241468@fi.rohmeurope.com>
 <ab71e040-b74e-77a2-86aa-4a537fab2b13@ideasonboard.com>
In-Reply-To: <ab71e040-b74e-77a2-86aa-4a537fab2b13@ideasonboard.com>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5b8141c-b7f4-41ec-7e7b-08d9eae67549
x-ms-traffictypediagnostic: PR2PR03MB5257:EE_
x-microsoft-antispam-prvs: <PR2PR03MB52575E0B79E0D7A71CC8F381AD2D9@PR2PR03MB5257.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hMYuwBRAZNB0d1QZx3Q8B8lIpn7gTqPz5tnGt+xlUVgwZjMXEbQ6KfVtdHLYLUUJUAAcIvl5Ou2PEdyiiebNW+HIrRF/84kNY38QTmkJn+L85lTeF4ujGcgP9TxGd1hAz+x228Nv3GBjSUCkUDLooudTaVrObGVH9Jt4x4bTeyWoTeBjIy1UE8FqWUuQsnHfitTxU6OKvVtXpoXK2Yx8HFGUrzpEbnp+XxHx9BBoAdG4NXAUTlXXmN7AOfziKhepbD6ntfBfdvE9pogI+T10dGbofT/RAa3eHmsaIBxcpR/IMiZOaDE4Myuu1vgJCKayMgkiU4Eh6CfwhJA5f4d2vuF+e+SPnj1zib7aGB8t4V3+0JwzIqYsLyvti+lfVhEsA7nC4NZDyPWwx9PkqKpZK8+p630ZvGK20M2s0a1SPV5hGLhLWRoDLK9NkFsKUg1p2iLXriQi2lnbsZYaglYt+rt5Rn83Qnt8CaNumjzLRD7zLfgKYFntnts+njIDv7zPW8uqeDiDmybRIWCbmZF/cEauKCnLuw9jA/J9IZkXDoJkNusaegKWSE8MNR8HRYihBRMZRAkIzbgkFTUiHiD842+nd7FXkuKUx+xu+ey+sjvnR81zlH7JqCh5OuPzHyq+8tAQdjvn40cCE+mjT2iILjtgaI75OaG0BSq+zuE3I7IFtzjO7KKEXVpQMps5oooClyIJV97SbkKFBKP55tJBjdH0vrYo4F+LNUJqK03JUoe6uO9km4GuOusAtaZGQhyRhq7lLXG4UQHCgDngr6w2WA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(38070700005)(4326008)(66946007)(76116006)(8676002)(508600001)(8936002)(86362001)(31696002)(66446008)(66556008)(64756008)(5660300002)(110136005)(6486002)(316002)(54906003)(6512007)(83380400001)(7416002)(2616005)(53546011)(186003)(26005)(122000001)(38100700002)(71200400001)(31686004)(2906002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlBFNlNqYUgxams3bmc3ZVBKeGlIMzJJbkptandJTE1aNmpkaGFnUTdvMFpS?=
 =?utf-8?B?ZUxkNTVXMFFGdnBOUVNFTnp1a2pqVjFMSFY0UVpFSU5yU3hQbHQrV0M4ZWhp?=
 =?utf-8?B?TlBveThnMWJ6NktMSG5iZW1aZ1VWcG96RUZ6MmdJaDR2akxyb012NytTQTdS?=
 =?utf-8?B?bVVjYkVKVTlBeTAvRjNHTjdzWmlhZlorYWFzYVJ0Q0tyc2N5bStCRkh1WVda?=
 =?utf-8?B?clZWNkZkelhpeFprZDBja0taRUZIZWVWemFmQWtEYnRzaTAxUnRkQ0pmdlg4?=
 =?utf-8?B?b0luWDUxODhXMjlNdFkwSzlHQTN1K0hueDFnS3hwaGFxMkpKU0lvS0ZmcWc3?=
 =?utf-8?B?MlZoR0VtUEZQMENJcVhDNWhvQXI5MGtDM3FJSXlBaUpLQmxYREZ4aThIbFIr?=
 =?utf-8?B?Q1ZHUjIzbzVuMy80SlBCWXpnNmtTRVpGQXpDQ0NGdXVRYzljM3BsaFp1RWxl?=
 =?utf-8?B?MStNOVNmbmdMSkVUMTc5b1VZV0xHdkdqeHNYUisrZ1BSMG9YZmdxSEFNc3o3?=
 =?utf-8?B?R2lCQkdZYVcwYzNXYVBBTUVZOFZpN3NnR2hMbkg3eTR0NmRJaEZubEhEOUsv?=
 =?utf-8?B?RGpmb1djQ01Ya0JZbDhUbklld2FVb1RyYmZNYTJwVmhjNzVmd0haemJWUFUr?=
 =?utf-8?B?YWpqUDk0VkRWNFY1bkVCV0tQbXhrekFWbGFxSEhsNDFLd3B1V3JwK3UzRjJX?=
 =?utf-8?B?S1QxVE9zdThJY1dmMlppSWJBVkR6K3FBd2J0ZUdyd21tZ1ppOHlNQVRrWTJN?=
 =?utf-8?B?czFCME1qYm8xRmpRdDBiR3FnQW4xYnRaTFVEZ0pKV0pmVWNoa3BEZVJLMU9a?=
 =?utf-8?B?dThwdksvL2RwUnpkWm9BOTF2bWlMYjZ4Y2N2NWhtSFpTQ2NXUlFvRGhDL1Bv?=
 =?utf-8?B?a1hvSU9jcHB6SjBrQWtUSUhFWEwxNTZsbm1id1JYZzZsRyszSGxwYVBmTUNG?=
 =?utf-8?B?dU4rRFhHMzFscEFPNXkyWDZpbXZ4NWFKMThzQzhSQjFzT1ljNEhRMVlxYk45?=
 =?utf-8?B?bmtBTkhYUkVQc0F4OTFJNjVLa3I4dklVM3pHSXV3Zk5udlZiL0pIYmZEZEE4?=
 =?utf-8?B?eGdkUFpxT1ZjdlZwME9pWGRXTVIwUzhRNjcwNjB2VU1rVjYrVWlZbXpKZlBP?=
 =?utf-8?B?R0JITXZQTUFGWGY0WlM4SnNmM3Fjb3ZPMHJ4VmdxVzZRbk8vOStYN2dwRTBG?=
 =?utf-8?B?cUxSS0g5N1V2SHVzdjdDUzFwVTFLTG9JTGRQNWlPTE9nbXY0S1lnTXE2alhB?=
 =?utf-8?B?bjN4d1MxNVhLV21NcitUQ1JwNzJIbzdJY0xLdTBZcFFjTzQ3Q2ZIVWxWOUlr?=
 =?utf-8?B?WDhGKy9DbTZrM0hnakIwams5NDU5aWNSbkhDNzNVaGVjcHE1NWRUeE8vdzcw?=
 =?utf-8?B?SDFuT2FCSXJ0c3ZPaGVZM0xFT3Rvbk1NZmc0eEl2S01kdzBPdGMyYkdPSHVW?=
 =?utf-8?B?V3Q4QnU1bXV0SWxRYTlOVlF1MzFCS3g3UDAwVjNtMXIvRkFMb1FRU1ZqdE1u?=
 =?utf-8?B?UCs0TmkzMzQ5QkpoVkxYTDhUeFYxOGVDN0lRam5kL1ljYlRVL2pycG1FNk9O?=
 =?utf-8?B?b0lxOGIrVStRMTZHYXFWZGFRVDEyRWtWVnNqR3hDaWFZWU10d1h3TmJvRFpM?=
 =?utf-8?B?SFlGUEdqYW1waHNPMzh2eWxWQ2ZJN24rRm8vS2VnUm41K1BSTEQvbmlST3Zo?=
 =?utf-8?B?SXpsaGRQb29zb2lyUXh2ajViYkNJRHRKbkdER3FBYVl2UmVhWVZDVE9DYm9U?=
 =?utf-8?B?Q2RLSmJmZkFnc0diZ3ExcVI1UVM0NzZoeW90S0xSRzdQYkowQnN0NzRFM3gy?=
 =?utf-8?B?RFZlelFQbGpRS3JlKzlweWYyeFAvcXVtbzNaR2p4S2lna0FrWFJuVkhJcjVM?=
 =?utf-8?B?MWZhWC9NZmFmclMrQy85YTlkUjRLazJ1ZUhkN3E5UjF5OW5MRllmRVJEZC8y?=
 =?utf-8?B?b2pHUEVGTUg5WTBKY1d2ZVZud3EzYTJHc0RqTndxM2thcVlZZUR5eVo1VDZS?=
 =?utf-8?B?aThNdUFYU3RJN2NjZmtBNFdUQ1o1Q0VwRHZUNmxuN09UOVh0dDN3eWxJd3pz?=
 =?utf-8?B?TnNVeTJFNXZQaDIwak40SVdIQ1pOUW4zQlYzaUpGa0xhcm9ST1QxZEQ0TmFo?=
 =?utf-8?B?VW1GVThIOXZVRnU3SXcwcFEvUE40ZG9YdUJId1RTVE5xQ0ZaSjd6cy9TaXA2?=
 =?utf-8?B?U0pXOUgzdHpaZzJja2lQVWxsbUp1WC9qcjZ0TDNaKytndk5ZTnkrN0pvK1JT?=
 =?utf-8?B?RlJ3YnpFMUZQUUN2ZGRZYnpCWHhhRW11djQvRUxyc3FicnQrY0Q4VE5sbm0w?=
 =?utf-8?Q?z47khtzfSoXHUclrIy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5677270BA2F7A44AE9016557CF39BD8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b8141c-b7f4-41ec-7e7b-08d9eae67549
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 09:36:17.9514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fgi44xvkGMIfsGrUka+gwWFNy4V+WVsHNFHAlCKyAjD+rlhcBMVXnn9RO5HFICvtgmXDpLFb8HA/hXbPb23slaOA/Vptlgl+fgDleSLICcR8RDEU9BcfddSyFjQ/PAI7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5257
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMi84LzIyIDEwOjI4LCBUb21pIFZhbGtlaW5lbiB3cm90ZToNCj4gSSdtIGN1cmlvdXMsIHdo
eSBkbyB5b3UgdGhpbmsgdXNpbmcgTUZEcyBtYWtlcyB0aGUgZHJpdmVyIHNvIG11Y2ggDQo+IGNs
ZWFuZXI/IFRoZSBjdXJyZW50IGZwZGxpbmsgZHJpdmVyIGlzIGluIG9uZSBmaWxlLCBidXQsIHNh
eSwgaWYgd2UgDQo+IHNwbGl0IGl0IHRvIG11bHRpcGxlIGZpbGVzLCBiYXNlZCBvbiB0aGUgZnVu
Y3Rpb24sIHdoaWxlIHN0aWxsIGtlZXBpbmcgDQo+IGl0IGFzIGEgc2luZ2xlIGRyaXZlciwgd291
bGQgdGhhdCBiZSBzbyBtdWNoIGRpZmZlcmVudCBmcm9tIGFuIE1GRCANCj4gc29sdXRpb24/IElz
IHRoZXJlIHNvbWV0aGluZyBpbiB0aGUgTUZEIGFwcHJvYWNoIHRoYXQgbWFrZXMgdGhlIGNvZGUg
DQo+IHNpbXBsZXI/DQoNCkZhaXIgcXVlc3Rpb24uDQoNCkkgcGVyc29uYWxseSBoYXZlIHR3byBy
ZWFzb25zIC0gb25lIHRlY2huaWNhbCB3aGljaCBJIGNvdWxkIGp1c3QgdGhyb3cgDQpoZXJlIGFu
ZCBob3BlIGV2ZXJ5b25lIGJ1eXMgaXQgOikgQnV0IEkgdGhpbmsgdGhlIG1haW4gcmVhc29uIGZv
ciBtZSB0byANCmluaXRpYWxseSB0aGluayBvZiBNRkQgaXMgbm90IGEgdGVjaG5pY2FsIG9uZS4N
Cg0KTGFzdCBmZXcgeWVhcnMgSSd2ZSBzcGVudCB3b3JraW5nIHdpdGggUE1JQ3MvY2hhcmdlcnMg
LSB3aGljaCB3ZXJlIE1GRCANCnRvIHRoZSBib25lLiBCZWZvcmUgdGhhdCBJIHdvcmtlZCBvbiBh
IHByb3ByaWV0YXJ5IGNsb2NraW5nL2FsbC1wdXJwb3NlIA0KRlBHQSBhcyB3ZWxsIGFzIHdpdGgg
QVNJQyByb3V0aW5nIFJQMy9SUDMwMSBsaW5rcyArIHByb3ZpZGluZyB0aW1pbmcgDQpmYWNpbGl0
aWVzIC8gY2xvY2tzLiBUaG9zZSB3ZXJlIGFsc28gTUZEIGRldmljZXMgLSBhbmQgb25lIG9mIHRo
b3NlIHVzZWQgDQpNRkQgZHJpdmVycywgdGhlIG90aGVyIGRpZG4ndCBhbHRob3VnaCBpdCByZWFs
bHkgc2hvdWxkIGhhdmUuDQoNClNvIHRoZSBub24gdGVjaG5pY2FsIHJlYXNvbiBmb3IgbWUgaXMg
dGhhdCBJIGFtIHVzZWQgdG8gc2VlaW5nIA0KbXVsdGktZnVuY3Rpb24gZGV2aWNlcyBpbXBsZW1l
bnRlZCBhcyBNRkQgZGV2aWNlcyAtIGhlbmNlIEkgaW1tZWRpYXRlbHkgDQpzYXcgdGhlIFNFUkRF
UyBhcyBvbmUgdG9vLg0KDQpPbmUgdGhlIHRlY2huaWNhbCBiZW5lZml0IGZyb20gTUZEIGlzIHRo
YXQgaXQgKGluIG1hbnkgY2FzZXMpIGFsbG93cyBvbmUgDQp0byB1c2Ugc3RhbmRhcmQgd2F5IHRv
IHJlLXVzZSBjb2RlLiBFZywgaXQncyBub3QgYSByYXJlIGNhc2UgdGhhdCBzYW1lIA0KSFcgYmxv
Y2tzIGFyZSB1c2VkIGluIG1hbnkgcHJvamVjdHMuIE9uZSBjYW4gZm9yIGV4YW1wbGUgc2VlIHRo
cmVlIA0KZGlmZmVyZW50IFBNSUNzLCBhbGwgaGF2aW5nIHNhbWUgUlRDIGFuZCBjbGsgYmxvY2tz
LCB3aGlsZSBkaWZmZXJlbnQgDQpyZWd1bGF0b3JzIGFuZCBHUElPcyAtIG9yIHNvbWUganVzdCBv
bWl0dGluZyBvbmUgb2YgdGhvc2UuDQoNCk1GRCBhbGxvd3MgJ2NvbGxlY3RpbmcnIHRoZXNlIElQ
IGJsb2NrcyB1bmRlciBkaWZmZXJlbnQgdW1icmVsbGFzIGJ5IA0Ka2lja2luZyBzYW1lIHN1YmRl
dmljZXMgYWxpdmUgdmlhIGRpZmZlcmVudCBNRkQgZGV2aWNlcyBpbiBhIHN0YW5kYXJkIA0Kd2F5
LiBUaGUgSVAgYmxvY2sgKHNheSBHUElPIGNvbnRyb2xsZXIpIHdlIGFyZSBkcml2aW5nIGNhbiBi
ZSANCmltcGxlbWVudGVkIG9uIFNFUiBjb25uZWN0ZWQgYnkgRlBETElOSyBJSUkgdG8gREVTIC0g
b3IgaXQgY2FuIGJlIA0KaW1wbGVtZW50ZWQgaW4gUE1JQyAtIHRoZSBhYnNvbHV0ZWx5IHNhbWUg
c3RhbmRyZCAobWZkIHN1YikgcGxhdGZvcm0gDQpHUElPIGRyaXZlciBjYW4gYmUgdXNlZCBpbiBi
b3RoIGNhc2VzLg0KDQpPdGhlciB0aGFuIHRoYXQsIHRoZSB1c2Ugb2YgTUZEIGFsbG93cyBvbmUg
dG8gd3JpdGUgcGluY3RybC9ncGlvIGRyaXZlciANCmFzIGFueSBwaW5jdHJsL2dwaW8gcGxhdGZv
cm0gZGV2aWNlIGRyaXZlci4gSXQgd2lsbCBiZSBsb29raW5nIGZhbWlsaWFyIA0KdG8gYW55b25l
IHdobyBoYXMgd29ya2VkIHdpdGggcGluY3RybC9ncGlvIC0gZXZlbiBpZiBoZSBoYXMgbmV2ZXIg
c2VlbiANCm1lZGlhL3Y0bDIgOykgVGhpcyBpcyB3aGVyZSBteSB0aG91Z2h0IG9mIGNsYXJpdHkg
Y2FtZSBmcm9tLg0KDQoNClJlc3QgaXMgc2xpZ2h0bHkgb2ZmdG9waWMgLSB5b3UgY2FuIHN0b3Ag
cmVhZGluZy4NCg0KSSBhbSBub3Qgc3VyZSBob3cgVEkgZG9lcyB0aGlzIGFuZCBpZiB5b3Uga25v
dyB3aGV0aGVyIHNhbWUgYmxvY2tzIGNhbiANCmJlIHVzZWQgaW4gb3RoZXIgZGV2aWNlcy4gSSBq
dXN0IGhhdmUgbGVhcm5lZCBuZXZlciB0byB0cnVzdCBpdCB3aGVuIGEgDQpIVyBlbmdpbmVlciAo
aW4gTm9raWEsIFJvaG0gb3Igb3RoZXIgY29tcGFueSkgdGVsbHMgbWUgInRoaXMgaXMgdGhlIGxh
c3QgDQpJQyB1c2luZyB0aGlzIHRlY2hub2xvZ3kiLiBJdCBtYXkgYmUgbXkgcHJvYmxlbSB0aG91
Z2ggYXMgbm9yIGRvIEkgYnV5IA0KaXQgaWYgc29tZW9uZSBzYXlzIG1lOiAidGhlIG5leHQgdmVy
c2lvbiB3aWxsIGJlIGp1c3Qgc2FtZSB0byB0aGlzIA0KcHJldmlvdXMgLSB0aGVyZSBpcyBubyBz
b2Z0d2FyZSBpbXBhY3QiIDpyb2xsZXllczogSSBmb3IgZXhhbXBsZSBvbmNlIA0KaGVhcmQgdGhh
dCB3aGVuIHRoZSAibmV4dCBwcm9kdWN0IiBtYWludGFpbmVkIHNhbWUgcmVnaXN0ZXIgb2Zmc2V0
cyBmb3IgDQpzb21lIGZ1bmN0aW9ucyAtIGJ1dCBkaWQgYWRkIG5ldyBvbmVzIC0gYW5kIGNoYW5n
ZWQgdGhlIHJlZ2lzdGVycyBmcm9tIA0KMTZiaXQgPT4gMzJiaXQgYW5kIGNvbm5lY3RpbmcgYnVz
IGZyb20gUENJZSA9PiBJMkMuLi4gSSByZW1lbWJlciB0aGF0IA0KcHJvamVjdCB3aXRoIGEgbmlj
a25hbWVzICdyZS1lc3RpbWF0ZScgJ3Jlc2NoZWR1bGUnIGFuZCAncGFuaWMtYnV0dG9uJyA6KQ0K
DQpZb3Vycw0KCS0tIE1hdHRpDQoNCi0tIA0KVGhlIExpbnV4IEtlcm5lbCBndXkgYXQgUk9ITSBT
ZW1pY29uZHVjdG9ycw0KDQpNYXR0aSBWYWl0dGluZW4sIExpbnV4IGRldmljZSBkcml2ZXJzDQpS
T0hNIFNlbWljb25kdWN0b3JzLCBGaW5sYW5kIFNXREMNCktpdmloYXJqdW5sZW5ra2kgMUUNCjkw
MjIwIE9VTFUNCkZJTkxBTkQNCg0Kfn4gdGhpcyB5ZWFyIGlzIHRoZSB5ZWFyIG9mIGEgc2lnbmF0
dXJlIHdyaXRlcnMgYmxvY2sgfn4NCg==
