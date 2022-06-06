Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 377D753E826
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 19:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbiFFI4m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 04:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbiFFI4m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 04:56:42 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F0D16ABFF;
        Mon,  6 Jun 2022 01:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654505799; x=1686041799;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8kMI8BhDRbpq+jgiFSIWdeBSQL0vyYbxbbPQptnjzJ0=;
  b=uNKuEfyplMyaih+kdxZpEj2TzZvB07AkgGkrLQUAFhqquN0Cs4Q4TyFA
   mnZppNObpQVZEnRj/MmO9Pq0KABLvVn5hVHfjp1hHcToSeRADS7J2ijZj
   f+hA9rqPYIGiHUvqCuVR1qQm6FYbhnx41YlVDy2shKpLnhkUZIMcaokU2
   jDRL9N62VSiLt9vrZrFuyOXCNJcO0pQ3dm6HWbcfN6iYmcf6Ieo3Tnokd
   dB5HRqevvJgftVcJ+oUIcOPPQFv4T4J4xwC/97TasHCeEvw+jia5ZJ1R+
   rzAl1oEn6EVg6DgyBWZyYnS0O/9i4Ezk97TcIw7Hw1UE8AXXnYmmQKN3m
   w==;
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="176656311"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2022 01:56:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 6 Jun 2022 01:56:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 6 Jun 2022 01:56:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IL65//RxM41CTNb29fMaISUugN0R4ytwr8QvQhKG4HQGbeNgGFJAEwviCl986IX47es1aHVsdQNjKT45vUSm7PLMqrSAwZ5+iyKw/rlG1DQ16v8VsCQzJqKXan2CY4yN159XunQ+vW4RXNDYOUIxOFwvBvfY9DFOkYoKpcD49qL0IMgtcBh8MPsY/P2/QSTV9BCEl1VEDZa/3jUJ8LWCvWiiUabsiZAKb16RWQR8WGUJNo62kbTElcBicKAjbfl0qnNQRORFvPKoHVnUjxyfeIZAmfOeNioeaSXqWIDo+7tQOeaH8SbbeMh/WlG3H70jaX286RjCMuEeLt/K3Jfj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kMI8BhDRbpq+jgiFSIWdeBSQL0vyYbxbbPQptnjzJ0=;
 b=AANLfAsqI4uGYYrlHX4psChiy1i/buDh8lsTXshTk3mHSlgoKLfvQTU+7qqulHADkaij/Js99ogkErsFkSbnLhd38mEQ5JcFYb+0xS0836qeZq1LGaUVXvCr4BTiT/sdsj2732cwOnsw7Y6RjyIyy4VcLIKC3kPEOJF6GKyqI/Yd+KpVkWZhee2APyxC1VNy0gCSE4NPeZSJWfKz94hjOVFe7utwWMG+ArBqDho+O5SvLx6YlF4yVgsCV5/Ix/E+6KOTDvg7lBE0IioFMF8rrDxNremD2bKX3BokboEwycmJbrV9I7IX31oSvAvNyAqEOJoFrbCqfH5T8wIWcOZHQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kMI8BhDRbpq+jgiFSIWdeBSQL0vyYbxbbPQptnjzJ0=;
 b=mimY1KkxSOlXHIy3YrX1TYbIpQHau58njhj2cHTeg8TVYM9wHN4D82ueFWtaoxEPQGaTRjloVh2hZjtecUS9hGEaEkOtlOpWx8zqegiRlyPOXfSh1/LDYJxsn5dQHDZ1O5qDGGWxZEoWSQK81jXMktrhC++T661eJzLB8ufSIzg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB4442.namprd11.prod.outlook.com (2603:10b6:5:1d9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Mon, 6 Jun
 2022 08:56:34 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 08:56:33 +0000
From:   <Conor.Dooley@microchip.com>
To:     <krzysztof.kozlowski@linaro.org>, <mail@conchuod.ie>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <andrew@lunn.ch>, <support.opensource@diasemi.com>,
        <lee.jones@linaro.org>, <ulf.hansson@linaro.org>,
        <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
        <aou@eecs.berkeley.edu>, <stwiss.opensource@diasemi.com>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <atulkhare@rivosinc.com>
Subject: Re: [PATCH v1 0/6] clear riscv dtbs_check errors
Thread-Topic: [PATCH v1 0/6] clear riscv dtbs_check errors
Thread-Index: AQHYeODW2OU36xDso0aJww5rkERxbK1B/foAgAAW6IA=
Date:   Mon, 6 Jun 2022 08:56:33 +0000
Message-ID: <65293aa6-be67-cf8f-08c3-ee7e43300a88@microchip.com>
References: <20220605133300.376161-1-mail@conchuod.ie>
 <a83be47b-4cba-e397-51ba-c2093fa0d46c@linaro.org>
In-Reply-To: <a83be47b-4cba-e397-51ba-c2093fa0d46c@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f8eba91-5896-4054-0ffa-08da479a74ef
x-ms-traffictypediagnostic: DM6PR11MB4442:EE_
x-microsoft-antispam-prvs: <DM6PR11MB44427988488A3F361B9557C698A29@DM6PR11MB4442.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c7XmrjNR6lOYENRivfXx3YNcNdHP2BssFSBPKQRIDHA3y8NyNS9hxyk1WtiAr/bAyKMDuQqmaQs1320yQE/7HPvbdyzxJ3k3b0BkFlEc9LIiyCTX7ygrjh/P270woOMIV4zHr2MtJ8XQ/2RV5UDFLsKDLHeKt+iOgonUQBpk8THrt3nxA+bGBblPImcQOdI8TezLL2jO7pb2/872woDmYmfpwkA0hv6o950pFlxHA/r3O4LFBNnu5JxIQLJZ36q9H1141A6aYyXhEEMcf4TS3rrQhoqzvAN+BshS/u9dRoKe4ngeR1Ojj01+nE1Nbfi0Nq2dkF+uNd0sUxa+RBT+YqhenoQfMt8i7d+2kbhyxZHMGhQLP7Cujk9+DmBo+TMVROyv+XKn8iDj73I2h02QbXgwfiHcTRSdQET6yJOcIvoM3izsdp7Ih08AU2yc5IyXNP9mU55guAqcvSEOJM4+jtDRwO1iopu4GJ7KmgyVZpcKhuqPERWq3bKGxSiM6zjyGUVtk2H39n+nEakLExICraVFv326mldqw7y997VTZiYB1KxEZUfGvpI92tzWjlDn+S8Ea60opbVB9WfLURt4vMLABAIWqIANaZUyedrVZnxGAboiRqJpqTX5Ovmrlw7iBkBEjVhnMr2PbWv4vd6gYRlv1T1sYfM0iqKBGL7cAm86oaHf2PiNl+lZLWhkI20Lr+u7shz7SSYcaQ/5fWE7J6D3gOR2dFvq6bK1/xIgPLv5oWPKoeq51eybB+Dd2V7Fi96IQTf1lKjLcYWT0h91h7imrfVPyV9a6OKfzfzhAdw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4744005)(31696002)(66446008)(64756008)(66476007)(6486002)(66946007)(186003)(76116006)(86362001)(66556008)(6506007)(8676002)(53546011)(4326008)(83380400001)(38100700002)(8936002)(31686004)(54906003)(36756003)(71200400001)(110136005)(508600001)(122000001)(921005)(6512007)(7416002)(2906002)(26005)(91956017)(2616005)(5660300002)(38070700005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eC90R3puWVpCVXFQK2VLTEU3VzdHL0NUWXJ3Z3F2YkFWL0tNajhCQ1BpN05p?=
 =?utf-8?B?YnQ1aDRrQVNzNEVrbmp1UmVHMFkwaFI2RlNpZ3k2eEdxVEEwUHBzcWZGSGpj?=
 =?utf-8?B?M3RXdlBEY29vVXpYSnhYa0pZaGxROHdHQUdrcFI5bkdUSTdyWk1odGFkdkRt?=
 =?utf-8?B?RU8vRFdiZGtZUStEWEhQRGFYTHpJNk94WnNML0FsZ21ncWpKeHBFRS9FbWNP?=
 =?utf-8?B?NmVmbUNoNjhtTTd4cnVHWUQ2U0hsVkpuMEJzWmJNVUs4MWpBZlBhMmpUNnZt?=
 =?utf-8?B?UnRnNVBWWWtKYTBTSnlNQVFaRUFiTG9xM0VveUJDS2g2UXZ5czJkblE0bkE4?=
 =?utf-8?B?S2diVlBqZnBMMWpQSElqK0pYZ2FvSzUzcEdjMmY3WmYwTTNLMFVzMlZ6Vkl1?=
 =?utf-8?B?OU5RRHg0T3VsajNSSEs4VkNrRkx2dFJNODQxcndKVVhPb0ovWVBteG96aDhJ?=
 =?utf-8?B?Q2dKYngwY0dSbXBnVWJTdWcvZkdvYVpMQkZqa2hyNHdtRS83ZCs3THczRkRM?=
 =?utf-8?B?TWxjZjIzOFJSQWI2T1k4WFRCcmlVVWY4bFJxbVNTdHJmZ2Evak04MzNvZTNY?=
 =?utf-8?B?NlM1aG4zSTVMcWZCQlN5enFmb2Rac1hPR2I2N2pqWityV1BCbkZWMy9KOVkx?=
 =?utf-8?B?TFg5N2FCRHN4bmwxTDVKSHQ2T0FhcWUxdjVWdnMrT2cyQjBIT2NpVTNacXFz?=
 =?utf-8?B?cnp2L1pJdDlMdUNneU15aVQ4R1BoeWU2WS9kQVVWTnhaQVI5THBjWVFnQTd0?=
 =?utf-8?B?RkZTaEQ5dUFmNU9mV2IxVndXd3MyeDE2S2lQalJKN09GY1ZXZms5UGkvN3hF?=
 =?utf-8?B?djlTY2Z4dldzTGdHMjVvL09COWdzZE51TS9PTCtPRGtCcTVmazBCdXN4QUFN?=
 =?utf-8?B?Z25XenAvdkdXL2pncUVWQU9kWXpkZ25HS2lEZXNPd01uYTZuYXVReFNRMGlU?=
 =?utf-8?B?UWxPeVEzWVpxR2ZzTGZ2ejVoYWZkb0kva1UyUSt6RWVURityc0Nhd2NyTUZv?=
 =?utf-8?B?TnNmb2RaUkxMM2J2R3N3TTBFdklLMnI4dnJCdG9OZU14d3gvYkJLd0s3ck1J?=
 =?utf-8?B?RnhRSzczYnZEQnZaVHBwMWJkM3hmNEdZRFN0Q0NmdzlIWVJrU0h1Y3pBTFNP?=
 =?utf-8?B?eEF0UlZ0NWFLZFdycm82MUR5SVB2NmFRRjh3ZmQvL3JOaFBwbnlOaVFiQktG?=
 =?utf-8?B?MkxSL291MVJUeS9GWlM2VnJDb2FkY2dGL2JPMGxHRlVWUW90QnVFQmc5THV5?=
 =?utf-8?B?b0hZejZDTmRGcVJVRWJRY3B5ZWhPc25NT1p0NDY3ZWd0ZWMrLzRPVElrRkRV?=
 =?utf-8?B?MlNaN3BqU09UVWt1RFlJOC95cUhZcDhiak5wZ3lKOWo3NW5CczRya1l1Wlha?=
 =?utf-8?B?djVXSnNVM0VNY3RWQ0FJV0tPbmJKSDRGNmRXSTZVcXMvN0pPTDBIZ1lWNGw4?=
 =?utf-8?B?UmxJV1lEeFZnQTByTG1iNTd6MHA5ZjhxNXZOdFZCcDd5M1ZqL25HektDRVhW?=
 =?utf-8?B?SDlQTFlnWk54bEdzNHRHMWxVaEFFd21UTXk5THpFbURKMEljMzdGemhHc2JF?=
 =?utf-8?B?V1hlaE95SXlrZFgvd0lFL1N6OHJXSjZKU3YvS1huOVhQUVBqZUdQcW1QdUZI?=
 =?utf-8?B?Q2dLR3p4RUZLV0JmS1p4QnBuN3hlbXY2TkRBcVNaSUJWRlJ2blA0bU1BTzYr?=
 =?utf-8?B?Qk16ZkdUS0RZanRQZkpsN3lHVU82N3UxcWxBZURFRk55aGhCdDhGQms5NTho?=
 =?utf-8?B?M1hhK0xpSlh4aHlDSWhFaGw2eUE1OG0yek1NSEd1dnVheHhFd2FQbm5oTUNU?=
 =?utf-8?B?L0g0bEJHSnVQSXdmQ1FFNkp4Z0g1Nk0vQzNNTWRzKzFQMlVWaThwYW9uL0ww?=
 =?utf-8?B?MUV5QmQ2RmFDbldhVkF0akNlQ3QyNDNHakRoTXl2dlNiV0wwaFdDU3g1emdn?=
 =?utf-8?B?VnFSSHc3TkJSVHpyWGdvNmFCM0lVaUhVMXFaK2lWVW9qNEd1cG5Sa1dvTGpu?=
 =?utf-8?B?VCttb05PbGZGTjh1RjZLT3E4Qi8xQm5iL2F6WUdmSEZjQUcwb0FLMDIvWHhT?=
 =?utf-8?B?cXYvczRUbEEweXhhMTRhbVB4Y2ppdHRHc1N5VlNiU2Z4VmpaRWJOS0hEY1ZQ?=
 =?utf-8?B?ZTJJeitoY3V6Ykc3NVUrRldLOVlTeE5jWWRPNUJpRjdWNFloTHNlQ2g2MkZN?=
 =?utf-8?B?Z2QvVlFWSWFIS2dCTU9ISUlISWxzdEd1NC9FeGFXa0JuV3lmVzVQQm1aWjB6?=
 =?utf-8?B?ejVIc1Vma2k0TDdxblhieDF2allEVm1JNWkxempoMzFvSi8zZDRrTnVPU1FG?=
 =?utf-8?B?UVVaQ1ZrMGFPamtrL0R6cVFzS21kdlZDUnh2N2tTL0ZDN2x4Nm5JYzdBR2Uw?=
 =?utf-8?Q?yBgp3eFZBE3q57Uk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA20B7979946734DBC5FF7423B17700F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8eba91-5896-4054-0ffa-08da479a74ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 08:56:33.8550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o2wS2h+zOXGgQxYwEneEi9Es5Dijr1wciEPjYVZjAW9EAD5HvQjTjiqu5z8VHwCQgzNxmLEF3C0YGL6eEEIqirRmSHgo0iyLV/JE8UZMcXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4442
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDYvMDYvMjAyMiAwODozNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAwNS8wNi8yMDIyIDE1OjMyLCBt
YWlsQGNvbmNodW9kLmllIHdyb3RlOg0KPj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4NCj4+DQo+PiBIZXksDQo+PiBDb3VwbGUgY29udmVyc2lvbnMgZnJv
bSB0eHQgdG8geWFtbCBoZXJlIHdpdGggdGhlIGludGVudCBvZiBmaXhpbmcgdGhlDQo+PiB0aGUg
ZHRic19jaGVjayB3YXJuaW5ncyBmb3IgcmlzY3YuIEF0dWwgS2hhcmUgYWxyZWFkeSBzZW50IHBh
dGNoZXMgZm9yDQo+PiB0aGUgZ3Bpby1saW5lLW5hbWVzICYgY2FjaGUtc2V0cyAod2hpY2ggd2Vu
dCBhd29sKSBhbmQgd2lsbCBjbGVhciB0aGUNCj4+IHJlbWFpbmluZyB0d28gZXJyb3JzLg0KPj4N
Cj4+IFJvYi9Lcnp5c3p0b2Y6DQo+PiBIYXZlIEkgY29ycmVjdGx5IGV4cHJlc3NlZCB0aGUgbXV0
dWFsbHkgZXhjbHVzaXZlIHByb3BlcnRpZXM/DQo+PiBJIGhhZCBhIGxvb2sgYXJvdW5kLCBidXQg
d2Fzbid0IGFibGUgdG8gZmluZCBhbiBvYnZpb3VzIGJpbmRpbmcgdG8gYXBlLg0KPiANCj4gSSds
bCB0YWtlIGEgbG9vay4NCg0KQXMgYWx3YXlzLCB0aGFua3MgZm9yIHlvdXIgZmVlZGJhY2sgS3J6
eXN6dG9mLg0KDQo+IA0KPj4NCj4+IFdhc24ndCBzdXJlIGlmIGEgdHh0IC0+IHlhbWwgY29udmVy
c2lvbidzIE1BSU5UQUlORVJTIHVwZGF0ZSB3YXMgbWVhbnQNCj4+IHRvIGJlIGluIHRoZSBzYW1l
IHBhdGNoIG9yIG5vdCwgc28gZmVlbCBmcmVlIHRvIHNxdWFzaC4NCj4gDQo+IEl0J3MgdGhlIHNh
bWUgcGF0Y2gsIHNvIHBsZWFzZSBzcXVhc2ggd2l0aCBuZXh0IHJlbGVhc2UuDQoNClN1cmUsIHdp
bGxkbyBmb3IgdjIuDQoNClRoYW5rcywNCkNvbm9yLg0KDQo=
