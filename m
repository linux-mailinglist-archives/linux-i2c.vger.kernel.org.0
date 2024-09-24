Return-Path: <linux-i2c+bounces-6958-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CFD984853
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 17:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 103532824A0
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 15:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23DA1AAE2E;
	Tue, 24 Sep 2024 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PuwGbbLi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919E01A4F30
	for <linux-i2c@vger.kernel.org>; Tue, 24 Sep 2024 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727190792; cv=none; b=d9OTl17aSN/8pGsCgAmIZREWN/BNDqplYe2Y7AI6uymcdMa8L41yF1rTMGvACG2Rn2OBxSjfYyjzD7uzd7K3p/1Irc2DGf566ZjGp9nS0Qc1EW5dOBTzSHESC1UAA+uGffIR2SU6rtAnLvt8LodwrTsVEjXEtTgu3GEsNkANcwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727190792; c=relaxed/simple;
	bh=mGnkOx+paSAIJLNptzFHGnZxCGfV+pTXjUCHDHQRPKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpbhEylBW0OYZlJKtNZJ8p1c25DZZaC6xZf2YetpQmddZDh5X7YC/RJDIMAAe/dX+v1VhlZrnF3FIUxWybOyaBW0lvbjLtqm3bbsGNTV/hdb1BvT+2ANuk0/PgoVCrBP5Ut+DMqeN1ti2uI2Ay4CCizzsDntnGOyN8liZOdeWa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PuwGbbLi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADACC4CEC4;
	Tue, 24 Sep 2024 15:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727190792;
	bh=mGnkOx+paSAIJLNptzFHGnZxCGfV+pTXjUCHDHQRPKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PuwGbbLik8+kdNq6jhJ1mqJW9BprsOcG15t/jLJwZwitE8lwEjqlbNHM1MfyLnOu4
	 bP+52N6FOjSf/rqBAzgiLnJCfexfq8NID9M0FKKen/hgwE6WQa5E1TuROOa+7n29/p
	 32OumIxqzSjPZvVB73ab7/gd5+5sXQWOOs2X2FN8RvUT5jBoIcBGDWcBlP2vVg4Bb5
	 46D5NvAyjfE4uF5yN2FF6EsK7chwKrSBza/H2r22FokQ8iakg3MC2QRaN6xzFHSDXo
	 QBHXL0EAxQoUcoiBaPVSlQq1VPO9IaXyv9z7g/akDKUImgwv9vF39A6QG7QE9FRIKk
	 y1NgPAmBe06uA==
Date: Tue, 24 Sep 2024 17:13:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] i2c: i801: Add support for Intel Panther Lake
Message-ID: <knkq7tay54nsjd2kt6qnulbebliizhhbw64rjpwh4d7zp6dh55@7lmzx37mqddj>
References: <20240923132719.252770-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923132719.252770-1-jarkko.nikula@linux.intel.com>

Hi Jarkko,

On Mon, Sep 23, 2024 at 04:27:19PM GMT, Jarkko Nikula wrote:
> Add SMBus PCI IDs on Intel Panther Lake-P and -U.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

merged to i2c/i2c-host.

Thanks,
Andi

