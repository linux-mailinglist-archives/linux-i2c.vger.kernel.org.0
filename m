Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49E5D3BEBA
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 23:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389784AbfFJVeb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 17:34:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:48048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389362AbfFJVea (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Jun 2019 17:34:30 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC03E2082E;
        Mon, 10 Jun 2019 21:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560202470;
        bh=xMebwXN/GyhYMfdhbhet847rcu4ugo4s/W4NmLf4QGA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xW0RscP4Ye3TeBt6dOmAo64LuKklTzINsgA8cyr/x4SVHe58NbHfhZYurQfRAo9c8
         ANfCOyxY2V8wVZiPvyZGkB0CpRJnoYDmTc/v/BwYM9gIBCDgkvNFTPfO749i42P6V6
         aM3700j7M8jjiR+SUp9wapGJVVtTS8A0m7Wqc8rc=
Received: by mail-qk1-f180.google.com with SMTP id t8so2683662qkt.1;
        Mon, 10 Jun 2019 14:34:29 -0700 (PDT)
X-Gm-Message-State: APjAAAVppSHHu8wj/35oF7FQHpo/mKa9dU3MUQux9LNMBUK9pxTzUrV9
        Tieuft8gxRSXrppdxOTvJcP0EcM3nMSS2PUYRQ==
X-Google-Smtp-Source: APXvYqwEL3h29iXdplMxo5T/6pDbEAgdZMpmSvMeSRlAfzhBpz2hp3K4ui6kh2oY/xuHwaiAoEipkNAxEcwIm5L27Yc=
X-Received: by 2002:ae9:f801:: with SMTP id x1mr14738098qkh.151.1560202469249;
 Mon, 10 Jun 2019 14:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190605122936.11972-1-maxime.ripard@bootlin.com>
In-Reply-To: <20190605122936.11972-1-maxime.ripard@bootlin.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 10 Jun 2019 15:34:18 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKC7uP0J14A8_CvPhbZkoSRNWSpS1ee+Q4sG013jY=JeQ@mail.gmail.com>
Message-ID: <CAL_JsqKC7uP0J14A8_CvPhbZkoSRNWSpS1ee+Q4sG013jY=JeQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: sun6i-p2wi: Add YAML schemas
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 5, 2019 at 6:29 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Switch the DT binding to a YAML schema to enable the DT validation.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../i2c/allwinner,sun6i-a31-p2wi.yaml         | 71 +++++++++++++++++++
>  .../bindings/i2c/i2c-sun6i-p2wi.txt           | 41 -----------
>  2 files changed, 71 insertions(+), 41 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-sun6i-p2wi.txt
>
> diff --git a/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml b/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
> new file mode 100644
> index 000000000000..780a33080140
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/allwinner,sun6i-a31-p2wi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A31 P2WI (Push/Pull 2 Wires Interface) Device Tree Bindings
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <maxime.ripard@bootlin.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

These 2 are covered by i2c-controller.yaml, right?

> +
> +  compatible:
> +    const: allwinner,sun6i-a31-p2wi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    minimum: 1
> +    maximum: 6000000
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - resets
> +
> +# FIXME: We should set it, but it would report all the generic
> +# properties as additional properties.
> +# additionalProperties: false
> +
> +examples:
> +  - |
> +    p2wi@1f03400 {

i2c@...

That should fail on the schema (I need to get the schema checking of
examples finished.)

> +      compatible = "allwinner,sun6i-a31-p2wi";
> +      reg = <0x01f03400 0x400>;
> +      interrupts = <0 39 4>;
> +      clocks = <&apb0_gates 3>;
> +      clock-frequency = <6000000>;
> +      resets = <&apb0_rst 3>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      axp221: pmic@68 {
> +        compatible = "x-powers,axp221";
> +        reg = <0x68>;
> +      };
> +    };
> +
> +...
