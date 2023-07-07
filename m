Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B68B74B4C9
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 18:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbjGGQBz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jul 2023 12:01:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjGGQBy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jul 2023 12:01:54 -0400
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com [148.163.137.242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF481BD2;
        Fri,  7 Jul 2023 09:01:51 -0700 (PDT)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
        by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 367FMTSf010492;
        Fri, 7 Jul 2023 16:01:17 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
        by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3rph38989n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Jul 2023 16:01:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZXZYDvb+56NzFP7RYdie5sPjclAsW9OUAooKgL04o8GQrv6lgvi94m7BF0/pqDIe5PzV2LZ+juVMCRCKhOgJou9mHaNGofEZzsaLKyOCUAPS5qeJvobeudxKTtzHKGY3nU7hoyP2ahUgmBykR3nrw2JEndHNNtEhIfq0fHBjrdaVmOctiYxVKrJ2ZNREOEFUvLgRNOGqfIFGuCqrR9+ZFJPn5hTWk4JEkG7ouAwaJUuZqmJPW0Cb+EdjNMNVuVBuGJjznjg/GYvJfxwBiWxw5Tg+rXs7E9in5v4w2cHmgL9W0ABlnldTt9wrFiqnC0RChIKfgSCh1zJ38ctTI8Gvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mysava5K4Gn4df1YFkRv/XkrM5WA+zjgFgIRpLKvZ6A=;
 b=Znu65U0r9sNPVWioJEP7IdcIE1QlJp5jVK2x3YIewI9Omz4jGyCH2bPcccevYWncQMV2IzOTFdQ/gqNychfgxgpZ7HskpQXMPzs8bv70KqnQkOHxVJ1cTjADXATL7I3HrHtlhaPGhGVMmDuguXDYiNeCJa0E/5qk5pLBs58GF37zUM3zd/VMXkk85tRN+rJSyzYWl2YKApsi+E1rXRwjpJ/11AeZbUKtX0g5jRxedOuNqAHnekfobxG5lT55EdVKDyphXVu6gob6fU/iU7BlE5G7o54B8GA0rR0v2BNIgVsBeX30PKL57QP+SND6jRxuCNi+MSh6pXJsb9p//DQ7+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mysava5K4Gn4df1YFkRv/XkrM5WA+zjgFgIRpLKvZ6A=;
 b=SBMl2JJGoU0QmZV9YQ0r6x9PGpeCrLlZcSS7k3F2Oofa5FAlcM5UTNqWCNTH03R81xNVj1T4TOsmQyWOJfWRmLer8rzvMW5UjJgaKSxhFs9R9/Je8iCbBi4YAHmVGIQ8HHvXBBOfZhgqWJlonZPBIykEQHTM9cgD8TJdLTyjedeU0WyHuoGPEABu2ojgLf0zO4HZZcJd/DcolWd1JkJZDhqqM5gOa2Iy2tOdFsaYEc97GZcMMK2jQW7ZMcRH+uA7pRW//j2ZeY5TbJr/uhorIowLIYr/wB5edQXRvFq8hcvggwoLnUT127U7MobhHMadapmqsagR5bEktViVPLan2w==
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AM9PR03MB6916.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Fri, 7 Jul
 2023 16:01:12 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::528d:e0b6:ecc6:25e5]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::528d:e0b6:ecc6:25e5%4]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 16:01:11 +0000
From:   Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To:     Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "jic23@kernel.org" <jic23@kernel.org>,
        "olivier.moysan@foss.st.com" <olivier.moysan@foss.st.com>,
        "arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "fabrice.gasnier@foss.st.com" <fabrice.gasnier@foss.st.com>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "hugues.fruchet@foss.st.com" <hugues.fruchet@foss.st.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "will@kernel.org" <will@kernel.org>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "arnd@kernel.org" <arnd@kernel.org>,
        "richardcochran@gmail.com" <richardcochran@gmail.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 05/10] firewall: introduce stm32_firewall framework
Thread-Topic: [PATCH 05/10] firewall: introduce stm32_firewall framework
Thread-Index: AQHZr2ZRFR+uG6i0BECeBf17iNfNxq+uTeWAgAAbBACAAAwbAA==
Date:   Fri, 7 Jul 2023 16:01:11 +0000
Message-ID: <87wmzbyam1.fsf@epam.com>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-6-gatien.chevallier@foss.st.com>
 <87a5w7zv8o.fsf@epam.com> <66e74bba-ff7b-e3c1-9351-15bd23038e0d@foss.st.com>
