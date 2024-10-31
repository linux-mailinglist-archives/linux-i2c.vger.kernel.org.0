Return-Path: <linux-i2c+bounces-7675-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 797C19B78E9
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 11:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB8E91C20B92
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 10:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B77D19993C;
	Thu, 31 Oct 2024 10:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTpH/fcM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6D5199253;
	Thu, 31 Oct 2024 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730371461; cv=none; b=q2fZym+3KYqa+h4S7SzeQIU7G5NyNI0XqKfMQS5v44CrHi+bx6ND0Q7gipRmJMmtG0skVwPvmQXJ+3Afg3Qw6hQvwCYegf2VrBiD9GUQnC2di8igAjjL1CGRD1cEVwnGKyZ/Pi292j8E5wgsxkZuQmh1asf7bCnLZuv4FNmnSM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730371461; c=relaxed/simple;
	bh=PXk6cWTKdk6GG8UW13yvJkgJ0NwoAADHk8G+YgLul2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IYP8eL9/8iXSAMKiffH9oFH25Bnh2v91Gt8mk7Jv7AaRIQztWEKqWWXrae//qWxStkgoMe0mTdCO8mbkuD3Y4fs8Sfun93bPVdvKyGdYwHQWTcKzFPSp6RkJQP7xhkeDUfqDgBzrdExV8/oYt0zm/kQu9KTWmvqcBWqDTWh9XHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTpH/fcM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E869C4CEC3;
	Thu, 31 Oct 2024 10:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730371460;
	bh=PXk6cWTKdk6GG8UW13yvJkgJ0NwoAADHk8G+YgLul2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HTpH/fcM4llrYoMGlVQIzjkQXg9jdZ1+OfhJQ8mCam1XrY4fDaYMMhdvjeyDkHeXH
	 NtTPXa94wJ0on+nMcQQnF/goJEvsr9pJSrliT5jBYAOBErhXJvcUctrpyMPiIhI2eL
	 wwDng1m+i0dJH6A6DHJF2JGEZ91EBPydh5h7LIvLNJJv5L4B4WQrBlBR5nX59CvkuL
	 WTILgrxOCpD4HHRMlOHxUCSybeX4eVZXJiirWskDA7WKJ+8+iBYjUJNKiL1Cp6Dxsl
	 t4LaV213mR7WMbyiaLBPgMlLMGwI6Dr/+iOapy84SWvN0YGYbOfCTXZwJ2Jf2nA00X
	 qEV/GpSACamXA==
Date: Thu, 31 Oct 2024 11:44:15 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: loic.poulain@linaro.org, rfoss@kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH v2 -next] i2c: qcom-cci: Remove the unused variable
 cci_clk_rate
Message-ID: <rql2u5k3esavdmpdzgo4l4up4ir7yjpdzc3qlmsvjvqalqzvjc@xspprcohlout>
References: <20241029020931.42311-1-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029020931.42311-1-jiapeng.chong@linux.alibaba.com>

Hi Jiapeng,

On Tue, Oct 29, 2024 at 10:09:31AM +0800, Jiapeng Chong wrote:
> Variable ret is not effectively used, so delete it.
> 
> drivers/i2c/busses/i2c-qcom-cci.c:526:16: warning: variable ‘cci_clk_rate’ set but not used.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11532
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

thanks for your patch! Applied to i2c/i2c-host

Thanks,
Andi

