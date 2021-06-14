Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0013A69FA
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jun 2021 17:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233484AbhFNPYA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Jun 2021 11:24:00 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:43982 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233414AbhFNPYA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Jun 2021 11:24:00 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id E79231FD29;
        Mon, 14 Jun 2021 15:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623684116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w+r8seE4NHQfLRfDTc0phHUKQ5iMOVHoPlxNy/7+CYE=;
        b=zM09CkaM5HiSWDENHaZmCL2/J2avr8dANxUljoCydDj14xKkEGCtAOANfvcPCyR9MXfMOY
        lj0y5FCaZLg9OixIkuBiQ7Pogi/jLK+JN5qDiF4jUsIDx1rDFNs08Qk4Nb0jnvZqmA7UMX
        cWFv3/EfRNy7wsQU5xzuvIvnVkAvvJ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623684116;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w+r8seE4NHQfLRfDTc0phHUKQ5iMOVHoPlxNy/7+CYE=;
        b=/4Xnj19rEMew03xoiMv2nRQF3rHNkyc6llgJhc8xyu7hz614s5jMyztOTRDUXuO+38XvjG
        I7/yYmlmkfThZRAA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id B3EAD118DD;
        Mon, 14 Jun 2021 15:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623684116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w+r8seE4NHQfLRfDTc0phHUKQ5iMOVHoPlxNy/7+CYE=;
        b=zM09CkaM5HiSWDENHaZmCL2/J2avr8dANxUljoCydDj14xKkEGCtAOANfvcPCyR9MXfMOY
        lj0y5FCaZLg9OixIkuBiQ7Pogi/jLK+JN5qDiF4jUsIDx1rDFNs08Qk4Nb0jnvZqmA7UMX
        cWFv3/EfRNy7wsQU5xzuvIvnVkAvvJ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623684116;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w+r8seE4NHQfLRfDTc0phHUKQ5iMOVHoPlxNy/7+CYE=;
        b=/4Xnj19rEMew03xoiMv2nRQF3rHNkyc6llgJhc8xyu7hz614s5jMyztOTRDUXuO+38XvjG
        I7/yYmlmkfThZRAA==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id ck3CKRR0x2DaIgAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Mon, 14 Jun 2021 15:21:56 +0000
Date:   Mon, 14 Jun 2021 17:21:55 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Improve status polling
Message-ID: <20210614172155.21b33a82@endymion>
In-Reply-To: <4147230b-e88f-52e8-1241-ad343f77628f@gmail.com>
References: <4147230b-e88f-52e8-1241-ad343f77628f@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Tue, 25 May 2021 21:59:05 +0200, Heiner Kallweit wrote:
> Polling uses the same timeout as irq mode: 400 * 500us = 200ms = HZ / 5.
> So let's use the adapter->timeout value also for polling. This has the
> advantage that userspace can control the timeout value for polling as
> well. In addition change the code to make it better readable.
> Last but not least remove the timeout debug messages. Calls to both
> functions are followed by a call to i801_check_post() that will print
> an error message in case of timeout.

I think that the intent was to differentiate between regular polling
and BYTE_DONE polling. But I agree it's not really important, as the
caller probably already knows which type of transaction failed (simple
or block).

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 36 +++++++++++++----------------------
>  1 file changed, 13 insertions(+), 23 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
