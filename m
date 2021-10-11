Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF9E428D15
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 14:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234783AbhJKMgI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 08:36:08 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:57050 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234738AbhJKMgH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Oct 2021 08:36:07 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id F245721FEA;
        Mon, 11 Oct 2021 12:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1633955646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jVf6ld2BGbc01oOtTNZYpuxN+nDUAcnTSgpzJ/zmL2s=;
        b=v7VFg39noiUGBsbfae0zSRP4beQOfcI9wyDF16MEX/SMvLVyQvrJSR/i3gkvIRyQT1EQ/s
        bW5kD/KSIzY2cVPOx1dDU1oNb3MvJ6HqDXDJRyYxsKRdkf2w3dwSlWiMkUWxYUAFACziiL
        gfmiZJv08WZCiHi7EaA9rHquqf4DsHs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1633955646;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jVf6ld2BGbc01oOtTNZYpuxN+nDUAcnTSgpzJ/zmL2s=;
        b=SVfCbzC6q45/7OppAb3a216JrzmzvEUWv3auJZfZr9I3fm0iGrLnTLPQaFL/KuSVabJnVU
        rW36bRkQU+TIYVCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96A6913C70;
        Mon, 11 Oct 2021 12:34:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id CiwzIj4vZGEeegAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 11 Oct 2021 12:34:06 +0000
Date:   Mon, 11 Oct 2021 14:34:04 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: i801: Add support for Intel Ice Lake PCH-N
Message-ID: <20211011143404.181eaaca@endymion>
In-Reply-To: <20211001172154.15660-1-andriy.shevchenko@linux.intel.com>
References: <20211001172154.15660-1-andriy.shevchenko@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 01 Oct 2021 20:21:54 +0300, Andy Shevchenko wrote:
> Add PCI ID of SMBus controller on Intel Ice Lake PCH-N.
> 
> The device can be found on MacBookPro16,2 [1].
> 
> [1]: https://linux-hardware.org/?probe=f1c5cf0c43
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 4 ++++
>  1 file changed, 4 insertions(+)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
