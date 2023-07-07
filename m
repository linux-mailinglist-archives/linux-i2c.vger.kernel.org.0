Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B05474B2BE
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 16:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbjGGOJL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jul 2023 10:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjGGOJK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jul 2023 10:09:10 -0400
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com [148.163.137.242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BFB31B6;
        Fri,  7 Jul 2023 07:08:45 -0700 (PDT)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
        by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 367DXiLN016062;
        Fri, 7 Jul 2023 14:07:23 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
        by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3rp6btajr3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Jul 2023 14:07:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYkCzo8ox33LvNF4Fes34m82K+kDO5Z94XKB0NLYMsMMvRhZkIdj4KN8KIMimI/DY0BDM67eup8aY0GYVBbBmQcbpziW+b1PLL2dzUoEzgohNzb0Yq5kPdMEeh7F73XSNAMol9worHpAoXGVih1x8sKYJWqt7MRNZu6GnKQFf/obANfJi5nWlZkUT7011zeRIL8t7rv8GmDguAs1zOyrkEXeIIiiJIHzQ3esbLG6ybNa7U3lD64Mki2+Pdb8+OgossY+bVf9aXToQg8hV8usFoPAei8MSAhtty90bWWDnPe9VtrSEmLxsWlbqiepW+sgMs2riabXvz7xPUT4DVXBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7RAFKyB6UWMECxf9DHX7j/mCri3Vyxj1E0OTRJlBVo=;
 b=MiW+LtaVgLOYtb9u1IU2npxhzn+cSpBSlb9gOVm1RqJdJEa8ROyR2kc5M84Yr5F7jsx9f7WLo/pxEbnKciusizy7zg0FVFo092e5LC2WLfHHxEhAuK2DBhcso1/Qnv0zw4PngCKycTV8uOmy6AXqdcZzhS4zn6u7qtw3Zb+2W0hWyvPwtCYGHp02vwCk5KdIQUKli216x4LmSEZj2LZCTx+l2uPrCG17bHWIEs5k9JyVHOui6hdNZfRFosbkgTJ4FiEkm++TWA4OOjfTtcldOXciwjoLBGiYnn7drH+rwGOdNXHq58j0FXqRc7Ymb7Pnocyj/59Plm06Ab/uIVzmZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7RAFKyB6UWMECxf9DHX7j/mCri3Vyxj1E0OTRJlBVo=;
 b=mNTTJmUx41MdfUEpn8YavzAUQGMG4XyteTjZHQxiQl4joBqnkfKYXrUOKiM0IqZgWtQ3+ZoqO8DmM35reFAUdel6S6Zj7jcOJZrWFM/L4axVA/BOws/GsJnDSeLujf52p1L0NPijbcr7wDuCuB1u0RxiDy0AYUPSgjVfKYEcUSQ/Or40mcuVLdXZu/ZfZHrwBPK2CTsdYNlE3alnbeHDKGngSGVlyEJxnI5d9vATGbpfeDJMoY1fLvhkcRNao+Keq0NUI8OUDTecWXfxj3B6t93xe6E+7WQaYyDzwfO+fz8xJvZ+kSgsh4qPzTynrd6LnRXrMh92epvN87r61AKODQ==
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by DB4PR03MB8513.eurprd03.prod.outlook.com (2603:10a6:10:37a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 14:07:18 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::528d:e0b6:ecc6:25e5]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::528d:e0b6:ecc6:25e5%4]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 14:07:18 +0000
From:   Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To:     Gatien Chevallier <gatien.chevallier@foss.st.com>
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
Subject: Re: [PATCH 04/10] dt-bindings: treewide: add feature-domains
 description in binding files
Thread-Topic: [PATCH 04/10] dt-bindings: treewide: add feature-domains
 description in binding files
