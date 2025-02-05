Return-Path: <linux-i2c+bounces-9308-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA13FA28C86
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 14:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0DCA3A263A
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 13:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73D7143759;
	Wed,  5 Feb 2025 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNYIWhMw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE3C13D52B
	for <linux-i2c@vger.kernel.org>; Wed,  5 Feb 2025 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738763443; cv=none; b=ffEGiyq2sYLY2ChYQ49KjJ5p3qLInF7x0FtxDrZOrfwLE/H3pnbi/P4brZs9XSOraIlcztRDjoRF2epcIRUQo0wyCWj4COc9na24FnBkpAUWw2EEuDFamlPR1A0knOBDaXUIOEewg9dfCBRzaligWXKJotpEbCbdYPbgXkU9WKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738763443; c=relaxed/simple;
	bh=lwEanwCqS+ujbQLXPxtTAfRgvfSXY8r6JDX/84bbGjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A0F/HZyPCsY2v1CtyBpVj0tkHdC4vGby0hBqt4eR+bHWPCtDGSvaW83YfhXk02OP4DcBaByoyzdGIRe2dtv7s0HFaWsnABsZJ29PX40q5xjG84TEbZQvRdGx5p9azKwXZYS8DuLNygrAu4pOo3UF/GJkRlHZTZC7sBFMW8ZYtoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNYIWhMw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38daa53a296so901114f8f.3
        for <linux-i2c@vger.kernel.org>; Wed, 05 Feb 2025 05:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738763440; x=1739368240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K1CWZIT1Q7cyYh4tfafhX369KJ8GgaT6djQDpo6AZcs=;
        b=hNYIWhMwryU91AvAEs3LWaq7xfZD9rLDDY/iIS/o1ZEfHXhIG7g0AmNg7vtmbffTxq
         8tzqeAQpzwAM9QT0wU2HrDFSQKghGKczvsscofQPwAjQC5dYrxpz9EWHF7IibAWwgRIa
         7yvnFlci/Lvl/amQuJJr7kUIhffk2mOj6FVVNAaTLw4ToLm8iK8VgbDzrVNcqv135g8p
         6NvkibKuE+YDgJdt1DSHO2XLN8MOlihSwNFZOHU6sUeX1ogQHFJpOFLxAeIk7L/7yj4o
         n1BOlQNzgnue8CUuFukAKyJTx86ZnK+CO2BUV5AwC5dsdFFCChqjH5THW983JMvvrM1b
         GjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738763440; x=1739368240;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1CWZIT1Q7cyYh4tfafhX369KJ8GgaT6djQDpo6AZcs=;
        b=J+1djBOdqGLAbAZmi52PifGLadxNFnSZ36VmpLbxlwjuKztvRwt/UPyU0QBWrlTjzl
         DQy1dzvMXLhXYPWZINJQZcOE7A9WwujknxfnicPoyTEBSoxash+2T1+CI6JwAJgCJ9sU
         HCrad/ZOGgoBYhxuYHM2Tq3VeXpejbLMzfV3J2NKe0ZoaQDJvNB0aL8cbCaRhvkLjhvf
         TkUTJKuCW4kM4fLxhgscV7htNVZaY3Ih0lVeybChRmPRLGN7CSNl7aAFTFVx/EfuKH6X
         Dt3phqYcdA7lA41HLfOYcpOiXo7eS+5PniDl5MbrFKrUXfl6N3cBVSDiY6Jicrc/Z+MS
         SbOg==
X-Forwarded-Encrypted: i=1; AJvYcCXGqOsFLovvugNozQ9a4zIaCcJUjghb4fTrPx0tSkxuihYVmqdS4duchquCjlj9J585xsZ06BLAc4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjM+s8vaeOsW+3Ob6tkxlhgsCiZUuZCrE2tLxQ8erir6eer15k
	pdnAYKkEPJz6cZfJ1pQ9Mpd8lNAuTY6+E+5es+Bk3nWQhy45mwkLrHrTCDDJ
