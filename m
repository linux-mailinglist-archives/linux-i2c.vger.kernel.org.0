Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0B8E79170D
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 14:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbjIDMZJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 08:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238949AbjIDMZJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 08:25:09 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2062.outbound.protection.outlook.com [40.107.96.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0F11AD;
        Mon,  4 Sep 2023 05:25:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwSdy0Kv79NGOG1fB9elf2U3eOBuNlt8664bxp0SM8lRbbcn1ewZxsqYkG2YVHkOfzidnMh/X4pQ3Slp//uhQwZ9KBsrfpAZEvqCYp1g0S0nK5KUVY8EJ11FEO8Gxko5yAfgzakop5WgpS9XvdRTbTwajtN6dRxMjiUw3erEP2NWILqxxJ/t/67oTEmN50R8OeiN7xRUywhE0YT9+dpnijOr9URgH8+Nd/w6N+WAjj7/PMZFqOZS+gOs75YqrpcyaebDLLc3PfZ+G1BGNhhwKiC7FX3+WjDOBPZ1IQKgqiox+ETd9oFABlkMTZ6FEguEF+V5Sj3S+ND+pcujjddHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TISjHkulL1M+ubtt3rgEKRLUEwNbd9p2FJMwPNMiFE=;
 b=Yq0XCeBkOTOj2pQGLGKlGoq1CgVhE0HX7Tfar2D4hSPpQXQj3imNcJHaetZRbT1mFOSx+/t2bhwlMg2wswtZFfARMG6M7EpvOkgvEB7kO2qa9k9i6tHqPyaGXScTKq4pKoFRrvg1LfGlB7jQ7gS5eNJE47+Ol1cvxRSXsz4/JpLeOG4bEq6M2kOmeIwYGegnZQOfBNpFo7CaljCiq4Nv55CEo+GH5i1/GjWGp29sJSQa0INnpD13tExRdsF97qGNgDxQvL2oUSWHXRsvrko+qNgiRbHXJFkquYacmX8wxoi35gk3hl+aePkfZ2RR5pxH4hpHH8cL603E47Zb+pgYlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TISjHkulL1M+ubtt3rgEKRLUEwNbd9p2FJMwPNMiFE=;
 b=ox/oAtZ7gXYYgUl0os5cLVtoGLFPh+UwjEEr0n1N0htvzHDitoeanUJdO4A7EkcW5ChsePCSMLqUU08/78QbOWL6L8aC2BVLE0palMVztl4lN50hwLKWqIAbTg2KJAYftouZgJofOFNsNlPZNXNOZ7N9OwVZa7hXnHVLtkeK+Na7dogfUMxQ/tclntPQedp/gBr74SFqE6xrYCLpUl/DohBY44Juf/+5i1jmvPzEmRt0QuUdhJIpYCppblTeMPnAAHyhDoEY5AnpQLrfhkjB0gk5s9BV8xSKaTvJ5t+UZsNBHJoiA+6WIDKUaePoZ066l2mx6G84oMeE3a14XcdpVg==
Received: from BN9PR12MB5381.namprd12.prod.outlook.com (2603:10b6:408:102::24)
 by CY5PR12MB6406.namprd12.prod.outlook.com (2603:10b6:930:3d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 12:25:03 +0000
Received: from BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::5fa6:31e7:e6fb:3beb]) by BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::5fa6:31e7:e6fb:3beb%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 12:25:03 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Andi Shyti <andi.shyti@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Michael Shych <michaelsh@nvidia.com>,
        Wolfram Sang <wsa@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] platform/mellanox: NVSW_SN2201 should depend on ACPI
Thread-Topic: [PATCH 1/2] platform/mellanox: NVSW_SN2201 should depend on ACPI
Thread-Index: AQHZ3ydulqLP73zA/0i32YAx9HN+u7AKlyog
Date:   Mon, 4 Sep 2023 12:25:03 +0000
Message-ID: <BN9PR12MB5381C4AFCA22D823651F8F45AFE9A@BN9PR12MB5381.namprd12.prod.outlook.com>
References: <cover.1693828363.git.geert+renesas@glider.be>
 <ec5a4071691ab08d58771b7732a9988e89779268.1693828363.git.geert+renesas@glider.be>
