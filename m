Return-Path: <linux-i2c+bounces-9296-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9046BA275BF
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 16:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA2BC7A1714
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 15:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE1E214205;
	Tue,  4 Feb 2025 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iYZfD0iF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DE5213E81;
	Tue,  4 Feb 2025 15:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738682687; cv=none; b=gl+RsWEywp9l1wnl8P4DfcGiKcyVG3tN0t+dVE8rjRQlQOlxLvQm3C5PRxcFfes+OTW55tC5FtgYMYWQPye6N3TBB3DJdI/FQ1DjTGUKHlZ3DCkM7Gx1vnSSWu8uoD8axs58XPsoLLwJI7z9pkimdvS/PL/5TAHhCMZ+3rEMcgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738682687; c=relaxed/simple;
	bh=Nuo81FcmD4KBZEdS2L2pE9/oNfDMpxWPDg739U/4d0k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mu6n199ibXus/lGa7Iw3BoURAto7V+nuTziSVOe8SLEWoZI+hufByYjJ3s5531CR2mJUfjPzC+Kqd0rDB0SKIwolEthE1NWWXEnJW7r/l5zY5kdnpbdvkCi0rGJyGqkk+28Nufm2N+fwe9cldZpxXHPvSSIdzRk2HH7tqWiQhEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iYZfD0iF; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B36EF4436A;
	Tue,  4 Feb 2025 15:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738682683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=riwqpBO7JGlZmT+I3/ggQhYGhbYV8kvYhqKEoegTbhE=;
	b=iYZfD0iFB2wdcipFCLiYHeFxFwrg/EiEMUsLVKHj9/bFhuMUwOpmVRfcwz/Q8ajjfUUmOj
	UOEkCieOP9iFvbgMx5nRDOxx8lBCecfHKsEsRfvbcae5MzFYMjSjXMgU8sJ2V/lrDCw5TL
	kHu97/Zc9heupS+jgY3ks85M9Fzo7zRBa8O8GKwZuanmq/i+ScUkY6RN7wDtaLJFxQaJNL
	QqKlVwUt7rr9N8KjVwwx9ddMWQdH3OpRDfkMaASiKUxo046GSYf+TPagvNK5K1eG8Hr505
	Iz7Ogd/za8SEQzUxA6udzPfnGhc/gmbYhuHpD+C2GAgQzgHKLlRaa0mmz2RYtw==
Date: Tue, 4 Feb 2025 16:24:42 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>, linux-sound@vger.kernel.org, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 2/4] i2c: Replace list-based mechanism for handling
 auto-detected clients
Message-ID: <20250204162442.25e72682@bootlin.com>
In-Reply-To: <ad839a82-8694-4f99-b1c1-0ee53c9d40cf@gmail.com>
References: <97970201-24fd-473d-b20a-d21d2cd468f3@gmail.com>
	<ad839a82-8694-4f99-b1c1-0ee53c9d40cf@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopeifshgrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtihifrghisehsuhhsvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhiv
 dgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi,

Got a deadlock issue with this patch in v6.14-rc1.

On Fri, 1 Nov 2024 23:09:51 +0100
Heiner Kallweit <hkallweit1@gmail.com> wrote:

> So far a list is used to track auto-detected clients per driver.
> The same functionality can be achieved much simpler by flagging
> auto-detected clients.
> 
> Two notes regarding the usage of driver_for_each_device:
> In our case it can't fail, however the function is annotated __must_check.
> So a little workaround is needed to avoid a compiler warning.
> Then we may remove nodes from the list over which we iterate.
> This is safe, see the explanation at the beginning of lib/klist.c.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v3:
> - protect client removal with core_lock mutex
> ---
>  drivers/i2c/i2c-core-base.c | 52 ++++++++++++-------------------------
>  include/linux/i2c.h         |  3 +--
>  2 files changed, 17 insertions(+), 38 deletions(-)
> 
...

> @@ -1780,8 +1752,10 @@ void i2c_del_adapter(struct i2c_adapter *adap)
>  	 * we can't remove the dummy devices during the first pass: they
>  	 * could have been instantiated by real devices wishing to clean
>  	 * them up properly, so we give them a chance to do that first. */
> +	mutex_lock(&core_lock);
>  	device_for_each_child(&adap->dev, NULL, __unregister_client);
>  	device_for_each_child(&adap->dev, NULL, __unregister_dummy);
> +	mutex_unlock(&core_lock);
>  

