Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56C07260DD2
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 10:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729956AbgIHIoO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 04:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729390AbgIHIoN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 04:44:13 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08FAC061573;
        Tue,  8 Sep 2020 01:44:11 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d6so3332497pfn.9;
        Tue, 08 Sep 2020 01:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XuTzQQBdP+WWoANigEsq6MwgFpHmqQvWwyaZXCBXPHE=;
        b=l+0aFjCmt8YftXSxAK+F1TTeN+lfDarbyMXferg638jFZw7DqYI6bYPXtgYmM7SrBh
         qvXzVK+gLgQR2/0OgA2EgQNcQkcpEqzEBH/iKMJaZzz6DrqTfC9iy8E7CQPM3d83mX1U
         vuiqC2a1PQVjnY8wzAqjeV19MjUMGC1TTS1yt7aZuEsq3iatIcWNjwmt4UGg6tLILvKZ
         epiRbtZQdkSrIAJyW8n3bjz7034moF8o0g3ElZr+hTVd/42rLS21QtC3888C3wT0Cs2s
         77ma0dnaK7JlyRVbSEyL7MjAD0vWSoMReCQq5WX9RsMBSd8CXV6EtmRnFT/dQsyvxskY
         snMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XuTzQQBdP+WWoANigEsq6MwgFpHmqQvWwyaZXCBXPHE=;
        b=W5uMLu+odPRU1GmrTEX4AHJXyZ8cLn0KgBd+Eyt16Yn899zkslvyw/wqm8SeskGrjQ
         7bn5UxeTWPzAWVITQiY+wGxbd80ixGGFYUqsi1uL1Va9enCJKAYBuS+oVuOO95BEjLyB
         ekFKr2DQXwz2FjgHpafvLKwt29xOV0W1Qhx9sk6SZn7hX7mf9tEXc9aRpXRm3A2zk5Qp
         UjJmnfyUTxRKqgqmrPrKh61mAhd+O0Uuy8CvYaLya7ppz8AcxfzXazbW6xvv3ve+xgNE
         3sZzCp2E2LHBB5zuomvY/+8a/uH6PsIRKE33WSLBa94fP/A7vmkiXop26/tfIcGCu00u
         ziyg==
X-Gm-Message-State: AOAM532K/JM0XJf1ZHyDtyorXIJHLUC/L89/9mXJkQAYc0yxeyS0ysiE
        NkpjvAbVVsJPmbdBBaHpHDSTvIAWzWNus4AAgck=
X-Google-Smtp-Source: ABdhPJxte4NMjBFH89t5XT3Rh0sUdCmWtYid4nnWQLKkT5VZ1TD2vb0mIcEp7C1RwxbePlBPfkkntHqqX4r+/xbAxlw=
X-Received: by 2002:a17:902:28:: with SMTP id 37mr23483544pla.107.1599554651533;
 Tue, 08 Sep 2020 01:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200908021021.9123-1-digetx@gmail.com> <20200908021021.9123-17-digetx@gmail.com>
In-Reply-To: <20200908021021.9123-17-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 8 Sep 2020 11:43:54 +0300
Message-ID: <CAHp75VefU+iXpngPnzQRBfrg3OgLUBqhOCJpPo8natfCBr6Q5w@mail.gmail.com>
Subject: Re: [PATCH v6 16/35] i2c: tegra: Reorder location of functions in the code
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 8, 2020 at 5:11 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Reorder location of functions in the code in order to have definition
> of functions closer to the place of the invocation. This change makes
> easier to navigate around the code and removes the need to have a
> prototype for tegra_i2c_init().

Still seems to have ordering issues (it moves pieces you actually
change in the next patches).
Have you considered which one looks neat this variant or if you move
it closer to the end of the series?

-- 
With Best Regards,
Andy Shevchenko
