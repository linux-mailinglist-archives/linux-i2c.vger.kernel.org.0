Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83D7421600
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Oct 2021 20:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236921AbhJDSFC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Oct 2021 14:05:02 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:54102 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236395AbhJDSFB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Oct 2021 14:05:01 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id E01A822318;
        Mon,  4 Oct 2021 18:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1633370591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2j7p+nak7ES4/8hhXsilNsVPQWKlc06pxPGYYoaSqCY=;
        b=bvuUtLM9xcFtSEMGaoG7+OL4jAp47eNI9eCKs0EF044uGU4U91JvK7+0vNx6hKwUkZbFwz
        uf24E1rN8XyxMdH7TyYLVkXfcely+us3FFN23s94IuUbhzXe1zia79vSU5SSzAtaOvznri
        IWZxW43QHuAEvyydV5UxzrWQkJNE+YM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1633370591;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2j7p+nak7ES4/8hhXsilNsVPQWKlc06pxPGYYoaSqCY=;
        b=k8uPbQIdU92FvAV++sGL48cDZmKrBPSJuZN5nxmyQmcMESUuZJPo1shr1nOUSEl8Bunh8S
        Y/QumP2/r8i1U8DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B0C8613B42;
        Mon,  4 Oct 2021 18:03:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id xwB5KN9BW2G6XgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 04 Oct 2021 18:03:11 +0000
Date:   Mon, 4 Oct 2021 20:02:45 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Morten Linderud <morten@linderud.pw>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools] py-smbus/Module.mk: Install with PREFIX
 defined
Message-ID: <20211004200245.04d12431@endymion>
In-Reply-To: <20210919100851.2890107-1-morten@linderud.pw>
References: <20210919100851.2890107-1-morten@linderud.pw>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Morten,

On Sun, 19 Sep 2021 12:08:51 +0200, Morten Linderud wrote:
> If we are building to a defined destdir py-smbus is going to ignore this
> and try install to the actual root. This breaks packaging setups as the
> install section would fail.
> 
> Signed-off-by: Morten Linderud <morten@linderud.pw>
> ---
>  py-smbus/Module.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/py-smbus/Module.mk b/py-smbus/Module.mk
> index 04ceb64..1e2ded1 100644
> --- a/py-smbus/Module.mk
> +++ b/py-smbus/Module.mk
> @@ -22,7 +22,7 @@ clean-python:
>  	rm -rf py-smbus/build
>  
>  install-python:
> -	$(DISTUTILS) install
> +	$(DISTUTILS) install --prefix="$(PREFIX)"
>  
>  all: all-python
>  

Thanks for catching and fixing this. Applied.

-- 
Jean Delvare
SUSE L3 Support
