Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACCD928B115
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Oct 2020 11:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728821AbgJLJFg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Oct 2020 05:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgJLJFg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Oct 2020 05:05:36 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1F61C0613CE;
        Mon, 12 Oct 2020 02:05:34 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id x1so16128357eds.1;
        Mon, 12 Oct 2020 02:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Hme+fToG2cXXlZmnBQnxZVF0mqx2Of7GXHaR+KYhTvg=;
        b=WU8hue0uLq7LqQo0y7Ri3N1OhCXYLhxlsaoWehDM2yKLl5I8FQAPs9rfDVry8fAxz8
         KHRTs2zd7esNmZp3tTGR6uV3dXVrrB1P9bVjrqnwcZ2ImLshsy35zmEXAI6KHtBu0pHs
         IhOnO+AG2ZOWQAQxHC4mrbdM2d6xfKvYBa4bTd+0TSFrCsR4NYG0/+IWqgGs4FcKOUqF
         NQ9J2MPgVuG+/NYq6Ew4IWI9+41GleEEKZz71BDH5kPF9qkGxvIkCjYr71IkWm98DD7l
         8BWiuVQpIbyI2w4KnVLd0oOmR8gbi7yi1rotfLG5p7XJjWTkOc8YGdYQ18zovo8GCp9P
         b6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hme+fToG2cXXlZmnBQnxZVF0mqx2Of7GXHaR+KYhTvg=;
        b=WPFLdr2/O0hBSo62JUS3ntHsHLHbi9FcfrwSPtIpwL9v5S9UKSN+ZXCSspi7Pl2djJ
         B3GVw2EJcDEbrvBUEAP91XW5OIXbLzo+s+Wo1+HGWb5utqyiM8aAyQF3cat1VZEvILuS
         6nAqC+GSquXUDrhDaUKU6q9zDq0IYEdxK0Agdk44zp98GZ3S4noyB9jl+Q3qGXTnvIyr
         vSkxKIKNkMFDDlikJX58OxgDSsSXeNus2bIPRTG8eWOB0qJrP4jJaHOAWa7SOmDuiYZY
         6rFVP7qe6xHK4AFKTzpRdBThIeSfLm2NyWHVyxM2zwREO1YBNzmRUQ6ceHk37b9MR/yu
         LPVQ==
X-Gm-Message-State: AOAM5322xbH+3HLearI1XUuVC0AI+9P7Px7A6eMUIs9v/jMorDi839iS
        6uz+33mQPi0R6l1kQhmDB9Q=
X-Google-Smtp-Source: ABdhPJzPgXJBPzs+oUUGzLOXxkrWTZb2kA2A2Y8m/iRmz0mg3/3WOxA6nh/DWntgPE1sryKv0j+Sdg==
X-Received: by 2002:a50:ba83:: with SMTP id x3mr6410615ede.238.1602493533330;
        Mon, 12 Oct 2020 02:05:33 -0700 (PDT)
Received: from ubuntu2004 ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id o11sm10219552ejd.60.2020.10.12.02.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 02:05:32 -0700 (PDT)
Date:   Mon, 12 Oct 2020 12:05:35 +0300
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: Re: [PATCH 1/3] i2c: owl: Clear NACK and BUS error bits
Message-ID: <20201012090535.GA73734@ubuntu2004>
References: <cover.1602190168.git.cristian.ciocaltea@gmail.com>
 <6ee573f2904c001ab07e30b386815257c05f6308.1602190168.git.cristian.ciocaltea@gmail.com>
 <20201011140948.GC4971@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201011140948.GC4971@Mani-XPS-13-9360>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Oct 11, 2020 at 07:39:48PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Oct 09, 2020 at 12:44:39AM +0300, Cristian Ciocaltea wrote:
> > When the NACK and BUS error bits are set by the hardware, the driver is
> > responsible for clearing them by writing "1" into the corresponding
> > status registers.
> > 
> > Hence perform the necessary operations in owl_i2c_interrupt().
> > 
> > Fixes: d211e62af466 ("i2c: Add Actions Semiconductor Owl family S900 I2C driver")
> > Reported-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Thanks,
> Mani

Thanks for the review,
Cristi
