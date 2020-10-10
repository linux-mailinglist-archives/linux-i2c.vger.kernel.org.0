Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3384A289CFB
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Oct 2020 03:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729110AbgJJBT1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Oct 2020 21:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729117AbgJJAjy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Oct 2020 20:39:54 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A622EC0613D6
        for <linux-i2c@vger.kernel.org>; Fri,  9 Oct 2020 17:39:54 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x22so8230283pfo.12
        for <linux-i2c@vger.kernel.org>; Fri, 09 Oct 2020 17:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=F5/qH043zEuGeatUEpHVuXqbPsOkFkmiSQ+O0T+kgNI=;
        b=OY0/mr8FkN7fSU5zYf/x9oHuQmQYqIF3NZteXcH28gcYzCSf5+MT4y49z8aUjOjqBv
         lha3BSSjRHKCiX9eo/5oSgg3mzkB27HCrpXBOvuU8f2fnOZ/YBvY6fZmuOjh//FvW6kL
         O7ol4CBYBbsd7yhoCo0gpIi6aDg3ajTAUIbi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=F5/qH043zEuGeatUEpHVuXqbPsOkFkmiSQ+O0T+kgNI=;
        b=iWKcf27d9pqcyPWqKRrRmLdHs4CDv5KFSiCs5IbHoYewEDA4/t8BFjU2AvmjUMKrdP
         Hm6PKSSbm6NYHk5HhEid/EsE4Gw4ra/BfIQXS7oG64jr9j4k36qu6WjX+hmZrbdXxCg6
         KtgnnqZTihvjhPeQujmH52tUaIRMt0KlKsI3CtoZQm7FZMcwMB4hwvR9sKO76yFOqqCH
         w399EUc+3p4cGRK4WPz0AfCx7geBRKyuyuan9fkKUVc4OE63hYmKG14jrLqoZhFyk9Sl
         8kfURj9k5ng+rQWD7jNhHVjqsTDNzuel2D6rIkbDluvgdyLwQiUfZoC7MI4yFNCzlfBl
         k0ag==
X-Gm-Message-State: AOAM532IbRx5vnkqisQ7jpIoeoUBO2aXveA5r92+wrxI/ahddknZ5l5b
        zzQOJYneLidLuXKkxOK0wt53kQ==
X-Google-Smtp-Source: ABdhPJzE8O8QFPi4at6QU9iWZO8FPHQ/o/AIuLT2fpJQ9Opv/aO707p4HOAAU7mEUsaVWB5etuwZ6g==
X-Received: by 2002:aa7:9009:0:b029:154:f822:27c9 with SMTP id m9-20020aa790090000b0290154f82227c9mr14645151pfo.48.1602290394214;
        Fri, 09 Oct 2020 17:39:54 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id m4sm11572541pgv.87.2020.10.09.17.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 17:39:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201008155154.2.I7b22281453b8a18ab16ef2bfd4c641fb1cc6a92c@changeid>
References: <20201008225235.2035820-1-dianders@chromium.org> <20201008155154.2.I7b22281453b8a18ab16ef2bfd4c641fb1cc6a92c@changeid>
Subject: Re: [PATCH 2/3] Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        linux-kernel@vger.kernel.org
To:     Akash Asthana <akashast@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Wolfram Sang <wsa@kernel.org>
Date:   Fri, 09 Oct 2020 17:39:52 -0700
Message-ID: <160229039221.310579.11648298092136196056@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Douglas Anderson (2020-10-08 15:52:34)
> This reverts commit 02b9aec59243c6240fc42884acc958602146ddf6.
>=20
> As talked about in the patch ("soc: qcom: geni: More properly switch
> to DMA mode"), swapping the order of geni_se_setup_m_cmd() and
> geni_se_xx_dma_prep() can sometimes cause corrupted transfers.  Thus
> we traded one problem for another.  Now that we've debugged the
> problem further and fixed the geni helper functions to more disable
> FIFO interrupts when we move to DMA mode we can revert it and end up
> with (hopefully) zero problems!
>=20
> To be explicit, the patch ("soc: qcom: geni: More properly switch
> to DMA mode") is a prerequisite for this one.
>=20
> Fixes: 02b9aec59243 ("i2c: i2c-qcom-geni: Fix DMA transfer race")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
