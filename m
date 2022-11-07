Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D39F861FBC8
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 18:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232613AbiKGRr2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 12:47:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232032AbiKGRrM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 12:47:12 -0500
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (mail-be0deu01on2126.outbound.protection.outlook.com [40.107.127.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E2B17A97;
        Mon,  7 Nov 2022 09:47:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLD/mKQG+9z0qtVcVAPQM37X6RR7Yp4AhbnPUzDWQerhOqnIFkZ3XABduFRwk3509HfRrp35FoVCuLyZY1Y8mvEpZHS94kzJ5i/auiTrO1ZFKzo4zeX22DuPaZam5Mp4EkAHtEkgbr006FP9JbrdkPnY63CDzfs8/xZM4IVEtWTx/PteYAuqXjFnOx5z7sXTn84J58VzLZX0gMu8FfyP1VjfgTZGt+Fai4A8dBgT/sQbhOKNVHS7RgNE/rtWaYwTrRlgTqSdubxmiE+FYi/fJmtf/qpu8VVemDv1fDXBoIE13QEhKEZfHo3GD7D+gPUZoF6RXxAyd0nklYHZPWyCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ch75lriZrDObsE9T4y1aCNQI4WflB83oVTXsfBnUVzk=;
 b=NneDOtYVptUEX/DMv/pvq7UEF8F2sCOzrN5/tYqwgZQtE3oKLPDUivPrWUXiN3t6sAfsyuLTDRREOZLxZb9XwWA/K1s0gbOG50y58kS2xqbI9NFCQ6peZ07rjXT/MQ7yARtPyGeG1GEWButjAYcQic/5Kn/NoxJtYuFrT9qB2LyIClb8q5Xib4upBAYCjcfisHtLkk4qjxmrAP6RhmEOEWIq0x68DVmmoZKM4J0Hbrh8ly13j6OUeT4vJQ1rBwy+KCIbjsjw8VicGiLCMxcXlwVJG9iFP4aSoDBPNml4VnaHlSOm5pKTTMzAobfBwFHtf+eq4NgYbFDR0gPsii8FfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductor.onmicrosoft.com;
 s=selector2-rohmsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ch75lriZrDObsE9T4y1aCNQI4WflB83oVTXsfBnUVzk=;
 b=BbNBaAMJdyhebMSnq/u1cAefVOARc6xOctbFgApUqm6ql8eY4y7sndmEZW5XKKDG03Hv7IRz2Zca1vzeFONUukh7A0CNOorcbmV1yJm218V/6RD+rTxIrKeFuQG2SUvBAqvbss+RPKPXeMz9mg4Oq/H01CrDLwZ9IW/Jc7vV7VA=
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:59::10)
 by FR2P281MB1733.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:89::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 17:47:07 +0000
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::33b1:3599:eb56:8fd2]) by BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::33b1:3599:eb56:8fd2%5]) with mapi id 15.20.5791.025; Mon, 7 Nov 2022
 17:47:07 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "satish.nagireddy@getcruise.com" <satish.nagireddy@getcruise.com>
Subject: Re: [PATCH v4 0/8] i2c-atr and FPDLink
Thread-Topic: [PATCH v4 0/8] i2c-atr and FPDLink
Thread-Index: AQHY7fTKrOgLFkwn6kaLMHWF/jZCsK4zkPEAgAAQ2oCAACQyAA==
Date:   Mon, 7 Nov 2022 17:47:07 +0000
Message-ID: <74d8aa71-1133-537d-3de9-e6efd458025f@fi.rohmeurope.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
 <b0319f7c-54af-3132-2775-fba7dcad6bbe@fi.rohmeurope.com>
 <50f0e9a2-33a4-9afb-4105-eadd6da21e99@ideasonboard.com>
