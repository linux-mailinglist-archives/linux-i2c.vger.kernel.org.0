Return-Path: <linux-i2c+bounces-7686-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BAF9B809A
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 17:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B22C9B21BD9
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 16:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818B41BD51F;
	Thu, 31 Oct 2024 16:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qYh75Y85"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FCE1BD00C
	for <linux-i2c@vger.kernel.org>; Thu, 31 Oct 2024 16:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730393482; cv=none; b=aI+24DbLL6hC4gh7rqjnEM9ekfS4LC2dFPQe1FFnYy/AP4mD0ldYumV6oPeDF8bEQFWSxLIxGlRC6mMHZbOOzgX/V7urTphIxD3KIuAdySVEKTOqfyg+y9TCYqkQaPFWa+eY/1BYjTcQUsWKB/SHvGjl81pFeuM15Qo3JKMC00M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730393482; c=relaxed/simple;
	bh=9uF7kIftGSAOjKQHDNRn+MgvU0s5zXO+r+o+MTNjWUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjdK6SX/0HqK0eGZYFsYmlQfKqXChwS1skStcSR7ANelBjyjUCTBGII3t2M7dPwPYlUPWdnjvUY+geOSUjBQzhqTDMr4o4h2pYai/8o+MnuVtI7fqm3E7/t5weNBIfbdW1hnwYqejA0B8XdEqJtl03lgEp5nm9GVtFdz94yyIpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qYh75Y85; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539d9fffea1so1161523e87.2
        for <linux-i2c@vger.kernel.org>; Thu, 31 Oct 2024 09:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730393477; x=1730998277; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dElgT7L0zt3rmbay8fKLvEkV5UCNYIrNgV99r1etM3E=;
        b=qYh75Y85eonpzxu4UAkQSF7s+KYM+FxzJ9A3o/U38is93EaDjndATj7N4T78KSFShE
         7IFLENVQBB05evSPJFWWWRRXCza4WQfaCXoZjdXXaCk5ko6VSVC62CT2iXWpvTFinhym
         6P56GXPjJ/Fi/X8fieY0CUEl2ic3StfpRgw0AV92+hQa5XaY9ujXubjtIJq90iJFd4fl
         2v8Xbpg6dc8QuHVMXNeZl2x81Jzwlvi39nDAXMmKrA/KVE3l7RSIxSLP5zsSM0/jG8Wx
         JcAZ0fj3LLx6uUHn9QWhcMAHw2RjLcLj9eVFfN0VA8T5YMTqDQclVhO6JE9Uj/W2cveH
         5Udw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730393477; x=1730998277;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dElgT7L0zt3rmbay8fKLvEkV5UCNYIrNgV99r1etM3E=;
        b=HyzjgyOOP3ZVQq7UoF+M7KgrTOYiNnB3Ho98b4+h8dgo5PfOZEVzFGBhV28dTiWxct
         W5YR3u10BB2i89JbrJCACkSesJuCa821x7M2a1oarm3y85GTnACluceNBNvjdae+MGNi
         w6cADPOS9l0Ivfnq+NW/TLZeLr5ZQaMeNgjaxddY0y3SBTsHBdkNPDI/1VIaOT73JISD
         FNZOqNJj7sUT8zi0ZvLiSbyeI5Z5grXKZ9Pg7rn2CLx2BAV8Huig+MskX5ky3JEgf1qp
         n71eqbbaN8DHsW5RkRW1yw7EaFYOE0B//HNWNjsDCHoozUl+dihfwrpfIUlQ/wS3/h4t
         +ovg==
X-Forwarded-Encrypted: i=1; AJvYcCUS2vxUUrsy+Ol+IuwVo7ttdrjSOyvbsyOutVh1YEg5nrYtWGtm9BU10y10ItJi82stx2Aeq98txmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZdZTQqcEstKzAMn/jSpBvQLYmRgNAWtOhguZxOGkJJGUkNi1n
	V7n+/1jmkl8wSP4TtKHoyoHC/h181mr7MPL48JBXkY1FXFNc7m7BAVzEb4s1egA=
X-Google-Smtp-Source: AGHT+IFBdgNmYFRwHU2uHUqUBdL1py3yIhuOmcLZEkX5lLCzBxA/ASmXrl7QfGHc2PZxttejJESocA==
X-Received: by 2002:a05:6512:3d05:b0:539:df2f:e115 with SMTP id 2adb3069b0e04-53b34909ffamr11186732e87.23.1730393477021;
        Thu, 31 Oct 2024 09:51:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce60esm255270e87.124.2024.10.31.09.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 09:51:15 -0700 (PDT)
Date: Thu, 31 Oct 2024 18:51:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: loic.poulain@linaro.org, rfoss@kernel.org, andi.shyti@kernel.org, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH v3 -next] i2c: qcom-cci: Remove the unused variable
 cci_clk_rate
Message-ID: <jt5d3473zg34yhgykgqftlvk6fqekankuyjj57uxl56sqa3xvm@nvfv7kwtcwex>
References: <20241031095339.76535-1-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241031095339.76535-1-jiapeng.chong@linux.alibaba.com>

On Thu, Oct 31, 2024 at 05:53:39PM +0800, Jiapeng Chong wrote:
> Variable cci_clk_rate is not effectively used, so delete it.
> 
> drivers/i2c/busses/i2c-qcom-cci.c:526:16: warning: variable ‘cci_clk_rate’ set but not used.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11532
> Fixes: 823dfb7bdb21 ("i2c: qcom-cci: Stop complaining about DT set clock rate")
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
> Changes in v3:
>   -Modify the commit message.

Modify how?
What was the reason for ignoring the R-B tag?

> 
>  drivers/i2c/busses/i2c-qcom-cci.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 5cc791b3b57d..a0ef43e99751 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -523,7 +523,6 @@ static const struct dev_pm_ops qcom_cci_pm = {
>  static int cci_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	unsigned long cci_clk_rate = 0;
>  	struct device_node *child;
>  	struct resource *r;
>  	struct cci *cci;
> @@ -594,14 +593,6 @@ static int cci_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, -EINVAL, "not enough clocks in DT\n");
>  	cci->nclocks = ret;
>  
> -	/* Retrieve CCI clock rate */
> -	for (i = 0; i < cci->nclocks; i++) {
> -		if (!strcmp(cci->clocks[i].id, "cci")) {
> -			cci_clk_rate = clk_get_rate(cci->clocks[i].clk);
> -			break;
> -		}
> -	}
> -
>  	ret = cci_enable_clocks(cci);
>  	if (ret < 0)
>  		return ret;
> -- 
> 2.32.0.3.g01195cf9f
> 

-- 
With best wishes
Dmitry

