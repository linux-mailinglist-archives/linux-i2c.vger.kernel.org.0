Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F956B170A
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2019 03:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbfIMBUq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Sep 2019 21:20:46 -0400
Received: from mout.gmx.net ([212.227.17.20]:53939 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726070AbfIMBUq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 12 Sep 2019 21:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1568337626;
        bh=iBU9cWNR3ZA63G/kW/3WSfgT8Z4NUQ6V4SnDXgffRXE=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=ZRSPKPFj4kgHO9TlXSJxMINYa/itGGfOS8cxNmBO7SfXpiVixlNA0OmSGPVXqNx6k
         XEM92/X0XKGSIoJOsTz0riuHuo6CRDl3suydCJ8b55nrMJzIQqVw9hvGOtBa8KYTLR
         EFzxozZZO5J8W8FTNxJJttGFkvkSorUUHpaasXlo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.90]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MSq5p-1hjSD10BgD-00RsKl; Fri, 13
 Sep 2019 03:20:26 +0200
Subject: Re: [PATCH V2 05/13] clk: bcm2835: Add BCM2711_CLOCK_EMMC2 support
To:     Eric Anholt <eric@anholt.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
 <1565713248-4906-6-git-send-email-wahrenst@gmx.net>
 <d89bbc4b-b6bc-0d4e-86d1-6be11876ce00@gmail.com> <87o8zp1h4u.fsf@anholt.net>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <097c31de-4b11-92a8-af22-c34d6317359c@gmx.net>
Date:   Fri, 13 Sep 2019 03:20:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87o8zp1h4u.fsf@anholt.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:YTCNV7hqjuTzwKRxgfTRYGGrsNBZn0ALsKYUWDzWLnvq3ifMVUQ
 ygX1ID/JAhyMbEzm9ecqmkpJT1KHQM/D54lS3EZx6jfN6pWT96WIhDZnwcx77FGWfPuoJF+
 dbLMWeS35UEXwexfTkp163sq1tcIhUa3sEQkA0KfRpWR6RB2X7Xm2bSBM+9id0FfehPLnba
 sz1/EphAwDPWIoEYgGq5A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9F4ZlH7avzE=:FLFSbBk2OHT/HwyLJpXNsd
 jLX3pvQAmNyMR8jJVMAGHJxUSIX3usKyTyvzIXqLmeSu2y0c0RMLbpZTRQmo0RDa35FiepBtQ
 rVV6uDw6Sl20efvsydVsUDPPmOqUqtdnxNDCGZdEHH62pu75S1NvNY/UfZzGA4v+NGnvB+fbm
 SmWjYY1AG2EFGPr+a/h8ufLNWXZPG/15Yq2WWiBT3MvdsPJVA1Zprrj2hyxkqI9MV/Gy55nLu
 FS8kXwU1JI5BZl2jmeFpbsUQ73sUoOUKjeYeapWdigD4LgnB4kDxbXS7gqBG8lEoRHjf/wolK
 nR7Jqqrw0UJuEd5laHQWge+svR5PHCcdrJ2c6Kbn4oqd3/V4AynYN0FThAjT22CCQy/U5kwAz
 4MUzYImmcngeILTIkkQ7Eo0uSzyF2SjXIRNwW2IJ6bWoscwRc7Nz02YsqMBkw9xQ0GdKMs0Ed
 pjNv5iqOS2cMbwvheVAHVl3yIVamkEIk6ErHff3pJSkoOx3ROyOn0YqrofYh7JPcLuCelFrdr
 i9eOzQmr5q6Bcnev8NXJms4z8hZJ1taw+Zv2QvluWSn5NLNN8eUoYdzjCP1Zc+ieUdM2pomxR
 PcOERPyNA7QTI9goWixw7Vd7noHyWDdYj4vyEZR1hyybfivKVORafa1Hr5OV+goCOtZho40iN
 VEAWkV89TTrY5nKYPpP6ZOz3mUtO0iVQHTJzs7o/gN7xwCyKfI6fokaqh1s4rUttxtJJk3ycF
 7haru+RVZPihk5KnTrh1MiXMQlnswfq84yc9UAv5RUDXZNc1xOrmFY5y4+31HBZkBEfatk4cV
 RiNRTjHDO3Cy0sCBEVP9+HVKcrWe5C/5LUqcTjhSej9tmdtgBHZ01KffIN2PL+CyPx8EVjmWA
 lqqMpy3WThYhuPtGZTz4feNkiJTE3MWfkJUIl4HZmV5CTIRjzpjxNZVkYrUS4c0HtWK09Dv53
 4C9HIH7sCIqpFuNLs7phDepxIF/02D2mMAyAf8cW8jpJrZOA22135yXmFM811JNCzkSP18xfx
 QVe4G2uvHLpd0SzHUISj5C6tIJiH/FaTVQtrT23h+UI3c1FAg2JnZbG0depgBWkODKYBlfEHz
 vPb2WQwgcsCKID8pbOumYzHXklZBIkglnKQoVUYLA3Rp92M4XG6SkFyVRA3IHmTklEzJNxmj6
 kxlygc2hMAOAR8hVn38v+JCBjai7Q7m5CGU18ersh64XKQqO9ijqSRd3HqxBcwOU4NUiE89Yo
 SJxBxg6LAomTApg273lr5xtavfEPtPy8FM+80ilM7TCeZxCVfeunJxiFFpK4=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am 12.09.19 um 20:52 schrieb Eric Anholt:
