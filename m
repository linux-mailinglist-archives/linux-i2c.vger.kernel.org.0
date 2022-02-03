Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0D44A85F4
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Feb 2022 15:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235787AbiBCOOd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Feb 2022 09:14:33 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:53144 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234727AbiBCOOb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Feb 2022 09:14:31 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 305722114D;
        Thu,  3 Feb 2022 14:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1643897670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IsVlcPPz4fb5Gf2ImKOnD8UP/Sqe6RXNED24nJE5qKY=;
        b=TdvsgBazf40G3Zr1OXu884xSANl5KtoMWSjvIFL1QtFI6DEIRomHKAvbkSPCY8f8jade6c
        gtkp/jGWUimi84/2NsyRq93Cl/PIU8PIsmijCSLm7nidDZnlde4c1dxU8QCxiYoe8nnKci
        icwsJBsgbD4JpDws/ubGrlApiz7G2E4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1643897670;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IsVlcPPz4fb5Gf2ImKOnD8UP/Sqe6RXNED24nJE5qKY=;
        b=fwkYbBPid4pC93NTSV6xWGdFvVUHzDurGFrnYL0GBEcvMzOIvcZoOcxSMwN3nzXk8fLfKb
        /6KZpAwTIvHjfnAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 706F313C0F;
        Thu,  3 Feb 2022 14:14:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 4mTgGUXj+2HsVQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 03 Feb 2022 14:14:29 +0000
Date:   Thu, 3 Feb 2022 15:14:24 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v4 6/8] i2c: i801: convert to use common P2SB accessor
Message-ID: <20220203151424.2a35c864@endymion>
In-Reply-To: <20220131151346.45792-7-andriy.shevchenko@linux.intel.com>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
        <20220131151346.45792-7-andriy.shevchenko@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Mon, 31 Jan 2022 17:13:44 +0200, Andy Shevchenko wrote:
> Since we have a common P2SB accessor in tree we may use it instead of
> open coded variants.
> 
> Replace custom code by p2sb_bar() call.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/i2c/busses/Kconfig        |  1 +
>  drivers/i2c/busses/i2c-i801.c     | 39 +++++++------------------------
>  drivers/platform/x86/intel/p2sb.c |  6 +++++
>  3 files changed, 16 insertions(+), 30 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

And thank you for taking the time to write this neat P2SB API and to
convert all the code that was doing the same so far.

-- 
Jean Delvare
SUSE L3 Support