In-Reply-To: <66e74bba-ff7b-e3c1-9351-15bd23038e0d@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|AM9PR03MB6916:EE_
x-ms-office365-filtering-correlation-id: 536aeaed-b6c2-4f38-30c3-08db7f036267
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p3DL+SW2KLbLYBdceUmKscBI/BjQyr76SJBfeHK5uzq9ahVnJycyQZ/V33vG37SmW+wqqf/2pInFeJoZ3RkhWNVsrGE2th5OP8R65qEDv6lPtTxFGvfoZyBDxzw8jRlwpWJG4fvhb8Y+OoJStLuvkNuKNArQvO11B/5nnrPND7wv2RgZkMRsHV3Bde3h3Xi8fkzrQ5eyH4onndi9zw4/GKgl6rxLJOxZj9bUFdthhoXNxcJkRy6oGxMFPe03/c+65HfUCmrTqrR7RAHCeIZhgnDRGYxWwpv3w2+vL4rRBCIhAaL5ovWA9yVZKEv2pbnZk/oOUG1DK49aJiN/UQnw+lK9yPJktWHSXNSuq6IS2lI9DC/d+ZL7IB1ziCD+AIsisIDl5yFJOKp06sxdYM79Qd1KVQCchgRuYbahf0WrsV1D4idKlq9+EmfrrYZ/ZlzogbguC2/iptnY6Mt4Kcpv7Box8Vm+vXcTj27gdbRQqIY8hY0NujzYCzsrbanpDzE4zMVgg7m1CN4wC+AO2XBWSoIgWR0sothLmqgJpwERfAOZQ+0BZ7TE3iWQ7807rbPiZpzlUkxCkFLMqzr8NXDYax0dMHInDF4lt9NKf3Ke8uI4vACatVuvD2dS8nlbe8ay
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199021)(26005)(4326008)(5660300002)(7406005)(8676002)(478600001)(8936002)(7416002)(66946007)(91956017)(6916009)(66556008)(66446008)(76116006)(2906002)(36756003)(66476007)(64756008)(66899021)(316002)(30864003)(41300700001)(6512007)(38070700005)(54906003)(86362001)(186003)(53546011)(6506007)(83380400001)(6486002)(38100700002)(71200400001)(2616005)(122000001)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?k8R+QUyx4TKmfFNQBgdMOeQY2OwZg5ZoudwntaHqC3hF18zCEBYx4lJlso?=
 =?iso-8859-1?Q?kvMfM8InTtZg0w9s6Zbt1b7pCiLk6MHLQ4utyvQAoBdEcDpQfrABReBtNu?=
 =?iso-8859-1?Q?Xu6wCejvuAvj/oY4sMWrjtHm+u5fSmSAvZp2iCK0Yo3kaeJikV+2iwFVrr?=
 =?iso-8859-1?Q?LBZ7R778Tfw0ep6Tki60Ma9JrPuYUpuZXiJxQveCtrAqzR6nH2Y3pjbGbP?=
 =?iso-8859-1?Q?oFUvA08AxiCSrFsvTSD1TDQ/qw/FIjpgNraZoQWPWu/PyrVOMX18Km+sbh?=
 =?iso-8859-1?Q?10wM9edmg8vuARvooFWAzz+9VgmD7fbFNQAM7Mhq7pLYFoDk64kUuqBBVe?=
 =?iso-8859-1?Q?3pebVrQkziFVt22KmAg7Pgq4szirPoHZKSDeTzClbJsvBKRq6LHI2qiyuq?=
 =?iso-8859-1?Q?UVzVU6rrWMohD2BbPW4T4GGQRG+BLLA1MuHeiVZWUmrol2MaId2RaAcaFp?=
 =?iso-8859-1?Q?arx/xRjXnsq+SDMUExD5KWqGVlQvP5Rb5cr/jtkb63fAbN1SfckJNNZjCm?=
 =?iso-8859-1?Q?9+FWnYr2k0uMxknSeeRKs6yaYZF5CNUjMnfwBRkCzjL8SbGIqOPXm21hFM?=
 =?iso-8859-1?Q?VNpCwVGcPmSdRHCpJSc5V4BGnbqK4QGeujK40qOw1lB6V2h3N0u1omLQbp?=
 =?iso-8859-1?Q?DascFonqtxegjZzy0ckNsbcBBbTiOSMEsNJEx12QSLYjMP9iPlvSmocmT6?=
 =?iso-8859-1?Q?4SMqIzd4/ljNuTHWkBoJlPxQ0t1DyLx5p9k/BMfG//ZD3P6EeljL+UAhUk?=
 =?iso-8859-1?Q?Wai2tVHkI6cA/xBcPtwZ8SVF1YsvI9eGi3MiG95pAeyTfezJl3hiMk4Rk+?=
 =?iso-8859-1?Q?x/XsqPO+lPj/o3B6x/EewDk9l4Ov6z8t+JKlmspoxFw3EePyM8D4IxhTSG?=
 =?iso-8859-1?Q?BkAuboobrRE7SOO+QilcIaOh1iVVmDZpItf04l70fJqrmmeI4O5gl4HaeV?=
 =?iso-8859-1?Q?PO49OtwVA81BYufaEdn0FwTC19vcvgiMvLPUXmmuqaOigHcgVUp94kwjjI?=
 =?iso-8859-1?Q?Y+fxrd236fiLf5vXUk8sJpy+zweIyLPyFTlEKThj+DiZ5W1Hsm3b4XGP/W?=
 =?iso-8859-1?Q?MDm82LvDSF6jPSKoBFABCMyYAjzwadLGHkKYIP3zPTceOuVM4wc/9rokkw?=
 =?iso-8859-1?Q?ovC+PYR+yJsoK8bRKgaDnFyZqyXI1mpbkqhHrjnICx6WSyCHxm3nBod8OA?=
 =?iso-8859-1?Q?fHjqv4IGRbpgQj+aBdmx40uflZRBPVR7dp3cqQQSC5PmXd76iK6C1tFi8V?=
 =?iso-8859-1?Q?85Tfw/VESUIJD0g0CTi/jmGJtSJYJ6NcUqi/XU5majLiuN1yJ2c2PlJFwK?=
 =?iso-8859-1?Q?ikiDj0D2cjPZyEoINopQvdKXzu0H+0Qu2hIbc6SKOsXozXrcK3ifp6a0YV?=
 =?iso-8859-1?Q?ZpC/bIDWxL1hatO1fS/W4ujoM86JgKJPobvY3DaAmvtodrBYb3pwjZj6m9?=
 =?iso-8859-1?Q?APYLkqU0ARl1PPE2LUtiIfkjSP4pEDB0ZRI5nGya+dD/noZqvhWXKI81Vy?=
 =?iso-8859-1?Q?ooH12UsdwZucoJJqQn9h04buO6NRnI+KesefFbkIF/Gtt3WiH2xN8U+PBf?=
 =?iso-8859-1?Q?BSggTziEtXheWIz2esxRlV/NC33DamgED0QNcgjDidu/5g8eQtqeY5qmUd?=
 =?iso-8859-1?Q?a/Al/AbvYgT7+rfNqr62dDzLASdM4Ya6wyUCVMRSOTxNP1b09cQsw+bQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 536aeaed-b6c2-4f38-30c3-08db7f036267
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2023 16:01:11.5561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bpHwSR9LnK85oexdqNSop8KlU4jYG/Z7ek7rKUgPVW098rEVtr5dqT0TYeRkpAghIn7vk6LErrlja2tvlcEshEue/dx7wwWBN/OAY8A/F6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6916
X-Proofpoint-GUID: 8X57322sGLQOvM_SwPaPIa0uLhyCSCSa
X-Proofpoint-ORIG-GUID: 8X57322sGLQOvM_SwPaPIa0uLhyCSCSa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_10,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307070148
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Gatien CHEVALLIER <gatien.chevallier@foss.st.com> writes:

