Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6925A172A0E
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2020 22:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729607AbgB0VYF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Feb 2020 16:24:05 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:37787 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgB0VYF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Feb 2020 16:24:05 -0500
Received: by mail-qk1-f194.google.com with SMTP id m9so972167qke.4;
        Thu, 27 Feb 2020 13:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N77TKVc1du/RR7fkaeNaapOclwLjbsmtCdsh94xaY8o=;
        b=pq3kSTGdivzXkiYewbsOQAFUphIxZXuPc8BWS+jHSQUQK08Kf3IpHLyV2Zj4BY9XEH
         SQOQEjZPPGTLKgv/C9ZZdsHYhGg4E9ry1+DzUmPPNq6zQHk77s6LrD7XiSWXx+UUFlmy
         P+Qa7J1bVqINlTnJRifwahJ/qHFndfeveZzXnNCAQ/hjGBU+Qgs6TaZXod7l04SUj223
         ZaIt0pnyFgcib3GVZwfGIHc4oDlAR/JLtgLFFpDDPQKjSNn7AJAqScoJd5LjmdyzFnoF
         wjxXt5PQYlaIy2TK8az0bTt2BoYn26uOcCxMrzL/x/wSUJk7z8hcTtrICx1quc63vjC/
         TYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N77TKVc1du/RR7fkaeNaapOclwLjbsmtCdsh94xaY8o=;
        b=UQUHPdm/9YDUNTua2lAZBkoAqJVkbV33Qjwvqo4WWELVWvLr/OMmi7ItHBHx+yuLYq
         CGhVd5+xZHcsDKHq6uMfmM3D7/bfMiTFcnFt4zAQKI8Zb7fcg7qZ6duD7MnuRIVxkvGP
         8ZLaoSsGCpOvKr5KjLXkd/4L+sj7sdDtrcKz7aE61JrRMQt09c5S1ywt5MbRHuC0+ZOP
         jSVudKjQqcWKZlOxNS0OacifkbwiscLI/CN8LImAU7BZbGTTJARy8nM9deA+4NsNCexa
         VA3l2B/ZBHhMXeGd+uudgDQDFFpRKQBEwbYiNfNbpFIV+sKVj/KTxfc9U0TiJ/FsUzc2
         mwiA==
X-Gm-Message-State: APjAAAXW6/FsE88zo8ZN26mpsw0Sw3V1VskAo33CZC9RopYPHJTV97Z3
        Ap5RUrS3NpAx76vu+88Jal7Omc12a0wa1MM3O9js5dxvuc8=
X-Google-Smtp-Source: APXvYqxTrogPdtXxRfTmdADi01fIogL8GeMzhX5JPj6qB7Oh6w/0R2wssCOYsLliDLUmH89nPEGhKWyukkFe02vhrz0=
X-Received: by 2002:a05:620a:1583:: with SMTP id d3mr1535466qkk.290.1582838643646;
 Thu, 27 Feb 2020 13:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20200227145528.8940-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20200227145528.8940-1-dafna.hirschfeld@collabora.com>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Thu, 27 Feb 2020 22:23:52 +0100
Message-ID: <CAFqH_53sdcXOgQDO7xr51na5yqT_2UULa5M2gfnCmF1HRuTfow@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: cros-ec-tunnel: convert
 i2c-cros-ec-tunnel.txt to yaml
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        helen.koike@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Collabora Kernel ML <kernel@collabora.com>, dafna3@gmail.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dafna,

cc'ing Wolfram and linux-i2c ML

Missatge de Dafna Hirschfeld <dafna.hirschfeld@collabora.com> del dia
dj., 27 de febr. 2020 a les 15:58:
>
> Convert the binding file i2c-cros-ec-tunnel.txt to yaml format.
>
> This was tested and verified on ARM and ARM64 with:
>
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

From my side:

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

We still need Rob's review and as this is a driver in the I2C
subsystem I assume this should go through the Wolfram's tree (note
that was not cc'ied, it is now). I can also pick the patch through
platform-chrome tree if Wolfram is fine.

