Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 454D7107254
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2019 13:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727744AbfKVMlW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Nov 2019 07:41:22 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43512 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbfKVMlW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Nov 2019 07:41:22 -0500
Received: by mail-lf1-f68.google.com with SMTP id l14so5387784lfh.10
        for <linux-i2c@vger.kernel.org>; Fri, 22 Nov 2019 04:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aeL6ENOX7pztigFjtd4aneRHXGdD9m/NqUguyQGTLcQ=;
        b=EgwPiUU0I/zOww52gVjxSaKx2o+qXH3R59PK7hE2xL8TZS/MFwbq43t+EcPen0Lkrj
         FyFN/fz5tJw0MPZnF1XhtfxfoHVfOaDV9WYgggpKAStLFk4MxL9P90sSiXmlJw2kqiIa
         yuZy/SZlYwXTlmTOYGBELJncgXjOd9oDYrTlDv/O7sifK4TyuZ+onndlwoI1iXVxRtyE
         jzUhMtSafH2S/KqPuImf5kNeNRrkYuxhLq592lw38BbnZfICR7G6VdKsO1ZvXkU+B8Ok
         UjOn4RjZ8g3J8Wj2QTotoZpaBD+/soPDWcAkdu9NhOPymBkH9KDWK5rgDCa4fcGchd9p
         YD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aeL6ENOX7pztigFjtd4aneRHXGdD9m/NqUguyQGTLcQ=;
        b=UU0aHBcHnElzze9H72G1ziSZCP/OMTxUM2+HihKeM2qbWInFC9MiMrzyQKKU+YP6ON
         fYZ5SYcVw18LrHumOvqAHKTS7t9BJESaczzQVmUd5K3WVtM5tnBaJGsWpJabZFvvXP2K
         /p1T/oL6UXwWAYf39RVZk7u4YEidQBtvExqhu+a/LfyZlmtFIcjxLfb05dF0ozvu1IcV
         acJFKeO9ruQPST88hgR79u+GvEUKTriVkqRDsD0FedhR69+uH1O9dGy2eHFmhRvkarOO
         L2dX0daFWnmRDN+CtaskJOOohV0VgifClVItbGPCD1dOjqWbDtsc4xnlX/ckIQ84CACk
         vxJQ==
X-Gm-Message-State: APjAAAUks1/9mg0Z1qrljwDvQZOrFq455AZQw2xtTrPF09IeCfJ/mtP/
        VWtLlpGHcK5PNfS2GmhVQnhM+NFIjGtMcIwOw9Thuw==
X-Google-Smtp-Source: APXvYqwvM+HnA70kweiJuZD0yljMT/J2ZM51jcDKpzNDzzMPs/EFYAFU7+ydsL9uBxG2Gra1GlWlFlip8EGFflf7FVg=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr11533443lfi.93.1574426480231;
 Fri, 22 Nov 2019 04:41:20 -0800 (PST)
MIME-Version: 1.0
References: <20191120142038.30746-1-ktouil@baylibre.com> <20191120142038.30746-2-ktouil@baylibre.com>
In-Reply-To: <20191120142038.30746-2-ktouil@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Nov 2019 13:41:08 +0100
Message-ID: <CACRpkdaZrvPObjyN4kasARzKZ9=PiAcvTzXzWkmC7R+Ay5tU8w@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: nvmem: new optional property write-protect-gpios
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        baylibre-upstreaming@groups.io,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Khouloud,

thanks for your patch!

I just have a semantic comment:

On Wed, Nov 20, 2019 at 3:21 PM Khouloud Touil <ktouil@baylibre.com> wrote:

> Instead of modifying all the memory drivers to check this pin, make
> the NVMEM subsystem check if the write-protect GPIO being passed
> through the nvmem_config or defined in the device tree and pull it
> low whenever writing to the memory.

It is claimed that this should be pulled low to assert it so by
definition it is active low.

> +  wp-gpios:
> +    description:
> +      GPIO to which the write-protect pin of the chip is connected.
> +    maxItems: 1

Mandate that the flag in the second cell should be GPIO_ACTIVE_LOW

>  patternProperties:
>    "^.*@[0-9a-f]+$":
>      type: object
> @@ -66,6 +71,7 @@ examples:
>        qfprom: eeprom@700000 {
>            #address-cells = <1>;
>            #size-cells = <1>;
> +          wp-gpios = <&gpio1 3 0>;

#include <dt-bindings/gpio/gpio.h>
wp-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;

This will in Linux have the semantic effect that you need to
set the output high with gpio_set_val(d, 1) to assert it
(drive it low) but that really doesn't matter to the device tree
bindings, those are OS-agnostic: if the line is active low then
it should use this flag.

It has the upside that the day you need a write-protect that
is active high, it is simple to support that use case too.

Yours,
Linus Walleij
