Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 719E4433485
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 13:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235379AbhJSLTE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Oct 2021 07:19:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:52770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235370AbhJSLTD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Oct 2021 07:19:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 790AF6128B;
        Tue, 19 Oct 2021 11:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634642211;
        bh=zowoZA2DNh4UwkN2v6Xd3q8lGJcDY+Iha2h2tBForeA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yj6I2acSnV7xWPZ/fC3LkxRxWyygbqXfz1qRVSydcPPlMI9fO/W8abjJAuGJIjBMz
         wQNHWiV28UR+80KR3//XNGg5nj2AyR8gLF4xr69/BPb+e/JaGrQdtXSVZUFDAzzLbb
         gzgAIWwBgxIPcuP/6xkA5EYLifKBaT/enpUvNGvI=
Date:   Tue, 19 Oct 2021 13:16:46 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Vincent Whitchurch <vincent.whitchurch@axis.com>, wsa@kernel.org,
        jie.deng@intel.com, virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Message-ID: <YW6pHkXOPvtidtwS@kroah.com>
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-2-vincent.whitchurch@axis.com>
 <20211019080913.oajrvr2msz5enzvz@vireshk-i7>
 <YW6Rj/T6dWfMf7lU@kroah.com>
 <20211019094203.3kjzch7ipbdv7peg@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019094203.3kjzch7ipbdv7peg@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 19, 2021 at 03:12:03PM +0530, Viresh Kumar wrote:
> On 19-10-21, 11:36, Greg KH wrote:
> > What is the "other side" here?  Is it something that you trust or not?
> 
> Other side can be a remote processor (for remoteproc over virtio or
> something similar), or traditionally it can be host OS or host
> firmware providing virtualisation to a Guest running Linux (this
> driver). Or something else..
> 
> I would incline towards "we trust the other side" here.

That's in contradition with what other people seem to think the virtio
drivers are for, see this crazy thread for details about that:
	https://lore.kernel.org/all/20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com/

You can "trust" the hardware, but also handle things when hardware is
broken, which is most often the case in the real world.

So why is having a timeout a problem here?  If you have an overloaded
system, you want things to time out so that you can start to recover.

> > Usually we trust the hardware, but if you do not trust the hardware,
> > then yes, you need to have a timeout here.
> 
> The other side is the software that has access to the _Real_ hardware,
> and so we should trust it. So we can have a actually have a completion
> without timeout here, interesting.

And if that hardware stops working?  Timeouts are good to have, why not
just bump it up a bit if you are running into it in a real-world
situation?

thanks,

greg k-h
