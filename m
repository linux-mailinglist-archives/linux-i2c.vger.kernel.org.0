Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6721E78B1CB
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Aug 2023 15:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjH1N14 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Aug 2023 09:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231730AbjH1N1w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Aug 2023 09:27:52 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AD81B9
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 06:27:50 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 27CB121AC2;
        Mon, 28 Aug 2023 13:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1693229269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2K0p3BnuN+l0KiyLXRdBzW5wUC2PRxI+ujhFg3Eakjo=;
        b=D9te/xBVdigAmWnb56w4HawckgEf5bq4dIAOqur+WFWYtKwmTKD7PPBo4hpVaai4ihV9WL
        P2LyEfPQ9X7iZYnGfdcUbta0TOB+pgn53NPbhY/9pV4GfSdaAguHpG4BItEciYNr9G1XxO
        FKMedRe86EbqJMU2foH6k877tDGS9VQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1693229269;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2K0p3BnuN+l0KiyLXRdBzW5wUC2PRxI+ujhFg3Eakjo=;
        b=tricx1T6kyBC21KTUP1RL0owrQTp2sfKpDtWn1XD/SdaIzxCrZ7m4O9M6tpzu/N2VMTEmj
        cYeN1xrnQ794Q8CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F307513A11;
        Mon, 28 Aug 2023 13:27:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id NFm7OdSg7GQwPAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 28 Aug 2023 13:27:48 +0000
Date:   Mon, 28 Aug 2023 15:27:47 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/4] i2c: i801: Improve
 i801_block_transaction_byte_by_byte
Message-ID: <20230828152747.09444625@endymion.delvare>
In-Reply-To: <cc1826de-35b1-cd20-900f-3908c7499792@gmail.com>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
        <6686b692-0caf-734e-18cd-7879810b29cd@gmail.com>
        <20230627154606.1488423f@endymion.delvare>
        <cc1826de-35b1-cd20-900f-3908c7499792@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Sun, 27 Aug 2023 19:14:38 +0200, Heiner Kallweit wrote:
> On 27.06.2023 15:46, Jean Delvare wrote:
> > Hi Heiner, Andi,
> > 
> > On Sat, 04 Mar 2023 22:36:34 +0100, Heiner Kallweit wrote:  
> >> Here we don't have to write SMBHSTCNT in each iteration of the loop.
> >> Bit SMBHSTCNT_START is internally cleared immediately, therefore
> >> we don't have to touch the value of SMBHSTCNT until the last byte.
> >>
> >> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >> ---
> >>  drivers/i2c/busses/i2c-i801.c | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> >> index 7641bd0ac..e1350a8cc 100644
> >> --- a/drivers/i2c/busses/i2c-i801.c
> >> +++ b/drivers/i2c/busses/i2c-i801.c
> >> @@ -677,11 +677,11 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
> >>  	for (i = 1; i <= len; i++) {
> >>  		if (i == len && read_write == I2C_SMBUS_READ)
> >>  			smbcmd |= SMBHSTCNT_LAST_BYTE;
> >> -		outb_p(smbcmd, SMBHSTCNT(priv));
> >>  
> >>  		if (i == 1)
> >> -			outb_p(inb(SMBHSTCNT(priv)) | SMBHSTCNT_START,
> >> -			       SMBHSTCNT(priv));
> >> +			outb_p(smbcmd | SMBHSTCNT_START, SMBHSTCNT(priv));
> >> +		else if (smbcmd & SMBHSTCNT_LAST_BYTE)
> >> +			outb_p(smbcmd, SMBHSTCNT(priv));
> >>  
> >>  		status = i801_wait_byte_done(priv);
> >>  		if (status)  
> > 
> > I tested this and it works, but I don't understand how.
> > 
> > I thought that writing to SMBHSTCNT was what was telling the host
> > controller to proceed with the next byte. If writing to SMBHSTCNT for
> > each byte isn't needed, then what causes the next byte to be processed?
> > Does this happen as soon as SMBHSTSTS_BYTE_DONE is written? If so, then
> > what guarantees that we set SMBHSTCNT_LAST_BYTE *before* the last byte
> > is actually processed?
>
> It's my understanding that writing SMBHSTSTS_BYTE_DONE tells the host to
> continue with the next byte.

That's indeed possible, and quite likely, considering that your patch
works.

> We set SMBHSTCNT_LAST_BYTE whilst the host is receiving the last byte.
> Apparently the host checks for SMBHSTCNT_LAST_BYTE once it received
> a byte, in order to determine whether to ack the byte or not.
> So SMBHSTCNT_LAST_BYTE doesn't have to be set before the host starts
> receiving the last byte.

How is this not racy?

In the interrupt-driven case, at the end of a block read transaction,
we set SMBHSTCNT_LAST_BYTE at the end of i801_isr_byte_done(), then
return to i801_isr() where we write 1 to SMBHSTSTS_BYTE_DONE to clear
it. This lets the controller handle the last byte with the knowledge
that this is the last byte.

However, in the poll-driven case, SMBHSTSTS_BYTE_DONE is being cleared
at the end of the loop in i801_block_transaction_byte_by_byte(), then
at the beginning of the next iteration, we write SMBHSTCNT_LAST_BYTE,
then wait for completion. If the controller is super fast (or, to be
more realistic, the i2c-i801 driver gets preempted between writing
SMBHSTSTS_BYTE_DONE and writing SMBHSTCNT_LAST_BYTE) then the byte may
have been already read and acked, before we have the time to let the
controller know that no ACK should be sent. This looks racy. Am I
missing something?

If nothing else, the fact that the order is different between the
interrupt-driven and poll-driven cases is fishy.

I must add that the problem is not related to your patch, I just
happened to notice it while reviewing your patch.

> For writes SMBHSTCNT_LAST_BYTE isn't used.

Agreed.

-- 
Jean Delvare
SUSE L3 Support
