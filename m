Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51F5F5AC930
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Sep 2022 05:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234466AbiIEDoN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Sep 2022 23:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231656AbiIEDoL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Sep 2022 23:44:11 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4ED2E9ED;
        Sun,  4 Sep 2022 20:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662349446; x=1693885446;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2qbpRpkJqnuygZwjEfB/3gRalSaUrO77jvVICRtf/vY=;
  b=jllxtmo6QwnfSgjzLD2a/76wXZyY7SDaz1WjMhGAcE6nnOcybVyPs+5o
   T41rGYBYWR+sZGpoHFYY0bGONp+bL1xsOSllrz5vL9NnG8tYVDjMenqzr
   XxrgvmlOqs3L3fbMFFbSyFrxsAoUvh5EaqMwQmP9i958TIH1jnmdtb/p9
   3d2xxAT2BFeiKa/jenNCBUzYv5m3N3H3c/kmmJOlyLoJVpci4EP1WfcLO
   ZY59nfNw7OPlgLCITzA/uEAneBH2nQJhilUucGKVjGygIO/VfqvhhQ7J+
   POWe7a2qQf3sH8PS1W1aQYHVNgI+gyhua/bSuCVLfrjIWzuehBjeYu91I
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="189406780"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Sep 2022 20:44:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 4 Sep 2022 20:44:05 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Sun, 4 Sep 2022 20:44:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROs8zzscEwVG9cUvSup+ecEywJsPtI/zOrHm1kD9k39rGOvljIFSxBcraYst1DfGr2BCv5YMK5W5cxsJa54JCA+XCK3aYalJPHHwYDKkZHfzK7BsZGcApxOSbVBqupvZqRm6H+y/i8K7H3JKPyBjhOTLNMXpU3ZW36m6Mu8XsvSsglU036ckLGdkKId0egVfHiBLAOFvN57rl4lych1fb6PS/IQWJW5bbfW457MpgC2jTLJbnF6i/IIf0i18Ds/Uvty3QECOHPJIyBwoVHWs4oQzf9H6YYzfchJJSK3sHjGtvDGVX9l4vsCOUZ6milsYXnO9EyG8pVUA6mfqaVc+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qbpRpkJqnuygZwjEfB/3gRalSaUrO77jvVICRtf/vY=;
 b=W9RoJgFy6JvENr27pNWtYu3KtWUGW2qn7NI7n0/+j+0PxAk56LX7KVK/mhg+vuzd42IWFeQlZBnU6Qge1mKK8RL41nKuN8Uxj5MaakIrAnAHuc1FSEtsXQo+Cxu6mMeTGBkqDeABS1QqHB7OmCU+KaugIJVXA2kvkXDLyqgZsgP/Lpy+IMq2y4QcQLYpNizo/jiJkZHPprxCZONZzsJV12aHqMBDr7GglFgpLdeSruWrtW7xV9lS4tvEZBZKWGFbPHMeflOOYCP2Qbd1SFhfxBQLXG+Nc1gDXfaYHzhJQuhk2IdKXRHATswHTwW6QB7w/Fk95lZ7jllrQlD3W93GEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qbpRpkJqnuygZwjEfB/3gRalSaUrO77jvVICRtf/vY=;
 b=N8y//syKJD7/Qrt1dXFqRAMcS2SScXGLamk/ACHpImJcamlp/P68k82aIUILe6bM2A+OM3+K2x9+9dtbsczaOcUpXsL+0LCmpXUuIbwVMRoQNFj1hZY7WkrtHXsXaWRxRg5M+2R4JFfjfxUUyTPIiYVFYFoMsazNEDllEAQ20Hw=
Received: from PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5)
 by PH7PR11MB5983.namprd11.prod.outlook.com (2603:10b6:510:1e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Mon, 5 Sep
 2022 03:44:00 +0000
Received: from PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::61bf:18d5:c7e7:f89c]) by PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::61bf:18d5:c7e7:f89c%4]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 03:44:00 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <andriy.shevchenko@linux.intel.com>
CC:     <rafal@milecki.pl>, <wsa@kernel.org>, <krzk@kernel.org>,
        <sven@svenpeter.dev>, <robh@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <semen.protsenko@linaro.org>,
        <jsd@semihalf.com>, <linux-kernel@vger.kernel.org>,
        <UNGLinuxDriver@microchip.com>, <linux-i2c@vger.kernel.org>,
        <olof@lixom.net>, <arnd@arndb.de>
