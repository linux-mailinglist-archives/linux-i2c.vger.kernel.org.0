Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AFE53F8998
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Aug 2021 16:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242759AbhHZOBP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Aug 2021 10:01:15 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:57940 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242728AbhHZOBO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Aug 2021 10:01:14 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 3C9C7201AC;
        Thu, 26 Aug 2021 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1629986425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/h8PkSjbUDJS5w1Q6oQNprNbnt4Sp8gzPq+0Y/jTKp8=;
        b=njI8qzR0q1OaiXknXovrgMXT3o+K17DEv1+eFoyxDejzlnpL7LDXqfy3yaBOj1vCYRBfQr
        swF5P8qUpdycvatyvPk0loyFZfSU0F+seibP+3lhuzbXSe+28raWsGj5Xvfia98V0kOWc5
        95MRQeWxmU9MU14c8v7er2cOlE4yR4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1629986425;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/h8PkSjbUDJS5w1Q6oQNprNbnt4Sp8gzPq+0Y/jTKp8=;
        b=sY1fjNZn2PhFLl/ozfaTM7FXPl+Jdnhrrao64yhlcxky1N082yhWeeR6vhieiQ2J16mcwi
        eUth2QVUux/C/1Dg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id CCCED13659;
        Thu, 26 Aug 2021 14:00:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id vgJrL3ieJ2E6WgAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Thu, 26 Aug 2021 14:00:24 +0000
Date:   Thu, 26 Aug 2021 16:00:21 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 1/9] i2c: i801: Improve disabling runtime pm
Message-ID: <20210826160021.67b7ed92@endymion>
In-Reply-To: <YRwY/q2y3eIjc/nr@kunai>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
        <10690555-2317-4916-70b8-870708858f9b@gmail.com>
        <YRPvtPid3EeMylSr@smile.fi.intel.com>
        <3f225422-b343-eaef-0a95-9d15a5a378f2@gmail.com>
        <YRTubuupevq0JMbW@smile.fi.intel.com>
        <YRwY/q2y3eIjc/nr@kunai>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Tue, 17 Aug 2021 22:15:58 +0200, Wolfram Sang wrote:
> > > > I dunno if it's being discussed, but with this you effectively allow user to
> > > > override the setting. It may screw things up AFAIU the comment above.
> > >
> > > No, this hasn't been discussed. At least not now. Thanks for the hint.
> > > This attribute is writable for the root user, so we could argue that
> > > the root user has several options to break the system anyway.  

This is something we hear frequently when people don't want to address
problems in their code, but that's not enough to convince me ;-)

> > But it will mean the side effect on this driver and typical (root-run) system
> > application (systemd like?) should care now the knowledge about this
> > side-effect. I do not think it is desired behaviour. But I'm not a maintainer
> > and I commented here just to make everybody understand the consequences of the
> > change.  

Is systemd going to actually make any change to that attribute? I'm no
systemd expert, but I can't see any option in the configuration files
that would be related to autosuspend.

> Jean, are you still fine with this patch then?

My original position was that there are a few other drivers already
doing "this". It's not like we are doing something completely new and
using an API in a way it had never been used before, so it can't be
that bad.

On the other hand, after taking a closer look, I'm not fully certain
that "this" is exactly the same in all these drivers. For example, in
blk-pm.c, pm_runtime_set_autosuspend_delay() is being called with value
-1 initially, but with the idea that someone else (device driver, user)
may set a positive value later. It's not a permanent disable. The
8250_omap driver, however, seems to match the i2c-i801 driver here (I
say "seems" because honestly I'm not sure I fully understand the
comments there, but my understanding is that at least in some
situations, enabling autosuspend later would cause problems).

That being said, it starts looking like a problem for the PM subsystem
maintainers. Basically Heiner is trying to move away from an API which
requires cleaning up on driver removal. This is definitely the
direction we are collectively taking for years now (the whole devm_*
family of functions is about exactly that). So it's considered a good
thing.

If pm_runtime_set_autosuspend_delay() is not suitable for the task then
maybe we need a better API. I will admit I'm at a loss when it comes to
the many pm_runtime_* calls, I'm not going to claim I fully understand
what each of them is doing exactly. But don't we want to simply call
pm_runtime_dont_use_autosuspend() here?

If not and there's no suitable API for the task at the moment, then
better do not apply this patch, and instead ask the PM subsystem
maintainers if they would be willing to implement what we need.

-- 
Jean Delvare
SUSE L3 Support
