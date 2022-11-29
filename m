Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF3963BF06
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Nov 2022 12:32:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbiK2Lbt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Nov 2022 06:31:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233210AbiK2Lbc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Nov 2022 06:31:32 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728D95C0D4;
        Tue, 29 Nov 2022 03:31:31 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 05C731F8C0;
        Tue, 29 Nov 2022 11:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1669721490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qIQYqVD7Cqpxj4k2W2MZXVngW4om9BlG5uoOmUxQLDk=;
        b=1VNs0gmJGUqFid6zMsAHKT7JgygAnYgqC6Pzpo8QKgpW/q1ZKG32TlcqTESHOSlrz3JMya
        2NeRtXmbVE30tnx1nl53+KOAcklFb8TJqJ36mUEV/yxcNX4z9r/11RANLhnXDGiUSRK1ll
        zmnoKSHKrFNXQwejYHy13+X1SX7qWHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1669721490;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qIQYqVD7Cqpxj4k2W2MZXVngW4om9BlG5uoOmUxQLDk=;
        b=wo+lL5qjd6DVbUkBcBO2GtErK8Yl9YITq5hzLTlU/NgGTMgaPWX7E/VNxdNOoO+aH/abwY
        hHjqdscJs5sMfSDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D494013428;
        Tue, 29 Nov 2022 11:31:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id +u1HMpHthWNtaQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 29 Nov 2022 11:31:29 +0000
Date:   Tue, 29 Nov 2022 12:31:28 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] i2cdetect: display more functionality bits
 with '-F'
Message-ID: <20221129123128.06cf7b1d@endymion.delvare>
In-Reply-To: <20221119215646.6818-1-wsa+renesas@sang-engineering.com>
References: <20221119215646.6818-1-wsa+renesas@sang-engineering.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
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

Hi Wolfram,

On Sat, 19 Nov 2022 22:56:46 +0100, Wolfram Sang wrote:
> Original motivation was to add I2C_FUNC_SLAVE, so users can easily
> find out if their hardware supports being a target. While here, add
> HostNotify and 10-bit addressing as well.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Fine with me, with one request below.

> ---
> 
> Now, we could also add PROTOCOL_MANGLING and NO_START to have them all.
> But I am not sure if they are really helpful for users?
> 
>  tools/i2cdetect.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/i2cdetect.c b/tools/i2cdetect.c
> index 066ec82..54b78e2 100644
> --- a/tools/i2cdetect.c
> +++ b/tools/i2cdetect.c
> @@ -160,6 +160,12 @@ static const struct func all_func[] = {
>  	  .name = "I2C Block Write" },
>  	{ .value = I2C_FUNC_SMBUS_READ_I2C_BLOCK,
>  	  .name = "I2C Block Read" },
> +	{ .value = I2C_FUNC_SMBUS_HOST_NOTIFY,
> +	  .name = "SMBus HostNotify" },

I'm not a big fan of gluing words. "SMBus Host Notify" please.

> +	{ .value = I2C_FUNC_10BIT_ADDR,
> +	  .name = "10-bit addressing" },
> +	{ .value = I2C_FUNC_SLAVE,
> +	  .name = "Target mode" },
>  	{ .value = 0, .name = "" }
>  };
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks,
-- 
Jean Delvare
SUSE L3 Support
