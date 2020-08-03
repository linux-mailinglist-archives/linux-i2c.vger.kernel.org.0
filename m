Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF7023AAB9
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Aug 2020 18:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgHCQnF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Aug 2020 12:43:05 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:61682 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbgHCQnE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Aug 2020 12:43:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1596472984; x=1628008984;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KgiYpL0kciyHYaWtg0L76VN2MmAncnKbl0VmgLxi/fI=;
  b=cnayA2h9sMCxfyC4/geqUrXwLkAihiQ7jsapX41dpd7Jv5deESvkChO+
   hcvMUFmPUwXgKFGxJaw9u3mNMP95lxJ7/H1T4/mxPPJkiHbyGjVr5oqOt
   jk1eOtaVgDU8jMFhNscRboNE7PQcl9LVDqPQNSc9QQch9jn9wCQAeDR2T
   N9U/hRNWzkLV/cMi9c2uuyzSGePyBSnVFS788WHPnLJqGJBZzerb468/P
   EY+g/VZxxjHJLwFs+WzsZWHKATMLvU6tETfsz5uRYdr/dh4LaZs9b9jda
   IQ4lpk0pxaJMlLa+uOfIJg6ttYHxPMleGEY8lUiLe6CiPeG9qRmqeXiEa
   w==;
IronPort-SDR: ZKO6SLLoC0IRrSPB/RqWuBg3DzuJHNvBsKxOxgmHsVs52kP2gEnFtC+en0NgMiVXUggObPV2ld
 s0LuzwVh93zluvRs4pSoYHy/qRFWmOfFN3ITS7izeOIMCdkix2w51p8j2gpeF3cDsIvq8ZAnwy
 rptilmKc3Sx8x9Dmm2LAVqCGsmsej2aDoWrtXLiiFWOtOz8HJAXHmEoH7TblPT3wifh/Gb7Tp0
 QIuN8DKtyDtGwq+KyrokAqGFQ2jrtjMzMMx2QoDHckyIEkspuWkyHWqcv2lF7FhMEjTp/enqR/
 AH0=
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="85667391"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Aug 2020 09:43:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 3 Aug 2020 09:43:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Mon, 3 Aug 2020 09:42:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmEj35jo3nBl2hFDXLQUSYiVAe1G5x9efiMFIBqLApm2ABvrc/0EddmoCsjT4abLKOBE4uad5jK/9JMlO5suQi7hM+SdGMVabrQdMQAr6m0B20EUIzp0yN9RB3v/cA6khs8GxBpz6YKJq6QdarZ017b5RfIf+LZQRwpEZXGtTaHvOkBHc1ex6MU7IbezXWrDW2azaRfIt2c70B+rQ9pc20LUHBvrUBpwIvzFUFv+BT5hpB3y0+Q75E5WFvK1vW3wmNdZoC2MqUVZd7x7IK/JEO5SPfv6zrnKyw+9dEV8iPM+4DqK+XymKIvReKA63qUYHomyqRhWebV41tCc1nOOQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgiYpL0kciyHYaWtg0L76VN2MmAncnKbl0VmgLxi/fI=;
 b=dw+aEv5feHZnpoWLr4w0LIeeBpNX+e/xuBIlCpODAjGR+R96irVKCMmwuKmhS974R27NqokI40CnitPOP72sYBNkZRHEtLfVSLb0OfVAHcpsbYsJZAOb5TCy9tv8SWo15rD/ooRYZm/G1sWYz9uTEVpOFa5jgExUERip4qwO25Rx+vcFaxVfvkfkC7+EfKr7G5vmRwmpHHeU4av9wliUBGkiumo5duniL0/mcMim//BWN8XBkBtvODE9Dwi9Al4KPHJwlX2eQunUSnI9+HouI+5pWQ88/yO0EC5Bd7+YrX9/qe8YKCqy6PWQuB8xYgvuaPa54BVx8VnyCO7QG7ZddQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgiYpL0kciyHYaWtg0L76VN2MmAncnKbl0VmgLxi/fI=;
 b=uJEOguZU81pagBKQD5cY4xDhLicVaejsYmGxJ+2Sy2bHYvk4utoCh+/122gDyEWQFNPC++lE/GvI4GnaKonsLSyfsTDeNQ9Lz1IBny2uBg5V7TA0Hs3cAMhUUvrcLi5IVVRaZCBfhtsXoMypRD+JIhJ0HtiCrE4OprlMxTJ4fGI=
