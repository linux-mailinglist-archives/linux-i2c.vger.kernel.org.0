Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8521B1513E8
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2020 02:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgBDBEs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Feb 2020 20:04:48 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:64905 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726369AbgBDBEs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Feb 2020 20:04:48 -0500
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.9]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e38c32c0000>; Tue, 04 Feb 2020 09:04:44 +0800
Received: from HKMAIL102.nvidia.com ([10.18.16.11])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Mon, 03 Feb 2020 17:04:44 -0800
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Mon, 03 Feb 2020 17:04:44 -0800
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Feb
 2020 01:04:44 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.55) by
 HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 4 Feb 2020 01:04:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQ4G1zPv3UNoXuPYmIYzqfV6SX11HEQNh4azrUzVLBbCmuQVBpTobOQ1N5QHH61xBuUb4zmyD2pBDiBwin7TFfDTnzgledGmOSQ8b1n9FzE2wQfWNQ+E8RgwNsmGlHTKMTuf4S8iZGuwmZU1LjYMOMY/v26s/6ZT6+Ye4JDrv9TXK2iKiGR1WZlrk861qZS7q2y38I7u98bl9Wgfms6PnRhhV8LRZLM+gpG7vFKFi/apjN/xyEe/fbWSRVObF0mG1/ZFgXtQk5zSQhzLoDduwt/+ZNh7n/PwdZCrLWFqdKO07gQg+JtU/ZYlr72nQxUlgAiFsLArc0wSfHw2nNW1Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nyv+koBL9T3KP2D3xGDJvGoKJwUsqCGlaTCOXlduqyo=;
 b=Yvbz/vMyt29H5qF79L1hOs9cLXtOwz+YVpuUMyBWouRMBqdFk82zaTgNL2cjzs3LyKt+Uw+MtuVS+bbyyE+najbLjowYMK1+HEmcHEABRp29CTFWD6ovDTx9/YpYoHIt1G0aLaHcII7sNiU7YePGHehXlEAPw2bEfXobzeWXRnk/H9qiMeIl4MrtBAi5WH2i9GEb37Yjanra7RwH2EO9Gvmhd/rD5vpb0bO3BVz1+z6ubXdXjLc0DGqX/+wvap9gkYTNtJUgUdQYxpLmcT9b204GX5yHEp92aFcbb+U2X0aHOF34OKOvL5JmcUhfPnf54KenMJoPCxSd305D9iDO4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB2629.namprd12.prod.outlook.com (20.176.255.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.32; Tue, 4 Feb 2020 01:04:42 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::9c2:6e7d:37ee:5643]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::9c2:6e7d:37ee:5643%7]) with mapi id 15.20.2686.030; Tue, 4 Feb 2020
 01:04:41 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     AceLan Kao <acelan.kao@canonical.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: In power saving mode i2c_nvidia_gpu modules affect power
 consumption a lot
Thread-Topic: In power saving mode i2c_nvidia_gpu modules affect power
 consumption a lot
Thread-Index: AQHVts/o3SQbJk5TzEiVrmJSDepIuaf6a9ZggA6Y5YCAAXrPwA==
Date:   Tue, 4 Feb 2020 01:04:41 +0000
Message-ID: <BYAPR12MB272756FA2C034C1922B1E97FDC030@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <CAFv23Qnh2AD-Mgr=v1Ojxaob4aBjUTD+-oLdmyXzBPe0oS6vtw@mail.gmail.com>
 <BYAPR12MB27274DD4157E0CC0EB26CD98DC0E0@BYAPR12MB2727.namprd12.prod.outlook.com>
 <CAFv23QmEh4mCT6JX50OFnAGN=Zwt27OCPprKZ5ZrRKccJ+0FWA@mail.gmail.com>
