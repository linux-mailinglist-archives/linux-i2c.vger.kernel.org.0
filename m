Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB4E44AE9E
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 14:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237451AbhKINX2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 08:23:28 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:5783 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235283AbhKINXX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 08:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636464037; x=1668000037;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bUw1eRupk4ggY5TI/qj1twp8I/ZfxG/Uj6OYoObkUv0=;
  b=W31urxJQqno9squ8WCHQNoPtzw2Ku2RS6a+HA+EGEWaYKgwwddfRDVxw
   l4CwDPGtkF0Aryc6AoXlYz1Op5biw7O1d5Tu6bFUmslyFXd6asYzizv+F
   quyNPDWulWig7ty4nyq6PP4IwRZiCawt4ux//GKKIXKYTNHQJDiH7CmMM
   9h6NEKiuGdzqqg0VH3XD/Ej/OEnLxEgWkxSAtkppeiKpTajC/+tmJZWGl
   hq1a5/s03w24pJ3tuiS62EgDPOfwwM4fMsanmzYKwfk7ubVfsRvL5RIjQ
   IF5JSuNpzLTNkKYssGsYqc4K6xCaU7IjsVolBuQBVX08GJqfRhytQdC2E
   Q==;
IronPort-SDR: Q/LeLdyMhYt8LWYZ8hr7fB9X3A/KhRlAE+zYhndDd4P2qR4PRlH6JBW3hcT9rL0kC/1WMfv9pC
 1uAC6SAfpP487m2ORbfSRvzs0YR3UuxFhPaUmKakCuo/PfiGJAm57dch6b2bMmJIALhtcZqwl1
 s0b/UOcRq6lVb1ppfyuuanbxF2Bg8NLiRsMjBmWbtKbYzl3mYFCnj98DLd71Imn4kg3sZ6yHZJ
 P5KgIx/qfzKjz6+c9C3pawFPcT0QfhopyL6soNV7ScOTLB4Pus1+Twlx0RZfXgv0E/UfAQeAjm
 sJpXNRCuVAe4HQBGMCe4r/or
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="75851438"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Nov 2021 06:20:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 9 Nov 2021 06:20:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 9 Nov 2021 06:20:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVNhRUdv2fMi3swgj8VHV2/9weyMRjxQA81dX/BKZXneta/sBcwNyf9/EypSUvuDkqqlCS3+wWTg5s18Rv4ENWA8lQbKNDPFfUVh/eeOX5i29iHThOll3p1Y+XVjfN2Ko7uhWk2tKSTEOx+G9n7QR8AXwSocIlZLUnN8NoUMvlkW5NXkrIPjjEUb/TYrEPHpirEOoNcpzqZN3b2LRHIRxfjDVTwIuiGMr2MvQTcIC5MeJ/Daj2GOid9qjHNJ+/WKa3Ln+3NckORLTcQtxKMlLBgcQhFAoLnhnYO/2oGVY2tuR53iyFKs71QjsLftYpF1RNr447xiNCCUiNtMkwGOxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUw1eRupk4ggY5TI/qj1twp8I/ZfxG/Uj6OYoObkUv0=;
 b=I43xadz/ik3RbE2AxPdFmOi913KpD3By/1nrzHZkknFwz+hjeUhGpE2QddIzffZ4yizP2WYEkd5bwBmaUz2ksZqumxFAzdyMd8HAAaonHzd3Cw+SpsVK5fZUUKi9S8YEX2Ea0WsaiLT9/T5Uy1WxpSnXBU5a6M2RaWSzzXaMQK6oUJbdz8nEls/F/e1O4RuqgWVzXags7xyfZiqhBXW9d1Va90LNvdEMpwEC9NtQvz6HQXweiB0TGCF7urbysmrgKJ/M9Ie6qUQYOHrLKyqS0Odr4E/2X7IwHCWlctue2XnKBy7Rjisd8OvhhBc4o3RFr5p6ccO5jrdTn0rIHpltIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUw1eRupk4ggY5TI/qj1twp8I/ZfxG/Uj6OYoObkUv0=;
 b=kWEZC/yg2lmUhygdHUSn2y8TI9+LXiIIGJEreaEdy11QI6Gjil6TTn6xLDUnfeItModUsTAqtiOk3czsUjIsADbzS5jc7pQoXRFLHU4WzigMkG/wTrtfEYZVsHlKf5O9bTJaQB4qLIjd7Tl3gJ/Q426xsdyzLVB/opTK8jwYwtw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1933.namprd11.prod.outlook.com (2603:10b6:300:110::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Tue, 9 Nov
 2021 13:20:25 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 13:20:25 +0000
From:   <Conor.Dooley@microchip.com>
To:     <krzysztof.kozlowski@canonical.com>, <robh@kernel.org>
CC:     <robh+dt@kernel.org>, <gregkh@linuxfoundation.org>,
        <linus.walleij@linaro.org>, <linux-riscv@lists.infradead.org>,
        <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>,
        <linux-usb@vger.kernel.org>, <Daire.McNamara@microchip.com>,
        <linux-spi@vger.kernel.org>, <geert@linux-m68k.org>,
        <devicetree@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <broonie@kernel.org>,
        <palmer@dabbelt.com>, <bgolaszewski@baylibre.com>,
        <jassisinghbrar@gmail.com>, <linux-crypto@vger.kernel.org>,
        <Ivan.Griffin@microchip.com>, <atish.patra@wdc.com>,
        <Lewis.Hanly@microchip.com>, <bin.meng@windriver.com>,
        <alexandre.belloni@bootlin.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <a.zummo@towertech.it>
Subject: Re: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs
 spi
Thread-Topic: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs
 spi
Thread-Index: AQHX1LJfUqgSbOdkdUS8ce/NVnrEbqv6lPOAgACJDYCAAAokAIAAAZGAgAABe4CAAAS3gA==
Date:   Tue, 9 Nov 2021 13:20:25 +0000
Message-ID: <a2ce221d-5ab7-52c5-176e-e64a081a6805@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-11-conor.dooley@microchip.com>
 <1636430789.935637.743042.nullmailer@robh.at.kernel.org>
 <96005893-8819-1d76-6dea-7d173655258f@microchip.com>
 <0d996393-20b9-4f16-cbd0-c9bff2b54112@canonical.com>
 <bd26a633-7c71-b00b-00c3-54688ee42297@microchip.com>
 <cd789074-53a0-72c1-76f0-b2b86a434247@canonical.com>
In-Reply-To: <cd789074-53a0-72c1-76f0-b2b86a434247@canonical.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5156db62-ae0a-4f78-f2ea-08d9a383b130
x-ms-traffictypediagnostic: MWHPR11MB1933:
x-microsoft-antispam-prvs: <MWHPR11MB1933373E4BB2EE4033954B7298929@MWHPR11MB1933.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 57h7t6W3k6rM/FLu6Y9NIzPzfH59569x8Q+vQUk777xt2tQusX/7keJBxgusHQgA9iC3S0AAAnLdTUh7Roda2aogLNkJiSarmmLCasvSDg/6js1+jrmtZiUME1+BliNg7sGLuHav96grb/KSFH/HlUC3AjVXrl8ydF2gcglWaeHnQXNX363R8kg/abNeHX5MwqMW45qJw5gr5rU5YjogydUjf4u7ZAbPidU3yk9kI15uWbgVLeAot1MPDztwikARSmSHfwp/hH8867K2Mb7ZbeRinFUHYz0pxRO9pCEH1MHzXIHxNvcDKUjycGmfA1Lvsed5vN1mDIZXFjak8zJtZ+fQy2VnQaPgly0gv/SB7+egQnBkHquI27ri6XOV7XxXEBhkZ54Z8ZnNnxd2KHqumn9XgnTphKw1/p1O9AnsUwwthApwQrvgLoZ0mjDvx+Hy8c8yvL4WSPu//qR758gAaO+RNw0jkFd5azOxnqg3pCW3dB3A5zL+McrQxDHAMCnuSxZfc8LuyPtgZ3SL3s80fvEdcEXgYUiMaZNzTDjqahe/9cF1TLhmeI2rlU2gGZ7J1eSBTtAnfyeNd7Kgizage8lcRz72GDjbYHh8ErA35Wlk4/5dN338o4I46QrVckEBZUizwz7wSrCrCm4OhYhXhR1FRIGfijIPm9iFuhYbi+l3pgo0BbIoukYXu90HCNfKwyO65ljADgesLPtOtfIcEHMsidyd+Tzey3N5ernYtwi4Cmy9gX1uN+wkSfT80UmyDFuNWSGG6DfkxXQzazr87g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(122000001)(91956017)(6512007)(76116006)(64756008)(38070700005)(6506007)(53546011)(110136005)(8936002)(66556008)(316002)(54906003)(508600001)(8676002)(26005)(31686004)(4326008)(186003)(2616005)(38100700002)(66476007)(66946007)(6486002)(66446008)(2906002)(31696002)(5660300002)(83380400001)(36756003)(86362001)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnBydXpvVXA2TjdpZDd5RHRTc0x6MGlGcnJvZ2NWUENEbmJDUGo2TXJObVJ4?=
 =?utf-8?B?NU1aelo3cU1ZVkd6WGVYVWN3ZWNac0h2RTVFYllBeGdBMTg4S0d5VzJEazVO?=
 =?utf-8?B?L1VOWVh3MHlkWnd2VkZQSkMwUXBYZFNnbndiVVpucjhMQ3JjdzlNMDVTeVo1?=
 =?utf-8?B?UkRXTUdhRmtDYldiVXJqTndVQU5PWHZQVFBJYlZ6bFBTdUFYd21NTGtJaWdi?=
 =?utf-8?B?YTlzNHRPN2hocVRXWUhYSnpFTFNwUG40RE9WS01wc3Rram52dnpRZ0RHSWVL?=
 =?utf-8?B?OXdXdlNiZGlXSnVKT09HN0Z2OVZBbUpYTUhKU2NsSXhmeHNjenZCM01ubGs5?=
 =?utf-8?B?RDhxUzYzNVpmcTkyVG1Pc2VKcEcrSFhOWUVkbzNCRlVwZjB2a2RDcStEdTFh?=
 =?utf-8?B?TXZxMldvT1UrUnlVNytpQjVTRFpHM0szOE5SUmhSM0kreUV1VTZ6ZGhIbWJt?=
 =?utf-8?B?bnFzeFdUL1V1dWlCa0ZnVStiSmRsN0lzQmdyQlRLR0g0Tk0ySkpDOGx6aDNy?=
 =?utf-8?B?WVpzaVpwaDhBS0NBQ3ZnREcwVXhLaXNUZE5GWitIWXkzUjlxZ0MxTnhQL2hU?=
 =?utf-8?B?MEs0cnpyZkViT2FMZitjaUZWYnpncGxGNkZ2NnUzeFg1bnNVcGpoaUNCTHc1?=
 =?utf-8?B?VUxUTWxYNElqQ0JkcmtMRmZQR1BTZEtQdXk1VFFzYzZoZWdlT2pZNS9VazlI?=
 =?utf-8?B?ZnRrL2xVSG5VUG9odlJ6YVRaUFpBUnRxb0FMV3lYSTNSMm5jbTU3UlVub3BH?=
 =?utf-8?B?MGYrMUVWaFN4OTUrVlg2a3JMUXMwWGNoclFkaXdIdzkzcDZ0ZVpzUS9xMkNq?=
 =?utf-8?B?L0V0UUNvNlFNV2FmWTBMT251QllLMHpOc29lTHVLL3I3aEh4b05YVVIrNUoz?=
 =?utf-8?B?WnhvY2xzY1FiSlhxWFNrZEVmcTJMYXhjRkdaaGpqY21YOHpQcmNKRGl0SUpl?=
 =?utf-8?B?ZjFhdU5qNGkrZ0pNd3htdzZad3NFWkpTRmZBSlRnUnY2aGtVNytXWjU4RHQz?=
 =?utf-8?B?cStFU1Ivd2J4cGFmcFVmUU9oSXVsbnQ4Y1NYRW1GdUNVWkRqUzBJWEZ3S2RS?=
 =?utf-8?B?QzBNMVpnQmlHNkN2ekM0bXB3K1VkdzJ4T3YwNGVpbHNPaE83SmZFREY3OXRn?=
 =?utf-8?B?VXJHYmRRM2FMWkFrdGhCSkZRM2h4eUhMNS9xeVQ1UzRNZGhMQ3AyaFpkMENJ?=
 =?utf-8?B?eUtpZG90aTZBMUZ6Qm1nVkovZ1Y4bSszK2R6M0t3NW0vakRHZVdvOEF6N0p4?=
 =?utf-8?B?U1FtZ3liaWR1WWpXeUNDTHpBMFJtYUZtY3dVL0NVbzlMU0N6NVA0Z3RLclB5?=
 =?utf-8?B?azJvZDBmeXNTTHFjamhHMW9zcDl1VUlwZy8zSUJHVHhVRmw3bGY0NG5TckNt?=
 =?utf-8?B?Nm1KVkNWVC9xUlNtRmdNRjI3VmVMK1kwRzhTSkJmR21EeGRhVWR0MzNtK1pQ?=
 =?utf-8?B?bmhJMzRrWVloUjA5M1YySzFYY0cyeXhmWWZlMzg0WTMwV1NwMkR5Nld3VlQ1?=
 =?utf-8?B?VFllMCtva3JRVWd5c2ZLd3BUR2NJNXgxMW16TmVpQ09jc3RJUXlwallJMHM4?=
 =?utf-8?B?RDRWWWhLeHBuWllHS1kvczF5dEtWc2Z2TTFvZGJHL1UvMlo2R0Q2L2VSSy8r?=
 =?utf-8?B?R0tPSWVva1c5MVFhTUVJZGh4RVJTUjVjUjlzczZ0RTZwL09VcjRTQWpucTFj?=
 =?utf-8?B?VzFVeU5xd0ZYMHYzRmllcU9Td054eE1qZDZQS3Jpd01JbFVWam51UHVWVzlp?=
 =?utf-8?B?YkNFeWVJSUZvYnZnZXFVVG1lYWtlSnhzL01YZHpITE0xdTNvNDRaamtPNWpl?=
 =?utf-8?B?NEtUTWUzaFFOSUI0SXhBYnFoSC9HOGJjMnJibXl0bFoyMnNOL0U2eVhwTXV4?=
 =?utf-8?B?SUdTR1VodU1CMDY2ZG9wM2xKb3ZVa1RneTAvVlpWVWZ0OXVjL2I0RUhhV1pQ?=
 =?utf-8?B?TXByZmgzK2pIY0Zja2x4N29NUHJqYms5TGovMVNqdG1nN1kySGZBNUk3Y3lr?=
 =?utf-8?B?U2M4enZBOG9ER3NIRWVzODI3em1mN1BvbVljYVhZeWVwbkNXR2liNHk1ekNZ?=
 =?utf-8?B?TmgydjRudDV3Q2JDQ0RmSzlxOHhqZG9LOGN1OWFCa3c0eGgxVjZoRFgrUVpX?=
 =?utf-8?B?YzJUb0FRL21xYjRsaEdESmxwSkpFZ1YrWGRGWnh0MTdOR2VCWEdZa3k5Q1RD?=
 =?utf-8?B?d0NYaVhBdXRuNGdQY3ltSDF1VC9SbUthY0IycVQ3SkNOUUFYTDd2S005OGp2?=
 =?utf-8?B?WGlhYmd1UXlvZEZLWHFTTDJYSGlRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0F1A545C408E648AC3A9F3446CA8B38@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5156db62-ae0a-4f78-f2ea-08d9a383b130
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 13:20:25.6243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8+8aGtNTYzXHAY1qP5W0pbj7pi7kl9N9wjDpiZ1bJBeP53NMCywnw1kT8/MTgupJbwJocHclkMYXjPmYBijZHwdfHHrT0YutsareBHSH1dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1933
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDkvMTEvMjAyMSAxMzowNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAwOS8xMS8yMDIxIDEzOjU4LCBD
b25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IE9uIDA5LzExLzIwMjEgMTI6NTMs
IEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVu
dCBpcyBzYWZlDQo+Pj4NCj4+PiBPbiAwOS8xMS8yMDIxIDEzOjE2LCBDb25vci5Eb29sZXlAbWlj
cm9jaGlwLmNvbSB3cm90ZToNCj4+Pj4gT24gMDkvMTEvMjAyMSAwNDowNiwgUm9iIEhlcnJpbmcg
d3JvdGU6DQo+Pj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pj4+DQo+
Pj4+PiBPbiBNb24sIDA4IE5vdiAyMDIxIDE1OjA1OjUxICswMDAwLCBjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbSB3cm90ZToNCj4+Pj4+PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPg0KPj4+Pj4+DQo+Pj4+Pj4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmdz
IGZvciB0aGUge3EsfXNwaSBjb250cm9sbGVyIG9uDQo+Pj4+Pj4gdGhlIE1pY3JvY2hpcCBQb2xh
ckZpcmUgU29DLg0KPj4+Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiAgICAgLi4uL2Jp
bmRpbmdzL3NwaS9taWNyb2NoaXAsbXBmcy1zcGkueWFtbCAgICAgIHwgNzIgKysrKysrKysrKysr
KysrKysrKw0KPj4+Pj4+ICAgICAxIGZpbGUgY2hhbmdlZCwgNzIgaW5zZXJ0aW9ucygrKQ0KPj4+
Pj4+ICAgICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NwaS9taWNyb2NoaXAsbXBmcy1zcGkueWFtbA0KPj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gTXkg
Ym90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIERUX0NIRUNLRVJfRkxBR1M9LW0gZHRfYmlu
ZGluZ19jaGVjaycNCj4+Pj4+IG9uIHlvdXIgcGF0Y2ggKERUX0NIRUNLRVJfRkxBR1MgaXMgbmV3
IGluIHY1LjEzKToNCj4+Pj4+DQo+Pj4+PiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6DQo+Pj4+
Pg0KPj4+Pj4gZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoNCj4+Pj4+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvbWljcm9jaGlwLG1wZnMtc3BpLmV4YW1wbGUuZHRz
OjE5OjE4OiBmYXRhbCBlcnJvcjogZHQtYmluZGluZ3MvY2xvY2svbWljcm9jaGlwLG1wZnMtY2xv
Y2suaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPj4+Pj4gICAgICAgMTkgfCAgICAgICAg
ICNpbmNsdWRlICJkdC1iaW5kaW5ncy9jbG9jay9taWNyb2NoaXAsbXBmcy1jbG9jay5oIg0KPj4+
PiBSb2IsDQo+Pj4+IFNob3VsZCBJIGRyb3AgdGhlIGhlYWRlciBmcm9tIHRoZSBleGFtcGxlIG9y
IGlzIHRoZXJlIGEgd2F5IGZvciBtZQ0KPj4+PiBzcGVjaWZ5IHRoZSBkZXBlbmRlbnQgcGF0Y2gg
dG8gcGFzcyB0aGlzIGNoZWNrPw0KPj4+DQo+Pj4gVGhlIGVycm9yIGhhcyB0byBiZSBmaXhlZCwg
YWx0aG91Z2ggbm90IG5lY2Vzc2FyaWx5IGJ5IGRyb3BwaW5nIHRoZQ0KPj4+IGhlYWRlciwgYnV0
IGJ5IHBvc3RpbmcgaXQuIEhvdyB0aGlzIGNhbiBwYXNzIG9uIHlvdXIgc3lzdGVtPyBUaGVyZSBp
cyBubw0KPj4+IHN1Y2ggZmlsZSBhZGRlZCBpbiB0aGlzIHBhdGNoc2V0Lg0KPj4gSSBsaW5rZWQg
dGhlIHBhdGNoIGFkZGluZyB0aGUgY2xvY2sgYXMgYSBkZXBlbmRlbmN5IGluIHRoZSBjb3ZlciBs
ZXR0ZXINCj4+IFsxXSwgd2hpY2ggaXMgd2h5IEkgd2FzIHdvbmRlcmluZyBpZiB0aGVyZSB3YXMg
YSBiZXR0ZXIgd2F5IHRvIGRvIHNvDQo+PiB0aGF0IHdvdWxkIGdldCBwaWNrZWQgdXAgYnkgdGhl
IGNoZWNrZXIgYm90Lg0KPiANCj4gSXQncyBub3Qgb25seSBhYm91dCB0aGUgYm90LCBidXQgZGVw
ZW5kZW5jeSB3aGVuIGFwcGxpZWQuIElmIHlvdSBkaWQgbm90DQo+IHdhcm4gY2xrIG1haW50YWlu
ZXIgdGhhdCBjbG9jayBiaW5kaW5ncyBzaG91bGQgZ28gdmlhIFJvYidzIHRyZWUgb3INCj4gc2hv
dWxkIGJlIHByb3ZpZGVkIGFzIGEgdGFnLCB0aGUgcGF0Y2hlcyBoZXJlIGNhbm5vdCBiZSBhcHBs
aWVkIGluIHRoaXMNCj4gY3ljbGUuDQpJdCB3YXMgbm90IG15IChvdXIpIGludGVudGlvbiB0byBz
ZW5kIHRoZSBjbG9jayBwYXRjaGVzIHZpYSByb2IncyB0cmVlLg0KQW5kIHNpbmNlIHRoaXMgaXMg
bXkgZmlyc3QgdGltZSB0cnlpbmcgdG8gdXBzdHJlYW0gd2hvbGVzY2FsZSBjaGFuZ2VzIHRvIA0K
YSBkZXZpY2UgdHJlZSBJIGhvbmVzdGx5IGRpZG4ndCBleHBlY3QgdGhpcyBzZXJpZXMgdG8gZ2V0
IGFjY2VwdGVkIGluIA0KdGhpcyBjeWNsZSBhbnl3YXkuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+
IEtyenlzenRvZg0KPiANCg0K
