Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8FD57D8E8
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jul 2022 05:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234151AbiGVDPx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Jul 2022 23:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbiGVDPr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Jul 2022 23:15:47 -0400
X-Greylist: delayed 436 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 21 Jul 2022 20:15:45 PDT
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C0982AE0A;
        Thu, 21 Jul 2022 20:15:44 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 412B2580E19;
        Thu, 21 Jul 2022 23:08:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 21 Jul 2022 23:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1658459308; x=1658462908; bh=uG2Rb1C0Ih
        Z7yNKCi2bEM3jWfHG2vQqfIOk05YbeD9M=; b=ogDLl2oDCCPHk3XNtlhynR8Zjk
        TDPmvhYleBdslcmUW/nckL9llYKjnYFGMPaWypTc5FNV6yurPxvTAEvqdC//bmtL
        z39ubYj+NoYOqP5Li6Xz8CTOP852Rf/8vVpMgHJEskQMpKxDb54vA4KeiqRoZXE4
        HI0ShzQYBdYlhxEzWdq3lsOToCBL0SI0OTnJCdhLm7uwaJzZWAmM8ltySw6eQH+5
        1CVy+YK29/M+u2plbMR8irXREM6sNgjYcZyQQsGl8uvoP0qtAyOHg0jZAmb3U4QW
        Kf4rbd5b+CAQ+ksp1pDEatCFLC51H7wibEdJLDkvz0povmJYV2rXV6FiEFqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1658459308; x=1658462908; bh=uG2Rb1C0IhZ7yNKCi2bEM3jWfHG2
        vQqfIOk05YbeD9M=; b=MolbHctsNv9+0mlUjQfoD9ynCHqeDnP1/IY1PIt31Rb4
        VNqFSWAqbmldv57MoU2na54NhgE0Ci4GsUUBGxZBZN602VYdcJCKKYDNOyZgDZP+
        ZSQ2D7IRtw6/JaBZxMd1nLV0eUdW6wMminPPBvAeC210pIKQFuWCi1Rv5qTMsjt7
        DSrnaNkrHlsWpDWfxKr5ZF3T5gqVihuJ9xJMInQyjgzVDngdwRbGYCAD6WPXJm4U
        2UyvTWVzTVX/YAqXPCtRtE9G1ENOwYnnk0WW8mdK11/iMHVDe/b84VE3io/l7oU+
        t1TkIAdqSTJXxDEGRNkwvzjECfLr1p/xSrOtUh48AQ==
X-ME-Sender: <xms:qxTaYuT3ELuogtUlMWehkn7wiokqvJR0eq8qIan_AB77XF-QufXeZA>
    <xme:qxTaYjyAFms7oc4WejYcPugxA2a5aaom-4ihM7xLDoZIz6Vk8ZSJdoCrRtHoomcSA
    jr0t5l6RyC38AAmDxk>
X-ME-Received: <xmr:qxTaYr3ZegZfhPf4nQXK_A3KSYGMPAGKhW10MMQvTLsMmx2UqbdS1xxYJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtuddgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvghtvghr
    sehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpeduteeihfffleeuveekgedugfeffe
    ehtdeguefffffhleehgfduueejjeekfeeukeenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:qxTaYqDvDQcx5MFaWwBennRuNTDQC3CzvRDK2OAj_wD_inTErMdRRQ>
    <xmx:qxTaYniL_GlzhC6WZ9lz_bobQ5iVDstqi1EivBClVJbJmd7LCeJOkg>
    <xmx:qxTaYmrOWymW8h5IpOXYCiVeNW4NermOusi1M-KSAxMpxxj8LR7yRw>
    <xmx:rBTaYoWrN1zmWnQBKL2krLcIkgqjlktgel9L6_pN9WDjHEDXhnkZQ_AH_G4>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Jul 2022 23:08:26 -0400 (EDT)
Date:   Thu, 21 Jul 2022 20:08:24 -0700
From:   Peter Delevoryas <peter@pjd.dev>
To:     ryan_chen <ryan_chen@aspeedtech.com>
Cc:     brendanhiggins@google.com, benh@kernel.crashing.org,
        joel@jms.id.au, andrew@aj.id.au, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: aspeed: Fix slave mode unexpected irq handler
Message-ID: <YtoUqH6uSNEKBbt5@pdel-mbp>
References: <20220531093140.28770-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531093140.28770-1-ryan_chen@aspeedtech.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_FMBLA_NEWDOM28,
        RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 31, 2022 at 05:31:40PM +0800, ryan_chen wrote:
> When i2c master send the new i2c transfer immediately
> after stop. the i2c slave will see the stop and new
> address match stage together. And it needs handle the
> stop first. otherwise will occur unexpected handle
> isr.

I think it would be helpful if you could include some driver trace messages to
indicate the sequence of events that lead you to make this change, like an
example of the problem happening.

> 
> Fixes: f327c686d3ba ("i2c: aspeed: added drover for Aspeed I2C)

Typo on "drover"? Actually, slave support wasn't included in this commit. I
think it should be:

Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")

> Signed-off-by: ryan_chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 771e53d3d197..9f21e090ce47 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -252,6 +252,12 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>  
>  	/* Slave was requested, restart state machine. */
>  	if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
> +		if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP &&
> +			bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED) {
> +			irq_handled |= ASPEED_I2CD_INTR_NORMAL_STOP;
> +			irq_status &= ~ASPEED_I2CD_INTR_NORMAL_STOP;
> +			i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
> +		}

Ok, we might receive the STOP and START signals at the same time.

So, we need to make sure that we handle the STOP first. [1]

Why is this within the START case then? Can't we untangle this from the START
handling?

irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH means SLAVE START, right?

We know we're in slave mode already because this is the slave IRQ handler.

And we can access the state of the bus through bus->slave_state, to see if it's
a spurious STOP or an expected one.

It would also be nice to unify the STOP handling code too, to make sure this
matches the normal STOP path that already exists below here.

[1] Although if that's the case, it seems like we might need to handle the
START first sometimes, depending on the current state, right?

Can we have the reverse case, where we see a START and the matching STOP
simultaneously? Perhaps that's already handled properly by the code since
it's structured chronologically.

>  		irq_handled |= ASPEED_I2CD_INTR_SLAVE_MATCH;
>  		bus->slave_state = ASPEED_I2C_SLAVE_START;
>  	}
> -- 
> 2.17.1
> 
