Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7BF1256CEF
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Aug 2020 10:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgH3Isd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Aug 2020 04:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgH3Isd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Aug 2020 04:48:33 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E51C061573;
        Sun, 30 Aug 2020 01:48:32 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id o16so4148379ilq.0;
        Sun, 30 Aug 2020 01:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yN5zfpYr0ap6QNQA6b07VLlwIC2ZQknsrsg4qZRzhsQ=;
        b=m55GwtJCzctGLHJCy6ILFyLvwnfMV5XnTAMd/1yNRPHbpAdIKjN6Hza1t0wxqstKy7
         J9Phj0+iglK0im2Who8WuCOoKdxS6rL+Xr7rx28YsfTCU2q9XnJx4bYi5ql/xXY6bJAm
         Z8T4ujvVSBNWpeIromQpcoJIxFJAvlC06+TqRjDVuRgUIsNsiJOv2CjHIavE/c2jswuY
         PJvKKJl2F5YN1lOAmp7+5XD2pZY0EDtz26dWR7LPC5q6A/6mGRODJ9e6KHbjIG2UJAeY
         Ms0wZ+FWAsACQXxXoYfZQXi2JgpiU4vlfkBS9zFExrSiyRRcErx8fmNXCjO1M7UnAYNF
         ywqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yN5zfpYr0ap6QNQA6b07VLlwIC2ZQknsrsg4qZRzhsQ=;
        b=i4UdqfdTL4/TKFIOYEpAn4LE6cOX7aYQpWFwwW5BxlMrkrSNGlwL7nISNe4B3m8PNQ
         kKu5FvnpTDJiQI9iFONoZpnt7LgnNQ78WiTXwAInVfj+GXC1MHJLRgJKT2WEwMvQ0LKh
         0bxbfTeFdhLV+TCcgk0YLTsdGuRFG4ETPtVfBZiJsJYYVAgWnpn9ZEqBODkhrtJO+x4G
         AYSEU8QGrP22CpgwRY9JktzKFcH2Z+/W1WmqwSo0cWf1WkKdXKSljQk4+5vIdm3vaacQ
         ON+QaMcUTkHaB4RmnAt/qVK81cqcVqhagUmvqToHG1R6xF7Mb31za6hFw4Uco/3zlsU8
         WDJA==
X-Gm-Message-State: AOAM531Llr0nVZOZVw0YzXi0x6zFtM3mc7hnlEA73I83Nw4aPSUvABEI
        hdljSta422bqld3kv7zTMl4pWb55gIjsi7ltzg==
X-Google-Smtp-Source: ABdhPJz5E1w87C69bFw/bnQSnAdK1UhDOFyXTpK/FIJL9zevxCZd5atGrqgMHCeioMk2a4VJDuc1YXEwz5MBP19S29k=
X-Received: by 2002:a92:4952:: with SMTP id w79mr4201284ila.1.1598777311765;
 Sun, 30 Aug 2020 01:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200830074903.176871-1-tali.perry1@gmail.com>
In-Reply-To: <20200830074903.176871-1-tali.perry1@gmail.com>
From:   Avi Fishman <avifishman70@gmail.com>
Date:   Sun, 30 Aug 2020 11:47:10 +0300
Message-ID: <CAKKbWA4f64TxfwVr0p=-TT4e=yznO8WCJuie9cxF3J7u5hELPA@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: npcm7xx: bug fix timeout (usec instead of msec)
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     kunyi@google.com, xqiu@google.com,
        Benjamin Fair <benjaminfair@google.com>,
        Joel Stanley <joel@jms.id.au>,
        Tomer Maimon <tmaimon77@gmail.com>, wsa@the-dreams.de,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tali,

On Sun, Aug 30, 2020 at 11:09 AM Tali Perry <tali.perry1@gmail.com> wrote:
>
> i2c: npcm7xx: bug fix timeout (usec instead of msec)
>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 75f07138a6fa..c118f93a2610 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2094,7 +2094,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>         }
>
>         /* Adaptive TimeOut: astimated time in usec + 100% margin */
> -       timeout_usec = (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);

I suggest to add a short description like:
2: double the timeout for clock stretching case
9: bits per transaction (including the avk/nack)
1000000: micro second in a second
timeout_usec = (2 * 9 * 1000000 / bus->bus_freq) * (2 + nread + nwrite);

> +       timeout_usec = (2 * 10000000 / bus->bus_freq) * (2 + nread + nwrite);
>         timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
>         if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
>                 dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
>
> base-commit: d012a7190fc1fd72ed48911e77ca97ba4521bccd
> --
> 2.22.0
>


-- 
Regards,
Avi
