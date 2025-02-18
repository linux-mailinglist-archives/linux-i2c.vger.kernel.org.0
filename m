Return-Path: <linux-i2c+bounces-9485-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAECA3AB6E
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 23:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E97261897543
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 22:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5FF1D4335;
	Tue, 18 Feb 2025 22:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtfJ1ueP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888532862BD;
	Tue, 18 Feb 2025 22:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739916261; cv=none; b=Lw9EDyU4qS5UP3ROjJILiMc6X2HFVzVPU7tN5veXteJVcfg3qRAUh1QmW7usrFCIc2VckA9+dCBVBNsHFJD4dZShLoPLkoqiQpChh8WP4UEnvVEhTFZBrSe8ine6GV68c8vRzyFp8nRYbAvBcw5UHhkJuyuxXaC++QFlbRvypEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739916261; c=relaxed/simple;
	bh=LD6SxQCnKtB6lwk73QejrBOxC46rzzcZEsKpLvOtsWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gr3cxgrAL8aUV/Gjb+lbLSmvJ0XLINifFaf+tWlc2/d7DPmbBIqoyn1qFlmezl+ZMPQqMHNQmiLNwCW7qfXGmae2uz3J/njKw2QUnaMUvqDOlPEhm8X+OuN9JlgW/3mOtz0x2vQiiTduMJPd3wgpaIhvXKHRtSDwloaW35snHPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtfJ1ueP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C5EC4CEE2;
	Tue, 18 Feb 2025 22:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739916260;
	bh=LD6SxQCnKtB6lwk73QejrBOxC46rzzcZEsKpLvOtsWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dtfJ1uePODEKTQZQkKfszt8Ce3QsW3LXO8V1blyTOFzlmGLqv6xfX0Wp9UeVSvSDv
	 vbLq/7QXyOZ1VO9sfkkNKSIitqfpxmU3VXc1jc17uFTNkIdaqb7lmHx8pj1kfkGVoX
	 KEebgywoL+8t1xpASTdAt5Rukieqjr0setef71MZ75LNWtVl3bEfmr053aDdKL4G7c
	 yE26+CTXePKnZkZSEvBhqNZoNgSm9pn7ETuX6k/7PV8KTowDukZPkmvKL7OxgfxO0g
	 uQNdOOBd90zA00l5nmSXxA9fV41CGfLnB7KDdLtAPSe5Wdxg4Iod4p/nNykk6VgsFZ
	 cePkqLPpIV05Q==
Date: Tue, 18 Feb 2025 23:04:13 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/2] i2c: octeon: Add block-mode r/w
Message-ID: <3ju5cg36taf4och4l5fyycumiem5ubgq2sn6zro5qlvpjtqpfu@3ywcmglr4fot>
References: <20250120023327.2347863-1-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120023327.2347863-1-aryan.srivastava@alliedtelesis.co.nz>

Hi Aryan,

> Aryan Srivastava (2):
>   i2c: octeon: refactor common i2c operations
>   i2c: octeon: Add block-mode i2c operations

I'm going to keep the first patch and remove the second patch.
Please follow Andy's suggestions and resend the second patch,
please.

Andi

