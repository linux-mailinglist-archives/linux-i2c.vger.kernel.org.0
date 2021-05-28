Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C16AA393BBD
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 04:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236207AbhE1C7m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 22:59:42 -0400
Received: from mail-eopbgr1310104.outbound.protection.outlook.com ([40.107.131.104]:31181
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234877AbhE1C7i (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 22:59:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xsrga+EcTuUqBoVSKonusm5Ec1tUnK0GiipF6ngVfh4jTM8sWJtiRV5nbSY0zHKjRPpok1EP6fkis/oXLDczibUXhx8YaGsHk5EYrANVzKHDrtaLJlrDfF9CDL5IeUoS4s9F05PEdSnVKdqV4Utg0YJS5+5nUZH6HC7rLiZHzcjVreTOvzdr8Avkk0FQZnZ4a5vqWsmVgf7oMGvaO9y6RnLOERualZKVUYeDV1dQwS5RqyJWhwu1w0qo2vMvQCGgePsLjqhTenh1RgpRVdk+IB9QX+7VhtD76xt9XBf7+uKgJJueEZFgZXQFc6VmdtLd+Kzv5dMEosjwqgM5KU4SXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8WHPOxP5pLkaxHHQ0IA0fNvXWLXRs1tFKrfp6yRvxA=;
 b=FekwcpECT0uOyScLLnwpOVmlIFqU1vzGmwbDD3Tc7IMY2Pbms8a9GsSSMKYE4VSG0re8Avcrk4RQipDFnknplGRphNbHIwCuJE83kYrDJDvz/tLt35aWj3rLg2y53ksTJxfFUNPk3gfMzNEZyyxKpg0sqG/ljsIvvncNxpW7T9PNy5ORu/whSZ1p+7AvFmKVo5pj85mLECOFNjmijFMss9PbqA0z//xSw4Wa6uvtDMCcDbHn+r5jYqaOpuaP60d9YnZ3PJ8dZR/+ghYipuxfZsKWY0lJJ17lsJV/yYZQ3+amk+ZBTdOwpnElhPLnQvYfK6HRiZB4XUdajuWUcedISQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8WHPOxP5pLkaxHHQ0IA0fNvXWLXRs1tFKrfp6yRvxA=;
 b=h2+mHw9HuccH9TpzSVTdks/Tz94phYWooTFtjx1U9xFZYTqqa2vIjw0BIXcZXCqChdHg2UmgfWyAiMioxZW2rpTeVT8ZrL9dBU6o5APDSQa6mxEX4Lb1h28JUIamy+dS45SN4UFeQVdboup4G7qa2LwYrQoF4TkkbNUeTSXPMHpddKQHnGBbA2bLI6h9PYFJRuI43s24SimxnHMVTpCPXwIb4bSnD9ZipwG9fnR28vmf+UcO2nOBXujlJdYwGa7+AEL7XXg9SZtYiufwB3f57FRIg7sp2IwxhpYWasXwyCjglHcLnFvchiS1YAZBUr0kBVm9ABtEMiK3TanO40d46w==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK0PR06MB2241.apcprd06.prod.outlook.com (2603:1096:203:43::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Fri, 28 May
 2021 02:57:58 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::ec25:881b:f113:93dc]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::ec25:881b:f113:93dc%6]) with mapi id 15.20.4150.027; Fri, 28 May 2021
 02:57:58 +0000
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     Quan Nguyen <quan@os.amperecomputing.com>,
        Corey Minyard <minyard@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "openipmi-developer@lists.sourceforge.net" 
        <openipmi-developer@lists.sourceforge.net>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Open Source Submission <patches@amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
Thread-Topic: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
Thread-Index: AQHXTIQCISnhT+/XbEiDVKSu2FVXwqryb5QAgAAEGYCAAAKuUIAABVEAgAGMPFCABBbOAIAAIZkQ
Date:   Fri, 28 May 2021 02:57:58 +0000
Message-ID: <HK0PR06MB33802E8CBF0F2B70B6104C29F2229@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-6-quan@os.amperecomputing.com>
 <HK0PR06MB3380FD2B7649CFB48BEA2D4FF2269@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <1648966e-3e45-9661-c5dc-5ac2f40e2581@os.amperecomputing.com>
 <HK0PR06MB338093E5E0D0DBA9EA7C1168F2269@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <917237ce-98f8-df5f-32b6-b4145ac47ac9@os.amperecomputing.com>
 <HK0PR06MB33805BB4A4D35192A0D95E59F2259@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <14d58497-44e6-265a-af9d-7189379784d5@os.amperecomputing.com>
In-Reply-To: <14d58497-44e6-265a-af9d-7189379784d5@os.amperecomputing.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none;os.amperecomputing.com; dmarc=none action=none
 header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f30b306-9dc2-4ea3-6336-08d921846661
