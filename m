Return-Path: <linux-i2c+bounces-1521-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA60B841724
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 00:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9E9C1C22556
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 23:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3859A524CC;
	Mon, 29 Jan 2024 23:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kJb/H+Dy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5689751C3B
	for <linux-i2c@vger.kernel.org>; Mon, 29 Jan 2024 23:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706572211; cv=none; b=riUUzs7ymsxNf5k2grAnyQJDnzDZreJgvy41gr5yxFIWO4sOS1VcRF+h1+mdZqFf0EjPHleiFvMg6F0AkAiijAT2EK700cl2NCaUh1Cfjbi0tJpJiw0X643egWXIwKFwfO+vwQN0J931ruqvrBlTENRRL+gOnvT09m22kDkqTNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706572211; c=relaxed/simple;
	bh=UBzKAjw1cx6u8YMuRXY/IgE9Q07ZVbkxH/j/6WQSCcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWe6kq2OrzUP4NY/dtGpNlWo/kkVPk8yf9WudhupPs2q9V3RJdq68DJsK0cP74/2Fnhumj8eOp9ZalF9Hpgf7HbQnWQecN68brdnLBLvtB4HEiurvnEib+Z1oxm9RYtTvbT6kg1G6LgjC9LNR2QsuUOtT3KOzgEKKMIWyI0e3JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kJb/H+Dy; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5ffee6e8770so39832107b3.0
        for <linux-i2c@vger.kernel.org>; Mon, 29 Jan 2024 15:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706572208; x=1707177008; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T3Y1YC77PE7gg6RUxiLjcwt8G9i7hJpA6mB4vW7ufYU=;
        b=kJb/H+Dy0eUw0mTUGlUwL8KHDRR6bJi1XWcZY364O108a4UDr2MenBFk5UtRXDDAXP
         28bYhoy95CxustMZK78vZi6htBtXvfTvQziDrSeFSzakcO8GIFmNhxqOKuWjg75ohVFi
         YUku3nbG0oclTgQIPdyuYeAJokcVsztujTo24VM8QpTvkZ3RChv54l6MwP7P8KBQRKJx
         GlE6zDKuFGWWBrRf4vfhaNMINEQQadCqPI7PzZRcME50RhcsY8PRaIJIAHGZJctAdto6
         LoybIBNnC/r/AaM9sJwNCrKzIF/MRqVnvtAVvICK3bh7oXEEgYGY7hII8BbeZPQn/PKM
         /x6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706572208; x=1707177008;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3Y1YC77PE7gg6RUxiLjcwt8G9i7hJpA6mB4vW7ufYU=;
        b=vf/OI7OJ+RVk15ErKQO3SC0+6DBrUwGCH0Q+XLeYF5OTdqrVhXuKNWsSJDNiFcy2YV
         VznvmZSZBJRbfa5/fQgWcI6wfjAwdTTfu++MH/jtWwabEb2kXOOWtha65j29XRAIRHon
         VOmUv7JEW480C0rIecXm3XxPtrekF4ghTOO+GAO44+vOz69mG9KvRXIttK2CFh8hbK4+
         8bZz3EOeWXa07oIfRFNz99KiNSA4ZJe9wt1ePDRwp/GQ52H5qFKIWlKXzcehrZSeIXkJ
         ukrkgFFSFvzTVCfjwfAHbeeCkbmIXKwpeDuDRMBVhMohKzBHMSNl/kfOFiwG9XISsCa5
         5LBQ==
X-Gm-Message-State: AOJu0YyLXUtKN2kN8x+bPyjGaQXZi70srVvEMusCss4aQlk7DRH7yTo2
	z/GO38Z6TU+qqOYWxUMBAjTK5EGzHgqK6oOGJuNJvO0PPo90wdT8oRRgOMwFRzBrkqVpxD5pS8r
	JDzJSeqWc43NfkW0nJIcQMCpGW7DEu2H3RmK+Kw==
X-Google-Smtp-Source: AGHT+IHY4mRLGmiqbzZ+aQNi3H8Nb73QQbbBMg6ZnaSyjyc4iEXN4mPvFUhRRKJriADaKhFaHy7DTlLQf5hCWRAtd5U=
X-Received: by 2002:a81:c14a:0:b0:5ff:6ca0:4b19 with SMTP id
 e10-20020a81c14a000000b005ff6ca04b19mr6109145ywl.31.1706572208292; Mon, 29
 Jan 2024 15:50:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129061003.4085-1-quic_vdadhani@quicinc.com>
In-Reply-To: <20240129061003.4085-1-quic_vdadhani@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 01:49:57 +0200
Message-ID: <CAA8EJpr_KXsjTUYha7OVg4HLLJLqMRvJun9DnMkBFvq3R2nk=Q@mail.gmail.com>
Subject: Re: [V2] i2c: i2c-qcom-geni: Correct I2C TRE sequence
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, andi.shyti@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vkoul@kernel.org, quic_bjorande@quicinc.com, 
	manivannan.sadhasivam@linaro.org, quic_msavaliy@quicinc.com, 
	quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 08:10, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
>
> For i2c read operation, we are getting gsi mode timeout due
> to malformed TRE(Transfer Ring Element). Currently we are
> configuring incorrect TRE sequence in gpi driver
> (drivers/dma/qcom/gpi.c) as below
>
> - Sets up CONFIG
> - Sets up DMA tre
> - Sets up GO tre
>
> As per HPG(Hardware programming guide), We should configure TREs in below
> sequence for any i2c transfer
>
> - Sets up CONFIG tre
> - Sets up GO tre
> - Sets up DMA tre

It is not clear how this is relevant and/or affected by swapping
I2C_WRITE and I2C_READ gpi calls.

>
> For only write operation or write followed by read operation,
> existing software sequence is correct.
>
> for only read operation, TRE sequence need to be corrected.
> Hence, we have changed the sequence to submit GO tre before DMA tre.
>
> Tested covering i2c read/write transfer on QCM6490 RB3 board.

Please read Documentation/process/submitting-patches.rst, understand
it and write a proper commit message.

>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Fixes: commit d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")

As it was pointed out, this line shows ignorance of the mentioned file
and of the existing community practices.

> ---
> v1 -> v2:
> - Remove redundant check.
> - update commit log.
> - add fix tag.
> ---
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 0d2e7171e3a6..da94df466e83 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -613,20 +613,20 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>
>                 peripheral.addr = msgs[i].addr;
>
> +               ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> +                                   &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
> +               if (ret)
> +                       goto err;
> +
>                 if (msgs[i].flags & I2C_M_RD) {
>                         ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
>                                             &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
>                         if (ret)
>                                 goto err;
> -               }
> -
> -               ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
> -                                   &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
> -               if (ret)
> -                       goto err;
>
> -               if (msgs[i].flags & I2C_M_RD)
>                         dma_async_issue_pending(gi2c->rx_c);
> +               }
> +
>                 dma_async_issue_pending(gi2c->tx_c);
>
>                 timeout = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
>


-- 
With best wishes
Dmitry

