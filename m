Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2F04558B1
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 11:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245506AbhKRKOV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 05:14:21 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:55656 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244525AbhKRKMQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 05:12:16 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 45B0D212C6;
        Thu, 18 Nov 2021 10:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1637230154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ei8YRHTjBBV2VToJdnftuHJ5G2ywagNQmzDlRIoazC0=;
        b=HfMk1x5bCx9JZsbIXJHo0Ts84Y96yTNKq+KIG7+MwQi8V/Q5meJNbLZx46C6kRB7GZbr/B
        Lt/UaM/KB7SJTNBpBFiEYs3RLay9g74+E6bhkSC0Z0LYn8KXB+uyrV3oapOvNh0cYzroHQ
        ste/4fxZl+HJVNuukdZAFrpR1ADYe6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1637230154;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ei8YRHTjBBV2VToJdnftuHJ5G2ywagNQmzDlRIoazC0=;
        b=d284sstZbi8oxjUfxl67jc/vogqa5b1Wvtu54jSw5llYLAF8rljc2yv7xt6KgaXU8Sm8Wq
        9U2sb3NJgKl5BwAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F15013D17;
        Thu, 18 Nov 2021 10:09:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id SRBOAUomlmHWBgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 18 Nov 2021 10:09:14 +0000
Date:   Thu, 18 Nov 2021 11:09:12 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] 2c: i801: Improve handling of chip-specific feature
 definitions
Message-ID: <20211118110912.76b74cd3@endymion>
In-Reply-To: <89eb31f3-8544-35c6-7b15-920831746563@gmail.com>
References: <89eb31f3-8544-35c6-7b15-920831746563@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Mon, 08 Nov 2021 21:10:12 +0100, Heiner Kallweit wrote:
> Reduce source code and code size by defining the chip features
> statically.

While I don't like the PCI_DEVICE_DATA macro implementation (for it
breaks grepping for PCI defines), I generally enjoy more data and less
code. So I am fine with this change.

Jarkko, you are typically the one adding support for new devices to
this driver so this change will affect you. Are you OK with that change?

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> checkpatch complains about the format of the table but I think
> better readability justifies the formatting.

This approach has the drawback that we would have to modify all lines
if we ever need to add one line which is longer (which will inevitably
happen if we ever have to add a new feature to the driver).

I think you can make the table both readable and compliant. The
complaint is only about the space between the last parameter and the
closing parenthesis. You can still align the parameters vertically,
which is the only thing that really matters IMHO.

> ---
>  drivers/i2c/busses/i2c-i801.c | 191 ++++++++++++----------------------
>  1 file changed, 66 insertions(+), 125 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index f078e75dd..4c96f1b47 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -990,66 +990,72 @@ static const struct i2c_algorithm smbus_algorithm = {
>  	.functionality	= i801_func,
>  };
>  
> +#define DEF_FEATURES	(FEATURE_BLOCK_PROC | FEATURE_I2C_BLOCK_READ	| \

