Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8373F7E27A6
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Nov 2023 15:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231820AbjKFOun (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Nov 2023 09:50:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231710AbjKFOum (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Nov 2023 09:50:42 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF32B6
        for <linux-i2c@vger.kernel.org>; Mon,  6 Nov 2023 06:50:39 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 7E5271FF4F;
        Mon,  6 Nov 2023 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1699282237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GvUjZoTXI8+cbGM/6xNhby9g33uqqSUneRKRlIGjVxo=;
        b=G7DoJVa74Mv/QR7UQWrWaEtQ8VQykfxMCXxk6a38XmSIkfxqjptxaQhWtOsxcVbaYxkJWm
        iKoj0FsC8/G29BBQrs0MW1espO8IElqqwgCpvKdjYwn1113z3r0E8GFSYFMYRc6C+yUJDx
        k+HZRlGApO9l2tdNc2k4fsXkLqkS1fE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1699282237;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GvUjZoTXI8+cbGM/6xNhby9g33uqqSUneRKRlIGjVxo=;
        b=ROBWYBISqrUXGzLRSajXbSw+eUy4WdGb0PLyT31ND2r9U0MJEdXpCVp5IgR8f+34qbdmCr
        OA6WJZlRvpEJz8Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 58624138F3;
        Mon,  6 Nov 2023 14:50:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id RNf+Ez39SGWRFgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 06 Nov 2023 14:50:37 +0000
Date:   Mon, 6 Nov 2023 15:50:36 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Use I2C_CLASS_HWMON for i2c mux children
Message-ID: <20231106155036.366fb752@endymion.delvare>
In-Reply-To: <45c5366f-cbee-4c7d-bb62-a446935b2729@gmail.com>
References: <45c5366f-cbee-4c7d-bb62-a446935b2729@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Tue, 31 Oct 2023 21:30:22 +0100, Heiner Kallweit wrote:
> In case there ever should be a jc42-driven device on a muxed child bus,
> we may end up with multiple logical devices, see linked discussion.
> 
> jc42 is the only remaining i2c client device driver supporting
> I2C_CLASS_SPD, however it supports I2C_CLASS_HWMON too. Therefore
> we can safely switch to I2C_CLASS_HWMON on the muxed child busses.
> IMO it's more logical anyway that the muxed child busses support
> the same class that the parent supports if it's not muxed.
> 
> This change is one further step towards removing I2C_CLASS_SPD.
> 
> Link: https://www.spinics.net/lists/linux-i2c/msg65458.html
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 070999139..8c9bb2e09 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1298,7 +1298,7 @@ static struct i801_mux_config i801_mux_config_asus_z8_d12 = {
>  	.gpio_chip = "gpio_ich",
>  	.values = { 0x02, 0x03 },
>  	.n_values = 2,
> -	.classes = { I2C_CLASS_SPD, I2C_CLASS_SPD },
> +	.classes = { I2C_CLASS_HWMON, I2C_CLASS_HWMON },
>  	.gpios = { 52, 53 },
>  	.n_gpios = 2,
>  };
> @@ -1307,7 +1307,7 @@ static struct i801_mux_config i801_mux_config_asus_z8_d18 = {
>  	.gpio_chip = "gpio_ich",
>  	.values = { 0x02, 0x03, 0x01 },
>  	.n_values = 3,
> -	.classes = { I2C_CLASS_SPD, I2C_CLASS_SPD, I2C_CLASS_SPD },
> +	.classes = { I2C_CLASS_HWMON, I2C_CLASS_HWMON, I2C_CLASS_HWMON },
>  	.gpios = { 52, 53 },
>  	.n_gpios = 2,
>  };
> @@ -1395,6 +1395,9 @@ static void i801_add_mux(struct i801_priv *priv)
>  
>  	mux_config = id->driver_data;
>  
> +	/* Parent and mux children class support must not overlap */
> +	priv->adapter.class = 0;

There may also be a hardware monitoring device on the parent segment on
these boards. With this change, that device will no longer be detected.
That would be a regression, so I have to nack this proposed change,
sorry.

The only way forward I can think of (if we want to get rid of
I2C_CLASS_SPD) would be to remove device auto-detection on children
segments completely (.class = 0 for them) and instead actively probe
for SPD EEPROMs and JC42 thermal sensors on these segments. For SPD we
should be able to just reuse i2c_register_spd(). For JC42 we would need
similar code, which doesn't exist yet.

-- 
Jean Delvare
SUSE L3 Support
