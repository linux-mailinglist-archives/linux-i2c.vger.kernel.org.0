Return-Path: <linux-i2c+bounces-2767-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AB78992B1
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 02:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16D5928953B
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 00:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A989F6139;
	Fri,  5 Apr 2024 00:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HR6TOTLk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619D85695
	for <linux-i2c@vger.kernel.org>; Fri,  5 Apr 2024 00:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712278460; cv=none; b=uwVljAUQDSCxKdAmDgc+LeZa88naSf8Svu0f5cSQDSx13rpl0CSmhY9e23GysoTradcb3svU7Y6PWgjpRLT0Um1xqrXdN4JEtRqtoS16EfcTBtEW39Hkr3vcoRrrdsCxHrVv9UHnu+ZWhKCPH4K+EQm8X1QZQ1w0TxhsvKfell8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712278460; c=relaxed/simple;
	bh=PNXPV2CVDO/ZijOpMr6RH68wl+HYo5cnTLy9IUGZRy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRk60QnPVHbHtcivrNzCDuWR1FdpxvAK1+67LB5fBtRStrSJBIWgd6b6X1tsjkXTIL78NLZpTYgwMw1XbBFCzZ71VvZ3rpClHhsJ3KG7HGNy2qIj/kNbJjyGDbSyqeh9GTGv7bbRj2G/lZwrvphblVxdch683/G70XkE+95gbbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HR6TOTLk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613CEC433C7;
	Fri,  5 Apr 2024 00:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712278459;
	bh=PNXPV2CVDO/ZijOpMr6RH68wl+HYo5cnTLy9IUGZRy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HR6TOTLk42scJq/enieCVGBsCw48m/SO9oyK1CYaZmYUKlDqlsx0mkxSF+nvF6yfj
	 O4skE3tkg9IduWhGCdQX+DkYYEj0bXPUX56Q81trF2AsLGBjerCzRzSoRysJSY/NDu
	 1ZkQuxXzNcA53sT4HZ3YfFhwh5tMB41sG5Y+DNa9d6bLUsv+eXhhETjvo03xEOlkn3
	 jVJZFhT6g9P82SJ8o0CO1NjSVD4Sbd0QAuVv0NCgAt1YstQiZnl4+Ga+CYBOm3Aq5V
	 4mCoAbFyalklYk5VFq2SrxpJb1xyVOyXtIdCPhZO5oouVEQpnQVDmTnUO32H7wk6Nd
	 xhnbYK3gdo7vA==
Date: Fri, 5 Apr 2024 02:54:15 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: i801: Fix missing Kconfig dependency
Message-ID: <4dhfyaefnw2rtx5q7aaum6pfwha5o3vs65iqcrj2ghps34ubtw@b3bw3gggudjs>
References: <5b43041f-4f97-41dc-87fb-c2da425e7654@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b43041f-4f97-41dc-87fb-c2da425e7654@gmail.com>

Hi Heiner,

first of all, thanks for the fast reaction!

On Thu, Apr 04, 2024 at 10:09:50PM +0200, Heiner Kallweit wrote:
> The original change adds usage of i2c_root_adapter(), which is
> implemented in i2c-mux.c. Therefore we can't use the multiplexing
> if I2C_I801=y and I2C_MUX=m.

What is wrong with select I2C_MUX?

And is this covering all the cases?

Last thing, how have you tested and reproduced the issue?

Thanks,
Andi

> Handling the dependencies in the code would become unnecessarily
> complex, therefore create a new config symbol.
> 
> Fixes: 71b494e043d2 ("i2c: i801: Call i2c_register_spd for muxed child segments")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404042206.MjAQC32x-lkp@intel.com/
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

