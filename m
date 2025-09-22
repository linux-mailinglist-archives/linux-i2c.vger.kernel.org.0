Return-Path: <linux-i2c+bounces-13089-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68950B91C74
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 16:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 034D5190415A
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 14:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E7026B95B;
	Mon, 22 Sep 2025 14:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rk5eObVU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B2027E05A
	for <linux-i2c@vger.kernel.org>; Mon, 22 Sep 2025 14:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758552217; cv=none; b=RWDulxxUdY12PO7Z11EQZBw5+3ljscWJ0MjBhmUD1P7gwQvPQrmhRqaB3ZN4Ad2LzaPYPNKnso7kNiz9IPOY66nNdEqPlH7M7BCoVEImzOaqPV+hRdu7NxR+sP0ddM9SdVYZjxCRWonkz6hSapGfOGfZWKuhu2Tw2S5aBkLnQUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758552217; c=relaxed/simple;
	bh=kgMKeOuANrC43iZg1jvUkmkWPzagUHEQGbtkp6bK0vI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMmbf63Ncvnr0QaH2yKXWfNHY1puWbZ4m1oE9z5FlV4VVicVDeYgeuF2de8nBJQVsZtW0ziSfnpQdy3XrpiO3mnQKQFli5g9cSj8ugznccll8pYSLUprssWv7IQD5x3xlVP1NfZf/SrvetidwNt2HXcKFSHvX2Faxy4cmGDMp7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rk5eObVU; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-33c9f2bcdceso40173301fa.2
        for <linux-i2c@vger.kernel.org>; Mon, 22 Sep 2025 07:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758552214; x=1759157014; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wSGJ0XvVlaWK134DsZlY3yMuGiQnMb56P3+rclOYz8g=;
        b=rk5eObVULNBZ7ONopmU1ZWtX3GIPctfomNZuozGqElIQ3UPKU264mmG2GZTUVwCMZb
         mn7F/CV2oHOeP7cxXBBlqPpHLOzew29e8DkEOGSvXViWr4baE7QwzVF1RjyDrwdWWz/g
         s3gRNvB0HKyurtkjyHQlhbGT9jUsWVRQFEYbdag9uI9PDHG0L7uOzGqjrkN15i//EXcM
         qhTFEV3HTziI8sp+QClZxTC8jdXPFMvVCY462UV2zc4DAT4lMEQWDui2QgH7k3/uZadB
         w5Y943zjNOf5Uxv1HnQtc1R9obzW/RXn9eIs/bVdhlJYO4Tzv/RoBqBZuTgTIyuOu9+v
         iaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758552214; x=1759157014;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSGJ0XvVlaWK134DsZlY3yMuGiQnMb56P3+rclOYz8g=;
        b=KFFK0zasPLyE2VOUJ8B5gE5LtpGzSpn1Sf2Q01lqmLTQ22mp3fUm06Notl0D6xrpNS
         U98fpo6Ux0VWdjIPNUH7zhhBIHN2+SaEAHvtOvk/V5EXbaK+cifWQKyULMhDHbzARTM0
         UqyO7Ev4G5hDPIGXaIR1fMC5DUuFmsSaOYc2hUYS1x9gJ/jmjVD93WnwtX1W52GqrNwU
         ZDdCNS5GSNQG+ABslpSisahX2FRcazL8sYiJtl3xpJV09piZn+KrTgcx1oTEHdZPa2W5
         Lqe69HYGswI01WMyzmAnNH5VDKHNYJKorpUN8rAixEW19f6cFB2uFGgFnZC0BBChbZi8
         K8SQ==
X-Gm-Message-State: AOJu0YxTnv9MmMuHuuVfh6pUyPqNIXXgTd2RbiT7hJ9PRwUv4IYrFy4b
	g/qCJSuHJv4PYS/dSh5vbnsQQn0zTmbXH45b74Fc4vAye8DJDHEY1kQkTLUPqAMOgt9ih/zJlKF
	a6gp7itC1vPe6zSPvQiwkq2+gjV4/evYEV1rn9dLUwA==
