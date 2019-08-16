Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 535DC9058E
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 18:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbfHPQPS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 12:15:18 -0400
Received: from emh02.mail.saunalahti.fi ([62.142.5.108]:44832 "EHLO
        emh02.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfHPQPS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Aug 2019 12:15:18 -0400
Received: from darkstar.musicnaut.iki.fi (85-76-65-201-nat.elisa-mobile.fi [85.76.65.201])
        by emh02.mail.saunalahti.fi (Postfix) with ESMTP id 15AB6200D9;
        Fri, 16 Aug 2019 19:15:14 +0300 (EEST)
Date:   Fri, 16 Aug 2019 19:15:14 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Martin Michlmayr <tbm@cyrius.com>,
        Peter Teichmann <lists@peter-teichmann.de>,
        Arnd Bergmann <arnd@arndb.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        soc@kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>, dmaengine@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/7] [RFC] ARM: remove Intel iop33x and iop13xx support
Message-ID: <20190816161514.GB30291@darkstar.musicnaut.iki.fi>
References: <20190809162956.488941-1-arnd@arndb.de>
 <20190809163334.489360-1-arnd@arndb.de>
 <CAA9_cmdDbBm0ookyqGJMcyLVFHkYHuR3mEeawQKS2UqYJoWWaQ@mail.gmail.com>
 <20190812094456.GI10598@jirafa.cyrius.com>
 <CACRpkdao8LF8g5qi_h+9BT9cHwmB4OadabkdGfP0sEFeLbmiLw@mail.gmail.com>
 <20190816154249.GA30291@darkstar.musicnaut.iki.fi>
 <20190816155833.GL13294@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816155833.GL13294@shell.armlinux.org.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Fri, Aug 16, 2019 at 04:58:33PM +0100, Russell King - ARM Linux admin wrote:
> On Fri, Aug 16, 2019 at 06:42:49PM +0300, Aaro Koskinen wrote:
> > On Wed, Aug 14, 2019 at 10:36:01AM +0200, Linus Walleij wrote:
> > > On Mon, Aug 12, 2019 at 11:45 AM Martin Michlmayr <tbm@cyrius.com> wrote:
> > > > As Arnd points out, Debian used to have support for various iop32x
> > > > devices.  While Debian hasn't supported iop32x in a number of years,
> > > > these devices are still usable and in use (RMK being a prime example).
> > > 
> > > I suppose it could be a good idea to add support for iop32x to
> > > OpenWrt and/or OpenEmbedded, both of which support some
> > > pretty constrained systems.
> > 
> > This platform is not really too constrained... E.g. on N2100 you have
> > 512 MB RAM, SATA disks and gigabit ethernet. Not that different from
> > mvebu that Debian currently (?) supports. Maybe with multiplatform they
> > could support iop32x again.
> 
> Probably not.  The kernel has a dividing line between ARMv5 and ARMv6
> where it's not possible to multiplatform across that boundary, so
> you're already needing separate kernel images there.
> 
> Secondly, armhf distros won't be compatible with ARMv5, and to make
> them compatible will make performance on armhf suffer - you have to
> stop using barriers, exclusive load/store and a few other things.
> You have to rely on the kuser page exported by the kernel (which is
> now optional as it's deemed to be a security issue for ROP attacks)
> for some things that such a userspace requires - such as NPTL support.
> 
> Effectively, ARMv5 is an entirely separate userspace distro from armhf.

I thought they still had armel for ARMv5 and mvebu (kirkwood).

A.
