Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6939C278D10
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Sep 2020 17:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729261AbgIYPqp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Sep 2020 11:46:45 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:40106 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgIYPqo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Sep 2020 11:46:44 -0400
Received: by mail-ej1-f66.google.com with SMTP id p15so3676829ejm.7;
        Fri, 25 Sep 2020 08:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5FWO6ZL6cZUDkOCGsse8VptniidcThj64+uZr2ggTvM=;
        b=CO5mUqy8saR6nOw2ww3a/AjE4G4LuHhQupBCeqMff6rOsEHZLddTki9ERJ241TEbZQ
         MlW2tlkPxvMKUu+R1TyqjSGb4sQsmAlEb8zJm2QJJEIE8XW5WuUC67tGq8mWTFO1sz0M
         V3srgP0VmHBOUIArCiBzHtPVc9rJPDyUIqBm7ygvbagrD3qC45yPpvNLqoZ6DRItkzU5
         Z18cH5lQpmMWUCuxfC+b5ZJNhqNFrZ7MlCPrFfbxmjgcXR925O89oxAj0C2wD+RSHHw5
         mky8weKEAmY45W2tf/6UL3yVmSgsr7L2UyDxwtIRGjWuILuoy1E5tPxQCFxYmxrkWoT/
         aTdw==
X-Gm-Message-State: AOAM5313PSAHmLegLb/7vPxh7yi8g7FSRY5KDCOqsjHfVWiyCGiWRXLO
        v65tGVBSS1tQ8FwKrQEGTXE=
X-Google-Smtp-Source: ABdhPJzVJnoyAZIYn1mfbYCGitSNhCmMQb7Hs2iCNiB3t4bjUzLQH/owv7Wv7P7vpVwDFubQNqNM0A==
X-Received: by 2002:a17:906:f9d3:: with SMTP id lj19mr3267773ejb.346.1601048802442;
        Fri, 25 Sep 2020 08:46:42 -0700 (PDT)
Received: from kozik-lap ([194.230.155.132])
        by smtp.googlemail.com with ESMTPSA id jo2sm2065531ejb.101.2020.09.25.08.46.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Sep 2020 08:46:41 -0700 (PDT)
Date:   Fri, 25 Sep 2020 17:46:38 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wolfram Sang <wolfram@the-dreams.de>
Cc:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: i2c: imx-lpi2c: Add properties and
 use unevaluatedProperties
Message-ID: <20200925154638.GA16392@kozik-lap>
References: <20200917191321.28741-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200917191321.28741-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 17, 2020 at 09:13:18PM +0200, Krzysztof Kozlowski wrote:
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

Hi Wolfram,

The patches have Rob's ack. Could you pick them via I2C tree?

Best regards,
Krzysztof

