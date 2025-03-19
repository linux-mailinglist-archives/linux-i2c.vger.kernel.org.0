Return-Path: <linux-i2c+bounces-9895-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59500A68167
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 01:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AD73883BAE
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 00:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BC13597B;
	Wed, 19 Mar 2025 00:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7qJhlP8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFB835971;
	Wed, 19 Mar 2025 00:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742343683; cv=none; b=fl+tXBPuVsAjUmascw1zrTsimknRmxO/udw7DIx+QIWghvjy71Uj97FpkautmYJw3uEs0tSfMqJddmaG5iJqTnFeeAtdRAkpSed6Df1JThLx56JMu09qvl4y87X1mKp3vYf1DUZBa0sAdQhSf6U/54JRbuMnTP3j3bMh8OC+f/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742343683; c=relaxed/simple;
	bh=NMgtjadCROnRa1Ys9R93YwXqtftzlXA6EtqprnjQ2ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/FhBNuR885kih2kJkE/mexS3cUhexZzUR2F7GYul1xwW6DFqFscuRlFe6R9DfdN70p9SmMQ+0P70dtmfSmqUhSgQJ4C7BKVEz9NJwkd5YIy/KlpYZlnIWChsmcC27dK1UdNRXOBYE+QCvXlyzzHQgU14YMEitNrCcImZ0tG2Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7qJhlP8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B47EC4CEE9;
	Wed, 19 Mar 2025 00:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742343683;
	bh=NMgtjadCROnRa1Ys9R93YwXqtftzlXA6EtqprnjQ2ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7qJhlP8VOGVyHZoC2gY76Ewn9sV56xEAv/M/IeUgOwtak/7dKG/+6pWYNGnqiCMy
	 dZanJLOiQ62oUQEms3M1tol6jcWsDhQyp8kZLl9CSFLPwJikZTyRJm8XO30NyqYLYZ
	 ff5qoLj68bURGEPjw8vHUM4rUhdMAhc5Y2yvviJA/YTnIf2a+2BAqCY/821IM9W9Z9
	 FIk2EkyW/WTV0LCrswH03pjO8n9kqQB5vm2Ac6LOHkByNQnEJ/+nR8369N2m+uPOiz
	 djFmKzwBeuRD2VkmfXUH6wd7NXUcqBk0jjgC7XirCWnUdxVrJgPj2ipPrze8CTUftl
	 teK/RmYXGeHLg==
Date: Wed, 19 Mar 2025 01:21:20 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Robert Richter <rric@kernel.org>
Subject: Re: [PATCH v13 2/3] i2c: octeon: remove 10-bit addressing support
Message-ID: <j2w45gphxir2hmzr6nhzyrlgj55lhsbkzczpf5bq72pzk26kwp@zncvv3hpfcoc>
References: <20250318021632.2710792-1-aryan.srivastava@alliedtelesis.co.nz>
 <20250318021632.2710792-3-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318021632.2710792-3-aryan.srivastava@alliedtelesis.co.nz>

Hi again,

On Tue, Mar 18, 2025 at 03:16:30PM +1300, Aryan Srivastava wrote:
> The driver gives the illusion of 10-bit address support, but the upper
> 3 bits of the given address are always thrown away. Remove unnecessary
> considerations for 10 bit addressing and always complete 7 bit ops when
> using the hlc methods.
> 
> Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>

sorry, I commented on the previous version. Pasting it here to
keep the discussion on here.

"
Can someone from Marvell comment here?

The datasheet I have isn't very clear on this part. Also, I'd
like to know if there's any product line that could be negatively
impacted by this patch.
"

Thanks
Andi

