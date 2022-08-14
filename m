Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58883591E18
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Aug 2022 06:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbiHNEay (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Aug 2022 00:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiHNEay (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Aug 2022 00:30:54 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E134819282;
        Sat, 13 Aug 2022 21:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cmuEOBb5dbRHAC7PXZWV6QiRHrjQgW3rz2oIRTfXKEA=;
  b=JJhUiHHN+18mG4z2c36obGVUdZGZQhT4/obMaoJ68iIM8umq3zv3gCaR
   c/l2JxwZ/dYgGEIe9pvVe7qHtXza5vJl/x50/oCr03vWKTaWEXvMSrXHB
   4E5KxaXW8WpJtC/kyoUJtpg8ixdPW/Lkt3+G0ie7l7G7vTAaEdZTNRTDs
   U=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.93,236,1654552800"; 
   d="scan'208";a="48737315"
Received: from ip-153.net-89-2-7.rev.numericable.fr (HELO hadrien) ([89.2.7.153])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2022 06:30:49 +0200
Date:   Sun, 14 Aug 2022 06:30:48 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Wolfram Sang <wsa@kernel.org>
cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Julia Lawall <julia.lawall@inria.fr>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        cocci@systeme.lip6.fr
Subject: Re: [PULL REQUEST] i2c-for-5.20-part2
In-Reply-To: <YvhXzarjOLEJ8nsW@shikoro>
Message-ID: <alpine.DEB.2.22.394.2208140630320.3190@hadrien>
References: <YvfGY2qnl2YXrUgX@shikoro> <CAHk-=wjGmhaE-Y8GqWKPtWYOi=bOarFgo7UkzHNoOVEKnkXXrQ@mail.gmail.com> <YvhC5Orb+JeZFDEO@shikoro> <YvhXzarjOLEJ8nsW@shikoro>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On Sun, 14 Aug 2022, Wolfram Sang wrote:

> On Sun, Aug 14, 2022 at 02:33:40AM +0200, Wolfram Sang wrote:
> >
> > >  (b) auto-convert (with a coccinelle script) all the 'strlcpy()' users
> > > that don't care about the return value, and leave a few broken users
> > > of strlcpy around
> > >
> > > I think (b) is the simpler thing, but I have no idea how to write a
> > > coccinelle patch that basically does "if return value of strlcpy is
> > > not used, convert the strlcpy to a strscpy".
> >
> > That shouldn't be hard. I'll give it a try tomorrow.
>
> So, I tried right away and it was really as easy as expected:
>
> ===
> @@
> @@
> - strlcpy
> + strscpy
>   (...);
> ===
>
> The ';' at the end ensures that spatch only looks for complete
> statements not containing anything more than expressed.

This is correct.

julia

>
> I pushed out a branch for the testbots now:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/strlcpy
>
> Patch granularity might not be perfect currently, but for testing this
> should do.
>
> All the best,
>
>    Wolfram
>
>
