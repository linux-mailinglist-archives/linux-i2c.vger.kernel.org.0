Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFDF4ADD70
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 16:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382024AbiBHPtq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 10:49:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239907AbiBHPtm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 10:49:42 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84CAC061579;
        Tue,  8 Feb 2022 07:49:41 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 8DD151F387;
        Tue,  8 Feb 2022 15:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644335380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8/yyDEn0znQ6vifOgauLRJ+f9o0LDX3jTehpE1N4f20=;
        b=Ro4MgiR/TGmj4CCeQCMWf17cLE+9KyA5BN8HX4zVOiUaZJXRsJbYjkp51BA7knZzVvhxA2
        BDGx1eVq9xhduEnahtXAGEihTxzF9GOAE4YuwnL5+FDo8Nb9yj6DrL4gYXAxU5E9xBd0k2
        1YQRTKZLYZ6Q+2HiTTVSIOV2BonaCO4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644335380;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8/yyDEn0znQ6vifOgauLRJ+f9o0LDX3jTehpE1N4f20=;
        b=Xm3DHaRJYBsMgGfeUBVrT0tXJtWekeqP6gXV0NAfVZebgnMqTO6/hqox1JpscH4nMuAN1M
        rJSgsuQkjHb5baDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B20D13CDC;
        Tue,  8 Feb 2022 15:49:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id FKEUARSRAmKuMgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 08 Feb 2022 15:49:40 +0000
Date:   Tue, 8 Feb 2022 16:49:38 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>,
        <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <sudheesh.mavila@amd.com>, <Nehal-bakulchandra.Shah@amd.com>,
        <Basavaraj.Natikar@amd.com>, <Shyam-sundar.S-k@amd.com>,
        <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v4 6/9] i2c: piix4: Add EFCH MMIO support to region
 request and release
Message-ID: <20220208164938.512abe51@endymion.delvare>
In-Reply-To: <20220130184130.176646-7-terry.bowman@amd.com>
References: <20220130184130.176646-1-terry.bowman@amd.com>
        <20220130184130.176646-7-terry.bowman@amd.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Terry,

On Sun, 30 Jan 2022 12:41:27 -0600, Terry Bowman wrote:
> EFCH cd6h/cd7h port I/O may no longer be available on later AMD
> processors and it is recommended to use MMIO instead. Update the
> request and release functions to support MMIO.
> 
> MMIO request/release and mmapping require details during cleanup.
> Add a MMIO configuration structure containing resource and vaddress
> details for mapping the region, accessing the region, and releasing
> the region.
> 
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> ---
>  drivers/i2c/busses/i2c-piix4.c | 61 ++++++++++++++++++++++++++++++----
>  1 file changed, 55 insertions(+), 6 deletions(-)
> (...)
> @@ -880,6 +928,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
>  		return -ENOMEM;
>  	}
>  
> +	adapdata->mmio_cfg.use_mmio = 0;

Useless initialization, as the adapdata structure has just been zalloc'd.

>  	adapdata->smba = smba;
>  	adapdata->sb800_main = sb800_main;
>  	adapdata->port = port << piix4_port_shift_sb800;


-- 
Jean Delvare
SUSE L3 Support
