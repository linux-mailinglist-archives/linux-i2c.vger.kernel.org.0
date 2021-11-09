Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B0644AE22
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 13:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbhKIM53 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 07:57:29 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:14444 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbhKIM52 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 07:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636462482; x=1667998482;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ixMUGfEdBbVU1vU9zXKdAaWjgZI0T2LUHYIfr13vB4E=;
  b=zRcA4BCZf9dKibFocf3kFhSnA92oHIuWNJ0gPqs9fIM3Z1kJylXzi4lO
   Vzd/YR9oVhoblxzYkUg1U46LnAOMtDZhEaxy52oveXNv7FKJhJLnrTpdM
   kNhtEi+QPsYQwv3X7BollsefUhnduUnfCBZRBgY6jrM28EQrUWr0KmHbm
   AFj5YUw+xUfyNjsX9aPJSgn9Ah/aad2esAH9yichJ+81mRrc/mvExMMA0
   bOl0F0CZB6S4HSxWdVR3u9wu7aKIEcGu2j8hguD8+H6xV5yh5LJHVmEZV
   YIrA2ieyilc6fUXI4JyK6l27OQu90QKelbz2HLOk9GsALdCCeP0pRp6Kh
   A==;
IronPort-SDR: JudQVwal95oSizLYoIBQD8v0wJGHdAcHyAOeECISdE+wVXstNG7nH8ff+WnxFHtZX5vW1UBnBV
 0H0WKdaWAVgWi3b7j1oAIV1RkwK59YvxUrm5ArVvmc1tKoUB6AT/m1UbALWRUeOw8W6zuehOqk
 1Yh8KOUXdKx3RwBFUogSye98AK9LArEwMgMPxyQjhaS5syNhLDg+O5dwGjwZnt1d73HcVXaDAD
 Nlzp3/ZD7+wnvp6fj58lGZhiPGmyDwIdCCDs3toFSRD8a4jleymgiWm3/KdL1LwL8hsY+5SBzn
 70vTRi0bs++bf/CrGr4WL1yq
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="143317230"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Nov 2021 05:54:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 9 Nov 2021 05:54:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 9 Nov 2021 05:54:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiTaIeMLsuilF3paK/921fN4XDZ4vwRwy2SlzyhVQ14EYjQ8c/v6BqC9uIINIQnUkJj14dQk1OFu1SV5hPum2wNYcR/vH6zzJU+LGL2FCPUv0FyQuXfBN+nSpSG+dz6gkitA5N8wmgSwwxVNLX84W5hReRPOFddfE3ufWlvY2c3TZujEFaC7T3WO5J74Na2pVIeqqmv0NMXa4t+Drjs+OSN6Nv8NyBDMAKKfwIPWCcJZYAMh26nVT94lI5J7IYyG2rHGI0DE8tSywJCSH2DGkYka8FtHJHel2lYrL2lS0JuuGzMZfE+B5ruwLwGKuiSQ+Ot8xAlVn7QvqQzr8t/+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixMUGfEdBbVU1vU9zXKdAaWjgZI0T2LUHYIfr13vB4E=;
 b=nSFJkIkYFWfwC/wa96RBx4dnIm1bIgF2ipWLAjRWXWKK/RhJ+WzKwr6MsOXggekxBJRzU5TAWauzRk33kVZZsjpeTRM44d6wio6gkWjGn4cfs7acme5U4DEOs5e/SDItQr2E/2YAlYJP3rGyBSFibiF2xjpx+djzkx2wtKEreVAuYjlnzLnFU50bv9hztSSIQK7G/sXQASuU0jhEC2Ei92YYYtsHECC1U2soNzqc1Vyi7g95dG66YAh1CzOPxGGGypjjrHmkT52L1Yzgw4v/a78g37QbsqV1ToySo2oBTFghOZHYPbhng2UzGzFWlBXGd9pxCqDHHSfxoigwIsftbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixMUGfEdBbVU1vU9zXKdAaWjgZI0T2LUHYIfr13vB4E=;
 b=EvLLtrpFxCM281lqZv90dJo/jAxSIFVEMZS7bsNYvtIck+jSJi44GZI3QUP+PvIkzDjYdNqQpQcL5YBDgB4YdkKac4zRRm9C/jJBdbptHQ5o0ez82gJr7MF3iD46XP2ZLst2CUaXqBbvek+i6b9QD8vSPi3mto/LxphcuBo6xsk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1549.namprd11.prod.outlook.com (2603:10b6:301:c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 12:54:36 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 12:54:35 +0000
From:   <Conor.Dooley@microchip.com>
To:     <krzysztof.kozlowski@canonical.com>
CC:     <broonie@kernel.org>, <aou@eecs.berkeley.edu>,
        <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <jassisinghbrar@gmail.com>,
        <atish.patra@wdc.com>, <Daire.McNamara@microchip.com>,
        <Lewis.Hanly@microchip.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <geert@linux-m68k.org>,
        <linux-gpio@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <bin.meng@windriver.com>, <linux-i2c@vger.kernel.org>,
        <alexandre.belloni@bootlin.com>, <Ivan.Griffin@microchip.com>,
        <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <a.zummo@towertech.it>, <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 06/13] dt-bindings: rng: add bindings for microchip mpfs
 rng
