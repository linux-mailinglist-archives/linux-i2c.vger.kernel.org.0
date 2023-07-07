Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1153874B233
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 15:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbjGGNu6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jul 2023 09:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232676AbjGGNu4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jul 2023 09:50:56 -0400
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com [148.163.137.242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB19E102;
        Fri,  7 Jul 2023 06:50:52 -0700 (PDT)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
        by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 367AZF9g010366;
        Fri, 7 Jul 2023 13:50:21 GMT
Received: from eur02-vi1-obe.outbound.protection.outlook.com (mail-vi1eur02lp2045.outbound.protection.outlook.com [104.47.11.45])
        by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3rph388svs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Jul 2023 13:50:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRStv10mK8BY8U3iNljwXc7R+mfZ723maBGw5b1jc3wkmdz7i9VSv0PggzpzhHaHN7nyofuq5bjN0HPLeJ1NFCDY5WRPEtIAsvPLqGXpEKVXwPZ07pVe0aTPZ1X11mm7jMKBPJq3Q+rpUHJuIL1LUXX2x4z60JAIpfjzVxKP4RrIxhRUx2AYyBnMCUT5pvScXbtjzsLNYm83SwItaItSe/loa+IGSbLmVRCFH60SCbgS5R2rs1QKqLMPWrHwsPdqIYWOY0n/Xvefga0jzKDKV2g2h+WSl/MOFKmhs++ImHT/eVKfHgcYSYKQ2U09smw275U70I0HnOBKjqU7EfEdSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sw9JqtJTstd6IkS0IYqoNq8YOwxbgM0fS3jYfKvENY=;
 b=hKL7O1I1rSs967jW97rL5noMa0UYE4B6K6vmeyoMporBqeDyy/6RINKsmi28EVSKpAycZTunAPvnR7G1mh17qawNxI94VIQ+2ShKtBpG43g79eanyRq+qnlERe5f3pnJLlDugyJVzDbK92FAOsZ6r+SxDfgQG4loTVLIHbOKRtOcmVvO0ZVWIb2vH1fWHifr/SutMu2fdcuqD12Fwwwk+HivSt9aT+v6W3tlHJ0GZHnrG/lYsPbvmViB73sLMXUmeg+5iycCXxDNyf3TTeITAQYIGtOSDd8ciK2rjboLroOeU9gKjQGhdQo8CwJlhVI1zM3eySuA2WLSbtPBRBKjzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sw9JqtJTstd6IkS0IYqoNq8YOwxbgM0fS3jYfKvENY=;
 b=KhLPPl3LX+HWf8KxzMLmME3y4FQ29tym24xaceLrtTHFi6TK6CmnP2rm8uigsACdNHp/ur3eXhUDfEYCnZ9fqfcqdRoCwl1zIZep0V2OZ98cbi+EOW8dzI+PMO3V8S/dZKdoFF+8fp5XbcUFgQnyit3DAJbPd5t4FnL646e3b6FjOrgy0XzEPmreC2/DL7L4/286/4ODbXrQpfm4hMnBxEc1FPWDFAHp/9qAn8ee3danoJYtqsYa6+Dc4sk34MCDJ5hgEhXj8GBP8y0NNA9UO1fxZBy6grUZkKbuhcgM1Ku8hrucry9S60ffeitJjTL+Fq4cVFwoGEI5WEEZuDus8g==
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB7232.eurprd03.prod.outlook.com (2603:10a6:102:109::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 13:50:16 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::528d:e0b6:ecc6:25e5]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::528d:e0b6:ecc6:25e5%4]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 13:50:16 +0000
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
Subject: Re: [PATCH 05/10] firewall: introduce stm32_firewall framework
Thread-Topic: [PATCH 05/10] firewall: introduce stm32_firewall framework
Thread-Index: AQHZr2ZRFR+uG6i0BECeBf17iNfNxq+uTeWA
Date:   Fri, 7 Jul 2023 13:50:16 +0000
Message-ID: <87a5w7zv8o.fsf@epam.com>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-6-gatien.chevallier@foss.st.com>
In-Reply-To: <20230705172759.1610753-6-gatien.chevallier@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|PA4PR03MB7232:EE_
x-ms-office365-filtering-correlation-id: e775857e-1c0d-4d3f-b01c-08db7ef11847
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YN7VzEK0Mi/0JtXXBUt+7aC9lRJI0CHHxEtXXgycuJqOhdPAa6Jpv4kw+NfsNCLRHj5yK552AuLk7v/rlg/JJqo1fVVZwpukos8zzHkZ7Gx9H7CECd941caSJ188UCe6mSWRuHQGlFlB24+UPhTiEZeskxDomNOCZC3sX9TXP5mfq66ad33lLURsQlzAVEm2Kjtzd8kvR25HRHO9Bzcs7y3+P4hIGSdOssN4gQ2HY1OJuIOuWlNEMAlnhkQYxZ+wm7h0lBSFmoq1tK/FMW9NMmz/2AIqQVTheGkJ4k4XeQ6FFWwsozCiVMolqL15xLCGZriBiPan+w+en/m33HkWXI+J3wqNhofJmsSB9Kh1vIyR+KvuGozW3xhh5sQLOkW6Iiq9qbMApev2JVpImpQM7LWSLRJahAQl9oy6fFQaUuYFS5HPHc/CieOBGntQ8S0uz/Tysu/SB5XEIjrLQvJxsySPGlto7dEF5qz4DsXZjSCIwrVU8tHG2i4reCzPvbPbHBAqStE+Ua6pyxwKIpHDUPXA0+QKuWPLLNOqpuRT0NIy/Zke04pDR1CWfEe11u+4gMnjiuDUrfnwD5OQqDAi5/+E+oVY/FrdhrbuWtspb2F/J8NbosGdlOx2RQtujegN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(66899021)(478600001)(6486002)(54906003)(71200400001)(91956017)(83380400001)(36756003)(86362001)(38070700005)(2616005)(30864003)(2906002)(186003)(55236004)(6506007)(26005)(76116006)(6512007)(122000001)(38100700002)(6916009)(4326008)(66556008)(66946007)(66446008)(41300700001)(316002)(64756008)(8936002)(8676002)(66476007)(5660300002)(7406005)(7416002)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UpX5QCZoZcx2Wkcne9Olx0QsaFb/XP/RKv9JveJ7/FPBE3+VGHKP2jcYmb?=
 =?iso-8859-1?Q?7QLtXs5Fe7ygvM5xo5QriLqstK13paKUPF5HxRfNGR5hFgA0WZCKBHr/YG?=
 =?iso-8859-1?Q?JCv6lYxMKQ8J6N2h/YJZq5JU2F59ga3Mg1YdFLUSmlD8Z0eUk4/mByxYTG?=
 =?iso-8859-1?Q?jbAV7Ke4eiIEVBZEtP8zUc+3/dd0gafPbHAI9URhfitwGoldzzMHJWkvz6?=
 =?iso-8859-1?Q?1dUrqB63S0KZk6xfUKc6kFPspb7RwLC09uFqjzxq0DkR4itRgWfU20AWIH?=
 =?iso-8859-1?Q?YfZD6cw25kZd4kZHg/hHpHonfUQEguyrqR9Ss1FtKGndMxCrCvl1QrjgKf?=
 =?iso-8859-1?Q?FeKJv6EJakW1KWkLO+DYmahADBsUCJ+B3VSZN3jFvuS7e1p97j0TgWzE9D?=
 =?iso-8859-1?Q?K/UUGXRn5heoXknTmdotN9pT2lH+IuJvPTICbuZR0DcdmUZX4skizWSr50?=
 =?iso-8859-1?Q?uXXwx0gszTfHN61pnPYe803DCE9711WtEamKEX+Ke0uFCh4eRQ8+5la9Wm?=
 =?iso-8859-1?Q?MYhXmR895MZ3QXaWZ81RjFaf0XIbtzNa6xGlvGF1dNb5YefzBrC08G8Qip?=
 =?iso-8859-1?Q?I7HRlGadXcBDCNgI94O1+CUtUFLm20GsL2ZfNIigntL8XSPEACWV/QfY8y?=
 =?iso-8859-1?Q?PKnCxPmpCL4KQDm25xY0dgxKXIyWpqUVEbSHOotd7imQi5gxX9FNJKjvg+?=
 =?iso-8859-1?Q?TckhVQQijgzuHSc3s5NYATjqGTyvDUlhtdfdBSkXcRM5dQ+8mJSlAFZGRP?=
 =?iso-8859-1?Q?zVduUb3Usc/lshOSXKTAOvkMbTznxu2RBRrAMyeT3arS/FFZrgg0IVV5z8?=
 =?iso-8859-1?Q?1KFedZaVPO9Vz4qD3ZJqTOyVkm/0ohOcsu/k27pVQTRffuVzhrPQ0mvlj3?=
 =?iso-8859-1?Q?6Oww0rWBV5uvStX6o83naZPK+MIaQFJ/FjtQ4pxOlKkVQhgG23o8C1ttDE?=
 =?iso-8859-1?Q?IAE3UOWW03NofVAQYeBQYoEJmdUyZFgrmv9VuiVyo0QbBrs5QNE5FhQu+b?=
 =?iso-8859-1?Q?Lz5RAbb4cy/vWUSOhto2APDI+BYeoU6TtoQueVQa00MwJ6bmlGffdcjmp0?=
 =?iso-8859-1?Q?jHgSoBHgLHMhYf+kItXNcB9GAL1m06BCXpHoivncM2lpz0JqR/3cqJFXXW?=
 =?iso-8859-1?Q?jnLSp+Rv6Zh5W2SGK4I5tjqC4F94ljnouZTDrGtXPpG0yUuRr0XiTGpJ+k?=
 =?iso-8859-1?Q?cjijMeLHBDXd39b8ctRQBkrw6b0zocNyiGBYDWqFhKzQkAqT5hXrWjjyn+?=
 =?iso-8859-1?Q?tLyJIxsPM5NzsFkpKx5yLMXlTwItjjtPBEHXvluJs2MGF0cQRPTq+YF5bl?=
 =?iso-8859-1?Q?6Qv8ML4h3EGPEqd9VX32uGsS1BaxEmhIN4QbW6EPJfeFWVJ70yNZaT2fQk?=
 =?iso-8859-1?Q?D0YiJUTJhhmaD9ehnQElPlpvBMskI64hadOtLga4rCBOaCPmBUn08WiQd3?=
 =?iso-8859-1?Q?ADV2TymIC6vpc8whFSMpKReJjqBIlDWKDXvDiubXobH9WWkalYHw7Ie2cC?=
 =?iso-8859-1?Q?0CT+YRNImHy49lmodZt5YrdWkizXNLur+ZafmUe61+HwGSEXi9VPv2A7Fx?=
 =?iso-8859-1?Q?qc2UheBWweDYhR4fiKSlD9UWF9o5hLyji0j2c4fyB27RFocjlIi7pvpyaU?=
 =?iso-8859-1?Q?MubKCc/u78pJ9AzV5uDrM2egF9M2Eume9Q5070DoQ4794QU/6NO2Octw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e775857e-1c0d-4d3f-b01c-08db7ef11847
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2023 13:50:16.2370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YZfkjIQy0bJViVqhaersac6EejbhQLmqrEdNA/PO1PAGoNCs9BN0/8K1exOaQHObeV8JkMcdta2VpSTaHYHfMKJtv4TZvkDYEvCaQ/hytVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7232
X-Proofpoint-GUID: K3VVhOGW78iusyf3R3eO_VbUGWpRJK7Q
X-Proofpoint-ORIG-GUID: K3VVhOGW78iusyf3R3eO_VbUGWpRJK7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_08,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 spamscore=0 impostorscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307070128
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

