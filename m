Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 843536A07D2
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Feb 2023 12:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbjBWLzD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Feb 2023 06:55:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234106AbjBWLyj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Feb 2023 06:54:39 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7EE54A04
        for <linux-i2c@vger.kernel.org>; Thu, 23 Feb 2023 03:54:21 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 83BE05D0CC;
        Thu, 23 Feb 2023 11:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1677153260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4YP8F7a177Ox7LZktDXCuj6IZVeQ5ddwwppkpR2DcUo=;
        b=CpDOWShwDtqcbwDbAO3pJICDuhK540lTS1xJ45mWV2AHVSkq3cO95ti1XAhU4ck+ChWrKo
        6rTwKqdgl/iXCeNbCI0154jxsgOx2KnM7KEamVzDcFXTdRA+zBzEV0zDF0+JhC/8ydVHpw
        pIZ5kKPj8+g9NpPsJ4jOwGiptLDjuT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1677153260;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4YP8F7a177Ox7LZktDXCuj6IZVeQ5ddwwppkpR2DcUo=;
        b=T9a5URqjwixeDYak9IPcdtZIwK2Pj0Xc/7R2UqjdfbUNbDK6UGDorLedUGuWMrn2wWIEMz
        06cd1w13kFeqXKBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5D65313928;
        Thu, 23 Feb 2023 11:54:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id quHUFOxT92OTPAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 23 Feb 2023 11:54:20 +0000
Date:   Thu, 23 Feb 2023 12:54:19 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, "Poeche, Uwe" <uwe.poeche@siemens.com>
Subject: Re: [PATCH i2c-tools] i2cdetect: only use "newer" I2C_FUNC_* flags
 if they exist
Message-ID: <20230223125419.06a5cfc5@endymion.delvare>
In-Reply-To: <20230220140830.74180-1-wsa+renesas@sang-engineering.com>
References: <20230220140830.74180-1-wsa+renesas@sang-engineering.com>
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

On Mon, 20 Feb 2023 15:08:29 +0100, Wolfram Sang wrote:
> This allows i2cdetect to be compiled for older kernels.
> 
> Reported-by: "Poeche, Uwe" <uwe.poeche@siemens.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Jean, do you mind these #ifdefs in the code?
> 
>  tools/i2cdetect.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/i2cdetect.c b/tools/i2cdetect.c
> index 5ab4ea4..2d4d3b4 100644
> --- a/tools/i2cdetect.c
> +++ b/tools/i2cdetect.c
> @@ -160,12 +160,16 @@ static const struct func all_func[] = {
>  	  .name = "I2C Block Write" },
>  	{ .value = I2C_FUNC_SMBUS_READ_I2C_BLOCK,
>  	  .name = "I2C Block Read" },
> +#if defined(I2C_FUNC_SMBUS_HOST_NOTIFY)
>  	{ .value = I2C_FUNC_SMBUS_HOST_NOTIFY,
>  	  .name = "SMBus Host Notify" },
> +#endif
>  	{ .value = I2C_FUNC_10BIT_ADDR,
>  	  .name = "10-bit addressing" },
> +#if defined(I2C_FUNC_SLAVE)
>  	{ .value = I2C_FUNC_SLAVE,
>  	  .name = "Target mode" },
> +#endif
>  	{ .value = 0, .name = "" }
>  };
>  

No objection.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
