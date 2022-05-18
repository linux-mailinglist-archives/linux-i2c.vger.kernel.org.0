Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E59152B71D
	for <lists+linux-i2c@lfdr.de>; Wed, 18 May 2022 12:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234944AbiERKHo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 May 2022 06:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234936AbiERKHn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 May 2022 06:07:43 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F7014FCB8;
        Wed, 18 May 2022 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1652868460; x=1684404460;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CJb+v8sjT91V5BCGaoUmv+ElKBUgzo0LnAZjQRUfvB8=;
  b=RMTBU6JMcECa44PcdePTxSZlBomEc0m/SyFcCgyTqM5J9GmLSy4N0fhm
   +GA4uG+Jpm9+mJjOltZZTdhllfCbcEWQxgCjaceGWci4sQAK/yYdg01hg
   gGeglAkvteN7czajVF8d+tXvTlw0URJ7TRyvLxER4BT9CfY4mP/g9Lm3b
   PgqtWKcEpqJfdYUUZBQq83vuM/1577RZRmpj03tYZLtsP9SSfD/HTbPIf
   /kyZH83dQYuTKe0DrpDb2zbcDusTbC92ZHC/8mLjZmbAhV+rcuzOnezNj
   oQoXsUF2X5+QQibxDOkhQ9a6z4+lw8wDd2bAnkkj/hfCKktulLEmpxCrB
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; 
   d="scan'208";a="156531594"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 May 2022 03:07:34 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 18 May 2022 03:07:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 18 May 2022 03:07:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THc91LChWvSRC7DysFm5WQ8YHUOy6K4EnWpmlbFoth98Cn9JNPz9MJXvyZ/RNWlD9eqoM7O7HNOhfOH7hWUTm6g8ftdBqLfECa//T48fcABTavlA6CWufzOUvfb5lyWmLs68N4MP9ziSklwwFPZrTcboHfkjVhz0EXrHkh53CftAdXTvymRG4O5n+RI7W18lkprcPHBogyX+2c1e2WRgxyt8Y6wCpZ9GxcbZN7X4rEAUGA5NLWWWUa2eakfIgeUwfCz+b3RE+edIjTnXdARWz8/Bb3Vqvk+YSbhp6Gu1U08nzxKuO4RIi9gMlUprhmTvebkzYkSj8/FPIyFo5UBh4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJb+v8sjT91V5BCGaoUmv+ElKBUgzo0LnAZjQRUfvB8=;
 b=j/Isfx/58C8/P6mhUVbXkuyMFa7Pzj7bc+PqbLaLvSPzB+ENIT8+TvIV8F4PWnehMzMMRffp6jyxF0ZFPQLrk3ugRj9dqMhjKUBnB+ugFC+khLuQ4dLEBJ4cnAeesNt88NCo0JK3/DZUDQHZp/KS/ne4dxR8T4anmkO/b7IufeyycA4S5nAZaYbxCWJMXIgdG6k8ELzFWZhqdjvPLmCaVE0eFhUFjfBEyS6wXP9EO7ks0D9QAa/x/ChBqZ14U/clEtUFn8tlCfjuPntNclL+pJerP0FJSvaCOYxbn/3nApiiETssHKbcEQHwJYKUl0EvQ1HAeDPW1WFa8CseyoIA/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJb+v8sjT91V5BCGaoUmv+ElKBUgzo0LnAZjQRUfvB8=;
 b=ezSWQV3u/FXlB6pwzHjTURN5pskSx0OB6UZVmWREoJN1HfGFRtuLFDc73O+50XgMGGs5hJpA8uLEh27HM+nbKy7iO77bBGLeCTSTn/SJJfxIdoTq9PQmKyLmb1ZCuHISv5ZkFc+8uXUADFiiOGRQDH1ZGD4nLFYLozqlL4gmZ1k=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 BL3PR11MB6531.namprd11.prod.outlook.com (2603:10b6:208:38e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 May
 2022 10:07:32 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::5bf:6242:720a:9a19]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::5bf:6242:720a:9a19%6]) with mapi id 15.20.5250.018; Wed, 18 May 2022
 10:07:32 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <u.kleine-koenig@pengutronix.de>
