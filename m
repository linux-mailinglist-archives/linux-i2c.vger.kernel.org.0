Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A988B3A6E82
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jun 2021 21:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbhFNTFL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Jun 2021 15:05:11 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:37030 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233217AbhFNTFK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Jun 2021 15:05:10 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 73C351FD51;
        Mon, 14 Jun 2021 19:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623697386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i2noarl+/tze23ZTkSlOhOkov1tAakLsc0m88GRSIZA=;
        b=BBCbcYP0iUgseLBFk5sRxHft/7Pc08t8tZe3AW1qBqZfDu72gioyjbZ0iuyrLD7E3JXL3J
        pAN3fnV7L30vCxivdaTRJ78zR5t3cUpe9zw7lKGhJAMuUWXvrafjZnLChPBox2lBh7G6k4
        w5HaZQ3d3umywQJFUAYCNCaiRO7gY5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623697386;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i2noarl+/tze23ZTkSlOhOkov1tAakLsc0m88GRSIZA=;
        b=AHe0lpmtAcjiF5Vl9MC0Tq0oggaYhLHZICQaIW+ChEZfbyYbyk1zT3H7lUoPHu2L9t7fol
        PCh41RhppCZ81MDw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 3A680118DD;
        Mon, 14 Jun 2021 19:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623697386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i2noarl+/tze23ZTkSlOhOkov1tAakLsc0m88GRSIZA=;
        b=BBCbcYP0iUgseLBFk5sRxHft/7Pc08t8tZe3AW1qBqZfDu72gioyjbZ0iuyrLD7E3JXL3J
        pAN3fnV7L30vCxivdaTRJ78zR5t3cUpe9zw7lKGhJAMuUWXvrafjZnLChPBox2lBh7G6k4
        w5HaZQ3d3umywQJFUAYCNCaiRO7gY5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623697386;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i2noarl+/tze23ZTkSlOhOkov1tAakLsc0m88GRSIZA=;
        b=AHe0lpmtAcjiF5Vl9MC0Tq0oggaYhLHZICQaIW+ChEZfbyYbyk1zT3H7lUoPHu2L9t7fol
        PCh41RhppCZ81MDw==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id SWiIC+qnx2A/EAAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Mon, 14 Jun 2021 19:03:06 +0000
Date:   Mon, 14 Jun 2021 21:03:05 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Improve i801_setup_hstcfg
Message-ID: <20210614210305.1e164f90@endymion>
In-Reply-To: <d5ec9de2-dd54-6ee2-a791-13ca510bcd43@gmail.com>
References: <d5ec9de2-dd54-6ee2-a791-13ca510bcd43@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 25 May 2021 22:07:17 +0200, Heiner Kallweit wrote:
> i801_setup_hstcfg() leaves the bits in priv->original_hstcfg that
> we're interested in intact. Therefore we can remove the return value
> from the function and use priv->original_hstcfg directly.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> (...)

I like it.

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
