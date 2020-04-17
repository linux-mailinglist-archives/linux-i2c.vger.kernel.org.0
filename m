Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15AEB1ADEE8
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Apr 2020 16:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730775AbgDQOAR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Apr 2020 10:00:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:47962 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730563AbgDQOAR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 Apr 2020 10:00:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 354FBAE09;
        Fri, 17 Apr 2020 14:00:15 +0000 (UTC)
Date:   Fri, 17 Apr 2020 16:00:14 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: Re: [PATCH] i2c: avoid ifdeffery in I2C drivers with optional slave
 support
Message-ID: <20200417160014.5604a16a@endymion>
In-Reply-To: <20200415051619.GP27288@pengutronix.de>
References: <20191204095348.9192-1-s.hauer@pengutronix.de>
        <20200409134027.GB1136@ninjato>
        <20200410112914.67a68e32@endymion>
        <20200414115600.GM27288@pengutronix.de>
        <20200414164009.53e70067@endymion>
        <20200415051619.GP27288@pengutronix.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

One last thing I meant to mention but forgot...

On Wed, 15 Apr 2020 07:16:19 +0200, Sascha Hauer wrote:
> static int i2c_imx_reg_slave(struct i2c_client *client)
> {
> 	if (!IS_ENABLED(CONFIG_I2C_SLAVE))
> 		return -ESOMETHING;
> 	...
> }
> 
> The code is gone without CONFIG_I2C_SLAVE enabled, yet the compile coverage
> is there.

Compile coverage is nice but it comes at a cost. With the approach
above, the code will be built, then discarded. When the code is
#ifdef'd out, it isn't built at all. This means that your approach,
although it has advantages, increases the build time.

And don't tell me "you only build once", we live at the time of
continuous integration so we keep building kernels. As a support
engineer, I build kernels daily, and even though I have access to a
powerful build farm for that purpose, it still takes 30 to 60 minutes
to get my kernel built each time. Obviously most of that time isn't
spent on the i2c-imx driver ;-) but if every piece of code does the
same, build time will inevitably increase.

-- 
Jean Delvare
SUSE L3 Support
