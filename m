Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 140DC64DCDB
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Dec 2022 15:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiLOO0r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Dec 2022 09:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiLOO0q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Dec 2022 09:26:46 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD51F2BD1;
        Thu, 15 Dec 2022 06:26:44 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 567F621F2C;
        Thu, 15 Dec 2022 14:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1671114403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i7JYprgrdkZFa6AF5e+Lr6Zg8X/kWBWySYzXul9YMSU=;
        b=cQtqyf0kZn6oShQItZk1VmHzoHTNfrLIpHPEpPTON5jGcTpImOTyN3Zmnj2+osU2bdohpf
        qr0h5bLHVXKcnV6p+4VpXvfAngRfGG5UNVHoAAIzssaoydrk9wfKCwvw5bUB3z/4wldtK5
        FhXGwpcOc/6tKObPLdynStuKYGVBdRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1671114403;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i7JYprgrdkZFa6AF5e+Lr6Zg8X/kWBWySYzXul9YMSU=;
        b=3MEppQCmHbF+czZDEVeB6WtGPOou6JYei2OvSQceM2C1dZg23g327IbKFwF52iU+m6iDzV
        3hOLUZw+e+vCKyBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D132138E5;
        Thu, 15 Dec 2022 14:26:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Gph9AaMum2MAYQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 15 Dec 2022 14:26:43 +0000
Date:   Thu, 15 Dec 2022 15:26:41 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Hector Martin <marcan@marcan.st>
Cc:     Alex Henrie <alexh@vpitech.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
        Ettore Chimenti <ek5.chimenti@gmail.com>
Subject: Re: [PATCH v3] i2c: i801: Safely share SMBus with BIOS/ACPI
Message-ID: <20221215152641.39164ca3@endymion.delvare>
In-Reply-To: <20210626054113.246309-1-marcan@marcan.st>
References: <20210626054113.246309-1-marcan@marcan.st>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all, 

I know it's been a while, and I have to apologize for that. The
original plan was to merge the patch series from Heiner Kallweit first,
but as it turns out, it was never resubmitted after my (admittedly
slow) review and things got stuck.

Anyway, I finally took some time to review this patch. I have a good
headache now, and some comments below.

On Sat, 26 Jun 2021 14:41:13 +0900, Hector Martin wrote:
> The i801 controller provides a locking mechanism that the OS is supposed
> to use to safely share the SMBus with ACPI AML or other firmware.
> 
> Previously, Linux attempted to get out of the way of ACPI AML entirely,
> but left the bus locked if it used it before the first AML access. This
> causes AML implementations that *do* attempt to safely share the bus
> to time out if Linux uses it first; notably, this regressed ACPI video
> backlight controls on 2015 iMacs after 01590f361e started instantiating
> SPD EEPROMs on boot.
> 
> Commit 065b6211a8 fixed the immediate problem of leaving the bus locked,
> but we can do better. The controller does have a proper locking mechanism,
> so let's use it as intended. Since we can't rely on the BIOS doing this
> properly, we implement the following logic:
> 
> - If ACPI AML uses the bus at all, we make a note and disable power
>   management. The latter matches already existing behavior.
> - When we want to use the bus, we attempt to lock it first. If the
>   locking attempt times out, *and* ACPI hasn't tried to use the bus at
>   all yet, we cautiously go ahead and assume the BIOS forgot to unlock
>   the bus after boot. This preserves existing behavior.
> - We always unlock the bus after a transfer.

If I'm not mistaken, this also matches already existing behavior (since
commit 065b6211a8).

> - If ACPI AML tries to use the bus (except trying to lock it) while
>   we're in the middle of a transfer, or after we've determined
>   locking is broken, we know we cannot safely share the bus and give up.
> 
> Upon first usage of SMBus by ACPI AML, if nothing has gone horribly
> wrong so far, users will see:
> 
> i801_smbus 0000:00:1f.4: SMBus controller is shared with ACPI AML. This seems safe so far.
> 
> If locking the SMBus times out, users will see:
> 
> i801_smbus 0000:00:1f.4: BIOS left SMBus locked
> 
> And if ACPI AML tries to use the bus concurrently with Linux, or it
> previously used the bus and we failed to subsequently lock it as
> above, the driver will give up and users will get:
> 
> i801_smbus 0000:00:1f.4: BIOS uses SMBus unsafely
> i801_smbus 0000:00:1f.4: Driver SMBus register access inhibited
> 
> This fixes the regression introduced by 01590f361e, and further allows
> safely sharing the SMBus on 2015 iMacs. Tested by running `i2cdump` in a
> loop while changing backlight levels via the ACPI video device.
> 
> Fixes: 01590f361e ("i2c: i801: Instantiate SPD EEPROMs automatically")
> Cc: <stable@vger.kernel.org>

I object to this patch going to stable, as the original regression has
already been addressed by an earlier patch. The "Fixes" tag doesn't
seem appropriate, for the same reason.

This patch is way too intrusive and risky to be considered for stable
kernels, it clearly fails to meet the first two acceptance criteria. It
should live for some time upstream before distributions may consider
backporting it.

> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  drivers/i2c/busses/i2c-i801.c | 96 ++++++++++++++++++++++++++++-------
>  1 file changed, 79 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 04a1e38f2a6f..03be6310d6d7 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -287,11 +287,18 @@ struct i801_priv {
>  #endif
>  	struct platform_device *tco_pdev;
>  
> +	/* BIOS left the controller marked busy. */
> +	bool inuse_stuck;
>  	/*
> -	 * If set to true the host controller registers are reserved for
> -	 * ACPI AML use. Protected by acpi_lock.
> +	 * If set to true, ACPI AML uses the host controller registers.
> +	 * Protected by acpi_lock.
>  	 */
> -	bool acpi_reserved;
> +	bool acpi_usage;
> +	/*
> +	 * If set to true, ACPI AML uses the host controller registers in an
> +	 * unsafe way. Protected by acpi_lock.
> +	 */
> +	bool acpi_unsafe;
>  	struct mutex acpi_lock;
>  };
>  
> @@ -854,10 +861,37 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  	int hwpec;
>  	int block = 0;
>  	int ret = 0, xact = 0;
> +	int timeout = 0;
>  	struct i801_priv *priv = i2c_get_adapdata(adap);
>  
> +	/*
> +	 * The controller provides a bit that implements a mutex mechanism
> +	 * between users of the bus. First, try to lock the hardware mutex.
> +	 * If this doesn't work, we give up trying to do this, but then
> +	 * bail if ACPI uses SMBus at all.
> +	 */
> +	if (!priv->inuse_stuck) {
> +		while (inb_p(SMBHSTSTS(priv)) & SMBHSTSTS_INUSE_STS) {

Do I understand correctly that there are 3 cases where we would be
looping here:

1* The SMBus was used by the BIOS at boot time and they forgot to clear
   SMBHSTSTS_INUSE_STS. The expected outcome is a timeout.

2* ACPI is using the SMBus, and the implementation is a good citizen
   (acquires the hardware lock before starting a transfer, releases it
   when done), and we are in the middle of an ACPI-side SMBus transfer.
   The expectation is that the ACPI-side transfer will complete and the
   hardware lock be released before we reach the timeout.

3* ACPI is using the SMBus, the implementation is a bad citizen and did
   not release the hardware lock after a transfer. The expected outcome
   is a timeout.

Case 1 wouldn't be a problem, but we can't differentiate it from case
3, which is a problem, therefore we always consider a timeout to be the
problematic case 3 and inhibit driver access when that happens. Right?

> +			if (++timeout >= MAX_RETRIES) {

Note: I had to change this to use time_is_before_jiffies(), as
MAX_RETRIES has been removed from the i2c-i801 driver by commit
44c54c4ec391 ("i2c: i801: Improve status polling") meanwhile.

> +				dev_warn(&priv->pci_dev->dev,
> +					 "BIOS left SMBus locked\n");
> +				priv->inuse_stuck = true;
> +				break;
> +			}
> +			usleep_range(250, 500);
> +		}
> +	}
> +
>  	mutex_lock(&priv->acpi_lock);
> -	if (priv->acpi_reserved) {
> +	if (priv->acpi_usage && priv->inuse_stuck && !priv->acpi_unsafe) {
> +		priv->acpi_unsafe = true;
> +
> +		dev_warn(&priv->pci_dev->dev, "BIOS uses SMBus unsafely\n");
> +		dev_warn(&priv->pci_dev->dev,
> +			 "Driver SMBus register access inhibited\n");
> +	}
> +
> +	if (priv->acpi_unsafe) {
>  		mutex_unlock(&priv->acpi_lock);
>  		return -EBUSY;
>  	}
> @@ -1639,6 +1673,16 @@ static bool i801_acpi_is_smbus_ioport(const struct i801_priv *priv,
>  	       address <= pci_resource_end(priv->pci_dev, SMBBAR);
>  }
>  
> +static acpi_status
> +i801_acpi_do_access(u32 function, acpi_physical_address address,
> +				u32 bits, u64 *value)
> +{
> +	if ((function & ACPI_IO_MASK) == ACPI_READ)
> +		return acpi_os_read_port(address, (u32 *)value, bits);
> +	else
> +		return acpi_os_write_port(address, (u32)*value, bits);
> +}
> +
>  static acpi_status
>  i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
>  		     u64 *value, void *handler_context, void *region_context)
> @@ -1648,17 +1692,38 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
>  	acpi_status status;
>  
>  	/*
> -	 * Once BIOS AML code touches the OpRegion we warn and inhibit any
> -	 * further access from the driver itself. This device is now owned
> -	 * by the system firmware.
> +	 * Non-i801 accesses pass through.

Technically, this is "Non-SMBus access". It could still be an access to
other functions of the i82801 chipset, but we don't care about these.

>  	 */
> -	mutex_lock(&priv->acpi_lock);
> +	if (!i801_acpi_is_smbus_ioport(priv, address))
> +		return i801_acpi_do_access(function, address, bits, value);
>  
> -	if (!priv->acpi_reserved && i801_acpi_is_smbus_ioport(priv, address)) {
> -		priv->acpi_reserved = true;
> +	if (!mutex_trylock(&priv->acpi_lock)) {
> +		mutex_lock(&priv->acpi_lock);

I was pretty confused by this construct at first, I think it deserves a
comment. My understanding of it is:

1* We first try to acquire the software lock without waiting. If it
   works, it means that no transfer is in progress on the Linux side,
   and we can proceed with the ACPI I/O request, as we hold the lock.

2* If immediate acquisition of the software lock failed, we wait for
   the lock to be released by i801_access(). Once we have the lock,
   there are two options. Either the first thing done by the ACPI side
   is reading SMBHSTSTS_INUSE_STS, it is a good citizen and we can
   continue (we hold both the software lock and the hardware lock). Or
   the ACPI side accesses another register directly, which means it
   does not check SMBHSTSTS_INUSE_STS, it is a bad citizen and there is
   no safe way to access the SMBus on the Linux side. We prevent
   further access from the Linux side, as we did before this patch.

Please correct me if I'm wrong.

> +		/*
> +		 * This better be a read of the status register to acquire
> +		 * the lock...
> +		 */
> +		if (!priv->acpi_unsafe &&
> +			!(address == SMBHSTSTS(priv) &&
> +			 (function & ACPI_IO_MASK) == ACPI_READ)) {
> +			/*
> +			 * Uh-oh, ACPI AML is trying to do something with the
> +			 * controller without locking it properly.
> +			 */
> +			priv->acpi_unsafe = true;
> +
> +			dev_warn(&pdev->dev, "BIOS uses SMBus unsafely\n");
> +			dev_warn(&pdev->dev,
> +				 "Driver SMBus register access inhibited\n");
> +		}
> +	}
>  
> -		dev_warn(&pdev->dev, "BIOS is accessing SMBus registers\n");
> -		dev_warn(&pdev->dev, "Driver SMBus register access inhibited\n");
> +	if (!priv->acpi_usage) {
> +		priv->acpi_usage = true;
> +
> +		if (!priv->acpi_unsafe)
> +			dev_info(&pdev->dev,
> +				 "SMBus controller is shared with ACPI AML. This seems safe so far.\n");
>  
>  		/*
>  		 * BIOS is accessing the host controller so prevent it from

I see a problem with this implementation. It is possible that
i801_access() gets called in the middle of an ACPI-side SMBus transfer,
because the software lock is not held for the whole duration of an
ACPI-side transfer (contrary to Linux-side transfers). Before this
patch, the first step of the ACPI-side transfer would have blocked any
future access from the Linux side, so we were safe. After this patch,
acpi_usage has been set to true at this point, but that alone won't
prevent access from the Linux side. Access will only be prevented if
SMBHSTSTS_INUSE_STS is considered stuck. If the ACPI implementation is
a bad citizen, I'm afraid there is no guarantee of that happening.
SMBHSTSTS will eventually be read during the ACPI-side transfer, and
that will acquire the hardware lock as a side effect, but not as the
first step.

Specifically, the scenario that would cause problem is:

ACPI side				| Linux side
---------------------------------------+----------------------------------
[first step of a transfer]             |
mutex_trylock(&priv->acpi_lock)        |
priv->acpi_usage = true                |
i801_acpi_do_access(random register)   |
mutex_unlock(&priv->acpi_lock)         |
                                       | take hardware lock
                                       | mutex_lock(&priv->acpi_lock)
                                       | priv->acpi_unsafe is false -> OK
                                       | perform transfer
                                       | release hardware lock
                                       | mutex_unlock(&priv->acpi_lock)
[second step of a transfer]            |
mutex_trylock(&priv->acpi_lock)        |
i801_acpi_do_access(random register)   |
mutex_unlock(&priv->acpi_lock)         |
(...)                                  |

Obviously the ACPI-side transfer will be screwed, as whatever register
value was set during the first step will inevitably have been
overwritten by the Linux-side transfer.

I admit that the probability of this scenario happening is extremely
low, because it will take only one completed ACPI-side transfer (bad
citizen case) to take the hardware lock and not release it, which in
turn will prevent any further access from the Linux side. The above
scenario can therefore only happen if the very first SMBus transfer
from the bad citizen ACPI side happens at exactly the same time as a
transfer from the Linux side.

Question: why do you check that the first action of ACPI AML is to
acquire the hardware lock *only* if that action was attempted while the
Linux side was performing a transfer? That event is quite unlikely to
happen. Can't we perform that test unconditionally the very first time
i801_acpi_io_handler() is called? Unless the i2c-i801 driver gets
initialized in the middle of an ACPI-side SMBus transfer, the first
time i801_acpi_io_handler() is called, and i801_acpi_is_smbus_ioport()
returns true, should correspond to the first step of an ACPI-side SMBus
transfer. If that's not a SMBHSTSTS read then we know we can't trust
the ACPI AML implementation, and Linux-side access should be
prohibited. No need to wait for a transfer collision to make that
decision. What do you think?

-- 
Jean Delvare
SUSE L3 Support
