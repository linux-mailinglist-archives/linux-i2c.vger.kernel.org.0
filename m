Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE50399A0B
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jun 2021 07:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhFCFf1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 01:35:27 -0400
Received: from mail-dm6nam12on2070.outbound.protection.outlook.com ([40.107.243.70]:19072
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229640AbhFCFf1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Jun 2021 01:35:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaibmFE1xjKEAz2aZKn4sBFWTy91eZMc2eTtVnvAQ5x6bbDcCtybjH6ojjcI+jixYALrypEmNEHf/jRukWUafoA+fn25vFVCAvAluTvcNVuvCIkBaNTM311RGNtFWyYuGnkAj54bFXFZMH7ATveDaOhCFNxAKQIkUhy/GffTfS91yVIuEK1v/LnYjUrkwsQSKNxW2Mzy8qnUTr1QFCIivqaLWFynku78VMy4Mehua3KxEE9HX8ftirNm7PfjjhV15n/SQoHMcEApH1Ruu0GE0QscADVnmveDMG5fYts9Ob1Zeuwqhscf+zrZODMsIpC9otkgFkg2LAAIDGPtgQcuFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QatqzGpP/0WK4t9+tORcrBK8sBdWRyQOH833mZVC4j4=;
 b=hzywsjVteYPacMeNcZi2Qs8XiIrniSv0p6igzxypCn0rZsa1mFo9bQ93eSccZSdKD7wxyG+bmaHgCmzuEODpPenwkIlrzjvt56hV8mt7Luba3WQ2OLk9wZ/BXQ9YgZ5fecKud+5yYnrWNU2QV1nkg+4Uu/y23A5w1fW5xw+P/QGV1VylxS8snDLQC72iEOkn0Aq9EMkM2l4QHRzk8RaXcTxYEqHxP4bQWDkY5RI6edh6MP7F7sV1NCoV8Lk3tXNJg5LxwwVyzHnLrGCc5puOT7FT1BO8piZs9d09svRoQeTSx/s8U1oxCjhav+201N+kwr4ExJdaoisbYGmjBuBoPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QatqzGpP/0WK4t9+tORcrBK8sBdWRyQOH833mZVC4j4=;
 b=pN3lKMkPTI+klYx6h0HPPSAwGPp0oNFKQG+vf3HWWl7KIfybuKhwgzbOD2DuxreM12CZfz2uvDmZS2+UldLiMnfuCyqd/BWZwwu6EEmaMy9HVbbmcaf0bpWt7TaJiBmdQr0JDb+vyICRywDBR71oC3k6T6CIpIhlU78T12i+pzU=
Received: from SN6PR02MB4093.namprd02.prod.outlook.com (2603:10b6:805:31::31)
 by SA2PR02MB7738.namprd02.prod.outlook.com (2603:10b6:806:146::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 3 Jun
 2021 05:33:38 +0000
Received: from SN6PR02MB4093.namprd02.prod.outlook.com
 ([fe80::e020:cfc6:6016:386e]) by SN6PR02MB4093.namprd02.prod.outlook.com
 ([fe80::e020:cfc6:6016:386e%6]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 05:33:38 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Michal Simek <michals@xilinx.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>
Subject: RE: [PATCH 02/10] i2c: xiic: Add standard mode support for > 255 byte
 read transfers
Thread-Topic: [PATCH 02/10] i2c: xiic: Add standard mode support for > 255
 byte read transfers
Thread-Index: AQHXVh/IQ0c+81unIUeYIazvYohSbKsAlWkAgAEtGiA=
Date:   Thu, 3 Jun 2021 05:33:38 +0000
Message-ID: <SN6PR02MB4093F1992FA306C027D01448CA3C9@SN6PR02MB4093.namprd02.prod.outlook.com>
References: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
 <20210531131948.19477-3-raviteja.narayanam@xilinx.com>
 <0f167c21-6bc7-0806-a536-55658a199a5b@denx.de>
In-Reply-To: <0f167c21-6bc7-0806-a536-55658a199a5b@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [103.106.181.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cfd681e-5e75-4d1a-5bb2-08d9265123fe
x-ms-traffictypediagnostic: SA2PR02MB7738:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR02MB773868EAD29BFDF98AA8D727CA3C9@SA2PR02MB7738.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c6d5MUeBihIOz80h3/ck6d0bOocSvt/DCMPZPJkM0T4jAtT+QURRDk9TBfQQnIXqJxo4b+sm/0I0QttuuT0oYuwtWictTBNy93tWSQaVcvhOpGEke9wK15nVkB+RrJUdYvXNhFn7jY4tr7sEbXLFL6HRksfc/BAiOmySxnNiNApC9NFVkun97fGU3J0fl/LLmnggqgRJeiS2Tqhv/Dra60xjyNIVJWrE1bRjRgpdmUH4jw041ZqZiLkmNz3f3ZYcC/b2zWbqQcXh52PRGAeKYBr4QahFlrKYrhB+iLdX3f5HUQhBsmY9sbuUqvQ4bLq2Okh9WThF4/FHGU8HpOOr22p0JoGlRdfA8POxbQjLzAgDvHoUpmMD2lyOiY39tDnV4wsvu0OJx/MnRdVhZ6ByNOVcvabmw/5VsPLEnFchZOFmY5DN8x3nH7QELOX692yeIF2fxiKg+GKQ2qD6KlU58WgtGF1+CwFotAq58iyRuNc7yu87H+vauRBv8WKoeBKxzuwwTaYjHudOMHV9UHX4zyn3ixWHw2K6qZaObhnhwyU9EGx1mcntmYe8z8+3/+jNrvsgHuzeOH7X8xhMAOsHQki8Wui8Y5+ucuM7aztBLm0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4093.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39850400004)(366004)(376002)(122000001)(66446008)(66556008)(38100700002)(6636002)(55016002)(2906002)(64756008)(66476007)(52536014)(9686003)(186003)(86362001)(71200400001)(110136005)(107886003)(54906003)(4326008)(8676002)(5660300002)(8936002)(33656002)(76116006)(7696005)(66946007)(83380400001)(478600001)(316002)(26005)(6506007)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHRaQnJrR3pZeFdpdDlpaHo3OWw3VFlZcmNNWklkcmNONjVpZ1prdHlNR003?=
 =?utf-8?B?RXRMeFNNMjhTYXNyd0RtTlZHRGVnUVVSUkcveFN3MEcxL1N3YnFSQ1pFcnlp?=
 =?utf-8?B?QThGN3BzeFpnbjFTRFQxdll3UjErV3VsQ1d0cE1GbmJtTE5qVGRFUThrNlhO?=
 =?utf-8?B?UUJwdHNwWGdpbE1sakpQVUY1OE9OUG0vYUlkOUdISXNheGJ0SXJkcVBKOU5x?=
 =?utf-8?B?N3hRVjJBd01COFBXdCtlcFo5Vk82VWNRTFVqMGc2SWJQNjZ2TGZucWhjK3hV?=
 =?utf-8?B?WkZnSlhnUC9MdmREdk9ER21tOXpqdE1vbDJEN2k2K2lLVlBrbnlrVmtuL1Rm?=
 =?utf-8?B?VEtuSmpVVjJwMEpFRGxzR3k2eWVSLzkzNHRhZkdHVGt2N1pWTjFBNm5ORDZV?=
 =?utf-8?B?RXViSHhaVmFqVDUzSzdkdGJsS3dXMnpZK2dBUnJrNHA4dnhHNUZ4S1pESGNI?=
 =?utf-8?B?ZmROd2pxUzFpQ2NEMlJjRFJOM0o2RlVTMEFlT2I1d3Zrc0twR2FxSXVjSXRh?=
 =?utf-8?B?R3BjQWtjdGorSHF0YVkrRlRlRVh6K1dnQm1XcUhTK3RLcGFSZ1dqMyszWHdx?=
 =?utf-8?B?YUNscVRtYUJtYklOK05vMjNOdGM0VGE5WDZtZ1A0OG0rUS9KYng1SlYvOXFW?=
 =?utf-8?B?dnN4WUZoOS9CWG53aWFJK3FVc0dETUROR1QvTFJmaENmWjl0NW91NHF4eER1?=
 =?utf-8?B?Z3hzb3JTSGlTNjB6ZDdoTk5aUTlwMHgrR1NYbUczOGVWdVRQZ24rMEFVd2c5?=
 =?utf-8?B?RVR5aHVORnhONXc2Snc2QlY0QVk3dTNQVzkxMExFQUdCY3FHYXBZS1EybU1V?=
 =?utf-8?B?VktwUDBRQ1dDaUhZMk93V2FvK1c3bWhLdzBHNmFtV2prWXd4amYzRjViV0RS?=
 =?utf-8?B?S0djTkVnbzBvOWRGaHc4eVBVV2NuL3pKMzBZYjNpbHMxUlNWanl2QzMySnFT?=
 =?utf-8?B?SVZId0dMRnZUZ0M3akV5NG9KSGxGZ2xkSlhFcm9NZXl3V3JpNU1nYXdvUmoz?=
 =?utf-8?B?RXgwemdBY2hEa1V1KzIzZ3lkdGtyRWNSM2ZCZ1hRUjBZenp1SUZPajZBa0U4?=
 =?utf-8?B?d0llY3NhK2IrdDNGWHFwWkk0QllxWUZOVTZDdzhpUE5kRFJ6OU12MEdYc25C?=
 =?utf-8?B?cEVqSVdzcEdHOHJzTm1PRGU3OFdDL0J2TGxvTTJPeFduQ252QmRQRmdQWTVE?=
 =?utf-8?B?bGFKZE16KzA4RTRDUVNoMHNQZmkxeDZBS2h3Y0hkT3RpZWJGdVRYbmlGWlBi?=
 =?utf-8?B?NlEybnpwN2JIMlVXUDV1ZFZJWVVSaUh6OS9id3dPY2xUOVdJb1htOVZidk5Z?=
 =?utf-8?B?SmxsN1VSa1dGak55Zzc2UjZzcnBrRDg3cjlaeXJNdlFad2xTSTFvRTRlWHYz?=
 =?utf-8?B?TFFlUUp5K0VQbitkenZtYnlteHlQR1BjTE9JS2JMRS9ibHJsdUR4WlEzNXNX?=
 =?utf-8?B?b0JMS3g0N0t5Nkp0Qyt0UUJOUkVIREZGL3NZM1dNNC9LeG9yZzAvVUh4bVVu?=
 =?utf-8?B?bXJweHZDcXMyOGcrNGh4Sm9MamorVVlOd3llOTh2VisreW9CMEVrRVkzeWQx?=
 =?utf-8?B?SksxL0RuVkQzc1kzaThLYmJiRXNKanFUVWptZU1keGhPT1BQMUtSYzJ5aUlq?=
 =?utf-8?B?d3luT2VvdndLNmtrLy9jMTNXVGx3V2pPa0ZHTVEvQ3M0TjJXblBaeXB3cG9h?=
 =?utf-8?B?Z0Rta3E4cmxzZ25nRnlrOFFjRlR6bjBwdVJ6WEg4VHowNGd3cFVObC9GUFRL?=
 =?utf-8?Q?oNd23oW1Dz+v2Ufj0g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4093.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cfd681e-5e75-4d1a-5bb2-08d9265123fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 05:33:38.6555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xl95QpTzuY1AvkGQ3pyOAulzt4zm2WU/eXN04VCIsRuRG3RodWMswY29jwQHdu1b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7738
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgTWFyZWssDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyZWsg
VmFzdXQgPG1hcmV4QGRlbnguZGU+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAyLCAyMDIxIDQ6
NDcgUE0NCj4gVG86IFJhdml0ZWphIE5hcmF5YW5hbSA8cm5hQHhpbGlueC5jb20+OyBsaW51eC1p
MmNAdmdlci5rZXJuZWwub3JnOyBNaWNoYWwNCj4gU2ltZWsgPG1pY2hhbHNAeGlsaW54LmNvbT4N
Cj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgZ2l0DQo+IDxnaXRAeGlsaW54LmNvbT4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSCAwMi8xMF0gaTJjOiB4aWljOiBBZGQgc3RhbmRhcmQgbW9kZSBzdXBwb3J0IGZvciA+
IDI1NQ0KPiBieXRlIHJlYWQgdHJhbnNmZXJzDQo+IA0KPiBPbiA1LzMxLzIxIDM6MTkgUE0sIFJh
dml0ZWphIE5hcmF5YW5hbSB3cm90ZToNCj4gDQo+IFsuLi5dDQo+IA0KPiA+ICsJaWYgKGkyYy0+
ZHluYW1pYykgew0KPiA+ICsJCXU4IGJ5dGVzOw0KPiA+ICsJCXUxNiB2YWw7DQo+ID4gKw0KPiA+
ICsJCS8qIENsZWFyIGFuZCBlbmFibGUgUnggZnVsbCBpbnRlcnJ1cHQuICovDQo+ID4gKwkJeGlp
Y19pcnFfY2xyX2VuKGkyYywgWElJQ19JTlRSX1JYX0ZVTExfTUFTSyB8DQo+ID4gKwkJCQlYSUlD
X0lOVFJfVFhfRVJST1JfTUFTSyk7DQo+ID4gKw0KPiA+ICsJCS8qDQo+ID4gKwkJICogV2Ugd2Fu
dCB0byBnZXQgYWxsIGJ1dCBsYXN0IGJ5dGUsIGJlY2F1c2UgdGhlIFRYX0VSUk9SDQo+IElSUQ0K
PiA+ICsJCSAqIGlzIHVzZWQgdG8gaW5kaWNhdGUgZXJyb3IgQUNLIG9uIHRoZSBhZGRyZXNzLCBh
bmQNCj4gPiArCQkgKiBuZWdhdGl2ZSBhY2sgb24gdGhlIGxhc3QgcmVjZWl2ZWQgYnl0ZSwgc28g
dG8gbm90IG1peA0KPiA+ICsJCSAqIHRoZW0gcmVjZWl2ZSBhbGwgYnV0IGxhc3QuDQo+ID4gKwkJ
ICogSW4gdGhlIGNhc2Ugd2hlcmUgdGhlcmUgaXMgb25seSBvbmUgYnl0ZSB0byByZWNlaXZlDQo+
ID4gKwkJICogd2UgY2FuIGNoZWNrIGlmIEVSUk9SIGFuZCBSWCBmdWxsIGlzIHNldCBhdCB0aGUg
c2FtZSB0aW1lDQo+ID4gKwkJICovDQo+ID4gKwkJcnhfd2F0ZXJtYXJrID0gbXNnLT5sZW47DQo+
ID4gKwkJYnl0ZXMgPSBtaW5fdCh1OCwgcnhfd2F0ZXJtYXJrLCBJSUNfUlhfRklGT19ERVBUSCk7
DQo+ID4gKwkJYnl0ZXMtLTsNCj4gPiArDQo+ID4gKwkJeGlpY19zZXRyZWc4KGkyYywgWElJQ19S
RkRfUkVHX09GRlNFVCwgYnl0ZXMpOw0KPiA+ICsNCj4gPiArCQlsb2NhbF9pcnFfc2F2ZShmbGFn
cyk7DQo+ID4gKwkJaWYgKCEobXNnLT5mbGFncyAmIEkyQ19NX05PU1RBUlQpKQ0KPiA+ICsJCQkv
KiB3cml0ZSB0aGUgYWRkcmVzcyAqLw0KPiA+ICsJCQl4aWljX3NldHJlZzE2KGkyYywgWElJQ19E
VFJfUkVHX09GRlNFVCwNCj4gPiArCQkJCSAgICAgIGkyY184Yml0X2FkZHJfZnJvbV9tc2cobXNn
KSB8DQo+ID4gKwkJCQkgICAgICBYSUlDX1RYX0RZTl9TVEFSVF9NQVNLKTsNCj4gPiArDQo+ID4g
KwkJeGlpY19pcnFfY2xyX2VuKGkyYywgWElJQ19JTlRSX0JOQl9NQVNLKTsNCj4gPiArDQo+ID4g
KwkJLyogSWYgbGFzdCBtZXNzYWdlLCBpbmNsdWRlIGR5bmFtaWMgc3RvcCBiaXQgd2l0aCBsZW5n
dGggKi8NCj4gPiArCQl2YWwgPSAoaTJjLT5ubXNncyA9PSAxKSA/IFhJSUNfVFhfRFlOX1NUT1Bf
TUFTSyA6IDA7DQo+ID4gKwkJdmFsIHw9IG1zZy0+bGVuOw0KPiA+ICsNCj4gPiArCQl4aWljX3Nl
dHJlZzE2KGkyYywgWElJQ19EVFJfUkVHX09GRlNFVCwgdmFsKTsNCj4gPiArCQlsb2NhbF9pcnFf
cmVzdG9yZShmbGFncyk7DQo+IA0KPiBJcyBsb2NhbF9pcnFfc2F2ZSgpL2xvY2FsX2lycV9yZXN0
b3JlKCkgdXNlZCBoZXJlIHRvIHByZXZlbnQgY29uY3VycmVudA0KPiBhY2Nlc3MgdG8gdGhlIFhJ
SUMgPw0KDQpUaGVzZSB3ZXJlIHVzZWQgdG8gZml4IHRoZSB0aW1pbmcgY29uc3RyYWludCBiZXR3
ZWVuIHR3byByZWdpc3RlciB3cml0ZXMgdG8gdGhlIElQLg0KQXMgd2UgaGF2ZSBkaXNjdXNzZWQg
bGFzdCB0aW1lLCB0aGVzZSBhcmUgcmVtb3ZlZCBpbiAiIFtQQVRDSCAwOC8xMF0gaTJjOiB4aWlj
OiBSZW1vdmUgaW50ZXJydXB0IGVuYWJsZS9kaXNhYmxlIGluIFJ4IHBhdGgiLg0KTm93IHRoZXkg
YXJlIG5vIGxvbmdlciBuZWVkZWQgc2luY2Ugb3VyIElQIGlzIGZpeGVkLiANCkZvciBsZWdhY3kg
SVAgdmVyc2lvbnMsIGRyaXZlciBpcyBzd2l0Y2hpbmcgdG8gJ0FYSSBJMkMgc3RhbmRhcmQgbW9k
ZScgb2Ygb3BlcmF0aW9uIGluIA0KIiBbUEFUQ0ggMDcvMTBdIGkyYzogeGlpYzogU3dpdGNoIHRv
IFhpaWMgc3RhbmRhcmQgbW9kZSBmb3IgaTJjLXJlYWQiLg0KDQpSZWdhcmRzLA0KUmF2aXRlamEg
Tg0K
