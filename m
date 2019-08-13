Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A43B48BF8D
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 19:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbfHMRXK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 13:23:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:44454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726094AbfHMRXK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Aug 2019 13:23:10 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 970252085A;
        Tue, 13 Aug 2019 17:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565716989;
        bh=oEIyygQpeyc5lZgtguO481uQtwKNligWTCld8t/UPMM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pMsDao8Lhb4JfOY1tLFQq5Ki+A5JURQhuKVcQ63i/PvYhoxIo18eDqbP5YKmZLM9J
         1878SYWfxEDBVeouUdV2EjM3gBEHanSuEO3CJqzrDA0fDqloDKxr0EJEpxZlJA/K1R
         COr8q9noK7pTdlLQRxqEnBeFF+PzwdKaesbCuGWw=
Received: by mail-qt1-f179.google.com with SMTP id b11so7342585qtp.10;
        Tue, 13 Aug 2019 10:23:09 -0700 (PDT)
X-Gm-Message-State: APjAAAVZoCMa6hwDadyvSfrmdFY9ZvuAIRP8ALP5cYySUP4Lu/QsGa/t
        U+vFunGAr/ok+b0fwPBqjMQZCNyAmS5VHrPXLA==
X-Google-Smtp-Source: APXvYqy2+6R8b2VmAb1mm1zXL0U2rDdmV0wVqEBWCEyUZTZp0W4z8AS8GmE6aw8CLPCiSVKucGkFVT4q+0lMBjKid1Y=
X-Received: by 2002:ac8:44c4:: with SMTP id b4mr23403904qto.224.1565716988767;
 Tue, 13 Aug 2019 10:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net> <1565713248-4906-10-git-send-email-wahrenst@gmx.net>
In-Reply-To: <1565713248-4906-10-git-send-email-wahrenst@gmx.net>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 13 Aug 2019 11:22:56 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+01vXQpf_ZuAvetWvcGLhK4EiiB1qFqhRkM3PQWAzdsA@mail.gmail.com>
Message-ID: <CAL_Jsq+01vXQpf_ZuAvetWvcGLhK4EiiB1qFqhRkM3PQWAzdsA@mail.gmail.com>
Subject: Re: [PATCH V2 09/13] dt-bindings: arm: Convert BCM2835 board/soc
 bindings to json-schema
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 13, 2019 at 10:21 AM Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Convert the BCM2835/6/7 SoC bindings to DT schema format using json-schema.
> All the other Broadcom boards are maintained by Florian Fainelli.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Acked-by: Eric Anholt <eric@anholt.net>
> ---
>  .../devicetree/bindings/arm/bcm/bcm2835.yaml       | 46 +++++++++++++++
>  .../devicetree/bindings/arm/bcm/brcm,bcm2835.txt   | 67 ----------------------
>  2 files changed, 46 insertions(+), 67 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
>  delete mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt
>
> diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
> new file mode 100644
> index 0000000..1a4be26
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/bcm/bcm2835.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM2711/BCM2835 Platforms Device Tree Bindings
> +
> +maintainers:
> +  - Eric Anholt <eric@anholt.net>
> +  - Stefan Wahren <wahrenst@gmx.net>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: BCM2835 based Boards
> +        items:
> +          - enum:
> +              - raspberrypi,model-a
> +              - raspberrypi,model-a-plus
> +              - raspberrypi,model-b
> +              - raspberrypi,model-b-i2c0  # Raspberry Pi Model B (no P5)
> +              - raspberrypi,model-b-rev2
> +              - raspberrypi,model-b-plus
> +              - raspberrypi,compute-module
> +              - raspberrypi,model-zero
> +              - raspberrypi,model-zero-w
> +          - const: brcm,bcm2835
> +
> +      - description: BCM2836 based Boards
> +        items:
> +          - enum:
> +              - raspberrypi,2-model-b

Don't you need brcm,bcm2836 here?

> +
> +      - description: BCM2837 based Boards
> +        items:
> +          - enum:
> +              - raspberrypi,3-model-a-plus
> +              - raspberrypi,3-model-b
> +              - raspberrypi,3-model-b-plus
> +              - raspberrypi,3-compute-module
> +              - raspberrypi,3-compute-module-lite

Don't you need brcm,bcm2837 here?

Please run 'dtbs_check' and make sure there aren't warnings (in the root node).

Rob
