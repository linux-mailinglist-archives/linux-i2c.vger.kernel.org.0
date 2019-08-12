Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A456B89A33
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 11:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727715AbfHLJpD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 05:45:03 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:51325 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727430AbfHLJpC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 05:45:02 -0400
X-Originating-IP: 91.118.195.70
Received: from jirafa.cyrius.com (91-118-195-70.static.upcbusiness.at [91.118.195.70])
        (Authenticated sender: tbm@cyrius.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id DA1BF40003;
        Mon, 12 Aug 2019 09:44:56 +0000 (UTC)
Received: by jirafa.cyrius.com (Postfix, from userid 1000)
        id 58518A887E; Mon, 12 Aug 2019 11:44:56 +0200 (CEST)
Date:   Mon, 12 Aug 2019 11:44:56 +0200
From:   Martin Michlmayr <tbm@cyrius.com>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Peter Teichmann <lists@peter-teichmann.de>
Subject: Re: [PATCH 1/7] [RFC] ARM: remove Intel iop33x and iop13xx support
Message-ID: <20190812094456.GI10598@jirafa.cyrius.com>
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

* Dan Williams <dan.j.williams@intel.com> [2019-08-09 11:34]:
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

I believe iop13xx were mostly Intel dev boards.  I'm not aware of any
major devices based on iop33x.

As Arnd points out, Debian used to have support for various iop32x
devices.  While Debian hasn't supported iop32x in a number of years,
these devices are still usable and in use (RMK being a prime example).

So I think it's safe to drop iop33x/iop13xx while retaining support
for iop32x.

As I was looking at my email archives, I saw an email from Peter
Teichmann who was working on an iop33x based platform (around 2009) so
I've copied him as well.

> In any event:
> 
> Acked-by: Dan Williams <dan.j.williams@intel.com>

Acked-by: Martin Michlmayr <tbm@cyrius.com>

-- 
Martin Michlmayr
https://www.cyrius.com/
