Return-Path: <linux-i2c+bounces-1586-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FDE84569F
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 12:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96FFA1F28817
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 11:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3A315D5C1;
	Thu,  1 Feb 2024 11:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O6vF4Bja"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6839115B961
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706788460; cv=none; b=nDqWrNoKfKTHfaFD8S4/WBcWZimD39EbMgt97cuzFi1oZYl5/12XGZAIXKHom7QuzPIF1fBVdzdfX9ZCG+K0+tXvSU5/z18l7izXkfcMl4djjrGXzcigR1lJHivpXYMVwlrMPLkhFLqmjYAiAcnsOQy5rM41oiBsH15WWPDHoas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706788460; c=relaxed/simple;
	bh=xZlpBSv6fkEsA2L7w/b7DPQtVdArKyORbXqibI/jExE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GK7R2bTiU76mSr4MOkrSVLNd5EXm7VQXsDzeZ9bz0jMLjgQc5bRwGOtKGbhF2zrJgNT7YkGxwXnC3qFtaEkBn7+yaNHocS7elqx3KFY1XR0TNG7MXMCe885wOSakOiNG4SwvdtRi/jq92vMfwjiHLeWqzN8wrzP8tFJoYZUaX8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O6vF4Bja; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc6d5267cceso724923276.1
        for <linux-i2c@vger.kernel.org>; Thu, 01 Feb 2024 03:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706788457; x=1707393257; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4H6LBU62Ttqy2KFiZYwMZoro4w2GfWXjhJ/+N8HmJ1Q=;
        b=O6vF4BjaZHJsVk+if3ylpZuTdmZqQl6byk8gKQnHWFhb7sWpaCl4/h9/WhoUZGcjlj
         RAZiLtkhd1ruUsusSrcVKZ1Tnd/T1CFs2eI6MQw3j6Sa6/KJo4bE68rJjUD750+bev/8
         dd4lZ4plJzB64YdWPfNV3gBpPeD6AUx7TS4Y4YKBZyUlVNsaFebumcaOoyuiH+YuOHEB
         D48jOgfx9soZEeuFaGD1rVQTqbwb9qO9za29W8sZRgG4kwGQdX7TpsOk69P7PLlm6G+Z
         acLlCRoCSvBXJeB2k3voGjmkFEIf3hGp648irabqF+TTul9B+RCSNRE3aMUAIZA1sJ0O
         7GgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706788457; x=1707393257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4H6LBU62Ttqy2KFiZYwMZoro4w2GfWXjhJ/+N8HmJ1Q=;
        b=FzG+MBd6fywVwIPqvSxklMob9cRj1CNeNpQ1SDrenTHGwTIS9RTVQPG/M/wkiu9Xwv
         Q914CwcjJjnM4Mpp1TLSSUwHdcmVCHWvUZ4SpA1tTC3lTv5qTIR+pZsvw2/9tjEfumLv
         gitYdm0wq5bVQ4JNc+hQjJROcoB93vcQn0k15iJwt5+XX+c9u268r5cH+IgO+BIrIX3/
         GUgaAVgLrlolDzl03xR+fdSVDo1UDVHBROAE+lJp3Ws6ydt4ztH2uDZlv9GIPUhQ8yOH
         HI0K3r5/c3tYCfx3ppeADZpc9L6G8It/qPIOR/idpNR2V7ZvcVszZj4G5O0RmACpKf9Z
         irUQ==
X-Gm-Message-State: AOJu0YyC6V0aifl8u+CyhDPWPvvAAvm8PkK5jrAsAnEerqrwgUVH/kpn
	9W0+8p4j7+CxFAnbqdPNgLhqwnhGiVHMSKzJ3yoZZk4V0NdR28/6g65EBzrHw+vlNBtjw1lXfYZ
	2hgR7wWdHhdH/A763SDhIKAu4buoWfLecSnfF6Q==
X-Google-Smtp-Source: AGHT+IHE6MUPQe2v8rCH9yiwR/6CfzgY+yrYyn3lZn+9J44z3It/avkbHeViCgHRCdu6QmraEUiD0NAB+hbfkJ9jn3w=
X-Received: by 2002:a25:2e4a:0:b0:dc6:ad45:3c51 with SMTP id
 b10-20020a252e4a000000b00dc6ad453c51mr4463301ybn.36.1706788457347; Thu, 01
 Feb 2024 03:54:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240201101323.13676-1-quic_vdadhani@quicinc.com>
In-Reply-To: <20240201101323.13676-1-quic_vdadhani@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 1 Feb 2024 13:54:06 +0200
Message-ID: <CAA8EJpqQtHDRK2pex+5F-fMRTosJuFCx59e89MWhnie1O3dHKA@mail.gmail.com>
Subject: Re: [V3] i2c: i2c-qcom-geni: Correct I2C TRE sequence
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, andi.shyti@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vkoul@kernel.org, quic_bjorande@quicinc.com, 
	manivannan.sadhasivam@linaro.org, bryan.odonoghue@linaro.org, 
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Feb 2024 at 12:13, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
>
> For i2c read operation in GSI mode, we are getting timeout
> due to malformed TRE basically incorrect TRE sequence
> in gpi(drivers/dma/qcom/gpi.c) driver.
>
> TRE stands for Transfer Ring Element - which is basically an element with
> size of 4 words. It contains all information like slave address,
> clk divider, dma address value data size etc).
>
> Mainly we have 3 TREs(Config, GO and DMA tre).
> - CONFIG TRE : consists of internal register configuration which is
>                required before start of the transfer.
> - DMA TRE :    contains DDR/Memory address, called as DMA descriptor.
> - GO TRE :     contains Transfer directions, slave ID, Delay flags, Length
>                of the transfer.
>
> Driver calls GPI driver API to config each TRE depending on the protocol.
> If we see GPI driver, for RX operation we are configuring DMA tre and
> for TX operation we are configuring GO tre.
>
> For read operation tre sequence will be as below which is not aligned
> to hardware programming guide.
>
> - CONFIG tre
> - DMA tre
> - GO tre
>
> As per Qualcomm's internal Hardware Programming Guide, we should configure
> TREs in below sequence for any RX only transfer.
>
> - CONFIG tre
> - GO tre
> - DMA tre
>
> In summary, for RX only transfers, we are reordering DMA and GO TREs.
> Tested covering i2c read/write transfer on QCM6490 RB3 board.

This hasn't improved. You must describe what is the connection between
TRE types and the geni_i2c_gpi calls.
It is not obvious until somebody looks into the GPI DMA driver.

Another point, for some reason you are still using just the patch
version in email subject. Please fix your setup so that the email
subject also includes the `[PATCH` part in the subject, which is there
by default.
Hint: git format-patch -1 -v4 will do that for you without a need to
correct anything afterwards.

>
> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>

I think you got some review tags for v2, didn't you? They should have
been included here, otherwise the efforts spent by the reviewer are
lost.

> ---
> v2 -> v3:
> - Update commit log to explain change in simple way.
> - Correct fix tag format.
>
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

