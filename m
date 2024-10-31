Return-Path: <linux-i2c+bounces-7699-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 601899B85DA
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 23:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB8C6B213ED
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 22:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE0C1CC8B7;
	Thu, 31 Oct 2024 22:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IENUavJD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C7D1BF311;
	Thu, 31 Oct 2024 22:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730412156; cv=none; b=up8loMF4VSqzR/8DW1hfvYInL3hLJwTZFKldk9LLoPDFijlv5MV30rMPvI/SmEg3G2UIDUyxkXg/xKdIfpYjZ+hhy46ljcfN8ZIKjkPiegPoOt0LPLcZG0CBXQs9eDF2qUSHIkxr47BOt8hqK+Vf+M7xThKQXkPzznsjPgDfJOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730412156; c=relaxed/simple;
	bh=yXjcnYDbW6cs4JdSdgAFfrjgG8tV2mNpirE2iwKgsek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7D9MyTI3DPJFaRXPEd2tnCzlSvu61xMoUnwXlmvoQ0QUCU2grxZUsF1hF4QA6fm/B1+zJC69G31ikdlqJos6GX3ajcse1NVxP5V5xfyrqYc1+4YJwHS7p5FcP4WhZ6zoOB6oJujundbF0EHisA+MNne7zRvOhmHVaqo+yN2A8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IENUavJD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C85DC4CEC3;
	Thu, 31 Oct 2024 22:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730412155;
	bh=yXjcnYDbW6cs4JdSdgAFfrjgG8tV2mNpirE2iwKgsek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IENUavJDRVR8jJh3bbbtGcaeZmYTWnK1zmSDg7eFKrILcchM6a/aRge7UA8ARykIa
	 us01mCPlojSgPwFL++CusENRuAsuWr6LGTDFegChA/wQGARr7GUsJRoXP6+taeUoEX
	 QYAgsxQszZ/OjFdEj7E8IKTyZzzZt83j5WJOSnBjExj2hhbyj2W9q0zoGDWyzoFJYM
	 QaUfz9xq/7ZNRcRFULJRqmMwQeXEOfM+G9y0+xQGfOAZbdtN+9DmvpPRPbdV9500zX
	 zvGEWFuRXA4xb4WR0iBczT8XmMQ4T9SutEnyd2nZbOjKioOU9HvlKvX6o1AH/movyx
	 3276MU0l8OPYA==
Date: Thu, 31 Oct 2024 23:02:31 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	loic.poulain@linaro.org, rfoss@kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH v3 -next] i2c: qcom-cci: Remove the unused variable
 cci_clk_rate
Message-ID: <ywuvj7wpchcjktc6sxjmiitxv225qzg3cvxt5bwrx5wurabqhj@r23pyeg53z3j>
References: <20241031095339.76535-1-jiapeng.chong@linux.alibaba.com>
 <jt5d3473zg34yhgykgqftlvk6fqekankuyjj57uxl56sqa3xvm@nvfv7kwtcwex>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jt5d3473zg34yhgykgqftlvk6fqekankuyjj57uxl56sqa3xvm@nvfv7kwtcwex>

Hi Dmitry,

On Thu, Oct 31, 2024 at 06:51:13PM +0200, Dmitry Baryshkov wrote:
> On Thu, Oct 31, 2024 at 05:53:39PM +0800, Jiapeng Chong wrote:
> > Variable cci_clk_rate is not effectively used, so delete it.
> > 
> > drivers/i2c/busses/i2c-qcom-cci.c:526:16: warning: variable ‘cci_clk_rate’ set but not used.
> > 
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11532
> > Fixes: 823dfb7bdb21 ("i2c: qcom-cci: Stop complaining about DT set clock rate")
> > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> > ---
> > Changes in v3:
> >   -Modify the commit message.
> 
> Modify how?
> What was the reason for ignoring the R-B tag?

This patch has already been taken and I have added the R-B's as
they were given.

However, Jiapeng, please, next time try to be a bit more specific
with the changelog, consider that people really read it.

Andi

