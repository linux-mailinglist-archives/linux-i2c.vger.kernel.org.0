Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E310B78BAF6
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Aug 2023 00:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231758AbjH1WYF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Aug 2023 18:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbjH1WX7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Aug 2023 18:23:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F65139
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 15:23:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E0C9163625
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 22:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1633C433C8;
        Mon, 28 Aug 2023 22:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693261436;
        bh=flP4eiu8OWhuXc0rYQBVqqqQMPlCSq942Ra9vTvZdqA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G/zb45/sHaHmJuHxr3F6lWsGIqXiPx0uu7fSfy380wxRxSN3/hxGAeR62TnR874WD
         XFIVJZU5NvxWSONdUPJGMATNrKAqLxLsrqA+OiUPWFKWn/Drh/L2NVyuibRXOWUISH
         JUH/z+zxTsYdNXy89c4UR1t/RMWjyiW8ucvhvIZh+viZJyHwkVcTXe5s/70Fvw1mUk
         obR5mPrPFbW67GQ8tzUCvmvTiv/rNvoEGVz8GmDfIT+Q6bEI4ok3bgVN26H9YaaREW
         HcyMSk9O0/DZXWWQN1G224R5DNkx/QOoLTBKVnhZZLR9iFdAFzZqrwf5m+euu0Dmbl
         tgerfh6eJcv7A==
Date:   Tue, 29 Aug 2023 00:23:52 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: fix cleanup code in remove() and error path
 of probe()
Message-ID: <20230828222352.azg62n7kz22twkep@intel.intel>
References: <07386d35-0f9f-bcd7-185c-d8eed60fc794@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07386d35-0f9f-bcd7-185c-d8eed60fc794@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

On Sun, Aug 27, 2023 at 10:26:05PM +0200, Heiner Kallweit wrote:
> Jean pointed out that the referenced patch resulted in the remove()
> path not having the reverse order of calls in probe(). I think there's
> more to be done to ensure proper cleanup.
> Especially cleanup in the probe() error path has to be extended.
> Not every step there may be strictly needed, but it's in line with
> remove() now.
> 
> Fixes: 9b5bf5878138 ("i2c: i801: Restore INTREN on unload")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

any chance to take a look at this?

Andi
