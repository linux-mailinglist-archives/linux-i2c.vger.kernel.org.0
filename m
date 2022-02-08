Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD964AD1B0
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 07:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347329AbiBHGkP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 01:40:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233449AbiBHGkP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 01:40:15 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60048.outbound.protection.outlook.com [40.107.6.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE402C0401EF;
        Mon,  7 Feb 2022 22:40:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jM9lm+rlYsHvLmUZAB5ObwM/r3I9ur08r4MaEIhZAx/E4uocaxxZI06et76EbYoDV4SMnAvF6pozVgzKTHoP063Cj3yHTXz5h5ZgqhnmKOAs36aZrFFTjJm/l69t8ufIlKhd5B8DFnPYzjyMVqB8ZZFxFu8l/fp2GLxZnPw5Cz87edK2CtySTJADqMdHOVg/Lyon8vHKwulMAxi91NS2ROLdkYRzgyPu166t/rhkc138jtdbU2Rky/Dn92VA/PKU0R6TPNjL31IjNJ1s4UWD5J03RKIjRLmbIEEYlNgSZeVMEdoAbdNnL6hzxTiqSy1bJBnWJAt1gpGauIHoQrb0nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUzeP1kxIUOlP4+ot68HHn1zJhDCk6tbCuD7O4bwvkc=;
 b=kWL1Foo9F/H8EQg9dx9/uwL9L9FOpCF8Sd6BiGJb8wA4WKRQom8wbKZz4ne7RTHwpXwhCqG1cRPpeHc+85dlYnbvtPI6yYAENmju1SsRgAgnICLvRuBbg/kXRHAMyOJ/RaMv3yi9LqtKWZDz+HGFGgTkk3fOcVpiwA5JJ5mhG+rYLh4nVYQPhvdOk5TR0wSq4OQvas7ofBgAOdfVFKCR6B5qHlrISK5x1Ke8vudVH48A05xKzr9pKf25YVq5sfMBHfDyguDMNWOdpcyHzf0wSuioGRPAzuvx7lfT9yuofOodxwf4HyFSQjRv78KN42DfNBWMDaI/2QotXMEiPoQB/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUzeP1kxIUOlP4+ot68HHn1zJhDCk6tbCuD7O4bwvkc=;
 b=QnpMura3n6cudpmVT0mEDLl7XkkDE8s4d1yEgb73+/WGeyxpKT924Ml5KQCAwwdDWDAPQCh3QwFbwj7LmIe7QJ45Fm0DIzL973a+6XJqzeBsGpE8Upj0XZ6lzHfAMPrNOpIHrbnCoAzqqr7vEIZi3VV1TPg4ly2qkWxGNX344p8=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 VI1PR03MB4880.eurprd03.prod.outlook.com (2603:10a6:803:c0::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.18; Tue, 8 Feb 2022 06:40:09 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::833:be72:6b04:dca9]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::833:be72:6b04:dca9%7]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 06:40:08 +0000
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
Thread-Index: AQHYHBs2RD5e2C8Zu0SeCTUQRW2AkqyIEuOAgAANHYCAAAh/AIAAHWUAgADvUgA=
Date:   Tue, 8 Feb 2022 06:40:08 +0000
Message-ID: <c772513f-e60f-8e32-07bd-e3b86f241468@fi.rohmeurope.com>
References: <20220206115939.3091265-1-luca@lucaceresoli.net>
 <7e5af144-bd5f-cd0e-2109-49b318449a78@ideasonboard.com>
 <5aa3e282-3056-2088-9741-6d17273701b4@fi.rohmeurope.com>
 <74bacec6-35e5-346a-fb05-09ae44fc5592@lucaceresoli.net>
 <608d23fc-eef7-c0dc-de5b-53b140fe2d0f@fi.rohmeurope.com>
 <ef6eec20-6c1b-4c27-e5ad-5fb87300c6ba@ideasonboard.com>
