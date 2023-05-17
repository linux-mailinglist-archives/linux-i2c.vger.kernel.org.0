Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFA3B70646E
	for <lists+linux-i2c@lfdr.de>; Wed, 17 May 2023 11:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbjEQJn7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 May 2023 05:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjEQJn6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 May 2023 05:43:58 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A60B35FDE
        for <linux-i2c@vger.kernel.org>; Wed, 17 May 2023 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684316614; x=1715852614;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yYiQ5+n85VQ8snjxxS+6Q0xVAVvbyVFW1KO00XjjlTg=;
  b=tV80MM8sUrDu7UNUWM+Jj6kkOpYnsKgQHS0skxzDeO1VnSqkycILKwRN
   OCBOtJ9fGjr372X62wQKOD80rQdPtkawfWWDukn2RYBLUWYYJlaQlorhZ
   jwDRrSI3yDNuVAtZflRaiyBD/K/f5sDeubw2fS6kXZ1osHvg8gM/BnbEl
   maU9GyoNhgrQG1CcCkCe19YV0JlNuv8JWTahkrSr53K8sdwF1e42IZn/e
   RRBxPOREcCg0hBYOjR1VKumobyyjpDqiEJkuwnYc4FDNFwcTun5ze3dhe
   2ZDRP+7XVHYp+3UU/d3hmn/0IowYL/lkN3FSF3Djg2sJ4Q53Cd9neR/kB
   w==;
X-IronPort-AV: E=Sophos;i="5.99,281,1677567600"; 
   d="scan'208";a="152505959"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 May 2023 02:43:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 17 May 2023 02:43:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 17 May 2023 02:43:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kM6g1YFxamuxBgRHoRTzuIZtIvGItUBhNBiSgwvG10hdAdiEA42Qs56HbwojhSdElrb/sUOxHj9QrqcahbIQfoKRUjEyVHV+/tMm+qnR5+lqXtRUycKLY85BSsGRahQUMjMpyB8pMQyOnK/rrTZsnEkFQLyQLODKsw7TPZtEB2WDye4fYeOpo5c72d6ANwoSK2kBAENuawOyF/zqx0677rDMw+sRY1kOJFeYm8HtoXK5VC+h2Z3eKr2hUITFVLjAJrb6GeTp4DJnb6+0F3D0HOI8BqNMTDVZT7Nb3n7cIGFYrqB1Q64dABPtyNC/PNruWzuZTR46f/p9LL5TX+WSlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYiQ5+n85VQ8snjxxS+6Q0xVAVvbyVFW1KO00XjjlTg=;
 b=HNmvFU2T7JP0D3hCno+n7EliWBgUxIxT5En+uV3vwhmmzGHt0wU6wLqawYMwFOwKmiDce349TbPxvV7apBPmLInPHZEFBl9hGVoEDUC6cDIyaoRNEkVZmzauMNBJ63TiBhR6KRfEnX+05sasVypA/Xvx+nm7s2PIglMpZi936mCROEWqiL6TxwE9N+2OeyvgSKrDL+5JUxA40iPeq0ay8jZQ+bAWZytSYsFVcRfnh+2jbIwAElRqlAqFbFjuptar0a4l4CmNQ6rzrNoFP7Iuf17rEquYZqRh6YkxrtYvov2yEkVRLwo9jibZtJ/pXhTuBq8V73a16K+uWne2yzYx9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYiQ5+n85VQ8snjxxS+6Q0xVAVvbyVFW1KO00XjjlTg=;
 b=lnVUnjbUwrHe8+ziKjBiOMoiS4+zgOoGfBFl1s27WAz8q9PQ0sGeb2N3BC3hmbz8gtbcooybwsxIeWTjBN2AyMv+5WhNPzepT1t+DasaM0yK9quXglHcjDIHeRccg1dOGftFQxplB6WN0kbxnvy1TJVnEyJNU4mgKJ2ZSmskJ1c=
