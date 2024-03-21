Return-Path: <linux-i2c+bounces-2463-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F26881B33
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 03:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B8441C20FEC
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 02:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0164C79;
	Thu, 21 Mar 2024 02:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wecdbyee"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7374A1D;
	Thu, 21 Mar 2024 02:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710988132; cv=none; b=ElCfvezctzSJjmLcg/SB0boEaMLx6eg5H1JV3/dTwk5CkC2+/TmOrENIqBD9QGFBcs5w26aldGvSx3h7QUrROnSLz46pXR8WQ1vQW7NVsPlyMfFCYDmKZ+AmXrtbCG2epm5aKire2qzlHdGb/Q+Is49LRhptSgrV5gRyAG+xQIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710988132; c=relaxed/simple;
	bh=bjoiSCjygIN8mLYzPS64PZE2ps4B86MLXXZolRjAJvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAurUe7CJgCemO3zwBOpVyQ5FGoLvtAk34HPCAIf7S4Tb3HJMoI6r8JwHh6aVKfBwQTIKEh4/yxf5h0h4oku0Ew0bd/CJp/sxKV/W6A1xo93gbP94vGTrpYWw43aWwrcMHmhjlyZrvVFk/I6VQVpmxjKQVvSZpDky3VB6NkAHuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wecdbyee; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F787C433F1;
	Thu, 21 Mar 2024 02:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710988131;
	bh=bjoiSCjygIN8mLYzPS64PZE2ps4B86MLXXZolRjAJvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WecdbyeetcF5mHOVaMQyHVGyQlFqWMURzs/pu2U6wreIwNw+vyR13EOwdu2oAPmia
	 eKFvpIbj3/N+LQepFwAt0cF51AeYyIfpbhk2heqDL3PTIyMfkbIz7iooed/9Ii4zOx
	 TNAv++2KAwhUrGj4vZlgfm8Y6N69DX10zRQkkbmy2f5jflva6YJlCOgvB8E3wnOaTu
	 vkW/0yreVkAuaRFozQz7nm3sD1UB8r8QYHS8ZAw1J5d/x7uT/ArB5DxmPyQ1cVzXfV
	 EVu2pEwicaemxZC0k73MZT1tG64rkuCDKJx3Tm5lulGgFK2TrHbCXxS+fItCMNSUHm
	 ooI2HINF0syjw==
Date: Thu, 21 Mar 2024 03:28:47 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Sam Edwards <sam@turingpi.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND RFC PATCH 0/5] Enhancements for mv64xxx I2C driver
Message-ID: <p37qqpplxgmfzlq6wz7fvmvnrsumy6ra5nivzi4hd2gbvlbezx@dlh6ygyjbk24>
References: <CAF8uH3tYaUwhkkeFuY+PdsnSPqeTtWtOsB_hy9oOjF=f-2Hdaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF8uH3tYaUwhkkeFuY+PdsnSPqeTtWtOsB_hy9oOjF=f-2Hdaw@mail.gmail.com>

Hi Sam,

Thanks for your patches.

> Sorry about the resend; it seems my mail client "helpfully" swallowed the
> newlines on any line consisting only of whitespace, garbling the patches.

I received three series from you:

 1. [RESEND v2 RFC 1/5] i2c: mv64xxx: Clear bus errors before transfer
 2. [RFC PATCH 0/5] Enhancements for mv64xxx I2C driver
 3. [RESEND RFC PATCH 0/5] Enhancements for mv64xxx I2C driver

By the versioning, 1. is good, the rest is not good. Standing to
the time sent and comments in patch '0', 3. is good, the rest
not.

Which one should be discarded? Can you please state it clearly?

Besides, youre mails are not threaded, They look like:

   Mar 19 Sam Edwards     (2.3K) [RESEND RFC PATCH 0/5] Enhancements for mv64xxx I2C driver
   Mar 19 Sam Edwards     (2.3K) [RESEND RFC PATCH 1/5] i2c: mv64xxx: Clear bus errors before transfer
   Mar 19 Sam Edwards     (2.3K) [RESEND RFC PATCH 2/5] i2c: mv64xxx: Clean up the private data struct
   Mar 19 Sam Edwards     ( 15K) [RESEND RFC PATCH 3/5] i2c: mv64xxx: Refactor FSM
   Mar 19 Sam Edwards     (5.2K) [RESEND RFC PATCH 4/5] i2c: mv64xxx: Allow continuing after read
   Mar 19 Sam Edwards     ( 11K) [RESEND RFC PATCH 5/5] i2c: mv64xxx: Implement I2C_FUNC_NOSTART

instead of

   Mar 19 Sam Edwards     (2.3K) [RESEND RFC PATCH 0/5] Enhancements for mv64xxx I2C driver
   Mar 19 Sam Edwards     (2.3K) ├─>[RESEND RFC PATCH 1/5] i2c: mv64xxx: Clear bus errors before transfer
   Mar 19 Sam Edwards     (2.3K) ├─>[RESEND RFC PATCH 2/5] i2c: mv64xxx: Clean up the private data struct
   Mar 19 Sam Edwards     ( 15K) ├─>[RESEND RFC PATCH 3/5] i2c: mv64xxx: Refactor FSM
   Mar 19 Sam Edwards     (5.2K) ├─>[RESEND RFC PATCH 4/5] i2c: mv64xxx: Allow continuing after read
   Mar 19 Sam Edwards     ( 11K) └─>[RESEND RFC PATCH 5/5] i2c: mv64xxx: Implement I2C_FUNC_NOSTART

Which is the default of "git format-patch".

Can you please make sure, next time (unless someone asks to
resend them again), that the patches are threaded? You can send
them to yourself first and see if they are really threaded.

If you are using some weird mail client, you can also check the
mail header, making sure that mails from 1 to 5 have the field:

   In-Reply-To: <Message-Id of patch 0>

Andi

