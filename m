Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9BA4F8A51
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2019 09:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfKLIQr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Nov 2019 03:16:47 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35134 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfKLIQr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Nov 2019 03:16:47 -0500
Received: by mail-ot1-f68.google.com with SMTP id z6so13597064otb.2;
        Tue, 12 Nov 2019 00:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nVPU+cHCcSfURvV6BR/kodxBWBjWV3Ujx+3PUKiBImI=;
        b=kpaYbwz3QMQ5jHkIifiVSZuxDtqYtvT31x9RSs+GzzcqRXh9xCqxG1sELIvp5K1Ma6
         Tvi7zHa7sIz3xDuKxiXaHw6MOp4liFK82tWTKO99CjD7Z7Rux0Vd8xKUtb9vf/RQu4oE
         zL6fnGN2GbCnHxPFfjhMksxAbkXqSqF/q46n0KjNSDKNHZlyAjfxRSK6SDp3OMlwGiay
         o7lT0whYGGfEVYZutP+jR8fDQhf8ffTggphGSCt1Kn8RQEBCyVhNls5f9cpS5r0i0V6x
         z39Cxbn4DWgFRjZ6ZECp0CwsusrcFpJvFBk/85RDBgpYZf3CHIAK8ygN07MUxs8X2Aqj
         GBCg==
X-Gm-Message-State: APjAAAUsbjAZ7ZRU/jGdhLP/oGzrPiotCHUf50XtbHYgDtSHnLU0LXuP
        MYV6daTuIc5u1Hb5BljKutfVs/PcQr3Aexepwzs=
X-Google-Smtp-Source: APXvYqzSp4C/3Jiu1piAZXoWEundp0dfUPwEVQnromq63bhoLaTQrlGWPhIZycndeIpY3DkHHp7TGxh3Yb/n9sNQ+0c=
X-Received: by 2002:a9d:422:: with SMTP id 31mr23552748otc.107.1573546606109;
 Tue, 12 Nov 2019 00:16:46 -0800 (PST)
MIME-Version: 1.0
References: <20191109212615.9254-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191109212615.9254-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Nov 2019 09:16:35 +0100
Message-ID: <CAMuHMdU=1KK4j8y9Jqki41YpMqAEkDgA230=ErxNNPpNUzkRiw@mail.gmail.com>
Subject: Re: [PATCH] i2c: remove helpers for ref-counting clients
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Nov 9, 2019 at 10:26 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> There are no in-tree users of these helpers anymore, and there
> shouldn't. Most use cases went away once the driver model started to
> refcount for us. There have been users like the media subsystem, but
> they all switched to better refcounting methods meanwhile. Media did
> this in 2008. Last user (IPMI) left 2018. Remove this cruft.
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
