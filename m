Return-Path: <linux-i2c+bounces-1522-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 100C8841726
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 00:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C160C284EA7
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 23:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BBA52F93;
	Mon, 29 Jan 2024 23:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABZ8XKcx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB03E524CC
	for <linux-i2c@vger.kernel.org>; Mon, 29 Jan 2024 23:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706572218; cv=none; b=o8qyLRcYeDJngiBkydL8w+nOqCZjKag/BvYxen2lhJrEYb0ewKQk71q4HDNE8QgFsGy1H6AJ+NGGF7LwpJut1gJkyP0PjmR8vbRHJlCdS8PTBrixPZB8dTAffiK2Mq64YtBXfGRajWAyuzetea6xGeHUA1LcNjyDIqUewj+Hw2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706572218; c=relaxed/simple;
	bh=aTw1Ut+WxdB3cANAMaVApjJUu0ZxWAb5IaemieyzXNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2wmeGMqI3iabX9bIyCHlGLaLcs9Slkv0r1wa9RLLQXHPcDWYStOl8p5z9ylKtdfymhmPA+3VgxeR6DkSlGuwFcvr6qsrcCSSyH+yQR+uwRR0YmufbF4EnhCk6MCiufB4hFxkE0wVWutIT8Js2HJ+VihP1o1slDKmqeJ/IZcoKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABZ8XKcx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49C8C433F1;
	Mon, 29 Jan 2024 23:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706572217;
	bh=aTw1Ut+WxdB3cANAMaVApjJUu0ZxWAb5IaemieyzXNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABZ8XKcxVkb4pTCfvVmfSXE625VjnoczdGQ2lUh5vqeQsLT/9372JdOqf1YRSYOn8
	 IUJyiIk2LcbJjRXHsrfQ6sZcPrU2CmhQSwHnaJd4DeTKp/lH/aM+nyxKiloWg9jNh9
	 h+2pno1mqo3yK2JM/z2knVS65iPZzTvnkxRBPT6uD7a2iLwxVvPuWPGd7egAo5hbNb
	 rRcCB1xA+/KPV5bVdYaZuEn7QnGoh+grtqYM/9MZqOMKavV8so30RuS5l0TDOCKL4y
	 7+BrH/IlQbkh3S3w2MI2VyPHJQSlpKMX6uij0cydJ2WM3QR/NoeAIYPmrYsuSJ8zhT
	 yc5EsDD0jzq/Q==
Date: Tue, 30 Jan 2024 00:50:11 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 5/8] i2c: i801: Add helper i801_check_and_clear_pec_error
Message-ID: <g2rr5gkvlpijafhz2rvuhuytgxsktdmzb6z7thm5f7uhi73t2u@egnfrrfzi3gi>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
 <01fb032a-7b6f-4db3-a273-30a017d4e58c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01fb032a-7b6f-4db3-a273-30a017d4e58c@gmail.com>

Hi Heiner,

On Fri, Sep 22, 2023 at 09:37:35PM +0200, Heiner Kallweit wrote:
> Avoid code duplication and factor out checking and clearing PEC error
> bit to new helper i801_check_and_clear_pec_error().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

