Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA7F44BDFF
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 10:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhKJJtT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 04:49:19 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:36605 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbhKJJtS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Nov 2021 04:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636537591; x=1668073591;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2cNqUGlbdW7H9+xSekOOrFNUqDwodPw9Jdx8Fn1BXtY=;
  b=V6aHRsPkXwD0fLMJY6LZwo2EYmAwMXe27MQfBdGkrhnNLpBaKFMBxCZh
   X2zss/0UVCx3hvSmh9OYgkmfu9vlgqsALXut/JUpKwwarcEc4ZqzzsrHe
   zciEwskifWJ79NJ7Ejb+nwBV1fPAQk6vKhhKV3hX419p6sVu6elyc3zhP
   Svm3uAlm5n297GxC40qPl22gcPI4kirV89mGl0AnHWSaQoyWdQvlL9ZN+
   6hrUa+L0iPrd4Bm55tIihtcBzAjc8jCnpEuU9uCjG4y8cLqtQwE+RBwdR
   YEy8dLFN/XVl5TRoiOXYJTViVrjhLqpMHt1nnvCd9uodo//3/p0HqvBkY
   Q==;
IronPort-SDR: tO3XEm+XN3LdfwtymiEMZkmfye+elt77GI/50F6IsFq7qgwfMvjF3vSRmWfGVjOZEUJvWo6/3i
 UE8GVHFW/uE/FJj+8SF2No6GYB7SHKf7QMfcxqLpSYkwaxTGA39HPpe0c/oB9y0wjCjbmmnw5N
 rhHwQbB/hlX8q8uSPeu4h6CsvDqLYgg2BXVwBkpXcPWVkuWtaToCRYzpY+BBVQ3NDFdCJJr2K0
 QFm63dRNyHn8f5LJVRB6HjppJWeMwZGRdrpfoLsZwlbr8vfxbHCHEcMxoWBPH93IIlpQzPbBf0
 1VmcjzdlvZTviuCLSwPXWH7v
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; 
   d="scan'208";a="151414323"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Nov 2021 02:46:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 10 Nov 2021 02:46:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Wed, 10 Nov 2021 02:46:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiFoJf6MLQK4QekgImbFj85p8uLM5X7eFm1etsbCg4IXPL7yh1Ht6WDQ+1NUtxrBgwfdRNoZhEBZnLxZ0iGds2HPtfHvzhsc37/wDOwG6Q9WSU5aBPrWKeJWMBjVYl19Am9BA/Ez3tkjMz8ojTSsxKcfZNpclFlvzwpdEP/olC+trD513VcMnHa4gaZRe/uNWTWXBofucbmnkzQ4JtUgTgUW8ZabamtF1+HNfsdD/Sf/KRHJ14DArKVAlcjakM1ScKC9wqLYfe968QtChNE3rgNpSKpjexQT0xzjh0Z0+sWxQL88ZLyB+vCp+Lpawq5TVp0DIqKJ1+9vpIVMTUav7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cNqUGlbdW7H9+xSekOOrFNUqDwodPw9Jdx8Fn1BXtY=;
 b=JSKancrLMhR1lem1LyJQ/QbiskBOg7sJB+Ad3k/6bDBIYeFC2UfbHt+w61hOe+Z7p3ZklJRUsR3Cm63aCarvl9y5T5xJiHLXO1Y4FGJ7zvd6+Wiw+ju0VMp9oElAF/2Be3CxjQR0uv26RC6WWa98QhPljn6MdqKvayf/qTqxQRmZkjG0c1hxggTRjPbt8cTFbYbQpA5LZadeAzJ77j9l+izAEHSvD4H6MTMoqJdJdO59uW9a5Dr8ZLbtdMKqIgvdxsa3bNZW1dc7v3uBHtlNDPzHYA7XatPdGSp+aFReh4wkcTVRFHTsQGHSDwRKtKxdxd3GVQxTaRS0LHbTsdj1aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cNqUGlbdW7H9+xSekOOrFNUqDwodPw9Jdx8Fn1BXtY=;
 b=CnqYVb1rV0AASKwBtnu/B8ZZuTpgGYQsAkC/v7HKJYu+1NNplvy1IDgeve8xV3xU3Qo48VK87+QdpLb9fAc4bM2SAGxnChL+pkoV/oqbVjaHFP2ZemgJZZ4CmhXwm3EOsLiSO/l6kSISEOtU+sg/l5NOk8jHNWZkZ+G8LWNDoQo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB2016.namprd11.prod.outlook.com (2603:10b6:300:26::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 10 Nov
 2021 09:46:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Wed, 10 Nov 2021
 09:46:24 +0000
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
Thread-Index: AQHX1LJPDy+D8VJjOEmJwWP3EzXa3av6In2AgAEGMoCAAABzgIAACyQAgAEvmACAACKRgA==
Date:   Wed, 10 Nov 2021 09:46:23 +0000
Message-ID: <9d6f2e66-860c-2b8a-0b45-7dc56dd5298f@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-7-conor.dooley@microchip.com>
 <f60cf7e0-4f67-f4b3-2596-01114cff6623@canonical.com>
 <71c6917e-1463-c708-550a-726e5fe1566d@microchip.com>
 <ca17d6ac-ef8e-b01c-3278-7cbb0d5745e3@canonical.com>
 <ea871add-bddc-c4ae-ac9d-e86b4fad5a02@microchip.com>
 <a0713a10-3409-4401-e612-0a9c06f88ea1@canonical.com>
In-Reply-To: <a0713a10-3409-4401-e612-0a9c06f88ea1@canonical.com>
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
x-ms-office365-filtering-correlation-id: e1116c8a-3a64-4594-46c7-08d9a42ef54f
x-ms-traffictypediagnostic: MWHPR11MB2016:
x-microsoft-antispam-prvs: <MWHPR11MB20165FCA889AA05355C4F51D98939@MWHPR11MB2016.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J8izQeTk6Sdg6FY4FNDQmuN5NA2ulIryPmZG0zWuzsICl0Lv5CvCY3bNuqSX62x3C/tp/ZKuqvdfXoWThPMGLn7rrXzv/1N+lAN4IFwmDBrDdlNgWZalUVb04ORiFaDd/vTQBCTlsZRR4C+Q4oDGbkb/HMAdNpvNvJyDm7PNdSzn3aKfi55Ak1b14YDsP4PyNjrJur+UGmQ3ssflZuNdyo1gnvghgvHhDxqyHCG0ak4DROtgShfsWJ6TxdqXNXVbJghxC5Fo6Xz9SCmIk6P1mxVGoNvx1G9KWznUt4YBAMOm453CHUHuNnSf8dRSFsAgdD9UMPD+T7k5lotm3Km8jdhxSsnGezatUU/pUDAumtjT4LpjXvXzMuY/+ralfPzphONn+Lj3u55Faj8fI/WqEBccG+B5mzW/7hc5u43oqJFD8BQuSmrheFr593Rg4sZm2uNJcsQD1cgHN9I5zjZsRvyVx446kz/oHAfbWntsFtJ1nfQMoxHT9daDx6rExi6Jh1YxU4wZYWecQllWM85Y0+7u1Mby37kmdRQ/9S4A7dZmD2FTsSI/zGF2ot4TtSKaxcBjeYF9Y62Wk+3b5OcdL3aWn2KdIq0IdK8UZ5ovhetvSILU4dXCs2p2D0RYX5pVxl+rJWo4Q36oK3vPAbLXGIQ8PZ2/6zeUFLUHYUQUG5OrG6XYoi9fO0LPzw6jt+LGErGnvMFbHaIJOI2WmnjksMyfUDoSJVPDKTsAohOLWEFtoqV3853CtUqU8+xXUrwRazUlzIVj6WAYN2ia0wPbh0e7bUj6EJbV/iH7/1USBdJ5ADuXDu39Ho63+908UH2Ix8Rca9KDzk+MbArI5gXtdmHD6nsjZtw9wmYLzRP5PeB3d7nzA+ncWOKwNFsXmynpazYqTwO1wNUZ6ZSV25l6sQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(83380400001)(8936002)(8676002)(36756003)(38100700002)(91956017)(2906002)(76116006)(38070700005)(71200400001)(5660300002)(53546011)(26005)(6916009)(6512007)(6506007)(66946007)(508600001)(86362001)(66446008)(4326008)(66556008)(6486002)(186003)(7416002)(64756008)(122000001)(31686004)(66476007)(316002)(31696002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUd0NUl4d29vWjhKMGRpc1ZFZC9BVW9WREI4ZmsxWmhkNllHQW9jN3RCRFgr?=
 =?utf-8?B?S2hncjFUWjl3MllHeUNHYklBMXB2dWp0aHl6bUlTVEJZVmRwWERBUmlmczFC?=
 =?utf-8?B?WmNNdk9PT3h1RFRsOXE1blZUZkFOMTlKN25ZeFRDVmZEeDZFZXp1UUsvRkli?=
 =?utf-8?B?cVdnT1NxUlkvKzlRN04wczNDQ2hFcGI0aWFDTE9ZWmh6bDh4OWtML2FwV3lG?=
 =?utf-8?B?RjhSZDVGRFNmenBlNWRZNmVzdUlzUVpNc2xoLzI2d2t2bEE0MmRTN3l5NHQ4?=
 =?utf-8?B?NDNsbktoKzdHRzFGblNZQ2REUjJWdXc0Sy85M0VPNWovRG12ejJxd3NrUjFW?=
 =?utf-8?B?YTdtVXF6T0VldGh1OEdMSDFyc3ZMTFZ0STRlaDBmV1grcWZ1TmZzNWZXa0Jy?=
 =?utf-8?B?eE5yTFMweW0xa1ovZmkxamsxZE1TRnE3T3IxQmZITWF2bkMxOHp1K3Ria2hr?=
 =?utf-8?B?WEVYK214ZzQwZlpzMzNiT0d0ZGVMZm92aG1tUzlYWUR0QTdTd1c5OGNlcXVS?=
 =?utf-8?B?ZUliR0xNN1UwSG9iT0lwRUQ0K2tvMk1QMUNBQURNN2EvZGt3TXpWQ3RnRk1l?=
 =?utf-8?B?YmRUamZGY09DK1l3UWZ1V1YzaGZ1RjFaTGdsQnBkaml3ZnFIRnhxZHJRenB2?=
 =?utf-8?B?MWdhR09pMnBFL1F4M1ZGYUNvd2U5Q2MrY0h1ck1lQmNGZkJEcTlQd1NsbnJG?=
 =?utf-8?B?cEdHdTN2UkdMQXo4dHY5aXNJK2s0WkNWK2puaFQyMnBtTlZJcDc2c3RYUW4w?=
 =?utf-8?B?STJiUGQ1VkNRSHFOb0xRQm1xNDMrMHljMFNzVTFySGZKV0FUWDFYd1RzSW5k?=
 =?utf-8?B?ZzJsSkRYVTMwUkp0RWJUc0dCM0d6amJod0djcFd5TTlIZlZHNUkxVmxoRGtS?=
 =?utf-8?B?OTBaUGd6LzNxWEdpdm1PVnhmWUkvb0lqMitjRnkydDNRN0hMeHkxaXovazBZ?=
 =?utf-8?B?TUhOZG1za1BoaDhYZU83REVoWk9kSmxGR09BU1VqRG5wRnZnOThwTU91R2pm?=
 =?utf-8?B?RWwzYlhCS2NhbFlmaFNtZDAvRnZFUkZpL0RzOFZEYkJQeDQ2WTkwTXBMN1Np?=
 =?utf-8?B?TTNqT3dhS1Z2SnVxczNjMkdMclBQcTBBeDQ2cVdBaUErS1Vtb1VyY2VLRTRC?=
 =?utf-8?B?QnFrTEZtSHJRNVh5d01kS3d6cVA1ZWoySjFuSDlwTDd1cWdWaTVQMWxWejI4?=
 =?utf-8?B?bitKQVl3NjlnbDA3c2ZBN3hhUkRqcWlhRTRrSFUrL2VtT1lSWERjdk0vbTRV?=
 =?utf-8?B?T2loUzE0M2ZiZVRlY05MZzF5R0xneGt6a0RkL2F5T1MxRVpVZS82MXZnMkpK?=
 =?utf-8?B?cE5ndG9CaERMY3J0S3ZCL3F4eFlxa0NlY0ZWSFhpRlFjZkUwZHo5aDQ5M1cy?=
 =?utf-8?B?blFwVTlsbDBReTFheUtrNmg0K05UN3NiWEhOR0laR2NaVm5hMXZ6cWxrY0NI?=
 =?utf-8?B?YktFMXMwMUZaaFZVTnM4RXZLZzFLRXhjRGZvRzJTcUd1bTBtQVpLbHJkZHp0?=
 =?utf-8?B?WkRMT3lLdkJ6dEJlRFVSUnRsZW9EMkdZTGJvaG8yS3I2Y3BWSkNUanRxb1ZD?=
 =?utf-8?B?TkxlbVZNTzBERlJWUWVUbTNJTkg1TGFMRGJxRHFlUjlHYlgzbU54Z2hxTy82?=
 =?utf-8?B?eGxVSGdLS2xGQmVVNmVQelZaOW8wRmk2eXBXYTk1K3hoVG9ZRzR3R2VhdXBW?=
 =?utf-8?B?MkNla2d4cjhGdXhFZGo2NCsrRkx0MHBURU9KekMrbHdkampTckEwRFVMM3Nj?=
 =?utf-8?B?MVFQVzJ0T0FvdXhQeGxuREpvT0dOaVBtQ2lWOGxScUFFeUVkalRyWTFjLzRz?=
 =?utf-8?B?cnRRTWpCY0VTd0I0TDVGbGVNTEJJTGdSdXpIWHBTWFZxYU9QYi9VU2RsVkFO?=
 =?utf-8?B?VUYydkV1MlF6Y3orRE9jNVRpS1R4V1JoVldwT3NsVDFNOEJyTk1GK3FKMTF2?=
 =?utf-8?B?OE04QzNJTW94RnBiN2tFc3RPa2NDeUR3SmNUa0syc3dJNnU4YnIrcFdDYk9V?=
 =?utf-8?B?SzlVRFlCZUNmUlRHWTEwVTFVNHdUTkIwR0NtSUhFb3RSV3hnUEphcGtUU3Yx?=
 =?utf-8?B?TGxSbmNGQ0RoTzlWOWl1NlptMWpuUldjb2U3cFZIQzF2K294eTJ5WUNYZHMz?=
 =?utf-8?B?cEN4TFV6cGFqT0FEY01jVWFpMnh2TUhPYXJkMG1aWmNUZ3JSbjMyWDg5aTB1?=
 =?utf-8?B?QkpyQnp6U1NPcGVyWmNpUW1JRXJYN25mVXdyNFQ1MFNmVXZsd04yVWtLaHM4?=
 =?utf-8?B?M0JoWVRTcGliSUhuWDRkUTlqdEpBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A9E92F93211CF4C941A7E594D987D9B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1116c8a-3a64-4594-46c7-08d9a42ef54f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 09:46:23.8858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uvuVhv4eTAq+mBkYyydM+f5Ya0hiZGQD3m5+7EBZPR7ztwyJaGFuRpRJ+Kg9dLQFn367vnvBmgDaRQ4GlKoPLPaOzWlg91WvVYOWBoGRXKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2016
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTAvMTEvMjAyMSAwNzo0MywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAwOS8xMS8yMDIxIDE0OjM2LCBD
b25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IE9uIDA5LzExLzIwMjEgMTI6NTYs
IEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVu
dCBpcyBzYWZlDQo+Pj4NCj4+PiBPbiAwOS8xMS8yMDIxIDEzOjU0LCBDb25vci5Eb29sZXlAbWlj
cm9jaGlwLmNvbSB3cm90ZToNCj4+Pj4gT24gMDgvMTEvMjAyMSAyMToxNiwgS3J6eXN6dG9mIEtv
emxvd3NraSB3cm90ZToNCj4+Pj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mg
b3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0K
Pj4+Pj4NCj4+Pj4+IE9uIDA4LzExLzIwMjEgMTY6MDUsIGNvbm9yLmRvb2xleUBtaWNyb2NoaXAu
Y29tIHdyb3RlOg0KPj4+Pj4+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+DQo+Pj4+Pj4NCj4+Pj4+PiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRo
ZSBoYXJkd2FyZSBybmcgZGV2aWNlIGFjY2Vzc2VkIHZpYQ0KPj4+Pj4+IHRoZSBzeXN0ZW0gc2Vy
dmljZXMgb24gdGhlIE1pY3JvY2hpcCBQb2xhckZpcmUgU29DLg0KPj4+Pj4+DQo+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+
Pj4+PiAtLS0NCj4+Pj4+PiAgICAgLi4uL2JpbmRpbmdzL3JuZy9taWNyb2NoaXAsbXBmcy1ybmcu
eWFtbCAgICAgIHwgMzEgKysrKysrKysrKysrKysrKysrKw0KPj4+Pj4+ICAgICAxIGZpbGUgY2hh
bmdlZCwgMzEgaW5zZXJ0aW9ucygrKQ0KPj4+Pj4+ICAgICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JuZy9taWNyb2NoaXAsbXBmcy1ybmcueWFt
bA0KPj4+Pj4+DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9ybmcvbWljcm9jaGlwLG1wZnMtcm5nLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvcm5nL21pY3JvY2hpcCxtcGZzLXJuZy55YW1sDQo+Pj4+Pj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4+Pj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmU4ZWNiMzUzOGE4Ng0K
Pj4+Pj4+IC0tLSAvZGV2L251bGwNCj4+Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvcm5nL21pY3JvY2hpcCxtcGZzLXJuZy55YW1sDQo+Pj4+Pj4gQEAgLTAsMCAr
MSwzMSBAQA0KPj4+Pj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5
IE9SIEJTRC0yLUNsYXVzZSkNCj4+Pj4+PiArJVlBTUwgMS4yDQo+Pj4+Pj4gKy0tLQ0KPj4+Pj4+
ICskaWQ6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9ybmcvbWljcm9jaGlwLG1wZnMt
cm5nLnlhbWwjIg0KPj4+Pj4+ICskc2NoZW1hOiAiaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwjIg0KPj4+Pj4+ICsNCj4+Pj4+PiArdGl0bGU6IE1pY3JvY2hpcCBN
UEZTIHJhbmRvbSBudW1iZXIgZ2VuZXJhdG9yDQo+Pj4+Pj4gKw0KPj4+Pj4+ICttYWludGFpbmVy
czoNCj4+Pj4+PiArICAtIENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+
DQo+Pj4+Pj4gKw0KPj4+Pj4+ICtwcm9wZXJ0aWVzOg0KPj4+Pj4+ICsgIGNvbXBhdGlibGU6DQo+
Pj4+Pj4gKyAgICBjb25zdDogbWljcm9jaGlwLHBvbGFyZmlyZS1zb2Mtcm5nDQo+Pj4+Pj4gKw0K
Pj4+Pj4+ICsgIHN5c2NvbnRyb2xsZXI6DQo+Pj4+Pj4gKyAgICBtYXhJdGVtczogMQ0KPj4+Pj4+
ICsgICAgZGVzY3JpcHRpb246IG5hbWUgb2YgdGhlIHN5c3RlbSBjb250cm9sbGVyIGRldmljZSBu
b2RlDQo+Pj4+Pg0KPj4+Pj4gVGhlcmUgYXJlIHNldmVyYWwgaXNzdWVzIHdpdGggdGhpczoNCj4+
Pj4+IDEuIFlvdSBuZWVkIHRvIGRlc2NyaWJlIHRoZSB0eXBlLg0KPj4+Pj4gMi4gRGVzY3JpcHRp
b24gaXMgbm90IGhlbHBmdWwgKGp1c3QgY29weWluZyB0aGUgbmFtZSBvZiBwcm9wZXJ0eSkgYW5k
DQo+Pj4+PiBhY3R1YWxseSBtaXNsZWFkaW5nIGJlY2F1c2UgeW91IGRvIG5vdCBwdXQgdGhlcmUg
dGhlIG5hbWUgb2YgZGV2aWNlIG5vZGUuDQo+Pj4+PiAzLiBXaGF0IGlzIGl0PyBMb29rcyBsaWtl
IHN5c2NvbiAob3Igc29tZXRpbWVzIGNhbGxlZCBzeXNyZWcpLiBJZiB5ZXMsDQo+Pj4+PiBwbGVh
c2UgdXNlIGV4aXN0aW5nIHN5c2NvbiBiaW5kaW5ncy4NCj4+Pj4gMSAmIDIgLSBDb3JyZWN0LCBp
dCBpcyBiYWQgJiBJJ2xsIHdyaXRlIGEgYmV0dGVyIGRlc2NyaXB0aW9uIGZvciBpdC4NCj4+Pj4g
MyAtIEl0cyBhIHN5c3RlbSBjb250cm9sbGVyIGltcGxlbWVudGVkIGFzIGEgbWFpbGJveC4gVGhl
IHN5c2NvbnRyb2xsZXINCj4+Pj4gaXMgdGhlIG1haWxib3ggY2xpZW50LCB3aGljaCB0aGUgcm5n
IGFuZCBnZW5lcmljIGRyaXZlcnMgYm90aCB1c2UuDQo+Pj4NCj4+PiBJIHVuZGVyc3Rvb2QgdGhh
dCBwb2ludGVkIGRldmljZSBub2RlIGlzIGEgbWFpbGJveCwgbm90IHRoaXMgbm9kZS4gQnV0DQo+
Pj4gaGVyZSwgd2hhdCBpcyBpdCBoZXJlPyBIb3cgZG8geW91IHVzZSBpdCBoZXJlPw0KPj4gVGhl
IHN5c3RlbSBjb250cm9sbGVyIGlzIHRoZSBtZWFucyBvZiBhY2Nlc3MgdG8gdGhlIHJhbmRvbSBu
dW1iZXINCj4+IGdlbmVyYXRvci4gVGhlIHBoYW5kbGUgdG8gdGhlIHN5cyBjb250cm9sbGVyIGlz
IHByb3ZpZGVkIGhlcmUgc28gdGhhdA0KPj4gdGhlIHJuZyBkcml2ZXIgY2FuIGxvY2F0ZSB0aGUg
bWFpbGJveCBjbGllbnQgdGhyb3VnaCB3aGljaCBpdCByZXF1ZXN0cw0KPj4gcmFuZG9tIG51bWJl
cnMuDQo+IA0KPiBJIGFtIGFza2luZyB0aGlzIHRvIHVuZGVyc3RhbmQgd2hldGhlciB0aGVyZSBp
cyBhIGdlbmVyaWMgb3IgZXhpc3RpbmcNCj4gcHJvcGVydHkgd2hpY2ggc2hvdWxkIGJlIHVzZWQg
aW5zdGVhZC4NCj4gDQo+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHRoZSBybmcgZHJpdmVy
IG5lZWRzIGEgbWFpbGJveCBjbGllbnQ/DQpDb3JyZWN0LCBpdCBuZWVkcyBvbmUuIEJpbmRpbmcg
Zm9yIHRoYXQgaXMgaGVyZToNCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2Mv
bWljcm9jaGlwL21pY3JvY2hpcCxwb2xhcmZpcmUtc29jLXN5cy1jb250cm9sbGVyLnlhbWwNCj4g
SWYgaXQgaXMgYSBtYWlsYm94IGNsaWVudCwgdGhlbiB0aGVyZSBpcyBhIHByb3BlcnR5OiAibWJv
eGVzIi4gVXNlIHRoaXMgb25lDQo+IChsb29rIGZvciBleGlzdGluZyBiaW5kaW5ncywgZS5nLg0K
PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdhcmUvYXJtLHNjbWkueWFt
bCkuDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQoNCg==
