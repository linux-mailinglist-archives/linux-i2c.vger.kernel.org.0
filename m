Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8E05504CC
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Jun 2022 14:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234290AbiFRMkp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Jun 2022 08:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233879AbiFRMko (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 18 Jun 2022 08:40:44 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 055171EAF0;
        Sat, 18 Jun 2022 05:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655556044; x=1687092044;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IzK5jJya2yWM2UFSjdCPeWk49CedoI2hwG0twfIvV8w=;
  b=Ux8HOX/iLFPY2S7rEwD9XtwQPM3WMCuMmtZ09u4RTaipcdJCqe5JcDH9
   DL/onSKGOMVKuxZWeAqdyMvj3E7NjsfgRwpoOLExn8NP/zTfp/q+jRITn
   nLEEW4CDrkwzQmmh0uGzTKtnbP0bmFuBxIxR1xE03FszkAzZ1z20q53jl
   A03FMD1UrRrefSEGBUm2t9jPHAuWx9NOxPIX6YZxAMaAQN0C44ezpkXpU
   /A7l8hlLvf91oVyFPSCMHrlOcy0F2ZgETrfRXg5K0vwjtS0W4PcUz5MMK
   g0BNp+dGjHdGkV8WPi/siQqHPXp87tFhgyMMUTdTNMFzRTNYHaFFpjI3m
   g==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="168646549"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Jun 2022 05:40:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sat, 18 Jun 2022 05:40:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Sat, 18 Jun 2022 05:40:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7mlW2c3L7IZnFyHY3fLhtXEftGbzob4b8Gvqv4AmXrFUEaE/rz+P8kUBVOxcs4YY2dWxLoPkLpK0GitWROYQlAlxszfEdnn9LBLnSWjOAxvrFy1dpsC6/hd2zfp1qrEDLpNN+9bS0HebD8hPMFRtU4z4zNIzBSKqfAanq0wc5KAOqJl3XSRYXvxf4GbYqWPZlqMWcOqT0xqvnZJnycHkc4bLaF80Zv0mbrKQR4155y4vTL+3yfaTO/wc//9GWslsMa3GmyyAJcVWz9JYkl4lSLwHPcWuQstN7s+Y22G/wCsMMRE1xWlFGJr3Q9psl5513BVFJhIwjwdEbIhhGfCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzK5jJya2yWM2UFSjdCPeWk49CedoI2hwG0twfIvV8w=;
 b=liHXYzWw0AsCx/scG15V39gE88KfqjCDfWmypqbfnMDJPy8gXTq329eBTxlGtcBGEEYVr6Oyi4nGAQIfNcnZeDtFFrGMxCaOfOjrjvYBb5uHvJVZv9Emr+Z63k0cQAG1d8mrjgYcn2jY4wkBoaJcgEhqt8asRp9DwXz7yx0BW+balN1AEbDYQJ0Kk/3Tr9QeK1R5XjEgvaYy1fTXT3bCq5SQAGraqOpMrqtHjj5qS7ZK/mJNOeBabqYZYi/IHgYD2qfA5x2UuN7C3mRJOgqg/ZeIRQIc88SKwwLLQfElcf8wRoQ8W3big5mAiE0wy2MB5Em24aS+iMVYAaUziSiw6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzK5jJya2yWM2UFSjdCPeWk49CedoI2hwG0twfIvV8w=;
 b=gjdR97h6XyAnFqizNz7MyAK1Z5Cv6zVhAn4dGvgrRDgTW0k+m+6fslMrDRxx7ascTn9fQbG0l5CaKWpgetbmBdd4R08pm/Df07NqTiwHybeKWS58zGpfn7fW7y2H6Y4kd6BncivaDXlcDPNH2/lJ5bwPjMtmeks50dHsDlD1Y8M=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB1350.namprd11.prod.outlook.com (2603:10b6:903:2e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Sat, 18 Jun
 2022 12:40:38 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.018; Sat, 18 Jun 2022
 12:40:38 +0000
From:   <Conor.Dooley@microchip.com>
To:     <atulkhare@rivosinc.com>, <palmer@rivosinc.com>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
Thread-Topic: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
Thread-Index: AQHYe5EWlaN9eJ6DkkaWySyozCpPXK1VKhaA
Date:   Sat, 18 Jun 2022 12:40:37 +0000
Message-ID: <7ba0c325-bc1f-f6e4-dd8a-b5d13a04ef93@microchip.com>
References: <CABMhjYp3xUyQ9q6nXHvEA2zuzhYi0ETn6UETeH1apWf2n2eP7A@mail.gmail.com>
In-Reply-To: <CABMhjYp3xUyQ9q6nXHvEA2zuzhYi0ETn6UETeH1apWf2n2eP7A@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a4a968d-9f83-4d44-e445-08da5127bf3b
x-ms-traffictypediagnostic: CY4PR11MB1350:EE_
x-microsoft-antispam-prvs: <CY4PR11MB1350DC5C15C4B2CCED9F11BB98AE9@CY4PR11MB1350.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Y/o9CQsVBpQUoM5gwXXkYZfIHd+W0jaj4Ct5o1OBR/JM55GT4qzBxYPif2o6ZnUlsIhjjN374fSZ6TJAwluNc6sl5Y9Z5M0/+Tva7VrBion/s0q6EQajitk+WnJnRYpm8eRjl5mSslU78LpSgg8sS1O6Kn6Z984Lbz3dOiKUF13Hp7lhqWh9LXF2fWCcyLHuEsMC7nFM26JG8unuqzgV0/Rz/CC+9oawxxeI0xoHgY5S6FgR1XD5vFcjUlLaYYqkvYECaUjVhlswTBFUpKUUdAACHwAXTgCrazwIU4Qvf0EvGUonF48/jQ2PupeU0o1WNiK8y61WFAbZJ+N/oBk4FEwDB1BEitGP1lu5i4MRnSDLUOd4AjiJ1LrJ6Fyw8UFHT00OXaAVK8/xDg7ZqI2OY+B9JdaGaIOl2Zm76oK0I+lkVR0Lkm3Z6yg7MD9ah4zlF3+rDMq0JFt6KI3NbTNGYyNmXjxM1rCT9IrA+XuIvUSj0Dc4HASPtZBa7J9ujfPvl2CpTjMbovXLyY8Z+4uvTZ3NQ5op6aIbs1pHRjLfv2W/cJ5jYIobMBA9SyGQVQbMlsU/1mLwHd+1G6eMNzCc01qjZ1StIFkX3RzhaoIn21Lm6eODCIY0lHXTWL/Kgt9wwIhPbgbKf7URgB+THVnHojolhJDBuzkRZtO9YNtDn+SB6G2BbU3VGu/8vcVQeLZg9+8dum3+ModRD9+D8kNCQVDqkrGw4o1kJpjcMvBNpITUN1G/ZB+W6h6zln9XIjGZJU3+1wrQo5YxaVZGlQ5/NZDorA9qjnwK+dpAVGRBgYjJ6stSGcSSGu+eh9A+DXDPCJYNd1+aRSTfOCJYmjXB5ESM3+jiwN4q0R5Po1I/Mg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(110136005)(2906002)(31686004)(71200400001)(54906003)(36756003)(2616005)(6512007)(5660300002)(4744005)(6486002)(186003)(66556008)(66946007)(86362001)(64756008)(4326008)(76116006)(8936002)(66476007)(316002)(38100700002)(53546011)(122000001)(966005)(6506007)(498600001)(66446008)(83380400001)(38070700005)(8676002)(26005)(31696002)(91956017)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDJzdHI5b2lNb1MrSVJYZGFMVHNrUDI4VUpmL253S2JqendySVNqZk1RajF0?=
 =?utf-8?B?UTBNd0J6akg5YThPTzNxL2o3RVR3dFZVYklBdUNvQ1FaMEVVUHc5K1Z0TlJn?=
 =?utf-8?B?N29rVHpSSklEM1gzQ0lRZWVXNXNRNGZ5VVlCeFg5SjNoSE0reUIyd05rblhZ?=
 =?utf-8?B?dGdFajdWTDJZdGtDcXZOOE40bC9UNkd0Slk2WFd3SFZmRW5pb2huVVZSQjJi?=
 =?utf-8?B?Uno4RjJCSjZhVW4zVmhzMGQ3aDJPbEFrZXlUNlZ5NTFCWWkrdzVJaWRuUWJG?=
 =?utf-8?B?eGpjNHBKeVZTZ1RySy9sMVlSR0RFUTN6TU05Z0N2bVMvYzlQTjJZVmlQOUZs?=
 =?utf-8?B?YjQ5d1h5eHlHZ1cyUmU3dGg5cEkwdFEvNDEvbEpzK0M2ZVJKYjFXSWZxazBt?=
 =?utf-8?B?L2djOUVVMzhaaXBKY0lZSWtQOC80eVhYdDBKUzB6WDNGdHpGb3Roa2w3SWtO?=
 =?utf-8?B?SkRFRWt2UTBsNmdmbDhIdkc2TzhsTzFYOTJDdkhjTUhvbm9YMm5TQytaY0VU?=
 =?utf-8?B?NVBIS3RtYlZqUE1YREROdEpsUlRGODViSXJnenFRbjVvYWFEWDZVczFBZTcr?=
 =?utf-8?B?dWNTZDVjYzZTNlcyMEZLa0xQNG9WQTR5bGo1aWNVQktSeTJBd3NOV1JlV3pY?=
 =?utf-8?B?OGJvczdFVEk0NzY3MHFZMlg4S21XeUpjTktzV2kxc1daTExCT0VRS21OTVlu?=
 =?utf-8?B?WjNBNjkySU9oRlptTVo0QTdGTUZZZFlORXE0eXJoNzFZYzQ4bis2NkJnK1hE?=
 =?utf-8?B?cVZZUm52eXpxc1ZnaTNpWDA3MXpSWVBDekxPc1U5ZGREVDNndVBIeWM0NEc0?=
 =?utf-8?B?TENxWHZrek9VZFlzRnc5WDhQa1daYWJ2ek9mQ0cwTnJsTFdHTi93U04xcElP?=
 =?utf-8?B?WGZFKzVhcEFkT3EvN3drc3VIQ1p6ODE4THBSQjlyc2liQlFXVkF3ZEZ1cDBR?=
 =?utf-8?B?WlVad2FKcGU0SllpUGNGOXNoWi9vK1M4dmdNZGZXczhQM2NzbnNOWGlDQ0ZF?=
 =?utf-8?B?YmptbGtWcUpIUUNqMDlQZGdzS1dJMGZ2K2dBZFBPcVI3OHVmWHV1L1V4R041?=
 =?utf-8?B?SFhtYzE5VkgwOVNIZnRWWW82RGpKaWVxU0FpWTBENXFxN2htSURKQ2V0LzNU?=
 =?utf-8?B?Ti9OalAxcWxIVEY2QWZNSStoU3p4d1l0S1FhUVBpQWZQSHpLZCtmTDY0ZEZJ?=
 =?utf-8?B?d3FuallDTTBHWWNPdmo0WUh4Wno1UjB6R2MwU1ZlU2I3RXpnWk9UaWYwT2ZU?=
 =?utf-8?B?N3IvdTB5eFNJYW5KakVKQmhwek9XK1NLNExFRHNwZkJIazZ0Ynl4MVpQWTJC?=
 =?utf-8?B?ZWRWK3BaNkcxKzVWZlV1anZ3R3kySCt6YmpHazZqY2ZNakdsMEtoU3puODk2?=
 =?utf-8?B?dE1hejZlWmNUclp6eStPQjd3VjV3OG94Y1RyV2JSVllYZGtCR1JsNFBIZnE4?=
 =?utf-8?B?UUxPd0toWkVrVS92bjNlQmJOVkM4c0VXa1pMZWRYT3huU0lBUEFhd1RVemhH?=
 =?utf-8?B?V1ZBK04reGN4RXpzOXhqZzNiZjJyZi9PanZVRXhiTWUyMjc1Y3lZcWlzRTE5?=
 =?utf-8?B?Y2M5Z0MxWWRMWUwrZVMwbXdXbElqaGJxaW9JYm44cjYxcXREQzR6MlBBWmxm?=
 =?utf-8?B?WUNsbE4zR3dGanlQaFF2M0x3M3ZyMklsZ01xd0tHa3doYm0ybk1IMnozcGtC?=
 =?utf-8?B?Mm1OdTdMbXByczZNc3ZoWU1TRFFqaEhiN0NUYVhiZXVWUS9KMk1MNXB2Ly9K?=
 =?utf-8?B?dGxkbllaNVcrTUVDNE9aeDFsUk1wdmRZV050N1RnZXVvTElPb01QV2dxV2xL?=
 =?utf-8?B?b041Z3FDMzc3dk1UTjZ3bDZ3ODFTNG4zQm5zekNQM21Lb0JkZTVjRC9BMlFr?=
 =?utf-8?B?VXZtUDN6aUFkYUhWekQ2ZjJDL0RnNHNSUHBLWXJacHB1ZGxyTzR2K2U3SjRM?=
 =?utf-8?B?M2RJVzY5N25NSkN4VVBoaVNxTXF0WlRsZzgrNXdFMlk3ZDg1anJYTTFIQ1dM?=
 =?utf-8?B?OGh5WnBKUXJEdDBRcGxYVUYyYXF1SUo0MTN6Nk95UklXejlzbisvbUZsOFBp?=
 =?utf-8?B?MTNzYkt4WFVxN2xHVFVoc3h3WTdxL1ROVFFxbkRTQW5VRFhsY3RrZUdhZW9E?=
 =?utf-8?B?YVVJTm0xa1JvcE8wZDVob3A1ak9tbEw2RU04WTVnRXdYbmVEM1dHU1RTU0Vj?=
 =?utf-8?B?eGREM1o2Q0JtSkhGVnF0STJDbVNOYUxRZjczVndTdkFKL1lTM0Z5blRITWoy?=
 =?utf-8?B?SmREUlJXdGRET1RvZy9FWW90c0tlZWVpRWNaRmV2NXl5R2xDejhBeWNUQWZ1?=
 =?utf-8?B?Nkx1eGlWNDJtWkhZRVZEN0drZmluZ2NDMXpZeXFBbVFhdEhYSUVKLytlTnNC?=
 =?utf-8?Q?LNkwQT4fRSen5ROg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <997CBEF0D39EFC47BBCB88527C070321@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4a968d-9f83-4d44-e445-08da5127bf3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2022 12:40:38.0137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2il5tWUrY9yqHWs20OVlPoGgrfk1tt3twthASEtPsFfx1ASJknzPOAB+HtmP+aA2Bpkpi0kVJns2JxdcD36On5Kxwf8Xn4vvVa/ILj4e310=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1350
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDkvMDYvMjAyMiAwMDozOSwgQXR1bCBLaGFyZSB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6
IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0
aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBUaGUgcGF0Y2ggc2VyaWVzIGZpeGVzIGR0LXNjaGVt
YSB2YWxpZGF0aW9uIGVycm9ycyB0aGF0IGNhbiBiZSByZXByb2R1Y2VkDQo+IHVzaW5nIHRoZSBm
b2xsb3dpbmc6IG1ha2UgQVJDSD1yaXNjdiBkZWZjb25maWc7IG1ha2UgQVJDSD1yaXNjdg0KPiBk
dF9iaW5kaW5nX2NoZWNrIGR0YnNfY2hlY2sNCj4gDQo+IFRoaXMgaXMgYSByZWJhc2VkIHZlcnNp
b24gb2YgaHR0cHM6Ly90aW55dXJsLmNvbS95dmR2bXNqZCwgYW5kIGV4Y2x1ZGVzDQo+IHR3byBw
YXRjaGVzIHRoYXQgYXJlIG5vdyByZWR1bmRhbnQuDQoNCkhleSBBdHVsLA0KQW55IHdvcmQgb24g
KGFuIGFwcGxpY2FibGUpIHYzPyBXb3VsZCBsaWtlIHRvIGdldCByaWQgb2YgdGhpcyBsYXN0DQpj
b3VwbGUgb2Ygd2FybmluZ3MuDQpUaGFua3MsDQpDb25vci4NCg0KPiANCj4gQXR1bCBLaGFyZSAo
Mik6DQo+ICAgZHQtYmluZGluZ3M6IHNpZml2ZTogYWRkIGNhY2hlLXNldCB2YWx1ZSBvZiAyMDQ4
DQo+ICAgZHQtYmluZGluZ3M6IHNpZml2ZTogYWRkIGdwaW8tbGluZS1uYW1lcw0KPiANCj4gIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL3NpZml2ZSxncGlvLnlhbWwgICAg
ICB8IDMgKysrDQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc2lm
aXZlLWwyLWNhY2hlLnlhbWwgfCA0ICsrKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiAtLQ0KPiAyLjM0LjENCg0K