Calling __unregister_client() with core_lock mutex held leads to a deadlock
in my case:

    # echo 30a40000.i2c > /sys/bus/platform/drivers/imx-i2c/unbind
    [  242.928264] 
    [  242.929779] ============================================
    [  242.935092] WARNING: possible recursive locking detected
    [  242.940406] 6.14.0-rc1+ #22 Not tainted
    [  242.944245] --------------------------------------------
    [  242.949556] sh/299 is trying to acquire lock:
    [  242.953915] ffff8000818b82e0 (core_lock){+.+.}-{4:4}, at: i2c_del_adapter+0x44/0x1b0
    [  242.961689] 
    [  242.961689] but task is already holding lock:
    [  242.967524] ffff8000818b82e0 (core_lock){+.+.}-{4:4}, at: i2c_del_adapter+0xa0/0x1b0
    [  242.975285] 
    [  242.975285] other info that might help us debug this:
    [  242.981814]  Possible unsafe locking scenario:
    [  242.981814] 
    [  242.987732]        CPU0
    [  242.990179]        ----
    [  242.992625]   lock(core_lock);
    [  242.995686]   lock(core_lock);
    [  242.998748] 
    [  242.998748]  *** DEADLOCK ***
    [  242.998748] 
    [  243.004666]  May be due to missing lock nesting notation
    [  243.004666] 
    [  243.011455] 5 locks held by sh/299:
    [  243.014946]  #0: ffff000079a533f0 (sb_writers#6){.+.+}-{0:0}, at: vfs_write+0x1c4/0x398
    [  243.022976]  #1: ffff000005c29088 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_fop_write_iter+0xf8/0x1c8
    [  243.031962]  #2: ffff000000c240f8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x48/0x250
    [  243.041645]  #3: ffff8000818b82e0 (core_lock){+.+.}-{4:4}, at: i2c_del_adapter+0xa0/0x1b0
    [  243.049845]  #4: ffff000079f24908 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x48/0x250
    [  243.059522] 
    [  243.059522] stack backtrace:
    [  243.063883] CPU: 2 UID: 0 PID: 299 Comm: sh Not tainted 6.14.0-rc1+ #22
    [  243.070502] Hardware name: GE HealthCare Supernova Patient Hub v1 (DT)
    [  243.077032] Call trace:
    [  243.079481]  show_stack+0x20/0x38 (C)
    [  243.083152]  dump_stack_lvl+0x90/0xd0
    [  243.086819]  dump_stack+0x18/0x28
    [  243.090140]  print_deadlock_bug+0x260/0x350
    [  243.094332]  __lock_acquire+0x113c/0x2180
    [  243.098346]  lock_acquire+0x1c4/0x350
    [  243.102015]  __mutex_lock+0x9c/0x500
    [  243.105599]  mutex_lock_nested+0x2c/0x40
    [  243.109528]  i2c_del_adapter+0x44/0x1b0
    [  243.113371]  i2c_mux_del_adapters+0xa0/0x100
    [  243.117649]  pca954x_cleanup+0x98/0xd0
    [  243.121406]  pca954x_remove+0x38/0x50
    [  243.125078]  i2c_device_remove+0x34/0xb8
    [  243.129007]  device_remove+0x54/0x90
    [  243.132590]  device_release_driver_internal+0x1e8/0x250
    [  243.137824]  device_release_driver+0x20/0x38
    [  243.142101]  bus_remove_device+0xd4/0x120
    [  243.146116]  device_del+0x14c/0x410
    [  243.149612]  device_unregister+0x20/0x48
    [  243.153540]  i2c_unregister_device.part.0+0x50/0x88
    [  243.158427]  __unregister_client+0x74/0x80
    [  243.162530]  device_for_each_child+0x68/0xc8
    [  243.166811]  i2c_del_adapter+0xb8/0x1b0
    [  243.170653]  i2c_imx_remove+0x4c/0x190
    [  243.174412]  platform_remove+0x30/0x58
    [  243.178167]  device_remove+0x54/0x90
    [  243.181751]  device_release_driver_internal+0x1e8/0x250
    [  243.186982]  device_driver_detach+0x20/0x38
    [  243.191172]  unbind_store+0xbc/0xc8
    ...

When I unbind the i2c SoC adapter driver, i2c_del_adapter() is indeed called
recursively. The first call is for the 30a40000.i2c SoC adapter and the
second one for an i2c mux connected on the i2c bus.

My device-tree looks like this:
	i2c@30a40000 {
		compatible = "fsl,imx8mp-i2c", "fsl,imx21-i2c";
		...
		i2c-mux@70 {
			compatible = "nxp,pca9543";
			...
			i2c@0 {
				...
				touchscreen@2a {
					compatible = "eeti,exc80h60";
					...
				};
			};
			
			i2c@1 {
				...
			};
		};
	};


Should the core_lock mutex be taken when both __unregister_client() and
__unregister_dummy() are called ?

Best regards,
Hervé Codina

