Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE515637A4
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Jul 2022 18:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbiGAQS4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Jul 2022 12:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbiGAQS4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Jul 2022 12:18:56 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2122.outbound.protection.outlook.com [40.107.113.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08BF3B025;
        Fri,  1 Jul 2022 09:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nytjOjQtN2VQbYGjRdnoDrC0i+H5UdIZnsbzb1XpM8n7kMAAKmvKF5mHVPh4xNuQ5Y+qD8apMmUhfJ7PpCwY4Q5jiAlWwCAAKSsmiDFWNQBYGAaZzClvRX5bIoq3LOTJAzL14IHx5H2ry9VH3zTWdS9bhZDUNRnCivqtYPdAGuzoWxbavjwHVkLVwrpgYTXcSecFHnngD1hF22N8wXuaOrskSfu5MFWFu1ApSTfv4SC4MP/4VHghbMrfmBoBowlhSyK5AX7M2NVwqnj+eoL7f+J8S9OdcfdXHDCHOahqU39MD1TYMLJdbAuVrAqT/9Q7vnM3B0QIQcZP7Vzl93/8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Li/B/VIwHLriVAvHuC/gY3ClEp2y2cyq1txcfHegTc=;
 b=OAw+6tIDG38j6cc7j210HBflSnKty4rgCR50kht5ELSXFGz+L+QVLFp/qkbSr+ZoU/rzPSYKWi2x+ZzcLfYYxj/70VI7k07TezyZM1AN/HntYaLKH20+xEHzflFZy24TWeZgnu7FwKfWGOLa6y2QuMrkNyL7y2fTzIss3Oqdg68Een1iwn6wxFQ8XeFycCSHC6Lb90lWw5oJDsP6naljTxX9Di6YXxsods1zmR7xkA6wzs3+BCXrO9SMSL7TNlcWXAsGMVycP2YaYyN1W/IqAWXvFhuPpc3I4H0U0YZtmbVdJ8DsrdeDhy7EzdEUla/1bvkrehdwWL+P3UpLEQbzJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Li/B/VIwHLriVAvHuC/gY3ClEp2y2cyq1txcfHegTc=;
 b=oxhAEAkdcGR7Otq7d/Mb09gBGHGHizqoP0WoXRCxO/M6cJxj5HDHL+8QyW+d9AB450AxR8S6x/BE7Ljdl5c6eaoIoBFKK28dYPH0ZUdshTowzUH4L1/6vHs0kDNzlPKrouTa9qYdhxtEO6BPHa63HLhJ9vUE/HllpKrrKidLOyw=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSAPR01MB3028.jpnprd01.prod.outlook.com (2603:1096:604:3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 16:18:52 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 16:18:51 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sven Peter <sven@svenpeter.dev>, Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 0/2] i2c: Add new driver for Renesas RZ/V2M controller
Thread-Topic: [PATCH v2 0/2] i2c: Add new driver for Renesas RZ/V2M controller
Thread-Index: AQHYiyeuOazIOKkpQEybI7nuneMbcK1mkhuAgAAQCACAAVE6EIAAFliAgAABFLCAAaCbAIAACi4A
Date:   Fri, 1 Jul 2022 16:18:51 +0000
Message-ID: <TYYPR01MB7086973EC542AF5860790D07F5BD9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
         <c168df990e1187bf44a5c46be53aa6b20d30d14d.camel@pengutronix.de>
         <CAMuHMdXV72_BWOpU=O13Fa3-t001YSRdsFePSHBS=Xvh1jY1EQ@mail.gmail.com>
         <TYYPR01MB7086706381CDCEF4F582690CF5BA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
         <be61be2446998c40b51a33453dda4d0b5f1518c3.camel@pengutronix.de>
         <TYYPR01MB70864F60A6F0ED029045E071F5BA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <eb92e73d1fdbdc7e056173526b54d2d6417dff9e.camel@pengutronix.de>
In-Reply-To: <eb92e73d1fdbdc7e056173526b54d2d6417dff9e.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f5176d3-0265-4d76-db5b-08da5b7d6323
x-ms-traffictypediagnostic: OSAPR01MB3028:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pIQAhZzlUxQzI97zEL4ssdYB48hUX9tBUIQyYdu/N86G00U1feWVEKo4FOG0WbCwD6Rk4t1YbOeBFQuf1bjIUEYCejEBKjpmOmH7WPNMqihM8sq5aqvQBZa7/BH6hqNqiCk3Q1SHUsa0jzzdv0jEDWLkUESW38ujzHYj1BrJZPyV6Oq75IvJvNOP7mz0eTPqsy3O168Wn+WxRBvhmCqiUa5bBDehIkIqTl99715CGfQn9hQdEhXOo7Yb+QTQb6u+Jo2ngJIeAegKzOtrNcA9dE1HVbzYnlzcYjRrWHSxuqpHsK2RhjfoiF1cNJkDkhm+yov3PMRFPKn3ei0+kNtfFIf7sN0SVeVTVEVvq7jB8213KezKQCwllRe2jmpHuE0SuO//GoTxWBIcAJO5JmyLIgSRYVTk1iGWBxNLd891dtIHfWF8iGwmsJp4zzlRI6825A3I83/WGstTB7xv5+PywvZxmoigjlB8MguNMlFI5caxs/WUvcsSKkGhGz0zcbZVtYXxu+aJIW4L6czOYqv0+Tc/vHHv/GvLA03rOPH+V4z9aJyEpnPEM473CWMisQgXrha+gjvDIWweo6+V2eVpAiKV4NOteGRl9kSU7gs5qakME2i2F/lru9A6epgx+oDSubO9sg6kvxR1TVKftkgSaITrbiA96hpUBucwZEWQDtdL4rBYO3BLSn3qK4oSK1QufTTWriLA6cmH+JY0D1wV07pc0PRmoNNGWOVkVuNWqqc+LskuJpKa1vTwHeMW0O6/H884YKFRvlDIfiNA8jIyScFTwruc4YCVntvsb2H+sSYwbibjglggwTElZWMGiUvx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(83380400001)(55016003)(122000001)(186003)(38100700002)(33656002)(2906002)(41300700001)(66946007)(6506007)(44832011)(8936002)(8676002)(66556008)(71200400001)(9686003)(7696005)(5660300002)(110136005)(66476007)(76116006)(38070700005)(66446008)(4326008)(316002)(26005)(52536014)(478600001)(54906003)(86362001)(53546011)(64756008)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0FxdDFEc2dLK1NXMUZCZWt2cFF1eVh5dUZFVFhpNTBBckt3aENoOTR5YWg2?=
 =?utf-8?B?SGQ0NHNad0ZMaklseG16R1VubWRDL3JTbC8vbnBoZ2hGRkk2YnpNMFZmdzdN?=
 =?utf-8?B?ekhJcXJhdXBuakNNZXBRd3JtcVF6QjBZL1d6YjZIa08wSzlCenFSelRlbmhI?=
 =?utf-8?B?M2NudERnRzRwMEhHbHUxZ254K0xSQnluQlI0R1lHdVRHWHhRSTBZK2lUcGQ5?=
 =?utf-8?B?UHdYSE1UWjJmU2hZbkZXRUNSNmpWS094Z0U2cHd0QXl6SkUvc1o1TWJMcjB0?=
 =?utf-8?B?WVRLaGc5TDlkeUtoSnZaNnAyV1UyMnFDQ1FTb0s5aUVGdUVLTHhVT25Vc3Va?=
 =?utf-8?B?VXpIMHlnc29MOGlObCtJSWlxYkRLZVlQNUZTRnFObXU1Mk40bTRJRjNwQU1j?=
 =?utf-8?B?UkNqdmhWckw5UWpUZmZEOFZFWVViVHFRNkVBTktKbUt3VnRRZ2VEY1o0a3Iy?=
 =?utf-8?B?Ni93MWg4eVUvb1dSQ3FBTkFiMEpna1lqWGhJY0FWdnJxRXYrV242dUprRGhS?=
 =?utf-8?B?eFhIMzBBajVXK0psSitJL2hzUENPNFY4VGJmYWZ0QmFqd0lyM1hvOW9mNGVB?=
 =?utf-8?B?Mm5zQkFyWCtXTmNoTlRpN0VqWU5JQmpBUkk5Unk4aUhVejZTc21XUkxEK01o?=
 =?utf-8?B?dVVMc3cvLzc4THdEMm4xZ004SlNNVCtsKzhmUWVzSnRQSmFHMEdpWTBpTTMr?=
 =?utf-8?B?YStKSXJldWdjWm1pMjNKZC9Nb0J0ZUMxODRCU0ovakx3MHhGSVk4dXlUSGIw?=
 =?utf-8?B?bXo5MXZHd1RDUGF3T1NqZ1Bzd3NTRGlHYjdsa2xYekNxdFA3SDAvanVwQlRJ?=
 =?utf-8?B?aFlTaVZtTTFaZ1A1UEZzMEJKRU9TVnBwenAvSVZEZzFLdWoydk1mOUIvQlVq?=
 =?utf-8?B?ZFNQN2NBbzNRbkdyU3Vzb0RmK1lCV3hpREphcFNxa3VKaFQ4RE0wZnQrTjdK?=
 =?utf-8?B?ZDIyS3RGME5sNGo4ZlFKWDVzZnNxQis2NEZoMFROMWZKWHJtOWpOVU14bjhE?=
 =?utf-8?B?dUpUcWh6Rzgwc2tSNCtPUTVsZmZLR1R4U1EzYkMzTk9nU1hPVjF3amdCMVI5?=
 =?utf-8?B?SXBYRU1zOWVnV3hwUU1HUnBPTmJJb3dDRHN6U0J5aG9vZ3pOMmdmNDgwR3Ir?=
 =?utf-8?B?T1JudWlJeXNrVnBTOCtGOVpZeHdSMDM4V2RVdEpyZW9aTmVNcUtKck04SUU0?=
 =?utf-8?B?OHZiUlZ0eDlzNFdvb0UyWGZXVVBGZHVnQkhiREl0UUhsVklPTWxTWnBIakRF?=
 =?utf-8?B?WnlLYzJET3h2bkpETGRDNG5YdldMTEthdkZuSlZseWQvdXRrQjBMZllNVkJC?=
 =?utf-8?B?bml5N2NXTlgzbExySmtJemlQZjJGcG10eC9sRFNIcWRFM3V2U0tqSkVPRDJM?=
 =?utf-8?B?cjZzcGx4Y2pQYlo5OWhUMm5mejhCVGpVVkpFN0tQOXRFamU5OHo0bjhMekNM?=
 =?utf-8?B?MHJMQTVHSnFEK0RaaUhCRU1FcUxQeGk2TWxmQjgrQ0gyY1M5SUtac3JGcVQ0?=
 =?utf-8?B?Qkg4SVNOTzJmNTVyRm5uSWdqSTd3aUt5Z2J5Nk14UjlOZlJjZFVJeXN2SENw?=
 =?utf-8?B?blhhQ09Lb2tyS0ZjbUR4ZWF5dXJ2WHlRYlRQa1UxSVJWS0tMaVl4cEY4V3ZJ?=
 =?utf-8?B?MG9ZYzZBaDQ1QVBBbEZIZUlqOFdlL2hqdC9laTdkZGdkN3g5UUhPbUluYzVz?=
 =?utf-8?B?UUF2bUVnUWs2cDhBblNnVDVnWkN1bzFxRHh2d3pFSVYwUEVMUUtEbXR0dEZS?=
 =?utf-8?B?Vlk3Ymd1dkVvOWhseDdiRzBZekZha1RoQnFjV3orSDlOOWdKZjRYck91b2lV?=
 =?utf-8?B?SEFac2lSc1F6cW9zd2k5Q2dqMlZsSHRSbXN6eUdMa1JPS2t4M3BxSjFpQ2xU?=
 =?utf-8?B?cjgraUV0MFdVcEZKZ0I0L201NHZiTE04OFlRK1RndW9QVWZJSU5SbGM5R2dw?=
 =?utf-8?B?Y2xienFqVWl4clBFQ0lvcFlBbEFIZkt2Ky9MVHhTZTFSU0I4cURiaVhUYUFR?=
 =?utf-8?B?VFhGMUxCdXBxVWlSRjBUY1lDS1E1ZDAvSmhkQ0RsMitySlRpREhHODlVa2Rz?=
 =?utf-8?B?UXlpWWFkVG0ybE4xTU1wd3lCYjhrSUNEWmtpRG5JK1o5ZFllOXZmR1JLdzl0?=
 =?utf-8?B?U3ZmTXMzVGZFTXF5YXdHMmcrK0pkSXFCL3dRUDdNUlJHZDNsNWNYQ1dMQkJX?=
 =?utf-8?B?YWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5176d3-0265-4d76-db5b-08da5b7d6323
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 16:18:51.8211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjGjMXvBJ1QmA2Kmb3rttfREw7hD5vnT1Q0RQRTfSColJahI4Lusx/EOZKPSsXRY4A5D6i/OLkCFcYUnlboDi1qdxVDdK0n2REp6NckLd/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3028
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgUGhpbGlwcCwNCg0KT24gMDEgSnVseSAyMDIyIDE2OjQwIFBoaWxpcHAgWmFiZWwgd3JvdGU6
DQo+IE9uIERvLCAyMDIyLTA2LTMwIGF0IDE1OjE2ICswMDAwLCBQaGlsIEVkd29ydGh5IHdyb3Rl
Og0KPiA+IEluIG9yZGVyIGZvciBkcml2ZXJzIHRvIHdvcmsgb24gbG90cyBvZiBwbGF0Zm9ybXMs
IHNob3VsZCBhbGwgZHJpdmVycw0KPiA+IHVzZSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X3NoYXJl
ZCgpIGluc3RlYWQgb2YgZGV2bV9yZXNldF9jb250cm9sX2dldCgpLA0KPiA+IHVubGVzcyB0aGVy
ZSBpcyBhIG5lZWQgdG8gcmVzZXQgdGhlIGhhcmR3YXJlIGF0IGEgc3BlY2lmaWMgdGltZSBhZnRl
cg0KPiA+IGJvb3QgKGUuZy4gd2F0Y2hkb2cgd2l0aCBubyB3YXkgb3V0KT8NCj4gDQo+IE5vYm9k
eSBzaG91bGQgdXNlIGRldm1fcmVzZXRfY29udHJvbF9nZXQoKS4gVGhvc2UgZHJpdmVycyB0aGF0
IHJlcXVpcmUNCj4gZGlyZWN0IGNvbnRyb2wgc2hvdWxkIHVzZSBkZXZtX3Jlc2V0X2NvbnRyb2xf
Z2V0X2V4Y2x1c2l2ZSgpLiBBbGwNCj4gb3RoZXJzIHByb2JhYmx5IHNob3VsZCB1c2UgdGhlIF9z
aGFyZWQoKSB2YXJpYW50LCBpZiBpdCB3b3JrcyBmb3IgdGhlbS4NCk9rLCBnb3QgaXQhDQoNCj4g
PiBTbyB3aGVyZSBkbyB3ZSBnbyB3aXRoIHRoaXMgZm9yIHRoaXMgaTJjIGRyaXZlcj8NCj4gDQo+
IEluIHRoaXMgc3BlY2lmaWMgY2FzZSBsZXR0aW5nIHRoZSBkcml2ZXIgZGVhc3NlcnQgdGhlIHJl
c2V0IHNlZW1zIHRvIGJlDQo+IHNhZmUsIHNvIEknbSBmaW5lIHdpdGggdGhlIHdheSBpdCBpcy4N
Cj4gDQo+IFlvdSBjb3VsZCBhbHNvIGxldCB0aGUgaTJjIGRyaXZlciBjYWxsIHJlc2V0X2NvbnRy
b2xfYXNzZXJ0KCkgZHVyaW5nDQo+IHJlbW92ZSgpIGFuZCBtb2RpZnkgdGhlIHJ6ZzJsLWNwZy5j
IGRyaXZlciB0byBpZ25vcmUgaXQuIFRoYXQgZG9lc24ndA0KPiBzZWVtIHZlcnkgdXNlZnVsIG9u
IGl0cyBvd24sIGJ1dCBpdCB3b3VsZCBoYXZlIHRoZSBwb3NpdGl2ZSBlZmZlY3Qgb2YNCj4gZG9j
dW1lbnRpbmcgdGhlIHNoYXJlZC13aXRoLWZpcm13YXJlIHJlc2V0IGluIHRoZSByZXNldCBjb250
cm9sbGVyDQo+IGRyaXZlci4NCk9rLCBJJ2xsIHNraXAgdGhlIGFzc2VydCBmb3IgdGhlIHRpbWUg
YmVpbmcgYW5kIHdoZW4gd2UgZ2V0IHJvdW5kIHRvDQptYWtpbmcgdGhlIHJlc2V0IGNvbnRyb2xs
ZXIgbWFzayBvdXQgc2hhcmVkIHJlc2V0cywgd2UgY2FuIHRoZW4gbW9kaWZ5DQp0aGUgaTJjIGRy
aXZlci4NCg0KVGhhbmtzIGZvciB5b3VyIGFkdmljZSwNClBoaWwNCg==
