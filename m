Return-Path: <linux-i2c+bounces-2264-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7D5875936
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 22:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54F131F242F8
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 21:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D2613BAC4;
	Thu,  7 Mar 2024 21:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t9IcGzz0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDB413B783
	for <linux-i2c@vger.kernel.org>; Thu,  7 Mar 2024 21:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709846714; cv=none; b=Km1WP+wn4fDOriUl2fC6lfMGdoV1fcRXsWvflioVNYsNyFZdiCZS4X5FclHKyCLCtQPwTrFAmamAF+N3njQG8jrX25YsiwHXPqGl+WeStZ83WI2DyWr/lDqFt8ZaGUjgV3PA0CzCocaBYrPPRwO+Dc7AWTqYQs3aQe3Dm7NCXlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709846714; c=relaxed/simple;
	bh=fmMP5iKplWZjMSpRw/sZdefxBphDjLLMtsB0POMq9wQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObjeZWKilHzxOSbtGK2i4ZD+tM7ZfIcY0tk9LoMeQYPF7zOpzV7A0mF5wCz+3GIVY/SOqmmxfSfr7HBTivhBtJJmP1ie8nAbTs+t1Q5HT//mAa4nK1OHEuqLjqZ99H/ijUG6bUs5CSrvfHk2cO8le96dm7PhTkqSjbLxkpTR3r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t9IcGzz0; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6098a20ab22so11746637b3.2
        for <linux-i2c@vger.kernel.org>; Thu, 07 Mar 2024 13:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709846710; x=1710451510; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b9hhcys1gNGaG07NYC+PK2//TEd+2vYvb6mO1ZLDuZE=;
        b=t9IcGzz0Nq1flpUvdkBGP5Euh/4CAnc5TKttnLkWvkLIn0vK0i9rW27uOo9+SmUQlJ
         VCzJHkZTAKx47kejlueRP2QE+k5AjymQSVlYHD5qsHOxCA746r7Ga3CVzbtCpph85uJE
         9tDorYeSJPafo9f83e2tH7IoPOd+l2oUH+7b5df3G0ffh5nfJKAxMymyYAF6v8DeZGuk
         2esjb8Go/cTbBn/WpbydR5opCavOrbjnogHsfebj6kS+dF8ROF10DJ7myT/2kYp005Ul
         ZtpZeDSeV3kScmmS4pmy7emHfBqUF45MQ5QP9pPLuCeivqvJAdzhW94033h4yUUaIyWt
         axwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709846710; x=1710451510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9hhcys1gNGaG07NYC+PK2//TEd+2vYvb6mO1ZLDuZE=;
        b=JcnL72Q6ndRHefXqIyALyOROn0cv/u3XnLM6yb89xRh1hUvO4cZe7i0MzDyyyTw8wx
         1meV/ZJnvUdq52VXMslAbBI0A+kAe36KKh7OVV91tagcQbdI6bPC84b2ifOXlYbrPVmh
         ZlvTqCg/jevB/LgSXh3HGGBcM7xqUvymgz0vLIVS3QBR0JYl3pYoR/zy5HzKr0+QesG/
         +ZFIbjEwJ3B2PiJ1aoNHBJwmyMvmVIaSFqfFs1+aFc7g8sCXfnRjeHerXGHXmd7tWXrC
         6urYhNjbDCVVKQwedm4nbOPn8b5YTzOlcI5emzxwT8W70cl/KNF+5S82XlA7EZBqWhX5
         9mVA==
X-Forwarded-Encrypted: i=1; AJvYcCUU5loQBi3XFxmGSSBF/gGh9ZrUdDja2uA0F16oQrAr8z44PlEEuVoaGUvmlfknJLJ1ATXmXiq4ugsIDsKtTPhOsPeEYpm8H0C6
X-Gm-Message-State: AOJu0YzAMzy6PV+VoYsoKdzD7e6FRCHTRpY2Kiu0rKAdO5DzhAcrw16Q
	SWnPF4w4x+xVrGl2UQ9qNj5w/MMxCQc1hOp69MX0+RevqGLk/ihTSL5ITp3jbLaFDtdufLdxZQ2
	n/wbR52hpz94zZeIrtIz9X68PrXWy4jhQE2lSlQ==
X-Google-Smtp-Source: AGHT+IFeiIPNPn9x5gaa4VWCe7fO1lW7o6wG5lJpI4FhUITzOYaLQsMD+ZKsTXTO2rCcXRWB2h99TPW5M52TItEo/AE=
X-Received: by 2002:a05:690c:fc6:b0:609:2fad:a9d6 with SMTP id
 dg6-20020a05690c0fc600b006092fada9d6mr25256866ywb.7.1709846710102; Thu, 07
 Mar 2024 13:25:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307205539.217204-1-quic_msavaliy@quicinc.com>
In-Reply-To: <20240307205539.217204-1-quic_msavaliy@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Mar 2024 23:24:58 +0200
Message-ID: <CAA8EJpq01SPGnJx-YrM=GDRVD_DjYwMQqL9D9v5jADwd3OjVsg@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI mode
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, vkoul@kernel.org, 
	andi.shyti@kernel.org, wsa@kernel.org, linux-arm-msm@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, quic_vdadhani@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2024 at 22:56, Mukesh Kumar Savaliya
<quic_msavaliy@quicinc.com> wrote:
>
> I2C driver currently reports "DMA txn failed" error even though it's
> NACK OR BUS_PROTO OR ARB_LOST. Detect NACK error when no device ACKs
> on the bus instead of generic transfer failure which doesn't give any
> specific clue.
>
> Make Changes inside i2c driver callback handler function
> i2c_gpi_cb_result() to parse these errors and make sure GSI driver
> stores the error status during error interrupt.
>
> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
> v2 -> v3:
> - Modifed commit log reflecting an imperative mood.
>
> v1 -> v2:
> - Commit log changed we->We.
> - Explained the problem that we are not detecing NACK error.
> - Removed Heap based memory allocation and hence memory leakage issue.
> - Used FIELD_GET and removed shiting and masking every time as suggested by Bjorn.
> - Changed commit log to reflect the code changes done.
> - Removed adding anything into struct gpi_i2c_config and created new structure
>   for error status as suggested by Bjorn.
> ---
>
>  drivers/dma/qcom/gpi.c             | 12 +++++++++++-
>  drivers/i2c/busses/i2c-qcom-geni.c | 19 +++++++++++++++----
>  include/linux/dma/qcom-gpi-dma.h   | 10 ++++++++++
>  3 files changed, 36 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry

