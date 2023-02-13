Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F418A694D97
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Feb 2023 18:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbjBMRE3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Feb 2023 12:04:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjBMRE2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Feb 2023 12:04:28 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB381BC8
        for <linux-i2c@vger.kernel.org>; Mon, 13 Feb 2023 09:04:27 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 0787321B60;
        Mon, 13 Feb 2023 17:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676307866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YCKOqdPEpbRmZbvsTtZ6UbGopzBlPZfcSqZjJf2KROE=;
        b=TdGOF2dGT0aaV5K5aR5gQ867PO9ngZds5TBOQUTfDUGoTr0YZqwkAQLm1nlfTKdrSCtnMO
        UOU/pnT8n8Ct9txO06HlPpr/ANIpr6Ty6mTQ0rcVUmq3RihYHewAjNQKvMNCg+NpeSe3TM
        OxpFfWXMqTRdFWHabKHf436doyYUL2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676307866;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YCKOqdPEpbRmZbvsTtZ6UbGopzBlPZfcSqZjJf2KROE=;
        b=dp2xlynxt/0SQX6f+obIa3DD1c0bL/Xq7rtR7T8xA1cWqPPzcisloOFX26TQlK9ONUbqor
        Kao13YOAIE5bpuCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB531138E6;
        Mon, 13 Feb 2023 17:04:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id s0gDNJlt6mPsVQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 13 Feb 2023 17:04:25 +0000
Date:   Mon, 13 Feb 2023 18:04:24 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 05/10] i2c: i801: add i801_simple_transaction(),
 complementing i801_block_transaction()
Message-ID: <20230213180424.562ddd01@endymion.delvare>
In-Reply-To: <be365c4b-b625-e59d-86c6-46bd5aa91ca1@gmail.com>
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
        <be365c4b-b625-e59d-86c6-46bd5aa91ca1@gmail.com>
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

On Mon, 19 Dec 2022 19:17:03 +0100, Heiner Kallweit wrote:
> This patch factors out non-block pre/post processing to a new function
> i801_simple_transaction(), complementing existing function
> i801_block_transaction(). This makes i801_access() better readable.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - rename new function to i801_simple_transaction
> - code style fixes
> ---
>  drivers/i2c/busses/i2c-i801.c | 92 +++++++++++++++++++++--------------
>  1 file changed, 55 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 882cf5135..d934d410b 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -732,6 +732,59 @@ static void i801_set_hstadd(struct i801_priv *priv, u8 addr, char read_write)
>  	outb_p((addr << 1) | (read_write & 0x01), SMBHSTADD(priv));
>  }
>  
> +/* Single value transaction function */
> +static int i801_simple_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
> +				   char read_write, int command)
> +{
> +	int xact, ret;
> +
> +	switch (command) {

I did not notice during my initial review, but this parameter name is
confusing, and this becomes even more obvious with patch 7 later. What
you name "command" here is named "size" in function i801_access(). And
what is named "command" there, you will name "hstcmd" in this function
in patch 7. I would prefer to keep the same names (and parameter order)
throughout the function stack for consistency.

Rest is OK.

-- 
Jean Delvare
SUSE L3 Support
