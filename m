Return-Path: <linux-i2c+bounces-6276-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CC896E3F6
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 22:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB52728204C
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 20:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6AE19DFAE;
	Thu,  5 Sep 2024 20:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJ34kv5Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EAED515;
	Thu,  5 Sep 2024 20:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725567660; cv=none; b=lnJRwYE0j4DkInL6nkTyodT70kNEgjl/h+W/nebW//XoCn0xYEnvvJpmIuTADaHESRKMqvl4tFeICk9hZ4Vw9/15ttuKuJHaazykZbegqhMh3jwgejlZhIvDrr5DtmLqqle0Npicsm6MC9s83Sbmga2z1U5M/pk6GtMKHVjUjf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725567660; c=relaxed/simple;
	bh=1lLjn97u5ozr3x2AENQrpqcvwTLIoF8oqz860FWuJxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhMAkUFzmZlAlvothMWz7w9IfBmFJqgsJBnL37sfwaYbk4x0pCfftLkVqZO70PBVn2krG0Es/c1lkmTlX2JFQCZaE+iRWgnYKt3MlHs5FQizU1fPfZn/2wjr9v1kManZibOYvMfe38Z/YgfnqEJ/mlsBwQC1XjfIMyXSCwOCt+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJ34kv5Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6731AC4CEC4;
	Thu,  5 Sep 2024 20:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725567660;
	bh=1lLjn97u5ozr3x2AENQrpqcvwTLIoF8oqz860FWuJxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJ34kv5ZuKyapFcPxiGffv4WgAsKL5TgEhN+kToqlcoE0f9hJfzF/8V1z3FNycmwT
	 vkIw+D9+Eo3yK828U5V64soeQk63yvcc6yNGXgD8X7iknlgm09SDB4GIVRE9HiwYq5
	 cCm0HKzHdfmcfQlJKUHjYixqyMz5BWJYH62TCEIUA7LWPeKxWGbNeGFPd+0rdV9hlj
	 3K29ikCWKLE912gE+KYsz2W7ZfKJAqOWex2HnW0xZWuWi98O0Vrseor4Gt4yJBH7MV
	 FrE/tEAJwwQz+251cZmKpvXUeQ7x2ZeTJuqFs13dSQAteX6F4V9mAhi61grX8miuE4
	 4m5chhZzuhlgw==
Date: Thu, 5 Sep 2024 22:20:55 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Peter Rosin <peda@axentia.se>
Cc: Farouk Bouabid <farouk.bouabid@cherry.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v7 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
Message-ID: <74anzbicky6zgccg7ao7l446fziwcmqcanycczl264neuts7ym@fyd4sdfyir6e>
References: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
 <20240902-dev-mule-i2c-mux-v7-2-bf7b8f5385ed@cherry.de>
 <fvk5u2j7wu7pjrlpbbnggp3vhopotctu2vr3fh77kl2icrvnyt@tukh2ytkiwdz>
 <45c51083-ee63-45e7-b8d4-3822213530f4@cherry.de>
 <4e4d7c65-3c3f-5208-ce08-b63ad39ab425@axentia.se>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e4d7c65-3c3f-5208-ce08-b63ad39ab425@axentia.se>

Hi,

On Wed, Sep 04, 2024 at 10:59:47AM GMT, Peter Rosin wrote:
> 2024-09-04 at 10:35, Farouk Bouabid wrote:
> > On 03.09.24 17:13, Andi Shyti wrote:
> > 
> > [...]
> > 
> >>> +        ret = i2c_mux_add_adapter(muxc, 0, reg);
> >>> +        if (ret)
> >>> +            return ret;
> >> do we need to delete the adapters we added in previous cycles?
> >>
> > 
> > We calldevm_action_or_reset() before the loop to add adapter-removal to the error path. I think that does the job
> > 
> > for us or am I missing something ?
> 
> I missed that too, but it LGTM. It's safe to call i2c_mux_del_adapters() as
> soon the mux core has been allocated, so there is no risk it is called too
> early or something.

Just a question, still: is it the same calling
i2c_mux_add_adapter() and calling mux_remove()?

Thanks,
Andi

> With that said, I agree with Andi on the naming and the
> nitpicks.
> 
> Cheers,
> Peter

