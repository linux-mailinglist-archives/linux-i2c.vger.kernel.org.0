Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D57B44AC02
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 11:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245480AbhKIK7U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 05:59:20 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:44953 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245473AbhKIK7R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 05:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636455392; x=1667991392;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pUm76L9cWX0fCjs30ANxgKqDIsOEejTi7v/bICHw3YA=;
  b=MW++jbgWfBLXf83Imx2QIhZGxKMFTyg2YCKboGAwgy2foEriobUJ6tZY
   eOyXwdvb5qlC2+F9KRjsYPSvxY99Et52wQqGTLoDBJIzAZhYzbGpQ+MWw
   Si81t/xQESmqhE+1GaJST3ItrkVs+wG5MpDbWbT7yA8wWxT3Y1un+B030
   ZQGOxXrT9vanjU5sBHjfkN4NsZ5zkyDwrH3rDP1d9xTxebf5aOdko8GXS
   dMgXmgAVnIHPpDGfsTz9nlyLgGj87XnvKaiTU6YY/0vyu4jajdRcyl41n
   X0Zga8HBKmESOdSVImXacgWhV6vdAf+RAv6IgQjUyZ01K3AKIZvOvJGz6
   g==;
IronPort-SDR: rm4/z2emPzGe4oukIJsXOuXd2a2Fa6mQ9ZqDvdGTUqJyNjturNdFFtm7rzIIGsBo/d1RsLsK9t
 kg+VH4fbw8Wyx6Q5c0g2Jn36mQ1p/z9CfQpQJPkYhPqgio00ZwrO4NzTT05fpbd+Mj6hnp7O3y
 ld4UETXs96NAqtb3+U/9957R4aK5ooo8fXfQ4nz8zI5m/S2G1yqTy4i+8giVoIdFPy9YULy3S6
 5QgyfJ4GIQL05u05cNgcY5b4ZwkorH7d7nIg71aFt1Zuh7c86HP3Vgfi4HhmhKVxJovjNcV7/0
 62p2SlirtJDd9SkjzYdPnSbL
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="142723382"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Nov 2021 03:56:29 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 9 Nov 2021 03:56:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Tue, 9 Nov 2021 03:56:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnlGmbtER8yYu5Q5QwZsnAHsKXwCQ2arZk+xOrL+ib33VkWJe3hMM6U8r2fqlSDc3YqWAb5KTZFThHPBrTX5Gqu/SeeLr0cXUyjWK/qZQKf4SSw9JKtbJkQC536QYcLHKr30cDpdbgwse76sqs8L9FzmnvGXzP1JgX0xDtZKosKqli0C4Ou/N3m997sQbi8RCPBNOU2IUgLnn07GIcp1nd/GCv7cVye1gGKriFBV7Y0Pb/o+neFofpC/eGjaqQZQYtVY3tr/Cqcq66HHBMKggFXU6C6xjdibHFWpTsPWD8nHKIU+nCc8lkz6Rblw1Fnl7m8M8wvUYvTzGq5uJFjLfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUm76L9cWX0fCjs30ANxgKqDIsOEejTi7v/bICHw3YA=;
 b=BSg4K39+YCGat7bIO4ehEG7W4HvK4h59wkqOas7v/GvDVRC9unjsqUyRU2zrl0dCpiLWJtWlpiByeTAPEWOtyajXu9CEvsyyEoG3bc39pvgYo2nzDDMXfPt+1WmO/BFfnygM+NddhXuOQxQJk9ErXxp4QJlOM2HubfqFOlIlmsOfq7W0f2Ggto/6Foe7L7olRvvRt1M3RH1jR26VYkxmRF6y1yUFs1f/GTqXpmPBys2YDFA+OhDMeuS54J7kU+tZMqlAHK4Q3/5dCBK65niAUaZFVSxgmZvELIlLLaLAazi6c2gALOByBVMoRYG0L4AClhD27Nv4kldDt8bMXvhECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUm76L9cWX0fCjs30ANxgKqDIsOEejTi7v/bICHw3YA=;
 b=cM+J5AARgGBKpvRLYpGOWG8l06n1GyGTQdOmqkX7SOczWq7184pCKzM09+L7sNshC2Oe5+YfgKcl7CbwDRSb2TvHRrOBQCMF06HSemt18VD09C1PjHDis6CEOtT1co4BTpFSMY3W6NJICaNYPBrYvWBA7In8zRNK5DAoqLrGEBE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB2064.namprd11.prod.outlook.com (2603:10b6:300:27::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 10:56:21 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 10:56:21 +0000
From:   <Conor.Dooley@microchip.com>
To:     <geert@linux-m68k.org>
CC:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <Lewis.Hanly@microchip.com>,
        <Daire.McNamara@microchip.com>, <atish.patra@wdc.com>,
        <Ivan.Griffin@microchip.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>
Subject: Re: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs
 spi
Thread-Topic: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs
 spi
Thread-Index: AQHX1LJfUqgSbOdkdUS8ce/NVnrEbqv64vgAgAAkrQA=
Date:   Tue, 9 Nov 2021 10:56:21 +0000
Message-ID: <461e6b4a-0e50-c218-0c22-89549f3b16d2@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-11-conor.dooley@microchip.com>
 <CAMuHMdWQxz5eprDuqJcsXcp+cKPwxoV=+if_qvS9ah5qBO-shA@mail.gmail.com>
In-Reply-To: <CAMuHMdWQxz5eprDuqJcsXcp+cKPwxoV=+if_qvS9ah5qBO-shA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49f99e48-da6d-45db-9863-08d9a36f90c3
x-ms-traffictypediagnostic: MWHPR11MB2064:
x-microsoft-antispam-prvs: <MWHPR11MB20643ED88A4F31232AA260FA98929@MWHPR11MB2064.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lpUhvh1G4kjVKfm7yvPPzL6dGnEpebJO9Ko3rBMcLFuz1cooaXeBen2OB/GIEhAFPxZB165M4vBSTmbUvAR7zIhCsfKsbKgT7N7OfFYsftEz/+XrArvipL+tWgcImvRfO7pcvH1R8k1vReifppkD39jnFvRXL2u6uYbGpba1YlPvoUj5U/DtLS6MQsoP3QGDjZdDtdBNaH7s2knrstLVa+MGgts4eEZyskKwLcZ9VxPMhsoKu7ncvTz9pXn+1ALT9B0HPKAcxB1O/3M1yUjO8RDzYoXIem4fdjgC2L1H35hjU0xj9AC2CR493MYq/colJarG6Km2uQKJQSoSnKFL7rHWeOePB6Bv8Q5alrx0muYTOHKmZB91OC+C+NmQlD3cB4tyPz4wKYIWxNHB3bgJccvptwpyW4gbeXQp1+ThcT0DflAhTOrPmHJimooi+MiB6MSUe0VXl75ymkPLAkNIr0CiwVyzGvigO5oyuhQTvvQZVoZRfVsGXeZJR/10r2YEIOsxEFofYKI+aXUawU87/3Vs0XJTE9xCBGkwPx8fi2ARrKlrUEAKenNsEsfW45vhuvSGswkQ2bIaJ9IF8Ixv7a1LJvT8UqHgokx1xf475XyLrvs4tbBucG/tLIoS24rG5hRt3NoTc7QdXYXRwjv7pxfUQC886UkVQgxcjOirJoXFBLZBJXRQbMmiiodU3k3EaFoTbLRaTvNUee6TbTKrjP3xWnuajq9QrFZUzdU/kw7/cNwIfDgnjyVyQiwZ1UZ0yUI2yYL+vMPGb7m5xLhU7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(6506007)(86362001)(5660300002)(71200400001)(91956017)(26005)(4326008)(4744005)(31696002)(2616005)(36756003)(8676002)(66946007)(6512007)(186003)(6486002)(66476007)(66556008)(38070700005)(508600001)(66446008)(76116006)(64756008)(54906003)(8936002)(31686004)(38100700002)(122000001)(7416002)(316002)(2906002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3dLa2gwOE0zQUZ6M2EwY0xLWGp3dnVGYmxtdWpHb01yNEpnd1dpbUpUbmZR?=
 =?utf-8?B?cHBvZWM0Q0cxSlQzdVBHVFVId0tNRkN2M3pUb1FmSUVvY3BLcTFJbTVzZ0lH?=
 =?utf-8?B?bDZDMEYrZGF6TzhaVThNY0x0NmlxVWtkaFFYaENmdlBmVVN4NzRoQUNVc0l6?=
 =?utf-8?B?VlJ0TkVXSjBDM3hmNmc1dk5aU3ZkRlB5SlpSSG1lSkhjODY1OGp0ajRNcWVa?=
 =?utf-8?B?Y0ZXd0FXdnI4bzdTeUhmY0RYMTVIbFNEOHJFc21wSmZLQ2xPLzVJWWhleXly?=
 =?utf-8?B?S2ltbGd4bytlNnVXc09rVW9lUW5XVUhaNWJxQ2lnWUxSZTFnZDJjSzE5eldl?=
 =?utf-8?B?U1FRbVVwdTQ3MWlueGRoT2dMcEJHOTEvTjgxYjF3ZC81TW1qanBkNFVzMlNv?=
 =?utf-8?B?ZlNlRWhqd3VzNUdOSDlQcWRyRzJsM1dZTTFxRmVjQ3IzWXAvOU9FaVgvckVv?=
 =?utf-8?B?MExoVXNuUnl0ZWZUYVgxRVdCUjUwOUJUeVZIWFhvdjNDUjZFbnhLckE1SWJw?=
 =?utf-8?B?WDhuMm1XSUczZmRLTlFuaWYwK1k2NW10bVFQbmQwd08rOHpoWUVBN1NSL0dM?=
 =?utf-8?B?ZUc1cHNaSnQyeDBCQ2J2bm04MVUrZlJ1blpEZmZ6ajRUYnhMdGI1T3RNdi9L?=
 =?utf-8?B?ODdKd0c3RTNaRkRXdFJFSTlOQzEwVWdIdDczZVQ1ZjE4NW1ESGRVSXYvMTAz?=
 =?utf-8?B?RU0wZlg4STVQVTV4K01SMEk0bnMraW9kZU0zM0d4Wi8vL01OcitQODZiVEo2?=
 =?utf-8?B?NzdVL2FEM2FtcWJ6VXVuMTg3KzFiZjRlZStQQU1ZRDBCYm5zTEt6dEo3Q0g2?=
 =?utf-8?B?TFlyOTh3UmNoRjVYa3hnM3dKcnlNZEZ1Z2dQN1MvcHhPdWN0RDhJUndsRVUy?=
 =?utf-8?B?NEFMZE9XT1JSZ2F1OEpGenNaU3p4bG13VlcybnFpSlRRb2xBZEFWNWNtaElE?=
 =?utf-8?B?eEpJSFZNUVRwMy9yb3B1WENoSERhQ2dsdml4ckxnUE53b2Zod0RoeEZkYWly?=
 =?utf-8?B?elNxNTBtZzAwZ2dtaFlLSnYvZXVMellNTDJnYzNHOCt5QVRnYjRTbTNyaFdx?=
 =?utf-8?B?ekJRTXpYYlRuUFFsWXNaUTh0UmhKeDFadldYQnM0UCtObGFpZTF1UHNoRkp2?=
 =?utf-8?B?YnA2b1FrYU42UU5zbTZmRXVueGE0bDZadmdvdlpnYUdCQkNWREp2bkIzQXFI?=
 =?utf-8?B?RHc2cDFZb0pOWWl0ZTNtMGVVa2tsODlFKzdiVkZ3aVo0c1ptaHRiVnRWOXRX?=
 =?utf-8?B?NDRCUkpQSzFkUWxHTThmM1ZuNDc5OGhjT3BOZ0FwWmFrblkxdUhQTHVZdG95?=
 =?utf-8?B?TDFubjNwLzdUa3ZxT3luKzk0MVAySk1jK1JuQ292SVJmOHVJbHBpYi9ERklw?=
 =?utf-8?B?ZVppbkQxNG42TTM0MW0zOXI3c0cwaVJ2NDY4ZzQ1Q2hiYzIzTDgxYU5WbHp6?=
 =?utf-8?B?ZitDTyt3M1JXb2J6dk1WS1lSaWFLQk5taXlMNVN6eWpucnlWNFZHRUowVk1Q?=
 =?utf-8?B?eWU4QXRJVlc0S0x4dFd1V3RiaElRbDhWdVZnbllhdVEzcHUxVS9vV3UyVVpk?=
 =?utf-8?B?MnFyT0gwNVFmN01nY0t4UTZxV085UlNzbEErd09FQmp6NWVtTjIvRk1IU20v?=
 =?utf-8?B?NW9zTVFrSUtkRWExMERGb2hJUHlHVFFXajBNU2VEQS9KQnZ6M1RNUC8rTTk4?=
 =?utf-8?B?RFRDSUV0UkxyYzFrckxiMjVMSW96M1BPZHF5RFNWZUV2dnh5ajhSZEZxeloz?=
 =?utf-8?B?TnhvVENXQmhFVC9ydE5FN0ZDVmdUOFlpOU51QjFlQkVHN3k2V0dhWHdiZnRi?=
 =?utf-8?B?M01YUkJxTFBTK2Y5SXJNN255dWdhSncxVHF1TnRzczltNUpvWkdZVHppeWtO?=
 =?utf-8?B?RkpSTlNFVHN4a0d2NnNtQTB4SzZYdWdoK1RqbUR4anhXMHhpZzZuMGhORG1u?=
 =?utf-8?B?ZndOQS9RaE1kZ1pjcFJFRmNMQTBWMnNLUEMrbEErU0kyZHh0TkFNN0x3d1oy?=
 =?utf-8?B?NXZqZUZuME4zTHVjVVV6TTc3VlhqaFZtcmduRnArcDF6dWl4K29jSVpzeDNC?=
 =?utf-8?B?czNtczNUcE44cTd6TWJyZWpSaHlDNG5GczZaeXhzOFNLdWdWV0JZM1REOGhk?=
 =?utf-8?B?MXhNTzR6RkpIYTNzaHNCbjIwbHZpNUcvd3pwaFhpRGpqeDRjc1N6NXRVdjlC?=
 =?utf-8?B?d1hZT3hpc3BFSGFLQjdjM3V2cy9PTVlLMCtNUkdDUnJUZ1BKKzgvdWdrVEt4?=
 =?utf-8?B?Wm5Qb1BMRDZXRFFCNVY3dnZkOFhRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A90CFD663E1CA4AB5B32604872BD907@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f99e48-da6d-45db-9863-08d9a36f90c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 10:56:21.2372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3vMPAq0Ah8l4/WYeM9mg66Pxsp9+Cdwg4P6dSI/7/EQtNTz6ppUIvtlgoVa0MbQU3AAanpxolup0AHIGB/8NywYmNZeJxxi/h+fsWkJVcQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2064
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDkvMTEvMjAyMSAwODo0NSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpIENvbm9yLA0KPiANCj4+ICsNCj4+
ICtwcm9wZXJ0aWVzOg0KPj4gKyAgY29tcGF0aWJsZToNCj4+ICsgICAgZW51bToNCj4+ICsgICAg
ICAtIG1pY3JvY2hpcCxtcGZzLXNwaQ0KPj4gKyAgICAgIC0gbWljcm9zZW1pLG1zLXBmLW1zcy1z
cGkNCj4+ICsgICAgICAtIG1pY3JvY2hpcCxtcGZzLXFzcGkNCj4+ICsgICAgICAtIG1pY3Jvc2Vt
aSxtcy1wZi1tc3MtcXNwaQ0KPiANCj4gU2FtZSBjb21tZW50IGFzIGJlZm9yZTogd2hhdCBhcmUg
dGhlIG1zLXBmLW1zcyBlbnRyaWVzPw0KPiANCg0KaSB0aGluayBpIHdpbGwganVzdCBkcm9wIHRo
ZSBtaWNyb3NlbWkgYmluZGluZ3MsIG9uIHJlZmxlY3Rpb24gaSBkb250IA0KdGhpbmsgdGhleXJl
IHJlbGV2YW50IHRvIHRoaXMgdmVyc2lvbiBvZiB0aGUgZGV2aWNlIHRyZWUuDQo=
