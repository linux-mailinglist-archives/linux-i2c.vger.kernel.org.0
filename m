Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5115793BAE
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 13:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbjIFLsB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 07:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240093AbjIFLsB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 07:48:01 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD4E10F9
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 04:47:50 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id CF71A1F459;
        Wed,  6 Sep 2023 11:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1694000868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qXfjtDa7WcrDMSPbIpyFeagjcCP8xGGUVFIkzIYlPA4=;
        b=YDGA6Lves34OiKCEqyOQfLSRGmVs2D+d2Yuyz/RNDKdXz4RiziLAVI4ssO8K2PM9gE7S5m
        uwWVGI0zIc1JgsXZEXpOFHtp0ogXvFbKw5jVvuVcCFiWYqt+hf3JZmKuIFMHLeNwvRLpR8
        u24a3P45wDyf666KBQ1OGjJFmZ/bEoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1694000868;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qXfjtDa7WcrDMSPbIpyFeagjcCP8xGGUVFIkzIYlPA4=;
        b=The1CZtrsuh3x2QxSsbTCb8yERDKqGrhKYONaDOSt/UafvMsPZsi5zY7pbBEYez4Mrd119
        /B0DAsDyS3ADudBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA75B1333E;
        Wed,  6 Sep 2023 11:47:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id sNIeKORm+GTPXgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 06 Sep 2023 11:47:48 +0000
Date:   Wed, 6 Sep 2023 13:47:45 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: i801: fix cleanup code in remove() and error
 path of probe()
Message-ID: <20230906134745.24dfa076@endymion.delvare>
In-Reply-To: <3d5143c3-9a6c-2107-62e4-5f328ce7ea26@gmail.com>
References: <3d5143c3-9a6c-2107-62e4-5f328ce7ea26@gmail.com>
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

Hi Heiner, Wolfram,

On Sat, 02 Sep 2023 22:06:14 +0200, Heiner Kallweit wrote:
> Jean pointed out that the referenced patch resulted in the remove()
> path not having the reverse order of calls in probe(). I think there's
> more to be done to ensure proper cleanup.
> Especially cleanup in the probe() error path has to be extended.
> Not every step there may be strictly needed, but it's in line with
> remove() now.

This last sentence no longer applies to this version of the patch.

> Fixes: 9b5bf5878138 ("i2c: i801: Restore INTREN on unload")
> Fixes: 9424693035a5 ("i2c: i801: Create iTCO device on newer Intel PCHs")
> Cc: stable@vger.kernel.org

I wouldn't cc stable. For one thing, this patch doesn't fix a bug that
actually bothers people. Error paths are rarely taken, and driver
removal isn't that frequent either. Consequences are also rather
harmless (one-time resource leak, race condition which is quite
unlikely to trigger).

For another, this patch is a mix of 2 bug fixes (SMBHSTCNT being
restored too early in i801_remove, resource leak in error path of
i801_probe) which have been added in very different kernel versions
(v5.16 and v4.3, respectively), and tidying up (the reordering of some
of the statements in i801_remove is nice for consistency but is not
actually fixing any bug).

If you really want to push the fixes to stable, you'd have to split the
patch in 3 pieces, one for each fix (going to stable), and one for the
remainder (not going to stable). Otherwise it makes backporting to
older kernels error-prone and time-consuming. Considering how harmless
the bugs are in the first place, my position is that the extra work is
simply not worth it.

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - add Fixes tag for 9424693035a5
> - remove restoring SMBHSTCNT from probe error path
> - move restoring SMBHSTCNT to the end in remove/shutdown
> ---
>  drivers/i2c/busses/i2c-i801.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> (...)

That being said, the patch itself looks good to me, and I have tested
it too.

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

Thanks,
-- 
Jean Delvare
SUSE L3 Support
