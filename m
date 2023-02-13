Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCB4694D38
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Feb 2023 17:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjBMQrw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Feb 2023 11:47:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjBMQrv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Feb 2023 11:47:51 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6226930FE
        for <linux-i2c@vger.kernel.org>; Mon, 13 Feb 2023 08:47:49 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id AB9E121A8F;
        Mon, 13 Feb 2023 16:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676306868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RMARapDvgQtL1kw4BQh/6vKVkEWoE8bTALsjw9c930M=;
        b=Dt5+x4WT0OqtxhfsIWb+XN5L+j1C7RdQrFnahFFM3/IwYquQ+iDHu0+oKoNfUYiMzSzIZ3
        apalRvgvHDZmcHdoy2unQ14B/GKOcpwEA6YxlSM1j2FIEPSQr6dRygvR62D6WZ8Lo016EL
        X2cj4ntbOk0ae5vwc+MZ9D0faXfPk7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676306868;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RMARapDvgQtL1kw4BQh/6vKVkEWoE8bTALsjw9c930M=;
        b=X9wxrJOT9C5KXXUlA9DnlC3viacM1lg+f3t4EqkrDR9Vjh333+Ct+BbIg52xaguJ7CZLor
        KSK6Y7WMKu6febDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 89EA8138E6;
        Mon, 13 Feb 2023 16:47:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Da0dILRp6mN6TQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 13 Feb 2023 16:47:48 +0000
Date:   Mon, 13 Feb 2023 17:47:46 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 06/10] i2c: i801: handle SMBAUXCTL_E32B in
 i801_block_transaction_by_block only
Message-ID: <20230213174746.252d2682@endymion.delvare>
In-Reply-To: <0ef3e6f9-471f-ff05-0cf0-046d79a4c820@gmail.com>
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
        <0ef3e6f9-471f-ff05-0cf0-046d79a4c820@gmail.com>
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

On Mon, 19 Dec 2022 19:20:10 +0100, Heiner Kallweit wrote:
> Currently we touch SMBAUXCTL even if not needed. That's the case for block
> commands that don't use block buffer mode, either because block buffer
> mode isn't available or because it's not supported for the respective
> command (e.g. I2C block transfer). Improve this by setting/resetting
> SMBAUXCTL_E32B in i801_block_transaction_by_block() only.
> 
> Small downside is that we know access SMBAUXCTL twice for transactions

Typo: know -> now.

> that use PEC and block buffer mode. But this should a rather rare case
> and the impact is negligible.

I agree, and the new way also makes things symmetric and thus more
obviously correct.

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

One possible further improvement step, performance-wise, would be to
store the original value of SMBAUXCTL so that we can skip the inb_p()
at the end of the function. What do you think?

-- 
Jean Delvare
SUSE L3 Support
