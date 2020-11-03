Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36A552A4766
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 15:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729243AbgKCOKk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 09:10:40 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:61341 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729405AbgKCOIt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Nov 2020 09:08:49 -0500
Received: from HKMAIL103.nvidia.com (Not Verified[10.18.92.9]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa1646f0000>; Tue, 03 Nov 2020 22:08:47 +0800
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 14:08:46 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 3 Nov 2020 14:08:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiEBE77wmEKx8n/O+WHE7n/n5Mz+iipbbXMEdwjYhnT37oBc+NtUuwJBq7uLFGZffPyz00kDUW4ifLZoxpmwpLItHpfyOLk35vYmOU8AMiHJgrjO/uxheyd5oBx1IZlXHJYUlTgzhqBcE85RcBndqfnTa25yKZjMSXiIrnXR909w52gOXCcrkEIapGsbyvmSTxfxMa3P93lehbSax4BdFOZA23jRNc3iN+GbxgjxOsGWcosKe3N9Zq4OwOWAXA6xi6ukkcsXp5162DMvejl9Qx5CiQQ9l1u9+RmnItp/33B3rsYHWZuxqPsarye0m7g4ZPFjmh98qLSaBz37sqCAyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYzKVum3UnN3NLTqF5+x6XfXOvUJWq/LtJgV6N/HtJA=;
 b=BNMiIeyA4WFc2idwfhXK226YC0ZaHJKWSJ+M1mODLaUTzNL9EjYL2Y/q2C7J53+5L+4raMmmD8BIxpOLW4Y6xemPOtV64Bo2Cjn/zuOnYEk6s/YzVsCwRpx081iNF7w+2bDtqgDYKx0HOSjT/akGZqEKNsSAsF7vjABoeumBYkA21STKFxGramit7BbqH9GWSbmwDSfKqLLkeB6XsajwNQXozbmPvqxvxhb7a3ZFn9cnoqEe5TKU6ToYzRuHfcqUIX/oavuIXlaz0GZwNjHYNNt9FgB2U7ZO+5v7WXPuGlHxjucOGEUfjM4aQP7hYTcSlcQCszTfAwGy+b6jGawqWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB3360.namprd12.prod.outlook.com (2603:10b6:208:c7::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Tue, 3 Nov
 2020 14:08:43 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f%5]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 14:08:43 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Rob Herring <robh@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "Leon Romanovsky" <leonro@nvidia.com>
Subject: RE: [PATCH i2c-next v1 6/6] dt-bindings: i2c: Convert DT file to YAML
 schema
Thread-Topic: [PATCH i2c-next v1 6/6] dt-bindings: i2c: Convert DT file to
 YAML schema
Thread-Index: AQHWrX2HV/F60Fhs10S889Dvf01JXamutp0AgAfDkkA=
Date:   Tue, 3 Nov 2020 14:08:43 +0000
Message-ID: <MN2PR12MB36169B5BCCD62DA558EE2EC1AB110@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <cover.1603925077.git.kblaiech@nvidia.com>
 <77461da87050051e0d2e7decdc9b088ff8738e19.1603925078.git.kblaiech@nvidia.com>
 <20201029153306.GA1905314@bogus>
In-Reply-To: <20201029153306.GA1905314@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [173.48.75.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fe4f987-a350-4ff9-7808-08d88001f925
x-ms-traffictypediagnostic: MN2PR12MB3360:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3360325202AEE0D91492E8C5AB110@MN2PR12MB3360.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MwGwvyMq3uP8c7yY7PbfZLjhMoZN1yh9yS9wmED/jKo37rgPQv/mk5HRJmPn9ghsO7DZqGT9Bojdera3J4T8OFibfDWQYwzxjQpR7m3pg/VcEen3nNzqp5cnWSv/PsPTuOW+iq3IdZ0CqmDxeF6qz0XPMSfJjCra5eIDHxCZhYCdZ1sollgun+DFYtaAMtQ7CIUnZysJeNuPia/G0dBbLG78gqk2h4w2cKnIOcl7rKtc2GMZzDEmVhzt05fKaRUkV9gEANJECN3P7+syeC1RKloQUUNLnstUzErGiWy7/ljT+cRK7F5ScgNuAv6oJy0cTwjKdVfrrV1WbY5gdUAujM8PuU4zNe2asMPLoQuoVj/SVzWur1HOft8xciRV7FRQ7wNKV+xNOV77quEAcZBBZw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(52536014)(86362001)(6506007)(966005)(66556008)(66476007)(8936002)(64756008)(6916009)(66946007)(33656002)(478600001)(66446008)(76116006)(5660300002)(71200400001)(186003)(8676002)(2906002)(55016002)(107886003)(83380400001)(7696005)(26005)(316002)(4326008)(54906003)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ELGScExyNutJHfySDzqkVDTGARaXVe3YWR7Qx5m6s5Mu6ohHGdPS11uRchtiSFMz3ijddI4CX9XDZ4KF0yHfkbYFCfXeaRwYZvaIviywejIxaspqwSzv12AoV5hJAKn7uqjF5LjQ2h9FBIAIjskbDyqJ/Fr8w6UhFGlCpNiF9p4MxxaZhDp//A7bZ7/Ff5HQGxC9lyyMC18gGXz6aMba4h6TThD27aO01ttIYG9jyY0QGDLOLLY8zMISRq46WQvP/ogW3n1mWZ+5GbtLqJzw+RZIyV7V97SLxdi3w8Wlb74aFggrMTbmSSILv6/s2CGz6wNxNVnaIfC61H7x3k1A59LJ/t9wPdGRz5Eym5pNQN9qZatd51dlkCPgIf1844VOy3byj2hXQsr98Ry5DrfnbALCKaD+yfhYRUFT1K0+NShVrNTkJSvrhdxv9ugadL3lmzvlyJ+cXOtfbxeoQ7nk9/eRvN90hM+YFRM6LHqROAjD2W1kdqT0rysnwgW7XiVwMhXSrQxz2Z5jkBu3NZkRs30/0b1lrujY06dHXYQeEFLZOMAVy8qYW55BXtRbLQU4UbzJBx3ATE267k1BOd2neBkyDW2Flymff/QyOnqImkudBG/g/gj1xTQGDJ0x9ihAxtx4ZM5Quqe/esyrp9Slew==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe4f987-a350-4ff9-7808-08d88001f925
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 14:08:43.4451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W92fMcTzbYgAssJg5WlcL1ktbG9nCiugzbkz63qtIegnfpkjPOqoslDa8/sEgOdTPSNG1XCT7MsmAic/HxT2EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3360
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604412527; bh=xYzKVum3UnN3NLTqF5+x6XfXOvUJWq/LtJgV6N/HtJA=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-ms-exchange-transport-forked:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-forefront-antispam-report:
         x-ms-exchange-antispam-messagedata:Content-Type:
         Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=KxOBR1hmWaYnJ2CSQesshQrD5vhL1SXt/4codomXJuT4tCqbJV60wewG/lTZy5axv
         lfEMAjhv6xyxqYbLqAGitGhMoLmbO0C6bZ/8DINkGcYY0kxi8e1T+JUCbV/5+zH6WS
         8Kh/M/oE1ljrd9A8A2IQ2tIFPDRMoEX3MNbv6hPpgOfS6VeWffP9XubPv7hFqLfIpE
         RIFZbVtFHVFhYlQw8G2WoLhxYIJltI/KRFwbUWtjj7pkzB9jTVlCExRw+DbbitYhuX
         wp/OfHKukxtACPA9dSWeVzWiYSwsmTP8nCUgj7CoUr6W4Cz/RpKHXJxmA3JrIWEoDf
         sS2Dd/vWiE+zg==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On Wed, Oct 28, 2020 at 06:55:54PM -0400, Khalil Blaiech wrote:
> > Write the devicetree binding text file in schema file, JSON
> > compatible subset of YAML.
> > Besides, add an entry within MAINTAINERS file.
>=20
> The subject should contain something about Mellanox BlueField.

Got it.

> >
> > Fixes: d9becc53b3ade81e ("dt-bindings: i2c: I2C binding for Mellanox
> BlueField SoC")
>=20
> Fixes is not appropriate for this.

Should I remove?

>=20
> > Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> > Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
> > ---
> >  .../bindings/i2c/mellanox,i2c-mlxbf.txt       | 42 ----------
> >  .../bindings/i2c/mellanox,i2c-mlxbf.yaml      | 78 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  3 files changed, 79 insertions(+), 42 deletions(-)
> >  delete mode 100644
> Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> >  create mode 100644
> Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.t=
xt
> b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> > deleted file mode 100644
> > index 566ea861aa00..000000000000
> > --- a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> > +++ /dev/null
> > @@ -1,42 +0,0 @@
> > -Device tree configuration for the Mellanox I2C SMBus on BlueField SoCs
> > -
> > -Required Properties:
> > -
> > -- compatible : should be "mellanox,i2c-mlxbf1" or "mellanox,i2c-mlxbf2=
".
> > -
> > -- reg : address offset and length of the device registers. The
> > -	registers consist of the following set of resources:
> > -		1) Smbus block registers.
> > -		2) Cause master registers.
> > -		3) Cause slave registers.
> > -		4) Cause coalesce registers (if compatible isn't set
> > -		   to "mellanox,i2c-mlxbf1").
> > -
> > -- interrupts : interrupt number.
> > -
> > -Optional Properties:
> > -
> > -- clock-frequency : bus frequency used to configure timing registers;
> > -			allowed values are 100000, 400000 and 1000000;
> > -			those are expressed in Hz. Default is 100000.
> > -
> > -Example:
> > -
> > -i2c@2804000 {
> > -	compatible =3D "mellanox,i2c-mlxbf1";
> > -	reg =3D	<0x02804000 0x800>,
> > -		<0x02801200 0x020>,
> > -		<0x02801260 0x020>;
> > -	interrupts =3D <57>;
> > -	clock-frequency =3D <100000>;
> > -};
> > -
> > -i2c@2808800 {
> > -	compatible =3D "mellanox,i2c-mlxbf2";
> > -	reg =3D	<0x02808800 0x600>,
> > -	        <0x02808e00 0x020>,
> > -		<0x02808e20 0x020>,
> > -		<0x02808e40 0x010>;
> > -	interrupts =3D <57>;
> > -	clock-frequency =3D <400000>;
> > -};
> > diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-
> mlxbf.yaml b/Documentation/devicetree/bindings/i2c/mellanox,i2c-
> mlxbf.yaml
> > new file mode 100644
> > index 000000000000..b9f6b07c503f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> > @@ -0,0 +1,78 @@
> > +# SPDX-License-Identifier: GPL-2.0
>=20
> If you have rights, please dual license adding BSD-2-Clause.

