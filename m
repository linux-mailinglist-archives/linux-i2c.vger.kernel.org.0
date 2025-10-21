Return-Path: <linux-i2c+bounces-13714-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD06BF9259
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 00:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 388694244A2
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 22:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01F7225D6;
	Tue, 21 Oct 2025 22:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSoV19Xb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA4522F177;
	Tue, 21 Oct 2025 22:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761087057; cv=none; b=CubmEB4exvJ8CCvNOJn76SPL7C64bh8LoDBQWKeQwBCzeBfKe77wYRO0evaN+JIp2uHDqcA7vXaMpZuewxaJuWLeaRjn63JOFfI0JBpWvxtrslEPUpAgA6jdGgM8kbi6hdrgtlTL9McLN53h/eKNBPgVcqy93X/Kq5O5prqNop8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761087057; c=relaxed/simple;
	bh=Qk7LUUgm4OTA/65R/5eca+jZCmwBOCQ0+YdsSmes8Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxQlfcivGsdbajZ1ZungGf2KJ1T/AwMRFGgY3ur5CTtwV+TbeprWRhviVeN8SQ+hgEjjcmJ3or6zFsayN/PrBx0P7cQsxQ2L5A9FfdgRNzjYwfEqV1eL4VbDb9jV/BWQYQr124z8KfLVrEJKDQbZhmEDtcQLetwdTb7ZWUenNyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSoV19Xb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E158C4CEF1;
	Tue, 21 Oct 2025 22:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761087057;
	bh=Qk7LUUgm4OTA/65R/5eca+jZCmwBOCQ0+YdsSmes8Bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FSoV19XbKe7C8UMx+JY6Pj4jaUyBAFBp8/DerOBulBD4fm1gFoy8DcahXxFQGlet6
	 IRYS11vIuBmB5CsRBqSD949YQbNPklP8BPk2h8A1mQYwdQv/5xOO2UhLS55hDAt+BG
	 UcXdrfcMGgBPK7mFHXDzfH9ELSQgik8/zAObLXNmGIHlXwsqXiHmhMG8Ds4RzLCG/S
	 spO/FKr47vGoEBYQdEMY7FyHCIiA2RsnZQytqDSlwApWUJRi+vxqKIoEBj0MaO2/tf
	 Pofsp1AJAktzC4ySVsD5oTyEdlrGN9ScgTtsK/wEXZhiKXCeabbBk4/F4cqvYu+cNr
	 3IYQ+6YtXo6XA==
Date: Wed, 22 Oct 2025 00:50:52 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Alain Volmat <alain.volmat@foss.st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Pierre-Yves Mordret <pierre-yves.mordret@foss.st.com>, 
	Wolfram Sang <wsa@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Anand Moon <linux.amoon@gmail.com>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] i2c: stm32: Omit two variable reassignments in
 stm32_i2c_dma_request()
Message-ID: <s2whbqys4xwn2ant7ftgixwkguqmvtwbguajdtz7bks7avgk7c@efhaves6wzg2>
References: <f7e0c023-d2d1-40ba-badb-74a7e9c23684@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7e0c023-d2d1-40ba-badb-74a7e9c23684@web.de>

Hi Markus,

> An error code was assigned to a variable and checked accordingly.
> This value was passed to a dev_err_probe() call in an if branch.
> This function is documented in the way that the same value is returned.
> Thus delete two redundant variable reassignments.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

merged to i2c/i2c-host.

Thanks,
Andi

