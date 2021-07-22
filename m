Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF643D1DF7
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Jul 2021 08:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhGVF0G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Jul 2021 01:26:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:55810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229502AbhGVF0G (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 22 Jul 2021 01:26:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB3AF6120C;
        Thu, 22 Jul 2021 06:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626934001;
        bh=p/2Uc5VBVsF31pzvmQeIG0ihbNJEza0BqK/3Fxmnvgo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RKmYbK8pUIX0h9+BRZAG4KNlffU0luYQLtgeTrDMnOHoi2hw3f007IKGescfM/T12
         3vKvJFOcJYlAW0LZ2OMaysmQ0nnyqSsWT51GEXzmR0kpUK3c2Z7GNpRfHT/p6Gj/ks
         CgMYSUQSeKtpEAV7Q0r4m1voLhLzGWbqL+tls0OM=
Date:   Thu, 22 Jul 2021 08:06:37 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jie Deng <jie.deng@intel.com>, wsa@kernel.org,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com,
        mst@redhat.com, arnd@arndb.de, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, yu1.wang@intel.com,
        shuo.a.liu@intel.com, conghui.chen@intel.com, stefanha@redhat.com
Subject: Re: [PATCH v14] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YPkK7RlufYj1b+2f@kroah.com>
References: <984ebecaf697058eb73389ed14ead9dd6d38fb53.1625796246.git.jie.deng@intel.com>
 <20210722051433.3f2ix75wbi5pphp2@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722051433.3f2ix75wbi5pphp2@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jul 22, 2021 at 10:44:33AM +0530, Viresh Kumar wrote:
> On 09-07-21, 10:25, Jie Deng wrote:
> > Add an I2C bus driver for virtio para-virtualization.
> > 
> > The controller can be emulated by the backend driver in
> > any device model software by following the virtio protocol.
> > 
> > The device specification can be found on
> > https://lists.oasis-open.org/archives/virtio-comment/202101/msg00008.html.
> > 
> > By following the specification, people may implement different
> > backend drivers to emulate different controllers according to
> > their needs.
> > 
> > Co-developed-by: Conghui Chen <conghui.chen@intel.com>
> > Signed-off-by: Conghui Chen <conghui.chen@intel.com>
> > Signed-off-by: Jie Deng <jie.deng@intel.com>
> > ---
> > Changes v13 -> v14
> > 	- Put the headers in virtio_i2c.h in alphabetical order.
> > 	- Dropped I2C_FUNC_SMBUS_QUICK support.
> > 	- Dropped few unnecessary variables and checks.
> > 	- Use "num" everywhere instead of num or nr, to be consistent.
> > 	- Added few comments which make the design more clear. 
> 
> Wolfram,
> 
> Is it still possible to queue this for 5.14 ?

No new features are allowed for 5.14, you know this.  It's but fixes
only now.

thanks,

greg k-h
