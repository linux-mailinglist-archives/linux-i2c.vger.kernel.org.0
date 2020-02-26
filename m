Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB8816FCCE
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2020 11:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbgBZK6p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Feb 2020 05:58:45 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55032 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbgBZK6o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Feb 2020 05:58:44 -0500
Received: by mail-wm1-f66.google.com with SMTP id z12so2479852wmi.4;
        Wed, 26 Feb 2020 02:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YLEl2WTyi+RV91NVgm5lnbCg8vEwFospDXjxOkr4grw=;
        b=SO/Dm3qAuWcUdd1NXyxGok17HZwreSsRXOdWulJ7gyJGyOscvECiGjeF3x5CHqCfc8
         aTEJuVNiHas05lkG7RzepSJHmSPh7zr/qVpfxzwbpdO4y2DgGn3nFEh+eroNhv78eOlg
         t4WJf9jKV12/8tLx9xUin6RCQCfSa1RCUsfy+GX1gdYdvV9XFVgAUwcEB7Yy19C/GOEW
         sD6FsrV2zqePcx+YI8YeA6+2q0BVMguim8o/R4pqk/dP1hGVbHfJlkIu0WHc7IXpoT3O
         EGqPTGXcRb+0i+DhOJi4BDZe5D2D9Tfoa+HAtxzcY8u4FpENILPbqDrsle95pqPm+fXL
         DKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YLEl2WTyi+RV91NVgm5lnbCg8vEwFospDXjxOkr4grw=;
        b=pTAthfbcDI4W7MX0Pnh0fTg33zPBpArjoif1BsiRLPCs529ybKLVKHO3YEdKdr8cCU
         SCQO1+Iw/8gKlDTVX0b6Fd5a7BnHy6YfX9yPJR3dltZMILrc4D6HBZ1A3QKvd+4npsA5
         DHvXjjkhK45EKkbVIm0asSNaY+mgRGMAvv0OrSUksPRLiovhCaczHKY7YAo3DLuYeZqZ
         qI2mnRkWHvhUBFuMD22KwCDqn6CP2K/TlRrd7QwVtwl3rBJUkD36TY4Sy/xPJUgmgTQu
         KsKnXtm2xNIFpBDINTixOJwaGEk7/eBspTR41HdewvyVGltyL7YA4tSP11f0t37hvoH9
         TkTg==
X-Gm-Message-State: APjAAAUAYrnp5AgWFbdK4gUvBkvPi8GxCbkj7sVUcZwwznZut3EdhUaO
        WJYFlqy1MBndLWikMvXf09nRBeuTvAo=
X-Google-Smtp-Source: APXvYqyhgH6gTSEK35KN50iPQDhgvfknX/BIriyYqyv19KIzw81afFHK9UoEbtUVB5Igl2Md6O/0sA==
X-Received: by 2002:a1c:3b09:: with SMTP id i9mr4817086wma.31.1582714722703;
        Wed, 26 Feb 2020 02:58:42 -0800 (PST)
Received: from [192.168.1.94] (93-41-244-45.ip84.fastwebnet.it. [93.41.244.45])
        by smtp.gmail.com with ESMTPSA id q3sm2388014wmj.38.2020.02.26.02.58.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Feb 2020 02:58:42 -0800 (PST)
Subject: Re: [PATCH] i2c:i2c-core-of:remove redundant dev_err message
To:     tangbin <tangbin@cmss.chinamobile.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200226103901.21520-1-tangbin@cmss.chinamobile.com>
From:   Francesco Lavra <francescolavra.fl@gmail.com>
Message-ID: <0757d83b-203c-fe40-a8ac-665953d7d336@gmail.com>
Date:   Wed, 26 Feb 2020 11:58:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200226103901.21520-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/26/20 11:39 AM, tangbin wrote:
> of_i2c_register_device already contains error message, so remove
> the redundant dev_err message
> 
> Signed-off-by: tangbin <tangbin@cmss.chinamobile.com>
> ---
>   drivers/i2c/i2c-core-of.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index 6787c1f71..7b0a786d3 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -103,9 +103,7 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>   
>   		client = of_i2c_register_device(adap, node);
>   		if (IS_ERR(client)) {
> -			dev_err(&adap->dev,
> -				 "Failed to create I2C device for %pOF\n",
> -				 node);
> +			return PTR_ERR(client);

This looks like an unrelated (and wrong) change. Why would you alter the 
semantics of of_i2c_register_devices()? Besides, this function doesn't 
have a return value.
