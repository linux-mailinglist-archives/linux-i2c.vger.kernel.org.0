Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A75C777C15
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Aug 2023 17:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234252AbjHJPZS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Aug 2023 11:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235994AbjHJPZS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Aug 2023 11:25:18 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED9F26B6;
        Thu, 10 Aug 2023 08:25:17 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 22B8121835;
        Thu, 10 Aug 2023 15:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1691681116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8r0MrIgHThZwqqpV3b2m9bLyvubn7HrfmWuasmphbiM=;
        b=MTIoZIpjjGwnJVDh86TNXkVPejTGcbKjrKPkhbmvqU1zXSmOC7MmDHzXR1eUg5ykcMeg33
        s8h72m6hGlVxJ0ekf/nXIqQPLP2btkr63atueSlcyRZPiVNPVyCo6QLAu2N+t/R0B07Ib+
        O9nDMJfzzdNueB7zx7Hv81l0vTfWVl4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1691681116;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8r0MrIgHThZwqqpV3b2m9bLyvubn7HrfmWuasmphbiM=;
        b=CEHF4dpN5/RHVw+1Liym9a9Xq8jICf6me+Zha5Te+LQK26UPRnV5/VjaFlANaImgBd1ebF
        WXUai0JmyhlMV0Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5B61138E2;
        Thu, 10 Aug 2023 15:25:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id qO1sNlsB1WQPHwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 10 Aug 2023 15:25:15 +0000
Date:   Thu, 10 Aug 2023 17:25:14 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 08/22] i2c: i801: Remove #ifdef guards for PM related
 functions
Message-ID: <20230810172514.47c45be7@endymion.delvare>
In-Reply-To: <20230722115046.27323-9-paul@crapouillou.net>
References: <20230722115046.27323-1-paul@crapouillou.net>
        <20230722115046.27323-9-paul@crapouillou.net>
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

Hi Paul,

On Sat, 22 Jul 2023 13:50:32 +0200, Paul Cercueil wrote:
> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> ---
> Cc: Jean Delvare <jdelvare@suse.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 943b8e6d026d..73ae06432133 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1808,7 +1808,6 @@ static void i801_shutdown(struct pci_dev *dev)
>  	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int i801_suspend(struct device *dev)
>  {
>  	struct i801_priv *priv = dev_get_drvdata(dev);
> @@ -1827,9 +1826,8 @@ static int i801_resume(struct device *dev)
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
> @@ -1838,7 +1836,7 @@ static struct pci_driver i801_driver = {
>  	.remove		= i801_remove,
>  	.shutdown	= i801_shutdown,
>  	.driver		= {
> -		.pm	= &i801_pm_ops,
> +		.pm	= pm_sleep_ptr(&i801_pm_ops),
>  		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  	},
>  };

As far as I can see, this is the same as:

https://lore.kernel.org/linux-i2c/20230628091522.3e58dfb2@endymion.delvare/T/#mbd96bc42299e23f43ff1ebd56e61656882994afc

submitted by Heiner Kallweit back in March, review by myself in June,
but not applied yet. So:

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
