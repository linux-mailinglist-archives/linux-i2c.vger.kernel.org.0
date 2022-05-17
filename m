Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB99152A2E2
	for <lists+linux-i2c@lfdr.de>; Tue, 17 May 2022 15:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235371AbiEQNMb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 May 2022 09:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347936AbiEQNLf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 May 2022 09:11:35 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434E13A194;
        Tue, 17 May 2022 06:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1652793094; x=1684329094;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=lrRGFnIbLbTxqxGx4EJs2OpybKMdguGM/opGcFdkEKU=;
  b=EnNbI9U5kbpTsLUQGmPXszjfW3/KtlspyLJ4t2uWRojfR96bIzAssVQ7
   AkxEN8qKUVw3RW0hlK2e3CxTpBmSt6ErVwsd8fRwkVr3rIZ+Ak5G+cyQZ
   K/U72jFRn8gsgvU2CH6COLtsQg9LY5FVo1VylW0X+bk73hyiAkalFDRTq
   hhaUGlW6XHSDLJq1p9o8lI8OAzMoxtvXTzqN9gQYqNXEWhvwSCaTeF/x7
   9KUCiZieCKjbrn7+ZwNV9LMtKAs8RV2o4DIXr+8YEPy+qSbecw0gv6Tez
   7cbLV3+6bUn3znNlTDQCN1wXmt52jagJPZti6ry2CSbgDYJPEyLjBmdvV
   g==;
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; 
   d="scan'208";a="96132326"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 May 2022 06:11:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 17 May 2022 06:11:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 17 May 2022 06:11:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAz0ciqowIsXMff/F2pbuEf1+ipmoIeXfXa0OBwK/gjZq7v9qs+QXiF0sTZCW8oA2OkY4tS0PdGeaeTbwSO8DHzvs+Y1kouXSRxrvSj883em4I5ZfnrQiwiWh8z6hzM9EReXhoD/HAhLgzPMTKAuep/y6sz2qIgkJd8826iSiO6jRSiHo3Kt2CtvzBYhFuAMu7QrBpltIHRi36ltzC+UghtWzySnrOfuFC4eC6IEmJxlB26blwzqAu8ucpRqDVlpBMhGNJQnuPSx2x5f3d62qSasRDI1H7hkeX4DhNA8hSXV7xqsYTSEuLdD5MUjfCRiIi6EXJAXwqfnA2MIpFO8LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrRGFnIbLbTxqxGx4EJs2OpybKMdguGM/opGcFdkEKU=;
 b=ZqDs9YU5xk5L8UDN4+Yv3Us87B7ZVHE8eqRc/h7URUXsDPr/qTTf1CF0ur959tNOV5JXK+gxOAwzgqZoJYP/Yf0BGt710LsKh9nxScxRLosDhSaIktdUXA2Dageqtbq5YboGlOvS0aFHaZ1629jJ6ELxvkr4hsVpbxBNaJ2Snrwcgzg3bklTLNi/ps62WVjhJ7i0tyEGGjQJdRb2LQm1Er08PGms74uMQjYh2F3YbxnyQ8UkrEQabpCwCRakuV7kRSM/9KEi8k6STCPtvoZl9PpO+yaxRjCQaQX8AgAM+/yrdw+3aeY8Ka+ugnNfvSoK87UwSqixKq8vyfEeoYn1KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrRGFnIbLbTxqxGx4EJs2OpybKMdguGM/opGcFdkEKU=;
 b=HuU2wph0qBhQ2ShNLTW24rudUtIkQArdjqloSOKfwYtIljwD84sOJhk3EGPS4rvuIXQyWpuiXuSK76EEQZ5kvpmf552x7TjrmYFH8sHO30GsAqOjQbQhw1yBbSWwhc3XqABCEeE4xAMLs5JyT2ooX8XqJuH1ZguhqxF1k6rCNXs=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 BN6PR11MB1732.namprd11.prod.outlook.com (2603:10b6:404:102::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.18; Tue, 17 May 2022 13:11:22 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::5bf:6242:720a:9a19]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::5bf:6242:720a:9a19%6]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 13:11:22 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <u.kleine-koenig@pengutronix.de>
CC:     <alexandre.belloni@bootlin.com>, <Nicolas.Ferre@microchip.com>,
        <linux-crypto@vger.kernel.org>, <kernel@pengutronix.de>,
        <Claudiu.Beznea@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <ard.biesheuvel@linaro.org>
