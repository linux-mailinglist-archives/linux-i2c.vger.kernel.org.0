Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C993A6B44
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jun 2021 18:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234577AbhFNQJP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Jun 2021 12:09:15 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:49252 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234521AbhFNQJP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Jun 2021 12:09:15 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id BF07D1FD29;
        Mon, 14 Jun 2021 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623686831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pjRCmxjI8qNfXkN0uYp2C22jgpbe55TovLuidHFgmvg=;
        b=iDxc8sa+FgtbEhV6Ke5Hj2YFFuh39ya/K19idtOcd3sugffXeDIQ1KfGo2/Q0FlutVTVkW
        0fZ7cJhP11e9tQFl3xK34M0VTsG01HlgeUZyPwv8IxfHKwmric2Myd+s35fLNfQ/VAFMAI
        UeN3uwfP1wKJaS+6Idue660j3je+iFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623686831;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pjRCmxjI8qNfXkN0uYp2C22jgpbe55TovLuidHFgmvg=;
        b=4mAnMdUtYKqvrXapHrbuqOWgpvPj3rdtLQQsaDhArMsfvQO02e5CeXtgVAoxs7WaIUVasR
        cKtVLty930qnaQDw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 8B7F0118DD;
        Mon, 14 Jun 2021 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623686831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pjRCmxjI8qNfXkN0uYp2C22jgpbe55TovLuidHFgmvg=;
        b=iDxc8sa+FgtbEhV6Ke5Hj2YFFuh39ya/K19idtOcd3sugffXeDIQ1KfGo2/Q0FlutVTVkW
        0fZ7cJhP11e9tQFl3xK34M0VTsG01HlgeUZyPwv8IxfHKwmric2Myd+s35fLNfQ/VAFMAI
        UeN3uwfP1wKJaS+6Idue660j3je+iFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623686831;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pjRCmxjI8qNfXkN0uYp2C22jgpbe55TovLuidHFgmvg=;
        b=4mAnMdUtYKqvrXapHrbuqOWgpvPj3rdtLQQsaDhArMsfvQO02e5CeXtgVAoxs7WaIUVasR
        cKtVLty930qnaQDw==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id NO8DIK9+x2B1OwAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Mon, 14 Jun 2021 16:07:11 +0000
Date:   Mon, 14 Jun 2021 18:07:10 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Simplify initialization of i2c_board_info in
 i801_probe_optional_slaves
Message-ID: <20210614180710.1a4b662e@endymion>
In-Reply-To: <c2c797f9-7c5c-9545-0cac-675a191c7e40@gmail.com>
References: <c2c797f9-7c5c-9545-0cac-675a191c7e40@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 25 May 2021 22:01:31 +0200, Heiner Kallweit wrote:
> Why shall we bother to open-code something that the compiler can do for us.

I don't know, maybe it wasn't supported by older versions of gcc?

Surprisingly, this makes the binary a tad larger. I wonder why.

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 9588d5bcf..0c08cfec5 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1291,11 +1291,11 @@ static void i801_probe_optional_slaves(struct i801_priv *priv)
>  		return;
>  
>  	if (apanel_addr) {
> -		struct i2c_board_info info;
> +		struct i2c_board_info info = {

Could be declared const now?

> +			.addr = apanel_addr,
> +			.type = "fujitsu_apanel"

We traditionally add a trailing comma on every line, so that adding a
line in the future will result in a smaller, more readable patch.

> +		};
>  
> -		memset(&info, 0, sizeof(struct i2c_board_info));
> -		info.addr = apanel_addr;
> -		strlcpy(info.type, "fujitsu_apanel", I2C_NAME_SIZE);
>  		i2c_new_client_device(&priv->adapter, &info);
>  	}
>  

Other than these minor details, no objection from me.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
