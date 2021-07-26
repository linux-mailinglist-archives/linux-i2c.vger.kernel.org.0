Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292263D52D0
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jul 2021 07:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbhGZEp7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jul 2021 00:45:59 -0400
Received: from mail-dm6nam11on2081.outbound.protection.outlook.com ([40.107.223.81]:60801
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231280AbhGZEp6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 26 Jul 2021 00:45:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixOb9tgo5CUgd0EuDmVIOBhxiZ+UhYaRahCYMJcOWTSR3MtF7oncd8bxWBE/IH9YQ7Un2N1esVmjL1dPkiXzR6FBNB3q/pm3k3sySwmoYsPn9Y/YTX1I1SZa2bDHPfkjQBIFZGI7iyj/Runh5yt/9d3ojIMXn+e9MdA/wcXR/TtYTBp356Ln8QIU0dB51728GhZsOuNwogMOBt5YfNvu86S6tGlIgxrZDjdNZkY+ksLyXaUEWkzPOxBqHKQS9/MOZpXwVQ+1FtetXknYerSDNX0ZdWXllCFlhGYTCb3emGItHv8+BXiM/EmK8oSlLMraHUSytmjCBXyGfnhd9Lp1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaDihEXB9rSOXXlQpKEICc6NrP4QH48gMkRYDxzBg6o=;
 b=O1ULeCuJeh2wOdppNPUoFYNC8MOe0R8smHG6kmwgygGkGFBvm6WILO6wr0ilMovJqSqeULelSesbCyS/ZDMDJhFGITCsLyw2DzGQnW5qVf6fJqRvMdP43yeZwefKctSL6Ff9XqJ7vZO/980aLei5kfOZ/ZRclkXl94eX6vBPJVlb8BPFvKPHdUeWm4Odxb1OU3TB3+eNbc03F5OJ/xkZe/J7NLTcSVkPwZVwb0604tfkEXboNXmIvmMlJOA4iczSNRy/Hq21yjDLVDyYLDe1PHkUoMi84P5MIeQcf64K4IEnvCq5UHgiulP74bzc0TIS7nIfyiY37VQiLQ7qEiDlpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaDihEXB9rSOXXlQpKEICc6NrP4QH48gMkRYDxzBg6o=;
 b=JzpDcxH8v1GXfTg0ZsCC4TiLpjbDMXrTke45sMBQesFr577sS/cZGReFmb+igEtvC0/IjnvnfkIWqSjk8OTjbZwL+FPEQQH5gulwqk2W2ltitqBT10f2xKcS2g46gjgj5RpV9tSxJ6CZeaPSf2n+6mqThB79LwwYgU3YkOsmd2w=
Received: from SN6PR02MB4093.namprd02.prod.outlook.com (2603:10b6:805:31::31)
 by SN4PR0201MB3438.namprd02.prod.outlook.com (2603:10b6:803:48::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Mon, 26 Jul
 2021 05:26:23 +0000
Received: from SN6PR02MB4093.namprd02.prod.outlook.com
 ([fe80::c10a:fa45:9f2d:7601]) by SN6PR02MB4093.namprd02.prod.outlook.com
 ([fe80::c10a:fa45:9f2d:7601%6]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 05:26:22 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Marek Vasut <marex@denx.de>, Michal Simek <michals@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>, "joe@perches.com" <joe@perches.com>
Subject: RE: [PATCH v2 00/10] i2c: xiic: Add features, bug fixes.
Thread-Topic: [PATCH v2 00/10] i2c: xiic: Add features, bug fixes.
Thread-Index: AQHXanX+JNOMVW+1VkKFPhgte5uemqspB/+AgBzauQCABE5f4IAAidyAgADKNnCAAQaWAIAD8YkA
Date:   Mon, 26 Jul 2021 05:26:22 +0000
Message-ID: <SN6PR02MB4093E219E0BCE2C3CBCE472CCAE89@SN6PR02MB4093.namprd02.prod.outlook.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <95162fd0-10e6-2bc6-4079-899ac26f66ce@xilinx.com>
 <0c51785f-9763-aebc-a9ea-04337ad1accc@denx.de>
 <SN6PR02MB40933E99A241952502B69F41CAE19@SN6PR02MB4093.namprd02.prod.outlook.com>
 <45aa8d2b-a077-32a2-0608-8f20a5b807a8@denx.de>
 <SN6PR02MB4093C7F2EB59D854D8753A01CAE29@SN6PR02MB4093.namprd02.prod.outlook.com>
 <328f6c4e-ff0b-c88f-d246-75b493b67a9a@denx.de>
In-Reply-To: <328f6c4e-ff0b-c88f-d246-75b493b67a9a@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 938660d2-bf65-45f3-947e-08d94ff5e81a
x-ms-traffictypediagnostic: SN4PR0201MB3438:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN4PR0201MB3438DD5B72C391BC80124DC8CAE89@SN4PR0201MB3438.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i9wHvAIcuHz+G4bDvnnVHywzfcve2dINgQ2tzzkuKMbTn/iEOhHvTtgEmkZJtTz3myUc8MNfDbYRMADSf+/cFuL9DMY3t3M2g2INGsDX/5Tk4XrS/JDxJdC0zKL09XA7bCAWjRbhXqFTyuXTtMAt1+knNNOFThfEJYYLrl9Vwe1S/q9FAfbwtLVlmw019cCo9ap4H7K4kwxRMsb+4sJGbUIry4adIswV6jlLbcB6vs7tUVs78n1/EN9UZ96gmKv+cv/55bcPl0+Px1vNHaq3zJF8XJttGvwi1SgzXqct2BKJSdoYhNT+V1W/eTiZfii5fsy6nC9DAvoC8ZzGcCg2MkGpwoXEpBTqj+ON2BiOn6f0ykAekH0QVVj91ZHjt7O9+NN/7pYSpdzHJJzallXr5WKTRsz2vYzNrRDrMIT3Aq4sogW5kG8B9aE0afTqnPAUizkMIxPnBFFA83Iez5BwSTnp2/DOaX014XNRXTRy1RiF2H1WrE471cSzwuVMHBAtv7yYQAWHOmzm8caRp9BtUAzwY5GSeunKyun6/FBYWivb9POdmfW3q4Y0XY08MjKrOfRMyP/7rHn+oM239k8yjDhXC/NmzPrk/4KhNiSD8kI4mvYxyS0Va/1HcelW8ZVjslg1kyr5j3Ndrsn8PPVtVECeWaBpgLbsSaO+jexLUX8XUSq+E+e0Y5q4PP7XwhXvYZa6L9gV521HjtGiI/srRw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4093.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(136003)(396003)(366004)(38100700002)(55016002)(71200400001)(478600001)(86362001)(316002)(66446008)(8676002)(7696005)(33656002)(6506007)(53546011)(66556008)(8936002)(83380400001)(122000001)(26005)(54906003)(110136005)(76116006)(66476007)(66946007)(9686003)(2906002)(186003)(52536014)(5660300002)(4326008)(64756008)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RU5PYmRWNGMvT216bUpuOEdNNGhRVExWYkEwV2x1MHVFb3dWZGRnSWs3MSty?=
 =?utf-8?B?MG9KenYxeWpJY0ErdzRqZ3ZlY3NZdElBVEJFSU94SEhQKzJZc0VGNGp1ZGR0?=
 =?utf-8?B?VG5NZlE0M0FieWp5ZnhLZHFwN2ttRTcwSEt3OTZDTmFSZ1l6bGowby9FYkxQ?=
 =?utf-8?B?bVhOT09McFR2MkZGNTVHQlVpV1pYWDB1NzE5TkJpYXdBQ3o3bDNZbVpYbHg2?=
 =?utf-8?B?N2ZhTitDR0tGWTFqZDg3TWowd2d3Vi92YWc0OWd3TDR1Vmt5NFNIbXA0WFhO?=
 =?utf-8?B?Mm41ZWJMMjZrbS9TRllNUmdTTG14ODcrQ3dHZlRDU3ErcUU1TU5HYlU5L3Ry?=
 =?utf-8?B?Q2RnWHlGMmZrT2xSalNkZUJzVHliTklkRlNsSmtuK0J4UHJmMWt0Vk5jdlVJ?=
 =?utf-8?B?d3YwbDN0TVhKd2hyMU53QVZ0VnZsWGlZQnQzWG83R1RCOUpCVTYvSWV4RjFx?=
 =?utf-8?B?Mm9Bb1BwM2V6Rkczc0VlWE50cGRxR3hqdzB6NkRuMlcvVVVvSitzWjJ0TThi?=
 =?utf-8?B?bjYxR21ZUlZoaXdnS3BtVDdhemFRMHZieU16QWRkTU8zOHYxTkFwa2xISHox?=
 =?utf-8?B?Si9US21BSlVQVENGbFFrS2cvc2VMTElWSUVPcnpZSUNvSjNuZjRORUJzZ3hO?=
 =?utf-8?B?QmgzZkNpVHQ1aHBBNThrNmFNSytiVTZtLzZXVjg4cW1FZ0ZpZmNZSXlZY1la?=
 =?utf-8?B?RXlaQ2xIYWZ2bnB3ZDhwUnNWY3I1UlhWNklwTWdieWdpQ2R2T2x1ZlRuaHBv?=
 =?utf-8?B?Z2xvbEFZbUt5V3kxdm1CV245c29TaXExcjlnTTBQcmE4bFRLVlN5aVlGYm51?=
 =?utf-8?B?bDZ2R3RsQkJCbWRwa1BLS2xBd1ZRbmkrYjZhN0ZoL1RGK2liS04xeWZ5b2kw?=
 =?utf-8?B?L2xFUi9NVklUeUFPeVhaMzIwL2F1REhXdGU3a1dzTFBQbk5BZDZxRm1keG5Z?=
 =?utf-8?B?dm9FQ2N5NG1OUVVOUjE0NmdqallBS0VGMjR0TEViLzFPTXNJSkhGL3hhN1lQ?=
 =?utf-8?B?bTdvYUVlUldrN09yZWg3Z2FnVFA4TTRCNTFxQWpZanlzdDFDWlBaQUl5QzdP?=
 =?utf-8?B?dkdKSzZRM0VrZEhyYWR1aU90Nkl6ZzlCb0lGSFJ6UW1LYWM5cnRxc2xxZnFJ?=
 =?utf-8?B?azNlQkJzanZjZnA4U1ltSW9lZEoxMUVoNDYvWFQzZzJuUmFXV2t0ejUrcS9m?=
 =?utf-8?B?blF3QktOWTdwWk5Ed3pPT1JXUko3aDdqVk9VREpaNVA0Y0poMVhGUVVCMHph?=
 =?utf-8?B?dzBFUUpFSjZnaFNMc3ZRdDJHR0U0N2orYzFTckFEdVFzRGdTNDVGV0tlaFVH?=
 =?utf-8?B?RHZiRFRTSmJDUDBmTGZwTnVGSmdaNXFkckFwUWd5WTk1aE9SRzJXRlFPb1Bj?=
 =?utf-8?B?L2lGZ285WER6UDJsMlE0L2R6LytCNDlBSmpwbk95NGpnbUwwbitmTmdmdVJK?=
 =?utf-8?B?T3M4bVNGd1lPQWt6dlEwWFV2WmRRSG1odzVNcmtlaHBoaW9qSy9neHVPdDdh?=
 =?utf-8?B?aXFHY0o1VXlUNFBWclJQSDVnbk9WdEFkWFN4RU11YXdiUmtLYW0xSXVHSjBr?=
 =?utf-8?B?TFpWZDlJcVk5RGFOY1VYazRJaDhCWjcyTEV1bm10eXQrcjByMXhPMzgzUUNq?=
 =?utf-8?B?dGRwQWhQdzB0VXdpeVNQazF2U2F5Q2swYlFvZE56UldXeURPVVFBRUQxU3kr?=
 =?utf-8?B?NjJiTEpHcHh6eHN3d0JEMmF3Uko2U0J0UGRveFgwNjVwNkFxY2tpWHBaWFNu?=
 =?utf-8?Q?B77u0yGKkcvFFlrK/wPVyO+82+S7bnOJ4yc67FQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4093.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 938660d2-bf65-45f3-947e-08d94ff5e81a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 05:26:22.7464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XPUSoiJHcD2WvgQDLiZaqpoaluM374GoMfo+92LsNC3n3VOClmeyZifpmu4WSoz7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3438
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyZWsgVmFzdXQgPG1h
cmV4QGRlbnguZGU+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAyMSwgMjAyMSAzOjE0IEFNDQo+
IFRvOiBSYXZpdGVqYSBOYXJheWFuYW0gPHJuYUB4aWxpbnguY29tPjsgTWljaGFsIFNpbWVrDQo+
IDxtaWNoYWxzQHhpbGlueC5jb20+OyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+IENjOiBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGdpdA0KPiA8Z2l0QHhpbGlueC5jb20+OyBqb2VAcGVyY2hlcy5jb20NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MiAwMC8xMF0gaTJjOiB4aWljOiBBZGQgZmVhdHVyZXMsIGJ1ZyBm
aXhlcy4NCj4gDQo+IE9uIDcvMjAvMjEgNDoxOSBQTSwgUmF2aXRlamEgTmFyYXlhbmFtIHdyb3Rl
Og0KPiANCj4gSGksDQo+IA0KPiBbLi4uXQ0KPiANCj4gPj4+IEkgaGF2ZSB0ZXN0ZWQgdGhpcyBh
Z2FpbiBvbiBvdXIgYm9hcmRzIHdpdGggZWVwcm9tIGFuZCBvdGhlcg0KPiA+Pj4gc2Vuc29ycywg
dGhpcw0KPiA+PiBpcyB3b3JraW5nIGZpbmUgZm9yIHVzLg0KPiA+Pg0KPiA+PiBDYW4geW91IHNo
YXJlIGRldGFpbHMgb2YgaG93IHRob3NlIHRlc3RzIHdlcmUgcGVyZm9ybWVkID8NCj4gPg0KPiA+
IFN0cmVzcyB0ZXN0IC0gMToNCj4gPiBIZWF2eSBldGhlcm5ldCB0cmFmZmljIHJ1bm5pbmcgaW4g
dGhlIGJhY2tncm91bmQuDQo+ID4gSTJjIGNvbW1hbmRzIHNjcmlwdCAobGlrZSBiZWxvdykgcnVu
bmluZy4gV2UgY2FuIHNlZSB2aXNpYmxlIHN0dXR0ZXIgaW4gdGhlDQo+IG91dHB1dCBhcyBleHBl
Y3RlZCwgYnV0IG5vdGhpbmcgZmFpbGVkLg0KPiA+DQo+ID4gaT0wDQo+ID4gd2hpbGUgWyAxIF0N
Cj4gPiBkbw0KPiA+IAkJaTJjdHJhbnNmZXIgLXkgLWYgMiB3MUAwWDU0IDBYMDAgcjMxQDBYNTQN
Cj4gPiAJCWkyY3RyYW5zZmVyIC15IC1mIDIgdzFAMFg1NCAwWDAwIHIzMkAwWDU0DQo+ID4gCQlp
MmN0cmFuc2ZlciAteSAtZiAyIHcxQDBYNTQgMFgwMCByMjU1QDBYNTQNCj4gPiAJCWkyY3RyYW5z
ZmVyIC15IC1mIDIgdzFAMFg1NCAwWDAwIHIyNzNAMFg1NA0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGkyY3RyYW5zZmVyIC15IC1mIDIgdzFAMFg1NCAwWDAwIHIxQDBYNTQNCj4g
DQo+IENvdWxkIGl0IGJlIHRoYXQgeW91IG5ldmVyIHNlZSB0aGUgcHJvYmxlbSBiZWNhdXNlIHlv
dSBhbHdheXMgdGFsayB0byBvbmUNCj4gc2luZ2xlIGRldmljZSA/DQoNClRoZXJlIGFyZSB0cmFu
c2ZlcnMgdG8gb3RoZXIgZGV2aWNlcyBhcyB3ZWxsLiANCk91ciBib2FyZCBoYXMgbXVsdGlwbGUg
cG93ZXIgbW9uaXRvcnMsIGVlcHJvbSBhbmQgb3RoZXIgbWlzYyBkZXZpY2VzIHRoYXQNCmFyZSBh
Y2Nlc3NlZCB0aHJvdWdoIHRoZSBzYW1lIGRyaXZlciBhbmQgYXJlIHdvcmtpbmcgZmluZS4NCg0K
PiANCj4gRG8geW91IGFsc28gdGVzdCB3cml0ZXMgd2hpY2ggYXJlIG5vdCAxIGJ5dGUgbG9uZyA/
DQo+DQoNClllcywgbGlrZSBmb3IgZWVwcm9tIDEgcGFnZSAoMTYgYnl0ZXMpICBpcyB3cml0dGVu
Lg0KIA0KPiA+ICAgICAgICAgIGk9JChleHByICRpICsgMSkNCj4gPiAgICAgICAgICBlY2hvICIk
aSINCj4gPiBkb25lDQo+ID4NCj4gPiBTdHJlc3MgdGVzdCAtIDI6DQo+ID4gVHdvIGkyYyBzY3Jp
cHRzIHJ1bm5pbmcgaW4gcGFyYWxsZWwgd2l0aCBjb21tYW5kcyBhcyBzaG93biBhYm92ZSB3aXRo
DQo+IGRpZmZlcmVudCBidXMgbnVtYmVycyAoYXMgYSByZXN1bHQgb2YgbXV4KSwgYnV0IGdvaW5n
IGludG8gc2FtZSBYSUlDIGFkYXB0ZXIuDQo+ID4gVGhpcyBpcyBhbHNvIHdvcmtpbmcgZmluZS4N
Cj4gDQo+IENvdWxkIGl0IGJlIHRoZSBpMmMtZGV2IHNlcmlhbGl6ZXMgZWFjaCBvZiB0aG9zZSB0
cmFuc2ZlcnMgLCBzbyBubyByYWNlIGNhbiBiZQ0KPiB0cmlnZ2VyZWQgPw0KPiANCg0KWWVzLCB0
aGF0IGlzIHRydWUgYmVjYXVzZSBhbGwgb3VyIHRlc3RzIGFyZSBnb2luZyB0aHJvdWdoIHRoZSBp
MmMtY29yZSBvbmx5DQphbmQgdGhlcmUgaXMgYSBsb2NrIGF0IGFkYXB0ZXIgbGV2ZWwgaW4gdGhl
IGNvcmUuDQpJdCBoYXMgdG8gYmUgcmVwcm9kdWNpYmxlIHRocm91Z2ggdGhlIGkyYyBzdGFuZGFy
ZCBpbnRlcmZhY2UsIHdoaWNoIGlzIG5vdA0KaGFwcGVuaW5nIGF0IG91ciBzZXR1cC4NCg0KSSBj
YW4gdGFrZSB5b3VyIHBhdGNoZXMgdGhhdCBhcmUgdGFyZ2V0ZWQgZm9yIHRoaXMgaXNzdWUsIHJl
YmFzZSwgdGVzdA0KYW5kIHNlbmQgdGhlbS4NCg0KUmVnYXJkcywNClJhdml0ZWphIE4NCg0KDQo=
