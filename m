Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0380A4D44DD
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Mar 2022 11:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231927AbiCJKnX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Mar 2022 05:43:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239955AbiCJKnW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Mar 2022 05:43:22 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F031A13913F;
        Thu, 10 Mar 2022 02:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646908943; x=1678444943;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=lclP4UbR0h8cLZvVH6kTKhw57KPUVvijM7cfeTS1SnQ=;
  b=A76G94sJoZOKibgnJwkeXTHtm7n7XrBv2++0lgB0nVcBlOqR7vsbPLdG
   9Mp1mEb6pkqA8hRtMdRQRi2ou6GpHuYbIxVD0Nnl+TLYCSF0IlaK6X/9K
   K0Iqo2tOKxV9o1FZ6DvByQ16XHyuTVFU+SegKmDlR7NXxLEg5yaHnKiDC
   q5525B6J8/10HS5kS2MwrEXWuXVVAicJIxo41YQNt8Onpkth+HWETcLB0
   z5fiwOXkxENZQ5oATjNF2FZVmvUwX6Hbs3jbRN1L9EszlWXUtEAm2GwWf
   n5OCbt/c//722Tu2chdVYNzpnWcE/GVSjdtUinCTLGn/lFYJeLYgZCM4R
   g==;
X-IronPort-AV: E=Sophos;i="5.90,170,1643698800"; 
   d="scan'208";a="155952798"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Mar 2022 03:42:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 10 Mar 2022 03:42:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 10 Mar 2022 03:42:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOnI4MsvqjvNCDUY7iqwhDG3mmo+eJWK9WBpR0TX2IFD9Pk4bL3EbvMwS2TTFaj3fLglNGPuHwUC2ZU8CRwe+moycNozqJlHmVjOWJUGDKDI1Y/c96nAijXpcULHIcfGIXaCNfi9e6JbXkg9NJsgRunynO0PeGcTExNwetOCzA4TTV+jEC0s+Glhv6dYHeW3nDHDbzKiB5ls+hyrAOHkdyayC95PbczgY/QmrT7XPnNb6t0FHUOiTF2MaJ2ij8Ujv18LsejJemx/ckz2XzHzfdBSX+nq27jNmkrksDaEpYRNzlBR2jljPyrJeYz8Dy9ta8bTnmOYjkfRNGbPwGl3IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lclP4UbR0h8cLZvVH6kTKhw57KPUVvijM7cfeTS1SnQ=;
 b=i/aT5pJe9axFSbwV90gkcGViq0lYw10BsDHTfI3bk/GHzNIJCmmqvbX4yDSwttedu9p69aaSAJmjCwDy7H0urwcvwFiAZGgnCa3n2y93PMfYfFRtJRk3F3IdrhXcyd1fmI4Ctk7QFzogx+4bTu9zZdkA9ffKJVYOms1SwIJv9/r1KluZDyjvcVMg0SRKUCMjSdLInp7V2P0CplWlD3OWNIn/bM30Jv/xk1npkTmOKnaXr0xk/wvvmO+CjaOD99EhP1VPyrW6njszJX95f3sNCO5+itW6FkFIuMCoRA9YpgDDfu2HXRjwiWpRVMCIPbFWu/IVU4pxtbDg46ZiNhZ6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lclP4UbR0h8cLZvVH6kTKhw57KPUVvijM7cfeTS1SnQ=;
 b=TaBDekujGDj1PwSyVGFHOgwVkpnLAbnCNSWUdT7DbfC4lr0+tkwgmgC50QrPyca1M9usXy9sPwpBCn/d3Ev019CG7QXyM1KMBr2POjvhEVuYv5BpFRQ14Zg2NXn27vq7F/nFw8KzHI9Te6adIq4t3j5MpPGR1hTh1/7GMlonvTM=
