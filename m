Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 802AB3F199A
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Aug 2021 14:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbhHSMlw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Aug 2021 08:41:52 -0400
Received: from mail-dm6nam10on2108.outbound.protection.outlook.com ([40.107.93.108]:29091
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230421AbhHSMlw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 19 Aug 2021 08:41:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHphceV4OdvcnX7LCzpPRuPgEFVTnxo6+HxvOlozw2XaIEFrV6AVkr4yMCAv1Hxkt9ZmYePKsNz6LwIwV+N+Hvss0eTBhbQLqEwpk5tosogNQGOnu75hoDkI98PCDH3D65i89d0TsaVrL/N5A5w64sSqABszTd0FniKyAiLBnjfR1XnhORa5E6b+kpq43vwWPEfnHLnAH36/m+dKHLvMs57LGtdMaip5MnUCDj9gD7WVmCBXsu8IttQ944Cdx/UckE/mI1v8LNmLuVcdhzj2v6JhVvO1AbNd+JjCTLz6TyJDkz1YECxb7T14ZvN9dEQnR7ITU2tIQBNI+c9IKnFmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAcLk7BHY7yuhz5SQc0PJHaYEypXdnG3o4ApzR7OlWs=;
 b=F7DmWYCy188Ch7wW0yPB5087LcmM+DxkkmygLiNXg8bV4MLnPZBkvGiVmXRvrzC1up42Afv3e1Upx58CGVCEuRssfLzlsS6AdEjXxnv5SeB+gOtsezo0JQevVCW8IxUAUgQubMFYg+kWgeYEqtxlNfPH78L1F37prKuVmqOWAigNvSqg/wpxzDKgr/SyOTGwNHbKhgTrkMsMghFesXE76fLerYz5BRwMa27hi/QADraLkhUY6SPfRasQHoqCM7hYBxpHYRR3uZV30B20gUDgmv3xK4e6n+3uc+0pZgAy/Gq8DZboh9EIpUWXBv/XI0CDj//ymBi294bpjjdTx0vVvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sealingtech.com; dmarc=pass action=none
 header.from=sealingtech.com; dkim=pass header.d=sealingtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sealingtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAcLk7BHY7yuhz5SQc0PJHaYEypXdnG3o4ApzR7OlWs=;
 b=WV+1MI6buZazS4ZyNrJ6DOuX24Z1ojmpFIzTDYHRYcDT/RMebOXV5/e0Db3e9vQKw5eZr8/HwJ3I0bp76PW12dsyxJ8DaOfSpfNm00HG5Bia3daTUXpJXoQ/sJ8Ny8Auukzdn0mVMeStcLXYGWI2GK7nzlt/DzcVlckQl9LQMnc=
Received: from MN2PR13MB4208.namprd13.prod.outlook.com (2603:10b6:208:a3::23)
 by MN2PR13MB3992.namprd13.prod.outlook.com (2603:10b6:208:26c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.9; Thu, 19 Aug
 2021 12:41:13 +0000
Received: from MN2PR13MB4208.namprd13.prod.outlook.com
 ([fe80::9559:753e:2e41:9cdc]) by MN2PR13MB4208.namprd13.prod.outlook.com
 ([fe80::9559:753e:2e41:9cdc%7]) with mapi id 15.20.4436.018; Thu, 19 Aug 2021
 12:41:13 +0000
From:   Andrew Manley <andrew.manley@sealingtech.com>
To:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Tim Harvey <tharvey@gateworks.com>,
        Embedded Controller <embedded-controller@sealingtech.com>
Subject: I2C_SLAVE_STOP with i.MX 8M Mini I2C driver
Thread-Topic: I2C_SLAVE_STOP with i.MX 8M Mini I2C driver
Thread-Index: AQHXlPa60ymDc71d30if0DAgvFPpsg==
Date:   Thu, 19 Aug 2021 12:41:13 +0000
Message-ID: <MN2PR13MB420812A1FD8932E4C635F0A7E3C09@MN2PR13MB4208.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=sealingtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db2b5c67-0839-4011-29d4-08d9630ea136
x-ms-traffictypediagnostic: MN2PR13MB3992:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR13MB39928054E66AF11A6BB094E3E3C09@MN2PR13MB3992.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QuCHiQK7ArdoFc5JL2E5TwGT9NZqHWEZcfqVz1Wk1WzbZLkHmmIPOLYL/bFNnaW0RjfTRNzeh26X/MrwjHCiRRo+So0JU9XYGIIR01SIgjb5+l/zFg5+GOAR/ilHzn8BPtW5w9JiXoCzOQH6HdTZuR0y237cvTA/Jj9orQ020ON8PpN7r/XHTt2fEoPBi+mqGcNlw8nSzWoWvKyxV4RTTDf9r+ztgEJHalfNcQYQ9CG5SdZ3XAM9Tp0/nIx/paV/46bWyy6xZqVfkBIWWx2CBhoHc9LbwpeeZdrtzC3DssVl8E2t9rwYZQg7eq0Utl5vKsZhXcWFr50Jt2dHPDh8736rXgjOGMZOMcfPyLck3HnwK+/dsQ2b2ax+GHNfAiQL3as098c5Zv9fW+EGuzLlRhfR4bvW7nU89+ZpySFik8OQ0nHB845K8Gl+1cttNCxmTJUuLDNOXOaAodT+CQ6G4gvkBKcBYWEnAuhKO24y9Nj69mHT9Um/rJkQ/Acti9imaCK0pHVJNCI6uV0+9sL5vHMZb5uEPT+K1FMORWCB6DFYA5SgWBwltQG2JuBtkNoBI40u5cQCeTtmP+TFvIHkAIvN0AIyysHp479w/lji+XLEXDbpLyLbI1GTpXNM17x0Bc5lMg4rtc4mLZUsNggcEDinNpRId8TnlvfI2ChRhYHErweEfJAVHV6u0UcPofzjJZhSCW3NHTMpCCw3i5aYLBz+93bHuPvgZRSZlNcQ45o32GGU6LpxdAB9e31iCjdwMWFQilP3/g6bntUzpPKKOrYBB0YSA5XgcSHdJPMrYM0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR13MB4208.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7696005)(122000001)(6506007)(316002)(76116006)(66556008)(38100700002)(66946007)(66476007)(6916009)(33656002)(8936002)(71200400001)(8676002)(66446008)(44832011)(64756008)(38070700005)(107886003)(55016002)(186003)(9686003)(508600001)(52536014)(83380400001)(5660300002)(86362001)(4326008)(26005)(966005)(54906003)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akEzWHhXSStFMldlRjZaaEVrcHIxOFFSblZJaUlPMDgzdTFsN0NmUUNGejdm?=
 =?utf-8?B?V1JBRitlTGVEazFwUGFlMU11UlJqbUJKa3JxQlIremYyVTY4VXVReXpRVTJU?=
 =?utf-8?B?SDBFeXJYTTgxVkVDcEFFY0VQK2d3L0hjWG9aM0xhRm93R2QvNlczNEpzRkxG?=
 =?utf-8?B?MHBEZE9PN1djanNWd0FLNkdTai8rVnMzQzFVdDNCTHE3Uk9FTjVxb212TDRF?=
 =?utf-8?B?WCt1SG5HSHU5Qk1zVXBxWFhQZXgra0I0NW8zb3QwV2hYK0xHYVFORUpYbHBz?=
 =?utf-8?B?d2t1WktDTGkzS3VURitRcjUvMGVtQ1FaaDlnbTAxeEs4S2tsWHFkTWRJMUNS?=
 =?utf-8?B?aHM1YzJFWkxzdERSUENFd1ZNT2tWcm5SNWtLSDc1YjNRQ0NUZUFsVFByeC9D?=
 =?utf-8?B?RGpyQ2w1Y2d3bWw1Q212aVIzazNFVmU5aUltQ1k4ZTcrTzE1WXU3bXV1TC9a?=
 =?utf-8?B?eUpyZ3Z3ak1CZG04NExKR25XdG8vWm5mQkVxV0h0U0UxNFlyRjdlNUY2bzVM?=
 =?utf-8?B?RFd2RDRzNjhYTzNpckdtVHRIS2IvL3pBb0pYcSszZ1BnM0U3cGw5emxHMkxJ?=
 =?utf-8?B?UUVJV2wyeU5scnlGT3NrdVhTT21LM2VIMk9ubTFzblNOcWQ0OVRQSkhGdkhv?=
 =?utf-8?B?UTFDalkyRDh0U1lMMzM2RktmaDFWN21ZTjF6NUpTSk5FWlVmbzZMbU5lUWxN?=
 =?utf-8?B?LzJRNXUrclBxZXRNRHNQeXlYQ3pUSFlOcGttNUltQ1R0SzJwTjBqdjRIOFB4?=
 =?utf-8?B?M0oydnRKSUVHYjB1U2ptVCtTVm1GMVFoWStlOE8vYlBtcHkvcktaQUhzYmV5?=
 =?utf-8?B?YnkrWnFpREN4b3B0N2VNNlFyUnZqdlhyd3N2SkhqR3Fjc0JsSFV5ZVpxSEo1?=
 =?utf-8?B?M2dhVnZYZ1NIQk5VYTZ4VUJPRTZNUnFZRnJJcFNobGlFS3doblNieENYLzJR?=
 =?utf-8?B?NjRlamVFU0EvZ0lvRnNSSE9uSGYrN0gzajNtaHU0VCtnNjZhdUpuVDRGcWRY?=
 =?utf-8?B?TU1mM21PbXpDUVYwMVI5a2lRczE0OFRGZU9Pbm9KR3VnL1RtbjlQMUNjOWtF?=
 =?utf-8?B?dy9tVTlYcHAyOTMyQ0lwOGRmb3MvWnRvT2VoK0ZycmVDdjZqNzBHdlZMc2RS?=
 =?utf-8?B?Z1BOU0h2WVFCcXM2dCtHc1RyYURaQjM5a3NRRWxwS29QVHluQ3NtcXhDM2d6?=
 =?utf-8?B?Uy96Rzd2YzdHRTBhWlVqYy9PK1NPQVlQcml1RytFblN3Q1ZjWkNRWGZoZEVv?=
 =?utf-8?B?RUt1cTVCSFplekJPbktQM0o4Qm81VUVTNVRKc1ZLSSsvYnRHYVUvdnNBbFc5?=
 =?utf-8?B?WHovcEtJUVFSYUlhdW9wK2UxWjRBekdGcnZBaXNQM1B5Z0I3NUFEVW85Uk95?=
 =?utf-8?B?SWlaZzNMZnZmczk1ZHptSmJOK3ptZk4rYmordDhQSy9WRVhwcGJnd0w5WFFu?=
 =?utf-8?B?dENsMmVCN1lGSTJUWTFKZUJqVXhleHhhdytSb3U3U0psSmpMWDFvanNzbkEv?=
 =?utf-8?B?dlJ2SVNBR3V2bEpxaE92VUpCWThKejNUY2I5cklhVXE1QlFjb0NCR1hjSXhH?=
 =?utf-8?B?cTY1ZDMzMnl0aXBXVjlBYzlUZUZWUXdUNnc3ZVpMWGQrOHFmVlg4d1QvTzcw?=
 =?utf-8?B?dW8wTldPVExWaTRXTU4vbEx4MHA3Q2NxeVRIRTQ3LytoM1JWNThKMG1HWDls?=
 =?utf-8?B?V2xaeitVMXlWRFY1cEpUeTZvakZxdCszdXV5S2lzbDUrTUcyZ2Vyb2xuWWhk?=
 =?utf-8?Q?1xZiMWP8e8NxCxrKH8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sealingtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB4208.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db2b5c67-0839-4011-29d4-08d9630ea136
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2021 12:41:13.4079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 647a570e-dbad-43af-af08-79999bd307d9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L6wbuYes05vKeteyxOljn3rsYSXt/5L0YWs81vgj9UqUthxAE4f+CslsCC1d4B2V7rlQ70p/cICajglbvSlubTYNBVP8Uonz7fPmQhBa7cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3992
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

RGVhciBtYWludGFpbmVycywKCkkgaGF2ZSBhbiBpLk1YIDhNIE1pbmkgYW5kIEkgYW0gcnVubmlu
ZyBhIDUuMTMgTGludXgga2VybmVsLiBJIGFtIGF0dGVtcHRpbmcgdG8gc2VuZCBJUE1JIGNvbW1h
bmRzIHRvIGEgU3VwZXJtaWNybyBzZXJ2ZXIgb3ZlciBJMkMuIEhvd2V2ZXIsIEkgYW0gbm90IHN1
cmUgdGhhdCB0aGUgSTJDX1NMQVZFX1NUT1DigIsgZXZlbnQgaXMgdHJpZ2dlcmluZyB3aGVuIGl0
IGlzIHN1cHBvc2VkIHRvIG9yIGF0IGxlYXN0IHdoZW4gSSBhc3N1bWVkIGl0IHdvdWxkIHRyaWdn
ZXIuIAoKRmlyc3QsIEkgaW5zdGFudGlhdGVkIGFuIEkyQyBzbGF2ZSBiYWNrZW5kIHdpdGggaXRz
IG93biBhZGRyZXNzLiBUaGVuIEkgY3JhZnRlZCBzb21lIElQTUkgbWVzc2FnZXMgZm9sbG93aW5n
IHRoZSBzcGVjaWZpY2F0aW9uLCBzcGVjaWZ5aW5nIHRoYXQgdGhlIHNlcnZlciByZXNwb25kcyB0
byB0aGUgc2xhdmUgYWRkcmVzcyB0aGF0IEkgdXNlZCB0byBjcmVhdGUgdGhlIGJhY2tlbmQuIEFm
dGVyIHRoYXQsIEkgY2FuIHdyaXRlIHRoZSBieXRlcyB0byB0aGUgc2VydmVyIGFzIGEgbWFzdGVy
IG9uIHRoZSBJMkMgYnVzIHdpdGggbm8gcHJvYmxlbXMuIEFzIHBhcnQgb2YgdGhlIElQTUkgc3Bl
Y2lmaWNhdGlvbiwgdGhlIHNlcnZlciByZXNwb25kcyB0byBteSByZXF1ZXN0IGJ5IGJlY29taW5n
IGEgbWFzdGVyIG9uIHRoZSBJMkMgYnVzIGFuZCB0aGVuIHdyaXRpbmcgdGhlIHJlc3BvbnNlIGJh
Y2sgdG8gdXMgYXQgdGhlIGFkZHJlc3Mgc3BlY2lmaWVkLgoKQXQgdGhpcyBwb2ludCwgdGhlIGky
Yy1pbXguY+KAiyBkcml2ZXIgc2VlbXMgdG8gaGFuZGxlIGFsbCB0aGUgc2xhdmUgZXZlbnRzIHJl
bGF0ZWQgdG8gYmVpbmcgd3JpdHRlbiB0byBhbmQgdGhlIGJhY2tlbmQgZHJpdmVyIHJlY2VpdmVz
IGFsbCB0aGUgYnl0ZXMgYXMgdGhleSBhcmUgYmVpbmcgcmVjZWl2ZWQuIEhvd2V2ZXIsIHRoZSBi
YWNrZW5kIGRyaXZlciBkb2Vzbid0IGFwcGVhciB0byByZWNlaXZlIHRoZSBJMkNfU0xBVkVfU1RP
UOKAi2V2ZW50IHdoZW4gd2UgYXJlIGZpbmlzaGVkLiBUaGlzIGNhdXNlcyBhIHByb2JsZW0gYXMg
dGhlbiB0aGVyZSBpcyBubyBkZXRlcm1pbmFibGUgd2F5IHRvIGtub3cgd2hlbiB0aGUgYnl0ZXMg
aGF2ZSBmaW5pc2hlZCB3cml0aW5nLiBBZnRlciByZWFkaW5nIHRoZSBkb2N1bWVudGF0aW9uIGZv
ciB0aGUgZXZlbnQgaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvaTJjL3Ns
YXZlLWludGVyZmFjZS5odG1sLCBJIGFzc3VtZWQgaXQgd291bGQgYmUgdHJpZ2dlcmVkIGFmdGVy
IHRoZSBtYXN0ZXIgaXMgZmluaXNoZWQgd3JpdGluZyB0byB1cy4gSSBhbHNvIHRob3VnaHQgYXMg
cGFydCBvZiB0aGUgSTJDIHNwZWNpZmljYXRpb24gdGhhdCB0aGUgbWFzdGVyIHdhcyByZXF1aXJl
ZCB0byBzZW5kIGEgU1RPUCBzaWduYWwgd2hlbiBpdCB3YXMgZmluaXNoZWQuIElzIGl0IHBvc3Np
YmxlIHRoYXQgaXQgaXNuJ3QgdHJpZ2dlcmluZyBidXQgc2hvdWxkPwoKSSBub3RpY2VkIHRoYXQg
dGhlcmUgaXMgYSBwYXRjaCDigIswNWFlNjBiYzI0Zjc2NWQwZGI2YjdjNmU1YWNhYmYyMjcxOGI4
MjNkIGZyb20gRGVjZW1iZXIgdGhhdCBpcyBzdXBwb3NlZCB0byAiU3ludGhlc2l6ZSBlbmQgb2Yg
dHJhbnNhY3Rpb24gZXZlbnRzIi4gSXMgaXQgbm90IHBvc3NpYmxlIHRvIGZpZ3VyZSBvdXQgd2hl
biB0aGUgdHJhbnNtaXNzaW9uIGFjdHVhbGx5IGVuZHM/CgpBbmRyZXcgTWFubGV5
