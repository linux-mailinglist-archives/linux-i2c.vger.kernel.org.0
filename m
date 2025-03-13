Return-Path: <linux-i2c+bounces-9819-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C29C0A5E8E7
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 01:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 966161899AD5
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 00:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FED28F4;
	Thu, 13 Mar 2025 00:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8YYd/W1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C4417E;
	Thu, 13 Mar 2025 00:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741824627; cv=none; b=Taz5P67+3cmwxehino1nJqcNyO3ApepKLmu3zlBiuSkZl0hoNtL0gXe2ENhAOb2xVzOMOATSY8l+Q4uikGTW8MQTHzosxiaCdduQU8jIRXqW22XZgFOhtgEgkDs822U/bZn3xwsqNF7oYCCCBiWrK3O+NyvpSZ9XNtFHmkhLZc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741824627; c=relaxed/simple;
	bh=8soeqXNN5au4hvLPUpIInyAV09m1jrjYWHYC7wip3jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIC36/G081J+qcaWhJuzBQvRKcGGSYt83fKei33hhH4y/ek6OIVPa3Plql8DY01+ikCEnOpdh1dfD6xki+E61NEqcnISmxM7AzHyBxolCC1VmdpgwvR31oSD6bUZCjq+qWqguqtYJtjrfRev/wNZs2mdnjQUcTcQcs/0MlNJogI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8YYd/W1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC902C4CEDD;
	Thu, 13 Mar 2025 00:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741824626;
	bh=8soeqXNN5au4hvLPUpIInyAV09m1jrjYWHYC7wip3jI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j8YYd/W1Va4DqX+vWN/hqTBRjVKF52OQw9S5xTtXKNEZEaKCZKKvvpARrh7h4KA37
	 NdGwZajanvod9BZutuW0zg316W5OPu8BLBYfMIv7Al3se+N/DZz8E+aHXldMkdViXA
	 dC9SjaKMbmCPHdlEoRGQEVM9RJ/M4ajF27khsvyzXlUYikoFPBfL3CHLsenxxQdlzG
	 DVMHdVSBT4kBJnNgzRb+GG6O4n34K0EcgF3oflK3Pw9HQpTydjHL0eY+g8CPNOjI1X
	 QwNIevz66YQRxs9YN761dVFpdo6raXh+t+9q1Y7gurd3sd7F7zOYppaGe8O0S52gI8
	 5EQZGS3NJ8cJA==
Date: Thu, 13 Mar 2025 01:10:11 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: Troy Mitchell <troymitchell988@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
Subject: Re: [PATCH v6 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <nrmoj7gookedlz2e3fgu3hvn3s5fc6vrxgjueynyp5orj63k4b@cqlhflioxv7h>
References: <20250307-k1-i2c-master-v6-0-34f17d2dae1c@gmail.com>
 <20250307-k1-i2c-master-v6-2-34f17d2dae1c@gmail.com>
 <7d9e90ba-8c23-44dc-b64f-80213216faf7@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d9e90ba-8c23-44dc-b64f-80213216faf7@riscstar.com>

Hi,

On Tue, Mar 11, 2025 at 08:46:31PM -0500, Alex Elder wrote:
> On 3/7/25 7:13 AM, Troy Mitchell wrote:
> > This patch introduces basic I2C support for the SpacemiT K1 SoC,
> > utilizing interrupts for transfers.
> > 
> > The driver has been tested using i2c-tools on a Bananapi-F3 board,
> > and basic I2C read/write operations have been confirmed to work.
> > 
> > Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
> 
> I have a bunch of really small suggestions.  Please consider
> them, but whatever you choose to do this looks good to me.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>

thanks Alex for reviewing, I will wait for a v7 with your
suggestions.

Overall the patch looks good to me, as well, even though I have
to give some credit to Wolfram's previous comments about the
i2c-pxa similarities.

I checked the two drivers last night and I can see some
similarities, on the other hand I also understand that it might
require some extra effort.

I want to check it again, though, before applying.

Andi

