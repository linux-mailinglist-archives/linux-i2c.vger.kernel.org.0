Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6725289839
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 09:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbfHLHsX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 03:48:23 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53877 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbfHLHsW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 03:48:22 -0400
Received: by mail-wm1-f66.google.com with SMTP id 10so11236411wmp.3
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2019 00:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=DtQjHVjml5ABPpPR1FU1RhwW7R/a6XbkhJg8OMveU+Y=;
        b=nGv1sEZfev5qpZR7qeROv6jGSlA0bTJAbD+znLGF4/qd3X1G42eTuIO+sC0/cnkk7d
         GfMoXerkRmwn228WB2yZUjcayuAsZ2860zV9fFAjTrONayx/7K5vMLEx07SLrs2+1I/b
         wroQEKB1AgvnHVbJbqRMzGYJL+m5pjDlfeYYNramiqjWb7R36RW9lLtOnXQyrVofBrgV
         u6IESxqa/F1HSverfUUoGsnyZQmDzqbnzKTyTEzepTNZlmadK9JoM42zIpjuGQRr7+Gn
         z6crx2r2Kic9hojMB3+GlIFSu0RiQYgDb7vr4VIMXQbUgV0Wrva+E8RsA7BLIGY3Xl7k
         hgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=DtQjHVjml5ABPpPR1FU1RhwW7R/a6XbkhJg8OMveU+Y=;
        b=H1souu1Irfc0MOXVNv3F+G0sH9u5i3A2FIsRsXMAKqvP5ppp7S9EokQ+n4mERp1pZi
         mCEE2Tg74hdg6ilTXweT/AFU2vxJ7cqj18SN0Khha4ED+UpC019iyp0gSOrWMgnQwzTv
         diTSOFHEckS7a57/nNHi65Lb4aK3FOgLnHXNfNydcBPh7p4aNyJPKIhNrRKK9wg/YZYI
         x0HfeKM4rHd+h7dQtEByPPkV5ozsCAlYjy8BW1djOFglUjqjM/U6VLNI1qrSFtPazbd7
         KjGIQb21X94L4ZLefMS8o/hchSpCg4lgfyJxQ1I8SkrYx0Bah7NbwwLMMyyxCGFFVOO3
         Lyeg==
X-Gm-Message-State: APjAAAWNz3tTgIC36FYaL2PKSA/6Lh5Y9uvNhOQPrnVHfFaA2C7mkNaj
        1Wb61QKSOzmsIuyk+2RLEuEtIA==
X-Google-Smtp-Source: APXvYqz9WIKblK5DCAAUo+OxYnp5VUq1+T5AlqilAIuRYhcMx9g4QyntUslPo1/CNM2Kko2yPMRM+A==
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr19565551wmk.158.1565596101165;
        Mon, 12 Aug 2019 00:48:21 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id f18sm916948wrx.85.2019.08.12.00.48.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 00:48:20 -0700 (PDT)
Date:   Mon, 12 Aug 2019 08:48:19 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/14] mfd: twl-core: convert to i2c_new_dummy_device
Message-ID: <20190812074819.GF4594@dell>
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
 <20190722172623.4166-15-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722172623.4166-15-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 22 Jul 2019, Wolfram Sang wrote:

> Move from i2c_new_dummy() to i2c_new_dummy_device(), so we now get an
> ERRPTR which we use in error handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Generated with coccinelle. Build tested by me and buildbot. Not tested on HW.
> 
>  drivers/mfd/twl-core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
