Return-Path: <linux-i2c+bounces-14004-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCCBC3C418
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 17:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7E6994EA4BA
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 16:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D2F33C51A;
	Thu,  6 Nov 2025 16:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tl+UsoHL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5697919D07E;
	Thu,  6 Nov 2025 16:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762445064; cv=none; b=D4voCeN0JIrhg0Ho7/4KbmNsaiwj+GMf+/cBM5698zuTk67SMiGvMXl83HorID/s2wEPDO9uMkksoX4gE8cpy5UiuRMx76biAOgvXdCMNzEohWNvPtxyz/Quq/o6rnZhLrJSUM3yCRGDCK2tXjggemnBezfCzqjr5kVL3WI0r58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762445064; c=relaxed/simple;
	bh=tfoWKbGkWGrx1rWAMfcc3SKOmRrWzeEzHpAOZDpTe8I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UTGbHRZAHJgHgtBtXj8FnXdVpIAjfzADJH/CLsb8pqwXdqGluq4GXVt69hF8I2+eo/q9Mazfo/wCovZnyGLLapHaASKB1gV3jXKECBOZ3JmKHws24d4nF9oN4nVJTxoU/Cqxkx1E2PVOwPzQOYIh8eaJUhNMikVUUXUCzgAWdmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tl+UsoHL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538EAC4CEF7;
	Thu,  6 Nov 2025 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762445064;
	bh=tfoWKbGkWGrx1rWAMfcc3SKOmRrWzeEzHpAOZDpTe8I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tl+UsoHL0dLcdRgsZplwHi385klqaW7n7/yYYb6A9H2Muht1ffsVvCbaOgNXTMv0U
	 NOHczlLBQeYAqJS7/t70Hr0hX2LkKZEHRug9Ng+VVofpQP0WyQ+xYN3Jx72XQLAHa7
	 rKnhPl2XeQfpERi18b6pyW7bEUrPdGbW5fC7EH6DNQBfpfepusxggJ13D0ymPcsA0H
	 Y+7TYFfud3Hms/f5suhuzcfqLt0cfYRWddg7kYJo0MZbkyDicnBwnLHg+xcUOHvy5j
	 ZD28MupVCztYJbumhDx/PwfPWRqwH403N4sKrolxico9SCqw+Ms/WHSMC+8gYfSjqB
	 Bv3EmwPNa2ZSw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20251027-p1-kconfig-fix-v2-1-49688f30bae8@linux.spacemit.com>
References: <20251027-p1-kconfig-fix-v2-1-49688f30bae8@linux.spacemit.com>
Subject: Re: (subset) [PATCH v2 1/4] mfd: simple-mfd-i2c: remove select
 I2C_K1
Message-Id: <176244506110.1925720.10807118665958896958.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 16:04:21 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Mon, 27 Oct 2025 13:48:05 +0800, Troy Mitchell wrote:
> select will force a symbol to a specific value without considering
> its dependencies. As a result, the i2c-k1 driver will fail to build
> when OF or COMMON_CLK are disabled.
> 
> The reason for removing I2C_K1 instead of adding a depends on condition
> is to keep the possibility for other SoCs to use this PMIC.
> 
> [...]

Applied, thanks!

[1/4] mfd: simple-mfd-i2c: remove select I2C_K1
      commit: ecf6bc474ae97c404e2125b413eb0ef3627b03c5

--
Lee Jones [李琼斯]


