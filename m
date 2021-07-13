Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9CB13C6C1F
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jul 2021 10:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234397AbhGMIqg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 04:46:36 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:52731 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234121AbhGMIqf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jul 2021 04:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1626165826; x=1657701826;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Q1z6EyHUN8ZZogVPBL3trusKA4tjxUlKHy6RtO76L+o=;
  b=FL5Vf/3G78Y7LSJJdSR2qL2S6n4nNGjATIj6lo0jrme3MNbFTrX9X+LV
   rnHOh1LRymXMWAmQFP6WdNJSu9YEWt+lFVV+PWTxMXCiCFAzcU7fWivfr
   FQRgiPNo7kVy/eFH3LKYPk1SDnRLKInOsurgg4H59iZVkuzwwHv74eZZk
   pEny2fuOQnWap3yaQhswDCaEwP0IBRpSlBawP7Hn5d7ny9M1U9co8T2U+
   KCUSRs4PkK4rwiRwzXXRbWkhrjtjouS1SlGgnH0vrDymqfqqZSZulDTA0
   dj2hvNGni5A66bbNauxh+O23Sh3Rof0uj4J3nhmL0kR5ru2bd43FibIl8
   w==;
IronPort-SDR: NPFsvc/aGrQ5u5FV+syWhe0qDTWlnkvjRxLfSTAQMcKzm7Y0pVneiDoM3qxKByrqD0EbTEFih8
 OWHwqhMNSTy+N7pHZPQfl+nYwCfrek9CYXAgud3DI73FEl6N6f/6szJUUe/xoC5cVbv69Ur39m
 ZqStAU0SKdp77rZxP8XiaVmTv6XFqEKlPx1OytqX82/StkHVVvIGgeC0eagzkHr3Xvj/zQmWol
 62qAPYdttnH6BJZz7bu5wapM65jurgiZ5aE2yw+L1dd/SsuZB9j8wsCoENFM08lAUZsmbMbDjY
 awI=
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; 
   d="scan'208";a="62025215"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2021 01:43:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Jul 2021 01:43:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Tue, 13 Jul 2021 01:43:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnYRdA9Ld8wBkNJ/Mv8LlodVXhEQLd+PuIol0HqZmPHSMkr11jRZ749nSR/pkDviidVfB7QrTWqXdy1NgKsf9VoM4A7O7M+29fNLTOVirtHeCGwTEXys4FdFgy/i67pgkJk2BFXabHgx9O+CQKFi7EQ3oJftJXK+RC82VfxrzWFQ9SulVuRqroea65r3fllJFjtYPpcqO4qDBSLO0YjAKfW0oJw8joaYJLZGP47rAogeea6nwmRa7PIqBGtpj2Mel0bEIoAaJG7K+zwwLIOaeU3HeEiLmh+ivZIz93eao+laXIuzXYAWZOsMTfuGRKD6bX4llngFzOqgwA0mKefgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1z6EyHUN8ZZogVPBL3trusKA4tjxUlKHy6RtO76L+o=;
 b=TNleo/dPD+0axGwFLEgb6ue+7wgtL7uoTh3BfwXs1Dp9QOWqskkN25I2rs3TUGqgoFVk+9ZFIA3Z1qaYYoXzscpP/z9r43dsLM85I0XaMmpdMF500lFeraYFYXe/+vao2g4x/iKnL9tExF24nNvP/tqpz0FxudujcPD6lc0Z81fCQndVP4IafQGbBe7D6+ibIq0/ckkFWDy277YfswHwqBxZgF+H4oJD+Ne3h4PRDJ+W2hnQ/bjYSqbxGe6/kT1EdA/bQS/l1+FoCn7YTIlXzuLcZ/Zwzofc3O7QqAeNDQU1u5RFpSTi93nkyfWw0XNwvubUKytdwudAxIrD1dWZ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1z6EyHUN8ZZogVPBL3trusKA4tjxUlKHy6RtO76L+o=;
 b=MdmwJdStKWQuWrybIlMPjiX4sRhkwiMOemHNJfwd+eXPkVlj98jX268M3Dvm5fa0zLAzu8vHW0xDXC+ZmXaWMdcy8crPdijLPhN0g2BdyG0IY+dENEMXSxp3uA8ssXE5kbh49iWQ25zdfGW34LxGFMetWFKHyDZ3OliSCelqgtg=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20; Tue, 13 Jul 2021 08:43:43 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::44ef:d8cf:6e86:2cd5]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::44ef:d8cf:6e86:2cd5%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 08:43:43 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <Claudiu.Beznea@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>
