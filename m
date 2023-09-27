Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2497B0D45
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 22:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjI0UVt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 16:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjI0UVt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 16:21:49 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A563310A
        for <linux-i2c@vger.kernel.org>; Wed, 27 Sep 2023 13:21:47 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id F05FC218E8;
        Wed, 27 Sep 2023 20:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695846105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nr8omtyvSHycnYndPTmzvp5oC8/0zVJ1UpJEJzN51k8=;
        b=cHWcJs2lWxCDqoeDLASBpkyH8mzV7HJgjIJlkdQbqjsbSA5ATG/zPiTtbdLvusiiZ2R0+C
        DDEYyBKVzNOLYWssl2wdGSDQBPqjMbtMfbU8d//1wxMEcTdzCEW/KksTGHmlvI2LWDtePF
        EXd228AaMez65dLNTBfJE5g0yhR3NIM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695846105;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nr8omtyvSHycnYndPTmzvp5oC8/0zVJ1UpJEJzN51k8=;
        b=8+22/vrPVMNmH/j/wVszgvrFPIB81Y08Q9M07pWYqjKY3O7gF7HPWMnWjZzee6GzCeSu73
        9aZuU8kaP1OA0aAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C4F9C13479;
        Wed, 27 Sep 2023 20:21:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id y7qaLdmOFGXDewAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 27 Sep 2023 20:21:45 +0000
Date:   Wed, 27 Sep 2023 22:21:44 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] i2c: Drop legacy muxing pseudo-drivers
Message-ID: <20230927222144.5ca56d97@endymion.delvare>
In-Reply-To: <ZRSGHm8t3ul/s07a@shikoro>
References: <20230926133725.5c3fb96e@endymion.delvare>
        <ZRSGHm8t3ul/s07a@shikoro>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 27 Sep 2023 21:44:30 +0200, Wolfram Sang wrote:
> On Tue, Sep 26, 2023 at 01:37:25PM +0200, Jean Delvare wrote:
> > The i2c-amd756-s4882 and i2c-nforce2-s4985 muxing pseudo-drivers were
> > written at a time when the i2c core did not support muxing. They are
> > essentially board-specific hacks. If we had to add support for these
> > boards today, we would implement it in a completely different way.
> > 
> > These Tyan server boards are 18 years old by now, so I very much doubt
> > any of these is still running today. So let's just drop this clumsy
> > code. If anyone really still needs this support and complains, I'll
> > rewrite it in a proper way on top of i2c-mux.
> > 
> > This also fixes the following warnings:
> > drivers/i2c/busses/i2c-amd756.c:286:20: warning: symbol 'amd756_smbus' was not declared. Should it be static?
> > drivers/i2c/busses/i2c-nforce2.c:123:20: warning: symbol 'nforce2_smbus' was not declared. Should it be static?
> > 
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>  
> 
> What is this based on? Doesn't apply to 6.6-rc3 here?

6.5.5. I'll rebase on top of 6.6-rc3 tomorrow, sorry.

-- 
Jean Delvare
SUSE L3 Support
