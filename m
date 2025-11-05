Return-Path: <linux-i2c+bounces-13962-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B13DC355D0
	for <lists+linux-i2c@lfdr.de>; Wed, 05 Nov 2025 12:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D7313B8E84
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Nov 2025 11:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B2830F545;
	Wed,  5 Nov 2025 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NdjqywNP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B11130C370
	for <linux-i2c@vger.kernel.org>; Wed,  5 Nov 2025 11:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762341911; cv=none; b=lJ68ZHg9VKSmubmsdPzDty5RtYERSMkEtjnsJwfpYREePIG89KC8JVXK56SfRwUvk/+/p3MODD/x9nnqEHMwVVBvUt9S8QhuksAivp8H+xCbm18vdGAnbECYr9Z29avf9Whd8iiSuryWBV9W0/AMe9tXexAQKYIKJ/7dxeNZqLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762341911; c=relaxed/simple;
	bh=YtgwmIuO+S6ko8HFKuMO2fihmVHu0zvVmbmvszGEA0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E38aUoOM2hdlT+rqtkONz65SKboTsw4ngjGZQJM4Sk3FyMxOYl1GPdQ6cWI/nctmKILN8El3JPIfOLMcpvwRGzUV0y6tfFIQjIoeGdt5Ay9WJjp2An2AUZnWZPql1IijTiUdMcws0bnEKC+cioZ1oxjm84lrVmpUfrUQgk0hdJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NdjqywNP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762341901;
	bh=YtgwmIuO+S6ko8HFKuMO2fihmVHu0zvVmbmvszGEA0g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NdjqywNPzIMcJbqydpLsqu+OnpMSMuvbXYJ/ZYDU8qQbkhjb8jE/klzudDWB9QTXy
	 5gTYFaNbjaE/AR/FwoBI2A6CCqFyzhWMuEmgUUhvtddTBDadjN6OWfy5/cGCs4q8wD
	 3qs8NXxBmp1e1xNLl7GBMq8KbL8PUN6qXRLH+pVaIIIu5wSFEB6kp+y2OTj2CjmAiy
	 1wTAiZ8zpauVrg+akU52PmStDo+ZeLxjbnw88IsRGe6opy02QfUl/9Tmrz13qEqM7X
	 CdJL/sRRkj2xbg+Hs4/68zSzn8t8q+UDcEcwe2pES8y5BSZFkzBf7mdmt6qvjuKmq6
	 k+Zzf41nwsypw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8829617E12AA;
	Wed,  5 Nov 2025 12:25:01 +0100 (CET)
Message-ID: <b4ffe62d-34f6-431d-87b1-55ca988b63b7@collabora.com>
Date: Wed, 5 Nov 2025 12:25:00 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c issues in 6.18 on R4, but not r4pro (both mt7988 with i2c-mux
 on i2c2)
