Return-Path: <linux-i2c+bounces-884-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4ED818E22
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 18:32:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B108928655A
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 17:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38DA12D7A6;
	Tue, 19 Dec 2023 17:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DREywg/P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330F1286A6
	for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 17:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5cda24a77e0so1268574a12.2
        for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 09:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703007110; x=1703611910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNuSOIUI5x4sS7b6TcbJmnlVmXjTRkIFXpOBXzrlw3w=;
        b=DREywg/PBO41JJuxCDs8Oz9LldHyDbpaW6ty4KK5CD/uNipQ7iEI51Xr58/SeiB/dP
         cFyVue2MQBWH6hURHg9vlaFnaTXU9FtxEtgpvhW2Sx82iL5rEUF2J3LmpLxcudwrgadU
         V/mv2aYpuO7goABDobJAYDGHXrPOG6PJVVHm+1ASvjqGVqLwlYeTTbQ/XCK9+3MwYSWP
         vDtacNBkQaC93pIgLQZkAxwZCSclJxRJjQRSMSjQ1AZaPGYK7aIJyLe6BhJhwva8tJJ3
         2LdhEVWAssQnCidB7e1sXGIoRzneh0wdRnBLDN1Hsgf22AJErdXNRzQflEwQJsg0kSlF
         vu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007110; x=1703611910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNuSOIUI5x4sS7b6TcbJmnlVmXjTRkIFXpOBXzrlw3w=;
        b=EX50rhcycBIh9YmGhm+SQmZxwY7xdRzF7uZNGDX/j+dVZHLeSH4I9Oz9VcAwJL3v89
         hEaLFTT6RAsueuQhOzFKCJnWyp//vs0332IcBuRF16HVMiNRUFjyrUkxQ5NyNW4VbM7S
         w1l3d4GWhF+7z+SBlRP2/V9WaXnux0axNKsODXPjnJOK3JolwEyBEloZJZo1wjDtCaE1
         IinW3ewo9+1DvNgMPkfRtSqUy+dqu3283dW66kUytThRPHdw3A83+yAhIPJCVfLYlTKY
         83WxNfjSQ4SubhalMhN5uz5w8aMJZs8i9NSl6aR8SUmYTcpxmkikPPShWcLG7rp+sBlX
         Lt0Q==
X-Gm-Message-State: AOJu0YwMYZHYSvbhgfNuSWvAbB43e5C9ycRu2MrGWItwHn1ZiTVcKcWn
	+71zPyTMTCTIAFUzOMH9ZZ4nYzOwhqYPg0tm0nuz5w==
X-Google-Smtp-Source: AGHT+IF6toKI/birO7V7EAX+ee7fSWrikaqxnZJeZZ4HuIa56CWhnMOsykegcVbxI9Ouxzpo0asNalFIUiBgu+U81/g=
X-Received: by 2002:a17:90b:24b:b0:28b:8fb6:45d1 with SMTP id
 fz11-20020a17090b024b00b0028b8fb645d1mr1794300pjb.41.1703007110402; Tue, 19
 Dec 2023 09:31:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-8-tudor.ambarus@linaro.org> <CAPLW+4mNjCbJ+VbKR66DFSkiXHyxdjgvwjN7azxjJQ6UxQikEw@mail.gmail.com>
 <f3d61c49-1a46-476c-b7a5-6cc6a06a33ed@linaro.org> <CAPLW+4=tyr8Pcoe6Wm0Wtmkk4udDpuAiOKy7+C+Fwa6mvt3VoQ@mail.gmail.com>
 <5de5cddd-2bab-4408-b31f-f48bef98f14c@linaro.org> <CAPLW+4n-S2jaVPUwKTFC_iabnDd_qDV=ZubMqhz-X9XiZzzJow@mail.gmail.com>
 <4ba80e1e-8fec-4fd2-9140-6da006c9d5f5@linaro.org>
