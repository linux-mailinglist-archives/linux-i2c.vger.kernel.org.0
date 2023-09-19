Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4C967A685B
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 17:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbjISPvq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 11:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233203AbjISPvp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 11:51:45 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51489C
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 08:51:38 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 8BE1E2293E;
        Tue, 19 Sep 2023 15:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695138697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yBkfSVtRD/b3J2naXvu+DrWYnNxyUuQRfuHFWK6czUo=;
        b=jXxsKOKTK7ml2n1LX48uSI+MnnxREOlhjslvHbUyzY4PNUjRcl3KwtQVx2ACEtVLsuGwX5
        3MKWEYJgP+17hyU2ooOQWW9q7ECJ+BFbq5xmlXXNVvMz4wrjtbdArTQdf4CSO46gWrlrPg
        khuxX9N6BTrBUPtFMeKy/q29tD2tgyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695138697;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yBkfSVtRD/b3J2naXvu+DrWYnNxyUuQRfuHFWK6czUo=;
        b=+UQ3EDMuf2GwTqmVIjGsC9IfyTfQLwhsa2nF/QuNfZ4mbJctnuXaf8zj0hR6brF3+cVoV5
        N/yhw3KBla2v1iAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6206F134F3;
        Tue, 19 Sep 2023 15:51:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 1pzyFYnDCWVVBwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 19 Sep 2023 15:51:37 +0000
Date:   Tue, 19 Sep 2023 17:51:35 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: simplify module boilerplate code
Message-ID: <20230919175135.70195b97@endymion.delvare>
In-Reply-To: <2f01722d-bb57-4645-8995-4bfebafe41ea@gmail.com>
References: <2f01722d-bb57-4645-8995-4bfebafe41ea@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 18 Sep 2023 14:16:58 +0200, Heiner Kallweit wrote:
> Simplify the module boilerplate code.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 811541797..6d02a8b88 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1847,16 +1847,11 @@ static struct pci_driver i801_driver = {
>  	},
>  };
>  
> -static int __init i2c_i801_init(void)
> +static int __init i2c_i801_init(struct pci_driver *drv)
>  {
>  	if (dmi_name_in_vendors("FUJITSU"))
>  		input_apanel_init();
> -	return pci_register_driver(&i801_driver);
> -}
> -
> -static void __exit i2c_i801_exit(void)
> -{
> -	pci_unregister_driver(&i801_driver);
> +	return pci_register_driver(drv);
>  }
>  
>  MODULE_AUTHOR("Mark D. Studebaker <mdsxyz123@yahoo.com>");
> @@ -1864,5 +1859,4 @@ MODULE_AUTHOR("Jean Delvare <jdelvare@suse.de>");
>  MODULE_DESCRIPTION("I801 SMBus driver");
>  MODULE_LICENSE("GPL");
>  
> -module_init(i2c_i801_init);
> -module_exit(i2c_i801_exit);
> +module_driver(i801_driver, i2c_i801_init, pci_unregister_driver);

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks,
-- 
Jean Delvare
SUSE L3 Support
