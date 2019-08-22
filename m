Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5556C9978E
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2019 17:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388421AbfHVPAU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Aug 2019 11:00:20 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:22069 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731841AbfHVPAT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Aug 2019 11:00:19 -0400
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: X7f4+q/mxeiGHuydG+ip6MKS2GGaVdwC6vFpwZnfPQgUy1N2GzIdyQPH53a4eiCO2gsV/rgcqL
 Yv17GZSMElkCjdOgRehNk6vJVDMe3UR4haf9nwes29MrdMMTNDaMoT03ouOIQIXVI/IHyMCzNP
 CM5PbIUlxNox3/cM1P9I7x9faLP5melrqItSpO1gSD565RN3FriGZHpke1FuNC6KhFll2HjG2o
 C1yF6WTRHu3J8/nD/FAOKulK9R22WbF2Dx1Wqe7+9Ywx2uaC9y/f1IB5ktnBsOtueOdDTfck34
 3Gg=
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; 
   d="scan'208";a="44613787"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Aug 2019 08:00:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 22 Aug 2019 08:00:15 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 22 Aug 2019 08:00:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kan7eV//VPz3nQehNhRL56TmDaGZWL1/6jtgjUTzMcP5soWb4HWYlXS1umUI0JyVly9+qNYa0vQWyd47QxWW65d8N2POpIit68gY8nFWPyYwni7vFqNm0hjyZCPXOt0aU1uYOrbF+L4/rQVG3d9zxCkG7PW8Sw9ojWdDRRewPBOtxl5rMuW+nxFsgz6uGXzHVuWzf2sQuTSxC6DftI0bFYV+zGpcS57jkFBkwiJnszS/WMKZkBz0sGtu86cy67ufWh2/4QJkQ5oaNZSF7ERQME7XDW9hggLmAY1LFxF4Z/vHuzKaMN5AgFNDvlpRO/3gDthgDuVbcRhN1DbUIkku6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kl0VYrt3KK9LyPp6QznMAEVCycM+JW/WI/7ZZfDGv5E=;
 b=jPoL7J9IIzBVHzFS1I6YgBC1UjeIQX21HKm/oXE+Zc/upKQJwwfsFnBzI7nKCOBhsZ/LJJCCJVEY/3FKIBM6v8dkexOHpyaDqG2aQao7dm2ZkkvV+bmb4+m+mHxE5EPDU/Detj45zJxrQqjLQeLVswjYmeNbqOcspz7339pdI9f69S/kdUS7pTdD+j8bzflbKRhfk5ViSvGp2hIZkl6xNOI5IMVl/Q7FWfgIMm6nSJf7algUY5OJ5LIPszVtT4g2eDXNcUVF1NCTrRpLpsDYiJRs1dSWxEgQZGsPlw4zeM1x6SZm3JR/p3b4PBQdKbQDeVhKtfSfZ3IHPFkF5uKUYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kl0VYrt3KK9LyPp6QznMAEVCycM+JW/WI/7ZZfDGv5E=;
 b=QZiGuQ//qdNSaSIycZtTcbpGlEmT2Hcy/ual7DRYEz0Feq5PCPr/PRnkLHvuIMbTIJJ6F0vD5XqQrmqkFSNnvsEuq0uxPRi5w321iipfVhtbxCsKcA6HFECpjpGYK37YTmE/xqxWveIO9S4fox7GMd8MxxFsGJME4v5P6aNAJhk=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1993.namprd11.prod.outlook.com (10.168.107.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 15:00:14 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3%10]) with mapi id 15.20.2178.020; Thu, 22 Aug
 2019 15:00:14 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pierre-yves.mordret@st.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>
CC:     <peda@axentia.se>, <mark.rutland@arm.com>,
        <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v3 0/9] i2c: add support for filters
Thread-Topic: [PATCH v3 0/9] i2c: add support for filters
Thread-Index: AQHVNljuO/4Zfm2qEEOYNYIbMTanpabGqLQAgEDdtAA=
Date:   Thu, 22 Aug 2019 15:00:14 +0000
Message-ID: <867070c3-02c8-da1b-04d9-0a1b628577de@microchip.com>
References: <1562678049-17581-1-git-send-email-eugen.hristev@microchip.com>
 <20190712082044.6eteunzehyptsibk@M43218.corp.atmel.com>
