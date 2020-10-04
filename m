Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79C49282A01
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Oct 2020 11:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725898AbgJDJ7p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Oct 2020 05:59:45 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:31073 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDJ7p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Oct 2020 05:59:45 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Sun, 04 Oct 2020 05:59:44 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1601805584; x=1633341584;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AP8ni3Vd6+mRhuhYoqE6Az62hXSrxfQ1N3DJJgiZ8l0=;
  b=I3AtmEE0g21DOxnnDFUzFlhdNJuB4X4IRIioo0CdP9Zi3Xk8XPH7hzt9
   d1bKiWWyAYCuJn4yYgoHNPhT6o12Pg/OtRD2X39HpFaWxsyXvSA4NuMtO
   WjsRj04e7CRIuOeKi5uV+30khDb0OKTmFJI0JwXrxjfqLodcHyDuHpndR
   fsL1wcNJDVvypBSVuDUtcIfMbTmi4ZqNlTRTuR3zyprjaV/vlHSAoB38p
   XRzW0ieDBIz2z8ruConbiLlNqXFFTTnr1Frct2oBE2Dzc2nDxnKgJw3zo
   HaSOJmhRioSkAMJ0VYlAAyKzBsktt8Mw1vg3AfxFPswePmGrjqWTietrS
   Q==;
IronPort-SDR: miQc5vGSVdQR+0zwV7gtKU251uXhx+BeDFn3OLGVsO2WjlxIubx8Hyed5k4I+RKxtPcdcHwz2d
 P1XUWcaZATYvT/hO2XeH/97geR+wEQnoVTUF4QUUmJxVHxSobrW4lhwye5hEctlD7PRFSecA2+
 Lbun7ORV20ft90jeKR/VXpG8uhXLfZgeI5EDkaTS9nd8e2iQpA194QH/RmIz1SaIFv1gXngNbq
 w1C4OhEvYLQXmWAk/bocqeW6JXHhXF92zY1u0Kzagb4uQoiLZ5FnE7GCSijz9QR95hNBbVLxyS
 0co=
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; 
   d="scan'208";a="98179908"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Oct 2020 02:52:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 4 Oct 2020 02:51:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Sun, 4 Oct 2020 02:51:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRVvpZ1Fpnoh31IF+5eyKf0zoN/1UZXDokje5QSbLJCFQkNsvgZbeW4bm9Tjwh8GLGSY7PXl8LDEY8Bt9H93UXqiLvi4GeqKvR/m25hqYQE1jJrdb0B9lEuAdMehtuxifDPaPV0bOKRy79frpwtuO8vWZX2SclQfjnXjd2DuQKwouv1hngme2wr1yofga/g96J2+qJVHujJKzmdAU2FY/S/yJ97Xw3BTPDDwq3Vsk1+IOI2JhQNBoY2UhIDX5V2A8nbkWshkzi4aD6eXjXwc2OZDInH4LYArV5CbVLagaNCsiSUtDaQzfyen9WlC42wOPXcDHeDslia8pFVHwii+Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AP8ni3Vd6+mRhuhYoqE6Az62hXSrxfQ1N3DJJgiZ8l0=;
 b=gXvssghJSERSd7EXAVGVem0H/UQgQ2/GryhTPRi/z+NP6NhsSItO5BXL5UgjLSaoenxdmv6GNWietixn6o9t7QNZhlx0XI3ljU9y+4VFHjyCSYp5Nd4Sz2gS5il/kQPdPB34M5Tbd/HDHuz/Dt8QXAGKIS7khVG6QyNBPa6WckxsEK55SEPD06dXv3pjoqISvgNCoc78SaHusF5loP8AlbkjrULXvhOE3q9QhUZM6Doc9USlXXnw9hi94h5e8TZViXN6OfIK2Jo2EAiQI/CAasfNgj0fox3jkaAiOn+eyFmZGv4lkq94Rr3ijTMdx2jc3svWABL9UDxvzSrpMOUZ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AP8ni3Vd6+mRhuhYoqE6Az62hXSrxfQ1N3DJJgiZ8l0=;
 b=dN4mUtw7KzIVDwbX+aKRrNVQH+axpz1A8JptZsrOUpSPJuj7DpmleQ1SfE74Jyfxe//Qk0L1Pxj4yks/TWyfUytVrOv5ywaWwulyxRq2MXHQoyPodaqNYuXx79W+2sOt2HIIoRXOMuc8K9JcrqsH9fxj03C8pYh0u3pogsG0eW0=
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 (2603:10b6:903:b1::22) by CY4PR11MB2008.namprd11.prod.outlook.com
 (2603:10b6:903:22::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Sun, 4 Oct
 2020 09:52:34 +0000
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::908:a628:69ca:d62e]) by CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::908:a628:69ca:d62e%7]) with mapi id 15.20.3433.042; Sun, 4 Oct 2020
 09:52:34 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <linux@armlinux.org.uk>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <wsa@kernel.org>,
        <alpawi@amazon.com>
