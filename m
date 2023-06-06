Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E59D7724EB5
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jun 2023 23:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233897AbjFFVVA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Jun 2023 17:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232511AbjFFVU7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Jun 2023 17:20:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FB9290;
        Tue,  6 Jun 2023 14:20:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B6FB9630A3;
        Tue,  6 Jun 2023 21:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF86C433EF;
        Tue,  6 Jun 2023 21:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686086457;
        bh=SMx52lFPf27vu0KyU8uhOx7LbHTgU23iSKhOJg7H1Rw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YGFSCUnukUAohbGw/ft5J6qsy1/Luyj5RedqH0y2vfrAC3sLg2kPghe2w3EZXZqsv
         MF8FXjfov6bljVxcbznrYR8/JghyU3thqVtVtNj8sagMRhDeJVlCt+42d8tZFiyfRC
         GZw4MwT3bkzVO8xGYHR+U6Bj4Cbq83HXdTTLANYMas758IM+uZmcqKWZQDGRuyHWjI
         +95YbczGwBCm8tKvF6svkNZgI0AVAY4dsnUt91nkxezSekcivSMvRi4gAY8hKkJBzt
         MHWk9dAWPCZtYdS+sw1GSBwJ+f5h/S/r7tEtu+RzOjJ7TdBcyfKKcOn3HLHZjFn8rm
         zOkYgBWdl0YmQ==
Date:   Tue, 6 Jun 2023 23:20:53 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Robert Hancock <robert.hancock@calian.com>
Cc:     "michal.simek@amd.com" <michal.simek@amd.com>,
        "shubhraj@xilinx.com" <shubhraj@xilinx.com>,
        "marex@denx.de" <marex@denx.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: Re: [PATCH] i2c: xiic: Don't try to handle more interrupt events
 after error
Message-ID: <20230606212053.bwpoxyost4fkpati@intel.intel>
References: <20230606182558.1301413-1-robert.hancock@calian.com>
 <20230606192453.zjzz4kt76kus5hr5@intel.intel>
 <c763371c710c9952154496026610e2ff583c173a.camel@calian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c763371c710c9952154496026610e2ff583c173a.camel@calian.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Robert,

On Tue, Jun 06, 2023 at 07:40:15PM +0000, Robert Hancock wrote:
> On Tue, 2023-06-06 at 21:24 +0200, Andi Shyti wrote:
> > Hi Robert,
> > 
> > On Tue, Jun 06, 2023 at 12:25:58PM -0600, Robert Hancock wrote:
> > > In xiic_process, it is possible that error events such as
> > > arbitration
> > > lost or TX error can be raised in conjunction with other interrupt
> > > flags
> > > such as TX FIFO empty or bus not busy. Error events result in the
> > > controller being reset and the error returned to the calling
> > > request,
> > > but the function could potentially try to keep handling the other
> > > events, such as by writing more messages into the TX FIFO. Since
> > > the
> > > transaction has already failed, this is not helpful and will just
> > > cause
> > > issues.
> > 
> > what kind of issues?
> > 
> 
> The one I ran into is what I alluded to further down, where that
> WARN_ON was triggering repeatedly, which ended up flooding the kernel
> log and causing the device's watchdog timer to timeout. I'm not sure
> what other forms of havoc might ensue, other than "nothing good"..
> 
> > > This problem has been present ever since:
> > > 
> > > commit 7f9906bd7f72 ("i2c: xiic: Service all interrupts in isr")
> > > 
> > > which allowed non-error events to be handled after errors, but
> > > became
> > > more obvious after:
> > > 
> > > commit 743e227a8959 ("i2c: xiic: Defer xiic_wakeup() and
> > > __xiic_start_xfer() in xiic_process()")
> > > 
> > > which reworked the code to add a WARN_ON which triggers if both the
> > > xfer_more and wakeup_req flags were set, since this combination is
> > > not supposed to happen, but was occurring in this scenario.
> > > 
> > > Skip further interrupt handling after error flags are detected to
> > > avoid
> > > this problem.
> > > 
> > > Fixes: 7f9906bd7f72 ("i2c: xiic: Service all interrupts in isr")
> > > Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> > 
> > please add:
> > 
> > Cc: <stable@vger.kernel.org> # v4.3+
> > 
> 
> Can add for a v2 - although with the Fixes tag it would most likely be
> picked up for stable anyway..

It's just a courtesy to stable maintainers :)

> > > ---
> > >  drivers/i2c/busses/i2c-xiic.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-xiic.c
> > > b/drivers/i2c/busses/i2c-xiic.c
> > > index 8a3d9817cb41..ee6edc963dea 100644
> > > --- a/drivers/i2c/busses/i2c-xiic.c
> > > +++ b/drivers/i2c/busses/i2c-xiic.c
> > > @@ -721,6 +721,8 @@ static irqreturn_t xiic_process(int irq, void
> > > *dev_id)
> > >                       wakeup_req = 1;
> > >                       wakeup_code = STATE_ERROR;
> > >               }
> > > +             /* don't try to handle other events */
> > > +             goto out;
> > 
> > why don't we have goto's after every irq evaluation but only
> > here? Do the issues you mentioned happen olny in this particular
> > error case?
> > 
> 
> As far as I can tell, yes. For example you could legitimately have
> XIIC_INTR_TX_EMPTY_MASK and XIIC_INTR_BNB_MASK both being handled. The
> error case is special as we end up resetting the controller, so it
> doesn't make sense to try to continue with the rest of the transaction
> while also completing it with an error.

I think the patch is correct and I will ack it:

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

I think, though, that this needs a proper fix and testing, in
order to cover all the possible combinations. The scenario you
highlighted is indeed one, but not only, potential situation that
could arise.

Can I just ask you to write a bit more in the comment to 
highlight the possible failure?

Thanks a lot,
Andi

> > Thanks,
> > Andi
> > 
> > >       }
> > >       if (pend & XIIC_INTR_RX_FULL_MASK) {
> > >               /* Receive register/FIFO is full */
> > > --
> > > 2.40.1
> > > 
> 
> -- 
> Robert Hancock <robert.hancock@calian.com>
