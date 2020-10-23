Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85D4C29724B
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Oct 2020 17:28:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S462246AbgJWP2s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Oct 2020 11:28:48 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:36886 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S465812AbgJWP2r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Oct 2020 11:28:47 -0400
Received: by mail-ej1-f67.google.com with SMTP id p9so2944029eji.4;
        Fri, 23 Oct 2020 08:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8VWmVh1g5wU3te7Rzl0E5HboJR4NG/dn6wbec4O2niQ=;
        b=uMkdM40JdCsFIBlEmvnOusoy20UsxTIBcmmnfYKJ3G1MVxqN48fAILdaSb2LFdKybB
         jnOO1jOttvrDnxdKrw6aaLQHR3fSJHF1x2eQI4mUd3R7kj0jGECkgKMoVGwNp2I/7G+j
         lvzBY91+Gs8+yb4xPNvnhbrEVIsfAnUtXUOYlW4LYl2ndSchsnQwvli+LsegPOAy0pjC
         2kukkm0ibEbMRj72qsZ/2GmFNNi5BDR5pD1qiaJXKvcqKHBcaqIPMhe0mwpgaed0Z4kb
         F/1X5VTabr3G9RfxP5EJg00btiH/hSeMFn6IdD6fyyYNwXEaltdrva7N2Z6SHkMmTFBd
         5VmA==
X-Gm-Message-State: AOAM533iL0mlBbQEU8f1a4NbVR6kBxCpT5Gh65xxvNrRIv6hIjen218+
        G+NJ3bJnhfVCO8nLmD9sWIs=
X-Google-Smtp-Source: ABdhPJx3vdJo1BSJWo8drebFDOaoi+uI+K9sO8Av8jwfByJcXHiSiDPwQs12Le8pPww4GnFk+EwZ/A==
X-Received: by 2002:a17:906:48c:: with SMTP id f12mr2639269eja.467.1603466925850;
        Fri, 23 Oct 2020 08:28:45 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
        by smtp.googlemail.com with ESMTPSA id s6sm994985ejx.79.2020.10.23.08.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 08:28:44 -0700 (PDT)
Date:   Fri, 23 Oct 2020 17:28:42 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     peng.fan@nxp.com
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: Re: [PATCH 2/2] i2c: imx: remove id_table entry
Message-ID: <20201023152842.GA5227@kozik-lap>
References: <1603441103-17735-1-git-send-email-peng.fan@nxp.com>
 <1603441103-17735-2-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1603441103-17735-2-git-send-email-peng.fan@nxp.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Oct 23, 2020 at 04:18:23PM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The legacy platform device code has been removed under arch/arm/mach-imx,
> so we no need id_table entry here.

Cc: Greg, Geert, Angelo,

Aren't you breaking Coldfire platforms?

Best regards,
Krzysztof

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ba9d639223ec..7ea36a78abb0 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -233,19 +233,6 @@ static struct imx_i2c_hwdata vf610_i2c_hwdata = {
>  
>  };
>  
> -static const struct platform_device_id imx_i2c_devtype[] = {
> -	{
> -		.name = "imx1-i2c",
> -		.driver_data = (kernel_ulong_t)&imx1_i2c_hwdata,
> -	}, {
