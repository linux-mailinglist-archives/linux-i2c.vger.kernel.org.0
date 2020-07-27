Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE15622EA3E
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 12:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbgG0KpD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 06:45:03 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:27508 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbgG0KpC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jul 2020 06:45:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1595846701; x=1627382701;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=D9OManMhSnJ2ZpGth+OhcoCoUwpfPMcYjAJbIOD/AT0=;
  b=s65dKAsxYxJjLAe7zBDnBVA9Yi2HjPXIphxJisZTbgRTqw+6dJXyzycZ
   F7Xb6cOdwo1ugeD+VDh0B0WOaagiDydvCH7A5S5/BALfyIumO7NkzEI26
   78ly+6dH98XK6DmcvhJX/H8dl0rxZsIqFdNEoh5cKhpn9rpq0Giz3Xmkw
   Y+m6K9G27lOImdbRs/QX2Qg/IlGA4D2DTAxDxWnapqZI3ZsZDM+0RZi+z
   PT5kX3HV4OYg2F0XUCtNnisNXhp6hDUU+mWLdsWMYl65L6etzuX7HLG7Z
   mXgEWboYSjkRlFPdK5pjTwoVXFWr+PiyO59fDrxc9gp2Iu9iftil/YSCq
   A==;
IronPort-SDR: Gky0xfNwqTHsb27ON6wLqSmGeqe5VHlZLmGO09cOAi0Nojqo+AgL6s9RWx6QGeMY/rGpOBuV18
 ADPAhP1+7rTtJ1A7RhFwDK8GEXuiYw8zs6Luy5lvAT2WQAwYHrZ8Al9JIF9FYPgfNXitfi5PF6
 6+pAuMZ8uZa6U1kXUr5gHrTXLqZEYwUcAnXeo4VABA76t+60FCR5Wn644clzERduJRVs8YV6Gw
 t4gAtC6BusVqYVQ976CshmC25mvTKmb/HY1BE3xqdxGSLA92WB/qYshWoZ5baw7oZoQNR9ZdWV
 a2I=
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="20658831"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2020 03:45:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 27 Jul 2020 03:44:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Mon, 27 Jul 2020 03:44:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMRjPytVHyJXGNOwo0dH0i0ez/Mx2Q2kStF+lmMKZE3+xdg8YtHu+lkqUIKdd4CbfISm0FsYtg+SqBU/fZDpBbNB4SiALBm2EpnADF+BioUf9ABw+mqKjNdK/vokfmg0sUSRu0XogA/1ZsPRjLUodagA9aXHQnM7VhuBcDWnGL42OWnNrq0pZ9HNTkhJlesMviUJPHahxFEL4KDrEb4GWec4DOArBtp0sFuxWrZPUgDEiXPQ3uVCM5fVupoEoHZuL526PzcJzh81rPxPE4EMSjafGb2ksZDdULvxOYo7GM+ITJ7a1KtjrdRYR1R0KtWA+KkhwYKGwvxn0Zw355pNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9OManMhSnJ2ZpGth+OhcoCoUwpfPMcYjAJbIOD/AT0=;
 b=KzMNNUmu2lBbc8ueYmp5Be0pqiZoPs/NyrkVtMwJSYc5niBZXFLIoUM6HAhDbcx2cYji7bOfbQKRJm+y2I2FE2Hk6tAVdnQwc2FcqdjsRItM12HFMdBR4L4veG8voMMrXAx1Rt89n2gZiZu4SQtSWUU5O6XSH+dXRbrJxbwvWB2soaakTnQadKuwnS19OZjNk0LPVS6ZYYAyGoz42SK7dE+/f1PcZUwcIxAveI2S/f5Z44X2tv3GGr0XQVUw8n0JGq+wOrEao3LaQveWkKjE5o/QcoK2sAZEYt+e4uQ4txuF7dpYDxLqt/M0kdmpwEnC/+c4MEneeVYMz9eGxUGTig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9OManMhSnJ2ZpGth+OhcoCoUwpfPMcYjAJbIOD/AT0=;
 b=aWamxGIbFGWXns0rMOnTNP3LYA4XodROzSTz10lGdvWC+isHhw6uliuXsEbH9+DUKCFdDm7rIRDTtoZ6EYs7h2fjuxTpCWMslHxWFBgZvruBRsOLLv/fSTF/XXVGLCGUIXuIV+iSmFf9kccCICeGA6ST9X9I2pbLTXaSM5kKK7A=