In-Reply-To: <ef6eec20-6c1b-4c27-e5ad-5fb87300c6ba@ideasonboard.com>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 798f50a0-255b-426d-5aed-08d9eacdd99b
x-ms-traffictypediagnostic: VI1PR03MB4880:EE_
x-microsoft-antispam-prvs: <VI1PR03MB48807AA99147A3631B351F3BAD2D9@VI1PR03MB4880.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z6ZE98WBeksugGPZgdpTGvLlAYDx0u8bWzV19AjMystJD71tdxRHoRGWDGtWtOvAPWngN3DcVwMq2x3fw6+AhEyFNjyoOTIpbVcQrLq905lYMFORu1LF96e4bmNC/5e/Ye9QKhQlX2uOYWOne739yiZMn5xcGZpfiauWmyWgK1+hE4t2U6bAypTD36ywKV28XPv7bkIp7CjSwvKB+QDOeNd//Ab1naCdeqDAh03F94A0oq/0tvtQy4tJ2nZedhwBfr9ezfI5gLBAySc0lvVj5nHMPff45r7fPO4Powc17/u8wRCeidNPxvJvnIKMFciTsOGbIpvFyQfO5QHkRVEim/1wKkIjdfxefvEGUPOFSKjQQ5seb9U5lQGG/s9LHMk8zY2h4yrMtg6k09NJ7bRcQrmowEj2no94j2JAwBDbZWgUeJMjq/NWHSXDuaBB3nSygbEiZLKq4Suc5ST/7MWO1DlXq1roXrPw00g36/THVWnDkM9W8wU5HBlYVQkIS1d1mncjQzWiKwrFbJfLUlDT2KHHCW3Nc85NhGGSx7CLOQfSNLHZCKCSERwSljWSsFcPnXcFs6mOUzaNUtNNXTpH4U6SB3zrdtk51JtFhJrVH7EySt0rYAbCSdZUEKlpDA4B83RP7xhTnS1RHDWdJv2KvNOxj8l2i/keSxswTw5+mZO2F2d9PN0iJ7Zpgdpof7F0n/sKMpHTi9m3aAu52gm5ue7Up3YX+KvU4CUrclQdE8G5pM9UVUBGZAHwSxwgdy9/kpvHAJeWHITQNnqUTvvGwDJ8yu+Yhr2YiUBmy8wqRPaUdZHAWTWya/XQVu+xWu9jUVuO9OkDM/HK1XwhTaUWvqgQi2NhrgCJXHNDyflFyRQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(76116006)(8936002)(38070700005)(66946007)(64756008)(66476007)(66556008)(54906003)(316002)(110136005)(122000001)(71200400001)(8676002)(66446008)(53546011)(83380400001)(5660300002)(6486002)(38100700002)(186003)(26005)(2906002)(2616005)(31686004)(31696002)(6512007)(7416002)(966005)(6506007)(86362001)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTViNm1IOXVuanpyVjdDQk96WnA2eVVtNXRXci82NGs1WFM1VmRLTGdtTjVG?=
 =?utf-8?B?elp5RCs4UlBDb21mdXZLYTZDaURkQUwxOVRzWW94SW5SSzUxL1grdjBlZU5m?=
 =?utf-8?B?akZpL0trR0FsMkcyU1ptYmgrQXBlOHFreFMrenpPbWVYUXF4UTNlZmtmbU9i?=
 =?utf-8?B?MytPUWlSUUhyOXlKL3FNOGlhVjlSUjU2T3R5eDJBbWZndzFNQ0R0d2FjV1o0?=
 =?utf-8?B?VUJRdnJnODl3dlRxajRRTDRaVlRMN1J6aVVEbFlrSHloZUx2Z2krMHltcE5W?=
 =?utf-8?B?KzhuTXZ4ZWVJWjRBNHd3SVlaTTJWeG1QZDZLN3BEbWI0MnRkamtYelVydUEv?=
 =?utf-8?B?cVFMUlhORlZkNDU5QVp3Q25hNC9kbVZxRk10RTZSU2ZCT0RLc2hsTXY5MGhZ?=
 =?utf-8?B?ejRwRGVHbzJmandVdVk3eno1K0xBSXVMMmVwMDRzWTRxcFpQTjBVNTdqZG5L?=
 =?utf-8?B?ZGdXQkRkK1YzMnRJVjd3NjlxaDhiRzF3bEljbFhGSW8zSUZRNDVnMFRHME9B?=
 =?utf-8?B?UitjOFUvS0lJZW92TTV2SjBZWnZsMXF0UUVtSi9uc1NMME5RcnFzTjJwd01t?=
 =?utf-8?B?YWErbElLUVFiSmhtSkczWTZJclppdlI4SmZ0VXJoeC9QWCtnOWZvOUY2SjZX?=
 =?utf-8?B?ZTZTaU5BU0gyS1Jienl1Smo1TlJIWnJUVU1PU250dXFaU3RrTjFCb3IxVWVV?=
 =?utf-8?B?cCtXUC9FYkxpS1laSHdsNENySlN2ZUNDNHc2S1lKTDBaN21rT0ZMQXFkV2lJ?=
 =?utf-8?B?WjlYSE14cHMyeWZucFd5RUcwR2lCT0RBa3RicVE3empOSlBEY0hkdzVQclFs?=
 =?utf-8?B?UW12d0IzbXJGdFZtcjg1OWNYTlRrYi85RklEeWVoSC9xR0w5T0ZqS3hzenNy?=
 =?utf-8?B?dFVvYlErVEpiT21FYzNLMldldkRvK0lmYVVKckVJaFFNSlZad3RSVktuRnB6?=
 =?utf-8?B?YTRtazdHVGtVelRjYWxDcGhoUFV3N1dhbGQrNWZtTC85bXJqOWRZR29CeUZh?=
 =?utf-8?B?eHE4c3EzYzg0MmxvaG5vWkJ6SXl6aUVRaXFwNFlVZGV3TEZxRVkzTXdndlFZ?=
 =?utf-8?B?UjhpUFliajYvdDZrYnBybXBsWU9iYlNLa0krd3FEbENFQlhwR1RVSkxLREQy?=
 =?utf-8?B?TXdISXloa2kzL1hwUFpmb1ppelFlVGRzWFYzSnlXOXMvQjlJeCtPQTZiSGFV?=
 =?utf-8?B?MkdhUHIrRUJZUlBBdlUzMWw5Mm10VTFuUCtseVJkNG8yeVJVVFVIbElrbzE2?=
 =?utf-8?B?aW5hK05rU1RZaURKdkVGMG8yWWRZeFpJbTlSZXFLVmRiV3ZMb0wwakVQRWJS?=
 =?utf-8?B?Nkw1bHJ4ZEk2RElXREszNFd4OTFDNGtVMm95VDRVZnBwdVlCaitpcFZ0RmNy?=
 =?utf-8?B?SzUvbnZIbEl3aWIxa25DTWl3NFRNUFlrWjJpa3FRajlKeXNGOXczbUdTN29S?=
 =?utf-8?B?dkxRZUlvWTJUc1A0bjUvcG9QbGJxQXBiSHpkRjVHT0NZUWRWbmVpZXVKeFpI?=
 =?utf-8?B?Vm82Y0hjNStZbDNiNzQzc2lvUmgzOElLdWtZeUpleDVsak56aHpXVnhhY1NX?=
 =?utf-8?B?bThNVU1HRGdZSncyUWlpUU54QlRhcTZyZjBrVkFJRm9uRk9nR1JhYW84RmN1?=
 =?utf-8?B?VnNTYjNVSDNxWU5SbndXbkN1enY3Z2YvMnU0b3JHSUR0SXJYTThFV2VXNW4y?=
 =?utf-8?B?UzZqNzFkd2MrdUZOQVpvS2NEZVNldEhIaHc2Wm9wMFpucnFVTlZWbTFRZmVI?=
 =?utf-8?B?UVRhdjVmd2JhZFpGbEdta2o5K2Z6R0l4NW9HNHFTcW1ONVppK0Y2TzlFZmZW?=
 =?utf-8?B?MFBNUDZrbW5TWStoV3RKV2RCQ0hKK1FLVHRwT2hnR01tMDFjZ2luV2NHbms1?=
 =?utf-8?B?QW5WYjVKSVdRM1NxM3hwZ1J5RGRRSVk4RkMvU1lPbDFnaU92YnBHck41NHZY?=
 =?utf-8?B?L3ZIcmdHTnhrTGFjbGxmdEw5dCttL3A2QjZzTWVxVUVZM01WRE91Z3FJVDJ2?=
 =?utf-8?B?VFk2c0RTUzBtb0p1eFJtOXVCMTlxNnBpVWN2dkx1VXFvUkMrVUo1ZkZNT1c2?=
 =?utf-8?B?SjkyaTN3elZjNXgrdGo0endCY1kwenFtRnRTN0R4aU9PVTVCR3VieTJwK3Fv?=
 =?utf-8?B?THhyS2lEdnJVUi9DZ2NhcEt6ZDArb2RZYjluaUdWeHhjV1p1d09hME1zOEI0?=
 =?utf-8?B?dnM5SzNyODQyQmNIcmxBeW8weG1MK3hTRnBYWGhpSEFvWmpobkI1aVpVSDRt?=
 =?utf-8?B?VFRjSHlCQ0pRTWpXb1pkaFdUZ3dDejYzYlVRQXpKRFRzb3A3TVFGNSthK3Fo?=
 =?utf-8?Q?WvwXR3e7fnMDlw7tNt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F5FA025DC7D424D999BF103399E3F21@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 798f50a0-255b-426d-5aed-08d9eacdd99b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 06:40:08.8262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +RYFyS1cuZeTAkhMfgQe5E+qO3C/q/X5qzyuuGE/R2LN10g4nXrPMKPNBLEZoA9EKGftY4gMLX7qbrz6lc+z67Tdk5pTpeEbXhXvGO8EZy+z2XSbj2ARb3Jw31cVNnZV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4880
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

