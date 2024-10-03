Return-Path: <linux-i2c+bounces-7205-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA3F98EEE4
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 14:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89A971F22591
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 12:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6EB4156885;
	Thu,  3 Oct 2024 12:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVOtBbtA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814DA26AD4;
	Thu,  3 Oct 2024 12:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727957803; cv=none; b=lAEvMANPN0ldCyWI+iRlt4xrmooOu5C9a0DS/nEjC6NAmZvea5lkHS8DQQvW6BK6STkatuWHHWs1s8Ra26ZkDO9Z2nmSQQG/icqVPn5GX1O3mdjWAjYJTawZlyGgyhCN7ir+z9VtwlAVr3MlyIyM2SlPRwTYEzyPxflOvRj2WdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727957803; c=relaxed/simple;
	bh=Aese/eIBS0I7NY7YUTmRlTs54LEUgV++awSfuMxhuC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdPoZHA4k0lvrFMWF/aEIXC39z7UGEq+791ZDo43b5ABGqI35Kl77IorbEhEc//J6quVj5hDT9xBkLz6O2Pa44biiEdOqnnE65oZzMT95kw1SR54jUk4ce3LUbpGXy8CU7gJvxayfGPOZXTF+pi4Pec7lTO/uBtDqWWGN2j3rgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVOtBbtA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F4AC4CEC5;
	Thu,  3 Oct 2024 12:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727957803;
	bh=Aese/eIBS0I7NY7YUTmRlTs54LEUgV++awSfuMxhuC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TVOtBbtAkxEnd2BpkcFDgluD2pFJ69aj5gLqTAW2fnY6nre8pm3MM3TnEy9cDHNEY
	 VUGOF3tHs3gQLSz47y+Z4PUnRkPHGyNADRzDMsG2h7oVlGNpkpZCDdBNlAaO/rFSyi
	 hRKp8ttz0iB2v+W/F/T0aedNghvh3Z9WOxQUhKjrZ4L5rccgurf6JD4/RIkOJga/fD
	 lVZLmIf/ceCPsgrj/I0WQW6beRScC5PnkhDX1lyP/BgzXNKBXOSl3QHVu44VCftIxh
	 5D6q8SUmYSyAS+0KbJ/jeADZqMfBJqZR4OiwFZby+miiV7OOy0dZU4bWzquhppljg8
	 aczN1FplpMQEQ==
Date: Thu, 3 Oct 2024 14:16:39 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Robert Richter <rric@kernel.org>
Subject: Re: [PATCH v8 2/2] i2c: octeon: Add block-mode i2c operations
Message-ID: <iprnleek4h3gcky5ckeupk55wme5vb5e3d7nba7sxk7k56smwj@4f37zfh2hcqs>
References: <20240926041203.2850856-1-aryan.srivastava@alliedtelesis.co.nz>
 <20240926041203.2850856-3-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926041203.2850856-3-aryan.srivastava@alliedtelesis.co.nz>

Hi Aryan,

>  drivers/i2c/busses/i2c-octeon-core.c     | 155 ++++++++++++++++++++++-
>  drivers/i2c/busses/i2c-octeon-core.h     |  13 +-
>  drivers/i2c/busses/i2c-thunderx-pcidrv.c |   3 +
>  3 files changed, 164 insertions(+), 7 deletions(-)

I'm having issues at applying this patch, can you please rebase
it on top of the latest i2c/i2c-host[*]?

Thanks,
Andi

[*] git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

