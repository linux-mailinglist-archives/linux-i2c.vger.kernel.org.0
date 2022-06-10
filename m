Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E01E85467BD
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jun 2022 15:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344340AbiFJNxd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jun 2022 09:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349228AbiFJNxE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Jun 2022 09:53:04 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D803CA76
        for <linux-i2c@vger.kernel.org>; Fri, 10 Jun 2022 06:53:01 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id DA20C1FE9F;
        Fri, 10 Jun 2022 13:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1654869179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MABp0Hc0ijQaJbSoqpNDjvbZHbcEtWMyWUP1torJYBk=;
        b=tYu3Bd5XZpmIdLA92t91967WfQsqhufM8nK9lFczB5jTcTdLV0AeEu5Fnsl5gt/d1owdN/
        GVshKgLUnJujiUXtsXqNCa/cx9KkEBqH7i1Q7mlNgIUwNJU8v3kilNkCKa9HIdoSrC3MF6
        kft2QUG3JJ4O1B3xc4KARzdNH+M+nCA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1654869179;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MABp0Hc0ijQaJbSoqpNDjvbZHbcEtWMyWUP1torJYBk=;
        b=saUvBpf5frenHfFNSqI/w5uXTVmGBghldyFgwLNJArC4DbfH9sUYEFRPq0YLjS2Qhnlzh7
        ZCcjMxdLyVgU4AAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA661139ED;
        Fri, 10 Jun 2022 13:52:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Iz7LK7tMo2LCVAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 10 Jun 2022 13:52:59 +0000
Date:   Fri, 10 Jun 2022 15:52:58 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 7/8] i2c: i801: call i801_check_pre() from i801_access()
Message-ID: <20220610155258.0088dd7d@endymion.delvare>
In-Reply-To: <261bddb8-1a1e-13e9-8557-e4ad1c7f9826@gmail.com>
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
        <261bddb8-1a1e-13e9-8557-e4ad1c7f9826@gmail.com>
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

On Fri, 15 Apr 2022 18:58:40 +0200, Heiner Kallweit wrote:
> This avoids code duplication, in a next step we'll call
> i801_check_post() from i801_access() as well.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 8c2245f38..9061333f2 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -460,10 +460,6 @@ static int i801_transaction(struct i801_priv *priv, int xact)
>  	unsigned long result;
>  	const struct i2c_adapter *adap = &priv->adapter;
>  
> -	status = i801_check_pre(priv);
> -	if (status < 0)
> -		return status;
> -
>  	if (priv->features & FEATURE_IRQ) {
>  		reinit_completion(&priv->done);
>  		outb_p(xact | SMBHSTCNT_INTREN | SMBHSTCNT_START,
> @@ -647,10 +643,6 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>  	if (command == I2C_SMBUS_BLOCK_PROC_CALL)
>  		return -EOPNOTSUPP;
>  
> -	status = i801_check_pre(priv);
> -	if (status < 0)
> -		return status;
> -
>  	len = data->block[0];
>  
>  	if (read_write == I2C_SMBUS_WRITE) {
> @@ -851,6 +843,10 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  
>  	pm_runtime_get_sync(&priv->pci_dev->dev);
>  
> +	ret = i801_check_pre(priv);
> +	if (ret)
> +		goto out;
> +
>  	hwpec = (priv->features & FEATURE_SMBUS_PEC) && (flags & I2C_CLIENT_PEC)
>  		&& size != I2C_SMBUS_QUICK
>  		&& size != I2C_SMBUS_I2C_BLOCK_DATA;

Makes sense, thanks for the clean-up.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
