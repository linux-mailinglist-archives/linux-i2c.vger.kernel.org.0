Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD0F7AECFA
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Sep 2023 14:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234586AbjIZMiM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Sep 2023 08:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjIZMiL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Sep 2023 08:38:11 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 877EBEB
        for <linux-i2c@vger.kernel.org>; Tue, 26 Sep 2023 05:38:04 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 3AF391F896;
        Tue, 26 Sep 2023 12:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695731880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cFojz7TPEVf9RWkXOkvYUldYB5/CcDYQ7m0z7WbGZ6M=;
        b=wMgOZ0QmE687cNVK2sHQa+mogQ2AwmWGyxeSqi95lcBZA0Q0w7pSmHo5Roz11Mr/8a3KnV
        dKjuk8+h719ai48cNd/GXxn7QQ0oifcTuooZq6j3zVssnaHz3/1J6EsrmxNj4ycNGBuLk+
        uIiLVP9Mpd4hQbBQcVW5iYL+Pykm5GQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695731880;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cFojz7TPEVf9RWkXOkvYUldYB5/CcDYQ7m0z7WbGZ6M=;
        b=TuqmiVgu0XdQEbPFmcFJWK0F66JwSxTmkds7nAR+XC5veD1VaU94EYHSQn1LBleIT/RRsB
        Bvkli0PcbOtUK7BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1AC3D13434;
        Tue, 26 Sep 2023 12:38:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 7qf7BKjQEmXCGQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 26 Sep 2023 12:38:00 +0000
Date:   Tue, 26 Sep 2023 14:37:59 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Amutha Krishnasamy" <amutha.krishnasamy@montage-tech.com>
Cc:     <linux-i2c@vger.kernel.org>
Subject: Re: How to build I2Ctools for OpenBMC
Message-ID: <20230926143759.66eeb323@endymion.delvare>
In-Reply-To: <009c01d9efe1$87f46080$97dd2180$@montage-tech.com>
References: <009c01d9efe1$87f46080$97dd2180$@montage-tech.com>
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

Hi Amutha,

On Mon, 25 Sep 2023 14:53:10 -0400, Amutha Krishnasamy wrote:
> This is Amutha Krishnasamy <https://github.com/amuthakrishnasamy>  from Montage technologies https://www.montage-tech.com/DDR5_SPD_PMIC_TS/M88SPD5118
> 
> Currently, I am working on adding Device authentication feature for eSPD(enhanced Serial Presence Detect) device which is under development. 
> 
> For this testing, I would like to know how to rebuild the i2c-tools https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/ (used in the openBMC source) and what are the tools used for this build. 
> 
> I tried to build i2ctools with https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads - x86_64 Linux hosted cross toolchains - AArch64 GNU/Linux target (aarch64-none-linux-gnu) arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz. 
> 
> This created a binary and when used the binary I could not execute and getting Execute format error. 
> 
> Please let me know if you have any info on how to build the i2ctools to run on EGS system. 

I can't help you with that, sorry. I have no experience with
cross-building binaries for embedded systems. I don't think your
problem is related to i2c-tools anyway, the tool chain used to build
binaries would be the same for any project written in C.

-- 
Jean Delvare
SUSE L3 Support