Subject: Re: [PATCH v2] i2c: pxa: move to generic GPIO recovery
Thread-Topic: [PATCH v2] i2c: pxa: move to generic GPIO recovery
Thread-Index: AQHWmi9pf3VV/Rv8CkWGTksqCCjml6mHLBKAgAAHtwA=
Date:   Sun, 4 Oct 2020 09:52:34 +0000
Message-ID: <df004cc9-ac2c-775c-f567-4767e5971a2c@microchip.com>
References: <20201004091656.1004575-1-codrin.ciubotariu@microchip.com>
 <20201004092455.GI1551@shell.armlinux.org.uk>
In-Reply-To: <20201004092455.GI1551@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: armlinux.org.uk; dkim=none (message not signed)
 header.d=none;armlinux.org.uk; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [86.121.164.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3e0863d-9dff-428f-3688-08d8684b37f7
x-ms-traffictypediagnostic: CY4PR11MB2008:
x-microsoft-antispam-prvs: <CY4PR11MB200855B24F01098CC9BA79E4E70F0@CY4PR11MB2008.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: glS1inJHqqKydFYGxDM+3bcQPBk4LGNtK/iD8D6sE3z1Co5WvGBGP1M3OR0SbvD6jdBGdAku3vL1dkljQ9lWIuMizRynwSWZuKN5VExslo73SJ2uIhbQ9TcjK05SmEhEnos6/n2iNuAyckQq7AL0U5QAFhgOdBCySepdbkKDAqg3RZDFR5O/n9iUNpwFItXGYKmySaxVlLjvE5SEA/JPxJ2CQ0qLCAC+h07iLaX0yGjDT7KwukuXhlnV+PvkXEjd0LXvZl2dEPc2PttMs0eiN/4izzigIwuImRUAGT1/fNGyi4FveipKrWQ+kNIsNM7Ys+wi//ZcWPBG4O2kQcJpKrnoI0GXLAqMmwYPBetRYmLyiDwTVLeyGhkSiCwRP1QtIVoBlC/CCyC5R1kBkrkuT++WFb3EMKQBByJBlFIJERRx95OiOri4vYkYHBXZ4BBbToFrqEddLj7dKYopOQwa9scEp9+O7RioLlUDrT5cZHw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1101MB2341.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39850400004)(396003)(346002)(136003)(366004)(86362001)(83380400001)(6486002)(6506007)(83080400001)(31686004)(8676002)(26005)(2616005)(6512007)(8936002)(478600001)(53546011)(6916009)(186003)(54906003)(36756003)(31696002)(66556008)(66476007)(66946007)(64756008)(66446008)(4326008)(966005)(316002)(76116006)(5660300002)(2906002)(91956017)(71200400001)(41533002)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: QsvyZj74OY7yIAs2vNGF4feHamT+VYWg6XnETxJ+gZWlF74f+imbe1XrfRe613906t2Q45gu/Q939lHiObedLOuUsfHS7E44rlSgiwHjx/4zxmAErm0DbK/C8gsEKs2eWmGDBh05nwQ4TFxA00Kx8E300oJO2MGEhyKXpbEKwEB3h3J8fyIaOYogC44QeiSUz0YJbj5Djch4P8r0rM9agps1Iu7ExJ6yFhYHBSr2AchS3WtbSaX/DhVE19/pDsw438K7lexCttTTsUOgeGrK5QnIK0Nnc7OmJCgjqVt6MoTrLdVyj3On3q6kCgMNBF9uy2h7otz+uoHVAk1XtNOdMxjGMnrpBzL0C/Z0echnmBuLTZoVaFf2qJmOAS7TiFuO36suZfFvNQDZaPc6RnCP3ay+GGEFbblWDTFvqvfkjSXpffpkXMMbqXQHo9p2v9gSt5TIzUdDeCgQCDsdmq073sTVLds8LPRu83Hu3+rMdRwLHCIt2bBIXrhZPd+6aHC+0uC+NsB+x3Be+156xGfwRFCBegFB0IWo95xjUpyAVYwvwt6eDwHdqMjff0ur4bc+NqlVN6lHA9Vjowm789QY+mi6sm3/4PakjkpKj4OSEtuyGNv9qp2gLZ8PA4a3RXzfyyDEt+gB8o0aEGNaqp1TtQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C02F39BE745AB4E8F64DC0C2F074A51@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e0863d-9dff-428f-3688-08d8684b37f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2020 09:52:34.2619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: juqBDHeIzNUjPnG2ACtRp+75Tg3SusyaZTKaGVOH6+nfLEVRaUzibpfGonXUiL5g0vw/eaQoyXQHqwf6Levg7vqxECJYgZs47yMiMunwEkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB2008
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDQuMTAuMjAyMCAxMjoyNCwgUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWluIHdyb3Rl
Og0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIFN1biwgT2N0
IDA0LCAyMDIwIGF0IDEyOjE2OjU2UE0gKzAzMDAsIENvZHJpbiBDaXVib3Rhcml1IHdyb3RlOg0K
Pj4gU3RhcnRpbmcgd2l0aA0KPj4gY29tbWl0IDc1ODIwMzE0ZGUyNiAoImkyYzogY29yZTogYWRk
IGdlbmVyaWMgSTJDIEdQSU8gcmVjb3ZlcnkiKQ0KPj4gR1BJTyBidXMgcmVjb3ZlcnkgaXMgc3Vw
cG9ydGVkIGJ5IHRoZSBJMkMgY29yZSwgc28gd2UgY2FuIHJlbW92ZSB0aGUNCj4+IGRyaXZlciBp
bXBsZW1lbnRhdGlvbiBhbmQgdXNlIHRoYXQgb25lIGluc3RlYWQuDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogQ29kcmluIENpdWJvdGFyaXUgPGNvZHJpbi5jaXVib3Rhcml1QG1pY3JvY2hpcC5jb20+
DQo+PiAtLS0NCj4+DQo+PiBUaGlzIHBhdGNoIGlzIG5vdCB0ZXN0ZWQuDQo+Pg0KPj4gQ2hhbmdl
cyBpbiB2MjoNCj4+ICAgLSByZWFkZGVkIHRoZSBwaW5jdHJsIHN0YXRlIGNoYW5nZSB0byBkZWZh
dWx0IGZyb20gdGhlDQo+PiAgICAgdW5wcmVwYXJlX3JlY292ZXJ5IGNhbGxiYWNrOw0KPiANCj4g
SSBkb24ndCB0aGluayB5b3UndmUgYnVpbGQgdGVzdGVkIHRoaXMgcGF0Y2guLi4NCg0KWW91J3Jl
IHJpZ2h0LCBzb3JyeSBhYm91dCB0aGF0LiBJIHVzZWQgYSB3cm9uZyBjb25maWcuLi4gV2lsbCBm
aXggaXQgDQpyaWdodCBhd2F5Lg0KDQpCZXN0IHJlZ2FyZHMsDQpDb2RyaW4NCg0KPiANCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXB4YS5jIGIvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1weGEuYw0KPj4gaW5kZXggMzVjYTJjMDJjOWI5Li4wMDZjYzFkNTkzMWYgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXB4YS5jDQo+PiArKysgYi9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLXB4YS5jDQo+PiBAQCAtMjY0LDkgKzI2NCw2IEBAIHN0cnVjdCBweGFf
aTJjIHsNCj4+ICAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICBoc19tYXNrOw0KPj4NCj4+
ICAgICAgICBzdHJ1Y3QgaTJjX2J1c19yZWNvdmVyeV9pbmZvIHJlY292ZXJ5Ow0KPj4gLSAgICAg
c3RydWN0IHBpbmN0cmwgICAgICAgICAgKnBpbmN0cmw7DQo+PiAtICAgICBzdHJ1Y3QgcGluY3Ry
bF9zdGF0ZSAgICAqcGluY3RybF9kZWZhdWx0Ow0KPj4gLSAgICAgc3RydWN0IHBpbmN0cmxfc3Rh
dGUgICAgKnBpbmN0cmxfcmVjb3Zlcnk7DQo+IA0KPiBpMmNfcHhhX3VucHJlcGFyZV9yZWNvdmVy
eSgpIHJlZmVycyB0byBwaW5jdHJsIGFuZCBwaW5jdHJsX2RlZmF1bHQgd2hpY2gNCj4geW91J3Zl
IHJldGFpbmVkIGluIHRoaXMgdmVyc2lvbiBvZiB0aGUgcGF0Y2gsIGJ1dCB5b3UndmUgZGVsZXRl
ZCB0aGUNCj4gbWVtYmVycyBmcm9tIHRoaXMgc3RydWN0dXJlIC0gd2hpY2ggd2lsbCBsZWFkIHRv
IGEgYnVpbGQgZXJyb3IuDQo+IA0KPiAtLQ0KPiBSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8v
d3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8NCj4gRlRUUCBpcyBoZXJlISA0
ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCENCj4gDQoN
Cg==
