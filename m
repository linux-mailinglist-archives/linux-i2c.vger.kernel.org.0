Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63DFC4AC041
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 14:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240015AbiBGNwq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 08:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449307AbiBGNVL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 08:21:11 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70044.outbound.protection.outlook.com [40.107.7.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD85EC043181;
        Mon,  7 Feb 2022 05:21:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m61zRl4SiJ2pdWytjwzceYS9VpcK7REPwSo9+k4uGhrOAaO1w1NRAFUe+Lkgvg+qIepGreZ+If+8gE4dIceI7IlEy8mWsWH2mz6vCwInTgK9J/Ghvy1yobH0j0yb2o6UQ33GfbNtXo5RURlTaZRsqaad/4xwCzPcbxWn9EarwVPfhrMozgBG60JZ9j/uK2rMwajYm3hjmhwXqlw9h0a7R88UKs+qUx50gabeeqqOZnFFnuj23LAwJLnumv6T1fLsD5NOublGTPDI9Sey7KVec/7dL64gWCgeY6tIWGJPeXp7p6brzb60hFC5NoMMseikbNourUb7AKKHPvahyRwd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEcvHTwXecBlIChrhwH8fYWJ4rE6BPQ/CxDVI/yIqME=;
 b=mn/DdA/lkfh50cpIchc2I0TwpO583teiZ+0wZz2pu1NoEwLbF4mPa5qpCP/jdqfSN+Fx8D5IgIFfXCWEHdkFECEb3w2dPawwrPFVZ3nVfJP9MQySEzZLxwPRnKGh9bo2nIA0qIyVqoIV85p3nm4GNW66liIMqiej20j8HlprKKJTwUoFdLR5A5Ss6B6+5AFeMuv0nbAfXOkVqMEZ6bVJPhAFcjdzaCFn4Pgp9D6x6kv14NudbaYgyjPhVqdlpQT/1TWU9/9WK1bukUwAYbB0+1enEL9y1PGAVRrX8E5N6QlOeQ9vBWj5eiZjgYI//PteJ77Et807Hlu8MJaAT/S6Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEcvHTwXecBlIChrhwH8fYWJ4rE6BPQ/CxDVI/yIqME=;
 b=HrbM1T26wiCKK3O/ulLAbCdV0nENGxXr7RDzEsbXV84zyOn1fpsHAVP5BB/x0YGnESfSMma4zfAs/jym258nGZwZklw9FpHmegmD1I0zdV9zFnwu9uNWezQDdRS4mCvPrx1tHIMAJLbfi3syCbV4aQyB8htjffoy8GX+bZxO6oM=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 VI1PR0301MB2527.eurprd03.prod.outlook.com (2603:10a6:800:67::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 13:21:02 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::833:be72:6b04:dca9]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::833:be72:6b04:dca9%7]) with mapi id 15.20.4951.017; Mon, 7 Feb 2022
 13:21:02 +0000
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
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [RFCv3 0/6] TI camera serdes and I2C address translation (Was:
 [RFCv3 0/6] Hi,)
Thread-Topic: [RFCv3 0/6] TI camera serdes and I2C address translation (Was:
 [RFCv3 0/6] Hi,)
Thread-Index: AQHYHBs2RD5e2C8Zu0SeCTUQRW2AkqyIEuOA
Date:   Mon, 7 Feb 2022 13:21:02 +0000
Message-ID: <5aa3e282-3056-2088-9741-6d17273701b4@fi.rohmeurope.com>
References: <20220206115939.3091265-1-luca@lucaceresoli.net>
 <7e5af144-bd5f-cd0e-2109-49b318449a78@ideasonboard.com>
