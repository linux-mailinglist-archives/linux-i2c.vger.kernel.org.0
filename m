Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D52144AF8E
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 15:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232603AbhKIOjH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 09:39:07 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:59172 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbhKIOjH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 09:39:07 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 96E5621B15;
        Tue,  9 Nov 2021 14:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1636468580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sZ7yFqAQwoLq861mHiquNRE8mBY9VP157bevF58uG9Y=;
        b=UKocyccWOVhPKS0gPPLVaFmiZNXZQhkB99LPDgaaLPLSsU+yEgUH2eDR8t5rBCkTuowA/9
        kHY7H9XgAPewqRT6g2xtWt+sbpCBCZ9xDsavqYyPOHIG1fUNlt8GZ5+aDV7flE9Yt1MVP7
        2ZmB0w3dUwy+vsiCFlXxWsyQMGMKpCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1636468580;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sZ7yFqAQwoLq861mHiquNRE8mBY9VP157bevF58uG9Y=;
        b=YAjJyyFN1pugyIsDINpsf8JbFrqf1XQl8q/NYanq0xkNlNT40+7rY1xtAEqcoyob9ewRGF
        mhi75qafNtKifRCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6840B13A1F;
        Tue,  9 Nov 2021 14:36:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id sKTuFmSHimEwegAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 09 Nov 2021 14:36:20 +0000
Date:   Tue, 9 Nov 2021 15:36:19 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Chris Drake <cryptophoto@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: i2cget bug report: errors reading words
Message-ID: <20211109153619.4416e9c3@endymion>
In-Reply-To: <CAH6gCJBbG4PMtnPLcLWOnPxBsXGPwXC3MivCF0ztujDfC9RNQw@mail.gmail.com>
References: <CAH6gCJBbG4PMtnPLcLWOnPxBsXGPwXC3MivCF0ztujDfC9RNQw@mail.gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

On Tue, 9 Nov 2021 23:14:26 +1000, Chris Drake wrote:
> You forgot that we can read words as well as bytes from the current
> address...

I did not forget anything ;-)

> e.g - bold below:-
> 
> [pi@rpi src]$ i2cset -y 1 0x0D 0x09 0x1D  # set BMP280 continuous measure
> mode
> [pi@rpi src]$ i2cget -y 1 0x0d 0x00 w   # tell it to start reading at reg
> 0, and get the X word
> 0x065b
> [pi@rpi src]$ *i2cget -y 1 0x0d w*   # continue reading (i.e. get the Y
> word)
> Error: Data address invalid!
> Usage: i2cget [-f] [-y] [-a] I2CBUS CHIP-ADDRESS [DATA-ADDRESS [MODE]]
>   I2CBUS is an integer or an I2C bus name
>   ADDRESS is an integer (0x03 - 0x77, or 0x00 - 0x7f if -a is given)
>   MODE is one of:
>     b (read byte data, default)
>     w (read word data)
>     c (write byte/read byte)
>     Append p for SMBus PEC
> [pi@rpi src]$ i2cget -y 1 0x0d w # continue reading (i.e. get the Z word)
> Error: Data address invalid! [snip]
> 
> [pi@rpi src]$ *i2cget -y 1 0x0d* # Bug report - happy to read BYTES like
> this, but blows up trying to read words...
> 0x37
> 
> [pi@rpi src]$

There is no SMBus command to read a word without prior addressing, and
that's the reason why i2cget does not support it. i2cget only supports
SMBus-level transactions. Maybe the tool should have been named
"smbusget" to make it clearer...

Try i2ctransfer instead, which operates at I2C level and can do what
you need, assuming your underlying bus master is I2C-capable.

Hope that helps,
-- 
Jean Delvare
SUSE L3 Support
