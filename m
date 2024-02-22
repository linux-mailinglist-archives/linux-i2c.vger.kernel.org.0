Return-Path: <linux-i2c+bounces-1919-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC9085F853
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 13:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEDD91C24447
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 12:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C0512D779;
	Thu, 22 Feb 2024 12:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9wf1Fn2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F3B46435;
	Thu, 22 Feb 2024 12:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708605467; cv=none; b=Q201q4vMkg23TjTdxuHd3ueKEQCSigQUmWFBJT09dm0v3fmbtmJJNue+hIJL9K+4AKS4Vh0xdlXmTAo2WFY5XHXIL5AtfU4rIW8ac1rRbxm6gPb56yX3/YvgDhj3/hIW96sJUlwB6O8eKNiSrGKWggDiMgmNAieelHCVE8XQXQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708605467; c=relaxed/simple;
	bh=2HMdWI3nhegIrX7DvPTDdGRwgUpA87f+mQI3vADvmUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cR6gViZPawJA5PJP9YxW3BxPtoYUTGlK/Yx4LrccO0CMD0/YF79xZYT311puhjgu4I4qy3zSW8Xp6yDGdGhPXogluH9HcmdzSSXT6lWNj/fknbyUTWIzJGsyVgPSmvQFCatSDESbgys4TyJNwHGNYf7dDPpl7m69m6dtBoL8d48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9wf1Fn2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB4FC43390;
	Thu, 22 Feb 2024 12:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708605467;
	bh=2HMdWI3nhegIrX7DvPTDdGRwgUpA87f+mQI3vADvmUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J9wf1Fn2s7yjjNGeZc8qDUMdCkIg2+Me9u8s9bytnRxVyAkHnthnj68f32ZQbhcC6
	 YEUjaPFPz7STnM7iBgkaFShuowyCnzdA3hpiu+6d1kREQh9s4eXdrXrXkq/3uJa0tZ
	 MbX/13MhN0iwUKHrddXclf991rxeutVpLTapP0Cqcp7PF6QspVbBqmRHBWPBTJRPDm
	 cnQidamdyDirsa2YnK5C1BEd4Q0d37lUtQnbBGJadr0XE1z2bSFbEyWSua3iM9AC2I
	 0YZfu23qQmOWf7xG9V2GCmt7U2IYiQdytFn46fVxV0i+P8zNHFrzl/56XwIYSDgYCV
	 fBcv98/lTF8Xw==
Date: Thu, 22 Feb 2024 07:37:46 -0500
From: Sasha Levin <sashal@kernel.org>
To: Tim Lunn <tim@feathertop.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.1 27/27] i2c: rk3x: Adjust mask/value offset
 for i2c2 on rv1126
Message-ID: <ZddAGs9pKyLV37zP@sashalap>
References: <20240128161424.203600-1-sashal@kernel.org>
 <20240128161424.203600-27-sashal@kernel.org>
 <030766c0-a6b9-401d-9e9a-fe5d11c5d381@feathertop.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <030766c0-a6b9-401d-9e9a-fe5d11c5d381@feathertop.org>

On Mon, Jan 29, 2024 at 10:19:35AM +1100, Tim Lunn wrote:
>Hi Sasha,
>
>  Support for the rv1126 SoC was only added around linux 6.2 and 6.3, 
>thus doesnt make sense to pick this patch up in 6.1

I'll drop it from 6.1 (and older), thanks!

-- 
Thanks,
Sasha

