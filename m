Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF794B227E
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 10:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232699AbiBKJx0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 04:53:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232289AbiBKJx0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 04:53:26 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 801FEC4F;
        Fri, 11 Feb 2022 01:53:25 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 333EB1F3A2;
        Fri, 11 Feb 2022 09:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644573204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W62L88+zcZHOeh2jlIvhoTBCBvPlWiH1lU+vLtZUc/k=;
        b=KfZxou1t9z35AvGMqZANlog57oVxaQtBtsvqwxztAB1fhwLWbGh7WM+5ECf9wq+nAXyTve
        cFBOAHWHU7MrfxKBSaR9sGrpWv+sF25DH+hBtJhjSl+IXbg7iERdRAGsd9WaH8PyGtyicY
        AJvuBg9EmIS0t2QFry9FgeQYghC2xiY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644573204;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W62L88+zcZHOeh2jlIvhoTBCBvPlWiH1lU+vLtZUc/k=;
        b=6SzhxnS+9p6k94x5ix65ydYlTHFzYd+EVX0laWZF+8PPAbMYbkGK3XzaJ/skfzahZJkaTX
        cP+G+Y/coJsswMBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD8A313BC3;
        Fri, 11 Feb 2022 09:53:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 65POKBMyBmKBIAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 11 Feb 2022 09:53:23 +0000
Date:   Fri, 11 Feb 2022 10:53:22 +0100
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
Subject: Re: [PATCH v5 3/9] i2c: piix4: Move port I/O region request/release
 code into functions
Message-ID: <20220211105322.180ad89d@endymion.delvare>
In-Reply-To: <20220209172717.178813-4-terry.bowman@amd.com>
References: <20220209172717.178813-1-terry.bowman@amd.com>
        <20220209172717.178813-4-terry.bowman@amd.com>
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

On Wed, 09 Feb 2022 11:27:11 -0600, Terry Bowman wrote:
> Move duplicated region request and release code into a function. Move is
> in preparation for following MMIO changes.
> 
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> ---
>  drivers/i2c/busses/i2c-piix4.c | 48 ++++++++++++++++++++++------------
>  1 file changed, 31 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index 3ff68967034e..cc488b1e92c3 100644
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
> @@ -373,11 +388,10 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
>  			piix4_port_shift_sb800 = SB800_PIIX4_PORT_IDX_SHIFT;
>  		}
>  	} else {
> -		if (!request_muxed_region(SB800_PIIX4_SMB_IDX,
> -					  SB800_PIIX4_SMB_MAP_SIZE,
> -					  "sb800_piix4_smb")) {
> +		retval = piix4_sb800_region_request(&PIIX4_dev->dev);
> +		if (retval)

Missing curly brace here, breaks the build.

>  			release_region(piix4_smba, SMBIOSIZE);
> -			return -EBUSY;
> +			return retval;
>  		}
>  
>  		outb_p(SB800_PIIX4_PORT_IDX_SEL, SB800_PIIX4_SMB_IDX);
> @@ -387,7 +401,7 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
>  				       SB800_PIIX4_PORT_IDX;
>  		piix4_port_mask_sb800 = SB800_PIIX4_PORT_IDX_MASK;
>  		piix4_port_shift_sb800 = SB800_PIIX4_PORT_IDX_SHIFT;
> -		release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
> +		piix4_sb800_region_release(&PIIX4_dev->dev);
>  	}
>  
>  	dev_info(&PIIX4_dev->dev,
> @@ -685,9 +699,9 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
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
> @@ -762,7 +776,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
>  		piix4_imc_wakeup();
>  
>  release:
> -	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
> +	piix4_sb800_region_release(&adap->dev);
>  	return retval;
>  }
>  


-- 
Jean Delvare
SUSE L3 Support
