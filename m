Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57FAF1A446F
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Apr 2020 11:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgDJJ3R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Apr 2020 05:29:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:33518 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725861AbgDJJ3R (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 10 Apr 2020 05:29:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 6216FAF8F;
        Fri, 10 Apr 2020 09:29:15 +0000 (UTC)
Date:   Fri, 10 Apr 2020 11:29:14 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>, linux-i2c@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: Re: [PATCH] i2c: avoid ifdeffery in I2C drivers with optional slave
 support
Message-ID: <20200410112914.67a68e32@endymion>
In-Reply-To: <20200409134027.GB1136@ninjato>
References: <20191204095348.9192-1-s.hauer@pengutronix.de>
        <20200409134027.GB1136@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram, Sascha,

On Thu, 9 Apr 2020 15:40:27 +0200, Wolfram Sang wrote:
> On Wed, Dec 04, 2019 at 10:53:48AM +0100, Sascha Hauer wrote:
> > Always add the (un)reg_slave hooks to struct i2c_algorithm, even when
> > I2C slave support is disabled. With the cost of some binary space I2C
> > drivers with optional I2C slave support no longer have to #ifdef
> > the hooks. For the same reason add a stub for i2c_slave_event and make
> > enum i2c_slave_event present without I2C slave support.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>  
> 
> This kind of reverts d5fd120e7860 ("i2c: Only include slave support if
> selected"), so adding Jean here for more discussion.

That commit made sense then as there was only exactly 1 kernel driver
needing this. This might be revisited when more drivers need it.

That being said, as far as I can see only 8 drivers need it today, which
isn't that many, and more importantly, several architectures will
typically not include support for any of them (i386, x86_64 and s390x
for example).

> I don't mind the additional bytes used in i2c_algorithm, so I am in
> favor of this approach.

I find it questionable to increase the memory footprint on all x86_64
systems out there for a feature they do not need. Sure it's only 16
bytes in one structure, but if every subsystem does the same on a
regular basis, it adds up.

More importantly I can't see how the ifdef'd members of struct
i2c_algorithm are the cause of the problem mentioned by Sascha. He
seems to be concerned by drivers with *optional* I2C slave support
having ifdefs. Why can't this be solved in these drivers directly? What
prevents these drivers from unconditionally selecting I2C_SLAVE if that
makes their code more simple? This moves the overhead decision to the
device driver instead of forcing it to the whole subsystem across all
architectures.

-- 
Jean Delvare
SUSE L3 Support