Not a good name ("default" isn't descriptive) and not consistent
either. I suggest "FEATURES_82801EB" instead, as this is the first
chipset which supported all these features. And you can make the
definitions of FEATURES_82801DB and FEATURES_82801EB consistent
(spacing/alignment).

> +			 FEATURE_IRQ | FEATURE_SMBUS_PEC		| \
> +			 FEATURE_BLOCK_BUFFER | FEATURE_HOST_NOTIFY)
> +#define FEATURES_82801DB	(FEATURE_SMBUS_PEC | FEATURE_BLOCK_BUFFER | \
> +				 FEATURE_HOST_NOTIFY)
> +
>  static const struct pci_device_id i801_ids[] = {
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801AA_3) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801AB_3) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801BA_2) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801CA_3) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801DB_3) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801EB_3) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ESB_4) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH6_16) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH7_17) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ESB2_17) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH8_5) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH9_6) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_EP80579_1) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH10_4) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICH10_5) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_5_3400_SERIES_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_COUGARPOINT_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PATSBURG_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PATSBURG_SMBUS_IDF0) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PATSBURG_SMBUS_IDF1) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PATSBURG_SMBUS_IDF2) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_DH89XXCC_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PANTHERPOINT_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LYNXPOINT_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_AVOTON_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS_MS0) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS_MS1) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS_MS2) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_COLETOCREEK_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_GEMINILAKE_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_WILDCATPOINT_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_WILDCATPOINT_LP_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_BAYTRAIL_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_BRASWELL_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_SUNRISEPOINT_H_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_SUNRISEPOINT_LP_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CDF_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_DNV_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_EBG_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_BROXTON_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LEWISBURG_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LEWISBURG_SSKU_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_KABYLAKE_PCH_H_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CANNONLAKE_H_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CANNONLAKE_LP_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICELAKE_LP_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICELAKE_N_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_COMETLAKE_H_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_COMETLAKE_V_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_TIGERLAKE_LP_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_TIGERLAKE_H_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALDER_LAKE_P_SMBUS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALDER_LAKE_M_SMBUS) },
> +	{ PCI_DEVICE_DATA(INTEL, 82801AA_3,		0				) },
> +	{ PCI_DEVICE_DATA(INTEL, 82801AB_3,		0				) },
> +	{ PCI_DEVICE_DATA(INTEL, 82801BA_2,		0				) },
> +	{ PCI_DEVICE_DATA(INTEL, 82801CA_3,		FEATURE_HOST_NOTIFY		) },
> +	{ PCI_DEVICE_DATA(INTEL, 82801DB_3,		FEATURES_82801DB		) },
> +	{ PCI_DEVICE_DATA(INTEL, 82801EB_3,		DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, ESB_4,			DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, ICH6_16,		DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, ICH7_17,		DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, ESB2_17,		DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, ICH8_5,		DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, ICH9_6,		DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, EP80579_1,		DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, ICH10_4,		DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, ICH10_5,		DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, 5_3400_SERIES_SMBUS,	DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, COUGARPOINT_SMBUS,	DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, PATSBURG_SMBUS,	DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, PATSBURG_SMBUS_IDF0,	DEF_FEATURES | FEATURE_IDF	) },
> +	{ PCI_DEVICE_DATA(INTEL, PATSBURG_SMBUS_IDF1,	DEF_FEATURES | FEATURE_IDF	) },
> +	{ PCI_DEVICE_DATA(INTEL, PATSBURG_SMBUS_IDF2,	DEF_FEATURES | FEATURE_IDF	) },
> +	{ PCI_DEVICE_DATA(INTEL, DH89XXCC_SMBUS,	DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, PANTHERPOINT_SMBUS,	DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, LYNXPOINT_SMBUS,	DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, LYNXPOINT_LP_SMBUS,	DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, AVOTON_SMBUS,		DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, WELLSBURG_SMBUS,	DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, WELLSBURG_SMBUS_MS0,	DEF_FEATURES | FEATURE_IDF	) },
> +	{ PCI_DEVICE_DATA(INTEL, WELLSBURG_SMBUS_MS1,	DEF_FEATURES | FEATURE_IDF	) },
> +	{ PCI_DEVICE_DATA(INTEL, WELLSBURG_SMBUS_MS2,	DEF_FEATURES | FEATURE_IDF	) },
> +	{ PCI_DEVICE_DATA(INTEL, COLETOCREEK_SMBUS,	DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, GEMINILAKE_SMBUS,	DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, WILDCATPOINT_SMBUS,	DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, WILDCATPOINT_LP_SMBUS,	DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, BAYTRAIL_SMBUS,	DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, BRASWELL_SMBUS,	DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, SUNRISEPOINT_H_SMBUS,	DEF_FEATURES | FEATURE_TCO_SPT	) },
> +	{ PCI_DEVICE_DATA(INTEL, SUNRISEPOINT_LP_SMBUS,	DEF_FEATURES | FEATURE_TCO_SPT	) },
> +	{ PCI_DEVICE_DATA(INTEL, CDF_SMBUS,		DEF_FEATURES | FEATURE_TCO_CNL	) },
> +	{ PCI_DEVICE_DATA(INTEL, DNV_SMBUS,		DEF_FEATURES | FEATURE_TCO_SPT	) },
> +	{ PCI_DEVICE_DATA(INTEL, EBG_SMBUS,		DEF_FEATURES | FEATURE_TCO_CNL	) },
> +	{ PCI_DEVICE_DATA(INTEL, BROXTON_SMBUS,		DEF_FEATURES			) },
> +	{ PCI_DEVICE_DATA(INTEL, LEWISBURG_SMBUS,	DEF_FEATURES | FEATURE_TCO_SPT	) },
> +	{ PCI_DEVICE_DATA(INTEL, LEWISBURG_SSKU_SMBUS,	DEF_FEATURES | FEATURE_TCO_SPT	) },
> +	{ PCI_DEVICE_DATA(INTEL, KABYLAKE_PCH_H_SMBUS,	DEF_FEATURES | FEATURE_TCO_SPT	) },
> +	{ PCI_DEVICE_DATA(INTEL, CANNONLAKE_H_SMBUS,	DEF_FEATURES | FEATURE_TCO_CNL	) },
> +	{ PCI_DEVICE_DATA(INTEL, CANNONLAKE_LP_SMBUS,	DEF_FEATURES | FEATURE_TCO_CNL	) },
> +	{ PCI_DEVICE_DATA(INTEL, ICELAKE_LP_SMBUS,	DEF_FEATURES | FEATURE_TCO_CNL	) },
> +	{ PCI_DEVICE_DATA(INTEL, ICELAKE_N_SMBUS,	DEF_FEATURES | FEATURE_TCO_CNL	) },
> +	{ PCI_DEVICE_DATA(INTEL, COMETLAKE_SMBUS,	DEF_FEATURES | FEATURE_TCO_CNL	) },
> +	{ PCI_DEVICE_DATA(INTEL, COMETLAKE_H_SMBUS,	DEF_FEATURES | FEATURE_TCO_CNL	) },
> +	{ PCI_DEVICE_DATA(INTEL, COMETLAKE_V_SMBUS,	DEF_FEATURES | FEATURE_TCO_SPT	) },
> +	{ PCI_DEVICE_DATA(INTEL, ELKHART_LAKE_SMBUS,	DEF_FEATURES | FEATURE_TCO_CNL	) },
> +	{ PCI_DEVICE_DATA(INTEL, TIGERLAKE_LP_SMBUS,	DEF_FEATURES | FEATURE_TCO_CNL	) },
> +	{ PCI_DEVICE_DATA(INTEL, TIGERLAKE_H_SMBUS,	DEF_FEATURES | FEATURE_TCO_CNL	) },
> +	{ PCI_DEVICE_DATA(INTEL, JASPER_LAKE_SMBUS,	DEF_FEATURES | FEATURE_TCO_CNL	) },
> +	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_S_SMBUS,	DEF_FEATURES | FEATURE_TCO_CNL	) },
> +	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_P_SMBUS,	DEF_FEATURES | FEATURE_TCO_CNL	) },
> +	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_M_SMBUS,	DEF_FEATURES | FEATURE_TCO_CNL	) },
>  	{ 0, }
>  };
>  
> @@ -1678,72 +1684,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	mutex_init(&priv->acpi_lock);
>  
>  	priv->pci_dev = dev;
> -	switch (dev->device) {
> -	case PCI_DEVICE_ID_INTEL_SUNRISEPOINT_H_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_SUNRISEPOINT_LP_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_LEWISBURG_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_LEWISBURG_SSKU_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_DNV_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_KABYLAKE_PCH_H_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_COMETLAKE_V_SMBUS:
> -		priv->features |= FEATURE_BLOCK_PROC;
> -		priv->features |= FEATURE_I2C_BLOCK_READ;
> -		priv->features |= FEATURE_IRQ;
> -		priv->features |= FEATURE_SMBUS_PEC;
> -		priv->features |= FEATURE_BLOCK_BUFFER;
> -		priv->features |= FEATURE_TCO_SPT;
> -		priv->features |= FEATURE_HOST_NOTIFY;
> -		break;
> -
> -	case PCI_DEVICE_ID_INTEL_CANNONLAKE_H_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_CANNONLAKE_LP_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_CDF_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_ICELAKE_LP_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_ICELAKE_N_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_COMETLAKE_H_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_TIGERLAKE_LP_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_TIGERLAKE_H_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_EBG_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_ALDER_LAKE_P_SMBUS:
> -	case PCI_DEVICE_ID_INTEL_ALDER_LAKE_M_SMBUS:
> -		priv->features |= FEATURE_BLOCK_PROC;
> -		priv->features |= FEATURE_I2C_BLOCK_READ;
> -		priv->features |= FEATURE_IRQ;
> -		priv->features |= FEATURE_SMBUS_PEC;
> -		priv->features |= FEATURE_BLOCK_BUFFER;
> -		priv->features |= FEATURE_TCO_CNL;
> -		priv->features |= FEATURE_HOST_NOTIFY;
> -		break;
> -
> -	case PCI_DEVICE_ID_INTEL_PATSBURG_SMBUS_IDF0:
> -	case PCI_DEVICE_ID_INTEL_PATSBURG_SMBUS_IDF1:
> -	case PCI_DEVICE_ID_INTEL_PATSBURG_SMBUS_IDF2:
> -	case PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS_MS0:
> -	case PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS_MS1:
> -	case PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS_MS2:
> -		priv->features |= FEATURE_IDF;
> -		fallthrough;
> -	default:
> -		priv->features |= FEATURE_BLOCK_PROC;
> -		priv->features |= FEATURE_I2C_BLOCK_READ;
> -		priv->features |= FEATURE_IRQ;
> -		fallthrough;
> -	case PCI_DEVICE_ID_INTEL_82801DB_3:
> -		priv->features |= FEATURE_SMBUS_PEC;
> -		priv->features |= FEATURE_BLOCK_BUFFER;
> -		fallthrough;
> -	case PCI_DEVICE_ID_INTEL_82801CA_3:
> -		priv->features |= FEATURE_HOST_NOTIFY;
> -		fallthrough;
> -	case PCI_DEVICE_ID_INTEL_82801BA_2:
> -	case PCI_DEVICE_ID_INTEL_82801AB_3:
> -	case PCI_DEVICE_ID_INTEL_82801AA_3:
> -		break;
> -	}
> +	priv->features = id->driver_data;
>  
>  	/* Disable features on user request */
>  	for (i = 0; i < ARRAY_SIZE(i801_feature_names); i++) {

Looks good to me, thanks.

-- 
Jean Delvare
SUSE L3 Support