CC:     <alexandre.belloni@bootlin.com>, <ard.biesheuvel@linaro.org>,
        <Nicolas.Ferre@microchip.com>, <linux-crypto@vger.kernel.org>,
        <kernel@pengutronix.de>, <Claudiu.Beznea@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
Subject: Re: Bug in atmel-ecc driver
Thread-Topic: Bug in atmel-ecc driver
Thread-Index: AQHYae+akCCRK5V0z0iTJJ8OxLa+hw==
Date:   Wed, 18 May 2022 10:07:32 +0000
Message-ID: <7ffd4d35-938a-3e82-b39b-92e76819fa92@microchip.com>
References: <20220513135954.exewihnibnhdckkn@pengutronix.de>
 <20220517102432.pljcsjkar3oswdnl@pengutronix.de>
 <99a8c7b0-ca73-25a2-f839-9a96cc0989e4@microchip.com>
 <20220517143319.oi7cpgqumv2gn2l6@pengutronix.de>
In-Reply-To: <20220517143319.oi7cpgqumv2gn2l6@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7fd3f28-0c32-4d54-a35b-08da38b6396b
x-ms-traffictypediagnostic: BL3PR11MB6531:EE_
x-microsoft-antispam-prvs: <BL3PR11MB65310D467E2483A3F0B86145F0D19@BL3PR11MB6531.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GmTwu8iBCwDQigdevQymsqb9+bJQ/hTJTrBrkw2KkcHtp65sF/MbFmukwwNMSfgZqN3erGF/nITv268em8PLkM5KXLbgOUsG0fyJ2cJbiPtQ9VfPqDeCK0q24u8TfjcW6+z/E4g1+2hPw7QvQm6pNiEfZ24MpXugw7Py4aERI4eMb22C5dyV3KcCSV8NPH3NYVYH8GwI1Z2TOJBrcphW+DYzq8HM1MwU4HSxKDrHpzIW9S7akm5yDZeItO03A9vcH+rzGsw75grLGR52SQfuigqrfeVa6BD+xciU2YVXx1b2+U04W+tIXiWkelckgat6Kr1p+KcuG9DNfjXgeAbZ2ojukM2i8jtHTmNLxpKGn/CdxLvsfHhuDyXDjZaNi7WP+kiltxkbWwe4Ao7NjSWnIidyprHODc1+K171tTVdHFoi3cYgp2uwbzSp3BvDX4R+aTM3IbrmCWRlbpRbBp2cBf/zOLjLcWo/Ke6+1vPbPk/boVsw0cl/hP99I0AMOkTTKDFTdN8c7FE3V0Jqqj35vYM/6vNoeHFTYgQPyTxMQ4viv6S0MvKNTdIFyr4/0BRkmHjfb9SDxoHCbS9s6u4mHTORWBiHQW8Rcw3WtO5DZ0xgrD8vC2A7xbIc4Sx9IPl1LNSJXG+wvLwqh3TW7RS0wVJKuum8IYGT80F9Dtm4OKhzV4sg0wT+0oKyv0FJ8mLqkYfka6acT20sKIqvusGu1jAdrI6XgiRg4oKdwTVF9hbTrCR4GQ5OvPO3JOkzsLLJFGu4Bwo4GcOq/Gc4uoqX83++ag4ZKFw5HlCT9iNoDeOVTkaoZy4Qm8KWvqZ56wDi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(4326008)(2906002)(5660300002)(316002)(64756008)(6916009)(66476007)(6486002)(66446008)(66556008)(54906003)(31686004)(76116006)(71200400001)(38100700002)(36756003)(508600001)(6506007)(66946007)(2616005)(66574015)(3480700007)(38070700005)(186003)(53546011)(86362001)(31696002)(122000001)(6512007)(91956017)(8676002)(26005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHM1YlVvMDVTWnVNeWhXSmZweG12R2ptWlEwRlV3M3YvTnpiV29JbjlTYlNt?=
 =?utf-8?B?MVE3a0ZqcHRzVm0wdC9NZkN1UytFSTcwUjlPbWtpV3piWWpUOUpWNTk1REFu?=
 =?utf-8?B?MlFZV1ZkbGh6eVpQbTkxeFplS09KeU1NdXNSbXVQWEx1TnlyNm9CNHdmcDE0?=
 =?utf-8?B?aVprek0wamlOajQyZ2t1dEd2Y2Rrb2trbzJNRDk3Q0VQRzgzY2hZYjhubnV0?=
 =?utf-8?B?bTdINjFNN3AxdVhETWhvMUhnVzlvSWtyclBqTklxc2k2bk9wTTNhalg0Q0Fv?=
 =?utf-8?B?NVpWaklhSExVemx4NmV3OW1Sa0lUVk96V0dxdVpvd3hITXhoZVBiRW9VYW5r?=
 =?utf-8?B?Vk9Qb1NyZEJJbklJdkJIRUxHb3ExZDRDMGJ4N0NqbnJlL1RXQXhnVjNNNWM2?=
 =?utf-8?B?S3Y4bWRvUnY1dUt2THNNNG9keUVtb3Y2dWhOVkxSdHVhVHZ4UGMxMkRkOFk1?=
 =?utf-8?B?d1VDVjhsbE85dlJXb3FNdU8vbWc0U3lnbmNDOVRhYmtQK1A2NW56dTB6UmN5?=
 =?utf-8?B?eFEyS3kxaitwMjl3VzN3d2h4NFZxd1A3dUtnL1JvVk9HQWZyMUh6V2U0ZUwz?=
 =?utf-8?B?VUM3WjA4Nll2eXM4M3NvM3draFRYMTJZaVFnamxhaWN2bDluY3F6WjFEc3l4?=
 =?utf-8?B?UHBGcXZNSGFDYzlHd1o3cGg1MzU1cmZtMjd5M2FIR2lFTGhIK0RLanA0dlNz?=
 =?utf-8?B?VzZmcmd0Y0dMcDNnNlozbkxLaWcvL2tPQnV0RGVGYS9JRlZkaUJHcFhOd3Yv?=
 =?utf-8?B?MmxWTnBhNFkxNDVXdFdHcysvSC9lVlQ1azMyNm1hcC9ndWd0cDc5VUFXMDZk?=
 =?utf-8?B?WXZ6T1FNR1RFNHovS2wzNitzaEUvQjQxK3pXMWZZdGNEckNneGsrL1N3R25q?=
 =?utf-8?B?NUh6SGFWVFlkbHR4VmFPa3ZpSWlHMjE0ZWx1d3JrSjNQTXRST29jNzBqSXVB?=
 =?utf-8?B?TVVQYnorc0VuYXl0clNUV3hQekFJK1QxdEErRFN1bEQycGRJK09Rb3NyTVIy?=
 =?utf-8?B?V1RzTWVuWWdoRE94ZUVTSkdDQlUzQnpKTERSMnN4TjI4bGJXUXNxSXBSaWZa?=
 =?utf-8?B?Y0R5bG5BamxDR1JtcDQyZDZBVUE3RjFVdmNEcW9LK2ErckU3ajJrUmRYUEx6?=
 =?utf-8?B?clFPNDd5V3dzT05tejdFdW1ZbUxwdnE5aXFER3RqWW1iK0tGMWF2TE1aWkpX?=
 =?utf-8?B?WUZLZG5jRnp2UkdLY05Nc1RvZUtQbGYwRU5Ia2Y1b2JDek1NenJLMUJNRXdy?=
 =?utf-8?B?RURyTnlaQUNVVW5aai96Rkd5ZlBhWUdGWlZRVTl4R1BXc0l5aitUNHVxTVox?=
 =?utf-8?B?MXRiNmdGb1VORzlMVEVFaGl1RjZuNFI5Wm5wRjVLeU0wN05mYmNyTjZCaHNY?=
 =?utf-8?B?VnFaOXMvZXRUVFVubFNnaTFmZ1VlMFFKVjNtOW1UQngzYXJXYXovYXd0QVlj?=
 =?utf-8?B?WGZ4eEtNUEkydktqcGNqeUJtckczb09HVEdCWUVhN2hCRUdDSVBPd3FWMVhx?=
 =?utf-8?B?akd4dW9pLzd3bTRKYXQ0NVJIOGM5VzFveVFHM0hVOG9Kem1mKzBhSnpLWERQ?=
 =?utf-8?B?TEdiOTNoZ2RQSTRTYitnU2NyeFArWXNoZGFjK2JsU2RiMndFQ2xwc1VkU0Ev?=
 =?utf-8?B?ZEErS05VLzJ0WFkrek1zaHNnN1BvSlV1NlRSWWpsWFF6Z1NyUFltSm9SM1Y2?=
 =?utf-8?B?WjluRURSdWZXbXdVTlluUFFzckVRSUFRK01jSm1KUmNZQi9GVC91a2FoUGFO?=
 =?utf-8?B?ZnFvRU8rRTBrWFBmd29pa3k2RFJ5UnJPU3UzVG1uZzR3VXlBNXhpZG5Gakdj?=
 =?utf-8?B?YnpobEJaektNajlwZGJuRVpvR0Fkek1ER1JreTJubVlyUmpzKzRIMXZLWEZq?=
 =?utf-8?B?UW1lckxvdi9JQ2tjTHhaZEYrOUMzNUY3aXU2dFJuWlF2UXRzUEVlS0NjLzVJ?=
 =?utf-8?B?UVUzYkpMNXU4WVRUY1FJY3A0MXp2bDNKMU1rSzhaVzdiSW15VUtHZmdaNDZX?=
 =?utf-8?B?a2hmdlNLcEZrYWpLMFM4bjRMUkFmK0JLQzBwZkRZOGFOazVQSm1pcmZhaGlq?=
 =?utf-8?B?eFRBM3g0TFc5WnlHKzVkR1QxdldqQjBKSFFUNVVGVkVHcjdhQ0QyWklYckFZ?=
 =?utf-8?B?cHM3SHlzVS9OdlQyZFB6cFJma1RMUFdlZ3psSDdadWZ6UHFDN0RLOXZCUmpP?=
 =?utf-8?B?TklwUnJPc0ttYkMyaElhYTVid21vdVBNeWNYNzBzWi85VHBnZ1hzS2ZwYlo1?=
 =?utf-8?B?dEx0a2F6L0RnSXpBSUJWeGRDVENNQkFCdC9LTWtDU0ttb2JBZ081MFo0ZXRm?=
 =?utf-8?B?Mk9BSXJNOEtIT2pteDk5NTI0eElWSzdhUkl3MW93c2FzOVFmWHFLdzhWTmZ1?=
 =?utf-8?Q?8vG3ir4DoR5hbRaA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <119D87298018F04D97EBE102A4A18717@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fd3f28-0c32-4d54-a35b-08da38b6396b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 10:07:32.4268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CDa5WG7qoitW9KTb16bQfDiXaF/7KuQdXi2TOB/DebohkEwAICGugvvnvofjUVNoROzYkZdpprS3WCLOKqE0PvB8EZZYYUUNAlz4yXVUhX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6531
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gNS8xNy8yMiAxNzozMywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IA0KPiBIaSwNCg0K
SGksDQoNCj4gDQo+IE9uIFR1ZSwgTWF5IDE3LCAyMDIyIGF0IDAxOjExOjIyUE0gKzAwMDAsIFR1
ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IE9uIDUvMTcvMjIgMTM6MjQsIFV3
ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOg0KPj4+IE9uIEZyaSwgTWF5IDEzLCAyMDIyIGF0IDAzOjU5
OjU0UE0gKzAyMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOg0KPj4+PiBUTDtEUjogd2hlbiBh
IGRldmljZSBib3VuZCB0byB0aGUgZHJpdmVycy9jcnlwdG8vYXRtZWwtZWNjLmMgZHJpdmVyIGlz
DQo+Pj4+IHVuYm91bmQgd2hpbGUgdGZtX2NvdW50IGlzbid0IHplcm8sIHRoaXMgcHJvYmFibHkg
cmVzdWx0cyBpbiBhDQo+Pj4+IHVzZS1hZnRlci1mcmVlLg0KPj4+Pg0KPj4+PiBUaGUgLnJlbW92
ZSBmdW5jdGlvbiBoYXM6DQo+Pj4+DQo+Pj4+IAlpZiAoYXRvbWljX3JlYWQoJmkyY19wcml2LT50
Zm1fY291bnQpKSB7DQo+Pj4+ICAgICAgICAgICAgICAgICBkZXZfZXJyKCZjbGllbnQtPmRldiwg
IkRldmljZSBpcyBidXN5XG4iKTsNCj4+Pj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUJVU1k7
DQo+Pj4+ICAgICAgICAgfQ0KPj4+Pg0KPj4+PiBiZWZvcmUgYWN0dWFsbHkgY2FsbGluZyB0aGUg
Y2xlYW51cCBzdHVmZi4gSWYgdGhpcyBicmFuY2ggaXMgaGl0IHRoZQ0KPj4+PiByZXN1bHQgaXMg
bGlrZWx5Og0KPj4+Pg0KPj4+PiAgLSAiRGV2aWNlIGlzIGJ1c3kiIGZyb20gZHJpdmVycy9jcnlw
dG8vYXRtZWwtZWNjLmMNCj4+Pj4gIC0gInJlbW92ZSBmYWlsZWQgKEVCVVNZKSwgd2lsbCBiZSBp
Z25vcmVkIiBmcm9tIHRoZSBpMmMgY29yZQ0KPj4+PiAgLSB0aGUgZGV2bSBjbGVhbnVwIGNhbGxi
YWNrcyBhcmUgY2FsbGVkLCBpbmNsdWRpbmcgdGhlIG9uZSBrZnJlZWluZw0KPj4+PiAgICAqaTJj
X3ByaXYNCj4+Pj4gIC0gYXQgYSBsYXRlciB0aW1lIGF0bWVsX2VjY19pMmNfY2xpZW50X2ZyZWUo
KSBpcyBjYWxsZWQgd2hpY2ggZG9lcw0KPj4+PiAgICBhdG9taWNfZGVjKCZpMmNfcHJpdi0+dGZt
X2NvdW50KTsNCj4+Pj4gIC0gKmJvb20qDQo+Pj4+DQo+Pj4+IEkgdGhpbmsgdG8gZml4IHRoYXQg
eW91IG5lZWQgdG8gY2FsbCBnZXRfZGV2aWNlIGZvciB0aGUgaTJjIGRldmljZQ0KPj4+PiBiZWZv
cmUgaW5jcmVhc2luZyB0Zm1fY291bnQgKGFuZCBhIG1hdGNoaW5nIHB1dF9kZXZpY2Ugd2hlbiBk
ZWNyZWFzaW5nDQo+Pj4+IGl0KS4gSGF2aW5nIHNhaWQgdGhhdCB0aGUgYXJjaGl0ZWN0dXJlIG9m
IHRoaXMgZHJpdmVyIGxvb2tzIHN0cmFuZ2UgdG8NCj4+Pj4gbWUsIHNvIHRoZXJlIG1pZ2h0IGJl
IG5pY2VyIGZpeGVzIChwcm9iYWJseSB3aXRoIG1vcmUgZWZmb3J0KS4NCj4+PiBJIHRyaWVkIHRv
IHVuZGVyc3RhbmQgdGhlIGFyY2hpdGVjdHVyZSBhIGJpdCwgd2hhdCBJIGZvdW5kIGlzDQo+Pj4g
aXJyaXRhdGluZy4gU28gdGhlIGF0bWVsLWVjYyBkcml2ZXIgcHJvdmlkZXMgYSBzdGF0aWMgc3Ry
dWN0IGtwcF9hbGcNCj4+PiBhdG1lbF9lY2RoX25pc3RfcDI1NiB3aGljaCBlbWJlZHMgYSBzdHJ1
Y3QgY3J5cHRvX2FsZyAoLmJhc2UpLiBEdXJpbmcNCj4+PiAucHJvYmUoKSBpdCBjYWxscyBjcnlw
dG9fcmVnaXN0ZXJfa3BwIG9uIHRoYXQgZ2xvYmFsIGtwcF9hbGcuIFRoYXQgaXMsDQo+Pj4gaWYg
dGhlcmUgYXJlIHR3byBvciBtb3JlIGRldmljZXMgYm91bmQgdG8gdGhpcyBkcml2ZXIsIHRoZSBz
YW1lIGtwcF9hbGcNCj4+PiBzdHJ1Y3R1cmUgaXMgcmVnaXN0ZXJlZCByZXBlYXRlZGx5LiAgVGhp
cyBpbnZvbHZlcyAoYW1vbmcgb3RoZXJzKQ0KPj4+DQo+Pj4gIC0gcmVmY291bnRfc2V0KCZhdG1l
bF9lY2RoX25pc3RfcDI1Ni5iYXNlLmNyYV9yZWZjb3VudCkNCj4+PiAgICBpbiBjcnlwdG9fY2hl
Y2tfYWxnKCkNCj4+PiAgLSBJTklUX0xJU1RfSEVBRCgmYXRtZWxfZWNkaF9uaXN0X3AyNTYuYmFz
ZS5jcmFfdXNlcnMpDQo+Pj4gICAgaW4gX19jcnlwdG9fcmVnaXN0ZXJfYWxnKCkNCj4+Pg0KPj4+
IGFuZCB0aGVuIGEgY2hlY2sgYWJvdXQgcmVnaXN0ZXJpbmcgdGhlIHNhbWUgYWxnIHR3aWNlIHdo
aWNoIG1ha2VzIHRoZQ0KPj4+IGNhbGwgY3J5cHRvX3JlZ2lzdGVyX2FsZygpIHJldHVybiAtRUVY
SVNULiBTbyBpZiBhIHNlY29uZCBkZXZpY2UgaXMNCj4+PiBib3VuZCwgaXQgcHJvYmFibHkgY29y
cnVwdHMgdGhlIGZpcnN0IGRldmljZSBhbmQgdGhlbiBmYWlscyB0byBwcm9iZS4NCj4+Pg0KPj4+
IFNvIHRoZXJlIGNhbiBhbHdheXMgYmUgKGF0IG1vc3QpIG9ubHkgb25lIGJvdW5kIGRldmljZSB3
aGljaCBzb21laG93DQo+Pj4gbWFrZXMgdGhlIHdob2xlIGxvZ2ljIGluIGF0bWVsX2VjZGhfaW5p
dF90Zm0gLT4NCj4+PiBhdG1lbF9lY2NfaTJjX2NsaWVudF9hbGxvYyB0byBzZWxlY3QgdGhlIGxl
YXN0IHVzZWQoPykgaTJjIGNsaWVudCBhbW9uZw0KPj4+IGFsbCB0aGUgYm91bmQgZGV2aWNlcyBy
aWRpY3Vsb3VzLg0KPj4gSXQncyBiZWVuIGEgd2hpbGUgc2luY2UgSSBsYXN0IHdvcmtlZCB3aXRo
IGF0ZWNjeDA4LCBidXQgYXMgZmFyIGFzIEkgcmVtZW1iZXINCj4+IGl0IGNvbnRhaW5zIDMgY3J5
cHRvIElQcyAoZWNkaCwgZWNkc2EsIHNoYSkgdGhhdCBjb21tdW5pY2F0ZSBvdmVyIHRoZSBzYW1l
DQo+PiBpMmMgYWRkcmVzcy4gU28gaWYgc29tZW9uZSBhZGRzIHN1cHBvcnQgZm9yIGFsbCBhbGdz
IGFuZCBwbHVnIGluIG11bHRpcGxlDQo+PiBhdGVjY3gwOCBkZXZpY2VzLCB0aGVuIHRoZSBkaXN0
cmlidXRpb24gb2YgdGZtcyBhY3Jvc3MgdGhlIGkyYyBjbGllbnRzIG1heSB3b3JrLg0KPiBJdCB3
b3VsZCByZXF1aXJlIHRvIHJlZ2lzdGVyIHRoZSBjcnlwdG8gYmFja2VuZHMgaW5kZXBlbmRlbnQg
b2YgdGhlDQo+IC5wcm9iZSgpIHJvdXRpbmUgdGhvdWdoLg0KPiANCj4+IEFueXdheSwgaWYgeW91
IGZlZWwgdGhhdCB0aGUgY29tcGxleGl0eSBpcyBzdXBlcmZsdW91cyBhcyB0aGUgY29kZSBpcyBu
b3csIHdlDQo+PiBjYW4gZ2V0IHJpZCBvZiB0aGUgaTJjX2NsaWVudF9hbGxvYyBsb2dpYyBhbmQg
YWRkIGl0IGxhdGVyIG9uIHdoZW4vaWYgbmVlZGVkLg0KPiBJZiBpdCdzIHlvdSB3aG8gYWN0cywg
ZG8gd2hhdGV2ZXIgcGxlYXNlcyB5b3UuIElmIGl0J3MgbWUgSSdkIGdvIGZvciBhDQo+IHF1aWNr
IGFuZCBzaW1wbGUgc29sdXRpb24gdG8gZ2V0IGJhY2sgdG8gd2hhdCBJIG9yaWdpbmFsbHkgd2Fu
dCB0byBkbw0KPiB3aXRoIHRoaXMgZHJpdmVyLg0KPiANCj4gU28gSSdkIGdvIGZvciBzb21ldGhp
bmcgbGlrZQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3J5cHRvL2F0bWVsLWVjYy5jIGIv
ZHJpdmVycy9jcnlwdG8vYXRtZWwtZWNjLmMNCj4gaW5kZXggMzMzZmJlZmJiY2NiLi5lN2YzZjQ3
OTNjNTUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvY3J5cHRvL2F0bWVsLWVjYy5jDQo+ICsrKyBi
L2RyaXZlcnMvY3J5cHRvL2F0bWVsLWVjYy5jDQo+IEBAIC0zNDksOCArMzQ5LDEzIEBAIHN0YXRp
YyBpbnQgYXRtZWxfZWNjX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiAgDQo+
ICAJLyogUmV0dXJuIEVCVVNZIGlmIGkyYyBjbGllbnQgYWxyZWFkeSBhbGxvY2F0ZWQuICovDQo+
ICAJaWYgKGF0b21pY19yZWFkKCZpMmNfcHJpdi0+dGZtX2NvdW50KSkgew0KPiAtCQlkZXZfZXJy
KCZjbGllbnQtPmRldiwgIkRldmljZSBpcyBidXN5XG4iKTsNCj4gLQkJcmV0dXJuIC1FQlVTWTsN
Cj4gKwkJLyoNCj4gKwkJICogQWZ0ZXIgd2UgcmV0dXJuIGhlcmUsIHRoZSBtZW1vcnkgYmFja2lu
ZyB0aGUgZGV2aWNlIGlzIGZyZWVkLg0KPiArCQkgKiBJZiB0aGVyZSBpcyBzdGlsbCBzb21lIGFj
dGlvbiBwZW5kaW5nLCBpdCBwcm9iYWJseSBpbnZvbHZlcw0KPiArCQkgKiBhY2Nlc3NpbmcgZnJl
ZSdkIG1lbW9yeS4NCg0Kd291bGQgYmUgZ29vZCB0byBleHBsYWluIHdoeSBpMmMgY29yZSB3aWxs
IGlnbm9yZSAtRUJVU1kuDQoNCkkgY2FuJ3QgYWxsb2NhdGUgdGltZSBmb3IgdGhpcyByaWdodCBu
b3csIHNvIGlmIHlvdSdyZSBpbiBhIGh1cnJ5LCBpdCdzIGZpbmUNCmJ5IG1lLg0KDQo+ICsJCSAq
Lw0KPiArCQlkZXZfZW1lcmcoJmNsaWVudC0+ZGV2LCAiSGVsbCBpcyBhYm91dCB0byBicmVhayBs
b29zZSwgZXhwZWN0IG1lbW9yeSBjb3JydXB0aW9uLlxuIik7DQo+ICsJCXJldHVybiAwOw0KPiAg
CX0NCj4gIA0KPiAgCWNyeXB0b191bnJlZ2lzdGVyX2twcCgmYXRtZWxfZWNkaF9uaXN0X3AyNTYp
Ow0KPiANCj4gYmVjYXVzZSBJJ20gbm90IGluIHlhY2Mtc2hhdmluZyBtb29kLg0KPiANCj4gQmVz
dCByZWdhcmRzDQo+IFV3ZQ0KDQo=
