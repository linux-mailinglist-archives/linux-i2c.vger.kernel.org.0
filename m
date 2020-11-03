Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C62E2A5A0B
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 23:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729484AbgKCWXB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 17:23:01 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:12359 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729342AbgKCWXB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Nov 2020 17:23:01 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa1d8440002>; Tue, 03 Nov 2020 14:23:00 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 22:22:57 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 3 Nov 2020 22:22:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igbBPRL+zZKYcq3yYAqIYdlviW1GYJApuFypcnT88ygWyhiHAXsRoeO4Ts/hyJCm5x+hzA21lTSGMunRN4c6NlFFKrR+DeSh2C49eaZulaKaI76ylz0lY+rXfyITZTGsjNZduLQquJYwHb7MrbxPUhZCMmlGVsM5o7cKUK7EevUkCbOb+aFw0IL8TdHsocJiqmBr2QfwuRsFFMqiKSZ88tbZIAt3A4x3Rz6bx1/inFKj4HQGPCrJruTqH067xPKGwmOlIqedRKAqM7tzdgmVC6Disk19NhxYOEZcLyVHuq3oWEnZlOv/doLF0lJNdc1+oczqXrv8yWc4LrzlU+/XEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0WzHpWkWcaNfBo4tCq/4Le9XPHR5I7NXBrDD4Oh1iw=;
 b=Gvu+OnElioIM7fAqYW3hbbejX3aH1Idecs3d3dxWrhA2We0mOKzrJedxfw5+YOAuWhBDqdp9uWJEjgGG/xft86ft0pJ3y8hDbEwe1Z/lx5BpEX+0a3H+1QZnT0IbDxac961yctOl8U5Tmxr8hQ35j7vQEC280t2192XNE4TJc1Ish8m4Zarwn/IBn08yYxabgjDNF7gUVtIhYm3zrXfmX4O9gY00GFvchNLTr1C8TgYxQzske4wMwBJwk3wehr5/lIYkxT04ytzGY6EHePfXKy/7D5xGos//IcVz1uUGC2HtITokvdwNuiWhLCp/mjkafTB7EyfRabmuoTh0rAFTgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB3008.namprd12.prod.outlook.com (2603:10b6:208:c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Tue, 3 Nov
 2020 22:22:56 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f%5]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 22:22:55 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Liu Shixin <liushixin2@huawei.com>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Wolfram Sang <wsa@kernel.org>,
        Vadim Pasternak <vadimp@mellanox.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: mlxbf: Fix build error with CONFIG_ACPI disabled
