Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B44299074
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Oct 2020 16:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783052AbgJZPFE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Oct 2020 11:05:04 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:44739 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730724AbgJZPFE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Oct 2020 11:05:04 -0400
Received: by mail-oo1-f67.google.com with SMTP id o129so302918ooo.11
        for <linux-i2c@vger.kernel.org>; Mon, 26 Oct 2020 08:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kq+7FxltUFEKWao6Ng5CqD92DLdJvQHqtziMujIoaWU=;
        b=wlhwRO0BCTyvIsi7sRjI5lW4fI6pRs0Bui2pdXQKTQJ880xC5sP7Fe8MirJ3hkd+/c
         nOd/Vbt0Qbbft+k2qsnraq/QdQSHpn+4cH1kGkHjcbzVFYttw/yYo998lm9cBKTefNVw
         kvEovFR+M4dysgPr2gqhtbf0ns1eLN3/083vz7wHD4LBbmaH6Hn8UTAR65qG4Awo1kLo
         6nnrNS2PBxireJez3tw3lTqn2hrs66XpkLsrwKTb52YleHik/K7vIA48aQhOzEbm8Shl
         Fo7HdDssxskYZk+jdDCQMPEB/6rlw4VC+axLNu92uRf40MjFMLliEq37UIYpbyJIilgi
         NqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kq+7FxltUFEKWao6Ng5CqD92DLdJvQHqtziMujIoaWU=;
        b=geJAWodwldQe1TlmIj4KHUzgCETQA31y7BT6FuYW0ifgZD+ghu6VuOGFGZR1OnstH0
         oYdDZfGufTVOmFsd5OIEUENdcZ1mpqqJUp2+PgXpDCWv4I0hyp5bPaWMJnPImPqX2nvf
         9/g7emk2DfJSMquh5rYXuAd09qYDD2I911AJmZAb5qSV+adD/gV/bEJfe/W0JVS0K7Yb
         ncG/0CEP6ni5OWYoJKcF0d5p9PhF8VF6iffL72aoWtHdNCmPi4H0FAampIFO7WGGrwq+
         13y1Sco2v9jL1JHbKvFkAt9GfP3B0ZCnPcVhNAN/tO7+nioO/sPu8L9ZgfNi36Og1TBy
         sdJQ==
X-Gm-Message-State: AOAM531kJM7rs6kUCE/rV0rtTClSoCn90MHnzI0ilu+XvoRXremYrsTS
        hBdr1jux0E3RxMhluQTQDj+ip24ULVVGHA==
X-Google-Smtp-Source: ABdhPJyibHqcT9VCcuN+aYxjNELmt6onDRja6XEXW3drk+d3dVDNWAIVZThTKuFx5JVa8NWEfCVGEw==
X-Received: by 2002:a4a:af03:: with SMTP id w3mr12579646oon.93.1603724703143;
        Mon, 26 Oct 2020 08:05:03 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h5sm3689953otb.11.2020.10.26.08.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 08:05:02 -0700 (PDT)
Date:   Mon, 26 Oct 2020 10:05:00 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-i2c@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
Message-ID: <20201026150500.GA26921@builder.lan>
References: <20201013212531.428538-1-dianders@chromium.org>
 <20201013142448.v2.2.I7b22281453b8a18ab16ef2bfd4c641fb1cc6a92c@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013142448.v2.2.I7b22281453b8a18ab16ef2bfd4c641fb1cc6a92c@changeid>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue 13 Oct 16:25 CDT 2020, Douglas Anderson wrote:

> This reverts commit 02b9aec59243c6240fc42884acc958602146ddf6.
> 
> As talked about in the patch ("soc: qcom: geni: More properly switch
> to DMA mode"), swapping the order of geni_se_setup_m_cmd() and
> geni_se_xx_dma_prep() can sometimes cause corrupted transfers.  Thus
> we traded one problem for another.  Now that we've debugged the
> problem further and fixed the geni helper functions to more disable
> FIFO interrupts when we move to DMA mode we can revert it and end up
> with (hopefully) zero problems!
> 
> To be explicit, the patch ("soc: qcom: geni: More properly switch
> to DMA mode") is a prerequisite for this one.
> 
> Fixes: 02b9aec59243 ("i2c: i2c-qcom-geni: Fix DMA transfer race")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Akash Asthana <akashast@codeaurora.org>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Wolfram, would you like to pick this patch or would you prefer that it
goes together with the other two through the soc tree?

Per Doug's description it has a functional dependency on patch 1, but as
long as all three patches makes it into v5.11 I'm okay with either way.

Regards,
Bjorn

> ---
> 
> (no changes since v1)
> 
>  drivers/i2c/busses/i2c-qcom-geni.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index dead5db3315a..32b2a9921b14 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -367,6 +367,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  		geni_se_select_mode(se, GENI_SE_FIFO);
>  
>  	writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
> +	geni_se_setup_m_cmd(se, I2C_READ, m_param);
>  
>  	if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
>  		geni_se_select_mode(se, GENI_SE_FIFO);
> @@ -374,8 +375,6 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  		dma_buf = NULL;
>  	}
>  
> -	geni_se_setup_m_cmd(se, I2C_READ, m_param);
> -
>  	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>  	if (!time_left)
>  		geni_i2c_abort_xfer(gi2c);
> @@ -409,6 +408,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  		geni_se_select_mode(se, GENI_SE_FIFO);
>  
>  	writel_relaxed(len, se->base + SE_I2C_TX_TRANS_LEN);
> +	geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
>  
>  	if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &tx_dma)) {
>  		geni_se_select_mode(se, GENI_SE_FIFO);
> @@ -416,8 +416,6 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  		dma_buf = NULL;
>  	}
>  
> -	geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
> -
>  	if (!dma_buf) /* Get FIFO IRQ */
>  		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
>  
> -- 
> 2.28.0.1011.ga647a8990f-goog
> 
