Return-Path: <linux-i2c+bounces-8713-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F58F9FC715
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 01:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 366DF1627DF
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 00:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0AEA749C;
	Thu, 26 Dec 2024 00:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aHnuzqKF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA058629;
	Thu, 26 Dec 2024 00:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735174752; cv=none; b=YRbunO1VdfeStu7VxhiQ3ADpcEUT1iDUfbwM3ztR53YQcRkjfVySQRHabKhqtLHV1aZzbe9Ah00vP6q65cjK5Od637FaCrft+1rQbo/+ilMDi/VXfscjv6rtdPOrJbSH0g7Toxdu8l9nqPWmNkxUHxUPqZZWJcaMwe5RsBHoEzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735174752; c=relaxed/simple;
	bh=40QAfc5ONlcuqgTB/eJixVYRle1IK814KzbqaVDUYRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vyw51Ypo6XDS6WMonHTjQCfPzXz3wOIPQRqiXuk3bwuomFxBq8Z+OKgvQRI4waRt4UdkJX1DkI3IjXCJH+svEIDa7YbD/aHjS6yyqNLRS59A/YSuscaWY/OwnFEOJjFZ7AZ+g6EPMOie2gxDKeG+F1xn5Ac4FEtu6jkfeNgwAEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHnuzqKF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D5DC4CECD;
	Thu, 26 Dec 2024 00:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735174752;
	bh=40QAfc5ONlcuqgTB/eJixVYRle1IK814KzbqaVDUYRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aHnuzqKFdNcKwZzDInTbOtFHZ/KV/PUH+hIcSu8th0fy+ZVuLSfMfnPhtAa9BHQOv
	 dFhtsBvln27ZI5G7/AlTDvVjxkr7t//2kwyWS10wGYMIDdOkp0rex10+vPCjTuIfa7
	 /OmidctAEPSMtfUdoxQzCDwnc2pYSCLU41pIyzKCci2ICqXrCQJrBAZGE9ZLd0v5R+
	 45akR43GuDW7/iey96upv7jvztcYkAiAOhPUE3rFjFxb+k7pfYbBis4dBsxq1WNmqR
	 XWjLhd4R+BHDTjV/86UR4IRyzbfc1IUxWLjrYiE6sQG/+TjIcIDqdMuKyGthXLwyOA
	 nh07EHxooXFBA==
Date: Thu, 26 Dec 2024 01:59:06 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Wolfram Sang <wsa@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Microchip CoreI2C driver fixes
Message-ID: <dabyolq2klcqkk2f3sek2lrplkhyzhyl3p4oxz33qyjzhyapl7@25lhgjqj3kau>
References: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218-steadier-corridor-0c0a0ce58ca2@spud>

Hi Conor,

> Conor Dooley (2):
>   i2c: microchip-core: actually use repeated sends
>   i2c: microchip-core: fix "ghost" detections

merged to i2c/i2c-host-fixes.

Thanks,
Andi

