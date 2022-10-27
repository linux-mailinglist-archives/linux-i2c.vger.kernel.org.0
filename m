Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9673560EF8F
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Oct 2022 07:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbiJ0Fkb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Oct 2022 01:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233884AbiJ0Fk3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Oct 2022 01:40:29 -0400
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (mail-fr2deu01on2133.outbound.protection.outlook.com [40.107.135.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1203444A0;
        Wed, 26 Oct 2022 22:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6r+szxF6eHAiDcDta/N56fEhVbPRHkL8k1mTAdY1Y/tnSxMEkETbpY2zsX1SsBAfPSrUAZhiN8TzREMZpE3uvRXNiWswgpVxUjt/oAYCIeIKqRYs6rALQ0eNvD2lmrOdMsN6KU3oVLx4dHyMOlFlPOpXkAiQrfsmsKsk5u7NheRf8O5Q/4wF8QRjUVbROTqu1y4LchVX8ntScQb/2hX44nNFHXvx2i9cBfQAX2jwaaO9QY5IB+tduOfiCqzFRp9DInVnvKImll2SwphIoSYAWt0lqSwT8hBN5kGy7tV+4wIfjdF4tcVGF2v/ut7rWcoDdlzDES1SO+8a29h8f5t0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KU8Qir6YKtHFybAXzCL7M2Oeea8l0+w7qE8qyEBAF8=;
 b=f2AbssJUpj6vKQrOXdV4ssGnPEXc+G+LZJTkexrHgFiW5ySFxn93KzIBEqt9G4wsjVKx14zm1Kbd/8d1KTeDBL+P209Cb3ydf0jeNFJDAyT7LfGf9737JcxUeOpjlwfY9mE0O7g5A5X/BcT/H66jgDxAicvErYW2pQwBpaBe670oInr7mk4X0YADI0ZiMJxr4bUJMkyeg/UeR+fYmEYBUadvRH0L05h2QeQr0lOqkDZtZXtiq+J38mNU2zNVtzmM231sHHAVOVPyviGABxZ5Ml5HwVWMvmae5psb1a+zR/SKQCx4wAWhmuccPaAuMnz2GQT7oYVHaKDx6rADBIWM3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductor.onmicrosoft.com;
 s=selector2-rohmsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KU8Qir6YKtHFybAXzCL7M2Oeea8l0+w7qE8qyEBAF8=;
 b=tgRe2m6G2nmuyEnFsCsxPmU4UxrvkRdNhWZas3C8NzQy+AqqfEnYsl273kgs3WEcgRmC49h4J28sTDGifwMlDMVYL/h03LcWgGrPD+6T1wKKEtoJGSnPqHwdhG0H3v//0cOprJ4bcL7HOWP8AjHyiqHtskpH58YF2xQhVWSVkTA=
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:59::10)
 by BE1P281MB1588.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:1b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 05:40:20 +0000
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::bec6:d44:3d5f:317e]) by BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::bec6:d44:3d5f:317e%7]) with mapi id 15.20.5769.013; Thu, 27 Oct 2022
 05:40:20 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
CC:     Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "jdelvare@suse.de" <jdelvare@suse.de>
Subject: Re: [PATCH v2 2/2] i2c: i2c-smbus: fwnode_irq_get_byname() return
 value fix
Thread-Topic: [PATCH v2 2/2] i2c: i2c-smbus: fwnode_irq_get_byname() return
 value fix
Thread-Index: AQHY6IQ0xgSEEJWZ1EWKRbVV0zX+nK4fTQ2AgAJvHgA=
Date:   Thu, 27 Oct 2022 05:40:20 +0000
Message-ID: <4bf2c0bf-27bf-f4d1-f72a-0f82c53f650c@fi.rohmeurope.com>
References: <cover.1666710197.git.mazziesaccount@gmail.com>
 <fbd52f5f5253b382b8d7b3e8046134de29f965b8.1666710197.git.mazziesaccount@gmail.com>
 <Y1gPDyS2ck90pDF1@smile.fi.intel.com>
