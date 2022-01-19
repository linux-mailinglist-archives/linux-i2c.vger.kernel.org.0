Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53AC2493364
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 04:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351208AbiASDMG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 22:12:06 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:34378 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242118AbiASDME (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 22:12:04 -0500
Received: by mail-oi1-f178.google.com with SMTP id bb37so2072998oib.1;
        Tue, 18 Jan 2022 19:12:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T36W0/c7/6WIDFnkmNkEe3QMM5goPpA7FhofYZ+w+jk=;
        b=54q2U1wOX6JHSzeyMRVJafCrXALaQ4A7x05yWzEhwmSbTXPmN1C+yIBP8+t+3KJGbd
         PlzDiRFmoXdJid3+LSH7NXfLMlQDUyNRJ92MFF6rC4cfkbzR80yCAsvSJMd1SkCD9ZyE
         CAPXgHFtR8VsutSFDR7PlAc81d9Z338GeDpCzl3Lt2uUQQBOPK1Ufj6nL7S860A+NjKm
         eb5FIf1mr+MBdyDunKPORSYXtTvAnSjw+6Bki12ROQPRbhwfnl3+bYK3//nlbhDKMiZB
         V8/3afFfgqfIMqx8I2B+vssctqU3EK3HaMOJ9ZAVFchdFU32vO3l5Q3KVQSScbqEwumU
         izjQ==
X-Gm-Message-State: AOAM532SAAtPMU8QeXw5yVZ9eroywUYXkKNDOoiIxv+lJKOHfnZYbH/2
        HmrOw6y56nckHtoGoVi9rw==
X-Google-Smtp-Source: ABdhPJyL1nK+Jx2KMKjJGywrd4KL+pehx8SA0WoJWt7xG3ZOIBX6D3HE8l5X2mEadPj9VmguflQRgw==
X-Received: by 2002:a05:6808:ecc:: with SMTP id q12mr1344969oiv.122.1642561923892;
        Tue, 18 Jan 2022 19:12:03 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bf18sm5098726oib.5.2022.01.18.19.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 19:12:03 -0800 (PST)
Received: (nullmailer pid 2565710 invoked by uid 1000);
        Wed, 19 Jan 2022 03:12:01 -0000
Date:   Tue, 18 Jan 2022 21:12:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
        bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
        atishp@rivosinc.com
Subject: Re: [PATCH v4 04/14] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Message-ID: <YeeBgQMOg49CXigi@robh.at.kernel.org>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-5-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220117110755.3433142-5-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 17, 2022 at 11:07:45AM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml      | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> new file mode 100644
> index 000000000000..d57460cbe5e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml#
> +
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PolarFire Soc (MPFS) RTC Device Tree Bindings
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +maintainers:
> +  - Daire McNamara <daire.mcnamara@microchip.com>
> +  - Lewis Hanly <lewis.hanly@microchip.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 2

Need to define what each one is.

> +
> +  microchip,prescaler:
> +    description: |
> +      The prescaler divides the input frequency to create a time-based strobe (typically 1 Hz) for
> +      the calendar counter. The Alarm and Compare Registers, in conjunction with the calendar
> +      counter, facilitate time-matched events. To properly operate in Calendar or Binary mode,
> +      the 26-bit prescaler must be programmed to generate a strobe to the RTC.
> +    maxItems: 1
> +    $ref: /schemas/types.yaml#/definitions/uint32

Can't you calculate this based on the clock input freq?

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: rtc
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/microchip,mpfs-clock.h>
> +    rtc@20124000 {
> +        compatible = "microchip,mpfs-rtc";
> +        reg = <0x20124000 0x1000>;
> +        clocks = <&clkcfg CLK_RTC>;
> +        clock-names = "rtc";
> +        interrupts = <80>, <81>;
> +    };
> +...
> -- 
> 2.32.0
> 
> 
