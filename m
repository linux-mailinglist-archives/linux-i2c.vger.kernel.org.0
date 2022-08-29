Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB08C5A412F
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Aug 2022 05:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbiH2DA4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Aug 2022 23:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiH2DAz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Aug 2022 23:00:55 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9528BBF74;
        Sun, 28 Aug 2022 20:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661742051; x=1693278051;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/Eqjws/RTJHOxj0M13wXeG6Drl05uKUZoyHKQNVad5I=;
  b=uH2BfDU1Js232sx3ynp6lVki3x7X6Yu6LqkXazMUV6aahORw1+yC1vTa
   xIcMMP8h31Dl+xjDiGFSrkBbPbgXFQ6DbiMYOhk6sJLoT1Yx5MTnpxyFv
   aMUBTxosoDffD+2b4uuHE/UgqXATd6i5PQRgWwb1H5nd2na8cRXvZ1otm
   kxJ612yjWvzc4OJfZcwOt1ufLQUwTVXow3mRJaSfw/TwQ6k5NmPsSRs3U
   kL7d3vMmvomNLrQUUUTbp/7YRr3ZSj4Umwt7LhghImeA+mqS7XZIr5Oyk
   hvqvw9Rod1hGM9tLS7jYeZ+UpNrF2uCl+xX07VRAIxLdsDoRmh5gpZl1w
   g==;
X-IronPort-AV: E=Sophos;i="5.93,271,1654585200"; 
   d="scan'208";a="178219573"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Aug 2022 20:00:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 28 Aug 2022 20:00:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Sun, 28 Aug 2022 20:00:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwGrDs2lE4d/yGy608RQsfOMSEm5jGdHreRCJJ+Ocxm6otKCXon6bnF4rhKBu6fmhpPapgwtHPdrWdxfneMojNNrduS0niOu7NoJwOTFD4aDedKVk2pQ5NDCAMA5VepS2Vc453ZOx6JT8U3s5myWd7Ki7TjMhF781b6PHbcKJG5/yiWMetGs3OZ3wYCW7IyoKQdsjTeotMs90NSI6hFA0gm8+GgDVksfIUCznBOoA8Yb0GTt0Fc87k+aHZWFAzXIFBC2ZnW12lhgW/5hNfX+vVZ6/fGrUXS7jSqET+b8wze8ZP6sj0Y+lRgFp9KEB0bBADk2GAeSoTEnvzGs03grzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Eqjws/RTJHOxj0M13wXeG6Drl05uKUZoyHKQNVad5I=;
 b=YlSz0URotaetq3Peb+VMLorFwK2JyIa/AypOgMonoSYffuNj4S0e5PQ45x2UmoyoPDehX6y7ZEOXFSnWhIIN66ApI+vszJrzV6h3qtMDk4TF72zeUoX58lZHca2kKaaj91Z/1192KxPNYZoxWkgcRQMFWBrYbHgq37p6IlUVwMwFlFdeBFqoSd1S3RjEkibzflTq24bmzZpyL4vn1volwdVuZv36b2m40Dn9TiurXIbX/AZvTnYw3K59kqjc8LMf70wqTEg197x9QeCrRKe+lDSjT3mtJ7U78OclWSYywT8T9zirjYqHAqfm4W9p2hTUQBWMOEcLD5Ii6sASc+rUcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Eqjws/RTJHOxj0M13wXeG6Drl05uKUZoyHKQNVad5I=;
 b=RWW3bUoHgDJnN2QSHuKGo9yESIZq+u8uHX1r088rgpuAINUTLdStsqXmSXdj4r0Dmqxrc2v1KRiiCC06N+p5/Bsfz3oWBhs83YaIajb/33l7nejqacyffx828xv4VYRXLzhzgdtsOQHkP67Uvx+HTSlnKV8YX2Nm/uVoMM0LR2A=
