Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768FC41EC7E
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Oct 2021 13:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353836AbhJALs2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Oct 2021 07:48:28 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:48908 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353796AbhJALs1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Oct 2021 07:48:27 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id D769422687;
        Fri,  1 Oct 2021 11:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1633088802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P4uxIB98R+stt/QTIJwX/4Z/2H20gWZVyT2q0VHMFgI=;
        b=h7+fRH3E8naz8Unhr2gBiQbTb0xQtyej1ID6/WxVKSe3DV0EtKMAHRP4OWH2WUreKKJLrq
        CSYh8xyLjFVJBmLLG++Ai37miMiu+N3bL+tUnqR1kNFLFqjS5Vuy/5C1k6b0+X5SAvu/IQ
        bn0cPLm1QY41ynsOT5oR5Te78RauLC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1633088802;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P4uxIB98R+stt/QTIJwX/4Z/2H20gWZVyT2q0VHMFgI=;
        b=v3XKCyUJtaIsILRxL8R6pDpfP45X5ozZ/A7OdIip0ITSUiAk/ccWMK/o1b60vJ86BkXcel
        j0toL1l+fn7UBQAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8B7EC13C33;
        Fri,  1 Oct 2021 11:46:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id OrF4HyL1VmFNRAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 01 Oct 2021 11:46:42 +0000
Date:   Fri, 1 Oct 2021 13:46:15 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 8/9] i2c: i801: Improve
 register_dell_lis3lv02d_i2c_device
Message-ID: <20211001134615.587200e0@endymion>
In-Reply-To: <YVTIaJzdrNCYKgwV@kunai>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
        <3ce2ea87-809e-5999-e920-07ddd5fcc035@gmail.com>
        <YRPyUM/nGD3dQv9C@smile.fi.intel.com>
        <8ba091fd-b6ff-e800-1c46-aaf9992f1e03@gmail.com>
        <20210827182135.1d9670c0@endymion>
        <YVTIaJzdrNCYKgwV@kunai>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 29 Sep 2021 22:11:20 +0200, Wolfram Sang wrote:
> > I stand on my original position, let's stick to dmi_get_system_info() +
> > strcmp() as the driver did originally. In other words, don't change
> > code that has been working for years when the alternatives bring no
> > clear benefit.  
> 
> So, I can skip this patch and continue with patch 9?

Yes please. There may be a subset of it that can still be applied, we
can look into it once the dust has settled.

-- 
Jean Delvare
SUSE L3 Support
