Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2FC572FBE
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jul 2022 09:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235023AbiGMHyz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Jul 2022 03:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235091AbiGMHyY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Jul 2022 03:54:24 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DAFADF60D;
        Wed, 13 Jul 2022 00:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Llc2eWGCPUfrFVOGPXGVMvVSxHuGnw64MObIsGcfEaxm4ocbIuOl7caGZF6mkvtRCEPIy3fhu1N0z49LIxXszv7jKJrS266pzscCxLvEjVsoe4ZI32hOyqbIGfyzlDVZrQcO29e58P7g1ZQGKgY93VHLpSiebP09wAG9qGnLjHpu26q3m/oId52teDB8bafaJyH0E1Fw8bIOHk0SFDa2hk78P84qVG7VpeWWkFnTt8UUIGGbot4r50eiLvPWWo6CxqxA4V0xqenLloq4dxg3q9pRyg4Sh/BJ2orcowfZ1eu+CS0SdvpOVUHTSk4LfxF9G0s26PpwhO6chKs1B1vcnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RK3GbURRAPm4My38dxEmx6unBY10NtBxcgFZsMckxB0=;
 b=JkdtEQOHAbJBjJT9nVmqkN6pPXTrtWEneW3mR24LSt6x/yUMtw4+AR+b6IFKdCVf02ewyevPCGuuVcnGGaasedelJgyPi1+5DJhkD0X29WwwSrBmms/dLJKZE3L0IdUIZZc8WKLJIbsX1LKv+UQNRrSVRP0ENnypSRL7iP0BQooT2RKnAK+O3qzt7bi+KBWGH5iR2+87uvgh1xGf5Os06B4ND+4OHk4x0wBFyZDdQnrbMClwfEnz278g/fxtG80O9AmtbN2hGbFaOIdIJeVWHwo8qNcjvsvZKBRcBPMgIzSqDhF141QXLIoWaWQe2hx32q8GkMcdNRrI1c79813SaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RK3GbURRAPm4My38dxEmx6unBY10NtBxcgFZsMckxB0=;
 b=S8AYPpRIAyMGsbLTaVM03S2QV3Qet7xxYZc4PMNz1taQuySB0+qMMxWzRCzJPH9QMuh1FogeGwa8bU4FwrsJcfMsUl4+kNLtneprNOCYBS23WL/QfMmfLV4FPmbsMSMRxseQ0L5Xlg8BM+TruLPLaB+A8iFXbePzbDNBB/OXYDU=
