Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6F460F5F3
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Oct 2022 13:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234196AbiJ0LK4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Oct 2022 07:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233747AbiJ0LKz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Oct 2022 07:10:55 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB9FD4A2D;
        Thu, 27 Oct 2022 04:10:54 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id D57BC2242E;
        Thu, 27 Oct 2022 11:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1666869052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eNREXhFn28dAnt9RJtCqWVsAsKw/pEE5T5r+1VEs2es=;
        b=Bkhn+06gDfkJZ1aSexpqdeCr651iD8y8lUgKDG+vCccDCnD3OUoDTKhr1xksXd8GWi4oeG
        y1V95m2c8EPzxspZ499tUvPrJF58MghkZ6HlrxMptbaO42zj61u1oAJiBWCjEHD8TkvmRp
        EtNSZm4K69XWlN7EHj00WRENV32RBT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1666869052;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eNREXhFn28dAnt9RJtCqWVsAsKw/pEE5T5r+1VEs2es=;
        b=YbMco8eP0vWkzmHwMpbUsgDgPgoX8DBlo1mZSeCZuI+KF/hVvOyOxkn1rnbgg9ogRCuNfD
        g/C/X/w0e9BbtGCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB16A134CA;
        Thu, 27 Oct 2022 11:10:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id MpOIJjxnWmOSGgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 27 Oct 2022 11:10:52 +0000
Date:   Thu, 27 Oct 2022 13:10:51 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Chen Zhongjin <chenzhongjin@huawei.com>
Cc:     <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <wsa@kernel.org>
Subject: Re: [PATCH] i2c: piix4: Fix adapter not be removed in
 piix4_remove()
Message-ID: <20221027131051.796d6a36@endymion.delvare>
In-Reply-To: <20221025024456.110090-1-chenzhongjin@huawei.com>
References: <20221025024456.110090-1-chenzhongjin@huawei.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chen,

On Tue, 25 Oct 2022 10:44:56 +0800, Chen Zhongjin wrote:
> In piix4_probe(), the piix4 adapter will be registered in:
> 
>    piix4_probe()
>      piix4_add_adapters_sb800() / piix4_add_adapter()
>        i2c_add_adapter()
> 
> Based on the probed device type, piix4_add_adapters_sb800() or single
> piix4_add_adapter() will be called.
> For the former case, piix4_adapter_count is set as the number of adapters,
> while for antoher case it is not set and kept default *zero*.
> 
> When piix4 is removed, piix4_remove() removes the adapters added in
> piix4_probe(), basing on the piix4_adapter_count value.
> Because the count is zero for the single adapter case, the adapter won't
> be removed and makes the sources allocated for adapter leaked, such as
> the i2c client and device.
> 
> These sources can still be accessed by i2c or bus and cause problems.
> An easily reproduced case is that if a new adapter is registered, i2c
> will get the leaked adapter and try to call smbus_algorithm, which was
> already freed:
> 
> Triggered by: rmmod i2c_piix4 & modprobe max31730
> 
>  BUG: unable to handle page fault for address: ffffffffc053d860
>  #PF: supervisor read access in kernel mode
>  #PF: error_code(0x0000) - not-present page
>  Oops: 0000 [#1] PREEMPT SMP KASAN
>  CPU: 0 PID: 3752 Comm: modprobe Tainted: G
>  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
>  RIP: 0010:i2c_default_probe (drivers/i2c/i2c-core-base.c:2259) i2c_core
>  RSP: 0018:ffff888107477710 EFLAGS: 00000246
>  ...
>  <TASK>
>   i2c_detect (drivers/i2c/i2c-core-base.c:2302) i2c_core
>   __process_new_driver (drivers/i2c/i2c-core-base.c:1336) i2c_core
>   bus_for_each_dev (drivers/base/bus.c:301)
>   i2c_for_each_dev (drivers/i2c/i2c-core-base.c:1823) i2c_core
>   i2c_register_driver (drivers/i2c/i2c-core-base.c:1861) i2c_core
>   do_one_initcall (init/main.c:1296)
>   do_init_module (kernel/module/main.c:2455)
>   ...
>  </TASK>
>  ---[ end trace 0000000000000000 ]---
> 
> Fix this problem by correctly set piix4_adapter_count for the single
> adapter path so the adapter can be normally removed in piix4_remove().
> 
> Fixes: 528d53a1592b ("i2c: piix4: Fix probing of reserved ports on AMD Family 16h Model 30h")
> Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>

Nice catch, and sorry for introducing this bug in the first place.

I'm not fully happy with your fix though.

> ---
>  drivers/i2c/busses/i2c-piix4.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index 39cb1b7bb865..125646fd36dc 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -1080,6 +1080,7 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  					   "", &piix4_main_adapters[0]);
>  		if (retval < 0)
>  			return retval;
> +		piix4_adapter_count++;
>  	}
>  
>  	/* Check for auxiliary SMBus on some AMD chipsets */

Fundamentally, you want to set piix4_adapter_count to 1. You use ++
based on the assumption that piix4_adapter_count is 0 initially. While
this is true upon loading the driver, it would no longer be true is an
adapter has already been registered and then unregistered without
unloading the driver. This could happen if the SMBus controller is
hot-plugged/unplugged (I am not aware of this happening in the real
world, to be honest) or if the system owner manually unbinds then
rebinds the device to the i2c-piix4 driver (something a kernel
developer could legitimately do to exercise or otherwise test the
probing and removal code paths of the driver).

So I think that the following sequence would cause piix4_adapter_count
to grow beyond PIIX4_MAX_ADAPTERS with your patch applied (adjust the
PCI device bus location according to your system), which in turn would
result in an array overrun in piix4_remove():

# for n in `seq 1 8` ; do echo "0000:00:14.0" > /sys/bus/pci/drivers/piix4_smbus/unbind ; echo "0000:00:14.0" > /sys/bus/pci/drivers/piix4_smbus/bind ; done

For this reason, I am asking that you explicitly set
piix4_adapter_count to 1 instead of incrementing it.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
