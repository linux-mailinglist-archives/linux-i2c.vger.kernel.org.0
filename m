Return-Path: <linux-i2c+bounces-2587-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 063F488BB31
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 08:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 412F11C2D567
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 07:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FF6130A6E;
	Tue, 26 Mar 2024 07:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3cfziaD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DFD130492;
	Tue, 26 Mar 2024 07:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711438071; cv=none; b=hvw1MjGUPLy7kjWuSxvw2cPbe81lhyLohz600VPc7SRXgJUHYqkr7dtBxy5kpjNijQdR5M8fcrroKLS2UknDQ/w/h3wb9Ex0VLAervh8NXpRyexkgbF9Mkz4bHhzHmYPVV8mBTg+3exo4pUqolRVVezxSel6BYp5uWS6ItqrNK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711438071; c=relaxed/simple;
	bh=41JSoSJIvuVY/1VWkOGpXad3+iqXOKbYrSPEStUWkQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNvxLRo9CGqKUqV3noTWP4OWemVAuzhTPIfNWUzDRjZ/fSzLCGFcLmj+/kxeki2h1m5vPomUQS4KvDnCrmhNNVmQC4CP3fRRE9ESqEEn/pQ6W3RWo5KMnaSeLfKbY2MwBXFHMMPk5IxLM+JpzS/rwM02+G2fu3hiBb+ERdz37/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3cfziaD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA1BC433F1;
	Tue, 26 Mar 2024 07:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711438071;
	bh=41JSoSJIvuVY/1VWkOGpXad3+iqXOKbYrSPEStUWkQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3cfziaD6IMhApNF/regMD23IPYzTtAbWyo2VnZcEoD4acZ5jwWxy6iledJBOg7ey
	 WShlFJCifrhkVEVD7MvZ3jq7TMEyMhJX0DmFnkpr+Z6v8LIlsxJ/k84nq8T6iLm3tf
	 7eq8ylagO74a26nccuzStU8eyTGrjt6AD/NUfE2MY0Dj1UwjNsyyfke8DUMdoaSWVy
	 36nP7JXbZz3vBhPgozHlEByXzGGtkbKx/VYfqMEWRBrbbto8XG7JbpkiEMVqLyoRvg
	 fMT60myCnzUtZaUKX0JhGruPqk7rf/z7JM4U11AJfH+WXdsq6NSdrlfPL3ezpfb3M7
	 cG6XioEDz/GSQ==
Date: Tue, 26 Mar 2024 08:27:47 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/64] i2c: au1550: reword according to newest
 specification
Message-ID: <r32ljnxrlpfl4ksqprkteu5jg3zlbfm3qxkxgao7ziajnhqwvr@tqfvqv2ljw3x>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-7-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:24:59PM +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").

...

> -static int wait_master_done(struct i2c_au1550_data *adap)
> +static int wait_host_done(struct i2c_au1550_data *adap)
>  {
>  	int i;
>  
> -	/* Wait for Master Done. */
> +	/* Wait for Host Done. */

here, rather than Master/Controller, the change is Master/Host,
which is different from what is stated in the commit log.

...

> @@ -246,7 +246,7 @@ static u32 au1550_func(struct i2c_adapter *adap)
>  }
>  
>  static const struct i2c_algorithm au1550_algo = {
> -	.master_xfer	= au1550_xfer,
> +	.xfer	= au1550_xfer,
>  	.functionality	= au1550_func,

Here there was some alignment which now is gone.

Andi