Thread-Index: AQHZr2YotROcBsXjd02uJm3g7CUa76+uVu0A
Date:   Fri, 7 Jul 2023 14:07:18 +0000
Message-ID: <875y6vzuga.fsf@epam.com>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
In-Reply-To: <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|DB4PR03MB8513:EE_
x-ms-office365-filtering-correlation-id: 914d4b39-a27c-4aef-e913-08db7ef379bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZkQPjUW+z7PUr/baDHK7d3PxL9LtIlpTAwKyUDJhGet2l5Ge2x5hu23QetHHkowfK+mLvX1Kbxh+g7udl3Nv23crjztvf9LaF2t+oS+mSesIbBAbjHT7nnzw6Kzl7zw+CeIYYwybgcAyZjxoDxGD4k2/aNGp/pH++0eeAwO1eKxeAV3mA7Uk01k1vY9mbwCzfdQxHJHswd6idLPy/tHdxb4sgne3g0hnZY8XjzRai8c9IZt4OuVcZIV62IoYolwE8cK3U51u9NdrtUYQxDaLxDjX6VdFa6j/qwzUFBJa3f7nTeb+Hwr48ItTgYA8eDwhziSmTvmLaVUsYVIfS6Xu5R7W1Od4XuZ+9XpkxKoVRsYNPoKXLwVrDZaATJA/63gbuhVqOC25AeLaYPWshUHvr9HtJKCephUFYEDQVWcygzW6DqidCgOUjGmzl+dAFDCnbG6cenNfmupF8UvoD1KI3Meza/pHXQDE9MsO/7YryuU8A941P6WYutI1oHMl14OZGua23ruCsaWI/3yLw/okeTKZMGIuquXomettYytzqs7exKExmjbxGGB8fIn8HLKUqHZAoerFRedKCh2XYeKCpK/HOapnrRmRZDwHAkHBGWT19zcSyFJjd6W4r4nnGDh+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(366004)(136003)(346002)(451199021)(36756003)(7406005)(30864003)(86362001)(7416002)(2906002)(5660300002)(38070700005)(38100700002)(186003)(6512007)(55236004)(83380400001)(6506007)(91956017)(26005)(4326008)(6486002)(122000001)(54906003)(2616005)(66556008)(66446008)(64756008)(316002)(66476007)(6916009)(478600001)(71200400001)(8676002)(66946007)(8936002)(76116006)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+u9Zpz2YSA6W9hMF6Y7/yLOShXXmDGwOaHlUfBwWYqmj7BwDqsjEPQV6Sq?=
 =?iso-8859-1?Q?8HK//Tvj9UphnEw16WLzk2ck0vI8CpVxUIMAfChnXUf+GSrgbhSkF+jqcz?=
 =?iso-8859-1?Q?+BBwbgsQruvd901+nYZOEguMs9SOmNRbf1N3H3vSquezHKBuFuAbq1tmcj?=
 =?iso-8859-1?Q?70WQm/erAii5hMsmV3cPhkSzUZq+UyNEf8y0ciAcSBGQfYtCVskZaij5cQ?=
 =?iso-8859-1?Q?lGbSIa39bfcGGJssKYNzzV3DY0FWhEf0WIHsFeBvRlf+wII//Te9zvPcz2?=
 =?iso-8859-1?Q?54nZ3DxyfUY0Z3TSGqWnyD1Fc49qqEGYPeNC6dE/sGKAyp9EjdIqa578iN?=
 =?iso-8859-1?Q?/cwQc1Ylb3V/qBcS9dYU2HapJ5WW5ZtanuLwXUwaYOSTZCjtR7piiU8QkM?=
 =?iso-8859-1?Q?IJy1cz1SHzPsjxISumd+hGIXDpoiK1WX9RArQVVSNG+eAFp3Ob0/Z6RlGS?=
 =?iso-8859-1?Q?bcpMzxvYR0jcmyC6tXhYGCUcWJqtYuLias9eOSyxCorPldHGMD5qMewEAm?=
 =?iso-8859-1?Q?qVMGDoBh/h+lzfoArGAkzaGp/ypEvLMxQY92sSTNtGqBUs88LH0mEyZq/S?=
 =?iso-8859-1?Q?RzkvhnXLLzQ1pKX0S0YHcECRTJtOd+NqcHSZkj8KZJuVgfQjNFinTT5MJq?=
 =?iso-8859-1?Q?GW49PHCfW2YO/7MyTJoPkzmtiV9WNV9WGWEyCZs56BaV5RDoVgpcSMno/K?=
 =?iso-8859-1?Q?fu7uJ8NuIy/LnkYrsKiQp3QKaOfK6wevUgSvdIzLMPWBZuPFYdQFKNwR9j?=
 =?iso-8859-1?Q?y6i2aw5/SDScqtlkNFyQcBr/XymGZ8o5cNdE45myJMXpBTo/gpT+HpfaHR?=
 =?iso-8859-1?Q?XsfX7d64wHcJs4S5sR2s/y4dlenFFtL8gGQlCV7vMNIT9D9mycn+04X7BZ?=
 =?iso-8859-1?Q?27w01ij26zhBIX7wMeElPOHKFF02xUocDBkX8mnRl53uobQte6UJU76VeF?=
 =?iso-8859-1?Q?M7Vwpd8yUpQKo44iF5bpdFGbNEZaLgDO35p2EDMkmYSN4MP/QidxLwfFW4?=
 =?iso-8859-1?Q?ObFJan623onWrUb79VqKCR98JheVxxsy35B0rFeuXAKOOc2osiIBPYh1pN?=
 =?iso-8859-1?Q?sShrK3NmRKYwEAXjhlr7WpNftcwHflhkiMSu+qYK4EgHHa0UPoFOoEBArT?=
 =?iso-8859-1?Q?8R3dDdg2efNBd8j4gZIwq+lKOkdN1Dmt5BUNAyW2agmyUL3+3+bzDdOvDw?=
 =?iso-8859-1?Q?IripcfS6OglF+1NZWY4av/Q2LlIkEV41fDrB8lF8rlCKtS4qxbsbwfwKKj?=
 =?iso-8859-1?Q?GdvPAlCkj/q36EEFngevkUwqMfTs/JE0FVLr7aBVIzHFSdzrGVpY+Ugfu3?=
 =?iso-8859-1?Q?Rvkgvagr86yiLFnYf4vT0ilEh49ygkCbYUnsmifZEI09kpYjXrNuqJAisE?=
 =?iso-8859-1?Q?erEsEAFtsNwZxlF3/LfkErqPAYNLFpTncpu66na0/+otiEWvFM60Fxmh3U?=
 =?iso-8859-1?Q?MwIRf1X7lHPC2VIRWamrhqAdPbsB1rsLJM73tEkCLOlDqsEcXkJSci72kO?=
 =?iso-8859-1?Q?yvNvyJDqCT+rLF+m11EBnuM7D2+6S/iYdVdv/uIuulP2vXNm34lOQG8GjC?=
 =?iso-8859-1?Q?XqCjmH4AaITVTmsIgs7zDNHALjWfiMWlzqnrn2ECJqKiTQS79fhpdFODwZ?=
 =?iso-8859-1?Q?ELhMxOK4Qq5RUcgiDvGgo47Qcdijkdd5RRoWVpVnGsiprWIHeuPjKc9w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 914d4b39-a27c-4aef-e913-08db7ef379bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2023 14:07:18.7433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VAYW4bySiSe6rUF1Uy0+2qlvEouk0DZLtEERTvVzmRgWWAzjnLD1BMnYWRcjo+4q7fuEWsIvfaKiOXBrzjtQb9daudQz3A8Z6n2Z1xnBQGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB8513
