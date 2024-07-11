Return-Path: <linux-i2c+bounces-4905-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A7192E488
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 12:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9D581C20FD4
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5B715B551;
	Thu, 11 Jul 2024 10:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agHPl/3w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A58F14F9E5;
	Thu, 11 Jul 2024 10:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693398; cv=none; b=AeC0uEg0x37OTi8oaeHSmhmzEbw8pviNSJ2B6vjXofsPOm1kOroAEYW/TAGpNOs50SWHWbWbhRvNknF3J6PSzdeXejR1ucTanQLqNtezzNhGIIokPMNCwXiemWS8/kLUuSRbxX1JaMLlt0wPUykWEUhwTRgK18phFgwMoJEzt2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693398; c=relaxed/simple;
	bh=iY7UIjUR8rC288vJQBAkh2ALeS5FLxYXGhTzi27/sbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzhYoyDic+5FfhD8iPe274ftwW4XeDXQid8czRvB6mib5+lFwQJUTKLPkyGY81703CCADmugIU8h+7wZJwYpJ5B3Ny3gLbrrFIC54mtSd1U6qfiifO6O6/o3JMnXF7wK6fPloa91NSrOCcJ1ifuvMLWuOpemFkb28/TwlA21I/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agHPl/3w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54CC9C116B1;
	Thu, 11 Jul 2024 10:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720693397;
	bh=iY7UIjUR8rC288vJQBAkh2ALeS5FLxYXGhTzi27/sbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=agHPl/3w3M2QNQmS78araPbAfOsGcMYMHG5cp9tFhMubvszYjPrC0WfK6aj44llTe
	 VTN6ikazbdYFAAgWUtJ81X4VZo1jcWC1hhRZX3VjDVacxnt4D/VQ5ap1guzHN+sX47
	 Z1hF8T+gj2z5RiFcGNuzRMzkz23I3rjV/D6eVRlTsSjlCqp0e5ICq5lb+7TQNkJA03
	 ZnCkMSdAiOf+o5a1kJpag4Mly6iPfy5L18up5dVuE1Htpd6zR78zY+Bw6xU1gmkMtB
	 FsG3svN9BhcV/k2/gpGPoM6lvKVvBcNisyluRcFxHVaIcm8zdpmMEAZ4bbu2GqVmwc
	 PReXytOMODnZA==
Date: Thu, 11 Jul 2024 12:23:13 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 43/60] i2c: robotfuzz-osif: reword according to newest
 specification
Message-ID: <rzjpwllyy53xtd7x75c3ugrdqjrdsrmmy2pw5th3hkoadsxdak@rckvd7lbmrjs>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-44-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-44-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:43PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