X-Gm-Gg: ASbGncu50jN8Id4FIZ04E71UGuGxyNbBfDLR2YxCSqustSXLhY1HDJjRGtthURUFWTA
	qoROr6FQJMLZQ/aKQdAuofb/vTmjh+bAyjTR+NwW5QrwnUm0tNA/B+13EydrYxMPddVqdHmDaSp
	GI9zmU0aD6VBLEOAsF36XyLVbujnA85/O8jn12NqQE8LhSdgXN7iPWZODs1PzhZSDql4ds88BsW
	hfGjNpBmwr2Jgzkeyw+fbIy1IXiwYGf32pygx99u04L88QqwC4ZXMDujD/LkyX6iOfJM5/HWIy7
	LN38Ow+W3bhP4IzBa8Ien3kZwTjOiz+UeAhtnxyEwDWy9Ft4xy+3EKWbvALx4CCYoCm9IueyNXD
	QCzkBynvdHHQ8/uAIpxM4ycnDgxneodF1XoNhPyrgxoEO3MXIE2OQWl/uHZjr8FJb/tx2dNzjRB
	Cv+QguL6s=
X-Google-Smtp-Source: AGHT+IHxmSnk86wd9mr5ZlbwgOKpgKJe7cR8GQcOoAv9e0ZMq7DUARMGVn47RSL618pYBO0voDQ9mA==
X-Received: by 2002:a05:6000:4020:b0:385:de67:2269 with SMTP id ffacd0b85a97d-38db490e248mr2163188f8f.36.1738763439710;
        Wed, 05 Feb 2025 05:50:39 -0800 (PST)
Received: from ?IPV6:2a02:3100:b14d:3b00:3c96:9472:d1b6:5cc4? (dynamic-2a02-3100-b14d-3b00-3c96-9472-d1b6-5cc4.310.pool.telefonica.de. [2a02:3100:b14d:3b00:3c96:9472:d1b6:5cc4])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dac5a3e79sm4839195f8f.63.2025.02.05.05.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 05:50:39 -0800 (PST)
Message-ID: <2750178f-8173-4d43-9c2a-57f1a09d6e69@gmail.com>
Date: Wed, 5 Feb 2025 14:50:58 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] i2c: Fix deadlock on adapter removal
To: Herve Codina <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <71a49125-54a7-4705-b54a-a5e7cc54a78b@gmail.com>
 <20250205090737.3b93ab14@bootlin.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20250205090737.3b93ab14@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.02.2025 09:07, Herve Codina wrote:
