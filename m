Return-Path: <linux-i2c+bounces-3015-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACE88AA295
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 21:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C51AE1F221DD
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 19:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E044A1836CC;
	Thu, 18 Apr 2024 19:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aT4+SUVu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1A517AD95;
	Thu, 18 Apr 2024 19:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713467678; cv=none; b=NAvVorRI0tNT11tFJutM5LGYqgY8/0APLnCxda42J5ZxpAACIFGTLS3Urjc3GYWHnNnbAWI6jFSKno8qleznhtEyXfHkKIdl8rHzMs8TGhSNzZUB1TQgZRHoUVqoiLNr5BFsz4t/S07BtVplMb31ZIpaFaYW6sKnK2i7TlH2z24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713467678; c=relaxed/simple;
	bh=mhRK8WqHAmId8+57KRORlqSGMeDT3cBm+P8OnWokrqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjkSZK2GcvieDplc24DA0ooSmgrf58korpd5SiALt/siTKLctsts6fcJ8qnxbikYjo0nya67KC0IsGaFvEYGkeJbNcDrJb2ToE0p/zwuG3II4Xi+Xkp+fENHY9sZaa86rKkomJo1tK9LzdS33vYM/EmW2+sS43NIleFm2QL+mbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aT4+SUVu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F56C3277B;
	Thu, 18 Apr 2024 19:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713467678;
	bh=mhRK8WqHAmId8+57KRORlqSGMeDT3cBm+P8OnWokrqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aT4+SUVuFxMkxXfL2gcOl9s9iruhLdqKRdEE6xlp2UAScPb0NRS8mEnYjWcKzD2P2
	 h1qBScI/1rOFPdcjZtxikWsPvS9gWasR+ij5aCgH2nlq9vgK0gbOrSNQoMeS40NL9s
	 wJgc3WdAnlLG+Wd9IAEddj9XIXQ+TmkG0Jkbx22Dj5Ogm4iVN6AEyB52tB3ux3ZBFP
	 vj5X7xeZV+yAgkMe/DGw4xiK+T300QtzA7qlUpkxyLZ69ZkBW5LB4CYLuuggVEcZaL
	 NNM0saOA7f10D3bOHbhljsgll/WMgKBkxhpP9tXrj5hNzkDINdjMCz5GeOpZFp9+7J
	 yCzy1R2kI4s/A==
Date: Thu, 18 Apr 2024 21:14:34 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Piyush Malgujar <pmalgujar@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sgarapati@marvell.com, cchavva@marvell.com, jannadurai@marvell.com
Subject: Re: [PATCH v6 4/4] i2c: thunderx: Adding ioclk support
Message-ID: <3yapowxkxgsd2iq33trm7blpacmehmrbpk2jcffte7supz6ugd@lnsmw5wfj3nc>
References: <20240402134018.2686919-1-pmalgujar@marvell.com>
 <20240402134018.2686919-5-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402134018.2686919-5-pmalgujar@marvell.com>

Hi Piyush,

On Tue, Apr 02, 2024 at 06:40:14AM -0700, Piyush Malgujar wrote:
> Read the ioclk property as reference clock if sclk not present in acpi
> table to make it SOC agnostic.
> In case, it's not populated from dts/acpi table, use the default clock
> of 800 MHz which is optimal in either case of sclk/ioclk.
> 
> Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>

just acking as a reminder to myself:

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Everything looks good, if you manage to split patch 2 in two
different patches, then I think it's good to go.

Thanks,
Andi

