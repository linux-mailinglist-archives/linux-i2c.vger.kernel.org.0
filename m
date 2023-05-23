Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0506C70E39C
	for <lists+linux-i2c@lfdr.de>; Tue, 23 May 2023 19:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238251AbjEWRgR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 May 2023 13:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238173AbjEWRgA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 May 2023 13:36:00 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4915DD
        for <linux-i2c@vger.kernel.org>; Tue, 23 May 2023 10:35:44 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 3972620313;
        Tue, 23 May 2023 17:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1684863343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=97HfQ/3fQtHeAe/n013fE4ytiLsFpLFNULDvrB4X9LY=;
        b=gUx9Q3WiRQT21tV3Zm4E56sjLo6mfri56tzzBxzwJw5Xh8vlWcsR2vAFL5xpR/TpWzTzZE
        7NegSEUDC65IbXq+ovwZEThCIlhYVKrYBWbu0LkbvkQlo2dzFM01XAuxdVkvsJC9Y6o/1y
        CqsQy7zAUh9wrFlQiYvoofKjpwyWocQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1684863343;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=97HfQ/3fQtHeAe/n013fE4ytiLsFpLFNULDvrB4X9LY=;
        b=Fyq+51IdXaa8m1rA9ybu2JSqFFrCg5kmnmTrdeoiiqQ9J/QnGMG3OGBYBOaAu5FT+FKwwQ
        BqvOUp9KTpdzbBBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1043313A10;
        Tue, 23 May 2023 17:35:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id WniAAm/5bGRaOAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 23 May 2023 17:35:43 +0000
Date:   Tue, 23 May 2023 19:35:42 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v3 3/3] i2c: i801: Add support for Intel Meteor Lake
 PCH-S
Message-ID: <20230523193542.7c8d5e59@endymion.delvare>
In-Reply-To: <20230512115001.81309-3-jarkko.nikula@linux.intel.com>
References: <20230512115001.81309-1-jarkko.nikula@linux.intel.com>
        <20230512115001.81309-3-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 12 May 2023 14:50:01 +0300, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Meteor Lake PCH-S.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> v3: Drop the idea to call this as Meteor Point-S in code since it's confusing.
>     Intel Meteor Lake-S platform can have the SMBus controller both in
>     SoC die and PCH. I decided earlier to call latter as Meteor Point-S since
>     it fitted nicely into i801_ids table and I saw it to be used somewhere in
>     internal documentation. But it's more historical naming convension for
>     PCHs and to be honest internal documentation uses mostly Meteor Lake PCH-S.
> v2: "SOC/PCH" -> "SOC and PCH" in documentation and Kconfig. PCI ID
>     define according to updated patch 1/2.
> ---
>  Documentation/i2c/busses/i2c-i801.rst | 2 +-
>  drivers/i2c/busses/Kconfig            | 2 +-
>  drivers/i2c/busses/i2c-i801.c         | 3 +++
>  3 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
> index ab9e850e8fe0..e76e68ccf718 100644
> --- a/Documentation/i2c/busses/i2c-i801.rst
> +++ b/Documentation/i2c/busses/i2c-i801.rst
> @@ -46,7 +46,7 @@ Supported adapters:
>    * Intel Emmitsburg (PCH)
>    * Intel Alder Lake (PCH)
>    * Intel Raptor Lake (PCH)
> -  * Intel Meteor Lake (SOC)
> +  * Intel Meteor Lake (SOC and PCH)
>  
>     Datasheets: Publicly available at the Intel website
>  
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 87600b4aacb3..3144ef99f040 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -157,7 +157,7 @@ config I2C_I801
>  	    Emmitsburg (PCH)
>  	    Alder Lake (PCH)
>  	    Raptor Lake (PCH)
> -	    Meteor Lake (SOC)
> +	    Meteor Lake (SOC and PCH)
>  
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-i801.
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index bc2576188e0a..943b8e6d026d 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -78,6 +78,7 @@
>   * Raptor Lake-S (PCH)		0x7a23	32	hard	yes	yes	yes
>   * Meteor Lake-P (SOC)		0x7e22	32	hard	yes	yes	yes
>   * Meteor Lake SoC-S (SOC)	0xae22	32	hard	yes	yes	yes
> + * Meteor Lake PCH-S (PCH)	0x7f23	32	hard	yes	yes	yes
>   *
>   * Features supported by this driver:
>   * Software PEC				no
> @@ -234,6 +235,7 @@
>  #define PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_S_SMBUS		0x7a23
>  #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS		0x7aa3
>  #define PCI_DEVICE_ID_INTEL_METEOR_LAKE_P_SMBUS		0x7e22
> +#define PCI_DEVICE_ID_INTEL_METEOR_LAKE_PCH_S_SMBUS	0x7f23
>  #define PCI_DEVICE_ID_INTEL_LYNXPOINT_SMBUS		0x8c22
>  #define PCI_DEVICE_ID_INTEL_WILDCATPOINT_SMBUS		0x8ca2
>  #define PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS		0x8d22
> @@ -1041,6 +1043,7 @@ static const struct pci_device_id i801_ids[] = {
>  	{ PCI_DEVICE_DATA(INTEL, RAPTOR_LAKE_S_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_P_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_SOC_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
> +	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_PCH_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ 0, }
>  };
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
