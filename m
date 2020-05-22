Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F376B1DEDC6
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 18:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730306AbgEVQ6D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 12:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730487AbgEVQ6C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 May 2020 12:58:02 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C1CEC05BD43
        for <linux-i2c@vger.kernel.org>; Fri, 22 May 2020 09:58:02 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id y198so5454372pfb.4
        for <linux-i2c@vger.kernel.org>; Fri, 22 May 2020 09:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BkkTyhZXqmoYbosO7mhxikeBEfxh7Z+mKVsgtxzKXjc=;
        b=D3Bp3rA7dZHgJDNILqtIl03jqxrcBE1NsI4VoPgOXz60I+mTJSkSAPnmaNYEiu0a0o
         49AuqImxiOkBVcVwD14jur1mia1kyXecpd7q2E/MEoQIJU+XHGIROmRgFkf264k2bO+H
         IsSXK6QHMsbWIcUelyIimtNCBf0v9zv9q3bY9a3mnRBMl/s/tiX784qJdZm7lBQsz2W0
         vHY+wkC+9rUk5L0scxRbOJoqLm0KMawq5/2xdzudO7X2odKnzcuAQhkSr7VymQRjK9gV
         8o0NokYx/W/97VCVuwmQdw1UAeLGuQInbwzHuYTfu4k+AJ8DQekdHWSq3+WRR3eczjEE
         G6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BkkTyhZXqmoYbosO7mhxikeBEfxh7Z+mKVsgtxzKXjc=;
        b=YMiG0PTE0l4pDHz5X3V/GUGbdqRWWgS+/b4WX4sLJ4we21oErVvbdkjnYNpJdm1Nii
         xBuCgBdATPWrA8RQZ0GXdLtoPIfPLytUT02OZIEBwfu1/EbpQbwqYHqBLPzMdLhFKT1S
         7aOPJBibNhDaSIxjJDAH6gVBnPSPO079bnWFz3m3Ib1WSpztXA/p24JkTVKi7XD6yr6i
         mnebv4bsJIaTSCKUBLYpTTYNzJ5sU+X+JpGd14x91haW3LGrcvo5RjBDt93Chaf1bCDW
         KwA9PbaFm4eRe4YS0itpPsU2l5X5gV3DKWT8+yeQL4X/AiKvRFK3sWDrOoWgsWYxb1Vi
         HkIQ==
X-Gm-Message-State: AOAM533phdW1+KRv9i9cL5jtBMxg3TOAf96FPlrqfWy/UTP7BzOg48xh
        fr1QlMgMvDiA5c3Gsip4rizOgw==
X-Google-Smtp-Source: ABdhPJycgYV7PdHnM12T32FAcBZScokQWtdDcQ/9aRg72UFU6AuDhyp+VlUT7TEU3QNodO7GHT8uiw==
X-Received: by 2002:a63:1066:: with SMTP id 38mr14656449pgq.207.1590166681780;
        Fri, 22 May 2020 09:58:01 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o25sm6501119pgn.84.2020.05.22.09.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 09:58:00 -0700 (PDT)
Date:   Fri, 22 May 2020 09:57:58 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Cc:     loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, robert.foss@linaro.org,
        vkoul@kernel.org, wsa@the-dreams.de
Subject: Re: [PATCH v7 3/3] arm64: dts: msm8916: Add CCI node
Message-ID: <20200522165758.GH11847@yoga>
References: <1586248382-9058-3-git-send-email-loic.poulain@linaro.org>
 <f127d7f3-d69e-1137-4366-5fa77abc5c3d@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f127d7f3-d69e-1137-4366-5fa77abc5c3d@gmx.net>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri 22 May 09:10 PDT 2020, Carl-Daniel Hailfinger wrote:

> Hi Loic,
> 
> it seems that this patch was not picked up in any tree. Do you think
> sending it to linux-devicetree would help?
> 

Afaict it's part of [1] and as such is part of the qcom pull request for
v5.8-rc1.

Please let me know if I'm mistaken and I'll pick it up.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=arm64-for-5.8

Regards,
Bjorn

> Regards,
> Carl-Daniel
> 
> > The msm8916 CCI controller provides one CCI/I2C bus.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@xxxxxxxxxx>
> > Reviewed-by: Robert Foss <robert.foss@xxxxxxxxxx>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@xxxxxxxxxx>
> > ---
> >  v2: add this patch in the series
> >  v3: add only cci node for now
> >  v4: no change
> >  v5: add cci label
> >  v6: no change
> >  v7: no change
> >
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
