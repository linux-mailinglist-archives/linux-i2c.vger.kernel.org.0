Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38143540149
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jun 2022 16:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245439AbiFGOYq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jun 2022 10:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235064AbiFGOYq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jun 2022 10:24:46 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A26522BFB
        for <linux-i2c@vger.kernel.org>; Tue,  7 Jun 2022 07:24:45 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id BA8701F916;
        Tue,  7 Jun 2022 14:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1654611883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6N5hco9Q+MRuxEu4pr8VC8arowNl1Y5z8EmozLafC2o=;
        b=s1MlmGHqXKMZBeLFu+GHxCC54Da6fQLK3A6gj+ZEhj4qLEHgVIaLKWswLEHmEB30wHlK/i
        HnD+/5HrOdUxsCDg90Ehx5LXJ1chg3iNUlmiQawoBMM++pVWILGVXWtVAUA4h6HsgeCh69
        YWsxwEyIlF1/W9gr51YlwKh0sW34fwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1654611883;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6N5hco9Q+MRuxEu4pr8VC8arowNl1Y5z8EmozLafC2o=;
        b=WY1DaM5XaeXUgOxCBCljkGJc7piekRrP2/CB2w1JPh5zeGKUwh0og8/2LHS7ZpMMZpXRCk
        sUeV2l2YS9whi/Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9B65213638;
        Tue,  7 Jun 2022 14:24:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id bCZrJKtfn2J/RAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 07 Jun 2022 14:24:43 +0000
Date:   Tue, 7 Jun 2022 16:24:42 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 4/8] i2c: i801: enable FEATURE_IRQ and
 FEATURE_I2C_BLOCK_READ on all chip versions
Message-ID: <20220607162442.7b618cca@endymion.delvare>
In-Reply-To: <1f81a126-11b4-aa22-1e2c-9824e0ad730c@gmail.com>
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
        <1f81a126-11b4-aa22-1e2c-9824e0ad730c@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Fri, 15 Apr 2022 18:56:30 +0200, Heiner Kallweit wrote:
> According to the datasheets interrupt mode and i2c block read are
> supported on all chip versions. Therefore set both feature flags for
> all chip versions.

While the datasheets do match your claims (I checked the 82801CAM aka
ICH3-M datasheet), I have a hard time believing we would have made the
feature device-dependent without a good reason (and I have vague
memories that there was a problem, although I can't find any proof of
that).

So I'll try to resurrect my old ICH3-M-based laptop and test these
changes on it. If I manage to get a Linux distribution to install on
that 20-year-old system...

> Note: Don't remove the two feature flags as such (at least for now),
> so that in case of a problem users can use the disable_features
> module parameter to disable a problematic feature.

Agreed.

-- 
Jean Delvare
SUSE L3 Support
