Return-Path: <linux-i2c+bounces-812-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D202081368E
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 17:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 566E11F21E9C
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 16:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FBBE60BA4;
	Thu, 14 Dec 2023 16:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yFuj6SdJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B594E12D
	for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 08:43:16 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-28b0cee2abaso609284a91.0
        for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 08:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702572196; x=1703176996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWHIEYa09hnCSRRLYxrxmRkCfuGY/Q51Trzc6SpnBLw=;
        b=yFuj6SdJhzHQiVDRC7YNgxaqoxUnrBjeV+16dPdpLgUtcLBdemEBdVnTDOPVAxnp0Y
         ALCJrqQ24A695tlJHWxa+HsguzzhxV0BXpi31XZ1E+FvQjIx1c8GRid1ypNgoPRn7HOo
         JcKMlt+q07qr96uHxdho/0jpc7fB4eXywI31cMgl8LRt9uFnJt8Xs0/3gWVCRfoIDgCH
         0Tht8BMAMNTXkO9/T1lGnSPd1t0R4U/G9kcE9nDof/lUU1HvKxUIYd2sr/YCfUypIuNf
         GStywy2QIlsFhGOdldRt/wc+NZZwMIJJXuGFLcEhWfmC5C7H7RmivXxlkNAx+NXpXPJb
         Qatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702572196; x=1703176996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWHIEYa09hnCSRRLYxrxmRkCfuGY/Q51Trzc6SpnBLw=;
        b=CB63jFpe7WoaC5cH8HQpUhjm1wFk/mblsMlhQC6SAGn+fmf/fGV/I+69PPkvp3Gx+l
         N57I1GyB3KlSG9ErSqWt7sqyJTzvRxKNqG0NL6C4mG5paEvqSLZ1kclJAq47ciVmuGMj
         1QqA4JuODRcSagz8JHiYojtybJci5huxRwdtx4fWeOMsxorytdGPSIiU0LtYtwRotqqE
         escrEQ2N9IkJongCXTwEMJxt9izCV83e9962XLX53cRe+A7UHjWjT296TliFtyeU+sfs
         jxCvn+g+gUU5u2itNZVbKW9h/tdxO0D6exMztjiDDrH2IVPEb+FpMNgcaH7LgX7Aa4bw
         RTYw==
X-Gm-Message-State: AOJu0Yz6MR6V0tHdBuM8ztJqwzR6I+zK2iGVHa5wSthzfkCLFsHUeV1J
	HcaEzPCOOXQ8Ah1ejehufVMGgjJ/wCMKFf+TBizudA==
X-Google-Smtp-Source: AGHT+IE3sHyxROiMhjfefDzAoNruqBYfiJM6J3A7LkcGt1ZODtMjrMmf12UjnIx2lJL2ANOUXdxmTmRkKyRZD80Ekzk=
X-Received: by 2002:a17:90b:3594:b0:28a:df4b:46cb with SMTP id
 mm20-20020a17090b359400b0028adf4b46cbmr2249609pjb.35.1702572196038; Thu, 14
 Dec 2023 08:43:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-8-tudor.ambarus@linaro.org> <CAPLW+4mNjCbJ+VbKR66DFSkiXHyxdjgvwjN7azxjJQ6UxQikEw@mail.gmail.com>
 <f3d61c49-1a46-476c-b7a5-6cc6a06a33ed@linaro.org> <CAPLW+4=tyr8Pcoe6Wm0Wtmkk4udDpuAiOKy7+C+Fwa6mvt3VoQ@mail.gmail.com>
 <5de5cddd-2bab-4408-b31f-f48bef98f14c@linaro.org>
In-Reply-To: <5de5cddd-2bab-4408-b31f-f48bef98f14c@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 14 Dec 2023 10:43:04 -0600
Message-ID: <CAPLW+4n-S2jaVPUwKTFC_iabnDd_qDV=ZubMqhz-X9XiZzzJow@mail.gmail.com>
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

