Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF5D69B1E0
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 18:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbjBQRg5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 12:36:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbjBQRgz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 12:36:55 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 850346FF02;
        Fri, 17 Feb 2023 09:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676655411; x=1708191411;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qLd0m/XUyE1Nr2pXG0Tqe4gHjkLs5JGvWL+2eG7JJL8=;
  b=Fkol45ktWppwbjsFvFr6wRnjtVG0wdq8wN8d/3S5TET/DpIZKdq4RQyS
   Y5ZpufSGnMFlWiohpM79AU4lttMjM+nVZHOcIY5gMRSJcDghY1TTlDIye
   PLLZ8ZhtMVF9EDGaPzOx8ZeSj1VxRupOSCRTz4AhNJ1tVPCHx6u/hGpMW
   Nr1mpl8L66Eusspa2ggwGv2BB1KVvmgbfZQlkZ3e+0GnmUem23CZ/MgZz
   iYHcR7t7/55U01of64k75/D49X2F/N3xCjFjk56G7PxP+T4B/G/44SgcE
   2v8soWDmsihruVT7IhLy15uJ4tuk+m1wHlM3kRdPo/fpPNsC/ZpqysFua
   A==;
X-IronPort-AV: E=Sophos;i="5.97,306,1669100400"; 
   d="scan'208";a="201482107"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Feb 2023 10:36:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 10:36:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 10:36:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=karsR/duwZ5Cz4l49rR/KiuHbmkvfRpFanVsfdtNKLvvP+xg/zx0yvkN/9loSpeNdi6iJuWst7ipm4AupU7zTSyhrxMoTvqxJEVrV3XyndIl5EHMyoD7BV9vgZ9Zgl91z7vENmAKzv3NT61HhcvtNkIk0o0s5hUuMjojejnfb+9jh0vGRbnlegWvpZSCHLAV6RXcjqmmXC+VRuvGuXBjCKh3T+klt1LGNkXyIeONBnF3qcnvyvoMvjLU0Zsnk5rLmRuZ1e46OXGUtIxTS2x8+5iuOdeHEKE0N298/gt1dFma9RAMEnOKQq/jaCB6syKhkBWtjb7yxBTSVhsUs0AaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLd0m/XUyE1Nr2pXG0Tqe4gHjkLs5JGvWL+2eG7JJL8=;
 b=Fx+rxY9ZZTvs7Mv7ny62ksrkx/w5YfR4yPJURmwPHYx8SbU0Rswt8fHlsTwhEeycgNcZQaW300IKI5rWRLwh4Jre1pY5za5+GVhp7Fv2CHuPYKzAIa5fGGU/P+m+JWOsBMHZTwOQ4h+3UwYBxceqKpenop571n/kSWFnot5FCGmkfcnSNhp5Zdk6Aps18YEFgSt4NVOP8SzxNGrPSGfJJAH6ISdGHTu5dmoZ/j+XEX0jXUOJYbKemdb0gyo5iCQYHd+Tl4440E+gAAdyKcdHqwW+ZO2/AEyek4NsMFPQxx6wZy8IhN1KCpKyBsJbKwn3DV4PE5GfCTOACu3H5C3byw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLd0m/XUyE1Nr2pXG0Tqe4gHjkLs5JGvWL+2eG7JJL8=;
 b=bZ6BHunCoOPIsDEI3d0cfWMRznCbhgb8LYY4JseEnLfE1LEM92bHhR/7gX4kxwq/j2lq6eZjZxknKzevbQeMVnvlNhKSouH7mtCxkESs+kvpyn8Ts4/SlnVYghPnq3adWxVlMmrc77y2KJaL/yVIknDAtCWfnRc97hehQl1jmlA=
