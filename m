Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 670F83D5CA3
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jul 2021 17:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbhGZO1y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jul 2021 10:27:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:59570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234925AbhGZOZu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 26 Jul 2021 10:25:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8C7160F5A;
        Mon, 26 Jul 2021 15:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627311977;
        bh=R7MPYQnCJsG4fwhF0u+zeh0a/cBUeZfS0iP3V5ZDZHs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=b1Vix8NWuhvx4Q3pmG2tfftmmJzpSqffx+Ena5rVF6w+9YlJ2LHqt3MI4fprMvysm
         Hw//UXufJgfEuEQRisRQeWNM4WwAf3YrdYsh7W16QoRLV/GOWwswTvrY0KSHFGeb3x
         X2/wmeBcfc5nWsbKaBSxEf4ZMFe90GwdUNjdPcXcoewd3pxp998jQ1cnwnOm/Vw30q
         Yw5g09PZb3chZKrDWBaIHTdnaFtFc4eYsO5D82gh6wapPk5OB0jzWwYCmjt2d97rnj
         4Au90QFhzTJlWYf1DDSLED8mhW4trOCaw3Xk9ZQnAgjAulv5ELq/+/TcwzotC5o07l
         6BICNVOv+eACA==
Received: by mail-ej1-f48.google.com with SMTP id nb11so16957976ejc.4;
        Mon, 26 Jul 2021 08:06:17 -0700 (PDT)
X-Gm-Message-State: AOAM533wxIfwkyR4EoZUhwnL7Z/cW6P3PlgZae2J6W3ASF9nDMM02UoC
        4j7q0JCmJwE03feERLSCubbygi4/Jwl0YNeNEw==
X-Google-Smtp-Source: ABdhPJwwWICG++z75Hxvtq0N/g+sjBEODxNxt0nefCKbjiFba0jZlqxerC/yhL1o1fRHzDPTuM0kWe53k7yKt0DMP1A=
X-Received: by 2002:a17:906:b750:: with SMTP id fx16mr10994131ejb.108.1627311976354;
 Mon, 26 Jul 2021 08:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627273794.git.viresh.kumar@linaro.org> <4182aff2d1437b30025f3d17d11e5fdc21845239.1627273794.git.viresh.kumar@linaro.org>
In-Reply-To: <4182aff2d1437b30025f3d17d11e5fdc21845239.1627273794.git.viresh.kumar@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 26 Jul 2021 09:06:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKz6fNCrKium0EMW0Y8_1_fymr6BMnuBS1NnV_7PO236A@mail.gmail.com>
Message-ID: <CAL_JsqKz6fNCrKium0EMW0Y8_1_fymr6BMnuBS1NnV_7PO236A@mail.gmail.com>
Subject: Re: [PATCH V3 2/5] dt-bindings: i2c: Add bindings for i2c-virtio
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jie Deng <jie.deng@intel.com>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" 
        <virtualization@lists.linux-foundation.org>,
        Wolfram Sang <wsa@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jul 25, 2021 at 10:52 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> This patch adds binding for virtio I2C device, it is based on
> virtio-device bindings.
>
> Acked-by: Wolfram Sang <wsa@kernel.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  .../devicetree/bindings/i2c/i2c-virtio.yaml   | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml b/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
> new file mode 100644
> index 000000000000..0381d9065287
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-virtio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Virtio I2C Adapter
> +
> +maintainers:
> +  - Viresh Kumar <viresh.kumar@linaro.org>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +  - $ref: /schemas/virtio/virtio-device.yaml#
> +
> +description:
> +  Virtio I2C device, see /schemas/virtio/virtio-device.yaml for more details.
> +
> +properties:
> +  $nodename:
> +    pattern: '^i2c-virtio(-[a-z0-9]+)?$'

i2c-controller.yaml already defines the node name. In this case
though, it can be restricted a bit more to be just 'i2c' as there's
only a single instance.

> +
> +  compatible:
> +    const: virtio,22
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    virtio@3000 {
> +        compatible = "virtio,mmio";
> +        reg = <0x3000 0x100>;
> +        interrupts = <41>;
> +
> +        i2c-virtio {
> +            compatible = "virtio,22";
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            light-sensor@1c {
> +                compatible = "dynaimage,al3320a";
> +                reg = <0x20>;
> +            };
> +        };
> +    };
> +
> +...
> --
> 2.31.1.272.g89b43f80a514
>
