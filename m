Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA1914A2D8
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2020 12:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgA0LRq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jan 2020 06:17:46 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38356 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgA0LRp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jan 2020 06:17:45 -0500
Received: by mail-ed1-f65.google.com with SMTP id p23so1612025edr.5;
        Mon, 27 Jan 2020 03:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=URicdRNDSRXDR1lupXQbSUVybSg17tNT9soEhKW0QAo=;
        b=pUTN0aoOns3aVn96Ine8HG45pYsXt0YaSdk0G7yHj/qcwFOgvU2c8xIhj4X2KTVC23
         OiFJu4c/MZqkuay5j6cuhxcfsvVDsfGvIHEDn5hQ/DrRPjqxbEgRM6eiNuRhU04Y2zgb
         pd5akd/gqBv83BFitRXcBQ71lGp1Wt7e08aPOMiz1L76mhxS8M9ISq2jV6f9ARZ9UgVJ
         pDKTjHefte5tJAEqVx++qzchSPyudt7SxGQgX8AfLChWQlW7Q2B15QW8kbYl/jGNx0XG
         +TbChqBLSA+HFqQBZYGJ6UVorpbdr1eSXg8Da4Na36nPe6DZX8qLIyKThIoeYhBiJgCp
         aG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=URicdRNDSRXDR1lupXQbSUVybSg17tNT9soEhKW0QAo=;
        b=HkFiUCbo2QyhEp+JwIM8kQ5pqr+cuiBAwpcH0n2VDLuaKfzqQzzT7FAtTMZrDhTaNX
         RJiNj4Jdixyv+vvp1+2MhEwbEfEntbzL2g+JSo0oRcgaVxVStTdqPfbOoLPF4t+cxgYZ
         NR8JJJSInQauAKsce4lc6WK1jL/9p9TwI6vEsMgkbuq1QXciS45uPAFHr5MSh12NV+dY
         bFOuUUixNnAbUKM3bynH7pJdbi68BW4khgNqdS8+fgzZ4vM3I5swEHBa0hZNTmyWYdgN
         eI639ijfERBexo3qIp02oCLHE0/ofNmLSgJ7v4pl4wDSB/aI/yCLI2fW/DoaBq6bl/rJ
         coUA==
X-Gm-Message-State: APjAAAUMWLM51wkARrcXJWamGdI0E/gOhnvymRu97yHgJuZXdaBdCmeQ
        Eh2ShQwNnklwKRWFDM76PnXknUArqb+i2RqX3BQ=
X-Google-Smtp-Source: APXvYqziQE9LV2rl/8tkESiGWi9hkeo3170AZ/wKEoqTmy3Gmiki1HzT/6UUwf2yRfVFGg+MOn0gQka/qfkY0gHedrI=
X-Received: by 2002:aa7:ccc7:: with SMTP id y7mr13298482edt.45.1580123864420;
 Mon, 27 Jan 2020 03:17:44 -0800 (PST)
MIME-Version: 1.0
References: <20200127102303.44133-1-colin.king@canonical.com>
In-Reply-To: <20200127102303.44133-1-colin.king@canonical.com>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Mon, 27 Jan 2020 16:47:33 +0530
Message-ID: <CAKfKVtHMbOvwppZcLN=J+2VvJ1GOFgZ2-DDAfav5w9zf1EjZKQ@mail.gmail.com>
Subject: Re: [PATCH][next][V2] i2c: xiic: fix indentation issue
To:     Colin King <colin.king@canonical.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 27, 2020 at 4:46 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a statement that is indented one level too deeply, remove
> the extraneous tab.
>
Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> V2: fix type in commit message
> ---
>  drivers/i2c/busses/i2c-xiic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index b17d30c9ab40..90c1c362394d 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -261,7 +261,7 @@ static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
>                 xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
>                 if (time_after(jiffies, timeout)) {
>                         dev_err(i2c->dev, "Failed to clear rx fifo\n");
> -                               return -ETIMEDOUT;
> +                       return -ETIMEDOUT;
>                 }
>         }
>
> --
> 2.24.0
>
