Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C792A5CDB
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Nov 2020 03:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729475AbgKDC7g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 21:59:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:47284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728972AbgKDC7g (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Nov 2020 21:59:36 -0500
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A04E3223AB;
        Wed,  4 Nov 2020 02:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604458775;
        bh=ftTDFUbkvm7TTL768g4AOaq8eUVZ6qI4pcdRvmv5bo4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HmYKXfX9r0GMUHxXf/9RwzkoAbdcrn2F5nabXr2ae7R6wi+y30lXnZg4WUqEttBfx
         zcumPYtYhYVbj3+TkaKEcpBT//iHuGRe3A6FlcYLhl2gs5HS6Fabx40vcjWcskA/Ts
         6I8IaiojNwNb0cPWqtCJsJ1fVzzHRssmGsKs5bgI=
Received: by mail-ot1-f48.google.com with SMTP id m26so18022677otk.11;
        Tue, 03 Nov 2020 18:59:35 -0800 (PST)
X-Gm-Message-State: AOAM5333d2254OJrQ2kRCJuirdfG0z/srOzv3PBoOtonBXaNlPLfL8OY
        Y8H5UGClyPmvaPjAo+PhkrpyumjWoZ0W8Y21eg==
X-Google-Smtp-Source: ABdhPJzIE0BOtJffCkVGGCwpQBbIffdPnWgpUs6YKl/RgfgDq6bJuIFBU6hEuI8V6/zfCldgH/Yx04GUDVdO5DTRwms=
X-Received: by 2002:a9d:6e0c:: with SMTP id e12mr6756300otr.129.1604458775024;
 Tue, 03 Nov 2020 18:59:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604432921.git.kblaiech@nvidia.com> <c81a0679413dd77e68bdf7e3023d1a54e62f26ea.1604432921.git.kblaiech@nvidia.com>
In-Reply-To: <c81a0679413dd77e68bdf7e3023d1a54e62f26ea.1604432921.git.kblaiech@nvidia.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 3 Nov 2020 20:59:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLC5nzPmNK41s3fB6nnRqjC3DXPfYn1uqdytrEKqFBpXQ@mail.gmail.com>
Message-ID: <CAL_JsqLC5nzPmNK41s3fB6nnRqjC3DXPfYn1uqdytrEKqFBpXQ@mail.gmail.com>
Subject: Re: [PATCH i2c-next v2 6/6] dt-bindings: i2c: Convert DT file to YAML schema
To:     Khalil Blaiech <kblaiech@nvidia.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>, devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 3, 2020 at 1:56 PM Khalil Blaiech <kblaiech@nvidia.com> wrote:
>
> Write the devicetree binding text file associated with
> the Mellanox BlueField I2C controller in schema file,
> JSON compatible subset of YAML. Besides, add an entry
> within MAINTAINERS file.

Please fix the subject as I asked in v1.
>
> Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
> ---
>  .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt | 42 ------------
>  .../bindings/i2c/mellanox,i2c-mlxbf.yaml           | 80 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 81 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
>
> diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> deleted file mode 100644
> index 566ea86..0000000
> --- a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Device tree configuration for the Mellanox I2C SMBus on BlueField SoCs
> -
> -Required Properties:
> -
> -- compatible : should be "mellanox,i2c-mlxbf1" or "mellanox,i2c-mlxbf2".
> -
> -- reg : address offset and length of the device registers. The
> -       registers consist of the following set of resources:
> -               1) Smbus block registers.
> -               2) Cause master registers.
> -               3) Cause slave registers.
> -               4) Cause coalesce registers (if compatible isn't set
> -                  to "mellanox,i2c-mlxbf1").
> -
> -- interrupts : interrupt number.
> -
> -Optional Properties:
> -
> -- clock-frequency : bus frequency used to configure timing registers;
> -                       allowed values are 100000, 400000 and 1000000;
> -                       those are expressed in Hz. Default is 100000.
> -
> -Example:
> -
> -i2c@2804000 {
> -       compatible = "mellanox,i2c-mlxbf1";
> -       reg =   <0x02804000 0x800>,
> -               <0x02801200 0x020>,
> -               <0x02801260 0x020>;
> -       interrupts = <57>;
> -       clock-frequency = <100000>;
> -};
> -
> -i2c@2808800 {
> -       compatible = "mellanox,i2c-mlxbf2";
> -       reg =   <0x02808800 0x600>,
> -               <0x02808e00 0x020>,
> -               <0x02808e20 0x020>,
> -               <0x02808e40 0x010>;
> -       interrupts = <57>;
> -       clock-frequency = <400000>;
> -};
> diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> new file mode 100644
> index 0000000..3eb7457
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/mellanox,i2c-mlxbf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mellanox I2C SMBus on BlueField SoCs
> +
> +maintainers:
> +  - Khalil Blaiech <kblaiech@nvidia.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mellanox,i2c-mlxbf1
> +      - mellanox,i2c-mlxbf2
> +
> +  reg:
> +    minItems: 3
> +    maxItems: 4
> +    items:
> +      - description: Smbus block registers
> +      - description: Cause master registers
> +      - description: Cause slave registers
> +      - description: Cause coalesce registers
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    enum: [ 100000, 400000, 1000000 ]
> +    description:
> +      bus frequency used to configure timing registers;
> +      The frequency is expressed in Hz. Default is 100000.
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - mellanox,i2c-mlxbf1
> +
> +then:
> +  properties:
> +    reg:
> +      maxItems: 3
> +
> +examples:
> +  - |
> +    i2c@2804000 {
> +        compatible = "mellanox,i2c-mlxbf1";
> +        reg = <0x02804000 0x800>,
> +              <0x02801200 0x020>,
> +              <0x02801260 0x020>;
> +        interrupts = <57>;
> +        clock-frequency = <100000>;
> +    };
> +
> +  - |
> +    i2c@2808800 {
> +        compatible = "mellanox,i2c-mlxbf2";
> +        reg = <0x02808800 0x600>,
> +              <0x02808e00 0x020>,
> +              <0x02808e20 0x020>,
> +              <0x02808e40 0x010>;
> +        interrupts = <57>;
> +        clock-frequency = <400000>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 551587f..40569fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11166,6 +11166,7 @@ MELLANOX BLUEFIELD I2C DRIVER
>  M:     Khalil Blaiech <kblaiech@nvidia.com>
>  L:     linux-i2c@vger.kernel.org
>  S:     Supported
> +F:     Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
>  F:     drivers/i2c/busses/i2c-mlxbf.c
>
>  MELLANOX ETHERNET DRIVER (mlx4_en)
> --
> 2.1.2
>
