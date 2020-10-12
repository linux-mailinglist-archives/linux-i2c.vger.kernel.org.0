Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3CA28B120
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Oct 2020 11:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728945AbgJLJIv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Oct 2020 05:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728834AbgJLJIv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Oct 2020 05:08:51 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01FFCC0613CE;
        Mon, 12 Oct 2020 02:08:51 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id u8so22201814ejg.1;
        Mon, 12 Oct 2020 02:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wqiQJ3we1Ola+AjnEDNyt+aRzblqZ6hdUORf0Fcttl8=;
        b=FoMzh+hNQtMfe2dRjl6bHBnSaX09jW3hp3/tKZeE1nsYFnLnE1DwtDM3h+bGtDqgtW
         6RIfsbqSY0U1sxe1KmjCaLBzMHJOvJ3GhiOFLDn+muHEq+8nqPqbfGzO4AjTrZkgcpw0
         xIr5Oe7mgI2P6oStrj5NJYerSnj/jRZs9IM4Wm98qPEAE/q7cGUCWLjCGmZsVUeQzpIM
         z+HXcLd9v08YVJUHIFUZzEM2QQ/gCtV5gqvz3uvjVjjwobEd0gjj8E48q1Pc+H6+doJw
         QXv1V3WMvAOUVZcG52SaB3dnvkw9MAMqWkhqE7TPOuf0Dx2rJHO4TfqYIJLcU/Vu0obB
         5YSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wqiQJ3we1Ola+AjnEDNyt+aRzblqZ6hdUORf0Fcttl8=;
        b=mUFyp8UmA4CmFpCRWli6Y8oOVXpKpdmeplCqnAK0rSyEQp3+KEYqbvB4vnrBw7HVQ8
         8hvJRM80FpCR4OvpumGo+IaD3LJbu41VokR4xDgigAeWBxBejwT9IZKFyzSUiTlpfdAe
         AnF8cbn2qb0Bz5k8g8JgF3IkLm4+5o4PiKwgUxqLW+MsVEHPtdXIXvrnF2RmE5CYG2G/
         brRtLqT7dS1E1exTp0QbDdPLYudtqGv9NAoWx/8YFkj2Uw1noQ46JjZhWLsfXWgU5rGd
         ZSxVr1ZGDzdOl+GoMMTwSraaAaOnkuTwmlloNwUutKxMBhhMPsrvb+ShqDRN4R5lE83k
         NMJg==
X-Gm-Message-State: AOAM531Z2Bgkrygp4dEiKyLBZEHFt3r+sezK5ne2Rr0t7Ts6cfBYrDhH
        8UaUIAag9m7x6AcexL0jfWo=
X-Google-Smtp-Source: ABdhPJyoimAq8VNtDy17siyKrLkDM9RH3OqbD1sMDlCaybG5WeM0twFcDA2pe5Q9Uo7X4IpdwbAVJA==
X-Received: by 2002:a17:906:3a1a:: with SMTP id z26mr25947572eje.519.1602493729627;
        Mon, 12 Oct 2020 02:08:49 -0700 (PDT)
Received: from ubuntu2004 ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id z20sm10127717edq.90.2020.10.12.02.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 02:08:49 -0700 (PDT)
Date:   Mon, 12 Oct 2020 12:08:52 +0300
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: Re: [PATCH 3/3] i2c: owl: Enable asynchronous probing
Message-ID: <20201012090852.GC73734@ubuntu2004>
References: <cover.1602190168.git.cristian.ciocaltea@gmail.com>
 <f343802a4b1a8ab6fc78e5db6d24a350b2319495.1602190168.git.cristian.ciocaltea@gmail.com>
 <20201011140645.GA4971@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201011140645.GA4971@Mani-XPS-13-9360>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Oct 11, 2020 at 07:36:45PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Oct 09, 2020 at 12:44:41AM +0300, Cristian Ciocaltea wrote:
> > Speed up the boot process by using the asynchronous probing feature
> > supported by the recent kernels.
> > 
> > For SBCs based on the Actions Semi S500 SoC, the overall boot time is
> > expected to be reduced by 200-300 ms.
> > 
> > Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Thanks,
> Mani

Thanks for reviewing,
Cristi
