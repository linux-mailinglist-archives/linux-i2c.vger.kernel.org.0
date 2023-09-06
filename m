Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1195793778
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 10:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjIFIvF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 04:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbjIFIvE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 04:51:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3265510DE
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 01:50:38 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B62C433C7;
        Wed,  6 Sep 2023 08:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1693990220;
        bh=GLq9hdp/o97miTEIZM5Xf4vOPBXOHlT6jLKTEJKrijw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OvWi7WBO2dFcmFObS8/Kc9t1amkpcxcYQczSwIpj7ErzRuKQZRq/o0vH728emcu4l
         8wzTur3CrxmYj1kC4vxGxzZeK6PhQhtYpsoeSIDdLmyTNoei2gB07Qg7gEd6/D3/4w
         coyOqPTHQmcyqaRBdm8jFn+xM8HLiY9iCYGCoioU=
Date:   Wed, 6 Sep 2023 09:50:17 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.de>, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: i801: fix potential race in
 i801_block_transaction_byte_by_byte
Message-ID: <2023090642-umbilical-travesty-6274@gregkh>
References: <f056286a-1db9-b88c-6d36-a3358190b9c9@gmail.com>
 <20230905101243.39920fe5@endymion.delvare>
 <20230905091155.h3oezdj5g6z5jpxu@zenone.zhora.eu>
 <5838f7e4-dd08-48eb-2f9c-df45daa0214a@gmail.com>
 <20230905225922.blulveq5qwe7tv6h@zenone.zhora.eu>
 <55e8de0d-daf3-f398-0fc2-357b53c14bc8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55e8de0d-daf3-f398-0fc2-357b53c14bc8@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 06, 2023 at 08:05:59AM +0200, Heiner Kallweit wrote:
> On 06.09.2023 00:59, Andi Shyti wrote:
> > Hi Heiner,
> > 
> > On Tue, Sep 05, 2023 at 01:35:10PM +0200, Heiner Kallweit wrote:
> >> On 05.09.2023 11:11, Andi Shyti wrote:
> >>> Hi Jean,
> >>>
> >>> On Tue, Sep 05, 2023 at 10:12:43AM +0200, Jean Delvare wrote:
> >>>> On Sat, 02 Sep 2023 22:10:52 +0200, Heiner Kallweit wrote:
> >>>>> Currently we set SMBHSTCNT_LAST_BYTE only after the host has started
> >>>>> receiving the last byte. If we get e.g. preempted before setting
> >>>>> SMBHSTCNT_LAST_BYTE, the host may be finished with receiving the byte
> >>>>> before SMBHSTCNT_LAST_BYTE is set.
> >>>>> Therefore change the code to set SMBHSTCNT_LAST_BYTE before writing
> >>>>> SMBHSTSTS_BYTE_DONE for the byte before the last byte. Now the code
> >>>>> is also consistent with what we do in i801_isr_byte_done().
> >>>>>
> >>>>> Reported-by: Jean Delvare <jdelvare@suse.com>
> >>>>
> >>>> Note for Wolfram: checkpatch says we should insert here:
> >>>>
> >>>> Closes: https://lore.kernel.org/linux-i2c/20230828152747.09444625@endymion.delvare/
> >>>
> >>> does this also need a Fixes: tag? I tried to check it, but there
> >>> was an intricate jungle of commits in these lines.
> >>>
> >> Quoting Jean from previous communication about this patch:
> >> As far as I see, the race condition already existed when the kernel
> >> switched to git, so there's no point in having a Fixes statement.
> > 
> > true... I forgot about this comment.
> > 
> > Anyway I think that this should, then, go to all the stable
> > kernels and I believe that without the Fixes tag this will never
> > be picked up.
> > 
> 
> Then we may have to set the Fixes tag to the following?
> 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Plus a comment that the issue existed before already.
> 
> > Maybe Greg can advise here.
> > 
> I *think* Greg (or a bot of him) would complain when receiving
> something for stable w/o a Fixes tag.

No, fixes tags are not required, but they are nice.  For the full set of
rules on how to do this, please see:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

