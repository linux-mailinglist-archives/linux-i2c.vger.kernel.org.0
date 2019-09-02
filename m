Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3DC8A527B
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 11:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729871AbfIBJGb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 05:06:31 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55408 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730361AbfIBJGb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 05:06:31 -0400
Received: by mail-wm1-f67.google.com with SMTP id g207so9678372wmg.5
        for <linux-i2c@vger.kernel.org>; Mon, 02 Sep 2019 02:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=vk932Vys+CLH+PYMQTmQanJUcuUkUcICT2MwDqcBiS0=;
        b=bcV4yk+rItw9l/wFE0TxyB6pGn6AtTSM3Im/W7tDmwgW4iSgB900K3KyOPutdgN6zN
         7/WGFxLcArKGSKqo91waD5u2mSNV4DuJdI56yZy9qdlqsM90vtC+NKu4NXQv3zTFzBI7
         1H+blzZV7GnO/UVjFLteAdOH6YuoUm52fUY/aLX+ALMjEI5fjOWPQCtQSpesesY3dcFj
         P0xoYOhOj//gzXFkR+oCaoWBchYxqbCYHIgA7AmkwxqgXvHHgN9S66VtdJayU2kYWLTE
         X+vVmWuQfZl+6I5Smhm/BWG3++sYBZwFCXkChZP24bpfxB3mCwdEOST5raA9ICdtlg+e
         BBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=vk932Vys+CLH+PYMQTmQanJUcuUkUcICT2MwDqcBiS0=;
        b=RL4GlCbvTZy4++rzNQgSGs74qa2er7GoMHzunmXFZUAJLYuDBe7dbK5IGFvstxUidP
         92n1iyq0rt6VAZ1t/w2c68nFXbC/lBUVcZcId7w1YXSIB5aefuvKR7ob1qLhqqkbl3r2
         /OrJexRYQkwPTOdpYc/W1V7CeLIYEmQ16nFtZZHQqBzSZHDoLJo+uFIwme2XT3bLDmOF
         lH6KGAiyzrD9CtP8TxR9mLGOq0FWhTDkR6iFSWo1e53vWxJNtWZp73RBD2zvONBQZNsG
         OOurzS5d6lm8if7dbufcZLDEs2IXOw5J2IJGNy1D0ur4jvialYEcv9e8ORG8r5MN1eKc
         RAUQ==
X-Gm-Message-State: APjAAAVQ5zv4Zklp2Ni5106k2Ia454HsPEIpuaZQm4tG+4XDQ+i4rMhQ
        sXCIXHfgazW4A2Rb0K6TR1aPnw==
X-Google-Smtp-Source: APXvYqx8mEwUka9hFdAHZ+mM1+uEWXF2IMYesgnoygQVOr1y5o+xLgB2s8OyHyPVf/1hH0+E4zsA1Q==
X-Received: by 2002:a1c:80ca:: with SMTP id b193mr563102wmd.171.1567415189114;
        Mon, 02 Sep 2019 02:06:29 -0700 (PDT)
Received: from dell ([95.147.198.93])
        by smtp.gmail.com with ESMTPSA id e3sm9942559wrh.12.2019.09.02.02.06.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2019 02:06:28 -0700 (PDT)
Date:   Mon, 2 Sep 2019 10:06:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: htc-i2cpld: drop check because
 i2c_unregister_device() is NULL safe
Message-ID: <20190902090627.GD32232@dell>
References: <20190820153443.7812-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190820153443.7812-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 20 Aug 2019, Wolfram Sang wrote:

> No need to check the argument of i2c_unregister_device() because the
> function itself does it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Build tested only, buildbot is happy, too.
> 
> Please apply to your tree.
> 
>  drivers/mfd/htc-i2cpld.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
