Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 382614A9EA7
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 19:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377372AbiBDSIQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 13:08:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377373AbiBDSIP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 13:08:15 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1793C06173D
        for <linux-i2c@vger.kernel.org>; Fri,  4 Feb 2022 10:08:15 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id s6-20020a0568301e0600b0059ea5472c98so5693369otr.11
        for <linux-i2c@vger.kernel.org>; Fri, 04 Feb 2022 10:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g+GyvokC4JIDBfu1nlEt4yOnjvYWiAwVNgoY8pGa298=;
        b=htSvG/nD0gdatQ8XpszfTbcPx6WRvFhlRFuQ3/cGEtQTN9dVfk9EUexMtuaeZ3BigV
         89aPjTjyKyLzTqxjrjC4wQJGPhX3lFLKyX2JOfFlXnEXo2/MYjzT2wzUHbqxICU9pbgh
         YUl1j1rpY76n2d+KXGBrv5MCNHjiJx3pq1jlZI0CWCjXc6a9gpBLVR+ivGGawM9ahxkn
         Cla1/TZg/kBK09R8xShgA0Nh4+VbFZcsXlxYNeKOVQvX8vUVwp3U6T5HhuWnbZ4lHgoc
         MawFRhVIgOGJdhD94x2afKwZ/rGjQEoqBof8OLwI9Z2NBk2P3MgjJxAVOKgyhpoNi4P4
         kajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g+GyvokC4JIDBfu1nlEt4yOnjvYWiAwVNgoY8pGa298=;
        b=dJMy9WVh8uyCMJ3Q6f1yLUAD8VG4KobNMfh/hEKDz5LgDa/iXWuyon4vOWswJR/1p+
         sHU3ZET1LmcmW8sZGBsNpWqn5I6vUyq//RjXXeUYR6odfAbNOTOV2xiRO0Lze+RaTdH5
         eDwHGOyBOor3VfhuL1ortDc7g/t7czME00KCTXtMXczDzMuqddxXwSvp0a4rLVylSe4l
         /uk2ZHr+7GkaxLvlpnwoHxLbYUw00iAL1XTQGTPAFMX+ED87W5/0CeEsFjxVHcd4qYNE
         rMdWnVfQACKzx03p4jWBCVUN2CWO8k3Jndr6hvWCD70+0evWdoW442G34fUgc+721Gbn
         mFeA==
X-Gm-Message-State: AOAM5316AklNps66GUTbSuc2uBKphaYIG/Vx+z21TuNhiM5e9BoJNHAo
        h91S8YzP1+ilhOP9tSIyakCxlQ==
X-Google-Smtp-Source: ABdhPJwvwYm8p8ZLyMR7biGMJIl82SdfRuu3SbgGgQ4E+SI3CdLJ/0uYNZcyG2Fh4p6nkQzW4Onu2Q==
X-Received: by 2002:a9d:4f0b:: with SMTP id d11mr74438otl.239.1643998095150;
        Fri, 04 Feb 2022 10:08:15 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id z4sm769333oad.30.2022.02.04.10.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 10:08:14 -0800 (PST)
Date:   Fri, 4 Feb 2022 10:08:30 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/9] i2c: qcom-cci: don't delete an unregistered adapter
Message-ID: <Yf1rnkvfMGOHEeP+@ripper>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164700.1711985-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203164700.1711985-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu 03 Feb 08:47 PST 2022, Vladimir Zapolskiy wrote:

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

Fixes like this should either come first in the series, or be sent on
their own, as it could be merged without considering the remainder of
the series


Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index c1de8eb66169..fd4260d18577 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -655,7 +655,7 @@ static int cci_probe(struct platform_device *pdev)
>  	return 0;
>  
>  error_i2c:
> -	for (; i >= 0; i--) {
> +	for (--i ; i >= 0; i--) {
>  		if (cci->master[i].cci)
>  			i2c_del_adapter(&cci->master[i].adap);
>  	}
> -- 
> 2.33.0
> 
