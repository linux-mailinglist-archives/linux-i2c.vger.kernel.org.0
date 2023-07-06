Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C40E47494AC
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 06:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjGFE1e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 00:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjGFE1d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 00:27:33 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51DFB1BCE
        for <linux-i2c@vger.kernel.org>; Wed,  5 Jul 2023 21:27:32 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4036507ddadso2892201cf.3
        for <linux-i2c@vger.kernel.org>; Wed, 05 Jul 2023 21:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688617651; x=1691209651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lWn3ZmGsuOlmAkmehfw3AOignGBknyVRUgruIj3HTDY=;
        b=I6/AatYJtVquephqTGfDOLAZ095BICv1inuNDwxYqUoGQKd4Ks7xN8Sj7VthJgJHID
         UioKpjBih4zSIG+3rqBLMokxxAreB5IfSFfjYDxNI//YE1D18mFhFX26jzKS/13ZHqiS
         V5dEYnpIeaq1CRYhuYQpLXP82SQwXqaer6ASfNl70LxkzepwrQn3cZLB8J9fZy6PlchU
         +H+Q5DBGHPlD0xzalmC9UlzaNiza6/vuK+hN88nYgnWhTSTjInHvNqCM2b9+4iKn+EuL
         DSeYNSk8IsaK3DZc6ghlTZjWtLnE7oOz35A+eDgXuaEEW1/SuHifeFp608bBpOARYpEe
         bA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688617651; x=1691209651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWn3ZmGsuOlmAkmehfw3AOignGBknyVRUgruIj3HTDY=;
        b=VMXIfiuy98INsoE2XDqKn7mqde+rggESKupuWIejF9FyLwqrGzGt4rTYKU6kgAUzrn
         gb1+ziCCYeEmAHpJQjMzX4FLXnMtMpInhJnecsSiNDPyxyVXPjpzK/qy0rDmhVux1FKy
         6gmAX+ZSyUUgTE3KprKJNvvK4adiXwW7uactjwPvUKKqW+PLfDKG6otcwFECuKgPCVvZ
         Y00amVO2+E8vplAfCwfWjfXFgssqvLhrCqPVXu5SvbfvyEzZEXic87QD42Ba72St37iy
         JxEx+3mj1PyvT/S5aeEQoAjf/XnswaEHliBJPMbiiVXypFNOIp3+VxEQHfqS96IuxbJC
         ZozQ==
X-Gm-Message-State: ABy/qLaDuDi4UBxjZ4kjpLREPyyEG5LsI5ivN3Eh9XX/htD4eWjVTx1L
        GE/C3Y3Ht4cQhARyPuVRrgUzwM+r3W1bqArUYz4=
X-Google-Smtp-Source: APBJJlHBTMfw8j9NVv45cPqnaVRJE9Hz2jtigI6TMIiJsXSTrNrAd9L/9DAMRmi2JyXZPsLJ+H+JoQ==
X-Received: by 2002:a05:622a:c:b0:403:4fa6:a5d5 with SMTP id x12-20020a05622a000c00b004034fa6a5d5mr821207qtw.64.1688617651177;
        Wed, 05 Jul 2023 21:27:31 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id s2-20020a639242000000b00553c09cc795sm361895pgn.50.2023.07.05.21.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 21:27:30 -0700 (PDT)
Date:   Thu, 6 Jul 2023 09:57:28 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Conghui Chen <conghui.chen@intel.com>,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 22/23] i2c: virtio: Remove #ifdef guards for PM related
 functions
Message-ID: <20230706042728.htavo5bgeygjyfau@vireshk-i7>
References: <20230705204314.89800-1-paul@crapouillou.net>
 <20230705204521.90050-1-paul@crapouillou.net>
 <20230705204521.90050-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705204521.90050-4-paul@crapouillou.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05-07-23, 22:45, Paul Cercueil wrote:
> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> ---
> Cc: Conghui Chen <conghui.chen@intel.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: virtualization@lists.linux-foundation.org
> ---
>  drivers/i2c/busses/i2c-virtio.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> index 4b9536f50800..c60ae531ba57 100644
> --- a/drivers/i2c/busses/i2c-virtio.c
> +++ b/drivers/i2c/busses/i2c-virtio.c
> @@ -243,7 +243,6 @@ static struct virtio_device_id id_table[] = {
>  };
>  MODULE_DEVICE_TABLE(virtio, id_table);
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int virtio_i2c_freeze(struct virtio_device *vdev)
>  {
>  	virtio_i2c_del_vqs(vdev);
> @@ -254,7 +253,6 @@ static int virtio_i2c_restore(struct virtio_device *vdev)
>  {
>  	return virtio_i2c_setup_vqs(vdev->priv);
>  }
> -#endif
>  
>  static const unsigned int features[] = {
>  	VIRTIO_I2C_F_ZERO_LENGTH_REQUEST,
> @@ -269,10 +267,8 @@ static struct virtio_driver virtio_i2c_driver = {
>  	.driver			= {
>  		.name	= "i2c_virtio",
>  	},
> -#ifdef CONFIG_PM_SLEEP
> -	.freeze = virtio_i2c_freeze,
> -	.restore = virtio_i2c_restore,
> -#endif
> +	.freeze			= pm_sleep_ptr(virtio_i2c_freeze),
> +	.restore		= pm_sleep_ptr(virtio_i2c_restore),
>  };
>  module_virtio_driver(virtio_i2c_driver);
>  

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
