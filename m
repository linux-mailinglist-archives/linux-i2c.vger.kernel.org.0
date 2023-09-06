Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53BE8793E76
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 16:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbjIFOOF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 10:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbjIFOOF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 10:14:05 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C63CF
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 07:14:02 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4066C433C8;
        Wed,  6 Sep 2023 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694009641;
        bh=C0nGeWFrTT9iwlGGOHpc5T/5W9pWqhk12vmsyfjdXfw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JSWsiEWVfMU6VvG8QN380m6G2AKwRaBhatHGgHAKu19QSlYU9SDrVw7dK4aKqYARC
         16Pnoau+2P4fNDLXxXEfpimT3gF6uW2vOELmR8B8B9+DovwFu9Q5V/VQk7lhVznI7f
         Ow1NNdNC1Lh3hm/UgpCsBVSHl/bN7+EWjsuptjJv0xqESb3+DYvsU5gEfXhGbPrI23
         kxwwYm+FXB3rRCmZxdde+3j9YIEKTLOZ7j7oAnAv3CEVxvS/O/+x4n9PVutK6kauel
         Ctul9yTf9Or8NDEitEFBctF6/oGZjTHbYIdese0LIXb8HeZaXAsNEIfD6VL52jbxAg
         caNMi4Za2qHOg==
Date:   Wed, 6 Sep 2023 16:13:57 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: i801: fix cleanup code in remove() and error
 path of probe()
Message-ID: <20230906141357.nudcljmbflv32esx@zenone.zhora.eu>
References: <3d5143c3-9a6c-2107-62e4-5f328ce7ea26@gmail.com>
 <20230906134745.24dfa076@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906134745.24dfa076@endymion.delvare>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

On Wed, Sep 06, 2023 at 01:47:45PM +0200, Jean Delvare wrote:
> Hi Heiner, Wolfram,
> 
> On Sat, 02 Sep 2023 22:06:14 +0200, Heiner Kallweit wrote:
> > Jean pointed out that the referenced patch resulted in the remove()
> > path not having the reverse order of calls in probe(). I think there's
> > more to be done to ensure proper cleanup.
> > Especially cleanup in the probe() error path has to be extended.
> > Not every step there may be strictly needed, but it's in line with
> > remove() now.
> 
> This last sentence no longer applies to this version of the patch.
> 
> > Fixes: 9b5bf5878138 ("i2c: i801: Restore INTREN on unload")
> > Fixes: 9424693035a5 ("i2c: i801: Create iTCO device on newer Intel PCHs")
> > Cc: stable@vger.kernel.org
> 
> I wouldn't cc stable. For one thing, this patch doesn't fix a bug that
> actually bothers people. Error paths are rarely taken, and driver
> removal isn't that frequent either. Consequences are also rather
> harmless (one-time resource leak, race condition which is quite
> unlikely to trigger).

we are having this same discussion in another thread: if a bug is
unlikely to happen, doesn't mean that there is no bug. A fix is a
fix and should be backported to stable kernels.

Sometimes bugs are reported some other times bugs are discovered
by reading the code (like in the other thread). In the latter
case bugs are just waiting for their time of glory.

I'm OK if this set of fixes have the Fixes tag or, like in the
other case, we find a way to get it backported anyway.

> For another, this patch is a mix of 2 bug fixes (SMBHSTCNT being
> restored too early in i801_remove, resource leak in error path of
> i801_probe) which have been added in very different kernel versions
> (v5.16 and v4.3, respectively), and tidying up (the reordering of some
> of the statements in i801_remove is nice for consistency but is not
> actually fixing any bug).
> 
> If you really want to push the fixes to stable, you'd have to split the
> patch in 3 pieces, one for each fix (going to stable), and one for the
> remainder (not going to stable). Otherwise it makes backporting to
> older kernels error-prone and time-consuming. Considering how harmless
> the bugs are in the first place, my position is that the extra work is
> simply not worth it.

In my opinion, Heiner, you should split this patch in the two
logical changes that Jean was suggesting, add the tags from Jean
and have them backported.

Thanks Jean for your review and inputs.

Andi

> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > ---
> > v2:
> > - add Fixes tag for 9424693035a5
> > - remove restoring SMBHSTCNT from probe error path
> > - move restoring SMBHSTCNT to the end in remove/shutdown
> > ---
> >  drivers/i2c/busses/i2c-i801.c | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> > (...)
> 
> That being said, the patch itself looks good to me, and I have tested
> it too.
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> Tested-by: Jean Delvare <jdelvare@suse.de>
> 
> Thanks,
> -- 
> Jean Delvare
> SUSE L3 Support