In-Reply-To: <Y1gPDyS2ck90pDF1@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BEZP281MB2454:EE_|BE1P281MB1588:EE_
x-ms-office365-filtering-correlation-id: 286ef130-dd45-4d87-88c6-08dab7ddbc88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R5pCzIca97+qoW00CFuA3I+vGaL9biXf9hzo74riAwl0qGNudkqljmmSEReytlDaZTVlukdzRa4GlFnkf73rKsfUgyeLzvx4BfDgQ1p0pOtuwdPINHwt+E1SE8exY4DhEJfuAGS41AOddGROaeucHpVTLmT62JLC19F3FoaOtMmNNwjRkNvi4ugpZUX6jr7wZOnzz9NlhFdT11P1jgdS/RbjZKTYlNdrJ8NyXy6OvZ1OsM5Ha0I73A/SO+zNjXpFjYqPrDIoFjFESZl3xI61tR1O3i/g+Ie8d5jMS0R9h0IlkuTuFxZ7R9gtiCX43o1afj9CbzdDbIdXRAZW+uW3KLMZ9zKRrJTWIzwzD/QHG6kX+vNwr3Ls2kiD6zbohUfkTjOYgfbdGe/+AhC2A12w1UoJ3cQXfgTBLYFDld20prcVPCqqo3lr0YlmlnK8t5x6pC4XPXBd8RO5QTwJlZl/X+0BjyBwAdlLpogXpzlyZIPNuYjFGbUIU7hrrEkq2znDz/HUVJNGQgd/Kjk90+9nbEc08GeIozEPn8WGu7YRo0fSHbgGHouVveUlWNmZy7QAx+/KiSEbZ8d3ext3dM9nWu6f8rdVVd2qFf3KteGpYmNx1MDFCousnTurdtjOfynwfMkf78VceqKovCcay4ssRx3oar2gLoRXyzzJaL2dF3MWytJ080hJF4rJ58lMIcK2TDfN6rw66iATwn12T++s7Q32pX0EB1vwaZAC/fDhIhs83vh6Jz56YzqbgFMjxqnTyoVCziALj00qpSA+CBcSKSKFMjlx+w2Tl6SSA3Povcl2ZZBMhtTgA6Tv43YlNkfDUft5F//W2luIfTq9ufq6KQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39850400004)(366004)(396003)(451199015)(8676002)(31696002)(71200400001)(83380400001)(31686004)(478600001)(6486002)(66946007)(64756008)(76116006)(41300700001)(5660300002)(8936002)(91956017)(66446008)(66556008)(66476007)(7416002)(2616005)(186003)(316002)(6512007)(53546011)(2906002)(4326008)(54906003)(6506007)(110136005)(38100700002)(86362001)(122000001)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmNBS2NWT28zSDhqRWlUT1d0RkNIQXRUTithM1pNR2pkWkF6cVh5Z1BldEpB?=
 =?utf-8?B?bnkvUk1TMFVSWk81MnJKQjNvaUc5M0w4S081cGZNR1hzMU9VdTY2eXVXZlo4?=
 =?utf-8?B?amYzM1J5TmVTRnZvNEhSVk1zWFNzMkVHaE5tRHFOa29FWGdOcmI0blR6VW0v?=
 =?utf-8?B?V3FWaWJNdXZVaTZWc0lncnBmclNMbVpZdGlQUnYzSXNVVnBTRno3Q29aSVpq?=
 =?utf-8?B?OFlLU2xpMUNoSFpUYzFVVWJGV0hvZmQ5eUlDcWdyQ0Q4ajhjYzRXdEtxRWVE?=
 =?utf-8?B?dGtBNGRUeXYyWC9lbnIzQzZ5VnkxNGorT21hOENuNDFXLzFxMk9MVnR3MnRp?=
 =?utf-8?B?Wk9YSkI1eDNEZ203ekVoT2xleHlLcG9kZzFiR3FNVERueHFuS3Q4eUFUaUE5?=
 =?utf-8?B?eWUzdVpYaTkwVkZsaHBWd2NVK2lKalFZeVlrbDVQSU5HOEdwV0R1MzJoYjgr?=
 =?utf-8?B?SHFuT0hHREQ4QUhVY2hUY1FsUTdzaWcrZUl4bWNkL2VaWks1bHBiNDdWZ3pD?=
 =?utf-8?B?ZzgzYTdpcEdzWGdEMWpEUkFVQldoM1VBSG1zdEZEUXdGSW10NUhENXExU0U5?=
 =?utf-8?B?b0JTYkUrWi9DU2lyQTJFN2VxYkdMb0lYQ0h5cXFqUk5VMkhuRWdTQnYxMVU1?=
 =?utf-8?B?bXBWbHd1bHNrZFh6d1dGV3d4TENZaW1tU0VqRW1UeDJmbDh2dEFjTUppYldK?=
 =?utf-8?B?MDR6OWpUemtqMDl3d1B2QmN5alI4U0NFMTUwc0tRMjNTQ0Qxd0VEMnUzN2hs?=
 =?utf-8?B?c1pNRFR3REpqOGMzVkMydFhmS1hBS3dqc2hmc1ZhWHh5QjFnSFBCSjBHdWlG?=
 =?utf-8?B?MXBmaVBxTDIvYjhTUUphZDNjODVzcC9LWkp0S2xDTXZiOUpLazNKb3BqczdC?=
 =?utf-8?B?bFgweUdISmkwUlJZWjNwUGVmKy9wTmxsdzRUakFpbFNZKzk4S2F5Ujdjb3RI?=
 =?utf-8?B?SjZCVDFWd3FCQW9RenV1b0RXNTFoY3dEMnk0SkpUT2ZOdGpTTm04WWJ1WnQ5?=
 =?utf-8?B?ZGd5L1pqbXdzeEhJMzhJM2JjNWxjSGo0SFp1dFFEWmZmNTFzOXRsbDE0dWs5?=
 =?utf-8?B?ay96STYrLzJPVGVTUU9PUzV5SXlJblZzS1ZPcFYvNmMrckU2VjhTSXVveE9y?=
 =?utf-8?B?QVhQanFySUlwV1JBelhhRk9iV2M5d0VQd0tEYU1DMXI5WGNSeUFBTWI1Q3Fv?=
 =?utf-8?B?L1p2M3QvcmV1ZmRsNkdCalRXUk1Cc1l4aGdiYURoYkg2cDcxQzg5NTJWWGNv?=
 =?utf-8?B?YldRcXVJczI2NDVwd0NJSXFFT3hPd1dvRU4xcVpPNU5wcUNkdkxKbHpGdEV4?=
 =?utf-8?B?dzV3QWhTUGRYbHJlODhiOWhueUVtSTMwdWNCM0NNK0dOYnlpeUdocmZQZmZF?=
 =?utf-8?B?ZEZhKzdCMEx2c1lMdG1oT1hIeWNFTm52STJQY05yUnkzU0haNkpJckZTeTVj?=
 =?utf-8?B?Vkd2WWF0WDBYTXppOE1PY1F4SWJLcis5SHJ6dkhUTGpzY0R1bFoxYTlsUnJx?=
 =?utf-8?B?UnlRUmg2ZitNZU5tbzREclNQSkxvV25iaEJid09iNUo0Q3huMkttb0x6RG15?=
 =?utf-8?B?QUVpcml2dGkxaStGcUE4MGtvWmRmTXdhdyszU1ZjQXVMMmt2aDRBaS81c0x6?=
 =?utf-8?B?RWMvNG10YmxFRUtST0NidC91YStLQ0ZCOVVXMUp0M2czaFBvNXBiRnFSZXo2?=
 =?utf-8?B?S2l1WHQ2YUtDL21SZU51TU9PRHdJdkhLTW0yQXpycWdTWmZrenpud3pxM0h5?=
 =?utf-8?B?TU9vSndQOGdERUhOVTE3OTBkQ3lKalBvWDZQVmlmbDdxM2YzaFF1ZFNoWVpL?=
 =?utf-8?B?OEQ1THd5T0twY0dGRWQvaEVlQTdSSjBSRVd4dWs1czBzckllZmQ0dE5TS3pP?=
 =?utf-8?B?amtscmRzWVF1alVJN2RxSm1EQjBkcENRbW9ISTRSRVU3NkxaOVM0RDFkWEZr?=
 =?utf-8?B?MHc5Ukc4cnJtemQzVnRIQ21JeVJmYVlONW9vMWpCZy9hYkZEMnhZMjBvT1Np?=
 =?utf-8?B?TzZ1dE5VVDdUc3QxVVVMWTFnbFdSei9lQ2t4Q3pYRXZUWjBFZGNHU002LzBV?=
 =?utf-8?B?V2s0RExBdm9sQnA0NVhWQWpiTDhhZ051SUlCVWpYbkNjcTNUQTYvQWtlZFpw?=
 =?utf-8?B?ZElScXZPMDh5WXRjZk5vcGZtMkNBT1pEd1VNMWRxVk9RRjkyMHlGSFh5Wm4z?=
 =?utf-8?Q?KhYBNh333+Jsv42NWT+m6aQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF95D9CA6A42B946A4AF1DE8BD3CCD0D@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 286ef130-dd45-4d87-88c6-08dab7ddbc88
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2022 05:40:20.4753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b24d4f96-5b40-44b1-ac2e-2ed7fdbde1c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JA+eqbMrzQZEyeoxlrO9ZKw1Vn6bAziDNVekRZTiUeub34wLM660TeNJksAtEG6vLpwuE2norgKVtF8kR6peQUWo/LYh3e8Tkr/sbMHO0aXpLQywh0tFSgDRkTp16VPK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB1588
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTAvMjUvMjIgMTk6MzAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gT24gVHVlLCBPY3Qg
MjUsIDIwMjIgYXQgMDY6MTI6MTFQTSArMDMwMCwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0KPj4g
VGhlIGZ3bm9kZV9pcnFfZ2V0X2J5bmFtZSgpIHdhcyBjaGFuZ2VkIHRvIG5vdCByZXR1cm4gMCB1
cG9uIGZhaWx1cmUgc28NCj4+IHJldHVybiB2YWx1ZSBjaGVjayBjYW4gYmUgYWRqdXN0ZWQgdG8g
cmVmbGVjdCB0aGUgY2hhbmdlLg0KPiANCj4gLi4uDQo+IA0KPj4gRGVwZW5kcyBvbiB0aGUgbWVu
dGlvbmVkIHJldHVybiB2YWx1ZSBjaGFuZ2Ugd2hpY2ggaXMgaW4gcGF0Y2ggMS8yLiBUaGUNCj4+
IHJldHVybiB2YWx1ZSBjaGFuZ2UgZG9lcyBhbHNvIGNhdXNlIGEgZnVuY3Rpb25hbCBjaGFuZ2Ug
aGVyZS4gRWcuIHdoZW4NCj4+IElSUSBtYXBwaW5nIGZhaWxzLCB0aGUgZndub2RlX2lycV9nZXRf
YnluYW1lKCkgbm8gbG9uZ2VyIHJldHVybnMgemVyby4NCj4+IFRoaXMgd2lsbCBjYXVzZSBhbHNv
IHRoZSBwcm9iZSBoZXJlIHRvIHJldHVybiBub256ZXJvIGZhaWx1cmUuIEkgZ3Vlc3MNCj4+IHRo
aXMgaXMgZGVzaXJlZCBiZWhhdmlvdXIuDQo+IA0KPiBUaGUgZW50aXJlIGVycm9yIGhhbmRsaW5n
IHRoZXJlIGxvb2tzIHN1c3BpY2lvdXMuDQo+IA0KPiBUaGUgJ3N0cnVjdCBpMmNfc21idXNfYWxl
cnRfc2V0dXAnIGRlc2NyaXB0aW9uIHNheXM6DQo+IA0KPiAgICJJZiBpcnEgaXMgbm90IHNwZWNp
ZmllZCwgdGhlIHNtYnVzX2FsZXJ0IGRyaXZlciBkb2Vzbid0IHRha2UgY2FyZSBvZg0KPiAgICBp
bnRlcnJ1cHQgaGFuZGxpbmcuIEluIHRoYXQgY2FzZSBpdCBpcyB1cCB0byB0aGUgSTJDIGJ1cyBk
cml2ZXIgdG8NCj4gICAgZWl0aGVyIGhhbmRsZSB0aGUgaW50ZXJydXB0cyBvciB0byBwb2xsIGZv
ciBhbGVydHMuIg0KPiANCj4gU28sIHRoZSBxdWVzdGlvbiBpcywgc2hvdWxkbid0IHdlIGp1c3Qg
ZHJvcCB0aGUgY2hlY2sgY29tcGxldGVseT8NCg0KSSBkb24ndCByZWFsbHkga25vdyB3aGF0IHRo
aXMgbWVhbnMuIERvZXMgaXQgbWVhbiB0aGF0IGlmIElSUSBpcyBub3QgDQpwcm92aWRlZCwgdGhl
IGRyaXZlciBuZWVkcyB0byB0YWtlIGNhcmUgb2YgYWxlcnRzIChpbiB3aGljaCBjYXNlIHRoZSAN
CmNoZWNrIGhlcmUgaXMgdmVyeSB2YWxpZCBiZWNhdXNlIElSUSBpcyByZXF1aXJlZCBmb3Igc21i
dXNfYWxlcnQgDQpkcml2ZXIpLiBPciBkb2VzIGl0IG1lYW4gdGhhdCBvbmx5IHRoZSBJUlEgaGFu
ZGxpbmcgaXMgb21pdHRlZCB3aGlsZSB0aGUgDQpzbWJ1c19hbGVydCBkcml2ZXIgc2hvdWxkIGRv
IGFsbCB0aGUgb3RoZXIgc3R1ZmYgKHdoYXQgZXZlciB0aGF0IGlzKSBhcyANCnVzdWFsLiBJbiB0
aGlzIGNhc2UgdGhpcyBjaGVjayBpbmRlZWQgZmVlbHMgd3JvbmcuDQoNCkkgd291bGQgYXBwcmVj
aWF0ZSBzb21lb25lIHdpdGggbW9yZSBpbnNpZ2h0IHRvIHRoaXMgZHJpdmVyIHRvIHRha2UgYSAN
Cmxvb2sgYXQgaXQuDQoNCllvdXJzDQoJLS0gTWF0dGkNCg0KLS0gDQpNYXR0aSBWYWl0dGluZW4N
CkxpbnV4IGtlcm5lbCBkZXZlbG9wZXIgYXQgUk9ITSBTZW1pY29uZHVjdG9ycw0KT3VsdSBGaW5s
YW5kDQoNCn5+IFdoZW4gdGhpbmdzIGdvIHV0dGVybHkgd3JvbmcgdmltIHVzZXJzIGNhbiBhbHdh
eXMgdHlwZSA6aGVscCEgfn4NCg0K
