Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4E1217F59B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 12:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgCJLEm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 07:04:42 -0400
Received: from ozlabs.org ([203.11.71.1]:48981 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726202AbgCJLEl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 07:04:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48cC0M5QPwz9sQx;
        Tue, 10 Mar 2020 22:04:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1583838279;
        bh=9olihnyJ9M44PKnq28KcPbYYogv3DH93xRCS2PT0tFk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=DFPUeF3q1+xx/iAP21Mb6aBdyFZ0VQFHfaselndP8UP4Mk7+vfhbG/8it1/tdvmg6
         8/cCkdrJdLVPMcIyUQk0p6qKS8z5/9Mo/IvYlJyDWRxa5O1DyFnRv0f9GKic7PyMKE
         QxLNv9XlpzH4m0qr11rEMBNssOUL3j1qzsPRoahcKf33Re5kXXEztTg+eysqEU8+iL
         jxiBUCNlJw3tm9ML60UvzJaENGzfssLqpQNMxES5vcvPSvLzSgUZhVxU2b25n/SfUS
         62k4GyaCra5SFQYixKIbELcWkgdvkAr8Ai3UlntXSlOIvY6GNOTJbwWMLlu1743LQH
         fcuodpshZ9CgA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Wolfram Sang <wsa@the-dreams.de>, linuxppc-dev@lists.ozlabs.org
Cc:     linux-i2c@vger.kernel.org, debian-powerpc@lists.debian.org,
        Mathieu Malaterre <malat@debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Wolfram Sang <wsa@the-dreams.de>,
        Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH] macintosh: windfarm: fix MODINFO regression
In-Reply-To: <20200303125046.5157-1-wsa@the-dreams.de>
References: <20200303125046.5157-1-wsa@the-dreams.de>
Date:   Tue, 10 Mar 2020 22:04:25 +1100
Message-ID: <87zhcoii86.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram Sang <wsa@the-dreams.de> writes:

> Commit af503716ac14 made sure OF devices get an OF style modalias with
> I2C events. It assumed all in-tree users were converted, yet it missed
> some Macintosh drivers.
>
> Add an OF module device table for all windfarm drivers to make them
> automatically load again.
>
> Fixes: af503716ac14 ("i2c: core: report OF style module alias for devices registered via OF")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=199471
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Tested-by: Erhard Furtner <erhard_f@mailbox.org>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> ---
>
> This should also help with this: https://lists.debian.org/debian-powerpc/2020/01/msg00062.html
> Some more testing would be appreciated because lm75 also has some code
> changes I can't test myself obviusly.
>
> By grepping, I found some more potential candidates (using a "MAC,"
> prefix but not defining a OF MODULE DEVICE TABLE). Does someone know
> about bugreports filed for those? I don't want to change them for no
> reason:
>
> drivers/macintosh/ams/ams-i2c.c
> drivers/macintosh/therm_adt746x.c
> sound/aoa/codecs/onyx.c
> sound/aoa/codecs/tas.c
> sound/ppc/keywest.c
>
> Happy hacking,
>
>    Wolfram
>
>  drivers/macintosh/windfarm_ad7417_sensor.c  |  7 +++++++
>  drivers/macintosh/windfarm_fcu_controls.c   |  7 +++++++
>  drivers/macintosh/windfarm_lm75_sensor.c    | 16 +++++++++++++++-
>  drivers/macintosh/windfarm_lm87_sensor.c    |  7 +++++++
>  drivers/macintosh/windfarm_max6690_sensor.c |  7 +++++++
>  drivers/macintosh/windfarm_smu_sat.c        |  7 +++++++
>  6 files changed, 50 insertions(+), 1 deletion(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

