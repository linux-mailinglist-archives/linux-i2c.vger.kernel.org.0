Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 616FF27419C
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Sep 2020 13:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgIVLuf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 07:50:35 -0400
Received: from mail-bn7nam10on2060.outbound.protection.outlook.com ([40.107.92.60]:22656
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726688AbgIVLuf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 22 Sep 2020 07:50:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7pJHVB+yponqUtMV9XnQ7wKvvamXposvv2A9+cKA+HHs+RWuZUtcdtBFyu+Hux4q5qLMNqWC2NAdnUh2aEhv6b+Bqg2ZH3mghQ0X77Y+HDQKpQpULfmxzZcN/ydkR7WwB9Vl/vBcxNeGek/kk0lRGTMrwcfRGY416hnJRp+iqAFjYGuzK8dW+aVlmWULSRzoMdxs56SUoPZLFYndEHwZRY8E0IoARmhO/IA4AusQYg/GCOCNjM6kzF6GwSsYQWuG5zS+yjPEQ8ojeXN73A/rKmVLCG04Rco0/+3hnDKDJOhBb7syPTAL27hVSOLfvDtV01Wtr4dLMYwAjFCEW2dfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrrt4OiZr2cEIpb3rPXht/zP6Nc6UX4BfS4PwIAXYQ8=;
 b=LIDrNF7n8LSIdSa6jbMUSHMwFkoGQGhYYf2wcZU9uyE6ElbRCbp42sGGOZRuzaOrlzJe/eGwbUWJIa/jnaNVRfDlzehT/xaGgCSlzbQfrIYwuThYs9n9xcvL3G+IvbO9s4vbb9WDm+3yu3CS8xUbDGhT7pS9d++G8jtkk6ZoFf+LQctSDZTEbbUnPfMbo3tPOpX3pTFrubssVkTVAtgHOwzhAjpyEUFY0bUnIWp4bsmVG6wFrXfDy6cvxpZZzLlCcXlAdzd+dcU9IJZLSF8LulQY3MNXh5fu2fOf/rs7ubZNTX853DGnGKnLcCdPp/ejYWeORRs5n+o4MvKUptWTGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrrt4OiZr2cEIpb3rPXht/zP6Nc6UX4BfS4PwIAXYQ8=;
 b=LcywJk8awgCaoWpc8PkZ3+yTxn/FEXEJ+iNJtt2oistvdKdcK1hYXQRZ3XqXTHQ6QLpFi2W4MhPMpHV6FVJKEtfLucNtLEb4ScyTP8TSBIHYagi7b5dePJeJ8fgi0kp7GMu/jkPazxSRwxVBgjYRSkaOXfVJtw3PgIZYovXvD1E=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR10MB1399.namprd10.prod.outlook.com
 (2603:10b6:903:29::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13; Tue, 22 Sep
 2020 11:50:31 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::7c3b:e8e3:3d1b:284d]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::7c3b:e8e3:3d1b:284d%7]) with mapi id 15.20.3391.022; Tue, 22 Sep 2020
 11:50:31 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "nicolas.vincent@vossloh.com" <nicolas.vincent@vossloh.com>,
        "jochen@scram.de" <jochen@scram.de>,
        "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>
CC:     "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: cpm: Fix i2c_ram structure
Thread-Topic: [PATCH] i2c: cpm: Fix i2c_ram structure
Thread-Index: AQHWkMda5X7+faY7PUWT7yG/DN3vhql0i5UA
Date:   Tue, 22 Sep 2020 11:50:30 +0000
Message-ID: <088c2ddaae9c929f8786e913864de3f25f883cba.camel@infinera.com>
References: <20200922090400.6282-1-nicolas.vincent@vossloh.com>
In-Reply-To: <20200922090400.6282-1-nicolas.vincent@vossloh.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.37.92 
authentication-results: vossloh.com; dkim=none (message not signed)
 header.d=none;vossloh.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c658c20c-8f4e-419d-3a68-08d85eedb511
