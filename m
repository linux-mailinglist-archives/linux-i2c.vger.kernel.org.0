Return-Path: <linux-i2c+bounces-6722-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E926978336
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 17:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD551B21C14
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 15:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0402EB02;
	Fri, 13 Sep 2024 15:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="sxv+nCCE";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="WJFebE8q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE4829CF0;
	Fri, 13 Sep 2024 15:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726239734; cv=pass; b=efRJ+5m03JJ39BIrcq1Im4HYqjcS5ZPwCZlCqrg6QlwJkN4+1JW+WOaTuy80t8TZOUysqFR1IUo/5lhFSvFPI3fix3asq9lKZsnEodyVpR4DJfLc/sqeRYlMveKtN+dJiqs4r/Lq70OHyS5WaASIKtW9xRcUGJ4fAYU96YMATv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726239734; c=relaxed/simple;
	bh=e57zcWQSVSgo6cEBNGs+KUbvp+KYXNF6edtF2NSWF7I=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=YQyZTx9xAr6CdOZBLCKSunosAMwUzFYDWTnoXCxEfLtuOnyOGBJnAwfZ+NyJfXklzeYL+wa4RXW3tWbsj6OIn13t5vP/uYHYYGb15GCEPYPknAzglsoj31Jfv1Q8qR+jkjyoXI6pnzTWSpeGAGX6nlIbTc4OLATl8B0jyorIuJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=sxv+nCCE; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=WJFebE8q; arc=pass smtp.client-ip=85.215.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1726239714; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OF27jDUSeIFFiPY477XiPvqb58kj8KGspHFAy8Khlq+H0+VMR+4zM60zfvZkyM7zAK
    zKSb7HuppM6sMek2V/Ft33d0A5M/ljOz3gYavFULS2+CG7H6G6C+34Bt42pceuW5SEgh
    6Fsj+t3muWG42XqMf5BXN/TAVmUlQMrblSAj/Dvc+b0isZsmjWOzoRo9Y/h3yC3F1s3W
    N4yBopMujLW1/Td5WBcdBMcO+BkQ2WQrn0xX2OLE3XtvAmzkYvfsuXZbsRUM1u6/gmir
    6KEMwJ54X7YCy0kXjTDEiTFwDzzHTG7ptaxFTrhNzp8rN0PC7UMRHZc4yTp/ZtZbEhvn
    /u1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1726239714;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=pWUZCvtRrFmZUWsXHM9GvLPUeTaoAVROQZxyilr4N7o=;
    b=ROiWCEGWGC7IUHTf8AUTquF5wxUZn3DcMWoqSMzz5rx9nle6U5sJpUxTahStB1z42V
    odXj2v0wOrL8fCmlwFxU0tcnHa/xCBqonOhrZ8Jzx0lzkCdGtG2K1TYKRxBUHtc20FeH
    NhAU4yVwttF6VKCXLeb2JPwhkah6SwZfLx0rb/BxgHw5aOb/kzSfWwGxbcxib90JYI/V
    Y0KEn5+EoXTGPC3nJs5kuCW8uIwbrTBP//j4Hm5qzpCxqih3Bil/kyTQcmTVFdTGhaV7
    8FSn14OoKmXlL0wbKacxTa343mgedUMOaw8r5xQJ7PZfA+NNXA09Kae/2nYHzBTjHwa4
    x75Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1726239714;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=pWUZCvtRrFmZUWsXHM9GvLPUeTaoAVROQZxyilr4N7o=;
    b=sxv+nCCE9wVoztWLZqNVrZp+cvm0lB04OykWNaUQTUXVlZjxoXtRgboMIAiWbDBzva
    KiCW+LC1RTZTvNuHF3AvqyXkfUd4ln1CnZ7nMNeoeEDnR7lF510gLXJGEyrJVSAH8aLx
    We5cyzYKsfHNveL9IR6SdmQx/d62ynGZaZgkfAuVsXO7AEN8UKIGhJ8NburfFoOerQVo
    gBYk183jVNfpLzgJY6AG1cv3ZgDoDiV3Q3SIMgWHsew1y+1pj23B4W0yPONu0SP+mv7w
    0/594crKg0cjWvAScVASUwNUopqTkz2smiwgjuxD3dfMamQWHB79lpA96mHfB1AZ5xzp
    xGLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1726239714;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=pWUZCvtRrFmZUWsXHM9GvLPUeTaoAVROQZxyilr4N7o=;
    b=WJFebE8qQPzuvsAnpczhTrm2zT2XFBBkAlFBgUkullST85l8IO0jb7pV1zVE+sg28Y
    NAmMlJk69BttJZygj9BQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfjAZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.3 DYNA|AUTH)
    with ESMTPSA id Q984c208DF1rA1B
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 13 Sep 2024 17:01:53 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH v2] i2c: omap: Fix standard mode false ACK readings
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20240913153251.48ffafbd@akair>
Date: Fri, 13 Sep 2024 17:01:42 +0200
Cc: Reid Tonking <reidt@ti.com>,
 Tony Lindgren <tony@atomide.com>,
 "Raghavendra, Vignesh" <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-i2c@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <68865E6A-FBA3-4947-9761-9FD3DC957D0E@goldelico.com>
