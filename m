Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 577F4631573
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Nov 2022 18:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbiKTRXw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Nov 2022 12:23:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiKTRXu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Nov 2022 12:23:50 -0500
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFBB7764E;
        Sun, 20 Nov 2022 09:23:49 -0800 (PST)
Received: by mail-oi1-f179.google.com with SMTP id m204so10482745oib.6;
        Sun, 20 Nov 2022 09:23:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d30jJeAxerIlzwFGGy9nfRUbZyV0z2QF3WoX1g+cHTI=;
        b=A0HaGqBfZMoDVO5KZM1nOkqAXquPr+D6yviBmXstUz0fGqIlk1WwEp8K7Z5HCqfsfa
         Mm5fDHHHe68+q42ryXwJMg+IPnwU9/2MGZffnXLBDzEgu5AtyZmyfDWyn11zi5rksw85
         Qz4cbf8y704GB8CUs0jb/FUgHOyj8PusOqv4iNX+3xStD7nD9vcedqO7M4FFwnH5ipD9
         GB5WI0Pp/PvkZ8KTdL5PJ7ckrqvB4K3eCUpf2gy/gqnU79ognrs0dgcc+ytPMCXipccl
         DirdZFhpYGXzHlljBh4lnr3KKtqv6ET/JeNHkprYy/F/9Ie1yVGSa+wlPjKcpwY483yh
         WqqA==
X-Gm-Message-State: ANoB5pkRFOUZ47w3ILxvY3dpqMuyJLhhR1GnEWn+DFGQhBbCdYQIO80Q
        O1lL5MzFlFAsNQvGJ4tcGg==
X-Google-Smtp-Source: AA0mqf4Q6nTk2OgOV3t7s56id1kjgeA2zMG4hXa787VavOcsRaMC6AnDNNR7pIcy5f51FuSNIAWFtg==
X-Received: by 2002:a05:6808:57:b0:359:6a8d:a3f6 with SMTP id v23-20020a056808005700b003596a8da3f6mr7589143oic.51.1668965028981;
        Sun, 20 Nov 2022 09:23:48 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80f8:5cb3:df5a:23c3:86fb:15a6])
        by smtp.gmail.com with ESMTPSA id m21-20020a9d6455000000b006393ea22c1csm3965138otl.16.2022.11.20.09.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 09:23:48 -0800 (PST)
Received: (nullmailer pid 3223594 invoked by uid 1000);
        Sun, 20 Nov 2022 17:23:48 -0000
Date:   Sun, 20 Nov 2022 11:23:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jan Dabros <jsd@semihalf.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] dt-bindings: i2c: add loongson i2c
Message-ID: <20221120172348.GA3217015-robh@kernel.org>
References: <20221117075938.23379-1-zhuyinbo@loongson.cn>
 <20221117075938.23379-2-zhuyinbo@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117075938.23379-2-zhuyinbo@loongson.cn>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 17, 2022 at 03:59:38PM +0800, Yinbo Zhu wrote:
> Add the Loongson platform i2c binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
>  .../bindings/i2c/loongson,ls-i2c.yaml         | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/loongson,ls-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/loongson,ls-i2c.yaml b/Documentation/devicetree/bindings/i2c/loongson,ls-i2c.yaml
> new file mode 100644
> index 000000000000..275afe8c8483
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/loongson,ls-i2c.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/loongson,ls-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson I2C controller
> +
> +maintainers:
> +  - Yinbo Zhu <zhuyinbo@loongson.cn>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - loongson,ls2k-i2c
> +      - loongson,ls7a-i2c
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

> +  - "#address-cells"
> +  - "#size-cells"

You can drop these 2. i2c-controller.yaml requires them.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
