Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7A9A44AD48
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 13:16:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239995AbhKIMTQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 07:19:16 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:22058 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236245AbhKIMTQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 07:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636460190; x=1667996190;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=O9+OkIueXuV/KVCm0IDXqxj6EIhXpDEJBW7hxzKh6Xc=;
  b=HUfGvgy53YeuRQg3Boj11YJHZ86/ASBGUhBprS5WZQqfr4/8coDKaZnR
   HkGIfswq6abXEuwNOBjSiYxP5HH8ijULjz7mdIha44+EN45MgeYojVtd5
   fjHYmB6q/V0nUhftPXrksZdLigoCt9SwEXZL08ifuxQ2rHHIH8HABo5Nz
   6zdltRYoM+GlwSmCFGKFnqJwcoO9aV720PrCykirk+oah5MqD471A2E+p
   QXXPLApfYNU/6M2jHzftkbhvpkFZNYnybmTh0ji7BhZvSWNLav8z5XZd5
   v9nHp/41yeBwi/SLWmtqA4D000ASpFBbl1uafZCiWLb/kaz8OPNlIWCuX
   g==;
IronPort-SDR: KK8VBqqbYRpMc7dlLbwNUuQNlLniRu9bmxyRBAttviEYy0TzRV+4hhh13/Ts+acLoatxqukbjX
 gBEICZO4z8f8lzkTgyN1MJvYP8wafMj4/yehuO/00YsO8XPKP2svsyPA9s/PMxFABF/RclJbkJ
 An1z8tpVqUqGOHzFLQCw8uxBMR9kaDBRQJQFf2g0A4Qnk5UzuADZrRXz+i56xc6lydMfNwXr83
 nU8mGI1hMf/yLXq77mj/pKRC6OEM5tPb6KZAB5mMhek/uolmpqNmdWFV2zL+QP5GzC6SqkFkn7
 0beGBhXJGBAffR3RQP5V9mtN
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="75846124"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Nov 2021 05:16:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 9 Nov 2021 05:16:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 9 Nov 2021 05:16:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOoUOKUlQnWDS0h46or9EV/njKTlXQVFWj8xWQ/tcjNz5MtLkXMtnjQzF7ejxL4ytmEQg5mSPp2adA26gx1cPM9LVfEWdimJzFzPeQzudI/C0N8/vKtXdAzpeQo4XzKWwBLiCGxbhvHla+zoHAQO3wQCwyvg3f02f8GxLW0jpXpLwTLenUWQ6sNHMHAjw55ipKAPaxSLImLIHJ3LylDNdAxB5oB/piCgaZwC+IrQBTXNx/dVqIb9vaXwqTAARG2jIXVr77Zha2Cot29VfvIVqIcCNw5NCWmlVorFDBGV+iDUmtPlrJHJr566TAVk6xebz/uQQY7eyzHKGr2cWR0X6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9+OkIueXuV/KVCm0IDXqxj6EIhXpDEJBW7hxzKh6Xc=;
 b=A43idctClQfl2DxrEYJ4uRuSRDQz1vq25CqhIAzTDLA1tZSewiQoVylrcTYn1d1mKYL4+kGG7FY9fhpHh1XW5UzskqHMjBkDwWOQkgy5KBZT/QfKsvpr+XokGOUJDnC5rG597ut+dlT4JwiBFEdcsiDMhKNhTE7BMOJAYFTay7bxmItsnB16vPbMDJ8SqY9nn7+ybdfjweSUcDjdzJs7YUznf6R7Z9rpaQKDj5n1Fyz9xl05Krc0OP8RI2l4Y6ZWn+oKTtq/nrVHFVZ0f7IYsAul8RSWzf4b6AzujBEPKjunHoxPj+j7mVDqJvARN/c0KBiS5x9j1Krhodui3+twMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9+OkIueXuV/KVCm0IDXqxj6EIhXpDEJBW7hxzKh6Xc=;
 b=GvEoBwMVAlVV48/r6d/3qh5H1M/CRijUyyp2/A/+nlnoJqIFv5qTFNwQtdzSK1jI0gPwHJ2wzX17rmyHsjWZcMHYWwkH6EFkMbY7I9bpd/NoNmlFY9vhCi+1W6Swod27zBVGzzM7ybuU/OoYxKCLo3hymDUJHC5pavJQT020aSE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1277.namprd11.prod.outlook.com (2603:10b6:300:29::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 12:16:22 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 12:16:22 +0000
From:   <Conor.Dooley@microchip.com>
To:     <robh@kernel.org>
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
        <alexandre.belloni@bootlin.com>,
        <krzysztof.kozlowski@canonical.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <a.zummo@towertech.it>
Subject: Re: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs
 spi
Thread-Topic: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs
 spi
Thread-Index: AQHX1LJfUqgSbOdkdUS8ce/NVnrEbqv6lPOAgACJDYA=
Date:   Tue, 9 Nov 2021 12:16:21 +0000
Message-ID: <96005893-8819-1d76-6dea-7d173655258f@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-11-conor.dooley@microchip.com>
 <1636430789.935637.743042.nullmailer@robh.at.kernel.org>
In-Reply-To: <1636430789.935637.743042.nullmailer@robh.at.kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d0d0e0c-51f6-45fe-e98c-08d9a37abe22
x-ms-traffictypediagnostic: MWHPR11MB1277:
x-microsoft-antispam-prvs: <MWHPR11MB1277C6AE60D91B2BC5F965B998929@MWHPR11MB1277.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2jC3fK/A5sRp7uhdBpQcLl+izV884y3YkyorNOm8V10qARTbK+kDnqBULHKMKMoxOYVSC2EFIiCej+pdbU88QOCHM32IrqPH+9LPhEmYLqgod19p4EgKznCt385QfWR3v0seN0t7d9gqRr9sCzoPDaV1v86QDW94pZZA4mxB6m835qwNvThA9/RxFcF83Thiyie2fa1fMGHCqkK4Sq3uxACsDtr7ZMP1f1L9N9wjW+HJfXqc4CbtuCH+89nhniIOZ/K6Iuh+JcIXVAKgk1kUDeEBETL8LRiU+HtvwaS+w13Ab7TohUwHuU52t20VeFoZ2E9t149iAdqjfZkaZnhhSBnfbgf+zXoBK7H+zEbW/QfR1h6xMwaVdrR/aABjeAIkWfd9fDFDDNdIRhzBHt8mQXtG2CaNA5VjIVnkAg5hz+oCqYhE47od3v2AK9EfC4mdDvHtaPtTvY6DOME20bTd+TUeVhbs6k+ZDLcpN9QgPVoQK/M4W7r+84ylH/cwnyhVp/RtHY6x6xfYsS/Mk4DYyNeCr2WH7xBWw0AQbEGvamQfnw+lq3Go6RLwwx+s0ZJD79f5e8RNlvpvMj53m630zFfB3NDhLyBoS21wLnzITRA2XkqxCu2BttlI4fluXUBPvYu/duRsF+x3W/LzTzxp44WHNaVxewrAjLZCoaWKfM8KrpLljqtLXl1fI7vrUQLo3lPri4FWZ7JGz+Egz/dOMs6FjnX2scEFe193s4sqncnxd5ODrVDbijcW0YTiAj3slvT5ZuzxXVbYQjHa8lVCaXAF/qAXYXoMT+ylS+Kc6hsMTkMm+QiwWefg5Uhj7qPajOxIrYlT1DYxF+UZsByDoFE98BOZErIi0bZARmfgufU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38070700005)(83380400001)(8936002)(66556008)(66446008)(71200400001)(5660300002)(54906003)(26005)(6512007)(8676002)(76116006)(91956017)(31686004)(186003)(6916009)(122000001)(508600001)(2616005)(36756003)(86362001)(38100700002)(31696002)(53546011)(966005)(4326008)(6506007)(6486002)(7416002)(2906002)(64756008)(316002)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmpIajM3MXlQY1pvOUI1a3hxU0F2SmRoVEJFQjlDSlpPcCsrWi9VZXFST3ds?=
 =?utf-8?B?TG1IemFXaERtVGUyV05iU2c2eUhDd3RKV1hSci9YcVdjY2R5bXB1cjBNbWNy?=
 =?utf-8?B?a0JMS2dkQ1ZDaS90WW5pQm5Eb2RmZGtlbDVicUV6d2pjQitSS3Zyd2J0eUFK?=
 =?utf-8?B?OUtmaE9Uc1I2VExNYklabGgxRjgyUmhqNHpDeVhnYlpwZGM3eG1JUjhINVJW?=
 =?utf-8?B?T1kyRmVPT0dnZitKVmI3bWJKaFhkc3NJOWFpS1RjT2hrS2g3SWVjOGl1dmho?=
 =?utf-8?B?RXpEcVhhSUVGakh4dURKUmVoRHBPUHhDOXNyeDl3WHAxZ2JoWDdEMndGSG8w?=
 =?utf-8?B?UVNtTTNhS0F3R3RVcnNOVTNPYm9nc3N1RWVtNmI3NFVoa0doaWVNTnpINk9q?=
 =?utf-8?B?VThQZzJFZXRST0dXN0RkOFdkYUxHckR0RXVPMGM0Z2tTa2pRaW5mQlZqbmlw?=
 =?utf-8?B?K3FVQ3J2NktqbFVEV1o0QzNXa1FPZEJDeldkbDdDSnJSZG1nL0J3Z3dKamlB?=
 =?utf-8?B?Y1BFcm9BeDErTkcvbzZNZFBlQ2tuWkEyei81b2NYWTI1bU90alFKOXNrU0Qw?=
 =?utf-8?B?UVZCb1lXMVZRUWFVQVpIeUpzSzhlQmVwUitsa3ZSbW01c1czVFdldFRBYnBs?=
 =?utf-8?B?dVlPQ2lQeUlVSjJyQThLNzYwOGVFSGNaYUVwMkVwbnN6LzZwTkZ2M3VqV01V?=
 =?utf-8?B?aitvazhIVDJhYmd4MCtrbllOcmJiMTE5NWprK1E3TEgySGVOT0ZOMHNSa2ZY?=
 =?utf-8?B?UjhpVWZja3JzTlVUVk1Kakk4N1d5WDAzNDNRZnNDSjJCODVoUUhLUlhjbXFO?=
 =?utf-8?B?SmJ1aDZPV25rckM0bEhwZG95R1NnUEhhMUp0ZG1SSzBuL05oeUJ1c1crZFF4?=
 =?utf-8?B?amxNakIzVTlBZjhHWDhvb0ZrRmRheHJNMEIrVDNrNk54OENYcEZWS1hLQmgw?=
 =?utf-8?B?eHJwcGZrVXByU3Rsckd4d3djZ0RweWFiYno3ZUpZSjN1Zkp6bWZ0RDBWdGR3?=
 =?utf-8?B?dVNtZWNWcTdQR01OMGJPUlR0UExqS0FrL2RBQ2lyOW9IS0gxOEpPZE1kcGZz?=
 =?utf-8?B?THY3U3ZFWnl4NzRSNU9ucVZQUzJ1THpQbTNzRHhwU0k1RDUwZXBWTTh0YnV5?=
 =?utf-8?B?ZnZhbEFQcWUrVWRvckhPQmVnK3l2OGxiWEZ0UHA2OHBKODBjcDd0dGNQZzVl?=
 =?utf-8?B?YXpuZmhoNk1XWTVjcWRKenZxTmY0V0o1VVhRZDNPQ1VnazNJa1BRWkliY1Qr?=
 =?utf-8?B?NDk3OEF1RTJxYVdFbTVqenVMSklIVUV1NzFYTFNJaVpNMTd2Z3Fia3NseVdv?=
 =?utf-8?B?L0oxS29wM1R1S1NBdUxJdHZXQ1RPNnBTemVNOVcxQnB6M1RmL1dpQ2xqeSsw?=
 =?utf-8?B?cDJ1cU5XWWdNT1FIOTR6RU5SUlFLcXZ4bnd1czFHOUhOcEJqUGdCRGlGUmc3?=
 =?utf-8?B?VTF2YVNkZUpzMDVjZGNOdUpZWVFLQXVKYXJMR01DWkczWG1vUmdWOWx0SER4?=
 =?utf-8?B?ZG5ESE90U09YK0p1K0djKzdQZ1hYSmJtME5CRDlkOFcvN0Q1cUZBWXA1ZUc4?=
 =?utf-8?B?OFdCNEdURHpybUxlOXBDbnB4R1pXaDZaSTlFVjNOMVBMRmlsQmxmS1pNN1o1?=
 =?utf-8?B?OFBkRk9pb2dhMEFYbmJMaURDSmFnVHluUzJ0SXN6akp6S0VBOXlObzRpVVg0?=
 =?utf-8?B?YWUwaHg4bjdiT2k1Rks0YlpxTVhObnQzTmthcEVQR2c2K09TVzB4UmFjMktX?=
 =?utf-8?B?bzVDa1JmNGRFK1Z2cTl5YWF0aU5CMVlLRjhVMjFRbDFrdVhkSisyR2FnY3gw?=
 =?utf-8?B?Uko1MU13RHJZUFBTVmh1OFlxSnRlaE5PbHhjcEJqWi9HV0hOb2FZNzhJRXpt?=
 =?utf-8?B?cFZmRUlzNVpyYjVVY0dOTUZpQTI2S3ByVDhKUmJQVXU2cHo4ZzlIY3BJUDNI?=
 =?utf-8?B?WE1JMmxmdFBIdm1rOHRRYmE3KzFzMThSMExUY3kxZFBWeHk3U2RTUkkwaXIr?=
 =?utf-8?B?QUdxWHdObWJJWHQ4V3lOMXE5WG1mQlhMcW1pWGtnOTZhNnlma1NLYUYzc3RN?=
 =?utf-8?B?T0ZzcTRJYXR2c3RRUTVaeElLaVM1c2RtSWhuVUphSFRENS9tRGhnaWdBbE1G?=
 =?utf-8?B?N1VUODlhWUdIc3Q1V2IvRVYxcmI2dTR4TEJpd29Lcm1BUm1MRmNnSWtGYkEy?=
 =?utf-8?B?MlZHekUvKzdCQWZlWmVINU15ampVR0tZR21teUtyZEVXK3ZrbnB3S0hTZE1L?=
 =?utf-8?B?bHlwNHZwL0ZMYjVlYzJzR2dsQlNRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <015E1806D01EA94FB7FDBF6DF471AE55@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0d0e0c-51f6-45fe-e98c-08d9a37abe22
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 12:16:21.9419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DObmkzGm1DDKoOeXdwxAYjX8dqV5Sq/TW/rYCOpn+mLXD7ZRGVghCCQt+dLOyBRK7AOHcmNY688R4zJ3p7uV3KhKZhuaoMnFBZe65FvQIoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1277
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDkvMTEvMjAyMSAwNDowNiwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gTW9uLCAwOCBOb3YgMjAyMSAxNTowNTo1MSAr
MDAwMCwgY29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBGcm9tOiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPj4NCj4+IEFkZCBkZXZpY2UgdHJl
ZSBiaW5kaW5ncyBmb3IgdGhlIHtxLH1zcGkgY29udHJvbGxlciBvbg0KPj4gdGhlIE1pY3JvY2hp
cCBQb2xhckZpcmUgU29DLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29u
b3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+ICAgLi4uL2JpbmRpbmdzL3NwaS9t
aWNyb2NoaXAsbXBmcy1zcGkueWFtbCAgICAgIHwgNzIgKysrKysrKysrKysrKysrKysrKw0KPj4g
ICAxIGZpbGUgY2hhbmdlZCwgNzIgaW5zZXJ0aW9ucygrKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9taWNyb2NoaXAsbXBmcy1z
cGkueWFtbA0KPj4NCj4gDQo+IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFrZSBEVF9D
SEVDS0VSX0ZMQUdTPS1tIGR0X2JpbmRpbmdfY2hlY2snDQo+IG9uIHlvdXIgcGF0Y2ggKERUX0NI
RUNLRVJfRkxBR1MgaXMgbmV3IGluIHY1LjEzKToNCj4gDQo+IHlhbWxsaW50IHdhcm5pbmdzL2Vy
cm9yczoNCj4gDQo+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6DQo+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvbWljcm9jaGlwLG1wZnMtc3BpLmV4YW1wbGUuZHRz
OjE5OjE4OiBmYXRhbCBlcnJvcjogZHQtYmluZGluZ3MvY2xvY2svbWljcm9jaGlwLG1wZnMtY2xv
Y2suaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiAgICAgMTkgfCAgICAgICAgICNpbmNs
dWRlICJkdC1iaW5kaW5ncy9jbG9jay9taWNyb2NoaXAsbXBmcy1jbG9jay5oIg0KUm9iLA0KU2hv
dWxkIEkgZHJvcCB0aGUgaGVhZGVyIGZyb20gdGhlIGV4YW1wbGUgb3IgaXMgdGhlcmUgYSB3YXkg
Zm9yIG1lIA0Kc3BlY2lmeSB0aGUgZGVwZW5kZW50IHBhdGNoIHRvIHBhc3MgdGhpcyBjaGVjaz8N
Cj4gICAgICAgIHwgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4NCj4gY29tcGlsYXRpb24gdGVybWluYXRlZC4NCj4gbWFrZVsxXTogKioq
IFtzY3JpcHRzL01ha2VmaWxlLmxpYjozODU6IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9zcGkvbWljcm9jaGlwLG1wZnMtc3BpLmV4YW1wbGUuZHQueWFtbF0gRXJyb3IgMQ0KPiBt
YWtlWzFdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLg0KPiBtYWtlOiAqKiog
W01ha2VmaWxlOjE0NDE6IGR0X2JpbmRpbmdfY2hlY2tdIEVycm9yIDINCj4gDQo+IGRvYyByZWZl
cmVuY2UgZXJyb3JzIChtYWtlIHJlZmNoZWNrZG9jcyk6DQo+IA0KPiBTZWUgaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wYXRjaC8xNTUyMzg1DQo+IA0KPiBUaGlzIGNoZWNrIGNhbiBmYWls
IGlmIHRoZXJlIGFyZSBhbnkgZGVwZW5kZW5jaWVzLiBUaGUgYmFzZSBmb3IgYSBwYXRjaA0KPiBz
ZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBtb3N0IHJlY2VudCByYzEuDQo+IA0KPiBJZiB5b3UgYWxy
ZWFkeSByYW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3Zl
DQo+IGVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBhbmQg
ZHQtc2NoZW1hIGlzIHVwIHRvDQo+IGRhdGU6DQo+IA0KPiBwaXAzIGluc3RhbGwgZHRzY2hlbWEg
LS11cGdyYWRlDQo+IA0KPiBQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdC4NCj4gDQoNCg==
