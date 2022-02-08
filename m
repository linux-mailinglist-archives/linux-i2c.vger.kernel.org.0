Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8D44AD615
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 12:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354132AbiBHLWi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 06:22:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355551AbiBHJpj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 04:45:39 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A068C03FEC0;
        Tue,  8 Feb 2022 01:45:38 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 329DE1F383;
        Tue,  8 Feb 2022 09:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644313537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=phKy/GYR8AFrOcYtM7KfuK7BlbUn4X8F4JX+JrNNqQk=;
        b=c5r86d+mvOPETQEeH4ZvGpRU0TNuc5nbdOM6G6xscdL7XZWTbOhkkDLYcJPAzOA4kblFyK
        nMgb9yGYMbx5czOY/kfQqG5FSTZHwIFH7NpUQMSWJ22ZuwG6yPh3PYkyKFlvf8w1KRX1d7
        3DOBHCdLpBarcjAwbQGf7Djk4O9yBpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644313537;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=phKy/GYR8AFrOcYtM7KfuK7BlbUn4X8F4JX+JrNNqQk=;
        b=vSX94O3lmfcAJOzIgHi2dJwsx6/Lg+/9BtUjJ4mae/aaOa1XM+O7riDHeIR0Rr2U0pecOk
        cFMJWcT4eseWfaAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A5B8413BA0;
        Tue,  8 Feb 2022 09:45:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id K7nHJsA7AmKmZAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 08 Feb 2022 09:45:36 +0000
Date:   Tue, 8 Feb 2022 10:45:35 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Terry Bowman <terry.bowman@amd.com>, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v4 0/4] Watchdog: sp5100_tco: Replace cd6h/cd7h port I/O
 accesses with MMIO accesses
Message-ID: <20220208104535.468198f0@endymion.delvare>
In-Reply-To: <YgEYjOwoxtbkBdfq@shikoro>
References: <20220130191225.303115-1-terry.bowman@amd.com>
        <20220207134416.72c22504@endymion.delvare>
        <YgEYjOwoxtbkBdfq@shikoro>
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

On Mon, 7 Feb 2022 14:03:08 +0100, Wolfram Sang wrote:
> > Confirmed. I reviewed the 4 patches of this version of the series and
> > I'm fine with them. I also tested the result successfully on my laptop.
> > 
> > Reviewed-by: Jean Delvare <jdelvare@suse.de>
> > Tested-by: Jean Delvare <jdelvare@suse.de>  
> 
> Does that mean you are happy with the i2c-piix4 changes as well?

I'm still reviewing these, sorry. I only picked the first patch of the
series so that the sp5100_tco patches would build so I could test them.
I hope to be done by the end of the day.

-- 
Jean Delvare
SUSE L3 Support