Received: from SN6PR11MB3504.namprd11.prod.outlook.com (2603:10b6:805:d0::17)
 by SN6PR11MB2605.namprd11.prod.outlook.com (2603:10b6:805:64::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Mon, 3 Aug
 2020 16:42:59 +0000
Received: from SN6PR11MB3504.namprd11.prod.outlook.com
 ([fe80::c83b:2062:4e59:8ebf]) by SN6PR11MB3504.namprd11.prod.outlook.com
 ([fe80::c83b:2062:4e59:8ebf%7]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 16:42:59 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <linux@armlinux.org.uk>
CC:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <kamel.bouhara@bootlin.com>
Subject: Re: [RFC PATCH 1/4] dt-binding: i2c: add generic properties for GPIO
 bus recovery
Thread-Topic: [RFC PATCH 1/4] dt-binding: i2c: add generic properties for GPIO
 bus recovery
Thread-Index: AQHWRkS/OBUazr8JiUiilPsVNX+PNqj5l1gAgB3AVoCAABRggIAEDVcAgAABjYCABJhKgIAGoYOAgAApAAA=
Date:   Mon, 3 Aug 2020 16:42:59 +0000
Message-ID: <765384b9-20dc-1a90-2a2c-89721d6ce5e8@microchip.com>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-2-codrin.ciubotariu@microchip.com>
 <20200705211918.GB1055@kunai> <20200724193913.GD1227@ninjato>
 <20200724205209.GC1551@shell.armlinux.org.uk>
 <b3a04528-0053-16bf-f092-147685298ced@microchip.com>
 <20200727105029.GI1551@shell.armlinux.org.uk>
 <1e788319-c841-d1f1-b65c-d25052f7f90b@microchip.com>
 <20200803141613.GN1551@shell.armlinux.org.uk>
In-Reply-To: <20200803141613.GN1551@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: armlinux.org.uk; dkim=none (message not signed)
 header.d=none;armlinux.org.uk; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [84.232.220.208]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c158e15-da3b-40fe-2af4-08d837cc480e
x-ms-traffictypediagnostic: SN6PR11MB2605:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB260519108154C7282E72D364E74D0@SN6PR11MB2605.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S/BGbOP6HbEWtSZe51dMv+fpWZF8rMfyTWfJdYb1DtuT2Of89JA76RTsz234J625TnvVZ+wL/oYvtgNE2rEYuRLAf883eGdJ53wvjI0dSOb4yHpe8swb2pA+JhBpIQr9QP1yhjKMddQy+M7we6VL9aaoe3Hz1nY2URHEHAmjc+QXQs08d1VhUCNmWEld3+N7aA+I2H777qtj6CcswXziXDm2YW5HjiL/lhw0k+IEP9Oq1rJ7Cch0I1YeX2Sdp4OAC9MR9nQo9alKnvU1UN+fjvvq8G8cCjI6wOtJUCYwRedjsfn0hBgotQ4CTUI36kQtQfAuDrFKGBMRjylXVGcb3ivsVLe31NPLVKjmQrFASgmbYnrSaeA0qkCEhJM/pXNAkbqFon2JxCTGhuU82MaCtiComoTQ3IAdWrEEE/Rz4QeBf2s5/IB1rCYwTdnbY69MZl3eJyon5Aw22pJuQ/sZioMTz7v/KLNFOIgcLN8HiKE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3504.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39860400002)(376002)(396003)(346002)(136003)(66946007)(6512007)(66556008)(64756008)(66446008)(66476007)(316002)(91956017)(31696002)(6486002)(6916009)(83380400001)(36756003)(4326008)(5660300002)(26005)(2616005)(76116006)(8936002)(8676002)(53546011)(186003)(54906003)(71200400001)(966005)(2906002)(478600001)(86362001)(31686004)(6506007)(41533002)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: jfjv3U+rfqK3KEvzvv9dipIg5f9RlskPhhBtjYBDBEM3F17whGBbZf3bB0Hhuj5Xs+1xcsQtu45AOIo9kX5ylT5revpfeCrhFlVuwPz7b2RgksivdxLYnr9CP9gk1kx2SBQdk0DX5kLTgxRIobrc+j6JeYQjeSRbm+dy06YEUGK5NWZbyt7CVtOD4r+y4tGHj1q/d7J0w/Tpy6lkq8iOnI8j6WI0lE/3/xl3up+dqhyJQjm2Dwt8usPBQoB4VhDQiBRgjUWQ9atGOxWcC7a37JNdnqiKI955xXBVIh3/aGRRnuv4/CzYJSHb1VTCKxPGCcmzoopyEUSncYVYJ5jxhwWcoR15cRMPy/WhumwkW3R8YX0u9o9oXTdJdteRMcS2krdfZ8dzd1SIiAeAyHnU7AMpULxWX817EQ0UM8jrNQ/aXSVrGjMbcD2/koqZryZBQt8oPkVPvsR4CXQoreHHyua1QhZCyfr1/MYNe23/aLuFg7y2qlUq4oNZ7muL2Shv8tO+UFKQbSrjg/ahrMZP7NtfrnhLKEGh07QConQBODkBv/aRs2mSwhvBHEYQ2uHqK5ctE/htXxgB9t19fVwffgWJ/5JNy4+pNcA7P0fu9Tr/MkZESM5bVjwL3g9nrY6CXw9At97oO+4Gb29wVaEH1g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C2573C86544FC4FA538B903ECE4BF8A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3504.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c158e15-da3b-40fe-2af4-08d837cc480e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2020 16:42:59.3221
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2zO5erVai6GSDKQ9xC5Up++nG5YFNpwZ7Pquna7ufvgRwRuchHCMejqKCJEW8oAWnN0VgtG3PfX/DZgf6JpQuszD9qhfQpnvugcWKIQxmhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2605
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDMuMDguMjAyMCAxNzoxNiwgUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWluIHdyb3Rl
Og0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIFRodSwgSnVs
IDMwLCAyMDIwIGF0IDA5OjAwOjM2QU0gKzAwMDAsIENvZHJpbi5DaXVib3Rhcml1QG1pY3JvY2hp
cC5jb20gd3JvdGU6DQo+PiBPbiAyNy4wNy4yMDIwIDEzOjUwLCBSdXNzZWxsIEtpbmcgLSBBUk0g
TGludXggYWRtaW4gd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5r
cyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZl
DQo+Pj4NCj4+PiBPbiBNb24sIEp1bCAyNywgMjAyMCBhdCAxMDo0NDo1N0FNICswMDAwLCBDb2Ry
aW4uQ2l1Ym90YXJpdUBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4+PiBPbiAyNC4wNy4yMDIwIDIz
OjUyLCBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXggYWRtaW4gd3JvdGU6DQo+Pj4+PiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pj4+DQo+Pj4+PiBPbiBGcmksIEp1bCAyNCwg
MjAyMCBhdCAwOTozOToxM1BNICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+Pj4+Pj4gT24g
U3VuLCBKdWwgMDUsIDIwMjAgYXQgMTE6MTk6MThQTSArMDIwMCwgV29sZnJhbSBTYW5nIHdyb3Rl
Og0KPj4+Pj4+Pg0KPj4+Pj4+Pj4gKy0gcGluY3RybA0KPj4+Pj4+Pj4gKyBhZGQgZXh0cmEgcGlu
Y3RybCB0byBjb25maWd1cmUgU0NML1NEQSBwaW5zIHRvIEdQSU8gZnVuY3Rpb24gZm9yIGJ1cw0K
Pj4+Pj4+Pj4gKyByZWNvdmVyeSwgY2FsbCBpdCAiZ3BpbyIgb3IgInJlY292ZXJ5IiBzdGF0ZQ0K
Pj4+Pj4+Pg0KPj4+Pj4+PiBJIHRoaW5rIHdlIHNob3VsZCBzdGljayB3aXRoICJncGlvIiBvbmx5
LiBUaGF0IGlzIHdoYXQgYXQ5MSBhbmQgaW14IGhhdmUNCj4+Pj4+Pj4gaW4gdGhlaXIgYmluZGlu
Z3MuIHB4YSB1c2VzICJyZWNvdmVyeSIgYXMgYSBwaW5jdHJsIHN0YXRlIG5hbWUgYnV0IEkNCj4+
Pj4+Pj4gY2FuJ3QgZmluZCBhbnkgZnVydGhlciB1c2Ugb3IgZG9jdW1lbnRhdGlvbiBvZiB0aGF0
LiBQWEEgaXMgbm90IGZ1bGx5DQo+Pj4+Pj4+IGNvbnZlcnRlZCB0byB0aGUgYmVzdCBvZiBteSBr
bm93bGVkZ2UsIHNvIG1heWJlIGl0IGlzIG5vIHByb2JsZW0gZm9yIFBYQQ0KPj4+Pj4+PiB0byBz
d2l0Y2ggdG8gImdwaW8iLCB0b28/IFdlIHNob3VsZCBhc2sgUnVzc2VsbCBLaW5nIChjY2VkKS4N
Cj4+Pj4+DQo+Pj4+PiBGdWxseSBjb252ZXJ0ZWQgdG8gd2hhdD8gIFRoZSBnZW5lcmljIGhhbmRs
aW5nIHdoZXJlIHRoZSBpMmMgY29yZSBsYXllcg0KPj4+Pj4gaGFuZGxlcyBldmVyeXRoaW5nIHRv
IGRvIHdpdGggcmVjb3ZlcnksIGluY2x1ZGluZyB0aGUgc3dpdGNoIGJldHdlZW4NCj4+Pj4+IG1v
ZGVzPw0KPj4+Pj4NCj4+Pj4+IGkyYy1weGEgX2ludGVudGlvbmFsbHlfIGNhcmVmdWxseSBoYW5k
bGVzIHRoZSBzd2l0Y2ggYmV0d2VlbiBpMmMgbW9kZSBhbmQNCj4+Pj4+IEdQSU8gbW9kZSwgYW5k
IEkgZG9uJ3Qgc2VlIGEgZ2VuZXJpYyBkcml2ZXIgZG9pbmcgdGhhdCB0byBhdm9pZCBjYXVzaW5n
DQo+Pj4+PiBhbnkgYWRkaXRpb25hbCBnbGl0Y2hlcyBvbiB0aGUgYnVzLiAgR2l2ZW4gdGhlIHVz
ZSBjYXNlIHRoYXQgdGhpcyByZWNvdmVyeQ0KPj4+Pj4gaXMgdGFyZ2V0dGVkIGF0LCBhdm9pZGlu
ZyBnbGl0Y2hlcyBpcyB2ZXJ5IGltcG9ydGFudCB0byBrZWVwLg0KPj4+Pg0KPj4+PiBXaHkgaXMg
aXQgbm90IHBvc3NiaWxlIHRvIGhhbmRsZSBnbGl0Y2hlcyBpbiBhIGdlbmVyaWMgd2F5PyBJIGd1
ZXNzIGl0DQo+Pj4+IGRlcGVuZHMgb24gdGhlIHBpbmN0bCwgYnV0IHdlIGNvdWxkIHRyZWF0IGEg
d29yc3QtY2FzZSBzY2VuYXJpbyB0bw0KPj4+PiBhc3N1cmUgdGhlIHN3aXRjaCBiZXR3ZWVuIHN0
YXRlcyBpcyBkb25lIHByb3Blcmx5Lg0KPj4+DQo+Pj4gUGxlYXNlIGxvb2sgYXQgaG93IGkyYy1w
eGEgc3dpdGNoZXMgYmV0d2VlbiB0aGUgdHdvLCBhbmQgZGVjaWRlIHdoZXRoZXINCj4+PiB0aGUg
Z2VuZXJpYyBpbXBsZW1lbnRhdGlvbiBjYW4gZG8gdGhlIHNhbWUuDQo+Pg0KPj4gVGhlIGhhbmRs
aW5nIG9mIGdsaXRjaGVzIGZyb20gaW5pdGlhbGl6YXRpb24gbG9va3MgZ2VuZXJpYyB0byBtZS4g
SSBzZWUNCj4+IHRoYXQgdGhlcmUgYXJlIHNwZWNpZmljIGNsZWFyL3Jlc2V0IHJvdXRpbmVzIHRo
YXQgYXJlIGluIHRoZQ0KPj4gKHVuKXByZXBhcmVfcmVjb3ZlcnkoKSBjYWxsYmFja3MsIGJ1dCB0
aGVzZSBjYWxsYmFja3MgYXJlIG5vdCByZXBsYWNlZA0KPj4gYnkgdGhlIGdlbmVyaWMgaTJjIHJl
Y292ZXJ5IGFuZCB3aWxsIHN0aWxsIGJlIHVzZWQgaWYgZ2l2ZW4gYnkgdGhlDQo+PiBkcml2ZXIu
IFRoZSBvbmx5IHRoaW5nIHRoZSBnZW5lcmljIHJlY292ZXJ5IGRvZXMgaXMgdG8gc3dpdGNoIHRo
ZSBwaW5tdXgNCj4+IHN0YXRlLiBXZSBjYW4gZGlzY3VzcyB3aGV0aGVyIHdlIHdhbnQgdG8gY2hh
bmdlIHRoZSBwaW5tdXggc3RhdGUgZmlyc3QNCj4+IG9yIGNhbGwgdGhlICh1bilwcmVhcHJlX3Jl
Y292ZXJ5KCkuDQo+IA0KPiBSaWdodCwgdGhlIGtleSBwb2ludCBpMmMtcHhhIGRvZXMgaXMgdGhh
dCBvbiBwcmVwYXJlOg0KPiAtIHJlYWQgdGhlIGN1cnJlbnQgc3RhdGUgb2YgdGhlIFNDTCBhbmQg
U0RBIGxpbmVzIGFuZCBzZXQgdGhlIEdQSU8gdG8NCj4gICAgcmVmbGVjdCB0aG9zZSB2YWx1ZXMu
DQo+IC0gdGhlbiBzd2l0Y2ggdGhlIHBpbm11eCBzdGF0ZS4NCj4gDQo+IFRoYXQgbXVzdCBiZSBw
cmVzZXJ2ZWQsIG90aGVyd2lzZSBpZiBTQ0wgaXMgYmVpbmcgaGVsZCBsb3cgYnkgdGhlIEkyQw0K
PiBtYXN0ZXIsIGFuZCB3ZSBzd2l0Y2ggdG8gR1BJTyBtb2RlLCBTQ0wgd2lsbCBiZSByZWxlYXNl
ZC4gIFNvIHRoZQ0KPiBkcml2ZXIgbmVlZHMgdG8gYmUgaW52b2x2ZWQgYmVmb3JlIHRoZSBwaW5t
dXggc3RhdGUgaXMgY2hhbmdlZC4NCg0KSSB1bmRlcnN0YW5kLCBhbmQgSSBhZG1pdCB0aGF0IEkg
ZGlkbid0IHNlZSB0aGlzIGNhc2UuIEluIG15IG1pbmQsIHRoZSANCm1hc3RlciB3b3VsZCBhbHdh
eXMgYmUgaW4gKGFsbW9zdCkgYSByZXNldCBzdGF0ZSBiZWZvcmUgY2FsbGluZyBmb3IgU0RBIA0K
cmVjb3ZlcnksIHNvIGl0IHdvbid0IGhvbGQgYW55IGxpbmVzLg0KVGhlc2Ugc3RlcHMgY2FuJ3Qg
YmUgZ2VuZXJpYywgb2YgY291cnNlLiBBbHNvLCBub3QgYWxsIEkyQyBtYXN0ZXJzIGhhdmUgDQph
IHdheSB0byBzaG93IHRoZSBzdGF0ZSBvZiBpdHMgbGluZXMuIEZvciB0aGVzZSBtYXN0ZXJzLCBv
bmUgaWRlYSB3b3VsZCANCmJlIHRvIHJlc2V0IHRoZW0gYmVmb3JlIGNhbGxpbmcgaTJjX3JlY292
ZXJfYnVzKCkNCg0KPiANCj4gLS0NCj4gUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5h
cm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvDQo+IEZUVFAgaXMgaGVyZSEgNDBNYnBz
IGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3QhDQo+IA0KDQo=