> Matthias Brugger <matthias.bgg@gmail.com> writes:
>
>> On 13/08/2019 18:20, Stefan Wahren wrote:
>>> The new BCM2711 supports an additional clock for the emmc2 block.
>>> So add a new compatible and register this clock only for BCM2711.
>>>
>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>>> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
>>> Acked-by: Eric Anholt <eric@anholt.net>
>>> ---
>>>  drivers/clk/bcm/clk-bcm2835.c | 20 +++++++++++++++++++-
>>>  1 file changed, 19 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
>>> index 21cd952..fdf672a 100644
>>> --- a/drivers/clk/bcm/clk-bcm2835.c
>>> +++ b/drivers/clk/bcm/clk-bcm2835.c
>>> @@ -114,6 +114,8 @@
>>>  #define CM_AVEODIV		0x1bc
>>>  #define CM_EMMCCTL		0x1c0
>>>  #define CM_EMMCDIV		0x1c4
>>> +#define CM_EMMC2CTL		0x1d0
>>> +#define CM_EMMC2DIV		0x1d4
>>>
>>>  /* General bits for the CM_*CTL regs */
>>>  # define CM_ENABLE			BIT(4)
>>> @@ -290,7 +292,8 @@
>>>  #define BCM2835_MAX_FB_RATE	1750000000u
>>>
>>>  #define SOC_BCM2835		BIT(0)
>>> -#define SOC_ALL			(SOC_BCM2835)
>>> +#define SOC_BCM2711		BIT(1)
>>> +#define SOC_ALL			(SOC_BCM2835 | SOC_BCM2711)
>>>
>>>  /*
>>>   * Names of clocks used within the driver that need to be replaced
>>> @@ -2003,6 +2006,16 @@ static const struct bcm2835_clk_desc clk_desc_array[] = {
>>>  		.frac_bits = 8,
>>>  		.tcnt_mux = 39),
>>>
>>> +	/* EMMC2 clock (only available for BCM2711) */
>>> +	[BCM2711_CLOCK_EMMC2]	= REGISTER_PER_CLK(
>>> +		SOC_BCM2711,
>>> +		.name = "emmc2",
>>> +		.ctl_reg = CM_EMMC2CTL,
>>> +		.div_reg = CM_EMMC2DIV,
>>> +		.int_bits = 4,
>>> +		.frac_bits = 8,
>>> +		.tcnt_mux = 42),
>>> +
>>>  	/* General purpose (GPIO) clocks */
>>>  	[BCM2835_CLOCK_GP0]	= REGISTER_PER_CLK(
>>>  		SOC_ALL,
>>> @@ -2238,8 +2251,13 @@ static const struct cprman_plat_data cprman_bcm2835_plat_data = {
>>>  	.soc = SOC_BCM2835,
>>>  };
>>>
>>> +static const struct cprman_plat_data cprman_bcm2711_plat_data = {
>>> +	.soc = SOC_BCM2711,
>>> +};
>>> +
>>>  static const struct of_device_id bcm2835_clk_of_match[] = {
>>>  	{ .compatible = "brcm,bcm2835-cprman", .data = &cprman_bcm2835_plat_data },
>>> +	{ .compatible = "brcm,bcm2711-cprman", .data = &cprman_bcm2711_plat_data },
>> Because the RPi4 FW uses bcm2838-cprman as compatible, we will need to add this
>> here as well.
> Upstream has not committed to backwards compat with Pi's firmware.  That
> makes the ABI requirement we get held to for upstream's DT absurd, but
> that's the state of things.

We also learned from past, that's not possible to keep things downstream
compatible. As soon as a binding is not accepted, this wont work
anymore. A lot of the downstream stuff is hacky.

For example yesterday, i learned that the thermal node is broken
(register is part of ring oscillator block). So do we really want to be
compatible with a hack? I would say: No