Hello Gatien,

> Hello Oleksii,
>
> On 7/7/23 15:50, Oleksii Moisieiev wrote:
>> Gatien Chevallier <gatien.chevallier@foss.st.com> writes:
>>=20
>>> Introduce a firewall framework that offers to firewall consumers differ=
ent
>>> firewall services such as the ability to check their access rights agai=
nst
>>> their firewall controller(s).
>>>
>>> The firewall framework offers a generic API that is defined in firewall
>>> controllers drivers to best fit the specificity of each firewall.
>>>
>>> There are various types of firewalls:
>>> -Peripheral firewalls that filter accesses to peripherals
>>> -Memory firewalls that filter accesses to memories or memory regions
>>> -Resource firewalls that filter accesses to internal resources such as
>>> reset and clock controllers
>>>
>>> A firewall controller must be probed at arch_initcall level and registe=
r
>>> to the framework so that consumers can use their services.
>>>
>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>> ---
>>>   MAINTAINERS                               |   5 +
>>>   arch/arm64/Kconfig.platforms              |   1 +
>>>   drivers/bus/Kconfig                       |  10 +
>>>   drivers/bus/Makefile                      |   1 +
>>>   drivers/bus/stm32_firewall.c              | 252 +++++++++++++++++++++=
+
>>>   drivers/bus/stm32_firewall.h              |  83 +++++++
>>>   include/linux/bus/stm32_firewall_device.h | 134 ++++++++++++
>>>   7 files changed, 486 insertions(+)
>>>   create mode 100644 drivers/bus/stm32_firewall.c
>>>   create mode 100644 drivers/bus/stm32_firewall.h
>>>   create mode 100644 include/linux/bus/stm32_firewall_device.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 41385f01fa98..fabf95ba9b86 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -20123,6 +20123,11 @@ T:	git git://linuxtv.org/media_tree.git
>>>   F:	Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
>>>   F:	drivers/media/i2c/st-mipid02.c
>>>   +ST STM32 FIREWALL
>>> +M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
>>> +S:	Maintained
>>> +F:	drivers/bus/stm32_firewall.c
>>> +
>>>   ST STM32 I2C/SMBUS DRIVER
>>>   M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
>>>   M:	Alain Volmat <alain.volmat@foss.st.com>
>>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platform=
s
>>> index 6069120199bb..5a46e90f1e4e 100644
>>> --- a/arch/arm64/Kconfig.platforms
>>> +++ b/arch/arm64/Kconfig.platforms
>>> @@ -293,6 +293,7 @@ config ARCH_STM32
>>>   	select ARM_SMC_MBOX
>>>   	select ARM_SCMI_PROTOCOL
>>>   	select COMMON_CLK_SCMI
>>> +	select STM32_FIREWALL
>>>   	help
>>>   	  This enables support for ARMv8 based STMicroelectronics
>>>   	  STM32 family, including:
>>> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
>>> index fcfa280df98a..4d54a7ea52b2 100644
>>> --- a/drivers/bus/Kconfig
>>> +++ b/drivers/bus/Kconfig
>>> @@ -163,6 +163,16 @@ config QCOM_SSC_BLOCK_BUS
>>>   	  i2c/spi/uart controllers, a hexagon core, and a clock controller
>>>   	  which provides clocks for the above.
>>>   +config STM32_FIREWALL
>>> +	bool "STM32 Firewall framework"
>>> +	depends on ARCH_STM32
>>> +	default MACH_STM32MP157 || MACH_STM32MP13 || MACH_STM32MP25
>>> +	help
>>> +	  Say y to enable firewall framework and its services. Firewall
>>> +	  controllers will be able to register to the framework. Firewall
>>> +	  controllers must be initialized and register to the firewall framew=
ork
>>> +	  at arch_initcall level.
>>> +
>>>   config SUN50I_DE2_BUS
>>>   	bool "Allwinner A64 DE2 Bus Driver"
>>>   	  default ARM64
>>> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
>>> index d90eed189a65..fc0511450ec2 100644
>>> --- a/drivers/bus/Makefile
>>> +++ b/drivers/bus/Makefile
>>> @@ -26,6 +26,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+=3D omap_l3_smx.o om=
ap_l3_noc.o
>>>   obj-$(CONFIG_OMAP_OCP2SCP)	+=3D omap-ocp2scp.o
>>>   obj-$(CONFIG_QCOM_EBI2)		+=3D qcom-ebi2.o
>>>   obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+=3D qcom-ssc-block-bus.o
>>> +obj-$(CONFIG_STM32_FIREWALL)	+=3D stm32_firewall.o
>>>   obj-$(CONFIG_SUN50I_DE2_BUS)	+=3D sun50i-de2.o
>>>   obj-$(CONFIG_SUNXI_RSB)		+=3D sunxi-rsb.o
>>>   obj-$(CONFIG_OF)		+=3D simple-pm-bus.o
>>> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.=
c
>>> new file mode 100644
>>> index 000000000000..510db5bc6eaf
>>> --- /dev/null
>>> +++ b/drivers/bus/stm32_firewall.c
>>> @@ -0,0 +1,252 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
>>> + */
>>> +
>>> +#include <linux/bitfield.h>
>>> +#include <linux/bits.h>
>>> +#include <linux/bus/stm32_firewall_device.h>
>>> +#include <linux/device.h>
>>> +#include <linux/err.h>
>>> +#include <linux/init.h>
>>> +#include <linux/io.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_platform.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/types.h>
>>> +
>>> +#include "stm32_firewall.h"
>>> +
>>> +/* Corresponds to STM32_FIREWALL_MAX_EXTRA_ARGS + firewall controller =
reference + firewall ID */
>>> +#define STM32_FIREWALL_MAX_ARGS		(STM32_FIREWALL_MAX_EXTRA_ARGS + 2)
>>> +
>>> +static LIST_HEAD(firewall_controller_list);
>>> +static DEFINE_MUTEX(firewall_controller_list_lock);
>>> +
>>> +static int stm32_firewall_get_id(struct device_node *np, u32 *id)
>>> +{
>>> +	u32 feature_domain_cell[2];
>>> +
>>> +	/* Get property from device node */
>>> +	if (of_property_read_u32_array(np, "feature-domains",
>>> +				       feature_domain_cell,
>>> +				       ARRAY_SIZE(feature_domain_cell))) {
>>> +		pr_err("Unable to find get firewall ID property\n");
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	*id =3D feature_domain_cell[1];
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/* Firewall device API */
>>> +
>>> +int stm32_firewall_get_firewall(struct device_node *np,
>>> +				struct stm32_firewall *firewall)
>>> +{
>>> +	struct stm32_firewall_controller *ctrl;
>>> +	struct of_phandle_args args;
>>> +	u32 controller_phandle;
>>> +	bool match =3D false;
>>> +	size_t i;
>>> +	int err;
>>> +
>>> +	if (!firewall)
>>> +		return -EINVAL;
>>> +
>>> +	/* The controller phandle is always the first argument of the feature=
-domains property. */
>>> +	err =3D of_property_read_u32(np, "feature-domains", &controller_phand=
le);
>>> +	if (err) {
>>> +		pr_err("Unable to get feature-domains property for node %s\n", np->f=
ull_name);
>>> +		return err;
>>> +	}
>>> +
>>> +	/* Parse property with phandle parsed out */
>>> +	err =3D of_parse_phandle_with_args(np, "feature-domains", "#feature-d=
omain-cells", 0, &args);
>>> +	if (err) {
>>> +		pr_err("Unable to read feature-domains arguments for node %s\n", np-=
>full_name);
>>> +		return err;
>>> +	}
>>> +
>>> +	/* The phandle is parsed out */
>>> +	if (args.args_count > STM32_FIREWALL_MAX_ARGS - 1)
>>> +		return -EINVAL;
>>> +
>>> +	of_node_put(np);
>>> +
>>> +	/* Check if the parsed phandle corresponds to a registered firewall c=
ontroller */
>>> +	mutex_lock(&firewall_controller_list_lock);
>>> +	list_for_each_entry(ctrl, &firewall_controller_list, entry) {
>>> +		if (ctrl->dev->of_node->phandle =3D=3D controller_phandle) {
>>> +			match =3D true;
>>> +			firewall->firewall_ctrl =3D ctrl;
>>> +			break;
>>> +		}
>>> +	}
>>> +	mutex_unlock(&firewall_controller_list_lock);
>>> +	if (!match) {
>>> +		firewall->firewall_ctrl =3D NULL;
>>> +		pr_err("No firewall controller registered for %s\n", np->full_name);
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	/*
>>> +	 * The firewall ID is always the second argument of the feature-domai=
ns property.
>>> +	 * The first argument is already parsed out, so args.args[0] is the s=
econd argument.
>>> +	 */
>>> +	firewall->firewall_id =3D args.args[0];
>>> +
>>> +	/* Extra args start at the third argument */
>>> +	for (i =3D 0; i < args.args_count; i++)
>>> +		firewall->extra_args[i] =3D args.args[i + 1];
>>> +
>>> +	/* Remove the firewall ID arg that is not an extra argument */
>>> +	if (args.args_count >=3D 1)
>>> +		firewall->extra_args_size =3D args.args_count - 1;
>> As I can see you support some extra args, that can be provided in
>> the
>> feature-domain property. But in the binding description I see maxItems:
>> 2. I beliewe this should be highlighted in bindings description.
>>=20
>
> Good point, maybe it would be better to define a high maxItem value in
> the binding description that is aligned with STM32_FIREWALL_MAX_ARGS.
>
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(stm32_firewall_get_firewall);
>>> +
>>> +int stm32_firewall_grant_access(struct stm32_firewall *firewall)
>>> +{
>>> +	struct stm32_firewall_controller *firewall_controller;
>>> +
>>> +	if (!firewall || firewall->firewall_id =3D=3D U32_MAX)
>>> +		return -EINVAL;
>>> +
>>> +	firewall_controller =3D firewall->firewall_ctrl;
>>> +
>>> +	if (!firewall_controller)
>>> +		return -ENODEV;
>>> +
>>> +	return firewall_controller->grant_access(firewall_controller, firewal=
l->firewall_id);
>>> +}
>>> +EXPORT_SYMBOL_GPL(stm32_firewall_grant_access);
>>> +
>>> +int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall,=
 u32 subsystem_id)
>>> +{
>>> +	struct stm32_firewall_controller *firewall_controller;
>>> +
>>> +	if (!firewall || subsystem_id =3D=3D U32_MAX || firewall->firewall_id=
 =3D=3D U32_MAX)
>>> +		return -EINVAL;
>>> +
>>> +	firewall_controller =3D firewall->firewall_ctrl;
>>> +
>>> +	if (!firewall_controller)
>>> +		return -ENODEV;
>>> +
>>> +	return firewall_controller->grant_access(firewall_controller, subsyst=
em_id);
>>> +}
>>> +EXPORT_SYMBOL_GPL(stm32_firewall_grant_access_by_id);
>>> +
>>> +void stm32_firewall_release_access(struct stm32_firewall *firewall)
>>> +{
>>> +	struct stm32_firewall_controller *firewall_controller;
>>> +
>>> +	if (!firewall || firewall->firewall_id =3D=3D U32_MAX) {
>>> +		pr_err("Incorrect arguments when releasing a firewall access");
>>> +		return;
>>> +	}
>>> +
>>> +	firewall_controller =3D firewall->firewall_ctrl;
>>> +
>>> +	if (!firewall_controller) {
>>> +		pr_debug("No firewall controller to release");
>>> +		return;
>>> +	}
>>> +
>>> +	firewall_controller->release_access(firewall_controller, firewall->fi=
rewall_id);
>>> +}
>>> +EXPORT_SYMBOL_GPL(stm32_firewall_release_access);
>>> +
>>> +void stm32_firewall_release_access_by_id(struct stm32_firewall *firewa=
ll, u32 subsystem_id)
>>> +{
>>> +	struct stm32_firewall_controller *firewall_controller;
>>> +
>>> +	if (!firewall || subsystem_id =3D=3D U32_MAX || firewall->firewall_id=
 =3D=3D U32_MAX) {
>>> +		pr_err("Incorrect arguments when releasing a firewall access");
>>> +		return;
>>> +	}
>>> +
>>> +	firewall_controller =3D firewall->firewall_ctrl;
>>> +
>>> +	if (!firewall_controller) {
>>> +		pr_debug("No firewall controller to release");
>>> +		return;
>>> +	}
>>> +
>>> +	firewall_controller->release_access(firewall_controller, subsystem_id=
);
>>> +}
>>> +EXPORT_SYMBOL_GPL(stm32_firewall_release_access_by_id);
>>> +
>>> +/* Firewall controller API */
>>> +
>>> +int stm32_firewall_controller_register(struct stm32_firewall_controlle=
r *firewall_controller)
>>> +{
>>> +	pr_info("Registering firewall controller %s", dev_name(firewall_contr=
oller->dev));
>>> +
>>> +	if (!firewall_controller)
>>> +		return -ENODEV;
>>> +
>>> +	mutex_lock(&firewall_controller_list_lock);
>>> +	list_add_tail(&firewall_controller->entry, &firewall_controller_list)=
;
>>> +	mutex_unlock(&firewall_controller_list_lock);
>>> +
>>> +	return 0;
>>> +
>>> +}
>>> +
>>> +void stm32_firewall_controller_unregister(struct stm32_firewall_contro=
ller *firewall_controller)
>>> +{
>>> +	struct stm32_firewall_controller *ctrl, *tmp;
>>> +	bool controller_removed =3D false;
>>> +
>>> +	if (!firewall_controller) {
>>> +		pr_debug("Null reference while unregistering firewall controller");
>>> +		return;
>>> +	}
>>> +
>>> +	mutex_lock(&firewall_controller_list_lock);
>>> +	list_for_each_entry_safe(ctrl, tmp, &firewall_controller_list, entry)=
 {
>>> +		if (ctrl =3D=3D firewall_controller) {
>>> +			controller_removed =3D true;
>>> +			list_del_init(&ctrl->entry);
>>> +			break;
>>> +		}
>>> +	}
>> IIUC list_for_each_entry_safe protects you from removing node during
>> loop. But all list operations are done under
>> firewall_controller_list_lock mutex. I beliewe there is no need for
>> _safe call under the mutex because removing node during loop is
>> impossible. I think it worth investigation if it's safe to use
>> list_for_each_entry_safe without lock.
>
> AFAICT, list_for_each_entry_safe() does not protect against concurrent
> accesses, so I'll keep the mutex lock.
>
> Deleting while iterating will cause trouble if not using the safe
> version. I think it is fine as it is.
>

Ok, in that case I whould rather drop _safe, because for your case it is
impossible to remove entry while iterating the list.
This will save a couple of CPU instructions.


>>> +	mutex_unlock(&firewall_controller_list_lock);
>>> +
>>> +	if (!controller_removed)
>>> +		pr_debug("There was no firewall controller named %s to unregister",
>>> +			 dev_name(firewall_controller->dev));
>>> +}
>>> +
>>> +void stm32_firewall_populate_bus(struct stm32_firewall_controller *fir=
ewall_controller)
>>> +{
>>> +	struct device_node *child;
>>> +	struct device *parent;
>>> +	u32 firewall_id;
>>> +	int err;
>>> +
>>> +	parent =3D firewall_controller->dev;
>>> +
>>> +	dev_dbg(parent, "Populating %s system bus\n", dev_name(firewall_contr=
oller->dev));
>>> +
>>> +	for_each_available_child_of_node(dev_of_node(parent), child) {
>>> +		err =3D stm32_firewall_get_id(child, &firewall_id);
>>> +		if (err < 0 ||
>>> +		    firewall_controller->grant_access(firewall_controller, firewall_=
id)) {
>>> +			/*
>>> +			 * Peripheral access not allowed or not defined.
>>> +			 * Mark the node as populated so platform bus won't probe it
>>> +			 */
>>> +			of_node_set_flag(child, OF_POPULATED);
>>> +			dev_err(parent, "%s: Device driver will not be probed\n",
>>> +				child->full_name);
>>> +		}
>>> +	}
>>> +}
>>> diff --git a/drivers/bus/stm32_firewall.h b/drivers/bus/stm32_firewall.=
h
>>> new file mode 100644
>>> index 000000000000..8d92e8c1ab77
>>> --- /dev/null
>>> +++ b/drivers/bus/stm32_firewall.h
>>> @@ -0,0 +1,83 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
>>> + */
>>> +
>>> +#ifndef _STM32_FIREWALL_H
>>> +#define _STM32_FIREWALL_H
>>> +
>>> +#include <linux/kernel.h>
>>> +#include <linux/list.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/types.h>
>>> +
>>> +/**
>>> + * STM32_PERIPHERAL_FIREWALL:		This type of firewall protects peripher=
als
>> Intendation
>>=20
>>> + * STM32_MEMORY_FIREWALL:		This type of firewall protects memories/sub=
sets of memory
>>> + *					zones
>>> + * STM32_RESOURCE_FIREWALL:		This type of firewall protects internal r=
esources
>>> + * STM32_NOTYPE_FIREWALL:		Undefined firewall type
>>> + */
>>> +
>>> +#define STM32_PERIPHERAL_FIREWALL	BIT(1)
>> Intendation
>>=20
>
> I'm sorry but I don't understand. I indent with tabs, maybe this is why
> it appears strange here. The indentation is fine, same for others below.
>

Nevermind, Just looks strange in patch.

>>> +#define STM32_MEMORY_FIREWALL		BIT(2)
>>> +#define STM32_RESOURCE_FIREWALL		BIT(3)
>>> +#define STM32_NOTYPE_FIREWALL		BIT(4)
>>> +
>>> +/**
>>> + * struct stm32_firewall_controller - Information on firewall controll=
er supplying services
>>> + *
>>> + * @name			Name of the firewall controller
>>> + * @dev				Device reference of the firewall controller
>> Intendation
>>=20
>>> + * @mmio			Base address of the firewall controller
>>> + * @entry			List entry of the firewall controller list
>>> + * @type			Type of firewall
>>> + * @max_entries			Number of entries covered by the firewall
>> Intendation
>>=20
>>> + * @grant_access		Callback used to grant access for a device access ag=
ainst a
>>> + *				firewall controller
>>> + * @release_access		Callback used to release resources taken by a devi=
ce when access was
>>> + *				granted
>>> + * @grant_memory_range_access	Callback used to grant access for a devi=
ce to a given memory region
>>> + */
>>> +struct stm32_firewall_controller {
>>> +	const char *name;
>>> +	struct device *dev;
>>> +	void __iomem *mmio;
>>> +	struct list_head entry;
>>> +	unsigned int type;
>>> +	unsigned int max_entries;
>>> +
>>> +	int (*grant_access)(struct stm32_firewall_controller *ctrl, u32 id);
>>> +	void (*release_access)(struct stm32_firewall_controller *ctrl, u32 id=
);
>>> +	int (*grant_memory_range_access)(struct stm32_firewall_controller *ct=
rl, phys_addr_t paddr,
>>> +					 size_t size);
>>> +};
>>> +
>>> +/**
>>> + * int stm32_firewall_controller_register - Register a firewall contro=
ller to the STM32 firewall
>>> + *					    framework
>>> + * @firewall_controller		Firewall controller to register
>>> + *
>>> + * Returns 0 in case of success or -ENODEV if no controller was given.
>>> + */
>>> +int stm32_firewall_controller_register(struct stm32_firewall_controlle=
r *firewall_controller);
>>> +
>>> +/**
>>> + * int stm32_firewall_controller_unregister - Unregister a firewall co=
ntroller from the STM32
>>> + *					      firewall framework
>>> + * @firewall_controller		Firewall controller to unregister
>>> + */
>>> +void stm32_firewall_controller_unregister(struct stm32_firewall_contro=
ller *firewall_controller);
>>> +
>>> +/**
>>> + * stm32_firewall_populate_bus - Populate device tree nodes that have =
a correct firewall
>>> + *				 configuration. This is used at boot-time only, as a sanity chec=
k
>>> + *				 between device tree and firewalls hardware configurations to
>>> + *				 prevent a kernel crash when a device driver is not granted acce=
ss
>>> + *
>>> + * @firewall_controller		Firewall controller which nodes will be popul=
ated or not
>>> + */
>>> +void stm32_firewall_populate_bus(struct stm32_firewall_controller *fir=
ewall_controller);
>>> +
>>> +#endif /* _STM32_FIREWALL_H */
>>> diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/=
bus/stm32_firewall_device.h
>>> new file mode 100644
>>> index 000000000000..ccaecea7fc6c
>>> --- /dev/null
>>> +++ b/include/linux/bus/stm32_firewall_device.h
>>> @@ -0,0 +1,134 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
>>> + */
>>> +
>>> +#ifndef STM32_FIREWALL_DEVICE_H
>>> +#define STM32_FIREWALL_DEVICE_H
>>> +
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/types.h>
>>> +
>>> +#define STM32_FIREWALL_MAX_EXTRA_ARGS		5
>> It's not clear to me why it's 5. Comment above sais this is
>> implementation defined. Maybe this parameter can be configurable?
>>=20
>
> Maybe it should be part of compat_data of firewall controllers :)
>
>>> +
>>> +/* Opaque reference to stm32_firewall_controller */
>>> +struct stm32_firewall_controller;
>>> +
>>> +/**
>>> + * stm32_firewall - Information on a device's firewall. Each device ca=
n have more than one firewall.
>>> + *
>>> + * @firewall_ctrl		Pointer referencing a firewall controller of the de=
vice. It is
>>> + *				opaque so a device cannot manipulate the controller's ops or acc=
ess
>>> + *				the controller's data
>>> + * @extra_args			Extra arguments that are implementation dependent
>>> + * @extra_args_size		Number of extra arguments
>>> + * @firewall_id			Firewall ID associated the device for this firewall =
controller
>>> + */
>>> +struct stm32_firewall {
>>> +	struct stm32_firewall_controller *firewall_ctrl;
>>> +	u32 extra_args[STM32_FIREWALL_MAX_EXTRA_ARGS];
>>> +	size_t extra_args_size;
>>> +	u32 firewall_id;
>>> +};
>>> +
>>> +#if IS_ENABLED(CONFIG_STM32_FIREWALL)
>>> +/**
>>> + * stm32_firewall_get_firewall - Get the firewall(s) associated to giv=
en device.
>>> + *				 The firewall controller reference is always the first argument
>>> + *				 of the feature-domains property.
>>> + *				 The firewall ID is always the second argument of the
>>> + *				 feature-domains property.
>>> + *
>>> + * @np				Device node to parse
>> Intendation
>>=20
>>> + * @firewall			Resulting firewall reference(s)
>>> + *
>>> + * Returns 0 on success, -ENODEV if there's no match with a firewall c=
ontroller or appropriate errno
>>> + * code if error occurred.
>>> + */
>>> +int stm32_firewall_get_firewall(struct device_node *np, struct stm32_f=
irewall *firewall);
>>> +
>>> +/**
>>> + * stm32_firewall_grant_access - Request firewall access rights and gr=
ant access.
>>> + *
>>> + * @firewall			Firewall reference containing the ID to check against i=
ts firewall
>>> + *				controller
>>> + *
>>> + * Returns 0 if access is granted, -EACCES if access is denied, -ENODE=
V if firewall is null or
>>> + * appropriate errno code if error occurred
>>> + */
>>> +int stm32_firewall_grant_access(struct stm32_firewall *firewall);
>>> +
>>> +/**
>>> + * stm32_firewall_release_access - Release access granted from a call =
to
>>> + *				   stm32_firewall_grant_access().
>>> + *
>>> + * @firewall			Firewall reference containing the ID to check against i=
ts firewall
>>> + *				controller
>>> + */
>>> +void stm32_firewall_release_access(struct stm32_firewall *firewall);
>>> +
>>> +/**
>>> + * stm32_firewall_grant_access_by_id - Request firewall access rights =
of a given device
>>> + *				       based on a specific firewall ID
>>> + *
>>> + * Warnings:
>>> + * There is no way to ensure that the given ID will correspond to the =
firewall referenced in the
>>> + * device node if the ID did not come from stm32_firewall_get_firewall=
(). In that case, this
>>> + * function must be used with caution.
>>> + * This function should be used for subsystem resources that do not ha=
ve the same firewall ID
>>> + * as their parent.
>>> + * U32_MAX is an invalid ID.
>>> + *
>>> + * @firewall			Firewall reference containing the firewall controller
>>> + * @subsystem_id		Firewall ID of the subsystem resource
>>> + *
>>> + * Returns 0 if access is granted, -EACCES if access is denied, -ENODE=
V if firewall is null or
>>> + * appropriate errno code if error occurred
>>> + */
>>> +int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall,=
 u32 subsystem_id);
>> Can we store all registered IDs that were found by populate_bus
>> functio, or is it expected when this function was called before
>> populate_bus call?
>>=20
>
> This function is intended to be used by devices that needs to check
> specific ID. Maybe IDs of peripherals that do not have a driver in
> Linux / driver isn't probed / ...
>
> About storing all IDs found when populating the bus, do you have some
> use in mind? :) Else I'd prefer to save some memory.
>
> Best regards,
> Gatien
>

Then I think it worth mentioning in Warnings comment. What bothered me
is that you've said that there is no way to check ID while I was seeing
possible implementation.


>>> +
>>> +/**
>>> + * stm32_firewall_release_access_by_id - Release access granted from a=
 call to
>>> + *					 stm32_firewall_grant_access_by_id().
>>> + *
>>> + * Warnings:
>>> + * There is no way to ensure that the given ID will correspond to the =
firewall referenced in the
>>> + * device node if the ID did not come from stm32_firewall_get_firewall=
(). In that case, this
>>> + * function must be used with caution.
>>> + * This function should be used for subsystem resources that do not ha=
ve the same firewall ID
>>> + * as their parent.
>>> + * U32_MAX is an invalid ID.
>>> + *
>>> + * @firewall			Firewall reference containing the firewall controller
>>> + * @subsystem_id		Firewall ID of the subsystem resource
>>> + */
>>> +void stm32_firewall_release_access_by_id(struct stm32_firewall *firewa=
ll, u32 subsystem_id);
>>> +
>>> +#else /* CONFIG_STM32_FIREWALL */
>>> +
>>> +int stm32_firewall_get_firewall(struct device_node *np, struct stm32_f=
irewall *firewall)
>>> +{
>>> +	return -ENODEV;
>>> +}
>>> +
>>> +int stm32_firewall_grant_access(struct stm32_firewall *firewall)
>>> +{
>>> +	return -ENODEV;
>>> +}
>>> +
>>> +void stm32_firewall_release_access(struct stm32_firewall *firewall)
>>> +{
>>> +}
>>> +
>>> +int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall,=
 u32 subsystem_id)
>>> +{
>>> +	return -ENODEV;
>>> +}
>>> +
>>> +void stm32_firewall_release_access_by_id(struct stm32_firewall *firewa=
ll, u32 subsystem_id)
>>> +{
>>> +}
>>> +
>>> +#endif /* CONFIG_STM32_FIREWALL */
>>> +#endif /* STM32_FIREWALL_DEVICE_H */
>>=20


--=20
Thanks,
Oleksii=