Thread-Topic: [PATCH] i2c: mlxbf: Fix build error with CONFIG_ACPI disabled
Thread-Index: AQHWsQ3PPh2vaT/kqUS5dM5uxtiw0Km2/L3Q
Date:   Tue, 3 Nov 2020 22:22:54 +0000
Message-ID: <MN2PR12MB36165494D3D965C4CF96628BAB110@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <20201102121234.1343672-1-liushixin2@huawei.com>
In-Reply-To: <20201102121234.1343672-1-liushixin2@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [173.48.75.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 831c5ae7-38be-44bf-5573-08d880470344
x-ms-traffictypediagnostic: MN2PR12MB3008:
x-microsoft-antispam-prvs: <MN2PR12MB3008FF59D606EC47433E73A2AB110@MN2PR12MB3008.namprd12.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3O1B4IF7uEe/q5K3sHjYKArC9dt30HM/SmlrSrTC3VozsDLvp+jUv/4KUpPMsq/mzdwPYSsPxkQmE+JueBp9ewKtJQ+OZ1ZK/0sPOgWdH/sHJTTACjBJvm9LIP63IlIK8EbJfWN2S+6Xkl2MVclGIsuTHoXmqT3tyZX0uIRsEV5sRDlUOkjR664mR/DSy4EDa4uSREpapgl3t6/lTe86YUv2P5aOPvXYULumfHLofBE6pKAcKc+ejqs87LVtiIg1Wn3+UP6Ec+pOoORrcFubdz/C3HxoNB//O9s1DKpEpzvETrwTovkXUjr9joX/9AZ+vdqDf3sybhdws6c1Zd6X4A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(9686003)(2906002)(54906003)(86362001)(8676002)(7696005)(4326008)(33656002)(5660300002)(6506007)(8936002)(478600001)(26005)(110136005)(66946007)(66476007)(64756008)(52536014)(55016002)(186003)(71200400001)(316002)(66556008)(76116006)(66446008)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: tPS3i8ZstlYYLJzc7XfexMBdQUtwp8mFh0vNhgUJ5/HvI2iC08jnog4OI0Q1ANwVHUiRA2zPHngNRdCaFj726t3jg9VKxUiB1tEeGoSzINozJnd5RG3eqg/HbhdBBlP9vkiwKh5qaL4e20anFHmBDm2+grTtVeZHKdKJiwaHWwiFC6sJp6CpbJOoxLgiMY//GaeoAAU1AJhX9r4L5b0zSHpqHBJ66APxxBztO/zndBmu6uLzpDkUwaY4RNI/7z7H0fkWe1X8awn+oDqrQkdyDPelpRf+8zXmOE130QUjnfJK5qqpE1mJeX1+SAxENjPfGm+rZLqU+Jc6uFXzuc3f97B6FvoDGRzpUshNWUpbft2/9yWVygQq/8kVh4ixgsQJkdooe/giA/KXJyAvdBuBOld30bYPVR6c04DUOEvuZYbIj7Ap/HKEa77wzxgv4djiC4ahtsqbdHpr/IjS5exXWeqLmMgkVU8vvlwvmsZL7mk7YeUO7J8UAFbc7Ja6QsOQi9rE9u3KnyuG+F8MX5eSD1qEXT2I8YlRFHVm78utQ0rrHgpznoJuU4qPjCVB33gjxtT+xESvyyWhyFqXShLmgohaa6APLWDkAmdxrul16+Lyq4Y1Uq0rD6S/prRGLsbXAmcf5k2YtONdn2DOfhMXyg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831c5ae7-38be-44bf-5573-08d880470344
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 22:22:55.7379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VbzuwEj4mxcezA3Vyl02ZPxSRRVRu+xcLdpvKbHh7hQ9RjPxB8lQg8Glug725KkP6ejxOelD5HRElo7Do7PCrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3008
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604442180; bh=B0WzHpWkWcaNfBo4tCq/4Le9XPHR5I7NXBrDD4Oh1iw=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-exchange-transport-forked:x-ms-oob-tlc-oobclassifiers:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-forefront-antispam-report:
         x-ms-exchange-antispam-messagedata:Content-Type:
         Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=KvbqX3F/wwgUo/TB3buJD2q/GbeIfHlKch7P/8O7s3+Z1z/s/KLIhEIOKEeggQKHr
         /tcpHT78NRxtZ122RZUOpECDY5zpjVwv2jsOEz7279yvwlTNkeJ7CTk1X8pV4HGYFe
         0KTfx4vFj6mvJtxdznopxiv4pQcUpI44cA8L+52ZLT+sfc+a6OMClUuGCBtvERcAaR
         etwQU5MH7CqQvmHDrEFzJYBMcELHA6qR8s05AYpfuF1lQBDNUhyW6gTQG0oVw1XYhG
         rEcvT9xYC78u3kLrjI6RwrmA09XAB1i0lpf3tvLOjMNWMrZxj+y4E6hMITJYwvgbPP
         /GFvpVemG7hsg==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

TGl1LCB0aGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUgZml4Lg0KDQpQbGVhc2Ugbm90ZSB0aGF0
IEkgcG9zdGVkIGEgcGF0Y2ggc2VyaWVzIG9uIE9jdG9iZXIsIDI4dGggaW5jbHVkaW5nDQp0aGlz
IGZpeC4gQWxzbyBub3RlIHRoYXQgSSBwb3N0ZWQgYSB2MiB0b2RheS4NCg0KS2hhbGlsIA0KDQo+
IFN1YmplY3Q6IFtQQVRDSF0gaTJjOiBtbHhiZjogRml4IGJ1aWxkIGVycm9yIHdpdGggQ09ORklH
X0FDUEkgZGlzYWJsZWQNCj4gDQo+IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbWx4YmYuYzogSW4g
ZnVuY3Rpb24g4oCYbWx4YmZfaTJjX2FjcGlfcHJvYmXigJk6DQo+IGRyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtbWx4YmYuYzoyMjk2Ojg6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5j
dGlvbg0KPiDigJhhY3BpX2RldmljZV91aWTigJk7IGRpZCB5b3UgbWVhbiDigJhjcHVfZGV2aWNl
X3Vw4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC0NCj4gZnVuY3Rpb24tZGVjbGFyYXRpb25dDQo+ICAg
dWlkID0gYWNwaV9kZXZpY2VfdWlkKGFkZXYpOw0KPiAgICAgICAgIF5+fn5+fn5+fn5+fn5+fg0K
PiAgICAgICAgIGNwdV9kZXZpY2VfdXANCj4gDQo+IFNpZ25lZC1vZmYtYnk6IExpdSBTaGl4aW4g
PGxpdXNoaXhpbjJAaHVhd2VpLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJj
LW1seGJmLmMgfCA3ICsrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1seGJmLmMgYi9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLW1seGJmLmMNCj4gaW5kZXggZWU1OWUwZGEwODJkLi5jZDhhOTA5
NDMxYTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbWx4YmYuYw0KPiAr
KysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1seGJmLmMNCj4gQEAgLTIyNzIsNiArMjI3Miw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYWNwaV9kZXZpY2VfaWQNCj4gbWx4YmZfaTJjX2FjcGlf
aWRzW10gPSB7DQo+IA0KPiAgTU9EVUxFX0RFVklDRV9UQUJMRShhY3BpLCBtbHhiZl9pMmNfYWNw
aV9pZHMpOw0KPiANCj4gKyNpZmRlZiBDT05GSUdfQUNQSQ0KPiAgc3RhdGljIGludCBtbHhiZl9p
MmNfYWNwaV9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtbHhiZl9pMmNfcHJpdg0K
PiAqcHJpdikNCj4gIHsNCj4gIAljb25zdCBzdHJ1Y3QgYWNwaV9kZXZpY2VfaWQgKmFpZDsNCj4g
QEAgLTIzMDUsNiArMjMwNiwxMiBAQCBzdGF0aWMgaW50IG1seGJmX2kyY19hY3BpX3Byb2JlKHN0
cnVjdCBkZXZpY2UNCj4gKmRldiwgc3RydWN0IG1seGJmX2kyY19wcml2ICpwcml2KQ0KPiANCj4g
IAlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiArI2Vsc2UNCj4gK3N0YXRpYyBpbnQgbWx4YmZfaTJjX2Fj
cGlfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbWx4YmZfaTJjX3ByaXYNCj4gKnBy
aXYpDQo+ICt7DQo+ICsJcmV0dXJuIC1FTk9ERVY7DQo+ICt9DQo+ICsjZW5kaWYNCj4gDQo+ICBz
dGF0aWMgaW50IG1seGJmX2kyY19vZl9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBt
bHhiZl9pMmNfcHJpdg0KPiAqcHJpdikNCj4gIHsNCj4gLS0NCj4gMi4yNS4xDQoNCg==
