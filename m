Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDEC2A8055
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Nov 2020 15:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731036AbgKEOD4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Nov 2020 09:03:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbgKEOD4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Nov 2020 09:03:56 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2853AC0613CF
        for <linux-i2c@vger.kernel.org>; Thu,  5 Nov 2020 06:03:56 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id v19so1693026lji.5
        for <linux-i2c@vger.kernel.org>; Thu, 05 Nov 2020 06:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vpw1xKcWPIDCCoX9GPHpUdBLY9mfAcDxFQiVjHuc6eE=;
        b=NCAhTINjzEmAOE0J1abW8CRieoLkMOdPtwEzxZGpiAoskI+xO45EVaWXdhDLiWUsPe
         wA0oP5P8cIxCD6BK1O17L1r+1SaCLR9UKgZyHC1QlEhULZasIE5WrRVEJ0NtaDDRTqg4
         +VDnsXOsXXDibG7ztG/yozEqcecgZIAn9hq6UzpjdLb19nZFdjElBgo5VEksITpIbOOc
         8eMaUb2S0oJWLmx3a6aKbUgb3JRKkr1EAmKaNghBiU66JNLnM5Gnf4nM1G+wTwqZck18
         wAQkiKUSK2yhjDhr9rkjo50j5QO0U7U4u7u7VU7BpoodE16vh4QWS4r09r1QD2IAJK/R
         22HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vpw1xKcWPIDCCoX9GPHpUdBLY9mfAcDxFQiVjHuc6eE=;
        b=kumyKNa2TaBdFWvselPHvtvRlTQgSpp7ssWzm9O0uy/qX5NzAujIP8dBlMA1S+er6K
         PDE13xajXbFNQ/R/27XzPAiOqlWBfLtIM6R4YxEqcH/ZQY/J/tKd3ZMEIbYWAcN3hpEu
         dO8jpNOAmuW9Mj2uQ+DUZFJrVM5dv8/rWJGFM2kq+IqGuHhiR01DJG2FZuosb0Z9/fLm
         65qOwxKfA4C0iyRmfYzjmX5N7hjqnIAP4brDUSThC6lJhzecpxKEuxb5O71lCrnAmT77
         5s6CiXE8lru0YmZ/Gd00uPVSTJo1lqlT9Tx3GnkYIADDIa0JRUoIQHO3paVGxBhhsgyy
         DVJw==
X-Gm-Message-State: AOAM530+QfxZw/8/YgioBpHiGvpyeSo0bZ2UWtO9ms+4gN6zqbYVIv1G
        ualrd51cNwWJ4zQwCMOyb90mxK/kIBOBdMFp9o4Esg==
X-Google-Smtp-Source: ABdhPJw6CRp1lnXXZXYg5qaYlO84yznObo8m7XyqUTshcqNlV6bZul3Xf0rhOWenICFa4DbJ8ndU2IX2cRLNOHmFK+M=
X-Received: by 2002:a2e:8905:: with SMTP id d5mr925043lji.144.1604585033201;
 Thu, 05 Nov 2020 06:03:53 -0800 (PST)
MIME-Version: 1.0
References: <20201029074654.227263-1-coiby.xu@gmail.com> <20201029074654.227263-4-coiby.xu@gmail.com>
In-Reply-To: <20201029074654.227263-4-coiby.xu@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 15:03:42 +0100
Message-ID: <CACRpkdarE9f92nF10vZrPsgMatUT21vXN0coHCUxCp6gnneXYg@mail.gmail.com>
Subject: Re: [PATCH 4/5] i2c: nomadik: remove unnecessary CONFIG_PM_SLEEP
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/NOMADIK/U300/Ux500 ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 29, 2020 at 8:47 AM Coiby Xu <coiby.xu@gmail.com> wrote:

> SET_LATE_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.
>
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>

I don't know about the state of sleep/pm callback macros, but I
assume you know what you're doing.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
