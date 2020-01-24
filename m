Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB082148EE5
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2020 20:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389178AbgAXTvQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jan 2020 14:51:16 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17161 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388136AbgAXTvP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jan 2020 14:51:15 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e2b4aa40000>; Fri, 24 Jan 2020 11:51:00 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 24 Jan 2020 11:51:14 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 24 Jan 2020 11:51:14 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Jan
 2020 19:51:14 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 24 Jan 2020 19:51:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGVeoZXnrIR1MGl05pb/Ha6ezz4RMpNR3cz3yuUIhdRKezubj+xdTTH9mLgBGCgzpOoH4ExuzMg8XADwk+/VsbcHNAWYt4V3aME0j5/clgvdWI0Kxa+o+dHVmCIaHxXScrEZpq4G2plaAiKLWcEF08ujHdi3C1nVZ17S6zGLNhe4wZS7/Bv05buLsLHG0uZFOdxuUmASyryu8MPiSwMdgvP/CpTFNCQUJEgpITgA1tWDlonvePIenb6bslkjIV8KKg0D9KrlO2ZJoloOCQO2iE5jnVLabq1vBYqp3/1NG/zv+ORdMiRLw5cDrcvsOYhs+BX2WXCSIuWwQQp/wjNvJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPpLEuG9OL1K3wzYLzl4sePXmY2g965gbosLGiQQvSI=;
 b=YtXXnFYo0H1MbjItrLZAi6BXuWa8KwJ20NU7UrSYOspF+bK33DwhmteeB4ZW1VGifWtTBc97XZ9Hs+btXLNJFOjCAmWj80J4WWqZBKmlIKqU/+oZDnMrLhr0YTsZrmbEHu3o47S+iWHrvNw55l33LQLDjb3Jp08ci4UP85VuYheh/jR1VuYLs4BHXozYR72ST8cVCESYXlCuzMl7EbYgOVztckAzYb76nmSZLbtzssiw1FwgA5HKfT9ZoGTIE5ojnyjhMi2EWGB+3vOaFuX6mGiNFNJS9Ulxr4UnLWOFGBoxd1otRrFJXA6oG0Nu5tQlM5wYPxioy4v9WOU25FxsIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.176.253.214) by
 BYAPR12MB3031.namprd12.prod.outlook.com (20.178.53.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.25; Fri, 24 Jan 2020 19:51:13 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::9c2:6e7d:37ee:5643]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::9c2:6e7d:37ee:5643%7]) with mapi id 15.20.2665.017; Fri, 24 Jan 2020
 19:51:13 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     AceLan Kao <acelan.kao@canonical.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: In power saving mode i2c_nvidia_gpu modules affect power
 consumption a lot
Thread-Topic: In power saving mode i2c_nvidia_gpu modules affect power
 consumption a lot
