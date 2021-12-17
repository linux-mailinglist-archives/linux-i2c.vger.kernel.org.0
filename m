Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63A69478F67
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 16:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238080AbhLQPWi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 10:22:38 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:41947 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbhLQPWh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 10:22:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639754556; x=1671290556;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=p0kJM7OXpIhXjfjWaBQGUZ6/cw2mLaKyERN5omOxUoU=;
  b=tZn/1F508vkKfSzLJSl91m2XQ7oKIOdXl3zuRecDtDRBeCZrIrUPsS0D
   j5nJ/UA4OcVkpwMPtjtSA+eFKS7TlOwDW739Z45lG+y0eGcE5+hA5uyUA
   qxwDzXA1aRKhB+G7USAT69uM8nR1Hq1wykGBq+KNmVaKgjMix4V+9bpil
   XLPZ3iz+uwKv4vpS06JMJkBcGx3p6gtGac8Q0xSuZdJuvJENVojPFNEM7
   wszPwcx+1um+IxocCUkas8nFL0WrNZeCmWkUvz9gfLCRhOyivIhS3gns5
   TIqxnwmAyJLR62o369ZNNV3cH5c94fE4wG+R529g4hHmI7nakEWAwYHB5
   Q==;
IronPort-SDR: Y430MX5daG0tQS86FW0Cn/iIknWD1/OE3HH253hpnqn24rZvPNyi67jK0yLRnP2u8/DuWuwM/8
 wY/V0lSrYO98mMvfZ/pcFbnv2ZCGSbLUlM14bVGY35k/pqFy4fJRfjvS9QElzXbYo5rtSf6FVT
 jQOlCPyOzH31uaZfPhpLE36r3JzQdtdErOhcQp5IZ3ioKuV758o+rcIzPeYaZBPrdlfHOtZf3M
 k/rmpW8vcp5GsHotmhamjqKCFcbxtnUf8/Jx9DR6Ka4ZiX+IWCCwMwG7vA2oY2l/vWomZIPHXz
 fu85ZPVHmnWHdGLd1/iicjJ3
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="140143739"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 08:22:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 08:22:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 08:22:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUU+FtiLnvKJcobZxQvfb13vmN/ZC/EHFr3VTV3m9Mc5blYf220UuVGELCdlZHP214jGIoeJ5NoAp3yA8TWJwQZwmdUPVzDWEGKcAe3mHVMh7WkE5DzahOO6AjbGfCZxLSgxO20L+4hVWAbY2sB2z2uh8y9BSNPMphu6GN+8r9xz9LR7upEwcDBra314nMbUrTlBGRTafZFlUdtyaTXnxfafTRXr6M3xZ2uMqSCn7XBay3N6/y42i0WmijfjO4Jgq2mFaMQV0VnuW0bTbxvp6jHI5KNiiHoHzpmkSqF70+/5oCGwkgqco2wBYcXwUyxoWazx/4FPiFTqNO3lyrKhxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0kJM7OXpIhXjfjWaBQGUZ6/cw2mLaKyERN5omOxUoU=;
 b=NPSKSBWCnIETJtz2N82WGWhfrKUpEYb/4JJ5pLqVI5nl7E1JxdYoIjCiGr2kMnUP86vKmBrUxsATDHlrUAs1YSNLCmZvQHFTRnZl4KLBEhdDxCQWyPu+CieTEHWTXoR26MJHY0+uzCyCsesiWC+OMQ421G7k8VpmAjA4UXwV49gXlQsRx+xyvZIX16BZqDkDLjzcUEWAfnP7Mepl/v6ZJDFLZMHcW+tv2UIcxRBqDUPkjfSMlcjf6xEHGI+Q0daaJtnZW1uknbXlEOJyF1070FsA6IfrqUnX3MT4+OR3KmuEFXLL8BcQb1tZdyqwbkA1uFR6MHm3aPV7DXNB7sG6jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0kJM7OXpIhXjfjWaBQGUZ6/cw2mLaKyERN5omOxUoU=;
 b=V6sZWbS5g7zXRoWa1WCKPik3xB1lP2oVWH4Hhz6RACLnNDLUWuVP9m40+8AqB5r6RMw+m8HUHdsC7R41o+tXHxuAnMpTi79hkBd7G0Mht0RizMnhrvdHZjW/Y6mfJA9OvMvzMUQYzP6bEPyY1dHt+oRrRPxl4sRM78FLBL2EGNA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1997.namprd11.prod.outlook.com (2603:10b6:300:2a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 15:22:33 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b%9]) with mapi id 15.20.4801.017; Fri, 17 Dec 2021
 15:22:33 +0000
