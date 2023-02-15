Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5A696981A4
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Feb 2023 18:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjBORJP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Feb 2023 12:09:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjBORJP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Feb 2023 12:09:15 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57EE27A9E
        for <linux-i2c@vger.kernel.org>; Wed, 15 Feb 2023 09:09:14 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 0FACB33A1E;
        Wed, 15 Feb 2023 17:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676480953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Un7Qq4/hZpjq8jaUeRZlxUJKf+mUClb3i/2R9xcuijc=;
        b=qGgGQ1s2LxaVQ9IhjCyXsMmdVYT1RcpLm6JSSmOBI+txnhEfGSMK3MTVIQ/Bo3Cqg2aJqT
        RSj5Cq4ZQOLM88pzDEIFVyn7CeQ7YYb0hwt6XSKJLProCdcfZepN825n5IhQsSf6vUS9bP
        nFSQuYYTJ7c3APkdbEjWhppSx4bxy4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676480953;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Un7Qq4/hZpjq8jaUeRZlxUJKf+mUClb3i/2R9xcuijc=;
        b=4DAbdfxNkDI76xUwIH0jvpf+QNJ92bhuvVqlsU1sGTkuXoxY9E9d7H3WqmuXXnA3eMPHar
        moZyvqNt6Im5LvCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E1EBB13483;
        Wed, 15 Feb 2023 17:09:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 7cF4NbgR7WOjUQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 15 Feb 2023 17:09:12 +0000
Date:   Wed, 15 Feb 2023 18:09:11 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 10/10] i2c: i801: call i801_check_post() from
 i801_access()
Message-ID: <20230215180911.329f9a9d@endymion.delvare>
In-Reply-To: <0a170b74-c105-7ca3-9811-a370c81462b8@gmail.com>
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
        <0a170b74-c105-7ca3-9811-a370c81462b8@gmail.com>
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

Hi Heiner,

On Mon, 19 Dec 2022 19:22:42 +0100, Heiner Kallweit wrote:
> Avoid code duplication by calling i801_check_post() from i801_access().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

So I'm done reviewing the series. I have also tested the result,
successfully, albeit my coverage is limited.

Patches 1-4 have been committed by Wolfram already. Patches 6, 7 and 8
have minor issues. I can take care of resubmitting if you want.

My suggested changes (renaming function parameters and storing the
original value of SMBAUXCTL) are better implemented on top of that
later (if you agree with them) so as to not delay this series even
further.

Thanks for your work,
-- 
Jean Delvare
SUSE L3 Support
