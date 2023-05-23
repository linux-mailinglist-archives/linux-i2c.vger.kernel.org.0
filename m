Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C20D70E33A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 May 2023 19:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238216AbjEWRgE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 May 2023 13:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238212AbjEWRf6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 May 2023 13:35:58 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0E9FA
        for <linux-i2c@vger.kernel.org>; Tue, 23 May 2023 10:35:32 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 47C63227C2;
        Tue, 23 May 2023 17:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1684863331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=51FEn24LcRnZGM3BmDMgqGxx3g3eOPN2gtWVOpFCiiM=;
        b=KMICYbMMdTHxSSv6P0Ha7bH3JU/mfT6YA7lIZWyMk2r3/M5OyXAf/qp/o/QT+a3WF//Vjk
        8iSLj9qlbzp6j8sA3xzY+5+I1QUJTskRFQCJln8sxfF7v7rUCUVPuVAvRpVylt86OexrgK
        oAEPg4Qj/vXWum9Bml2x5UGzZ3P2ayg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1684863331;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=51FEn24LcRnZGM3BmDMgqGxx3g3eOPN2gtWVOpFCiiM=;
        b=STBEPDL5qvKHgX0kh60JbwNPlNDHXvsc9hq1sc4MBVVWpVYM8IDiCnTBanQtLTKeIpHQZx
        CsQH8FrqtnT4wcAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 19C9F13A10;
        Tue, 23 May 2023 17:35:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id n6aNBGP5bGREOAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 23 May 2023 17:35:31 +0000
Date:   Tue, 23 May 2023 19:35:29 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v3 2/3] i2c: i801: Add support for Intel Meteor Lake
 SoC-S
Message-ID: <20230523193529.1a726c79@endymion.delvare>
In-Reply-To: <20230512115001.81309-2-jarkko.nikula@linux.intel.com>
References: <20230512115001.81309-1-jarkko.nikula@linux.intel.com>
        <20230512115001.81309-2-jarkko.nikula@linux.intel.com>
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

On Fri, 12 May 2023 14:50:00 +0300, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Meteor Lake SoC-S South.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> v3: Call this explicitly as Meteor Lake SoC-S SMBus controller for
>     distinguish from Meteor Lake PCH-S SMBus controller in patch 3/3.
> v2: Keep PCI ID define list sorted and define
>     PCI_DEVICE_ID_INTEL_METEOR_LAKE_S_SMBUS in correct place.
> ---
>  drivers/i2c/busses/i2c-i801.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 7431e8411e99..bc2576188e0a 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -77,6 +77,7 @@
>   * Alder Lake-M (PCH)		0x54a3	32	hard	yes	yes	yes
>   * Raptor Lake-S (PCH)		0x7a23	32	hard	yes	yes	yes
>   * Meteor Lake-P (SOC)		0x7e22	32	hard	yes	yes	yes
> + * Meteor Lake SoC-S (SOC)	0xae22	32	hard	yes	yes	yes
>   *
>   * Features supported by this driver:
>   * Software PEC				no
> @@ -250,6 +251,7 @@
>  #define PCI_DEVICE_ID_INTEL_KABYLAKE_PCH_H_SMBUS	0xa2a3
>  #define PCI_DEVICE_ID_INTEL_CANNONLAKE_H_SMBUS		0xa323
>  #define PCI_DEVICE_ID_INTEL_COMETLAKE_V_SMBUS		0xa3a3
> +#define PCI_DEVICE_ID_INTEL_METEOR_LAKE_SOC_S_SMBUS	0xae22
>  
>  struct i801_mux_config {
>  	char *gpio_chip;
> @@ -1038,6 +1040,7 @@ static const struct pci_device_id i801_ids[] = {
>  	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_M_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ PCI_DEVICE_DATA(INTEL, RAPTOR_LAKE_S_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_P_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
> +	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_SOC_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ 0, }
>  };
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
