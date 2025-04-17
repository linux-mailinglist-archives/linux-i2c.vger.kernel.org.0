Return-Path: <linux-i2c+bounces-10467-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4782DA9224B
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 18:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BD071725A3
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 16:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B980A254865;
	Thu, 17 Apr 2025 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pu+5Oevj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7622225485D;
	Thu, 17 Apr 2025 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906123; cv=none; b=KKvNyuLAyFAHgTmgtAxmTUjV81Ba/yt9mzaSxhMiAj/Eecx8cX7PjbpxRYvQXPpDXQ8MVG5jYTjXSAeCoSFurNYZxl+AMjpbBh5pCoJ1vJUrSVo8LeK/p1lKMwtFfl4id+S3xFs3QeLX7LfQBcc6+YvKl01OcBuWDQep2sAcsBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906123; c=relaxed/simple;
	bh=5P/fK1tsHJhnyaMTuBiMf8Zin/Aete3BdacTSOwEOiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MtKaIh8eK7LCX/UKQmgk0O2ULHpSBLHpwrpT2Hl/LEd/qiMpGtqbnfM0bpPVTV50XtDvRKlc34b7kgIC35EFD0d+7Cuv2+KDGQBeRKXBMZsy5YHAlo2FSGkbv7KeXZtIjaimgRwjly9HIckWzCOXJdSCWABAjebp6qovHXiQUxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pu+5Oevj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2DBC4CEE4;
	Thu, 17 Apr 2025 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744906122;
	bh=5P/fK1tsHJhnyaMTuBiMf8Zin/Aete3BdacTSOwEOiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pu+5OevjUBKHPuXZE8V+/eRoPTgH8gmSnWUwAhndzCgmGAbuDD+dJNW/SaI+08glw
	 K8NQq2mHZEqKvDFq0rYI4ernuZf4tbjjAmPM1OwbzfTa/IIp9Vpz/2jPqaM+J9jaZR
	 EiC7S75qIYz35AOxbNfNvQFpRTqMsiCYMGrcWxYRqF+RVTLemw8hyfi3h+d3Mt0oLY
	 iE1tr9Y4XfU30HaVUvsvzCuRMrTuC9uzLoBZleC7C3kglGhmZuG0pZXVVlRFNqVMev
	 WtY28ieQnGebWEePLNWxTX516NnUhN6JyoAoEecuqOL2NX6obBpCixXRcS4bvig3MM
	 WHHA4zPhdMuBQ==
Date: Thu, 17 Apr 2025 18:08:38 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Markus Elfring <Markus.Elfring@web.de>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 0/1] i2c: octeon: add block-mode r/w
Message-ID: <ii7ditpkwb6w5d436ql7fxxo7kvrn7megtchv2lqyixtg6bn7z@msj34kx7lbcm>
References: <20250324192946.3078712-1-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324192946.3078712-1-aryan.srivastava@alliedtelesis.co.nz>

Hi Aryan,

On Tue, Mar 25, 2025 at 08:29:45AM +1300, Aryan Srivastava wrote:
> Add support for block mode read/write operations on
> Thunderx chips.
> 
> -Refactor common code for i2c transactions (merged in v11).
> -Correct function docs (merged in v13).
> -Remove 10-bit addressing considerations (merged in v13).
> -Add block mode transaction functionality.
> 
> Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>

merged to i2c/i2c-host.

Thanks,
Andi

