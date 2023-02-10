Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAD4D691A0D
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Feb 2023 09:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbjBJIaa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Feb 2023 03:30:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbjBJIa1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Feb 2023 03:30:27 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6540A80740
        for <linux-i2c@vger.kernel.org>; Fri, 10 Feb 2023 00:30:26 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 60250601DF;
        Fri, 10 Feb 2023 08:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676017824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mpRQYj3AwMj/hzxx5wJzzrP2HriBLzC01Q5qG1CLBgQ=;
        b=MIGxfzuJ4NrKLI6tc3y466iwKErLhUuH05XmAF9in45/js074jpmscxl28J9oWQulQe/h2
        Tal4iysEXbaq+voS6R3XXWoGvEr7CNB4oAChCMt7DrpITSb6EwBIkcdgVF94TyMCY0y8Mx
        ISEIpQzLej+vg0568sDsGk3Fq3TVvK8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676017824;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mpRQYj3AwMj/hzxx5wJzzrP2HriBLzC01Q5qG1CLBgQ=;
        b=bdXaRUZhZ9G5KdobiJ7gkTlYwX/p9KBr+cCZk3EJpgGZRyfI2WyuOdd/3jpOEO/iGUF1vo
        ikOQ1quJRKVhsnBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3823D13588;
        Fri, 10 Feb 2023 08:30:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id L1McDKAA5mP8CwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 10 Feb 2023 08:30:24 +0000
Date:   Fri, 10 Feb 2023 09:30:23 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 03/10] i2c: i801: make FEATURE_BLOCK_PROC dependent
 on FEATURE_BLOCK_BUFFER
Message-ID: <20230210093023.0cfda2e3@endymion.delvare>
In-Reply-To: <50f333a1-2f62-4a2d-5527-7a17eb49ec68@gmail.com>
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
        <50f333a1-2f62-4a2d-5527-7a17eb49ec68@gmail.com>
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

On Mon, 19 Dec 2022 19:15:25 +0100, Heiner Kallweit wrote:
> According to the datasheet the block process call requires block
> buffer mode. The user may disable block buffer mode by module
> parameter disable_features, in such a case we have to clear
> FEATURE_BLOCK_PROC.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - add a commit message part as comment to the code
> ---
>  drivers/i2c/busses/i2c-i801.c | 4 ++++
>  1 file changed, 4 insertions(+)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
