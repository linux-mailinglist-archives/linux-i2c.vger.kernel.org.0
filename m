Return-Path: <linux-i2c+bounces-4886-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 840F592E187
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DCC91F21B38
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 08:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F3F14C5B3;
	Thu, 11 Jul 2024 08:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aa36HTSH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E505014B095;
	Thu, 11 Jul 2024 08:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720685248; cv=none; b=c0Wbr/nlqUaZMjCJusK/ISEFapuq1HwstaW3FHrTX21yYuVuMasRiMEJtsjuL+ciQXsibJPcElQZrLW1QSsjlfmfOf9pBHefKMkDeCD4LAiFGgtHmSplqz1ZsIbjbXTzb3vzkER95CLna+9nXRSkhd2Wm0deJkVD8U86ADaCE6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720685248; c=relaxed/simple;
	bh=/M3pLgWLzGTJvYBC5CrTLnEmwgRaWGxh57jnjQm40fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUNn4JswDuYAs/S0KZdS4YsmhdHNSNqqKWpdpEZcRUzwoT089s5zGMpln807f+4ZZl5rIyj69yJj14Bivr2sAMmGsGg3+CJ7I9QmZ720C0/iaIGLPlTjgZRjB9PtOM/jtyOVhtRLN1rI2OPPSmzN1RonC+2Fz2saVgcpA/NKXgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aa36HTSH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0898AC116B1;
	Thu, 11 Jul 2024 08:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720685247;
	bh=/M3pLgWLzGTJvYBC5CrTLnEmwgRaWGxh57jnjQm40fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aa36HTSHWkvem87wUavAacj5We75hnSmxdWYTfwyGNyY5Ky/ncOXUPsOTPVn8PJ2+
	 qHQgEqwbSh2r86RNLmUc1Pz7d7HY3lZGv7oSI3AAYJUEhK5YpmYtDoidFA1fx3unId
	 wkkNzqz97OVk6LWlIaZKRQLCeNFg6YTMHzYg23ecMCHq6MqBme/XdwPuaoAQNg7Ohl
	 aZHio2bTgksReMqsdfKlD2kZ8QwYQZtXLHL6l9c7YWWMdVoEBkxUKx82YZATukjMPN
	 dpPqGVPINFRTizZzvI0SEf2DQvaeAqucUOCWlNRMu7/7ilu/bCOii0UWsD5+G7m8N3
	 m95eZw5Fp/lGg==
Date: Thu, 11 Jul 2024 10:07:23 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 37/60] i2c: pasemi: reword according to newest
 specification
Message-ID: <66x7zzf5p463vptkt7iopihbnlmpkyinrjkzkogbdhrcjltzoz@in45c5v5yzc4>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-38-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-38-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:37PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