In-Reply-To: <ec5a4071691ab08d58771b7732a9988e89779268.1693828363.git.geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5381:EE_|CY5PR12MB6406:EE_
x-ms-office365-filtering-correlation-id: 7792675d-7dc9-4b7e-b822-08dbad41f6ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xy9qdxm4fTWOyJ+Lv3RZSrXxklD2kAGlgqxKFONPeCYBhnav08kg3uHUEdsf3B3lU6E2H8OsQ9BY/mxbcNvW8QnxoswQDx3TEtdQB15r49iic9teADxhezWZDfo1QhVx6zVbJXz8by2ljB+TGPqy9CVsBKqqOdbfXQG8h0XY5CEZAKBEjMwJn/3z3GNjn1RmDUiV+hd6EpDbzWlpLmXQgjk8WJcpDREsk/RWBa26SK6liJn/CFFkYLtkxGB/fbF7zJcuSdzNp5uAPL40QTX3S0KsHSGaYAXaF7jT0+K02/6L19qXcJPxpG8Np8Ic3+2O3rfQgxqiK3x74m4Tf52Qjg9Z/vfV0uu8IyRbncbCCiIJLdG8LP5f5SNoPL9xHZincdLQGBO35sZpmDOrHm2TQyAyUnM8xIeokfHnOm5sgt7Qhs+v+H+bpHTHFH98v1KeEikCDAD5WX7kBo0fKL6SXuM9501px/HwfpaDVRCVUbdh0SQGTgPdzNHYpkdyd2LI4cMNEartiCyERoOv1vu4TAhqeLKK5AjA/OKk2pEIX8Z+731i85ylRpoKRvtfd99+V99Neu5MYKzw7+N44t1HOIEM1OodWsxId9O44/tHBz7HcbuT4LY0hA1YYk5LcT4O
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5381.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199024)(1800799009)(186009)(41300700001)(8936002)(83380400001)(55016003)(478600001)(71200400001)(2906002)(76116006)(66946007)(5660300002)(4326008)(8676002)(110136005)(52536014)(66556008)(54906003)(64756008)(66446008)(66476007)(316002)(9686003)(53546011)(6506007)(26005)(7696005)(122000001)(38100700002)(38070700005)(33656002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUNNNDV2bFhPbWhRWStTMmR6UzJxUGVZazBJMnNEK25nQTZnMDZqaW42a1Ny?=
 =?utf-8?B?MWFuR1FnSUJzelFENlhPNnhKbVBJanppcGkzZUZreWpaRkkwUzNnZFhrV1dr?=
 =?utf-8?B?bE9KRmNXcGQzNE80YzYxVnErWGRnYzdkWFJzbUk1L3hhM0lxcFFWc2F3SXlU?=
 =?utf-8?B?cGQ1QlVhaithMHV6ZTdRUTlmZllld1lPNVhMK1RoMGRXejVGbEJWWUM1dEps?=
 =?utf-8?B?TWZ6UnFGeGFRMUdtZWh5aEN4VzhpSjhZUzJoeGtxK1RISEozUkZ3RzZBcUlu?=
 =?utf-8?B?THFNUENVTFhJdnJDZndQcUVBbjBVMm9jSEdFZEZBRVVsWXk3NGowUU1HQVdx?=
 =?utf-8?B?SUtUb1NESThHTTlzYnpKNGtvY0FLTGpIR3NMcmhyaW9wNWJyTXVzZS80QndO?=
 =?utf-8?B?OGVyWi94OENwZzlpaEh6TXI5MG0wSm5kTWtVV0l3QW82RGFMeWo2ekt6SXE0?=
 =?utf-8?B?akE1MWRaT3RoNnFLUExHV1MvNWg1NUdzTnlxeVNhTG1IaUdQbkpRay9nT3M3?=
 =?utf-8?B?WmVPd1BlQUFFQ09Rci9PaFVKa2t0eHdCN3NXTTFrMGZkeW8vNmZqTko4eGpw?=
 =?utf-8?B?N3hQT2Rtck5uRUtrRENSYzMreFFBWDNKTzBMN3NaZllBaTBobmZNZVNsVmVZ?=
 =?utf-8?B?a3M3ckxCbzVHVTFkYURZbWZIL1B2Q1FvOWpieWZlQWZTRGF3Z3VXRzM1Sk1i?=
 =?utf-8?B?aDJEQUxEaEF2TlVOeWpVT2tod200WG5xQ24rTi9NMitRdWRZL2xFLzJPemti?=
 =?utf-8?B?WG5sSmtDSXl1M2RNdVQ1NDJPYURwa1ZneGhSVy80eHNlTi9tUjFiWE5yNDFw?=
 =?utf-8?B?K0h0bFlJS2VGcTRMWVNXTEZySEIrRit4VVlsS3dMYUROQ0RhZllyeGNuSTdQ?=
 =?utf-8?B?cU14c20ydjh6Y091a0QzMy9BWXlNTnJoYTVmTDU0QTlBN1BrUTRBOGdmYzJ5?=
 =?utf-8?B?aVl2M0xuWDVhcDE3YjcyWU1KQ3BWKy9HZEgyNWtNRGZpbmtxSzNCaHBVcDhm?=
 =?utf-8?B?WHZvZnNWL0VBdGs2M3ZiVTA3ekdsaDFUaHdHTDUwTnlWR1gzcTNnM0l4b1Rx?=
 =?utf-8?B?TVpJeFFCSjVwRnE5MWJQb0F3YXpqd2lNUjNiU292RVpDSW5PQW45SWJvU01h?=
 =?utf-8?B?d1czUUdXNTJjL2xvVGtLVldBQ3JKNnZPM3RSbXlCT2Z4TUlqUlJ5a0tJOXB6?=
 =?utf-8?B?ZTFnazZ1LzJKekY0MXIwZTNrSnU1ejhKMXpZbTlyMW9zN050YzdJQlFXZ1k5?=
 =?utf-8?B?WkxKSE95azBIdWZLUThjcmZONFhSNVpEalpBekhvQ2d0TXZWdVdtOHVOR0dy?=
 =?utf-8?B?ZUI1ODVsUmc2YVNHSVl3YWdZQTZ4VU1qV3Y3SkV4cEZ4ZTlNQ2paY25WK0dK?=
 =?utf-8?B?REwzOGUwRUNDNisrc2VYaDdyNS9LMVVXS0x6bzBvWHNYSmpZNzlRaC9pUUNI?=
 =?utf-8?B?Z3Z2djhJV0R0eXFLQzRQa0t2bk43NXczdU9QdlVWUVBDLzBSN0Vka29TTW1u?=
 =?utf-8?B?ODdxNWRHQ2cwMllOMkRkQkE1UHFMMldLN1M5R1o4cXBWcWY0MU9Bb1FNdGZB?=
 =?utf-8?B?cUhPVUY0bnU5RmhYa1BmcHNhem9rNStQWTNlMS9WUTAvTElCcTNDUENKbElK?=
 =?utf-8?B?QTh5OTgvT0orRncvUHJONWY4bWtXWnZYN1gxcGkzTGk2Zmx5cStOMW1lNndU?=
 =?utf-8?B?cFJCM2piVTQzdVlTZUNWRVQxazRodnh3WEtnVWJzcFo3bFlTRGROMFphb0gw?=
 =?utf-8?B?WUN5N1MzRUtTTjZrajdFNHRkMmZOUHNhTWthZXNLTDRTMGJKYitaSWQ1Rk50?=
 =?utf-8?B?QkpackVEcUx3Z2lrR2NidEs5OGRpQXlKOHVzM3B4VUQxdkYxU3JDdC9GbUw1?=
 =?utf-8?B?ZFRza25jNjFBOEE0ZUY1d2hKSkFDRUpkRDVXNDRURFBQUGtBaHllenVDTWgw?=
 =?utf-8?B?ZFNmVXk0b2JhTjc3THhhL1JpbmhwTzNsMFBjc01ET09pZms2Tm5ORW1YUkxn?=
 =?utf-8?B?ZW1veXU5OXVsMHU1OTJOaUl6Ny9UVlJGeEh6N0QrbjErNko3WEpFb3l5YVlF?=
 =?utf-8?B?Nzh1dWZHS3FJUURUbEZBSzBkR2ZraHgwTmtzTXBFc2loSCtZVVdkaWs4YXBa?=
 =?utf-8?Q?JznU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5381.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7792675d-7dc9-4b7e-b822-08dbad41f6ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 12:25:03.0425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0GRPQzuPSxOYBVG2K+XYQB9O8Oih15bUP1w01eSJIXWUaAIXytxudpPjSY8p9XwnxDvA09yUQ8zNnmuNHSHhFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6406
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gU2VudDogTW9uZGF5LCA0IFNlcHRlbWJl
ciAyMDIzIDE1OjAxDQo+IFRvOiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGtlcm5lbC5vcmc+OyBI
YW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPjsNCj4gTWFyayBHcm9zcyA8bWFya2dy
b3NzQGtlcm5lbC5vcmc+OyBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlkaWEuY29tPjsNCj4g
TWljaGFlbCBTaHljaCA8bWljaGFlbHNoQG52aWRpYS5jb20+OyBXb2xmcmFtIFNhbmcgPHdzYUBr
ZXJuZWwub3JnPg0KPiBDYzogbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgcGxhdGZvcm0tZHJp
dmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiBTdWJqZWN0
OiBbUEFUQ0ggMS8yXSBwbGF0Zm9ybS9tZWxsYW5veDogTlZTV19TTjIyMDEgc2hvdWxkIGRlcGVu
ZCBvbiBBQ1BJDQo+IA0KPiBUaGUgb25seSBwcm9iaW5nIG1ldGhvZCBzdXBwb3J0ZWQgYnkgdGhl
IE52aWRpYSBTTjIyMDEgcGxhdGZvcm0gZHJpdmVyIGlzDQo+IHByb2JpbmcgdGhyb3VnaCBhbiBB
Q1BJIG1hdGNoIHRhYmxlLiAgSGVuY2UgYWRkIGEgZGVwZW5kZW5jeSBvbiBBQ1BJLCB0bw0KPiBw
cmV2ZW50IGFza2luZyB0aGUgdXNlciBhYm91dCB0aGlzIGRyaXZlciB3aGVuIGNvbmZpZ3VyaW5n
IGEga2VybmVsIHdpdGhvdXQgQUNQSQ0KPiBzdXBwb3J0Lg0KPiANCj4gRml4ZXM6IDY2MmYyNDgy
NmY5NTRkNDkgKCJwbGF0Zm9ybS9tZWxsYW5veDogQWRkIHN1cHBvcnQgZm9yIG5ldyBTTjIyMDEN
Cj4gc3lzdGVtIikNCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCty
ZW5lc2FzQGdsaWRlci5iZT4NCg0KQWNrZWQtYnk6IFZhZGltIFBhc3Rlcm5hayA8dmFkaW1wQG52
aWRpYS5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L0tjb25maWcg
fCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9LY29uZmln
IGIvZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9LY29uZmlnDQo+IGluZGV4IDM4Mjc5M2U3M2E2
MGE4YjMuLjMwYjUwOTIwYjI3OGM5NGIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGxhdGZvcm0v
bWVsbGFub3gvS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L0tjb25m
aWcNCj4gQEAgLTgwLDggKzgwLDggQEAgY29uZmlnIE1MWEJGX1BNQw0KPiANCj4gIGNvbmZpZyBO
VlNXX1NOMjIwMQ0KPiAgCXRyaXN0YXRlICJOdmlkaWEgU04yMjAxIHBsYXRmb3JtIGRyaXZlciBz
dXBwb3J0Ig0KPiAtCWRlcGVuZHMgb24gSFdNT04NCj4gLQlkZXBlbmRzIG9uIEkyQw0KPiArCWRl
cGVuZHMgb24gSFdNT04gJiYgSTJDDQo+ICsJZGVwZW5kcyBvbiBBQ1BJIHx8IENPTVBJTEVfVEVT
VA0KPiAgCXNlbGVjdCBSRUdNQVBfSTJDDQo+ICAJaGVscA0KPiAgCSAgVGhpcyBkcml2ZXIgcHJv
dmlkZXMgc3VwcG9ydCBmb3IgdGhlIE52aWRpYSBTTjIyMDEgcGxhdGZvcm0uDQo+IC0tDQo+IDIu
MzQuMQ0KDQo=