CC:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: at91: remove #define CONFIG_PM
Thread-Topic: [PATCH] i2c: at91: remove #define CONFIG_PM
Thread-Index: AQHXcZe9Daji3etcjEyeNNuBSNwosqtAoy4A
Date:   Tue, 13 Jul 2021 08:43:43 +0000
Message-ID: <aa7bccf4-c5bf-9358-65bf-fba63851460d@microchip.com>
References: <20210705121516.622326-1-claudiu.beznea@microchip.com>
In-Reply-To: <20210705121516.622326-1-claudiu.beznea@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b47afc1-50a3-41f4-7366-08d945da5285
x-ms-traffictypediagnostic: DM4PR11MB5341:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR11MB5341E4155F1DE3522C566CE9E7149@DM4PR11MB5341.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IugQs12lEwTySny9nnsgCnLNc+UjuWnULLRaiwe5HLIWJFTffQP54JXnjNDHp+TUjyVPcNVR9HiiLa6PMCduuESMktg6fFPUz/kB7vfoHZk2RztryIKy7KpLamMs0ud7fmg8cyDB7ivi2ehy9l+8+viDTsEK8qCJoSsXIw9iO2eqPivX6B9v9sjR3IAQquFgm0RnJOODCoyZrF9VXE8uF6t88nnd+kKXSIhKykCuKQGgSLormhAnz4OTK6s4SL3QU+MAABe63g2tcRV4rpMpW3jBFIb0oP+DTMIunI5knj7RITxuBBkn2GPdBhBkP6xX39rJcLjuN4XGyX+WVxGkoaN046S3kHQo1OXt6UGptzE9FbWC5myoHnqYKp/ZgNeY2LA1k9B1iebj5lRxJ5BJMxKf6X5Q1gwbDQiXWZZGfmMDcwK35Fea8Md1WJ3K1a0BUqAv4SbVFXib/x7gmFHMmqtUIbuWNI5IqUKzoXXW5GGSlHKU6rIQZv6QUvUT9urzCG05bsIvGU+ynVlwBBsJCqHXExzVbhYmKaWq8Ug4hqG13LEKYfkJLJPPEFqm1NrgAM8VNAUEwD8MI7rIbdTHzLR48+dWl6ozj7v4uZbVuoMcY39IC2ABrnNV+EBMul1lR+y8tCyVzO+m+5yaPLRC40f0EgoRMpAe/CVt8RusTJCLpuh8D5kHfLHjUBVVk7XTxaN3woVl4L5R84I+iLFGfIgWFaPMpWzDa1BV+i4XZLv6V+OryTgn+V+qGYiAeLCL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5687.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(39860400002)(136003)(346002)(2906002)(4326008)(54906003)(8676002)(316002)(36756003)(6512007)(110136005)(558084003)(2616005)(71200400001)(8936002)(76116006)(122000001)(66556008)(186003)(64756008)(6636002)(86362001)(31696002)(31686004)(5660300002)(38100700002)(26005)(478600001)(6486002)(6506007)(66446008)(66476007)(53546011)(91956017)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YU5DZlVtbnBEODdaTDh3cW90MTFRM0dzR1IweEVSOEVmZjJpOTFuTWN1bFpj?=
 =?utf-8?B?Q2JJYkdyY1VyMGxZQjlKMEtUMzRTUWhiSUoyc0dHU1dXb1JYZzFmUUhZKzdm?=
 =?utf-8?B?cnR4S1p3S1VGVyttaWV3cVBlZzJ4dEQ0eFFGL2VHSU9XN3haNDA2b0I0dW9p?=
 =?utf-8?B?MG5JUlZOcitSSzNJdGU1aU1SUVZhSjg1OC9nVGtTV2pVODgrN2lsN1NLNEhM?=
 =?utf-8?B?Z3pGUnRVbEhoNG1nd1NiNmdiMlQ0UWg0dkY4bGpuOG5WejVKMTBGclpNYitH?=
 =?utf-8?B?ZndOUXJrZEtYeC9TalQ3M3ZPa0dJbzEybGZYNDNRUUhNbStMYnRoZGx0bXBk?=
 =?utf-8?B?TGpzZ3ZmOXl2MEdyZlpaZmhxZVRnZmluVHZFR3o4MXhoYUhENDlkOUdTaUx3?=
 =?utf-8?B?U2daYS9oOXgxMmU0RS9pUkdTYjF4KytCZFVvdTZOM1pPaFVuZGp1bE9yQUcr?=
 =?utf-8?B?elZ0VEQ5b0NISVlsNlNubmdWTytja3FqRDQ1VkM0aEg0NitUNVpSc2l0Njhl?=
 =?utf-8?B?enFTNE9oYnltQTI2ZzFlVmNpVWVkQmF3dU16Y0k5U3psSk52Zng2QzV2L3BZ?=
 =?utf-8?B?OVpwSTcxTnhOcXQzQ3BseUVPMWZUL3RxY1VFUzAvbmVsYmZRS28yOXNNZ1li?=
 =?utf-8?B?YzJGbEN5RzJvRktRbElmZFh4UnJtalp1MVFSUDRQTzk2RXpwTys3MmEva0xP?=
 =?utf-8?B?QzNkZnJ6VmQyUzR3S3Fhcm5RcTRJQ2JlczBxTUNkSE1uYURSOUtTWnZFNTRC?=
 =?utf-8?B?My9uUXBtdjJWSnBEZ2lLb0N4STJ3VzRWVHdDL1NiU05GUUFRa2c5cUcrU2Rt?=
 =?utf-8?B?SUJSdFFhaXFBclRwWXAyREpUQVNHa0VEdUNLL1ZkOFRqdWxMdnU2TVQxTnlm?=
 =?utf-8?B?VVkvL1p1ZmRMWlQvUUtZbHB5TEc4SktOQmpUZjVzWWhrblBHRVY3NkhyTkZ6?=
 =?utf-8?B?WEJNL3ROb21yQlZ6amRJa2ZTdlRKMmJETzN1SzZ5Qk9mL1hob21HRjBwRnh3?=
 =?utf-8?B?dXFsWng5WG9RYjdhZE9IcVdoQUtKdUwvMHlDblkzNTJwOWN0Q3dvNmlZamI0?=
 =?utf-8?B?VjFwMmU4MllsQm8vemgzMWgwdjRzVVJkSW0yV0EwbXRhZDFhU2ZMUThRbjJC?=
 =?utf-8?B?RjhPeVV6aU0wOEtCM1VoQklOaDdoMEVTcW8zOThNSzAyYzFUSDRha3p6Tmk3?=
 =?utf-8?B?Z2tURmtPbzlkQXYrRkJHYktYVW51N0RzaDlTRHl4K3dPTmV6dDZxeGZ6TXVw?=
 =?utf-8?B?Ty95aXA4RWU1YVBJTHR4SEdRdHVwKzBTQTBRMytQd1RlcUgzdzBHNGJoUXll?=
 =?utf-8?B?d0lIYzdBQmFlUm4vT2VKTkV1c3FPSTQxRmhZTjl2QzZSVFZDK1ZXSmowY2FU?=
 =?utf-8?B?L1NKRVJVMTkySEx5a1laVzkxZGxmeXp5cEV5TVdabkxPRUE2TVdzcSszVkl5?=
 =?utf-8?B?UnRRaG94S1FLWUV2TVdRNnJUUGEyZVo5T00wa0tpQ3o5UmpLUHhxVGk0V21l?=
 =?utf-8?B?ZGY5RzRGOWJ3QlJQUnNBRVFLS2ptSEtxKzBhN2xsT3Fla2FVazM4YWlVM3Vx?=
 =?utf-8?B?aHRNWmdBemF2cjk5RlJ5RHFCZnJzczg0UXJ0ZVE2K0FuUkJDMTIyUEcxL1lr?=
 =?utf-8?B?R1Q5dXpSSkVPZnRTVlRrU1p5c1JBVFJZRHhDQUxJak5iYWFBbjVWYkFkVWx4?=
 =?utf-8?B?N0l2U2NVdVFuWGZjaWZpa1kxcWM4S2x3RWZhZDkyVVJidTVBbWFVQ1dwSnlS?=
 =?utf-8?Q?heIGg5OoqNyb3/1eR8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BE87A477FE3834AAE1CB10B3A35FAA2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b47afc1-50a3-41f4-7366-08d945da5285
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2021 08:43:43.7538
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F4ebxbEHxc8NLtV/Jjw74yRXiUOYMudehLLMWfyfAPuc7C2xTHmZYI9173ZqTXFMPgVU05MKdPUEmN/Zyv+Ozu8qZ/1n3f8pYGi3ivGIQdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5341
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDUuMDcuMjAyMSAxNToxNSwgQ2xhdWRpdSBCZXpuZWEgd3JvdGU6DQo+IFJlbW92ZSAjZGVm
aW5lIENPTkZJR19QTSBhbmQgdXNlIF9fbWF5YmVfdW51c2VkIGZvciBQTSBmdW5jdGlvbnMgYW5k
DQo+IHBtX3B0cigpIGZvciBQTSBvcHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJl
em5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlwLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENvZHJp
biBDaXVib3Rhcml1IDxjb2RyaW4uY2l1Ym90YXJpdUBtaWNyb2NoaXAuY29tPg0KDQpUaGFua3Mh
DQo=