Thread-Topic: [PATCH 06/13] dt-bindings: rng: add bindings for microchip mpfs
 rng
Thread-Index: AQHX1LJPDy+D8VJjOEmJwWP3EzXa3av6In2AgAEGMoA=
Date:   Tue, 9 Nov 2021 12:54:35 +0000
Message-ID: <71c6917e-1463-c708-550a-726e5fe1566d@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-7-conor.dooley@microchip.com>
 <f60cf7e0-4f67-f4b3-2596-01114cff6623@canonical.com>
In-Reply-To: <f60cf7e0-4f67-f4b3-2596-01114cff6623@canonical.com>
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
x-ms-office365-filtering-correlation-id: bc5e9172-d1fd-49b8-b6a8-08d9a3801558
x-ms-traffictypediagnostic: MWHPR11MB1549:
x-microsoft-antispam-prvs: <MWHPR11MB1549A93ACF2FB0A5A52CF68198929@MWHPR11MB1549.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4ODZqgVG2YZcGwlV6g1wFkTX/5TdHttGHU511TLoXT1L57VBpnIaga4kgVETjXIUMaXW0Tm33aWe9lqA1Y6Jlp/oRY34bFHDGFKUwvoDPlJNg3S8Btex0dN0ZstZE7HJQ9HqBYiWIHKyDMLlxBTSOqwIcpXkhHDm3wLfXD1zA+3R0SSMi0GN4XsXNZqvZh/PiA6+QosOJU2fmulU7X5P2GlQJZyjqonRDqOU9532BC7RyHT+VvQhn0QlKX9ePIMtIreZu6gYFK1Jg99ryoGOcsUqpqjyHH4Llck7EFanRsn+gTHD+tN7b/oERFchasS1HZWp9/vwqcDyLLh4cQzL8vgoX6U7QHIuVd1PS6IvK639BfbW8LrrO6cqPDkvBFQxa7FCiVWsKBKjdyfkyvJojVi4KmTVTZ7aSRivfFi/XLnWGheUNnwgMQIYW3AmIWVOvZVeMiNcXP4FHxwaRqGicH8DuI/Y1Wau0MZybCPwCKHRWEUv5UCpkcXAbIV7wkPFFgyLWmAneNJBZFwEBgtKzPYv0L2gXzVkDfXohr79oR/cI4VWPG9ImECR29tPM5fPrJndt+6/pRCXIOYyqypD/XPrhzFu2nI6hgi5hKViZ4Df19n+DQobCa8oV5tHh/JwRKClx4wkK6DBl4YFRkxKGQDn6WRTGHjoXczHbeJYrc/6kIgQUulyIlR0+AC2gQDK/sVp5d8I5NuhDtir3KD7xdRX3LuJTkc0vXKdqnbccIgWM0BeZquHOtN/NuUZSpY2ic4a0Kof0YX1Vy9Hx9wAttwD2FiS1x4Pv/Wot+ld2n/oFOaAHzCXmf0uN09Z2swd4mNEuq665XwPRyieOVfTRBQ/ClK9A/qeAk7M6FB357/ddhKgN2NI3eNAgW8QGPwKiQTNgy1ODu7tii1Qf6D5ig==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(8676002)(86362001)(6486002)(31686004)(26005)(66446008)(64756008)(66946007)(76116006)(91956017)(66476007)(186003)(66556008)(38070700005)(36756003)(4326008)(2616005)(54906003)(6512007)(508600001)(122000001)(6506007)(53546011)(316002)(6916009)(38100700002)(2906002)(5660300002)(31696002)(83380400001)(71200400001)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGNtbkt6OU00UUcyYmJwMVp6b0ViNmR1WmkwZDQ5YzYySm8wM0ZzT2V4aEZ4?=
 =?utf-8?B?dkUrZXhQdk1KdDR6b0hwbDQyYjRkenpHUlBhZlFlN21uT1ZLVVlGZkRnSmJL?=
 =?utf-8?B?VkNzc2J5TkVpZmlzTC95TWNIT1pabEpsejN1bWFwTzdMNjZrREdKRWd2MkVU?=
 =?utf-8?B?UHo1MkxNS1hocUVPNTQ2U1VWUXoxMzRGaGVIS0U0UUpwc0VrRUxvbVZrdkZ1?=
 =?utf-8?B?WXUxclBrbytlM3NpNXA5ZXdBZmdqY1F4Z2RSdHRkYnJCMWRaOGJDSTZ0UVg3?=
 =?utf-8?B?MG5YcjY3TnBDOGtkSTc4Rzg3SUpLSExRdDA3RkQ0WjdEcXY4UVpiTlRuNzBm?=
 =?utf-8?B?QzROb2N4MURCSVl2MlNrZTAxeWFscnRwYTZ0bnU4aU1VRUhtVWVCbjd6MEts?=
 =?utf-8?B?ampYeU5sUENxc2p3QmFRSDA4d3BaR0xxYWVaZk9uMHRjVXppQ3BxazdBQURI?=
 =?utf-8?B?MTVEQXliOU5HaDlQNUFjMXpLMFM1QUgvWDc0cWcrUmd6VE9LMjJrNkxEazF1?=
 =?utf-8?B?NmtZVE8wa1ZHL1RhQjVLMkRUaGs4RSt3dkFYT2ZlREpQWXFxakxlYlMyTXlu?=
 =?utf-8?B?TGNSWmFQSHlmRHd6UTBJM2hKb0g4WW5YNW9GMkFBZ01ZR25oM0JPNmFhMG9i?=
 =?utf-8?B?RFluQldkSCt3OEFPNTByNXJ4UVRZUXcxUzNZNVkzZElBOU5CcXRIaDJWQkhB?=
 =?utf-8?B?TFVzR21udUdQT3NXeFMxTlhwcGpBUUM4R2lSTEhsZmNoRmtCZGtjU2p4UVhj?=
 =?utf-8?B?cFRUd3oxZVN2V1lORXV1L0hpTW4zOTNGU0dnOU5rcmF6OWtmRGJBdFY3eVkz?=
 =?utf-8?B?dmVSRTdReHRnYlFZSE9Pc01lK05ici9odHZ2R3JsOVJiQ1NhcTgzNmJjQnRY?=
 =?utf-8?B?b3pPMVhjdmc0OXE0Rm9mQnlGeHZsbVd0MzF1WktsREhnSmJGM1VyVWlhVXZ2?=
 =?utf-8?B?M25zTnorNFFDSnFzdkRUOTR4R0IyN3Y4NmZPZjQxcy9VK0pjTHBhaWo5cENR?=
 =?utf-8?B?VHZRQlNQTVU0V29XYmRtbHl1RW1UV0NWaCtZb3pWU0Y4UmE2MnN1aDJpQ1Fs?=
 =?utf-8?B?SlNzbGxWNkJSaEYvdnZoTE9XOEhVbkhKMzAydjlTNHBpMHhnNys4U3lsbW5I?=
 =?utf-8?B?aEltckZoNlc4YW9PRGE4bnB1OGozQzlLVmV2VUhRRWowcTRNQlRRY254SmFs?=
 =?utf-8?B?OTg3TDlxRVJuRTJCT0FXU1crUGFuUDZFalAvTmtuQTY1VTJEaHNZbmVTZTdW?=
 =?utf-8?B?OXdGWk9JRTQ0NkJuZjNUTHpPckQvK2xyUmpNbjYrRzdVM2J6VzRFQ1p4emRR?=
 =?utf-8?B?dWVjem9aVHhDTURyQ253dVVoSzg5TGlPVlNJTlFMTlJXRmRwd2FSdWZpbmov?=
 =?utf-8?B?YmdINksyYnJYUUtlZVJhbW1KMG1od204V24vbW9BMUlXSDlDbUNXTjhEdGFQ?=
 =?utf-8?B?NEl0OHAzY25GS2RyOGF6U3NqVFQzVENDeFVoUE9IbTB1TWQ4UTVzZE9pdmRR?=
 =?utf-8?B?YXl4UlduOGpFZ0lWaGVQSmNDN3lzNkh0S1lYZVV1bVJuQ0dlOVVtUlBvQVBj?=
 =?utf-8?B?bVRHVk53L3ZKNVZTSUdCRWpkcFNKTDJyK0RRYzNqaHY3UmhqK3owaVd6ckVh?=
 =?utf-8?B?cExYRmRuU1cxSjlrSEhud1NjOWx4ZmJ4WFA5TnN0cEpGWXJEK1BPbWVYMXNC?=
 =?utf-8?B?MmRIWGdSeEcrQXdCdENGNHJESnBwa3M5V0llekw3V0hSZjRTN3FsRnJZVkJB?=
 =?utf-8?B?OS9OU1dTbDhjay9QQlVWV3NUVWVaSHZ6WGRGOHM5OVNsUmdTaTE5dVVYT3NC?=
 =?utf-8?B?SVJqQWwrZzRWUkozNHFMaHE0R3p0Q3orczUvbGNTRk4vaWs0RWoyZUxUellO?=
 =?utf-8?B?ekNuaWlCR1FOVFdnYm5ENk5WSW1vd1V3cGQ3TW9OVXVzd01EZDU4ZFY2Vng3?=
 =?utf-8?B?OC9TbTdoemdWVWx3NjJXZ3Z4UmlkMnAzeHJZVG5SME5jVmJuaktjM2t1dWtt?=
 =?utf-8?B?ZWpRc25vMzRLOHFuZ2ZITEN6QjVMTU42dEdFMzhudE1BeGZKaFI1WnBpdTR1?=
 =?utf-8?B?SThBMGZDSmZDdHl0VVprbFFTT25DRmQvZWNUYXJLRmZ0Nng2R1lXR3dMZTZS?=
 =?utf-8?B?SUR4SXdWaWxSSkpWb3lvZXYvWjZsWHlmaitzWjI4RFB2NFJOcCtBVHA0d3Z3?=
 =?utf-8?B?ejQwMnpKT0lJYVJIaDd6OCtzZzdLNllmSGhXRzhzekFtUjl6enUxVzVGeTFo?=
 =?utf-8?B?ckhMcnFhclBOaytYYllaeTZuSkh3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D9CDDAE0F751C41BA00C2B42FF2F42B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5e9172-d1fd-49b8-b6a8-08d9a3801558
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 12:54:35.6991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ULGmSRabj/pOox+nfN+AEINNGO9V/+Bd3z6B3xPMgxguG3Vyo4yxg6emqeC9uVJQQItWvU1w8Yil1MPTAv52TO5oLKfxEy98tHr4eQtHhnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1549
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDgvMTEvMjAyMSAyMToxNiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAwOC8xMS8yMDIxIDE2OjA1LCBj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IEZyb206IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+Pg0KPj4gQWRkIGRldmljZSB0cmVlIGJpbmRp
bmdzIGZvciB0aGUgaGFyZHdhcmUgcm5nIGRldmljZSBhY2Nlc3NlZCB2aWENCj4+IHRoZSBzeXN0
ZW0gc2VydmljZXMgb24gdGhlIE1pY3JvY2hpcCBQb2xhckZpcmUgU29DLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+PiAt
LS0NCj4+ICAgLi4uL2JpbmRpbmdzL3JuZy9taWNyb2NoaXAsbXBmcy1ybmcueWFtbCAgICAgIHwg
MzEgKysrKysrKysrKysrKysrKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9u
cygrKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3JuZy9taWNyb2NoaXAsbXBmcy1ybmcueWFtbA0KPj4NCj4+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcm5nL21pY3JvY2hpcCxtcGZzLXJuZy55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JuZy9taWNyb2NoaXAsbXBm
cy1ybmcueWFtbA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAw
MC4uZThlY2IzNTM4YTg2DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvcm5nL21pY3JvY2hpcCxtcGZzLXJuZy55YW1sDQo+PiBAQCAt
MCwwICsxLDMxIEBADQo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25s
eSBPUiBCU0QtMi1DbGF1c2UpDQo+PiArJVlBTUwgMS4yDQo+PiArLS0tDQo+PiArJGlkOiAiaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcm5nL21pY3JvY2hpcCxtcGZzLXJuZy55YW1sIyIN
Cj4+ICskc2NoZW1hOiAiaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjIg0KPj4gKw0KPj4gK3RpdGxlOiBNaWNyb2NoaXAgTVBGUyByYW5kb20gbnVtYmVyIGdlbmVy
YXRvcg0KPj4gKw0KPj4gK21haW50YWluZXJzOg0KPj4gKyAgLSBDb25vciBEb29sZXkgPGNvbm9y
LmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPj4gKw0KPj4gK3Byb3BlcnRpZXM6DQo+PiArICBjb21w
YXRpYmxlOg0KPj4gKyAgICBjb25zdDogbWljcm9jaGlwLHBvbGFyZmlyZS1zb2Mtcm5nDQo+PiAr
DQo+PiArICBzeXNjb250cm9sbGVyOg0KPj4gKyAgICBtYXhJdGVtczogMQ0KPj4gKyAgICBkZXNj
cmlwdGlvbjogbmFtZSBvZiB0aGUgc3lzdGVtIGNvbnRyb2xsZXIgZGV2aWNlIG5vZGUNCj4gDQo+
IFRoZXJlIGFyZSBzZXZlcmFsIGlzc3VlcyB3aXRoIHRoaXM6DQo+IDEuIFlvdSBuZWVkIHRvIGRl
c2NyaWJlIHRoZSB0eXBlLg0KPiAyLiBEZXNjcmlwdGlvbiBpcyBub3QgaGVscGZ1bCAoanVzdCBj
b3B5aW5nIHRoZSBuYW1lIG9mIHByb3BlcnR5KSBhbmQNCj4gYWN0dWFsbHkgbWlzbGVhZGluZyBi
ZWNhdXNlIHlvdSBkbyBub3QgcHV0IHRoZXJlIHRoZSBuYW1lIG9mIGRldmljZSBub2RlLg0KPiAz
LiBXaGF0IGlzIGl0PyBMb29rcyBsaWtlIHN5c2NvbiAob3Igc29tZXRpbWVzIGNhbGxlZCBzeXNy
ZWcpLiBJZiB5ZXMsDQo+IHBsZWFzZSB1c2UgZXhpc3Rpbmcgc3lzY29uIGJpbmRpbmdzLg0KMSAm
IDIgLSBDb3JyZWN0LCBpdCBpcyBiYWQgJiBJJ2xsIHdyaXRlIGEgYmV0dGVyIGRlc2NyaXB0aW9u
IGZvciBpdC4NCjMgLSBJdHMgYSBzeXN0ZW0gY29udHJvbGxlciBpbXBsZW1lbnRlZCBhcyBhIG1h
aWxib3guIFRoZSBzeXNjb250cm9sbGVyIA0KaXMgdGhlIG1haWxib3ggY2xpZW50LCB3aGljaCB0
aGUgcm5nIGFuZCBnZW5lcmljIGRyaXZlcnMgYm90aCB1c2UuDQo+IA0KPj4gKw0KPj4gK3JlcXVp
cmVkOg0KPj4gKyAgLSBjb21wYXRpYmxlDQo+PiArICAtICJzeXNjb250cm9sbGVyIg0KPiANCj4g
Tm8gbmVlZCBmb3IgcXVvdGVzLg0KPiANCj4+ICsNCj4+ICthZGRpdGlvbmFsUHJvcGVydGllczog
ZmFsc2UNCj4+ICsNCj4+ICtleGFtcGxlczoNCj4+ICsgIC0gfA0KPj4gKyAgICBod3JhbmRvbTog
aHdyYW5kb20gew0KPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJtaWNyb2NoaXAscG9sYXJmaXJl
LXNvYy1ybmciOw0KPj4gKyAgICAgICAgc3lzY29udHJvbGxlciA9IDwmc3lzY29udHJvbGxlcj47
DQo+PiArICAgIH07DQo+Pg0KPiANCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+
IA0KDQo=
