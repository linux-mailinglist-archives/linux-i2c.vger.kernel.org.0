Return-Path: <linux-i2c+bounces-4154-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C5D9116EC
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 01:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DD641C210ED
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 23:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7EBE149C65;
	Thu, 20 Jun 2024 23:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGHOo/vl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8867D143737;
	Thu, 20 Jun 2024 23:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718926718; cv=none; b=o6ObvY7tkH/DVccKl1Dgr9rH5VemQYFU6DXWC1JDQ7DddUWaiJjSsS4s78kgaMyE05PZrG+H2PznTRkj8yM6CY91vBQvpTQ1DDw2Ao/DbidYqo7TuDW3I/CMDv8CNYVJb1ydBuagf2qARGpcJoY2BBdThrLpZAnFcjrlVdKUavE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718926718; c=relaxed/simple;
	bh=1j+MPqd5427aFZk074Saqo2BYrlWM4GKrQyJbNXfGgM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mr74FksdMwwQjiRuS2GeBADdnZvtHYXkHWJ0wcDjsdDRClt0ES+7pDvo61jgwhCD3t8AeEUSIeW4x7R+Z+Ruhcg3bRM89YnTpQxPxGFty8qk3BgrP7vdfTJZBa9MuTdvvdD3/g5h+MJdPc9rfjjrv+xdExZ7zoypzejoR+eIEUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGHOo/vl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A4AC2BD10;
	Thu, 20 Jun 2024 23:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718926718;
	bh=1j+MPqd5427aFZk074Saqo2BYrlWM4GKrQyJbNXfGgM=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=IGHOo/vlrJ4JI/KXQz6bwzqzXCJtKUPn0+DdE2y84JNZppIV03GhBuJZTZvYp9q+r
	 JPYwnHDVLjwe72JkdBjw0l3TlMPECqfP/PntOk5Iw2BcM7tT4Egka0hZK1kbNbjZNi
	 svkWX9FliFsEyM4FEFRFaeQ52Ojzcyc5Z3ciOcXk5LJx18nD22hLpk2Di9NigqdSL6
	 HrYGPkxGMlpajEnFbQ1XGMY1xrYdBiibZM3WET7SkrBB43qwy/BmDEOKLcaxqXRFwO
	 7HBU0KoPo3QtUQGlLB0a/guZ7EmoIUWSYPhQ9P/TrTRqkM+3RB7DxXDhszrE9agb3V
	 e8dqtr4kApIWg==
Date: Fri, 21 Jun 2024 01:38:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] docs: i2c: summary: document 'local' and 'remote'
 targets
Message-ID: <cbwamjer2rupkmyze6atgpkrszajcbhw2udb23ldl73ne3m6qr@jjs7q3codtx5>
References: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
 <20240614081239.7128-13-wsa+renesas@sang-engineering.com>
 <4zxr4rlqnjqbqh3oxmd2ufqi6uk4pxa3tniuya5pgjtqi6tswc@utq4r2zt6z6b>
 <ed75fyc2xcsnwubq42eposf6ayt5aj2jmqz6mthugk6vm2zpi4@qqwlmuwayoo5>
 <y34k2k25xdr5z4v7oejp4da237s4o5qym5npihyydwlbsdh75c@vhmfl7sw3pbm>
 <7d5f800f-fc65-4fbf-adad-616d51501c62@linux.microsoft.com>
 <boehtgry7j7ulhrw7tenkmzxujahmxfn25imvb7zw2ibtmebbk@u3jryw4v2y7h>
 <cu2mkl42byhce6eytcnw7yseogbnypgtrkoirlezakwg35egdg@vjjye4ca7yey>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cu2mkl42byhce6eytcnw7yseogbnypgtrkoirlezakwg35egdg@vjjye4ca7yey>

Hi Wolfram,

On Wed, Jun 19, 2024 at 09:10:26AM GMT, Wolfram Sang wrote:
> > > "Synonyms" from patch 6 does say that controller/target is preferred but
> > > couched it in the caveat "If speaking about I2C in general" and
> > > adapter/client when "discuss[ing] implementation details." I was trying
> > > to give space for an unambiguous recommendation.
> > 
> > Exactly, this is what I referred to in my previous e-mails.
> > These two statements sound a bit ambiguous to me, as well.
> 
> Okay, here is my proposed update:
> 
> ===
> 
> diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
> index 90f46f1504fe..579a1c7df200 100644
> --- a/Documentation/i2c/summary.rst
> +++ b/Documentation/i2c/summary.rst
> @@ -67,9 +67,9 @@ Synonyms
>  
>  As mentioned above, the Linux I2C implementation historically uses the terms
>  "adapter" for controller and "client" for target. A number of data structures
> -have these synonyms in their name. So, to discuss implementation details, it
> -might be easier to use these terms. If speaking about I2C in general, the
> -official terminology is preferred.
> +have these synonyms in their name. So, when discussing implementation details,
> +you should be aware of these terms as well. The official wording is preferred,
> +though.

ACK!

> ===
> 
> I don't want to be stricter than "preferred". If someone still wants to
> use 'struct i2c_client *client' this is fine with me.

Sure, let's see how it goes.

> > Maybe we are wasting time at discussing minor details, but I
> > consider this part important in order to give way to the major
> > refactoring that Wolfram started at the beginning.
> 
> The refactoring only affects "master/slave" not "adapter/client". We are
> 
> aligned here, aren't we?

Yes, of course. And I'm not really asking for the totality of the
"client"'s to be replaced, rather than, when replacing slave, to
choose "target" over "client" whenever possible(*).

Thanks, Wolfram,

Andi

(*) E.g. if in a file "client" is used a lot, doesn't make sense
    to go against the trend and use "target".

