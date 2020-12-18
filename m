Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 710BC2DEB4A
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Dec 2020 22:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgLRVuD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Dec 2020 16:50:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725982AbgLRVuC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Dec 2020 16:50:02 -0500
X-Greylist: delayed 562 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 18 Dec 2020 13:49:22 PST
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6611CC0617A7
        for <linux-i2c@vger.kernel.org>; Fri, 18 Dec 2020 13:49:22 -0800 (PST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20:1c66:ab2d:5a3:5a9e])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 83B2D806F6;
        Fri, 18 Dec 2020 13:39:58 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net 83B2D806F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1608327599;
        bh=7KDDxCCO+v3IMSIe1/eQbnfr4znZ5/RhUgO2QP29+Lw=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=Y2xXOPH70HPeqCRf7VyS9Yz2NbZb37qE04ft2L2T9T+jNtqOY4WS5kii82B1RkIK8
         JkaT0oZyTquQbjgA1fr2LhtFMeb/Sj9oxubkEsbGBA380Sw8m/mDiQB/0FPmysnMBm
         PK4GEhHllhwlueZPV5bEoyf5L2u8seUeI/0vB+qo=
Date:   Fri, 18 Dec 2020 15:39:52 -0600
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: aspeed: disable additional device addresses on
 ast2[56]xx
Message-ID: <20201218213952.refmqjlxdclsquzg@hatter.bewilderbeest.net>
References: <20200915184525.29665-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200915184525.29665-1-zev@bewilderbeest.net>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 15, 2020 at 01:45:25PM CDT, Zev Weiss wrote:
>The ast25xx and ast26xx have, respectively, two and three configurable
>slave device addresses to the ast24xx's one.  We only support using
>one at a time, but the others may come up in an indeterminate state
>depending on hardware/bootloader behavior, so we need to make sure we
>disable them so as to avoid ending up with phantom devices on the bus.
>
>Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>---
> drivers/i2c/busses/i2c-aspeed.c | 50 +++++++++++++++++++++++++++------
> 1 file changed, 41 insertions(+), 9 deletions(-)
>
> <snip>

Ping...any thoughts on this patch?


Thanks,
Zev

