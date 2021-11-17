Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92A7145463F
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Nov 2021 13:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236331AbhKQMVB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Nov 2021 07:21:01 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:16888 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233484AbhKQMVA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Nov 2021 07:21:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637151482; x=1668687482;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NgeZiNtO/lmNVkr5nEd8PQRdQOAs210Ya6c7JNuQbb4=;
  b=2UfCgIWYUjOSqp2WNIerlrGIqfHgYLykuVChcflnz9haq3D74RTus+sM
   mOwixtaHNfI8FLoE5+dW1fZPHYnJ4PcfFoQLlzMYmU4FILaMm7fTwQOB9
   ibeSE7pi25/iM8mK7ek1Q8r6Ps3soNauVIJTRZlAr2QQlf0ctiQmbGCy6
   mVDXYDvV41XmBTN/nhv48TJvjcFCXoelJAr3DdlQlQTi4q5eIEds0Mxm7
   AQoPoa2iYoS2KJ5RneH2AEcJxPmYbO6rUzd3C2n9z1bhrz3UOBXr8qKqI
   ImxftEetokDc0D7+rbQFrJF6ljleOTxgkP3x5jjtYCNbQu1biQiZVrJg2
   g==;
IronPort-SDR: gZNncq9HmS8qohCt5pygXsctzLHsiGN/Azwn6o0REPTliOATxcfNMyRpf7KFnvXpZeXxcQCvkS
 fS0ObI41N9lQekjfYp2ZbUrdOGnAuxLv4XmoNXgTsuZ65AYNkzActEJQ3uk8CfBX07bZa36fL9
 pPOPP+JszuDO9g/dS7nSUhOlGDU/ERU6FLmFdU2zGikLzQsKIurY+tsTPM52VhaSJ9YMnAizOz
 XZSc71aOWNUFA53zeShL/vsP2BqgC6Qf/yfIftDmqf+iG0fyxXWDHxE9TGKOKbHSSOCQIn35+6
 Yz5HNZHcInuTzcv7VLXwESrg
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; 
   d="scan'208";a="139421958"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Nov 2021 05:18:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 17 Nov 2021 05:18:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Wed, 17 Nov 2021 05:18:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACHzfojvXkkP49kaDGLdkqrIc3O6EnudXuGQOSg1M7O6hkvAMJrY2UbCcVs4uZdlvGH4wr5GhTeZyIX/Y/zJYaSUZ61bIx7qU3WJLApTbphKE4Fl1KnAMeeFtcIVLAopREYmX7+O+mUzwhnKFBxcTkYn1dfEX/1NLYKqaFQ6dYpq9CAym+j7XDcLKU0rQXX/fkuCw/KBggaNqjQrQf2QX7BavabLT3780bmnA06v6zs3bzFc+++m5CZzmlrPpordDNjS73/whUSTYoYs6rccuSPO1Rx1HgXeT+czHhWHek6k3vMX0FRDVLS23qfEX4yGQLcFBzkUBLrYBZl5zmL1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgeZiNtO/lmNVkr5nEd8PQRdQOAs210Ya6c7JNuQbb4=;
 b=H1WLzsjXkPI/GzAzgRFJArMqyFbqJ78kZjAhk4x29wBMpoyvkFSdi1ZqIlNm+G1DkQ1DNeJx85i7ApzglF71RKxFsSknZjS2hzlq/RbJ0Kgaznb77Te3AoM3cTK29XfH5pzjRQESVFjZiQcq0KCrGnw5kwnaoxVLLraY+EXb1PcWNJTMvOhQ2xA4Oy9LFXhCs5ubYOXj7ZSo5e19SZAxQPxw9BxXxBWuBx3GRb7Cfp3872Tecbn8BLMxUKGKZNedXnIds61plDj+pSYj4F5XkIgmCW1qEjQSqUHc8tTkXYtCI0vc/6E6JoCEtuyKA829d4qULNtphC6md5s6Oo3Pxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgeZiNtO/lmNVkr5nEd8PQRdQOAs210Ya6c7JNuQbb4=;
 b=cfBeowPiqO+oj+2yY3C24NAH89Qoo3dZBrbGU4vxv2dOfNYb0wgWisI+jJqQsmJghIZJG+NixAeULBJsB1iESBCZiRilvn/89MEIIVyzem5H/2R4FSkKK5xid0cWo7h7uO8KTGenZDZRQp/EFYWF8QaNMYesWZluNLqgQBameU0=
