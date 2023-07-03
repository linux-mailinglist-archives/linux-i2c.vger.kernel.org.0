Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16940745CA2
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 14:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbjGCMyy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 08:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbjGCMyx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 08:54:53 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABFCE66
        for <linux-i2c@vger.kernel.org>; Mon,  3 Jul 2023 05:54:49 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4faaaa476a9so6984926e87.2
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jul 2023 05:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688388888; x=1690980888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v5vg9Foed0fGCLC6fQJ5romEdNjTvzK0Z22HuX4YlC8=;
        b=MERyF2xCJciAebpUiqy0zwAbC24deTvw1RwzN3BR8IZCD880dFkQ1l6D7p1YrNVhB/
         NjHdxMDIlqfAumkUCrhAOP2YainVjYPtR/Ynu84dn8MJbM9rZ3y0h1qIYr/DMbIWS4CX
         ULyECsOvataTrEcdgqI188rTAbYeWjPO1uUcs/7r4dNELh8YZDI3zaYHsAjqumVJ0lVI
         jHZY0wuRiFqhMYl6h1LzFlRs5iXDNOB9gm+hCmYJ/7D3CYxNMgjZeGNUl742v6TShtiF
         mqC+t07h7mq96RBdPF/FHvA6Wwiagf/pGegfFQ5P0LdJdVlvDmR4exkUwEH/nFpXvPAv
         A/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688388888; x=1690980888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5vg9Foed0fGCLC6fQJ5romEdNjTvzK0Z22HuX4YlC8=;
        b=FUYFwzQWACbx3cxSSLmXcJvqk/9DNMzg70SyAdg4c7Ol5k/zM5agUL67wdlRTYT1+I
         pO/dsfJ+RtdR3qfStZ8bWQSHOfzdt9iIqeyQWYZtrcIKRuaWQmKzzc0jmnNvoZQN9z8b
         uhY1ehn5SuBDNNHXz1bt6+Kp+jhWMWFoaT2jZCP8Eh8ePZkHAgVJfirdWYJyMmZgLV3F
         +VIL+IF8ef+XDLnh6TWocs50O0gzmkbgh7KXarjp/rc0d4CL1jGwa6kkaoAtLZMeeYlQ
         eqS6plcTT3HA67IGOKIazWb2AlAaeEV+VbZ/wZkNf1iFQDq7rih1fx0x+5tixtnwaOJD
         VzIQ==
X-Gm-Message-State: ABy/qLbW/k/ftZhhTg/En3DNxadcQh1C1zDVwDnF4zxzt5fJTtoFULYV
        UmogwYbLWl5P+9dwkXWA1wIf5Q==
X-Google-Smtp-Source: APBJJlHM1frPemlXRN9IjBwImUu2ICaLNU9ZsDkBq1O2R5IQ80yEgdN0B+79v6mSaJM1VkkZNzRCjA==
X-Received: by 2002:a05:6512:33c9:b0:4f8:7325:bcd4 with SMTP id d9-20020a05651233c900b004f87325bcd4mr7993114lfg.0.1688388887459;
        Mon, 03 Jul 2023 05:54:47 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q20-20020a1cf314000000b003f90b9b2c31sm30179834wmq.28.2023.07.03.05.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 05:54:45 -0700 (PDT)
Date:   Mon, 3 Jul 2023 15:54:42 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     wsa@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: busses: i2c-nomadik: Remove a useless call in
 the remove function
Message-ID: <885ee9fa-f56c-4e21-b648-866dd4e1dc0f@kadam.mountain>
References: <62ae6810d41e0429ebaadfac8a95409f4bc72456.1688160163.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62ae6810d41e0429ebaadfac8a95409f4bc72456.1688160163.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 30, 2023 at 11:23:28PM +0200, Christophe JAILLET wrote:
> Since commit a410963ba4c0 ("Merge branch 'i2c-embedded/for-next' of
> git://git.pengutronix.de/git/wsa/linux"), there is no more
> request_mem_region() call in this driver.
> 
> So remove the release_mem_region() call from the remove function which is
> likely a left over.
> 
> There is no details in the above commit log, but at its end we can read:
>    Conflicts:
> 	   drivers/i2c/busses/i2c-nomadik.c
> 
> This may explain why this call has been left here.
> 
> Fixes: a410963ba4c0 ("Merge branch 'i2c-embedded/for-next' of git://git.pengutronix.de/git/wsa/linux

The reason why you're so confused about this Merge commit is because
it's completely unrelated to the bug.  :P  It should be:

Fixes: 235602146ec9 (i2c-nomadik: turn the platform driver to an amba driver)

When you look at that commit, you'll see that your patch is correct.

regards,
dan carpenter

