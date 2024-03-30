Return-Path: <linux-i2c+bounces-2679-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEBF892805
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Mar 2024 01:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32945B22C7E
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Mar 2024 00:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA6C197;
	Sat, 30 Mar 2024 00:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDd2+XOR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA66181;
	Sat, 30 Mar 2024 00:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711757211; cv=none; b=nT8eA5XDNYI58S0bbEzd607Dv+n1CmKsfFfXiBMg1GKbRGjQ2zm0Vtf8dNcyYRJdjtLs3iTPLJTpEHv9yRrDZeKriG4uTJjK7Xl9GF849nRLvj/qhPPslIMQGGLb4OnK5M80ZeV9iYCttXZpk08g7WZH04mse/Ahb1GWRBLqMy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711757211; c=relaxed/simple;
	bh=Dug95a3//U9qvbqxl/X9PoBqPVwfGrkngumQrm74jmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0UILCqeD3HVrej5pnfL2LCOo78uCN+SnG5PJ0G3pEO2SdYwPtwo7uxnYhQMwDOU7Srt+gOGzA9pPX5/pQyM7QIq8O3kxp8h0k3Bg6ykwkyvLXWitnFJuH7n6I3GKc6KDkIRJtbe7vzeCrt0zwO7iDZH/1qi17hFRTDKkeTTyZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDd2+XOR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3396CC433F1;
	Sat, 30 Mar 2024 00:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711757210;
	bh=Dug95a3//U9qvbqxl/X9PoBqPVwfGrkngumQrm74jmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TDd2+XORHjntuhRljTd5w/GlOEh30nG+mepB73m/LxAfov/9xFA42ZgwiAzf2X6GH
	 VgNeMDzYsQ5G1BDOR4GON3cdCTfl6i68V90Tn8zl7oRpjBbnrEXBNgNlQifQlP+TRc
	 1vqNRqNEb2x+yDgNdlloM18w81C50YPctxyu1G+l9BXx1jyTNCFsdrWsdKKLCEFOUM
	 47B5rXT7OEJufzFGSkOhu/0tfz09lcn3+dmUTH8WTNtj3Uwp6P9OICfdOwXsnx70mM
	 aFQhiDrjo0S2Nb88ZKWmDFqHvKeik5L/L2VQzkdODFqgKnoS0wyDmYStdUKbpwxyiV
	 CrPolxl01vpUA==
Date: Sat, 30 Mar 2024 01:06:46 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND v2 RFC 0/5] Enhancements for mv64xxx I2C driver
Message-ID: <gj3bu52qixnf7agreb7olfwmsllr3k6mcybmyhiw76esxoevk7@nmfshpqp55l4>
References: <65fa7599.5d0a0220.fe5f7.1f9f@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65fa7599.5d0a0220.fe5f7.1f9f@mx.google.com>

Hi Gregory,

On Tue, Mar 19, 2024 at 06:44:56PM -0600, Sam Edwards wrote:
> Salutations, Linux I2C team!

...

> In anticipation of that, I am preparing this series comprising five patches to
> improve the functionality and reliability of the I2C adapter enough to support
> this kind of device. I have heavily tested these changes on the Allwinner-style
> mv64xxx core, but not the Marvell-style, and have not been able to test 10-bit
> addressing. I would greatly appreciate if anyone here could test this series,
> especially on non-Allwinner boards and/or boards with 10-bit devices.
> 
> I'm a bit skeptical of using I2C_M_NOSTART for this purpose. The driver does
> not (and cannot) support "just any" use of I2C_M_NOSTART, so it may be
> inappropriate to claim the I2C_FUNC_NOSTART capability. On the other hand, I
> searched high and low and couldn't find any use of I2C_M_NOSTART that
> *wouldn't* be supported by this change, so this could very well be exactly what
> clients understand I2C_FUNC_NOSTART to mean. Given that the alternative would
> be inventing a new flag ("I2C_M_READEXTRA"?) and figuring out how to supply
> input bytes and output bytes in the same i2c_msg, I opted for the NOSTART
> route instead.

any thought on this series? I believe here we might need a bit
more testing on other platforms.

Andi

> 
> I look forward to any feedback, bug reports, test results, questions, concerns,
> commentary, or discussion that you can offer!
> 
> Best regards,
> Sam
> 
> Sam Edwards (5):
>   i2c: mv64xxx: Clear bus errors before transfer
>   i2c: mv64xxx: Clean up the private data struct
>   i2c: mv64xxx: Refactor FSM
>   i2c: mv64xxx: Allow continuing after read
>   i2c: mv64xxx: Implement I2C_FUNC_NOSTART

