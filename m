Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4A9A23F638
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Aug 2020 05:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgHHDzZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 23:55:25 -0400
Received: from linux.microsoft.com ([13.77.154.182]:49470 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgHHDzZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Aug 2020 23:55:25 -0400
Received: by linux.microsoft.com (Postfix, from userid 1046)
        id 49EBD20B4908; Fri,  7 Aug 2020 20:55:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 49EBD20B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1596858925;
        bh=yv1HNv+auWWTtGIHj8cYxCKVDXHJnHrx+GEc0N8XXUI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PpdjXDy1StNRCYJdscNOuDJasjAuyBvq1a5LrNWdEAHy9ao+IphTIEzYm4L/MgoRq
         Q1bZVnQu3P5khUwSJ2ttjPCrocuczYjLvZVxWPusO2jWo0SybO5Dtf7PUsAlMjSySP
         Hchpqoukeqyp3mgOPNMBZ41eNGEjtVIcMVFbOoU8=
From:   Dhananjay Phadke <dphadke@linux.microsoft.com>
To:     f.fainelli@gmail.com
Cc:     bcm-kernel-feedback-list@broadcom.com, dphadke@linux.microsoft.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        rayagonda.kokatanur@broadcom.com, rjui@broadcom.com, wsa@kernel.org
Subject: Re: [PATCH v2] i2c: iproc: fix race between client unreg and isr
Date:   Fri,  7 Aug 2020 20:55:25 -0700
Message-Id: <1596858925-45763-1-git-send-email-dphadke@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <00a30ca7-d533-94ba-994a-9a133fadb045@gmail.com>
References: <00a30ca7-d533-94ba-994a-9a133fadb045@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/7/2020, Florian Fainelli wrote:
> > When i2c client unregisters, synchronize irq before setting
> > iproc_i2c->slave to NULL.
> > 
> > (1) disable_irq()
> > (2) Mask event enable bits in control reg
> > (3) Erase slave address (avoid further writes to rx fifo)
> > (4) Flush tx and rx FIFOs
> > (5) Clear pending event (interrupt) bits in status reg
> > (6) enable_irq()
> > (7) Set client pointer to NULL
> > 
> 
> > @@ -1091,6 +1091,17 @@ static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
> >  	tmp &= ~BIT(S_CFG_EN_NIC_SMB_ADDR3_SHIFT);
> >  	iproc_i2c_wr_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET, tmp);
> >  
> > +	/* flush TX/RX FIFOs */
> > +	tmp = (BIT(S_FIFO_RX_FLUSH_SHIFT) | BIT(S_FIFO_TX_FLUSH_SHIFT));
> > +	iproc_i2c_wr_reg(iproc_i2c, S_FIFO_CTRL_OFFSET, tmp);
> > +
> > +	/* clear all pending slave interrupts */
> > +	iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, ISR_MASK_SLAVE);
> > +
> > +	enable_irq(iproc_i2c->irq);
> > +
> > +	iproc_i2c->slave = NULL;
> 
> There is nothing that checks on iproc_i2c->slave being valid within the
> interrupt handler, we assume that the pointer is valid which is fin,
> however non functional it may be, it may feel more natural to move the
> assignment before the enable_irq()?

As far as the teardown sequence ensures no more interrupts arrive after
enable_irq() and they are enabled only after setting pointer during
client register(); checking for NULL in ISR isn't necessary. 

If The teardown sequence doesn't guarantee quiescing of interrupts,
setting NULL before or after enable_irq() is equally vulnerable.

Dhananjay