Sure.

>=20
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/mellanox,i2c-mlxbf.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mellanox I2C SMBus on BlueField SoCs
> > +
> > +maintainers:
> > +  - Khalil Blaiech <kblaiech@nvidia.com>
>=20
> allOf:
>   - $ref: i2c-controller.yaml#
>=20
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mellanox,i2c-mlxbf1
> > +      - mellanox,i2c-mlxbf2
> > +
> > +  reg:
> > +    minItems: 3
> > +    maxItems: 4
> > +    items:
> > +      - description: Smbus block registers
> > +      - description: Cause master registers
> > +      - description: Cause slave registers
> > +      - description: Cause coalesce registers
> > +
> > +  interrupts:
> > +      maxItems: 1
> > +
> > +  clock-frequency:
> > +      enum: [ 100000, 400000, 1000000 ]
> > +
>=20
> Drop the blank line.
>=20
> > +      description:
> > +        bus frequency used to configure timing registers;
> > +        The frequency is expressed in Hz. Default is 100000.
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +unevaluatedProperties: false
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - mellanox,i2c-mlxbf1
> > +
> > +then:
> > +  properties:
> > +    reg:
> > +      maxItems: 3
> > +
> > +examples:
> > +  - |
> > +    i2c@2804000 {
> > +        compatible =3D "mellanox,i2c-mlxbf1";
> > +        reg =3D <0x02804000 0x800>,
> > +              <0x02801200 0x020>,
> > +              <0x02801260 0x020>;
> > +        interrupts =3D <57>;
> > +        clock-frequency =3D <100000>;
> > +    };
> > +
> > +  - |
> > +    i2c@2808800 {
> > +        compatible =3D "mellanox,i2c-mlxbf2";
> > +        reg =3D <0x02808800 0x600>,
> > +              <0x02808e00 0x020>,
> > +              <0x02808e20 0x020>,
> > +              <0x02808e40 0x010>;
> > +        interrupts =3D <57>;
> > +        clock-frequency =3D <400000>;
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 9128200af1d0..8dba7ace4a40 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11075,6 +11075,7 @@ MELLANOX BLUEFIELD I2C DRIVER
> >  M:	Khalil Blaiech <kblaiech@nvidia.com>
> >  L:	linux-i2c@vger.kernel.org
> >  S:	Supported
> > +F:	Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> >  F:	drivers/i2c/busses/i2c-mlxbf.c
> >
> >  MELLANOX ETHERNET DRIVER (mlx4_en)
> > --
> > 2.24.1
> >