Subject: Re: [PATCH v2 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Topic: [PATCH v2 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Index: AQHYvaNOFAimyTA3MEynxJY7CGXjha3K6z2AgAEY4ACAACuKAIAECO2A
Date:   Mon, 5 Sep 2022 03:43:59 +0000
Message-ID: <ba61fb6349e8ca708b92cd869ccf3d1b33d4f39c.camel@microchip.com>
References: <20220901013626.2213100-1-tharunkumar.pasumarthi@microchip.com>
         <YxD+NTWok2vkYos/@smile.fi.intel.com>
         <2345b4bcd0c529878307b2a84364ea849005eed9.camel@microchip.com>
         <YxIOWMqjP2+k7MPi@smile.fi.intel.com>
In-Reply-To: <YxIOWMqjP2+k7MPi@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5ed2def-8e76-4c4e-686b-08da8ef0de5d
x-ms-traffictypediagnostic: PH7PR11MB5983:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uDhuCd8YQ3wGoof+ivi5lkRHN3uI17Z/OLM8t0P7aPDJj8ngwmkZaqXfmMuQLC40vESPq9SdE0XbzPzXcDpzicJAsFhf3Oo6cuKCxLGx0pBUlJPAfBhq6nQDtBJkxYSGwPIIgW1hz3RC1ZXVyBm3BMOMbKvWL7G9bN8Bu3hVG0dFiBMzd2xcZzcpNLiBQ9CixU4Du9rJa7dQNG22xUn+znHD6LguA9xDLiVYexUMj/AU4AVi7E0Xy0evi4orSbItOCUTa9yXtKpRL5uKleBvTr6J/gS4wJS1ybG9Ymm3VJE0fXEaLMPSzrFQaj4SYYcAOMTprb/78BqhkRm2PKxf0J+ghg/0P+8OAeEDdxEnFnR2HtkeQiuRnarto37zGnmFdm6Dq5vyUZoVqrNYwhiYJDpNPc36L7gzzp+gHFVHI1WRoQLZgYJb/WWk6zb6IUhTpySkqgeekprf/V96XhSbzooKb1JrrMNaTx83tAlJ/CQC4TTxChAgxIg4yLhtH+Hvd2LuH6O3bIMNaeR615J7oJs6dl9wt9+idBv4R5u0asbcpZumxPCpJQ/WfCXkR/JAUcOAQNkF7wbzpxF2DQsMteW+AavFJ1uWrg213e02+1ebmTZjsl5W4jhvO/dSxvFPnGifWPZTvmoGTBB3kxeaEvgcZDSHMeqfkWEDBaUp70/Hroh+7KP3rJRFfGmWvQwiCuDBVySGgPQSUQDme34wgFQCP+0JuhDW+ViI6yXMxkJLKhX0bXHUzSKTUPb4bb8NwsFOJ6wvMg9bcqOZTKp1Qe1fPDiVRjYghrhhX4fqGxkcmBhb3+Ap1J0er9VizZezMyFeajOKXmeiKlfKZzNjB9bopZyLrmhdOg9iytjB+fk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5096.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(39860400002)(376002)(346002)(396003)(26005)(54906003)(71200400001)(6506007)(6512007)(478600001)(4326008)(41300700001)(2616005)(66556008)(6916009)(316002)(6486002)(91956017)(64756008)(5660300002)(66946007)(66446008)(66476007)(83380400001)(966005)(8676002)(76116006)(86362001)(2906002)(7416002)(38100700002)(122000001)(186003)(38070700005)(8936002)(36756003)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVpvL0FzV0N3aThGN21yQ3BqYzVyaGx2ZU9lczJreEIvei9iTysvajV2ckxl?=
 =?utf-8?B?aDZ3Y2NVWFdqbW12S1hDU2g5WDhzNldwZmxKSTBkVDVNTWdMSXJqbHoyQWJk?=
 =?utf-8?B?eUloSVpxRVI3eWluZzBPZWtjL1NlZVNwazBRUlN6aklRczV1VVhNZzlZc0lq?=
 =?utf-8?B?TXdqZzh4Qi9ZOFRnd2JXbmVRcitiaHBTVTFZbmM1SWdVYXVtUlJJdTBFc2tC?=
 =?utf-8?B?UGw2Q1pxdVZSKzFyc0ErQ0sxbFFyYm5seEsyY0YxNU1zVnVqVzlHeVFoeGNr?=
 =?utf-8?B?TEF2RlNBemZEZ3h3K2FpQWkvWTQzSEkrSzE4RWhmNitxWGt6OU9GRFMzQSti?=
 =?utf-8?B?ZEMxbGdnYlQ4MWQ5SWZsK1F5bHZxaWlLVVFxOURzb1dwWG52OEpQWFJpemI4?=
 =?utf-8?B?KzdPMzAzUk1aVjJLTy8rcy9wNkpSQ1dMN29TL1l5RW03emt3VU9FbUp0WU9O?=
 =?utf-8?B?NjM5NmI4RXEwRm1tRnk3QVhvNnZ3azVUcjE5bHRuT0xjdjM2MlJ5c2lJRVc0?=
 =?utf-8?B?b1djMUJIZm9Tb3VsVE1UOUZVd2t3UHRnL2tOZm0yV21TWlJPdlk1eGhsUWEw?=
 =?utf-8?B?dzhiVjVSNk1LMzd1RkxsNmoxTGRaalhsQXFOMXI1cWdVZHNNNHR5UjA3aVhZ?=
 =?utf-8?B?REZDSU15SkZkNUR5SVdpcDV1algxdCtzZndYODNIVHhDZENGcFp6a01KV1Bz?=
 =?utf-8?B?ZXJPcmNvM3FJSWdrV3VCODEzRG9LbS80R1UwMW1OZytoZGlqODlZRTNOMTAy?=
 =?utf-8?B?MmxrMFBrWjNJOUNBb2EzbmprZE5BalhPOG03WWNwaVFvZGNZanMxc1ZDN2RD?=
 =?utf-8?B?R096d1RIa1hRVmg2d2hzRHdUb2pVV1l5aytNZzJMTmg0VDRUUHlpREtac2p0?=
 =?utf-8?B?OWQ4QnBWa1VzLzgzVE5PRHpueGhlK1E2WmJmdmtwRW9EbjNPclh3VytoTUE1?=
 =?utf-8?B?T1YyTHBhcmYra3NHM0J0cXNCYzNyektwWWV1Z2RSc3M2aXY1b05UWWt3Z0pD?=
 =?utf-8?B?aFNqNW5SUi82eDRiTCs1UHdTWVNwWENiVWNON0dyY0JXS3FVa0g0bldjSHJP?=
 =?utf-8?B?akluRDRYNGpqODRpMzFMY0Uwc1k0eE9SeXVnQ3BxUytxNkVQdXhuL0REWi9Q?=
 =?utf-8?B?Q2lmMzZXVEp3blBnT2IxWWlYL1pRM1BtY1Y0N0R0WUEvOEZkR2kzOXc5Wm9Q?=
 =?utf-8?B?ZXdoM0hEZlJqV0VhNWJIRlI4UzdmS1hEQk42WVJTQ2xHZWNsdlZJVXo2L1FE?=
 =?utf-8?B?UVNEc2p0bG9vdDAzZWR3dkdtMURpN1d5TEFsNTczUi9rUTU0NXF3eE9BelVr?=
 =?utf-8?B?WUIxV052c1h3VW0xcWNwbHMwaU5zWTRabFFOVGpqa1VqbVRVYVhwYUJuamdl?=
 =?utf-8?B?ZnEwcHVBdWhIZzdQSVhqb2VydUJyQUZEUEhxTWE1bm9IbVFsR1V5bGt1WTFD?=
 =?utf-8?B?Z1NEMkZIMVN5Z0c1ZVZVSmFTU0tEazNEVXBFWkhDSU5hbkdGYVFRSmJrRkdk?=
 =?utf-8?B?RnM2emQvWEJZTHFVRmEzdysvd1hlVGVPbS9lYW9mbGtBVm1DcXgzdVVnL054?=
 =?utf-8?B?bmgxS3k3TWVWYm1VTUtXcHArZGpQUnUwR3FqZkg1RFQzR1U2akRoZ3ZDWTRR?=
 =?utf-8?B?Um1hOTJIUURsNW53dWQyRDFqSmJPQlEyVlZsZHlhbXR0UXI1UDVaUmpsUytM?=
 =?utf-8?B?WU1YdmhxZjY1eGtGbFNTZXdBTHRyYVJJRnV4YU5La250R3M2aFREWVQ5SUh0?=
 =?utf-8?B?U0JJZEtzRFg5eHlWTDNWMEFLQ1daSkFRTThzWnpGaHF0Zm5MSHVrK05FRlhU?=
 =?utf-8?B?dDBkZElKYk1kZEVNSWZCTkNEUE1aWXpSR09PL2c3YjhWT0RycUJwWFZHNktI?=
 =?utf-8?B?ajdiM1RzdFUzYndOR0wzZFUrbmFYQ1ZwWXM1RllNSHlzTWJLZFNVR2J6bldi?=
 =?utf-8?B?WXBpdFBPR0VRSzUwQ2Z3RWN2R290ekxEbXJkUXNqaWhzY2hCdTNQeDMvU0g3?=
 =?utf-8?B?L0lkR0xKZk9BRCtVNHQ2UHJldXNZYkVFM2xudUZwYlo5RWp4ZVJSaHB5dDkr?=
 =?utf-8?B?cGtDVVpmbWpPekJjdVFrR2lFL0JBK2UwNkVEalBvNU1vSEdpVmVudnlELzhO?=
 =?utf-8?B?ZHpubDJXK1djdFhuRDNYMFV3aFlpOWJJOUlPZEtoRHBMdDF3aVVHcVROallh?=
 =?utf-8?Q?jPWhfP8t+VkE+KcDtM2HWaU7S3JeI2/RACnfDeEm+xn/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4C36B574656274180697ABC86E0C2E9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ed2def-8e76-4c4e-686b-08da8ef0de5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 03:43:59.9992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ClZ0vNqyqqMqO7afaaySHrY1OEARpdibDa+T4nPCnqvYcS8q6KqTv5KOimM4F6s6NtO6wb1MdBFIs3CgxMFssBI9VULfqJaDKruqhdkgZkitArswyCKVeJ+9hDVM8T0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5983
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gRnJpLCAyMDIyLTA5LTAyIGF0IDE3OjA4ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGJ1ZikNCj4gPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtY3B5X3RvaW8oKGkyYy0+
aTJjX2Jhc2UgKyBTTUJVU19NU1RfQlVGKSwgYnVmLA0KPiA+ID4gPiB0cmFuc2Zlcmxlbik7DQo+
ID4gPiANCj4gPiA+IFdoeSBkbyB5b3UgbmVlZCBidWYgY2hlY2tzPyBJcyB5b3VyIGNvZGUgY2Fu
IHNob290IGl0c2VsZiBpbiB0aGUgZm9vdD8NCj4gPiANCj4gPiBZZXMsIGJ1ZiB3aWxsIGJlIHBh
c3NlZCBhcyBOVUxMIGluIHNvbWUgY2FzZXMuIFNvLCB0aGlzIGNoZWNrIGlzIHJlcXVpcmVkLg0K
PiANCj4gQ2FuIHlvdSBzaG93IGFuIGV4Y2VycHQgb2YgdGhlIGNhbGxlciB3aGljaCBwYXNzZXMg
TlVMTD8NCg0KRHVyaW5nIEkyQyByZWFkLCBmb3Igd3JpdGluZyBqdXN0IHRoZSBjbGllbnQgYWRk
cmVzcyB3aXRob3V0IHBhc3NpbmcgYW55IG90aGVyDQpkYXRhLCB0aGUgYnVmIHBvaW50ZXIgaXMg
c2V0IGFzIE5VTEwgaW4gcGNpMXh4eHhfaTJjX2J1ZmZlcl93cml0ZSBBUEkgaW4gdGhlDQoicGNp
MXh4eHhfaTJjX3JlYWQiIGZ1bmN0aW9uDQoNCj4gPiA+IEVhY2ggbG9uZyBzbGVlcCAoMjAgbXMg
aXMgcXVpdGUgbG9uZykgaGFzIHRvIGJlIGV4cGxhaW5lZC4gQnV0IHRoaXMgZW50aXJlDQo+ID4g
PiBsb29wDQo+ID4gPiBsb29rcyBsaWtlIGEgYmFuZC1haWQgb2YgbGFjayBvZiBJUlEgb3Igc28u
IFdoeSBkbyB5b3UgbmVlZCB0byBwb2xsPw0KPiA+IA0KPiA+IFRoaXMgaGFuZGxpbmcgdGFrZXMg
Y2FyZSBvZiBzcGVjaWFsIGNhc2Ugd2hlbiBzeXN0ZW0gaXMgcHV0IHRvIHN1c3BlbmQgd2hlbg0K
PiA+IGkyYw0KPiA+IHRyYW5zZmVyIGlzIHByb2dyZXNzIGluIGRyaXZlci4gV2Ugd2lsbCB3YWl0
IHVudGlsIHRyYW5zZmVyIGNvbXBsZXRlcy4NCj4gDQo+IFRoaXMgc2hvdWxkIGJlIGF0IGxlYXN0
IGEgY29tbWVudCBpbiB0aGUgY29kZS4NCg0KT2theSwgSSB3aWxsIGFkZCBjb21tZW50Lg0KPiA+
IA0KDQo+ID4gPiBZb3UgY2FuJ3QgbWl4IGRldm1fIGFuZCBub24tZGV2bV8gaW4gc3VjaCBtYW5u
ZXIuIEl0J3MgYXNraW5nIGZvciB0cm91Ymxlcw0KPiA+ID4gYXQNCj4gPiA+IC0+cmVtb3ZlKCkg
b3IgdW5iaW5kIHN0YWdlcy4NCj4gPiANCj4gPiBJIGFtIG5vdCBnZXR0aW5nIHRoaXMgY29tbWVu
dC4gQ2FuIHlvdSBraW5kbHkgZXhwbGFpbiBtb3JlLg0KPiA+IA0KPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+IA0KPiBFeHBsYW5hdGlvbnMgWzFdICYgWzJd
LiBFeGFtcGxlIGhvdyB0byB3b3JrYXJvdW5kIFszXS4NCj4gDQo+IFsxXTogaHR0cHM6Ly93d3cu
bWFpbC1hcmNoaXZlLmNvbS9saW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnL21zZzE5NDkwOTEu
aHRtbA0KPiBbMl06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9ZWGt0ckcxTGhLNXRqMnVG
QHNtaWxlLmZpLmludGVsLmNvbS8NCj4gWzNdOiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0
cy9rZXJuZWwvbXNnNDQzMzk4NS5odG1sDQoNCk9rYXkuIEkgd2lsbCB1cGRhdGUgY29kZSBhcyBw
ZXIgdGhpcyBsb2dpYyBpbiB0aGUgdXBjb21pbmcgdmVyc2lvbiBvZiB0aGUgcGF0Y2guDQoNCj4g
PiA+IEFmdGVyIGZpeGluZyBhYm92ZSwgY29udmVydCB0aGUgZXJyb3IgbWVzc2FnZXMgdG8gdXNl
DQo+ID4gPiANCj4gPiA+IMKgwqDCoMKgwqDCoMKgIHJldHVybiBkZXZfZXJyX3Byb2JlKC4uLik7
DQo+ID4gPiANCj4gPiA+IHBhdHRlcm4uDQo+ID4gDQo+ID4gT2theS4NCj4gDQo+IFdpbGwgYmUg
cmVzdWx0IG9mIGFib3ZlIGZpeC4NCg0KT2theQ0KDQo+ID4gPiANCj4gPiA+IFRoaXMgd2lsbCBi
ZSBnb25lLg0KPiA+IA0KPiA+IEkgYW0gbm90IGdldHRpbmcgdGhpcyBjb21tZW50IGFsc28uDQo+
IA0KPiBTZWUgYWJvdmUuDQoNCk9rYXkNCg0KDQoNCg0KVGhhbmtzLA0KVGhhcnVuIEt1bWFyIFAN
Cg==
