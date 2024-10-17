Return-Path: <linux-i2c+bounces-7448-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 412F39A1E75
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 11:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 049C6284911
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 09:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D831D8E0F;
	Thu, 17 Oct 2024 09:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wrHOcOFd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20F914E2FD;
	Thu, 17 Oct 2024 09:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157583; cv=none; b=DhI5ewrDaWIx2RH0dDjf5OA0sk4YwakrBsmbqyrm6VdMactlFDe2G2zVRS+ZErJ+zxfxKMA1x9v29N9G7fkKIOFSB5VzGTPV3hHk7J8yTVeiZUWCtcxCftufpC46Qx5yGThw/BJUkNgqpYnS+ubjYnP1+YCAkr8b7yTK93N6kCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157583; c=relaxed/simple;
	bh=D6/Jvo3xqgUbUh/A+cETPsA/qFf9R6GI4grfqu5dVJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQa70lmPXm7l+3z3YAsvhaQ13SV2RV6uLIwJDX+BU6QIa5okG81Bc7Xrn2o+k/LJ9s2ityYYB4UtdJ5LObiAv3CjeTA99e2zlU49wK18k86EGjgUv53NnjY8COAGnQCDo+lWlf8v9H4DB1f27PNo8TkKPv7Nd7lli8rbl5Hv/Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wrHOcOFd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE90EC4CEC3;
	Thu, 17 Oct 2024 09:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729157582;
	bh=D6/Jvo3xqgUbUh/A+cETPsA/qFf9R6GI4grfqu5dVJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wrHOcOFd1aAJ6t66tLGavzqOI+l+gFcoEWQEHNBeqx80GuHXLuj1VTeHJmwistmqJ
	 e3HYagSnZR7FwSiJqxzup7thIbj6pghiu2Yj4Ldc6e1pMqn4MMhK4yVwNJUUXpWjw5
	 AlTnBp697MjES/YCUTvRFtEowSOHUM3ojO+mGQaE=
Date: Thu, 17 Oct 2024 11:32:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, allen.lkml@gmail.com, broonie@kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	clang-built-linux <llvm@lists.linux.dev>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH 5.10 000/518] 5.10.227-rc1 review
Message-ID: <2024101747-undivided-uselessly-0d44@gregkh>
References: <20241015123916.821186887@linuxfoundation.org>
 <CA+G9fYuZun789CY2rZ6WqxzdFswDYCf_fMpT9d-4M0bzJfJrhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuZun789CY2rZ6WqxzdFswDYCf_fMpT9d-4M0bzJfJrhw@mail.gmail.com>

On Tue, Oct 15, 2024 at 07:22:46PM +0530, Naresh Kamboju wrote:
> On Tue, 15 Oct 2024 at 18:25, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 5.10.227 release.
> > There are 518 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Thu, 17 Oct 2024 12:37:45 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.227-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
> 
> A larger set of clang-19 builds failed on arm, i386 and x86 due to
> following stable-rc linux-5.10.y.
> 
> And gcc-13 and gcc-12 builds passed.
> 
> List of build regressions,
> * arm, build
>   - clang-19-at91_dt_defconfig
>   - clang-19-axm55xx_defconfig
>   - clang-19-bcm2835_defconfig
>   - clang-19-clps711x_defconfig
>   - clang-19-davinci_all_defconfig
>   - clang-19-defconfig
> ...
> 
> * x86_64, build
>   - clang-19-lkftconfig
>   - clang-19-lkftconfig-kcsan
>   - clang-19-lkftconfig-no-kselftest-frag
>   - clang-19-x86_64_defconfig
>   - clang-nightly-lkftconfig-kselftest
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> The bisect points to,
>   da1084f5722a9a46bdcadc09429dc4b56ac31de4
>   i2c: Add i2c_get_match_data()
>     [ Upstream commit 564d73c4d9201526bd976b9379d2aaf1a7133e84 ]

Thanks, commit aade55c86033 ("device property: Add const qualifier to
device_get_match_data() parameter") was missing, I've queued that up
now.

greg k-h