> Introduce a firewall framework that offers to firewall consumers differen=
t
> firewall services such as the ability to check their access rights agains=
t
> their firewall controller(s).
>
> The firewall framework offers a generic API that is defined in firewall
> controllers drivers to best fit the specificity of each firewall.
>
> There are various types of firewalls:
> -Peripheral firewalls that filter accesses to peripherals
> -Memory firewalls that filter accesses to memories or memory regions
> -Resource firewalls that filter accesses to internal resources such as
> reset and clock controllers
>
> A firewall controller must be probed at arch_initcall level and register
> to the framework so that consumers can use their services.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  MAINTAINERS                               |   5 +
>  arch/arm64/Kconfig.platforms              |   1 +
>  drivers/bus/Kconfig                       |  10 +
>  drivers/bus/Makefile                      |   1 +
>  drivers/bus/stm32_firewall.c              | 252 ++++++++++++++++++++++
>  drivers/bus/stm32_firewall.h              |  83 +++++++
>  include/linux/bus/stm32_firewall_device.h | 134 ++++++++++++
>  7 files changed, 486 insertions(+)
>  create mode 100644 drivers/bus/stm32_firewall.c
>  create mode 100644 drivers/bus/stm32_firewall.h
>  create mode 100644 include/linux/bus/stm32_firewall_device.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 41385f01fa98..fabf95ba9b86 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20123,6 +20123,11 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
>  F:	drivers/media/i2c/st-mipid02.c
> =20
> +ST STM32 FIREWALL
> +M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
> +S:	Maintained
> +F:	drivers/bus/stm32_firewall.c
> +
>  ST STM32 I2C/SMBUS DRIVER
>  M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
>  M:	Alain Volmat <alain.volmat@foss.st.com>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 6069120199bb..5a46e90f1e4e 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -293,6 +293,7 @@ config ARCH_STM32
>  	select ARM_SMC_MBOX
>  	select ARM_SCMI_PROTOCOL
>  	select COMMON_CLK_SCMI
> +	select STM32_FIREWALL
>  	help
>  	  This enables support for ARMv8 based STMicroelectronics
>  	  STM32 family, including:
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index fcfa280df98a..4d54a7ea52b2 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -163,6 +163,16 @@ config QCOM_SSC_BLOCK_BUS
>  	  i2c/spi/uart controllers, a hexagon core, and a clock controller
>  	  which provides clocks for the above.
> =20
> +config STM32_FIREWALL
> +	bool "STM32 Firewall framework"
> +	depends on ARCH_STM32
> +	default MACH_STM32MP157 || MACH_STM32MP13 || MACH_STM32MP25
> +	help
> +	  Say y to enable firewall framework and its services. Firewall
> +	  controllers will be able to register to the framework. Firewall
> +	  controllers must be initialized and register to the firewall framewor=
k
> +	  at arch_initcall level.
> +
>  config SUN50I_DE2_BUS
>  	bool "Allwinner A64 DE2 Bus Driver"
>  	  default ARM64
> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> index d90eed189a65..fc0511450ec2 100644
> --- a/drivers/bus/Makefile
> +++ b/drivers/bus/Makefile
> @@ -26,6 +26,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+=3D omap_l3_smx.o omap=
_l3_noc.o
>  obj-$(CONFIG_OMAP_OCP2SCP)	+=3D omap-ocp2scp.o
>  obj-$(CONFIG_QCOM_EBI2)		+=3D qcom-ebi2.o
>  obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+=3D qcom-ssc-block-bus.o
> +obj-$(CONFIG_STM32_FIREWALL)	+=3D stm32_firewall.o
>  obj-$(CONFIG_SUN50I_DE2_BUS)	+=3D sun50i-de2.o
>  obj-$(CONFIG_SUNXI_RSB)		+=3D sunxi-rsb.o
>  obj-$(CONFIG_OF)		+=3D simple-pm-bus.o
> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
> new file mode 100644
> index 000000000000..510db5bc6eaf
> --- /dev/null
> +++ b/drivers/bus/stm32_firewall.c
> @@ -0,0 +1,252 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/bus/stm32_firewall_device.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +#include "stm32_firewall.h"
> +
> +/* Corresponds to STM32_FIREWALL_MAX_EXTRA_ARGS + firewall controller re=
ference + firewall ID */
> +#define STM32_FIREWALL_MAX_ARGS		(STM32_FIREWALL_MAX_EXTRA_ARGS + 2)
> +
> +static LIST_HEAD(firewall_controller_list);
> +static DEFINE_MUTEX(firewall_controller_list_lock);
> +
> +static int stm32_firewall_get_id(struct device_node *np, u32 *id)
> +{
> +	u32 feature_domain_cell[2];
> +
> +	/* Get property from device node */
> +	if (of_property_read_u32_array(np, "feature-domains",
> +				       feature_domain_cell,
> +				       ARRAY_SIZE(feature_domain_cell))) {
> +		pr_err("Unable to find get firewall ID property\n");
> +		return -ENODEV;
> +	}
> +
> +	*id =3D feature_domain_cell[1];
> +
> +	return 0;
> +}
> +
> +/* Firewall device API */
> +
> +int stm32_firewall_get_firewall(struct device_node *np,
> +				struct stm32_firewall *firewall)
> +{
> +	struct stm32_firewall_controller *ctrl;
> +	struct of_phandle_args args;
> +	u32 controller_phandle;
> +	bool match =3D false;
> +	size_t i;
> +	int err;
> +
> +	if (!firewall)
> +		return -EINVAL;
> +
> +	/* The controller phandle is always the first argument of the feature-d=
omains property. */
> +	err =3D of_property_read_u32(np, "feature-domains", &controller_phandle=
);
> +	if (err) {
> +		pr_err("Unable to get feature-domains property for node %s\n", np->ful=
l_name);
> +		return err;
> +	}
> +
> +	/* Parse property with phandle parsed out */
> +	err =3D of_parse_phandle_with_args(np, "feature-domains", "#feature-dom=
ain-cells", 0, &args);
> +	if (err) {
> +		pr_err("Unable to read feature-domains arguments for node %s\n", np->f=
ull_name);
> +		return err;
> +	}
> +
> +	/* The phandle is parsed out */
> +	if (args.args_count > STM32_FIREWALL_MAX_ARGS - 1)
> +		return -EINVAL;
> +
> +	of_node_put(np);
> +
> +	/* Check if the parsed phandle corresponds to a registered firewall con=
troller */
> +	mutex_lock(&firewall_controller_list_lock);
> +	list_for_each_entry(ctrl, &firewall_controller_list, entry) {
> +		if (ctrl->dev->of_node->phandle =3D=3D controller_phandle) {
> +			match =3D true;
> +			firewall->firewall_ctrl =3D ctrl;
> +			break;
> +		}
> +	}
> +	mutex_unlock(&firewall_controller_list_lock);
> +	if (!match) {
> +		firewall->firewall_ctrl =3D NULL;
> +		pr_err("No firewall controller registered for %s\n", np->full_name);
> +		return -ENODEV;
> +	}
> +
> +	/*
> +	 * The firewall ID is always the second argument of the feature-domains=
 property.
> +	 * The first argument is already parsed out, so args.args[0] is the sec=
ond argument.
> +	 */
> +	firewall->firewall_id =3D args.args[0];
> +
> +	/* Extra args start at the third argument */
> +	for (i =3D 0; i < args.args_count; i++)
> +		firewall->extra_args[i] =3D args.args[i + 1];
> +
> +	/* Remove the firewall ID arg that is not an extra argument */
> +	if (args.args_count >=3D 1)
> +		firewall->extra_args_size =3D args.args_count - 1;

As I can see you support some extra args, that can be provided in the
feature-domain property. But in the binding description I see maxItems:
2. I beliewe this should be highlighted in bindings description.

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(stm32_firewall_get_firewall);
> +
> +int stm32_firewall_grant_access(struct stm32_firewall *firewall)
> +{
> +	struct stm32_firewall_controller *firewall_controller;
> +
> +	if (!firewall || firewall->firewall_id =3D=3D U32_MAX)
> +		return -EINVAL;
> +
> +	firewall_controller =3D firewall->firewall_ctrl;
> +
> +	if (!firewall_controller)
> +		return -ENODEV;
> +
> +	return firewall_controller->grant_access(firewall_controller, firewall-=
>firewall_id);
> +}
> +EXPORT_SYMBOL_GPL(stm32_firewall_grant_access);
> +
> +int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u=
32 subsystem_id)
> +{
> +	struct stm32_firewall_controller *firewall_controller;
> +
> +	if (!firewall || subsystem_id =3D=3D U32_MAX || firewall->firewall_id =
=3D=3D U32_MAX)
> +		return -EINVAL;
> +
> +	firewall_controller =3D firewall->firewall_ctrl;
> +
> +	if (!firewall_controller)
> +		return -ENODEV;
> +
> +	return firewall_controller->grant_access(firewall_controller, subsystem=
_id);
> +}
> +EXPORT_SYMBOL_GPL(stm32_firewall_grant_access_by_id);
> +
> +void stm32_firewall_release_access(struct stm32_firewall *firewall)
> +{
> +	struct stm32_firewall_controller *firewall_controller;
> +
> +	if (!firewall || firewall->firewall_id =3D=3D U32_MAX) {
> +		pr_err("Incorrect arguments when releasing a firewall access");
> +		return;
> +	}
> +
> +	firewall_controller =3D firewall->firewall_ctrl;
> +
> +	if (!firewall_controller) {
> +		pr_debug("No firewall controller to release");
> +		return;
> +	}
> +
> +	firewall_controller->release_access(firewall_controller, firewall->fire=
wall_id);
> +}
> +EXPORT_SYMBOL_GPL(stm32_firewall_release_access);
> +
> +void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall=
, u32 subsystem_id)
> +{
> +	struct stm32_firewall_controller *firewall_controller;
> +
> +	if (!firewall || subsystem_id =3D=3D U32_MAX || firewall->firewall_id =
=3D=3D U32_MAX) {
> +		pr_err("Incorrect arguments when releasing a firewall access");
> +		return;
> +	}
> +
> +	firewall_controller =3D firewall->firewall_ctrl;
> +
> +	if (!firewall_controller) {
> +		pr_debug("No firewall controller to release");
> +		return;
> +	}
> +
> +	firewall_controller->release_access(firewall_controller, subsystem_id);
> +}
> +EXPORT_SYMBOL_GPL(stm32_firewall_release_access_by_id);
> +
> +/* Firewall controller API */
> +
> +int stm32_firewall_controller_register(struct stm32_firewall_controller =
*firewall_controller)
> +{
> +	pr_info("Registering firewall controller %s", dev_name(firewall_control=
ler->dev));
> +
> +	if (!firewall_controller)
> +		return -ENODEV;
> +
> +	mutex_lock(&firewall_controller_list_lock);
> +	list_add_tail(&firewall_controller->entry, &firewall_controller_list);
> +	mutex_unlock(&firewall_controller_list_lock);
> +
> +	return 0;
> +
> +}
> +
> +void stm32_firewall_controller_unregister(struct stm32_firewall_controll=
er *firewall_controller)
> +{
> +	struct stm32_firewall_controller *ctrl, *tmp;
> +	bool controller_removed =3D false;
> +
> +	if (!firewall_controller) {
> +		pr_debug("Null reference while unregistering firewall controller");
> +		return;
> +	}
> +
> +	mutex_lock(&firewall_controller_list_lock);
> +	list_for_each_entry_safe(ctrl, tmp, &firewall_controller_list, entry) {
> +		if (ctrl =3D=3D firewall_controller) {
> +			controller_removed =3D true;
> +			list_del_init(&ctrl->entry);
> +			break;
> +		}
> +	}
IIUC list_for_each_entry_safe protects you from removing node during
loop. But all list operations are done under
firewall_controller_list_lock mutex. I beliewe there is no need for
_safe call under the mutex because removing node during loop is
impossible. I think it worth investigation if it's safe to use
list_for_each_entry_safe without lock.
> +	mutex_unlock(&firewall_controller_list_lock);
> +
> +	if (!controller_removed)
> +		pr_debug("There was no firewall controller named %s to unregister",
> +			 dev_name(firewall_controller->dev));
> +}
> +
> +void stm32_firewall_populate_bus(struct stm32_firewall_controller *firew=
all_controller)
> +{
> +	struct device_node *child;
> +	struct device *parent;
> +	u32 firewall_id;
> +	int err;
> +
> +	parent =3D firewall_controller->dev;
> +
> +	dev_dbg(parent, "Populating %s system bus\n", dev_name(firewall_control=
ler->dev));
> +
> +	for_each_available_child_of_node(dev_of_node(parent), child) {
> +		err =3D stm32_firewall_get_id(child, &firewall_id);
> +		if (err < 0 ||
> +		    firewall_controller->grant_access(firewall_controller, firewall_id=
)) {
> +			/*
> +			 * Peripheral access not allowed or not defined.
> +			 * Mark the node as populated so platform bus won't probe it
> +			 */
> +			of_node_set_flag(child, OF_POPULATED);
> +			dev_err(parent, "%s: Device driver will not be probed\n",
> +				child->full_name);
> +		}
> +	}
> +}
> diff --git a/drivers/bus/stm32_firewall.h b/drivers/bus/stm32_firewall.h
> new file mode 100644
> index 000000000000..8d92e8c1ab77
> --- /dev/null
> +++ b/drivers/bus/stm32_firewall.h
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
> + */
> +
> +#ifndef _STM32_FIREWALL_H
> +#define _STM32_FIREWALL_H
> +
> +#include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +/**
> + * STM32_PERIPHERAL_FIREWALL:		This type of firewall protects peripheral=
s