In-Reply-To: <CAFv23QmEh4mCT6JX50OFnAGN=Zwt27OCPprKZ5ZrRKccJ+0FWA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-02-04T01:04:40.7541346Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=617e527c-ae41-4ec0-9827-3fe15494eb0f;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f827bb9b-bbd2-412f-5ec0-08d7a90e3757
x-ms-traffictypediagnostic: BYAPR12MB2629:
x-microsoft-antispam-prvs: <BYAPR12MB2629864A9ABA0FC0D12622A4DC030@BYAPR12MB2629.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03030B9493
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(39860400002)(366004)(376002)(346002)(189003)(199004)(6506007)(6916009)(4326008)(9686003)(86362001)(55016002)(53546011)(52536014)(316002)(7696005)(5660300002)(186003)(26005)(33656002)(8936002)(81166006)(81156014)(2906002)(478600001)(966005)(71200400001)(66946007)(8676002)(64756008)(66556008)(66476007)(76116006)(66446008)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2629;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZlRzqati0tJG4XeP7unrIoUATIhNc6jbsgKSAIb4EjEaUxNLu5QY64/IckbhiaaEO82bfpxF/knFgIgh8f9ePMUClUipwXDibMpPae4teU5KyaLpygzecVmb7v360JJIP1h4uYq8DNhVSYYcpNxIclepJmt24RflFjKhGRABy+K7EUW6HcQx/PGzQ9lluTfxG3vynvjuqpwjnBoB0YfQdrS1BjLy8pzsdFGbJK70XYmr7uCr+Hs7qPtuHKpllt2wrU6Y9uxHrYtIhjSUQ8cMZA+fNbKu1zAE4m675Ps855fAr3B/YC4I42LF0FLS1BQAFggEJJnlV1Y+7rM+LiDTC1TiuyNUsZ4GQF1/+pSLHCBRzmkmFtV+ebm4aMOG9VUPB548D1y8vJUVHZf5SHbAJeKi0xHVGOKusBv7EnDhwVHniF6+JlFIn/61E5nraRhhi2N3JIYis4f0rViDpNJBeueANQpsraRCfl+76SmfZj9a1nDGpcBgPppjclJe83lbm5pjs6exgBaT8lUYHLiBAoXDsHQBP6coTBXf75NXeX0FAfTgI9LJCH9o9k0ueMM5
x-ms-exchange-antispam-messagedata: qwmoLoGfIZMJ5UVOG4RodPPJh3EZcbA3G5YLlVe0q0CxGut9lpPltqeq2WpSDgChEBvvM177swO5h7I5zdyjlVUxrM1AruI2Fy2apul9/znQ0ItTvYcgAxT79ZCsMeK43uQQQCYYZsPIgzIMqLFY8w==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f827bb9b-bbd2-412f-5ec0-08d7a90e3757
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2020 01:04:41.7284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckN4PrvBa55DAMcLChUNQIrkqJqjb4NLvEWh+f2NIucYm/CMMgx/l+8oa9ocAZoZp5IT1d169VHEmtLOlRGdRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2629
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580778284; bh=Nyv+koBL9T3KP2D3xGDJvGoKJwUsqCGlaTCOXlduqyo=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-forefront-prvs:x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:
         x-ms-exchange-antispam-messagedata:x-ms-exchange-transport-forked:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=X7gwjDUU2zjok8X3WsWXjCqcYhGpb2ZN7oEE6bXBDtuSKkyNnyyAzeCwgq5Tu01C1
         nhZyxzfCSktKKwNf6QsnopDUGxBhu0aGfyrJUL4ku4cIdrFVmqbCWApO1IT1fkkgpD
         i4W5xeWRL2p3tULZ/n7N7Y0AHKso+jxskgoFBctg5rlJCiQQCwp7hsHV5Ett9bsZlV
         luANSvYa18JY1y721mKFWnzskzXRmKhQSfT5o1YTQ33C5qanfylto1rBAWDuyR//za
         aathkxNqNicQ3v1kVM/0zrnjNFoffEHzNOBTFMwlc+rzRxqF0TfriM7rw8vEB89Kjd
         GfhMrOrqySX0A==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgQWNlTGFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogbGludXgt
