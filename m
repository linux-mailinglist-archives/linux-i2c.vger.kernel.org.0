Return-Path: <linux-i2c+bounces-4829-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDF692CC8B
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 10:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C7C31F22D2D
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071AA84A4C;
	Wed, 10 Jul 2024 08:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERwnIRnO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B997B82C60;
	Wed, 10 Jul 2024 08:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720599046; cv=none; b=Kem5fOLuj6na+uQhZ7GvxMq15Jb9N6ybvFxNNiVTBq/ehH69QO3w9OFHxuoNPwvHvtBfZloeUJ2xFoLDcqWo0vTz2S6G9LrF1XizmI597QEnr/YwHdTKC0h8Ec8cM2t+7wUt85Bo0iVTdGlEhGeBmrMfV6qsZqqq57P0PA7i0mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720599046; c=relaxed/simple;
	bh=Db/ttL/C8VuK1QncpZy2LmTAy74LzE/dEO+02fF4FWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QzoBD9Gp3KyQGM2Z6fzrP1Am91g1FBpG/1ZfXK7DuOSkRbKkIBlPZhfj7Z5i2+Uz2QIFiKRmx2uhR1OhnagUN/sYDvwnS95TuRglqOwgpHl4X90xX4jqCiP9IjmTnW0rNShz7WBFhGZAJUaj4lxJLpB8E1vZeYqfH9NOpLIaB0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERwnIRnO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E99C32781;
	Wed, 10 Jul 2024 08:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720599046;
	bh=Db/ttL/C8VuK1QncpZy2LmTAy74LzE/dEO+02fF4FWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ERwnIRnO2cMJgE9ZX3haUOhi7PQmyTAAcegzggszAJuU9106UD4uNeW1KbvWPRjfV
	 MIQevpiJdnOl5hlFj0mSFZWxzEf/9In+HKrkdPyvl/Gz/OAeM5GCNQdPP4K5CTMpKH
	 QtZPgWxRED3F+aIKJoKEnW6YQB2ij2ZPrCMhgCeAi+/un+UH5Z50Pv1JQl0K12OA3u
	 goTgfVsbqL84sbEe0rPLCf14lDCxcYkseH2KS8Q6eAxlsGuorpfeeOd48oKrPxkg5F
	 5BkRmIKMBFL1rhCaULAZWH7H6UBMlUa5mraVBMBmOm6E/IIBtUAuT0lwZVlMapzpjQ
	 Jtxff5zMK503A==
Date: Wed, 10 Jul 2024 10:10:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 20/60] i2c: i801: reword according to newest
 specification
Message-ID: <plo5ygpwq653tzoqdrfefrnknxmjmo5ufihfibcquofim7mvmq@vfdbtypxsr45>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-21-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-21-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:20PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

