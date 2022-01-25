Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCA349AB8A
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 06:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1392054AbiAYFS0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 00:18:26 -0500
Received: from mail-dm6nam11on2061.outbound.protection.outlook.com ([40.107.223.61]:18081
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1324535AbiAYEvS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Jan 2022 23:51:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7yC1d28yo4OVO4o1De0/pGUGuNZR7bP+343RaF9UehEgah8o0t3t4E6G5/AmBI0C3vpAdsRDhqpbgt9BkFbiFZLTWKmgqduJezmPSYA6l92XTMzfMrioGVqlp6iMnSsJika0hUgBJ2ZepVYFNcHSFvKZ6tUcsYTeqVdKb9yObyoia3D2ESaokLsxd0emamQ/TNCr5f3mym0aluhUSNhErqaiqZBRhaMOnL7+FlsLRjWLIOVkkvrLVIPJrMFmWZu8JXyz+1nvPgoY/FDC3ABnIw1GxG5ZT0ST/DcraeUW9ny/0uk7fc2c2JyXqa2AMYrFBoynJMz9Yvk/A38EV29gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJVn1Xr8MBC5pipCWhXzgSQg8gViHmq1qB5rpL8lNCI=;
 b=GpJ9rcKpVpfCXAPFcSpFnIuUpyQ7S3OFbazuA6qqiKtgZ29/oQO9N/DfNTMJzwoJ5TZEORQuZA27uoqQ/GvJTaNmWOWm8kYChCtKv9R45PutXbNWrGr2STEwErmBt4V2cjXVPk4Tp5hsAhZ9ECCGdt9Uy8HpOvSRaTNNO7v5uENSn+jV8PHzIRO/4ZEzO0fh1620zpi6J9TzOQ+tOHeKxISGgiRLu4lCEP1RG9PLcvXgSoS8BMGXUR/yC5WwdKN61D3svKHFTgdQAmy2nxIMdbtXBPqI271z6kUKRA1hFWNaFC4tH6xEBK/NOFGoJ8X3gKUsfEFAoWzL9HK62K4/RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJVn1Xr8MBC5pipCWhXzgSQg8gViHmq1qB5rpL8lNCI=;
 b=UQrPLW9+IxCJp5tkBeIa76ZN3abK7WW2gnmnmkFNmcmBJc993NS+4AJmekG3pEXLotRlNjkIR3q5Y3G59kFv3VaEVDVfysixwBLxyguQxJU/0srMTEweWW2bWTY6BSy4W0R9HGLg1LnBWDbsqZeZZLEDSLZQXxZHihy/Zs+fpjSCW8bzFUwE/NdvpNibLqCkJppxQiCxBo1N/2Z+rVEegTa9HWvQArnkXLMuUZRzh/yU4PNAVUOmrdoPK+X2RuFiFfkgswXoUx31tb8SZbNcfjL+1jzBG8HqkzTLWoDntIAED9+PRVvLcQQtcrKOA380LzGDkeaPDwJiF24cMbLZvg==
Received: from DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23)
 by DM6PR12MB4252.namprd12.prod.outlook.com (2603:10b6:5:211::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Tue, 25 Jan
 2022 04:51:08 +0000
Received: from DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851]) by DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851%11]) with mapi id 15.20.4909.017; Tue, 25 Jan
 2022 04:51:08 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Subject: RE: [PATCH v3 2/4] arm64: tegra: Add Tegra234 I2C devicetree nodes
Thread-Topic: [PATCH v3 2/4] arm64: tegra: Add Tegra234 I2C devicetree nodes
Thread-Index: AQHYERQqFMlS81woMEOklaA8GbTHw6xyYlkAgADEWOA=
Date:   Tue, 25 Jan 2022 04:51:08 +0000
Message-ID: <DM5PR12MB185016F97740385594BBA396C05F9@DM5PR12MB1850.namprd12.prod.outlook.com>
References: <1643023097-5221-1-git-send-email-akhilrajeev@nvidia.com>
 <1643023097-5221-3-git-send-email-akhilrajeev@nvidia.com>
 <c323b734-b134-2dc0-cfa2-c9f63f1c3ad8@gmail.com>