From:   <Conor.Dooley@microchip.com>
To:     <krzysztof.kozlowski@canonical.com>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <robh+dt@kernel.org>,
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
        <linux-usb@vger.kernel.org>
CC:     <geert@linux-m68k.org>, <bin.meng@windriver.com>,
        <heiko@sntech.de>, <Lewis.Hanly@microchip.com>,
        <Daire.McNamara@microchip.com>, <Ivan.Griffin@microchip.com>,
        <atish.patra@wdc.com>
Subject: Re: [PATCH v2 06/17] dt-bindings: rng: add bindings for microchip
 mpfs rng
Thread-Topic: [PATCH v2 06/17] dt-bindings: rng: add bindings for microchip
 mpfs rng
Thread-Index: AQHX8ykfrNrkiZKZBkGML3r9srrMS6w2xXKAgAAD84CAAASiAA==
Date:   Fri, 17 Dec 2021 15:22:33 +0000
Message-ID: <422126ac-ce26-2940-5b4d-fe79a1fa89c5@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-7-conor.dooley@microchip.com>
 <e59a60d5-4397-1f7f-66ab-3dd522e166a0@canonical.com>
 <19cbe2ba-7df5-7c7c-289f-6dc419d9f477@canonical.com>
In-Reply-To: <19cbe2ba-7df5-7c7c-289f-6dc419d9f477@canonical.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e7ffeb7-fa31-4d90-c717-08d9c1710c5b
x-ms-traffictypediagnostic: MWHPR11MB1997:EE_
x-microsoft-antispam-prvs: <MWHPR11MB199796D4FC3A17F0969E8D4B98789@MWHPR11MB1997.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: STCbx0KoB0+ga6ktf2V+nbJVQ4OU203xcaAokJod417NsNdYjioNefhrQ7RrTHPmzJ046rIeypdhlDWVV+vu8Dh8+GL1tBJ9HtlvT/yS5Cjs1+i29rCjlP693Ab4khLigZLMsbblIFpvkzTAdCpgr4UoWGwlm6QKu+TwFZAZ+LWSxxTRKE9JM5f+3ZZemklAQGiTarAun3pCY/vM+L0c8sMkROmNsr4Rj3GLO+kmUapfV6yz/ojlUYWW3fiArwzXTttofQKoSRedpdTFv8g0MnWzHHomgy7r2hcb0qLPVDK7t60JlqA819aFX9N1YspqKZlHK9etz03zi8qE4Z7LNl3tYmRxlwEUv4iJyQrJUQD2ch+3o19Qr8uoWfjQxkqfWX3q1NrHoxrupPapr22qvMA5mW6PcC83Q76bIYSZcltUjyRbXSDAu/jsHVZOiCnC2EotUGyVSNmz8DIS7ZZsNia6fJ0N8SDK0YvIyeMxJiMWmO6TPnTEHxIzCEG8cFhD4Xrn6xRo6CjURv1Sx1WkolIf5GAmWQ9NTGyVHzXNtwpHSE3ZWpAsg0MFniPnlpzBraldFNPc0lmivXXa9WtVaDXATBCPyjCI7eIWokS7ysLx4WV7EcdJz4z7MndSvdUBLyEgVnHRI90VzYvHGzI4X/jqOERQHG1GfVxHmIzlv8XD5+B2rcV6Um7t6BcQeMTojNrgNe6pbtJDkQX9V6+xmEKGuAOXCCHacHzFaKOZ0iimsA6riP4HaAVT0pGnMyGePZGe5E/3ckZqu+ScT0viXh8l+5cRAHvFAqmmpCf9CEX4EPA/KY3xBsf6PiEsToRBw4vlPeojIIYsMoT3JvOclu5rgmT7HQQoBA55oAK6B/3gJACymWyeuQ8vQMI6LJL2tnBo2AQYJ9stz2Rs5sCyQz8stMDBl5nT+y0gSUE69i8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(26005)(8676002)(53546011)(6506007)(38070700005)(110136005)(71200400001)(38100700002)(921005)(122000001)(8936002)(86362001)(36756003)(6486002)(2616005)(2906002)(508600001)(6512007)(7416002)(83380400001)(66476007)(31696002)(76116006)(66946007)(66556008)(91956017)(66446008)(64756008)(31686004)(5660300002)(186003)(54906003)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnVoTXp1ZWpDc1dwRzM1T2NnWVpPMTV5RHZPMDh2aVVrMmdMeWFwMzZHT3E3?=
 =?utf-8?B?S2JFZjJXdXhWYnhFanFEZnQyeXd6eE1pSzc5WDlwcFMrcEpjejl5THFNYXV6?=
 =?utf-8?B?RG5mMlhXSkpHaWN5R3pYMHNURklwOVF6SkJYNHMzVTl6U05BeHRLbkRpaGxE?=
 =?utf-8?B?aGtydFlTUlpKQ2NBNnNxK3ZFRU5WUzcwZ3JQQ2laOWNuT0hPZnZLcDByRjhy?=
 =?utf-8?B?VzgydDZOUk84ZThoQ0NzMjd3b1hpd1E5bjdGMzRnakxTMS9SUm1hbkd1MW4v?=
 =?utf-8?B?eWo3NjJFc25tVWpIcVlqUk9tS0JXckxzMUlldE53NVN0bEJrand3a0hTdm1v?=
 =?utf-8?B?Q0NvUE5iOVgzZnQxRFM2T3U2SU15TDM0WjBUM1Bha29rUGNNMEw3WS8wNkIr?=
 =?utf-8?B?V1dzaDdaMDFNNWdIS0RrbVhVbENwTUxmcm1UbjZCZmJrUXBkQWhhMHV6dUt6?=
 =?utf-8?B?QXlLd3dGNkhJYU5VSEFoYnU5aVRLbzMxbzBxUHBQVUwrUXBnYXZXdlp0S0dH?=
 =?utf-8?B?RW1wSjBna1NMazh3Ym91cWl0UEdTdnlEbFc1S3p3NGVGNkVZZWgvemZTelhE?=
 =?utf-8?B?NUFXbmVtdVoxTE9KMW1uTkd3b05iRzJEREkwcGVHQXFDVDFXRGVTWVBQYWFR?=
 =?utf-8?B?MW1STklEUmlVazhQWXd3dmVwR3ZhcENSQUtxcHNZYlRVZzFqQmdXYTFVK3ph?=
 =?utf-8?B?d2JNM2JLelZJZ2c0UVRobGc4a1BxUVJRVjYwalcwazRHSkNkcHQ3UFg3anVx?=
 =?utf-8?B?TkpFY0IyK1hKZWdPdzB2bkJoQVllRW1vdnRnQ0JEQXl6OGZJeEluaEZGRHJp?=
 =?utf-8?B?dFZuODZVSHdidUdCUFBsQkhxbjdGcmcvQ2MxNlQ1Q0JaTlJEdC9YVU40NUUx?=
 =?utf-8?B?Wmx6RWxLN3Nnb21vZDhxbVZ4NVBvV2JoNkNrNDNZNUVvVmtVN1JYWkE4T2xQ?=
 =?utf-8?B?R3dKQ3BmOWZ3czJINlB6UkZmR3RrdkZFYlk2VVZ6Z244WlJ0dUJpc3VoZTFX?=
 =?utf-8?B?azc1MGNsYTlDY1l6aEQ0TERKR2Vpc28zaG82RzR5Q29EY0NzTG5teHZZTFBw?=
 =?utf-8?B?THVJVFMxRjlyRVdwdWwzTHJWanB1d093dnkyUFExU3ozOXBwcXNXNDNTaGlr?=
 =?utf-8?B?UVBncnlKR0hRQ2R6OUEyTWJ2bExxVnYra2QwZURTNFlhdEJsMHptUHhGY1Yr?=
 =?utf-8?B?RHVzcytSaGxSeUZyamZHamlYTEEwT2dBTXVBUkdUMzlpMkdmeXJQNVhwalMr?=
 =?utf-8?B?d2dWQVV5VkZ5OGg4NWRJWW5NY3BzV1ZOcnNFMGxiSUh2TklEaHRSKytJOVJS?=
 =?utf-8?B?d1JsQWE4dVRFWEJFbGFRRStRMXE2WTN5eVdsMnFNS25FTXNyeWNQcW44TVdp?=
 =?utf-8?B?MzVBdGh0RXVOVVA3a0hvaG10NXRwWUJ2OUFGWXNSZG1sb09VeFJNeTFJeTB3?=
 =?utf-8?B?ZC9mbUVya3ZYSE5udmNBUjI2dENWV1pBZmFKcFQ3c3JtZUFWVHpGVVFFa2Zn?=
 =?utf-8?B?Z1B2VGd0M2VhbDNZekFlazJ3RWIrVyttSGhEMWVCY29BMHRKaHAwY3B3TmxI?=
 =?utf-8?B?Z0FwcHVTaHJWQVI2U3VJcWxscGM5dkV1cm95S2lBejhGSlFLeWlSU0I0WDZW?=
 =?utf-8?B?elF2UkJYdVBoL1ZXSExCMmR5Q21ETU02WnlEb09NcU12Ymd4UTAzclRUQVZ6?=
 =?utf-8?B?ZmFpRThhcENmK2JJMmVobzdMRVYwZ243bUFSNi9EL0JmQ042OWJsQzRtT256?=
 =?utf-8?B?L1QwS2p0NlR3TngrcThkVW15Z3BCU1Brcmo5dkx1RDh1UlRjeWNoQjlNVzVi?=
 =?utf-8?B?Zkt3M3VXK29YOEpkdE95cVVEQzVSQlNVRm05SlRGSGtYNDFnRFBKT0E2bktU?=
 =?utf-8?B?d2hkdml4RHBoZ24rL3plTmZGMThEWm96NUxDa0hhZUxpSURkODNtK1dhM2Jy?=
 =?utf-8?B?WTRuR2RMUEFoUzdFZzZpYkxXRXZ2MDBuUU1xSWZsY3hEamRyYXJ3cGFuclJH?=
 =?utf-8?B?aTlVNFozc3B1THZWSlJaWDMyUFoxVDh2UmtJMVRvMGY5Q3dKRjk0T3NYU1Ft?=
 =?utf-8?B?RmNOZU9tQkJzbXBaczVUVjYvMnBJSGFaVEMxMk55M1lWNmtNUFl3VGxqL0Zx?=
 =?utf-8?B?bFg4aHljdFBsSWtjVnpOMXVlQ0JHemt1d0EzcFQ1Wk9NRWxKSVdYYXVLN2V1?=
 =?utf-8?B?VjQrVmtDUVUzYUpHTjNtajh5WENiTFY1UDFnekhjWWZzeUNiWkNZNlRBQTQ1?=
 =?utf-8?B?b3p3dWV4L2I5OVlCWlIvcmRwOC9nPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E11A6B4EE05E34B9D0C3766206AD9F6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7ffeb7-fa31-4d90-c717-08d9c1710c5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 15:22:33.1036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 19pckIbJYDVyAZjZ0R5yD3teRtJI1vAjSWDTJUknWNZzzakJbq2K4rKBfLlMkN7RJI5CNt1rFUfwmNI1Ef++sTyzFbBFgdROIOTrGPDUfSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1997
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTcvMTIvMjAyMSAxNTowNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAxNy8xMi8yMDIxIDE1OjUzLCBL
cnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPj4gT24gMTcvMTIvMjAyMSAxMDozMywgY29ub3Iu
ZG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+Pj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25v
ci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+Pg0KPj4+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5n
cyBmb3IgdGhlIGhhcmR3YXJlIHJuZyBkZXZpY2UgYWNjZXNzZWQgdmlhDQo+Pj4gdGhlIHN5c3Rl
bSBzZXJ2aWNlcyBvbiB0aGUgTWljcm9jaGlwIFBvbGFyRmlyZSBTb0MuDQo+Pj4NCj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPj4+
IC0tLQ0KPj4+ICAgLi4uL2JpbmRpbmdzL3JuZy9taWNyb2NoaXAsbXBmcy1ybmcueWFtbCAgICAg
IHwgMjkgKysrKysrKysrKysrKysrKysrKw0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2Vy
dGlvbnMoKykNCj4+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvcm5nL21pY3JvY2hpcCxtcGZzLXJuZy55YW1sDQo+Pj4NCj4+PiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JuZy9taWNyb2NoaXAsbXBm
cy1ybmcueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ybmcvbWljcm9j
aGlwLG1wZnMtcm5nLnlhbWwNCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+IGluZGV4IDAw
MDAwMDAwMDAwMC4uMzJjYmMzN2M5MjkyDQo+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ybmcvbWljcm9jaGlwLG1wZnMtcm5nLnlh
bWwNCj4+PiBAQCAtMCwwICsxLDI5IEBADQo+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPj4+ICslWUFNTCAxLjINCj4+PiArLS0t
DQo+Pj4gKyRpZDogImh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3JuZy9taWNyb2NoaXAs
bXBmcy1ybmcueWFtbCMiDQo+Pj4gKyRzY2hlbWE6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMiDQo+Pj4gKw0KPj4+ICt0aXRsZTogTWljcm9jaGlwIE1QRlMg
cmFuZG9tIG51bWJlciBnZW5lcmF0b3INCj4+PiArDQo+Pj4gK21haW50YWluZXJzOg0KPj4+ICsg
IC0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+PiArDQo+Pj4g
K2Rlc2NyaXB0aW9uOiB8DQo+Pj4gKyAgVGhlIGhhcmR3YXJlIHJhbmRvbSBudW1iZXIgZ2VuZXJh
dG9yIG9uIHRoZSBQb2xhcmZpcmUgU29DIGlzDQo+Pj4gKyAgYWNjZXNzZWQgdmlhIHRoZSBtYWls
Ym94IGludGVyZmFjZSBwcm92aWRlZCBieSB0aGUgc3lzdGVtIGNvbnRyb2xsZXINCj4+PiArDQo+
Pj4gK3Byb3BlcnRpZXM6DQo+Pj4gKyAgY29tcGF0aWJsZToNCj4+PiArICAgIGNvbnN0OiBtaWNy
b2NoaXAsbXBmcy1ybmcNCj4+PiArDQo+Pj4gK3JlcXVpcmVkOg0KPj4+ICsgIC0gY29tcGF0aWJs
ZQ0KPj4+ICsNCj4+PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+Pj4gKw0KPj4+ICtl
eGFtcGxlczoNCj4+PiArICAtIHwNCj4+PiArICAgIGh3cmFuZG9tOiBod3JhbmRvbSB7DQo+Pg0K
Pj4gVGhyZWUgdG9waWNzOg0KPj4gMS4gTm9kZSBuYW1lIChhcyBtb3N0IG9mIG90aGVycyBhcmUg
dXNpbmcpOiBybmcNCj4+IDIuIHNraXAgdGhlIGxhYmVsLCBub3QgaGVscGluZyBpbiBleGFtcGxl
Lg0KPj4gMy4gVGhpcyBsb29rcyB2ZXJ5IHNpbXBsZSwgc28gSSB3b25kZXIgaWYgdGhlIGJpbmRp
bmdzIGFyZSBjb21wbGV0ZS4gTm8NCj4+IElPIHNwYWNlL2FkZHJlc3MuLi4gSG93IGlzIGl0IGdv
aW5nIHRvIGJlIGluc3RhbnRpYXRlZD8NCj4+DQo+IA0KPiBPSywgbm93IEkgc2F3IHRoZSB1c2Fn
ZSBpbiBEVFMuIEkgaGF2ZSBkb3VidHMgdGhpcyBtYWtlcyBzZW5zZSBhcw0KPiBzZXBhcmF0ZSBi
aW5kaW5ncy4gSXQgbG9va3MgbGlrZSBpbnRlZ3JhdGVkIHBhcnQgb2Ygc3lzY29udHJvbGxlciwg
c28NCj4gbWF5YmUgbWFrZSBpdCBwYXJ0IG9mIHRoYXQgYmluZGluZz8gT3IgYXQgbGVhc3QgYWRk
IHJlZiB0byBzeXNjb250cm9sbGVyDQo+IGJpbmRpbmdzIHRoYXQgc3VjaCBjaGlsZCBpcyBleHBl
Y3RlZC4NCkFja2luZyB0aGUgcmVzdCBvZiB0aGlzLCByZTogYWRkaW5nIHRoZSByZWY6IGlzIHdo
YXQgaXMgYmVpbmcgZG9uZSBpbiANCnBhdGNoIDAzLzE3IGluc3VmZmljaWVudD8NCj4gDQo+IA0K
PiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg0K
