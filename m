Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC035EF95D
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Sep 2022 17:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235996AbiI2PpS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 11:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235532AbiI2Poh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 11:44:37 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4396118B26;
        Thu, 29 Sep 2022 08:43:37 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 677FD1F45B;
        Thu, 29 Sep 2022 15:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1664466216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XMX0opDW1weizrJ2O1PE0gj/yt969FsH/JBATNIMUIM=;
        b=qL3XVhT3qb2PpQ780oQUXZjYNd+SR1BvcVGQIl2dhi0Xz5qBu9OhSRAnJ5OSC4/DTXlNdf
        y5CYBalwWexyq3Ay9zrB5aLgqJb6488qywATviAyfF0SKdYlLiH/GyYL3KWvYS2eJgrVwL
        AQw1EoGi4xHOJwTDyBxKW8hQFOHFDkk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1664466216;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XMX0opDW1weizrJ2O1PE0gj/yt969FsH/JBATNIMUIM=;
        b=624bqGxSV2ZnMhq1xqNdIAA0AgYXjety9CvDgT4tz1vxMz1JLIeiF5nyUJGZM6BXeIx2OH
        vVW3N6pYX5chr9Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3182A1348E;
        Thu, 29 Sep 2022 15:43:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Ea+vCii9NWPXYwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 29 Sep 2022 15:43:36 +0000
Date:   Thu, 29 Sep 2022 17:43:34 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Mani Milani <mani@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] i2c: i801: Prefer async probe
Message-ID: <20220929174334.44d3e6d9@endymion.delvare>
In-Reply-To: <20220826074430.1333272-1-mani@chromium.org>
References: <20220826074430.1333272-1-mani@chromium.org>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mani,

On Fri, 26 Aug 2022 17:44:30 +1000, Mani Milani wrote:
> This i801 driver probe can take more than ~190ms in some devices, since
> the "i2c_register_spd()" call was added inside
> "i801_probe_optional_slaves()".

Is there anything special about this 190 ms value?

> Prefer async probe so that other drivers can be probed and boot can
> continue in parallel while this driver loads, to reduce boot time. There is
> no reason to block other drivers from probing while this driver is
> loading.
> 
> Signed-off-by: Mani Milani <mani@chromium.org>
> ---
> 
>  drivers/i2c/busses/i2c-i801.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index a176296f4fff..e06509edc5f3 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1838,6 +1838,7 @@ static struct pci_driver i801_driver = {
>  	.shutdown	= i801_shutdown,
>  	.driver		= {
>  		.pm	= &i801_pm_ops,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  	},
>  };
>  

Seems reasonable. I can't foresee any problem that would occur from
this change, and preliminary testing on my own workstation is OK.

Jarkko, Heiner, Wolfram, can you think of any reason why we should NOT
apply this change?

Thanks,
-- 
Jean Delvare
SUSE L3 Support
