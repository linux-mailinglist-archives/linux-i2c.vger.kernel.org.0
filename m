Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 936F477BD7E
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 17:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbjHNPzR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 11:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjHNPzB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 11:55:01 -0400
Received: from CAN01-YT3-obe.outbound.protection.outlook.com (mail-yt3can01on2119.outbound.protection.outlook.com [40.107.115.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EB8109;
        Mon, 14 Aug 2023 08:54:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRES5OVOg7HTPhUg3IyMKErTSAPBrC+svUPdkzZrReNsyjFPb1bdmXIgrYNNXMKrpzZAFmUsq2dPqXBGIIvjd9cyTj04SRH9UgCrYrzSVhN5SufYFTyRyxWMrjDaPgfzQhUDx7q+KuROFmL3urm9sUakONCF28DhR0iriWqMk0upwTXZClEJSMVrnyzFFYFIFO8f9dTuL9ZD1+qX1OoYrX1jmeHGEKMEER9l+cxO2JOc1u8Z3bG2krnGb5bWDKMXVGQMFkamoTSOSSBF+rnkoxekrNf1uaVKGzx55Egq5+F+t/So49zDWdLuuHEELweWOYem+n7O0o5+50s1BX5fKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95iq9/IgMrmj77QpLUw1O7QIAagmMYIACPpcenbSAsY=;
 b=gGC32swed/7H8T6MV6G3LK5lJQA6KRCeGyb5FJFazS4B2nziO+68bE0LqrPzY13jqoRSMxCTTv7ZLQ30oFA1uvP0Rk5E4PeykJHPQKS49dkHP8gY2AaqlMSfF4SsF3Usiyhe6ETeuHk/sMO44ILGopaZjM/11R+4t1RqmLQ/Z5ktmK2oB1XfQ2d5pOz8SvQM80bGV9pYreeawA5CqeadIKvMiGmFy7/NqJ+7gVtah+EPXBDdfQ2i1h12ELtc7ZIjiIF1pu+nu4M7owUJIkEBRohcxt/rQhsnmJ3iirGCn0Wx2hPv/14LeaucggLlTTIeGk8GDWkDyzLSZIoA3wHBOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=connecttech.com; dmarc=pass action=none
 header.from=connecttech.com; dkim=pass header.d=connecttech.com; arc=none
Received: from YT1PR01MB4124.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2b::11)
 by YT1PR01MB8554.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:c5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 15:54:57 +0000
Received: from YT1PR01MB4124.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::7fe0:2f38:7134:6e7d]) by YT1PR01MB4124.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::7fe0:2f38:7134:6e7d%7]) with mapi id 15.20.6678.025; Mon, 14 Aug 2023
 15:54:56 +0000
From:   Parker Newman <pnewman@connecttech.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>
CC:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: tegra: Fix i2c-tegra DMA config option processing
Thread-Topic: [PATCH] i2c: tegra: Fix i2c-tegra DMA config option processing
Thread-Index: AQHZxi1X/DFR5Xjq7k2794y4/1T6O6/arpsAgA9MIQCAAAhAAA==
Date:   Mon, 14 Aug 2023 15:54:56 +0000
Message-ID: <2702e51d-1e7e-a71b-f07b-ab224b9eff31@connecttech.com>
References: <fcfcf9b3-c8c4-9b34-2ff8-cd60a3d490bd@connecttech.com>
 <20230804214902.entkn6xkklz5lh3h@intel.intel>
 <5594f66d-1aec-ee2f-d3d1-1185ca9cb06f@gmail.com>
