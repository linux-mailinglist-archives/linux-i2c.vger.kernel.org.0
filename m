Return-Path: <linux-i2c+bounces-13940-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F8DC28E39
	for <lists+linux-i2c@lfdr.de>; Sun, 02 Nov 2025 12:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E653E3B1731
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Nov 2025 11:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825762D8768;
	Sun,  2 Nov 2025 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="W/OzFMCD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mxout2.routing.net (mxout2.routing.net [134.0.28.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46BE253B52
	for <linux-i2c@vger.kernel.org>; Sun,  2 Nov 2025 11:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762083571; cv=none; b=M41q7mFYaTUlprb4rOwWDaHgsRNGJL3216AGOjVApDsz5SyKiBPUqdOdS9BGxhehzXJfX7sMjpr5NenYxqTxLaRotxDq6lTCZG0+3mHQwAdKy7+sYTehUKVu0oAgrnnIsjIBMkA4XqfqjpR9g2K1EMfC2lNHY6HoA96S/TiOA9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762083571; c=relaxed/simple;
	bh=g2yeOa+R5P8LoB1PGop0sY0k96RpG3QFZe6XXLBCQf8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=BdlYzZJSQ/8GfbQSlXVwFV3vfd+xRJ2WVwrtjiUAV7+tDIfzkjghEOgmVBIGezFFdjNWbjznQ33u0kskg5MpFBW934pplDGrAU6Q/M72n1y7S5ANsjtzusP1/pogFIDV1vRtztHbMzidHVmviMmwcQuNv1kysNnuVBqpj6osnGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=W/OzFMCD; arc=none smtp.client-ip=134.0.28.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id 0C3695FA4D;
	Sun,  2 Nov 2025 11:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1762083560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzwcxPr0NscHpEPz1X5lRPLtMz5DccUGBiu0CWOf65Y=;
	b=W/OzFMCDdMNbX6lHMZEDbt0u2Dw1g9pTIVD2G6lJ9QLrzi1pW7GdrWGw3elHPK6AoKRyY7
	LtL9WsokF/CJWPj2yDH/gVvBgUvdSqC/BovZIY1lmutMffFu3TZJ26ppMTkekVRrz5Bl0h
	CzU69V2yKEZIyzzEH80ozt2jngy71v0=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 7818B40249;
	Sun,  2 Nov 2025 11:39:19 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 02 Nov 2025 12:39:19 +0100
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: angelogioacchino.delregno@collabora.com, matthias.bgg@kernel.org, Andi
 Shyti <andi.shyti@kernel.org>, Qii Wang <qii.wang@mediatek.com>, Wojciech
 Siudy <wojciech.siudy@nokia.com>
Cc: linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 daniel@makrotopia.org
Subject: Re: i2c issues in 6.18 on R4, but not r4pro (both mt7988 with i2c-mux
 on i2c2)
In-Reply-To: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de>
References: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de>
Message-ID: <64fb54d5f2bc929720d3313f7fa2d8cd@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Mail-ID: db96631f-af10-49b0-b5c3-afd717e99135

Hi,

it seems that is caused by these 2 commits:

94c296776403 2025-06-03 i2c: muxes: pca954x: Reset if (de)select fails 
Wojciech Siudy 
690de2902dca 2025-06-03 i2c: muxes: pca954x: Use reset controller only 
Wojciech Siudy 

I'm sure that i had tested with them already reverted, but maybe 
powercycle was not complete.
Git bisect pointed also to "i2c: muxes: pca954x: Use reset controller 
only".

Added Author in To. Maybe he can tell where the gpio-reset should happen 
in i2c core (have not found any recent commit which takes the 
reset-gpios) like stated in the commit

commit 690de2902dca98aec96de004428c020ca902f047
Author: Wojciech Siudy <wojciech.siudy@nokia.com>
Date:   Tue Jun 3 14:47:20 2025 +0200

     i2c: muxes: pca954x: Use reset controller only

     Fallback to legacy reset-gpios is no more needed, because the 
framework
     can use reset-gpios properity now as well.