> Hi Heiner,
> 
> Cc Luca and Thomas (they are interested in the issue).
> 
> On Tue, 4 Feb 2025 20:54:57 +0100
> Heiner Kallweit <hkallweit1@gmail.com> wrote:
> 
>> i2c_del_adapter() can be called recursively if it has an i2c mux on
>> the bus. This results in a deadlock.
>> We use the lock to protect from parallel unregistering of clients in
>> case driver and adapter are removed at the same time.
>> The fix approach is based on the fact that the used iterators are
>> klist-based. So it's safe to remove list elements during the iteration,
>> and we don't have to acquire the core lock.
>> As a result we just have to prevent that i2c_unregister_device() is
>> executed in parallel for the same client. Use an atomic bit op for this
>> purpose.
>>
>> Fixes: 56a50667cbcf ("i2c: Replace list-based mechanism for handling auto-detected clients")
>> Reported-by: Herve Codina <herve.codina@bootlin.com>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> I tested the patch.
> 
> The deadlock is no more present but I have this new issue using the exact
> same command as the one I used to detect the deadlock:
> 
>     # echo 30a40000.i2c > /sys/bus/platform/drivers/imx-i2c/unbind
>     [   35.221250] Unable to handle ker
>     ** replaying previous printk message **
>     [   35.221250] Unable to handle kernel paging request at virtual address 70ffff8000818b85
>     [   35.221298] Mem abort info:
>     [   35.221330]   ESR = 0x0000000096000005
>     [   35.221347]   EC = 0x25: DABT (current EL), IL = 32 bits
>     [   35.221364]   SET = 0, FnV = 0
>     [   35.221381]   EA = 0, S1PTW = 0
>     [   35.221398]   FSC = 0x05: level 1 translation fault
>     [   35.221415] Data abort info:
>     [   35.221428]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
>     [   35.221445]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>     [   35.221464]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>     [   35.221484] [70ffff8000818b85] address between user and kernel address ranges
>     [   35.221806] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
>     [   35.291401] Modules linked in: fsl_ldb imx8mp_interconnect imx_interconnect leds_pca963x imx_cpufreq_dt imx8mm_thermal lm75 tmp103 rtc_snvs     snvs_pwrkey rtc_rs5c372 pwm_imx27 st_pressure_spi st_sensors_spi regmap_spi st_pressure_i2c st_pressure st_sensors_i2c industrialio_triggered_buffer kfifo_buf st_sensors iio_hwmon gpio_charger led_bl panel_simple opt3001 governor_userspace imx_bus imx8mp_hdmi_tx dw_hdmi dwmac_imx stmmac_platform stmmac pcs_xpcs phylink samsung_dsim imx_sdma imx_lcdif drm_dma_helper imx8mp_hdmi_pvi fsl_imx8_ddr_perf caam exc3000 error pwm_bl ti_sn65dsi83 hotplug_bridge drm_display_helper drm_kms_helper drm drm_panel_orientation_quirks backlight gehc_sunh_connector
>     [   35.352122] CPU: 1 UID: 0 PID: 294 Comm: sh Not tainted 6.14.0-rc1+ #24
>     [   35.358743] Hardware name: HCO board (DT)
>     [   35.365273] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>     [   35.372239] pc : sysfs_remove_groups+0x20/0x70
>     [   35.376695] lr : device_remove_attrs+0xb8/0x100
>     [   35.381237] sp : ffff8000834db9a0
>     [   35.384551] x29: ffff8000834db9a0 x28: ffff000000e58000 x27: 0000000000000000
>     [   35.391700] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
>     [   35.398850] x23: ffff00007bc611b0 x22: ffff800080c4fb01 x21: 0000000000000000
>     [   35.405997] x20: 70ffff8000818b85 x19: ffff00007bc72028 x18: 0000000000000000
>     [   35.413144] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000028
>     [   35.420290] x14: 0000000000000000 x13: 0000000000008d0d x12: ffff000000e58918
>     [   35.427437] x11: ffff8000820618a8 x10: 0000000000000000 x9 : ffff800080733d08
>     [   35.434585] x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : 647165746f623200
>     [   35.441733] x5 : ffff000000e58000 x4 : 0000000029dd16fe x3 : 0000000000000000
>     [   35.448881] x2 : 0000000000000000 x1 : 70ffff8000818b85 x0 : ffff00007bc72028
>     [   35.456030] Call trace:
>     [   35.458478]  sysfs_remove_groups+0x20/0x70 (P)
>     [   35.462932]  device_remove_attrs+0xb8/0x100
>     [   35.467123]  device_del+0x144/0x410
>     [   35.470616]  device_unregister+0x20/0x48
>     [   35.474544]  i2c_unregister_device.part.0+0x64/0xc0
>     [   35.479433]  __unregister_client+0x74/0x80
>     [   35.483539]  device_for_each_child+0x68/0xc8
>     [   35.487818]  i2c_del_adapter+0xac/0x198
>     [   35.491663]  i2c_imx_remove+0x4c/0x190
>     [   35.495419]  platform_remove+0x30/0x58
>     [   35.499179]  device_remove+0x54/0x90
>     [   35.502762]  device_release_driver_internal+0x1e8/0x250
>     [   35.507994]  device_driver_detach+0x20/0x38
>     [   35.512185]  unbind_store+0xbc/0xc8
>     [   35.515680]  drv_attr_store+0x2c/0x48
>     [   35.519349]  sysfs_kf_write+0x54/0x88
>     [   35.523018]  kernfs_fop_write_iter+0x128/0x1c8
>     [   35.527468]  vfs_write+0x290/0x398
>     [   35.530876]  ksys_write+0x70/0x110
>     [   35.534284]  __arm64_sys_write+0x24/0x38
>     [   35.538212]  invoke_syscall+0x50/0x120
>     [   35.541972]  el0_svc_common.constprop.0+0x48/0xf8
>     [   35.546686]  do_el0_svc+0x28/0x40
>     [   35.550009]  el0_svc+0x48/0x110
>     [   35.553159]  el0t_64_sync_handler+0x144/0x168
>     [   35.557522]  el0t_64_sync+0x198/0x1a0
>     [   35.561198] Code: a9bd7bfd 910003fd a90153f3 aa0103f4 (f9400021) 
>     [   35.567295] ---[ end trace 0000000000000000 ]---
> 
> I really don't know if this new issue is related to 56a50667cbcf ("i2c:
> Replace list-based mechanism for handling auto-detected clients") or some
> other patches but for sure it was not present in v6.13.
> 
> Can you have a look?
> 

Dumb error on my side. I2C_CLIENT_UNREGISTERING has to be a bit number.
Just sent a v2 of the patch.

> Feel free to ask for more information or tests I can do to help if needed.
> 
> Best regards,
> Hervé


