Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D962587CC
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 08:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgIAGBy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 02:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726212AbgIAGBy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 02:01:54 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB90C0612A3;
        Mon, 31 Aug 2020 23:01:53 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id bo3so11609274ejb.11;
        Mon, 31 Aug 2020 23:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EkupweJqHLfmFCxLHqeG68vNKrHPfrtIjt4kzmPcnsI=;
        b=EyFbK6eF8UZibuQKO0GC9NV71maFJP6Lk1Amk++dT0OGoetZLaE5FVeFT89z08eGzl
         f1A1cfzS6GKc8Cer9n4YrPL6GEjN02/ul1cZdv2y5G8EcfxqJIjRnUb6WJgO5ji7nIOg
         dSiB0q/ear5rjcGRSl54tmtYIBNfyS9v5FTNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EkupweJqHLfmFCxLHqeG68vNKrHPfrtIjt4kzmPcnsI=;
        b=c23WyUwnFtAim9NpfK/fXGtcsYgmKn83EV+r/NK1uGw0CttKoNOEljxMrFDXm5vef3
         tRi2YU8C0Gr+N+FMPt3ZKi8GBZJ1S39wajg9zNOvZDTuZhmSdY24iJYgVm0ZAaQs3JtY
         v2TV2bLwrWlnm9em+Gd75FMaPThaatJl3cSYNRBR8t+3F9XSPs8tbUa/rGGRPGU9PdQn
         WzYZIrRHEBKXTDKG9uiO++UxDtXRJd31lJz7yh3TYP5kAw7cAxhzTt5RT93DzgP9USgX
         ZMZF/HjCVj8Ub7um6/Os+l9KnnHvo0wth0aJr6ak+OssyrTcddSF6+75rOgrY0ZRe279
         IG+Q==
X-Gm-Message-State: AOAM531RrYyonP/LvZrkBsFp6PjmwNc3/pwe4bAv48Qch1UITMEt1I/O
        ODJS7RcpQ06LUBrFYr7WUi7Quq9p0jlZnGmh5G5+rHgaP3k=
X-Google-Smtp-Source: ABdhPJwfJvRaHnwieIAyxhCfgXEjfwjIFQEZOY8ooA0sW1prdZMe1Dgnswd09o3V5KVBKldbrjWf7uszgsVtQBqTa+o=
X-Received: by 2002:a17:906:8401:: with SMTP id n1mr76455ejx.215.1598940112575;
 Mon, 31 Aug 2020 23:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200820161152.22751-1-eajames@linux.ibm.com> <20200820161152.22751-2-eajames@linux.ibm.com>
In-Reply-To: <20200820161152.22751-2-eajames@linux.ibm.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 1 Sep 2020 06:01:39 +0000
Message-ID: <CACPK8Xe6CWgs555t_TCkwv2fZ9Aev9bFH6P8dHYnp9u6Pt0dVg@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: input: Add documentation for IBM
 Operation Panel
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-input@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        dmitry.torokhov@gmail.com, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 20 Aug 2020 at 16:12, Eddie James <eajames@linux.ibm.com> wrote:
>
> Document the bindings for the IBM Operation Panel, which provides
> a simple interface to control a server. It has a display and three
> buttons.
> Also update MAINTAINERS for the new file.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../bindings/input/ibm,op-panel.yaml          | 38 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/ibm,op-panel.yaml
>
> diff --git a/Documentation/devicetree/bindings/input/ibm,op-panel.yaml b/Documentation/devicetree/bindings/input/ibm,op-panel.yaml
> new file mode 100644
> index 000000000000..86a32e8f3ef0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/ibm,op-panel.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/ibm,op-panel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: IBM Operation Panel
> +
> +maintainers:
> +  - Eddie James <eajames@linux.ibm.com>
> +
> +description: |
> +  The IBM Operation Panel provides a simple interface to control the connected
> +  server. It has a display and three buttons: two directional arrows and one
> +  'Enter' button.
> +
> +properties:
> +  compatible:
> +    const: ibm,op-panel
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ibm-op-panel@62 {
> +            compatible = "ibm,op-panel";
> +            reg = <0x40000062>; /* I2C_OWN_SLAVE_ADDRESS */
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ac79fdbdf8d0..a9fd08e9cd54 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8278,6 +8278,12 @@ T:       git git://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git
>  F:     Documentation/ia64/
>  F:     arch/ia64/
>
> +IBM Operation Panel Input Driver
> +M:     Eddie James <eajames@linux.ibm.com>
> +L:     linux-input@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/input/ibm,op-panel.yaml
> +
>  IBM Power 842 compression accelerator
>  M:     Haren Myneni <haren@us.ibm.com>
>  S:     Supported
> --
> 2.26.2
>