Thanks,
 Enric

> ---
> Changes since v1:
> - changing the subject to start with "dt-bindings: i2c: cros-ec-tunnel:"
> - changing the license to (GPL-2.0-only OR BSD-2-Clause)
> - removing "Guenter Roeck <groeck@chromium.org>" from the maintainers list
> - adding ref: /schemas/i2c/i2c-controller.yaml
>
> Changes since v2:
> - adding another patch that fixes a warning found by this patch
>
> Changes since v3:
> - In the example, change sbs-battery@b to battery@b
>
> Changes since v4:
> - change the name of the yaml file to google,cros-ec-i2c-tunnel.yaml
> - make the example more complete by adding spi0 as parent and other properties.
>
>  .../i2c/google,cros-ec-i2c-tunnel.yaml        | 69 +++++++++++++++++++
>  .../bindings/i2c/i2c-cros-ec-tunnel.txt       | 39 -----------
>  2 files changed, 69 insertions(+), 39 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
>
> diff --git a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
> new file mode 100644
> index 000000000000..e26c9fc3e33f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/google,cros-ec-i2c-tunnel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: I2C bus that tunnels through the ChromeOS EC (cros-ec)
> +
> +maintainers:
> +  - Benson Leung <bleung@chromium.org>
> +  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> +
> +description: |
> +  On some ChromeOS board designs we've got a connection to the EC (embedded
> +  controller) but no direct connection to some devices on the other side of
> +  the EC (like a battery and PMIC). To get access to those devices we need
> +  to tunnel our i2c commands through the EC.
> +  The node for this device should be under a cros-ec node like google,cros-ec-spi
> +  or google,cros-ec-i2c.
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const:
> +      google,cros-ec-i2c-tunnel
> +
> +  google,remote-bus:
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    description: The EC bus we'd like to talk to.
> +
> +  "#address-cells": true
> +  "#size-cells": true
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    type: object
> +    description: One node per I2C device connected to the tunnelled I2C bus.
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - google,remote-bus
> +
> +examples:
> +  - |
> +    spi0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        cros-ec@0 {
> +            compatible = "google,cros-ec-spi";
> +            reg = <0>;
> +
> +            i2c-tunnel {
> +                compatible = "google,cros-ec-i2c-tunnel";
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                google,remote-bus = <0>;
> +
> +                battery: battery@b {
> +                    compatible = "sbs,sbs-battery";
> +                    reg = <0xb>;
> +                    sbs,poll-retry-count = <1>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt b/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
> deleted file mode 100644
> index 898f030eba62..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -I2C bus that tunnels through the ChromeOS EC (cros-ec)
> -======================================================
> -On some ChromeOS board designs we've got a connection to the EC (embedded
> -controller) but no direct connection to some devices on the other side of
> -the EC (like a battery and PMIC).  To get access to those devices we need
> -to tunnel our i2c commands through the EC.
> -
> -The node for this device should be under a cros-ec node like google,cros-ec-spi
> -or google,cros-ec-i2c.
> -
> -
> -Required properties:
> -- compatible: google,cros-ec-i2c-tunnel
> -- google,remote-bus: The EC bus we'd like to talk to.
> -
> -Optional child nodes:
> -- One node per I2C device connected to the tunnelled I2C bus.
> -
> -
> -Example:
> -       cros-ec@0 {
> -               compatible = "google,cros-ec-spi";
> -
> -               ...
> -
> -               i2c-tunnel {
> -                       compatible = "google,cros-ec-i2c-tunnel";
> -                       #address-cells = <1>;
> -                       #size-cells = <0>;
> -
> -                       google,remote-bus = <0>;
> -
> -                       battery: sbs-battery@b {
> -                               compatible = "sbs,sbs-battery";
> -                               reg = <0xb>;
> -                               sbs,poll-retry-count = <1>;
> -                       };
> -               };
> -       }
> --
> 2.17.1
>
