Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDEA33A6BBD
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jun 2021 18:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233643AbhFNQaC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Jun 2021 12:30:02 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:33264 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233430AbhFNQaC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Jun 2021 12:30:02 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 6F3C62198F;
        Mon, 14 Jun 2021 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623688078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=194L+OzUoDzwZKoEY4KUf6+zvOOACSLkczmLhdehouo=;
        b=aokX8ql/2mrH2JyAarePxajKTNk6/WFaWAlyjsKYQ46xhORXMSz4GkudUHL8nWfEVz5MYH
        iTkww3bu3FAvqNMFjr0lqxVru38e2RHiX7mvn12azrc5J0MFUG1CoSIwSBjl5rHDAOeZbC
        l92pPs+OfRyMGnnQcznjRLhA7R8DWWE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623688078;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=194L+OzUoDzwZKoEY4KUf6+zvOOACSLkczmLhdehouo=;
        b=6d6Z2r5i1V5480g+7IMh8fTSzTJF9KL9Yis7X4/8DmASX3dA+Bk4RHb2pH3zdW0IniXC+Z
        pniIrG+eRIY+8sCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 38B59118DD;
        Mon, 14 Jun 2021 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623688078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=194L+OzUoDzwZKoEY4KUf6+zvOOACSLkczmLhdehouo=;
        b=aokX8ql/2mrH2JyAarePxajKTNk6/WFaWAlyjsKYQ46xhORXMSz4GkudUHL8nWfEVz5MYH
        iTkww3bu3FAvqNMFjr0lqxVru38e2RHiX7mvn12azrc5J0MFUG1CoSIwSBjl5rHDAOeZbC
        l92pPs+OfRyMGnnQcznjRLhA7R8DWWE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623688078;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=194L+OzUoDzwZKoEY4KUf6+zvOOACSLkczmLhdehouo=;
        b=6d6Z2r5i1V5480g+7IMh8fTSzTJF9KL9Yis7X4/8DmASX3dA+Bk4RHb2pH3zdW0IniXC+Z
        pniIrG+eRIY+8sCA==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id oxf2Co6Dx2DjRQAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Mon, 14 Jun 2021 16:27:58 +0000
Date:   Mon, 14 Jun 2021 18:27:57 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Use driver name constant instead of function
 dev_driver_string
Message-ID: <20210614182757.32c90431@endymion>
In-Reply-To: <089c47ad-1519-947e-ac31-290da37159d7@gmail.com>
References: <089c47ad-1519-947e-ac31-290da37159d7@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 25 May 2021 22:04:23 +0200, Heiner Kallweit wrote:
> We are the driver, so we can use the driver name directly instead of
> retrieving it by calling dev_driver_string().

Makes sense. Should make the code slightly faster.

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
