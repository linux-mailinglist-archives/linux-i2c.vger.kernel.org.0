Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2BBC4ADE28
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 17:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbiBHQTq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 11:19:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382974AbiBHQTp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 11:19:45 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB5EC061579;
        Tue,  8 Feb 2022 08:19:45 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id BC8FF1F383;
        Tue,  8 Feb 2022 16:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644337183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GIf2zFho4Sxk/tEjlY27tIR95Enmi/ydcgbRVDALqAs=;
        b=LfYkvuBx8JmP+5ga7pRD2fN7t297lYU37VEKxjoX7PGVLj6tuLKv9MUoR6Jr+jvEBkaooI
        zy2NwJj31hPtuIdMBSRpMuUSzi/RpMi7h8EWjEQGqOLJyTivpcilgovRP7ekqiOx1fRYg8
        G88K0NI/VbBmHtSblrD8uJCEmI1MZRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644337183;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GIf2zFho4Sxk/tEjlY27tIR95Enmi/ydcgbRVDALqAs=;
        b=ZmimtIw9vp4e/tTgLXcdDYoaPa1Y8Kdtt/+9qhjy581HECLqAeqJGUVVKYZy70lQYXhsIY
        eNugADZh948UA4AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D1E713CDC;
        Tue,  8 Feb 2022 16:19:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id fVRSDR+YAmJTQwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 08 Feb 2022 16:19:43 +0000
Date:   Tue, 8 Feb 2022 17:19:41 +0100
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
Subject: Re: [PATCH v4 8/9] i2c: piix4: Add EFCH MMIO support for SMBus port
 select
Message-ID: <20220208171941.18156714@endymion.delvare>
In-Reply-To: <20220130184130.176646-9-terry.bowman@amd.com>
References: <20220130184130.176646-1-terry.bowman@amd.com>
        <20220130184130.176646-9-terry.bowman@amd.com>
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

On Sun, 30 Jan 2022 12:41:29 -0600, Terry Bowman wrote:
> AMD processors include registers capable of selecting between 2 SMBus
> ports. Port selection is made during each user access by writing to
> FCH::PM::DECODEEN[smbus0sel]. Change the driver to use MMIO during
> SMBus port selection because cd6h/cd7h port I/O is not available on
> later AMD processors.
> 
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> ---
>  drivers/i2c/busses/i2c-piix4.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> (...)
> @@ -765,6 +774,7 @@ static int piix4_sb800_port_sel(u8 port)
>  
>  	return (smba_en_lo & piix4_port_mask_sb800);
>  }
> +
>  /*
>   * Handles access to multiple SMBus ports on the SB800.
>   * The port is selected by bits 2:1 of the smb_en register (0x2c).

We indeed want a blank line here, but it should be inserted in patch
[5/9] (which adds function piix4_sb800_port_sel), not in this patch.

-- 
Jean Delvare
SUSE L3 Support