Received: from PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5)
 by MWHPR11MB0048.namprd11.prod.outlook.com (2603:10b6:301:6a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Mon, 29 Aug
 2022 03:00:21 +0000
Received: from PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::ce2:c2e7:3373:fd42]) by PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::ce2:c2e7:3373:fd42%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 03:00:21 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <andy.shevchenko@gmail.com>
CC:     <wsa@kernel.org>, <krzk@kernel.org>,
        <linux-kernel@vger.kernel.org>, <sven@svenpeter.dev>,
        <robh@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <arnd@arndb.de>, <jsd@semihalf.com>, <olof@lixom.net>,
        <rafal@milecki.pl>, <UNGLinuxDriver@microchip.com>,
        <semen.protsenko@linaro.org>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Topic: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Index: AQHYttI9ItE0vA92WES0jroLXsIOYq28lckAgAGLSYCAAEDGgIABOm4AgAASYACAAOS9gIAAl+iAgAAqdACAA+PpAA==
Date:   Mon, 29 Aug 2022 03:00:21 +0000
Message-ID: <914e31e65fe3dcc36d47be8eb4d14c8b4c255904.camel@microchip.com>
References: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
         <YwTsnCdxM5I6BoJu@smile.fi.intel.com>
         <80debd4bbf819cbfa16681172919436df476558a.camel@microchip.com>
         <CAHp75VevAifCp_Bz5HN1MmGm7UEJWFR017kngzARfBh+Z8aAAA@mail.gmail.com>
         <787644272b3b260980ff8b9efc317ce3194b0acc.camel@microchip.com>
         <YweFttaSE2GOoW83@smile.fi.intel.com>
         <8f9e8be7084ad78671198f03313058809038a3f8.camel@microchip.com>
         <a1d8278eb7e94c26de1022eec480a22fced120f0.camel@microchip.com>
         <CAHp75VcUKeRhh40dB4Lqh=TE93GhfzaBJ-3uDWrJedDTGLa5vQ@mail.gmail.com>
