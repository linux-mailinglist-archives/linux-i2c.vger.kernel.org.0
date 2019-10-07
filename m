Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6F9CDF0F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Oct 2019 12:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbfJGKR5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Oct 2019 06:17:57 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:60279 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbfJGKR5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Oct 2019 06:17:57 -0400
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Claudiu.Beznea@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="Claudiu.Beznea@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 5USl9mbWtAgZ4ia6EZPYaYIjFVs7+dr3Avd2ZcqZpDa9y5cIXj+AuND96pqQi1VncGB9GXijKI
 HcTd2PbVqSK3vie/n5bCPu9bHpY3KnJgDMasNV1a+xP4x6imSGvyn6C382Q7yf3QzNc/x7uswL
 OsMPTxqx6gZ4c6llc7dU7DvuBNc94zfjm4yqKm4tvvQzsocLtHgxaniIj8rrnlQFEtWgIgT0In
 JMnmhDNCWG+e/5hoV2OwL99ghiy4T8MxdylTxurBt6Kbc+85o8piE8MXS+sEdzPxEEkSyDZV0V
 CxI=
X-IronPort-AV: E=Sophos;i="5.67,267,1566889200"; 
   d="scan'208";a="50439990"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Oct 2019 03:17:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 7 Oct 2019 03:17:55 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 7 Oct 2019 03:17:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIr/BL9AWkfWLQaLoNqkIA6djWH9ye6NehASdogXkUaAjRIJRAEXH6nXGYe0MoPJGimrpgtJC0twRRxZQ9GifE8aeIqRKXMElGRdKvfxae9bV/SiPsFbI0CM2GnmrWar5114vfHF38ifTR4RA9HD5TARWz8cR5jeiLYgFq71FULzQxmwe9o7Y3YhYcfNX/SkHamMO/TPDywyx7P9K/VcKyWxVVFuy3b8SHqSzgx/p6gbswspocQo9imBF5QWGGlKKxLlMpws8I8UqtsefAFQ1WEpO5tOk8KNEQLWHfr0G0JdVfita2jK9yaTttO4HeL/pXe4NDgf6hhZpjKTK52bnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCinXrQsF9Vv9oAkdP/UMLfmpo9xs/uBD0hJcAKD+UE=;
 b=Zkfn0gw31gzNGXvSOWLqv+E1l8D6Md3dpxAs0c0L/IgrbkRau5EzjCPS/Vj+oJbihUbxR47OseqKh7kH2MjAkGjs7ETET6Xi57GQH1Ym3RPDr0KLDOEiNhbOL3HniOny3yP1CxKK1LjSiZZog50NLN0NIslnjzdLiweSrG9rOL/5eCcxm2HL3ImEBvl0ApO190lJgSnQgDtwc2fbqqk7OWHHANw5P3qjXz1PwUILBcZozsMrmO1TpFHd9z5Viqty1GKXSswN3ZFHLFX5ro3c96pZbb7qw0ncnkTbkXhGv1VgCL4rJva/8+M8pzkjr8wJ48jAnDc+ie5lwImJVNkMIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCinXrQsF9Vv9oAkdP/UMLfmpo9xs/uBD0hJcAKD+UE=;
 b=WNAbgQNSdCy2JmV6gfgQ+/AEudQZR6+xx5muvT1RIGrn7G1PB1XewmG+zdyqIZNztlH3Taiywf0Is7cOIz7wdP29oxon2EcTwEehVRl5GXNpZ2Ka2rChBOmt553IFooCj9+JBA+W+ydqrHqoum+4APwfFcmpPKu/bMP0Kiyo4QY=
Received: from DM6PR11MB3225.namprd11.prod.outlook.com (20.176.120.85) by
 DM6PR11MB4283.namprd11.prod.outlook.com (10.255.9.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.25; Mon, 7 Oct 2019 10:17:53 +0000
Received: from DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::3874:9f3c:5325:d22]) by DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::3874:9f3c:5325:d22%6]) with mapi id 15.20.2327.023; Mon, 7 Oct 2019
 10:17:53 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <u.kleine-koenig@pengutronix.de>
CC:     <kamel.bouhara@bootlin.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/4] i2c: at91: implement i2c bus recovery
Thread-Topic: [PATCH 2/4] i2c: at91: implement i2c bus recovery
Thread-Index: AQHVepcLzh2wL57HtEiaALvY7CXMr6dK8nmAgAQJRIA=
Date:   Mon, 7 Oct 2019 10:17:53 +0000
Message-ID: <3c3e157e-a2bc-eb6d-b59d-0c7415692206@microchip.com>
References: <20191002144658.7718-1-kamel.bouhara@bootlin.com>
 <20191002144658.7718-3-kamel.bouhara@bootlin.com>
 <08e99a4b-851e-0bee-4c5a-8578b42c283e@microchip.com>
 <20191004203933.tfhr6cwbsq2hxrov@pengutronix.de>
