Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCFA4793237
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 00:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbjIEW7b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 18:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbjIEW7b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 18:59:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3AC0EB
        for <linux-i2c@vger.kernel.org>; Tue,  5 Sep 2023 15:59:27 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088DAC433C7;
        Tue,  5 Sep 2023 22:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693954767;
        bh=e6x00YSc1O0rONfdHhTnpdZ9PNTeWLHkYHC3YGtFCcM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lhXNxiaKESSncXUJW+K4bzSG/6aw9hYwN2oiB2grIhGFNZhMKsvBsRhfHEx0h3CDA
         vByhJduLhLCXZ9/Vv5qC8uFhVnuheFB55XKtW6ZbBVTmNDXCFX8Ke8HbK4ZRrA5oLn
         aIW64juerJPMRCk8E/XbJ3yOczABBEbnwdVoGKNPRpqpqv7V3jJjr+Hcx5DIZrbNPE
         aoIslG+kZOv8zlwrrZjc3hpYSBr0lvE9HVf94CwfnQV5judaBncy5VZ3juqRMZBuMH
         XuQCprjFf6BhdYumoMuxmrOjUevsNBhesTa9bt7/c+RUdyczxSv8jEjRE3HqQ8nxrE
         tdA5QTTzSVz4w==
Date:   Wed, 6 Sep 2023 00:59:22 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.de>, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] i2c: i801: fix potential race in
 i801_block_transaction_byte_by_byte
Message-ID: <20230905225922.blulveq5qwe7tv6h@zenone.zhora.eu>
References: <f056286a-1db9-b88c-6d36-a3358190b9c9@gmail.com>
 <20230905101243.39920fe5@endymion.delvare>
 <20230905091155.h3oezdj5g6z5jpxu@zenone.zhora.eu>
 <5838f7e4-dd08-48eb-2f9c-df45daa0214a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5838f7e4-dd08-48eb-2f9c-df45daa0214a@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Tue, Sep 05, 2023 at 01:35:10PM +0200, Heiner Kallweit wrote:
> On 05.09.2023 11:11, Andi Shyti wrote:
> > Hi Jean,
> > 
> > On Tue, Sep 05, 2023 at 10:12:43AM +0200, Jean Delvare wrote:
> >> On Sat, 02 Sep 2023 22:10:52 +0200, Heiner Kallweit wrote:
> >>> Currently we set SMBHSTCNT_LAST_BYTE only after the host has started
> >>> receiving the last byte. If we get e.g. preempted before setting
> >>> SMBHSTCNT_LAST_BYTE, the host may be finished with receiving the byte
> >>> before SMBHSTCNT_LAST_BYTE is set.
> >>> Therefore change the code to set SMBHSTCNT_LAST_BYTE before writing
> >>> SMBHSTSTS_BYTE_DONE for the byte before the last byte. Now the code
> >>> is also consistent with what we do in i801_isr_byte_done().
> >>>
> >>> Reported-by: Jean Delvare <jdelvare@suse.com>
> >>
> >> Note for Wolfram: checkpatch says we should insert here:
> >>
> >> Closes: https://lore.kernel.org/linux-i2c/20230828152747.09444625@endymion.delvare/
> > 
> > does this also need a Fixes: tag? I tried to check it, but there
> > was an intricate jungle of commits in these lines.
> > 
> Quoting Jean from previous communication about this patch:
> As far as I see, the race condition already existed when the kernel
> switched to git, so there's no point in having a Fixes statement.

true... I forgot about this comment.

Anyway I think that this should, then, go to all the stable
kernels and I believe that without the Fixes tag this will never
be picked up.

Maybe Greg can advise here.

Would you mind resending this patch Cc'eing the stable kernel and
adding a note after the '---'?

Andi

> > Anyway, you can add:
> > 
> > Acked-by: Andi Shyti <andi.shyti@kernel.org> 
> > 
> > Thanks,
> > Andi
> 
