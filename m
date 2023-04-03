Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5336D4C01
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 17:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbjDCPeb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Apr 2023 11:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232870AbjDCPea (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Apr 2023 11:34:30 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 756F210F9
        for <linux-i2c@vger.kernel.org>; Mon,  3 Apr 2023 08:34:29 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 1FC0821E88;
        Mon,  3 Apr 2023 15:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680536068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aItC/lQiH9pa3kALSaXTNymbXGyBstlUwldTtIaSrC4=;
        b=UlrvLxJCPj0cy9QxqCIZP8O2uEgxf9u4KNoOruHLD/U3JYWy9qfZ63zlriTfqr4zLAk5Qi
        Rao2MefVPk0rRx8S8f08ie552Tga0oSJ2aGaR4xAvzkwW/FnajsRHCunTZ7mHq5MKb6PRt
        tRWHqfV8D7KgXvsMahVlELPGz0kXpxs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680536068;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aItC/lQiH9pa3kALSaXTNymbXGyBstlUwldTtIaSrC4=;
        b=eYyOW4Pz6g4qmcs7jqtHhshgcP4Ynh+DlydiDyrFwjgMQ0HlH6Yvz4LO5B/Pcb6f6hbCz8
        PGKtNDr6yduXBbCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EDD3C1331A;
        Mon,  3 Apr 2023 15:34:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Bcp4OAPyKmQvQAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 03 Apr 2023 15:34:27 +0000
Date:   Mon, 3 Apr 2023 17:34:26 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH 1/2] i2c: i801: Add support for Intel Meteor Lake-S SoC
Message-ID: <20230403173426.2cc3af2a@endymion.delvare>
In-Reply-To: <20230330105502.4100351-1-jarkko.nikula@linux.intel.com>
References: <20230330105502.4100351-1-jarkko.nikula@linux.intel.com>
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

On Thu, 30 Mar 2023 13:55:01 +0300, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Meteor Lake-S SoC South.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index ac5326747c51..8172e2767b25 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -77,6 +77,7 @@
>   * Alder Lake-M (PCH)		0x54a3	32	hard	yes	yes	yes
>   * Raptor Lake-S (PCH)		0x7a23	32	hard	yes	yes	yes
>   * Meteor Lake-P (SOC)		0x7e22	32	hard	yes	yes	yes
> + * Meteor Lake-S (SOC)		0xae22	32	hard	yes	yes	yes
>   *
>   * Features supported by this driver:
>   * Software PEC				no
> @@ -233,6 +234,7 @@
>  #define PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_S_SMBUS		0x7a23
>  #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS		0x7aa3
>  #define PCI_DEVICE_ID_INTEL_METEOR_LAKE_P_SMBUS		0x7e22
> +#define PCI_DEVICE_ID_INTEL_METEOR_LAKE_S_SMBUS		0xae22
>  #define PCI_DEVICE_ID_INTEL_LYNXPOINT_SMBUS		0x8c22
>  #define PCI_DEVICE_ID_INTEL_WILDCATPOINT_SMBUS		0x8ca2
>  #define PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS		0x8d22

Sorry for nitpicking but since 34b57f40a6a2 ("i2c: i801: sort IDs
alphabetically") this list is supposed to be sorted by ID.

> @@ -1038,6 +1040,7 @@ static const struct pci_device_id i801_ids[] = {
>  	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_M_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ PCI_DEVICE_DATA(INTEL, RAPTOR_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_P_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
> +	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ 0, }
>  };
>  

Other than that, looks good.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