In-Reply-To: <20191004203933.tfhr6cwbsq2hxrov@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0048.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::36) To DM6PR11MB3225.namprd11.prod.outlook.com
 (2603:10b6:5:59::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191007131745279
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c727b257-b2f6-49b4-e165-08d74b0f9d5b
x-ms-traffictypediagnostic: DM6PR11MB4283:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB428349EF71F36B693E3DC507879B0@DM6PR11MB4283.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:404;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(39860400002)(366004)(346002)(136003)(189003)(199004)(305945005)(4326008)(7736002)(14444005)(99286004)(6436002)(6246003)(6486002)(229853002)(6512007)(36756003)(14454004)(5660300002)(66574012)(4744005)(478600001)(25786009)(66066001)(81166006)(256004)(8936002)(8676002)(81156014)(76176011)(52116002)(486006)(446003)(11346002)(2616005)(476003)(6506007)(54906003)(386003)(31696002)(53546011)(316002)(26005)(6916009)(6116002)(186003)(3846002)(2906002)(71200400001)(66446008)(64756008)(66556008)(66476007)(66946007)(86362001)(31686004)(71190400001)(102836004);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR11MB4283;H:DM6PR11MB3225.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lQSTEcXHGQuZeOOiSJH+cpxJQeng1uH2BxkPKQU5tMwr/EQitPiKrPDHTNlHc4gt2NYHTEXumUUxPtftzAd9oGMnlvtrUido8hrsv4GEU8ER9xCNWp7YX+Lss/+2ZgY6f2iJIBueCJx1mBOT+zl1Deva0ypUnZbhridZxSJ10Qq5uj4WD57CRL1TQTsdt+wq8l5C4rVFbBs78iAMFSPcuq4AHg0D3mQ5D8Uix/MejxZS68ZyQj+6btLOZ7ZEm5hIAB5XpDH7JyRqLStpJjUUfHvLoZYQZpz15NyY7CIXM6Rx0bXEuuph9YOU1o50iic3k/X0L6EH3c9WnL+U6+JPKjWb+XAeIV4zhQlqyMn/RVDMsKlM/0oM6+fLyu3fnfw/OpWZ6fAcQ1RDXKDEB6C3My0IHha3EBGY7SFwgi6omhg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A41E6E2BDD92C54BA28BFAEBA2B63155@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c727b257-b2f6-49b4-e165-08d74b0f9d5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 10:17:53.5270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1gzBgSh3ZR3398eP1OKI0o4C3AfidnnIw4YpKsZXzyCEPZvLv39bI0lOeGP6NzzoMeJrGSb2PWrYXHNwTqBf8NV8h/YIVk+v9anklAqkkAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4283
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDA0LjEwLjIwMTkgMjM6MzksIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOg0KPiBFeHRl
cm5hbCBFLU1haWwNCj4gDQo+IA0KPiBPbiBGcmksIE9jdCAwNCwgMjAxOSBhdCAwOTozNToyM0FN
ICswMDAwLCBDbGF1ZGl1LkJlem5lYUBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4gSGkgS2FtZWws
DQo+Pg0KPj4gT24gMDIuMTAuMjAxOSAxNzo0NiwgS2FtZWwgQm91aGFyYSB3cm90ZToNCj4+PiAr
c3RhdGljIGludCBhdDkxX2luaXRfdHdpX3JlY292ZXJ5X2luZm8oc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldiwNCj4+PiArCQkJCSAgICAgICBzdHJ1Y3QgYXQ5MV90d2lfZGV2ICpkZXYpDQo+
Pj4gK3sNCj4+PiArCXN0cnVjdCBpMmNfYnVzX3JlY292ZXJ5X2luZm8gKnJpbmZvID0gJmRldi0+
cmluZm87DQo+Pj4gKw0KPj4+ICsJZGV2LT5waW5jdHJsID0gZGV2bV9waW5jdHJsX2dldCgmcGRl
di0+ZGV2KTsNCj4+PiArCWlmICghZGV2LT5waW5jdHJsIHx8IElTX0VSUihkZXYtPnBpbmN0cmwp
KSB7DQo+Pg0KPj4gWW91IG1heSB1c2UgSVNfRVJSX09SX05VTEwoKSBoZXJlLg0KPiANCj4gQ2Fu
IGRldm1fcGluY3RybF9nZXQgcmV0dXJuIE5VTEw/IEZyb20gYSBxdWljayBsb29rLCBpdCBjYW5u
b3QuDQoNCkxvb2tpbmcgcXVpY2tseSB0aG91Z2ggaXQsIHllcywgaXQgc2VlbXMgaXQgY2FuJ3Qu
DQoNCj4gDQo+IHJ1bGUgb2YgdGh1bWI6IElTX0VSUl9PUl9OVUxMIGlzIHdyb25nIGFzIGl0IGlz
IGEgc2lnbiBvZiBwb29yIHJldHVybg0KPiB2YWx1ZSBzZW1hbnRpY3MuDQo+IA0KPiBCZXN0IHJl
Z2FyZHMNCj4gVXdlDQo+IA0K
