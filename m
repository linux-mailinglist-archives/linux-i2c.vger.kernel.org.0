Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C821343FBDE
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Oct 2021 13:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbhJ2L5Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Oct 2021 07:57:16 -0400
Received: from smtp1.axis.com ([195.60.68.17]:36480 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230492AbhJ2L5Q (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 Oct 2021 07:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635508487;
  x=1667044487;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WG5PX38DAgJ27VX4xJTi1uDJ28hysrGjkPPeLNkkKKE=;
  b=kZv0agtRc6d8anqfXhH4o0B+3KOVnX9UzRXSBZvpLUjp5mFbNs/aMe47
   FpVxvAZ4J1uweAMqr1CCPRIrcjddT5awuBAJ2X2ckg+tH9HShv8Tw7HBY
   8SiEHA9Ju7zvXppaDhyrOduqoiY/FJPxnyVUpImUeulcld+KRyaLKmeK4
   M3bX3Fzj9Toq3b53II/dhHFEO7YtJVFF5qeP1Wh6+XQWbkJ5hvMEa5pq3
   4kiGx9OaxS5ALGveoo4keBaReXukKESC9E0ANh/ZSbUe/TsCJoV0T6yQ5
   KYG9394dRmUWTYzVFGihGYyPkbVEPXHh81Afiw8239TNJZpQ+LsDavQOw
   g==;
Date:   Fri, 29 Oct 2021 13:54:46 +0200
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
CC:     Jie Deng <jie.deng@intel.com>, "wsa@kernel.org" <wsa@kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH 2/2] i2c: virtio: fix completion handling
Message-ID: <20211029115446.GA24060@axis.com>
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-3-vincent.whitchurch@axis.com>
 <20211019082211.ngkkkxlfcrsvfaxg@vireshk-i7>
 <81ea2661-20f8-8836-5311-7f2ed4a1781f@intel.com>
 <20211020091721.7kcihpevzf7h4d62@vireshk-i7>
 <20211020103849.GA9985@axis.com>
 <20211020104709.k6oqo2gmegiwfre4@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211020104709.k6oqo2gmegiwfre4@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 20, 2021 at 12:47:09PM +0200, Viresh Kumar wrote:
> On 20-10-21, 12:38, Vincent Whitchurch wrote:
> > I don't quite understand how that would be safe since
> > virtqueue_add_sgs() can fail after a few iterations and all queued
> > request buffers can have FAIL_NEXT set.  In such a case, we would end up
> > waiting forever with your proposed change, wouldn't we?
> 
> Good point. I didn't think of that earlier.
> 
> I think a good simple way of handling this is counting the number of
> buffers sent and received. Once they match, we are done. That
> shouldn't break anything else I believe.

That could work, but it's not so straightforward since you would have to
introduce locking to prevent races since the final count is only known
after virtio_i2c_prepare_reqs() completes, while the callback could be
called before that.  Please do not hesitate to send out a patch to fix
it that way if that is what you prefer.
