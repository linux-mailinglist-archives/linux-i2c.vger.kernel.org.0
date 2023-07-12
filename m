Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 801A87512C7
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jul 2023 23:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbjGLVxu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jul 2023 17:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbjGLVxt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jul 2023 17:53:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4171BD7;
        Wed, 12 Jul 2023 14:53:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2343D6195B;
        Wed, 12 Jul 2023 21:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B34C433C7;
        Wed, 12 Jul 2023 21:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689198827;
        bh=XfEZtO4x5pjTuWKJqkqcrnOAGl6wGqZ56Buai05O87A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ipQ2BPsWUsa9nMxff1MAQ6B8bIQA8PB00XqDByBmKQ5HGOsBlJqqaSDXlT6Uh7YGT
         1TSbAxMLeza6WAbg3kWPnr1QkbiqKPvs/XDJMvJggalKjt+EIFyOKGoW9NJmH+3kFb
         JucEatgNQCZASh/XaQl6HWVWqCIR8XRB/u/PS4X3yGZKBDvrAMjOo0oEZ19CWGPqhb
         9dY5hKMPcizQw1ilto6LBfYUr/Rw8uRoBGSwJijIMQCq3CSKdsa46PCDeDFibrBIQ9
         XgmYonnDN6ePwJKOwq0ajGY+rvQcMCmBa3OevzMFxFgKPikuhvpSgFochQQSWVhYWk
         OHbINZjOSx68Q==
Date:   Wed, 12 Jul 2023 23:53:43 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Minjie Du <duminjie@vivo.com>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org, opensource.kernel@vivo.com,
        LKML <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [v2] i2c: busses: fix parameter check in
 i2c_gpio_fault_injector_init()
Message-ID: <20230712215343.57yhhk5kajtsfaax@intel.intel>
References: <20230712150219.pla7unac7e7azwti@intel.intel>
 <1e809b1e-16ec-3e2c-1ced-f50a78811131@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e809b1e-16ec-3e2c-1ced-f50a78811131@web.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Markus,

On Wed, Jul 12, 2023 at 08:30:11PM +0200, Markus Elfring wrote:
> > > v1-v2:
> > > Fix judge typo.
> >
> > Please next time add the changelog after the "---" section.
> >
> > You will also need:
> >
> > Fixes: 14911c6f48ec ("i2c: gpio: add fault injector")
> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Cc: <stable@vger.kernel.org> # v4.16+
> >
> > Said that:
> >
> > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> 
> * How appropriate is your presentation of this tag “in advance”?
 
1. These are all things that can be fixed before pushing the
   patch. I Wouldn't feel like asking to resend for a Fixes tag
   and few minor adjustments in the commit log, because:

   1a. it's spam in the mailing list
   1b. it annoys the person who sent the fix and demotivates him
       to send more fixes

   but more important:

   1c. I learned that tools like b4 are able to take the Fixes:
       tag even afterwards. I had this same discussion just
       today[*].

2. This is quite a common practice in other communities. However,
   with Wolfram we agreed that I wouldn't r-b "in advance" after
   asking minor fixes in the patch (but not in the commit log).

> * Would you like to take another look at the properties for
>   the reviewer's statement of oversight?
> 
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.5-rc1#n542
> 
> 
> Would a subject like “[PATCH v3] i2c: gpio: Fix an error check in i2c_gpio_fault_injector_init()”
> be more appropriate?

Every community has its own rules. I met both the approaches,
that's why I wouldn't be so strict. I'm sure Minjie will be able
to fix those mistakes in the future.

Said that... Minjie, do you mind sending a v3 with the commit log
fixed and all the proper tags and make everyone happy? :)

Andi

[*] https://lore.kernel.org/all/32ca3740-901c-47f2-81ab-c51e8751eefe@sirena.org.uk/
