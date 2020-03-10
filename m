Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B581218082F
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 20:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgCJTf3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 15:35:29 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46094 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbgCJTf3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Mar 2020 15:35:29 -0400
Received: by mail-pl1-f196.google.com with SMTP id w12so5830386pll.13
        for <linux-i2c@vger.kernel.org>; Tue, 10 Mar 2020 12:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nKhwu1SDKAkcqVKvzUsWw/zCHl4XPJcIG2el7T4mPBQ=;
        b=du2E0Fhb4mJ/inZzgatzWqnzcvQZXtDZgmruya9zV4Gw+nnSIHd76VYPct8N7RGUkg
         UZ7vTHKGlquKipcijaAe92RqfW3igKTUmJRFBWBAA7h+XfKwmD5MCHVMgeW40XLczZKi
         OIHqUD3+FqEpQilbduiaEaWRgtRo+SsgbHYwfd+DSKp74W8tZJiz/b04q91tSg5Tt7KO
         Mk7rMARWOxAT1Qsnja4Gjy7Bl9owEbVprtyZGmMNAZjlvx4dZeuHdY0R2D8QvIjz8gB5
         tR3qEuKJsUjuy5KRr3kywpFl5nUUFLdDq/9GL5Mkv8KDkvljeeLA6pytKazAgqMlKeQw
         Dtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nKhwu1SDKAkcqVKvzUsWw/zCHl4XPJcIG2el7T4mPBQ=;
        b=e20HZ4Yg2jD2RZ10VQUGDjWpQ2ZoVCCmRkWyVAsCr/Dc+u0RWURC9E5VMnMobScrQM
         ILle6WdH3sApQbRBG0g6Xw9bxvUg8By+13/KDbusGwk4Tur4QIe+h6HN7DfgmX30D+fl
         7xVtHRc3TdyJDAHRXxaitnIKLu6mtBnhQgmZeAi+KMWxq30iHzRAc2IfeQ/IJZOczW2A
         NDJ6Y5kvv5feh0ZCDeuoLKOXF6RtQD7tUUUNvalvLwYzVZ5WHzYjkjsIvShUfpH2pMa1
         4evjaoaD54mX9iF2UTWZEeBQd3PdGjlhOxJ7odKyO0PMgt2VgQ6VQMKeDPJReeH2VrBJ
         zZ1A==
X-Gm-Message-State: ANhLgQ3ozyrg3uUaxVs21Vixu8D2XsJWYnsnlldL/FpCkedCe++kiaxd
        DkHYG6zgbnXlT+rBznWAt3RFFQ==
X-Google-Smtp-Source: ADFU+vviFtgfAaWW0uY6/ztd897OrmyaVMgQQfuQtxMiBiAI3p2c1h6uHwAJhiBB9BSiymdPB6CFDA==
X-Received: by 2002:a17:902:321:: with SMTP id 30mr23122871pld.130.1583868928567;
        Tue, 10 Mar 2020 12:35:28 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c207sm8147791pfb.47.2020.03.10.12.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 12:35:27 -0700 (PDT)
Date:   Tue, 10 Mar 2020 12:35:25 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 1/3] i2c: qcom-geni: Let firmware specify irq trigger
 flags
Message-ID: <20200310193525.GM264362@yoga>
References: <20200310154358.39367-1-swboyd@chromium.org>
 <20200310154358.39367-2-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310154358.39367-2-swboyd@chromium.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue 10 Mar 08:43 PDT 2020, Stephen Boyd wrote:

> We don't need to force IRQF_TRIGGER_HIGH here as the DT or ACPI tables
> should take care of this for us. Just use 0 instead so that we use the
> flags from the firmware. Also, remove specify dev_name() for the irq
> name so that we can get better information in /proc/interrupts about
> which device is generating interrupts.
> 
> Cc: Alok Chauhan <alokc@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 17abf60c94ae..4efca130035a 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -549,8 +549,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	init_completion(&gi2c->done);
>  	spin_lock_init(&gi2c->lock);
>  	platform_set_drvdata(pdev, gi2c);
> -	ret = devm_request_irq(&pdev->dev, gi2c->irq, geni_i2c_irq,
> -			       IRQF_TRIGGER_HIGH, "i2c_geni", gi2c);
> +	ret = devm_request_irq(&pdev->dev, gi2c->irq, geni_i2c_irq, 0,
> +			       dev_name(&pdev->dev), gi2c);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Request_irq failed:%d: err:%d\n",
>  			gi2c->irq, ret);
> -- 
> Sent by a computer, using git, on the internet
> 
