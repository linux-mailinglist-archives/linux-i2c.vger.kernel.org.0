Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28337740C01
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Jun 2023 10:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235118AbjF1I43 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Jun 2023 04:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234859AbjF1Ijr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Jun 2023 04:39:47 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 483ED3AB5
        for <linux-i2c@vger.kernel.org>; Wed, 28 Jun 2023 01:30:30 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id AD37B2185A;
        Wed, 28 Jun 2023 07:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1687936523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KbdxjMk4HcTa0+8crmoJQ3xR1RaqsSnVPQKBfNZCruw=;
        b=dsTb7q1h9s9weILrjxj+BVl4RlHp9DNt4SqnYe6wKTfaUnFaIo+W+PtRB1De3r5TCOi+Hs
        Bv+7btiJrPlrMXUIgE0SyxBDJyHAgL1KdWFEG2OV3U2NeecCIQomW+18cRmBmLV8fBhsmY
        PdFLFLXILV+b/rwMeDpBsho1xqTwEvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1687936523;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KbdxjMk4HcTa0+8crmoJQ3xR1RaqsSnVPQKBfNZCruw=;
        b=DcziV8BvyjE9TTr1KgLp61E1vZxMUQxvSAy3yE1AabkWnqPaSI+GEYKVD+oIWDpy9n/MVI
        RfNrq40CTtiBmFCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8DB1F138EF;
        Wed, 28 Jun 2023 07:15:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id of+rIAvem2TvMgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 28 Jun 2023 07:15:23 +0000
Date:   Wed, 28 Jun 2023 09:15:22 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 4/4] i2c: i801: Switch to new macro
 DEFINE_SIMPLE_DEV_PM_OPS
Message-ID: <20230628091522.3e58dfb2@endymion.delvare>
In-Reply-To: <1de49847-bb13-38b1-2820-15a7aa0fcb9a@gmail.com>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
        <1de49847-bb13-38b1-2820-15a7aa0fcb9a@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
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

On Sat, 04 Mar 2023 22:37:34 +0100, Heiner Kallweit wrote:
> By using the newer macro DEFINE_SIMPLE_DEV_PM_OPS we can get rid
> of the conditional compiling.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index e1350a8cc..bd2349768 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1800,7 +1800,6 @@ static void i801_shutdown(struct pci_dev *dev)
>  	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int i801_suspend(struct device *dev)
>  {
>  	struct i801_priv *priv = dev_get_drvdata(dev);
> @@ -1821,9 +1820,8 @@ static int i801_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
>  
> -static SIMPLE_DEV_PM_OPS(i801_pm_ops, i801_suspend, i801_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(i801_pm_ops, i801_suspend, i801_resume);
>  
>  static struct pci_driver i801_driver = {
>  	.name		= DRV_NAME,
> @@ -1832,7 +1830,7 @@ static struct pci_driver i801_driver = {
>  	.remove		= i801_remove,
>  	.shutdown	= i801_shutdown,
>  	.driver		= {
> -		.pm	= &i801_pm_ops,
> +		.pm	= pm_sleep_ptr(&i801_pm_ops),
>  		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  	},
>  };


Nice clean up.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
