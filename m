Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE26B4B4DE2
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Feb 2022 12:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235833AbiBNLSe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Feb 2022 06:18:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350663AbiBNLSS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Feb 2022 06:18:18 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8954165828
        for <linux-i2c@vger.kernel.org>; Mon, 14 Feb 2022 02:51:26 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 33C561F38B;
        Mon, 14 Feb 2022 10:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644835885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PRX3IQG7OaJxoZrZ33FhHgSbfLUYDWQJ3Ke9IkgSTIA=;
        b=Ljlb0gnHKYjaHCrTBqkYq9ZR05z0z/nXOdaCWZ9p91B+vDZWPik33VcTZ20FzYKX1h6oPu
        ya35gl+TJ4vKsl9qaqZLwUSavwY0pk5HjdaoKhZZ80Swi5rux0zJMtxklgpEovIS0d4ePp
        77P9hClI0sWArrbEKHjo4Or8olr7V+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644835885;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PRX3IQG7OaJxoZrZ33FhHgSbfLUYDWQJ3Ke9IkgSTIA=;
        b=BpOSrZyXfA3ZFzRbG4gyS9qpj95rGQCuzEd4Wl2y7ChpOkXEm+5Un3RhDuFfmrZNwvJiXo
        WrPNtCfto+l2jIBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0E8B413AA7;
        Mon, 14 Feb 2022 10:51:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id gZnBAS00CmLLUAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 14 Feb 2022 10:51:25 +0000
Date:   Mon, 14 Feb 2022 11:51:23 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] i2c: i801: Add support for Intel Raptor Lake PCH-S
Message-ID: <20220214115123.1b16e1d8@endymion.delvare>
In-Reply-To: <20220211150001.1004004-1-jarkko.nikula@linux.intel.com>
References: <20220211150001.1004004-1-jarkko.nikula@linux.intel.com>
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

On Fri, 11 Feb 2022 17:00:01 +0200, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Raptor Lake PCH-S.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  Documentation/i2c/busses/i2c-i801.rst | 1 +
>  drivers/i2c/busses/Kconfig            | 1 +
>  drivers/i2c/busses/i2c-i801.c         | 3 +++
>  3 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
> index 42bbdd6e7fd8..cad59170b2ad 100644
> --- a/Documentation/i2c/busses/i2c-i801.rst
> +++ b/Documentation/i2c/busses/i2c-i801.rst
> @@ -45,6 +45,7 @@ Supported adapters:
>    * Intel Jasper Lake (SOC)
>    * Intel Emmitsburg (PCH)
>    * Intel Alder Lake (PCH)
> +  * Intel Raptor Lake (PCH)
>  
>     Datasheets: Publicly available at the Intel website
>  
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 42da31c1ab70..bce0dbb6fd86 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -148,6 +148,7 @@ config I2C_I801
>  	    Jasper Lake (SOC)
>  	    Emmitsburg (PCH)
>  	    Alder Lake (PCH)
> +	    Raptor Lake (PCH)
>  
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-i801.
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 7428cc6af5cc..36b086ef1378 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -75,6 +75,7 @@
>   * Alder Lake-S (PCH)		0x7aa3	32	hard	yes	yes	yes
>   * Alder Lake-P (PCH)		0x51a3	32	hard	yes	yes	yes
>   * Alder Lake-M (PCH)		0x54a3	32	hard	yes	yes	yes
> + * Raptor Lake-S (PCH)		0x7a23	32	hard	yes	yes	yes
>   *
>   * Features supported by this driver:
>   * Software PEC				no
> @@ -228,6 +229,7 @@
>  #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_P_SMBUS		0x51a3
>  #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_M_SMBUS		0x54a3
>  #define PCI_DEVICE_ID_INTEL_BROXTON_SMBUS		0x5ad4
> +#define PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_S_SMBUS		0x7a23
>  #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS		0x7aa3
>  #define PCI_DEVICE_ID_INTEL_LYNXPOINT_SMBUS		0x8c22
>  #define PCI_DEVICE_ID_INTEL_WILDCATPOINT_SMBUS		0x8ca2
> @@ -1041,6 +1043,7 @@ static const struct pci_device_id i801_ids[] = {
>  	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_P_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_M_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
> +	{ PCI_DEVICE_DATA(INTEL, RAPTOR_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ 0, }
>  };
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