In-Reply-To: <50f0e9a2-33a4-9afb-4105-eadd6da21e99@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BEZP281MB2454:EE_|FR2P281MB1733:EE_
x-ms-office365-filtering-correlation-id: 2c0f4484-4775-4b3d-96eb-08dac0e816a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vh1EX8ioOxtNDqefogkdkDMMt4cU5vNVwmFf01Bl7aa9mvvewBZQb9H9d4YRu+9FY8KkG2W70QHpYPUAyznBQAqBjezoltksty0FSCFGZfqGJTO/UPhsl9kpnbzw4vZwXBBMtohvWA4MdlR91I5Zuq9D9678meLLTf3CZAWcZtSed5PsiowUmEr+1ieHxVBcSw3r3tlOunTfJnZwbe/PMfUBbUku/6ZesbAWWD/CfrZ+q4zhMGXE6K5Mwy87ncPuR1DFb/fNiHsy2FbgFrv6M+Jihj6P9930f4rca9Vc4fNM6cYMKMzG64Oa6H340oi/TKITkvYjaD7ucvxyjXP6jIfSpZu14wUm780PnKjHtWeIcb536/2mUSyB9+Q6mRuxg39bIG6LFnhAxIhwIpC5rAho+lrjXXHxeNqwX8HEeV1xMW/akcLNgvGOmhGNQzCf/v41ZPXIvMnC3xjppRMqiHd3X5dY12Kv7cHa2wGgnzL6sM6sJANdnAUhVpZW3dBUq2paxmtvAnp9wejYNdOxAotsA4hqBBH2CEwYxO7VgxVLyudcfKbj4pZziGaN4G+ohEJ4aMFcWN59GIojTjLSkXJ7mJA8q1fPiS4tux3ySsJ5iUGaMsMCtwmejGt1HDHyQ0eL7AV+Xd7vfZPEER4RQpu0jDTWklE9xDsuUneXmvtr1KDa6Pu51ISP5gy/5DgJ+BeBIBDgjZhOGU0J3+DDcDHzEoYbY3+I3CrbTlaJWTwVTyB7xF5pmZDxNEsSXtBVlt4C0NbUKlYtHg8n2ZvJcO0gf+dgluF/ImklWeF5xcHc48wG4MDyCe8DE4u4KZCYAPGAb9Ucolz4fKq2AbVakQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(136003)(376002)(396003)(39840400004)(451199015)(91956017)(8676002)(66556008)(4326008)(66946007)(76116006)(66446008)(66476007)(64756008)(6486002)(71200400001)(316002)(54906003)(110136005)(38100700002)(122000001)(2906002)(7416002)(5660300002)(8936002)(6506007)(38070700005)(186003)(2616005)(6512007)(53546011)(83380400001)(478600001)(31696002)(41300700001)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlhucmRJb3hPZm5ENVhYLzZnRUZUMktlMUZxVTdzNDB2b3ozS1NRSlFvZFdv?=
 =?utf-8?B?cjRMQmxyeDJKcXB2MGh6dDBiRUxvTHRyUERKNnIvSm1DRUpTbUZxbGJDemJx?=
 =?utf-8?B?REJkRlZ1dFdPNGh2d2ZuUEF2ajlKNGFvNE1PUFZlaHVIS2V4ODFxdXlzQ0FI?=
 =?utf-8?B?SnZEM1cvSUtLVFg2bDZJa2tqbVNsWC9lTU9ockRwOHNhUEZlMjdBaUhoYlBs?=
 =?utf-8?B?ZW5iRndLTFQ5amp4dXAxZGVMMDJoZm9LUVp4RDlnRXltS3J0b0lhVTJ3eG12?=
 =?utf-8?B?NzI3dW1XRVZURHpZVEVZb1J2SmkxQmwxVXl4TTJkU3hUYjh6Tm5LODB0TTB4?=
 =?utf-8?B?UW5yT045MDZoK0NYb1hWeEc0UkFFOFA0ZVlUcWZsMTU5LzBsWDgvdnd2aWp3?=
 =?utf-8?B?ZmxCUVlpVzRURVlLY1llMGtDMmliQW1yK05FQU5tczVkUkhkdUVVYXB3V3ow?=
 =?utf-8?B?MDRPaUNVQjh2ZWMrclNCQzJPdWhVcEE5b2llcHAzcEI3WWMrS0tFMjRWL3Z1?=
 =?utf-8?B?OUVpdmZJRERGNG5idGFpem96dm9tTzkrZ2hBN004cjJBY1RlNTk0UGNFN1Q5?=
 =?utf-8?B?Q0ZRMnpYYjFWdVVzZEJjcHd1akxzTkZqNWFhSzNjMzA0WTdOenBsdVZNN0s2?=
 =?utf-8?B?Q2lqRWIyU0p0TCtYdkhsTzZsQnNuZzFtQ081c01KZmlIZUQ2OWVzaDcyMW5S?=
 =?utf-8?B?eEpCTmEwRVZkSG1LYVoxczFJd3FmYWEyVkZlaHdtRmZXQTdVNjNwbGYyVHVR?=
 =?utf-8?B?ZktveURqdVAxZzBNWDhDT2pjRTZBbkxKTmsvMUFIdjI1dTZnUVh6WWd3Wkph?=
 =?utf-8?B?NTZnMEczOE93NXpucXdQb2NMNEdFN1NFTFd2YW1XRmJ0QVQ5RlZ4T3lNRXJx?=
 =?utf-8?B?VlBCMGorLzh0MDQ0SXBoSXQ5Q2JXQ3RleGhITE5YVXUrR0NQbmZ1a1liUnZh?=
 =?utf-8?B?Ulc4WFNOYVRxY2kzRkhyTmsvbGVrR0IzSUE4Rnl0MjJFVGMxN2NjSTdLS0xh?=
 =?utf-8?B?OUJuZGl2aXJudmh0Q3dVSkxLOFNLaUFad0dDWCtzbjlQNWt2UUk0TDVHWm9Y?=
 =?utf-8?B?NGZ5MUdOTmlPdkZEbjB3YVhVeDQ0VU82QW5IOUt3aFdGdFpYRFQrTnlFWGdH?=
 =?utf-8?B?cGpRK0xjT2NkUUxPclBUUWNZVk9GLzZSOVJVVFRSZXNyN1IyMWpNNXNjT2Zi?=
 =?utf-8?B?Ujd6NW52citydHUvWnJ6Y3dGeDlSS3hWV0NPZWxUZjFOS3Jta0FySnlIRnl0?=
 =?utf-8?B?VlNnK1dYNG5WUDVmaGttOXNpZ0IrdllRZ1RxTFJJVGl5WnBISUc2TEV5dU1G?=
 =?utf-8?B?UU5UTUNYcnptVTU3b1Q5YWxteGUxajlQQUxNZno4MUd6QW1ONHNoZTFyTC9h?=
 =?utf-8?B?OU5iM3dIcVVHKzVZeHVKRlkwT2tVNjBmMzVnMW1sY0pMWXFFVXRvQ0RyTTNQ?=
 =?utf-8?B?QnhRb3JhVURzVlFZZlVsZlZ5VUQ2aTFJK05RZEJ0dlUzVnNtakdibDE4cnh4?=
 =?utf-8?B?T2FqQzRWeXNOQ3pwYW5UZldBZU5MZWlqUmR5L0ZEaEw3TnNZQVVTNWJLWnZT?=
 =?utf-8?B?QS9KaEhlSXlsVUlFQjU5WHZQaStESVlGeTJYT2NMbWRkdThPMi9Qa3ZjRjBz?=
 =?utf-8?B?RDhoc2xJc0Z3YVNjZEd3N1hSSjQ2YzhyN3RKZUlVRTJqOVJPS21kSEgvUTBo?=
 =?utf-8?B?dVVDVk9JSHZWNFJCTmg5V1M1UGY2OUhBTzc3N2VCb0c4U25oWUhFS1JjalJq?=
 =?utf-8?B?MndGaFN6MnhPSjBWQThlTUhjUU1rL202Y1A4WjcwRkFJRmlzRi82Q21xYy9v?=
 =?utf-8?B?cG41WndpZUcvSk1TOTgySTZyU3Jpc3JlNUdZQVlFZVdidXRKaGxWWHN0dmdu?=
 =?utf-8?B?WGtJMEVJbzI2U0UyWkF6TEhGN3ZWaVVoN09BMjdocEc3bGgrSVNzdk8zaTI4?=
 =?utf-8?B?ZmlidWVLcEdQSTg5L0xibU9FN2RPVC93a3NvQ0JHUW1HdlM2TjRHQ242Sklz?=
 =?utf-8?B?RWR1dkJ0L3FITWtFcmVVV05ITWU4aFhzMHJwbU1vTHFhMUR4VTRuTUF0a0My?=
 =?utf-8?B?cEV4aEM1Y0xER0tQRFQ1aHJIODZxVjNRTVdlM3BNR2RLL3NjNGwza0dEWUpu?=
 =?utf-8?B?QXBUdGZJbEVEZCs0L1o3aDZsOVFyZ2ZJWC9ZZ3FkS2I4OWtXczBoNkl5Nlg1?=
 =?utf-8?Q?fTYftpWzqrRxx+4DeM1UrvU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E199C1C2B66D745B1C848A28642EB4B@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0f4484-4775-4b3d-96eb-08dac0e816a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2022 17:47:07.1348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b24d4f96-5b40-44b1-ac2e-2ed7fdbde1c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jkRAIIIOjJUOHx3lcs0nTmeY8c3vHineU/Ek1Q3eCrLHm8geJgfwxuPziYo0Aq7FQ7pHdmxl1KE+oZn/0AeBfqVkwCQi97hbJRMwUHrFn5/NwNWQXYByGJveGg5X55+S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB1733
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

