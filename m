Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51976568620
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 12:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232306AbiGFKu5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 06:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231744AbiGFKuy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 06:50:54 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AF9248F5;
        Wed,  6 Jul 2022 03:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657104650; x=1688640650;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=n4pwEdaFsdFt5IlYS0IIQCwu03O7gbXNN1Oa346+NyA=;
  b=n2Wbftxcep+RFr/4itORaU1gJhTNzx9/6AghZQYg2/hHWi4biZWL7NLF
   B+8o+zBKvl/5glAJhi2loZMVJbajIe74plEbhT0319b5UieoOENaYvRfe
   N0dcv+X77bMsMmSJS4RkY1Qrqpdc7KykM7NnxiKOtqYIDhCXirL7GdwWe
   9+g73OtdHU7bRTc2OSdSSR5/kw9asvNegbb0UjMChbQUombYywoZDBzZv
   XdzOPfWGun+9d6WWTvn/4xrZFQeEPbp6oGkJ6BKhcEo2qQTPdhHLxL8uj
   AZqOwhwpG+gif78HBqnJojnxwZXUwfYz4+kTky53c3zhEzGRTMwo8bVM3
   w==;
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="103260395"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2022 03:50:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 6 Jul 2022 03:50:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 6 Jul 2022 03:50:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTWidL2SCEOVEKwF9mHX4bXEJgD4Qog+otgUnTVLd3FBUrb42oVDSjK9KMmm1jUGl0DCEY38Qqe5WlHUYHFp3x6OLLZNqVHJ8Hf6PL/lwR1kEC2NAgtw2BcIHMlMDeclArbqT11mKcjhkjFF9RGfDs94hUOGQ1wBGIx8RbB0iWjzvUzDjJBfJPMZ7X7PX7yfrsHt3H9prROpmIFdeQzLqRm16xG5AqzRaPmUR9kDM8/UdojwhrDSu/Cua4QdeuyNx3EcZmhAXp2u807c2k1TqrJ0POf4zLkabnMzqS7i6br0Wg24Nw+u7kQjfUnHnc6YJxtV+u0hn2YpZVC8ej/4qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4pwEdaFsdFt5IlYS0IIQCwu03O7gbXNN1Oa346+NyA=;
 b=CLzYIsA8qWEcxnL7/3YvKnluTl9KoagS7qajBhrtzEx8eM/AD3yJBRX6MQBS+tiwFmMi1fvEg8WcGF16iuWo7yee+g3DPYs5Ol6e2oaCtCr9yb6Uq6LHwWp62KtHRttMB2EYNNXej8FVad+jdZF5FlOcmZ7jSEhfnJ4jmc5PL0rQqk2cbX0c/4Uw7crGjw3JyPJxhfmzDt40XGM62qmvyuT8RPWrNX8Ma7caBcID1ZGd94Ghs7trBQdFjH4Il1VZZXFo57YjNDQbZEi8X5cmF48+LZ9x+1XmeX3kvqIiMXdrpkpeYbkTIn9GL+/mA4PHd98zjg4ovZcKvh1LsBqgMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4pwEdaFsdFt5IlYS0IIQCwu03O7gbXNN1Oa346+NyA=;
 b=PUP6+DxBwHmiMti1bDX84YSt7xAuoLXFX7RJdpJRapOOWh/T12GKX4mfXSKtaUZKldN5uDe6TNLUDAGpUWuklgrnqIhORyxEDxRE4tpzBYdrVUHxAl1qtI88m8I1yWHGek3VJas8J+egl8CQiCSJia/2nlb3nnn3Q0Q82uwE53I=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 6 Jul
 2022 10:50:44 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69%8]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 10:50:44 +0000
From:   <Conor.Dooley@microchip.com>
To:     <wsa@kernel.org>, <Conor.Dooley@microchip.com>,
        <linux-i2c@vger.kernel.org>, <ben.dooks@codethink.co.uk>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <Daire.McNamara@microchip.com>
Subject: Re: [PATCH v6 1/2] i2c: add support for microchip fpga i2c
 controllers
Thread-Topic: [PATCH v6 1/2] i2c: add support for microchip fpga i2c
 controllers