my dts-config:

	pca9545: i2c-mux@70 {
		compatible = "nxp,pca9545";
		reg = <0x70>;
		reset-gpios = <&pio 5 GPIO_ACTIVE_LOW>;

i'm unsure what devices are shown in the i2cdetect output, as there 
should not be any on same bus, only behind the mux (rtc, eeprom and 
sfp).

[    1.637174] pca954x 2-0070: supply vdd not found, using dummy 
regulator
[    1.675701] i2c i2c-2: Added multiplexed i2c bus 3
[    1.680597] i2c i2c-2: Added multiplexed i2c bus 4
[    1.685472] i2c i2c-2: Added multiplexed i2c bus 5
[    1.690344] i2c i2c-2: Added multiplexed i2c bus 6
[    1.695137] pca954x 2-0070: registered 4 multiplexed busses for I2C 
switch pca9545

looks like devices from channel 0 (rtc@51,eeprom@57) are shown on the 
main bus too.

root@bpi-r4-v11:~
# i2cdetect -y 2
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- UU -- -- -- -- -- UU -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: UU -- -- -- -- -- -- --
root@bpi-r4-v11:~
# i2cdetect -y 3
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- UU -- -- -- -- -- UU -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: UU -- -- -- -- -- -- --
root@bpi-r4-v11:~
# i2cdetect -y 4
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: 50 51 -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: UU -- -- -- -- -- -- --
root@bpi-r4-v11:~
# i2cdetect -y 5
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: UU -- -- -- -- -- -- --
root@bpi-r4-v11:~
# i2cdetect -y 6
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: UU -- -- -- -- -- -- --
root@bpi-r4-v11:~

regards Frank

Am 2025-10-30 11:38, schrieb Frank Wunderlich (linux):
> Hi
> 
> sorry for html-mail, my main email-provider (GMX) sent it as html (have 
> enabled text-mail as default in settings) when using web-mailer.
> 
> i've noticed i2c-issues (i2c2) on mt7988 BPI-R4 with 6.18. On most 
> bootups the i2c-mux is not detected.
>  
> root@bpi-r4-v11:~
> # i2cdetect -y  2
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:                         -- -- -- -- -- -- -- -- 
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
> 70: -- -- -- -- -- -- -- --
>  
> i2c-probe is completed successful (no errors and debugs shown before 
> final "return 0;")
>  
> sometimes the mux came up with same kernel-binary, and i see also other 
> devices on same i2c bus, but mostly all devices are not shown when i 
> use i2cdetect on the bus.
>  
> root@bpi-r4-v11:~
> # i2cdetect -y  2
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
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
> clk_gate,...), pinctrl and the i2c-mux (some reset-related) itself but 
> nothing helped.
>  
> One strange thing is that i have noticed no issues on bpi-r4pro which 
> uses same SoC, same config and should use same drivers and 
> configuration via dt.
> Only diference was the reset for the mux itself in dts as far as i 
> see....so tried to disable it to have it nearly same as on r4pro 
> without any effect.
>  
> Maybe you have any idea how i can nail it down?
>  
> root@bpi-r4-v11:~
> # dmesg | grep -i 'sfp\|i2c'
> [    0.000000] Machine model: Banana Pi BPI-R4 (2x SFP+)
> [    1.600387] i2c_dev: i2c /dev entries driver
> [    1.605291] /soc/i2c@11003000/rt5190a@64: Fixed dependency cycle(s) 
> with /soc/i2c@11003000/rt5190a@64/regulators/buck1 #i2c0 seems not 
> affected
> [   12.685157] platform sfp1: deferred probe pending: (reason unknown)
> [   12.691440] platform sfp2: deferred probe pending: (reason unknown)
>  
> # dmesg | grep -i 'err\|fail\|clk'
> ... #nothing related to i2c or clk
> [    1.623805] pca954x 2-0070: probe failed
> ....
>  
> wondered why i2c-clocks are always disabled when i look into the 
> clk_summary (also when i2c was working)
> 
> root@bpi-r4-v11:~
> # cat /sys/kernel/debug/clk/clk_summary | grep -i -B2 INFRA_I2C_BCK
>              infra_usb_sys           0       0        0       
>  125000000   0          0     50000      N               deviceless     
>            
>           i2c_sel                    0       1        0       
>  125000000   0          0     50000      N            deviceless       
>             
>              infra_i2c_bck           0       3        0       
>  125000000   0          0     50000      N               11005000.i2c   
>            
> root@bpi-r4-v11:~
> 
> but looking at the driver the clocks are disabled on probe which looks 
> strange to me
>  
> https://elixir.bootlin.com/linux/v6.18-rc1/source/drivers/i2c/busses/i2c-mt65xx.c#L1477
>  
> i guess it is some kind of timing issue where clocks are still disabled 
> but not reenabled in mtk_i2c_transfer, but
> my debug in this function shows that is called and ret=0 after the 
> bulk_enable (and of course flooding console :p ).
> maybe some speed-calculation-issue?
>  
> what i had tried to revert (also my own non-mainline like "convert 
> invalid GATE to MUX"), so they seem not the rootcause:
>  
> d51e7cfca3fe 2025-09-25 i2c: mt65xx: convert set_speed function to void 
> Wolfram Sang 
> b49218365280 2025-09-06 i2c: mediatek: fix potential incorrect use of 
> I2C_MASTER_WRRD Leilk.Liu 
> 614b1c3cbfb0 2025-06-12 i2c: use inclusive callbacks in struct 
> i2c_algorithm Wolfram Sang
>  
> c90fa5493f7a 2025-07-31 i2c: mux: pca9541: Use I2C adapter timeout 
> value for arbitration timeout Manikanta Guntupalli 
> 94c296776403 2025-06-03 i2c: muxes: pca954x: Reset if (de)select fails 
> Wojciech Siudy 
> 690de2902dca 2025-06-03 i2c: muxes: pca954x: Use reset controller only 
> Wojciech Siudy 
>  
> e504d3bdb3d0 2025-09-15 clk: mediatek: clk-gate: Add ops for gates with 
> HW voter Laura Nao 
> 8ceff24a754a 2025-09-15 clk: mediatek: clk-gate: Refactor 
> mtk_clk_register_gate to use mtk_gate struct Laura Nao
>  
> bd6f4a91401f 2025-09-02 pinctrl: mediatek: moore: replace struct 
> function_desc with struct pinfunction Bartosz Golaszewski 
> 7a24f1f5b214 2025-09-02 pinctrl: mediatek: mt7988: use 
> PINCTRL_PIN_FUNCTION() Bartosz Golaszewski
>  
> regards Frank