Received: from PH7PR11MB5958.namprd11.prod.outlook.com (2603:10b6:510:1e1::22)
 by PH7PR11MB8009.namprd11.prod.outlook.com (2603:10b6:510:248::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.27; Wed, 17 May
 2023 09:43:14 +0000
Received: from PH7PR11MB5958.namprd11.prod.outlook.com
 ([fe80::41a4:2b46:c89c:18d0]) by PH7PR11MB5958.namprd11.prod.outlook.com
 ([fe80::41a4:2b46:c89c:18d0%7]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 09:43:14 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <horms@kernel.org>, <wsa@kernel.org>
CC:     <nathan@kernel.org>, <llvm@lists.linux.dev>,
        <ndesaulniers@google.com>, <linux-i2c@vger.kernel.org>,
        <UNGLinuxDriver@microchip.com>, <trix@redhat.com>
Subject: Re: [PATCH] i2c: mchp-pci1xxxx: Avoid cast to incompatible function
 type
Thread-Topic: [PATCH] i2c: mchp-pci1xxxx: Avoid cast to incompatible function
 type
Thread-Index: AQHZgzuEaRaArubQBUKgGnjXS8o88a9eQdaA
Date:   Wed, 17 May 2023 09:43:13 +0000
Message-ID: <19245527f9821f09f9a85cfde760265a8ec5bdbe.camel@microchip.com>
References: <20230510-i2c-mchp-pci1xxxx-function-cast-v1-1-3ba4459114c4@kernel.org>
In-Reply-To: <20230510-i2c-mchp-pci1xxxx-function-cast-v1-1-3ba4459114c4@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5958:EE_|PH7PR11MB8009:EE_
x-ms-office365-filtering-correlation-id: a3417972-850e-4642-750b-08db56bb224e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VQd7LMoW6E33IEzo7DW7SRGJztAh02tkt4Pt5/O+24F8gFeKzmNErD2NxWIzCNwJnQ2/nm/1bOhuQf0ywd7r+rcxI2nTkgvUxOOuRyGO+QQKtkSNcrUfnBL448izUi/LiqoY3zaZs2fumCpFzHinPTnzJosRR+QdzQEeqTpCQ8pP+pWFp+QRWnJure87WgvbDqeArGiTK/Pl9c5+ePIcMRtnMn9P3a6k9OkbtNwF4mrNdaD6fE0zYRGMj6G4zmUStILxOiU8kKKllSh6yItziT2JeSvy/J/tYsNhd7jW+HrPljZXBfCW+6u6smGHD/3sTPoHITk6eG+HW5SPF7WAbTugYLrZ5twtIE8s4hCmZQWwgm3UZgJo98zdZBjZZ5WYzOZu/whZqjBSU4LCvDrOCEdwi2Oe1yFoJFSuEdO9TNhoQX64mcPZFeRj7ir8PMq5KZAwVUMKq9VTNtmW146Oi5tJyixUFhOnU3p5V2k4Hoja7GUOpaaZX1hGTifr4X91kEDxw3KgGFeTFWX8vAKzNBgH74mWyJtrNnGj3E5gA3U1put0tqj+21zGKM/3vZ2n5tcv4ckdAAwWq5Qv8D7k8pDXJ5lF6LlQ9MohwhC/zgwU8R27Q1cf8yDKQLSMpOxW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5958.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199021)(6506007)(26005)(122000001)(6512007)(41300700001)(83380400001)(71200400001)(186003)(2616005)(6486002)(54906003)(110136005)(478600001)(66556008)(66476007)(4326008)(66946007)(64756008)(66446008)(316002)(76116006)(5660300002)(2906002)(8676002)(36756003)(8936002)(38070700005)(86362001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2pTT1lRL21uWmFxVXpCaVVxSlEvcUFlWWtqOERaZXB4YnZNOXRnbEJ0U0dE?=
 =?utf-8?B?RXBaSmlsRlNrdkQwM21hWW15aUhFTldUbC9qOGs3aFBGK0FxandtRm56bjRK?=
 =?utf-8?B?OUlRd0pOWTNRTlVKL1ZFeTNLZkNYSUJ5Q3V0Q0xneGVyWTJzOTdYM040a3BU?=
 =?utf-8?B?VUlOZWZiNDFHZU5pMU5xWkxUNFgxMzRoVnp0RW0yMXNvaEpDQWVoNGI5VU1t?=
 =?utf-8?B?cnBZbXpHUi8rYVB2UkE5YmdoRWFqK0xjbG1CSnhWRk5sMCtBS1plc29INC9o?=
 =?utf-8?B?ZlV4OGxxT3B6N0Z5bG1peUU3OXBlR1FHNFRnUUt1MXJQRlJJZHk3c2JTYm05?=
 =?utf-8?B?VWZzOVZsd0k4V3JMYVJGSGxQQXdHdFlacWRXTFl4d0dZclBXKzlFZk5tM3pL?=
 =?utf-8?B?NWQ3RjVYc1NqeW5HSW1nU2hlcVRwSC9IbmprbHg0cEdiMGh3bHorK3lLTmFR?=
 =?utf-8?B?djZIeitOUmZ2YjMvRXJHTWdKKzlVTTYyZFM1WDBpdWdTanBlR3dqM1FyVENv?=
 =?utf-8?B?bVVyNWd4UXYwQW8rN0JPdmRNK3YxcDk0VkkyOVBLR2drZWdGRWZkcUN2K2Vh?=
 =?utf-8?B?d1pxd2VLL1J4Nkd6YmpONXg3K1VhcUxsdFpvUno4RnQ4ZHhEQjVCZVkvSUI5?=
 =?utf-8?B?SFo4bm1BZ082RGQ2YW5OaXl2NDFFd0NINmlxQmR1OWYyMzcyYzdhdUFyRkV2?=
 =?utf-8?B?RjFRc3l5Zkd2LzBkYjJGSmorMU0wN0xwVVdHYVFJSzdYRktMZENEY1NlTVRy?=
 =?utf-8?B?UjhtanZuNm53UGNFRUh5SHpnQks0VS9JZ0tTZ3lud21ubmxJM1QvUzVLVkI3?=
 =?utf-8?B?VEFDOXMyUTdoUEFYdmRNVTdMZUVNWDlTNnF4cFBlb2F5aWY2QW1LU1IydlMy?=
 =?utf-8?B?UHZRYTZaWm1BV1h4bXZSY1VoM2w5RjNtNkVJTHhrSU9LNHFHSGdRTVkyeTRK?=
 =?utf-8?B?Qmx6Rno0enF2L1l1OFp5MFhzZWZsdUxGNWhhWitVT2svSzIzYjVpaHBqc2g4?=
 =?utf-8?B?L1dURmorNWNtbFlEWkNibWt6YXJObDlVVytQc3pFNlVpdkRBRHpML3hITGVW?=
 =?utf-8?B?ekFNMjRrT1FZdTY4bE1XZEtDZnU1SWNCMEZ2U2hDVmdjZW9SSGdBeFY5a0pG?=
 =?utf-8?B?QUhyQlNvaWh2eGMxcU1OWVl6cFlGUjQ1bVJEVDZpVno2RFZzYVJqUjJ4VzU2?=
 =?utf-8?B?bVB0S3VoaG92bVgybzBCTU5lZjFVRjNhSUpncjhPL3NDTHZReitjUithenh2?=
 =?utf-8?B?MEp6V2JxTGdxT0pGeVo2Vi85OUlzUGlyR1hCTERFbVJzZjA3WFJlNThiTDVi?=
 =?utf-8?B?WWNxUzZBdTUvSzlBemluZDZYL05QbzNKb0doR2hxaHFwYmNCSDkxZjRscElN?=
 =?utf-8?B?bHF6T1BDZ1ZIVUlpTFk3UzNZMHlXUmcySE1PU0VLV1Vzb0tmQTZJSk9mWEVi?=
 =?utf-8?B?Z1p1cE5GSDJ0Snp1NmtKSUZwZDN4V1Y5VFVKeENKaVZTNG9pS0pDQUd1YUNs?=
 =?utf-8?B?MmZPbmVVRE5oNnBObWxTdHBna212ZWNGQyt4MTlCbW9VOER3WExpWmRSV0NU?=
 =?utf-8?B?WlhjakFHVUNIWDkwVG1OdkZtcmlGYko4cVFOakdPR1hGdUtodUw3OFY4RkpJ?=
 =?utf-8?B?aXdES1hTYTF5V2xjdmRrVWF4V3pha3pseGxRcXBPeG1vY2I4ZFZXQzFILyta?=
 =?utf-8?B?ZWZuVnRvdEpmMlVmbmJadEJzbUw0TzkxSDZHZ1NZajdJbVhaV2ROTmN1N01F?=
 =?utf-8?B?U1dJNmVxRHVZSDVJWTdpTFZOTXd1MEptRXhHeXBQQWlvQnUyWDRVaEliRTYz?=
 =?utf-8?B?dnM2SUpDZW14UFVmeWpmanc2YmRuV08rRDUvbHl1L2NuSVNocEpnZTFBQThI?=
 =?utf-8?B?NHB0YllNdnZhMDI1MEV6SkQvUGdmWUNnMGFjcFN6RUxNblZKWHFzOGtXWWly?=
 =?utf-8?B?QUlNbXdjMlZHVVNXQkxiQWZVSk9DeE0zenU3NWhhbWpkMDc2aWUwUUpmaURK?=
 =?utf-8?B?SVNvY1JmSUljTk9DcWpzL0tDaFZBSlVNN05ackthUVNHOUdRVk40cVErbS90?=
 =?utf-8?B?MUlaU0QxazVwYWlJclNFZWtpU0FscFZFeTdjUXE3TksxblBkYWh3ejBFZDlx?=
 =?utf-8?B?TUo0UVYvdkpVS2lnY1VWNjBFSWZnTnNNZHJNMFdqMi9BcERpUTMwN2xrK3Zz?=
 =?utf-8?Q?4uL+ChozjUQqNQfhJhiYfWc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6657997317DAB44D84BD1F557C990D8E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3417972-850e-4642-750b-08db56bb224e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 09:43:13.6979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /AaAsrFJDkdWEODm3AdCZ19Fedqro/MCfmDirdQMVKAaVVo5w5+EH0qupus5gqGhuLU8BIBCkqRVfcDBTPMFhHWO94k5vmsg87qBXY2+eriyxB27rIE6DSot02K9PMI7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8009
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gV2VkLCAyMDIzLTA1LTEwIGF0IDE0OjMyICswMjAwLCBTaW1vbiBIb3JtYW4gd3JvdGU6DQo+
IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91DQo+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gUmF0aGVyIHRoYW4g
Y2FzdGluZyBwY2kxeHh4eF9pMmNfc2h1dGRvd24gdG8gYW4gaW5jb21wYXRpYmxlIGZ1bmN0aW9u
DQo+IHR5cGUsDQo+IHVwZGF0ZSB0aGUgdHlwZSB0byBtYXRjaCB0aGF0IGV4cGVjdGVkIGJ5IF9f
ZGV2bV9hZGRfYWN0aW9uLg0KPiANCj4gUmVwb3J0ZWQgYnkgY2xhbmctMTYgd2l0aCBXLTE6DQo+
IA0KPiDCoC4uLi9pMmMtbWNocC1wY2kxeHh4eC5jOjExNTk6Mjk6IGVycm9yOiBjYXN0IGZyb20g
J3ZvaWQgKCopKHN0cnVjdA0KPiBwY2kxeHh4eF9pMmMgKiknIHRvICd2b2lkICgqKSh2b2lkICop
JyBjb252ZXJ0cyB0byBpbmNvbXBhdGlibGUNCj4gZnVuY3Rpb24gdHlwZSBbLVdlcnJvciwtV2Nh
c3QtZnVuY3Rpb24tdHlwZS1zdHJpY3RdDQo+IMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gZGV2bV9h
ZGRfYWN0aW9uKGRldiwgKHZvaWQgKCopKHZvaWQNCj4gKikpcGNpMXh4eHhfaTJjX3NodXRkb3du
LCBpMmMpOw0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgDQo+IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fg0KPiDCoC4vaW5jbHVkZS9saW51eC9kZXZpY2UuaDoyNTE6Mjk6IG5vdGU6IGV4
cGFuZGVkIGZyb20gbWFjcm8NCj4gJ2Rldm1fYWRkX2FjdGlvbicNCj4gwqDCoMKgwqDCoMKgwqDC
oCBfX2Rldm1fYWRkX2FjdGlvbihyZWxlYXNlLCBhY3Rpb24sIGRhdGEsICNhY3Rpb24pDQo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIF5+fn5+fg0KPiANCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuDQo+
IENvbXBpbGUgdGVzdGVkIG9ubHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBIb3JtYW4g
PGhvcm1zQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbWNo
cC1wY2kxeHh4eC5jIHwgNiArKysrLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtbWNocC1wY2kxeHh4eC5jDQo+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tY2hwLXBj
aTF4eHh4LmMNCj4gaW5kZXggYjIxZmZkNmRmOTI3Li41ZWYxMzZjM2VjYjEgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbWNocC1wY2kxeHh4eC5jDQo+ICsrKyBiL2RyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtbWNocC1wY2kxeHh4eC5jDQo+IEBAIC0xMTE4LDggKzExMTgsMTAg
QEAgc3RhdGljIGludCBwY2kxeHh4eF9pMmNfcmVzdW1lKHN0cnVjdCBkZXZpY2UNCj4gKmRldikN
Cj4gwqBzdGF0aWMgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTKHBjaTF4eHh4X2kyY19wbV9vcHMs
DQo+IHBjaTF4eHh4X2kyY19zdXNwZW5kLA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcGNpMXh4eHhfaTJjX3Jlc3VtZSk7DQo+IA0KPiAtc3RhdGlj
IHZvaWQgcGNpMXh4eHhfaTJjX3NodXRkb3duKHN0cnVjdCBwY2kxeHh4eF9pMmMgKmkyYykNCj4g
K3N0YXRpYyB2b2lkIHBjaTF4eHh4X2kyY19zaHV0ZG93bih2b2lkICpkYXRhKQ0KPiDCoHsNCj4g
K8KgwqDCoMKgwqDCoCBzdHJ1Y3QgcGNpMXh4eHhfaTJjICppMmMgPSBkYXRhOw0KPiArDQo+IMKg
wqDCoMKgwqDCoMKgIHBjaTF4eHh4X2kyY19jb25maWdfcGFkY3RybChpMmMsIGZhbHNlKTsNCj4g
wqDCoMKgwqDCoMKgwqAgcGNpMXh4eHhfaTJjX2NvbmZpZ3VyZV9jb3JlX3JlZyhpMmMsIGZhbHNl
KTsNCj4gwqB9DQo+IEBAIC0xMTU2LDcgKzExNTgsNyBAQCBzdGF0aWMgaW50IHBjaTF4eHh4X2ky
Y19wcm9iZV9wY2koc3RydWN0DQo+IHBjaV9kZXYgKnBkZXYsDQo+IMKgwqDCoMKgwqDCoMKgIGlu
aXRfY29tcGxldGlvbigmaTJjLT5pMmNfeGZlcl9kb25lKTsNCj4gwqDCoMKgwqDCoMKgwqAgcGNp
MXh4eHhfaTJjX2luaXQoaTJjKTsNCj4gDQo+IC3CoMKgwqDCoMKgwqAgcmV0ID0gZGV2bV9hZGRf
YWN0aW9uKGRldiwgKHZvaWQgKCopKHZvaWQNCj4gKikpcGNpMXh4eHhfaTJjX3NodXRkb3duLCBp
MmMpOw0KPiArwqDCoMKgwqDCoMKgIHJldCA9IGRldm1fYWRkX2FjdGlvbihkZXYsIHBjaTF4eHh4
X2kyY19zaHV0ZG93biwgaTJjKTsNCj4gwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+IA0KPiANCg0KUmV2aWV3ZWQt
Ynk6IFRoYXJ1biBLdW1hciBQPHRoYXJ1bmt1bWFyLnBhc3VtYXJ0aGlAbWljcm9jaGlwLmNvbT4N
Cg0KLS0tDQp3aXRoIEJlc3QgUmVnYXJkcywNClRoYXJ1biBLdW1hciBQDQo=
