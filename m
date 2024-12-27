Return-Path: <linux-i2c+bounces-8731-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5B89FCF36
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 01:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52A851883654
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 00:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C76184F;
	Fri, 27 Dec 2024 00:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Di0UU5Zt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57176191
	for <linux-i2c@vger.kernel.org>; Fri, 27 Dec 2024 00:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735258256; cv=none; b=soLp+60Qgc8xeJwVXB3TTZBVjTLe9kMqoWoDkzPYM3qcvdda579+wjzPBTd6dAsPGHaJ8VAwMHJf4POMftY9b7DmoE9Gjvx1yTo7OWjah9dEcGeLh1sBsyh7jEIVnTfs2+dlnM9HqVYTBTkiI6HKq+P1no7Kp1yJunVlOyCHDno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735258256; c=relaxed/simple;
	bh=MHuxFZfeVJx7tSXLi/a7PJecSL68r/wpYgkkClw1FWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5MfVKyHWQeHSHc+/uuFwmeZ0oUHOPsRhoUi/H5apv0vZEuWByd5O5VG1FYxDpJ/25hsHHjIAmdqxZ4c1bVc1N/v1VigbfUvTQVpuyhz+3d3016PjghF7XSra3ZrOiNn+XW9KLYMCd54wkSf2V0kYdpLaMk+zbwqHur2Dyrm8UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Di0UU5Zt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60315C4CED1;
	Fri, 27 Dec 2024 00:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735258255;
	bh=MHuxFZfeVJx7tSXLi/a7PJecSL68r/wpYgkkClw1FWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Di0UU5ZtdWMDxx6ptV+kRl0TglRGsZXJLMEsXjmOhzQNaUBGAo5vbHo1Q+PO06tJw
	 G2CKYn6QJg9tv9HeQ1q0yQfhMKAjW33IB1D/nXfe9FFfyLtzBG96bKvkWUqJyVWU9J
	 3wotuByG6UKhySHi4SY6+/7gmQiuPZHHKb+f6nj1hc+zn0YRDjh+AGneOl92Ga7xLp
	 ltlk/emg14jskwbIlXr0lIlsEilti8GRlXIQjbSxcOHZioZP4I5yeALukZxMvXznM8
	 74Z+gE2iPk+EACQ6SS2opDgtAvwvVocHjKD4AP7lOVRyTRt5m5INO+lnO+9Ym/PAJm
	 VjjdXD2o61GKQ==
Date: Fri, 27 Dec 2024 01:10:50 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Anand Gore <anand.gore@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, William Zhang <william.zhang@broadcom.com>, 
	linux-i2c@vger.kernel.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH] i2c: I2C_BRCMSTB should not default to y when
 compile-testing
Message-ID: <l4rffspzz7htfo2n5jpeayqo4m5v5bkswtgyxwpnbxetlmbjx2@mkbyggefdb5q>
References: <36b2923241f285595f43bb9565da352fd366c63e.1733242595.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36b2923241f285595f43bb9565da352fd366c63e.1733242595.git.geert+renesas@glider.be>

Hi Geert,

On Tue, Dec 03, 2024 at 05:19:50PM +0100, Geert Uytterhoeven wrote:
> Merely enabling compile-testing should not enable additional
> functionality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

merged to i2c/i2c-host.

Thanks,
Andi

