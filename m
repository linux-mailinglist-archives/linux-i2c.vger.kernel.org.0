Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63363478FFF
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 16:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235373AbhLQPdZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 10:33:25 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:49768 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238290AbhLQPcx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 10:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639755172; x=1671291172;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Bisqq1o+ldEqxGvyiBNrM8RTJ0J6bCWVtlmz1a9G2nU=;
  b=YeJ0dkAFV1H854+eexCIetjXrORepnW7GDmvH2m3MOxXWeFIqHUlVqpD
   0iwpNWlWxYyoSPhI2IndwEvqpp6D3LQRrmnHzhJjDBkdm8MtQDP6MElF8
   IGMmzIcTqnDlkZgSfIAw0UlxcvODwIJGMIRri29esg6gWmpOB1W/BYf8S
   COvPI1as1VaJSAVdh1rwdEz4FMNYlmCaFfUhM3HN0Rnt077TIYGgSDmaW
   KtuMpfBqeLi6eInYzitRAFgflP2survTSAV/TLLLb00tOHwrkDPFkHaAU
   ds2Hfr6k7mr7ZqyozjJhXWY/KPn8O/eipJHEDS5p/i75EYYVelFhZ52Aq
   w==;
IronPort-SDR: oHXFDyOP7Zy8AuQcs8nEUvXpkTWBTqvVwm/FcXWarjMlacJYF2b88acjiLzgk9JVbec0SsUSVZ
 3PiTf37iGezqvKw5D2anqgSEgSdKhFYHBK1Cs+MZ3ZBWk+jr01vaQ7A6y0OMoIlPhNmVAx2uL8
 a3h7DzJsxNqo+t0Bx1+p/CDV1/+iNkXyMDpDfTKuJ+ge+3yc66jwWFroh9jc7TY+hrhrzG+8Fm
 h4KcTbxNH+CnPLjHhOlpQk+LBxpgHBgB+U3LISqOpVHn5J4li5O4UtwJAu+iQ+q8+8pHX7vxXS
 TA7JQZkXTWe28gJG6nXrBqa/
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="79928072"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 08:32:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 08:32:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 08:32:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlVjelGPp33ltvbJT3rPq9E0YvQohJ2EXAlZT/a7k/k2jmi83ceKXTzVJTF0EOsCRfYszMBEe80z0pKjYla37m+D1Xp6SXpFH4Um0WUptJ5lQ4IfCMtzkF9pwI+c3fNcaJV3JopeC8LnmpqesQIgFU3tjTzNsl6FJT/iW3vLiArZYfwHpk8UwdSPimDNdGyNhkfoI3vulQg9S0NLwOVd+J8Rki2oJaa+IDMq5ueDjj6n2kFthyCn5N1mBJ9ohW4b7q7O57CqZ9K3jEGUj7WOfHK/ZC+qou42xkHXt6VS1Cukn7uNCTEbZdWfPaRQ/ZyNY24NxY9FeDtSCPZVc7GQXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bisqq1o+ldEqxGvyiBNrM8RTJ0J6bCWVtlmz1a9G2nU=;
 b=mI05c7Fk744PQYWsGBpFXIM080ZpXWaV4k2blpdT1YofG5dxDTdmW6mUfmqFvAecx6hJ7Vn2lTbKXup7A1vZijBugtciVgVRSjbkKOxPg6W7qazMtNDdoLquFFdfmUzqmc4/pGM6uH8BlfMpUjOJXu93BE98U41nGSqxE4J3BX/Z4HaEBupxTmdcVXQeYqN7lDAVN2H5kI5m7jrI32ganSB+L3YTAAmQAhLqnaks0+bVl5mmiqze3G4EPbfrOiIXfEsYJk6CCiNJT+b3UwVFTOagD8VPrGxMa3x0th+ZFBUefNPKEsIOWHp35M2y0FfenWv/4PcfebgvAXPHaepMyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bisqq1o+ldEqxGvyiBNrM8RTJ0J6bCWVtlmz1a9G2nU=;
 b=pPER+/SnmfbnOyhu6giUrda6jhDmcgCVloryBbVio4Li5MdvBOs9s8IBMLzJAz9WGznnJMvDv4+H8kn1s6ESHVlIKYKPaCf7O83GC4QfDOkrlGfIsl3mk1Bqz6MV/sUbxXaCJGS6gNAuZuYrwmTBP76q9jzCJc8MzWbSipD8Jn4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1696.namprd11.prod.outlook.com (2603:10b6:300:23::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Fri, 17 Dec
 2021 15:32:47 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b%9]) with mapi id 15.20.4801.017; Fri, 17 Dec 2021
 15:32:47 +0000
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
        <atish.patra@wdc.com>
