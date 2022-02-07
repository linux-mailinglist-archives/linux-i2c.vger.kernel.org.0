Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B742F4AC448
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 16:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236479AbiBGPtg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 10:49:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383590AbiBGPlx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 10:41:53 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C314C0401C1
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 07:41:52 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 22EB4210F5;
        Mon,  7 Feb 2022 15:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644248511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6H1lczMww632+m9qnBiJrOgEx45yrdh71/qAEynzkmA=;
        b=uUXXv+sc20VPpPcXRQF07s4Y4ChwpJAaVFzqrUO4mVUrE7STCZYkUSo2UTK+3Rpub+WQ+2
        SSN35a/7/jSafEnwO1/SnWn8HVi6DrLeCuJV4tThQ2Nkj1tcgJw7tma7yZomJPwHumkdHV
        I9aSg4MBpU2fOkgIf47Dk+xqzjU0M2s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644248511;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6H1lczMww632+m9qnBiJrOgEx45yrdh71/qAEynzkmA=;
        b=vIJFbwSnCiqOU4VDPRhj4NsXk2QY0pUYzSdDJ+ZFoGCDSlFfUtDkw/s1DLSM4MtwGVUxtR
        SgD6pftumZDc7vCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0CB2613C41;
        Mon,  7 Feb 2022 15:41:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 5FltAb89AWLiawAAMHmgww
        (envelope-from <iivanov@suse.de>); Mon, 07 Feb 2022 15:41:51 +0000
Date:   Mon, 7 Feb 2022 17:41:50 +0200
From:   "Ivan T. Ivanov" <iivanov@suse.de>
To:     Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Phil Elwell <phil@raspberrypi.org>
Subject: Re: [PATCH] i2c: bcm2835: Set clock-stretch timeout to 35ms
Message-ID: <20220207154150.yigvhzjvskzzmqpu@suse>
References: <20220117102504.90585-1-iivanov@suse.de>
 <YfPHawUXJRPDHPmM@shikoro>
 <YgE3jMkzisFZFHb5@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgE3jMkzisFZFHb5@shikoro>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02-07 16:15, Wolfram Sang wrote:
> Date: Mon, 7 Feb 2022 16:15:24 +0100
> From: Wolfram Sang <wsa@kernel.org>
> To: "Ivan T. Ivanov" <iivanov@suse.de>, Florian Fainelli
>  <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
>  <sbranden@broadcom.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
>  linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Phil
>  Elwell <phil@raspberrypi.org>
> Subject: Re: [PATCH] i2c: bcm2835: Set clock-stretch timeout to 35ms
> Message-ID: <YgE3jMkzisFZFHb5@shikoro>
Tags: all arm i2c linux me ring rpi
> 
> 
> > By default, busses are I2C and not SMBus, so it looks like we should
> > finally apply this patch which disables CLKT:
> > 
> > http://patchwork.ozlabs.org/project/linux-i2c/patch/1519422151-6218-1-git-send-email-stefan.wahren@i2se.com/
> 
> I applied this now to for-current and added stable. That should avoid
> unwanted timeouts.

Thanks! Unfortunately reporter went silent after I have prepared for him
kernel package with _this_ patch [1], so it will be difficult to verify
above change on my side.

> 
> > If you really want the SMBus timeout applied, you can check for a
> > "smbus" property in DT and then set CLKT accordingly in a seperate
> > patch.
> 
> This still holds.

Sure, will keep it in mind.

Regards,
Ivan

[1] https://bugzilla.suse.com/show_bug.cgi?id=1192976

