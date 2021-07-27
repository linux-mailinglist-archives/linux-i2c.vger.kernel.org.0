Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAFA43D7223
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jul 2021 11:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235897AbhG0Jie (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jul 2021 05:38:34 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:55780 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236061AbhG0Jid (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jul 2021 05:38:33 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 0BAE7200EE;
        Tue, 27 Jul 2021 09:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1627378713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+Xt9hi4/UZj4gR8/VnfLvUyivAdDeZdzGJ8HCx9GU7s=;
        b=XnATsOaEBTykGl0KOrhlK18ffokssa+nAKlvDQwGH/vTFgjE4jd1zI/I7WYcmFIlzvpFn6
        eZHhVP5QmYQHkyPZOoJO4fNLcl5M8odMM6KA39fo5ho0NcKrgiwLrOv47hrmcbrklIste9
        Pjsq/sF3TtWk2Lbn/54+d0XK1BKYNKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1627378713;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+Xt9hi4/UZj4gR8/VnfLvUyivAdDeZdzGJ8HCx9GU7s=;
        b=zmx9NyxUThNqeRQhfhhax7Ug8/PjjzBybb4xuDAS/v0KnIwdV7rYCWdfBlzZhnP4bqQC7s
        m+eosRq9WudeOFBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id C95EE133DE;
        Tue, 27 Jul 2021 09:38:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id yM/QLhjU/2CBNAAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Tue, 27 Jul 2021 09:38:32 +0000
Date:   Tue, 27 Jul 2021 11:38:29 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Fix handling SMBHSTCNT_PEC_EN
Message-ID: <20210727113829.408df3f7@endymion>
In-Reply-To: <bbcd6fe5-cb8d-1b85-7c1b-5ac57695f6f7@gmail.com>
References: <15db81d0-ddbd-b590-3996-51e588c5b10a@gmail.com>
        <20210721144620.00671c3d@endymion>
        <20210722103433.6c81c6b2@endymion>
        <bbcd6fe5-cb8d-1b85-7c1b-5ac57695f6f7@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 22 Jul 2021 22:02:37 +0200, Heiner Kallweit wrote:
> On 22.07.2021 10:34, Jean Delvare wrote:
> > Tested-by: Jean Delvare <jdelvare@suse.de>
>
> Thanks for the comprehensive explanation, Jean.
> Now that you added your Tested-by: Would you prefer that I send a v2 that
> incorporates your two smaller comments? Or is it ok as-is?

Please resubmit with my 2 comments addressed and including my Tested-by.
Then Wolfram can pick it up.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
