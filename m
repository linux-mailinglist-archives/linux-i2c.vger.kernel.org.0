Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86768222EA1
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 01:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbgGPXJU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 19:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727915AbgGPXJS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 19:09:18 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A99AC08C5CE
        for <linux-i2c@vger.kernel.org>; Thu, 16 Jul 2020 15:16:41 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id t15so5358448pjq.5
        for <linux-i2c@vger.kernel.org>; Thu, 16 Jul 2020 15:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uyJjNcCyaCd1x5/819IrrY1FHu5p7NCmrwELbf92SAw=;
        b=eHu1cIr74RawyPqX0Cqg3kfkYi/drr3HXHWhaWKTivMGMKCMf3e0XRoQ2En4jdjC4o
         l0QXBXm6ndcTw0e1BnIhRnI9fmTiAZsUsu0D17CFOrD4RGcofnUAKaBCktK0WZ3HIVfj
         xabBG2ZxSqmkP5rHOF+BNiSMHYS5PaLoIfFLIMpffgQpnHBG0JhA3lwQzxqpQJRN1Igr
         Ol5E/Gp0zFDAv77oilMTq1A6jnLxF8MKYnrfILiWK6THw1VBn9dDuu8Xz+SeXubQM64h
         RRBKDl3Y3FuU2gfHgGMY94DzYfV9XveiQNE1WNtju12Jzz60Joi1KZzd8kS0V40voa54
         cnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uyJjNcCyaCd1x5/819IrrY1FHu5p7NCmrwELbf92SAw=;
        b=fWuPSov4eA0J3kyPooVQuSFXHpSKTKmudhTY0gQAghPHAAov67vvdSqdfE2JewfG0+
         /gQQe5pbDyXdXa7tKiO05f9cFr890DwDzJN/nvAggxpuw2Hz6+rQrnYvYN86pWL+2TYQ
         nxdCnhIYfX4XmxgKUhWgoaZPp/7dzZ53Xn8kRmo1FUCt9ZKoFu2YGzimDLZ5cZD0c4zq
         vm6YYYNX9hBGrk1aayLrksznbLGSyxystgVEfsgfHdklVHvKMslxsuJw3hxQr3LREuvk
         Pbh8pvhQMqbOOKjOA7lgim3c9W1VBYGxkjZDpZuRnxilAzwzR7dcbKQQ84JIo67dJ65w
         GhWQ==
X-Gm-Message-State: AOAM532UhZ+7PrY7ASKQji/JzX/DUyNJ1RpY1p9W7Oz+dM29qZ7Cnivx
        q9GOxy7w0pPN5qZ8qUS7WyQOkXwOrd5maSe5oYm1pywWQYo=
X-Google-Smtp-Source: ABdhPJzd3SJxIS4HsCUds4zwHzaxq83M1tXUciur4bETKG0e7fh8+z+LpQ32CtOhhi4oDDmKD7oe/79nInT7mEGSln8=
X-Received: by 2002:a17:90a:cc03:: with SMTP id b3mr6368860pju.80.1594937800591;
 Thu, 16 Jul 2020 15:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200716215242.GA19193@embeddedor>
In-Reply-To: <20200716215242.GA19193@embeddedor>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 16 Jul 2020 15:16:29 -0700
Message-ID: <CAFd5g44yqds4xUp=xVbXTpFZydLobfpyLrVdwZOjrRa4=TOj5Q@mail.gmail.com>
Subject: Re: [PATCH][next] i2c: aspeed: Use fallthrough pseudo-keyword
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jul 16, 2020 at 2:47 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1].
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
