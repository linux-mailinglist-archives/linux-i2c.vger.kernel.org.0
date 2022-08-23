Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 058CD59D061
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 07:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238821AbiHWFRX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Aug 2022 01:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbiHWFRW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Aug 2022 01:17:22 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A27254B490;
        Mon, 22 Aug 2022 22:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcSNso62icO8C7UqEg6lGJvVVGElhL5GVr2rICXFSHJYyIfOdaRA3aOnPmggbvK8ZyvCC3tRoINK7nUG/J/o8BUNWfFvHObJh69iMaBgYbaOQcsfxN/rOh0xOeQlsBAn7KgPUx19aQkM+tJJpD/9pbLtnB9XjqtAguxQK0QCxHHZJDMSg/bj8bgdaElVgmhMbCUJf9zDBrby1rqWA4OuP8EsGha1Y0T1g7OVE/hK+b18++Ms4K2iN0rfGbQavjP03T5tXJ+LPgBLaatnS62bpNA+ap2ghAOli37gu1lh/Rq4zKjLjPykDXyNsmhDIo5gCAb/sCT6rIcOcXD6k482MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDPW41xL5fcs/BJkWL3slzH0triIJ6QhjbUj8MSybIU=;
 b=G9HlEPhHvYWOTxomuV4pWxDdzJA+3COQjD8NAI0km46rULgVSU69zjw4kXaYtL2vGS3/sBnejZ09OaOnHkU6qglerRQyLfu3oO3VSTSmfk84Q3NexkbdpCEtmgXwBFbVVRUTFDC1ZUFFQg18kBw5VFcTJQI+qkNQ2VLPw8GscDJhGJussd1OzSYH/9QO8AoyGSQg4Xfi1V5LyQ7RsO3jsmr5Gc2C14GD4M4BqsGLpcQPMBZlO4OfrgXw+LjZqpU3tVm8K/mbjb5WRhdF4Oqdbzbi7/TfRAFkUwkQT1NRAtSO9ThcRiwrKgaitaEpBDIWzXonzh1AhnlhJR+CQPS8AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDPW41xL5fcs/BJkWL3slzH0triIJ6QhjbUj8MSybIU=;
 b=JcLBR9ksHAA/zFUCWqLAGC7DDfdz6OUanrVNyWRsy8xWDVEa7/9Z482P0rAWXauhXeTyUNuYy/+K761MF9ddNuigBurnIhuxCDbYTsSqIdfppM8mtj6Rq0vPKjIvcslxxYUFaX3Vg1ejUDAEYkHhr+crLAHNdTQ9NOxYSb2lV+hgH58gWeITikdtbD7grrUDJOjHjOQP6WZVcLh6+vzfFwfFXPXtS2gZs++247xnGSLZsvtREZYT4f8stSVT5/6zG7NSCH3lsf1HGxvk+wCElkIILfZvSuP9V7NRd9Q+bTosKFQj8HbTq9/tm7dkOT/ZKiIL/+rsu+sAyvJPnF0P1w==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by PH8PR12MB7157.namprd12.prod.outlook.com (2603:10b6:510:22b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 05:17:17 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::24cb:46cd:5176:aa13]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::24cb:46cd:5176:aa13%9]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 05:17:17 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: RE: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Thread-Topic: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Thread-Index: AQHYs8aKp+OlLQycOkO470/UfA2RzK22VXAAgAADTwCABBngUIAAPbIAgAAHnMCAAK1egIAACdIAgAB/C4A=
Date:   Tue, 23 Aug 2022 05:17:17 +0000
Message-ID: <SJ1PR12MB63397BBD4EF314A742680F2CC0709@SJ1PR12MB6339.namprd12.prod.outlook.com>
References: <20220819122313.40445-1-akhilrajeev@nvidia.com>
 <20220819122313.40445-2-akhilrajeev@nvidia.com>
 <20281ca7-e597-7030-4861-5f9a3594726d@gmail.com>
 <89a746fd-a98e-3147-7811-33c5051c2b6d@gmail.com>
 <SJ1PR12MB6339FC1F82EB1BB7417E533BC0719@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <ebb0764f-db92-d69d-49ac-151f4e3e0b8a@collabora.com>
 <SJ1PR12MB63396DC508F63807F1CE9901C0719@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <fac10841-1682-845f-3e4a-5668f59caed0@gmail.com>
 <cd0374f1-2c05-7e61-7187-cfc9c42edf63@gmail.com>
