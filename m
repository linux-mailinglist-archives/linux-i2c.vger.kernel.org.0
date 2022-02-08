Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 230044ADC05
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 16:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236336AbiBHPJe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 10:09:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242199AbiBHPJd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 10:09:33 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6591AC061577;
        Tue,  8 Feb 2022 07:09:33 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 170821F383;
        Tue,  8 Feb 2022 15:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644332972; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=14+YAqkdK4axOiTegzrzO0E6aDxKTtVCtQylKKevsmg=;
        b=Pv5ZQnEblTD1n9al0SE+nO+a0N0C43bhFWhDSXPXCZOoYrNKhxnsSr87cKanmCpiE9fTNU
        4uUoF9iwN3IRvYoi/lcLk7AiJ8fdiMhr4p+qfxSmjt5cLh9SCMkLsgRVkTQbaf42Brn8cb
        J4xUCypQ8uovjyS8/VU8T0Z1Wet04LY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644332972;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=14+YAqkdK4axOiTegzrzO0E6aDxKTtVCtQylKKevsmg=;
        b=ZFvfnIqn21S7KTfLaC3j/sG3FwpaZb8GI07vOT8OSg7emFT0DsBlOabFhPK+iV2O8igL+B
        TAvq2r2BhgvLiMCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8920913CBF;
        Tue,  8 Feb 2022 15:09:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 9knWH6uHAmJ3GwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 08 Feb 2022 15:09:31 +0000
Date:   Tue, 8 Feb 2022 16:09:30 +0100
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
Subject: Re: [PATCH v4 4/9] i2c: piix4: Move SMBus controller base address
 detect into function
Message-ID: <20220208160930.4140ed73@endymion.delvare>
In-Reply-To: <20220130184130.176646-5-terry.bowman@amd.com>
References: <20220130184130.176646-1-terry.bowman@amd.com>
        <20220130184130.176646-5-terry.bowman@amd.com>
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

On Sun, 30 Jan 2022 12:41:25 -0600, Terry Bowman wrote:
>  static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
>  			     const struct pci_device_id *id, u8 aux)
>  {
> -	unsigned short piix4_smba;
> -	u8 smba_en_lo, smba_en_hi, smb_en, smb_en_status, port_sel;
> +	u8 smb_en, smb_en_status, port_sel;
>  	u8 i2ccfg, i2ccfg_offset = 0x10;
> +	unsigned short piix4_smba;
>  	int retval;
>  
>  	/* SB800 and later SMBus does not support forcing address */

I suggest not moving variables around unless there's a compelling to do
that. Else you make your patches larger (and slightly harder to
review), plus it increases the risks of context conflicts when
backporting other changes.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
