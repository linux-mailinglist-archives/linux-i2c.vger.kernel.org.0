Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5CB0A1430
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 10:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbfH2IxI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 04:53:08 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38965 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbfH2IxI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Aug 2019 04:53:08 -0400
Received: by mail-ot1-f67.google.com with SMTP id b1so2649368otp.6;
        Thu, 29 Aug 2019 01:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EIJAhw2urkR5VtvRodOO+ASHpiwIZz6qqEqE7Oa24LU=;
        b=cK35fNUUR5PX36UcmIbskW4jEFbit7GuxV1/iPbgO03d1vad2fS8rhtBIaMFF6ZlmL
         JMIwfxYs0eura+EgTQrCz4D6GDLf95ac7dBJn3ICLqRiFgJc9LFJVT1NQVQkFyJuzqf4
         +WczoyBsLydE4HYSyenLzP7GgeSS1stQoEq0wzNrKpOvahF21Z61u35te9ukd8EO51GD
         gBOssDPlqe/6+nnlxed8gejeV7fzTL2+mP+7blMvqiCnBZcMCtX2R/3c29IJpr/v0Wa6
         FAXQTVuho+WqomWJHgLst9fOO5ZfdHhdUVUvxG/gn+FcJNmUtONE7r6DGDWuXxsg7NdX
         ALhQ==
X-Gm-Message-State: APjAAAW20BgYleNUmf24DALs9ClXiNfDsquM1+SkF1C1REvJ38Ma40dH
        EB+LPQqMsbQLPg6yqa1q23z7YaL1nLhBs8JvtiDhMQ==
X-Google-Smtp-Source: APXvYqzKrWEUmujCP99cM9ckSxbmOwT2FI15sD68kl0juR/qG5KPwUfpLut7eiRgBPU7JipcYuDhHSTK+45aVFrnW/I=
X-Received: by 2002:a9d:3e50:: with SMTP id h16mr6446572otg.107.1567068787660;
 Thu, 29 Aug 2019 01:53:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190819204825.2937-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190819204825.2937-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 29 Aug 2019 10:52:56 +0200
Message-ID: <CAMuHMdUvbjosOUeSNyga07=2tnrGsnxE-C=NhoJ8qooTxMWxUA@mail.gmail.com>
Subject: Re: [PATCH] i2c: make i2c_unregister_device() ERR_PTR safe
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 19, 2019 at 10:49 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We are moving towards returning ERR_PTRs when i2c_new_*_device() calls
> fail. Make sure its counterpart for unregistering handles ERR_PTRs as
> well.
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