Received: from DM6PR11MB3258.namprd11.prod.outlook.com (2603:10b6:5:e::27) by
 DM6PR11MB2795.namprd11.prod.outlook.com (2603:10b6:5:bf::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.25; Wed, 17 Nov 2021 12:17:46 +0000
Received: from DM6PR11MB3258.namprd11.prod.outlook.com
 ([fe80::7434:aab3:637a:66f6]) by DM6PR11MB3258.namprd11.prod.outlook.com
 ([fe80::7434:aab3:637a:66f6%5]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 12:17:46 +0000
From:   <Daire.McNamara@microchip.com>
To:     <Conor.Dooley@microchip.com>, <geert@linux-m68k.org>
CC:     <linux-riscv@lists.infradead.org>, <linux-usb@vger.kernel.org>,
        <Lewis.Hanly@microchip.com>, <linux-rtc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <atish.patra@wdc.com>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alexandre.belloni@bootlin.com>, <paul.walmsley@sifive.com>,
        <Ivan.Griffin@microchip.com>, <devicetree@vger.kernel.org>,
        <bin.meng@windriver.com>, <a.zummo@towertech.it>,
        <jassisinghbrar@gmail.com>, <linus.walleij@linaro.org>,
        <linux-kernel@vger.kernel.org>, <robh+dt@kernel.org>,
        <linux-crypto@vger.kernel.org>, <bgolaszewski@baylibre.com>,
        <gregkh@linuxfoundation.org>, <linux-spi@vger.kernel.org>,
        <krzysztof.kozlowski@canonical.com>, <broonie@kernel.org>,
        <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
Thread-Topic: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
Thread-Index: AQHX1LJ2/BRZZb83x0iYi6b9K34Zn6v66E+AgAHqWICAAArPAIAH5wOAgAAKzwCAAuGSAA==
Date:   Wed, 17 Nov 2021 12:17:45 +0000
Message-ID: <22e550697eaf362e6c47f6ce0da7182ceec2d44d.camel@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
         <20211108150554.4457-13-conor.dooley@microchip.com>
         <CAMuHMdWEhJj0Cqt3sgGvgZe7JSFqBmTgtZRkom30NKqEW27NvQ@mail.gmail.com>
         <0e379411-2469-8c78-1a3f-0645579a967c@microchip.com>
         <CAMuHMdULO5gJcbnsDzZcVShmYkByyM30f9nYyDD8e4PJ6nrnCQ@mail.gmail.com>
         <e91ebf36-5a8b-9d9f-d4f0-aa9e38e7a41f@microchip.com>
         <CAMuHMdUQRJHkbwj++jJBMG7QqLd5_bmzUrMzyxEd92bgZbvDYw@mail.gmail.com>
In-Reply-To: <CAMuHMdUQRJHkbwj++jJBMG7QqLd5_bmzUrMzyxEd92bgZbvDYw@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 314cde23-6dfb-4be4-a78a-08d9a9c44392
x-ms-traffictypediagnostic: DM6PR11MB2795:
x-microsoft-antispam-prvs: <DM6PR11MB279568394784BA2DB3BE8D22969A9@DM6PR11MB2795.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +Db4djyYtS2i8yQmN7pnMCjgbeBY+/YgflKyy9Hp9b0beo6TKQGsK1STEGmAJwGmFOn0s3/OZdMs4b/sfO26iUeg0mXFXDvoqSQ763+ZaN5DGNOpJ+LlY9Uvayo1aya0H+DjNUH2tOswne/0K2a8lFiSK0XKzAD42QmzssWDErfyq2MNNZM9ooG9z3hk0O6293O0iTnXrpWeizHK2OYslhnC9NBghsabyYwixVwNH+FYbcD2fpTf5FGN5o5VPnTrrxogHll0KF6G6/NtQVRBMkRl1HB1MIwUzX0/g5sc7glyTXAx5S++vAC0qpooyXujDGpvmS3Of1BIzV64k+VlKPJfqaedFgEK/bFg+MTaW1eAs0w3JYeb1UhQ4WvqlT9UG6ztmipNLl3NC7Ou0qz3C64Z3LP9Z9m0/PbMwL+q97SohORznkU6RisPlWeOLL3kUAXrvCKQhXEjN6UWakfsHjdxbAe+wjyPQ2hSujUyqUbwBltAYuE/g8yQW/2uPF0xcRoBizQ7VlysyPJh0icTFMSZW7TAsiSvBWelJgILZV1HnOXn0Gi1RQnc57dgmdb6W0SY0y8hxAb8u73mJ20Ez3rqAb0tnQzMnTCvzd5/nbt7WNQPuUAccCMYTlNVylKsmRy/ANvu0DR6XceSpHC8Nhgz8SmglH4ruSlelj73we4SIFsT62BhmBpTRid1p2FblbVblCdNXPqa39tg1z3Ofg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3258.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(76116006)(66446008)(7416002)(66476007)(508600001)(6486002)(66556008)(110136005)(91956017)(64756008)(186003)(26005)(66946007)(54906003)(71200400001)(53546011)(316002)(8676002)(6506007)(83380400001)(122000001)(6512007)(36756003)(15650500001)(38100700002)(4326008)(86362001)(2616005)(8936002)(38070700005)(2906002)(5660300002)(4001150100001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1dpQ3J6YmtjLzRyRk4rdFlWNVZHQURySnp6R0tzeXg4QkFIT0dLbHZYNXk2?=
 =?utf-8?B?WTBaSjFtYU8zZnF0UmZHbHZBN2NpWGZLaWdkR1ZJMThrajJpYkNXcUZNWEJz?=
 =?utf-8?B?RkxTdnlrNHh2OURMVUQ5eTdaRW1xTTZEcmt3a2x2UTlsQTJGN2ZCaFNIZnAv?=
 =?utf-8?B?UXNsaFRscnBqOVJ1emxlM25LQStDZVg4L1k2SnVjRFphTm1xU25aeVUyZHpF?=
 =?utf-8?B?MG1hUjYxN3UyVHMwNWVUYW1VSXhPMmR6WEcwZXpVS1RXdE5laVRPbTRwUlJ2?=
 =?utf-8?B?d2l0eEVoVU1DdXBaZmg2cCtIMng3STVyMXJxOEpXc0xoNGt3VXduZlR0SlF5?=
 =?utf-8?B?SVVya25na1dZaFZyLzkxRHNXVnZzL3Z6ZU5IaEs5MTZmTTcvaUxPUlkweUR3?=
 =?utf-8?B?QnM1MjhTZlM1aWZ0TlpYNnhDaG5zcTBWKytyT2FQUnY5SHRZM1lYV1hrRGNa?=
 =?utf-8?B?VWp4bTBHSk5uSXVueTF6L0FCcTlIV0c2dlkwZ0xXZVo0Q1hUMSt2TWliR2R4?=
 =?utf-8?B?M0p4WEZsMmpONUtKQlVsTGJmY2FyZ1l2ZU5CTldrd3E3cm56S0czcjVxSTVy?=
 =?utf-8?B?dEx5WTIxSW14SkU0N3V4QnVnQnBCbDc5dW14VG9YbHozMkhwREMwbFZCakJj?=
 =?utf-8?B?ejc0Y0VtSFNpbGxDV2JXaTFNK01xQ3RMNW1ySE5penlQL0lwa2s3ZG1BVFJz?=
 =?utf-8?B?blVTZC8xV2xVUjBUSjEyYVJ2dFZFU0w4RHZyMmtiQndiOFZQOG96c0xIa0sr?=
 =?utf-8?B?Q0g2V1VLY3h0QnlBWktmOGExK3BIV3ZhWmxjMXhPVjZJaDVaR3J4T091N0J2?=
 =?utf-8?B?SkV4dUZDSW9UaHBNUVhJNmlEdzRIVmhNNmQ5T1RNWldPTXpmdzk4M05yc3V2?=
 =?utf-8?B?dHlCb1k4WlpOOFRKaFVFRUV6MWJTMVRPNkliQ2oxZFZwVHM3aTB4WDZkYXE1?=
 =?utf-8?B?YWx5RzFBUzBKT3lwL21XaTF3WWRyYUU4UFhZcGN2ampzZWc5WC9NZTh4LzF0?=
 =?utf-8?B?WWlnS2pLUURtZXlhVkFLUHR1cGM3Znk1UDRCUmkzOVNQSVJUTXhidG9SbmxF?=
 =?utf-8?B?VGtrV3dGMVNKOWNjMDdVaDR5VDRsYVZGdXFaSWphTk5EUHhnVFp6dWJKMURI?=
 =?utf-8?B?Zml2K3RsMXhCVlhRTklCV2J1SVNEQmFEcnVpMmpZVFZocTY4ME1uRHM4VGNl?=
 =?utf-8?B?YmNtMGtpTVJIaHNvNVhpdUdmS09CSGJPb1NWMFBZSUphLzh1UjJBVWkzYmlv?=
 =?utf-8?B?ZDZUbGxoNzJ5Ky9zVXh2VERDd3lKU2N6bGF2TGo4bCtSTk1yYjEzVUFNVW93?=
 =?utf-8?B?VDRCTGJFc1ZuSEIvYUR1VUFPT1FkcGw0bEtWNmpQczZHOTQ3d0UzeW9nTmpq?=
 =?utf-8?B?N2pmQnQ5R2JvZk4xTmdHTVV6K2Y0cG0rS2FoTHdobTkxeHRFTndMQ2ljRlZ1?=
 =?utf-8?B?eDJ5TEJNNEVwVmhYTG9Kck1zR1FyM1BOazMzbUNNbzZqTHpqVlIzUE41ZHRI?=
 =?utf-8?B?M1BrblY1NzUzVnhQelkycG5RbG9RTFlzY2NKcUtGVjJLNVJjRk5QMjNjYmVo?=
 =?utf-8?B?UHhVK0xpeU41Ykd3dVpDRFlPUTVuQkxJVUswc1lpUjZnVFZ2ZU5aajZINFg2?=
 =?utf-8?B?bGwySHVmZ2twVDE1VzVJQ0JGQllpTTcybHFQTGhLUnhOQkFzbFJRYkphaGFm?=
 =?utf-8?B?VFcrVG10b2dwSFgreFM5U0o0QUk5bFZOb2R0SXgrSW1haFY2dkNBQ2VzNFdQ?=
 =?utf-8?B?ZjZrQlFnZ09NYWorb2tzblp3V0tLOTc1UE15VnAycHpiSWlpTFpuR0NLREx5?=
 =?utf-8?B?M1dVQXRmRVFvWnd1QmZBektRam9aMzdQZDBHeFRyczE4eWNCOGorS0NnY0Vl?=
 =?utf-8?B?aVBPeWl3a1hzQzd2VjJHOUYzVkJIVjl5R1lHU08rSFVKcWQwSDNzY0VtaGxv?=
 =?utf-8?B?djJ0V09xK3VYR3NiSkJmTDJkdVFGZ1c5bVkvdURVdnNWMjBJLzhFcjh4STVR?=
 =?utf-8?B?TlRERi8vQTB2akRQNG8xWlIzNVdmMjdnWFdKakw4ZnkxMkN4TVR2LzBIZFpX?=
 =?utf-8?B?R3Z4bG5LaWlyQnUzNU9ndVNtWmNXWXEzaE0zNXNlOW5kck4xbWsvNkp4Ukoz?=
 =?utf-8?B?Q0lBWUNkeWFzcXh4V08xaDZVbmk3bjgxNVh5NEU2VHR6K3dhMFB2MGJQbUxM?=
 =?utf-8?B?R1JtRW5vWFMwL2FibE9qZUxCV2pEbVorYXFJWExpTmdOVzgzM0RSK3ZXZDh0?=
 =?utf-8?Q?u2/LqK652g6uHRz/ac1WpMy3IKpCraYb6ATFC6t9QQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9975CE6D666A74B8B8BE881E2A0E2B0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3258.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314cde23-6dfb-4be4-a78a-08d9a9c44392
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 12:17:46.0375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /5LbT3phFs+VfwQ1IN0pLd0H9mYEv0YAQlk7U8oqp8pU5CHWUIt/kPOP0Ao9AhaNLErSwLkRDvwXJCIk4ztna1Dx0MTkWa7kz0ywSRM9uzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2795
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gTW9uLCAyMDIxLTExLTE1IGF0IDE3OjE3ICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bmxlc3MgeW91DQo+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gSGkgQ29u
b3IsDQo+IA0KPiBPbiBNb24sIE5vdiAxNSwgMjAyMSBhdCA0OjM5IFBNIDxDb25vci5Eb29sZXlA
bWljcm9jaGlwLmNvbT4gd3JvdGU6DQo+ID4gT24gMTAvMTEvMjAyMSAxNDo1OCwgR2VlcnQgVXl0
dGVyaG9ldmVuIHdyb3RlOg0KPiA+ID4gT24gV2VkLCBOb3YgMTAsIDIwMjEgYXQgMzoyMCBQTSA8
Q29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+ID4gPiB3cm90ZToNCj4gPiA+ID4gT24gMDkv
MTEvMjAyMSAwOTowNCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+ID4gPiA+IE9uIE1v
biwgTm92IDgsIDIwMjEgYXQgNDowNyBQTSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+
ID4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiArJmdwaW8yIHsN
Cj4gPiA+ID4gPiA+ICsgICAgICAgaW50ZXJydXB0cyA9IDxQTElDX0lOVF9HUElPMl9OT05fRElS
RUNUDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgUExJQ19JTlRfR1BJTzJfTk9OX0RJUkVD
VA0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QN
Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBQTElDX0lOVF9HUElPMl9OT05fRElSRUNUDQo+
ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgUExJQ19JTlRfR1BJTzJfTk9OX0RJUkVDVA0KPiA+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4gPiA+
ID4gPiA+ICsgICAgICAgICAgICAgICBQTElDX0lOVF9HUElPMl9OT05fRElSRUNUDQo+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAgUExJQ19JTlRfR1BJTzJfTk9OX0RJUkVDVA0KPiA+ID4gPiA+
ID4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4gPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICBQTElDX0lOVF9HUElPMl9OT05fRElSRUNUDQo+ID4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgUExJQ19JTlRfR1BJTzJfTk9OX0RJUkVDVA0KPiA+ID4gPiA+ID4gKyAg
ICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4gPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICBQTElDX0lOVF9HUElPMl9OT05fRElSRUNUDQo+ID4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgUExJQ19JTlRfR1BJTzJfTk9OX0RJUkVDVA0KPiA+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4gPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICBQTElDX0lOVF9HUElPMl9OT05fRElSRUNUDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAg
ICAgUExJQ19JTlRfR1BJTzJfTk9OX0RJUkVDVA0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAg
IFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBQ
TElDX0lOVF9HUElPMl9OT05fRElSRUNUDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgUExJ
Q19JTlRfR1BJTzJfTk9OX0RJUkVDVA0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIFBMSUNf
SU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBQTElDX0lO
VF9HUElPMl9OT05fRElSRUNUDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgUExJQ19JTlRf
R1BJTzJfTk9OX0RJUkVDVA0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQ
SU8yX05PTl9ESVJFQ1QNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBQTElDX0lOVF9HUElP
Ml9OT05fRElSRUNUDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgUExJQ19JTlRfR1BJTzJf
Tk9OX0RJUkVDVA0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05P
Tl9ESVJFQ1QNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBQTElDX0lOVF9HUElPMl9OT05f
RElSRUNUDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgUExJQ19JTlRfR1BJTzJfTk9OX0RJ
UkVDVA0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJF
Q1QNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBQTElDX0lOVF9HUElPMl9OT05fRElSRUNU
DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgUExJQ19JTlRfR1BJTzJfTk9OX0RJUkVDVD47
DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gV2h5IG92ZXJyaWRlIGludGVycnVwdHMgaW4gdGhlIGJv
YXJkIC5kdHMgZmlsZT8NCj4gPiA+ID4gPiBEb2Vzbid0IHRoaXMgYmVsb25nIGluIHRoZSBTb0Mg
LmR0c2kgZmlsZT8NCj4gPiA+ID4gVGhlIGludGVycnVwdCBzZXR1cCBmb3IgdGhlIGdwaW8gaXNu
dCBmaXhlZCwgdGhlcmUgaXMgYW4gb3B0aW9uDQo+ID4gPiA+IHRvDQo+ID4gPiA+IGVpdGhlciBj
b25uZWN0IHRoZSBpbmRpdmlkdWFsIGdwaW8gaW50ZXJydXB0cyB0byB0aGUgcGxpYyAqb3IqDQo+
ID4gPiA+IHRoZXkgY2FuDQo+ID4gPiA+IGJlIGNvbm5lY3RlZCB0byBhIHBlciBncGlvIGNvbnRy
b2xsZXIgY29tbW9uIGludGVycnVwdCwgYW5kIGl0DQo+ID4gPiA+IGlzIHVwIHRvDQo+ID4gPiA+
IHRoZSBkcml2ZXIgdG8gcmVhZCBhIHJlZ2lzdGVyIHRvIGRldGVybWluZSB3aGljaCBpbnRlcnJ1
cHQNCj4gPiA+ID4gdHJpZ2dlcmVkIHRoZQ0KPiA+ID4gPiBjb21tb24vTk9OX0RJUkVDVCBpbnRl
cnJ1cHQuIFRoaXMgZGVjaXNpb24gaXMgbWFkZSBieSBhIHdyaXRlDQo+ID4gPiA+IHRvIGENCj4g
PiA+ID4gc3lzdGVtIHJlZ2lzdGVyIGluIGFwcGxpY2F0aW9uIGNvZGUsIHdoaWNoIHRvIHVzIGRp
ZG4ndCBzZWVtDQo+ID4gPiA+IGxpa2UgaXQNCj4gPiA+ID4gYmVsb25nZWQgaW4gdGhlIHNvYyAu
ZHRzaS4NCj4gPiA+IA0KPiA+ID4gU28gaXQgaXMgc29mdHdhcmUgcG9saWN5PyBUaGVuIGl0IGRv
ZXNuJ3QgYmVsb25nIGluIHRoZSBib2FyZCBEVFMNCj4gPiA+IGVpdGhlci4NCj4gPiANCj4gPiBU
aGUgd3JpdGUgKGlmIHdhcyB0byBiZSBkb25lKSB3b3VsZCBiZSBkb25lIGJ5IHRoZSBib290bG9h
ZGVyLA0KPiA+IGJhc2VkIG9uDQo+ID4gdGhlIGJpdHN0cmVhbSB3cml0dGVuIHRvIHRoZSBGUEdB
LCBiZWZvcmUgZXZlbiB1LWJvb3QgaXMgc3RhcnRlZC4NCj4gPiBCeQ0KPiA+IGFwcGxpY2F0aW9u
IEkgbWVhbnQgdGhlIGJvb3Rsb2FkZXIgKG9yIHNvbWUgb3RoZXIgYmFyZSBtZXRhbA0KPiA+IGFw
cGxpY2F0aW9uKSwgbm90IGEgcHJvZ3JhbSBydW5uaW5nIGluIHVzZXJzcGFjZSBpbiBjYXNlIHRo
YXQncw0KPiA+IHdoYXQgeW91DQo+ID4gaW50ZXJwcmV0ZWQuIEFtIEkgaW5jb3JyZWN0IGluIHRo
aW5raW5nIHRoYXQgaWYgaXQgaXMgc2V0IHVwIGJ5IHRoZQ0KPiA+IGJvb3Rsb2FkZXIgdGhhdCBM
aW51eCBjYW4gdGFrZSBpdCBmb3IgZ3JhbnRlZD8NCj4gDQo+IElmIGl0IGlzIHRvIGJlIHByb3Zp
ZGVkIGJ5IHRoZSBib290IGxvYWRlciwgdGhlIGJvb3QgbG9hZGVyIHNob3VsZA0KPiBmaWxsDQo+
IGluIHRoZSBpbnRlcnJ1cHRzIHByb3BlcnR5LCBqdXN0IGxpa2UgaXQgYWxyZWFkeSBkb2VzIChv
ciBzaG91bGQgZG8sDQo+IGlmIGl0DQo+IGRvZXNuJ3QpIGZvciAvbWVtb3J5IGFuZCBjaG9zZW4v
Ym9vdGFyZ3MuDQpXaGV0aGVyIGEgZ2l2ZW4gR1BJTyBpcyByb3V0ZWQgdmlhIGEgYmFuayB3aGVy
ZSBpdCBoYXMgaXRzIG93bg0KaW50ZXJydXB0IGxpbmUgb3IgdmlhIGEgYmFuayB3aGVyZSBpdCBz
aGFyZXMgYW4gaW50ZXJydXB0IGxpbmUgaXMgYW4NClNvQyBjYXBhYmlsaXR5LiAgQSBwYXJ0aWN1
bGFyIHJvdXRpbmcgaXMgaW5zdGFudGlhdGVkIGJ5IGEgcGFydGljdWxhcg0KYm9hcmQgKGUuZy4g
SWNpY2xlKS4gIEEgY3VzdG9tIGJvb3Rsb2FkZXIgZmVlbHMgbGlrZSBjb21wbGV0ZSBvdmVya2ls
bA0KZm9yIHRoaXMgam9iLg0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhl
cmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIA0KPiBnZWVydEBsaW51eC1tNjhrLm9y
Zw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUs
IEkgY2FsbCBteXNlbGYgYQ0KPiBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRo
YXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMN
Cg==
