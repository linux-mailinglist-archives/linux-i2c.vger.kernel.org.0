Return-Path: <linux-i2c+bounces-6284-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C863296E526
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 23:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7096F1F2402A
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 21:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772CD1A0AF3;
	Thu,  5 Sep 2024 21:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hp9EPcOH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312AF823DE;
	Thu,  5 Sep 2024 21:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725572209; cv=none; b=Fi832h/eaJK3tVh5U4NacZTgzq1AwnIVFjrdiCA/2aJq7dnP86C5FmhehpBsbMkBzLvWL+2pfad3trqfeEDuDRkBR+m62H2n6/s49uZW2ioQDu0I8cQgG69xd0HB3+ce9iGzj5G9WeUox03ZDkScnwrzdj+LAAXTN+1mAkkcWJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725572209; c=relaxed/simple;
	bh=N3afdJvaOgoTj0oQs7CNW/770sY6SRZRML2iJbqLz7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXiLcfVCZFvsj7dIaClmhPYGiDfjwWx8Tqp8F+VI7cYALpyB5ynbWXL82I0oMZmDgS0BgCpqk+dHDnxMJOYlC/gbIYQsUn988Z+s1/Ra/yPj392Jy2T35PFnfED/EKImAxE56qLca5cojul1AdAKGqQOziZMSMwLLnCMvxnxShw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hp9EPcOH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A0AC4CEC3;
	Thu,  5 Sep 2024 21:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725572209;
	bh=N3afdJvaOgoTj0oQs7CNW/770sY6SRZRML2iJbqLz7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hp9EPcOHtnHzz2Ph496oqK25N5wY64kY4qPf4L+C+TEkND1eUKF+54x53kLwVbcf1
	 40Rl4OotFCX2F2Mme3xibcyPk0pe+0YEXKaSMiGrPMMzBm4tP9mnkbWVI2vraXBNe+
	 PYCwKk7mmQ3u9UOq6f2ekGoAUKjX+oRicLR+Ejw8UnbOrWO+SGAoSqhnDrdVUiMhKO
	 fySv0udKIwE7TedGYdLNHkSk4uW1jEkvuv+eKdTqpOln9lv1lpA93uWV0siijoHZUM
	 tlU0VODNUj6cNhhiXXvZ5QaScpaei1AP58Qjz0S71n4FoUwgSqy2qN2WmPOO1t1Le8
	 pr4eoLVSqOJHQ==
Date: Thu, 5 Sep 2024 23:36:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
Message-ID: <xdaufg4bju3iq5fqeo2gdej3yaxyufhuaiuyixnla234l2ej3r@fmvann767tib>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-2-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034640.7049-2-kfting@nuvoton.com>

Hi Tyrone,

On Fri, Aug 30, 2024 at 11:46:34AM GMT, Tyrone Ting wrote:
> The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <= 9".
> The original design supports 10 slave addresses although only 2
> addresses are required for current implementation.
> 
> Restore the npcm_i2caddr array length to fix the smatch warning.
> 
> Fixes: 47d506d1a28f ("i2c: npcm: Remove own slave addresses 2:10")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

your email used in From: is different that your e-mail used the
SoB. Is this done in purpose? If so I will keep it as it is, no
problem for me, otherwise I can fix it while applying it.

Andi

