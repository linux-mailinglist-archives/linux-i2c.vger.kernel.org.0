Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B942761FE
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 22:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgIWUZL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 16:25:11 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:45172 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgIWUZL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Sep 2020 16:25:11 -0400
Received: by mail-io1-f67.google.com with SMTP id y74so846078iof.12;
        Wed, 23 Sep 2020 13:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d1JUnX7mgQ2YJ9tfMpu0YvEBF3ZMICE2lwDN7QLTJXo=;
        b=gXo7u1hLJcNF55hWOHiNisGoXBWB28tzkH3OG7pdYxqsNc1qLZVkxmYTI4Hs7nInKG
         QUHXTaf7hY14zJOPer9OaYG97yB24cjiFq0hfu9F2IlSPdOvakIY1B3zXBTVk/vWEoJI
         PxqTl0f6HLfuXB7ri/Hzl5f6TptOtvSj5Ceilq6HCa80A23LjbcS74lAASfsJkKkCODz
         bEbqwFa0TS17vm8E3nVvDkOko7+364b5mZqKi6+ivB/HB8xd2AgV9J9nqwnZSdnfEbvl
         Qb3JshuTvnNh2Hc2Gd6TIhvF1Gc6s36T4NNWodflabDwyix/cwbHykoxQ5GBVidYAOFU
         XbkQ==
X-Gm-Message-State: AOAM530P9S+LLVjjdt0w3cnGUd703KzfyT8pUjgL0sMnVD4CKtc8uDnB
        /Xrj9mdNIo2//64X07S3Hw==
X-Google-Smtp-Source: ABdhPJxRs/H6ntYNx5dexZ8tFvp2XKpTCfODXGh4Lw2j4yKQw4WdUQgoxRlzBqvOIvHCS1PSd1hWtg==
X-Received: by 2002:a02:c72d:: with SMTP id h13mr978004jao.17.1600892710011;
        Wed, 23 Sep 2020 13:25:10 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id o17sm353180ila.47.2020.09.23.13.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 13:25:09 -0700 (PDT)
Received: (nullmailer pid 1242780 invoked by uid 1000);
        Wed, 23 Sep 2020 20:25:07 -0000
Date:   Wed, 23 Sep 2020 14:25:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Wolfram Sang <wolfram@the-dreams.de>,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: i2c: imx-lpi2c: Add properties and
 use unevaluatedProperties
Message-ID: <20200923202507.GA1242723@bogus>
References: <20200917191321.28741-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917191321.28741-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 17 Sep 2020 21:13:18 +0200, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. power-domains) so
> describe all typical properties, reference generic i2c schema and use
> unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml: i2c@5a800000:
>     'assigned-clock-rates', 'assigned-clocks', 'clock-names', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
>   arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dt.yaml: i2c@5a800000:
>     'touchscreen@2c' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v3:
> 1. Drop address/size cells
> 2. Set maxItems to power domains to 1
> 
> Changes since v2:
> 1. Add assigned-clock-parents
> 
> Changes since v1:
> 1. Add more properties and include /schemas/i2c/i2c-controller.yaml#
> ---
>  .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
