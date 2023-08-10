Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A98F9777913
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Aug 2023 15:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235282AbjHJNGd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Aug 2023 09:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235450AbjHJNGc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Aug 2023 09:06:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1DC26B6;
        Thu, 10 Aug 2023 06:06:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 349F065C01;
        Thu, 10 Aug 2023 13:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1748DC433C7;
        Thu, 10 Aug 2023 13:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691672789;
        bh=CCgoCaAjgXG7aMANT3h1Rup8FsNakcQjhX4y51NJTjM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=omwz4bR75Tl9tuayO5LwHOygY7EBGY86iUt55V8rmcgnkzrdc86YrIp48tm/VBHQz
         B/8cvp6Is2sbzkDPkFtmdbJFWgEcyuhO9Ov2uJc0G+we7u8aHsgaPj8u+CVYYalQL5
         uIBVJEX3Z0x9CE7A/hh6gsvYKwRWXnmOAzwkkAvk=
Date:   Thu, 10 Aug 2023 15:06:24 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alexander Ofitserov <oficerovas@altlinux.org>
Cc:     stable@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 0/3] Add support for Intel Alder Lake PCH
Message-ID: <2023081032-qualifier-facing-bde0@gregkh>
References: <20230810115938.3741058-1-oficerovas@altlinux.org>
 <20230810115938.3741058-2-oficerovas@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810115938.3741058-2-oficerovas@altlinux.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 10, 2023 at 02:59:35PM +0300, Alexander Ofitserov wrote:
> This patch series enables support of i2c bus for Intel Alder Lake PCH-P and PCH-M
> on kernel version 5.10. These patches add ID's of Alder lake platform in these
> drivers: i801, intel-lpss, pinctrl. ID's were taken from linux kernel version 5.15.
> 
> Alexander Ofitserov (3):
>   i2c: i801: Add support for Intel Alder Lake PCH
>   mfd: intel-lpss: Add Alder Lake's PCI devices IDs
>   pinctrl: tigerlake: Add Alder Lake-P ACPI ID
> 
>  drivers/i2c/busses/i2c-i801.c             |  8 +++++
>  drivers/mfd/intel-lpss-pci.c              | 41 +++++++++++++++++++++++
>  drivers/pinctrl/intel/pinctrl-tigerlake.c |  1 +
>  3 files changed, 50 insertions(+)
> 
> -- 
> 2.33.8
> 

I'm confused, why was this sent 3 times, yet no actual patches were
sent?

And you have read how to get patches into the stable kernels:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

thanks,

greg k-h
