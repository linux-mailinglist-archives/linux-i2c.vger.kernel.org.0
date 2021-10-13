Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFFC242C109
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 15:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234907AbhJMNMk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 09:12:40 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:7199 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235011AbhJMNMh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 09:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634130634; x=1665666634;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=J+DQBSaZSEXXL5bSJdHieqKBb9SPdr6eU4302/FR4xM=;
  b=jSXG1hixDFAn0D5zw+U5tZ50CNmyg5hbZXxLV/DEFmpq6DEj2jWk8Dm/
   vosr2Nm0bPMZ60dS58UExW8BDQKbgyAp0vISJxuvNlLNo++VINxBeqXK0
   WrTS1JdBNkJatn1e3nUtHY1PH4qHa2qnaOJEEBGy/oUooLQ+WnSeN8ecX
   gJUmb8uIr8FHELlF3EAWI9Wc6Nb3Hpw1DGcCyA95LN8D9JKZQTj3mxHd5
   zRDKSki+GfjfDmaWclP3mf3oKP8gljFXBOv7Yi2yAwsBIeAQPsGYjWk1X
   ppmcPYAb6ZIXaxTfjMmiG+niw7gl3g8uXYNOfydr5PoRUa1RpNQ7KTkM+
   g==;
IronPort-SDR: KHTaoZQ3SScxfNWwnjljaDUnK2qABYAkYemhmzqs1G1WFygx9zlFZZ/fRXGlqtzXklOV8Zr1iq
 pboOHdoz/diVyM7K3K1rj24wAY9ODeMCJHdeCP/14P0KS9h9v8ZXI4PnYuI0cLsXOcUS34tSId
 I5FMdaa8RXihLs3gKQVczxydy1OSS3qD8zAgJorYiJXHMmghHcS5SC5IP6DdOWOItm+rPnxkdG
 oRVbDVsCGKnqqAmKPL9brTJBX2uDBttZYi+Eyqpyhn6phcF6RS/BGQajW6KRy6aYTNLg/0Mp7j
 HVMxRc1Wd3/RVfLBWz313gGD
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="132850942"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Oct 2021 06:10:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 13 Oct 2021 06:10:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Wed, 13 Oct 2021 06:10:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1Gdk/CTtuD7KZdE98YbBLXNJ4klDpF92zOfYz6SZv4ST4fml8+DgnfpmD23O+gjhLmSrULrBmwBg7btqrE7+Mx6CtXTcYQ7VAN5Z/LXvpVM1kb+JbCVEBkA/7hGJYy+up2HoeDnmsxGZtMMlr0dtjnQxiz2lk3T7Kl0WGnWjEut8LOgh8TW4Nm9AqGfYjiqdyTrE9XqUJxs1PXH8uOPN58PoyGlNOcWOkhc3CJKeCsKd+fEEdJ7zPhGZtC9qCvN/OR9mPMm3R413dupKEtJm8RPMkylmD1DP3hwhL/rnXO6lBI1f8nxbnvgDDkD6KM7hPU7rT5AuVQiGR4kcfQmKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+DQBSaZSEXXL5bSJdHieqKBb9SPdr6eU4302/FR4xM=;
 b=I2cAh4AwFQj9LoXXG6KicBlk3qdCe8sgFaJyodZRjQ5HY8RHUOgmOB4qGOdPNi6kAGW/XgheHR8AJ6nmqnoORvEXLNriQckttzXnLEdYFtu2eoEOaInMTFcr7hSsdX5W7ZxscSVIf4G+Nq0Z9tJMhAzO1I77PdqPuirQLxoPf8cjEnzCwa2+0tCEpxdGJuVMp+UGvQx4g2R8ddV1X4Fu+iaqwnsAlot8cOs9rxH7sTxSZXby93m8naNtOk21BwAgT8sToExQ1jXKIOU7RXPd12aecY6EQ6u9GmAsyKP7cltzAt/4PPZF9nnpty9UaTvowR0GMCr30e4uF1jPLgaHYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+DQBSaZSEXXL5bSJdHieqKBb9SPdr6eU4302/FR4xM=;
 b=iZ36bcFG8H5EgcR0VNHFYPRW7bkCHWrl2mV8tzJjNq6JUbEI/d4fGEjxwaJLgZ35klUlRxeop5s1f582YPHu7FQlTVqwPvmeiq0qMeczRKFsw6MvUtE4We+emyvT0NXSDOKuCwd0EXuZDtsfeYW/VKi0pnhhUj79BaOGPCR+rCk=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 DM6PR11MB2633.namprd11.prod.outlook.com (2603:10b6:5:c0::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15; Wed, 13 Oct 2021 13:10:25 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::50fa:94b5:51bc:6409]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::50fa:94b5:51bc:6409%9]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 13:10:25 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <Horatiu.Vultur@microchip.com>
