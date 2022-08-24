Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 285CE59FC45
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Aug 2022 15:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238797AbiHXNxo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Aug 2022 09:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237397AbiHXNx0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Aug 2022 09:53:26 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2617B6179;
        Wed, 24 Aug 2022 06:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661349014; x=1692885014;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QiiRRk5De0ijXRc6IG7vB9gZYB7Ydf/OF7EnnISOkwY=;
  b=VPf3dLMahEaCz9Y7OwfPEjCloV27YffNZlxqikgPohJP4B/gUSyWod7m
   fwbrtMks1bVT5tbPf6ZusZYe1u2Sm4skzI+lOfYCJobE3M5GAqJFYqyNo
   Wm0gRCWwachXsZdctthRGMILUeKNCcSa2n9Qe6cieRGqJRjRQjXgKlSuY
   erVwQJk6e+YXADzyPAAwqsgl8XUUFWC8CLLSewnA2RqUeV0zZsJMgLKBp
   3TPhtdw1Ig1/2yGjfPpaUixhH6KmeFOfJ5kF53P5FzKCT4+NQuqYgxgnM
   CMWyOt0AVeWH/108pcA0cB8oC1PnRIBDIwCythZ6MkcYo0rIZgyX1xohX
   g==;
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="177701041"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Aug 2022 06:48:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 24 Aug 2022 06:48:50 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 24 Aug 2022 06:48:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bly8OMSk3YPC14YrA9xUctjXos0wnseh7otIvNRd6lMQR+BH/hfhgMnE+FBuVXEi8Whh924TxV/NSJKzvqYsqmxDL4llDkIoGpejb/s92lmgI8V5s9rJZpsUSeeWhDjHYwUaNkplyZk/zxKQbbEb4sBglHh3yRrJsupfiB0y3IWDaIcYIrFvwdtUaNGT0Rd3YznGctZe03HWztbpiOeWrZwR5M92x+OVFdDUS9b25oSHe4s+Aseqq8Ca4bmBnH4YmVWYcBjjM3aUpU7pVSUxXXXmzZpDWPIIjn2LQk3hRYa46aQjk3TJti86OdoGj/Mqk4P9J50IAJw43W6YV3vuNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiiRRk5De0ijXRc6IG7vB9gZYB7Ydf/OF7EnnISOkwY=;
 b=Tbh5MRfMLSpXUVJ7p/cYj1SeY3pvuNhAhH7wxZh9Pj6yd4uScxpG5IHOy5Tuu1dMsS7yiaAKkL4VaiS7XJ1gEp6/U32fPLw5yEoOamdTKbKqYrh4gT0QCa8G4vnZ4Akgjqrf3MnvRJkpJlJFOrFzkRnu39Xt6hVCCleDTNq2HVkFlp/hULO6TmorbB6SH4Qq3i4441CVYBqc1B9jY6e2Cxdbb20z5VxoPURISGldK2IA3KWfW94QhipCG7UJdboQyxoKdjpZ0OAq/l8I7t88KTlom3mAYfnWdzraB+ddOg55IC9AX6HX5U3V8QOFnYrgva8eoSDNbnYadebJ+s5++g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiiRRk5De0ijXRc6IG7vB9gZYB7Ydf/OF7EnnISOkwY=;
 b=moFOcyH6ljiHTa7G+D39XkQ9Vuj2u1lzror+3dUZnK8HTMHHWgMoyneAHNiNzCpAM4A2vrJ4HlXjBcGYeCWWApiclKmcPGeeB5FSZQYafQtztBL1XyatHtpjLoYrQSE6g1sr+tVYMjMHsyATXPaB6YJsinMvNS93RlxEkiuQry0=
Received: from PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5)
 by SJ1PR11MB6299.namprd11.prod.outlook.com (2603:10b6:a03:456::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Wed, 24 Aug
 2022 13:48:39 +0000
Received: from PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::b9d5:a00c:517f:8454]) by PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::b9d5:a00c:517f:8454%6]) with mapi id 15.20.5546.022; Wed, 24 Aug 2022
 13:48:39 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <wsa@kernel.org>
