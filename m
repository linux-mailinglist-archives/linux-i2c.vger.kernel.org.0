Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69D225C719
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 18:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728755AbgICQk4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 12:40:56 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:41842 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbgICQkz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Sep 2020 12:40:55 -0400
Received: by mail-io1-f66.google.com with SMTP id m23so3601150iol.8;
        Thu, 03 Sep 2020 09:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+9u+TnWghhMqKfyBihbCKjvpPHAhdKW/7jqOHxads9E=;
        b=EJnokCDARjQoQsHH4erXa6a5pBaEt8pElajeaGjbxwME8uTkhEG/2PneKexctZXM4D
         hIxvP0q0ieyEVy5zfaGALDmULnwgcD5TBowXPtdHiuZLsV2DKmVB4Jxt+KxG5jWh2Bcj
         05l3deZ/ww6JFQb/69EsULza0swVIy4lhpGCAVOoC2PL5dEzEzAHc1Y2lNm+li+p/vfn
         VRUeOIDOqa2unp9ThPnao1y9SUJ6Bx9mNDEOGyueAXxaz3Py9H2Nw5qkIrg0APQsLu2g
         Jw59X734nKR3ytiRNN/6XYdLfBEoyMTZO7XVIfvvXgvEjJSdf33JgE0eYmQbwJsh4GAa
         EqzA==
X-Gm-Message-State: AOAM533VzwZH+7hPonPTH7cheogQfGeY+WaBBTkM2ThtRjMr/pfh6iov
        SAy5hWpUx0PJHnm5TCVQ8A==
X-Google-Smtp-Source: ABdhPJxhaKMqp+SbtnhBwQZjxlzx3cai89L8v+zR69MaLRpYib5Teo8wEiT/Mlg60Mt9S4C5+81SOA==
X-Received: by 2002:a6b:f919:: with SMTP id j25mr3873904iog.113.1599151253904;
        Thu, 03 Sep 2020 09:40:53 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id e14sm1728541ilr.42.2020.09.03.09.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 09:40:53 -0700 (PDT)
Received: (nullmailer pid 2921863 invoked by uid 1000);
        Thu, 03 Sep 2020 16:40:52 -0000
Date:   Thu, 3 Sep 2020 10:40:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Wolfram Sang <wolfram@the-dreams.de>,
        Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: i2c: imx-lpi2c: Use
 unevaluatedProperties
Message-ID: <20200903164052.GA2921559@bogus>
References: <20200829111800.2786-1-krzk@kernel.org>
 <20200829111800.2786-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200829111800.2786-4-krzk@kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Aug 29, 2020 at 01:17:57PM +0200, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. power-domains) so use
> unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml: i2c@5a800000:
>     'assigned-clock-rates', 'assigned-clocks', 'clock-names', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

NAK. See https://lore.kernel.org/r/CAL_JsqKPXJxsHPS34_TCf9bwgKxZNSV4mvQR-WKRnknQVtGGxQ@mail.gmail.com/
