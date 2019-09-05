Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C84E2A9D1F
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 10:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfIEIgk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 04:36:40 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55542 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731424AbfIEIgk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 04:36:40 -0400
Received: by mail-wm1-f67.google.com with SMTP id g207so1683544wmg.5
        for <linux-i2c@vger.kernel.org>; Thu, 05 Sep 2019 01:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=kz03pu/vulBcGc4xjgSPYxTdYhp135hrTkAn/4s6ZQY=;
        b=Vk3N3CkEwhaRiEFUImMcFlKSt4wqVrmfzzwhqRWJPop+lwcVaMkRSrEHFqaRpcqB4S
         xF1Opncn2nKYoRFhccI53vF9Eq9XwpHTxNUO4NaNdwFO4Tg3qeDIBCKHn5asnavKqcF1
         weGGer2MhDCyMNJg6P1hNKlH0xJ1v8494DHsE/e72aVT6dnW7lNkRllNkGLmAvKseCXV
         s1xkisHm90F8G+MyXdLx3JKfTLdMdrt/TieNHD8UQVxsgwhgoIRjdF3AUGVpVzEkVhJj
         M4woqWbP6xHzPAFJCXtEnug77xV1FBgO4TU/sPzimQGc+N7py/qoe+HS/AintJ/l2kao
         1grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=kz03pu/vulBcGc4xjgSPYxTdYhp135hrTkAn/4s6ZQY=;
        b=CHOkDt8z42hpV79yANFoRurcqoe23acYV9aJhcv8TrRqbzdaeFiaCRUNP2cr1+YdOY
         gI0onwXxys0jdfwpe7d6QHfIsA/2lxZpJF3JmUM2Vu2bilvEzWkgLs1fkT+5TRjfyy5a
         d9zUaRrnejD3ZRGrio9myQeKbnEMaZlN7D0LIYU04+Guv7ZiPD7hNRPraNwqECDvm/zR
         14VhfPYPXkcIWtY9ljLeK/p2Kg/VHxzOtvUvyadIFGIScDHpTO3BYYwDO67u/brUhYc4
         nKFNg+InvKT2MOKypGaKTJcOQWT/GprcVAcLIt2I6yS+OakNYO0SPVq473hQ8qG/9QBH
         cn0A==
X-Gm-Message-State: APjAAAUwCxykDC418NGVcpee9gkuj4Zd8YTl4Ke/tmosfnk3JQcUJv69
        qaxnLDtmni/nKnCN8SS1QrdSNg==
X-Google-Smtp-Source: APXvYqyqW9836HkNCOzQi6ip1OwbzIUgsXFrI4PSNQAiesTlToMimAWUZRhYP04i4UWLK7ZjP9v6Aw==
X-Received: by 2002:a1c:a90b:: with SMTP id s11mr2077588wme.92.1567672597825;
        Thu, 05 Sep 2019 01:36:37 -0700 (PDT)
Received: from dell ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id h125sm2479702wmf.31.2019.09.05.01.36.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2019 01:36:37 -0700 (PDT)
Date:   Thu, 5 Sep 2019 09:36:35 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     I2C <linux-i2c@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/2] i2c: qcom-geni: Provide an option to disable DMA
 processing
Message-ID: <20190905083635.GB26880@dell>
References: <20190905075213.13260-1-lee.jones@linaro.org>
 <20190905075213.13260-2-lee.jones@linaro.org>
 <e2c46fef-332f-ef91-2121-bff33f6f7646@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2c46fef-332f-ef91-2121-bff33f6f7646@free.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 05 Sep 2019, Marc Gonzalez wrote:

> [ Trimming recipients list for idle chat ]
> 
> On 05/09/2019 09:52, Lee Jones wrote:
> 
> > We have a production-level laptop (Lenovo Yoga C630) which is exhibiting
> > a rather horrific bug.  When I2C HID devices are being scanned for at
> > boot-time the QCom Geni based I2C (Serial Engine) attempts to use DMA.
> > When it does, the laptop reboots and the user never sees the OS.
> > 
> > The beautiful thing about this approach is that, *if* the Geni SE DMA
> > ever starts working, we can remove the C code and any old properties
> > left in older DTs just become NOOP.  Older kernels with newer DTs (less
> > of a priority) *still* will not work - but they do not work now anyway.
> > 
> > Fixes: 8bc529b25354 ("soc: qcom: geni: Add support for ACPI")
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/i2c/busses/i2c-qcom-geni.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> > index a89bfce5388e..8822dea82980 100644
> > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > @@ -353,13 +353,16 @@ static void geni_i2c_tx_fsm_rst(struct geni_i2c_dev *gi2c)
> >  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
> >  				u32 m_param)
> >  {
> > +	struct device_node *np = gi2c->se.dev->of_node;
> >  	dma_addr_t rx_dma;
> >  	unsigned long time_left;
> > -	void *dma_buf;
> > +	void *dma_buf = NULL;
> >  	struct geni_se *se = &gi2c->se;
> >  	size_t len = msg->len;
> >  
> > -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> > +	if (!of_property_read_bool(np, "qcom,geni-se-no-dma"))
> > +		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> > +
> >  	if (dma_buf)
> >  		geni_se_select_mode(se, GENI_SE_DMA);
> >  	else
> > @@ -392,13 +395,16 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
> >  static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
> >  				u32 m_param)
> >  {
> > +	struct device_node *np = gi2c->se.dev->of_node;
> >  	dma_addr_t tx_dma;
> >  	unsigned long time_left;
> > -	void *dma_buf;
> > +	void *dma_buf = NULL;
> >  	struct geni_se *se = &gi2c->se;
> >  	size_t len = msg->len;
> >  
> > -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> > +	if (!of_property_read_bool(np, "qcom,geni-se-no-dma"))
> > +		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> > +
> >  	if (dma_buf)
> >  		geni_se_select_mode(se, GENI_SE_DMA);
> >  	else
> > 
> 
> Would it make sense to factorize the DT lookup within a helper?
> (For example; not compile-tested; not sure it's worth it)

Possibly, but the semantics end up the same.

If you think it's cleaner, perhaps submit your version a fix-up to the
original (this one).  Seeing as we're already carrying Reviewed-bys
and time is very limited to have this fixed.

I would also like to see the helper in your version prefixed, so it
would be:

  geni_i2c_get_dma_buf()

> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index a89bfce5388e..1489181f60fe 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -350,6 +350,14 @@ static void geni_i2c_tx_fsm_rst(struct geni_i2c_dev *gi2c)
>  		dev_err(gi2c->se.dev, "Timeout resetting TX_FSM\n");
>  }
>  
> +static void *get_dma_buf(struct geni_se *se, struct i2c_msg *msg)
> +{
> +	if (of_property_read_bool(se->dev->of_node, "qcom,geni-se-no-dma"))
> +		return NULL;
> +
> +	return i2c_get_dma_safe_msg_buf(msg, 32);
> +}
> +
>  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  				u32 m_param)
>  {
> @@ -359,7 +367,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	struct geni_se *se = &gi2c->se;
>  	size_t len = msg->len;
>  
> -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> +	dma_buf = get_dma_buf(se, msg);
>  	if (dma_buf)
>  		geni_se_select_mode(se, GENI_SE_DMA);
>  	else
> @@ -398,7 +406,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	struct geni_se *se = &gi2c->se;
>  	size_t len = msg->len;
>  
> -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> +	dma_buf = get_dma_buf(se, msg);
>  	if (dma_buf)
>  		geni_se_select_mode(se, GENI_SE_DMA);
>  	else

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
