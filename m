Return-Path: <linux-i2c+bounces-1716-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87838855525
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Feb 2024 22:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44CFD283942
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Feb 2024 21:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1B413DBBC;
	Wed, 14 Feb 2024 21:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNB40cbv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B94718E0C
	for <linux-i2c@vger.kernel.org>; Wed, 14 Feb 2024 21:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707947241; cv=none; b=QnOWbw8o+eM6iCDw6EtAvV6NIfE6xMbLukZn036YE5gnyifJAQq/q3TJVEO1vSyDrj5qLYPArrP/b68iwbJtPQ3B2EG186jdxO7FSmQwHkl7Pw7ddU4gwuYQkF7tW5mYbFUjbHhE3Z35oyFD8SSBQJFlcLDN+UBP2m23jCInG6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707947241; c=relaxed/simple;
	bh=krfCYURaKpEmRw5+wpvwQ0bjDMCp5Z2JMl0QPiVYbgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RY/iRNbbF/QTjMoy6p5830+B1HyfDMxyzNqqxqSDwM6KpBKEb0qsrGWmUAlsvC3YUItY6fZAxcsenNmE1YwZ0EyHkkmbRTN70LUOrGMKTByMZwRx1ICznp1kx7PzTVDuabjMLurPfWoICAYoK5v9xh9J0P8PuM5Qw6TaTFUN8SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNB40cbv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A51C433C7;
	Wed, 14 Feb 2024 21:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707947240;
	bh=krfCYURaKpEmRw5+wpvwQ0bjDMCp5Z2JMl0QPiVYbgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RNB40cbvP7lmMdmd3xzeDD4lifdwIAp+aZ4Tq3Lv46Ztiv35BfIB9CWJDvbje8zi/
	 fl92dgLdVDwEypStHQN8I6enBLwvgJRszqfn4M7oL5If+TBr239ME/XxiqZNyoVuJ0
	 FnPtDVAt9h91fEmjNQzKDPTivRVNu0ZnHatrcL1Z8EBnsaWqfyNeSCiKAzIoVis6wJ
	 CPueNeZJB9teUE8ZJZDCr88/3GMTGCKEmvOsv+Bn1faW5wb0GVTOSdgYukE5dCRR8p
	 BSZy68AJKGBX8lWU7OUQ/Jw4wir/Diht+d61WqeWL2VBQxuipOBiovpccZizOkbDD7
	 EQFSIzfuHfaIQ==
Date: Wed, 14 Feb 2024 22:47:16 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux I2C <linux-i2c@vger.kernel.org>, 
	Piotr Zakowski <piotr.zakowski@intel.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Shepon@zenone.zhora.eu, Kozlowski@imap1.dmz-prg2.suse.org, Pawel@imap1.dmz-prg2.suse.org, 
	Usyskin@imap1.dmz-prg2.suse.org, Alexander@imap1.dmz-prg2.suse.org, 
	Radtke@imap1.dmz-prg2.suse.org, "Jakub\"" <jakub.radtke@intel.com>
Subject: Re: [SPAM] [PATCH] i2c: i801: Fix block process call transactions
Message-ID: <tx2w5unmrfv7a6ce3ciegwnj3d6nqefomoyjao6pvvkvrkswlr@f5sw25vdsyfr>
References: <20240214155939.728155bc@endymion.delvare>
 <22rwbtavuntbe77bstk3wjsdm366csa43nied6u7w4q6o6sveg@jkqor7zklayg>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22rwbtavuntbe77bstk3wjsdm366csa43nied6u7w4q6o6sveg@jkqor7zklayg>

On Wed, Feb 14, 2024 at 10:44:17PM +0100, Andi Shyti wrote:
> On Wed, Feb 14, 2024 at 03:59:39PM +0100, Jean Delvare wrote:
> > According to the Intel datasheets, software must reset the block
> > buffer index twice for block process call transactions: once before
> > writing the outgoing data to the buffer, and once again before
> > reading the incoming data from the buffer.
> > 
> > The driver is currently missing the second reset, causing the wrong
> > portion of the block buffer to be read.
> > 
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Reported-by: Piotr Zakowski <piotr.zakowski@intel.com>
> > Closes: https://lore.kernel.org/linux-i2c/20240213120553.7b0ab120@endymion.delvare/
> > Fixes: 315cd67c9453 ("i2c: i801: Add Block Write-Block Read Process Call support")
> > ---
> 
> applied to i2c/i2c-host-fixes.
> 
> b4 ty failed to send the thank you letter because there are some
> addresses that were not accepted
> (Kozlowski@imap1.dmz-prg2.suse.org?)
> 
> Anyway, it's applied :-)

BTW, thanks for the fast action on this bug report!

Andi

