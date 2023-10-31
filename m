Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 216F77DC63C
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 07:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233125AbjJaF6A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 01:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232876AbjJaF57 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 01:57:59 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2047.outbound.protection.outlook.com [40.107.255.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83353E4;
        Mon, 30 Oct 2023 22:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mk/ueW8XtBXwAAaBm/sLKT+G6oShctKzI36U0dwwQgQ7GtFPa5Dz1WoDfTxexSVqrarzzxWGEtaCwiXWGMRSf8PtWlMjTo4wbjCuRrlwNcG+xeuVb69ecbeLsuXR31J+ASdGSPQsC/U7PSR43G69n1hV6w7+rFTHjyV9jxAjES2ESaebZTXoNiYFUOWEJgZfWSwb1mu6gmzmNAY3c7pWY+ny9OjWJ8N/JoydNORZRlDW4+f7BKDjwxRsupFKuwEf388IlGbBNaLyzEduXQSpXMjMmOL/ZMfHiHHuCSs61mxRoVCtzldWsdSJq5sQrlI1O2RQdjdNpTM8SJbf6eiB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2V8fr0tEP/IDXiPWiWH5QoUyOHNP8m19QmH+B302eA=;
 b=mXBfoRmb1uzLl4BMQyYS24W8btCl0QSuYKAXTYVBvibOkaCLNW5lNX7QVxAODDorsrhgS0aAYqu0ElsxETGJ1uc9CKuptuKqzf7w4Ifc9WCFR7AhOufi3EbwjKV/LApWLP0Y1Awc+Gk6n+iqx7u9W4IhA6WuFcdS5jf4AiJPC6y2Ey0zpV8FYttzWjrAzFP79CY0H9N0PgE6XAp+wTJ6gh5MuXax3j7xGx/BIrSn22KXgbfNa5iF0ms6RIy7BpSOkYlg3tMHoVKVR3LmU8ttbqGfB6S6mAe9V4TFnGgSNA47Z8FutCDs1vlMO6yofLTf1zpy6e4Y1BgesYcgeKauCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2V8fr0tEP/IDXiPWiWH5QoUyOHNP8m19QmH+B302eA=;
 b=znZomdF3OISQ1oSn0Zy6R7I+MnlK88s0Ftzszo09ki1AqpmGouNv6xKk8i0oHusSBIurS5CErplOddc051m4JnIhfPJwuOdgqhHxcGz9xtc77Yr0RkmNDTeIeeUBEtob2Pnm0ZlrN67Mr8F2mqHKAym5+OC62i9Ey3S+9eVz5dVd2C1rn8B3vy3CW9vJBNnwI8pIyIHmJpxLTo1OSazrRCVpkSgsuX6nD0W/QQ0LtTx5v1KYmhr44/kILcTUkqrq3Lzx/Eux/GbSCjAXoAyXSWtdSgZc5dG9eRYC3HqtZpwhmH49MvC/SkbCNsDr35HybIEP9r/Zw8JqOL72qDQltA==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by SEYPR04MB7691.apcprd04.prod.outlook.com (2603:1096:101:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Tue, 31 Oct
 2023 05:57:52 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::4c7a:8fd8:1527:9287]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::4c7a:8fd8:1527:9287%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 05:57:52 +0000
From:   Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Conor Dooley <conor@kernel.org>,
        Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
CC:     "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Thread-Topic: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Thread-Index: AQHaB+SV8Z0lWuQfqk2pb+fPvv8kdLBcIN+AgAAMSACAB0EC0A==
Date:   Tue, 31 Oct 2023 05:57:52 +0000
Message-ID: <SG2PR04MB55436CC0674B70C6A2496AE3A1A0A@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231026081514.3610343-2-Delphine_CC_Chiu@Wiwynn.com>
 <20231026-dicing-crispy-a10af575d3e5@spud>
 <fffa4330-8d01-8498-4c5f-772ebf2a6b5a@roeck-us.net>
In-Reply-To: <fffa4330-8d01-8498-4c5f-772ebf2a6b5a@roeck-us.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|SEYPR04MB7691:EE_
x-ms-office365-filtering-correlation-id: 5625298c-c20c-47d4-9798-08dbd9d651df
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nyEyi0Sh7kjErOqq0UbXLGy1RKeP4/Faewcl6nAcbwt2sy1ni5uS9lFJsHcmewSvxJTUNOjjZBhPVaCP9+WM1Cyke00YkeGzV2M//fNRo+K7QNc3pAVCLWabxCifFeDhXfYU+wd5XMW7dzhusB1ET02l0EBVQvyCNKfyrFq6jFfqgFmQnMqqua6b9Gec9pyIh7yVtMszIoUhHhv/rZ19ls7SP19y+os6XRlMTwteZJenk36vD/rgaCmsVZ/RBWmk8fnEcEzEfHqEBfF0pQoBLNjJc747tqY459yh1WVNYydZJjeqj+//jlYBsmFgNxetedNx8UTDXvkdVrKmGfTdh1IRY+wWkcBZFM29YcVdvW4FPDRT3To+hluKRT1lfDTLBw96nUsH6MFSY2kRW6gDYmN5BJntgtUf6bbCmn8tbS90RkyLRclNJ2FjJzRbUxWrHfanXS4zEF5k0uIRjREaSM9MkhAF3Eus1DlcACP/Icx2UAeipqun2jUPdCHKOvLFY6xQCweIit1YafHKrxvOjobnaUjH+h1m3dLjeFJuLWM5sAZlaCFh2MGX78uj18DDS8C2D9qw4fc2nrHSuSzFo4j5/+07EawcObD7nUs8JcT4iFAEsszxWEyuLKyjfSiM70j4OuNy1lPwws7Ne9smfg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(230173577357003)(230273577357003)(64100799003)(1800799009)(186009)(451199024)(316002)(55016003)(2906002)(7416002)(41300700001)(38070700009)(52536014)(8936002)(4326008)(86362001)(8676002)(33656002)(71200400001)(38100700002)(76116006)(66476007)(66446008)(122000001)(54906003)(66556008)(64756008)(66946007)(5660300002)(83380400001)(110136005)(9686003)(26005)(45080400002)(478600001)(53546011)(7696005)(966005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iqKnSRaH5F1XIP5igLGehyuGcnrLUGfAxXciMrHXwlmHKX2HeBYlKbvYbqUX?=
 =?us-ascii?Q?XUCMyNs5DLpE98tLMmV1Gwk3NabAvcv9CaDvugL4aMFFdETaIgqb39CDnfHC?=
 =?us-ascii?Q?1XiL+PlEuEewusSGMqSWSobsbS4yUxqNd9G3eOtk4BPFYrTJACPg4RpavIhf?=
 =?us-ascii?Q?7xxLwFSk/JmUZIrY11e31Kfnf/fp17pRgTPjDZCTJiaGokDNSQWbU1geijJa?=
 =?us-ascii?Q?6q/QjFNykQCK9VLRRZex5Y8jvLbItaykxZiP9t0+5wf7MeqXBzqNSVx44Kuy?=
 =?us-ascii?Q?yyXcnUcIhVa+QzgdTVPZqFyhagEapL1d/fy2jHL8dEcCGVQ671zp1dO2fhM1?=
 =?us-ascii?Q?+rsiUr3xW6wsKvLJskVcUWwslJTMxc4qul2p24xgHhNMAcv9ra0ivwRDrD0G?=
 =?us-ascii?Q?8jre/NxOQ2lqXWnplPqIKHcQjUidjlMX0+MzUcueqAOAy/Jqpzt4gh7bfGBA?=
 =?us-ascii?Q?5n8kwU6JsIfmSyGHVglQfybFY3ZdEUbFIuH9aPeCvKBUxVUTtihSbgWn4fKX?=
 =?us-ascii?Q?12O5wRIBpWc16oLp21ddlkOiswO3K9L9Upx11udRKidsK+pHqtYiu5eC+JL2?=
 =?us-ascii?Q?ftQESxb+rI/eXh3H+FvAH+CDNxmjVJVbnZsRSZm8ktDm+F6sfXEbVbOWe/3Z?=
 =?us-ascii?Q?+cWOReHZvmN09eR+mnyTz+yE6cY9iuxxtWjqjExOP11ruKL386VfWS5TPKl+?=
 =?us-ascii?Q?Vqk/iRDJiyjDTUlM3O5yqCR2Nd7Q5Iihy1qiC8cN3ZcMlKPrtGmmq7KvLlr9?=
 =?us-ascii?Q?OZQTfCk7qcnF6wnY6LXH2PTbcUpN/tsLaj//wBJ5IVxsjaq2SVRoqAb97SHg?=
 =?us-ascii?Q?/QJNnH2P5H0Bxb4ohxquunvQmNnt0iiK3XlEpdlBSCrNmdCP359wvHirH/wL?=
 =?us-ascii?Q?BnHECwJQ8AK5b/EnGpMj3DC6AWVHT1joxAoSv9/TVBli2VTwE0DKpcIsMMFK?=
 =?us-ascii?Q?3Fgq+vHG88SZrKHOPHAjT/Rjq1J/DRKR5Klb0rW1SEDuI/GL0ZUqQ5/LXCTz?=
 =?us-ascii?Q?7RQ3dMCE11DdlQe6sUwkQcMNb26y2/gjr7MrkWoYe9PeZcGsKNsAehUNhG/J?=
 =?us-ascii?Q?R+bKY29y5efh2FZBU8W5jCLI3DbQV1fC3j/y2WI8BssBw841kLCNAFSRuluE?=
 =?us-ascii?Q?3Ivyok1P4mbiGxUTGWvjYYFnFFKRaDroet8NnXqd22qMYLqj3yrCFPJonTmB?=
 =?us-ascii?Q?BL7SuH/fPTMsqXwhKDJ4x7WVnsjujiADCa1v6xpa5b7ShNOQZvzfxVxUUC17?=
 =?us-ascii?Q?3MTwuoq2ne0n+uWNBSs4AzNbXrjPHk7s+C3Tw6uROFab43rOgdGj2tJ9MW9a?=
 =?us-ascii?Q?VQXAOj1TzG0w+e0NAA4kIxSmBI1NJpkAzvOYLsClS8wW1sbnDHmJnG05+z6s?=
 =?us-ascii?Q?r7wdIk1aLs4S/W5Jgkae/bVuYsisIw5kNcCg0TUicdMVd0YxzWIn5PwJjGU7?=
 =?us-ascii?Q?99v08Xu2nl9xCIfkM1eqG+WKeZMwhr26r1rP8Y17Ee+zpPJPwahtFd8InQFY?=
 =?us-ascii?Q?AB2Bp7R2Ptn+YMCSOBqZi5J12Pq6W5FOwPpoSMCKT4hUT+sxwiIy334hBALZ?=
 =?us-ascii?Q?jP+K2g5SJVQW+i2wpGLj/XRWMsTite2ojS2xB1ZJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5625298c-c20c-47d4-9798-08dbd9d651df
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 05:57:52.2875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PBZN+m+Pn6Q97fJ8fHWBVSMSsw2CFArsQz25+vKgD/VmTSHnPQ+I/rZhcpY1jPxvznICUIH2CQv2ekjtv/CqjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7691
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Thursday, October 26, 2023 11:10 PM
> To: Conor Dooley <conor@kernel.org>; Delphine_CC_Chiu/WYHQ/Wiwynn
> <Delphine_CC_Chiu@wiwynn.com>
> Cc: patrick@stwcx.xyz; Jean Delvare <jdelvare@suse.com>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
> Jonathan Corbet <corbet@lwn.net>; linux-i2c@vger.kernel.org;
> linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org; linux-doc@vger.kernel.org
> Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
> bindings
>
>   Security Reminder: Please be aware that this email is sent by an extern=
al
> sender.
>
> On 10/26/23 07:25, Conor Dooley wrote:
> > Hey,
> >
> > On Thu, Oct 26, 2023 at 04:15:11PM +0800, Delphine CC Chiu wrote:
> >> Add a device tree bindings for ltc4286 driver.
> >
> > Bindings are for devices, not for drivers.
> >
> >>
> >> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> >>
> >> Changelog:
> >>    v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
> >>       - Add type for adi,vrange-select-25p6
> >>       - Revise rsense-micro-ohms to shunt-resistor-micro-ohms
> >> ---
> >>   .../bindings/hwmon/lltc,ltc4286.yaml          | 50
> +++++++++++++++++++
> >>   MAINTAINERS                                   | 10 ++++
> >>   2 files changed, 60 insertions(+)
> >>   create mode 100644
> >> Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> >>
> >> diff --git
> >> a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> >> b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> >> new file mode 100644
> >> index 000000000000..17022de657bb
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> >> @@ -0,0 +1,50 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> >> +---
> >> +$id:
> >> +http://dev/
> >>
> +icetree.org%2Fschemas%2Fhwmon%2Flltc%2Cltc4286.yaml%23&data=3D05%7C
> 01%
> >>
> +7CWayne_SC_Liu%40wiwynn.com%7Cb250e206c9ef48fbc1c108dbd6359e51
> %7Cda6
> >>
> +e0628fc834caf9dd273061cbab167%7C0%7C0%7C638339298041650948%7CU
> nknown
> >>
> +%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW
> wiL
> >>
> +CJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DgGQEDl33zRIJbfbinu2%2Bi2cC
> Ay6y0o
> >> +DSLzBpLL7hA%2F8%3D&reserved=3D0
> >> +$schema:
> >> +http://dev/
> >>
> +icetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=3D05%7C01%7CWayne_S
> C_Li
> >>
> +u%40wiwynn.com%7Cb250e206c9ef48fbc1c108dbd6359e51%7Cda6e0628fc8
> 34caf
> >>
> +9dd273061cbab167%7C0%7C0%7C638339298041650948%7CUnknown%7CT
> WFpbGZsb3
> >>
> +d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> %3D
> >>
> +%7C3000%7C%7C%7C&sdata=3Dnl1IM1HpYptsJOHfiuXtKFmD%2FVlGMCW1IkoK
> HYco0sk
> >> +%3D&reserved=3D0
> >> +
> >> +title: LTC4286 power monitors
> >> +
> >> +maintainers:
> >> +  - Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - lltc,ltc4286
> >> +      - lltc,ltc4287
> >
> > I don't recall seeing an answer to Guenter about this ltc4287 device:
> > https://lore/
> > .kernel.org%2Fall%2F22f6364c-611c-ffb6-451c-9ddc20418d0a%40roeck-us.n
> e
> >
> t%2F&data=3D05%7C01%7CWayne_SC_Liu%40wiwynn.com%7Cb250e206c9ef48f
> bc1c108
> >
> dbd6359e51%7Cda6e0628fc834caf9dd273061cbab167%7C0%7C0%7C6383392
> 9804165
> >
> 0948%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz
> IiLCJBT
> >
> iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DOpwfD3rBS0vQBF
> jUhszrMg
> > 4mq581jU7gx54Ln8V3gUA%3D&reserved=3D0
> >
>
> At least the chip does officially exist now, and a datasheet is available=
.
>
> https://www.ana/
> log.com%2Fen%2Fproducts%2Fltc4287.html&data=3D05%7C01%7CWayne_SC_Li
> u%40wiwynn.com%7Cb250e206c9ef48fbc1c108dbd6359e51%7Cda6e0628fc83
> 4caf9dd273061cbab167%7C0%7C0%7C638339298041650948%7CUnknown%7
> CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> CJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DCwT16Uipl8RymnFZ1WuBJzUJv
> fLCKdK3VlTcTBN0xxk%3D&reserved=3D0
>
> It shows that coefficients for the telemetry commands are different, mean=
ing
> that indeed both chips need to be explicitly referenced in the properties
> description (and handled in the driver, which proves my point of needing =
a
> datasheet before accepting such a driver).
We will check the difference of coefficients for the telemetry commands wit=
h vendor.

>
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  adi,vrange-select-25p6:
> >> +    description:
> >> +      This property is a bool parameter to represent the
> >> +      voltage range is 25.6 or not for this chip.
> >
> > 25.6 what? Volts? microvolts?
> > What about Guenter's suggestion to name this so that it better matches
> > the other, similar properties?
> >
>
> I still would prefer one of the more common properties.
> I still prefer adi,vrange-high-enable.
>
> Guenter

