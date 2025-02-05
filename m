Return-Path: <linux-i2c+bounces-9299-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD726A2854E
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 09:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 160D53A25D6
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 08:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E262288EB;
	Wed,  5 Feb 2025 08:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V3UB5aW5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883AA2147E6
	for <linux-i2c@vger.kernel.org>; Wed,  5 Feb 2025 08:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738742865; cv=none; b=ZtqgYp1nqoJ7tE0s2DEqB2c6AceO1AzS8yB+6RvIPM1KgzVn1bUI694D48xi+E4DQmA5iPYc4brzuSSHQ5T2SspTY1EtK1KtP+FGRhVG1uT4Lq7e2Kq20Q0OrrIJW2hHMqLs5kl34aDRC3i6O0Aid4jDyiLPQIjB/QEKpgo7fcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738742865; c=relaxed/simple;
	bh=e5lR1tA8FGQm/n3hloNbvSlcN0703TplNUyt0JsQquE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eyu8NxDaaNM64dPbH5UUPU0CwIE/x36Cclc+DloNi4wUiU5ISrapb8nUANxYUnzMF9eHoqYKbHmA7QGS/lC9OIiqUdqWJKGrTklF354umMfNVwPEyzhjs3oJADXXKOLNuG31FyCgaG0ZEquYZdjf+dEiINkcqCupscXeM3dCUUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V3UB5aW5; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C71B443E3;
	Wed,  5 Feb 2025 08:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738742858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JCVCgI33SLl03okJRDnKt8RNBcPsuWcP4VXNlIAs/Mc=;
	b=V3UB5aW5ggREP8s1f9FCn9J735TwMgXXe2phiSLS2GJlagfq7rz7uVa9cXD2sT0CiNbdz8
	tRo6C4MeSDOqpK4W6jzhozNDDqI8C2XF/z7TqI5gFkSxswEaoQGEmb3ipqI9r9f6j2euOr
	1q6dRfTFq7xiKhHtIUxddxfPVFdqsBipdefxmMJesMXmNzX+7oDnGUDlBy/vjTaecLWhKb
	FQluaSKAnDnYoPv1F06psElKBMBXptTMNOZn9fRITZWhOIDb1p4FNhJuGQIbI5I4eOYrx0
	YvpsckwlCzINYM5qT88q6BZVqwg138pE6UeTbmQE3ywPLJfssZGYS6DdidM8AQ==
Date: Wed, 5 Feb 2025 09:07:37 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH RFC] i2c: Fix deadlock on adapter removal
Message-ID: <20250205090737.3b93ab14@bootlin.com>
In-Reply-To: <71a49125-54a7-4705-b54a-a5e7cc54a78b@gmail.com>
References: <71a49125-54a7-4705-b54a-a5e7cc54a78b@gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopeifshgrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtl
 hhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

Hi Heiner,

Cc Luca and Thomas (they are interested in the issue).

On Tue, 4 Feb 2025 20:54:57 +0100
Heiner Kallweit <hkallweit1@gmail.com> wrote:

> i2c_del_adapter() can be called recursively if it has an i2c mux on
> the bus. This results in a deadlock.
> We use the lock to protect from parallel unregistering of clients in
> case driver and adapter are removed at the same time.
> The fix approach is based on the fact that the used iterators are
> klist-based. So it's safe to remove list elements during the iteration,
> and we don't have to acquire the core lock.
> As a result we just have to prevent that i2c_unregister_device() is
> executed in parallel for the same client. Use an atomic bit op for this
> purpose.
> 
> Fixes: 56a50667cbcf ("i2c: Replace list-based mechanism for handling auto-detected clients")
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

I tested the patch.