X-Proofpoint-GUID: sFNslrQw9zL_iYUZ8YjwX5x0kG6zqUjg
X-Proofpoint-ORIG-GUID: sFNslrQw9zL_iYUZ8YjwX5x0kG6zqUjg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_10,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307070129
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Gatien Chevallier <gatien.chevallier@foss.st.com> writes:

> feature-domains is an optional property that allows a peripheral to
> refer to one or more feature domain controller(s).
>
> Description of this property is added to all peripheral binding files of
> the peripheral under the STM32 firewall controllers. It allows an accurat=
e
> representation of the hardware, where various peripherals are connected
> to this firewall bus. The firewall can then check the peripheral accesses
> before allowing it to probe.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>
> Disclaimer: Some error with dtbs_check will be observed as I've
> considered the property to be generic, as Rob asked
>
>  Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml  | 4 ++++
>  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 4 ++++
>  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 4 ++++
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 4 ++++
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 4 ++++
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 ++++
>  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 4 ++++
>  .../devicetree/bindings/media/cec/st,stm32-cec.yaml          | 4 ++++
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml   | 4 ++++
>  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml       | 4 ++++
>  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 4 ++++
>  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml   | 5 +++++
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml         | 4 ++++
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 4 ++++
>  Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 4 ++++
>  .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 4 ++++
>  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml      | 4 ++++
>  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml  | 4 ++++
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml    | 4 ++++
>  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml    | 4 ++++
>  .../devicetree/bindings/sound/st,stm32-spdifrx.yaml          | 4 ++++
>  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 4 ++++
>  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 4 ++++
>  Documentation/devicetree/bindings/usb/dwc2.yaml              | 4 ++++
>  24 files changed, 97 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml =
b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> index b767ec72a999..daf8dcaef627 100644
> --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> @@ -50,6 +50,10 @@ properties:
>    power-domains:
>      maxItems: 1
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +

