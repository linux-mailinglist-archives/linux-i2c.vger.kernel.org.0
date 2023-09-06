Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8274B794300
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 20:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234939AbjIFSZd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 14:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237740AbjIFSZc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 14:25:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BBFE6A
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 11:25:28 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F2DC433C8;
        Wed,  6 Sep 2023 18:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694024727;
        bh=x3RsLFgY5yOEbrwXVdCsDV8FlgBNBkr81mWwFsnR0Dc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hSNnkdunO4G+F9ocu4pSM3HWIbxAfKUrpn/7xF3HCWApc8m8a7gcX8i0GSyPhyPr5
         hxvnDEDUP0ApKlX3ZwJzF0mjhQ2/t+UbaCdMwB/xfajkWbWBfbxVP7ool4ORbpJeMs
         cFbAYx5+86eWIEcEkKVr5KUth3o5hYI+svEhQsONfIafRcKTAAuMoS0cAAbnBs5HEB
         c593Tbb2tkZlSwtnRiakZti3NULWcoFga0MeruvJYtji9o88Sllz85dBMAR/fytF9r
         ZfuGzd9kFP9uiJPLH9TTpTZw5bpWBo2kK+BRvK7d4qDYq5HAUTaG/s2lvPRD+199K2
         KvUoT1gVHGKvg==
Date:   Wed, 6 Sep 2023 20:25:23 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: i801: fix cleanup code in remove() and error
 path of probe()
Message-ID: <20230906182523.sncigwwmbifm4gpn@zenone.zhora.eu>
References: <3d5143c3-9a6c-2107-62e4-5f328ce7ea26@gmail.com>
 <20230906134745.24dfa076@endymion.delvare>
 <20230906141357.nudcljmbflv32esx@zenone.zhora.eu>
 <20230906174739.499ab821@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906174739.499ab821@endymion.delvare>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

> > > I wouldn't cc stable. For one thing, this patch doesn't fix a bug that
> > > actually bothers people. Error paths are rarely taken, and driver
> > > removal isn't that frequent either. Consequences are also rather
> > > harmless (one-time resource leak, race condition which is quite
> > > unlikely to trigger).  
> > 
> > we are having this same discussion in another thread: if a bug is
> > unlikely to happen, doesn't mean that there is no bug. A fix is a
> > fix and should be backported to stable kernels.
> 
> No. Please read:
> 
>   https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> 
> There is clearly a list of conditions for a commit to be eligible for
> stable kernel trees. It's not "every fix".

I think you are putting these fixes into the ""This could be a
problem..." type of things".

But as I see these fixes don't belong to this category, as they
are clearing the exit path. This is a kind of fixes I want to see
going to stable.

Which means that if we exit through that path, do we exit
cleanly, e.g., without leaking? If the answer is "no", then this
is a fix and should go to stable.

It belongs to "This could be a problem..." type, things like
dev_err/dev_warn (first thing coming to my mind) or other non
functional fixes.

Maybe this is a matter of opinion and different background. For
the i2c side I'm in peace :-)

For the stable backport I'd love to hear another opinion.

Thanks, Jean!
Andi