RXZlbmluZyBUb21pLA0KDQpPbiAxMS83LzIyIDE3OjM3LCBUb21pIFZhbGtlaW5lbiB3cm90ZToN
Cj4gSGkgTWF0dGksDQo+IA0KPiBPbiAwNy8xMS8yMDIyIDE2OjM3LCBWYWl0dGluZW4sIE1hdHRp
IHdyb3RlOg0KPiANCj4gSSBvbmx5IGhhZCB0aW1lIHRvIGhhdmUgYSBicmllZiBsb29rIGF0IHlv
dXIgY29kZSwgYnV0IEkgaGF2ZSBhIGZldyANCj4gcXVpY2sgcXVlc3Rpb25zLg0KPiANCj4+IEkg
dGhpbmsgaXQgd2FzIFRvbWkgd2hvIGFza2VkIG1lIHRoZSBiZW5lZml0IG9mIHVzaW5nIE1GRC4g
SW4gc29tZSBjYXNlcw0KPj4gdGhlIGRpZ2l0YWwgaW50ZXJmYWNlIHRvd2FyZHMgcGluY3RybC9H
UElPIG9yIG90aGVyIGZ1bmN0aW9uYWwgYmxvY2tzIGluDQo+PiBTRVIvREVTIGlzIHJlLXVzZWQg
ZnJvbSBvdGhlciBwcm9kdWN0cyAtIG9yIHRoZSBibG9ja3MgYXJlIHJlLXVzZWQgb24NCj4+IG90
aGVyIHByb2R1Y3RzLiBTZXBhcmF0aW5nIHRoZW0gaW4gb3duIHBsYXRmb3JtLWRyaXZlcnMgaXMg
YSBuaWNlIHdheSB0bw0KPj4gcmUtdXNlIGRyaXZlcnMgYW5kIGF2b2lkIGNvZGUgZHVwbGljYXRp
b24uDQo+IA0KPiBJcyB0aGVyZSBhbnl0aGluZyB0aGF0IHByZXZlbnRzIHVzIChvciBtYWtlcyBp
dCBkaWZmaWN1bHQpIGZyb20gDQo+IHJlZmFjdG9yaW5nIGEgIm1vbm9saXRoaWMiIGRyaXZlciBp
bnRvIGFuIE1GRCBsYXRlcj8gSWYgd2Ugc2VlIHN1Y2ggSVAgDQo+IHJlLXVzZSwgY2FuIHdlIHRo
ZW4gbW92ZSB0byBhbiBNRkQ/DQoNCkkgaGF2ZW4ndCBkb25lIHN1Y2ggY29udmVyc2lvbi4gSSB0
aGluayB0aGUgd29yayBmb3IgZG9pbmcgdGhlIA0KY29udmVyc2lvbiBhdCBsYXRlciBwaGFzZSBp
cyByb3VnaGx5IHNhbWUgaXQgd291bGQgYmUgbm93LiBIb3dldmVyLCANCnN5bmNocm9uaXppbmcg
c3VjaCBjaGFuZ2Ugd2l0aCByZWxhdGVkIHN1YnN5c3RlbSB0cmVlcyBtaWdodCBiZSBzb21lIA0K
ZXh0cmEgd29yay4NCg0KPiBJIGFkbWl0IEkgaGF2ZSBuZXZlciB3cml0dGVuIGFuIE1GRCBkcml2
ZXIgKGJ1dCBJIGhhdmUgaGFja2VkIHdpdGggYSBmZXcgDQo+IHllYXJzIGJhY2spLiBBcyBJIHNl
ZSBpdCwgdGhlICJzdWJjb21wb25lbnRzIiBpbiBGUERMaW5rIElDcyBhcmUgbW9yZSBvciANCj4g
bGVzcyB0aWVkIHRvIHRoZSBGUERMaW5rLiBJdCdzIG5vdCBsaWtlIHRoZXkncmUgaW5kZXBlbmRl
bnQuIENvbXBhcmUgdG8sIA0KPiBmb3IgZXhhbXBsZSwgYSBQTUlDIHdoaWNoIHByb3ZpZGVzIHJl
Z3VsYXRvcnMgYW5kIEdQSU9zLCBhbmQgcG9zc2libHkgDQo+IHRoZSBvbmx5IHNoYXJlZCBwYXJ0
IGJldHdlZW4gdGhvc2UgdHdvIGZlYXR1cmVzIGFyZSB0aGUgcGlucy4NCg0KSSB0aGluayB0aGF0
IGluIFNlckRlcyBkcml2ZXIgY2FzZSB0aGUgYmVuZWZpdCBtYXkgY29tZSBmcm9tIHJlLXVzZSBh
bmQgDQpjbGFyaXR5LiBTbWFsbGVyIGRyaXZlcnMgdGVuZCB0byBiZSBlYXNpZXIgdG8gY29tcHJl
aGVuZCwgYWx0aG91Z2ggSSANCmxpa2VkIHRoZSB3YXkgeW91IGhhZCBkaXZpZGVkIHRoZSBkcml2
ZXJzIGluIHNlY3Rpb25zLg0KDQo+IFNvLCBJIHRoaW5rIEknbSBzdGlsbCB3b25kZXJpbmcgYWJv
dXQgdGhlIGJlbmVmaXQuLi4NCj4gDQo+IEluIHRoZSBjdXJyZW50IHZlcnNpb24gSSBoYXZlIHRo
ZSBkZXNlciBkcml2ZXIgc3VwcG9ydGluZyBVQjk2MCBhbmQgDQo+IFVCOTcwMi4gSSBndWVzcyBJ
IGNvdWxkIHNwbGl0IHRob3NlIGludG8gc2VwYXJhdGUgZHJpdmVycywNCg0KSSB3b3VsZG4ndCBi
cmVhayB0aGUgZHJpdmVyIHBlciBJQy4gSWYgdGhlIElDcyBhcmUgc2ltaWxhciBlbm91Z2ggdG8g
YmUgDQpuaWNlbHkgaGFuZGxlZCBieSBzYW1lIGRyaXZlciwgdGhlbiB0aGV5IHByb2JhYmx5IHNo
b3VsZC4NCg0KPiANCj4gVGhlIGJlbmVmaXQgd291bGQgYmUgbW9yZSBvYnZpb3VzIGlmIHRoZXJl
IHdhcyBzb21lIG90aGVyIHR5cGUgb2YgSUMgDQo+IHRoYXQgdXNlcyB0aGUgc2FtZSBJUCBzdWJj
b21wb25lbnRzLg0KDQpZZXMuIFNhbWUgb3Igc2ltaWxhciBzdWJjb21wb25lbnRzLiBUaGlzIGlu
ZGVlZCBpcyB0aGUgYmVuZWZpdCBJIHNlZS4gSSANCmRvbid0IGtub3cgaWYgVEkgY291bGQgdXNl
IHNhbWUgLSBzYXkgR1BJTyAtIGNvbnRyb2wgbG9naWMgb24gYW5vdGhlciANCnR5cGUgb2YgZGV2
aWNlPyBPciwgbWF5YmUgc2VwYXJhdGluZyB0aGUgbG9naWMgY291bGQgZ3VpZGUgb25lIHRvIHVz
ZSANCnNvbWUgZ2VuZXJpYyBzdHVmZiBsaWtlIHJlZ21hcF9ncGlvIGRyaXZlcj8gQW5kIGZpbmFs
bHksIHN1Ym1pdHRpbmcgDQpzbWFsbCBwbGF0Zm9ybSBkcml2ZXJzIHZpYSByZXNwZWN0aXZlIHN1
YnN5c3RlbXMgY2FuIHlpZWxkIGJldHRlciByZXZpZXcgOykNCg0KPiANCj4gQWxzbywgaXNuJ3Qg
dGhlIHVzZSBvciBub24tdXNlIG9mIE1GRCBzdHJpY3RseSBhIGRyaXZlciBwcml2YXRlIHRoaW5n
LCANCg0KSSBhbSB0ZW1wdGVkIHRvIHNheSAieWVzIiwgYnV0IHdoZW4gZ2l2aW5nIGl0IGEgdGhv
dWdodCAtIGl0J3MgcmVhbGx5IA0Kbm90IGZ1bGx5IHRoYXQuIFNwbGl0dGluZyBhIGRyaXZlciB0
byBzdWJkcml2ZXJzIGNhbiBhbGxvdyByZS11c2Ugb2YgDQpzdWJjb21wb25lbnRzIGJ5IHVucmVs
YXRlZCBJQ3MuIE9UT0gsIGFsd2F5cyBzdHVmZmluZyBldmVyeXRoaW5nIGluIGEgDQpkcml2ZXIg
ImJlY2F1c2UgaXQgaXMgZHJpdmVyIGludGVybmFsIGRlY2lzaW9uIiBjYW4gbGVhZCB0byBjb2Rl
IA0KZHVwbGljYXRpb24gYW5kIGJsb2F0Lg0KDQo+IGl0IHNob3VsZCBub3QgYWZmZWN0IGFueSBz
aGFyZWQgcGFydHMgb3Igc2hhcmVkIGRlc2lnbnM/IEluIG90aGVyIHdvcmRzLCANCj4gaWYgeW91
IGhhdmUgeW91ciBST0hNIGhhdCBvbiwgd2h5IGRvIHlvdSBjYXJlIGhvdyB0aGUgVUI5eHggZHJp
dmVyIGlzIA0KPiBzdHJ1Y3R1cmVkIGludGVybmFsbHk/IDspDQoNCkFzIEkgd3JvdGU6DQogPiA+
IFBsZWFzZSwgZG8gbm90IHRyZWF0IHRoaXMgYXMgYSByZXF1aXJlbWVudCAtIHBsZWFzZSB0cmVh
dCBpdCBhcyBhIA0KZm9vZCBmb3IgdGhvdWdodHMgOykNCg0KRWcsIEkgYW0gbm90IHRyeWluZyB0
byB0ZWxsIHlvdSBob3cgdG8gZG8gdGhlIFVCOXh4IGRyaXZlcnMuIEkganVzdCANCnRoaW5rIHRo
YXQgY29uc2lkZXJpbmcgYW5vdGhlciBkZXNpZ24gX21pZ2h0XyByZXN1bHQgbW9yZSBvcHRpbWFs
IGRlc2lnbiANCi0gYnV0IEkgZG8gbGVhdmUgdGhlIGRlY2lzaW9uIHRvIHlvdSB3aG8ga25vdyB0
aGlzIGFyZWEgYmV0dGVyIHRoYW4gSSBkby4NCg0KWW91cnMNCgktLSBNYXR0aQ0KDQotLSANCk1h
dHRpIFZhaXR0aW5lbg0KTGludXgga2VybmVsIGRldmVsb3BlciBhdCBST0hNIFNlbWljb25kdWN0
b3JzDQpPdWx1IEZpbmxhbmQNCg0Kfn4gV2hlbiB0aGluZ3MgZ28gdXR0ZXJseSB3cm9uZyB2aW0g
dXNlcnMgY2FuIGFsd2F5cyB0eXBlIDpoZWxwISB+fg0KDQo=