In-Reply-To: <c323b734-b134-2dc0-cfa2-c9f63f1c3ad8@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c92f6f8d-08a6-451b-66d2-08d9dfbe4d46
x-ms-traffictypediagnostic: DM6PR12MB4252:EE_
x-microsoft-antispam-prvs: <DM6PR12MB425273962C4483D0E755FE74C05F9@DM6PR12MB4252.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N0m9MCzdKEnTDoyRJVSVEkj9mpel5kJTRGYFIqGkkyyE0V4WL5exI31akYJj6Awkymt1svxvU2Bs5UEqI54ZaRQLIKrPBGDVUow5Crxsu58mfBunoyRxwp1Ia555YZYkBZT5REiZ+pf3/S2aNFWw3CDdvhP6uEfgGPxHPsx39+g4QPNn6tnQPkhUJo2vqY8PHrLmHxUwRHKgUlu+aq0ZNDie0NbVd3dXuJxxzwR/+gnDE4DpOBRLBL4Gp5ANEkDW7JEfEQdoHzvpgpMyBdogVJtI3y4pZ8llGFcehsTToj6OarguTo1t6f9HxsQlgi6tlIafpiUjoZW/SPiSZVpaGcY2yUdpfVA6PNm8tMeS4f9lfmAIjj3GbeaLEKwUYKnL5wppDYiq/+p4tbc619hzXgnyQuo3q1jn71unVMF+NyDSKiFjcvSyyTDofza6VPtn0P08bDWPPbu5bUVd0OgL8C6rST/u8lOfL0kCZB7QifhI6kCaEcCHMhT5E1rsCaML+CJlEtLx6wjdHoAGf576D+vBKOefvRbzL47snw5tFszocRiYypL8ieYWUM6JNtDFhZ4iunMFVCZHFLlbMiKqdElm3/AkE/dmetUfJeWfBZ50VgI0eHv94juLzlIamSkeOiO3TNpCM80XhKBJVXyo3YiN3+O7XlSyRHm1AHhyodHV7j8Y8/AYS7Oa32DtKzk5TQyTfF6hIIdSUnYr1yCXB6SrVaZKbx6Yi1SpmBhuKig=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1850.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(71200400001)(2906002)(921005)(8676002)(5660300002)(7696005)(52536014)(76116006)(86362001)(55016003)(38070700005)(186003)(33656002)(6506007)(8936002)(66446008)(83380400001)(38100700002)(122000001)(9686003)(316002)(64756008)(66946007)(66476007)(66556008)(110136005)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tm91OVd5cERNY3BFdHFYN2tGNkt6VVNPSnl4eVdGMk5SYUNjaW1haDlWa3BU?=
 =?utf-8?B?TnRDOFYvK1VHQWU2KzU0R3hDM1dha2lzQmdvcmpwanByeWEyUDVSRUs0ME9E?=
 =?utf-8?B?aEtyZVVwSVhhUEFZZzNZMy96N2cxdkFoUXIrdDkzS29lQTRwazJhZk9FZXh6?=
 =?utf-8?B?SWRnRm9aSHBlQ3p5STQwQi85RHBqQ2REQ3A2ejM1R3BrUmV3em9iTkQxKy9j?=
 =?utf-8?B?QjNXSmhoNVR5RUxNYWdmbG5ieUFEbUIrS01CYTIvMUlibHVxYjdyNk5MenBW?=
 =?utf-8?B?SjJvNEo0R1M5Y2doQ01jaXY5UU1NRTJFQ1dhMTc2Y0RCSU9TbGFyQjlkNmJW?=
 =?utf-8?B?eWgwKzJyKzFMTXpNekQ1SnJLK2JmVjM5NTFHcThhWG16NDhrdk5aU25Eeks1?=
 =?utf-8?B?UGxtUVFGcEN1WFpocFkyRDJLVTJYenVIVXVabmFQMXRsUk9uVjZWb3Z6MGFP?=
 =?utf-8?B?YVYwekNjU2pSTkdaTDdiY0kwaXJiNWVsZk1velNYd0tTZzFLbndaYmgyM0hN?=
 =?utf-8?B?ZFJ3RkI3Tk9MYmFlSkI0ejlBSmdsZFZDRmtCMlJ1WXBYd3dOWDBrNm1Pclgx?=
 =?utf-8?B?Q25iMWJRUzFwcVUrS3FXTG93anB2akRKZjlwcU01TElqMGlPb0Y3LzhBVGNR?=
 =?utf-8?B?eStxYW5NWGZuQkI4OGc2UjJ3T3VWR0t1RnQ2U2x0NUlhblFuM2g3SDhLN0dE?=
 =?utf-8?B?Z09iT2Fwb1dwdFhWdTZjbnJYTzdqQjNaYnFyVzNadFk1OEZLRTEzSTFjQk5U?=
 =?utf-8?B?ajV1M2VnWDM2UWpjY3hhUVZXSGhDZklvSEo1Q1ZHTFRYMmtqK0t3RTNSblpv?=
 =?utf-8?B?SWJKd3ZzT0JUWlJyVXJtY1NYaDZVam44NzhwaXRmRitqUE0veVA2UFNYL1pK?=
 =?utf-8?B?VVcvTHlwNDVySWd1UEsrVUZuS21rL3RZcm5SRFpRVzYxUjM5M1FkVXFhZkdU?=
 =?utf-8?B?TFhwS1NTM0ZkUXV5U2NPNEVOazcxRTFDZzFzNjkyZFVJd2tkUGF1bTU4c3B6?=
 =?utf-8?B?dkNNbTZqWFlyWXdTOXFqQWVGelc2WC9RSFY3V1RYWlEwYmZ4WUNJWk1wcm5o?=
 =?utf-8?B?RFZIZ2NqNnh3RUlFK0QwSXR1bzk4YzdQeHRBSWJzVnR0QW82elVTZVVBaElk?=
 =?utf-8?B?ZGZZYUVvSWNzVG4xbk5sSnYxdEtTVmtuS2lqZ2FaejVHdlZ5MFIwUFZSSUxZ?=
 =?utf-8?B?Q1l3alVDS3YvaGNuQmJIaFVaVloyZVhDQWRoeVplcFEvb3ptb0dGOU5jK01G?=
 =?utf-8?B?ZmtzeUZJN0k4UHoyMFhEUm1nbTM1bUpUL0JMaTJ1Y1AwYVBTb2ZuQzVpejFN?=
 =?utf-8?B?NE1EaTNKdzJRQkFXQTFNa2ZiUW81dVhuTTNzOHdBcUxzUm9UeVh3R3FUUExF?=
 =?utf-8?B?dlBxR1pkQmNZclNOeDEzem1ybG00UllXN0FrLzIzZkdtSURubDh0ek15Rk5p?=
 =?utf-8?B?dEMyMkt6ZTVPdEc4VDJBbU1yWE1xcDVqNVBtQUxWMEpQUjZUWUJKTHV4WFBr?=
 =?utf-8?B?OEFQaG9qcmNLcG1mMWFCRkJvc1JUWWpNSW9sRldpazZ4eE1DZ2g0Vjh5WUdr?=
 =?utf-8?B?RllTTDQ0aklNdDA5SW0zNnh4ZWlVR1hDMURyV255dDFJMGg3MzFoejVQRUlI?=
 =?utf-8?B?VFZvYlljTkdDUG1vMmRKYU1GeVp6NkpGNHhDRTBjV1VEeS95OE5nQUw3dDB4?=
 =?utf-8?B?LzRrbCtZdW9LYmljcEFqRzJERTUxaFI1NmxBRkxVNFg4ZWd3dW1OMXlPNlNy?=
 =?utf-8?B?ZTNrWU53VkhzaTRGR0w4d09PdXRuYUdSOEtaKzR6L3l6R1NobzVkd2xvbFNE?=
 =?utf-8?B?OGVWNUNPTXRZY1g5eEpxeEgySCt3V0haQk1JN21KaktvUVc5Ry9JUWtoelky?=
 =?utf-8?B?cHRpK3hBQU1qdVB5L0lDS1FtMk1BTlJQWG5CaUFxZUpRVHRCOElPRXZmN1Uy?=
 =?utf-8?B?dklkdm5BUlk4KzFGeVJSM29QcTFtNmpRS0NVVkVPUlNWckZMM0pIZTd5alBi?=
 =?utf-8?B?NkNuTVA3Q1ovSGtNR0pUZ29DVG9jQ29iRHlEWDVwR1lIaTk0TUxQbHNZdkZX?=
 =?utf-8?B?dzk4YlVXd01Pdk1wMVJwd1k1eW5jU2ZhZndqdnkwWGMzeEFaRWJRNEVNMzhq?=
 =?utf-8?B?dDV5d2R2dzJscWtTOGNLNzV2LzB4Nnc3eEFGYzdPd3dCOEpxVUlGQWlab0hr?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1850.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c92f6f8d-08a6-451b-66d2-08d9dfbe4d46
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2022 04:51:08.1313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dOi5PO78rY60Aso8t2UqcH69ZeJ/R6oBRlMAqC294hZERYea9L76J85NL3Wca480XrSqym4S/ZU6HxMUKRjrng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4252
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAyNC4wMS4yMDIyIDE0OjE4LCBBa2hpbCBSINC/0LjRiNC10YI6DQo+ID4gQWRkIGRldmljZSB0
cmVlIG5vZGVzIGZvciBUZWdyYTIzNCBJMkMgY29udHJvbGxlcnMNCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEFraGlsIFIgPGFraGlscmFqZWV2QG52aWRpYS5jb20+DQo+ID4gLS0tDQo+ID4gIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMjM0LmR0c2kgfCAxMjENCj4gPiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMjEgaW5zZXJ0
aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbnZpZGlh
L3RlZ3JhMjM0LmR0c2kNCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMjM0
LmR0c2kNCj4gPiBpbmRleCA2YjZmMTU4MC4uYzY4NjgyNyAxMDA2NDQNCj4gPiAtLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL252aWRpYS90ZWdyYTIzNC5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9udmlkaWEvdGVncmEyMzQuZHRzaQ0KPiA+IEBAIC0xNDQsNiArMTQ0LDk2IEBA
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gICAg
ICAgICAgICAgICB9Ow0KPiA+DQo+ID4gKyAgICAgICAgICAgICBnZW4xX2kyYzogaTJjQDMxNjAw
MDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm52aWRpYSx0ZWdy
YTE5NC1pMmMiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgzMTYwMDAwIDB4
MTAwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDI1IElSUV9UWVBF
X0xFVkVMX0hJR0g+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBjbG9jay1mcmVxdWVuY3kg
PSA8NDAwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZicG1wIFRF
R1JBMjM0X0NMS19JMkMxDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYnBt
cCBURUdSQTIzNF9DTEtfUExMUF9PVVQwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgYXNz
aWduZWQtY2xvY2tzID0gPCZicG1wIFRFR1JBMjM0X0NMS19JMkMxPjsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmYnBtcCBURUdSQTIzNF9DTEtf
UExMUF9PVVQwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiZGl2
LWNsayIsICJwYXJlbnQiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JmJw
bXAgVEVHUkEyMzRfUkVTRVRfSTJDMT47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJlc2V0
LW5hbWVzID0gImkyYyI7DQo+ID4gKyAgICAgICAgICAgICB9Ow0KPiANCj4gVGhlIHBhdGNoc2V0
IGxvb2tzIG9rYXkgdG8gbWUsIHRoYW5rIHlvdS4gSSd2ZSBvbmUgcXVlc3Rpb246DQo+IA0KPiBD
b3VsZCB5b3UgcGxlYXNlIGV4cGxhaW4gd2h5IHRoZSAiUExMUCIgSTJDIHRpbWluZyBjb25maWd1
cmF0aW9uIHRoYXQgaXMNCj4gc3BlY2lmaWVkIGluIHRoZSAiZXhhbXBsZSIgc2VjdGlvbiBvZiBU
ZWdyYSBUUk0gaXNuJ3Qgc3VpdGFibGUgZm9yIFQxOTQvMjM0Pw0KPiBXaHkgSTJDIFRlZ3JhIGtl
cm5lbCBkcml2ZXIgdXNlcyBhIGRpZmZlcmVudCBjb25maWd1cmF0aW9uPw0KVGhlIHZhbHVlcyBp
biBUUk0gYXJlIGV4YW1wbGUgc2V0dGluZ3MuIFRoZSB2YWx1ZXMgaW4gZHJpdmVyIGFyZQ0KbW9y
ZSBwcmVjaXNlIHZhbHVlcyBiYXNlZCBvbiBjaGFyYWN0ZXJpemF0aW9uIHRlc3QgcmVzdWx0cy4N
Cg0KUmVnYXJkcywNCkFraGlsDQoNCg==
