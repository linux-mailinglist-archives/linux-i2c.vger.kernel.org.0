Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C55161E8ACA
	for <lists+linux-i2c@lfdr.de>; Sat, 30 May 2020 00:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728707AbgE2WCf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 May 2020 18:02:35 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:41264 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728608AbgE2WCd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 May 2020 18:02:33 -0400
Received: by mail-il1-f195.google.com with SMTP id d1so3965141ila.8;
        Fri, 29 May 2020 15:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ey+euqvOmqUImoTBB2c0M0l++8FF2H9dMAuHLAI3Tqc=;
        b=AMDqbMQDmzx81TuMDddBm+6bVzwr4xB2g13DTqQ+QGSg+YXL5SJgOtx9HTCcwY77Xs
         Bg6GnUfbvwBK6UJdRArImkndV2iVhoxxGstL9+X4ZxGrO/yNW6KnZhAmj9Mvypx1zH0X
         oBL7IBPST2jVmUOcday2FZKNirVUWdTWWMX4Be0+Q35ka4GoBwsg1tR1F7pRpq8Fzf90
         5aRJfAMkaOO4aKRKiJx44v/0KFVfWEpRyeUTapukaJV8tyDu3iqh71Mv0FXuBiWM0G8U
         kc5ubGRSlOIt2Us4O4LgtoX0MQabtBHPMD0x9FyLby37I7l94mTiMqldwcy9xqSneR8t
         iC7g==
X-Gm-Message-State: AOAM533cC+/jzilGhhgQZyx/LEcZXomeCs8Istw8Bo/O+ci2AHQNJsFj
        6oqvLjKDOxFkxiuiNr7yrw==
X-Google-Smtp-Source: ABdhPJzNWmmXUGBwhds+2xenwoMMy1OTA6A0d/d1mqOwtAUoqyJfHTffiePOi46UYGDeJSKGzIC8Ew==
X-Received: by 2002:a05:6e02:11b2:: with SMTP id 18mr9916280ilj.229.1590789751505;
        Fri, 29 May 2020 15:02:31 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id p75sm5426367ilb.23.2020.05.29.15.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 15:02:29 -0700 (PDT)
Received: (nullmailer pid 3063727 invoked by uid 1000);
        Fri, 29 May 2020 22:02:28 -0000
Date:   Fri, 29 May 2020 16:02:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
Subject: Re: [PATCH] i2c: add 'single-master' property to generic bindings
Message-ID: <20200529220228.GA3052199@bogus>
References: <20200527113039.5380-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527113039.5380-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 01:30:39PM +0200, Wolfram Sang wrote:
> It is useful to know if we are the only master on a given bus. Because
> this is a HW description of the bus, add it to the generic bindings.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
> ---
> 
> We added 'multi-master' back then because most busses are single-master
> and 'multi-master' was the exception. In hindsight, however, this was a
> bad choice because 'multi-master' should be the default, i.e. if you
> know nothing, you should assume there could be another master.
> 
> So, we can't deduce that a missing 'multi-master' property automatically
> means 'single-master'. That's why we need this new property.
> 
> I am a bit tempted to mark 'multi-master' as deprecated because the
> default should be multi-master. However, it might also be a bit more
> descriptive to let "no property" still mean "we don't know". I'd be
> thankful for more opinions here.

Could you just have different timeouts for clearing stalled bus. You 
know quickly if 'single-master' is set, but have to wait longer if not?

Note that we need to add a bunch of these properties to dt-schema 
i2c-controller.yaml. I hadn't done that because I want to dual license 
in the process, but lots of folks have touched i2c.txt IIRC.

Reviewed-by: Rob Herring <robh@kernel.org>

> Thanks and happy hacking,
> 
>    Wolfram
> 
>  Documentation/devicetree/bindings/i2c/i2c.txt | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index 819436b48fae..438ae123107e 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -70,7 +70,12 @@ wants to support one of the below features, it should adapt these bindings.
>  - multi-master
>  	states that there is another master active on this bus. The OS can use
>  	this information to adapt power management to keep the arbitration awake
> -	all the time, for example.
> +	all the time, for example. Can not be combined with 'single-master'.
> +
> +- single-master
> +	states that there is no other master active on this bus. The OS can use
> +	this information to detect a stalled bus more reliably, for example.
> +	Can not be combined with 'multi-master'.
>  
>  Required properties (per child device)
>  --------------------------------------
> -- 
> 2.20.1
> 
