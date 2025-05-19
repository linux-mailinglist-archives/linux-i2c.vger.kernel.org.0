Return-Path: <linux-i2c+bounces-11050-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C00AABC8E1
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 23:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77D501899A37
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 21:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC73421A459;
	Mon, 19 May 2025 21:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlsQnB3y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895974B1E73
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 21:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747689060; cv=none; b=DoA5yJ/y0coLWly6PcpJFJERZMcodu3SHQeUSEGLPl1HQmxE+abgWTjOBctC8OIR5q3SFuWrMBg4rWCDBaiRYvgzGATVDjw2O59MzsfvTI8jkEZp/eV5GgXM0ETF4Vk8NO7GTUec+hpULmqfUVASIXONqVpgnyQ7ZJdTEQSvbA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747689060; c=relaxed/simple;
	bh=dm7xmd/Sv2L/DruGW/WtIEMDDqe4JAjsxi2dcJ2wGCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKemuKqnkJSJ6Zmij7CTGWhdqFwcTKBQ8Ft7g3zL/ulQklFoKSDVxHA1UOTuhDA+RevAAATIOOLePsDPEDlLN8JnAKROxFYpT0EkP1YAZPI5KaFQgjJpt14QlhR/8Fbx7QDm/PbfeNfO2XyvUCEh6CBJmA4jMe5vpXDD/8xsj7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlsQnB3y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C2FC4CEE4;
	Mon, 19 May 2025 21:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747689060;
	bh=dm7xmd/Sv2L/DruGW/WtIEMDDqe4JAjsxi2dcJ2wGCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RlsQnB3yZ7iikyZQjYvPdFzq7QUei9PMW/XPMkosdLu/lrqQ9QEzI6/+NBkb6gX/x
	 FKFxrIK1S69Rik9nG9ReEzbH1HnyRDu09qN0+9qKqMLf/7mgTXEA96Tc1fuDOVm+2+
	 QzrVfGv9f6Y7+du8MRXai9O4Cxo9eD/sAqQVYsEgsVa4Bp5DaPGc1YAOvYzMEKpoua
	 6afaBNMX8inJIj38Bjj9/IKhWr5zbvtLe+vXFNy3+TDEXuuKyuYWvWh6EB7d9VgmZA
	 YMUrpwNGNQTVCatHNCaNrlARTszbE3Q7leJOUsGJ0OSXsYBbzOsT/N+IbF4FTbTdrC
	 lToSiH9heZX6A==
Date: Mon, 19 May 2025 23:10:55 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 3/3] i2c: remove 'of_node' member from i2c_boardinfo
Message-ID: <pslu4crv3ynrzpiynceityeirz6xin5xxh5j7gaxfkazuz6ylr@5oxc2uaipcpp>
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
 <20250519111311.2390-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519111311.2390-8-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Mon, May 19, 2025 at 01:13:14PM +0200, Wolfram Sang wrote:
> There is no user of this member anymore. We can remove it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

