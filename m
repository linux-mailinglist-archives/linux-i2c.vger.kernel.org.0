Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D81622F6CF7
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jan 2021 22:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbhANVOh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jan 2021 16:14:37 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:6964 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728099AbhANVOg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Jan 2021 16:14:36 -0500
Received: from HKMAIL104.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6000b4120004>; Fri, 15 Jan 2021 05:13:54 +0800
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 21:13:54 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 14 Jan 2021 21:13:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJXFuOc2HsxNoA7eEoXJLqhU/HDPwEmYmCxNurN5I77NiOjkbmW2ddJIVOZNfTEHEtQg5OZDwkySllKcc2qioE2+3uhfDJg+OdqqJ8biM+Z2FTkzXnVTQqgf0UcxMzf/yW9zJykf9SGCXyDRCEkyrvh3v40McTlP4CKbH5LI4bxtxWtJE0WeYx9bIicTbED0EsvKwzvc5P34eKSsn9r4hWxQF0j6+jAn2+v1StbN2vRh2r7t2fndLHusfAqslOsZijjbgMTagKO+QI6aTTSaRu6TzloyNCRz3abv5x6lQ8DAmbKr7SHwyfo++SmRvntD1JssEj2KZ34Rci33z1v4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dX2ozzsdqbhuq+mgwniJYLTNqWzWjqfhfyp/joEVIVI=;
 b=kzO7EOzN1MtuJwh7F94ESNjDI4DBXw60MbbhC6oSuhD1JmryjIRxo9nC6M6FJIhWiZtAnS6Q/9ozNuRE/CB9c6zeo5NKxJZmDA8UdZcqBb3NQqLHAYrjtjil0s6LOexhJfI3HhQpXpwwg+bCw/w6un5T8WMtsjtenKrT2zqXOf03K4MYjdjlxv+k+BtT5XuFSJ67ITLGueDWPj+S/7N+6TMKuMKO6JxpQvN/V8cCKlgdubMfIFsxh/DoBtJo+9GPst8nJH1yEJI0q4BAmN5+eXfKajv5wuTdHHcOW37ZcHRXJHwi+FrbtCtCH3Gw+2toQg07wxHLfgGQtR21dMZ0uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM6PR12MB4298.namprd12.prod.outlook.com (2603:10b6:5:21e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 21:13:52 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::7c6c:69b0:b754:6963]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::7c6c:69b0:b754:6963%6]) with mapi id 15.20.3763.011; Thu, 14 Jan 2021
 21:13:52 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Peter Rosin <peda@axentia.se>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend driver to
 support word address space devices
Thread-Topic: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend driver
 to support word address space devices
Thread-Index: AQHWvbljLIA6oXcJEUSiXN/tm2JeW6ocPVuAgABELQCAASwrAIAFXZiggAA5GwCAABMVsIAAuZeAgAAKIwCAAvzgAIAAslVAgAAtYgCAAACMYA==
Date:   Thu, 14 Jan 2021 21:13:52 +0000
Message-ID: <DM6PR12MB389892631192BE74BE9B5EBCAFA80@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20201118144416.184120-1-vadimp@nvidia.com>
 <20201118144416.184120-6-vadimp@nvidia.com>
 <b1e3b52d-ddb2-ac56-665c-7500c939a55d@axentia.se>
 <DM6PR12MB38989872E06EA9593E862F23AFAF0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <268612bc-dc4a-cfcd-f529-e8540adfd8dc@axentia.se>
 <DM6PR12MB389804F87C41F41210837810AFAB0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <e02caf3a-86b7-23de-2723-3abe97fb92e4@axentia.se>
 <DM6PR12MB3898A35B743227426802C081AFAB0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <5860104a-f922-068d-18ca-32b69c7970f7@axentia.se>
 <20210112101144.GA973@kunai>
 <827c0c7f-dbe2-2769-749e-be838d890101@axentia.se>
 <DM6PR12MB38982210DFF37C7A0591E481AFA80@DM6PR12MB3898.namprd12.prod.outlook.com>
 <184219c7-ef2e-06fc-e27c-f6d5ee6266e2@axentia.se>
In-Reply-To: <184219c7-ef2e-06fc-e27c-f6d5ee6266e2@axentia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: axentia.se; dkim=none (message not signed)
 header.d=none;axentia.se; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [46.116.164.38]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56161152-a5a4-4bb5-6ac6-08d8b8d14b4e
