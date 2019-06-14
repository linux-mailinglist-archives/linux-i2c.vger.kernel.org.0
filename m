Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B44C46C29
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 23:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfFNV6u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 17:58:50 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34255 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfFNV6u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jun 2019 17:58:50 -0400
Received: by mail-lf1-f67.google.com with SMTP id y198so2718302lfa.1;
        Fri, 14 Jun 2019 14:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xxGu6CJPBGoL/dbTAjrQA1DoihdFeXBSa3YpyIkyJT4=;
        b=h6yLi+nhVF/VAdQ2zqX0arqlj6tyh5yrcySN5HknKhZGOjEwiBkWZX7NjCZOM7u2Ef
         vNM1tmEH2VbvyWGZIGWFfFqBub9pCX/6kbzZiwM9aljPNqYXZ+4Upm88MSfPClpGzLZC
         g66sNiWkUFURPlBiUE3YX7HuOT7FSsPDJgsZSpBFl43MU3ajJpqHzXOfWL1ZOlq8Gn3O
         3MMQJa1veRx0jllCTLHIp725Of1XMU/3lpmYWDwb1foYK+VgvfpITd/PmbQJrrNe3aha
         eH4tu8XOw+FDPmRfgwsCcMWEzxlyuITvDpksfnxsko0EhBr+XBwx3TSWpM5ilFpb3q//
         ljng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xxGu6CJPBGoL/dbTAjrQA1DoihdFeXBSa3YpyIkyJT4=;
        b=OndJXZyAifzBV9zIEbnKYvhU9BphoQ9kNTg5tGOnK1/YtQnLNuOIT6IgQwL9s535tI
         O+d/99wCHwUCBTnTddtAcaVOJ/pkfaF8LbrbgCLmfzkVyfEBl+YJ5KuVFXn7b8eD0uRQ
         wbmEeL6bz2LmD9Z47gqYgc4+qDk56fQ+5ykcgDKd5pVGc/Z9fJ4LGlbCdKPMjPdTRSd5
         FL0G8+WR17cSh/vMpNHCw3KFIeq80YcnsT/7zsTlVIOR6SI3gc8J7zYeEcx/oTDSpbhs
         yydQZ14UvjewPCMAvZZplSdj5RetwTC2b3TZMAySE4k7jZMMVgfF3PSSw2T2QCi44V+r
         BaDA==
X-Gm-Message-State: APjAAAVFChBB7iMcdE4upZvS+dbKE7WMLfl2jICSylvY8I4+ldInulma
        lhuXL2DxYUb6fkzGCOgOO38=
X-Google-Smtp-Source: APXvYqxxKspRlwzxhtlUC/Niqid8Giv0llcz0pjr2zBnppSAIQcNaASJpkWDWB/Y/gL9p6D3mm3TIw==
X-Received: by 2002:ac2:5467:: with SMTP id e7mr25581014lfn.23.1560549527979;
        Fri, 14 Jun 2019 14:58:47 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id t7sm781898ljd.5.2019.06.14.14.58.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 14:58:47 -0700 (PDT)
Date:   Sat, 15 Jun 2019 00:58:45 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Peter Korsgaard <peter.korsgaard@barco.com>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] i2c-mux-gpio: Unpin the platform-specific GPIOs
 request code
Message-ID: <20190614215844.2ueoqadvj5dqbaua@mobilestation>
References: <20190425232028.9333-1-fancer.lancer@gmail.com>
 <20190425232028.9333-3-fancer.lancer@gmail.com>
 <783250dd-87c0-b3cc-0e90-7978605a9b07@axentia.se>
 <20190614163134.zs5xyuqvp25ahbng@mobilestation>
 <fb96ba56-4754-a962-ceea-4fd50ee59c69@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb96ba56-4754-a962-ceea-4fd50ee59c69@axentia.se>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 14, 2019 at 06:04:33PM +0000, Peter Rosin wrote:
