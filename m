Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E193B170DC9
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2020 02:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbgB0BYC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Feb 2020 20:24:02 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44631 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727964AbgB0BYC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Feb 2020 20:24:02 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48SZgy2Mknz9sPK;
        Thu, 27 Feb 2020 12:23:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1582766640;
        bh=ICKPxzO9BqqJCVG6Gu46DTjkkmB7acV1gCLgWsJ9g0A=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VCVWhoqSjYQGm2w8skc37LmZ5O7VoEaNHMdXiLJO4cgw8EIYvcQFNW3QwBA/dyYb/
         A8yvVC1S28Io0S7y64BaTjuAC8rA485sMmeEyhEXG4m4CJlp3v8JYknpJFGeDtNdCg
         wOsDnEtdSvXhMQ/g5RLT2xhmr8ctEZ/9Lp7IN8tUsL9vBs/HdG2caCYieCHgR9ca3R
         cGsl27Gvmwb4CD4WVUHcBRGLYFDP4QTbr2T+se5Ln/PsZ5/pmWXXq/QrelUxKvb0Q6
         GqbUXq+xi5UN2YGfPhgQNQSpJJAshUqUF2FJPM614ldtCzqaOakmmRiN6vh4by0QAS
         hEALnU+yJNOdA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Wolfram Sang <wsa@the-dreams.de>, linuxppc-dev@lists.ozlabs.org
Cc:     linux-i2c@vger.kernel.org, debian-powerpc@lists.debian.org,
        Mathieu Malaterre <malat@debian.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH] macintosh: therm_windtunnel: fix regression when instantiating devices
In-Reply-To: <20200225141229.5424-1-wsa@the-dreams.de>
References: <20200225141229.5424-1-wsa@the-dreams.de>
Date:   Thu, 27 Feb 2020 12:23:57 +1100
Message-ID: <87imjsu8k2.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram Sang <wsa@the-dreams.de> writes:
> Removing attach_adapter from this driver caused a regression for at
> least some machines. Those machines had the sensors described in their
> DT, too, so they didn't need manual creation of the sensor devices. The
> old code worked, though, because manual creation came first. Creation of
> DT devices then failed later and caused error logs, but the sensors
> worked nonetheless because of the manually created devices.
>
> When removing attach_adaper, manual creation now comes later and loses
> the race. The sensor devices were already registered via DT, yet with
> another binding, so the driver could not be bound to it.
>
> This fix refactors the code to remove the race and only manually creates
> devices if there are no DT nodes present. Also, the DT binding is updated
> to match both, the DT and manually created devices. Because we don't
> know which device creation will be used at runtime, the code to start
> the kthread is moved to do_probe() which will be called by both methods.
>
> Fixes: 3e7bed52719d ("macintosh: therm_windtunnel: drop using attach_adapter")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=201723
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Tested-by: Erhard Furtner <erhard_f@mailbox.org>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> ---
>
> I suggest this stable-tag: # v4.19+

Looks right to me.

> Adding the Debian-PPC List to reach further people maybe willing to
> test.
>
> This patch does not depend on "[PATCH RESEND] macintosh: convert to
> i2c_new_scanned_device". In fact, this one here should go in first as
> 5.6 material. I will rebase and resend the i2c_new_scanned_device()
> conversion on top of this regression fix.
>
> I can also take this via I2C if easier.

I think that would be best, it's more I2C related than powerpc arch
stuff that I could review.

I don't have a machine setup to test this easily, but Erhard has been
doing a good job of testing things so I'm happy for you to take it with
his Tested-by.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
