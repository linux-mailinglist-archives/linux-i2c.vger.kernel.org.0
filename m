Return-Path: <linux-i2c+bounces-4018-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67167907F81
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 01:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DCA2285C88
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 23:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A709014F10C;
	Thu, 13 Jun 2024 23:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9CDmXSR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E6714BF91
	for <linux-i2c@vger.kernel.org>; Thu, 13 Jun 2024 23:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718321543; cv=none; b=TV8ILBbz6dsxI8UFaqqP8pxEHKosgfpiB4JoU0jvYgPwwpmKsEAxYrIe+bzaVcv7X7+yJOdGnAjywv7I/FHhpwLOqn+n0Vn7IQVla0xH8k5LNKDZ08egTSdhhGDvkFnkCcHEnCfcWkaG267ezDOHbP5LOQWme5FOQlvL4GU13Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718321543; c=relaxed/simple;
	bh=0Onj19PLPVobqMcJVk4krIkO3ouKQTxRU1vlKHMq0MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QROGhukBxXMz3i81aK7UjjwGYRhJ5K4pMaWhI2rJrnL0O9+5Db1M/U6JzeqU4LgLruWy+plaIqlM/d3BiPpg9QcvDcATcH8/lFctppg0wPWG3Ewy6usIbXfmwKEcA/u/wXVUMB3W0UDpPwrctqlf6QbJ3PMlfUKVskprv9X0rFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9CDmXSR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67970C4AF1D;
	Thu, 13 Jun 2024 23:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718321543;
	bh=0Onj19PLPVobqMcJVk4krIkO3ouKQTxRU1vlKHMq0MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a9CDmXSRnrPBK8j7Pp0W++bJCmA4MFJoa3GHZvAzoGtPe5xx3d+NaLw9sxfK7NTZW
	 /931hkZLsM0rS5OjY17KEehUb/MULzPelHs+k84eesV9o3rmcx4pz7CtiyCUMSuTNi
	 oGH7jJ/ukl04ynV/8zi5WYtU3Ptb7xhT9xP0QmXxsWZchC1MvlNeqhVxQWfpqnHi0u
	 Z/DC++m7T4I2Pa9nNywejYIcW3NONeICySXM0FbTNt99FJXuTC2WmzpsIvnPwsRK4e
	 gQ31YHD9nYKvHhMFc2NM9HP0xpLEgTwx97dhkm7qj1HDL6i5ZQfuNlrKzqYNXFLJS8
	 DZfuQfIJ5kOjw==
Date: Fri, 14 Jun 2024 00:32:19 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c@vger.kernel.org, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] i2c: i801: Add support for Intel Arrow Lake-H
Message-ID: <igsvcr7jkuwmpkqyy3q7xnpmjnmpki3x36mocfnxmzeud5kqcv@2rey6tdcvutr>
References: <20240610101801.453785-1-jarkko.nikula@linux.intel.com>
 <171823282436.404205.16601835343853795493.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171823282436.404205.16601835343853795493.b4-ty@kernel.org>

Moi Jarkko,

On Thu, Jun 13, 2024 at 12:53:44AM GMT, Andi Shyti wrote:
> On Mon, 10 Jun 2024 13:18:01 +0300, Jarkko Nikula wrote:
> > Add SMBus PCI ID on Intel Arrow Lake-H.
> > 
> > 
> 
> Applied to i2c/i2c-host-next on
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/local tree

sorry, but b4 ty messes it up if you are not in the right branch.

The patch has been pushed in my branch in i2c/i2c-host.

Andi

> Thank you,
> Andi
> 
> Patches applied
> ===============
> [1/1] i2c: i801: Add support for Intel Arrow Lake-H
>       commit: be0c4627af021026190c61440f729a2b67f7c785
> 

