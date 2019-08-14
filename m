Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60C3B8D14B
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 12:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfHNKso (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 06:48:44 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:44110 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbfHNKso (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Aug 2019 06:48:44 -0400
Received: by mail-qk1-f194.google.com with SMTP id d79so82010405qke.11;
        Wed, 14 Aug 2019 03:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Pd2kynJ3XCWkX4RKcVEYfgPLi/9H/DDd0NVl7yQPeo=;
        b=b3WfU4JrlERMYKiLFbBextRd7Yf69VVTW6nuiE21/6RvqXYKge8poIU+J8JMwdJiZH
         pzUPX8ALt7pm0DOucJNDLl4QMghRb0/j4O8FtrWS3vNMctxx9I3OZCkpQNEohrg1WS1h
         5TdReU4oZMhBV92RSRM7DwElUHfP/dQPL/ajWUMIogpyCMeyIJNrII8cLsiX1j9gdbsS
         4VVkGJfwKfCCm1Ggi1kI7IlP4Kkldzk+U/h+Gfh7Jm8galthdPkquR1oLPw9QjOZ2BqT
         Ryrw6u3uIbgPhV+CElyw08M/Isw7bGI8rznYdLlN1j4GVsWmQe3F+8qcUlc7PQzC418l
         3WMA==
X-Gm-Message-State: APjAAAWq0ebSqKDmFCdj0GJN40JJAkqmONMUNQzD76dwn0L5TEHp5zU8
        5sGJLDfPaXhRDLe6ZF6tKMKV6zwixU7SEbSfFDs=
X-Google-Smtp-Source: APXvYqzJchKTdX84186eS/GRemJU2ycIuCn2KmHcwgWMevAGnRcm51YC1Y0PGo9zYEARmcpYhVr0785iqWnXPMYbu7s=
X-Received: by 2002:a37:4ac3:: with SMTP id x186mr36177300qka.138.1565779720761;
 Wed, 14 Aug 2019 03:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190809162956.488941-1-arnd@arndb.de> <20190809163334.489360-1-arnd@arndb.de>
 <CAA9_cmdDbBm0ookyqGJMcyLVFHkYHuR3mEeawQKS2UqYJoWWaQ@mail.gmail.com>
 <20190812094456.GI10598@jirafa.cyrius.com> <CACRpkdao8LF8g5qi_h+9BT9cHwmB4OadabkdGfP0sEFeLbmiLw@mail.gmail.com>
In-Reply-To: <CACRpkdao8LF8g5qi_h+9BT9cHwmB4OadabkdGfP0sEFeLbmiLw@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 14 Aug 2019 12:48:23 +0200
Message-ID: <CAK8P3a3Jtc-hgP+st=oDUF2hWkLK7CCM461YSA2ks3dqcv-W7g@mail.gmail.com>
Subject: Re: [PATCH 1/7] [RFC] ARM: remove Intel iop33x and iop13xx support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Martin Michlmayr <tbm@cyrius.com>,
        Dan Williams <dan.j.williams@intel.com>, soc@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Vinod Koul <vkoul@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dmaengine@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Peter Teichmann <lists@peter-teichmann.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 14, 2019 at 10:36 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Aug 12, 2019 at 11:45 AM Martin Michlmayr <tbm@cyrius.com> wrote:
>
> > As Arnd points out, Debian used to have support for various iop32x
> > devices.  While Debian hasn't supported iop32x in a number of years,
> > these devices are still usable and in use (RMK being a prime example).
>
> I suppose it could be a good idea to add support for iop32x to
> OpenWrt and/or OpenEmbedded, both of which support some
> pretty constrained systems. I am personally using these
> distributions to support elder ARM hardware these days.

OpenWRT also had support in the past and dropped it around the
same time as Debian. The way I understand it, a couple of platforms
including iop32x were moved out of the main openwrt source tree
into https://github.com/openwrt/targets/ because there was little
interest in keeping them running.

The idea was that any remaining users could add that feed to get
minimal support, but I'm not sure if would still work. In particular,
iop33x appears to be based on linux-3.3 plus three patches that
are no longer needed in mainline. Building a mainline kernel without
those patches may or may not work.

        Arnd
