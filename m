Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1573E193CDD
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 11:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbgCZKTL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 06:19:11 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44238 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgCZKTL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Mar 2020 06:19:11 -0400
Received: by mail-ot1-f68.google.com with SMTP id a49so5194178otc.11;
        Thu, 26 Mar 2020 03:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ZlJVABzE2QSOItkj22OjR+sxf3/Tr/HEBKp0OkE1dw=;
        b=lBSwBHwIwu9lkMr2eJxlWrxd3D9Bukn6BUUCBwg5wdrv4SiUbJYruJSR7OueMapgb+
         qKPnvr8cZxa3YN5aL8WzGMQPhl1ZcZcLBccm9xmoA1cZo0d1uX9eBN67dFg1dErrOU4x
         O8OMgJ4qp3Yb6VRktxCL0GnIkpMEnc2LirCQfhV/4V8xyL5mWqpC58jDRpPo9InKTmvA
         aA9QaBfoadJpFMgTSnhpYGH2zyn4nVKwpnVnL0uo/Mb44EzgsufO4EnIlxSvWbPlagdM
         Df1C3CTuuTTa1xPRdF53QkK65azzgWjuwdokGKVJVzi/mIVmDLjzcikCJq9nzEPMPMYO
         IbCw==
X-Gm-Message-State: ANhLgQ2shn72nl62mTvFTwID9iAFXRs9PqwQ4JtaLgRTnWUueD13UoJ3
        /ckMCQbLCLguiwts5JGlK9uWaEq/myUKzo7xFR2H3A==
X-Google-Smtp-Source: ADFU+vuxNI02MmE9CQbqdVMt+RHIpiA7B/QgsXJqgxmNvIg0V4Hna0p77pZs6Al0gP8qfe9aI3WMaGPhe8Q+PRGIAbY=
X-Received: by 2002:a05:6830:15c2:: with SMTP id j2mr5380412otr.107.1585217951151;
 Thu, 26 Mar 2020 03:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200326100721.1265-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200326100721.1265-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Mar 2020 11:19:00 +0100
Message-ID: <CAMuHMdUGD4LNXUxWes6VH=agwC_W6_MzoV13bnR4LPYqe2e6wg@mail.gmail.com>
Subject: Re: [PATCH] i2c: rcar: clean up after refactoring i2c_timings
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 26, 2020 at 11:07 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The pointer is not really needed anymore since we have the timings
> struct available in the function itself now. Remove the pointer and
> access the struct directly.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
