Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D025148D1B5
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jan 2022 05:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbiAMEl1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jan 2022 23:41:27 -0500
Received: from mail-mw2nam08on2061.outbound.protection.outlook.com ([40.107.101.61]:18400
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232608AbiAMElX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jan 2022 23:41:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfgsYXYELZlZsvCb6S0xv8cF2l6oqo+jljgvGLfqVpuIII7fs32p7fVfUDvirZsEqWfpbGEmkrCULkJFZgKL60nru7ahF1uuMhQccqZHIgTGIGUWSNNZ7tNIf8KxxY2WEn77OE/uzYq9EN5+TPezUt5iwFPm5IpURVsRgYTL5umkXamnSMFfCcESZkobzVeNVQ9LQWi4aJiuJbVtlJV3XEzIjc6x3PhqSFaSuFP44r3hy9tlyeIFKyMMjbGC1Ce+uqtufraM+z+SXkZjUx5/9IGgTJy1VswuLs08J3acRl9HdxcJMiJ/0c0AMgaeyEwmelQQyYBm4tEoTEzA+9giig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kx1Kg+Ee7ve8BOigVu7eKdsohp2MO9+EFGPsMuOWoFw=;
 b=lrMbwWFxN41eDotfSowU9cjOJoVLOdMAAiacDidImIPw6bWjSB/9QgNzLPVdqdAzygvoqBMQ7BkBlMFICTMjdPIBaELmX6Je7pgIBluwE72rDrPTU87X8ImdqYnNaVjTOWneH7K6T+7uWnT42TQsR4Hut87WpVXwAz+V5AjvnBuLc7AN9Az+B/Qlnd5tg4zYuNxRBTMWRaLzwLYt09J1Vled4ey/zGTBzbs4sijGWhnTB88zSjSoEw6KmARolDmtbO1dPvhHIsqlwERB4RazCaZsQ6gPK45+TgrzCPCkoLy25MVIz11IHowGjujpycA2+CDEZpbExE9QrCZeRc5BlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kx1Kg+Ee7ve8BOigVu7eKdsohp2MO9+EFGPsMuOWoFw=;
 b=mEEv3eMlzKlYWFKPgoS2rYqIcK/49FdQXE/lPriUPcMqkyFjVJBc72e1OOOA6dC18J8tKV1RdwUPpmsfO0PW3Pnr5wD5r1PwmGoVil3JedjnQyvNa8M75jqO/dGp9GEni69xyeWTtC9KC7m0SEDNgT5Ti53mdg0XSCR55UEauaTWVPGvE87K4qMG33PQJYqxhJy9Hp705FWtnHg0gObMIb/5h01A8+6L47pcAz5n2IxF19Xd0SHHLvVnoceXlfzJo3WcbwX78oEzS6K38oh4RtFMBS8MAJMkfP/92kuZCCPhCy9aWaldHzDUgoVfoNbQGd23/KvMrBM+nB7cuLj8xg==
Received: from DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23)
 by MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 04:41:21 +0000
Received: from DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851]) by DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851%11]) with mapi id 15.20.4888.011; Thu, 13 Jan
 2022 04:41:21 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
CC:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: RE: [PATCH v2 1/3] device property: Add device_irq_get_byname
Thread-Topic: [PATCH v2 1/3] device property: Add device_irq_get_byname
Thread-Index: AQHYB77JgxnM+a48z0OgWMT8hEGQoqxfj0uAgADLkuA=
Date:   Thu, 13 Jan 2022 04:41:21 +0000
Message-ID: <DM5PR12MB18500CB8DC155830A8ECBE55C0539@DM5PR12MB1850.namprd12.prod.outlook.com>
References: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com>
 <1641996862-26960-2-git-send-email-akhilrajeev@nvidia.com>
 <CAJZ5v0hW-i8+hqkQtHG2H3X7zotABEx_bKei9OFkjBuFbL6JKw@mail.gmail.com>
