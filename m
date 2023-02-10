Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF93691A0A
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Feb 2023 09:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbjBJIaK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Feb 2023 03:30:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbjBJIaJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Feb 2023 03:30:09 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7F77B178
        for <linux-i2c@vger.kernel.org>; Fri, 10 Feb 2023 00:30:01 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 18CA23F98E;
        Fri, 10 Feb 2023 08:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676017800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u48XpeEGFAMX5hr8aDsYrIuuty1nzb4hOKwuZtO94bc=;
        b=Lj2O/rzYAWEn273tWRV4/G9FIDSqFeonpcZpWX9rNAnXBlHDrlP4wKNfryjacoBd/nHGez
        wn+bF28FwZtR1l7swZ232cnrNnBIYZdOuIlPE7TExk9nlJlvdd8qFwbgPcVaTCS64+zdDt
        djC1DhFQiDAEnMJ49kZjzZhadHf07RU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676017800;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u48XpeEGFAMX5hr8aDsYrIuuty1nzb4hOKwuZtO94bc=;
        b=ecSEPgdYAqUb+QqAIWeSh+a4YPwEVp4Zb0fiDSM4yvHXoqJg5LujZE/wwKF444xI1Rl42P
        CIE8FfTObuK6BrDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E0DAB13588;
        Fri, 10 Feb 2023 08:29:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id x901NYcA5mObCwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 10 Feb 2023 08:29:59 +0000
Date:   Fri, 10 Feb 2023 09:29:59 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 02/10] i2c: i801: make FEATURE_HOST_NOTIFY dependent
 on FEATURE_IRQ
Message-ID: <20230210092959.6cd27f3d@endymion.delvare>
In-Reply-To: <2f09691a-c0f5-4aa1-8338-1066c0a6c63d@gmail.com>
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
        <2f09691a-c0f5-4aa1-8338-1066c0a6c63d@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
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

On Mon, 19 Dec 2022 19:14:43 +0100, Heiner Kallweit wrote:
> Host notification uses an interrupt, therefore it makes sense only if
> interrupts are enabled. Make this dependency explicit by removing
> FEATURE_HOST_NOTIFY if FEATURE_IRQ isn't set.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - add a commit message part as comment to the code
> - make changed code cleaner
> ---
>  drivers/i2c/busses/i2c-i801.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
