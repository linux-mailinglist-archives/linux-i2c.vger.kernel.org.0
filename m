Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43758478A35
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 12:40:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235599AbhLQLkh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 06:40:37 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:28890 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233856AbhLQLkg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 06:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639741236; x=1671277236;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=HYDvRxcJFMohPkow4mLMWwn2BU3LgtnBa6RvKL3x4dc=;
  b=b2VzqWu99AHi/Ky0pOed0HcZWbB6IzskRdxGknKzu4KihY7GyMGWdndj
   cozgj4thErNllzmX/SGZpQngiLHVDCzXppZv63Pg7XKWkDsVP373S4qXM
   pR/1/C0Tjmk5mvDJ7Yi9PwAZe1mXa87O+gB9l7aq5Mn0N+ca25yhCB/j5
   Lo9kCnpHZDT6inkTWVeT7412YRh+IVXIguDk+Q1EeovwxASUNRpybd+jJ
   AJ+qry5FMIljLhP6TubCvzVQlnbNK2uIQOlJH7UQNcOrMZzyaXj5zBQ1C
   jFjDbOyZJXbH3NPFqICp6bwfPm7H839yWso0a21fRbCQVcSelwiW20HgP
   g==;
IronPort-SDR: nJYl4QRDxdnp8VjcT4Z5ErZh+AapD8WROHt+7FMdewXZ/zit5e9JKFSUAvBbtBMX841sC4crRk
 kONmuaaZKIR0HyXEwZPVovTtN3jULWrjEO+TiYUIuMciNlHetoaUVa6tZ0lgfsbUG1zf95u31k
 vfnuzR78KJqBS4WdPb6Ycir8aznr8c7U3xplrZ9YGM7svOKMpDm+ojWj8XhoDOp8gSeak8lIht
 lE2CyifKIBDBL2TcjM3egdaI9lJhPDfyoVNiqtN2X2x/KhA5Tr6ev462ZIIWC8Cq5m62GBXN1V
 drbFQouMkymxeINkhplAbHsS
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="142756921"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 04:40:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 04:40:34 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 04:40:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXLusRm7J89RiFBsiawuX9mA7D4JSWn2EbBIbSKc9/3pFyPzAQxAAS+Q79fQVj7GrwALRQjD3BE9BQZBau90U/DCEsZVJQIaZRBzZNQh29dpwRBobgfWk42dBAhFVXRSgxaZF4hM/NbIAE/toQfpHDzb/DFdf6vWt3ivwxHnsq8Jvby5B0dXtUatjSwtvIjA8qkNE8WhdKBf0rhBqz9P92//+PStUTXXxWxvVSJxAMK+884cA0dsrymkw8kYOTp8T260l1UH5KSRWlMrQ4J9cSv4DHE1JYnIw1hhowDZoSAUrf4/2/jIKHfehf8YY24CHUfhzerIJBHFSQOZl0G8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzxQQzROenTKd6hsTmpFwA5vtLVA4v8RI62IapKlwdQ=;
 b=Id3DIl2QiNhQmh5Ra85wDkBCFt2WqJKpyN5s/gdoqBj0ujZ9OSCQ3MaPRVS4h3lZO+GH9jFMdBDahH8Ry0/FmQ7KF/ZaaZdeRdh5aJ+OJMexSJOwRoSpOLNgg1tBEoEF6pcDU7+uZsj5oTHp/vtNOx1TX9kmqEqP2fago63n4hCQ0cmPuWyUiNwRKMeoyznLHliTnfUbs/KdzrlvJMDPX282ydchvupyhJchVQkeu+2YbAkpOSK+OcKGUAQ4BdlE96FB0CEPthg/UIdGgSA8TWZmLIxcXv4iS0QKmpXe6evaDT6ikGR63OWTtOET2wHXNXl/cXMQYcZiWYkBX5rwqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzxQQzROenTKd6hsTmpFwA5vtLVA4v8RI62IapKlwdQ=;
 b=dXaEQfKUVd+p+Lx1VHUJK9raW7gOsNxYdNSaFTxdHTC/6R9cqvPr5u8cnnh3YbgLJNzjwQPIO50B+SXGWVSp5w4TL0TTF6ZIgekhKuZjL1NQ4f47iPlXarVl09dwuzQ7mYEGLs8bj7MzXrTlWAzeu5Kr/B7C5gyj1uLnmr49Qf0=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MW4PR11MB5871.namprd11.prod.outlook.com (2603:10b6:303:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 11:40:29 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b%9]) with mapi id 15.20.4801.017; Fri, 17 Dec 2021
 11:40:29 +0000
From:   <Conor.Dooley@microchip.com>
To:     <broonie@kernel.org>
CC:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
        <lee.jones@linaro.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <krzysztof.kozlowski@canonical.com>,
        <geert@linux-m68k.org>, <bin.meng@windriver.com>,
        <heiko@sntech.de>, <Lewis.Hanly@microchip.com>,
        <Daire.McNamara@microchip.com>, <Ivan.Griffin@microchip.com>,
        <atish.patra@wdc.com>
