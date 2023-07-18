Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 193C57574EA
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jul 2023 09:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbjGRHFi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jul 2023 03:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjGRHFh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jul 2023 03:05:37 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BDB71A2
        for <linux-i2c@vger.kernel.org>; Tue, 18 Jul 2023 00:05:36 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 3D4BB2189F;
        Tue, 18 Jul 2023 07:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1689663935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MZW7kbXNYVdFqLK94d+j1Zf0A0p7G+dJiSXWX2sRXAg=;
        b=U3KtkrIHUlFOUKXV/QHDzx3c68bv6FoPAYcpJJzxuXcuTm4r4q5Oo0+eN/JK/fslam3tLk
        s8ed/uIEqEqtHGtqj+N4igD7cmIpXVN9gBCV3hsqCVpqDLXi/RanKPkePdKoJajw2DV4bR
        Ob6k97VDxS30EuHXXL7iTER7QsGg30g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1689663935;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MZW7kbXNYVdFqLK94d+j1Zf0A0p7G+dJiSXWX2sRXAg=;
        b=ET34Tf3G4QfwJcdVa6uUpTwWdWCzK52qRkLtevZWsqyijBhRgmTGmbl0jokYLIkS3JnHhz
        h1IFQmG8QKc+ZcCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 22833134B0;
        Tue, 18 Jul 2023 07:05:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id mme3Br85tmRyGAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 18 Jul 2023 07:05:35 +0000
Date:   Tue, 18 Jul 2023 09:05:33 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: Read CPLD firmware version on Edgecore AS5114-48X
Message-ID: <20230718090533.533b4ff2@endymion.delvare>
In-Reply-To: <2fd078b9-e55d-7649-3231-3c587f5d4ec4@molgen.mpg.de>
References: <688ccf73-1205-6ee6-d8e5-5b18c8abd9c7@molgen.mpg.de>
        <20230624133214.48015fb6@endymion.delvare>
        <2fd078b9-e55d-7649-3231-3c587f5d4ec4@molgen.mpg.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Paul,

On Fri, 14 Jul 2023 12:57:33 +0200, Paul Menzel wrote:
> I updated the CPLD firmware to version 1.09 now, and to verify tried 
> your commands, but get an error:
> 
>      # i2cdump -f -y 0 0x40
>      No size specified (using byte-data access)
>           0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
>      00: 88 01 ff 07 0f cc cc cc cc cc cc cc cc cc cc cc    ??.?????????????
>      10: ff 03 3f cc 01 cc cc cc cc cc cc cc cc cc cc cc    .???????????????
>      20: ff cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc    .???????????????
>      30: 03 00 00 00 cc cc cc cc cc cc cc cc cc cc cc cc    ?...????????????
>      40: cc cc cc 0e cc cc cc cc cc cc cc cc cc cc cc cc    ????????????????
>      50: 0d 4a 03 00 7f cc cc cc cc cc cc cc cc cc cc cc    ?J?.????????????
>      60: 01 71 1e cc cc cc cc cc cc cc cc cc cc cc cc cc    ?q??????????????
>      70: 7f 7f 7f 7f 7f cc cc cc cc cc cc cc cc cc cc cc    ????????????????
>      80: 6a 69 69 69 68 cc cc cc cc cc cc cc cc cc cc cc    jiiih???????????
>      90: 02 00 71 71 cc cc cc cc cc cc cc cc cc cc cc cc    ?.qq????????????
>      a0: 00 00 00 00 00 00 f0 01 00 00 00 c0 cc cc cc cc    ......??...?????
>      b0: 00 00 00 00 00 00 00 00 00 00 00 00 cc cc cc cc    ............????
>      c0: 0f fe ff ff ff 3f 00 00 00 00 00 00 cc cc cc cc    ??...?......????
>      d0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc    ????????????????
>      e0: 00 71 cc cc cc cc cc cc cc cc cc cc cc cc cc 00    .q?????????????.
>      f0: 41 53 35 31 31 34 00 00 00 00 00 00 41 57 53 09    AS5114......AWS?
>      # i2cget 0 0x40 0x01 b
>      Error: Could not set address to 0x40: Device or resource busy
>      # i2cget 0 0x40 0xff b
>      Error: Could not set address to 0x40: Device or resource busy
> 
> Do you know, why i2cdump is able to read the date, but i2cget is not?

You already have a kernel driver bound to address 0x40, so you aren't
supposed to access it from user-space. You bypassed this check with
option -f you passed to i2cdump, but you did not pass option -f to
i2cget, which is why the former succeeded while the latter failed.

So either pass -f to i2cget, or unload the kernel driver
(arm64_accton_as4224_cpld) before reading the value from user-space.
Whichever option is safer depends on what happens when the system runs
without that driver. In theory it's better to unload the driver,
however depending on how the driver is implemented and whether reading
these values has any side effect on the hardware side, forcing the read
may be fine.

-- 
Jean Delvare
SUSE L3 Support
