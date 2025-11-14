Return-Path: <linux-i2c+bounces-14085-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE6DC5D63B
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Nov 2025 14:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 03FE63458BC
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Nov 2025 13:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC3331B815;
	Fri, 14 Nov 2025 13:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ctJA5eKg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCB931A7E7;
	Fri, 14 Nov 2025 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127275; cv=none; b=Z0omLTEUNrczcFKs64B+52rz3WmExEyt5gRZQVGQWVFbRi3c/jscUKGXuBuTNRdWpTHe2msTnxC2e1AwynCEZNPycqYIq4h7o9reQupeJ7yqDDfnvaRCIau51d1XYp/rnVz04x1DnbNBfmZnLTpNkQjR4Ne3qD+FBWjV9wQcCFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127275; c=relaxed/simple;
	bh=u0vSP2aT4zROWHCspOlGTqU/6qNRdjRrooM1LlWGfPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ll8RNwvam9bKy8ev/xtPDPPPHyofB3RLwPDO2eqrXLo3IFTCaS743tyuMyAWt9GwPmW+PeOb71tj/QPCt+LtJV+l0envKIKCSunemrZbpMdz66amcxN1pBRblZzM0GOZZV8yEyPwdk2sl++iLtmpGl6MXK+IOTEx8xRMXDKh+Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ctJA5eKg; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763127173;
	bh=4vsQ9a4sfdto53Iz7h22ctWn2ltPYXiwp6/cuN4SgYs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ctJA5eKg+sTiWKxF8cv0uNZVqXCV0xhHzwxpZV6V1hV1qXPCMgj2Hpx69Q+yqLsgt
	 3u4LBqo9a+q6jYaSSZKqHGFj3Z0LT/N+LByoQ0mmrVGkC2B+6qSl6a+m5Z/FhLoDEH
	 Rxcwz0U/CbDSDiBciCB7F3PoNeH2lvwVn6lJAIGs=
X-QQ-mid: esmtpgz15t1763127165t49f36372
X-QQ-Originating-IP: upTtG89dUR6BITyX4XCOKRP3GVJT7+Owo5qsvFsfV5k=
Received: from = ( [112.92.71.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Nov 2025 21:32:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2566697099854471615
EX-QQ-RecipientCnt: 11
Date: Fri, 14 Nov 2025 21:32:44 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2] i2c: spacemit: fix detect issue
Message-ID: <ABF94A5EDD24501D+aRcvfFgny7UqgLZ6@troy-wujie14pro-arch>
References: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
 <5b1fd3ee-474f-48b7-8709-d07000a9a113@rootcommit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b1fd3ee-474f-48b7-8709-d07000a9a113@rootcommit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Myi7noze6Y4xnUZa/0lS8FZRIQVlwhxbYlc0fZSgTrgDyFjAqHKqpKkg
	ddiVENpt4JwzpqO4DF+nwYJq+MUWfOeDctBsnUHtTQu27QtYd0bbkjmVrZqxJ/zxyoEyTJT
	ecRhs0L07JYsaYGGNuEd1zt+0AmPi6LZin7cs9WhmA4wzo0CtPbyc3iRLDKiLlLW+uhqZy0
	THLIjGMOw1usVbqPXVNqMTBFn9dBgQf9MGfpllG+IVkjKKbbeJVURrbujuyszYafpkNdU5V
	ktfRb29zcZZwxzoj/GaK6GRHZ9Vz1fHsWcY0F6pDbOKtPCErhzIiHIQY+/7ANu6M+GU2fRz
	oer/cKbeZBxZIfz7X1OIsblMKpAWD+PO4ZZazP9lHJZdTHOwPkmXjxWtoBw2VO9PcK7p4+G
	PWrIEce0QdeYcOKTxFRd0jvDQq7+MIVugIYWBOlmindL3S8SmRNDpPrjcJ8QLNQwrpuU4DM
	V2riIqrGDxZsE7LSA3PeCW7cqKmaSozE+5rhHDGZDq6MqG0dioKYLf+RbLPqv+lOoEeMS5A
	2dWBMwtzGEeQM/dSZApnAyJ56zUUsTxAB2nr6LqsvTvwderwx5wRofBkrROfA7Gx+0eb33T
	YHmaX7QvtTj55fmeU9ioVV9KoJ2yOvARH4f65cqbzjvbEN+gIdCCZtdSJCRoZyMbFICEDwH
	+heTer339Po86HhGJVB/pJqEc/8wsCh3dsZxlRLy86wOFMeI1YvQG6ZAhx63IvbtvzNy2/9
	gIElw2zp0ZZMcRME9yFe8/giWbU8gYPs2HdmGVnmkNvQgB8O9ZYuHorJtRSw0wI5BOVNl/f
	bH/p3a+zvUMruE5TZMCf2jWL9W+eilRDgV2A8tI176J3thNgsu4o7Cak28KEzEx3nL9GKfl
	e2V5LzrvNa9wdbCrODSfqIUKBgpVxi+8LC9EsZhBXmUPluCENlzTnEdalqnaRadH+eGlzJx
	Lpb7znl2+US2GNPyC6CYSnSdLkCqBhfKDiAuV+bd4l+hE8x163h1NDYEaS8XQXB1z9c2aiy
	YHyBC1HNviFzxHshvMkjG7PvNDL4cvoKsry/gEJsPi4ErCkqzN4M51ro+4CQuUGEohgSh3K
	ihC6c+ugHMlBo4Zy/ymtjwJIxz9BdPPUyxCVT8EAOvN
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

Hi Michael,
On Thu, Nov 13, 2025 at 03:37:32PM +0000, Michael Opdenacker wrote:
> Tested successfully on OrangePi RV2.
Thanks for your test on RV2!

              - Troy
> 
> Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>

> Thanks again
> Michael.
> 
> -- 
> Michael Opdenacker
> Root Commit
> Yocto Project and OpenEmbedded Training course - Learn by doing:
> https://rootcommit.com/training/yocto/
> 
> 

