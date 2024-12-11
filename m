Return-Path: <linux-i2c+bounces-8433-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1129EC1C8
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 02:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 882BC284FFE
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 01:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDA61DF279;
	Wed, 11 Dec 2024 01:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRHcntU6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98D01422A8;
	Wed, 11 Dec 2024 01:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733882185; cv=none; b=MgGLFIFw9/6NnyOoA+44Kc+5eL1pYlhGqMdlP+Yo9iR0CaJKqT7I4qLLX8hFYE5lMNHJdeiXNjtql863dJ02ERC1cW1gFarfRtXFx1GNlu24hlJIDmgOQWjXBb8MMtQFzNSJccY7lfkOgP9uIpYoiZcFrD6paS3m5SGk4CRPy8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733882185; c=relaxed/simple;
	bh=L9hpu8B4bEbv4BWzFDWIU58mS0NmeBwiwVL18jWxcmk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ym8DKZ14/g6ux4T4o3nMApf9CA+yG7xcWoYb01dGuDWM+XPP3kRFtUbbmHwuCDouAT5BR/FnfMom9NXdoVSuYtRqWqF13JkFUzC9CFtLkSsrnX3s+IJBLwsnnx9WpFN5xONkuJ1ruGpsOqcyJRgI/PsZgj0v/tdcapa7bBLyfdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRHcntU6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A8BC4CED6;
	Wed, 11 Dec 2024 01:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733882185;
	bh=L9hpu8B4bEbv4BWzFDWIU58mS0NmeBwiwVL18jWxcmk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eRHcntU6PUTaQAoAcl1WW2JDRXgUKIXE7WBD7o897zJVjdXb+uAiSlKSMQNPpDzh/
	 CBJkfx8GA0/BK7W2DxurNJNOHL0weszqvRbEy8rzexSz9ta3UBrxKwe2UcGKEtu/0I
	 Vm0SIlF3cQ25hub1vkMJbn8v7uxSo1NusbEq1EBA8lIsJbnMPbSr+/OFukp161Alfv
	 Mf9skIEs60bLDHpHFv5HQGSDlxF2cGKr2azC27J4VbIb8skxdprs/As1YbPvmXa3Qf
	 s6APl4ww4KZXiib2CpXNuzIpWorqL83QDNashcBW2pkabbAF4S0zvLXVHk1hxvBwDW
	 P/hlfzaglAtKA==
Date: Tue, 10 Dec 2024 17:56:23 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Cc: Ming Yu <a0282524688@gmail.com>, <tmyu0@nuvoton.com>, <lee@kernel.org>,
 <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <andi.shyti@kernel.org>,
 <mkl@pengutronix.de>, <mailhol.vincent@wanadoo.fr>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
 <jdelvare@suse.com>, <alexandre.belloni@bootlin.com>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-can@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v3 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20241210175623.748da1b8@kernel.org>
In-Reply-To: <2d6e82ff-9f68-427e-a8a6-8dd31b3c94e4@intel.com>
References: <20241210104524.2466586-1-tmyu0@nuvoton.com>
	<20241210104524.2466586-2-tmyu0@nuvoton.com>
	<2d6e82ff-9f68-427e-a8a6-8dd31b3c94e4@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Dec 2024 11:57:41 +0100 Mateusz Polchlopek wrote:
> > +int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
> > +		     u16 length, void *buf)
> > +{
> > +	struct nct6694_cmd_header *cmd_header = nct6694->cmd_header;
> > +	struct nct6694_response_header *response_header = nct6694->response_header;  
> 
> RCT violation

This code is not under net not drivers/net
As a general rule please focus on functional review, formatting and
process issues are harder to judge unless you read all of the mailing
list traffic.

