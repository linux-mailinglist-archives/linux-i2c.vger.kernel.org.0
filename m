Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9CDF74B4EE
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 18:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbjGGQKs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jul 2023 12:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjGGQKr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jul 2023 12:10:47 -0400
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com [148.163.133.242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8704C1FC6;
        Fri,  7 Jul 2023 09:10:42 -0700 (PDT)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
        by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 367ETmg9026166;
        Fri, 7 Jul 2023 16:10:07 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56])
        by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rpmh48a6c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Jul 2023 16:10:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ibo1XVuWF5cyA0UJ+yXXBGxx46pXE885bTBcwG4SokTJwTREKIAPu6hguMZ9ziEsnQWRMOh/9S5guXrc08iAz0DZcUl9GE9c5QsbXW8gAoN8ZUi0T+6NwZ/Of3LWRFSaxD/eswVz6y/BL+78eISoYllXVRDfGG/fQf53GqRhpm6U6nY7oLrgnepJdIS/YK0NgBW4+S25lGQxNNmlh3icRYX3984FGq/eGQrlHN0u+f/ew27Awb6IhmyBJs0mv5T9IzZpwvzCir8505DDo+Reu+YHLnhtKLo7/1AnsIAtW8XG0WO/02apq8uVtw50wRyNqHZuTWMyoWazpKHq0BA7FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSozQZ9A9MyiyPnFB2PBWUomegYp+LeZ14kjdKcsZRg=;
 b=B/efjmniAx7GoYHCEKGSoruq781+9f6q6wrMwU6LtTmddkeNmj6v7E40tcsaWwS5hJvegXl2ucBk1El3ec9QcftD66tce4JszFMcPDy1btBOOEl0RjSCCGAkOuXIlBqOAO6aMEJVDZZ8/Wo/byIExlUdx3hw5Ai+U1E48wF03t1Npe7NdgwHa4sEfZQAJgTVRdlzC8f6bVCkJaTA/VvIw2eeqUbEFU0hpzEET/wTE3AF5E0n+JX+mKHXYA8z5YR5xB2d6kG/uzbr75Raz1oM0UGSLp/LhvCWxn5QWD0YoDkjvMnNbp5E6Zb/HEqi05pLtWBnhc69V56qsuEUQapJTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSozQZ9A9MyiyPnFB2PBWUomegYp+LeZ14kjdKcsZRg=;
 b=MwbVL3s+sG4lMt7pCWRkW58ROmMMJjYGGq5WaTsQ3Jnfv1AK2VlfaOPUWXmHX54TdKhhXKlFGiLZmUxTVeCo8wXpJejxefhhMbrzUZzXrFdPPOnkqzJR/KEWA5vmsLho+x/sftecPSP7cP7/PP8dCSLoWWskAjCYz6FgmwSgN8RUGxy+mzL8lDYI84Z/43U0SZ34qMotBKDiscj7G97rWVwloPjblPY34g8Syt0qNerw7QtcKyvQyTfe8VOuqdtJH0MHYceXjW1bhJ97ZeFzyr5SF55BJ/nFFwoX+cwrOSF3zYpx9yoMhYgia9H0O0MwO0no2DEMlfYn0JghE/lgjQ==
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB6824.eurprd03.prod.outlook.com (2603:10a6:20b:29c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 16:10:03 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::528d:e0b6:ecc6:25e5]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::528d:e0b6:ecc6:25e5%4]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 16:10:03 +0000
From:   Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To:     Rob Herring <robh@kernel.org>
CC:     Gatien Chevallier <gatien.chevallier@foss.st.com>,
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
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 04/10] dt-bindings: treewide: add feature-domains
 description in binding files
Thread-Topic: [PATCH 04/10] dt-bindings: treewide: add feature-domains
 description in binding files