x-ms-traffictypediagnostic: DM6PR12MB4298:
x-microsoft-antispam-prvs: <DM6PR12MB4298C6E1F716497DE9533DB6AFA80@DM6PR12MB4298.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: csGwYgPDLkRmiEZ3TwrvRfAL150NYwqvkzgEElqnTaQD1IgP6jxjkbOqLHDQwkyc9vQ+mtNTNs2LNlAEDUi8Mx9eKikYFy56hAJdoV4PQ66SuAzGD1yqEUWtlLqkiyTKWZdb/KEnNtr5dtpADHJ/b7qA09uGywIUpGW0W3Xi2Hl2ElfwffqqaN4vPyzACL9KfoWpgJGRTdem5TZJsY5ISHOtNv8vudSqoBVfXPfBwAoqGzU/oUSh+Nbz3kkPVhs5qxhew89KjJC7vhL/yt1mpidTS8AtZiAgo58KJfgiYm3m7wGnsW0QkKV9BgySyxemRmV6mDwxmeC6pyq38hGHJH2to7LD8nhhL06/6vIinkZwLwMc+G5YklSYHccLCC3Bx9SUtON19oEC3NAF7rh0Rd9wFewc6+cmeu4zIeJ8T8UxjDO3CXiHyXzPBax5/tFy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(478600001)(110136005)(8676002)(7696005)(316002)(55016002)(52536014)(86362001)(9686003)(8936002)(5660300002)(33656002)(66556008)(83380400001)(53546011)(66476007)(66446008)(2906002)(186003)(76116006)(66946007)(26005)(64756008)(6506007)(71200400001)(133343001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZnZuWUV4ZXd0MCtUQ2J1UkFtYjdsTmlkTWFuUUt2Wk1hMlBmRUFjWjdWRWNL?=
 =?utf-8?B?cDMvOGxJendzcHNiSStZb1RuekV5dkk5VzBiaUJoSmZZSmZUR0RMeDlsNTMz?=
 =?utf-8?B?MkZWV2pXdGxGK0VFU1hBSDhuU1JwdmpXSElqR1JVQjZVa3NYOUNWejdtQUVn?=
 =?utf-8?B?Y1puZ2FQRkZWblBXbk9FU0dCdzFCUTJESkltWFhvUGU5MGM0VXZvUHdEQ1Zt?=
 =?utf-8?B?R05rTytlZnJxVDUzdWg1NHpnNFNvNEVzM2RmWjNCY3Fxb1ZZbUFlYmgwWm8y?=
 =?utf-8?B?TkNrNTgwdjFVUjdxcjNXL09PM1ZpOTJGVVVJSDlPb05xbzVMRG1aaTl1MHhi?=
 =?utf-8?B?SkZmVTFIaEFHNmQ3TTdvM1ltY1VyQTVmT0tXaXlOODhzM0c3S05vT2o2dXNM?=
 =?utf-8?B?WVgxb09EeEYycjVyZHlVcDNJTklXZ2FHMWhCTGd4N1MvZFFoc0Nsd3ZYakpB?=
 =?utf-8?B?U0NOTXgwYlh2NXkxT0I4RzZwekN4QkdsQjdyQ0lDZ0ZTMlQ5OHlNdFdadEZN?=
 =?utf-8?B?MnNNb0dNQUVTOThlZzROQWM2ejd1NmFQTUI0TWFFbUhaaXVBMlBjS1F0U0Js?=
 =?utf-8?B?WGxOdHRqSTFBN0lxMWtkbGUyTXlwek9ER1lHOU9IckpDTzN5dWEzOWxLNGtk?=
 =?utf-8?B?NjRUKzcwL3ZMMWZhUlBzYUJUMkpuRUFJYmNUYnZxdFBtdVM4dUs3cHNqM3Y4?=
 =?utf-8?B?eXZkeXdOMVM5bzV2STVFZXFGNS9KOXhicEJXR0Q5N2lEcmtlQ3IxdmRFZ0RC?=
 =?utf-8?B?akFzRkkxNWFndFJYbHViWEhoNFQrclpUcUZSKzhxUkpRYjR5Rk9raG5LalJ0?=
 =?utf-8?B?dWUvTDNnZTdsU1ZQVzZuOTFHVXFQZ0cwTGYwdlc2bmJLdlVBZzFEOEV5ZGpT?=
 =?utf-8?B?Q1ZoZE1td2MyQ2VTd2lNaTFLaUc1bG9wang5YWt3V2lHNFgyR1pZUzBoMkIx?=
 =?utf-8?B?OE1VV09wN0xaSFAraHlZWmZFa3ZHRDA2UHRYdkFOTlRtejVNc3ExWDkwRWV5?=
 =?utf-8?B?eDlSbzJ4Rkg1YlFaUjhGaXYvTGIvRTUzSWZIZTB6NVlqSHZzajNuelFHWW5U?=
 =?utf-8?B?RHc1WU8zbllCLytIOTloRk1KZVQwVFZvczJINUdpc3JrcFFMRzNIZnYzbVo4?=
 =?utf-8?B?U3JxdEpvYzdMRkYxL3VqcmZ3OHd6ZWlseGUzcUpsL3pHMk5UUlIvMXBsTVp5?=
 =?utf-8?B?azhuZDdRYjRkb0p1elMxUHMvZkU2dkI5Z2hKdGZhbTNMZkRtL25OU1F2OUlX?=
 =?utf-8?B?Z3dmTE1tb0NiZWtIbzlOeEdmcURVWk5uMHAvczU0RHN3Mmx1ZVhjUUNOVSth?=
 =?utf-8?Q?C4OvZNtcjYeII=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56161152-a5a4-4bb5-6ac6-08d8b8d14b4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2021 21:13:52.3431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g8GGDhqqxJy+EQwx39a2b3Or/dQKXXMyBIlNw8hcchKAAwiw4Nck8hM+RQIBK61hOoAIcXBr3OC8XKm2qS6x6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4298
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610658834; bh=dX2ozzsdqbhuq+mgwniJYLTNqWzWjqfhfyp/joEVIVI=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-oob-tlc-oobclassifiers:x-ms-exchange-senderadcheck:
         x-microsoft-antispam:x-microsoft-antispam-message-info:
         x-forefront-antispam-report:x-ms-exchange-antispam-messagedata:
         x-ms-exchange-transport-forked:Content-Type:
         Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=KGquhoGymtRnR19TOdvy00vTpdGzVrsfZPjgMfgr7Ql2oI6jiyD9rkdPq4/s+79MK
         Xzenyfm8Eop88Ga6+nULbi3zK5mBoEax0YxOBmKirQ8H7FJTohJ/pmUsVaVVCoKIP0
         /KinhPHnqzuCSQIcI3E7gJSuRtQOGFyq/Q/1LWlPJTFAub5gbBo0pJKrLEHn9O0qoc
         W+zopU0Of1c0Lhwm6rMtPYNCcyQGBRvJqKMKpJychXt9w8GsxF0zEuETossex/n4Mu
         WDKiG01LRpb0RrTpYUg0yqT2JH6DXNMCL91okGDK59BvSgoYNAjV6O07A1b2xyzbkq
         ZjrpNRMEvlNoA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgUm9zaW4gPHBl
ZGFAYXhlbnRpYS5zZT4NCj4gU2VudDogVGh1cnNkYXksIEphbnVhcnkgMTQsIDIwMjEgMTE6MTAg
UE0NCj4gVG86IFZhZGltIFBhc3Rlcm5hayA8dmFkaW1wQG52aWRpYS5jb20+OyB3c2FAdGhlLWRy
ZWFtcy5kZTsgbGludXgtDQo+IGkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtS
ZS1zZW5kOiBQQVRDSCBpMmMtbmV4dCA1LzZdIGkyYzogbXV4OiBtbHhjcGxkOiBFeHRlbmQgZHJp
dmVyIHRvDQo+IHN1cHBvcnQgd29yZCBhZGRyZXNzIHNwYWNlIGRldmljZXMNCj4gDQo+IEhpIQ0K
PiANCj4gT24gMjAyMS0wMS0xNCAxOTo0MywgVmFkaW0gUGFzdGVybmFrIHdyb3RlOg0KPiA+IEhp
IFBldGVyIGFuZCBXb2xmcmFtLA0KPiA+DQo+ID4gVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnRz
Lg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IFBldGVy
IFJvc2luIDxwZWRhQGF4ZW50aWEuc2U+DQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDE0
LCAyMDIxIDk6NDkgQU0NCj4gPj4gVG86IHdzYUB0aGUtZHJlYW1zLmRlOyBWYWRpbSBQYXN0ZXJu
YWsgPHZhZGltcEBudmlkaWEuY29tPjsgbGludXgtDQo+ID4+IGkyY0B2Z2VyLmtlcm5lbC5vcmcN
Cj4gPj4gU3ViamVjdDogUmU6IFtSZS1zZW5kOiBQQVRDSCBpMmMtbmV4dCA1LzZdIGkyYzogbXV4
OiBtbHhjcGxkOiBFeHRlbmQNCj4gPj4gZHJpdmVyIHRvIHN1cHBvcnQgd29yZCBhZGRyZXNzIHNw
YWNlIGRldmljZXMNCj4gPj4NCj4gPj4gSGkhDQo+ID4+DQo+ID4+IE9uIDIwMjEtMDEtMTIgMTE6
MTEsIHdzYUB0aGUtZHJlYW1zLmRlIHdyb3RlOg0KPiA+Pj4NCj4gPj4+PiBXb2xmcmFtLCBpcyB0
aGVyZSBhIGJldHRlciB3YXkgdG8gZ2V0IHNvbWV0aGluZyBzdGFibGUgZm9yIHVzZXINCj4gPj4+
PiBzcGFjZSB0byBpbnRlcmFjdCB3aXRoPyBJcyB0aGVyZSBtYXliZSBhIHdheSB0byBkbyB0aGlz
IHdpdGggYWxpYXNlcyBvcg0KPiBzb21ldGhpbmc/DQo+ID4+Pj4gU2V0dGluZyB1cCBhbiBhZC1o
b2Mgc2NoZW1lIGZvciBmb3JjaW5nIHRoZSBhZGFwdGVyIElEcyBmZWVscyBhIGJpdA0KPiA+PiBv
dXRkYXRlZC4NCj4gPj4+DQo+ID4+PiBZZWFoLCBpdCBmZWVscyByaWdodGZ1bGx5IG91dGRhdGVk
IElNTy4gQnJpbmdpbmcgc3VjaCBwb2xpY3kgaW50bw0KPiA+Pj4gdGhlIGtlcm5lbCBpcyBmcm93
bmVkIHVwb24uIEkgdGhpbmsgdGhlIHByb3BlciB3YXkgaXMgYSB1ZGV2IHJ1bGUgdG8NCj4gPj4+
IGFjdCBvbiB0aGUgbmV3bHkgY3JlYXRlZCBJMkMgYWRhcHRlci4gVGhpcyBldmVuIGNvdWxkIHBy
b3ZpZGUgYQ0KPiA+Pj4gcmVhbGx5IHN0YWJsZSBzeW1saW5rIGZvciB1c2Vyc3BhY2UgdG8gY29u
c3VtZS4gVGhlIGFib3ZlIHNjaGVtZSBpcw0KPiA+Pj4gb25seSBzdGFibGUgcGVyICJibG9jayIg
YnV0IGluc2lkZSB0aGUgYmxvY2ssIHRoZXJlIGlzIHN0aWxsIHJhbmRvbW5lc3MuIE9yPw0KPiA+
Pg0KPiA+PiBSaWdodCwgdGhhdCBtYWtlcyBzZW5zZS4gVGhhbmtzISBWYWRpbSwgaXMgdGhlcmUg
YW55IHJlYXNvbiB0byBub3QNCj4gPj4gc29sdmUgdGhpcyB3aXRoIHVkZXY/IERvaW5nIHRoYXQg
d2l0aCBjYXJlIGNvdWxkIHBlcmhhcHMgcHJvdmlkZQ0KPiA+PiBzdGFibGUgbmFtZXMgZXZlbiBp
ZiB5b3Ugc3dhcCBzbG90cz8NCj4gPg0KPiA+IFllcywgSSBjYW4gbWFuYWdlIGl0IGJ5IHVkZXYg
YW5kIHByb3ZpZGUgc29tZSBuYW1lcyBsaWtlDQo+ID4gImkyYy1sYzEtZnBnYTEiLCB3aGljaCBt
YXliZSB3aWxsIGJlIG1vcmUgY2xlYXIgZm9yIHVzZXIsIHRoZW4gbmFtZSBsaWtlICJpMmMtDQo+
IDEzMiIuDQo+ID4NCj4gPiBJIGhhdmUgYW5vdGhlciwgbm90IHVzZXIgc3BhY2UgcHJvYmxlbSBh
bmQgbWF5YmUgeW91IGNhbiBzdWdnZXN0IHNvbWUNCj4gPiBzb2x1dGlvbi4NCj4gPg0KPiA+IElu
IGxpbmUgY2FyZCBkcml2ZXIgSSBwbGFubmVkIHRvIGNyZWF0ZSBJMkMgaW5mcmFzdHJ1Y3R1cmUg
Zm9yIHRoZQ0KPiA+IHNwZWNpZmljIGxpbmUgY2FyZCwgbGlrZToNCj4gPg0KPiA+IHN0YXRpYyBp
bnQgbWx4cmVnX2xjX2NoYW5bXSA9IHsNCj4gPiAJMHgwNCwgMHgwNSwgMHgwNiwgMHgwNywgMHgw
OCwgMHgxMCwgMHgyMCwgMHgyMSwgMHgyMiwgMHgyMywgMHg0MCwgMHg0MSwNCj4gPiAJMHg0Miwg
MHg0MywgMHg0NCwgMHg0NSwgMHg0NiwgMHg0NywgMHg0OCwgMHg0OSwgMHg0YSwgMHg0YiwgMHg0
YywgMHg0ZCwNCj4gPiAJMHg0ZSwgMHg0Zg0KPiA+IH07DQo+ID4NCj4gPiBzdGF0aWMgc3RydWN0
IG1seGNwbGRfbXV4X3BsYXRfZGF0YSBtbHhyZWdfbGNfbXV4X2RhdGFbXSA9IHsNCj4gPiAJew0K
PiA+IAkJLmNoYW5faWRzID0gbWx4cmVnX2xjX2NoYW4sDQo+ID4gCQkubnVtX2FkYXBzID0gQVJS
QVlfU0laRShtbHhyZWdfbGNfY2hhbiksDQo+ID4gCQkuc2VsX3JlZ19hZGRyID0gTUxYUkVHX0xD
X0NIQU5ORUxfSTJDX1JFRywNCj4gPiAJCS5yZWdfc2l6ZSA9IDIsDQo+ID4gCX0sDQo+ID4gfTsN
Cj4gPg0KPiA+IAltbHhyZWdfbGMtPm11eCA9IHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9yZXNu
ZGF0YShkZXYsICJpMmMtbXV4LQ0KPiBtbHhjcGxkIiwgcGFyZW50X25yLA0KPiA+IAkJCQkJCQkg
ICBOVUxMLCAwLA0KPiAmbWx4cmVnX2xjX211eF9kYXRhLA0KPiA+DQo+IHNpemVvZihtbHhyZWdf
bGNfbXV4X2RhdGEpKTsNCj4gPg0KPiA+IEFuZCBhZnRlciB0aGlzIGluZnJhc3RydWN0dXJlIGlz
IHJlYWR5IC0gdG8gYXR0YWNoIGZyb20gdGhpcyBkcml2ZQ0KPiA+IGxpbmUgY2FyZCBkZXZpY2Vz
IGZyb20gJ2kyY19ib2FyZF9pbmZvJywgbGlrZToNCj4gPg0KPiA+IHN0YXRpYyBzdHJ1Y3QgaTJj
X2JvYXJkX2luZm8gbWx4cmVnX2xjX21haW5fcHdyX2RldmljZXNbXSA9IHsNCj4gPiAJew0KPiA+
IAkJSTJDX0JPQVJEX0lORk8oIm1wMjk3NSIsIDB4NjIpLA0KPiA+IAl9LA0KPiA+IAl7DQo+ID4g
CQlJMkNfQk9BUkRfSU5GTygibXAyOTc1IiwgMHg2NCksDQo+ID4gCX0sDQo+ID4gCXsNCj4gPiAJ
CUkyQ19CT0FSRF9JTkZPKCJtYXgxMTYwMyIsIDB4NmQpLA0KPiA+IAl9LA0KPiA+IAl7DQo+ID4g
CQlJMkNfQk9BUkRfSU5GTygibG0yNTA2NiIsIDB4MTUpLA0KPiA+IAl9LA0KPiA+IH07DQo+ID4N
Cj4gPiBzdGF0aWMgc3RydWN0IG1seHJlZ19ob3RwbHVnX2RldmljZSBtbHhyZWdfbGNfbWFpbl9w
d3JfYnJkaW5mb1tdID0gew0KPiA+IAl7DQo+ID4gCQkuYnJkaW5mbyA9ICZtbHhyZWdfbGNfbWFp
bl9wd3JfZGV2aWNlc1swXSwNCj4gPiAJCS5uciA9IDQsDQo+ID4gCX0sDQo+ID4gCXsNCj4gPiAJ
CS5icmRpbmZvID0gJm1seHJlZ19sY19tYWluX3B3cl9kZXZpY2VzWzFdLA0KPiA+IAkJLm5yID0g
NCwNCj4gPiAJfSwNCj4gPiAJew0KPiA+IAkJLmJyZGluZm8gPSAmbWx4cmVnX2xjX21haW5fcHdy
X2RldmljZXNbMl0sDQo+ID4gCQkubnIgPSA1LA0KPiA+IAl9LA0KPiA+IAl7DQo+ID4gCQkuYnJk
aW5mbyA9ICZtbHhyZWdfbGNfbWFpbl9wd3JfZGV2aWNlc1szXSwNCj4gPiAJCS5uciA9IDYsDQo+
ID4gCX0sDQo+ID4gfTsNCj4gPg0KPiA+IFdoZXJlIHRoZSBhYm92ZSAnbnIncyBhcmUgZnJvbSAn
bWx4cmVnX2xjX2NoYW4nLg0KPiA+DQo+ID4gQW5kIHRoZW4gY3JlYXRlIHdpdGggaTJjX25ld19j
bGllbnRfZGV2aWNlKCkgYWxsIHRoZSBhYm92ZSBkZXZpY2VzDQo+ID4gZnJvbSB3b3JrcXVldWUs
IHdoaWNoIHdpbGwgYmUgcnVubmluZyB1bnRpbCBhbGwgdGhlICdtbHhyZWdfbGNfY2hhbicNCj4g
PiByZWxhdGVkIGFkYXB0ZXJzIGFyZSBjcmVhdGVkLg0KPiA+IFdpdGggZm9yY2luZyBiYXNlIG5y
LCBJIGtub3cgdGhlIG51bWJlciBvZiBsYXN0IG5yLCB3aGljaCBzaG91bGQgYmUNCj4gPiBjcmVh
dGVkIGJ5ICJpMmMtbXV4LW1seGNwbGQiLg0KPiA+DQo+ID4gV2l0aG91dCBpdCBJJ2xsIG5lZWQg
c29tZSBhYmlsaXR5IHRvIGZpbmQgd2l0aCBucnMgaGF2ZSBiZWVuIGNyZWF0ZWQNCj4gPiBieSAi
aTJjLW11eC1tbHhjcGxkIi4NCj4gPiBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgZm9yIHRo
YXQ/DQo+ID4NCj4gPiBJIHVuZGVyc3RhbmQgdGhhdCBJIGNhbiBhbHNvIGRvIGl0IHRocm91Z2gg
dWRldiwgYnV0IEknZCBwcmVmZXIgdG8NCj4gPiBjcmVhdGUgYWxsIG9uLWJvYXJkIChsaW5lIGNh
cmQpIGRldmljZXMgZnJvbSB0aGUga2VybmVsLCBpZiBwb3NzaWJsZS4NCj4gDQo+IFlvdSBjb3Vs
ZCBhZGQgYSBjYWxsYmFjayBmdW5jdGlvbiB0byBzdHJ1Y3QgbWx4Y3BsZF9tdXhfcGxhdF9kYXRh
LCBhbmQgaGF2ZQ0KPiB0aGUgZHJpdmVyIGNhbGwgeW91IGJhY2sgd2l0aCB0aGUgbWFwcGluZyBz
byB0aGF0IHlvdSBrbm93IHdoYXQgYWRhcHRlciBJRA0KPiB5b3UgZ290IGZvciBlYWNoIHBsYXRm
b3JtIGRhdGEgKG9yIGNoYW5uZWwgaWYgbmVlZGVkKSB5b3UgaW5zdGFudGlhdGUuDQo+IA0KPiBX
b3VsZCB0aGF0IGRvIGl0Pw0KDQpHcmVhdCEhIQ0KSSB3aWxsIGRvIGl0IGluIHRoaXMgd2F5Lg0K
DQpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciBoZWxwLg0KDQpJJ2xsIGFkZCBpdCB0byB2MiBwYXRj
aHNldC4NCg0KQ2hlZXJzLA0KVmFkaW0uDQoNCj4gDQo+IENoZWVycywNCj4gUGV0ZXINCg==
