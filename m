Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83AAF6919FB
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Feb 2023 09:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbjBJI2S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Feb 2023 03:28:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbjBJI2S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Feb 2023 03:28:18 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9CA776D23
        for <linux-i2c@vger.kernel.org>; Fri, 10 Feb 2023 00:28:15 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 4B63267194;
        Fri, 10 Feb 2023 08:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676017694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D0BqviMuHHGHaBki0gj4X4pYdQyeSpZFZ2eZT7IKNXM=;
        b=GOA6Jp3j2ZjivTqS39bH0jLexQfFb7TBrYxlHrgwGSH5nyIIrxo3IocYXBhPBnUwMt3mIa
        GWjWqUGLd3wdPjq8pK19yhPTJD0H4xa3q1XNtqNIF9vIPW9q3O31i5mZUHv+T7Umfpvcpa
        m2ioPUYse8CbdvlX3KJnnfPCo9yayqI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676017694;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D0BqviMuHHGHaBki0gj4X4pYdQyeSpZFZ2eZT7IKNXM=;
        b=VHEI1H334wR7D8OdC7sKUCXox3sMdMW4Zc4XEArAyhs0zNJFLw5Ntx3al215GbemesmIiE
        HTDa2bc7Y4moXdBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2411D13588;
        Fri, 10 Feb 2023 08:28:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id rZBfBx4A5mOGCgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 10 Feb 2023 08:28:14 +0000
Date:   Fri, 10 Feb 2023 09:28:12 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 01/10] i2c: i801: improve interrupt handler
Message-ID: <20230210092812.5d71d650@endymion.delvare>
In-Reply-To: <dbca2f66-c3ab-428d-74b1-70c472664bc9@gmail.com>
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
        <dbca2f66-c3ab-428d-74b1-70c472664bc9@gmail.com>
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

On Mon, 19 Dec 2022 19:13:44 +0100, Heiner Kallweit wrote:
> Not sure if it can happen, but better play safe: If SMBHSTSTS_BYTE_DONE
> and an error flag is set, then don't trust the result and skip calling
> i801_isr_byte_done(). In addition clear status bit SMBHSTSTS_BYTE_DONE
> in the main interrupt handler, this allows to simplify the code a
> little.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - change one expression for generating less binary code
> ---
>  drivers/i2c/busses/i2c-i801.c | 25 ++++++++-----------------
>  1 file changed, 8 insertions(+), 17 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
