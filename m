Return-Path: <linux-i2c+bounces-1933-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E73A860598
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 23:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A36F2839F7
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 22:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B1F12D21C;
	Thu, 22 Feb 2024 22:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ReBh+MVJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0F814B832;
	Thu, 22 Feb 2024 22:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708640701; cv=none; b=SCuY9U/llihNUinM4XZsXzWHnhNGIo1lR2XMwXHuZclo4DyXG5MriJ25byVI/Pmi4jBHTIfmYeR3njvx/+0T+dAyu6DnQNmx/cy2N1DQKR9UnGOcHMSz8q5+42YGAjLLoGCroDiLGYJKwMEhHLBTiblmTeLeL4LyPQcpSiRc1KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708640701; c=relaxed/simple;
	bh=RhYJ7BfPoAUNRYijyEGBnyIHRSZV2yGV02THXznja8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCZD3nBO0badESInzjYZa0cBYEZA1nGjLayahanm2LUy2157vk/ZxjxtIG23nljBF6tdMx6sh5bJ7EXYfk5AzOxFYOHfW/kZOHgiFWGN8eGMsxomHv+dqCDS7CyK1ychtgsKMRzyhiL71RLTZ8r5jyENyBkm61d0FGdXFpUNAS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ReBh+MVJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6ECC433F1;
	Thu, 22 Feb 2024 22:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708640701;
	bh=RhYJ7BfPoAUNRYijyEGBnyIHRSZV2yGV02THXznja8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ReBh+MVJ01M1vp8nrLyEVn+6lvt7lePy+tuqeyacYng0Gx3fNwUe9SfNx86qV8wE0
	 jp1RsNoamJxTiD6qoLUYuoZoKqMq6suaKGHUq/j/5wWV39iBGPy4GBauhS8zU3uxg3
	 BG3SLy6qC8rlSuHMvR3sqrVNX7/BCWbFIOAAeyg8wK15tmz7m86Ha+REosJmq5nStA
	 UVKpj/xkzuh0CsFQ+zV1lKA3zufPJpmussDawH4vSIma54xEYFvgTYzuimeQLXfQ7B
	 jD9a+LXxkOZhy+ItUpi62RhbGswow7EaEGZ/0kZWzad31vC//Qf8ZXCErO/lNaV4VH
	 TyImlT461UBuA==
Date: Thu, 22 Feb 2024 23:24:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Patrick =?utf-8?B?SMO2aG4=?= <hoehnp@gmx.de>
Cc: Jean Delvare <jdelvare@suse.com>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: i801: Add lis3lv02d for Dell Precision M6800 v2
 Bios: A26
Message-ID: <3s546clapu73llqqyhj7fhab5cwhchygrtq53juqcqoyttk2dx@47ylvwpqso5d>
References: <20240222215010.31456-1-hoehnp@gmx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240222215010.31456-1-hoehnp@gmx.de>

Hi Patrick,

On Thu, Feb 22, 2024 at 10:50:08PM +0100, Patrick Höhn wrote:
> Signed-off-by: Patrick Höhn <hoehnp@gmx.de>

I see that you've fixed almost everything that Paul has
suggested, but please elaborate a bit more in the git commit.

Spend some time adding a description. If you want, you can reply
to this email with the commit log you have in mind, and I can add
it for you, or you can send a v3.

Thank you, Paul, for your excellent review.

Andi

PS: A small nitpick: there's no need to add 'v2' in the title.
    '[PATCH v2]' is sufficient.

> ---
>  drivers/i2c/busses/i2c-i801.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 2c36b36d7d51..c1fee2c61da1 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1231,6 +1231,7 @@ static const struct {
>  	 */
>  	{ "Latitude 5480",      0x29 },
>  	{ "Precision 3540",     0x29 },
> +	{ "Precision M6800",    0x29 },
>  	{ "Vostro V131",        0x1d },
>  	{ "Vostro 5568",        0x29 },
>  	{ "XPS 15 7590",        0x29 },
> --
> 2.43.0
> 

