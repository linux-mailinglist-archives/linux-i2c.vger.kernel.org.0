Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43F596EE667
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 19:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234183AbjDYRNw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 13:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbjDYRNv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 13:13:51 -0400
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B73E71;
        Tue, 25 Apr 2023 10:13:50 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6a5d9853d97so2373749a34.2;
        Tue, 25 Apr 2023 10:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682442829; x=1685034829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yzu6w9WOniFz1mjvEavwP3dT0w7oV2bISDbejOiYeZA=;
        b=b8dsZ8VfXDXdLr7lQncoFnaSADO+PVBY44TKer/wLhyNz1lNXMYFDbGTkDqpX8vI47
         2vxhAn2h8mOYSBl9WojMJg8Dgk0qmEk32iBGfKL80A1Vduuv8+iBgyokMJef0AclE6wJ
         XFjhRJbw2gN8v/NJJgx0IgdTcmVM/cehkiDNK5wvnKEHD/7uVQUjZ3/IFNI7bzzSSGn+
         3eHwDDtN/DpqeC0d8UpbbhizSvnx3yqTT0Ki7fsP6N1kDJpSf8l2/7yfRqXAcOBPEj9f
         119dyYzqbq6ZjW3rsoOEYRBe7KGlFfAek1ktPW7HZ+4J1e9dv6xZ7tJWegL6WnSQpHcE
         OR2A==
X-Gm-Message-State: AAQBX9fnmFa+D4MkhVg9C/3hSTLS4Xm9LiLvK1FabKquP3v/0MTuJ89R
        mqiIAXNyi7h8dG2NuPFzYg==
X-Google-Smtp-Source: AKy350Y2kbdxu9Z5by25+Rh6mkLY+QutedR8tWOFNqfj0abmqbfqHg4Rk0DUbGR2ka/sbWFhMUzc3w==
X-Received: by 2002:aca:2816:0:b0:38e:f0c4:2106 with SMTP id 22-20020aca2816000000b0038ef0c42106mr2332695oix.5.1682442829177;
        Tue, 25 Apr 2023 10:13:49 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g4-20020a0568080dc400b0038e4c6fb8e0sm5792314oic.58.2023.04.25.10.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 10:13:48 -0700 (PDT)
Received: (nullmailer pid 1966662 invoked by uid 1000);
        Tue, 25 Apr 2023 17:13:47 -0000
Date:   Tue, 25 Apr 2023 12:13:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v11 1/7] i2c: add I2C Address Translator (ATR) support
Message-ID: <20230425171347.GB1957523-robh@kernel.org>
References: <20230421101833.345984-1-tomi.valkeinen@ideasonboard.com>
 <20230421101833.345984-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421101833.345984-2-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Apr 21, 2023 at 01:18:27PM +0300, Tomi Valkeinen wrote:
> From: Luca Ceresoli <luca@lucaceresoli.net>
> 
> An ATR is a device that looks similar to an i2c-mux: it has an I2C
> slave "upstream" port and N master "downstream" ports, and forwards
> transactions from upstream to the appropriate downstream port. But it
> is different in that the forwarded transaction has a different slave
> address. The address used on the upstream bus is called the "alias"
> and is (potentially) different from the physical slave address of the
> downstream chip.
> 
> Add a helper file (just like i2c-mux.c for a mux or switch) to allow
> implementing ATR features in a device driver. The helper takes care or
> adapter creation/destruction and translates addresses at each transaction.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  .../devicetree/bindings/i2c/i2c-atr.yaml      |  34 +
>  Documentation/i2c/i2c-address-translators.rst |  96 +++
>  Documentation/i2c/index.rst                   |   1 +
>  MAINTAINERS                                   |   8 +
>  drivers/i2c/Kconfig                           |   9 +
>  drivers/i2c/Makefile                          |   1 +
>  drivers/i2c/i2c-atr.c                         | 684 ++++++++++++++++++
>  include/linux/i2c-atr.h                       | 116 +++
>  8 files changed, 949 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-atr.yaml
>  create mode 100644 Documentation/i2c/i2c-address-translators.rst
>  create mode 100644 drivers/i2c/i2c-atr.c
>  create mode 100644 include/linux/i2c-atr.h
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-atr.yaml b/Documentation/devicetree/bindings/i2c/i2c-atr.yaml
> new file mode 100644
> index 000000000000..d7f73d98110d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-atr.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-atr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common i2c address translator properties.

Drop hard stop.

> +
> +maintainers:
> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> +
> +description:
> +  An I2C Address Translator (ATR) is a device with an I2C slave parent
> +  ("upstream") port and N I2C master child ("downstream") ports, and
> +  forwards transactions from upstream to the appropriate downstream port
> +  with a modified slave address. The address used on the parent bus is
> +  called the "alias" and is (potentially) different from the physical
> +  slave address of the child bus. Address translation is done by the
> +  hardware.
> +
> +properties:
> +  i2c-alias-pool:
> +    $ref: /schemas/types.yaml#/definitions/uint16-array

We do support some flags in the upper 16-bits of I2C addresses. Any of 
those possibly needed here?

> +    description:
> +      I2C alias pool is a pool of I2C addresses on the main I2C bus that can be
> +      used to access the remote peripherals on the serializer's I2C bus. The
> +      addresses must be available, not used by any other peripheral. Each
> +      remote peripheral is assigned an alias from the pool, and transactions to
> +      that address will be forwarded to the remote peripheral, with the address
> +      translated to the remote peripheral's real address. This property is not
> +      needed if there are no I2C addressable remote peripherals.
> +
> +additionalProperties: true
> +...

