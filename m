Return-Path: <linux-i2c+bounces-3289-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF808B51D9
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 08:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A16C1C20DF8
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 06:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2346C1171A;
	Mon, 29 Apr 2024 06:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feufiYhk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C75D530;
	Mon, 29 Apr 2024 06:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714373811; cv=none; b=tS9aX895PRrjB9G6J5De8XhcD6PrscKluL5Zr3Ny5HstO6jas5lN7lyrdewS6skuNblrd5YD6BY2EUQ+UNetd9y2u9awmKdAZRoSLGncl5xJJrNFE/GBh+eZ5+BlqzcQ3EqtnMsPlkn0IMYk6Hcx7xV4X0IvTdU5Az8B3CtKVaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714373811; c=relaxed/simple;
	bh=OOkbtKw0Ec3Wbzq0gwWNN1dKsOm6/khSEg9QrPVYTUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HNe9CMwKWKDKFmAA2RUWJ+/jcZEov552aw0nPIFy0ycJkcwsSwIa2TQPFzq4DYIScg1PyWjSrS3koS8Dw0gt3ZvNKaUiVuDKatioJKE+LbWmEEooxCf+7NizqtzkXLSG6Tg+2VmWeIWXXnhG36rrP4c2pdNFM8vJyCF+/VWnb70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feufiYhk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8E2C4AF19;
	Mon, 29 Apr 2024 06:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714373811;
	bh=OOkbtKw0Ec3Wbzq0gwWNN1dKsOm6/khSEg9QrPVYTUU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=feufiYhknb8xHslbF/+i9j5FJLiI7gOMxGHgROPwArm1DAxHR28GkuLfXfmz051Db
	 dH4S0HJ8w76pgGkVKdK5maF8weeD2w9NrHbVgVJuo6iuLYyOf3cFRV8cNPyyjbE9uk
	 GK645idwU3mqUATNaTG7Tu0AwQjSsgYPswuN+RLRafRXLLqhFIwXo0hBmE1IUglpPE
	 0xMmALATwdHwBKjgr2uioA6dG4623cy2SGiR/YAEcfRAQufwLhVpRdJWJ8l4QgtIOX
	 3XGoch+qI1EjSt9uHoWGRgcn0196QO3+1Qil5Jj/X+RcbpZQktVNMAPUbBGyE3PX6D
	 LXHz/c6WRD65Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51b526f0fc4so5049938e87.1;
        Sun, 28 Apr 2024 23:56:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZqPlUdFpdx6NGkilA0P2BNK1/IESb9pzVEwLNW2eqfUtIAU00A55NUal5YX67y1dHWr5wPCnmyCeyU2fchPIV8ftczIMEcuH/wWfF
X-Gm-Message-State: AOJu0YzjVy2qjyw3Bl81wpZlvt4DtJMBMW207i6n6+KNV2n/MqBtAfEZ
	vqn+SZTLrFY1owwv/zRNF+xd+XvuJyo0/BOwUh4aTbnLBRWJjWAJGshogHn3SshgVH0RNXuRysK
	r9pBUMu/3Uo7m/9oHSGQZy0GHXBI=
X-Google-Smtp-Source: AGHT+IE2kI4Rmj5cD0zu0tJupr7Sx8hQoNGW1vhSgpZW1Nb/TtgI3RExRTYf2zgzizEZFjTVYpWwPmTalra8B3xvL4s=
X-Received: by 2002:a05:6512:281b:b0:51d:9ac6:568 with SMTP id
 cf27-20020a056512281b00b0051d9ac60568mr2345857lfb.36.1714373809833; Sun, 28
 Apr 2024 23:56:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com> <20240427203611.3750-11-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240427203611.3750-11-wsa+renesas@sang-engineering.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 29 Apr 2024 08:56:38 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHPqVN4XBaGuDvDV21LLxX=e17Csz_mix4NsykSx788Wg@mail.gmail.com>
Message-ID: <CAMj1kXHPqVN4XBaGuDvDV21LLxX=e17Csz_mix4NsykSx788Wg@mail.gmail.com>
Subject: Re: [PATCH 10/15] i2c: synquacer: use 'time_left' variable with wait_for_completion_timeout()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 27 Apr 2024 at 22:36, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_completion_timeout() causing patterns like:
>
>         timeout = wait_for_completion_timeout(...)
>         if (!timeout) return -ETIMEDOUT;
>
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  drivers/i2c/busses/i2c-synquacer.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
> index bbea521b05dd..bf9bcfefa30e 100644
> --- a/drivers/i2c/busses/i2c-synquacer.c
> +++ b/drivers/i2c/busses/i2c-synquacer.c
> @@ -311,7 +311,7 @@ static int synquacer_i2c_doxfer(struct synquacer_i2c *i2c,
>                                 struct i2c_msg *msgs, int num)
>  {
>         unsigned char bsr;
> -       unsigned long timeout;
> +       unsigned long time_left;
>         int ret;
>
>         synquacer_i2c_hw_init(i2c);
> @@ -335,9 +335,9 @@ static int synquacer_i2c_doxfer(struct synquacer_i2c *i2c,
>                 return ret;
>         }
>
> -       timeout = wait_for_completion_timeout(&i2c->completion,
> -                                       msecs_to_jiffies(i2c->timeout_ms));
> -       if (timeout == 0) {
> +       time_left = wait_for_completion_timeout(&i2c->completion,
> +                                               msecs_to_jiffies(i2c->timeout_ms));
> +       if (time_left == 0) {
>                 dev_dbg(i2c->dev, "timeout\n");
>                 return -EAGAIN;
>         }
> --
> 2.43.0
>