CC:     <UNGLinuxDriver@microchip.com>,
        <andriy.shevchenko@linux.intel.com>, <robh@kernel.org>,
        <jsd@semihalf.com>, <olof@lixom.net>,
        <jarkko.nikula@linux.intel.com>, <semen.protsenko@linaro.org>,
        <sven@svenpeter.dev>, <rafal@milecki.pl>, <arnd@arndb.de>
Subject: Re: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Topic: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Index: AQHYttI9ItE0vA92WES0jroLXsIOYq28ST0AgAHJ5oA=
Date:   Wed, 24 Aug 2022 13:48:39 +0000
Message-ID: <4e10a6ed7a1707f093a8947237faea075842d6e5.camel@microchip.com>
References: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
         <8712b866-af22-d9ac-fd84-7d77c2628682@linaro.org>
In-Reply-To: <8712b866-af22-d9ac-fd84-7d77c2628682@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e58c2f3-a890-4c6f-5cf6-08da85d7598b
x-ms-traffictypediagnostic: SJ1PR11MB6299:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qNNDWclGKPc4hzOLeJnl1f89dW+BDFI7U43wq5eK4soT399SCHRZAnj/UAvWC8yo78WNHl3FtS2A6TrUwv3P/QHGFMyXf+GpfUa/JnQXOgrjaDg1qd8wwTahV/wIwParLLnzm1AQlXbRlinlQQXEV29PK7bfuobZIXKFsA6LN3YVqViB34RwbVH+mZmfsbZnNRrJqAzp6OWUWM6oZ5RanElE4rgWiaZxTc2s21PaA2UAvO75B7Vz/rZvecjYFnMM/75zEYP9OGBhamlU1ba2gyO1nkZULvsdRXLaUpAuK1d2jHj6ryJb45Ey/3n2W8bAzy2si6ZRHSamjUhU0BtxJ2FH/39rFZ63ZcLopR9M3qKkQr8Vaze3iTxx90PJEFxfSDVk6SmqegB25kwrjYahAIFBOeCWx2vMOhJSJciW3hLDHKgmQ3d2LJWmCTOlW/28t7ivkiOiGmVTGQ5csJ2EvpZUt0u+awNMOdIJksf3GjtslxBs0ahubPLRKBnJ5GQ2DqkduH2u+j74aqGghzBKK/OBIr31oV4E4RhTrkpmvcGSQN07tKhkpP9n/gGrIcvtC674d1buyNCuVn2i5u1GFn9aoaCztM6ZpCH36QeoCQXATF9MaMMHyvJzGtpssnlGIrkjqGhyVwhkobce+wXTZSf+hBeAkQlSTS92rlcybjuq1WVKaOAVZbXZlk95CPYp7Z5Z4MDfJN5UBqLPmbFXFjOq7dg11kfoRjVHR1aFWVcgUbQxjkaIoCuMJhj2HGLA7MiEkMdYtsulV6k/I8ZmRzyneVnj1Q6WAkNlVcBMFZhYmt6YxK8czjhBSZZy8Taa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5096.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(396003)(136003)(366004)(39860400002)(83380400001)(186003)(2616005)(36756003)(5660300002)(26005)(6512007)(7416002)(2906002)(122000001)(53546011)(8936002)(110136005)(64756008)(71200400001)(66476007)(41300700001)(54906003)(6506007)(66556008)(66946007)(76116006)(66446008)(86362001)(91956017)(8676002)(478600001)(6486002)(4326008)(38100700002)(38070700005)(316002)(32563001)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnJVdjlkQ09OQXR1MVE4ZFdvZllRYk9ydkhoVkp1U1FraWFiZmRQSTFHSThD?=
 =?utf-8?B?cHRFbXgvZFArSnZ0WlJXQjZHNG13NGpkaVdqVUlTd2h6dElzTkV4QkQ1OUNR?=
 =?utf-8?B?Rk5DK2JmR1ljWHMxOWVJR2FtdVJqMkRLdjlKVkFhbGJrZGdMODc4TGI1ejA5?=
 =?utf-8?B?YzVxaW1OcWxCQm5KL3NtQjU1MGNxWWZQU2ZTQzY3RWJBSlZ6L3JIV0Y5SWZH?=
 =?utf-8?B?NlN5a0VDaTZ1M0VZdU5qR1BGL20xMzZjR3V1bDlwcjhwZjVtK0RYalFQVlph?=
 =?utf-8?B?S29TZ25BN3JmdjdUSnBwU3RlTTBMaGZzeGtJVGR5K3F3Q1pLbGpjN0I1WExB?=
 =?utf-8?B?ODBvdDgxQkQvWGRaZkpXTlFzdHB5R1d4c2dpWmF5WU1CVmNtQXh0VEF5U2x5?=
 =?utf-8?B?MHUxTzdGY3JTeUxaUlh2S09pMDJjcTN1WHBNRy9DYmJONzJSeHFMaVhOUkZV?=
 =?utf-8?B?R3RnYTNoMHkxWXVOekV0d0UzRi9zNmR0eFFCVXZBajZoNTlXNTVFWlk2SDha?=
 =?utf-8?B?ZEhKV1VNMzFieFlXNVJzajQrYy9NOWVDNGlXVW1OVlI2UU5tK1hBb0RGaHNm?=
 =?utf-8?B?OHhQaUZLNFhPblBFNDF1dFk4bDZ1L0RqSWNTQTlDOU5WbzFkRTloQldVUjha?=
 =?utf-8?B?ZGVXK1kyVzdIaWRKZ280aUVPWkkvRXl2TVJrc29YcktyT1UrTk9BVW02dmto?=
 =?utf-8?B?T1RYMTFXdFBzVm44R2ZkQmQzajYxSzlrWWRBMWRUUHh4Mm9RWXo3S2h0NlV0?=
 =?utf-8?B?bUlVS1ZGNVZzd2hyTjZxMEtvVVBBcldQTG5HNlhyR0NmM3BydTR2TjUyV0Fs?=
 =?utf-8?B?K3N0eWRRTzZpc1BEc1VUVmhLYnM2a25DcU9hT2hwWkxXSWxoSk1sMFIrNFV0?=
 =?utf-8?B?bjJoOC9ScFVPYU1NSVQwN2M0d0g1U21HT3hleUpHVStuaXRjengza0RjV2sv?=
 =?utf-8?B?WUUxQnZCMUdTNi9HRjJVZkhWb1VEYXdJeW8weVg0b0crQktUUUNDbktudUxj?=
 =?utf-8?B?ZDhXZTdIb1dneXlKTjdRZkhmbkZSeUVQUXBhZmlzSFhYTUhoTXlsMUV3ZE82?=
 =?utf-8?B?MVpJYk1zdDZpWW5mMXRoWmV1bVRWVzVPNWQ2TjJya2NSL2lmYUNhbWhUUURZ?=
 =?utf-8?B?Z1J6NFhFdkZwMFk1Q1huUmVNbDF1MGdwYXZXUUpIekE0NWM4dkgxcllzVUZO?=
 =?utf-8?B?bDR0SEk3eC9RaWhhaUtWT0VCZCsrL2xWZFoybG8wdDVyVmVZV29tVEhYVWll?=
 =?utf-8?B?aGJsaG5ncUVka0ZUZ3U4ZEx3cnBZLzB6YWhGRFJXVGN2RzRyZXBFL0hZSmt3?=
 =?utf-8?B?eWY2UkxzTkp4empJa3U1V0o2QnBtcVJkTlp6UzRzNU5ONUltSVNCY2IrMFZV?=
 =?utf-8?B?T2ZDVit4YmJSdC8xWjB1Z012VE5QNUtMQ2djWnRDa1ZNZzFYNFdrQVNGRUFh?=
 =?utf-8?B?TjJTQ0VnWnNXNERlV1VSOGRjOSt5Nys0UkFwWjh6eGhPTWdqbjZKNUNlR2Ju?=
 =?utf-8?B?dWw5akd2MjRYQ1FCM0NobVAra0NkUE9mMDBsMVdoWm8zc3Q0VmF3VUZBdThv?=
 =?utf-8?B?cUo4bG9HKzQ3Yzh3dE5ZT3NjSTY3K0dkUHp1MVhXSDdOdFYyRzY4TGc3YWVV?=
 =?utf-8?B?dnpkQWc4QzBUcHFGR0h5ak8xZlhZYjQyb0JrMnM5ZTJEMXUwb2tOSVcvMnBK?=
 =?utf-8?B?eDRrQmp5TmRza0J5SDdoUklGMDZlT3gxTDdONDVBN0FmN2RrY0wwRWxkaTh2?=
 =?utf-8?B?UjdGbnBLNm1LRGNnZ1ZQSUZLTzRrRmdFdWVEWUs5SUFVN3FzTXRUU2VhRXBE?=
 =?utf-8?B?a3dHZzV4RDBzZnROQXFrQmhKaXg5SjFqTkp0Q3pSNzB4ZG5JY0dzdnp6WWlL?=
 =?utf-8?B?WHFsbjNVUTVFRC9ycDJUcWR2UmJ1ODFxaXcyb0xpWmtaTHhLaVUwKzk5Q3Z5?=
 =?utf-8?B?czdaS0dYaXNjSTNTN0g0Q2EwaFIwV3VZSHNBL0hsTXFMNC8wb0VRamFmeXlF?=
 =?utf-8?B?SStPc3lhY2NQUzBjS0hMd1d2VklZTFBtMVE0VmRMc3dPc3haUVdJN2hHMW1B?=
 =?utf-8?B?enZwbmx0MTFxTGMwZzVvcG54NW1wZERlaFFvL1dBWXRYd3NRRmlJUjZOejd4?=
 =?utf-8?B?Y0RrOU94aGgxQmZoOVVHTXV4MXg3UEtiWm9VY0JYTXNuUWpsV1ZKYWVpVVJE?=
 =?utf-8?Q?7wfE1zdLSDID93jybFc2SXSc/KJrXc6vkPX8f5NuKt5H?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B82DDDCA575C484DBCD654DC29529049@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e58c2f3-a890-4c6f-5cf6-08da85d7598b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 13:48:39.2646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PrMxSl+P6s9Mg9vYl/FStJO0rgR35RwHEXjJcxvEKGejaV8EAhHzewHVCaD9kPXpRk9GpGsnAnNBtGP4hSE7dQifIA4GMHbjNlOHlJ9jMlPxteL8CkJMlzgEhsEiwROt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6299
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIyLTA4LTIzIGF0IDEzOjMxICswMzAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IAo+IE9uIDIzLzA4LzIwMjIgMTc6NTYsIFRoYXJ1biBLdW1hciBQIHdyb3RlOgo+ID4g
TWljcm9jaGlwIFBDSTFYWFhYIGlzIGFuIHVubWFuYWdlZCBQQ0llMy4xYSBTd2l0Y2ggZm9yIENv
bnN1bWVyLAo+ID4gSW5kdXN0cmlhbCBhbmQgQXV0b21vdGl2ZSBhcHBsaWNhdGlvbnMuIFRoaXMg
c3dpdGNoIGhhcyBtdWx0aXBsZQo+ID4gZG93bnN0cmVhbSBwb3J0cy4gSW4gb25lIG9mIHRoZSBT
d2l0Y2gncyBEb3duc3RyZWFtIHBvcnQsIHRoZXJlCj4gPiBpcyBhIG11bHRpZnVuY3Rpb24gZW5k
cG9pbnQgZm9yIHBlcmlwaGVyYWxzIHdoaWNoIGluY2x1ZGVzIGFuIEkyQwo+ID4gaG9zdCBjb250
cm9sbGVyLiBUaGUgSTJDIGZ1bmN0aW9uIGluIHRoZSBlbmRwb2ludCBvcGVyYXRlcyBhdCAxMDBL
SHosCj4gPiA0MDBLSHogYW5kIDEgTUh6IGFuZCBoYXMgYnVmZmVyIGRlcHRoIG9mIDEyOCBieXRl
cy4KPiA+IFRoaXMgcGF0Y2ggcHJvdmlkZXMgdGhlIEkyQyBjb250cm9sbGVyIGRyaXZlciBmb3Ig
dGhlIEkyQyBlbmRwb2ludAo+ID4gb2YgdGhlIHN3aXRjaC4KPiAKPiAoLi4uKQo+IAo+ID4gK3N0
YXRpYyBpbnQgcGNpMXh4eHhfaTJjX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ID4gK3sK
PiA+ICvCoMKgwqDCoCBzdHJ1Y3QgcGNpMXh4eHhfaTJjICppMmMgPSBkZXZfZ2V0X2RydmRhdGEo
ZGV2KTsKPiA+ICvCoMKgwqDCoCBzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2
KTsKPiA+ICvCoMKgwqDCoCB1MzIgcmVndmFsOwo+ID4gKwo+ID4gK8KgwqDCoMKgIGkyY19tYXJr
X2FkYXB0ZXJfc3VzcGVuZGVkKCZpMmMtPmFkYXApOwo+ID4gKwo+ID4gK8KgwqDCoMKgIHdoaWxl
ICgoaTJjLT5pMmNfeGZlcl9pbl9wcm9ncmVzcykpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG1zbGVlcCgyMCk7Cj4gPiArCj4gPiArwqDCoMKgwqAgcGNpMXh4eHhfaTJjX2NvbmZpZ19o
aWdoX2xldmVsX2ludHIoaTJjLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNNQkFMRVJU
X1dBS0VfSU5UUl9NQVNLLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRydWUpOwo+ID4g
Kwo+ID4gK8KgwqDCoMKgIC8qRW5hYmxlIHRoZSBQRVJTVF9ESVMgYml0IHRvIG1hc2sgdGhlIFBF
UlNUIGZyb20KPiA+ICvCoMKgwqDCoMKgICpyZXNldHRpbmcgdGhlIGNvcmUgcmVncwo+ID4gK8Kg
wqDCoMKgwqAgKi8KPiAKPiBVc2UgTGludXggY29kaW5nIHN0eWxlIGNvbW1lbnRzLiBFdmVyeXdo
ZXJlLi4uCgpPa2F5LiBJIHdpbGwgZml4IExpbnV4IGNvZGluZyBzdHlsZSBmb3IgY29tbWVudHMg
dGhyb3VnaG91dCB0aGUgZmlsZSBpbiB1cGNvbWluZwpwYXRjaC4KCj4gKC4uLikKPiAKPiA+ICsK
PiA+ICtzdGF0aWMgaW50IHBjaTF4eHh4X2kyY19wcm9iZV9wY2koc3RydWN0IHBjaV9kZXYgKnBk
ZXYsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpCj4gPiArewo+ID4g
K8KgwqDCoMKgIHN0cnVjdCBwY2kxeHh4eF9pMmMgKmkyYzsKPiA+ICvCoMKgwqDCoCBpbnQgcmV0
Owo+ID4gKwo+ID4gK8KgwqDCoMKgIGkyYyA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXpl
b2YoKmkyYyksIEdGUF9LRVJORUwpOwo+ID4gK8KgwqDCoMKgIGlmICghaTJjKQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPiA+ICsKPiA+ICvCoMKgwqDCoCBw
Y2lfc2V0X2RydmRhdGEocGRldiwgaTJjKTsKPiA+ICsKPiA+ICvCoMKgwqDCoCBpMmMtPmkyY194
ZmVyX2luX3Byb2dyZXNzID0gZmFsc2U7Cj4gPiArCj4gPiArwqDCoMKgwqAgcmV0ID0gcGNpbV9l
bmFibGVfZGV2aWNlKHBkZXYpOwo+ID4gK8KgwqDCoMKgIGlmIChyZXQpCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4gPiArCj4gPiArwqDCoMKgwqAgcGNpX3NldF9t
YXN0ZXIocGRldik7Cj4gPiArCj4gPiArwqDCoMKgwqAgLyogd2UgYXJlIGdldHRpbmcgdGhlIGJh
c2UgYWRkcmVzcyBvZiB0aGUgU01CIGNvcmUuIFNNQiBjb3JlIHVzZXMKPiA+ICvCoMKgwqDCoMKg
ICogQkFSMCBhbmQgMzJLIGlzIHRoZSBzaXplIGhlcmUgcGNpX3Jlc291cmNlX2xlbiByZXR1cm5z
IDMySyBieQo+ID4gK8KgwqDCoMKgwqAgKiByZWFkaW5nIEJBUjAKPiA+ICvCoMKgwqDCoMKgICov
Cj4gPiArCj4gPiArwqDCoMKgwqAgcmV0ID0gcGNpbV9pb21hcF9yZWdpb25zKHBkZXYsIEJJVCgw
KSwgcGNpX25hbWUocGRldikpOwo+ID4gK8KgwqDCoMKgIGlmIChyZXQgPCAwKQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPiA+ICsKPiA+ICvCoMKgwqDCoCBp
MmMtPmkyY19iYXNlID0gcGNpbV9pb21hcF90YWJsZShwZGV2KVswXTsKPiA+ICsKPiA+ICvCoMKg
wqDCoCBpbml0X2NvbXBsZXRpb24oJmkyYy0+aTJjX3hmZXJfZG9uZSk7Cj4gPiArCj4gPiArwqDC
oMKgwqAgcGNpMXh4eHhfaTJjX2luaXQoaTJjKTsKPiA+ICsKPiA+ICvCoMKgwqDCoCBkZXZfaW5m
bygmcGRldi0+ZGV2LCAiaTJjIGNsb2NrIGZyZXE6ICVkXG4iLCBpMmMtPmZyZXEpOwo+IAo+IFRo
YXQncyBub3QgYSBoZWxwZnVsIHByaW50LiBEb24ndCBwb2xsdXRlIGRtZXNnLgoKSSB3aWxsIHJl
bW92ZSB0aGlzIHByaW50Cgo+ID4gKwo+ID4gK8KgwqDCoMKgIHJldCA9IHBjaV9hbGxvY19pcnFf
dmVjdG9ycyhwZGV2LCAxLCAxLCBQQ0lfSVJRX0FMTF9UWVBFUyk7Cj4gPiArwqDCoMKgwqAgaWYg
KHJldCA8IDApCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4gPiAr
Cj4gPiArwqDCoMKgwqAgLypSZWdpc3RlciB0aGUgaXNyLiB3ZSBhcmUgbm90IHVzaW5nIGFueSBp
c3IgZmxhZ3MgaGVyZS4qLwo+IAo+IFVzZSBMaW51eCBjb2Rpbmcgc3R5bGUgY29tbWVudHMuIEV2
ZXJ5d2hlcmUuLi4KCk9rYXkKCj4gPiArwqDCoMKgwqAgcmV0ID0gZGV2bV9yZXF1ZXN0X2lycSgm
cGRldi0+ZGV2LCBwY2lfaXJxX3ZlY3RvcihwZGV2LCAwKSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGNpMXh4eHhfaTJjX2lzciwg
UENJMVhYWFhfSVJRX0ZMQUdTLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwY2lfbmFtZShwZGV2KSwgaTJjKTsKPiA+ICvCoMKgwqDC
oCBpZiAocmV0KQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9mcmVlX3Jl
Z2lvbjsKPiA+ICsKPiA+ICvCoMKgwqDCoCBpMmMtPmFkYXAgPSBwY2kxeHh4eF9pMmNfb3BzOwo+
ID4gK8KgwqDCoMKgIGkyYy0+YWRhcC5jbGFzcyA9IEkyQ19DTEFTU19TUEQ7Cj4gPiArwqDCoMKg
wqAgaTJjLT5hZGFwLmRldi5wYXJlbnQgPSAmcGRldi0+ZGV2Owo+ID4gKwo+ID4gK8KgwqDCoMKg
IHNucHJpbnRmKGkyYy0+YWRhcC5uYW1lLCBzaXplb2YoaTJjLT5hZGFwLm5hbWUpLAo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJNQ0hQIFBDSTF4eHh4IGkyYyBhZGFwdGVyIGF0ICVz
IiwgcGNpX25hbWUocGRldikpOwo+ID4gKwo+ID4gK8KgwqDCoMKgIGkyY19zZXRfYWRhcGRhdGEo
JmkyYy0+YWRhcCwgaTJjKTsKPiA+ICsKPiA+ICvCoMKgwqDCoCByZXQgPSBpMmNfYWRkX2FkYXB0
ZXIoJmkyYy0+YWRhcCk7Cj4gPiArwqDCoMKgwqAgaWYgKHJldCkgewo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkZXZfZXJyKCZwZGV2LT5kZXYsICJpMmMgYWRkIGFkYXB0ZXIgZmFpbGVk
ID0gJWRcbiIsIHJldCk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBjaTF4eHh4X2ky
Y19zaHV0ZG93bihpMmMpOwo+IAo+IFdoeSBkbyB5b3UgY2FsbCBoZXJlIHBjaTF4eHh4X2kyY19z
aHV0ZG93bigpIGJ1dCBub3QgaW4gcHJldmlvdXMgZXJyb3IgcGF0aD8KCnBjaTF4eHh4X2kyY19z
aHV0ZG93biBBUEkgd2lsbCByZXNldCB0aGUgcmVnaXN0ZXJzIHRoYXQgYXJlIHNldCBhcyBwYXJ0
IG9mCnBjaTF4eHh4X2kyY19pbml0IEFQSS4gSSB3aWxsIHVwZGF0ZSB0aGlzIEFQSSBhbmQgYWxz
byBpbmNsdWRlIHRoaXMgQVBJIGluCmZhaWx1cmUgY2FzZSBvZiBwY2lfYWxsb2NfaXJxX3ZlY3Rv
cnMgYXMgd2VsbCBhcyBkZXZtX3JlcXVlc3RfaXJxCgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBnb3RvIGVycl9mcmVlX3JlZ2lvbjsKPiA+ICvCoMKgwqDCoCB9Cj4gPiArCj4gPiArwqDC
oMKgwqAgcmV0dXJuIDA7Cj4gPiArCj4gPiArZXJyX2ZyZWVfcmVnaW9uOgo+ID4gK8KgwqDCoMKg
IHBjaV9mcmVlX2lycV92ZWN0b3JzKHBkZXYpOwo+ID4gK8KgwqDCoMKgIHJldHVybiByZXQ7Cj4g
PiArfQo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIHBjaTF4eHh4X2kyY19yZW1vdmVfcGNpKHN0cnVj
dCBwY2lfZGV2ICpwZGV2KQo+ID4gK3sKPiA+ICvCoMKgwqDCoCBzdHJ1Y3QgcGNpMXh4eHhfaTJj
ICppMmMgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7Cj4gCj4gTm8gbmVlZCBmb3IgcGNpX2ZyZWVf
aXJxX3ZlY3RvcnMoKT8KPiAKCkkgd2lsbCBhZGQgdGhpcyBBUEkgaW4gcGNpMXh4eHhfaTJjX3Jl
bW92ZV9wY2kKCj4gPiArCj4gPiArwqDCoMKgwqAgaTJjX2RlbF9hZGFwdGVyKCZpMmMtPmFkYXAp
Owo+ID4gK8KgwqDCoMKgIHBjaTF4eHh4X2kyY19zaHV0ZG93bihpMmMpOwo+ID4gK30KPiA+ICsK
ClRoYW5rIHlvdSwKVGhhcnVuIEt1bWFyIFAK