Intendation

> + * STM32_MEMORY_FIREWALL:		This type of firewall protects memories/subse=
ts of memory
> + *					zones
> + * STM32_RESOURCE_FIREWALL:		This type of firewall protects internal res=
ources
> + * STM32_NOTYPE_FIREWALL:		Undefined firewall type
> + */
> +
> +#define STM32_PERIPHERAL_FIREWALL	BIT(1)

Intendation

> +#define STM32_MEMORY_FIREWALL		BIT(2)
> +#define STM32_RESOURCE_FIREWALL		BIT(3)
> +#define STM32_NOTYPE_FIREWALL		BIT(4)
> +
> +/**
> + * struct stm32_firewall_controller - Information on firewall controller=
 supplying services
> + *
> + * @name			Name of the firewall controller
> + * @dev				Device reference of the firewall controller

Intendation

> + * @mmio			Base address of the firewall controller
> + * @entry			List entry of the firewall controller list
> + * @type			Type of firewall
> + * @max_entries			Number of entries covered by the firewall
Intendation

> + * @grant_access		Callback used to grant access for a device access agai=
nst a
> + *				firewall controller
> + * @release_access		Callback used to release resources taken by a device=
 when access was
> + *				granted
> + * @grant_memory_range_access	Callback used to grant access for a device=
 to a given memory region
> + */
> +struct stm32_firewall_controller {
> +	const char *name;
> +	struct device *dev;
> +	void __iomem *mmio;
> +	struct list_head entry;
> +	unsigned int type;
> +	unsigned int max_entries;
> +
> +	int (*grant_access)(struct stm32_firewall_controller *ctrl, u32 id);
> +	void (*release_access)(struct stm32_firewall_controller *ctrl, u32 id);
> +	int (*grant_memory_range_access)(struct stm32_firewall_controller *ctrl=
, phys_addr_t paddr,
> +					 size_t size);
> +};
> +
> +/**
> + * int stm32_firewall_controller_register - Register a firewall controll=
er to the STM32 firewall
> + *					    framework
> + * @firewall_controller		Firewall controller to register
> + *
> + * Returns 0 in case of success or -ENODEV if no controller was given.
> + */
> +int stm32_firewall_controller_register(struct stm32_firewall_controller =
*firewall_controller);
> +
> +/**
> + * int stm32_firewall_controller_unregister - Unregister a firewall cont=
roller from the STM32
> + *					      firewall framework
> + * @firewall_controller		Firewall controller to unregister
> + */
> +void stm32_firewall_controller_unregister(struct stm32_firewall_controll=
er *firewall_controller);
> +
> +/**
> + * stm32_firewall_populate_bus - Populate device tree nodes that have a =
correct firewall
> + *				 configuration. This is used at boot-time only, as a sanity check
> + *				 between device tree and firewalls hardware configurations to
> + *				 prevent a kernel crash when a device driver is not granted access
> + *
> + * @firewall_controller		Firewall controller which nodes will be populat=
ed or not
> + */
> +void stm32_firewall_populate_bus(struct stm32_firewall_controller *firew=
all_controller);
> +
> +#endif /* _STM32_FIREWALL_H */
> diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bu=
s/stm32_firewall_device.h
> new file mode 100644
> index 000000000000..ccaecea7fc6c
> --- /dev/null
> +++ b/include/linux/bus/stm32_firewall_device.h
> @@ -0,0 +1,134 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
> + */
> +
> +#ifndef STM32_FIREWALL_DEVICE_H
> +#define STM32_FIREWALL_DEVICE_H
> +
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +#define STM32_FIREWALL_MAX_EXTRA_ARGS		5

