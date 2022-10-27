Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3981C60FA31
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Oct 2022 16:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235924AbiJ0OMZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Oct 2022 10:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236086AbiJ0OMX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Oct 2022 10:12:23 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB76188126;
        Thu, 27 Oct 2022 07:12:22 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 39BD81F8E5;
        Thu, 27 Oct 2022 14:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1666879941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mzF42QiADSZnG99tcpDz7gLuyZ5mZmZCYmF9rOEeZYk=;
        b=uxYkV5xl6B663kP7ZdeTPzb0hl3IUjY44LwZRcOiPPzJFLBsunJ/QutQDGRIT5To98wFNJ
        f80g/cwAD/3sPhYJhdTrLQlDFowbB0R0jis/Nu0abiCSkW2wqQlKMzA9M29O+puiVfymAA
        NG55yFAeKUi2bMZtRBWqLawiVSi3Pic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1666879941;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mzF42QiADSZnG99tcpDz7gLuyZ5mZmZCYmF9rOEeZYk=;
        b=0iwueQcdzhPOBn8ttPcRDLAupHh1paW5QsoaVmITeAh1O6xlcuY5D2K080pyRjC4gOXzHL
        v+Uym/my+DNEhxBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0C05E13357;
        Thu, 27 Oct 2022 14:12:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id xLxyAcWRWmPRBwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 27 Oct 2022 14:12:21 +0000
Date:   Thu, 27 Oct 2022 16:12:19 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Chen Zhongjin <chenzhongjin@huawei.com>
Cc:     <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <wsa@kernel.org>
Subject: Re: [PATCH v2] i2c: piix4: Fix adapter not be removed in
 piix4_remove()
Message-ID: <20221027161219.1840104a@endymion.delvare>
In-Reply-To: <20221027121353.181695-1-chenzhongjin@huawei.com>
References: <20221027121353.181695-1-chenzhongjin@huawei.com>
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

On Thu, 27 Oct 2022 20:13:53 +0800, Chen Zhongjin wrote:
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
> Triggered by: rmmod i2c_piix4 && modprobe max31730
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
> Fix this problem by correctly set piix4_adapter_count as 1 for the
> single adapter so it can be normally removed.
> 
> Fixes: 528d53a1592b ("i2c: piix4: Fix probing of reserved ports on AMD Family 16h Model 30h")
> Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
> ---
> v1 -> v2:
> Set piix4_adapter_count as 1 rather than increase it and slightly fix
> the commit message.
> ---
>  drivers/i2c/busses/i2c-piix4.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index 39cb1b7bb865..809fbd014cd6 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -1080,6 +1080,7 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  					   "", &piix4_main_adapters[0]);
>  		if (retval < 0)
>  			return retval;
> +		piix4_adapter_count = 1;
>  	}
>  
>  	/* Check for auxiliary SMBus on some AMD chipsets */

Reviewed-by: Jean Delvare <jdelvare@suse.de>

I believe this qualifies for stable trees, so:

Cc: stable@vger.kernel.org

Thanks,
-- 
Jean Delvare
SUSE L3 Support
