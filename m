Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CECD3DCC31
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Aug 2021 17:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbhHAPCC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Aug 2021 11:02:02 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:39890 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbhHAPCC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Aug 2021 11:02:02 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id C4EC521F5A;
        Sun,  1 Aug 2021 15:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1627830113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8wFBeMibKDuGEbBs6qLeMSOqJ1VTvO0FY/B0vJHtVxc=;
        b=qxfImd0meBY2pxAj6TTieUVU03boE/NBa0y39k068wKzds1sWJBZXBv1tQjafARkIRyfgo
        gEkRjK2lVbpN/g8siESEji94gMDJolFIfUVqWJU/ChvmdefdFwYQtDi20Fln3f1KIbi3js
        Ly7wzujZf25K5Psrb4GpIDjPP/TtzBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1627830113;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8wFBeMibKDuGEbBs6qLeMSOqJ1VTvO0FY/B0vJHtVxc=;
        b=l/hrMTdQAW6e8A94lPrfKel1BtQmJYATuVLzae8vzWd6Z4lNHfp4IA3jo1RCzYAiaMtM7M
        LclYhd7HayjhKfBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8997C136B6;
        Sun,  1 Aug 2021 15:01:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id pROiHmG3BmFFWQAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Sun, 01 Aug 2021 15:01:53 +0000
Date:   Sun, 1 Aug 2021 17:01:52 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Makefile: drop KERNELVERSION
Message-ID: <20210801170152.3d9bb659@endymion>
In-Reply-To: <b04c0610e6b0c16c555a1578dee24b1b022bbd1c.1627649880.git.baruch@tkos.co.il>
References: <b04c0610e6b0c16c555a1578dee24b1b022bbd1c.1627649880.git.baruch@tkos.co.il>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 30 Jul 2021 15:58:00 +0300, Baruch Siach wrote:
> KERNELVERSION is unused since commit 4b89e48a1039f ("Delete the
> decode-xeon script...").
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  Makefile | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index e784921f9f98..5ac8a59dd390 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -50,8 +50,6 @@ USE_STATIC_LIB := 1
>  endif
>  endif
>  
> -KERNELVERSION	:= $(shell uname -r)
> -
>  .PHONY: all strip clean install uninstall
>  
>  all:

Applied, thanks.

-- 
Jean Delvare
SUSE L3 Support
