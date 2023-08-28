Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A59E78A63C
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Aug 2023 09:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjH1HBo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Aug 2023 03:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjH1HBR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Aug 2023 03:01:17 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A679E
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 00:01:13 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 80266219CD;
        Mon, 28 Aug 2023 07:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1693206072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FfzvH8IbPPXwfOoleHWJTY5IBI85wLwTjrP9d73Rc6o=;
        b=jtkbXlS1bnHwYLcxasUJDJXN+/QD8D+QJtm516c68Hh+JdQ87zzv9XSnazzU5p5ZrjisyD
        0M1FJ9QtayTaRlY3E97aL5+vb/0aR7HhKQaByAyYaNhOvesPjd8Ht3I0Pwr8R3HaUQUQra
        wvz8zPmm/2p/kkVH8MeWkIp98/rlhAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1693206072;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FfzvH8IbPPXwfOoleHWJTY5IBI85wLwTjrP9d73Rc6o=;
        b=dhGnZusf22KxWRkddIDS99U0GY0sPqEH+U0TwNY2qWWp8+suF95J1EEa5d7K9ZE5HsK2kL
        Nf5WgC5VN+T9BrCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62F3E139CC;
        Mon, 28 Aug 2023 07:01:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id PdSpFjhG7GSYBgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 28 Aug 2023 07:01:12 +0000
Date:   Mon, 28 Aug 2023 09:01:10 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/4] i2c: i801: Replace acpi_lock with I2C bus lock
Message-ID: <20230828090110.0cf57a00@endymion.delvare>
In-Reply-To: <e31596a9-2753-8528-9fed-5fb17de1d138@gmail.com>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
        <8f88906f-c7da-eb3a-2f14-0f4d46202517@gmail.com>
        <20230626195951.1695cda6@endymion.delvare>
        <e31596a9-2753-8528-9fed-5fb17de1d138@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Sun, 27 Aug 2023 18:21:43 +0200, Heiner Kallweit wrote:
> On 26.06.2023 19:59, Jean Delvare wrote:
> > Looks reasonable, I also can't see any reason why that wouldn't work.
> > But locking and power management can be tricky of course. I'll test
> > this for some time, but I don't think my system actually suffers from
> > this ACPI resource conflict, so this most probably won't be testing
> > much in practice.
>
> What's your opinion after more testing?

Positive, as I did not hit any problem. As said before, my testing is
limited by design and thus is no guarantee that the change is OK in all
cases, but at least it's good enough to merge it and see what happens.

-- 
Jean Delvare
SUSE L3 Support
