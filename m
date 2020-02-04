Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 258531521BD
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2020 22:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbgBDVOo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Feb 2020 16:14:44 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37038 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbgBDVOo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Feb 2020 16:14:44 -0500
Received: by mail-pj1-f68.google.com with SMTP id m13so1962778pjb.2
        for <linux-i2c@vger.kernel.org>; Tue, 04 Feb 2020 13:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sJ6dt4IAx4lLUXsNXyTvXPa3oissv4BK7c1F70A7bh8=;
        b=oRSdIwhJN0CghtS9RntV6TwOsdvFrxSFJjT6YQdAQnM2F+VX+syfEAu3ehPlGD1jWf
         BRSf1W4q4aBPpwq14CYmdOrmUNcI4nkmCgB/IHekGeVgTR/XKpWfVyoo7nO1MoauhY/3
         UoqObmqt9o+bSi8pbgkIT7OQF2qPX2omMb1FvlHsasHZU1S8yRbs+AVgeD3fr/1+lzKt
         t9cEQd9Gud35qSLkVw5cogBK30lPAUZ2dWD1a/3a9ZTE0VIoFYwSu7/wItIUMyaGXOZb
         os2Y2ITzMrVQics/jxxFQHM55f70Y/ISAv+mvHEz9jJ7m1JLJ9BJIyRU+qrwIqkkvajG
         Z3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sJ6dt4IAx4lLUXsNXyTvXPa3oissv4BK7c1F70A7bh8=;
        b=KFRQsN+8pLJusCvHbvS94+TP5RwLMm/SexeU7NgU1i5RnP3C/6BL2r2YH6FzWa8H9m
         e37bEo7dgVXTRVLvgHPMN/3SqQNwTt4cYx8hOkyM0aSYTQfdzui6S0zygANRHHgXVOzo
         8/y+iKrxbI7rljtTmnVaRgP89QNBOsJxiUuyoPzhAux6iQ/WeZZKJ44Uh3qV63dZNy2X
         zFaFtzNcHJYHdAk3pWI7sT1QcxMkPUe7pSSZ4QuIqKh+QP937vja0b76LflUAagkY2VI
         ni8Ql2PdOkAuN9RYtNwcGWbuYG8/BdGgkJa9N78J/ZHo5kyR6zij4iVUfpl7W0DlboIV
         1qOA==
X-Gm-Message-State: APjAAAWOZe7+h+B5EnxRUDeWQBY5ntln/sD5ZuliH5lJt3oaDCNHKD/W
        2hOz7X705FD5o2UJXTNW8+tuCyWmvtIUZKEiuVxt5A==
X-Google-Smtp-Source: APXvYqxlNPmkXWAk4ntFo8+j7vPZz1JM/Js336XATIdIxno0pMF0BYtKzho9m+KZys/drne1OuHaScjgbBxZP4jx/Sg=
X-Received: by 2002:a17:90a:c390:: with SMTP id h16mr1318164pjt.131.1580850883761;
 Tue, 04 Feb 2020 13:14:43 -0800 (PST)
MIME-Version: 1.0
References: <20200204193152.124980-1-swboyd@chromium.org> <20200204193152.124980-3-swboyd@chromium.org>
In-Reply-To: <20200204193152.124980-3-swboyd@chromium.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 4 Feb 2020 13:14:31 -0800
Message-ID: <CAFd5g4536r2p7Dg3Hv=BbdmgkiT+FvBvp+NYV6dzocEmaDFi+A@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: qcom-geni: Grow a dev pointer to simplify code
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Girish Mahadevan <girishm@codeaurora.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 4, 2020 at 11:32 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Some lines are long here. Use a struct dev pointer to shorten lines and
> simplify code. The clk_get() call can fail because of EPROBE_DEFER
> problems too, so just remove the error print message because it isn't
> useful.
>
> Cc: Girish Mahadevan <girishm@codeaurora.org>
> Cc: Dilip Kota <dkota@codeaurora.org>
> Cc: Alok Chauhan <alokc@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

I personally am indifferent to &pdev->dev vs. just dev, but not
printing an error in the case of a defer is a definite improvement.

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
