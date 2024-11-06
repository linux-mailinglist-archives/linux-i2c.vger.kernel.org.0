Return-Path: <linux-i2c+bounces-7838-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB779BE4ED
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 11:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 914E9285E05
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 10:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD2D1DE3D8;
	Wed,  6 Nov 2024 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uRFzni32"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A371DA622;
	Wed,  6 Nov 2024 10:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730890548; cv=none; b=sM38JXe90cDwMrkiuVQ37G2uBAIx6Ub+tqEu6rzYoUIDmSXXlr1qXkbKveI4vioeYcjz+vgi1ORRA7trvt480TS8FdYsFTA3jQwKcXPoD302lhRwK0Ni5z8R+d86N/XixeDJubTDqIPoZ1nweDf5lhbttyt4D4S6mpN51ZqkTCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730890548; c=relaxed/simple;
	bh=3QNhdLfaFoqKHebi4TF2CAzndgVvZujHDKpOb5+/9Ws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uHRPwSuYq6nmP7/fFI9x+sT5ftIJMxIBkyu0JRJ+b/Vgw5twywG1UiCYphRUSa4p2DluYwa4VuLepqlhbp++YTYKgkRBbTbWkw42JiX+3dNGvR+25c6UDdc+l4AoQplm4HaO5GbpJCq072UAOXWpM8368Ht6slRudvu6Hz+qexM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uRFzni32; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3C5C4CECD;
	Wed,  6 Nov 2024 10:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730890547;
	bh=3QNhdLfaFoqKHebi4TF2CAzndgVvZujHDKpOb5+/9Ws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uRFzni32xjLNM+M0TZe2xWbHmRUxAdYUw+ibMTkRpgX8EZljDuAghAlconbqitZsF
	 oXFv/4X66CDoGXnx49ZzqNlpckHchuJ0F+xLDHoX4w2QKBmhw3dleTqixTHMn8AhNE
	 ayjr1CSltQPO0EZBTBpiEUt8s1oioBo9RlfuLKCnLpF5kXTv2+/IrBLQbtH2rk+vgz
	 lDTpppvGcahpRIBC/ujmoozezpQS8VYAYR6aNUDcc2LwNBELG7A/nbpiPnKMV+U1Tb
	 PCg3eCRRje0WL1xBKmdRUxA6OVygJkaxnTRyIN4gC4N2d1PHmqGF31545q4rBlD57k
	 iUJIg88rbLB7w==
From: Lee Jones <lee@kernel.org>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, lee@kernel.org, sre@kernel.org, 
 tsbogend@alpha.franken.de, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-mips@vger.kernel.org
In-Reply-To: <20241031200350.274945-5-chris.packham@alliedtelesis.co.nz>
References: <20241031200350.274945-1-chris.packham@alliedtelesis.co.nz>
 <20241031200350.274945-5-chris.packham@alliedtelesis.co.nz>
Subject: Re: (subset) [PATCH v8 4/7] dt-bindings: mfd: Add Realtek RTL9300
 switch peripherals
Message-Id: <173089054492.3329096.14087747490130064328.b4-ty@kernel.org>
Date: Wed, 06 Nov 2024 10:55:44 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 01 Nov 2024 09:03:47 +1300, Chris Packham wrote:
> Add device tree schema for the Realtek RTL9300 switches. The RTL9300
> family is made up of the RTL9301, RTL9302B, RTL9302C and RTL9303. These
> have the same SoC differ in the Ethernet switch/SERDES arrangement.
> 
> Currently the only supported features are the syscon-reboot and i2c
> controllers. The syscon-reboot is needed to be able to reboot the board.
> The I2C controllers are slightly unusual because they each own an SCL
> pin (GPIO8 for the first controller, GPIO 17 for the second) but have 8
> common SDA pins which can be assigned to either controller (but not
> both).
> 
> [...]

Applied, thanks!

[4/7] dt-bindings: mfd: Add Realtek RTL9300 switch peripherals
      commit: 0c64e7496717779ff60249d5aafd5c18aceee982

--
Lee Jones [李琼斯]


