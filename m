Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35C7022A3F8
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 02:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732755AbgGWA6p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 20:58:45 -0400
Received: from linux.microsoft.com ([13.77.154.182]:58652 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728607AbgGWA6p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jul 2020 20:58:45 -0400
Received: by linux.microsoft.com (Postfix, from userid 1046)
        id D288C20B4908; Wed, 22 Jul 2020 17:58:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D288C20B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1595465924;
        bh=COad48i7F7Ppim6j74aTQgCPv4ntgv9CarhdXkZqMSI=;
        h=Date:To:Subject:Cc:References:In-Reply-To:From:From;
        b=niMgtu2U1MhpmWIEO3cGbPKV10cWPPsqIFr07inBG1vKDl0zmHzqzlc8qrAmggp2N
         5mGg9NdqEaGD+eIpTEWZ0ouRM1eH5z9gQbJNjRSwV9FBMxtwI2d29qezbxuw6rvMwg
         +KIyK7esmDdlGvp/2oHrdVwlXhUvjNel8nOaNzEg=
Date:   Wed, 22 Jul 2020 17:58:43 -0700
To:     wsa@kernel.org, ray.jui@broadcom.com
Subject: Re: [PATCH] i2c: iproc: fix race between client unreg and isr
Cc:     rjui@broadcom.com, rayagonda.kokatanur@broadcom.com,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        dphadke@linux.microsoft.com, bcm-kernel-feedback-list@broadcom.com
References: <1595115599-100054-1-git-send-email-dphadke@linux.microsoft.com>
 <116ac90c-8b49-ca89-90a4-9a28f43a7c50@broadcom.com>
 <20200722104128.GK1030@ninjato>
 <5048cf44-e2c2-ee31-a9fb-b823f16c2c7d@broadcom.com>
In-Reply-To: <5048cf44-e2c2-ee31-a9fb-b823f16c2c7d@broadcom.com>
User-Agent: Heirloom mailx 12.5 7/5/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <20200723005844.D288C20B4908@linux.microsoft.com>
From:   dphadke@linux.microsoft.com (Dhananjay Phadke)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Ray Jui <ray.jui@broadcom.com> wrote:

>
> On 7/22/2020 3:41 AM, Wolfram Sang wrote:
> > 
> >>> +	synchronize_irq(iproc_i2c->irq);
> >>
> >> If one takes a look at the I2C slave ISR routine, there are places where
> >> IRQ can be re-enabled in the ISR itself. What happens after we mask all
> >> slave interrupt and when 'synchronize_irq' is called, which I suppose is
> >> meant to wait for inflight interrupt to finish where there's a chance
> >> the interrupt can be re-enable again? How is one supposed to deal with that?
> > 
> > I encountered the same problem with the i2c-rcar driver before I left
> > for my holidays.
> > 
>
> I think the following sequence needs to be implemented to make this
> safe, i.e., after 'synchronize_irq', no further slave interrupt will be
> fired.
>
> In 'bcm_iproc_i2c_unreg_slave':
>
> 1. Set an atomic variable 'unreg_slave' (I'm bad in names so please come
> up with a better name than this)
>
> 2. Disable all slave interrupts
>
> 3. synchronize_irq
>
> 4. Set slave to NULL
>
> 5. Erase slave addresses
>
> In the ISR routine, it should always check against 'unreg_slave' before
> enabling any slave interrupt. If 'unreg_slave' is set, no slave
> interrupt should be re-enabled from within the ISR.
>
> I think the above sequence can ensure no further slave interrupt after
> 'synchronize_irq'. I suggested using an atomic variable instead of
> variable + spinlock due to the way how sync irq works, i.e., "If you use
> this function while holding a resource the IRQ handler may need you will
> deadlock.".
>
> Thanks,
>
> Ray
>
> >>> +	iproc_i2c->slave = NULL;
> >>> +
> >>>  	/* Erase the slave address programmed */
> >>>  	tmp = iproc_i2c_rd_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET);
> >>>  	tmp &= ~BIT(S_CFG_EN_NIC_SMB_ADDR3_SHIFT);
> >>>
