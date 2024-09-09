Return-Path: <linux-i2c+bounces-6436-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB83972220
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 20:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E232BB23470
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 18:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC231898F1;
	Mon,  9 Sep 2024 18:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n56NqTLN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F94114B06C;
	Mon,  9 Sep 2024 18:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725908090; cv=none; b=Fub7x8vs6Xp+sqAXc1vruomkwkY80ONHPRSnPRmSo8zfzFe4f6T2CyRmGf9tDTY2Js26o/Cgt/iwEC4iL/Jxlkpii/DxUTRgz8Sk/WdF4o1hfAmB8SDG+zEDlMkuqCN37gik5CCRigc5oxkjzyoG1+HnGVrgXx8J4aG1IVlx3FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725908090; c=relaxed/simple;
	bh=1SjYNS+Gnxohf1/QLOdFsJAnTKBfVS66HOjnBtSpeaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmTYmLGVbSxP7ynhJ+0n0KOXp0QtCcpI7YT347D46AtRp9AdLFcz67ITGa5IQPbLyHVHj14CzcqEmgT9r/kFxtDgwxXOU6/ME1J0mz3/goHNVL631O3Z2FZoVCk+IUd831u/+Il/CoSJgeraApQvaQ1tDZwNS7wT2AuGGuDJEMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n56NqTLN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7A3C4CEC5;
	Mon,  9 Sep 2024 18:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725908089;
	bh=1SjYNS+Gnxohf1/QLOdFsJAnTKBfVS66HOjnBtSpeaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n56NqTLNOlk8S5um8v/ocDpKErEGp+Wm6uFh/NM0eACc1z6xp0rQ4BGV01uHUOLmC
	 pp5CA6/Det9PK0Avz7a9DHI5NZBUUbfllY4kEsAq1nZ1INB94telg446y0SfQGMS6H
	 HyYxOj1E0sgXjfcr3wF5bLuKQ6KylEnnyTFnhDOTeLxkDKPAk8iS4aSQh4Zaf8/COu
	 ydrWKYlMxk4mqpdG7yLafXgxi5UlsyWjoAnQz9oKm7D2O7Xw40YLXYP52B7Dhq1olG
	 gVhB+RbYplJvttIBdl9Nj/ZLLTt0O34353GD4yZaA5xGTaaBuKXYcL3tFwykkQTUa3
	 HgqjP5kkhMDgA==
Date: Mon, 9 Sep 2024 20:54:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, 
	"Chen, Jian Jun" <jian.jun.chen@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-i2c@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH] i2c: virtio: Constify struct i2c_algorithm and struct
 virtio_device_id
Message-ID: <cnetcfge6r7votsarnvk3dlqec4ufz3uyfkkf4wuhkxhlhw5wu@ckkns42r5psi>
References: <b98c3fa7072bf519ce8a9bc771e9d18c091b3509.1725778305.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b98c3fa7072bf519ce8a9bc771e9d18c091b3509.1725778305.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

On Sun, Sep 08, 2024 at 08:52:07AM GMT, Christophe JAILLET wrote:
> 'struct i2c_algorithm' and 'struct virtio_device_id' are not modified in
> this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security, especially when the structure holds some
> function pointers, which is the case for struct i2c_algorithm.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    6663	    568	     16	   7247	   1c4f	drivers/i2c/busses/i2c-virtio.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>    6735	    472	     16	   7223	   1c37	drivers/i2c/busses/i2c-virtio.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> --
> Compile tested only

Makes sense to me... if this works, you could pioneer a sequence
of simiar changes :-)

Merged to i2c/i2c-host.

Thanks,
Andi

