Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F784558CF
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 11:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245546AbhKRKRz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 05:17:55 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:33438 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245593AbhKRKPx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 05:15:53 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id D0E271FD29;
        Thu, 18 Nov 2021 10:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1637230371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DTp5Lnh9pdnNj9+R2hw9RN9WA77iuQiTXujSaeA006Y=;
        b=CGNfE2lBhdKaCPV30Xsk/01KxDVyPEYKet7Cykcn0BROII+mu238HDc1Q05yeqVOi4TAqN
        f1aHcp4vPFCTaF0poi85uFo42rB1Ecw0CdeddytS+7ReyFDFVRoRpSevvTR/3si4jqvbdb
        JQwK/6lmpncINM4h1jrH7UDqzf13L0E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1637230371;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DTp5Lnh9pdnNj9+R2hw9RN9WA77iuQiTXujSaeA006Y=;
        b=bSOL/eLOQ3GpwDEol8rWKBlbP/sSVthoPr382z5sBHgFeRqhcvzsZMM/6YaZ+HdbQsrHcz
        5J/vT7VxLWzn1FAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D30C13D17;
        Thu, 18 Nov 2021 10:12:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id +pVJHCMnlmG7CAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 18 Nov 2021 10:12:51 +0000
Date:   Thu, 18 Nov 2021 11:12:50 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        ck+kernelbugzilla@bl4ckb0x.de, stephane.poignant@protonmail.com
Subject: Re: [PATCH v4] i2c: i801: Fix interrupt storm from SMB_ALERT signal
Message-ID: <20211118111250.177c69e6@endymion>
In-Reply-To: <20211117094509.433463-1-jarkko.nikula@linux.intel.com>
References: <20211117094509.433463-1-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 17 Nov 2021 11:45:09 +0200, Jarkko Nikula wrote:
> Currently interrupt storm will occur from i2c-i801 after first
> transaction if SMB_ALERT signal is enabled and ever asserted. It is
> enough if the signal is asserted once even before the driver is loaded
> and does not recover because that interrupt is not acknowledged.
> 
> This fix aims to fix it by two ways:
> - Add acknowledging for the SMB_ALERT interrupt status
> - Disable the SMB_ALERT interrupt on platforms where possible since the
>   driver currently does not make use for it
> 
> Acknowledging resets the SMB_ALERT interrupt status on all platforms and
> also should help to avoid interrupt storm on older platforms where the
> SMB_ALERT interrupt disabling is not available.
> 
> For simplicity this fix reuses the host notify feature for disabling and
> restoring original register value.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=177311
> Reported-by: ck+kernelbugzilla@bl4ckb0x.de
> Reported-by: stephane.poignant@protonmail.com
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
