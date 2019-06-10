Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2CF3BEC9
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 23:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390101AbfFJVha (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 17:37:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:50266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389945AbfFJVha (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Jun 2019 17:37:30 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0EF8E21726;
        Mon, 10 Jun 2019 21:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560202649;
        bh=hwm8BXVTPPx56RnHFISfVUzMMTFIzzDuJaCG9+g8A5k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=laDVFiBGqi4HuwrxOrPSUFr6iNx7cckBOF3iE9QdnfxoGGGeoEPCdNKzj4QkFP23z
         DivEeiNVuOf+3/MvBWPQIkLl98lCMMYjCwh2UZsFE3jvGNYKsVatSnUKCR5k9nVitC
         XeSH4bYbYDfs6TfRdk6jky3jOonHiVIjO6hVzr60=
Received: by mail-qk1-f178.google.com with SMTP id i125so6361217qkd.6;
        Mon, 10 Jun 2019 14:37:29 -0700 (PDT)
X-Gm-Message-State: APjAAAWvdpxndq10RMZGfwq5DWvfM9UHiB3KyKrAhU5eOQT5xagomMhL
        bjUrDDr85qyEfa+cwVQgFEuGwyAkhQK8pQ/Z+g==
X-Google-Smtp-Source: APXvYqygsQhHn+elnNZkh5cIWQUh8MlS+1h6UE8ebNU+fyz9UgkZS9LgE7CVDY0+GOg9rWGc9YTlLMA4WDHOl+KXPmA=
X-Received: by 2002:a05:620a:13d1:: with SMTP id g17mr2386998qkl.121.1560202648317;
 Mon, 10 Jun 2019 14:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190605122936.11972-1-maxime.ripard@bootlin.com> <20190605122936.11972-2-maxime.ripard@bootlin.com>
In-Reply-To: <20190605122936.11972-2-maxime.ripard@bootlin.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 10 Jun 2019 15:37:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJczoTpq=8BS5FwL3TJmitZp9e4Mh4oXcvgOMdRmoURvQ@mail.gmail.com>
Message-ID: <CAL_JsqJczoTpq=8BS5FwL3TJmitZp9e4Mh4oXcvgOMdRmoURvQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: mv64xxx: Add YAML schemas
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
>
> ---
>
> Changes from v1:
>   - Fix the maintainers
> ---
>  .../devicetree/bindings/i2c/i2c-mv64xxx.txt   |  64 -----------
>  .../bindings/i2c/marvell,mv64xxx-i2c.yaml     | 105 ++++++++++++++++++
>  2 files changed, 105 insertions(+), 64 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mv64xxx.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml

> diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> new file mode 100644
> index 000000000000..a1c631eaeafd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell MV64XXX I2C Controller Device Tree Bindings
> +
> +maintainers:
> +  - Gregory CLEMENT <gregory.clement@bootlin.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: allwinner,sun4i-a10-i2c
> +      - items:
> +          - const: allwinner,sun7i-a20-i2c
> +          - const: allwinner,sun4i-a10-i2c
> +      - const: allwinner,sun6i-a31-i2c
> +      - items:
> +          - const: allwinner,sun8i-a23-i2c
> +          - const: allwinner,sun6i-a31-i2c
> +      - items:
> +          - const: allwinner,sun8i-a83t-i2c
> +          - const: allwinner,sun6i-a31-i2c
> +      - items:
> +          - const: allwinner,sun50i-a64-i2c
> +          - const: allwinner,sun6i-a31-i2c
> +
> +      - const: marvell,mv64xxx-i2c
> +      - const: marvell,mv78230-i2c
> +      - const: marvell,mv78230-a0-i2c
> +
> +    description:
> +      Only use "marvell,mv78230-a0-i2c" for a very rare, initial
> +      version of the SoC which had broken offload support. Linux
> +      auto-detects this and sets it appropriately.
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description: Reference clock for the I2C bus
> +      - description: Bus clock (Only for Armada 7K/8K)
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: core
> +      - const: reg
> +    description:
> +      Mandatory if two clocks are used (only for Armada 7k and 8k).
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - allwinner,sun4i-a10-i2c
> +              - allwinner,sun6i-a31-i2c
> +
> +    then:
> +      required:
> +        - clocks
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun6i-a31-i2c
> +
> +    then:
> +      required:
> +        - resets
> +
> +# FIXME: We should set it, but it would report all the generic
> +# properties as additional properties.
> +# additionalProperties: false
> +
> +examples:
> +  - |
> +    timer {

timer?

(and missing unit-address)

> +      compatible = "allwinner,sun4i-a10-timer";
> +      reg = <0x01c20c00 0x400>;
> +      interrupts = <22>;
> +      clocks = <&osc>;
> +    };
> +...
> --
> 2.21.0
>
