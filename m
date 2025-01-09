Return-Path: <linux-i2c+bounces-9013-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EF4A07C9A
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 16:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 125773A5F41
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 15:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42D821D5BC;
	Thu,  9 Jan 2025 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgGOJPJX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6653921D018;
	Thu,  9 Jan 2025 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736438184; cv=none; b=hI3q3W5rMg+ZDg5jpu1Iu3ym69tA+ssUGUHKiudOnOF6xJMQZb3dDuEPhrP2XhQxjs7y+3kyzxgj6SQLm/u2hqIRqdvtegSVF558sOrtnCCkNhf/tF9UbrI0DkPf6BD0m82v85SQuseFO90TWAzlTgR2BypKXctwnkVd/CUjZsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736438184; c=relaxed/simple;
	bh=utdIDefy1eeryFyCIpTgVzjeCxetcAOMBUyNyvMHvfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWwPEfG0RO5Yt5oJna9cLP4kto+SuXxQ+Nd1Ns+04UgNwRFLft6xbZRYPCfhLNMIoL6zsTU/GJIfid86ht6pfA95zC62zpEJg0MDFbPKKaw2acqoFARyEylHPWyz3XaPpIa5h69XjtPiVGjKLLidH5PzTJ+D2Ew93iY9O+oWdvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgGOJPJX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75445C4CED2;
	Thu,  9 Jan 2025 15:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736438183;
	bh=utdIDefy1eeryFyCIpTgVzjeCxetcAOMBUyNyvMHvfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KgGOJPJXpE5NSblF7bhtECtn+TAWwmNuVhfTbZo3T7ax7K60frS9LXzQbyqBoq/G/
	 bTdrFKYdKtiYXxkMcpLvG/cK4Q8TZwlNhRh2/esaIWZ1pF6+4b086biqbdk4lwyAbl
	 aIgaRl//uoPmIcSKvfL29weqHKCWUbFrvLSP5yrGOR7BbbdbQnsFVvVzXXJZYOFlrA
	 5VUsbznerG/4esNyhgW9O4uGou1BYYW6cCpEA4tsOjh075Zv/0t0k+LeZXzTR18C5g
	 lBRkJzm+2yYGmTuugn1r0T6vwITwwvLhyfAOJGuDGp1jU2/nPz7Dff2t6se8iBx3ql
	 2OcgPp2u2YbbA==
Date: Thu, 9 Jan 2025 16:56:19 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Chris Babroski <cbabroski@nvidia.com>
Cc: kblaiech@nvidia.com, asmaa@nvidia.com, davthompson@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c-mlxbf: Add repeated start condition support
Message-ID: <xmm226aebgwmpjzekxlvhcgstzss4uq42vpj3zjp23ffhv76ma@y7hqbw5a56md>
References: <20241119211215.352797-1-cbabroski@nvidia.com>
 <db3daq7guy52ywmgslnmphx4mxyp2l7swq2y6erezokolg3v6u@p7ufvbi3tarc>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db3daq7guy52ywmgslnmphx4mxyp2l7swq2y6erezokolg3v6u@p7ufvbi3tarc>

> Can I have an ack from the other nvidia guys, please? Khalil and
> Asmaa?

I know that they have been reviewing this offline, but I need
this to happen in the list.

Thanks,
Andi

