Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67ED661518B
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 19:28:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiKAS2v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 14:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiKAS2v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 14:28:51 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2BB6376;
        Tue,  1 Nov 2022 11:28:49 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 855924267B;
        Tue,  1 Nov 2022 18:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1667327328; bh=FNzvVcw0wbF+4/Rh6ZkrNFOkM2Dg97dYxtkFzoT3wCU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=y4nKaGfkdXYMVrEShBWZHRKdzFtCCDoBLOOkwL3REl6NbF+6M053rcomejdo0EIC8
         8okltHpHzXzQXvk/Ali5MJcV8o+VzCM9QwQsr+ke7KllD7CjQjh4756qenmpXBD/b+
         rjd+lOKfJNR+YNdlL8HbecQ5GnzPf239Q0vpOg734niZiN08FHz7KVIlSUtOPEzbNv
         Gk8N6WTMhOxXK7U+9Jd0ARlrsqfIJFP04pHD9Ga2PiRPQp5eQo0onr11YQ3J545Hmx
         8zvs8KSKogigqkHYFxWlTXhnFG4Ew4wCWDuJ/EIvg+24dimHGJ+5BED8x8aBUpFj9P
         uSyl1yIVKueRw==
Message-ID: <a40dbff1-6aa1-dedf-7eb2-c75d75d808b2@marcan.st>
Date:   Wed, 2 Nov 2022 03:28:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3] i2c/pasemi: PASemi I2C controller IRQ enablement
Content-Language: en-US
To:     Arminder Singh <arminders208@outlook.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        asahi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Sven Peter <sven@svenpeter.dev>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <MN2PR01MB5358ED8FC32C0CFAEBD4A0E19F5F9@MN2PR01MB5358.prod.exchangelabs.com>
From:   Hector Martin <marcan@marcan.st>
In-Reply-To: <MN2PR01MB5358ED8FC32C0CFAEBD4A0E19F5F9@MN2PR01MB5358.prod.exchangelabs.com>
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

On 07/10/2022 09.42, Arminder Singh wrote:
> This patch adds IRQ support to the PASemi I2C controller driver to 
> increase the performace of I2C transactions on platforms with PASemi I2C 
> controllers. While primarily intended for Apple silicon platforms, this 
> patch should also help in enabling IRQ support for older PASemi hardware 
> as well should the need arise.
> 
> Signed-off-by: Arminder Singh <arminders208@outlook.com>
> ---
> This version of the patch has been tested on an M1 Ultra Mac Studio,
> as well as an M1 MacBook Pro, and userspace launches successfully
> while using the IRQ path for I2C transactions.
>
[...]

Please increase the timeout to 100ms for v4. 10ms was always wrong (the
datasheet says the hardware clock stretching timeout is 25ms, and most
i2c drivers have much larger timeouts), and with the tighter timing
achievable with the IRQ patchset we are seeing timeouts in tipd
controller requests which can clock-stretch for ~10ms themselves,
followed by a spiral of errors as the driver has pretty poor error
recovery. Increasing the timeout fixes the immediate problem/regression.

Other than that, I now have a patch that makes the whole timeout/error
detection/recovery much more robust, but I can submit it after this goes
in :)

- Hector
