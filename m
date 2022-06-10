Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6339D5464FA
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jun 2022 13:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349207AbiFJLAg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jun 2022 07:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344768AbiFJLAW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Jun 2022 07:00:22 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7C43855AE;
        Fri, 10 Jun 2022 03:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654858774; x=1686394774;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3V8l+3ImUVB85aIVmP87ARZJimn6XYdyAsTYy2TUydQ=;
  b=JfitAJq5+yp1yX5oR9YUmCXVQH4ebqLdbCgcpkn0Qu5cRHGrJPlxxiM6
   tkpvZhujEGWHET+rWxBHjsl9xpKKmf68tJsAdcfOTmD1mMCXZPUDORs0b
   O4iGyzUZ0sSVg5cNcfBU0qeGPPgODXGX5ITrbPU1E0zIFRHnzlKy9ADFa
   7ibn3ORSC6Rh1q2JwhgjNJgN2m5E5ZXWpQrzd7ZFDhcKsMs/B64MLilzc
   Ibvv/vX6kKR8aQPY6qDuBgdDwcrPU2UyR9sY9NH6CcuBocnEJq4lvMKQ1
   l+uM4Z1JrVgw4GRSz16tihGul7w0xODUK3Y5DThCp4XxLeS7pPXALZNle
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="167898598"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jun 2022 03:59:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 10 Jun 2022 03:59:27 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 10 Jun 2022 03:59:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJeP163sX4dAWeSa0cxvyLraZDuGpZd40v0V0Z0GLw+pFtTTZWxxpaWHtBs9X2XSOR9qyeGoSd2MwaNmyOBbYts9aexirao1yUMMrkFM6XPk8PkIfiLwH5KJx5LUYGsSKwAQOYXzOzMAjr381dZzo8ppDG8eyBwvyk+NU99dsfSSxAzp3P1Puc2Sr97e2BjYQXhMN6+9erwM7+reQY90nsLua0s/uWKRElU0lqOy8c9SD8mqWmDDRd8uGp75E7wy5JkcNKdYRSCIk8xiPeIoToIcNeXce5gy+5EpEutQkwDlQ5YNf8M9wgGHRHIOY+nTJd8sgpE6W93adY6A9RYd9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3V8l+3ImUVB85aIVmP87ARZJimn6XYdyAsTYy2TUydQ=;
 b=L7q0kjsybJGa8l5lgY++X1GTSa2FAl/+sNlwJL7gWOQW8HIm8GHJhr6MLkViNI6OkuQ8Sze4jfjO6OuVJMd/XrCCblA1/BbKvDRDgpTJ6VkJzriKZpquml/74P0Uvg962B7vH3KaIblWkyMBu9ustorxjcCkM3Q6R7KaafQt2UA9U10d/l1/dlH8+zBCQhNI1I7FYZ1uT6AG5iAM2hUBVizyclsH8oHJqUaIjgzxcCUiDGf0MNgIwINOCq7EnVdx028FS1Sxrn85oYCAwwEK2fj5pYYycu56flZ5utIjwrdwP6J39UpgeKutcS2DBxl2pwCSQHa+rljuC/dYevwqcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3V8l+3ImUVB85aIVmP87ARZJimn6XYdyAsTYy2TUydQ=;
 b=q8NcJu59tnnrXzjN/P/dVNNhtuWm5slf29TyVo4v54gZqbW08ysVjpuSyCQS5/wdGQVMoI0hRx/rsLs6KB6/REYbgLiwuZ9w6c+WgGyO+PMNzIlw1gmSlEppP1FApSwxIIz34k1qsCJsffvYq75251uBP03Lx3+AJqeaT3mD1To=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BY5PR11MB3910.namprd11.prod.outlook.com (2603:10b6:a03:185::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Fri, 10 Jun
 2022 10:59:22 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5314.019; Fri, 10 Jun 2022
 10:59:22 +0000
From:   <Conor.Dooley@microchip.com>
To:     <lukas.bulwahn@gmail.com>, <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <peter@korsgaard.com>,
        <andrew@lunn.ch>, <kernel-janitors@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Rectify entry for OPENCORES I2C BUS DRIVER
Thread-Topic: [PATCH] MAINTAINERS: Rectify entry for OPENCORES I2C BUS DRIVER
Thread-Index: AQHYfLhKs7YRtv9BDUe8+7qXJUmTJK1IeGkA
Date:   Fri, 10 Jun 2022 10:59:21 +0000
Message-ID: <98ebfad6-3480-5065-fc50-74c8fe85f322@microchip.com>
References: <20220610105154.2358-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220610105154.2358-1-lukas.bulwahn@gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be28ac23-b2a7-429b-f346-08da4ad04657
x-ms-traffictypediagnostic: BY5PR11MB3910:EE_
x-microsoft-antispam-prvs: <BY5PR11MB39106E83A5E99AB8A6EA6DE998A69@BY5PR11MB3910.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xABedoRXcC+puUZ/XRudLM8S8mRFMgAHRfgqtdmJUstlYRCWTPq12q1ARVhEzs0JlFaLJof4LBvUFbu3+SasSbVbttmVlXh20eI2UxHZKi3/sSa0g0uvURODuAuz516VEw2P+CNynuU3FwJQQtORcTOqSZbu1Fj1VdHShW+Ip14LC74OtRYe0IuDmERjGhmhtALYuTViYgXrP12AWDDhjhG4tieMxHYtepISeRJGtvEfmUt0s0s/7g11qNOm74xNgXjshZdMbjmth2hhKgQlbiWsiSa4ect7hioao4+lTvzHfF40nj7KtNEz7Re10p/353b+teI9fYpiz4aGEGRcqsM/Cr2FuhzGgdS3JOi2n8H6tu9baSPWyjX61VJuY22Zgp+kjDgrNVVzOgqBE8ZaEKB0DagmcB03ipvz2mEoKk+bMY8Q1huoivOrkIqnTHweAvLN7P2VqJoMy+LV7icGNapY+o+qLD+S5V1Ivvol1GH2U1kMPr/LSNbIbXXPVeXS7WJ+IwspeJgXDyXksUObRIHjMIWA0JmKuPghSpVWRiNLPUiy/0cGAEs+VvR0thVia1g8KHPTh0msdHHUz4YkXfcjneYN+vJ5x+VSNV364CE83M//xrohnEfnJYQ8y7jVB/b/DSETP5cbijwIARpfKdriQp5DT1QCKCgYqD/blychkI23N/xDoazUDUDspqeyPgbpjmFwVXJBjkDUwmW8444YoHj4ysjddOC0j0CBt0JxPFHxgasxRx/5L0K0JRL7Qyx1k0c8Ffk2RAVbfUmFOA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(71200400001)(31696002)(91956017)(86362001)(122000001)(6486002)(508600001)(186003)(66946007)(83380400001)(38100700002)(66476007)(66556008)(2906002)(110136005)(54906003)(8936002)(2616005)(66446008)(76116006)(36756003)(53546011)(6506007)(6512007)(4326008)(26005)(31686004)(8676002)(38070700005)(64756008)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elNxQVhWT3JTMXU4VC9xTlNzUTViWnVQNGF3Q09LTVMzYjQ1SWs4ckR5S3kx?=
 =?utf-8?B?Y1JSVUJwZFRnQXg0bHFjdWErOWoxQkZvOGpkTWpZdURDZm1nTkdUTTBMMkgw?=
 =?utf-8?B?eS9NUzhRa00yNllOakNQRVRVUDF6QlMwTTNTVDFacUE1bGNjTjBKNEZGWk1x?=
 =?utf-8?B?bUk1TUtXOTlTMDQxQVJscG4xWGpXM3JwN2k4YmlEVjBtT0xJSGZ4RGE2bWJQ?=
 =?utf-8?B?QXVuakl4RHIxcUZYc1h4cSs4dGdsRHlkTitscllSUTRPYVlvZ0t4M3N0c3Vs?=
 =?utf-8?B?R2xYZ05FOTVDWXd4WTduNDY1SVAyQ1ZYR0ZsWXMrYWxqVnFaQmpGaHBIYkZJ?=
 =?utf-8?B?aFJpUk13cVkvREVaMGhHZEpvQ3QyZlJya1ZIZ3BpeTVGSVRiZEQyR0dCQzBq?=
 =?utf-8?B?eW1EOEEvTDhGaThhQW54blkzYUFndVZNM3hrMzJyUXZLVmtJdGxIRElSQjhs?=
 =?utf-8?B?b0J0TFlyK2puTFZDOGN5SUJBWFpSZndDWkVGV2dQRTlOSmo0clpETy9lQzBq?=
 =?utf-8?B?SmZOTHF4bjJuc21uNnpUZDdaUExCcU45Zk5xQi9MRTNoTWdKdmVUMUVUZkRs?=
 =?utf-8?B?Y2UrR01PeWtlNUxzK1gvT1pxTy8rSXRySWpINlptYTFXUDhoUytMcFBvcnR2?=
 =?utf-8?B?T2lVU1hGMFAwK1dTZllLbHhEOGM0ZE5RZUZvbWxQVXJ0eGxKSDQxSFdMSXpQ?=
 =?utf-8?B?TW5UNkI3Si9aTFdHSkwxd1dsZlhxeWpOUTd5eWtDcjQvRjNydllnTU5ET2Vh?=
 =?utf-8?B?V21KSElUZ3RHZnRoU1ZEdkdpcFdzdXJFQlJpN1F4YlQ5QUlhdGNYZm5qMjQx?=
 =?utf-8?B?ajdFRDc1cWMvMFRlb0dnRjc5c3JCR1FXL0FPaWJWRjNRaFM4R3VOdEJ3VkRR?=
 =?utf-8?B?WHZha21RREhhMDMrdVNDNWJ5cGRsT0lQQ01lRjdodkZxMjlCdEozVWdRbzZ6?=
 =?utf-8?B?R3laSGtYTVIrWTFIQWlpdzRzM2xoalRTUVdnZ0hocE1pUlFmYkxVVHd6dDVV?=
 =?utf-8?B?OXdtYlZVNEZQZjkzK2JaRWwxOUV0aGhEbEZQZ3AwVUNLUVhGeVJBbjl2Q1di?=
 =?utf-8?B?ODdCYXdzb2xiL3JvSVEycmxrNkpuWlUwWVNmMVhpd1A4a3piMGxqR0hYOXpo?=
 =?utf-8?B?elY1ZURWVUJWeWFZTUF4VG1lR0tuUEhwR21iejdETjhvdmM2RzAvVWtIRnk2?=
 =?utf-8?B?dllCWHZ5ejZTVUZEUENDcUtGZkxnL2xyekU5TnFNbGpacWo3Z1RQTm9veTZu?=
 =?utf-8?B?NDRCa1VOdm8xMm9VNG9qU05TaGdkU2ZRelBsOXRDY0U3ZnFneDlEZGY0VTY0?=
 =?utf-8?B?RjBPOVowY0JmZlRkR0Z6Tzc4cG45QnQ2QlJaczJZdFlXTlZNNDV2WktmaFZU?=
 =?utf-8?B?bkJLcEJ3ekVYdHRBajMxYTN1ZTZ6TW1PdEx0N1hzYk00ZGc0TUZla3hEd29w?=
 =?utf-8?B?cURNY1hublkra2JYbzVjZjUwUUgzWFpUSHhMcVBSbXlGYzh3aGhkR1pSaVpm?=
 =?utf-8?B?eXRreHk3YythSDVXdVlteG5ycTZmSnFoUDBOUnFSNW9HVVNUSlcyNUFtbzFM?=
 =?utf-8?B?NHArcytEcVNRclBiSEMweklHdGpvQ0hLUmZWWENqS2NOZ1NvTjhUbm5NV1Zv?=
 =?utf-8?B?UzdDb3hpdGNaYVRmd056YUpCZ2V6ZU1aUERNekVKZDhUS3lXWWZMWlBvcnNL?=
 =?utf-8?B?NGJPZFFWbkpsbXBsMnhrRUJpWkwram9aNFh4OU1uZmpuNmRuUDROWlFQMWlC?=
 =?utf-8?B?UlVvUjUrWEN5c3pzZjVINkl0SVlSR3pSUWc2VEZETGhpVVlIUXZMQmxhblpE?=
 =?utf-8?B?QnFPMHA0Zk0rOXQ1N09zN0c0VHVFbGVJdmJPZWtUV0dLZ1NXOG4rcDJSbnhj?=
 =?utf-8?B?TTZZVjhHc0lzZStUSzc3c3NiTHF0ZnhLRU1JamFjQmZwVW8wQ3Z5R21SZGhq?=
 =?utf-8?B?QWlEb2lIMmd6ZCs5cno1eEJiZWt0aEdsY1Jnbllqbk0vbU5PTlladHVqVyt2?=
 =?utf-8?B?Z2FwQjhOdGxBVHdlbmliYzNkd1RZc1VhOXo0dzQwYnp3emd6eHJGNGRaMjNC?=
 =?utf-8?B?a09DZkdpMlZLaUVRWG05Q2I5RXoxNGtrUlM4WTBGSklHZUJJamNQYjNtVURw?=
 =?utf-8?B?NmJ2d1U1MjFlVldkZzg4dXpldzhuWGZoZjlnd2tNcDlaWUw4TjQzcVd4VDBM?=
 =?utf-8?B?YjFWZFdWV1ZtaVUyMUpXWFdCVStmZVBpSFNGbGptdXR5TGE5RDdQWWN2VUVO?=
 =?utf-8?B?WnFBakprS1pCNzgvN0k1cmpMeUhsZEZkZlFWQzg2eEFkbkZ4aUEvMjFIYUp6?=
 =?utf-8?B?aTZYOHk1TTk3aE1vOHBMSExxSDh5M0RKU09lY2FseGVJUUpTNS9NQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF5314A4DB90544F9DCCBB14C2FE0B3D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be28ac23-b2a7-429b-f346-08da4ad04657
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 10:59:21.9699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cy3sRu9xcK34UBL4wvX+Pmt3sMeRx+U8H/b4qz6SmOI+qa7f0TPsN//uFtMh4HNNGT3HDbIzQNvU+fdXryndY+AlEwh6plyjFkR2baxl41c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3910
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTAvMDYvMjAyMiAxMTo1MSwgTHVrYXMgQnVsd2FobiB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBDb21taXQgOGFkNjlmNDkwNTE2ICgiZHQtYmlu
ZGluZ3M6IGkyYzogY29udmVydCBvY29yZXMgYmluZGluZyB0byB5YW1sIikNCj4gY29udmVydHMg
aTJjLW9jb3Jlcy50eHQgdG8gb3BlbmNvcmVzLGkyYy1vY29yZXMueWFtbCwgYnV0IHRoZW4gYWRq
dXN0IGl0cw0KPiByZWZlcmVuY2UgaW4gTUFJTlRBSU5FUlMgdG8gYSBzbGlnaHRseSB3cm9uZyBu
ZXcgZmlsZW5hbWUuDQo+IA0KPiBIZW5jZSwgLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIC0t
c2VsZi10ZXN0PXBhdHRlcm5zIGNvbXBsYWlucyBhYm91dCBhDQo+IGJyb2tlbiByZWZlcmVuY2Uu
DQo+IA0KPiBSZXBhaXIgdGhpcyBmaWxlIHJlZmVyZW5jZSBpbiBPUEVOQ09SRVMgSTJDIEJVUyBE
UklWRVIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWthcyBCdWx3YWhuIDxsdWthcy5idWx3YWhu
QGdtYWlsLmNvbT4NCj4gLS0tDQo+IENvbm9yLCBwbGVhc2UgYWNrLg0KDQpBaGggY3JhcCwgY2hh
bmdlZCB0aGUgZmlsZW5hbWUgZnJvbSBmZWVkYmFjayBhbmQgZm9yZ290IHRvDQptYWtlIHRoZSBj
b3JyZXNwb25kaW5nIGNoYW5nZS4uIFRoYW5rcyBmb3IgZml4aW5nIG15IG1lc3MhDQoNCkFja2Vk
LWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KDQo+IFdvbGZy
YW0sIHBsZWFzZSBwaWNrIHRoaXMgbWlub3Igbm9uLXVyZ2VudCBjbGVhbi11cCBwYXRjaCBmb3Ig
eW91ciAtbmV4dCB0cmVlLg0KPiANCj4gICBNQUlOVEFJTkVSUyB8IDIgKy0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+IGluZGV4IGZjNWI3NGFkMDE0MS4uMDJlOTFh
YzRlZTA0IDEwMDY0NA0KPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiArKysgYi9NQUlOVEFJTkVSUw0K
PiBAQCAtMTQ5MjAsNyArMTQ5MjAsNyBAQCBNOiAgICAgIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJA
a29yc2dhYXJkLmNvbT4NCj4gICBNOiAgICAgQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPg0K
PiAgIEw6ICAgICBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+ICAgUzogICAgIE1haW50YWlu
ZWQNCj4gLUY6ICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1v
Y29yZXMueWFtbA0KPiArRjogICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
MmMvb3BlbmNvcmVzLGkyYy1vY29yZXMueWFtbA0KPiAgIEY6ICAgICBEb2N1bWVudGF0aW9uL2ky
Yy9idXNzZXMvaTJjLW9jb3Jlcy5yc3QNCj4gICBGOiAgICAgZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1vY29yZXMuYw0KPiAgIEY6ICAgICBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvaTJjLW9j
b3Jlcy5oDQo+IC0tDQo+IDIuMTcuMQ0KPiANCg0K
