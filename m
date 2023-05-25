Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6217108D4
	for <lists+linux-i2c@lfdr.de>; Thu, 25 May 2023 11:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240404AbjEYJ0j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 May 2023 05:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240221AbjEYJ0g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 May 2023 05:26:36 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A38B1B0
        for <linux-i2c@vger.kernel.org>; Thu, 25 May 2023 02:26:33 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3063433fa66so1285962f8f.3
        for <linux-i2c@vger.kernel.org>; Thu, 25 May 2023 02:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685006791; x=1687598791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gWtFhIZ8BYEBC241hJPMRaQ7fL223lARPk2xj1KRlLo=;
        b=ksHvc9/KJc8tm8ddO3VFoE5QrlC2waPNIe++XS9LB0o0JrMFZAeIoo5XiRZa34k8Mm
         adRWW5BpbZbHCCZ3EfKxW0HYE3tT4/G8hy741p+ucGuludmSzf9ymx7MnxkL/zf+7rSJ
         zZmHTHyyj8cNdTrPatdM6xAghgwM5QEDXiAeZZ0A4pkSnLUpNuM5BqLfOm3e9Ax59b1A
         g61peEK9FWKDnhK9YTk3thi8hz/TKMgQ9vxK4+aCTDyZipQDPbMSqoz3Kgy8NnIZJRHg
         Ei3VYs3970BBcCQ860dc+3ztEEvJKCrvwNjWcK8FQBmJCWt4CM2nBqEfoHwU3vpiZ8Fe
         Tltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685006791; x=1687598791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWtFhIZ8BYEBC241hJPMRaQ7fL223lARPk2xj1KRlLo=;
        b=kJgEUP6b24DFvNBpfWLNVOtMmI2BVItZPaFdTT0FBg+68QqujOhlF+kFu2Be0Lcw5C
         HPvNXlbqIvbi/JKKmoKBEmo1npDM5G1xl7Qwe9fe/UZclKEOgzmHleO9SZAir3Bh+67x
         ahwkP2nrUGK2HGj93cu2OcMiFqW8lAJOWoSnUHVToYeLXE5/4LRvm9vWlUcHKidfwjRM
         yNIyZkG3QOhWkxq81yEBoT0X6AyvUVhdlO2ufKhxiKbzQDnXWkV9b7khbfrexWeZr4jv
         aiNPXFPhwgS31syvhmn0zZsBj+l2QXqqQNvZinh1VZNPJqGUIXNe4dRdJn3V0XY4DC+8
         lT3w==
X-Gm-Message-State: AC+VfDxA/IBP2xRG4OMbHLghTJ9fzYZX0/UBOK5d5h6oiofUujsicuFi
        j0YAI65tdKJeVyM3q60rp3Kxrw==
X-Google-Smtp-Source: ACHHUZ6EY3c+1h77d9ed/WvmP29ij6SAXuvZPnWlcLcj5atxSqIiFQxktBiFzLlEuGFH7mf26UtKbA==
X-Received: by 2002:adf:e550:0:b0:306:2fac:f88 with SMTP id z16-20020adfe550000000b003062fac0f88mr1828144wrm.28.1685006791750;
        Thu, 25 May 2023 02:26:31 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o16-20020a5d58d0000000b002ffbf2213d4sm1139017wrf.75.2023.05.25.02.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 02:26:30 -0700 (PDT)
Date:   Thu, 25 May 2023 08:05:58 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Wang Zhang <silver_code@hust.edu.cn>,
        Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        hust-os-kernel-patches@googlegroups.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: ocores: use devm_ managed clks
Message-ID: <1b0de79d-87c9-46df-8b2f-f40bf58108c5@kili.mountain>
References: <5572a733.abc0.18846f13b0b.Coremail.m202171703@hust.edu.cn>
 <20230524154318.2259-1-silver_code@hust.edu.cn>
 <68c4b991-6af9-36e8-354c-7c3b232ba4c2@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68c4b991-6af9-36e8-354c-7c3b232ba4c2@wanadoo.fr>
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 24, 2023 at 09:21:56PM +0200, Christophe JAILLET wrote:
> > +	if (ret) {
> > +		dev_err(dev,
> > +			"clk_prepare_enable failed: %d\n", ret);
> > +		return ret;
> >   	}
> > +	rate = clk_get_rate(i2c->clk) / 1000;
> 
> Now (because of the devm_clk_get_optional_enabled()), i2c->clk can be NULL,
> so this would deference a NULL pointer.
> 

No, it's fine.  clk_get_rate() checks for NULL.  When a function returns
a mix of error pointers and NULL, like devm_clk_get_optional_enabled(),
then all the functions like this must have NULL checks built it.

regards,
dan carpenter