Subject: Re: [PATCH v2 10/17] dt-bindings: spi: add bindings for microchip
 mpfs spi
Thread-Topic: [PATCH v2 10/17] dt-bindings: spi: add bindings for microchip
 mpfs spi
Thread-Index: AQHX8ykv6sbPo1+d0UqqLmeeX2B3NKw2iOgAgAAHFAA=
Date:   Fri, 17 Dec 2021 11:40:29 +0000
Message-ID: <606633c8-6cd6-af3a-4d6a-bb3058a64026@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-11-conor.dooley@microchip.com>
 <YbxxrlmYGC3Pg8+j@sirena.org.uk>
In-Reply-To: <YbxxrlmYGC3Pg8+j@sirena.org.uk>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c9df332-120c-4b94-2e0d-08d9c15206d9
x-ms-traffictypediagnostic: MW4PR11MB5871:EE_
x-microsoft-antispam-prvs: <MW4PR11MB5871CF478CD889DA79D7C65398789@MW4PR11MB5871.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f5bKKODXQecemrsOlEZJotowy6ldLN1NXg/dE43/es9eVqRh9FNLuTBdb6xpaDj+tC3RtEsOoRWS+NCQ5HP3pa+0NRjXoEoRyT9YJcO3yo+oLAgdNtjlNjflqeAGcdzgX1neDbXKjZ8AmgCM8Y5ZAMFRqcn1fHxmkoiyI2FqZGNStwRrUHgsOkOMs+8cUlBRQ0tt32FetTRTQz5ev9nFf6Mil1MzwiH57BlepbYLVjcnIQVsGMNHSjpDHIaq9/uXsMQ6/n2ZlfWP3KOs1glbV9xQjHWqXHl588W0fHVW9oqSJyw2EC4sU+CqK69vppVvfFhQU2UpOHz0XAYn3wN7GIZMntL9yqZghi6Tm8sUdvwYNt86W3EtuDtz6Lzuz2598ag7TyvGyVbpWcea5NC4ZRuL08W5NLiST1DD7Yxo1aApL/WWsgb0cJ6VajOD5PI3FjpocYPYvHtrgiGJLaRaBhGLYxAQihds+KwfoHUS2Om3i2iGqr4LhqfFN4Ts4gmuBnmXpfzWwwmiD4iKZj43BG3enXZvAQl5Jvk4o01+GwXSjxn3WfrXQJgJMfTyAJ+IK5HuNkrrEcbv4uMrf+xl7OGcbogd68pV93x+7ajwKFTtFHb4fEeFOmf1tY6sNOefnKePwZvwpyjksXy1IdiVlaN80JqEOouzVEE4s8xCTRocBmmJnGlSvezSY0qakY9w1PvuALWa/NHgGdwyh7OcjYiUjkdXFu+Ofu58YiH+Z7LIAsR2Nkiy5pZNtJoshfhp7+R82zt3o0fKeZOx9TDy9Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(31696002)(38100700002)(122000001)(86362001)(36756003)(38070700005)(26005)(31686004)(66946007)(64756008)(66476007)(66556008)(66446008)(76116006)(91956017)(2616005)(6506007)(6916009)(186003)(2906002)(508600001)(4744005)(7416002)(54906003)(4326008)(6512007)(8676002)(5660300002)(8936002)(71200400001)(6486002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?3CrJwfzPLRJAn8s2BtQbHgLCVKgsODp6JbG1OF3r6ENdfraiCcic9H7k?=
 =?Windows-1252?Q?cC8VwCT9H98S4KFPhakCuara0nUYR7J/fLwD6mEwK6+SSwKHkvi1MlOl?=
 =?Windows-1252?Q?Enki7JCQ7ZM2EwcXLDz2wEKVpN4L+lZnecTg8Y48/m5Yj5qVSYQEtk4S?=
 =?Windows-1252?Q?7MXs4LSeOvURPT/ocIg8ERHRhFMs5Y0OULzgUgHs9zg93grS+g6Rc0xl?=
 =?Windows-1252?Q?8sNBqBAHEqGP4GA7HcXF5+a8PEr2kofNLKJJ2g1saOcMb8Mv5XBvX/yR?=
 =?Windows-1252?Q?8uv4mJUySTBmOGwaCgdyy4wtiYOiSK5xUKCUtGSsLU33V0RNtQgw25Qi?=
 =?Windows-1252?Q?jp19+8ioVwZVzxPyadiABXCp/TDuPKO5Hb3achw3ME/zFHPe1KUNdo9W?=
 =?Windows-1252?Q?UtKhheVl0etGUrr0vpp3j27qjIqLlAJJGvCPLnlnTSqf/NFGoOt0wtYC?=
 =?Windows-1252?Q?pAmMhxph/rOrw/TTSRHmKosICRdOlB6VhWL2vZek6KIkSLs2Xsk0+PEw?=
 =?Windows-1252?Q?tMjbjTc2jy3fa2DUi6CSVqTjfub7U/2iO/rjvKWnfGOZbD/VSWfMja3a?=
 =?Windows-1252?Q?0OlpgWhMzsvPDvaF/4Oxpmxd5Uci6n4bkD+o7esqkZ/xY0dhcR/AIRBR?=
 =?Windows-1252?Q?uIBAhLPBcvga07hdkdgbUvDjt2aZHi4MWuxyJ2bBl9+I20Xyp0Sg0yzi?=
 =?Windows-1252?Q?Tb+VeqfGg9uFcTRyT8DWSEVMh5S3Vx+xSUzRaB4O6EtjcZfgNPTLdi5M?=
 =?Windows-1252?Q?c0i7g8A9nGt5lxuwNs65oQjB27amW78nwiz9Tk/SY5fa6kIaSyRmScVc?=
 =?Windows-1252?Q?ReAOsLmusIerveA1KZ9vXYHv8/Ypeg4/b6I1csKMec6o0A+ai8Y7aC+w?=
 =?Windows-1252?Q?ntUp4MR4PMA3uRtV8jNyLSCO9sSnicNw52klfsWB3pKYVt8xxDqAwDUH?=
 =?Windows-1252?Q?LZQ2mvI0yFORsy61VZzO8vnGoUQOe1Q4LtDwitR/LtFI1Uvgjq5+IAA5?=
 =?Windows-1252?Q?Q24Txl+3JWxux3ynokcugRbpVfnFnQSMNV1HuFcu8DPajdFJLmFVs6xB?=
 =?Windows-1252?Q?pJRn8vTY0lPdJnRA9QP98ry4qWmTqjgOpfPQM1TjcKMnr2oMlRjld6GO?=
 =?Windows-1252?Q?T4JR8i94O7ZUN/vl7rWubYf7nieVeGzhopksUK5eQK3Ng9EuqVfdGkV8?=
 =?Windows-1252?Q?jfbZqd1YFSHJB0CXO5uPCBqgPHofbUUFaidF0PkNHsvvoSyaYj8FiTqi?=
 =?Windows-1252?Q?plCDXxW/uUFuqNFYSCknSLcSQY0voLCHjMpGWJOBf0lwDhLc0bAXnDS2?=
 =?Windows-1252?Q?gmKpqEz9Gj1eoJ8upZruK7SyfKRqJQ2xMcnUNi5R2IzLBvrL9zFZCbh1?=
 =?Windows-1252?Q?i64H0ywZpMxtstSqMl507DJ/9C8CmZ+ze9+PPIaW0U0D1ThFrTzEH6UK?=
 =?Windows-1252?Q?HiUbxQxuG1jzxjLLWxWQEvYdSaUBkkIntf/lUnqKwbrm0GTr6fBMDnbY?=
 =?Windows-1252?Q?/+NwSxK68Nroq2UZKl1wUNqi50jVSi9hbcicdQmCrENGYxSJBejqWbNR?=
 =?Windows-1252?Q?7MN+fvB4dtlEfg/CpOYTxMlF8mcDjDwwPeZDxgf3fHl+cEFjBIiWSzYN?=
 =?Windows-1252?Q?dnT4ysT6F8YzXwFml7EHwW8lvFa9V0rqYWO+owcIWeuheh4ReaLnw7OT?=
 =?Windows-1252?Q?zakKlMYbSrhqka39QJQJvnEInvOuWHexfOedRhT+UtG6cf0bWnshnA3h?=
 =?Windows-1252?Q?VjtwBE8OOuSQKYxS2LqnCBdsuNI0iiebOAFOuCSBXGO8u0mX4mKJrY0R?=
 =?Windows-1252?Q?3U8Dzw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <C6E7FFFC24681846BDD92915E023803D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9df332-120c-4b94-2e0d-08d9c15206d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 11:40:29.2562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TrWmb+L9WbKHTLVhJvKTKpg8WVh6IMdFBZ6urwGpthkurzUCplGVxuSsc9rrEoRMnC0LlfX4l13LBoyGDVv0WMTj1euglWEMFsjQH282j6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5871
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17/12/2021 11:17, Mark Brown wrote:
 > EXTERNAL EMAIL: Do not click links or open attachments unless you=20
know the content is safe
 > On Fri, Dec 17, 2021 at 09:33:18AM +0000, conor.dooley@microchip.com=20
wrote:

 > > +  num-cs:
 > > +    description: |
 > > +      Number of chip selects used.
 > > +    $ref: /schemas/types.yaml#/definitions/uint32
 > > +    minimum: 1
 > > +    maximum: 8
 > > +    default: 8
 >
 > Why do you need this property in the DT - isn't the number of chip
 > selects in the IP a fixes property?
Nope! It's an IP that's intended for use in FPGAs so the number of=20
selects may (and does) vary based on implementation.

