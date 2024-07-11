Return-Path: <linux-i2c+bounces-4881-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ABB92E16E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 310E7281164
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 08:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0989D1494CE;
	Thu, 11 Jul 2024 08:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bw8SVqGH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C3C3D0D0;
	Thu, 11 Jul 2024 08:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720684915; cv=none; b=b3zdAlwFWPeVqxXOFMDPbqXoJ0JJiEUlwqJU5NJCGZKp2jQqc6VMLFdkAE7bJxe7dXfCoBHH9OgQk/XvPrF0b7vPTXb7fjktxN7UPmQ0p2KHM8xbd3rmyQz/1QoNNVDhdnQCICH016u3N4hTsaCZ3aXv25wgGXCcipyaApganGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720684915; c=relaxed/simple;
	bh=1OqEoTP3MAIJ31in6GORT1PyKeQFlQOzUPEC6I5jGCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtDDo6UNQk3uWrw3fxmxOFDrpFwBUBrbvFFsUjnBzv5NaPoB12XrzeyArdUP3wHtz8c0uLRzwMlH9LFDJwXkj+GVU3PK2pAY2PZjkMwETS1f40UBRW5Qxl/Qdz6MiDr4Crlvnt1/1Kua7HQyJ27cQR6ve/hiqVJj+MF42ahbpyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bw8SVqGH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B26AC116B1;
	Thu, 11 Jul 2024 08:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720684915;
	bh=1OqEoTP3MAIJ31in6GORT1PyKeQFlQOzUPEC6I5jGCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bw8SVqGHJyhKFcCErxRYO1Rh14+pEJuGQUtDwiZ+R4/Zt+xfiK0JRZ24BG4vuFX4k
	 11pN7WuYarpBtjxeM5sSvUBOgmT2JKEcJ2l3JoIHfai/QybUbaaBgl+f2sCK+OPx0s
	 PtTT/uNwgHzkSx/6IQe4zvzBCa91RiweFXU60wgUbEix7RHJhYPINfzBkqozwpIfLi
	 FPaAO5lifIpUgDaatZAG2dexMlnGWN80HM+TeNHhhbl3GnliilUISevranPP8um2ef
	 xg2gtoSXBzBrrc6+Gl3amM4jHV9m9EcxMOS6rWS4ZuAcGz5OrbgTy8i+YBJ1yEzlgp
	 V+CrH1KIu0PSA==
Date: Thu, 11 Jul 2024 10:01:50 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Peter Korsgaard <peter@korsgaard.com>, 
	Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 33/60] i2c: ocores: reword according to newest
 specification
Message-ID: <5ln5f5ymj2wfu3pbnjxpfeyvlb7m7excj32rvgggvpvxekqzx4@zrekye4eibbk>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-34-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-34-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:33PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

