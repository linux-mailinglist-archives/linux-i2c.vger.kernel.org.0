Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62F627A36D3
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Sep 2023 19:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237087AbjIQReB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Sep 2023 13:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237055AbjIQRda (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Sep 2023 13:33:30 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB09129
        for <linux-i2c@vger.kernel.org>; Sun, 17 Sep 2023 10:33:25 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id E0C5B1F381;
        Sun, 17 Sep 2023 17:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1694972003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CEUWfU1pvFmc5kg0y2QosoUdD2EU6IElIkpDEfEu+Xk=;
        b=IATFNtJaUjYQdBT6mJDkSxOyjpRSTgq+eV1Oi5BQ/MxVJ72NaGdMZmJejDJI4WccEYY3Mr
        4XpiP5R4hkGkTnop7pn9QlUwlQh/NQvLVMWQKy3UPwHMRUQufJQxmuOPD+nwcmIwSL6oNS
        fpDxc0y1IJ+w2bytJX54q2Yf49E6Shw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1694972003;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CEUWfU1pvFmc5kg0y2QosoUdD2EU6IElIkpDEfEu+Xk=;
        b=OvMidSpbySqQb49ZkS43ZkUaIT+6nqdVTjqSA/ITtBsmTjoychCSbjDh/ROjVjWxppMhLy
        t9fnMjkibOJP68CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9599D134B2;
        Sun, 17 Sep 2023 17:33:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id wszNImM4B2WRIwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Sun, 17 Sep 2023 17:33:23 +0000
Date:   Sun, 17 Sep 2023 19:33:22 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Matt Fleming <matt.fleming@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] i2c: i801: unregister tco_pdev in i801_probe() error
 path
Message-ID: <20230917193322.4ec0aec7@endymion.delvare>
In-Reply-To: <458b1c8b-1885-6583-f45d-7548ce65bb33@gmail.com>
References: <458b1c8b-1885-6583-f45d-7548ce65bb33@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 14 Sep 2023 23:08:44 +0200, Heiner Kallweit wrote:
> We have to unregister tco_pdev also if i2c_add_adapter() fails.
> 
> Fixes: 9424693035a5 ("i2c: i801: Create iTCO device on newer Intel PCHs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index f53be242f..9bd712eaf 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1753,6 +1753,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  		"SMBus I801 adapter at %04lx", priv->smba);
>  	err = i2c_add_adapter(&priv->adapter);
>  	if (err) {
> +		platform_device_unregister(priv->tco_pdev);
>  		i801_acpi_remove(priv);
>  		return err;
>  	}

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
