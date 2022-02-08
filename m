Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 171C54ADE63
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 17:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383447AbiBHQdU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 11:33:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383341AbiBHQdT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 11:33:19 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC7A2C061578;
        Tue,  8 Feb 2022 08:33:18 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 96A8F1F387;
        Tue,  8 Feb 2022 16:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644337997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u43owrvzSj9UawIrEeKYAp8l6FlGjTpw15278c1XfMc=;
        b=EmR2kJsPExV8dKFPfLu6dBRYixqwL82rhl+nTw9H8emBQ39JMxEezlIPEFyqNiQXCD33US
        BT3epTEjGemsFFsBAdF71npwDVVJwbLY6mVYzj9gYtzkarHD6gkUKPFxay10GHCKYj36t0
        1dZkD2wkmRS0oMyZzRQcnAgqHKRLGAk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644337997;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u43owrvzSj9UawIrEeKYAp8l6FlGjTpw15278c1XfMc=;
        b=s4FMXkb4EsOyT64k8Slu804FYhI0z0RxoNg9R8n8/+0qOyH59dltWdgfj0FIplJ61pCmhQ
        41+J2mxM++eS/BCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 17DFA13CDC;
        Tue,  8 Feb 2022 16:33:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id IGY3BE2bAmIVSgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 08 Feb 2022 16:33:17 +0000
Date:   Tue, 8 Feb 2022 17:33:16 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>,
        <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <sudheesh.mavila@amd.com>, <Nehal-bakulchandra.Shah@amd.com>,
        <Basavaraj.Natikar@amd.com>, <Shyam-sundar.S-k@amd.com>,
        <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v4 9/9] i2c: piix4: Enable EFCH MMIO for Family 17h+
Message-ID: <20220208173316.403ec944@endymion.delvare>
In-Reply-To: <20220130184130.176646-10-terry.bowman@amd.com>
References: <20220130184130.176646-1-terry.bowman@amd.com>
        <20220130184130.176646-10-terry.bowman@amd.com>
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

Hi Terry,

On Sun, 30 Jan 2022 12:41:30 -0600, Terry Bowman wrote:
> Enable EFCH MMIO using check for SMBus PCI revision ID value 0x51 or
> greater. SMBus PCI revision ID 0x51 is first used by family 17h. This
> PCI revision ID check will also enable future AMD processors with the
> same EFCH SMBus controller HW.
> 
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> ---
>  drivers/i2c/busses/i2c-piix4.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index c5325cadaf55..6a9495d994bc 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -101,6 +101,8 @@
>  #define SB800_PIIX4_FCH_PM_ADDR			0xFED80300
>  #define SB800_PIIX4_FCH_PM_SIZE			8
>  
> +#define AMD_PCI_SMBUS_REVISION_MMIO		0x51
> +

I don't think that was worth a define. You only use the value once, in
a context where the symbolic name doesn't add much value IMHO.

-- 
Jean Delvare
SUSE L3 Support
