Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83CC37CC708
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Oct 2023 17:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344192AbjJQPHx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Oct 2023 11:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344182AbjJQPHg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Oct 2023 11:07:36 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D1422D68
        for <linux-i2c@vger.kernel.org>; Tue, 17 Oct 2023 08:06:11 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 635CC21CE3;
        Tue, 17 Oct 2023 15:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1697555169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NXSmiAoh4V5IFrlGJgAK+J18R/xmU2/cTVSx2zsE0dY=;
        b=T3Otokcvc0X9rze36MK0PojsszDSeCYsTjX2zC/7Z//op4dAmMqxkZTIJXzGMoD7nereCA
        CpqI/yoYZHrEvuPrWs9IWOmz1VuJIGBDGVZH1Xs6LA0nJPJd9GPS5GjlJ7+Bvhz80WWb1E
        4XnLFq0Lq5ABGXoHYShe1DB6vVWeDGA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1697555169;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NXSmiAoh4V5IFrlGJgAK+J18R/xmU2/cTVSx2zsE0dY=;
        b=gYcDGYtArV35uGZVIJ9d1rHwz9s+6CwObF1T/KRUr+kLELt3Uf5WKQDBx/dqz2RekAfzoJ
        lG01CR818jSMcBBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C78813597;
        Tue, 17 Oct 2023 15:06:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 1SjlDOGiLmWMLQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 17 Oct 2023 15:06:09 +0000
Date:   Tue, 17 Oct 2023 17:06:08 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Simplify class-based client device
 instantiation
Message-ID: <20231017170608.3c385361@endymion.delvare>
In-Reply-To: <2192294e-99ab-4c7d-86b1-edff058d82f3@gmail.com>
References: <2192294e-99ab-4c7d-86b1-edff058d82f3@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
        none
X-Spam-Level: 
X-Spam-Score: -7.10
X-Spamd-Result: default: False [-7.10 / 50.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[3];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         NEURAL_HAM_LONG(-3.00)[-1.000];
         HAS_ORG_HEADER(0.00)[];
         DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
         NEURAL_HAM_SHORT(-1.00)[-1.000];
         FREEMAIL_TO(0.00)[gmail.com];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         RCVD_TLS_ALL(0.00)[];
         BAYES_HAM(-3.00)[100.00%]
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner, Andi,

On Tue, 10 Oct 2023 21:27:44 +0200, Heiner Kallweit wrote:
> Now that the legacy eeprom driver was removed, the only remaining i2c
> client driver with class SPD autodetection is jc42, and this driver
> supports also class HWMON. Therefore we can remove class SPD from the

I did not notice this change when it happened back in 2016. This broke
the i2c-i801 driver as a side effect, because the Asus-specific mux
code assumes that no I2C device driver can probe both the SMBus trunk
and the SMBus segments behind the muxes. This is done (as you must know
as this patch touches that part of the code) by ensuring that the trunk
and the muxed segments do not share any class flag. This was sufficient
as long as all device driver themselves only registered for one class,
but this is no longer the case of the jc42 driver.

So loading the jc42 driver on one of these Asus server board systems
would possibly result in multiple jc42 devices being instantiated for
the same underlying hardware device. The one instantiated on the trunk
would return incorrect values or errors depending on the mux setting.

Probably this went unnoticed because nobody was running such old server
boards when the change happened, or they would stick to older kernel
versions.

> supported classes of the i801 adapter driver.
> Legacy class-based instantiation shouldn't be used in new code, so I
> think we can remove also the generic logic that ensures that supported
> classes of parent and muxed adapters don't overlap.

Agreed. If we were to add support for a new server board with muxed
SMBus, we would disable class-based probing and instead explicitly
instantiate devices. To be honest, I don't know why we didn't do that
for the Asus Z8 series already, as I think it was already available,
and it would have made the code a lot more simple.

If anyone ever complains about the bug mentioned above, then we'll have
to do it anyway.

> Note: i801 parent supports just class HWMON now, and muxed childs

"children" ^^

> class SPD, so the supported classes don't overlap.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 38 +++++++----------------------------
>  1 file changed, 7 insertions(+), 31 deletions(-)
> (...)

Fine with me.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
