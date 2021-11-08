Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C82447BE8
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 09:35:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238051AbhKHIiS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 03:38:18 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:58154 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238047AbhKHIiR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 03:38:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636360533; x=1667896533;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=tMUlLKkWj9nWceFpU3jhis80olEB45er0iMCvQ6ZPaw=;
  b=1tZmyRhH1uaobFKzg2sGghoK4V5Qigp1VplMqmXvWgussjfbJpRT83/i
   O6Vlx+Aqro6QhGvK3rlpUvZbsaeIFb5JYOGPchV54IaTQWxNPbt/Yi5Wo
   JKqhBEEw1JAuU2Ihz5mIZqLaZUIm3uB2PCPOJh8IqGtNuYt3p+iKhLK5k
   e6fWre6iaj9uxyQvznNeaoujXAejGGZpctm+7EBMIqPo75aWLMWbAryO8
   1MMGbYItles3FCMUa9Hlp9JLXrdY1u4pfsV9c8+r3amrLZTlaB5FGt9A3
   gI7iyqWl859OPLWn9Wvps7mW/rEmZhWuftm1avTccPXRsUW9zjoZJdptO
   w==;
IronPort-SDR: pMaulNJ2H3oPtev6LEBmpnF6Xb8+MrCFgmnZpmPrAtOkvFY5bEl5Fqky1za61ILyMGWyeeasuE
 mkZahZyCix6JR4eQOfpsGJNGCZlAi+yEtCVj2CUKKNd0t7AS92GqhGYpH5x1IHZq0rYrClYMyk
 ny+iFw54vKDXtlILpfzFFjA79XxruDQC5BtdEg5UMzgPLmpNET+wv1Yw1JBJ12MMWEPb6Docx2
 mzfF5NsCeXBXtSjo6TBLy0qxirErCqnJF8idq+aP9oJc+8DOi32M7beYW4u2FcjtAaAJp4JsYA
 vgMi7sXfWcy94QsWdbenHBWP
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="135789478"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2021 01:35:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 01:35:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Mon, 8 Nov 2021 01:35:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLlhHmZbXRi3AwNFuKXCPttEaEeLW1frN5NGv1fSvZGo3dZPixixwqKv0/9q7A7YoB6hkvKGb4G4kv89cYMN28fexq27Ge0osjUB4KwA2gFgQvvIdUsRROFRn9mCUQ3W4brLQr3TXe8VhTXNHULkDVQgrhAMADRWtA2pHXhwDAEiep2EVDruIknr+CmDC126mAPSbV7AiVGC50bKM2XhzwMQmrtpDCOwl53mAee7fkC5yXv/USfY08WBknJLk4XlfC2gyxtDNADj4RGBmaTG6hjIdNrjG/iK8ggphHKCcV4Yn684VlTJR5S1gz7wlbUDPjy9u8xSGLglmd76MV0Mwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMUlLKkWj9nWceFpU3jhis80olEB45er0iMCvQ6ZPaw=;
 b=DiirBjEagIvPejQOOCrqIqsrGj8cwDQ3CmgmLyjMZ+/JMAi12P9+lvmkhsxj2V8dX2C+HvS4IZHjL4+yRB3MVmzvutJT/TRaBUAuYoFsTQ4PL1IcDbdpA22jqS7XydSt8PsN+GI02+KkUs6RfihXvbX6+EzimQ/fZl46gXYulUzTJBjHWYHUoPDf1ooAvMYv1shMWGOF2PBD6aGSsXIYIm5wwNFJatyAS2qh6zXRgp/NWrxF+5+4jpfZJJM5IWrCjz8MAtG//b/T3WF62jtwrQqlPnVQyj256dBzgiLExUUI0jEYC30N0ALBiVnH6qI/PwwKN2DDh7GyN1HWwNCPRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMUlLKkWj9nWceFpU3jhis80olEB45er0iMCvQ6ZPaw=;
 b=V5QsaK/mdi29nRYv3nAC21sZh7iFVFj+M0VY2ZL9ppx964QxpPRx3r4OCCjxKs2WQjpIHwO4Zg14wHRy5How43CNtNkk6OQG/a9VDqgDnhvtWM4n4R6pS2DMlcdqMHlhzyAiKpUlB1SwAiWZTWD//0umgPFWbihjgyD9bmdCxnE=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 DM5PR1101MB2331.namprd11.prod.outlook.com (2603:10b6:3:a2::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10; Mon, 8 Nov 2021 08:35:30 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::50fa:94b5:51bc:6409]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::50fa:94b5:51bc:6409%9]) with mapi id 15.20.4649.020; Mon, 8 Nov 2021
 08:35:30 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <wsa@kernel.org>, <Horatiu.Vultur@microchip.com>,
        <robh+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] i2c: at91: Add support for programmable clock source
