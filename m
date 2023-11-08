Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2ED27E60ED
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 00:17:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjKHXRi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 18:17:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbjKHXRh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 18:17:37 -0500
X-Greylist: delayed 1623 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 08 Nov 2023 15:17:35 PST
Received: from stcim.de (stcim.de [IPv6:2a01:4f8:151:40c4::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7518525AE
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 15:17:35 -0800 (PST)
Received: from xdsl-89-0-36-30.nc.de ([89.0.36.30] helo=porty)
        by stcim with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <stefan@lengfeld.xyz>)
        id 1r0rNV-0006GR-Ae; Wed, 08 Nov 2023 23:50:29 +0100
Date:   Wed, 8 Nov 2023 23:50:28 +0100
From:   Stefan Lengfeld <stefan@lengfeld.xyz>
To:     Chris Green <chris@isbd.co.uk>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: A question about the mutex (or not) in the kernel's I2C handling
Message-ID: <20231108225028.k426cvitpvbcnuyj@porty>
References: <ZUeRO9txnxdImAJG@esprimo>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZUeRO9txnxdImAJG@esprimo>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

On Sun, Nov 05, 2023 at 12:57:31PM +0000, Chris Green wrote:
> Is it safe to allow multiple processes to read and write various
> devices on the I2C bus?  This may be either different processes
> accessing the same device or different processes accessing different
> devices on the I2C bus.

Yes, it's save. Different processes and different in kernel users like
drivers can access the I2C bus at the same time. The I2C transfers will
not interfere with each other. They are serialized by the kernel and
execute one after another.

> I.e. is there a mutex (or equivalent code) in the Linux Kernel I2C
> drivers that guarantees completion of one process's I2C transaction
> before another one starts?

Yes, exactly. The mutex is called 'bus_lock' and can be found here:

    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/i2c.h?h=v6.6&id=ffc253263a1375a65fa6c9f62a893e9767fbebfa#n727

And here the adapter/bus is locked before a transfer starts:

    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/i2c-core-base.c?h=v6.6&id=ffc253263a1375a65fa6c9f62a893e9767fbebfa#n2279

> The information I have managed to find suggests that there is such a
> mutex and that I don't need to make sure my processes don't try to
> read/write the I2C bus simultaneously but I can't find a definitive
> statement to this effect.

So as the I2C bus is concerned, everything is safe. The I2C read/writes
are serialized. But logically there maybe issues. E.g. if two processes
or driver writes to the same I2C register of the same device at the same
time. You will not know which transfer was the last one. So you don't
know which write has won.

So you can have race conditions on a logical level.

Kind regards,
Stefan
