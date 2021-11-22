Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E0145933F
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Nov 2021 17:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239717AbhKVQno (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Nov 2021 11:43:44 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:38288 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232910AbhKVQno (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Nov 2021 11:43:44 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 604BE218F6;
        Mon, 22 Nov 2021 16:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1637599236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mVaNAzP6SF5APmRj3uLrB/+NEVWPpk0zz6MqCttFaM8=;
        b=jewUFj72JCYufQpOuyq+M5Sq3MdoBoyXDwKzROe4769gzOhaSuMSV/9Demr6WN+oDnCDtT
        Xf3lcodz7bAzbP6wMvF4pCbQBnoGGNS6yEYjut1eeTg9cjYOdqxjzg0O7WSKsGgiQ+1ipX
        41NshXwnbcqSJT7+CVen/dAdax40Upc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1637599236;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mVaNAzP6SF5APmRj3uLrB/+NEVWPpk0zz6MqCttFaM8=;
        b=gqVAfqujWM7YjWwNyIv44fLVLyLGDoCH5s6BCKvhKxMn6SjpGW5pKtw7/R6uXWP/2VdCbV
        zRcCLsJY20+kYtCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1E1ED13B44;
        Mon, 22 Nov 2021 16:40:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id pkDfBATIm2HdNgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 22 Nov 2021 16:40:36 +0000
Date:   Mon, 22 Nov 2021 17:40:34 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH v2] i2c: i801: Improve handling of chip-specific feature
 definitions
Message-ID: <20211122174034.0aef8ef4@endymion>
In-Reply-To: <45c1aa85-bb20-ccb0-189e-b8353da3f403@gmail.com>
References: <45c1aa85-bb20-ccb0-189e-b8353da3f403@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 19 Nov 2021 21:45:54 +0100, Heiner Kallweit wrote:
> Reduce source code and code size by defining the chip features
> statically.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - make checkpatch happy
> - rename feature definitions to FEATURES_ICH4 and FEATURES_ICH5
> - fix patch title typo
> ---
>  drivers/i2c/busses/i2c-i801.c | 191 ++++++++++++----------------------
>  1 file changed, 66 insertions(+), 125 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>


-- 
Jean Delvare
SUSE L3 Support