In-Reply-To: <5594f66d-1aec-ee2f-d3d1-1185ca9cb06f@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=connecttech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT1PR01MB4124:EE_|YT1PR01MB8554:EE_
x-ms-office365-filtering-correlation-id: c4d483f6-78d0-4f04-3e5c-08db9cdecec8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IJgvixI0fEKG82LIekEdjPvbID2E+/qW55OJ5spfaLO5uX4wb/xtbp9GmW5eFGjWKpAXOkIZeyrMWZ+YmHpaC6rdOBpRxZvXLYU/zNNyHAM4vpUc8hJ7dVq799CFT9scJp/vvSf0kIGrbREgVjM7wZGjnkN6kSrkIZ06awI46tpiacX9HIUjrnFFKfuuE3P9RZ/V4K5ktFAr1/cEwsNUJmA4OyJch/fmr6e1PNBoY0HRKSRqmFQVMm+PGbdn/RyNQJLyr63XWOuULSS5nfpcOUnQmuXFXSYq7o+gkVxOMcyuwchFzdN9fH6sVtn+Abw73SFKyaiEjQhp4Kp987lvFBWowW7M/45yrjWVHdVFSu4Xw+06+PvPJOP6DQlFefrACSVFUvqtj9vLcQgZ5YPmarha+usd8ahbpxy2wFTOvnzRp9HXZgUV/5yddjCe2L4aFRuXMY84qr83E4WKVfgIl7E0qilDNXLaj3/bavyA3Cn6RmtFQ+LP4Zx3CcF8NyhsFDq5O60+PVFAWpBDFGbj6p4/PE9edPgi2ePDeUPiX9dOzSxZVcnuUrAtTGC36q6wBkKPMWO027VzNBnkkG1c9uOL4d5HYmgPQvnKZwAx+95/+OgUnVMVvNzIXjaf1YmGrfTGVxjSLYTU2gS/icseuQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB4124.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(39840400004)(396003)(376002)(136003)(451199021)(1800799006)(186006)(31686004)(71200400001)(6486002)(76116006)(110136005)(6506007)(478600001)(36756003)(86362001)(31696002)(83380400001)(6512007)(26005)(66946007)(53546011)(2616005)(2906002)(38070700005)(38100700002)(122000001)(316002)(4326008)(66556008)(64756008)(66476007)(8676002)(54906003)(66446008)(5660300002)(8936002)(41300700001)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnJ6aWczSGpFYnkvMVZlaExmT3J1R3lVYXQydUF3ZGhaVmwyRHdiQmQ1WHpO?=
 =?utf-8?B?ZWVQb1ZoTTN5b1N0VzFPdjJkZmtETk93cUZkTEtab041UTdjV3BxOXd5RGFN?=
 =?utf-8?B?djhQRmJ1K0w3eDhZbldKdjlBOFd1RTZVZlNIYkI5TW5uV1hHdkJNYzJTV1Zr?=
 =?utf-8?B?Q3VZVXlqNkhNcGdMTldCSjJOM2ovRDZYeGpYOFZyQ0Y4SEhnU0I0aVFicGRF?=
 =?utf-8?B?VWk3Z050QlZzbTNoSUx3RkczbGE1WDNLWWs5WnBEYk5OdnpEcks5Sm1PQTVv?=
 =?utf-8?B?RFpwbndIQmU4MnRTZFNwQVI2YXJYNnV4K1F3empYeGZJdG04aW94K1VNbTgz?=
 =?utf-8?B?cGJzbVkrWWdkR0M0Vmg5QXI4bVhZY2VhbERGT2dWbkxSVDJ0cTNJTUZ6THBY?=
 =?utf-8?B?Skl6Zno2Z3VqS21VTEhhQlN0RXJPeXZvSXJPN3FWZFF1VGJJa2s3eG1iRVll?=
 =?utf-8?B?L3ZjVXdTRlJrZGhRV204QmNTcG0zU3FBcFNtc3p5N0VnMmRrOHl0dThjQkZl?=
 =?utf-8?B?WldCU1RLNHRiWkg2KzBaZVJodmZucTExcStBbjkySmVCTW43dWZEQTMySDJX?=
 =?utf-8?B?c2Q0MVE3WGJWYjBKdlFvOXpIbmVwNjZqdENZUUlkVXhNbkd2ZEhXVVorbGJv?=
 =?utf-8?B?T1F1Rk5wOGd1M000MVQzL2s3MjIrYVFlb3pmcllldEVsd3VjVS9zODUxSlp0?=
 =?utf-8?B?Q1oxb295UjhJL29FUkdXN29BbFl4dEtndWlpdjNiVVJqd1lSOUJVMkpkV1Ft?=
 =?utf-8?B?cmk4a1ZSZWl1YmZzL0ZxVUl2RGNiSFlMakRkY2lOTTRXaXBzNnVqWFViN3hz?=
 =?utf-8?B?YklSeXZJQmE4NjRveFZCRE56NW1sUHhRcXl4dHRCWk0wMGZld0dveWh6VGI1?=
 =?utf-8?B?OHAxdVJOa0tzQ1FTQUMrdGxZQXBvSjdiN0dnU0ZMMXgzWmZGUHVhTG5EYVJZ?=
 =?utf-8?B?RkE3NWRkall1MWVqOVBMaFJ3WGcwdHpaTGtkS3hjZ2hQaTZkMSt2dkhXMFk5?=
 =?utf-8?B?YTlnemRlenhNazBhM0pYRjlYaURqcy92cWVUci9UOTJpWVprd2QzOWVoVVZ0?=
 =?utf-8?B?Z0JLb2t3Q0g2cTQvcndYRlU0Zzl4blFMNkR2VVpVMlRBM0ZNVUNEazcxOUFK?=
 =?utf-8?B?WDhPTDRtWVY4SXJsdEwyUXY4ckc5ZXRXSmZ6RWxDSXN5dWpLdDBQTVdrUGFv?=
 =?utf-8?B?RlROeWNHWGE0ZjNHaTg1Q29ESTBtVnVaYlppbys5bHRmSlczWXVyOTNpajlG?=
 =?utf-8?B?ejFFdXVtWWx1WnNPOGFUcHBQRkFCa2xhZmZESy94K2FuYll5RnB6WWRjbkRV?=
 =?utf-8?B?SUlFNHVZdlNaK1JJdkxsc20vUWFBak5ucUNJWmhNT0FOTEV6Q0d3SnlNWHh4?=
 =?utf-8?B?YU5yR1hGNTBhcW9tVDBDa0xiRFRkNjZRcEVOMGdCajc4KzVWbHhUYUNsNWtW?=
 =?utf-8?B?b1pvcTlDblZFTkJvc3FMVzR5Z2JGYVBoYW95enJ6VDdiVStYbjIrK3d4N1Zi?=
 =?utf-8?B?eW1ZVUhZb2JKOCtRd0NvOW16QkFnUWkzcFVyUUVKeUU2ZjcyS2VLem5obXN0?=
 =?utf-8?B?QWtHend5SnRaNVVvQUpKK3orZmRMcXhJbldjbit5SGhtOEZidVY0RmUwMkFi?=
 =?utf-8?B?dUV2WnF1eFo1NlFJVHFJMlcycVo2SXlHbUptK0RMd29XNGJLanpDRERwbU9Z?=
 =?utf-8?B?V0l3ZE1qclM5aGRwSVlrejc0dFBhQ2VnNmIzOGYwbHZBL1Q0elYvTkowaWpi?=
 =?utf-8?B?dlJZaGd0TUtnNENTZ1hsR21UV2w1STNJbUFNWks1L1huamd1eEZVSVhtVnhi?=
 =?utf-8?B?eFhNbForTFErbW1VUytrNk9RYlFPd2ZVOGlGRStaK2RFOEFsR21nNjFidk1R?=
 =?utf-8?B?SnZ3ay85eGhSdzZYalBjU2lhRjh6VWNBZDFqMXdQMFc1aTZyQjFrbVVQWWd0?=
 =?utf-8?B?d0xuN0dLYUplcEhzUE1Ic0tnUU44SHluZFlPZ09tbDkyelBYbVkwMENoN0VW?=
 =?utf-8?B?bTZuUitqV0hGbGR1VUIwek9CWlZUcmEzanp0Y0gwV3RVQXhRS1h4QitjUTVh?=
 =?utf-8?B?d21Tak5VaHBQVzNzYUtIRW1helk1akpoQWdpUDdBd0JEZStBN2pjZlErNlBT?=
 =?utf-8?Q?OvvEHrHMHuVtfvGMGpoMvVpJd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F0963693F821D43A65C3D0388EC3502@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: connecttech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB4124.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d483f6-78d0-4f04-3e5c-08db9cdecec8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 15:54:56.8593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d33071ec-da55-4b12-8469-920f998c36b3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZiBq/pYBIezh1j45SnyIgatshs171ZoUW0pHr+37cAVLY6ysELhFSmbeJh29IILAhIe0fvQIzOuUVCZxtgmfJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB8554
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAyMy0wOC0xNCAxMToyNSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOg0KPiAwNS4wOC4yMDIz
IDAwOjQ5LCBBbmRpIFNoeXRpINC/0LjRiNC10YI6DQo+PiBIaSBMYXhtYW4gYW5kL29yIERtaXRy
eSwNCj4+DQo+PiBPbiBUaHUsIEF1ZyAwMywgMjAyMyBhdCAwNToxMDowMlBNICswMDAwLCBQYXJr
ZXIgTmV3bWFuIHdyb3RlOg0KPj4+DQo+Pj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgVGVncmEgRE1B
IGNvbmZpZyBvcHRpb24gcHJvY2Vzc2luZyBpbiB0aGUNCj4+PiBpMmMtdGVncmEgZHJpdmVyLg0K
Pj4+DQo+Pj4gVGVncmEgcHJvY2Vzc29ycyBwcmlvciB0byBUZWdyYTE4NiB1c2VkIEFQQiBETUEg
Zm9yIEkyQyByZXF1aXJpbmcNCj4+PiBDT05GSUdfVEVHUkEyMF9BUEJfRE1BPXkgd2hpbGUgVGVn
cmExODYgYW5kIGxhdGVyIHVzZSBHUEMgRE1BIHJlcXVpcmluZw0KPj4+IENPTkZJR19URUdSQTE4
Nl9HUENfRE1BPXkuDQo+Pj4NCj4+PiBUaGUgY2hlY2sgZm9yIGlmIHRoZSBwcm9jZXNzb3IgdXNl
cyBBUEIgRE1BIGlzIGludmVydGVkIGFuZCBzbyB0aGUgd3JvbmcNCj4+PiBETUEgY29uZmlnIG9w
dGlvbnMgYXJlIGNoZWNrZWQuDQo+Pj4NCj4+PiBUaGlzIG1lYW5zIGlmIENPTkZJR19URUdSQTIw
X0FQQl9ETUE9eSBidXQgQ09ORklHX1RFR1JBMTg2X0dQQ19ETUE9bg0KPj4+IHdpdGggYSBUZWdy
YTE4NiBvciBsYXRlciBwcm9jZXNzb3IgdGhlIGRyaXZlciB3aWxsIGluY29ycmVjdGx5IHRoaW5r
IERNQSBpcw0KPj4+IGVuYWJsZWQgYW5kIGF0dGVtcHQgdG8gcmVxdWVzdCBETUEgY2hhbm5lbHMg
dGhhdCB3aWxsIG5ldmVyIGJlIGF2YWlsaWJsZSwNCj4+PiBsZWF2aW5nIHRoZSBkcml2ZXIgaW4g
YSBwZXJwZXR1YWwgRVBST0JFX0RFRkVSIHN0YXRlLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTog
UGFya2VyIE5ld21hbiA8cG5ld21hbkBjb25uZWN0dGVjaC5jb20+DQo+Pj4gLS0tDQo+Pj4gIGRy
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYyB8IDIgKy0NCj4+PiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy10ZWdyYS5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy10ZWdy
YS5jDQo+Pj4gaW5kZXggYmNiYmYyM2FhNTMwLi5kYzZlZDNhOGQ2OWUgMTAwNjQ0DQo+Pj4gLS0t
IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy10ZWdyYS5jDQo+Pj4gKysrIGIvZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy10ZWdyYS5jDQo+Pj4gQEAgLTQ0Miw3ICs0NDIsNyBAQCBzdGF0aWMgaW50IHRl
Z3JhX2kyY19pbml0X2RtYShzdHJ1Y3QgdGVncmFfaTJjX2RldiAqaTJjX2RldikNCj4+PiAgICAg
aWYgKElTX1ZJKGkyY19kZXYpKQ0KPj4+ICAgICAgICAgcmV0dXJuIDA7DQo+Pj4NCj4+PiAtICAg
aWYgKCFpMmNfZGV2LT5ody0+aGFzX2FwYl9kbWEpIHsNCj4+PiArICAgaWYgKGkyY19kZXYtPmh3
LT5oYXNfYXBiX2RtYSkgew0KPj4+ICAgICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19URUdS
QTIwX0FQQl9ETUEpKSB7DQo+Pj4gICAgICAgICAgICAgZGV2X2RiZyhpMmNfZGV2LT5kZXYsICJB
UEIgRE1BIHN1cHBvcnQgbm90IGVuYWJsZWRcbiIpOw0KPj4+ICAgICAgICAgICAgIHJldHVybiAw
Ow0KPj4NCj4+IENhbiBJIGhhdmUgeW91ciBvcGluaW9uIGhlcmUsIHBsZWFzZT8NCj4gDQo+IFRo
ZSBwYXRjaCBsb29rcyBnb29kLCB0aGFua3MgUGFya2VyIGZvciBmaXhpbmcgaXQuIEknbGwgYmUg
YWJsZSB0byB0ZXN0DQo+IGl0IG9ubHkgc29tZXRpbWUgbGF0ZXIgYW5kIGxldCB5b3UgYWxsIGtu
b3cgaWYgdGhlcmUgd2lsbCBiZSBhbnkNCj4gcHJvYmxlbS4gUHJldmlvdXNseSBJIGhhdmVuJ3Qg
bm90aWNlZCBhbnkgVGVncmEgSTJDIHJlZ3Jlc3Npb25zLCBtYXliZQ0KPiB3ZSBzaG91bGQgY2hh
bmdlIHRoYXQgZGV2X2RiZyB0byBkZXZfd2Fybi4NCj4gDQoNCkhpIERtaXRyeSwNCg0KWW91IHdp
bGwgbm90IG5vdGljZSBhbnkgaXNzdWVzIGlmIGJvdGggb3B0aW9ucyBhcmUgc2V0IChvciBub3Qg
c2V0KSBhcyBpdCANCndpbGwgZmFsbCB0aHJvdWdoIGFuZCBjb25maWd1cmUgdGhlIERNQSBvciBz
a2lwIERNQSBzZXR1cCBhcyBleHBlY3RlZC4gDQoNCkkgb25seSBub3RpY2VkIHRoZSBpc3N1ZSBh
ZnRlciBJIGVuYWJsZWQgQ09ORklHX1RFR1JBMjBfQVBCX0RNQSB3aGljaCBpcyBhIA0KS0NvbmZp
ZyByZXF1aXJlbWVudCBmb3IgdGhlIFRlZ3JhIEhTLVVBUlQgZHJpdmVyIGFuZCBteSBJMkMgc3Rv
cHBlZCB3b3JraW5nLiANCg0KV2hpY2ggbm93IGFzIEkgd3JpdGUgdGhpcyBJIHJlYWxpemUgaXMg
cG9zc2libHkgYW5vdGhlciAiYnVnIi4uLiBBcyBmYXIgYXMgSSBrbm93DQp0aGUgSFMgVUFSVHMg
YWxzbyB1c2UgR1BDIERNQSBvbiBUMTg2IG9yIGxhdGVyPyBJIHdvdWxkIG5lZWQgdG8gbG9vayBp
bnRvIHRoYXQuDQoNCkkgZG9uJ3QgdGhpbmsgdGhlIHByaW50IG5lZWRzIHRvIGJlIGEgd2Fybmlu
Zywgbm90IGhhdmluZyBETUEgZW5hYmxlZA0KaXMgYSB2YWxpZCBvcHRpb24sIGl0IGp1c3QgbmVl
ZGVkIHRoZSBjb3JyZWN0IENPTkZJRyBvcHRpb25zIHRvIGJlIGNoZWNrZWQgZm9yIA0KdGhlIERN
QSB0eXBlIChBUEIgdmVyc3VzIEdQQykuDQoNCi1QYXJrZXINCg==
