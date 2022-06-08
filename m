Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDBD542B1B
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jun 2022 11:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233867AbiFHJPo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jun 2022 05:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234966AbiFHJOV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jun 2022 05:14:21 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D5936334;
        Wed,  8 Jun 2022 01:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654677332; x=1686213332;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1f0pbg79Whj13f8022zSPnjFRZxd/RuMWmjtUi2wbXI=;
  b=LVT4Ia64oGUaMKw5NreVcx4j9/r80E6VRuvmT2Mobtsi+nFASdJI0Lvh
   UqJhqMm7YfNSmn61MvQ4+zVp1GRFx8h+AhqjX6thcAid/AkCQ+I9q9yds
   RCS7JGRF8HI3/X+laTAFoCMEWmMfagS/m/MWpYl27Do86TspeNy8FYLVT
   Vsx9IaBdG/xvTh3HHf81Rws0/yvtppSzpEpaxVQsqBucgBS832tj0J9en
   nO0FRoJLCjB+FPsIZMWCfxzsGN+uBZYDgpsN9RKbwXc5cBt4nC06nysFp
   tMt5vKRERrj0W6I5JwFdnd0wE6GlPnESyr/wxP7Q9DEfXWXI24YG4bcYl
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; 
   d="scan'208";a="177032340"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jun 2022 01:35:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 8 Jun 2022 01:35:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 8 Jun 2022 01:35:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLDThrFft1PjlW68pjRymY7o6xAeI7jsxNLfAHGxBQEn2Yy5nRTma0R63Fk8ClixQnFaNBZcIdJwgggB/bb9wdBTK1ISPJ8/ZNjZDoqPMAGQQnJBtRuSq/qwk8slFaylLgp7R9TAGUOABbU+mchEMowQkDVadK6SXSPKnFmF2Iaj3ylwlFWq6pbrA2PA9pBZ+wTpPbNZJ+D2FXsEPv2mzfECLQRNmuD97kqsf/403xkJW9aVdZVcTMejol7OmEUVrX22xmw1/2SgdNHy2qBz43P+f4w4RNu4YN3PG47Z8DY8pxAye310+N/AaOjd7YW1tL7CB4FMNhOqDDEEp4bGrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1f0pbg79Whj13f8022zSPnjFRZxd/RuMWmjtUi2wbXI=;
 b=nwHH+dX2eDUSDIS5cF4/44QUVchL2bWdtqOsgZENXZlgB9Pq9B8Wl4OAKNxToz323vPKSR3L4KnDCexoYlvaO0344Fsyil5q4mfxj0I43PuhMHXV7gF3xsidfixzoWUTNmg8gPFuLZhD5GSzx8cy+dIZEKugR1mc9Wf2td2J7nSUgAJl5jv25cfD4WTRTdrOBCG7ShJol0fvAyIJEGghbwk7gti7m80L7QDMJTmErN/osOU6uFuq5nLkHjSKFHwyCgyJwXT1PF5ohHA2MsoZbBDy7PkeLxP4JF6UG4lfC/5eGE2t5HW9dErEPxJCvb8y8XCwG8RMDft95V7Ul0KJyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1f0pbg79Whj13f8022zSPnjFRZxd/RuMWmjtUi2wbXI=;
 b=rZ4sagdQST4n4zaWT8jJTr0KauV97vyWbzIzEYc4ETH2fOjK/ihB7FYZntR9G6VD3oxnK3VsLsM5mE0U6tKHHFdkqwSlyX1Kg6o9zKkx3iinArEGd11J1UWWIaarCAccrmRJG9G9iz3Q/ype/zZW6qi8FM1Ki0HT+z69UvDli/Y=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 DM4PR11MB5359.namprd11.prod.outlook.com (2603:10b6:5:396::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.13; Wed, 8 Jun 2022 08:35:26 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::d9de:be6:d90f:392b]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::d9de:be6:d90f:392b%7]) with mapi id 15.20.5314.013; Wed, 8 Jun 2022
 08:35:26 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <u.kleine-koenig@pengutronix.de>
