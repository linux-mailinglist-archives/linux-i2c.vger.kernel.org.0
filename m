Return-Path: <linux-i2c+bounces-6585-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 794569757BC
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 282821F227AB
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E181AE865;
	Wed, 11 Sep 2024 15:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSbZqsXQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEAD1A304E;
	Wed, 11 Sep 2024 15:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726070228; cv=none; b=qmCXdum4Be9C8Tap2L6VHlbiqwBFrcGuYGNwEhAamS4GS0CkIMPBqGjynZwaTk2nf/2ilhIubRJusj521Fcrp2xrOB5I7NNwOkpz+VKhBQjgTOyVuZece55bmN1SFljExtMEQxMHZbd/jn2vv4ZKuu8PHCeyw/jZg9Ui/nMnyYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726070228; c=relaxed/simple;
	bh=nF/c18D09Y46sCdwrFKtfmx8kDiDbxV17SDMLV7V/L8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyHkrEJdH6B/xCxkBdUukzFTT4t/T/xU1Rm0iY8RveJEKv1bxrkSNjJPK/hdAT/ddRTr0ZeesNDYOW9LVH+tcm838M19LA+5K6DSVXXXqeo5TY9wGU7gdmEa7rOrq/noMjVg0+wAm0Xa8u+nB1NFgmiP/VzihYkdlLnepYPV1IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MSbZqsXQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1C2C4CEC0;
	Wed, 11 Sep 2024 15:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726070228;
	bh=nF/c18D09Y46sCdwrFKtfmx8kDiDbxV17SDMLV7V/L8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MSbZqsXQZvxGgXr7EMhs3k8GTYGyywHC84W9sj1TjYH8RMZGFoqM6+plv6qYKV3HZ
	 pS6kfpCHlmoV4B+sjBZ4uwr9LaHRu5Mt/kD+ZwONUHx3KGyyrpf8Xa8WDuCoGTSXrS
	 8qZLfV9R21YSnNKTlzsisFjw+a6taz1fqVMP2kjEUOILsMNhu6X7qr+1RuuX1eFryg
	 yghG2INw1jKbRRHHcQn+vnmlBVAlqYZftGFjBxSFcRlthZyVc2BG1zZMcq/SMLP12P
	 rb7U7vopaKPOe0vDpzyrDhbp8IaXAOAx+j7vhxf6Jd/MYZ8K3lX3nnsjoRwbYojnfs
	 yHpsnfl1fLMaw==
Date: Wed, 11 Sep 2024 17:57:04 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Cc: brendan.higgins@linux.dev, benh@kernel.crashing.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, wsa@kernel.org, linux-i2c@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH v3] i2c: aspeed: Update the stop sw state when the bus
 recovery occurs
Message-ID: <ljwz3zv7sakhqoeuceewmnk34igo2srfhtmbhhxqel3tgvqvou@wpvqldtoq6st>
References: <20240911093951.1674824-1-tommy_huang@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911093951.1674824-1-tommy_huang@aspeedtech.com>

Hi Tommy,

On Wed, Sep 11, 2024 at 05:39:51PM GMT, Tommy Huang wrote:
> When the i2c bus recovery occurs, driver will send i2c stop command
> in the scl low condition. In this case the sw state will still keep
> original situation. Under multi-master usage, i2c bus recovery will
> be called when i2c transfer timeout occurs. Update the stop command
> calling with aspeed_i2c_do_stop function to update master_state.
> 
> Fixes: f327c686d3ba ("i2c: aspeed: added driver for Aspeed I2C")
> 
> Cc: <stable@vger.kernel.org> # v4.13+
> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

