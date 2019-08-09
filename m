Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD22882B3
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 20:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407619AbfHIShR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 14:37:17 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:33524 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407617AbfHIShR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Aug 2019 14:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=IGx1tU/8oZZB3pB47GcI0li+Dcw0am8UumHeTJgqBsA=; b=FI1vTkLp5g159Uj8cKQ9M9yPg
        5o1Cnqp19oMJ6nrpK4zw0M1TH8cDtseJ969So98LRY7NxqWnT2GtIvCesWJy5YogAvFlQcwVLFf9m
        MdzBWgIc6Eqi9mNeGKEbCZ9AbhgxE+I9yycgXHBgxA5104BGeZr1YZid8L4JBbwIYV/BtyAyk1euz
        KwZgttgdk5EEc6iqpUf2Bvj3Duy/uTnZNEIAJhQsO9IeHKI/u7syQ7tOl0+F2VQniPR2YGbBcT+Ft
        8Xy5MdDaQ7/hyU4s3LkVh3XzSZpYapT3CopyQgW0n2gy4ZTERYvKaCunp9i2GpwSUkZmulS+XvQ7r
        dl2HpuDSQ==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:42960)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1hw9lA-0003Lr-PB; Fri, 09 Aug 2019 19:37:04 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1hw9l4-0003t7-5w; Fri, 09 Aug 2019 19:36:58 +0100
Date:   Fri, 9 Aug 2019 19:36:58 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, Martin Michlmayr <tbm@cyrius.com>
Subject: Re: [PATCH 1/7] [RFC] ARM: remove Intel iop33x and iop13xx support
Message-ID: <20190809183658.GA13294@shell.armlinux.org.uk>
References: <20190809162956.488941-1-arnd@arndb.de>
 <20190809163334.489360-1-arnd@arndb.de>
 <CAA9_cmdDbBm0ookyqGJMcyLVFHkYHuR3mEeawQKS2UqYJoWWaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA9_cmdDbBm0ookyqGJMcyLVFHkYHuR3mEeawQKS2UqYJoWWaQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 09, 2019 at 11:34:12AM -0700, Dan Williams wrote:
> [ add Martin (if cyrius.com address is still valid) ]
> 
> On Fri, Aug 9, 2019 at 9:35 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > There are three families of IOP machines we support in Linux: iop32x
> > (which includes EP80219), iop33x and iop13xx (aka IOP34x aka WP8134x).
> >
> > All products we support in the kernel are based on the first of these,
> > iop32x, the other families only ever supported the Intel reference
> > boards but no actual machine anyone could ever buy.
> >
> > While one could clearly make them all three work in a single kernel
> > with some work, this takes the easy way out, removing the later two
> > platforms entirely, under the assumption that there are no remaining
> > users.
> >
> > Earlier versions of OpenWRT and Debian both had support for iop32x
> > but not the others, and they both dropped iop32x as well in their 2015
> > releases.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> > I'm just guessing that iop32x is still needed, and the other two are
> > not. If anyone disagrees with that assessment, let me know so we
> > can come up with an alternative approach.
> 
> I'm not sure who would scream if iop32x support went away as well, but
> I have not followed this space in years hence copying Martin.
> 
> In any event:
> 
> Acked-by: Dan Williams <dan.j.williams@intel.com>

Those of us who have and still run Thecus N2100's, for example?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