In-Reply-To: <4ba80e1e-8fec-4fd2-9140-6da006c9d5f5@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 19 Dec 2023 11:31:39 -0600
Message-ID: <CAPLW+4mm8LG=wtJHT5EYhGGiU72qVe70vJv6-JkEGepiXFjcvA@mail.gmail.com>
Subject: Re: [PATCH 07/13] clk: samsung: gs101: mark PERIC0 IP TOP gate clock
 as critical
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	conor+dt@kernel.org, andi.shyti@kernel.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, arnd@arndb.de, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 10:47=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linar=
o.org> wrote:
>
> Hi, Sam!
>
> On 12/14/23 16:43, Sam Protsenko wrote:
> > On Thu, Dec 14, 2023 at 10:15=E2=80=AFAM Tudor Ambarus <tudor.ambarus@l=
inaro.org> wrote:
> >>
> >>
> >>
> >> On 12/14/23 16:09, Sam Protsenko wrote:
> >>> On Thu, Dec 14, 2023 at 10:01=E2=80=AFAM Tudor Ambarus <tudor.ambarus=
@linaro.org> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 12/14/23 15:37, Sam Protsenko wrote:
> >>>>> On Thu, Dec 14, 2023 at 4:52=E2=80=AFAM Tudor Ambarus <tudor.ambaru=
s@linaro.org> wrote:
> >>>>>>
> >>>>>> Testing USI8 I2C with an eeprom revealed that when the USI8 leaf c=
lock
> >>>>>> is disabled it leads to the CMU_TOP PERIC0 IP gate clock disableme=
nt,
> >>>>>> which then makes the system hang. To prevent this, mark
> >>>>>> CLK_GOUT_CMU_PERIC0_IP as critical. Other clocks will be marked
> >>>>>> accordingly when tested.
> >>>>>>
> >>>>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> >>>>>> ---
> >>>>>>  drivers/clk/samsung/clk-gs101.c | 2 +-
> >>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung=
/clk-gs101.c
> >>>>>> index 3d194520b05e..08d80fca9cd6 100644
> >>>>>> --- a/drivers/clk/samsung/clk-gs101.c
> >>>>>> +++ b/drivers/clk/samsung/clk-gs101.c
> >>>>>> @@ -1402,7 +1402,7 @@ static const struct samsung_gate_clock cmu_t=
op_gate_clks[] __initconst =3D {
> >>>>>>              "mout_cmu_peric0_bus", CLK_CON_GAT_GATE_CLKCMU_PERIC0=
_BUS,
> >>>>>>              21, 0, 0),
> >>>>>>         GATE(CLK_GOUT_CMU_PERIC0_IP, "gout_cmu_peric0_ip", "mout_c=
mu_peric0_ip",
> >>>>>> -            CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP, 21, 0, 0),
> >>>>>> +            CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP, 21, CLK_IS_CRITICA=
L, 0),
> >>>>>
> >>>>> This clock doesn't seem like a leaf clock. It's also not a bus cloc=
k.
> >>>>> Leaving it always running makes the whole PERIC0 CMU clocked, which
> >>>>> usually should be avoided. Is it possible that the system freezes
> >>>>> because some other clock (which depends on peric0_ip) gets disabled=
 as
