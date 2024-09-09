Return-Path: <linux-i2c+bounces-6444-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD9D97249E
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 23:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E89741C22D82
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 21:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D821B18A6BA;
	Mon,  9 Sep 2024 21:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eh/mYgbi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995CA17C9E8
	for <linux-i2c@vger.kernel.org>; Mon,  9 Sep 2024 21:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725918115; cv=none; b=C0tYr7Tv8dSnw1tiva+08iuJEs4kAjLNsSDUGn6b6iq4ab0AP0RQNgOL6Sj+S3Ks34SpA3bHVO7/W2YD/NgCG1hstJJG/XBVEjZfxcQ5K3edSierHCs8iLKzYc9AJ9qscfHCy7oTWLCt6FrvXQ6SJIjcvLzydZgxN7k/purBU0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725918115; c=relaxed/simple;
	bh=WmhFLOA89tCQ4bRVLAvhPN78GlM66c5pvdnbfePujJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POweveGfnvcO/ieUwkkn0zx0Gya7JXjrYYMmXQa0hiW2Fp/n4QOZHhyUf4mS0kfNivHfF8yBFQXmRTplc4SfWK0iHCorYZ6Vm2AIbIKCp0f+IM7H4lL3bQCOnm47HMcLhg7wSRdnDz1HqbqHqKacxNE+gS9+Wmd1iPev8vGUZbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eh/mYgbi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3AC8C4CEC5;
	Mon,  9 Sep 2024 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725918115;
	bh=WmhFLOA89tCQ4bRVLAvhPN78GlM66c5pvdnbfePujJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eh/mYgbi5Qz+hTsepNJF1HaoR2u0C79wPvHsPJKEAFLO2Sj/eQPm4O9kwpc8PVyP1
	 8GB842l9XzDQleDzsKCgRsMwJkCVzioKIlPf0Xzy18/TbFKDD81mwdgoj5wRYrTrft
	 283/gqIHZGVZXdjhqPCGYbhHCF+i36LupYZ+eh8nQOf0lwKSXlwgLyQ8XUyAZwMqSA
	 NbszuVUuAbzNui/erWqWk2gqszPR0imeJKiMG6/ztGCDf3RguT/yJtOtMKPKYYN4pu
	 or5CE+NsBeCv9dpOPknBlH3ukIgINDmKcC3ATc03MNDfOnEuZ+4uIkkGRZhHfQ2oBJ
	 NOsZn2UBzksnw==
Date: Mon, 9 Sep 2024 23:41:51 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Vasily Khoruzhick <vasilykh@arista.com>
Cc: Seth Heasley <seth.heasley@intel.com>, 
	Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ismt: kill transaction in hardware on timeout
Message-ID: <moqbrrbwmumxzl5ekpqegvzzgatq3bvi7e6kzksesehki7ygvf@u57vt5q245tx>
References: <20240819205125.92358-1-vasilykh@arista.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819205125.92358-1-vasilykh@arista.com>

Hi Vasily,

On Mon, Aug 19, 2024 at 01:51:04PM GMT, Vasily Khoruzhick wrote:
> On Intel Denverton SoC ismt controller may enter weird state when
> transaction gets stuck. It times out in the driver, but unless
> transaction is explicitly killed in the controller, it won't be able to
> perform new transactions anymore.
> 
> The issue is extremely difficult to reproduce and may take weeks of non-
> stop smbus traffic.
> 
> Numerous hours with logic analyzer didn't yield any useful results, it
> looks like the controller stops toggling SCK line, i.e. the issue is
> likely in the controller, since device doesn't do clock stretching, so
> nothing is driving SCK except the host.
> 
> Explicitly kill transaction on timeout to recover the controller from
> this state.
> 
> Signed-off-by: Vasily Khoruzhick <vasilykh@arista.com>

merged to i2c/i2c-host.

Thanks,
Andi

