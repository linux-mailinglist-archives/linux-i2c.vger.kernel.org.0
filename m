Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD84E9A913
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2019 09:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390835AbfHWHoe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Aug 2019 03:44:34 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42732 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388557AbfHWHod (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Aug 2019 03:44:33 -0400
Received: by mail-lf1-f68.google.com with SMTP id s19so6445062lfb.9
        for <linux-i2c@vger.kernel.org>; Fri, 23 Aug 2019 00:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8VhnyQ/lvnPjeI+ZEe4VcwGbfHZbPpwY+AwHcnvR+oE=;
        b=I7Wm2w112kZVo5kWC7G4B9lxgpkpfdDFoX4S5HugYjmAlJg9Z0erMI9NUjIR6JI91X
         Ksvwc+eyUbldOgsBbz65LlhuXXdpscFzJc1vJ07sq2yZe6jlm9x/fvoK0tql9th3ci1/
         CS+DHzG+MT0BgLZQuteblBYRpuXfutqgO3hdFI44CeD329VZcVFLu1vQ44gVVuzeSVII
         9p9q/El026NdnM9A+3b7963AZEg2TEzK3EH31+tAvlgORlD7In2/scnhEcL1feu4ST/1
         DZzgp81ZoP5eiSFgyUIMgsd2vNRj0qHbQfnJPxqefeos6vZgInxz5UN2yqRGIAW1wRLF
         a/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8VhnyQ/lvnPjeI+ZEe4VcwGbfHZbPpwY+AwHcnvR+oE=;
        b=Wh9ZA25bblGT6lbh+5ePJl1sZ6vgnwweLDq4687BJoWZifrBjwayW90Z5OA6oqVOgR
         qeqfLiMOGtaPKlPA8Ha0dYHrkJej6ZPCeDnvzdGPBbmKjyuh3Ff0gNgv1s0ZGY4HjPPJ
         anPCMB2RIBPNiUuhXl63GyLhSg43qu9vi15kR4b2JlfJCoW5r8ZWnRXpNdsqaJaQbY/7
         zvFeJB6yFfeGkxWIXqaL9I6SGkeT6cEwNU/PNNXK4JQWjj7JCtHonbn3ASHVwhIaNE/H
         fmLIIz769OvTasaMZBSXjXkvWl5wXS3Hv6QETIRkpfGl6evNumFNf+FPm05XbCR5PBZX
         owbw==
X-Gm-Message-State: APjAAAVtmOar7QyS8DYfMgfXrnkRianbo53ZVFvEGnkK9KfP9gZ5hj+o
        EyUTjfwd1H8EJihJksqkoR9v//N5t6AWt/9l9FD6Ww==
X-Google-Smtp-Source: APXvYqyNoQgfYc8y4pHvuwV6KbLFLXwLC/iwoPTjq9ZJq+M/tH/JxhgIoE9IKKUF7jG7d7iHWjhzOuKCY0Oof3gDTrw=
X-Received: by 2002:a19:e006:: with SMTP id x6mr1828413lfg.165.1566546271241;
 Fri, 23 Aug 2019 00:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190809162956.488941-1-arnd@arndb.de> <20190809163334.489360-1-arnd@arndb.de>
 <20190809163334.489360-5-arnd@arndb.de>
In-Reply-To: <20190809163334.489360-5-arnd@arndb.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 09:44:19 +0200
Message-ID: <CACRpkdajapOw+fsEx1fqG3FL-n-WYmOUoGw_HGRHd730h+uv-w@mail.gmail.com>
Subject: Re: [PATCH 5/7] ARM: xscale: fix multi-cpu compilation
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     soc@kernel.org, Russell King <linux@armlinux.org.uk>,
        Dan Williams <dan.j.williams@intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dmaengine@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 9, 2019 at 6:33 PM Arnd Bergmann <arnd@arndb.de> wrote:

> Building a combined ARMv4+XScale kernel produces these
> and other build failures:
>
> /tmp/copypage-xscale-3aa821.s: Assembler messages:
> /tmp/copypage-xscale-3aa821.s:167: Error: selected processor does not support `pld [r7,#0]' in ARM mode
> /tmp/copypage-xscale-3aa821.s:168: Error: selected processor does not support `pld [r7,#32]' in ARM mode
> /tmp/copypage-xscale-3aa821.s:169: Error: selected processor does not support `pld [r1,#0]' in ARM mode
> /tmp/copypage-xscale-3aa821.s:170: Error: selected processor does not support `pld [r1,#32]' in ARM mode
> /tmp/copypage-xscale-3aa821.s:171: Error: selected processor does not support `pld [r7,#64]' in ARM mode
> /tmp/copypage-xscale-3aa821.s:176: Error: selected processor does not support `ldrd r4,r5,[r7],#8' in ARM mode
> /tmp/copypage-xscale-3aa821.s:180: Error: selected processor does not support `strd r4,r5,[r1],#8' in ARM mode

OK we certainly need this.

> Add an explict .arch armv5 in the inline assembly to allow the ARMv5
> specific instructions regardless of the compiler -march= target.

You probably mean...

> +.arch xscale                                   \n\
>         pld     [%0, #0]                        \n\

Explicit .arch xscale rather than .arch armv5.

Yours,
Linus Walleij
