Return-Path: <linux-i2c+bounces-4828-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F01092CC89
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 10:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED57A281A69
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBCF84A46;
	Wed, 10 Jul 2024 08:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZ/k5Ky8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187F482C60;
	Wed, 10 Jul 2024 08:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720598998; cv=none; b=Jd4XzCzTLSzIAVmfDBHC9cCngyFKEG9Hd6e1xqw0PUxjBnxndEremtnfwMKzUjOODaGioaj2Fr+96bsVfWHYrdSCUAsGL0dWCMYQ+mQeWDza7wrN31t33/F1twVtJbnIQGoXI28If4rp8fq1JkGrGulJlQOOREYfHsIjRMTpTQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720598998; c=relaxed/simple;
	bh=M/mKChCIxOGIgvt8xIEZzy2+aDJxePXpj5qu2AWhxC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCtozi+UoeQ6xONxzV53/8X/jAwYsqx4GqiWuGK6om3HqL5bbvs4gMr/cUfbLGJSumy818RVQJYMheG4ufkw2gR7agqODFX2yP06UvynClka8AYf4dcrvnDEQJfws6Q2QkDWqPpBlYo2YGMgqdEc9oZeHUKxESv0ok1KDiT2/2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZ/k5Ky8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6E5C32781;
	Wed, 10 Jul 2024 08:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720598997;
	bh=M/mKChCIxOGIgvt8xIEZzy2+aDJxePXpj5qu2AWhxC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oZ/k5Ky8l0KZ8hl9uk1ikKYPL+PdtXbU9F7P5vs9SXlOWOE2rES5Cdu/TB25PjSlr
	 he9JiN40vddsLokStjPHQ2NqiIfGnnDiGS5QjhXHQWNr93B1VnnacSwbiQV0AQGQZa
	 Q5cnJHOU+gO7uefYav02aH7QM307NhF4KuhuG8Hpsei/KaeRTw01lZZy4GB62LLPzx
	 pPQBkvu/szSmcIJurUrT93UKOb2B2VzC+wyaG5aUGSS7rs2jD3MI5J4Yy67kmifUWT
	 48dPZ6HYfOk06uPQbwpcqLDHtuBzlYBujXlCCeu8sjO3o8zeH73d/TUv4pLrE9L29y
	 DtgiCcypnI+Zw==
Date: Wed, 10 Jul 2024 10:09:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 19/60] i2c: hix5hd2: reword according to newest
 specification
Message-ID: <7hfyc7psrtzrx53lgaiq5uq3x3wq4w3dxf6rc4upyktdxohmro@h2nx342mqe7g>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-20-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-20-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:19PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