References: <20230426194956.689756-1-reidt@ti.com>
 <445b3cbf-ffbc-6f77-47db-c30fc599e88f@ti.com>
 <20230428074330.GJ14287@atomide.com>
 <20230428183037.wbhds54dz5l4v5xa@reidt-t5600.dhcp.ti.com>
 <664241E0-8D6B-4783-997B-2D8510ADAEA3@goldelico.com>
 <20240913140934.29bb542b@akair>
 <0903DB3E-1A44-44BB-87DC-01C65B97AE4E@goldelico.com>
 <20240913153251.48ffafbd@akair>
To: Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3776.700.51)

Hi Andreas,

> Am 13.09.2024 um 15:32 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
>>> I had a patch to disable 1Ghz on that
>>> device in my tree. Do you have anything strange in your
>>> tree? =20
>>=20
>> No, and the omap3 is running with 800 MHz only.
>>=20
> So you have a patch disabling 1Ghz OPP in there?

I think the speed is binned to be 800 MHz only. So the OPP is ignored.

> The error messages
> look like things I got when 1Ghz was enabled, so better double check.

Well, it turns out to be difficult to check since with 6.11-rc7
cpufreq-info seems to be broken... I have not yet installed the fixed =
4.19.283 again.

But indeed I have found a potential issue. We have a patch [1] for the =
gta04a5 (only) that adds

&cpu0_opp_table {
	/* is unreliable on gta04a5 - enable by echo 1 =
>/sys/devices/system/cpu/cpufreq/boost */
	opp1g-1000000000 {
		turbo-mode;
	};
};

so that 1 GHz must be explicitly enabled by user-space.

But some time ago the 1GHz node was apparently renamed to opp-1000000000 =
(5821d766932cc8)
and this patch was not adjusted.

After fixing it I can ask again for cpufreq-info and the 1GHz OPP is not =
activated:

root@letux:~# cpufreq-info=20
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: cpufreq-dt
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 300 us.
  hardware limits: 300 MHz - 800 MHz
  available frequency steps: 300 MHz, 600 MHz, 800 MHz
  available cpufreq governors: conservative, ondemand, userspace, =
powersave, performance
  current policy: frequency should be within 300 MHz and 800 MHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz (asserted by call to hardware).
  cpufreq stats: 300 MHz:37.38%, 600 MHz:10.11%, 800 MHz:52.51%, 1000 =
MHz:0.00%  (1740)
root@letux:~#=20

Anyways, this bug was introduced some months after this i2c patch we
are discussing here. So i2c broke first before the 800MHz limitation was =
accidentially
removed. Therefore I am quite sure that the failing 4.19.283 did run at =
800 MHz.

And in the v4.19.282 and v4.19.283 based kernels we have simply =
commented out the 1GHz
option (since 2018) or there is no 1GHz OPP at all.

Thanks for the hint to take a second and closer look at it, but it =
doesn't seem to
be a factor here.

> if it is letux, then there is e.g. the interrupt reversal in there.
> Maybe it unveils some problem which should be fixed, maybe it is
> harmful, it was never well reviewed...

I know what you refer to but I could not find it any more. But I may not =
have
searched correctly.

>=20
>> I haven't tested on another board but the bug is very reproducible
>> and I was able to bisect it to this patch, which makes the =
difference.
>>=20
> the error messages, esp. regarding rcu do not look so related to this.
> Maybe having this patch or not triggers some other bug. Maybe we =
trigger
> some race conditions. Or i2c error checking regarding OPP setting...

That is what I suspect as well. I2C is used to switch the twl4030 for =
different OPPs...

>=20
>> So there may be boards which happily run with the patch and some
>> don't. Maybe a race condition with hardware.
>>=20
> I am not ruling out that this patch has nasty side effects but I think
> there is more in the game.

Yes, that is why I think just reverting this patch may only hide a
symptom and does not solve it.

But it may as well have introduced a bug as Tony apparently was thinking
of when asking.

BR and thanks,
Nikolaus

[1]: =
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dcommit;h=3De824f0c9513=
cf1d57eba0c9a2ce5fe264fafc8d5=

