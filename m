Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3DC539B52F
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 10:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhFDIvs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 04:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhFDIvs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Jun 2021 04:51:48 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645FEC06174A
        for <linux-i2c@vger.kernel.org>; Fri,  4 Jun 2021 01:50:02 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id z8so8454976wrp.12
        for <linux-i2c@vger.kernel.org>; Fri, 04 Jun 2021 01:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/D69yTYy/RC+3+Gp37xgtg3/qvq6X7jOP7lOc/gB+gE=;
        b=mBMUWtpmp7a0Br0LRC+gmr2FtS4tA3BNbD4wY4neoXz2LN9c7RyrwVnwEavCesKsyN
         yEjyvITF6krunV+NlMhtSTOfM7lsXZa2C5xD9xjU5O68OPyIQt6QW459HAzH03Quh40Z
         UDb8lF8f7nYnvrRNlQvEY+0AM21HOpA857eNZz/5WqjYO10WUhRBYe9wfV7ZxlYTnfKt
         wgpTtNZu/19Y9zxwFhpHXM1uvJ/DhWnozYiw+7c2ChyIrH2VFtW/9ygpxoiIYi+lR68m
         4/LnT4e2tUNRBmaIaONaQD9Ahbf2j+TJcvujuNvKsXXjo/PriTUU8A0b9YlBc3aeJJ5U
         D+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/D69yTYy/RC+3+Gp37xgtg3/qvq6X7jOP7lOc/gB+gE=;
        b=ZOzJz6YpzKqq1d6aaS8pqY8cdTI8dydahrzu3O9YDBaCnAlGHmdB9Qj9d5fE+wpjnO
         vuWUCK2dTt149BiUABAdLi7U6DXmO+er6Fn0OnOVbjzlrbZW9FgEozJSK/cx4QuGkov0
         FpbVCaiKdjHlNuiKCw8BfycMMKJmYqA3bT083esAeAWPkCk9Md4n8CjjJG+W/ZhQZqUH
         NF6zDW+dKunSKnm7mTiqh8dQEGnCbo0G8ojjXJptGMK5EsUMLdQbYUMqRV0PxrxKtKBq
         Js8MbTxByK3LqOsoOVM7au+0Tlg5CHmdDfBzPfoc+dv+z8+24Rgu6x9R9ivRo1cg2rrY
         PNtw==
X-Gm-Message-State: AOAM533Uj7r+d2wq5WMUuSRUwNiNHfHZqNy1RbhBJHrzxW/Fjy/Z415C
        Em0f9+rM534bsMjVz3JUgotReA==
X-Google-Smtp-Source: ABdhPJxxP114GNC4/2C7yXDIyMBIZZtQbzMtTtT4lWMDBF34za4ZMA3kHxXv9f3ZpMzYRVfe870NBw==
X-Received: by 2002:adf:e5c1:: with SMTP id a1mr2723662wrn.16.1622796601063;
        Fri, 04 Jun 2021 01:50:01 -0700 (PDT)
Received: from dell ([91.110.221.214])
        by smtp.gmail.com with ESMTPSA id p6sm6085885wrf.51.2021.06.04.01.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 01:50:00 -0700 (PDT)
Date:   Fri, 4 Jun 2021 09:49:58 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Anders Berg <anders.berg@lsi.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 05/16] i2c: busses: i2c-axxia: Fix formatting issue in
 struct and demote unworthy kernel-doc headers
Message-ID: <20210604084958.GH2435141@dell>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-6-lee.jones@linaro.org>
 <YLk7P3+vcR1hNpBO@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YLk7P3+vcR1hNpBO@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 03 Jun 2021, Wolfram Sang wrote:

> 
> > -/**
> > - * axxia_i2c_dev - I2C device context
> > +/*
> > + * struct axxia_i2c_dev - I2C device context
> >   * @base: pointer to register struct
> >   * @msg: pointer to current message
> >   * @msg_r: pointer to current read message (sequence transfer)
> 
> Shouldn't we keep the kernel-doc header here?

There are a couple of missing descriptions still, but a) since a
concerted effort seems to have been made with this and b) the
remaining descriptions look fairly generic/trivial, I'd be prepared to
re-work this patch.

Will fix.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