It's not clear to me why it's 5. Comment above sais this is
implementation defined. Maybe this parameter can be configurable?

> +
> +/* Opaque reference to stm32_firewall_controller */
> +struct stm32_firewall_controller;
> +
> +/**
> + * stm32_firewall - Information on a device's firewall. Each device can =
have more than one firewall.
> + *
> + * @firewall_ctrl		Pointer referencing a firewall controller of the devi=
ce. It is
> + *				opaque so a device cannot manipulate the controller's ops or acces=
s
> + *				the controller's data
> + * @extra_args			Extra arguments that are implementation dependent
> + * @extra_args_size		Number of extra arguments
> + * @firewall_id			Firewall ID associated the device for this firewall co=
ntroller
> + */
> +struct stm32_firewall {
> +	struct stm32_firewall_controller *firewall_ctrl;
> +	u32 extra_args[STM32_FIREWALL_MAX_EXTRA_ARGS];
> +	size_t extra_args_size;
> +	u32 firewall_id;
> +};
> +
> +#if IS_ENABLED(CONFIG_STM32_FIREWALL)
> +/**
> + * stm32_firewall_get_firewall - Get the firewall(s) associated to given=
 device.
> + *				 The firewall controller reference is always the first argument
> + *				 of the feature-domains property.
> + *				 The firewall ID is always the second argument of the
> + *				 feature-domains property.
> + *
> + * @np				Device node to parse

Intendation

> + * @firewall			Resulting firewall reference(s)
> + *
> + * Returns 0 on success, -ENODEV if there's no match with a firewall con=
troller or appropriate errno
> + * code if error occurred.
> + */
> +int stm32_firewall_get_firewall(struct device_node *np, struct stm32_fir=
ewall *firewall);
> +
> +/**
> + * stm32_firewall_grant_access - Request firewall access rights and gran=
t access.
> + *
> + * @firewall			Firewall reference containing the ID to check against its=
 firewall
> + *				controller
> + *
> + * Returns 0 if access is granted, -EACCES if access is denied, -ENODEV =
if firewall is null or
> + * appropriate errno code if error occurred
> + */
> +int stm32_firewall_grant_access(struct stm32_firewall *firewall);
> +
> +/**
> + * stm32_firewall_release_access - Release access granted from a call to
> + *				   stm32_firewall_grant_access().
> + *
> + * @firewall			Firewall reference containing the ID to check against its=
 firewall
> + *				controller
> + */
> +void stm32_firewall_release_access(struct stm32_firewall *firewall);
> +
> +/**
> + * stm32_firewall_grant_access_by_id - Request firewall access rights of=
 a given device
> + *				       based on a specific firewall ID
> + *
> + * Warnings:
> + * There is no way to ensure that the given ID will correspond to the fi=
rewall referenced in the
> + * device node if the ID did not come from stm32_firewall_get_firewall()=
. In that case, this
> + * function must be used with caution.
> + * This function should be used for subsystem resources that do not have=
 the same firewall ID
> + * as their parent.
> + * U32_MAX is an invalid ID.
> + *
> + * @firewall			Firewall reference containing the firewall controller
> + * @subsystem_id		Firewall ID of the subsystem resource
> + *
> + * Returns 0 if access is granted, -EACCES if access is denied, -ENODEV =
if firewall is null or
> + * appropriate errno code if error occurred
> + */
> +int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u=
32 subsystem_id);

