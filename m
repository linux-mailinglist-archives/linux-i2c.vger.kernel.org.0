Return-Path: <linux-i2c+bounces-4618-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B690926B66
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 00:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BCB71C21186
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 22:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5857D15538C;
	Wed,  3 Jul 2024 22:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PaDYTXZH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F4B142651;
	Wed,  3 Jul 2024 22:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720045178; cv=none; b=AfMSRlBSkpunLdQcU+vzsjpDOH5AGXnOvu8hgDQ3Sj9htJ7UpH8dUgQEAVt/WlI3eZf0TxtHMYa/txCSlzNdEQJ0xWqPjkebYFR5BtFZL+e059411C/qekW/Gpe8D+VatwCY85I+NwN/GKbiK3Y3tqwI5tzabdeieBs1/nptQUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720045178; c=relaxed/simple;
	bh=26V2kaf3zdDuE6VsMb273D5MiwDCQFhfoifkCXSX13E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VcgdDhajFVVBfwnt5FbXGVOhAuzuAL34W6uwsnfCp2uXNxrmbMWbDZULUmh+GVLi/XiEZpWdiwY470fBYEdIyfFt/I2JSq9lqDYCpp2d25UF5fS4wZriKMpBcnN8pwHPMbNghFtkEIH91CM+i7X99WXhUr3So+g9da490REgPXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PaDYTXZH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CABCC2BD10;
	Wed,  3 Jul 2024 22:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720045177;
	bh=26V2kaf3zdDuE6VsMb273D5MiwDCQFhfoifkCXSX13E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PaDYTXZHom8uzqm+9jcYJXjl8Vy2dt5AthIwfgdlpTsZKygUCM86AWIuG9jCoUQXW
	 hjz1wk5nRF0KeTymDl3EC0tUWkpozu5YnaaLKuRzrQssfkwx+eFdqjhsvJCIulkQYy
	 vjT5IZGfYqZ6NWivIl0leM4C2cwA6lPN+sEMR24dEYsY0OxuDKoE/ci7plzZTo1Yk6
	 cDk7TlRw5bkjW8EoR6N4t6FFBoYZlRcIvKP6OM+fn90AgJ6/EtHYjWxqty0APLj+tq
	 TyqipUNqPyOLwQx8mElBrxeUhs2gbTcYoWcrVCzE8Cbz2DbABe/6Qmm5AjMVi4eg3K
	 kSzz8CmIjFGBw==
Date: Thu, 4 Jul 2024 00:19:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v6] i2c: pnx: Fix potential deadlock warning from
 del_timer_sync() call in isr
Message-ID: <otsopuw5pqpe637mywdoecnv5xhfhcny5xsxnwoyxhy7gj5yy6@3s43zn2udeei>
References: <20240628152543.281105-1-piotr.wojtaszczyk@timesys.com>
 <dudh4jdce3yxwv5yw345gw23diwparhwvsl4jrpsyzpv3sgge3@ojtdgsdgwcor>
 <CAG+cZ06sqDuOer=fBcGhQkTUgWt9XqaLkAW0cmT8g=EJ+e8pWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG+cZ06sqDuOer=fBcGhQkTUgWt9XqaLkAW0cmT8g=EJ+e8pWA@mail.gmail.com>

Hi Piotr,

On Tue, Jul 02, 2024 at 11:13:06AM GMT, Piotr Wojtaszczyk wrote:
> On Tue, Jul 2, 2024 at 1:01 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> > > @@ -653,7 +624,10 @@ static int i2c_pnx_probe(struct platform_device *pdev)
> > >       alg_data->adapter.algo_data = alg_data;
> > >       alg_data->adapter.nr = pdev->id;
> > >
> > > -     alg_data->timeout = I2C_PNX_TIMEOUT_DEFAULT;
> > > +     alg_data->timeout = msecs_to_jiffies(I2C_PNX_TIMEOUT_DEFAULT);
> > > +     if (alg_data->timeout <= 1)
> > > +             alg_data->timeout = 2;
> >
> > I don't see the need for this check. The default timeout is
> > defined as 10.
> >
> > Thanks,
> > Andi
> 
> That's the timeout value which was in the previous timer in i2c_pnx_arm_timer(),
> without this I had time out events.

I meant the if() statement. We are sure timeout is not <= 1 at
this point.

Anyway, it doesn't matter. I applied the patch in
i2c/i2c-host-next.

Thanks,
Andi