Thread-Index: AQHYhULLtFIyC/B0MkaOYq8wqk68lK1xBuUAgAAMVoCAACm4AIAABQaA
Date:   Wed, 6 Jul 2022 10:50:44 +0000
Message-ID: <3b2ac34b-7da4-9714-eb65-d62f900c6679@microchip.com>
References: <20220621074238.957177-1-conor.dooley@microchip.com>
 <YsU3eLA3PrceFS65@shikoro>
 <ac070176-93b9-3bc4-5589-ec57d4d38af4@microchip.com>
 <YsVk0Gg1x7juHcZU@shikoro>
In-Reply-To: <YsVk0Gg1x7juHcZU@shikoro>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eba79f0d-97d1-43ba-b493-08da5f3d6099
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O5huBR0fqoVQ3IGUvU99iZblm4TPXcandTRwvWFqRJY/XCvTcJQkTdEvbIeLyKKMV8t7seCFQnH9I7pOIT1hZl89uSNA0j6s/wA0Qv3WU6cR0U/byvdhV1+Xs8UDBp0IspIbD3Pl7RDD9D2nf9h9k8X8SD8l2GwCkVbAcbfRPjYl1kq2V6rwOItml7OpKfJajqg9fw2MjxKRKZqRDIv3qbxMLvibL25mMX3ky4jJvOMM51y+GeGTsPYxj6w4sbPvs5o5E1lR/S+yLXpN91ejLT9Xrj0Nnv4SoBlcmnGbbQQx+y20fONmUmuUeKmcgQDW3zC4LN4Wamm9Cl5E9Ztm4Eb8lXeLhTD7qvRFjj9KNN3Q6RbAG9taW6yHwy568I4AwLHm4bbtM2FNAs/SVwGeYPTSrn9oryB5NeL+1VAW4JRPhmzcACwuA9Cx8ctXyRvhk91KeU9Z0x7fbOqE137X+MxoQEEaO/4xELjTNSRmUYBvIlk6Rv4ah/kJLrOwcUhyKRdZVaLz8/6aGw1slZefwEXUvuN383WuhWoM26Kq2cnqhnK2FFhOSCuLaKMXLFnma3N8Ncn/YDymD5HVomZzCWXRXEXPMU8u1knVwU5v1TnA7oa34MaA+9dxYq+W8zvqFUVJiaU00noPK0BEO0QUh3SYP1vN4pUm1lHT4tDhkzA0NcCAqR3DP4zJFp7hpUC/lBddCFJCz6cetBCELKFWe5JFEKBvif6TnhVyhddpfi4yn6dDizJVtNH6+wx2WMHVHiSVLoDrk/qAylK5/xgAgbkY/Pg5aTRzE1cc+WuxswM7MUAGR35ANWcoMpUHZWYbXyXnlNtQv3fnI4q2y7wSDZ+OmGfZm7Qb822349ngf4AG9AVErT6lkPAydMzpNIMQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(346002)(376002)(366004)(136003)(8936002)(41300700001)(71200400001)(478600001)(31696002)(86362001)(6486002)(5660300002)(2906002)(38100700002)(316002)(91956017)(2616005)(36756003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(186003)(8676002)(83380400001)(122000001)(53546011)(6506007)(38070700005)(31686004)(26005)(110136005)(6512007)(6636002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTdkc0x5c1pPaStWL2NMa0E4cEZQMGFLd2E1SkFadEYxV1ZBMG9IQ0pQM00w?=
 =?utf-8?B?dDVsZmpQRzVnbEdzR0Q1aXp0OHZ4NFZsSXpSOE0vYnF6N3Q0d3YwVlJJRlp3?=
 =?utf-8?B?WEZ1enF4Y0owRVZreStWNnRsZEJnYlprbGdkQzc4MTRLQklSZ1hrNWhuS0Qz?=
 =?utf-8?B?eG9IcEhtR25NdVFxVXdaeUtTd1o3MmFndzU5cStlVytZVllFU1pZQzl0aTFN?=
 =?utf-8?B?cUJjemhpN1ZLM3Y1N2k5QVI3ekFwNFdjS09ncnVjSWhzZzZKUEV3QlB0QUlD?=
 =?utf-8?B?bUE2K0s3RXQ4d20vWndJVDhxRlFVZG04S2pybDJOUUp6QVIxckVPYTA0UW1l?=
 =?utf-8?B?dkxpeW5LSzNSU0o5Tit4VmFsMGlScDdFanppcittWGNWeVFoN3JFNTRONGVa?=
 =?utf-8?B?YTBONE9PNkpyTW9QVytGZ2JOaWdteGNiQm94TVorT0ZVT3JWSHR6dVNpMGxu?=
 =?utf-8?B?Z2czUzJrT2Jqc0JLc0FqL3dYamZ6bXVqZFA1bkxWZitOU09oWlJIOTJQaFMw?=
 =?utf-8?B?RDE3a1V2SVFoaXpsQ2NvUmY4WklJVGdDT2xaOFZFZUdpUG5pSVlmRHAzUVVC?=
 =?utf-8?B?T1o3aU9pR1hBR1pqaStlOTd5YnkyWDdUY1ZpVmFxMVZzRXBMYWxhMHg2ZUZz?=
 =?utf-8?B?MHlOMnZhWkZNUndzU3RacXl0bW9hQzF3ZEhmK0ZxSmtlKzJoQWUyd2dvNEJj?=
 =?utf-8?B?b2lXakVoT2NPU3piQ0dyTzRmMGtjaStSY2IrdmQ4RHgyLzlUS0FpbDBFekl6?=
 =?utf-8?B?WW5taldrTHp3WFdaUXJDeDFxM0ZDR0doeG1ZSlZMQVVEclNpNWhmaUFiS0sr?=
 =?utf-8?B?bCtSbHRWVkd6VTA1Ui95SU5CbFdINjROMk1EekNjeHp6cHFtN2VFdHBzelRv?=
 =?utf-8?B?N3BCcVYyWHlOSmMvNlVPNWtObEFIKzhmbHdodzlWdi9HMzVaUmR4SCtyVFV0?=
 =?utf-8?B?L0pMVWw4Wm53cmN2MTFNd2diSUdVSzRiTXhUT2RtenlrYzZ6cFFnNE5qaTZq?=
 =?utf-8?B?ajhieGdraUxRN3prMStCOWFVVGZ2UDRUR0NGaUtPcFdzQnpKYTduZllVMHhK?=
 =?utf-8?B?U3YxZXUrOFFnakdhMWFid0taeCsyMkU0eVozczZZVDBjMkRIRG44ZXhMRS9s?=
 =?utf-8?B?WVFDQ1RQZlQzQkJFWlJjbHJQL2RYZEtrblVwNGFyV25nWFJnRzRDTkhHUEFV?=
 =?utf-8?B?R1lpQ1ptNkYwYml2aExyR1J2M2p0NGtra3JhU3FyQ2M1ZU5CL1VyN1hrTEVN?=
 =?utf-8?B?Znd1RjBxVUFBWW9BN1ZhRFFBRC81VXJUS1pQNkZhQkRoc0huWC9CNGlIUEEy?=
 =?utf-8?B?OFdac2ZyTERPYm55SlF6TGY1bzMrbnRGM1pJMjVNdmFtNVpTbFg4bS9URW1M?=
 =?utf-8?B?Tlp3VFR5cW1VMTJwcW81cWo5bGlNbUphT0l1VVdCblpNUXUzVDJNcno0WkVD?=
 =?utf-8?B?TndTck9JaWtmNU5vQzJqMjVLTW9aVlM3S1I1d3B5WjdEOFZidkRTczJMSDZY?=
 =?utf-8?B?WTBLV0dZM0o0VERUTnJQVU9DUG80Y0xhaUErZlQxeUJpRUdCNlRzZ25HM01m?=
 =?utf-8?B?VXdENXh6TERRd1Fzb1NrVlNHYU9QRW5FemUvODZBZFVZODNnT0lOQ0Fxb2FU?=
 =?utf-8?B?enU2RHpKUmFKUmc3WkJoL1Y1b0tHbUF2bmFUQjQrc3JCYkdXMmJaVWdIckVJ?=
 =?utf-8?B?UmlxNk14azZkdUZSUWdVV3UzZ3ZUTEJWYTZoWDFLa0F3U08yV0xTMFordG5W?=
 =?utf-8?B?ZmIvVXNMalFscjZobkVPVzlmUjlLWHFnTUExb2oxRDZESmRJcjFqSFh3R2xF?=
 =?utf-8?B?Qkt1MmIxejZmaDNJSlJqeTg5VWczWVVtTlZCUVFyMHJ5TlZVSlB5NkFMYmtk?=
 =?utf-8?B?RzdMQVpHbFo5a1doMHllVWxxbG02TkVNWnhTYTV3Z0VJWkxlY0s2V2Q2Tkxh?=
 =?utf-8?B?ODRTblBwbWY0L1lRVU03VHhnZ0FiTGJUYStpRTBNOGZ5S1puYitDaiszNm5J?=
 =?utf-8?B?djQ2R1V4K3poUDdPUjJiSjdjQVp0bUdNMnVIYnhKSU16eUZoRThMREpmZkhL?=
 =?utf-8?B?TTdvWDhyTlZBVHhuNVQySDNyTytiOUM0d3RTZExVdWo1UUlyVGNzdTlVOHN0?=
 =?utf-8?Q?OGie1vn1fFFxPGC56sm7MpNRI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E15AE7D3C29EB64094189CC352097908@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba79f0d-97d1-43ba-b493-08da5f3d6099
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 10:50:44.4207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: twlKsq3WN0y45yVHlyCmyS/uCtdW42VV3HMhaiAutQHRaG9XPyIVXGszu/P6WfRrqXkQLWjdDD8dA1YKWpCWnF2koUEj7eQ2q4aTdyvXWbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5963
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDA2LzA3LzIwMjIgMTE6MzIsIFdvbGZyYW0gU2FuZyB3cm90ZToNCj4gV2hlcmUgYXJl
IHRoZSBiaW5kaW5ncz8gQXJlIHRoZXkgYWxyZWFkeSBvbiB0aGUgd2F5IHVwc3RyZWFtPw0KDQpB
bHJlYWR5IHVwc3RyZWFtLg0KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9t
aWNyb2NoaXAsY29yZWkyYy55YW1sDQoNCj4gDQo+PiBJJ2QgcHJlZmVyIHRoZSBsYXR0ZXIuIEJl
aW5nIGNhbGxlZCAiY29yZSIgaXMgdW5mb3J0dW5hdGUgYW5kIEkNCj4+IGRpZCB0aGluayBhYm91
dCB0aGF0LiBpMmMtbWljcm9jaGlwLWNvcmVpMmMgd291bGQgaGF2ZSBiZWVuIG15DQo+PiBmaXJz
dCBjaG9pY2UgYnV0IEkgdGhvdWdodCB0aGUgZG91YmxlIHVzYWdlIG9mIGkyYyB3b3VsZCd2ZSBi
ZWVuDQo+PiBkaXNhcHByb3ZlZCBvZiBoYWhhDQo+IA0KPiA6KSBXZWxsLCBkb3VibGUgImkyYyIg
aXMgbm90IGV4YWN0bHkgcHJldHR5IGJ1dCBzaW5jZSBpdCBpcyB0aGUgbmFtZSBvZg0KPiB0aGF0
IElQIGNvcmUuLi4NCg0KWWVhaCwgYW5kIGl0IGlzIHRoZSBuYW1lIG9mIC9hbGwvIHRoZSBJUCBj
b3JlcyB3ZSBoYXZlICg6DQoNCj4gDQo+Pj4+ICsJCWlmIChpZGV2LT5tc2dfbGVuIDw9IDApDQo+
Pj4+ICsJCQlmaW5pc2hlZCA9IHRydWU7DQo+Pj4NCj4+PiBIb3cgY2FuIGl0IGhhcHBlbiB0aGF0
IGxlbiBpcyA8IDA/IFdvdWxkbid0IHRoYXQgYmUgYW4gZXJyb3IgY2FzZT8NCj4gDQo+IElzIGl0
IHRvIGJlIG9uIHRoZSBzYWZlIHNpZGU/DQoNCkFoaCBzb3JyeSwgSSBtaXNzZWQgdGhhdC4gbXNn
X2xlbiBpcyBhIHUxNiBzbyBjYW5ub3QgYmUgPDANCkknbGwgY2hhbmdlIGl0Lg0KDQo+IA0KPj4+
IEhhdmUgeW91IHRlc3RlcyBTTUJVU19RVUlDSyBhcyB3ZWxsPw0KPj4NCj4+IE5vdCBzcGVjaWZp
Y2FsbHkgU01CVVNfUVVJQ0ssIGJ1dCBJIGRpZCB0ZXN0IHdpdGggaGFyZHdhcmUNCj4+IHRoYXQg
dXNlcyAiemVyby1sZW5ndGgiIG1lc3NhZ2VzLg0KPiANCj4gR29vZCENCj4gDQo+PiBUaGFua3Mg
Zm9yIHRoZSByZXZpZXcgOikNCj4gDQo+IFlvdSBhcmUgd2VsY29tZS4NCj4gDQo=