I beliewe feature-domains is generic binding. This means that maxItems
can be implementation dependend. I would rather drop maxItems so the
following format will be possible:

          feature-domains =3D <&etzpc 1>, <&etzpc 2>, <&some_other_domain 1=
 2 3 4>
          feature-domain-names =3D "firewall 1", "firewall 2", "other_domai=
n"

Also I beliewe driver will handle feature-domain-names property so it
will parse feature-domains only related to the firewall.

>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml b/Do=
cumentation/devicetree/bindings/dma/st,stm32-dma.yaml
> index 329847ef096a..2236ac95574b 100644
> --- a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
> @@ -82,6 +82,10 @@ properties:
>      description: if defined, it indicates that the controller
>        supports memory-to-memory transfer
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml b=
/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
> index e722fbcd8a5f..47ae890f5bd9 100644
> --- a/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
> +++ b/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
> @@ -28,6 +28,10 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Do=
cumentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> index 94b75d9f66cd..326a96741f50 100644
> --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> @@ -99,6 +99,10 @@ properties:
> =20
>    wakeup-source: true
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml =
b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> index 995cbf8cefc6..3eb20d67f0fc 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> @@ -93,6 +93,10 @@ properties:
>    '#size-cells':
>      const: 0
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  allOf:
>    - if:
>        properties:
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc=
.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> index 1970503389aa..bc34ae172417 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> @@ -59,6 +59,10 @@ properties:
>        If not, SPI CLKOUT frequency will not be accurate.
>      maximum: 20000000
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml =
b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> index 04045b932bd2..90d35a2a6504 100644
> --- a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> @@ -45,6 +45,10 @@ properties:
>    '#size-cells':
>      const: 0
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  additionalProperties: false
> =20
>  required:
> diff --git a/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yam=
l b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
> index 2314a9a14650..f88e3c0e6175 100644
> --- a/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
> +++ b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
> @@ -29,6 +29,10 @@ properties:
>        - const: cec
>        - const: hdmi-cec
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b=
/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> index 6b3e413cedb2..4fa1d14910df 100644
> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> @@ -36,6 +36,10 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>    port:
>      $ref: /schemas/graph.yaml#/$defs/port-base
>      unevaluatedProperties: false
> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm3=
2-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,s=
tm32-fmc2-ebi.yaml
> index 14f1833d37c9..63b3d012147b 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-=
ebi.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-=
ebi.yaml
> @@ -45,6 +45,10 @@ properties:
>        Reflects the memory layout with four integer values per bank. Form=
at:
>        <bank-number> 0 <address of the bank> <size>
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  patternProperties:
>    "^.*@[0-4],[a-f0-9]+$":
>      additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml =
b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
> index 27329c5dc38e..59d770544950 100644
> --- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
> +++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
> @@ -44,6 +44,10 @@ properties:
> =20
>    wakeup-source: true
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>    pwm:
>      type: object
>      additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml b=
/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
> index f84e09a5743b..d5ad097e94ec 100644
> --- a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
> +++ b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
> @@ -67,6 +67,11 @@ properties:
>    "#size-cells":
>      const: 0
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
> +
>    pwm:
>      type: object
>      additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Docum=
entation/devicetree/bindings/mmc/arm,pl18x.yaml
> index 2459a55ed540..6ebedee65153 100644
> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> @@ -79,6 +79,10 @@ properties:
>            - const: rx
>            - const: tx
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>    power-domains: true
> =20
>    resets:
> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Doc=
umentation/devicetree/bindings/net/stm32-dwmac.yaml
> index fc8c96b08d7d..0e408dc85c13 100644
> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> @@ -93,6 +93,10 @@ properties:
>        select RCC clock instead of ETH_REF_CLK.
>      type: boolean
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - clocks
> diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml=
 b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
