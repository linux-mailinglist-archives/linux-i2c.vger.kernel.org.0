Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6E4493F14
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 18:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356411AbiASRcK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 12:32:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346866AbiASRcJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 12:32:09 -0500
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D209C061574
        for <linux-i2c@vger.kernel.org>; Wed, 19 Jan 2022 09:32:09 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 3580F41E96;
        Wed, 19 Jan 2022 17:32:04 +0000 (UTC)
To:     Alex Henrie <alexh@vpitech.com>, Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org, wsa@kernel.org, alexhenrie24@gmail.com
References: <20220111233151.8484-1-alexh@vpitech.com>
 <20220118134705.6ae5b0a4@endymion>
 <20220119094900.7792c05f94329f584dad934a@vpitech.com>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH] i2c: i801: Add module parameter to inhibit BIOS access
Message-ID: <dc6c3b38-dbc1-3d86-fd87-607a2d6a6685@marcan.st>
Date:   Thu, 20 Jan 2022 02:32:02 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220119094900.7792c05f94329f584dad934a@vpitech.com>
Content-Type: text/plain; charset=utf-8
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20/01/2022 01.49, Alex Henrie wrote:
> I think Hector's patch to share the SMBus is a great idea; my patch was
> meant to complement his, not replace it. The problem is that when I
> tried Hector's patch, I got the message "BIOS left SMBus locked". So I
> didn't want to let the BIOS touch the SMBus at all because once it had
> the lock, it seemed to never let go. However, today I tried v2 of
> Hector's patch [1] instead of v3 [2], and v2 worked perfectly! My guess
> is that despite the text of the error message, it's Linux that's
> leaving the SMBus locked, not the BIOS.
> 
> The only difference between v2 and v3 is that v2 called
> outb_p(SMBHSTSTS_INUSE_STS, SMBHSTSTS(priv)) at the end of i801_access.
> Hector, can you clarify why you removed that call in v3?

Well that solves the mystery.

That line was split off and submitted separately in another patch, as it
fixes the immediate breakage that I was trying to address with my patch,
namely that *linux* left the SMBus locked and that broke BIOS accesses.
 The full patch implements proper sharing logic; that line alone is
enough to unbork the backlight on iMacs (among other things) which was
the immediate regression I had encountered. The rest of the patch breaks
horribly without that line, as you'd expect, since it's trying to work
around a broken BIOS when Linux itself is broken.

That patch was posted in June 2021 and CC'd stable [1], and was merged
into the stable 5.10 and 5.12 trees as well as released in 5.13. So, you
must be running an old kernel :-).

[1]
https://lore.kernel.org/linux-i2c/cefbeb76-5f7f-036b-fa0e-1e339d261c35@gmail.com/

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
