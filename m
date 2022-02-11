Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E62454B25DD
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 13:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350208AbiBKMex (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 07:34:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350126AbiBKMew (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 07:34:52 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C0DD52;
        Fri, 11 Feb 2022 04:34:52 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id B0F432113A;
        Fri, 11 Feb 2022 12:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644582890; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Lsj4xmsh6yxKtP87kDWGibCJDK9k1h0oIyMi36quyVI=;
        b=VAFp8wJfkekT8QvXDi08YWXmSFxGMO/GuwS7vdK1U3JMRX0GuoXzoTayIGjvh2AsjaPRNl
        +3nDfsyR2SEeLJWSXJUo1gKBicGIQm0Wkomvs+AHjl6AfR+fdQNOcwy945mEHFKWXa2Qzs
        ZlvWivunLQM4HwQfj4p+bobiu/7HozA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644582890;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Lsj4xmsh6yxKtP87kDWGibCJDK9k1h0oIyMi36quyVI=;
        b=JTQQYx86uzI5+u5JvLutEvDrVZblS5kEXIspjdYMd89Ya9Nm7Uw/lWo2DOMEHL8VKbzrQX
        RD/z9StIP0rKRrAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D78113C6D;
        Fri, 11 Feb 2022 12:34:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 3HNBCepXBmIjcgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 11 Feb 2022 12:34:50 +0000
Date:   Fri, 11 Feb 2022 13:34:49 +0100
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
Subject: Re: [PATCH v5 0/9] i2c: piix4: Replace cd6h/cd7h port I/O accesses
 with MMIO accesses
Message-ID: <20220211133449.332e5bca@endymion.delvare>
In-Reply-To: <20220209172717.178813-1-terry.bowman@amd.com>
References: <20220209172717.178813-1-terry.bowman@amd.com>
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

On Wed, 09 Feb 2022 11:27:08 -0600, Terry Bowman wrote:
> This series changes the piix4_smbus driver's cd6h/cd7h port I/O accesses
> to use MMIO instead. This is necessary because cd6h/cd7h port I/O may be
> disabled on later AMD processors.
> 
> This series includes patches with MMIO accesses to register
> FCH::PM::DECODEEN. The same register is also accessed by the sp5100_tco
> driver.[1] Synchronization to the MMIO register is required in both
> drivers.
> (...)

Except for the curly brace issue in patch 3, all looks good, so I
confirm my

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

on all i2c-piix4 patches.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
