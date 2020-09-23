Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F73276205
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 22:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgIWUZa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 16:25:30 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:36745 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbgIWUZa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Sep 2020 16:25:30 -0400
Received: by mail-il1-f196.google.com with SMTP id t12so915089ilh.3;
        Wed, 23 Sep 2020 13:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W1n1Uk4VwoQ5naGKPNnqMUXB7l6R3xWCLY8t5+rDRDc=;
        b=haDGDLmSyEwvDqAlBT7KH7yVHCYgZ0ClVF6qHa1I3WrSVkIMdHkmzViyJlCYWJLAhS
         h63wmU7ZsMGTEh+3tDsARFmjyYMyETyw7Noqtvtb0HLgylhfSRuDfuIcNJLnsQh7rbuV
         q0/MabtiSsgKD/36EU1qSiGPwrUA4d6PqDOraGP7z6XkGbQ8yjnGWAyeXc2iFbx2VS8U
         0foyr8GR+Qz4ME2hsJAvF9fNnhAIFzCTo4FG/6Uz0IKCss+6IeYxPzmdsU6NEYS5DZWR
         3RLqlyrZUL48dpUlTnYCS7NCF2W9PtbuIqeHWjDVILP0rGq0m0hKSlhnuhTVkMnQKCAt
         7vmA==
X-Gm-Message-State: AOAM533b6dpiQ0rQZkmZhneSnwy1YtRYBzzmcB+iJyRUpmo2wmnkVbqq
        VbUr5wa6G4S0OQgmPOUJEw==
X-Google-Smtp-Source: ABdhPJwzPDErvXHNf/UJ8S73XjiA2qihw7G+5x7RW8w0J4PJ3hSGugs88joptFd1L9HorIvXHYhKKA==
X-Received: by 2002:a05:6e02:6d0:: with SMTP id p16mr1302584ils.64.1600892729092;
        Wed, 23 Sep 2020 13:25:29 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id g6sm451197iop.24.2020.09.23.13.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 13:25:28 -0700 (PDT)
Received: (nullmailer pid 1243524 invoked by uid 1000);
        Wed, 23 Sep 2020 20:25:27 -0000
Date:   Wed, 23 Sep 2020 14:25:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wolfram@the-dreams.de>,
        Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v4 3/4] dt-bindings: i2c: imx: Add properties and use
 unevaluatedProperties
Message-ID: <20200923202527.GA1243471@bogus>
References: <20200917191321.28741-1-krzk@kernel.org>
 <20200917191321.28741-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917191321.28741-3-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 17 Sep 2020 21:13:20 +0200, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. power-domains) so
> describe all typical properties, reference generic i2c schema and use
> unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: i2c@30a20000:
>     '#address-cells', '#size-cells', 'pmic@25' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v3:
> 1. Drop address/size cells
> 
> Changes since v2:
> 1. None
> 
> Changes since v1:
> 1. Add more properties and include /schemas/i2c/i2c-controller.yaml#
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