x-ms-traffictypediagnostic: HK0PR06MB2241:
x-microsoft-antispam-prvs: <HK0PR06MB22417759B48B35B310DAD3F0F2229@HK0PR06MB2241.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R7MN+oeRGaDT/e9BbrmU4tDuPSro6692gFHpzSLYspCf7xYz31FIYgxMKxBpcMMpgAvhFIQpD9UYKmy2IZvtOfYBTCmjKcN7DvgMPYVuf8ubbsT6wK95MsTdZPV8vM/lFk5qrNlpo0QsORQR92Ugree/oYmMCbvIadKvoeTiJlaodB8HojtMNrIo/SAXAdxFQceQUePTmQHeayC78oT/ZjBpbAw+yS8FE5k4gYhqvEXjE/eJxFwZE/p+f0N0Q03ZxbAEb1VCDqf3YY9CPpPSXmjMsEYmyutzzIPQnf7xl+4JDAuMzHIiwyf8DnqFLpqZfjSJPZroYrHVm7Sv9NWUGSH/M2QhkvGT2fHeQUvvxXmSM1Nz4doed6AWRf9SDFjdHcDZwkIufMvR7sDoSYrenViYXu04Ah3w81hHmh/cub1EN2+aXJCJ2Gltc7KK+lf3IhmWY0jFh9AX24szs8jC/NuPOES0cX+6Ct6Jk7D7eXOamXC/lIg+yN6JO80h1UIOvykpWv+bTjJEV5vt744xUrU1NrIvBhrKXNMgCRR+n0S0wFP7EOrZLeEGfXk34TpL//5jRmG/esL6LnPaBEyjOlVLCWWD8/PCjTRNqQdyJeQNySZJrXsS1TJXVzC3nz2acBRNnRU144xLq9mElSf9Vf3IUH5PCryV8Y6HXfntiLE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB3380.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39840400004)(346002)(396003)(376002)(55236004)(66556008)(6506007)(53546011)(26005)(186003)(55016002)(52536014)(316002)(66446008)(2906002)(64756008)(33656002)(54906003)(7696005)(76116006)(83380400001)(4326008)(8676002)(9686003)(86362001)(71200400001)(8936002)(110136005)(66946007)(7416002)(66476007)(5660300002)(38100700002)(122000001)(478600001)(921005)(21314003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?V0JaN2xUS2U0dlpiRHhacVBjNjNhc1ZtWENtenVITmMyYTNGM2srUTFlQVlj?=
 =?utf-8?B?NGxrSnpaM2NrNnBOckxMVjFmSUVQc2FTR21kTlNGUUVNeWIvenpyK0dBRzc3?=
 =?utf-8?B?ZFNQNnpXZlk4bUNRMDVMdm1HbERxdnJxQVBDeGhsY3VXZTQ3eXhyM3IySGFP?=
 =?utf-8?B?dm9LUXBVWVZVUUxaM3NFK2RxaU41dUV5UStMZ0VvTEg0dDZoZUIva09kdjhO?=
 =?utf-8?B?cDhPNWk4dmpiZGxuMmxTeXl5UG05TW5zclB4UlFkN25IT3oxK3Q5TXF5eDJI?=
 =?utf-8?B?SktuLzAyaEdBSWsweG1SdExSVkp2R0UvRXMzbVltbzAzVzYwQ2NEbS9VSTk4?=
 =?utf-8?B?dng0YWQvZVluM2lBOVFMTytUY3ZINGtVWWxJZ05sczFaMCtweS9JNWl5T3lO?=
 =?utf-8?B?aEJocHFYSGVVanZZSDJIY3Z4alJ0bkFCTjhNeHd0cllHeEZKQ1hWYWI5SHhI?=
 =?utf-8?B?dWYrOGVHYXJJbVAxUXVEcmI1azdhS1dUaW9kdlAvTVBSbG9iMTRxWXUzWW13?=
 =?utf-8?B?dWFyVmVsMG5xdWNZTHRNRVJjUjhzVURwQ3NnWGdlcmxMTnVVbVMwSWNTTUw1?=
 =?utf-8?B?d2RZdWdQRmp6aWY0WXU1amZkUFBWb2NubmRwUUlwa00xMlNhR1pzRjN2cmdT?=
 =?utf-8?B?K3FoSitxcVBVV2F5NXkzaklZaGZ6VWNXQkd2cXhVNzlJdHhVRkV5VjFTWE5n?=
 =?utf-8?B?eHV2bjY0WHYyTXo0QTJGclAyT3hSVnV5eGdVTnE1NlE4VDRMM01aNWY3OExt?=
 =?utf-8?B?TWJrcWFHbGdwaXhMVlB5STgwTGpzT0VwNE11cm5abUFqOXUzYlJ6dVJuNFFr?=
 =?utf-8?B?dVgySUk3emFqa1ZWTTdhSlFlVnlFWVp5TFNDRmpaRkhVS0RTNGxya1laY1Bu?=
 =?utf-8?B?RldDVXlzMzhIb1lVbHo5aWpoMXVVQ3UrTWxSY0lTMjNlVllkVWJXWFpad1RY?=
 =?utf-8?B?UHRyRUdVMTg5eDBQc2dhT0QrREJxVWFFMWllU3BCcTBpdG50RDk1YnozbE5V?=
 =?utf-8?B?a0wwcTlQeXVscnIxMW5xVGl0QXFIbFVyZDJha0E5NnhBUFdQWG9OS3dheVdJ?=
 =?utf-8?B?K0JXWHNvTWI0dGs3bSt4TkxjVFhuRkkzTDVVOHlyMXBHQ3lpdzJNY3Q0Z3JW?=
 =?utf-8?B?TUkwR01ZOVRET2p0Qmh4bVAxZFJ3ejZ0clpZTmtaRzlFM2swdFNJWEN5cUtK?=
 =?utf-8?B?a1dOLzdyQ1RGU1NvUnMvSFIzRUxHT3diM3RVNTZOZ1lNNFR0YnJjcE15M0NJ?=
 =?utf-8?B?ZlQva0VxbEpKVnFtaHZWSTlXVjkxczFmY3lPV0lXVTNid0o5L0ZRQ0JHc0dZ?=
 =?utf-8?B?MS9IUHhiOEpYeUNEVHMvSStkOWhDZ3hBd2VVdE1FeC9SZ1hCUk1zOEdKNVNF?=
 =?utf-8?B?b2RrUEhrSWNibDVFS3d1eWdPSXNCWXloajNWN0pIcGdZandkRE1TZFg3M1VY?=
 =?utf-8?B?V1JRbnRvenZWenV1R3ZOV2twYmFCdENYZHdpZWZoR25iVnlJbU96cnpJeGJz?=
 =?utf-8?B?S3FocTFtVFhSQVl6ZzFuUDRjaXZKR2FQRU1PWFk0ZmpjQTVtZEhFZFduN2dW?=
 =?utf-8?B?a0U1NW4ybk5sZ3ljcUVwcUp1Nmlsc1dxRHE0Y0tQVGpDWTBEU0hhdENta0N3?=
 =?utf-8?B?UDIzMkdPaXJnVW0rcGJEUHE2THI4Zjc3NFRQVW1za2lUQkNiaHpTaHF4Z2dV?=
 =?utf-8?B?bjRseU81NXJHWHpwS2x4V0tYa1dvMGZ0VXYvWXRSbTBHT24wMU1QNEdqVnov?=
 =?utf-8?Q?REB470U/4hJbpgFmpqVJ2PZw/kss/GXWUikRRFu?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f30b306-9dc2-4ea3-6336-08d921846661
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2021 02:57:58.5564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c648rY0g4oHEC9Ly42/Txi/Zexrm5iAf1LtNwat18SM6FOZW9vXj+MGjOfOK/eETWth6wI8U6QQBFvXIz1QsRZf0YTYf3mKOJJWULmgYeQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2241
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBRdWFuIE5ndXllbiA8cXVhbkBv
cy5hbXBlcmVjb21wdXRpbmcuY29tPg0KPiBTZW50OiBGcmlkYXksIE1heSAyOCwgMjAyMSA4OjUz
IEFNDQo+IFRvOiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IENvcmV5IE1p
bnlhcmQNCj4gPG1pbnlhcmRAYWNtLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5v
cmc+OyBKb2VsIFN0YW5sZXkNCj4gPGpvZWxAam1zLmlkLmF1PjsgQW5kcmV3IEplZmZlcnkgPGFu
ZHJld0Bhai5pZC5hdT47IEJyZW5kYW4gSGlnZ2lucw0KPiA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xl
LmNvbT47IEJlbmphbWluIEhlcnJlbnNjaG1pZHQNCj4gPGJlbmhAa2VybmVsLmNyYXNoaW5nLm9y
Zz47IFdvbGZyYW0gU2FuZyA8d3NhQGtlcm5lbC5vcmc+OyBQaGlsaXBwIFphYmVsDQo+IDxwLnph
YmVsQHBlbmd1dHJvbml4LmRlPjsgb3BlbmlwbWktZGV2ZWxvcGVyQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldDsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4g
Q2M6IE9wZW4gU291cmNlIFN1Ym1pc3Npb24gPHBhdGNoZXNAYW1wZXJlY29tcHV0aW5nLmNvbT47
IFRoYW5nIFEgLg0KPiBOZ3V5ZW4gPHRoYW5nQG9zLmFtcGVyZWNvbXB1dGluZy5jb20+OyBQaG9u
ZyBWbw0KPiA8cGhvbmdAb3MuYW1wZXJlY29tcHV0aW5nLmNvbT47IG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDUvN10gaTJjOiBhc3BlZWQ6IEFkZCBh
c3BlZWRfc2V0X3NsYXZlX2J1c3koKQ0KPiANCj4gT24gMjUvMDUvMjAyMSAxNzozMCwgUnlhbiBD
aGVuIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBR
dWFuIE5ndXllbiA8cXVhbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KPiA+PiBTZW50OiBNb25k
YXksIE1heSAyNCwgMjAyMSA2OjQ5IFBNDQo+ID4+IFRvOiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBh
c3BlZWR0ZWNoLmNvbT47IENvcmV5IE1pbnlhcmQNCj4gPj4gPG1pbnlhcmRAYWNtLm9yZz47IFJv
YiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBKb2VsIFN0YW5sZXkNCj4gPj4gPGpvZWxA
am1zLmlkLmF1PjsgQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT47IEJyZW5kYW4gSGln
Z2lucw0KPiA+PiA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT47IEJlbmphbWluIEhlcnJlbnNj
aG1pZHQNCj4gPj4gPGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz47IFdvbGZyYW0gU2FuZyA8d3Nh
QGtlcm5lbC5vcmc+OyBQaGlsaXBwDQo+ID4+IFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRl
PjsNCj4gPj4gb3BlbmlwbWktZGV2ZWxvcGVyQGxpc3RzLnNvdXJjZWZvcmdlLm5ldDsNCj4gPj4g
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsNCj4gPj4gbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4+IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4gPj4g
Q2M6IE9wZW4gU291cmNlIFN1Ym1pc3Npb24gPHBhdGNoZXNAYW1wZXJlY29tcHV0aW5nLmNvbT47
IFRoYW5nIFEgLg0KPiA+PiBOZ3V5ZW4gPHRoYW5nQG9zLmFtcGVyZWNvbXB1dGluZy5jb20+OyBQ
aG9uZyBWbw0KPiA+PiA8cGhvbmdAb3MuYW1wZXJlY29tcHV0aW5nLmNvbT47IG9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDUvN10gaTJjOiBhc3Bl
ZWQ6IEFkZCBhc3BlZWRfc2V0X3NsYXZlX2J1c3koKQ0KPiA+Pg0KPiA+PiBPbiAyNC8wNS8yMDIx
IDE3OjM2LCBSeWFuIENoZW4gd3JvdGU6DQo+ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPj4+PiBGcm9tOiBRdWFuIE5ndXllbiA8cXVhbkBvcy5hbXBlcmVjb21wdXRpbmcuY29t
Pg0KPiA+Pj4+IFNlbnQ6IE1vbmRheSwgTWF5IDI0LCAyMDIxIDY6MjAgUE0NCj4gPj4+PiBUbzog
UnlhbiBDaGVuIDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+OyBDb3JleSBNaW55YXJkDQo+ID4+
Pj4gPG1pbnlhcmRAYWNtLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBK
b2VsIFN0YW5sZXkNCj4gPj4+PiA8am9lbEBqbXMuaWQuYXU+OyBBbmRyZXcgSmVmZmVyeSA8YW5k
cmV3QGFqLmlkLmF1PjsgQnJlbmRhbiBIaWdnaW5zDQo+ID4+Pj4gPGJyZW5kYW5oaWdnaW5zQGdv
b2dsZS5jb20+OyBCZW5qYW1pbiBIZXJyZW5zY2htaWR0DQo+ID4+Pj4gPGJlbmhAa2VybmVsLmNy
YXNoaW5nLm9yZz47IFdvbGZyYW0gU2FuZyA8d3NhQGtlcm5lbC5vcmc+OyBQaGlsaXBwDQo+ID4+
Pj4gWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Ow0KPiA+Pj4+IG9wZW5pcG1pLWRldmVs
b3BlckBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7DQo+ID4+Pj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gPj4+PiBsaW51
eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsN
Cj4gPj4+PiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+ID4+Pj4gQ2M6IE9wZW4gU291cmNl
IFN1Ym1pc3Npb24gPHBhdGNoZXNAYW1wZXJlY29tcHV0aW5nLmNvbT47IFRoYW5nDQo+IFEgLg0K
PiA+Pj4+IE5ndXllbiA8dGhhbmdAb3MuYW1wZXJlY29tcHV0aW5nLmNvbT47IFBob25nIFZvDQo+
ID4+Pj4gPHBob25nQG9zLmFtcGVyZWNvbXB1dGluZy5jb20+OyBvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmcNCj4gPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDUvN10gaTJjOiBhc3BlZWQ6IEFk
ZA0KPiA+Pj4+IGFzcGVlZF9zZXRfc2xhdmVfYnVzeSgpDQo+ID4+Pj4NCj4gPj4+PiBPbiAyNC8w
NS8yMDIxIDE3OjA2LCBSeWFuIENoZW4gd3JvdGU6DQo+ID4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+Pj4+Pj4gRnJvbTogb3BlbmJtYw0KPiA+Pj4+Pj4gPG9wZW5ibWMtYm91
bmNlcytyeWFuX2NoZW49YXNwZWVkdGVjaC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24NCj4gPj4+
PiBCZWhhbGYNCj4gPj4+Pj4+IE9mIFF1YW4gTmd1eWVuDQo+ID4+Pj4+PiBTZW50OiBXZWRuZXNk
YXksIE1heSAxOSwgMjAyMSAzOjUwIFBNDQo+ID4+Pj4+PiBUbzogQ29yZXkgTWlueWFyZCA8bWlu
eWFyZEBhY20ub3JnPjsgUm9iIEhlcnJpbmcNCj4gPj4+Pj4+IDxyb2JoK2R0QGtlcm5lbC5vcmc+
OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PjsgQW5kcmV3DQo+ID4+Pj4+PiBKZWZmZXJ5
IDxhbmRyZXdAYWouaWQuYXU+OyBCcmVuZGFuIEhpZ2dpbnMNCj4gPj4+Pj4+IDxicmVuZGFuaGln
Z2luc0Bnb29nbGUuY29tPjsgQmVuamFtaW4gSGVycmVuc2NobWlkdA0KPiA+Pj4+Pj4gPGJlbmhA
a2VybmVsLmNyYXNoaW5nLm9yZz47IFdvbGZyYW0gU2FuZyA8d3NhQGtlcm5lbC5vcmc+Ow0KPiA+
Pj4+Pj4gUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47DQo+ID4+Pj4+PiBv
cGVuaXBtaS1kZXZlbG9wZXJAbGlzdHMuc291cmNlZm9yZ2UubmV0Ow0KPiA+Pj4+Pj4gZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZzsNCj4gPj4+Pj4+IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnOyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnOw0KPiA+Pj4+Pj4gbGludXgtaTJjQHZnZXIua2VybmVsLm9yZw0KPiA+
Pj4+Pj4gQ2M6IE9wZW4gU291cmNlIFN1Ym1pc3Npb24gPHBhdGNoZXNAYW1wZXJlY29tcHV0aW5n
LmNvbT47DQo+IFRoYW5nDQo+ID4+IFEgLg0KPiA+Pj4+Pj4gTmd1eWVuIDx0aGFuZ0Bvcy5hbXBl
cmVjb21wdXRpbmcuY29tPjsgUGhvbmcgVm8NCj4gPj4+Pj4+IDxwaG9uZ0Bvcy5hbXBlcmVjb21w
dXRpbmcuY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+ID4+Pj4+PiBTdWJqZWN0OiBb
UEFUQ0ggdjMgNS83XSBpMmM6IGFzcGVlZDogQWRkIGFzcGVlZF9zZXRfc2xhdmVfYnVzeSgpDQo+
ID4+Pj4+Pg0KPiA+Pj4+Pj4gU2xhdmUgaTJjIGRldmljZSBvbiBBU1QyNTAwIHJlY2VpdmVkIGEg
bG90IG9mIHNsYXZlIGlycSB3aGlsZSBpdA0KPiA+Pj4+Pj4gaXMgYnVzeSBwcm9jZXNzaW5nIHRo
ZSByZXNwb25zZS4gVG8gaGFuZGxlIHRoaXMgY2FzZSwgYWRkcyBhbmQNCj4gPj4+Pj4+IGV4cG9y
dHMNCj4gPj4+Pj4+IGFzcGVlZF9zZXRfc2xhdmVfYnVzeSgpIGZvciBjb250cm9sbGVyIHRvIHRl
bXBvcmFyeSBzdG9wIHNsYXZlDQo+ID4+Pj4+PiBpcnEgd2hpbGUgc2xhdmUgaXMgaGFuZGxpbmcg
dGhlIHJlc3BvbnNlLCBhbmQgcmUtZW5hYmxlIHRoZW0NCj4gPj4+Pj4+IGFnYWluIHdoZW4gdGhl
DQo+ID4+Pj4gcmVzcG9uc2UgaXMgcmVhZHkuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gU2lnbmVkLW9m
Zi1ieTogUXVhbiBOZ3V5ZW4gPHF1YW5Ab3MuYW1wZXJlY29tcHV0aW5nLmNvbT4NCj4gPj4+Pj4+
IC0tLQ0KPiA+Pj4+Pj4gdjM6DQo+ID4+Pj4+PiAgICAgICsgRmlyc3QgaW50cm9kdWNlIGluIHYz
IFtRdWFuXQ0KPiA+Pj4+Pj4NCj4gPj4+Pj4+ICAgICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFz
cGVlZC5jIHwgMjAgKysrKysrKysrKysrKysrKysrKysNCj4gPj4+Pj4+ICAgICAxIGZpbGUgY2hh
bmdlZCwgMjAgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzcGVlZC5jDQo+ID4+Pj4+PiBiL2RyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtYXNwZWVkLmMgaW5kZXgNCj4gPj4+Pj4+IGIyZTljOGYwZGRmNy4uOTkyNmQwNDgz
MWEyDQo+ID4+Pj4+PiAxMDA2NDQNCj4gPj4+Pj4+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtYXNwZWVkLmMNCj4gPj4+Pj4+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXNwZWVk
LmMNCj4gPj4+Pj4+IEBAIC05NDQsNiArOTQ0LDI2IEBAIHN0YXRpYyBpbnQgYXNwZWVkX2kyY19p
bml0KHN0cnVjdA0KPiA+Pj4+Pj4gYXNwZWVkX2kyY19idXMgKmJ1cywNCj4gPj4+Pj4+ICAgICAJ
cmV0dXJuIDA7DQo+ID4+Pj4+PiAgICAgfQ0KPiA+Pj4+Pj4NCj4gPj4+Pj4+ICsjaWYgSVNfRU5B
QkxFRChDT05GSUdfSTJDX1NMQVZFKSB2b2lkDQo+ID4+Pj4+PiArYXNwZWVkX3NldF9zbGF2ZV9i
dXN5KHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCwgYm9vbCBidXN5KSB7DQo+ID4+Pj4+PiArCXN0
cnVjdCBhc3BlZWRfaTJjX2J1cyAqYnVzID0gaTJjX2dldF9hZGFwZGF0YShhZGFwKTsNCj4gPj4+
Pj4+ICsJdW5zaWduZWQgbG9uZyBjdXJyZW50X21hc2ssIGZsYWdzOw0KPiA+Pj4+Pj4gKw0KPiA+
Pj4+Pj4gKwlzcGluX2xvY2tfaXJxc2F2ZSgmYnVzLT5sb2NrLCBmbGFncyk7DQo+ID4+Pj4+PiAr
DQo+ID4+Pj4+PiArCWN1cnJlbnRfbWFzayA9IHJlYWRsKGJ1cy0+YmFzZSArIEFTUEVFRF9JMkNf
SU5UUl9DVFJMX1JFRyk7DQo+ID4+Pj4+IEhlbGxvDQo+ID4+Pj4+IAlXaGVyZSB0aGUgYnVzLT5i
YXNlIHRvIGJlIHJlbWFwPw0KPiA+Pj4+Pg0KPiA+Pj4+DQo+ID4+Pj4gSGkgUnlhbiwNCj4gPj4+
Pg0KPiA+Pj4+IEluICJbUEFUQ0ggdjMgNi83XSBpcG1pOiBzc2lmX2JtYzogQWRkIEFzcGVlZCBT
U0lGIEJNQyBkcml2ZXIiLCB0aGUNCj4gPj4+PiAtPnByaXYgaXMgcmV0cmlldmVkIGJ5IGNhbGxp
bmcgaTJjX2dldF9hZGFwZGF0YShjbGllbnQtPmFkYXB0ZXIpLg0KPiA+Pj4+IC0+QW5kIGluDQo+
ID4+Pj4gYXNwZWVkX3NldF9zc2lmX2JtY19zdGF0dXMoKSwgY2FsbCB0aGUgZXhwb3J0ZWQNCj4g
Pj4+PiBhc3BlZWRfc2V0X3NsYXZlX2J1c3koKSB1c2luZyAtPnByaXYgcG9pbnRlciBhcyBjb2Rl
IGJlbG93Lg0KPiA+Pj4+DQo+ID4+PiBZZXMsIEkgc2VlIHRoZSBwcm9iZSBmdW5jdGlvbiAiIHNz
aWZfYm1jLT5wcml2ID0NCj4gPj4gaTJjX2dldF9hZGFwZGF0YShjbGllbnQtPmFkYXB0ZXIpOyIg
dG8gZ2V0IHByaXYuDQo+ID4+PiBCdXQgbXkgcXVlc3Rpb24gSSBkb27igJl0IHNlZSB0aGUgYnVz
LT5iYXNlIGFkZHJlc3MgYmUgYXNzaWduZWQuDQo+ID4+Pg0KPiA+PiBIaSBSeWFuLA0KPiA+Pg0K
PiA+PiBJbiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzcGVlZC5jOg0KPiA+PiBzdHJ1Y3QgYXNw
ZWVkX2kyY19idXMgew0KPiA+PiAgICAgICAgICAgc3RydWN0IGkyY19hZGFwdGVyICAgICAgICAg
ICAgICBhZGFwOw0KPiA+PiAgICAgICAgICAgc3RydWN0IGRldmljZSAgICAgICAgICAgICAgICAg
ICAqZGV2Ow0KPiA+PiAgICAgICAgICAgdm9pZCBfX2lvbWVtICAgICAgICAgICAgICAgICAgICAq
YmFzZTsNCj4gPj4gICAgICAgICAgIHN0cnVjdCByZXNldF9jb250cm9sICAgICAgICAgICAgKnJz
dDsNCj4gPj4gICAgICAgICAgIC8qIFN5bmNocm9uaXplcyBJL08gbWVtIGFjY2VzcyB0byBiYXNl
LiAqLw0KPiA+PiAgICAgICAgICAgc3BpbmxvY2tfdCAgICAgICAgICAgICAgICAgICAgICBsb2Nr
Ow0KPiA+Pg0KPiA+PiBTbyB3aGVuICJzdHJ1Y3QgYXNwZWVkX2kyY19idXMgKmJ1cyA9IGkyY19n
ZXRfYWRhcGRhdGEoYWRhcCk7IiwgdGhlDQo+ID4+IGJ1cy0+YmFzZSBzaG91bGQgcG9pbnQgdG8g
dGhlIGJhc2Ugb2YgdGhlIGFzcGVlZF9pMmNfYnVzLCB3aGljaCBpcw0KPiA+PiBhbHJlYWR5IGlu
aXRpYWxpemVkIGJ5IHRoZSBhc3BlZWQgaTJjIGJ1cyBkcml2ZXIuDQo+ID4+DQo+ID4+IERvIEkg
bWlzcyBzb21ldGhpbmc/DQo+ID4gSGVsbG8gUXVhbiwNCj4gPiAJQWZ0ZXIgc3R1ZHkuIEkgdGhp
bmsgdGhlIHNzaWZfYm1jX2FzcGVlZC5jIGFzc3VtZSB0aGUgcHJpdiBkYXRhIGlzIHRoZQ0KPiBz
YW1lIHN0cnVjdC4NCj4gPiAJVGhhdCBpcyB0cmljay4NCj4gPiAJRG8gd2UgaGF2ZSBhIGJldHRl
ciBmb3Igc2xhdmUgZW5hYmxlL2Rpc2FibGUgY2FsbCBiYWNrIHRvIGltcGxlbWVudCB0aGlzPw0K
PiA+IAlJZiBhZGQgY2FsbCBiYWNrIGluIHN0cnVjdCBpMmNfYWxnb3JpdGhtOyBpcyBpdCB3b3Jr
YWJsZT8NCj4gPj4NCj4gDQo+IEhpIFJ5YW4sDQo+IA0KPiBJIGRvbnQga25vdyB3aGljaCBpcyBi
ZXR0ZXIsIGllOiBhZGRpbmcgY2FsbGJhY2sgdG8gc3RydWN0IGkyY19hbGdvcml0aG0gb3IgdG8N
Cj4gc3RydWN0IGkyY19hZGFwdGVyLg0KPiBJIGhhdmUgdHJpZWQgdG8gYWRkIGdlbmVyaWMgY2Fs
bGJhY2sgdG8gc3RydWN0IGkyY19hZGFwdGVyIGFzIGJlbG93IGFuZCBpdA0KPiB3b3Jrcy4NCj4g
DQpIZWxsbyBRdWFuLA0KCVRoYW5rcyB5b3VyIGZlZWRiYWNrLg0KCUJlY2F1c2UsIGlmIHdlIGFw
cGx5IGl0IGluIGNhbGxiYWNrLiBJdCBjYW4gdW5pZnkgaXQgaW4gc3NpZl9ibWMuYyB0byBkbyBj
YWxsYmFjay4NCglOb3QgaGF2ZSBzc2lmX2JtY19hc3BlZWQuYywgc3NpZl9ibWNfeHh4LmMgLi4u
Li4NCglCZWNhdXNlIHRoZSBwcml2IHN0cnVjdCBpcyBkaWZmZXJlbnQgaW4gZGlmZmVyZW50IGky
YyBkcml2ZXIgaW1wbGVtZW50LiANClJ5YW4NCgkNCg0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9pMmMuaCBiL2luY2x1ZGUvbGludXgvaTJjLmggaW5kZXgNCj4gNGU3NzE0Yzg4Zjk1Li42
ZTlhYmYyZDZhYmIgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvaTJjLmgNCj4gKysrIGIv
aW5jbHVkZS9saW51eC9pMmMuaA0KPiBAQCAtNzEzLDYgKzcxMywxMCBAQCBzdHJ1Y3QgaTJjX2Fk
YXB0ZXIgew0KPiAgIAljb25zdCBzdHJ1Y3QgaTJjX2FkYXB0ZXJfcXVpcmtzICpxdWlya3M7DQo+
IA0KPiAgIAlzdHJ1Y3QgaXJxX2RvbWFpbiAqaG9zdF9ub3RpZnlfZG9tYWluOw0KPiArI2lmIElT
X0VOQUJMRUQoQ09ORklHX0kyQ19TTEFWRSkNCj4gKwlpbnQgKCpzbGF2ZV9lbmFibGUpKHN0cnVj
dCBpMmNfYWRhcHRlciAqYWRhcCk7DQo+ICsJaW50ICgqc2xhdmVfZGlzYWJsZSkoc3RydWN0IGky
Y19hZGFwdGVyICphZGFwKTsgI2VuZGlmDQo+ICAgfTsNCj4gICAjZGVmaW5lIHRvX2kyY19hZGFw
dGVyKGQpIGNvbnRhaW5lcl9vZihkLCBzdHJ1Y3QgaTJjX2FkYXB0ZXIsIGRldikNCj4gDQo+ID4+
Pj4gK2V4dGVybiB2b2lkIGFzcGVlZF9zZXRfc2xhdmVfYnVzeShzdHJ1Y3QgaTJjX2FkYXB0ZXIg
KmFkYXAsIGJvb2wNCj4gPj4+PiArYnVzeSk7IHN0YXRpYyB2b2lkIGFzcGVlZF9zZXRfc3NpZl9i
bWNfc3RhdHVzKHN0cnVjdCBzc2lmX2JtY19jdHgNCj4gPj4+PiArKnNzaWZfYm1jLA0KPiA+Pj4+
IHVuc2lnbmVkIGludCBzdGF0dXMpDQo+ID4+Pj4gK3sNCj4gPj4+PiArCWlmIChzdGF0dXMgJiBT
U0lGX0JNQ19CVVNZKQ0KPiA+Pj4+ICsJCWFzcGVlZF9zZXRfc2xhdmVfYnVzeSgoc3RydWN0IGky
Y19hZGFwdGVyICopc3NpZl9ibWMtPnByaXYsDQo+IHRydWUpOw0KPiA+Pj4+ICsJZWxzZSBpZiAo
c3RhdHVzICYgU1NJRl9CTUNfUkVBRFkpDQo+ID4+Pj4gKwkJYXNwZWVkX3NldF9zbGF2ZV9idXN5
KChzdHJ1Y3QgaTJjX2FkYXB0ZXIgKilzc2lmX2JtYy0+cHJpdiwNCj4gPj4+PiArZmFsc2UpOyB9
DQo+ID4+Pj4gKw0KPiA+Pj4+ICtzdGF0aWMgaW50IHNzaWZfYm1jX3Byb2JlKHN0cnVjdCBpMmNf
Y2xpZW50ICpjbGllbnQsIGNvbnN0IHN0cnVjdA0KPiA+Pj4+IGkyY19kZXZpY2VfaWQgKmlkKQ0K
PiA+Pj4+ICt7DQo+ID4+Pj4gKwlzdHJ1Y3Qgc3NpZl9ibWNfY3R4ICpzc2lmX2JtYzsNCj4gPj4+
PiArDQo+ID4+Pj4gKwlzc2lmX2JtYyA9IHNzaWZfYm1jX2FsbG9jKGNsaWVudCwgMCk7DQo+ID4+
Pj4gKwlpZiAoSVNfRVJSKHNzaWZfYm1jKSkNCj4gPj4+PiArCQlyZXR1cm4gUFRSX0VSUihzc2lm
X2JtYyk7DQo+ID4+Pj4gKw0KPiA+Pj4+ICsJc3NpZl9ibWMtPnByaXYgPSBpMmNfZ2V0X2FkYXBk
YXRhKGNsaWVudC0+YWRhcHRlcik7DQo+ID4+Pj4gKwlzc2lmX2JtYy0+c2V0X3NzaWZfYm1jX3N0
YXR1cyA9IGFzcGVlZF9zZXRfc3NpZl9ibWNfc3RhdHVzOw0KPiA+Pj4+ICsNCj4gPj4+PiArCXJl
dHVybiAwOw0KPiA+Pj4+ICt9DQo+ID4+Pj4NCj4gPj4+PiAtIFF1YW4NCj4gPj4+Pg0KPiA+Pj4+
DQo+ID4+Pg0KPiA+DQoNCg==