Received: from BYAPR11MB2758.namprd11.prod.outlook.com (2603:10b6:a02:c9::11)
 by MWHPR11MB1438.namprd11.prod.outlook.com (2603:10b6:301:8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Thu, 10 Mar
 2022 10:42:17 +0000
Received: from BYAPR11MB2758.namprd11.prod.outlook.com
 ([fe80::381d:1e0a:2ec0:38b6]) by BYAPR11MB2758.namprd11.prod.outlook.com
 ([fe80::381d:1e0a:2ec0:38b6%4]) with mapi id 15.20.5038.029; Thu, 10 Mar 2022
 10:42:17 +0000
From:   <Sergiu.Moga@microchip.com>
To:     <krzysztof.kozlowski@canonical.com>, <robh+dt@kernel.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Claudiu.Beznea@microchip.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: i2c: at91: Add SAMA7G5 compatible
 strings list
Thread-Topic: [PATCH 3/3] dt-bindings: i2c: at91: Add SAMA7G5 compatible
 strings list
Thread-Index: AQHYM65L8ZyyYTo+lEiQ+hhjbimmO6y4N/WAgAA3tIA=
Date:   Thu, 10 Mar 2022 10:42:17 +0000
Message-ID: <8f4cc7ad-6ce2-2c78-dab4-759d05761a64@microchip.com>
References: <20220309120714.51393-1-sergiu.moga@microchip.com>
 <20220309120714.51393-4-sergiu.moga@microchip.com>
 <d6886c55-6f4a-916f-20fd-9f6465a8a0cd@canonical.com>
In-Reply-To: <d6886c55-6f4a-916f-20fd-9f6465a8a0cd@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab635bc8-9eb9-4417-0584-08da0282a5e1
x-ms-traffictypediagnostic: MWHPR11MB1438:EE_
x-microsoft-antispam-prvs: <MWHPR11MB14380530C2B10863072B0783E80B9@MWHPR11MB1438.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TXH69mQEjp3eOkFeKKJ71KCNdMMiF9Y7XHe/DY7gFPkFvX813xHZAuT3hpJV0Ic4I2fjUKSk1kuereNARN0y1jci3co+3VeMK1mvPrRXweCMM9VISKhAGAfe6BVlEVBOBxa0sAZnhEduBwNKxXfTzHTQPuFrwwJX7ylG8rR1pZ9nEBHhvbBHxV2uFD2JF4h4/a9Wkdf9yWuR4Iwj+l2fMC0n6ENkmO6X4LrazVzBtDtJ/JwTmKtrM76OxMA1ysDtyjivnjS+D2NOfzrIsv93+83srPzT0NrJzhtalyI8/DecHwh1FwKbqolV+9E63cohV5Nnhuff4GCRjOjmNEUlQIm1c/jlogPycQo5AzwSoTKPQ1vCJ+rMNYVEqcIMqPs/vZkcZXj5Aukv6H+XJ70ZmKxoSppVG6+wO0yDQCR+SU5+S7dX3YgluT35P9NhkMsgNDPgvW+qo9bjCVgZDpicK06raEzrueRrMEd6GZkwMnfkQdnlD9BWi4dOrtRMrU/BAVfReW6ptooOoMWTkWw06Y7CGlbR3EV/7zvofyL3LClk0OXpcEvmBSE0ZG3r7eCaP98jLc86fYVx+EjQaAaY6K1hQrHZl/AAzljQXaASdXgUovoYRaT5RLToINVYrH48UugWe87w1enuL5lumYEAjMWE86tveeTQtenC4wKDSUXgtLXUf4hpro3YxvkFB91Sgz0AV3G8MrUjw/tiyJDcPRNPHGxcGJCDEp6LqSMib50SoEgXZmtTsTDDjEfySW5D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2758.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6636002)(66476007)(66556008)(64756008)(316002)(76116006)(66446008)(91956017)(66946007)(54906003)(122000001)(71200400001)(4326008)(5660300002)(8676002)(6486002)(83380400001)(38070700005)(31696002)(31686004)(26005)(110136005)(2616005)(86362001)(8936002)(38100700002)(6506007)(36756003)(6512007)(508600001)(53546011)(2906002)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tmt1TURVWjRmUDJvYUdvUjZvSmxlWGcxZWkxa2dSZUtIbkRUZWxCczJvQkt3?=
 =?utf-8?B?eDBYQU9TckZBS2dxV0tVancrTmcwcnF5Q1FnZldDbU1tNDBDL00zVTlZTzlE?=
 =?utf-8?B?YXpibFlERVBpcnh0YWw5U2Y4aCtSbUhUK0lTejJLbllnVlBsek9FeGRoZEVF?=
 =?utf-8?B?Zlo2QkJoQWk4Qlp4T0xMZ0l4aC9IVFA3OFBxNzFwUWlWNUlLTGJmck5Cd3lX?=
 =?utf-8?B?NTVhR25ycUREUVdaa2dtVWMycForazVJNjNyS25OZ0xHUG90Uy9tMmVtVVFZ?=
 =?utf-8?B?Wk5oU2o5Q2ZuVFJ4Nko5anRic01wWDhuRUd3R1J5NzJJWktLcDBHQkN1anN1?=
 =?utf-8?B?WlFEOXR6ZFZqOXRWblNObkhXUlFjdXFFOFhIYk5pQlZ5Nk9lZVNydmZybE5x?=
 =?utf-8?B?a3NsQXg3b09MWEh6VkJ6WTlsaFhrcHV3eVVyL2pLQW5xMUVvMlR2RUhYNXBM?=
 =?utf-8?B?YkJJK09tRThGT1FNaXlpbk5Ca3RXdGYwWDVKMUNSU1UwL1VRT29scTYrV3Nr?=
 =?utf-8?B?VnhUN1VMUmlBbVZGeTNubXZrK3RyUUZJMkhOcTA1RVh5aG5iMDdGeHRoZkJo?=
 =?utf-8?B?cm9CMXVIdDFiZmVEMnFmVlpWell0NzlZZlVQaHdnTnJoQW9JNXhaUjFYV1dT?=
 =?utf-8?B?OUhPSmxUcUtMT214TkI0UkRlUnZYTmlUSk0vU1RHNy9mNzRQRElZQzkvWVRy?=
 =?utf-8?B?cndyRlRFMTNoa2ttNlhxQjRWUGlmcFJPSGRQRU1wc1NuTC9RZFBzSVJKYW1O?=
 =?utf-8?B?N3MzRG1vQW10M2ZTKzhBOFR6eTA0SDZGbmlGTVVzb0ZhYzA2VDU3TThFSE1U?=
 =?utf-8?B?dTl5OEFmRGl6RW1MQzc5RFYraTVZdlhyTjgrNjJ3Z242VzlIc3h3MHl6eHcr?=
 =?utf-8?B?SVBVTlpFVUFmaG9Pc2tPa0pEUnh4WXQ5czd2bDFYM1J4d0U4VDYyR3ZkdU9q?=
 =?utf-8?B?MC9FV1F0Y0Q2TjJMNDZ3THAvZSttQ2dvRHJWaVoyWkZnMUhvSXhMbklQbEh6?=
 =?utf-8?B?aUl4Tjg5NFBiSUF4aFh0SzdQb0JZZU5QRFVxZzc4Rmc1cDVIaDdBZXEyVWlY?=
 =?utf-8?B?R2VIbWNvTmNKWDZiNUo2UFdGVnl1NGxDREphMUx1Vnp4ZjdoM1dqTnFROTZo?=
 =?utf-8?B?dkFZKzNpWDZOTGZOeGRSa0VlR2xOTWtaVDV4R3RDZ05XYTc4bWF1MXdBeldY?=
 =?utf-8?B?NDNOTUc0WTVuZjRnUWpyVXVXUGpVSjFmemp4RzlrY0t0dm5mdTdDOERSN3dm?=
 =?utf-8?B?dFNOZllrbVBwaWkwaTh6UnF5VTZFTEk0bWphNVpLTWEyT1dLckhGaEM0MzV3?=
 =?utf-8?B?eGk0U0F0NnpCNFc5VkpRZ2VmYStqV2VRanlxOU5SNG5aSzJNeExta3EwTzlR?=
 =?utf-8?B?U3pYMnJjZ2lRTTh0OVJEV2pEQ3pTQUx0cnBrQVJLMVRJMkdFQnpVNmlTalRp?=
 =?utf-8?B?bTNjenpydDJLNXFZRENVQUp6U0puRTY4eHROakFPaVY3UW1Lb1hKa0hMNzd2?=
 =?utf-8?B?TXI2UDhXYTRSYVduejd1UVhvSjhzTmYxcEhjWFJ6aHlzQkhhWmtOUXQxYWZj?=
 =?utf-8?B?WDAxMVZ2S2UvaVo2SFRPRCt0RXQvelFHdzVydlYzYmJMQXJ6Q1ZjTk5CNWhu?=
 =?utf-8?B?TVZMQ3hCTG9tUU1ZWjRmdUxWOUUyZ0Vzak8vdUE4WnRPVWQxUnhqd2QwWjcr?=
 =?utf-8?B?b1BsNHhkaU5sZDFXb1g1dmJpQ0F4M2s3YUhwam9xRW9ROE5FVDNrY2NNSHFM?=
 =?utf-8?B?RkFLemo3VGYyN2ZXTVdsN2tpTVFCRlhjS3BrMmc5cTMxTjF0VVpmZWI2ei9V?=
 =?utf-8?B?MndnV1VWNGZVRFg3YzUvOEhMT0NVSWN2SGRCb2p3NEpremQ4bllSbTVXT2sx?=
 =?utf-8?B?QmFjcVVJUXRwbzdjeThadkZ0MjQ3WnN1MDhobWk5VVpLR1Fud3B5K1BKUmNl?=
 =?utf-8?B?WVdWK1c4bEpqMDI2VnA2dm5BN0hGYUdpcVBmSTBXUHREajE2VHA4bVVremFZ?=
 =?utf-8?B?N0hCd25YTlpYc2xrNmc1bnhRUmNxVy81a243TjRMNkwzSHR6VHo0T0JWNFFo?=
 =?utf-8?B?RXpRSnRjdnMzaW9TVjRxU1h1TkVOWjlhdC85NHVlM0VNRTR6RWZVSHhCd01K?=
 =?utf-8?B?dlRxZ1NhdDMycmN3UzFPQ3pJT2FoV3RPdzAyamU4Z3ZrUE5yQm8wTW5pSEF1?=
 =?utf-8?Q?5uNxqeCxPbdYi2zrriRAmCryF7Y0nzpbUNFmu7CkHnzd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7AAD93ABC27AE4C860EDC4256C7C312@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab635bc8-9eb9-4417-0584-08da0282a5e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 10:42:17.7400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IOMtj2StX3RVRTDKd7yyjzmiGXZu/LaGXzVOE8l74nOYyxnNj7XWVT518k+oAUPIoJmkitoRQv7Xlr7HBY3hqXm1k+k0bm4o19c6tBEp/7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1438
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTAuMDMuMjAyMiAwOToyMiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gMDkv
MDMvMjAyMiAxMzowNywgU2VyZ2l1IE1vZ2Egd3JvdGU6DQo+PiBBZGQgY29tcGF0aWJsZSBzdHJp
bmdzIGxpc3QgZm9yIFNBTUE3RzUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU2VyZ2l1IE1vZ2Eg
PHNlcmdpdS5tb2dhQG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+ICAgLi4uL2JpbmRpbmdzL2ky
Yy9hdG1lbCxhdDkxc2FtLWkyYy55YW1sICAgICAgIHwgMzggKysrKysrKysrKysrLS0tLS0tLQ0K
Pj4gICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMv
YXRtZWwsYXQ5MXNhbS1pMmMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pMmMvYXRtZWwsYXQ5MXNhbS1pMmMueWFtbA0KPj4gaW5kZXggZDRhYWRiYmQxYTExLi42NjFh
Njc5Yjk4Y2YgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaTJjL2F0bWVsLGF0OTFzYW0taTJjLnlhbWwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9pMmMvYXRtZWwsYXQ5MXNhbS1pMmMueWFtbA0KPj4gQEAgLTE2LDEw
ICsxNiwxNSBAQCBhbGxPZjoNCj4+ICAgICAgICAgcHJvcGVydGllczoNCj4+ICAgICAgICAgICBj
b21wYXRpYmxlOg0KPj4gICAgICAgICAgICAgY29udGFpbnM6DQo+PiAtICAgICAgICAgICAgZW51
bToNCj4+IC0gICAgICAgICAgICAgIC0gYXRtZWwsc2FtYTVkNC1pMmMNCj4+IC0gICAgICAgICAg
ICAgIC0gYXRtZWwsc2FtYTVkMi1pMmMNCj4+IC0gICAgICAgICAgICAgIC0gbWljcm9jaGlwLHNh
bTl4NjAtaTJjDQo+PiArICAgICAgICAgICAgb25lT2Y6DQo+PiArICAgICAgICAgICAgICAtIGl0
ZW1zOg0KPj4gKyAgICAgICAgICAgICAgICAgIC0gZW51bToNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgLSBhdG1lbCxzYW1hNWQ0LWkyYw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAtIGF0
bWVsLHNhbWE1ZDItaTJjDQo+PiArICAgICAgICAgICAgICAgICAgICAgIC0gbWljcm9jaGlwLHNh
bTl4NjAtaTJjDQo+PiArICAgICAgICAgICAgICAtIGl0ZW1zOg0KPj4gKyAgICAgICAgICAgICAg
ICAgIC0gY29uc3Q6IG1pY3JvY2hpcCxzYW1hN2c1LWkyYw0KPj4gKyAgICAgICAgICAgICAgICAg
IC0gY29uc3Q6IG1pY3JvY2hpcCxzYW05eDYwLWkyYw0KPiBUaGlzIGxvb2tzIG5vdCBuZWVkZWQs
IGJlY2F1c2UgaXQgY29udGFpbnMgbWljcm9jaGlwLHNhbTl4NjAtaTJjIHdoaWNoDQo+IGlzIG1l
bnRpb25lZCBlYXJsaWVyLg0KPg0KSG1tLCBJIG1pZ2h0IGhhdmUgbWlzdW5kZXJzdG9vZCB0aGUg
ZnVuY3Rpb25hbGl0eS4gSSB0aG91Z2h0IGl0IHdvdWxkIGJlIA0Kc3RyaWN0ZXIsIGhhdmluZyB0
byBtYXRjaCBhbGwgdGhlIHN0cmluZ3Mgb2YgdGhhdCBjb21wYXRpYmxlLiBJIGd1ZXNzIA0Kc29t
ZXRoaW5nIGxpa2UgdGhpcyBzaG91bGQgYmUgZW5vdWdoIHRoZW4/DQogwqDCoMKgwqDCoMKgwqDC
oMKgwqAgb25lT2Y6DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVtOg0KIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhdG1lbCxzYW1hNWQ0LWkyYw0KIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhdG1lbCxzYW1hNWQyLWkyYw0KIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBtaWNyb2NoaXAsc2FtOXg2MC1pMmMNCiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbWljcm9jaGlwLHNhbWE3ZzUtaTIN
Cg0KSnVzdCBhZGRpbmcgdGhlIHNhbWE3ZzUgY29tcGF0aWJsZSBzZWVtcyB0byBwYXNzIHRoZSBj
aGVjayBvbiBteSBlbmQuDQo+PiAgICAgICB0aGVuOg0KPj4gICAgICAgICBwcm9wZXJ0aWVzOg0K
Pj4gICAgICAgICAgIGkyYy1zZGEtaG9sZC10aW1lLW5zOg0KPj4gQEAgLTI5LDE2ICszNCwyMSBA
QCBhbGxPZjoNCj4+DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNClRoYW5rIHlvdSBm
b3IgdGhlIGZlZWRiYWNrLg0KDQpTZXJnaXUuDQoNCg==