Thread-Index: AQHVts/o3SQbJk5TzEiVrmJSDepIuaf6a9Zg
Date:   Fri, 24 Jan 2020 19:51:12 +0000
Message-ID: <BYAPR12MB27274DD4157E0CC0EB26CD98DC0E0@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <CAFv23Qnh2AD-Mgr=v1Ojxaob4aBjUTD+-oLdmyXzBPe0oS6vtw@mail.gmail.com>
In-Reply-To: <CAFv23Qnh2AD-Mgr=v1Ojxaob4aBjUTD+-oLdmyXzBPe0oS6vtw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-01-24T19:51:11.4968196Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=edd82887-b6f7-4bce-ae4e-57f1452f9fad;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a3e696a-4736-4434-8b80-08d7a106c444
x-ms-traffictypediagnostic: BYAPR12MB3031:
x-microsoft-antispam-prvs: <BYAPR12MB3031055BE5E685D1CA998E7DDC0E0@BYAPR12MB3031.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02929ECF07
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(39860400002)(366004)(376002)(396003)(199004)(189003)(66476007)(64756008)(66446008)(66556008)(81156014)(81166006)(6506007)(53546011)(8676002)(66946007)(76116006)(86362001)(71200400001)(110136005)(186003)(478600001)(2906002)(26005)(316002)(52536014)(9686003)(5660300002)(8936002)(33656002)(55016002)(966005)(7696005)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3031;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JEez8tU1u+1hXIAV5dDV91ngsMGswmZy/RjjfjbDDXITm8gMTbxqpCDnTAg066Zp7ArcVUxSK5KcccIJvm6yOYuIVHUamtTUnSEtjZy+GvarKAe3PwJX3Ok4AUa2x/1H15z69qXVapBJqcM2SRYAyEUFlTgboTJCdCxIzbxek4GlSpEO3ffeZNxlMqhG40xQkvtYxy4MCRQ11P4cERrJd7G121jmCHqZ5TYQPpZL+/GPkp+AsivqtSbPWZaTTbZikEqFXsd4GjJ2LVe2g3g3VmMzLJdOc0rEsoV5OcoAQY2SOVagpqWZ8eAN/Jg/HCPsSjF+ewdxtLPXBDul83qicfFVbQyRODkVqkh2YlxXf8ycuuHGqEhX8/rgfr0hZNOOEr1hU8Um/fegkEuz9yDxdn33lBDdm651+89H8HIQUpZoppFI5It9KhAMv6CHpgY4nRywvmGi/sm0aPubhwRCG0qRAWLqs/lT1T13BTJHxWT+Wu49OmG5VjxXVF6edrUeBcVi2JXbIGpm1U6FGeCHn9NQazOh7BuZ0bz1YIimPOk=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3e696a-4736-4434-8b80-08d7a106c444
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2020 19:51:12.8358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /IxFX4BqegX5OEr2ZkzuCBwpzDtVL9QgrZjSOE3A58AuZXq+E5ToX1e8o/hrToa2o/T6BHmyXHGtnTWUwJQvXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3031
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1579895460; bh=JPpLEuG9OL1K3wzYLzl4sePXmY2g965gbosLGiQQvSI=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-forefront-prvs:x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-ms-exchange-transport-forked:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=dyYc3NMQtbl/p6ZZcBjoXodrcCvJaQg2OOrlpTU5CNmVoCmwXpms5GSuA4mVYtywa
         AzRVDisjYdQMT/QucnbcbUKZs+VfvcmLd1yyAghHnqXhlCYK/W1kO17ykOZhepsNEE
         puGtGdNQzRgoVAxqM2sDVSzdBnuuJ1pQYLP6QHoMgj4hGiI2qxOdLxpJcb8qTGiKAy
         /MU4clhpEaUBH6OkqmEzXDDnLBym+usVWhaqITfxSp33X0ovTroYfPxloSXvByGBzu
         G+8gM55rqsceBXUf1hTBRUQGpA8AU3r635B7i+Po7QLf0MA248egGwGf1BeSQweZIe
         8resdS7AngXPw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgQWNlTGFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFjZUxh
