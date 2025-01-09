Return-Path: <linux-i2c+bounces-9001-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA1EA074E7
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 12:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07BE21882D76
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 11:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E1E216E12;
	Thu,  9 Jan 2025 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h7oFFlSn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D36216E01;
	Thu,  9 Jan 2025 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736422796; cv=none; b=kg5NXyumVaKSpQaKEsiPGECGJS/ApH3/q3W0s+VsNpYlu1ucibD6hiqr0HkBE+l1Bk5gV6ztJlO5LviY1qpGlLRccohRmAMYSi6J1+CbQ3ff7uSPyRR4bRDiNZVGMo1IpawkgtZACMXUIKtQrCVcU6nGc/D7PcfvhyTl2ZPDE+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736422796; c=relaxed/simple;
	bh=sIO6Esic9WvSJaJ/gXwKPf5nuLUVqLVnK8MkdoqX8+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snA4qUBfQgsdzgpneMZlgLRquVkVeJ7nf5auLywwnb24BwaY3+8hPc0AnrgciBtHPORAqc5idFMrpMCQMbNFB/UERUn/7zvIuOqMw2oTp4o7+mEW9omjdabhg1pkEepZqfRvlEF4dEfxkgAXTcqoZWnt+urzEo/Qp+LwT5JJnK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h7oFFlSn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5656AC4CED2;
	Thu,  9 Jan 2025 11:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736422795;
	bh=sIO6Esic9WvSJaJ/gXwKPf5nuLUVqLVnK8MkdoqX8+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7oFFlSnRcruxkwlTkZEAt52k0gLWf3tsjkYMoXDLkBI9JJB0Ap4yyzo4EScNlH1+
	 rBxfFebsBWTpQytZWUVnoti9xR5r5/ZeSauQsfb2gQTaNxzXLPTA6TE9obsyitzxBK
	 jd6wtWJkRoEMS95pboJ1EnMSLqdHRa6GjdqOVhh4=
Date: Thu, 9 Jan 2025 12:39:52 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
	linux-i2c@vger.kernel.org, andi.shyti@kernel.org
Subject: Re: [PATCH 6.6 000/222] 6.6.70-rc1 review
Message-ID: <2025010940-tint-saturate-b4ef@gregkh>
References: <20250106151150.585603565@linuxfoundation.org>
 <CA+G9fYuJA5eUxunLVyws_J6YNuZdyVUjTGGgGyPwFMgCHUpsnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuJA5eUxunLVyws_J6YNuZdyVUjTGGgGyPwFMgCHUpsnA@mail.gmail.com>

On Tue, Jan 07, 2025 at 12:30:26AM +0530, Naresh Kamboju wrote:
> On Mon, 6 Jan 2025 at 20:53, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 6.6.70 release.
> > There are 222 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Wed, 08 Jan 2025 15:11:04 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.70-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
> 
> The following build errors were noticed while building the
> allmodconfig builds on arm64 on the stable-rc linux-6.6.y
> branch.
> 
> This is first seen on 5652330123c6a64b444f3012d9c9013742a872e7.
> GOOD: v6.6.69
> BAD: 5652330123c6a64b444f3012d9c9013742a872e7
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Build error:
> ============
> drivers/i2c/busses/i2c-xgene-slimpro.c:95: error: "PCC_SIGNATURE"
> redefined [-Werror]
>    95 | #define PCC_SIGNATURE                   0x50424300
>       |
> In file included from drivers/i2c/busses/i2c-xgene-slimpro.c:12:
> include/acpi/pcc.h:23: note: this is the location of the previous definition
>    23 | #define PCC_SIGNATURE                   0x50434300
>       |
> cc1: all warnings being treated as errors
> make[6]: *** [scripts/Makefile.build:243: drivers/i2c/busses/i2c-xgene

Thanks, I've applied a patch to fix this up.

greg k-h

