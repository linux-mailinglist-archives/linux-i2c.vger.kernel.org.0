Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35A0F79103
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2019 18:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729196AbfG2Qe6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jul 2019 12:34:58 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:32816 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727450AbfG2Qe6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Jul 2019 12:34:58 -0400
Received: by mail-pf1-f196.google.com with SMTP id g2so28311403pfq.0
        for <linux-i2c@vger.kernel.org>; Mon, 29 Jul 2019 09:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sDSCepMkR2bL5Wr/nR20Z2uWmhbnLcrsn71Gn90luLw=;
        b=XbJNhEas82gAqvT7+0uKPnBQXmY1bdSWMvlhGYnRuK2Tz53TPDGRi+sZihvQRqBA9E
         eH7iEjvJVAtqr4SwQkBV7kLJd9vGJP8LDI4g6xbbGLgfkVlamu0amAGZa06ft0WabEhb
         dW/YDi4mgPWPnbznja2Au4bxUF8sISHe/hfaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sDSCepMkR2bL5Wr/nR20Z2uWmhbnLcrsn71Gn90luLw=;
        b=XkoagzlwbJkh+vaNlLIDrRaTTgJVY+KQT2xLQ9JA27tcn5W6DmLLh5ZH2Dn0HTJkPT
         5DX3mB5WHmPFfeuYwU4cuQfosyBssHltxs23VY6wAL8/wVqIHliFuyK7Psl6CG1JOGSq
         crRU32l2ck7TK41O/uO+WhxL+3JJrkAIv1aJhBaIPRMLvvlEHJF8olJpb6JxTUAc6Kr0
         pXfeHtMSjlIaJHLY3E6UL43pcpenb/C1QFV+SI/aARc5HVymQ3QYC+MkBkpkZSf30rOv
         oVGQl9oeaFT+76q7/stLC2tTDS6bppEcljvrpcfN7MNe8pJfPnxQDYpoIBUIUwlYml3z
         qMzg==
X-Gm-Message-State: APjAAAW46ameLlW5QpSDnkAg7uJgY/hjeoAQKIM+xb0A5rIRLHpNX+eg
        iiRV/D1vq4QyinYdK1HJk/qckw==
X-Google-Smtp-Source: APXvYqxaKTxKSNNjt8UOl7wNOOomuHl6ngrDpmPTgBkq84LNTpXKwVVinqdCXykfOa5exwsXSmvowQ==
X-Received: by 2002:a17:90a:b104:: with SMTP id z4mr112755496pjq.102.1564418097415;
        Mon, 29 Jul 2019 09:34:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 2sm110616451pgm.39.2019.07.29.09.34.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 09:34:56 -0700 (PDT)
Date:   Mon, 29 Jul 2019 09:34:55 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] i2c: s3c2410: Mark expected switch fall-through
Message-ID: <201907290934.959721D@keescook>
References: <20190728235138.GA23429@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190728235138.GA23429@embeddedor>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jul 28, 2019 at 06:51:38PM -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warning:
> 
> drivers/i2c/busses/i2c-s3c2410.c: In function 'i2c_s3c_irq_nextbyte':
> drivers/i2c/busses/i2c-s3c2410.c:431:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    if (i2c->state == STATE_READ)
>       ^
> drivers/i2c/busses/i2c-s3c2410.c:439:2: note: here
>   case STATE_WRITE:
>   ^~~~
> 
> Notice that, in this particular case, the code comment is
> modified in accordance with what GCC is expecting to find.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/i2c/busses/i2c-s3c2410.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index d97fb857b0ea..c98ef4c4a0c9 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -435,6 +435,7 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
>  		 * fall through to the write state, as we will need to
>  		 * send a byte as well
>  		 */
> +		/* Fall through */
>  
>  	case STATE_WRITE:
>  		/*
> -- 
> 2.22.0
> 

-- 
Kees Cook
