Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF7A4AA350
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 23:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351726AbiBDWmW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 17:42:22 -0500
Received: from mail-oo1-f43.google.com ([209.85.161.43]:40757 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237110AbiBDWmV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 17:42:21 -0500
Received: by mail-oo1-f43.google.com with SMTP id u47-20020a4a9732000000b00316d0257de0so3379982ooi.7;
        Fri, 04 Feb 2022 14:42:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lP3WE7JtivIbbn6LHF0khOL4rKdYsCSiJsD462pPHBY=;
        b=neJH8zuFsVNhZkwllR7i2AIqk3KXzAwBysl1hQjuQUXivvPzHzsLdcM1BTXWcbdBn4
         zLj4TjgJoFz+RWfpFtBWCM0B0CA4jVaGTW92g2YbNTdYoyMLsv/EXsPQie3VLWtHvq+u
         gQdXYidOs3olPfEJPIOsKGMam4L0/AtjYychyfrcJ1OEd/es1r7mkNU1LtEuhGsiRI52
         MVuHsUHarAOu+MRBUmOpNoDgO8x/P975gvJf6htfnx9ao61eFH3cDCQoiXKsjZjfZNg1
         cgsTgvovjnlAnxjr+00gQJUR0ALov5HKW9MczKltxEAmxRXDxJbuTnnue+4pWAAlcKqL
         sttQ==
X-Gm-Message-State: AOAM5327fbCHAm3jLGv/iE2J7Q+8GWK+eIz8MN0DczZrna/h7bk2JmYX
        G4tmZeGsuJIxEfIVZHB0TA==
X-Google-Smtp-Source: ABdhPJxVaf+4ZTBMzOJSreSX+RID7NpMWwfoG41VUga8SLqyOukGfB/pJ1h/HM5rXCQJ3mZO+Jze8w==
X-Received: by 2002:a05:6870:a2d6:: with SMTP id w22mr299541oak.25.1644014541095;
        Fri, 04 Feb 2022 14:42:21 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bb16sm1307877oob.42.2022.02.04.14.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 14:42:20 -0800 (PST)
Received: (nullmailer pid 3318547 invoked by uid 1000);
        Fri, 04 Feb 2022 22:42:19 -0000
Date:   Fri, 4 Feb 2022 16:42:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, jassisinghbrar@gmail.com,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        lee.jones@linaro.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, geert@linux-m68k.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-riscv@lists.infradead.org, krzysztof.kozlowski@canonical.com,
        bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
        atishp@rivosinc.com
Subject: Re: [PATCH v5 02/12] dt-bindings: soc/microchip: add services as
 children of sys ctrlr
Message-ID: <Yf2ry0ATtYnb5TTx@robh.at.kernel.org>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
 <20220131114726.973690-3-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131114726.973690-3-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 31, 2022 at 11:47:17AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add mpfs-rng and mpfs-generic-services as children of the system
> controller.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip,mpfs-sys-controller.yaml        | 41 ++++++++++++++++++-
>  1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> index f699772fedf3..5e9977bc114e 100644
> --- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> @@ -13,7 +13,6 @@ description: |
>    The PolarFire SoC system controller is communicated with via a mailbox.
>    This document describes the bindings for the client portion of that mailbox.
>  
> -
>  properties:
>    mboxes:
>      maxItems: 1
> @@ -21,6 +20,38 @@ properties:
>    compatible:
>      const: microchip,mpfs-sys-controller
>  
> +  rng:
> +    type: object
> +
> +    description: |
> +      The hardware random number generator on the Polarfire SoC is
> +      accessed via the mailbox interface provided by the system controller
> +
> +    properties:
> +      compatible:
> +        const: microchip,mpfs-rng
> +
> +    required:
> +      - compatible
> +
> +  sysserv:
> +    type: object
> +
> +    description: |
> +      The PolarFire SoC system controller is communicated with via a mailbox.
> +      This binding represents several of the functions provided by the system
> +      controller which do not belong in a specific subsystem, such as reading
> +      the fpga device certificate, all of which follow the same format:
> +        - a command + optional payload sent to the sys controller
> +        - a status + a payload returned to Linux
> +
> +    properties:
> +      compatible:
> +        const: microchip,mpfs-generic-service
> +
> +    required:
> +      - compatible
> +
>  required:
>    - compatible
>    - mboxes
> @@ -29,7 +60,13 @@ additionalProperties: false
>  
>  examples:
>    - |
> -    syscontroller: syscontroller {
> +    syscontroller {
>        compatible = "microchip,mpfs-sys-controller";
>        mboxes = <&mbox 0>;
> +      rng: rng {
> +        compatible = "microchip,mpfs-rng";
> +      };
> +      sysserv: sysserv {
> +        compatible = "microchip,mpfs-generic-service";
> +      };

You don't have any resources for the child nodes, so they don't need to 
be in DT. Just have the driver for "microchip,mpfs-sys-controller" 
create the sub devices you need.

Rob
