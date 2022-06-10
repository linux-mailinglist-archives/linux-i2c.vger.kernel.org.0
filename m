Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD32054685C
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jun 2022 16:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349575AbiFJOcP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jun 2022 10:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349396AbiFJObq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Jun 2022 10:31:46 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D8F144BD2
        for <linux-i2c@vger.kernel.org>; Fri, 10 Jun 2022 07:31:13 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id CB2EF1FF3F;
        Fri, 10 Jun 2022 14:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1654871471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dvPCt+5b61k7sd8PG3V71Dx+3cC1XdQbkLWioOdhWhQ=;
        b=TpiwZtCbCxwcExWlCNn3A4i1ue+bmgNjVkh8Ypw+mcbLSoHz4x0REuUtWOIaceFWGcHcmc
        LGDglClZpfFw2DmH3zUszFSWdMPLK+0Sx+oPaGoH3ZnUHtoIokJrSeAC1X+4t5vZ3P8qeQ
        GV3KTjspPkuu9yufJEO8X0tFjJLtQlA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1654871471;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dvPCt+5b61k7sd8PG3V71Dx+3cC1XdQbkLWioOdhWhQ=;
        b=UNxp8ltHbIfkXaU2p8BobPUCl42uT5CfMqWsQfTi20grirU2dQSVbxh7di6ZVIyjJ0KMg5
        uNCnMFvyIMjx3pBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC2B1139ED;
        Fri, 10 Jun 2022 14:31:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id T7lhKK9Vo2LWZAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 10 Jun 2022 14:31:11 +0000
Date:   Fri, 10 Jun 2022 16:31:10 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 8/8] i2c: i801: call i801_check_post() from
 i801_access()
Message-ID: <20220610163110.28d50ae6@endymion.delvare>
In-Reply-To: <9103e680-6436-42a3-d4be-39edf851aaf9@gmail.com>
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
        <9103e680-6436-42a3-d4be-39edf851aaf9@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Fri, 15 Apr 2022 18:59:46 +0200, Heiner Kallweit wrote:
> Avoid code duplication by calling i801_check_post() from i801_access().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)

Overall I like the idea. I only have one question to make sure I'm not
missing something.

> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 9061333f2..ecec7a3a8 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -432,7 +432,7 @@ static int i801_wait_intr(struct i801_priv *priv)
>  		busy = status & SMBHSTSTS_HOST_BUSY;
>  		status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
>  		if (!busy && status)
> -			return status;
> +			return status & STATUS_ERROR_FLAGS;
>  	} while (time_is_after_eq_jiffies(timeout));

Do I understand correctly that this change isn't really related to the
rest of the patch, and could have been done independently?

You are filtering out SMBHSTSTS_INTR simply because i801_check_post()
will never check it anyway, right? If so, I wonder if that's really
something we want to do, as ultimately this adds code with no
functional benefit just to be "cleaner". But please correct me if I'm
wrong.

-- 
Jean Delvare
SUSE L3 Support
