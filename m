Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E30247524CA
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jul 2023 16:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbjGMOOY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jul 2023 10:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234885AbjGMOOW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jul 2023 10:14:22 -0400
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com [148.163.133.242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1901426B6;
        Thu, 13 Jul 2023 07:14:15 -0700 (PDT)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
        by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36DE4auH012029;
        Thu, 13 Jul 2023 14:13:30 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59])
        by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rtetvs3yb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jul 2023 14:13:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dl8hEhHMTD7P5Lp8WEbHMFMnv6FSYltVB1dFiXG50U32RHCbXn4HJVJ3Oi7tCrj+/TIKNZXtMFi2NUCNisWAMRb66ZIwJrGy7y2Iv7kj+1efJYwvilnlVXIVNefbCDt6wHOhP4GA6hf92lOHLUV+7D6m27j+kT4bAjm8GbqRQLXs0hMYMEw3byvF0NeHudfmdlsp+SqW3u0olz2leWh7oDajgxuql3H/glFUy0dXgjHhURK9l+tjb1e5WrbBKWkbiy80KY42DqZ1FkEmzB4JlCczWbFYXLd4gciw5EJ86ikZjwXuCuFrsC4uqtUMLT2y8VH2ML49p9miTvcbgsPi0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9k1Pkkz5L/JY71JXBrTOGYD9xue8eJo/4shjnusDS9k=;
 b=iFY4i+TaqjqaXJxDU4qDhO5bfhhvHP2thcIhA+Wh8SzfvAU/UF+8UM66uqO408ozBS9CRaypRKL+MU/9IzVx7bs7BAHamcBFOTQz21S7GLPczS0wMJW1nwr9x+jb/2wdICSZ2pIYmoumEuHSQjNaHycrfec2i1KpfkfsdXuZ61YGWNQPhpgJBLWH+FsPWCgzr1f3IJPK6l8fNii//IVyNzxmq4k5PvXMy9N0NxKSOj8QO85vW7VfWpuQG0689JFBPIt9i0PfrU3f+3CpC0C3YzNpqGa/EsM03QgFhY2Qx09sylpENRHI9J3T/SJp5okNkIF/OnXYuu4zDOlAR2tTRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9k1Pkkz5L/JY71JXBrTOGYD9xue8eJo/4shjnusDS9k=;
 b=k6WXRVZdTY7aBCBmM8wJeH7sL9MX3HZnOtLLDxUx/O77SEsFmzl+iCVWXiMkvbGqXlkOYY2NkL3eEaEoj8XRH25sT5GiNqUdvXXs4U/0gpCsQ+WEDAoLnaqDGhgRw+jYsDdpuH58EZlvRqxYhg79UTv8ztS09k6JSFvkfKrio4diydguS6v5sTaEBM5uKW0jkUGkxe3Q892NN2+7c2EhpzkZ5KPt0EstNMWgWYfvQF7BNt/rNwm2JIXdCsG+sHtKR4yM83dcnY1KGQf9QDjvyTRbRJqaj/jDOC/qWm88qF1Z4U3ol4iYcVnJDCGJFPYRkpnIhNlZ/vpVjC79WuDpQg==
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS4PR03MB8556.eurprd03.prod.outlook.com (2603:10a6:20b:583::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Thu, 13 Jul
 2023 14:13:26 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::528d:e0b6:ecc6:25e5]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::528d:e0b6:ecc6:25e5%4]) with mapi id 15.20.6588.017; Thu, 13 Jul 2023
 14:13:26 +0000
From:   Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To:     Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
CC:     Rob Herring <robh@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        "davem@davemloft.net" <davem@davemloft.net>,
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
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peng Fan <peng.fan@oss.nxp.com>
Subject: Re: [PATCH 05/10] firewall: introduce stm32_firewall framework
Thread-Topic: [PATCH 05/10] firewall: introduce stm32_firewall framework
Thread-Index: AQHZr2ZRFR+uG6i0BECeBf17iNfNxq+s2NAAgAF6WICAABeDAIAJWqgAgAADRwA=
Date:   Thu, 13 Jul 2023 14:13:26 +0000
Message-ID: <87a5vzdhmv.fsf@epam.com>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-6-gatien.chevallier@foss.st.com>
 <20230706150906.GB3858320-robh@kernel.org>
 <d13f935c-568b-3c0d-8e7d-006b7d4e7d50@foss.st.com>
 <20230707150724.GA112541-robh@kernel.org>
 <ba409196-06a1-bf2b-3536-1e1420550ff4@foss.st.com>
