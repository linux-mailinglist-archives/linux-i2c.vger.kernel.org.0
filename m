Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6812232F1E
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jul 2020 11:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729254AbgG3JAm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jul 2020 05:00:42 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:37787 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729060AbgG3JAl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jul 2020 05:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1596099640; x=1627635640;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DPl7zT6OD2I2ZMNazeD4O8XCMK6sv762YJ9WPz23AbU=;
  b=DhC5boWoI8b6M0lPtF3dvJdQZyC5hbzLErkyCXV8il5mWPzKnC5xsnxI
   l7zQxZ07lrxlx7rBgmqiL+5HPaxdEtlu2IaGXffdachVaQp6kBqMVx5bf
   h+LRyDTEfDBDNY4Vl/dhUjCWXlXLyyu9WHyHeLs6u3C1K+dBFABAAouCv
   X7TMSRkE1eoUT/GZ9RT2/tHl1I8yFlCJFEkxty19EfrZfiCIDCvASCqAu
   qG77c97hEqL+SOA0Jf5kBuNrFMaSuKgef+M8fbLhwi/z+QvpLBal1yWMm
   lFzPcH0a4tsofclrzIaLwU1eFQmGz3jihWrZLW665M/PSDbstmwEyPRpj
   A==;
IronPort-SDR: Ik0+T1mPNf+r2YtjVGGO/107OLxBNQ1hIJVNB0I4fe1Y+ZxAj/6U6OIGgscf/rzjjysCil+Nbh
 zdx2tXgeyVdgeeze5Zw8KqrHZlMVXydGXvEDgPJHCraRUEoS0UhC8vZBduRJOyjP02X+J7Cyzb
 elHshA3MLmGgluTNvUSjFVn+4VGORiXainRbnb5PEM57O0DUEqdOYVO6oFvOHbOw36eTnMztyk
 5GcGL02ljJ26GcIHQ+HY2OQaQdt8/Xhb3El8i6nK5hsRY71Wefu62nP10lqYKh5jMMMqxgtBZn
 PTg=
X-IronPort-AV: E=Sophos;i="5.75,413,1589266800"; 
   d="scan'208";a="85157134"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jul 2020 02:00:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 30 Jul 2020 01:59:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 30 Jul 2020 01:59:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7fLXm16Iyy+lILRQqmDOx0HGXla7eeJMz6MNZRx9cceO+rsoJgaNt2GouGf7eRGd0N3shqVHadPqZ7b+1XBwi4WQIddzrjd80koUen0KNx78TLwDK3ao+yCYhuTWJGmY0vsq/8QJtWe5mawjtF0VzKdRTFCnotwEqzNfp/JmeeFE42ZoxUX8kEbwgX1QjYB6eqddK0441V/6YidOPXX8TckdGz6tII6jTEkYQikI2XipdwbeIi0++ZSM+sGo2jyD7ttC/1btF51z+hEyrjhizuM6rU7xr7BfSf0rCC6z2vCO2m/c7BlkNCiHZF/g0l28MwNj1vI+0OJgAxOiW3cXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPl7zT6OD2I2ZMNazeD4O8XCMK6sv762YJ9WPz23AbU=;
 b=MZoxwwjUxuhtUhSgQGfQV0eqrs9XIWWHCZGMMUvCnshZwoP4K5cM4jAbe7QFDbRA7cjOOCTB62cVjX7BaVVYcvArs2Ci1MsXUBUqjjnK46NWHYJNdfc50At2qkjgJlxddqCvrIV2TGYIZs6xlF0ZhfIKKHrLMFFt2xsU1fODjzEWKmZk3liKN71swQfydCHjWmiMppNeQGwdpJrMcL8rh32St6nC8w619gKcctA1h01MMmyH6VYsejSnPMvMhlR+2CAJOHQ07WhCghldH+zxWG4Q5yiKI+/sw9Y42eqlTF9OT/6HTSjvEYHAGkqJStK7xPAVxeEuc3wchxYv8iGxpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPl7zT6OD2I2ZMNazeD4O8XCMK6sv762YJ9WPz23AbU=;
 b=DuVmqvQnKLJS2H8dhjYxy8mcGQPew/8KCm7tIYTbdX8X7bhfLZynIxPv6hZj1Y31/JCMsQXvIzMjANCJzIwd0vwBR3Hf02AvgxVa+R0Mso27GC6chf3FtCfuXnefe7f5nHEw+Fe7Qycl5YjzrnbaBUtcrvcTzQrU8T/fFuFbzE8=
