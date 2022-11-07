Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C882B61EA5A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 06:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbiKGFOo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 00:14:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiKGFOn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 00:14:43 -0500
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16994B4B1;
        Sun,  6 Nov 2022 21:14:41 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 923A141EF0;
        Mon,  7 Nov 2022 05:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1667798078; bh=NYmJfcOtDKmddaHWfWTLrq4ChxppgcegnFV/m6Pblq8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=nIN9aYbjQD/ISeQ3F05tSjvX6nclS/rcRpvC23y9cJyLMgTPPb9sLNGLQuDo3nPSD
         FoFZpppyB0C5ESo6qVFF39In4nzGoAqPvTfe+B9V3Xi44r2TfURPkwLabqzHp05h3d
         2wSMz7UXnf5JtEd/yuv3tgZkypXF016l1vu7pAbj6NJtk8RIBV2muCNMIeJDro2NEb
         1LZlZvAK0piikTADwtMXjkPm7kxWVWMratlkaw8bnyGYMy6LhnrntjRZ27LeTtUeZX
         mYHLmlTacyeA/uJ5mg2xH8xU9YRlo+eeNF/K4wup3BDO+RnJ0POMtta+aiyEt1SCir
         dhMZcCrDAIsaQ==
Message-ID: <eec45f54-097b-1f16-f572-44d9499a51c0@marcan.st>
Date:   Mon, 7 Nov 2022 14:14:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4] i2c/pasemi: PASemi I2C controller IRQ enablement
Content-Language: en-US
To:     Arminder Singh <arminders208@outlook.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Sven Peter <sven@svenpeter.dev>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        asahi@lists.linux.dev
References: <MN2PR01MB5358D35DEBAB82A80629EBB59F3A9@MN2PR01MB5358.prod.exchangelabs.com>
From:   Hector Martin <marcan@marcan.st>
In-Reply-To: <MN2PR01MB5358D35DEBAB82A80629EBB59F3A9@MN2PR01MB5358.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05/11/2022 20.56, Arminder Singh wrote:
> This patch adds IRQ support to the PASemi I2C controller driver to
> increase the performace of I2C transactions on platforms with PASemi I2C
> controllers. While primarily intended for Apple silicon platforms, this
> patch should also help in enabling IRQ support for older PASemi hardware
> as well should the need arise.
> 
> This version of the patch has been tested on an M1 Ultra Mac Studio,
> as well as an M1 MacBook Pro, and userspace launches successfully
> while using the IRQ path for I2C transactions.
> 
> Signed-off-by: Arminder Singh <arminders208@outlook.com>
> ---
> This version of the patch fixes some reliability issues brought up by
> Hector and Sven in the v3 patch email thread. First, this patch
> increases the timeout value in pasemi_smb_waitready to 100ms from 10ms,
> as the original 10ms timeout in the driver was incorrect according to the
> controller's datasheet as Hector pointed out in the v3 patch email thread.
> This incorrect timeout had caused some issues with the tps6598x controller
> on Apple silicon platforms.
> 
> This version of the patch also adds a reg_write to REG_IMASK in the IRQ
> handler, because as Sven pointed out in the previous thread, the I2C
> transaction interrupt is level sensitive so not masking the interrupt in
> REG_IMASK will cause the interrupt to trigger again when it leaves the IRQ
> handler until it reaches the call to reg_write after the completion expires.
> 
> Patch changelog:
> 
> v3 to v4 changes:
>  - Increased the timeout value for I2C transactions to 100ms, as the original
>    10ms timeout in the driver was incorrect according to the I2C chip's
>    datasheet. Mitigates an issue with the tps6598x controller on Apple
>    silicon platforms.
>  - Added a reg_write to REG_IMASK inside the IRQ handler, which prevents
>    the IRQ from triggering again after leaving the IRQ handler, as the
>    IRQ is level-sensitive.
> 
> v2 to v3 changes:
>  - Fixed some whitespace and alignment issues found in v2 of the patch
> 
> v1 to v2 changes:
>  - moved completion setup from pasemi_platform_i2c_probe to
>    pasemi_i2c_common_probe to allow PASemi and Apple platforms to share
>    common completion setup code in case PASemi hardware gets IRQ support
>    added
>  - initialized the status variable in pasemi_smb_waitready when going down
>    the non-IRQ path
>  - removed an unnecessary cast of dev_id in the IRQ handler
>  - fixed alignment of struct member names in i2c-pasemi-core.h
>    (addresses Christophe's feedback in the original submission)
>  - IRQs are now disabled after the wait_for_completion_timeout call
>    instead of inside the IRQ handler
>    (prevents the IRQ from going off after the completion times out)
>  - changed the request_irq call to a devm_request_irq call to obviate
>    the need for a remove function and a free_irq call
>    (thanks to Sven for pointing this out in the original submission)
>  - added a reinit_completion call to pasemi_reset 
>    as a failsafe to prevent missed interrupts from causing the completion
>    to never complete (thanks to Arnd Bergmann for pointing this out)
>  - removed the bitmask variable in favor of just using the value
>    directly (it wasn't used anywhere else)
> 
> v3: https://lore.kernel.org/linux-i2c/MN2PR01MB5358ED8FC32C0CFAEBD4A0E19F5F9@MN2PR01MB5358.prod.exchangelabs.com/T/
> 
> v2: https://lore.kernel.org/linux-i2c/MN2PR01MB535821C8058C7814B2F8EEDF9F599@MN2PR01MB5358.prod.exchangelabs.com/T/
> 
> v1: https://lore.kernel.org/linux-i2c/MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com/T/
> 
>  drivers/i2c/busses/i2c-pasemi-core.c     | 32 ++++++++++++++++++++----
>  drivers/i2c/busses/i2c-pasemi-core.h     |  5 ++++
>  drivers/i2c/busses/i2c-pasemi-platform.c |  6 +++++
>  3 files changed, 38 insertions(+), 5 deletions(-)
> 

Reviewed-by: Hector Martin <marcan@marcan.st>

- Hector
