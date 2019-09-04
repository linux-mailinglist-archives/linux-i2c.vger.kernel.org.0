Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1EDA93CA
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2019 22:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729773AbfIDUfx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Sep 2019 16:35:53 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36962 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729471AbfIDUfw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Sep 2019 16:35:52 -0400
Received: by mail-pf1-f194.google.com with SMTP id y9so25947pfl.4
        for <linux-i2c@vger.kernel.org>; Wed, 04 Sep 2019 13:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y9dPfxiGVl9B5eQCHDgsbYOLG2ykYyi/7SM+jtLAnog=;
        b=IoH/DtjsZSHeuM5ZH1ZL9Fy+rFnrY2sGhJTxYoxekXhLlmUNBAwbZWtGkaZWeLkrWB
         p/OHUOdc3ZVgXUSWEXgPCdOxzHj6ou+8a/ZlebDKFUrcBI8Zk36WiZ7RUbG2Hn1T5Xy6
         q4NVyGK9q203NBKeABXcjGCfEhXMgChZweccIQ+Inc7zwHL8h+V9H4Eoo0tWROMxKNck
         zeuF2Fq/ec/RE8H+zHbNtYl55DYiCg2BVdGE41d25DtwtA1Bl1qs11JMSGCNhXZoNW7G
         GszHlkzz1S81UpO64iP8lHJFTqcYhkcuFgvYXx6J8GUw8BLi/FgP2ITaAvZ2KhBllLib
         M6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y9dPfxiGVl9B5eQCHDgsbYOLG2ykYyi/7SM+jtLAnog=;
        b=iwZ0wNIRqagS4+NDV80Gc/4nmSB6QbAOe7ORsPKBmgfoI7hEBKVoQT4J0nDs0dKIGM
         jYQls+uhyISBLpshg2E+rYTDdLHy5M+HHaTsxtg1MZQ/XCiool3V0bDpqZucebdPxd2V
         DouhPdUoXn8+a/Ddv93bPdrQm2V7SdUR0a+A+qeCkHI32qTBvuLzPPStJEHpM+tyNY2M
         8DJrGh6ZF54iPRpzrWoqr6/77QxCoTBfExp2StOzlnx3mjvlCv3KnhRl4CKHkmP7LVrx
         Lcnm/Her5mDf5plx9AFH/XA0oVDC36c8gSSeHgcZDfX6RfvQmAcul9brVyBfl5kGHFKy
         cLpA==
X-Gm-Message-State: APjAAAXTPjyjbK2HcVIGPA8y5J8kUIPvd0hgOHiRmlZJPW69c4rRv9iZ
        LkEkkT7WVH+Fo9xtkqjYdokPqA==
X-Google-Smtp-Source: APXvYqyNUCdVh4CrjvfM5UYakm4eAZf3UXsz8CmJ1f360GpgwL9mGAfC1CL0i304toSE0+cTRHBGxA==
X-Received: by 2002:a63:6a81:: with SMTP id f123mr38808pgc.348.1567629351901;
        Wed, 04 Sep 2019 13:35:51 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h70sm14724pgc.36.2019.09.04.13.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 13:35:51 -0700 (PDT)
Date:   Wed, 4 Sep 2019 13:35:48 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: qcom-geni: Provide an option to select FIFO
 processing
Message-ID: <20190904203548.GC580@tuxbook-pro>
References: <20190904113613.14997-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904113613.14997-1-lee.jones@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed 04 Sep 04:36 PDT 2019, Lee Jones wrote:

The subject implies that we select FIFO mode instead of DMA, but that's
not really true, because with DMA enabled we still fall back to FIFO for
messages below 32 bytes. 

So what this does it to disable DMA, which neither the subject or the DT
property describes.

Also missing is a description of why this is needed.

Regards,
Bjorn

> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index a89bfce5388e..dfdbce067827 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -353,13 +353,16 @@ static void geni_i2c_tx_fsm_rst(struct geni_i2c_dev *gi2c)
>  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  				u32 m_param)
>  {
> +	struct device_node *np = gi2c->se.dev->of_node;
>  	dma_addr_t rx_dma;
>  	unsigned long time_left;
> -	void *dma_buf;
> +	void *dma_buf = NULL;
>  	struct geni_se *se = &gi2c->se;
>  	size_t len = msg->len;
>  
> -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> +	if (!of_property_read_bool(np, "qcom,geni-se-fifo"))
> +		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> +
>  	if (dma_buf)
>  		geni_se_select_mode(se, GENI_SE_DMA);
>  	else
> @@ -392,13 +395,16 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  				u32 m_param)
>  {
> +	struct device_node *np = gi2c->se.dev->of_node;
>  	dma_addr_t tx_dma;
>  	unsigned long time_left;
> -	void *dma_buf;
> +	void *dma_buf = NULL;
>  	struct geni_se *se = &gi2c->se;
>  	size_t len = msg->len;
>  
> -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> +	if (!of_property_read_bool(np, "qcom,geni-se-fifo"))
> +		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> +
>  	if (dma_buf)
>  		geni_se_select_mode(se, GENI_SE_DMA);
>  	else
> -- 
> 2.17.1
> 
