Return-Path: <linux-i2c+bounces-7169-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CB798CFE7
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 11:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B06B01C212C5
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 09:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E1A1974F4;
	Wed,  2 Oct 2024 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcGnq+um"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C84D23AD;
	Wed,  2 Oct 2024 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727860717; cv=none; b=MUdnOgWwuPvqMBYjZ6UmNDw0R9SapyI6yWpM1ny7w9LkiMrA8z4SZLp2bmfAFiGS8Xp9KcF+5LJFukWUONnfbNkwWkNyUiid9u7+U23z424WLwpT7Elsl3OS0VF8gOnbu48eC6w1CiLll+7zG1+wy61XfjfpwhfT10yqr0zO3K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727860717; c=relaxed/simple;
	bh=Dqs/QyT+sgIp2EbPTkuUot4q5ba+AJXow/jOio6bNNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t80ggVjNk/YUM/19CZmuyqYO41W0wjhu8LqO4GaIADLLHC8uzP9xVgzL7Nvwl5Ji8pYXAFOMbsLrVcq954nQXs/2s0CvrpSCIPrYRdK8e+4Bs7hDvjF6Iwzn+korCuAa/FVOa3e5j/+4fcVnEMurmGA9SZdyHW5UypAd6N8wHBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcGnq+um; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76925C4CEC5;
	Wed,  2 Oct 2024 09:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727860717;
	bh=Dqs/QyT+sgIp2EbPTkuUot4q5ba+AJXow/jOio6bNNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NcGnq+umABB2e6KSjSoxvWlgxIhpSsAghrhZlNVqt9DrQfCds7+j0kLdo2CLUcfUM
	 Yk7mUHjfcG2VKEE087ZhOUJBDKNk6RPZzhUnx2Goe0AqhyL6rGnd98/cFZTVWs+LVL
	 sxXIB/CP0vN9BYMXJBcGjKU0LaZfWAT/mmLWfBSM+LKn1XfUok/RunYMI71JDKMfNP
	 4hR96rKdcy2Jn//hyEpNbduXH+Q+UIYS474nDkK9xjoqeq8m4x1gsVr4H8Q23iC82E
	 +scsxHbGGVnvNUkQlSq8eEaminQBlZdILFLBz4gO8jsy120dQ7cWKOgz6HP5QRytX3
	 rapyyowIqreag==
Date: Wed, 2 Oct 2024 11:18:34 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, jsd@semihalf.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] i2c: designware: constify abort_sources
Message-ID: <lny2lybbplbu6mugnldj7do2q3yazvr6l2tm4zxmck6vd2sofg@q536n225ap22>
References: <20240122033108.31053-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122033108.31053-1-raag.jadav@intel.com>

Hi Raag,

On Mon, Jan 22, 2024 at 09:01:07AM GMT, Raag Jadav wrote:
> We never modify abort_sources, mark it as const.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

we meet in a different context :-)

Sorry I have missed this patch. I applied it to i2c/i2c-host. The
second patch was already sent here 21ac0359f72a90.

Thanks,
Andi

