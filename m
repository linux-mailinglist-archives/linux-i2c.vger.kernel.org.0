Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E48F51CFD2D
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 20:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgELSZW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 14:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730707AbgELSZW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 May 2020 14:25:22 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5B1C061A0C;
        Tue, 12 May 2020 11:25:21 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id e20so11296767otk.12;
        Tue, 12 May 2020 11:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aRj33LryoK4NVw/cU+uGnOCPpYy9kXB0xL4YJW/+HOI=;
        b=G89N+DIXJ0m8qnqW8fmov8F5+bXtV1Cxf3LAykuIZVScjQ+ZARwSFNXr1hE8b20B5H
         AzgCmsGKthY/9dRUpNbGMGbR4nEQxicCWCn/BPWTIVy4lzRDKtaTh6kxX7Vq69iBx06/
         48U4bAgbVjPV2W8ZQYIIQ1ASuQnDcYicgMiWoZx5ck+5+/UPIBiC14HRAqSRd3MjDHXC
         jWcokOmXIZjfUDZKipLw6/PEzgBbfqm+3rogBOtLh6wbiyA1eaSK+d1KBodWPyGpFKOL
         B8RVorM2p8Y2ZQViO8qGwLq0kE9yeCS6h9APel8sVVBOrEu76WF359gmbx3/Bj7Kuu+s
         DqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to
         :user-agent;
        bh=aRj33LryoK4NVw/cU+uGnOCPpYy9kXB0xL4YJW/+HOI=;
        b=DxI6ENAvakjU28X6j5jhizjJLqmtSNqrNOYMq/CpR5Ere3SOEBznwhkVawEBh1s/Ni
         pFZQ919FZUnfaCW+hZQaIPHCP0Ne1dRw1pTjilxcf9GYT/Mbwdm/vX8XGK5Zf49RYxxf
         mIXP+KXGcMwiDgB95Gdkw2MYGcUHwalm9yhXzj9cfAvrnC0K7a7Wq7sGJcjYkQR3xtFc
         +6gwPcDnyzrsB0K6YVCxeJi5gPo2zuwF9WjDs5n5IBK2y8a2az6LHkco4+ZxgH0Ev2R3
         jZxonvy0/fuNom7FFu2TeOBDB+RmbvCHBgaTI6WChg9euzWjkJY579JnB4EhF0AaesP1
         4qqw==
X-Gm-Message-State: AGi0PuaFciBgLq6E4QlkVtgjH8qjnhqj/8DJnB6WyNF+lxe2FJ7lMZ7t
        Y8+MDbWK/o/JODg/VlLKNw==
X-Google-Smtp-Source: APiQypKlJtOmmYqWrL9bW0Hq5Re0MJllNIsFRR4wcUyNq4XGwzZZ4LNXSVxzNiHnXVoifuMpWPvyEA==
X-Received: by 2002:a05:6830:1da1:: with SMTP id z1mr17695608oti.58.1589307920726;
        Tue, 12 May 2020 11:25:20 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id m27sm345076oom.22.2020.05.12.11.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 11:25:20 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:8b39:c3f3:f502:5c4e])
        by serve.minyard.net (Postfix) with ESMTPSA id E06EC180042;
        Tue, 12 May 2020 18:25:18 +0000 (UTC)
Date:   Tue, 12 May 2020 13:25:17 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        openipmi-developer@lists.sourceforge.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] char: ipmi: convert to use i2c_new_client_device()
Message-ID: <20200512182517.GP9902@minyard.net>
Reply-To: minyard@acm.org
References: <20200326210958.13051-1-wsa+renesas@sang-engineering.com>
 <20200326210958.13051-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326210958.13051-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 26, 2020 at 10:09:58PM +0100, Wolfram Sang wrote:
> Move away from the deprecated API.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Ok by me.

Acked-by: Corey Minyard <cminyard@mvista.com>

Do you want me to take this, or is this part of something else?  I can
submit it if you like.

-corey

> ---
>  drivers/char/ipmi/ipmi_ssif.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
> index 8ac390c2b514..2791b799e33d 100644
> --- a/drivers/char/ipmi/ipmi_ssif.c
> +++ b/drivers/char/ipmi/ipmi_ssif.c
> @@ -1945,8 +1945,8 @@ static int ssif_adapter_handler(struct device *adev, void *opaque)
>  	if (adev->type != &i2c_adapter_type)
>  		return 0;
>  
> -	addr_info->added_client = i2c_new_device(to_i2c_adapter(adev),
> -						 &addr_info->binfo);
> +	addr_info->added_client = i2c_new_client_device(to_i2c_adapter(adev),
> +							&addr_info->binfo);
>  
>  	if (!addr_info->adapter_name)
>  		return 1; /* Only try the first I2C adapter by default. */
> -- 
> 2.20.1
> 
