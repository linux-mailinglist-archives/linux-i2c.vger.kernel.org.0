Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59044FBDA
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 16:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726914AbfD3Oro (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 10:47:44 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:46027 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfD3Oro (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Apr 2019 10:47:44 -0400
Received: by mail-vs1-f66.google.com with SMTP id o10so8111211vsp.12;
        Tue, 30 Apr 2019 07:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rMB63wjBg+k1LrffiqyB4JnI8JxbLRbVLLOtKUHKkqo=;
        b=pbSPYej+2ClR0mQVGIUPq8O2oWujMV4qzYQkmlvIclrl0DuzN5/WK6u/i8F11Ta/3S
         7X7+APurpJl7C2zvOElRmFSxLYat0DxmrBvY8SABrFI4ICSJDDOt5seVuATARDaX6v7l
         sEp5mdsxJ/gYgThI0cm4G1ryoyQQv41fWRy+xnCAfWsNx1kFQSnTnoHf5yi0YNHTBSjQ
         mNdW9fcX2fwPHZj5zklfcU6DUrTzRMymYuxIm63oh1xEqo61kQ5QmZhpxuKFNobUog6u
         ng+72DMhMSktNPlk2SDg+GyUOIsQ1Ch/IXb4+2Z7C8GytPTqE3b/tQJrQKrcwUFBOCrp
         N2fA==
X-Gm-Message-State: APjAAAXnPkh3T2q4ubV6WLVpuntgtsmYYAevykevbFYBDbLESPhCXvHn
        ZokQ80YvXluxGiVljCONHImJiW/JUywtI+gtdR0=
X-Google-Smtp-Source: APXvYqxciOSdUuyBEy0XUSKjRqlBDiaJU4FCSNyEJr1u0c2PFoRMLrZ/thKBE/iPeevOcMh4JpZo9O9pAniUG+zHoA8=
X-Received: by 2002:a05:6102:113:: with SMTP id z19mr5550873vsq.166.1556635663426;
 Tue, 30 Apr 2019 07:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190430132309.12473-1-chris.brandt@renesas.com> <20190430132309.12473-5-chris.brandt@renesas.com>
In-Reply-To: <20190430132309.12473-5-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 16:47:30 +0200
Message-ID: <CAMuHMdURvgz+WEoqV++mFB8arkmEv73E8PaBo6L_oDVXgKJGVQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] ARM: dts: r7s9210: Add RIIC support
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 30, 2019 at 3:42 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add I2C support for the R7S9210 (RZ/A2) SoC.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