In-Reply-To: <CAHp75VcUKeRhh40dB4Lqh=TE93GhfzaBJ-3uDWrJedDTGLa5vQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f1b9960-96b4-4d07-e651-08da896a9c92
x-ms-traffictypediagnostic: MWHPR11MB0048:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3OzTJHhdNt4znuItpRJvNJYmmnk/UWAsA+Jr0SFqWUau+8MRKziSfYUAcAAckn3Cr6sTDl8b1Io/uXOrVm8wSh6DAO1j82Ot5ETx9gAWyg+/glo4cFm4yxZEg+G7J2SSVWpNtjD0/2Bwe4gzn8e458xD2ZkpOZ8GMTaSV8QdmTyes3Sv3aaNK1TLy+1pUHFWtxAC7LDb9fM5Y6WZMAJdj2W6HX3YRaakCREo3QRAeGxSXx5grJksjwpdQp92fUxEvtiv2KodJ4LbY0uNQV393Pv6XZoATM/rpAcpZoo98pBIDr77j50a8Nsp6j5aQaFdauUm7RodJRWObzMtJs2BzKCYl1FnfmlQf8we0K7zlSthhiYSZ3DolZYjaoOUQvccfEKHc5EPHKd9Iawt2MPMApkKKvn9hpE62R8CePTezhq+/XEmBpQL95yWn8QzLeWuBbMObH9/TGXh+s4oB4GxcRWFD5GXSMDQBhRkcJCMGGwxH7Pca5sDx4DKFNns6/w2Q2MdlT+wqr+BOKOs400WcisNQiT2oppyNN/irlnGL1uDcisiOuG/NP06GiN5nAVwCXwxoKrFVFYa8SMh75ghzSQsfzbYmVamPTGRIwZm89mydgOAwNo4Bwu7dv/OmDTYkBDDNFwhAS1nSwyqKdBkcbRW9LXL7NLbQ6au24Jrszxt18Kbh7mrK/doxueOnRvxxWhMxfNw07lNVcDsp4rn7wk6gWLO0G1Vc+mrcFwz9+hK5X5nU8vy0XzVyR5sgzLRUwF7OBGmhXp7P9lc0RqBGsH21xAgY4+XAf5SaNfFILw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5096.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(396003)(376002)(346002)(39860400002)(64756008)(66476007)(8676002)(66446008)(4326008)(91956017)(316002)(54906003)(6916009)(76116006)(8936002)(7416002)(5660300002)(2906002)(38100700002)(66556008)(66946007)(122000001)(36756003)(86362001)(38070700005)(6512007)(53546011)(6506007)(26005)(6486002)(41300700001)(478600001)(71200400001)(83380400001)(2616005)(186003)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzhXYnBBa0ZuWmk0YlRmaS9NWTB4MzlqSFNSOWVrUVdqOERJTis3cElFa1VJ?=
 =?utf-8?B?UnV2c3JlbzVVazAyZ3dxTGp4YkNxOFRmendzR2ZmV0xJa2sxeWUxWWo2ZW9I?=
 =?utf-8?B?YnY2NVZabUpPNXRuOWdhb1lXNjZ2YTBZYmp2ZVNLNGFRU2lQOXkyekNaWnlH?=
 =?utf-8?B?ajUwN3pXaVh2cDV4NkFBa3ZTQWdkSC9jelVqMUFlUUlpZnVHWjJueHFPT3dC?=
 =?utf-8?B?YjluKzFtR2ZBNXQ0eHZHRWNPUlY3ZEdDd0VoVkczdjIvYm1KSEE2RHl4UVZm?=
 =?utf-8?B?T2RTM293ZThsNmlRUm11eXNLNnFxMENBWm5WdkhZZkVOUWFFd2YxN0NWMXpT?=
 =?utf-8?B?SFAzV1dTbk1uVjU3OXR6amFhV0JWR0NHenpldnpQK1ZleThDSXJSMmdFd0lI?=
 =?utf-8?B?MjkwQjg4azdVRU5rRS9STnlkcmFtTXZWSm9aMWlaMVdIZGc4OFVPTFZyZUtq?=
 =?utf-8?B?UHNhdEZxK3lsLy9aQVVkZFpOOUlOZFRIR0VsUURUM3h0cjBmTG9LL2NDS0VJ?=
 =?utf-8?B?Wk43d1h1aCtOL3BqRS9NR0tWZGdtNVBVUTJQZDZEYUFHN1lTK0J0c1hyQnMy?=
 =?utf-8?B?Y1E5MnN6OEZPdmp2U1ZGR2cwdnFjUTdlK0tndDJ1TnBTRmNzbHlaMlVSU3dk?=
 =?utf-8?B?SjlpSFFnN3J5ckROZk1IWFdsZS85Ly9qdzRRTzJnSDVWVEVIY2ZIcEdMb21t?=
 =?utf-8?B?blFZaDU1QURnSEdtaEVxcDFiMmJJdStSS1NwMGZjL1ZIMzZ0UzFxU3NqR2x1?=
 =?utf-8?B?VGVNNDVzSnBETTNHcURJRjh2WmRwRTdZamI0Qnp3U1V6V3d6aWhSV09WSmVG?=
 =?utf-8?B?TVVCRENSODJEK3RkREdNai9WM3lFTHhkQTVpRC9JV0dkQk5HWjJlcHF1MUE2?=
 =?utf-8?B?L1RNdnhneWZ0aGl4UzFxUjVYaGVaYlU2RGhBb1JiU0R2Skd1c1NObnh6Y1pN?=
 =?utf-8?B?VE9WL2hMdkt4UXd1cXczSHMyeENPVWNVK3FxUWNsM043Z1JjeXpVTnZhYS9Z?=
 =?utf-8?B?MFg3cFhlNW5OYldXZGRiQk45SHJ1WXpENFJoa0JPYmFqY0hLdFllcHFGRlhv?=
 =?utf-8?B?akJ3M0xWWFJ4NEFrelFRVis1U3RVUkJSa1A3ZnlMeTdUQ2VlWXdyRUc3clVv?=
 =?utf-8?B?N2hQbVA4REFTNVBvU0Q4cU1aTTBaTXliNk9PY01JUVVmOS9kZEUzZy9BMFBi?=
 =?utf-8?B?UkRVM1U2OEpXdUJ5VWpiaU9FRUJBdysyUm1iUmlxbW53cmxsYytWNlE3cFZ0?=
 =?utf-8?B?TGJhei83ZWYraXhhcEtSL3dZUThMakMySUo3Y2RKbVhiTXhieUpPbkZKTWFt?=
 =?utf-8?B?bUZ6MTN6SFV0ZzYrODZ3MzBZU2N2b3g4YnhheTMxWkVtWXFPNGRYZ1dyNWJR?=
 =?utf-8?B?MWxjM3dSNEwyRUE0d04rTXlHUTl1Ymc4QW9JMGdDZjhyNDd4OGxpbjhtNjE5?=
 =?utf-8?B?eHJMOHZ0Z2dHa2ZEdzhNdXBic1dUdzJoQ3Z4QTZzUExsSXppeW1GQkpMejRq?=
 =?utf-8?B?ZW15NzRGcTR3K1Q1V1JUaEtqRk02SXRPVS83UjlrS1hzMmdheG1vZnlzcXVV?=
 =?utf-8?B?TGtHemNoVllJcDJkcmQraDA1aVYxd2FHUGF1aEszelJiVGZnNE9OdGFua05m?=
 =?utf-8?B?dDlNRXdoRGxUTmxTeUVnUUVaQlVzZEY2bVRMUHNIMUpxak1CQzQ1K2tqL1Jo?=
 =?utf-8?B?Z3drSlg1N0M4dFJVYThGWG43NUVmQnAzbW5wOFh5RlExTVorVmgzTEpIdTVW?=
 =?utf-8?B?N1ljbTl5WjhCQS9wcy9SV2RtS3BiUW1xelF1SFhKZWNvRGpVNWdyeHBUKzBH?=
 =?utf-8?B?Wm9sWS92VTQ4akRIVWV5eUYwTDM0TXB3OU5hQXF2a3Z4L0JKUU1UNVM1NmZV?=
 =?utf-8?B?Z3ZhKzBaS2dRMWYyclRiSjlCbVp1NXNnRmJKb3JaNWFkNFVZRTN4aUV0TmZT?=
 =?utf-8?B?Qkh2SkZHWUhkYVd0bUhDYkpBbEpEZFB0U1Y1OHlXNzBoV01FTTgxRkx4Q3o1?=
 =?utf-8?B?UVhiOS9UY1psNTBYZGFNcVdoRHJhYUN1VUdpdWJWdWQwZUFzNjBuWHJzejlW?=
 =?utf-8?B?TURsMHIwL1JYTnpOa0tINUMxc3dGa2FlQmxZTThyVzBNdTRLbkp3YXhPSjNG?=
 =?utf-8?B?Tit6SnFhL1I4SUhDbTZ2THJET3BEV2ExTFp2cDVwMkRBLzF4MTBUQnoxWExs?=
 =?utf-8?Q?HCJ3bLOvvf6tahfQ+SnwEKQvrD9iwecXM4fvplbTTfNh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A011B68501E5634F9CDB0F4E26DE8F4A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1b9960-96b4-4d07-e651-08da896a9c92
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 03:00:21.2289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MRJpMz9kVtOu4KuKOvash1IsSZWoIEJ1qiwoRQ89fc66kRsghk939G0vwYsGVG4Ht1b0q2gQrcF7/HZP8oahxyPOXAIbvwMBg3Tuddd3tEqvjAQiPAZAdmCOhXANCuGv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0048
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gRnJpLCAyMDIyLTA4LTI2IGF0IDE4OjM3ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IE9uIEZyaSwgQXVnIDI2LCAyMDIyIGF0IDQ6MDQgUE0gPFRoYXJ1bmt1bWFyLlBhc3VtYXJ0
aGlAbWljcm9jaGlwLmNvbT4gd3JvdGU6DQo+ID4gT24gRnJpLCAyMDIyLTA4LTI2IGF0IDA0OjAw
ICswMDAwLCBUaGFydW5rdW1hciBQYXN1bWFydGhpIC0gSTY3ODIxIHdyb3RlOg0KPiA+ID4gT24g
VGh1LCAyMDIyLTA4LTI1IGF0IDE3OjIyICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+
ID4gPiA+IE9uIFRodSwgQXVnIDI1LCAyMDIyIGF0IDAxOjE1OjQyUE0gKzAwMDAsDQo+ID4gPiA+
IFRoYXJ1bmt1bWFyLlBhc3VtYXJ0aGlAbWljcm9jaGlwLmNvbcKgd3JvdGU6DQo+ID4gPiA+ID4g
T24gV2VkLCAyMDIyLTA4LTI0IGF0IDIxOjMxICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+ID4gPiA+ID4gPiBPbiBXZWQsIEF1ZyAyNCwgMjAyMiBhdCA2OjA0IFBNDQo+ID4gPiA+ID4g
PiA8VGhhcnVua3VtYXIuUGFzdW1hcnRoaUBtaWNyb2NoaXAuY29tPg0KPiA+ID4gPiA+ID4gd3Jv
dGU6DQo+ID4gPiA+ID4gPiA+IE9uIFR1ZSwgMjAyMi0wOC0yMyBhdCAxODowNSArMDMwMCwgQW5k
eSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+IE9uIFR1ZSwgQXVnIDIzLCAyMDIy
IGF0IDA4OjI2OjAzUE0gKzA1MzAsIFRoYXJ1biBLdW1hciBQIHdyb3RlOg0KPiANCj4gLi4uDQo+
IA0KPiA+ID4gPiA+ID4gPiA+ID4gKyNkZWZpbmUgU01CX0lETEVfU0NBTElOR18xMDBLSFrCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDAzRTgwM0M5DQo+ID4gPiA+ID4gPiA+ID4gPiArI2Rl
ZmluZSBTTUJfSURMRV9TQ0FMSU5HXzQwMEtIWsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4
MDFGNDAwOUQNCj4gPiA+ID4gPiA+ID4gPiA+ICsjZGVmaW5lIFNNQl9JRExFX1NDQUxJTkdfMTAw
MEtIWsKgwqDCoMKgIDB4MDFGNDAwOUQNCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4g
PiBTaG91bGRuJ3QgdGhlc2UgbWFnaWNzIGJlIGRlY2ltYWxzPw0KPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiBUaGlzIFEgc2VlbXMgdW5hbnN3ZXJlZC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBU
aGVzZSBtYWdpYyBudW1iZXJzIG5lZWQgbm90IGJlIGRlY2ltYWxzLiBDb25maWd1cmluZyByZWdp
c3RlcnMgd2l0aA0KPiA+ID4gPiA+IHRoZXNlDQo+ID4gPiA+ID4gdmFsdWVzIGluIGRyaXZlciB3
aWxsIHNldCB0aGUgdGltZSBpbiBkZXZpY2UuIEhvd2V2ZXIsIHRoZXNlIHZhbHVlcyBkbw0KPiA+
ID4gPiA+IG5vdA0KPiA+ID4gPiA+IGNvbnZleSBhbnkgbWVhbmluZyB3aGVuIHJlcHJlc2VudGVk
IGluIGRlY2ltYWxzLg0KPiA+ID4gPiANCj4gPiA+ID4gSG1tLi4uIE1heWJlIHlvdSBkb24ndCBz
ZWUgdGhpcywgYnV0IEkgc2VlIHRoZSBmb2xsb3dpbmc6DQo+ID4gPiA+IA0KPiA+ID4gPiAweDAz
RTgwM0M5ID0gNjU1MzYgKGkuZS4gMl4xNikgKiAxMDAwICsgOTY5DQo+ID4gPiA+IDB4MDFGNDAw
OUQgPSAzMjc2OCAoaS5lLiAyXjE1KSAqIDEwMDAgKyAxNTcNCj4gPiA+ID4gDQo+ID4gPiA+IFBy
ZXR0eSBtdWNoIHNvdW5kcyBsaWtlIGEgYml0IDE1IGZvciBzdGFuZGFyZCBtb2RlIGFuZCBiaXQg
MTYgZm9yIGZhc3QNCj4gPiA+ID4gbW9kZXMNCj4gPiA+ID4gc2hpZnRlZCBieSAxMDAwIHRvIGhh
dmUgYSByb29tIGZvciB0aGUgdGltZSBpbiBwcmVzdW1hYmx5IG5hbm9zZWNvbmRzIHVwDQo+ID4g
PiA+IHRvDQo+ID4gPiA+IDENCj4gPiA+ID4gdXMuDQo+ID4gPiA+IA0KPiA+ID4gPiBQbGVhc2Us
IGRpZyB1cCBpbnRvIHRoZSBkb2N1bWVudGF0aW9uLCB2ZW5kb3IgY2hhdCwgZXRjIHRvIGdldCBt
b3JlDQo+ID4gPiA+IGluZm9ybWF0aW9uDQo+ID4gPiA+IG9uIHRoZXNlIHZhbHVlcy4NCj4gPiA+
IA0KPiA+IA0KPiA+IEkgaGF2ZSB3ZW50IHRocm91Z2ggdGhlIGRvY3VtZW50YXRpb24uDQo+ID4g
DQo+ID4gRm9sbG93aW5nIGlzIHRoZSBiaXQgbWFwcGluZyBvZiBpZGxlIHNjYWxpbmcgcmVnaXN0
ZXI6DQo+ID4gUmVzZXJ2ZWQgWzMxOjI4XQ0KPiA+IEZhaXIgSWRsZSBEZWxheSBbMjc6MTZdDQo+
ID4gUmVzZXJ2ZWQgWzE1OjEyXQ0KPiA+IEJ1cyBJZGxlIE1pbiBbMTE6MF0NCj4gPiANCj4gPiAn
QnVzIElkbGUgTWluJyBmaWVsZCB3aWxsIGluZGljYXRlIHRoZSBudW1iZXIgb2YgdGlja3Mgb2Yg
dGhlIGJhdWQgY2xvY2sNCj4gPiByZXF1aXJlZCB0byBwcm9ncmFtICdidXMgaWRsZSBwZXJpb2Qn
IGRlbGF5IGFuZCBjYW4gaGF2ZSBtYXhpbXVtIHZhbHVlIG9mDQo+ID4gNDA5NS4NCj4gPiAnRmFp
ciBJZGxlIE1pbicgZmllbGQgd2lsbCBpbmRpY2F0ZSB0aGUgbnVtYmVyIG9mIHRpY2tzIG9mIHRo
ZSBiYXVkIGNsb2NrDQo+ID4gcmVxdWlyZWQgdG8gcHJvZ3JhbSAnZmFpciBpZGxlJyBkZWxheSBh
bmQgY2FuIGhhdmUgbWF4aW11bSB2YWx1ZSBvZiA0MDk1Lg0KPiA+IA0KPiA+IFNvLCBlaXRoZXIg
dGhlIGVudGlyZSBJRExFX1NDQUxJTkdfUkVHIHZhbHVlIGNhbiBiZSBpbiBoZXggb3IgSSBjb3Vs
ZCBkbw0KPiA+IHNvbWV0aGluZyBsaWtlIGJlbG93Og0KPiANCj4gTm8gaGV4Lg0KPiANCj4gPiAj
ZGVmaW5lIEJVU19JRExFX01JTl9USUNLU8KgwqDCoMKgIDxWQUxVRV9JTl9ERUNJTUFMPg0KPiA+
ICNkZWZpbmUgRkFJUl9JRExFX0RFTEFZX1RJQ0tTwqAgPFZBTFVFX0lOX0RFQ0lNQUw+DQo+ID4g
DQo+ID4gI2RlZmluZSBJRExFX1NDQUxJTkdfUkVHICgoRkFJUl9JRExFX0RFTEFZX1RJQ0tTIDw8
IDE2KSB8DQo+ID4gQlVTX0lETEVfTUlOX1RJQ0tTKQ0KPiA+IA0KPiA+IFdoaWNoIG9mIHRoZXNl
IDIgYXBwcm9hY2hlcyBkbyB5b3UgZmVlbCBpcyBiZXR0ZXI/DQo+IA0KPiBPZiBjb3Vyc2Ugb25l
IHdpdGggdGhlIGNvbW1lbnQgZXhwbGFpbmluZyB0aGUgdGhpbmcgYW5kIHR3byBkZWNpbWFsIG51
bWJlcnMuDQo+IE5vdywgc2luY2Ugd2Uga25vdyB0aGF0IGJvdGggdmFsdWVzIGFyZQ0KPiANCj4g
MTAwMCBhbmQgOTY5DQo+IDUwMCBhbmQgMTU3DQo+IA0KPiBJdCdzIGVhc3kgdG8gc2VlIHRoZSBk
aWZmZXJlbmNlIGFuZCBtZWFuaW5nLg0KPiANCj4gU28gcGVyIGVhY2ggbW9kZSB5b3UgbmVlZCB0
byBoYXZlIHRob3NlIHBhaXJzIG9mIGRlY2ltYWwgbnVtYmVycyBpbiB0aWNrcy4NCj4gYW5kIG9u
ZSBjb21tZW50IGV4cGxhaW5pbmcgYWxsIHdoYXQgeW91IGhhdmUgZXhwbGFpbmVkIGhlcmUgaW4g
dGhpcyBtYWlsLg0KDQpPa2F5LiBJIHdpbGwgZm9sbG93IHRoaXMgYXBwcm9hY2guDQoNCg0KVGhh
bmtzLA0KVGhhcnVuIEt1bWFyIFANCg==
