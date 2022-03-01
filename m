Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC2684C9182
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 18:29:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236099AbiCARa3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 12:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236055AbiCARa3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 12:30:29 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C06433D1D7
        for <linux-i2c@vger.kernel.org>; Tue,  1 Mar 2022 09:29:47 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id e13so14029051plh.3
        for <linux-i2c@vger.kernel.org>; Tue, 01 Mar 2022 09:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=2oNpK26q2m6Xy1nhECvVdzb9bqyZgEj4dQVtxGQNBDs=;
        b=BHfJ0FHd1Coau+LOYNsZsVB8kOtSFmA6BEPwpphBU2aloxrCe2B0jf9YCDPIztHZLQ
         EICWMfm9XajoxPzMSnn7PoVdCLAfTqqc48f+TMfZ4luwi3CcwQvRP/t1ktBRSTBwwyBm
         X49RGa8LBYAZ0digj3MfFtaS8MmGKwbIbtxTwqEDqdRZELHgAcxaHuq06wFmx+ChxNrc
         ULY9ocjHI1Tg5CUU07FrJIOrM8VBTQiWXbyeEAfLxDkLltphHrbO1zPKtKF3nRhpDx3M
         pnVDs2kqcaPIG7xrSOX+OGnm2uY4KlmI2vnxKTA7W+4sM6VtACLrDomcT2qnlkBc9xpW
         vzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=2oNpK26q2m6Xy1nhECvVdzb9bqyZgEj4dQVtxGQNBDs=;
        b=tqIo2RyW3w49CkxonWk2h8YA8mvCs8COjcuDmmhtOL3FpND8h+C3bxXwZ/eXdrdBp+
         yAFkbP5QBQ/RtPPFobSJjStPBBl/WVis7nVYFz72qYZLm75mGlHoXeI0z0xWgj5tnoGz
         PlWMvs6lNiiqKpXCu5J58biKn/cdn/hVfFkeVdPfkdGKIzwpGQJgh8gZGAliVqK/uO5U
         6recpWWHhwfHy+iEOzU5D+w2TsNl5I5H5P5iZzYo8GzJ7QtUQlAIabjBqHAp7A4b7bej
         gwifa7ko6Sr3xt7BYuyHunM5MGEEArT3wSzHBU+30kyUjnidrZOQLz5jvXLHrne4Zi5L
         5arg==
X-Gm-Message-State: AOAM532VyGpQoIsQDXE3byeXUl7yzXTFeqzO2E3lJn+2wV8+ATBGy4me
        HBz5LC2fe9SJbqk4+V5ltClAZEdUoKnfzgI4aqqeRg==
X-Google-Smtp-Source: ABdhPJwyHcGgYRV6ulnduStD4+XYTEcWUCI6ji8Qj9JOv5J7fxk+4Z6aC9W+VnvzfE8JpFvhG34PVYafBwpkFJmUHVc=
X-Received: by 2002:a17:90a:5a85:b0:1bc:8bda:6a42 with SMTP id
 n5-20020a17090a5a8500b001bc8bda6a42mr23106990pji.4.1646155787286; Tue, 01 Mar
 2022 09:29:47 -0800 (PST)
MIME-Version: 1.0
References: <20220218133348.628962-1-jsd@semihalf.com> <Yh44rYi6m9csyF28@ninjato>
In-Reply-To: <Yh44rYi6m9csyF28@ninjato>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Tue, 1 Mar 2022 18:29:36 +0100
Message-ID: <CAOtMz3N+wv1N_VmN-iGx0AeptvgYKw47PtaTv73CDqHkaCKMtg@mail.gmail.com>
Subject: Re: [PATCH -next] i2c: designware: Fix improper usage of readl
To:     Wolfram Sang <wsa@kernel.org>, Jan Dabros <jsd@semihalf.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Raul E Rangel <rrangel@chromium.org>, upstream@semihalf.com,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

wt., 1 mar 2022 o 16:16 Wolfram Sang <wsa@kernel.org> napisa=C5=82(a):
>
> On Fri, Feb 18, 2022 at 02:33:48PM +0100, Jan Dabros wrote:
> > Kernel test robot reported incorrect type in argument 1 of readl(), but
> > more importantly it brought attention that MMIO accessor shouldn't be
> > used in this case, since req->hdr.status is part of a command-response
> > buffer in system memory.
> >
> > Since its value may be altered by PSP outside of the scope of current
> > thread (somehow similar to IRQ handler case), we need to use
> > READ_ONCE() to ensure compiler won't optimize this call.
> >
> > Fix also 'status' variable type to reflect that corresponding field in
> > command-response buffer is platform-independent u32.
> >
> > Signed-off-by: Jan Dabros <jsd@semihalf.com>
> > Reported-by: kernel test robot <lkp@intel.com>
>
> Applied to for-next, thanks!

Thanks!

> Jan, I wonder if you want to be the maintainer for this driver? If you'd
> like, then please send me the patch adding you to MAINTAINERS. So, you
> will get notified if people want to enhance this driver.

So actually I've already added myself as a R:eviewer for
i2c-designware-* files in one of the previous patches with the purpose
of reviewing code touching this driver. This makes sense since I can
also test modifications on my device.

Best Regards,
Jan
