Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51AD048C11B
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 10:38:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238584AbiALJiW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jan 2022 04:38:22 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:65116 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238079AbiALJiT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jan 2022 04:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1641980299; x=1673516299;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GEHhszs/K4O3t4AMJV1sk+4UL7yXasINyppfeXKjEV0=;
  b=q3HZ8h21lx0iuhVgEvfED09pN4IQz+e04AjmT4XfcUJeD9pRYoMO3Rkz
   mG7uaJdgvkjxfoPBQlg1LBkSoOb878QJWQOuYwZ8Bs4qu9BER6xfZRwCU
   HjQeAtXOkbDFiCu19ujHWKUaN9evYnLVBFIm7uVAchxEMukJ6/zXDYyDV
   0N5k2+2HXqvCYwk7yKL4NzLP+fDjP8DAY4RKtZ3j4Y1WTVOuxICzOBe8U
   WSxSVjDZC+kRwiZREbKpCpZSK06YmXXMe4ZpSHDSNB87ESq7HQXA7MXoK
   w2MjQZQhLrdxeuo8VztHy11JgxNlUHbD4qDLNFhrKljGkHQLZhQDs97FH
   Q==;
IronPort-SDR: BwdhHNXyvO/XTmKGS8vme0odl1G4ZZ9JyMfDmRF6f4fhrJ04f29eRgy/DnKd0DwrLxKkoBulWA
 OAuR0eYe1znOGHP3w0i4aFgxN85jZRI5I5EmGz2TDd0N6WVal4OJkrGffuiZS3faiOaZIFINlc
 gO+0bl4z47rfLP3g8ZVbkykHVABxrRdwLw5WLjRppSgR4Rv2SNENlZoYP37O0c3km4XQazVDLT
 Q5yP1VKcwhLhIm6hSm9RpyQR1lGIvW5KRqV/SaDKqHq+9GXTTIcoM6Jp+zGom8zI6zocDL4TLP
 UmDvYKLPf6PCqlD4Jpr2LyU2
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="158385928"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jan 2022 02:38:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 12 Jan 2022 02:38:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 12 Jan 2022 02:38:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBvEZtPqIIX6nkNeblG8V9AJVjP8133keF3GVKf72oJwQnSD+BIo4FJO9b7Q/HDuIRF7NX2Q3aJvBuhHxR3G4J4kauxaDtuey6g5JyASZVSJE4+Be3VQUZsapjn8HwHm79RaTThFthmtVY4oNHezZ2hvvjJpsv0K/rjid+nKSanC0+c8Q21kOR8fPu8Xdh/22ttpegxIZIRr0CT4Q+nqN+X+Abh0WWTrbirEsrkUd+oYlPNzuZXHiUcVwnWte7vB464DcfwKjCBnQjY2RxJJN2U+6h4XB6BhznYoC2bmztU8i0OHhLh9QzCvzywdSc6B3cGhGSW7q2emOUciTJHHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEHhszs/K4O3t4AMJV1sk+4UL7yXasINyppfeXKjEV0=;
 b=IKRQocsmtiOmqmvrLtiYgxtqpRclSgzlgQX+ps0UqJhYTorPMjIYZIhxwH+4Zs/cwGGfkSyG6na3/BNzQcj5WHEvvCVI0mnWXfldL+VGYodHaor+Dgc3Y0uBSPplppp3gmBARdx2eWUS2LatNvM49Bcc8njzX5pw5/kW2R1MQVi7Iu9WBV/47tEYJECUtgDo0qjE2GwA2ESgZQdop/2bQ4DCRdTK9F+i/QhOQwT7KsY39Ch6U1WPnmGLF3oMvVghHohCVX8IJpslpqsAFJxZ/5zoiR4b4Y0Mp7PoNXzZoCwLPI0yOMROjXjx78bLHnWIbs38tDL28vsMPUC90sXwlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEHhszs/K4O3t4AMJV1sk+4UL7yXasINyppfeXKjEV0=;
 b=WFNRS9LGQU88uKdte2rpOpXCRuV5RimIzoyjwyjF2ci7dOoaXoHPHna08ReIz/xlVNlwUgP2RLvUN1rlqMm31o423OAyxs7W7MOa/WRHnNhejRhFCJgxqgDaMhpBShhn5bO4u1ti3lX+9S/E9QRrMDoBYgoHnZpVMHf9/8UjDcg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by CY4PR1101MB2293.namprd11.prod.outlook.com (2603:10b6:910:22::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 09:38:04 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3%9]) with mapi id 15.20.4888.010; Wed, 12 Jan 2022
 09:38:04 +0000
