Return-Path: <linux-i2c+bounces-14681-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE44CCD62FD
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 14:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21F0030505A8
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 13:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA0531D72B;
	Mon, 22 Dec 2025 13:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="rHrHYFL5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3FA31A558;
	Mon, 22 Dec 2025 13:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766410730; cv=none; b=kwmzpFknSQ7/JdoGld55+qblya4lHfpj2iELh09AWl8AISNQwzFEVg7n9V9dbAi6geAlThVelOpddN5fwGTgF2rpMOjW4YZzD2djZhTY5imMEoS/W1pUW3JUrzs44pcWHU5E9IMUQQx/jdlRIhDJjAIc5V71mwoKrQDyZ3sfXTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766410730; c=relaxed/simple;
	bh=NPJThb2dDEfwsH8tKnfnK/e4aHjj1B1Rp863vlZvNLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o+Yw1FWDKr+5kYKLwQcMa4NMsY4TW4IbDBrDtpHd7iwWeXWmzNJOzwVOwvVzVw61zTkSjYArkcUY8h3zvA+oKQOogkxOvr56CHX4vauYthaPPU4Lm5a3PVL+/4Q3IT7ckwLnolTp7JDEfiWEV68l2Oao7D5JQSBIjzrtxuymZFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=rHrHYFL5; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=8WOqfT0iXUSzbNTa8nAUHhSbOAmz10UkS+7JzgNrtjw=; b=rHrHYFL5PwnRRsPxLr3aK+RpVO
	OIC38pXMVpGXnNN4zlPYcZSrZ1w+U6UiP15rrfENe1uCmslW0lIe1Vck5p158S7xmGTPbMfHKKyEC
	O2GZT5zU1IlLeI7UWFf8MyumU+kqRMQ3tlq/Y/Tk+f68TnZf+l2nJpRBGeY2O3anX1YkRNeiSLOEt
	ryqTHmtUWy8bKFvSONHmE41PEKOsrODBQ8d7oDE7M8CkjtDRcqkkdvdxS9513yyc4x0m9PTuqAB9H
	xFW/TZsMe46a6PA1fEQhtVufRuYjK6wl9eN/uuevhqzLvszMxWQ5k9sxQoqGzlqi/iK9bA1FFAxT6
	YKFZNy7Q==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vXg7L-0005s2-T1; Mon, 22 Dec 2025 14:38:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: FUKAUMI Naoki <naoki@radxa.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	brgl@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dsimic@manjaro.org,
	didi.debian@cknow.org,
	wens@kernel.org,
	nicolas.frattaroli@collabora.com,
	detlev.casanova@collabora.com,
	stephen@radxa.com,
	sebastian.reichel@collabora.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: (subset) [RESEND PATCH 0/3] Add Belling EEPROMs found in Radxa boards
Date: Mon, 22 Dec 2025 14:38:26 +0100
Message-ID: <176641067344.1648325.2735972831616663937.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251202084941.1785-1-naoki@radxa.com>
References: <20251202084941.1785-1-naoki@radxa.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 02 Dec 2025 08:49:38 +0000, FUKAUMI Naoki wrote:
> This patch series adds Belling BL24C04A, BL24C16A, and BL24C16F EEPROM
> found in Radxa boards.
> 
> FUKAUMI Naoki (3):
>   dt-bindings: eeprom: at24: Add compatible for Belling
>     BL24C04A/BL24C16F
>   arm64: dts: rockchip: Add EEPROMs for Radxa ROCK 4 boards
>   arm64: dts: rockchip: Add EEPROMs for Radxa boards
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: rockchip: Add EEPROMs for Radxa ROCK 4 boards
      commit: 1b2d6b75e2b3374157c9015435381b217a887145
[3/3] arm64: dts: rockchip: Add EEPROMs for Radxa boards
      commit: e3b12fc3336240e7dee4989b9e8634be3c959c94

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