To: "Frank Wunderlich (linux)" <linux@fw-web.de>, matthias.bgg@kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Qii Wang <qii.wang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 daniel@makrotopia.org
References: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 30/10/25 11:38, Frank Wunderlich (linux) ha scritto:
> Hi
> 
> sorry for html-mail, my main email-provider (GMX) sent it as html (have enabled 
> text-mail as default in settings) when using web-mailer.
> 
> i've noticed i2c-issues (i2c2) on mt7988 BPI-R4 with 6.18. On most bootups the i2c- 
> mux is not detected.
> 
> root@bpi-r4-v11:~
> # i2cdetect -y  2
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:                         -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
> 
> i2c-probe is completed successful (no errors and debugs shown before final "return 
> 0;")
> 
> sometimes the mux came up with same kernel-binary, and i see also other devices on 
> same i2c bus, but mostly all devices are not shown when i use i2cdetect on the bus.
> 
> root@bpi-r4-v11:~
> # i2cdetect -y  2
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:                         -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 50: -- UU -- -- -- -- -- UU -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: UU -- -- -- -- -- -- --
> root@bpi-r4-v11:~
> # [   58.594846] sfp sfp1: failed to read EEPROM: -ENXIO
> 
> 6.17 seems ok (have not seen the issue there yet).
> 
> i looked through many commits, reverted some for clock (my own, lauras 
> clk_gate,...), pinctrl and the i2c-mux (some reset-related) itself but nothing helped.
> 
> One strange thing is that i have noticed no issues on bpi-r4pro which uses same 
> SoC, same config and should use same drivers and configuration via dt.
> Only diference was the reset for the mux itself in dts as far as i see....so tried 
> to disable it to have it nearly same as on r4pro without any effect.
> 
> Maybe you have any idea how i can nail it down?
> 

Did you check if there's any clock, or power rail, or power domain, that you are
missing in some node perhaps?

Could be that something is getting powered off temporarily and gifting you with
this "amazing" issue...

> root@bpi-r4-v11:~
> # dmesg | grep -i 'sfp\|i2c'
> [    0.000000] Machine model: Banana Pi BPI-R4 (2x SFP+)
> [    1.600387] i2c_dev: i2c /dev entries driver
> [    1.605291] /soc/i2c@11003000/rt5190a@64: Fixed dependency cycle(s) with /soc/ 
> i2c@11003000/rt5190a@64/regulators/buck1 #i2c0 seems not affected
> [   12.685157] platform sfp1: deferred probe pending: (reason unknown)
> [   12.691440] platform sfp2: deferred probe pending: (reason unknown)
> 
> # dmesg | grep -i 'err\|fail\|clk'
> ... #nothing related to i2c or clk
> [    1.623805] pca954x 2-0070: probe failed
> ....
> 
> wondered why i2c-clocks are always disabled when i look into the clk_summary (also 
> when i2c was working)
> 

That is something for which I can give you a clear answer....

> root@bpi-r4-v11:~
> # cat /sys/kernel/debug/clk/clk_summary | grep -i -B2 INFRA_I2C_BCK
>               infra_usb_sys           0       0        0        125000000   0       
>     0     50000      N               deviceless
>            i2c_sel                    0       1        0        125000000   0       
>     0     50000      N            deviceless
>               infra_i2c_bck           0       3        0        125000000   0       
>     0     50000      N               11005000.i2c
> root@bpi-r4-v11:~
> 
> but looking at the driver the clocks are disabled on probe which looks strange to me
> 
> https://elixir.bootlin.com/linux/v6.18-rc1/source/drivers/i2c/busses/i2c- 
> mt65xx.c#L1477

...Not strange at all...

> 
> i guess it is some kind of timing issue where clocks are still disabled but not 
> reenabled in mtk_i2c_transfer, but
> my debug in this function shows that is called and ret=0 after the bulk_enable (and 
> of course flooding console :p ).

...because on MediaTek, the I2C controllers are "kinda standalone" - meaning that
they work as long as they're powered up, with their main clock being either some
internal XO or the clk26m or a clock derived from that (it's bogus, as that is an
IP implementation detail that nobody has, if not MediaTek's HW engineering dept,
and it's not relevant anyway so we don't even need to really know if not for pure
curiosity).

The basic "unclocked" functionality of the I2C controller(s) in MediaTek SoCs is
XFER detection (not sure if they can do buffering as well while the AP-driven
clocks are off).

As a small side note: I think MediaTek are not the only ones doing that, but this
is an entirely different story and it's just for your own curiosity, in case.

The I2C clocks therefore are only enabling the CPU to perform read/write(/modify)
operations on the I2C Controller registers, which also include DMA transfers.

Speaking of DMA, is there really no support for apdma_sync in MT7988a? ;-)

> maybe some speed-calculation-issue?
> 

Could also be, but if it was that, and directly related to I2C, you'd get errors
during communication even when your PCA954X device actually gets probed, because
whatever calculation is ran, it's always going to be the same across reboots.

All that I'm saying here, though, ignores hardware issues. So, if you're using a
board that is not final, or a final board that has HW issues (not only as in your
own unit, but as a design mistake of some sort) it's a different story.

I am bringing up the HW question just because "better safe than sorry", but if
using something not final.. I'm mostly sure that you would've said that already
and tried with.. well, final hardware, before seeking for help here anyway :-)

Cheers!
Angelo

> what i had tried to revert (also my own non-mainline like "convert invalid GATE to 
> MUX"), so they seem not the rootcause:
> 
> d51e7cfca3fe 2025-09-25 i2c: mt65xx: convert set_speed function to void Wolfram Sang
> b49218365280 2025-09-06 i2c: mediatek: fix potential incorrect use of 
> I2C_MASTER_WRRD Leilk.Liu
> 614b1c3cbfb0 2025-06-12 i2c: use inclusive callbacks in struct i2c_algorithm 
> Wolfram Sang
> 
> c90fa5493f7a 2025-07-31 i2c: mux: pca9541: Use I2C adapter timeout value for 
> arbitration timeout Manikanta Guntupalli
> 94c296776403 2025-06-03 i2c: muxes: pca954x: Reset if (de)select fails Wojciech Siudy
> 690de2902dca 2025-06-03 i2c: muxes: pca954x: Use reset controller only Wojciech Siudy
> 
> e504d3bdb3d0 2025-09-15 clk: mediatek: clk-gate: Add ops for gates with HW voter 
> Laura Nao
> 8ceff24a754a 2025-09-15 clk: mediatek: clk-gate: Refactor mtk_clk_register_gate to 
> use mtk_gate struct Laura Nao
> 
> bd6f4a91401f 2025-09-02 pinctrl: mediatek: moore: replace struct function_desc with 
> struct pinfunction Bartosz Golaszewski
> 7a24f1f5b214 2025-09-02 pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION() 
> Bartosz Golaszewski
> 
> regards Frank