> index 24a3dbde223b..b9ac20c8bf05 100644
> --- a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
> @@ -55,6 +55,10 @@ properties:
>      description: number of clock cells for ck_usbo_48m consumer
>      const: 0
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  # Required child nodes:
> =20
>  patternProperties:
> diff --git a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf=
.yaml b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
> index 05f4ad2c7d3a..02cefe4ef42b 100644
> --- a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
> +++ b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
> @@ -30,6 +30,10 @@ properties:
>    vdda-supply:
>      description: phandle to the vdda input analog voltage.
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml b/Do=
cumentation/devicetree/bindings/rng/st,stm32-rng.yaml
> index 187b172d0cca..79eb5f5bd252 100644
> --- a/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
> +++ b/Documentation/devicetree/bindings/rng/st,stm32-rng.yaml
> @@ -30,6 +30,10 @@ properties:
>      type: boolean
>      description: If set enable the clock detection management
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml =
b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> index 1df8ffe95fc6..893978e7170f 100644
> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> @@ -70,6 +70,10 @@ properties:
>      enum: [1, 2, 4, 8, 12, 14, 16]
>      default: 8
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  allOf:
>    - $ref: rs485.yaml#
>    - $ref: serial.yaml#
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/=
Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> index b9111d375b93..64c5898e51f8 100644
> --- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> @@ -65,6 +65,10 @@ properties:
>      $ref: audio-graph-port.yaml#
>      unevaluatedProperties: false
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - "#sound-dai-cells"
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/=
Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> index 56d206f97a96..9bc08b7645dc 100644
> --- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> @@ -48,6 +48,10 @@ properties:
>    clock-names:
>      maxItems: 3
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yam=
l b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
> index bc48151b9adb..f00e5db9ee3b 100644
> --- a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
> @@ -50,6 +50,10 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - "#sound-dai-cells"
> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml b/D=
ocumentation/devicetree/bindings/spi/st,stm32-qspi.yaml
> index 8bba965a9ae6..2ac136802467 100644
> --- a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
> @@ -46,6 +46,10 @@ properties:
>        - const: tx
>        - const: rx
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Do=
cumentation/devicetree/bindings/spi/st,stm32-spi.yaml
> index 9ca1a843c820..725c26daabe4 100644
> --- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> @@ -59,6 +59,10 @@ properties:
>        - const: rx
>        - const: tx
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  patternProperties:
>    "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-f]+$":
>      type: object
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentat=
ion/devicetree/bindings/usb/dwc2.yaml
> index d3506090f8b1..c372caf154fc 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
> @@ -171,6 +171,10 @@ properties:
> =20
>    tpl-support: true
> =20
> +  feature-domains:
> +    minItems: 1
> +    maxItems: 3
> +
>  dependencies:
>    port: [ usb-role-switch ]
>    role-switch-default-mode: [ usb-role-switch ]


--=20
Thanks,
Oleksii=
