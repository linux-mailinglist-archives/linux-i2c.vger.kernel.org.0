Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0540C36F379
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Apr 2021 03:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbhD3BZ5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Apr 2021 21:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbhD3BZ5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Apr 2021 21:25:57 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6FFC06138C
        for <linux-i2c@vger.kernel.org>; Thu, 29 Apr 2021 18:25:09 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id q127so10061319qkb.1
        for <linux-i2c@vger.kernel.org>; Thu, 29 Apr 2021 18:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V1QnMHl1bv4GYjD2nKUUJjqSbgwtkE7PlJ3sqyWNs7Y=;
        b=PtHlsQZOZ+E4ykn+R3l13RBajbWKW9bc5n0CxdJOHTPMz4PSUer/AJh9vCysr5UYOv
         SuCTrQprrgY+vi68vThE0YH88YfY2vB8BtuvkvLHFzNcfsD3Qo++eWfTMmQBN66+qcZx
         YA3c9pl9Lat5hMK3NWhl/lTgmlPl8zmEwFMKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V1QnMHl1bv4GYjD2nKUUJjqSbgwtkE7PlJ3sqyWNs7Y=;
        b=Bxw9PqQ4viAcnAbVuHcTIwOsI2mxW97H9AECcuNjbHQydnxud6AMW3gHrNoRtrQlXw
         qdu3sR7eKoHnla+//VoOhHbTsjFpWYCZFy0aOvkTr3610szNyHnbsq9vv2etinmgALgE
         FvZWVQoX5oH5YPIZon0ztH6AcUhf+ry3d9hxhndZnkIEE4jmjHDao7jMrFN3OudP/52C
         IC6zJzUXnSUcgQAeEPiy1IQyFCa6J5HOA8NmGcLd42QLB3mFkNM3TKfh+IoN03nC9ZGI
         OVALLnfTqwjaF8wfRAi8jtBuzlv0A7NJnLpTYHvHunzaBcrwT35HmWMiRQ5uIeouqqlo
         vSIQ==
X-Gm-Message-State: AOAM533prrf3JybBF1by8Zujd+FTKmCXBH5oWwzW4ax71hTAe0M5joGe
        U5bd6nj6aKGaLQPyxq0iH6Sn/LhF4j+D9w==
X-Google-Smtp-Source: ABdhPJyLwbS3svc4cCkR4Aor55M3TLRqvH4rI/HKg3/wMhAydltZV9fVaOKfKVtMw328kmqDIkLTtg==
X-Received: by 2002:a05:620a:4553:: with SMTP id u19mr2887139qkp.485.1619745908484;
        Thu, 29 Apr 2021 18:25:08 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id b65sm280808qkc.119.2021.04.29.18.25.06
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 18:25:07 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id g38so81043948ybi.12
        for <linux-i2c@vger.kernel.org>; Thu, 29 Apr 2021 18:25:06 -0700 (PDT)
X-Received: by 2002:a25:80d4:: with SMTP id c20mr3510159ybm.345.1619745906527;
 Thu, 29 Apr 2021 18:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid> <CACRpkdYkRFLvCRPSYNzYQG58QgPfhvjtHb+FBQZadyrnjC8=1A@mail.gmail.com>
In-Reply-To: <CACRpkdYkRFLvCRPSYNzYQG58QgPfhvjtHb+FBQZadyrnjC8=1A@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 29 Apr 2021 18:24:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UX683grZ=poTwKXxSqYBCLdLAOCxOPhE_xVVgKbe36Mw@mail.gmail.com>
Message-ID: <CAD=FV=UX683grZ=poTwKXxSqYBCLdLAOCxOPhE_xVVgKbe36Mw@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] drm/panel: panel-simple: Add missing
 pm_runtime_disable() calls
To:     Linus Walleij <linus.walleij@linaro.org>
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

Hi,

On Thu, Apr 29, 2021 at 5:58 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Apr 23, 2021 at 6:59 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> > In commit 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to
> > avoid excessive unprepare / prepare") we started using pm_runtime, but
> > my patch neglected to add the proper pm_runtime_disable(). Doh! Add
> > them now.
> >
> > Fixes: 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare / prepare")
> > Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> This patch as such:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Notice however: you turn on pm runtime pm_runtime_enable()
> in panel_simple_probe() but are you ever turning it off in
> panel_simple_remove()?
>
> I think pm_runtime_disable(); need to be added there?

I'm a bit confused. You're saying that I need to add
pm_runtime_disable() to panel_simple_remove()? Doesn't this patch do
that? This patch adds two calls to pm_runtime_disable(). One of those
is in the probe error path and the other one is in
panel_simple_remove().

-Doug