Received: from SN6PR11MB3504.namprd11.prod.outlook.com (2603:10b6:805:d0::17)
 by SN6PR11MB2608.namprd11.prod.outlook.com (2603:10b6:805:57::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Mon, 27 Jul
 2020 10:44:58 +0000
Received: from SN6PR11MB3504.namprd11.prod.outlook.com
 ([fe80::851c:67fc:a034:9ea0]) by SN6PR11MB3504.namprd11.prod.outlook.com
 ([fe80::851c:67fc:a034:9ea0%4]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 10:44:57 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <linux@armlinux.org.uk>, <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <kamel.bouhara@bootlin.com>
Subject: Re: [RFC PATCH 1/4] dt-binding: i2c: add generic properties for GPIO
 bus recovery
Thread-Topic: [RFC PATCH 1/4] dt-binding: i2c: add generic properties for GPIO
 bus recovery
Thread-Index: AQHWRkS/OBUazr8JiUiilPsVNX+PNqj5l1gAgB3AVoCAABRggIAEDVcA
Date:   Mon, 27 Jul 2020 10:44:57 +0000
Message-ID: <b3a04528-0053-16bf-f092-147685298ced@microchip.com>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-2-codrin.ciubotariu@microchip.com>
 <20200705211918.GB1055@kunai> <20200724193913.GD1227@ninjato>
 <20200724205209.GC1551@shell.armlinux.org.uk>
In-Reply-To: <20200724205209.GC1551@shell.armlinux.org.uk>
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
x-ms-office365-filtering-correlation-id: 6ccff93d-b5b3-4a24-de72-08d8321a1b31
x-ms-traffictypediagnostic: SN6PR11MB2608:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2608A3AB5E5CC850B36271E0E7720@SN6PR11MB2608.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x/IyN5dl0U/M/3YWM5OCwH0zlwnHrDBe+y7oZHJY1+GeDUnBWTfSRdfb9QkjqHuaeT+Sdex2Ue7Bw41jBlDJx4SSLXm+Y0toBKAjv/lz4r2xC8FwyaHb4hmKaRiaf28OVaala4G1FzhYihhQfkUAofyc9cU2jXBTboEWdnGQHhzFdB5UlBbOa8oLRHei3iSOaOS/5hmRs1/A+9GI+qJhYmjLulwUjhK4Qu2hQBgl2eC8W68W9mJkusk5rGeTkwhw3AnxlwsXw6bqHJtszTqijS4QHKoxZ+ZKvWXAqwSb9pB0Oi2VcNcoFFqf+sO4nU0DHcMauRhLfqig00VssKn86TW60PihH/ce3TDzlmFk0C764nfGyBd4ZGOHFYTsTT/SzmOqg/nVe1v4kK7VJG/604ZDDRM6riTGNE8kZPuwgo4k5hDfOujYU9WCXeHybULS1ZKUZe4dI7pW1MNPbSQZ0gVRX12aAqrTjBgUWAoO1Js=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3504.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39860400002)(136003)(376002)(346002)(396003)(83380400001)(478600001)(6486002)(5660300002)(91956017)(71200400001)(76116006)(64756008)(66556008)(66476007)(66446008)(66946007)(8936002)(966005)(2616005)(4326008)(186003)(53546011)(6512007)(31686004)(31696002)(36756003)(86362001)(2906002)(316002)(110136005)(54906003)(6506007)(26005)(8676002)(41533002)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: oqCQlYavvUDIbd7kipSn4bTnq7oGcHgvcUA7wx8Bm7o+E1u3eelRR6EqvZS2GpE5360QzII9Bef7DYrSl5nxS2ia7nMXiDk7SZwSD7xOBUJ5uKq3eGhItrB/erwjGh/DHvRbplXD9u3NeFmecNKQViouz7MdVmhxf9k3sEmx8byu5YVBBcb5uyOjq8XgY6JwPXhg6oOT9Qc7s3sQB01i5dZY8yd3SMcU+CsOq/D7BmxAqNstrXMBV9fXBjZDkqDIzdoP5Om8fU7UlQjVPNhPr7u9cA1erljO7ncwkuJw7qRJlrvbpTGq7YYFoIQgrO7nqXjN2B72TvLJ+ueU/EwgLcG7PPWYpg3wkFRQvLEJ71wYfWzu5Rk2J62hfB6tqsaMpxVuHAZjZoksJe2CmOZiUPAyU/d1PtQgjV4kXIe5+Ms8Wcl2tHLaXAcHm0tXLYoaDNW1+0mwp9TxrmwCE2m0PIC5elM/P8PCzXwvxLBWTB/pkofB/8nGByOrPcNSV2Vp
Content-Type: text/plain; charset="utf-8"
Content-ID: <1EA0633CE3FF824EB793801932D1E19E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3504.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ccff93d-b5b3-4a24-de72-08d8321a1b31
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 10:44:57.8327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a5ti+wnmCrtad3YkUdKFyU1wsFAvx/vXpedoGk5NyeD2ZBRuGIG8VmhLosYiVmOuiydnHQdCeUl+HTvT5bUtjenjFiXI8egpW/Hed4E2UxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2608
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjQuMDcuMjAyMCAyMzo1MiwgUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWluIHdyb3Rl
Og0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIEZyaSwgSnVs
IDI0LCAyMDIwIGF0IDA5OjM5OjEzUE0gKzAyMDAsIFdvbGZyYW0gU2FuZyB3cm90ZToNCj4+IE9u
IFN1biwgSnVsIDA1LCAyMDIwIGF0IDExOjE5OjE4UE0gKzAyMDAsIFdvbGZyYW0gU2FuZyB3cm90
ZToNCj4+Pg0KPj4+PiArLSBwaW5jdHJsDQo+Pj4+ICsgYWRkIGV4dHJhIHBpbmN0cmwgdG8gY29u
ZmlndXJlIFNDTC9TREEgcGlucyB0byBHUElPIGZ1bmN0aW9uIGZvciBidXMNCj4+Pj4gKyByZWNv
dmVyeSwgY2FsbCBpdCAiZ3BpbyIgb3IgInJlY292ZXJ5IiBzdGF0ZQ0KPj4+DQo+Pj4gSSB0aGlu
ayB3ZSBzaG91bGQgc3RpY2sgd2l0aCAiZ3BpbyIgb25seS4gVGhhdCBpcyB3aGF0IGF0OTEgYW5k
IGlteCBoYXZlDQo+Pj4gaW4gdGhlaXIgYmluZGluZ3MuIHB4YSB1c2VzICJyZWNvdmVyeSIgYXMg
YSBwaW5jdHJsIHN0YXRlIG5hbWUgYnV0IEkNCj4+PiBjYW4ndCBmaW5kIGFueSBmdXJ0aGVyIHVz
ZSBvciBkb2N1bWVudGF0aW9uIG9mIHRoYXQuIFBYQSBpcyBub3QgZnVsbHkNCj4+PiBjb252ZXJ0
ZWQgdG8gdGhlIGJlc3Qgb2YgbXkga25vd2xlZGdlLCBzbyBtYXliZSBpdCBpcyBubyBwcm9ibGVt
IGZvciBQWEENCj4+PiB0byBzd2l0Y2ggdG8gImdwaW8iLCB0b28/IFdlIHNob3VsZCBhc2sgUnVz
c2VsbCBLaW5nIChjY2VkKS4NCj4gDQo+IEZ1bGx5IGNvbnZlcnRlZCB0byB3aGF0PyAgVGhlIGdl
bmVyaWMgaGFuZGxpbmcgd2hlcmUgdGhlIGkyYyBjb3JlIGxheWVyDQo+IGhhbmRsZXMgZXZlcnl0
aGluZyB0byBkbyB3aXRoIHJlY292ZXJ5LCBpbmNsdWRpbmcgdGhlIHN3aXRjaCBiZXR3ZWVuDQo+
IG1vZGVzPw0KPiANCj4gaTJjLXB4YSBfaW50ZW50aW9uYWxseV8gY2FyZWZ1bGx5IGhhbmRsZXMg
dGhlIHN3aXRjaCBiZXR3ZWVuIGkyYyBtb2RlIGFuZA0KPiBHUElPIG1vZGUsIGFuZCBJIGRvbid0
IHNlZSBhIGdlbmVyaWMgZHJpdmVyIGRvaW5nIHRoYXQgdG8gYXZvaWQgY2F1c2luZw0KPiBhbnkg
YWRkaXRpb25hbCBnbGl0Y2hlcyBvbiB0aGUgYnVzLiAgR2l2ZW4gdGhlIHVzZSBjYXNlIHRoYXQg
dGhpcyByZWNvdmVyeQ0KPiBpcyB0YXJnZXR0ZWQgYXQsIGF2b2lkaW5nIGdsaXRjaGVzIGlzIHZl
cnkgaW1wb3J0YW50IHRvIGtlZXAuDQoNCldoeSBpcyBpdCBub3QgcG9zc2JpbGUgdG8gaGFuZGxl
IGdsaXRjaGVzIGluIGEgZ2VuZXJpYyB3YXk/IEkgZ3Vlc3MgaXQgDQpkZXBlbmRzIG9uIHRoZSBw
aW5jdGwsIGJ1dCB3ZSBjb3VsZCB0cmVhdCBhIHdvcnN0LWNhc2Ugc2NlbmFyaW8gdG8gDQphc3N1
cmUgdGhlIHN3aXRjaCBiZXR3ZWVuIHN0YXRlcyBpcyBkb25lIHByb3Blcmx5Lg0KDQo+IA0KPj4+
IFJ1c3NlbGwsIGRvIHlvdSBvYmplY3QgbmFtaW5nIHRoZSBwaW5jdHJsIHN0YXRlIGZvciBidXMg
cmVjb3ZlcnkgaW4NCj4+PiB0aGUgcHhhIGkyYyBkcml2ZXIgZnJvbSAicmVjb3ZlcnkiIHRvICJn
cGlvIj8NCj4+DQo+PiBObyByZXNwb25zZSwgc28gZmFyLiBJIHN1Z2dlc3Qgbm93IHRvIHN1cHBv
cnQgdGhlICJyZWNvdmVyeSIgbmFtaW5nIGJ1dA0KPj4gbWFyayBpdCBhcyBkZXByZWNhdGVkLiBP
cGluaW9ucz8NCj4gDQo+IEkgZG9uJ3QgaGF2ZSBhIHByZWZlcmVuY2Ugb24gdGhlIGV4YWN0IG5h
bWluZy4NCj4gDQo+IC0tDQo+IFJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGlu
dXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLw0KPiBGVFRQIGlzIGhlcmUhIDQwTWJwcyBkb3du
IDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQ0KPiANCg0K
