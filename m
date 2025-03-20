Return-Path: <linux-i2c+bounces-9963-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C145FA6B097
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 23:17:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1D68171467
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 22:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C824227EAF;
	Thu, 20 Mar 2025 22:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IUOSq3fe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9C6222596;
	Thu, 20 Mar 2025 22:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742508788; cv=none; b=SFaYjuSsndsisKzJlKHyzbtPRYfBcMWq5yNL4M6uM6nGU1hPpIehBag4pTT56vIn+47dbeJlqicrZiyw++0PsXpMVJQiX6j7G9Q7eiFsz5RsuFWQhjp1M0S8KaDrO0aJOi1YVzikjdfcwlzdMiEc6XPyJEw2CQH+p8/vJ8Hl4Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742508788; c=relaxed/simple;
	bh=M7qrseV6fB8Hed0ymLja/KLmZm6erUG8Gh3U6YrkLzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJdsfA2HoIderV0xKXNLlZHRDVg7v4cz7TST3qmpW7z/N42ftY96aZWAMeJ7wEb4LLKyAi3dpF+svrnPqBrsqDB3/sCxLtaY8Z2VEorrL8Pj+l8STDvlV8RS4mVX4YNCj5rd/pXjyU6BbgaEA0ujXrUKjfxZ31F3Fvu7cMoshNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IUOSq3fe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B68C4CEDD;
	Thu, 20 Mar 2025 22:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742508787;
	bh=M7qrseV6fB8Hed0ymLja/KLmZm6erUG8Gh3U6YrkLzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IUOSq3feRUEOLLgSW7vUdrZ3wJPw87ZS4Toe3mUkTuhPH5XGp5YVvt9gMvIKPX1kf
	 YB7nJQHtbQ5nu9G55CeNT0kxzrAPHXQc6s5EhvFJ1gz2Kkh1uUBY/OTAN2uMsOj8/D
	 idKvcye6uePTP1C5zBx7UOvTb7aTTKcUFX0H+2gb9MvfDN0ybup9S0jlbU1OwxxALL
	 QxHt8OlRrBIWUsskCpfVvS/58obwwGLzRf5ks1sVtktni2nzjB/oOZg0xuKogerK2w
	 bbBC6i+/gQDKT154qksc8V0s86kNMrgFIUxyzzt94+lXxqcL5qzaaya7EV/tYeUcQn
	 3ufYvYPor93WQ==
Date: Thu, 20 Mar 2025 23:13:03 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Brendan Higgins <brendanhiggins@google.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	Rob Herring <robh+dt@kernel.org>, Rayn Chen <rayn_chen@aspeedtech.com>, 
	Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai@quantatw.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] aspeed: i2c: add clock duty cycle property
Message-ID: <jcznjekoig6n5jtispbgxn6ingzteodwb5lib77evsvvufldoh@ia57mjlvie5k>
References: <20220610054722.32229-1-potin.lai.pt@gmail.com>
 <20220610054722.32229-2-potin.lai.pt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610054722.32229-2-potin.lai.pt@gmail.com>

Hi Potin,

On Fri, Jun 10, 2022 at 01:47:21PM +0800, Potin Lai wrote:
> Introduce i2c-clk-high-min-percent property for setting a minimum clock
> high percentage.
> 
> This driver calculate clk_high and clk_low with giving duty cycle. If it
> could not find a suit clk_high and clk_low, it apply default duty cycle
> 50%.
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

if you have still interest in getting this patch applied, may I
ask you to please resubmit it?

Thanks,
Andi

