Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E378763CBE
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 18:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbjGZQoQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 12:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbjGZQoP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 12:44:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741492733;
        Wed, 26 Jul 2023 09:44:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EB01461BDD;
        Wed, 26 Jul 2023 16:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788FBC433C7;
        Wed, 26 Jul 2023 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690389843;
        bh=IuVG4bfY9sEvmBWG7GoPfcYL9qrYIvM5Sgjrgb9Q7oQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a3qCJuBPEj4/jMl8xP6lf6bFAM6d4S4uaSBRpZvb9W9rXWkeG3BwJGx1WmSl89w+X
         XbwNDIzaJa1VdFyAaGfYhh44Z/tDMbmek2X1AVk1wEKP6PAhpfFpTwxMU3u/PeSWBW
         Snna3zLh40U1dqxdo6kpPzsLSAWjjNu7f1262Kfxc3DMKX4VS8I/50+88pabw//09I
         Uf8C2YZrdpLYybyq5hQ1gfre3ecVOYbRwQ/pgGXuPlBwEYxnPOj7vd1rz5hLU9ip0M
         tTctjguE4I3xzLRLMMJrOvBdzHdMXTQnidLvIXNpkGW9SRHBv8hYi20P9Q13msxcUu
         RBNlkmLsD4idw==
Received: (nullmailer pid 1566191 invoked by uid 1000);
        Wed, 26 Jul 2023 16:44:01 -0000
Date:   Wed, 26 Jul 2023 10:44:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc:     patrick@stwcx.xyz, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver bindings
Message-ID: <20230726164401.GA1563534-robh@kernel.org>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230724100514.1028061-1-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724100514.1028061-1-Delphine_CC_Chiu@Wiwynn.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 24, 2023 at 06:05:11PM +0800, Delphine CC Chiu wrote:
> Add a device tree bindings for ltc4286 driver.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> ---
>  .../bindings/hwmon/lltc,ltc4286.yaml          | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  9 ++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> new file mode 100644
> index 000000000000..ad7f6ad888e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/lltc,ltc4286.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LTC4286 power monitors
> +
> +maintainers:
> +  - Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - lltc,ltc4286
> +      - lltc,ltc4287
> +
> +  reg:
> +    maxItems: 1
> +
> +  vrange_select_25p6:

Needs a vendor prefix and don't use '_'.

> +    description:
> +      This property is a bool parameter to represent the

We have types, don't define the type in free form text.

> +      voltage range is 25.6 or not for this chip.
> +
> +  shunt-resistor-micro-ohms:
> +    description:
> +      Resistor value in micro-Ohm
> +
> +required:
> +  - compatible
> +  - reg
> +  - shunt-resistor-micro-ohms
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        power-sensor@40 {
> +            compatible = "lltc,ltc4286";
> +            reg = <0x40>;
> +            vrange_select_25p6;
> +            shunt-resistor-micro-ohms = <300>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d516295978a4..7c1cb9bd4f45 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12344,6 +12344,15 @@ S:	Maintained
>  F:	Documentation/hwmon/ltc4261.rst
>  F:	drivers/hwmon/ltc4261.c
>  
> +LTC4286 HARDWARE MONITOR DRIVER
> +M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> +L:	linux-i2c@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> +F:	drivers/hwmon/pmbus/Kconfig
> +F:	drivers/hwmon/pmbus/Makefile
> +F:	drivers/hwmon/pmbus/ltc4286.c
> +
>  LTC4306 I2C MULTIPLEXER DRIVER
>  M:	Michael Hennerich <michael.hennerich@analog.com>
>  L:	linux-i2c@vger.kernel.org
> -- 
> 2.25.1
> 
