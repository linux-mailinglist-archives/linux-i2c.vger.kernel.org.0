Return-Path: <linux-i2c+bounces-15245-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CDED38A9D
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Jan 2026 01:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DB87306F327
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Jan 2026 00:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6F01494DB;
	Sat, 17 Jan 2026 00:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXGjTnRj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2AF500944;
	Sat, 17 Jan 2026 00:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609365; cv=none; b=lcuAQ14tl+3g1ZeIkQPGk0ZYP3oYl4A9OgCG86CCUonldekuJcEJE8nz1MVhtYcSC/+IKXWSth77onzXgfbVJ9VjajFlcdgOJZmZ1aeQOZOnUf064cOkFJcCMOXiApZKt12j3GUy1G9yIX9FziWIYWiNF8ZQJTCI7/pYCBpoyZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609365; c=relaxed/simple;
	bh=wcuDmVadV6FCks/wNubKTGNEPn+pme0esTG1SHO8+Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfMUixQSr/iYxsNKIqAORZW+9NZME8PuO5ksanWG+V3tUSGgi9k9wAwlchjpwQBHpjgPMS21xZad3OyfiVEX8pdqI6ULHfInqa3nNsOW1lBr0uVqyOtwuXUWgMQ3MswAe+df7W5j1VHi/HScV8cDhVNTjKhiD12gX6YfisRNVS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXGjTnRj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE5AC116C6;
	Sat, 17 Jan 2026 00:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768609364;
	bh=wcuDmVadV6FCks/wNubKTGNEPn+pme0esTG1SHO8+Zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lXGjTnRjYhn+eZ3cH6QHCAPK6baxdV/kHEGYuHwQiJMqH+/b35f7pPhPRrbiLlMOr
	 577HgonM9/8bbTQgdP4fMPvseMx03UcnJGLCq1QKJqVIj8sUUxBVXd4mKECj5QLMxo
	 yg73yrb2GJim0tNOSV8Il85+OpSVetP3Kf/AkNNtwfn+jbPI+Gvw+ETI5C2SQXqUWg
	 1Zeugpc/qoyKkfZVSg2/OgRlK740tkPX77zCoiC/37O+GBzdtuWp/wSKArxN6/PBsR
	 6dxVWiwfqC776aLNY5XYP7a1dsZ+PRYKoqbUiT3P/5nWxUJSOs+e7APlkVM8oNOweM
	 a+b/DR6MXVvJA==
Date: Sat, 17 Jan 2026 01:22:40 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: "Jens Stobernack (Nokia)" <jens.stobernack@nokia.com>, 
	Neil Horman <nhorman@tuxdriver.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"nhorman@tuxdriver.com" <nhorman@tuxdriver.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"vasilykh@arista.com" <vasilykh@arista.com>
Subject: Re: [PATCH] i2c: ismt: add i2c bus recovery on timed out transaction
Message-ID: <aWrWBGXoneKFMQpJ@zenone.zhora.eu>
References: <BY5PR08MB6296FC84911F1B2F63AC04DAF1D1A@BY5PR08MB6296.namprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR08MB6296FC84911F1B2F63AC04DAF1D1A@BY5PR08MB6296.namprd08.prod.outlook.com>

Hi Neil,

On Tue, Nov 25, 2025 at 06:30:35PM +0000, Jens Stobernack (Nokia) wrote:
> In rare occasions the i2c controller will get stuck. This failure is
> described in commit 46b2dfc0aa79 ("i2c: ismt: kill transaction in hardware
> on timeout")
> 
> The kill operation never resolved the stuck condition in lab testing. A
> traditional i2c bus recovery was required to recover the i2c
> controller and allow it to continue operating as normal.
> 
> Signed-off-by: Jens Stobernack <jens.stobernack@nokia.com>

any chance you can take a look to this?

Thanks,
Andi

