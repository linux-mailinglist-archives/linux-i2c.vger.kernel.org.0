Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 911FC76CB6E
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 13:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234067AbjHBLFC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 07:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233401AbjHBLFA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 07:05:00 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2111.outbound.protection.outlook.com [40.107.113.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240F226A8;
        Wed,  2 Aug 2023 04:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCY0dZ9tnS3XsGFBLDFBzJubgCESVpusmrYj+/4w1BSu37q2yH9Wnj0f2pTutxedxS+D8NpL6wf0pYh3gwPkPK2eILV3NdjWQutiTIpgH1SFAoTax1GDqNFfNUDJTmsy2VQVkqptycWgsPmA1V8pJNiXBaa58RNPXHcQULmFNUEalDYyGqfeBJKMwVWPoqAkvcxFQlxTvjTyFjonkV0HiGK6yKvs6wwz581JduHJWFTXcfa1oLKwi2dUgf7+56fqme1mhim1uZfeBDEHbDmi8SinYVer/OH4IUnLTRegXtaY51541O9tp85niG3BM+kwImwhmLEQUbwGnrqewOVefA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mN9BBoOFxB5lFEI1ffCZemM6AVBalgCCDVnO1iqoWqk=;
 b=fAelqFFsLPIKabuA2attupB2v5QBesWZtgYLRYDyGKk+jhZL/B8YVQA4uPY2GJHfC6yFv1Ivp0L6/AM24NnLCXoJdNpaOsSxdi05JyfzgpnTQj9/y0ug6vg5XSnE1HvOg//R8l7SPs3c9gg3OIsB3Cj4TMQBKJBO5a+RVtR/dAAjAdjkasUZ3U4pNGfP33eqzEbr0+pIF3KskUd1sAkJhZ4ijOvt8hLgP+5FmS7zXoLeqyWwTbNP6z2ukxKdFOPEk+tYqI2V9Tuy7GiAQyMF10wMnSDfLru4CEubs7mHwbaXMI93SI2kT/2cw+CpODhaMT4L+S1bhvYO6gLvOc7P5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mN9BBoOFxB5lFEI1ffCZemM6AVBalgCCDVnO1iqoWqk=;
 b=Bb8hs55Fe9FMu8LL1nfrnLIbdGSKiRfiFQvrzXrp/kLluHUl0Fucqqm+VpfnWQBVeeQ9Yf2DtzJDqxHPOkix6Qm9r/POnt1cCqRVfsczyiFthQoWXE4UFMStvE1fyelQq7MpzfDfbEa8+8f9c/2Av31Zi/8KleMSkYlWje6yYUQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10210.jpnprd01.prod.outlook.com (2603:1096:400:1e6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 11:04:49 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766%6]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 11:04:49 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     kernel test robot <lkp@intel.com>,
        Wolfram Sang <wsa-dev@sang-engineering.com>
CC:     "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Topic: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Index: AQHZxJobTrEvnta3tEGNX72C24BfYK/WZc0AgABzEaA=
Date:   Wed, 2 Aug 2023 11:04:48 +0000
Message-ID: <OS0PR01MB59227502E3D5E6BC2671D4F6860BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
 <202308021149.cnDNnUAh-lkp@intel.com>
In-Reply-To: <202308021149.cnDNnUAh-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10210:EE_
x-ms-office365-filtering-correlation-id: ad8347b0-69b1-4d93-d093-08db934849e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JXkWHaG4T+/vUR/JJZBBNpi/qgDm4/Xr5MPqzKwbUqN87PGb6S4uOc5RdVqiGUJoZOBT5gfj9UyFlfFKYFJ9aCOEWvRWCwh6mWCt/emCUGmJxSwAcwdFg1YJ12vBn9IzNX4Ndnz1OvkpkcObIK4s7guU4d3yP/NVQdVBH8CU7flFv0v6rdIaNpbuvTPAzgzxCAnxhVuoqq6ckK/yW6Or4XpYT70+u3gAZhvo6BHmmIno7kT+wmUU4dVd1HTq0NX4ZNl+cb0Vit4lR/B8MhV/JY5PtfubtHb03yfrOtilO/ZMAhA6O/w3STwaQKEh45vj2cH4Bdg9LTJsgvnrm516H2mI85sZsvINYCHCtOZ+zM9uoQgQcoxh9edZ3Hkd16Tj256rQVwjym+8IwPaK0I6/Vjrzaso0RCSmcu4GeQXia8bmX5Sg04BgdSyT4EPBD4HtgBpTS2UzW3crCPSTV/vjZEOJI9Dee0003K0IjJ1DtOPZCH1WVzg7eEQ2/VUE3ZA3CvGw/ycicP20LwqinBhH+3nF6Ib8cBoQ4r4hY3jiec2f+Gh9uO9IREQ5x5290bg3bb1Xn6zH6SELaIs7WPes5xQPdjgyXfHArwS1bdrNZM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(52536014)(8936002)(8676002)(5660300002)(26005)(41300700001)(2906002)(83380400001)(38070700005)(30864003)(55016003)(478600001)(54906003)(122000001)(110136005)(38100700002)(316002)(86362001)(6506007)(64756008)(7696005)(76116006)(71200400001)(66946007)(66556008)(66476007)(66446008)(33656002)(45080400002)(4326008)(186003)(9686003)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U700lU1yKhLNSxLQlbBc/CuydfgdqsGfkWCMqNOwvXTJ6hSReQ/bEKoW3iGo?=
 =?us-ascii?Q?hrPWhnXS22Bn+ICNaD+qyjdkVV6GU549GThQCOv6uxrQKT12Ky62bFkREyWn?=
 =?us-ascii?Q?mBHbJUEWk2zlmNV7aPzTZIDivYuqx1JsgrH+6qzDpjLFWM7Jyc4gSgP7iD6u?=
 =?us-ascii?Q?Q36elJoumVSKgA3b/977uFxrJo3XWX1dfBD9szsVG2FSpweTxaYxy7JNhmGO?=
 =?us-ascii?Q?ZE7Fo0pOq4QW/M2c0G/JBvupPK2Ko4/UVkmMMhXYnP3gOa7VKUxt0t7NizZB?=
 =?us-ascii?Q?e6Wtyk7SHKC9b5hTUYvaDnd7ZmVvKC0bx3z+nc8XRe22H/g0w5rppJAXLcKb?=
 =?us-ascii?Q?LJ87D8/2cACe0ZRbSz/3AqB2ZDptrJtYhKJvtb194wcN07UWmaBUNZdOM62s?=
 =?us-ascii?Q?Cy+NoeReWot+4WoOyLKlp5hcfDnKkPwCCo6rCtcMA5+YqGZPwNYfRbuQbHFi?=
 =?us-ascii?Q?+xXD18o4MSniUUXrpKHIAIytAsWOaH7gboNWVFNXNIRMxInmoS7RSCkZeSl3?=
 =?us-ascii?Q?EuzZxP+gs72VukKZOQPjqKw0SpEnr2fldgtD+vqCvkgnhwJwz6i95EckfoAC?=
 =?us-ascii?Q?Yw3kSdULDjVdpxoW0HWSTpaCpqZ1HlahDOx4H87UKWLD/y2Xu6Kkzq4WhpJ0?=
 =?us-ascii?Q?r57+BpYQvZCfn2UktF0H6dydbsmVrO1L9CkvcsXFJBqeVUFtdpFzM21I2HQV?=
 =?us-ascii?Q?knnwvfsrty/ACK+77pQZrHfNiJMpniLhWRHFASRANvV1RaQwnx9FUcnbwHMX?=
 =?us-ascii?Q?36KICkJNcEvLZbx6+aqv2ft7j5/BWNmhVLna8rbzRr8FiCRQNfosnGTJkB/Y?=
 =?us-ascii?Q?Y6JcKggNA3OHLkdUQ8Whr5gNeI7w3qVCc3buD/zFW37p3KW5ayoyYWK84w+q?=
 =?us-ascii?Q?y1fKyTn8H5hyUnHKpUOIDLW1sCLU3lyiWan3uyPIK81zo0Gy7W49G9FVUkUZ?=
 =?us-ascii?Q?e/SLL61kD/71556hH78DFqdSDAWrrDYKBThfWIdMwo8rZwYmY3MjQ4BxLcIS?=
 =?us-ascii?Q?zd2+6rxjbU7/AwQhWmH5MskaoeEiNkgYFNYXxCjBKGA0Mj8CiOT4UQbRfKv0?=
 =?us-ascii?Q?GiVPCnwg+82AaZrwu7quQdQwSVHSQ7ebKY8neTCZ9KSQH35gfaswZNAGrfwP?=
 =?us-ascii?Q?oDh5yMcKz0ybTCfVe4u+slefWOT/KNBMydYc2NlvJRikV2Cbey/27ORJMOJL?=
 =?us-ascii?Q?PnJ7P8lgbDv/ZKVhYjepD2dBheWWFiXAJLQsbFpMuyHsPvtvS6BZEl57ISMY?=
 =?us-ascii?Q?gIoNfo1CwWkt340qnNZaUJiJPIomCZ9oR2d04IylEqTuq06Kw+JBX/PpQNtC?=
 =?us-ascii?Q?r8XuGdzHy6kpgcqc3MHUfPJtQRRmmAhxXXaPLtDhK96ng37dHOcm6nTzA3bl?=
 =?us-ascii?Q?w0H65+rB5Y3vIbvQdn/y1qOWljIYlTfzlvIj/9N1Dg1pnF4XR6t4WL3UGdFx?=
 =?us-ascii?Q?gvbXJaOfOPb6T6XyDGWnWXS8mTdUsVxUg5ZoD+WGtvZdX3bEbNgBaU2+zE5i?=
 =?us-ascii?Q?AQsa4r8My1g7Dtdl64ZSTdea1u8cSvgcG3DS895XARWjDHz/w2jqZR+alM3D?=
 =?us-ascii?Q?g9ZzfhSWK5Ko6d01CYS+P1IKnFvt0XVIRywoVEIv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8347b0-69b1-4d93-d093-08db934849e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 11:04:48.9015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IWrTfvOEQMP3Lx2TyS/JT2jeyWr6tUzygvFX4XuZHYJfH8FjrPZX+8A9MgH7cXEurBABw+9EtaNm6po460kBITCA3U7HkiVM5T5GWwPrd/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10210
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,PDS_BTC_ID,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I will send V4 fixing this error and also fixing review comments from Andy =
and Dmitry.

Cheers,
Biju

> Subject: Re: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data()
> callback
>
> Hi Biju,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on wsa/i2c/for-next] [also build test ERROR on
> driver-core/driver-core-testing driver-core/driver-core-next driver-
> core/driver-core-linus linus/master v6.5-rc4 next-20230801] [cannot
> apply to sailus-media-tree/streams] [If your patch is applied to the
> wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-/
> scm.com%2Fdocs%2Fgit-format-
> patch%23_base_tree_information&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.=
c
> om%7C0a6df48bde964a9d1df208db930ec91c%7C53d82571da1947e49cb4625a166a4a2a
> %7C0%7C0%7C638265463936796169%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD
> AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D=
p
> KKEfl6xAPN%2F3isXNWiWAvVClYEajI1Yih0NrnrohWI%3D&reserved=3D0]
>
> url:
> https://github/
> .com%2Fintel-lab-lkp%2Flinux%2Fcommits%2FBiju-Das%2Fdrivers-fwnode-
> Extend-device_get_match_data-to-struct-bus_type%2F20230802-
> 010931&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C0a6df48bde964a9d1d=
f
> 208db930ec91c%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C6382654639367
> 96169%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi
> I6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DCUEi5wumZLT0TK8CAzNxKJ6t=
W
> csSgwP1y3m9IHDbAlo%3D&reserved=3D0
> base:
> https://git.ke/
> rnel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fwsa%2Flinux.git&data=3D05%7=
C
> 01%7Cbiju.das.jz%40bp.renesas.com%7C0a6df48bde964a9d1df208db930ec91c%7C5
> 3d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638265463936796169%7CUnknown%7
> CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
> 6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dm7eaBOcvLLPUFOm4TZkwztRu68DeRSUm0k5I%2FFc=
k
> 2Ok%3D&reserved=3D0 i2c/for-next
> patch link:
> https://lore.k/
> ernel.org%2Fr%2F20230801170318.82682-3-
> biju.das.jz%2540bp.renesas.com&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.=
c
> om%7C0a6df48bde964a9d1df208db930ec91c%7C53d82571da1947e49cb4625a166a4a2a
> %7C0%7C0%7C638265463936796169%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD
> AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D=
2
> 8xs5DcJNWd52QHMFU1Mp%2F%2FWz4rSWjbzA5EXBozJpbw%3D&reserved=3D0
> patch subject: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data()
> callback
> config: hexagon-randconfig-r024-20230731
> (https://downl/
> oad.01.org%2F0day-ci%2Farchive%2F20230802%2F202308021149.cnDNnUAh-
> lkp%40intel.com%2Fconfig&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C=
0
> a6df48bde964a9d1df208db930ec91c%7C53d82571da1947e49cb4625a166a4a2a%7C0%7
> C0%7C638265463936796169%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ
> IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DLH08Ru=
O
> 8H23e6niXnY39LvZP5opxVNOlcrCWcbUSlLA%3D&reserved=3D0)
> compiler: clang version 14.0.6
> (https://githu/
> b.com%2Fllvm%2Fllvm-
> project.git&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C0a6df48bde964=
a
> 9d1df208db930ec91c%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63826546
> 3936796169%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
> CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DmcqSYepniOPtvFzx7hv=
%
> 2FzYAkNGk%2BhzFjP3K4xY6ojPM%3D&reserved=3D0
> f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce:
> (https://downl/
> oad.01.org%2F0day-ci%2Farchive%2F20230802%2F202308021149.cnDNnUAh-
> lkp%40intel.com%2Freproduce&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com=
%
> 7C0a6df48bde964a9d1df208db930ec91c%7C53d82571da1947e49cb4625a166a4a2a%7C
> 0%7C0%7C638265463936796169%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
> CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DjDK=
%
> 2Be3Ghf14uVCvz%2BzPtNQrCxQ4PpxzqRJrnE3BTzLU%3D&reserved=3D0)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore/
> | .kernel.org%2Foe-kbuild-all%2F202308021149.cnDNnUAh-lkp%40intel.com%2F
> | &data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C0a6df48bde964a9d1df208=
d
> | b930ec91c%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638265463936796
> | 169%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi
> | I6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DDmp8go7rkus5Z5pTxiss9O=
L
> | j49ja%2F3DPGWFcwzn397M%3D&reserved=3D0
>
> All error/warnings (new ones prefixed by >>):
>
>    In file included from drivers/i2c/i2c-core-slave.c:12:
>    In file included from include/linux/i2c.h:19:
>    In file included from include/linux/regulator/consumer.h:35:
>    In file included from include/linux/suspend.h:5:
>    In file included from include/linux/swap.h:9:
>    In file included from include/linux/memcontrol.h:13:
>    In file included from include/linux/cgroup.h:26:
>    In file included from include/linux/kernel_stat.h:9:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included
> from ./arch/hexagon/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:334:
>    include/asm-generic/io.h:547:31: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
>            val =3D __raw_readb(PCI_IOBASE + addr);
>                              ~~~~~~~~~~ ^
>    include/asm-generic/io.h:560:61: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
>            val =3D __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE +
> addr));
>                                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded
> from macro '__le16_to_cpu'
>    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>                                                      ^
>    In file included from drivers/i2c/i2c-core-slave.c:12:
>    In file included from include/linux/i2c.h:19:
>    In file included from include/linux/regulator/consumer.h:35:
>    In file included from include/linux/suspend.h:5:
>    In file included from include/linux/swap.h:9:
>    In file included from include/linux/memcontrol.h:13:
>    In file included from include/linux/cgroup.h:26:
>    In file included from include/linux/kernel_stat.h:9:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included
> from ./arch/hexagon/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:334:
>    include/asm-generic/io.h:573:61: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
>            val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE +
> addr));
>                                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded
> from macro '__le32_to_cpu'
>    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>                                                      ^
>    In file included from drivers/i2c/i2c-core-slave.c:12:
>    In file included from include/linux/i2c.h:19:
>    In file included from include/linux/regulator/consumer.h:35:
>    In file included from include/linux/suspend.h:5:
>    In file included from include/linux/swap.h:9:
>    In file included from include/linux/memcontrol.h:13:
>    In file included from include/linux/cgroup.h:26:
>    In file included from include/linux/kernel_stat.h:9:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included
> from ./arch/hexagon/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:334:
>    include/asm-generic/io.h:584:33: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
>            __raw_writeb(value, PCI_IOBASE + addr);
>                                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:594:59: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
>            __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE +
> addr);
>                                                          ~~~~~~~~~~ ^
>    include/asm-generic/io.h:604:59: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
>            __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE +
> addr);
>                                                          ~~~~~~~~~~ ^
>    In file included from drivers/i2c/i2c-core-slave.c:12:
> >> include/linux/i2c.h:1038:2: error: redefinition of
> 'i2c_of_match_device'
>    *i2c_of_match_device(const struct of_device_id *matches,
>     ^
>    include/linux/i2c.h:1031:2: note: previous definition is here
>    *i2c_of_match_device(const struct of_device_id *matches,
>     ^
>    6 warnings and 1 error generated.
> --
>    In file included from drivers/i2c/i2c-core-base.c:23:
>    In file included from include/linux/i2c.h:19:
>    In file included from include/linux/regulator/consumer.h:35:
>    In file included from include/linux/suspend.h:5:
>    In file included from include/linux/swap.h:9:
>    In file included from include/linux/memcontrol.h:13:
>    In file included from include/linux/cgroup.h:26:
>    In file included from include/linux/kernel_stat.h:9:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included
> from ./arch/hexagon/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:334:
>    include/asm-generic/io.h:547:31: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
>            val =3D __raw_readb(PCI_IOBASE + addr);
>                              ~~~~~~~~~~ ^
>    include/asm-generic/io.h:560:61: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
>            val =3D __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE +
> addr));
>                                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded
> from macro '__le16_to_cpu'
>    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>                                                      ^
>    In file included from drivers/i2c/i2c-core-base.c:23:
>    In file included from include/linux/i2c.h:19:
>    In file included from include/linux/regulator/consumer.h:35:
>    In file included from include/linux/suspend.h:5:
>    In file included from include/linux/swap.h:9:
>    In file included from include/linux/memcontrol.h:13:
>    In file included from include/linux/cgroup.h:26:
>    In file included from include/linux/kernel_stat.h:9:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included
> from ./arch/hexagon/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:334:
>    include/asm-generic/io.h:573:61: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
>            val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE +
> addr));
>                                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded
> from macro '__le32_to_cpu'
>    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>                                                      ^
>    In file included from drivers/i2c/i2c-core-base.c:23:
>    In file included from include/linux/i2c.h:19:
>    In file included from include/linux/regulator/consumer.h:35:
>    In file included from include/linux/suspend.h:5:
>    In file included from include/linux/swap.h:9:
>    In file included from include/linux/memcontrol.h:13:
>    In file included from include/linux/cgroup.h:26:
>    In file included from include/linux/kernel_stat.h:9:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included
> from ./arch/hexagon/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:334:
>    include/asm-generic/io.h:584:33: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
>            __raw_writeb(value, PCI_IOBASE + addr);
>                                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:594:59: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
>            __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE +
> addr);
>                                                          ~~~~~~~~~~ ^
>    include/asm-generic/io.h:604:59: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
>            __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE +
> addr);
>                                                          ~~~~~~~~~~ ^
>    In file included from drivers/i2c/i2c-core-base.c:23:
> >> include/linux/i2c.h:1038:2: error: redefinition of
> 'i2c_of_match_device'
>    *i2c_of_match_device(const struct of_device_id *matches,
>     ^
>    include/linux/i2c.h:1031:2: note: previous definition is here
>    *i2c_of_match_device(const struct of_device_id *matches,
>     ^
> >> drivers/i2c/i2c-core-base.c:146:11: error: implicit declaration of
> >> function 'i2c_of_match_device_sysfs' is invalid in C99
> >> [-Werror,-Wimplicit-function-declaration]
>                    match =3D i2c_of_match_device_sysfs(dev->driver-
> >of_match_table,
>                            ^
>    drivers/i2c/i2c-core-base.c:146:11: note: did you mean
> 'i2c_of_match_device'?
>    include/linux/i2c.h:1038:2: note: 'i2c_of_match_device' declared here
>    *i2c_of_match_device(const struct of_device_id *matches,
>     ^
> >> drivers/i2c/i2c-core-base.c:146:9: warning: incompatible integer to
> >> pointer conversion assigning to 'const struct of_device_id *' from
> >> 'int' [-Wint-conversion]
>                    match =3D i2c_of_match_device_sysfs(dev->driver-
> >of_match_table,
>                          ^
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    7 warnings and 2 errors generated.
>
>
> vim +/i2c_of_match_device +1038 include/linux/i2c.h
>
>   1036
>   1037        static inline const struct of_device_id
> > 1038        *i2c_of_match_device(const struct of_device_id *matches,
>   1039                             struct i2c_client *client)
>   1040        {
>   1041                return NULL;
>   1042        }
>   1043
>
> --
> 0-DAY CI Kernel Test Service
> https://github/
> .com%2Fintel%2Flkp-
> tests%2Fwiki&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C0a6df48bde96=
4
> a9d1df208db930ec91c%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C6382654
> 63936796169%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi
> LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DRfyYpwqM0HOM%2BLuR=
c
> vB4%2F1qYFLQwDKwj9bCbA6Y965c%3D&reserved=3D0
