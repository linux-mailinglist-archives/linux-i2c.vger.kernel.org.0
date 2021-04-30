Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F0B36F3AB
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Apr 2021 03:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhD3B2s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Apr 2021 21:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbhD3B2s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Apr 2021 21:28:48 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E91C06138C
        for <linux-i2c@vger.kernel.org>; Thu, 29 Apr 2021 18:27:59 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id c11so3753137lfi.9
        for <linux-i2c@vger.kernel.org>; Thu, 29 Apr 2021 18:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5nYrcPFaE9JozlbdUYcBvuc3knwcBJ+KRlPBwjPg/eY=;
        b=mWr/LU95sxRmIHn3zRMbluegyGD2oe6oRt4d/eRVIdu7KE3Hz+geRyAZlmU7D5TMAP
         hBhqnVuVTVgUAhM0ZWa+OwuRT9bQbE3RnlfSljIXyeQtbRVE3csRBOvTZ2UblLcRM1QC
         xxs3hrrGH/TOp0oQcLOkEQIwojDLhahdEkZ6uo900/o8WZPZ19oj42KYditGQucez/as
         vUnwQLP3c6V6Z++gJIjubVeNlKS9+vW3LkRRxu3vS1WvzgEP3ZR5H+scAq2iwSyMhr+x
         AmUwvYqwpyzEIbU+VnqL+66wxLgWtk7TUMbBixNYKsUb9BMpCwEI2TAVauzbB6jQtiw3
         Iexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5nYrcPFaE9JozlbdUYcBvuc3knwcBJ+KRlPBwjPg/eY=;
        b=NVPPkAJHnWi0zlJnV0vmM8+uTIPZv2MVVbLX49m2rnvcXvJhs8QN/8bybBk1hCLx9D
         oyX8MTItCitu7Ban3anogorhaoqbeGri7/HkW4kR+Wa82F0UD1NH/89lASHlAAHVDIdD
         FaoQH422SykfwpltFdPUcEhRnMhkqdPc9DTGQBFgzOhSmvsbHOFLPKv0DUCMdRMzGd3k
         rDasIFHwhei1S1ltiBN7WIPv1I+wyzmvOs+0lszvsb0yhpuo152XPzxUQge2GadAaClI
         xExXxvjTMtI+GvDtUgOu4wVMsOwAS/kCWbl0J/zhAlchUbCj2v1corfl4tP8esYmGeV6
         YVRg==
X-Gm-Message-State: AOAM532rgI4q4WRJtvMN8ECJZZ88KdWyhZhmPbmqJz7qNw1IRXEzcm9q
        rWnhFT2y3RrBP6Dmm79pqhIz6tXjyonLf4vuYnrO7Q==
X-Google-Smtp-Source: ABdhPJzFPmRotZN0fnw8kLXHW0mhRMJ6Y9pLJGkfe+X4ux0/23qoEes3nema+045FI+84RCCCXHVaXcNwdXLrns0we4=
X-Received: by 2002:a05:6512:149:: with SMTP id m9mr1218659lfo.157.1619746078186;
 Thu, 29 Apr 2021 18:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
 <CACRpkdYkRFLvCRPSYNzYQG58QgPfhvjtHb+FBQZadyrnjC8=1A@mail.gmail.com> <CAD=FV=UX683grZ=poTwKXxSqYBCLdLAOCxOPhE_xVVgKbe36Mw@mail.gmail.com>
In-Reply-To: <CAD=FV=UX683grZ=poTwKXxSqYBCLdLAOCxOPhE_xVVgKbe36Mw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Apr 2021 03:27:47 +0200
Message-ID: <CACRpkdYfugrJ4WGn=w+viGXE6s5cdHjLC++jHPLVy_QH09KA8Q@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] drm/panel: panel-simple: Add missing
 pm_runtime_disable() calls
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Apr 30, 2021 at 3:25 AM Doug Anderson <dianders@chromium.org> wrote:

> > I think pm_runtime_disable(); need to be added there?
>
> I'm a bit confused. You're saying that I need to add
> pm_runtime_disable() to panel_simple_remove()? Doesn't this patch do
> that?

It does, sorry, too late at night :D

I was looking at the previous patch and mixed up which was the
patch and the patch to the patch...

Thanks, apply this!
Linus Walleij
