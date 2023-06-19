Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4381735A9C
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 17:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbjFSPDJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 11:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231927AbjFSPCL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 11:02:11 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1B61708;
        Mon, 19 Jun 2023 08:00:12 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-988aefaa44eso170759766b.2;
        Mon, 19 Jun 2023 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687186811; x=1689778811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiiEoNrCBq/D8BQO7z0ZPx5RZ8Us0dHWQShmtLe8nEM=;
        b=R7nGJK2Y0+ZA8BAdNYcFNEUIyAHaCyrkBj34UL6yLovvs3CyjPJCRprXy4AqtLUTsF
         0ufBxyFRNggrQi3a+wmF9s/pZvqIv653gt8Ai/+1rRYX0hSZ4WAciaDlVWx/fbdwOgA6
         vlOdky80VUCADQ8mbv654CzsdTtDuzz8Z2XODC2yjhzGe5TY+hsFjtamJGI5MSkAiL0P
         Y4T3N39zZDu7mQWb4USfi+wOn0yn1VNnjM7TnAbS6kDl/6Fg2rPjmLzNaQjynhxm9QwC
         A7SNv3zB+WUlCxKAbpz9yfX9AiOx9gzhjdQnEcQrQk/B25eMz3/SDjWw+s4uYAUzwbEX
         DXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687186811; x=1689778811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XiiEoNrCBq/D8BQO7z0ZPx5RZ8Us0dHWQShmtLe8nEM=;
        b=aWpPxENle8TIQKa1m81JzsPAD57xJRiqKh+ScCJh8z6Cyp9t+OZOR2xyHYS6hg13Lq
         p1dR+eRNioOTJhn2du4Tvv3K035n2Mz8drC0soA9c0TdHtfJdPWoI1NtYmAZInx6Ntpy
         uew8/JFMV+t0BUGEJSRUdspvVKyCZrOcWqnhdVr6+Sg0P8UXE4RoM50jNmIAVWFtPIUq
         nOKFYzZljOUPGg7cBZccaq6Q1+QlkUYd6K9LfPP/WAvEVqeMKDOnUvdvqZmVaQrLtVfg
         nXrUIVYW1jQrTmrolx6uwjIQIg3UZtlWrkzmnXQ+xJXrCD+3XSnl/x7z8WKotKvVDtr+
         aVtw==
X-Gm-Message-State: AC+VfDzzSF/B//L9f9gW5ZNlAlQ8AHQLorCkrmSBI3a4+SIDLLFjlTWD
        1dTLJhb/bxHCv/rVWO6JmDMDNPXb0yn5FNosRiw=
X-Google-Smtp-Source: ACHHUZ6hDSmyBD7fnePcBzx3tekTYCP6JOpOOM4IpE/3fmhxPgPKdLxtA9rubTaXI7OVSbB5JrMLGEEEUlXoUs95kDM=
X-Received: by 2002:a17:906:eecd:b0:973:da59:7c91 with SMTP id
 wu13-20020a170906eecd00b00973da597c91mr9197497ejb.51.1687186811048; Mon, 19
 Jun 2023 08:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230619143611.24482-1-clamor95@gmail.com> <20230619143611.24482-2-clamor95@gmail.com>
 <f26edf98-617f-cb37-d34d-497fce5e0867@linaro.org>
In-Reply-To: <f26edf98-617f-cb37-d34d-497fce5e0867@linaro.org>
From:   Svyatoslav Ryhel <clamor95@gmail.com>
Date:   Mon, 19 Jun 2023 17:59:59 +0300
Message-ID: <CAPVz0n306RgVcHfTjsgz-r6FJCh2QZfR4-2Ah4nH48ZvahFp1g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: add binding for i2c-hotplug-gpio
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=D0=BF=D0=BD, 19 =D1=87=D0=B5=D1=80=D0=B2. 2023=E2=80=AF=D1=80. =D0=BE 17:4=
5 Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 19/06/2023 16:36, Svyatoslav Ryhel wrote:
> > Document device tree schema which describes hot-pluggable via GPIO
> > i2c bus.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/i2c/i2c-hotplug-gpio.yaml        | 68 +++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-hotplug-g=
pio.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yam=
l b/Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
> > new file mode 100644
> > index 000000000000..74544687a2b8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
> > @@ -0,0 +1,68 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/i2c-hotplug-gpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: GPIO detected hot-plugged I2C bus
> > +
> > +maintainers:
> > +  - Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > +
> > +description: |
>
> Do not need '|' unless you need to preserve formatting.
>
> > +  Driver for hot-plugged I2C buses, where some devices on a bus
> > +  are hot-pluggable and their presence is indicated by GPIO line.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^i2c-(.*)?"
>
> Drop
>
> > +
> > +  compatible:
> > +    items:
> > +      - const: i2c-hotplug-gpio
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  interrupts-extended:
> > +    minItems: 1
> > +
> > +  detect-gpios:
> > +    maxItems: 1
> > +
> > +  i2c-parent:
> > +    maxItems: 1
>
> I don't understand this part. You built it as a complimentary device to
> the I2C controller, but there is no such device as "hotplug I2C", right?
> The GPIO is part of the controller and this is imaginary (virtual) device=
?
>
> Otherwise, where does the "detect-gpios" go? To the SoC? Then it is not
> a real device...
>

This is basically GPIO controlled i2c bus duplication. Transformer has
2 ECs, one for pad and one for dock. They both are present on the i2c
bus, but the dock is not always present. Its presence is determined by
a GPIO.

Once a dock is present, GPIO triggers bus duplication and all devices
described on that bus are probed, same when detaching the dock.
Detecting GPIO and interrupt GPIO is the same GPIO.

> > +
> > +required:
> > +  - compatible
> > +  - "#address-cells"
> > +  - "#size-cells"
>
> Use consistent quotes (' or ").
>
> > +  - interrupts-extended
> > +  - detect-gpios
> > +  - i2c-parent
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    /*
> > +     * Asus Transformers use I2C hotplug for attachable dock keyboard
> > +     */
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c-dock {
> > +        compatible =3D "i2c-hotplug-gpio";
> > +
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        interrupts-extended =3D <&gpio 164 IRQ_TYPE_EDGE_BOTH>;
> > +        detect-gpios =3D <&gpio 164 1>;
>
> You forgot define.
>

Define GPIO name or high/low? May you specify?

Best regards,
Svyatoslav R.

> > +
> > +        i2c-parent =3D <&{/i2c@7000c400}>;
>
> Use normal phandles/labels like entire DTS, not full paths or node names.
>
> > +    };
> > +...
>
> Best regards,
> Krzysztof
>