In-Reply-To: <cd0374f1-2c05-7e61-7187-cfc9c42edf63@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ecb40bf-80bb-4d3e-d44d-08da84c6bf60
x-ms-traffictypediagnostic: PH8PR12MB7157:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fJONsaJiGZI62dbDdgJl6+bUVmIq/yY47LqvXp6Z8naX8V+2x6zHAKg0eGRwjCb264DZxfBUXLvstjfinIgp90TDPn0b1gZtSGKySNIVnc3Z2fKwuBBQJYiDGdHOy8vfiyEccTLUheEVtTejQeJupTu0sXS1X9sjfBnF4xtOJi1frgKXbhl3Em11G3zAFFjpRNHB9ewqbACqalFOzEbdBZ/z8aY4HWdqtvLPM7DKk/W+Atn6kelzrDk1xriY/ZJ1rMKuErUtcQ5qaSEPaoPWwWr2VaWiX07VJRhBQmpq1KcUN0r8vGI+L8McXEv+IW3LpAtlEjDFVgREcBtu77AQGm5EqzuOIF2mtmG4JmPHGDdPqNvkT2w60YLccCpf72HufOPT41kAG8iBPFlnsrKYzHowQ+BuK7W/9ZYDJaDnyWjnw2a0ZYmJ5Cr46geeIutKFzpmg+WSUh3DALFWR5Bu6vwx8NOpbq7/6IBpZEqHOh6QghvwQoc+Pp1raXFOyyITMzWy5jbSDHW1QY5EwCn2CuxOdrytzmZcA9UvYONxl+6BZ4OfiUiJ6lepF9H0ZzC7o/hPLsi8YysKHbhug9wfDzQfJIw+z01HVbVkeje5b+a4pmZIgrRUa6BP6+4E+D1oTwjPSzpIK5I0c6Ft+/G4Y6qoufZs5DBAWL3L1hk6zR1iH0D8P6igLENLPUY+UKIP+eqIBphbQkH8oyOuvAZj8cEOrasohS2gf3/hVOgaToybJ6FuHIdOXbhWrGIxsj3LKzFUkvZDSj52z4tw5Za0/D9bQZwoMBa2BJwGQXrLyjW8mduwGVd3KVYdSDoUycam14XtXfd4bILnDdzWe2RV+g8S+XV2NWG6WdFEP2mNULNBdU64u+Csl8JnRp0uRREL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6339.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(9686003)(6506007)(38100700002)(33656002)(86362001)(2906002)(186003)(7696005)(53546011)(26005)(122000001)(38070700005)(83380400001)(41300700001)(55016003)(7416002)(76116006)(8936002)(52536014)(71200400001)(66946007)(8676002)(66476007)(64756008)(478600001)(66446008)(966005)(66556008)(110136005)(5660300002)(921005)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWluQ0xLYzBjYzZ3YTRZek1zWFllbCtEdFBXWFFvWXF3UHZwcVNuWm5CMTFC?=
 =?utf-8?B?K0hjZVR5TjBjU0tNMkw2ZDJKMU9UMi9XQlRFZzNBenlibENyODVhQitkYlFB?=
 =?utf-8?B?UkRvaGxxNElnMmRTSXJBbzhXWFVsMzR1Zng1clVPSFJieUVOMC9rUjZQd0VY?=
 =?utf-8?B?Wk1BM2kycXE5ZG9rMkVlaVRZbzJkeWFGbmNsY2NFc1FGbnRXc2hOeHBKdUM5?=
 =?utf-8?B?dm1WNFRKS09BOTZhdkZhVlpUOGE2Wk5KcEFpTnlxYytFQzl5b0pmVzhLWndt?=
 =?utf-8?B?L05HVng5SkpGTkhiSGd6QWlOU3VNb1dIeWlIU3NKVm5WU1VDZ1VqRWY3M0dR?=
 =?utf-8?B?SHJYMHBxd0F0akswN0dubHRtZnlzenp4czhtL3Y3Mnp3aWRJbnF0T1hrY3Jq?=
 =?utf-8?B?ZHRNL2M2cnJsV0VLMmk4d2RNeGdXVjZQZjQ4VnNqeHBGK01abjZMbDB6V0h4?=
 =?utf-8?B?dDdMekxFOFdXOUdGYjdjRWNVZnZHTFpRWG5LS3ZJVlBnckRydzF3U0FPUDdi?=
 =?utf-8?B?ZzEyRUczOGcxb2t6RjNpWC9zdmNDOGN6OXJJeGFsMmh3R2ZqeVArWVNHUWZa?=
 =?utf-8?B?ZURlTFFUQm80WEwyNnVjQ0prNkxnWngxWHVrY0FEOHVlVi9IVXR0ZDZWRWNW?=
 =?utf-8?B?Rkg4bkM1U3ZNalVOSzZpMWthK2pmMW81NGo5NEk3ZHEwMlNMT2lDd1c0U3dk?=
 =?utf-8?B?U3pNR3RaaEdXd3BWbE5XR3UzT25Eb2h2TVUzeWR3a0xENG1DMjNEMlBzbTcz?=
 =?utf-8?B?R2pWNmVqSGNIM3Z1ZFBTYnBPRnVxNFc4Q1hCNGZxMGpaSnhiaTFTd3oxNktM?=
 =?utf-8?B?RkpQc0t0ajl0VDhtMnBMU0JBbDZSa0JNSlJ5ZFBmMk9ONXlhbzQ2Nmlsa05X?=
 =?utf-8?B?N3VmV1hJTklUaThJSGxmeGhFKzJIajNjZ2hKS2N2NE5EeVFBTDh1emlUVHll?=
 =?utf-8?B?TE5XaXlRd0E4ZDZFb2p6dzJrOGRwZTlBYm9qSldIaG95UGl6NUxvV2NjZy81?=
 =?utf-8?B?V3N6cHlxSUJ0SENoeWI4ZnBKS0lHV1NDclJ3RVJoVlhmNUNWNDN3bEx1U2hY?=
 =?utf-8?B?bVJldllpT1ArdFk0NGRXRk5HdEJReGRqZjBGcGkzWktxZXJnbm54Uk1pQUQ4?=
 =?utf-8?B?VXpBRkd0V1NiKy9GUDUvUXNwdWt4ZUIzL1JyOTVrcWFOemRVcnpDRy9FYTht?=
 =?utf-8?B?MGk5ZktiQjFWWjBPQ0UwVTBsTUdrU1RWWElTazExcEIzSXJrZlNacHU4b2xV?=
 =?utf-8?B?bktWaU9UVVRVTDV5djVwRXZvRVR1S05aWVViWXduL0ZKb29EZHBjU2FlOWZE?=
 =?utf-8?B?MDV0dStwbHIwbzlmcTllRnM0QUl3bStrdlZLR3R1QnUrZW1yU1NvQnNWcFBN?=
 =?utf-8?B?dEVESDYxNUxvRGFIRUJvZ0VvK1Nrb1lUTVY0MDZqNTZYbEo2L3Fvdnc5VFQ1?=
 =?utf-8?B?VXJwaldRSlUvWUpIQVdaVzRaV20wZXErYldhNXU2UFRFWkpOeG5UNFIxS1lC?=
 =?utf-8?B?TGs4Q2ZocVdKZE5WdG9Ka2tyWlYwRjgycGVBWWRVakN6bjRyOTlUcWRibGZi?=
 =?utf-8?B?R3ljRzY2YjNMTSsxVSt4NUZlVEMxeG9idVVQbGFyQnlyQnRZZkhFRWJNaG8w?=
 =?utf-8?B?N28zaWduekNXdXdRdGZkbVhHNGpyNXVrZHEvK3JWaDlFL3c1SGF5Rzlsb00r?=
 =?utf-8?B?ckNuVXJ1VXJCR1BqR09XYkFkYUo0TkErSGIvYUJxR0FwbjVuendXNkMvTURZ?=
 =?utf-8?B?cGxGNHFZZ2JFeHpMSjJtWVk1QkNxVVdFNVlyQ0FMeTNoVk5zTkNBZlZhTVpj?=
 =?utf-8?B?amxoY1RCTWdtTGtDQjBRaFp4dTdKUnY2Zlc5ZTNNVWVrL3E0WUZxaG13Mnk1?=
 =?utf-8?B?ejgyTjY2UEhzN2lXd3crTUU3ZmplK1QvVXl1VEpKQythaC8zcmFEajE2dUF0?=
 =?utf-8?B?RnViQWpXUjNyVjUzTHRTc2Fwa2tyc0hIMnJVaEZFYVJlY1BkNDhCaVhoUzNq?=
 =?utf-8?B?TFJicnFsZnFJM3AxaDIxKzV3akp6VjZJK1E1UlRwTmJMb00wZkFZOWIrQ1pa?=
 =?utf-8?B?RGdJZ1Y1ZmdyQlVPV0V5OVl1UW92bUp2aW5EMUNydlBNWGVzNWsxeTBBalQr?=
 =?utf-8?Q?Cr80/anbPFj75iUedJkWJkW7w?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecb40bf-80bb-4d3e-d44d-08da84c6bf60
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 05:17:17.5219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jDXzVIRPOBzyByIF26Td+/1/L4P3ZoYLtao7wdROcF3ApXlDdZLPg+SFNNC9KFXpOcDSYMvKsRqWfTWO/44crw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7157
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAyMi4wOC4yMDIyIDIzOjMzLCBEbWl0cnkgT3NpcGVua28g0L/QuNGI0LXRgjoNCj4gPiAyMi4w
OC4yMDIyIDEzOjI5LCBBa2hpbCBSINC/0LjRiNC10YI6DQo+ID4+PiBPbiA4LzIyLzIyIDA5OjU2
LCBBa2hpbCBSIHdyb3RlOg0KPiA+Pj4+PiAxOS4wOC4yMDIyIDE4OjE1LCBEbWl0cnkgT3NpcGVu
a28g0L/QuNGI0LXRgjoNCj4gPj4+Pj4+IDE5LjA4LjIwMjIgMTU6MjMsIEFraGlsIFIg0L/QuNGI
0LXRgjoNCj4gPj4+Pj4+PiAgICAgIGlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShucCwgIm52
aWRpYSx0ZWdyYTIxMC1pMmMtdmkiKSkNCj4gPj4+Pj4+PiAgICAgICAgICAgICAgaTJjX2Rldi0+
aXNfdmkgPSB0cnVlOw0KPiA+Pj4+Pj4+ICsgICAgZWxzZQ0KPiA+Pj4+Pj4+ICsgICAgICAgICAg
ICBpMmNfZGV2LT5kbWFfc3VwcG9ydCA9ICEhKG9mX2ZpbmRfcHJvcGVydHkobnAsICJkbWFzIiwN
Cj4gPj4+Pj4+PiArIE5VTEwpKTsNCj4gPj4+Pj4+DQo+ID4+Pj4+PiAxLiBZb3UgbGVhayB0aGUg
bnAgcmV0dXJuZWQgYnkgb2ZfZmluZF9wcm9wZXJ0eSgpLg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IDIu
IFRoZXJlIGlzIGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woKSBmb3IgdGhpcyBraW5kIG9mDQo+
ID4+Pj4+PiBwcm9wZXJ0eS1leGlzdHMgY2hlY2tzLg0KPiA+Pj4+IE9rYXkuIEkgd2VudCBieSB0
aGUgaW1wbGVtZW50YXRpb24gaW4gb2ZfZG1hX3JlcXVlc3Rfc2xhdmVfY2hhbm5lbCgpIHRvDQo+
ID4+Pj4gY2hlY2sgJ2RtYXMnLg0KPiA+Pj4+DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gMy4gSWYgImRt
YXMiIGlzIG1pc3NpbmcgaW4gRFQsIHRoZW4gZG1hX3JlcXVlc3RfY2hhbigpIHNob3VsZCByZXR1
cm4NCj4gPj4+Pj4+IE5VTEwgYW5kIGV2ZXJ5dGhpbmcgd2lsbCB3b3JrIGZpbmUuIEkgc3VwcG9z
ZSB5b3UgaGF2ZW4ndCB0cmllZCB0bw0KPiA+Pj4+Pj4gdGVzdCB0aGlzIGNvZGUuDQo+ID4+Pj4+
DQo+ID4+Pj4+IEFsdGhvdWdoLCBuby4gSXQgc2hvdWxkIHJldHVybiBFUlJfUFRSKC1FTk9ERVYp
IGFuZCB0aGVuIHlvdSBzaG91bGQNCj4gY2hlY2sNCj4gPj4+Pj4gdGhlIHJldHVybiBjb2RlLg0K
PiA+Pj4+IFllcy4gQWdyZWUgdGhhdCBpdCBpcyBtb3JlIGFnbm9zdGljIHRvIGNoZWNrIGZvciBF
UlJfUFRSKC1FTk9ERVYpLiBCdXQNCj4gc2luY2UgSQ0KPiA+Pj4+IGNhbGwgdGVncmFfaW5pdF9k
bWEoKSBmb3IgZXZlcnkgbGFyZ2UgdHJhbnNmZXIgdW50aWwgRE1BIGlzIGluaXRpYWxpemVkLA0K
PiB3b3VsZG4ndA0KPiA+Pj4+IGl0IGJlIGJldHRlciB0byBoYXZlIGEgZmxhZyBpbnNpZGUgdGhl
IGRyaXZlciBzbyB0aGF0IHdlIGRvIG5vdCBoYXZlIHRvIGdvDQo+ID4+PiB0aHJvdWdoDQo+ID4+
Pj4gc28gbWFueSBmdW5jdGlvbnMgZm9yIGV2ZXJ5IGF0dGVtcHRlZCBETUEgdHJhbnNhY3Rpb24g
dG8gZmluZCBvdXQgdGhhdA0KPiB0aGUNCj4gPj4+IERUDQo+ID4+Pj4gcHJvcGVydGllcyBkb24n
dCBleGlzdD8NCj4gPj4+Pg0KPiA+Pj4+IFNoYWxsIEkganVzdCBwdXQgaTJjX2Rldi0+ZG1hX3N1
cHBvcnQgPSB0cnVlIGhlcmUgc2luY2UgRE1BIGlzIHN1cHBvcnRlZA0KPiBieQ0KPiA+Pj4+IGhh
cmR3YXJlPyBJdCB3b3VsZCB0dXJuIGZhbHNlIGlmIGRtYV9yZXF1ZXN0X2NoYW4oKSByZXR1cm5z
IHNvbWV0aGluZw0KPiBvdGhlcg0KPiA+Pj4+IHRoYW4gLUVQUk9CRV9ERUZFUi4NCj4gPj4+Pg0K
PiA+Pj4+ICAgICAgIGlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShucCwgIm52aWRpYSx0ZWdy
YTIxMC1pMmMtdmkiKSkNCj4gPj4+PiAgICAgICAgICAgICAgIGkyY19kZXYtPmlzX3ZpID0gdHJ1
ZTsNCj4gPj4+PiAgKyAgICBlbHNlDQo+ID4+Pj4gICsgICAgICAgICAgICBpMmNfZGV2LT5kbWFf
c3VwcG9ydCA9IHRydWU7DQo+ID4+Pg0KPiA+Pj4gVGhlIGNvZGUgYWxyZWFkeSBoYXMgZG1hX21v
ZGUgZm9yIHRoYXQuIEkgZG9uJ3Qgc2VlIHdoeSBhbm90aGVyIHZhcmlhYmxlDQo+ID4+PiBpcyBu
ZWVkZWQuDQo+ID4+Pg0KPiA+Pj4gRWl0aGVyIGFkZCBuZXcgZ2VuZXJpYyBkbWFfcmVxdWVzdF9j
aGFuX29wdGlvbmFsKCkgdGhhdCB3aWxsIHJldHVybiBOVUxMDQo+ID4+PiBpZiBjaGFubmVsIGlz
IG5vdCBhdmFpbGFibGUgYW5kIG1ha2UgVGVncmEgSTJDIGRyaXZlciB0byB1c2UgaXQsIG9yDQo+
ID4+PiBoYW5kbGUgdGhlIGVycm9yIGNvZGUgcmV0dXJuZWQgYnkgZG1hX3JlcXVlc3RfY2hhbigp
Lg0KPiA+Pg0KPiA+PiBMZXQgbWUgZWxhYm9yYXRlIG15IHRob3VnaHRzLg0KPiA+Pg0KPiA+PiBU
aGUgZnVuY3Rpb24gdGVncmFfaTJjX2luaXRfZG1hKCkgaXMgYWxzbyBjYWxsZWQgaW5zaWRlIHRl
Z3JhX2kyY194ZmVyX21zZygpIGlmDQo+ID4+IERNQSBpcyBub3QgaW5pdGlhbGl6ZWQgYmVmb3Jl
LCBpLmUuIGlmICghaTJjX2Rldi0+ZG1hX2J1ZikuDQo+ID4NCj4gPiBUaGlzIGlzIG5vdCB0cnVl
DQo+ID4NCj4gPiBpMmNfZGV2LT5kbWFfbW9kZT1mYWxzZSBpZiAhaTJjX2Rldi0+ZG1hX2J1ZiBh
bmQgdGhhdCdzIGl0DQo+ID4NCj4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92
Ni4wLXJjMi9zb3VyY2UvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy0NCj4gdGVncmEuYyNMMTI1Mw0K
PiA+DQo+ID4gdGVncmFfaTJjX2luaXRfZG1hKCkgaXMgaW52b2tlZCBvbmx5IGR1cmluZyBwcm9i
ZQ0KPiA+DQo+ID4+IFNvLCBpZiBzdXBwb3NlIHRoZXJlIGlzIG5vIERUIGVudHJ5IGZvciBkbWFz
LCB0aGUgZHJpdmVyIHdvdWxkIGhhdmUgdG8gZ28gdGFrZQ0KPiB0aGUNCj4gPj4gcGF0aCB0ZWdy
YV9pMmNfaW5pdF9kbWEoKSAtPiBkbWFfcmVxdWVzdF9jaGFuKCkgLT4gb2ZfKigpIGFwaXMgLT4g
Li4uIGFuZA0KPiB0aGVuIGZpZ3VyZQ0KPiA+PiBvdXQgdGhhdCBETUEgaXMgbm90IHN1cHBvcnRl
ZC4gVGhpcyB3b3VsZCBoYXBwZW4gZm9yIGVhY2ggdHJhbnNmZXIgb2Ygc2l6ZQ0KPiBsYXJnZXIg
dGhhbg0KPiA+PiBJMkNfUElPX01PREVfUFJFRkVSUkVEX0xFTi4NCj4gPj4NCj4gPj4gVG8gYXZv
aWQgdGhpcywgSSBhbSBsb29raW5nIGZvciBhIHZhcmlhYmxlL2ZsYWcgd2hpY2ggY2FuIGluZGlj
YXRlIGlmIHRoZSBkcml2ZXINCj4gc2hvdWxkIGF0dGVtcHQNCj4gPj4gdG8gY29uZmlndXJlIERN
QSBvciBub3QuIEkgZGlkbid0IHF1aXRlIGdldCB0aGUgaWRlYSBpZiBkbWFfbW9kZSBjYW4gYmUN
Cj4gZXh0ZW5kZWQgdG8gc3VwcG9ydA0KPiA+PiB0aGlzLCBiZWNhdXNlIGl0IGlzIHVwZGF0ZWQg
YmFzZWQgb24geGZlcl9zaXplIG9uIGVhY2ggdHJhbnNmZXIuIE15IGlkZWEgb2YNCj4gaTJjX2Rl
di0+ZG1hX3N1cHBvcnQNCj4gPj4gaXMgdGhhdCBpdCB3aWxsIGJlIGNvbnN0YW50IGFmdGVyIHRo
ZSBwcm9iZSgpLg0KPiANCj4gSSBzZWUgbm93IHRoYXQgaXQncyB5b3UgYWRkZWQgdGVncmFfaTJj
X2luaXRfZG1hKCkgdG8NCj4gdGVncmFfaTJjX3hmZXJfbXNnKCkuIEFuZCB0ZWdyYV9pMmNfaW5p
dF9kbWEoKSBhbHJlYWR5IGZhbGxzIGJhY2sgdG8gUElPDQo+IGlmIERNQSBpcyB1bmF2YWlsYWJs
ZS4NCj4gDQo+IEkgZG9uJ3QgcmVtZW1iZXIgd2h5ICFJU19FTkFCTEVEKENPTkZJR19URUdSQTIw
X0FQQl9ETUEpIHdhcyBhZGRlZA0KPiB0bw0KPiB0ZWdyYV9pMmNfaW5pdF9kbWEoKSwgYnV0IGlm
IGRtYV9yZXF1ZXN0X2NoYW4oKSByZXR1cm5zIC1FUFJPQkVfREVGRVINCj4gd2hlbiB0aGVyZSBp
cyBubyBETUEgY2hhbm5lbCBhdmFpbGFibGUgYXQgYWxsLCB0aGVuIHlvdSBzaG91bGQgZml4IGl0
Lg0KPiANCj4gVHJ5aW5nIHRvIGluaXRpYWxpemUgRE1BIGR1cmluZyB0cmFuc2ZlciBpZiBpdCBm
YWlsZWQgdG8gaW5pdGlhbGl6ZQ0KPiBkdXJpbmcgcHJvYmUgaXMgYSB3cm9uZyBhcHByb2FjaC4g
RE1BIG11c3QgYmUgaW5pdGlhbGl6ZWQgb25seSBvbmNlDQo+IGR1cmluZyBwcm9iZS4gUGxlYXNl
IG1ha2UgdGhlIHByb2JlIHRvIHdvcmsgcHJvcGVybHkuDQoNCldoYXQgSSBhbSB0cnlpbmcgZm9y
IGlzIHRvIGhhdmUgYSBtZWNoYW5pc20gdGhhdCBkb2Vzbid0IGhhbHQgdGhlIGkyYyB0cmFuc2Zl
cnMNCnRpbGwgRE1BIGlzIGF2YWlsYWJsZS4gQWxzbywgSSBkbyBub3Qgd2FudCB0byBkcm9wIERN
QSBiZWNhdXNlIGl0IHdhcyB1bmF2YWlsYWJsZQ0KZHVyaW5nIHByb2JlKCkuDQpUaGlzIHNpdHVh
dGlvbiBpcyBzdXJlIHRvIGhpdCBpZiB3ZSBoYXZlIEkyQyBkcml2ZXIgYXMgYnVpbHQgaW4gYW5k
IERNQSBkcml2ZXIgYXMgYSANCm1vZHVsZS4gSW4gc3VjaCBjYXNlcywgSTJDIHdpbGwgbmV2ZXIg
YmUgYWJsZSB0byB1c2UgdGhlIERNQS4NCg0KQW5vdGhlciBvcHRpb24gSSB0aG91Z2h0IGFib3V0
IHdhcyB0byByZXF1ZXN0IGFuZCBmcmVlIERNQSBjaGFubmVsIGZvciBlYWNoDQp0cmFuc2Zlciwg
d2hpY2ggbWFueSBzZXJpYWwgZHJpdmVycyBhbHJlYWR5IGRvLiBCdXQgSSBhbSBhIGJpdCBhbnhp
b3VzIGlmIHRoYXQgd2lsbA0KaW5jcmVhc2UgdGhlIGxhdGVuY3kgb2YgdHJhbnNmZXIuDQoNClJl
Z2FyZHMsDQpBa2hpbA0K