Subject: Re: Bug in atmel-ecc driver
Thread-Topic: Bug in atmel-ecc driver
Thread-Index: AQHYae+akCCRK5V0z0iTJJ8OxLa+hw==
Date:   Tue, 17 May 2022 13:11:22 +0000
Message-ID: <99a8c7b0-ca73-25a2-f839-9a96cc0989e4@microchip.com>
References: <20220513135954.exewihnibnhdckkn@pengutronix.de>
 <20220517102432.pljcsjkar3oswdnl@pengutronix.de>
In-Reply-To: <20220517102432.pljcsjkar3oswdnl@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 922facc2-8015-4eaf-11dd-08da3806bd5b
x-ms-traffictypediagnostic: BN6PR11MB1732:EE_
x-microsoft-antispam-prvs: <BN6PR11MB1732D9A5AE8CEA5F78074CE8F0CE9@BN6PR11MB1732.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WmRFoJtXO9+gbQsuH+/hRMEOLddviwqb/crNgw/OZZgd2bFioM4kSgZLyRDJhGnUMPQuYH1lOCXm8LxFc3NAhLbVVA9VWXCANJyRZjNQWOkW7ysMcR4r+PBCG5CwodAU1bNAgrLVpvV7aaBbQbkHE2KbVLw659iRsSOQM/cCdJetT/hxDbZj7jfzfY5FvzWitogdR2G1z+Bx1ertxw/8Un9z6UzKYD2R+tct/iKIx220J+W772sea899eaegDsf7ZClw8Ph/hMKddWlsh513MN1mnulZYXi1ynNbE4osOrwGKrvnW1tkpnDD5v3RTiBAThyvRT1thvmsLYfschIUKZpo6NZ+uhv0KZ+Ly+RQa4JQxC1h2LlDY5rkFJGbhV1fWyiDPQ3X+PE3gEhaRezqOGK+HftyYG4QXH2/2QacHLN704dwgsG0sN8j+TRDqFBZpeglpnnqgkG9cViVBTtd7r5MmoiULbcGsEp5sspyY7SLy7a5UwsEG1MYxGhzIamBZbYnV1MKoQJzGS8Y3zj1l+5YhWhSXqveZwrvhq3FMnie39AHyU7xELMxSbidY+bANxDSFYyA2NynsC3gjXnCCTkjzU8HfQXtBSIYG9bADTgyDVoNvMyZKMB7eWPoiAoIvyk+LqNFGrJ7k++xhnKVlt0yfsObxw9KBvNEqMvSTGVIuhwycroPChklUtT5koJl48PV0wAKNzDp8OaTrwHXJnBfu04CnAdkH6bUEOMGWOXFuAW7ct3g2ADjc5GtdGW+8876joqMYLy4IsqjglkN8w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(64756008)(76116006)(66946007)(66446008)(8676002)(4326008)(66556008)(66476007)(122000001)(2616005)(31696002)(91956017)(316002)(38100700002)(86362001)(8936002)(5660300002)(53546011)(38070700005)(186003)(71200400001)(36756003)(31686004)(6506007)(3480700007)(6512007)(26005)(6486002)(2906002)(508600001)(6916009)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHVvb1BSMzc4bU9pODVzVnVML0hFMzFHUXZLcnpFeDV3TnBsZ01sNldZTUxB?=
 =?utf-8?B?emU0bTY3UnQ2NGJROXJTVWs5ZkVrU0pHWTRzTVFLSU95STJmTWt0TnM0UFJx?=
 =?utf-8?B?L05FYkxsNTFidTlab0dNYTVzRjY4ODFNSk42NE9NOFEvS2pMRklOeWluZUFu?=
 =?utf-8?B?YTliT25pc0RoenFiWlJYSmxCd3QrcEJrTXlEaFNPQXVQeWp0S2svdUEvd2o3?=
 =?utf-8?B?Tm9ENldxRFVCV3lhNHBCbDhBOC9VcGdVVDgvdjhPMU9JVnhWWnB4Q1lUdzJU?=
 =?utf-8?B?UGFHakNrZ01QL3cvcTlrTlF6akRPY213cVVMUEtkdG1aTm9kTm1Va1FGemNC?=
 =?utf-8?B?d3JIMWRJaFllblZhMUtLTUlES081UFJiMDNBT21hdlhuaUZoS2FyWmMzUHJu?=
 =?utf-8?B?YlVDN3ZaNm1KU1RNTmVXZUhIRXdRS3VEa0FkaFU3MVhETEJFM0FOTUJ3VXJz?=
 =?utf-8?B?RzNGLy9FYkdmQXF5UUc5ckJCUllRRkQxM0pFQUF3aFAxZ1kvcVVmYUN3c203?=
 =?utf-8?B?UmNaV1o0aTdaNTl3V1EreVArcVhWdWZnVlliNVNzYXRVMzB3YXk1NXFhZHdL?=
 =?utf-8?B?b1diVExGeGMxRUFxakdaS3dGT2loM2dUODJBQkoxcnRJWEpFMTQrTmlvVTEz?=
 =?utf-8?B?cGNpTEdOVXRQVGFxb05RcDd4Yk9jN2xoaDJzS0Z2NHR0b0pvSGlhZWR0WnlG?=
 =?utf-8?B?MlNrRkJNQmhTRmt1ZXI3OTJHOWc1Vko2bU1KQ2FySDdFWTZoZHk0MVBPbXhy?=
 =?utf-8?B?bTVWbmpZRnY1UXdFR2FWcTR6UTg3RUY0MnFqUVNzc0dqMDMxb0xQMDk2L1c0?=
 =?utf-8?B?VjY0QzVYODhXV3BMcEJjUCtHS0xxWGdBMlBseEFJdy82L3lJRTJSdGFLMHJC?=
 =?utf-8?B?dm5qSWcreUtxb0ExcmZZdFQwcVNvbGl4MFhtaVl4ZFhHeTJ1RVluNVR5WnQ1?=
 =?utf-8?B?VXZRTy92RHcxeHFZR0owWEVYMW4raE5JdkJBaTRJMHVWbE9pTnE1WmVsQzFB?=
 =?utf-8?B?ejNWVXI5RHhLOUt2UzNoK3ZDM1p4bkN0cHVjS0M5cnNHTzAvTjY0cnkzLytF?=
 =?utf-8?B?eWw5WVlCQUs2bkhkSEVkUzR4R0tZNlZYdGRZMGxudE1KQ3Z6dGNPWG4yUlIr?=
 =?utf-8?B?dG9EWGw2blZyWnhQTDd6c25HODF4VFRSQ1V3SGVOU3phbGpXOFdBd0VxNk9x?=
 =?utf-8?B?RitNTC9XeWg2TUNxdStmSVIrVDNqUEVpZkZLRVRPSityYUR1RlNmMXhFZ1ZO?=
 =?utf-8?B?aEJmZXlVa1JybjZGRWZ1K1FQa2I5TnZMRzNSR3FjTWlQdkt2RjBtRWhTNysw?=
 =?utf-8?B?dVFFWW5nc3phaFJXeHVuWWJBRGZxYU5VTTYxeUVvVTZ3cmYxc2hpVEtWSEhE?=
 =?utf-8?B?MnZEYXE0Y2lXL3NRZm5tK3RTVU9oZW5IaVkvcTJ0MzZnei90SVp2NXE4K05Z?=
 =?utf-8?B?aWYwR1ZsZXdMZkFwYzlkUElqNXdzYk9laTdMNDJjNHl0V3RNVnpwTXFZcUc4?=
 =?utf-8?B?dW4rd1ZtRHYrTkhGREw2c1QvaTI1bXVKYUNubFJJUVVwbTNGVVJmc1FNVDdi?=
 =?utf-8?B?YWtMdUpQYWlYZmtOTTNXU0dkei90QS92cnIwUWE5MTlwUGUrNTBPMzIyelhH?=
 =?utf-8?B?QkczM0JLbjkwc0M0SzhWQ3UxZ3ZOSERIRGkzSGdOclFlOTB3cFFwMXNvOVRr?=
 =?utf-8?B?Nm11YUw3MWtDM0NnZW9TK3E5RGFSaStCcHg3TFltV0tzNmNxa0I5clNxdHJJ?=
 =?utf-8?B?RXgwVDhKL2ZONUI0OGl6YVdsMXBLUExjQXBtLzZ4RC94bE1vejlISDNNcG9D?=
 =?utf-8?B?Y3RuUHlicmFRNTlFK3FOTWVFQ2dFSTFqSENWbTBPYURuL1FPL2pWU3pKM3Yz?=
 =?utf-8?B?b0EvUnJ5a2tTMCs3dnBXLzhrVU03Q1E0ZUxqNlVObTFsQVp0aDlyQ0hHY1FN?=
 =?utf-8?B?WUlINGlnMGZOdlpzaHM4eHBoS2xNb2xGRnZuZUxwZ2FQVFhtd2pFN3ZicWNY?=
 =?utf-8?B?VElVeGtsODdjcTNnb3UwbGtTNTF2LzhCbnh0WkdEWkhEYm1BZzBWemp4c1lO?=
 =?utf-8?B?MXpxZFptNUdxWWhydTVDazZLQkNKdVVNMDRJNElxZGFzUGRaYW1rbnV3U0o1?=
 =?utf-8?B?aGVkM2NsRThzMHNIVXVkQlQ1V1ozVVJqdTJxeTNncTR3RWE4NldLK3k5YmV1?=
 =?utf-8?B?aExISmU0QSsrcU1jOHpIS20zd081M01zT1I4bnE2WkNoOEtMa2R2Mkpqb0tl?=
 =?utf-8?B?OTNiMHByUFFYNG9PMHRqb1U0YWRvNVhlVWFXVXNGNTFENWNPeTlNVHhXVWlD?=
 =?utf-8?B?SjlrbndPR0Z0NFVYZmwrdnJuS0JqeGEzK0RDUDRpU1NvcjVCUk5qdVZLUTNT?=
 =?utf-8?Q?Jr9a9AHoPSJwW/lc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9972477F796E1B4181AC55D16B7EDD2B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 922facc2-8015-4eaf-11dd-08da3806bd5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 13:11:22.3543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uxstkv1x8VH8EPR3UdZS194fM2o9Vig50fJjqC5OWczZL6IezXaYanRXSal+OhtY+kUCiiX5t5gE/MwNh4oREF20AhZLW2KcaZmDNkE0XKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1732
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gNS8xNy8yMiAxMzoyNCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IEhlbGxvLA0KPiAN
CkhpLCBVd2UsDQoNCj4gW2FkZGVkIEFyZCB0byBDYyBhcyBoZSBsYXN0IHRvdWNoZWQgdGhhdCBk
cml2ZXJdDQo+IA0KPiBPbiBGcmksIE1heSAxMywgMjAyMiBhdCAwMzo1OTo1NFBNICswMjAwLCBV
d2UgS2xlaW5lLUvDtm5pZyB3cm90ZToNCj4+IFRMO0RSOiB3aGVuIGEgZGV2aWNlIGJvdW5kIHRv
IHRoZSBkcml2ZXJzL2NyeXB0by9hdG1lbC1lY2MuYyBkcml2ZXIgaXMNCj4+IHVuYm91bmQgd2hp
bGUgdGZtX2NvdW50IGlzbid0IHplcm8sIHRoaXMgcHJvYmFibHkgcmVzdWx0cyBpbiBhDQo+PiB1
c2UtYWZ0ZXItZnJlZS4NCj4+DQo+PiBUaGUgLnJlbW92ZSBmdW5jdGlvbiBoYXM6DQo+Pg0KPj4g
CWlmIChhdG9taWNfcmVhZCgmaTJjX3ByaXYtPnRmbV9jb3VudCkpIHsNCj4+ICAgICAgICAgICAg
ICAgICBkZXZfZXJyKCZjbGllbnQtPmRldiwgIkRldmljZSBpcyBidXN5XG4iKTsNCj4+ICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVCVVNZOw0KPj4gICAgICAgICB9DQo+Pg0KPj4gYmVmb3JlIGFj
dHVhbGx5IGNhbGxpbmcgdGhlIGNsZWFudXAgc3R1ZmYuIElmIHRoaXMgYnJhbmNoIGlzIGhpdCB0
aGUNCj4+IHJlc3VsdCBpcyBsaWtlbHk6DQo+Pg0KPj4gIC0gIkRldmljZSBpcyBidXN5IiBmcm9t
IGRyaXZlcnMvY3J5cHRvL2F0bWVsLWVjYy5jDQo+PiAgLSAicmVtb3ZlIGZhaWxlZCAoRUJVU1kp
LCB3aWxsIGJlIGlnbm9yZWQiIGZyb20gdGhlIGkyYyBjb3JlDQo+PiAgLSB0aGUgZGV2bSBjbGVh
bnVwIGNhbGxiYWNrcyBhcmUgY2FsbGVkLCBpbmNsdWRpbmcgdGhlIG9uZSBrZnJlZWluZw0KPj4g
ICAgKmkyY19wcml2DQo+PiAgLSBhdCBhIGxhdGVyIHRpbWUgYXRtZWxfZWNjX2kyY19jbGllbnRf
ZnJlZSgpIGlzIGNhbGxlZCB3aGljaCBkb2VzDQo+PiAgICBhdG9taWNfZGVjKCZpMmNfcHJpdi0+
dGZtX2NvdW50KTsNCj4+ICAtICpib29tKg0KPj4NCj4+IEkgdGhpbmsgdG8gZml4IHRoYXQgeW91
IG5lZWQgdG8gY2FsbCBnZXRfZGV2aWNlIGZvciB0aGUgaTJjIGRldmljZQ0KPj4gYmVmb3JlIGlu
Y3JlYXNpbmcgdGZtX2NvdW50IChhbmQgYSBtYXRjaGluZyBwdXRfZGV2aWNlIHdoZW4gZGVjcmVh
c2luZw0KPj4gaXQpLiBIYXZpbmcgc2FpZCB0aGF0IHRoZSBhcmNoaXRlY3R1cmUgb2YgdGhpcyBk
cml2ZXIgbG9va3Mgc3RyYW5nZSB0bw0KPj4gbWUsIHNvIHRoZXJlIG1pZ2h0IGJlIG5pY2VyIGZp
eGVzIChwcm9iYWJseSB3aXRoIG1vcmUgZWZmb3J0KS4NCj4gSSB0cmllZCB0byB1bmRlcnN0YW5k
IHRoZSBhcmNoaXRlY3R1cmUgYSBiaXQsIHdoYXQgSSBmb3VuZCBpcw0KPiBpcnJpdGF0aW5nLiBT
byB0aGUgYXRtZWwtZWNjIGRyaXZlciBwcm92aWRlcyBhIHN0YXRpYyBzdHJ1Y3Qga3BwX2FsZw0K
PiBhdG1lbF9lY2RoX25pc3RfcDI1NiB3aGljaCBlbWJlZHMgYSBzdHJ1Y3QgY3J5cHRvX2FsZyAo
LmJhc2UpLiBEdXJpbmcNCj4gLnByb2JlKCkgaXQgY2FsbHMgY3J5cHRvX3JlZ2lzdGVyX2twcCBv
biB0aGF0IGdsb2JhbCBrcHBfYWxnLiBUaGF0IGlzLA0KPiBpZiB0aGVyZSBhcmUgdHdvIG9yIG1v
cmUgZGV2aWNlcyBib3VuZCB0byB0aGlzIGRyaXZlciwgdGhlIHNhbWUga3BwX2FsZw0KPiBzdHJ1
Y3R1cmUgaXMgcmVnaXN0ZXJlZCByZXBlYXRlZGx5LiAgVGhpcyBpbnZvbHZlcyAoYW1vbmcgb3Ro
ZXJzKQ0KPiANCj4gIC0gcmVmY291bnRfc2V0KCZhdG1lbF9lY2RoX25pc3RfcDI1Ni5iYXNlLmNy
YV9yZWZjb3VudCkNCj4gICAgaW4gY3J5cHRvX2NoZWNrX2FsZygpDQo+ICAtIElOSVRfTElTVF9I
RUFEKCZhdG1lbF9lY2RoX25pc3RfcDI1Ni5iYXNlLmNyYV91c2VycykNCj4gICAgaW4gX19jcnlw
dG9fcmVnaXN0ZXJfYWxnKCkNCj4gDQo+IGFuZCB0aGVuIGEgY2hlY2sgYWJvdXQgcmVnaXN0ZXJp
bmcgdGhlIHNhbWUgYWxnIHR3aWNlIHdoaWNoIG1ha2VzIHRoZQ0KPiBjYWxsIGNyeXB0b19yZWdp
c3Rlcl9hbGcoKSByZXR1cm4gLUVFWElTVC4gU28gaWYgYSBzZWNvbmQgZGV2aWNlIGlzDQo+IGJv
dW5kLCBpdCBwcm9iYWJseSBjb3JydXB0cyB0aGUgZmlyc3QgZGV2aWNlIGFuZCB0aGVuIGZhaWxz
IHRvIHByb2JlLg0KPiANCj4gU28gdGhlcmUgY2FuIGFsd2F5cyBiZSAoYXQgbW9zdCkgb25seSBv
bmUgYm91bmQgZGV2aWNlIHdoaWNoIHNvbWVob3cNCj4gbWFrZXMgdGhlIHdob2xlIGxvZ2ljIGlu
IGF0bWVsX2VjZGhfaW5pdF90Zm0gLT4NCj4gYXRtZWxfZWNjX2kyY19jbGllbnRfYWxsb2MgdG8g
c2VsZWN0IHRoZSBsZWFzdCB1c2VkKD8pIGkyYyBjbGllbnQgYW1vbmcNCj4gYWxsIHRoZSBib3Vu
ZCBkZXZpY2VzIHJpZGljdWxvdXMuDQoNCkl0J3MgYmVlbiBhIHdoaWxlIHNpbmNlIEkgbGFzdCB3
b3JrZWQgd2l0aCBhdGVjY3gwOCwgYnV0IGFzIGZhciBhcyBJIHJlbWVtYmVyDQppdCBjb250YWlu
cyAzIGNyeXB0byBJUHMgKGVjZGgsIGVjZHNhLCBzaGEpIHRoYXQgY29tbXVuaWNhdGUgb3ZlciB0
aGUgc2FtZQ0KaTJjIGFkZHJlc3MuIFNvIGlmIHNvbWVvbmUgYWRkcyBzdXBwb3J0IGZvciBhbGwg
YWxncyBhbmQgcGx1ZyBpbiBtdWx0aXBsZQ0KYXRlY2N4MDggZGV2aWNlcywgdGhlbiB0aGUgZGlz
dHJpYnV0aW9uIG9mIHRmbXMgYWNyb3NzIHRoZSBpMmMgY2xpZW50cyBtYXkgd29yay4NCkFueXdh
eSwgaWYgeW91IGZlZWwgdGhhdCB0aGUgY29tcGxleGl0eSBpcyBzdXBlcmZsdW91cyBhcyB0aGUg
Y29kZSBpcyBub3csIHdlDQpjYW4gZ2V0IHJpZCBvZiB0aGUgaTJjX2NsaWVudF9hbGxvYyBsb2dp
YyBhbmQgYWRkIGl0IGxhdGVyIG9uIHdoZW4vaWYgbmVlZGVkLg0KDQpDaGVlcnMsDQp0YQ0KPiAN
Cj4gSXMgdGhlcmUgc29tZW9uZSBzdGlsbCBjYXJpbmcgZm9yIHRoaXMgZHJpdmVyPyBEb2VzIHRo
aXMganVzdGlmeSANCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NyeXB0by9LY29uZmlnIGIv
ZHJpdmVycy9jcnlwdG8vS2NvbmZpZw0KPiBpbmRleCA3YjJkMTM4YmM4M2UuLmIzMjQyZmJhODJh
YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9jcnlwdG8vS2NvbmZpZw0KPiArKysgYi9kcml2ZXJz
L2NyeXB0by9LY29uZmlnDQo+IEBAIC01NzMsNiArNTczLDcgQEAgY29uZmlnIENSWVBUT19ERVZf
QVRNRUxfSTJDDQo+ICANCj4gIGNvbmZpZyBDUllQVE9fREVWX0FUTUVMX0VDQw0KPiAgCXRyaXN0
YXRlICJTdXBwb3J0IGZvciBNaWNyb2NoaXAgLyBBdG1lbCBFQ0MgaHcgYWNjZWxlcmF0b3IiDQo+
ICsJZGVwZW5kcyBvbiBCUk9LRU4NCj4gIAlkZXBlbmRzIG9uIEkyQw0KPiAgCXNlbGVjdCBDUllQ
VE9fREVWX0FUTUVMX0kyQw0KPiAgCXNlbGVjdCBDUllQVE9fRUNESA0KPiANCj4gPw0KPiANCj4g
QmVzdCByZWdhcmRzDQo+IFV3ZQ0KDQo=
