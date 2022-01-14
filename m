Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F97A48EAD1
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 14:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241353AbiANNgC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jan 2022 08:36:02 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:24947 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241343AbiANNgA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jan 2022 08:36:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642167359; x=1673703359;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=x0ZIDT/f/Yv/si8+tvV8M5yI5P+VCzG7kk8/+rwcMjs=;
  b=wjsU7kxpBp3zIgtyWc9doXqUzXkTGlxy2cMJOHflKEIXrPJ9ERdt4203
   A4AKB10hX7leeqJd3qkQ1+c0WDYpMfZ511/cSwIcyln5rL+etL7hHxoZP
   1SFydDVatBdXccVmZlbrLGglnzzAVo2ii81uum+fvBmF/ppEx3Gw4wqi1
   XF2FqVFJDsZu8ADyM06AVOUZ9wyxN/yDuqJMiKm0vXGhTYYbsG17LZh0n
   +VjzkqUQfWoDwO1oyI3zTzq0vYTD1DUZxQqAC2MFsVIib1X7zVavKbSci
   OuSWHJzUcRDDO85kVyYA2vMwoscDMPNJEMIOavAgGdKunBmJ3HWEa9Jxd
   Q==;
IronPort-SDR: mQYChvmdbJMym3//f/lpad/vSJgSved3uRi7VaSS1Q6j/LgKb7T0BWM/CL66xULjwG0r/+zJY+
 g6gbXW+FTPLqk3OV6epJwhwQxwV9wL2iz1rdvjBpyK/wn5ujEqmKsBDfn4SjL1edWvVHL5YOSF
 GJV4t5jdHJNnlW5TAJpM37Z0XW8HFw5iXRJdaLw5LmDihFZYPPWs6tzkIGu+/WPY4tOiqgnx1x
 Jhpo4ebXx/+AhYYC3UHGDH69ZaVWk4AWMLf2LEtJrK0ud21YuHN+dAjQMRxQtm5zi6hPwXYBJv
 8n99AfUX7QuS8FR/jNZlQPc5
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; 
   d="scan'208";a="82513208"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jan 2022 06:35:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 14 Jan 2022 06:35:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 14 Jan 2022 06:35:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kawDYz+xQ0yQq+X2gv7fTv7UzVULZUU3W7RDo98m733wlOK77xhCDKWlsNUHvp4g5wZxHt2YKHA55vMQHK/sgtOsaHGVOKTZmmj8RU9ptRF5kqynb5fdVDtZTlXFOg4npTLBaZiI/C11g2+hQY7vfpvDGHuvR98N+aIZCTb6dHqGVppzn+3S24ZRpjuBHZ83S/oEuX44pBTzq2iRvYh/fTWQu307ar3S4JcztVY8074EfR33IMbSRScUc6aYD1C8eEciKMsOahTATPtdywTS8ASlnk6CpzWcjcS0H3pGZD2cV3GnrwgFyr01YahMe4A7o/rwEyo4F2urn12KHoE+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0ZIDT/f/Yv/si8+tvV8M5yI5P+VCzG7kk8/+rwcMjs=;
 b=PkReSfvd3q+GsDkKetgNFNANzXlt6S0GBYdNd0Y4fA+RX95yiCLwTCpgbBkNqpGd2wTXZhz49chLmuAtGbqBoQ63wgKQ7khR+r5bdgK+CV+h1GjVC+f0AzX2cBckf4x1s7o0UKzza+x9R+4Ws9twc/4at4bu9hY4LNV2f6Gd8Hl56GvhqWnL/Wf4Kl/YeOJA6sY26kWhlfSWDdxVsdldypUw5CvRb6yyI5O0/ynsbqb564XdwgdMysOx9CQpXNHKeicE4tZ1w6bgD3j6UkBbJeUhaw7zULut71jIHZH1XkdXCPY3QLHttC0Haz7AD0BApRu/+wKLDI8RxNrosusQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0ZIDT/f/Yv/si8+tvV8M5yI5P+VCzG7kk8/+rwcMjs=;
 b=IX2QZsIp/bxjw7fdrDrkxDDkdJkbRJCrQ4xNxcTzCFaHNgqv0X8EnNKBsOEL9OmkUc7FfDgQVZ6x9080oyjt9fwkQkabBiEtFRNiYuciJG4W9hIb+5oVSK/P68NN0EXS4O/2fmA0r36qJIWiHWfTV0XLRG2+9Vvp/mwoHmOmefo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by DM6PR11MB3579.namprd11.prod.outlook.com (2603:10b6:5:13c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Fri, 14 Jan
 2022 13:35:53 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3%9]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 13:35:52 +0000
