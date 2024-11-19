Return-Path: <linux-i2c+bounces-8063-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 821F89D3071
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 23:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 304861F21E01
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 22:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750E81C1F35;
	Tue, 19 Nov 2024 22:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ua+b4vnB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FF51C1741;
	Tue, 19 Nov 2024 22:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732055142; cv=none; b=FZ10TKJVa9NLVBdulsLP/4TpppTCLv7XCvjOAo8LFuWNZ1TZXVXqVXodlGseoIOxRyLkJzLguy3mDxAvr+BeBqQUDl5rMYc4bLfAsCrePh9MBD4WMwzaBhnioIpU00/xYpYpzf0X1M1YK+oMPr8lNgF1opmKv083r+CaUH/dIJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732055142; c=relaxed/simple;
	bh=GwmZWQf0EKA5yMqqR2Doj7yJmnSw6NoJj8hw2zIWZkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHb2NVUnqC2PFKlP3tMg/2oJV7yQEjT1GALhsG8EwWjoog+wYI00cwORirAXTO2Hww9HLb3bXKBp9IQWfd7+9ccaq4+sz32I3QXCTpCbgf+TfBp1YKiYmtMC8ElggJgPYHLr3WfD+jj3M2tLHrJWHobuUulX0hJW/5S1XBk+icY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ua+b4vnB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C3FC4CECF;
	Tue, 19 Nov 2024 22:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732055141;
	bh=GwmZWQf0EKA5yMqqR2Doj7yJmnSw6NoJj8hw2zIWZkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ua+b4vnBVOQ6rjIkKahdcOMBBQnrvNv44eh0rm8tQApLDs1AfRPfOz4jIjLA+0DjA
	 wa/COT5zm9CdTQK3lOYW2Ccpqn0ilofgU2qTRQhbwoPEQyxn0mp1CGhzbbECaxCW3+
	 ydE4+x/DScZ+uSSZqEM67+z1haNo/t9fD2s2mSILauQ4sf5maS7bYroiWCn+gSWMVk
	 Cvv5SMXE2BUYKJTOC67ruvKHUF8/5oMl0Nkr1Pj2mOTINMoAc1GJAlPTtiGpMu/fUt
	 ei4kl1ePs0OJxO9giKMf6ocPNk+/yx8pRBYj8ZHbnXbmesWofK9/HBkcte1ySji2iP
	 HoLhjddDE4N1g==
Date: Tue, 19 Nov 2024 23:25:38 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] i2c: npcm: use i2c frequency table
Message-ID: <bad4bd66cuiva4foudw4iv3aqr4475coo3fll357bh4k5xxqpv@n4iqvh5odsjc>
References: <20241021062732.5592-1-kfting@nuvoton.com>
 <20241021062732.5592-4-kfting@nuvoton.com>
 <fh43vyo4oviet35jmihew5yew5ez3nyaqgsyntqtd7x7s5mdrv@ezpal3a4banw>
 <CACD3sJbzgnq1bKJXS59TA8MJE3o0N_bz_a9PTJdy5C0FdD8wRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACD3sJbzgnq1bKJXS59TA8MJE3o0N_bz_a9PTJdy5C0FdD8wRw@mail.gmail.com>

Hi Tyrone,

...

> > > -     /* 100KHz and below: */
> > > -     if (bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
> > > -             sclfrq = src_clk_khz / (bus_freq_khz * 4);
> > > -
> > > -             if (sclfrq < SCLFRQ_MIN || sclfrq > SCLFRQ_MAX)
> > > -                     return -EDOM;
> > > -
> > > -             if (src_clk_khz >= 40000)
> > > -                     hldt = 17;
> > > -             else if (src_clk_khz >= 12500)
> > > -                     hldt = 15;
> > > -             else
> > > -                     hldt = 7;
> > > -     }
> > > -
> > > -     /* 400KHz: */
> > > -     else if (bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ) {
> > > -             sclfrq = 0;
> > > +     switch (bus_freq_hz) {
> > > +     case I2C_MAX_STANDARD_MODE_FREQ:
> > > +             smb_timing = smb_timing_100khz;
> > > +             table_size = ARRAY_SIZE(smb_timing_100khz);
> > > +             break;
> > > +     case I2C_MAX_FAST_MODE_FREQ:
> > > +             smb_timing = smb_timing_400khz;
> > > +             table_size = ARRAY_SIZE(smb_timing_400khz);
> > >               fast_mode = I2CCTL3_400K_MODE;
> > > -
> > > -             if (src_clk_khz < 7500)
> > > -                     /* 400KHZ cannot be supported for core clock < 7.5MHz */
> > > -                     return -EDOM;
> > > -
> > > -             else if (src_clk_khz >= 50000) {
> > > -                     k1 = 80;
> > > -                     k2 = 48;
> > > -                     hldt = 12;
> > > -                     dbnct = 7;
> > > -             }
> > > -
> > > -             /* Master or Slave with frequency > 25MHz */
> > > -             else if (src_clk_khz > 25000) {
> > > -                     hldt = clk_coef(src_clk_khz, 300) + 7;
> > > -                     k1 = clk_coef(src_clk_khz, 1600);
> > > -                     k2 = clk_coef(src_clk_khz, 900);
> > > -             }
> > > -     }
> > > -
> > > -     /* 1MHz: */
> > > -     else if (bus_freq_hz <= I2C_MAX_FAST_MODE_PLUS_FREQ) {
> > > -             sclfrq = 0;
> > > +             break;
> > > +     case I2C_MAX_FAST_MODE_PLUS_FREQ:
> > > +             smb_timing = smb_timing_1000khz;
> > > +             table_size = ARRAY_SIZE(smb_timing_1000khz);
> > >               fast_mode = I2CCTL3_400K_MODE;
> > > -
> > > -             /* 1MHZ cannot be supported for core clock < 24 MHz */
> > > -             if (src_clk_khz < 24000)
> > > -                     return -EDOM;
> > > -
> > > -             k1 = clk_coef(src_clk_khz, 620);
> > > -             k2 = clk_coef(src_clk_khz, 380);
> > > -
> > > -             /* Core clk > 40 MHz */
> > > -             if (src_clk_khz > 40000) {
> > > -                     /*
> > > -                      * Set HLDT:
> > > -                      * SDA hold time:  (HLDT-7) * T(CLK) >= 120
> > > -                      * HLDT = 120/T(CLK) + 7 = 120 * FREQ(CLK) + 7
> > > -                      */
> > > -                     hldt = clk_coef(src_clk_khz, 120) + 7;
> > > -             } else {
> > > -                     hldt = 7;
> > > -                     dbnct = 2;
> > > -             }
> > > +             break;
> > > +     default:
> > > +             return -EINVAL;
> >
> > There is here a slight change of behaiour which is not mentioned
> > in the commit log. Before the user could set a bus_freq_hz which
> > had to be <= I2C_MAX_..._MODE_FREQ, while now it has to be
> > precisely that.
> >
> > Do we want to check what the user has set in the DTS?
> 
> The driver checks the bus frequency the user sets in the DTS.

yes, but before it was checking the value within a range, while
now it's checking the exact value.

The difference is that now if you don't set the exact value you
get EINVAL, not before.

Andi