In-Reply-To: <7e5af144-bd5f-cd0e-2109-49b318449a78@ideasonboard.com>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8739c687-5888-4c81-5724-08d9ea3cb00b
x-ms-traffictypediagnostic: VI1PR0301MB2527:EE_
x-microsoft-antispam-prvs: <VI1PR0301MB2527BB0C8C0B4FE0B7707AC2AD2C9@VI1PR0301MB2527.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ijr36lt2iuxtzElwtrVzYTRpzf+Hob2+fNtGFksduhrtEuVVMaLWeRsvM2VYSQMqPuJulH3Aspv3V+ESySmFWW1A3+HC/u2lHahn0XyVw0ks0uPpiv3B5RP0SGdcxy/tcKlodNHgJpBxrbcXZ8kuudIhNKhUqXXVPqWwn8DZykjELBj/9si8+10NsFYNltL14jm0othfT45VAbglxJ2HTcN3JTUWVHppcagSqnaaXp+s4PYjyqbqeVZhYXmxarZZLO49LQN2ExZh2T38CJR6EdK2VIhfKgZCINtkL3oQ7s+Ys1spnoa+WhZ0W1UDfHpvVh1ASft4nRIncT/Qez30yl7kpUaKoxNi+221f8kWO6v83O+Ghc/CQd5ttN2xj/3j6YbDF4fqa4TOJdz2L4OxFKr78Dn/UYwZlFVnmSLVA3bbL35R0VRNWkHAXpbvbKc+WRbwbPI8xBx9uNdRppMO+zzklAO7xgRSK5Ae71l5FLs12VkAcqHTGk3TrMVRRv7WiOAM1Qnxs8AGkyE9MM9w5bGLdIz8vwLE3s5sYOlpTp7IVVZSWyz8TgfIcx11vuP2uCrq8b+rmLF2hsE7lyj5vJLxYd6P8prmlqcivgSYbV6CebWZRu9h8ceMTKsfnRpcYLkCuRcP06Kav9xdbd8NQXv0oKLCWK/er3/yhA33ioPs/qCl0Gv0GhyoDhGJuHnMXOREQ3plEJ376ShNEvZPh3Lihcxhh9ToHGrCH8sRa9eJW4LjykEHkqr8hYWQDmVgkIZwzoHsADB0GkmtQr2oieNzjPfiHbntoGo+4YaFFA/F7RaHw7VDH/w60NV8bDqqS9HctUMgGXk2GrOXCqEY8zKA2M6pfE/i4yOaidVIxuM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(64756008)(53546011)(83380400001)(6512007)(6506007)(31686004)(76116006)(8936002)(66946007)(26005)(2616005)(66476007)(186003)(71200400001)(66556008)(66446008)(508600001)(54906003)(38100700002)(2906002)(316002)(6486002)(966005)(31696002)(5660300002)(38070700005)(110136005)(7416002)(122000001)(86362001)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFVVRmdIT2RGQlM1VmZWdEtFZ0oyRmNRSlUwTnlHeWI1R1pPTkFMZzUxUFhK?=
 =?utf-8?B?TUY1WVp2QUludy8yNDZIM2JNdFJzWU1QekZjMk50bnBDU2lUekRzS2NlcGxR?=
 =?utf-8?B?bjhBeXhlUFBuRkZLUldGTW5LMGhQVWM1dUZkQThpbTBGNHZ2MHVNOW1adGRS?=
 =?utf-8?B?c3QzYU82ZHFNZ0JsTGdscDFtWGJWQWhuc1lMbENLMXg1ZTZObGFyT2ZvN0NI?=
 =?utf-8?B?RE5WVWM4NmljQWRYaE1ydjZ1LzZmbFllc1pEMmJoTzZFTGJxMGN4VU13QWtm?=
 =?utf-8?B?SU9iQ29EYVo5NUhHNllLbmNvV014T3V5dENpRzRaTnYrYTNxeWRwN2ZvOEFi?=
 =?utf-8?B?L1dQQWo4T3JKeEhTWHU4MEozZ3huRUNKa1FOU3h4ODRkdDB1RXI4aW5GVHZj?=
 =?utf-8?B?QmVraWR2TXc5ZjlwSTcweTR1aWJTeUhBdGRKcmNrczJvVzkrdk1ublRDVUNX?=
 =?utf-8?B?SVlDcERSRTFmQWM2bFpoRTJLMUFFeGNXYlFwNUQ3alJkWU1iZmF4VUVTb1JT?=
 =?utf-8?B?eWRjaW1vcDBaNVhYbExrK0E1UlBxaDBab0RXRm1Mc3lJNjF1L1pLQlYwci9H?=
 =?utf-8?B?NTIzWGZMMThNZ3lzS2tFUFRpS0xhb1pJaStuaWt3OUtBQTVpRDgvZFdMYzhl?=
 =?utf-8?B?bWR6WW5IQVVnWnd1MFhEMmtuTjlFMkJBeFYrVTU2RzArSUZLZnNsMU40YWV6?=
 =?utf-8?B?WHlaTXU5MlZybWprQXo4QkVNUDduTlJ1Yk42WENJQ3RVa2cyTWxaMGowMHl2?=
 =?utf-8?B?VnErb1M5UmNGRldHQ1FCRkJ5dEJlQmwrc2haVGdiNUNCQm8xcEQzNHg5NUMx?=
 =?utf-8?B?VEtTM3RXa0Q3dnBIQ3VhT0t2YkgvOWNOZElqd21HSU91WTJPN0VpRTdTVThF?=
 =?utf-8?B?OXN0TW05VERmMUpoY2ZrTjBiMDdZVXEyWXg2OE5YMStqL0EyREVJcjNWc1h0?=
 =?utf-8?B?RmMzTTNuaUR5cG9hQXVpTExKb0oyYXRGcUM2ellyUG5aVlFlUDNTd1g5bnFx?=
 =?utf-8?B?elZySlFGSmtnM01qNXQrTmNwck9heVB6WGRlb1FQWFZodzJ4cFZQeXJqdG9N?=
 =?utf-8?B?SlBrV2lZYjdZWXhvaTRiWm5tQzVqL2pUSUtCYWdFLzU2UStxSFZlYW1iaUFo?=
 =?utf-8?B?aCtXUGIyNkNGMHdBUWdpdWFPV1ZXSGZBbm5BMVRSdFdlUjh3RkRsTlJGUHVZ?=
 =?utf-8?B?R0wybkt1WlZNblFMR0NkVGIvQ1lPVU5nVEFXbWdxR0FXSlM1MytJdldSK0VU?=
 =?utf-8?B?Zi9lTmc0c0JGdWt3aC9UQWpzenp0N3ZSNmsrRkhTZSs4dXl5UkM0S3lSeHM1?=
 =?utf-8?B?TXdhdHd6OGdwOXhWWkVmaEFWM3c2ZVBSUWtTUWQ3YVM1ZVdObVdYTnNqbDNu?=
 =?utf-8?B?NktDL2lOaENicmJ4cDlvT0tlMHkyMWx4Qm81b2I2TE9nNlFmeENCeGNGVDcr?=
 =?utf-8?B?ck1DM0hkbFFpZVI5b081a25zTC94SlFNa0pCaVRYam9TcXE2SVo4WGlLcjFa?=
 =?utf-8?B?UUtWclRMZFU1Ym5LRWE4VTFIeTlub1BacWZRWEQwbElKdU14aStJd2hkZElU?=
 =?utf-8?B?WFJuUTFiV2FxbkU1SkJicTBtNkVHRkxINXR5SzRjN3R2K1hFVnJQT0cxTUd5?=
 =?utf-8?B?YktNTGt1c0hiOFpuQk5xRVNFOG5rdHlsb3EzTG9qM2sxQ2FySjYyQUlIU2Jj?=
 =?utf-8?B?OTJEQ2NFSkJaZWI3c2k4aFVkTVJNdm1WRWt4SjlYdlAzT1lMdzNkV2syVUNx?=
 =?utf-8?B?NzVYMjVENDJ6TUxPTTJMQk9tR0kxakNJb3VVUVlHSTVGdHdudVh6T0hORXR0?=
 =?utf-8?B?SGlQRlFrSUFCYmlRbVM4bWV0M05PcEpQcnQ1VVJUd1VlU3ptSnhITXVMN0hk?=
 =?utf-8?B?YXhHMmFYeFc5YXEzcGRWQnJPRWpvVEEwNWd1ZkEwT29CbkVZdHZ6aHVzS0ho?=
 =?utf-8?B?akJ5M094UWwzbHJOWFFSNFZhT2dvMnBZTk05S0R2N29vVDBiRm43QW1MSnpo?=
 =?utf-8?B?VlJySGV5YmtjRldOUFEybVZVTUU4NUpjaStabEhFYmNhd3JtaThSemFrMHJB?=
 =?utf-8?B?SDlUY2pPdk55dWRBMmd4UzI5Qk1mK2ROaDlxczl4RXJHaUgyaXkvcmR1RU9M?=
 =?utf-8?B?RXJOdks4RWtaejRCY2pWS2owQ2NKd2k1UXhWS1VhZGsvcmovYVVldkRFNjFk?=
 =?utf-8?B?NzNkZDViMW9EMFZESXY3QlpIN2N3bTBid281YlBTeXlHRzd3SEZXUUxnVERR?=
 =?utf-8?B?MWNNRGhTYmlIWlpZeWoyekw5M09ZVEFtbjJuKzc5VlNZY2hTcm05MmY2K0Zw?=
 =?utf-8?Q?Ty61NdX0wMWg7jf02+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCC25CCD5D9C314BB79BC95A5015FB9E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8739c687-5888-4c81-5724-08d9ea3cb00b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 13:21:02.0387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jSywLky0DMaUeHrDP7H1WFw6cFtUJtJw+P+ZpCPHrFCy1bfKmQfHqWANBhqW8xr+93/J7MyQEMLx1fcEEExfPXNfFi9GY1TAeBvhe9rUoflFJyGiZQImzSmv/xsIaBEC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB2527
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgZGVlIEhvIHBlZXBzLA0KDQpPbiAyLzcvMjIgMTQ6MDYsIFRvbWkgVmFsa2VpbmVuIHdyb3Rl
Og0KPiBIaSBMdWNhLA0KPiANCj4gT24gMDYvMDIvMjAyMiAxMzo1OSwgTHVjYSBDZXJlc29saSB3
cm90ZToNCj4+IHRoaXMgUkZDdjMsIGNvZGVuYW1lICJGT1NERU0gRnJpZXMiLCBvZiBSRkMgcGF0
Y2hlcyB0byBzdXBwb3J0IHRoZSBUSQ0KPj4gRFM5MFVCOXh4IHNlcmlhbGl6ZXIvZGVzZXJpYWxp
emVyIGNoaXBzZXRzIHdpdGggSTJDIGFkZHJlc3MgdHJhbnNsYXRpb24uDQoNCi4uc25pcA0KDQo+
PiBFdmVuIHdpdGggdGhlIGFib3ZlIGxpbWl0YXRpb25zIEkgZmVsdCBJJ2Qgc2VuZCB0aGlzIHYz
IGFueXdheSBzaW5jZQ0KPj4gc2V2ZXJhbCBwZW9wbGUgaGF2ZSBjb250YWN0ZWQgbWUgc2luY2Ug
djIgYXNraW5nIHdoZXRoZXIgdGhpcw0KPj4gaW1wbGVtZW50YXRpb24gaGFzIG1hZGUgcHJvZ3Jl
c3MgdG93YXJkcyBtYWlubGluZS4gU29tZSBldmVuIGltcHJvdmVkIG9uDQo+PiB0b3Agb2YgbXkg
Y29kZSBpdCB0aGVpciBvd24gZm9ya3MuIEFzIEkgY2Fubm90IGFmZm9yZCB0byB3b3JrIG9uIHRo
aXMgDQo+PiB0b3BpYw0KPj4gaW4gdGhlIG5lYXIgZnV0dXJlLCBoZXJlIGlzIHRoZSBsYXRlc3Qg
YW5kIGdyZWF0ZXN0IHZlcnNpb24gSSBjYW4gDQo+PiBwcm9kdWNlLA0KPj4gd2l0aCBhbGwgdGhl
IGltcHJvdmVtZW50cyBJIG1hZGUgc28gZmFyLg0KPiANCj4gSSd2ZSBkaXNjdXNzZWQgd2l0aCBM
dWNhIGluIHByaXZhdGUgZW1haWxzLCBidXQgSSdsbCBhZGQgYSBzaG9ydCBzdGF0dXMgDQo+IGFi
b3V0IG15IHdvcmsgaW4gdGhpcyB0aHJlYWQ6DQoNClRoYW5rcyBmb3IgQ0M6aW5nIG1lIEx1Y2Eu
IFdlIGhhZCBhIHNtYWxsIGNoYXQgZHVyaW5nIHRoZSBGT1NERU0uDQoNCj4gQWJvdXQgYSB5ZWFy
IGFnbyBJIHRvb2sgTHVjYSdzIHRoZW4tbGF0ZXN0LXBhdGNoZXMgYW5kIHN0YXJ0ZWQgd29ya2lu
ZyANCj4gb24gdGhlbS4gVGhlIGFpbSB3YXMgdG8gZ2V0IGZ1bGwgbXVsdGlwbGV4ZWQgc3RyZWFt
cyBzdXBwb3J0IHRvIHY0bDIgc28gDQo+IHRoYXQgd2UgY291bGQgc3VwcG9ydCBDU0ktMiBidXMg
d2l0aCBtdWx0aXBsZSB2aXJ0dWFsIGNoYW5uZWxzIGFuZCANCj4gZW1iZWRkZWQgZGF0YSwgYW5k
IGFmdGVyIHRoYXQsIGFkZCBzdXBwb3J0IGZvciBmcGRsaW5rIGRldmljZXMuDQo+IA0KPiBTaW5j
ZSB0aGVuIEkgaGF2ZSBzZW50IG11bHRpcGxlIHZlcnNpb25zIG9mIHRoZSB2NGwyIHdvcmsgKG5v
IGRyaXZlcnMgDQo+IHlldCwgb25seSB0aGUgZnJhbWV3b3JrIGNoYW5nZXMpIHRvIHVwc3RyZWFt
IGxpc3RzLiBTb21lIHBpZWNlcyBoYXZlIA0KPiBhbHJlYWR5IGJlZW4gbWVyZ2VkIHRvIHVwc3Ry
ZWFtIChlLmcuIHN1YmRldiBzdGF0ZSksIGJ1dCBtb3N0IG9mIGl0IGlzIA0KPiBzdGlsbCB1bmRl
ciB3b3JrLiBIZXJlJ3MgYSBsaW5rIHRvIHYxMCBvZiB0aGUgc3RyZWFtcyBzZXJpZXM6DQo+IA0K
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMTExMzAxNDE1MzYuODkxODc4LTEtdG9t
aS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbS8gDQo+IA0KPiANCj4gSXQgaGFzIGEgbGluayB0
byBteSAobm93IHNsaWdodGx5IG91dGRhdGVkKSBnaXQgYnJhbmNoIHdoaWNoIGNvbnRhaW5zIA0K
PiB0aGUgZHJpdmVyIHdvcmsgdG9vLg0KDQpJIGhhdmUgZmV0Y2hlZCB0aGlzIHRyZWUgZnJvbSBU
b21pIGFuZCBkb25lIHNvbWUgZXhwZXJpbWVudGluZyBvbiANCmFub3RoZXIgU0VSREVTLiBUaGF0
IFNFUkRFUyBpbiBub3QgZnJvbSBUSSBvciBNYXhpbSwgc29tZSBvZiB5b3UgbWF5IA0KZ3Vlc3Mg
dGhlIGNvbXBhbnkgdGhvdWdoIDopIFVuZm9ydHVuYXRlbHkgSSBjYW4ndCBwdWJsaXNoIHRoZSBk
ZXRhaWxzIG9yIA0KdGhlIGNvZGUgZm9yIG5vdyAtIEkgYW0gZGlzY3Vzc2luZyB3aGF0IEkgYW0g
YWxsb3dlZCB0byBwdWJsaXNoLiBNeSANCnBlcnNvbmFsIGdvYWwgaXMgdG8gc2VlIGlmIEkgY291
bGQgd3JpdGUgYSBMaW51eCBkcml2ZXIgZm9yIHRoaXMgDQp5ZXQtYW5vdGhlci1WaWRlby1TRVJE
RVMgYW5kIHNlZSBpZiBpdCBjYW4gb25lIGRheSBnZXQgbWVyZ2VkIHRvIA0KdXBzdHJlYW0gZm9y
IGFueW9uZSBpbnRlcmVzdGVkIHRvIHBsYXkgd2l0aC4NCg0KPiBUaGUgZnBkbGluayBkcml2ZXJz
IGhhdmUgZGl2ZXJnZWQgZnJvbSBMdWNhJ3MgdmVyc2lvbiBxdWl0ZSBhIGJpdC4gVGhlIA0KPiBt
b3N0IG9idmlvdXMgZGlmZmVyZW5jZSBpcyB0aGUgc3VwcG9ydCBmb3IgbXVsdGlwbGV4ZWQgc3Ry
ZWFtcywgb2YgDQo+IGNvdXJzZSwgYnV0IHRoZXJlIGFyZSBsb3RzIG9mIG90aGVyIGNoYW5nZXMg
dG9vLiBUaGUgZHJpdmVycyBzdXBwb3J0IA0KPiBEUzkwVUI5NjAgKG5vIFVCOTU0IGF0IHRoZSBt
b21lbnQpLCBEUzkwVUI5NTMgYW5kIERTOTBVQjkxMy4gVUI5NjAgDQo+IHN1cHBvcnRzIGFsbCB0
aGUgaW5wdXRzIGFuZCBvdXRwdXRzLg0KDQpGb3IgdGhlIHJlY29yZCwgdGhlIFNFUkRFUyBJIGFt
IHdvcmtpbmcgd2l0aCBkb2VzIGFsc28gc3VwcG9ydCANCmNvbm5lY3RpbmcgNCBjYW1lcmFzICg0
IFNFUnMpIHRvIG9uZSBERVMgd2hpY2ggcHJvdmlkZXMgdHdvIENTSS0yIA0Kb3V0cHV0cy4gQXMg
ZmFyIGFzIEkgdW5kZXJzdGFuZCB0aGUgdmlydHVhbCBjaGFubmVsIHN1cHBvcnQgaXMgYWxzbyAN
CnRoZXJlIChpbiB0aGUgSFcpLg0KDQogIEkgaGF2ZSBhbHNvIGRyb3BwZWQgc29tZSBjb2RlIHdo
aWNoDQo+IEkgZGlkIG5vdCBuZWVkIGFuZCB3aGljaCBJIHdhc24ndCBzdXJlIGlmIGl0J3MgY29y
cmVjdGx5IGltcGxlbWVudGVkLCB0byANCj4gbWFrZSBpdCBlYXNpZXIgdG8gd29yayBvbiB0aGUg
bXVsdGlwbGV4ZWQgc3RyZWFtcyB2ZXJzaW9uLiBTb21lIG9mIHRoYXQgDQo+IGNvZGUgbWF5IG5l
ZWQgdG8gYmUgYWRkZWQgYmFjay4NCj4gDQo+IEkgaGF2ZSBub3QgY2hhbmdlZCB0aGUgaTJjLWF0
ciBkcml2ZXIsIGFuZCBteSBmcGRsaW5rIGRyaXZlciB1c2VzICBpdCANCj4gbW9yZSBvciBsZXNz
IHRoZSBzYW1lIHdheSBhcyBpbiBMdWNhJ3MgdmVyc2lvbi4NCj4NCg0KSSBoYXZlIGFsc28gdXNl
ZCB0aGUgQVRSIGRyaXZlciBhcyBpcy4gVGhlIFNFUkRFUyBJIGFtIHdvcmtpbmcgd2l0aCBkb2Vz
IA0KYWxzbyB0aGUgSTJDIGFkZHJlc3MgdHJhbnNsYXRpb24uDQoNCj4gQ29uc2lkZXJpbmcgdGhh
dCB5b3UncmUgbm90IGFibGUgdG8gd29yayBvbiB0aGlzLCBteSBzdWdnZXN0aW9uIGlzIHRvIA0K
PiByZXZpZXcgdGhlIGkyYy1hdHIgcGF0Y2hlcyBoZXJlIChvciBwZXJoYXBzIHNlbmQgdGhvc2Ug
cGF0Y2hlcyBpbiBhIA0KPiBzZXBhcmF0ZSBzZXJpZXM/KSwNCg0KSXQgd291bGQgYmUgX3JlYWxs
eV8gY29vbCB0byBnZXQgdGhlIEFUUiB1cHN0cmVhbS4NCg0KICBidXQgYWZhaWNzIHRoZSBmcGRs
aW5rIGRyaXZlcnMgd2l0aG91dCBtdWx0aXBsZXhlZA0KPiBzdHJlYW1zIGlzIGEgZGVhZC1lbmQs
IGFzIHRoZXkgY2FuIG9ubHkgc3VwcG9ydCBhIHNpbmdsZSBjYW1lcmEgKGFuZCBubyANCj4gZW1i
ZWRkZWQgZGF0YSksIHNvIEkgZG9uJ3Qgc2VlIG11Y2ggcG9pbnQgaW4gcHJvcGVybHkgcmV2aWV3
aW5nIHRoZW0uDQo+IA0KPiBIb3dldmVyLCBJIHdpbGwgZ28gdGhyb3VnaCB0aGUgZnBkbGluayBk
cml2ZXJzIGluIHRoaXMgc2VyaWVzIGFuZCANCj4gY2hlcnJ5LXBpY2sgdGhlIGNoYW5nZXMgdGhh
dCBtYWtlIHNlbnNlLiBJIHdhcyBhYm91dCB0byBzdGFydCB3b3JraW5nIG9uIA0KPiBwcm9wZXIg
ZnBkbGluay1jbG9jay1yYXRlIGFuZCBjbGtvdXQgc3VwcG9ydCwgYnV0IEkgc2VlIHlvdSd2ZSBh
bHJlYWR5IA0KPiBkb25lIHRoYXQgd29yayA9KS4NCg0KSSBhbSBub3Qgc3VyZSBpZiBJIGFtIHBv
a2luZyBpbiB0aGUgbmVzdCBvZiB0aGUgd2FzcHMgLSBidXQgdGhlcmUncyBvbmUgDQptYWpvciBk
aWZmZXJlbmNlIHdpdGggdGhlIHdvcmsgSSd2ZSBkb25lIGFuZCB3aXRoIFRvbmkncyAvIEx1Y2En
cyB3b3JrLg0KDQpUaGUgVEkgREVTIGRyaXZlcnMgKGxpa2UgdWI5NjAgZHJpdmVyKSBwYWNrcyBw
cmV0dHkgbXVjaCBldmVyeXRoaW5nIA0KdW5kZXIgc2luZ2xlIGRyaXZlciBhdCBtZWRpYS9pMmMg
LSB3aGljaCAoaW4gbXkgb3BpbmlvbikgbWFrZXMgdGhlIA0KZHJpdmVyIHByZXR0eSBsYXJnZSBv
bmUuDQoNCk15IGFwcHJvYWNoIGlzL3dhcyB0byB1dGlsaXplIE1GRCAtIGFuZCBwcmVwYXJlIHRo
ZSByZWdtYXAgKyBJUlFzIGluIHRoZSANCk1GRCAoYXMgaXMgcHJldHR5IHVzdWFsKSAtIGFuZCBw
YXJzZSB0aGF0IG11Y2ggb2YgdGhlIGRldmljZS10cmVlIHRoYXQgDQp3ZSBzZWUgaG93IG1hbnkg
U0VSIGRldmljZXMgYXJlIHRoZXJlIC0gYW5kIHRoYXQgSSBnZXQgdGhlIG5vbiBJMkMgDQpyZWxh
dGVkIERFUzw9PlNFUiBsaW5rIHBhcmFtZXRlcnMgc2V0LiBBZnRlciB0aGF0IEkgZG8ga2ljayBh
bGl2ZSB0aGUgDQpzZXBhcmF0ZSBNRkQgY2VsbHMgZm9yIEFUUiwgcGluY3RybC9HUElPIGFuZCBt
ZWRpYS4NCg0KVGhlIEFUUiBkcml2ZXIgaW5zdGFudGlhdGVzIHRoZSBTRVIgSTJDIGRldmljZXMg
bGlrZSBUb25pJ3MgdWI5NjAgZG9lcy4gDQpUaGUgU0VSIGNvbXBhdGlibGUgaXMgb25jZSBhZ2Fp
biBtYXRjaGVkIGluIE1GRCAoZm9yIFNFUikgLSB3aGljaCBhZ2FpbiANCnByb3ZpZGVzIHJlZ21h
cCBmb3IgU0VSLCBkb2VzIGluaXRpYWwgSTJDIHdyaXRlcyBzbyBTRVIgc3RhcnRzIA0KcmVzcG9u
ZGluZyB0byBJMkMgcmVhZHMgYW5kIHRoZW4ga2lja3MgY2VsbHMgZm9yIG1lZGlhIGFuZCBwaW5j
dHJsL2dwaW8uDQoNCkkgYmVsaWV2ZSBzcGxpdHRpbmcgdGhlIGZ1bmN0aW9uYWxpdHkgdG8gTUZE
IHN1YmRldmljZXMgbWFrZXMgZHJpdmVycyANCnNsaWdodGx5IGNsZWFyZXIuIFlvdSdsbCBnZXQg
R1BJT3MvcGluY3RybCB1bmRlciBwaW5jdHJsIGFzIHVzdWFsLCANCnJlZ21hcHMvSVJRLWNoaXBz
IHVuZGVyIE1GRCBhbmQgb25seSBtZWRpYS92NGwyIHJlbGF0ZWQgcGFydHMgdW5kZXIgbWVkaWEu
DQoNCkFueXdheXMgLSBJIG9wZW5lZCB0aGUgbWFpbCBjbGllbnQgdG8ganVzdCBzYXkgdGhhdCB0
aGUgQVRSIGhhcyB3b3JrZWQgDQpuaWNlbHkgZm9yIG1lIGFuZCBzZWVtcyBwcmV0dHkgc3RhYmxl
IC0gc28gdG8gbWUgaXQgc291bmRzIGxpa2UgYSBnb29mIA0KaWRlYSB0byBnZXQgQVRSIHJldmll
d2VkL21lcmdlZCBldmVuIGJlZm9yZSB0aGUgZHJpdmVycyBoYXZlIGJlZW4gZmluYWxpemVkLg0K
DQpUaGFua3MgZm9yIHNob3dpbmcgdGhlIHdheSBmb3IgdGhlIHJlc3Qgb2YgdXMgTHVjYSAmIG90
aGVycyEgSXQncyBtdWNoIA0KZWFzaWVyIHRvIGZvbGxvdyB0aGFuIGxlYWQgdGhlIHdheSA7KQ0K
DQpCZXN0IFJlZ2FyZHMNCgktLU1hdHRpDQoNCi0tIA0KVGhlIExpbnV4IEtlcm5lbCBndXkgYXQg
Uk9ITSBTZW1pY29uZHVjdG9ycw0KDQpNYXR0aSBWYWl0dGluZW4sIExpbnV4IGRldmljZSBkcml2
ZXJzDQpST0hNIFNlbWljb25kdWN0b3JzLCBGaW5sYW5kIFNXREMNCktpdmloYXJqdW5sZW5ra2kg
MUUNCjkwMjIwIE9VTFUNCkZJTkxBTkQNCg0Kfn4gdGhpcyB5ZWFyIGlzIHRoZSB5ZWFyIG9mIGEg
c2lnbmF0dXJlIHdyaXRlcnMgYmxvY2sgfn4NCg==
