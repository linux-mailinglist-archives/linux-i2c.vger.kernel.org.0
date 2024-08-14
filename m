Return-Path: <linux-i2c+bounces-5376-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33560951992
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 13:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8F4CB2247E
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 11:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8B71AE04A;
	Wed, 14 Aug 2024 11:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tn1IgJRL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF99139CFC;
	Wed, 14 Aug 2024 11:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723633382; cv=none; b=uBJfi6CI0OkdgYVdId2x+73ddaY67ne6G/f03ihNnvQ8DUyeWOWIy4c+LUT3ybzhZB3swSWqncR7NQDew6nlE7BayVuAEKbX6AF9wAlb9TL/0yB9P71Kz8c3rIXx7KjpHH15qiwtxMhMn+1y+ghFWy1W7AlOYmzHAwh0TImOKWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723633382; c=relaxed/simple;
	bh=oWQoNTYX1L3UXIBThlrCa/Sc2MFUL69rs39cdrn+zzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hn/QyL5LWiPEQ6PjfQ99om4dH4mc8pCS860+JPSq1AC5oEe3qfuL9XP40FeKlC448MvPjopUXZn/PbrK9pqD5Fu0eWUrmcvpEQaUrV7qau3HcXnPRCgu7L+zDDko3xjc4z5byFf+eZurtXGD2SjKbTDBC0wMb7kbILebZ2nSLtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tn1IgJRL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F246C32786;
	Wed, 14 Aug 2024 11:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723633381;
	bh=oWQoNTYX1L3UXIBThlrCa/Sc2MFUL69rs39cdrn+zzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tn1IgJRLa/hnT2FjjU9VFsLrvctY/ZHWzT/nUyYYWnoeJACAU/Z6lRJkKvzsMSbFk
	 t/+pm/DDzKGujw3y+r+WbPgdcH8bBJhg2ygJkdrhtRI6H78ad2E7uFo9oGYT3LlzwE
	 9VoJ8vNl2te7a4a3PyfeaHI08Z9vcXRLERar7QnBKmWQYFt8tDtr1vjO9NOxV22/73
	 qKJNpwjH46tE9VsZWH1IrWO8tZDAYLN6hW5qdqvwf2dJ/s5o2eUI5nmhVzniJ9q4Ed
	 YQbuUn1IldDfuURgxeICmH4BSIEQrmMUuUGyqoUn5hiEvkF/FxVWx4I5Br1jBGg4SJ
	 nMqjvTX4PCY2w==
Date: Wed, 14 Aug 2024 12:02:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, leit@meta.com, Michael van der Westhuizen <rmikey@meta.com>, 
	Andy Shevchenko <andy@kernel.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Do not mark ACPI devices as irq safe
Message-ID: <7cudtahr26xrfn5uccmvtiv3ngyccu3wcrky4evxdstubz34hf@wtxzjv4z4g4w>
References: <20240813161254.3509409-1-leitao@debian.org>
 <ry4kzh4vr573ymutpjz5sgzmhosn3ekm3jatjy4yfyfm32eqit@cmp376je7viy>
 <ZrxvOr6O8weK5cB6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrxvOr6O8weK5cB6@gmail.com>

Hi Breno,

On Wed, Aug 14, 2024 at 01:47:54AM GMT, Breno Leitao wrote:
> On Tue, Aug 13, 2024 at 11:53:17PM +0100, Andi Shyti wrote:
> > You don't need to resend the patch. Because the changes are only
> > in the commit log, I can take care of them.
> 
> In fact, the changes are in the code itself, see the changelog:
> 
>   * Replaced ACPI_HANDLE() by has_acpi_companion() (Andy Shevchenko)
>   * Expanded the comment before the change (Andy Shevchenko)

I meant no need to send a v3.

> > Besides, you also need:
> > 
> > Fixes: ede2299f7101 ("i2c: tegra: Support atomic transfers")
> > Cc: <stable@vger.kernel.org> # v5.6+
> > 
> > Can you please check whether this is right?
> 
> I would say that we probably want to blame the support for ACPI device,
> which came later than ede2299f7101 ("i2c: tegra: Support atomic
> transfers").
> 
> I'd suggest the following:
> 
>  Fixes: bd2fdedbf2ba ("i2c: tegra: Add the ACPI support")
>  CC: <stable@vger.kernel.org> # v5.17+

Makes sense.

> I am not planning to submit a new patch with these changes, please let
> me know if you need action on my side.

Not for now, you might need to still support the backports to
stable as there might be some differences and I can already see
that it doesn't apply that far back (from 6.1, basically).

Andi

> Thanks for handling this fix,
> --breno

