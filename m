Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE1DC4A9773
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 11:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347978AbiBDKFr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 05:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237600AbiBDKFr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 05:05:47 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A27C06173D
        for <linux-i2c@vger.kernel.org>; Fri,  4 Feb 2022 02:05:47 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id k17so4764077plk.0
        for <linux-i2c@vger.kernel.org>; Fri, 04 Feb 2022 02:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WrnvJctaf5CaGI0+Id3QS0IefiR7Kqw7sZwGS5Mb1a0=;
        b=RvK9oll/uuAupJuX1xwYdGyYW7UeOuDvliXyc9jkPQ+aB7jWnt6OVDlB+OhWKcvO8W
         k2UTyRgCiVFO5EnwdqmNaA0aAWul96rLWXh/Ewa0HbgFscRQ7CDUkz48YqFAlm+k66fy
         UhA6gUQ/ecqvHApP2AWod/xmJvFhlFxTY0uQ0XZneHFPvs299Mk4v18ysm4tgXU1QMoV
         fIDMyS99Lw//fJZOmDIWLscU6JymELVOlnk5+l9Jyk8DocJR5+O4c2sHRkJu/CgKarBg
         rAOyJM0+Pwpqh92A962u7xBIFgzTMt2OwZ6ukhAmwpeoGQ9u3ruSDeihpsArQJPr4QR+
         M2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WrnvJctaf5CaGI0+Id3QS0IefiR7Kqw7sZwGS5Mb1a0=;
        b=OtCnFHXoByHmClhXfEc6h+hGLQth7ikjt8L3Kb6sobIh8s1cO2K1zYA7xnTvybxyeS
         lVJnAjOWe9y98E0KGpJu1Zft/IY+JUM1JpoG4ZLNFvWAQdPMs2hIFAFRqYyzyucBAjcp
         S1sckfYiJkk6mMWVMi7fx202X5SUYGRP7j2dYGLf2W3Y+x1Macsdo3EqdOkmpnkZ/s4F
         8Im1n25GuTKHFod7FxdzlHg/YRB6JMjaJ/xYRaSY4re1qK2Y0UOj00hWDp6Xvzu/NZAm
         jQgoTBqWlQDlxNX/PLoUkPTTSBYr0WRrqDppNcjuD20FMVl+uZzDCd6NWg68U3VkpM7K
         +zBQ==
X-Gm-Message-State: AOAM533JFcDZ2Jr1RbfucNxK8v/GvvtOoMwHgkfPyPLYS93Qy9N8ZTCi
        y/2V4epCNVLxzLXgAiS7JzD0FMizA5APxjX4Jt3oOQ==
X-Google-Smtp-Source: ABdhPJz+5gXsNx67AS719F91ey6VWY/P7GPWswdf6MADDY0D32joFoxDOVAcNb9nUxjpehzPw7RL8P5b6yYhBhorx+8=
X-Received: by 2002:a17:90b:4a86:: with SMTP id lp6mr2297281pjb.152.1643969146488;
 Fri, 04 Feb 2022 02:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org> <20220203164700.1711985-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220203164700.1711985-1-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 4 Feb 2022 11:05:35 +0100
Message-ID: <CAG3jFyseuJjnUVEqBh8UwwkB21M99_F1osbprL6hvrgmmaO8mw@mail.gmail.com>
Subject: Re: [PATCH 3/9] i2c: qcom-cci: don't delete an unregistered adapter
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hey Vladimir,

On Thu, 3 Feb 2022 at 17:47, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> If i2c_add_adapter() fails to add an I2C adapter found on QCOM CCI
> controller, on error path i2c_del_adapter() is still called.
>
> Fortunately there is a sanity check in the I2C core, so the only
> visible implication is a printed debug level message:
>
>     i2c-core: attempting to delete unregistered adapter [Qualcomm-CCI]
>
> Nevertheless it would be reasonable to correct the probe error path.
>
> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index c1de8eb66169..fd4260d18577 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -655,7 +655,7 @@ static int cci_probe(struct platform_device *pdev)
>         return 0;
>
>  error_i2c:
> -       for (; i >= 0; i--) {
> +       for (--i ; i >= 0; i--) {
>                 if (cci->master[i].cci)
>                         i2c_del_adapter(&cci->master[i].adap);
>         }
> --
> 2.33.0
>


This chunk of code seems to be re-worked later in the series too. But
explicitly fixing the issue still makes sense in this case.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