Subject: Re: [PATCH v2 14/17] riscv: dts: microchip: add fpga fabric section
 to icicle kit
Thread-Topic: [PATCH v2 14/17] riscv: dts: microchip: add fpga fabric section
 to icicle kit
Thread-Index: AQHX8ylFKW6kqD5p50ew7h8tB9OgBKw2sbwAgAAfJwA=
Date:   Fri, 17 Dec 2021 15:32:47 +0000
Message-ID: <11333b59-733c-186f-3708-7357f72d7bef@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-15-conor.dooley@microchip.com>
 <CAMuHMdV0N-15kNZ1fnzaj_psNVCRUQP506Noc-tHawmgxqCVeA@mail.gmail.com>
In-Reply-To: <CAMuHMdV0N-15kNZ1fnzaj_psNVCRUQP506Noc-tHawmgxqCVeA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14810de6-9da1-4c86-9de2-08d9c1727a50
x-ms-traffictypediagnostic: MWHPR11MB1696:EE_
x-microsoft-antispam-prvs: <MWHPR11MB16962ACF1EF6314C0748BF1298789@MWHPR11MB1696.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rXWxfH1KTqxSdE3GpcQAdjy013D8kBmy2qgLtBxbQcMe/FUyY9MP3/BN7JGjDmBrndloKb62rqDAFgSTKk55hpvJtEEPXBPUW9Wk5IPLdvj/SHW6VzoegCh37cuMQmtpNv1anKC1LHDFQqowCSneAIKwAx0F/XLLfLgNnxLpxLC5R8htXj0ad0S7uPxclbnDoCaADtUM95N/MPoiJ5Ha0oCunqSrPNxjJ6/iKRuJMy+w7ouMc87qOnaMiu3wFZOSwEYq21wPIU5jkJUOXf5FLSMsPrmsz1vODQB3aV/l4bK66PtjOcIa0J8JisJ1WkyNLzOcrXrVfMsB/Y9psHxhVLwudsYQ7UZ0xnOp4pctMIVuSvjyIcjKQabCKip0gJJlRFbV9uSd1uknVoC9G3lW+Ii5L+rZqtkd/EMd1Nv2nUd51+zRmW/mdggl1HCXAJJa1LcBYxClFjwan5PAkhCRssysNH9Njuz7R5Qj15C3L9ML7Cp/gGQ/6TJCCz/muwGg2teHXNn+aPB1+imFsobidnKzEvRZZqP/EYjaJ/kXB3hBroYU4GUGm0NWSyU+6z0liOvlxtYeUwlANzrv30h7btff47jhMfjF+gWjtO1uSvZzNeGoHBCbgi9RsU9GFp90KAdxi44qfdmiI7CheVRYHPJcjfNW8HNp5kTDKxI3sc6cFNSEzOvM/XEvir69CyqiMxUj0tXqDAh4PD25RgGPoryOHaf/zvMo580VtGzssstM4JwX7bEj0pUqzAn0ZHyjDR5lhqSBAnzZMKS9B6uxdg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(186003)(6486002)(38070700005)(122000001)(6916009)(86362001)(316002)(2906002)(71200400001)(2616005)(31686004)(26005)(4326008)(36756003)(53546011)(7416002)(6506007)(54906003)(8676002)(6512007)(8936002)(83380400001)(508600001)(64756008)(66556008)(76116006)(5660300002)(66476007)(66446008)(91956017)(66946007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N29ZUGQ3SURLZHRldG9sckNTWUlkcFVmV3dhMnFuNEd5VU9ITjBnVTlNaTkw?=
 =?utf-8?B?YWhRdkh0OTZmMW96UWg4M1FDUjNMUFQvQlZINTk3a2U2VEU5TlhaTUJXNjJY?=
 =?utf-8?B?bTVFL0NtUFNYU2JxTXEvanoxRlVXa1FxU3RFMDV5QStxRzdoaGp3aVhOdGw0?=
 =?utf-8?B?VHJEQVhVODZueUFpLzdnTFBEcDRwd1FUYkRGQU9KRE11dFRJK1Y5ZnYzK2gv?=
 =?utf-8?B?SkE3VitSVG4yNnJWaXByb0c0ZFA0bTdZV2hKUEZnVnFqZjBpcm5EZVdsVGVT?=
 =?utf-8?B?NXdFSnREL2RwVVpvOS9VdWF3Z2tpVkNiTHJsVW1DWXVjamFjL3FqSTRnTEEv?=
 =?utf-8?B?L21ybW9TQ3BYa0dZSzlKT1R4Nk1LRFlsZ1NtUFpkZVVlTzJRb1hYbEs3cjhH?=
 =?utf-8?B?WEp4OExHWjdTN294MWRTWmZhVjU0b2VqK3dOZXNPeEVFSS83TFJ4bEVKMmNm?=
 =?utf-8?B?b2JRT3VveTA0SGFPc0J3NDhBbFNMOG5mWUg1STRuL2dVbmU4dFMrQmcyOXhI?=
 =?utf-8?B?QTgxbnBEQkZ2SXIrUGRPM1FTTUEzTFptZldYMW04NHpmV1VBS2k4QUV5Ymxt?=
 =?utf-8?B?V0FjWnlXeU1lUkZNOENKcFVBR0lOR2praWEvby9UdEppbk1GRmxGRWZBaitH?=
 =?utf-8?B?QW9GYndzbmVLU2pQcEVFUDlpcTRwYTFPckRqYk5haUpNNXdDOHpneHc0NEIz?=
 =?utf-8?B?VitkM241N3pzRG5Rb2IvRWN4OUJvU3ZxUmhyS0hJQm5TSVpMaXZ0ZHFNUHBa?=
 =?utf-8?B?RzViOE9hU29ZMzNranR0Zk1zaVJTeU5ibE1EQ01ORk5QVnpzRUpFRnpGWDZZ?=
 =?utf-8?B?akJWR0JJUTFSaU9YZ2tJMVFvV0pRK3MvcEdXclVQOGFsQXh2WUFMaXRLQlF5?=
 =?utf-8?B?OXdORkptS0hrY3l3cXJKZGdkWWtrSnV0YVNuQ1RncFZ3cGpUd1JZNXE5ZU54?=
 =?utf-8?B?TVZ1NDkxZGYraWZHdERnZ1JIb1V5eFNMMllUWFNkbVI0eXVBVWl6bWpkaVVM?=
 =?utf-8?B?TkxTQXo2N1gvcnBrTkdpRmk0Z0I5dXRJUjRVblJkT3FTZEFYMWdCOGdwaWg5?=
 =?utf-8?B?U05oSEdaQ2tudTBFZUplMjNoSEU1dHpDSzFQUXB5bUpwcXpqOHRyS3l3NjlI?=
 =?utf-8?B?Y0V0aUlBR2hlUTRvTmpRbUNCQ1gyQzZwV0YrcWhpaS9HQzcrcjByV0xObDdD?=
 =?utf-8?B?bnJSZllwREtELzFaZ09VbnJWc3RNcVhEUlp2SFhocmQxODg3NFYxcFQ1MjBC?=
 =?utf-8?B?Nk5aNWxnMDlIbmc5WHZuTkN5UWFsZ0ZGZ2lmUHVYQVU3ellPWFRhVnpWeWdG?=
 =?utf-8?B?RllveE5DeTJYRzJEakNXSkV3REgwUDVhY1Y1VkVFYUR5ZmR6T1g1N2p6Y00y?=
 =?utf-8?B?WmF3Slk5TTRXN0dkZWZEZFRlVlpqU0F5bUhxYjNJcUxRQ0xsZnNyM1VHaS9u?=
 =?utf-8?B?dTVmaDJYdG5aMU9BbWlxU2lIRGdSOFdOMHgxVzlsYkZFSVZaZmxTeUhraXVn?=
 =?utf-8?B?cE5RSUl1d1F3aHdoYzFZb0Vlc2M0ZEMyVGpIdzc0SEs0ZHFTL01xN2FVNEhO?=
 =?utf-8?B?RVdXQ2lLQk13cExGdjdRNHZmTUlydHFxeVBDTEMyYjIyVUN2cm9JMFFzZUFL?=
 =?utf-8?B?VVdhSjRJd3B1UXJiVHprcU5hSlFEdTlmT3REb25GRC91QXIzeGR2OGx1Smpa?=
 =?utf-8?B?OEh4Q1hxRytXR2taMldOaURsYnU5bVZSUE4wOXJuK0F4SmlEQmtYVk9kYXBK?=
 =?utf-8?B?QnBZMS93NGtTT0lTRk9lanNsaFpsK3NDNm5JckJwcUFHMkdrajZDZjJVRmxa?=
 =?utf-8?B?aVhqWmNHdHVFR1pFMjBJenFlSmJaZFNESzNtVmtCTVdsR0xpWG1QVmViTjYr?=
 =?utf-8?B?NTA4TXBIRncxelNWTVdxRE44NWowT00ycDQvczZBUS8wcG9BY0Z3Ti83SWsz?=
 =?utf-8?B?Z3JVSmF1b2FvVE9MOGpyVEpLY3AyUFZFY0tzczdsZnNPQ1hHOVFVempLQmtq?=
 =?utf-8?B?a01NVzRyKzA5Y0x3UTlTaGRuT3NVSFdRN2E2cENtWG02UVFyd2R3WkhGK1pS?=
 =?utf-8?B?Q1lXcGZlU1p5bTNCNGY4aFVUU2ZaTytQemI3RTdIUGZlOFlsMTEybkNjVURy?=
 =?utf-8?B?YmdvR2w1WDcyK1FFSXUxdGg5QkhLbkhuUDlXb2tPUlEwRXZ2a3FkcVpKZ251?=
 =?utf-8?B?OVVISmlGWDB0Rk1YUDR6T1JhSmt4YS81Y1BkOS9aL0luUzFaWkoxcDIwd2hv?=
 =?utf-8?B?RThCbHNXMCtHUGFGRVZpNnNJYU93PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FE4DB1D6E5EC142836346CC44B53E61@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14810de6-9da1-4c86-9de2-08d9c1727a50
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 15:32:47.0922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a8z9LXTkFvLRD6tlyyK4lFfC5Oz88t3K7smA4epSyhvii0KDt0jVrY9Wf9YB1yNaLX4uR+5mGnGW4gKah5C0zQQEkOzKyBeVCicdP08wRwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1696
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
ZXZpY2VzPyBSb2I/DQo+IA0KPiBCVFcsIGRvIHlvdSBhbHJlYWR5IGhhdmUgYSBuYW1pbmcgcGxh
biBmb3IgZGlmZmVyZW50IHJldmlzaW9ucyBvZg0KPiBGUEdBIGZhYnJpYyBjb3Jlcz8NCk5vdCB5
ZXQgKGFzc3VtaW5nIHlvdSBtZWFuIHNwZWNpZmljYWxseSBob3cgd2Ugd2lsbCBoYW5kbGUgaXQg
aW4gdGhlIA0KZGV2aWNlIHRyZWUpIC0gYWx0aG91Z2ggaSB3YXMgdGFsa2luZyB0byBzb21lb25l
IGFib3V0IGl0IHllc3RlcmRheS4NCkl0J3MgcG9zc2libGUgdGhhdCB3ZSBtaWdodCBoYW5kbGUg
dGhhdCB2aWEgYSByZWdpc3RlciwgYnV0IGlmIHlvdSBoYXZlIA0KYSBzdWdnZXN0aW9uIG9yIHNv
bWUgcHJlY2VkZW5jZSB0aGF0IHlvdSdyZSBhd2FyZSBvZiB0aGF0IHdvdWxkIGJlIHVzZWZ1bC4N
Cg0KVGhlIGFjdHVhbCBuYW1pbmcgY29udmVudGlvbiBvZiB0aGUgSVAgY29yZXMgdGhlbXNlbHZl
cywgeWVhaC4gSSB3aWxsIA0KZGlnIGl0IHVwIGZvciB5b3Ugb24gTW9uZGF5Lg0KPiANCj4gR3J7
b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4g
DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBC
dXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0KPiANCg0K
