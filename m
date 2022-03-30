Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6E984ECA20
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Mar 2022 18:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349100AbiC3Q6L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Mar 2022 12:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349137AbiC3Q57 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Mar 2022 12:57:59 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B19393DB
        for <linux-i2c@vger.kernel.org>; Wed, 30 Mar 2022 09:56:09 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id D9A2D1F37B;
        Wed, 30 Mar 2022 16:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1648659367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8PVQAi/EmOG0MNuemUGLX3zdZCmEESGFXhHQ7wpUGN8=;
        b=ZGEukBPqOSbyYIXT+IrETnN99rXPhn17SIjsUVaaDmQDSwHxCQ3RXTT1E9l8sB9JIXZlGt
        IF4M9IzfWY7st0OkP7ZxIP9soSlvU2DXhu1dJEug0/4fdNPihkawgezc+qIp4rguBwKR6K
        ce0GNWhe2aQjgQsQALuHrWl8xHgxA5s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1648659367;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8PVQAi/EmOG0MNuemUGLX3zdZCmEESGFXhHQ7wpUGN8=;
        b=vSYXde2OBIo0PQmls2ToebTv+kRaxIoBUh4OJJO2XZoSpXV7Xxf1p4LnmIugVAjE0RyQ/E
        cmoymkhVpJZr6TBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B69FE13A60;
        Wed, 30 Mar 2022 16:56:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id RY3vKqeLRGK/PQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 30 Mar 2022 16:56:07 +0000
Date:   Wed, 30 Mar 2022 18:56:06 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools] i2cget: add mode character for SMBus block
 read to manpage
Message-ID: <20220330185606.0d6d0e94@endymion.delvare>
In-Reply-To: <20220330102028.36187-1-wsa+renesas@sang-engineering.com>
References: <20220330102028.36187-1-wsa+renesas@sang-engineering.com>
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

On Wed, 30 Mar 2022 12:20:28 +0200, Wolfram Sang wrote:
> The text was updated, but the mode character was forgotten.
> 
> Fixes: 789af53 ("i2cget: Add support for SMBus block read")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  tools/i2cget.8 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/i2cget.8 b/tools/i2cget.8
> index 83c6f7d..a836341 100644
> --- a/tools/i2cget.8
> +++ b/tools/i2cget.8
> @@ -49,7 +49,7 @@ an integer between 0x00 and 0xFF. If omitted, the currently active register
>  will be read (if that makes sense for the considered chip).
>  .PP
>  The \fImode\fR parameter, if specified, is one of the letters \fBb\fP,
> -\fBw\fP, \fBc\fP, or \fBi\fP, corresponding to a read byte data, a read
> +\fBw\fP, \fBc\fP, \fBs\fP, or \fBi\fP, corresponding to a read byte data, a read
>  word data, a write byte/read byte, an SMBus block read, or an I2C block read
>  transaction, respectively. A \fBp\fP can also be appended to the \fImode\fR
>  parameter to enable PEC, except for I2C block transactions. If the \fImode\fR

That's odd, but indeed it was forgotten. Thanks for noticing.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