In-Reply-To: <ba409196-06a1-bf2b-3536-1e1420550ff4@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|AS4PR03MB8556:EE_
x-ms-office365-filtering-correlation-id: 4afe00ee-382d-4bd1-c7fc-08db83ab5349
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wigQkDcPP2EYe+ryOo0O2wAt1+FCEVHRxqrFLHGMT7OtXcB08pJ+NLgS/TJyzI3BsnyQpNTSv53nsyFnnp2q95SWgH028ewg1oU2D5APK9HqGb/9ajHjJuJmrUvTBjCsQeR2ZrjwHJsd7/Wvp1Geq1StZE9cqjYmTVvuWXjCPPBFaFLeBpPb3RmI95T6fO8MpdW5Jq6vsHy5zwWtr7kGdpCBBo+tblLyz/nrdQXeRxDsbrbaQHqHu8hWYNwC5m5NGgRv14KqjRoOFXOnq9pGF9NCy8qXCh7qhxwqPeRwGBYxZFpzdmORVGx0OAEai9vkmPSicUUw7QD1xstF/Fw0enDuIZh/sOSW3F3oDk31ljKSIPW4jV3ylXSSkpDIX+GViaLG8O/6n8jOp34iwENDfos0vICYtTgCnNVPTqYu/+Fiketzmre4oXaESnSIgKJQPUDS4kMLqVkCMIrHYl+RsHhW09X/glPOZ9xV+7Am/CPX8wZZiQi2SSsjw7gKv0yon6vmZy6zfl/3D3xl4dI05KzB4sp764MCWI/loCYIwQ0BsnXVLEW1LlJzOr6plv21N1wMDmpblb+GNh/i5kXymzemoMi+3Ddksck2RdvTvtVs7MmxvG2REcR9lZgq0+mh
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199021)(38100700002)(38070700005)(86362001)(66899021)(7406005)(71200400001)(6486002)(54906003)(76116006)(91956017)(66946007)(122000001)(36756003)(2616005)(53546011)(26005)(186003)(6512007)(6506007)(5660300002)(7416002)(6916009)(2906002)(66556008)(66476007)(478600001)(4326008)(8936002)(8676002)(66446008)(83380400001)(64756008)(316002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jQEQBbLU82v9667WSPf3Mpua7oRSk940/bewSuWZxpq1wLTsAtZY8H+B4+?=
 =?iso-8859-1?Q?nGyb8bFqvLuLfUNPHsGHx4M+nZ+QpadLL0hmYvNuuaBJAEVdNsBc2wgdQL?=
 =?iso-8859-1?Q?+ZJi3WUk5hu/h4TwOx27xCWLFn+AMn+w/p4Xf1wCX+c5xlrsAlsB8x4WuE?=
 =?iso-8859-1?Q?RkWY6z9T1cR6mvtL5Qdwf23tVH/8C49zW7qLlDJ5jwdKf1sJTVqQfjuoc5?=
 =?iso-8859-1?Q?ok6ElQDF2IIDoItHHiiEjoJ8Dhwc2NnecN10Jxoq2/1otVHIoq7bxPZ9BW?=
 =?iso-8859-1?Q?9qEClSQslxVilGEb48FLZsKL04lhfqEor/7C0tR/gx9C3ovkhWhkWDPpG/?=
 =?iso-8859-1?Q?RkJ1oDRpTPKt766lWexiOf3ZWCRXt/+wuI2hxdnUimBQcd1ZWokSJbkdfP?=
 =?iso-8859-1?Q?MkNyMtBmJyIpg1iLLrqlUVnrvx7kxNSaoSJOc+XbBWA9+11WcIuZQyhXZX?=
 =?iso-8859-1?Q?Bh55HF5A0hiMncwV8T13Dw7FBr4o52kmEA/JsSrreKGP/w/Th6NwOMi1Ix?=
 =?iso-8859-1?Q?SJcCpzuEW/tn8nGzHQmNrMm0c5o8INec51wFRysonAAnGBDUfJm29+4NAz?=
 =?iso-8859-1?Q?7w8+HmGoGfveDGnu2XrbJXuUx7jyg9KqeioB45F/JG+5eL1TuSzB5oAfJf?=
 =?iso-8859-1?Q?3sX7Mpm7LGkA9kM8fX2aGOMirrLhPNUoZtweE4tZTMnuCDDiIaYometpLu?=
 =?iso-8859-1?Q?HzjCWuoCbglSjT4mEQLoqB5kFlfZ4AwmA3WstUym+fH9sdUq+XMxXWZHW4?=
 =?iso-8859-1?Q?N21gbVCzAQM/F8JEOnCwU3K1jbXunrKEGZESA27ZQj8uHAJ0sf8ezAdwLd?=
 =?iso-8859-1?Q?hjVirfZfvks3oKWFagFiFGqrYuhnQBbS0/XiLgI7n7eYW9kLUyMOJjVamW?=
 =?iso-8859-1?Q?eioNn6UophmNSxx0z/ErQATtAa5w5ZmT4RKAptuZ0PzQ4iKoi/313W0kPv?=
 =?iso-8859-1?Q?aIoBIdVzR7QEZASU5DDecND32Y66bnXlxl4/0FU2oxwh/mlmFOprsIGf02?=
 =?iso-8859-1?Q?gruJRhkhzll231pFkVh42kK3mbQngaE3Yein1a4A00TWzs7ykxbxuciM8p?=
 =?iso-8859-1?Q?gcmafgeJKK10E4Xq0w10qJEZg6a6ZU6plRwaWS7Jwcd2c5sS5z55073QhJ?=
 =?iso-8859-1?Q?BR4E9mpLH6DFVyBaID9RyLZhDRbTQThHhPmdizY9Dp/1xUF5q4/G+CmO4g?=
 =?iso-8859-1?Q?Q/M3C+r9rrPWJZAuxyvWwaC3xpkq09rRXLtg1NJx7JSOprOd6Z3EEgkKxe?=
 =?iso-8859-1?Q?924qn5Zct7r2rYJllSlpjH3v0fZEkUZVo6s5FRLJ7rYma0OJ6q5ZClw/EI?=
 =?iso-8859-1?Q?1sgnuajm912h2k2ZYzYXyduf4024xaQPGrW9AoMZxsKfSy2YxWZQQk10m1?=
 =?iso-8859-1?Q?NLrUuMbsKiJgIfGH+Gfjp4ALgcfW2/KRlg6Yu7kvkUXkrJVgdsbC6Po/oI?=
 =?iso-8859-1?Q?VxXDmPn3R8TOv2u8VMQH5UTcJQqipDNYB8vZqcKVjdv5TBK23c0vUXtwab?=
 =?iso-8859-1?Q?oauR8OpSL7hywgPCZndpMXO5StSiZLhq1o1RTojJOhXiuWytCUe4Q/4eMR?=
 =?iso-8859-1?Q?d8h7h8TGGxPaX7cUOJJw6/h+6L5oUFWOdzPXGBt42N6T0ltFQV2MZzq+bo?=
 =?iso-8859-1?Q?Uh0apWErw24xaeIYMsiUN95qUix+yZMwBrC5qpTM9r7oZL3CSnzNDGBA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4afe00ee-382d-4bd1-c7fc-08db83ab5349
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2023 14:13:26.2681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: No/A7lGt45kI/3LCLdS7De4pRhFGZsh0hwme3CjD0VCUDTSjGmRxNMwfvUiInIHUiGJdvIv47MERSntxyRALalqs0HX0HOmzV0jtCXNgDo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8556
X-Proofpoint-ORIG-GUID: Md-n9IA6QBC9ohMjvstUs8K04KSXTD1w
X-Proofpoint-GUID: Md-n9IA6QBC9ohMjvstUs8K04KSXTD1w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_05,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 clxscore=1011 bulkscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307130123
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Hello Gatien,

Gatien CHEVALLIER <gatien.chevallier@foss.st.com> writes:

> Hello Rob,
>
> On 7/7/23 17:07, Rob Herring wrote:
>> On Fri, Jul 07, 2023 at 03:43:15PM +0200, Gatien CHEVALLIER wrote:
>>>
>>>
>>> On 7/6/23 17:09, Rob Herring wrote:
>>>> On Wed, Jul 05, 2023 at 07:27:54PM +0200, Gatien Chevallier wrote:
>>>>> Introduce a firewall framework that offers to firewall consumers diff=
erent
>>>>> firewall services such as the ability to check their access rights ag=
ainst
>>>>> their firewall controller(s).
>>>>>
>>>>> The firewall framework offers a generic API that is defined in firewa=
ll
>>>>> controllers drivers to best fit the specificity of each firewall.
>>>>>
>>>>> There are various types of firewalls:
>>>>> -Peripheral firewalls that filter accesses to peripherals
>>>>> -Memory firewalls that filter accesses to memories or memory regions
>>>>> -Resource firewalls that filter accesses to internal resources such a=
s
>>>>> reset and clock controllers
>>>>
>>>> How do resource firewalls work? Access to registers for some clocks in=
 a
>>>> clock controller are disabled? Or something gates off clocks/resets to
>>>> a block?
>>>
>>> To take a practical example:
>>>
>>> A clock controller can be firewall-aware and have its own firewall regi=
sters
>>> to configure. To access a clock/reset that is handled this way, a devic=
e
>>> would need to check this "resource firewall". I thought that for these =
kinds
>>> of hardware blocks, having a common API would help.
>> We already have the concept of 'protected clocks' which are ones
>> controlled by secure mode which limits what Linux can do with them. I
>> think you should extend this mechanism if needed and use the existing
>> clock/reset APIs for managing resources.
>>=20
>
> Ok, thank you for the input. I'll remove this type of firewall for V2 as
> I no longer have a use case.
>
>>>>
>>>> It might make more sense for "resource" accesses to be managed within
>>>> those resource APIs (i.e. the clock and reset frameworks) and leave th=
is
>>>> framework to bus accesses.
>>>>
>>>
>>> Okay, I'll drop this for V2 if you find that the above explaination do =
not
>>> justify this.
>>>
>>>>> A firewall controller must be probed at arch_initcall level and regis=
ter
>>>>> to the framework so that consumers can use their services.
>>>>
>>>> initcall ordering hacks should not be needed. We have both deferred
>>>> probe and fw_devlinks to avoid that problem.
>>>>
>>>
>>> Greg also doubts this.
>>>
>>> Drivers like reset/clock controllers drivers (core_initcall level) will=
 have
>>> a dependency on the firewall controllers in order to initialize their
>>> resources. I was not sure how to manage these dependencies.
>>>
>>> Now, looking at init/main.c, I've realized that core_initcall() level c=
omes
>>> before arch_initcall() level...
>>>
>>> If managed by fw_devlink, the feature-domains property should be suppor=
ted
>>> as well I suppose? I'm not sure how to handle this properly. I'd welcom=
e
>>> your suggestion.
>> DT parent/child child dependencies are already handled which might
>> be
>> enough for you. Otherwise, adding a new provider/consumer binding is a
>> couple of lines to add the property names. See drivers/of/property.c.
>>=20
>
> Ok, I'll try with a modification of drivers/of/property.c as the
> parent/child dependency won't be enough. Thanks for pointing this out.
>
>>>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>>>> ---
>>>>>    MAINTAINERS                               |   5 +
>>>>>    arch/arm64/Kconfig.platforms              |   1 +
>>>>>    drivers/bus/Kconfig                       |  10 +
>>>>>    drivers/bus/Makefile                      |   1 +
>>>>>    drivers/bus/stm32_firewall.c              | 252 ++++++++++++++++++=
++++
>>>>>    drivers/bus/stm32_firewall.h              |  83 +++++++
>>>>
>>>> Why something stm32 specific? We know there are multiple platforms
>>>> wanting something in this area. Wasn't the last attempt common?
>>>>
>>>> For a common binding, I'm not eager to accept anything new with only 1
>>>> user.
>>>>
>>>
>>> Last attempt was common for the feature-domain bindings. The system-bus
>>> driver was ST-specific. I don't know if other platforms needs this kind
>>> of framework. Are you suggesting that this framework should be generic?=
 Or
>>> that this framework should have a st-specific property?
>> Ah right, the posting for SCMI device permissions was the binding
>> only.
>> The binding should be generic and support more than 1 user. That somewha=
t
>> implies a generic framework, but not necessarily.
>>=20
>>> I've oriented this firewall framework to serve ST purpose. There may be=
 a
>>> need for other platforms but I'm not sure that this framework serves th=
em
>>> well. One can argue that it is quite minimalist and covers basic purpos=
es of
>>> a hardware firewall but I would need more feedback from other vendors t=
o
>>> submit it as a generic one.
>> We already know there are at least 2 users. Why would we make the
>> 2nd
>> user refactor your driver into a common framework?
>> [...]
>>=20
>
> If one thinks this framework is generic enough so it can be of use for
> them, so yes, I can submit it as a common framework. I'm not that sure
> Oleksii finds a use case with it. He seemed interested by the bindings.
> Maybe I'm wrong Oleksii?
>

Correct. I'm interested only in bindings which should be processed by
the hypervisor and removed from the OS DT the Kernel running in VM wouldn't
know it exists.

> For V2, I'd rather submit it again as an ST-specific framework again to
> address the generic comments. This way, other people have time to
> manifest themselves.
>
>>>>> +int stm32_firewall_get_firewall(struct device_node *np,

[snip]

>
> Best regards,
> Gatien


--=20
Thanks,
Oleksii=