Thread-Topic: [PATCH 0/2] i2c: at91: Add support for programmable clock source
Thread-Index: AQHXv3JagbJxWnjRXkiEtRVe8te35qvQn4gAgAAwKwCAJM7OAIAD2cWA
Date:   Mon, 8 Nov 2021 08:35:29 +0000
Message-ID: <eb2120c3-540e-64db-8b70-c2b29f23e3cc@microchip.com>
References: <20211012140718.2138278-1-horatiu.vultur@microchip.com>
 <8a775c67-00a3-1dbe-daa3-09a537f482d8@microchip.com>
 <20211013114144.7j4scdaq2rjfmiwn@soft-dev3-1.localhost>
 <YYWmZMc8eVq5SZYj@kunai>
In-Reply-To: <YYWmZMc8eVq5SZYj@kunai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3ad9e1f-962b-42fd-3833-08d9a292b8fb
x-ms-traffictypediagnostic: DM5PR1101MB2331:
x-microsoft-antispam-prvs: <DM5PR1101MB233145021DC9179E497E15F4E7919@DM5PR1101MB2331.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5iDFNdAukv14fRI+B1SvxcvI/uFq0QuNDl+69wKiEMF0xIbX3Ka7whEXaYHFxXChw6edzZIdWgCD7ghfQMMvN7VCAoKDWbob28tek1JNRpOWe1mudXwAcdLkWftw2JhdX780Dgr1urLHJanaXha0xhOY6krUH9d19WexVPg7FynfRe5vtmQ3KXyaZ0VNF/glv2KvVoc0oIlZ10s8az47Otlq5ea30K6YqsK5qns/CIL4uSy1sfKKXEXlhYuTHh+u1qirDxJMqo+jRrGmo6ptZSN6fA9IjPqQs/8dGZ/Pl3sFubVIDEmm1/4IG5NsgMlwbDcwAGWhZdAiDnVeC7SX1IF6QRE8nLARr4v/QijdsCPUsjQbSoF6M7tEM2Vg5JDry7ZEhCgTsegdI+Zpls1+XjqgOfMZRZzeNSui8a/1JsrNzbQvBol3DD+QIJsNXBgcytf+NGHtHuHMmfdATSfmNltEwHwJBiOPeiHATYw8Lf2UuW13ahBmKI9RGhN6Tr3YrCXeA0SofWes7YN8e4T1Fe3PAYCc9FCmypon8+cZzuKoFi8NKLU/CaM/O0/nEV3hXMU3gXubxBxLEi+uk+WXfdL5BhSf4dtdy7e6UUYGhBekdqAOj7lck1HK7QnUtpKhex/NMVIIFfT9blC9Y+uNlgNQZzrhCZ5g6Ck7J/QEtxAfSXiwbIcyG42MXGPdYGmPRjuAtE/a0CjLbuzusTa4cogknntTLzvV60zux7bixTSo3FJ5zcvMNiflhmfLaLkF8cgb9x9UNbCpBL5gjPsHrG0MULu6yEjaEPidMLisZhY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5687.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(64756008)(66446008)(66556008)(66476007)(91956017)(38070700005)(53546011)(5660300002)(6506007)(83380400001)(2906002)(2616005)(186003)(76116006)(66946007)(8936002)(316002)(8676002)(508600001)(921005)(4744005)(110136005)(122000001)(38100700002)(6512007)(36756003)(31696002)(6486002)(86362001)(71200400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFJqc25YN3BuVGZGSWVFWWdKUVNNN1Fxb21tUXppSGtDNjVGRGovVHZBVk9B?=
 =?utf-8?B?QUg1UUMwZW9JckVzZjdyaW5YNHlWNStMeFRGS1k4UzZKMUI5YmN0WjFUZ0NS?=
 =?utf-8?B?RWNWY0pUcHd3cFVwTkRRWHUrcVZ1czNsYnVvS2l1ZmE5ZVhYTlNjSVZZRWR1?=
 =?utf-8?B?QXdSa0RCNVhVM2lyVjBGWllnN3kzcEt0dC83T0ZON3hhbGxtZEF0WXd4Vkk3?=
 =?utf-8?B?MGwyZisvc1J6QVVCMHpnOXB5dERpK2ZvSjJ3SytmSURCeUxzWnhaSC9WVWhX?=
 =?utf-8?B?bW4zN2J3R0N6dHo5TGpENkZtR1lzVFcwOWlFWE5uVzNHSGI1OXNZcTJEenJu?=
 =?utf-8?B?ei83NjVIa0hZZ1FjbWJTRUw2WEdPVi9yWS9DL2tpNy8rMG00YUR6RXpLd3pj?=
 =?utf-8?B?cWZycmVvaVVGL3dLK1VnS296OGE5ekx3cHpxdy9SNHdocmRPdXFQSXkrR093?=
 =?utf-8?B?TFdwcGgxRGd5NUxpUExHVmxGYkozV2tWY2Izb201c0U4SEYwU0crQ3ErOGFI?=
 =?utf-8?B?ZkU0aTRqUkpPOWw1MENuQlFoMUhVMXBheGJ2aDQ4UmdXY2Q2cWtQSHdncFd1?=
 =?utf-8?B?RVR3NWtLalRnajZlZzFMb0pkM2pYSEljdUhSRXhhTks3YUd1TDAyQUhKYzlQ?=
 =?utf-8?B?NzA0bWNnbHlWTHhQY1d4UDZyMjNvSGNGV3BRWWExNDJZdUZ6NlQvUFpva2VZ?=
 =?utf-8?B?QmlQN3dOZHhZbEJwQ0dlNjMyY2FKZko1dTVuTXdzRnE3R0xaRGtDSnl0Tzll?=
 =?utf-8?B?Smh5M0RTRlduWkhVRnBuOGxhZExmdE1FQW9aWUVMaHp1YkdCemZveldNOElK?=
 =?utf-8?B?UkZnTHVKL01MemExUjd6UkswQXRjSklGaHJFQUZpaStxdmlzNkg2eDBaTXNR?=
 =?utf-8?B?QUMwaURuK1g3bExDbVhuRmMvVjgxMC94ekp5ZFJYRVk1SDBVQklNVzdXRHo0?=
 =?utf-8?B?UXhOS2tZSzRhOVBENHd2V09YVjJ0bnRXVk91MmlubG1hSXBxZFBvNk9FMlRX?=
 =?utf-8?B?eS9nK0JxN1JXdkpKeTFodGI1aGtySmJMQVNVdW5FOFdoNkdDQWJmSlhHaVdO?=
 =?utf-8?B?K3ZxeWoyVTU5TUd2cXNwdWlVK3plT2lMQzFtTTNnK2hDbFh2VHZwMnMvZVFH?=
 =?utf-8?B?WldlSTVURUtqMEYvb1FXK0hqNU1MYys5cmVIeTlabnFwS0Z2Vk9LWWl4MWlj?=
 =?utf-8?B?TDF1UkdUNjhEbjR4VjR1a3NSVkNGMmt6RzRHR2lVT0xrMkxDMU1jL2VFZkcz?=
 =?utf-8?B?RDZKZVVxSm9wR3c1Sjk3WjBSdmRMTkY0YjRocWZyeXFqRWtUS0VXa1ZyNDVF?=
 =?utf-8?B?YnBrK3RNd2VqOUh6VzlBeFZFL2h6V0RnRWszT2toQnp0WE45L3haR2NCbXNH?=
 =?utf-8?B?N3lsYmFUQzQ3MkVYMjVnd21zWkFwMkJjd2paYno0b1lYbVYxWm9walVYSWxQ?=
 =?utf-8?B?MS82cUZzUW5tZERNZXJXK1ZXaWd3NnRKOERCU2JkTXpQYkRLRHZreHBYTDZm?=
 =?utf-8?B?U0FrVWxRZUF3YkpNOVk2NU5nd1FMQklRcm9xeTN2dlZ1RmNSMHU3TzZXUS9U?=
 =?utf-8?B?Z3VnTDh0TVEwdVdXRUdsOS9yTDlTTjNpazZhRUpoSFRTaTZzUUNXRzg3elNW?=
 =?utf-8?B?ZFVsYjdjenJyVkNrc05KcHphQXp6QllGMXRPdDQwRGFrKytSYktPN1c3eTFk?=
 =?utf-8?B?d0JjaVlLVFd0TUxQOWdHYUc1NXpseWR5cXhJbFFHenUvWnB4bExrU1NLZXNH?=
 =?utf-8?B?RU5CM3FUcnlFSkQ2V1QvTG1pbDFSMzZyaHBGTzVLaVhIemI3cWp6VE91UUdM?=
 =?utf-8?B?V2lzUEs4Y1Qwbmord0poUDdpc2RrOGVMV2RFSkJ0R0NhTk1hNEorUjBEK1Er?=
 =?utf-8?B?YnF6RGRNeUVGWEU3VERXUW5wdWZBRC9mbWJmN3gwaCtkV3FUSlpIb1psazF0?=
 =?utf-8?B?aFNqK0x2YUFkSHh2akY3OEcxeURXY0w2VTVjNloweFVzV1M1dHZ6NVhJRldn?=
 =?utf-8?B?NVl6OW5QSkREbHU3aE9CUHRsU2lTWkpTR2Niclh3TUhSNWIzTDVQZSt0MnRD?=
 =?utf-8?B?WTBRSjFlQ0lUTHZILy9VVTF4YWo1R21XRmdWdWpKRTIybStrZWw2WXU2eWQw?=
 =?utf-8?B?Um9RWXN2T1FZWjdFYW5ndkdvYk9rdERocy9ldXpHNXZmZGpsQjlyWDlnMWpL?=
 =?utf-8?B?cXZQOUJIUHNBcGU0bk40UTcwSEhFR244emVkcmJVd2p1eVRQS25FNmJPN1I1?=
 =?utf-8?B?clBJMkttMUxpNEh5M0dIcUV6c0wrQk85VjM1N0hKWVo0TVJwMFhPMitQZWdv?=
 =?utf-8?B?WUFzS2pONVVIV1JIUmNpZDM2YVE2STRwMmJqbS9EemR3QzVXdUdRQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D910704DF613846BE681A13102F290B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ad9e1f-962b-42fd-3833-08d9a292b8fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2021 08:35:30.1116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4DvJtPAZhLMY42dU3gBU9WoC5jLM7aNrqMYUH9cvlMQVJlDgiZxOm6TpictXIurrxV82RuRiA49qpu4W+eELgQO2ajoy0EExvo08bYVIU6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2331
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDUuMTEuMjAyMSAyMzo0NywgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiANCj4+IEkgdGhpbmsg
YWN0dWFsbHkgSSB3aWxsIGRyb3AgdGhpcyBwYXRjaCBzZXJpZXMgYmVjYXVzZSBhcHBhcmVudGx5
DQo+PiBsYW45NjZ4IHdvcmtzIGZpbmUgYWxzbyB3aXRoIHRoZSBwZXJpcGhlcmFsIGNsb2NrLiBT
byB0aGVuIG5vIGNoYW5nZXMNCj4+IGFyZSByZXF1aXJlZC4NCj4gDQo+IE5vdCBldmVuIHBhdGNo
IDEvMj8NCj4gDQoNCndlIGNhbiBrZWVwIHRoZSBuZXcgY29tcGF0aWJsZSwgYnV0IHBhdGNoIDIv
MiBuZWVkcyB0byBiZSBzcGxpdC4NCg0KQmVzdCByZWdhcmRzLA0KQ29kcmluDQo=
