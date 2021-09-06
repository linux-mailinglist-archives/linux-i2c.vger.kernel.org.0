Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50923401D9D
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Sep 2021 17:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236271AbhIFPc1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Sep 2021 11:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbhIFPc0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Sep 2021 11:32:26 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C54DC061757
        for <linux-i2c@vger.kernel.org>; Mon,  6 Sep 2021 08:31:21 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id u15-20020a05600c19cf00b002f6445b8f55so232332wmq.0
        for <linux-i2c@vger.kernel.org>; Mon, 06 Sep 2021 08:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PQ0Sz3nSdC4M1Li6PaTkmdjXBaQB3/I9C/9VyXKR078=;
        b=UXRljDfh9pslkpfpiZW87xjIeGBWGwIaAMRlhWJCKG7426frC0Kf3IPd4Y1I1la0VX
         yR+sttTvRZyIIqXtqEvMNgsD46eYnTi/cTMP9nhkOXv4qZJ2YwpO6rzL+Ad9sxuj2FUM
         6W6/m+rhws4O7vtCY4Xiva5VZ95hBKwVmVRc5gCM+RrOnt67C1wg/drGrneMfWvU+jG5
         l7O1qd0bsLRgpjxFf8Bd6t5jthk5fKIaMSBNPrDlWhhP0XLPqT4MFYj+oA0vYzozk3X2
         bZpg5O3sTif4O/ZWaOrDw3jH9S/DBp5s9fEn++665aVy0K0x/CMSqlpEfnUx6laQG736
         0S6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PQ0Sz3nSdC4M1Li6PaTkmdjXBaQB3/I9C/9VyXKR078=;
        b=KSz5fTNwu0ng0tqqHtex5ncin2NlRhgU6TEM1xITVVFVtuRsrT+GBKgJc9NrobLFm6
         Qn/YWPC01jEuxNHJVekku/GEDqMxV0tKnp25i2sE+Z65Jqq4xv6rwi5opCRKTms1u9bc
         QaooSyo23iXGxP2+Fz9EPCh/6cXnEOh0sIXk46vXeU1xi52k2oUwLGRhh7H738GgLaU/
         +uNm+8Qo1oVsl5qBtXPRhoxRHbR3T2ljRDmJfU+YzLzlOP4sb1OMQHazQTk2s3b2oYBz
         rOWvHJQYCefSId3k8fpokW9vAYCoG+kjlFby7Jl5ebYBOFG3ckmBmWhtxwOeVbDCSEvt
         TJRA==
X-Gm-Message-State: AOAM531knP9ZNd8ey4pDtU+0VLiAvlknxEgph0XtpqtA0GVtmytXvzQX
        SiH7XssqAdKkr3Gf+p57bdKmAQ==
X-Google-Smtp-Source: ABdhPJw1GKspi6vCehDcEOXPQ+NCWmQvHbO1FyzGfSYpe1CVz0Iflaaie8Hoz/ZDPTqau9R2oirf6Q==
X-Received: by 2002:a1c:1f49:: with SMTP id f70mr12167723wmf.13.1630942279756;
        Mon, 06 Sep 2021 08:31:19 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id f20sm7471638wmb.32.2021.09.06.08.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 08:31:19 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: Use 'enum' instead of 'oneOf' plus 'const'
 entries
To:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     alsa-devel@alsa-project.org, Vignesh R <vigneshr@ti.com>,
        linux-pci@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-phy@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        linux-media@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        netdev@vger.kernel.org, dmaengine@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>
References: <20210824202014.978922-1-robh@kernel.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b2e70818-521d-eff8-d7d5-be5a8d95df19@linaro.org>
Date:   Mon, 6 Sep 2021 16:31:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824202014.978922-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 24/08/2021 21:20, Rob Herring wrote:
> 'enum' is equivalent to 'oneOf' with a list of 'const' entries, but 'enum'
> is more concise and yields better error messages.
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Vignesh R <vigneshr@ti.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: dmaengine@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-serial@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-spi@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../bindings/display/msm/dsi-phy-10nm.yaml           |  6 +++---
>   .../bindings/display/msm/dsi-phy-14nm.yaml           |  6 +++---
>   .../bindings/display/msm/dsi-phy-28nm.yaml           |  8 ++++----
>   .../bindings/dma/allwinner,sun6i-a31-dma.yaml        | 12 ++++++------
>   .../devicetree/bindings/firmware/arm,scpi.yaml       |  6 +++---
>   .../devicetree/bindings/i2c/ti,omap4-i2c.yaml        | 10 +++++-----
>   .../interrupt-controller/loongson,liointc.yaml       |  8 ++++----
>   .../devicetree/bindings/media/i2c/mipi-ccs.yaml      |  8 ++++----
>   .../devicetree/bindings/mfd/ti,lp87565-q1.yaml       |  6 +++---
>   .../devicetree/bindings/net/realtek-bluetooth.yaml   |  8 ++++----
>   .../bindings/net/ti,k3-am654-cpsw-nuss.yaml          |  8 ++++----
>   .../devicetree/bindings/net/ti,k3-am654-cpts.yaml    |  6 +++---
>   Documentation/devicetree/bindings/pci/loongson.yaml  |  8 ++++----
>   .../devicetree/bindings/phy/intel,lgm-emmc-phy.yaml  |  6 +++---
>   .../devicetree/bindings/serial/8250_omap.yaml        |  9 +++++----

>   .../devicetree/bindings/sound/qcom,sm8250.yaml       |  6 +++---

for sm8250 sound card,

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

>   .../devicetree/bindings/sound/tlv320adcx140.yaml     |  8 ++++----
>   .../devicetree/bindings/spi/realtek,rtl-spi.yaml     | 12 ++++++------
>   .../devicetree/bindings/timer/arm,sp804.yaml         |  6 +++---
>   19 files changed, 74 insertions(+), 73 deletions(-)
> 