From:   <Conor.Dooley@microchip.com>
To:     <geert@linux-m68k.org>
CC:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>,
        <heiko@sntech.de>, <Lewis.Hanly@microchip.com>,
        <Daire.McNamara@microchip.com>, <Ivan.Griffin@microchip.com>,
        <atishp@atishpatra.org>
Subject: Re: [PATCH v2 14/17] riscv: dts: microchip: add fpga fabric section
 to icicle kit
Thread-Topic: [PATCH v2 14/17] riscv: dts: microchip: add fpga fabric section
 to icicle kit
Thread-Index: AQHX8ylFKW6kqD5p50ew7h8tB9OgBKw2sbwAgAAfJwCAAAdZAIAoclmA
Date:   Wed, 12 Jan 2022 09:38:04 +0000
Message-ID: <65370401-1d93-f869-9b85-cdc4d211fcba@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-15-conor.dooley@microchip.com>
 <CAMuHMdV0N-15kNZ1fnzaj_psNVCRUQP506Noc-tHawmgxqCVeA@mail.gmail.com>
 <11333b59-733c-186f-3708-7357f72d7bef@microchip.com>
 <CAMuHMdUiSnxmXFroHi1drcmkqkhshC+X=6mtw0_wFnS+P=O9Cw@mail.gmail.com>
