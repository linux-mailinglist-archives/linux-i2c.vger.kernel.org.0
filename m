Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B719A44AED8
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 14:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234055AbhKINi5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 08:38:57 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:10716 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233280AbhKINi4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 08:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636464970; x=1668000970;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4dEAdqPxkE3pX0bN/sr7dBArkyki3DDG1jv5qjaDEjw=;
  b=bduInRkOpW2AZXbCq8lWA+Xna9b7rqwMFW0DHPdv0uvSZkX6vJ7nAGPE
   onJ8dB3pVi0A3pnKLmqAyNunUMkrGM4PxESDaKrcYHwWcJPnwtfAp1A0X
   9QGtr07aJ1V6Eupi7W2m9hqJhrLRrgX+SEwRheOaHGYaNsplsi+g542Zz
   qZnYX1bv7biXNyxVRs9wHdePskWa+ykWyuNHmIdenlm4uvcnnr4mhF9qw
   T0bVJ0QYEY1/EpxI5RSKLSiFVns3kvIS8ra/z8m/TVNhKIHBc0AF5CS2D
   47qR1648DY39/5A4IBlp1Ku0F4opCMvJ0H0LPxFYxPXisJ+I3XguXNTIy
   w==;
IronPort-SDR: cp0LRf1JVdZxL6aAJXRW3Ht4S122rkjQGjxFI/K0fyI26kmNvsdbuATEZfcBkc9q9mM1vz9Yfa
 gOMHTnf4f/DWdbWPFRV+zO5lUAfYQ4ZdxL8wQ58/ZRDN1M8VcYhuIjdyZxD5fxNLLrHamQFd3n
 v2G4Xu2wa2NhMF0yW/2CW2ly/aezBC8mA4rMQB3QVmBX92njhHgm+xuUtN/p2QyX1yESss86al
 kO26cMCjipBGySoVpqCp1fmsKzqVnUwO8joiJOQBcJ4UasgjcUxvryWZMbNLrMtZT7cxiF1uSf
 pcUCID38ULGKkW70sPgVaBl8
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="135972329"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Nov 2021 06:36:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 9 Nov 2021 06:36:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 9 Nov 2021 06:36:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPjehMmTo/aZS0cF32lG9hLBCypoDOa4VxAlyO4TaIyBpkcy4pmzJkVXuZ46o4wErazpI+Ac6LWSYbEvhFQ0ntCu8PeetX5ogG8OwTMDXCw7LtLuMyIYZbykm5kjnkPTAg7bqZsUwdK7msRtldmB7KljaLNzqHZCjJY0yAvIdpP4bug/OSgy4ZqX4a9fai+7popz7Ul9Gj30mnGMrjZuqZ+hY3nUR5ftQS8bcNsDbutXyj/syOM4FZvLUkRd+QXEYsqCbXTYHIiqy9+r26UPYMsecOIpt7NsFGPFvSp2gu2bYqo09i5HE9KYGnbIlbH6gaH6UdYIk6fxUTZbjog17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dEAdqPxkE3pX0bN/sr7dBArkyki3DDG1jv5qjaDEjw=;
 b=ds7PdoUYqDxa4OGKr6Jg3XhwAB+46mpAj9CKLzMhwv21ytCA1P57VPTErbuy9wRQRYtNG7n/Pri5MlNloE/vhhF2T91igmvbYieTXvMw4NkiLErw4uR8KGE/cK3/xauVZfBVGakT5HoJaxV/9me+q7hcA9LrKKwo88HuX0dgsKpu9Lgzw0HT2xGN6JGUwk1ejwRzH3mYagBuACLxNfrLACPB3RqTrwGNI2QFK74j8E4xq4Kt6KLJMT7TO4kzJ4KJ8SJzSkbI78HeM/VcREtozWIVWrrwYPa1BZBpX4RdTR2+mrNNRG2vprF2bqMcBzu55F6fAPy/H1TY6Aapya/wpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dEAdqPxkE3pX0bN/sr7dBArkyki3DDG1jv5qjaDEjw=;
 b=OLFweo++Dhop7E/3q9+2MxDkhla/9/qs+dvUkJ+CqGeh5pr1HosOSpxidwQitY3UlLsSFvGoPDUfwI56GDm/kqq9hn35oi+mBcLRy+esW6lsHLNMk3nWq3sy1gr9WTgjH7O2GhuZV1C75jVIS17NYuOjwB0ecExlLcUqwUv6gAE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by CO1PR11MB4964.namprd11.prod.outlook.com (2603:10b6:303:9e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Tue, 9 Nov
 2021 13:36:05 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 13:36:04 +0000
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
Thread-Index: AQHX1LJPDy+D8VJjOEmJwWP3EzXa3av6In2AgAEGMoCAAABzgIAACyQA
Date:   Tue, 9 Nov 2021 13:36:04 +0000
Message-ID: <ea871add-bddc-c4ae-ac9d-e86b4fad5a02@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-7-conor.dooley@microchip.com>
 <f60cf7e0-4f67-f4b3-2596-01114cff6623@canonical.com>
 <71c6917e-1463-c708-550a-726e5fe1566d@microchip.com>
 <ca17d6ac-ef8e-b01c-3278-7cbb0d5745e3@canonical.com>
In-Reply-To: <ca17d6ac-ef8e-b01c-3278-7cbb0d5745e3@canonical.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83d8c7b3-df2a-4e37-b5ea-08d9a385e0f4
x-ms-traffictypediagnostic: CO1PR11MB4964:
x-microsoft-antispam-prvs: <CO1PR11MB496404E9704453F0A328E98A98929@CO1PR11MB4964.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y0QiL3qeP2Si9CgjDansSNnttgtovTrPiPlHzwfyhYiIcuAnUocS6p1JlYoQvkhJFwQVC37rPVFq/Y9K7w7MXRmUGRCX9Yevr3lBpjTNy7JMandgaLETUVzmqxSu5Ny/d/LVV4KHjXU94DLsyL6p8W6LDdd5vIRswygdYjBd+gNlUWCVHoSRKfbbto+cww4G2aIqQC8mLZTMmEzIG/Rhv2uls2rpUjBE6eSQBhBHbzdAU6u+zO4hfi8HlHjqXFc3nWNc/kDYwVjxjxYf73lXJRlQThoBBqLsa3I9vaHN23fJort3lvdv+E6xpAgEQHyXbMDhETxHSGTCe4GfX/lVzkXPlB7J1iBn1V1tRYijU6qm1oRG2ML/uMcZaFjtM02S+n5rtfQ5Kl4z4VEYFVs1OsqEQpiXCYquCoGJEZXlQbiYt62MD1GQNBh7he8OqntHOZmE2lylDi6yJycAtoFuj+wH4vaAKykVZktWao6JQ3bl3oNbCwOmb40Lzs35TCsgC32OeA4TNpyhRzIqHbZufKlO0uCDeum3ArhG2H1H8AKpzth6j0L3YwLDT7KKv00sWwz5183wXK3bvRmMOFVtZwbomJ9EynUVy8LJ7Q5FiRbremPH4Rtu0KQ1dJY7pUhaykZXLMAkKz0Im7fsjLV3gGZ83UnjU2INoF8ct5G7WuDYjoaJQm+iv7MdnGXHxRz5Tad3Datwrqi3LP4FfWWNy5wB5W9MBBmyNFV4lt/955viLdby5DiHGdjOXYMjdUqKZEF8alFW4RKCFZedYKoogFAH1BKrbE9mWvNgKLiAvLYCOzKiWgkJO6WSU3hCucbYw7efM9Q4EXxFEapdbvFUKKFseOl255FCXFnSd6u/OxDe4O72Gf+4hfTSxlSQFWCnZ5QuNLySYKFUnO0Q3Vx5pQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(31686004)(122000001)(38070700005)(86362001)(76116006)(54906003)(64756008)(186003)(66556008)(71200400001)(66946007)(7416002)(53546011)(66446008)(66476007)(26005)(6506007)(2906002)(91956017)(6916009)(316002)(83380400001)(8936002)(2616005)(508600001)(31696002)(8676002)(6512007)(6486002)(4326008)(36756003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHRBeEdjMGMyMzhGVEtUdDQvbnQzM0RWK05Bb0xmZUNlN1Zmcm51YUZvNDRp?=
 =?utf-8?B?bDFHTFg2N3hTbUt5WUZlMTFnUGpZWjl1ZlI3elBUSVJ5K3RHem9NeW1oUE5w?=
 =?utf-8?B?NmJQc0kybWUxaXZqRWd0NUFMaW9wSXZyeGV4Z3BhdHNsZGlDNGhUNTZDV3h1?=
 =?utf-8?B?am5IcGIxRy81WEZ5eTk4Q0FLVmRNeEVRajFOMjhDeHJweG5Fa09jaUFjZmZH?=
 =?utf-8?B?K3d6c0cwL1V1Qm12R0VwalZUVW94eG1zWGJKOXdKYkpiVVd4aUhObkYrRk5j?=
 =?utf-8?B?M2o5eHlaOXFSOWIxaGpxaitBeUZBaUk3RTJrUDVCR0VjdGxPNDd2YUtwclk4?=
 =?utf-8?B?RStPdy96elVzVk9YRHNsYWlMcTJ6RU9zcmlnOEEyN1BkZnVZMm9aS1pKUytF?=
 =?utf-8?B?UXdHQ25tcnFLaHV2SjVkTkhxYTdWYWE2YTl3UTlLWUVheGJLWEV4SW9aS3Nt?=
 =?utf-8?B?SGwvSXZMZ0djSmI0WUV4SXdrZjhKMDlCSCtZMHVuQ3MxS0YyMmJKY3lNclB1?=
 =?utf-8?B?Z0IvYk4vZmwrNUZSNU5ydnBtSjI4VEFRZ0pxem13S3VlTE14SzF2c2M4NkE3?=
 =?utf-8?B?SUd1SXFIZVhKMXVVaHRaQlNGUnE5ZTdIaGh1TmVmcGp6MVQ2dkRQT0RNTlhK?=
 =?utf-8?B?KzZtNEp2RFVoSG04ZWgzWUZIdFk0TXJwN1lRM25vUTVOY1JLVTNBVUtXNTVw?=
 =?utf-8?B?VUxBb3VBeEx2NkpLcjhXNTJQNjl2YVp3Ni81Zk1JdjlLQVNZOXJwSTlxdWJk?=
 =?utf-8?B?YXhhSFIvUytTZGp0SS96cDY4Wm1wRW5VdEozelZZRFoxUDJoc2dxNS8wdm0x?=
 =?utf-8?B?YUJ0dTZCcHFhUCs0RUdPbzFKMm9JMjNqem1WOCs4ODIzM1NRRS9mVGVyTjNE?=
 =?utf-8?B?ZVgyeVNia013MUpyOEhBcCtpcFhYc0dZR2hyem1ib3p0czZEcVBUa0NEY0l2?=
 =?utf-8?B?a056NytCZEpRODdHVGdtSC8yZTVvYU96dUlKSnZJWm5PekFZWDJoL2djcTdE?=
 =?utf-8?B?YlE4YmlUQ2pDODBsZGlvcTJZVlgxNmYrSEVaRmVmNjNXUkIvRy9aN3kvYjAz?=
 =?utf-8?B?eGtYVG95M2hYUEd4ejZzTmczSWV6NmlPelIrcmE5SkIvVFU1Y1IxaXRENlZI?=
 =?utf-8?B?cG42YlpENUEyZzNpSGpOMHVEaXVoUkFQYVpnZFR6WmZSS2ZXMXY5NXJJQ1Bq?=
 =?utf-8?B?d1k5YWl4YVRZR2FPSlZ6bWRENTkzUjBZVmxreUtjcDJJSjkzV294NVdLU2Z0?=
 =?utf-8?B?UHhvZFd3SzlPbjZwK2g1Vk5KaFk4TU1pejRXVzRhenVqL3lES01MMzk1cU9m?=
 =?utf-8?B?cmNTQjQreXgxMDUxL3g0WldWbE1ldk12Ti8zb2tLMjhITUIvM0xEelhIbENv?=
 =?utf-8?B?d3VGRS9nOGRLSGw1WXhFN213RUIwT1k4SmFTSXVaMkhqVjNHLzFGeDdIaHYx?=
 =?utf-8?B?NVI0UGtGRWhaYlhKNGNLcXBxL3dlM1cyMkVUUGNyaEJ1QXM4bmpTYzZ5aTZk?=
 =?utf-8?B?UEUyMlJIRmVTSFJhS1U5M2tWcW4vVkFoUG8xbWZZbHBMUm9SUXdPNTVPdS9J?=
 =?utf-8?B?TXhhdkVUN1FkUHA1VGM2VUNRd1lHZHRudWxvNjFLc2cvVjlaUUd3OFl6STRX?=
 =?utf-8?B?bmsxK2NJb1FDWHFRaWtlSDJvYVp4a2J3N3pLTFM0Q2h6Ym1abFZQaU5UNzdY?=
 =?utf-8?B?UFBIeVpLd0dmL1VHRko5aXMzbmZrbmtlbTYvOWNqbUI5TFpKdVgrK0FkZERG?=
 =?utf-8?B?UkRpb0tOUlRwR3JOZnNuZkRWeGRaYUlFVXgyWjQ5bFBld0ZJamgxTnVDMzkr?=
 =?utf-8?B?a3J2MElYaTdwaDg4d0t0TFpRUm9KWHIweDYwMWJhZDUxamR4cHV6YndReTA3?=
 =?utf-8?B?eGFTZXJzTGgvN3VJaytWaThmWXF3UXIzc3FZbUkxNzVUemRWK1pyK2paWTIz?=
 =?utf-8?B?YzJBbWJxbDkyRFlaSHJJSE8weTFDNHhSc1kyRzJkMVNYVkR0eENiU1FLSmQ4?=
 =?utf-8?B?WlkzeFZ1OFNOOE9OMmtWWllzeFArTUVJeVhUZVNzZG8zazNiQWJiYTlxODlL?=
 =?utf-8?B?ZCtoVWtTcmZtS3pudlJvSm83MU9lUmhESTZBSERrdGcyVHFGNWFhSy9mTTFY?=
 =?utf-8?B?c1NQTG8vWEk2N3Frb1ZNd29lMEMzQTMwK01ybUQ0bDlJZjFEMi9uTDJWN0lm?=
 =?utf-8?B?b2FHcURIdHlaUVBjWEw1MlVXZHZzNFBVaVp2dDBiUTl6Qlo2dnZZMHVJaW9Y?=
 =?utf-8?B?Mk1NUG9TQ2ZoaE40YmcydWVla1ZnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BD954948DA2F940B2B0762337D21C45@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d8c7b3-df2a-4e37-b5ea-08d9a385e0f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 13:36:04.7089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PkVIRQ4T0GsQrrdIpbZAv4+14SH8otjYxEJpfSmCGQC3+vqL5rmnIJDVpcwwJB83hTDAlcLcYzGiF/GA3G27UQ+iXg+BqoQ2m+jQ4ksEx7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4964
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDkvMTEvMjAyMSAxMjo1NiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAwOS8xMS8yMDIxIDEzOjU0LCBD
b25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IE9uIDA4LzExLzIwMjEgMjE6MTYs
IEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVu
dCBpcyBzYWZlDQo+Pj4NCj4+PiBPbiAwOC8xMS8yMDIxIDE2OjA1LCBjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbSB3cm90ZToNCj4+Pj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlA
bWljcm9jaGlwLmNvbT4NCj4+Pj4NCj4+Pj4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0
aGUgaGFyZHdhcmUgcm5nIGRldmljZSBhY2Nlc3NlZCB2aWENCj4+Pj4gdGhlIHN5c3RlbSBzZXJ2
aWNlcyBvbiB0aGUgTWljcm9jaGlwIFBvbGFyRmlyZSBTb0MuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+Pj4+IC0t
LQ0KPj4+PiAgICAuLi4vYmluZGluZ3Mvcm5nL21pY3JvY2hpcCxtcGZzLXJuZy55YW1sICAgICAg
fCAzMSArKysrKysrKysrKysrKysrKysrDQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNl
cnRpb25zKCspDQo+Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvcm5nL21pY3JvY2hpcCxtcGZzLXJuZy55YW1sDQo+Pj4+DQo+Pj4+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcm5nL21pY3JvY2hp
cCxtcGZzLXJuZy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JuZy9t
aWNyb2NoaXAsbXBmcy1ybmcueWFtbA0KPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+PiBp
bmRleCAwMDAwMDAwMDAwMDAuLmU4ZWNiMzUzOGE4Ng0KPj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ybmcvbWljcm9jaGlwLG1w
ZnMtcm5nLnlhbWwNCj4+Pj4gQEAgLTAsMCArMSwzMSBAQA0KPj4+PiArIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+Pj4+ICslWUFNTCAx
LjINCj4+Pj4gKy0tLQ0KPj4+PiArJGlkOiAiaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
cm5nL21pY3JvY2hpcCxtcGZzLXJuZy55YW1sIyINCj4+Pj4gKyRzY2hlbWE6ICJodHRwOi8vZGV2
aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMiDQo+Pj4+ICsNCj4+Pj4gK3RpdGxl
OiBNaWNyb2NoaXAgTVBGUyByYW5kb20gbnVtYmVyIGdlbmVyYXRvcg0KPj4+PiArDQo+Pj4+ICtt
YWludGFpbmVyczoNCj4+Pj4gKyAgLSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2No
aXAuY29tPg0KPj4+PiArDQo+Pj4+ICtwcm9wZXJ0aWVzOg0KPj4+PiArICBjb21wYXRpYmxlOg0K
Pj4+PiArICAgIGNvbnN0OiBtaWNyb2NoaXAscG9sYXJmaXJlLXNvYy1ybmcNCj4+Pj4gKw0KPj4+
PiArICBzeXNjb250cm9sbGVyOg0KPj4+PiArICAgIG1heEl0ZW1zOiAxDQo+Pj4+ICsgICAgZGVz
Y3JpcHRpb246IG5hbWUgb2YgdGhlIHN5c3RlbSBjb250cm9sbGVyIGRldmljZSBub2RlDQo+Pj4N
Cj4+PiBUaGVyZSBhcmUgc2V2ZXJhbCBpc3N1ZXMgd2l0aCB0aGlzOg0KPj4+IDEuIFlvdSBuZWVk
IHRvIGRlc2NyaWJlIHRoZSB0eXBlLg0KPj4+IDIuIERlc2NyaXB0aW9uIGlzIG5vdCBoZWxwZnVs
IChqdXN0IGNvcHlpbmcgdGhlIG5hbWUgb2YgcHJvcGVydHkpIGFuZA0KPj4+IGFjdHVhbGx5IG1p
c2xlYWRpbmcgYmVjYXVzZSB5b3UgZG8gbm90IHB1dCB0aGVyZSB0aGUgbmFtZSBvZiBkZXZpY2Ug
bm9kZS4NCj4+PiAzLiBXaGF0IGlzIGl0PyBMb29rcyBsaWtlIHN5c2NvbiAob3Igc29tZXRpbWVz
IGNhbGxlZCBzeXNyZWcpLiBJZiB5ZXMsDQo+Pj4gcGxlYXNlIHVzZSBleGlzdGluZyBzeXNjb24g
YmluZGluZ3MuDQo+PiAxICYgMiAtIENvcnJlY3QsIGl0IGlzIGJhZCAmIEknbGwgd3JpdGUgYSBi
ZXR0ZXIgZGVzY3JpcHRpb24gZm9yIGl0Lg0KPj4gMyAtIEl0cyBhIHN5c3RlbSBjb250cm9sbGVy
IGltcGxlbWVudGVkIGFzIGEgbWFpbGJveC4gVGhlIHN5c2NvbnRyb2xsZXINCj4+IGlzIHRoZSBt
YWlsYm94IGNsaWVudCwgd2hpY2ggdGhlIHJuZyBhbmQgZ2VuZXJpYyBkcml2ZXJzIGJvdGggdXNl
Lg0KPiANCj4gSSB1bmRlcnN0b29kIHRoYXQgcG9pbnRlZCBkZXZpY2Ugbm9kZSBpcyBhIG1haWxi
b3gsIG5vdCB0aGlzIG5vZGUuIEJ1dA0KPiBoZXJlLCB3aGF0IGlzIGl0IGhlcmU/IEhvdyBkbyB5
b3UgdXNlIGl0IGhlcmU/DQpUaGUgc3lzdGVtIGNvbnRyb2xsZXIgaXMgdGhlIG1lYW5zIG9mIGFj
Y2VzcyB0byB0aGUgcmFuZG9tIG51bWJlciANCmdlbmVyYXRvci4gVGhlIHBoYW5kbGUgdG8gdGhl
IHN5cyBjb250cm9sbGVyIGlzIHByb3ZpZGVkIGhlcmUgc28gdGhhdCANCnRoZSBybmcgZHJpdmVy
IGNhbiBsb2NhdGUgdGhlIG1haWxib3ggY2xpZW50IHRocm91Z2ggd2hpY2ggaXQgcmVxdWVzdHMg
DQpyYW5kb20gbnVtYmVycy4NCg0KSSdtIG5vdCBxdWl0ZSBzdXJlIHRoYXQgSSBhbSBhbnN3ZXJp
bmcgdGhlIHF1ZXN0aW9uIHlvdSBhcmUgYXNraW5nIHRob3VnaC4NCj4gDQo+IEJlc3QgcmVnYXJk
cywNCj4gS3J6eXN6dG9mDQo+IA0KDQo=
