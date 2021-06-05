Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B0F39CB8B
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Jun 2021 00:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhFEW4j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Jun 2021 18:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhFEW4i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Jun 2021 18:56:38 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00EC6C061766;
        Sat,  5 Jun 2021 15:54:34 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id o17-20020a17090a9f91b029015cef5b3c50so9544499pjp.4;
        Sat, 05 Jun 2021 15:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7WW7MVjUd4A4JBbattHSphqobV8OaJ0qnLtzvXKLl5I=;
        b=U0el1J7GHyg5FaHe3HhzCHTzutyy53GTpLvorM0ooJqVHeIApUlO3QBZtQi0PrI3In
         uSDhj75SIDK7Ov6oBeiDPH4U7IoIS1Eo4feFccZDSmQI8bvHvvRG7u6GoYT1sViHNcgi
         cGPWiBZd9eNFNbiu/I+pjlIz0HxDeHFyA0TxdSoVHbb3hR1/0JO1W6zgFOquT3Da5k5u
         PeyutytwyJeVTyG6w1Fp8Zbf6jDK1IfGbnZria7HtRj52qdrzN+hyRXrq2MMwWWtvatL
         6l1kQR5tEYK2T3SqBqx9XDtU5dxskueJSk1LalR5CnPAGaLGRZDDfi1DC2AuKeFnWRRq
         sWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7WW7MVjUd4A4JBbattHSphqobV8OaJ0qnLtzvXKLl5I=;
        b=P/4GCaI0RgTHlruh+AeqJEz1DoUOB5ZxrdZhoHOf2wkI48nGqgZaYDnv5kI9YixKMN
         sUavOEQcWb4gdtAhBtZIkm7yffjOFQe+9Reg9PTdQ5fklxNV6c3dfyLqoLwClVV+HysQ
         DptL+DTklzvxw596bXhJD8xGeZoTx5ZbPjFZRGerOI2MUXux1pFCgTesSpEi4qX8LnNd
         d3JbWvKCCAJCGcZtP+8N9sTOeuPMQDcmS0CT6rdnJD40ZeQU6EQ0bVu51xfIOuHduBpd
         p3istyQcrdkf/lOv4gWy4yg1aPAjzc0Ue6psMpzIDK1efcQTW40dcx1iulGq9H2DukJ4
         gcaA==
X-Gm-Message-State: AOAM530Qw/HVx2cGMZIMXIcSZ/ZNeYnKLIMX44a/3lax1zCkakLndXVR
        BFzTbOQqBsABzh5ESq29kgE=
X-Google-Smtp-Source: ABdhPJwChWRijKnNgO+wY5ML6bVvrJ7nq5v1EjuDBYe3QJbdfRRSXPuszJ99YKQI8gdSrOVp3BmCqQ==
X-Received: by 2002:a17:90a:4a0e:: with SMTP id e14mr24647178pjh.209.1622933671096;
        Sat, 05 Jun 2021 15:54:31 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:5762:ab6a:6802:ef65])
        by smtp.gmail.com with ESMTPSA id gw21sm8177795pjb.41.2021.06.05.15.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 15:54:30 -0700 (PDT)
Date:   Sat, 5 Jun 2021 15:54:27 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] i2c: core: Disable client irq on reboot/shutdown
Message-ID: <YLwAo2L7n0IJ+Q3/@google.com>
References: <20210604232744.1259150-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604232744.1259150-1-swboyd@chromium.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 04, 2021 at 04:27:44PM -0700, Stephen Boyd wrote:
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> If an i2c client receives an interrupt during reboot or shutdown it may
> be too late to service it by making an i2c transaction on the bus
> because the i2c controller has already been shutdown. This can lead to
> system hangs if the i2c controller tries to make a transfer that is
> doomed to fail because the access to the i2c pins is already shut down,
> or an iommu translation has been torn down so i2c controller register
> access doesn't work.
> 
> Let's simply disable the irq if there isn't a shutdown callback for an
> i2c client when there is an irq associated with the device. This will
> make sure that irqs don't come in later than the time that we can handle
> it. We don't do this if the i2c client device already has a shutdown
> callback because presumably they're doing the right thing and quieting
> the device so irqs don't come in after the shutdown callback returns.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> [swboyd@chromium.org: Dropped newline, added commit text, added
> interrupt.h for robot build error]
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
> 
> Dmitry, please add Signed-off-by so this can be merged through i2c
> 
> This supersedes https://lore.kernel.org/r/20210510220012.2003285-1-swboyd@chromium.org
> 
> Changes from v1 (https://lore.kernel.org/r/20210604212752.3547301-1-swboyd@chromium.org)
>  * Add interrupt.h include for robot
> 
>  drivers/i2c/i2c-core-base.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 5a97e4a02fa2..e314ccaf114a 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -24,6 +24,7 @@
>  #include <linux/i2c-smbus.h>
>  #include <linux/idr.h>
>  #include <linux/init.h>
> +#include <linux/interrupt.h>
>  #include <linux/irqflags.h>
>  #include <linux/jump_label.h>
>  #include <linux/kernel.h>
> @@ -627,6 +628,8 @@ static void i2c_device_shutdown(struct device *dev)
>  	driver = to_i2c_driver(dev->driver);
>  	if (driver->shutdown)
>  		driver->shutdown(client);
> +	else if (client->irq > 0)
> +		disable_irq(client->irq);
>  }
>  
>  static void i2c_client_dev_release(struct device *dev)
> 
> base-commit: 8124c8a6b35386f73523d27eacb71b5364a68c4c
> -- 
> https://chromeos.dev
> 

-- 
Dmitry
