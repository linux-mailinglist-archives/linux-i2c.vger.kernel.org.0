Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B736B6031AD
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Oct 2022 19:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiJRRkA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Oct 2022 13:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbiJRRj7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Oct 2022 13:39:59 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9232727FF3;
        Tue, 18 Oct 2022 10:39:54 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 3A5B11FBA9;
        Tue, 18 Oct 2022 17:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1666114792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oOxaBIBN/0IDpvkVnRKGxynpe2/tl8CVR54+1XSWLSo=;
        b=Hi1FZSHxs7is/xzUg/KXNlIz3Ujbl2LzdZ3G/TZNi6iY50y+RIqcbRBQtFbAkeofXaS91+
        LKFZjJIadoU4wYz+HN7cWlvws0/XbIlwrN8V7xRdiqxMVTN46NvjEHBCkNPMY2QVkW6t0A
        7FNm77af/qNjyiEPdtsK4R0LF7r5erk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1666114792;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oOxaBIBN/0IDpvkVnRKGxynpe2/tl8CVR54+1XSWLSo=;
        b=Z+8vjvYSPo8MjLAKSqCNY48yEQJy96AnlVXJGKR6ch5P4BK3C9dss7IuKem0I3ExjyFaq4
        2MiHzcgTXtfZjUCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 07AEB139D2;
        Tue, 18 Oct 2022 17:39:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id O1QTO+fkTmMmHwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 18 Oct 2022 17:39:51 +0000
Date:   Tue, 18 Oct 2022 19:39:51 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Nam Cao <namcaov@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH] i2c: i801: add lis3lv02d's I2C address for Vostro 5568
Message-ID: <20221018193951.40787445@endymion.delvare>
In-Reply-To: <20221006145440.10281-1-namcaov@gmail.com>
References: <20221006145440.10281-1-namcaov@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 06 Oct 2022 16:54:40 +0200, Nam Cao wrote:
> Dell Vostro 5568 laptop has lis3lv02d, but its i2c address is not known
> to the kernel. Add this address.
> 
> Output of "cat /sys/devices/platform/lis3lv02d/position" on Dell Vostro
> 5568 laptop:
>     - Horizontal: (-18,0,1044)
>     - Front elevated: (522,-18,1080)
>     - Left elevated: (-18,-360,1080)
>     - Upside down: (36,108,-1134)
> 
> Signed-off-by: Nam Cao <namcaov@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index a176296f4fff..e46561e095c6 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1243,6 +1243,7 @@ static const struct {
>  	 */
>  	{ "Latitude 5480",      0x29 },
>  	{ "Vostro V131",        0x1d },
> +	{ "Vostro 5568",        0x29 },
>  };
>  
>  static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)

Fine with me.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Pali, OK with you?

-- 
Jean Delvare
SUSE L3 Support
