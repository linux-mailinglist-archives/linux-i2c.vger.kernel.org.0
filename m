Return-Path: <linux-i2c+bounces-7931-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D46B79C4921
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 23:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BB5E282F94
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 22:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CACB51AB528;
	Mon, 11 Nov 2024 22:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLBE4hi6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8496C155A30;
	Mon, 11 Nov 2024 22:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731364545; cv=none; b=aQiVT+xD/ifaruLt4BvM9zKzIlmncG0sogUZ2//IxCLImXED7aFTTzJrPRvC4gPH7fAgksa3r9dKdSJYmuflhbouXQHX9V6jtPMNpKE4UVOIXwKRWv51q/rkVlAftQzoeQYBEs5kJ2L6RMutIpRJ6ltkcxQcKgOypl7mq0mrdOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731364545; c=relaxed/simple;
	bh=OiROQ8OajaiChvfF9TM3OiZaG3EaYRH1cqc3shUPO+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcE8nlzYLJ/BdvNZRT50dAhJSTxVgOaVoQtixzX9QRg/C7+r8TZ1bOkW2VwYUFW8HhmGx/F0XuvvPSW1Hy0b6QXePWT6jWiN7cYHH1Yal5VJYP21qabRhNbp8PlCcpcNuQccG3gqvg+rKqf9FWpee1I3sYqCCS8SDKjZZCM0WQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLBE4hi6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D1AC4CECF;
	Mon, 11 Nov 2024 22:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731364545;
	bh=OiROQ8OajaiChvfF9TM3OiZaG3EaYRH1cqc3shUPO+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cLBE4hi6T5kvO+yL88TyCXBz6UE1M07FEkgNcbiijEa+iBv1gjbWSSVilm53zJOpy
	 b+67VlJFM3BLXTMuaXtmmyFEDrNq/fQok/eyLSFSg5tVdGpHkIVMQgOiY6hB8qUfxw
	 4d//MZ+aTt5e4Xse/ejyUKTkGFZkIFIvTlK3QDiw/gJC7gabv0qGGJtmyGWXc69FLd
	 4KRWqj03ANEuGF+Ss/CbORxXgN8vOiLGKKW0e7rdoUCUvfKfy42odXA0Zg+WncI3x4
	 3OshTc4nO6YlOH6LvHLYqW+5sw5aORCvQ2eHfzDTBxw0L63IVJOT4DfMeBN750+vE9
	 R22f2r8WHs1dQ==
Date: Mon, 11 Nov 2024 23:35:40 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Cc: andriy.shevchenko@linux.intel.com, Jean Delvare <jdelvare@suse.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: i2c: piix4: Add ACPI section
Message-ID: <ywqwn4oq2oepbvuvcz2yb57hnmlkp272h3aauj5ngxdwidl3wh@gtgqilruiode>
References: <ZzH-KeSavsPkldLU@smile.fi.intel.com>
 <20241111140231.15198-1-aladyshev22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111140231.15198-1-aladyshev22@gmail.com>

Hi Konstantin,

thanks for your driver, just few grammatical thoughts.

...

> +If it is not the case for your UEFI firmware and you don't have access to the source

Not a grammatical error, but it sounds a bit more linear:

/If it is not/If this is not/

> +code, you can use ACPI SSDT Overlays to provide the missing parts. Just keep in mind
> +that in this case you would need to load your extra SSDT table before the piix4 driver
> +start, i.e. you should provide SSDT via initrd or EFI variable methods and not via

/start/starts/

If you agree, I would go ahead and merge this.

Andi

> +configfs.

