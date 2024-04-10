Return-Path: <linux-i2c+bounces-2875-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D37A89FB5E
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 17:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 741B11F21AB4
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 15:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D8816DEBF;
	Wed, 10 Apr 2024 15:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9xZCBfw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5172515D5C0;
	Wed, 10 Apr 2024 15:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712762404; cv=none; b=Kp5oxvQx622PQhsEebg8GmM1geoxYSdYn/uJl2/1ovFN9F1vkXyWWjHl1bTcJGVhNBUwK/nIzVVymiNWX94d5RP0TRQNvYVumiPM4+UKGFMii46yN9fZkLb6RY0rE2gsiWyGzg5kzT9LxxAP9renaF2jPqkeHYILdOjhc56PkME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712762404; c=relaxed/simple;
	bh=OO6f27gPXNypfXcujjMPiFbC5qIqJDnwlIs8sqIWfSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LW6D8L2J+5rggfK4ab9LcdLUc4mwVr69szHK8d2Jo4nSruiTLy7rcWW6ABi997hMH/Uuh/sbFSEf8iNcsFUADk/7h8Ie9TJbx3DwLCyoTwaAU2cX07LNKI0axbiW+6inbOfJtg+DSCWzXGStpL0ykiJEh2kx4F2XIBq7qPxNCbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9xZCBfw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E04DC433C7;
	Wed, 10 Apr 2024 15:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712762403;
	bh=OO6f27gPXNypfXcujjMPiFbC5qIqJDnwlIs8sqIWfSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9xZCBfwDpDzP/XkUcpleXlcS8EJMlDsh/ZuRGaTg0CoBGj5G2ywfD3rdPpP4QwHt
	 o3wBP5liQVhCc8QHd6reIJu3kjL9B+Vkb+Mg9bRNK7Wex81E35/AnWxFt774Xz7TtX
	 61JvlbJt8jaXwlBLnSmml8JLMi41hX9rWtAmRPc/NWfhExLJEall5qcwnSoOj3SyOt
	 njSJq6CgeYEOsXiqds52HbfBqWd041OBE/p0ubrTuoP1ejp/Z4b264sBxRUjJ5arc5
	 07NDpe4MFMtIZIhayUd2JyPcydYpzkCsIrnTDp8UUMdtNPRykr2/AevA4gxOPyZKPK
	 UkOXEPFCtgB1A==
Date: Wed, 10 Apr 2024 17:19:59 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: Re: [PATCH 22/64] i2c: highlander: reword according to newest
 specification
Message-ID: <45c4rorg4lgntiunjecqxwlr5hz4e7qrxr2q3xzzh5kv7ebpwx@6hn6p2ttfes7>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-23-wsa+renesas@sang-engineering.com>
 <u4dtq2ii3kjvwj5hhxogcqje27adpoxxlr7y6bkqo2suqcumxb@p5vsjp3m2rop>
 <w5jl3r2ta5qebzt76jkkszqkxlycp4d4sriyz7kxyotpza7q45@sq4kkk723uzz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w5jl3r2ta5qebzt76jkkszqkxlycp4d4sriyz7kxyotpza7q45@sq4kkk723uzz>

Hi Wolfram,

On Mon, Apr 08, 2024 at 11:07:20AM +0200, Wolfram Sang wrote:
> > I'm just noticing... what do you mean with client/target? Can you
> > please be a bit more specific?
> 
> I described it somewhere (and Easwar mentioned it in another thread by
> now), but, yes, it needs to be better described. This will be also in my
> updates to the I2C docs.

yes, I understood the difference between "client" and "target".
The problem I see here is that this is not described in the
specification (except for some pictures in the i3c, iirc).

So that the change slave/client looks a bit arbitrary and I hear
some people don't like it.

That's why I need to know a bit more about the choice :-)

Thanks,
Andi