CC:     <alexandre.belloni@bootlin.com>, <Nicolas.Ferre@microchip.com>,
        <linux-crypto@vger.kernel.org>, <kernel@pengutronix.de>,
        <Claudiu.Beznea@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>
Subject: Re: [PATCH] crypto: atmel-ecc - Remove duplicated error reporting in
 .remove()
Thread-Topic: [PATCH] crypto: atmel-ecc - Remove duplicated error reporting in
 .remove()
Thread-Index: AQHYevDyjU6JcDefx0Gz4UCefFNvBQ==
Date:   Wed, 8 Jun 2022 08:35:25 +0000
Message-ID: <87243f0b-8496-bfe1-3d44-81b4405927e9@microchip.com>
References: <7ffd4d35-938a-3e82-b39b-92e76819fa92@microchip.com>
 <20220520172100.773730-1-u.kleine-koenig@pengutronix.de>
 <fd8d1ca1-b6fa-ecb9-ba71-80449af59a9a@microchip.com>
 <20220608070408.odie7hrcnfasegbr@pengutronix.de>
In-Reply-To: <20220608070408.odie7hrcnfasegbr@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1629dd5f-e071-42ef-1ab6-08da4929d612
x-ms-traffictypediagnostic: DM4PR11MB5359:EE_
x-microsoft-antispam-prvs: <DM4PR11MB53595A24A8573B2A4FBE0C4CF0A49@DM4PR11MB5359.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hPWgv3+daPSpuZ4GxVvg5WN9tD4QPCKDMrSTeZqSzMS3p0P9bDM0HWSUeopgK1xAkPbfXTOmUW+2XLIEYYcS7j6EshnRxczyG+B6ROcn4ar5Spu3BInHlb+uuGjaWpISYI1dyvhL3GJeC1vmZYa4cJ8cQV7vn1S1ptUUSXeF45hLAB7705nYb9CbXeFVjRTkNIAVZuYYDgoTC+f8eg4JwnKVlmNWVGQ3hFVsKGfmFbepPxKKL+Fxu3vaGOh7bRzxMSk5KpRv83EzrJmHWwQa0oNuCV5S9T/1OafaNq48jLyCgFjV/5pigVMOLbbogfA1TWox8EXodZCI2i795J4eh8oDd0kgm0hIf159OKaOScGB8aqIa5FedoyRvX1SN0wysgkVYLbTdOkoN+zt+2pMGy8vRnDtyu11ETzhDytxT2A5RSb0+qpxoPr2RXcd5Rk1ImOFHx3BGWZX4UDrTG4lrJzk0XzAPCyQnbijGUf2nAWxsaTJfJobOV89ikDGccJmzU0Nu/NI4MZwsLrKPlvj9VE3wg3Z2D1GOSFnOk/VOe8RV3/BpoCgZpduwU8HTR2ha+5iv2BAwE0O7Hx9HFk7IytNJilCsajJxihUXjBi+9+uAybPxqUjrcbFnts2FLrfdzuH36AZlg9FFVG/1b0mmBfqHcM4wlP5jhPTHrfLnO/zIXYj7/Piz+EBE8FeSSQMF78T4lsXOt1kJgRLA+0c4SC9MCJ4Yw3aS0e5hi8OLHdC1HnKd8mgWvru+XG3jdjOFQDHXVE18u9C91ZaLe81CutO5y/EIb0/C3Ab01KDXOQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(53546011)(76116006)(31686004)(66946007)(36756003)(8676002)(122000001)(71200400001)(4326008)(66476007)(66556008)(26005)(508600001)(54906003)(6916009)(6486002)(64756008)(66446008)(66574015)(38100700002)(6512007)(83380400001)(316002)(8936002)(91956017)(31696002)(186003)(2906002)(38070700005)(6506007)(2616005)(86362001)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVp2ZFgyL0VNL0ptRWpJM3FjSDFwOEVRc3dWUHBPQWxwVTB0RlIvTGgwTC9o?=
 =?utf-8?B?UVRjaDVNcnk1TGtScWNScTVHc3RWVmNTeElHNHRSclgzTmNwUlJMNzYyd0hJ?=
 =?utf-8?B?a2tsMmtSc3owS0RzUGN5V1k3WGN5NkxKT2k1N01hZ1ByMGl4QjhPZ0NlOXV4?=
 =?utf-8?B?OEdzRDYvZ1pkVVlKVkZDTFpqTVhFbmpuekZqeHBZRHM1V2pEbHN2MXdrNDFQ?=
 =?utf-8?B?ZEVPVUJVSTNlNXJMRno4dG9tVEtTbnpqb0sxb2M5MGx4dVRlQ2NpRVN1RjYw?=
 =?utf-8?B?NHBaODJXaTYzT3g0Ukl0TldEeHlGU3hRQ1pNb3ZTeVZYWnBRSnRvY3N0MXpy?=
 =?utf-8?B?Qm8wZ2IxUEN0YnlQTk4yakdpWmFBMVZXRFFUUDcxU25hRSs2d2V4cjkrTU5V?=
 =?utf-8?B?RWlLZFIrVCtHR1cxVzlZQmRlb25mZ1dha2Vsc3N4QjdnZjNhWERqZWtpRlFL?=
 =?utf-8?B?REZPRUE3bkt4aEdpMVBCb0JtQ29IaFkvY0w2M2hUeGQ1MmtscEVTaVZsSGgz?=
 =?utf-8?B?dnA2L3hsWXdGTkw3MzBabDJhOW05dUZxZ2xOUW9EVXUrdFBiU3F5anJxWUhY?=
 =?utf-8?B?TlpnNzJLb24rd2NEeU1VbXp2MW5Bbm4wVjBlS1plaU5ZV1hXYnM5WjF4NFlj?=
 =?utf-8?B?M0l4eTVmUmVLQXF1QmZNSnAyRU50M0lmVVdFV2o2OXFRMUludnUzTVBvV1pu?=
 =?utf-8?B?eVFFQTlYUUpHQVVDWlkxM0RnU1N5OWRtSGcxTGtwZVZGR2xSTTRncWN2c0Ji?=
 =?utf-8?B?aFNqN1RMclR1NjJzdE5id0NzMm9nenpwRDZCZ1YzNXZ5Zk5KQXY2ODRaYnlK?=
 =?utf-8?B?a2FzWDVtaXArY3c3VzRsVCtHTldRVi9ueExmZ3hlRHlvZStMNkRnYlhCTnp2?=
 =?utf-8?B?WG1NSWRDd1owSkNpTkJWcjN1TlBzbzdHQ3pwZDdxZEh1T3I5RkpVdXJ5RjQ0?=
 =?utf-8?B?SktsM3JoWXhVc0xxa0tzZG5MT2M0WDBUaFBOMS95SnVKY0kzekdPcFp1azhq?=
 =?utf-8?B?a2dsNFUvZHNNQ08wdlQ2UG5ZcnlpdzZwSElOa3U0R3IzYzMvM3NpTlEvYkpu?=
 =?utf-8?B?K1luS21UcjRJN0FleUhKYUsrN3ROMGZPeHlxVWdJOXliVi81dTZWd3VVSjRs?=
 =?utf-8?B?b09XWFd2VGNwSlFLODVKNTUwZ0JpZlpjTVpLcUdNcGFoYUNmNG5hZmUwZDJF?=
 =?utf-8?B?S01GOUV3QUlxQm0rVWo3dXpNZFZudFlSRTFueDZSd0JORE1ZRkVPR09yQmsz?=
 =?utf-8?B?VytmQTM2cTUzY2xCdWJpcm9VSnFIS0hlc0p0T3MzbS84cTBXbzN0cjVPaTQr?=
 =?utf-8?B?cDVoZ1J6Sm5SYXhrb1M1SHhWUjk0RVg4MldsbUpHT1RYaDhrQkpQM1VlcnFH?=
 =?utf-8?B?QkJheXVpTFFzOE1pb3Nza2ZKdlBCSno5OGRqZXcrcXFzNWRRMjN3NXBKRmN4?=
 =?utf-8?B?K3lJTTZqZ3h3V0ZKTVZIZC84TEZrU1ZMbDZSdlk1WEtyWG03SWVHSE50WTJB?=
 =?utf-8?B?YUJTV2FzQWo0YUdNMldNeFNab1Y4NHBpUEtkd1JZNE9tdjdNNjF6N1BwUVFi?=
 =?utf-8?B?SktvQmFSQmtsa3NDVytsR3U3TFZYTFJtNlZiMUNHQU1HRUNvU0FHdUFHMkhW?=
 =?utf-8?B?ZkJVQnJ1UklTNkNyWHh4cEdKblY0aWxINzFaV29lUDVhek9UZXRBb1JHbVV1?=
 =?utf-8?B?ZmFMdHROQ2w3WkxQZ00yc1BjMElRTDZEWUlRRDZZdG1QUDJqZitPUnNqQjhB?=
 =?utf-8?B?SHYxb0htVGdWVTV0cHVtOXdheW9mWVBVcVBYV1plN2tHRnY2T0Irb2NOUjlW?=
 =?utf-8?B?WjJnSFBTTWlQOEJ3M1RIVW1URFEzRVRHMStrOGhPUFRmMU9tVlpNQ0FxZk5y?=
 =?utf-8?B?L1crU1VlaW9FclM1MVQrVDQ2ODdkd08zUktkaytoVkpvTzhYQitoOHlyZDJP?=
 =?utf-8?B?dGwxdW9oMHViUkdtdjRMbm5FVkE2a2loZEJkcXRaSVRFYm9kdXdMNVFVMXZL?=
 =?utf-8?B?aUd3T1pqS0lmb0k4anZ3ZG0zUEJwTERuY2lBV3UzOUxNa0NDWjdVazlKNWRs?=
 =?utf-8?B?VE4xMGxvb2VoMmFXV2dFUWFMWmNTeFE2Z3crQkZQWkxQZTBvWW1PbEVKQk1p?=
 =?utf-8?B?Rmd6MEFtbTdUcVY4NkNqak1COWJCSzJJU2lYR2lpV2FIM2RMUDh5bVpvSmdy?=
 =?utf-8?B?T3hTZzFpemNSUGh0Zmx3SmNrY3lzVnBiaHRuSlNuMExic1FibEdFa3lJaDc3?=
 =?utf-8?B?SlhUby9ONHJlVDNIeEpBZURsSmIrajZHU2ZZWllsOFpNcStBN2hjS0hTVVFB?=
 =?utf-8?B?RGY3ZEV1K01LYkU0NExhdUtGOHp4RzV3WHlGdzh2aS9vZVgzN2tzSmNwZDdF?=
 =?utf-8?Q?5Hob6OLt3vcM2/Os=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC5A82F85A91B948A062BA69C4B57822@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1629dd5f-e071-42ef-1ab6-08da4929d612
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 08:35:25.9875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FihP+cgDQ//sTR06kHiLUFbtIyYlGpLAfWnmEr1eFSP5IdPsRyF+CAXXFyAUdsPhIhxCTVjYJuVdv1erYDmjk5CD/vAdapr/JqWo4eSX/8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5359
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gNi84LzIyIDEwOjA0LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToNCj4gSGVsbG8NCj4gDQoN
CkhpLA0KDQo+IE9uIFdlZCwgSnVuIDA4LCAyMDIyIGF0IDA0OjMzOjQ4QU0gKzAwMDAsIFR1ZG9y
LkFtYmFydXNAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IE9uIDUvMjAvMjIgMjA6MjEsIFV3ZSBL
bGVpbmUtS8O2bmlnIHdyb3RlOg0KPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlu
a3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2Fm
ZQ0KPj4+DQo+Pj4gUmV0dXJuaW5nIGFuIGVycm9yIHZhbHVlIGluIGFuIGkyYyByZW1vdmUgY2Fs
bGJhY2sgcmVzdWx0cyBpbiBhbiBlcnJvcg0KPj4+IG1lc3NhZ2UgYmVpbmcgZW1pdHRlZCBieSB0
aGUgaTJjIGNvcmUsIGJ1dCBvdGhlcndpc2UgaXQgZG9lc24ndCBtYWtlIGENCj4+PiBkaWZmZXJl
bmNlLiBUaGUgZGV2aWNlIGdvZXMgYXdheSBhbnlob3cgYW5kIHRoZSBkZXZtIGNsZWFudXBzIGFy
ZQ0KPj4+IGNhbGxlZC4NCj4+Pg0KPj4+IEFzIGF0bWVsX2VjY19yZW1vdmUoKSBhbHJlYWR5IGVt
aXRzIGFuIGVycm9yIG1lc3NhZ2Ugb24gZmFpbHVyZSBhbmQgdGhlDQo+Pj4gYWRkaXRpb25hbCBl
cnJvciBtZXNzYWdlIGJ5IHRoZSBpMmMgY29yZSBkb2Vzbid0IGFkZCBhbnkgdXNlZnVsDQo+Pj4g
aW5mb3JtYXRpb24sIGNoYW5nZSB0aGUgcmV0dXJuIHZhbHVlIHRvIHplcm8gdG8gc3VwcHJlc3Mg
dGhpcyBtZXNzYWdlLg0KPj4+DQo+Pj4gQWxzbyBtYWtlIHRoZSBlcnJvciBtZXNzYWdlIGEgYml0
IG1vcmUgZHJhc3RpY2FsIGJlY2F1c2Ugd2hlbiB0aGUgZGV2aWNlDQo+Pj4gaXMgc3RpbGwgYnVz
eSBvbiByZW1vdmUsIGl0J3MgbGlrZWx5IHRoYXQgaXQgd2lsbCBhY2Nlc3MgZnJlZWQgbWVtb3J5
DQo+Pj4gc29vbi4NCj4+Pg0KPj4+IFRoaXMgcGF0Y2ggaXMgYSBwcmVwYXJhdGlvbiBmb3IgbWFr
aW5nIGkyYyByZW1vdmUgY2FsbGJhY2tzIHJldHVybiB2b2lkLg0KPj4+DQo+Pj4gU2lnbmVkLW9m
Zi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4N
Cj4+IFJldmlld2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5j
b20+DQo+IEluIHRoZSBwYXN0IHBhdGNoZXMgd2VyZSBwaWNrZWQgdXAgYnkgSGVyYmVydC4gSSBh
c3N1bWUgeW91ciBSLWIgdGFnIHdhcw0KDQpoZSBzdGlsbCBkb2VzLg0KDQo+IHRoZSBtaXNzaW5n
IGJpdCB0byBtYWtlIGhpbSBwaWNrIHVwIHRoaXMgcGF0Y2g/IFRvIG1ha2UgYSBiaXQgbW9yZSBz
dXJlDQoNCnByb2JhYmx5IG5vdC4NCg0KPiB0aGF0IHdpbGwgaGFwcGVuLCBJIGFkZGVkIGhpbSBh
bmQgZGF2ZW0gdG8gQ2MuDQoNCkhlcmJlcnQgdXN1YWxseSBxdWV1ZXMgcGF0Y2hlcyBpbiBhIHR3
byB3ZWVrIHRpbWUgZnJhbWUuIExldCdzIHdhaXQgZm9yIGhpbS4NCg0KQ2hlZXJzLA0KdGENCg==