In-Reply-To: <20190712082044.6eteunzehyptsibk@M43218.corp.atmel.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0801CA0083.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::27) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190822175452533
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e89e3d0-5a7d-4999-f064-08d727116fef
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:DM5PR11MB1993;
x-ms-traffictypediagnostic: DM5PR11MB1993:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1993FEBB5FEC75E8E8D64FBEE8A50@DM5PR11MB1993.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(366004)(39860400002)(376002)(136003)(396003)(189003)(199004)(6486002)(53546011)(52116002)(386003)(6506007)(66446008)(53936002)(8936002)(76176011)(6512007)(4326008)(31696002)(66946007)(110136005)(66476007)(5660300002)(26005)(14454004)(54906003)(102836004)(6246003)(478600001)(186003)(316002)(486006)(36756003)(99286004)(25786009)(107886003)(66556008)(2501003)(81166006)(3846002)(2201001)(71190400001)(71200400001)(64756008)(6436002)(229853002)(86362001)(446003)(8676002)(81156014)(11346002)(256004)(305945005)(476003)(6116002)(7416002)(66066001)(2906002)(7736002)(2616005)(31686004);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1993;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RvTJ2z+oiYSmHAA0K91VXWfwjRToaeEtf6i1z0nZBNyzJRTxXYJp3UAprd/ulpOIB6jHbYCjeiuyiDc54X05e/QMj/42FV91xRJkkGoWDhdzLFGLpqP80ycnkPo20RPS2MkYze4z2CFWKeoyfo2IUQpBS9GFeX3mFoGi6S2Asmpowsllg2eSBZVVyhZhK7XSSuQ6l49OW0+PaIjjH5r/VY4C4DvFd5z6IX3+rj3EDHduK3MHQSJRuuvBgwZ2fFOc0V9MK3B7XoAWGyyrdWJ+goP7zN1lCLOz3pt6dJgZilTnQZNV+OMDFwdnlWPfv976eK1nzvnvN5Zn9oUmqbgPW0RMrGBA4SA9uS8+Y1RMO1wa3pG0Wq4ao7U5l1cP72ej8ul5ALUsQusnSz/HxmEbfEk1+eeVmVSxBtyGkmSc0FE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19D95610CCA5FD42B389A130ED300BED@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e89e3d0-5a7d-4999-f064-08d727116fef
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 15:00:14.3996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0l2sVt/c0QpVwnGYq/kOMuRcz/jHaVw5YYuPZWNz3CHyd5y/dX+Q7n0wvfCM8+LMmxFDUv6xO2DDo224TwO7/NFTSCM/AW1RB7DdcBpd2vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1993
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDEyLjA3LjIwMTkgMTE6MjAsIEx1ZG92aWMgRGVzcm9jaGVzIHdyb3RlOg0KPiBPbiBU
dWUsIEp1bCAwOSwgMjAxOSBhdCAwMzoxOToyNlBNICswMjAwLCBFdWdlbiBIcmlzdGV2IC0gTTE4
MjgyIHdyb3RlOg0KPj4gRnJvbTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2No
aXAuY29tPg0KPj4NCj4+IEhlbGxvLA0KPj4NCj4+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBm
b3IgYW5hbG9nIGFuZCBkaWdpdGFsIGZpbHRlcnMgZm9yIGkyYyBjb250cm9sbGVycw0KPj4NCj4+
IFRoaXMgc2VyaWVzIGlzIGJhc2VkIG9uIHRoZSBzZXJpZXM6DQo+PiBbUEFUQ0ggdjIgMC85XSBp
MmM6IGF0OTE6IGZpbHRlcnMgc3VwcG9ydCBmb3IgYXQ5MSBTb0NzDQo+PiBhbmQgZW5oYW5jZWQg
dG8gYWRkIHRoZSBiaW5kaW5ncyBmb3IgYWxsIGNvbnRyb2xsZXJzIHBsdXMgYW4gZXh0cmEgYmlu
ZGluZw0KPj4gZm9yIHRoZSB3aWR0aCBvZiB0aGUgc3Bpa2VzIGluIG5hbm9zZWNvbmRzLg0KPj4N
Cj4+IEZpcnN0LCBiaW5kaW5ncyBhcmUgY3JlYXRlZCBmb3INCj4+ICdpMmMtYW5hLWZpbHRlcicN
Cj4+ICdpMmMtZGlnLWZpbHRlcicNCj4+ICdpMmMtZmlsdGVyLXdpZHRoLW5zJw0KPj4NCj4+IFRo
ZSBzdXBwb3J0IGlzIGFkZGVkIGluIHRoZSBpMmMgY29yZSB0byByZXRyaWV2ZSBmaWx0ZXIgd2lk
dGggYW5kIGFkZCBpdA0KPj4gdG8gdGhlIHRpbWluZ3Mgc3RydWN0dXJlLg0KPj4gTmV4dCwgdGhl
IGF0OTEgZHJpdmVyIGlzIGVuaGFuY2VkIGZvciBzdXBwb3J0aW5nIGRpZ2l0YWwgZmlsdGVyLCBh
ZHZhbmNlZA0KPj4gZGlnaXRhbCBmaWx0ZXIgKHdpdGggc2VsZWN0YWJsZSBzcGlrZSB3aWR0aCkg
YW5kIHRoZSBhbmFsb2cgZmlsdGVyLg0KPj4NCj4+IEZpbmFsbHkgdGhlIGRldmljZSB0cmVlIGZv
ciB0d28gYm9hcmRzIGFyZSBtb2RpZmllZCB0byBtYWtlIHVzZSBvZiB0aGUNCj4+IG5ldyBwcm9w
ZXJ0aWVzLg0KPj4NCj4+IFRoaXMgc2VyaWVzIGlzIHRoZSByZXN1bHQgb2YgdGhlIGNvbW1lbnRz
IG9uIHRoZSBNTCBpbiB0aGUgZGlyZWN0aW9uDQo+PiByZXF1ZXN0ZWQ6IHRvIG1ha2UgdGhlIGJp
bmRpbmdzIGdsb2JhbGx5IGF2YWlsYWJsZSBmb3IgaTJjIGRyaXZlcnMuDQo+Pg0KPj4gQ2hhbmdl
cyBpbiB2MzoNCj4+IC0gbWFkZSBiaW5kaW5ncyBnbG9iYWwgZm9yIGkyYyBjb250cm9sbGVycyBh
bmQgbW9kaWZpZWQgYWNjb3JkaW5nbHkNCj4+IC0gZ2F2ZSB1cCBQQURGQ0RGIGJpdCBiZWNhdXNl
IGl0J3MgYSBsYWNrIGluIGRhdGFzaGVldA0KPj4gLSB0aGUgY29tcHV0YXRpb24gb24gdGhlIHdp
ZHRoIG9mIHRoZSBzcGlrZSBpcyBiYXNlZCBvbiBwZXJpcGggY2xvY2sgYXMgaXQNCj4+IGlzIGRv
bmUgZm9yIGhvbGQgdGltZS4NCj4+DQo+PiBDaGFuZ2VzIGluIHYyOg0KPj4gLSBhZGRlZCBkZXZp
Y2UgdHJlZSBiaW5kaW5ncyBhbmQgc3VwcG9ydCBmb3IgZW5hYmxlLWFuYS1maWx0IGFuZA0KPj4g
ZW5hYmxlLWRpZy1maWx0DQo+PiAtIGFkZGVkIHRoZSBuZXcgcHJvcGVydGllcyB0byB0aGUgRFQg
Zm9yIHNhbWE1ZDRfeHBsYWluZWQvc2FtYTVkMl94cGxhaW5lZA0KPj4NCj4+IEV1Z2VuIEhyaXN0
ZXYgKDkpOg0KPj4gICAgZHQtYmluZGluZ3M6IGkyYzogYXQ5MTogYWRkIG5ldyBjb21wYXRpYmxl
DQo+PiAgICBkdC1iaW5kaW5nczogaTJjOiBhZGQgYmluZGluZ3MgZm9yIGkyYyBhbmFsb2cgYW5k
IGRpZ2l0YWwgZmlsdGVyDQo+PiAgICBpMmM6IGFkZCBzdXBwb3J0IGZvciBmaWx0ZXItd2lkdGgt
bnMgb3B0aW9uYWwgcHJvcGVydHkNCj4+ICAgIGkyYzogYXQ5MTogYWRkIG5ldyBwbGF0Zm9ybSBz
dXBwb3J0IGZvciBzYW05eDYwDQo+PiAgICBpMmM6IGF0OTE6IGFkZCBzdXBwb3J0IGZvciBkaWdp
dGFsIGZpbHRlcmluZw0KPj4gICAgaTJjOiBhdDkxOiBhZGQgc3VwcG9ydCBmb3IgYWR2YW5jZWQg
ZGlnaXRhbCBmaWx0ZXJpbmcNCj4+ICAgIGkyYzogYXQ5MTogYWRkIHN1cHBvcnQgZm9yIGFuYWxv
ZyBmaWx0ZXJpbmcNCj4+ICAgIEFSTTogZHRzOiBhdDkxOiBzYW1hNWQyX3hwbGFpbmVkOiBhZGQg
YW5hbG9nIGFuZCBkaWdpdGFsIGZpbHRlciBmb3INCj4+ICAgICAgaTJjDQo+PiAgICBBUk06IGR0
czogYXQ5MTogc2FtYTVkNF94cGxhaW5lZDogYWRkIGFuYWxvZyBmaWx0ZXIgZm9yIGkyYw0KPj4N
Cj4+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXQ5MS50eHQg
fCAgMyArLQ0KPj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy50
eHQgICAgICB8IDExICsrKysrDQo+PiAgIGFyY2gvYXJtL2Jvb3QvZHRzL2F0OTEtc2FtYTVkMl94
cGxhaW5lZC5kdHMgICAgICAgIHwgIDYgKysrDQo+PiAgIGFyY2gvYXJtL2Jvb3QvZHRzL2F0OTEt
c2FtYTVkNF94cGxhaW5lZC5kdHMgICAgICAgIHwgIDEgKw0KPj4gICBkcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLWF0OTEtY29yZS5jICAgICAgICAgICAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysr
DQo+PiAgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYyAgICAgICAgICAgICAg
IHwgNDkgKysrKysrKysrKysrKysrKysrKystLQ0KPj4gICBkcml2ZXJzL2kyYy9idXNzZXMvaTJj
LWF0OTEuaCAgICAgICAgICAgICAgICAgICAgICB8IDEzICsrKysrKw0KPj4gICBkcml2ZXJzL2ky
Yy9pMmMtY29yZS1iYXNlLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsNCj4+ICAgaW5j
bHVkZS9saW51eC9pMmMuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArDQo+
PiAgIDkgZmlsZXMgY2hhbmdlZCwgMTIxIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+
IA0KPiBIaSwNCj4gDQo+IEkgZG9uJ3Qga25vdyBpZiBpdCB3aWxsIGZpdCBvdGhlciB2ZW5kb3Jz
IG5lZWQgY29uY2VybmluZyB0aGUgYmluZGluZw0KPiBidXQgZm9yIE1pY3JvY2hpcCBpdCBzb3Vu
ZHMgZ29vZC4NCj4gDQo+IEFja2VkLWJ5OiBMdWRvdmljIERlc3JvY2hlcyA8bHVkb3ZpYy5kZXNy
b2NoZXNAbWljcm9jaGlwLmNvbT4NCj4gZm9yIHRoZSB3aG9sZSBzZXJpZS4NCj4gDQo+IFJlZ2Fy
ZHMNCj4gDQo+IEx1ZG92aWMNCj4gDQoNCkhlbGxvIFdvbGZyYW0sDQoNCldoYXQgaXMgdGhlIHBs
YW4gZm9yIHRoaXMgcGF0Y2ggc2VyaWVzPw0KDQpUaGFua3MsDQpFdWdlbg0K