> On 2019-06-14 18:31, Serge Semin wrote:
> > Hello Peter,
> > 
> > On Sun, Jun 09, 2019 at 09:34:54PM +0000, Peter Rosin wrote:
> >> On 2019-04-26 01:20, Serge Semin wrote:
> >>> The GPIOs request loop can be safely moved to a separate function.
> >>> First of all it shall improve the code readability. Secondly the
> >>> initialization loop at this point is used for both of- and
> >>> platform_data-based initialization paths, but it will be changed in
> >>> the next patch, so by isolating the code we'll simplify the future
> >>> work.
> >>
> >> This patch is just preparatory for patch 3/3, as I see it. And since
> >> I'm not really fond of the end result after patch 3/3, I'm going to
> >> sum up my issues here, instead of trying do it piecemeal in the two
> >> patches.
> >>
> >> Linus and Jean, for your convenience, link to this patch series [1].
> >>
> >> While I agree with the goal (to use the more flexible gpiod functions
> >> to get at the gpio descriptors), the cost is too high when the init
> >> code for platform and OF is basically completely separated. I much
> >> prefer the approach taken by Linus [2], which instead converts the
> >> platform interface and its single user to use gpio descriptors instead
> >> of the legacy gpio interface. The i2c-mux-gpio code then has the
> >> potential to take a unified approach to the given gpio descriptors,
> >> wherever they are originating from, which is much nicer than the
> >> code-fork in this series.
> >>
> >> I also think it is pretty pointless to first split the code into
> >> platform and OF paths, just so that the next patch (from Linus) can
> >> unify the two paths again. I'd like to skip the intermediate step.
> >>
> >> So, I'm hoping for the following to happen.
> >> 1. Sergey sends a revised patch for patch 1/3.
> >> 2. I put the patch on the for-next branch.
> >> 3. Linus rebases his patch on top of that (while thinking about
> >>    the questions raised by Sergey).
> >> 4. Sergey tests the result, I and Jean review it, then possibly
> >>    go back to 3.
> >> 5. I put the patch on the for-next branch.
> >>
> >> Is that ok? Or is someone insisting that we take a detour?
> >>
> > 
> > The series was intended to add the gpiod support to the i2c-mux-gpio driver
> > (see the cover letter of the series). So the last patch is the most valuable
> > one. Without it the whole series is nothing but a small readability improvement.
> > So it is pointless to merge the first patch only.
> 
> Agreed on all points, except perhaps for the "refuse" part below and
> that the readability improvement of patch 1/3 is perhaps not all that
> pointless.
> 
> > Anyway since you refuse to add the last patch and the first patch is actually
> > pointless without the rest of the series, and I would have to spend my time to
> > resubmit the v3 of the first patch anyway, it was much easier to test the
> > current version of the Linus' patch and make it working for OF-based platforms.
> > Additionally the Linus' patch also reaches the main goal of this patchset.
> 
> I'm very pleased that you do not feel totally put off, and are willing
> to help even if we end up storing your series in /dev/null. Kudos!
> 
> > I don't know what would be the appropriate way to send the updated version of
> > the Linus' patch. So I just attached the v4 of it to this email. Shall I better
> > send it in reply to the Linus' patch series?
> 
> I get the impression that you have already done the work? In that case,
> how I would proceed would depend on how big the difference is. If it's
> just a few one-liners here and there, I think I would make a detailed
> review comment so that it is easy for Linus to incorporate the needed
> changes. If it's anything even remotely complex I would post an
> incremental patch. Of course, the former does not exclude the latter,
> but I do think an incremental patch is better than a repost.
> 

Yes, I tested the Linus' patch on my OF-based platform (though had to port to
kernel 4.9) and found two problems. The incremental patch, which fixes them is
send to you with mailing lists and everyone involved being Cc'ed.

Regards,
-Sergey

> Thanks again!
> 
> Cheers,
> Peter