biBLYW8gPGFjZWxhbi5rYW9AY2Fub25pY2FsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIERlY2Vt
YmVyIDE5LCAyMDE5IDQ6NTMgUE0NCj4gVG86IEFqYXkgR3VwdGEgPGFqYXlnQG52aWRpYS5jb20+
OyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IEluIHBvd2VyIHNhdmluZyBt
b2RlIGkyY19udmlkaWFfZ3B1IG1vZHVsZXMgYWZmZWN0IHBvd2VyDQo+IGNvbnN1bXB0aW9uIGEg
bG90DQo+IA0KPiBFeHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBh
dHRhY2htZW50cw0KPiANCj4gDQo+IEhpIGFsbCwNCj4gDQo+IFdlIGVuY291bnRlcmVkIGFuIGlz
c3VlIHRoYXQgd2hpbGUgc3dpdGNoaW5nIHRvIHBvd2VyIHNhdmluZyBtb2RlKHVzZQ0KPiBpR1BV
KSwgdGhlIHBvd2VyIGNvbnN1bXB0aW9uIGdvZXMgdXAgdG8gNDAgV2F0dCwgYW5kIGFmdGVyIHJl
bW92ZWQNCj4gaTJjX252aWRpYV9ncHUsIGl0IGJlY29tZXMgNSBXYXR0Lg0KPiANCj4gSSd2ZSB0
cmllZCB0byBjaGVjayB0aGUgZHJpdmVyIHRvIHNlZSBpZiBpdCBjYW4gdGVsbCBpdCdzIHVuZGVy
IHBvd2VyIHNhdmluZyBtb2RlDQo+IGFuZCBmb3VuZCB0aGF0IHRoZSBmaXJzdCB0aW1lIHlvdSBj
YWxsIGdwdV9pMmNfY2hlY2tfc3RhdHVzKCksIA0KZ3B1X2kyY19jaGVja19zdGF0dXMoKSBpcyBu
b3QgcmlnaHQgcGxhY2UgdG8gY2hlY2sgaWYgZHJpdmVyIGlzIHVuZGVyIHBvd2VyIHNhdmluZw0K
bW9kZS4gWW91IGNhbiBjaGVjayBsc3BjaSBvdXRwdXQgYW5kIGxvb2tzIGZvciAiU3RhdHVzIiBm
aWVsZCBpbiBQb3dlciBNYW5hZ2VtZW50DQpDYXBhYmlsaXRpZXMuDQpncHVfaTJjX2NoZWNrX3N0
YXR1cygpIHJlYWRzIEkyQ19NU1RfQ05UTCByZWdpc3RlciB0byBrbm93IHRoZSBzdGF0dXMgb2Yg
aTJjDQp0cmFuc2FjdGlvbiAoU1RBUlQsIFJFQUQsIFdSSVRFLCBTVE9QKW9uIHRoZSBidXMuIFRo
aXMgcmVnaXN0ZXIgZG9lc24ndCBoYXZlDQpzdGF0dXMgb2YgcG93ZXIgc2F2aW5nIG1vZGUuDQoN
Cj4gaXQgZ290IDAgZnJvbQ0KPiByZWFkbCgpLCBhbmQgdGhlIHNlY29uZCBhbmQgdGhlIGZvbGxv
d2luZyByZWFkbCgpLCBpdCByZXR1cm5zIDB4ZTAwMDAwMDAuIEl0DQo+IGxvb2tzIGxpa2UgYW4g
ZXJyb3IgY29kZSBjb21iaW5lZCB3aXRoIEkyQ19NU1RfQ05UTF9TVEFUVVNfTk9fQUNLIGFuZA0K
PiBJMkNfTVNUX0NOVExfU1RBVFVTX1RJTUVPVVQuDQpBIHZhbHVlIG9mIDAgbWVhbnMgbGFzdCBJ
MkMgdHJhbnNhY3Rpb24gb24gdGhlIGJ1cyB3YXMgc3VjY2Vzc2Z1bC5WYWx1ZQ0KMHhlMDAwMDAw
MCBtZWFucyBJMkMgYnVzIGlzIHN0aWxsIGJ1c3kgZG9pbmcgdGhlIHRyYW5zYWN0aW9uIA0KKHJl
ZmVyIEkyQ19NU1RfQ05UTF9TVEFUVVNfQlVTX0JVU1kpLg0KDQo+IA0KPiBNb3Jlb3ZlciwgaTJj
X252aWRpYV9ncHUgbW9kdWxlIHNlZW1zIGRlcGVuZHMgb24gaW50ZWxfbHBzcyBkcml2ZXIgc2lu
Y2UgaXQNCj4gcHJvdmlkZXMgaTJjIGludGVyZmFjZS4gU28gaWYgd2UgY2FuIHRvIHVzZSB0aGUg
YWJvdmUgYmVoYXZpb3IgdG8gY2hlY2sgaXRzDQo+IHN0YXR1cywgdGhlIHN5c3RlbSBoYXZlIHRv
IGxvYWQgaW50ZWxfbHBzcyBmaXJzdC4gQnV0IGN1cnJlbnRseSwgaXQgc2VlbXMgbm90DQo+IHBv
c3NpYmxlIHRvIGxvYWQgbW9kdWxlcyBpbiBvdXIgb3JkZXIuDQo+IA0KPiBTbywgSSdtIHdvbmRl
cmluZyBpZiB3ZSBoYXZlIG90aGVyIG1ldGhvZCB0byBjaGVjayBhbmQgbm90IGxvYWQNCj4gaTJj
X252aWRpYV9ncHUgbW9kdWxlIG9yIGlmIGl0J3MgcG9zc2libGUgdG8gY2hlY2sgd2h5IGxvYWRp
bmcgaTJjX252aWRpYV9ncHUNCj4gYWZmZWN0cyBwb3dlciBjb25zdW1wdGlvbiBhIGxvdC4NCg0K
V2hpY2gga2VybmVsIHZlcnNpb24gZG8geW91IHNlZSB0aGUgaXNzdWUgd2l0aD8NClBvd2VyIG1h
bmFnZW1lbnQgcmVsYXRlZCBjaGFuZ2VzIHdlcmUgbWVyZ2VkIGluIG1haW5saW5lIGtlcm5lbCB2
NS4zLiANCklmIHlvdSBhcmUgdXNpbmcgb2xkZXIga2VybmVsIHRoZW4gbmVlZCB0byBwdWxsIHJ1
bnRpbWUgUE0gcmVsYXRlZCBwYXRjaGVzDQpmcm9tIGxhdGVzdCBrZXJuZWwuDQpodHRwczovL21h
cmMuaW5mby8/bD1saW51eC11c2ImbT0xNTU5OTQ1NDQ3MDU5MDEmdz0yDQoNCnRoYW5rcw0KPiAg
bnZwdWJsaWMNCj4gVGhhbmtzLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBBY2VMYW4gS2FvLg0K
