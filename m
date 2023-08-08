Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3735A7736CA
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Aug 2023 04:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbjHHCfi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Aug 2023 22:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjHHCfh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Aug 2023 22:35:37 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2048.outbound.protection.outlook.com [40.107.255.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B7F172A;
        Mon,  7 Aug 2023 19:35:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kt6Admzr68UvQTGMbqITfFCRx1vfyPPh8ASk/xiPG21WGWb7RrF+HLrrbOzxiunzFEIlSj9oTDtlmvMdr34u/Owz8hEknxAyIBNp6QKi8JG46VCvrtRmdclEIRmMnVBiFYTS113oaS9mQiEDAcQxFH+488bLPXnt5Fkmmn6C7XAuuNzF78DwSgsuC+tgfkt1zduj2vq/5ztHxWG9j2ZUkpNqcY/xtX2YCOxcqzasbmEcd7Kg3KbFC/Kx+3It8xjz3ECtbqJvs4G661pmACJnVd9DjE0sEIKAEJSDvDoCm9ZymrQ8YV7vHV0wlV2nLQ55PlhDOofiGxx1mDztvsUUFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjPH0KAouhb2NIocEFqGc6WvN1g4DLAOU7UxQEFC7uA=;
 b=NrWpSlKGPFJztsHWRCZptNmzhHFkbcxCZC5hcplY4A8GrkPr2LNwNa9b/b5ogj3IinkXZqAKyUnlFmTu2/6iet0zHYS1M3subo0TzqNoLkSVHHPRdB2OI8wtdlafS1jN3woYYkQ4h0vKYxZIPlXS5mm9eO6pmz459Y54KmT2leeEquBowtJlhwjJSwIw4MWtGdH3RSjDzrVhlPXd/J0NzvJb1kRdRVEDZdzqmq0TqLXVNpKtD6l7J2sidtJMulMzH6mBnwE7kRxuM+CEMvVvSvkg21mgOmm99SlPTS+wv6SeCr8ueVP88uatonId3QCLfTlWMCgJkiDL6PPS62unjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjPH0KAouhb2NIocEFqGc6WvN1g4DLAOU7UxQEFC7uA=;
 b=bpLcTpdcfNGbnwPIMZQKGPRodDb8e2dD/eeG1maWrcIJkXVv4kCfKweVHLNypAJKx9C3PYq/ArsnNt2KmxXGrW2/t4GdjtJft2lTFfO3o67ozEaFmbO67tjw3vfCO9PH0CheMw6UJcrD0D3kjedwDQacbC0xWlIP5K4tchil9+xgsrWhOabLwEwrrYBV80zvs+p4sQIWF5FW+BfVODh1+N0JE8lpwpR22qsX/87KY5ZdFD130OjapVYc+sYkjASxRuCQXG0/YY/FkY/twg49YmI4UntIznjghWgffmGSGZbV27T6GgC4VAu7JYLANNaU9gkr7yM/hG+sqevc57TaYA==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by SEZPR04MB6947.apcprd04.prod.outlook.com (2603:1096:101:e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 02:35:25 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::819:57b:cc1b:f5f0]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::819:57b:cc1b:f5f0%7]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 02:35:25 +0000
From:   Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To:     Rob Herring <robh@kernel.org>,
        Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
