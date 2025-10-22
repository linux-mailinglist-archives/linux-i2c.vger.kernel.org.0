Return-Path: <linux-i2c+bounces-13719-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7B7BFADCA
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 10:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CB7E3B2BA8
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 08:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17A4307ADA;
	Wed, 22 Oct 2025 08:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nopu+9ir"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715AB279355
	for <linux-i2c@vger.kernel.org>; Wed, 22 Oct 2025 08:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761121296; cv=none; b=lVYGlHVag9MlH0c7YxV7ycUZnHSOGnIHEBQPzApxitaAhEm0UYL37ONGECkmeqDTx2/89bSuJCzl7iKGhZaJJ3nlkYXzE+ELLi0gdOa04fv8Q2teeAbe3hs36euHKAR+bY/zQRmvnqQh0vy0/srWEIub84RgkBrF2oHy78RH8jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761121296; c=relaxed/simple;
	bh=m2lUcWqv6KIo+xhvR8F9sG2dhPnplUyY7deczIctEfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQsbhdY5PaZbzI9lbb8ljzKi4dtCBLo25k2iEML4ZWkFkfi8a7LJv3WpAwbL3nnlgZe2NDuV/lkK4e3HmIoeBjEL/B9FKGfca4KlPjmDBh9VZoa3mSZHMeW6k0716udWeFL75ySJOXaaYaF+lMsy847j+FQi3J9TgZ2EAqTbPbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nopu+9ir; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70312C4CEE7;
	Wed, 22 Oct 2025 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761121296;
	bh=m2lUcWqv6KIo+xhvR8F9sG2dhPnplUyY7deczIctEfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nopu+9irawx0ogA+ekISasTcP6q1o23yfWZRHR0BNrG+MTeFVg/wU/L6Bp9GLNeT9
	 Xbgh9Upqvq+cJk1nqb7pJabjdufRMgjIa2jiSro9V/IUTLWYS7k+Bfv8a0N5Z23Wnu
	 S47yrTIzPxGSxQ7oF2iC9hUtk7cptz5grpXTv2WiUKVSj/rvlF4bUSX7Tmbx2N8dvK
	 8itvWMGKjdKp+5MS0C+YPueWjIKZM6OpEzSTlwn+Ft/JGFQ8tfzl60TXgIJc4H7Gu0
	 iblhHbbmfysGhzQPY3xHSoucHi6kFnfvhuyi5dpacTBbpF4tw2t6DpUgCaeV0/7SYO
	 uAIeDn1KA4aig==
Date: Wed, 22 Oct 2025 10:21:31 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, Zeng Guang <guang.zeng@intel.com>
Subject: Re: [PATCH] i2c: i801: Add support for Intel Diamond Rapids
Message-ID: <swrbpjsj4wcy2jfo4oeguh24g3pfho2vabjwo4wbagikaoh7jf@672kseovw5lh>
References: <20251021073522.3458383-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021073522.3458383-1-heikki.krogerus@linux.intel.com>

Hi Mika, Zeng,

On Tue, Oct 21, 2025 at 09:35:22AM +0200, Heikki Krogerus wrote:
> Add SMBus PCI ID on Intel Diamond Rapids.
> 
> Signed-off-by: Zeng Guang <guang.zeng@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

merged to i2c/i2c-host.

Thanks,
Andi

