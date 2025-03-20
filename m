Return-Path: <linux-i2c+bounces-9938-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D092A6A20C
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 10:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87E888A1E33
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 09:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0632B220687;
	Thu, 20 Mar 2025 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOhGzdT2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B167121C189;
	Thu, 20 Mar 2025 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742461295; cv=none; b=AXy4wKc+/q3xICU4GrWXjxvvLY8D1WUL9QpXUejZDQ2cZeKmbaJTzcLV+Q/T53RW6n8yjNmeTjhy4PAgNPuzRYO2P7zZMFqOLZ7TzUj8/43O3lgRP+ofWtTtdyj13f1WqHdt4J7fX7TkxzvoX3wUYCa8FfxFTtDKTspyyQouQtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742461295; c=relaxed/simple;
	bh=DnHoJ3J5mtJVjiNcOfb2OS4bFv3Yt80zMPMatsJJ0Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/c3hGCSN9OCFP7lHBgTQMQJIGq8HDdrFzY3slBvh+R0vYsdfHMNtApO72B769m6x4YArqmpXIH2m1FkkdfgAqs2Y2jIVC+isC3urvGgSpgQp5Wce+E5oA0svGWB66geRbLlSmRQ+zQgJejFEYbEjXqGEETBCr0BF/I0cXRbsvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DOhGzdT2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E7BC4CEDD;
	Thu, 20 Mar 2025 09:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742461295;
	bh=DnHoJ3J5mtJVjiNcOfb2OS4bFv3Yt80zMPMatsJJ0Nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DOhGzdT2tWm1EOffIOqUAHkV3sRng5H4xWlDB8FxzOBQNpO4MWga28IT/0bRJgLca
	 aD5bJJka+bq2avZ9t2E9lAx3qRlN2+qkIrov2gBP68v6mMrsoJSOFyqAgP9jlwdsgY
	 VPvIbhhVaoes7mkoVtw02esK//+5swzVJF9ojMW26Wbf4vtyYP1OTag+QHMc2OlHTR
	 o6wz3z5MAEqwnGGXB/dCiTgPJ5vcOchFBYj5YI8V2bqOFcoSSIHUuHuzMFe2hHXNAt
	 6Uf5cSmYPnM+jxUgSXQuXSSuFbvxHG20QYdkFbQH0hh8z+DgwEXj/TSDI3WV7fDyB7
	 UEIRQQRr8+eqQ==
Date: Thu, 20 Mar 2025 10:01:30 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, 
	"Markus.Elfring@web.de" <Markus.Elfring@web.de>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rric@kernel.org" <rric@kernel.org>
Subject: Re: [PATCH v13 3/3] i2c: octeon: add block-mode i2c operations
Message-ID: <2enq7ixb5m6nn2hlufsgeh6cqt24l5rmbtceflbtwaep64osxy@ej63czorl2tn>
References: <20250318021632.2710792-1-aryan.srivastava@alliedtelesis.co.nz>
 <20250318021632.2710792-4-aryan.srivastava@alliedtelesis.co.nz>
 <thazi6n7jwqp6xoz4p6ce7ohxts7ubhgs5h6chqsnnexbkiy3j@q6xzdrze6a6f>
 <d542d00d25e37a922c0fe9d25bba7bbc7220f580.camel@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d542d00d25e37a922c0fe9d25bba7bbc7220f580.camel@alliedtelesis.co.nz>

Hi Aryan,

On Thu, Mar 20, 2025 at 01:36:12AM +0000, Aryan Srivastava wrote:
> On Wed, 2025-03-19 at 23:19 +0100, Andi Shyti wrote:
> > > +static int octeon_i2c_hlc_block_comp_read(struct octeon_i2c *i2c,
> > > struct i2c_msg *msgs)
> > > +{
> > > +       int ret;
> > > +       u16 len;
> > > +       u64 cmd;
> > > +
> > > +       octeon_i2c_hlc_enable(i2c);
> > > +       octeon_i2c_block_enable(i2c);
> > > +
> > > +       /* Write (size - 1) into block control register */
> > > +       len = msgs[1].len - 1;
> > > +       octeon_i2c_writeq_flush((u64)len, i2c->twsi_base +
> > > OCTEON_REG_BLOCK_CTL(i2c));
> > > +
> > > +       /* Prepare core command */
> > > +       cmd = SW_TWSI_V | SW_TWSI_R | SW_TWSI_SOVR |
> > > SW_TWSI_OP_7_IA;
> > > +       cmd |= (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
> > > +
> > > +       /* Send core command */
> > > +       ret = octeon_i2c_hlc_read_cmd(i2c, msgs[0], cmd);
> > > +       if (ret)
> > > +               return ret;
> > 
> > Do we need to disable the block mode?
> > 
> Do you mean, do we need to disable the block mode at all? i.e. have it
> on all the time? Otherwise, it gets disabled at the bottom of this
> func.

yes, but you return earlier, right?

Thanks,
Andi

...

> > > +       octeon_i2c_block_disable(i2c);
> > > +       return ret;
> > > +}

...