Thread-Index: AQHZr2YotROcBsXjd02uJm3g7CUa76+uVu0AgAAZVQCAAAoQgA==
Date:   Fri, 7 Jul 2023 16:10:03 +0000
Message-ID: <87sf9zya79.fsf@epam.com>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
 <875y6vzuga.fsf@epam.com> <20230707152724.GA329615-robh@kernel.org>
In-Reply-To: <20230707152724.GA329615-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|AS8PR03MB6824:EE_
x-ms-office365-filtering-correlation-id: 69ffbdf5-2320-40d1-179a-08db7f049f3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PH/lRok4yP9FTY5ayyxH5H435i0U3++p736IzlV+ectHkqJMNc/BEKBOK6h1P1z7YB0RZrtF65iqXG5iyZlPHsvfCoSF43X73IhTHq3wK6hn1b41h8uJ4FOlyy4nWWuIDcNF6uVsnX+JUQwcTk0SDzsCfh4fXA10iBvBL/TyoYlM0xRvvug8O09Z52sx+oRZxN3fCzmkODI1AIjk5W8vwwL4rjY91FZaB/F4g2xrdvAjGVePdFxo1e6WrQCYpSL51aNFD+Qhjd6T799wQ9ToKIRvdZ9k/5J+bXvAQ2XI7e70+IYMCSlMFD+u4LMBCeea0aMBfsJf08Kw9U4pgUjls5SFTlAchRDyzO8/x5p1qfN+cOE+/3KgMulW59u2cvAjkXPbaX7L6hi49YDSWBwwlQ1BDn6+FEqdQd44Jn5Frs3hP6SHeC0J0/vkIfL+P/3KXRZg7f3fdVLlHihbNC9ZSBkj/HyEOnuTuvqbfwF79lGf8fDk4ovmafKMVg+4bPCAhOtiATb52twUKLaamLL7GBlwJfTqwF4YMNc+eJ7q+SY2FDQuc+f4myX74upBr/k7dGXE9CYsGBK4rs8SSS0tw4tiHhl5PMf8x3rtpZnvFuw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199021)(478600001)(54906003)(83380400001)(86362001)(186003)(6506007)(26005)(2616005)(38070700005)(122000001)(38100700002)(71200400001)(36756003)(6512007)(966005)(6486002)(2906002)(316002)(41300700001)(66946007)(76116006)(91956017)(4326008)(64756008)(66556008)(66476007)(66446008)(6916009)(7406005)(7416002)(5660300002)(8936002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?u61Wrv8z6Ul/25wyq9PCc/CBK/gx0M48cgQRK2BCb0TZL+2as98fWFyg3L?=
 =?iso-8859-1?Q?nx6T2d0BTFMt4gOYs2iIXNL5Vt+x2H9xM4Xa8gwxk++8U9y96IJCwmzUiI?=
 =?iso-8859-1?Q?61f7jMJiHXtHuynvH5TYw9KMrCHukPtzxvB7gEKx9epMvgmxA51xcvllCp?=
 =?iso-8859-1?Q?6ZKyjm/Z92+Gvj+rrPT46cBO303EUQ4+cK7UAytk6AcTBPBxJviZzun0jL?=
 =?iso-8859-1?Q?TiKbPnkNi7mxGXT5iYKe7sK9qPrlcDIoArD8CTo6Lgf1TTYhAlnCXmhfd3?=
 =?iso-8859-1?Q?5ACZGlO545OaBPmVZmdUsdi/WhZTF2bgkp68kiYYGDdjct9MQmASR2VMaB?=
 =?iso-8859-1?Q?F9TCEMLQBkf3nbY+G98EaOGGJus/iaF7gusV4L5gSWSQqONGnyDXFD+vNI?=
 =?iso-8859-1?Q?rmsISbuX8Ts4KIyajE9mH4WnQ4SI/KDj6d02s0HX9KmsyLzuVsX8oXBBn2?=
 =?iso-8859-1?Q?ro1Ii3Hbmt5p34P22rvxP552pxtjVcS2sgZdVSpQpV01F9jW6ofou/WQA4?=
 =?iso-8859-1?Q?7TRL5xgheDCCwMQL2OQmCjRnAaJ0AJcNsU10SWwJ/HqzXmlFNWo5ot28AW?=
 =?iso-8859-1?Q?LqM1QsJyZyyUCtyev6k4JckaRFnJPDdetcSSI9jDOhqqWExQEc3kZ36hLE?=
 =?iso-8859-1?Q?WUFrFzGZTSkIhRuXYARAEVohxoC/n1ty2TZoaLia49f/fhHvYhTqW2oelG?=
 =?iso-8859-1?Q?EcyZabOPI4H+zN1Y9Sdvhte+KeHTnCPwq1/LlnddFmhMTRFrQuXq6ZBw6C?=
 =?iso-8859-1?Q?Gmq1yhJ+sHsv3TOGv8opp2Hc/cHJXkrfKBDDSFtif+XA+Q+0K96L8NdYJy?=
 =?iso-8859-1?Q?X7VDfXg5If5TeWrIbwa0c2OD6siwrfMGwaeAuCoYWSCya1RQeHcqYUn2be?=
 =?iso-8859-1?Q?9Ou109a/lJ2arq8fK0ZeNZkkmKuWB+MDMdCzHAfdVfVXxb9/9f3JWM5UQe?=
 =?iso-8859-1?Q?J7vwsXpFjErovoT+JFLVgXB/MVR5OJaL5s4aIo6yKSRdH28JLvZDAgfy1G?=
 =?iso-8859-1?Q?SIEV+0J7DgxRzYpp8ahKDlSy+CBeGeI7Cj3kLqwyfLUDECEssoy7VjefYp?=
 =?iso-8859-1?Q?yfq0NQs4oWIX+iDTdS8NH/h7yDnEkxB+L+SlYUBZcMNPwP2ASuyhiuwyqC?=
 =?iso-8859-1?Q?00kkarTERBD8MrnZMJrtW+UoJCM9MCzHGUDTrZHO76teJLv0yGVNMwDYHd?=
 =?iso-8859-1?Q?cPKW6IWWSsDv2a9JaYchMXPwsdJji6HmN82e2QEZ1eVMDP8mCweCDpLf/n?=
 =?iso-8859-1?Q?0e30xZD95cKD/C6LZacM8cNMir4HYlHI7byi1yk/MP+/71yg4U57U/MNiP?=
 =?iso-8859-1?Q?h805xH4t5dwen4WxigMkjthGthLSW1tcGba6QbABfa8OgXuR7wSIoRdIcw?=
 =?iso-8859-1?Q?y9uc1HEFjLTgBKcU9fY9TgCBRx/sL52d/3kxpJoLOql9+h32ajZicrEQfW?=
 =?iso-8859-1?Q?cF4sWjowAcNh2laXIjKyoDJ1ESalHqMKQuxTWvLR0rtsZlpWM85qLnM3jG?=
 =?iso-8859-1?Q?etzKQVHKI4OEbVAZdqcF0JoqF6n3Ak4JkyFBR8N5XlZ6X7MKnhElqRuHgB?=
 =?iso-8859-1?Q?PNxZBONFKk0tCLaV1bGzNjruaAKiZ8mhorwSymUXxsZFS/PQS9K2PKk3oV?=
 =?iso-8859-1?Q?7NwX+9T1SSQjdAbA5C/ksQmElqIqFKlwBs6JmkVtMPc3urwPAeUOEKeA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ffbdf5-2320-40d1-179a-08db7f049f3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2023 16:10:03.1269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gcnLG1GWe6yiZfwBReHTsNYiT+H7+QHZODVxgrYQAFuPkKSE26l8dAN2oJ0zyM3p6c40vct8HPiX/lO0uxFuU+NlkJqWfpX5shtn0IvmCl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6824
X-Proofpoint-GUID: DUcJRnC6DagaOdZzqew-X0_SNifoqpYb
X-Proofpoint-ORIG-GUID: DUcJRnC6DagaOdZzqew-X0_SNifoqpYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_10,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1011 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307070150
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Hi Rob,

Rob Herring <robh@kernel.org> writes:

> On Fri, Jul 07, 2023 at 02:07:18PM +0000, Oleksii Moisieiev wrote:
>>=20
>> Gatien Chevallier <gatien.chevallier@foss.st.com> writes:
>>=20
>> > feature-domains is an optional property that allows a peripheral to
>> > refer to one or more feature domain controller(s).
>> >
>> > Description of this property is added to all peripheral binding files =
of
>> > the peripheral under the STM32 firewall controllers. It allows an accu=
rate
>> > representation of the hardware, where various peripherals are connecte=
d
>> > to this firewall bus. The firewall can then check the peripheral acces=
ses
>> > before allowing it to probe.
>> >
>> > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> > ---
>> >
>> > Disclaimer: Some error with dtbs_check will be observed as I've
>> > considered the property to be generic, as Rob asked
>> >
>> >  Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml  | 4 ++++
>> >  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 4 ++++
>> >  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 4 ++++
>> >  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 4 ++++
>> >  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 4 ++++
>> >  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 ++++
>> >  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 4 ++++
>> >  .../devicetree/bindings/media/cec/st,stm32-cec.yaml          | 4 ++++
>> >  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml   | 4 ++++
>> >  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml       | 4 ++++
>> >  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 4 ++++
>> >  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml   | 5 ++++=
+
>> >  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml         | 4 ++++
>> >  Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 4 ++++
>> >  Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 4 ++++
>> >  .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 4 ++++
>> >  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml      | 4 ++++
>> >  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml  | 4 ++++
>> >  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml    | 4 ++++
>> >  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml    | 4 ++++
>> >  .../devicetree/bindings/sound/st,stm32-spdifrx.yaml          | 4 ++++
>> >  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 4 ++++
>> >  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 4 ++++
>> >  Documentation/devicetree/bindings/usb/dwc2.yaml              | 4 ++++
>> >  24 files changed, 97 insertions(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.ya=
ml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
>> > index b767ec72a999..daf8dcaef627 100644
>> > --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
>> > +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
>> > @@ -50,6 +50,10 @@ properties:
>> >    power-domains:
>> >      maxItems: 1
>> > =20
>> > +  feature-domains:
>> > +    minItems: 1
>> > +    maxItems: 3
>> > +
>>=20
>> I beliewe feature-domains is generic binding. This means that maxItems
>> can be implementation dependend. I would rather drop maxItems so the
>> following format will be possible:
>>=20
>>           feature-domains =3D <&etzpc 1>, <&etzpc 2>, <&some_other_domai=
n 1 2 3 4>
>>           feature-domain-names =3D "firewall 1", "firewall 2", "other_do=
main"
>
> The above already allows this (not -names, but the number of entries).
>>=20
>> Also I beliewe driver will handle feature-domain-names property so it
>> will parse feature-domains only related to the firewall.
>
> Now I'm curious. What's an example that's not a firewall?
>
> (Note I'm still not happy with the naming of 'feature' as anything is a=20
> feature, but that's the least of the issues really.)
>

The alternative usages of feature-domains was originally proposed by me
here:
https://lore.kernel.org/lkml/c869d2751125181a55bc8a88c96e3a892b42f37a.16680=
70216.git.oleksii_moisieiev@epam.com/

Also I remember Peng Fan also was interested in those bindings.
I think the use-case when one node is protected by firewall and also is
controlled by scmi feature-domain-controller (As was proposed in my
patch series) may take place.

As for the naming maybe you have some thoughts about better name?


--=20
Thanks,
Oleksii=
