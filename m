Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9C04AEAB8
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 08:04:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235638AbiBIHEL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 02:04:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235596AbiBIHEK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 02:04:10 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE184C0613CB;
        Tue,  8 Feb 2022 23:04:13 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 8AF6A1F390;
        Wed,  9 Feb 2022 07:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644390252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I1UxFXVDdtsCDjZgHFf5AxR7egC3Pit8xnNYveVWhAc=;
        b=j+9Jdm6onqPTFjKCVI/vgmxCixrmBCPIPSs9hcZJ6QhQyR2P2njU8D4k7eh+89C8Pm/AbO
        yXN75K04SjBYTM7YPgq4xjd1Apn/J9pdlCslZ6oqIFXDF6GkxP4OQFbUoSQiE3D/pVFvst
        iDB+sBufU64r0Ek4BR/FB4Aqrwfq9xc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644390252;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I1UxFXVDdtsCDjZgHFf5AxR7egC3Pit8xnNYveVWhAc=;
        b=Jp+95xuu4T8ipI1FBSyp5W5LN9QQESji3skTAg1hN2dQc6d2qagkl1dRhZu0585/ic2+eI
        faQEpSFsGgRBuXCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0149913487;
        Wed,  9 Feb 2022 07:04:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id FNi2OWtnA2L0fQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 09 Feb 2022 07:04:11 +0000
Date:   Wed, 9 Feb 2022 08:04:10 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <Terry.Bowman@amd.com>
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v4 0/9] i2c: piix4: Replace cd6h/cd7h port I/O accesses
 with MMIO accesses
Message-ID: <20220209080410.1e7dddd9@endymion.delvare>
In-Reply-To: <27e60021-30cb-3b1c-f429-2618bf891e5e@amd.com>
References: <20220130184130.176646-1-terry.bowman@amd.com>
        <20220208181114.180a99ba@endymion.delvare>
        <4ae57999-0f23-7578-008d-2009bc36d46b@amd.com>
        <20220208224653.6a62ba22@endymion.delvare>
        <27e60021-30cb-3b1c-f429-2618bf891e5e@amd.com>
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

On Tue, 8 Feb 2022 17:03:09 -0600, Terry Bowman wrote:
> On 2/8/22 15:46, Jean Delvare wrote:
> > If so, while there's indeed nothing to be done for the most recent
> > systems where only MMIO access is possible, you may still need to
> > enable MMIO access through legacy I/O if you try to use MMIO on
> > chipsets where both are possible. I'm not sure what exactly where you
> > set the limit. In the last patch you say that 0x51 is the first
> > revision of the family 17h CPUs, but is family 17h the first where MMIO
> > is available, or the first where legacy I/O isn't?
>
> Family 17h, SMBus PCI ID >= 0x51 is the first where cd6h/cd7h port I/O is disabled. 
> If SMBus PCI ID < 0x51 then cd6h/cd7h port I/O is used. 

OK, we are safe then :-)

-- 
Jean Delvare
SUSE L3 Support
