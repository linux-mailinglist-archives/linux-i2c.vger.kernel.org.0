Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7052423A39
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 16:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391640AbfETOhB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 10:37:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:54490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730966AbfETOhB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 May 2019 10:37:01 -0400
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1710C21721;
        Mon, 20 May 2019 14:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558363020;
        bh=knrqwf5MAsU6lMqPaPAX06elGTJ1YYogOCMk0BvpCBs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=f+g3cxGKZSYjQDxSwzvKTrnbkxGEz0+zDhjdW6xxHIddsfd3cH3pdiRKSsYEs5Syo
         0mu+TLKXYy+EBgR4SPTNArk/zXFRGLxmARAIU1hSJ0JlhaqJq0XOylTb7v+I+4F/B/
         am2ErhBpPKCK8CBWVUsqov+2h6WyoDKvJWy48JO4=
Received: by mail-qk1-f181.google.com with SMTP id a64so8947613qkg.5;
        Mon, 20 May 2019 07:37:00 -0700 (PDT)
X-Gm-Message-State: APjAAAU7Wz/LAMF89TK39hx3ypY9zFiA5cIcQFEAyrT+UMpcIVB5qi3W
        DiJW0pMfBJY6fVCTtjCjeFuZ9+HD4g+fmgd4ag==
X-Google-Smtp-Source: APXvYqwOf9Z8nbXUZPSOt15qYtcOeclLXjXToptke87YGvm4/v/PJxK1Ifu47Dtn/ZUAoLrSKRzG6YspjAeBF/yeABM=
X-Received: by 2002:a37:a8d7:: with SMTP id r206mr46423501qke.264.1558363019267;
 Mon, 20 May 2019 07:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <1558361478-4381-1-git-send-email-sagar.kadam@sifive.com> <1558361478-4381-2-git-send-email-sagar.kadam@sifive.com>
In-Reply-To: <1558361478-4381-2-git-send-email-sagar.kadam@sifive.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 20 May 2019 09:36:48 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+6uL+wqi=5cp1X9JdBfmLDzGz5UjwfqKCCESyhsemnhQ@mail.gmail.com>
Message-ID: <CAL_Jsq+6uL+wqi=5cp1X9JdBfmLDzGz5UjwfqKCCESyhsemnhQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: i2c: extend existing opencore bindings.
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, peter@korsgaard.com,
        Andrew Lunn <andrew@lunn.ch>,
        Palmer Dabbelt <palmer@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 20, 2019 at 9:12 AM Sagar Shrikant Kadam
<sagar.kadam@sifive.com> wrote:
>
> Add FU540-C000 specific device tree bindings to already
> available i2-ocores file. This device is available on
> HiFive Unleashed Rev A00 board. Move interrupt and interrupt
> parents under optional property list as these can be optional.
>
> The FU540-C000 SoC from sifive, has an Opencore's I2C block
> reimplementation.
>
> The DT compatibility string for this IP is present in HDL and available at.
> https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/i2c/I2C.scala#L73
>
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> index 17bef9a..b73960e 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> @@ -2,8 +2,11 @@ Device tree configuration for i2c-ocores
>
>  Required properties:
>  - compatible      : "opencores,i2c-ocores" or "aeroflexgaisler,i2cmst"
> +                    "sifive,fu540-c000-i2c" or "sifive,i2c0".

It's not an OR because both are required. Please reformat to 1 valid
combination per line.

> +                   for Opencore based I2C IP block reimplemented in
> +                   FU540-C000 SoC.Please refer sifive-blocks-ip-versioning.txt
> +                   for additional details.
>  - reg             : bus address start and address range size of device
> -- interrupts      : interrupt number
>  - clocks          : handle to the controller clock; see the note below.
>                      Mutually exclusive with opencores,ip-clock-frequency
>  - opencores,ip-clock-frequency: frequency of the controller clock in Hz;
> @@ -12,6 +15,8 @@ Required properties:
>  - #size-cells     : should be <0>
>
>  Optional properties:
> +- interrupt-parent: handle to interrupt controller.

Drop this. interrupt-parent is implied.

> +- interrupts      : interrupt number.
>  - clock-frequency : frequency of bus clock in Hz; see the note below.
>                      Defaults to 100 KHz when the property is not specified
>  - reg-shift       : device register offsets are shifted by this value
> --
> 1.9.1
>
