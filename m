Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B110F691A11
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Feb 2023 09:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbjBJIbI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Feb 2023 03:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbjBJIbI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Feb 2023 03:31:08 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660E0366B2
        for <linux-i2c@vger.kernel.org>; Fri, 10 Feb 2023 00:31:07 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 1DD9C607D2;
        Fri, 10 Feb 2023 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676017866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XGp/URTxQM2KA/Z1Uj2/C63H8Hqv5GCIu9y0XzRt2YY=;
        b=Ko1sab6Bh5w6VufoEB5uDNLsxIWXYJptG1xhl15ECP0Y16/9GO4kJQVf37APlvbTRfJQvJ
        M3LAWKFfCClBQyoGYu7ku2t/yyJmsYcO51Yk5TB15y2kbLsJVzXqwxPcggXdvX8AO6BjtE
        UqCyzzPA+4FHdJyr7iRIDLE1e9V5K6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676017866;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XGp/URTxQM2KA/Z1Uj2/C63H8Hqv5GCIu9y0XzRt2YY=;
        b=rDOHVxg2SR8Ilz0CghwRnpdSbvq3/Hu/xECl7oZLiMIbxNPmGIflLTdwRvvKcwDQxk3V8i
        iqrEYypcNyTy41Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E776113588;
        Fri, 10 Feb 2023 08:31:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id jx7mNskA5mNTDAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 10 Feb 2023 08:31:05 +0000
Date:   Fri, 10 Feb 2023 09:31:05 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 04/10] i2c: i801: add helper i801_set_hstadd()
Message-ID: <20230210093105.7501f185@endymion.delvare>
In-Reply-To: <042ba587-7428-5b44-56b3-061be22fd958@gmail.com>
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
        <042ba587-7428-5b44-56b3-061be22fd958@gmail.com>
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

On Mon, 19 Dec 2022 19:16:08 +0100, Heiner Kallweit wrote:
> Factor out setting SMBHSTADD to a helper. The current code makes the
> assumption that constant I2C_SMBUS_READ has bit 0 set, that's not ideal.
> Therefore let the new helper explicitly check for I2C_SMBUS_READ.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - change expressions for generating less binary code
> ---
>  drivers/i2c/busses/i2c-i801.c | 36 ++++++++++++++++-------------------
>  1 file changed, 16 insertions(+), 20 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
