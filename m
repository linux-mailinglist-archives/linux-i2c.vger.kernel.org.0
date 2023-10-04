Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92D5B7B7827
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Oct 2023 08:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbjJDGuh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Oct 2023 02:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241425AbjJDGuh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Oct 2023 02:50:37 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C02AD
        for <linux-i2c@vger.kernel.org>; Tue,  3 Oct 2023 23:50:33 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 4140B21858;
        Wed,  4 Oct 2023 06:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1696402232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4Is/bqrDhxPJWpPQlg8oQ7RvwlW/5YJ6OUO2gKA6ABc=;
        b=ve9qglcBs4IEQGjWUU4IAz1L/MYMLHyH1Vcgfm0f+3nGI6nYZIBACXXwhaRiLwVCMwmNNY
        1wvlR6lBOs7/EXNPZCRADvR+s9IGrOEOwvYa83eZf+44/Xr6ugRV5RKg2hFw2k9cVxqm9J
        j5be7q2Jg4pb4NmXDydRniJIoaCwuqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1696402232;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4Is/bqrDhxPJWpPQlg8oQ7RvwlW/5YJ6OUO2gKA6ABc=;
        b=MRjg7HN2V3mfgmANtfKsCBErzkMWdfxwBcU53RSGFGgvDo5qmQ0BRjpVbFihxMF2cUUpKw
        a3SMUJNdyxy0QOBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C02D139F9;
        Wed,  4 Oct 2023 06:50:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id pzUoBTgLHWWwbAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 04 Oct 2023 06:50:32 +0000
Date:   Wed, 4 Oct 2023 08:50:30 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH] i2c: i801: Add support for Intel Birch Stream SoC
Message-ID: <20231004085030.6f23c08b@endymion.delvare>
In-Reply-To: <20231002082804.63339-1-jarkko.nikula@linux.intel.com>
References: <20231002082804.63339-1-jarkko.nikula@linux.intel.com>
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

On Mon, 02 Oct 2023 11:28:04 +0300, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Birch Stream SoC.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  Documentation/i2c/busses/i2c-i801.rst | 1 +
>  drivers/i2c/busses/Kconfig            | 1 +
>  drivers/i2c/busses/i2c-i801.c         | 3 +++
>  3 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
> index e76e68ccf718..10eced6c2e46 100644
> --- a/Documentation/i2c/busses/i2c-i801.rst
> +++ b/Documentation/i2c/busses/i2c-i801.rst
> @@ -47,6 +47,7 @@ Supported adapters:
>    * Intel Alder Lake (PCH)
>    * Intel Raptor Lake (PCH)
>    * Intel Meteor Lake (SOC and PCH)
> +  * Intel Birch Stream (SOC)
>  
>     Datasheets: Publicly available at the Intel website
>  
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 6644eebedaf3..97d27e01a6ee 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -158,6 +158,7 @@ config I2C_I801
>  	    Alder Lake (PCH)
>  	    Raptor Lake (PCH)
>  	    Meteor Lake (SOC and PCH)
> +	    Birch Stream (SOC)
>  
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-i801.
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index a485dc84d50a..1ff218d567b5 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -79,6 +79,7 @@
>   * Meteor Lake-P (SOC)		0x7e22	32	hard	yes	yes	yes
>   * Meteor Lake SoC-S (SOC)	0xae22	32	hard	yes	yes	yes
>   * Meteor Lake PCH-S (PCH)	0x7f23	32	hard	yes	yes	yes
> + * Birch Stream (SOC)		0x5796	32	hard	yes	yes	yes
>   *
>   * Features supported by this driver:
>   * Software PEC				no
> @@ -231,6 +232,7 @@
>  #define PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS		0x4da3
>  #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_P_SMBUS		0x51a3
>  #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_M_SMBUS		0x54a3
> +#define PCI_DEVICE_ID_INTEL_BIRCH_STREAM_SMBUS		0x5796
>  #define PCI_DEVICE_ID_INTEL_BROXTON_SMBUS		0x5ad4
>  #define PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_S_SMBUS		0x7a23
>  #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS		0x7aa3
> @@ -1038,6 +1040,7 @@ static const struct pci_device_id i801_ids[] = {
>  	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_P_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_SOC_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_PCH_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
> +	{ PCI_DEVICE_DATA(INTEL, BIRCH_STREAM_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ 0, }
>  };
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