Received: from SN6PR11MB2672.namprd11.prod.outlook.com (2603:10b6:805:58::32)
 by MW5PR11MB5860.namprd11.prod.outlook.com (2603:10b6:303:19f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.17; Fri, 17 Feb
 2023 17:36:47 +0000
Received: from SN6PR11MB2672.namprd11.prod.outlook.com
 ([fe80::9946:fe61:3211:4262]) by SN6PR11MB2672.namprd11.prod.outlook.com
 ([fe80::9946:fe61:3211:4262%7]) with mapi id 15.20.6086.026; Fri, 17 Feb 2023
 17:36:47 +0000
From:   <Ryan.Wanner@microchip.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <Claudiu.Beznea@microchip.com>
Subject: Re: I2c GPIO Recovery with pinctrl strict mode
Thread-Topic: I2c GPIO Recovery with pinctrl strict mode
Thread-Index: AQHZOx16zGlzhrQDN0+TB+zF+/Sngq7GbWGAgAHjgACABFRSAIAG0b8A
Date:   Fri, 17 Feb 2023 17:36:47 +0000
Message-ID: <46dd4d9a-7dc8-48f9-69d4-d18ca6433acc@microchip.com>
References: <b151531d-c9fc-cafa-4e46-e213a9892247@microchip.com>
 <CACRpkdbK8A9X4nCZEc53-wXU0Vgkc53j_r5rLQiSeoNbmvm8sg@mail.gmail.com>
 <961a2164-640a-86b5-980f-73668eb161e4@microchip.com>
 <CACRpkdaKYN9eRtuOhBBp_50sR71AQvNSKtjAR1RZPhaKYhfJVw@mail.gmail.com>
In-Reply-To: <CACRpkdaKYN9eRtuOhBBp_50sR71AQvNSKtjAR1RZPhaKYhfJVw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2672:EE_|MW5PR11MB5860:EE_
x-ms-office365-filtering-correlation-id: 1c7bb1ba-2d2f-4941-80a5-08db110d8b84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3kXymUPcgvzO/5ZhHtTO9BFbHMnndAyL1OPumJntub3EzvgOqge8GinsrNz/NsLUEW8j4KlhQBZqbQHHdb6OSziZ3OoD9yoUuR96VKar5q9i+dSM3y1TEPG0Kaj43enMgwtCnI9Rk5PFI8cHZ433fiwUhA2Of4xq5VOteWvvLKzkGFGUUDMtTgaMGd3TduoYlWVSWzhlPMsmLajLw9Ro9tCHaq/ImmBQzAabfC0nsgm2F4g+hK8CiaRP0hkuaVHvdM/DVrTZkb3kcdC/+wegVB+DD29Blox3uRBzwhJAF1i1Yn8sL1c/yhdA7JSRd0qnNJztxZwzopTdkVZgHCo9uhoevaFPPScBU+dr6ZMNix5GeQEu1C9aNh2lY5MIeBVIMdQm7WSm2FsHlLTpNQeX2FjJsBmjPjrBroQT6DuvSQ1X3Y64sprX7pTMwZjkFORGI8iNeA5dp1LXA2z1uVpuXhJDn6yO1sCY6uiEV5BxK2Ui+/9+1vEybBPyj7Si9zHAwsqF6vT383NTfkur3rA7P9XIJTBWDQ3ikfOia0n3y8NVk+G03spmhVidwNt4Zr56gZ05cqI/hxNizkDizi77hB0vGqfqKyj3CttUAz15BafljayaD9x4farjnq7URRFzEo3cEUU5qbKNnm/73c0Gbp3GpURfX3kTeFDlxlNzTScgvxXf4jWzXbSe2dDJfdFvCQe3Wallzj7PGNNaajXRjUvMjU49OZsazwz5Lut7imE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2672.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199018)(8936002)(54906003)(316002)(2906002)(71200400001)(38100700002)(36756003)(2616005)(86362001)(53546011)(31696002)(6506007)(107886003)(186003)(26005)(6512007)(38070700005)(478600001)(6486002)(122000001)(5660300002)(31686004)(91956017)(41300700001)(76116006)(83380400001)(6916009)(4326008)(8676002)(66556008)(66946007)(66476007)(66446008)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RCtVUDRiU0RmTFFtc0drSFM5UzE0VzZidkhOOE9NODhYSVFiN3QrM2FnTFJp?=
 =?utf-8?B?Tit6ZnMyVFZPNklQNWQ0eUw5NEJnTzg0T2piLzUzWnpWRUlzUUc1ZmFPYTlz?=
 =?utf-8?B?V3NBK3RCR2JnbjVEallYRWx1V3BQTXZGcjhxK0xvMHJ2NHk5aUExQzFyeVhB?=
 =?utf-8?B?d0lWL0ZuRVFSN3pOZlU1b3R3SFYybWtWdUxBazFhbVkwNGQxais4dnNNcWVn?=
 =?utf-8?B?V2lNVXEwaUtlQms5QTRoUWxGUDk1S0tWcUJoN25wdGtQb1J2ejBoaVo3QWdl?=
 =?utf-8?B?dzhpL2xWSHYvdzdma2tBUWEwUnhyMjd0OW5mb2RsZmp1N1lidWpjc0RXQ3NX?=
 =?utf-8?B?NE9IenJZeW1iRkdxSWFvRm5mMnQzQUtCWGdiUm1mc1R0RE5ybVdMTXcrN0k1?=
 =?utf-8?B?MTh2RGVaQTg5cWJuckNBQVlZL1VQTW9ISFNqYnJRNE13aHg4ZCtocFd3encz?=
 =?utf-8?B?eUV4Z2ZRMHN1VDJhVFhua3hlZExzK3ZleU5wSFdmZEN0LzdrMG9LNUN2byts?=
 =?utf-8?B?MzZ1MS9ZaHVOdkJRWWVwMXVLOGc1d1dJQTBrNFNDRUhMQ0hId1lFM050Ty8z?=
 =?utf-8?B?b3IwbUs2bExlMXY3dnI3QUdUUEszSmY2aE9sMHdWTXRmMnE5SG0yQ1JlOE5r?=
 =?utf-8?B?OEErMUdSb0NqMy8rNy9TNG9vb05aVnE5MnZkWkZkVFBEcHhCT1ZIRlM2b3Nw?=
 =?utf-8?B?eDZiSHBqQktaV0pkS25WQ25lNmNvSUY2SURVNHMxSlNuZWdwMWROdUJteGNo?=
 =?utf-8?B?bDhZVmNjdkh0aVRKMXFkbzFOd1hvc2VHbS8wZ1M4QXJCVk93WjZtd1JpQ1cr?=
 =?utf-8?B?Y1ZCZndjNFRyKzF5UmxFMmhRVi9UNzdNWWQyRHNvYkZJcmpETExQUy9WTk5K?=
 =?utf-8?B?MW9yYzdRMzhxWjkwTkZVVTYyU2FnUWR2NUhJZ3UyTk40cExCaitQQ1E5VU5i?=
 =?utf-8?B?ZVBOaXd5OGMxWXFqSHRpckZPYTBseU1OdVd5RnJ3UUlONnFXWEJBT1QzUWtC?=
 =?utf-8?B?bE14ZDRML24yWTVqT1p4VXZGakk3Z3daU3I1UVVSS3UwUC8waXVLd0FzcHpI?=
 =?utf-8?B?SHlsQkVHZjMzY3pURjFyeHA4amNFU3ZYUzFya2QzY0ZJR0NIZHRQZHVDWFdJ?=
 =?utf-8?B?bjIyd0dXVW1Nai96bGRIc0Zpb0dTOWhwa1B4OGNvUGdRTjRjcG4yUUM0T0tt?=
 =?utf-8?B?SmF3VHluaFhRVGtUTDZvWk96UER3UkNJdldqcXI1c0tkVjA0MTNxM3J5blhq?=
 =?utf-8?B?VVJ4eFlYRnFPKzM0TkNhRThrdC9EdFVrSXM3eTRPa2tvZzh1WFRTMnkzTjBI?=
 =?utf-8?B?eGZKVW5qKzJVcWlSMm1YQ0NQbnByeWpEVmlScFIxbmI2RXFzK0drWXV5T0ZN?=
 =?utf-8?B?Z2pSZVM1cnZEdkt5RmN0eCsybXdRN2lSLys5dXlZam9iNENrVTVzdExVR2NW?=
 =?utf-8?B?SzBxQWxWRE80T3FDeFBEeHVnd2VsL1FodW5DYkVRbFFROXd5UVRHMHJCQnQ1?=
 =?utf-8?B?R0ZrRitPeTI1ZHVLeGc2T2ZpdTlvM21EeHJVUm9JT1pIK0ZFMHUwS3VGM1Vy?=
 =?utf-8?B?WC9KaWxZdjA1aUlnWXRFZXhJSlk0MmdFajYzVTJxMlZvODNEYjcrL0pyN3BF?=
 =?utf-8?B?cVZ2VUoyT3V0U04rYUNsdm1IbTVUblVTRkpFUDhCZXFGSE9GbE82NFd0OFh5?=
 =?utf-8?B?bmpwVjZoUCtmWGt2cTh2eTBLTDBUejJiamt1cG5kTTZneEdUQkR1ZkF3Wm1D?=
 =?utf-8?B?ZFZMQXRpWERZUEUrSStlVEhOa0hHVVd3dmF6cW92OEprc0tsNFU2T0xTMnlR?=
 =?utf-8?B?Y0paZHkzbjA1cVJSMGdFVHBockwwMlBDcGh0dk5STkJNUTJwNFBqN2hsVzZ1?=
 =?utf-8?B?UUhqNGpWNjJKVmxCSlhUUHpmd0xmTnIwZ3AwQ0hYTUM5T1FmMGJ3OTFDRk5v?=
 =?utf-8?B?RlRJN0JjdTN0MXBacGNLMGJUVkxjNlpjeC8wZThCL3FlN05TYVNMSTU5NElo?=
 =?utf-8?B?R25uMnBwZDJkUzErZGFrNEVZUDlnWTJuUy9NcVcrMEw5SjhzdVk1cndXTFpx?=
 =?utf-8?B?OU90UGlSRnpjczQzUFJSeDFWOEJHNzUxS3BxV1FpMm1DVGd3U21VbVd0QkpV?=
 =?utf-8?Q?9jDAjC/CGkVD+69Lfom2wVJWg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8C8B47B76D2844383AE10C34FA0BF53@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2672.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7bb1ba-2d2f-4941-80a5-08db110d8b84
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 17:36:47.5708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xdg9P6MM8qNsO4xsSt5Fxjsb0jC1Ik1dEtr4TxxIVMPKSif2ZKnUVxIjfe4NvrPgpDcZtPLWD1SuUSqEKl6totoMZRTL249VRuRg+IPG3+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5860
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMi8xMy8yMyAwMjoyOSwgTGludXMgV2FsbGVpaiB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6
IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0
aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBGcmksIEZlYiAxMCwgMjAyMyBhdCA0OjIxIFBN
IDxSeWFuLldhbm5lckBtaWNyb2NoaXAuY29tPiB3cm90ZToNCj4gDQo+PiBJIGFtIHRyeWluZyB0
byBlbmFibGUgLnN0cmljdCBpbiB0aGUgQXRtZWwgcGluY3RybCBkcml2ZXIsIGFuZCB0aGF0IGlz
DQo+PiB3aGF0IGlzIGNhdXNpbmcgbXkgaXNzdWVzLg0KPiANCj4gU3RyaWN0bHkgc3BlYWtpbmcg
KGhhISkgdGhhdCBmbGFnIGlzIGZvciB3aGVuIHlvdSAqY2Fubm90KiB1c2UgYSBwaW4NCj4gaW4g
R1BJTyBtb2RlIGF0IHRoZSBzYW1lIHRpbWUgYXMgYW5vdGhlciBtb2RlLg0KPiANCj4gRXhhbXBs
ZTogaWYgeW91IHVzZSB0aGUgcGluIGluIEkyQyBtb2RlLCB0aGVuIHJlYWRpbmcgdGhlIEdQSU8N
Cj4gaW5wdXQgcmVnaXN0ZXIgd2lsbCAqbm90KiByZWZsZWN0IHRoZSB2YWx1ZSBvbiB0aGUgZWxl
Y3RyaWNhbCBsaW5lLA0KPiBiZWNhdXNlIGl0IGhhcyBiZWVuIGRlY291cGxlZCBwaHlzaWNhbGx5
LiBUaGVuIC5zdHJpY3Qgc2hvdWxkDQo+IGJlIHRydWUuDQo+IA0KPiBUaGUgc3RyaWN0IG1vZGUg
d2FzIG5vdCBpbnRlbmRlZCBmb3IgcG9saWN5LCBpLmUuIHN0b3BwaW5nIGtlcm5lbA0KPiBkZXZl
bG9wZXJzIGZyb20gZG9pbmcgd3JvbmcgdGhpbmdzLiBUaGV5IGhhdmUgZW5vdWdoIHRvb2xzIHRv
DQo+IGRvIHdyb25nIHRoaW5ncyBhbnl3YXksIG9uZSBtb3JlIG9yIGxlc3MgZG9lc24ndCBtYXR0
ZXIuDQoNCkkgdW5kZXJzdGFuZCwgc28gLnN0cmljdCBrZWVwcyB0aGUgcGlucyBtYXBwZWQgdG8g
b25lIG93bmVyc2hpcCwNCnNvIGlmIEkyQyBoYXMgdGhvc2UgcGlucyBHUElPIGNvdWxkIG5vdCBo
YXZlIGFjY2VzcyB0byB0aGVtLg0KDQpXaGVuIGl0IGNvbWVzIHRvIEkyYyByZWNvdmVyeSwgbG9v
a2luZyBhdCB0aGUgSTJDIGdlbmVyaWMgcmVjb3ZlcnksDQp0aGUgcGlucyBhcmUgYm90aCBiZWlu
ZyB1c2VkIGJ5IHRoZSBJMkMgYW5kIHRoZSBHUElPIGF0IHRoZSBzYW1lIHRpbWUuDQpUaGlzIGNh
bm5vdCBoYXBwZW4gd2l0aCBzdHJpY3QgbW9kZS4gU28gc2luY2UgSSBhbSBlbmFibGluZyBzdHJp
Y3QgbW9kZQ0KZm9yIHBpbmN0cmwtYXRtZWwtcGlvNC5jIEkyQyByZWNvdmVyeSBjYW5ub3Qgd29y
az8NCg0KVGhhbmtzLA0KUnlhbg0KPiANCj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoNCg0K
