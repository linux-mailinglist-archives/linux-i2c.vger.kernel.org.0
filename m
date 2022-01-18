Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25BE44925B8
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 13:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbiARMbr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 07:31:47 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:33478 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231536AbiARMbq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 07:31:46 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id D1FF2218A4;
        Tue, 18 Jan 2022 12:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1642509105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cwRblAcziohJnWF/VN+mhRc6dThcvAIeCfKUv5CoCC4=;
        b=VtddSOpI186ArRXCDNCQWrx8kVKoMGSkgbELLk8uPiPGiraU0VSHJT2+URYiwFIb/yjyld
        mSyWLi+E6yRh+AGMIM7SDr4am8tRytHvK5NWuqQkZE4Ps2W8SntjLbPXctwuRRVexJBRwD
        r29mrWkEq+IRbiIJNcD9pnbv6wfvaSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1642509105;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cwRblAcziohJnWF/VN+mhRc6dThcvAIeCfKUv5CoCC4=;
        b=XZcr5CSpXmm2UZMoStVAEjl4V40tJpUmWoe6x0kcp0T6xemV2VVdlsGNZMVTmWU+A5SoSf
        BwyxrvzgSik2L1CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A49EF13B26;
        Tue, 18 Jan 2022 12:31:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id qxe1JTGz5mEwdAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 18 Jan 2022 12:31:45 +0000
Date:   Tue, 18 Jan 2022 13:23:24 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Ross Burton <ross.burton@arm.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] py-smbus/setup.py: use setuptools instead of distutils
Message-ID: <20220118131131.388e5d3c@endymion>
In-Reply-To: <20220114134910.3994688-1-ross.burton@arm.com>
References: <20220114134910.3994688-1-ross.burton@arm.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ross,

On Fri, 14 Jan 2022 13:49:10 +0000, Ross Burton wrote:
> As per [1], distutils is deprecated in Python 3.10 and will be removed
> entirely in Python 3.12.
> 
> As setuptools is essentially an enhanced version of distutils, it's
> trivial to port to that.
> 
> [1] https://docs.python.org/3/whatsnew/3.10.html#distutils-deprecated
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  py-smbus/setup.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/py-smbus/setup.py b/py-smbus/setup.py
> index 28a4500..26db33a 100644
> --- a/py-smbus/setup.py
> +++ b/py-smbus/setup.py
> @@ -1,6 +1,6 @@
>  #!/usr/bin/env python
>  
> -from distutils.core import setup, Extension
> +from setuptools import setup, Extension
>  
>  setup(	name="smbus",
>  	version="1.1",

Is setuptools available in python 2.7? For now, py-smbus can be built
for either python2 or python3, and I would like to maintain that
possibility.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