From:   <Conor.Dooley@microchip.com>
To:     <geert@linux-m68k.org>, <robh+dt@kernel.org>
CC:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <broonie@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
        <lee.jones@linaro.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <krzysztof.kozlowski@canonical.com>,
        <bin.meng@windriver.com>, <heiko@sntech.de>,
        <Lewis.Hanly@microchip.com>, <Daire.McNamara@microchip.com>,
        <Ivan.Griffin@microchip.com>, <atish.patra@wdc.com>
Subject: Re: [PATCH v2 14/17] riscv: dts: microchip: add fpga fabric section
 to icicle kit
Thread-Topic: [PATCH v2 14/17] riscv: dts: microchip: add fpga fabric section
 to icicle kit
Thread-Index: AQHX8ylFKW6kqD5p50ew7h8tB9OgBKw2sbwAgCv/9oA=
Date:   Fri, 14 Jan 2022 13:35:52 +0000
Message-ID: <5b5deada-b9d5-5e35-7876-f5b94e792cf2@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-15-conor.dooley@microchip.com>
 <CAMuHMdV0N-15kNZ1fnzaj_psNVCRUQP506Noc-tHawmgxqCVeA@mail.gmail.com>
In-Reply-To: <CAMuHMdV0N-15kNZ1fnzaj_psNVCRUQP506Noc-tHawmgxqCVeA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1aed9974-c3f0-4c6e-044d-08d9d762c905
x-ms-traffictypediagnostic: DM6PR11MB3579:EE_
x-microsoft-antispam-prvs: <DM6PR11MB3579A43D7A556030F03FABFB98549@DM6PR11MB3579.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mlKJcGOHKObCZJzEpQ1NBlezUjbuanp4r4pkCgjnxlGnCTYEgW8d0Yu5/0iXM2thCmxXNwi1rHRk7n16EF79nMW0m5ym0k24LsoQtTnlSGYhEAwLkqMzVV9CT900VezKhiq65fWKwN8k9SwNaR1ggGcp3LhLtZcpz7+nvW8vb3wfpCKVPLsy4ppoy/LxCwL6+eT9ewRnxymgK9abvUeaYX8nKW+PvNiEoiSou7LxgjNmSoB4Xk8XAFe34bj5FGIRKKgXpgpyPza9+B/Gkt0/FFUu456WkW+NAtEi4b206cZSOYXOE7xSyBbqUpg2MLy/zsjqdaPsKDq2SUsk9QdVlFIz1y3XyUT9CQJzc/UON5raVP2Gm8de8MTefWt4dlYVhRb/45ndVJ/jjzbywinrPbvIkBD2JSH7w+RvJ5y8tkW4TkjMlFOdz9RcabqnaEnJNHmda2y0+FAM0aB8WFGCekX7I+0kD0OQ8rUVv/NBi08hCFNceMI9bqixKNFN0/xqYqhciXJ79+4eHj6VsoKeDtW3eGaE0Poj2PbTmj030dewxMrH95/AS427NKNmXXQpwtbCOyffxpTCg2SeMc+111wyLYFeLLcMWxSVqeI1I56Izhw2S27N0b2Pzz+GFDpCt9jCklODfstM59Tn4YQZuVMUnhapQOVYqDS9phPikNY6SAEO5DnmDf1DDr4eGw/zLKG6MK/MFYeEkbm3BsUjrMvS8F6VgsMr+onLAc8z1nA7i5m76YEQUSUU0HkrMsRgeTg0JVfmeRYWtP606vC+bw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(31686004)(6512007)(36756003)(8676002)(6506007)(54906003)(83380400001)(122000001)(38100700002)(7416002)(38070700005)(86362001)(8936002)(53546011)(91956017)(186003)(66476007)(110136005)(26005)(66946007)(71200400001)(31696002)(4326008)(5660300002)(66446008)(6486002)(64756008)(66556008)(76116006)(316002)(508600001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vzd5T2RGOHhrYy8vbzBvUTJuVVQ4OTgyK0NWY0ZaemcrSGtnM2Z0SkJVQjhC?=
 =?utf-8?B?cjlQSXpFaDdLS1dOZmRyUHJ3NDNldUcwVE8zVlp3bHRyTWl1K0ZiS1J2MlJO?=
 =?utf-8?B?WlpObkU3blVycnU1ZVQyVkF1eUxzQXRyeWNtdnNldWdpTjFCaU52WWZmSEVx?=
 =?utf-8?B?ZEoxWHd1Mkx4bkxSNmVKeHlkaUxoOURoMTRhRm9oVHROSGl3N01KeEtiZ2cy?=
 =?utf-8?B?UWtOZWFCeUZXZlRMaDZKQ1A5cWQzL3lOa2MzN21nc1BtUk1GVzY4eU9EMFJm?=
 =?utf-8?B?RkJIOFJKQmlkZHplSXRpOG5ZT0tuR3lkQkYzSUVGci9WdVJKNU9uNmZoU0Yw?=
 =?utf-8?B?MzRCZDN3SXZHejk2VHF6QU9EVmVpKzlEUTRCMkNJZzMzZlAyblJwMGFJN3dj?=
 =?utf-8?B?MjQ4SjlRZnZUMkUxdUJMRzBLZHN3bzhwNm1iV09seE1ML3JtYk1rNXNRSmJn?=
 =?utf-8?B?dEtkQVF4a2xTWHBKN1czSnNNcDBsQXEycTBSZ2x4eUtwRGYxdGltS0R0UmdY?=
 =?utf-8?B?MFByeHJkNUtURWlXZ1VUNUM0VWkxekR0ZWhFQW05UEphdjZVbm8xL0JlMXRE?=
 =?utf-8?B?bER3TWJQdVJBUVpBTzd3ZG84bkliSkFUUDBTVmdpN0NvR0J2czltR3AzZ0hv?=
 =?utf-8?B?RXNBV3E0TGNIMnk0QitFSkZyV3NXck5yazVIanNoNTB6bTVERFF2bnpJcnZv?=
 =?utf-8?B?QzVlRFlzZEpmKzN6Tmkwa08yTmNnSjRSVHhybmVwL0FBT3FiOHdleXlUL2N5?=
 =?utf-8?B?OHJuU1JyVXNhZTZVWVRLUGJ3aU1SUlNFeEJqRUNPTzJzNTMzVThGajh0Qnd4?=
 =?utf-8?B?NTVHTm1GdHhLZlFWZWIxSVNmZ3V1NHNZOElXWkFNeFZCNVBNUHF3REZUZ1g1?=
 =?utf-8?B?OG5RcHdidE5jK1VHN2dEblNYMnF0NUZmRVRvSzluYTVhSnhrTmw0MS9adkxV?=
 =?utf-8?B?VXFtaEp4V0lOekJFU3JCazQ0NDl3RktQc3V1YlBjVVgvZzVEcDZ0bzl6eEht?=
 =?utf-8?B?TDBpRllsd2txNklPNjkrUFB5eGlKTHdCS01JdWt2SStiRnh4SnAwa09NcDRw?=
 =?utf-8?B?RzRzcGpGMGV3dGJhREdwZEpHODl0M2dWSkdJZUhJWWluV1M2UC81Z3pkWWhq?=
 =?utf-8?B?aGhrQzVIUXAyMDBrcmVxYVlhbytRQXNHQTNxLzlnNjZBL3VSYlJnalQ5c2NH?=
 =?utf-8?B?MkxjbHFNc2dqaXdVZlYvM291NlM1S0d6VmVNQ1BEWDlEZnhTNlI5akloYUoy?=
 =?utf-8?B?K1cyU2Jyc2MySVo0TWxhcVg3S3BWT3lDbDR3eEdrdlYwNzJ1OEZGZVJEK0JU?=
 =?utf-8?B?RTZWSHBRaUlsTG12bGpFVkFLaW9hUGhnbmd5K3lDeDlTMG82S3dVMk9XWndy?=
 =?utf-8?B?Sy94em85YURjWXRGT2hZRVMxbEhoTjVDMXg3UExWN2dLR1AzWXh2b2JlVUQz?=
 =?utf-8?B?V2lkQUFQMmIvb2FTdHRNcnNkVVc5bkZSNW5rcFJacEV5TlFTYktGVGxnOG9Y?=
 =?utf-8?B?QmMxNk1zV2s3bUlnSVpIZ1kyMlhNRHhnZS9JQk9nbHA4aVArYVZZYTlmTU8x?=
 =?utf-8?B?Y0JFMUk1UFlGcVpSNUJ0Z2Z3MUJHVmgyOGcrc01yd3FZb3FnV2MvaWxTV2Rj?=
 =?utf-8?B?R2ZuNmkzT1pjd0llcDhtL2RmNTlyUGZiTDFjTi9QekdmNlh1b3Fla1pmeThI?=
 =?utf-8?B?QzJKcEVkc01hZTMrSGRMd2JnZkc3anJ0ZXNEalBIUWswOGNPVklNKzZqNmxS?=
 =?utf-8?B?aHo1d3I2SldiRnlMa1JWR1ZQUkRJdFVyS2s5SUdaUTFpZUNlQ29SUmpFeUtQ?=
 =?utf-8?B?WTltZ2N6SytWSWZaakE0d0p2OENoK1cxOC9qK2hZbVZpcEdoUC8wUFRzZC8x?=
 =?utf-8?B?Um1Pa0c5blRLNjVhWEdTQk5PU29maEg0NnFLbVhMa2dHd2d3NVBOb3VnNGlF?=
 =?utf-8?B?bUM0UnRxZEw1YmNMRnBGWExqb2l5R2hqb0FHWXE5V0VtSm54RlhLakgyNFY5?=
 =?utf-8?B?WFhwRGR3ejkxSnhnYmtMS3lSaTFnUWpsQmk1WnJ5bysxU0xIRW1XOHY5QzEv?=
 =?utf-8?B?N2l4M082eDNJaXBmbXNXeWZRY3NwSmRTWUxsVThtV0x1QUVxYkt6R0QwZHRp?=
 =?utf-8?B?aCsxa0JsaDlpUFQ4dENIWlY4OWtIY05RQzE1Sk9BejN4REdTOGVFMUozQmt4?=
 =?utf-8?B?VTRQUmF1eUJEQTBTYnlXTjc2eGpqTEJYUDFBc0EwMXJiUmkwcHB2V0g3SlRQ?=
 =?utf-8?B?TnFIV0lNZDVhVEJWOWFjQXdjMzh3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5913DF09F0240C428DF89194B4A70127@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aed9974-c3f0-4c6e-044d-08d9d762c905
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 13:35:52.6921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +q1FxoUuH0yyJ1r5UIs0/g20aR7SySoPYD9lZO17y0MHYwjRzigQ03uB6EQMqas2wgrHmdMzGJ4UOVj0zZt7xKKwBcwi/CG3ddEzr95oYL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3579
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTcvMTIvMjAyMSAxMzo0MywgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpIENvbm9yLA0KPiANCj4gT24gRnJp
LCBEZWMgMTcsIDIwMjEgYXQgMTA6MzMgQU0gPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3
cm90ZToNCj4+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+
DQo+Pg0KPj4gU3BsaXQgdGhlIGRldmljZSB0cmVlIGZvciB0aGUgTWljcm9jaGlwIE1QRlMgaW50
byB0d28gc2VjdGlvbnMgYnkgYWRkaW5nDQo+PiBtaWNyb2NoaXAtbXBmcy1mYWJyaWMuZHRzaSwg
d2hpY2ggY29udGFpbnMgcGVyaXBoZXJhbHMgY29udGFpbmVkIGluIHRoZQ0KPj4gRlBHQSBmYWJy
aWMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+PiAtLS0gL2Rl
di9udWxsDQo+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9taWNyb2NoaXAt
bXBmcy1mYWJyaWMuZHRzaQ0KPj4gQEAgLTAsMCArMSwxMyBAQA0KPj4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBNSVQpDQo+PiArLyogQ29weXJpZ2h0IChjKSAyMDIw
LTIwMjEgTWljcm9jaGlwIFRlY2hub2xvZ3kgSW5jICovDQo+PiArDQo+PiArLyB7DQo+PiArICAg
ICAgIGNvcmVQV00wOiBwd21ANDEwMDAwMDAgew0KPj4gKyAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAibWljcm9jaGlwLGNvcmVwd20iOw0KPj4gKyAgICAgICAgICAgICAgIHJlZyA9IDwweDAg
MHg0MTAwMDAwMCAweDAgMHhGMD47DQo+PiArICAgICAgICAgICAgICAgbWljcm9jaGlwLHN5bmMt
dXBkYXRlID0gL2JpdHMvIDggPDA+Ow0KPj4gKyAgICAgICAgICAgICAgICNwd20tY2VsbHMgPSA8
Mj47DQo+PiArICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjbGtjZmcgQ0xLX0ZJQzM+Ow0KPj4g
KyAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+PiArICAgICAgIH07DQo+IA0K
PiBJJ20gd29uZGVyaW5nIGlmIHRoZXNlIHNob3VsZCBiZSBncm91cGVkIHVuZGVyIGEgImZhYnJp
YyIgc3Vibm9kZSwNCj4gbGlrZSB3ZSBoYXZlIGFuICJzb2MiIHN1Ym5vZGUgZm9yIG9uLVNvQyBk
ZXZpY2VzPyBSb2I/DQpJIHdhcyBhYm91dCB0byBzZW5kIHYzIGJ1dCBJIHJlYWxpc2VkIG5vdGhp
bmcgaGFwcGVuZWQgd2l0aCB0aGlzLg0KSSB3aWxsIGxlYXZlIGl0IGFzIGEgZHRzaSBhbmQgc3Vi
bWl0LCBidXQgSSdsbCBiZSBhbGwgZWFycyBpZiBSb2Igd2FudHMgDQpzb21ldGhpbmcgZWxzZS4N
Cg0KPiANCj4gQlRXLCBkbyB5b3UgYWxyZWFkeSBoYXZlIGEgbmFtaW5nIHBsYW4gZm9yIGRpZmZl
cmVudCByZXZpc2lvbnMgb2YNCj4gRlBHQSBmYWJyaWMgY29yZXM/DQo+IA0KPiBHcntvZXRqZSxl
ZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0N
Cj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEz
MiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9u
cyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3
aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9y
IHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0tIExpbnVzIFRvcnZhbGRzDQo+IA0KDQo=