> >>>>> a consequence of disabling peric0_ip? Maybe it's some leaf clock wh=
ich
> >>>>> is not implemented yet in the clock driver? Just looks weird to me
> >>>>> that the system hangs because of CMU IP clock disablement. It's
> >>>>> usually something much more specific.
> >>>>
> >>>> The system hang happened when I tested USI8 in I2C configuration wit=
h an
> >>>> eeprom. After the eeprom is read the leaf gate clock that gets disab=
led
> >>>> is the one on PERIC0 (CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK). I as=
sume
> >>>> this leads to the CMU_TOP gate (CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP)
> >>>> disablement which makes the system hang. Either marking the CMU_TOP =
gate
> >>>> clock as critical (as I did in this patch) or marking the leaf PERIC=
0
> >>>> gate clock as critical, gets rid of the system hang. Did I choose wr=
ong?
> >>>>
> >>>
> >>> Did you already implement 100% of clocks in CMU_PERIC0? If no, there
> >>
> >> yes.
>
> I checked again all the clocks. I implemented all but one, the one
> defined by the CLK_CON_BUF_CLKBUF_PERIC0_IP register. Unfortunately I
> don't have any reference on how it should be defined so I won't touch it
> yet. But I have some good news too, see below.
>
> >
> > Ok. Are there any other CMUs (perhaps not implemented yet) which
> > consume clocks from CMU_PERIC0, specifically PERIC0_IP clock or some
> > clocks derived from it? If so, is there a chance some particular leaf
> > clock in those CMUs actually renders the system frozen when disabled
> > as a consequence of disabling PERIC0_IP, and would explain better why
> > the freeze happens?
> >
> > For now I think it's ok to have that CLK_IS_CRITICAL flag here,
> > because as you said you implemented all clocks in this CMU and neither
> > of those looks like a critical one. But I'd advice to add a TODO
> > comment saying it's probably a temporary solution before actual leaf
> > clock which leads to freeze is identified (which probably resides in
> > some other not implemented yet CMU).
> >
> >>
> >>> is a chance some other leaf clock (which is not implemented yet in
> >>> your driver) gets disabled as a result of PERIC0_IP disablement, whic=
h
> >>> might actually lead to that hang you observe. Usually it's some
> >>> meaningful leaf clock, e.g. GIC or interconnect clocks. Please check
> >>> clk-exynos850.c driver for CLK_IS_CRITICAL and CLK_IGNORE_UNUSED flag=
s
> >>> and the corresponding comments I left there, maybe it'll give you mor=
e
> >>> particular idea about what to look for. Yes, making the whole CMU
> >>> always running without understanding why (i.e. because of which
> >>> particular leaf clock) might not be the best way of handling this
> >>
> >> because of CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK
> >
> > That's not a root cause here. And I think PERIC0_IP is neither.
> >
>
> you were right!
> >>
> >>> issue. I might be mistaken, but at least please check if you
> >>> implemented all clocks for PERIC0 first and if making some meaningful
> >>> leaf clock critical makes more sense.
> >>>
>
> I determined which leaf clocks shall be marked as critical. I enabled
> the debugfs clock write access. Then I made sure that the parents of the
> PERIC0 CMU have at least one user so that they don't get disabled after
> an enable-disable sequence on a leaf clock. The I took all the PERIC0
> gate clocks and enabled and disabled them one by one. Whichever hang the
> system when the clock was disabled was marked as critical. The list of
> critical leaf clocks is as following:
>

Nice! I used somehow similar procedure for clk-exynos850, doing
basically the same thing, but in core clock driver code.

> "gout_peric0_peric0_cmu_peric0_pclk",
> "gout_peric0_lhm_axi_p_peric0_i_clk",
> "gout_peric0_peric0_top1_ipclk_0",
> "gout_peric0_peric0_top1_pclk_0".
>
> I'll update v2 with this instead. Thanks for the help, Sam!

Glad you weren't discouraged by my meticulousness :) In clk-exynos850
I usually used CLK_IGNORE_UNUSED for clocks like XXX_CMU_XXX (in your
case it's PERIC0_CMU_PERIC0), with a corresponding comment. Those
clocks usually can be used to disable the bus clock for corresponding
CMU IP-core (in your case CMU_PERIC0), which makes it impossible to
access the registers from that CMU block, as its register interface is
not clocked anymore. Guess I saw something similar in Exynos5433 or
Exynos7 clk drivers, or maybe Sylwester or Krzysztof told me to do so
-- don't really remember. For AXI clock it also seems logical to keep
it running (AXI bus might be used for GIC and memory). But again,
maybe CLK_IGNORE_UNUSED flag would be more appropriate that
CLK_IS_CRITICAL? For the last two clocks -- it's hard to tell what
exactly they do. Is TOP1 some other CMU or block name, and is there
any further users for those clocks?

Anyways, if you are working on v2, please consider doing next two
things while at it:

  1. For each critical clock: add corresponding comment explaining why
it's marked so
  2. Consider using CLK_IGNORE_UNUSED instead of CLK_IS_CRITICAL when
appropriate; both have their use in different cases

Btw, if you check other Exynos clk drivers, there is a lot of examples
for flags like those.

> Cheers,
> ta

