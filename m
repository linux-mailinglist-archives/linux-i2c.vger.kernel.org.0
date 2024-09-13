Return-Path: <linux-i2c+bounces-6721-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE0997831B
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 16:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80C73281BEF
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 14:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5B222338;
	Fri, 13 Sep 2024 14:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nWxOMY17"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3155711187;
	Fri, 13 Sep 2024 14:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726239586; cv=none; b=ZMWhiT/6vIWoRlAhmKCI5pEl88iXvdlDkonHFG0n/3jytfYlRZrqjuIe8AFLcwid1Tuw34yf9iFUIf3DhqdCCspCHk3Pg476nc4XnSA6hc+drpzv1nj+S8QADwtftx5QCK7T3iiejysQAVJaZDSdnrKjrpaFV5VvAPwTBmVqcjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726239586; c=relaxed/simple;
	bh=GBR/ylUWELEf4Nvt0HwsmeixlCJh0DahxVeDrnHTK4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5BYc/ULbXY4+ndbSIWdzw+Gh7V8Iy3mwXJ5bSzw6bsyIhYUQZq+xzbzFq3n39RxmA4lKp76DPmIVKLGRM8HXzTgd/GLqUT0uf2e8li1lUcic+1SjbNd1RRGtjyz4EY6CSFSaEd384omHdnCWnskv8/jkzzA0ChHvfZ9UUHA9b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nWxOMY17; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F454C4CEC0;
	Fri, 13 Sep 2024 14:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726239586;
	bh=GBR/ylUWELEf4Nvt0HwsmeixlCJh0DahxVeDrnHTK4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nWxOMY176ksBiwhKWCrUFM7eTN7vl/Fdu2uY9KOP3YrBH58M7EsYQsOAgxsPceD4E
	 zVv5xb6v5CkMxp9oA8Yl8KbjgiXIqPuCvrps5Zo/7TOgPyFRm2LfoiT+F6qx7WCJpA
	 8V9kLoCD+9NtLISQFVtnqYbMgJ9yeQptoEV7Cb9P/7eTdre2lz9oPh7VrbFXtpdOjQ
	 X8fnGTbqnqJ2y0mgoQ9qyraTMFVhLkxsPFVaNFJj8Pym5H8vQfbbChevZnz2WNCV2k
	 8ZcxwYVTh+m4iXePzpQvqRrQU3B/yz1jRe+haxn6Y+EMElAJeNDmmaNPWWDUSD+7MN
	 YN/u8jkKDhlVw==
Date: Fri, 13 Sep 2024 16:59:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v7 05/10] i2c: core: Remove extra space in Makefile
Message-ID: <q5g4lus3fifwtaypqvljtmw754px473mpx66b2vtemyivqfpm2@4q3mnojbfp66>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-6-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-6-wenst@chromium.org>

Hi Chen-Yu,

On Wed, Sep 11, 2024 at 03:27:43PM GMT, Chen-Yu Tsai wrote:
> Some lines in the Makefile have a space before tabs. Remove those.
> 
> Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Closes: https://lore.kernel.org/all/ZsdE0PxKnGRjzChl@smile.fi.intel.com/
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