x-ms-traffictypediagnostic: CY4PR10MB1399:
x-microsoft-antispam-prvs: <CY4PR10MB1399CE2D5011E37381E234A8F43B0@CY4PR10MB1399.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DYpsTSnAp2D0mKC5KETiNJriMSknGcY8TsD0GDDcW8ZUrxfeU3/XtBqLU1q78PpdR78j2k9TpC+sR7vVxbu+0Vkag+v2OyXiQiVyaoNXbPeJJoPLSLQb90T+nbeUvzdqVKospNl9v3BKOIy1QpNjIE/66ee7gGPp1C/t8Y2m17hYW119ZRjP5MGFnf5uRx4ZgzDSlxFuCswH/O8PfYvMDvEZJhpyuDY5EMm8vE3R9Sf8lW3l2H0LnnCyMjH8KSd6+EYESBM0RgIaTLS7syB/yH8c0a13lrYqctPYqJGdDst3jy6xRUYL+wyabe9pJvp9qVBRq41Kh/nBgPtQxQlBYMXO4EY+CIjA88oBcLn8IZxn7mLMLtkocJhA44SJigfP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2389.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(4326008)(316002)(8936002)(478600001)(186003)(6506007)(26005)(8676002)(6512007)(83380400001)(54906003)(110136005)(66446008)(6486002)(86362001)(2906002)(36756003)(66946007)(5660300002)(66556008)(71200400001)(2616005)(64756008)(76116006)(91956017)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 8r5TuwMvpvxhchV0jQxgDG2r9hAeIFUB/PI9t4oPxov5XotWf9QtLcELLwaHLzQhLoLgpupi2WdufArzAYviPfflOjrRAoAw8Go+RwCgBvClp8959nvPLtp0jd6jZ61pqLVADXykGemO6AWgt2dHLkiL3D4Gx6NOJuIMgApyAIZuc/eXf/t5H86MGm0J0aIrPlQmopfu8a+fO5IVffJuyJZsldQIsknJjgHFJHpsiHmUScyrTs84qtANN50ZGOOrZ870dehvEo99FAa6e9Jojvu/7Dk2zzAm1BOSa7b+XiwYjisyJw1HiuIEaPxQAB8cNNZ8ocfXGDaN9EIEI3LfH2wUsMFZaTnboABgsqvIglDhJTFpsn50mJvbJ8Keqyu7eOxdhRsEpVpCH8Wpzfdrqyco+LSJV4dIeXKf+hhridg9NOhLGTRzN5JyXRd5pFK2P+lRuR4muJU6XbZT+6u39o0rTR4WffMuoroyMB32EflBik+iCLOf9M9Cui06tycGW3TDF3CclBZI37REEIIZGq+m9ly85vUXLGqD1mzIqWyKLE3V7PdznM/9t4pYJ+/K5CYnXaG6vy466ulbWayrymy68REn0y5AfWiWzRFABsIs90FERkBD2S/oufUCSs1eHzp9ynAnvQ2yx7e5JuaeAQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDCC59BAD5C18A41884C86535D50C8BC@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c658c20c-8f4e-419d-3a68-08d85eedb511
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 11:50:30.9251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P07zqC+xfVd3ikDCRo12NiNRq8SxVf9/VnEU/eRuvgVPEiBAAZE4zvG2SsCB4jPFSXWSeQXMBzo+mi/5Rqca8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1399
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIwLTA5LTIyIGF0IDExOjA0ICswMjAwLCBuaWNvLnZpbmNlQGdtYWlsLmNvbSB3
cm90ZToNCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0
aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNh
ZmUuDQo+IA0KPiANCj4gRnJvbTogTmljb2xhcyBWSU5DRU5UIDxuaWNvbGFzLnZpbmNlbnRAdm9z
c2xvaC5jb20+DQo+IA0KPiB0aGUgaTJjX3JhbSBzdHJ1Y3R1cmUgaXMgbWlzc2luZyB0aGUgc2Rt
YXRtcCBmaWVsZCBtZW50aW9ubmVkIGluDQo+IGRhdGFzaGVldCBmb3IgTVBDODI3MiBhdCBwYXJh
Z3JhcGggMzYuNS4gV2l0aCB0aGlzIGZpZWxkIG1pc3NpbmcsIHRoZQ0KPiBoYXJkd2FyZSB3b3Vs
ZCB3cml0ZSBwYXN0IHRoZSBhbGxvY2F0ZWQgbWVtb3J5IGRvbmUgdGhyb3VnaA0KPiBjcG1fbXVy
YW1fYWxsb2MgZm9yIHRoZSBpMmNfcmFtIHN0cnVjdHVyZSBhbmQgbGFuZCBpbiBtZW1vcnkgYWxs
b2NhdGVkDQo+IGZvciB0aGUgYnVmZmVycyBkZXNjcmlwdG9ycyBjb3JydXB0aW5nIHRoZSBjYmRf
YnVmYWRkciBmaWVsZC4gU2luY2UgdGhpcw0KPiBmaWVsZCBpcyBvbmx5IHNldCBkdXJpbmcgc2V0
dXAoKSwgdGhlIGZpcnN0IGkyYyB0cmFuc2FjdGlvbiB3b3VsZCB3b3JrDQo+IGFuZCB0aGUgZm9s
bG93aW5nIHdvdWxkIHNlbmQgZGF0YSByZWFkIGZyb20gYW4gYXJiaXRyYXJ5IG1lbW9yeQ0KPiBs
b2NhdGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pY29sYXMgVklOQ0VOVCA8bmljb2xhcy52
aW5jZW50QHZvc3Nsb2guY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWNw
bS5jIHwgMyArKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1jcG0uYyBi
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtY3BtLmMNCj4gaW5kZXggMTIxM2UxOTMyY2NiLi5jNTcw
MGFkZGJmNjUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtY3BtLmMNCj4g
KysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1jcG0uYw0KPiBAQCAtNjQsNyArNjQsOCBAQCBz
dHJ1Y3QgaTJjX3JhbSB7DQo+IMKgwqDCoMKgwqDCoMKgwqB1aW50ICAgIHR4dG1wOyAgICAgICAg
ICAvKiBJbnRlcm5hbCAqLw0KPiDCoMKgwqDCoMKgwqDCoMKgY2hhciAgICByZXMxWzRdOyAgICAg
ICAgLyogUmVzZXJ2ZWQgKi8NCj4gwqDCoMKgwqDCoMKgwqDCoHVzaG9ydCAgcnBiYXNlOyAgICAg
ICAgIC8qIFJlbG9jYXRpb24gcG9pbnRlciAqLw0KPiAtICAgICAgIGNoYXIgICAgcmVzMlsyXTsg
ICAgICAgIC8qIFJlc2VydmVkICovDQo+ICsgICAgICAgY2hhciAgICByZXMyWzZdOyAgICAgICAg
LyogUmVzZXJ2ZWQgKi8NCj4gKyAgICAgICB1aW50ICAgIHNkbWF0bXA7ICAgICAgICAvKiBJbnRl
cm5hbCAqLw0KPiDCoH07DQoNCk5vdCBzdXJlIGlmIHRoaXMgd2lsbCBmaXQgb24gOHh4IENQVXMs
IExlcm95ID8NCg0KIEpvY2tlDQo=
