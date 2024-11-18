Return-Path: <linux-i2c+bounces-8027-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E764E9D1506
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 17:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C3D6B28FBB
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 15:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9971A0718;
	Mon, 18 Nov 2024 15:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/vV0VCi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB3B196C7C;
	Mon, 18 Nov 2024 15:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731945291; cv=none; b=uzXJExG4uBdot4rVpXZ1P+OYHcg5v2JET3EsXlB7EP35FgVD3TTZjyx/QLJ+8Fpmt+Grw1qpHA8vLWmO7buTjD1AOYGW60qr1AlN/4lNKMGcHH1SqP8H8E8x7bE9NpmI2K0t83cgjCt60x3TokHoN0TO2MiNl5npeasnkmrnHTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731945291; c=relaxed/simple;
	bh=wcvTHGcPTAIJF7sMBaPnGvXJLUSgA42X8sPHrrfkF0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGvWtSNxRzgzJFlX3yRarLKZG1lepEPQ7qZD2BQOWQh6+Br3zSbJOS0U7CCqwEurCCRbs0UJFiyDBiuzn9oYLvYG4pWtvVhj4R5kpeJ8Lwz/NhSMomX9I1GIOeYwlkE/khIV5Z64s6Mx1CuqTmG8WACFDOKFoayP2hwnS80yOYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/vV0VCi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E577C4CECC;
	Mon, 18 Nov 2024 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731945290;
	bh=wcvTHGcPTAIJF7sMBaPnGvXJLUSgA42X8sPHrrfkF0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/vV0VCiJDf1IsmXOp69HisyGnhpBNe+I78UK5+VzH0PatQNylohHaDGFj0H8ewTH
	 sm7W6Fo4H9QugWSiva3hjmozA6VKB1j1aFTD2TloPJZ+GrJDyKfW0HFOz5PuuLZs6d
	 xtRnn9yJTyhrgdzw8NuXLFhZO50PLaWwSwaYws3BK6PVlkL+D/5FFBddYcGxFtMCUj
	 8xg0HcH4vfDjM4RRyrtQZGbTgXb8oJ7ZP4gG3/1mt9u5waEgnQcdheyvYtaylnQAhy
	 AiKvf3tv4n2IuZ5aSn4x781FAy76JAsZc2igFTSZKDeiWaXDrBraYtBku5BQUyQ4Fx
	 HPW3wCxGjSYsw==
Date: Mon, 18 Nov 2024 16:54:46 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: "hunter.yu" <hunter.yu@hj-micro.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com, 
	lenb@kernel.org, rafael@kernel.org, jsd@semihalf.com, linux-acpi@vger.kernel.org, 
	linux-i2c@vger.kernel.org, andy.xu@hj-micro.com, peter.du@hj-micro.com
Subject: Re: [PATCH v2 0/2] i2c: Add ACPI support for HJMC01
Message-ID: <yha25jhjmd5qh4prwnyhqr2sfxvw7v2hzwhhv66twtx7ft4siz@fk3d4t2d73dj>
References: <20240926024026.2539-1-hunter.yu@hj-micro.com>
 <z36ad43lbhitrb6z263d43fie3ykfjjw4wr76xd73quianocsn@5lccbdjen4bc>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <z36ad43lbhitrb6z263d43fie3ykfjjw4wr76xd73quianocsn@5lccbdjen4bc>

Hi,

On Thu, Oct 03, 2024 at 02:56:51PM +0200, Andi Shyti wrote:
> > hunter.yu (2):
> >   ACPI: APD: Add clock frequency for HJMC01 I2C controller
> >   i2c: designware: Add a new ACPI HID for HJMC01 I2C controller
> 
> Applied to i2c/i2c-host and I took the freedom to change
> "hunter.yu" with "Hunter Yu".

I'm sorry, I mistakenly included this patch in my branch and
removed it from the pull request.

Apologies, Rafael, for stepping on your toes. Passing the ball
to you now.

Andi

