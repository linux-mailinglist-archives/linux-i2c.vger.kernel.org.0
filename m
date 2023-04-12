Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 645B66DFBEB
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Apr 2023 18:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbjDLQz1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Apr 2023 12:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbjDLQzZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Apr 2023 12:55:25 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668A576BB;
        Wed, 12 Apr 2023 09:54:54 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id F39951F45A;
        Wed, 12 Apr 2023 16:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1681318441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y3oK8+NZ9W31+D3KiPlvgxqacyEsrvj82VuSS/EYUb0=;
        b=dL/fTtEve1/zyl/crttEQwoPdRlkoZXrnk9ASPBt9fWwXV0OIcH+rd2f/I5tm4CdkQw13X
        NT5Bn87JEiDdAFdICNpHLDJGV2Uay/KwE6IvnXm5Sr4ZidRVOkuCOytQUih/IgeWFzCdN6
        k0rvua2D+zmaUFm6Xx9LeYCDpjghmAA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1681318441;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y3oK8+NZ9W31+D3KiPlvgxqacyEsrvj82VuSS/EYUb0=;
        b=cE5MNVsngV6FZv3URVMmQCmc2d3GUAywKfdLspJ5Wtyw5UGVfD/grxkczEimazRLtTSuP4
        HQrwceeuITHqaIDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C9907132C7;
        Wed, 12 Apr 2023 16:54:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 8Vh7LyjiNmQwWwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 12 Apr 2023 16:54:00 +0000
Date:   Wed, 12 Apr 2023 18:53:58 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Yazen Ghannam <yazen.ghannam@amd.com>
Cc:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <terry.bowman@amd.com>
Subject: Re: [PATCH] i2c: piix4: Print FCH::PM::S5_RESET_STATUS
Message-ID: <20230412185358.4d6427ce@endymion.delvare>
In-Reply-To: <20230407203720.18184-1-yazen.ghannam@amd.com>
References: <20230407203720.18184-1-yazen.ghannam@amd.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yazen,

On Fri, 07 Apr 2023 15:37:20 -0500, Yazen Ghannam wrote:
> The following register contains bits that indicate the cause for the
> previous reset.
> 
>         PMx000000C0 (FCH::PM::S5_RESET_STATUS)
> 
> This is helpful for debug, etc., and it only needs to be read once from
> a single FCH within the system. The register definition is AMD-specific.
> 
> Print it when the FCH MMIO space is first mapped. This register is not
> related to I2C functionality, but read it here to leverage the existing
> mapping.
> 
> Use an "info" log level so that it is printed every boot without requiring
> the user to enable debug messages. This is beneficial when debugging
> issues that cause spontaneous reboots and are hard to reproduce.
> 
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> ---
>  drivers/i2c/busses/i2c-piix4.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index 809fbd014cd6..043b29f1e33c 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -100,6 +100,7 @@
>  
>  #define SB800_PIIX4_FCH_PM_ADDR			0xFED80300
>  #define SB800_PIIX4_FCH_PM_SIZE			8
> +#define SB800_PIIX4_FCH_PM_S5_RESET_STATUS	0xC0
>  
>  /* insmod parameters */
>  
> @@ -200,6 +201,9 @@ static int piix4_sb800_region_request(struct device *dev,
>  
>  		mmio_cfg->addr = addr;
>  
> +		addr += SB800_PIIX4_FCH_PM_S5_RESET_STATUS;
> +		pr_info_once("S5_RESET_STATUS = 0x%08x", ioread32(addr));
> +
>  		return 0;
>  	}
>  

I'm skeptical. For one thing, the register you read is outside of the
mapped MMIO area. SB800_PIIX4_FCH_PM_SIZE is 8 which is less than 0xC0.

For another, printing an hexadecimal value which is AMD-specific is not
going to be really helpful in practice. Is there public documentation
available to decode the value?

Lastly, I can't see why this should happen in
piix4_sb800_region_request() which is going to called repeatedly at
runtime, rather than in piix4_setup_sb800_smba() which is only called
once when the driver is loaded. If this goes in the i2c-piix4 driver at
all... sp5100_tco might be more suitable as that driver is at least
somewhat related to system reset.

Looks like a hack really, and while I understand it is cheap, it would
seem cleaner to put that code in its own platform/x86 driver. Or
arch/x86/kernel/quirks.c maybe.

-- 
Jean Delvare
SUSE L3 Support