On Thu, Dec 14, 2023 at 10:15=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linar=
o.org> wrote:
>
>
>
> On 12/14/23 16:09, Sam Protsenko wrote:
> > On Thu, Dec 14, 2023 at 10:01=E2=80=AFAM Tudor Ambarus <tudor.ambarus@l=
inaro.org> wrote:
> >>
> >>
> >>
> >> On 12/14/23 15:37, Sam Protsenko wrote:
> >>> On Thu, Dec 14, 2023 at 4:52=E2=80=AFAM Tudor Ambarus <tudor.ambarus@=
linaro.org> wrote:
> >>>>
> >>>> Testing USI8 I2C with an eeprom revealed that when the USI8 leaf clo=
ck
> >>>> is disabled it leads to the CMU_TOP PERIC0 IP gate clock disablement=
,
> >>>> which then makes the system hang. To prevent this, mark
> >>>> CLK_GOUT_CMU_PERIC0_IP as critical. Other clocks will be marked
> >>>> accordingly when tested.
> >>>>
> >>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> >>>> ---
> >>>>  drivers/clk/samsung/clk-gs101.c | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/c=
lk-gs101.c
> >>>> index 3d194520b05e..08d80fca9cd6 100644
> >>>> --- a/drivers/clk/samsung/clk-gs101.c
> >>>> +++ b/drivers/clk/samsung/clk-gs101.c
> >>>> @@ -1402,7 +1402,7 @@ static const struct samsung_gate_clock cmu_top=
_gate_clks[] __initconst =3D {
> >>>>              "mout_cmu_peric0_bus", CLK_CON_GAT_GATE_CLKCMU_PERIC0_B=
US,
> >>>>              21, 0, 0),
> >>>>         GATE(CLK_GOUT_CMU_PERIC0_IP, "gout_cmu_peric0_ip", "mout_cmu=
_peric0_ip",
> >>>> -            CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP, 21, 0, 0),
> >>>> +            CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP, 21, CLK_IS_CRITICAL,=
 0),
> >>>
> >>> This clock doesn't seem like a leaf clock. It's also not a bus clock.
> >>> Leaving it always running makes the whole PERIC0 CMU clocked, which
> >>> usually should be avoided. Is it possible that the system freezes
> >>> because some other clock (which depends on peric0_ip) gets disabled a=
s
> >>> a consequence of disabling peric0_ip? Maybe it's some leaf clock whic=
h
> >>> is not implemented yet in the clock driver? Just looks weird to me
> >>> that the system hangs because of CMU IP clock disablement. It's
> >>> usually something much more specific.
> >>
> >> The system hang happened when I tested USI8 in I2C configuration with =
an
> >> eeprom. After the eeprom is read the leaf gate clock that gets disable=
d
> >> is the one on PERIC0 (CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK). I assu=
me
> >> this leads to the CMU_TOP gate (CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP)
> >> disablement which makes the system hang. Either marking the CMU_TOP ga=
te
> >> clock as critical (as I did in this patch) or marking the leaf PERIC0
> >> gate clock as critical, gets rid of the system hang. Did I choose wron=
g?
> >>
> >
> > Did you already implement 100% of clocks in CMU_PERIC0? If no, there
>
> yes.

Ok. Are there any other CMUs (perhaps not implemented yet) which
consume clocks from CMU_PERIC0, specifically PERIC0_IP clock or some
clocks derived from it? If so, is there a chance some particular leaf
clock in those CMUs actually renders the system frozen when disabled
as a consequence of disabling PERIC0_IP, and would explain better why
the freeze happens?

For now I think it's ok to have that CLK_IS_CRITICAL flag here,
because as you said you implemented all clocks in this CMU and neither
of those looks like a critical one. But I'd advice to add a TODO
comment saying it's probably a temporary solution before actual leaf
clock which leads to freeze is identified (which probably resides in
some other not implemented yet CMU).

>
> > is a chance some other leaf clock (which is not implemented yet in
> > your driver) gets disabled as a result of PERIC0_IP disablement, which
> > might actually lead to that hang you observe. Usually it's some
> > meaningful leaf clock, e.g. GIC or interconnect clocks. Please check
> > clk-exynos850.c driver for CLK_IS_CRITICAL and CLK_IGNORE_UNUSED flags
> > and the corresponding comments I left there, maybe it'll give you more
> > particular idea about what to look for. Yes, making the whole CMU
> > always running without understanding why (i.e. because of which
> > particular leaf clock) might not be the best way of handling this
>
> because of CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK

That's not a root cause here. And I think PERIC0_IP is neither.

>
> > issue. I might be mistaken, but at least please check if you
> > implemented all clocks for PERIC0 first and if making some meaningful
> > leaf clock critical makes more sense.
> >
>
> Thanks,
> ta