In-Reply-To: <CAJZ5v0hW-i8+hqkQtHG2H3X7zotABEx_bKei9OFkjBuFbL6JKw@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d491f58-d57e-47c3-d255-08d9d64ef274
x-ms-traffictypediagnostic: MN2PR12MB4207:EE_
x-microsoft-antispam-prvs: <MN2PR12MB4207491C8EF134F17F6D6D56C0539@MN2PR12MB4207.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kJ97D0DO/fviiKONFr4v6D/7r9488EYBehDqrffd+0rjCmUrfK8MexeCd2aKzcQZ2dBARqoLDqCkiWbjGemEOWHqLukNcdNVbih1ie4MHEzwH6xe8fKZAIkBIJYfX/Z+W97QEkrt5NBqDh8FJDcA1jC5MPJA5w01Ad9+SwQ4xgwuq6mT2IqF/xoHaCZrCNiHrHCHg/pm1Xl/i/UCbGdQh1fRQTZufAeYCWMFk4lnI+6IlJmrDb90d4E+GsTKuaxwAIZLOsWD2UOtlVmgd4vNSg5QdeGa3fyV8LbBQH5+xqaM/oOJwIUGF8wsi3sWxIk2aBXffRytQzhAYsRfS/cYrus4pw6jrlhceNdNKk2Vv/7XitVQ+fHLMvpqrzi1OUcZ56Ty95bDe/c+Yv5I7GJ3wr86+SVaOkQgBJbvfu0rGE6i5xCiRT/aBVouUobeJmmhE5Zu1yZMhVdFmAsHmuI3UYvI5/pZ/5x6SA7AlUdMc9J94rsbwBN3nNSKPwqGUPNPyVQi/7DxVWunIR3OSi6ci7aVgp5pwqc761XNQViX+zdu4yZMQ1p63r+B128OKVKYdn44jdlimiOPL/vbp11zGmxWhmGAWrBh0A4n36kRBreTLwZ5B3Vb7G23pMwJ7FBsPSpzj7Y7vi1py2/KAKXXlfuPMzdJRJz8sj13lwHIwYKMSNujyP5u4S476qzLc4kyJcxISfgbPmgAeCRo+H+r4g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1850.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(66556008)(66446008)(76116006)(66476007)(66946007)(38100700002)(26005)(316002)(508600001)(86362001)(186003)(55016003)(122000001)(107886003)(7696005)(54906003)(5660300002)(53546011)(6506007)(8676002)(9686003)(7416002)(2906002)(8936002)(38070700005)(71200400001)(6916009)(33656002)(52536014)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3R3SkJRWmQ5c0xGclNGOUZHR0tUOC9CN3BPQ2Q2MFRsbDhHMWdWeXZKWEtL?=
 =?utf-8?B?bzNHVkRPbllkYUltaUdHcXpIRXV3aXNuTWNWeUFNckgzQy85eDBTY1NXMEJ1?=
 =?utf-8?B?M1hsM3hXN1hpRnFqbUVPMUZrS3psc2JrTXVpNEtsVUgwOTFUZWtHdC85N0U5?=
 =?utf-8?B?WjFBUENtV0dXelJFZllXVGM5QjJiYzdhZGF6V05wdWgzQmNXbjArb0VtQXBJ?=
 =?utf-8?B?TktHQWFDbUpQOFlMbG01MHorQnN6K2d3SVJWWVBnaGZCd0xSQkllZ002cjNn?=
 =?utf-8?B?MFp5STVvM3pKcnJrUFhKcmtnMzBGY2JCRWtqd2h3NGNUUkZBV0JxWFQvNC9r?=
 =?utf-8?B?YVNxYWI4WFFYeVp3c3J0Z0Q3b0JpblluWVFES2VkN01uNXlLYkdUbVJFWFE4?=
 =?utf-8?B?MzU5VlFoKzRZTUhCTkJIYzFadmJPdVpaOE5hbUlpTnNDZlp1RTdTUXFjZGV6?=
 =?utf-8?B?eUprYkN1Ty8ydXdhZDM2S2R5SDQzQUJ1SmlNTlh0N1c2b3BIcjNGamh3bTIz?=
 =?utf-8?B?UEZkNDAxUFFSUjdWbG12RFFFUlBrNHNPZ1ZXdVpsT1FrcVRnblIzdVd3eWhH?=
 =?utf-8?B?dEEwTGhRTDdza0lXNnBHR0ZqMUM5TE1ScHFEWmNFUFVoZ0twbmFlWlJSTGth?=
 =?utf-8?B?bXRCL1hjMHhUOHA4eUtIVVQzUXJ4Nmc0Ujl2T0tUNCtzZnlYbWFhQkh4NG00?=
 =?utf-8?B?WGc5cjQyRWdjTzZMSitETE1OaThaVWdMVHY1dGJpWU9RRWthSXduRE5ZUU5C?=
 =?utf-8?B?NHRFWWphY094U1BGaERKNkViM0orTDhuZXBCaUJ0Z2hIWEQ5d2lpWjFneGdR?=
 =?utf-8?B?K2ZiZm1qN2JBRWZJZWMxQXU3S2oveUg3dU4zUmFxZ1FvVUZmMDA2bjVvUTFN?=
 =?utf-8?B?bmZBVG4vRDV6ZUdjY3dRRWFvNEsrM0NRWlFXWW1EdWs1Qjgwb0xFaWtpZUc5?=
 =?utf-8?B?NVo0Y2hrZTBWaDlSZldPSUJyRnkyM050VDkwSXpVSXcwUHF1dHdpcXFLQm5q?=
 =?utf-8?B?cGhXc1VTSjVuM0UrOWZ3S0dOVEhTMFpxZUd1MlgxWVNmeTVYWTJDN1RrYVI2?=
 =?utf-8?B?cmJYTWlyUVNrTnQ3QWhBQmZvTWVHRXBxajU0TTg3MmxZaHlueThpMGZDZjJL?=
 =?utf-8?B?WC9JUlFSOXA5eVBOdnVNdmI4c1l5T3ZkSjhDRy8xYWZaWTg4NGpIc0pjV3p0?=
 =?utf-8?B?d1hQdXl3QWt0QW83aVhqSGlzdzkrYys4YzI1VDcwK3M3ZWQ1cTdDM1g4Ykdn?=
 =?utf-8?B?UnFySC9UWFVnRFVsMisxSGNyRkI3Zno5WXc5Tlg2YkJ1RUZOeDY1SUhjWE1F?=
 =?utf-8?B?ZGdpV0tuUmdvSzRHRmJTYTFlMmRkYWNrS3JxOC9sc1psYTZuRDBuS1RDSCtW?=
 =?utf-8?B?L0R3cnd2RG0vNjI4YzRpUStMaW1YN2xPOHpHQW1rZlJpTmNESnBIclhaQ3k1?=
 =?utf-8?B?dzIycnVQeXVCT2hjb2ZZa0tvSGZ4UnB3Zm83WGM4RFZ4OXprd3JJS3BrNUdC?=
 =?utf-8?B?YmdKYm9RYzBaRXJxdzRHQy9meXBxZmtEMkNKb0hrQURJLy9YVXdzVEFGWlV4?=
 =?utf-8?B?OGdIbDBsQWdvT3MxR215N2lvTkRLTzBzaHJTcFFIYjFZaGFtVVIyV0xzdGdO?=
 =?utf-8?B?UWR0eDNuVU1NKy9kdWtuOFNLeXFpNzNFcHMvTjZ5QWZWSlZ4T243UDNRc01T?=
 =?utf-8?B?VFAvaEdpWldpT1BidlpYZ1ZTR3BBN3Brblpkem8yTTVVbG92dldiZkdFMVVw?=
 =?utf-8?B?TmV4S005UE1PZngzNWxPSmh1by9KRCtiTW5hNmt4S284YUxlby9tTmlSa2gv?=
 =?utf-8?B?cmlxY1ViQkNpMjhVMitGbis2UWd2dnVBR0VjaHl1eSsrYmN6TTU4UVR4bWRE?=
 =?utf-8?B?aUJERXVlcTFBNzZJVmNDcnRkWGRUUkQ4TzhtZkJOOXNsWHNraHA1dVg1QkpT?=
 =?utf-8?B?WEZhc3RGWXBDMDcxWGVKV0RVbmFWTklwbTc1dkNja2h4THRReGdIaU1VZFcx?=
 =?utf-8?B?cExCYkVycFpjWDlzZFJ5QldZdStQa3U4MU0zL0xJSFFXTE5IY0Y5eFpvSmZ1?=
 =?utf-8?B?aHB4L3RYbkxNQnVKbXFDSk8yL3I2aFJwRHBOL3JjenVEeVFabkRwOGoxZVZq?=
 =?utf-8?B?Q3Qxc3g3L01samw1S014amo0TkhkUjV2VUJTSm1IMjl2ZXRqTHlmSXRxS1Fi?=
 =?utf-8?Q?aPvjiXXhVM8ueB/XuU4bUk8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1850.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d491f58-d57e-47c3-d255-08d9d64ef274
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2022 04:41:21.2390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f0IFXwVUqhrrsNCWs84Bo+548Je0fLtG/IlBpX83mbVLDWQCeRnrYUYmmMHiy89huERwz4oMHfQEuxpJQvBXmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBPbiBXZWQsIEphbiAxMiwgMjAyMiBhdCAzOjE0IFBNIEFraGlsIFIgPGFraGlscmFqZWV2QG52
aWRpYS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gR2V0IGludGVycnVwdCBieSBuYW1lIGZyb20gQUNQ
SSB0YWJsZSBhcyB3ZWxsLg0KPiA+DQo+ID4gQWRkIG9wdGlvbiB0byB1c2UgJ2ludGVycnVwdC1u
YW1lcycgaW4gX0RTRCB3aGljaCBjYW4gbWFwIHRvIGludGVycnVwdA0KPiA+IGJ5IGluZGV4LiBU
aGUgaW1wbGVtZW50YXRpb24gaXMgc2ltaWxhciB0byAnaW50ZXJydXB0LW5hbWVzJyBpbiBkZXZp
Y2V0cmVlLg0KPiA+IEFsc28gYWRkIGEgY29tbW9uIHJvdXRpbmUgdG8gZ2V0IGlycSBieSBuYW1l
IGZyb20gZGV2aWNldHJlZSBhbmQgQUNQSQ0KPiA+IHRhYmxlLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogQWtoaWwgUiA8YWtoaWxyYWplZXZAbnZpZGlhLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJp
dmVycy9iYXNlL3Byb3BlcnR5LmMgIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4gPiAgaW5jbHVkZS9saW51eC9wcm9wZXJ0eS5oIHwgIDMgKysrDQo+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvYmFzZS9wcm9wZXJ0eS5jIGIvZHJpdmVycy9iYXNlL3Byb3BlcnR5LmMgaW5kZXgNCj4gPiBj
YmU0ZmEyLi40MTRjMzE2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvYmFzZS9wcm9wZXJ0eS5j
DQo+ID4gKysrIGIvZHJpdmVycy9iYXNlL3Byb3BlcnR5LmMNCj4gPiBAQCAtOTIwLDYgKzkyMCw0
MSBAQCBpbnQgZndub2RlX2lycV9nZXQoY29uc3Qgc3RydWN0IGZ3bm9kZV9oYW5kbGUNCj4gPiAq
Zndub2RlLCB1bnNpZ25lZCBpbnQgaW5kZXgpICBFWFBPUlRfU1lNQk9MKGZ3bm9kZV9pcnFfZ2V0
KTsNCj4gPg0KPiA+ICAvKioNCj4gPiArICogZndub2RlX2lycV9nZXRfYnluYW1lIC0gR2V0IElS
USBmcm9tIGEgZndub2RlIHVzaW5nIGl0cyBuYW1lDQo+ID4gKyAqIEBmd25vZGU6ICAgIFBvaW50
ZXIgdG8gdGhlIGZpcm13YXJlIG5vZGUNCj4gPiArICogQG5hbWU6ICAgICAgSVJRIG5hbWUgaW4g
aW50ZXJydXB0LW5hbWVzIHByb3BlcnR5IGluIGZ3bm9kZQ0KPiA+ICsgKg0KPiA+ICsgKiBSZXR1
cm5zIExpbnV4IElSUSBudW1iZXIgb24gc3VjY2VzcywgZXJybm8gb3RoZXJ3aXNlLg0KPiA+ICsg
Ki8NCj4gPiAraW50IGZ3bm9kZV9pcnFfZ2V0X2J5bmFtZShjb25zdCBzdHJ1Y3QgZndub2RlX2hh
bmRsZSAqZndub2RlLCBjb25zdA0KPiA+ICtjaGFyICpuYW1lKSB7DQo+ID4gKyAgICAgICBpbnQg
aW5kZXg7DQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKHVubGlrZWx5KCFuYW1lKSkNCj4gPiArICAg
ICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsgICAgICAgaW5kZXggPSBm
d25vZGVfcHJvcGVydHlfbWF0Y2hfc3RyaW5nKGZ3bm9kZSwgImludGVycnVwdC1uYW1lcyIsDQo+
IG5hbWUpOw0KPiA+ICsgICAgICAgaWYgKGluZGV4IDwgMCkNCj4gPiArICAgICAgICAgICAgICAg
cmV0dXJuIGluZGV4Ow0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiBmd25vZGVfaXJxX2dldChm
d25vZGUsIGluZGV4KTsgfQ0KPiA+ICtFWFBPUlRfU1lNQk9MKGZ3bm9kZV9pcnFfZ2V0X2J5bmFt
ZSk7DQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogZGV2aWNlX2lycV9nZXRfYnluYW1lIC0gR2V0
IElSUSBvZiBhIGRldmljZSB1c2luZyBpbnRlcnJ1cHQgbmFtZQ0KPiA+ICsgKiBAZGV2OiAgICAg
ICBEZXZpY2UgdG8gZ2V0IHRoZSBpbnRlcnJ1cHQNCj4gPiArICogQG5hbWU6ICAgICAgSVJRIG5h
bWUgaW4gaW50ZXJydXB0LW5hbWVzIHByb3BlcnR5IGluIGZ3bm9kZQ0KPiANCj4gV2hpY2ggZndu
b2RlPw0KPiANCj4gPiArICoNCj4gPiArICogUmV0dXJucyBMaW51eCBJUlEgbnVtYmVyIG9uIHN1
Y2Nlc3MsIGVycm5vIG90aGVyd2lzZS4NCj4gPiArICovDQo+ID4gK2ludCBkZXZpY2VfaXJxX2dl
dF9ieW5hbWUoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICpuYW1lKSB7DQo+ID4gKyAg
ICAgICByZXR1cm4gZndub2RlX2lycV9nZXRfYnluYW1lKGRldl9md25vZGUoZGV2KSwgbmFtZSk7
IH0NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwoZGV2aWNlX2lycV9nZXRfYnluYW1lKTsNCj4gDQo+
IFRoaXMgY2FuIGJlIGNvbmZ1c2luZywgYmVjYXVzZSBpdCBwcmV0ZW5kcyB0byBiZSBzdXBlci1n
ZW5lcmljIGFuZCBpbiBmYWN0IGl0DQo+IGRlcGVuZHMgb24gYW4gZndub2RlIHRvIGJlIHRoZXJl
Lg0KPiANCj4gSSBndWVzcyBJJ2QgcmF0aGVyIG5vdCBoYXZlIGl0IGF0IGFsbCwgb3IgdXNlIGEg
bW9yZSBwcmVjaXNlIG5hbWUgZm9yIGl0Lg0KQnV0LCBJIHN1cHBvc2UsIHRoZSBvdGhlciBkZXZp
Y2VfKigpIGZ1bmN0aW9ucyBhbHNvIGRlcGVuZCBvbiB0aGUgZndub2RlLg0KV291bGRuJ3QgaXQg
bWFrZSB0aGUgbmFtaW5nIGluY29uc2lzdGVudCBpZiB3ZSBhZGQgYSBkaWZmZXJlbnQgb25lIGhl
cmU/DQpXb3VsZCBpdCBiZSBiZXR0ZXIgaWYgSSBhZGQgbW9yZSBkZXRhaWxzIGluIHRoZSBkZXNj
cmlwdGlvbiBjb21tZW50Pw0K
