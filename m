Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 392AC6D4D11
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 18:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232927AbjDCQEK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Apr 2023 12:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233165AbjDCQEH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Apr 2023 12:04:07 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05D43A91
        for <linux-i2c@vger.kernel.org>; Mon,  3 Apr 2023 09:03:59 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7371721EA4;
        Mon,  3 Apr 2023 16:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680537838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Wd+u1yf1R77IryAEXyI+n5U5EfjeOHqNfr0TXFEy3A8=;
        b=QsDEI8A4Ig/5+iFmgvACuPI/0OA1J71SRtvVUA7ZmHq6F32KZzXxhZBoBkQC18cvmKQHs6
        YgozgwlFmH1h03S5pj4u8Q/bIjSf40npWqAUJ3BHZ86E73ztX6Qr2DQ1UgNwghE0ga3/1S
        HZd/NEk8xrejy4/nYlmN8DkcKlKw9Us=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680537838;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Wd+u1yf1R77IryAEXyI+n5U5EfjeOHqNfr0TXFEy3A8=;
        b=o3yRWuk17m0cS58P8z/eb8FFHmN/8FTHe1MNF08iMu+VhYPbv1M283OgKy28grv5NxumSw
        Hk0L7OMfC2EThOAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 416A413416;
        Mon,  3 Apr 2023 16:03:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id fLlmDe74KmTWUQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 03 Apr 2023 16:03:58 +0000
Date:   Mon, 3 Apr 2023 18:03:57 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH 2/2] i2c: i801: Add support for Intel Meteor Lake PCH-S
Message-ID: <20230403180357.500a8867@endymion.delvare>
In-Reply-To: <20230330105502.4100351-2-jarkko.nikula@linux.intel.com>
References: <20230330105502.4100351-1-jarkko.nikula@linux.intel.com>
        <20230330105502.4100351-2-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jarkko,

On Thu, 30 Mar 2023 13:55:02 +0300, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Meteor Lake PCH-S. Also called as Meteor
> Point-S which is used in the code to distinguish from Meteor Lake-S SoC
> but call both as Meteor Lake in documentation and Kconfig.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  Documentation/i2c/busses/i2c-i801.rst | 2 +-
>  drivers/i2c/busses/Kconfig            | 2 +-
>  drivers/i2c/busses/i2c-i801.c         | 3 +++
>  3 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
> index ab9e850e8fe0..e62a62323f36 100644
> --- a/Documentation/i2c/busses/i2c-i801.rst
> +++ b/Documentation/i2c/busses/i2c-i801.rst
> @@ -46,7 +46,7 @@ Supported adapters:
>    * Intel Emmitsburg (PCH)
>    * Intel Alder Lake (PCH)
>    * Intel Raptor Lake (PCH)
> -  * Intel Meteor Lake (SOC)
> +  * Intel Meteor Lake (SOC/PCH)

I'm confused. The patch actually adds support for Meteor Point (S). So
shouldn't you add:
    * Intel Meteor Point (PCH)

instead of modifying the existing line?

>  
>     Datasheets: Publicly available at the Intel website
>  
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 9fa4a7bb5c8b..93bb71bdf64d 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -157,7 +157,7 @@ config I2C_I801
>  	    Emmitsburg (PCH)
>  	    Alder Lake (PCH)
>  	    Raptor Lake (PCH)
> -	    Meteor Lake (SOC)
> +	    Meteor Lake (SOC/PCH)

Ditto.

>  
  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-i801.
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 8172e2767b25..dca605d8cdc2 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -78,6 +78,7 @@
>   * Raptor Lake-S (PCH)		0x7a23	32	hard	yes	yes	yes
>   * Meteor Lake-P (SOC)		0x7e22	32	hard	yes	yes	yes
>   * Meteor Lake-S (SOC)		0xae22	32	hard	yes	yes	yes
> + * Meteor Point-S (PCH)		0x7f23	32	hard	yes	yes	yes
>   *
>   * Features supported by this driver:
>   * Software PEC				no
> @@ -234,6 +235,7 @@
>  #define PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_S_SMBUS		0x7a23
>  #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS		0x7aa3
>  #define PCI_DEVICE_ID_INTEL_METEOR_LAKE_P_SMBUS		0x7e22
> +#define PCI_DEVICE_ID_INTEL_METEOR_POINT_S_SMBUS	0x7f23
>  #define PCI_DEVICE_ID_INTEL_METEOR_LAKE_S_SMBUS		0xae22
>  #define PCI_DEVICE_ID_INTEL_LYNXPOINT_SMBUS		0x8c22
>  #define PCI_DEVICE_ID_INTEL_WILDCATPOINT_SMBUS		0x8ca2
> @@ -1041,6 +1043,7 @@ static const struct pci_device_id i801_ids[] = {
>  	{ PCI_DEVICE_DATA(INTEL, RAPTOR_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_P_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
> +	{ PCI_DEVICE_DATA(INTEL, METEOR_POINT_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ 0, }
>  };
>  

Rest looks good.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
