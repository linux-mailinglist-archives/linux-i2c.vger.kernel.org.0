Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88D8D6F5A8A
	for <lists+linux-i2c@lfdr.de>; Wed,  3 May 2023 17:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjECPBO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 May 2023 11:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbjECPBN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 May 2023 11:01:13 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E184C2F
        for <linux-i2c@vger.kernel.org>; Wed,  3 May 2023 08:01:11 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 1D9F91FE71;
        Wed,  3 May 2023 15:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1683126070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JAe2rbvBnZyXKlZIwWeG7WaZ9zu1Cf25BrcAPvDOG5w=;
        b=rHgCzefpsrXyJEBAJPPFAhWuUu9lJow8jAuHbzvCX5LCFd4/mCGKMdZGu+6dRF4Hs8UT7b
        CLGGcrk6GhsKI+TiK8BsEcu/U4m4g48d7oKS3W1gU1/S9HBaZllRnJuGcqHIO7RJJrqFL5
        RINK3ida+bLAOJKRF03OcUpVuIA4trA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1683126070;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JAe2rbvBnZyXKlZIwWeG7WaZ9zu1Cf25BrcAPvDOG5w=;
        b=/94wEJSVyOL1vk3yP4x3m8IUSpZFodP+8rrz4EbahD/89T5Vs+Dvkj1yzNA6qKbdfi63Qn
        kp2h6Ye+nicxK0CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA2121331F;
        Wed,  3 May 2023 15:01:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id iKd1NzV3UmRYVwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 03 May 2023 15:01:09 +0000
Date:   Wed, 3 May 2023 17:01:06 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v2 1/2] i2c: i801: Add support for Intel Meteor Lake-S
 SoC
Message-ID: <20230503170106.77183b4a@endymion.delvare>
In-Reply-To: <20230424105757.732150-1-jarkko.nikula@linux.intel.com>
References: <20230424105757.732150-1-jarkko.nikula@linux.intel.com>
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

On Mon, 24 Apr 2023 13:57:56 +0300, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Meteor Lake-S SoC South.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> v2: Keep PCI ID define list sorted and define
>     PCI_DEVICE_ID_INTEL_METEOR_LAKE_S_SMBUS in correct place.
> ---
>  drivers/i2c/busses/i2c-i801.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index ac5326747c51..86a1054ee9e4 100644
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
> @@ -250,6 +251,7 @@
>  #define PCI_DEVICE_ID_INTEL_KABYLAKE_PCH_H_SMBUS	0xa2a3
>  #define PCI_DEVICE_ID_INTEL_CANNONLAKE_H_SMBUS		0xa323
>  #define PCI_DEVICE_ID_INTEL_COMETLAKE_V_SMBUS		0xa3a3
> +#define PCI_DEVICE_ID_INTEL_METEOR_LAKE_S_SMBUS		0xae22
>  
>  struct i801_mux_config {
>  	char *gpio_chip;
> @@ -1038,6 +1040,7 @@ static const struct pci_device_id i801_ids[] = {
>  	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_M_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ PCI_DEVICE_DATA(INTEL, RAPTOR_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_P_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
> +	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>  	{ 0, }
>  };
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
