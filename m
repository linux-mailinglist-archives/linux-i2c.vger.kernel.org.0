Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B03B320D864
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jun 2020 22:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387445AbgF2Tip (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jun 2020 15:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387443AbgF2Tho (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Jun 2020 15:37:44 -0400
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (mail-cys01nam02on0608.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe45::608])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B922C02A548
        for <linux-i2c@vger.kernel.org>; Mon, 29 Jun 2020 05:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQKofBUxeSTi3yN52VU1iejOYI4Rdw+u5eNKepwBxgoBzZs+j6bsZXlcCmuERGXFyfQPq/eabO+TM8H2JrzylmOgkiBNAHC1Z30vaYk1Du90ggdK9Mxu3QkIEPKPt0B6+1Bybdb19I31fQ8csappUvJS/YMW7zmCJuT5JNs/H9u+Q5NBziBSw4QrvCGozxd3h/ws7b/olIvO5GLDM3QqExZXlaUzIi+wlT41lugQizn89hmEEDLNxHFdMLZQ3hib8I6oVAMoR0CpA01elsIB0ts0VM/8bZBy0KuBTAWNbDH8WyhfakLQqImZjkJ5jVrh/cc6nwoX1Vy0YOki7IKQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4McnrIsgOb+snJUUp4IUuz65BbUGlOT6cxwQSwY6VJ0=;
 b=MIH4Epbh2p5z0bM1Iocee3HjhR+JjiMDNbrwYbUkN5UyVMh5/ClnY0YVxljRTdNkTzVCVXkTVqFS8jdnOLVtN+IgsRe/EphbRKD8ADOqA8UfglotrWBCXYVdfER5nHZz8wCdvG92CVePwlnpHqx4FQXuIvKU8SogHjkrjKCvjCVRW7cdM0OlaRA2U4DR+dWxga0uMyMjE75dybi+6Mz7OsI6nb9g7PSrVk4tVFLph6pzIzFDoTHrXy8pYwibH5KeBragCBIPt9gLnk6YyazwoZgG2qOcP4MVS4PfPWDxUpVMc63WgFg3Al/f/WXyE1shWv8wt+SGwb1puaDcwtA2DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4McnrIsgOb+snJUUp4IUuz65BbUGlOT6cxwQSwY6VJ0=;
 b=DUdirrlxSbvOnkrDwsxmp5qCV9Hr+3D9zXGOnjqP2LIXu56w2hxR9h4i3YZQfB5IFhMXjsa6y7uMqUVQtJdck39M8arSAWutc6l3cU9vdSUFxD64alFAprKN6PnK6GYpw4CCk0a+t5N58etu+96+yeZM/OSf6u7Jbo4PyY8c71I=
Received: from SN4PR0201MB3486.namprd02.prod.outlook.com
 (2603:10b6:803:51::12) by SN6PR02MB4205.namprd02.prod.outlook.com
 (2603:10b6:805:35::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 12:52:29 +0000
Received: from SN4PR0201MB3486.namprd02.prod.outlook.com
 ([fe80::c1d:375a:a8ad:f142]) by SN4PR0201MB3486.namprd02.prod.outlook.com
 ([fe80::c1d:375a:a8ad:f142%6]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 12:52:29 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH 1/5] i2c: xiic: Fix broken locking on tx_msg
Thread-Topic: [PATCH 1/5] i2c: xiic: Fix broken locking on tx_msg
Thread-Index: AQHWQZR16ESRHITuAECl/9tfqloeHqjpJiIAgAWbm4CAAN/ssA==
Date:   Mon, 29 Jun 2020 12:52:29 +0000
Message-ID: <SN4PR0201MB3486DFA2BC59C76906CE48B0CA6E0@SN4PR0201MB3486.namprd02.prod.outlook.com>
References: <20200613150751.114595-1-marex@denx.de>
 <MWHPR0201MB348439A109964704D30EF0B4CA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
 <fee2d0a5-138d-fc31-ed46-348706bc0491@denx.de>
In-Reply-To: <fee2d0a5-138d-fc31-ed46-348706bc0491@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: aad423c1-e384-4a23-20b9-08d81c2b4838
x-ms-traffictypediagnostic: SN6PR02MB4205:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB420598B2254E26E236130F6DCA6E0@SN6PR02MB4205.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iT1YF7cRhXNZeJ0Xmfsbv87zEbTjnvSY/6/JBww5ORShHeMpdY4903twV2RCTGpXVp+5RmE8p+Uxi3AoPoxFGbVxKyaJCAtdnyKGVUIEC2x0V1BjKe5qkdE3q4PQ+wEEmy7LFMxtVwHyQr2HPCdqyiwZSJ8wgKTAUhDkGkpZalQ12wzOyt8RmfEQ/TPpgyzkWF9CrDAKRHV3AZ4tv1C8HHzF2KxsfZB3+kh36R3KFiGUQwbWvYWP8w2UOeks1CobU4Jl7iVvHkND9b1IX/AWu92F7vukWG5kugbAFVAD24fSkulOOslM4oyLz12q54mu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0201MB3486.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(396003)(39860400002)(366004)(136003)(33656002)(4326008)(55016002)(83380400001)(8676002)(52536014)(478600001)(5660300002)(9686003)(2906002)(26005)(54906003)(186003)(66446008)(7696005)(66476007)(66556008)(64756008)(6506007)(53546011)(76116006)(316002)(110136005)(86362001)(71200400001)(8936002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: aQaZnkSBkeMMBd1FRjVoX3ZIpU1jqGm9SmA7nmvtRUHSunJ92j+rpXCl//AeReak3joK7Syozri8mZcclboETlEYboCNAVeEEBwQUhv/UBsupDdx/bLagzLWnHs1yI+yuRaw1oJSCRXPXCkxPY8NCM1M7EBzElW42yUWX2r4MPlD7J1b1HRtZOB7ihy1LkhKC/CeZpUnf8R5mdVp0yVzQ2nJH7B42J7d6X4HYf5hhbJTTKgmu6qrKEIMeGEJK5TdbcnV/Hl8O01zDDv0kkEzkEJhBz+jkNYxuTXpyIOvoBeHAFLtmSp/fJa7rRq2mZoWZsPF01xGElgsoPaeGJPdkZ8GLbt4nHKJvaBFetzzFbwCPCrRg9jgd0J8gtz7URCGOJeZIc6x99ylAryCcJZgpkcAmBKE7pi7u4KvpbPpgAv7z9L8bJtxStL0Rci7WmGBoMohohzcOM4f2S3v+nWj9SQqfie2tmOCVuZbV+qg8e8sL3sDu2L6SXIt37A6rcRO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB3486.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aad423c1-e384-4a23-20b9-08d81c2b4838
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 12:52:29.2225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CPp78K35RAjSWs8uqy+qAf2YPEr7sjjQr550TNMeA+9AnOKEleOq6cTJKhANy5We
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4205
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyZWsgVmFzdXQgPG1h
cmV4QGRlbnguZGU+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAyOSwgMjAyMCA0OjQ5IEFNDQo+IFRv
OiBSYXZpdGVqYSBOYXJheWFuYW0gPHJuYUB4aWxpbnguY29tPjsgbGludXgtaTJjQHZnZXIua2Vy
bmVsLm9yZw0KPiBDYzogTWljaGFsIFNpbWVrIDxtaWNoYWxzQHhpbGlueC5jb20+OyBTaHViaHJh
anlvdGkgRGF0dGENCj4gPHNodWJocmFqQHhpbGlueC5jb20+OyBXb2xmcmFtIFNhbmcgPHdzYUBr
ZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNV0gaTJjOiB4aWljOiBGaXggYnJv
a2VuIGxvY2tpbmcgb24gdHhfbXNnDQo+IA0KPiBPbiA2LzI2LzIwIDI6MTEgUE0sIFJhdml0ZWph
IE5hcmF5YW5hbSB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gWy4uLl0NCj4gDQo+ID4+IEBAIC02
OTksMTQgKzcwOCw3IEBAIHN0YXRpYyBpbnQgeGlpY194ZmVyKHN0cnVjdCBpMmNfYWRhcHRlciAq
YWRhcCwNCj4gPj4gc3RydWN0IGkyY19tc2cgKm1zZ3MsIGludCBudW0pDQo+ID4+ICAJaWYgKGVy
ciA8IDApDQo+ID4+ICAJCXJldHVybiBlcnI7DQo+ID4+DQo+ID4+IC0JZXJyID0geGlpY19idXN5
KGkyYyk7DQo+ID4+IC0JaWYgKGVycikNCj4gPj4gLQkJZ290byBvdXQ7DQo+ID4+IC0NCj4gPj4g
LQlpMmMtPnR4X21zZyA9IG1zZ3M7DQo+ID4+IC0JaTJjLT5ubXNncyA9IG51bTsNCj4gPg0KPiA+
IE9uIGFuIFNNUCBzeXN0ZW0gd2l0aCBtdWx0aXBsZSBpMmMtdHJhbnNmZXIgY29tbWFuZCBzY3Jp
cHRzIHJ1bm5pbmcsIHRoZQ0KPiBhYm92ZSBjcml0aWNhbCBzZWN0aW9uIGlzIGV4cGVjdGVkIHRv
IGNhdXNlIHNlcmlvdXMgdHJvdWJsZSBvdmVyd3JpdGluZyB0aGUNCj4gcHJldmlvdXMgbXNnIHBv
aW50ZXJzLg0KPiA+IEJ1dCB0aGF0J3Mgbm90IGhhcHBlbmluZyBhcyB0aGUgaTJjLWNvcmUgaXMg
aGF2aW5nIGEgbG9jayBhdCBhZGFwdGVyIGxldmVsDQo+IGluc2lkZSBpMmMtY29yZS1iYXNlLmMg
KHJ0X211dGV4X2xvY2tfbmVzdGVkKS4NCj4gPiBTbywgdGhlIHJhY2UgY29uZGl0aW9uIGJldHdl
ZW4gZGlmZmVyZW50IHRocmVhZHMgaXMgbm90IHBvc3NpYmxlLiBUaGV5IGFyZSBhbGwNCj4gc2Vy
aWFsaXplZCBieSB0aGUgbG9ja2luZyBpbiBpMmMtY29yZS4NCj4gPg0KPiA+IEFsdGhvdWdoIG5v
IGlzc3VlcyBhcmUgc2VlbiBpbiB0aGUgdGVzdHMsIHRoZSBjb250ZW50aW9uIHdpdGhpbiB0aGUg
ZHJpdmVyIGlzDQo+IHN0aWxsIHBvc3NpYmxlIChpc3IgdnMgeGlpY194ZmVyKSwgaWYgdGhlcmUg
aXMgYSBzcHVyaW91cyBpbnRlcnJ1cHQuIEFuZCB0aGlzIHBhdGNoIGlzDQo+IG5lZWRlZCBpbiB0
aGF0IGNhc2UuDQo+IFRoZSBjb250ZW50aW9uIGhhcHBlbnMgYmV0d2VlbiB0aGUgdGhyZWFkZWQg
aW50ZXJydXB0IGhhbmRsZXINCj4geGlpY19wcm9jZXNzKCkgYW5kIHRoaXMgeGlpY194ZmVyKCkg
ZnVuY3Rpb24uIFdoaWxlIHlvdSBjYW4gbm90IGhhdmUNCj4geGlpY194ZmVyKCkgcnVubmluZyBv
biB0d28gQ1BVIGNvcmVzIGF0IHRoZSBzYW1lIHRpbWUsIHlvdSBjYW4gaGF2ZQ0KPiB4aWljX3hm
ZXIoKSBydW5uaW5nIG9uIG9uZSBDUFUgY29yZSBhbmQgeGlpY19wcm9jZXNzKCkgb24gYW5vdGhl
ciBDUFUgY29yZSwNCj4gYW5kIHRoYXQgd2lsbCBsZWFkIHRvIHByb2JsZW1zLg0KDQpZZXMsIHRo
aXMgcGF0Y2ggaXMgbmVlZGVkIGZvciB0aGF0IGNhc2UuDQoNCj4gDQo+IFsuLi5dDQo=
