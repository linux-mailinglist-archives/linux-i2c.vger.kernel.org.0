Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 476802EFCD
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2019 05:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731960AbfE3D5u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 May 2019 23:57:50 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:35181 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730526AbfE3D5n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 May 2019 23:57:43 -0400
Received: by mail-vk1-f193.google.com with SMTP id k1so484214vkb.2
        for <linux-i2c@vger.kernel.org>; Wed, 29 May 2019 20:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=knP9Vdv/W9CTVqFRXbGhRDZ6S1C60rRcw9hZ+qG6uSI=;
        b=ZmldDBEPfCONxwpTJVlWszmR8g7AW3et6y0xSLMruEMwOdIXeFddd9HCltth1r5kBq
         sDmq/yoFJM4MFKOePC7YAmmgfC8izwuEcBf3KTDHbJ99AlgawtpYCSFgM5RZ37t9vZUs
         +gdp2UcLBPc52KiKo7mgT+3g6dVnVVf7oGVyiwRrIIt/ba8D1RvMyk4j2jJIS6ujOoVR
         eMGNd3hOH5HEfSsLm0lhb1cvkymfrTbiL0NQppS2PmtPQFUdaOd/jHeC1x0/ORUzLoGR
         GC15E5eo6rdxNB3PtMZUtQMFQRWQGQ3Ic4s8MW002f2OYbeW0rzhq8A52kaa/Vj6RPkP
         ISpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=knP9Vdv/W9CTVqFRXbGhRDZ6S1C60rRcw9hZ+qG6uSI=;
        b=pGGDzlmYDW7lye7H7udy5/iw6wh/eVlAsYfu1LxlPWF2rhEZ2C+YnHsBSFy6TVIqS+
         iLPOcAUyOuRG0Miq/E6mTaS2qGVYrVaPIQk4X0lUrS6ra/ER1RLQ9yxU8Vt606bCkidc
         vhKSEU+Zi1vSmU9+8i3/dICs9EVb3qwll7Gc6yJ2neZfhCxhpa5O5V7qaSoUf8SyUH5z
         LT3ngFAl2Q5VUDxJc1VvBYB8aittZvHTdb3eP0aekl/Sha4uzioQH3HDadHPnmdnd2W1
         gnkCfPtTbLgG42u+KXoEBb+BEB72YTU2iOs3mhAJjB1U2DICBd1pUARfmYMaH0gOE2o/
         ZLwg==
X-Gm-Message-State: APjAAAXdOchsq3kH+nSytXTgSTkzrVN0j9b7C2MxXMkDAxxqq8OMkxce
        IjyIkFVHbYQ4sBO0FFTTGH4YP3mk2AMGlciR8DV+OA==
X-Google-Smtp-Source: APXvYqwgq0hw9LUvz5cuuDP/OzdFkdA/aey96P69lz2u1TwLNK5+B/g6I0a75Filrgu8sfxR+q3gaQnmfYsUlBgRxyQ=
X-Received: by 2002:a1f:e043:: with SMTP id x64mr548839vkg.74.1559188662612;
 Wed, 29 May 2019 20:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <1559104047-13920-1-git-send-email-sagar.kadam@sifive.com> <1559104047-13920-2-git-send-email-sagar.kadam@sifive.com>
In-Reply-To: <1559104047-13920-2-git-send-email-sagar.kadam@sifive.com>
From:   Sagar Kadam <sagar.kadam@sifive.com>
Date:   Thu, 30 May 2019 09:27:31 +0530
Message-ID: <CAARK3Hm0F+6qAh5LYbqnfn5LeDyptyBy+_DZxAxxFg5bhe8Uxg@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: i2c: extend existing opencore bindings.
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, peter@korsgaard.com,
        Andrew Lunn <andrew@lunn.ch>,
        Palmer Dabbelt <palmer@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Rob,

Please let me know if this patch is as per your requirements/comments
you mentioned earlier.

Thanks & Regards,
Sagar Kadam
On Wed, May 29, 2019 at 9:57 AM Sagar Shrikant Kadam
<sagar.kadam@sifive.com> wrote:
>
> Reformatted compatibility strings to one valid combination on
> each line.
> Add FU540-C000 specific device tree bindings to already available
> i2-ocores file. This device is available on
> HiFive Unleashed Rev A00 board. Move interrupt under optional
> property list as this can be optional.
>
> The FU540-C000 SoC from sifive, has an Opencore's I2C block
> reimplementation.
>
> The DT compatibility string for this IP is present in HDL and available at.
> https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/i2c/I2C.scala#L73
>
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> index 17bef9a..6b25a80 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> @@ -1,9 +1,13 @@
>  Device tree configuration for i2c-ocores
>
>  Required properties:
> -- compatible      : "opencores,i2c-ocores" or "aeroflexgaisler,i2cmst"
> +- compatible      : "opencores,i2c-ocores"
> +                    "aeroflexgaisler,i2cmst"
> +                    "sifive,fu540-c000-i2c", "sifive,i2c0"
> +                    For Opencore based I2C IP block reimplemented in
> +                    FU540-C000 SoC. Please refer to sifive-blocks-ip-versioning.txt
> +                    for additional details.
>  - reg             : bus address start and address range size of device
> -- interrupts      : interrupt number
>  - clocks          : handle to the controller clock; see the note below.
>                      Mutually exclusive with opencores,ip-clock-frequency
>  - opencores,ip-clock-frequency: frequency of the controller clock in Hz;
> @@ -12,6 +16,7 @@ Required properties:
>  - #size-cells     : should be <0>
>
>  Optional properties:
> +- interrupts      : interrupt number.
>  - clock-frequency : frequency of bus clock in Hz; see the note below.
>                      Defaults to 100 KHz when the property is not specified
>  - reg-shift       : device register offsets are shifted by this value
> --
> 1.9.1
>