Received: from DM6PR12MB3932.namprd12.prod.outlook.com (2603:10b6:5:1c1::24)
 by BN8PR12MB3060.namprd12.prod.outlook.com (2603:10b6:408:4a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Wed, 13 Jul
 2022 07:54:08 +0000
Received: from DM6PR12MB3932.namprd12.prod.outlook.com
 ([fe80::c065:99fe:41:cef1]) by DM6PR12MB3932.namprd12.prod.outlook.com
 ([fe80::c065:99fe:41:cef1%5]) with mapi id 15.20.5417.021; Wed, 13 Jul 2022
 07:54:07 +0000
From:   "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "Simek, Michal" <michal.simek@amd.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git (AMD-Xilinx)" <git@amd.com>
CC:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: RE: [PATCH 01/12] i2c: xiic: Add standard mode support for > 255 byte
 read transfers
Thread-Topic: [PATCH 01/12] i2c: xiic: Add standard mode support for > 255
 byte read transfers
Thread-Index: AQHYh8LCcJj/FXYlHUWO82C+NWZ/gq1mVS4AgA4Rg6A=
Date:   Wed, 13 Jul 2022 07:54:07 +0000
Message-ID: <DM6PR12MB39320029A79C437D067B88A48C899@DM6PR12MB3932.namprd12.prod.outlook.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
 <1656072327-13628-2-git-send-email-manikanta.guntupalli@xilinx.com>
 <9d90d39c-c5ce-409b-9b87-71592dcca1cc@nokia.com>
In-Reply-To: <9d90d39c-c5ce-409b-9b87-71592dcca1cc@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ed6c32e-cf86-433d-66a8-08da64a4dd74
x-ms-traffictypediagnostic: BN8PR12MB3060:EE_
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CHgDbuZqMCMOmedoQsSC4EBNtgVvhEmgX7aV+7ltCz3LkfHTolRAcgvnoJ1BpkczoTDEBzLkQrxuoz6xIXDudEyaspP3XwhtWSwbm/scxZoqgHigdLCPecg8Rrw69s9EfiUz3EfqpPxZL3QsiK49iEIq2sX17NH0f1vR3ddqepW+FYiGF0L2WCzkIwsU6kgt6fmkhoq4JA17kc4OcfNH0mhokvL4APSx3hj5rY91teOXnXLrT9dx7txRrScXIdPFlBGWIPIFPSO5AaiE22X9cNiCLAK/TdfL/KisZoHx4YbE5xt2GKwd9IokiJU/VXrA1awNG2/fzUiiUbGwb5B6p4J8SOSWNl9V3+WBYdgwwFW1yrI9eQ/zZCD5JfZpogVTA8mZ/NDuSxSK1uKpTvG6P9Fvu+MbELfUiUfWQUEpm4ASbbhCIoiHVibLpGR2OAOJ9Ua+s/1w4VUe69NAi8euRxUp6EGsM2fs8YFn3tcqwZ4cTbL65+qK8ZCkQxBrWyBjRkOuJ8qFXi/vaC+fUnUtsoMC3YBs1xAVC9U0nFScMzJ3jZESlorWgVesKiYeacn5bcrxZ+c8ODfhIRLFuc3QCtX7vgLCL/f5kgWhlWifi8/2T2Blot4azBS4T38AknfSk/ouIyjCaw/CZgGdmB6ZAjHPhHqC+ADSohP7IMK+n30LD7oL7ctSyqsqr+McFwFZd0IMPC5GkE23t6VWFw4QyOUyDpShBi2Kpp7NuCY4XdoPZpzwvZpeKohoo89onPNTkVDJTVJqARCGS07O+LK7cWhHG4i0CxfZr4J82oWBytLxrF6DQ58ZFIoUNZ9ZxgXKo3eTzsUjYhoDUlMDJbnXPBSO0UPcoIrBoWMc4liG/A0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3932.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(110136005)(71200400001)(83380400001)(76116006)(64756008)(66476007)(55016003)(66556008)(316002)(4326008)(186003)(66446008)(296002)(6636002)(122000001)(66946007)(38070700005)(8676002)(7696005)(6506007)(38100700002)(26005)(478600001)(41300700001)(86362001)(9686003)(2906002)(8936002)(5660300002)(33656002)(107886003)(52536014)(966005)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UCtzL1lCK0NkaUt5MkNxd0hNWjFDcEhWQkVuUHhKeDE1K0ZEWWdYZ1lnTnBl?=
 =?utf-8?B?NEh4SkExd0M0aTFTbWxxSjFhY3c2YWRQcDZkQlAwWjVnVldkT3RMOGJwVm8r?=
 =?utf-8?B?ZmdYamVqMmVZZWMya3R4aE9MR2ZuSW84K1c5cUovc3JsTjBjenFBRENDczc4?=
 =?utf-8?B?WlpDb3k2MkdzdlZUTm9vSWxqSlVwbWhjMlpzdlNsalhnQ3NkOFVwUXVpQnJi?=
 =?utf-8?B?WE1xRjk0OC96dVBFRitwMm01WHp4SUE0RTRMUUZnSWc3VVh4OHNPZkRyNXFI?=
 =?utf-8?B?M2tNL2RMUUNDN3kzWjdOWVZVQlZpeXlmd3NYMDZxS25lanNRUXdCdXBicTRn?=
 =?utf-8?B?aTZNbjAzc2sxYnRqL1VMWEgyOFA3RllqWHNUUmU2TlhGU29FQzh3Y1hWWEd6?=
 =?utf-8?B?NXdmek4wN3d3eVdpWkY3YTJwVkk5T0xiUDVqdXpOSElpUkh2Q1R0czdpWEdL?=
 =?utf-8?B?bHNLNWtYMitwbjRFS2lxZ3IzMzZwcjhvQlAxOUU3Y1ZmVUQ3YkZUK0lrT2NK?=
 =?utf-8?B?eDh5cWt3ejRvSk01UzhiL1BjT1VLZEJ1SGlJWEd1aG9CVHcrMWhjdCtFS01P?=
 =?utf-8?B?MlVrWVFQOXJ6dlRIWnl0ZlNrTFYxYlVIM3JGSWlkWEUrWDYxYm9QRFplSFVu?=
 =?utf-8?B?NGRWYVpjMEl0aU9ZTkdHNHE5bkZ3WjBBOStqWllFTEJvalhkU3JWMDBuWFhh?=
 =?utf-8?B?MENCR2ZsTU9hYTR3eVZhQUJEOWdMMDlTcHVZZ3pGTjQ1WmhtcC9lQ2ZLN3pa?=
 =?utf-8?B?bWtxazBpSFF5S2pLUlFHSmIrMzZwSzFseWdxZmR4RVduRGMyU2g5VVJNaTBR?=
 =?utf-8?B?enRLTXluS3NUZDdRSkplcDlkellmZXBRdlpXa2V1ZDRqN1pZeTZtZENPYjc3?=
 =?utf-8?B?eWtIZWlpOC9KZ3pRdytCM3cwM0oxSUYwL1RDTFJ0cnBmSFNDMUFIUGt5cFo2?=
 =?utf-8?B?Y2FTNVI4elZzbmgrYmJTVlFjTHMzU21xREJIRFFPZDdORnlRQ2VSR0t2NW5l?=
 =?utf-8?B?RUFTZ1NrendIdzNGZkVxVkhJRVp1Y2VFdVh4ZXE5L212NHNVb0g2VXB6UDZy?=
 =?utf-8?B?YVBzTi8vdnljc0VmZmZJRFJldzVCSk1aRXUyVjdSeFJuUFJiVm9XR2h5d3Z2?=
 =?utf-8?B?T0xZTGlNWlJMR281OTBNeDNnWlFTQXd0MFR2eDVmaXNYV1NVOG5mZmF5Z25L?=
 =?utf-8?B?RXdFTDh0clROSHVoNEtLY2lybzJlcURDN3BxdTJBMVBUamdYYnhOSkoxVWtS?=
 =?utf-8?B?clpieEpMZXd4N1k3blVQRVZLejJ4TFA4VENPbDY5dWt4TW9ZWklaZ2xVMllJ?=
 =?utf-8?B?bWN1Y3lOdktjNHNjajRJVmI1U3VrMkNvMDhVZFpVMmJMZEdWT3VYdkFJM3Bq?=
 =?utf-8?B?YUZmSGdPTGcxanRzcldUdCt2Uno1UXJUMVkwQ1o5S2V3NFdhcnJTUFpxSlNo?=
 =?utf-8?B?bWo3cDluRFF6L2VFU0JTMnlWQWpMZktkOU5tbFMySDRMa1E3cUk1UWdXUExX?=
 =?utf-8?B?SkNkaUJ6d3RaaGpUdE9BamVpRm1LL1JWNzN0RUlpRjdBK0dsQ3duNUttaVIx?=
 =?utf-8?B?M0VBZ0lPakEwZHJmUU13YmROYUZ4eHAxRUptTHZMRXUrOC93NWJPV3lZTjRU?=
 =?utf-8?B?UDFyY2RoVVFuWkxQallwSkdXYm9MRjF4S1Q1KzFCelZTeG9hKzI3dUVycWIx?=
 =?utf-8?B?SHp2V0o1bTRXdjUvN0ptZDhhVU44Y1JnVXBiY2krbWlMK01TSkprZFVrNnl6?=
 =?utf-8?B?VmMvWUdhdmgxUUgrMHJqTWdJNmFjeWliV3pZS1RMNTN2dzgvSU5wN1JlRGdX?=
 =?utf-8?B?VytLNEdSSUxLcGdHbDkwcFpTU0RDVnBUMkdFQzd5YlFQSWx2cXc5dW1TZFNm?=
 =?utf-8?B?eEE0VllnQUdHaHVJYy9VZHJiWVRCRWowdDMxbzJlQjZRcCs1MzFwbURoSFJ0?=
 =?utf-8?B?YU5DZWJaOEdEL1orWm1lMjZnMGhCQzdrYlBQc0lvRDJjVkYyWmt5NVpHQzNq?=
 =?utf-8?B?Sm4zdW15QUR5WkE0YVJ2a2lySlJ0ODJEVDlyUGx0aHh3UFFjU0xGTGhFQkFI?=
 =?utf-8?B?SUwybmpDR1p0bG1panB6d3JtQWhUNVk3dkRjWkRRTVB3QTBQYWF6cE5ZeGs5?=
 =?utf-8?Q?xb6A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3932.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed6c32e-cf86-433d-66a8-08da64a4dd74
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 07:54:07.8528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZJv0PluD5EpZG+KeOA2oyYhlfZI3Pk33HwYCqL4WazR+mo1JikbVqk7VUpjgQHpAjzTXqxfDssJ4iEpFeksZ0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3060
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEty
enlzenRvZiBBZGFtc2tpIDxrcnp5c3p0b2YuYWRhbXNraUBub2tpYS5jb20+DQo+IFNlbnQ6IFdl
ZG5lc2RheSwgSnVuZSAyOSwgMjAyMiA1OjQ5IFBNDQo+IFRvOiBNYW5pa2FudGEgR3VudHVwYWxs
aSA8bWFuaWthbnRhLmd1bnR1cGFsbGlAeGlsaW54LmNvbT47DQo+IG1pY2hhbC5zaW1la0B4aWxp
bnguY29tOyBTaW1laywgTWljaGFsIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT47IGxpbnV4LQ0KPiBh
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBnaXQgKEFNRC1YaWxpbngpIDxnaXRA
YW1kLmNvbT4NCj4gQ2M6IFJhdml0ZWphIE5hcmF5YW5hbSA8cmF2aXRlamEubmFyYXlhbmFtQHhp
bGlueC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDEvMTJdIGkyYzogeGlpYzogQWRkIHN0
YW5kYXJkIG1vZGUgc3VwcG9ydCBmb3IgPiAyNTUNCj4gYnl0ZSByZWFkIHRyYW5zZmVycw0KPiAN
Cj4gQ0FVVElPTjogVGhpcyBtZXNzYWdlIGhhcyBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwg
U291cmNlLiBQbGVhc2UgdXNlDQo+IHByb3BlciBqdWRnbWVudCBhbmQgY2F1dGlvbiB3aGVuIG9w
ZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvcg0KPiByZXNwb25kaW5nIHRvIHRo
aXMgZW1haWwuDQo+IA0KPiANCj4gVyBkbml1IDI0LjA2LjIwMjIgbyAxNDowNSwgTWFuaWthbnRh
IEd1bnR1cGFsbGkgcGlzemU6DQo+IFsuLi5dDQo+ID4gK3N0YXRpYyB2b2lkIHhpaWNfc3RkX2Zp
bGxfdHhfZmlmbyhzdHJ1Y3QgeGlpY19pMmMgKmkyYykgew0KPiA+ICsgICAgIHU4IGZpZm9fc3Bh
Y2UgPSB4aWljX3R4X2ZpZm9fc3BhY2UoaTJjKTsNCj4gPiArICAgICB1MTYgZGF0YSA9IDA7DQo+
ID4gKyAgICAgaW50IGxlbiA9IHhpaWNfdHhfc3BhY2UoaTJjKTsNCj4gPiArDQo+ID4gKyAgICAg
ZGV2X2RiZyhpMmMtPmFkYXAuZGV2LnBhcmVudCwgIiVzIGVudHJ5LCBsZW46ICVkLCBmaWZvIHNw
YWNlOiAlZFxuIiwNCj4gPiArICAgICAgICAgICAgIF9fZnVuY19fLCBsZW4sIGZpZm9fc3BhY2Up
Ow0KPiA+ICsNCj4gPiArICAgICBpZiAobGVuID4gZmlmb19zcGFjZSkNCj4gPiArICAgICAgICAg
ICAgIGxlbiA9IGZpZm9fc3BhY2U7DQo+ID4gKyAgICAgZWxzZSBpZiAobGVuICYmICEoaTJjLT5y
ZXBlYXRlZF9zdGFydCkpDQo+ID4gKyAgICAgICAgICAgICBsZW4tLTsNCj4gPiArDQo+ID4gKyAg
ICAgd2hpbGUgKGxlbi0tKSB7DQo+ID4gKyAgICAgICAgICAgICBkYXRhID0gaTJjLT50eF9tc2ct
PmJ1ZltpMmMtPnR4X3BvcysrXTsNCj4gPiArICAgICAgICAgICAgIHhpaWNfc2V0cmVnMTYoaTJj
LCBYSUlDX0RUUl9SRUdfT0ZGU0VULCBkYXRhKTsNCj4gPiArICAgICB9DQo+ID4gK30NCj4gVGhp
cyBmdW5jdGlvbiBsb29rcyB2ZXJ5IHNpbWlsYXIgdG8gdGhlIG9yaWdpbmFsIHhpaWNfZmlsbF90
eF9maWZvLiBUaGUgb25seQ0KPiBkaWZmZXJlbmNlIGlzIHRoYXQgaXQgZG9lcyBub3QgZGVjcmVh
c2UgdGhlIGxlbiBpbiBjYXNlIG9mIHJlcGVhdGVkX3N0YXJ0IChidHcsDQo+IHdoeT8pLCBhbmQg
aXQgZG9lcyBub3Qgc2V0IHRoZSBEWU5fU1RPUCBiaXQuIEJ1dCB0aGlzIGNvdWxkIGJlIGRvbmUN
Cj4gY29uZGl0aW9uYWxseSBiYXNlZCBvbiBpMmMtPmR5bmFtaWMsIGluc3RlYWQuIE5vIG5lZWQg
Zm9yIHRoaXMgZHVwbGljYXRpb24sIGluDQo+IG15IG9waW5pb24uDQoNCkFncmVlZCB3aXRoIHlv
dXIgY29tbWVudHMsIHdlIHdpbGwgZml4IGluIFYyLg0KDQo+IFsuLi5dDQo+ID4gQEAgLTU3OSwz
MSArNjgxLDk5IEBAIHN0YXRpYyBpbnQgeGlpY19idXN5KHN0cnVjdCB4aWljX2kyYyAqaTJjKQ0K
PiA+ICAgc3RhdGljIHZvaWQgeGlpY19zdGFydF9yZWN2KHN0cnVjdCB4aWljX2kyYyAqaTJjKQ0K
PiA+ICAgew0KPiA+ICAgICAgIHUxNiByeF93YXRlcm1hcms7DQo+ID4gKyAgICAgdTggY3IgPSAw
LCByZmRfc2V0ID0gMDsNCj4gPiAgICAgICBzdHJ1Y3QgaTJjX21zZyAqbXNnID0gaTJjLT5yeF9t
c2cgPSBpMmMtPnR4X21zZzsNCj4gPiArICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+DQo+
ID4gLSAgICAgLyogQ2xlYXIgYW5kIGVuYWJsZSBSeCBmdWxsIGludGVycnVwdC4gKi8NCj4gPiAt
ICAgICB4aWljX2lycV9jbHJfZW4oaTJjLCBYSUlDX0lOVFJfUlhfRlVMTF9NQVNLIHwNCj4gWElJ
Q19JTlRSX1RYX0VSUk9SX01BU0spOw0KPiA+ICsgICAgIGRldl9kYmcoaTJjLT5hZGFwLmRldi5w
YXJlbnQsICIlcyBlbnRyeSwgSVNSOiAweCV4LCBDUjogMHgleFxuIiwNCj4gPiArICAgICAgICAg
ICAgIF9fZnVuY19fLCB4aWljX2dldHJlZzMyKGkyYywgWElJQ19JSVNSX09GRlNFVCksDQo+ID4g
KyAgICAgICAgICAgICB4aWljX2dldHJlZzgoaTJjLCBYSUlDX0NSX1JFR19PRkZTRVQpKTsNCj4g
Pg0KPiA+IC0gICAgIC8qIHdlIHdhbnQgdG8gZ2V0IGFsbCBidXQgbGFzdCBieXRlLCBiZWNhdXNl
IHRoZSBUWF9FUlJPUiBJUlEgaXMgdXNlZA0KPiA+IC0gICAgICAqIHRvIGluaWRpY2F0ZSBlcnJv
ciBBQ0sgb24gdGhlIGFkZHJlc3MsIGFuZCBuZWdhdGl2ZSBhY2sgb24gdGhlIGxhc3QNCj4gPiAt
ICAgICAgKiByZWNlaXZlZCBieXRlLCBzbyB0byBub3QgbWl4IHRoZW0gcmVjZWl2ZSBhbGwgYnV0
IGxhc3QuDQo+ID4gLSAgICAgICogSW4gdGhlIGNhc2Ugd2hlcmUgdGhlcmUgaXMgb25seSBvbmUg
Ynl0ZSB0byByZWNlaXZlDQo+ID4gLSAgICAgICogd2UgY2FuIGNoZWNrIGlmIEVSUk9SIGFuZCBS
WCBmdWxsIGlzIHNldCBhdCB0aGUgc2FtZSB0aW1lDQo+ID4gLSAgICAgICovDQo+ID4gLSAgICAg
cnhfd2F0ZXJtYXJrID0gbXNnLT5sZW47DQo+ID4gLSAgICAgaWYgKHJ4X3dhdGVybWFyayA+IElJ
Q19SWF9GSUZPX0RFUFRIKQ0KPiA+IC0gICAgICAgICAgICAgcnhfd2F0ZXJtYXJrID0gSUlDX1JY
X0ZJRk9fREVQVEg7DQo+ID4gLSAgICAgeGlpY19zZXRyZWc4KGkyYywgWElJQ19SRkRfUkVHX09G
RlNFVCwgKHU4KShyeF93YXRlcm1hcmsgLSAxKSk7DQo+IA0KPiBEbyB3ZSByZWFsbHkgd2FudCB0
byB3cml0ZSAyNTUgdG8gUkZEIGlmIG1zZy0+bGVuID09IDA/IFRoYXQgd2lsbCBzZXQgdGhlDQo+
IGNvbXBhcmUgdmFsdWUgaW4gdGhlIFJYX0ZJRk9fUElSUSByZWdpc3RlciB0byBtYXggdmFsdWUg
KDE1KSBidXQgSSBkb24ndA0KPiB1bmRlcnN0YW5kIHdoeSB3ZSB3b3VsZCBsaWtlIHRvIGRvIHRo
aXMuDQo+IEFsc28sIGJpdHMgMzE6NCBhcmUgcmVzZXJ2ZWQgc28gSSB0aGluayB3ZSBzaG91bGQg
bm90IHRyeSB0byB0b3VjaCB0aGVtLg0KPiANCg0KSGVyZSBjb21wYXJpbmcgYW5kIHRha2luZyBt
aW5pbXVtIHZhbHVlIG9mIG1zZy0+bGVuIGFuZCAgSUlDX1JYX0ZJRk9fREVQVEguIFRoZSB2YWx1
ZSBvZiBJSUNfUlhfRklGT19ERVBUSCBpcyAxNiwgd2hpbGUgd3JpdGluZyBpbnRvIHJlZ2lzdGVy
IHBlcmZvcm1lZCAtMSwgc28gbWF4aW11bSB2YWx1ZSB3cml0aW5nIGludG8gUlhfRklGT19QSVJR
IGlzIDE1Lg0KDQo+ID4gKyAgICAgLyogRGlzYWJsZSBUeCBpbnRlcnJ1cHRzICovDQo+ID4gKyAg
ICAgeGlpY19pcnFfZGlzKGkyYywgWElJQ19JTlRSX1RYX0hBTEZfTUFTSyB8DQo+ID4gKyBYSUlD
X0lOVFJfVFhfRU1QVFlfTUFTSyk7DQo+ID4NCj4gPiAtICAgICBpZiAoIShtc2ctPmZsYWdzICYg
STJDX01fTk9TVEFSVCkpDQo+ID4gLSAgICAgICAgICAgICAvKiB3cml0ZSB0aGUgYWRkcmVzcyAq
Lw0KPiA+IC0gICAgICAgICAgICAgeGlpY19zZXRyZWcxNihpMmMsIFhJSUNfRFRSX1JFR19PRkZT
RVQsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGkyY184Yml0X2FkZHJfZnJvbV9tc2cobXNn
KSB8IFhJSUNfVFhfRFlOX1NUQVJUX01BU0spOw0KPiA+DQo+ID4gLSAgICAgeGlpY19pcnFfY2xy
X2VuKGkyYywgWElJQ19JTlRSX0JOQl9NQVNLKTsNCj4gPiArICAgICBpZiAoaTJjLT5keW5hbWlj
KSB7DQo+ID4gKyAgICAgICAgICAgICB1OCBieXRlczsNCj4gPiArICAgICAgICAgICAgIHUxNiB2
YWw7DQo+ID4NCj4gPiAtICAgICB4aWljX3NldHJlZzE2KGkyYywgWElJQ19EVFJfUkVHX09GRlNF
VCwNCj4gPiAtICAgICAgICAgICAgIG1zZy0+bGVuIHwgKChpMmMtPm5tc2dzID09IDEpID8gWElJ
Q19UWF9EWU5fU1RPUF9NQVNLIDogMCkpOw0KPiA+ICsgICAgICAgICAgICAgLyogQ2xlYXIgYW5k
IGVuYWJsZSBSeCBmdWxsIGludGVycnVwdC4gKi8NCj4gPiArICAgICAgICAgICAgIHhpaWNfaXJx
X2Nscl9lbihpMmMsIFhJSUNfSU5UUl9SWF9GVUxMX01BU0sgfA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFhJSUNfSU5UUl9UWF9FUlJPUl9NQVNLKTsNCj4gPiArDQo+ID4gKyAg
ICAgICAgICAgICAvKg0KPiA+ICsgICAgICAgICAgICAgICogV2Ugd2FudCB0byBnZXQgYWxsIGJ1
dCBsYXN0IGJ5dGUsIGJlY2F1c2UgdGhlIFRYX0VSUk9SIElSUQ0KPiA+ICsgICAgICAgICAgICAg
ICogaXMgdXNlZCB0byBpbmRpY2F0ZSBlcnJvciBBQ0sgb24gdGhlIGFkZHJlc3MsIGFuZA0KPiA+
ICsgICAgICAgICAgICAgICogbmVnYXRpdmUgYWNrIG9uIHRoZSBsYXN0IHJlY2VpdmVkIGJ5dGUs
IHNvIHRvIG5vdCBtaXgNCj4gPiArICAgICAgICAgICAgICAqIHRoZW0gcmVjZWl2ZSBhbGwgYnV0
IGxhc3QuDQo+ID4gKyAgICAgICAgICAgICAgKiBJbiB0aGUgY2FzZSB3aGVyZSB0aGVyZSBpcyBv
bmx5IG9uZSBieXRlIHRvIHJlY2VpdmUNCj4gPiArICAgICAgICAgICAgICAqIHdlIGNhbiBjaGVj
ayBpZiBFUlJPUiBhbmQgUlggZnVsbCBpcyBzZXQgYXQgdGhlIHNhbWUgdGltZQ0KPiA+ICsgICAg
ICAgICAgICAgICovDQo+ID4gKyAgICAgICAgICAgICByeF93YXRlcm1hcmsgPSBtc2ctPmxlbjsN
Cj4gPiArICAgICAgICAgICAgIGJ5dGVzID0gbWluX3QodTgsIHJ4X3dhdGVybWFyaywgSUlDX1JY
X0ZJRk9fREVQVEgpOw0KPiA+ICsgICAgICAgICAgICAgYnl0ZXMtLTsNCj4gQWdhaW4sIGRvIHdl
IHJlYWxseSB3YW50IHRvIHdyaXRlIDI1NSB0byBSRkQgaWYgbXNnLT5sZW4gPT0gMD8NCj4gDQoN
CkhlcmUgY29tcGFyaW5nIGFuZCB0YWtpbmcgbWluaW11bSB2YWx1ZSBvZiBtc2ctPmxlbiBhbmQg
IElJQ19SWF9GSUZPX0RFUFRILiBUaGUgdmFsdWUgb2YgSUlDX1JYX0ZJRk9fREVQVEggaXMgMTYs
IGJlZm9yZSB3cml0aW5nIGludG8gcmVnaXN0ZXIgcGVyZm9ybWVkIGRlY3JlbWVudCwgc28gbWF4
aW11bSB2YWx1ZSB3cml0aW5nIGludG8gUlhfRklGT19QSVJRIGlzIDE1Lg0KDQo+ID4gKw0KPiA+
ICsgICAgICAgICAgICAgeGlpY19zZXRyZWc4KGkyYywgWElJQ19SRkRfUkVHX09GRlNFVCwgYnl0
ZXMpOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgIGxvY2FsX2lycV9zYXZlKGZsYWdzKTsNCj4g
PiArICAgICAgICAgICAgIGlmICghKG1zZy0+ZmxhZ3MgJiBJMkNfTV9OT1NUQVJUKSkNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgLyogd3JpdGUgdGhlIGFkZHJlc3MgKi8NCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgeGlpY19zZXRyZWcxNihpMmMsIFhJSUNfRFRSX1JFR19PRkZTRVQsDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaTJjXzhiaXRfYWRkcl9mcm9t
X21zZyhtc2cpIHwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBYSUlD
X1RYX0RZTl9TVEFSVF9NQVNLKTsNCj4gV2hlbiByZXZpZXdpbmcgdGhpcyBwYXRjaCwgSSB0cmll
ZCB0byB1bmRlcnN0YW5kIGhvdyB0aGUgY29udHJvbGxlciBrbm93cyBpZg0KPiBpdCBzaG91bGQg
d29yayBpbiBkeW5hbWljIG9yIGluIHN0YW5hcmQgbW9kZS4NCg0KRm9yIHJlY2VpdmUgb3BlcmF0
aW9uIHdpdGggYnl0ZSBjb3VudCBncmVhdGVyIHRoYW4gMjU1LCB3ZSB3aWxsIHN3aXRjaCB0byBz
dGFuZGFyZCBtb2RlIGVsc2UgYWx3YXlzIGluIHRoZSBkeW5hbWljIG1vZGUgb25seS4gDQoNCj4g
TXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGluDQo+IG9yZGVyIHRvIHN0YXJ0IHRoZSBkeW5hbWlj
IG1vZGUgbG9naWMsIHdlIGhhdmUgdG8gc2V0IHRoZSBEWU5fU1RBUlQgYml0IGluDQo+IHRoZSBU
WCBGSUZPIHdoZW4gd2Ugd3JpdGUgYW4gYWRkcmVzcyB0aGVyZS4gSXMgdGhpcyBjb3JyZWN0Pw0K
DQpBZnRlciBkZWNpZGluZyBkeW5hbWljIG1vZGUgYmFzZWQgb24gYWJvdmUgbG9naWMsIHdlIG5l
ZWQgdG8gIHNldCB0aGUgRFlOX1NUQVJUIGJpdCBhbG9uZyB3aXRoIGFkZHJlc3MgaW4gdGhlIFRY
IEZJRk8gdG8gc3RhcnQgdGhlIHRyYW5zZmVyLiANCg0KPiBCdXQgd2UgZG9uJ3QgZG8NCj4gdGhh
dCBpZiBJMkNfTV9OT1NUQVJUIGZsYWcgaXMgc2V0IHNvIGhvdyBpcyB0aGlzIHN1cHBvc2VkIHRv
IHdvcmsgd2l0aCB0aGlzDQo+IGZsYWc/IEkgbWVhbiwgZG9lcyB0aGUgY29udHJvbGxlciByZWFs
bHkgc3VwcG9ydHMgZG9pbmcgSTJDX01fTk9TVEFSVCBpbg0KPiBkeW5hbWljIG1vZGU/IA0KPg0K
DQpJMkMgY29udHJvbGxlciBzdXBwb3J0cyBJMkNfTV9OT1NUQVJUIGluIGR5bmFtaWMgbW9kZS4N
Cg0KPk9yIGRvZXMgaXQgc3VwcG9ydCBpdCBhdCBhbGw/IEFmdGVyIGFsbCwgd2hlbiB3ZSBza2lw
IHRoaXMsIHdlIHdpbGwgc3RpbGwgd3JpdGUgdG8NCj4gdGhlIFRYX0ZJRk8gcmVnaXN0ZXIgNSBs
aW5lcyBiZWxvdy4gSG93IGlzIHRoZSBjb250cm9sbGVyIHN1cHBvc2VkIHRvIGtub3cNCj4gdGhh
dCB0aGUgbGVuIHRoYXQgd2Ugd3JpdGUgdGhlcmUgaXMgKm5vdCogYWN0dWFsbHkgYW4gYWRkcmVz
cz8NCj4gDQoNCkJlbG93IG5vdGVzIG1lbnRpb25lZCBpbiBJMkNfTV9OT1NUQVJUIHNlY3Rpb24g
b2Yga2VybmVsIGRvY3VtZW50YXRpb24obGluayBtZW50aW9uZWQgYmVsb3cpLA0KIiBJZiB5b3Ug
c2V0IHRoZSBJMkNfTV9OT1NUQVJUIHZhcmlhYmxlIGZvciB0aGUgZmlyc3QgcGFydGlhbCBtZXNz
YWdlLA0KICAgd2UgZG8gbm90IGdlbmVyYXRlIEFkZHIsIGJ1dCB3ZSBkbyBnZW5lcmF0ZSB0aGUg
c3RhcnRiaXQgUy4gVGhpcyB3aWxsDQogICBwcm9iYWJseSBjb25mdXNlIGFsbCBvdGhlciBjbGll
bnRzIG9uIHlvdXIgYnVzLCBzbyBkb24ndCB0cnkgdGhpcy4iDQogDQpodHRwczovL3d3dy5rZXJu
ZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9uL2kyYy9pMmMtcHJvdG9jb2wNCg0KU28gSTJDX01fTk9T
VEFSVCAgZmxhZyBuZWVkIHRvIHVzZSBpbiBzZWNvbmQgaTJjX21zZyBvciBpbiBsYXRlciBpMmNf
bXNncywgYnV0IG5vdCBpbiBmaXJzdCBpMmNfbXNnLiBEdXJpbmcgZmlyc3QgaTJjX21zZyBkeW5h
bWljIG1vZGUgc3RhcnRzLCBzbyBhZ2FpbiBubyBuZWVkIHRvIHNldCBzdGFydCBiaXQgVFhfRklG
Ty4NCg0KPiBUaGF0IGJlaW5nIHNhaWQsIHdlIGRvIG5vdCBhbm5vdWNlIHRoZSBJMkNfRlVOQ19O
T1NUQVJUIHN1cHBvcnQgc28NCj4gbWF5YmUgd2Ugc2hvdWxkIG5vdCBjYXJlIGF0IGFsbCBhbmQg
anVzdCByZW1vdmUgdGhlIGNvZGUgaGFuZGxpbmcgdGhlDQo+IEkyQ19NX05PU1RBUlQgZmxhZz8N
Cg0KU2luY2UgaXQgc3VwcG9ydHMgSTJDX01fTk9TVEFSVCBmbGFnLCBuZWVkIHRvIGtlZXAgY29k
ZSBoYW5kbGluZyBmbGFnLg0KDQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgeGlpY19pcnFfY2xy
X2VuKGkyYywgWElJQ19JTlRSX0JOQl9NQVNLKTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAv
KiBJZiBsYXN0IG1lc3NhZ2UsIGluY2x1ZGUgZHluYW1pYyBzdG9wIGJpdCB3aXRoIGxlbmd0aCAq
Lw0KPiA+ICsgICAgICAgICAgICAgdmFsID0gKGkyYy0+bm1zZ3MgPT0gMSkgPyBYSUlDX1RYX0RZ
Tl9TVE9QX01BU0sgOiAwOw0KPiA+ICsgICAgICAgICAgICAgdmFsIHw9IG1zZy0+bGVuOw0KPiA+
ICsNCj4gPiArICAgICAgICAgICAgIHhpaWNfc2V0cmVnMTYoaTJjLCBYSUlDX0RUUl9SRUdfT0ZG
U0VULCB2YWwpOw0KPiA+ICsgICAgICAgICAgICAgbG9jYWxfaXJxX3Jlc3RvcmUoZmxhZ3MpOw0K
PiA+ICsgICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgICAgICBjciA9IHhpaWNfZ2V0cmVnOChp
MmMsIFhJSUNfQ1JfUkVHX09GRlNFVCk7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgLyogU2V0
IFJlY2VpdmUgZmlmbyBkZXB0aCAqLw0KPiA+ICsgICAgICAgICAgICAgcnhfd2F0ZXJtYXJrID0g
bXNnLT5sZW47DQo+ID4gKyAgICAgICAgICAgICBpZiAocnhfd2F0ZXJtYXJrID4gSUlDX1JYX0ZJ
Rk9fREVQVEgpIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmZkX3NldCA9IElJQ19SWF9G
SUZPX0RFUFRIIC0gMTsNCj4gPiArICAgICAgICAgICAgIH0gZWxzZSBpZiAoKHJ4X3dhdGVybWFy
ayA9PSAxKSB8fCAocnhfd2F0ZXJtYXJrID09IDApKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIHJmZF9zZXQgPSByeF93YXRlcm1hcmsgLSAxOw0KPiBBZ2FpbiwgZG8gd2UgcmVhbGx5IHdh
bnQgdG8gd3JpdGUgMjU1IHRvIFJGRCBpZiBtc2ctPmxlbiA9PSAwPw0KDQpIZXJlIGNvbXBhcmlu
ZyBhbmQgdGFraW5nIG1pbmltdW0gdmFsdWUgb2YgbXNnLT5sZW4gYW5kICBJSUNfUlhfRklGT19E
RVBUSC4gVGhlIHZhbHVlIG9mIElJQ19SWF9GSUZPX0RFUFRIIGlzIDE2LCBiZWZvcmUgd3JpdGlu
ZyBpbnRvIHJlZ2lzdGVyIHBlcmZvcm1lZCAtMSwgc28gbWF4aW11bSB2YWx1ZSB3cml0aW5nIGlu
dG8gUlhfRklGT19QSVJRIGlzIDE1Lg0KDQo+IFsuLi5dDQo+IA0KPiBLcnp5c3p0b2YNCg0KVGhh
bmtzLA0KTWFuaWthbnRhLg0K