X-Gm-Gg: ASbGncvC3+K7sPSE53ZlGQbnCXwepjk1ZkUhpgTzMbbvFd41Vk/RtFhRUcPAGL/Kzxh
	QTvQ1JyNgDLgK3bXfwVCNPATHm/SK0EwJJL9IuDDjdd87iQJ+fUv2lE3vru2YXpZAKr/icR80dd
	tJPvxxjlvaNNfCZgaOX6dqH0ZYLOQLDAv+MTOm+J1MAQMg3qQxY8t28pA/gvfOAafWb+Cpi6gH6
	vV8qn18J6p7ykACN5byV7JKYCVrxkldfkPqPQ==
X-Google-Smtp-Source: AGHT+IHBWA0aOkyyOd+R1k4/p6+BRWwsMoHsL9ctLqhXkzxhgXeHtoGxeh6xuifdB+qoyNNy9NaiBYY06/o80dRnaMo=
X-Received: by 2002:a2e:be11:0:b0:350:b715:51f1 with SMTP id
 38308e7fff4ca-3641c63392bmr41010931fa.39.1758552213655; Mon, 22 Sep 2025
 07:43:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 07:43:31 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 07:43:31 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250922-i2c-mux-v1-6-28c94a610930@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com> <20250922-i2c-mux-v1-6-28c94a610930@gmail.com>
Date: Mon, 22 Sep 2025 07:43:31 -0700
X-Gm-Features: AS18NWAukxKDxcsu63Pdrf7A6bnsBHb7UFkZ35gRQoLZiLu7TwdGXK-pBJ2BNLo
Message-ID: <CAMRc=McVePrs_+BKkpO3zf_AUcxhzp+8Cf6Tyh1A97nzkx_ZRQ@mail.gmail.com>
Subject: Re: [PATCH RFC 6/7] i2c: davinci: add support for setting bus frequency
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Michael Hennerich <michael.hennerich@analog.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Sep 2025 08:21:01 +0200, Marcus Folkesson
<marcus.folkesson@gmail.com> said:
> Populate adapter with clock_hz and set_clk_freq to enable support for
> dynamic bus frequency.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  drivers/i2c/busses/i2c-davinci.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
> index 6b18938457d0c5cabc323c364d9330c2890df107..d3e47738f8ee7e8f69fee49509dcda396c9b7fb6 100644
> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -279,6 +279,27 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
>  	return 0;
>  }
>
> +static int davinci_i2c_set_clk(struct i2c_adapter *adap, u32 clock_hz)
> +{
> +	struct davinci_i2c_dev *dev = i2c_get_adapdata(adap);
> +
> +	if (dev->bus_freq == clock_hz)
> +		return 0;
> +
> +	dev->bus_freq = clock_hz;
> +
> +	/* put I2C into reset */
> +	davinci_i2c_reset_ctrl(dev, 0);
> +
> +	/* compute clock dividers */
> +	i2c_davinci_calc_clk_dividers(dev);
> +
> +	/* Take the I2C module out of reset: */
> +	davinci_i2c_reset_ctrl(dev, 1);
> +
> +	return 0;
> +}
> +
>  /*
>   * This routine does i2c bus recovery by using i2c_generic_scl_recovery
>   * which is provided by I2C Bus recovery infrastructure.
> @@ -810,6 +831,8 @@ static int davinci_i2c_probe(struct platform_device *pdev)
>  	adap->dev.parent = &pdev->dev;
>  	adap->timeout = DAVINCI_I2C_TIMEOUT;
>  	adap->dev.of_node = dev_of_node(&pdev->dev);
> +	adap->clock_hz = dev->bus_freq;
> +	adap->set_clk_freq = davinci_i2c_set_clk;
>
>  	if (dev->has_pfunc)
>  		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;
>
> --
> 2.50.1
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

