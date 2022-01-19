Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA9194938DD
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 11:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353867AbiASKrM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 05:47:12 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:25867 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353863AbiASKrL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 05:47:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1642589230; x=1674125230;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uIwbv7QOZ9cFr+vBJUh6MLQb31mLzWR0PoPASWeIUQc=;
  b=U8I7TvZZJ8XBJYsKjrq+rKQ3IwPJekpEuT76Cb++xD/UopVx3JF/dcqu
   NgBB+J24v7tYeF2PECiGEx5CwkuKHc5O9IX77/+esSg9/K41g4eAneaKU
   V+/01x5O8WL/Prl5AvjInTxQyGzlygKVON9V9CB2R4D+gdGtpIteKrYAH
   IisjIjN0rDSqB1knIK+8v8Yoey/VUKRrFjseJfNz7vnij1pMZh+03UeWW
   CmCnl0edWEikkEed8WloUge7GALAneHn1P2KhzXR6AweE0j9LxAFVLgek
   x4zzxL+EU7LI5Pf6QScLAgNV8iTNyWRwJzutiMfpVDlEXWDPJelbnCMov
   A==;
IronPort-SDR: GWmD5OryHM/A7Esj9VjXxTblNHdd/mIg/dH4X68Tc9CLng7HXG5+Xfp60IYAQIFv8Mv8eScG/M
 RQ0lzVh9UvXzVelde5+OkOipONljNEYwp/b+XbXvBta8qpA/HIpuu/m0v6U1ePVV0kO/TeeP5p
 xbMq3/Ikz4oC+/1JrRox1q1deBdlO2rZ198GW0gbq8ZTELkFP3zQTAoX0ZuhvQ207TN+d+mPwF
 Evz2j2jP1UmRB41SQHXrRILSjpJEytd8zXI8LTuvtxa7rErfnxWCyVIi8JtFNe0lHrTUCeKPFK
 pwuSOYVp+ocSk600YuCqw7Kt
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; 
   d="scan'208";a="143183443"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jan 2022 03:47:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 19 Jan 2022 03:47:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 19 Jan 2022 03:47:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MF7+LUlxQRbLMfqmOdYwukFt6JR3B1dZUKojXhvxSAL5MilVXgeDg6ZbdzFPXKmwi5fNDYdV3ZdTusGCpQ3gHjFu2pqpvcx07PyFMYM2MKL5k2Gdk356TLjjE6lH8k3jnTdFZ8D3Q3c/IrTofEiuta7xNMpobEN3ptf3oIFW/O1SHqziVrqGg+Y9K/2SZ02gneJBbz41vg82UBYW5lu+F4+ZyG8FUyAaIleEzQphLLTXJoMgcFdJ51qOxUvy5APQ6Vy1phqwboOdscS2/xyYsOrQZMrjaWeTc1vaq96s2x+E7LmIjcYGPdA15S62ClEk6UQXryN7thhqaI3oasnl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIwbv7QOZ9cFr+vBJUh6MLQb31mLzWR0PoPASWeIUQc=;
 b=Qhh2EXXvm5lfo9a5QtkdFBb5v0/WvgCySkhPcHAjeaXVArWceqlyZ2CMCmCvYUtAbnwTEU0VozPKMpa7xhYbtzyg06lgx/lc/TQqpjJy7pEkybqhK5A64jF7Ftt4FBlLyr/VzRggPIRuEif8kI0052Eczz+gIHGCvb8UpYtnqZbeQgXX/B+9lw/9z1yS+H2Htck+cQTCjWcRMmvtxQj7N7jRonHgFzZihjwd8XQxIxPk39b4LQ8VI1gD7d9k5bl3g4CYm/4gXYuFY3SZMoRaHExMlCQadNwvDG4jaYCD6JaD8/1/ArsG86LDTpsS0QRcgfHNSnberMw9KyFzLhLtrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIwbv7QOZ9cFr+vBJUh6MLQb31mLzWR0PoPASWeIUQc=;
 b=im9iEMQcOjJwRBNcEhOaRNB0PwtifwErRl6kjpfihgXxjLVB7lliFds+6zIOi5IBr4CopYep2Mh3vUNLhq5YipBblX7RceuEXlUw425mmxDhyB5IrHW6KSXzvkiRwXLo7McqVMH0a4X5zmzSkx3b+ooY0ct7i7Fq/yVYEllcuzk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by BN8PR11MB3635.namprd11.prod.outlook.com (2603:10b6:408:86::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 10:47:02 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3%9]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 10:47:02 +0000
From:   <Conor.Dooley@microchip.com>
To:     <robh@kernel.org>
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
        <geert@linux-m68k.org>, <bin.meng@windriver.com>,
        <heiko@sntech.de>, <Lewis.Hanly@microchip.com>,
        <Daire.McNamara@microchip.com>, <Ivan.Griffin@microchip.com>,
        <atishp@rivosinc.com>
Subject: Re: [PATCH v4 04/14] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Thread-Topic: [PATCH v4 04/14] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Thread-Index: AQHYC5JHlwCm00sMh0CKnKu25x3n7KxprYKAgAB/2oA=
Date:   Wed, 19 Jan 2022 10:47:02 +0000
Message-ID: <262b1a79-1119-4767-f3f4-7a77824d1bc9@microchip.com>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-5-conor.dooley@microchip.com>
 <YeeBgQMOg49CXigi@robh.at.kernel.org>
In-Reply-To: <YeeBgQMOg49CXigi@robh.at.kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9291386d-8365-4115-14e6-08d9db3906e3
x-ms-traffictypediagnostic: BN8PR11MB3635:EE_
x-microsoft-antispam-prvs: <BN8PR11MB36359DAA9C91584A366087AC98599@BN8PR11MB3635.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YH8fqtMQcTdPZfz/d+N2cfLJc+UlS/a90uGEQzR6aaY+JJmjr2cdS8QM8pt9kX8Q6l2p7ymhYlfCZwl5CPXFpnapToJoE81aWuYEORSCzNyzPyBo/WngUtIx3Gci94N5MiKeT4Yx9P2kEi/pfVThEgloFqqVjJzh5updFrwYaQ0fu3Citn7paVXjbuJPh8L5pjN82mpMWOo3UE7VOSWdnOGihndZDqn/sBd/8v4Uhvr6dgYcgzIxosN3dDDHS2dUvXo5a+WT4npaVHh3+kxXuRz810TqGLDGZav3LZt6MFLLRLlDTh50pCwSgqjkQeaA95U2zEs89KOGwm/g8C2I0bW9m/aCbtMrlWD0cmw2nvpw2Khf+hIVId7sY7CAlqogUtu9gbnSK/BkJn7TPQyCODZfBfaOaqcMaPToT70cSwl3kUHOIcS4txvBHK1o+Wt2oAy7fn2vn3BctpwgIoFa5oi4v2kMUm6J8i7stDbqwW3sKuxYZGzkTCSKwYPceO2BVsnYk7nnQZfOX9hbiiLyzq/Pw7mlGP+huv8wGliVA+24mtpzcOMFC4+lcADpMnDfpfo/hoBSO6I5aGXef9Wi4ZoEY6XxDOP62QAujv4nRBvqY7B3iXpa8Xr0YN5n9X/fOLCUI+NBO6VaHn4RFZ5U/ufG8mjCKQcTV1A9GFeh6qatVU6vdJCIxdfqV6W4FEA7wKDVRY9aF86qJA8ybgG2EXdwQb8+C/QyPIY9C0SYJctgV6o2DFLhxQ2ZHbemabud8lct1FZtYCxq295yEPykiH0ovJQl6rlXwv9JJQUuwcF4bLQVWvEK1ay0jYvxjulbR3xSiwbU2YM+yvgKvsPURO2uG9yIW7Dru8MgVGGKhzANfJwBRz42eNr+uGGo0yDzGoAMZbwuj+tS1QtGRGZcyw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(6486002)(38070700005)(91956017)(6506007)(2906002)(66946007)(53546011)(64756008)(38100700002)(66556008)(26005)(31696002)(83380400001)(54906003)(76116006)(2616005)(186003)(31686004)(8936002)(36756003)(86362001)(5660300002)(316002)(6916009)(8676002)(122000001)(966005)(508600001)(4326008)(7416002)(71200400001)(6512007)(66446008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDBnMHVkQ1lpTnhMc2p1VmkvM0RrS2EwM0JUUTk5TFhpWUpnZDBmK3FnYVFB?=
 =?utf-8?B?L09zWmtXOWVoQnJ4aEJzeWtSOUJ3bER1VWpWUWVGSjN0VzJES2QyK1c0U2lt?=
 =?utf-8?B?ajRBOERTc0JXUjI4eVFOa2ZOOFJ1UGExWWdqSDgyUmkrVDJteUpjY1VXTGVV?=
 =?utf-8?B?NGN5cU5DOHFLTHY3Um5CaTdFS1BtSDB1RFJ1ZU9mWXlqTVNER2pBSW5uM3Mv?=
 =?utf-8?B?azgyejlPYmdyTW9KVXpVWGxJcmZHSmxQVVZ6NlJnK0dFTnZOd2dEaXNjZlg4?=
 =?utf-8?B?WnhKSVA3b0RSVEJWbytBMXJOQ3o0VHUyeVVhZVFESTN6Mm50UWNBZ2pab2ZG?=
 =?utf-8?B?cHc0S0VkYUxmSk43OHFtdmtiYkJMcXhneFRLOHhScmhrbHFDVnNFaEVVWkdO?=
 =?utf-8?B?c28vZ1BvVFMrNHZxVzh6T2YraUxvcDQrQTNacHZrcmNuYjcxVWNIU1dDVGlH?=
 =?utf-8?B?cnc2cWJTcWh4MkE5SGV3R2NKYVp0dmJyb0J4NHE5T1hFYVpxUXVKREZHWlVk?=
 =?utf-8?B?c2xkWjcyajZ0NjVlbHRDaU93eU1RNnRCSUtYY2pxSDRRN2JZYTlrNmtNZEZh?=
 =?utf-8?B?MUJsR0V4cWdEbmw5VmNSR0xtYW9TSjVJcXU3QjNTTHEyNlovN25iSmRON3JI?=
 =?utf-8?B?VlU0VmRhdWRUaElIcDRLa1pNYkFWNDJya0VESGM5eHNCdjhzVkhSYXZDSmg5?=
 =?utf-8?B?eW9XS2c5VktZMTNIbk1UTjZ2eEJMVDkrTVhVa0FpT012UzArY0hhVVg0Zmlj?=
 =?utf-8?B?SFdWU1h4ZElmV0Qxa2VDZ3lFRFhkd054ZHlLNDVYenMvcGRlbDRDcWd5VmEx?=
 =?utf-8?B?akZubzBvUDJXcjJGT2NyeTYwN2JEdDFVWmdBSzNuUnlIL0JCT0xHZ0FFQ0Q4?=
 =?utf-8?B?MXoxbkVCVTJvQzRHM0p3REdvWElZa0hvd21iaXBGSnZvQ3hBbHpscTZiMjE3?=
 =?utf-8?B?c0JMY2RMcnROMVF3Q2FBV1M1RGM3Wm16M243YW5KckQxSnFXOElrdTZ5YXVN?=
 =?utf-8?B?QjlqMHpJdzlBeXYwY3kwVGpOK1R6cXRGYTREWmxLd2phQitqcFBrUCs4SlZ2?=
 =?utf-8?B?cmhiZndXNU5OaGhWcElTQ044d3UzT2dHRU5DT0xYM3cyVlhucGFVeWVaSzVM?=
 =?utf-8?B?YVVLLzdmaXRWWEVXTkVldGxlOVMrZmIwZTFuQ0NobE9oMWwzb2Y2bFY0U1Nl?=
 =?utf-8?B?TjhaaFI5b01LTGo2R0l2UUo1amNKcytVdDBhL2JGcUxhK2FIR1ltS3lNdmdQ?=
 =?utf-8?B?Umg0cnNYSWdRcFhWTThlQjUralVWZjFTOS91ZW12RW0vN2l4M1N5NWUzOTBw?=
 =?utf-8?B?OFBPVXM1ZHkxSmRwemlRWTFhdjcwQkU0bzJ1bzU1a0Ywei9iQlM0NVlCbDRk?=
 =?utf-8?B?STRuVSt2Q2cxTWpqV001T2ZvQ0Q2allWekNQSytUVVZyenIvSlBnL2U2OFVq?=
 =?utf-8?B?by9CRTcwVU9jZkM4MkI1QWxvQUtMZDV5WThDdG5OQWt2SS9FVE9pd3BIbThL?=
 =?utf-8?B?TkUxdUx6bGxLR1VuQUlMeTNaUEtRSExWSGM4K2ZucFpLSFZXQkFDNTJwRS90?=
 =?utf-8?B?emJMY0cyUGZNQVhYajNGbWdlVE1rQUxqMmNxU0tkSk5kRmhpa1hXbWcxM0l3?=
 =?utf-8?B?Tkg0Tjd6U2RCR2V0NlN5M2NadVh6VEE1dFRYckZ4QU5saHRIYitUQzNIeEQ0?=
 =?utf-8?B?N0pIZjg1L3ZlcmM4YnhWREFSZlpEZDM4MTNnS0tSRjdHbGRLNUpLcmJhbnB1?=
 =?utf-8?B?WkRrT3ZQcFpmT3dUMmhhRjUwRVNvY04vZ0pxU1lCYjdlSGh1THh0dzBBWVpH?=
 =?utf-8?B?M0l3WkxwbXY4YnNQU2Vxc09RMWtzOXY4QXowSHlxUHh4cTh3Y1VCd3o2dHFk?=
 =?utf-8?B?SUE3NFJJV0NCekxRUUE4UkU3Qit0TVBZamxVTXYyOUo3YkJuTWwydEJ0bWFn?=
 =?utf-8?B?Tlh3amJNUGo4TnF6ckp4Wm5NTFhyNEw2LzZGU3ZOQmJ5L0Z3Zk9MNXYvOTNM?=
 =?utf-8?B?ZTYweFpJQ1AyQWJrTzdrVGVIVTBnRWYvY2F0TFZ1Y3lrQlpNTzltS1B3cU83?=
 =?utf-8?B?QkJwOHR0SjBsUlZTTWFud0VSTTI4bjdmZXV1dlNpYUF6RzhzVk9nWXcyNDlO?=
 =?utf-8?B?dU9aL1U4aXhvSzVHb3dXWmdnWkVnMkF5UmJTSVk4aHB4b0xxamJUSEExZWJJ?=
 =?utf-8?B?NXl5QlJJOHFqaHNPSjVYRUhjbkQ5NHdSNDRGTWZsTVBxOUR2bUJraExUTTFz?=
 =?utf-8?B?WUhlNE00Z29ZaEd2aE9wM1pZZGlBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60E716E93557974DBDD5C9DAABAE98E7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9291386d-8365-4115-14e6-08d9db3906e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2022 10:47:02.3250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2xGaostysbC/SxV/XUggeWSXa346VZsLtyW0WNg0SisA/LFQ5cHMkZD5QDIY9ieF+gokdITieGCFxFfCW7vK8U1l1mdN+nVaOO+Dxmc6bcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3635
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTkvMDEvMjAyMiAwMzoxMiwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gTW9uLCBKYW4gMTcsIDIwMjIgYXQgMTE6MDc6
NDVBTSArMDAwMCwgY29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBGcm9tOiBD
b25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPj4NCj4+IEFkZCBkZXZp
Y2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIHJlYWwgdGltZSBjbG9jayBvbg0KPj4gdGhlIE1pY3Jv
Y2hpcCBQb2xhckZpcmUgU29DLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IERhaXJlIE1jTmFtYXJh
IDxkYWlyZS5tY25hbWFyYUBtaWNyb2NoaXAuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gICAuLi4vYmlu
ZGluZ3MvcnRjL21pY3JvY2hpcCxtZnBzLXJ0Yy55YW1sICAgICAgfCA2MyArKysrKysrKysrKysr
KysrKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspDQo+PiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL21pY3Jv
Y2hpcCxtZnBzLXJ0Yy55YW1sDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9ydGMvbWljcm9jaGlwLG1mcHMtcnRjLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL21pY3JvY2hpcCxtZnBzLXJ0Yy55YW1sDQo+PiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAwLi5kNTc0NjBjYmU1ZTMN
Cj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9ydGMvbWljcm9jaGlwLG1mcHMtcnRjLnlhbWwNCj4+IEBAIC0wLDAgKzEsNjMgQEANCj4+
ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVz
ZSkNCj4+ICslWUFNTCAxLjINCj4+ICstLS0NCj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL3J0Yy9taWNyb2NoaXAsbWZwcy1ydGMueWFtbCMNCj4+ICsNCj4+ICskc2NoZW1h
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4+ICsNCj4+
ICt0aXRsZTogTWljcm9jaGlwIFBvbGFyRmlyZSBTb2MgKE1QRlMpIFJUQyBEZXZpY2UgVHJlZSBC
aW5kaW5ncw0KPj4gKw0KPj4gK2FsbE9mOg0KPj4gKyAgLSAkcmVmOiBydGMueWFtbCMNCj4+ICsN
Cj4+ICttYWludGFpbmVyczoNCj4+ICsgIC0gRGFpcmUgTWNOYW1hcmEgPGRhaXJlLm1jbmFtYXJh
QG1pY3JvY2hpcC5jb20+DQo+PiArICAtIExld2lzIEhhbmx5IDxsZXdpcy5oYW5seUBtaWNyb2No
aXAuY29tPg0KPj4gKw0KPj4gK3Byb3BlcnRpZXM6DQo+PiArICBjb21wYXRpYmxlOg0KPj4gKyAg
ICBlbnVtOg0KPj4gKyAgICAgIC0gbWljcm9jaGlwLG1wZnMtcnRjDQo+PiArDQo+PiArICByZWc6
DQo+PiArICAgIG1heEl0ZW1zOiAxDQo+PiArDQo+PiArICBpbnRlcnJ1cHRzOg0KPj4gKyAgICBt
YXhJdGVtczogMg0KPiANCj4gTmVlZCB0byBkZWZpbmUgd2hhdCBlYWNoIG9uZSBpcy4NClN1cmUu
DQo+IA0KPj4gKw0KPj4gKyAgbWljcm9jaGlwLHByZXNjYWxlcjoNCj4+ICsgICAgZGVzY3JpcHRp
b246IHwNCj4+ICsgICAgICBUaGUgcHJlc2NhbGVyIGRpdmlkZXMgdGhlIGlucHV0IGZyZXF1ZW5j
eSB0byBjcmVhdGUgYSB0aW1lLWJhc2VkIHN0cm9iZSAodHlwaWNhbGx5IDEgSHopIGZvcg0KPj4g
KyAgICAgIHRoZSBjYWxlbmRhciBjb3VudGVyLiBUaGUgQWxhcm0gYW5kIENvbXBhcmUgUmVnaXN0
ZXJzLCBpbiBjb25qdW5jdGlvbiB3aXRoIHRoZSBjYWxlbmRhcg0KPj4gKyAgICAgIGNvdW50ZXIs
IGZhY2lsaXRhdGUgdGltZS1tYXRjaGVkIGV2ZW50cy4gVG8gcHJvcGVybHkgb3BlcmF0ZSBpbiBD
YWxlbmRhciBvciBCaW5hcnkgbW9kZSwNCj4+ICsgICAgICB0aGUgMjYtYml0IHByZXNjYWxlciBt
dXN0IGJlIHByb2dyYW1tZWQgdG8gZ2VuZXJhdGUgYSBzdHJvYmUgdG8gdGhlIFJUQy4NCj4+ICsg
ICAgbWF4SXRlbXM6IDENCj4+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5p
dGlvbnMvdWludDMyDQo+IA0KPiBDYW4ndCB5b3UgY2FsY3VsYXRlIHRoaXMgYmFzZWQgb24gdGhl
IGNsb2NrIGlucHV0IGZyZXE/DQoNCkkgbWlzdGFrZW5seSB0aG91Z2h0IHRoaXMgd2FzIHNldCB3
aGVuIHRoZSBiaXRzdHJlYW0gd2FzIHByb2dyYW1tZWQgdG8gDQp0aGUgRlBHQSBidXQgaXQgaXMg
anVzdCBhbiBBUEIgcmVnaXN0ZXIgJiBzaG91bGQgYmUgY2FsY3VsYXRlZC4gSSdsbCANCmRyb3Ag
dGhlIHByb3BlcnR5Lg0KDQo+IA0KPj4gKw0KPj4gKyAgY2xvY2tzOg0KPj4gKyAgICBtYXhJdGVt
czogMQ0KPj4gKw0KPj4gKyAgY2xvY2stbmFtZXM6DQo+PiArICAgIGl0ZW1zOg0KPj4gKyAgICAg
IC0gY29uc3Q6IHJ0Yw0KPj4gKw0KPj4gK3JlcXVpcmVkOg0KPj4gKyAgLSBjb21wYXRpYmxlDQo+
PiArICAtIHJlZw0KPj4gKyAgLSBpbnRlcnJ1cHRzDQo+PiArICAtIGNsb2Nrcw0KPj4gKyAgLSBj
bG9jay1uYW1lcw0KPj4gKw0KPj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPj4gKw0K
Pj4gK2V4YW1wbGVzOg0KPj4gKyAgLSB8DQo+PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9j
bG9jay9taWNyb2NoaXAsbXBmcy1jbG9jay5oPg0KPj4gKyAgICBydGNAMjAxMjQwMDAgew0KPj4g
KyAgICAgICAgY29tcGF0aWJsZSA9ICJtaWNyb2NoaXAsbXBmcy1ydGMiOw0KPj4gKyAgICAgICAg
cmVnID0gPDB4MjAxMjQwMDAgMHgxMDAwPjsNCj4+ICsgICAgICAgIGNsb2NrcyA9IDwmY2xrY2Zn
IENMS19SVEM+Ow0KPj4gKyAgICAgICAgY2xvY2stbmFtZXMgPSAicnRjIjsNCj4+ICsgICAgICAg
IGludGVycnVwdHMgPSA8ODA+LCA8ODE+Ow0KPj4gKyAgICB9Ow0KPj4gKy4uLg0KPj4gLS0NCj4+
IDIuMzIuMA0KPj4NCj4+DQoNCg==
