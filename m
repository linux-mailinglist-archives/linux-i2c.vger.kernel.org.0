Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 867B06E58BF
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Apr 2023 07:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjDRFp2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Apr 2023 01:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbjDRFp1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Apr 2023 01:45:27 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA54A59EE;
        Mon, 17 Apr 2023 22:45:25 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id n43-20020a05600c502b00b003f17466a9c1so2391445wmr.2;
        Mon, 17 Apr 2023 22:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681796724; x=1684388724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1ADNshtuQim5hM1x1Shj3YAMTd37o0HS05k3ox15pY=;
        b=j/wV1IjbG/zGIZLgwdqPONxBfoS4rX8ZyHZASdBQqXt5SkCDeJE8PAp2HorlBnI3V8
         2jjSkkg+swSTN/W+GFXiNVzFXTAs6us28V+Z4Qoe2QXmXGSnbDHPQMncrSe/rh3qqqTn
         Jp6v6S5LAPvGgVQ5SoFrERz0qRpMUzxkieFLM2M7MD4A5KLXYEdM5jO95+VfOM/f16Vi
         hRqBHM4x/R8ODhubwWSToQCXb21KOCRt47nJer25Eb1mRe0WKZNzWYaFP8bZuTuOhnFC
         9Z86o8i+whI7j/NThuKvdhAAEl0lb2Up+Qh/6QrPGtB2SM90TVj2V+KkNAjYJK0qHR4T
         17Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681796724; x=1684388724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1ADNshtuQim5hM1x1Shj3YAMTd37o0HS05k3ox15pY=;
        b=UHzn5+eZ/bd9Lr5fGRicFl9IIjhjgVMZMNeQdea0zlVHErS6rxcz5pp7y8wsVb7g+Y
         m2ry4OstlzyDxb8lrKzGMqJyZY02gtIxvm1CvAtb/4lbz+rI8TkN3I7yBOS373D4YaKx
         u2ynOaRHOyGxNJPkWlWjlbXi+3u4qma8EcKwfLTlZNbGADGAQvG2hQTd3jhk6P+LCViS
         dH8ETNwMlKqbDmrCtmMR8UOH5h1emTklS0SGa9XFscxbOYph+oGRRxNoDw2g7Gm2DU7c
         7sL7hC9XxRVIYXyGjyVBLkvNIt/nzUWz1+Le+b51w1OQuBTEWm9psOWQZsvQ/OGB8vu9
         1j2Q==
X-Gm-Message-State: AAQBX9fdDApovRAgPO9bhtlqV63JD7i3tM8F6Q++eapsdtetTrWUUIlz
        ViNFrOt9U4hIRr0MxK+6q6U=
X-Google-Smtp-Source: AKy350b+hbdoOxoywzlVe09SIwc3UvFHktGNtx37Qwm9EE0F3sDcxFkrc8Es4m4VNSDe1XQpJFNaCg==
X-Received: by 2002:a1c:cc1a:0:b0:3ef:6b97:f0c3 with SMTP id h26-20020a1ccc1a000000b003ef6b97f0c3mr13632497wmb.15.1681796724046;
        Mon, 17 Apr 2023 22:45:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c22c800b003ef71d541cbsm13859069wmg.1.2023.04.17.22.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 22:45:23 -0700 (PDT)
Date:   Tue, 18 Apr 2023 08:45:20 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Wang Zhang <silver_code@hust.edu.cn>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        hust-os-kernel-patches@googlegroups.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: ocores: add missing unwind goto in
 `ocores_i2c_probe`
Message-ID: <82673cff-6571-43fc-9b64-3af2c72593c3@kili.mountain>
References: <20230418053814.117215-1-silver_code@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418053814.117215-1-silver_code@hust.edu.cn>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 18, 2023 at 01:38:13PM +0800, Wang Zhang wrote:
> Smatch Warns:
> drivers/i2c/busses/i2c-ocores.c:701 ocores_i2c_probe() warn:
> missing unwind goto?
> 
> The error handling code after the err_clk label should be executed to
> release any resources that were allocated for the clock if a negative
> error code returned after platform_get_irq_optional.
> 
> Fix this by changing the direct return to `goto err_clk`. 
> 
> Signed-off-by: Wang Zhang <silver_code@hust.edu.cn>
> ---
> v2->v3: the first patch had issues. Just do a much simpler fix. No need 
> to add the check. clk_disable_unprepare() has checks for error pointer 
> and NULL already.
> v1->v2: change `ocores_i2c_of_probe` to use `devm_clk_get_enabled()`

I meant send it to the public mailing list.  Don't add the other
comments which are related to discussions on this list.  Just say that
the public 1 was buggy and the this new v2 patch is simpler.

regards,
dan carpenter

