Return-Path: <linux-i2c+bounces-4936-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE9192E8F5
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 15:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E44871F2425B
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 13:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013D815E5C8;
	Thu, 11 Jul 2024 13:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0Cupymc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEE415DBDD;
	Thu, 11 Jul 2024 13:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720703281; cv=none; b=EGiV+5GMuk0JTlnGfK/NjLE6uou5x3btjpHl1O2u8tmMMw80djj55RVfT4+iBX88B3ROEwOXJbG3f1nK6iKm0yDFgnngOumZsfCTVmqRRuusrDORcWFw+MkRzpTV3OC1gb5i+51Bxz8XNd2xMZaAfQP9qYESUVWVOCBFzeG7/88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720703281; c=relaxed/simple;
	bh=NPCRMysi/aLMyKYO7p9E13/Vki6FDTj9M7nk+uzN0PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lObRoS1jtqxXeng4c7X5cLQnOGjlAGiKx62tN7RDGyUXh1AtdHRPUXTvbPnJcDWtUJybf0asDodzCLrV91xTOtZSSOySt4nX9iuDMeGiB0xd7a7zyQrz6mxFyYRdOAKaij2sYghamC9cOZxE8uN+Mx5Q0WPu96ZVvXNBSp+r7yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0Cupymc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A3FC116B1;
	Thu, 11 Jul 2024 13:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720703281;
	bh=NPCRMysi/aLMyKYO7p9E13/Vki6FDTj9M7nk+uzN0PA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0Cupymc+pMBLncvxB3Sm1GrS1CCZYwv/cAepOWXO+AmfzSHFX0VSZqoeK+AyC+OG
	 KoShDJOJKbgLQhSoEH3czQffBEUykbFK5tyZJO0v5jThm5n55I13egmnOiV1k+IXrU
	 PM9pu7SJXi36r9uVsGMdHjs+rHGZq2tTWRVoMR2LPbSWW7FLmKoOwi9K+XA0vnBtKH
	 Bv0IW7SO6XALH1VzhaPXBpX8KoNLh2zHdeVZA+LZqei3zW4xoX76HvN/YiBaQZkyxf
	 MT0lnH5AOWXz1m9mxWKNaJ6RLgoIV6NcroZjm9e7S/Stog81oDanLlKrA5pllyRnqR
	 7umASjoTKbyUA==
Date: Thu, 11 Jul 2024 15:07:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Patrice Chotard <patrice.chotard@foss.st.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 60/60] i2c: st: reword according to newest
 specification
Message-ID: <iqah34aovowtpy5n4pdqwzs6tr6tjstg37nol6dgxkzqxfqlyb@j6oflu4dvfql>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-61-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-61-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:21:00PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

what a rollercoster, this was the last :-)

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

