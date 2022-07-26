Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D25EA580ED2
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Jul 2022 10:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237797AbiGZIYF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Jul 2022 04:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbiGZIYE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Jul 2022 04:24:04 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9661F2E69A
        for <linux-i2c@vger.kernel.org>; Tue, 26 Jul 2022 01:24:03 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 48F4D1FA7D;
        Tue, 26 Jul 2022 08:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1658823842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i5ObdC8Erj/Ebl1j6V9Lb3HmD2tbN4I+gg58DNbTRG0=;
        b=NbLTjXRPG8wFlh3OCMor2kOHXn0shA/OvKfc6xW6MbNdxstYyKySgWyXf1gVTdKN1nvhol
        aO0u0y9oUANahrpzsyPqXPkeaZczxoTOQBp4v731HHkaiurh5h9KoOZBRsUPBN1tgPZiX+
        yIQemIP0xM2wEL4atJ4D1EVsZPG4BMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1658823842;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i5ObdC8Erj/Ebl1j6V9Lb3HmD2tbN4I+gg58DNbTRG0=;
        b=37Cg1ArVRQmXoNtCwASEK/6/C6/pDNasXtgmXrFax2YQtqdTzNZm7o8SVDFF/ZwvX1Tked
        MW0kCdN0J5IC8pCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 292B113A7C;
        Tue, 26 Jul 2022 08:24:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id BqliCKKk32IWBgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 26 Jul 2022 08:24:02 +0000
Date:   Tue, 26 Jul 2022 10:23:58 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Tommy Lee <tommyclee101908sun@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: gather_i2c_busses()
Message-ID: <20220726102358.3236e000@endymion.delvare>
In-Reply-To: <CAGJPcGaO1j57dZvRGR789m5HZ5s5tUaSomxKVGuhFhimQhGC5Q@mail.gmail.com>
References: <CAGJPcGaO1j57dZvRGR789m5HZ5s5tUaSomxKVGuhFhimQhGC5Q@mail.gmail.com>
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

Hi Tommy,

On Mon, 25 Jul 2022 18:00:55 -0700, Tommy Lee wrote:
> Hi Linux-i2c,

You got the list address wrong, I'm fixing it (it's a dash, not an
underscore).

> My platform is ASUS Vivobook e203 running Ubuntu 22.04 LTS. The i2c-tools
> src package I installed is 3.1.2. The make command works. But the
> "i2cdetect -l" execution gave me the following alert. I discovered that
> the /proc/bus/i2c used by the 3.1.2 gather_i2c_busses() has been moved
> to /sys/bus/i2c in Ubuntu22.04 LTS.

/proc/bus/i2c has not been replaced by /sys/bus/i2c in Ubuntu 22.04.
It's a changed that happened almost 2 decades ago. Even kernel 2.6.0
had it already.

> I replaced /proc/bus/i2c with
> /sys/bus/i2c in gather_i2c_busses() and replaced adapters[count].name with
> adapters->nr.  Running tools/i2cdetect shows 0 on adapters->nr.

That change makes no sense at all, so it's not surprising it doesn't
work.

The problem is that you are using i2c-tools-3.1 which is a legacy
branch that can only work with very old kernels. It is in maintenance
mode, hasn't received any development since 8 years and really nobody
should be using it any longer.

Why don't you just use i2c-tools version 4.3 which is already packaged
in your distribution?

-- 
Jean Delvare
SUSE L3 Support