aTJjLW93bmVyQHZnZXIua2VybmVsLm9yZyA8bGludXgtaTJjLW93bmVyQHZnZXIua2VybmVsLm9y
Zz4gT24NCj4gQmVoYWxmIE9mIEFjZUxhbiBLYW8NCj4gU2VudDogU3VuZGF5LCBGZWJydWFyeSAy
LCAyMDIwIDY6MjUgUE0NCj4gVG86IEFqYXkgR3VwdGEgPGFqYXlnQG52aWRpYS5jb20+DQo+IENj
OiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBJbiBwb3dlciBzYXZp
bmcgbW9kZSBpMmNfbnZpZGlhX2dwdSBtb2R1bGVzIGFmZmVjdCBwb3dlcg0KPiBjb25zdW1wdGlv
biBhIGxvdA0KPiANCj4gDQo+IA0KPiBIaSBBamF5LA0KPiANCj4gSSB0ZXN0ZWQgaXQgd2l0aCAg
djUuNS1yYzEga2VybmVsIGF0IHRoYXQgdGltZS4NCktlcm5lbCB2NS41LXJjMSBkb2VzIGhhdmUg
YWxsIHJ1biB0aW1lIHBtIHBhdGNoZXMuIEkgdGVzdGVkIHdpdGggaXQgb24gbXkgR1BVIGNhcmQg
YW5kIGl0DQp3b3JrcyBmaW5lIChsc3BjaSBzaG93cyBzdGF0dXMgYXMgRDMpLiANCg0KUGxlYXNl
IHByb3ZpZGUgZm9sbG93aW5nIGRldGFpbHMgdG8gZGVidWcgdGhlIGlzc3VlIHlvdSBhcmUgc2Vl
aW5nLg0KDQoxLiBQbGVhc2Ugc2hhcmUgZXhhY3Qgc3RlcHMgdG8gcmVwcm8gdGhlIGlzc3VlLg0K
Mi4gRG8geW91IGNvbm5lY3QgYW55IFVTQiBUeXBlLUMgZGV2aWNlIEdQVSB0byByZXByb2R1Y2Ug
dGhlIGlzc3VlPw0KMy4gUGxlYXNlIHJ1biBiZWxvdyAgY29tbWFuZCBhZnRlciB1c2luZyBjb3Jy
ZWN0IGRldmljZSBJRCBpbiBwbGFjZSBvZiAiMDE6MDAuMyIgYmFzZWQgb24gbHNwY2kgY29tbWFu
ZC4NCiAgJCBsc3BjaSAgIA0KICAwMTowMC4zIFNlcmlhbCBidXMgY29udHJvbGxlciBbMGM4MF06
IE5WSURJQSBDb3Jwb3JhdGlvbiBEZXZpY2UgMWFkOSAocmV2IGExKQ0KICAkIHN1ZG8gbHNwY2kg
LXZ2IC1zIDAxOjAwLjAzDQogIFRoaXMgc2hvdWxkIHNob3cgU3RhdHVzIGFzIEQzIHVuZGVyICJD
YXBhYmlsaXRpZXM6IFtiNF0gUG93ZXIgTWFuYWdlbWVudCB2ZXJzaW9uIDMiDQo0LiBQbGVhc2Ug
c2hhcmUgY29tcGxldGUgImRtZXNnIiBsb2cuDQo1LiBQbGVhc2Ugc2hhcmUgb3V0cHV0IG9mIGJl
bG93IGNvbW1hbmQNCiAkIGxzbW9kIHwgZ3JlcCB0eXBlYw0KICQgbHNtb2QgfCBncmVwIG52aWRp
YQ0KICQgY2F0IC9zeXMvY2xhc3MvdHlwZWMvcG9ydDAvcG9ydDAuPy9zdmlkDQogJCBscyAvc3lz
L2J1cy90eXBlYy9kZXZpY2VzLw0KDQpUaGFua3MNCj4gbnZwdWJsaWMNCj4gQWZ0ZXIgaTJjX252
aWRpYV9ncHUgaXMgbG9hZGVkLCBpdCBzdHVjayBQQyBzdGF0ZSBhdCBQQzMgZHVyaW5nIHNob3J0
IGlkbGUuDQo+IA0KPiBQbGVhc2UgbGV0IG1lIGtub3cgd2hhdCBraW5kIG9mIGxvZ3MgeW91IG5l
ZWQgb3IgYW55dGhpbmcgeW91IHdhbnQgbWUgdG8NCj4gdHJ5Lg0KPiBUaGFua3MuDQo+IA0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IEFjZUxhbiBLYW8uDQo+IA0KPiBBamF5IEd1cHRhIDxhamF5Z0Budmlk
aWEuY29tPiDmlrwgMjAyMOW5tDHmnIgyNeaXpSDpgLHlha0g5LiK5Y2IMzo1MeWvq+mBk++8mg0K
PiA+DQo+ID4gSGkgQWNlTGFuLA0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+ID4gRnJvbTogQWNlTGFuIEthbyA8YWNlbGFuLmthb0BjYW5vbmljYWwuY29tPg0KPiA+
ID4gU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDE5LCAyMDE5IDQ6NTMgUE0NCj4gPiA+IFRvOiBB
amF5IEd1cHRhIDxhamF5Z0BudmlkaWEuY29tPjsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZw0K
PiA+ID4gU3ViamVjdDogSW4gcG93ZXIgc2F2aW5nIG1vZGUgaTJjX252aWRpYV9ncHUgbW9kdWxl
cyBhZmZlY3QgcG93ZXINCj4gPiA+IGNvbnN1bXB0aW9uIGEgbG90DQo+ID4gPg0KPiA+ID4NCj4g
PiA+DQo+ID4gPiBIaSBhbGwsDQo+ID4gPg0KPiA+ID4gV2UgZW5jb3VudGVyZWQgYW4gaXNzdWUg
dGhhdCB3aGlsZSBzd2l0Y2hpbmcgdG8gcG93ZXIgc2F2aW5nDQo+ID4gPiBtb2RlKHVzZSBpR1BV
KSwgdGhlIHBvd2VyIGNvbnN1bXB0aW9uIGdvZXMgdXAgdG8gNDAgV2F0dCwgYW5kIGFmdGVyDQo+
ID4gPiByZW1vdmVkIGkyY19udmlkaWFfZ3B1LCBpdCBiZWNvbWVzIDUgV2F0dC4NCj4gPiA+DQo+
ID4gPiBJJ3ZlIHRyaWVkIHRvIGNoZWNrIHRoZSBkcml2ZXIgdG8gc2VlIGlmIGl0IGNhbiB0ZWxs
IGl0J3MgdW5kZXINCj4gPiA+IHBvd2VyIHNhdmluZyBtb2RlIGFuZCBmb3VuZCB0aGF0IHRoZSBm
aXJzdCB0aW1lIHlvdSBjYWxsDQo+ID4gPiBncHVfaTJjX2NoZWNrX3N0YXR1cygpLA0KPiA+IGdw
dV9pMmNfY2hlY2tfc3RhdHVzKCkgaXMgbm90IHJpZ2h0IHBsYWNlIHRvIGNoZWNrIGlmIGRyaXZl
ciBpcyB1bmRlcg0KPiA+IHBvd2VyIHNhdmluZyBtb2RlLiBZb3UgY2FuIGNoZWNrIGxzcGNpIG91
dHB1dCBhbmQgbG9va3MgZm9yICJTdGF0dXMiDQo+ID4gZmllbGQgaW4gUG93ZXIgTWFuYWdlbWVu
dCBDYXBhYmlsaXRpZXMuDQo+ID4gZ3B1X2kyY19jaGVja19zdGF0dXMoKSByZWFkcyBJMkNfTVNU
X0NOVEwgcmVnaXN0ZXIgdG8ga25vdyB0aGUgc3RhdHVzDQo+ID4gb2YgaTJjIHRyYW5zYWN0aW9u
IChTVEFSVCwgUkVBRCwgV1JJVEUsIFNUT1Apb24gdGhlIGJ1cy4gVGhpcyByZWdpc3Rlcg0KPiA+
IGRvZXNuJ3QgaGF2ZSBzdGF0dXMgb2YgcG93ZXIgc2F2aW5nIG1vZGUuDQo+ID4NCj4gPiA+IGl0
IGdvdCAwIGZyb20NCj4gPiA+IHJlYWRsKCksIGFuZCB0aGUgc2Vjb25kIGFuZCB0aGUgZm9sbG93
aW5nIHJlYWRsKCksIGl0IHJldHVybnMNCj4gPiA+IDB4ZTAwMDAwMDAuIEl0IGxvb2tzIGxpa2Ug
YW4gZXJyb3IgY29kZSBjb21iaW5lZCB3aXRoDQo+ID4gPiBJMkNfTVNUX0NOVExfU1RBVFVTX05P
X0FDSyBhbmQgSTJDX01TVF9DTlRMX1NUQVRVU19USU1FT1VULg0KPiA+IEEgdmFsdWUgb2YgMCBt
ZWFucyBsYXN0IEkyQyB0cmFuc2FjdGlvbiBvbiB0aGUgYnVzIHdhcw0KPiA+IHN1Y2Nlc3NmdWwu
VmFsdWUNCj4gPiAweGUwMDAwMDAwIG1lYW5zIEkyQyBidXMgaXMgc3RpbGwgYnVzeSBkb2luZyB0
aGUgdHJhbnNhY3Rpb24gKHJlZmVyDQo+ID4gSTJDX01TVF9DTlRMX1NUQVRVU19CVVNfQlVTWSku
DQo+ID4NCj4gPiA+DQo+ID4gPiBNb3Jlb3ZlciwgaTJjX252aWRpYV9ncHUgbW9kdWxlIHNlZW1z
IGRlcGVuZHMgb24gaW50ZWxfbHBzcyBkcml2ZXINCj4gPiA+IHNpbmNlIGl0IHByb3ZpZGVzIGky
YyBpbnRlcmZhY2UuIFNvIGlmIHdlIGNhbiB0byB1c2UgdGhlIGFib3ZlDQo+ID4gPiBiZWhhdmlv
ciB0byBjaGVjayBpdHMgc3RhdHVzLCB0aGUgc3lzdGVtIGhhdmUgdG8gbG9hZCBpbnRlbF9scHNz
DQo+ID4gPiBmaXJzdC4gQnV0IGN1cnJlbnRseSwgaXQgc2VlbXMgbm90IHBvc3NpYmxlIHRvIGxv
YWQgbW9kdWxlcyBpbiBvdXIgb3JkZXIuDQo+ID4gPg0KPiA+ID4gU28sIEknbSB3b25kZXJpbmcg
aWYgd2UgaGF2ZSBvdGhlciBtZXRob2QgdG8gY2hlY2sgYW5kIG5vdCBsb2FkDQo+ID4gPiBpMmNf
bnZpZGlhX2dwdSBtb2R1bGUgb3IgaWYgaXQncyBwb3NzaWJsZSB0byBjaGVjayB3aHkgbG9hZGlu
Zw0KPiA+ID4gaTJjX252aWRpYV9ncHUgYWZmZWN0cyBwb3dlciBjb25zdW1wdGlvbiBhIGxvdC4N
Cj4gPg0KPiA+IFdoaWNoIGtlcm5lbCB2ZXJzaW9uIGRvIHlvdSBzZWUgdGhlIGlzc3VlIHdpdGg/
DQo+ID4gUG93ZXIgbWFuYWdlbWVudCByZWxhdGVkIGNoYW5nZXMgd2VyZSBtZXJnZWQgaW4gbWFp
bmxpbmUga2VybmVsIHY1LjMuDQo+ID4gSWYgeW91IGFyZSB1c2luZyBvbGRlciBrZXJuZWwgdGhl
biBuZWVkIHRvIHB1bGwgcnVudGltZSBQTSByZWxhdGVkDQo+ID4gcGF0Y2hlcyBmcm9tIGxhdGVz
dCBrZXJuZWwuDQo+ID4gaHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgtdXNiJm09MTU1OTk0NTQ0
NzA1OTAxJnc9Mg0KPiA+DQo+ID4gdGhhbmtzDQo+ID4gPiAgbnZwdWJsaWMNCj4gPiA+IFRoYW5r
cy4NCj4gPiA+DQo+ID4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4gPiBBY2VMYW4gS2FvLg0K
