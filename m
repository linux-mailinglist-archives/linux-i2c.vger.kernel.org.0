Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 409FE4ADB75
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 15:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351489AbiBHOp3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 09:45:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351484AbiBHOp2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 09:45:28 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8BCC03FED4;
        Tue,  8 Feb 2022 06:45:27 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 6EEFD1F387;
        Tue,  8 Feb 2022 14:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644331526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F8fCX7jpBJSdTGWVH6OOOBQBhn3uvoR/Uftrbxcu2D0=;
        b=gZUkN49ITaU744saGHPoaBrHxebr7OVW0K3A02xnMR0qLfJHWISh2ExbOqTgBd+pm7+txn
        TpHyxG9CeReB6H1Rq68OUBo+JGURds0H56Cnc9mfJ7JP5NtHwSNSsY5ZmZy7l+fMgxNzVy
        BrG5Pw30Bbd1nXt7jBrKLZZcCGdnkYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644331526;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F8fCX7jpBJSdTGWVH6OOOBQBhn3uvoR/Uftrbxcu2D0=;
        b=zF1lHTovq6sClWtl35NOT8VHMi1709bKDEzHdRe3pUQMftZY1A99N/+9uU95qZQpK6CO1F
        1xK69EzqDluIeSAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9CE413C79;
        Tue,  8 Feb 2022 14:45:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 0a1rMwWCAmI3DgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 08 Feb 2022 14:45:25 +0000
Date:   Tue, 8 Feb 2022 15:45:24 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
        <jdelvare@suse.com>, <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>,
        <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <sudheesh.mavila@amd.com>, <Nehal-bakulchandra.Shah@amd.com>,
        <Basavaraj.Natikar@amd.com>, <Shyam-sundar.S-k@amd.com>,
        <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v4 3/9] i2c: piix4: Move port I/O region request/release
 code into functions
Message-ID: <20220208154524.283609ad@endymion.delvare>
In-Reply-To: <20220130184130.176646-4-terry.bowman@amd.com>
References: <20220130184130.176646-1-terry.bowman@amd.com>
        <20220130184130.176646-4-terry.bowman@amd.com>
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

On Sun, 30 Jan 2022 12:41:24 -0600, Terry Bowman wrote:
> Move duplicated region request and release code into a function. Move is
> in preparation for following MMIO changes.
> 
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> ---
>  drivers/i2c/busses/i2c-piix4.c | 39 +++++++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index 3ff68967034e..5a98970ac60a 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -165,6 +165,24 @@ struct i2c_piix4_adapdata {
>  	u8 port;		/* Port number, shifted */
>  };
>  
> +static int piix4_sb800_region_request(struct device *dev)
> +{
> +	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE,
> +				  "sb800_piix4_smb")) {
> +		dev_err(dev,
> +			"SMBus base address index region 0x%x already in use.\n",
> +			SB800_PIIX4_SMB_IDX);
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
> +static void piix4_sb800_region_release(struct device *dev)
> +{
> +	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
> +}
> +
>  static int piix4_setup(struct pci_dev *PIIX4_dev,
>  		       const struct pci_device_id *id)
>  {
> @@ -270,6 +288,7 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
>  	unsigned short piix4_smba;
>  	u8 smba_en_lo, smba_en_hi, smb_en, smb_en_status, port_sel;
>  	u8 i2ccfg, i2ccfg_offset = 0x10;
> +	int retval;
>  
>  	/* SB800 and later SMBus does not support forcing address */
>  	if (force || force_addr) {
> @@ -291,20 +310,16 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
>  	else
>  		smb_en = (aux) ? 0x28 : 0x2c;
>  
> -	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE,
> -				  "sb800_piix4_smb")) {
> -		dev_err(&PIIX4_dev->dev,
> -			"SMB base address index region 0x%x already in use.\n",
> -			SB800_PIIX4_SMB_IDX);
> -		return -EBUSY;
> -	}
> +	retval = piix4_sb800_region_request(&PIIX4_dev->dev);
> +	if (retval)
> +		return retval;
>  
>  	outb_p(smb_en, SB800_PIIX4_SMB_IDX);
>  	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
>  	outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
>  	smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
>  
> -	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
> +	piix4_sb800_region_release(&PIIX4_dev->dev);
>  
>  	if (!smb_en) {
>  		smb_en_status = smba_en_lo & 0x10;
> @@ -685,9 +700,9 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
>  	u8 port;
>  	int retval;
>  
> -	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE,
> -				  "sb800_piix4_smb"))
> -		return -EBUSY;
> +	retval = piix4_sb800_region_request(&adap->dev);
> +	if (retval)
> +		return retval;
>  
>  	/* Request the SMBUS semaphore, avoid conflicts with the IMC */
>  	smbslvcnt  = inb_p(SMBSLVCNT);
> @@ -762,7 +777,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
>  		piix4_imc_wakeup();
>  
>  release:
> -	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
> +	piix4_sb800_region_release(&adap->dev);
>  	return retval;
>  }
>  

There's a third occurrence of request_muxed_region(SB800_PIIX4_SMB_IDX,
...) / release_region(SB800_PIIX4_SMB_IDX, ...) in function
piix4_setup_sb800. Any reason why you don't make use of the new helper
functions there as well?

OK, I see that this part of the code is specific to the original (ATI)
SB800, so it can't use MMIO, therefore you don't *have* to call the
helper functions. But for consistency, wouldn't it still make sense to
use them?

-- 
Jean Delvare
SUSE L3 Support
