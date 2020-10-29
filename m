Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADA0829F001
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Oct 2020 16:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728185AbgJ2PdP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Oct 2020 11:33:15 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46768 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbgJ2PdL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Oct 2020 11:33:11 -0400
Received: by mail-oi1-f193.google.com with SMTP id x1so3544912oic.13;
        Thu, 29 Oct 2020 08:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JuHhXsHTlKSjp7xSFE+HvrRlGkwnXKj7Bg2D6ZxN+i8=;
        b=AHWKs4iFnUD2Aa1Q3B6i44nHij3ivWOqbI2v4Er+MAS7tPm2m3s1Rn39DaXXRpYj4I
         BYfHrmyVnXbXXysIIgCskHpbEBoUC+QjxkyKO0UkV/ST6shB5rLJXLwMsHwOWL9e/80W
         y6CYb5Wx5buDD6Js6r4C+/x0JkiM1RuklKmVYqYKQ5W7KlUMZ1DKMuAJ9cY9ZjqJJTRV
         u7Qv4OB/7sF87DXFaqrjwCwpKiq36WHzlzHT1FlajnccblPLQcNWISTjsxTfdtGd1kLy
         DrMVJbqL6Jiy/ondV2oZrHsf6ar5+aud+RHQbt7hLnrj/SZTGfl/xH1QCLvTBsfpzjfb
         jp8g==
X-Gm-Message-State: AOAM53341H7nQsprHnExaUvo0g4nAaKGQAzrpaHuG9M8elbQqN9faAtT
        jval+p3kw0x1a57IUpQZOQ==
X-Google-Smtp-Source: ABdhPJwfZVjoQEYwBWYWYQMV8rPUYLIuT27rHbsvZlfzccd2E3as3NEUL2aeGggr9r2cjfZEjlTJaw==
X-Received: by 2002:aca:5047:: with SMTP id e68mr38769oib.175.1603985587865;
        Thu, 29 Oct 2020 08:33:07 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f18sm659090otp.10.2020.10.29.08.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 08:33:07 -0700 (PDT)
Received: (nullmailer pid 1910761 invoked by uid 1000);
        Thu, 29 Oct 2020 15:33:06 -0000
Date:   Thu, 29 Oct 2020 10:33:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Khalil Blaiech <kblaiech@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        wsa+renesas@sang-engineering.com,
        Leon Romanovsky <leonro@nvidia.com>
Subject: Re: [PATCH i2c-next v1 6/6] dt-bindings: i2c: Convert DT file to
 YAML schema
Message-ID: <20201029153306.GA1905314@bogus>
References: <cover.1603925077.git.kblaiech@nvidia.com>
 <77461da87050051e0d2e7decdc9b088ff8738e19.1603925078.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77461da87050051e0d2e7decdc9b088ff8738e19.1603925078.git.kblaiech@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 28, 2020 at 06:55:54PM -0400, Khalil Blaiech wrote:
> Write the devicetree binding text file in schema file, JSON
> compatible subset of YAML.
> Besides, add an entry within MAINTAINERS file.

The subject should contain something about Mellanox BlueField.
> 
> Fixes: d9becc53b3ade81e ("dt-bindings: i2c: I2C binding for Mellanox BlueField SoC")

Fixes is not appropriate for this.

> Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
> ---
>  .../bindings/i2c/mellanox,i2c-mlxbf.txt       | 42 ----------
>  .../bindings/i2c/mellanox,i2c-mlxbf.yaml      | 78 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 79 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> deleted file mode 100644
> index 566ea861aa00..000000000000
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
> -	registers consist of the following set of resources:
> -		1) Smbus block registers.
> -		2) Cause master registers.
> -		3) Cause slave registers.
> -		4) Cause coalesce registers (if compatible isn't set
> -		   to "mellanox,i2c-mlxbf1").
> -
> -- interrupts : interrupt number.
> -
> -Optional Properties:
> -
> -- clock-frequency : bus frequency used to configure timing registers;
> -			allowed values are 100000, 400000 and 1000000;
> -			those are expressed in Hz. Default is 100000.
> -
> -Example:
> -
> -i2c@2804000 {
> -	compatible = "mellanox,i2c-mlxbf1";
> -	reg =	<0x02804000 0x800>,
> -		<0x02801200 0x020>,
> -		<0x02801260 0x020>;
> -	interrupts = <57>;
> -	clock-frequency = <100000>;
> -};
> -
> -i2c@2808800 {
> -	compatible = "mellanox,i2c-mlxbf2";
> -	reg =	<0x02808800 0x600>,
> -	        <0x02808e00 0x020>,
> -		<0x02808e20 0x020>,
> -		<0x02808e40 0x010>;
> -	interrupts = <57>;
> -	clock-frequency = <400000>;
> -};
> diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> new file mode 100644
> index 000000000000..b9f6b07c503f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: GPL-2.0

If you have rights, please dual license adding BSD-2-Clause.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/mellanox,i2c-mlxbf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mellanox I2C SMBus on BlueField SoCs
> +
> +maintainers:
> +  - Khalil Blaiech <kblaiech@nvidia.com>

allOf:
  - $ref: i2c-controller.yaml#

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
> +      maxItems: 1
> +
> +  clock-frequency:
> +      enum: [ 100000, 400000, 1000000 ]
> +

Drop the blank line.

> +      description:
> +        bus frequency used to configure timing registers;
> +        The frequency is expressed in Hz. Default is 100000.
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
> index 9128200af1d0..8dba7ace4a40 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11075,6 +11075,7 @@ MELLANOX BLUEFIELD I2C DRIVER
>  M:	Khalil Blaiech <kblaiech@nvidia.com>
>  L:	linux-i2c@vger.kernel.org
>  S:	Supported
> +F:	Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
>  F:	drivers/i2c/busses/i2c-mlxbf.c
>  
>  MELLANOX ETHERNET DRIVER (mlx4_en)
> -- 
> 2.24.1
> 
