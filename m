Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 185EF90517
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 17:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfHPP6z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 11:58:55 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:59568 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbfHPP6y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Aug 2019 11:58:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=elvBvWVjA5zEKSsmKbJEnexDrHQ4zbh3H23MLrNFngo=; b=tvPwPtQ4nFDYaEWEEzQfKWjwT
        qpues7whqp46I5Vlpf5mw8wLLXsjKZKhYL3qENDObHr6e/tfvEqxnobSqk7I+o8v6P6iqggBm6bK8
        +y3guiVg8OfWpHZ8bh58NmAeKwmeX0HupBG5xVopY34VS5LqkUavmbNU6noiQQopZ1a4mq9fGdq6p
        c5KbXcAx4K1KtIkxoRHLI/wqpZf4RM43n0pGEclxKe0aaadyBCwVAPigha/G0PUIBxsj4OfqNCkkw
        FxLd0qpy6KdFuAW2HwhGMe+61mqPkgsxj3ISsxS3g1BEReMjus1jWj7xe4EIHYxHqFNmDHQ2jXorL
        8vxupwB3g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57356)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1hyecj-00034q-B3; Fri, 16 Aug 2019 16:58:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1hyecb-00023W-PW; Fri, 16 Aug 2019 16:58:33 +0100
Date:   Fri, 16 Aug 2019 16:58:33 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
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
Message-ID: <20190816155833.GL13294@shell.armlinux.org.uk>
References: <20190809162956.488941-1-arnd@arndb.de>
 <20190809163334.489360-1-arnd@arndb.de>
 <CAA9_cmdDbBm0ookyqGJMcyLVFHkYHuR3mEeawQKS2UqYJoWWaQ@mail.gmail.com>
 <20190812094456.GI10598@jirafa.cyrius.com>
 <CACRpkdao8LF8g5qi_h+9BT9cHwmB4OadabkdGfP0sEFeLbmiLw@mail.gmail.com>
 <20190816154249.GA30291@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816154249.GA30291@darkstar.musicnaut.iki.fi>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 16, 2019 at 06:42:49PM +0300, Aaro Koskinen wrote:
> Hi,
> 
> On Wed, Aug 14, 2019 at 10:36:01AM +0200, Linus Walleij wrote:
> > On Mon, Aug 12, 2019 at 11:45 AM Martin Michlmayr <tbm@cyrius.com> wrote:
> > > As Arnd points out, Debian used to have support for various iop32x
> > > devices.  While Debian hasn't supported iop32x in a number of years,
> > > these devices are still usable and in use (RMK being a prime example).
> > 
> > I suppose it could be a good idea to add support for iop32x to
> > OpenWrt and/or OpenEmbedded, both of which support some
> > pretty constrained systems.
> 
> This platform is not really too constrained... E.g. on N2100 you have
> 512 MB RAM, SATA disks and gigabit ethernet. Not that different from
> mvebu that Debian currently (?) supports. Maybe with multiplatform they
> could support iop32x again.

Probably not.  The kernel has a dividing line between ARMv5 and ARMv6
where it's not possible to multiplatform across that boundary, so
you're already needing separate kernel images there.

Secondly, armhf distros won't be compatible with ARMv5, and to make
them compatible will make performance on armhf suffer - you have to
stop using barriers, exclusive load/store and a few other things.
You have to rely on the kuser page exported by the kernel (which is
now optional as it's deemed to be a security issue for ROP attacks)
for some things that such a userspace requires - such as NPTL support.

Effectively, ARMv5 is an entirely separate userspace distro from armhf.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