CC:     "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver bindings
Thread-Topic: [PATCH 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver bindings
Thread-Index: AQHZvhZd1wsVsRaNXkO6Clu94rA/A6/MRJWAgBN/aUA=
Date:   Tue, 8 Aug 2023 02:35:25 +0000
Message-ID: <SG2PR04MB55437853C9DDAE2DB6E51A79A10DA@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230724100514.1028061-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230726164401.GA1563534-robh@kernel.org>
In-Reply-To: <20230726164401.GA1563534-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|SEZPR04MB6947:EE_
x-ms-office365-filtering-correlation-id: 141cf1d8-00ab-4b9f-af5d-08db97b81ede
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1dO0bwFmaJk9xqFw12pN2RpMnLO9h0Mkm7Ls+XE2+Toi3uooZZvqFqzfIDuP53Qab6iIepqLk975M9Z+a2ILwa94LiBrr9RWZD07iRUU+xAKeD8ri9eLv5YYFUvmYXakQe6sPjBsVMzv2Fpo9eHYL67iYz3KP7LEhHeXwncs3/eP8K3PTMH19Rb+OHz4A7ZqcUnYnt1urhVb4CPGQBPbu8p5dcdnbWLxRA6RNvjOp+TWZ6KZiZGt8Ss96gTypmgijmTZoYVRshOjyOuJo3ca4F6BlMsyI2G5AXI2aJ9IfGm/gqHHTkVnMo++xJ/+wGAAz/ol/FebAKOpKe7w+TFG87gXhpP94cnQwtM516NWbfVkBif1S9Q+bWA+xB2txVOpCjQ2gUTlzEMYCZ+YKcLNIrcQ3R4KDaWzlbmcJgT9TPVQMCTn71GjrpSippJoT9Kdsin/dLBhMz2M4kWoi9HmvxtM654ORIeRz/1NnD5gNpbq1fMVcs55xpEFc+TUUdWYF6fsjl5ti4MjtfWSnRjz4xxFS4oF1ROYXmmI7jO84I2u3JXzlIw3WTg9XLelJny5mQ0CkviMQQKHFDXrIrnTU5NHucmxlySpYzh1tAMFcaldyn9hnh0babMFL5BCcQwneJFYNneoJgBjt1KMqktZGZR5A3u+mcGsnW6uRwxHmzjcvGPv4nNUihExjTnTwNOs
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(90011799007)(451199021)(90021799007)(1800799003)(186006)(9686003)(26005)(6506007)(55016003)(53546011)(110136005)(54906003)(38100700002)(5660300002)(7416002)(38070700005)(52536014)(86362001)(4326008)(2906002)(66556008)(76116006)(66476007)(64756008)(41300700001)(33656002)(66446008)(8676002)(316002)(8936002)(66946007)(71200400001)(7696005)(122000001)(478600001)(45080400002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VLg25m0IE718fac6KcIDaAQgSOVOpdzLaeBkL6ox0kLD55QJCxfPpx89JScx?=
 =?us-ascii?Q?04yjQC/DoRJX48CfJvqferdSuBTV9KlNREnoDzzjq1oJs7LyZkfhXtLrHA+D?=
 =?us-ascii?Q?VN4Kpded+qChuhxwNITPNa0VK47vupSQmPKZLgPtivFEQ1vjsxtqVFzJoCxs?=
 =?us-ascii?Q?3RHc7DuDE0MVyiDAquCTWfyS++2+VD6tzjkHtgq0QoG5fp487mr+IH+VcqVI?=
 =?us-ascii?Q?k2MaPFEXo0jGb+KZGQmbSvtkltxUR97kFdwuVyIKjvToAo9p7QMBiLQcJyXC?=
 =?us-ascii?Q?qmaWm0DTrL/bXikFHDhBXWDpt3jBbRBGC/1T06ues+vKddAQmuCph4vwXL3w?=
 =?us-ascii?Q?XZOfnTzyw9Vsu8NmcTsK+jOZGIE3XBAL9uta11sF1SKPJhFn8z3qK2MGxank?=
 =?us-ascii?Q?wVYrerQC+2Tf2cue/t/mznvtGDHUomYATA26tobkHqfeYnt0P/BTryPUoNyK?=
 =?us-ascii?Q?6WWoiaA+DJ57M1g+erhSmo/70g43CAo9wLjRR1AZbAzI4b9t5Ylddt1V1L32?=
 =?us-ascii?Q?zbKiZI8F9cpePS8SDjI8oFFfCkktJgtD2cz7noPJ1yvWrhAFWoFzCL6Aiu11?=
 =?us-ascii?Q?xZcg3GjL+RT2rMUQaKDrlfqQMirs0KunWxnNEBdir8reTGpPYWRWj/JOPXBL?=
 =?us-ascii?Q?y0ruXGCrEyCpI1wXWp8fFzRxhFzdpnBkhxmoAYb206j5tq1TYrrWwcE8IB75?=
 =?us-ascii?Q?+bTwSq2wq5hE13ncd1PULCyDFfMGdyyPjMAetXehFcQwLWTNy4aIGjuwmxjO?=
 =?us-ascii?Q?gD5eVulkQxf7La0pFwI3NfZHHQNc7Zd/amWixXxTVzrrCHIyiPMwSbcsYbSU?=
 =?us-ascii?Q?A+J92Wm3wmV2kvBxkuKOtBNWj7WEgWBbCabhybYyaond15FJUYYd+p6b+B2n?=
 =?us-ascii?Q?FvGIq5bIYRU5skA9DHbwTnn1X230B3rPo9pC/23VfBKF4WXlUTIdnDkr32Cu?=
 =?us-ascii?Q?EY4iTRjvei+TjhuGXCpIQ6z4axzha/pNJX4q0AbDAo2QUGhHaU+0OP12IRec?=
 =?us-ascii?Q?cDL+sYN9GbEhO3PyGVmhBHEgHQHM4NAhtTw6Fh+/fXoiLWSabs/Rgqh0N2Tu?=
 =?us-ascii?Q?Lj4HSrFgpA2hMUO0jTF7Nw3V5mbG+q+yFu/l3vD+xZ5vgjmeflkrkixtU+iB?=
 =?us-ascii?Q?UcbGOHdPivZ5VZd0o8tn3CHUAJR44SDYE3SjyhwV8stiutVbmKh4W+VDCgNh?=
 =?us-ascii?Q?q2qmdfDFI4jtAwuDisg+ESAAgZvk07Kgkps6Wa40LfSHtPG/2eFv2dPA8YWJ?=
 =?us-ascii?Q?ad1kNQ/YpbnW+uJUMZY8gz45kjN+ORk41HY0fR3vjeFHQfvVI9HynQV59TCG?=
 =?us-ascii?Q?kYE+gXsBFxlhjLmICs1z7bTfzeOQ4WJfn9y+3p8dF/VDYWAfkyQwV1dHRoox?=
 =?us-ascii?Q?TZRNwYrnTh4ON8eWdPqXI+EVEc8tMgzwm8BORpvKt84INWhxkxtVadRx55Dl?=
 =?us-ascii?Q?hMenhrYWYDYqPg4iSb2rCfjtf2OXDZKUE/sLqi+0sSzbnC9qsOr7suKE88cH?=
 =?us-ascii?Q?Lan+/pm84aoXSsw0QbpulUAldVC90DdaTAxXsE0noxiVq7AWlpEYO0KRg73a?=
 =?us-ascii?Q?EJJakD8pZUym5sesnCXjQlA8JknDKpw0G5t5PMpt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141cf1d8-00ab-4b9f-af5d-08db97b81ede
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 02:35:25.0386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bgupMTmkhobHqaU9eD0kz0HKt6tPypn4EfeICpzffoG/hrdyuSudF2tZmHLMx8vO+5zc0nAt9+i1UhRSQaGuMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6947
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Thursday, July 27, 2023 12:44 AM
> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
> Cc: patrick@stwcx.xyz; Jean Delvare <jdelvare@suse.com>; Guenter Roeck
> <linux@roeck-us.net>; Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.=
org>;
> Conor Dooley <conor+dt@kernel.org>; linux-i2c@vger.kernel.org;
> linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver bind=
ings
>=20
>   Security Reminder: Please be aware that this email is sent by an extern=
al
> sender.
>=20
> On Mon, Jul 24, 2023 at 06:05:11PM +0800, Delphine CC Chiu wrote:
> > Add a device tree bindings for ltc4286 driver.
> >
> > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > ---
> >  .../bindings/hwmon/lltc,ltc4286.yaml          | 49
> +++++++++++++++++++
> >  MAINTAINERS                                   |  9 ++++
> >  2 files changed, 58 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > new file mode 100644
> > index 000000000000..ad7f6ad888e4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fschemas%2Fhwmon%2Flltc%2Cltc4286.yaml%23&data=3D05%7C
> 01%7C
> >
> +Wayne_SC_Liu%40wiwynn.com%7Cd2e29aed8bdc47a743e508db8df786ac%7
> Cda6e06
> >
> +28fc834caf9dd273061cbab167%7C0%7C0%7C638259866495880680%7CUnkn
> own%7CT
> >
> +WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ
> XVC
> >
> +I6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dn%2FyZyYnSEoCOcUgQFI6BERAgkKa
> zYA%2FmAt
> > +2NAlr1Xdo%3D&reserved=3D0
> > +$schema:
> > +https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=3D05%7C01%7CWayne_S
> C_Liu%
> >
> +40wiwynn.com%7Cd2e29aed8bdc47a743e508db8df786ac%7Cda6e0628fc834
> caf9dd
> >
> +273061cbab167%7C0%7C0%7C638259866495880680%7CUnknown%7CTWFp
> bGZsb3d8ey
> >
> +JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> 7C30
> >
> +00%7C%7C%7C&sdata=3DfAA2CUAxdK6MJugvQ1ZRZ1hvB%2FfS%2B8SEOwQ3R
> Z2HEXo%3D&
> > +reserved=3D0
> > +
> > +title: LTC4286 power monitors
> > +
> > +maintainers:
> > +  - Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - lltc,ltc4286
> > +      - lltc,ltc4287
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vrange_select_25p6:
>=20
> Needs a vendor prefix and don't use '_'.

We will revise as adi,vrange-select-25p6

>=20
> > +    description:
> > +      This property is a bool parameter to represent the
>=20
> We have types, don't define the type in free form text.

We will revise as below
description:
  Specifies which voltage range is used, 25.6 or 102.4.
type: boolean

>=20
> > +      voltage range is 25.6 or not for this chip.
> > +
> > +  shunt-resistor-micro-ohms:
> > +    description:
> > +      Resistor value in micro-Ohm
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - shunt-resistor-micro-ohms
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        power-sensor@40 {
> > +            compatible =3D "lltc,ltc4286";
> > +            reg =3D <0x40>;
> > +            vrange_select_25p6;
> > +            shunt-resistor-micro-ohms =3D <300>;
> > +        };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > d516295978a4..7c1cb9bd4f45 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12344,6 +12344,15 @@ S:   Maintained
> >  F:   Documentation/hwmon/ltc4261.rst
> >  F:   drivers/hwmon/ltc4261.c
> >
> > +LTC4286 HARDWARE MONITOR DRIVER
> > +M:   Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > +L:   linux-i2c@vger.kernel.org
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> > +F:   drivers/hwmon/pmbus/Kconfig
> > +F:   drivers/hwmon/pmbus/Makefile
> > +F:   drivers/hwmon/pmbus/ltc4286.c
> > +
> >  LTC4306 I2C MULTIPLEXER DRIVER
> >  M:   Michael Hennerich <michael.hennerich@analog.com>
> >  L:   linux-i2c@vger.kernel.org
> > --
> > 2.25.1
> >