Can we store all registered IDs that were found by populate_bus
functio, or is it expected when this function was called before
populate_bus call?

> +
> +/**
> + * stm32_firewall_release_access_by_id - Release access granted from a c=
all to
> + *					 stm32_firewall_grant_access_by_id().
> + *
> + * Warnings:
> + * There is no way to ensure that the given ID will correspond to the fi=
rewall referenced in the
> + * device node if the ID did not come from stm32_firewall_get_firewall()=
. In that case, this
> + * function must be used with caution.
> + * This function should be used for subsystem resources that do not have=
 the same firewall ID
> + * as their parent.
> + * U32_MAX is an invalid ID.
> + *
> + * @firewall			Firewall reference containing the firewall controller
> + * @subsystem_id		Firewall ID of the subsystem resource
> + */
> +void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall=
, u32 subsystem_id);
> +
> +#else /* CONFIG_STM32_FIREWALL */
> +
> +int stm32_firewall_get_firewall(struct device_node *np, struct stm32_fir=
ewall *firewall)
> +{
> +	return -ENODEV;
> +}
> +
> +int stm32_firewall_grant_access(struct stm32_firewall *firewall)
> +{
> +	return -ENODEV;
> +}
> +
> +void stm32_firewall_release_access(struct stm32_firewall *firewall)
> +{
> +}
> +
> +int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u=
32 subsystem_id)
> +{
> +	return -ENODEV;
> +}
> +
> +void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall=
, u32 subsystem_id)
> +{
> +}
> +
> +#endif /* CONFIG_STM32_FIREWALL */
> +#endif /* STM32_FIREWALL_DEVICE_H */


--=20
Thanks,
Oleksii=
