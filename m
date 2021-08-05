Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E773E15E9
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 15:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239750AbhHENoI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 09:44:08 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:43484 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239222AbhHENoH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Aug 2021 09:44:07 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id A41DF223C2;
        Thu,  5 Aug 2021 13:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1628171032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wFBY2Whe35qboLdfxoshY8mVq1VUmb3FoyBlboL/Mjg=;
        b=l++uM9yMyoaYks1s86siTiSck1qZDiTQnPuFWTFmWVc311UwKMDS/aDGoRhk021FtQAaZI
        Y4BEJVgAadqSkDb4w8+NQaOt3A1sfHZgVFqP5u5QgPKdGiClx5gEBvDcZiqmxytACJ0RhI
        gOzGd2BDiOaUDl/z2U0ggTXPw7ZSge0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1628171032;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wFBY2Whe35qboLdfxoshY8mVq1VUmb3FoyBlboL/Mjg=;
        b=eoLikxu2sGw4Ah8cF2m21BR+jE6YCexguMsT2o6amptrhK4TVVfP6d2Xfkbiu8jPdsQS0t
        ZMZPOdIx3nrgpwCg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 6AA7B13A46;
        Thu,  5 Aug 2021 13:43:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id 0aUPFxjrC2HNNQAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Thu, 05 Aug 2021 13:43:52 +0000
Date:   Thu, 5 Aug 2021 15:43:50 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 08/10] i2c: i801: Improve i801_add_mux
Message-ID: <20210805154350.712aa368@endymion>
In-Reply-To: <12a96946-c857-b6f8-9623-407b1c71d2c5@gmail.com>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
        <12a96946-c857-b6f8-9623-407b1c71d2c5@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 01 Aug 2021 16:22:31 +0200, Heiner Kallweit wrote:
> The return value of i801_add_mux() isn't used, so let's change it to void.
> In addition remove the not needed cast to struct gpiod_lookup.
> GPIO_LOOKUP() uses GPIO_LOOKUP_IDX() that includes this cast.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> (...)

Fine with me.

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
