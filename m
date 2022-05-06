Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F221E51DDAB
	for <lists+linux-i2c@lfdr.de>; Fri,  6 May 2022 18:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232698AbiEFQiD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 May 2022 12:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358520AbiEFQiC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 May 2022 12:38:02 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDBF15DA52
        for <linux-i2c@vger.kernel.org>; Fri,  6 May 2022 09:34:17 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 80F501F8DA;
        Fri,  6 May 2022 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1651854856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gKdOxagr9mUIOwtFzaP4Nj0WDgg76lK7Xzz7BQ+n41M=;
        b=or0lJQFgnd1gN2W7PwFTmazpu7/JBZsZQ3hw+llJJp6pgSdwpOjpQOaFhDS9nV/Rhtl3au
        LzVZrRNht4Wzdr5JEcNaSGCB7EO8t3dVVN+6hgagZBsj1MLKyENtElEFXxwQI5IrbNTrK1
        qGvNvhcFnpCfF+CkLh4SWO0SHnNC+sw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1651854856;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gKdOxagr9mUIOwtFzaP4Nj0WDgg76lK7Xzz7BQ+n41M=;
        b=TzgwkPHx9MkkFetE6ouBckMQJISQwkckMR9k7C3a5E7qsGf4/dJYM/M9/U9jXPHBxEMd2X
        qla1BQkyG/PEveAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5281613A1B;
        Fri,  6 May 2022 16:34:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id CN9lEghOdWKbKwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 06 May 2022 16:34:16 +0000
Date:   Fri, 6 May 2022 18:34:13 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c-tools: Use getopt
Message-ID: <20220506183413.703b39dc@endymion.delvare>
In-Reply-To: <YnU0fTi+Pa91sNyJ@shikoro>
References: <20220506160652.61d61aa6@endymion.delvare>
        <YnU0fTi+Pa91sNyJ@shikoro>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Fri, 6 May 2022 16:45:17 +0200, Wolfram Sang wrote:
> >  tools/i2cdetect.c |   23 ++++++++++-------------
> >  tools/i2cdump.c   |   49 +++++++++++++++++++++++--------------------------
> >  tools/i2cget.c    |   31 ++++++++++++++-----------------
> >  tools/i2cset.c    |   45 +++++++++++++++++++--------------------------  
> 
> Yeah, useful change for sure! Any chance to tackle i2ctransfer as well
> while you are at it?

I did not want to step on your toes ;-) I'll look into applying the
same changes to i2ctransfer if possible, no problem.

-- 
Jean Delvare
SUSE L3 Support