The deadlock is no more present but I have this new issue using the exact
same command as the one I used to detect the deadlock:

    # echo 30a40000.i2c > /sys/bus/platform/drivers/imx-i2c/unbind
    [   35.221250] Unable to handle ker
    ** replaying previous printk message **
    [   35.221250] Unable to handle kernel paging request at virtual address 70ffff8000818b85
    [   35.221298] Mem abort info:
    [   35.221330]   ESR = 0x0000000096000005
    [   35.221347]   EC = 0x25: DABT (current EL), IL = 32 bits
    [   35.221364]   SET = 0, FnV = 0
    [   35.221381]   EA = 0, S1PTW = 0
    [   35.221398]   FSC = 0x05: level 1 translation fault
    [   35.221415] Data abort info:
    [   35.221428]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
    [   35.221445]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
    [   35.221464]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
    [   35.221484] [70ffff8000818b85] address between user and kernel address ranges
    [   35.221806] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
    [   35.291401] Modules linked in: fsl_ldb imx8mp_interconnect imx_interconnect leds_pca963x imx_cpufreq_dt imx8mm_thermal lm75 tmp103 rtc_snvs     snvs_pwrkey rtc_rs5c372 pwm_imx27 st_pressure_spi st_sensors_spi regmap_spi st_pressure_i2c st_pressure st_sensors_i2c industrialio_triggered_buffer kfifo_buf st_sensors iio_hwmon gpio_charger led_bl panel_simple opt3001 governor_userspace imx_bus imx8mp_hdmi_tx dw_hdmi dwmac_imx stmmac_platform stmmac pcs_xpcs phylink samsung_dsim imx_sdma imx_lcdif drm_dma_helper imx8mp_hdmi_pvi fsl_imx8_ddr_perf caam exc3000 error pwm_bl ti_sn65dsi83 hotplug_bridge drm_display_helper drm_kms_helper drm drm_panel_orientation_quirks backlight gehc_sunh_connector
    [   35.352122] CPU: 1 UID: 0 PID: 294 Comm: sh Not tainted 6.14.0-rc1+ #24
    [   35.358743] Hardware name: HCO board (DT)
    [   35.365273] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    [   35.372239] pc : sysfs_remove_groups+0x20/0x70
    [   35.376695] lr : device_remove_attrs+0xb8/0x100
    [   35.381237] sp : ffff8000834db9a0
    [   35.384551] x29: ffff8000834db9a0 x28: ffff000000e58000 x27: 0000000000000000
    [   35.391700] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
    [   35.398850] x23: ffff00007bc611b0 x22: ffff800080c4fb01 x21: 0000000000000000
    [   35.405997] x20: 70ffff8000818b85 x19: ffff00007bc72028 x18: 0000000000000000
    [   35.413144] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000028
    [   35.420290] x14: 0000000000000000 x13: 0000000000008d0d x12: ffff000000e58918
    [   35.427437] x11: ffff8000820618a8 x10: 0000000000000000 x9 : ffff800080733d08
    [   35.434585] x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : 647165746f623200
    [   35.441733] x5 : ffff000000e58000 x4 : 0000000029dd16fe x3 : 0000000000000000
    [   35.448881] x2 : 0000000000000000 x1 : 70ffff8000818b85 x0 : ffff00007bc72028
    [   35.456030] Call trace:
    [   35.458478]  sysfs_remove_groups+0x20/0x70 (P)
    [   35.462932]  device_remove_attrs+0xb8/0x100
    [   35.467123]  device_del+0x144/0x410
    [   35.470616]  device_unregister+0x20/0x48
    [   35.474544]  i2c_unregister_device.part.0+0x64/0xc0
    [   35.479433]  __unregister_client+0x74/0x80
    [   35.483539]  device_for_each_child+0x68/0xc8
    [   35.487818]  i2c_del_adapter+0xac/0x198
    [   35.491663]  i2c_imx_remove+0x4c/0x190
    [   35.495419]  platform_remove+0x30/0x58
    [   35.499179]  device_remove+0x54/0x90
    [   35.502762]  device_release_driver_internal+0x1e8/0x250
    [   35.507994]  device_driver_detach+0x20/0x38
    [   35.512185]  unbind_store+0xbc/0xc8
    [   35.515680]  drv_attr_store+0x2c/0x48
    [   35.519349]  sysfs_kf_write+0x54/0x88
    [   35.523018]  kernfs_fop_write_iter+0x128/0x1c8
    [   35.527468]  vfs_write+0x290/0x398
    [   35.530876]  ksys_write+0x70/0x110
    [   35.534284]  __arm64_sys_write+0x24/0x38
    [   35.538212]  invoke_syscall+0x50/0x120
    [   35.541972]  el0_svc_common.constprop.0+0x48/0xf8
    [   35.546686]  do_el0_svc+0x28/0x40
    [   35.550009]  el0_svc+0x48/0x110
    [   35.553159]  el0t_64_sync_handler+0x144/0x168
    [   35.557522]  el0t_64_sync+0x198/0x1a0
    [   35.561198] Code: a9bd7bfd 910003fd a90153f3 aa0103f4 (f9400021) 
    [   35.567295] ---[ end trace 0000000000000000 ]---

I really don't know if this new issue is related to 56a50667cbcf ("i2c:
Replace list-based mechanism for handling auto-detected clients") or some
other patches but for sure it was not present in v6.13.

Can you have a look?

Feel free to ask for more information or tests I can do to help if needed.

Best regards,
Hervé

