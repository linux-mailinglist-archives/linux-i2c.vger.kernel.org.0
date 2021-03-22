Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C76723448DE
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 16:11:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbhCVPLD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 11:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhCVPK6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Mar 2021 11:10:58 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C2EC061762
        for <linux-i2c@vger.kernel.org>; Mon, 22 Mar 2021 08:10:57 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id y6so19814119eds.1
        for <linux-i2c@vger.kernel.org>; Mon, 22 Mar 2021 08:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BblDdmrktMK5tFFD4LOpFP77ijBklviaU26xu4C63tQ=;
        b=IT2iGJQyBA7Y1+dCJvTIJziErQmWcbn0+kMr4Y273pDNqodHvB6Ww7nGeAozLlDj16
         AaZFlWmlmAzS7zUACjHtiaCrXpOhiRROiQFyU4auZ+13hpjjdqVYNePQ5Cyp/9DkkrQC
         b91OFvMWYHKs9MAA7wM3CC0WQRuzxtVRw66hiamNYNrYJOlJE43oIsVGuMZ9kLPAqUbQ
         nynbvcEhIJeX2PlbMuKhnlTT65dd9GDFO83TYP0QzGcN6dLgdO2DDjR1KDBGvGzAifvT
         3iM6ErE3HQUX/Nd9uR6OnpKDyBISmiXqsi9ileg7sykq6tbAiP06wPIgKKPW7GTaZvHL
         iZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BblDdmrktMK5tFFD4LOpFP77ijBklviaU26xu4C63tQ=;
        b=qQjJePOHWLoYYcHeXvGBDmHs0BGjYy/Rwsfs/PL+DW31AT/i5rHVhBFwYLUjvariYv
         yse6mMEnuFCSoMZGJpybvZYhQ/R0MLMGRQo1AxL3eujhKWtCczgEhHKno3/e0ADGmCRq
         eRptbSM4ZFHlUFbv7Ee7ASu0RXlDKPmKTDbHOLvgGrCri7KNmhe+1OZp6sCHjlwUjYE5
         QplaGIWK/ftwHgyt3aYEXiBZxu7WmoxOJeTUMLm8ZBP2l4MKkP1el0wxJeirQFGqzniw
         VNLUE1XA2nre0QMqTARCHtEAo7PxPqWPW+Ae6bu0kge71UB+fbqD2b9TKwF54req0rpm
         SIlw==
X-Gm-Message-State: AOAM531YxxSly5/qbwyxplKyUfk9sx/apuDP/HSnzMBRKnXSCS/4eJAg
        uftmLG/Jg/BasC0mSZZsXcq2tg==
X-Google-Smtp-Source: ABdhPJwxMVa4A4qij3tXD3Epc4EsEgsbfdMWBHLOdKIarJBUoxpk8xvIYdSjs+oVvVNjC/1HEN64aQ==
X-Received: by 2002:a05:6402:22b5:: with SMTP id cx21mr26421224edb.27.1616425856228;
        Mon, 22 Mar 2021 08:10:56 -0700 (PDT)
Received: from dell ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id e4sm9768413ejz.4.2021.03.22.08.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 08:10:55 -0700 (PDT)
Date:   Mon, 22 Mar 2021 15:10:53 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 03/15] mfd: altera: merge ARCH_SOCFPGA and
 ARCH_STRATIX10
Message-ID: <20210322151053.GB2916463@dell>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152545.1317581-4-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210311152545.1317581-4-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 11 Mar 2021, Krzysztof Kozlowski wrote:

> Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
> one for both of them.  This the common practice for other platforms.
> Additionally, the ARCH_SOCFPGA is too generic as SoCFPGA designs come
> from multiple vendors.
> 
> The side effect is that the MFD_ALTERA_A10SR will now be available for
> both 32-bit and 64-bit Intel SoCFPGA, even though it is used only for
> 32-bit.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/mfd/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
