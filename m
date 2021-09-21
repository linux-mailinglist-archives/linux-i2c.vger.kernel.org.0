Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0188D413B4E
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Sep 2021 22:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbhIUU1y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Sep 2021 16:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhIUU1y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Sep 2021 16:27:54 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C64CC061574
        for <linux-i2c@vger.kernel.org>; Tue, 21 Sep 2021 13:26:25 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id g8so1062993edt.7
        for <linux-i2c@vger.kernel.org>; Tue, 21 Sep 2021 13:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=8NGtvzrxrTk4fvtfOLfnIIf4qdX79aa7lRk6P/CEK8I=;
        b=LjszU6sEoV61uiJ09b5Y/121QkedVNVrPEWm0oFRCT4IrXormGZ0eZvnBoSw+V/cXq
         yUWTZgVyHa5BSA0zmCnTAKEw3WGP3zr2FDBEiWxG/PP1jYlye0kuBu8WKNQ9wmKwR3TZ
         FchexmachKzq+4sEB4W4uMl/S0MpMe+9kkdeOQm3hKGIDXcjvB7He+waTkCMCAgeqltE
         FR9k0nqC/bnu55HY3nYy+wAgRH+40/otO1Tj1y4DZxTCb9dPaSE3n2Sk0u6aeQslLPbX
         xcTMMTne4DTFvd+FlS2bt53UqFkKL0eHD807pCXgAX6ddYfTe2s6Afi16zUtCMSC0kNd
         sjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=8NGtvzrxrTk4fvtfOLfnIIf4qdX79aa7lRk6P/CEK8I=;
        b=2BLjvfpHBEuaytcd/hU8sJ/XDMuShcNhIBf5Rdoc1yPbY7dzLl2Gtkol+a3ORr4Uim
         DTzBwj/mBrSItVkTWGmhdFFIOfHEHnrSCAs6XtH0GuhEXF4Auxq/qjuaLZlkHECyDip/
         th3hOIWx07jN65asUcRghYM1vme6/DKbrbwHwVOHQnQYx7C1SQ9nvPCErRorMddHE8mL
         F4OVI8YJC13NNhRXHQSvh6yxXUd7R2ZidBjBqQbXSGoQM5tDqiMXpUzOmsyThJiM9/KG
         7Z+85hBElpXjsOU3H7H3gfUNyURZ0yK82hGnIPAkTtWioq2ENcqAYxFO5dUFaMWOBWP2
         zKYw==
X-Gm-Message-State: AOAM531LSIWj9frgRpCz3ZhkQ5xF99M3BheGhgXkHPZuB1v4ddYN0vMV
        enmOG/0t9uesuYPFAi5PRhOP8OTxQw5DCsJca4s=
X-Google-Smtp-Source: ABdhPJyo8EUJj2MpRCP97kYlkQx9NjOMvyY+VNJnyztXMxnMWpRYw3W9Zifq12Jn9+FCBKU0apJJtxNbKOOWM0wFp+E=
X-Received: by 2002:a50:e141:: with SMTP id i1mr3833275edl.157.1632255983465;
 Tue, 21 Sep 2021 13:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAGGHmKF6HH+0cQL9_DK+-osSLFJodQODpaaxxF0r0HYXqo82Ww@mail.gmail.com>
 <YUmEufe0eUPB+SBA@ninjato>
In-Reply-To: <YUmEufe0eUPB+SBA@ninjato>
From:   Steven Stallion <sstallion@gmail.com>
Date:   Tue, 21 Sep 2021 15:26:12 -0500
Message-ID: <CAGGHmKGgqV+Oh79YxeswePfFKS38UrgH50+atTb-=b=0KD9ZtA@mail.gmail.com>
Subject: Re: Introducing libi2cd
To:     Wolfram Sang <wsa@kernel.org>,
        Steven Stallion <sstallion@gmail.com>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 21, 2021 at 2:07 AM Wolfram Sang <wsa@kernel.org> wrote:

> Hi Steven,
>
> Thank you for this work and the heads up. I'll CC Jean Delvare who
> implemented the library in i2c-tools to raise his attention.

Thanks Wolfram! Hopefully others will find it useful too.

Cheers,
Steve