Received: from DM6PR11MB3500.namprd11.prod.outlook.com (2603:10b6:5:6a::19) by
 DM6PR11MB4409.namprd11.prod.outlook.com (2603:10b6:5:1df::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.16; Thu, 30 Jul 2020 09:00:36 +0000
Received: from DM6PR11MB3500.namprd11.prod.outlook.com
 ([fe80::a17e:18e2:4d49:b77e]) by DM6PR11MB3500.namprd11.prod.outlook.com
 ([fe80::a17e:18e2:4d49:b77e%5]) with mapi id 15.20.3216.033; Thu, 30 Jul 2020
 09:00:36 +0000
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
Thread-Index: AQHWRkS/OBUazr8JiUiilPsVNX+PNqj5l1gAgB3AVoCAABRggIAEDVcAgAABjYCABJhKgA==
Date:   Thu, 30 Jul 2020 09:00:36 +0000
Message-ID: <1e788319-c841-d1f1-b65c-d25052f7f90b@microchip.com>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-2-codrin.ciubotariu@microchip.com>
 <20200705211918.GB1055@kunai> <20200724193913.GD1227@ninjato>
 <20200724205209.GC1551@shell.armlinux.org.uk>
 <b3a04528-0053-16bf-f092-147685298ced@microchip.com>
 <20200727105029.GI1551@shell.armlinux.org.uk>
In-Reply-To: <20200727105029.GI1551@shell.armlinux.org.uk>
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
x-ms-office365-filtering-correlation-id: 5320b9de-a768-45b2-de1f-08d83467067a
x-ms-traffictypediagnostic: DM6PR11MB4409:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB44095D7F3E2A84F851F93D8DE7710@DM6PR11MB4409.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l2RlADyj4WRwDMSKhORogUgzfNYxpd4zYjHUcEDVueYSl3P9vLRHP3VIEc0lFBM05B7QuEI18c1LTUUqXIVMvLemefLma4AWCSFGYQGaapJg3fk52B0dt3l1PX3QBU2a5bPwQmnE/dJW1cDNeg2tFb1rTUYWh8Mi2aaxzYgOVhT3II07jAkZQT/7To+0Nn7kDBfPuPsV/j1FN5yvrk8iJn/29euojR464smXFZamyE5zgfWD3Cv9Pwn1YJRmHSKlzafeBkwtzPbnM95/sbnK79b5gPKqgpRLCWzYoQnLoJ5qe/zqz1e3T30P01QGZmbsjFpSX1z/UljusEfzAzCy8BWiINnDlh+mvF4otchqjeoXEyVN7/gW546ldct5GtxU6ADIyZzzSdC8/ZoQoGbEj+NceyWDLE3Rpl0lMl5DJxNTsGS/iElPekg6cLO2MLhbm5VCBEeTEm6Ozg5GYWFS44gNgUAddOpCb/i6njmkx5w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3500.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(376002)(366004)(396003)(136003)(346002)(8936002)(966005)(31686004)(76116006)(31696002)(54906003)(316002)(26005)(53546011)(6512007)(4326008)(8676002)(186003)(36756003)(6916009)(83380400001)(6486002)(6506007)(91956017)(5660300002)(66476007)(66946007)(64756008)(2616005)(478600001)(66446008)(66556008)(71200400001)(86362001)(2906002)(41533002)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ltVb8XPYDd1/FhAfNW8m8SJLrpRKcPr4UQ7ArH1hzhtMXFabcZH6kM26twLFI6Y3V7QT4fUEjDlKmvFlF+3iXH1iFJ+xqbJ0SUVhNTietDqvkoqO4sYbv0IC75NM/38NjlzAsqoTPspoAk5EzZYJ7FGSKyR1wPXTy7B8uPzaj+WjMlAlV/WM/LBaTYyG2G1pq5kTm30SisFjY+KDXsXE/cm94E/TAaGdNEL06SfMkcI/YmIEeluuZAje8qIqEsACAY6yQC/EBJ6+69yHFxPKmYlt3tEGoJJx/HumpdWxLz4raEnpgXmFEY8G29Ftko8D13SC20VZ5lO7/dt99BidR6mSxjS2uBH4+QN76RrleNbNSD8/JkdD6UzJj8XwudHrWHhYvJmORXgR9d5TRuw1ybCtlaU8XD9bntbOsZ5Uw6R4ky+Uh0oWAzprVSqc6noTbdTtvZlB6PQF+xwF/eJ3vrwDZriF7mjFWQWUKusbV2/DvAFA1mSeL+/4HmskSh235WQLZ4P6Qt4B7M/amRC2PKjwvIuh3S7tSeg5p/pMNcq7g9PnE/dCzIJtadrZv66qp2KOPuqzUWt00MWrSCdNe1wpap51oYSPLreDdHaZoWzLPuHRceTX0VubguLourYmSpqweRULWw0vktgt/w8ULg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <134D6824E8A8CD418840892EF70A3DC0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5320b9de-a768-45b2-de1f-08d83467067a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 09:00:36.7286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x4bnWpIs+q8cTCgQoSjj4PSx37TVu9tEMvdIC3fqmrrn0KeX/h1dy6iAE4ewsKv0h9Igk0PYMBzkPiPWa1Vxsw3CjI54iQINaaK3MT3Gwk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4409
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjcuMDcuMjAyMCAxMzo1MCwgUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWluIHdyb3Rl
Og0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIE1vbiwgSnVs
IDI3LCAyMDIwIGF0IDEwOjQ0OjU3QU0gKzAwMDAsIENvZHJpbi5DaXVib3Rhcml1QG1pY3JvY2hp
cC5jb20gd3JvdGU6DQo+PiBPbiAyNC4wNy4yMDIwIDIzOjUyLCBSdXNzZWxsIEtpbmcgLSBBUk0g
TGludXggYWRtaW4gd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5r
cyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZl
DQo+Pj4NCj4+PiBPbiBGcmksIEp1bCAyNCwgMjAyMCBhdCAwOTozOToxM1BNICswMjAwLCBXb2xm
cmFtIFNhbmcgd3JvdGU6DQo+Pj4+IE9uIFN1biwgSnVsIDA1LCAyMDIwIGF0IDExOjE5OjE4UE0g
KzAyMDAsIFdvbGZyYW0gU2FuZyB3cm90ZToNCj4+Pj4+DQo+Pj4+Pj4gKy0gcGluY3RybA0KPj4+
Pj4+ICsgYWRkIGV4dHJhIHBpbmN0cmwgdG8gY29uZmlndXJlIFNDTC9TREEgcGlucyB0byBHUElP
IGZ1bmN0aW9uIGZvciBidXMNCj4+Pj4+PiArIHJlY292ZXJ5LCBjYWxsIGl0ICJncGlvIiBvciAi
cmVjb3ZlcnkiIHN0YXRlDQo+Pj4+Pg0KPj4+Pj4gSSB0aGluayB3ZSBzaG91bGQgc3RpY2sgd2l0
aCAiZ3BpbyIgb25seS4gVGhhdCBpcyB3aGF0IGF0OTEgYW5kIGlteCBoYXZlDQo+Pj4+PiBpbiB0
aGVpciBiaW5kaW5ncy4gcHhhIHVzZXMgInJlY292ZXJ5IiBhcyBhIHBpbmN0cmwgc3RhdGUgbmFt
ZSBidXQgSQ0KPj4+Pj4gY2FuJ3QgZmluZCBhbnkgZnVydGhlciB1c2Ugb3IgZG9jdW1lbnRhdGlv
biBvZiB0aGF0LiBQWEEgaXMgbm90IGZ1bGx5DQo+Pj4+PiBjb252ZXJ0ZWQgdG8gdGhlIGJlc3Qg
b2YgbXkga25vd2xlZGdlLCBzbyBtYXliZSBpdCBpcyBubyBwcm9ibGVtIGZvciBQWEENCj4+Pj4+
IHRvIHN3aXRjaCB0byAiZ3BpbyIsIHRvbz8gV2Ugc2hvdWxkIGFzayBSdXNzZWxsIEtpbmcgKGNj
ZWQpLg0KPj4+DQo+Pj4gRnVsbHkgY29udmVydGVkIHRvIHdoYXQ/ICBUaGUgZ2VuZXJpYyBoYW5k
bGluZyB3aGVyZSB0aGUgaTJjIGNvcmUgbGF5ZXINCj4+PiBoYW5kbGVzIGV2ZXJ5dGhpbmcgdG8g
ZG8gd2l0aCByZWNvdmVyeSwgaW5jbHVkaW5nIHRoZSBzd2l0Y2ggYmV0d2Vlbg0KPj4+IG1vZGVz
Pw0KPj4+DQo+Pj4gaTJjLXB4YSBfaW50ZW50aW9uYWxseV8gY2FyZWZ1bGx5IGhhbmRsZXMgdGhl
IHN3aXRjaCBiZXR3ZWVuIGkyYyBtb2RlIGFuZA0KPj4+IEdQSU8gbW9kZSwgYW5kIEkgZG9uJ3Qg
c2VlIGEgZ2VuZXJpYyBkcml2ZXIgZG9pbmcgdGhhdCB0byBhdm9pZCBjYXVzaW5nDQo+Pj4gYW55
IGFkZGl0aW9uYWwgZ2xpdGNoZXMgb24gdGhlIGJ1cy4gIEdpdmVuIHRoZSB1c2UgY2FzZSB0aGF0
IHRoaXMgcmVjb3ZlcnkNCj4+PiBpcyB0YXJnZXR0ZWQgYXQsIGF2b2lkaW5nIGdsaXRjaGVzIGlz
IHZlcnkgaW1wb3J0YW50IHRvIGtlZXAuDQo+Pg0KPj4gV2h5IGlzIGl0IG5vdCBwb3NzYmlsZSB0
byBoYW5kbGUgZ2xpdGNoZXMgaW4gYSBnZW5lcmljIHdheT8gSSBndWVzcyBpdA0KPj4gZGVwZW5k
cyBvbiB0aGUgcGluY3RsLCBidXQgd2UgY291bGQgdHJlYXQgYSB3b3JzdC1jYXNlIHNjZW5hcmlv
IHRvDQo+PiBhc3N1cmUgdGhlIHN3aXRjaCBiZXR3ZWVuIHN0YXRlcyBpcyBkb25lIHByb3Blcmx5
Lg0KPiANCj4gUGxlYXNlIGxvb2sgYXQgaG93IGkyYy1weGEgc3dpdGNoZXMgYmV0d2VlbiB0aGUg
dHdvLCBhbmQgZGVjaWRlIHdoZXRoZXINCj4gdGhlIGdlbmVyaWMgaW1wbGVtZW50YXRpb24gY2Fu
IGRvIHRoZSBzYW1lLg0KDQpUaGUgaGFuZGxpbmcgb2YgZ2xpdGNoZXMgZnJvbSBpbml0aWFsaXph
dGlvbiBsb29rcyBnZW5lcmljIHRvIG1lLiBJIHNlZSANCnRoYXQgdGhlcmUgYXJlIHNwZWNpZmlj
IGNsZWFyL3Jlc2V0IHJvdXRpbmVzIHRoYXQgYXJlIGluIHRoZSANCih1bilwcmVwYXJlX3JlY292
ZXJ5KCkgY2FsbGJhY2tzLCBidXQgdGhlc2UgY2FsbGJhY2tzIGFyZSBub3QgcmVwbGFjZWQgDQpi
eSB0aGUgZ2VuZXJpYyBpMmMgcmVjb3ZlcnkgYW5kIHdpbGwgc3RpbGwgYmUgdXNlZCBpZiBnaXZl
biBieSB0aGUgDQpkcml2ZXIuIFRoZSBvbmx5IHRoaW5nIHRoZSBnZW5lcmljIHJlY292ZXJ5IGRv
ZXMgaXMgdG8gc3dpdGNoIHRoZSBwaW5tdXggDQpzdGF0ZS4gV2UgY2FuIGRpc2N1c3Mgd2hldGhl
ciB3ZSB3YW50IHRvIGNoYW5nZSB0aGUgcGlubXV4IHN0YXRlIGZpcnN0IA0Kb3IgY2FsbCB0aGUg
KHVuKXByZWFwcmVfcmVjb3ZlcnkoKS4NCldoYXQgSSBoYWQgaW4gbWluZCBmb3IgdGhlIGdlbmVy
aWMgcmVjb3Zlcnkgd2FzIHRvIGp1c3QgaGFuZGxlIHRoZSANCmNvbW1vbiBwYXJ0cyB0aGF0IGZv
bGxvdyB0aGUgc2FtZSBiaW5kaW5ncywgd2hpY2ggaXMgZ2V0dGluZyB0aGUgZ3Bpb3MgDQphbmQg
Y2hhbmdpbmcgdGhlIHBpbm11eCBzdGF0ZXMgYmVmb3JlIHJlY292ZXJpbmcuDQoNCkJlc3QgcmVn
YXJkcywNCkNvZHJpbg0KDQo+IA0KPiAtLQ0KPiBSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8v
d3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8NCj4gRlRUUCBpcyBoZXJlISA0
ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCENCj4gDQoN
Cg==
