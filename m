Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7A677DC67F
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 07:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbjJaGZM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 02:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjJaGZL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 02:25:11 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2067.outbound.protection.outlook.com [40.107.215.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CF6A9;
        Mon, 30 Oct 2023 23:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSLoJSq78I3od6FDlFIFQ8zJ95iyrpfHVk7TV8eVC9fHwehQCafes8Emunz6ZlU53x9fujxNYSLge1r3a1XCS8Yk4/Lzk60QajrZJ5veABboNV2Tkgd506TOM3FwuNma+nY3uBvQp2T/+xNEemFzj8pbe+PC7zMi9CtwECNZ4P8SYMkRXPPAItwf5kIILkaliyWqcqmXNdXd52kkTus7TcyHd1HQPq8fS4Hvci26Hcze1Sc4Mvg4kCvWhbrPo3oY6Qxq//H/x3S9tyI/euUBAlshZv4L9PWlvHw+Pn0bDtf3Gc+0PHuYU7VAkRXhuPnzq1B33UYLh7xUMfjbgoprHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfkGenU4bKBA7QEfM322remw1xtka+VMUCmeplwPt+k=;
 b=E1If1GHYzCZ8SZNvlcdU2OANnvVxeUZLbEA3WyXK3ek3zLqxC7Vyxqm5T1i6cIgxU9BP3WVKqc06lF+RDBG7sqq3rM4nUUxcrU2WxoKk/UqzjYsQUlYhQb0gKrd2bBZR2snR9mO/UmWwa7hypDPowLWQqSjsI+RXA5tifnlRoU11/QV9FqWSt8pQRvJuiW9tspSFMqj33tEW8NBWN6vBWSBEGc5SmymTl+n0MMG2GwXbN6c1tj91wPVlKEhyers7eoPGX52YNHTN9q/4U03UfCGozsmzNPYRg5YAt4QDkkKDmvF0b2WlcsF4h+Vjz4COxGQXP6dampp81Fq5Yeiu5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfkGenU4bKBA7QEfM322remw1xtka+VMUCmeplwPt+k=;
 b=psM4sJ2cvDYDdE4zdx/nKUNqi4kjaLO+DTnq/fknMREwKFcPGV3FUFGfAq+ME5u7LL5sEpFm1tMfxDPRaOLtTzj7hCmp/bVy6Qg0VXxGNCT1sE2U0c4hPJ5UMGiV1xzhMmPWS4zNdLF4DTLZ0MirAcKGLzJCqaSbDESe5qWldXrT1Qr2V5OHKNkHMfP+x7dyCMBCLpEkbV2MeoGxrSQkO0nFdHr8Oqqnb6vq6fH6/S3XY9rEckw0hJQuoBcS4O+bnQCpAQvzcQcF/aYCbNYuCvMPwo07i+lXZ5doAHMtVL6u2BykRm+yiDID0KKm8KF9C5euhCQYvX2kOoTCYxhA/g==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by PSAPR04MB4151.apcprd04.prod.outlook.com (2603:1096:301:3b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 06:25:02 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::4c7a:8fd8:1527:9287]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::4c7a:8fd8:1527:9287%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 06:25:01 +0000
From:   Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To:     Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor@kernel.org>
CC:     Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
        "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
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
Thread-Index: AQHaB+SV8Z0lWuQfqk2pb+fPvv8kdLBcIN+AgAAMSACAAASRgIAAFwGAgAcsfFA=
Date:   Tue, 31 Oct 2023 06:25:00 +0000
Message-ID: <SG2PR04MB55438AA9A2989F406012A4D4A1A0A@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231026081514.3610343-2-Delphine_CC_Chiu@Wiwynn.com>
 <20231026-dicing-crispy-a10af575d3e5@spud>
 <fffa4330-8d01-8498-4c5f-772ebf2a6b5a@roeck-us.net>
 <20231026-poison-encrypt-1df55e023867@spud>
 <c734e26a-6fad-bc23-ec58-10c6a440ec83@roeck-us.net>
In-Reply-To: <c734e26a-6fad-bc23-ec58-10c6a440ec83@roeck-us.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|PSAPR04MB4151:EE_
x-ms-office365-filtering-correlation-id: 5b47aab6-477b-429f-a337-08dbd9da1c6b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yJmnwXYMXpMkOsmnixPQ4QzuE4PdH4CR+bQXYRWWqWmAZItbwmSRv5OF0Al1bvv0IvLfIyfOKMfRe25ewW0L7AHH4iSMnquIPeXI7vUQNb/whFl9qUbO9PsUIVG/cuqoOSYROOB54xfQKn9OJFo5EI+YA8GCFrT9j8hxK/xzbKWxP3/dhfqhMBBd8AbqbJGyhkV6R6mFusNiUECITPOy8D2e/oheyfewi6J/4dJQnYq8LuwQ8MzhH/+4EoauWkDndR8+zA8a4f8/4e1bjcv57VQ1S6rB1xpaUaap/guGRtqEsbTpaqWFFODsnodEaWLW+RZNoELHwxqA63iAloZw31rOGhQEOyYI4ubi5HIBz8dT7yRIwz+fDYCQg7PfCdEj456zsCGUV0F3ejbcggek0qCc4YlhTmnBD48wCsRqLnZrGEng9d811StX66tp20xfHIxP7gE9YJwj8WK/voMBg2ihDjEbzztAU+0lb+SGchHJEDvDb7V4KLB0bW1Z9bFBPeWFAlkTJG+44HGgaI+Y9t4aG42B6kGYm/3VvO41VyLNcoegjLJnL3XOg79i86lnN7zgYgZ6x5LV67LVRm1l6s7p8CoyRYPw9HWfXTY9Cc73f0MkjFNaerUilw17g8vBA0INoDP5CRflXZD0Q1h92XeXZYJNsDgk+9E3Aw5x4vM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(39850400004)(366004)(136003)(230173577357003)(230273577357003)(186009)(64100799003)(1800799009)(451199024)(38070700009)(9686003)(26005)(55016003)(38100700002)(86362001)(33656002)(122000001)(7416002)(2906002)(83380400001)(6506007)(7696005)(45080400002)(53546011)(478600001)(71200400001)(52536014)(8936002)(64756008)(66446008)(8676002)(66476007)(966005)(4326008)(316002)(54906003)(41300700001)(110136005)(66556008)(5660300002)(66946007)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?prASRZmy8W06DSjO2NUrHYUw8MKEb9RiOS3q1Qhtd/vArfFabaAZoOKdFgV7?=
 =?us-ascii?Q?+++1frx7Jn3Qw3IwSzt0Vd9Q6VB4a970uQf1IGrxZUj5qt6okbqS2enbsHfr?=
 =?us-ascii?Q?m+YzvAPXhKhs5Ia0rMcmuev9JCfn/3rXXtgmjY8V1COFskjn15E+mYgvbYch?=
 =?us-ascii?Q?Vbolv0x6fsyAe+oD1zXQsOjisZd4nzITgyiPRcv7KBxv9+KdA3G8rH7Tq/Q4?=
 =?us-ascii?Q?atPztpuupKhCQ5PI1z+83h9b6jPAxTj8kuVEOi2OZBn5+FwL9lI5vljCcMlG?=
 =?us-ascii?Q?5R0YLIU6sqDkGCZpYjd9bi0SdozrZ9etNkEMfxkGaTfbSgIs6wEI/0etCPYT?=
 =?us-ascii?Q?C2zJY+OMNkoRZxYT9VSHrOVvAHT5NK8+IjUo2k17b4Zqx/KWLX6Iqk+Ttqm2?=
 =?us-ascii?Q?wTtajUD5wC+0qs9pCLPTRrn4JEeJuon3LKkQZQOtwfkE5AiH9cc5XNmu80ca?=
 =?us-ascii?Q?3lu7NFxSFFmJmM98Lv27d7p8xh5Iresx1ftP7OILB9Orypmwkwbq9rnmdfMV?=
 =?us-ascii?Q?+GB9Rp8HzYW6e+g3pEcWci9DAIcmTX18TlmGyNV7wYj+MWAAnPlQDE1tnNK8?=
 =?us-ascii?Q?MCHXUBCvCJJ+nhk59Qg8fG1eZBs2mGbFgRMTooqKKlm3/7ArkgwKVU3nm4Y4?=
 =?us-ascii?Q?XQkGRQIr+JwVWrUMegTu75JhJ/HhxtX+fqS8pPmEHn262DbLazHo5dd99/0D?=
 =?us-ascii?Q?uZkd5N60/NuZKO2AnIQeA1q7Pq57G1Jfz+NqbEkCby/ckoSksCcRZrYzVnZx?=
 =?us-ascii?Q?pFWlPsNo8yz3xC1npo0IvbOhooGHwwbeK5j3cT5KLFovP2GrN7+cD3WLxoUg?=
 =?us-ascii?Q?iHfRvi73Ohq+kH1qVKLEWF92MNRGL8ykg/I2tfCPfHb4eR4l7zGas+KATeRv?=
 =?us-ascii?Q?ejw2rege1HbbtdHQFJpkZE8yfg0h/67zWcKVJ06R8uO2yEJgteajIT43On4v?=
 =?us-ascii?Q?JwB4HsO5JKPOxKJe19C1EwVI051iW3izuSXeNUU97Aae8yYgsaQ2l1mMFpBo?=
 =?us-ascii?Q?YlPm8CgeVzGT23N5MweFi08HY0O9hEZPMLS8gvQAXwhz+rF6qk39YMdaWL5R?=
 =?us-ascii?Q?YE0uhmJzudQh4YvUJiJKxinKairEpn8j/H3UUXReRGX1FGgzkaIj8oGtfeo1?=
 =?us-ascii?Q?i923lfl/kAXJk2wSQq0O2hKkb0BhbwBmTrCT15FRWYO78F/uCGXVWNz4ZVZe?=
 =?us-ascii?Q?8dHe+LLIjUpvTp3okf/oU+gV/ruSILimIBycKsWAoilnrI6aWHmKvgH7mT8p?=
 =?us-ascii?Q?FK2GEmHa3N53v0Ns6FuSHOIqpkdRo3pqp3YHC6pLlwFK4TJwYqlHXgqfGQte?=
 =?us-ascii?Q?zvM/gFJTUAWWtm9NrLOVMqSwOEUHCGwahzq8u68738PmeFE/engzZ6wWBQqL?=
 =?us-ascii?Q?6cQ7dltjTg/MtCTNErUM5AiUNS0pOfWR2o9NRY5TKDK6y0UelKRT9USkrZmf?=
 =?us-ascii?Q?J6KYSdeU4LTQn9dxdaq5ZNf0/UaPxAxzAKj9miGKLDjE7z3N/2rMbVdtUnG7?=
 =?us-ascii?Q?s4x4pO8OSInpiLfkDJzHwaaDPtoQXw4+yuloRKrbu7vmO74w+WEx108AVbJ+?=
 =?us-ascii?Q?NEOaRyEriWJfpqLYRkJ1ayN4tyEKM2phdhWF0BL+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b47aab6-477b-429f-a337-08dbd9da1c6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 06:25:00.5850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xVt7SBrw5r+mX3MfKVbgq60XuyM40yUAn0lT1CW9SCY2Mg5oeGFi/hpRxabwAPz+vGCqB8CNQZjEabbek4vFeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR04MB4151
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Friday, October 27, 2023 12:49 AM
> To: Conor Dooley <conor@kernel.org>
> Cc: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>;
> patrick@stwcx.xyz; Jean Delvare <jdelvare@suse.com>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
> Jonathan Corbet <corbet@lwn.net>; linux-i2c@vger.kernel.org;
> linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org; linux-doc@vger.kernel.org
> Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
> bindings
>=20
>   Security Reminder: Please be aware that this email is sent by an extern=
al
> sender.
>=20
> On 10/26/23 08:26, Conor Dooley wrote:
> > On Thu, Oct 26, 2023 at 08:09:52AM -0700, Guenter Roeck wrote:
> >> On 10/26/23 07:25, Conor Dooley wrote:
> >>> Hey,
> >>>
> >>> On Thu, Oct 26, 2023 at 04:15:11PM +0800, Delphine CC Chiu wrote:
> >>>> Add a device tree bindings for ltc4286 driver.
> >>>
> >>> Bindings are for devices, not for drivers.
> >>>
> >>>>
> >>>> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> >>>>
> >>>> Changelog:
> >>>>     v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
> >>>>        - Add type for adi,vrange-select-25p6
> >>>>        - Revise rsense-micro-ohms to shunt-resistor-micro-ohms
> >>>> ---
> >>>>    .../bindings/hwmon/lltc,ltc4286.yaml          | 50
> +++++++++++++++++++
> >>>>    MAINTAINERS                                   | 10 ++++
> >>>>    2 files changed, 60 insertions(+)
> >>>>    create mode 100644
> >>>> Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> >>>>
> >>>> diff --git
> >>>> a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> >>>> b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..17022de657bb
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> >>>> @@ -0,0 +1,50 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
> >>>> +1.2
> >>>> +---
> >>>> +$id:
> >>>> +https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
d
> >>>>
> +evicetree.org%2Fschemas%2Fhwmon%2Flltc%2Cltc4286.yaml%23&data=3D05%
> 7
> >>>>
> +C01%7CWayne_SC_Liu%40wiwynn.com%7Cf555db9618454d17e0b508dbd64
> 36721
> >>>>
> +%7Cda6e0628fc834caf9dd273061cbab167%7C0%7C0%7C6383393572109674
> 95%7
> >>>>
> +CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB
> TiI
> >>>>
> +6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DcPOOqJ5y3K%2B
> D%2Frsp
> >>>> +gVhpKDIC0gC5nKBbRp7Up0OxDpM%3D&reserved=3D0
> >>>> +$schema:
> >>>> +https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
d
> >>>>
> +evicetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=3D05%7C01%7CWayne
> _S
> >>>>
> +C_Liu%40wiwynn.com%7Cf555db9618454d17e0b508dbd6436721%7Cda6e06
> 28fc
> >>>>
> +834caf9dd273061cbab167%7C0%7C0%7C638339357210967495%7CUnknown
> %7CTW
> >>>>
> +FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX
> >>>>
> +VCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DHjOhDm8bwPaNpWgumCSlak%2
> FiqoagwZc
> >>>> +0eb95J1wnKUE%3D&reserved=3D0
> >>>> +
> >>>> +title: LTC4286 power monitors
> >>>> +
> >>>> +maintainers:
> >>>> +  - Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    enum:
> >>>> +      - lltc,ltc4286
> >>>> +      - lltc,ltc4287
> >>>
> >>> I don't recall seeing an answer to Guenter about this ltc4287 device:
> >>> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
o
> >>>
> re.kernel.org%2Fall%2F22f6364c-611c-ffb6-451c-9ddc20418d0a%40roeck-u
> >>>
> s.net%2F&data=3D05%7C01%7CWayne_SC_Liu%40wiwynn.com%7Cf555db96184
> 54d17
> >>>
> e0b508dbd6436721%7Cda6e0628fc834caf9dd273061cbab167%7C0%7C0%7C6
> 38339
> >>>
> 357210967495%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI
> joiV2l
> >>>
> uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DoekIX
> %2FlP
> >>> %2B%2F4KhrSlK8Xp1zR0fdX1Emmr0Ox5GPS9Dz0%3D&reserved=3D0
> >>>
> >>
> >> At least the chip does officially exist now, and a datasheet is availa=
ble.
> >>
> >> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fww=
w
> >> .analog.com%2Fen%2Fproducts%2Fltc4287.html&data=3D05%7C01%7CWayne
> _SC_Li
> >>
> u%40wiwynn.com%7Cf555db9618454d17e0b508dbd6436721%7Cda6e0628fc8
> 34caf9
> >>
> dd273061cbab167%7C0%7C0%7C638339357210967495%7CUnknown%7CTWF
> pbGZsb3d8
> >>
> eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> %7C
> >>
> 3000%7C%7C%7C&sdata=3DFqRheGXFi%2FmSH3cnRZ7eSbwD3JfZj8powcGBCJcP
> wWQ%3D&
> >> reserved=3D0
> >>
> >> It shows that coefficients for the telemetry commands are different,
> >> meaning that indeed both chips need to be explicitly referenced in
> >> the properties description (and handled in the driver, which proves
> >> my point of needing a datasheet before accepting such a driver).
> >
> > Oh neat, would've been good if that'd been mentioned!
> >
>=20
> Actually, turns out there is some contradiction in the LTC4286 datasheet.
> It mentions different coefficients in different places. It is all but imp=
ossible to
> determine if the datasheet is wrong or if the chip uses a variety of coef=
ficients
> unless one has a real chip available. Sigh :-(.
We are not the chip vendor, but we could forward your question to vendor.
Could you point out the exact places (which pages) where are the contradict=
ion in LTC4286 datasheet?

>=20
> >>>> +
> >>>> +  reg:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  adi,vrange-select-25p6:
> >>>> +    description:
> >>>> +      This property is a bool parameter to represent the
> >>>> +      voltage range is 25.6 or not for this chip.
> >>>
> >>> 25.6 what? Volts? microvolts?
> >>> What about Guenter's suggestion to name this so that it better
> >>> matches the other, similar properties?
> >>>
> >>
> >> I still would prefer one of the more common properties.
> >> I still prefer adi,vrange-high-enable.
> >
> > I think, from reading the previous version, that this is actually the
> > lower voltage range, as there is a 102.x $unit range too that is the
> > default in the hardware. Obviously, the use of the property could be
> > inverted to match that naming however.
> >
>=20
> It needs to be programmed either way because it is unknown how the chip h=
as
> been programmed before. That means some action is needed no matter if the
> property is provided or not.
>=20
> Sure, we could add something like adi,vrange-low-enable. Not sure if that
> would be any better.
>=20
> Actually, after looking at the datasheets, I'd be more interested in the =
impact
> of other configuration buts such as VPWR_SELECT which selects the voltage
> used for power calculations, or all the settings in MFR_ADC_CONFIG. The
> datasheet doesn't really explain (or I can't figure out how it does) how =
the
> different configurations affect the reported telemetry values. But that i=
s a
> question for the driver, not for the property description.
We have sent an e-mail about this question.

>=20
> Guenter