CC:     <robh+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] i2c: at91: Add support for programmable clock source
Thread-Topic: [PATCH 0/2] i2c: at91: Add support for programmable clock source
Thread-Index: AQHXv3JagbJxWnjRXkiEtRVe8te35qvQn4gAgAAwKwCAABjHgA==
Date:   Wed, 13 Oct 2021 13:10:25 +0000
Message-ID: <bdbc47b1-e98e-b2c2-61a4-86a3edecff3b@microchip.com>
References: <20211012140718.2138278-1-horatiu.vultur@microchip.com>
 <8a775c67-00a3-1dbe-daa3-09a537f482d8@microchip.com>
 <20211013114144.7j4scdaq2rjfmiwn@soft-dev3-1.localhost>
In-Reply-To: <20211013114144.7j4scdaq2rjfmiwn@soft-dev3-1.localhost>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5c8bd33-7d5d-4a57-6c31-08d98e4ad263
x-ms-traffictypediagnostic: DM6PR11MB2633:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB2633CCD9AD785187515D7FCFE7B79@DM6PR11MB2633.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i7WsnrfBzKPQDMNulKbBq09wD3PG0lnk483+X4qQWCHtzEahhouJKAAktFX8Fi+Ek5d1BXRv9JrFt4nxTF6OKtkVTDRsMGnxFHCJmRYCjXHtK4DY/UMiXnUSXdrvMRXjXZ3ceNg/WNBrnFvLb4Y2CNAvXEwq+7vLg3PuiF7zf8I3YTYboWbrPrYZxivaDrVz0Ku5BCtzikzdpYdlUqfnoZ6AryUXJSbcEa5zbD8EnC+w6dDd6HV+LQtyaupIeD/HCfOZzt3R7eq3DcP8ujVt/7EO6Xypr3B540aR1rBwPWfFDOo22ltERts7UBJwzPi1YwAYCSs+iUAjcA7Q8niejXOawki//jWdUIMd1mY3Icdv3ICbxj+bvgmCl4dVqTXYjrSMgJtl5lnIGZx8uhVvRsLSiqWOhcPmk711yYlxbEmdB5Sx7Pt1EY9QW0CnqJr0q+6bXH1z7Tn/uqOUVxF4AOp4hm2cYjSG+95esO4EE/zQVn7cvuPkS62r/Yg+JO86d5889UubCmLzRvTBxgQ4jBv4kotUYyjQ0ofz9gSP1jBzeKev1nmrTIQzbvnbetKB7Go4PtsrXztQkqonu5bEzsYnLRvF8TzMqPJ5/v02hE4oLNqAZr3RBYJNHpkZ5KGg7cBmFxG3jxrARPAYLF8ZLu3V0M0b2Yh/mGB4pS7I1gqCTuOBNqPRTBDWntkFqX/A9uRTywL70M94i+wgQIOtpDkLY+aFOop3LKRSQ5Q1m2DHIaRjBuDnLfXxJsgI7xmjRolueX4uAI0cHa1iT82svw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5687.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(37006003)(54906003)(86362001)(316002)(38100700002)(4744005)(2616005)(8676002)(186003)(31696002)(38070700005)(83380400001)(6486002)(36756003)(508600001)(66946007)(6506007)(64756008)(66446008)(122000001)(66476007)(2906002)(5660300002)(91956017)(71200400001)(4326008)(8936002)(6512007)(66556008)(6636002)(6862004)(31686004)(76116006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3gvK2VtdGIzWkFqaUhFVGE3SEZLOFR6KzA5OGR5UzZMZTIrY1BJRnNzVHRq?=
 =?utf-8?B?UHZsUHV2UUlrM0RQbURWVUlvcDcvZVo3UlNJYStGOXVVWEp5SmxESnBLYkM4?=
 =?utf-8?B?ejRvOXdVZFhBTFc4Zy8yV0tkcGh4WXBsQnlOZjgrOGVnd1l3MGJjRi95emcy?=
 =?utf-8?B?Y3R6bklBbnkzbTM2NS9IQlozZHR6Z0h3SDl3RGFjL3hsdDNNSzh4ZnkxT05t?=
 =?utf-8?B?RVRrdEVJWm94STRyZVlYT3VXS0xMMWJVZlJNYXZDaUFpbkFvSFR2SW9JSVhh?=
 =?utf-8?B?V3Y5bFZ5UlVHcUk4blVZUWpZRkYxS0pRNDVpMGoreThiaWlGdysyekZMVnFE?=
 =?utf-8?B?MUY3YnFpeGxFZWcwOUJERDUxcXNPM3FvVDdkNDF3UWpKSk5IdGhySHZrSjRN?=
 =?utf-8?B?UmZ4RHRKM3QxMFFaeVp1eWFDdEpmZnpNTmdZdUpjZHJDODdaanJFVTA4eDgr?=
 =?utf-8?B?ZXliY1hMTHJtT1c5YVo5Vk5tN01UTWc3MnplTmFtVUdZZllWQ3FyU1ZpalNv?=
 =?utf-8?B?K1dwNkxhTlp0d0c5QXNWeU8xRVpsNzNiaENDTEZDTlVmWFRjZ0o2SjVndG5Q?=
 =?utf-8?B?OStFODE0UkU2NFB6V3pXSDN5NEorV1JINzBpelFHQnBCTEtRcTlsZGFlK2FL?=
 =?utf-8?B?WWhoS1VOcmQ1dmxOYXcybU4xaGF0M2Z5K0VTRUYwMFhlTFpkZUZsSFVNakV6?=
 =?utf-8?B?QWgxZG0zTGZ3L2pKenBrcU8raWxjZmxPbkE0cGp0TGl2eHlDSzVqRlFmbnBz?=
 =?utf-8?B?S3lqMGdZQnRqZGxxUm93SklJanJDWk5vNStMMGRqd3hoUkNzZzBJRXVRbUlI?=
 =?utf-8?B?SjFuZmx1bWNIZGVEUXEySWltU0VrVXIyKzZyUXordi9mNkNzUVluVHNmZHJk?=
 =?utf-8?B?YWNYSUdacmJWQkRLOSt4WXV6Y002QVU0dW5TZ0Rhc2RFOWVicnJBQVJPWFFi?=
 =?utf-8?B?a3c0Qy9lanIzQ21yWi9MQXA1V1lmWG9taW5mNDNiUkJqbXFiR2RmaVJ6Zmpm?=
 =?utf-8?B?aUZQYlB0VU4rTWR5cS8yeTZrSWV3TXAyOVc2TXR6dXF0d3drNGFVNE1LNmpn?=
 =?utf-8?B?ck9ieGFlVEY4MWN2YnJpV2cxWmlKS1YzbEI3YlYwMHB2ZjkxbGxMekhDZ3U0?=
 =?utf-8?B?Zy95TERBZFRZWW5iWXN3Y2ZxbVdhZmFuaFJpM0JicUROVUpwR2JHOW9rYUNN?=
 =?utf-8?B?MWk0cEFHRll0MVNzalNlekpsK1NWSlZtSEVBKzFNUHVIdG1zM3VZZmozQUFE?=
 =?utf-8?B?d2VSMDFJODB4VHlHS2tudWJuKzJwU2F5cktGeXF3T1JldDlPZElwZEFJYXY0?=
 =?utf-8?B?TlNzUVc2YTRaUVhRVDBYbWMvNkthM0dVUmVqZUMvSFIvMDQ4NFk1OCs0S1gz?=
 =?utf-8?B?WjdBa1hVTWhON2Nnc052VHdGMG16dGFCN2d1WFVBQzVNUU9lQTZmNFQyT0lI?=
 =?utf-8?B?enlSN1BVbVV2SWpyS28xZUhuMnVRUmtmY09WelppWVlnclJ4OGhlTzJHb0Jx?=
 =?utf-8?B?cFRBdlR3L1kxc0lkR2VkZWNSUm9SK0FQTnVYaGtRKzYwN2hGOVhXR0JuMU5p?=
 =?utf-8?B?M2RuNGM4elhwOHVEeFVJQTNwdVNVL014d0JGeFNrVWtOaU1wUG5ISjBaY2wv?=
 =?utf-8?B?Z1RvT3pPRWpkV0pEWHNzZENwbU1mOEtTa1M5SzY3K0pveWd6Z2JTUzgzQ0dW?=
 =?utf-8?B?bTd3Nk96aENUTzdrYTFHMzRCbkhXZ1IyNHFJSm42NGRpRUlTQngzVVVHTUJC?=
 =?utf-8?B?ZTFLQXM5NnJidVZqdHBoUkhsNlFlMDRQdHh1dlhqUTJ1czNVVUlCODN4VDd1?=
 =?utf-8?B?bWh5a1ViYnZsQjYzSlhpZmJRVHBwMTVRU2ZSdnU4eERNYUwycGdsR25uT2Ix?=
 =?utf-8?Q?EffXd5TKCExTr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC5CCEEF54589E46ADED5771F829815A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c8bd33-7d5d-4a57-6c31-08d98e4ad263
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 13:10:25.6677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XXCEweLYUOUppjgfE7q7IOzbPiD18bXXxWUpjDlSy8h98F7gLhZf5rkhvvhaVRAYl3iH9EmHFdwAaJ41AYxJa7DJog1pg7/C0WK31wpuIek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2633
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBJIHRoaW5rIGFjdHVhbGx5IEkgd2lsbCBkcm9wIHRoaXMgcGF0Y2ggc2VyaWVzIGJlY2F1c2Ug
YXBwYXJlbnRseQ0KPiBsYW45NjZ4IHdvcmtzIGZpbmUgYWxzbyB3aXRoIHRoZSBwZXJpcGhlcmFs
IGNsb2NrLiBTbyB0aGVuIG5vIGNoYW5nZXMNCj4gYXJlIHJlcXVpcmVkLg0KPiANCj4gSWYgeW91
IHRoaW5rIGlzIHdvcnRoIGl0LCBJIGNhbiBkbyBhbm90aGVyIHZlcnNpb24gd2l0aCB0aGUgcHJv
cG9zZWQNCj4gY2hhbmdlcy4NCg0KUHJvYmFibHkgbm90IHVudGlsIHdlIGhhdmUgYW4gaW1wbGVt
ZW50ZWQgZ29vZCByZWFzb24gdG8gdXNlIEdDTEsuDQoNCkJlc3QgcmVnYXJkcywNCkNvZHJpbg0K