In-Reply-To: <CAMuHMdUiSnxmXFroHi1drcmkqkhshC+X=6mtw0_wFnS+P=O9Cw@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cfb6fdf-65ac-4ae7-1d6e-08d9d5af3b9b
x-ms-traffictypediagnostic: CY4PR1101MB2293:EE_
x-microsoft-antispam-prvs: <CY4PR1101MB2293E0C1ABC9CB144E179B7A98529@CY4PR1101MB2293.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xweH1gMIZzw+16TUp0TfBFQ1Si9nbJwoHbH6K6nBU3AP/4eJM6kE0Ptw5KWw/llazWFsqHJY5vldSxRic89pnN6UlVp/nCItLJr+JZgJTzbNImnjGyfdLP1Tsqn1z93+InptfDF7z+ZGK4RftTdoPxrTvLQZM/gycWjA6I33dkZkfo6hIJuPQKHCGLqjpnTmT8/oUQ9Uxc7hYADhZNObSZ3k40wSjBz9/aoKGa1iKsQH4sI9Hd0nTv73S8mmijpzv7OKGmW1ArUDkTkO30o8iR0g+15e6M5HngRelhL238lRUVu5nA2F9vQcX/Il4dBsN2wawFKjl9FSBEcHTFQSm8X2ixMdRTyocsfivYpZTczr5wyct7ddR6tK6k5pPzf/fDC+wlySXcDjZ0k2zEGAHZ3HPbeLQGxAnsrOBgfe65CtldJ+/DZzzYIwVQRtjoFC6KqYqN33X/JZVw/46gEBMyH8VwN29j0qHOB5XqgK3aL2cJLOk+KBcQQIwPiCv7QeuHNWgv+Jt/+0QTB7kCY7+Slf0V5Ojc1DXnOE3ULg+W6SW+h8HKM8clWHqKXPQgoEMiHh8dtHY0NShMN4tW1DCMUIqrU1CWyOqWGFBrOJjldPcoRzqCF93oO88AMXWeD4DJAeqHwnUgrZX3870SkZ20DgqKcNcNP5YM0YM5LCDIpf4jicMSYVf+JYIyG7ccS97X6KOVJDT0+gkgDO70izebVr/e8KGHVNB4lxmLZ8yS8YER52m4JL2hPLYEscmvP7ECqKPyuAVKEJd4Sen8hxug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(38070700005)(8936002)(7416002)(8676002)(5660300002)(316002)(122000001)(186003)(64756008)(6916009)(31696002)(38100700002)(66556008)(66476007)(66946007)(66446008)(2616005)(6506007)(53546011)(91956017)(26005)(76116006)(6512007)(54906003)(71200400001)(2906002)(31686004)(86362001)(36756003)(6486002)(4326008)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U01QU0VvMVc0VWxWUHBEOThaeFRVY2NUaGpEMFFmYUpORytjT1d1bWxsS2M5?=
 =?utf-8?B?ODlxOGMzVHZhYStOZkNydVZCYStQTU5OVmJKTTJKNmV3MDNLdWg4SlBweGZj?=
 =?utf-8?B?WkswSGp1RjhBSFRwZ1I5a1MxVUxPL2xRTkxUempTcVNjL2ZUeWwrZEtwdEhZ?=
 =?utf-8?B?eCtUNStTNHA2a1UrOWhGamdKNmdFVXJROUhGQkJtNUtZc0VTZGYzVzZCaFlJ?=
 =?utf-8?B?ZXBnUmRkQkdIc0JSNEFTZWkvdW9EUm5UTGx5emQ4RUZWcVY2U1N1UFJ6cXB1?=
 =?utf-8?B?anJOdGR2bDJucU16ZUpKdEg3ZUtnUlFmNE13T3pDdnFicElDOGtUZE1rQUZw?=
 =?utf-8?B?QThtRnNXZ25VU3hLWkwyd2pZb2F1Z25VdmhEVWZrT21ZRTgrUmNhaWo5K2Zp?=
 =?utf-8?B?N3NVVnF6NS9ZVkF6dno3VGMrdzZOWnpiN0VsMy93UnM4N2JpTk4vWFNpSk1j?=
 =?utf-8?B?ekxycDdHekYwY2pJT09OU1ZnSkd4aWRoVUhxakw2dmZQdWVFUE9uQTcrNWRU?=
 =?utf-8?B?VFh1S1MzYzNOeG9yT2k2YnM0azBuNnNWWG8rbHlrbExrbU4rZyswQVZZTXBG?=
 =?utf-8?B?bkFpaFFXRi8wL1ltL1RHdlhQUlg0ZXRubm85eXhEZHZMNXhkTlBRbHJ2T3BE?=
 =?utf-8?B?Yk1nN0UvaUZqWUlIaVF2dVpFUGMxSGRMRmhMa3N4VHRtZXlIOEhpQnR4WnlW?=
 =?utf-8?B?VzY5QVE0RDRBZHFmTW1YNzkxQUhRT054MzZnSGplSHhsNnZTQUt6WDFodk9Z?=
 =?utf-8?B?WnNjMjR5UHF3M1RBYTJLVVdqbWdJZlhmL3RUbC91ZUNNemJHRjZTVlViNnMv?=
 =?utf-8?B?Q0pDanVFbG94d2JtbjJxMkJoU2M3Mk03Zmo0QlBrYWh4Uk83WWZ4SXJjV1Zt?=
 =?utf-8?B?V0txYjd4RTNGTm45OXVFWS96eUNmS3ZzQ2JNNTU0WHY0WlVQc0p5RnIxdFlx?=
 =?utf-8?B?cFYwaHV2L0RscFRkMm1EME1Pb21IaWlTWFBFdVFNMjh6anlhbGcrK0xTYUJE?=
 =?utf-8?B?K3NwZ2NROVZiNnhCTjU4bVBLT2h6SFlZcUJOVUJEWTl2Y0pPU2xIOEhkVkNM?=
 =?utf-8?B?QzdiK280ZlVRcThWZ09IU3pUTzJKVEErZWFQK0NtNDN2c21XOEorWnBiQ0d4?=
 =?utf-8?B?U0F4SGtDbCsyemNmNDFhTnF0eGpYNzlGdSt1Mm9BSlBWdjlSdHlFRmRxLzZz?=
 =?utf-8?B?UHg0UTBuQVhjZnFGMS9LYk5mWjFFRHcxQk9Sa29iTk1oRUNwZ3dETkhWZFY0?=
 =?utf-8?B?Q0JSVWU1YXB3NFpPSEtiUVh6MDRoYjJ6ZERYREk1YmNmVkQ5VWVZUStvUjZD?=
 =?utf-8?B?aXFKN3FzMWxnK1krZ3dYWjhISFhJNnFTa1hvQ0ZWM1NBR2xlS2l0UVJYNSt5?=
 =?utf-8?B?aktFWFh5VmdDSlR6T0lMclZmUmFOWTUyVVlyeUU2SU55SlRqOStSazdrWjlS?=
 =?utf-8?B?OVAvanozZHhUdnhJRmJPV2xablg1SlNQL2Y1K09LeWVSaEZWWGdCd25ZQm9N?=
 =?utf-8?B?RWxiMmF5MWpVMm1rRlJMOXBveFhudjROenJvRWVNTzd2V0EzWG1VOGk1WTJ0?=
 =?utf-8?B?NHYybnFvVUJWL29qRmc1RVBhOGJxellWT1VkZStITk5acVVmOEptdkQ3cEFF?=
 =?utf-8?B?U0VycFpXYWRueFRqMkZDVTJ1MjRjQWZmaEdBU1p5eE90SVNJVSt1TjZuSU14?=
 =?utf-8?B?dGZGS0NKUGN3OWlQeUUyaGttMitCUm1XSjh1aUs1ZzltMmVTT05tT2V3Z2Vy?=
 =?utf-8?B?L1F2bXJnRS9GaEVMSEF1L3dXcE1ma3ZXdDF6T0RBNnN1anBxWDViTHkwNXg4?=
 =?utf-8?B?d1JqK2lTcnQ4NVQyS2htMlhmQ1hhSVVpajFkeXNhR0FKV1BrVjNCOWMvNXJ4?=
 =?utf-8?B?bW9WWXR5ZHFZcXN1a1V1R1dyclVUY3U0WVlkNVoxQzF4a2dWRnVpVmNGaFcv?=
 =?utf-8?B?N1F4SGJHMGJ0WTRGYkZ4RVpyREFtT2NuSmdQcnN3QUkzSHgvUGdiOG1uQUYw?=
 =?utf-8?B?b09wekEvNVBZeTFKYTR5b09OMTk5S1l2NHdMZG0wS3V4Q09hc3B1VW14M0xM?=
 =?utf-8?B?SzhGOWJtWnBNKzcvWTZmWDBsbDFnVzZPMkNYZFJKU1dUY1pRRGpFU2lpeEQ4?=
 =?utf-8?B?L25la0tqbGdnODFQaXQrd0VPd1U2TSsyRmZrb25yakxsSnhRd3B4cFF2V0NI?=
 =?utf-8?B?TE1Fb0FSVmR3cy8wUWdOTFB5QWJYcm9nVk9lcDk4MjFmRXFkWlJKbjcwYXRL?=
 =?utf-8?B?WGtrWmJnL21CSm8xOUtveS9jZ1J3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <029354CFCBC1D44A8723805ACC4B5F95@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cfb6fdf-65ac-4ae7-1d6e-08d9d5af3b9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2022 09:38:04.3463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +aTWD2M2MgiNhKWrvenj+j9J4yyhD5Wj5DKzU5qrnEICE4NMdnaUvquOdyyTPtmhKGEBMfmQNLQSlKYVOWmeo/wzArowOKxQRYNq2vlMWdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2293
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTcvMTIvMjAyMSAxNjowMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpIENvbm9yLA0KPiANCj4gT24gRnJp
LCBEZWMgMTcsIDIwMjEgYXQgNDozMiBQTSA8Q29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20+IHdy
b3RlOg0KPj4gT24gMTcvMTIvMjAyMSAxMzo0MywgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0K
Pj4+IE9uIEZyaSwgRGVjIDE3LCAyMDIxIGF0IDEwOjMzIEFNIDxjb25vci5kb29sZXlAbWljcm9j
aGlwLmNvbT4gd3JvdGU6DQo+Pj4+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1p
Y3JvY2hpcC5jb20+DQo+Pj4+DQo+Pj4+IFNwbGl0IHRoZSBkZXZpY2UgdHJlZSBmb3IgdGhlIE1p
Y3JvY2hpcCBNUEZTIGludG8gdHdvIHNlY3Rpb25zIGJ5IGFkZGluZw0KPj4+PiBtaWNyb2NoaXAt
bXBmcy1mYWJyaWMuZHRzaSwgd2hpY2ggY29udGFpbnMgcGVyaXBoZXJhbHMgY29udGFpbmVkIGlu
IHRoZQ0KPj4+PiBGUEdBIGZhYnJpYy4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+Pg0KPj4+IFRoYW5rcyBmb3Ig
eW91ciBwYXRjaCENCj4+Pg0KPj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4+ICsrKyBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvbWljcm9jaGlwL21pY3JvY2hpcC1tcGZzLWZhYnJpYy5kdHNpDQo+Pj4+IEBA
IC0wLDAgKzEsMTMgQEANCj4+Pj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MCBPUiBNSVQpDQo+Pj4+ICsvKiBDb3B5cmlnaHQgKGMpIDIwMjAtMjAyMSBNaWNyb2NoaXAgVGVj
aG5vbG9neSBJbmMgKi8NCj4+Pj4gKw0KPj4+PiArLyB7DQo+Pj4+ICsgICAgICAgY29yZVBXTTA6
IHB3bUA0MTAwMDAwMCB7DQo+Pj4+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1pY3Jv
Y2hpcCxjb3JlcHdtIjsNCj4+Pj4gKyAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg0MTAwMDAw
MCAweDAgMHhGMD47DQo+Pj4+ICsgICAgICAgICAgICAgICBtaWNyb2NoaXAsc3luYy11cGRhdGUg
PSAvYml0cy8gOCA8MD47DQo+Pj4+ICsgICAgICAgICAgICAgICAjcHdtLWNlbGxzID0gPDI+Ow0K
Pj4+PiArICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjbGtjZmcgQ0xLX0ZJQzM+Ow0KPj4+PiAr
ICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4+Pj4gKyAgICAgICB9Ow0KPj4+
DQo+Pj4gSSdtIHdvbmRlcmluZyBpZiB0aGVzZSBzaG91bGQgYmUgZ3JvdXBlZCB1bmRlciBhICJm
YWJyaWMiIHN1Ym5vZGUsDQo+Pj4gbGlrZSB3ZSBoYXZlIGFuICJzb2MiIHN1Ym5vZGUgZm9yIG9u
LVNvQyBkZXZpY2VzPyBSb2I/DQo+Pj4NCj4+PiBCVFcsIGRvIHlvdSBhbHJlYWR5IGhhdmUgYSBu
YW1pbmcgcGxhbiBmb3IgZGlmZmVyZW50IHJldmlzaW9ucyBvZg0KPj4+IEZQR0EgZmFicmljIGNv
cmVzPw0KPj4gTm90IHlldCAoYXNzdW1pbmcgeW91IG1lYW4gc3BlY2lmaWNhbGx5IGhvdyB3ZSB3
aWxsIGhhbmRsZSBpdCBpbiB0aGUNCj4+IGRldmljZSB0cmVlKSAtIGFsdGhvdWdoIGkgd2FzIHRh
bGtpbmcgdG8gc29tZW9uZSBhYm91dCBpdCB5ZXN0ZXJkYXkuDQo+PiBJdCdzIHBvc3NpYmxlIHRo
YXQgd2UgbWlnaHQgaGFuZGxlIHRoYXQgdmlhIGEgcmVnaXN0ZXIsIGJ1dCBpZiB5b3UgaGF2ZQ0K
Pj4gYSBzdWdnZXN0aW9uIG9yIHNvbWUgcHJlY2VkZW5jZSB0aGF0IHlvdSdyZSBhd2FyZSBvZiB0
aGF0IHdvdWxkIGJlIHVzZWZ1bC4NCj4+DQo+PiBUaGUgYWN0dWFsIG5hbWluZyBjb252ZW50aW9u
IG9mIHRoZSBJUCBjb3JlcyB0aGVtc2VsdmVzLCB5ZWFoLiBJIHdpbGwNCj4+IGRpZyBpdCB1cCBm
b3IgeW91IG9uIE1vbmRheS4NCj4gDQo+IEkgbWVhbnQgd2hhdCBpZiBjb3JlcHdtIGlzIGVuaGFu
Y2VkLCBhbmQgaG93IHRvIGRldGVjdCB0aGF0Pw0KPiANCkxvb2tzIGxpa2UgIm1pY3JvY2hpcCxj
b3JlPG5hbWU+LU4iIGlzIHRoZSBwbGFuLiBNb3JlIHJlY2VudCBJUCBjb3JlcyANCmhhdmUgYSBy
ZWdpc3RlciBmcm9tIHdoaWNoIHRoZSB2ZXJzaW9uIG51bWJlciBjYW4gYmUgcmVhZCBidXQgdGhh
dCBpc250IA0KKGFuZCB3b250IGJlKSB0aGUgY2FzZSBmb3IgYWxsIHZlcnNpb25zLg0KV2hlcmUg
dGhpcyByZWdpc3RlciBkb2VzIGV4aXN0LCB3ZSB3aWxsIHVzZSBpdCAmIGlmIG5vdCBmYWxsIGJh
Y2sgb250byANCnRoZSBjb21wYXQuIHN0cmluZy4NCj4gU2lGaXZlIHVzZXMgYW4gaW50ZWdlciB2
ZXJzaW9uIG51bWJlciwgZXZlbiBmb3IgaGFyZCBjb3Jlc1sxXS4NCj4gT3BlbkNvcmVzIHVzZXMg
YW4gIi1ydGxzdm5OIiBzdWZmaXggKGlzbid0IHN2biBkZWFkPyA7LSkNCkF0IGxlYXN0IGhlcmUs
ICJoYXJkd2FyZSIgcGVvcGxlIHNlZW0gdG8gYmUgYSBmYW4gb2YgaXQgc3RpbGwgKHNhZGx5PykN
Cj4gTm8gaWRlYSB3aGF0IGUuZy4gTGl0ZVggYW5kIE1pY3Jvd2F0dCBhcmUgcGxhbm5pbmcuID4N
Cj4gWzFdIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zaWZpdmUvc2lmaXZlLWJs
b2Nrcy1pcC12ZXJzaW9uaW5nLnR4dA0KPiANCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiAN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5p
Y2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtp
bmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMNCg0K
