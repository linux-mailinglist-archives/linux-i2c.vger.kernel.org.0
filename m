Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5128399CA
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 01:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730048AbfFGXsm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 19:48:42 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38165 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727184AbfFGXsm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 19:48:42 -0400
Received: by mail-lj1-f193.google.com with SMTP id o13so3136881lji.5
        for <linux-i2c@vger.kernel.org>; Fri, 07 Jun 2019 16:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MYV2gzft/kwPbI7E/vL8YZ6PCYFxK33c/J9taHJ8rSY=;
        b=AOVkvsl/EaATVrzvHqzOeUjhaf8iitGNtaGGBE+XnU/x93TAtiUA/GP2mlHKyQTGho
         NE4GJYOQENK70Xoxge/XdK3NAX8XiTWUjP0WmDWLCEpboKgtuFLuVWFYNZoxwXv4Dwlm
         hC+6lGTl7m9oOGoZ1lcdyGGDTdJTBWQPmjxqHE/VDMsTqiP1F7LVM7cqFCYwEh3oWUom
         upJp670f65BC5Crq4nkgDasXw0GislJYL3rWJieGldUv+MqvjHgr7CS3KartmwFrY0bX
         7POPCynQ4vu3/+TXWqnSmkQABghIE3u3mKfiG8sTcObK1gKl3HSIfQz5oL9R9uBS/2uU
         rzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MYV2gzft/kwPbI7E/vL8YZ6PCYFxK33c/J9taHJ8rSY=;
        b=FaBTTIc8JziMO8OZAVbMPzJWY4mq8AN/P7g1KoUdnXyRhbV09gRhmynlXjsL2bIZUp
         fSk501Fzati4cPLGKGPhRUehgU2K5Lx1iXIpIH4AjHQ7e3iSMkfpRVYW9Xw97uz118zS
         GsGV7fl2DnZ7Z1Xfayqigg7ngbb89cpZd04HwZWo9jGNNNBiiOrevnROLpNQtiKQOI/O
         mZ/5Jn7e6Dm+HfPjAGeir5Egc9pNHbEorsQ307tn9C7giu7HADM5K4TxYk111SnJ8yZz
         7F4CnwZu4W4j0YovwB0EI7u07drbl78/On/eIKu7NPtZt/Eg7q9uumSWInXNXu2pGpfh
         HN5A==
X-Gm-Message-State: APjAAAXIWhDb1cEo17ZdlKb589FThmrUh+NYwFYHmKpT1fJLHAScwbyX
        y7j85QWrfOrdsG1/Iu1Md0g=
X-Google-Smtp-Source: APXvYqzwdSZgkOpG7eIInqGVHjDhv0J9LWuyZq17RAxHCz843lxp1MIvZpB96VVvvcXodqGYATFX/w==
X-Received: by 2002:a2e:86c1:: with SMTP id n1mr5583479ljj.162.1559951320582;
        Fri, 07 Jun 2019 16:48:40 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id i2sm589629ljc.96.2019.06.07.16.48.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 16:48:39 -0700 (PDT)
Date:   Sat, 8 Jun 2019 02:48:37 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v3] i2c: mux/i801: Switch to use descriptor passing
Message-ID: <20190607234836.khzbchojo4gaqjrr@mobilestation>
References: <20190603220819.31701-1-linus.walleij@linaro.org>
 <e992bb50-cedc-74c0-cecd-8cac37ecaf69@axentia.se>
 <20190604224316.slrrlinhzngdan5o@mobilestation>
 <ee06c942-ad3d-b45b-f067-bbc988595733@axentia.se>
 <CACRpkdYybLgfnFRra6MmY0ckk+3nZcW-3dJtA=Ay8fPd0fcTAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYybLgfnFRra6MmY0ckk+3nZcW-3dJtA=Ay8fPd0fcTAA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Linus,

On Sat, Jun 08, 2019 at 12:55:27AM +0200, Linus Walleij wrote:
> On Wed, Jun 5, 2019 at 10:15 AM Peter Rosin <peda@axentia.se> wrote:
> > On 2019-06-05 00:43, Serge Semin wrote:
> 
> >  I
> > now have two "competing" pieces of work for the 5.3 merge window.
> 
> I had no idea about Serge's patch set, sorry for my ignorance and
> overload etc.
> 
> Serge, if I just rebase & fix this as soon as your stuff is upstream, can
> you test my patches?
> 

Thanks for response. As I said, as soon as your patch gets to be rebased on
top of my patchset (though we need to wait Peter to finish the review
of it) I'll gladly test it on my machine.

Regards,
-Segey

> > Which
> > of these works was sent first has little bearing on my ordering issues.
> > I you guys don't sort this out, I will go whichever way I find more
> > pleasing.
> 
> I'm fine if you apply Serge's patch set first, I can just look over the
> result afterwards and see what remains to fix. My only goal is
> really to get rid of all <linux/gpio.h> from the kernel in favor of
> using the consumer and machine APIs.
> 
> Yours,
> Linus Walleij
