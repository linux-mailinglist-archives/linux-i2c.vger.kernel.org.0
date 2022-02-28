Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A67B34C7242
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Feb 2022 18:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbiB1RMb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Feb 2022 12:12:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbiB1RMa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Feb 2022 12:12:30 -0500
X-Greylist: delayed 30516 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 28 Feb 2022 09:11:51 PST
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86ABF7C177;
        Mon, 28 Feb 2022 09:11:51 -0800 (PST)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net [174.21.187.98])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 0B674516;
        Mon, 28 Feb 2022 09:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1646068311;
        bh=ka9wDIve8AgVIvxtisCTwLpRAivhzRXy0fQgcqAecRY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g36pWvHrGTrqS2i2n5dld7CiuaGG1E3swlqbG5LA7YqJvrFR1AhzA8KOXZr8cXndQ
         xEYXORTroqutdHZWHhTDCvAy2lbviWmdk++/UAa9MpUJgI2XZZyWQcHj6ZwQO+75Hz
         695lsE/Vv2AG9KsvfNpRlzqucWeawOfVf2JSZ3DI=
Date:   Mon, 28 Feb 2022 09:11:47 -0800
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Message-ID: <Yh0CUzBzGJc4zyTR@hatter.bewilderbeest.net>
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <YhyLIRFbs226KTwA@hatter.bewilderbeest.net>
 <fbb305e3-73b3-7a2d-99cf-a7205b7344ff@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbb305e3-73b3-7a2d-99cf-a7205b7344ff@roeck-us.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 28, 2022 at 05:57:27AM PST, Guenter Roeck wrote:
>On 2/28/22 00:43, Zev Weiss wrote:
>>On Mon, Jan 31, 2022 at 04:18:08PM PST, Zev Weiss wrote:
>>>Hello,
>>>
>>>This series adds support for a new pca9541 device-tree property
>>>("release-delay-us"), which delays releasing ownership of the bus
>>>after a transaction for a configurable duration, anticipating that
>>>another transaction may follow shortly.  By avoiding a
>>>release/reacquisition between transactions, this can provide a
>>>substantial performance improvement for back-to-back operations -- on
>>>a Delta AHE-50DC (ASPEED AST1250) system running OpenBMC with dozens
>>>of LM25066 PMICs on PCA9541-arbitrated busses, a setting of 10000 (10
>>>ms) reduces the median latency the psusensor daemon's hwmon sysfs file
>>>reads from 2.28 ms to 0.99 ms (a 57% improvement).
>>>
>>
>>Ping...Guenter, any thoughts on this?
>>
>
>It sounds reasonable to me, but I don't have access to hardware anymore
>to test it, so I have no means to confirm that it actually works.
>

Ack, thanks.  In that case, what's the path forward on getting changes 
to this driver merged?  I see sign-offs from Wolfram and Peter on the 
last few commits that touched it -- any input from the i2c/i2c-mux 
maintainers?


Zev

