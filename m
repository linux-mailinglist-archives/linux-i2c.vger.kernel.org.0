Return-Path: <linux-i2c+bounces-4907-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D0E92E492
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 12:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76B0D1C214DF
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5FD15A865;
	Thu, 11 Jul 2024 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWfylG4R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A37158A29;
	Thu, 11 Jul 2024 10:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693463; cv=none; b=CUNfoj2RhyAEuD6/+MSzKy6nGOB4oivn+Q1LaspgO3W4Jz2V5CWtGrd1CiF59QL2Cv3Ur+eAlJDJzdW1Hffo96Sq5MjUYE/Hvp9ME5jrXa3dJ/aQ3TEotV5Tp0b+a/fAuvF9hDMOxU56t5Wgt4v4PGwZ+rqAGOzOTHBZlBF5Szw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693463; c=relaxed/simple;
	bh=HmJseevhNYSkdjwozzsJ9KmW2GTJMbaS95Tj7s+PEj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t78FzaPH0sDGRtmDn/KfHsmbMwEhm/gZwo5uoHKhDB+AjXajPUTxz4m3HB4JswZ/7b24Woa/WklaYB+PY7lTHZOPokVHY4XcaaL/zjpFn8lcGujqDAIiopn+gdfYlgHbyCOKKvFfqWjyb+70EPYcpBIa3vqMnng+7Kl2+EPIRI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWfylG4R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A809C116B1;
	Thu, 11 Jul 2024 10:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720693463;
	bh=HmJseevhNYSkdjwozzsJ9KmW2GTJMbaS95Tj7s+PEj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TWfylG4R3iWg+wOlunAw9BErwADGIxUeCaaaQYhUfH3TWvHsrbba4vzFvulV4qUvh
	 lvaoaYhT0fg9aVeE8o8S04OfuXofmKlC5MJJE/ag+bd+7merjjSLhMLGURs2iDVDwU
	 8vz9TPXRtuOTRyVyuxZYdFje3Mav1rczeuUUCzOevdwomIfM6ol6Mg55Al4xpaNDp+
	 4KbiXaV+UUTSsAHZ0WBIHRaTWo4lV6HFD+C2YS0MrObTpvXUoxVix74N21siRSm9jN
	 ROXHAYqUVlsZSDneWU+RV+Gq8Xb0Acw3QUjQX5j+Cpiu94NRPubDjLSPVso9hq12Rq
	 JtV7sNilecs0Q==
Date: Thu, 11 Jul 2024 12:24:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 45/60] i2c: sis5595: reword according to newest
 specification
Message-ID: <75z3n3dg7ckiwgdpiqvldfk6nmo6s64swafjj2kwgplwvdjlya@kq3qq6ayu3ul>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-46-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-46-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:45PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