TW9ybmluZyBUb21pLA0KDQpPbiAyLzcvMjIgMTg6MjMsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOg0K
PiBPbiAwNy8wMi8yMDIyIDE2OjM4LCBWYWl0dGluZW4sIE1hdHRpIHdyb3RlOg0KPj4gSGkgYWdh
aW4gTHVjYSwNCj4+DQo+PiBPbiAyLzcvMjIgMTY6MDcsIEx1Y2EgQ2VyZXNvbGkgd3JvdGU6DQo+
Pj4gSGkgTWF0dGksDQo+Pj4NCj4+PiBPbiAwNy8wMi8yMiAxNDoyMSwgVmFpdHRpbmVuLCBNYXR0
aSB3cm90ZToNCj4+Pj4gSGkgZGVlIEhvIHBlZXBzLA0KPj4+Pg0KPj4+PiBPbiAyLzcvMjIgMTQ6
MDYsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOg0KPj4+Pj4gSGkgTHVjYSwNCj4+Pj4+DQo+Pj4+PiBP
biAwNi8wMi8yMDIyIDEzOjU5LCBMdWNhIENlcmVzb2xpIHdyb3RlOg0KPj4+Pj4+IHRoaXMgUkZD
djMsIGNvZGVuYW1lICJGT1NERU0gRnJpZXMiLCBvZiBSRkMgcGF0Y2hlcyB0byBzdXBwb3J0IHRo
ZSBUSQ0KPj4+Pj4+IERTOTBVQjl4eCBzZXJpYWxpemVyL2Rlc2VyaWFsaXplciBjaGlwc2V0cyB3
aXRoIEkyQyBhZGRyZXNzIA0KPj4+Pj4+IHRyYW5zbGF0aW9uLg0KPj4+Pg0KPj4+Pg0KPj4+PiBJ
IGFtIG5vdCBzdXJlIGlmIEkgYW0gcG9raW5nIGluIHRoZSBuZXN0IG9mIHRoZSB3YXNwcyAtIGJ1
dCB0aGVyZSdzIG9uZQ0KPj4+PiBtYWpvciBkaWZmZXJlbmNlIHdpdGggdGhlIHdvcmsgSSd2ZSBk
b25lIGFuZCB3aXRoIFRvbmkncyAvIEx1Y2EncyB3b3JrLg0KPj4+DQo+Pj4gWW91IGFyZS4gOykN
Cj4+Pg0KPj4+PiBUaGUgVEkgREVTIGRyaXZlcnMgKGxpa2UgdWI5NjAgZHJpdmVyKSBwYWNrcyBw
cmV0dHkgbXVjaCBldmVyeXRoaW5nDQo+Pj4+IHVuZGVyIHNpbmdsZSBkcml2ZXIgYXQgbWVkaWEv
aTJjIC0gd2hpY2ggKGluIG15IG9waW5pb24pIG1ha2VzIHRoZQ0KPj4+PiBkcml2ZXIgcHJldHR5
IGxhcmdlIG9uZS4NCj4+Pj4NCj4+Pj4gTXkgYXBwcm9hY2ggaXMvd2FzIHRvIHV0aWxpemUgTUZE
IC0gYW5kIHByZXBhcmUgdGhlIHJlZ21hcCArIElSUXMgaW4gDQo+Pj4+IHRoZQ0KPj4+PiBNRkQg
KGFzIGlzIHByZXR0eSB1c3VhbCkgLSBhbmQgcGFyc2UgdGhhdCBtdWNoIG9mIHRoZSBkZXZpY2Ut
dHJlZSB0aGF0DQo+Pj4+IHdlIHNlZSBob3cgbWFueSBTRVIgZGV2aWNlcyBhcmUgdGhlcmUgLSBh
bmQgdGhhdCBJIGdldCB0aGUgbm9uIEkyQw0KPj4+PiByZWxhdGVkIERFUzw9PlNFUiBsaW5rIHBh
cmFtZXRlcnMgc2V0LiBBZnRlciB0aGF0IEkgZG8ga2ljayBhbGl2ZSB0aGUNCj4+Pj4gc2VwYXJh
dGUgTUZEIGNlbGxzIGZvciBBVFIsIHBpbmN0cmwvR1BJTyBhbmQgbWVkaWEuDQo+Pj4+DQo+Pj4+
IFRoZSBBVFIgZHJpdmVyIGluc3RhbnRpYXRlcyB0aGUgU0VSIEkyQyBkZXZpY2VzIGxpa2UgVG9u
aSdzIHViOTYwIGRvZXMuDQo+Pj4+IFRoZSBTRVIgY29tcGF0aWJsZSBpcyBvbmNlIGFnYWluIG1h
dGNoZWQgaW4gTUZEIChmb3IgU0VSKSAtIHdoaWNoIGFnYWluDQo+Pj4+IHByb3ZpZGVzIHJlZ21h
cCBmb3IgU0VSLCBkb2VzIGluaXRpYWwgSTJDIHdyaXRlcyBzbyBTRVIgc3RhcnRzDQo+Pj4+IHJl
c3BvbmRpbmcgdG8gSTJDIHJlYWRzIGFuZCB0aGVuIGtpY2tzIGNlbGxzIGZvciBtZWRpYSBhbmQg
DQo+Pj4+IHBpbmN0cmwvZ3Bpby4NCj4+Pj4NCj4+Pj4gSSBiZWxpZXZlIHNwbGl0dGluZyB0aGUg
ZnVuY3Rpb25hbGl0eSB0byBNRkQgc3ViZGV2aWNlcyBtYWtlcyBkcml2ZXJzDQo+Pj4+IHNsaWdo
dGx5IGNsZWFyZXIuIFlvdSdsbCBnZXQgR1BJT3MvcGluY3RybCB1bmRlciBwaW5jdHJsIGFzIHVz
dWFsLA0KPj4+PiByZWdtYXBzL0lSUS1jaGlwcyB1bmRlciBNRkQgYW5kIG9ubHkgbWVkaWEvdjRs
MiByZWxhdGVkIHBhcnRzIHVuZGVyIA0KPj4+PiBtZWRpYS4NCj4+Pg0KPj4+IFRoZXJlIGhhcyBi
ZWVuIHF1aXRlIGEgZmllcnkgZGlzY3Vzc2lvbiBhYm91dCB0aGlzIGluIHRoZSBwYXN0LCB5b3Ug
Y2FuDQo+Pj4gZ3JhYiBzb21lIHBvcGNvcm4gYW5kIHJlYWQNCj4+PiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tZWRpYS8yMDE4MTAwODIxMTIwNS4yOTAwLTEtdnpAbWxlaWEuY29tL1Qv
I205YjAxYWY4MTY2NWFjOTU2YWYzYzZkNTc4MTAyMzk0MjBjM2Y4Y2VlIA0KPj4+DQo+Pj4NCj4+
PiBUTDtEUjogdGhlcmUgaGF2ZSBiZWVuIHN0cm9uZyBvcHBvc2l0aW9uIHRoZSB0aGUgTUZEIGlk
ZWEuDQo+Pg0KPj4gSG0uIEkgbWF5IGJlIG1pc3Npbmcgc29tZXRoaW5nIGJ1dCBJIGRpZG4ndCBz
ZWUgb3Bwb3NpdGlvbiB0byB1c2luZyBNRkQNCj4+IG9yIHNwbGl0dGluZyB0aGUgZHJpdmVycy4g
SSBkbyBzZWUgb3Bwb3NpdGlvbiB0byBhZGRpbmcgX2Z1bmN0aW9uYWxpdHlfDQo+PiBpbiBNRkQu
IElmIEkgcmVhZCB0aGlzIGNvcnJlY3RseSwgTGVlIGRpZCBvcHBvc2UgYWRkaW5nIHRoZSBJMkMg
c3R1ZmYsDQo+PiBzeXNmcyBhdHRyaWJ1dGVzIGV0YyBpbiBNRkQuIFF1b3RpbmcgaGlzIHJlcGx5
Og0KPj4NCj4+ICJUaGlzIGRyaXZlciBkb2VzIHRvbyBtdWNoIHJlYWwgd29yayAoJ3N0dWZmJykg
dG8gYmUgYW4gTUZEIGRyaXZlci4NCj4+IE1GRCBkcml2ZXJzIHNob3VsZCBub3QgbmVlZCB0byBj
YXJlIG9mOyBsaW5rcywgZ2F0ZXMsIG1vZGVzLCBwaXhlbHMsDQo+PiBmcmVxdWVuY2llcyBtYXBz
IG9yIHByb3BlcnRpZXMuwqAgTm9yIHNob3VsZCB0aGV5IGNvbnRhaW4gZWxhYm9yYXRlDQo+PiBz
eXNmcyBzdHJ1Y3R1cmVzIHRvIGNvbnRyb2wgdGhlIGFmb3JlbWVudGlvbmVkICdzdHVmZicuDQo+
Pg0KPj4gR3JhbnRlZCwgdGhlcmUgbWF5IGJlIHNvbWUgY29kZSBpbiB0aGVyZSB3aGljaCBjb3Vs
ZCBiZSBhcHByb3ByaWF0ZQ0KPj4gZm9yIGFuIE1GRCBkcml2ZXIuwqAgSG93ZXZlciBtb3N0IG9m
IGl0IG5lZWRzIG1vdmluZyBvdXQgaW50byBhDQo+PiBmdW5jdGlvbiBkcml2ZXIgKG9yIHR3byku
Ig0KPj4NCj4+IEFuZCBJIHRlbmQgdG8gYWdyZWUgd2l0aCBMZWUgaGVyZS4gSSB3b3VsZCBub3Qg
cHV0IEkyQyBicmlkZ2Ugc3R1ZmYgb3INCj4+IHN5c2ZzIGF0dHJpYnV0ZXMgaW4gTUZELiBCdXQg
SSB0aGluayBpdCBkb2VzIG5vdCBtZWFuIFNFUkRFU2VzIHNob3VsZA0KPj4gbm90IHVzZSBNRkQg
d2hlbiB0aGV5IGNsZWFybHkgY29udGFpbiBtb3JlIElQIGJsb2NrcyB0aGFuIHRoZQ0KPj4gdmlk
ZW8vbWVkaWEgb25lcyA6KSBJIGFtIGNvbmZpZGVudCBMZWUgYW5kIG90aGVycyBtaWdodCBiZSBt
dWNoIG1vcmUNCj4+IHdlbGNvbWluZyBmb3IgZHJpdmVyIHdoaWNoIHNpbXBseSBjb25maWd1cmVz
IHJlZ21hcCBhbmQga2lja3Mgc3ViZHJpdmVyDQo+PiBmb3IgZG9pbmcgdGhlIEFUUiAvIEkyQyBz
dHVmZi4NCj4gDQo+IEkgYWRtaXQgdGhhdCBJIGRvbid0IGtub3cgTUZEIGRyaXZlcnMgdG9vIHdl
bGwsIGJ1dCBJIHdhcyB0aGlua2luZyBhYm91dCANCj4gdGhpcyBzb21lIHRpbWUgYmFjayBhbmQg
SSB3YXNuJ3QgcXVpdGUgc3VyZSBhYm91dCB1c2luZyBNRkQgaGVyZS4NCj4gDQo+IE15IHRoaW5r
aW5nIHdhcyB0aGF0IE1GRCBpcyBmaW5lIGFuZCBnb29kIHdoZW4gYSBkZXZpY2UgY29udGFpbnMg
bW9yZSBvciANCj4gbGVzcyBpbmRlcGVuZGVudCBmdW5jdGlvbmFsaXRpZXMsIGxpa2UgYSBQTUlD
IHdpdGgsIHNheSwgZ3Bpb3MgYW5kIA0KPiByZWd1bGF0b3JzLCBib3RoIG9mIHdoaWNoIGp1c3Qg
d29yayBhcyBsb25nIGFzIHRoZSBQTUlDIGlzIHBvd2VyZWQgdXAuDQo+IA0KPiBIZXJlIGFsbCB0
aGUgZnVuY3Rpb25hbGl0aWVzIGRlcGVuZCBvbiB0aGUgbGluayAoZnBkbGluayBvciBzb21lIG90
aGVyIA0KPiAibGluayIgPSksIGFuZCB0aGUgc2VyaWFsaXplcnMuIEluIG90aGVyIHdvcmRzLCB0
aGUgbGluayBzdGF0dXMgb3IgYW55IA0KPiBjaGFuZ2VzIHRvIHRoZSBsaW5rIG9yIHRoZSBzZXJp
YWxpemVycyBtaWdodCBhZmZlY3QgdGhlIEdQSU8vSTJDL0lSUSANCj4gZnVuY3Rpb25hbGl0aWVz
Lg0KDQpNeSB1c2UgY2FzZSBoYXMgYmVlbiBzdWNoIHRoYXQgb25jZSB0aGUgbGluayBiZXR3ZWVu
IERFUyAmICBTRVIgDQplc3RhYmxpc2hlZCwgaXQgc2hvdWxkIG5vdCBnbyBhd2F5LiBJZiBpdCBk
b2VzIGl0IGlzIHNvbWUga2luZCBvZiBhbiANCmVycm9yIGFuZCB0aGVyZSBpcyBubyByZWNvdmVy
eSBtZWNoYW5pbXMgKGF0IGxlYXN0IG5vdCB5ZXQpLiBIZW5jZSBJIA0KaGF2ZW4ndCBwcmVwYXJl
ZCBmdWxsIHNvbHV0aW9uIGhvdyB0byBoYW5kbGUgZHJvcHBpbmcvcmUtY29ubmVjdGluZyB0aGUg
DQpsaW5rIG9yIHJlLWluaXRpYWxpemluZyBkZXMvc2VyL3NsYXZlcy4NCg0KPiBTbywgSSBkb24n
dCBoYXZlIGFueSBjbGVhciBjb25jZXJuIGhlcmUuIEp1c3QgYSB2YWd1ZSBmZWVsaW5nIHRoYXQg
dGhlIA0KPiBmdW5jdGlvbmFsaXRpZXMgaW4gdGhpcyBraW5kIG9mIGRldmljZXMgbWF5IGJlIG1v
cmUgdGlnaHRseSB0aWVkIA0KPiB0b2dldGhlciB0aGFuIGluIG5vcm1hbCBNRkRzLiBJIGNvdWxk
IGJlIHRvdGFsbHkgd3JvbmcgaGVyZS4NCg0KSSBjYW4ndCBwcm92ZSB5b3UncmUgd3JvbmcgZXZl
biBpZiB0aGF0IHdvdWxkIGJlIHNvIGNvb2wgOnANCg0KSSBndWVzcyBhIGxvdCBvZiB0aGlzIGJv
aWxzIGRvd24gaG93IHRoZSBTRVIgYmVoYXZlcyB3aGVuIGxpbmsgaXMgDQpkcm9wcGVkLiBEb2Vz
IGl0IG1haW50YWluIHRoZSBjb25maWd1cmF0aW9uIG9yIHJlc2V0IHRvIHNvbWUgb3RoZXIgDQpz
dGF0ZT8gQW5kIHdoYXQgaGFwcGVucyBvbiBkZXMgJiB3aGF0IHdlIG5lZWQgdG8gZG8gaW4gb3Jk
ZXIgdG8gcmVjb25uZWN0Lg0KDQpNeSBpbml0aWFsIGZlZWxpbmcgaXMgdGhhdCB0aGUgREVTIHNo
b3VsZCBhbHdheXMgYmUgYXZhaWxhYmxlIGFzIGl0IGlzIA0KZGlyZWN0bHkgY29ubmVjdGVkIHRv
IEkyQy4gU28gREVTIHNob3VsZCBhbHdheXMgYmUgdGhlcmUuDQoNCkFjY2VzcyB0byBTRVJzIGFu
ZCB0aGUgZGV2aWNlcyBvbiByZW1vdGUgYnVzZXMgaXMgbmF0dXJhbGx5IGRlcGVuZGluZyBvbiAN
CnRoZSBsaW5rLiBTbyBkcm9wcGluZyB0aGUgbGluayBtZWFucyBhY2Nlc3MgdG8gU0VScyBhbmQg
cmVtb3RlIGRldmljZXMgDQpzdGFydCBmYWlsaW5nIC0gd2hpY2ggaXMgcHJvYmFibHkgdmlzaWJs
ZSB0byB0aGUgTUZEIHN1Yi1kZXZpY2VzIGFzIA0KZmFpbGluZyByZWdtYXAgYWNjZXNzZXMuIFRo
aXMgbmVlZHMgdGhlbiBhcHByb3ByaWF0ZSBoYW5kbGluZy4NCg0KQWZ0ZXIgdGhhdCBiZWluZyBz
YWlkLCBJIHRoaW5rIHdlIGNhbid0IGdldCBvdmVyIHRoaXMgcHJvYmxlbSBldmVuIHdoZW4gDQpu
b3QgdXNpbmcgTUZELiBBcyBmYXIgYXMgSSByZWFkIHlvdXIgY29kZSwgdGhlIFNFUiBhbmQgREVT
IGhhdmUgDQppbmRlcGVuZGVudCBkcml2ZXJzIGFsc28gd2hlbiBNRkQgaXMgbm90IHVzZWQuIFNv
IGRyb3BwaW5nIHRoZSBsaW5rIGlzIA0Kc3RpbGwgc29tZXRpbmcgdGhhdCBwdWxscyB0aGUgbGVn
cyBmcm9tIHRoZSBTRVIsIHJpZ2h0PyBJIGFsc28gZ3Vlc3MgdGhlIA0KcmVtb3RlIEkyQyBkZXZp
Y2VzIGxpa2Ugc2Vuc29ycyBhcmUgYWxzbyBpbXBsZW1lbnRlZCBhcyBpbmRlcGVuZGVudCBkcml2
ZXJzLg0KDQpXZWxsLCAoSSBob3BlKSBJJ2xsIHNlZSB3aGVyZSBJIGVuZCB1cCB3aXRoIG15IGNv
ZGUuLi4gSXQgcmVhbGx5IG1ha2VzIA0KdGhpcyBkaXNjdXNzaW9uIGEgYml0IGR1bGwgd2hlbiBJ
IGNhbid0IGp1c3Qgc2hvdyB0aGUgY29kZSBmb3IgDQpjb21wYXJpc29uIDovIEkgZG9uJ3QgKHll
dCkgc2VlIHdoeSB0aGUgTUZEIGFwcHJvYWNoIGNvdWxkIG5vdCB3b3JrLCBhbmQgDQpJIHN0aWxs
IHRoaW5rIGl0J3Mgd29ydGggdHJ5aW5nIC0gYnV0IEkgbm93IGNlcnRhaW5seSB1bmRlcnN0YW5k
IHdoeSB5b3UgDQpoZXNpdGF0ZWQgdXNpbmcgTUZELiBUaGFua3MgZm9yIHRha2luZyB0aGUgdGlt
ZSB0byBleHBsYWluIHRoaXMgdG8gbWUuDQoNCkJlc3QgUmVnYXJkcw0KCS0tTWF0dGkNCg0KLS0g
DQpUaGUgTGludXggS2VybmVsIGd1eSBhdCBST0hNIFNlbWljb25kdWN0b3JzDQoNCk1hdHRpIFZh
aXR0aW5lbiwgTGludXggZGV2aWNlIGRyaXZlcnMNClJPSE0gU2VtaWNvbmR1Y3RvcnMsIEZpbmxh
bmQgU1dEQw0KS2l2aWhhcmp1bmxlbmtraSAxRQ0KOTAyMjAgT1VMVQ0KRklOTEFORA0KDQp+fiB0
aGlzIHllYXIgaXMgdGhlIHllYXIgb2YgYSBzaWduYXR1cmUgd3JpdGVycyBibG9jayB+fg0K
